@interface DNDSLegacySettingsSyncManager
+ (id)receiveManagerForPairedDevice:(id)a3;
+ (id)sendManagerForPairedDevice:(id)a3;
+ (void)cleanupState;
- (DNDSSettingsSyncManagerDataSource)dataSource;
- (DNDSSettingsSyncManagerDelegate)delegate;
- (id)_initWithListen:(BOOL)a3 send:(BOOL)a4 pairedDevice:(id)a5;
- (void)_beginMonitoringForChanges;
- (void)_endMonitoringForChanges;
- (void)_propagateBypassSettings:(id)a3;
- (void)_propagateScheduleSettings:(id)a3;
- (void)_updateBypassSettings;
- (void)_updateScheduleSettingsWithDate:(id)a3;
- (void)dealloc;
- (void)resume;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)update;
@end

@implementation DNDSLegacySettingsSyncManager

+ (void)cleanupState
{
  v2 = DNDSLogLegacySettingsSync;
  if (os_log_type_enabled((os_log_t)DNDSLogLegacySettingsSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D3052000, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up state", v5, 2u);
  }
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F79CD8]) initWithDomain:@"com.apple.nano"];
  [v3 removeObjectForKey:@"dndEffectiveOverrides"];
  [v3 removeObjectForKey:@"dndPrivilegedSenderTypes"];
  id v4 = (id)[v3 synchronize];
}

+ (id)sendManagerForPairedDevice:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithListen:0 send:1 pairedDevice:v4];

  return v5;
}

+ (id)receiveManagerForPairedDevice:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithListen:1 send:0 pairedDevice:v4];

  return v5;
}

- (id)_initWithListen:(BOOL)a3 send:(BOOL)a4 pairedDevice:(id)a5
{
  id v8 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DNDSLegacySettingsSyncManager;
  v9 = [(DNDSLegacySettingsSyncManager *)&v19 init];
  v10 = v9;
  if (v9)
  {
    v9->_listen = a3;
    v9->_send = a4;
    v11 = (NPSManager *)objc_alloc_init(MEMORY[0x1E4F79CE0]);
    npsManager = v10->_npsManager;
    v10->_npsManager = v11;

    id v13 = objc_alloc(MEMORY[0x1E4F79CD8]);
    v14 = [v8 pairingIdentifier];
    v15 = [v8 pairingDataStore];
    uint64_t v16 = [v13 initWithDomain:@"com.apple.nano" pairingID:v14 pairingDataStore:v15];
    accessor = v10->_accessor;
    v10->_accessor = (NPSDomainAccessor *)v16;
  }
  return v10;
}

- (void)dealloc
{
  if (self->_listen) {
    [(DNDSLegacySettingsSyncManager *)self _endMonitoringForChanges];
  }
  v3.receiver = self;
  v3.super_class = (Class)DNDSLegacySettingsSyncManager;
  [(DNDSLegacySettingsSyncManager *)&v3 dealloc];
}

- (void)resume
{
  if (self->_listen)
  {
    [(DNDSLegacySettingsSyncManager *)self _beginMonitoringForChanges];
    [(DNDSLegacySettingsSyncManager *)self _updateBypassSettings];
    [(DNDSLegacySettingsSyncManager *)self _updateScheduleSettingsWithDate:0];
  }
  [(DNDSLegacySettingsSyncManager *)self update];
}

- (void)update
{
  if (self->_send)
  {
    id v5 = [(DNDSLegacySettingsSyncManager *)self dataSource];
    objc_super v3 = [v5 phoneCallBypassSettingsForSyncManager:self];
    id v4 = [v5 scheduleSettingsForSyncManager:self];
    [(DNDSLegacySettingsSyncManager *)self _propagateBypassSettings:v3];
    [(DNDSLegacySettingsSyncManager *)self _propagateScheduleSettings:v4];
  }
}

- (void)_beginMonitoringForChanges
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)DNDEffectiveOverridesChanged, @"DNDEffectiveOverridesChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
  id v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)DNDPrivilegedSenderChanged, @"DNDPrivilegedSenderChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
}

- (void)_endMonitoringForChanges
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"DNDEffectiveOverridesChangedNotification", 0);
  id v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, @"DNDPrivilegedSenderChangedNotification", 0);
}

- (void)_propagateScheduleSettings:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  [v5 scheduleEnabledSetting];
  [v5 setScheduleEnabledSetting:DNDResolvedScheduleEnabledSetting()];
  [v5 setBedtimeBehaviorEnabledSetting:0];
  v6 = [v4 creationDate];
  v7 = +[DNDSScheduleSettings settingsWithClientSettings:v5 creationDate:v6];

  id v8 = (id)[(NPSDomainAccessor *)self->_accessor synchronize];
  accessor = self->_accessor;
  v10 = [v4 creationDate];
  v11 = [(NPSDomainAccessor *)accessor dnds_scheduleSettingsWithLastUpdated:v10];

  if (v7 != v11 && (!v7 || !v11 || ([v7 isEqual:v11] & 1) == 0))
  {
    v12 = DNDSLogLegacySettingsSync;
    if (os_log_type_enabled((os_log_t)DNDSLogLegacySettingsSync, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543618;
      id v16 = v4;
      __int16 v17 = 2114;
      v18 = v11;
      _os_log_impl(&dword_1D3052000, v12, OS_LOG_TYPE_DEFAULT, "Got new schedule settings: settings=%{public}@, oldSettings=%{public}@", (uint8_t *)&v15, 0x16u);
    }
    [(NPSDomainAccessor *)self->_accessor dnds_setScheduleSettings:v4];
    id v13 = (id)[(NPSDomainAccessor *)self->_accessor synchronize];
    v14 = [MEMORY[0x1E4F1CAD0] setWithObject:@"dndEffectiveOverrides"];
    [(NPSManager *)self->_npsManager synchronizeNanoDomain:@"com.apple.nano" keys:v14];
  }
}

- (void)_updateScheduleSettingsWithDate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (id)[(NPSDomainAccessor *)self->_accessor synchronize];
  v6 = [(DNDSLegacySettingsSyncManager *)self dataSource];
  v7 = [v6 scheduleSettingsForSyncManager:self];

  if (v4)
  {
    id v8 = v4;
  }
  else
  {
    id v8 = [v7 creationDate];
  }
  v9 = v8;
  uint64_t v10 = [(NPSDomainAccessor *)self->_accessor dnds_scheduleSettingsWithLastUpdated:v8];
  v11 = (void *)v10;
  if (v10 && v7 != (void *)v10 && (!v7 || ([v7 isEqual:v10] & 1) == 0))
  {
    if (v4)
    {
      id v12 = v4;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1C9C8] date];
    }
    id v13 = v12;
    v14 = +[DNDSScheduleSettings settingsWithClientSettings:v11 creationDate:v12];
    int v15 = DNDSLogLegacySettingsSync;
    if (os_log_type_enabled((os_log_t)DNDSLogLegacySettingsSync, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      v18 = v14;
      _os_log_impl(&dword_1D3052000, v15, OS_LOG_TYPE_DEFAULT, "Got new schedule settings: settings=%{public}@", (uint8_t *)&v17, 0xCu);
    }
    id v16 = [(DNDSLegacySettingsSyncManager *)self delegate];
    [v16 syncManager:self didReceiveUpdatedScheduleSettings:v14];
  }
}

- (void)_propagateBypassSettings:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  [v5 immediateBypassEventSourceType];
  [v5 setImmediateBypassEventSourceType:DNDResolvedImmediateBypassEventSourceType()];
  [v5 setImmediateBypassCNGroupIdentifier:0];
  [v5 repeatEventSourceBehaviorEnabledSetting];
  [v5 setRepeatEventSourceBehaviorEnabledSetting:DNDResolvedRepeatEventSourceBehaviorEnabledSetting()];
  id v6 = (id)[(NPSDomainAccessor *)self->_accessor synchronize];
  uint64_t v7 = [(NPSDomainAccessor *)self->_accessor dnds_bypassSettings];
  id v8 = (void *)v7;
  if (v5 != (void *)v7 && (!v5 || !v7 || ([v5 isEqual:v7] & 1) == 0))
  {
    v9 = DNDSLogLegacySettingsSync;
    if (os_log_type_enabled((os_log_t)DNDSLogLegacySettingsSync, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      id v13 = v4;
      __int16 v14 = 2114;
      int v15 = v8;
      _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "Got new bypass settings: settings=%{public}@, oldSettings=%{public}@", (uint8_t *)&v12, 0x16u);
    }
    [(NPSDomainAccessor *)self->_accessor dnds_setBypassSettings:v4];
    id v10 = (id)[(NPSDomainAccessor *)self->_accessor synchronize];
    v11 = [MEMORY[0x1E4F1CAD0] setWithObject:@"dndPrivilegedSenderTypes"];
    [(NPSManager *)self->_npsManager synchronizeNanoDomain:@"com.apple.nano" keys:v11];
  }
}

- (void)_updateBypassSettings
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = (id)[(NPSDomainAccessor *)self->_accessor synchronize];
  id v4 = [(DNDSLegacySettingsSyncManager *)self dataSource];
  id v5 = [v4 phoneCallBypassSettingsForSyncManager:self];

  id v6 = [(NPSDomainAccessor *)self->_accessor dnds_bypassSettings];
  uint64_t v7 = v6;
  if (v6) {
    BOOL v8 = v6 == v5;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && (!v5 || ([v6 isEqual:v5] & 1) == 0))
  {
    v9 = DNDSLogLegacySettingsSync;
    if (os_log_type_enabled((os_log_t)DNDSLogLegacySettingsSync, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      int v12 = v7;
      _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "Got new bypass settings: settings=%{public}@", (uint8_t *)&v11, 0xCu);
    }
    id v10 = [(DNDSLegacySettingsSyncManager *)self delegate];
    [v10 syncManager:self didReceiveUpdatedPhoneCallBypassSettings:v7];
  }
}

- (DNDSSettingsSyncManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (DNDSSettingsSyncManagerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (DNDSSettingsSyncManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DNDSSettingsSyncManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_accessor, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
}

@end