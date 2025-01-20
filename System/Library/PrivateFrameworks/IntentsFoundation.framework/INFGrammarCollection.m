@interface INFGrammarCollection
+ (id)grammarCollection;
+ (id)grammarCollectionNamed:(id)a3 bundle:(id)a4;
+ (id)grammarCollectionNamed:(id)a3 bundle:(id)a4 language:(id)a5;
- (INFGrammarCollection)init;
- (INFGrammarCollection)initWithDictionary:(id)a3;
- (INFGrammarCollection)initWithGrammarCollectionNamed:(id)a3 bundle:(id)a4 language:(id)a5;
- (NSArray)sentences;
- (NSArray)tokens;
- (NSMutableDictionary)sentencesDictionary;
- (NSMutableDictionary)tokensDictionary;
- (id)createAdjectiveWithIdentifier:(id)a3 language:(id)a4;
- (id)createNounWithGender:(unint64_t)a3 identifier:(id)a4 language:(id)a5;
- (id)createNounWithIdentifier:(id)a3 language:(id)a4;
- (id)createSentenceWithIdentifier:(id)a3;
- (id)dictionaryRepresentation;
- (id)sentenceWithIdentifier:(id)a3;
- (id)tokenWithIdentifier:(id)a3;
- (void)addSentence:(id)a3;
- (void)addToken:(id)a3;
- (void)setSentencesDictionary:(id)a3;
- (void)setTokensDictionary:(id)a3;
- (void)writeToFileAtPath:(id)a3;
@end

@implementation INFGrammarCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentencesDictionary, 0);
  objc_storeStrong((id *)&self->_tokensDictionary, 0);
}

- (void)setSentencesDictionary:(id)a3
{
}

- (NSMutableDictionary)sentencesDictionary
{
  return self->_sentencesDictionary;
}

- (void)setTokensDictionary:(id)a3
{
}

- (NSMutableDictionary)tokensDictionary
{
  return self->_tokensDictionary;
}

- (void)writeToFileAtPath:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28F98];
  id v5 = a3;
  v6 = [(INFGrammarCollection *)self dictionaryRepresentation];
  id v7 = [v4 dataWithPropertyList:v6 format:100 options:0 error:0];

  [v7 writeToFile:v5 atomically:1];
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  tokensDictionary = self->_tokensDictionary;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __48__INFGrammarCollection_dictionaryRepresentation__block_invoke;
  v16[3] = &unk_1E6CA0D28;
  id v17 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)tokensDictionary enumerateKeysAndObjectsUsingBlock:v16];
  [v3 setObject:v6 forKeyedSubscript:@"LOCSentenceTokens"];
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  sentencesDictionary = self->_sentencesDictionary;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __48__INFGrammarCollection_dictionaryRepresentation__block_invoke_2;
  v14 = &unk_1E6CA0D00;
  id v15 = v7;
  id v9 = v7;
  [(NSMutableDictionary *)sentencesDictionary enumerateKeysAndObjectsUsingBlock:&v11];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, @"LOCSentences", v11, v12, v13, v14);

  return v3;
}

void __48__INFGrammarCollection_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 dictionaryRepresentation];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

void __48__INFGrammarCollection_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 dictionaryRepresentation];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (NSArray)tokens
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  tokensDictionary = self->_tokensDictionary;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__INFGrammarCollection_tokens__block_invoke;
  v7[3] = &unk_1E6CA0D28;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)tokensDictionary enumerateKeysAndObjectsUsingBlock:v7];

  return (NSArray *)v5;
}

uint64_t __30__INFGrammarCollection_tokens__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (id)tokenWithIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_tokensDictionary objectForKeyedSubscript:a3];
}

- (void)addToken:(id)a3
{
  tokensDictionary = self->_tokensDictionary;
  id v4 = a3;
  id v5 = [v4 identifier];
  [(NSMutableDictionary *)tokensDictionary setObject:v4 forKeyedSubscript:v5];
}

- (id)createAdjectiveWithIdentifier:(id)a3 language:(id)a4
{
  id v5 = +[INFPartOfSpeech adjectiveWithIdentifier:a3 language:a4];
  [(INFGrammarCollection *)self addToken:v5];
  return v5;
}

- (id)createNounWithGender:(unint64_t)a3 identifier:(id)a4 language:(id)a5
{
  id v6 = +[INFPartOfSpeech nounWithGender:a3 identifier:a4 language:a5];
  [(INFGrammarCollection *)self addToken:v6];
  return v6;
}

- (id)createNounWithIdentifier:(id)a3 language:(id)a4
{
  id v5 = +[INFPartOfSpeech nounWithIdentifier:a3 language:a4];
  [(INFGrammarCollection *)self addToken:v5];
  return v5;
}

- (NSArray)sentences
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  sentencesDictionary = self->_sentencesDictionary;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__INFGrammarCollection_sentences__block_invoke;
  v7[3] = &unk_1E6CA0D00;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)sentencesDictionary enumerateKeysAndObjectsUsingBlock:v7];

  return (NSArray *)v5;
}

uint64_t __33__INFGrammarCollection_sentences__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (void)addSentence:(id)a3
{
  id v4 = a3;
  [v4 setCollection:self];
  sentencesDictionary = self->_sentencesDictionary;
  id v6 = [v4 identifier];
  [(NSMutableDictionary *)sentencesDictionary setObject:v4 forKeyedSubscript:v6];
}

- (id)sentenceWithIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_sentencesDictionary objectForKeyedSubscript:a3];
}

- (id)createSentenceWithIdentifier:(id)a3
{
  id v4 = +[INFSentence sentenceWithIdentifier:a3];
  [(INFGrammarCollection *)self addSentence:v4];
  return v4;
}

- (INFGrammarCollection)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(INFGrammarCollection *)self init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"LOCSentenceTokens"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __43__INFGrammarCollection_initWithDictionary___block_invoke;
    v12[3] = &unk_1E6CA0CD8;
    id v7 = v5;
    v13 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v12];
    id v8 = [v4 objectForKeyedSubscript:@"LOCSentences"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__INFGrammarCollection_initWithDictionary___block_invoke_2;
    v10[3] = &unk_1E6CA0CD8;
    uint64_t v11 = v7;
    [v8 enumerateKeysAndObjectsUsingBlock:v10];
  }
  return v5;
}

void __43__INFGrammarCollection_initWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[INFPartOfSpeech alloc] initWithDictionary:v5 identifier:v6];

  [*(id *)(a1 + 32) addToken:v7];
}

void __43__INFGrammarCollection_initWithDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[INFSentence alloc] initWithDictionary:v5 identifier:v6];

  [*(id *)(a1 + 32) addSentence:v7];
}

- (INFGrammarCollection)initWithGrammarCollectionNamed:(id)a3 bundle:(id)a4 language:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28B50] mainBundle];
  }
  uint64_t v12 = v11;
  v13 = (void *)MEMORY[0x1E4F28B50];
  v14 = [v11 localizations];
  if (v10)
  {
    v23[0] = v10;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    v16 = [v13 preferredLocalizationsFromArray:v14 forPreferences:v15];
  }
  else
  {
    v16 = [v13 preferredLocalizationsFromArray:v14 forPreferences:0];
  }

  id v17 = [v16 firstObject];
  v18 = [v12 pathForResource:v8 ofType:@"xcgrammar" inDirectory:0 forLocalization:v17];

  if (v18)
  {
    v19 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v18];
    v20 = [MEMORY[0x1E4F28F98] propertyListWithData:v19 options:0 format:0 error:0];
    self = [(INFGrammarCollection *)self initWithDictionary:v20];

    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (INFGrammarCollection)init
{
  v8.receiver = self;
  v8.super_class = (Class)INFGrammarCollection;
  v2 = [(INFGrammarCollection *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    tokensDictionary = v2->_tokensDictionary;
    v2->_tokensDictionary = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    sentencesDictionary = v2->_sentencesDictionary;
    v2->_sentencesDictionary = (NSMutableDictionary *)v5;
  }
  return v2;
}

+ (id)grammarCollectionNamed:(id)a3 bundle:(id)a4 language:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithGrammarCollectionNamed:v10 bundle:v9 language:v8];

  return v11;
}

+ (id)grammarCollectionNamed:(id)a3 bundle:(id)a4
{
  return (id)[a1 grammarCollectionNamed:a3 bundle:a4 language:0];
}

+ (id)grammarCollection
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end