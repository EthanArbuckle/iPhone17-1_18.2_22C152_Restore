@interface ARDaemon
+ (ARDaemon)localAnonymousListenerDaemon;
+ (id)_fullDescription;
+ (id)_runningDaemons;
+ (id)createAnonymousListenerDaemon;
+ (id)createAnonymousListenerDaemonWithReplayURL:(id)a3 deterministic:(BOOL)a4 replayDelegate:(id)a5;
+ (id)createAnonymousListenerDaemonWithReplayURL:(id)a3 replayEnableTelemetry:(BOOL)a4 deterministic:(BOOL)a5 replayDelegate:(id)a6 isDryRun:(BOOL)a7;
- (ARDaemon)initWithConfiguration:(id)a3 spawnTime:(id)a4 watchdogMonitor:(id)a5;
- (ARDaemon)initWithConfiguration:(id)a3 spawnTime:(id)a4 watchdogMonitor:(id)a5 graphScheduler:(id)a6 replayDelegate:(id)a7;
- (ARDaemonServiceListener)listener;
- (ARServer)server;
- (NSArray)runningRemoteServices;
- (id)_fullDescription;
- (id)listenerEndPointForServiceNamed:(id)a3;
- (unint64_t)state;
- (void)_heartbeat;
- (void)dealloc;
- (void)memoryPressureMonitor:(id)a3 didUpdateProcessMemoryPressureCondition:(int64_t)a4;
- (void)memoryPressureMonitor:(id)a3 didUpdateSystemMemoryPressureCondition:(int64_t)a4;
- (void)printInfo;
- (void)setLocalAnonymousListenerDaemon:(id)a3;
- (void)shutdown;
- (void)startWithServices:(id)a3;
- (void)startup;
@end

@implementation ARDaemon

+ (ARDaemon)localAnonymousListenerDaemon
{
  return (ARDaemon *)MEMORY[0x270F08D10](a1, a2);
}

- (void)setLocalAnonymousListenerDaemon:(id)a3
{
}

+ (id)createAnonymousListenerDaemon
{
  v2 = objc_opt_class();
  return (id)[v2 createAnonymousListenerDaemonWithReplayURL:0 deterministic:0 replayDelegate:0];
}

+ (id)createAnonymousListenerDaemonWithReplayURL:(id)a3 deterministic:(BOOL)a4 replayDelegate:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  v9 = [(id)objc_opt_class() createAnonymousListenerDaemonWithReplayURL:v8 replayEnableTelemetry:0 deterministic:v5 replayDelegate:v7 isDryRun:0];

  return v9;
}

+ (id)createAnonymousListenerDaemonWithReplayURL:(id)a3 replayEnableTelemetry:(BOOL)a4 deterministic:(BOOL)a5 replayDelegate:(id)a6 isDryRun:(BOOL)a7
{
  id v7 = a6;
  id v8 = [(id)objc_opt_class() localAnonymousListenerDaemon];
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v11 = [ARDaemon alloc];
    v12 = objc_opt_new();
    v13 = objc_opt_new();
    v10 = [(ARDaemon *)v11 initWithConfiguration:v12 spawnTime:v13 watchdogMonitor:0 graphScheduler:0 replayDelegate:v7];
  }
  return v10;
}

- (ARDaemon)initWithConfiguration:(id)a3 spawnTime:(id)a4 watchdogMonitor:(id)a5
{
  return [(ARDaemon *)self initWithConfiguration:a3 spawnTime:a4 watchdogMonitor:a5 graphScheduler:0 replayDelegate:0];
}

- (ARDaemon)initWithConfiguration:(id)a3 spawnTime:(id)a4 watchdogMonitor:(id)a5 graphScheduler:(id)a6 replayDelegate:(id)a7
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = _ARLogDaemon_0();
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24719A000, v18, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ARDaemonInitialization", (const char *)&unk_2471AB592, buf, 2u);
  }

  v51.receiver = self;
  v51.super_class = (Class)ARDaemon;
  v19 = [(ARDaemon *)&v51 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_configuration, a3);
    objc_storeStrong((id *)&v20->_spawnTime, a4);
    if (([(ARDaemonConfiguration *)v20->_configuration isInProcess] & 1) == 0)
    {
      dispatch_source_t v21 = dispatch_source_create(MEMORY[0x263EF8400], 0, 1uLL, MEMORY[0x263EF83A0]);
      heartbeatTimer = v20->_heartbeatTimer;
      v20->_heartbeatTimer = (OS_dispatch_source *)v21;

      v23 = v20->_heartbeatTimer;
      if (v23)
      {
        dispatch_source_set_timer(v23, 0, 0x3B9ACA00uLL, 0);
        objc_initWeak((id *)buf, v20);
        v24 = v20->_heartbeatTimer;
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __90__ARDaemon_initWithConfiguration_spawnTime_watchdogMonitor_graphScheduler_replayDelegate___block_invoke_3;
        handler[3] = &unk_265206DE0;
        objc_copyWeak(&v50, (id *)buf);
        dispatch_source_set_event_handler(v24, handler);
        objc_destroyWeak(&v50);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v25 = _ARLogDaemon_0();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = (objc_class *)objc_opt_class();
          v27 = NSStringFromClass(v26);
          *(_DWORD *)buf = 138543618;
          v53 = v27;
          __int16 v54 = 2048;
          v55 = v20;
          _os_log_impl(&dword_24719A000, v25, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to create the heartbeat timer", buf, 0x16u);
        }
      }
    }
    uint64_t v28 = objc_opt_new();
    sessionUUID = v20->_sessionUUID;
    v20->_sessionUUID = (NSUUID *)v28;

    v20->_lastDaemonHeartbeatEventReportedTimestamp = -1.79769313e308;
    runningRemoteServices = v20->_runningRemoteServices;
    v20->_runningRemoteServices = (NSArray *)MEMORY[0x263EFFA68];

    uint64_t v31 = objc_opt_new();
    memoryPressureMonitor = v20->_memoryPressureMonitor;
    v20->_memoryPressureMonitor = (ARMemoryPressureMonitor *)v31;

    [(ARMemoryPressureMonitor *)v20->_memoryPressureMonitor setDelegate:v20];
    v33 = objc_opt_class();
    uint64_t v34 = objc_sync_enter(v33);
    v35 = (void *)MEMORY[0x24C54B300](v34);
    id v36 = +[ARDaemon _runningDaemons];
    [(id)_weakDaemons addPointer:v20];
    objc_sync_exit(v33);

    v37 = _ARLogDaemon_0();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = (objc_class *)objc_opt_class();
      v39 = NSStringFromClass(v38);
      *(_DWORD *)buf = 138543618;
      v53 = v39;
      __int16 v54 = 2048;
      v55 = v20;
      _os_log_impl(&dword_24719A000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Setting up server", buf, 0x16u);
    }
    v40 = objc_opt_new();
    [v15 updateStatus:6];
    v41 = [[ARServer alloc] initWithDaemonConfiguration:v13 spawnTime:v20->_spawnTime sessionUUID:v20->_sessionUUID watchdogMonitor:v15 executionManager:v40];
    server = v20->_server;
    v20->_server = v41;

    [v15 updateStatus:7];
    v43 = _ARLogDaemon_0();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = (objc_class *)objc_opt_class();
      v45 = NSStringFromClass(v44);
      *(_DWORD *)buf = 138543618;
      v53 = v45;
      __int16 v54 = 2048;
      v55 = v20;
      _os_log_impl(&dword_24719A000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Setting up listeners", buf, 0x16u);
    }
    v46 = [[ARDaemonServiceListener alloc] initWithDelegate:v20->_server daemonConfiguration:v20->_configuration watchdogMonitor:v15];
    listener = v20->_listener;
    v20->_listener = v46;

    if ([(ARDaemonConfiguration *)v20->_configuration isInProcess]) {
      [(ARDaemon *)v20 setLocalAnonymousListenerDaemon:v20];
    }
    v20->_state = 0;
  }
  __90__ARDaemon_initWithConfiguration_spawnTime_watchdogMonitor_graphScheduler_replayDelegate___block_invoke();

  return v20;
}

void __90__ARDaemon_initWithConfiguration_spawnTime_watchdogMonitor_graphScheduler_replayDelegate___block_invoke()
{
  v0 = _ARLogDaemon_0();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_24719A000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ARDaemonInitialization", (const char *)&unk_2471AB592, v1, 2u);
  }
}

void __90__ARDaemon_initWithConfiguration_spawnTime_watchdogMonitor_graphScheduler_replayDelegate___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _heartbeat];
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  runningRemoteServices = self->_runningRemoteServices;
  self->_runningRemoteServices = (NSArray *)MEMORY[0x263EFFA68];

  [(ARDaemon *)self shutdown];
  v4 = _ARLogDaemon_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138543618;
    v9 = v6;
    __int16 v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_24719A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: dealloc", buf, 0x16u);
  }
  v7.receiver = self;
  v7.super_class = (Class)ARDaemon;
  [(ARDaemon *)&v7 dealloc];
}

- (void)printInfo
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v3 = _ARLogDaemon_0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    BOOL v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    v24 = v5;
    __int16 v25 = 2048;
    v26 = self;
    _os_log_impl(&dword_24719A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Initialized with frameworks:", buf, 0x16u);
  }
  v18 = ARFrameworkVersions();
  v6 = [v18 allKeys];
  objc_super v7 = [v6 sortedArrayUsingSelector:sel_compare_];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v14 = _ARLogDaemon_0();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = (objc_class *)objc_opt_class();
          id v16 = NSStringFromClass(v15);
          id v17 = [v18 objectForKeyedSubscript:v13];
          *(_DWORD *)buf = 138544130;
          v24 = v16;
          __int16 v25 = 2048;
          v26 = self;
          __int16 v27 = 2112;
          uint64_t v28 = v13;
          __int16 v29 = 2112;
          v30 = v17;
          _os_log_impl(&dword_24719A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: %@ : %@", buf, 0x2Au);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v31 count:16];
    }
    while (v10);
  }
}

- (void)shutdown
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = _ARLogDaemon_0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    BOOL v5 = NSStringFromClass(v4);
    int v11 = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2048;
    id v14 = self;
    _os_log_impl(&dword_24719A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Shutting down", (uint8_t *)&v11, 0x16u);
  }
  v6 = [(id)objc_opt_class() localAnonymousListenerDaemon];

  if (v6 == self) {
    [(ARDaemon *)self setLocalAnonymousListenerDaemon:0];
  }
  listener = self->_listener;
  self->_listener = 0;

  [(ARServer *)self->_server invalidate];
  server = self->_server;
  self->_server = 0;

  heartbeatTimer = self->_heartbeatTimer;
  if (heartbeatTimer)
  {
    dispatch_source_cancel(heartbeatTimer);
    uint64_t v10 = self->_heartbeatTimer;
    self->_heartbeatTimer = 0;
  }
  self->_state = 2;
}

- (void)startup
{
}

- (void)_heartbeat
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  ARGetMemoryFootprint();
  v3 = objc_opt_new();
  v4 = [v3 timeSinceSnapshot:self->_spawnTime];
  BOOL v5 = +[ARDaemonMetrics sharedDaemonMetrics];
  [v5 reportMemoryFootprintInBytes:0];

  v6 = NSString;
  [v3 upTimeIncludingSleepAndDriftCorrection];
  objc_super v7 = objc_msgSend(v6, "ar_hoursMinutesSecondsWithTimeInterval:");
  id v8 = NSString;
  [v4 upTimeIncludingSleepAndDriftCorrection];
  uint64_t v9 = objc_msgSend(v8, "ar_hoursMinutesSecondsWithTimeInterval:");
  uint64_t v10 = _ARLogDaemon_0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 138544642;
    v23 = v12;
    __int16 v24 = 2048;
    __int16 v25 = self;
    __int16 v26 = 2114;
    __int16 v27 = v7;
    __int16 v28 = 2114;
    __int16 v29 = v9;
    __int16 v30 = 2050;
    uint64_t v31 = 0;
    __int16 v32 = 2050;
    uint64_t v33 = 0;
    _os_log_impl(&dword_24719A000, v10, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Heartbeat - system up: {%{public}@}, daemon up: {%{public}@}, footprint: %{iec-bytes,public}llu, peak: %{iec-bytes,public}llu", buf, 0x3Eu);
  }
  if (self->_lastDaemonHeartbeatEventReportedTimestamp == -1.79769313e308
    || ([v3 upTimeIncludingSleepAndDriftCorrection],
        v13 - self->_lastDaemonHeartbeatEventReportedTimestamp >= 60.0))
  {
    objc_msgSend(v4, "upTime", 0);
    unint64_t v15 = (unint64_t)(v14 / 60.0);
    [v4 upTimeIncludingSleep];
    unint64_t v17 = (unint64_t)(v16 / 60.0);
    [v3 upTimeIncludingSleepAndDriftCorrection];
    unint64_t v19 = (unint64_t)(v18 / 60.0);
    long long v20 = +[ARDaemonMetrics sharedDaemonMetrics];
    [v20 reportDaemonHeartbeatForSessionUUID:self->_sessionUUID daemonUpTimeExcludingSleepMinutes:v15 daemonUpTimeIncludingSleepMinutes:v17 systemUpTimeMinutes:v19 memoryFootprintInBytes:0];

    [v3 upTimeIncludingSleepAndDriftCorrection];
    self->_lastDaemonHeartbeatEventReportedTimestamp = v21;
  }
}

- (void)startWithServices:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = _ARLogDaemon_0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    objc_super v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543618;
    long long v22 = v7;
    __int16 v23 = 2048;
    __int16 v24 = self;
    _os_log_impl(&dword_24719A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Starting up", buf, 0x16u);
  }
  [(ARDaemon *)self printInfo];
  heartbeatTimer = self->_heartbeatTimer;
  if (heartbeatTimer) {
    dispatch_activate(heartbeatTimer);
  }
  uint64_t v9 = (NSArray *)[v4 copy];
  runningRemoteServices = self->_runningRemoteServices;
  self->_runningRemoteServices = v9;

  [(ARServer *)self->_server commitServices:self->_runningRemoteServices];
  self->_state = 1;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v11 = self->_runningRemoteServices;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "syncServiceWithTimeout:callback:", -1, &__block_literal_global_17, (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (id)listenerEndPointForServiceNamed:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ARServer *)self->_server listenerEndPointForServiceNamed:v4];
  if (!v5)
  {
    v6 = [(ARDaemonServiceListener *)self->_listener listenerForServiceNamed:v4];
    BOOL v5 = [v6 endpoint];
  }
  return v5;
}

+ (id)_runningDaemons
{
  if (_runningDaemons_daemonsOnceToken != -1) {
    dispatch_once(&_runningDaemons_daemonsOnceToken, &__block_literal_global_19);
  }
  objc_msgSend((id)_weakDaemons, "ar_compactZeroedWeakPointers");
  v2 = (void *)_weakDaemons;
  return (id)[v2 allObjects];
}

uint64_t __27__ARDaemon__runningDaemons__block_invoke()
{
  _weakDaemons = [MEMORY[0x263F08A88] weakObjectsPointerArray];
  return MEMORY[0x270F9A758]();
}

+ (id)_fullDescription
{
  v2 = +[ARDaemon _runningDaemons];
  if ((unint64_t)[v2 count] < 2)
  {
    id v4 = [v2 firstObject];
    v3 = [v4 _fullDescription];
  }
  else
  {
    v3 = [v2 description];
  }

  return v3;
}

- (id)_fullDescription
{
  v3 = (void *)MEMORY[0x263F089D8];
  id v4 = [(ARDaemon *)self description];
  BOOL v5 = [v3 stringWithFormat:@"%@\n", v4];

  v6 = [(ARServer *)self->_server _fullDescription];
  [v5 appendFormat:@"Server: %@\n", v6];

  return v5;
}

- (void)memoryPressureMonitor:(id)a3 didUpdateProcessMemoryPressureCondition:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  ARGetMemoryFootprint();
  v6 = _ARLogDaemon_0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    uint64_t v9 = NSStringFromARMemoryPressureCondition(a4);
    *(_DWORD *)buf = 138544386;
    int v11 = v8;
    __int16 v12 = 2048;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2050;
    uint64_t v17 = 0;
    __int16 v18 = 2050;
    uint64_t v19 = 0;
    _os_log_impl(&dword_24719A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Process memory pressure condition: %@, footprint: %{iec-bytes,public}llu, peak: %{iec-bytes,public}llu", buf, 0x34u);
  }
}

- (void)memoryPressureMonitor:(id)a3 didUpdateSystemMemoryPressureCondition:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  ARGetMemoryFootprint();
  v6 = _ARLogDaemon_0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    uint64_t v9 = NSStringFromARMemoryPressureCondition(a4);
    *(_DWORD *)buf = 138544386;
    int v11 = v8;
    __int16 v12 = 2048;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2050;
    uint64_t v17 = 0;
    __int16 v18 = 2050;
    uint64_t v19 = 0;
    _os_log_impl(&dword_24719A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: System memory pressure condition: %@, footprint: %{iec-bytes,public}llu, peak: %{iec-bytes,public}llu", buf, 0x34u);
  }
}

- (ARDaemonServiceListener)listener
{
  return self->_listener;
}

- (unint64_t)state
{
  return self->_state;
}

- (ARServer)server
{
  return self->_server;
}

- (NSArray)runningRemoteServices
{
  return self->_runningRemoteServices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningRemoteServices, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_spawnTime, 0);
  objc_storeStrong((id *)&self->_memoryPressureMonitor, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end