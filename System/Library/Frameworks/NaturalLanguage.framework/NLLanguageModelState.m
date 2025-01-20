@interface NLLanguageModelState
- (NLLanguageModelSession)session;
- (NLLanguageModelState)initWithSession:(id)a3 options:(id)a4 context:(id)a5;
- (NSString)context;
- (id)conditionalProbabilitiesForStrings:(id)a3;
- (id)conditionalProbabilitiesForTokens:(id)a3;
- (id)conditionalProbabilityForString:(id)a3;
- (id)conditionalProbabilityForToken:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)options;
- (void)addContext:(id)a3;
- (void)enumeratePredictions:(unint64_t)a3 maximumTokensPerPrediction:(unint64_t)a4 withBlock:(id)a5;
- (void)resetContext;
@end

@implementation NLLanguageModelState

- (NLLanguageModelState)initWithSession:(id)a3 options:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NLLanguageModelState;
  v12 = [(NLLanguageModelState *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_session, a3);
    objc_storeStrong((id *)&v13->_options, a4);
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v11];
    context = v13->_context;
    v13->_context = (NSMutableString *)v14;
  }
  return v13;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)NLLanguageModelState;
  v4 = [(NLLanguageModelState *)&v11 description];
  v5 = [(NLLanguageModelState *)self session];
  v6 = [v5 languageModel];
  v7 = [v6 localization];
  v8 = [(NLLanguageModelState *)self context];
  id v9 = [v3 stringWithFormat:@"%@(%@)<%@>", v4, v7, v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(NLLanguageModelState *)self session];
  v6 = [(NLLanguageModelState *)self options];
  v7 = [(NLLanguageModelState *)self context];
  v8 = (void *)[v4 initWithSession:v5 options:v6 context:v7];

  return v8;
}

- (void)addContext:(id)a3
{
}

- (void)resetContext
{
  context = self->_context;
  uint64_t v3 = [(NSMutableString *)context length];

  -[NSMutableString deleteCharactersInRange:](context, "deleteCharactersInRange:", 0, v3);
}

- (id)options
{
  return self->_options;
}

- (NSString)context
{
  return (NSString *)self->_context;
}

- (id)conditionalProbabilityForToken:(id)a3
{
  id v4 = a3;
  v5 = [(NLLanguageModelState *)self session];
  v6 = [(NLLanguageModelState *)self context];
  v7 = [v5 conditionalProbabilityForToken:v4 context:v6];

  return v7;
}

- (id)conditionalProbabilitiesForTokens:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = -[NLLanguageModelState conditionalProbabilityForToken:](self, "conditionalProbabilityForToken:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)conditionalProbabilityForString:(id)a3
{
  id v4 = a3;
  v5 = [(NLLanguageModelState *)self session];
  id v6 = [(NLLanguageModelState *)self context];
  uint64_t v7 = [v5 conditionalProbabilityForString:v4 context:v6];

  return v7;
}

- (id)conditionalProbabilitiesForStrings:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = -[NLLanguageModelState conditionalProbabilityForString:](self, "conditionalProbabilityForString:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)enumeratePredictions:(unint64_t)a3 maximumTokensPerPrediction:(unint64_t)a4 withBlock:(id)a5
{
  id v8 = a5;
  id v10 = [(NLLanguageModelState *)self session];
  uint64_t v9 = [(NLLanguageModelState *)self context];
  [v10 enumeratePredictionsForContext:v9 maximumPredictions:a3 maximumTokensPerPrediction:a4 withBlock:v8];
}

- (NLLanguageModelSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end