@interface HKMCPregnancyModelProvider
- (HKHealthStore)healthStore;
- (HKMCPregnancyModelProvider)initWithHealthStore:(id)a3;
- (HKMCPregnancyModelProvider)initWithHealthStore:(id)a3 startQueryImmediately:(BOOL)a4;
- (NSString)description;
- (id)getCurrentPregnancyModel;
- (void)_handlePregnancyModelQueryResult:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)registerObserver:(id)a3 isUserInitiated:(BOOL)a4;
- (void)startQuery;
- (void)unregisterObserver:(id)a3;
@end

@implementation HKMCPregnancyModelProvider

uint64_t __69__HKMCPregnancyModelProvider__handlePregnancyModelQueryResult_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 pregnancyModelDidUpdate:*(void *)(a1 + 32)];
}

- (void)registerObserver:(id)a3 isUserInitiated:(BOOL)a4
{
  id v5 = a3;
  [(HKObserverSet *)self->_observers registerObserver:v5];
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)[(HKMCPregnancyModel *)self->_lastPregnancyModel copy];
  os_unfair_lock_unlock(&self->_lock);
  if (v6)
  {
    observers = self->_observers;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __63__HKMCPregnancyModelProvider_registerObserver_isUserInitiated___block_invoke;
    v8[3] = &unk_2646E9560;
    id v9 = v6;
    [(HKObserverSet *)observers notifyObserver:v5 handler:v8];
  }
}

void __40__HKMCPregnancyModelProvider_startQuery__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handlePregnancyModelQueryResult:v7 error:v6];
}

- (void)_handlePregnancyModelQueryResult:(id)a3 error:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (v7)
  {
    objc_storeStrong((id *)&self->_lastPregnancyModel, a3);
    lastError = self->_lastError;
    self->_lastError = 0;

    observers = self->_observers;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __69__HKMCPregnancyModelProvider__handlePregnancyModelQueryResult_error___block_invoke;
    v24[3] = &unk_2646E9560;
    v25 = (NSError *)v7;
    [(HKObserverSet *)observers notifyObservers:v24];
    v11 = v25;
LABEL_3:

    goto LABEL_7;
  }
  _HKInitializeLogging();
  v12 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
    -[HKMCPregnancyModelProvider _handlePregnancyModelQueryResult:error:](v12, (uint64_t)self, (uint64_t)v8);
  }
  if (!self->_lastPregnancyModel)
  {
    if (v8)
    {
      v19 = (NSError *)v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 100, @"Query returned with no model and no error");
      v19 = (NSError *)objc_claimAutoreleasedReturnValue();
    }
    v11 = self->_lastError;
    self->_lastError = v19;
    goto LABEL_3;
  }
LABEL_7:
  v13 = (void *)[(NSMutableArray *)self->_nextPregnancyModelQueryResultBlocks copy];
  [(NSMutableArray *)self->_nextPregnancyModelQueryResultBlocks removeAllObjects];
  os_unfair_lock_unlock(&self->_lock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8 * v18) + 16))(*(void *)(*((void *)&v20 + 1) + 8 * v18));
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v16);
  }
}

- (HKMCPregnancyModelProvider)initWithHealthStore:(id)a3 startQueryImmediately:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKMCPregnancyModelProvider;
  id v8 = [(HKMCPregnancyModelProvider *)&v16 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_healthStore, a3);
    id v10 = objc_alloc(MEMORY[0x263F0A5A8]);
    uint64_t v11 = [v10 initWithName:@"HKMCPregnancyModelProviderObservers" loggingCategory:*MEMORY[0x263F09930]];
    observers = v9->_observers;
    v9->_observers = (HKObserverSet *)v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    nextPregnancyModelQueryResultBlocks = v9->_nextPregnancyModelQueryResultBlocks;
    v9->_nextPregnancyModelQueryResultBlocks = v13;

    v9->_lock._os_unfair_lock_opaque = 0;
    if (v4) {
      [(HKMCPregnancyModelProvider *)v9 startQuery];
    }
  }

  return v9;
}

- (void)startQuery
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (self->_pregnancyModelQuery)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"HKMCPregnancyModelProvider.m" lineNumber:52 description:@"Query can only be started once"];
  }
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F0A490]);
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __40__HKMCPregnancyModelProvider_startQuery__block_invoke;
  objc_super v16 = &unk_2646E9538;
  objc_copyWeak(&v17, &location);
  BOOL v4 = (HKMCPregnancyStateQuery *)[v3 initWithIsRunningForMaintenance:0 updateHandler:&v13];
  pregnancyModelQuery = self->_pregnancyModelQuery;
  self->_pregnancyModelQuery = v4;

  id v6 = [(HKMCPregnancyModelProvider *)self description];
  [(HKMCPregnancyStateQuery *)self->_pregnancyModelQuery setDebugIdentifier:v6];

  _HKInitializeLogging();
  id v7 = (id)*MEMORY[0x263F09930];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_opt_class();
    id v9 = self->_pregnancyModelQuery;
    *(_DWORD *)buf = 138543618;
    long long v20 = v8;
    __int16 v21 = 2114;
    long long v22 = v9;
    id v10 = v8;
    _os_log_impl(&dword_2249E9000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting pregnancy model query %{public}@", buf, 0x16u);
  }
  [(HKHealthStore *)self->_healthStore executeQuery:self->_pregnancyModelQuery];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = (void *)[(HKMCPregnancyModel *)self->_lastPregnancyModel copy];
  id v5 = (void *)[(NSError *)self->_lastError copy];
  os_unfair_lock_unlock(p_lock);
  id v6 = NSString;
  uint64_t v7 = objc_opt_class();
  id v8 = HKSensitiveLogItem();
  id v9 = [v6 stringWithFormat:@"<%@:%p pregnancyModel:%@ error:%@>", v7, self, v8, v5];

  return (NSString *)v9;
}

- (HKMCPregnancyModelProvider)initWithHealthStore:(id)a3
{
  return [(HKMCPregnancyModelProvider *)self initWithHealthStore:a3 startQueryImmediately:1];
}

- (id)getCurrentPregnancyModel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = (void *)[(HKMCPregnancyModel *)self->_lastPregnancyModel copy];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v3 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = v3;
    id v5 = objc_opt_class();
    pregnancyModelQuery = self->_pregnancyModelQuery;
    *(_DWORD *)buf = 138543618;
    id v10 = v5;
    __int16 v11 = 2114;
    v12 = pregnancyModelQuery;
    id v7 = v5;
    _os_log_impl(&dword_2249E9000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stopping pregnancy model query %{public}@", buf, 0x16u);
  }
  [(HKHealthStore *)self->_healthStore stopQuery:self->_pregnancyModelQuery];
  v8.receiver = self;
  v8.super_class = (Class)HKMCPregnancyModelProvider;
  [(HKMCPregnancyModelProvider *)&v8 dealloc];
}

uint64_t __63__HKMCPregnancyModelProvider_registerObserver_isUserInitiated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 pregnancyModelDidUpdate:*(void *)(a1 + 32)];
}

- (void)unregisterObserver:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_lastPregnancyModel, 0);
  objc_storeStrong((id *)&self->_pregnancyModelQuery, 0);
  objc_storeStrong((id *)&self->_nextPregnancyModelQueryResultBlocks, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)_handlePregnancyModelQueryResult:(uint64_t)a3 error:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_2249E9000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error in pregnancy state query: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end