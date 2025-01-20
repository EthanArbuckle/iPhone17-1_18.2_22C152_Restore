@interface _ATXAppLaunchMonitor
+ (id)predictionUpdateBlacklistedBundleIds;
+ (int)petClipCaptureTypeFromDuetClipLaunchReason:(int)a3;
+ (void)_logAppLaunch:(id)a3 from:(unint64_t)a4;
+ (void)_logPredictionForBundleId:(id)a3 poweringAppClipBundleId:(id)a4 urlHash:(id)a5 isClip:(BOOL)a6 appLaunchReason:(id)a7 appClipLaunchReason:(int)a8 consumerType:(unint64_t)a9 consumerSubType:(unsigned __int8)a10 context:(id)a11;
+ (void)mergeAppLaunches:(id)a3 andBacklightTransitions:(id)a4 callingAppLaunchBlock:(id)a5;
- (BOOL)isValidAppLaunchBundleId:(id)a3;
- (_ATXAppLaunchMonitor)initWithAppInfoManager:(id)a3 appLaunchHistogramManager:(id)a4 appLaunchSequenceManager:(id)a5 appDailyDose:(id)a6 duetHelper:(id)a7 contextBuilder:(id)a8 tracker:(id)a9;
- (_ATXAppLaunchMonitor)initWithAppInfoManager:(id)a3 appLaunchHistogramManager:(id)a4 appLaunchSequenceManager:(id)a5 appDailyDose:(id)a6 duetHelper:(id)a7 contextBuilder:(id)a8 tracker:(id)a9 predictionUpdateBlacklist:(id)a10 heroPoiManager:(id)a11;
- (_ATXAppLaunchMonitor)initWithInMemoryStore;
- (id)appIconState;
- (id)appInfoManager;
- (id)appLaunchHistogramManager;
- (id)appLaunchSequenceManager;
- (id)dailyDose;
- (id)stopDeltaRecording;
- (void)_addLaunchWithLockWitness:(id)a3 bundleId:(id)a4 date:(id)a5 timeZone:(id)a6 reason:(id)a7 context:(id)a8;
- (void)_logAppLaunchOverallCaptureRateForBundleId:(id)a3 launchReason:(id)a4;
- (void)_logAppPanelCaptureRateForBundleId:(id)a3;
- (void)_logAppPanelLaunchRatioForBundleId:(id)a3 launchReason:(id)a4;
- (void)_syncForTests;
- (void)_updateAppIconStateForTests:(id)a3;
- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5 reason:(id)a6;
- (void)clearHistory;
- (void)clearIntentHistogramHistory;
- (void)dealloc;
- (void)handleAppOrClipLaunchNotificationForBundleId:(id)a3 poweringAppClipBundleId:(id)a4 urlHash:(id)a5 isClip:(BOOL)a6 appLaunchReason:(id)a7 appClipLaunchReason:(int)a8 date:(id)a9;
- (void)handleBacklightChangeNotificationWithValue:(int)a3 date:(id)a4;
- (void)logAppLaunchForBundleId:(id)a3 launchReason:(id)a4;
- (void)processDonationsForPreviousAppSessionEndIfNeeded;
- (void)registerForAppChange;
- (void)registerForAppClipLaunch;
- (void)registerForBacklightChange;
- (void)start;
- (void)startDeltaRecording;
- (void)stop;
- (void)swapDuetHelper:(id)a3;
- (void)updateLaunchHistoryFromDuet:(double)a3 callback:(id)a4;
@end

@implementation _ATXAppLaunchMonitor

- (BOOL)isValidAppLaunchBundleId:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && ([v3 isEqualToString:@"unknown"] & 1) == 0) {
    int v5 = [v4 hasPrefix:@"com.apple.springboard."] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (id)predictionUpdateBlacklistedBundleIds
{
  v2 = (void *)MEMORY[0x1D25F6CC0](a1, a2);
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.apple.ClipViewService", 0);
  return v3;
}

- (_ATXAppLaunchMonitor)initWithInMemoryStore
{
  id v3 = [[_ATXAppInfoManager alloc] initWithInMemoryStore];
  v4 = [ATXPredictionContextBuilder alloc];
  int v5 = [MEMORY[0x1E4F935D0] sharedInstance];
  v6 = objc_opt_new();
  v7 = [[ATXAmbientLightMonitor alloc] initWithoutMonitoring];
  v8 = [(ATXPredictionContextBuilder *)v4 initWithAppInfoManager:v3 locationManager:v5 motionManagerWrapper:v6 ambientLightMonitor:v7 deviceStateMonitorClass:objc_opt_class() contextSourcesInitialized:1];

  v9 = [[_ATXAppLaunchHistogramManager alloc] initWithInMemoryStore];
  v10 = [[_ATXAppLaunchSequenceManager alloc] initWithInMemoryStore];
  v11 = objc_opt_new();
  v12 = objc_opt_new();
  v13 = objc_opt_new();
  v14 = [(id)objc_opt_class() predictionUpdateBlacklistedBundleIds];
  v15 = objc_opt_new();
  v16 = [(_ATXAppLaunchMonitor *)self initWithAppInfoManager:v3 appLaunchHistogramManager:v9 appLaunchSequenceManager:v10 appDailyDose:v11 duetHelper:v12 contextBuilder:v8 tracker:v13 predictionUpdateBlacklist:v14 heroPoiManager:v15];

  return v16;
}

- (_ATXAppLaunchMonitor)initWithAppInfoManager:(id)a3 appLaunchHistogramManager:(id)a4 appLaunchSequenceManager:(id)a5 appDailyDose:(id)a6 duetHelper:(id)a7 contextBuilder:(id)a8 tracker:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  v23 = [(id)objc_opt_class() predictionUpdateBlacklistedBundleIds];
  v24 = objc_opt_new();
  v25 = [(_ATXAppLaunchMonitor *)self initWithAppInfoManager:v22 appLaunchHistogramManager:v21 appLaunchSequenceManager:v20 appDailyDose:v19 duetHelper:v18 contextBuilder:v17 tracker:v16 predictionUpdateBlacklist:v23 heroPoiManager:v24];

  return v25;
}

- (_ATXAppLaunchMonitor)initWithAppInfoManager:(id)a3 appLaunchHistogramManager:(id)a4 appLaunchSequenceManager:(id)a5 appDailyDose:(id)a6 duetHelper:(id)a7 contextBuilder:(id)a8 tracker:(id)a9 predictionUpdateBlacklist:(id)a10 heroPoiManager:(id)a11
{
  id v17 = a3;
  id v50 = a4;
  id v49 = a5;
  id v48 = a6;
  id v47 = a7;
  id v46 = a8;
  id v45 = a9;
  id v44 = a10;
  id v43 = a11;
  v51.receiver = self;
  v51.super_class = (Class)_ATXAppLaunchMonitor;
  id v18 = [(_ATXAppLaunchMonitor *)&v51 init];
  if (v18)
  {
    id v41 = v17;
    id v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.duetexpertcenter.AppPredictionExpert.AppLaunchHistory", v19);
    appLaunchHistoryQueue = v18->_appLaunchHistoryQueue;
    v18->_appLaunchHistoryQueue = (OS_dispatch_queue *)v20;

    id v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v24 = dispatch_queue_create("com.apple.duetexpertcenter.AppPredictionExpert.AppLaunchHistory.logging", v23);
    logQueue = v18->_logQueue;
    v18->_logQueue = (OS_dispatch_queue *)v24;

    uint64_t v26 = objc_opt_new();
    appClipChangeListener = v18->_appClipChangeListener;
    v18->_appClipChangeListener = (ATXAppClipUsageDuetContextUpdateListener *)v26;

    v28 = (id *)objc_opt_new();
    objc_storeStrong(v28 + 2, a7);
    objc_storeStrong(v28 + 3, a6);
    objc_storeStrong(v28 + 4, a3);
    objc_storeStrong(v28 + 5, a4);
    objc_storeStrong(v28 + 6, a5);
    objc_storeStrong(v28 + 7, a8);
    objc_storeStrong(v28 + 8, a11);
    uint64_t v29 = [objc_alloc(MEMORY[0x1E4F93B80]) initWithGuardedData:v28 serialQueue:v18->_appLaunchHistoryQueue];

    history = v18->_history;
    v18->_history = (_PASQueueLock *)v29;

    v31 = objc_opt_new();
    uint64_t v32 = objc_opt_new();
    v33 = (void *)v31[2];
    v31[2] = v32;

    uint64_t v34 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v31];
    cdContext = v18->_cdContext;
    v18->_cdContext = (_PASLock *)v34;

    objc_storeStrong((id *)&v18->_tracker, a9);
    id v36 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v37 = [v36 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    userDefaults = v18->_userDefaults;
    v18->_userDefaults = (NSUserDefaults *)v37;

    objc_storeStrong((id *)&v18->_predictionUpdateBlacklist, a10);
    v39 = __atxlog_handle_default();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchMonitor initWithAppInfoManager:appLaunchHistogramManager:appLaunchSequenceManager:appDailyDose:duetHelper:contextBuilder:tracker:predictionUpdateBlacklist:heroPoiManager:]();
    }

    id v17 = v41;
  }

  return v18;
}

- (id)appIconState
{
  appIconState = self->_appIconState;
  if (!appIconState)
  {
    v4 = +[_ATXAppIconState sharedInstance];
    int v5 = self->_appIconState;
    self->_appIconState = v4;

    appIconState = self->_appIconState;
  }
  return appIconState;
}

- (void)_updateAppIconStateForTests:(id)a3
{
}

- (void)start
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [v4 stringByAppendingString:@"-start"];
  v6 = (const char *)[v5 UTF8String];
  v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);
  v9 = dispatch_queue_create(v6, v8);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29___ATXAppLaunchMonitor_start__block_invoke;
  block[3] = &unk_1E68AB818;
  block[4] = self;
  dispatch_async(v9, block);
  [(_PASLock *)self->_cdContext runWithLockAcquired:&__block_literal_global_93];
  [(_ATXAppLaunchMonitor *)self registerForAppChange];
  [(_ATXAppLaunchMonitor *)self registerForAppClipLaunch];
  [(_ATXAppLaunchMonitor *)self registerForBacklightChange];
}

+ (void)mergeAppLaunches:(id)a3 andBacklightTransitions:(id)a4 callingAppLaunchBlock:(id)a5
{
  id v28 = a3;
  id v7 = a4;
  v8 = (void (**)(id, void *, void *, void *, void *, uint64_t))a5;
  if ([v28 count])
  {
    unint64_t v9 = 0;
    unint64_t v10 = 0;
    v27 = (char *)(v8 + 2);
    do
    {
      if (v10 >= objc_msgSend(v7, "count", v27)) {
        break;
      }
      v11 = [v28 objectAtIndexedSubscript:v9];
      v12 = [v7 objectAtIndexedSubscript:v10];
      v13 = [v11 startDate];
      v14 = [v13 earlierDate:v12];
      v15 = [v11 startDate];
      int v16 = [v14 isEqualToDate:v15];

      if (v16)
      {
        id v17 = [v11 bundleId];
        id v18 = [v11 startDate];
        id v19 = [v11 timeZone];
        dispatch_queue_t v20 = [v11 reason];
        v8[2](v8, v17, v18, v19, v20, 1);

        ++v9;
      }
      else
      {
        v8[2](v8, 0, v12, 0, 0, 0);
        ++v10;
      }
    }
    while (v9 < [v28 count]);
  }
  else
  {
    unint64_t v10 = 0;
    unint64_t v9 = 0;
  }
  while (v9 < [v28 count])
  {
    id v21 = [v28 objectAtIndexedSubscript:v9];
    id v22 = [v21 bundleId];
    v23 = [v21 startDate];
    dispatch_queue_t v24 = [v21 timeZone];
    v25 = [v21 reason];
    v8[2](v8, v22, v23, v24, v25, 1);

    ++v9;
  }
  for (; v10 < [v7 count]; ++v10)
  {
    uint64_t v26 = [v7 objectAtIndexedSubscript:v10];
    v8[2](v8, 0, v26, 0, 0, 0);
  }
}

- (void)updateLaunchHistoryFromDuet:(double)a3 callback:(id)a4
{
  id v7 = a4;
  v8 = (objc_class *)objc_opt_class();
  unint64_t v9 = NSStringFromClass(v8);
  id v10 = [v9 stringByAppendingString:@"-update"];
  v11 = (const char *)[v10 UTF8String];
  v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_UTILITY, 0);
  v14 = dispatch_queue_create(v11, v13);

  sel_getName(a2);
  v15 = (void *)os_transaction_create();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61___ATXAppLaunchMonitor_updateLaunchHistoryFromDuet_callback___block_invoke;
  v18[3] = &unk_1E68B04B8;
  double v21 = a3;
  id v19 = v15;
  id v20 = v7;
  v18[4] = self;
  id v16 = v15;
  id v17 = v7;
  dispatch_async(v14, v18);
}

- (void)registerForAppChange
{
  objc_initWeak(&location, self);
  id v3 = [MEMORY[0x1E4F5B6B8] keyPathForAppDataDictionary];
  v4 = [MEMORY[0x1E4F5B6E8] predicateForChangeAtKeyPath:v3];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke;
  aBlock[3] = &unk_1E68B0530;
  objc_copyWeak(&v14, &location);
  id v5 = v3;
  id v13 = v5;
  v6 = _Block_copy(aBlock);
  id v7 = [MEMORY[0x1E4F5B6C8] localWakingRegistrationWithIdentifier:@"com.apple.duetexpertd.appchangeprediction" contextualPredicate:v4 clientIdentifier:@"com.apple.duetexpertd.cdidentifier" callback:v6];
  cdContext = self->_cdContext;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke_2;
  v10[3] = &unk_1E68B0558;
  id v9 = v7;
  id v11 = v9;
  [(_PASLock *)cdContext runWithLockAcquired:v10];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)registerForAppClipLaunch
{
  objc_initWeak(&location, self);
  appClipChangeListener = self->_appClipChangeListener;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48___ATXAppLaunchMonitor_registerForAppClipLaunch__block_invoke;
  v4[3] = &unk_1E68ACB58;
  objc_copyWeak(&v5, &location);
  [(ATXAppClipUsageDuetContextUpdateListener *)appClipChangeListener startListeningWithCallback:v4 clientId:@"_ATXAppLaunchMonitor"];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

+ (int)petClipCaptureTypeFromDuetClipLaunchReason:(int)a3
{
  if ((a3 - 1) >= 9) {
    return 0;
  }
  else {
    return a3;
  }
}

- (void)registerForBacklightChange
{
  objc_initWeak(&location, self);
  id v3 = [MEMORY[0x1E4F5B6B8] keyPathForBacklightOnStatus];
  v4 = [MEMORY[0x1E4F5B6E8] predicateForChangeAtKeyPath:v3];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50___ATXAppLaunchMonitor_registerForBacklightChange__block_invoke;
  aBlock[3] = &unk_1E68B0530;
  objc_copyWeak(&v14, &location);
  id v5 = v3;
  id v13 = v5;
  v6 = _Block_copy(aBlock);
  id v7 = [MEMORY[0x1E4F5B6C8] localNonWakingRegistrationWithIdentifier:@"com.apple.duetexpertd.screensleepchangeprediction" contextualPredicate:v4 clientIdentifier:@"com.apple.duetexpertd.cdidentifier" callback:v6];
  cdContext = self->_cdContext;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50___ATXAppLaunchMonitor_registerForBacklightChange__block_invoke_3;
  v10[3] = &unk_1E68B0558;
  id v9 = v7;
  id v11 = v9;
  [(_PASLock *)cdContext runWithLockAcquired:v10];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)processDonationsForPreviousAppSessionEndIfNeeded
{
  if ([(NSUserDefaults *)self->_userDefaults BOOLForKey:@"ATXAppLaunchMonitor_LastLaunchWasHomescreen"])
  {
    id v3 = __atxlog_handle_default();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "Last app launch was the homescreen. Not going to process donations for previous app session end.", buf, 2u);
    }
  }
  else
  {
    v4 = +[_ATXAppPredictor sharedInstance];
    id v5 = [v4 appIntentMonitor];

    *(void *)buf = 0;
    id v14 = buf;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy__45;
    id v17 = __Block_byref_object_dispose__45;
    id v18 = 0;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy__45;
    v11[4] = __Block_byref_object_dispose__45;
    id v12 = 0;
    history = self->_history;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72___ATXAppLaunchMonitor_processDonationsForPreviousAppSessionEndIfNeeded__block_invoke;
    v7[3] = &unk_1E68B05A8;
    id v9 = buf;
    id v10 = v11;
    id v3 = v5;
    v8 = v3;
    [(_PASQueueLock *)history runAsyncWithLockAcquired:v7];

    _Block_object_dispose(v11, 8);
    _Block_object_dispose(buf, 8);
  }
}

- (void)handleAppOrClipLaunchNotificationForBundleId:(id)a3 poweringAppClipBundleId:(id)a4 urlHash:(id)a5 isClip:(BOOL)a6 appLaunchReason:(id)a7 appClipLaunchReason:(int)a8 date:(id)a9
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a9;
  sel_getName(a2);
  double v21 = (void *)os_transaction_create();
  [(_ATXAppLaunchMonitor *)self processDonationsForPreviousAppSessionEndIfNeeded];
  if ([v16 length])
  {
    [(NSUserDefaults *)self->_userDefaults setBool:0 forKey:@"ATXAppLaunchMonitor_LastLaunchWasHomescreen"];
    id v22 = __atxlog_handle_default();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v40 = v16;
      __int16 v41 = 2112;
      id v42 = v19;
      _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_INFO, "App launch: %@ for reason %@", buf, 0x16u);
    }

    logQueue = self->_logQueue;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __149___ATXAppLaunchMonitor_handleAppOrClipLaunchNotificationForBundleId_poweringAppClipBundleId_urlHash_isClip_appLaunchReason_appClipLaunchReason_date___block_invoke_122;
    v27[3] = &unk_1E68B0620;
    v27[4] = self;
    id v28 = v16;
    id v29 = v19;
    id v30 = v17;
    id v31 = v18;
    BOOL v35 = a6;
    int v34 = a8;
    id v32 = v20;
    id v33 = v21;
    dispatch_async(logQueue, v27);

    dispatch_queue_t v24 = v28;
  }
  else
  {
    history = self->_history;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __149___ATXAppLaunchMonitor_handleAppOrClipLaunchNotificationForBundleId_poweringAppClipBundleId_urlHash_isClip_appLaunchReason_appClipLaunchReason_date___block_invoke;
    v36[3] = &unk_1E68B05D0;
    id v37 = v20;
    id v38 = v21;
    [(_PASQueueLock *)history runAsyncWithLockAcquired:v36];
    [(NSUserDefaults *)self->_userDefaults setBool:1 forKey:@"ATXAppLaunchMonitor_LastLaunchWasHomescreen"];
    uint64_t v26 = __atxlog_handle_default();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchMonitor handleAppOrClipLaunchNotificationForBundleId:poweringAppClipBundleId:urlHash:isClip:appLaunchReason:appClipLaunchReason:date:]();
    }

    dispatch_queue_t v24 = v37;
  }
}

+ (void)_logPredictionForBundleId:(id)a3 poweringAppClipBundleId:(id)a4 urlHash:(id)a5 isClip:(BOOL)a6 appLaunchReason:(id)a7 appClipLaunchReason:(int)a8 consumerType:(unint64_t)a9 consumerSubType:(unsigned __int8)a10 context:(id)a11
{
  uint64_t v11 = *(void *)&a8;
  BOOL v13 = a6;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v54 = a11;
  uint64_t v53 = os_transaction_create();
  v52 = (void *)MEMORY[0x1D25F6CC0]();
  id v20 = [MEMORY[0x1E4F4AF40] clientForConsumerType:a9];
  double v21 = [v20 appPredictionsForConsumerSubType:a10 limit:20];

  id v22 = [v21 error];

  if (v22)
  {
    v23 = __atxlog_handle_default();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      +[_ATXAppLaunchMonitor _logPredictionForBundleId:poweringAppClipBundleId:urlHash:isClip:appLaunchReason:appClipLaunchReason:consumerType:consumerSubType:context:](v21, v23);
    }
LABEL_4:
    dispatch_queue_t v24 = (void *)v53;

    goto LABEL_25;
  }
  if (![v19 length])
  {
    v23 = __atxlog_handle_default();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      +[_ATXAppLaunchMonitor _logPredictionForBundleId:poweringAppClipBundleId:urlHash:isClip:appLaunchReason:appClipLaunchReason:consumerType:consumerSubType:context:]();
    }
    goto LABEL_4;
  }
  v25 = [v21 predictedApps];
  id v51 = v17;
  uint64_t v26 = [v25 indexOfObject:v16];

  +[_ATXAggregateLogger sharedInstance];
  v27 = id v50 = v18;
  [v27 logLaunchEventWithLaunchReason:v19 predicted:v26 != 0x7FFFFFFFFFFFFFFFLL position:v26];

  id v18 = v50;
  id v28 = +[_ATXGlobals sharedInstance];
  [v28 shadowLogSamplingRate];
  double v30 = v29;

  id v17 = v51;
  int v31 = [MEMORY[0x1E4F93B08] isInternalBuild];
  double v32 = v30 * 10.0;
  if (v30 * 10.0 > 1.0) {
    double v32 = 1.0;
  }
  if (v31) {
    double v30 = v32;
  }
  if (v51 && v13 && (v11 - 4) <= 0xFFFFFFFD)
  {
    id v33 = [[ATXAppOrClipLaunch alloc] initAppClipLaunchWithBundleId:v51 urlHash:v50 launchReason:v11];
    +[ATXLaunchAndLocationHarvester logAppOrClipLaunch:v33 isNegativeSession:0];

    id v17 = v51;
  }
  if (+[_ATXAggregateLogger yesWithProbability:v30])
  {
    context = (void *)MEMORY[0x1D25F6CC0]();
    int v34 = objc_opt_new();
    BOOL v35 = [v21 predictedApps];
    unint64_t v36 = [v35 count];

    uint64_t v37 = 4;
    if (v36 < 4) {
      uint64_t v37 = v36;
    }
    if (v37)
    {
      unint64_t v38 = 0;
      do
      {
        v39 = [v21 predictedApps];
        id v40 = [v39 objectAtIndexedSubscript:v38];
        [v34 addObject:v40];

        ++v38;
        __int16 v41 = [v21 predictedApps];
        unint64_t v42 = [v41 count];

        if (v42 >= 4) {
          unint64_t v43 = 4;
        }
        else {
          unint64_t v43 = v42;
        }
      }
      while (v38 < v43);
    }
    id v44 = +[ATXAppPredictionFeedbackItem feedbackItemsForResponse:v21];
    id v45 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, 4);
    id v46 = +[_ATXAggregateLogger propertyStringForLaunchReason:v19];
    id v47 = +[ATXAppPredictorFeedback constructSessionLogDictionaryWithFeedbackItems:v44 engagedBundleId:v16 shownBundleIdIndexes:v45 consumerType:a9 consumerSubType:a10 outcome:5 annotation:v46 context:v54];

    +[ATXAWDUtils logAppPredictionDictionaryViaAWD:v47];
    id v18 = v50;
    id v17 = v51;
  }
  +[_ATXAppLaunchMonitor _harvestAppPredictionDataForBundleId:v16 response:v21];

  dispatch_queue_t v24 = (void *)v53;
  id v48 = self;
LABEL_25:
}

- (void)logAppLaunchForBundleId:(id)a3 launchReason:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if ([v6 isEqualToString:*MEMORY[0x1E4FA6E00]])
  {
    id v7 = [(_ATXAppLaunchMonitor *)self appIconState];
    if ([v7 appOnDockWithBundleId:v13])
    {
      id v8 = v13;
      uint64_t v9 = 16;
    }
    else
    {
      uint64_t v12 = [v7 springboardPageNumberForBundleId:v13];
      if (v12 < 0)
      {
LABEL_11:
        [(_ATXAppLaunchMonitor *)self _logAppPanelCaptureRateForBundleId:v13];

        goto LABEL_23;
      }
      id v8 = v13;
      if (v12 >= 10) {
        uint64_t v9 = 10;
      }
      else {
        uint64_t v9 = v12;
      }
    }
    +[_ATXAppLaunchMonitor _logAppLaunch:v8 from:v9];
    goto LABEL_11;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4FA6E48]])
  {
    id v10 = v13;
    uint64_t v11 = 14;
  }
  else if ([v6 isEqualToString:*MEMORY[0x1E4FA6E38]])
  {
    id v10 = v13;
    uint64_t v11 = 11;
  }
  else if ([v6 isEqualToString:*MEMORY[0x1E4FA6E10]])
  {
    id v10 = v13;
    uint64_t v11 = 18;
  }
  else if ([v6 isEqualToString:*MEMORY[0x1E4FA6E30]])
  {
    id v10 = v13;
    uint64_t v11 = 19;
  }
  else if ([v6 isEqualToString:*MEMORY[0x1E4FA6DB0]])
  {
    id v10 = v13;
    uint64_t v11 = 20;
  }
  else
  {
    if (![v6 isEqualToString:*MEMORY[0x1E4FA6DC0]]) {
      goto LABEL_23;
    }
    id v10 = v13;
    uint64_t v11 = 21;
  }
  +[_ATXAppLaunchMonitor _logAppLaunch:v10 from:v11];
LABEL_23:
  [(_ATXAppLaunchMonitor *)self _logAppLaunchOverallCaptureRateForBundleId:v13 launchReason:v6];
  [(_ATXAppLaunchMonitor *)self _logAppPanelLaunchRatioForBundleId:v13 launchReason:v6];
}

- (void)_logAppPanelLaunchRatioForBundleId:(id)a3 launchReason:(id)a4
{
  id v12 = a3;
  if ([a4 isEqualToString:*MEMORY[0x1E4FA6E00]])
  {
    id v6 = [(_ATXAppLaunchMonitor *)self appIconState];
    id v7 = [v6 springboardPageNumbersWithAppPredictionPanels];
    id v8 = (void *)[v7 mutableCopy];

    unint64_t v9 = *MEMORY[0x1E4F4B540];
    [v8 removeIndex:*MEMORY[0x1E4F4B540]];
    if ([v8 count])
    {
      if ([v6 appOnDockWithBundleId:v12])
      {
        [MEMORY[0x1E4F4AEE0] logNonAppPanelAppLaunchFromDock];
      }
      else
      {
        unint64_t v10 = [v6 springboardPageNumberForBundleId:v12];
        int v11 = [v8 containsIndex:v10];
        if ((v10 & 0x8000000000000000) == 0 && v10 < v9 && v11) {
          [MEMORY[0x1E4F4AEE0] logNonAppPanelAppLaunchWithSBPageIndex:v10];
        }
      }
    }
  }
}

- (void)_logAppPanelCaptureRateForBundleId:(id)a3
{
  id v15 = a3;
  v4 = [(_ATXAppLaunchMonitor *)self appIconState];
  id v5 = [v4 springboardPageNumbersWithAppPredictionPanels];
  id v6 = (void *)[v5 mutableCopy];

  unint64_t v7 = *MEMORY[0x1E4F4B540];
  [v6 removeIndex:*MEMORY[0x1E4F4B540]];
  if ([v6 count])
  {
    if ([v4 appOnDockWithBundleId:v15])
    {
      uint64_t v8 = 5004;
LABEL_15:
      [MEMORY[0x1E4F4AF30] logHomeScreenDiversionWithCaptureType:v8 tracker:self->_tracker];
      goto LABEL_16;
    }
    unint64_t v9 = [v4 springboardPageNumberForBundleId:v15];
    if ((v9 & 0x8000000000000000) == 0)
    {
      unint64_t v10 = v9;
      if (v9 < v7)
      {
        int v11 = [v4 appInFolderWithBundleId:v15];
        int v12 = [v6 containsIndex:v10];
        if (v11) {
          unsigned int v13 = 5006;
        }
        else {
          unsigned int v13 = 5005;
        }
        if (v11) {
          unsigned int v14 = 5008;
        }
        else {
          unsigned int v14 = 5007;
        }
        if (v12) {
          uint64_t v8 = v13;
        }
        else {
          uint64_t v8 = v14;
        }
        goto LABEL_15;
      }
    }
  }
LABEL_16:
}

- (void)_logAppLaunchOverallCaptureRateForBundleId:(id)a3 launchReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_ATXAppLaunchMonitor *)self appIconState];
  int v9 = [v8 appOnDockWithBundleId:v6];
  if ([v7 isEqualToString:*MEMORY[0x1E4FA6E00]])
  {
    if (v9) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
  }
  else if ([v7 isEqualToString:*MEMORY[0x1E4FA6E38]])
  {
    uint64_t v10 = 3;
  }
  else if (([v7 isEqualToString:*MEMORY[0x1E4FA6D88]] & 1) != 0 {
         || ([v7 isEqualToString:*MEMORY[0x1E4FA6D98]] & 1) != 0
  }
         || ([v7 isEqualToString:*MEMORY[0x1E4FA6D90]] & 1) != 0
         || ([v7 isEqualToString:*MEMORY[0x1E4FA6DA0]] & 1) != 0
         || ([v7 isEqualToString:*MEMORY[0x1E4FA6DA8]] & 1) != 0)
  {
    uint64_t v10 = 4;
  }
  else
  {
    if (![v7 isEqualToString:*MEMORY[0x1E4FA6E48]]) {
      goto LABEL_24;
    }
    uint64_t v10 = 5;
  }
  uint64_t v11 = [v8 springboardPageNumberForBundleId:v6];
  id v30 = v7;
  id v31 = v6;
  double v29 = self;
  if (v9)
  {
    uint64_t v12 = 1;
  }
  else if ((unint64_t)(v11 + 1) > 6)
  {
    uint64_t v12 = 8;
  }
  else
  {
    uint64_t v12 = dword_1D142B730[v11 + 1];
  }
  unsigned int v13 = [v8 springboardPageNumbersWithAppPredictionPanels];
  unsigned int v14 = (void *)[v13 mutableCopy];

  id v15 = [v8 springboardPageNumbersWithSuggestionsWidgets];
  id v16 = (void *)[v15 mutableCopy];

  uint64_t v17 = *MEMORY[0x1E4F4B540];
  uint64_t v18 = [v14 containsIndex:*MEMORY[0x1E4F4B540]];
  uint64_t v19 = [v16 containsIndex:v17];
  [v14 removeIndex:v17];
  [v16 removeIndex:v17];
  uint64_t v20 = [v14 count];
  uint64_t v21 = [v16 count];
  id v22 = objc_opt_new();
  [v22 setCaptureType:v10];
  [v22 setIconLocation:v12];
  v23 = (void *)CFPreferencesCopyValue(@"SBSearchDisabledDomains", @"com.apple.spotlightui", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  uint64_t v24 = [v23 containsObject:@"DOMAIN_ZKWS"] ^ 1;

  [v22 setSpotlightEnabled:v24];
  v25 = (void *)CFPreferencesCopyAppValue(@"SuggestionsAppLibraryEnabled", @"com.apple.suggestions");
  uint64_t v26 = v25;
  if (v25) {
    uint64_t v27 = [v25 BOOLValue];
  }
  else {
    uint64_t v27 = 1;
  }

  [v22 setAppLibraryEnabled:v27];
  [v22 setAppPredictionPanelTodayEnabled:v18];
  [v22 setAppPredictionPanelEnabled:v20 != 0];
  [v22 setSuggestionsWidgetEnabled:v21 != 0];
  [v22 setSuggestionsWidgetTodayEnabled:v19];
  [(ATXPETEventTracker2Protocol *)v29->_tracker trackScalarForMessage:v22];
  id v28 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    -[_ATXAppLaunchMonitor _logAppLaunchOverallCaptureRateForBundleId:launchReason:]((uint64_t)v29, v22, v28);
  }

  id v7 = v30;
  id v6 = v31;
LABEL_24:
}

+ (void)_logAppLaunch:(id)a3 from:(unint64_t)a4
{
  id v10 = a3;
  id v5 = +[ATXAppLaunchLogger sharedInstance];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [v5 logAppLaunchFrom:a4 at:v6];

  if (a4 == 16)
  {
    id v7 = +[_ATXAggregateLogger sharedInstance];
    uint64_t v8 = 16;
LABEL_7:
    int v9 = ATXAppLaunchFromToString(v8);
    [v7 logAppLaunch:v9 bundleId:v10];

    goto LABEL_8;
  }
  if (([v10 isEqualToString:@"com.apple.camera"] & 1) != 0
    || ([v10 isEqualToString:@"com.apple.mobilephone"] & 1) != 0
    || [v10 isEqualToString:@"com.apple.Music"])
  {
    id v7 = +[_ATXAggregateLogger sharedInstance];
    uint64_t v8 = 22;
    goto LABEL_7;
  }
LABEL_8:
}

- (void)handleBacklightChangeNotificationWithValue:(int)a3 date:(id)a4
{
  id v7 = a4;
  sel_getName(a2);
  uint64_t v8 = (void *)os_transaction_create();
  history = self->_history;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72___ATXAppLaunchMonitor_handleBacklightChangeNotificationWithValue_date___block_invoke;
  v12[3] = &unk_1E68B0648;
  int v15 = a3;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [(_PASQueueLock *)history runAsyncWithLockAcquired:v12];
}

- (void)clearHistory
{
}

- (void)clearIntentHistogramHistory
{
}

- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5 reason:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  history = self->_history;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __67___ATXAppLaunchMonitor_addLaunchWithBundleId_date_timeZone_reason___block_invoke;
  v19[3] = &unk_1E68B06B0;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [(_PASQueueLock *)history runWithLockAcquired:v19];
}

- (void)_addLaunchWithLockWitness:(id)a3 bundleId:(id)a4 date:(id)a5 timeZone:(id)a6 reason:(id)a7 context:(id)a8
{
  v82[4] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = [v18 userContext];
  id v20 = [v19 lastAppLaunch];

  if (v20)
  {
    id v21 = (void *)*((void *)v13 + 6);
    id v22 = [v18 userContext];
    id v23 = [v22 lastAppLaunch];
    uint64_t v24 = [v21 launchSequenceForBundle:v23];
    [v24 addSubsequentLaunch:v14];

    [*((id *)v13 + 6) addBundleIdToLaunchSequence:v14 date:v15];
  }
  [*((id *)v13 + 4) addLaunchForBundleId:v14 date:v15];
  v25 = [*((id *)v13 + 5) histogramForLaunchType:0];
  [v25 addLaunchWithBundleId:v14 date:v15 timeZone:v16];

  uint64_t v26 = [*((id *)v13 + 5) histogramForLaunchType:5];
  [v26 addLaunchWithBundleId:v14 date:v15 timeZone:v16];

  uint64_t v27 = [*((id *)v13 + 5) histogramForLaunchType:2];
  [v27 addLaunchWithBundleId:v14 date:v15 timeZone:v16];

  id v28 = [v18 userContext];
  double v29 = [v28 lastUnlockDate];

  if (v29)
  {
    id v30 = [v18 userContext];
    id v31 = [v30 lastUnlockDate];
    [v15 timeIntervalSinceDate:v31];
    double v33 = v32;

    if (v33 >= 0.0)
    {
      if (v33 >= 3600.0) {
        double v33 = 3599.0;
      }
      int v34 = [*((id *)v13 + 5) histogramForLaunchType:11];
      [v34 addLaunchWithBundleId:v14 elapsedTime:v33];
    }
  }
  if (([v17 isEqualToString:*MEMORY[0x1E4FA6E38]] & 1) != 0
    || [v17 isEqualToString:*MEMORY[0x1E4FA6E48]])
  {
    [*((id *)v13 + 4) addSpotlightLaunchForBundleId:v14 date:v15];
    BOOL v35 = [*((id *)v13 + 5) histogramForLaunchType:1];
    [v35 addLaunchWithBundleId:v14 date:v15 timeZone:v16];
  }
  if ([v17 isEqualToString:*MEMORY[0x1E4FA6E00]])
  {
    unint64_t v36 = [*((id *)v13 + 5) histogramForLaunchType:92];
    [v36 addLaunchWithBundleId:v14 date:v15 timeZone:v16];
  }
  if (([v17 isEqualToString:*MEMORY[0x1E4FA6DA8]] & 1) != 0
    || ([v17 isEqualToString:*MEMORY[0x1E4FA6D88]] & 1) != 0
    || ([v17 isEqualToString:*MEMORY[0x1E4FA6D98]] & 1) != 0
    || ([v17 isEqualToString:*MEMORY[0x1E4FA6D90]] & 1) != 0
    || [v17 isEqualToString:*MEMORY[0x1E4FA6DA0]])
  {
    uint64_t v37 = [*((id *)v13 + 5) histogramForLaunchType:93];
    [v37 addLaunchWithBundleId:v14 date:v15 timeZone:v16];
  }
  unint64_t v38 = [v18 deviceStateContext];
  int v39 = [v38 inAirplaneMode];

  if (v39)
  {
    id v40 = [*((id *)v13 + 5) histogramForLaunchType:3];
    [v40 addLaunchWithBundleId:v14 date:v15 timeZone:v16];
  }
  __int16 v41 = [v18 deviceStateContext];
  unint64_t v42 = [v41 wifiSSID];

  if ([v42 length])
  {
    unint64_t v43 = [*((id *)v13 + 5) categoricalHistogramForLaunchType:4];
    [v43 addLaunchWithBundleId:v14 date:v15 category:v42];
  }
  v80 = v42;
  id v44 = (void *)*((void *)v13 + 1);
  if (v44)
  {
    v82[0] = v14;
    id v45 = v17;
    if (!v17)
    {
      id v45 = [MEMORY[0x1E4F1CA98] null];
    }
    v82[1] = v45;
    v82[2] = v15;
    id v46 = v16;
    if (!v16)
    {
      id v46 = [MEMORY[0x1E4F1CA98] null];
    }
    v82[3] = v46;
    id v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:4];
    [v44 addObject:v47];

    if (v16)
    {
      if (v17) {
        goto LABEL_30;
      }
    }
    else
    {

      if (v17) {
        goto LABEL_30;
      }
    }
  }
LABEL_30:
  v81 = v17;
  id v48 = v16;
  id v49 = [v18 ambientLightContext];
  uint64_t v50 = [v49 ambientLightType];

  if (v50 != 7)
  {
    id v51 = [*((id *)v13 + 5) categoricalHistogramForLaunchType:41];
    v52 = [NSNumber numberWithInt:v50];
    uint64_t v53 = [v52 stringValue];
    [v51 addLaunchWithBundleId:v14 date:v15 category:v53];
  }
  id v54 = (void *)MEMORY[0x1E4F93608];
  v55 = [v18 locationMotionContext];
  v79 = objc_msgSend(v54, "getMotionStringFromMotionType:", objc_msgSend(v55, "motionType"));

  v56 = [*((id *)v13 + 5) categoricalHistogramForLaunchType:37];
  [v56 addLaunchWithBundleId:v14 date:v15 category:v79];

  v78 = +[_ATXActionUtils stringForTimeOfDayAndDayOfWeek:v15 timeZone:0];
  v57 = [*((id *)v13 + 5) categoricalHistogramForLaunchType:42];
  [v57 addLaunchWithBundleId:v14 date:v15 category:v78];

  v58 = [v18 locationMotionContext];
  v77 = +[_ATXActionUtils stringForCoarseTimePOWLocation:timeZone:coarseGeohash:](_ATXActionUtils, "stringForCoarseTimePOWLocation:timeZone:coarseGeohash:", v15, 0, [v58 coarseGeohash]);

  v59 = [v18 locationMotionContext];
  v76 = +[_ATXActionUtils stringForSpecificTimeDOWLocation:timeZone:geohash:](_ATXActionUtils, "stringForSpecificTimeDOWLocation:timeZone:geohash:", v15, 0, [v59 geohash]);

  v60 = [*((id *)v13 + 5) categoricalHistogramForLaunchType:43];
  [v60 addLaunchWithBundleId:v14 date:v15 category:v77];

  v61 = [*((id *)v13 + 5) categoricalHistogramForLaunchType:44];
  [v61 addLaunchWithBundleId:v14 date:v15 category:v76];

  v62 = [v18 locationMotionContext];
  v63 = +[_ATXActionUtils stringForCoarseGeohash:](_ATXActionUtils, "stringForCoarseGeohash:", [v62 coarseGeohash]);

  v64 = [v18 locationMotionContext];
  v65 = +[_ATXActionUtils stringForSpecificGeohash:](_ATXActionUtils, "stringForSpecificGeohash:", [v64 geohash]);

  [v18 locationMotionContext];
  v66 = v75 = v18;
  v67 = +[_ATXActionUtils stringForZoom7Geohash:](_ATXActionUtils, "stringForZoom7Geohash:", [v66 largeGeohash]);

  v68 = [*((id *)v13 + 5) categoricalHistogramForLaunchType:50];
  [v68 addLaunchWithBundleId:v14 date:v15 category:v65];

  v69 = [*((id *)v13 + 5) categoricalHistogramForLaunchType:51];
  [v69 addLaunchWithBundleId:v14 date:v15 category:v63];

  v70 = [*((id *)v13 + 5) categoricalHistogramForLaunchType:61];
  [v70 addLaunchWithBundleId:v14 date:v15 category:v67];

  v71 = +[_ATXActionUtils stringForTwoHourTimeWindow:v15 timeZone:v16];
  v72 = [*((id *)v13 + 5) categoricalHistogramForLaunchType:52];
  [v72 addLaunchWithBundleId:v14 date:v15 category:v71];

  v73 = [*((id *)v13 + 8) currentPoiCategory];
  v74 = [*((id *)v13 + 5) categoricalHistogramForLaunchType:95];
  [v74 addLaunchWithBundleId:v14 date:v15 category:v73];
}

- (void)stop
{
}

- (void)startDeltaRecording
{
}

- (id)stopDeltaRecording
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__45;
  id v10 = __Block_byref_object_dispose__45;
  id v11 = 0;
  history = self->_history;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42___ATXAppLaunchMonitor_stopDeltaRecording__block_invoke;
  v5[3] = &unk_1E68B0420;
  v5[4] = &v6;
  [(_PASQueueLock *)history runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)dealloc
{
  [(_ATXAppLaunchMonitor *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)_ATXAppLaunchMonitor;
  [(_ATXAppLaunchMonitor *)&v3 dealloc];
}

- (id)appInfoManager
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__45;
  id v10 = __Block_byref_object_dispose__45;
  id v11 = 0;
  history = self->_history;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38___ATXAppLaunchMonitor_appInfoManager__block_invoke;
  v5[3] = &unk_1E68B0420;
  v5[4] = &v6;
  [(_PASQueueLock *)history runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)appLaunchHistogramManager
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__45;
  id v10 = __Block_byref_object_dispose__45;
  id v11 = 0;
  history = self->_history;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49___ATXAppLaunchMonitor_appLaunchHistogramManager__block_invoke;
  v5[3] = &unk_1E68B0420;
  v5[4] = &v6;
  [(_PASQueueLock *)history runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)appLaunchSequenceManager
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__45;
  id v10 = __Block_byref_object_dispose__45;
  id v11 = 0;
  history = self->_history;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48___ATXAppLaunchMonitor_appLaunchSequenceManager__block_invoke;
  v5[3] = &unk_1E68B0420;
  v5[4] = &v6;
  [(_PASQueueLock *)history runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)swapDuetHelper:(id)a3
{
  id v4 = a3;
  history = self->_history;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39___ATXAppLaunchMonitor_swapDuetHelper___block_invoke;
  v7[3] = &unk_1E68B06D8;
  id v8 = v4;
  id v6 = v4;
  [(_PASQueueLock *)history runAsyncWithLockAcquired:v7];
}

- (id)dailyDose
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__45;
  id v10 = __Block_byref_object_dispose__45;
  id v11 = 0;
  history = self->_history;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33___ATXAppLaunchMonitor_dailyDose__block_invoke;
  v5[3] = &unk_1E68B0420;
  v5[4] = &v6;
  [(_PASQueueLock *)history runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_syncForTests
{
  dispatch_sync((dispatch_queue_t)self->_logQueue, &__block_literal_global_168);
  appLaunchHistoryQueue = self->_appLaunchHistoryQueue;
  dispatch_sync(appLaunchHistoryQueue, &__block_literal_global_170);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionUpdateBlacklist, 0);
  objc_storeStrong((id *)&self->_appIconState, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_appClipChangeListener, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_cdContext, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_logQueue, 0);
  objc_storeStrong((id *)&self->_appLaunchHistoryQueue, 0);
}

- (void)initWithAppInfoManager:appLaunchHistogramManager:appLaunchSequenceManager:appDailyDose:duetHelper:contextBuilder:tracker:predictionUpdateBlacklist:heroPoiManager:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEBUG, "_ATXAppLaunchMonitor initialized", v1, 2u);
}

- (void)handleAppOrClipLaunchNotificationForBundleId:poweringAppClipBundleId:urlHash:isClip:appLaunchReason:appClipLaunchReason:date:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1D0FA3000, v0, v1, "Ignoring app launch with nil or empty value for bundleId (\"%@\") and launchReason of \"%@\")");
}

+ (void)_logPredictionForBundleId:poweringAppClipBundleId:urlHash:isClip:appLaunchReason:appClipLaunchReason:consumerType:consumerSubType:context:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "No launch reason provided for launch.", v2, v3, v4, v5, v6);
}

+ (void)_logPredictionForBundleId:(void *)a1 poweringAppClipBundleId:(NSObject *)a2 urlHash:isClip:appLaunchReason:appClipLaunchReason:consumerType:consumerSubType:context:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 error];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "No results predicted. Error: %@", (uint8_t *)&v4, 0xCu);
}

- (void)_logAppLaunchOverallCaptureRateForBundleId:(NSObject *)a3 launchReason:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [a2 captureType];
  if (v7 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = off_1E68B06F8[(int)v7];
  }
  int v9 = v8;
  uint64_t v10 = [a2 iconLocation];
  if (v10 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = off_1E68B0748[(int)v10];
  }
  *(_DWORD *)buf = 138414338;
  id v13 = v6;
  __int16 v14 = 2112;
  id v15 = v9;
  __int16 v16 = 2112;
  id v17 = v11;
  __int16 v18 = 1024;
  int v19 = [a2 spotlightEnabled];
  __int16 v20 = 1024;
  int v21 = [a2 appLibraryEnabled];
  __int16 v22 = 1024;
  int v23 = [a2 appPredictionPanelEnabled];
  __int16 v24 = 1024;
  int v25 = [a2 appPredictionPanelTodayEnabled];
  __int16 v26 = 1024;
  int v27 = [a2 suggestionsWidgetEnabled];
  __int16 v28 = 1024;
  int v29 = [a2 suggestionsWidgetTodayEnabled];
  _os_log_debug_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBAppLaunchOverallCaptureRateTracker with captureType: %@, iconLocation: %@, spotlightEnabled: %u, appLibraryEnabled: %u, hasAppPanel: %u, hasAppPanelToday: %u, suggestionsWidgetEnabled: %u, suggestionsWidgetTodayEnabled: %u", buf, 0x44u);
}

@end