@interface DKPredictionQuery
@end

@implementation DKPredictionQuery

uint64_t __48___DKPredictionQuery_predictionOfType_withData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 objectForKeyedSubscript:@"startDate"];
  v6 = [v4 objectForKeyedSubscript:@"startDate"];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __67___DKPredictionQuery_likelihoodForTopN_withMinLikelihood_withData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 objectForKeyedSubscript:@"startDate"];
  v6 = [v4 objectForKeyedSubscript:@"startDate"];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __67___DKPredictionQuery_likelihoodForTopN_withMinLikelihood_withData___block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:a2];
  v8 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  uint64_t v9 = [v7 countForObject:v8];

  v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  v11 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  uint64_t v12 = [v10 countForObject:v11];

  uint64_t v13 = 1;
  if (v9 <= v12) {
    uint64_t v13 = -1;
  }
  if (v9 == v12) {
    return 0;
  }
  else {
    return v13;
  }
}

@end