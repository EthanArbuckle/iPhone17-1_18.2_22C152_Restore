@interface DNDSReachability
+ (id)commonReachability;
- (BOOL)isInitialized;
- (BOOL)isReachable;
- (BOOL)lastInformedReachability;
- (DNDSReachability)init;
- (NSHashTable)delegates;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)debounceTimer;
- (OS_nw_path_monitor)pathMonitor;
- (void)_informDelegates;
- (void)_setReachable:(BOOL)a3;
- (void)_updateHandlerForPath:(id)a3;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)removeDelegate:(id)a3;
- (void)setInitialized:(BOOL)a3;
- (void)setLastInformedReachability:(BOOL)a3;
- (void)setReachable:(BOOL)a3;
- (void)setupPathMonitor;
@end

@implementation DNDSReachability

- (DNDSReachability)init
{
  v13.receiver = self;
  v13.super_class = (Class)DNDSReachability;
  id v2 = [(DNDSReachability *)&v13 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.donotdisturb.reachability", v3);
    v5 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v4;

    dispatch_source_t v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v2 + 3));
    v7 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v6;

    nw_path_monitor_t v8 = nw_path_monitor_create();
    v9 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v8;

    uint64_t v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v11 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v10;

    *((unsigned char *)v2 + 10) = 0;
    [v2 setupPathMonitor];
  }
  return (DNDSReachability *)v2;
}

+ (id)commonReachability
{
  if (commonReachability_onceToken != -1) {
    dispatch_once(&commonReachability_onceToken, &__block_literal_global_9);
  }
  id v2 = (void *)commonReachability_reachability;
  return v2;
}

uint64_t __38__DNDSReachability_commonReachability__block_invoke()
{
  v0 = objc_alloc_init(DNDSReachability);
  uint64_t v1 = commonReachability_reachability;
  commonReachability_reachability = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)dealloc
{
  v3 = [(DNDSReachability *)self debounceTimer];
  dispatch_resume(v3);

  dispatch_queue_t v4 = [(DNDSReachability *)self debounceTimer];
  dispatch_source_cancel(v4);

  v5.receiver = self;
  v5.super_class = (Class)DNDSReachability;
  [(DNDSReachability *)&v5 dealloc];
}

- (void)_updateHandlerForPath:(id)a3
{
  dispatch_queue_t v4 = a3;
  objc_super v5 = [(DNDSReachability *)self queue];
  dispatch_assert_queue_V2(v5);

  nw_path_status_t status = nw_path_get_status(v4);
  [(DNDSReachability *)self _setReachable:(status & 0xFFFFFFFD) == 1];
  if (![(DNDSReachability *)self isInitialized])
  {
    [(DNDSReachability *)self setInitialized:1];
    [(DNDSReachability *)self setLastInformedReachability:(status & 0xFFFFFFFD) == 1];
  }
}

- (void)setupPathMonitor
{
  v3 = [(DNDSReachability *)self pathMonitor];
  update_handler[0] = MEMORY[0x1E4F143A8];
  update_handler[1] = 3221225472;
  update_handler[2] = __36__DNDSReachability_setupPathMonitor__block_invoke;
  update_handler[3] = &unk_1E69740F0;
  update_handler[4] = self;
  nw_path_monitor_set_update_handler(v3, update_handler);

  dispatch_queue_t v4 = [(DNDSReachability *)self pathMonitor];
  objc_super v5 = [(DNDSReachability *)self queue];
  nw_path_monitor_set_queue(v4, v5);

  debounceTimer = self->_debounceTimer;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__DNDSReachability_setupPathMonitor__block_invoke_2;
  v7[3] = &unk_1E6973540;
  v7[4] = self;
  dispatch_source_set_event_handler(debounceTimer, v7);
}

uint64_t __36__DNDSReachability_setupPathMonitor__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateHandlerForPath:a2];
}

uint64_t __36__DNDSReachability_setupPathMonitor__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _informDelegates];
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(DNDSReachability *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__DNDSReachability_addDelegate___block_invoke;
  v7[3] = &unk_1E69735B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __32__DNDSReachability_addDelegate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegates];
  uint64_t v3 = [v2 count];

  if (!v3)
  {
    id v4 = [*(id *)(a1 + 32) debounceTimer];
    dispatch_source_set_timer(v4, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);

    objc_super v5 = [*(id *)(a1 + 32) debounceTimer];
    dispatch_resume(v5);

    id v6 = [*(id *)(a1 + 32) pathMonitor];
    nw_path_monitor_start(v6);

    evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
    if (evaluator_for_endpoint)
    {
      id v8 = (void *)nw_path_evaluator_copy_path();
      [*(id *)(a1 + 32) _updateHandlerForPath:v8];
    }
  }
  id v9 = [*(id *)(a1 + 32) delegates];
  [v9 addObject:*(void *)(a1 + 40)];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(DNDSReachability *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__DNDSReachability_removeDelegate___block_invoke;
  v7[3] = &unk_1E69735B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __35__DNDSReachability_removeDelegate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegates];
  [v2 removeObject:*(void *)(a1 + 40)];

  uint64_t v3 = [*(id *)(a1 + 32) delegates];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    objc_super v5 = [*(id *)(a1 + 32) debounceTimer];
    dispatch_suspend(v5);

    id v6 = [*(id *)(a1 + 32) pathMonitor];
    nw_path_monitor_cancel(v6);

    v7 = *(void **)(a1 + 32);
    [v7 setInitialized:0];
  }
}

- (void)_setReachable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [(DNDSReachability *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(DNDSReachability *)self isReachable] != v3)
  {
    self->_reachable = v3;
    if ([(DNDSReachability *)self isInitialized])
    {
      id v6 = (void *)DNDSLogSystemState;
      if (os_log_type_enabled((os_log_t)DNDSLogSystemState, OS_LOG_TYPE_INFO))
      {
        v7 = NSNumber;
        id v8 = v6;
        id v9 = [v7 numberWithBool:v3];
        int v12 = 138412290;
        objc_super v13 = v9;
        _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_INFO, "Informed of reachability change to %@", (uint8_t *)&v12, 0xCu);
      }
      uint64_t v10 = [(DNDSReachability *)self debounceTimer];
      dispatch_time_t v11 = dispatch_walltime(0, 1000000000);
      dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    }
  }
}

- (void)_informDelegates
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(DNDSReachability *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(DNDSReachability *)self isReachable];
  BOOL v5 = [(DNDSReachability *)self lastInformedReachability];
  id v6 = (void *)DNDSLogSystemState;
  BOOL v7 = os_log_type_enabled((os_log_t)DNDSLogSystemState, OS_LOG_TYPE_DEFAULT);
  if (v4 == v5)
  {
    if (v7)
    {
      v16 = NSNumber;
      v17 = v6;
      v18 = [v16 numberWithBool:v4];
      *(_DWORD *)buf = 138412290;
      v25 = v18;
      _os_log_impl(&dword_1D3052000, v17, OS_LOG_TYPE_DEFAULT, "Debounced reachability state (%@) did not change. Ignoring.", buf, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      id v8 = NSNumber;
      id v9 = v6;
      uint64_t v10 = [v8 numberWithBool:v4];
      *(_DWORD *)buf = 138412290;
      v25 = v10;
      _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "Informing delegates of debounced reachability state: %@", buf, 0xCu);
    }
    [(DNDSReachability *)self setLastInformedReachability:v4];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    dispatch_time_t v11 = [(DNDSReachability *)self delegates];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * v15++) reachabilityChangedTo:v4];
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
  }
}

- (OS_nw_path_monitor)pathMonitor
{
  return self->_pathMonitor;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_source)debounceTimer
{
  return self->_debounceTimer;
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (BOOL)isReachable
{
  return self->_reachable;
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (BOOL)lastInformedReachability
{
  return self->_lastInformedReachability;
}

- (void)setLastInformedReachability:(BOOL)a3
{
  self->_lastInformedReachability = a3;
}

- (BOOL)isInitialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_debounceTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pathMonitor, 0);
}

@end