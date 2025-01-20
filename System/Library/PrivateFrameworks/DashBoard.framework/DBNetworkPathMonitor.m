@interface DBNetworkPathMonitor
- (BOOL)isNetworkReachable;
- (BOOL)networkPathMonitorActive;
- (CARObserverHashTable)observers;
- (DBNetworkPathMonitor)init;
- (NSMutableSet)activeAssertions;
- (OS_dispatch_queue)workQueue;
- (OS_nw_path)currentPath;
- (OS_nw_path_monitor)pathMonitor;
- (id)description;
- (int64_t)networkPath;
- (void)_networkPathUpdated:(id)a3;
- (void)_startNetworkPathMonitorNow;
- (void)_stopNetworkPathMonitorNow;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)init;
- (void)removeObserver:(id)a3;
- (void)setCurrentPath:(id)a3;
- (void)setNetworkPath:(int64_t)a3;
- (void)setNetworkPathMonitorActive:(BOOL)a3;
- (void)setNetworkReachable:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setPathMonitor:(id)a3;
- (void)startNetworkPathMonitorWithIdentifier:(id)a3;
- (void)stopNetworkPathMonitorWithIdentifier:(id)a3;
@end

@implementation DBNetworkPathMonitor

- (DBNetworkPathMonitor)init
{
  v13.receiver = self;
  v13.super_class = (Class)DBNetworkPathMonitor;
  v2 = [(DBNetworkPathMonitor *)&v13 init];
  if (v2)
  {
    v3 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[DBNetworkPathMonitor init]();
    }

    uint64_t v4 = objc_opt_new();
    activeAssertions = v2->_activeAssertions;
    v2->_activeAssertions = (NSMutableSet *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26E1BD3A0];
    observers = v2->_observers;
    v2->_observers = (CARObserverHashTable *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.DashBoard.NetworkPathMonitor", v9);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v10;
  }
  return v2;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_22D6F0000, v0, v1, "dealloc networkPathMonitor %{public}p", v2, v3, v4, v5, v6);
}

- (void)startNetworkPathMonitorWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DBNetworkPathMonitor *)self activeAssertions];
  char v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    v7 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[DBNetworkPathMonitor startNetworkPathMonitorWithIdentifier:]();
    }

    v8 = [(DBNetworkPathMonitor *)self activeAssertions];
    [v8 addObject:v4];

    if (![(DBNetworkPathMonitor *)self networkPathMonitorActive])
    {
      v9 = DBLogForCategory(7uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[DBLocationManager startUpdatingLocationWithIdentifier:]();
      }

      [(DBNetworkPathMonitor *)self _startNetworkPathMonitorNow];
    }
  }
}

- (void)stopNetworkPathMonitorWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DBNetworkPathMonitor *)self activeAssertions];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    v7 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[DBNetworkPathMonitor stopNetworkPathMonitorWithIdentifier:]();
    }

    v8 = [(DBNetworkPathMonitor *)self activeAssertions];
    [v8 removeObject:v4];

    if ([(DBNetworkPathMonitor *)self networkPathMonitorActive])
    {
      v9 = [(DBNetworkPathMonitor *)self activeAssertions];
      uint64_t v10 = [v9 count];

      if (!v10)
      {
        v11 = DBLogForCategory(7uLL);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[DBLocationManager stopUpdatingLocationWithIdentifier:]();
        }

        [(DBNetworkPathMonitor *)self _stopNetworkPathMonitorNow];
      }
    }
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBNetworkPathMonitor *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBNetworkPathMonitor *)self observers];
  [v5 removeObserver:v4];
}

- (void)_startNetworkPathMonitorNow
{
  uint64_t v3 = [(DBNetworkPathMonitor *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__DBNetworkPathMonitor__startNetworkPathMonitorNow__block_invoke;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_async(v3, block);
}

void __51__DBNetworkPathMonitor__startNetworkPathMonitorNow__block_invoke(uint64_t a1)
{
  nw_path_monitor_t v2 = nw_path_monitor_create();
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = (id *)(a1 + 32);
  [v4 setPathMonitor:v2];

  id v5 = [*v3 pathMonitor];

  if (v5)
  {
    objc_initWeak(&location, *v3);
    int v6 = [*v3 pathMonitor];
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __51__DBNetworkPathMonitor__startNetworkPathMonitorNow__block_invoke_76;
    v22 = &unk_2649B6090;
    objc_copyWeak(&v23, &location);
    nw_path_monitor_set_update_handler(v6, &v19);

    v7 = objc_msgSend(*v3, "pathMonitor", v19, v20, v21, v22);
    v8 = [*v3 workQueue];
    nw_path_monitor_set_queue(v7, v8);

    v9 = [*v3 pathMonitor];
    nw_path_monitor_start(v9);

    evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
    if (evaluator_for_endpoint)
    {
      v11 = (void *)nw_path_evaluator_copy_path();
      [*v3 _networkPathUpdated:v11];
    }
    [*v3 setNetworkPathMonitorActive:1];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __51__DBNetworkPathMonitor__startNetworkPathMonitorNow__block_invoke_cold_1((uint64_t)v3, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

void __51__DBNetworkPathMonitor__startNetworkPathMonitorNow__block_invoke_76(uint64_t a1, void *a2)
{
  nw_path_monitor_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _networkPathUpdated:v3];
}

- (void)_stopNetworkPathMonitorNow
{
  id v3 = [(DBNetworkPathMonitor *)self pathMonitor];

  if (v3)
  {
    id v4 = [(DBNetworkPathMonitor *)self pathMonitor];
    nw_path_monitor_cancel(v4);

    [(DBNetworkPathMonitor *)self setPathMonitor:0];
  }
  [(DBNetworkPathMonitor *)self setNetworkPath:0];
}

- (void)_networkPathUpdated:(id)a3
{
  id v4 = a3;
  id v5 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DBNetworkPathMonitor _networkPathUpdated:]();
  }

  int v6 = [(DBNetworkPathMonitor *)self currentPath];
  BOOL is_equal = nw_path_is_equal(v6, v4);

  BOOL v8 = [(DBNetworkPathMonitor *)self isNetworkReachable];
  [(DBNetworkPathMonitor *)self setNetworkReachable:(nw_path_get_status(v4) & 0xFFFFFFFD) == 1];
  if (is_equal)
  {
    if (v8 == [(DBNetworkPathMonitor *)self isNetworkReachable]) {
      goto LABEL_16;
    }
    v9 = [(DBNetworkPathMonitor *)self observers];
    objc_msgSend(v9, "networkPathMonitor:didChangeNetworkReachable:", self, -[DBNetworkPathMonitor isNetworkReachable](self, "isNetworkReachable"));
  }
  else
  {
    uint64_t v10 = 1;
    while (!nw_path_uses_interface_type(v4, (nw_interface_type_t)(v10 - 1)))
    {
      if (++v10 == 6)
      {
        uint64_t v10 = 1;
        goto LABEL_11;
      }
    }
    if ((v10 - 1) > 4) {
      goto LABEL_12;
    }
LABEL_11:
    [(DBNetworkPathMonitor *)self setNetworkPath:v10];
LABEL_12:
    [(DBNetworkPathMonitor *)self setCurrentPath:v4];
    if (v8 != [(DBNetworkPathMonitor *)self isNetworkReachable])
    {
      v11 = [(DBNetworkPathMonitor *)self observers];
      objc_msgSend(v11, "networkPathMonitor:didChangeNetworkReachable:", self, -[DBNetworkPathMonitor isNetworkReachable](self, "isNetworkReachable"));
    }
    v9 = [(DBNetworkPathMonitor *)self observers];
    [v9 networkPathMonitorDidChangeNetworkPath:self];
  }

LABEL_16:
  v12 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[DBNetworkPathMonitor _networkPathUpdated:]();
  }
}

- (id)description
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = [(DBNetworkPathMonitor *)self activeAssertions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v20 + 1) + 8 * i) description];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  unint64_t v10 = [(DBNetworkPathMonitor *)self networkPath];
  if (v10 > 5) {
    v11 = 0;
  }
  else {
    v11 = off_2649B60B0[v10];
  }
  v12 = NSString;
  uint64_t v13 = (objc_class *)objc_opt_class();
  uint64_t v14 = NSStringFromClass(v13);
  uint64_t v15 = @"YES";
  if ([(DBNetworkPathMonitor *)self isNetworkReachable]) {
    uint64_t v16 = @"YES";
  }
  else {
    uint64_t v16 = @"NO";
  }
  if (![(DBNetworkPathMonitor *)self networkPathMonitorActive]) {
    uint64_t v15 = @"NO";
  }
  uint64_t v17 = [v3 componentsJoinedByString:@", "];
  uint64_t v18 = [v12 stringWithFormat:@"<%@: %p path=%@ reachable=%@ active=%@ assertions=[%@]>", v14, self, v11, v16, v15, v17];

  return v18;
}

- (BOOL)isNetworkReachable
{
  return self->_networkReachable;
}

- (void)setNetworkReachable:(BOOL)a3
{
  self->_networkReachable = a3;
}

- (int64_t)networkPath
{
  return self->_networkPath;
}

- (void)setNetworkPath:(int64_t)a3
{
  self->_networkPath = a3;
}

- (OS_nw_path_monitor)pathMonitor
{
  return self->_pathMonitor;
}

- (void)setPathMonitor:(id)a3
{
}

- (OS_nw_path)currentPath
{
  return self->_currentPath;
}

- (void)setCurrentPath:(id)a3
{
}

- (NSMutableSet)activeAssertions
{
  return self->_activeAssertions;
}

- (BOOL)networkPathMonitorActive
{
  return self->_networkPathMonitorActive;
}

- (void)setNetworkPathMonitorActive:(BOOL)a3
{
  self->_networkPathMonitorActive = a3;
}

- (CARObserverHashTable)observers
{
  return (CARObserverHashTable *)objc_getProperty(self, a2, 48, 1);
}

- (void)setObservers:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_activeAssertions, 0);
  objc_storeStrong((id *)&self->_currentPath, 0);
  objc_storeStrong((id *)&self->_pathMonitor, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_22D6F0000, v0, v1, "init networkPathMonitor %{public}p", v2, v3, v4, v5, v6);
}

- (void)startNetworkPathMonitorWithIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_22D6F0000, v0, v1, "%{public}@ startNetworkPathMonitorFor=%{public}@");
}

- (void)stopNetworkPathMonitorWithIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_22D6F0000, v0, v1, "%{public}@ stopNetworkPathMonitorFor=%{public}@");
}

void __51__DBNetworkPathMonitor__startNetworkPathMonitorNow__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_networkPathUpdated:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_22D6F0000, v0, v1, "%{public}@ done", v2, v3, v4, v5, v6);
}

- (void)_networkPathUpdated:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_22D6F0000, v0, v1, "%{public}@ start", v2, v3, v4, v5, v6);
}

@end