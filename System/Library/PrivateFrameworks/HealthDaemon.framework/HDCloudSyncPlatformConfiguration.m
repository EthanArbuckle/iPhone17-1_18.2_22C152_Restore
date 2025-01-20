@interface HDCloudSyncPlatformConfiguration
- (BOOL)_isSleepFocusOn;
- (BOOL)canLiteSyncPull;
- (BOOL)isConfiguredForLiteSync;
- (BOOL)participateInCoordinatedSync;
- (BOOL)requireInexpensiveNetworking;
- (BOOL)shouldRegisterForPeriodicSyncActivities;
- (BOOL)shouldRestrictSyncInSleepFocus;
- (HDCloudSyncPlatformConfiguration)initWithPrimaryProfile:(id)a3 behavior:(id)a4;
- (const)priorityForPeriodicSyncActivity;
- (double)cellularSyncThreshold;
- (double)liteSyncThreshold;
- (id)isSleepFocusOn;
- (int64_t)_baseIntervalForAppleWatchAllowingLiteSync:(BOOL)a3 tinker:(BOOL)a4;
- (int64_t)_baseIntervalForRealityDevice;
- (int64_t)_baseIntervalForiPhoneAllowingLiteSync:(BOOL)a3;
- (int64_t)baseIntervalForPeriodicSyncActivity;
- (void)setIsSleepFocusOn:(id)a3;
- (void)unitTest_setAllowLiteSync:(BOOL)a3;
@end

@implementation HDCloudSyncPlatformConfiguration

- (HDCloudSyncPlatformConfiguration)initWithPrimaryProfile:(id)a3 behavior:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDCloudSyncPlatformConfiguration;
  v8 = [(HDCloudSyncPlatformConfiguration *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeStrong((id *)&v9->_behavior, a4);
    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_allowLiteSync = 0;
  }

  return v9;
}

- (BOOL)shouldRegisterForPeriodicSyncActivities
{
  if ([(_HKBehavior *)self->_behavior supportsPeriodicFullCloudSync]) {
    return 1;
  }
  behavior = self->_behavior;

  return [(_HKBehavior *)behavior supportsPeriodicLiteCloudSync];
}

- (const)priorityForPeriodicSyncActivity
{
  int v2 = [(_HKBehavior *)self->_behavior isAppleWatch];
  v3 = (const char **)MEMORY[0x1E4F142D0];
  if (!v2) {
    v3 = (const char **)MEMORY[0x1E4F142E0];
  }
  return *v3;
}

- (int64_t)baseIntervalForPeriodicSyncActivity
{
  BOOL v3 = [(HDCloudSyncPlatformConfiguration *)self isConfiguredForLiteSync];
  int v4 = [(_HKBehavior *)self->_behavior isAppleWatch];
  behavior = self->_behavior;
  if (v4)
  {
    uint64_t v6 = [(_HKBehavior *)behavior tinkerModeEnabled];
    return [(HDCloudSyncPlatformConfiguration *)self _baseIntervalForAppleWatchAllowingLiteSync:v3 tinker:v6];
  }
  else if ([(_HKBehavior *)behavior isRealityDevice])
  {
    return [(HDCloudSyncPlatformConfiguration *)self _baseIntervalForRealityDevice];
  }
  else
  {
    return [(HDCloudSyncPlatformConfiguration *)self _baseIntervalForiPhoneAllowingLiteSync:v3];
  }
}

- (BOOL)canLiteSyncPull
{
  if (![(_HKBehavior *)self->_behavior isAppleWatch]) {
    return 1;
  }
  behavior = self->_behavior;

  return [(_HKBehavior *)behavior tinkerModeEnabled];
}

- (int64_t)_baseIntervalForAppleWatchAllowingLiteSync:(BOOL)a3 tinker:(BOOL)a4
{
  int v4 = (int64_t *)MEMORY[0x1E4F14218];
  v5 = (int64_t *)MEMORY[0x1E4F141F8];
  if (!a3) {
    v5 = (int64_t *)MEMORY[0x1E4F141E8];
  }
  if (!a4) {
    int v4 = v5;
  }
  return *v4;
}

- (int64_t)_baseIntervalForRealityDevice
{
  return *MEMORY[0x1E4F14218];
}

- (int64_t)_baseIntervalForiPhoneAllowingLiteSync:(BOOL)a3
{
  BOOL v3 = (int64_t *)MEMORY[0x1E4F14210];
  if (!a3) {
    BOOL v3 = (int64_t *)MEMORY[0x1E4F14218];
  }
  return *v3;
}

- (BOOL)requireInexpensiveNetworking
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(_HKBehavior *)self->_behavior isAppleWatch]
    && ![(_HKBehavior *)self->_behavior tinkerModeEnabled])
  {
    goto LABEL_10;
  }
  int v3 = [(_HKBehavior *)self->_behavior tinkerModeEnabled];
  if (v3)
  {
    p_profile = &self->_profile;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v14 = 0;
    int v6 = HDUpgradedToSyncIdentity(WeakRetained, (uint64_t)&v14);
    id v7 = v14;

    if (v7)
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v16 = v7;
        v9 = "Failed to read hasUpgradedToSyncIdentity with error: %{public}@.";
LABEL_15:
        _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, v9, buf, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    id v10 = objc_loadWeakRetained((id *)p_profile);
    id v13 = 0;
    int v11 = HDCompletedTransitionToSyncIdentity(v10, (uint64_t)&v13);
    id v7 = v13;

    if (v7)
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v16 = v7;
        v9 = "Failed to read completedtransitionToSyncIdentity with error: %{public}@.";
        goto LABEL_15;
      }
LABEL_9:

LABEL_10:
      LOBYTE(v3) = 1;
      return v3;
    }
    if (((v6 ^ 1 | v11) & 1) == 0) {
      goto LABEL_10;
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (double)cellularSyncThreshold
{
  int v2 = [(_HKBehavior *)self->_behavior tinkerModeEnabled];
  double result = 259200.0;
  if (v2) {
    return 172800.0;
  }
  return result;
}

- (double)liteSyncThreshold
{
  if ([(_HKBehavior *)self->_behavior isAppleWatch]
    && ![(_HKBehavior *)self->_behavior tinkerModeEnabled])
  {
    return 3600.0;
  }
  int v3 = [(_HKBehavior *)self->_behavior isRealityDevice];
  double result = 1800.0;
  if (v3) {
    return 14400.0;
  }
  return result;
}

- (BOOL)isConfiguredForLiteSync
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  BOOL allowLiteSync = self->_allowLiteSync;
  int v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v4 = [v3 BOOLForKey:@"HDCloudSyncDisableFastSync"];

  if (v4)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E4F29FA8];
    BOOL v6 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "Lite sync disabled by internal user default", buf, 2u);
      BOOL v6 = 0;
    }
    goto LABEL_24;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v8 = [WeakRetained deviceContextManager];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __59__HDCloudSyncPlatformConfiguration_isConfiguredForLiteSync__block_invoke;
  v26[3] = &unk_1E62FD280;
  v26[4] = &v28;
  id v27 = 0;
  char v9 = [v8 enumerateAllEntriesWithError:&v27 handler:v26];
  id v10 = v27;

  if ((v9 & 1) == 0)
  {
    _HKInitializeLogging();
    int v11 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v33 = self;
      __int16 v34 = 2114;
      id v35 = v10;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to query database for device context objects %{public}@.", buf, 0x16u);
    }
  }
  v12 = [HDKeyValueDomain alloc];
  id v13 = objc_loadWeakRetained((id *)&self->_profile);
  id v14 = [(HDKeyValueDomain *)v12 initWithCategory:0 domainName:@"CloudSyncCoordinator" profile:v13];

  uint64_t v15 = *MEMORY[0x1E4F2BDB0];
  id v25 = v10;
  id v16 = [(HDKeyValueDomain *)v14 numberForKey:v15 error:&v25];
  id v17 = v25;

  if (v16 || !v17)
  {
    if (v16)
    {
      int v19 = [v16 BOOLValue] ^ 1;
      goto LABEL_14;
    }
  }
  else
  {
    _HKInitializeLogging();
    v18 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v33 = self;
      __int16 v34 = 2114;
      id v35 = v17;
      _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Could not read lite synced on watch key %{public}@.", buf, 0x16u);
    }
  }
  int v19 = 1;
LABEL_14:
  if (*((unsigned char *)v29 + 24)
    || (([(_HKBehavior *)self->_behavior isAppleWatch] ^ 1 | v19) & 1) == 0)
  {
    if (([(_HKBehavior *)self->_behavior isAppleWatch] & v19) == 1)
    {
      id v24 = v17;
      BOOL v20 = [(HDKeyValueDomain *)v14 setNumber:MEMORY[0x1E4F1CC38] forKey:v15 error:&v24];
      id v21 = v24;

      if (!v20)
      {
        _HKInitializeLogging();
        v22 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v33 = self;
          __int16 v34 = 2114;
          id v35 = v21;
          _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Failed to set lite synced on watch flag %{public}@.", buf, 0x16u);
        }
      }
      BOOL v6 = 1;
      id v17 = v21;
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

LABEL_24:
  _Block_object_dispose(&v28, 8);
  return v6;
}

uint64_t __59__HDCloudSyncPlatformConfiguration_isConfiguredForLiteSync__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 2 || objc_msgSend(v3, "type") == 3)
  {
    _HKInitializeLogging();
    int v4 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "Lite sync enabled due to iPad or VisionPro in device context", v6, 2u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }

  return 1;
}

- (BOOL)shouldRestrictSyncInSleepFocus
{
  int v3 = [(_HKBehavior *)self->_behavior isAppleWatch];
  if (v3) {
    LOBYTE(v3) = ([(_HKBehavior *)self->_behavior tinkerModeEnabled] & 1) == 0
  }
              && self->_isSleepFocusOn != 0;
  return v3;
}

- (BOOL)participateInCoordinatedSync
{
  int v3 = [(_HKBehavior *)self->_behavior isAppleWatch];
  if (v3) {
    LOBYTE(v3) = [(_HKBehavior *)self->_behavior tinkerModeEnabled] ^ 1;
  }
  return v3;
}

- (BOOL)_isSleepFocusOn
{
  if (_HDIsUnitTesting && (id isSleepFocusOn = self->_isSleepFocusOn) != 0)
  {
    int v3 = (uint64_t (*)(void))*((void *)isSleepFocusOn + 2);
    return v3();
  }
  else
  {
    v5 = objc_alloc_init(HDBiomeInterface);
    BOOL v6 = [(HDBiomeInterface *)v5 sleepFocusOn];

    return v6;
  }
}

- (void)unitTest_setAllowLiteSync:(BOOL)a3
{
  self->_BOOL allowLiteSync = a3;
}

- (id)isSleepFocusOn
{
  return self->_isSleepFocusOn;
}

- (void)setIsSleepFocusOn:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_isSleepFocusOn, 0);
  objc_storeStrong((id *)&self->_behavior, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end