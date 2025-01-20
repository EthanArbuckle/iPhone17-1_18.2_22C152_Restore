@interface DBProcessMonitor
- (CARObserverHashTable)observers;
- (CRCarPlayAppPolicyEvaluator)policyEvaluator;
- (DBProcessMonitor)init;
- (NSMapTable)handleMapTable;
- (RBSProcessMonitor)processMonitor;
- (void)_appStateUpdated:(id)a3 processHandle:(id)a4;
- (void)_handleDeathWithIdentifier:(id)a3 isCrash:(BOOL)a4 pid:(int)a5;
- (void)_startMonitoringProcess;
- (void)addObserver:(id)a3;
- (void)invalidate;
- (void)setHandleMapTable:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPolicyEvaluator:(id)a3;
- (void)setProcessMonitor:(id)a3;
@end

@implementation DBProcessMonitor

- (DBProcessMonitor)init
{
  v9.receiver = self;
  v9.super_class = (Class)DBProcessMonitor;
  v2 = [(DBProcessMonitor *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F30E18]);
    uint64_t v4 = [v3 initWithProtocol:&unk_26E1A01C8 callbackQueue:MEMORY[0x263EF83A0]];
    observers = v2->_observers;
    v2->_observers = (CARObserverHashTable *)v4;

    uint64_t v6 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    handleMapTable = v2->_handleMapTable;
    v2->_handleMapTable = (NSMapTable *)v6;

    [(DBProcessMonitor *)v2 _startMonitoringProcess];
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBProcessMonitor *)self observers];
  [v5 addObserver:v4];
}

- (void)_startMonitoringProcess
{
  id v3 = [(DBProcessMonitor *)self processMonitor];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v5 = +[DBApplicationController sharedInstance];
    uint64_t v6 = [v5 allApplications];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __43__DBProcessMonitor__startMonitoringProcess__block_invoke;
    v18[3] = &unk_2649B4DE0;
    id v7 = v4;
    id v19 = v7;
    [v6 enumerateObjectsUsingBlock:v18];

    objc_initWeak(&location, self);
    v8 = (void *)MEMORY[0x263F645C0];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __43__DBProcessMonitor__startMonitoringProcess__block_invoke_2;
    v14 = &unk_2649B4E30;
    id v9 = v7;
    id v15 = v9;
    objc_copyWeak(&v16, &location);
    v10 = [v8 monitorWithConfiguration:&v11];
    -[DBProcessMonitor setProcessMonitor:](self, "setProcessMonitor:", v10, v11, v12, v13, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __43__DBProcessMonitor__startMonitoringProcess__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (void *)MEMORY[0x263F645D8];
  id v5 = [a2 bundleIdentifier];
  id v4 = [v3 predicateMatchingBundleIdentifier:v5];
  [v2 addObject:v4];
}

void __43__DBProcessMonitor__startMonitoringProcess__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setServiceClass:9];
  [v3 setPredicates:*(void *)(a1 + 32)];
  id v4 = [MEMORY[0x263F645E8] descriptor];
  [v3 setStateDescriptor:v4];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__DBProcessMonitor__startMonitoringProcess__block_invoke_3;
  v5[3] = &unk_2649B4E08;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  [v3 setUpdateHandler:v5];
  objc_destroyWeak(&v6);
}

void __43__DBProcessMonitor__startMonitoringProcess__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _appStateUpdated:v6 processHandle:v7];
}

- (void)_handleDeathWithIdentifier:(id)a3 isCrash:(BOOL)a4 pid:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = DBLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromBOOL();
    int v18 = 138543874;
    id v19 = v8;
    __int16 v20 = 2114;
    v21 = v10;
    __int16 v22 = 1026;
    int v23 = v5;
    _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Observed death of process: %{public}@, crashed: %{public}@, pid: %{public}d", (uint8_t *)&v18, 0x1Cu);
  }
  uint64_t v11 = [(DBProcessMonitor *)self handleMapTable];
  uint64_t v12 = [NSNumber numberWithInt:v5];
  v13 = [v11 objectForKey:v12];

  if (v13)
  {
    v14 = [(DBProcessMonitor *)self handleMapTable];
    id v15 = [NSNumber numberWithInt:v5];
    [v14 removeObjectForKey:v15];
  }
  id v16 = [(DBProcessMonitor *)self observers];
  [v16 processMonitor:self shouldHandleDeathOfBundleIdentifier:v8 isCrash:v6];

  v17 = [(DBProcessMonitor *)self observers];
  [v17 processMonitor:self didHandleDeathOfBundleIdentifier:v8];
}

- (void)_appStateUpdated:(id)a3 processHandle:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 state];
  int v9 = [v8 isRunning];

  if (v9)
  {
    v10 = [(DBProcessMonitor *)self handleMapTable];
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "pid"));
    id v12 = [v10 objectForKey:v11];

    if (v12 == v7)
    {
      id v19 = DBLogForCategory(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v20 = [v7 bundle];
        v21 = [v20 identifier];
        *(_DWORD *)buf = 138412290;
        v29 = v21;
        _os_log_impl(&dword_22D6F0000, v19, OS_LOG_TYPE_DEFAULT, "already have handle for process: %@", buf, 0xCu);
      }
    }
    else
    {
      objc_initWeak(&location, self);
      v13 = DBLogForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [v7 bundle];
        id v15 = [v14 identifier];
        int v16 = [v7 pid];
        *(_DWORD *)buf = 138543618;
        v29 = v15;
        __int16 v30 = 1026;
        int v31 = v16;
        _os_log_impl(&dword_22D6F0000, v13, OS_LOG_TYPE_DEFAULT, "Now monitoring process death for identifier: %{public}@, pid: %{public}d", buf, 0x12u);
      }
      uint64_t v22 = MEMORY[0x263EF8330];
      uint64_t v23 = 3221225472;
      uint64_t v24 = __51__DBProcessMonitor__appStateUpdated_processHandle___block_invoke;
      v25 = &unk_2649B5F08;
      objc_copyWeak(&v26, &location);
      [v7 monitorForDeath:&v22];
      v17 = [(DBProcessMonitor *)self handleMapTable];
      int v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "pid"));
      [v17 setObject:v7 forKey:v18];

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
  }
}

void __51__DBProcessMonitor__appStateUpdated_processHandle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v7 = [v6 bundle];
  id v8 = [v7 identifier];
  int v9 = [v5 status];

  uint64_t v10 = [v9 isCrash];
  uint64_t v11 = [v6 pid];

  [WeakRetained _handleDeathWithIdentifier:v8 isCrash:v10 pid:v11];
}

- (void)invalidate
{
  id v3 = [(DBProcessMonitor *)self processMonitor];
  [v3 invalidate];

  [(DBProcessMonitor *)self setProcessMonitor:0];
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (RBSProcessMonitor)processMonitor
{
  return self->_processMonitor;
}

- (void)setProcessMonitor:(id)a3
{
}

- (CRCarPlayAppPolicyEvaluator)policyEvaluator
{
  return self->_policyEvaluator;
}

- (void)setPolicyEvaluator:(id)a3
{
}

- (NSMapTable)handleMapTable
{
  return self->_handleMapTable;
}

- (void)setHandleMapTable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleMapTable, 0);
  objc_storeStrong((id *)&self->_policyEvaluator, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end