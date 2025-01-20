@interface SAServer
+ (double)emergencyResponseVoiceCallTimeout;
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CLLocation)mostRecentLocation;
- (OS_dispatch_semaphore)locationAcquired;
- (SACrashDetectionEvent)mostRecentCrashEvent;
- (SAServer)init;
- (int64_t)numberOfVoiceCallAttempts;
- (void)checkAndResetClientState;
- (void)dialVoiceCallToPhoneNumber:(id)a3 completionHandler:(id)a4;
- (void)init;
- (void)iterateClientProxies:(id)a3;
- (void)locationManager:(id)a3 didUpdateLocation:(id)a4;
- (void)mostRecentCrashEvent;
- (void)notifyCrashDetectedAt:(id)a3 resolvedAt:(id)a4 resolvedWithResponse:(int64_t)a5;
- (void)notifyCrashDetectedAt:(id)a3 resolvedAt:(id)a4 resolvedWithResponse:(int64_t)a5 completion:(id)a6;
- (void)numberOfVoiceCallAttempts;
- (void)recoverMostRecentCrashEvent;
- (void)requestCrashDetectionAuthorization:(id)a3;
- (void)requestMostRecentCrashDetectionEvent;
- (void)sendCrashEventToClients;
- (void)setLocationAcquired:(id)a3;
- (void)setMostRecentCrashEvent:(id)a3;
- (void)setMostRecentLocation:(id)a3;
- (void)setNumberOfVoiceCallAttempts:(int64_t)a3;
- (void)startMonitoringLocation;
- (void)stopMonitoringLocation;
- (void)telephonyManager:(id)a3 didUpdateVoiceCallStatus:(int64_t)a4;
- (void)updateMostRecentCrashDetectionEvent:(id)a3 completion:(id)a4;
- (void)updateVoiceCallStatus:(int64_t)a3;
@end

@implementation SAServer

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__SAServer_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_sSAServer;

  return v2;
}

uint64_t __26__SAServer_sharedInstance__block_invoke()
{
  sharedInstance_sSAServer = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (SAServer)init
{
  v27.receiver = self;
  v27.super_class = (Class)SAServer;
  v2 = [(SAServer *)&v27 init];
  if (v2)
  {
    v3 = sa_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      [(SAServer *)v3 init];
    }

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.SafetyKit.SAServer", 0);
    messageQueue = v2->_messageQueue;
    v2->_messageQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = objc_opt_new();
    clientConnections = v2->_clientConnections;
    v2->_clientConnections = (NSMutableArray *)v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.SafetyKit"];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v15;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    v17 = [[SATelephonyManager alloc] initWithQueue:v2->_messageQueue];
    telephonyManager = v2->_telephonyManager;
    v2->_telephonyManager = v17;

    [(SATelephonyManager *)v2->_telephonyManager setDelegate:v2];
    uint64_t v19 = +[SABundleManager crashDetectionManager];
    bundleManager = v2->_bundleManager;
    v2->_bundleManager = (SABundleManager *)v19;

    uint64_t v21 = objc_opt_new();
    locationManager = v2->_locationManager;
    v2->_locationManager = (SALocationManager *)v21;

    [(SALocationManager *)v2->_locationManager setDelegate:v2];
    v23 = [[SACriticalNotification alloc] initWithBundleManager:v2->_bundleManager];
    criticalNotification = v2->_criticalNotification;
    v2->_criticalNotification = v23;

    locationAcquired = v2->_locationAcquired;
    v2->_locationAcquired = 0;

    [(SAServer *)v2 recoverMostRecentCrashEvent];
  }
  return v2;
}

- (void)checkAndResetClientState
{
}

- (SACrashDetectionEvent)mostRecentCrashEvent
{
  v2 = sa_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    [(SAServer *)v2 mostRecentCrashEvent];
  }

  uint64_t v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
  dispatch_queue_t v11 = [v10 objectForKey:@"SAMostRecentCrashDetectionEvent"];
  if (v11)
  {
    id v24 = 0;
    v12 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:&v24];
    uint64_t v13 = v24;
    v14 = sa_default_log();
    uint64_t v15 = v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[SAServer mostRecentCrashEvent]();
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[SAServer mostRecentCrashEvent]();
    }
  }
  else
  {
    uint64_t v13 = sa_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      [(SAServer *)v13 mostRecentCrashEvent];
    }
    v12 = 0;
  }

  return (SACrashDetectionEvent *)v12;
}

- (void)setMostRecentCrashEvent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sa_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[SAServer setMostRecentCrashEvent:].cold.4();
  }

  uint64_t v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  if (v3)
  {
    id v18 = 0;
    uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v18];
    id v7 = v18;
    uint64_t v8 = sa_default_log();
    uint64_t v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[SAServer setMostRecentCrashEvent:]();
      }

      [v5 setObject:v6 forKey:@"SAMostRecentCrashDetectionEvent"];
      [v5 synchronize];
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SAServer setMostRecentCrashEvent:]();
      }
    }
  }
  else
  {
    uint64_t v10 = sa_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[SAServer setMostRecentCrashEvent:](v10, v11, v12, v13, v14, v15, v16, v17);
    }

    [v5 removeObjectForKey:@"SAMostRecentCrashDetectionEvent"];
  }
}

- (void)recoverMostRecentCrashEvent
{
}

- (void)updateMostRecentCrashDetectionEvent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sa_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SAServer updateMostRecentCrashDetectionEvent:completion:]();
  }

  [(SAServer *)self setMostRecentCrashEvent:v6];
  if (v6)
  {
    bundleManager = self->_bundleManager;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __59__SAServer_updateMostRecentCrashDetectionEvent_completion___block_invoke;
    v10[3] = &unk_2651C94A0;
    v10[4] = self;
    id v11 = v7;
    [(SABundleManager *)bundleManager wakeApprovedAppsWithReason:0 completion:v10];
  }
}

uint64_t __59__SAServer_updateMostRecentCrashDetectionEvent_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);

  return [v3 sendCrashEventToClients];
}

- (void)notifyCrashDetectedAt:(id)a3 resolvedAt:(id)a4 resolvedWithResponse:(int64_t)a5
{
}

- (void)notifyCrashDetectedAt:(id)a3 resolvedAt:(id)a4 resolvedWithResponse:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [(SAServer *)self startMonitoringLocation];
  uint64_t v13 = self;
  objc_sync_enter(v13);
  if (v13->_locationAcquired)
  {
    uint64_t v14 = sa_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_245182000, v14, OS_LOG_TYPE_DEFAULT, "Reentrant notification, waiting for location on older semaphore", (uint8_t *)buf, 2u);
    }

    locationAcquired = v13->_locationAcquired;
    dispatch_time_t v16 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(locationAcquired, v16))
    {
      uint64_t v17 = sa_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[SAServer notifyCrashDetectedAt:resolvedAt:resolvedWithResponse:completion:](v17);
      }
    }
    id v18 = v13->_locationAcquired;
    v13->_locationAcquired = 0;
  }
  else
  {
    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    id v18 = v13->_locationAcquired;
    v13->_locationAcquired = (OS_dispatch_semaphore *)v19;
  }

  objc_sync_exit(v13);
  objc_initWeak(buf, v13);
  messageQueue = v13->_messageQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__SAServer_notifyCrashDetectedAt_resolvedAt_resolvedWithResponse_completion___block_invoke;
  block[3] = &unk_2651C94C8;
  objc_copyWeak(v28, buf);
  id v25 = v10;
  id v26 = v11;
  v28[1] = (id)a5;
  id v27 = v12;
  id v21 = v12;
  id v22 = v11;
  id v23 = v10;
  dispatch_async(messageQueue, block);

  objc_destroyWeak(v28);
  objc_destroyWeak(buf);
}

void __77__SAServer_notifyCrashDetectedAt_resolvedAt_resolvedWithResponse_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_sync_enter(v2);
  id v3 = [v2 locationAcquired];

  if (v3)
  {
    uint64_t v4 = [v2 locationAcquired];
    dispatch_time_t v5 = dispatch_time(0, 5000000000);
    intptr_t v6 = dispatch_semaphore_wait(v4, v5);

    if (v6)
    {
      id v7 = sa_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[SAServer notifyCrashDetectedAt:resolvedAt:resolvedWithResponse:completion:](v7);
      }
    }
    [v2 setLocationAcquired:0];
  }
  objc_sync_exit(v2);

  uint64_t v8 = sa_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    dispatch_time_t v16 = "-[SAServer notifyCrashDetectedAt:resolvedAt:resolvedWithResponse:completion:]_block_invoke";
    _os_log_impl(&dword_245182000, v8, OS_LOG_TYPE_DEFAULT, "%s - Crash event resolved", (uint8_t *)&v15, 0xCu);
  }

  uint64_t v9 = [SACrashDetectionEvent alloc];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = [v2 mostRecentLocation];
  uint64_t v14 = [(SACrashDetectionEvent *)v9 initWithTimeOfDetection:v10 timeOfResolution:v11 response:v12 location:v13];

  [v2 setNumberOfVoiceCallAttempts:0];
  [v2 updateMostRecentCrashDetectionEvent:v14 completion:*(void *)(a1 + 48)];
  [v2 stopMonitoringLocation];
}

- (int64_t)numberOfVoiceCallAttempts
{
  id v2 = sa_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    [(SAServer *)v2 numberOfVoiceCallAttempts];
  }

  uint64_t v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v11 = [v10 objectForKey:@"SANumberOfVoiceCallAttempts"];
  if (v11)
  {
    id v25 = 0;
    uint64_t v12 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:&v25];
    uint64_t v13 = v25;
    uint64_t v14 = sa_default_log();
    int v15 = v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[SAServer numberOfVoiceCallAttempts]();
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[SAServer numberOfVoiceCallAttempts]();
    }

    int64_t v23 = [v12 integerValue];
  }
  else
  {
    uint64_t v13 = sa_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      [(SAServer *)v13 numberOfVoiceCallAttempts];
    }
    int64_t v23 = 0;
  }

  return v23;
}

- (void)setNumberOfVoiceCallAttempts:(int64_t)a3
{
  uint64_t v4 = sa_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[SAServer setNumberOfVoiceCallAttempts:]();
  }

  uint64_t v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v6 = (void *)MEMORY[0x263F08910];
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  id v12 = 0;
  uint64_t v8 = [v6 archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v12];
  id v9 = v12;

  uint64_t v10 = sa_default_log();
  uint64_t v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[SAServer setNumberOfVoiceCallAttempts:]();
    }

    [v5 setObject:v8 forKey:@"SANumberOfVoiceCallAttempts"];
    [v5 synchronize];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(SAServer *)(uint64_t)v9 setNumberOfVoiceCallAttempts:v11];
    }
  }
}

- (void)updateVoiceCallStatus:(int64_t)a3
{
  uint64_t v5 = sa_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SAServer updateVoiceCallStatus:]();
  }

  messageQueue = self->_messageQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__SAServer_updateVoiceCallStatus___block_invoke;
  v7[3] = &unk_2651C9510;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(messageQueue, v7);
}

uint64_t __34__SAServer_updateVoiceCallStatus___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __34__SAServer_updateVoiceCallStatus___block_invoke_2;
  v3[3] = &__block_descriptor_40_e48_v24__0__NSXPCConnection_8___SAClientProtocol__16l;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 iterateClientProxies:v3];
}

void __34__SAServer_updateVoiceCallStatus___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = +[SAAuthorization connectionAuthorizedForAnyEmergency:v5];
  uint64_t v8 = sa_default_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9) {
      __34__SAServer_updateVoiceCallStatus___block_invoke_2_cold_1();
    }

    [v6 updateVoiceCallStatus:*(void *)(a1 + 32)];
  }
  else
  {
    if (v9) {
      __34__SAServer_updateVoiceCallStatus___block_invoke_2_cold_2();
    }
  }
}

- (void)startMonitoringLocation
{
}

- (void)stopMonitoringLocation
{
}

+ (double)emergencyResponseVoiceCallTimeout
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v3 = [v2 valueForKey:@"SAEmergencyResponseVoiceCallTimeout"];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 180.0;
  }

  return v5;
}

- (void)sendCrashEventToClients
{
}

void __35__SAServer_sendCrashEventToClients__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__SAServer_sendCrashEventToClients__block_invoke_2;
  v4[3] = &unk_2651C9538;
  v4[4] = WeakRetained;
  v4[5] = v3;
  [v3 iterateClientProxies:v4];
}

void __35__SAServer_sendCrashEventToClients__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = +[SAAuthorization connectionAuthorizedForCrashDetection:v5];
  uint64_t v8 = sa_default_log();
  BOOL v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [*(id *)(a1 + 32) mostRecentCrashEvent];
      int v12 = 136315650;
      uint64_t v13 = "-[SAServer sendCrashEventToClients]_block_invoke_2";
      __int16 v14 = 2112;
      id v15 = v5;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      _os_log_impl(&dword_245182000, v9, OS_LOG_TYPE_DEFAULT, "%s - authorized, sending, connection: %@, crashEvent: %@", (uint8_t *)&v12, 0x20u);
    }
    [*(id *)(*(void *)(a1 + 40) + 56) sendNotificationWithCompletionHandler:&__block_literal_global_2];
    uint64_t v11 = [*(id *)(a1 + 32) mostRecentCrashEvent];
    [v6 updateMostRecentCrashDetectionEvent:v11];

    BOOL v9 = [*(id *)(a1 + 32) mostRecentCrashEvent];
    [v9 setIsNotified:1];
    [*(id *)(a1 + 32) setMostRecentCrashEvent:v9];
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    __35__SAServer_sendCrashEventToClients__block_invoke_2_cold_1((uint64_t)v5, a1, v9);
  }
}

void __35__SAServer_sendCrashEventToClients__block_invoke_24(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = sa_default_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4) {
      __35__SAServer_sendCrashEventToClients__block_invoke_24_cold_2((uint64_t)v2, v3, v5, v6, v7, v8, v9, v10);
    }
  }
  else if (v4)
  {
    __35__SAServer_sendCrashEventToClients__block_invoke_24_cold_1(v3);
  }
}

- (void)iterateClientProxies:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_clientConnections;
  objc_sync_enter(v5);
  clientConnections = self->_clientConnections;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__SAServer_iterateClientProxies___block_invoke;
  v8[3] = &unk_2651C9588;
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  [(NSMutableArray *)clientConnections enumerateObjectsUsingBlock:v8];

  objc_sync_exit(v5);
}

void __33__SAServer_iterateClientProxies___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  id v4 = a2;
  dispatch_assert_queue_V2(v3);
  id v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_28];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __33__SAServer_iterateClientProxies___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = sa_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __33__SAServer_iterateClientProxies___block_invoke_2_cold_1();
  }
}

- (void)requestMostRecentCrashDetectionEvent
{
}

- (void)requestCrashDetectionAuthorization:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, int64_t, void *))a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = sa_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[SAServer requestCrashDetectionAuthorization:](v6, v7, v8, v9, v10, v11, v12, v13);
  }

  int64_t v14 = +[SAAuthorization authorizationStatusForCurrentConnection];
  if (v14 != 2)
  {
    if (+[SAAuthorization isInFlight])
    {
      __int16 v16 = sa_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[SAServer requestCrashDetectionAuthorization:](v16);
      }

      uint64_t v17 = +[SAError errorWithCode:4];
      v4[2](v4, v14, v17);
      goto LABEL_18;
    }
    uint64_t v17 = +[SABundleManager bundleURLForCurrentConnection];
    if (v17)
    {
      if (+[SAAuthorization startAuthorizationForBundleURL:v17 preflightAuthorizationStatus:v14 completionHandler:v4])
      {
LABEL_18:

        goto LABEL_19;
      }
      uint64_t v18 = sa_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[SAServer requestCrashDetectionAuthorization:]();
      }

      uint64_t v19 = +[SAError errorWithCode:4];
      v4[2](v4, v14, v19);
    }
    else
    {
      uint64_t v19 = +[SAError errorWithCode:4];
      v4[2](v4, v14, v19);
    }

    goto LABEL_18;
  }
  id v15 = sa_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315138;
    uint64_t v21 = "-[SAServer requestCrashDetectionAuthorization:]";
    _os_log_impl(&dword_245182000, v15, OS_LOG_TYPE_DEFAULT, "%s - app requesting authorization has already been authorized", (uint8_t *)&v20, 0xCu);
  }

  v4[2](v4, 2, 0);
LABEL_19:
  objc_sync_exit(v5);
}

- (void)dialVoiceCallToPhoneNumber:(id)a3 completionHandler:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = sa_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SAServer dialVoiceCallToPhoneNumber:completionHandler:]();
  }

  if (!+[SAAuthorization currentConnectionAuthorizedForAnyEmergency])
  {
    uint64_t v12 = sa_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[SAServer dialVoiceCallToPhoneNumber:completionHandler:](v12, v13, v14, v15, v16, v17, v18, v19);
    }

    uint64_t v20 = 1;
    goto LABEL_22;
  }
  [(SAServer *)self checkAndResetClientState];
  if (![(SAServer *)self numberOfVoiceCallAttempts])
  {
    uint64_t v21 = [(SAServer *)self mostRecentCrashEvent];
    if (!v21) {
      goto LABEL_18;
    }
    uint64_t v22 = (void *)v21;
    int64_t v23 = [(SAServer *)self mostRecentCrashEvent];
    id v24 = [v23 timeOfResolution];
    [v24 timeIntervalSinceNow];
    double v26 = -v25;
    [(id)objc_opt_class() emergencyResponseVoiceCallTimeout];
    double v28 = v27;

    if (v28 <= v26)
    {
LABEL_18:
      v29 = sa_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[SAServer dialVoiceCallToPhoneNumber:completionHandler:]";
        _os_log_impl(&dword_245182000, v29, OS_LOG_TYPE_DEFAULT, "%s - not placing voice call because request was not made around an emergency event.", buf, 0xCu);
      }

LABEL_21:
      uint64_t v20 = 2;
LABEL_22:
      v30 = +[SAError errorWithCode:v20];
      v7[2](v7, 0, v30);
      goto LABEL_23;
    }
  }
  if ([(SAServer *)self numberOfVoiceCallAttempts] > 0
    || ((uint64_t v9 = [(SAServer *)self numberOfVoiceCallAttempts], v9 >= 0)
      ? (unint64_t v10 = v9)
      : (unint64_t v10 = -v9),
        v10 >= 3))
  {
    uint64_t v11 = sa_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[SAServer dialVoiceCallToPhoneNumber:completionHandler:]";
      __int16 v37 = 2048;
      int64_t v38 = [(SAServer *)self numberOfVoiceCallAttempts];
      _os_log_impl(&dword_245182000, v11, OS_LOG_TYPE_DEFAULT, "%s - not placing voice call because number of call attempts have exceeded, attempts, %ld", buf, 0x16u);
    }

    goto LABEL_21;
  }
  v31 = sa_default_log();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v36 = "-[SAServer dialVoiceCallToPhoneNumber:completionHandler:]";
    __int16 v37 = 2112;
    int64_t v38 = (int64_t)v6;
    __int16 v39 = 2048;
    int64_t v40 = [(SAServer *)self numberOfVoiceCallAttempts];
    _os_log_impl(&dword_245182000, v31, OS_LOG_TYPE_DEFAULT, "%s - attempting to place voice call, phoneNumber: %@, callAttempts: %ld", buf, 0x20u);
  }

  telephonyManager = self->_telephonyManager;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __57__SAServer_dialVoiceCallToPhoneNumber_completionHandler___block_invoke;
  v33[3] = &unk_2651C95B0;
  v34 = v7;
  [(SATelephonyManager *)telephonyManager placeVoiceCall:v6 completionHandler:v33];
  v30 = v34;
LABEL_23:
}

void __57__SAServer_dialVoiceCallToPhoneNumber_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = sa_default_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      int v8 = 136315138;
      uint64_t v9 = "-[SAServer dialVoiceCallToPhoneNumber:completionHandler:]_block_invoke";
      _os_log_impl(&dword_245182000, v6, OS_LOG_TYPE_DEFAULT, "%s - voice call accepted", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v7)
  {
    int v8 = 136315394;
    uint64_t v9 = "-[SAServer dialVoiceCallToPhoneNumber:completionHandler:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_245182000, v6, OS_LOG_TYPE_DEFAULT, "%s - voice call not accepted, error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = sa_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[SAServer listener:shouldAcceptNewConnection:]();
  }

  BOOL v7 = [v5 valueForEntitlement:@"com.apple.developer.severe-vehicular-crash-event"];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    objc_initWeak((id *)&location, self);
    messageQueue = self->_messageQueue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __47__SAServer_listener_shouldAcceptNewConnection___block_invoke;
    v13[3] = &unk_2651C9560;
    objc_copyWeak(&v15, (id *)&location);
    id v14 = v5;
    dispatch_async(messageQueue, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)&location);
  }
  else
  {
    __int16 v10 = sa_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int location = 138412546;
      *(void *)location_4 = v5;
      *(_WORD *)&location_4[8] = 2112;
      *(void *)&location_4[10] = @"com.apple.developer.severe-vehicular-crash-event";
      _os_log_impl(&dword_245182000, v10, OS_LOG_TYPE_DEFAULT, "[WARN] New connection %@ missing entitlement: %@", (uint8_t *)&location, 0x16u);
    }
  }
  id v11 = sa_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int location = 67109378;
    *(_DWORD *)location_4 = v8;
    *(_WORD *)&location_4[4] = 2112;
    *(void *)&location_4[6] = v5;
    _os_log_impl(&dword_245182000, v11, OS_LOG_TYPE_DEFAULT, "shouldAcceptNewConnection: %d for connection: %@", (uint8_t *)&location, 0x12u);
  }

  return v8;
}

void __47__SAServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained[6];
  objc_sync_enter(v4);
  [WeakRetained[6] addObject:*(void *)(a1 + 32)];
  objc_sync_exit(v4);

  id v5 = SAClientInterface();
  [*(id *)(a1 + 32) setRemoteObjectInterface:v5];

  id v6 = SAServerInterface();
  [*(id *)(a1 + 32) setExportedInterface:v6];

  [*(id *)(a1 + 32) setExportedObject:WeakRetained];
  [*(id *)(a1 + 32) setInterruptionHandler:&__block_literal_global_32];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__SAServer_listener_shouldAcceptNewConnection___block_invoke_33;
  v7[3] = &unk_2651C95D8;
  objc_copyWeak(&v8, v2);
  objc_copyWeak(&v9, &location);
  [*(id *)(a1 + 32) setInvalidationHandler:v7];
  [*(id *)(a1 + 32) resume];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __47__SAServer_listener_shouldAcceptNewConnection___block_invoke_2()
{
  v0 = sa_default_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_245182000, v0, OS_LOG_TYPE_DEFAULT, "SA client connection interrupted", v1, 2u);
  }
}

void __47__SAServer_listener_shouldAcceptNewConnection___block_invoke_33(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    id v4 = WeakRetained[6];
    objc_sync_enter(v4);
    [WeakRetained[6] removeObject:v3];
    objc_sync_exit(v4);
  }
  id v5 = sa_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_245182000, v5, OS_LOG_TYPE_DEFAULT, "SA client connection invalidated", v6, 2u);
  }
}

- (void)telephonyManager:(id)a3 didUpdateVoiceCallStatus:(int64_t)a4
{
  objc_initWeak(&location, self);
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SAServer_telephonyManager_didUpdateVoiceCallStatus___block_invoke;
  block[3] = &unk_2651C9600;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a4;
  dispatch_async(messageQueue, block);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __54__SAServer_telephonyManager_didUpdateVoiceCallStatus___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  uint64_t v4 = *(void *)(a1 + 40);
  if ((unint64_t)(v4 - 1) < 2)
  {
    [WeakRetained setNumberOfVoiceCallAttempts:1];
    id v5 = sa_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      id v6 = "Updating voice call attempts due to active call: 1";
      BOOL v7 = v5;
      uint32_t v8 = 2;
LABEL_7:
      _os_log_impl(&dword_245182000, v7, OS_LOG_TYPE_DEFAULT, v6, v9, v8);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v4 == 3)
  {
    objc_msgSend(WeakRetained, "setNumberOfVoiceCallAttempts:", objc_msgSend(WeakRetained, "numberOfVoiceCallAttempts") - 1);
    id v5 = sa_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v9 = 134217984;
      *(void *)&v9[4] = [v3 numberOfVoiceCallAttempts];
      id v6 = "Updating voice call attempts due to failure: %ld";
      BOOL v7 = v5;
      uint32_t v8 = 12;
      goto LABEL_7;
    }
LABEL_8:
  }
  objc_msgSend(v3[2], "wakeApprovedAppsWithReason:completion:", 1, 0, *(_OWORD *)v9);
  [v3 updateVoiceCallStatus:*(void *)(a1 + 40)];
}

- (void)locationManager:(id)a3 didUpdateLocation:(id)a4
{
  id v5 = self;
  id v7 = a4;
  objc_sync_enter(v5);
  locationAcquired = v5->_locationAcquired;
  if (locationAcquired) {
    dispatch_semaphore_signal(locationAcquired);
  }
  objc_sync_exit(v5);

  [(SAServer *)v5 setMostRecentLocation:v7];
}

- (CLLocation)mostRecentLocation
{
  return self->_mostRecentLocation;
}

- (void)setMostRecentLocation:(id)a3
{
}

- (OS_dispatch_semaphore)locationAcquired
{
  return self->_locationAcquired;
}

- (void)setLocationAcquired:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationAcquired, 0);
  objc_storeStrong((id *)&self->_mostRecentLocation, 0);
  objc_storeStrong((id *)&self->_criticalNotification, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_bundleManager, 0);

  objc_storeStrong((id *)&self->_telephonyManager, 0);
}

- (void)init
{
}

- (void)mostRecentCrashEvent
{
}

- (void)setMostRecentCrashEvent:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setMostRecentCrashEvent:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_245182000, v0, v1, "%s - Unable to save mostRecentCrashEvent in NSUserDefaults, mostRecentCrashEvent: %@, error: %@", v2);
}

- (void)setMostRecentCrashEvent:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_245182000, v0, v1, "%s - saving crash event in NSUserDefaults, mostRecentCrashEvent: %@", v2, v3, v4, v5, 2u);
}

- (void)setMostRecentCrashEvent:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_245182000, v0, v1, "%s, mostRecentCrashEvent: %@", v2, v3, v4, v5, 2u);
}

- (void)updateMostRecentCrashDetectionEvent:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_245182000, v0, v1, "%s, crashEvent: %@", v2, v3, v4, v5, 2u);
}

- (void)notifyCrashDetectedAt:(os_log_t)log resolvedAt:resolvedWithResponse:completion:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_245182000, log, OS_LOG_TYPE_ERROR, "Timeout getting location", v1, 2u);
}

- (void)numberOfVoiceCallAttempts
{
}

- (void)setNumberOfVoiceCallAttempts:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315650;
  *(void *)&v3[4] = "-[SAServer setNumberOfVoiceCallAttempts:]";
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = a2;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_7(&dword_245182000, a2, a3, "%s - Unable to save numberOfVoiceCallAttempts in NSUserDefaults, numberOfVoiceCallAttempts: %ld, error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a1);
}

- (void)setNumberOfVoiceCallAttempts:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_245182000, v0, v1, "%s - saving call attempts in NSUserDefaults, numberOfVoiceCallAttempts: %ld", v2, v3, v4, v5, 2u);
}

- (void)setNumberOfVoiceCallAttempts:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_245182000, v0, v1, "%s, numberOfCallAttempts: %ld", v2, v3, v4, v5, 2u);
}

- (void)updateVoiceCallStatus:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_245182000, v0, v1, "%s, status: %ld", v2, v3, v4, v5, 2u);
}

void __34__SAServer_updateVoiceCallStatus___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_245182000, v0, (uint64_t)v0, "%s - authorized, sending, connection: %@, status: %ld", (uint8_t *)v1);
}

void __34__SAServer_updateVoiceCallStatus___block_invoke_2_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_245182000, v0, (uint64_t)v0, "%s - unauthorized, not sending, connection: %@, status: %ld", (uint8_t *)v1);
}

void __35__SAServer_sendCrashEventToClients__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = [*(id *)(a2 + 32) mostRecentCrashEvent];
  v8[0] = 136315650;
  OUTLINED_FUNCTION_8();
  __int16 v9 = v5;
  uint64_t v10 = v6;
  OUTLINED_FUNCTION_6(&dword_245182000, a3, v7, "%s - unauthorized, not sending, connection: %@, crashEvent: %@", (uint8_t *)v8);
}

void __35__SAServer_sendCrashEventToClients__block_invoke_24_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_245182000, log, OS_LOG_TYPE_DEBUG, "Critical notification scheduled", v1, 2u);
}

void __35__SAServer_sendCrashEventToClients__block_invoke_24_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __33__SAServer_iterateClientProxies___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_245182000, v0, v1, "%s - Error from remoteObjectProxyWithErrorHandler: %@", v2, v3, v4, v5, 2u);
}

- (void)requestCrashDetectionAuthorization:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[SAServer requestCrashDetectionAuthorization:]";
  _os_log_error_impl(&dword_245182000, log, OS_LOG_TYPE_ERROR, "%s - app requesting authorization but we are already prompting user for authorization.", (uint8_t *)&v1, 0xCu);
}

- (void)requestCrashDetectionAuthorization:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_245182000, v0, v1, "%s - unable to start authorization for bundleURL, bundleURL: %@", v2, v3, v4, v5, 2u);
}

- (void)requestCrashDetectionAuthorization:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)dialVoiceCallToPhoneNumber:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)dialVoiceCallToPhoneNumber:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_245182000, v0, v1, "%s, phoneNumber: %@", v2, v3, v4, v5, 2u);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_245182000, v0, v1, "%s, newConnection: %@", v2, v3, v4, v5, 2u);
}

@end