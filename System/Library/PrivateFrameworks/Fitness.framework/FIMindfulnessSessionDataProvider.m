@interface FIMindfulnessSessionDataProvider
- (FIMindfulnessSessionDataProvider)initWithHealthStore:(id)a3;
- (id)_createMindfulnessSessionsQueryWithRetryCount:(int64_t)a3;
- (id)allMindfulnessSessions;
- (void)_queue_retryMindfulSessionQueryWithRetryCount:(int64_t)a3;
- (void)_queue_startMindfulnessSessionQueryWithRetryCount:(int64_t)a3;
- (void)_queue_stopMindfulSessionQuery;
- (void)allMindfulnessSessionsWithCompletion:(id)a3;
- (void)dealloc;
- (void)startMindfulnessSessionQueryIfNeeded;
@end

@implementation FIMindfulnessSessionDataProvider

void __82__FIMindfulnessSessionDataProvider__createMindfulnessSessionsQueryWithRetryCount___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR)) {
      __82__FIMindfulnessSessionDataProvider__createMindfulnessSessionsQueryWithRetryCount___block_invoke_2_cold_1(a1, v3, v2);
    }
    objc_msgSend(*(id *)(a1 + 48), "_queue_retryMindfulSessionQueryWithRetryCount:", *(void *)(a1 + 72) + 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "hk_mapToSet:", &__block_literal_global_1);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(*(void *)(a1 + 48) + 24) removeSamplesWithUUIDs:v5];
    [*(id *)(*(void *)(a1 + 48) + 24) insertSamples:*(void *)(a1 + 64)];
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 postNotificationName:@"FIMindfulnessSessionDataProviderDidUpdate" object:0];
  }
}

void *__72__FIMindfulnessSessionDataProvider_startMindfulnessSessionQueryIfNeeded__block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[4]) {
    return objc_msgSend(result, "_queue_startMindfulnessSessionQueryWithRetryCount:", 0);
  }
  return result;
}

- (FIMindfulnessSessionDataProvider)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FIMindfulnessSessionDataProvider;
  v6 = [(FIMindfulnessSessionDataProvider *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    uint64_t v8 = HKCreateSerialDispatchQueue();
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v8;

    v10 = (HKSortedSampleArray *)objc_alloc_init(MEMORY[0x263F0A798]);
    mindfulnessSessions = v7->_mindfulnessSessions;
    v7->_mindfulnessSessions = v10;

    v12 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"endDate" ascending:0];
    [(HKSortedSampleArray *)v7->_mindfulnessSessions setSortDescriptor:v12];

    [(FIMindfulnessSessionDataProvider *)v7 startMindfulnessSessionQueryIfNeeded];
  }

  return v7;
}

- (void)startMindfulnessSessionQueryIfNeeded
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__FIMindfulnessSessionDataProvider_startMindfulnessSessionQueryIfNeeded__block_invoke;
  block[3] = &unk_26441CBA0;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_queue_startMindfulnessSessionQueryWithRetryCount:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    int v11 = 138412546;
    v12 = v8;
    __int16 v13 = 2048;
    int64_t v14 = a3;
    _os_log_impl(&dword_21C74B000, v6, OS_LOG_TYPE_DEFAULT, "%@ starting mindfulness sessions query (retry count: %lu)", (uint8_t *)&v11, 0x16u);
  }
  v9 = [(FIMindfulnessSessionDataProvider *)self _createMindfulnessSessionsQueryWithRetryCount:a3];
  mindfulnessSessionsQuery = self->_mindfulnessSessionsQuery;
  self->_mindfulnessSessionsQuery = v9;

  [(HKHealthStore *)self->_healthStore executeQuery:self->_mindfulnessSessionsQuery];
}

- (id)_createMindfulnessSessionsQueryWithRetryCount:(int64_t)a3
{
  id v5 = [MEMORY[0x263F0A6E8] categoryTypeForIdentifier:*MEMORY[0x263F09388]];
  objc_initWeak(&location, self);
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __82__FIMindfulnessSessionDataProvider__createMindfulnessSessionsQueryWithRetryCount___block_invoke;
  __int16 v13 = &unk_26441CB50;
  objc_copyWeak(v15, &location);
  int64_t v14 = self;
  v15[1] = (id)a3;
  v6 = _Block_copy(&v10);
  id v7 = objc_alloc(MEMORY[0x263F0A0C8]);
  uint64_t v8 = objc_msgSend(v7, "initWithType:predicate:anchor:limit:resultsHandler:", v5, 0, 0, 0, v6, v10, v11, v12, v13);
  [v8 setUpdateHandler:v6];

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  return v8;
}

void __73__FIMindfulnessSessionDataProvider_allMindfulnessSessionsWithCompletion___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = [WeakRetained[3] allSamples];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    WeakRetained = v4;
  }
}

void __82__FIMindfulnessSessionDataProvider__createMindfulnessSessionsQueryWithRetryCount___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  __int16 v13 = WeakRetained;
  if (WeakRetained)
  {
    int64_t v14 = WeakRetained[2];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __82__FIMindfulnessSessionDataProvider__createMindfulnessSessionsQueryWithRetryCount___block_invoke_2;
    v17[3] = &unk_26441CB28;
    id v15 = v11;
    uint64_t v16 = *(void *)(a1 + 32);
    id v18 = v15;
    uint64_t v19 = v16;
    uint64_t v23 = *(void *)(a1 + 48);
    v20 = v13;
    id v21 = v10;
    id v22 = v9;
    dispatch_async(v14, v17);
  }
}

- (void)allMindfulnessSessionsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__FIMindfulnessSessionDataProvider_allMindfulnessSessionsWithCompletion___block_invoke;
  block[3] = &unk_26441CBC8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  [(HKHealthStore *)self->_healthStore stopQuery:self->_mindfulnessSessionsQuery];
  v3.receiver = self;
  v3.super_class = (Class)FIMindfulnessSessionDataProvider;
  [(FIMindfulnessSessionDataProvider *)&v3 dealloc];
}

uint64_t __82__FIMindfulnessSessionDataProvider__createMindfulnessSessionsQueryWithRetryCount___block_invoke_290(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

- (void)_queue_stopMindfulSessionQuery
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  objc_super v3 = (void *)*MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_21C74B000, v4, OS_LOG_TYPE_DEFAULT, "%@ stopping mindfulness sessions query", (uint8_t *)&v8, 0xCu);
  }
  [(HKHealthStore *)self->_healthStore stopQuery:self->_mindfulnessSessionsQuery];
  mindfulnessSessionsQuery = self->_mindfulnessSessionsQuery;
  self->_mindfulnessSessionsQuery = 0;

  [(HKSortedSampleArray *)self->_mindfulnessSessions removeAllSamples];
}

- (void)_queue_retryMindfulSessionQueryWithRetryCount:(int64_t)a3
{
  [(FIMindfulnessSessionDataProvider *)self _queue_stopMindfulSessionQuery];
  if ((unint64_t)a3 < 6)
  {
    dispatch_time_t v6 = dispatch_time(0, 1000000000 * a3);
    serialQueue = self->_serialQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __82__FIMindfulnessSessionDataProvider__queue_retryMindfulSessionQueryWithRetryCount___block_invoke;
    v8[3] = &unk_26441CB78;
    v8[4] = self;
    v8[5] = a3;
    dispatch_after(v6, serialQueue, v8);
  }
  else
  {
    _HKInitializeLogging();
    id v5 = (void *)*MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR)) {
      [(FIMindfulnessSessionDataProvider *)v5 _queue_retryMindfulSessionQueryWithRetryCount:a3];
    }
  }
}

uint64_t __82__FIMindfulnessSessionDataProvider__queue_retryMindfulSessionQueryWithRetryCount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_startMindfulnessSessionQueryWithRetryCount:", *(void *)(a1 + 40));
}

- (id)allMindfulnessSessions
{
  return (id)[(HKSortedSampleArray *)self->_mindfulnessSessions allSamples];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mindfulnessSessionsQuery, 0);
  objc_storeStrong((id *)&self->_mindfulnessSessions, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __82__FIMindfulnessSessionDataProvider__createMindfulnessSessionsQueryWithRetryCount___block_invoke_2_cold_1(uint64_t a1, void *a2, id *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = (objc_class *)objc_opt_class();
  dispatch_time_t v6 = NSStringFromClass(v5);
  id v7 = [*a3 localizedDescription];
  int v8 = 138412546;
  id v9 = v6;
  __int16 v10 = 2112;
  id v11 = v7;
  _os_log_error_impl(&dword_21C74B000, v4, OS_LOG_TYPE_ERROR, "%@ failed to query mindfulness sessions: %@", (uint8_t *)&v8, 0x16u);
}

- (void)_queue_retryMindfulSessionQueryWithRetryCount:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a1;
  id v5 = (objc_class *)objc_opt_class();
  dispatch_time_t v6 = NSStringFromClass(v5);
  int v7 = 138412802;
  int v8 = v6;
  __int16 v9 = 2048;
  uint64_t v10 = a3;
  __int16 v11 = 2048;
  uint64_t v12 = 5;
  _os_log_error_impl(&dword_21C74B000, v4, OS_LOG_TYPE_ERROR, "%@ reached max retry count %lu (max: %lu); not restarting query",
    (uint8_t *)&v7,
    0x20u);
}

@end