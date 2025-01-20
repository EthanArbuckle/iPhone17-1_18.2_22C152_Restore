@interface HDCloudSyncAccountProvider
- (BOOL)_shouldPerformFullSyncOnAccountChange;
- (BOOL)accountIsProhibitedFromCloudSync:(id)a3;
- (BOOL)computeCanPerformCloudSyncForPrimaryAccount:(id *)a3;
- (BOOL)isAccountInManateeUnavailableCFUState;
- (BOOL)primaryAccountIsProhibitedFromCloudSync;
- (HDCloudSyncAccountProvider)initWithCoordinator:(id)a3 behavior:(id)a4;
- (HDCloudSyncAccountProvider)initWithCoordinator:(id)a3 behavior:(id)a4 accountStore:(id)a5;
- (id)_disableAndDeleteAllSyncDataForProfile:(id)a3 completion:(id)a4;
- (id)disableAndDeleteAllSyncDataWithCompletion:(id)a3;
- (id)getPersistedAccountInfo;
- (void)_performSyncForAccountChangeWithCompletion:(id)a3;
- (void)_resetCachedOwnerIdentifiers;
- (void)_rollOwnerDifferentiatorAfterCloudSyncDisableForAllProfiles:(id)a3;
- (void)_setHealthAccountDataclassEnabled:(BOOL)a3 completion:(id)a4;
- (void)_triggerSyncForAccountChange;
- (void)accountConfigurationDidChangeWithCompletion:(id)a3;
- (void)daemonReady:(id)a3;
- (void)disableSyncLocallyWithCompletion:(id)a3;
- (void)enableSyncLocallyWithCompletion:(id)a3;
- (void)profileDidBecomeReady:(id)a3;
- (void)unitTest_setAccountStore:(id)a3;
@end

@implementation HDCloudSyncAccountProvider

- (HDCloudSyncAccountProvider)initWithCoordinator:(id)a3 behavior:(id)a4
{
  return [(HDCloudSyncAccountProvider *)self initWithCoordinator:a3 behavior:a4 accountStore:0];
}

- (HDCloudSyncAccountProvider)initWithCoordinator:(id)a3 behavior:(id)a4 accountStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDCloudSyncAccountProvider;
  v11 = [(HDCloudSyncAccountProvider *)&v19 init];
  if (v11)
  {
    uint64_t v12 = HKCreateSerialUtilityDispatchQueue();
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    objc_storeWeak((id *)&v11->_coordinator, v8);
    v11->_lock._os_unfair_lock_opaque = 0;
    if (v10) {
      v14 = (ACAccountStore *)v10;
    }
    else {
      v14 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E4F179C8]);
    }
    lock_accountStore = v11->_lock_accountStore;
    v11->_lock_accountStore = v14;

    objc_storeStrong((id *)&v11->_behavior, a4);
    id WeakRetained = objc_loadWeakRetained((id *)&v11->_coordinator);
    v17 = [WeakRetained daemon];
    [v17 registerDaemonReadyObserver:v11 queue:v11->_queue];
  }
  return v11;
}

- (void)accountConfigurationDidChangeWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__HDCloudSyncAccountProvider_accountConfigurationDidChangeWithCompletion___block_invoke;
  v7[3] = &unk_1E62F4928;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __74__HDCloudSyncAccountProvider_accountConfigurationDidChangeWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v3 = [WeakRetained periodicActivityScheduler];
  [v3 updatePeriodicActivityCriteria];

  [*(id *)(a1 + 32) _resetCachedOwnerIdentifiers];
  [*(id *)(a1 + 32) _triggerSyncForAccountChange];
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (BOOL)isAccountInManateeUnavailableCFUState
{
  v2 = [(HDCloudSyncAccountProvider *)self getPersistedAccountInfo];
  BOOL v3 = ([v2 supportsDeviceToDeviceEncryption] & 1) == 0
    && ([v2 deviceToDeviceEncryptionAvailability] & 1) != 0;

  return v3;
}

- (BOOL)primaryAccountIsProhibitedFromCloudSync
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(ACAccountStore *)v2->_lock_accountStore aa_primaryAppleAccount];
  os_unfair_lock_unlock(p_lock);
  LOBYTE(v2) = [(HDCloudSyncAccountProvider *)v2 accountIsProhibitedFromCloudSync:v4];

  return (char)v2;
}

- (void)disableSyncLocallyWithCompletion:(id)a3
{
}

- (id)disableAndDeleteAllSyncDataWithCompletion:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v40 = self;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning disable-and-delete operation for cloud sync.", buf, 0xCu);
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F65D90]);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __72__HDCloudSyncAccountProvider_disableAndDeleteAllSyncDataWithCompletion___block_invoke;
  v36[3] = &unk_1E62F95A8;
  v36[4] = self;
  id v24 = v4;
  id v37 = v24;
  [v6 setDidFinish:v36];
  [v6 beginTask];
  [v6 beginTask];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __72__HDCloudSyncAccountProvider_disableAndDeleteAllSyncDataWithCompletion___block_invoke_2;
  v34[3] = &unk_1E62F2978;
  id v7 = v6;
  id v35 = v7;
  [(HDCloudSyncAccountProvider *)self disableSyncLocallyWithCompletion:v34];
  location = (id *)&self->_coordinator;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  id v9 = [WeakRetained daemon];
  id v10 = [v9 profileManager];

  v11 = [v10 allProfileIdentifiers];
  objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", objc_msgSend(v11, "count"));
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        v16 = self;
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        id v18 = objc_loadWeakRetained(location);
        objc_super v19 = [v18 daemon];
        v20 = [v19 profileManager];
        v21 = [v20 profileForIdentifier:v17];

        [v7 beginTask];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __72__HDCloudSyncAccountProvider_disableAndDeleteAllSyncDataWithCompletion___block_invoke_3;
        v28[3] = &unk_1E62F2978;
        id v29 = v7;
        self = v16;
        v22 = [(HDCloudSyncAccountProvider *)v16 _disableAndDeleteAllSyncDataForProfile:v21 completion:v28];
        [v27 addChild:v22 withPendingUnitCount:1];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v13);
  }

  [v7 finishTask];

  return v27;
}

void __72__HDCloudSyncAccountProvider_disableAndDeleteAllSyncDataWithCompletion___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  _HKInitializeLogging();
  id v7 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (a3) {
      id v9 = @"YES";
    }
    else {
      id v9 = @"NO";
    }
    id v10 = v7;
    v11 = [v6 firstObject];
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = v8;
    __int16 v23 = 2114;
    id v24 = v9;
    __int16 v25 = 2114;
    v26 = v11;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: finish disableAndDeleteCloudSyncData: success (%{public}@), error (%{public}@)", buf, 0x20u);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__HDCloudSyncAccountProvider_disableAndDeleteAllSyncDataWithCompletion___block_invoke_291;
  v16[3] = &unk_1E6306B10;
  uint64_t v12 = *(void **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  char v20 = a3;
  uint64_t v14 = *(void *)(a1 + 32);
  id v17 = v6;
  uint64_t v18 = v14;
  id v19 = v13;
  id v15 = v6;
  [v12 disableSyncLocallyWithCompletion:v16];
}

void __72__HDCloudSyncAccountProvider_disableAndDeleteAllSyncDataWithCompletion___block_invoke_291(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    objc_msgSend(v6, "hk_removeObjectsForKeysWithPrefix:", @"HDLastLongTimeWithoutSuccessfulCloudSyncReportDate");

    id v7 = objc_alloc_init(MEMORY[0x1E4F65D90]);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__HDCloudSyncAccountProvider_disableAndDeleteAllSyncDataWithCompletion___block_invoke_293;
    v9[3] = &unk_1E6306AE8;
    id v11 = *(id *)(a1 + 48);
    char v12 = *(unsigned char *)(a1 + 56);
    id v10 = *(id *)(a1 + 32);
    [v7 setDidFinish:v9];
    [*(id *)(a1 + 40) _rollOwnerDifferentiatorAfterCloudSyncDisableForAllProfiles:v7];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v8 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "Failed to disable cloud sync: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __72__HDCloudSyncAccountProvider_disableAndDeleteAllSyncDataWithCompletion___block_invoke_293(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (a3)
  {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v6 = [*(id *)(a1 + 32) firstObject];
    id v7 = *(void (**)(uint64_t, uint64_t))(v4 + 16);
    uint64_t v8 = v4;
    uint64_t v9 = v5;
  }
  else
  {
    uint64_t v6 = [a4 firstObject];
    id v7 = *(void (**)(uint64_t, uint64_t))(v4 + 16);
    uint64_t v8 = v4;
    uint64_t v9 = 0;
  }
  id v10 = (id)v6;
  v7(v8, v9);
}

uint64_t __72__HDCloudSyncAccountProvider_disableAndDeleteAllSyncDataWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishTask];
  }
  else {
    return objc_msgSend(v2, "failTaskWithError:");
  }
}

uint64_t __72__HDCloudSyncAccountProvider_disableAndDeleteAllSyncDataWithCompletion___block_invoke_3(uint64_t a1, int a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishTask];
  }
  else {
    return objc_msgSend(v2, "failTaskWithError:");
  }
}

- (void)enableSyncLocallyWithCompletion:(id)a3
{
}

- (BOOL)accountIsProhibitedFromCloudSync:(id)a3
{
  return objc_msgSend(a3, "aa_isManagedAppleID");
}

- (BOOL)computeCanPerformCloudSyncForPrimaryAccount:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = [(ACAccountStore *)self->_lock_accountStore aa_primaryAppleAccount];
  os_unfair_lock_unlock(p_lock);
  if (![(HDCloudSyncAccountProvider *)self accountIsProhibitedFromCloudSync:v6])
  {
    uint64_t v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v9 = [v8 objectForKey:*MEMORY[0x1E4F2BEA0]];

    if ([v6 isEnabledForDataclass:*MEMORY[0x1E4F17AB8]])
    {
      if ([MEMORY[0x1E4F2B898] usingDemoDataDatabase]) {
        char v10 = 0;
      }
      else {
        char v10 = [(_HKBehavior *)self->_behavior isRunningStoreDemoMode] ^ 1;
      }
      id v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      char v14 = [v13 BOOLForKey:@"HealthCloudSyncForDemoDataKey"];

      if (v10 & 1) != 0 || (v14)
      {
        if (v9 && ([v9 BOOLValue] & 1) == 0)
        {
          v16 = (void *)MEMORY[0x1E4F28C58];
          id v17 = @"Cloud sync disabled by switch: Internal Settings > Health > Cloud Sync Enabled";
        }
        else
        {
          if ([(_HKBehavior *)self->_behavior supportsCloudSync])
          {
            BOOL v7 = 1;
            goto LABEL_13;
          }
          v16 = (void *)MEMORY[0x1E4F28C58];
          id v17 = @"Cloud sync not supported on this device.";
        }
        objc_msgSend(v16, "hk_assignError:code:description:", a3, 701, v17);
LABEL_12:
        BOOL v7 = 0;
LABEL_13:

        goto LABEL_14;
      }
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = @"HealthCloudSyncForDemoDataKey";
      char v12 = @"Cloud sync disabled: Demo data is enabled but sync for demo data default (%@) is not set.";
    }
    else
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      char v12 = @"Health cloud sync is disabled for this Apple ID.";
    }
    objc_msgSend(v11, "hk_assignError:code:format:", a3, 701, v12, v18);
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 701, @"Managed Apple IDs are not permitted to participate in cloud sync.");
  BOOL v7 = 0;
LABEL_14:

  return v7;
}

- (id)getPersistedAccountInfo
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"HDCloudSyncAccountInfo"];

  if (v3)
  {
    id v8 = 0;
    uint64_t v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v8];
    id v5 = v8;
    if (!v4)
    {
      _HKInitializeLogging();
      uint64_t v6 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v10 = v5;
        _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Failed to decode persisted CK account info: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_resetCachedOwnerIdentifiers
{
  BOOL v3 = [HDCloudSyncManagerDiscardCachedOwnerIdentifiersTask alloc];
  self = (HDCloudSyncAccountProvider *)((char *)self + 8);
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.isa);
  id v5 = [WeakRetained daemon];
  BOOL v7 = [(HDCloudSyncManagerDiscardCachedOwnerIdentifiersTask *)v3 initWithDaemon:v5];

  [(HDCloudSyncManagerTask *)v7 setPriority:1000];
  id v6 = objc_loadWeakRetained((id *)&self->super.isa);
  [v6 addManagerTask:v7];
}

- (id)_disableAndDeleteAllSyncDataForProfile:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, uint64_t, void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  char v9 = [WeakRetained shouldSyncProfile:v6];

  if ((v9 & 1) != 0 && v6)
  {
    id v10 = [v6 cloudSyncManager];
    uint64_t v11 = v10;
    if (v10)
    {
      [v10 disableAndDeleteAllSyncDataWithCompletion:v7];
    }
    else
    {
      v7[2](v7, 1, 0);
      objc_msgSend(MEMORY[0x1E4F28F90], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
    char v12 = };
  }
  else
  {
    v7[2](v7, 1, 0);
    char v12 = objc_msgSend(MEMORY[0x1E4F28F90], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
  }

  return v12;
}

- (void)_setHealthAccountDataclassEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  BOOL v7 = self->_lock_accountStore;
  os_unfair_lock_unlock(&self->_lock);
  id v8 = [(ACAccountStore *)v7 aa_primaryAppleAccount];
  char v9 = v8;
  if (v8)
  {
    [v8 setEnabled:v4 forDataclass:*MEMORY[0x1E4F17AB8]];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__HDCloudSyncAccountProvider__setHealthAccountDataclassEnabled_completion___block_invoke;
    v11[3] = &unk_1E6306B38;
    v11[4] = self;
    BOOL v13 = v4;
    id v12 = v6;
    [(ACAccountStore *)v7 saveAccount:v9 withCompletionHandler:v11];
  }
  else
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"cannot set Health dataclass enabled state because the primary account is nil");
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v10);
  }
}

void __75__HDCloudSyncAccountProvider__setHealthAccountDataclassEnabled_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29FA8];
  BOOL v7 = *MEMORY[0x1E4F29FA8];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      if (*(unsigned char *)(a1 + 48)) {
        char v9 = @"YES";
      }
      else {
        char v9 = @"NO";
      }
      id v10 = (__CFString *)*MEMORY[0x1E4F17AB8];
      int v14 = 138543874;
      uint64_t v15 = v8;
      __int16 v16 = 2114;
      id v17 = v9;
      __int16 v18 = 2114;
      id v19 = v10;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: set enabled = %{public}@ for dataclass %{public}@", (uint8_t *)&v14, 0x20u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (*(unsigned char *)(a1 + 48)) {
      id v12 = @"YES";
    }
    else {
      id v12 = @"NO";
    }
    uint64_t v13 = *MEMORY[0x1E4F17AB8];
    int v14 = 138544130;
    uint64_t v15 = v11;
    __int16 v16 = 2114;
    id v17 = v5;
    __int16 v18 = 2114;
    id v19 = v12;
    __int16 v20 = 2114;
    uint64_t v21 = v13;
    _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: error %{public}@ trying to set enabled = %{public}@ for dataclass %{public}@", (uint8_t *)&v14, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_rollOwnerDifferentiatorAfterCloudSyncDisableForAllProfiles:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 beginTask];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  p_coordinator = &self->_coordinator;
  id WeakRetained = objc_loadWeakRetained((id *)p_coordinator);
  BOOL v7 = [WeakRetained daemon];
  uint64_t v8 = [v7 profileManager];
  char v9 = [v8 allProfileIdentifiers];

  id obj = v9;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * v13);
        id v15 = objc_loadWeakRetained((id *)p_coordinator);
        __int16 v16 = [v15 daemon];
        id v17 = [v16 profileManager];
        __int16 v18 = [v17 profileForIdentifier:v14];

        if (v18)
        {
          [v4 beginTask];
          id v19 = [v18 cloudSyncManager];
          __int16 v20 = [v19 ownerIdentifierManager];
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __90__HDCloudSyncAccountProvider__rollOwnerDifferentiatorAfterCloudSyncDisableForAllProfiles___block_invoke;
          v22[3] = &unk_1E62F5D48;
          id v23 = v18;
          id v24 = v4;
          [v20 rollOwnerDifferentiatorAfterCloudSyncDisableWithCompletion:v22];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  [v4 finishTask];
}

void __90__HDCloudSyncAccountProvider__rollOwnerDifferentiatorAfterCloudSyncDisableForAllProfiles___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29FA8];
  BOOL v7 = *MEMORY[0x1E4F29FA8];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138543362;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Updated owner identifier after disabling cloud sync.", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 40) finishTask];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update owner differentiator after disabling cloud sync: %{public}@.", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 40) failTaskWithError:v5];
  }
}

- (void)_triggerSyncForAccountChange
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  BOOL v3 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543618;
    id v5 = self;
    __int16 v6 = 2048;
    uint64_t v7 = 0x404E000000000000;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Scheduling post-account-change sync with grace period %lf", (uint8_t *)&v4, 0x16u);
  }
  [(HDXPCGatedActivity *)self->_accountChangeGatedSyncActivity requestRunWithMaximumDelay:&__block_literal_global_178 completion:60.0];
}

- (BOOL)_shouldPerformFullSyncOnAccountChange
{
  return [(_HKBehavior *)self->_behavior supportsPeriodicFullCloudSync];
}

- (void)_performSyncForAccountChangeWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(HDCloudSyncAccountProvider *)self _shouldPerformFullSyncOnAccountChange])
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73__HDCloudSyncAccountProvider__performSyncForAccountChangeWithCompletion___block_invoke;
    v6[3] = &unk_1E62F4928;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(queue, v6);
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __73__HDCloudSyncAccountProvider__performSyncForAccountChangeWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v3;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud sync triggered by account changes (iCloud login or health dataclass enabled)", buf, 0xCu);
  }
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [[HDCloudSyncContext alloc] initForPurpose:0 options:0 reason:2 xpcActivity:*(void *)(*(void *)(a1 + 32) + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__HDCloudSyncAccountProvider__performSyncForAccountChangeWithCompletion___block_invoke_323;
  v10[3] = &unk_1E62F2A18;
  id v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v4;
  id v12 = v7;
  id v8 = v4;
  id v9 = (id)[WeakRetained syncAllProfilesWithContext:v5 completion:v10];
}

void __73__HDCloudSyncAccountProvider__performSyncForAccountChangeWithCompletion___block_invoke_323(void *a1, char a2, void *a3)
{
  id v5 = a3;
  double v6 = 0.0;
  id v15 = v5;
  if (a2)
  {
    uint64_t v7 = 0;
    goto LABEL_12;
  }
  id v8 = [v5 domain];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v9)
  {
    if ([v15 code] == 6 || objc_msgSend(v15, "code") == 7)
    {
      int v10 = [v15 userInfo];
      id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F19C60]];
      [v11 doubleValue];
      double v6 = v12;
    }
    goto LABEL_11;
  }
  if (!objc_msgSend(v15, "hk_isHealthKitError"))
  {
LABEL_11:
    uint64_t v7 = 3;
    goto LABEL_12;
  }
  if ([v15 code] == 701) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 3;
  }
LABEL_12:
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  uint64_t v14 = [WeakRetained periodicActivityScheduler];
  [v14 updatePeriodicActivitesWithResult:v7 minimumRetryInterval:a1[5] activityStartDate:v15 error:v6];

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)unitTest_setAccountStore:(id)a3
{
  id v4 = (ACAccountStore *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_accountStore = self->_lock_accountStore;
  self->_lock_accountStore = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14320], 1);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14338], 1);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14308], 1);
  xpc_dictionary_set_string(empty, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14168], 1);
  xpc_dictionary_set_int64(empty, (const char *)*MEMORY[0x1E4F14260], 263192576);
  _HKInitializeLogging();
  objc_initWeak(&location, self);
  id v6 = objc_alloc(MEMORY[0x1E4F65DC0]);
  uint64_t v7 = *MEMORY[0x1E4F29FA8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__HDCloudSyncAccountProvider_profileDidBecomeReady___block_invoke;
  v10[3] = &unk_1E62F94B8;
  objc_copyWeak(&v11, &location);
  id v8 = (HDXPCGatedActivity *)[v6 initWithName:@"com.apple.healthd.sync.accountChange" criteria:empty loggingCategory:v7 handler:v10];
  accountChangeGatedSyncActivity = self->_accountChangeGatedSyncActivity;
  self->_accountChangeGatedSyncActivity = v8;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __52__HDCloudSyncAccountProvider_profileDidBecomeReady___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _performSyncForAccountChangeWithCompletion:v5];
}

- (void)daemonReady:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  id v4 = [WeakRetained daemon];
  id v5 = [v4 primaryProfile];
  [v5 registerProfileReadyObserver:self queue:self->_queue];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accountChangeGatedSyncActivity, 0);
  objc_storeStrong((id *)&self->_lock_accountStore, 0);
  objc_storeStrong((id *)&self->_behavior, 0);

  objc_destroyWeak((id *)&self->_coordinator);
}

@end