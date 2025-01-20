@interface HKEnumeratedValueDataSource
- (NSArray)enumeratedValueOrder;
- (id)_enumeratedValueOrderMapping;
- (id)_enumeratedValuesToIndices:(id)a3 mapping:(id)a4;
- (id)queriesForRequest:(id)a3 completionHandler:(id)a4;
- (id)queryDescription;
- (id)userInfoCreationBlock;
- (void)_handleSamples:(id)a3 blockStart:(id)a4 blockEnd:(id)a5 intervalComponents:(id)a6 completion:(id)a7;
- (void)setEnumeratedValueOrder:(id)a3;
- (void)setUserInfoCreationBlock:(id)a3;
@end

@implementation HKEnumeratedValueDataSource

- (id)queryDescription
{
  v2 = NSString;
  v3 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  v4 = [v3 localization];
  v5 = [v4 displayName];
  v6 = [v2 stringWithFormat:@"HKEnumeratedValue(%@)", v5];

  return v6;
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F2B3C0];
  v9 = [v6 startDate];
  v10 = [v6 endDate];
  v11 = [v8 predicateForSamplesWithStartDate:v9 endDate:v10 options:0];

  v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*MEMORY[0x1E4F2A9B8] ascending:1];
  v13 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  v14 = [v13 sampleType];

  id v15 = objc_alloc(MEMORY[0x1E4F2B440]);
  v29[0] = v12;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __67__HKEnumeratedValueDataSource_queriesForRequest_completionHandler___block_invoke;
  v23[3] = &unk_1E6D561F8;
  id v24 = v14;
  v25 = self;
  id v26 = v6;
  id v27 = v7;
  id v17 = v7;
  id v18 = v6;
  id v19 = v14;
  v20 = (void *)[v15 initWithSampleType:v19 predicate:v11 limit:0 sortDescriptors:v16 resultsHandler:v23];

  [v20 setDebugIdentifier:@"charting (enumerated value)"];
  v28 = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];

  return v21;
}

void __67__HKEnumeratedValueDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v9)
  {
    int v11 = objc_msgSend(v9, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E4F29FB0];
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __68__HKHandwashingEventDataSource_queriesForRequest_completionHandler___block_invoke_cold_1();
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __68__HKHandwashingEventDataSource_queriesForRequest_completionHandler___block_invoke_cold_2();
    }
  }
  v13 = *(void **)(a1 + 40);
  v14 = [*(id *)(a1 + 48) startDate];
  id v15 = [*(id *)(a1 + 48) endDate];
  v16 = [*(id *)(a1 + 48) statisticsInterval];
  [v13 _handleSamples:v8 blockStart:v14 blockEnd:v15 intervalComponents:v16 completion:*(void *)(a1 + 56)];
}

- (void)_handleSamples:(id)a3 blockStart:(id)a4 blockEnd:(id)a5 intervalComponents:(id)a6 completion:(id)a7
{
  v12 = (void (**)(id, HKGraphSeriesDataBlock *, void))a7;
  v13 = [MEMORY[0x1E4F2B958] calculateIncludedValuesWithSamples:a3 startDate:a4 endDate:a5 intervalComponents:a6];
  v14 = [MEMORY[0x1E4F1CA48] array];
  id v15 = [(HKEnumeratedValueDataSource *)self _enumeratedValueOrderMapping];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __96__HKEnumeratedValueDataSource__handleSamples_blockStart_blockEnd_intervalComponents_completion___block_invoke;
  v19[3] = &unk_1E6D56220;
  v19[4] = self;
  id v16 = v15;
  id v20 = v16;
  id v17 = v14;
  id v21 = v17;
  [v13 enumerateKeysAndObjectsUsingBlock:v19];
  id v18 = objc_alloc_init(HKGraphSeriesDataBlock);
  [(HKGraphSeriesDataBlock *)v18 setChartPoints:v17];
  if (v12) {
    v12[2](v12, v18, 0);
  }
}

void __96__HKEnumeratedValueDataSource__handleSamples_blockStart_blockEnd_intervalComponents_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v13 = objc_alloc_init(HKEnumeratedValueChartPoint);
  id v7 = [*(id *)(a1 + 32) _enumeratedValuesToIndices:v5 mapping:*(void *)(a1 + 40)];

  id v8 = [v6 startDate];
  id v9 = [v6 endDate];

  v10 = HKUIMidDate(v8, v9);
  [(HKEnumeratedValueChartPoint *)v13 setXValue:v10];

  [(HKEnumeratedValueChartPoint *)v13 setIndices:v7];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 56);
  if (v11)
  {
    v12 = (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v7);
    [(HKEnumeratedValueChartPoint *)v13 setUserInfo:v12];
  }
  [*(id *)(a1 + 48) addObject:v13];
}

- (id)_enumeratedValueOrderMapping
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = self->_enumeratedValueOrder;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", v7 + i, (void)v13);
        [v3 setObject:v11 forKeyedSubscript:v10];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      v7 += i;
    }
    while (v6);
  }

  return v3;
}

- (id)_enumeratedValuesToIndices:(id)a3 mapping:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(v6, "objectForKeyedSubscript:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  long long v14 = [v7 sortedArrayUsingSelector:sel_compare_];

  return v14;
}

- (NSArray)enumeratedValueOrder
{
  return self->_enumeratedValueOrder;
}

- (void)setEnumeratedValueOrder:(id)a3
{
}

- (id)userInfoCreationBlock
{
  return self->_userInfoCreationBlock;
}

- (void)setUserInfoCreationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfoCreationBlock, 0);
  objc_storeStrong((id *)&self->_enumeratedValueOrder, 0);
}

@end