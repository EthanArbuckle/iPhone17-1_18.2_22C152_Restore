@interface BRRTCPairingReportManager
- (BOOL)_eventClearedForRecord:(unint64_t)a3;
- (BOOL)metricBusy;
- (BOOL)pairingMetricSetup;
- (BRRTCPairingMetric)pairingMetric;
- (BRRTCPairingReportManager)initWithPairingBeginsType:(unint64_t)a3;
- (BRSetupControllerTracker)setupControllerTracker;
- (NSMutableArray)pendingEvents;
- (NSMutableDictionary)openPairingTimeEvents;
- (NSString)currentPairingMetricID;
- (NSURL)currentPairingMetricBridgePlistPath;
- (OS_dispatch_queue)queue;
- (id)_trimPrecision:(id)a3;
- (id)archivePairingMetric;
- (id)combineMetricPlistsForArchive:(id)a3;
- (id)deltaForControllerAction:(id)a3;
- (id)pendingMetricSubmission;
- (id)truncateSetupControllerClassName:(id)a3;
- (void)_addEvent:(unint64_t)a3 withValue:(id)a4 withError:(id)a5;
- (void)_addEventToPendingQueue:(unint64_t)a3 withValue:(id)a4;
- (void)_cleanupAfterWrite;
- (void)_writeToPairingPlist:(id)a3 withValue:(id)a4;
- (void)addMetaKeys;
- (void)addPendingEventToMetric;
- (void)archivePairingMetric:(id)a3 withCompletion:(id)a4;
- (void)checkInWithClosingPairingTimeEvent:(unint64_t)a3;
- (void)checkInWithController:(id)a3 action:(unint64_t)a4;
- (void)checkInWithOpenPairingTimeEvent:(unint64_t)a3;
- (void)checkInWithRUIController:(id)a3;
- (void)cleanUpMetricDirectoryWithCompletion:(id)a3;
- (void)clearPendingEventQueue;
- (void)completeMetricForAppTermination;
- (void)completePairingMetricWithSuccess:(BOOL)a3;
- (void)completeRTCPairingMetricForMetricID:(id)a3 withSuccess:(id)a4;
- (void)createPairingReportPlistWithPairingType:(unint64_t)a3;
- (void)flagForAutomation;
- (void)initializeEndToEndMetric;
- (void)recordSetupController:(id)a3 action:(unint64_t)a4;
- (void)setArchivePairingMetric:(id)a3;
- (void)setCurrentPairingMetricBridgePlistPath:(id)a3;
- (void)setCurrentPairingMetricID:(id)a3;
- (void)setMetricBusy:(BOOL)a3;
- (void)setOpenPairingTimeEvents:(id)a3;
- (void)setPairingMetric:(id)a3;
- (void)setPairingMetricSetup:(BOOL)a3;
- (void)setPendingEvents:(id)a3;
- (void)setPendingMetricSubmission:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSetupControllerTracker:(id)a3;
- (void)setupPairingMetric:(unint64_t)a3;
- (void)submitAnyPendingMetrics;
- (void)writeDeltasForSetupControllerActions:(id)a3 action:(unint64_t)a4;
- (void)writePushOrHoldToPairingPlist:(id)a3 action:(unint64_t)a4;
@end

@implementation BRRTCPairingReportManager

- (BRRTCPairingReportManager)initWithPairingBeginsType:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BRRTCPairingReportManager;
  v4 = [(BRRTCPairingReportManager *)&v11 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.BRPairingReport", 0);
    [(BRRTCPairingReportManager *)v4 setQueue:v5];

    v6 = [(BRRTCPairingReportManager *)v4 queue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__BRRTCPairingReportManager_initWithPairingBeginsType___block_invoke;
    v8[3] = &unk_264763620;
    v9 = v4;
    unint64_t v10 = a3;
    dispatch_async(v6, v8);
  }
  return v4;
}

uint64_t __55__BRRTCPairingReportManager_initWithPairingBeginsType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setupPairingMetric:*(void *)(a1 + 40)];
}

- (void)_addEvent:(unint64_t)a3 withValue:(id)a4 withError:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  [(BRRTCPairingReportManager *)self setMetricBusy:1];
  v8 = br_metriccollection_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = BRPairingTimeEventToString(a3);
    *(_DWORD *)buf = 136315650;
    v17 = "-[BRRTCPairingReportManager _addEvent:withValue:withError:]";
    __int16 v18 = 2112;
    v19 = v9;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_225AD1000, v8, OS_LOG_TYPE_DEFAULT, "%s adding event %@ with value %@", buf, 0x20u);
  }
  if ([(BRRTCPairingReportManager *)self _eventClearedForRecord:a3])
  {
    unint64_t v10 = BRPairingTimeEventToString(a3);
    objc_super v11 = [(BRRTCPairingReportManager *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__BRRTCPairingReportManager__addEvent_withValue_withError___block_invoke;
    block[3] = &unk_264763648;
    block[4] = self;
    id v14 = v10;
    id v15 = v7;
    v12 = v10;
    dispatch_async(v11, block);
  }
  else
  {
    [(BRRTCPairingReportManager *)self _addEventToPendingQueue:a3 withValue:v7];
    v12 = br_metriccollection_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[BRRTCPairingReportManager _addEvent:withValue:withError:]";
      _os_log_impl(&dword_225AD1000, v12, OS_LOG_TYPE_DEFAULT, "%s pairing metric reporter not set up yet", buf, 0xCu);
    }
  }
}

uint64_t __59__BRRTCPairingReportManager__addEvent_withValue_withError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _writeToPairingPlist:*(void *)(a1 + 40) withValue:*(void *)(a1 + 48)];
}

- (void)checkInWithOpenPairingTimeEvent:(unint64_t)a3
{
  if ([(BRRTCPairingReportManager *)self pairingMetricSetup])
  {
    dispatch_queue_t v5 = [NSNumber numberWithDouble:CACurrentMediaTime()];
    v6 = BRPairingTimeEventToString(a3);
    id v7 = [(BRRTCPairingReportManager *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__BRRTCPairingReportManager_checkInWithOpenPairingTimeEvent___block_invoke;
    block[3] = &unk_264763648;
    block[4] = self;
    id v11 = v5;
    id v12 = v6;
    id v8 = v6;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

void __61__BRRTCPairingReportManager_checkInWithOpenPairingTimeEvent___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) openPairingTimeEvents];
  [v2 setValue:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (void)checkInWithClosingPairingTimeEvent:(unint64_t)a3
{
  dispatch_queue_t v5 = [(BRRTCPairingReportManager *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__BRRTCPairingReportManager_checkInWithClosingPairingTimeEvent___block_invoke;
  v6[3] = &unk_264763620;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __64__BRRTCPairingReportManager_checkInWithClosingPairingTimeEvent___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (![*(id *)(a1 + 32) pairingMetricSetup]) {
    return;
  }
  id v2 = [NSNumber numberWithDouble:CACurrentMediaTime()];
  v3 = BRPairingTimeEventToString(*(void *)(a1 + 40));
  v4 = [*(id *)(a1 + 32) openPairingTimeEvents];
  dispatch_queue_t v5 = [v4 objectForKey:v3];

  if (!v5)
  {
    unint64_t v6 = *(void *)(a1 + 40);
    if (v6 <= 0x26)
    {
      if (((1 << v6) & 0x1084000000) != 0)
      {
        id v7 = [*(id *)(a1 + 32) openPairingTimeEvents];
        uint64_t v8 = 21;
        goto LABEL_8;
      }
      if (((1 << v6) & 0x4210000000) != 0)
      {
        id v7 = [*(id *)(a1 + 32) openPairingTimeEvents];
        uint64_t v8 = 23;
LABEL_8:
        id v9 = BRPairingTimeEventToString(v8);
        dispatch_queue_t v5 = [v7 objectForKey:v9];
      }
    }
  }
  unint64_t v10 = br_metriccollection_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315650;
    __int16 v18 = "-[BRRTCPairingReportManager checkInWithClosingPairingTimeEvent:]_block_invoke";
    __int16 v19 = 2112;
    __int16 v20 = v5;
    __int16 v21 = 2112;
    uint64_t v22 = v2;
    _os_log_impl(&dword_225AD1000, v10, OS_LOG_TYPE_DEFAULT, "%s Open start time: %@ closing end time: %@", (uint8_t *)&v17, 0x20u);
  }

  if (v5)
  {
    id v11 = NSNumber;
    [v2 doubleValue];
    double v13 = v12;
    [v5 doubleValue];
    id v15 = [v11 numberWithDouble:v13 - v14];
    [*(id *)(a1 + 32) addPairingTimeEventToPairingReportPlist:*(void *)(a1 + 40) withValue:v15 withError:0];
    v16 = [*(id *)(a1 + 32) openPairingTimeEvents];
    [v16 removeObjectForKey:v3];
  }
  else
  {
    id v15 = br_metriccollection_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      __int16 v18 = "-[BRRTCPairingReportManager checkInWithClosingPairingTimeEvent:]_block_invoke";
      __int16 v19 = 2112;
      __int16 v20 = v3;
      _os_log_impl(&dword_225AD1000, v15, OS_LOG_TYPE_DEFAULT, "%s No matching opening timed event for event %@", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (void)checkInWithController:(id)a3 action:(unint64_t)a4
{
  id v6 = [(BRRTCPairingReportManager *)self truncateSetupControllerClassName:a3];
  [(BRRTCPairingReportManager *)self recordSetupController:v6 action:a4];
}

- (void)checkInWithRUIController:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_queue_t v5 = [v4 pageElement];
  id v6 = [v5 title];
  char v7 = [v6 isEqualToString:@"Terms and Conditions"];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = [v4 objectModel];
    id v9 = [v8 sourceURL];

    unint64_t v10 = [v9 host];
    id v11 = [v9 path];
    double v12 = [v10 stringByReplacingOccurrencesOfString:@"." withString:@"_"];
    double v13 = [v11 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    double v14 = [NSString stringWithFormat:@"%@%@", v12, v13];
    id v15 = br_metriccollection_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v18 = v9;
      _os_log_impl(&dword_225AD1000, v15, OS_LOG_TYPE_DEFAULT, "Checking in RUIController with url: %{public}@", buf, 0xCu);
    }

    v16 = [NSString stringWithFormat:@"RUIPage_%@", v14];
    [(BRRTCPairingReportManager *)self recordSetupController:v16 action:0];
  }
}

- (void)recordSetupController:(id)a3 action:(unint64_t)a4
{
  id v9 = a3;
  id v6 = [(BRRTCPairingReportManager *)self setupControllerTracker];

  if (v6)
  {
    [(BRRTCPairingReportManager *)self writeDeltasForSetupControllerActions:v9 action:a4];
  }
  else
  {
    char v7 = objc_alloc_init(BRSetupControllerTracker);
    [(BRRTCPairingReportManager *)self setSetupControllerTracker:v7];
  }
  uint64_t v8 = [(BRRTCPairingReportManager *)self setupControllerTracker];
  [v8 addSetupController:v9 action:a4];

  [(BRRTCPairingReportManager *)self writePushOrHoldToPairingPlist:v9 action:a4];
}

- (void)writeDeltasForSetupControllerActions:(id)a3 action:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v7 = [(BRRTCPairingReportManager *)self setupControllerTracker];
  uint64_t v8 = [v7 holdControllerDetails];

  id v9 = [(BRRTCPairingReportManager *)self setupControllerTracker];
  unint64_t v10 = [v9 lastPushedSetupController];

  id v11 = @"Hold";
  if (!a4) {
    id v11 = @"Push";
  }
  double v12 = v11;
  if (v8)
  {
    double v13 = [v8 timeStamp];
    double v14 = [(BRRTCPairingReportManager *)self deltaForControllerAction:v13];

    id v15 = NSString;
    v16 = [v8 controllerName];
    int v17 = [v15 stringWithFormat:@"%@HoldBefore%@%@Delta", v16, v6, v12];

    if (!v10) {
      goto LABEL_10;
    }
  }
  else
  {
    double v14 = 0;
    int v17 = 0;
    if (!v10) {
      goto LABEL_10;
    }
  }
  if (!v14)
  {
    __int16 v18 = [v10 timeStamp];
    double v14 = [(BRRTCPairingReportManager *)self deltaForControllerAction:v18];

    uint64_t v19 = NSString;
    __int16 v20 = [v10 controllerName];
    __int16 v21 = [v19 stringWithFormat:@"%@To%@%@Delta", v20, v6, v12];

    if (![(__CFString *)v21 isEqualToString:@"COSSetupFinishedToCOSWelcomeToAppleWatchPushDelta"])
    {
      int v17 = v21;
      if (v14) {
        goto LABEL_11;
      }
      goto LABEL_13;
    }

    int v17 = @"InitialSyncTime";
  }
LABEL_10:
  if (v14)
  {
LABEL_11:
    uint64_t v22 = [(BRRTCPairingReportManager *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__BRRTCPairingReportManager_writeDeltasForSetupControllerActions_action___block_invoke;
    block[3] = &unk_264763648;
    block[4] = self;
    v25 = v17;
    id v26 = v14;
    dispatch_async(v22, block);

    goto LABEL_16;
  }
LABEL_13:
  uint64_t v23 = br_metriccollection_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v6;
    __int16 v29 = 2048;
    unint64_t v30 = a4;
    _os_log_impl(&dword_225AD1000, v23, OS_LOG_TYPE_DEFAULT, "no previous controller details to create delta, will not record delta for controller: %@ action: %lu", buf, 0x16u);
  }

LABEL_16:
}

uint64_t __73__BRRTCPairingReportManager_writeDeltasForSetupControllerActions_action___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _writeToPairingPlist:*(void *)(a1 + 40) withValue:*(void *)(a1 + 48)];
}

- (id)deltaForControllerAction:(id)a3
{
  v3 = NSNumber;
  id v4 = a3;
  dispatch_queue_t v5 = [v3 numberWithDouble:CACurrentMediaTime()];
  id v6 = NSNumber;
  [v5 doubleValue];
  double v8 = v7;
  [v4 doubleValue];
  double v10 = v9;

  id v11 = [v6 numberWithDouble:v8 - v10];

  return v11;
}

- (void)writePushOrHoldToPairingPlist:(id)a3 action:(unint64_t)a4
{
  id v6 = a3;
  double v7 = [(BRRTCPairingReportManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__BRRTCPairingReportManager_writePushOrHoldToPairingPlist_action___block_invoke;
  block[3] = &unk_264763670;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __66__BRRTCPairingReportManager_writePushOrHoldToPairingPlist_action___block_invoke(uint64_t a1)
{
  id v2 = NSNumber;
  v3 = [*(id *)(a1 + 32) setupControllerTracker];
  id v4 = [v3 lastPushedSetupController];
  dispatch_queue_t v5 = [v4 controllerOrder];
  unsigned int v6 = [v5 intValue];
  if (*(void *)(a1 + 48) == 1) {
    uint64_t v7 = v6 + 1;
  }
  else {
    uint64_t v7 = v6;
  }
  id v8 = [v2 numberWithInt:v7];

  int v9 = [v8 isEqualToNumber:&unk_26D9304A8];
  id v10 = &unk_26D9304C0;
  if (!v9) {
    id v10 = v8;
  }
  id v11 = v10;

  if (*(void *)(a1 + 48)) {
    double v12 = @"Hold";
  }
  else {
    double v12 = @"Pushed";
  }
  id v14 = [NSString stringWithFormat:@"%@ControllerNumber%@", v12, v11];

  double v13 = [NSString stringWithFormat:@"%@", *(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _writeToPairingPlist:v14 withValue:v13];
}

- (void)_writeToPairingPlist:(id)a3 withValue:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BRRTCPairingReportManager *)self queue];
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    if ((BRIsInternalInstall() & 1) == 0)
    {
      int v9 = br_metriccollection_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_225AD1000, v9, OS_LOG_TYPE_DEFAULT, "external device, trimming precision", buf, 2u);
      }

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [(BRRTCPairingReportManager *)self _trimPrecision:v7];

        id v7 = (id)v10;
      }
    }
    id v11 = [(BRRTCPairingReportManager *)self currentPairingMetricBridgePlistPath];
    double v12 = [MEMORY[0x263EFF9A0] dictionaryWithContentsOfURL:v11];
    [v12 setObject:v7 forKey:v6];
    double v13 = [v11 relativePath];
    [v12 writeToFile:v13 atomically:1];

    id v14 = br_metriccollection_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_225AD1000, v14, OS_LOG_TYPE_DEFAULT, "Posting notification that a metric has changed! %@", buf, 0xCu);
    }

    id v15 = [MEMORY[0x263F08A00] defaultCenter];
    __int16 v18 = @"BRChangedMetricKey";
    id v19 = v6;
    v16 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    [v15 postNotificationName:@"BRPairingMetricChangedNotification" object:0 userInfo:v16];

    [(BRRTCPairingReportManager *)self _cleanupAfterWrite];
  }
  else
  {
    int v17 = br_metriccollection_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_225AD1000, v17, OS_LOG_TYPE_DEFAULT, "No value for pairing metric event %@, skipping write", buf, 0xCu);
    }

    [(BRRTCPairingReportManager *)self _cleanupAfterWrite];
  }
}

- (void)_cleanupAfterWrite
{
  [(BRRTCPairingReportManager *)self setMetricBusy:0];

  [(BRRTCPairingReportManager *)self submitAnyPendingMetrics];
}

- (id)truncateSetupControllerClassName:(id)a3
{
  id v3 = a3;
  id v4 = @"ViewController";
  if (([v3 containsString:@"ViewController"] & 1) != 0
    || (v4 = @"Controller", dispatch_queue_t v5 = v3, [v3 containsString:@"Controller"]))
  {
    dispatch_queue_t v5 = objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - -[__CFString length](v4, "length"));
  }

  return v5;
}

- (BOOL)_eventClearedForRecord:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(BRRTCPairingReportManager *)self pairingMetricSetup]
    && ([(BRRTCPairingReportManager *)self currentPairingMetricBridgePlistPath],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = (void *)v5;
    id v7 = BRPairingTimeEventToString(a3);

    if (v7)
    {
      id v8 = [(BRRTCPairingReportManager *)self currentPairingMetricBridgePlistPath];
      int v9 = [MEMORY[0x263EFF9A0] dictionaryWithContentsOfURL:v8];
      uint64_t v10 = BRPairingTimeEventToString(a3);
      if ([v10 isEqualToString:@"WatchActivated"]
        && ([v9 objectForKey:@"StartedActivation"],
            id v11 = objc_claimAutoreleasedReturnValue(),
            v11,
            !v11))
      {
        id v7 = br_metriccollection_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 136315138;
          id v14 = "-[BRRTCPairingReportManager _eventClearedForRecord:]";
          _os_log_impl(&dword_225AD1000, v7, OS_LOG_TYPE_DEFAULT, "%s watch activation finished before beginning. This is unexpected, and we will not add the finished key", (uint8_t *)&v13, 0xCu);
        }

        LOBYTE(v7) = 0;
      }
      else
      {
        LOBYTE(v7) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return (char)v7;
}

- (void)completePairingMetricWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BRRTCPairingReportManager *)self pairingMetricSetup])
  {
    if (v3)
    {
      [(BRRTCPairingReportManager *)self addPairingTimeEventToPairingReportPlist:16 withValue:MEMORY[0x263EFFA88] withError:0];
      [(BRRTCPairingReportManager *)self checkInWithClosingPairingTimeEvent:17];
    }
    uint64_t v5 = [(BRRTCPairingReportManager *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__BRRTCPairingReportManager_completePairingMetricWithSuccess___block_invoke;
    block[3] = &unk_2647636B8;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

uint64_t __62__BRRTCPairingReportManager_completePairingMetricWithSuccess___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeRTCPairingMetricForMetricID:0 withSuccess:&__block_literal_global];
}

void __62__BRRTCPairingReportManager_completePairingMetricWithSuccess___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = br_metriccollection_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_impl(&dword_225AD1000, v5, OS_LOG_TYPE_DEFAULT, "sent metric to NR for RTC submission with success: %{BOOL}d error: %@", (uint8_t *)v6, 0x12u);
  }
}

- (void)completeMetricForAppTermination
{
  BOOL v3 = [(BRRTCPairingReportManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__BRRTCPairingReportManager_completeMetricForAppTermination__block_invoke;
  block[3] = &unk_2647636B8;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __60__BRRTCPairingReportManager_completeMetricForAppTermination__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) addPairingTimeEventToPairingReportPlist:67 withValue:MEMORY[0x263EFFA88] withError:0];
  id v2 = objc_opt_new();
  BOOL v3 = [*(id *)(a1 + 32) openPairingTimeEvents];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __60__BRRTCPairingReportManager_completeMetricForAppTermination__block_invoke_2;
  uint64_t v10 = &unk_2647636E0;
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v11 = v4;
  uint64_t v12 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:&v7];

  if (objc_msgSend(v4, "count", v7, v8, v9, v10))
  {
    id v6 = br_metriccollection_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_225AD1000, v6, OS_LOG_TYPE_DEFAULT, "Bridge terminated: writing orphaned timing metrics %@", buf, 0xCu);
    }
  }
}

void __60__BRRTCPairingReportManager_completeMetricForAppTermination__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [NSNumber numberWithDouble:CACurrentMediaTime()];
    uint64_t v8 = NSNumber;
    [v7 doubleValue];
    double v10 = v9;
    [v6 doubleValue];
    uint64_t v12 = [v8 numberWithDouble:v10 - v11];
    int v13 = [NSString stringWithFormat:@"OrphanedTimedMetric%@", v5];
    [*(id *)(a1 + 32) addObject:v13];
    [*(id *)(a1 + 40) _writeToPairingPlist:v13 withValue:v12];
  }
  else
  {
    id v14 = br_metriccollection_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_225AD1000, v14, OS_LOG_TYPE_DEFAULT, "No matching opening timed event for event %@", buf, 0xCu);
    }
  }
}

- (void)submitAnyPendingMetrics
{
  objc_initWeak(&location, self);
  BOOL v3 = [(BRRTCPairingReportManager *)self pendingMetricSubmission];

  if (v3)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __52__BRRTCPairingReportManager_submitAnyPendingMetrics__block_invoke;
    v4[3] = &unk_264763708;
    objc_copyWeak(&v5, &location);
    [(BRRTCPairingReportManager *)self completeRTCPairingMetricForMetricID:0 withSuccess:v4];
    objc_destroyWeak(&v5);
  }
  objc_destroyWeak(&location);
}

void __52__BRRTCPairingReportManager_submitAnyPendingMetrics__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained pendingMetricSubmission];
    ((void (**)(void, uint64_t, id))v7)[2](v7, a2, v8);

    [v6 setPendingMetricSubmission:0];
  }
}

- (void)setupPairingMetric:(unint64_t)a3
{
  id v5 = [(BRRTCPairingReportManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = br_metriccollection_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_225AD1000, v6, OS_LOG_TYPE_DEFAULT, "Setting up pairing metric", (uint8_t *)buf, 2u);
  }

  [(BRRTCPairingReportManager *)self setPairingMetricSetup:0];
  objc_initWeak(buf, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__BRRTCPairingReportManager_setupPairingMetric___block_invoke;
  v7[3] = &unk_264763758;
  v7[4] = self;
  objc_copyWeak(v8, buf);
  v8[1] = (id)a3;
  [(BRRTCPairingReportManager *)self cleanUpMetricDirectoryWithCompletion:v7];
  objc_destroyWeak(v8);
  objc_destroyWeak(buf);
}

void __48__BRRTCPairingReportManager_setupPairingMetric___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__BRRTCPairingReportManager_setupPairingMetric___block_invoke_2;
  v9[3] = &unk_264763730;
  objc_copyWeak(v11, (id *)(a1 + 40));
  char v12 = a2;
  uint64_t v7 = *(void **)(a1 + 48);
  id v10 = v5;
  v11[1] = v7;
  id v8 = v5;
  dispatch_async(v6, v9);

  objc_destroyWeak(v11);
}

void __48__BRRTCPairingReportManager_setupPairingMetric___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      [WeakRetained createPairingReportPlistWithPairingType:*(void *)(a1 + 48)];
      [v3 setPairingMetricSetup:1];
      [v3 addPendingEventToMetric];
      id v4 = objc_opt_new();
      [v3 setOpenPairingTimeEvents:v4];

      [v3 initializeEndToEndMetric];
      [v3 flagForAutomation];
      [v3 addMetaKeys];
    }
    else
    {
      id v5 = br_metriccollection_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        int v7 = 138412290;
        uint64_t v8 = v6;
        _os_log_impl(&dword_225AD1000, v5, OS_LOG_TYPE_DEFAULT, "Failed to cleanup metric folder with error %@", (uint8_t *)&v7, 0xCu);
      }

      [v3 setPairingMetricSetup:0];
      [v3 clearPendingEventQueue];
    }
  }
}

- (void)initializeEndToEndMetric
{
  [(BRRTCPairingReportManager *)self addPairingTimeEventToPairingReportPlist:16 withValue:MEMORY[0x263EFFA80] withError:0];

  [(BRRTCPairingReportManager *)self checkInWithOpenPairingTimeEvent:17];
}

- (void)flagForAutomation
{
  if (BRAutomation())
  {
    uint64_t v3 = MEMORY[0x263EFFA88];
    [(BRRTCPairingReportManager *)self addPairingTimeEventToPairingReportPlist:50 withValue:v3 withError:0];
  }
}

- (void)addMetaKeys
{
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  uint64_t v3 = [MEMORY[0x263F57730] sharedInstance];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __40__BRRTCPairingReportManager_addMetaKeys__block_invoke;
  v12[3] = &unk_264763780;
  v12[4] = v15;
  v12[5] = v14;
  v12[6] = v13;
  id v4 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v12];

  id v5 = [(BRRTCPairingReportManager *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__BRRTCPairingReportManager_addMetaKeys__block_invoke_2;
  v7[3] = &unk_2647637A8;
  v7[4] = self;
  id v8 = v4;
  uint64_t v9 = v14;
  id v10 = v15;
  double v11 = v13;
  id v6 = v4;
  dispatch_async(v5, v7);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v15, 8);
}

uint64_t __40__BRRTCPairingReportManager_addMetaKeys__block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 valueForProperty:*MEMORY[0x263F575B8]];
  int v5 = [v4 BOOLValue];

  if (v5) {
    ++*(void *)(*(void *)(a1[4] + 8) + 24);
  }
  id v6 = [v3 valueForProperty:*MEMORY[0x263F575D0]];
  uint64_t v7 = [v6 BOOLValue];

  if (v7)
  {
    id v8 = [v3 valueForProperty:*MEMORY[0x263F575B0]];
    int v9 = [v8 BOOLValue];

    if (v9) {
      ++*(void *)(*(void *)(a1[5] + 8) + 24);
    }
    id v10 = [v3 valueForProperty:*MEMORY[0x263F575F8]];
    uint64_t v11 = [v10 unsignedIntegerValue];
    if (v10 && v11) {
      ++*(void *)(*(void *)(a1[6] + 8) + 24);
    }
  }
  return v7;
}

void __40__BRRTCPairingReportManager_addMetaKeys__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
  [v2 addPairingTimeEventToPairingReportPlist:51 withValue:v3 withError:0];

  id v4 = *(void **)(a1 + 32);
  int v5 = [NSNumber numberWithInteger:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  [v4 addPairingTimeEventToPairingReportPlist:53 withValue:v5 withError:0];

  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [NSNumber numberWithInteger:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v6 addPairingTimeEventToPairingReportPlist:52 withValue:v7 withError:0];

  id v8 = *(void **)(a1 + 32);
  id v9 = [NSNumber numberWithInteger:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v8 addPairingTimeEventToPairingReportPlist:74 withValue:v9 withError:0];
}

- (void)createPairingReportPlistWithPairingType:(unint64_t)a3
{
  v44[2] = *MEMORY[0x263EF8340];
  id v4 = [(BRRTCPairingReportManager *)self queue];
  dispatch_assert_queue_V2(v4);

  id v5 = objc_alloc_init(MEMORY[0x263F08790]);
  if (BRIsInternalInstall()) {
    id v6 = @"yyyy.MM.dd_HH-mm-ss";
  }
  else {
    id v6 = @"yyyy.MM.dd_HH-mm";
  }
  [v5 setDateFormat:v6];
  uint64_t v7 = [MEMORY[0x263EFF910] date];
  v36 = v5;
  uint64_t v8 = [v5 stringFromDate:v7];

  v35 = (void *)v8;
  id v9 = [NSString stringWithFormat:@"%@_%@", @"pairing_metric", v8];
  id v10 = @"/var/mobile/Library/Caches/com.apple.Bridge/PairingMetric";
  uint64_t v11 = @"BridgePairingMetricDetails.plist";
  char v12 = NSURL;
  int v13 = NSString;
  v44[0] = v10;
  v44[1] = v9;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:2];
  uint64_t v15 = [v13 pathWithComponents:v14];
  id v16 = [v12 fileURLWithPath:v15];

  uint64_t v17 = NSURL;
  __int16 v18 = v10;
  id v19 = NSString;
  v43[0] = v10;
  v43[1] = v9;
  v43[2] = v11;
  __int16 v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:3];
  id v21 = [v19 pathWithComponents:v20];
  uint64_t v22 = [v17 fileURLWithPath:v21];

  uint64_t v23 = [MEMORY[0x263F08850] defaultManager];
  v24 = [v16 relativePath];
  id v38 = 0;
  [v23 createDirectoryAtPath:v24 withIntermediateDirectories:1 attributes:0 error:&v38];
  id v25 = v38;

  if (v25)
  {
    id v26 = v35;
    v27 = br_metriccollection_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225AD1000, v27, OS_LOG_TYPE_DEFAULT, "Failure to create pairing metric directory", buf, 2u);
    }

    [(BRRTCPairingReportManager *)self setPairingMetricSetup:0];
  }
  else
  {
    [(BRRTCPairingReportManager *)self setCurrentPairingMetricID:v9];
    v33 = v10;
    v41[0] = @"PairingBeginsType";
    id v28 = [NSNumber numberWithUnsignedInteger:a3];
    v41[1] = @"PairingBeginsTime";
    v42[0] = v28;
    id v26 = v35;
    v42[1] = v35;
    __int16 v29 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];

    unint64_t v30 = [v22 relativePath];
    [v29 writeToFile:v30 atomically:1];

    [(BRRTCPairingReportManager *)self setPairingMetricSetup:1];
    [(BRRTCPairingReportManager *)self setCurrentPairingMetricBridgePlistPath:v22];
    uint64_t v31 = [MEMORY[0x263F08A00] defaultCenter];
    v39 = @"BRChangedMetricKey";
    v40 = @"PairingBeginsType";
    v32 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    [v31 postNotificationName:@"BRPairingMetricChangedNotification" object:0 userInfo:v32];

    __int16 v18 = v33;
  }
}

- (void)cleanUpMetricDirectoryWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F08850] defaultManager];
  id v6 = @"/var/mobile/Library/Caches/com.apple.Bridge/PairingMetric";
  uint64_t v7 = @"/var/mobile/Library/Caches/com.apple.Bridge/PairingMetric/Archived";
  if (([v5 fileExistsAtPath:v6] & 1) == 0) {
    [v5 createDirectoryAtPath:v6 withIntermediateDirectories:0 attributes:0 error:0];
  }
  if (([v5 fileExistsAtPath:v7] & 1) == 0) {
    [v5 createDirectoryAtPath:v7 withIntermediateDirectories:0 attributes:0 error:0];
  }
  uint64_t v8 = [v5 contentsOfDirectoryAtPath:v6 error:0];
  if ([v8 count] == 2)
  {
    objc_initWeak(location, self);
    id v9 = [v8 objectAtIndex:0];
    id v10 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v9, "isEqualToString:", @"Archived"));
    __int16 v20 = self;

    uint64_t v21 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v10];
    uint64_t v11 = NSURL;
    uint64_t v12 = [NSString stringWithFormat:@"%@/%@/%@", v6, v10, @"NRPairingMetricDetails.plist"];
    uint64_t v22 = [v11 fileURLWithPath:v12];

    int v13 = [v22 absoluteString];
    LOBYTE(v12) = [v5 fileExistsAtPath:v13];

    if (v12)
    {
      [NSDictionary dictionaryWithContentsOfURL:v22];
      v15 = id v14 = (void *)v21;
      id v16 = [v15 objectForKey:@"MetricSubmitted"];

      if (v16)
      {
        id WeakRetained = objc_loadWeakRetained(location);
        [WeakRetained archivePairingMetric:v10 withCompletion:v4];
      }
      else
      {
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __66__BRRTCPairingReportManager_cleanUpMetricDirectoryWithCompletion___block_invoke_3;
        v23[3] = &unk_2647637F8;
        id v25 = v4;
        v23[4] = v20;
        objc_copyWeak(&v26, location);
        id v24 = v10;
        [(BRRTCPairingReportManager *)v20 completeRTCPairingMetricForMetricID:v21 withSuccess:v23];

        objc_destroyWeak(&v26);
        id WeakRetained = v25;
      }
    }
    else
    {
      __int16 v18 = NSURL;
      id v19 = [NSString stringWithFormat:@"%@/%@/%@", v6, v10, @"BridgePairingMetricDetails.plist"];
      uint64_t v15 = [v18 fileURLWithPath:v19];

      id WeakRetained = [MEMORY[0x263EFF9A0] dictionaryWithContentsOfURL:v15];
      [WeakRetained setObject:MEMORY[0x263EFFA88] forKey:@"NoNRDetails"];
      [WeakRetained writeToURL:v15 atomically:1];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __66__BRRTCPairingReportManager_cleanUpMetricDirectoryWithCompletion___block_invoke;
      v27[3] = &unk_2647637F8;
      id v29 = v4;
      v27[4] = v20;
      objc_copyWeak(&v30, location);
      id v28 = v10;
      id v14 = (void *)v21;
      [(BRRTCPairingReportManager *)v20 completeRTCPairingMetricForMetricID:v21 withSuccess:v27];

      objc_destroyWeak(&v30);
    }

    objc_destroyWeak(location);
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

void __66__BRRTCPairingReportManager_cleanUpMetricDirectoryWithCompletion___block_invoke(id *a1, char a2)
{
  if (a2)
  {
    id v3 = [a1[4] queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__BRRTCPairingReportManager_cleanUpMetricDirectoryWithCompletion___block_invoke_2;
    block[3] = &unk_2647637D0;
    objc_copyWeak(&v8, a1 + 7);
    id v6 = a1[5];
    id v7 = a1[6];
    dispatch_async(v3, block);

    objc_destroyWeak(&v8);
  }
  else
  {
    id v4 = (void (*)(void))*((void *)a1[6] + 2);
    v4();
  }
}

void __66__BRRTCPairingReportManager_cleanUpMetricDirectoryWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained archivePairingMetric:*(void *)(a1 + 32) withCompletion:*(void *)(a1 + 40)];
}

void __66__BRRTCPairingReportManager_cleanUpMetricDirectoryWithCompletion___block_invoke_3(id *a1, char a2)
{
  if (a2)
  {
    id v3 = [a1[4] queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__BRRTCPairingReportManager_cleanUpMetricDirectoryWithCompletion___block_invoke_4;
    block[3] = &unk_2647637D0;
    objc_copyWeak(&v8, a1 + 7);
    id v6 = a1[5];
    id v7 = a1[6];
    dispatch_async(v3, block);

    objc_destroyWeak(&v8);
  }
  else
  {
    id v4 = (void (*)(void))*((void *)a1[6] + 2);
    v4();
  }
}

void __66__BRRTCPairingReportManager_cleanUpMetricDirectoryWithCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained archivePairingMetric:*(void *)(a1 + 32) withCompletion:*(void *)(a1 + 40)];
}

- (void)archivePairingMetric:(id)a3 withCompletion:(id)a4
{
  v47[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = NSURL;
  id v7 = NSString;
  v47[0] = @"/var/mobile/Library/Caches/com.apple.Bridge/PairingMetric";
  v47[1] = v5;
  id v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = (void (**)(id, uint64_t, void))a4;
  id v10 = [v8 arrayWithObjects:v47 count:2];
  uint64_t v11 = [v7 pathWithComponents:v10];
  uint64_t v12 = [v6 fileURLWithPath:v11];

  int v13 = NSURL;
  id v14 = NSString;
  v46[0] = @"/var/mobile/Library/Caches/com.apple.Bridge/PairingMetric/Archived";
  v46[1] = v5;
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];
  id v16 = [v14 pathWithComponents:v15];
  uint64_t v17 = [v13 fileURLWithPath:v16];

  __int16 v18 = [MEMORY[0x263F08850] defaultManager];
  id v40 = 0;
  v37 = (void *)v12;
  LOBYTE(v12) = [v18 moveItemAtURL:v12 toURL:v17 error:&v40];
  id v19 = v40;
  if (v12)
  {
    id v35 = v5;
    uint64_t v20 = [NSString stringWithFormat:@"%@.plist", v5];
    [(BRRTCPairingReportManager *)self combineMetricPlistsForArchive:v17];
    v22 = uint64_t v21 = v18;
    uint64_t v23 = NSURL;
    id v24 = NSString;
    v45[0] = @"/var/mobile/Library/Caches/com.apple.Bridge/PairingMetric/Archived";
    v45[1] = v20;
    id v25 = (void (**)(id, uint64_t, void))v20;
    id v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:2];
    v27 = [v24 pathWithComponents:v26];
    id v28 = [v23 fileURLWithPath:v27];

    id v29 = (void *)v22;
    __int16 v18 = v21;
    id v39 = v19;
    [v29 writeToURL:v28 error:&v39];
    id v30 = v39;

    if (v30)
    {
      uint64_t v31 = br_metriccollection_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v30;
        _os_log_impl(&dword_225AD1000, v31, OS_LOG_TYPE_DEFAULT, "Combined metric with error: %@", buf, 0xCu);
      }
    }
    id v38 = 0;
    [v21 removeItemAtURL:v17 error:&v38];
    id v19 = v38;
    id v5 = v35;
    if (v19)
    {
      v32 = br_metriccollection_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v19;
        _os_log_impl(&dword_225AD1000, v32, OS_LOG_TYPE_DEFAULT, "Removed archived metric with error: %@", buf, 0xCu);
      }
    }
    v33 = br_metriccollection_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v42 = v28;
      __int16 v43 = 2112;
      id v44 = v19;
      _os_log_impl(&dword_225AD1000, v33, OS_LOG_TYPE_DEFAULT, "Metric %@ archived with error %@", buf, 0x16u);
    }

    v9[2](v9, 1, 0);
    id v9 = v25;
  }
  else
  {
    v34 = br_metriccollection_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v19;
      _os_log_impl(&dword_225AD1000, v34, OS_LOG_TYPE_DEFAULT, "Failed to archive metric with error: %@", buf, 0xCu);
    }

    v9[2](v9, 0, 0);
  }
}

- (id)combineMetricPlistsForArchive:(id)a3
{
  id v3 = a3;
  id v4 = [v3 URLByAppendingPathComponent:@"BridgePairingMetricDetails.plist"];
  id v5 = [v3 URLByAppendingPathComponent:@"NRPairingMetricDetails.plist"];

  id v6 = [NSDictionary dictionaryWithContentsOfURL:v4];
  id v7 = [NSDictionary dictionaryWithContentsOfURL:v5];
  id v8 = objc_opt_new();
  [v8 addEntriesFromDictionary:v6];
  [v8 addEntriesFromDictionary:v7];

  return v8;
}

- (void)completeRTCPairingMetricForMetricID:(id)a3 withSuccess:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = br_metriccollection_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225AD1000, v8, OS_LOG_TYPE_DEFAULT, "Sending request to complete pairing metric to NR", buf, 2u);
  }

  if ([(BRRTCPairingReportManager *)self metricBusy])
  {
    id v9 = br_metriccollection_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = "-[BRRTCPairingReportManager completeRTCPairingMetricForMetricID:withSuccess:]";
      _os_log_impl(&dword_225AD1000, v9, OS_LOG_TYPE_DEFAULT, "%s Will not submit metric yet, metric is busy", buf, 0xCu);
    }

    [(BRRTCPairingReportManager *)self setPendingMetricSubmission:v7];
  }
  else
  {
    id v10 = [MEMORY[0x263F57730] sharedInstance];
    uint64_t v11 = [v6 UUIDString];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __77__BRRTCPairingReportManager_completeRTCPairingMetricForMetricID_withSuccess___block_invoke;
    v12[3] = &unk_264763820;
    id v13 = v7;
    [v10 completeRTCPairingMetricForMetricID:v11 withSuccess:v12];
  }
}

uint64_t __77__BRRTCPairingReportManager_completeRTCPairingMetricForMetricID_withSuccess___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_addEventToPendingQueue:(unint64_t)a3 withValue:(id)a4
{
  v20[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [NSNumber numberWithInt:a3];
  v19[0] = @"event";
  v19[1] = @"value";
  v20[0] = v7;
  v20[1] = v6;
  id v8 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  id v9 = br_metriccollection_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = BRPairingTimeEventToString(a3);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_225AD1000, v9, OS_LOG_TYPE_DEFAULT, "Caching an event: %@ with value: %@", buf, 0x16u);
  }
  uint64_t v11 = [(BRRTCPairingReportManager *)self queue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__BRRTCPairingReportManager__addEventToPendingQueue_withValue___block_invoke;
  v13[3] = &unk_264763848;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  dispatch_async(v11, v13);
}

uint64_t __63__BRRTCPairingReportManager__addEventToPendingQueue_withValue___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pendingEvents];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) pendingEvents];
    [v3 addObject:*(void *)(a1 + 40)];
  }
  else
  {
    id v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", *(void *)(a1 + 40), 0);
    [*(id *)(a1 + 32) setPendingEvents:v3];
  }

  [*(id *)(a1 + 32) setMetricBusy:0];
  id v4 = *(void **)(a1 + 32);

  return [v4 submitAnyPendingMetrics];
}

- (void)addPendingEventToMetric
{
  id v3 = [(BRRTCPairingReportManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__BRRTCPairingReportManager_addPendingEventToMetric__block_invoke;
  block[3] = &unk_2647636B8;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __52__BRRTCPairingReportManager_addPendingEventToMetric__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "pendingEvents", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v8 = [v7 objectForKeyedSubscript:@"event"];
        uint64_t v9 = (int)[v8 intValue];

        id v10 = [v7 objectForKeyedSubscript:@"value"];
        [*(id *)(a1 + 32) addPairingTimeEventToPairingReportPlist:v9 withValue:v10 withError:0];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)clearPendingEventQueue
{
}

- (id)_trimPrecision:(id)a3
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = [a3 integerValue];

  return (id)[v3 numberWithInteger:v4];
}

- (BRRTCPairingMetric)pairingMetric
{
  return self->_pairingMetric;
}

- (void)setPairingMetric:(id)a3
{
}

- (NSMutableDictionary)openPairingTimeEvents
{
  return self->_openPairingTimeEvents;
}

- (void)setOpenPairingTimeEvents:(id)a3
{
}

- (BRSetupControllerTracker)setupControllerTracker
{
  return self->_setupControllerTracker;
}

- (void)setSetupControllerTracker:(id)a3
{
}

- (NSString)currentPairingMetricID
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentPairingMetricID);

  return (NSString *)WeakRetained;
}

- (void)setCurrentPairingMetricID:(id)a3
{
}

- (NSURL)currentPairingMetricBridgePlistPath
{
  return self->_currentPairingMetricBridgePlistPath;
}

- (void)setCurrentPairingMetricBridgePlistPath:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)archivePairingMetric
{
  return self->_archivePairingMetric;
}

- (void)setArchivePairingMetric:(id)a3
{
}

- (BOOL)pairingMetricSetup
{
  return self->_pairingMetricSetup;
}

- (void)setPairingMetricSetup:(BOOL)a3
{
  self->_pairingMetricSetup = a3;
}

- (NSMutableArray)pendingEvents
{
  return self->_pendingEvents;
}

- (void)setPendingEvents:(id)a3
{
}

- (BOOL)metricBusy
{
  return self->_metricBusy;
}

- (void)setMetricBusy:(BOOL)a3
{
  self->_metricBusy = a3;
}

- (id)pendingMetricSubmission
{
  return self->_pendingMetricSubmission;
}

- (void)setPendingMetricSubmission:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingMetricSubmission, 0);
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong(&self->_archivePairingMetric, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentPairingMetricBridgePlistPath, 0);
  objc_destroyWeak((id *)&self->_currentPairingMetricID);
  objc_storeStrong((id *)&self->_setupControllerTracker, 0);
  objc_storeStrong((id *)&self->_openPairingTimeEvents, 0);

  objc_storeStrong((id *)&self->_pairingMetric, 0);
}

@end