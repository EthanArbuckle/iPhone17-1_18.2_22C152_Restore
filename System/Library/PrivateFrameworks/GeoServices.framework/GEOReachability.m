@interface GEOReachability
+ (id)sharedReachability;
- (BOOL)anyFailures;
- (BOOL)networkAvailable;
- (GEOReachability)init;
- (void)_offlineStateChanged:(id)a3;
- (void)_reachabilityChanged:(id)a3;
- (void)_resetErrors;
- (void)dealloc;
- (void)reportLoadFailure:(id)a3;
- (void)reportTileLoadSuccess:(id)a3;
@end

@implementation GEOReachability

+ (id)sharedReachability
{
  if (_MergedGlobals_311 != -1) {
    dispatch_once(&_MergedGlobals_311, &__block_literal_global_172);
  }
  v2 = (void *)qword_1EB2A0398;

  return v2;
}

- (void)reportTileLoadSuccess:(id)a3
{
  id v4 = [a3 objectForKey:@"GEOTileLoadResultSource"];
  if ([v4 integerValue] == 2) {
    [(GEOReachability *)self _resetErrors];
  }
}

- (void)_resetErrors
{
  if (self->_errorCount || self->_xpcErrors)
  {
    self->_errorCount = 0;
    self->_xpcErrors = 0;
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"GEOReachabilityChangedNotification" object:self];
  }
}

void __37__GEOReachability_sharedReachability__block_invoke()
{
  v0 = objc_alloc_init(GEOReachability);
  v1 = (void *)qword_1EB2A0398;
  qword_1EB2A0398 = (uint64_t)v0;
}

- (GEOReachability)init
{
  v15.receiver = self;
  v15.super_class = (Class)GEOReachability;
  v2 = [(GEOReachability *)&v15 init];
  id v3 = v2;
  if (v2)
  {
    v2->_networkReachable = 1;
    id v4 = +[GEOResourceManifestManager modernManager];
    v5 = MEMORY[0x1E4F14428];
    [v4 addTileGroupObserver:v3 queue:MEMORY[0x1E4F14428]];

    v6 = +[GEONetworkObserver sharedNetworkObserver];
    v3->_networkReachable = [v6 isNetworkReachable];

    v7 = +[GEONetworkObserver sharedNetworkObserver];
    [v7 addNetworkReachableObserver:v3 selector:sel__reachabilityChanged_];

    objc_initWeak(&location, v3);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __23__GEOReachability_init__block_invoke;
    handler[3] = &unk_1E53DD2C0;
    objc_copyWeak(&v13, &location);
    notify_register_dispatch("com.apple.symptoms.hasAlternateAdvice", &v3->_symptomsAlternateAdviceToken, v5, handler);

    if (GEOConfigGetBOOL(GeoServicesConfig_DaemonLaunchShouldRetryFailedXPCTileLoads, (uint64_t)off_1E9114E98))
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __23__GEOReachability_init__block_invoke_2;
      v10[3] = &unk_1E53DD2C0;
      objc_copyWeak(&v11, &location);
      notify_register_dispatch("GEODaemonDidStartDarwinNotification", &v3->_daemonLaunchNotifyToken, MEMORY[0x1E4F14428], v10);

      objc_destroyWeak(&v11);
    }
    else
    {
      v3->_daemonLaunchNotifyToken = -1;
    }
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v3 selector:sel__offlineStateChanged_ name:@"GEOOfflineStateChangedNotification" object:0];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __23__GEOReachability_init__block_invoke(uint64_t a1, int a2)
{
  if (GEOConfigGetBOOL(GeoServicesConfig_SymptomsAlternateAdviceShouldRetry, (uint64_t)off_1E9113C38))
  {
    uint64_t state64 = 0;
    notify_get_state(a2, &state64);
    if (state64 == 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      [WeakRetained _resetErrors];
    }
  }
}

void __23__GEOReachability_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[4])
  {
    v2 = WeakRetained;
    [WeakRetained _resetErrors];
    id WeakRetained = v2;
  }
}

- (void)dealloc
{
  notify_cancel(self->_symptomsAlternateAdviceToken);
  int daemonLaunchNotifyToken = self->_daemonLaunchNotifyToken;
  if (daemonLaunchNotifyToken != -1) {
    notify_cancel(daemonLaunchNotifyToken);
  }
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5 = +[GEOResourceManifestManager modernManager];
  [v5 removeTileGroupObserver:self];

  v6 = +[GEONetworkObserver sharedNetworkObserver];
  [v6 removeNetworkReachableObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)GEOReachability;
  [(GEOReachability *)&v7 dealloc];
}

- (BOOL)anyFailures
{
  return self->_errorCount || self->_xpcErrors != 0;
}

- (void)reportLoadFailure:(id)a3
{
  id v4 = a3;
  v5 = [v4 domain];
  v6 = GEOErrorDomain();
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    uint64_t v8 = [v4 code];
    if ((unint64_t)(v8 + 301) < 2 || v8 == -15) {
      ++self->_xpcErrors;
    }
  }
  id v13 = v4;
  v9 = GEOErrorDomain();
  v10 = [v13 domain];
  int v11 = [v9 isEqualToString:v10];

  if (!v11 || (uint64_t v12 = [v13 code], v12 == -213) || v12 == -11 || v12 == -7)
  {

    ++self->_errorCount;
  }
  else
  {
  }
}

- (BOOL)networkAvailable
{
  return self->_networkReachable;
}

- (void)_reachabilityChanged:(id)a3
{
  id v4 = [a3 userInfo];
  id v8 = [v4 objectForKey:@"GEONetworkObserverReachable"];

  BOOL networkReachable = self->_networkReachable;
  int v6 = [v8 BOOLValue];
  self->_BOOL networkReachable = v6;
  if (v6) {
    BOOL v7 = !networkReachable;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    [(GEOReachability *)self _resetErrors];
  }
}

- (void)_offlineStateChanged:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"GEOReachabilityChangedNotification" object:self];
}

@end