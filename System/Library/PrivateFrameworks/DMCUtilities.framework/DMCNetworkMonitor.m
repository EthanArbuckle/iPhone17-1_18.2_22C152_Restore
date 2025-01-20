@interface DMCNetworkMonitor
- (BOOL)_deviceMightHaveNetwork;
- (BOOL)isMonitoring;
- (DMCNetworkMonitor)init;
- (NSMutableArray)cachedCompletionHandlers;
- (NWPathEvaluator)pathEvaluator;
- (OS_dispatch_queue)workerQueue;
- (OS_nw_path_monitor)pathMonitor;
- (id)_interfaceType;
- (void)_evaluateNetwork;
- (void)_notifyAllClients;
- (void)_startMonitoring;
- (void)_stopMonitoring;
- (void)dealloc;
- (void)setCachedCompletionHandlers:(id)a3;
- (void)setIsMonitoring:(BOOL)a3;
- (void)setPathEvaluator:(id)a3;
- (void)setPathMonitor:(id)a3;
- (void)setWorkerQueue:(id)a3;
- (void)waitForNetworkWithCompletionHandler:(id)a3;
@end

@implementation DMCNetworkMonitor

- (DMCNetworkMonitor)init
{
  v10.receiver = self;
  v10.super_class = (Class)DMCNetworkMonitor;
  v2 = [(DMCNetworkMonitor *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    pathEvaluator = v2->_pathEvaluator;
    v2->_pathEvaluator = (NWPathEvaluator *)v3;

    uint64_t v5 = objc_opt_new();
    cachedCompletionHandlers = v2->_cachedCompletionHandlers;
    v2->_cachedCompletionHandlers = (NSMutableArray *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.DMCNetworkMonitor.worker-queue", 0);
    workerQueue = v2->_workerQueue;
    v2->_workerQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)dealloc
{
  [(DMCNetworkMonitor *)self _stopMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)DMCNetworkMonitor;
  [(DMCNetworkMonitor *)&v3 dealloc];
}

- (void)waitForNetworkWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DMCNetworkMonitor *)self workerQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__DMCNetworkMonitor_waitForNetworkWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5CFD8D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __57__DMCNetworkMonitor_waitForNetworkWithCompletionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _deviceMightHaveNetwork])
  {
    v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v2();
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) cachedCompletionHandlers];
    uint64_t v5 = (void *)MEMORY[0x1AD0D2220](*(void *)(a1 + 40));
    [v4 addObject:v5];

    uint64_t result = [*(id *)(a1 + 32) isMonitoring];
    if ((result & 1) == 0)
    {
      id v6 = *(void **)(a1 + 32);
      return [v6 _startMonitoring];
    }
  }
  return result;
}

- (void)_notifyAllClients
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v3 = [(DMCNetworkMonitor *)self cachedCompletionHandlers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  id v8 = [(DMCNetworkMonitor *)self cachedCompletionHandlers];
  [v8 removeAllObjects];
}

- (void)_startMonitoring
{
  [(DMCNetworkMonitor *)self setIsMonitoring:1];
  nw_path_monitor_t v3 = nw_path_monitor_create();
  [(DMCNetworkMonitor *)self setPathMonitor:v3];

  uint64_t v4 = [(DMCNetworkMonitor *)self pathMonitor];
  uint64_t v5 = [(DMCNetworkMonitor *)self workerQueue];
  nw_path_monitor_set_queue(v4, v5);

  uint64_t v6 = [(DMCNetworkMonitor *)self pathMonitor];
  update_handler[0] = MEMORY[0x1E4F143A8];
  update_handler[1] = 3221225472;
  update_handler[2] = __37__DMCNetworkMonitor__startMonitoring__block_invoke;
  update_handler[3] = &unk_1E5CFD8F8;
  update_handler[4] = self;
  nw_path_monitor_set_update_handler(v6, update_handler);

  uint64_t v7 = [(DMCNetworkMonitor *)self pathMonitor];
  nw_path_monitor_start(v7);
}

uint64_t __37__DMCNetworkMonitor__startMonitoring__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _evaluateNetwork];
}

- (void)_stopMonitoring
{
  nw_path_monitor_t v3 = [(DMCNetworkMonitor *)self pathMonitor];
  nw_path_monitor_cancel(v3);

  [(DMCNetworkMonitor *)self setPathMonitor:0];
  [(DMCNetworkMonitor *)self setIsMonitoring:0];
}

- (BOOL)_deviceMightHaveNetwork
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  nw_path_monitor_t v3 = [(DMCNetworkMonitor *)self pathEvaluator];
  uint64_t v4 = [v3 path];
  uint64_t v5 = [v4 status];

  if ((v5 | 2) != 3) {
    return 0;
  }
  uint64_t v6 = DMCLogObjects()[1];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    id v8 = [(DMCNetworkMonitor *)self pathEvaluator];
    long long v9 = [v8 path];
    uint64_t v10 = [v9 status];
    long long v11 = [(DMCNetworkMonitor *)self _interfaceType];
    int v13 = 134218242;
    uint64_t v14 = v10;
    __int16 v15 = 2114;
    v16 = v11;
    _os_log_impl(&dword_1A7863000, v7, OS_LOG_TYPE_DEFAULT, "Device might have network now. path status: %ld, interface type: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  return 1;
}

- (id)_interfaceType
{
  v2 = [(DMCNetworkMonitor *)self pathEvaluator];
  nw_path_monitor_t v3 = [v2 path];
  uint64_t v4 = [v3 interface];
  unint64_t v5 = [v4 type];

  if (v5 > 4) {
    return @"Cellular";
  }
  else {
    return off_1E5CFD940[v5];
  }
}

- (void)_evaluateNetwork
{
  nw_path_monitor_t v3 = [(DMCNetworkMonitor *)self workerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__DMCNetworkMonitor__evaluateNetwork__block_invoke;
  block[3] = &unk_1E5CFD920;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __37__DMCNetworkMonitor__evaluateNetwork__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _deviceMightHaveNetwork];
  if (result)
  {
    [*(id *)(a1 + 32) _notifyAllClients];
    nw_path_monitor_t v3 = *(void **)(a1 + 32);
    return [v3 _stopMonitoring];
  }
  return result;
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (NSMutableArray)cachedCompletionHandlers
{
  return self->_cachedCompletionHandlers;
}

- (void)setCachedCompletionHandlers:(id)a3
{
}

- (NWPathEvaluator)pathEvaluator
{
  return self->_pathEvaluator;
}

- (void)setPathEvaluator:(id)a3
{
}

- (OS_nw_path_monitor)pathMonitor
{
  return self->_pathMonitor;
}

- (void)setPathMonitor:(id)a3
{
}

- (BOOL)isMonitoring
{
  return self->_isMonitoring;
}

- (void)setIsMonitoring:(BOOL)a3
{
  self->_isMonitoring = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathMonitor, 0);
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_cachedCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
}

@end