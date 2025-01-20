@interface DKHistogram
@end

@implementation DKHistogram

double __52___DKHistogram_addHistogram_decayingExistingCounts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 countForValueDouble:v7];
  double v9 = v8;
  [v6 doubleValue];
  double v11 = v10;

  double v12 = v9 + v11 * *(double *)(a1 + 56);
  v13 = [NSNumber numberWithDouble:v12];
  [*(id *)(*(void *)(a1 + 40) + 8) setObject:v13 forKeyedSubscript:v7];

  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  double result = v12 + *(double *)(v14 + 24);
  *(double *)(v14 + 24) = result;
  return result;
}

void __52___DKHistogram_addHistogram_decayingExistingCounts___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];

  if (!v6)
  {
    [*(id *)(*(void *)(a1 + 40) + 8) setObject:v5 forKeyedSubscript:v8];
    [v5 doubleValue];
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7
                                                                + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
  }
}

@end