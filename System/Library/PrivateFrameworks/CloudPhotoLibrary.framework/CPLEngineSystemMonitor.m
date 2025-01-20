@interface CPLEngineSystemMonitor
+ (BOOL)shouldIgnoreLowDiskSpace;
+ (double)nextOverrideTimeIntervalForSystemBudgets:(unint64_t)a3;
+ (id)descriptionForBudget:(unint64_t)a3;
+ (id)descriptionForBudgets:(unint64_t)a3;
+ (void)enumerateSystemBudgets:(unint64_t)a3 withBlock:(id)a4;
+ (void)initialize;
+ (void)setShouldIgnoreLowDiskSpace:(BOOL)a3;
- (BOOL)_hasPermanentDataOverride;
- (BOOL)canBoostBackgroundOperations;
- (BOOL)canBoostOperations;
- (BOOL)hasEnoughPowerForAutomaticOverride;
- (BOOL)isDataBudgetOverriden;
- (BOOL)isNetworkConnected;
- (BOOL)isNetworkConstrained;
- (BOOL)isOnCellularOrUnknown;
- (CPLEngineLibrary)engineLibrary;
- (CPLEngineSystemMonitor)initWithEngineLibrary:(id)a3;
- (double)_minimumBatteryLevelForAutoOverrideEnergyBudget;
- (id)componentName;
- (unint64_t)diskPressureState;
- (unint64_t)freeDiskSpaceSize;
- (void)_attemptScheduleRecoveryOverride:(unint64_t)a3 withReason:(unint64_t)a4;
- (void)_permanentDataOverrideHasChanged;
- (void)_startOverridingBudget:(unint64_t)a3 reason:(unint64_t)a4;
- (void)_startWatchingPermanentDataOverride;
- (void)_stopOverridingBudget:(unint64_t)a3 reason:(unint64_t)a4;
- (void)_stopWatchingPermanentDataOverride;
- (void)_withSystemBudgetOverride:(id)a3;
- (void)batteryLevelDidChangeWithLevel:(double)a3;
- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4;
- (void)getStatusDictionaryWithCompletionHandler:(id)a3;
- (void)getStatusWithCompletionHandler:(id)a3;
- (void)openWithCompletionHandler:(id)a3;
- (void)scheduledOverrideDidEnd:(id)a3;
- (void)startAutomaticOverridingSystemBudgets:(unint64_t)a3;
- (void)startOverridingSystemBudgets:(unint64_t)a3 reason:(unint64_t)a4;
- (void)startOverridingSystemBudgetsForClient:(unint64_t)a3;
- (void)stopAutomaticOverridingSystemBudgets:(unint64_t)a3;
- (void)stopOverridingSystemBudgets:(unint64_t)a3 reason:(unint64_t)a4;
- (void)stopOverridingSystemBudgetsForClient:(unint64_t)a3;
- (void)watcher:(id)a3 stateDidChangeToNetworkState:(id)a4;
@end

@implementation CPLEngineSystemMonitor

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engineLibrary);
  objc_storeStrong((id *)&self->_scheduledOverrides, 0);
  objc_storeStrong((id *)&self->_reasonsToOverrideSystemBudget, 0);
  objc_storeStrong((id *)&self->_watcher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_volumeURL, 0);
}

- (CPLEngineLibrary)engineLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
  return (CPLEngineLibrary *)WeakRetained;
}

- (void)batteryLevelDidChangeWithLevel:(double)a3
{
  [(CPLEngineSystemMonitor *)self _minimumBatteryLevelForAutoOverrideEnergyBudget];
  if (v5 >= a3)
  {
    [(CPLEngineSystemMonitor *)self stopAutomaticOverridingSystemBudgets:2];
  }
}

- (double)_minimumBatteryLevelForAutoOverrideEnergyBudget
{
  if (_minimumBatteryLevelForAutoOverrideEnergyBudget_onceToken != -1) {
    dispatch_once(&_minimumBatteryLevelForAutoOverrideEnergyBudget_onceToken, &__block_literal_global_20851);
  }
  return *(double *)&_minimumBatteryLevelForAutoOverrideEnergyBudget_minimumBatteryLevelForAutoOverride;
}

void __73__CPLEngineSystemMonitor__minimumBatteryLevelForAutoOverrideEnergyBudget__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v1 = [v0 objectForKey:@"CPLMinimumBatteryLevelForAutoOverrideSystemBudget"];
  [v1 doubleValue];
  _minimumBatteryLevelForAutoOverrideEnergyBudget_minimumBatteryLevelForAutoOverride = v2;

  if (*(double *)&_minimumBatteryLevelForAutoOverrideEnergyBudget_minimumBatteryLevelForAutoOverride == 0.0)
  {
    if (!_CPLSilentLogging)
    {
      v3 = __CPLSystemMonitorOSLogDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        int v4 = 134217984;
        uint64_t v5 = _minimumBatteryLevelForAutoOverrideEnergyBudget_minimumBatteryLevelForAutoOverride;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEBUG, "Minimum battery level value not set or invalid: %f", (uint8_t *)&v4, 0xCu);
      }
    }
    _minimumBatteryLevelForAutoOverrideEnergyBudget_minimumBatteryLevelForAutoOverride = 0x4059000000000000;
  }
}

- (void)watcher:(id)a3 stateDidChangeToNetworkState:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__CPLEngineSystemMonitor_watcher_stateDidChangeToNetworkState___block_invoke;
  v11[3] = &unk_1E60A6728;
  v11[4] = self;
  id v12 = v5;
  v7 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_20859;
  block[3] = &unk_1E60A6978;
  id v14 = v7;
  v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

void __63__CPLEngineSystemMonitor_watcher_stateDidChangeToNetworkState___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (!v2[8])
  {
    if (!_CPLSilentLogging)
    {
      v3 = __CPLSystemMonitorOSLogDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 40);
        int v14 = 138412290;
        uint64_t v15 = v4;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Network state changed to %@", (uint8_t *)&v14, 0xCu);
      }

      uint64_t v2 = *(unsigned char **)(a1 + 32);
    }
    id v5 = [v2 engineLibrary];
    int v6 = [*(id *)(a1 + 40) isConnected];
    v7 = *(void **)(a1 + 40);
    if (v6)
    {
      if ([v7 canUseNetwork])
      {
        v8 = [v5 feedback];
        [v8 sendFeedbackToServerIfNecessary];

        id v9 = [v5 scheduler];
        [v9 noteNetworkStateDidChange];
      }
      if ([*(id *)(a1 + 40) isCellular]) {
        uint64_t v10 = [*(id *)(a1 + 40) isCellularRestricted];
      }
      else {
        uint64_t v10 = 0;
      }
      id v12 = v5;
      uint64_t v13 = 1;
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v11 = [v7 isInAirplaneMode];
      id v12 = v5;
      uint64_t v13 = 0;
      uint64_t v10 = 0;
    }
    [v12 setConnectedToNetwork:v13 cellularIsRestricted:v10 inAirplaneMode:v11];
  }
}

- (void)stopAutomaticOverridingSystemBudgets:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__CPLEngineSystemMonitor_stopAutomaticOverridingSystemBudgets___block_invoke;
  v4[3] = &unk_1E60A6598;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __63__CPLEngineSystemMonitor_stopAutomaticOverridingSystemBudgets___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__CPLEngineSystemMonitor_stopAutomaticOverridingSystemBudgets___block_invoke_2;
  v3[3] = &unk_1E60A6598;
  uint64_t v1 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = v1;
  return [v4 _withSystemBudgetOverride:v3];
}

uint64_t __63__CPLEngineSystemMonitor_stopAutomaticOverridingSystemBudgets___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__CPLEngineSystemMonitor_stopAutomaticOverridingSystemBudgets___block_invoke_3;
  v5[3] = &unk_1E60AABD0;
  uint64_t v3 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  return [v2 enumerateSystemBudgets:v3 withBlock:v5];
}

void __63__CPLEngineSystemMonitor_stopAutomaticOverridingSystemBudgets___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 72);
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a2];
  id v11 = [v4 objectForKeyedSubscript:v5];

  int v6 = *(void **)(*(void *)(a1 + 32) + 64);
  v7 = [NSNumber numberWithUnsignedInteger:a2];
  v8 = [v6 objectForKeyedSubscript:v7];

  if (v11 && [v8 containsObject:&unk_1F0D915E0])
  {
    [v11 setDelegate:0];
    [v11 cancel];
    id v9 = *(void **)(*(void *)(a1 + 32) + 72);
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:a2];
    [v9 removeObjectForKey:v10];

    [*(id *)(a1 + 32) _stopOverridingBudget:a2 reason:1];
  }
}

- (void)startAutomaticOverridingSystemBudgets:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__CPLEngineSystemMonitor_startAutomaticOverridingSystemBudgets___block_invoke;
  v4[3] = &unk_1E60A6598;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __64__CPLEngineSystemMonitor_startAutomaticOverridingSystemBudgets___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__CPLEngineSystemMonitor_startAutomaticOverridingSystemBudgets___block_invoke_2;
  v3[3] = &unk_1E60A6598;
  uint64_t v1 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = v1;
  return [v4 _withSystemBudgetOverride:v3];
}

uint64_t __64__CPLEngineSystemMonitor_startAutomaticOverridingSystemBudgets___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__CPLEngineSystemMonitor_startAutomaticOverridingSystemBudgets___block_invoke_3;
  v5[3] = &unk_1E60AABD0;
  uint64_t v3 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  return [v2 enumerateSystemBudgets:v3 withBlock:v5];
}

void __64__CPLEngineSystemMonitor_startAutomaticOverridingSystemBudgets___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 72);
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a2];
  int v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v9 = [[_CPLScheduledOverride alloc] initWithBudget:a2 withReason:1 queue:*(void *)(*(void *)(a1 + 32) + 24)];
    [(_CPLScheduledOverride *)v9 setDelegate:*(void *)(a1 + 32)];
    if ([(_CPLScheduledOverride *)v9 scheduleEndOfOverride])
    {
      v7 = *(void **)(*(void *)(a1 + 32) + 72);
      v8 = [NSNumber numberWithUnsignedInteger:a2];
      [v7 setObject:v9 forKeyedSubscript:v8];

      [*(id *)(a1 + 32) _startOverridingBudget:a2 reason:1];
    }
  }
}

- (void)_stopWatchingPermanentDataOverride
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobileslideshow.PLNotificationUnlimitedSyncOverCellularChanged", 0);
}

- (void)_startWatchingPermanentDataOverride
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_unlimitedSyncOverCellularDidChange, @"com.apple.mobileslideshow.PLNotificationUnlimitedSyncOverCellularChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  BOOL v4 = [(CPLEngineSystemMonitor *)self _hasPermanentDataOverride];
  self->_overrideDataSystemBudgetPermanently = v4;
  if (v4)
  {
    [(CPLEngineSystemMonitor *)self _startOverridingBudget:1 reason:4];
  }
}

- (void)_permanentDataOverrideHasChanged
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__CPLEngineSystemMonitor__permanentDataOverrideHasChanged__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_20859;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  BOOL v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

unsigned char *__58__CPLEngineSystemMonitor__permanentDataOverrideHasChanged__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[8])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v3 = __CPLSystemMonitorOSLogDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Permanent Data override has changed", buf, 2u);
      }

      result = *(unsigned char **)(a1 + 32);
    }
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __58__CPLEngineSystemMonitor__permanentDataOverrideHasChanged__block_invoke_210;
    v4[3] = &unk_1E60A5DD8;
    v4[4] = result;
    return (unsigned char *)[result _withSystemBudgetOverride:v4];
  }
  return result;
}

unsigned char *__58__CPLEngineSystemMonitor__permanentDataOverrideHasChanged__block_invoke_210(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _hasPermanentDataOverride];
  result = *(unsigned char **)(a1 + 32);
  if (v2)
  {
    if (!result[80]) {
      result = (unsigned char *)[result _startOverridingBudget:1 reason:4];
    }
  }
  else if (result[80])
  {
    result = (unsigned char *)[result _stopOverridingBudget:1 reason:4];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 80) = v2;
  return result;
}

- (BOOL)_hasPermanentDataOverride
{
  return CFPreferencesGetAppBooleanValue(@"unlimitedSyncOverCellular", @"com.apple.mobileslideshow", 0) != 0;
}

- (void)scheduledOverrideDidEnd:(id)a3
{
  id v4 = a3;
  if (self->_supportsBudgetOverride)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    uint64_t v5 = [v4 budget];
    scheduledOverrides = self->_scheduledOverrides;
    v7 = [NSNumber numberWithUnsignedInteger:v5];
    id v8 = [(NSMutableDictionary *)scheduledOverrides objectForKeyedSubscript:v7];

    if (v8 == v4)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __50__CPLEngineSystemMonitor_scheduledOverrideDidEnd___block_invoke;
      v9[3] = &unk_1E60A65C0;
      id v10 = v4;
      id v11 = self;
      uint64_t v12 = v5;
      [(CPLEngineSystemMonitor *)self _withSystemBudgetOverride:v9];
    }
  }
}

uint64_t __50__CPLEngineSystemMonitor_scheduledOverrideDidEnd___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:0];
  [*(id *)(a1 + 32) cancel];
  int v2 = *(void **)(*(void *)(a1 + 40) + 72);
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  [v2 removeObjectForKey:v3];

  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v6 = [*(id *)(a1 + 32) reason];
  return [v5 _stopOverridingBudget:v4 reason:v6];
}

- (BOOL)hasEnoughPowerForAutomaticOverride
{
  return 0;
}

- (BOOL)isDataBudgetOverriden
{
  if (!self->_supportsBudgetOverride) {
    return 0;
  }
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__CPLEngineSystemMonitor_isDataBudgetOverriden__block_invoke;
  v5[3] = &unk_1E60A5CE8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  BOOL v3 = *((unsigned char *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __47__CPLEngineSystemMonitor_isDataBudgetOverriden__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:&unk_1F0D915E0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count] != 0;
}

- (void)stopOverridingSystemBudgetsForClient:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__CPLEngineSystemMonitor_stopOverridingSystemBudgetsForClient___block_invoke;
  v4[3] = &unk_1E60A6598;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __63__CPLEngineSystemMonitor_stopOverridingSystemBudgetsForClient___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__CPLEngineSystemMonitor_stopOverridingSystemBudgetsForClient___block_invoke_2;
  v3[3] = &unk_1E60A6598;
  uint64_t v1 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = v1;
  return [v4 _withSystemBudgetOverride:v3];
}

uint64_t __63__CPLEngineSystemMonitor_stopOverridingSystemBudgetsForClient___block_invoke_2(uint64_t a1)
{
  id v2 = objc_opt_class();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__CPLEngineSystemMonitor_stopOverridingSystemBudgetsForClient___block_invoke_3;
  v5[3] = &unk_1E60AABD0;
  uint64_t v3 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  return [v2 enumerateSystemBudgets:v3 withBlock:v5];
}

void __63__CPLEngineSystemMonitor_stopOverridingSystemBudgetsForClient___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 72);
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a2];
  id v11 = [v4 objectForKeyedSubscript:v5];

  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 64);
  v7 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];

  if (v11 && [v8 containsObject:&unk_1F0D915C8])
  {
    [v11 setDelegate:0];
    [v11 resetHeuristics];
    [v11 cancel];
    char v9 = *(void **)(*(void *)(a1 + 32) + 72);
    id v10 = [NSNumber numberWithUnsignedInteger:a2];
    [v9 removeObjectForKey:v10];

    [*(id *)(a1 + 32) _stopOverridingBudget:a2 reason:0];
  }
}

- (void)startOverridingSystemBudgetsForClient:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__CPLEngineSystemMonitor_startOverridingSystemBudgetsForClient___block_invoke;
  v4[3] = &unk_1E60A6598;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __64__CPLEngineSystemMonitor_startOverridingSystemBudgetsForClient___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__CPLEngineSystemMonitor_startOverridingSystemBudgetsForClient___block_invoke_2;
  v3[3] = &unk_1E60A6598;
  uint64_t v1 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = v1;
  return [v4 _withSystemBudgetOverride:v3];
}

uint64_t __64__CPLEngineSystemMonitor_startOverridingSystemBudgetsForClient___block_invoke_2(uint64_t a1)
{
  id v2 = objc_opt_class();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__CPLEngineSystemMonitor_startOverridingSystemBudgetsForClient___block_invoke_3;
  v5[3] = &unk_1E60AABD0;
  uint64_t v3 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  return [v2 enumerateSystemBudgets:v3 withBlock:v5];
}

void __64__CPLEngineSystemMonitor_startOverridingSystemBudgetsForClient___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 72);
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    char v9 = [[_CPLScheduledOverride alloc] initWithBudget:a2 withReason:0 queue:*(void *)(*(void *)(a1 + 32) + 24)];
    [(_CPLScheduledOverride *)v9 setDelegate:*(void *)(a1 + 32)];
    if ([(_CPLScheduledOverride *)v9 scheduleEndOfOverride])
    {
      v7 = *(void **)(*(void *)(a1 + 32) + 72);
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:a2];
      [v7 setObject:v9 forKeyedSubscript:v8];

      [*(id *)(a1 + 32) _startOverridingBudget:a2 reason:0];
    }
  }
}

- (void)stopOverridingSystemBudgets:(unint64_t)a3 reason:(unint64_t)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__CPLEngineSystemMonitor_stopOverridingSystemBudgets_reason___block_invoke;
  block[3] = &unk_1E60AAE80;
  void block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(queue, block);
}

uint64_t __61__CPLEngineSystemMonitor_stopOverridingSystemBudgets_reason___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__CPLEngineSystemMonitor_stopOverridingSystemBudgets_reason___block_invoke_2;
  v3[3] = &unk_1E60AAE80;
  void v3[4] = v1;
  long long v4 = *(_OWORD *)(a1 + 40);
  return [v1 _withSystemBudgetOverride:v3];
}

uint64_t __61__CPLEngineSystemMonitor_stopOverridingSystemBudgets_reason___block_invoke_2(void *a1)
{
  id v2 = objc_opt_class();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__CPLEngineSystemMonitor_stopOverridingSystemBudgets_reason___block_invoke_3;
  v6[3] = &unk_1E60AAC70;
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  v6[4] = a1[4];
  void v6[5] = v4;
  return [v2 enumerateSystemBudgets:v3 withBlock:v6];
}

uint64_t __61__CPLEngineSystemMonitor_stopOverridingSystemBudgets_reason___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _stopOverridingBudget:a2 reason:*(void *)(a1 + 40)];
}

- (void)startOverridingSystemBudgets:(unint64_t)a3 reason:(unint64_t)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__CPLEngineSystemMonitor_startOverridingSystemBudgets_reason___block_invoke;
  block[3] = &unk_1E60AAE80;
  void block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(queue, block);
}

uint64_t __62__CPLEngineSystemMonitor_startOverridingSystemBudgets_reason___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__CPLEngineSystemMonitor_startOverridingSystemBudgets_reason___block_invoke_2;
  v3[3] = &unk_1E60AAE80;
  void v3[4] = v1;
  long long v4 = *(_OWORD *)(a1 + 40);
  return [v1 _withSystemBudgetOverride:v3];
}

uint64_t __62__CPLEngineSystemMonitor_startOverridingSystemBudgets_reason___block_invoke_2(void *a1)
{
  id v2 = objc_opt_class();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__CPLEngineSystemMonitor_startOverridingSystemBudgets_reason___block_invoke_3;
  v6[3] = &unk_1E60AAC70;
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  v6[4] = a1[4];
  void v6[5] = v4;
  return [v2 enumerateSystemBudgets:v3 withBlock:v6];
}

uint64_t __62__CPLEngineSystemMonitor_startOverridingSystemBudgets_reason___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _startOverridingBudget:a2 reason:*(void *)(a1 + 40)];
}

- (void)_withSystemBudgetOverride:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_supportsBudgetOverride)
  {
    self->_modifyingBudgetOverride = 1;
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    uint64_t v4 = [(CPLEngineSystemMonitor *)self engineLibrary];
    uint64_t v5 = [v4 transport];

    unint64_t newBudgetsToOverride = self->_newBudgetsToOverride;
    if (newBudgetsToOverride)
    {
      if (!_CPLSilentLogging)
      {
        v7 = __CPLSystemMonitorOSLogDomain();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = [(id)objc_opt_class() descriptionForBudgets:self->_newBudgetsToOverride];
          int v12 = 138543362;
          uint64_t v13 = v8;
          _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Starting override for system budgets: %{public}@", (uint8_t *)&v12, 0xCu);
        }
        unint64_t newBudgetsToOverride = self->_newBudgetsToOverride;
      }
      [v5 setShouldOverride:1 forSystemBudgets:newBudgetsToOverride];
      self->_unint64_t newBudgetsToOverride = 0;
    }
    unint64_t newBudgetsToStopOverriding = self->_newBudgetsToStopOverriding;
    if (newBudgetsToStopOverriding)
    {
      if (!_CPLSilentLogging)
      {
        id v10 = __CPLSystemMonitorOSLogDomain();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = [(id)objc_opt_class() descriptionForBudgets:self->_newBudgetsToStopOverriding];
          int v12 = 138543362;
          uint64_t v13 = v11;
          _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEFAULT, "Stopping override for system budgets: %{public}@", (uint8_t *)&v12, 0xCu);
        }
        unint64_t newBudgetsToStopOverriding = self->_newBudgetsToStopOverriding;
      }
      [v5 setShouldOverride:0 forSystemBudgets:newBudgetsToStopOverriding];
      self->_unint64_t newBudgetsToStopOverriding = 0;
    }
    self->_modifyingBudgetOverride = 0;
  }
}

- (void)_stopOverridingBudget:(unint64_t)a3 reason:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!self->_closed && self->_supportsBudgetOverride)
  {
    if (!self->_modifyingBudgetOverride)
    {
      if (!_CPLSilentLogging)
      {
        v21 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v24) = 0;
          _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_ERROR, "Trying to modify system budget override outside of an override transaction", (uint8_t *)&v24, 2u);
        }
      }
      v22 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
      v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSystemMonitor.m"];
      [v22 handleFailureInMethod:a2 object:self file:v23 lineNumber:779 description:@"Trying to modify system budget override outside of an override transaction"];

      abort();
    }
    reasonsToOverrideSystemBudget = self->_reasonsToOverrideSystemBudget;
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    char v9 = [(NSMutableDictionary *)reasonsToOverrideSystemBudget objectForKeyedSubscript:v8];

    id v10 = [NSNumber numberWithUnsignedInteger:a4];
    uint64_t v11 = [v9 countForObject:v10];

    if (v11)
    {
      int v12 = [NSNumber numberWithUnsignedInteger:a4];
      [v9 removeObject:v12];

      if (![v9 count])
      {
        uint64_t v13 = self->_reasonsToOverrideSystemBudget;
        uint64_t v14 = [NSNumber numberWithUnsignedInteger:a3];
        [(NSMutableDictionary *)v13 removeObjectForKey:v14];

        unint64_t v15 = self->_newBudgetsToStopOverriding | a3;
        self->_newBudgetsToOverride &= ~a3;
        self->_unint64_t newBudgetsToStopOverriding = v15;
      }
    }
    else if (!_CPLSilentLogging)
    {
      uint64_t v16 = __CPLSystemMonitorOSLogDomain();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = [(id)objc_opt_class() descriptionForBudget:a3];
        v18 = (void *)v17;
        if (a4 - 1 > 3) {
          v19 = @"forced by user";
        }
        else {
          v19 = off_1E60AACE8[a4 - 1];
        }
        int v24 = 138543618;
        uint64_t v25 = v17;
        __int16 v26 = 2114;
        v27 = v19;
        _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_ERROR, "Stopping overriding system budget for %{public}@ too many times with reason %{public}@", (uint8_t *)&v24, 0x16u);
      }
    }
  }
}

- (void)_startOverridingBudget:(unint64_t)a3 reason:(unint64_t)a4
{
  if (!self->_closed && self->_supportsBudgetOverride)
  {
    if (!self->_modifyingBudgetOverride)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v14 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "Trying to modify system budget override outside of an override transaction", buf, 2u);
        }
      }
      unint64_t v15 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSystemMonitor.m"];
      [v15 handleFailureInMethod:a2 object:self file:v16 lineNumber:761 description:@"Trying to modify system budget override outside of an override transaction"];

      abort();
    }
    reasonsToOverrideSystemBudget = self->_reasonsToOverrideSystemBudget;
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    id v17 = [(NSMutableDictionary *)reasonsToOverrideSystemBudget objectForKeyedSubscript:v8];

    if (!v17)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
      char v9 = self->_reasonsToOverrideSystemBudget;
      id v10 = [NSNumber numberWithUnsignedInteger:a3];
      [(NSMutableDictionary *)v9 setObject:v17 forKeyedSubscript:v10];

      unint64_t v11 = self->_newBudgetsToStopOverriding & ~a3;
      self->_newBudgetsToOverride |= a3;
      self->_unint64_t newBudgetsToStopOverriding = v11;
    }
    int v12 = [NSNumber numberWithUnsignedInteger:a4];
    [v17 addObject:v12];
  }
}

- (BOOL)canBoostBackgroundOperations
{
  if (!self->_allowBackgroundOperationsBoost) {
    return 0;
  }
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__CPLEngineSystemMonitor_canBoostBackgroundOperations__block_invoke;
  v5[3] = &unk_1E60A5CE8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  BOOL v3 = *((unsigned char *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __54__CPLEngineSystemMonitor_canBoostBackgroundOperations__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) networkState];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isCellular] ^ 1;

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = +[CPLPowerAssertion hasEnoughPower];
  }
}

- (BOOL)canBoostOperations
{
  return self->_allowOperationsBoost;
}

- (BOOL)isOnCellularOrUnknown
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__CPLEngineSystemMonitor_isOnCellularOrUnknown__block_invoke;
  v5[3] = &unk_1E60A5CE8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __47__CPLEngineSystemMonitor_isOnCellularOrUnknown__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) networkState];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isCellular];
}

- (BOOL)isNetworkConstrained
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__CPLEngineSystemMonitor_isNetworkConstrained__block_invoke;
  v5[3] = &unk_1E60A5CE8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __46__CPLEngineSystemMonitor_isNetworkConstrained__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) networkState];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isConstrained];
}

- (BOOL)isNetworkConnected
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__CPLEngineSystemMonitor_isNetworkConnected__block_invoke;
  v5[3] = &unk_1E60A5CE8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __44__CPLEngineSystemMonitor_isNetworkConnected__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) networkState];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isConnected];
}

- (void)getStatusDictionaryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__CPLEngineSystemMonitor_getStatusDictionaryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E60A5EE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __67__CPLEngineSystemMonitor_getStatusDictionaryWithCompletionHandler___block_invoke(uint64_t a1)
{
  v49[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = *MEMORY[0x1E4F1C810];
  [*(id *)(*(void *)(a1 + 32) + 16) removeCachedResourceValueForKey:*MEMORY[0x1E4F1C810]];
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  id v44 = 0;
  id v45 = 0;
  int v5 = [v4 getResourceValue:&v45 forKey:v3 error:&v44];
  id v6 = v45;
  id v7 = v44;
  if (!v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_38;
  }
  unint64_t v8 = [*(id *)(a1 + 32) diskPressureState];
  if (v8 <= 2) {
    [v2 setObject:off_1E60AACD0[v8] forKeyedSubscript:@"diskPressure"];
  }
  if (v6) {
    [v2 setObject:v6 forKeyedSubscript:@"diskAvailableSpace"];
  }
  char v9 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v9)
  {
    id v10 = [v9 networkState];
    uint64_t v11 = [v10 plistDescription];
    int v12 = (void *)v11;
    if (v11) {
      uint64_t v13 = (__CFString *)v11;
    }
    else {
      uint64_t v13 = @"unknown";
    }
    [v2 setObject:v13 forKeyedSubscript:@"network"];
  }
  uint64_t v14 = +[CPLBatteryMonitor powerStatusPlist];
  if (v14) {
    [v2 setObject:v14 forKeyedSubscript:@"power"];
  }
  int out_token = 0;
  uint64_t state64 = 0;
  if (notify_register_check((const char *)*MEMORY[0x1E4F14918], &out_token)) {
    goto LABEL_14;
  }
  notify_get_state(out_token, &state64);
  notify_cancel(out_token);
  if ((uint64_t)state64 > 29)
  {
    switch(state64)
    {
      case 0x1EuLL:
        unint64_t v15 = @"Heavy";
        goto LABEL_15;
      case 0x28uLL:
        unint64_t v15 = @"Trapping";
        goto LABEL_15;
      case 0x32uLL:
        unint64_t v15 = @"Sleeping";
        goto LABEL_15;
    }
    goto LABEL_42;
  }
  if (state64)
  {
    if (state64 == 10)
    {
      unint64_t v15 = @"Light";
      goto LABEL_15;
    }
    if (state64 == 20)
    {
      unint64_t v15 = @"Moderate";
      goto LABEL_15;
    }
LABEL_42:
    unint64_t v15 = @"Unknown";
    goto LABEL_15;
  }
LABEL_14:
  unint64_t v15 = @"Nominal";
LABEL_15:
  [v2 setObject:v15 forKeyedSubscript:@"thermal"];
  uint64_t v16 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v16 + 40))
  {
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__21003;
    v40 = __Block_byref_object_dispose__21004;
    id v41 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__21003;
    v34 = __Block_byref_object_dispose__21004;
    id v35 = 0;
    id v17 = *(void **)(v16 + 64);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __67__CPLEngineSystemMonitor_getStatusDictionaryWithCompletionHandler___block_invoke_128;
    v29[3] = &unk_1E60AAC48;
    v29[5] = &v36;
    v29[6] = &v30;
    v29[4] = v16;
    [v17 enumerateKeysAndObjectsUsingBlock:v29];
    uint64_t v18 = v37[5];
    if (v18)
    {
      uint64_t v19 = v31[5];
      if (v19)
      {
        v48[0] = @"reasons";
        v48[1] = @"scheduledEndDates";
        v49[0] = v18;
        v49[1] = v19;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];
      }
      else
      {
        v46 = @"reasons";
        uint64_t v47 = v18;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      v20 = };
      [v2 setObject:v20 forKeyedSubscript:@"budgetOverrides"];
    }
    v21 = objc_opt_class();
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    uint64_t v25 = __67__CPLEngineSystemMonitor_getStatusDictionaryWithCompletionHandler___block_invoke_142;
    __int16 v26 = &unk_1E60AAC20;
    uint64_t v27 = *(void *)(a1 + 32);
    id v28 = v2;
    [v21 enumerateSystemBudgets:18487 withBlock:&v23];

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v36, 8);

    uint64_t v16 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v16 + 81))
  {
    if (*(unsigned char *)(v16 + 82)) {
      v22 = @"all";
    }
    else {
      v22 = @"foreground";
    }
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v22, @"allowOperationBoot", v23, v24, v25, v26, v27);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_38:
}

void __67__CPLEngineSystemMonitor_getStatusDictionaryWithCompletionHandler___block_invoke_128(void *a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v7 = *(void *)(a1[5] + 8);
    unint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  char v9 = +[CPLEngineSystemMonitor descriptionForBudget:](CPLEngineSystemMonitor, "descriptionForBudget:", [v18 unsignedIntegerValue]);
  id v10 = [v5 allObjects];
  [*(id *)(*(void *)(a1[5] + 8) + 40) setObject:v10 forKeyedSubscript:v9];

  if (([v5 containsObject:&unk_1F0D915C8] & 1) != 0
    || [v5 containsObject:&unk_1F0D915E0])
  {
    if (!*(void *)(*(void *)(a1[6] + 8) + 40))
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v12 = *(void *)(a1[6] + 8);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
    uint64_t v14 = [*(id *)(a1[4] + 72) objectForKeyedSubscript:v18];
    unint64_t v15 = [v14 endDate];

    if (v15)
    {
      uint64_t v16 = NSNumber;
      [v15 timeIntervalSinceReferenceDate];
      id v17 = objc_msgSend(v16, "numberWithDouble:");
      [*(id *)(*(void *)(a1[6] + 8) + 40) setObject:v17 forKeyedSubscript:v9];
    }
  }
}

void __67__CPLEngineSystemMonitor_getStatusDictionaryWithCompletionHandler___block_invoke_142(uint64_t a1, uint64_t a2)
{
  if (+[_CPLScheduledOverride isBudgetTypeSupportedForProgressiveOverriding:a2 withReason:0])
  {
    id v18 = +[_CPLScheduledOverride currentBudgetOverrideTimeIntervalStorageKeyForBudget:a2];
    double v4 = _CPLSystemMonitorReadOverrideTimeIntervalFromSharedDefaults(v18) / 3600.0;
    id v5 = +[_CPLScheduledOverride currentBudgetOverrideTimeIntervalExpiryDateStorageKeyForBudget:a2];
    id v6 = _CPLSystemMonitorReadOverrideTimeIntervalExpiryDateFromSharedDefaults(v5);

    if (v4 > 0.0)
    {
      uint64_t v7 = NSString;
      unint64_t v8 = [(id)objc_opt_class() descriptionForBudget:a2];
      char v9 = [v7 stringWithFormat:@"%@_lastUsedBudgetOverrideTime", v8];

      id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%.f hours", *(void *)&v4);
      [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v9];

      if (v6)
      {
        id v11 = NSString;
        uint64_t v12 = [(id)objc_opt_class() descriptionForBudget:a2];
        uint64_t v13 = [v11 stringWithFormat:@"%@_expiryDate", v12];

        uint64_t v14 = NSString;
        unint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v16 = +[CPLDateFormatter stringFromDateAgo:v6 now:v15];
        id v17 = [v14 stringWithFormat:@"%@", v16];
        [*(id *)(a1 + 40) setObject:v17 forKeyedSubscript:v13];
      }
    }
  }
}

- (void)getStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__CPLEngineSystemMonitor_getStatusWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E60A5EE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __57__CPLEngineSystemMonitor_getStatusWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = *MEMORY[0x1E4F1C810];
  [*(id *)(*(void *)(a1 + 32) + 16) removeCachedResourceValueForKey:*MEMORY[0x1E4F1C810]];
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  id v36 = 0;
  id v37 = 0;
  int v5 = [v4 getResourceValue:&v37 forKey:v3 error:&v36];
  id v6 = v37;
  id v7 = v36;
  if (!v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_28;
  }
  [v6 unsignedLongLongValue];
  if (_shouldIgnoreLowDiskSpace)
  {
    id v8 = @"ignoring low disk space";
  }
  else
  {
    unint64_t v9 = [*(id *)(a1 + 32) diskPressureState];
    if (v9 > 2) {
      id v8 = 0;
    }
    else {
      id v8 = off_1E60AACB8[v9];
    }
  }
  id v10 = [NSString alloc];
  id v11 = NSLocalizedFileSizeDescription();
  uint64_t v12 = (void *)[v10 initWithFormat:@"%@ - %@", v8, v11];
  [v2 addObject:v12];

  uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v13)
  {
    uint64_t v14 = [v13 networkState];
    unint64_t v15 = [v14 description];
    [v2 addObject:v15];
  }
  uint64_t v16 = +[CPLBatteryMonitor powerStatus];
  if (v16) {
    [v2 addObject:v16];
  }
  int out_token = 0;
  uint64_t state64 = 0;
  if (notify_register_check((const char *)*MEMORY[0x1E4F14918], &out_token)) {
    goto LABEL_13;
  }
  notify_get_state(out_token, &state64);
  notify_cancel(out_token);
  if ((uint64_t)state64 > 29)
  {
    switch(state64)
    {
      case 0x1EuLL:
        id v17 = @"Heavy";
        goto LABEL_14;
      case 0x28uLL:
        id v17 = @"Trapping";
        goto LABEL_14;
      case 0x32uLL:
        id v17 = @"Sleeping";
        goto LABEL_14;
    }
    goto LABEL_36;
  }
  if (state64)
  {
    if (state64 == 10)
    {
      id v17 = @"Light";
      goto LABEL_14;
    }
    if (state64 == 20)
    {
      id v17 = @"Moderate";
      goto LABEL_14;
    }
LABEL_36:
    id v17 = @"Unknown";
    goto LABEL_14;
  }
LABEL_13:
  id v17 = @"Nominal";
LABEL_14:
  id v18 = (void *)[[NSString alloc] initWithFormat:@"thermal level: %@", v17];
  [v2 addObject:v18];

  uint64_t v19 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v19 + 40))
  {
    v20 = *(void **)(v19 + 64);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __57__CPLEngineSystemMonitor_getStatusWithCompletionHandler___block_invoke_2;
    v32[3] = &unk_1E60AABF8;
    v32[4] = v19;
    id v21 = v2;
    id v33 = v21;
    [v20 enumerateKeysAndObjectsUsingBlock:v32];
    v22 = objc_opt_class();
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __57__CPLEngineSystemMonitor_getStatusWithCompletionHandler___block_invoke_3;
    v29[3] = &unk_1E60AAC20;
    id v23 = v21;
    uint64_t v24 = *(void *)(a1 + 32);
    id v30 = v23;
    uint64_t v31 = v24;
    [v22 enumerateSystemBudgets:18487 withBlock:v29];
  }
  else
  {
    [v2 addObject:@"engine does not support budget overrides"];
  }
  uint64_t v25 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v25 + 81))
  {
    if (*(unsigned char *)(v25 + 82)) {
      __int16 v26 = @"allowing operations boost (including background)";
    }
    else {
      __int16 v26 = @"allowing operations boost";
    }
    [v2 addObject:v26];
  }
  uint64_t v27 = *(void *)(a1 + 40);
  id v28 = [v2 componentsJoinedByString:@"\n"];
  (*(void (**)(uint64_t, void *, void))(v27 + 16))(v27, v28, 0);

LABEL_28:
}

void __57__CPLEngineSystemMonitor_getStatusWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v25 = v5;
  uint64_t v7 = [v5 unsignedIntegerValue];
  id v8 = objc_alloc(MEMORY[0x1E4F28E78]);
  unint64_t v9 = +[CPLEngineSystemMonitor descriptionForBudget:v7];
  id v10 = (void *)[v8 initWithFormat:@"overriding %@ budget: ", v9];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    char v14 = 1;
    uint64_t v15 = *(void *)v27;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v11);
        }
        id v17 = *(void **)(*((void *)&v26 + 1) + 8 * v16);
        if ((v14 & 1) == 0) {
          [v10 appendString:@", "];
        }
        if ([v17 integerValue] && objc_msgSend(v17, "integerValue") != 1)
        {
          unint64_t v22 = [v17 integerValue] - 1;
          id v23 = @"forced by user";
          if (v22 <= 3) {
            id v23 = off_1E60AACE8[v22];
          }
          [v10 appendString:v23];
        }
        else
        {
          id v18 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:v25];
          unint64_t v19 = [v17 integerValue] - 1;
          if (v18)
          {
            v20 = @"forced by user";
            if (v19 <= 3) {
              v20 = off_1E60AACE8[v19];
            }
            id v21 = [v18 status];
            [v10 appendFormat:@"%@ (%@)", v20, v21];
          }
          else
          {
            uint64_t v24 = @"forced by user";
            if (v19 <= 3) {
              uint64_t v24 = off_1E60AACE8[v19];
            }
            [v10 appendFormat:@"%@ (no scheduled end)", v24];
          }
        }
        char v14 = 0;
        ++v16;
      }
      while (v13 != v16);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      char v14 = 0;
    }
    while (v13);
  }

  [*(id *)(a1 + 40) addObject:v10];
}

void __57__CPLEngineSystemMonitor_getStatusWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (!+[_CPLScheduledOverride isBudgetTypeSupportedForProgressiveOverriding:a2 withReason:0])return; {
  id v19 = +[_CPLScheduledOverride currentBudgetOverrideTimeIntervalStorageKeyForBudget:a2];
  }
  double v4 = _CPLSystemMonitorReadOverrideTimeIntervalFromSharedDefaults(v19) / 3600.0;
  id v5 = +[_CPLScheduledOverride currentBudgetOverrideTimeIntervalExpiryDateStorageKeyForBudget:a2];
  id v6 = _CPLSystemMonitorReadOverrideTimeIntervalExpiryDateFromSharedDefaults(v5);

  if (v4 > 0.0)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;

    if (v9 <= 1.0)
    {
      if (v9 >= -1.0)
      {
        char v14 = &stru_1F0D5F858;
        goto LABEL_10;
      }
      uint64_t v13 = NSString;
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v12 = +[CPLDateFormatter stringFromDateAgo:v6 now:v11];
      [v13 stringWithFormat:@"already expired %@", v12];
    }
    else
    {
      id v10 = NSString;
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v12 = +[CPLDateFormatter stringFromDateAgo:v6 now:v11];
      [v10 stringWithFormat:@"expiring %@", v12];
    }
    char v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_10:
    uint64_t v15 = NSString;
    uint64_t v16 = *(void **)(a1 + 32);
    id v17 = [(id)objc_opt_class() descriptionForBudget:a2];
    id v18 = [v15 stringWithFormat:@"last used budget override time interval for %@: %.f hours. %@", v17, *(void *)&v4, v14];
    [v16 addObject:v18];
  }
}

- (unint64_t)freeDiskSpaceSize
{
  uint64_t v3 = *MEMORY[0x1E4F1C810];
  [(NSURL *)self->_volumeURL removeCachedResourceValueForKey:*MEMORY[0x1E4F1C810]];
  volumeURL = self->_volumeURL;
  id v6 = 0;
  if ([(NSURL *)volumeURL getResourceValue:&v6 forKey:v3 error:0]) {
    return [v6 unsignedLongLongValue];
  }
  else {
    return -1;
  }
}

- (unint64_t)diskPressureState
{
  if (_shouldIgnoreLowDiskSpace)
  {
    unint64_t v3 = 0;
    double v4 = 0;
  }
  else
  {
    uint64_t v5 = *MEMORY[0x1E4F1C810];
    [(NSURL *)self->_volumeURL removeCachedResourceValueForKey:*MEMORY[0x1E4F1C810]];
    volumeURL = self->_volumeURL;
    id v12 = 0;
    BOOL v7 = [(NSURL *)volumeURL getResourceValue:&v12 forKey:v5 error:0];
    id v8 = v12;
    double v4 = v8;
    if (v7)
    {
      unint64_t v9 = [v8 unsignedLongLongValue];
      if (v9 >> 29) {
        unint64_t v3 = v9 >> 30 == 0;
      }
      else {
        unint64_t v3 = 2;
      }
    }
    else
    {
      unint64_t v3 = 0;
    }
  }
  id v10 = [(CPLEngineSystemMonitor *)self engineLibrary];
  [v10 setLowDiskSpace:v3 != 0 veryLowDiskSpace:v3 == 2];

  return v3;
}

- (id)componentName
{
  return @"system";
}

- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__CPLEngineSystemMonitor_closeAndDeactivate_completionHandler___block_invoke;
  v8[3] = &unk_1E60A5EE8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __63__CPLEngineSystemMonitor_closeAndDeactivate_completionHandler___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  [*(id *)(*(void *)(a1 + 32) + 32) setDelegate:0];
  [*(id *)(*(void *)(a1 + 32) + 32) stop];
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  +[CPLBatteryMonitor setDelegate:0];
  *(unsigned char *)(*(void *)(a1 + 32) + 83) = 0;
  double v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__CPLEngineSystemMonitor_closeAndDeactivate_completionHandler___block_invoke_2;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = v4;
  [v4 _withSystemBudgetOverride:v6];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __63__CPLEngineSystemMonitor_closeAndDeactivate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _stopWatchingPermanentDataOverride];
  *(void *)(*(void *)(a1 + 32) + 56) = 18495;
  return result;
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__CPLEngineSystemMonitor_openWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E60A5EE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __52__CPLEngineSystemMonitor_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  *(unsigned char *)(*(void *)(a1 + 32) + 81) = [v2 BOOLForKey:@"CPLAllowOperationsBoost"];

  if (*(unsigned char *)(*(void *)(a1 + 32) + 81))
  {
    unint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    *(unsigned char *)(*(void *)(a1 + 32) + 82) = [v3 BOOLForKey:@"CPLAllowBackgroundOperationsBoost"];

    if (*(unsigned char *)(*(void *)(a1 + 32) + 82))
    {
      if (!_CPLSilentLogging)
      {
        id v4 = __CPLSystemMonitorOSLogDomain();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v5 = "Will boost operations, including background, when possible";
LABEL_9:
          _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else if (!_CPLSilentLogging)
    {
      id v4 = __CPLSystemMonitorOSLogDomain();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v5 = "Will boost operations when possible";
        goto LABEL_9;
      }
LABEL_10:
    }
  }
  id v6 = [[CPLNetworkWatcher alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = v6;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 32) start];
  +[CPLBatteryMonitor setDelegate:*(void *)(a1 + 32)];
  +[CPLBatteryMonitor startMonitoringPowerEvents];
  *(unsigned char *)(*(void *)(a1 + 32) + 83) = 1;
  id v9 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__CPLEngineSystemMonitor_openWithCompletionHandler___block_invoke_13;
  v11[3] = &unk_1E60A5DD8;
  v11[4] = v9;
  [v9 _withSystemBudgetOverride:v11];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __52__CPLEngineSystemMonitor_openWithCompletionHandler___block_invoke_13(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(a1 + 32) + 56) = 18495;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        *(void *)(*(void *)(a1 + 32) + 56) &= ~[*(id *)(*((void *)&v10 + 1) + 8 * v6++) unsignedIntegerValue];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 32) _startWatchingPermanentDataOverride];
  uint64_t v7 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__CPLEngineSystemMonitor_openWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E60AABD0;
  void v9[4] = *(void *)(a1 + 32);
  return [v7 enumerateSystemBudgets:18495 withBlock:v9];
}

uint64_t __52__CPLEngineSystemMonitor_openWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _attemptScheduleRecoveryOverride:a2 withReason:0];
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 _attemptScheduleRecoveryOverride:a2 withReason:1];
}

- (void)_attemptScheduleRecoveryOverride:(unint64_t)a3 withReason:(unint64_t)a4
{
  if (self->_supportsBudgetOverride)
  {
    scheduledOverrides = self->_scheduledOverrides;
    id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    id v9 = [(NSMutableDictionary *)scheduledOverrides objectForKeyedSubscript:v8];

    if (!v9)
    {
      long long v12 = [[_CPLScheduledOverride alloc] initWithBudget:a3 withReason:a4 queue:self->_queue];
      if ([(_CPLScheduledOverride *)v12 scheduleEndFromPersistedOverride])
      {
        [(_CPLScheduledOverride *)v12 setDelegate:self];
        long long v10 = self->_scheduledOverrides;
        long long v11 = [NSNumber numberWithUnsignedInteger:a3];
        [(NSMutableDictionary *)v10 setObject:v12 forKeyedSubscript:v11];

        [(CPLEngineSystemMonitor *)self _startOverridingBudget:a3 reason:a4];
      }
    }
  }
}

- (CPLEngineSystemMonitor)initWithEngineLibrary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPLEngineSystemMonitor;
  uint64_t v5 = [(CPLEngineSystemMonitor *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 clientLibraryBaseURL];
    uint64_t v7 = [v6 copy];
    volumeURL = v5->_volumeURL;
    v5->_volumeURL = (NSURL *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.cpl.systemmonitor", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    objc_storeWeak((id *)&v5->_engineLibrary, v4);
    long long v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    reasonsToOverrideSystemBudget = v5->_reasonsToOverrideSystemBudget;
    v5->_reasonsToOverrideSystemBudget = v11;

    long long v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    scheduledOverrides = v5->_scheduledOverrides;
    v5->_scheduledOverrides = v13;

    v5->_hasSetupBatteryMonitor = 0;
    v5->_supportsBudgetOverride = [v4 isSystemLibrary];
  }

  return v5;
}

+ (double)nextOverrideTimeIntervalForSystemBudgets:(unint64_t)a3
{
  uint64_t v8 = 0;
  dispatch_queue_t v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0x40AC200000000000;
  id v4 = objc_opt_class();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__CPLEngineSystemMonitor_nextOverrideTimeIntervalForSystemBudgets___block_invoke;
  v7[3] = &unk_1E60AAC98;
  v7[4] = &v8;
  [v4 enumerateSystemBudgets:a3 withBlock:v7];
  double v5 = fmin(v9[3], 86400.0);
  v9[3] = v5;
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __67__CPLEngineSystemMonitor_nextOverrideTimeIntervalForSystemBudgets___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = +[_CPLScheduledOverride nextTimeIntervalForOverridingBudget:a2 withReason:0];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(double *)(v5 + 24) >= v4) {
    double v4 = *(double *)(v5 + 24);
  }
  *(double *)(v5 + 24) = v4;
  return result;
}

+ (void)enumerateSystemBudgets:(unint64_t)a3 withBlock:(id)a4
{
  unint64_t v6 = 1;
  do
  {
    if ((v6 & a3) != 0) {
      (*((void (**)(id, unint64_t))a4 + 2))(a4, v6);
    }
    unint64_t v7 = v6 >> 5;
    v6 *= 2;
  }
  while (v7 < 0x121);
}

+ (id)descriptionForBudgets:(unint64_t)a3
{
  if (a3)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __48__CPLEngineSystemMonitor_descriptionForBudgets___block_invoke;
    long long v12 = &unk_1E60AAC70;
    id v13 = v5;
    id v14 = a1;
    id v6 = v5;
    [a1 enumerateSystemBudgets:a3 withBlock:&v9];
    unint64_t v7 = [v6 componentsJoinedByString:@", ", v9, v10, v11, v12];
  }
  else
  {
    unint64_t v7 = @"none";
  }
  return v7;
}

void __48__CPLEngineSystemMonitor_descriptionForBudgets___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) descriptionForBudget:a2];
  [v2 addObject:v3];
}

+ (id)descriptionForBudget:(unint64_t)a3
{
  if ((uint64_t)a3 > 15)
  {
    if ((uint64_t)a3 <= 2047)
    {
      if (a3 == 16)
      {
        id v3 = @"Low Data Mode";
        goto LABEL_19;
      }
      if (a3 == 32)
      {
        id v3 = @"Low Power Mode";
        goto LABEL_19;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x800uLL:
          id v3 = @"Thermal Moderate";
          goto LABEL_19;
        case 0x4000uLL:
          id v3 = @"All Other";
          goto LABEL_19;
        case 0x4837uLL:
          id v3 = @"All";
          goto LABEL_19;
      }
    }
LABEL_18:
    id v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"???(0x%lx)", a3);
  }
  else
  {
    id v3 = @"Data";
    switch(a3)
    {
      case 0uLL:
        id v3 = @"None";
        break;
      case 1uLL:
        break;
      case 2uLL:
        id v3 = @"Energy";
        break;
      case 4uLL:
        id v3 = @"SignificantWork";
        break;
      case 8uLL:
        id v3 = @"Foreground";
        break;
      default:
        goto LABEL_18;
    }
  }
LABEL_19:
  return v3;
}

+ (void)setShouldIgnoreLowDiskSpace:(BOOL)a3
{
  _shouldIgnoreLowDiskSpace = a3;
}

+ (BOOL)shouldIgnoreLowDiskSpace
{
  return _shouldIgnoreLowDiskSpace;
}

+ (void)initialize
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  _shouldIgnoreLowDiskSpace = [v2 BOOLForKey:@"CPLShouldIgnoreLowDiskSpace"];
}

@end