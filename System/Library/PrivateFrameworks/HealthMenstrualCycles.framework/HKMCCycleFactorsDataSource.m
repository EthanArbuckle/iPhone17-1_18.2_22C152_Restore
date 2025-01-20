@interface HKMCCycleFactorsDataSource
- (HKMCCycleFactorsDataSource)initWithHealthStore:(id)a3 pregnancyModelProvider:(id)a4 queue:(id)a5;
- (HKMCCycleFactorsDataSourceDelegate)delegate;
- (HKMCPregnancyModelProviding)pregnancyModelProvider;
- (void)_handleCycleFactorsAdded:(void *)a3 deletedObjects:;
- (void)_startPregnancyModelObservationIfNeeded;
- (void)dealloc;
- (void)pregnancyModelDidUpdate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startObservingCycleFactorsInDayIndexRange:(id)a3;
- (void)stopObserving;
@end

@implementation HKMCCycleFactorsDataSource

- (HKMCCycleFactorsDataSource)initWithHealthStore:(id)a3 pregnancyModelProvider:(id)a4 queue:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)HKMCCycleFactorsDataSource;
  v12 = [(HKMCCycleFactorsDataSource *)&v25 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_healthStore, a3);
    objc_storeStrong((id *)&v13->_queue, a5);
    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    cycleFactors = v13->_cycleFactors;
    v13->_cycleFactors = v14;

    if (v10)
    {
      v16 = (HKMCPregnancyModelProviding *)v10;
      pregnancyModelProvider = v13->_pregnancyModelProvider;
      v13->_pregnancyModelProvider = v16;
      char v18 = 1;
    }
    else
    {
      v19 = [[HKMCPregnancyModelProvider alloc] initWithHealthStore:v9 startQueryImmediately:0];
      char v18 = 0;
      pregnancyModelProvider = v13->_pregnancyModelProvider;
      v13->_pregnancyModelProvider = (HKMCPregnancyModelProviding *)v19;
    }

    v13->_pregnancyQueryHasStarted = v18;
    v13->_isRegisteredForPregnancyModelUpdates = 0;
  }
  _HKInitializeLogging();
  v20 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    v22 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v27 = v22;
    __int16 v28 = 2048;
    v29 = v13;
    id v23 = v22;
    _os_log_impl(&dword_2249E9000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Initializing", buf, 0x16u);
  }
  return v13;
}

- (void)startObservingCycleFactorsInDayIndexRange:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v49 = *MEMORY[0x263EF8340];
  v6 = (os_log_t *)MEMORY[0x263F09930];
  if (!self->_observerQuery)
  {
LABEL_19:
    self->_currentDayIndexRange.int64_t start = var0 - 150;
    self->_currentDayIndexRange.int64_t duration = var1 + 150;
    _HKInitializeLogging();
    os_log_t v24 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v25 = v24;
      v26 = objc_opt_class();
      id v27 = v26;
      __int16 v28 = NSStringFromHKDayIndexRange();
      *(_DWORD *)buf = 138543874;
      id v44 = v26;
      __int16 v45 = 2048;
      v46 = self;
      __int16 v47 = 2112;
      v48 = v28;
      _os_log_impl(&dword_2249E9000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Starting cycle factors fetch for range: %@", buf, 0x20u);
    }
    -[HKMCCycleFactorsDataSource _startPregnancyModelObservationIfNeeded]((uint64_t)self);
    v29 = objc_msgSend(MEMORY[0x263F08A98], "hk_predicateForSamplesInDayIndexRange:", self->_currentDayIndexRange.start, self->_currentDayIndexRange.duration);
    uint64_t v30 = (void *)MEMORY[0x263F0A678];
    v31 = HKMCCycleFactorsTypes();
    v32 = objc_msgSend(v30, "hkmc_descriptorsForTypes:predicate:", v31, v29);

    objc_initWeak((id *)buf, self);
    uint64_t v37 = MEMORY[0x263EF8330];
    uint64_t v38 = 3221225472;
    v39 = __72__HKMCCycleFactorsDataSource_startObservingCycleFactorsInDayIndexRange___block_invoke;
    v40 = &unk_2646E9BF8;
    v41 = self;
    objc_copyWeak(&v42, (id *)buf);
    v33 = (void *)MEMORY[0x22A61C290](&v37);
    v34 = (HKAnchoredObjectQuery *)[objc_alloc(MEMORY[0x263F0A0C8]) initWithQueryDescriptors:v32 anchor:0 limit:0 resultsHandler:v33];
    observerQuery = self->_observerQuery;
    self->_observerQuery = v34;

    v36 = [NSString stringWithFormat:@"<%@:%p Cycle Factors Query>", objc_opt_class(), self, v37, v38, v39, v40, v41];
    [(HKAnchoredObjectQuery *)self->_observerQuery setDebugIdentifier:v36];

    [(HKAnchoredObjectQuery *)self->_observerQuery setUpdateHandler:v33];
    [(HKHealthStore *)self->_healthStore executeQuery:self->_observerQuery];

    objc_destroyWeak(&v42);
    objc_destroyWeak((id *)buf);

    return;
  }
  _HKInitializeLogging();
  os_log_t v7 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    *(_DWORD *)buf = 138543618;
    id v44 = (id)objc_opt_class();
    __int16 v45 = 2048;
    v46 = self;
    id v9 = v44;
    _os_log_impl(&dword_2249E9000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] We're already running a cycle factors query", buf, 0x16u);
  }
  int64_t start = self->_currentDayIndexRange.start;
  int64_t duration = self->_currentDayIndexRange.duration;
  if (var0 != start || duration != var1)
  {
    if (var0 >= start && var0 - start < duration)
    {
      uint64_t v13 = var1 + var0 - 1;
      if (var1 <= 0) {
        uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      }
      BOOL v14 = __OFSUB__(v13, start);
      uint64_t v15 = v13 - start;
      if (v15 < 0 == v14 && v15 < duration)
      {
        _HKInitializeLogging();
        os_log_t v16 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
        {
          v17 = v16;
          char v18 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          id v44 = v18;
          __int16 v45 = 2048;
          v46 = self;
          id v19 = v18;
          _os_log_impl(&dword_2249E9000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Skipping restarting query, new dayIndexRange is already covered", buf, 0x16u);
        }
        return;
      }
    }
    [(HKMCCycleFactorsDataSource *)self stopObserving];
    goto LABEL_19;
  }
  _HKInitializeLogging();
  os_log_t v20 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    v22 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    id v44 = v22;
    __int16 v45 = 2048;
    v46 = self;
    id v23 = v22;
    _os_log_impl(&dword_2249E9000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Skipping restarting query, due to identical day index ranges", buf, 0x16u);
  }
}

- (void)_startPregnancyModelObservationIfNeeded
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!a1) {
    return;
  }
  if (!*(unsigned char *)(a1 + 72))
  {
    id v10 = [MEMORY[0x263F0A980] sharedBehavior];
    int v11 = [v10 showSensitiveLogItems];

    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x263F09930];
    BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        BOOL v14 = v12;
        *(_DWORD *)char v18 = 138543618;
        *(void *)&v18[4] = objc_opt_class();
        *(_WORD *)&v18[12] = 2048;
        *(void *)&v18[14] = a1;
        id v15 = *(id *)&v18[4];
        os_log_t v16 = "[%{public}@:%p] Starting pregnancy model query";
LABEL_14:
        _os_log_impl(&dword_2249E9000, v14, OS_LOG_TYPE_DEFAULT, v16, v18, 0x16u);
      }
    }
    else if (v13)
    {
      BOOL v14 = v12;
      *(_DWORD *)char v18 = 138543618;
      *(void *)&v18[4] = objc_opt_class();
      *(_WORD *)&v18[12] = 2048;
      *(void *)&v18[14] = a1;
      id v15 = *(id *)&v18[4];
      os_log_t v16 = "[%{public}@:%p] Starting model query";
      goto LABEL_14;
    }
    id v17 = *(id *)(a1 + 80);
    [v17 startQuery];
    [*(id *)(a1 + 80) registerObserver:a1 isUserInitiated:1];
    *(_WORD *)(a1 + 72) = 257;

    return;
  }
  _HKInitializeLogging();
  v2 = (os_log_t *)MEMORY[0x263F09930];
  v3 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)char v18 = 138543618;
    *(void *)&v18[4] = objc_opt_class();
    *(_WORD *)&v18[12] = 2048;
    *(void *)&v18[14] = a1;
    id v5 = *(id *)&v18[4];
    _os_log_impl(&dword_2249E9000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Skipping starting query", v18, 0x16u);
  }
  if (!*(unsigned char *)(a1 + 73))
  {
    _HKInitializeLogging();
    os_log_t v6 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v7 = v6;
      v8 = objc_opt_class();
      *(_DWORD *)char v18 = 138543618;
      *(void *)&v18[4] = v8;
      *(_WORD *)&v18[12] = 2048;
      *(void *)&v18[14] = a1;
      id v9 = v8;
      _os_log_impl(&dword_2249E9000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Registering for updates", v18, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 80), "registerObserver:isUserInitiated:", a1, 1, *(_OWORD *)v18, *(void *)&v18[16], v19);
    *(unsigned char *)(a1 + 73) = 1;
  }
}

void __72__HKMCCycleFactorsDataSource_startObservingCycleFactorsInDayIndexRange___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v9 && v10)
  {
    if ([v9 count] || objc_msgSend(v10, "count"))
    {
      v12 = *(NSObject **)(*(void *)(a1 + 32) + 24);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __72__HKMCCycleFactorsDataSource_startObservingCycleFactorsInDayIndexRange___block_invoke_2;
      block[3] = &unk_2646E9BD0;
      objc_copyWeak(&v18, (id *)(a1 + 40));
      id v16 = v9;
      id v17 = v10;
      dispatch_async(v12, block);

      objc_destroyWeak(&v18);
    }
  }
  else
  {
    _HKInitializeLogging();
    BOOL v13 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      __72__HKMCCycleFactorsDataSource_startObservingCycleFactorsInDayIndexRange___block_invoke_cold_1(a1, v13, (uint64_t)v11);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained stopObserving];
  }
}

void __72__HKMCCycleFactorsDataSource_startObservingCycleFactorsInDayIndexRange___block_invoke_2(void **a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  -[HKMCCycleFactorsDataSource _handleCycleFactorsAdded:deletedObjects:]((uint64_t)WeakRetained, a1[4], a1[5]);
}

- (void)_handleCycleFactorsAdded:(void *)a3 deletedObjects:
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v34 = a3;
  if (a1)
  {
    _HKInitializeLogging();
    os_log_t v6 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      log = v6;
      os_log_t v7 = objc_opt_class();
      v8 = NSNumber;
      id v33 = v7;
      id v9 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      id v10 = HKSensitiveLogItem();
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v34, "count"));
      v12 = id v11 = v5;
      BOOL v13 = HKSensitiveLogItem();
      BOOL v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
      id v15 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138544386;
      __int16 v47 = v7;
      __int16 v48 = 2048;
      uint64_t v49 = a1;
      __int16 v50 = 2112;
      v51 = v10;
      __int16 v52 = 2112;
      v53 = v13;
      __int16 v54 = 2112;
      v55 = v15;
      _os_log_impl(&dword_2249E9000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Factors did update, added: %@ | deleted: %@ | currently cached: %@", buf, 0x34u);

      id v5 = v11;
    }
    id v16 = v5;
    if ([*(id *)(a1 + 40) count])
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v41 != v20) {
              objc_enumerationMutation(v17);
            }
            objc_msgSend(*(id *)(a1 + 40), "addObject:", *(void *)(*((void *)&v40 + 1) + 8 * i), log);
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v19);
      }
    }
    else
    {
      uint64_t v22 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:v16];
      id v17 = *(id *)(a1 + 40);
      *(void *)(a1 + 40) = v22;
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v23 = v34;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v37 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v36 + 1) + 8 * j);
          v29 = *(void **)(a1 + 40);
          v35[0] = MEMORY[0x263EF8330];
          v35[1] = 3221225472;
          v35[2] = __70__HKMCCycleFactorsDataSource__handleCycleFactorsAdded_deletedObjects___block_invoke;
          v35[3] = &unk_2646E9C20;
          v35[4] = v28;
          objc_msgSend(v29, "hk_removeObjectsPassingTest:", v35, log);
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v25);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v31 = [*(id *)(a1 + 40) allObjects];
    [WeakRetained cycleFactorsDataSource:a1 didFetchCycleFactors:v31];
  }
}

uint64_t __70__HKMCCycleFactorsDataSource__handleCycleFactorsAdded_deletedObjects___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 UUID];
  id v5 = [v3 UUID];

  uint64_t v6 = [v4 isEqual:v5];
  return v6;
}

- (void)pregnancyModelDidUpdate:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v4 = (HKMCPregnancyModel *)a3;
  if (HKShowSensitiveLogItems())
  {
    _HKInitializeLogging();
    id v5 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v5;
      *(_DWORD *)buf = 138543618;
      id v18 = (id)objc_opt_class();
      __int16 v19 = 2048;
      uint64_t v20 = self;
      id v7 = v18;
      _os_log_impl(&dword_2249E9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Received pregnancy model update", buf, 0x16u);
    }
  }
  if (self->_pregnancyModel == v4)
  {
    if (HKShowSensitiveLogItems())
    {
      _HKInitializeLogging();
      id v9 = (void *)*MEMORY[0x263F09930];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
      {
        id v10 = v9;
        id v11 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v18 = v11;
        __int16 v19 = 2048;
        uint64_t v20 = self;
        id v12 = v11;
        _os_log_impl(&dword_2249E9000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Skipping notifying delegate due to identical pregnancy model", buf, 0x16u);
      }
    }
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__HKMCCycleFactorsDataSource_pregnancyModelDidUpdate___block_invoke;
    block[3] = &unk_2646E94E8;
    void block[4] = self;
    id v16 = v4;
    dispatch_async(queue, block);
  }
  BOOL v13 = self->_queue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54__HKMCCycleFactorsDataSource_pregnancyModelDidUpdate___block_invoke_290;
  v14[3] = &unk_2646E9600;
  v14[4] = self;
  dispatch_async(v13, v14);
}

void __54__HKMCCycleFactorsDataSource_pregnancyModelDidUpdate___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (HKShowSensitiveLogItems())
  {
    _HKInitializeLogging();
    v2 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      id v3 = v2;
      v4 = objc_opt_class();
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 138543618;
      id v9 = v4;
      __int16 v10 = 2048;
      uint64_t v11 = v5;
      id v6 = v4;
      _os_log_impl(&dword_2249E9000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Notifying delegate of pregnancy model update", (uint8_t *)&v8, 0x16u);
    }
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained cycleFactorsDataSource:*(void *)(a1 + 32) didUpdatePregnancyModel:*(void *)(a1 + 40)];
}

void *__54__HKMCCycleFactorsDataSource_pregnancyModelDidUpdate___block_invoke_290(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[4]) {
    return objc_msgSend(result, "startObservingCycleFactorsInDayIndexRange:", result[7], result[8]);
  }
  return result;
}

- (void)stopObserving
{
  if (self->_observerQuery)
  {
    -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:");
    observerQuery = self->_observerQuery;
    self->_observerQuery = 0;

    pregnancyModelProvider = self->_pregnancyModelProvider;
    [(HKMCPregnancyModelProviding *)pregnancyModelProvider unregisterObserver:self];
  }
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v3 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2048;
    __int16 v10 = self;
    id v5 = v8;
    _os_log_impl(&dword_2249E9000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Dealloc", buf, 0x16u);
  }
  [(HKMCCycleFactorsDataSource *)self stopObserving];
  v6.receiver = self;
  v6.super_class = (Class)HKMCCycleFactorsDataSource;
  [(HKMCCycleFactorsDataSource *)&v6 dealloc];
}

- (HKMCCycleFactorsDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKMCCycleFactorsDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HKMCPregnancyModelProviding)pregnancyModelProvider
{
  return self->_pregnancyModelProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pregnancyModelProvider, 0);
  objc_storeStrong((id *)&self->_pregnancyModel, 0);
  objc_storeStrong((id *)&self->_cycleFactors, 0);
  objc_storeStrong((id *)&self->_observerQuery, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __72__HKMCCycleFactorsDataSource_startObservingCycleFactorsInDayIndexRange___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  objc_super v6 = objc_opt_class();
  uint64_t v7 = *(void *)(a1 + 32);
  int v9 = 138543874;
  __int16 v10 = v6;
  __int16 v11 = 2048;
  uint64_t v12 = v7;
  __int16 v13 = 2114;
  uint64_t v14 = a3;
  id v8 = v6;
  _os_log_error_impl(&dword_2249E9000, v5, OS_LOG_TYPE_ERROR, "[%{public}@:%p] Factors query failed with error: %{public}@", (uint8_t *)&v9, 0x20u);
}

@end