@interface ARServer
- (ARAlgorithmConfiguration)currentConfiguration;
- (ARDaemonService)serviceBeingRemoved;
- (ARServer)initWithDaemonConfiguration:(id)a3 spawnTime:(id)a4 sessionUUID:(id)a5 watchdogMonitor:(id)a6 executionManager:(id)a7;
- (ARUserProfile)userProfile;
- (BOOL)_addServices:(id)a3;
- (BOOL)_shouldAddService:(Class)a3 forPID:(int)a4;
- (BOOL)_updateWithServices:(id)a3 error:(id *)a4;
- (BOOL)commitServices:(id)a3;
- (BOOL)isKeybagUnlocked;
- (BOOL)servicesIsEmpty;
- (BOOL)updateAlgorithmConfigurationWithService:(id)a3;
- (BOOL)updateAlgorithmConfigurationWithServices:(id)a3;
- (NSArray)servicesBeingAdded;
- (OS_dispatch_queue)serviceQueue;
- (id)_fullDescription;
- (id)_peerServicesOfService:(id)a3;
- (id)daemonServiceForServiceNamed:(id)a3;
- (id)fullDescriptionWithWaitEndOfTransition:(BOOL)a3;
- (id)listenerEndPointForServiceNamed:(id)a3;
- (id)service:(id)a3 peerServiceOfType:(Class)a4;
- (id)statusDictionaryWithWaitEndOfTransition:(BOOL)a3;
- (id)statusStringWithWaitEndOfTransition:(BOOL)a3;
- (int64_t)numberOfActiveConnectionsForService:(id)a3;
- (void)_configureServiceForExecution:(id)a3;
- (void)_logDaemonStatus;
- (void)_removeService:(id)a3;
- (void)_removeServiceFromServicesByClass:(id)a3;
- (void)_setupHealthReportLogTimer;
- (void)_updateServicesByPID;
- (void)dealloc;
- (void)didDiscoverControl:(id)a3;
- (void)didDiscoverService:(id)a3;
- (void)invalidate;
- (void)resume;
- (void)serviceDidInterrupt:(id)a3;
- (void)serviceDidInvalidate:(id)a3;
- (void)setCurrentConfiguration:(id)a3;
- (void)setIsKeybagUnlocked:(BOOL)a3;
- (void)setServiceBeingRemoved:(id)a3;
- (void)setServices:(id)a3;
- (void)setServicesBeingAdded:(id)a3;
- (void)setUserProfile:(id)a3;
- (void)suspend;
@end

@implementation ARServer

- (ARServer)initWithDaemonConfiguration:(id)a3 spawnTime:(id)a4 sessionUUID:(id)a5 watchdogMonitor:(id)a6 executionManager:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = _ARLogDaemon_4();
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24719A000, v18, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ARServerInitialization", (const char *)&unk_2471AB592, buf, 2u);
  }

  v41.receiver = self;
  v41.super_class = (Class)ARServer;
  v19 = [(ARServer *)&v41 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_daemonConfiguration, a3);
    objc_storeStrong((id *)&v20->_spawnTime, a4);
    objc_storeStrong((id *)&v20->_sessionUUID, a5);
    uint64_t v21 = objc_opt_new();
    services = v20->_services;
    v20->_services = (NSMutableArray *)v21;

    uint64_t v23 = objc_opt_new();
    servicesByClass = v20->_servicesByClass;
    v20->_servicesByClass = (NSMutableDictionary *)v23;

    uint64_t v25 = objc_opt_new();
    servicesByPID = v20->_servicesByPID;
    v20->_servicesByPID = (NSMutableDictionary *)v25;

    servicesBeingAdded = v20->_servicesBeingAdded;
    v20->_servicesBeingAdded = (NSArray *)MEMORY[0x263EFFA68];

    v20->_servicesLock._os_unfair_lock_opaque = 0;
    v20->_batchedServicesLock._os_unfair_lock_opaque = 0;
    uint64_t v28 = ARCreateFixedPriorityDispatchQueue();
    serviceQueue = v20->_serviceQueue;
    v20->_serviceQueue = (OS_dispatch_queue *)v28;

    [v16 addQueue:v20->_serviceQueue hangPolicy:0];
    uint64_t v30 = [MEMORY[0x263EFF980] array];
    batchedServices = v20->_batchedServices;
    v20->_batchedServices = (NSMutableArray *)v30;

    dispatch_semaphore_t v32 = dispatch_semaphore_create(0);
    batchedServicesConfiguredSemaphore = v20->_batchedServicesConfiguredSemaphore;
    v20->_batchedServicesConfiguredSemaphore = (OS_dispatch_semaphore *)v32;

    v34 = [[ARControlListener alloc] initWithDelegate:v20 daemonConfiguration:v20->_daemonConfiguration];
    controlListener = v20->_controlListener;
    v20->_controlListener = v34;

    v36 = (ARDaemonStatusLogger *)objc_alloc_init(MEMORY[0x263F20E68]);
    statusLogger = v20->_statusLogger;
    v20->_statusLogger = v36;

    uint64_t v38 = +[ARUserProfile defaultProfile];
    userProfile = v20->_userProfile;
    v20->_userProfile = (ARUserProfile *)v38;

    [(ARServer *)v20 _setupHealthReportLogTimer];
  }
  __95__ARServer_initWithDaemonConfiguration_spawnTime_sessionUUID_watchdogMonitor_executionManager___block_invoke();

  return v20;
}

void __95__ARServer_initWithDaemonConfiguration_spawnTime_sessionUUID_watchdogMonitor_executionManager___block_invoke()
{
  v0 = _ARLogDaemon_4();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_24719A000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ARServerInitialization", (const char *)&unk_2471AB592, v1, 2u);
  }
}

- (void)dealloc
{
  [(ARServer *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ARServer;
  [(ARServer *)&v3 dealloc];
}

- (void)invalidate
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  objc_super v3 = _ARLogDaemon_4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    v9 = v5;
    __int16 v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_24719A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Invalidating services", buf, 0x16u);
  }
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serviceQueue);
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __22__ARServer_invalidate__block_invoke;
  block[3] = &unk_265206E30;
  block[4] = self;
  dispatch_async_and_wait(serviceQueue, block);
}

void __22__ARServer_invalidate__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(NSObject **)(v2 + 112);
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 112);
    *(void *)(v4 + 112) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(v2 + 16) enumerateObjectsUsingBlock:&__block_literal_global_11];
  v6 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 40);
  os_unfair_lock_unlock(v6);
}

uint64_t __22__ARServer_invalidate__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (void)resume
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_super v3 = _ARLogDaemon_4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    int v6 = 138543618;
    v7 = v5;
    __int16 v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_24719A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Resuming services", (uint8_t *)&v6, 0x16u);
  }
  os_unfair_lock_lock(&self->_servicesLock);
  [(NSMutableArray *)self->_services enumerateObjectsUsingBlock:&__block_literal_global_13];
  os_unfair_lock_unlock(&self->_servicesLock);
}

uint64_t __18__ARServer_resume__block_invoke(uint64_t a1, void *a2)
{
  return [a2 resume];
}

- (BOOL)servicesIsEmpty
{
  uint64_t v2 = self;
  p_servicesLock = &self->_servicesLock;
  os_unfair_lock_lock(&self->_servicesLock);
  LOBYTE(v2) = [(NSMutableArray *)v2->_services count] == 0;
  os_unfair_lock_unlock(p_servicesLock);
  return (char)v2;
}

- (void)suspend
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_super v3 = _ARLogDaemon_4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    int v6 = 138543618;
    v7 = v5;
    __int16 v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_24719A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Suspending services", (uint8_t *)&v6, 0x16u);
  }
  os_unfair_lock_lock(&self->_servicesLock);
  [(NSMutableArray *)self->_services enumerateObjectsUsingBlock:&__block_literal_global_15];
  os_unfair_lock_unlock(&self->_servicesLock);
}

uint64_t __19__ARServer_suspend__block_invoke(uint64_t a1, void *a2)
{
  return [a2 suspend];
}

- (id)daemonServiceForServiceNamed:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_services;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend((id)objc_opt_class(), "serviceName", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_addServices:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v33 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  id v4 = _ARLogDaemon_4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138543874;
    v40 = v6;
    __int16 v41 = 2048;
    v42 = self;
    __int16 v43 = 2112;
    id v44 = v33;
    _os_log_impl(&dword_24719A000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Adding services '%@'", buf, 0x20u);
  }
  dispatch_semaphore_t v32 = [MEMORY[0x263EFF980] arrayWithArray:v33];
  os_unfair_lock_lock(&self->_servicesLock);
  [(ARServer *)self setServicesBeingAdded:v33];
  if ([v32 count])
  {
    os_log_t log = [v32 arrayByAddingObjectsFromArray:self->_services];
    uint64_t v7 = NSString;
    __int16 v8 = [v32 componentsJoinedByString:@", "];
    uint64_t v28 = [v7 stringWithFormat:@"ARServer: Triggering algorithm update due to adding services: %@", v8];

    v9 = _ARLogGeneral_1();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v40 = v28;
      _os_log_impl(&dword_24719A000, v9, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
    }

    uint64_t v10 = _ARLogDaemon_4();
    if (os_signpost_enabled(v10))
    {
      *(_DWORD *)buf = 138543362;
      v40 = v28;
      _os_signpost_emit_with_name_impl(&dword_24719A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ARKitTransitionUpdateWithServices", "%{public}@", buf, 0xCu);
    }

    id v38 = 0;
    BOOL v30 = [(ARServer *)self _updateWithServices:log error:&v38];
    id v31 = v38;
    if (v30)
    {
      id v11 = [log mutableCopy];
      [(ARServer *)self setServices:v11];

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v12 = v32;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v47 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v35 != v14) {
              objc_enumerationMutation(v12);
            }
            long long v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            id v17 = [(NSMutableDictionary *)self->_servicesByClass objectForKeyedSubscript:objc_opt_class()];
            if (!v17)
            {
              id v17 = objc_opt_new();
              [(NSMutableDictionary *)self->_servicesByClass setObject:v17 forKeyedSubscript:objc_opt_class()];
            }
            [v17 addObject:v16];
            uint64_t v18 = +[ARDaemonMetrics sharedDaemonMetrics];
            v19 = [(id)objc_opt_class() serviceName];
            v20 = [v16 clientBundleIdentifier];
            [v18 reportServiceAddedWithName:v19 clientBundleIdentifier:v20];
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v47 count:16];
        }
        while (v13);
      }
    }
    __25__ARServer__addServices___block_invoke();
  }
  else
  {
    _ARLogDaemon_4();
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      uint64_t v23 = [(NSMutableDictionary *)self->_servicesByClass allKeys];
      *(_DWORD *)buf = 138544130;
      v40 = v22;
      __int16 v41 = 2048;
      v42 = self;
      __int16 v43 = 2112;
      id v44 = v33;
      __int16 v45 = 2112;
      v46 = v23;
      _os_log_impl(&dword_24719A000, log, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: No services to be added from %@ to %@", buf, 0x2Au);
    }
    id v31 = 0;
    LOBYTE(v30) = 0;
  }

  [(ARServer *)self setServicesBeingAdded:MEMORY[0x263EFFA68]];
  os_unfair_lock_unlock(&self->_servicesLock);
  if (v31)
  {
    v24 = _ARLogDaemon_4();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      *(_DWORD *)buf = 138543874;
      v40 = v26;
      __int16 v41 = 2048;
      v42 = self;
      __int16 v43 = 2112;
      id v44 = v31;
      _os_log_impl(&dword_24719A000, v24, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error setting up service: %@", buf, 0x20u);
    }
    LOBYTE(v30) = 0;
  }

  return v30;
}

void __25__ARServer__addServices___block_invoke()
{
  v0 = _ARLogDaemon_4();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_24719A000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ARKitTransitionUpdateWithServices", (const char *)&unk_2471AB592, v1, 2u);
  }
}

- (id)listenerEndPointForServiceNamed:(id)a3
{
  daemonConfiguration = self->_daemonConfiguration;
  id v5 = a3;
  id v6 = objc_msgSend((id)-[ARDaemonConfiguration controlClass](daemonConfiguration, "controlClass"), "performSelector:", sel_serviceName);
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    __int16 v8 = [(ARControlListener *)self->_controlListener endpoint];
  }
  else
  {
    __int16 v8 = 0;
  }

  return v8;
}

- (id)statusDictionaryWithWaitEndOfTransition:(BOOL)a3
{
  v43[1] = *MEMORY[0x263EF8340];
  id v4 = objc_opt_new();
  id v5 = [MEMORY[0x263F08AB0] processInfo];
  id v6 = [v5 processName];

  v42 = @"pid";
  int v7 = NSNumber;
  __int16 v8 = [MEMORY[0x263F08AB0] processInfo];
  v9 = objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "processIdentifier"));
  v43[0] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v43 forKeys:&v42 count:1];

  v40 = v6;
  __int16 v41 = v10;
  id v11 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
  [v4 addEntriesFromDictionary:v11];

  ARGetSystemBootTime();
  double v13 = v12;
  uint64_t v14 = objc_opt_new();
  long long v15 = [v14 timeSinceSnapshot:self->_spawnTime];
  long long v16 = (void *)MEMORY[0x263EFF910];
  [(ARSystemTimeSnapshot *)self->_spawnTime upTimeIncludingSleepAndDriftCorrection];
  uint64_t v18 = [v16 dateWithTimeIntervalSince1970:v13 + v17];
  v19 = objc_msgSend(NSString, "ar_timestampWithDate:", v18);
  v20 = [NSString stringWithFormat:@"%@_spawn_time", v6];
  [v4 setObject:v19 forKeyedSubscript:v20];

  uint64_t v21 = NSString;
  [v15 upTime];
  v22 = objc_msgSend(v21, "ar_hoursMinutesSecondsWithTimeInterval:");
  uint64_t v23 = [NSString stringWithFormat:@"%@_up_time", v6];
  [v4 setObject:v22 forKeyedSubscript:v23];

  v24 = NSString;
  [v15 upTimeIncludingSleep];
  uint64_t v25 = objc_msgSend(v24, "ar_hoursMinutesSecondsWithTimeInterval:");
  v26 = [NSString stringWithFormat:@"%@_up_time_including_sleep", v6];
  [v4 setObject:v25 forKeyedSubscript:v26];

  v27 = NSString;
  [v15 upTimeIncludingSleepAndDriftCorrection];
  uint64_t v28 = objc_msgSend(v27, "ar_hoursMinutesSecondsWithTimeInterval:");
  v29 = [NSString stringWithFormat:@"%@_up_time_including_sleep_and_drift_correction", v6];
  [v4 setObject:v28 forKeyedSubscript:v29];

  BOOL v30 = NSString;
  id v31 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v13];
  dispatch_semaphore_t v32 = objc_msgSend(v30, "ar_timestampWithDate:", v31);
  [v4 setObject:v32 forKeyedSubscript:@"system_boot_time"];

  id v33 = NSString;
  [v14 upTime];
  long long v34 = objc_msgSend(v33, "ar_hoursMinutesSecondsWithTimeInterval:");
  [v4 setObject:v34 forKeyedSubscript:@"system_up_time"];

  long long v35 = NSString;
  [v14 upTimeIncludingSleep];
  long long v36 = objc_msgSend(v35, "ar_hoursMinutesSecondsWithTimeInterval:");
  [v4 setObject:v36 forKeyedSubscript:@"system_up_time_including_sleep"];

  long long v37 = NSString;
  [v14 upTimeIncludingSleepAndDriftCorrection];
  id v38 = objc_msgSend(v37, "ar_hoursMinutesSecondsWithTimeInterval:");
  [v4 setObject:v38 forKeyedSubscript:@"system_up_time_including_sleep_and_drift_correction"];

  return v4;
}

- (id)statusStringWithWaitEndOfTransition:(BOOL)a3
{
  id v4 = objc_opt_new();
  id v5 = [MEMORY[0x263F08AB0] processInfo];
  id v6 = [v5 processName];

  ARGetSystemBootTime();
  double v8 = v7;
  v9 = objc_opt_new();
  uint64_t v10 = [v9 timeSinceSnapshot:self->_spawnTime];
  id v11 = (void *)MEMORY[0x263EFF910];
  [(ARSystemTimeSnapshot *)self->_spawnTime upTimeIncludingSleepAndDriftCorrection];
  double v13 = [v11 dateWithTimeIntervalSince1970:v8 + v12];
  uint64_t v14 = [MEMORY[0x263F08AB0] processInfo];
  [v4 appendFormat:@"%@ pid: %d\n", v6, objc_msgSend(v14, "processIdentifier")];

  long long v15 = objc_msgSend(NSString, "ar_timestampWithDate:", v13);
  [v4 appendFormat:@"%@ spawn time: %@\n", v6, v15];

  long long v16 = NSString;
  [v10 upTime];
  double v17 = objc_msgSend(v16, "ar_hoursMinutesSecondsWithTimeInterval:");
  [v4 appendFormat:@"%@ up time: %@\n", v6, v17];

  uint64_t v18 = NSString;
  [v10 upTimeIncludingSleep];
  v19 = objc_msgSend(v18, "ar_hoursMinutesSecondsWithTimeInterval:");
  [v4 appendFormat:@"%@ up time (including sleep): %@\n", v6, v19];

  v20 = NSString;
  [v10 upTimeIncludingSleepAndDriftCorrection];
  uint64_t v21 = objc_msgSend(v20, "ar_hoursMinutesSecondsWithTimeInterval:");
  [v4 appendFormat:@"%@ up time (including sleep and drift correction): %@\n", v6, v21];

  v22 = NSString;
  uint64_t v23 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v8];
  v24 = objc_msgSend(v22, "ar_timestampWithDate:", v23);
  [v4 appendFormat:@"System boot time: %@\n", v24];

  uint64_t v25 = NSString;
  [v9 upTime];
  v26 = objc_msgSend(v25, "ar_hoursMinutesSecondsWithTimeInterval:");
  [v4 appendFormat:@"System up time: %@\n", v26];

  v27 = NSString;
  [v9 upTimeIncludingSleep];
  uint64_t v28 = objc_msgSend(v27, "ar_hoursMinutesSecondsWithTimeInterval:");
  [v4 appendFormat:@"System up time (including sleep): %@\n", v28];

  v29 = NSString;
  [v9 upTimeIncludingSleepAndDriftCorrection];
  BOOL v30 = objc_msgSend(v29, "ar_hoursMinutesSecondsWithTimeInterval:");
  [v4 appendFormat:@"System up time (including sleep and drift correction): %@\n", v30];

  return v4;
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (id)service:(id)a3 peerServiceOfType:(Class)a4
{
  id v5 = [(ARServer *)self _peerServicesOfService:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__ARServer_service_peerServiceOfType___block_invoke;
  v8[3] = &__block_descriptor_40_e32_B32__0__ARDaemonService_8Q16_B24lu32l8;
  v8[4] = a4;
  id v6 = objc_msgSend(v5, "ar_firstObjectPassingTest:", v8);

  return v6;
}

uint64_t __38__ARServer_service_peerServiceOfType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isMemberOfClass:*(void *)(a1 + 32)]) {
    uint64_t v4 = [v3 isActive];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (int64_t)numberOfActiveConnectionsForService:(id)a3
{
  id v4 = a3;
  p_servicesLock = &self->_servicesLock;
  os_unfair_lock_lock(&self->_servicesLock);
  id v6 = [(id)objc_opt_class() serviceName];
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  services = self->_services;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__ARServer_numberOfActiveConnectionsForService___block_invoke;
  v11[3] = &unk_265206FA0;
  id v8 = v6;
  id v12 = v8;
  double v13 = &v14;
  [(NSMutableArray *)services enumerateObjectsUsingBlock:v11];
  int64_t v9 = v15[3];

  _Block_object_dispose(&v14, 8);
  os_unfair_lock_unlock(p_servicesLock);

  return v9;
}

void __48__ARServer_numberOfActiveConnectionsForService___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [(id)objc_opt_class() serviceName];
  LODWORD(v2) = [v2 isEqualToString:v3];

  if (v2) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (id)_peerServicesOfService:(id)a3
{
  id v4 = a3;
  p_servicesLock = &self->_servicesLock;
  os_unfair_lock_lock(&self->_servicesLock);
  id v6 = objc_opt_new();
  services = self->_services;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __35__ARServer__peerServicesOfService___block_invoke;
  v13[3] = &unk_265206FC8;
  id v8 = v4;
  id v14 = v8;
  id v9 = v6;
  id v15 = v9;
  [(NSMutableArray *)services enumerateObjectsUsingBlock:v13];
  uint64_t v10 = v15;
  id v11 = v9;

  os_unfair_lock_unlock(p_servicesLock);
  return v11;
}

uint64_t __35__ARServer__peerServicesOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(id *)(a1 + 32) != v3)
  {
    id v7 = v3;
    int v5 = [v3 clientProcessIdentifier];
    id v3 = (id)[*(id *)(a1 + 32) clientProcessIdentifier];
    id v4 = v7;
    if (v5 == v3)
    {
      id v3 = (id)[*(id *)(a1 + 40) addObject:v7];
      id v4 = v7;
    }
  }
  return MEMORY[0x270F9A758](v3, v4);
}

- (BOOL)_updateWithServices:(id)a3 error:(id *)a4
{
  return 1;
}

- (void)_removeService:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  int v5 = _ARLogDaemon_4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543874;
    uint64_t v25 = v7;
    __int16 v26 = 2048;
    v27 = self;
    __int16 v28 = 2112;
    id v29 = v4;
    _os_log_impl(&dword_24719A000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Removing service '%@'", buf, 0x20u);
  }
  os_unfair_lock_lock(&self->_servicesLock);
  [(ARServer *)self setServiceBeingRemoved:v4];
  id v8 = (void *)[(NSMutableArray *)self->_services mutableCopy];
  if ([v8 containsObject:v4])
  {
    [v8 removeObject:v4];
  }
  else
  {
    id v9 = _ARLogDaemon_4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      id v12 = [v4 shortenedServiceNameForLogging];
      *(_DWORD *)buf = 138543874;
      uint64_t v25 = v11;
      __int16 v26 = 2048;
      v27 = self;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_impl(&dword_24719A000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Tried to remove service %@, but it was not found in active services", buf, 0x20u);
    }
  }
  double v13 = [NSString stringWithFormat:@"ARServer: Triggering algorithm update due to the removal of a service: %@", v4];
  id v14 = _ARLogGeneral_1();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v13;
    _os_log_impl(&dword_24719A000, v14, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
  }

  id v15 = _ARLogDaemon_4();
  if (os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v13;
    _os_signpost_emit_with_name_impl(&dword_24719A000, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ARKitTransitionUpdateWithServices", "%{public}@", buf, 0xCu);
  }

  id v23 = 0;
  BOOL v16 = [(ARServer *)self _updateWithServices:v8 error:&v23];
  id v17 = v23;
  if (v16)
  {
    [(ARServer *)self setServices:v8];
    [(ARServer *)self _removeServiceFromServicesByClass:v4];
    uint64_t v18 = +[ARDaemonMetrics sharedDaemonMetrics];
    v19 = [(id)objc_opt_class() serviceName];
    v20 = [v4 clientBundleIdentifier];
    [v18 reportServiceRemovedWithName:v19 clientBundleIdentifier:v20];
  }
  else
  {
    uint64_t v18 = _ARLogDaemon_4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138544130;
      uint64_t v25 = v22;
      __int16 v26 = 2048;
      v27 = self;
      __int16 v28 = 2112;
      id v29 = v4;
      __int16 v30 = 2112;
      id v31 = v17;
      _os_log_impl(&dword_24719A000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error removing service %@: %@", buf, 0x2Au);
    }
  }

  [(ARServer *)self setServiceBeingRemoved:0];
  os_unfair_lock_unlock(&self->_servicesLock);
  __25__ARServer__addServices___block_invoke();
}

- (void)setServices:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  if (os_unfair_lock_trylock(&self->_servicesLock))
  {
    os_unfair_lock_unlock(&self->_servicesLock);
  }
  else
  {
    objc_storeStrong((id *)&self->_services, a3);
    [(ARServer *)self _updateServicesByPID];
  }
}

- (void)_updateServicesByPID
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  if (os_unfair_lock_trylock(&self->_servicesLock))
  {
    os_unfair_lock_unlock(&self->_servicesLock);
  }
  else
  {
    id v3 = objc_opt_new();
    services = self->_services;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __32__ARServer__updateServicesByPID__block_invoke;
    v8[3] = &unk_265206FF0;
    id v5 = v3;
    id v9 = v5;
    [(NSMutableArray *)services enumerateObjectsUsingBlock:v8];
    servicesByPID = self->_servicesByPID;
    self->_servicesByPID = v5;
    id v7 = v5;
  }
}

void __32__ARServer__updateServicesByPID__block_invoke(uint64_t a1, void *a2)
{
  id v3 = NSNumber;
  id v4 = a2;
  id v5 = [v4 connection];
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v5, "processIdentifier"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];

  if (!v6)
  {
    id v7 = objc_opt_new();
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v9];
  }
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
  [v8 addObject:v4];
}

- (id)_fullDescription
{
  return [(ARServer *)self fullDescriptionWithWaitEndOfTransition:0];
}

- (id)fullDescriptionWithWaitEndOfTransition:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)MEMORY[0x263F089D8];
  id v6 = [(ARServer *)self description];
  id v7 = [v5 stringWithFormat:@"%@\n", v6];

  id v8 = [(ARServer *)self statusStringWithWaitEndOfTransition:v3];
  [v7 appendFormat:@"-Status: (%@)\n", v8];

  [v7 appendFormat:@"-Services: %@\n", self->_services];
  id v9 = [(NSMutableDictionary *)self->_servicesByClass allKeys];
  [v7 appendFormat:@"-Service Classes: %@\n", v9];

  return v7;
}

- (void)_removeServiceFromServicesByClass:(id)a3
{
  id v6 = a3;
  id v4 = [(NSMutableDictionary *)self->_servicesByClass objectForKeyedSubscript:objc_opt_class()];
  id v5 = v4;
  if (v4)
  {
    [v4 removeObject:v6];
    if (![v5 count]) {
      [(NSMutableDictionary *)self->_servicesByClass removeObjectForKey:objc_opt_class()];
    }
  }
}

- (void)didDiscoverService:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serviceQueue);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  id v5 = _os_activity_create(&dword_24719A000, "Daemon service discovered", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v9);

  id v6 = _ARLogDaemon_4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138543874;
    id v11 = v8;
    __int16 v12 = 2048;
    double v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_24719A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Service '%@' was discovered.", buf, 0x20u);
  }
  objc_msgSend(v4, "setDelegate:", self, v9.opaque[0], v9.opaque[1]);
  [v4 setDataSource:self];
  [(ARServer *)self _configureServiceForExecution:v4];
  os_activity_scope_leave(&v9);
}

- (BOOL)_shouldAddService:(Class)a3 forPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  unint64_t v7 = [(objc_class *)a3 maximumConcurrentServicesPerClient];
  id v8 = _ARLogGeneral_1();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    os_activity_scope_state_s v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138544386;
    uint64_t v25 = v10;
    __int16 v26 = 2048;
    v27 = self;
    __int16 v28 = 1024;
    *(_DWORD *)id v29 = v4;
    *(_WORD *)&v29[4] = 2112;
    *(void *)&v29[6] = a3;
    __int16 v30 = 2048;
    unint64_t v31 = v7;
    _os_log_impl(&dword_24719A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Checking pid %d: class %@ has maximum %ld concurrent services", buf, 0x30u);
  }
  servicesByPID = self->_servicesByPID;
  __int16 v12 = [NSNumber numberWithInt:v4];
  double v13 = [(NSMutableDictionary *)servicesByPID objectForKeyedSubscript:v12];

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __37__ARServer__shouldAddService_forPID___block_invoke;
  v23[3] = &__block_descriptor_40_e32_B32__0__ARDaemonService_8Q16_B24lu32l8;
  v23[4] = a3;
  __int16 v14 = (void *)MEMORY[0x24C54B4E0](v23);
  if (v13)
  {
    id v15 = [v13 indexesOfObjectsPassingTest:v14];
    uint64_t v16 = [v15 count];
  }
  else
  {
    uint64_t v16 = 0;
  }
  os_unfair_lock_lock_with_options();
  id v17 = [(NSMutableArray *)self->_batchedServices indexesOfObjectsPassingTest:v14];
  unint64_t v18 = [v17 count] + v16;

  os_unfair_lock_unlock(&self->_batchedServicesLock);
  if (v18 >= v7)
  {
    v19 = _ARLogDaemon_4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (objc_class *)objc_opt_class();
      uint64_t v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138544386;
      uint64_t v25 = v21;
      __int16 v26 = 2048;
      v27 = self;
      __int16 v28 = 2114;
      *(void *)id v29 = a3;
      *(_WORD *)&v29[8] = 1024;
      *(_DWORD *)&v29[10] = v4;
      __int16 v30 = 2048;
      unint64_t v31 = v7;
      _os_log_impl(&dword_24719A000, v19, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Rejecting service %{public}@ for pid %d, exceeds maximum services of type per client (%ld)", buf, 0x30u);
    }
  }

  return v18 < v7;
}

BOOL __37__ARServer__shouldAddService_forPID___block_invoke(uint64_t a1)
{
  return objc_opt_class() == *(void *)(a1 + 32);
}

- (void)_configureServiceForExecution:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serviceQueue);
  id v5 = _ARLogDaemon_4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (objc_class *)objc_opt_class();
    unint64_t v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2114;
    id v30 = v4;
    _os_log_impl(&dword_24719A000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Configuring service '%{public}@' for execution", buf, 0x20u);
  }
  id v8 = _ARLogDaemon_4();
  os_activity_scope_state_s v9 = (char *)os_signpost_id_generate(v8);

  uint64_t v10 = _ARLogDaemon_4();
  id v11 = v10;
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    __int16 v12 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v12);
    __int16 v14 = [v4 clientProcessName];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v14;
    _os_signpost_emit_with_name_impl(&dword_24719A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v9, "AddServiceWaitServiceQueue", "%{public}@(%{public}@)", buf, 0x16u);
  }
  objc_initWeak(&location, self);
  if (self->_numServicesToBatchCommit)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    LOBYTE(v30) = 0;
    serviceQueue = self->_serviceQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__ARServer__configureServiceForExecution___block_invoke;
    block[3] = &unk_265207018;
    objc_copyWeak(&v27, &location);
    id v16 = v4;
    id v25 = v16;
    __int16 v26 = buf;
    dispatch_async_and_wait(serviceQueue, block);
    os_unfair_lock_lock_with_options();
    if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
      --self->_numServicesToBatchCommit;
    }
    else {
      [(NSMutableArray *)self->_batchedServices addObject:v16];
    }
    if ([(NSMutableArray *)self->_batchedServices count] >= self->_numServicesToBatchCommit) {
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_batchedServicesConfiguredSemaphore);
    }
    os_unfair_lock_unlock(&self->_batchedServicesLock);
    unint64_t v18 = _ARLogDaemon_4();
    v19 = v18;
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)id v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_24719A000, v19, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v9, "AddServiceWaitServiceQueue", (const char *)&unk_2471AB592, v23, 2u);
    }

    objc_destroyWeak(&v27);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v17 = self->_serviceQueue;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __42__ARServer__configureServiceForExecution___block_invoke_107;
    v20[3] = &unk_265207060;
    objc_copyWeak(v22, &location);
    v22[1] = v9;
    id v21 = v4;
    dispatch_async_and_wait(v17, v20);

    objc_destroyWeak(v22);
  }
  objc_destroyWeak(&location);
}

void __42__ARServer__configureServiceForExecution___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ((objc_msgSend(WeakRetained, "_shouldAddService:forPID:", objc_opt_class(), objc_msgSend(*(id *)(a1 + 32), "clientProcessIdentifier")) & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 32) clientService];
    BOOL v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F20DE8] code:501 userInfo:0];
    [v2 serviceConfiguredWithError:v3];

    [*(id *)(a1 + 32) invalidate];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __42__ARServer__configureServiceForExecution___block_invoke_107(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = _ARLogDaemon_4();
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24719A000, v4, OS_SIGNPOST_INTERVAL_END, v5, "AddServiceWaitServiceQueue", (const char *)&unk_2471AB592, buf, 2u);
  }

  if (objc_msgSend(WeakRetained, "_shouldAddService:forPID:", objc_opt_class(), objc_msgSend(*(id *)(a1 + 32), "clientProcessIdentifier")))
  {
    id v6 = _ARLogDaemon_4();
    unint64_t v7 = v6;
    os_signpost_id_t v8 = *(void *)(a1 + 48);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      os_activity_scope_state_s v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      id v11 = [*(id *)(a1 + 32) clientProcessName];
      *(_DWORD *)buf = 138543618;
      id v16 = v10;
      __int16 v17 = 2114;
      unint64_t v18 = v11;
      _os_signpost_emit_with_name_impl(&dword_24719A000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v8, "AddService", "%{public}@(%{public}@)", buf, 0x16u);
    }
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __42__ARServer__configureServiceForExecution___block_invoke_108;
    v14[3] = &__block_descriptor_40_e5_v8__0l;
    v14[4] = *(void *)(a1 + 48);
    [WeakRetained updateAlgorithmConfigurationWithService:*(void *)(a1 + 32)];
    __42__ARServer__configureServiceForExecution___block_invoke_108((uint64_t)v14);
  }
  else
  {
    __int16 v12 = [*(id *)(a1 + 32) clientService];
    double v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F20DE8] code:501 userInfo:0];
    [v12 serviceConfiguredWithError:v13];

    [*(id *)(a1 + 32) invalidate];
  }
}

void __42__ARServer__configureServiceForExecution___block_invoke_108(uint64_t a1)
{
  uint64_t v2 = _ARLogDaemon_4();
  BOOL v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)os_signpost_id_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_24719A000, v3, OS_SIGNPOST_INTERVAL_END, v4, "AddService", (const char *)&unk_2471AB592, v5, 2u);
  }
}

- (BOOL)commitServices:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serviceQueue);
  os_signpost_id_t v5 = _ARLogDaemon_4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (objc_class *)objc_opt_class();
    unint64_t v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2114;
    id v32 = v4;
    _os_log_impl(&dword_24719A000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Committing batched services: %{public}@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  LOBYTE(v32) = 0;
  unint64_t v8 = [v4 count];
  self->_numServicesToBatchCommit = v8;
  if (v8)
  {
    os_activity_scope_state_s v9 = _ARLogDaemon_4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      *(_DWORD *)id v25 = 138543874;
      __int16 v26 = v11;
      __int16 v27 = 2048;
      __int16 v28 = self;
      __int16 v29 = 2114;
      id v30 = v4;
      _os_log_impl(&dword_24719A000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Preparing to start sorted batched services: %{public}@", v25, 0x20u);
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v12 = v4;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * i) _startService];
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    dispatch_semaphore_wait((dispatch_semaphore_t)self->_batchedServicesConfiguredSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    serviceQueue = self->_serviceQueue;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __27__ARServer_commitServices___block_invoke;
    v19[3] = &unk_265207088;
    v19[4] = self;
    v19[5] = buf;
    dispatch_async_and_wait(serviceQueue, v19);
  }
  BOOL v17 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);

  return v17;
}

void __27__ARServer_commitServices___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 72);
  os_unfair_lock_lock(v2);
  if ([*(id *)(*(void *)(a1 + 32) + 80) count])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) updateAlgorithmConfigurationWithServices:*(void *)(*(void *)(a1 + 32) + 80)];
    [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
    *(void *)(*(void *)(a1 + 32) + 64) = 0;
  }
  else
  {
    BOOL v3 = _ARLogDaemon_4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = (objc_class *)objc_opt_class();
      os_signpost_id_t v5 = NSStringFromClass(v4);
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138543618;
      unint64_t v8 = v5;
      __int16 v9 = 2048;
      uint64_t v10 = v6;
      _os_log_impl(&dword_24719A000, v3, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: No batched services available. Skipping algorithm configuration update.", (uint8_t *)&v7, 0x16u);
    }
  }
  os_unfair_lock_unlock(v2);
}

- (BOOL)updateAlgorithmConfigurationWithService:(id)a3
{
  BOOL v3 = self;
  v8[1] = *MEMORY[0x263EF8340];
  serviceQueue = self->_serviceQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(serviceQueue);
  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  LOBYTE(v3) = [(ARServer *)v3 updateAlgorithmConfigurationWithServices:v6];
  return (char)v3;
}

- (BOOL)updateAlgorithmConfigurationWithServices:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  BOOL v5 = [(ARServer *)self _addServices:v4];
  uint64_t v6 = _ARLogGeneral_1();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      unint64_t v8 = (objc_class *)objc_opt_class();
      __int16 v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138543874;
      __int16 v26 = v9;
      __int16 v27 = 2048;
      __int16 v28 = self;
      __int16 v29 = 2114;
      id v30 = v4;
      _os_log_impl(&dword_24719A000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Updated algorithms for service: %{public}@", buf, 0x20u);
    }
    uint64_t v10 = 0;
  }
  else
  {
    if (v7)
    {
      uint64_t v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138543874;
      __int16 v26 = v12;
      __int16 v27 = 2048;
      __int16 v28 = self;
      __int16 v29 = 2114;
      id v30 = v4;
      _os_log_impl(&dword_24719A000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Failed to update algorithms for services: %{public}@", buf, 0x20u);
    }
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F20DE8] code:501 userInfo:0];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        unint64_t v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v17), "clientService", (void)v20);
        [v18 serviceConfiguredWithError:v10];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  return v10 == 0;
}

- (void)didDiscoverControl:(id)a3
{
}

- (void)serviceDidInvalidate:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serviceQueue);
  BOOL v5 = _ARLogDaemon_4();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  BOOL v7 = _ARLogDaemon_4();
  unint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v4;
    _os_signpost_emit_with_name_impl(&dword_24719A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "TransitionQueueDelaySync", "service invalidated %{public}@", buf, 0xCu);
  }

  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__ARServer_serviceDidInvalidate___block_invoke;
  block[3] = &unk_2652070B0;
  id v12 = v4;
  os_signpost_id_t v13 = v6;
  void block[4] = self;
  id v10 = v4;
  dispatch_async_and_wait(serviceQueue, block);
}

uint64_t __33__ARServer_serviceDidInvalidate___block_invoke(uint64_t a1)
{
  uint64_t v2 = _ARLogDaemon_4();
  BOOL v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)os_signpost_id_t v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_24719A000, v3, OS_SIGNPOST_INTERVAL_END, v4, "TransitionQueueDelaySync", (const char *)&unk_2471AB592, v6, 2u);
  }

  return [*(id *)(a1 + 32) _removeService:*(void *)(a1 + 40)];
}

- (void)serviceDidInterrupt:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serviceQueue);
  BOOL v5 = _ARLogDaemon_4();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  BOOL v7 = _ARLogDaemon_4();
  unint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v4;
    _os_signpost_emit_with_name_impl(&dword_24719A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "TransitionQueueDelaySync", "service interrupted %{public}@", buf, 0xCu);
  }

  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__ARServer_serviceDidInterrupt___block_invoke;
  block[3] = &unk_2652070B0;
  id v12 = v4;
  os_signpost_id_t v13 = v6;
  void block[4] = self;
  id v10 = v4;
  dispatch_async_and_wait(serviceQueue, block);
}

uint64_t __32__ARServer_serviceDidInterrupt___block_invoke(uint64_t a1)
{
  uint64_t v2 = _ARLogDaemon_4();
  BOOL v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)os_signpost_id_t v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_24719A000, v3, OS_SIGNPOST_INTERVAL_END, v4, "TransitionQueueDelaySync", (const char *)&unk_2471AB592, v6, 2u);
  }

  return [*(id *)(a1 + 32) _removeService:*(void *)(a1 + 40)];
}

- (void)_logDaemonStatus
{
  statusLogger = self->_statusLogger;
  id v6 = [(ARServer *)self statusDictionaryWithWaitEndOfTransition:0];
  os_signpost_id_t v4 = [MEMORY[0x263F08AB0] processInfo];
  BOOL v5 = [v4 processName];
  [(ARDaemonStatusLogger *)statusLogger logStatusUpdateWithDictionary:v6 forServerObject:self andProcessName:v5];
}

- (void)_setupHealthReportLogTimer
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_healthReportLogTimer)
  {
    BOOL v3 = _ARLogGeneral_1();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      return;
    }
    os_signpost_id_t v4 = (objc_class *)objc_opt_class();
    BOOL v5 = NSStringFromClass(v4);
    int v13 = 138543618;
    uint64_t v14 = v5;
    __int16 v15 = 2048;
    uint64_t v16 = self;
    id v6 = "%{public}@ <%p>: Timer already exists.";
LABEL_4:
    _os_log_impl(&dword_24719A000, v3, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v13, 0x16u);

    goto LABEL_5;
  }
  ARCreateNonFixedPriorityDispatchQueue();
  BOOL v7 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  healthReportLogQueue = self->_healthReportLogQueue;
  self->_healthReportLogQueue = v7;

  __int16 v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 1uLL, (dispatch_queue_t)self->_healthReportLogQueue);
  healthReportLogTimer = self->_healthReportLogTimer;
  self->_healthReportLogTimer = v9;

  uint64_t v11 = self->_healthReportLogTimer;
  if (!v11)
  {
    BOOL v3 = _ARLogGeneral_1();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    id v12 = (objc_class *)objc_opt_class();
    BOOL v5 = NSStringFromClass(v12);
    int v13 = 138543618;
    uint64_t v14 = v5;
    __int16 v15 = 2048;
    uint64_t v16 = self;
    id v6 = "%{public}@ <%p>: Could not create timer";
    goto LABEL_4;
  }
  dispatch_source_set_timer(v11, 0, 0xDF8475800uLL, 0);
  objc_initWeak((id *)&v13, self);
  dispatch_source_set_event_handler((dispatch_source_t)self->_healthReportLogTimer, &__block_literal_global_113);
  dispatch_activate((dispatch_object_t)self->_healthReportLogTimer);
  objc_destroyWeak((id *)&v13);
}

- (ARAlgorithmConfiguration)currentConfiguration
{
  return (ARAlgorithmConfiguration *)objc_getProperty(self, a2, 152, 1);
}

- (void)setCurrentConfiguration:(id)a3
{
}

- (NSArray)servicesBeingAdded
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setServicesBeingAdded:(id)a3
{
}

- (ARDaemonService)serviceBeingRemoved
{
  return (ARDaemonService *)objc_getProperty(self, a2, 168, 1);
}

- (void)setServiceBeingRemoved:(id)a3
{
}

- (BOOL)isKeybagUnlocked
{
  return self->_isKeybagUnlocked;
}

- (void)setIsKeybagUnlocked:(BOOL)a3
{
  self->_isKeybagUnlocked = a3;
}

- (ARUserProfile)userProfile
{
  return self->_userProfile;
}

- (void)setUserProfile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userProfile, 0);
  objc_storeStrong((id *)&self->_serviceBeingRemoved, 0);
  objc_storeStrong((id *)&self->_servicesBeingAdded, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_statusLogger, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_spawnTime, 0);
  objc_storeStrong((id *)&self->_healthReportLogTimer, 0);
  objc_storeStrong((id *)&self->_healthReportLogQueue, 0);
  objc_storeStrong((id *)&self->_controlListener, 0);
  objc_storeStrong((id *)&self->_batchedServicesConfiguredSemaphore, 0);
  objc_storeStrong((id *)&self->_batchedServices, 0);
  objc_storeStrong((id *)&self->_latestTaskErrorMap, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_servicesByPID, 0);
  objc_storeStrong((id *)&self->_servicesByClass, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_daemonConfiguration, 0);
}

@end