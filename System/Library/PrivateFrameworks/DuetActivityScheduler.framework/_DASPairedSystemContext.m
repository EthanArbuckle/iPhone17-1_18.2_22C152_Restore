@interface _DASPairedSystemContext
+ (id)contextWithClientIdentifier:(id)a3 callbackQueue:(id)a4 systemConditionChangeCallback:(id)a5 trafficCancelationHandler:(id)a6;
+ (id)stringForPriority:(unint64_t)a3;
+ (id)stringForThermalLevel:(int)a3;
+ (void)initialize;
- (BOOL)allowSyncTrafficForRecentlyBackgroundedApp;
- (BOOL)allowsSendingTrafficeForServiceIdentifiers:(id)a3 atPriorityLevel:(unint64_t)a4 isReunionOrInitialSync:(BOOL)a5 responseValidityDuration:(double *)a6;
- (BOOL)batteryLevelsAllowSendingTrafficeForServiceIdentifiers:(id)a3 atPriorityLevel:(unint64_t)a4;
- (BOOL)didHandleExclusiveAppChange;
- (BOOL)foregroundApplicationsAllowSendingTrafficForServiceIdentifiers:(id)a3 atPriorityLevel:(unint64_t)a4 furtherChecksNecessary:(BOOL *)a5;
- (BOOL)isAnyThirdPartyApp:(id)a3;
- (BOOL)isWatchPluggedIn;
- (BOOL)previousPluginStatus;
- (BOOL)shouldBypassApplicationUsage:(id)a3;
- (BOOL)thermalLevelsAllowSendingTrafficeForServiceIdentifiers:(id)a3 atPriorityLevel:(unint64_t)a4;
- (BOOL)thirdPartyAppPolicyAllowsSendingTrafficForServiceIdentifiers:(id)a3 atPriorityLevel:(unint64_t)a4 furtherChecksNecessary:(BOOL *)a5;
- (NSArray)previousExclusiveIdentifiers;
- (NSDictionary)remoteAppLaunchCount;
- (NSMutableDictionary)launchedAppCount;
- (NSMutableDictionary)recentlyBackgroundedApps;
- (NSMutableDictionary)watchKitAppStatus;
- (NSMutableSet)previousForegroundApps;
- (NSString)foregroundWatchApp;
- (NSString)identifier;
- (NSUserDefaults)persistence;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)handlerQueue;
- (OS_dispatch_source)appUsageRefreshTimer;
- (OS_os_log)log;
- (_CDContext)context;
- (_DASPairedSystemContext)initWithClientIdentifier:(id)a3 context:(id)a4 knowledgeStore:(id)a5 callbackQueue:(id)a6 systemConditionChangeCallback:(id)a7 trafficCancelationHander:(id)a8;
- (_DKKnowledgeQuerying)knowledgeStore;
- (double)previousBatteryLevel;
- (double)previousDefaultThreshold;
- (double)previousSyncThreshold;
- (double)usageLikelihoodForApplication:(id)a3;
- (double)usageThresholdForPriority:(unint64_t)a3 batteryLevel:(int)a4 isPluggedIn:(BOOL)a5;
- (id)onApplicationStateChange;
- (id)onConditionsChange;
- (id)pairedDeviceStream;
- (int)previousMaxThermalPressure;
- (int)recentTrafficSyncRequests;
- (int)remoteForecastDeletionToken;
- (int)watchBatteryLevel;
- (void)deleteRemoteHistogram;
- (void)handleAppStateChange;
- (void)handleConditionChange;
- (void)handleWatchAppBackgrounded;
- (void)readBudgetForRecentlyBackgroundedAppSyncTraffic;
- (void)registerForContextChanges;
- (void)resetBudgetForRecentlyBackgroundedAppSyncTraffic;
- (void)setAppUsageRefreshTimer:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setContext:(id)a3;
- (void)setForegroundWatchApp:(id)a3;
- (void)setHandlerQueue:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setKnowledgeStore:(id)a3;
- (void)setLaunchedAppCount:(id)a3;
- (void)setLog:(id)a3;
- (void)setOnApplicationStateChange:(id)a3;
- (void)setOnConditionsChange:(id)a3;
- (void)setPersistence:(id)a3;
- (void)setPreviousBatteryLevel:(double)a3;
- (void)setPreviousDefaultThreshold:(double)a3;
- (void)setPreviousExclusiveIdentifiers:(id)a3;
- (void)setPreviousForegroundApps:(id)a3;
- (void)setPreviousMaxThermalPressure:(int)a3;
- (void)setPreviousPluginStatus:(BOOL)a3;
- (void)setPreviousSyncThreshold:(double)a3;
- (void)setRecentTrafficSyncRequests:(int)a3;
- (void)setRecentlyBackgroundedApps:(id)a3;
- (void)setRemoteAppLaunchCount:(id)a3;
- (void)setRemoteForecastDeletionToken:(int)a3;
- (void)setWatchKitAppStatus:(id)a3;
- (void)setWatchKitStatus:(BOOL)a3 forApplication:(id)a4;
- (void)updateAppUsageHistory;
@end

@implementation _DASPairedSystemContext

- (void)handleConditionChange
{
  context = self->_context;
  v4 = [MEMORY[0x1E4F5B6B0] keyPathForThermalPressureLevel];
  v5 = [(_CDContext *)context objectForKeyedSubscript:v4];
  int v6 = [v5 intValue];

  v7 = self->_context;
  v8 = [MEMORY[0x1E4F5B6B0] keyPathForDefaultPairedDeviceThermalPressureLevel];
  v9 = [(_CDContext *)v7 objectForKeyedSubscript:v8];
  int v10 = [v9 intValue];

  if (v6 <= v10) {
    int v6 = v10;
  }
  BOOL v11 = [(_DASPairedSystemContext *)self isWatchPluggedIn];
  uint64_t v12 = [(_DASPairedSystemContext *)self watchBatteryLevel];
  [(_DASPairedSystemContext *)self usageThresholdForPriority:50 batteryLevel:v12 isPluggedIn:v11];
  double v14 = v13;
  [(_DASPairedSystemContext *)self usageThresholdForPriority:10 batteryLevel:v12 isPluggedIn:v11];
  double v16 = v15;
  if (v6 < self->_previousMaxThermalPressure
    || v14 < self->_previousDefaultThreshold
    || v15 < self->_previousSyncThreshold)
  {
    callbackQueue = self->_callbackQueue;
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __48___DASPairedSystemContext_handleConditionChange__block_invoke;
    v29 = &unk_1E6112A70;
    v30 = self;
    p_uint64_t block = &block;
LABEL_7:
    dispatch_async(callbackQueue, p_block);
    goto LABEL_8;
  }
  if (!self->_previousPluginStatus && v11)
  {
    callbackQueue = self->_callbackQueue;
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __48___DASPairedSystemContext_handleConditionChange__block_invoke_2;
    v24 = &unk_1E6112A70;
    v25 = self;
    p_uint64_t block = &v21;
    goto LABEL_7;
  }
LABEL_8:
  self->_previousMaxThermalPressure = v6;
  self->_previousDefaultThreshold = v14;
  self->_previousSyncThreshold = v16;
  char v19 = !v11;
  if ((int)v12 < 91) {
    char v19 = 1;
  }
  if ((v19 & 1) == 0 && (!self->_previousPluginStatus || self->_previousBatteryLevel <= 90.0)) {
    [(_DASPairedSystemContext *)self resetBudgetForRecentlyBackgroundedAppSyncTraffic];
  }
  self->_previousPluginStatus = v11;
  self->_previousBatteryLevel = (double)(int)v12;
}

- (double)usageThresholdForPriority:(unint64_t)a3 batteryLevel:(int)a4 isPluggedIn:(BOOL)a5
{
  double result = 10.0;
  double v6 = 0.0;
  BOOL v7 = a4 >= 0x28 || a3 >= 0x32;
  double v8 = 2.22507386e-308;
  if (!v7) {
    double v8 = 10.0;
  }
  if (a5) {
    double v8 = 0.0;
  }
  if (a4 <= 0x5E) {
    double v6 = v8;
  }
  if (a4 >= 10) {
    return v6;
  }
  return result;
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (BOOL)didHandleExclusiveAppChange
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  context = self->_context;
  v5 = [MEMORY[0x1E4F5B6B0] keyPathForDefaultPairedDeviceForegroundApp];
  double v6 = [(_CDContext *)context objectForKeyedSubscript:v5];

  BOOL v7 = self->_context;
  double v8 = [MEMORY[0x1E4F5B6B0] keyPathForDefaultPairedServicesAppearingForeground];
  v9 = [(_CDContext *)v7 objectForKeyedSubscript:v8];

  if (v6) {
    [v3 addObject:v6];
  }
  if (v9) {
    [v3 addObjectsFromArray:v9];
  }
  int v10 = [(_DASPairedSystemContext *)self previousExclusiveIdentifiers];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v3;
  callbackQueue = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (callbackQueue)
  {
    char v19 = v6;
    id v13 = 0;
    uint64_t v14 = *(void *)v24;
    while (2)
    {
      double v15 = 0;
      double v16 = v13;
      do
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend((id)kExclusiveApps, "objectForKeyedSubscript:", *(void *)(*((void *)&v23 + 1) + 8 * (void)v15), v19);
        id v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 && ([v10 isEqualToArray:v13] & 1) == 0)
        {
          callbackQueue = self->_callbackQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __54___DASPairedSystemContext_didHandleExclusiveAppChange__block_invoke;
          block[3] = &unk_1E6112B60;
          block[4] = self;
          id v13 = v13;
          id v22 = v13;
          dispatch_async(callbackQueue, block);

          LOBYTE(callbackQueue) = 1;
          goto LABEL_16;
        }
        double v15 = ((char *)v15 + 1);
        double v16 = v13;
      }
      while (callbackQueue != v15);
      callbackQueue = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (callbackQueue) {
        continue;
      }
      break;
    }
LABEL_16:
    double v6 = v19;
  }
  else
  {
    id v13 = 0;
  }

  if ([v10 count] && !objc_msgSend(v13, "count"))
  {
    v17 = self->_callbackQueue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __54___DASPairedSystemContext_didHandleExclusiveAppChange__block_invoke_2;
    v20[3] = &unk_1E6112A70;
    v20[4] = self;
    dispatch_async(v17, v20);
    LOBYTE(callbackQueue) = 1;
  }
  [(_DASPairedSystemContext *)self setPreviousExclusiveIdentifiers:v13];

  return (char)callbackQueue;
}

- (void)setPreviousExclusiveIdentifiers:(id)a3
{
}

- (NSArray)previousExclusiveIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)handleAppStateChange
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  [(_DASPairedSystemContext *)self handleWatchAppBackgrounded];
  BOOL v3 = [(_DASPairedSystemContext *)self didHandleExclusiveAppChange];
  v4 = [MEMORY[0x1E4F1CA80] set];
  context = self->_context;
  double v6 = [MEMORY[0x1E4F5B6B0] keyPathForForegroundApp];
  BOOL v7 = [(_CDContext *)context objectForKeyedSubscript:v6];

  if (v7)
  {
    if ([(id)kAlwaysAllowedPhoneApps containsObject:v7])
    {
      [v4 addObject:v7];
    }
    else
    {

      BOOL v7 = 0;
    }
  }
  double v8 = self->_context;
  v9 = [MEMORY[0x1E4F5B6B0] keyPathForDefaultPairedDeviceForegroundApp];
  int v10 = [(_CDContext *)v8 objectForKeyedSubscript:v9];

  if (v10) {
    [v4 addObject:v10];
  }
  id v11 = self->_context;
  uint64_t v12 = [MEMORY[0x1E4F5B6B0] keyPathForServicesAppearingForeground];
  id v13 = [(_CDContext *)v11 objectForKeyedSubscript:v12];

  if (v13) {
    [v4 addObjectsFromArray:v13];
  }
  uint64_t v14 = self->_context;
  double v15 = [MEMORY[0x1E4F5B6B0] keyPathForDefaultPairedServicesAppearingForeground];
  double v16 = [(_CDContext *)v14 objectForKeyedSubscript:v15];

  if (v16) {
    [v4 addObjectsFromArray:v16];
  }
  v17 = self->_context;
  v18 = [MEMORY[0x1E4F5B6B0] keyPathForActiveComplications];
  char v19 = [(_CDContext *)v17 objectForKeyedSubscript:v18];

  if (v19) {
    [v4 addObjectsFromArray:v19];
  }
  v20 = self->_previousForegroundApps;
  objc_sync_enter(v20);
  if ((([(NSMutableSet *)self->_previousForegroundApps isEqual:v4] | v3) & 1) == 0)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
    v30 = v19;
    v31 = v16;
    v32 = v7;
    v33 = v10;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v22 = v4;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v37 != v24) {
            objc_enumerationMutation(v22);
          }
          uint64_t v26 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          if ((-[NSMutableSet containsObject:](self->_previousForegroundApps, "containsObject:", v26, v30, v31, v32) & 1) == 0
            && ([(id)kIgnoredApps containsObject:v26] & 1) == 0)
          {
            [v21 addObject:v26];
          }
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v23);
    }

    BOOL v7 = v32;
    int v10 = v33;
    char v19 = v30;
    double v16 = v31;
    if ([v21 count])
    {
      uint64_t v27 = (void *)[v21 copy];
      callbackQueue = self->_callbackQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47___DASPairedSystemContext_handleAppStateChange__block_invoke;
      block[3] = &unk_1E6112B60;
      block[4] = self;
      id v35 = v27;
      id v29 = v27;
      dispatch_async(callbackQueue, block);

      int v10 = v33;
    }
    [(NSMutableSet *)self->_previousForegroundApps removeAllObjects];
    [(NSMutableSet *)self->_previousForegroundApps unionSet:v22];
  }
  objc_sync_exit(v20);
}

- (void)handleWatchAppBackgrounded
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  context = self->_context;
  v4 = [MEMORY[0x1E4F5B6B0] keyPathForDefaultPairedDeviceForegroundApp];
  v5 = [(_CDContext *)context objectForKeyedSubscript:v4];

  double v6 = [(_DASPairedSystemContext *)self foregroundWatchApp];
  BOOL v7 = [MEMORY[0x1E4F1C9C8] date];
  if (v6 && (!v5 || ([v5 isEqualToString:v6] & 1) == 0))
  {
    double v8 = self->_recentlyBackgroundedApps;
    objc_sync_enter(v8);
    if ((unint64_t)[(NSMutableDictionary *)self->_recentlyBackgroundedApps count] >= 0xA)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v23 = 0x3032000000;
      uint64_t v24 = __Block_byref_object_copy_;
      long long v25 = __Block_byref_object_dispose_;
      id v26 = v7;
      uint64_t v16 = 0;
      v17 = &v16;
      uint64_t v18 = 0x3032000000;
      char v19 = __Block_byref_object_copy_;
      v20 = __Block_byref_object_dispose_;
      id v21 = 0;
      recentlyBackgroundedApps = self->_recentlyBackgroundedApps;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __53___DASPairedSystemContext_handleWatchAppBackgrounded__block_invoke;
      v12[3] = &unk_1E6112B38;
      id v13 = v26;
      uint64_t v14 = &v16;
      p_long long buf = &buf;
      [(NSMutableDictionary *)recentlyBackgroundedApps enumerateKeysAndObjectsUsingBlock:v12];
      if (v17[5]) {
        -[NSMutableDictionary removeObjectForKey:](self->_recentlyBackgroundedApps, "removeObjectForKey:");
      }

      _Block_object_dispose(&v16, 8);
      _Block_object_dispose(&buf, 8);
    }
    [(NSMutableDictionary *)self->_recentlyBackgroundedApps setObject:v7 forKeyedSubscript:v6];
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      id v11 = self->_recentlyBackgroundedApps;
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1B578B000, log, OS_LOG_TYPE_INFO, "Recently backgrounded apps: %@", (uint8_t *)&buf, 0xCu);
    }
    objc_sync_exit(v8);
  }
  [(_DASPairedSystemContext *)self setForegroundWatchApp:v5];
}

- (void)setForegroundWatchApp:(id)a3
{
}

- (NSString)foregroundWatchApp
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (id)onConditionsChange
{
  return self->_onConditionsChange;
}

- (int)watchBatteryLevel
{
  context = self->_context;
  BOOL v3 = [MEMORY[0x1E4F5B6B0] keyPathForDefaultPairedDeviceBatteryLevel];
  v4 = [(_CDContext *)context objectForKeyedSubscript:v3];

  if (v4) {
    int v5 = [v4 intValue];
  }
  else {
    int v5 = 100;
  }

  return v5;
}

- (BOOL)isWatchPluggedIn
{
  context = self->_context;
  BOOL v3 = [MEMORY[0x1E4F5B6B0] keyPathForDefaultPairedDevicePluginStatus];
  v4 = [(_CDContext *)context objectForKeyedSubscript:v3];
  char v5 = [v4 BOOLValue];

  return v5;
}

+ (void)initialize
{
  v2 = (void *)kExclusiveApps;
  kExclusiveApps = (uint64_t)&unk_1F0E6EBD8;

  uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0E6EB78];
  v4 = (void *)kAlwaysAllowedPhoneApps;
  kAlwaysAllowedPhoneApps = v3;

  uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0E6EB90];
  double v6 = (void *)kIgnoredApps;
  kIgnoredApps = v5;

  kUsageIgnoredApps = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0E6EBA8];

  MEMORY[0x1F41817F8]();
}

- (_DASPairedSystemContext)initWithClientIdentifier:(id)a3 context:(id)a4 knowledgeStore:(id)a5 callbackQueue:(id)a6 systemConditionChangeCallback:(id)a7 trafficCancelationHander:(id)a8
{
  id v52 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v57.receiver = self;
  v57.super_class = (Class)_DASPairedSystemContext;
  id v20 = [(_DASPairedSystemContext *)&v57 init];
  if (v20)
  {
    os_log_t v21 = os_log_create("com.apple.dass", "pairedsystemcontext");
    id v22 = (void *)*((void *)v20 + 22);
    *((void *)v20 + 22) = v21;

    objc_storeStrong((id *)v20 + 6, a3);
    objc_storeStrong((id *)v20 + 3, a4);
    uint64_t v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v24 = dispatch_queue_create("com.apple.daspairedsystemcontext.handlerQueue", v23);
    long long v25 = (void *)*((void *)v20 + 4);
    *((void *)v20 + 4) = v24;

    objc_storeStrong((id *)v20 + 5, a5);
    uint64_t v26 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v27 = (void *)*((void *)v20 + 7);
    *((void *)v20 + 7) = v26;

    if (v17)
    {
      id v28 = v17;
      id v29 = *((void *)v20 + 8);
      *((void *)v20 + 8) = v28;
    }
    else
    {
      id v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v30 = dispatch_queue_create("com.apple.daspairedsystemcontext.callbackQueue", v29);
      v31 = (void *)*((void *)v20 + 8);
      *((void *)v20 + 8) = v30;
    }
    uint64_t v32 = MEMORY[0x1BA99F7F0](v18);
    v33 = (void *)*((void *)v20 + 9);
    *((void *)v20 + 9) = v32;

    uint64_t v34 = MEMORY[0x1BA99F7F0](v19);
    id v35 = (void *)*((void *)v20 + 10);
    *((void *)v20 + 10) = v34;

    uint64_t v36 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v37 = (void *)*((void *)v20 + 14);
    *((void *)v20 + 14) = v36;

    uint64_t v38 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v39 = (void *)*((void *)v20 + 16);
    *((void *)v20 + 16) = v38;

    [v20 readBudgetForRecentlyBackgroundedAppSyncTraffic];
    uint64_t v40 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v41 = (void *)*((void *)v20 + 18);
    *((void *)v20 + 18) = v40;

    v42 = dispatch_get_global_queue(-32768, 0);
    dispatch_source_t v43 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v42);
    v44 = (void *)*((void *)v20 + 21);
    *((void *)v20 + 21) = v43;

    v45 = *((void *)v20 + 21);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __144___DASPairedSystemContext_initWithClientIdentifier_context_knowledgeStore_callbackQueue_systemConditionChangeCallback_trafficCancelationHander___block_invoke;
    block[3] = &unk_1E6112A70;
    v46 = (int *)v20;
    v56 = v46;
    dispatch_block_t v47 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
    dispatch_source_set_event_handler(v45, v47);

    v48 = *((void *)v20 + 21);
    dispatch_time_t v49 = dispatch_walltime(0, 0);
    dispatch_source_set_timer(v48, v49, 0x34630B8A000uLL, 0xD18C2E2800uLL);
    dispatch_activate(*((dispatch_object_t *)v20 + 21));
    [v46 updateAppUsageHistory];
    [v46 registerForContextChanges];
    v50 = (const char *)[@"com.apple.dasd.pairedsystemcontext.deleteremoteforecast" UTF8String];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __144___DASPairedSystemContext_initWithClientIdentifier_context_knowledgeStore_callbackQueue_systemConditionChangeCallback_trafficCancelationHander___block_invoke_2;
    handler[3] = &unk_1E6112A98;
    v54 = v46;
    notify_register_dispatch(v50, v46 + 5, v42, handler);
  }
  return (_DASPairedSystemContext *)v20;
}

+ (id)contextWithClientIdentifier:(id)a3 callbackQueue:(id)a4 systemConditionChangeCallback:(id)a5 trafficCancelationHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __125___DASPairedSystemContext_contextWithClientIdentifier_callbackQueue_systemConditionChangeCallback_trafficCancelationHandler___block_invoke;
  block[3] = &unk_1E6112AC0;
  id v25 = v13;
  id v26 = a1;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  uint64_t v14 = contextWithClientIdentifier_callbackQueue_systemConditionChangeCallback_trafficCancelationHandler__onceToken;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  if (v14 != -1) {
    dispatch_once(&contextWithClientIdentifier_callbackQueue_systemConditionChangeCallback_trafficCancelationHandler__onceToken, block);
  }
  id v19 = (id)contextWithClientIdentifier_callbackQueue_systemConditionChangeCallback_trafficCancelationHandler__pairedSystemContext;

  return v19;
}

+ (id)stringForPriority:(unint64_t)a3
{
  uint64_t v3 = @"Sync";
  if (a3 > 0x31) {
    uint64_t v3 = @"Default";
  }
  if (a3 <= 0x59) {
    return v3;
  }
  else {
    return @"Urgent";
  }
}

+ (id)stringForThermalLevel:(int)a3
{
  if (a3 > 29)
  {
    switch(a3)
    {
      case 30:
        v4 = @"Heavy";
        break;
      case 40:
        v4 = @"Trapping";
        break;
      case 50:
        v4 = @"Sleeping";
        break;
      default:
LABEL_26:
        objc_msgSend(NSString, "stringWithFormat:", @"%u", *(void *)&a3);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
    }
  }
  else if (a3)
  {
    if (a3 != 10)
    {
      if (a3 == 20)
      {
        v4 = @"@Moderate";
        return v4;
      }
      goto LABEL_26;
    }
    v4 = @"Light";
  }
  else
  {
    v4 = @"Nominal";
  }
  return v4;
}

- (void)registerForContextChanges
{
  v33[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F5B6B0] keyPathForPluginStatus];
  v33[0] = v3;
  v4 = [MEMORY[0x1E4F5B6B0] keyPathForBatteryLevel];
  v33[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F5B6B0] keyPathForThermalPressureLevel];
  v33[2] = v5;
  double v6 = [MEMORY[0x1E4F5B6B0] keyPathForDefaultPairedDevicePluginStatus];
  v33[3] = v6;
  BOOL v7 = [MEMORY[0x1E4F5B6B0] keyPathForDefaultPairedDeviceBatteryLevel];
  v33[4] = v7;
  double v8 = [MEMORY[0x1E4F5B6B0] keyPathForDefaultPairedDeviceThermalPressureLevel];
  v33[5] = v8;
  id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:6];

  uint64_t v27 = [MEMORY[0x1E4F5B6F0] predicateForChangeAtKeyPaths:v28];
  id v26 = [NSString stringWithFormat:@"%@.system.pairedSystemContext", self->_identifier];
  identifier = self->_identifier;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __52___DASPairedSystemContext_registerForContextChanges__block_invoke;
  v31[3] = &unk_1E6112AE8;
  v31[4] = self;
  id v25 = [MEMORY[0x1E4F5B6D0] localNonWakingRegistrationWithIdentifier:v26 contextualPredicate:v27 clientIdentifier:identifier callback:v31];
  [(_CDContext *)self->_context registerCallback:v25];
  self->_previousPluginStatus = [(_DASPairedSystemContext *)self isWatchPluggedIn];
  self->_previousBatteryLevel = (double)[(_DASPairedSystemContext *)self watchBatteryLevel];
  id v10 = [MEMORY[0x1E4F5B6B0] keyPathForDefaultPairedDeviceForegroundApp];
  v32[0] = v10;
  id v11 = [MEMORY[0x1E4F5B6B0] keyPathForServicesAppearingForeground];
  v32[1] = v11;
  id v12 = [MEMORY[0x1E4F5B6B0] keyPathForDefaultPairedServicesAppearingForeground];
  v32[2] = v12;
  id v13 = [MEMORY[0x1E4F5B6B0] keyPathForActiveComplications];
  v32[3] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];

  id v15 = [MEMORY[0x1E4F5B6F0] predicateForChangeAtKeyPaths:v14];
  id v16 = [NSString stringWithFormat:@"%@.apps.pairedSystemContext", self->_identifier];
  id v17 = self->_identifier;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __52___DASPairedSystemContext_registerForContextChanges__block_invoke_3;
  v30[3] = &unk_1E6112AE8;
  v30[4] = self;
  id v18 = [MEMORY[0x1E4F5B6D0] localNonWakingRegistrationWithIdentifier:v16 contextualPredicate:v15 clientIdentifier:v17 callback:v30];
  [(_CDContext *)self->_context registerCallback:v18];
  id v19 = (void *)MEMORY[0x1E4F5B6F0];
  id v20 = [MEMORY[0x1E4F5B6B0] keyPathForForegroundApp];
  os_log_t v21 = [MEMORY[0x1E4F5B6B0] keyPathForForegroundApp];
  id v22 = [v19 predicateForKeyPath:v20, @"self.%@.value in %@", v21, kAlwaysAllowedPhoneApps withFormat];

  id v23 = [NSString stringWithFormat:@"%@.alwaysAllowedApps.pairedsystemContext", self->_identifier];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __52___DASPairedSystemContext_registerForContextChanges__block_invoke_5;
  v29[3] = &unk_1E6112B10;
  v29[4] = self;
  id v24 = [MEMORY[0x1E4F5B6D0] localNonWakingRegistrationWithIdentifier:v23 contextualPredicate:v22 callback:v29];
  [(_CDContext *)self->_context registerCallback:v24];
}

- (BOOL)allowsSendingTrafficeForServiceIdentifiers:(id)a3 atPriorityLevel:(unint64_t)a4 isReunionOrInitialSync:(BOOL)a5 responseValidityDuration:(double *)a6
{
  BOOL v7 = a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (a6) {
    *a6 = 900.0;
  }
  if (a4 > 0x59 || v7)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = log;
      id v15 = +[_DASPairedSystemContext stringForPriority:a4];
      *(_DWORD *)long long buf = 138412802;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v15;
      __int16 v27 = 1024;
      BOOL v28 = v7;
      id v16 = "ALLOWED: %@, Priority=%@, Is Reunion/Initial Sync: %u";
      id v17 = v14;
      uint32_t v18 = 28;
      goto LABEL_13;
    }
LABEL_14:
    BOOL v20 = 1;
    goto LABEL_17;
  }
  char v22 = 0;
  BOOL v11 = [(_DASPairedSystemContext *)self foregroundApplicationsAllowSendingTrafficForServiceIdentifiers:v10 atPriorityLevel:a4 furtherChecksNecessary:&v22];
  if (!v22)
  {
    BOOL v20 = v11;
    goto LABEL_17;
  }
  if (![(_DASPairedSystemContext *)self thermalLevelsAllowSendingTrafficeForServiceIdentifiers:v10 atPriorityLevel:a4])
  {
LABEL_15:
    BOOL v20 = 0;
    goto LABEL_17;
  }
  BOOL v12 = [(_DASPairedSystemContext *)self thirdPartyAppPolicyAllowsSendingTrafficForServiceIdentifiers:v10 atPriorityLevel:a4 furtherChecksNecessary:&v22];
  if (v22)
  {
    if ([(_DASPairedSystemContext *)self batteryLevelsAllowSendingTrafficeForServiceIdentifiers:v10 atPriorityLevel:a4])
    {
      id v13 = self->_log;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = v13;
        id v15 = +[_DASPairedSystemContext stringForPriority:a4];
        *(_DWORD *)long long buf = 138412546;
        id v24 = v10;
        __int16 v25 = 2112;
        id v26 = v15;
        id v16 = "ALLOWED: %@, Priority=%@";
        id v17 = v14;
        uint32_t v18 = 22;
LABEL_13:
        _os_log_impl(&dword_1B578B000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);

        goto LABEL_14;
      }
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  BOOL v20 = v12;
  if (a6) {
    *a6 = 120.0;
  }
LABEL_17:

  return v20;
}

- (BOOL)foregroundApplicationsAllowSendingTrafficForServiceIdentifiers:(id)a3 atPriorityLevel:(unint64_t)a4 furtherChecksNecessary:(BOOL *)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v48 = a5;
  *a5 = 0;
  double v8 = [MEMORY[0x1E4F1CA48] array];
  context = self->_context;
  id v10 = [MEMORY[0x1E4F5B6B0] keyPathForDefaultPairedDeviceForegroundApp];
  BOOL v11 = [(_CDContext *)context objectForKeyedSubscript:v10];

  BOOL v12 = self->_context;
  id v13 = [MEMORY[0x1E4F5B6B0] keyPathForForegroundApp];
  uint64_t v14 = [(_CDContext *)v12 objectForKeyedSubscript:v13];

  if (v11) {
    [v8 addObject:v11];
  }
  if (v14)
  {
    if ([(id)kAlwaysAllowedPhoneApps containsObject:v14])
    {
      [v8 addObject:v14];
    }
    else
    {

      uint64_t v14 = 0;
    }
  }
  id v15 = self->_context;
  id v16 = [MEMORY[0x1E4F5B6B0] keyPathForServicesAppearingForeground];
  id v17 = [(_CDContext *)v15 objectForKeyedSubscript:v16];

  uint32_t v18 = [MEMORY[0x1E4F1C978] array:v17 withItemsIn:kAlwaysAllowedPhoneApps];

  if (v18) {
    [v8 addObjectsFromArray:v18];
  }
  id v19 = self->_context;
  BOOL v20 = [MEMORY[0x1E4F5B6B0] keyPathForDefaultPairedServicesAppearingForeground];
  os_log_t v21 = [(_CDContext *)v19 objectForKeyedSubscript:v20];

  if (v21) {
    [v8 addObjectsFromArray:v21];
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = log;
    id v24 = +[_DASPairedSystemContext stringForPriority:a4];
    *(_DWORD *)long long buf = 138413570;
    id v58 = v7;
    __int16 v59 = 2112;
    v60 = v24;
    __int16 v61 = 2112;
    v62 = v14;
    __int16 v63 = 2112;
    v64 = v11;
    __int16 v65 = 2112;
    v66 = v18;
    __int16 v67 = 2112;
    v68 = v21;
    _os_log_impl(&dword_1B578B000, v23, OS_LOG_TYPE_DEFAULT, "CHECKING: %@, Priority=%@, Phone Foreground: %@, Watch Foreground: %@, Foreground Services: %@, Remote Foreground Services: %@", buf, 0x3Eu);
  }
  if (a4 >= 0x32
    && (([v7 containsObject:v14] & 1) != 0
     || v18 && [v18 anyItemsIntersectArray:v7]))
  {
    __int16 v25 = self->_log;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = v25;
      +[_DASPairedSystemContext stringForPriority:a4];
      v28 = __int16 v27 = v11;
      *(_DWORD *)long long buf = 138413314;
      id v58 = v7;
      __int16 v59 = 2112;
      v60 = v28;
      __int16 v61 = 2112;
      v62 = v14;
      __int16 v63 = 2112;
      v64 = v18;
      __int16 v65 = 2112;
      v66 = v21;
      _os_log_impl(&dword_1B578B000, v26, OS_LOG_TYPE_DEFAULT, "ALLOWED: %@, Priority=%@, Phone Foreground: %@, Foreground Services: %@, Remote Foreground Services: %@", buf, 0x34u);

      BOOL v11 = v27;
    }
    BOOL v29 = 1;
  }
  else
  {
    dispatch_time_t v49 = v11;
    v50 = v8;
    v51 = v7;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v30 = v8;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v53 objects:v71 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v54;
LABEL_22:
      uint64_t v34 = 0;
      while (1)
      {
        if (*(void *)v54 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = [(id)kExclusiveApps objectForKeyedSubscript:*(void *)(*((void *)&v53 + 1) + 8 * v34)];
        if (v35) {
          break;
        }
        if (v32 == ++v34)
        {
          uint64_t v32 = [v30 countByEnumeratingWithState:&v53 objects:v71 count:16];
          if (v32) {
            goto LABEL_22;
          }
          goto LABEL_28;
        }
      }
      uint64_t v38 = (void *)v35;

      id v7 = v51;
      if (a4 >= 0x32 && [v51 anyItemsIntersectArray:v38])
      {
        v42 = self->_log;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v40 = v42;
          dispatch_source_t v43 = +[_DASPairedSystemContext stringForPriority:a4];
          *(_DWORD *)long long buf = 138413314;
          id v58 = v51;
          __int16 v59 = 2112;
          v60 = v43;
          __int16 v61 = 2112;
          v62 = v14;
          __int16 v63 = 2112;
          v64 = v49;
          __int16 v65 = 2112;
          v66 = v18;
          _os_log_impl(&dword_1B578B000, v40, OS_LOG_TYPE_DEFAULT, "ALLOWED: %@, Priority=%@, Phone Foreground: %@, Watch Foreground: %@, Foreground Services: %@", buf, 0x34u);

          BOOL v11 = v49;
          goto LABEL_37;
        }
        BOOL v29 = 1;
      }
      else
      {
        v44 = self->_log;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          v45 = v44;
          v46 = +[_DASPairedSystemContext stringForPriority:a4];
          *(_DWORD *)long long buf = 138413314;
          id v58 = v51;
          __int16 v59 = 2112;
          v60 = v46;
          __int16 v61 = 2112;
          v62 = v14;
          __int16 v63 = 2112;
          v64 = v49;
          __int16 v65 = 2112;
          v66 = v18;
          _os_log_impl(&dword_1B578B000, v45, OS_LOG_TYPE_DEFAULT, "DENIED: %@, Priority=%@, Phone Foreground: %@, Watch Foreground: %@, Foreground Services: %@", buf, 0x34u);

          BOOL v11 = v49;
          BOOL v29 = 0;
          goto LABEL_45;
        }
        BOOL v29 = 0;
      }
      BOOL v11 = v49;
    }
    else
    {
LABEL_28:

      uint64_t v36 = self->_context;
      long long v37 = [MEMORY[0x1E4F5B6B0] keyPathForActiveComplications];
      uint64_t v38 = [(_CDContext *)v36 objectForKeyedSubscript:v37];

      if (v38) {
        [v30 addObjectsFromArray:v38];
      }
      id v7 = v51;
      BOOL v11 = v49;
      if ([v51 anyItemsIntersectArray:v30])
      {
        long long v39 = self->_log;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v40 = v39;
          uint64_t v41 = +[_DASPairedSystemContext stringForPriority:a4];
          *(_DWORD *)long long buf = 138413826;
          id v58 = v51;
          __int16 v59 = 2112;
          v60 = v41;
          __int16 v61 = 2112;
          v62 = v49;
          __int16 v63 = 2112;
          v64 = v14;
          __int16 v65 = 2112;
          v66 = v38;
          __int16 v67 = 2112;
          v68 = v18;
          __int16 v69 = 2112;
          v70 = v21;
          _os_log_impl(&dword_1B578B000, v40, OS_LOG_TYPE_DEFAULT, "ALLOWED: %@, Priority=%@, Watch Focal Application: %@, Phone Focal Application: %@, Active Complications: %@, Foreground Services: %@, Remote Services: %@,", buf, 0x48u);

          id v7 = v51;
LABEL_37:
        }
        BOOL v29 = 1;
      }
      else
      {
        BOOL v29 = 1;
        BOOL *v48 = 1;
      }
    }
LABEL_45:

    double v8 = v50;
  }

  return v29;
}

- (BOOL)thermalLevelsAllowSendingTrafficeForServiceIdentifiers:(id)a3 atPriorityLevel:(unint64_t)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  context = self->_context;
  double v8 = [MEMORY[0x1E4F5B6B0] keyPathForThermalPressureLevel];
  v9 = [(_CDContext *)context objectForKeyedSubscript:v8];
  uint64_t v10 = [v9 unsignedIntValue];

  BOOL v11 = self->_context;
  BOOL v12 = [MEMORY[0x1E4F5B6B0] keyPathForDefaultPairedDeviceThermalPressureLevel];
  id v13 = [(_CDContext *)v11 objectForKeyedSubscript:v12];
  uint64_t v14 = [v13 unsignedIntValue];

  if (v10 <= v14) {
    unsigned int v15 = v14;
  }
  else {
    unsigned int v15 = v10;
  }
  BOOL v16 = [(_DASPairedSystemContext *)self isWatchPluggedIn];
  BOOL v17 = v16;
  unint64_t v33 = a4;
  if (a4 > 0x31 || v16) {
    unsigned int v19 = 30;
  }
  else {
    unsigned int v19 = 20;
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v21 = log;
    char v22 = +[_DASPairedSystemContext stringForPriority:v33];
    +[_DASPairedSystemContext stringForThermalLevel:v10];
    unsigned int v32 = v15;
    v24 = id v23 = v6;
    __int16 v25 = +[_DASPairedSystemContext stringForThermalLevel:v14];
    *(_DWORD *)long long buf = 138413314;
    id v35 = v23;
    __int16 v36 = 2112;
    long long v37 = v22;
    __int16 v38 = 2112;
    long long v39 = v24;
    __int16 v40 = 2112;
    uint64_t v41 = v25;
    __int16 v42 = 1024;
    BOOL v43 = v17;
    _os_log_impl(&dword_1B578B000, v21, OS_LOG_TYPE_DEFAULT, "CHECKING: %@, Priority=%@, Local Thermals: %@, Paired Thermals: %@, Watch Plugged In: %u", buf, 0x30u);

    id v6 = v23;
    unsigned int v15 = v32;
  }
  if (v15 >= v19)
  {
    id v26 = self->_log;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v27 = v26;
      BOOL v28 = +[_DASPairedSystemContext stringForPriority:v33];
      BOOL v29 = +[_DASPairedSystemContext stringForThermalLevel:v10];
      id v30 = +[_DASPairedSystemContext stringForThermalLevel:v14];
      *(_DWORD *)long long buf = 138413314;
      id v35 = v6;
      __int16 v36 = 2112;
      long long v37 = v28;
      __int16 v38 = 2112;
      long long v39 = v29;
      __int16 v40 = 2112;
      uint64_t v41 = v30;
      __int16 v42 = 1024;
      BOOL v43 = v17;
      _os_log_impl(&dword_1B578B000, v27, OS_LOG_TYPE_DEFAULT, "DENIED: %@, Priority=%@, Local Thermals: %@, Paired Thermals: %@, Watch Plugged In: %u", buf, 0x30u);
    }
  }

  return v15 < v19;
}

- (void)readBudgetForRecentlyBackgroundedAppSyncTraffic
{
  obj = self->_persistence;
  objc_sync_enter(obj);
  uint64_t v3 = [(NSUserDefaults *)self->_persistence valueForKey:@"das.recentSyncBudget"];

  if (v3) {
    int v4 = [(NSUserDefaults *)self->_persistence integerForKey:@"das.recentSyncBudget"];
  }
  else {
    int v4 = 25;
  }
  self->_recentTrafficSyncRequests = v4;
  objc_sync_exit(obj);
}

- (void)resetBudgetForRecentlyBackgroundedAppSyncTraffic
{
  obj = self->_persistence;
  objc_sync_enter(obj);
  if (self->_recentTrafficSyncRequests <= 24)
  {
    self->_recentTrafficSyncRequests = 25;
    [(NSUserDefaults *)self->_persistence setInteger:25 forKey:@"das.recentSyncBudget"];
  }
  objc_sync_exit(obj);
}

- (BOOL)allowSyncTrafficForRecentlyBackgroundedApp
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self->_persistence;
  objc_sync_enter(v3);
  int recentTrafficSyncRequests = self->_recentTrafficSyncRequests;
  if (recentTrafficSyncRequests >= 1)
  {
    [(NSUserDefaults *)self->_persistence setInteger:(recentTrafficSyncRequests - 1) forKey:@"das.recentSyncBudget"];
    --self->_recentTrafficSyncRequests;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = self->_recentTrafficSyncRequests;
      v8[0] = 67109120;
      v8[1] = v6;
      _os_log_impl(&dword_1B578B000, log, OS_LOG_TYPE_DEFAULT, "%d more background sync requests allowed", (uint8_t *)v8, 8u);
    }
  }
  objc_sync_exit(v3);

  return recentTrafficSyncRequests > 0;
}

- (void)setWatchKitStatus:(BOOL)a3 forApplication:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  int v6 = self->_watchKitAppStatus;
  objc_sync_enter(v6);
  id v7 = [NSNumber numberWithBool:v4];
  [(NSMutableDictionary *)self->_watchKitAppStatus setObject:v7 forKeyedSubscript:v8];

  objc_sync_exit(v6);
}

- (BOOL)isAnyThirdPartyApp:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v31 = 0;
  unsigned int v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = a3;
  BOOL v4 = 0;
  uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v9 = self->_watchKitAppStatus;
        objc_sync_enter(v9);
        uint64_t v10 = [(NSMutableDictionary *)self->_watchKitAppStatus objectForKeyedSubscript:v8];
        objc_sync_exit(v9);

        if (v10)
        {
          char v17 = [v10 BOOLValue];
          *((unsigned char *)v32 + 24) = v17;
          uint32_t v18 = [(_DASPairedSystemContext *)self log];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            if (*((unsigned char *)v32 + 24)) {
              unsigned int v19 = &stru_1F0E63E70;
            }
            else {
              unsigned int v19 = @" NOT";
            }
            *(_DWORD *)long long buf = 138412546;
            uint64_t v36 = v8;
            __int16 v37 = 2112;
            __int16 v38 = v19;
            _os_log_impl(&dword_1B578B000, v18, OS_LOG_TYPE_INFO, "%@ is%@ a WatchKit app", buf, 0x16u);
          }

LABEL_19:
          goto LABEL_20;
        }
        if (!v4)
        {
          BOOL v11 = [MEMORY[0x1E4F79EF8] sharedInstance];
          BOOL v4 = [v11 getActivePairedDevice];
        }
        dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
        id v13 = [MEMORY[0x1E4F4AC60] sharedDeviceConnection];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __46___DASPairedSystemContext_isAnyThirdPartyApp___block_invoke;
        v23[3] = &unk_1E6112B88;
        v23[4] = self;
        uint64_t v14 = v12;
        id v24 = v14;
        uint64_t v25 = v8;
        id v26 = &v31;
        [v13 fetchInfoForApplicationWithBundleID:v8 forPairedDevice:v4 completion:v23];

        dispatch_time_t v15 = dispatch_time(0, 1000000000);
        dispatch_semaphore_wait(v14, v15);
        BOOL v16 = *((unsigned char *)v32 + 24) == 0;

        if (!v16) {
          goto LABEL_19;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_20:

  BOOL v20 = *((unsigned char *)v32 + 24) != 0;
  _Block_object_dispose(&v31, 8);

  return v20;
}

- (BOOL)thirdPartyAppPolicyAllowsSendingTrafficForServiceIdentifiers:(id)a3 atPriorityLevel:(unint64_t)a4 furtherChecksNecessary:(BOOL *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  char v34 = v8;
  if (![(_DASPairedSystemContext *)self isWatchPluggedIn]
    && [(_DASPairedSystemContext *)self isAnyThirdPartyApp:v8])
  {
    unint64_t v33 = a4;
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
    id obj = self->_recentlyBackgroundedApps;
    objc_sync_enter(obj);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v10 = v8;
    id v11 = (id)[v10 countByEnumeratingWithState:&v35 objects:v49 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v36;
      while (2)
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v36 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          dispatch_time_t v15 = [(NSMutableDictionary *)self->_recentlyBackgroundedApps objectForKeyedSubscript:v14];
          if (v15)
          {
            [v9 timeIntervalSinceDate:v15];
            if (v16 < 120.0)
            {
              id v11 = v14;
              goto LABEL_18;
            }
            [(NSMutableDictionary *)self->_recentlyBackgroundedApps removeObjectForKey:v14];
          }
        }
        id v11 = (id)[v10 countByEnumeratingWithState:&v35 objects:v49 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    dispatch_time_t v15 = 0;
LABEL_18:

    objc_sync_exit(obj);
    if (v15)
    {
      *a5 = 0;
      if (v33 > 0x31)
      {
LABEL_23:
        BOOL v18 = 1;
        goto LABEL_31;
      }
      BOOL v19 = [(_DASPairedSystemContext *)self allowSyncTrafficForRecentlyBackgroundedApp];
      log = self->_log;
      BOOL v21 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
      if (v19)
      {
        if (v21)
        {
          char v22 = log;
          id v23 = +[_DASPairedSystemContext stringForPriority:v33];
          int recentTrafficSyncRequests = self->_recentTrafficSyncRequests;
          *(_DWORD *)long long buf = 138413314;
          id v40 = v10;
          __int16 v41 = 2112;
          __int16 v42 = v23;
          __int16 v43 = 2112;
          id v44 = v11;
          __int16 v45 = 2112;
          v46 = v15;
          __int16 v47 = 1024;
          int v48 = recentTrafficSyncRequests;
          _os_log_impl(&dword_1B578B000, v22, OS_LOG_TYPE_DEFAULT, "ALLOWED: %@, Priority=%@, %@ backgrounded at: %@, Syncs Remaining: %d", buf, 0x30u);
        }
        goto LABEL_23;
      }
      if (v21)
      {
        long long v28 = log;
        long long v29 = +[_DASPairedSystemContext stringForPriority:v33];
        int v30 = self->_recentTrafficSyncRequests;
        *(_DWORD *)long long buf = 138413314;
        id v40 = v10;
        __int16 v41 = 2112;
        __int16 v42 = v29;
        __int16 v43 = 2112;
        id v44 = v11;
        __int16 v45 = 2112;
        v46 = v15;
        __int16 v47 = 1024;
        int v48 = v30;
        _os_log_impl(&dword_1B578B000, v28, OS_LOG_TYPE_DEFAULT, "DENIED: %@, Priority=%@, %@ backgrounded at: %@, Syncs Remaining: %d", buf, 0x30u);
      }
    }
    else
    {
      if (v33 > 0x31)
      {
        BOOL v18 = 1;
        *a5 = 1;
        goto LABEL_31;
      }
      *a5 = 0;
      uint64_t v25 = self->_log;
      BOOL v18 = 0;
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
LABEL_31:

        goto LABEL_32;
      }
      id v26 = v25;
      long long v27 = +[_DASPairedSystemContext stringForPriority:v33];
      *(_DWORD *)long long buf = 138412546;
      id v40 = v10;
      __int16 v41 = 2112;
      __int16 v42 = v27;
      _os_log_impl(&dword_1B578B000, v26, OS_LOG_TYPE_DEFAULT, "DENIED: %@, Priority=%@, No app backgrounded recently", buf, 0x16u);
    }
    BOOL v18 = 0;
    goto LABEL_31;
  }
  char v17 = self->_log;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[_DASPairedSystemContext thirdPartyAppPolicyAllowsSendingTrafficForServiceIdentifiers:atPriorityLevel:furtherChecksNecessary:](v17);
  }
  BOOL v18 = 1;
  *a5 = 1;
LABEL_32:

  return v18;
}

- (void)deleteRemoteHistogram
{
  v2 = (void *)MEMORY[0x1BA99F610](self, a2);
}

- (id)pairedDeviceStream
{
  v2 = (void *)MEMORY[0x1E4F5B528];
  uint64_t v3 = [MEMORY[0x1E4F5B490] type];
  BOOL v4 = [v2 eventStreamWithName:@"PairedDeviceForecast" valueType:v3];

  return v4;
}

- (void)updateAppUsageHistory
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1BA99F610](self, a2);
  id v4 = objc_alloc(MEMORY[0x1E4F28C18]);
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v7 = (void *)[v4 initWithStartDate:v5 endDate:v6];

  id v8 = (void *)MEMORY[0x1E4F5B538];
  uint64_t v9 = [(_DASPairedSystemContext *)self pairedDeviceStream];
  id v10 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  id v11 = [v8 histogramQueryForStream:v9 interval:v7 withPredicate:v10];

  [v11 setIncludeLocalResults:0];
  [v11 setIncludeRemoteResults:1];
  knowledgeStore = self->_knowledgeStore;
  id v20 = 0;
  id v13 = [(_DKKnowledgeQuerying *)knowledgeStore executeQuery:v11 error:&v20];
  id v14 = v20;
  if (v14)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v22 = v14;
      _os_log_impl(&dword_1B578B000, log, OS_LOG_TYPE_DEFAULT, "Error obtaining results for app usage history: %@", buf, 0xCu);
    }
  }
  else
  {
    double v16 = [v13 countDictionary];
    [(_DASPairedSystemContext *)self setRemoteAppLaunchCount:v16];

    char v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v18 = v17;
      BOOL v19 = [(_DASPairedSystemContext *)self remoteAppLaunchCount];
      *(_DWORD *)long long buf = 138412290;
      id v22 = v19;
      _os_log_impl(&dword_1B578B000, v18, OS_LOG_TYPE_DEFAULT, "Obtained results for histogram: %@", buf, 0xCu);
    }
  }
}

- (double)usageLikelihoodForApplication:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_DASPairedSystemContext *)self remoteAppLaunchCount];

  if (v5)
  {
    uint64_t v6 = [(_DASPairedSystemContext *)self remoteAppLaunchCount];
    id v7 = [v6 objectForKeyedSubscript:v4];
    [v7 doubleValue];
    double v9 = v8 / 100.0;

    double v10 = fmin(v9, 1.0);
  }
  else
  {
    double v10 = 1.0;
  }

  return v10;
}

- (BOOL)shouldBypassApplicationUsage:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend((id)kUsageIgnoredApps, "containsObject:", *(void *)(*((void *)&v8 + 1) + 8 * i), (void)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)batteryLevelsAllowSendingTrafficeForServiceIdentifiers:(id)a3 atPriorityLevel:(unint64_t)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(_DASPairedSystemContext *)self isWatchPluggedIn];
  uint64_t v8 = [(_DASPairedSystemContext *)self watchBatteryLevel];
  if (!v7 && [v6 containsObject:@"com.apple.private.alloy.sensorkit"])
  {
    log = self->_log;
    BOOL v10 = 0;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = log;
      uint64_t v12 = +[_DASPairedSystemContext stringForPriority:a4];
      *(_DWORD *)long long buf = 138413058;
      id v41 = v6;
      __int16 v42 = 2112;
      __int16 v43 = v12;
      __int16 v44 = 1024;
      *(_DWORD *)__int16 v45 = v8;
      *(_WORD *)&v45[4] = 1024;
      *(_DWORD *)&v45[6] = 0;
      _os_log_impl(&dword_1B578B000, v11, OS_LOG_TYPE_DEFAULT, "DENIED: %@, Priority=%@, Watch Battery Level: %d, Watch Plugin Status: %u", buf, 0x22u);

LABEL_27:
      BOOL v10 = 0;
      goto LABEL_28;
    }
    goto LABEL_28;
  }
  [(_DASPairedSystemContext *)self usageThresholdForPriority:a4 batteryLevel:v8 isPluggedIn:v7];
  double v14 = v13;
  if (v13 < 2.22507386e-308)
  {
    dispatch_time_t v15 = self->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      double v16 = v15;
      char v17 = +[_DASPairedSystemContext stringForPriority:a4];
      *(_DWORD *)long long buf = 138413314;
      id v41 = v6;
      __int16 v42 = 2112;
      __int16 v43 = v17;
      __int16 v44 = 1024;
      *(_DWORD *)__int16 v45 = v8;
      *(_WORD *)&v45[4] = 1024;
      *(_DWORD *)&v45[6] = v7;
      *(_WORD *)v46 = 2048;
      *(double *)&v46[2] = v14;
      _os_log_impl(&dword_1B578B000, v16, OS_LOG_TYPE_DEFAULT, "ALLOWED: %@, Priority=%@, Watch Battery Level: %d, Watch Plugin Status: %u, Usage Threshold: %lf", buf, 0x2Cu);
    }
    goto LABEL_24;
  }
  if (v13 <= 1.0)
  {
    if (![(_DASPairedSystemContext *)self shouldBypassApplicationUsage:v6])
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v21 = v6;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v36;
        double v25 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v36 != v24) {
              objc_enumerationMutation(v21);
            }
            -[_DASPairedSystemContext usageLikelihoodForApplication:](self, "usageLikelihoodForApplication:", *(void *)(*((void *)&v35 + 1) + 8 * i), (void)v35);
            double v25 = v25 + v27;
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v23);
      }
      else
      {
        double v25 = 0.0;
      }

      long long v28 = self->_log;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        long long v29 = v28;
        int v30 = +[_DASPairedSystemContext stringForPriority:a4];
        *(_DWORD *)long long buf = 138413314;
        id v41 = v21;
        __int16 v42 = 2112;
        __int16 v43 = v30;
        __int16 v44 = 2048;
        *(double *)__int16 v45 = v25;
        *(_WORD *)&v45[8] = 1024;
        *(_DWORD *)v46 = v8;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = v7;
        _os_log_impl(&dword_1B578B000, v29, OS_LOG_TYPE_DEFAULT, "CHECKING: %@, Priority=%@, App Usage: %lf, Watch Battery Level: %d, Watch Plugin Status: %u", buf, 0x2Cu);
      }
      if (v25 < v14)
      {
        uint64_t v31 = self->_log;
        BOOL v10 = 0;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v32 = v31;
          unint64_t v33 = +[_DASPairedSystemContext stringForPriority:a4];
          *(_DWORD *)long long buf = 138413314;
          id v41 = v21;
          __int16 v42 = 2112;
          __int16 v43 = v33;
          __int16 v44 = 2048;
          *(double *)__int16 v45 = v25;
          *(_WORD *)&v45[8] = 1024;
          *(_DWORD *)v46 = v8;
          *(_WORD *)&v46[4] = 1024;
          *(_DWORD *)&v46[6] = v7;
          _os_log_impl(&dword_1B578B000, v32, OS_LOG_TYPE_DEFAULT, "DENIED: %@, Priority=%@, App Usage: %lf, Watch Battery Level: %d, Watch Plugin Status: %u", buf, 0x2Cu);

          goto LABEL_27;
        }
        goto LABEL_28;
      }
    }
LABEL_24:
    BOOL v10 = 1;
    goto LABEL_28;
  }
  BOOL v18 = self->_log;
  BOOL v10 = 0;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v19 = v18;
    id v20 = +[_DASPairedSystemContext stringForPriority:a4];
    *(_DWORD *)long long buf = 138413314;
    id v41 = v6;
    __int16 v42 = 2112;
    __int16 v43 = v20;
    __int16 v44 = 1024;
    *(_DWORD *)__int16 v45 = v8;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = v7;
    *(_WORD *)v46 = 2048;
    *(double *)&v46[2] = v14;
    _os_log_impl(&dword_1B578B000, v19, OS_LOG_TYPE_DEFAULT, "DENIED: %@, Priority=%@, Watch Battery Level: %d, Watch Plugin Status: %u, Usage Threshold: %lf", buf, 0x2Cu);

    goto LABEL_27;
  }
LABEL_28:

  return v10;
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void)setHandlerQueue:(id)a3
{
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSUserDefaults)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (void)setOnConditionsChange:(id)a3
{
}

- (id)onApplicationStateChange
{
  return self->_onApplicationStateChange;
}

- (void)setOnApplicationStateChange:(id)a3
{
}

- (int)previousMaxThermalPressure
{
  return self->_previousMaxThermalPressure;
}

- (void)setPreviousMaxThermalPressure:(int)a3
{
  self->_previousMaxThermalPressure = a3;
}

- (double)previousDefaultThreshold
{
  return self->_previousDefaultThreshold;
}

- (void)setPreviousDefaultThreshold:(double)a3
{
  self->_previousDefaultThreshold = a3;
}

- (double)previousSyncThreshold
{
  return self->_previousSyncThreshold;
}

- (void)setPreviousSyncThreshold:(double)a3
{
  self->_previousSyncThreshold = a3;
}

- (double)previousBatteryLevel
{
  return self->_previousBatteryLevel;
}

- (void)setPreviousBatteryLevel:(double)a3
{
  self->_previousBatteryLevel = a3;
}

- (BOOL)previousPluginStatus
{
  return self->_previousPluginStatus;
}

- (void)setPreviousPluginStatus:(BOOL)a3
{
  self->_previousPluginStatus = a3;
}

- (NSMutableDictionary)watchKitAppStatus
{
  return self->_watchKitAppStatus;
}

- (void)setWatchKitAppStatus:(id)a3
{
}

- (int)recentTrafficSyncRequests
{
  return self->_recentTrafficSyncRequests;
}

- (void)setRecentTrafficSyncRequests:(int)a3
{
  self->_int recentTrafficSyncRequests = a3;
}

- (NSMutableDictionary)recentlyBackgroundedApps
{
  return self->_recentlyBackgroundedApps;
}

- (void)setRecentlyBackgroundedApps:(id)a3
{
}

- (NSMutableSet)previousForegroundApps
{
  return self->_previousForegroundApps;
}

- (void)setPreviousForegroundApps:(id)a3
{
}

- (NSDictionary)remoteAppLaunchCount
{
  return (NSDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setRemoteAppLaunchCount:(id)a3
{
}

- (NSMutableDictionary)launchedAppCount
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLaunchedAppCount:(id)a3
{
}

- (OS_dispatch_source)appUsageRefreshTimer
{
  return self->_appUsageRefreshTimer;
}

- (void)setAppUsageRefreshTimer:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (int)remoteForecastDeletionToken
{
  return self->_remoteForecastDeletionToken;
}

- (void)setRemoteForecastDeletionToken:(int)a3
{
  self->_remoteForecastDeletionToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_appUsageRefreshTimer, 0);
  objc_storeStrong((id *)&self->_launchedAppCount, 0);
  objc_storeStrong((id *)&self->_remoteAppLaunchCount, 0);
  objc_storeStrong((id *)&self->_previousForegroundApps, 0);
  objc_storeStrong((id *)&self->_previousExclusiveIdentifiers, 0);
  objc_storeStrong((id *)&self->_recentlyBackgroundedApps, 0);
  objc_storeStrong((id *)&self->_foregroundWatchApp, 0);
  objc_storeStrong((id *)&self->_watchKitAppStatus, 0);
  objc_storeStrong(&self->_onApplicationStateChange, 0);
  objc_storeStrong(&self->_onConditionsChange, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)thirdPartyAppPolicyAllowsSendingTrafficForServiceIdentifiers:(os_log_t)log atPriorityLevel:furtherChecksNecessary:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B578B000, log, OS_LOG_TYPE_DEBUG, "Watch is plugged in or no app is third-party app", v1, 2u);
}

@end