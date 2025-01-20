@interface DMTNetworkBackedInternetReachabilityPrimitives
- (BOOL)reachable;
- (DMTNetworkBackedInternetReachabilityPrimitives)init;
- (NWPathEvaluator)pathEvaluator;
- (OS_dispatch_queue)reachabilityMonitorQueue;
- (OS_nw_path_monitor)pathMonitor;
- (id)statusChangedBlock;
- (void)dealloc;
- (void)pathDidChange:(id)a3;
- (void)setReachable:(BOOL)a3;
- (void)setStatusChangedBlock:(id)a3;
@end

@implementation DMTNetworkBackedInternetReachabilityPrimitives

- (void)dealloc
{
  v3 = [(DMTNetworkBackedInternetReachabilityPrimitives *)self pathMonitor];
  nw_path_monitor_cancel(v3);

  v4.receiver = self;
  v4.super_class = (Class)DMTNetworkBackedInternetReachabilityPrimitives;
  [(DMTNetworkBackedInternetReachabilityPrimitives *)&v4 dealloc];
}

- (DMTNetworkBackedInternetReachabilityPrimitives)init
{
  v16.receiver = self;
  v16.super_class = (Class)DMTNetworkBackedInternetReachabilityPrimitives;
  id v2 = [(DMTNetworkBackedInternetReachabilityPrimitives *)&v16 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v5 = dispatch_queue_create((const char *)[v4 UTF8String], 0);
    v6 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v5;

    uint64_t v7 = objc_opt_new();
    v8 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v7;

    nw_path_monitor_t v9 = nw_path_monitor_create();
    v10 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v9;

    nw_path_monitor_set_queue(*((nw_path_monitor_t *)v2 + 4), *((dispatch_queue_t *)v2 + 3));
    objc_initWeak(&location, v2);
    v11 = *((void *)v2 + 4);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __54__DMTNetworkBackedInternetReachabilityPrimitives_init__block_invoke;
    v13[3] = &unk_2649A9CE0;
    objc_copyWeak(&v14, &location);
    nw_path_monitor_set_update_handler(v11, v13);
    nw_path_monitor_start(*((nw_path_monitor_t *)v2 + 4));
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return (DMTNetworkBackedInternetReachabilityPrimitives *)v2;
}

void __54__DMTNetworkBackedInternetReachabilityPrimitives_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained performSelectorOnMainThread:sel_pathDidChange_ withObject:v3 waitUntilDone:0];
}

- (void)pathDidChange:(id)a3
{
  id v4 = [(DMTNetworkBackedInternetReachabilityPrimitives *)self pathEvaluator];
  dispatch_queue_t v5 = [v4 path];
  uint64_t v6 = [v5 status];

  if ((v6 == 1) != [(DMTNetworkBackedInternetReachabilityPrimitives *)self reachable])
  {
    [(DMTNetworkBackedInternetReachabilityPrimitives *)self setReachable:v6 == 1];
    uint64_t v7 = [(DMTNetworkBackedInternetReachabilityPrimitives *)self statusChangedBlock];
    if (v7)
    {
      id v8 = v7;
      ((void (**)(void, BOOL))v7)[2](v7, v6 == 1);
      uint64_t v7 = (void (**)(void, void))v8;
    }
  }
}

- (id)statusChangedBlock
{
  return self->_statusChangedBlock;
}

- (void)setStatusChangedBlock:(id)a3
{
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (OS_dispatch_queue)reachabilityMonitorQueue
{
  return self->_reachabilityMonitorQueue;
}

- (OS_nw_path_monitor)pathMonitor
{
  return self->_pathMonitor;
}

- (NWPathEvaluator)pathEvaluator
{
  return self->_pathEvaluator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_pathMonitor, 0);
  objc_storeStrong((id *)&self->_reachabilityMonitorQueue, 0);
  objc_storeStrong(&self->_statusChangedBlock, 0);
}

@end