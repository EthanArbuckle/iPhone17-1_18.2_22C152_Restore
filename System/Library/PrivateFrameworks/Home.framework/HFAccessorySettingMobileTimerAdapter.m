@interface HFAccessorySettingMobileTimerAdapter
- (BOOL)isAdapterReady;
- (BOOL)shouldSynchronizeMobileTimerToHomeKit;
- (COAlarmManager)coordinationAlarmManager;
- (HFAccessorySettingMobileTimerAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 mode:(unint64_t)a5 updateHandler:(id)a6;
- (HFAccessorySettingMobileTimerAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 updateHandler:(id)a5;
- (HFAccessorySettingMobileTimerAdapter)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4;
- (HMAccessoryCollectionSetting)alarmCollectionSetting;
- (NAFuture)alarmManagerForSynchronizationFuture;
- (NAFuture)setupAccessoryAdapterModeFuture;
- (NSHashTable)observers;
- (NSMutableSet)internalAlarmsBeingAdded;
- (NSMutableSet)internalAlarmsBeingRemoved;
- (NSMutableSet)internalAlarmsBeingUpdated;
- (NSSet)alarmsWithPendingEdits;
- (NSUserDefaults)soundBoardPrefs;
- (id)_beginMonitoringSettingsKeyPath:(id)a3;
- (id)_synchronizeHomeKitToMobileTimer;
- (id)_synchronizeMobileTimerToHomeKitWithChangeType:(unint64_t)a3;
- (id)addAlarm:(id)a3;
- (id)alarmCollectionSettingFuture;
- (id)alarmManagerAlarms;
- (id)alarmSettingsCurrentItemsFuture;
- (id)allAlarms;
- (id)allAlarmsFuture;
- (id)removeAlarm:(id)a3;
- (id)updateAlarm:(id)a3;
- (void)_alarmWasAdded:(id)a3;
- (void)_alarmWasDeleted:(id)a3;
- (void)_alarmWasUpdated:(id)a3;
- (void)_notifyObserversOfUpdates;
- (void)_respondToAlarmManagerUpdate;
- (void)_setupDebugHandler;
- (void)_submitAnalyticsForAddedAlarm:(id)a3 success:(BOOL)a4;
- (void)_submitAnalyticsForDeletedAlarm:(id)a3 success:(BOOL)a4;
- (void)_submitAnalyticsForUpdatedAlarm:(id)a3 success:(BOOL)a4;
- (void)addObserver:(id)a3;
- (void)homeKitSettingWasUpdated:(id)a3 value:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setAlarmManagerForSynchronizationFuture:(id)a3;
- (void)setObservers:(id)a3;
- (void)setSoundBoardPrefs:(id)a3;
@end

@implementation HFAccessorySettingMobileTimerAdapter

- (HFAccessorySettingMobileTimerAdapter)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4
{
  v42[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v6)
  {
    v39 = [MEMORY[0x263F08690] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"HFAccessorySettingMobileTimerAdapter.m", 84, @"Invalid parameter not satisfying: %@", @"homeKitSettingsVendor" object file lineNumber description];
  }
  v42[0] = @"root.mobileTimer.alarms";
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:1];
  v8 = (void *)MEMORY[0x263F0DF48];
  v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
  v15 = v8;
  v16 = (void *)v7;
  [v15 setItemValueClasses:v14 forKeyPath:@"root.mobileTimer.alarms"];

  v17 = [MEMORY[0x263EFFA08] setWithArray:v7];
  v41.receiver = self;
  v41.super_class = (Class)HFAccessorySettingMobileTimerAdapter;
  v18 = [(HFAccessorySettingAdapter *)&v41 initWithHomeKitSettingsVendor:v6 keyPaths:v17 mode:a4 updateHandler:0];

  v19 = v6;
  if (v18)
  {
    uint64_t v20 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v18->_observers;
    v18->_observers = (NSHashTable *)v20;

    uint64_t v22 = [MEMORY[0x263EFF9C0] set];
    internalAlarmsBeingAdded = v18->_internalAlarmsBeingAdded;
    v18->_internalAlarmsBeingAdded = (NSMutableSet *)v22;

    uint64_t v24 = [MEMORY[0x263EFF9C0] set];
    internalAlarmsBeingRemoved = v18->_internalAlarmsBeingRemoved;
    v18->_internalAlarmsBeingRemoved = (NSMutableSet *)v24;

    uint64_t v26 = [MEMORY[0x263EFF9C0] set];
    internalAlarmsBeingUpdated = v18->_internalAlarmsBeingUpdated;
    v18->_internalAlarmsBeingUpdated = (NSMutableSet *)v26;

    [(HFAccessorySettingMobileTimerAdapter *)v18 _setupDebugHandler];
    uint64_t v28 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.soundboard"];
    soundBoardPrefs = v18->_soundBoardPrefs;
    v18->_soundBoardPrefs = (NSUserDefaults *)v28;

    if (_os_feature_enabled_impl())
    {
      id v30 = v6;
      if ([v30 conformsToProtocol:&unk_26C155B48]) {
        v31 = v30;
      }
      else {
        v31 = 0;
      }
      id v32 = v31;

      v33 = [v32 accessories];

      v34 = (void *)MEMORY[0x263F33F38];
      v35 = [v33 anyObject];
      uint64_t v36 = objc_msgSend(v34, "hf_AlarmManagerForAccessory:", v35);
      coordinationAlarmManager = v18->_coordinationAlarmManager;
      v18->_coordinationAlarmManager = (COAlarmManager *)v36;
    }
  }

  return v18;
}

- (HFAccessorySettingMobileTimerAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 mode:(unint64_t)a5 updateHandler:(id)a6
{
  v8 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5, a6);
  v9 = NSStringFromSelector(sel_initWithHomeKitSettingsVendor_mode_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessorySettingMobileTimerAdapter.m", 124, @"%s is unavailable; use %@ instead",
    "-[HFAccessorySettingMobileTimerAdapter initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:]",
    v9);

  return 0;
}

- (HFAccessorySettingMobileTimerAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 updateHandler:(id)a5
{
  uint64_t v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  v8 = NSStringFromSelector(sel_initWithHomeKitSettingsVendor_mode_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessorySettingMobileTimerAdapter.m", 129, @"%s is unavailable; use %@ instead",
    "-[HFAccessorySettingMobileTimerAdapter initWithHomeKitSettingsVendor:keyPaths:updateHandler:]",
    v8);

  return 0;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFAccessorySettingMobileTimerAdapter *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFAccessorySettingMobileTimerAdapter *)self observers];
  [v5 removeObject:v4];
}

- (NSSet)alarmsWithPendingEdits
{
  v3 = objc_opt_new();
  id v4 = [(HFAccessorySettingMobileTimerAdapter *)self internalAlarmsBeingAdded];
  [v3 unionSet:v4];

  id v5 = [(HFAccessorySettingMobileTimerAdapter *)self internalAlarmsBeingUpdated];
  [v3 unionSet:v5];

  id v6 = [(HFAccessorySettingMobileTimerAdapter *)self internalAlarmsBeingRemoved];
  [v3 unionSet:v6];

  return (NSSet *)v3;
}

- (HMAccessoryCollectionSetting)alarmCollectionSetting
{
  return (HMAccessoryCollectionSetting *)[(HFAccessorySettingAdapter *)self settingForKeyPath:@"root.mobileTimer.alarms"];
}

- (BOOL)isAdapterReady
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  id v4 = [(HFAccessorySettingMobileTimerAdapter *)self alarmCollectionSetting];
  BOOL v3 = v4 != 0;

  return v3;
}

- (BOOL)shouldSynchronizeMobileTimerToHomeKit
{
  return 1;
}

- (void)homeKitSettingWasUpdated:(id)a3 value:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_debug_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEBUG, "Setting '%@' was updated to: %@", (uint8_t *)&v12, 0x16u);
  }

  v9 = [v6 keyPath];
  int v10 = [v9 isEqual:@"root.mobileTimer.alarms"];

  if (v10)
  {
    [(HFAccessorySettingMobileTimerAdapter *)self _notifyObserversOfUpdates];
    id v11 = [(HFAccessorySettingMobileTimerAdapter *)self _synchronizeHomeKitToMobileTimer];
  }
}

- (id)allAlarms
{
  v2 = (void *)MEMORY[0x263F55D40];
  BOOL v3 = [(HFAccessorySettingAdapter *)self valueManager];
  id v4 = [v3 valueForSettingAtKeyPath:@"root.mobileTimer.alarms"];
  id v5 = objc_msgSend(v2, "hf_buildAlarmsFromCollectionSettingItems:", v4);

  return v5;
}

- (id)allAlarmsFuture
{
  if (_os_feature_enabled_impl()
    && ([(HFAccessorySettingMobileTimerAdapter *)self coordinationAlarmManager],
        (BOOL v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = v3;
    id v5 = [v3 alarms];
    id v6 = [MEMORY[0x263F581B8] mainThreadScheduler];
    id v7 = [v5 reschedule:v6];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __55__HFAccessorySettingMobileTimerAdapter_allAlarmsFuture__block_invoke;
    v10[3] = &unk_26408FAA0;
    v10[4] = self;
    v8 = [v7 flatMap:v10];
  }
  else
  {
    id v4 = [(HFAccessorySettingMobileTimerAdapter *)self alarmSettingsCurrentItemsFuture];
    v8 = [v4 flatMap:&__block_literal_global_199];
  }

  return v8;
}

id __55__HFAccessorySettingMobileTimerAdapter_allAlarmsFuture__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263EFF980] arrayWithArray:a2];
  id v4 = [*(id *)(a1 + 32) internalAlarmsBeingAdded];
  id v5 = [v4 allObjects];
  [v3 addObjectsFromArray:v5];

  id v6 = [*(id *)(a1 + 32) internalAlarmsBeingAdded];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = HFLogForCategory(4uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 32);
      int v10 = [v9 internalAlarmsBeingAdded];
      int v13 = 136315650;
      __int16 v14 = "-[HFAccessorySettingMobileTimerAdapter allAlarmsFuture]_block_invoke";
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2048;
      uint64_t v18 = [v10 count];
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "%s(%@): reporting %lu new-alarms-being-added to the offical Coordination set", (uint8_t *)&v13, 0x20u);
    }
  }
  id v11 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v11;
}

id __55__HFAccessorySettingMobileTimerAdapter_allAlarmsFuture__block_invoke_289(uint64_t a1, uint64_t a2)
{
  v2 = objc_msgSend(MEMORY[0x263F55D40], "hf_buildAlarmsFromCollectionSettingItems:", a2);
  BOOL v3 = [MEMORY[0x263F58190] futureWithResult:v2];

  return v3;
}

- (id)alarmSettingsCurrentItemsFuture
{
  BOOL v3 = [(HFAccessorySettingAdapter *)self valueManager];
  id v4 = [(HFAccessorySettingAdapter *)self settingWatchFutureForKeyPath:@"root.mobileTimer.alarms"];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__HFAccessorySettingMobileTimerAdapter_alarmSettingsCurrentItemsFuture__block_invoke;
  v8[3] = &unk_26409A4D8;
  id v9 = v3;
  id v5 = v3;
  id v6 = [v4 flatMap:v8];

  return v6;
}

id __71__HFAccessorySettingMobileTimerAdapter_alarmSettingsCurrentItemsFuture__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = (void *)MEMORY[0x263F58190];
  BOOL v3 = [*(id *)(a1 + 32) valueForSetting:a2];
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

- (id)alarmManagerAlarms
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (_os_feature_enabled_impl()
    && ([(HFAccessorySettingMobileTimerAdapter *)self coordinationAlarmManager],
        (BOOL v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = v3;
    id v5 = [v3 alarms];
  }
  else
  {
    id v4 = [(HFAccessorySettingMobileTimerAdapter *)self alarmManagerForSynchronizationFuture];
    id v6 = [v4 flatMap:&__block_literal_global_293];
    uint64_t v7 = [v6 flatMap:&__block_literal_global_295_0];
    v8 = [MEMORY[0x263F581B8] mainThreadScheduler];
    id v5 = [v7 reschedule:v8];
  }
  return v5;
}

uint64_t __58__HFAccessorySettingMobileTimerAdapter_alarmManagerAlarms__block_invoke(uint64_t a1, void *a2)
{
  return [a2 alarms];
}

id __58__HFAccessorySettingMobileTimerAdapter_alarmManagerAlarms__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F58190];
  BOOL v3 = [a2 sortedArrayUsingSelector:sel_compare_];
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

- (id)updateAlarm:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(HFAccessorySettingMobileTimerAdapter *)self internalAlarmsBeingUpdated];
  [v5 addObject:v4];

  id v6 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v4;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Updating alarm %@", buf, 0xCu);
  }

  if (!_os_feature_enabled_impl()) {
    goto LABEL_6;
  }
  uint64_t v7 = [(HFAccessorySettingMobileTimerAdapter *)self coordinationAlarmManager];
  if (!v7
    || (v8 = (void *)v7,
        [(HFAccessorySettingMobileTimerAdapter *)self coordinationAlarmManager],
        id v9 = objc_claimAutoreleasedReturnValue(),
        [v9 updateAlarm:v4],
        int v10 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        !v10))
  {
LABEL_6:
    id v11 = [(HFAccessorySettingAdapter *)self valueManager];
    int v12 = [(HFAccessorySettingMobileTimerAdapter *)self alarmCollectionSettingFuture];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __52__HFAccessorySettingMobileTimerAdapter_updateAlarm___block_invoke;
    v19[3] = &unk_26409A520;
    id v20 = v11;
    id v21 = v4;
    id v13 = v11;
    int v10 = [v12 flatMap:v19];
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __52__HFAccessorySettingMobileTimerAdapter_updateAlarm___block_invoke_2;
  v17[3] = &unk_26408F238;
  v17[4] = self;
  id v18 = v4;
  id v14 = v4;
  id v15 = (id)[v10 addCompletionBlock:v17];

  return v10;
}

id __52__HFAccessorySettingMobileTimerAdapter_updateAlarm___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 valueForSetting:v4];
  id v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = (void *)MEMORY[0x263F0DF50];
  v8 = [*(id *)(a1 + 40) alarmID];
  id v9 = objc_msgSend(v7, "hf_alarmItemsMatchingAlarmId:withinItemArray:", v8, v6);
  [v6 removeObjectsInArray:v9];

  int v10 = objc_msgSend(MEMORY[0x263F0DF50], "hf_collectionSettingItemForAlarm:", *(void *)(a1 + 40));
  [v6 addObject:v10];

  id v11 = [*(id *)(a1 + 32) changeValueForSetting:v4 toValue:v6 changeType:1];

  return v11;
}

uint64_t __52__HFAccessorySettingMobileTimerAdapter_updateAlarm___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    id v5 = a3;
    id v6 = +[HFErrorHandler sharedHandler];
    [v6 logError:v5 operationDescription:@"updateAlarm:"];
  }
  [*(id *)(a1 + 32) _submitAnalyticsForUpdatedAlarm:*(void *)(a1 + 40) success:a3 == 0];
  uint64_t v7 = [*(id *)(a1 + 32) internalAlarmsBeingUpdated];
  [v7 removeObject:*(void *)(a1 + 40)];

  v8 = *(void **)(a1 + 32);
  return [v8 _notifyObserversOfUpdates];
}

- (id)removeAlarm:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = (HFAccessorySettingMobileTimerAdapter *)a3;
  if (v5)
  {
    dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
    id v6 = [(HFAccessorySettingMobileTimerAdapter *)self internalAlarmsBeingRemoved];
    [v6 addObject:v5];

    uint64_t v7 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v5;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Remove alarm %@", buf, 0xCu);
    }

    if (!_os_feature_enabled_impl()) {
      goto LABEL_14;
    }
    v8 = [(HFAccessorySettingMobileTimerAdapter *)self coordinationAlarmManager];
    if (v8)
    {
      id v9 = [(HFAccessorySettingMobileTimerAdapter *)self coordinationAlarmManager];
      int v10 = [v9 removeAlarm:v5];
    }
    else
    {
      int v10 = 0;
    }
    [(HFAccessorySettingMobileTimerAdapter *)self _notifyObserversOfUpdates];

    if (!v10)
    {
LABEL_14:
      id v14 = [(HFAccessorySettingAdapter *)self valueManager];
      id v15 = [(HFAccessorySettingMobileTimerAdapter *)self alarmCollectionSettingFuture];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __52__HFAccessorySettingMobileTimerAdapter_removeAlarm___block_invoke;
      v22[3] = &unk_26409A520;
      id v23 = v14;
      uint64_t v24 = v5;
      id v16 = v14;
      int v10 = [v15 flatMap:v22];
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __52__HFAccessorySettingMobileTimerAdapter_removeAlarm___block_invoke_2;
    v20[3] = &unk_26408F238;
    v20[4] = self;
    id v21 = v5;
    id v17 = (id)[v10 addCompletionBlock:v20];
  }
  else
  {
    id v11 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = self;
      __int16 v27 = 2112;
      uint64_t v28 = v19;
      _os_log_error_impl(&dword_20B986000, v11, OS_LOG_TYPE_ERROR, "%@:%@ nil alarm. If you can reproduce this, please file a radar!", buf, 0x16u);
    }
    if (+[HFUtilities isInternalInstall])
    {
      int v12 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", -1);
      id v13 = +[HFErrorHandler sharedHandler];
      [v13 handleError:v12 operationType:@"HFOperationRemoveHomePodAlarm" options:0 retryBlock:0 cancelBlock:0];
    }
    int v10 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v10;
}

id __52__HFAccessorySettingMobileTimerAdapter_removeAlarm___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 valueForSetting:v4];
  id v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = (void *)MEMORY[0x263F0DF50];
  v8 = [*(id *)(a1 + 40) alarmID];
  id v9 = objc_msgSend(v7, "hf_alarmItemsMatchingAlarmId:withinItemArray:", v8, v6);
  [v6 removeObjectsInArray:v9];

  int v10 = [*(id *)(a1 + 32) changeValueForSetting:v4 toValue:v6 changeType:1];

  return v10;
}

void __52__HFAccessorySettingMobileTimerAdapter_removeAlarm___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = +[HFErrorHandler sharedHandler];
    [v6 logError:v5 operationDescription:@"removeAlarm:"];
  }
  [*(id *)(a1 + 32) _submitAnalyticsForDeletedAlarm:*(void *)(a1 + 40) success:v5 == 0];
  uint64_t v7 = [*(id *)(a1 + 32) internalAlarmsBeingRemoved];
  [v7 removeObject:*(void *)(a1 + 40)];

  if (!v5) {
    [*(id *)(a1 + 32) _notifyObserversOfUpdates];
  }
}

- (id)addAlarm:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(HFAccessorySettingMobileTimerAdapter *)self internalAlarmsBeingAdded];
  [v5 addObject:v4];

  id v6 = HFLogForCategory(4uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v4;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Adding alarm %@", buf, 0xCu);
  }

  if (!_os_feature_enabled_impl()) {
    goto LABEL_8;
  }
  uint64_t v7 = [(HFAccessorySettingMobileTimerAdapter *)self coordinationAlarmManager];
  if (v7)
  {
    id v8 = [(HFAccessorySettingMobileTimerAdapter *)self coordinationAlarmManager];
    id v9 = [v8 addAlarm:v4];
  }
  else
  {
    id v9 = 0;
  }
  [(HFAccessorySettingMobileTimerAdapter *)self _notifyObserversOfUpdates];

  if (!v9)
  {
LABEL_8:
    int v10 = [(HFAccessorySettingAdapter *)self valueManager];
    id v11 = objc_msgSend(MEMORY[0x263F0DF50], "hf_collectionSettingItemForAlarm:", v4);
    int v12 = [(HFAccessorySettingMobileTimerAdapter *)self alarmCollectionSettingFuture];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __49__HFAccessorySettingMobileTimerAdapter_addAlarm___block_invoke;
    v20[3] = &unk_26409A520;
    id v21 = v10;
    id v22 = v11;
    id v13 = v11;
    id v14 = v10;
    id v9 = [v12 flatMap:v20];
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __49__HFAccessorySettingMobileTimerAdapter_addAlarm___block_invoke_2;
  v18[3] = &unk_26408F238;
  v18[4] = self;
  id v19 = v4;
  id v15 = v4;
  id v16 = (id)[v9 addCompletionBlock:v18];

  return v9;
}

id __49__HFAccessorySettingMobileTimerAdapter_addAlarm___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 valueForSetting:v4];
  id v6 = [v5 arrayByAddingObject:*(void *)(a1 + 40)];
  uint64_t v7 = [*(id *)(a1 + 32) changeValueForSetting:v4 toValue:v6 changeType:1];

  return v7;
}

void __49__HFAccessorySettingMobileTimerAdapter_addAlarm___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HFLogForCategory(4uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v9 = 136315650;
    int v10 = "-[HFAccessorySettingMobileTimerAdapter addAlarm:]_block_invoke_2";
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%s(%@): alarm added with %@ result ", (uint8_t *)&v9, 0x20u);
  }

  if (v4)
  {
    uint64_t v7 = +[HFErrorHandler sharedHandler];
    [v7 logError:v4 operationDescription:@"addAlarm:"];
  }
  [*(id *)(a1 + 32) _submitAnalyticsForAddedAlarm:*(void *)(a1 + 40) success:v4 == 0];
  id v8 = [*(id *)(a1 + 32) internalAlarmsBeingAdded];
  [v8 removeObject:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) _notifyObserversOfUpdates];
}

- (id)alarmCollectionSettingFuture
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  BOOL v3 = [(HFAccessorySettingAdapter *)self settingWatchFutureForKeyPath:@"root.mobileTimer.alarms"];
  id v4 = [v3 flatMap:&__block_literal_global_314];

  return v4;
}

id __68__HFAccessorySettingMobileTimerAdapter_alarmCollectionSettingFuture__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = (void *)MEMORY[0x263F58190];
  uint64_t v4 = objc_opt_class();
  id v5 = v2;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = v5;
    if (v6) {
      goto LABEL_8;
    }
    id v8 = [MEMORY[0x263F08690] currentHandler];
    int v9 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v8 handleFailureInFunction:v9, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v4, objc_opt_class() file lineNumber description];
  }
  uint64_t v7 = 0;
LABEL_8:

  int v10 = [v3 futureWithResult:v7];

  return v10;
}

- (id)_synchronizeHomeKitToMobileTimer
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ([(HFAccessorySettingAdapter *)self mode])
  {
    objc_initWeak(&location, self);
    BOOL v3 = [(HFAccessorySettingMobileTimerAdapter *)self alarmManagerForSynchronizationFuture];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    int v10 = __72__HFAccessorySettingMobileTimerAdapter__synchronizeHomeKitToMobileTimer__block_invoke;
    __int16 v11 = &unk_26409A548;
    objc_copyWeak(&v12, &location);
    uint64_t v4 = [v3 flatMap:&v8];
    id v5 = objc_msgSend(v4, "addSuccessBlock:", &__block_literal_global_319_0, v8, v9, v10, v11);
    uint64_t v6 = [v5 addFailureBlock:&__block_literal_global_323_0];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  return v6;
}

id __72__HFAccessorySettingMobileTimerAdapter__synchronizeHomeKitToMobileTimer__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = [WeakRetained alarmManagerAlarms];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__HFAccessorySettingMobileTimerAdapter__synchronizeHomeKitToMobileTimer__block_invoke_2;
  v10[3] = &unk_264098C30;
  objc_copyWeak(&v12, v4);
  id v7 = v3;
  id v11 = v7;
  uint64_t v8 = [v6 flatMap:v10];

  objc_destroyWeak(&v12);
  return v8;
}

id __72__HFAccessorySettingMobileTimerAdapter__synchronizeHomeKitToMobileTimer__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained allAlarmsFuture];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__HFAccessorySettingMobileTimerAdapter__synchronizeHomeKitToMobileTimer__block_invoke_3;
  v9[3] = &unk_264096D00;
  id v10 = v3;
  id v11 = *(id *)(a1 + 32);
  id v6 = v3;
  id v7 = [v5 flatMap:v9];

  return v7;
}

id __72__HFAccessorySettingMobileTimerAdapter__synchronizeHomeKitToMobileTimer__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFFA08] setWithArray:a2];
  uint64_t v4 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 32)];
  id v5 = +[HFAlarmDiff generateAlarmDiffFromSet:v3 toSet:v4];

  id v6 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v5;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Synchronizing HomeKit->MobileTimer: %@", buf, 0xCu);
  }

  if ([v5 inputWasEqual])
  {
    id v7 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    uint64_t v8 = objc_opt_new();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v9 = [v5 addedAlarms];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v39 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [*(id *)(a1 + 40) addAlarm:*(void *)(*((void *)&v38 + 1) + 8 * i)];
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v11);
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v15 = [v5 updatedAlarms];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v35 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = [*(id *)(a1 + 40) updateAlarm:*(void *)(*((void *)&v34 + 1) + 8 * j)];
          [v8 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v17);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v21 = objc_msgSend(v5, "deletedAlarms", 0);
    uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v31;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = [*(id *)(a1 + 40) removeAlarm:*(void *)(*((void *)&v30 + 1) + 8 * k)];
          [v8 addObject:v26];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v23);
    }

    __int16 v27 = (void *)MEMORY[0x263F58190];
    uint64_t v28 = [MEMORY[0x263F581B8] mainThreadScheduler];
    id v7 = [v27 combineAllFutures:v8 ignoringErrors:0 scheduler:v28];
  }
  return v7;
}

void __72__HFAccessorySettingMobileTimerAdapter__synchronizeHomeKitToMobileTimer__block_invoke_316()
{
  v0 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20B986000, v0, OS_LOG_TYPE_DEFAULT, "Synchronized Alarms to MTAlarmManager!", v1, 2u);
  }
}

void __72__HFAccessorySettingMobileTimerAdapter__synchronizeHomeKitToMobileTimer__block_invoke_320(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_20B986000, v3, OS_LOG_TYPE_ERROR, "FAILED to Synchronize Alarms to MTAlarmManager: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)_synchronizeMobileTimerToHomeKitWithChangeType:(unint64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ([(HFAccessorySettingAdapter *)self mode])
  {
    id v5 = [(HFAccessorySettingAdapter *)self valueManager];
    objc_initWeak(&location, self);
    uint64_t v6 = [(HFAccessorySettingMobileTimerAdapter *)self alarmManagerAlarms];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __87__HFAccessorySettingMobileTimerAdapter__synchronizeMobileTimerToHomeKitWithChangeType___block_invoke;
    v10[3] = &unk_2640927C0;
    objc_copyWeak(v12, &location);
    v12[1] = (id)a3;
    id v7 = v5;
    id v11 = v7;
    uint64_t v8 = [v6 flatMap:v10];

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  return v8;
}

id __87__HFAccessorySettingMobileTimerAdapter__synchronizeMobileTimerToHomeKitWithChangeType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained alarmSettingsCurrentItemsFuture];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __87__HFAccessorySettingMobileTimerAdapter__synchronizeMobileTimerToHomeKitWithChangeType___block_invoke_2;
  v9[3] = &unk_26409A5D8;
  uint64_t v13 = *(void *)(a1 + 48);
  id v10 = v3;
  id v11 = WeakRetained;
  id v12 = *(id *)(a1 + 32);
  id v6 = v3;
  id v7 = [v5 flatMap:v9];

  return v7;
}

id __87__HFAccessorySettingMobileTimerAdapter__synchronizeMobileTimerToHomeKitWithChangeType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 32)];
  id v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = objc_msgSend(v3, "na_map:", &__block_literal_global_326_0);
  id v7 = [v5 setWithArray:v6];

  uint64_t v8 = *(void *)(a1 + 56);
  if (v8 == 1)
  {
    id v50 = v3;
    uint64_t v13 = (void *)[v3 mutableCopy];
    id v14 = v13;
    if (v13) {
      id v15 = v13;
    }
    else {
      id v15 = (id)objc_opt_new();
    }
    uint64_t v16 = v15;

    v48 = v7;
    v49 = v4;
    uint64_t v17 = +[HFAlarmDiff generateAlarmDiffFromSet:v4 toSet:v7];
    uint64_t v18 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v71 = v17;
      _os_log_impl(&dword_20B986000, v18, OS_LOG_TYPE_DEFAULT, "Atomic Synchronization of Alarms Settings: %@", buf, 0xCu);
    }

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v19 = [v17 addedAlarms];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v63 objects:v69 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v64 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = objc_msgSend(MEMORY[0x263F0DF50], "hf_collectionSettingItemForAlarm:", *(void *)(*((void *)&v63 + 1) + 8 * i));
          [v16 addObject:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v63 objects:v69 count:16];
      }
      while (v21);
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v60 = 0u;
    long long v59 = 0u;
    uint64_t v47 = v17;
    uint64_t v25 = [v17 updatedAlarms];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v59 objects:v68 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v60;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v60 != v28) {
            objc_enumerationMutation(v25);
          }
          long long v30 = *(void **)(*((void *)&v59 + 1) + 8 * j);
          long long v31 = objc_msgSend(MEMORY[0x263F0DF50], "hf_collectionSettingItemForAlarm:", v30);
          long long v32 = (void *)MEMORY[0x263F0DF50];
          long long v33 = [v30 alarmID];
          long long v34 = objc_msgSend(v32, "hf_alarmItemsMatchingAlarmId:withinItemArray:", v33, v16);
          [v16 removeObjectsInArray:v34];

          [v16 addObject:v31];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v59 objects:v68 count:16];
      }
      while (v27);
    }

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v35 = [v47 deletedAlarms];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v55 objects:v67 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v56;
      do
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v56 != v38) {
            objc_enumerationMutation(v35);
          }
          long long v40 = (void *)MEMORY[0x263F0DF50];
          long long v41 = [*(id *)(*((void *)&v55 + 1) + 8 * k) alarmID];
          v42 = objc_msgSend(v40, "hf_alarmItemsMatchingAlarmId:withinItemArray:", v41, v16);
          [v16 removeObjectsInArray:v42];
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v55 objects:v67 count:16];
      }
      while (v37);
    }

    id v12 = (id)[v16 copy];
    int v4 = v49;
    id v3 = v50;
    id v7 = v48;
  }
  else if (v8)
  {
    id v12 = 0;
  }
  else
  {
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_329);
    id v10 = (void *)v9;
    id v11 = (void *)MEMORY[0x263EFFA68];
    if (v9) {
      id v11 = (void *)v9;
    }
    id v12 = v11;
  }
  v43 = [*(id *)(a1 + 40) alarmCollectionSettingFuture];
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __87__HFAccessorySettingMobileTimerAdapter__synchronizeMobileTimerToHomeKitWithChangeType___block_invoke_330;
  v51[3] = &unk_26409A5B0;
  id v52 = *(id *)(a1 + 48);
  id v53 = v12;
  uint64_t v54 = *(void *)(a1 + 56);
  id v44 = v12;
  v45 = [v43 flatMap:v51];

  return v45;
}

uint64_t __87__HFAccessorySettingMobileTimerAdapter__synchronizeMobileTimerToHomeKitWithChangeType___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x263F55D40], "hf_buildAlarmFromCollectionSettingItem:", a2);
}

uint64_t __87__HFAccessorySettingMobileTimerAdapter__synchronizeMobileTimerToHomeKitWithChangeType___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x263F0DF50], "hf_collectionSettingItemForAlarm:", a2);
}

uint64_t __87__HFAccessorySettingMobileTimerAdapter__synchronizeMobileTimerToHomeKitWithChangeType___block_invoke_330(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) changeValueForSetting:a2 toValue:*(void *)(a1 + 40) changeType:*(void *)(a1 + 48)];
}

- (NAFuture)alarmManagerForSynchronizationFuture
{
  alarmManagerForSynchronizationFuture = self->_alarmManagerForSynchronizationFuture;
  if (alarmManagerForSynchronizationFuture)
  {
    id v3 = alarmManagerForSynchronizationFuture;
  }
  else
  {
    objc_initWeak(&location, self);
    id v5 = (void *)MEMORY[0x263F58190];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __76__HFAccessorySettingMobileTimerAdapter_alarmManagerForSynchronizationFuture__block_invoke;
    id v14 = &unk_26408F0F0;
    objc_copyWeak(&v15, &location);
    id v6 = [v5 futureWithBlock:&v11];
    id v7 = objc_msgSend(MEMORY[0x263F581B8], "mainThreadScheduler", v11, v12, v13, v14);
    uint64_t v8 = [v6 reschedule:v7];
    uint64_t v9 = self->_alarmManagerForSynchronizationFuture;
    self->_alarmManagerForSynchronizationFuture = v8;

    id v3 = self->_alarmManagerForSynchronizationFuture;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __76__HFAccessorySettingMobileTimerAdapter_alarmManagerForSynchronizationFuture__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained mode] == 1)
  {
    int v4 = objc_opt_new();
    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:WeakRetained selector:sel__alarmWasAdded_ name:*MEMORY[0x263F55CA0] object:v4];

    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:WeakRetained selector:sel__alarmWasDeleted_ name:*MEMORY[0x263F55CB8] object:v4];

    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:WeakRetained selector:sel__alarmWasUpdated_ name:*MEMORY[0x263F55CC0] object:v4];

    [v8 finishWithResult:v4];
  }
  else
  {
    [v8 finishWithNoResult];
  }
}

- (void)_submitAnalyticsForAddedAlarm:(id)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  void v20[5] = *MEMORY[0x263EF8340];
  v19[0] = @"homePodAlarmID";
  id v5 = a3;
  id v6 = [v5 alarmIDString];
  v20[0] = v6;
  v19[1] = @"alarmCreatedSuccessfully";
  id v7 = [NSNumber numberWithBool:v4];
  v20[1] = v7;
  v19[2] = @"isMusicAlarm";
  id v8 = NSNumber;
  uint64_t v9 = [v5 sound];
  id v10 = [v8 numberWithInt:v9 != 0];
  v20[2] = v10;
  v19[3] = @"hasCustomVolume";
  uint64_t v11 = NSNumber;
  uint64_t v12 = [v5 sound];
  uint64_t v13 = [v11 numberWithInt:v12 != 0];
  v20[3] = v13;
  void v19[4] = @"customVolumeLevel";
  id v14 = [v5 sound];

  uint64_t v15 = [v14 soundVolume];
  uint64_t v16 = (void *)v15;
  uint64_t v17 = &unk_26C0F8068;
  if (v15) {
    uint64_t v17 = (void *)v15;
  }
  void v20[4] = v17;
  uint64_t v18 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:5];
  +[HFAnalytics sendEvent:15 withData:v18];
}

- (void)_submitAnalyticsForUpdatedAlarm:(id)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  void v20[5] = *MEMORY[0x263EF8340];
  v19[0] = @"homePodAlarmID";
  id v5 = a3;
  id v6 = [v5 alarmIDString];
  v20[0] = v6;
  v19[1] = @"alarmUpdatedSuccessfully";
  id v7 = [NSNumber numberWithBool:v4];
  v20[1] = v7;
  v19[2] = @"isMusicAlarm";
  id v8 = NSNumber;
  uint64_t v9 = [v5 sound];
  id v10 = [v8 numberWithInt:v9 != 0];
  v20[2] = v10;
  v19[3] = @"hasCustomVolume";
  uint64_t v11 = NSNumber;
  uint64_t v12 = [v5 sound];
  uint64_t v13 = [v11 numberWithInt:v12 != 0];
  v20[3] = v13;
  void v19[4] = @"customVolumeLevel";
  id v14 = [v5 sound];

  uint64_t v15 = [v14 soundVolume];
  uint64_t v16 = (void *)v15;
  uint64_t v17 = &unk_26C0F8068;
  if (v15) {
    uint64_t v17 = (void *)v15;
  }
  void v20[4] = v17;
  uint64_t v18 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:5];
  +[HFAnalytics sendEvent:16 withData:v18];
}

- (void)_submitAnalyticsForDeletedAlarm:(id)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  void v20[5] = *MEMORY[0x263EF8340];
  v19[0] = @"homePodAlarmID";
  id v5 = a3;
  id v6 = [v5 alarmIDString];
  v20[0] = v6;
  v19[1] = @"alarmDeletedSuccessfully";
  id v7 = [NSNumber numberWithBool:v4];
  v20[1] = v7;
  v19[2] = @"isMusicAlarm";
  id v8 = NSNumber;
  uint64_t v9 = [v5 sound];
  id v10 = [v8 numberWithInt:v9 != 0];
  v20[2] = v10;
  v19[3] = @"hasCustomVolume";
  uint64_t v11 = NSNumber;
  uint64_t v12 = [v5 sound];
  uint64_t v13 = [v11 numberWithInt:v12 != 0];
  v20[3] = v13;
  void v19[4] = @"customVolumeLevel";
  id v14 = [v5 sound];

  uint64_t v15 = [v14 soundVolume];
  uint64_t v16 = (void *)v15;
  uint64_t v17 = &unk_26C0F8068;
  if (v15) {
    uint64_t v17 = (void *)v15;
  }
  void v20[4] = v17;
  uint64_t v18 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:5];
  +[HFAnalytics sendEvent:17 withData:v18];
}

- (void)_alarmWasAdded:(id)a3
{
  BOOL v4 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Alarm was added; synchronizing MTAlarmManager -> HomeKit",
      v5,
      2u);
  }

  [(HFAccessorySettingMobileTimerAdapter *)self _respondToAlarmManagerUpdate];
}

- (void)_alarmWasDeleted:(id)a3
{
  BOOL v4 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Alarm was deleted; synchronizing MTAlarmManager -> HomeKit",
      v5,
      2u);
  }

  [(HFAccessorySettingMobileTimerAdapter *)self _respondToAlarmManagerUpdate];
}

- (void)_alarmWasUpdated:(id)a3
{
  BOOL v4 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Alarm was updated; synchronizing MTAlarmManager -> HomeKit",
      v5,
      2u);
  }

  [(HFAccessorySettingMobileTimerAdapter *)self _respondToAlarmManagerUpdate];
}

- (void)_respondToAlarmManagerUpdate
{
  if ([(HFAccessorySettingAdapter *)self mode] != 1) {
    NSLog(&cfstr_ShouldNotGetHe.isa);
  }
  if ([(HFAccessorySettingMobileTimerAdapter *)self shouldSynchronizeMobileTimerToHomeKit])
  {
    id v5 = [(HFAccessorySettingMobileTimerAdapter *)self _synchronizeMobileTimerToHomeKitWithChangeType:1];
    id v3 = (id)[v5 addCompletionBlock:&__block_literal_global_345_1];
  }
  else
  {
    BOOL v4 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "We should not _synchronizeMobileTimerToHomeKitWithChangeType", buf, 2u);
    }
  }
}

void __68__HFAccessorySettingMobileTimerAdapter__respondToAlarmManagerUpdate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = HFLogForCategory(0x3AuLL);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Error updating MTAlarmManager -> HomeKit: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Finished synchronizing MTAlarmManager -> HomeKit", (uint8_t *)&v6, 2u);
  }
}

- (void)_notifyObserversOfUpdates
{
  id v3 = [(HFAccessorySettingMobileTimerAdapter *)self allAlarmsFuture];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__HFAccessorySettingMobileTimerAdapter__notifyObserversOfUpdates__block_invoke;
  v5[3] = &unk_264093558;
  v5[4] = self;
  id v4 = (id)[v3 addSuccessBlock:v5];
}

void __65__HFAccessorySettingMobileTimerAdapter__notifyObserversOfUpdates__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  id v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 mobileTimerAdapter:*(void *)(a1 + 32) didUpdateAlarms:v3];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)_beginMonitoringSettingsKeyPath:(id)a3
{
  if ([(HFAccessorySettingAdapter *)self mode] == 1)
  {
    uint64_t v4 = [(HFAccessorySettingMobileTimerAdapter *)self _synchronizeMobileTimerToHomeKitWithChangeType:0];
LABEL_5:
    id v5 = (void *)v4;
    goto LABEL_7;
  }
  if ([(HFAccessorySettingAdapter *)self mode])
  {
    NSLog(&cfstr_InvalidModeSpe.isa, 0);
    uint64_t v4 = [MEMORY[0x263F58190] futureWithNoResult];
    goto LABEL_5;
  }
  uint64_t v6 = [(HFAccessorySettingMobileTimerAdapter *)self alarmCollectionSettingFuture];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__HFAccessorySettingMobileTimerAdapter__beginMonitoringSettingsKeyPath___block_invoke;
  v8[3] = &unk_26409A600;
  void v8[4] = self;
  id v5 = [v6 addSuccessBlock:v8];

LABEL_7:
  return v5;
}

void __72__HFAccessorySettingMobileTimerAdapter__beginMonitoringSettingsKeyPath___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  id v3 = (void *)[v2 copy];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 mobileTimerAdapterDidUpdateReadiness:*(void *)(a1 + 32)];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_setupDebugHandler
{
  objc_initWeak(&location, self);
  id v2 = +[HFDebugStateDumpManager sharedInstance];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__HFAccessorySettingMobileTimerAdapter__setupDebugHandler__block_invoke;
  v6[3] = &unk_26408CBE8;
  objc_copyWeak(&v7, &location);
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  id v5 = (id)[v2 registerStateDumpHandler:v6 withName:v4];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

id __58__HFAccessorySettingMobileTimerAdapter__setupDebugHandler__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = +[HFStateDumpBuilderContext contextWithDetailLevel:2];
  id v3 = +[HFStateDumpBuilder builderWithObject:WeakRetained context:v2];

  uint64_t v4 = [WeakRetained internalAlarmsBeingAdded];
  [v3 appendObject:v4 withName:@"alarmsBeingAdded" options:1];

  id v5 = [WeakRetained internalAlarmsBeingRemoved];
  [v3 appendObject:v5 withName:@"alarmsBeingRemoved" options:1];

  uint64_t v6 = [WeakRetained internalAlarmsBeingUpdated];
  [v3 appendObject:v6 withName:@"alarmsBeingUpdated" options:1];

  if ([WeakRetained mode] == 1) {
    id v7 = @"Accessory";
  }
  else {
    id v7 = @"Controller";
  }
  [v3 setObject:v7 forKeyedSubscript:@"adapterMode"];
  uint64_t v8 = objc_opt_new();
  long long v9 = [v8 alarmsSync];
  [v3 setObject:v9 forKeyedSubscript:@"MTAlarms"];

  long long v10 = [WeakRetained settingForKeyPath:@"root.mobileTimer.alarms"];
  long long v11 = [v10 value];
  [v3 setObject:v11 forKeyedSubscript:@"HKAlarms"];

  long long v12 = [v3 buildPropertyListRepresentation];

  return v12;
}

- (void)setAlarmManagerForSynchronizationFuture:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NAFuture)setupAccessoryAdapterModeFuture
{
  return self->_setupAccessoryAdapterModeFuture;
}

- (NSMutableSet)internalAlarmsBeingAdded
{
  return self->_internalAlarmsBeingAdded;
}

- (NSMutableSet)internalAlarmsBeingRemoved
{
  return self->_internalAlarmsBeingRemoved;
}

- (NSMutableSet)internalAlarmsBeingUpdated
{
  return self->_internalAlarmsBeingUpdated;
}

- (NSUserDefaults)soundBoardPrefs
{
  return self->_soundBoardPrefs;
}

- (void)setSoundBoardPrefs:(id)a3
{
}

- (COAlarmManager)coordinationAlarmManager
{
  return self->_coordinationAlarmManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinationAlarmManager, 0);
  objc_storeStrong((id *)&self->_soundBoardPrefs, 0);
  objc_storeStrong((id *)&self->_internalAlarmsBeingUpdated, 0);
  objc_storeStrong((id *)&self->_internalAlarmsBeingRemoved, 0);
  objc_storeStrong((id *)&self->_internalAlarmsBeingAdded, 0);
  objc_storeStrong((id *)&self->_setupAccessoryAdapterModeFuture, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_alarmManagerForSynchronizationFuture, 0);
}

@end