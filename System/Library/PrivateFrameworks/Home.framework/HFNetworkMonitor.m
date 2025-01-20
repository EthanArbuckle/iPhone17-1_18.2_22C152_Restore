@interface HFNetworkMonitor
+ (id)sharedInstance;
- (BOOL)hasMonitoredNetworkBefore;
- (BOOL)isMonitoringNetwork;
- (BOOL)isNetworkAvailable;
- (BOOL)isNetworkExpensive;
- (HFNetworkMonitor)init;
- (NSNumber)currentNetworkPathIsExpensive;
- (OS_dispatch_queue)accessQueue;
- (OS_nw_path_monitor)networkPathMonitor;
- (id)_observers;
- (int)currentNetworkPathStatus;
- (unint64_t)_addObserver:(id)a3;
- (unint64_t)_removeObserver:(id)a3;
- (void)_notifyObserver:(id)a3 networkIsAvailable:(BOOL)a4;
- (void)_notifyObserver:(id)a3 networkIsExpensive:(BOOL)a4;
- (void)_startMonitoring;
- (void)_stopMonitoring;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAccessQueue:(id)a3;
- (void)setCurrentNetworkPathIsExpensive:(id)a3;
- (void)setCurrentNetworkPathStatus:(int)a3;
- (void)setHasMonitoredNetworkBefore:(BOOL)a3;
- (void)setIsMonitoringNetwork:(BOOL)a3;
- (void)setNetworkPathMonitor:(id)a3;
@end

@implementation HFNetworkMonitor

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__HFNetworkMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_26AB2FD50 != -1) {
    dispatch_once(&qword_26AB2FD50, block);
  }
  v2 = (void *)_MergedGlobals_315;
  return v2;
}

uint64_t __34__HFNetworkMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = _MergedGlobals_315;
  _MergedGlobals_315 = (uint64_t)v1;
  return MEMORY[0x270F9A758](v1, v2);
}

- (HFNetworkMonitor)init
{
  v17.receiver = self;
  v17.super_class = (Class)HFNetworkMonitor;
  uint64_t v2 = [(HFNetworkMonitor *)&v17 init];
  if (v2)
  {
    nw_path_monitor_t v3 = nw_path_monitor_create();
    networkPathMonitor = v2->_networkPathMonitor;
    v2->_networkPathMonitor = (OS_nw_path_monitor *)v3;

    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.Home.HFNetworkMonitor.accessQueue", v5);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v6;

    v8 = [(HFNetworkMonitor *)v2 networkPathMonitor];
    v9 = [(HFNetworkMonitor *)v2 accessQueue];
    nw_path_monitor_set_queue(v8, v9);

    uint64_t v10 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v10;

    objc_initWeak(&location, v2);
    v12 = [(HFNetworkMonitor *)v2 networkPathMonitor];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __24__HFNetworkMonitor_init__block_invoke;
    v14[3] = &unk_26409AFC8;
    objc_copyWeak(&v15, &location);
    nw_path_monitor_set_update_handler(v12, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __24__HFNetworkMonitor_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  nw_path_monitor_t v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained accessQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t status = nw_path_get_status(v3);
  if ([WeakRetained currentNetworkPathStatus] != status)
  {
    [WeakRetained setCurrentNetworkPathStatus:status];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v7 = [WeakRetained _observers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          [WeakRetained _notifyObserver:*(void *)(*((void *)&v27 + 1) + 8 * v11++) networkIsAvailable:status == 1];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v9);
    }
  }
  BOOL is_expensive = nw_path_is_expensive(v3);
  uint64_t v13 = [WeakRetained currentNetworkPathIsExpensive];
  if (!v13
    || (v14 = (void *)v13,
        [WeakRetained currentNetworkPathIsExpensive],
        id v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v15 BOOLValue],
        v15,
        v14,
        is_expensive != v16))
  {
    objc_super v17 = [NSNumber numberWithBool:is_expensive];
    [WeakRetained setCurrentNetworkPathIsExpensive:v17];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v18 = objc_msgSend(WeakRetained, "_observers", 0);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v24;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(v18);
          }
          [WeakRetained _notifyObserver:*(void *)(*((void *)&v23 + 1) + 8 * v22++) networkIsExpensive:is_expensive];
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v20);
    }
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HFNetworkMonitor *)self _addObserver:v4];
  dispatch_queue_t v6 = [(HFNetworkMonitor *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__HFNetworkMonitor_addObserver___block_invoke;
  block[3] = &unk_26408D8A0;
  id v9 = v4;
  unint64_t v10 = v5;
  block[4] = self;
  id v7 = v4;
  dispatch_async(v6, block);
}

void __32__HFNetworkMonitor_addObserver___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _startMonitoring];
  if (*(void *)(a1 + 48) > 1uLL || [*(id *)(a1 + 32) hasMonitoredNetworkBefore])
  {
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:networkIsAvailable:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "currentNetworkPathStatus") == 1);
    nw_path_monitor_t v3 = *(void **)(a1 + 32);
    uint64_t v2 = *(void *)(a1 + 40);
    id v4 = [v3 currentNetworkPathIsExpensive];
    objc_msgSend(v3, "_notifyObserver:networkIsExpensive:", v2, objc_msgSend(v4, "BOOLValue"));
  }
}

- (void)removeObserver:(id)a3
{
  unint64_t v4 = [(HFNetworkMonitor *)self _removeObserver:a3];
  unint64_t v5 = [(HFNetworkMonitor *)self accessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__HFNetworkMonitor_removeObserver___block_invoke;
  v6[3] = &unk_26408FE38;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(v5, v6);
}

uint64_t __35__HFNetworkMonitor_removeObserver___block_invoke(uint64_t result)
{
  if (!*(void *)(result + 40)) {
    return [*(id *)(result + 32) _stopMonitoring];
  }
  return result;
}

- (BOOL)isNetworkAvailable
{
  unint64_t v4 = [(HFNetworkMonitor *)self accessQueue];
  dispatch_assert_queue_not_V2(v4);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  unint64_t v5 = [(HFNetworkMonitor *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__HFNetworkMonitor_isNetworkAvailable__block_invoke;
  block[3] = &unk_26409AFF0;
  void block[5] = &v8;
  block[6] = a2;
  block[4] = self;
  dispatch_sync(v5, block);

  LOBYTE(a2) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a2;
}

uint64_t __38__HFNetworkMonitor_isNetworkAvailable__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isMonitoringNetwork] & 1) == 0)
  {
    nw_path_monitor_t v3 = [MEMORY[0x263F08690] currentHandler];
    [v3 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"HFNetworkMonitor.m" lineNumber:115 description:@"Not actively monitoring network. Add an observer to gain accurate data."];
  }
  uint64_t result = [*(id *)(a1 + 32) currentNetworkPathStatus];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result == 1;
  return result;
}

- (BOOL)isNetworkExpensive
{
  unint64_t v4 = [(HFNetworkMonitor *)self accessQueue];
  dispatch_assert_queue_not_V2(v4);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  unint64_t v5 = [(HFNetworkMonitor *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__HFNetworkMonitor_isNetworkExpensive__block_invoke;
  block[3] = &unk_26409AFF0;
  void block[5] = &v8;
  block[6] = a2;
  block[4] = self;
  dispatch_sync(v5, block);

  LOBYTE(a2) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a2;
}

void __38__HFNetworkMonitor_isNetworkExpensive__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isMonitoringNetwork] & 1) == 0)
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    [v2 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"HFNetworkMonitor.m" lineNumber:127 description:@"Not actively monitoring network. Add an observer to gain accurate data."];
  }
  id v3 = [*(id *)(a1 + 32) currentNetworkPathIsExpensive];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 BOOLValue];
}

- (unint64_t)_addObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  [(NSHashTable *)self->_observers addObject:v5];

  unint64_t v6 = [(NSHashTable *)self->_observers count];
  os_unfair_lock_unlock(p_observersLock);
  return v6;
}

- (unint64_t)_removeObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  [(NSHashTable *)self->_observers removeObject:v5];

  unint64_t v6 = [(NSHashTable *)self->_observers count];
  os_unfair_lock_unlock(p_observersLock);
  return v6;
}

- (id)_observers
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  unint64_t v4 = (void *)[(NSHashTable *)self->_observers copy];
  os_unfair_lock_unlock(p_observersLock);
  return v4;
}

- (void)_startMonitoring
{
  id v3 = [(HFNetworkMonitor *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  if (![(HFNetworkMonitor *)self isMonitoringNetwork])
  {
    unint64_t v4 = [(HFNetworkMonitor *)self networkPathMonitor];
    nw_path_monitor_start(v4);

    [(HFNetworkMonitor *)self setIsMonitoringNetwork:1];
  }
}

- (void)_stopMonitoring
{
  id v3 = [(HFNetworkMonitor *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HFNetworkMonitor *)self isMonitoringNetwork])
  {
    unint64_t v4 = [(HFNetworkMonitor *)self networkPathMonitor];
    nw_path_monitor_cancel(v4);

    [(HFNetworkMonitor *)self setIsMonitoringNetwork:0];
    [(HFNetworkMonitor *)self setHasMonitoredNetworkBefore:1];
  }
}

- (void)_notifyObserver:(id)a3 networkIsAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    if (objc_opt_respondsToSelector()) {
      [v6 networkDidBecomeAvailable:self];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    [v6 networkDidBecomeUnavailable:self];
  }
}

- (void)_notifyObserver:(id)a3 networkIsExpensive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    if (objc_opt_respondsToSelector()) {
      [v6 networkDidBecomeExpensive:self];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    [v6 networkDidBecomeInexpensive:self];
  }
}

- (OS_nw_path_monitor)networkPathMonitor
{
  return self->_networkPathMonitor;
}

- (void)setNetworkPathMonitor:(id)a3
{
}

- (int)currentNetworkPathStatus
{
  return self->_currentNetworkPathStatus;
}

- (void)setCurrentNetworkPathStatus:(int)a3
{
  self->_currentNetworkPathStatus = a3;
}

- (NSNumber)currentNetworkPathIsExpensive
{
  return self->_currentNetworkPathIsExpensive;
}

- (void)setCurrentNetworkPathIsExpensive:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (BOOL)isMonitoringNetwork
{
  return self->_isMonitoringNetwork;
}

- (void)setIsMonitoringNetwork:(BOOL)a3
{
  self->_isMonitoringNetwork = a3;
}

- (BOOL)hasMonitoredNetworkBefore
{
  return self->_hasMonitoredNetworkBefore;
}

- (void)setHasMonitoredNetworkBefore:(BOOL)a3
{
  self->_hasMonitoredNetworkBefore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_currentNetworkPathIsExpensive, 0);
  objc_storeStrong((id *)&self->_networkPathMonitor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end