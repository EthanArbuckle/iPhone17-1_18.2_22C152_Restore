@interface NLNLPLanguageModel
- (BOOL)generatesPredictions;
- (NLNLPLanguageModel)initWithLocalization:(id)a3 options:(id)a4;
- (double)conditionalProbabilityForEntry:(id)a3 context:(id)a4;
- (double)conditionalProbabilityForWord:(id)a3 context:(id)a4;
- (id)sessionWithOptions:(id)a3;
- (int64_t)granularity;
- (void)enumeratePredictionsForContext:(id)a3 maxEntriesPerPrediction:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumeratePredictionsForContext:(id)a3 maxWordsPerPrediction:(unint64_t)a4 usingBlock:(id)a5;
@end

@implementation NLNLPLanguageModel

- (NLNLPLanguageModel)initWithLocalization:(id)a3 options:(id)a4
{
  id v6 = a3;
  uint64_t v7 = granularityForOptions(a4);
  v10.receiver = self;
  v10.super_class = (Class)NLNLPLanguageModel;
  v8 = [(NLLanguageModel *)&v10 initWithLocalization:v6];

  if (v8) {
    v8->_granularity = v7;
  }
  return v8;
}

- (int64_t)granularity
{
  return self->_granularity;
}

- (BOOL)generatesPredictions
{
  return 1;
}

- (id)sessionWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [[NLNLPLanguageModelSession alloc] initWithLanguageModel:self options:v4];

  return v5;
}

- (double)conditionalProbabilityForEntry:(id)a3 context:(id)a4
{
  if (conditionalProbabilityForEntry_context__onceToken != -1) {
    dispatch_once(&conditionalProbabilityForEntry_context__onceToken, &__block_literal_global_3);
  }
  return -30.0;
}

void __61__NLNLPLanguageModel_conditionalProbabilityForEntry_context___block_invoke()
{
}

- (double)conditionalProbabilityForWord:(id)a3 context:(id)a4
{
  if (conditionalProbabilityForWord_context__onceToken != -1) {
    dispatch_once(&conditionalProbabilityForWord_context__onceToken, &__block_literal_global_280);
  }
  return -30.0;
}

void __60__NLNLPLanguageModel_conditionalProbabilityForWord_context___block_invoke()
{
}

- (void)enumeratePredictionsForContext:(id)a3 maxEntriesPerPrediction:(unint64_t)a4 usingBlock:(id)a5
{
  if (enumeratePredictionsForContext_maxEntriesPerPrediction_usingBlock__onceToken != -1) {
    dispatch_once(&enumeratePredictionsForContext_maxEntriesPerPrediction_usingBlock__onceToken, &__block_literal_global_285);
  }
}

void __88__NLNLPLanguageModel_enumeratePredictionsForContext_maxEntriesPerPrediction_usingBlock___block_invoke()
{
}

- (void)enumeratePredictionsForContext:(id)a3 maxWordsPerPrediction:(unint64_t)a4 usingBlock:(id)a5
{
  if (enumeratePredictionsForContext_maxWordsPerPrediction_usingBlock__onceToken != -1) {
    dispatch_once(&enumeratePredictionsForContext_maxWordsPerPrediction_usingBlock__onceToken, &__block_literal_global_290);
  }
}

void __86__NLNLPLanguageModel_enumeratePredictionsForContext_maxWordsPerPrediction_usingBlock___block_invoke()
{
}

@end