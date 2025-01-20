@interface ARProcessMonitor
+ (BOOL)processIsDaemon:(int)a3 error:(id *)a4;
- (ARProcessMonitor)init;
- (ARProcessMonitorStateChangeDelegate)delegate;
- (void)dealloc;
- (void)handleStateUpdate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startMonitoringPID:(int)a3;
- (void)stopMonitoringPID:(int)a3;
- (void)updateProcessMonitorConfig:(id)a3 withPredicates:(id)a4;
@end

@implementation ARProcessMonitor

- (ARProcessMonitor)init
{
  v12.receiver = self;
  v12.super_class = (Class)ARProcessMonitor;
  v2 = [(ARProcessMonitor *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    pidsToObserve = v2->_pidsToObserve;
    v2->_pidsToObserve = (NSMutableDictionary *)v3;

    v2->_pidsLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v2);
    v5 = (void *)MEMORY[0x263F645C0];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __24__ARProcessMonitor_init__block_invoke;
    v9[3] = &unk_265206EA8;
    objc_copyWeak(&v10, &location);
    uint64_t v6 = [v5 monitorWithConfiguration:v9];
    processMonitor = v2->_processMonitor;
    v2->_processMonitor = (RBSProcessMonitor *)v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __24__ARProcessMonitor_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained updateProcessMonitorConfig:v3 withPredicates:MEMORY[0x263EFFA68]];
}

- (void)dealloc
{
  [(RBSProcessMonitor *)self->_processMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ARProcessMonitor;
  [(ARProcessMonitor *)&v3 dealloc];
}

+ (BOOL)processIsDaemon:(int)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v7 = objc_msgSend(MEMORY[0x263F64580], "identifierWithPid:");
  if (v7)
  {
    v8 = [MEMORY[0x263F64570] handleForIdentifier:v7 error:a4];
    v9 = v8;
    if (v8 && (!a4 || !*a4))
    {
      char v14 = [v8 isDaemon];
      goto LABEL_12;
    }
    id v10 = _ARLogProcessMonitor();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      objc_super v12 = NSStringFromClass(v11);
      int v16 = 138543874;
      v17 = v12;
      __int16 v18 = 2048;
      id v19 = a1;
      __int16 v20 = 1024;
      int v21 = a3;
      _os_log_impl(&dword_24719A000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create a process handle for pid %d", (uint8_t *)&v16, 0x1Cu);
    }
    goto LABEL_9;
  }
  v9 = _ARLogProcessMonitor();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v13 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v13);
    int v16 = 138543874;
    v17 = v10;
    __int16 v18 = 2048;
    id v19 = a1;
    __int16 v20 = 1024;
    int v21 = a3;
    _os_log_impl(&dword_24719A000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not find a process identifier for pid %d", (uint8_t *)&v16, 0x1Cu);
LABEL_9:
  }
  char v14 = 0;
LABEL_12:

  return v14;
}

- (void)startMonitoringPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  p_pidsLock = &self->_pidsLock;
  os_unfair_lock_lock(&self->_pidsLock);
  pidsToObserve = self->_pidsToObserve;
  v7 = [NSNumber numberWithInt:v3];
  v8 = [(NSMutableDictionary *)pidsToObserve objectForKeyedSubscript:v7];

  if (!v8)
  {
    v9 = _ARLogProcessMonitor();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138543874;
      v25 = v11;
      __int16 v26 = 2048;
      v27 = self;
      __int16 v28 = 1024;
      int v29 = v3;
      _os_log_impl(&dword_24719A000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Adding PID to monitor: %d", buf, 0x1Cu);
    }
    objc_super v12 = [MEMORY[0x263F64580] identifierWithPid:v3];
    if (v12)
    {
      v13 = [MEMORY[0x263F645D8] predicateMatchingIdentifier:v12];
      char v14 = self->_pidsToObserve;
      v15 = [NSNumber numberWithInt:v3];
      [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];

      int v16 = [(NSMutableDictionary *)self->_pidsToObserve allValues];
      objc_initWeak((id *)buf, self);
      processMonitor = self->_processMonitor;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __39__ARProcessMonitor_startMonitoringPID___block_invoke;
      v21[3] = &unk_265206ED0;
      objc_copyWeak(&v23, (id *)buf);
      id v18 = v16;
      id v22 = v18;
      [(RBSProcessMonitor *)processMonitor updateConfiguration:v21];

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v13 = _ARLogProcessMonitor();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v19 = (objc_class *)objc_opt_class();
        __int16 v20 = NSStringFromClass(v19);
        *(_DWORD *)buf = 138543874;
        v25 = v20;
        __int16 v26 = 2048;
        v27 = self;
        __int16 v28 = 1024;
        int v29 = v3;
        _os_log_impl(&dword_24719A000, v13, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not find a process identifier for pid %d", buf, 0x1Cu);
      }
    }
  }
  os_unfair_lock_unlock(p_pidsLock);
}

void __39__ARProcessMonitor_startMonitoringPID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained updateProcessMonitorConfig:v4 withPredicates:*(void *)(a1 + 32)];
}

- (void)stopMonitoringPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  p_pidsLock = &self->_pidsLock;
  os_unfair_lock_lock(&self->_pidsLock);
  pidsToObserve = self->_pidsToObserve;
  v7 = [NSNumber numberWithInt:v3];
  v8 = [(NSMutableDictionary *)pidsToObserve objectForKeyedSubscript:v7];

  v9 = _ARLogProcessMonitor();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      v11 = (objc_class *)objc_opt_class();
      objc_super v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138543874;
      id v23 = v12;
      __int16 v24 = 2048;
      v25 = self;
      __int16 v26 = 1024;
      int v27 = v3;
      _os_log_impl(&dword_24719A000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Removing PID to Monitor: %d", buf, 0x1Cu);
    }
    v13 = self->_pidsToObserve;
    char v14 = [NSNumber numberWithInt:v3];
    [(NSMutableDictionary *)v13 removeObjectForKey:v14];

    v15 = [(NSMutableDictionary *)self->_pidsToObserve allValues];
    objc_initWeak((id *)buf, self);
    processMonitor = self->_processMonitor;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __38__ARProcessMonitor_stopMonitoringPID___block_invoke;
    v19[3] = &unk_265206ED0;
    objc_copyWeak(&v21, (id *)buf);
    v9 = v15;
    __int16 v20 = v9;
    [(RBSProcessMonitor *)processMonitor updateConfiguration:v19];

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  else if (v10)
  {
    v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    *(_DWORD *)buf = 138543874;
    id v23 = v18;
    __int16 v24 = 2048;
    v25 = self;
    __int16 v26 = 1024;
    int v27 = v3;
    _os_log_impl(&dword_24719A000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Warning: Removing PID to Monitor that's not being monitored: %d", buf, 0x1Cu);
  }
  os_unfair_lock_unlock(p_pidsLock);
}

void __38__ARProcessMonitor_stopMonitoringPID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained updateProcessMonitorConfig:v4 withPredicates:*(void *)(a1 + 32)];
}

- (void)updateProcessMonitorConfig:(id)a3 withPredicates:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _ARLogProcessMonitor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    BOOL v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138543618;
    __int16 v20 = v10;
    __int16 v21 = 2048;
    id v22 = self;
    _os_log_impl(&dword_24719A000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Updating process monitor with new predicates", buf, 0x16u);
  }
  v11 = [MEMORY[0x263F645E8] descriptor];
  [v11 setValues:1];
  id v18 = @"com.apple.frontboard.visibility";
  objc_super v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
  [v11 setEndowmentNamespaces:v12];

  [v6 setStateDescriptor:v11];
  [v6 setPredicates:v7];
  objc_initWeak((id *)buf, self);
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __62__ARProcessMonitor_updateProcessMonitorConfig_withPredicates___block_invoke;
  int v16 = &unk_265206EF8;
  objc_copyWeak(&v17, (id *)buf);
  [v6 setUpdateHandler:&v13];
  objc_msgSend(v6, "setServiceClass:", 21, v13, v14, v15, v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __62__ARProcessMonitor_updateProcessMonitorConfig_withPredicates___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained handleStateUpdate:v5];
}

- (void)handleStateUpdate:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [[ARProcessMonitorStateUpdate alloc] initWithRBSProcessStateUpdate:v4];

  id v6 = _ARLogProcessMonitor();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    int v10 = 138543874;
    v11 = v8;
    __int16 v12 = 2048;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_24719A000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Notifying delegate of update: %@", (uint8_t *)&v10, 0x20u);
  }
  v9 = [(ARProcessMonitor *)self delegate];
  [v9 processMonitor:self didUpdateState:v5];
}

- (ARProcessMonitorStateChangeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ARProcessMonitorStateChangeDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pidsToObserve, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
}

@end