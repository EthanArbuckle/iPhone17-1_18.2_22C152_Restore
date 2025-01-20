@interface HKMCViewModelProviderDataSource
- (HKMCViewModelProviderDataSource)initWithHealthStore:(id)a3 calendarCache:(id)a4 queue:(id)a5;
- (HKMCViewModelProviderDataSourceDelegate)delegate;
- (void)_handleDaySummaryObserverUpdateWithError:(id)a3;
- (void)_startObservingDaySummaryUpdates;
- (void)cancelFetchForDaySummariesInDayIndexRange:(id)a3;
- (void)dealloc;
- (void)fetchDaySummariesInDayIndexRange:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HKMCViewModelProviderDataSource

- (HKMCViewModelProviderDataSource)initWithHealthStore:(id)a3 calendarCache:(id)a4 queue:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HKMCViewModelProviderDataSource;
  v12 = [(HKMCViewModelProviderDataSource *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_healthStore, a3);
    objc_storeStrong((id *)&v13->_queue, a5);
    uint64_t v14 = [MEMORY[0x263EFF9C0] set];
    summaryQueries = v13->_summaryQueries;
    v13->_summaryQueries = (NSMutableSet *)v14;

    uint64_t v16 = [MEMORY[0x263F089C8] indexSet];
    canceledDayIndexes = v13->_canceledDayIndexes;
    v13->_canceledDayIndexes = (NSMutableIndexSet *)v16;

    objc_storeStrong((id *)&v13->_calendarCache, a4);
    [(HKMCViewModelProviderDataSource *)v13 _startObservingDaySummaryUpdates];
  }
  _HKInitializeLogging();
  v18 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    v20 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v25 = v20;
    __int16 v26 = 2048;
    v27 = v13;
    id v21 = v20;
    _os_log_impl(&dword_2249E9000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Initializing", buf, 0x16u);
  }
  return v13;
}

- (void)fetchDaySummariesInDayIndexRange:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v24 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = objc_opt_class();
    id v9 = v8;
    id v10 = NSStringFromHKDayIndexRange();
    *(_DWORD *)buf = 138543874;
    v19 = v8;
    __int16 v20 = 2048;
    id v21 = self;
    __int16 v22 = 2114;
    objc_super v23 = v10;
    _os_log_impl(&dword_2249E9000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Fetching summaries in range %{public}@", buf, 0x20u);
  }
  id v11 = [HKMCDaySummaryQuery alloc];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __68__HKMCViewModelProviderDataSource_fetchDaySummariesInDayIndexRange___block_invoke;
  v17[3] = &unk_2646E95B0;
  v17[4] = self;
  v17[5] = var0;
  v17[6] = var1;
  v12 = -[HKMCDaySummaryQuery initWithDayIndexRange:ascending:limit:resultsHandler:](v11, "initWithDayIndexRange:ascending:limit:resultsHandler:", var0, var1, 1, 0, v17);
  v13 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
  [(HKQuery *)v12 setDebugIdentifier:v13];

  canceledDayIndexes = self->_canceledDayIndexes;
  if (var0 < 0)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"NSRange NSRangeFromHKDayIndexRange(HKDayIndexRange)"];
    [v15 handleFailureInFunction:v16 file:@"HKDayIndexRange.h" lineNumber:46 description:@"Cannot convert day index ranges less than 0 to NSRange"];
  }
  -[NSMutableIndexSet removeIndexesInRange:](canceledDayIndexes, "removeIndexesInRange:", var0, var1);
  [(NSMutableSet *)self->_summaryQueries addObject:v12];
  [(HKHealthStore *)self->_healthStore executeQuery:v12];
}

void __68__HKMCViewModelProviderDataSource_fetchDaySummariesInDayIndexRange___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(NSObject **)(v13 + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__HKMCViewModelProviderDataSource_fetchDaySummariesInDayIndexRange___block_invoke_2;
  block[3] = &unk_2646E9588;
  id v20 = v10;
  uint64_t v21 = v13;
  long long v25 = *(_OWORD *)(a1 + 40);
  id v22 = v11;
  id v23 = v12;
  id v24 = v9;
  id v15 = v9;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

uint64_t __68__HKMCViewModelProviderDataSource_fetchDaySummariesInDayIndexRange___block_invoke_2(void *a1)
{
  if (a1[4])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 16));
    objc_msgSend(WeakRetained, "viewModelProviderDataSource:didFetchDaySummaries:forDayIndexRange:daySummaryAnchor:", a1[5], a1[4], a1[9], a1[10], a1[6]);
  }
  else
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      __68__HKMCViewModelProviderDataSource_fetchDaySummariesInDayIndexRange___block_invoke_2_cold_1((uint64_t)a1, v3);
    }
  }
  return [*(id *)(a1[5] + 32) removeObject:a1[8]];
}

- (void)cancelFetchForDaySummariesInDayIndexRange:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v54 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v6 = (void **)MEMORY[0x263F09930];
  v7 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    id v9 = objc_opt_class();
    id v10 = v9;
    id v11 = NSStringFromHKDayIndexRange();
    *(_DWORD *)buf = 138543874;
    v49 = v9;
    __int16 v50 = 2048;
    v51 = self;
    __int16 v52 = 2114;
    v53 = v11;
    _os_log_impl(&dword_2249E9000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Cancelling fetch for summaries in range %{public}@", buf, 0x20u);
  }
  canceledDayIndexes = self->_canceledDayIndexes;
  if (var0 < 0)
  {
    v37 = [MEMORY[0x263F08690] currentHandler];
    v38 = [NSString stringWithUTF8String:"NSRange NSRangeFromHKDayIndexRange(HKDayIndexRange)"];
    [v37 handleFailureInFunction:v38 file:@"HKDayIndexRange.h" lineNumber:46 description:@"Cannot convert day index ranges less than 0 to NSRange"];
  }
  -[NSMutableIndexSet addIndexesInRange:](canceledDayIndexes, "addIndexesInRange:", var0, var1);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v13 = self->_summaryQueries;
  uint64_t v14 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v14)
  {
    id v15 = 0;
    uint64_t v16 = *(void *)v44;
    uint64_t v17 = v14;
    do
    {
      uint64_t v18 = 0;
      uint64_t v40 = v17;
      do
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(v13);
        }
        v19 = *(void **)(*((void *)&v43 + 1) + 8 * v18);
        uint64_t v20 = [v19 dayIndexRange];
        uint64_t v22 = v21;
        if (v20 < 0)
        {
          v42 = [MEMORY[0x263F08690] currentHandler];
          v39 = [NSString stringWithUTF8String:"NSRange NSRangeFromHKDayIndexRange(HKDayIndexRange)"];
          [v42 handleFailureInFunction:v39 file:@"HKDayIndexRange.h" lineNumber:46 description:@"Cannot convert day index ranges less than 0 to NSRange"];
        }
        int v23 = -[NSMutableIndexSet containsIndexesInRange:](self->_canceledDayIndexes, "containsIndexesInRange:", v20, v22);
        _HKInitializeLogging();
        id v24 = *v6;
        long long v25 = *v6;
        if (v23)
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v26 = v24;
            v27 = objc_opt_class();
            v41 = v15;
            uint64_t v28 = v16;
            v29 = v13;
            v30 = v6;
            id v31 = v27;
            [v19 dayIndexRange];
            v32 = NSStringFromHKDayIndexRange();
            *(_DWORD *)buf = 138543874;
            v49 = v27;
            __int16 v50 = 2048;
            v51 = self;
            __int16 v52 = 2114;
            v53 = v32;
            _os_log_impl(&dword_2249E9000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Cancelling query for summaries in range %{public}@", buf, 0x20u);

            uint64_t v17 = v40;
            v6 = v30;
            uint64_t v13 = v29;
            uint64_t v16 = v28;
            id v15 = v41;
          }
          [(HKHealthStore *)self->_healthStore stopQuery:v19];
          if (!v15)
          {
            id v15 = [MEMORY[0x263EFF9C0] set];
          }
          [v15 addObject:v19];
        }
        else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          v33 = v24;
          v34 = objc_opt_class();
          id v35 = v34;
          [v19 dayIndexRange];
          v36 = NSStringFromHKDayIndexRange();
          *(_DWORD *)buf = 138543874;
          v49 = v34;
          __int16 v50 = 2048;
          v51 = self;
          __int16 v52 = 2114;
          v53 = v36;
          _os_log_debug_impl(&dword_2249E9000, v33, OS_LOG_TYPE_DEBUG, "[%{public}@:%p] Not cancelling query for summaries in range %{public}@", buf, 0x20u);

          uint64_t v17 = v40;
        }
        ++v18;
      }
      while (v17 != v18);
      uint64_t v17 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v17);
  }
  else
  {
    id v15 = 0;
  }

  [(NSMutableSet *)self->_summaryQueries minusSet:v15];
}

- (void)_startObservingDaySummaryUpdates
{
  objc_initWeak(&location, self);
  v3 = [HKMCDaySummaryObserverQuery alloc];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __67__HKMCViewModelProviderDataSource__startObservingDaySummaryUpdates__block_invoke;
  id v10 = &unk_2646E95D8;
  objc_copyWeak(&v11, &location);
  v4 = [(HKMCDaySummaryObserverQuery *)v3 initWithUpdateHandler:&v7];
  summaryObserverQuery = self->_summaryObserverQuery;
  self->_summaryObserverQuery = v4;

  v6 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self, v7, v8, v9, v10];
  [(HKQuery *)self->_summaryObserverQuery setDebugIdentifier:v6];

  [(HKHealthStore *)self->_healthStore executeQuery:self->_summaryObserverQuery];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __67__HKMCViewModelProviderDataSource__startObservingDaySummaryUpdates__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _handleDaySummaryObserverUpdateWithError:v4];
}

- (void)_handleDaySummaryObserverUpdateWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      [(HKMCViewModelProviderDataSource *)v5 _handleDaySummaryObserverUpdateWithError:(uint64_t)v4];
    }
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__HKMCViewModelProviderDataSource__handleDaySummaryObserverUpdateWithError___block_invoke;
    block[3] = &unk_2646E9600;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

void __76__HKMCViewModelProviderDataSource__handleDaySummaryObserverUpdateWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 viewModelProviderDataSourceDidUpdateDaySummaries:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    *(_DWORD *)buf = 138543618;
    id v18 = (id)objc_opt_class();
    __int16 v19 = 2048;
    uint64_t v20 = self;
    id v5 = v18;
    _os_log_impl(&dword_2249E9000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Dealloc", buf, 0x16u);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_summaryQueries;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [(HKHealthStore *)self->_healthStore stopQuery:*(void *)(*((void *)&v12 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(HKHealthStore *)self->_healthStore stopQuery:self->_summaryObserverQuery];
  v11.receiver = self;
  v11.super_class = (Class)HKMCViewModelProviderDataSource;
  [(HKMCViewModelProviderDataSource *)&v11 dealloc];
}

- (HKMCViewModelProviderDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKMCViewModelProviderDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_canceledDayIndexes, 0);
  objc_storeStrong((id *)&self->_summaryObserverQuery, 0);
  objc_storeStrong((id *)&self->_summaryQueries, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __68__HKMCViewModelProviderDataSource_fetchDaySummariesInDayIndexRange___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = a2;
  id v4 = objc_opt_class();
  id v5 = v4;
  v6 = NSStringFromHKDayIndexRange();
  uint64_t v7 = *(void *)(a1 + 56);
  int v8 = 138543874;
  uint64_t v9 = v4;
  __int16 v10 = 2114;
  objc_super v11 = v6;
  __int16 v12 = 2114;
  uint64_t v13 = v7;
  _os_log_error_impl(&dword_2249E9000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] Error querying for summaries in range %{public}@: %{public}@", (uint8_t *)&v8, 0x20u);
}

- (void)_handleDaySummaryObserverUpdateWithError:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_2249E9000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error in day summary observer query: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end