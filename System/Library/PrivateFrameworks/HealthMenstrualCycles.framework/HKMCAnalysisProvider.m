@interface HKMCAnalysisProvider
- (HKHealthStore)healthStore;
- (HKMCAnalysisProvider)initWithHealthStore:(id)a3;
- (HKMCAnalysisProvider)initWithHealthStore:(id)a3 startAnalysisQueryImmediately:(BOOL)a4;
- (id)description;
- (void)_handleAnalysisQueryResult:(id)a3 error:(id)a4;
- (void)addObserver:(id)a3 queue:(id)a4;
- (void)analysisWithCompletion:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)startAnalysisQuery;
@end

@implementation HKMCAnalysisProvider

- (HKMCAnalysisProvider)initWithHealthStore:(id)a3
{
  return [(HKMCAnalysisProvider *)self initWithHealthStore:a3 startAnalysisQueryImmediately:1];
}

- (HKMCAnalysisProvider)initWithHealthStore:(id)a3 startAnalysisQueryImmediately:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKMCAnalysisProvider;
  v8 = [(HKMCAnalysisProvider *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_healthStore, a3);
    id v10 = objc_alloc(MEMORY[0x263F0A5A8]);
    uint64_t v11 = [v10 initWithName:@"HKMCAnalysisProviderObservers" loggingCategory:*MEMORY[0x263F09930]];
    observers = v9->_observers;
    v9->_observers = (HKObserverSet *)v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    nextAnalysisQueryResultBlocks = v9->_nextAnalysisQueryResultBlocks;
    v9->_nextAnalysisQueryResultBlocks = v13;

    v9->_lock._os_unfair_lock_opaque = 0;
    if (v4) {
      [(HKMCAnalysisProvider *)v9 startAnalysisQuery];
    }
  }

  return v9;
}

- (void)startAnalysisQuery
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (self->_analysisQuery)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"HKMCAnalysisProvider.m" lineNumber:54 description:@"Analysis query can only be started once"];
  }
  objc_initWeak(&location, self);
  v3 = [HKMCAnalysisQuery alloc];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __42__HKMCAnalysisProvider_startAnalysisQuery__block_invoke;
  objc_super v16 = &unk_2646E9AF8;
  objc_copyWeak(&v17, &location);
  BOOL v4 = [(HKMCAnalysisQuery *)v3 initWithUpdateHandler:&v13];
  analysisQuery = self->_analysisQuery;
  self->_analysisQuery = v4;

  v6 = [(HKMCAnalysisProvider *)self description];
  [(HKQuery *)self->_analysisQuery setDebugIdentifier:v6];

  _HKInitializeLogging();
  id v7 = (id)*MEMORY[0x263F09930];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    v9 = self->_analysisQuery;
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    __int16 v21 = 2114;
    v22 = v9;
    id v10 = v8;
    _os_log_impl(&dword_2249E9000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting analysis query %{public}@", buf, 0x16u);
  }
  [(HKHealthStore *)self->_healthStore executeQuery:self->_analysisQuery];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __42__HKMCAnalysisProvider_startAnalysisQuery__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleAnalysisQueryResult:v7 error:v6];
}

- (void)_handleAnalysisQueryResult:(id)a3 error:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (v7)
  {
    objc_storeStrong((id *)&self->_lastAnalysis, a3);
    lastError = self->_lastError;
    self->_lastError = 0;

    observers = self->_observers;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __57__HKMCAnalysisProvider__handleAnalysisQueryResult_error___block_invoke;
    v24[3] = &unk_2646E9B20;
    v24[4] = self;
    v25 = (NSError *)v7;
    [(HKObserverSet *)observers notifyObservers:v24];
    uint64_t v11 = v25;
LABEL_3:

    goto LABEL_9;
  }
  _HKInitializeLogging();
  v12 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
    -[HKMCAnalysisProvider _handleAnalysisQueryResult:error:](v12, (uint64_t)self, (uint64_t)v8);
  }
  if (!self->_lastAnalysis)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 100, @"Query returned with no analysis and no error");
      v19 = (NSError *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = self->_lastError;
      self->_lastError = v19;
      goto LABEL_3;
    }
    objc_storeStrong((id *)&self->_lastError, a4);
  }
LABEL_9:
  uint64_t v13 = (void *)[(NSMutableArray *)self->_nextAnalysisQueryResultBlocks copy];
  [(NSMutableArray *)self->_nextAnalysisQueryResultBlocks removeAllObjects];
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

uint64_t __57__HKMCAnalysisProvider__handleAnalysisQueryResult_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 analysisProvider:*(void *)(a1 + 32) didUpdateAnalysis:*(void *)(a1 + 40)];
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = (void *)[(HKMCAnalysis *)self->_lastAnalysis copy];
  v5 = (void *)[(NSError *)self->_lastError copy];
  os_unfair_lock_unlock(p_lock);
  id v6 = [NSString stringWithFormat:@"<%@:%p analysis:%@ error:%@>", objc_opt_class(), self, v4, v5];

  return v6;
}

- (void)dealloc
{
  [(HKHealthStore *)self->_healthStore stopQuery:self->_analysisQuery];
  v3.receiver = self;
  v3.super_class = (Class)HKMCAnalysisProvider;
  [(HKMCAnalysisProvider *)&v3 dealloc];
}

- (void)analysisWithCompletion:(id)a3
{
  v9 = (void (**)(id, uint64_t, uint64_t))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = [(HKMCAnalysis *)self->_lastAnalysis copy];
  uint64_t v6 = [(NSError *)self->_lastError copy];
  if (v5 | v6)
  {
    os_unfair_lock_unlock(&self->_lock);
    v9[2](v9, v5, v6);
  }
  else
  {
    nextAnalysisQueryResultBlocks = self->_nextAnalysisQueryResultBlocks;
    id v8 = (void *)MEMORY[0x22A61C290](v9);
    [(NSMutableArray *)nextAnalysisQueryResultBlocks addObject:v8];

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  id v6 = a3;
  [(HKObserverSet *)self->_observers registerObserver:v6 queue:a4];
  os_unfair_lock_lock(&self->_lock);
  id v7 = (void *)[(HKMCAnalysis *)self->_lastAnalysis copy];
  os_unfair_lock_unlock(&self->_lock);
  if (v7)
  {
    observers = self->_observers;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __42__HKMCAnalysisProvider_addObserver_queue___block_invoke;
    v9[3] = &unk_2646E9B20;
    v9[4] = self;
    id v10 = v7;
    [(HKObserverSet *)observers notifyObserver:v6 handler:v9];
  }
}

uint64_t __42__HKMCAnalysisProvider_addObserver_queue___block_invoke(uint64_t a1, void *a2)
{
  return [a2 analysisProvider:*(void *)(a1 + 32) didUpdateAnalysis:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
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
  objc_storeStrong((id *)&self->_lastAnalysis, 0);
  objc_storeStrong((id *)&self->_analysisQuery, 0);
  objc_storeStrong((id *)&self->_nextAnalysisQueryResultBlocks, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)_handleAnalysisQueryResult:(uint64_t)a3 error:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_2249E9000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error in analysis query: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end