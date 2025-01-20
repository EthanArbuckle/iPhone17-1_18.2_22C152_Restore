@interface NLLanguageModelSession
+ (void)performMaintenance;
+ (void)setLogLevel:(int64_t)a3;
- (NLLanguageModel)languageModel;
- (NLLanguageModelSession)initWithLanguageModel:(id)a3 options:(id)a4;
- (id)conditionalProbabilitiesForStrings:(id)a3 context:(id)a4;
- (id)conditionalProbabilitiesForTokens:(id)a3 context:(id)a4;
- (id)conditionalProbabilityForString:(id)a3 context:(id)a4;
- (id)conditionalProbabilityForToken:(id)a3 context:(id)a4;
- (id)stateWithOptions:(id)a3;
- (int64_t)blocklistStatusForString:(id)a3 matchType:(int64_t)a4;
@end

@implementation NLLanguageModelSession

- (NLLanguageModelSession)initWithLanguageModel:(id)a3 options:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLLanguageModelSession;
  v7 = [(NLLanguageModelSession *)&v10 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_languageModel, a3);
  }

  return v8;
}

- (id)conditionalProbabilityForToken:(id)a3 context:(id)a4
{
  v4 = [[NLProbabilityInfo alloc] initWithInvalidProbability];

  return v4;
}

- (id)conditionalProbabilitiesForTokens:(id)a3 context:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = -[NLLanguageModelSession conditionalProbabilityForToken:context:](self, "conditionalProbabilityForToken:context:", *(void *)(*((void *)&v16 + 1) + 8 * i), v7, (void)v16);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)conditionalProbabilityForString:(id)a3 context:(id)a4
{
  v4 = [[NLProbabilityInfo alloc] initWithInvalidProbability];

  return v4;
}

- (id)conditionalProbabilitiesForStrings:(id)a3 context:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = -[NLLanguageModelSession conditionalProbabilityForString:context:](self, "conditionalProbabilityForString:context:", *(void *)(*((void *)&v16 + 1) + 8 * i), v7, (void)v16);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (int64_t)blocklistStatusForString:(id)a3 matchType:(int64_t)a4
{
  return 0;
}

- (id)stateWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [[NLLanguageModelState alloc] initWithSession:self options:v4 context:&stru_1EFB303D0];

  return v5;
}

+ (void)performMaintenance
{
}

+ (void)setLogLevel:(int64_t)a3
{
}

- (NLLanguageModel)languageModel
{
  return self->_languageModel;
}

- (void).cxx_destruct
{
}

@end