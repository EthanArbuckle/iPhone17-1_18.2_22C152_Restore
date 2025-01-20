@interface GKRemoteAlertLauncher
+ (id)shared;
- (BOOL)isLaunching;
- (GKRemoteAlertLauncher)init;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)launchTimeoutTimer;
- (void)cancelLaunchTimeoutTimer;
- (void)dealloc;
- (void)launchBypassingPreAuthentication:(BOOL)a3 forGame:(id)a4 hostPID:(int)a5 deeplink:(id)a6 launchContext:(id)a7 observer:(id)a8;
- (void)notifyDashboardDidLaunch;
- (void)setLaunchTimeoutTimer:(id)a3;
- (void)setQueue:(id)a3;
- (void)startLaunchTimeoutTimer;
@end

@implementation GKRemoteAlertLauncher

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)shared_sharedInstance;

  return v2;
}

uint64_t __31__GKRemoteAlertLauncher_shared__block_invoke()
{
  shared_sharedInstance = objc_alloc_init(GKRemoteAlertLauncher);

  return MEMORY[0x1F41817F8]();
}

- (GKRemoteAlertLauncher)init
{
  v5.receiver = self;
  v5.super_class = (Class)GKRemoteAlertLauncher;
  v2 = [(GKRemoteAlertLauncher *)&v5 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.gamed.remoteAlertQueue", 0);
    [(GKRemoteAlertLauncher *)v2 setQueue:v3];
  }
  return v2;
}

- (void)startLaunchTimeoutTimer
{
  dispatch_queue_t v3 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
  dispatch_time_t v4 = dispatch_walltime(0, 5000000000);
  dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __48__GKRemoteAlertLauncher_startLaunchTimeoutTimer__block_invoke;
  handler[3] = &unk_1E646D7F0;
  handler[4] = self;
  dispatch_source_set_event_handler(v3, handler);
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  v6 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "RemoteAlert: _launchTimeoutTimer started.", v7, 2u);
  }
  dispatch_resume(v3);
  [(GKRemoteAlertLauncher *)self setLaunchTimeoutTimer:v3];
}

void __48__GKRemoteAlertLauncher_startLaunchTimeoutTimer__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  if (!os_log_GKGeneral) {
    id v2 = GKOSLoggers();
  }
  dispatch_queue_t v3 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
    v5[0] = 67109120;
    v5[1] = v4;
    _os_log_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_INFO, "RemoteAlert: _launchTimeoutTimer fired. Did the dashboard successfully launch? GKRemoteAlertLauncher.isLaunching is set to %d", (uint8_t *)v5, 8u);
  }
}

- (void)notifyDashboardDidLaunch
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  self->_BOOL isLaunching = 0;
  if (!os_log_GKGeneral) {
    id v3 = GKOSLoggers();
  }
  int v4 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    BOOL isLaunching = self->_isLaunching;
    v6[0] = 67109120;
    v6[1] = isLaunching;
    _os_log_impl(&dword_1C2D22000, v4, OS_LOG_TYPE_INFO, "RemoteAlert: notifyDashboardDidLaunch -> GKRemoteAlertLauncher.isLaunching is set to %d", (uint8_t *)v6, 8u);
  }
  [(GKRemoteAlertLauncher *)self cancelLaunchTimeoutTimer];
}

- (void)cancelLaunchTimeoutTimer
{
  if (!os_log_GKGeneral) {
    id v3 = GKOSLoggers();
  }
  int v4 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1C2D22000, v4, OS_LOG_TYPE_INFO, "RemoteAlert: _launchTimeoutTimer cancelled.", v6, 2u);
  }
  launchTimeoutTimer = self->_launchTimeoutTimer;
  if (launchTimeoutTimer) {
    dispatch_source_cancel(launchTimeoutTimer);
  }
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!os_log_GKGeneral) {
    id v3 = GKOSLoggers();
  }
  int v4 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v7 = "-[GKRemoteAlertLauncher dealloc]";
    _os_log_impl(&dword_1C2D22000, v4, OS_LOG_TYPE_INFO, "RemoteAlert: %s", buf, 0xCu);
  }
  [(GKRemoteAlertLauncher *)self cancelLaunchTimeoutTimer];
  v5.receiver = self;
  v5.super_class = (Class)GKRemoteAlertLauncher;
  [(GKRemoteAlertLauncher *)&v5 dealloc];
}

- (void)launchBypassingPreAuthentication:(BOOL)a3 forGame:(id)a4 hostPID:(int)a5 deeplink:(id)a6 launchContext:(id)a7 observer:(id)a8
{
  uint64_t v11 = *(void *)&a5;
  BOOL v43 = a3;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v44 = a6;
  id v14 = a7;
  id v45 = a8;
  if (!os_log_GKGeneral) {
    id v15 = GKOSLoggers();
  }
  v16 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v17 = v16;
    v18 = [v13 bundleIdentifier];
    [NSNumber numberWithInt:v11];
    v20 = id v19 = v13;
    *(_DWORD *)buf = 67110402;
    BOOL v50 = v43;
    __int16 v51 = 2112;
    v52 = v18;
    __int16 v53 = 2112;
    v54 = v20;
    __int16 v55 = 2112;
    id v56 = v44;
    __int16 v57 = 2112;
    id v58 = v14;
    __int16 v59 = 2112;
    id v60 = v45;
    _os_log_impl(&dword_1C2D22000, v17, OS_LOG_TYPE_INFO, "RemoteAlert: launchBypassingPreAuthentication:%d\n forGame:%@\n hostPID:%@\n deeplink:%@\n launchContext:%@\n observer:%@", buf, 0x3Au);

    id v13 = v19;
  }
  self->_BOOL isLaunching = 1;
  if (!os_log_GKGeneral) {
    id v21 = GKOSLoggers();
  }
  v22 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    BOOL isLaunching = self->_isLaunching;
    *(_DWORD *)buf = 67109120;
    BOOL v50 = isLaunching;
    _os_log_impl(&dword_1C2D22000, v22, OS_LOG_TYPE_INFO, "RemoteAlert: GKRemoteAlertLauncher.isLaunching is set to %d", buf, 8u);
  }
  [(GKRemoteAlertLauncher *)self cancelLaunchTimeoutTimer];
  [(GKRemoteAlertLauncher *)self startLaunchTimeoutTimer];
  id v46 = 0;
  v24 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v46];
  id v25 = v46;
  if (v25)
  {
    if (!os_log_GKGeneral) {
      id v26 = GKOSLoggers();
    }
    v27 = os_log_GKError;
    v28 = v44;
    v29 = v45;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      -[GKRemoteAlertLauncher launchBypassingPreAuthentication:forGame:hostPID:deeplink:launchContext:observer:]((uint64_t)v25, v27);
    }
  }
  else
  {
    id v42 = v13;
    v48[0] = v24;
    v47[0] = @"serialized-game";
    v47[1] = @"host-pid";
    v30 = [NSNumber numberWithInt:v11];
    v48[1] = v30;
    v47[2] = @"bypass-pre-authentication";
    v31 = [NSNumber numberWithBool:v43];
    v47[3] = @"dashboard-launch-context";
    v48[2] = v31;
    v48[3] = v14;
    id v32 = v14;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:4];
    v34 = (void *)[v33 mutableCopy];

    v28 = v44;
    if (v44)
    {
      v35 = [v44 allKeys];
      uint64_t v36 = [v35 count];

      if (v36) {
        [v34 setObject:v44 forKeyedSubscript:@"deeplink"];
      }
    }
    id v37 = objc_alloc_init(MEMORY[0x1E4FA6BA0]);
    [v37 setUserInfo:v34];
    id v38 = objc_alloc_init(MEMORY[0x1E4FA6B98]);
    [v38 setUserInfo:v34];
    v39 = (void *)[objc_alloc(MEMORY[0x1E4FA6BB0]) initWithServiceName:@"com.apple.GameCenterRemoteAlert" viewControllerClassName:@"GKRemoteAlertViewController"];
    v40 = [MEMORY[0x1E4FA6BC8] lookupHandlesForDefinition:v39 creatingIfNone:1 configurationContext:v37];
    v41 = [v40 firstObject];

    v29 = v45;
    if (v45) {
      [v41 registerObserver:v45];
    }
    [v41 activateWithContext:v38];

    id v13 = v42;
    id v14 = v32;
  }
}

- (BOOL)isLaunching
{
  return self->_isLaunching;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)launchTimeoutTimer
{
  return self->_launchTimeoutTimer;
}

- (void)setLaunchTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchTimeoutTimer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)launchBypassingPreAuthentication:(uint64_t)a1 forGame:(NSObject *)a2 hostPID:deeplink:launchContext:observer:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_ERROR, "RemoteAlert: Could not activate the remote alert due to archiving error=%@", (uint8_t *)&v2, 0xCu);
}

@end