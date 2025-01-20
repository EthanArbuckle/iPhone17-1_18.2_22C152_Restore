@interface NLLanguageModel
+ (id)languageModelWithOptions:(id)a3 error:(id *)a4;
- (BOOL)generatesPredictions;
- (BOOL)getConditionalProbabilityForTokenID:(unsigned int)a3 context:(const unsigned int *)a4 length:(unint64_t)a5 probability:(double *)a6;
- (NLLanguageModel)initWithLocalization:(id)a3;
- (NLLexicon)lexicon;
- (NSString)localization;
- (double)conditionalProbabilityForEntry:(id)a3 context:(id)a4;
- (double)conditionalProbabilityForWord:(id)a3 context:(id)a4;
- (id)description;
- (id)language;
- (id)languages;
- (id)locale;
- (id)sessionWithOptions:(id)a3;
- (id)stringForTokenID:(unsigned int)a3;
- (id)tokenIDConverter;
- (int64_t)granularity;
- (unsigned)tokenIDForString:(id)a3;
- (void)dealloc;
- (void)enumeratePredictionsForContext:(id)a3 maxEntriesPerPrediction:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumeratePredictionsForContext:(id)a3 maxWordsPerPrediction:(unint64_t)a4 usingBlock:(id)a5;
@end

@implementation NLLanguageModel

- (NLLanguageModel)initWithLocalization:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v7 = objc_msgSend(v6, "initWithObjectsAndKeys:", v5, *MEMORY[0x1E4F723C8], 0);
  v14.receiver = self;
  v14.super_class = (Class)NLLanguageModel;
  v8 = [(NLLanguageModel *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v4 copy];
    localization = v8->_localization;
    v8->_localization = (NSString *)v9;

    v8->_model = (void *)LMLanguageModelCreate();
    v11 = [[NLLexicon alloc] initWithLocalization:v4];
    lexicon = v8->_lexicon;
    v8->_lexicon = v11;
  }
  return v8;
}

+ (id)languageModelWithOptions:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = localizationForOptions(v5);
  uint64_t v7 = granularityForOptions(v5);
  v8 = stringForKey(v5, @"Architecture", @"LSTM");
  int v9 = BOOLForKey(v5, @"UseLMS", 0);
  if (v7 != 1)
  {
    if (v9)
    {
      v10 = NLLMSLanguageModel;
      goto LABEL_5;
    }
    if (!v8 || ![v8 isEqual:@"Transformer"])
    {
      v11 = [(NLLanguageModel *)[NLLMLanguageModel alloc] initWithLocalization:v6];
      goto LABEL_6;
    }
  }
  v10 = NLNLPLanguageModel;
LABEL_5:
  v11 = (NLLMLanguageModel *)[[v10 alloc] initWithLocalization:v6 options:v5];
LABEL_6:
  v12 = v11;
  if (a4 && !v11)
  {
    v13 = [NSString stringWithFormat:@"Failed to load language model for %@", v6];
    objc_super v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = v13;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    *a4 = [v14 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:11 userInfo:v15];
  }

  return v12;
}

- (void)dealloc
{
  if (self->_model) {
    LMLanguageModelRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)NLLanguageModel;
  [(NLLanguageModel *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  v7.receiver = self;
  v7.super_class = (Class)NLLanguageModel;
  id v4 = [(NLLanguageModel *)&v7 description];
  id v5 = objc_msgSend(v3, "stringWithFormat:", @"%@(%@"), v4, self->_localization;

  if (self->_model) {
    objc_msgSend(v5, "appendFormat:", @":%p", self->_model);
  }
  [v5 appendString:@""]);

  return v5;
}

- (NSString)localization
{
  return self->_localization;
}

- (id)language
{
  return @"und";
}

- (id)languages
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"und";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)locale
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA20]);
  id v4 = [(NLLanguageModel *)self localization];
  id v5 = (void *)[v3 initWithLocaleIdentifier:v4];

  return v5;
}

- (int64_t)granularity
{
  return 2;
}

- (BOOL)generatesPredictions
{
  return 0;
}

- (NLLexicon)lexicon
{
  return self->_lexicon;
}

- (id)sessionWithOptions:(id)a3
{
  return 0;
}

- (id)tokenIDConverter
{
  return 0;
}

- (BOOL)getConditionalProbabilityForTokenID:(unsigned int)a3 context:(const unsigned int *)a4 length:(unint64_t)a5 probability:(double *)a6
{
  unint64_t v10 = 0xC03E000000000000;
  if (self->_model)
  {
    LMLanguageModelConditionalProbability();
    unint64_t v10 = v7;
    LODWORD(lexicon) = 1;
    if (!a6) {
      return (char)lexicon;
    }
  }
  else
  {
    lexicon = self->_lexicon;
    if (!lexicon) {
      return (char)lexicon;
    }
    LODWORD(lexicon) = -[NLLexicon getProbabilityForTokenID:probability:](lexicon, "getProbabilityForTokenID:probability:", *(void *)&a3, &v10, a5);
    if (!a6) {
      return (char)lexicon;
    }
  }
  if (lexicon)
  {
    *(void *)a6 = v10;
    LOBYTE(lexicon) = 1;
  }
  return (char)lexicon;
}

- (double)conditionalProbabilityForEntry:(id)a3 context:(id)a4
{
  double v12 = -30.0;
  id v6 = a4;
  id v7 = a3;
  v8 = tokensForEntrySequence(v6);
  uint64_t v9 = [v7 tokenID];

  uint64_t v10 = [v6 count];
  [(NLLanguageModel *)self getConditionalProbabilityForTokenID:v9 context:v8 length:v10 probability:&v12];
  if (v8) {
    free(v8);
  }
  return v12;
}

- (double)conditionalProbabilityForWord:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = [(NLLexicon *)self->_lexicon entryForString:a3];
  tokenizer = self->_tokenizer;
  if (!tokenizer)
  {
    uint64_t v9 = [[NLTokenizer alloc] initWithUnit:0];
    uint64_t v10 = self->_tokenizer;
    self->_tokenizer = v9;

    tokenizer = self->_tokenizer;
  }
  v11 = entrySequenceForStringWithOptionalBOS(v6, self->_lexicon, tokenizer, 1);
  if (v7)
  {
    [(NLLanguageModel *)self conditionalProbabilityForEntry:v7 context:v11];
    double v13 = v12;
  }
  else
  {
    double v13 = -30.0;
  }

  return v13;
}

- (void)enumeratePredictionsForContext:(id)a3 maxEntriesPerPrediction:(unint64_t)a4 usingBlock:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (self->_model && self->_lexicon)
  {
    uint64_t v9 = tokensForEntrySequence(v7);
    [v7 count];
    id v10 = v8;
    LMLanguageModelEnumeratePredictionsWithBlock();
    if (v9) {
      free(v9);
    }
  }
}

void __85__NLLanguageModel_enumeratePredictionsForContext_maxEntriesPerPrediction_usingBlock___block_invoke(uint64_t a1, unsigned int *a2, uint64_t a3, double a4)
{
  for (i = [MEMORY[0x1E4F1CA48] array];
  {
    unsigned int v9 = *a2++;
    id v10 = [*(id *)(*(void *)(a1 + 32) + 24) entryForTokenID:v9];
    [i addObject:v10];
  }
  (*(void (**)(double))(*(void *)(a1 + 40) + 16))(a4);
}

- (void)enumeratePredictionsForContext:(id)a3 maxWordsPerPrediction:(unint64_t)a4 usingBlock:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (self->_model)
  {
    lexicon = self->_lexicon;
    if (lexicon)
    {
      tokenizer = self->_tokenizer;
      if (!tokenizer)
      {
        v11 = [[NLTokenizer alloc] initWithUnit:0];
        double v12 = self->_tokenizer;
        self->_tokenizer = v11;

        lexicon = self->_lexicon;
        tokenizer = self->_tokenizer;
      }
      double v13 = entrySequenceForStringWithOptionalBOS(v7, lexicon, tokenizer, 1);
      objc_super v14 = tokensForEntrySequence(v13);
      [v13 count];
      id v15 = v8;
      LMLanguageModelEnumeratePredictionsWithBlock();
      if (v14) {
        free(v14);
      }
    }
  }
}

void __83__NLLanguageModel_enumeratePredictionsForContext_maxWordsPerPrediction_usingBlock___block_invoke(uint64_t a1, unsigned int *a2, uint64_t a3, double a4)
{
  for (i = [MEMORY[0x1E4F28E78] string];
  {
    unsigned int v9 = *a2++;
    id v10 = [*(id *)(*(void *)(a1 + 32) + 24) entryForTokenID:v9];
    v11 = [v10 string];

    if (v11)
    {
      if ([i length]) {
        [i appendString:@" "];
      }
      [i appendString:v11];
    }
  }
  if ([i length]) {
    (*(void (**)(double))(*(void *)(a1 + 40) + 16))(a4);
  }
}

- (unsigned)tokenIDForString:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_model && (id v6 = (const char *)[v4 UTF8String]) != 0)
  {
    strlen(v6);
    unsigned int TokenIDForUTF8String = LMLanguageModelGetTokenIDForUTF8String();
  }
  else
  {
    unsigned int TokenIDForUTF8String = 0;
  }

  return TokenIDForUTF8String;
}

- (id)stringForTokenID:(unsigned int)a3
{
  model = self->_model;
  if (model)
  {
    model = (void *)LMLanguageModelCreateStringForTokenID();
    if (!model) {
      model = 0;
    }
  }

  return model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_lexicon, 0);

  objc_storeStrong((id *)&self->_localization, 0);
}

@end