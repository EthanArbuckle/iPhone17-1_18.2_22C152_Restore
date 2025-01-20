@interface DNDSSettingsManager
- (BOOL)setBehaviorSettings:(id)a3 withError:(id *)a4;
- (BOOL)setScheduleSettings:(id)a3 withError:(id *)a4;
- (DNDSSettingsManager)initWithBackingStore:(id)a3 contactStore:(id)a4;
- (DNDSSettingsManagerDelegate)delegate;
- (NSString)sysdiagnoseDataIdentifier;
- (id)_readSettingsReturningError:(id *)a3;
- (id)behaviorSettingsWithError:(id *)a3;
- (id)fallbackConfiguration;
- (id)phoneCallBypassSettingsWithError:(id *)a3;
- (id)scheduleSettingsWithError:(id *)a3;
- (id)syncSettingsWithError:(id *)a3;
- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4;
- (unint64_t)_saveBehaviorSettings:(id)a3 scheduleSettings:(id)a4 error:(id *)a5;
- (unint64_t)_saveConfiguration:(id)a3 forModeIdentifier:(id)a4 error:(id *)a5;
- (unint64_t)_writeSettingsRecord:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)pairedDeviceDidChange;
- (void)setDelegate:(id)a3;
- (void)setPairSyncEnabled:(BOOL)a3;
- (void)syncSettingsProvider:(id)a3 didReceiveUpdatedSyncSettings:(id)a4;
@end

@implementation DNDSSettingsManager

- (DNDSSettingsManager)initWithBackingStore:(id)a3 contactStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DNDSSettingsManager;
  v9 = [(DNDSSettingsManager *)&v15 init];
  if (v9)
  {
    uint64_t v10 = +[DNDSWorkloop serialQueueTargetingSharedWorkloop:@"com.apple.donotdisturb.server.SettingsManager"];
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_backingStore, a3);
    objc_storeStrong((id *)&v9->_contactStore, a4);
    v12 = objc_alloc_init(DNDSSyncSettingsProvider);
    syncSettingsProvider = v9->_syncSettingsProvider;
    v9->_syncSettingsProvider = v12;

    [(DNDSSyncSettingsProvider *)v9->_syncSettingsProvider setDelegate:v9];
    DNDSRegisterSysdiagnoseDataProvider(v9);
  }

  return v9;
}

- (void)dealloc
{
  DNDSUnregisterSysdiagnoseDataProvider(self);
  v3.receiver = self;
  v3.super_class = (Class)DNDSSettingsManager;
  [(DNDSSettingsManager *)&v3 dealloc];
}

- (void)pairedDeviceDidChange
{
}

- (id)behaviorSettingsWithError:(id *)a3
{
  objc_super v3 = [(DNDSSettingsManager *)self _readSettingsReturningError:a3];
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E4F5F5A0];
    v6 = [v3 behaviorSettings];
    id v7 = [v5 settingsForRecord:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)setBehaviorSettings:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(DNDSSettingsManager *)self _saveBehaviorSettings:v6 scheduleSettings:0 error:a4];
  if (v7 != 1)
  {
    if (v7 != 2)
    {
      BOOL v9 = 0;
      goto LABEL_6;
    }
    id v8 = [(DNDSSettingsManager *)self delegate];
    [v8 settingsManager:self didReceiveUpdatedBehaviorSettings:v6];
  }
  BOOL v9 = 1;
LABEL_6:

  return v9;
}

- (id)phoneCallBypassSettingsWithError:(id *)a3
{
  objc_super v3 = [(DNDSSettingsManager *)self _readSettingsReturningError:a3];
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E4F5F5A8];
    id v6 = [v3 phoneCallBypassSettings];
    unint64_t v7 = [v5 settingsForRecord:v6];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)scheduleSettingsWithError:(id *)a3
{
  objc_super v3 = [(DNDSSettingsManager *)self _readSettingsReturningError:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 scheduleSettings];
    id v6 = +[DNDSScheduleSettings settingsForRecord:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)setScheduleSettings:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(DNDSSettingsManager *)self _saveBehaviorSettings:0 scheduleSettings:v6 error:a4];
  if (v7 != 1)
  {
    if (v7 != 2)
    {
      BOOL v9 = 0;
      goto LABEL_6;
    }
    id v8 = [(DNDSSettingsManager *)self delegate];
    [v8 settingsManager:self didReceiveUpdatedScheduleSettings:v6];
  }
  BOOL v9 = 1;
LABEL_6:

  return v9;
}

- (id)syncSettingsWithError:(id *)a3
{
  return [(DNDSSyncSettingsProvider *)self->_syncSettingsProvider syncSettings];
}

- (void)setPairSyncEnabled:(BOOL)a3
{
}

- (id)_readSettingsReturningError:(id *)a3
{
  backingStore = self->_backingStore;
  id v10 = 0;
  v5 = [(DNDSBackingStore *)backingStore readRecordWithError:&v10];
  id v6 = v10;
  unint64_t v7 = v6;
  if (v6)
  {
    if (a3) {
      *a3 = v6;
    }
    id v8 = DNDSLogSettings;
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR)) {
      -[DNDSSettingsManager _readSettingsReturningError:]((uint64_t)v7, v8);
    }
    _DNDSRequestRadar(@"Failed to load settings", v7, 0, @"/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSSettingsManager.m", 163);
  }

  return v5;
}

- (unint64_t)_saveBehaviorSettings:(id)a3 scheduleSettings:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(DNDSBackingStore *)self->_backingStore readRecordWithError:0];
  v11 = (void *)[v10 mutableCopy];
  v12 = v11;
  if (v11) {
    v13 = v11;
  }
  else {
    v13 = objc_alloc_init(DNDSMutableSettingsRecord);
  }
  v14 = v13;

  if (!v8)
  {
    if (!v9) {
      goto LABEL_26;
    }
    LOBYTE(v23) = 0;
    goto LABEL_17;
  }
  objc_super v15 = [v8 makeRecord];
  uint64_t v16 = [(DNDSSettingsRecord *)v14 behaviorSettings];
  if ((void *)v16 == v15)
  {

    goto LABEL_13;
  }
  v17 = (void *)v16;
  v18 = [(DNDSSettingsRecord *)v14 behaviorSettings];
  v19 = v18;
  if (v18 && v15)
  {
    [(DNDSSettingsRecord *)v14 behaviorSettings];
    v20 = v10;
    v22 = v21 = self;
    char v35 = [v22 isEqual:v15];

    self = v21;
    id v10 = v20;

    if ((v35 & 1) == 0) {
      goto LABEL_15;
    }
LABEL_13:
    int v23 = 0;
    goto LABEL_16;
  }

LABEL_15:
  [(DNDSMutableSettingsRecord *)v14 setBehaviorSettings:v15];
  int v23 = 1;
LABEL_16:

  if (!v9)
  {
    if (v23) {
      goto LABEL_29;
    }
    goto LABEL_26;
  }
LABEL_17:
  v24 = [v9 makeRecord];
  uint64_t v25 = [(DNDSSettingsRecord *)v14 scheduleSettings];
  if ((void *)v25 == v24)
  {
  }
  else
  {
    v26 = (void *)v25;
    v27 = [(DNDSSettingsRecord *)v14 scheduleSettings];
    v28 = v27;
    if (!v27 || !v24)
    {

LABEL_28:
      [(DNDSMutableSettingsRecord *)v14 setScheduleSettings:v24];

      goto LABEL_29;
    }
    [(DNDSSettingsRecord *)v14 scheduleSettings];
    v36 = v10;
    v29 = self;
    v31 = v30 = a5;
    char v34 = [v31 isEqual:v24];

    a5 = v30;
    self = v29;
    id v10 = v36;

    if ((v34 & 1) == 0) {
      goto LABEL_28;
    }
  }

  if (v23)
  {
LABEL_29:
    unint64_t v32 = [(DNDSSettingsManager *)self _writeSettingsRecord:v14 error:a5];
    goto LABEL_30;
  }
LABEL_26:
  unint64_t v32 = 1;
LABEL_30:

  return v32;
}

- (unint64_t)_saveConfiguration:(id)a3 forModeIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(DNDSBackingStore *)self->_backingStore readRecordWithError:0];
  v11 = (void *)[v10 mutableCopy];
  v12 = v11;
  if (v11) {
    v13 = v11;
  }
  else {
    v13 = objc_alloc_init(DNDSMutableSettingsRecord);
  }
  v14 = v13;

  objc_super v15 = [v10 configurations];
  uint64_t v16 = (void *)[v15 mutableCopy];
  v17 = v16;
  if (v16) {
    v18 = v16;
  }
  else {
    v18 = objc_alloc_init(DNDSMutableConfigurationsRecord);
  }
  v19 = v18;

  v20 = [v15 configurationForModeIdentifier:v9];
  uint64_t v21 = [v8 makeRecord];
  v22 = (void *)v21;
  if (v20 == (void *)v21 || v20 && v21 && ([v20 isEqual:v21] & 1) != 0)
  {
    unint64_t v23 = 1;
  }
  else
  {
    [(DNDSMutableConfigurationsRecord *)v19 setConfiguration:v8 forModeIdentifier:v9];
    [(DNDSMutableSettingsRecord *)v14 setConfigurations:v19];
    unint64_t v23 = [(DNDSSettingsManager *)self _writeSettingsRecord:v14 error:a5];
  }

  return v23;
}

- (unint64_t)_writeSettingsRecord:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  backingStore = self->_backingStore;
  id v16 = 0;
  uint64_t v8 = [(DNDSBackingStore *)backingStore writeRecord:v6 error:&v16];
  id v9 = v16;
  id v10 = v9;
  if (v8)
  {
    if (v8 == 1)
    {
      v14 = DNDSLogSettings;
      if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v10;
        _os_log_impl(&dword_1D3052000, v14, OS_LOG_TYPE_DEFAULT, "Failed to save settings, but error can be ignored; error=%{public}@",
          buf,
          0xCu);
      }
    }
    else if (v8 == 2)
    {
      v11 = DNDSLogSettings;
      if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v6;
        _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_DEFAULT, "Saved settings; settingsRecord=%{public}@", buf, 0xCu);
      }
      unint64_t v12 = 2;
      goto LABEL_16;
    }
    unint64_t v12 = 1;
    goto LABEL_16;
  }
  if (a4 && v9) {
    *a4 = v9;
  }
  v13 = DNDSLogSettings;
  if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR)) {
    -[DNDSSettingsManager _writeSettingsRecord:error:]((uint64_t)v6, (uint64_t)v10, v13);
  }
  _DNDSRequestRadar(@"Error saving settings", v10, 0, @"/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSSettingsManager.m", 239);
  unint64_t v12 = 0;
LABEL_16:

  return v12;
}

- (void)syncSettingsProvider:(id)a3 didReceiveUpdatedSyncSettings:(id)a4
{
  id v5 = a4;
  id v6 = [(DNDSSettingsManager *)self delegate];
  [v6 settingsManager:self didReceiveUpdatedSyncSettings:v5];
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)@"com.apple.donotdisturb.SettingsManager";
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3, a4);
  id v6 = [(DNDSSettingsManager *)self behaviorSettingsWithError:0];
  unint64_t v7 = v6;
  if (v6)
  {
    [v6 interruptionBehaviorSetting];
    uint64_t v8 = DNDStringFromInterruptionBehaviorSetting();
    [v7 interruptionBehaviorSetting];
    DNDResolvedInterruptionBehaviorSetting();
    id v9 = DNDStringFromInterruptionBehaviorSetting();
    v54 = @"interruption-behavior";
    id v10 = [NSString stringWithFormat:@"%@ (%@)", v8, v9];
    v55[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];

    [v5 setObject:v11 forKey:@"behavior-settings"];
  }
  unint64_t v12 = [(DNDSSettingsManager *)self scheduleSettingsWithError:0];
  v13 = v12;
  if (v12)
  {
    [v12 scheduleEnabledSetting];
    v44 = DNDEnabledSettingToString();
    [v13 scheduleEnabledSetting];
    DNDResolvedScheduleEnabledSetting();
    v43 = DNDEnabledSettingToString();
    [v13 bedtimeBehaviorEnabledSetting];
    v49 = DNDEnabledSettingToString();
    [v13 bedtimeBehaviorEnabledSetting];
    DNDResolvedBedtimeBehaviorEnabledSetting();
    char v34 = DNDEnabledSettingToString();
    v52[0] = @"creation-date-local";
    v14 = (void *)MEMORY[0x1E4F28C10];
    v45 = [v13 creationDate];
    v42 = [v14 localizedStringFromDate:v45 dateStyle:1 timeStyle:1];
    v53[0] = v42;
    v52[1] = @"creation-date-timestamp";
    objc_super v15 = NSNumber;
    v41 = [v13 creationDate];
    [v41 timeIntervalSinceReferenceDate];
    v40 = objc_msgSend(v15, "numberWithDouble:");
    v53[1] = v40;
    v52[2] = @"enabled";
    v39 = [NSString stringWithFormat:@"%@ (%@)", v44, v43];
    v53[2] = v39;
    v52[3] = @"start-time";
    id v16 = NSString;
    v38 = [v13 timePeriod];
    v37 = [v38 startTime];
    uint64_t v17 = [v37 hour];
    v36 = [v13 timePeriod];
    char v35 = [v36 startTime];
    v47 = v7;
    id v18 = objc_msgSend(v16, "stringWithFormat:", @"%lu:%lu", v17, objc_msgSend(v35, "minute"));
    v53[3] = v18;
    v52[4] = @"end-time";
    uint64_t v19 = NSString;
    [v13 timePeriod];
    v20 = v48 = v5;
    uint64_t v21 = [v20 endTime];
    uint64_t v22 = [v21 hour];
    [v13 timePeriod];
    unint64_t v23 = v46 = self;
    v24 = [v23 endTime];
    uint64_t v25 = objc_msgSend(v19, "stringWithFormat:", @"%lu:%lu", v22, objc_msgSend(v24, "minute"));
    v53[4] = v25;
    v52[5] = @"bedtime-enabled";
    v26 = [NSString stringWithFormat:@"%@ (%@)", v49, v34];
    v53[5] = v26;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:6];

    self = v46;
    id v5 = v48;

    [v48 setObject:v27 forKey:@"schedule-settings"];
    unint64_t v7 = v47;
  }
  v28 = [(DNDSSettingsManager *)self syncSettingsWithError:0];
  v29 = v28;
  if (v28)
  {
    v50[0] = @"cloud-enabled";
    if ([v28 isCloudSyncEnabled]) {
      v30 = @"YES";
    }
    else {
      v30 = @"NO";
    }
    v50[1] = @"local-enabled";
    v51[0] = v30;
    if ([v29 isPairSyncEnabled]) {
      v31 = @"YES";
    }
    else {
      v31 = @"NO";
    }
    v51[1] = v31;
    unint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
    [v5 setObject:v32 forKey:@"sync-settings"];
  }
  return v5;
}

- (id)fallbackConfiguration
{
  return (id)[MEMORY[0x1E4F5F6E8] defaultConfiguration];
}

- (DNDSSettingsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DNDSSettingsManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_syncSettingsProvider, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_readSettingsReturningError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3052000, a2, OS_LOG_TYPE_ERROR, "Failed to load settings, will request a radar; error=%{public}@",
    (uint8_t *)&v2,
    0xCu);
}

- (void)_writeSettingsRecord:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D3052000, log, OS_LOG_TYPE_ERROR, "Failed to save settings, will request a radar; settingsRecord=%{public}@, error=%{public}@",
    (uint8_t *)&v3,
    0x16u);
}

@end