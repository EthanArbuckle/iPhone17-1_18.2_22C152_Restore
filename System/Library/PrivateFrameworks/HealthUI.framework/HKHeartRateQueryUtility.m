@interface HKHeartRateQueryUtility
+ (id)_minMaxStatisticsFromChartPoints:(id)a3 dateInterval:(id)a4;
+ (id)_orderedDisplayTypeContextResults:(id)a3;
+ (void)enumerateDisplayTypeContextsWithBlock:(id)a3;
- (HKHeartRateQueryHandler)queryHandler;
- (HKHeartRateQueryUtility)initWithQueryHandler:(id)a3 dateInterval:(id)a4 timeScope:(int64_t)a5 resultsHandler:(id)a6;
- (NSDateInterval)dateInterval;
- (NSMutableDictionary)sampleResults;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_queue)resourceQueue;
- (id)resultsHandler;
- (int64_t)timeScope;
- (void)setClientQueue:(id)a3;
- (void)setDateInterval:(id)a3;
- (void)setQueryHandler:(id)a3;
- (void)setResourceQueue:(id)a3;
- (void)setResultsHandler:(id)a3;
- (void)setSampleResults:(id)a3;
- (void)setTimeScope:(int64_t)a3;
- (void)setupQueries;
@end

@implementation HKHeartRateQueryUtility

- (HKHeartRateQueryUtility)initWithQueryHandler:(id)a3 dateInterval:(id)a4 timeScope:(int64_t)a5 resultsHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HKHeartRateQueryUtility;
  v13 = [(HKHeartRateQueryUtility *)&v19 init];
  v14 = v13;
  if (v13)
  {
    [(HKHeartRateQueryUtility *)v13 setQueryHandler:v10];
    [(HKHeartRateQueryUtility *)v14 setDateInterval:v11];
    [(HKHeartRateQueryUtility *)v14 setTimeScope:a5];
    [(HKHeartRateQueryUtility *)v14 setResultsHandler:v12];
    v15 = HKCreateSerialDispatchQueue();
    [(HKHeartRateQueryUtility *)v14 setClientQueue:v15];

    v16 = HKCreateSerialDispatchQueue();
    [(HKHeartRateQueryUtility *)v14 setResourceQueue:v16];

    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(HKHeartRateQueryUtility *)v14 setSampleResults:v17];

    [(HKHeartRateQueryUtility *)v14 setupQueries];
  }

  return v14;
}

- (void)setupQueries
{
  dispatch_group_t v3 = dispatch_group_create();
  objc_initWeak(&location, self);
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy_;
  v12[4] = __Block_byref_object_dispose_;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__HKHeartRateQueryUtility_setupQueries__block_invoke;
  v7[3] = &unk_1E6D50F50;
  v4 = v3;
  v8 = v4;
  v9 = self;
  objc_copyWeak(&v11, &location);
  id v10 = v12;
  +[HKHeartRateQueryUtility enumerateDisplayTypeContextsWithBlock:v7];
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__HKHeartRateQueryUtility_setupQueries__block_invoke_4;
  block[3] = &unk_1E6D50F78;
  block[4] = self;
  block[5] = v12;
  dispatch_group_notify(v4, clientQueue, block);
  objc_destroyWeak(&v11);

  _Block_object_dispose(v12, 8);
  objc_destroyWeak(&location);
}

void __39__HKHeartRateQueryUtility_setupQueries__block_invoke(uint64_t a1, void *a2)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v4 = [*(id *)(a1 + 40) queryHandler];
  v5 = [*(id *)(a1 + 40) dateInterval];
  uint64_t v6 = [*(id *)(a1 + 40) timeScope];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__HKHeartRateQueryUtility_setupQueries__block_invoke_2;
  v9[3] = &unk_1E6D50F28;
  objc_copyWeak(v12, (id *)(a1 + 56));
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  id v10 = v7;
  uint64_t v11 = v8;
  v12[1] = a2;
  [v4 dataForHeartRateContext:a2 dateInterval:v5 timeScope:v6 resultsHandler:v9];

  objc_destroyWeak(v12);
}

void __39__HKHeartRateQueryUtility_setupQueries__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = [WeakRetained resourceQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __39__HKHeartRateQueryUtility_setupQueries__block_invoke_3;
    v13[3] = &unk_1E6D50F00;
    uint64_t v18 = *(void *)(a1 + 40);
    id v14 = v7;
    v15 = v9;
    id v11 = v6;
    uint64_t v12 = *(void *)(a1 + 56);
    id v16 = v11;
    uint64_t v19 = v12;
    id v17 = *(id *)(a1 + 32);
    dispatch_async(v10, v13);
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __39__HKHeartRateQueryUtility_setupQueries__block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  if (!v2) {
    v2 = *(void **)(v3 + 40);
  }
  objc_storeStrong((id *)(v3 + 40), v2);
  v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = [*(id *)(a1 + 40) dateInterval];
  id v10 = [v4 _minMaxStatisticsFromChartPoints:v5 dateInterval:v6];

  id v7 = [[HKHeartRateDisplayTypeContextResult alloc] initWithContext:*(void *)(a1 + 72) statistics:v10];
  uint64_t v8 = [*(id *)(a1 + 40) sampleResults];
  v9 = [NSNumber numberWithInteger:*(void *)(a1 + 72)];
  [v8 setObject:v7 forKeyedSubscript:v9];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __39__HKHeartRateQueryUtility_setupQueries__block_invoke_4(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) resultsHandler];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  v4 = [*(id *)(a1 + 32) sampleResults];
  uint64_t v5 = [v3 _orderedDisplayTypeContextResults:v4];
  v6[2](v6, v2, v5, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

+ (void)enumerateDisplayTypeContextsWithBlock:(id)a3
{
  for (uint64_t i = 0; i != 7; ++i)
    (*((void (**)(id, uint64_t))a3 + 2))(a3, i);
}

+ (id)_minMaxStatisticsFromChartPoints:(id)a3 dateInterval:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5 || ![v5 count])
  {
    v21 = 0;
    goto LABEL_21;
  }
  v33 = v6;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (!v8)
  {
    id v10 = 0;
    id v11 = 0;
    goto LABEL_20;
  }
  uint64_t v9 = v8;
  id v10 = 0;
  id v11 = 0;
  uint64_t v12 = *(void *)v35;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v35 != v12) {
        objc_enumerationMutation(v7);
      }
      id v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      if (!v11
        || ([*(id *)(*((void *)&v34 + 1) + 8 * i) minYValue],
            v15 = objc_claimAutoreleasedReturnValue(),
            uint64_t v16 = [v15 compare:v11],
            v15,
            v16 == -1))
      {
        uint64_t v17 = [v14 minYValue];

        id v11 = (void *)v17;
        if (v10)
        {
LABEL_13:
          uint64_t v18 = [v14 maxYValue];
          uint64_t v19 = [v18 compare:v10];

          if (v19 != 1) {
            continue;
          }
        }
      }
      else if (v10)
      {
        goto LABEL_13;
      }
      uint64_t v20 = [v14 maxYValue];

      id v10 = (void *)v20;
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
  }
  while (v9);
LABEL_20:

  v22 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
  id v23 = objc_alloc(MEMORY[0x1E4F2B5B0]);
  id v6 = v33;
  v24 = [v33 startDate];
  v25 = [v33 endDate];
  v21 = (void *)[v23 initWithDataType:v22 startDate:v24 endDate:v25];

  v26 = (void *)MEMORY[0x1E4F2B370];
  v27 = [MEMORY[0x1E4F2B618] _countPerMinuteUnit];
  [v11 doubleValue];
  v28 = objc_msgSend(v26, "quantityWithUnit:doubleValue:", v27);
  [v21 setMinimumQuantity:v28];

  v29 = (void *)MEMORY[0x1E4F2B370];
  v30 = [MEMORY[0x1E4F2B618] _countPerMinuteUnit];
  [v10 doubleValue];
  v31 = objc_msgSend(v29, "quantityWithUnit:doubleValue:", v30);
  [v21 setMaximumQuantity:v31];

LABEL_21:
  return v21;
}

+ (id)_orderedDisplayTypeContextResults:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__HKHeartRateQueryUtility__orderedDisplayTypeContextResults___block_invoke;
  v10[3] = &unk_1E6D50FA0;
  id v11 = v3;
  id v5 = v4;
  id v12 = v5;
  id v6 = v3;
  +[HKHeartRateQueryUtility enumerateDisplayTypeContextsWithBlock:v10];
  id v7 = v12;
  id v8 = v5;

  return v8;
}

void __61__HKHeartRateQueryUtility__orderedDisplayTypeContextResults___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [NSNumber numberWithInteger:a2];
  id v6 = [v3 objectForKeyedSubscript:v4];

  id v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 40) addObject:v6];
    id v5 = v6;
  }
}

- (HKHeartRateQueryHandler)queryHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queryHandler);
  return (HKHeartRateQueryHandler *)WeakRetained;
}

- (void)setQueryHandler:(id)a3
{
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (void)setTimeScope:(int64_t)a3
{
  self->_timeScope = a3;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
}

- (OS_dispatch_queue)resourceQueue
{
  return self->_resourceQueue;
}

- (void)setResourceQueue:(id)a3
{
}

- (NSMutableDictionary)sampleResults
{
  return self->_sampleResults;
}

- (void)setSampleResults:(id)a3
{
}

- (id)resultsHandler
{
  return self->_resultsHandler;
}

- (void)setResultsHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsHandler, 0);
  objc_storeStrong((id *)&self->_sampleResults, 0);
  objc_storeStrong((id *)&self->_resourceQueue, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_destroyWeak((id *)&self->_queryHandler);
}

@end