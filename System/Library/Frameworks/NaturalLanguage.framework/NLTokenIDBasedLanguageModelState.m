@interface NLTokenIDBasedLanguageModelState
- (NLTokenIDBasedLanguageModelState)initWithSession:(id)a3 options:(id)a4 context:(id)a5;
- (NLTokenIDBasedLanguageModelState)initWithSession:(id)a3 options:(id)a4 context:(id)a5 contextTokenIDArray:(id)a6;
- (id)conditionalProbabilitiesForTokenIDs:(const unsigned int *)a3 count:(unint64_t)a4;
- (id)conditionalProbabilityForToken:(id)a3;
- (id)conditionalProbabilityForTokenID:(unsigned int)a3;
- (id)contextTokenIDArrayForContext:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)contextLength;
- (unsigned)contextTokenIDs;
- (void)addContext:(id)a3;
- (void)addContextTokenIDs:(const unsigned int *)a3 length:(unint64_t)a4;
- (void)enumeratePredictions:(unint64_t)a3 maximumTokensPerPrediction:(unint64_t)a4 withBlock:(id)a5;
- (void)resetContext;
@end

@implementation NLTokenIDBasedLanguageModelState

- (id)contextTokenIDArrayForContext:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  v6 = [v4 array];
  v7 = [(NLLanguageModelState *)self session];
  v8 = [v7 languageModel];
  v9 = [v8 tokenIDConverter];

  uint64_t v10 = [v5 length];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__NLTokenIDBasedLanguageModelState_contextTokenIDArrayForContext___block_invoke;
  v13[3] = &unk_1E5C54128;
  id v11 = v6;
  id v14 = v11;
  objc_msgSend(v9, "enumerateTokenIDsForString:range:withBlock:", v5, 0, v10, v13);

  return v11;
}

void __66__NLTokenIDBasedLanguageModelState_contextTokenIDArrayForContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  v4 = *(void **)(a1 + 32);
  id v5 = [NSNumber numberWithUnsignedInteger:a4];
  [v4 addObject:v5];
}

- (NLTokenIDBasedLanguageModelState)initWithSession:(id)a3 options:(id)a4 context:(id)a5 contextTokenIDArray:(id)a6
{
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)NLTokenIDBasedLanguageModelState;
  id v11 = [(NLLanguageModelState *)&v15 initWithSession:a3 options:a4 context:a5];
  if (v11)
  {
    uint64_t v12 = [v10 mutableCopy];
    contextTokenIDArray = v11->_contextTokenIDArray;
    v11->_contextTokenIDArray = (NSMutableArray *)v12;
  }
  return v11;
}

- (NLTokenIDBasedLanguageModelState)initWithSession:(id)a3 options:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NLTokenIDBasedLanguageModelState *)self contextTokenIDArrayForContext:v8];
  uint64_t v12 = [(NLTokenIDBasedLanguageModelState *)self initWithSession:v10 options:v9 context:v8 contextTokenIDArray:v11];

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(NLLanguageModelState *)self session];
  v6 = [(NLLanguageModelState *)self options];
  v7 = [(NLLanguageModelState *)self context];
  id v8 = (void *)[v4 initWithSession:v5 options:v6 context:v7 contextTokenIDArray:self->_contextTokenIDArray];

  return v8;
}

- (void)addContext:(id)a3
{
  id v4 = a3;
  id v5 = [(NLTokenIDBasedLanguageModelState *)self contextTokenIDArrayForContext:v4];
  v6.receiver = self;
  v6.super_class = (Class)NLTokenIDBasedLanguageModelState;
  [(NLLanguageModelState *)&v6 addContext:v4];

  [(NSMutableArray *)self->_contextTokenIDArray addObjectsFromArray:v5];
}

- (void)resetContext
{
  v3.receiver = self;
  v3.super_class = (Class)NLTokenIDBasedLanguageModelState;
  [(NLLanguageModelState *)&v3 resetContext];
  [(NSMutableArray *)self->_contextTokenIDArray removeAllObjects];
}

- (void)addContextTokenIDs:(const unsigned int *)a3 length:(unint64_t)a4
{
  v7 = [(NLLanguageModelState *)self session];
  id v8 = [v7 languageModel];
  id v9 = [v8 tokenIDConverter];

  id v10 = [v9 stringForTokenIDs:a3 length:a4];
  id v11 = [(NLLanguageModelState *)self context];
  if ([v11 length])
  {
    uint64_t v12 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
    [v10 rangeOfCharacterFromSet:v12];
    uint64_t v14 = v13;

    if (v14)
    {
      v19.receiver = self;
      v19.super_class = (Class)NLTokenIDBasedLanguageModelState;
      [(NLLanguageModelState *)&v19 addContext:@" "];
    }
  }
  else
  {
  }
  v18.receiver = self;
  v18.super_class = (Class)NLTokenIDBasedLanguageModelState;
  [(NLLanguageModelState *)&v18 addContext:v10];
  for (; a4; --a4)
  {
    contextTokenIDArray = self->_contextTokenIDArray;
    unsigned int v16 = *a3++;
    v17 = [NSNumber numberWithUnsignedInteger:v16];
    [(NSMutableArray *)contextTokenIDArray addObject:v17];
  }
}

- (id)conditionalProbabilityForToken:(id)a3
{
  id v4 = a3;
  id v5 = [(NLLanguageModelState *)self session];
  objc_super v6 = [v5 languageModel];
  v7 = [v6 tokenIDConverter];

  uint64_t v8 = [v7 tokenIDForString:v4];
  id v9 = [(NLTokenIDBasedLanguageModelState *)self conditionalProbabilityForTokenID:v8];

  return v9;
}

- (unint64_t)contextLength
{
  return [(NSMutableArray *)self->_contextTokenIDArray count] + 1;
}

- (unsigned)contextTokenIDs
{
  unint64_t v3 = [(NLTokenIDBasedLanguageModelState *)self contextLength];
  id v4 = (unsigned int *)malloc_type_malloc(4 * v3, 0x100004052888210uLL);
  unsigned int *v4 = 1;
  if (v3 >= 2)
  {
    uint64_t v5 = 0;
    unint64_t v6 = v3 - 1;
    do
    {
      v7 = [(NSMutableArray *)self->_contextTokenIDArray objectAtIndex:v5];
      v4[v5 + 1] = [v7 unsignedIntegerValue];

      ++v5;
    }
    while (v6 != v5);
  }
  return v4;
}

- (id)conditionalProbabilityForTokenID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(NLTokenIDBasedLanguageModelState *)self contextTokenIDs];
  unint64_t v6 = [(NLLanguageModelState *)self session];
  v7 = objc_msgSend(v6, "conditionalProbabilityForTokenID:contextTokenIDs:length:", v3, v5, -[NLTokenIDBasedLanguageModelState contextLength](self, "contextLength"));

  if (v5) {
    free(v5);
  }

  return v7;
}

- (id)conditionalProbabilitiesForTokenIDs:(const unsigned int *)a3 count:(unint64_t)a4
{
  v7 = [(NLTokenIDBasedLanguageModelState *)self contextTokenIDs];
  uint64_t v8 = [(NLLanguageModelState *)self session];
  id v9 = objc_msgSend(v8, "conditionalProbabilitiesForTokenIDs:count:contextTokenIDs:length:", a3, a4, v7, -[NLTokenIDBasedLanguageModelState contextLength](self, "contextLength"));

  if (v7) {
    free(v7);
  }

  return v9;
}

- (void)enumeratePredictions:(unint64_t)a3 maximumTokensPerPrediction:(unint64_t)a4 withBlock:(id)a5
{
  id v8 = a5;
  id v9 = [(NLTokenIDBasedLanguageModelState *)self contextTokenIDs];
  id v10 = [(NLLanguageModelState *)self session];
  objc_msgSend(v10, "enumeratePredictionsForContextTokenIDs:length:maximumPredictions:maximumTokensPerPrediction:withBlock:", v9, -[NLTokenIDBasedLanguageModelState contextLength](self, "contextLength"), a3, a4, v8);

  if (v9)
  {
    free(v9);
  }
}

- (void).cxx_destruct
{
}

@end