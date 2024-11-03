import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue.shade100,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/calc.png', height: 200),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen()),
                );
              },
              child: Text('Iniciar Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  int? _selectedIndex;
  bool _isAnswerCorrect = false;
  String? _hintMessage;
  // ignore: unused_field
  int _answeredQuestionsCount = 0;

  List<Map<String, dynamic>> _questions = [
    {
      'question': 'Qual era o nome do filho de Abraão que quase foi sacrificado no monte Moriá?',
      'answers': ['Isaac', 'Jacó', 'Esaú', 'Rome'],
      'correctIndex': 0,
      'hint': 'Ele é considerado um dos três patriarcas de Israel.'
    },
    {
      'question': 'Quem foi o profeta que enfrentou os profetas de Baal no monte Carmelo?',
      'answers': ['Elias', 'Ezequiel', 'Isaías', 'Jeremias'],
      'correctIndex': 0,
      'hint': 'Ele foi levado aos céus em uma carruagem de fogo.'
    },
     {
      'question': 'Qual animal falou com Balaão na Bíblia?',
      'answers': ['Jumenta', 'Cavalo', 'Cabra', 'Fitzgerald'],
      'correctIndex': 0,
      'hint': 'Esse animal é conhecido por sua teimosia.'
    },
    {
      'question': 'Qual discípulo de Jesus negou conhecer Jesus três vezes antes do galo cantar?',
      'answers': ['Judas', 'João', 'Tiago', 'Pedro'],
      'correctIndex': 3,
      'hint': 'Ele é também conhecido como Simão.'
    },
    {
      'question': 'Qual é o menor livro do Novo Testamento?',
      'answers': ['1 João', 'Filemom', 'Judas', 'Pedro'],
      'correctIndex': 1,
      'hint': 'Este livro é uma carta a um homem chamado Filemom.'
    },
    {
      'question': 'Quem escreveu o Livro de Ester?',
      'answers': ['Moisés', 'Judas', 'Filemom', 'Pedro'],
      'correctIndex': 1,
      'hint': 'Este livro é o único da Bíblia que não menciona Deus.'
    },
    {
      'question': 'Quem foi o sumo sacerdote que interrogou Jesus antes de sua crucificação?',
      'answers': ['Anás', 'Herodes', 'Pilatos', 'Caifás'],
      'correctIndex': 3,
      'hint': 'Seu nome é frequentemente mencionado junto com o de Anás.'
    },
    {
      'question': 'Qual foi o primeiro milagre de Jesus, de acordo com o Evangelho de João?',
      'answers': ['Transformação da água em vinho', 'Cura do cego de nascença', 'Alimentação dos cinco mil', 'Ressurreição de Lázaro'],
      'correctIndex': 0,
      'hint': 'Esse milagre ocorreu em uma festa de casamento.'
    },
    {
      'question': 'Qual dos seguintes não foi um dos doze apóstolos de Jesus?',
      'answers': ['Pedro', 'Mateus', 'Tiago, filho de Alfeu', 'Bartolomeu'],
      'correctIndex': 3,
      'hint': 'Este nome não é tradicionalmente associado aos apóstolos.'
    },
    {
      'question': 'Quantas pragas foram enviadas ao Egito antes que o faraó deixasse os israelitas partirem?',
      'answers': ['Sete', 'Doze', 'Dez', 'Treze'],
      'correctIndex': 2,
      'hint': 'Esse número é frequentemente associado a um conjunto completo.'
    },
    {
      'question': 'Qual dos seguintes não foi um dos filhos de Jacó?',
      'answers': ['Ismael', 'Rubem', 'Efraim', 'Naftali'],
      'correctIndex': 0,
      'hint': 'Este nome está mais associado ao irmão de Isaque.'
    },
    {
      'question': 'Qual era o nome do profeta que Deus mandou a Nínive?',
      'answers': ['Calebe', 'Gideão', 'Jonas', 'Sansão'],
      'correctIndex': 2,
      'hint': 'Ele é conhecido por sua hesitação e a história de um grande peixe.'
    },
    {
      'question': 'Quem foi o primeiro discípulo a ser chamado por Jesus?',
      'answers': ['João', 'Tiago', 'Pedro', 'André'],
      'correctIndex': 2,
      'hint': 'Ele é o irmão de andre.'
    },
    {
      'question': 'Quem foi o profeta que teve uma visão dos serafins no templo?',
      'answers': ['Ezequiel', 'Daniel', 'Isaías', 'Jeremias'],
      'correctIndex': 2,
      'hint': 'Seu nome começa com "I" e ele tem um livro no Antigo Testamento.'
    },
    {
      'question': 'Quem foi o rei que deu um grande banquete para toda a população de Susã?',
      'answers': ['Ciro', 'Assuero', 'Nabucodonosor', 'Artaxerxes'],
      'correctIndex': 1,
      'hint': 'Ele também é conhecido como Xerxes.'
    },
    {
      'question': 'Quem foi o profeta que falou que não sabe para onde vos e como saber o caminho?',
      'answers': ['felipe', 'Judas', 'Tome', 'João'],
      'correctIndex': 2,
      'hint': 'Este seguidor de Jesus ficou famoso por duvidar da ressurreição de Cristo até ver com seus próprios olhos. Ele perguntou a Jesus como poderiam saber o caminho para onde Ele ia.'
    },

   {
      'question': 'Quem é consolador relatado na biblia',
      'answers': ['Jesus', 'Espirito santo', 'Tome', 'Deus'],
      'correctIndex': 1,
      'hint': 'Segundo o Evangelho de João, este é o nome dado ao Espírito Santo, prometido por Jesus para guiar, ensinar e consolar os seus discípulos após sua partida.'
    },
     {
      'question': 'Quem é  o autor do livro de apocalipse',
      'answers': ['Jesus', 'João ', 'Paulo', 'Matheus'],
      'correctIndex': 0,
      
    },

     {
      'question': 'Quem foi o ultimo apostolo?',
      'answers': ['João', 'Paulo', 'Tome', 'José'],
      'correctIndex': 0,
      'hint': 'um dos doze apóstolos de Jesus, escreveu o quarto Evangelho, três epístolas e o livro do Apocalipse. Ele também é conhecido como “o discípulo que Jesus amava'
    },

      {
      'question': 'Existem quantas cartas em apocalipse?',
      'answers': ['14 cartas', '7 cartas', '4 cartas', '8 cartas'],
      'correctIndex': 1,
      'hint': 'Neste livro do Novo Testamento, encontramos sete cartas dirigidas a diferentes igrejas na Ásia Menor, com mensagens específicas de Jesus Cristo para cada uma delas.'
    },

      {
      'question': 'Quem  é videira verdadeira',
      'answers': ['João', 'Pedro', 'Deus', 'Jesus'],
      'correctIndex': 3,
      'hint': 'Neste livro do Novo Testamento, encontramos sete cartas dirigidas a diferentes igrejas na Ásia Menor, com mensagens específicas de Jesus Cristo para cada uma delas.'
    },
      {
      'question': 'Qual foi o alerta que o senhor jesus deixou para os recem convertidos em joão 14',
      'answers': ['aquele que me odeia, odeia o pai', 'Nenhum discipulo terá pecado', 'fara pecado em nome de jesus', 'se o mundo vos odeia,tambem odiou a jesus e ao pai'],
      'correctIndex': 3,
      'hint': '"No Evangelho de João, Jesus alerta seus seguidores sobre o ódio que poderão enfrentar do mundo por causa dele, encorajando-os a permanecerem firmes na fé e no testemunho.'
    },

   {
      'question': 'Quem viu descer do ceu um vaso como se fose um lençol cheio de animais?',
      'answers': ['João', 'Pedro', 'Lucas', 'Paulo'],
      'correctIndex': 1,
      'hint': 'um dos discípulos teve uma visão de um lençol descendo do céu cheio de animais, o que o levou a entender que o Evangelho deveria ser pregado não apenas aos judeus, mas também aos gentios.'
    },
   
      {
      'question': 'Quem viu jesus pela 1 vez apos sua morte?',
      'answers': ['Maria sua mae', 'Maria de betania', 'Maria madalena', 'Paulo'],
      'correctIndex': 2,
      'hint': 'No Evangelho de João, esta seguidora fiel foi a primeira a testemunhar Jesus após sua ressurreição, encontrando-o inicialmente no jardim onde seu túmulo estava localizado.'
    },
        {
      'question': 'Qual é  o profeta que falou de meninas e do meninos bricando nas ruas',
      'answers': ['Zacarias', 'Davi', 'Ezequiel', 'Naum'],
      'correctIndex': 0,
      'hint': 'Neste livro profético do Antigo Testamento, há uma visão de Zacarias que descreve um futuro de alegria e vida restaurada em Jerusalém, com meninos e meninas brincando nas ruas.'
    },
    
       {
      'question': 'Qual dos anjos é mencionada pelo nome no novo testamento',
      'answers': ['Rafael', 'Gamaliel', 'Hilel', 'Gabriel'],
      'correctIndex': 3,
      'hint': 'Este anjo é conhecido por suas visitas importantes a Zacarias e Maria, anunciando nascimentos significativos no contexto bíblico.'
    },

    {
      'question': 'segundo a bibilia oquer dizer (Raboni)',
      'answers': ['Mestre', 'Sacerdote', 'pai', 'Deus'],
      'correctIndex': 0,
      'hint': 'Este anjo é conhecido por suas visitas importantes a Zacarias e Maria, anunciando nascimentos significativos no contexto bíblico.'
    },
     {
      'question': 'qual o profeta que  descreve o edem como jardim de deus',
      'answers': ['Oseias', 'Joel', 'Ezequiel', 'Habacuque'],
      'correctIndex': 2,
      'hint': 'Neste livro profético do Antigo Testamento, há uma referência poética ao Éden como o jardim de Deus, destacando sua importância como um lugar de beleza e perfeição inicial.'
    },
      {
      'question': 'quem  quase provocou  o massacre de uma  nação por se recusar a fazer a saudação?',
      'answers': ['Davi', 'Mardoqueu', 'Naamâ', 'Ageu'],
      'correctIndex': 1,
      'hint': 'Ele se recusou a se curvar diante de Haman, o que quase resultou no massacre dos judeus. Sua coragem e a ajuda de sua prima rainha levaram à salvação de seu povo no império persa.'
    },
    {
      'question': 'qual foi o rei judeu que foi ferido de lepra',
      'answers': ['Abraao', 'Nabucodonozor', 'Naamâ', 'Uzias'],
      'correctIndex': 3,
      'hint': 'Este rei de Judá foi atingido por lepra depois de tentar queimar incenso no templo, um ato que era permitido apenas aos sacerdotes.'
    },
       {
      'question': 'Das pessoas que sairam do egito quantas entraram na terra prometida',
      'answers': ['3 pessoas', '2 pessoas', '1.000 pessoas', '100 pessoas'],
      'correctIndex': 1,
      'hint': 'homens que trouxeram um relatório positivo após espiar a Terra Prometida foram autorizados a entrar nela'
    },

    
    {
      'question': 'quem construiu  a arca do concerto',
      'answers': ['Araao', 'Moises', 'Bezaleel', 'tubal caim'],
      'correctIndex': 2,
      'hint': 'Este artesão foi escolhido por Deus para liderar a construção da Arca da Aliança, um dos artefatos sagrados mais importantes do tabernáculo.'
    },
     {
      'question': 'quem pediu o corpo de jesus apos sua morte',
      'answers': ['pilatos', 'Herodes', 'Nicodemos', 'José de arimateia'],
      'correctIndex': 3,
      'hint': 'Este homem, membro do Sinédrio e discípulo secreto de Jesus, solicitou a permissão de Pilatos para enterrar o corpo de Jesus após sua crucificação.'
    },
      {
      'question': 'Qual o Homem que interpretou o sonho do faraó',
      'answers': ['Josue', 'Jó', 'José', 'Judas'],
      'correctIndex': 2,
      'hint': 'Este homem hebreu, filho de Jacó, interpretou os sonhos do faraó, prevendo sete anos de fartura seguidos por sete anos de fome no Egito antigo.'
    },
      {
      'question': 'Quantos discipulos jesus convocou',
      'answers': ['10 discipulos', '11 discipulos', '12 discipulos', '9 discipulos'],
      'correctIndex': 2,
      'hint': 'Esse número é frequentemente associado aos apóstolos que seguiram Jesus.'
    },

      {
      'question': 'Quantas virgens eram prudentes?',
      'answers': ['10 virgens', '11 virgens', '7 virgens', '9 virgens'],
      'correctIndex': 2,
      'hint': 'Esse número é frequentemente associado as virgens '
    },
     {
      'question': 'Por quem Sansão foi traido',
      'answers': ['Raquel', 'Nubia', 'Dalila', 'Abe'],
      'correctIndex': 2,
      'hint': 'Ela é uma personagem bíblica conhecida por cortar o cabelo de Sansão, tirando sua força. '
    },

    {
      'question': 'Quem era o  personagem envolto em um lençol sobre o corpo nu no dia da prisão de jesus',
      'answers': ['um velho', 'um jovem', 'uma jovem', 'Abe'],
      'correctIndex': 2,
      'hint': 'Ela é uma personagem bíblica conhecida por cortar o cabelo de Sansão, tirando sua força. '
    },

      {
      'question': 'Quanto tempo viveu Sara?',
      'answers': ['100 anos', '101 anos', '135 anos', '127 anos'],
      'correctIndex': 3,
      'hint': 'Ela viveu um pouco menos de 130 anos.'
    },

      {
      'question': 'Quantos anjos apareceram a Abraaõ e a Sara dizendo-lhes que eles haveriam de ter um filho',
      'answers': ['03 anjos', '02 anjos', '04 anjos', '01 anjos'],
      'correctIndex': 0,
      'hint': 'Esses anjos apareceram a Abraão e Sara antes do nascimento de Isaque. Eles anunciaram algo especial relacionado à sua descendência.'
    },
      {
      'question': 'Qual seria o primeiro nome dado a Benjamin',
      'answers': ['Benoa', 'Bonearges', 'Bononi', 'Barnabe'],
      'correctIndex': 2,
      'hint': 'O primeiro nome dado a Benjamin está relacionado a um significado especial que pode estar ligado à sua história familiar.'
    },
     {
      'question': 'Ana pediu a Deus um filho Qual foi o nome dele?',
      'answers': ['Samá', 'Samuel', 'Simeão', 'Davi'],
      'correctIndex': 2,
      'hint': 'O nome do filho de Ana tem uma conexão com a ideia de ser ouvido por Deus, refletindo a resposta à sua oração.'
    },
      {
      'question': 'Quanto tempo esteve o diluvio Sobre a terra?',
      'answers': ['50 dias', '10 dias', '100 dias', '40 dias'],
      'correctIndex': 3,
      'hint': 'O dilúvio durou um período específico que é mencionado em várias narrativas históricas religiosas. Este período é significativo na história bíblica como um evento de grande impacto.'
    },
       {
      'question': 'Qual o nome do avô de Davi?',
      'answers': ['Naum', 'jessé', 'Obede', 'Saul'],
      'correctIndex': 2,
      'hint': 'O avô de Davi é conhecido por ser uma figura importante na genealogia do rei Davi, e seu nome está ligado a um significado de servidão ou serviço.'
    },
      {
      'question': 'Qual foi o jardim que jesus esmagou a cabeça da serpente?',
      'answers': ['Edem', ' Jardim do Getsêmani.', 'jarico', 'pico  tupi'],
      'correctIndex': 1,
      'hint': 'Esse evento ocorreu pouco antes da prisão de Jesus, em um local onde Ele costumava orar com seus discípulos.'
    },
     {
      'question': 'Qual o nome das parteiras  que salvaram os recem nascidos no egito',
      'answers': ['Sifrá e pauá', ' Naftali e Aser', 'Midiá e Zipora', 'Gerson e Iza'],
      'correctIndex': 0,
      'hint': 'Essas corajosas mulheres desafiaram as ordens do faraó para salvar os bebês hebreus. Seus nomes são mencionados no início do livro do Êxodo'
    },
     {
      'question': 'Que povo foi recriminado pelo profeta isaias por consultar astrologos',
      'answers': ['assiria', ' egito', 'mooabe', 'babilonia'],
      'correctIndex': 3,
      'hint': 'era conhecido por ter uma forte tradição em práticas mágicas e adivinhatórias. Essa civilização antiga é famosa por seus jardins suspensos e pelo seu papel dominante na Mesopotâmia.'
    },
     {
      'question': 'Quem foi condenado a morte por fazer sua oração?',
      'answers': ['Daniel', ' Oseias', 'mooabe', 'babilonia'],
      'correctIndex': 0,
      'hint': 'Esse personagem bíblico foi condenado à morte por continuar a orar ao seu Deus, desafiando um decreto real. Ele é famoso por sua fé inabalável e por ter sido lançado na cova dos leões'
    },
    {
      'question': 'Qual deste é  o da biblia que tem apenas 1 capitulo',
      'answers': ['Matheus ', ' Judas', 'Ester ', 'Amos'],
      'correctIndex': 1,
      'hint': 'é conhecido por suas instruções para permanecer firme na fé e alertar sobre falsos mestres. O nome dele também é o mesmo de um dos apóstolos de Jesus'
    },
      {
      'question': 'Qual o nome do rio cujo as aguas estão cheias de sangu segundo profeta isais?',
      'answers': ['Pisom ', ' eufrates', 'Diomon ', 'querite'],
      'correctIndex': 2,
      'hint': 'em um nome que pode soar um pouco incomum. Este rio é conhecido por seu papel simbólico em visões de destruição e julgamento na Bíblia.'
    },
     {
      'question': 'em qual salmo lemos a respeito do gelo',
      'answers': ['salmo 200 ', ' salmo 54', 'salmo 100 ', 'salmo 147'],
      'correctIndex': 3,
      'hint': 'Este salmo fala sobre como Deus controla a natureza e descreve a criação de gelo. É um salmo que celebra o poder e a majestade de Deus. O número deste salmo é próximo do final da coletânea dos Salmos.'
    },
    {
      'question': 'qual o profetada da escritura  que fala da palestina  como terra santa?',
      'answers': ['Zacarias ', ' isaias ', 'Naum ', 'Malaquias'],
      'correctIndex': 0,
      'hint': 'Este profeta da Escritura, que é um dos livros menores dos profetas, menciona a Palestina e faz referência à terra como sendo especial e separada para Deus. Seu nome é semelhante ao de um dos personagens principais do livro que leva o mesmo nome, conhecido por ter visões de temas apocalípticos e messiânicos'
    },
      {
      'question': 'qual o nome rei do sidonios',
      'answers': ['Lameque', ' ezbaal ', 'Jubal ', 'Nabal'],
      'correctIndex': 1,
      'hint': 'Este rei dos sidônios tem um nome que é frequentemente associado a um governante local no contexto bíblico. Seu nome começa com "E" e é conhecido por sua posição como rei na antiga cidade de Sidon, uma importante cidade fenícia. '
    },
      {
      'question': 'existem quantos capitulos de romanos',
      'answers': ['14 capitulos', ' 15 capitulos ', '13 capitulos ', '16 capitulos'],
      'correctIndex': 3,
      'hint': 'A Epístola aos Romanos, escrita por Paulo, é uma das cartas mais longas do Novo Testamento. O número total de capítulos dessa epístola é o mesmo que o número de livros no Novo Testamento menos quatro. '
    },
      {
      'question': 'oque a pessoa tem que fazer para ter uma fé sobrenatural',
      'answers': ['ouvir /prestar atençao/ ter comunhão', ' desulmide/não patricar/ desobediente ', 'ouvir erronia/atenção zero/imprudente ', 'Ceticismo/ razão/ empirismo'],
      'correctIndex': 0,
      'hint': 'A resposta correta envolve práticas que ajudam a fortalecer a crença e a conexão com o espiritual ou o divino. Pense em ações que aproximam a pessoa de uma experiência religiosa ou espiritual significativa '
    },

      {
      'question': 'oque os hipocritas fazem na sinagogas e nas  ruas?',
      'answers': ['não tende garladão', ' dar esmolas  e tocar trombentas para ti ', 'entra nos aposentos ', 'parecer que jejuam'],
      'correctIndex': 1,
      'hint': 'efere-se a ações realizadas para chamar a atenção dos outros e mostrar uma aparência de piedade, mais do que para realmente ajudar ou se dedicar. Pense em como alguém pode tentar impressionar os outros com gestos ou demonstrações públicas. '
    },
     {
      'question': 'Onde foi a aparição do senhor jesus aos outros discipulos apois a ressureição ?',
      'answers': ['mar caspio', 'mar tiberidias ','mar da galileia ',  'camiho para emaús'],
      'correctIndex': 2,
      'hint': 'Refere-se a ações realizadas para chamar a atenção dos outros e mostrar uma aparência de piedade, mais do que para realmente ajudar ou se dedicar. Pense em como alguém pode tentar impressionar os outros com gestos ou demonstrações públicas. '
    },
      {
      'question': 'quem escreveu o livro de atos?',
      'answers': ['josé', 'matheus','judas ',  'lucas'],
      'correctIndex': 3,
      'hint': 'O autor do livro de Atos também escreveu um dos Evangelhos e era conhecido por ser um médico e companheiro de viagem do apóstolo Paulo. Pense em quem pode ter uma dupla autoria no Novo Testamento. '
    },
      {
      'question': 'Qual o nome do lugar que pilatos se sentou no tribunal ao julgar jesus',
      'answers': ['litostrotos', 'gabata','gogota',  'caveira'],
      'correctIndex': 0,
      'hint': 'O nome do lugar onde Pilatos se sentou no tribunal é um termo que pode ser traduzido como "pavimento" ou "lugar de pedras". É um termo específico usado para descrever a superfície onde ele fez o julgamento de Jesus. Pense em uma palavra que sugira um tipo de chão ou pavimento no contexto de um tribunal.'
    },
     {
      'question': 'Quais fora os quatro jovens que se tornaram ainda mais fortes apesar da dieta de vegetais',
      'answers': ['Moies,Josue,levi e jeu', 'Daniel,Hananjas,Misaele Azarias','Paulo,Pedro tiago e joao',  'Pedro,Tiago,Joao e tome'],
      'correctIndex': 1,
      'hint': 'Esses quatro jovens são conhecidos por sua história na Bíblia, especificamente no Antigo Testamento. Eles se destacaram por sua fé e por manterem uma dieta de vegetais em vez dos alimentos do rei. Eles são frequentemente associados à história de um rei babilônico e a um período em que foram desafiados a se destacar entre outros jovens.'
    },
       {
      'question': 'De onde surgiramas ervas verdes,os vegetais e as plantas frutiferas',
      'answers': ['Ceu', 'Rios','terra',  'Argila'],
      'correctIndex': 2,
      'hint': 'Na Bíblia, a criação das ervas verdes, vegetais e plantas frutíferas está associada ao ato de Deus criar o mundo. A descrição desses elementos sendo criados ocorre em um contexto específico que envolve o ambiente onde essas plantas crescem naturalmente. '
    },
     {
      'question': 'quantos capiulos tem o livro do profeto joel',
      'answers': [' um capitulos', 'dois capitulos','Cinco capitulos',  'Tres capitulos'],
      'correctIndex': 3,
      'hint': 'O livro do profeta Joel é um dos livros menores do Antigo Testamento e é conhecido por sua mensagem sobre o dia do Senhor e a restauração. O número de capítulos é relativamente pequeno, especialmente quando comparado com outros livros proféticos.Pense em quantos capítulos pequenos e concisos um livro profético pode ter! '
    },
       {
      'question': 'qual o nome do gigante que davi matou',
      'answers': [' Golias', 'sadraque','Simei',  'Abisai'],
      'correctIndex': 0,
      'hint': 'O gigante que Davi derrotou é uma figura muito conhecida da Bíblia e sua história é frequentemente associada a uma batalha épica entre um jovem pastor e um guerreiro imenso. Seu nome começa com a letra "G" e ele era um dos filisteus que desafiava o exército de Israel. '
    },
       {
      'question': 'qual é a unica pessoa que a biblia diz que subiuem uma arvore',
      'answers': [' judas', 'Zaqueu','Natanael',  'Elias'],
      'correctIndex': 1,
      'hint': 'A pessoa mencionada na Bíblia que subiu em uma árvore é conhecida por querer ver Jesus enquanto Ele passava pela cidade. Esse episódio é famoso e ocorre em um contexto onde essa pessoa é descrita como um coletor de impostos. O nome dessa pessoa começa com a letra "Z '
    },
        {
      'question': 'qual é a  materia primaria usada na formação do homen?',
      'answers': [' Carne', 'Osso','pó da terra',  'Água'],
      'correctIndex': 2,
      'hint': 'Na Bíblia, a matéria-prima usada na criação do homem é descrita como algo que vem do solo. Esta descrição enfatiza a conexão entre a humanidade e a terra. '
    },
    {
      'question': 'quem escreveu a carta aos  colossenses?',
      'answers': [' Pedro', 'Thiago','lucas','Paulo'  ],
      'correctIndex': 3,
      'hint': 'O autor da carta aos Colossenses é um dos apóstolos mais conhecidos do Novo Testamento, e ele também escreveu várias outras cartas que fazem parte do Novo Testamento. Ele foi um importante missionário e evangelista que frequentemente se referia a si mesmo como "apóstolo dos gentios. '
    },
     {
      'question': ' Qual o dia santo para os judeus',
      'answers': [' Sábado', 'Domingo','Segunda','Terça'  ],
      'correctIndex': 0,
      'hint': 'O dia santo para os judeus é conhecido por ser o dia de descanso e adoração, que começa ao pôr do sol na sexta-feira e vai até o pôr do sol no sábado. Esse dia é fundamental na tradição judaica e é marcado por uma série de práticas e rituais especiais.'
    },
     {
      'question': ' A mulher de Ló  se transformou em uma estatua de que?',
      'answers': ['Granito', 'Sal','Pedra','Marmore'  ],
      'correctIndex': 1,
      'hint': 'A mulher de Ló se transformou em algo que está relacionado ao elemento que é comum em grandes quantidades no mar. Esse material é conhecido por sua presença em ambientes salinos e é frequentemente usado para temperar alimentos.'
    },
     {
      'question': 'Qual era a funçãode Arão,irmão de Moises',
      'answers': ['Padeiro', 'copeiro','sarcedote','Artesão'  ],
      'correctIndex': 2,
      'hint': 'Arão, irmão de Moisés, desempenhou um papel muito importante nas funções religiosas do povo de Israel. Ele era responsável por conduzir os rituais e fazer ofertas a Deus, além de ser o líder espiritual do povo.'
    },
     {
      'question': 'Onde Deus confundiu as linguas?',
      'answers': ['jardim do Eden', 'Egito','Diluvio','Torre de babel'  ],
      'correctIndex': 3,
      'hint': 'O evento onde Deus confundiu as línguas ocorreu em um local específico mencionado na Bíblia, associado a um projeto de construção ambicioso que envolvia uma grande torre. Este evento é conhecido por ter levado à diversidade de línguas no mundo'
    },
      {
      'question': 'A quem Deus revelou os 10 mandamentos',
      'answers': ['Moises', 'Arão','Abraão','To'  ],
      'correctIndex': 0,
      'hint': 'O evento onde Deus confundiu as línguas ocorreu em um local específico mencionado na Bíblia, associado a um projeto de construção ambicioso que envolvia uma grande torre. Este evento é conhecido por ter levado à diversidade de línguas no mundo'
    },
      {
      'question': 'onde lemos na biblia de camelos se ajoelhando',
      'answers': ['Exodo', 'Genesis','Levitico','numeros'  ],
      'correctIndex': 1,
      'hint': 'está associado a um momento específico em que um personagem está lidando com camelos de forma prática. Isso acontece durante uma jornada e não está diretamente relacionado à criação ou leis, mas sim a um evento narrativo.'
    },
      {
      'question': 'Homen rude casado com uma mulher formosa e sabia',
      'answers': ['Nabal', 'Jubal','Jesse','Davi'  ],
      'correctIndex': 0,
      'hint': 'homem rústico e áspero é conhecido por seu comportamento difícil, mas sua esposa é descrita como formosa e sábia. Ela é uma figura importante na história de Davi.'
    },
      {
      'question': ' Qual Homen na biblia erá rei e sarcedote ao mesmo tempo?',
      'answers': ['Davi', 'Samuel','Melquisedeque','Sales'  ],
      'correctIndex': 2,
      'hint': 'O homem que era rei e sacerdote ao mesmo tempo na Bíblia é conhecido por sua figura enigmática e papel único, e seu nome é frequentemente associado a um sacerdócio eterno'
    },
      {
      'question': ' Qual deste livros da biblia que terminou com um ponto de interrogação?',
      'answers': ['Isaias', 'Matheus','Lamentaçoes','Genesis'  ],
      'correctIndex': 2,
      'hint': 'Este livro da Bíblia é conhecido por expressar lamentos e tristeza, e seu título sugere uma expressão de dor. '
    },
       {
      'question': ' Oque seria o terceiro ceu?',
      'answers': [' A Morada de Deus', 'Planetas e galaxia','Ceu das nuvens','não siginifica nada'  ],
      'correctIndex': 0,
      'hint': 'O terceiro céu é frequentemente descrito como o lugar da presença divina, onde se acredita que Deus reside. '
    },
       {
      'question': ' Quem escreveu filipenses?',
      'answers': [' josé e joão', 'Paulo e timotio','isaias e paulo','Paulo e Davi'  ],
      'correctIndex': 1,
      'hint': 'O livro de Filipenses foi escrito por um apóstolo que também é conhecido por suas cartas às igrejas e que contou com a ajuda de um companheiro. '
    },  
     {
      'question': ' Qual era a intenção de paulo para os felipenses?',
      'answers': [' criar rivalidade e divisão', 'pecar na carne','motivar a continuar no espirito da fé ','Não ficarem em conflito com Deus'  ],
      'correctIndex': 2,
      'hint': 'Paulo queria incentivar os filipenses a manterem a fé e a alegria, mesmo enfrentando desafios, e a viverem de acordo com o espírito cristão '
    },
    {
      'question': ' Qual era a pior forma de morte na epoca de jesus?',
      'answers': [' morte por afogamento', 'morte espiritual','morte na forca ','morte na cruz'  ],
      'correctIndex': 3,
      'hint': 'A forma de morte mais temida e cruel na época de Jesus era um método de execução pública que envolvia tortura e humilhação '
    },
     {
      'question': ' Qual era o desejo de timotio?',
      'answers': ['Ser util nas obras de Deus', 'Fazer o nome do senhor ser reconhecido','Destruir as obras divinas ','Denegrir a imagem de paulo'  ],
      'correctIndex': 0,
      'hint': 'Timóteo desejava ser um colaborador fiel nas tarefas de Deus e servir com dedicação. Qual era o seu principal desejo em relação às obras divinas? '
    }, {
      'question': ' Quando jesus nasceu onde ele foi colocado',
      'answers': ['Foi colocado numa cama.', 'Foi colocado numa manjedoura.',' Foi colocado em um trono. ','Foi colocado em um berço'  ],
      'correctIndex': 1,
      'hint': ' Lembre-se que Jesus nasceu em circunstâncias humildes, e seus pais estavam em um lugar simples, sem acomodações tradicionais. '
    },
    {
      'question': ' Quando a mulher com fluxo de sangue tocou nas vestes de Jesus, no que ela pensava?',
      'answers': ['Tenho que chamar a atenção de Jesus para ser curada', 'Tenho que interromper o caminho de Jesus',' Se eu tão somente tocar em seu manto, ficarei curada ','Se eu tão somente ver jesus, ficarei curada'  ],
      'correctIndex': 2,
      'hint': ' A história da mulher com fluxo de sangue que tocou nas vestes de Jesus está registrada em três Evangelhos. O versículo que menciona especificamente o pensamento dela é encontrado em:Mateus 9:21: "Porque dizia consigo: Se eu tão-somente tocar o seu manto, ficarei curada. '
    },
    {
      'question': ' Q',
      'answers': ['Tenho que chamar a atenção de Jesus para ser curada', 'Tenho que interromper o caminho de Jesus',' Se eu tão somente tocar em seu manto, ficarei curada ','Se eu tão somente ver jesus, ficarei curada'  ],
      'correctIndex': 2,
      'hint': ' A história da mulher com fluxo de sangue que tocou nas vestes de Jesus está registrada em três Evangelhos. O versículo que menciona especificamente o pensamento dela é encontrado em:Mateus 9:21: "Porque dizia consigo: Se eu tão-somente tocar o seu manto, ficarei curada. '
    },
    // Adicione o restante das perguntas aqui
  ];  

  
    @override
  void initState() {
    super.initState();
    _shuffleQuestions();
  }

  void _shuffleQuestions() {
    _questions.shuffle(Random());
  }

  void _showHint() {
    if (mounted) {
      setState(() {
        _hintMessage = _questions[_currentQuestionIndex]['hint'];
      });
    }
  }

  void _restartQuiz() {
    if (mounted) {
      setState(() {
        _currentQuestionIndex = 0;
        _score = 0;
        _selectedIndex = null;
        _isAnswerCorrect = false;
        _hintMessage = null;
        _answeredQuestionsCount = 0;
        _shuffleQuestions();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildQuestion(),
          SizedBox(height: 20),
          _buildAnswers(),
          SizedBox(height: 20),
          if (_hintMessage != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                _hintMessage!,
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
          SizedBox(height: 20),
          Text('Score: $_score'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showHint,
        child: Icon(Icons.lightbulb),
      ),
    );
  }

  Widget _buildQuestion() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        _questions[_currentQuestionIndex]['question'],
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _buildAnswers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(
        _questions[_currentQuestionIndex]['answers'].length,
        (index) => ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: _selectedIndex == index
                ? (_isAnswerCorrect ? Colors.green : Colors.red)
                : null,
          ),
          onPressed: () => _checkAnswer(index),
          child: Text(_questions[_currentQuestionIndex]['answers'][index]),
        ),
      ),
    );
  }

  void _checkAnswer(int selectedIndex) {
    int correctIndex = _questions[_currentQuestionIndex]['correctIndex'];
    if (mounted) {
      setState(() {
        _selectedIndex = selectedIndex;
        _isAnswerCorrect = selectedIndex == correctIndex;
        if (_isAnswerCorrect) {
          _score++;
        } else {
          if (_score > 0) {
            _score--;
          }
        }
        _answeredQuestionsCount++;
      });
    }

    Future.delayed(Duration(seconds: 1), () {
      if (!mounted) return; // Verifica se o widget ainda está montado
      _nextQuestion();
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex >= _questions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: _score,
            onRestart: _restartQuiz,
          ),
        ),
      );
    } else {
      if (mounted) {
        setState(() {
          _currentQuestionIndex++;
          _selectedIndex = null;
          _hintMessage = null;
        });
      }
    }
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  final VoidCallback onRestart;

  ResultScreen({required this.score, required this.onRestart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pontuação: $score',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SplashScreen()),
                  (route) => false, // Remove todas as rotas anteriores
                );
              },
              child: Text('Recomeçar'),
            ),
          ],
        ),
      ),
    );
  }
}