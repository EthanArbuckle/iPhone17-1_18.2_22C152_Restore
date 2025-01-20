@interface ADDeviceKnowledgeManager
+ (id)sharedInstance;
- (ADBackgroundTaskRequest)xpc_task;
- (ADDeviceKnowledgeManager)init;
- (BOOL)runTask:(id)a3;
- (BOOL)taskIsRunning;
- (NSNumber)refreshInterval;
- (id)minimumRefreshInterval;
- (void)checkOnTask:(id)a3 activity:(id)a4;
- (void)processDeviceData:(id)a3;
- (void)scheduleDeviceDataProcessing:(double)a3;
- (void)setRefreshInterval:(id)a3;
- (void)setTaskIsRunning:(BOOL)a3;
- (void)setXpc_task:(id)a3;
@end

@implementation ADDeviceKnowledgeManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__ADDeviceKnowledgeManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken_4 != -1) {
    dispatch_once(&sharedInstance__onceToken_4, block);
  }
  v2 = (void *)sharedInstance__instance_4;

  return v2;
}

uint64_t __42__ADDeviceKnowledgeManager_sharedInstance__block_invoke()
{
  sharedInstance__instance_4 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x270F9A758]();
}

- (ADDeviceKnowledgeManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)ADDeviceKnowledgeManager;
  v2 = [(ADDeviceKnowledgeManager *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_taskIsRunning = 0;
    uint64_t v4 = [(ADDeviceKnowledgeManager *)v2 minimumRefreshInterval];
    refreshInterval = v3->_refreshInterval;
    v3->_refreshInterval = (NSNumber *)v4;

    [MEMORY[0x263F24188] registerTaskDelegate:v3 forRequestID:@"com.apple.ap.adprivacyd.deviceKnowledge"];
    v6 = [MEMORY[0x263F241C0] sharedInstance];
    int v7 = [v6 unitTesting];

    if (v7)
    {
      v8 = [NSString stringWithFormat:@"[%@] WARNING: Check On Task has been disabled. If you see this outside of unit tests, Please file a radar...", objc_opt_class()];
      _ADLog();
    }
    else
    {
      v8 = [MEMORY[0x263F24188] sharedInstance];
      [v8 checkOnTask:@"com.apple.ap.adprivacyd.deviceKnowledge"];
    }
  }
  return v3;
}

- (id)minimumRefreshInterval
{
  v2 = [MEMORY[0x263F61EE0] sharedAssetManagerCoordinator];
  v3 = [v2 assetManagerForPlacementType:0 assetManagerType:0];
  uint64_t v4 = [v2 assetManagerForPlacementType:0 assetManagerType:1];
  uint64_t v5 = *MEMORY[0x263F61F38];
  v6 = [v3 doubleValueForFactor:*MEMORY[0x263F61F38]];
  int v7 = [v4 doubleValueForFactor:v5];
  v8 = NSNumber;
  [v6 doubleValue];
  double v10 = v9;
  [v7 doubleValue];
  if (v10 < v11) {
    double v11 = v10;
  }
  v12 = [v8 numberWithDouble:v11];

  return v12;
}

- (BOOL)runTask:(id)a3
{
  id v5 = a3;
  v6 = NSString;
  uint64_t v7 = objc_opt_class();
  v8 = [v5 requestIdentifier];
  double v9 = [v6 stringWithFormat:@"[%@]: Received request to run background task %@", v7, v8];
  _ADLog();

  double v10 = [v5 requestIdentifier];
  LODWORD(v7) = [v10 isEqualToString:@"com.apple.ap.adprivacyd.deviceKnowledge"];

  BOOL v11 = 0;
  if (v7)
  {
    v12 = self;
    objc_sync_enter(v12);
    if (v12->_taskIsRunning)
    {
      v13 = [NSString stringWithFormat:@"[%@] ERROR: We should not be running the task twice at the same time.", objc_opt_class()];
      _ADLog();

      objc_sync_exit(v12);
      BOOL v11 = 0;
    }
    else
    {
      v12->_taskIsRunning = 1;
      objc_sync_exit(v12);

      v14 = +[ADAdTrackingSchedulingManager sharedInstance];
      char v15 = [v14 isAdEnabledLocality];

      if (v15)
      {
        objc_storeStrong((id *)&v12->_xpc_task, a3);
        if (([(ADBackgroundTaskRequest *)v12->_xpc_task continueTask] & 1) == 0)
        {
          v16 = [NSString stringWithFormat:@"[%@] ERROR: Unable to inform the system we need to run Device Knowledge asynchronously. Please file a radar...", objc_opt_class()];
          _ADLog();
        }
        v17 = [NSString stringWithFormat:@"[%@] Taking an XPC transaction for %@", objc_opt_class(), @"Device Knowledge In Progress"];
        _ADLog();

        takeXPCTransaction();
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __36__ADDeviceKnowledgeManager_runTask___block_invoke;
        v21[3] = &unk_2646696C0;
        v21[4] = v12;
        [(ADDeviceKnowledgeManager *)v12 processDeviceData:v21];
      }
      else
      {
        v18 = [NSString stringWithFormat:@"[%@]: This is not an Ad enabled country. Skipping Device Knoweldge.", objc_opt_class()];
        _ADLog();

        [(ADDeviceKnowledgeManager *)v12 scheduleDeviceDataProcessing:86400.0];
        v19 = v12;
        objc_sync_enter(v19);
        v12->_taskIsRunning = 0;
        objc_sync_exit(v19);
      }
      BOOL v11 = 1;
    }
  }

  return v11;
}

uint64_t __36__ADDeviceKnowledgeManager_runTask___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 16) taskIsDeferred] & 1) == 0)
  {
    if ([*(id *)(*(void *)(a1 + 32) + 16) finishTask])
    {
      v2 = *(id **)(a1 + 32);
      id v3 = v2[3];
      if (v3 && ([v3 doubleValue], v2 = *(id **)(a1 + 32), v4 > 0.0)) {
        [v2[3] doubleValue];
      }
      else {
        double v5 = 86400.0;
      }
      [v2 scheduleDeviceDataProcessing:v5];
    }
    else
    {
      v6 = [NSString stringWithFormat:@"[%@] ERROR Unable to inform the system we have completed the Device Knowledge task. Please file a radar...", objc_opt_class()];
      _ADLog();
    }
  }
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  objc_sync_exit(v7);

  v8 = [NSString stringWithFormat:@"[%@] Releasing an XPC transaction for %@", objc_opt_class(), @"Device Knowledge In Progress"];
  _ADLog();

  return releaseXPCTransaction();
}

- (void)checkOnTask:(id)a3 activity:(id)a4
{
  activity = (_xpc_activity_s *)a4;
  v6 = NSString;
  id v7 = a3;
  v8 = [v6 stringWithFormat:@"[%@]: Checking in on task: %@", objc_opt_class(), v7];
  _ADLog();

  LODWORD(v8) = [v7 isEqualToString:@"com.apple.ap.adprivacyd.deviceKnowledge"];
  double v9 = activity;
  if (v8)
  {
    xpc_object_t v10 = xpc_activity_copy_criteria(activity);
    BOOL v11 = NSString;
    uint64_t v12 = objc_opt_class();
    if (v10)
    {
      v13 = [v11 stringWithFormat:@"[%@]: Device Knowledge task already scheduled: %@", v12, v10];
      _ADLog();
    }
    else
    {
      v14 = [v11 stringWithFormat:@"[%@]: First checkin for Device Knowledge task. Rescheduling...", v12];
      _ADLog();

      [(ADDeviceKnowledgeManager *)self scheduleDeviceDataProcessing:30.0];
    }

    double v9 = activity;
  }
}

- (void)scheduleDeviceDataProcessing:(double)a3
{
  if (MGGetBoolAnswer())
  {
    double v4 = [MEMORY[0x263F241B8] sharedInstance];
    double v5 = [v4 stringForKey:@"DeviceKnowledgeScheduleOverride"];

    if (v5 && ([v5 isEqualToString:&stru_26D5A0810] & 1) == 0)
    {
      [v5 doubleValue];
      a3 = v6;
      id v7 = [NSString stringWithFormat:@"[%@]: Overriding reschedule period to %f seconds", objc_opt_class(), *(void *)&v6];
      _ADLog();
    }
  }
  id v11 = (id)[objc_alloc(MEMORY[0x263F24180]) initWithID:@"com.apple.ap.adprivacyd.deviceKnowledge"];
  [v11 setDelay:(uint64_t)a3];
  [v11 setAllowBattery:0];
  [v11 setIsCPUIntensive:1];
  [v11 setRequiresNetworkConnectivity:0];
  [v11 setRequireBuddyComplete:1];
  [v11 setRequireClassCData:1];
  v8 = [NSString stringWithCString:*MEMORY[0x263EF8288] encoding:4];
  [v11 setPriority:v8];

  [v11 setGracePeriod:*MEMORY[0x263EF81E8]];
  double v9 = [NSString stringWithFormat:@"[%@] Scheduling device knowledge update to run.", objc_opt_class()];
  _ADLog();

  xpc_object_t v10 = [MEMORY[0x263F24188] sharedInstance];
  [v10 addBackgroundTask:v11];
}

- (void)processDeviceData:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x263F24230] workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__ADDeviceKnowledgeManager_processDeviceData___block_invoke;
  v7[3] = &unk_264669710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

void __46__ADDeviceKnowledgeManager_processDeviceData___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F61EE0] sharedAssetManagerCoordinator];
  id v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = [NSNumber numberWithUnsignedLong:0];
  double v5 = objc_msgSend(v3, "arrayWithObjects:", v4, 0);
  [v2 refreshTrialClientForPlacementTypes:v5];

  id v6 = [MEMORY[0x263F61EE0] sharedAssetManagerCoordinator];
  [v6 setRespondToRefreshNotification:0];

  id v7 = [MEMORY[0x263F087C8] defaultCenter];
  [v7 postNotificationName:*MEMORY[0x263F61F30] object:0];

  id v8 = objc_alloc(MEMORY[0x263F61EE8]);
  double v9 = [*(id *)(*(void *)(a1 + 32) + 16) activity];
  id v10 = (id)[v8 initWithActivity:v9];

  [v10 calculateAllFeatures:*(void *)(a1 + 40)];
}

- (BOOL)taskIsRunning
{
  return self->_taskIsRunning;
}

- (void)setTaskIsRunning:(BOOL)a3
{
  self->_taskIsRunning = a3;
}

- (ADBackgroundTaskRequest)xpc_task
{
  return self->_xpc_task;
}

- (void)setXpc_task:(id)a3
{
}

- (NSNumber)refreshInterval
{
  return self->_refreshInterval;
}

- (void)setRefreshInterval:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshInterval, 0);

  objc_storeStrong((id *)&self->_xpc_task, 0);
}

@end