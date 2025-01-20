@interface NLNLPLanguageModelSession
- (NLNLPLanguageModelSession)initWithLanguageModel:(id)a3 options:(id)a4;
- (id)conditionalProbabilitiesForStrings:(id)a3 context:(id)a4;
- (id)conditionalProbabilityForString:(id)a3 context:(id)a4;
- (id)conditionalProbabilityForToken:(id)a3 context:(id)a4;
- (id)description;
- (id)predictionInitialCharacterSet;
- (id)predictionOptionsForMaximumPredictions:(unint64_t)a3 maximumTokensPerPrediction:(unint64_t)a4;
- (id)stateWithOptions:(id)a3;
- (void)dealloc;
- (void)enumeratePredictionsForContext:(id)a3 maximumPredictions:(unint64_t)a4 maximumTokensPerPrediction:(unint64_t)a5 withBlock:(id)a6;
@end

@implementation NLNLPLanguageModelSession

- (NLNLPLanguageModelSession)initWithLanguageModel:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 granularity];
  id v9 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v10 = [v7 localization];
  v11 = (uint64_t *)MEMORY[0x1E4F5C760];
  if (v8 != 1) {
    v11 = (uint64_t *)MEMORY[0x1E4F5C768];
  }
  uint64_t v12 = *v11;
  v13 = (void *)MEMORY[0x1E4F5C7C0];
  if (v8 != 1) {
    v13 = (void *)MEMORY[0x1E4F5C7C8];
  }
  v14 = objc_msgSend(v9, "initWithObjectsAndKeys:", v10, *MEMORY[0x1E4F5C798], v12, *MEMORY[0x1E4F5C758], *v13, *MEMORY[0x1E4F5C7D0], 0);

  v17.receiver = self;
  v17.super_class = (Class)NLNLPLanguageModelSession;
  v15 = [(NLLanguageModelSession *)&v17 initWithLanguageModel:v7 options:v6];

  if (v15) {
    v15->_model = (CoreLanguageModelWithState *)CoreLMCreate();
  }

  return v15;
}

- (void)dealloc
{
  model = self->_model;
  if (model) {
    CFRelease(model);
  }
  v4.receiver = self;
  v4.super_class = (Class)NLNLPLanguageModelSession;
  [(NLNLPLanguageModelSession *)&v4 dealloc];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v9.receiver = self;
  v9.super_class = (Class)NLNLPLanguageModelSession;
  objc_super v4 = [(NLNLPLanguageModelSession *)&v9 description];
  v5 = [(NLLanguageModelSession *)self languageModel];
  id v6 = [v5 localization];
  id v7 = objc_msgSend(v3, "stringWithFormat:", @"%@(%@"), v4, v6;

  if (self->_model) {
    objc_msgSend(v7, "appendFormat:", @":NLP:%p", self->_model);
  }
  [v7 appendString:@""]);

  return v7;
}

- (id)conditionalProbabilityForToken:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_model)
  {
    uint64_t v8 = (const void *)CoreLMCopyTokenIdsForText();
    CFArrayRef v9 = (const __CFArray *)CoreLMCopyTokenIdsForText();
    CFArrayRef v10 = v9;
    if (v8) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      uint64_t v12 = 0;
      if (!v8)
      {
        if (!v9) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
    else if (CFArrayGetCount(v9) == 1 && CoreLMUpdateWithContext())
    {
      CFArrayRef v14 = (const __CFArray *)CoreLMCopyConditionalProbabilities();
      if (v14)
      {
        CFArrayRef v15 = v14;
        if (CFArrayGetCount(v14) == 1
          && (CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v15, 0),
              double valuePtr = 0.0,
              CFNumberGetValue(ValueAtIndex, kCFNumberDoubleType, &valuePtr)))
        {
          objc_super v17 = [NLProbabilityInfo alloc];
          uint64_t v12 = [(NLProbabilityInfo *)v17 initWithProbability:0 flags:valuePtr];
        }
        else
        {
          uint64_t v12 = 0;
        }
        CFRelease(v15);
      }
      else
      {
        uint64_t v12 = 0;
      }
      CoreLMReset();
    }
    else
    {
      uint64_t v12 = 0;
    }
    CFRelease(v8);
    if (!v10)
    {
LABEL_10:
      if (v12) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
LABEL_9:
    CFRelease(v10);
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v12 = [[NLProbabilityInfo alloc] initWithInvalidProbability];
LABEL_12:

  return v12;
}

- (id)conditionalProbabilityForString:(id)a3 context:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_model)
  {
    uint64_t v8 = (const void *)CoreLMCopyTokenIdsForText();
    CFArrayRef v9 = (void *)CoreLMCopyTokenIdsForText();
    uint64_t v10 = [v9 count];
    if (v8) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      uint64_t v12 = 0;
      if (!v8) {
        goto LABEL_29;
      }
    }
    else
    {
      unint64_t v13 = v10;
      if (CoreLMUpdateWithContext())
      {
        id v25 = v6;
        unint64_t v15 = 0;
        double v16 = 1.0;
        while (1)
        {
          if (v13 == v15)
          {
            uint64_t v12 = [[NLProbabilityInfo alloc] initWithProbability:0 flags:v16];
            goto LABEL_27;
          }
          objc_super v17 = [v9 objectAtIndex:v15];
          v28[0] = v17;
          [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
          CFArrayRef v18 = (const __CFArray *)CoreLMCopyConditionalProbabilities();
          if (!v18) {
            break;
          }
          CFArrayRef v19 = v18;
          if (CFArrayGetCount(v18) == 1)
          {
            CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v19, 0);
            double valuePtr = 0.0;
            int Value = CFNumberGetValue(ValueAtIndex, kCFNumberDoubleType, &valuePtr);
            int v22 = Value != 0;
            double v23 = valuePtr;
            if (!Value) {
              double v23 = 1.0;
            }
            double v16 = v16 * v23;
          }
          else
          {
            int v22 = 0;
          }
          CFRelease(v19);
          ++v15;
          if (v22 && v15 < v13)
          {
            v27 = v17;
            [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
            int v22 = CoreLMUpdateWithContext();
          }

          if (!v22) {
            goto LABEL_26;
          }
        }

LABEL_26:
        uint64_t v12 = 0;
LABEL_27:
        id v6 = v25;
        CoreLMReset();
        if (v8) {
          goto LABEL_28;
        }
LABEL_29:

        if (v12) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
      uint64_t v12 = 0;
    }
LABEL_28:
    CFRelease(v8);
    goto LABEL_29;
  }
LABEL_30:
  uint64_t v12 = [[NLProbabilityInfo alloc] initWithInvalidProbability];
LABEL_31:

  return v12;
}

- (id)conditionalProbabilitiesForStrings:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_model && (uint64_t v8 = CoreLMCopyTokenIdsForText()) != 0)
  {
    CFArrayRef v9 = (const void *)v8;
    if (CoreLMUpdateWithContext())
    {
      uint64_t v10 = +[NLNLPLanguageModelNode conditionalProbabilitiesForStrings:v6 modelState:self->_model copyRequired:0];
      CoreLMReset();
    }
    else
    {
      uint64_t v10 = +[NLNLPLanguageModelNode conditionalProbabilitiesForStrings:v6 modelState:0 copyRequired:0];
    }
    CFRelease(v9);
  }
  else
  {
    uint64_t v10 = +[NLNLPLanguageModelNode conditionalProbabilitiesForStrings:v6 modelState:0 copyRequired:0];
  }

  return v10;
}

- (id)stateWithOptions:(id)a3
{
  id v4 = a3;
  if (self->_model && (uint64_t v5 = CoreLMCreateCopy()) != 0) {
    id v6 = [[NLNLPLanguageModelState alloc] initWithSession:self options:v4 context:&stru_1EFB303D0 modelState:v5];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)predictionOptionsForMaximumPredictions:(unint64_t)a3 maximumTokensPerPrediction:(unint64_t)a4
{
  v11[3] = *MEMORY[0x1E4F143B8];
  if (a3 <= 0xA) {
    a3 = 10;
  }
  v11[0] = *MEMORY[0x1E4F5C7A8];
  uint64_t v5 = *MEMORY[0x1E4F5C7B8];
  v10[0] = *MEMORY[0x1E4F5C7B0];
  v10[1] = v5;
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  v11[1] = v6;
  v10[2] = *MEMORY[0x1E4F5C7A0];
  id v7 = [NSNumber numberWithUnsignedInteger:a4];
  v11[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

- (id)predictionInitialCharacterSet
{
  if (predictionInitialCharacterSet_onceToken != -1) {
    dispatch_once(&predictionInitialCharacterSet_onceToken, &__block_literal_global_308);
  }
  v2 = (void *)predictionInitialCharacterSet_initialSet;

  return v2;
}

uint64_t __58__NLNLPLanguageModelSession_predictionInitialCharacterSet__block_invoke()
{
  predictionInitialCharacterSet_initialSet = [MEMORY[0x1E4F28B88] letterCharacterSet];

  return MEMORY[0x1F41817F8]();
}

- (void)enumeratePredictionsForContext:(id)a3 maximumPredictions:(unint64_t)a4 maximumTokensPerPrediction:(unint64_t)a5 withBlock:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = (void (**)(id, NLPredictionInfo *, unsigned char *))a6;
  if (self->_model)
  {
    uint64_t v11 = CoreLMCopyTokenIdsForText();
    if (v11)
    {
      uint64_t v12 = (const void *)v11;
      if (CoreLMUpdateWithContext())
      {
        v31 = v12;
        id v32 = v9;
        v30 = [(NLNLPLanguageModelSession *)self predictionOptionsForMaximumPredictions:a4 maximumTokensPerPrediction:a5];
        unint64_t v13 = (void *)CoreLMCopyPredictions();
        CFArrayRef v14 = [v13 keysSortedByValueUsingComparator:&__block_literal_global_311];
        unint64_t v15 = [(NLNLPLanguageModelSession *)self predictionInitialCharacterSet];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id obj = v14;
        uint64_t v16 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          unint64_t v18 = 0;
          uint64_t v19 = *(void *)v37;
LABEL_6:
          uint64_t v20 = 0;
          while (1)
          {
            if (*(void *)v37 != v19) {
              objc_enumerationMutation(obj);
            }
            v21 = *(void **)(*((void *)&v36 + 1) + 8 * v20);
            int v22 = [v13 objectForKey:v21];
            [v22 doubleValue];
            double v24 = v23;

            char v35 = 0;
            [v21 rangeOfCharacterFromSet:v15 options:8];
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
              v10[2](v10, v29, &v35);
              ++v18;
            }
            if (v35 || v18 >= a4) {
              break;
            }
            if (v17 == ++v20)
            {
              uint64_t v17 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
              if (v17) {
                goto LABEL_6;
              }
              break;
            }
          }
        }

        CoreLMReset();
        id v9 = v32;
        uint64_t v12 = v31;
      }
      CFRelease(v12);
    }
  }
}

uint64_t __116__NLNLPLanguageModelSession_enumeratePredictionsForContext_maximumPredictions_maximumTokensPerPrediction_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
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