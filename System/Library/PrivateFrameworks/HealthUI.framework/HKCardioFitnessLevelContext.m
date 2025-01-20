@interface HKCardioFitnessLevelContext
@end

@implementation HKCardioFitnessLevelContext

void __106___HKCardioFitnessLevelContext__updateContextItemWithChartPointCountForDateInterval_timeScope_completion___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = v5;
  if (a3)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v13 = [v12 userInfo];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v15 = [v12 userInfo];
            if ([v15 classification] == *(void *)(*(void *)(a1 + 32) + 40)) {
              ++v9;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v9 = 0;
    }
    v17 = *(void **)(a1 + 32);
    uint64_t v18 = [v17 cardioFitnessLevel];
    v19 = [NSNumber numberWithInteger:v9];
    v20 = [v17 _cardioFitnessContextItemWithLevel:v18 chartPointCount:v19 forTimeScope:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) setLastUpdatedItem:v20];

    v16 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    v16 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v16();
}

void __102___HKCardioFitnessLevelContext__updateContextItemWithSampleCountForDateInterval_timeScope_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (v7)
  {
    v4 = [*(id *)(*(void *)(a1 + 32) + 72) sampleType];
    id v5 = [v7 objectForKeyedSubscript:v4];

    v6 = objc_msgSend(*(id *)(a1 + 32), "_cardioFitnessContextItemWithLevel:sampleCount:", objc_msgSend(*(id *)(a1 + 32), "cardioFitnessLevel"), v5);
    [*(id *)(a1 + 32) setLastUpdatedItem:v6];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

@end