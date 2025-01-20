@interface HKStatisticsCollectionQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (BOOL)_comparisonPredicateContainsStrictStartOrEndDateComparisonPredicate:(id)a3;
- (BOOL)_predicateContainsStrictStartOrEndDateComparisonPredicate:(id)a3;
- (BOOL)queue_shouldDeactivateAfterInitialResults;
- (HKStatisticsCollection)statisticsCollection;
- (HKStatisticsCollectionCacheSettings)cacheSettings;
- (HKStatisticsCollectionQuery)initWithQuantityType:(HKQuantityType *)quantityType quantitySamplePredicate:(NSPredicate *)quantitySamplePredicate options:(HKStatisticsOptions)options anchorDate:(NSDate *)anchorDate intervalComponents:(NSDateComponents *)intervalComponents;
- (HKStatisticsCollectionQuery)initWithSampleType:(id)a3 samplePredicate:(id)a4 options:(unint64_t)a5 anchorDate:(id)a6 intervalComponents:(id)a7;
- (HKStatisticsOptions)options;
- (NSDate)anchorDate;
- (NSDateComponents)intervalComponents;
- (NSDateInterval)dateInterval;
- (NSNumber)lastAnchor;
- (id)unitTest_finishedCachingStatisticsHandler;
- (unint64_t)mergeStrategy;
- (void)_queue_deliverInitialStatisticsObjects:(id)a3 anchor:(id)a4 queryUUID:(id)a5;
- (void)_queue_deliverResetStatisticsObjects:(id)a3 forQuery:(id)a4;
- (void)_queue_deliverStatisticsObjects:(id)a3 forQuery:(id)a4;
- (void)client_deliverStatisticsBatch:(id)a3 resetStatistics:(BOOL)a4 isFinal:(BOOL)a5 anchor:(id)a6 query:(id)a7;
- (void)client_deliverUpdatedStatistics:(id)a3 anchor:(id)a4 query:(id)a5;
- (void)client_finishedCachingStatisticsWithCacheHits:(int64_t)a3 error:(id)a4;
- (void)initialResultsHandler;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
- (void)setCacheSettings:(id)a3;
- (void)setDateInterval:(id)a3;
- (void)setInitialResultsHandler:(void *)initialResultsHandler;
- (void)setLastAnchor:(id)a3;
- (void)setMergeStrategy:(unint64_t)a3;
- (void)setStatisticsCollection:(id)a3;
- (void)setStatisticsUpdateHandler:(void *)statisticsUpdateHandler;
- (void)setUnitTest_finishedCachingStatisticsHandler:(id)a3;
- (void)statisticsUpdateHandler;
@end

@implementation HKStatisticsCollectionQuery

- (HKStatisticsCollectionQuery)initWithQuantityType:(HKQuantityType *)quantityType quantitySamplePredicate:(NSPredicate *)quantitySamplePredicate options:(HKStatisticsOptions)options anchorDate:(NSDate *)anchorDate intervalComponents:(NSDateComponents *)intervalComponents
{
  result = [(HKStatisticsCollectionQuery *)self initWithSampleType:quantityType samplePredicate:quantitySamplePredicate options:options anchorDate:anchorDate intervalComponents:intervalComponents];
  if (result) {
    result->_requireQuantityType = 1;
  }
  return result;
}

- (HKStatisticsCollectionQuery)initWithSampleType:(id)a3 samplePredicate:(id)a4 options:(unint64_t)a5 anchorDate:(id)a6 intervalComponents:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HKStatisticsCollectionQuery;
  v15 = [(HKQuery *)&v22 _initWithObjectType:a3 predicate:a4];
  v16 = v15;
  if (v15)
  {
    v15->_options = a5;
    objc_storeStrong((id *)&v15->_anchorDate, a6);
    uint64_t v17 = [v14 copy];
    intervalComponents = v16->_intervalComponents;
    v16->_intervalComponents = (NSDateComponents *)v17;

    v16->_mergeStrategy = 0;
    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    results = v16->_results;
    v16->_results = v19;
  }
  return v16;
}

- (void)setInitialResultsHandler:(void *)initialResultsHandler
{
  v5 = initialResultsHandler;
  [(HKQuery *)self _throwInvalidArgumentExceptionIfHasBeenExecuted:a2];
  v6 = [(HKQuery *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__HKStatisticsCollectionQuery_setInitialResultsHandler___block_invoke;
  v8[3] = &unk_1E58BB978;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(v6, v8);
}

uint64_t __56__HKStatisticsCollectionQuery_setInitialResultsHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 192);
  *(void *)(v3 + 192) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setStatisticsUpdateHandler:(void *)statisticsUpdateHandler
{
  v5 = statisticsUpdateHandler;
  [(HKQuery *)self _throwInvalidArgumentExceptionIfHasBeenExecuted:a2];
  v6 = [(HKQuery *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__HKStatisticsCollectionQuery_setStatisticsUpdateHandler___block_invoke;
  v8[3] = &unk_1E58BB978;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(v6, v8);
}

uint64_t __58__HKStatisticsCollectionQuery_setStatisticsUpdateHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 200);
  *(void *)(v3 + 200) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setMergeStrategy:(unint64_t)a3
{
  [(HKQuery *)self _throwInvalidArgumentExceptionIfHasBeenExecuted:a2];
  v5 = [(HKQuery *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__HKStatisticsCollectionQuery_setMergeStrategy___block_invoke;
  v6[3] = &unk_1E58BD9D0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

uint64_t __48__HKStatisticsCollectionQuery_setMergeStrategy___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 248) = *(void *)(result + 40);
  return result;
}

- (void)setDateInterval:(id)a3
{
  id v5 = a3;
  [(HKQuery *)self _throwInvalidArgumentExceptionIfHasBeenExecuted:a2];
  v6 = [(HKQuery *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__HKStatisticsCollectionQuery_setDateInterval___block_invoke;
  v8[3] = &unk_1E58BBBD0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(v6, v8);
}

uint64_t __47__HKStatisticsCollectionQuery_setDateInterval___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 224);
  *(void *)(v3 + 224) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setCacheSettings:(id)a3
{
  id v5 = a3;
  [(HKQuery *)self _throwInvalidArgumentExceptionIfHasBeenExecuted:a2];
  v6 = [(HKQuery *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__HKStatisticsCollectionQuery_setCacheSettings___block_invoke;
  v8[3] = &unk_1E58BBBD0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(v6, v8);
}

uint64_t __48__HKStatisticsCollectionQuery_setCacheSettings___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 232);
  *(void *)(v3 + 232) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED239A0;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKStatisticsCollectionQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverStatisticsBatch_resetStatistics_isFinal_anchor_query_, 0, 0);
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKStatisticsCollectionQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setAnchorDate:", self->_anchorDate, v5.receiver, v5.super_class);
  [v4 setOptions:self->_options];
  [v4 setIntervalComponents:self->_intervalComponents];
  [v4 setMergeStrategy:self->_mergeStrategy];
  [v4 setDateInterval:self->_dateInterval];
  [v4 setCacheSettings:self->_cacheSettings];
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKStatisticsCollectionQuery;
  [(HKQuery *)&v8 queue_queryDidDeactivate:a3];
  lastAnchor = self->_lastAnchor;
  self->_lastAnchor = 0;

  statisticsCollection = self->_statisticsCollection;
  self->_statisticsCollection = 0;

  id initialResultsHandler = self->_initialResultsHandler;
  self->_id initialResultsHandler = 0;

  id statisticsUpdateHandler = self->_statisticsUpdateHandler;
  self->_id statisticsUpdateHandler = 0;
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return !self->_statisticsUpdateHandler && self->_unitTest_finishedCachingStatisticsHandler == 0;
}

- (void)queue_validate
{
  uint64_t v2 = *a1;
  id v3 = a2;
  id v4 = [v2 identifier];
  OUTLINED_FUNCTION_0_0(&dword_19C023000, v5, v6, "Not using cached results for query with caching identifier %@ due to nil dateInterval", v7, v8, v9, v10, 2u);
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  if (self->_hasReceivedInitialResults)
  {
    id v5 = _Block_copy(self->_statisticsUpdateHandler);
    if (v5)
    {
      uint64_t v6 = [(HKQuery *)self clientQueue];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __50__HKStatisticsCollectionQuery_queue_deliverError___block_invoke_2;
      v10[3] = &unk_1E58BB9A0;
      uint64_t v7 = &v12;
      id v5 = v5;
      id v12 = v5;
      v10[4] = self;
      uint64_t v8 = &v11;
      id v11 = v4;
      uint64_t v9 = v10;
LABEL_6:
      dispatch_async(v6, v9);
    }
  }
  else
  {
    id v5 = _Block_copy(self->_initialResultsHandler);
    if (v5)
    {
      uint64_t v6 = [(HKQuery *)self clientQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__HKStatisticsCollectionQuery_queue_deliverError___block_invoke;
      block[3] = &unk_1E58BB9A0;
      uint64_t v7 = &v15;
      id v5 = v5;
      id v15 = v5;
      block[4] = self;
      uint64_t v8 = &v14;
      id v14 = v4;
      uint64_t v9 = block;
      goto LABEL_6;
    }
  }
}

uint64_t __50__HKStatisticsCollectionQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

uint64_t __50__HKStatisticsCollectionQuery_queue_deliverError___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, 0, a1[5]);
}

- (void)client_deliverStatisticsBatch:(id)a3 resetStatistics:(BOOL)a4 isFinal:(BOOL)a5 anchor:(id)a6 query:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__HKStatisticsCollectionQuery_client_deliverStatisticsBatch_resetStatistics_isFinal_anchor_query___block_invoke;
  block[3] = &unk_1E58C7DE0;
  BOOL v23 = a4;
  block[4] = self;
  id v20 = v12;
  BOOL v24 = a5;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(v15, block);
}

uint64_t __98__HKStatisticsCollectionQuery_client_deliverStatisticsBatch_resetStatistics_isFinal_anchor_query___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 64))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v3 = *(void *)(v1 + 32);
    id v4 = *(void **)(v3 + 176);
    *(void *)(v3 + 176) = v2;

    uint64_t v5 = *(void *)(v1 + 32);
    uint64_t v6 = *(void **)(v5 + 208);
    *(void *)(v5 + 208) = 0;

    result = [*(id *)(*(void *)(v1 + 32) + 216) _resetStatistics:MEMORY[0x1E4F1CBF0]];
  }
  if (*(void *)(v1 + 40)) {
    result = objc_msgSend(*(id *)(*(void *)(v1 + 32) + 176), "addObjectsFromArray:");
  }
  if (*(unsigned char *)(v1 + 65))
  {
    uint64_t v7 = *(void *)(v1 + 32);
    if (*(unsigned char *)(v7 + 184))
    {
      uint64_t v8 = *(void **)(v7 + 208);
      *(void *)(v7 + 208) = 0;

      objc_msgSend(*(id *)(v1 + 32), "_queue_deliverResetStatisticsObjects:forQuery:", *(void *)(*(void *)(v1 + 32) + 176), *(void *)(v1 + 56));
    }
    else
    {
      objc_msgSend((id)v7, "_queue_deliverInitialStatisticsObjects:anchor:queryUUID:", *(void *)(v7 + 176), *(void *)(v1 + 48), *(void *)(v1 + 56));
    }
    uint64_t v9 = objc_opt_new();
    uint64_t v10 = *(void *)(v1 + 32);
    uint64_t v11 = *(void *)(v10 + 176);
    *(void *)(v10 + 176) = v9;
    return MEMORY[0x1F41817F8](v9, v11);
  }
  return result;
}

- (void)client_deliverUpdatedStatistics:(id)a3 anchor:(id)a4 query:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HKQuery *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__HKStatisticsCollectionQuery_client_deliverUpdatedStatistics_anchor_query___block_invoke;
  v15[3] = &unk_1E58C0930;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __76__HKStatisticsCollectionQuery_client_deliverUpdatedStatistics_anchor_query___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 208), *(id *)(a1 + 40));
  if (*(void *)(a1 + 48))
  {
    v3[0] = *(void *)(a1 + 48);
    id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  }
  else
  {
    id v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_deliverStatisticsObjects:forQuery:", v2, *(void *)(a1 + 56));
}

- (void)client_finishedCachingStatisticsWithCacheHits:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__HKStatisticsCollectionQuery_client_finishedCachingStatisticsWithCacheHits_error___block_invoke;
  block[3] = &unk_1E58BBBF8;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __83__HKStatisticsCollectionQuery_client_finishedCachingStatisticsWithCacheHits_error___block_invoke(void *a1)
{
  id v2 = _Block_copy(*(const void **)(a1[4] + 240));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(void *, void, BOOL))v2 + 2))(v2, a1[6], a1[5] == 0);
    id v2 = v3;
  }
}

- (void)_queue_deliverInitialStatisticsObjects:(id)a3 anchor:(id)a4 queryUUID:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  [(HKStatisticsCollectionQuery *)self setLastAnchor:a4];
  uint64_t v10 = [(HKStatisticsCollectionQuery *)self statisticsCollection];
  if (v10)
  {
    int64_t v11 = (HKStatisticsCollection *)v10;
    [(HKStatisticsCollectionQuery *)self _queue_deliverResetStatisticsObjects:v8 forQuery:v9];
  }
  else
  {
    id v12 = [(HKQuery *)self objectType];
    id v13 = [HKStatisticsCollection alloc];
    anchorDate = self->_anchorDate;
    intervalComponents = self->_intervalComponents;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __87__HKStatisticsCollectionQuery__queue_deliverInitialStatisticsObjects_anchor_queryUUID___block_invoke;
    v32[3] = &unk_1E58C7E08;
    id v16 = v12;
    id v33 = v16;
    int64_t v11 = [(HKStatisticsCollection *)v13 initWithAnchorDate:anchorDate statisticsInterval:intervalComponents emptyStatisticsConstructor:v32];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v17 = v8;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v29;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          [(HKStatisticsCollection *)v11 _insertStatistics:*(void *)(*((void *)&v28 + 1) + 8 * v21++)];
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v19);
    }

    [(HKStatisticsCollectionQuery *)self setStatisticsCollection:v11];
    self->_hasReceivedInitialResults = 1;
    id v22 = _Block_copy(self->_initialResultsHandler);
    BOOL v23 = [(HKStatisticsCollectionQuery *)self queue_shouldDeactivateAfterInitialResults];
    if (v22)
    {
      BOOL v24 = v23;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __87__HKStatisticsCollectionQuery__queue_deliverInitialStatisticsObjects_anchor_queryUUID___block_invoke_2;
      v25[3] = &unk_1E58BB9A0;
      id v27 = v22;
      v25[4] = self;
      v26 = v11;
      [(HKQuery *)self queue_dispatchToClientForUUID:v9 shouldDeactivate:v24 block:v25];
    }
  }
}

HKStatistics *__87__HKStatisticsCollectionQuery__queue_deliverInitialStatisticsObjects_anchor_queryUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [[HKStatistics alloc] initWithDataType:*(void *)(a1 + 32) startDate:v6 endDate:v5];

  return v7;
}

uint64_t __87__HKStatisticsCollectionQuery__queue_deliverInitialStatisticsObjects_anchor_queryUUID___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (void)_queue_deliverResetStatisticsObjects:(id)a3 forQuery:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HKQuery *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = _Block_copy(self->_statisticsUpdateHandler);
  uint64_t v10 = self->_statisticsCollection;
  [(HKStatisticsCollection *)v10 _resetStatistics:v7];

  if (v9)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__HKStatisticsCollectionQuery__queue_deliverResetStatisticsObjects_forQuery___block_invoke;
    v11[3] = &unk_1E58BB9A0;
    id v13 = v9;
    v11[4] = self;
    id v12 = v10;
    [(HKQuery *)self queue_dispatchToClientForUUID:v6 shouldDeactivate:0 block:v11];
  }
}

uint64_t __77__HKStatisticsCollectionQuery__queue_deliverResetStatisticsObjects_forQuery___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5], 0);
}

- (void)_queue_deliverStatisticsObjects:(id)a3 forQuery:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v16 = a4;
  id v7 = [(HKQuery *)self queue];
  dispatch_assert_queue_V2(v7);

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if ([(HKStatisticsCollection *)self->_statisticsCollection _insertStatistics:v13])
        {
          id v14 = _Block_copy(self->_statisticsUpdateHandler);
          id v15 = self->_statisticsCollection;
          if (v14)
          {
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __72__HKStatisticsCollectionQuery__queue_deliverStatisticsObjects_forQuery___block_invoke;
            v17[3] = &unk_1E58C6260;
            id v19 = v14;
            v17[4] = self;
            v17[5] = v13;
            uint64_t v18 = v15;
            [(HKQuery *)self queue_dispatchToClientForUUID:v16 shouldDeactivate:0 block:v17];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
}

uint64_t __72__HKStatisticsCollectionQuery__queue_deliverStatisticsObjects_forQuery___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], 0);
}

- (BOOL)_predicateContainsStrictStartOrEndDateComparisonPredicate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = objc_msgSend(v4, "subpredicates", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      int v8 = 0;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v5);
          }
          v8 |= [(HKStatisticsCollectionQuery *)self _predicateContainsStrictStartOrEndDateComparisonPredicate:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    objc_opt_class();
    LOBYTE(v8) = (objc_opt_isKindOfClass() & 1) != 0
              && [(HKStatisticsCollectionQuery *)self _comparisonPredicateContainsStrictStartOrEndDateComparisonPredicate:v4];
  }

  return v8 & 1;
}

- (BOOL)_comparisonPredicateContainsStrictStartOrEndDateComparisonPredicate:(id)a3
{
  id v3 = a3;
  id v4 = [v3 leftExpression];
  if ([v4 expressionType] == 3)
  {
    id v5 = [v4 keyPath];
    unint64_t v6 = [v3 predicateOperatorType];
    char v7 = [v5 isEqual:@"startDate"];
    if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2) {
      char v8 = v7;
    }
    else {
      char v8 = 0;
    }
    char v9 = [v5 isEqual:@"endDate"];
    if (v6 < 2) {
      char v10 = v9;
    }
    else {
      char v10 = 0;
    }
    char v11 = v8 | v10;
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (NSDate)anchorDate
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (HKStatisticsOptions)options
{
  return self->_options;
}

- (NSDateComponents)intervalComponents
{
  return (NSDateComponents *)objc_getProperty(self, a2, 168, 1);
}

- (void)initialResultsHandler
{
  return self->_initialResultsHandler;
}

- (void)statisticsUpdateHandler
{
  return self->_statisticsUpdateHandler;
}

- (NSNumber)lastAnchor
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setLastAnchor:(id)a3
{
}

- (HKStatisticsCollection)statisticsCollection
{
  return (HKStatisticsCollection *)objc_getProperty(self, a2, 216, 1);
}

- (void)setStatisticsCollection:(id)a3
{
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (HKStatisticsCollectionCacheSettings)cacheSettings
{
  return self->_cacheSettings;
}

- (id)unitTest_finishedCachingStatisticsHandler
{
  return self->_unitTest_finishedCachingStatisticsHandler;
}

- (void)setUnitTest_finishedCachingStatisticsHandler:(id)a3
{
}

- (unint64_t)mergeStrategy
{
  return self->_mergeStrategy;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_finishedCachingStatisticsHandler, 0);
  objc_storeStrong((id *)&self->_cacheSettings, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_statisticsCollection, 0);
  objc_storeStrong((id *)&self->_lastAnchor, 0);
  objc_storeStrong(&self->_statisticsUpdateHandler, 0);
  objc_storeStrong(&self->_initialResultsHandler, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_intervalComponents, 0);

  objc_storeStrong((id *)&self->_anchorDate, 0);
}

@end