@interface NLLMLanguageModelSession
- (BOOL)addTokenForString:(id)a3 tokenID:(unsigned int *)a4;
- (BOOL)getFirstDynamicTokenID:(unsigned int *)a3 lastDynamicTokenID:(unsigned int *)a4;
- (BOOL)shouldAdaptToTokenIDs:(const unsigned int *)a3 length:(unint64_t)a4;
- (NLLMLanguageModelSession)initWithLanguageModel:(id)a3 options:(id)a4;
- (float)usageCountForTokenID:(unsigned int)a3;
- (id)conditionalProbabilityForString:(id)a3 context:(id)a4;
- (id)conditionalProbabilityForToken:(id)a3 context:(id)a4;
- (id)conditionalProbabilityForTokenID:(unsigned int)a3 contextTokenIDs:(const unsigned int *)a4 length:(unint64_t)a5;
- (id)description;
- (int64_t)blocklistStatusForString:(id)a3 matchType:(int64_t)a4;
- (int64_t)blocklistStatusForTokenIDs:(const unsigned int *)a3 length:(unint64_t)a4 matchType:(int64_t)a5;
- (void)adaptToToken:(id)a3 context:(id)a4;
- (void)adaptToTokenID:(unsigned int)a3 contextTokenIDs:(const unsigned int *)a4 length:(unint64_t)a5;
- (void)applyExponentialDecay;
- (void)dealloc;
- (void)enumeratePredictionsForContext:(id)a3 maximumPredictions:(unint64_t)a4 maximumTokensPerPrediction:(unint64_t)a5 withBlock:(id)a6;
- (void)enumeratePredictionsForContextTokenIDs:(const unsigned int *)a3 length:(unint64_t)a4 maximumPredictions:(unint64_t)a5 maximumTokensPerPrediction:(unint64_t)a6 withBlock:(id)a7;
- (void)flushDynamicData;
- (void)pruneToSize:(unint64_t)a3;
- (void)recordWithDifferentialPrivacy:(id)a3;
- (void)reset;
- (void)unadaptToToken:(id)a3 context:(id)a4;
- (void)unadaptToTokenID:(unsigned int)a3 contextTokenIDs:(const unsigned int *)a4 length:(unint64_t)a5;
@end

@implementation NLLMLanguageModelSession

- (NLLMLanguageModelSession)initWithLanguageModel:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1CA20]);
  v9 = [v6 localization];
  v10 = (void *)[v8 initWithLocaleIdentifier:v9];

  id v11 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v12 = objc_msgSend(v11, "initWithObjectsAndKeys:", v10, *MEMORY[0x1E4F723C8], 0);
  v13 = [v7 objectForKey:@"AppContext"];
  char v14 = BOOLForKey(v7, @"AdaptationEnabled", 1);
  int v15 = BOOLForKey(v7, @"IsSiriModel", 0);
  if (v13) {
    [v12 setObject:v13 forKey:*MEMORY[0x1E4F72368]];
  }
  if ((v14 & 1) == 0)
  {
    v16 = [NSNumber numberWithBool:0];
    [v12 setObject:v16 forKey:*MEMORY[0x1E4F72358]];
  }
  if (v15)
  {
    v17 = [NSNumber numberWithBool:1];
    [v12 setObject:v17 forKey:*MEMORY[0x1E4F723C0]];
  }
  v22.receiver = self;
  v22.super_class = (Class)NLLMLanguageModelSession;
  v18 = [(NLLanguageModelSession *)&v22 initWithLanguageModel:v6 options:v7];
  if (v18)
  {
    v18->_model = (void *)LMLanguageModelCreate();
    v19 = [[NLTokenizer alloc] initWithUnit:0];
    tokenizer = v18->_tokenizer;
    v18->_tokenizer = v19;
  }
  return v18;
}

- (void)dealloc
{
  if (self->_model) {
    LMLanguageModelRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)NLLMLanguageModelSession;
  [(NLLMLanguageModelSession *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  v9.receiver = self;
  v9.super_class = (Class)NLLMLanguageModelSession;
  v4 = [(NLLMLanguageModelSession *)&v9 description];
  v5 = [(NLLanguageModelSession *)self languageModel];
  id v6 = [v5 localization];
  id v7 = objc_msgSend(v3, "stringWithFormat:", @"%@(%@"), v4, v6;

  if (self->_model) {
    objc_msgSend(v7, "appendFormat:", @":%p", self->_model);
  }
  [v7 appendString:@""]);

  return v7;
}

- (id)conditionalProbabilityForToken:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NLLanguageModelSession *)self languageModel];
  objc_super v9 = [v8 lexicon];

  v10 = [v9 entryForString:v7];

  id v11 = entrySequenceForStringWithOptionalBOS(v6, v9, self->_tokenizer, 1);

  v12 = tokensForEntrySequence(v11);
  v13 = v12;
  if (v11) {
    BOOL v14 = self->_model == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14 || v10 == 0 || v12 == 0)
  {
    v17 = [[NLProbabilityInfo alloc] initWithInvalidProbability];
    if (!v13) {
      goto LABEL_14;
    }
  }
  else
  {
    -[NLLMLanguageModelSession conditionalProbabilityForTokenID:contextTokenIDs:length:](self, "conditionalProbabilityForTokenID:contextTokenIDs:length:", [v10 tokenID], v12, objc_msgSend(v11, "count"));
    v17 = (NLProbabilityInfo *)objc_claimAutoreleasedReturnValue();
  }
  free(v13);
LABEL_14:

  return v17;
}

- (id)conditionalProbabilityForString:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NLLanguageModelSession *)self languageModel];
  objc_super v9 = [v8 lexicon];

  v10 = entrySequenceForStringWithOptionalBOS(v7, v9, self->_tokenizer, 1);
  id v11 = entrySequenceForStringWithOptionalBOS(v6, v9, self->_tokenizer, 0);
  v12 = v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  unint64_t v14 = 0x1E5C53000uLL;
  if (v13 || ![v11 count])
  {
    int v15 = 0;
    v17 = 0;
    BOOL v18 = 0;
    goto LABEL_16;
  }
  int v15 = [v10 arrayByAddingObjectsFromArray:v12];
  v16 = tokensForEntrySequence(v15);
  v17 = v16;
  BOOL v18 = v16 != 0;
  if (self->_model) {
    BOOL v19 = v16 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19)
  {
LABEL_16:
    v27 = (NLProbabilityInfo *)[objc_alloc(*(Class *)(v14 + 688)) initWithInvalidProbability];
    if (!v18) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  v31 = v15;
  uint64_t v20 = [v10 count];
  uint64_t v21 = [v12 count];
  id v30 = v6;
  if (v21)
  {
    unint64_t v22 = v21;
    uint64_t v23 = 0;
    double v24 = 0.0;
    while (1)
    {
      v25 = [(NLLMLanguageModelSession *)self conditionalProbabilityForTokenID:v17[v20 + v23] contextTokenIDs:v17 length:v20 + v23];
      if (![v25 isValid]) {
        break;
      }
      [v25 log10Probability];
      double v24 = v24 + v26;

      if (++v23 >= v22) {
        goto LABEL_22;
      }
    }

    BOOL v18 = 1;
    id v6 = v30;
    int v15 = v31;
    unint64_t v14 = 0x1E5C53000;
    goto LABEL_16;
  }
  double v24 = 0.0;
LABEL_22:
  unint64_t v14 = 0x1E5C53000uLL;
  v29 = [[NLProbabilityInfo alloc] initWithLog10Probability:0 flags:v24];
  int v15 = v31;
  if (!v29)
  {
    BOOL v18 = 1;
    id v6 = v30;
    goto LABEL_16;
  }
  v27 = v29;
  id v6 = v30;
LABEL_17:
  free(v17);
LABEL_18:

  return v27;
}

- (void)enumeratePredictionsForContext:(id)a3 maximumPredictions:(unint64_t)a4 maximumTokensPerPrediction:(unint64_t)a5 withBlock:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  v12 = [(NLLanguageModelSession *)self languageModel];
  id v15 = [v12 lexicon];

  BOOL v13 = entrySequenceForStringWithOptionalBOS(v11, v15, self->_tokenizer, 1);

  unint64_t v14 = tokensForEntrySequence(v13);
  -[NLLMLanguageModelSession enumeratePredictionsForContextTokenIDs:length:maximumPredictions:maximumTokensPerPrediction:withBlock:](self, "enumeratePredictionsForContextTokenIDs:length:maximumPredictions:maximumTokensPerPrediction:withBlock:", v14, [v13 count], a4, a5, v10);

  if (v14) {
    free(v14);
  }
}

- (int64_t)blocklistStatusForString:(id)a3 matchType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(NLLanguageModelSession *)self languageModel];
  id v8 = [v7 lexicon];

  objc_super v9 = entrySequenceForStringWithOptionalBOS(v6, v8, self->_tokenizer, 0);

  id v10 = tokensForEntrySequence(v9);
  int64_t v11 = -[NLLMLanguageModelSession blocklistStatusForTokenIDs:length:matchType:](self, "blocklistStatusForTokenIDs:length:matchType:", v10, [v9 count], a4);
  if (v10) {
    free(v10);
  }

  return v11;
}

- (void)adaptToToken:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NLLanguageModelSession *)self languageModel];
  id v12 = [v8 lexicon];

  objc_super v9 = [v12 entryForString:v7];

  id v10 = entrySequenceForStringWithOptionalBOS(v6, v12, self->_tokenizer, 1);

  int64_t v11 = tokensForEntrySequence(v10);
  if (v9) {
    -[NLLMLanguageModelSession adaptToTokenID:contextTokenIDs:length:](self, "adaptToTokenID:contextTokenIDs:length:", [v9 tokenID], v11, objc_msgSend(v10, "count"));
  }
  if (v11) {
    free(v11);
  }
}

- (void)unadaptToToken:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NLLanguageModelSession *)self languageModel];
  id v12 = [v8 lexicon];

  objc_super v9 = [v12 entryForString:v7];

  id v10 = entrySequenceForStringWithOptionalBOS(v6, v12, self->_tokenizer, 1);

  int64_t v11 = tokensForEntrySequence(v10);
  if (v9) {
    -[NLLMLanguageModelSession unadaptToTokenID:contextTokenIDs:length:](self, "unadaptToTokenID:contextTokenIDs:length:", [v9 tokenID], v11, objc_msgSend(v10, "count"));
  }
  if (v11) {
    free(v11);
  }
}

- (id)conditionalProbabilityForTokenID:(unsigned int)a3 contextTokenIDs:(const unsigned int *)a4 length:(unint64_t)a5
{
  if (self->_model)
  {
    LMLanguageModelConditionalProbability();
    id v6 = [[NLProbabilityInfo alloc] initWithLog10Probability:0 flags:v5];
  }
  else
  {
    id v6 = [[NLProbabilityInfo alloc] initWithInvalidProbability];
  }

  return v6;
}

- (void)enumeratePredictionsForContextTokenIDs:(const unsigned int *)a3 length:(unint64_t)a4 maximumPredictions:(unint64_t)a5 maximumTokensPerPrediction:(unint64_t)a6 withBlock:(id)a7
{
  id v8 = a7;
  objc_super v9 = [(NLLanguageModelSession *)self languageModel];
  id v10 = [v9 lexicon];

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  id v11 = v10;
  id v12 = v8;
  LMLanguageModelEnumeratePredictionsWithBlock();

  _Block_object_dispose(v13, 8);
}

void __130__NLLMLanguageModelSession_enumeratePredictionsForContextTokenIDs_length_maximumPredictions_maximumTokensPerPrediction_withBlock___block_invoke(uint64_t a1, unsigned int *a2, uint64_t a3, uint64_t a4, unsigned char *a5, double a6)
{
  id v11 = [MEMORY[0x1E4F28E78] string];
  if (a3)
  {
    id v12 = a2;
    uint64_t v13 = a3;
    do
    {
      unsigned int v14 = *v12++;
      id v15 = [*(id *)(a1 + 32) entryForTokenID:v14];
      v16 = [v15 string];

      if (v16)
      {
        if ([v11 length]) {
          [v11 appendString:@" "];
        }
        [v11 appendString:v16];
      }

      --v13;
    }
    while (v13);
  }
  if ([v11 length])
  {
    v17 = [[NLProbabilityInfo alloc] initWithLog10Probability:0 flags:a6];
    BOOL v18 = [[NLPredictionInfo alloc] initWithPrediction:v11 tokenIDs:a2 length:a3 contextLength:a4 probabilityInfo:v17];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  else
  {
    v17 = 0;
    BOOL v18 = 0;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(void *)(a1 + 56)) {
    *a5 = 1;
  }
}

- (int64_t)blocklistStatusForTokenIDs:(const unsigned int *)a3 length:(unint64_t)a4 matchType:(int64_t)a5
{
  int64_t result = (int64_t)self->_model;
  if (result) {
    return LMLanguageModelTokenSequenceIsBlocklisted();
  }
  return result;
}

- (void)adaptToTokenID:(unsigned int)a3 contextTokenIDs:(const unsigned int *)a4 length:(unint64_t)a5
{
  if (self->_model) {
    MEMORY[0x1F412A1B8]();
  }
}

- (void)unadaptToTokenID:(unsigned int)a3 contextTokenIDs:(const unsigned int *)a4 length:(unint64_t)a5
{
  if (self->_model) {
    MEMORY[0x1F412A178]();
  }
}

- (BOOL)addTokenForString:(id)a3 tokenID:(unsigned int *)a4
{
  model = self->_model;
  if (model) {
    LOBYTE(model) = MEMORY[0x1F412A130]();
  }
  return (char)model;
}

- (BOOL)getFirstDynamicTokenID:(unsigned int *)a3 lastDynamicTokenID:(unsigned int *)a4
{
  model = self->_model;
  if (model) {
    LOBYTE(model) = MEMORY[0x1F412A198]();
  }
  return (char)model;
}

- (void)recordWithDifferentialPrivacy:(id)a3
{
  if (self->_model) {
    MEMORY[0x1F412A1D8]();
  }
}

- (void)reset
{
  model = self->_model;
  if (model) {
    MEMORY[0x1F412A1F0](model, a2);
  }
}

- (void)flushDynamicData
{
  if (self->_model) {
    MEMORY[0x1F412A190]();
  }
}

- (void)applyExponentialDecay
{
  model = self->_model;
  if (model) {
    MEMORY[0x1F412A140](model, a2);
  }
}

- (void)pruneToSize:(unint64_t)a3
{
  if (self->_model) {
    MEMORY[0x1F412A1D0]();
  }
}

- (BOOL)shouldAdaptToTokenIDs:(const unsigned int *)a3 length:(unint64_t)a4
{
  model = self->_model;
  if (model) {
    LOBYTE(model) = MEMORY[0x1F412A210]();
  }
  return (char)model;
}

- (float)usageCountForTokenID:(unsigned int)a3
{
  float result = 0.0;
  if (a3)
  {
    if (self->_model) {
      LMLanguageModelGetUsageCount();
    }
  }
  return result;
}

- (void).cxx_destruct
{
}

@end