@interface EFNetworkStatus
+ (EFNetworkStatus)cellular;
+ (EFNetworkStatus)external;
+ (EFNetworkStatus)wifi;
+ (EFNetworkStatus)wired;
- (BOOL)isAvailable;
- (BOOL)isConstrained;
- (BOOL)isExpensive;
- (EFNetworkStatus)initWithInterfaceType:(int)a3;
- (EFNetworkStatus)initWithPathMonitor:(id)a3;
- (OS_dispatch_queue)monitorQueue;
- (OS_nw_path)currentPath;
- (OS_nw_path_monitor)pathMonitor;
@end

@implementation EFNetworkStatus

void ___ef_log_EFNetworkStatus_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EFNetworkStatus");
  v1 = (void *)_ef_log_EFNetworkStatus_log;
  _ef_log_EFNetworkStatus_log = (uint64_t)v0;
}

+ (EFNetworkStatus)external
{
  if (external_onceToken != -1) {
    dispatch_once(&external_onceToken, &__block_literal_global_4_0);
  }
  v2 = (void *)external_sNetworkStatus;
  return (EFNetworkStatus *)v2;
}

void __27__EFNetworkStatus_external__block_invoke()
{
  nw_path_monitor_t v2 = nw_path_monitor_create();
  os_log_t v0 = [[EFNetworkStatus alloc] initWithPathMonitor:v2];
  v1 = (void *)external_sNetworkStatus;
  external_sNetworkStatus = (uint64_t)v0;
}

+ (EFNetworkStatus)cellular
{
  if (cellular_onceToken != -1) {
    dispatch_once(&cellular_onceToken, &__block_literal_global_6);
  }
  nw_path_monitor_t v2 = (void *)cellular_sNetworkStatus;
  return (EFNetworkStatus *)v2;
}

void __27__EFNetworkStatus_cellular__block_invoke()
{
  os_log_t v0 = [[EFNetworkStatus alloc] initWithInterfaceType:2];
  v1 = (void *)cellular_sNetworkStatus;
  cellular_sNetworkStatus = (uint64_t)v0;
}

+ (EFNetworkStatus)wifi
{
  if (wifi_onceToken != -1) {
    dispatch_once(&wifi_onceToken, &__block_literal_global_8);
  }
  nw_path_monitor_t v2 = (void *)wifi_sNetworkStatus;
  return (EFNetworkStatus *)v2;
}

void __23__EFNetworkStatus_wifi__block_invoke()
{
  os_log_t v0 = [[EFNetworkStatus alloc] initWithInterfaceType:1];
  v1 = (void *)wifi_sNetworkStatus;
  wifi_sNetworkStatus = (uint64_t)v0;
}

+ (EFNetworkStatus)wired
{
  if (wired_onceToken != -1) {
    dispatch_once(&wired_onceToken, &__block_literal_global_10_0);
  }
  nw_path_monitor_t v2 = (void *)wired_sNetworkStatus;
  return (EFNetworkStatus *)v2;
}

void __24__EFNetworkStatus_wired__block_invoke()
{
  os_log_t v0 = [[EFNetworkStatus alloc] initWithInterfaceType:3];
  v1 = (void *)wired_sNetworkStatus;
  wired_sNetworkStatus = (uint64_t)v0;
}

- (EFNetworkStatus)initWithInterfaceType:(int)a3
{
  nw_path_monitor_t v4 = nw_path_monitor_create_with_type((nw_interface_type_t)a3);
  v5 = [(EFNetworkStatus *)self initWithPathMonitor:v4];

  return v5;
}

- (EFNetworkStatus)initWithPathMonitor:(id)a3
{
  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)EFNetworkStatus;
  v6 = [(EFNetworkStatus *)&v25 init];
  v7 = v6;
  if (v6)
  {
    v6->_currentPathLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_pathMonitor, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mail.EFNetworkStatus.monitorQueue", v9);
    monitorQueue = v7->_monitorQueue;
    v7->_monitorQueue = (OS_dispatch_queue *)v10;

    nw_path_monitor_set_queue((nw_path_monitor_t)v7->_pathMonitor, (dispatch_queue_t)v7->_monitorQueue);
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v12);
    id from = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&from, v7);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __39__EFNetworkStatus_initWithPathMonitor___block_invoke;
    v20 = &unk_1E61223F0;
    objc_copyWeak(&v21, &location);
    objc_copyWeak(&v22, &from);
    nw_path_monitor_set_update_handler(v5, &v17);
    nw_path_monitor_start(v5);
    v13 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", 1.0, v17, v18, v19, v20);
    int v14 = [v12 lockWhenCondition:1 beforeDate:v13];

    if (v14)
    {
      [v12 unlock];
    }
    else
    {
      v15 = _ef_log_EFNetworkStatus();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[EFNetworkStatus initWithPathMonitor:](v15);
      }
    }
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __39__EFNetworkStatus_initWithPathMonitor___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (v5)
  {
    os_unfair_lock_lock(v5 + 2);
    objc_storeStrong((id *)&v6[8], a2);
    os_unfair_lock_unlock(v6 + 2);
    [WeakRetained lock];
    [WeakRetained unlockWithCondition:1];
  }
}

- (BOOL)isAvailable
{
  p_currentPathLock = &self->_currentPathLock;
  os_unfair_lock_lock(&self->_currentPathLock);
  nw_path_monitor_t v4 = self->_currentPath;
  os_unfair_lock_unlock(p_currentPathLock);
  if (v4) {
    BOOL v5 = ((nw_path_get_status((nw_path_t)v4) - 1) & 0xFFFFFFFD) == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isExpensive
{
  p_currentPathLock = &self->_currentPathLock;
  os_unfair_lock_lock(&self->_currentPathLock);
  nw_path_monitor_t v4 = self->_currentPath;
  os_unfair_lock_unlock(p_currentPathLock);
  if (v4) {
    BOOL is_expensive = nw_path_is_expensive((nw_path_t)v4);
  }
  else {
    BOOL is_expensive = 0;
  }

  return is_expensive;
}

- (BOOL)isConstrained
{
  p_currentPathLock = &self->_currentPathLock;
  os_unfair_lock_lock(&self->_currentPathLock);
  nw_path_monitor_t v4 = self->_currentPath;
  os_unfair_lock_unlock(p_currentPathLock);
  if (v4) {
    BOOL is_constrained = nw_path_is_constrained((nw_path_t)v4);
  }
  else {
    BOOL is_constrained = 0;
  }

  return is_constrained;
}

- (OS_nw_path_monitor)pathMonitor
{
  return self->_pathMonitor;
}

- (OS_dispatch_queue)monitorQueue
{
  return self->_monitorQueue;
}

- (OS_nw_path)currentPath
{
  return self->_currentPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPath, 0);
  objc_storeStrong((id *)&self->_monitorQueue, 0);
  objc_storeStrong((id *)&self->_pathMonitor, 0);
}

- (void)initWithPathMonitor:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B5A59000, log, OS_LOG_TYPE_FAULT, "Timed out waiting for path initialization", v1, 2u);
}

@end