@interface NLNLPLanguageModelState
- (NLNLPLanguageModelState)initWithSession:(id)a3 options:(id)a4 context:(id)a5 modelState:(void *)a6;
- (id)conditionalProbabilitiesForStrings:(id)a3;
- (id)conditionalProbabilityForString:(id)a3;
- (id)conditionalProbabilityForToken:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)addContext:(id)a3;
- (void)dealloc;
- (void)enumeratePredictions:(unint64_t)a3 maximumTokensPerPrediction:(unint64_t)a4 withBlock:(id)a5;
- (void)resetContext;
@end

@implementation NLNLPLanguageModelState

- (NLNLPLanguageModelState)initWithSession:(id)a3 options:(id)a4 context:(id)a5 modelState:(void *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)NLNLPLanguageModelState;
  result = [(NLLanguageModelState *)&v8 initWithSession:a3 options:a4 context:a5];
  if (result) {
    result->_modelState = (CoreLanguageModelWithState *)a6;
  }
  return result;
}

- (void)dealloc
{
  modelState = self->_modelState;
  if (modelState) {
    CFRelease(modelState);
  }
  v4.receiver = self;
  v4.super_class = (Class)NLNLPLanguageModelState;
  [(NLNLPLanguageModelState *)&v4 dealloc];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v7.receiver = self;
  v7.super_class = (Class)NLNLPLanguageModelState;
  objc_super v4 = [(NLLanguageModelState *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@", v4];

  if (self->_modelState) {
    objc_msgSend(v5, "appendFormat:", @"(NLP:%p)", self->_modelState);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (!self->_modelState) {
    return 0;
  }
  uint64_t v4 = CoreLMCreateCopy();
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  v6 = [NLNLPLanguageModelState alloc];
  objc_super v7 = [(NLLanguageModelState *)self session];
  objc_super v8 = [(NLLanguageModelState *)self options];
  v9 = [(NLLanguageModelState *)self context];
  v10 = [(NLNLPLanguageModelState *)v6 initWithSession:v7 options:v8 context:v9 modelState:v5];

  return v10;
}

- (void)addContext:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NLNLPLanguageModelState;
  [(NLLanguageModelState *)&v7 addContext:v4];
  if (self->_modelState)
  {
    uint64_t v5 = CoreLMCopyTokenIdsForText();
    if (v5)
    {
      v6 = (const void *)v5;
      CoreLMUpdateWithContext();
      CFRelease(v6);
    }
  }
}

- (void)resetContext
{
  v3.receiver = self;
  v3.super_class = (Class)NLNLPLanguageModelState;
  [(NLLanguageModelState *)&v3 resetContext];
  if (self->_modelState) {
    CoreLMReset();
  }
}

- (id)conditionalProbabilityForToken:(id)a3
{
  id v4 = a3;
  if (!self->_modelState) {
    goto LABEL_9;
  }
  CFArrayRef v5 = (const __CFArray *)CoreLMCopyTokenIdsForText();
  if (!v5) {
    goto LABEL_9;
  }
  CFArrayRef v6 = v5;
  if (CFArrayGetCount(v5) != 1 || (CFArrayRef v7 = (const __CFArray *)CoreLMCopyConditionalProbabilities()) == 0)
  {
    CFRelease(v6);
LABEL_9:
    v11 = [[NLProbabilityInfo alloc] initWithInvalidProbability];
    goto LABEL_10;
  }
  CFArrayRef v8 = v7;
  if (CFArrayGetCount(v7) == 1
    && (CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v8, 0),
        double valuePtr = 0.0,
        CFNumberGetValue(ValueAtIndex, kCFNumberDoubleType, &valuePtr)))
  {
    v10 = [NLProbabilityInfo alloc];
    v11 = [(NLProbabilityInfo *)v10 initWithProbability:0 flags:valuePtr];
  }
  else
  {
    v11 = 0;
  }
  CFRelease(v8);
  CFRelease(v6);
  if (!v11) {
    goto LABEL_9;
  }
LABEL_10:

  return v11;
}

- (id)conditionalProbabilityForString:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  modelState = self->_modelState;
  if (!modelState) {
    goto LABEL_28;
  }
  CFArrayRef v6 = (void *)CoreLMCopyTokenIdsForText();
  unint64_t v7 = [v6 count];
  if (v7 < 2)
  {
    BOOL v8 = 0;
  }
  else
  {
    modelState = (const void *)CoreLMCreateCopy();
    BOOL v8 = modelState != 0;
  }
  if (!v6 || modelState == 0)
  {
LABEL_25:
    v19 = 0;
    if (v8) {
LABEL_26:
    }
      CFRelease(modelState);
  }
  else
  {
    uint64_t v10 = 0;
    double v11 = 1.0;
    while (v7 != v10)
    {
      v12 = [v6 objectAtIndex:v10];
      v23[0] = v12;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      CFArrayRef v13 = (const __CFArray *)CoreLMCopyConditionalProbabilities();
      if (!v13)
      {

        goto LABEL_25;
      }
      CFArrayRef v14 = v13;
      if (CFArrayGetCount(v13) == 1)
      {
        CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v14, 0);
        double v21 = 0.0;
        int Value = CFNumberGetValue(ValueAtIndex, kCFNumberDoubleType, &v21);
        int v17 = Value != 0;
        double v18 = v21;
        if (!Value) {
          double v18 = 1.0;
        }
        double v11 = v11 * v18;
      }
      else
      {
        int v17 = 0;
      }
      CFRelease(v14);
      if (++v10 < v7 && v17)
      {
        v22 = v12;
        [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
        int v17 = CoreLMUpdateWithContext();
      }

      if (!v17) {
        goto LABEL_25;
      }
    }
    v19 = [[NLProbabilityInfo alloc] initWithProbability:0 flags:v11];
    if (v8) {
      goto LABEL_26;
    }
  }

  if (!v19) {
LABEL_28:
  }
    v19 = [[NLProbabilityInfo alloc] initWithInvalidProbability];

  return v19;
}

- (id)conditionalProbabilitiesForStrings:(id)a3
{
  return +[NLNLPLanguageModelNode conditionalProbabilitiesForStrings:a3 modelState:self->_modelState copyRequired:1];
}

- (void)enumeratePredictions:(unint64_t)a3 maximumTokensPerPrediction:(unint64_t)a4 withBlock:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  BOOL v8 = (void (**)(id, NLPredictionInfo *, unsigned char *))a5;
  if (self->_modelState)
  {
    v9 = [(NLLanguageModelState *)self session];
    uint64_t v10 = [v9 predictionOptionsForMaximumPredictions:a3 maximumTokensPerPrediction:a4];

    v30 = (void *)v10;
    double v11 = (void *)CoreLMCopyPredictions();
    v12 = [v11 keysSortedByValueUsingComparator:&__block_literal_global_380];
    CFArrayRef v13 = [(NLLanguageModelState *)self session];
    CFArrayRef v14 = [v13 predictionInitialCharacterSet];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v12;
    uint64_t v15 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      unint64_t v17 = a3;
      unint64_t v18 = 0;
      uint64_t v19 = *(void *)v35;
      unint64_t v32 = v17;
LABEL_4:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v35 != v19) {
          objc_enumerationMutation(obj);
        }
        double v21 = *(void **)(*((void *)&v34 + 1) + 8 * v20);
        v22 = [v11 objectForKey:v21];
        [v22 doubleValue];
        double v24 = v23;

        char v33 = 0;
        [v21 rangeOfCharacterFromSet:v14 options:8];
        if (v25)
        {
          v26 = [[NLProbabilityInfo alloc] initWithProbability:0 flags:v24];
          if ((unint64_t)[v21 length] >= 2
            && ([v21 hasSuffix:@" "] & 1) != 0)
          {
            objc_msgSend(v21, "substringToIndex:", objc_msgSend(v21, "length") - 1);
            id v27 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v27 = v21;
          }
          v28 = v27;
          v29 = [[NLPredictionInfo alloc] initWithPrediction:v27 probabilityInfo:v26];
          v8[2](v8, v29, &v33);
          ++v18;

          unint64_t v17 = v32;
        }
        if (v33 || v18 >= v17) {
          break;
        }
        if (v16 == ++v20)
        {
          uint64_t v16 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
          if (v16) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

uint64_t __85__NLNLPLanguageModelState_enumeratePredictions_maximumTokensPerPrediction_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 doubleValue];
  double v6 = v5;
  [v4 doubleValue];
  double v8 = v7;

  if (v6 > v8) {
    return -1;
  }
  else {
    return v6 < v8;
  }
}

@end