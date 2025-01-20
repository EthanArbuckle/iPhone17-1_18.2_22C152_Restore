@interface GEONetworkObserver
+ (id)sharedNetworkObserver;
- (BOOL)_isConnectionType:(int)a3;
- (BOOL)isCellConnection;
- (BOOL)isCompanionConnected;
- (BOOL)isNetworkConstrained;
- (BOOL)isNetworkReachable;
- (BOOL)isWiFiConnection;
- (GEONetworkObserver)init;
- (void)_initializeNetworkMonitor;
- (void)_networkPathUpdated:(id)a3;
- (void)addNetworkReachableObserver:(id)a3 selector:(SEL)a4;
- (void)dealloc;
- (void)initializeIfNecessary;
- (void)removeNetworkReachableObserver:(id)a3;
@end

@implementation GEONetworkObserver

- (BOOL)isWiFiConnection
{
  return [(GEONetworkObserver *)self _isConnectionType:1];
}

unsigned char *__43__GEONetworkObserver_initializeIfNecessary__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[32]) {
    return (unsigned char *)[result _initializeNetworkMonitor];
  }
  return result;
}

unsigned char *__40__GEONetworkObserver_isNetworkReachable__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[32])
  {
    [result _initializeNetworkMonitor];
    result = *(unsigned char **)(a1 + 32);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result[33];
  return result;
}

+ (id)sharedNetworkObserver
{
  if (qword_1EB29FC80 != -1) {
    dispatch_once(&qword_1EB29FC80, &__block_literal_global_96);
  }
  v2 = (void *)_MergedGlobals_246;

  return v2;
}

- (BOOL)isNetworkReachable
{
  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  isolationQueue = v2->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__GEONetworkObserver_isNetworkReachable__block_invoke;
  v5[3] = &unk_1E53D7C00;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)addNetworkReachableObserver:(id)a3 selector:(SEL)a4
{
  if (a3)
  {
    id v6 = a3;
    [(GEONetworkObserver *)self initializeIfNecessary];
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:a4 name:@"GEONetworkObserverNetworkReachableNotification" object:self];
  }
}

- (void)initializeIfNecessary
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__GEONetworkObserver_initializeIfNecessary__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

BOOL __40__GEONetworkObserver__isConnectionType___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 32))
  {
    [(id)v2 _initializeNetworkMonitor];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  BOOL result = nw_path_uses_interface_type(*(nw_path_t *)(v2 + 24), *(nw_interface_type_t *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_isConnectionType:(int)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__GEONetworkObserver__isConnectionType___block_invoke;
  block[3] = &unk_1E53E47F8;
  block[4] = self;
  void block[5] = &v9;
  int v8 = a3;
  dispatch_sync(isolationQueue, block);
  LOBYTE(a3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return a3;
}

void __43__GEONetworkObserver_sharedNetworkObserver__block_invoke()
{
  v0 = objc_alloc_init(GEONetworkObserver);
  v1 = (void *)_MergedGlobals_246;
  _MergedGlobals_246 = (uint64_t)v0;
}

- (GEONetworkObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEONetworkObserver;
  uint64_t v2 = [(GEONetworkObserver *)&v6 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create_with_qos();
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

void __42__GEONetworkObserver__networkPathUpdated___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"GEONetworkObserverNetworkReachableNotification" object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

- (void)_initializeNetworkMonitor
{
  objc_initWeak(&location, self);
  uint64_t v3 = _GEOGetURLWithSource(0, 0, 1, 0);
  if ([v3 length])
  {
    nw_endpoint_t url = nw_endpoint_create_url((const char *)[v3 UTF8String]);
    if (url)
    {
      evaluator_for_endpoint = (OS_nw_path_evaluator *)nw_path_create_evaluator_for_endpoint();
      evaluator = self->_evaluator;
      self->_evaluator = evaluator_for_endpoint;

      if (self->_evaluator)
      {
        nw_path_evaluator_set_queue();
        uint64_t v8 = MEMORY[0x1E4F143A8];
        objc_copyWeak(&v9, &location);
        nw_path_evaluator_set_update_handler();
        id v7 = (void *)nw_path_evaluator_copy_path();
        -[GEONetworkObserver _networkPathUpdated:](self, "_networkPathUpdated:", v7, v8, 3221225472, __47__GEONetworkObserver__initializeNetworkMonitor__block_invoke, &unk_1E53E47D0);
        nw_path_evaluator_start();
        self->_initialized = 1;

        objc_destroyWeak(&v9);
      }
    }
  }
  objc_destroyWeak(&location);
}

- (void)_networkPathUpdated:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  if (v5)
  {
    BOOL networkReachable = self->_networkReachable;
    BOOL networkConstrained = self->_networkConstrained;
    objc_storeStrong((id *)&self->_currentPath, a3);
    unsigned __int32 v8 = nw_path_get_status(v5) & 0xFFFFFFFD;
    BOOL v9 = nw_path_uses_interface_type(v5, nw_interface_type_wifi);
    BOOL v10 = nw_path_uses_interface_type(v5, nw_interface_type_cellular);
    BOOL v11 = nw_path_uses_interface_type(v5, nw_interface_type_wired);
    BOOL v12 = v11;
    BOOL v13 = v8 == 1;
    if (v8 == 1 && !v9) {
      BOOL v13 = v10 || v11;
    }
    self->_BOOL networkReachable = v13;
    self->_BOOL networkConstrained = nw_path_is_constrained(v5);
    v15 = GEOGetNetworkStatusLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      BOOL v16 = self->_networkReachable;
      BOOL is_expensive = nw_path_is_expensive((nw_path_t)self->_currentPath);
      BOOL v18 = self->_networkConstrained;
      *(_DWORD *)buf = 67241728;
      BOOL v31 = v16;
      __int16 v32 = 1026;
      BOOL v33 = v9;
      __int16 v34 = 1026;
      BOOL v35 = v10;
      __int16 v36 = 1026;
      BOOL v37 = v12;
      __int16 v38 = 1026;
      BOOL v39 = is_expensive;
      __int16 v40 = 1026;
      BOOL v41 = v18;
      __int16 v42 = 1026;
      int v43 = 0;
      _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEBUG, "Updating with new path. Reachable: %{public}i, WiFi: %{public}i, Cellular: %{public}i, Wired: %{public}i, Expensive: %{public}i, Constrained: %{public}i, Companion: %{public}i", buf, 0x2Cu);
    }

    if (self->_networkReachable != networkReachable)
    {
      v19 = GEOGetNetworkStatusLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        BOOL v20 = self->_networkReachable;
        *(_DWORD *)buf = 67240448;
        BOOL v31 = networkReachable;
        __int16 v32 = 1026;
        BOOL v33 = v20;
        _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_INFO, "Network reachability changed (%{public}i -> %{public}i). Notifying observers", buf, 0xEu);
      }

      v21 = (void *)MEMORY[0x1E4F1C9E8];
      v22 = [NSNumber numberWithInt:self->_networkReachable];
      v23 = [v21 dictionaryWithObject:v22 forKey:@"GEONetworkObserverReachable"];

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__GEONetworkObserver__networkPathUpdated___block_invoke;
      block[3] = &unk_1E53D8998;
      block[4] = self;
      id v29 = v23;
      id v24 = v23;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    if (self->_networkConstrained != networkConstrained)
    {
      v25 = GEOGetNetworkStatusLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        BOOL v26 = self->_networkConstrained;
        *(_DWORD *)buf = 67240448;
        BOOL v31 = networkConstrained;
        __int16 v32 = 1026;
        BOOL v33 = v26;
        _os_log_impl(&dword_188D96000, v25, OS_LOG_TYPE_INFO, "Constrained network changed (%{public}i -> %{public}i). Notifying.", buf, 0xEu);
      }

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __42__GEONetworkObserver__networkPathUpdated___block_invoke_15;
      v27[3] = &unk_1E53D79D8;
      v27[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], v27);
    }
  }
}

- (void)dealloc
{
  if (self->_evaluator) {
    nw_path_evaluator_cancel();
  }
  v3.receiver = self;
  v3.super_class = (Class)GEONetworkObserver;
  [(GEONetworkObserver *)&v3 dealloc];
}

void __47__GEONetworkObserver__initializeNetworkMonitor__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _networkPathUpdated:v3];
}

void __42__GEONetworkObserver__networkPathUpdated___block_invoke_15(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"GEONetworkObserverConstrainedNetworkDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (BOOL)isNetworkConstrained
{
  id v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  isolationQueue = v2->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__GEONetworkObserver_isNetworkConstrained__block_invoke;
  v5[3] = &unk_1E53D7C00;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

unsigned char *__42__GEONetworkObserver_isNetworkConstrained__block_invoke(uint64_t a1)
{
  BOOL result = *(unsigned char **)(a1 + 32);
  if (!result[32])
  {
    [result _initializeNetworkMonitor];
    BOOL result = *(unsigned char **)(a1 + 32);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result[34];
  return result;
}

- (void)removeNetworkReachableObserver:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  [v6 removeObserver:v5 name:@"GEONetworkObserverNetworkReachableNotification" object:self];
}

- (BOOL)isCellConnection
{
  return [(GEONetworkObserver *)self _isConnectionType:2];
}

- (BOOL)isCompanionConnected
{
  return self->_companionConnected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPath, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);

  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end