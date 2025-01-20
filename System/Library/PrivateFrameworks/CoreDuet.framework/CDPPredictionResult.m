@interface CDPPredictionResult
@end

@implementation CDPPredictionResult

uint64_t __38___CDPPredictionResult_rankedMembers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:a2];
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v6];

  if (v8 | v7) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = 0;
  }
  if (v8) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v9;
  }
  if (v8) {
    BOOL v11 = v7 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11) {
    uint64_t v10 = [(id)v8 compare:v7];
  }

  return v10;
}

BOOL __54___CDPPredictionResult_rankedMembersPassingThreshold___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:a2];
  [v3 doubleValue];
  BOOL v5 = v4 >= *(double *)(a1 + 40);

  return v5;
}

@end