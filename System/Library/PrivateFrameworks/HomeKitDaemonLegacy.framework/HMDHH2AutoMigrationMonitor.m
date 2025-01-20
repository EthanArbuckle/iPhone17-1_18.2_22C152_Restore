@interface HMDHH2AutoMigrationMonitor
+ (id)logCategory;
- (HMDHH2AutoMigrationMonitor)initWithHomeManager:(id)a3 eligibilityChecker:(id)a4;
- (HMDHH2AutoMigrationMonitor)initWithHomeManager:(id)a3 fmfHandler:(id)a4 backgroundTaskScheduler:(id)a5 eligibilityChecker:(id)a6 featuresDataSource:(id)a7 logEventSubmitter:(id)a8;
- (id)homeManager;
- (void)_attemptAutoMigrationWithCompletionHandler:(void *)a1;
- (void)_registerForBackgroundTask;
- (void)_unregisterForBackgroundTask;
- (void)attemptAutoMigrationWithCompletionHandler:(id)a3;
- (void)handleFMFStatusUpdatedNotification:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
- (void)submitEndMigrationEventWithAutoMigration:(void *)a3 error:;
- (void)submitStartMigrationEventWithAutoMigration:(void *)a1;
@end

@implementation HMDHH2AutoMigrationMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_eligibilityChecker, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_fmfHandler, 0);
  objc_destroyWeak((id *)&self->_homeManager);
}

- (void)handleFMFStatusUpdatedNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = +[HMDFMF fmfStatusWithDict:v5];

  v7 = (void *)MEMORY[0x1D9452090]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      int v14 = 138543618;
      v15 = v11;
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@FMF status changed to %@", (uint8_t *)&v14, 0x16u);
    }
    if ([v6 value] == 2) {
      -[HMDHH2AutoMigrationMonitor _registerForBackgroundTask]((uint64_t)v8);
    }
    else {
      -[HMDHH2AutoMigrationMonitor _unregisterForBackgroundTask]((uint64_t)v8);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      v13 = [v4 userInfo];
      int v14 = 138543618;
      v15 = v12;
      __int16 v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find FMF status in notification user info: %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)_registerForBackgroundTask
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v3 = [WeakRetained workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__HMDHH2AutoMigrationMonitor__registerForBackgroundTask__block_invoke;
    block[3] = &unk_1E6A19B30;
    block[4] = a1;
    dispatch_async(v3, block);
  }
}

- (void)_unregisterForBackgroundTask
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v3 = [WeakRetained workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__HMDHH2AutoMigrationMonitor__unregisterForBackgroundTask__block_invoke;
    block[3] = &unk_1E6A19B30;
    block[4] = a1;
    dispatch_async(v3, block);
  }
}

void __58__HMDHH2AutoMigrationMonitor__unregisterForBackgroundTask__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 24, 1);
  }
  id v15 = 0;
  char v4 = [Property cancelTaskRequestWithIdentifier:@"com.apple.homed.hh2.auto.migration" error:&v15];
  id v5 = v15;
  v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = *(id *)(a1 + 32);
  v8 = HMFGetOSLogHandle();
  v9 = v8;
  if (v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v17 = v10;
      __int16 v18 = 2112;
      v19 = @"com.apple.homed.hh2.auto.migration";
      v11 = "%{public}@Canceled background task request with identifier: %@";
      v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_INFO;
      uint32_t v14 = 22;
LABEL_8:
      _os_log_impl(&dword_1D49D5000, v12, v13, v11, buf, v14);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v17 = v10;
    __int16 v18 = 2112;
    v19 = @"com.apple.homed.hh2.auto.migration";
    __int16 v20 = 2112;
    id v21 = v5;
    v11 = "%{public}@Failed to cancel background task request with identifier %@: %@";
    v12 = v9;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    uint32_t v14 = 32;
    goto LABEL_8;
  }
}

void __56__HMDHH2AutoMigrationMonitor__registerForBackgroundTask__block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  char v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v36 = v5;
    __int16 v37 = 2114;
    v38 = @"com.apple.homed.hh2.auto.migration";
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Registering for background task with identifier: %{public}@", buf, 0x16u);
  }
  id Property = *(id *)(a1 + 32);
  if (Property)
  {
    id Property = objc_getProperty(Property, v6, 24, 1);
    v8 = *(id **)(a1 + 32);
  }
  else
  {
    v8 = 0;
  }
  id v9 = Property;
  v10 = -[HMDHH2AutoMigrationMonitor homeManager](v8);
  v11 = [v10 workQueue];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __56__HMDHH2AutoMigrationMonitor__registerForBackgroundTask__block_invoke_30;
  v34[3] = &unk_1E6A13780;
  v34[4] = *(void *)(a1 + 32);
  [v9 registerForTaskWithIdentifier:@"com.apple.homed.hh2.auto.migration" usingQueue:v11 launchHandler:v34];

  id v13 = *(id *)(a1 + 32);
  if (v13) {
    id v13 = objc_getProperty(v13, v12, 24, 1);
  }
  uint32_t v14 = [v13 taskRequestForIdentifier:@"com.apple.homed.hh2.auto.migration"];
  if (v14)
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = *(id *)(a1 + 32);
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v36 = v18;
      __int16 v37 = 2114;
      v38 = v14;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Background task request already exists: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v19 = [[HMDBackgroundSystemTaskRequest alloc] initWithIdentifier:@"com.apple.homed.hh2.auto.migration"];
    [(HMDBackgroundSystemTaskRequest *)v19 setRequiresInexpensiveNetworkConnectivity:1];
    [(HMDBackgroundSystemTaskRequest *)v19 setRequiresSignificantUserInactivity:1];
    [(HMDBackgroundSystemTaskRequest *)v19 setInterval:86400.0];
    [(HMDBackgroundSystemTaskRequest *)v19 interval];
    id v21 = (void *)MEMORY[0x1D9452090]([(HMDBackgroundSystemTaskRequest *)v19 setMinDurationBetweenInstances:v20 * 0.8]);
    id v22 = *(id *)(a1 + 32);
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v36 = v24;
      __int16 v37 = 2114;
      v38 = (__CFString *)v19;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Submitting background task request: %{public}@", buf, 0x16u);
    }
    id v26 = *(id *)(a1 + 32);
    if (v26) {
      id v26 = objc_getProperty(v26, v25, 24, 1);
    }
    id v33 = 0;
    char v27 = [v26 submitTaskRequest:v19 error:&v33];
    id v28 = v33;
    if ((v27 & 1) == 0)
    {
      v29 = (void *)MEMORY[0x1D9452090]();
      id v30 = *(id *)(a1 + 32);
      v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v36 = v32;
        __int16 v37 = 2114;
        v38 = (__CFString *)v19;
        __int16 v39 = 2114;
        id v40 = v28;
        _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to submit task request %{public}@: %{public}@", buf, 0x20u);
      }
    }
  }
}

- (id)homeManager
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 1);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

void __56__HMDHH2AutoMigrationMonitor__registerForBackgroundTask__block_invoke_30(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [[HMDXPCActivityRunReportLogEvent alloc] initWithActivityName:@"com.apple.homed.hh2.auto.migration" definedInterval:0 activityShouldWake:86400.0 timeSinceLastRun:0.0];
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v4, 48, 1);
  }
  [Property submitLogEvent:v5];
  id v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__HMDHH2AutoMigrationMonitor__registerForBackgroundTask__block_invoke_2;
  v9[3] = &unk_1E6A18288;
  id v10 = v3;
  id v8 = v3;
  -[HMDHH2AutoMigrationMonitor _attemptAutoMigrationWithCompletionHandler:](v7, v9);
}

uint64_t __56__HMDHH2AutoMigrationMonitor__registerForBackgroundTask__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTaskCompleted];
}

- (void)_attemptAutoMigrationWithCompletionHandler:(void *)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    char v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = a1;
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v13 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting auto migration", buf, 0xCu);
    }
    id Property = objc_getProperty(v5, v8, 32, 1);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__HMDHH2AutoMigrationMonitor__attemptAutoMigrationWithCompletionHandler___block_invoke;
    v10[3] = &unk_1E6A137A8;
    v10[4] = v5;
    id v11 = v3;
    [Property fetchIsCurrentUserEligibleForAutoMigrationWithCompletion:v10];
  }
}

void __73__HMDHH2AutoMigrationMonitor__attemptAutoMigrationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = -[HMDHH2AutoMigrationMonitor homeManager](*(id **)(a1 + 32));
  if (!v4)
  {
    id v26 = (void *)MEMORY[0x1D9452090]();
    id v27 = *(id *)(a1 + 32);
    id v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v79 = v29;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Not starting HH2 migration because home manager reference is nil", buf, 0xCu);
    }
    -[HMDHH2AutoMigrationMonitor submitStartMigrationEventWithAutoMigration:](*(void **)(a1 + 32), 1);
    id v30 = *(void **)(a1 + 32);
    uint64_t v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    goto LABEL_40;
  }
  if (([v3 isEligible] & 1) == 0)
  {
    v32 = (void *)MEMORY[0x1D9452090]();
    id v33 = *(id *)(a1 + 32);
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v79 = v35;
      _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Not starting HH2 migration because current user is not eligible, but will check whether we can do dry run or not", buf, 0xCu);
    }
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v36, 40, 1);
    }
    if ([Property isHH2MigrationDryRunEnabled])
    {
      v38 = [v4 homes];
      uint64_t v39 = [v38 count];

      if (v39)
      {
        -[HMDHH2AutoMigrationMonitor submitStartMigrationEventWithAutoMigration:](*(void **)(a1 + 32), 0);
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __73__HMDHH2AutoMigrationMonitor__attemptAutoMigrationWithCompletionHandler___block_invoke_37;
        v76[3] = &unk_1E6A17D78;
        id v40 = *(void **)(a1 + 40);
        v76[4] = *(void *)(a1 + 32);
        id v77 = v40;
        [v4 dryRunHH2MigrationWithCompletionHandler:v76];
        uint64_t v41 = v77;
        goto LABEL_44;
      }
      v68 = (void *)MEMORY[0x1D9452090]();
      id v69 = *(id *)(a1 + 32);
      v70 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        v71 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v79 = v71;
        _os_log_impl(&dword_1D49D5000, v70, OS_LOG_TYPE_INFO, "%{public}@Not running dry run on empty account as it will fail in absence of keyed archive", buf, 0xCu);
      }
      -[HMDHH2AutoMigrationMonitor submitStartMigrationEventWithAutoMigration:](*(void **)(a1 + 32), 0);
      v46 = *(void **)(a1 + 32);
      v47 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v48 = 2720;
    }
    else
    {
      v42 = (void *)MEMORY[0x1D9452090]();
      id v43 = *(id *)(a1 + 32);
      v44 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        v45 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v79 = v45;
        _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_INFO, "%{public}@Not starting \"HH2 Dry Run Migration\" because Dry Run is disabled", buf, 0xCu);
      }
      -[HMDHH2AutoMigrationMonitor submitStartMigrationEventWithAutoMigration:](*(void **)(a1 + 32), 0);
      v46 = *(void **)(a1 + 32);
      v47 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v48 = 2724;
    }
    v63 = [v47 hmPrivateErrorWithCode:v48];
    v64 = v46;
    uint64_t v65 = 0;
    goto LABEL_49;
  }
  id v5 = *(void **)(a1 + 32);
  if (!v5)
  {
    BOOL v23 = 0;
    goto LABEL_36;
  }
  v6 = [MEMORY[0x1E4F65548] productInfo];
  id v7 = [v6 softwareVersion];
  SEL v8 = [v7 buildVersion];

  if (!v8)
  {
    v49 = (void *)MEMORY[0x1D9452090]();
    id v50 = v5;
    v51 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
    {
      v52 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v79 = v52;
      _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_FAULT, "%{public}@Should not get here, skipping auto migration due to missing build version", buf, 0xCu);
    }
    BOOL v23 = 1;
    goto LABEL_35;
  }
  id v9 = +[HMDHH2MigrationStateLogger autoMigrationAttempt];
  if (!v9)
  {
    v53 = (void *)MEMORY[0x1D9452090]();
    id v54 = v5;
    v55 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v57 = id v56 = v3;
      *(_DWORD *)buf = 138543618;
      v79 = v57;
      __int16 v80 = 2114;
      v81 = v8;
      _os_log_impl(&dword_1D49D5000, v55, OS_LOG_TYPE_INFO, "%{public}@First auto migration attempt for build %{public}@", buf, 0x16u);

      id v3 = v56;
    }

    BOOL v23 = 0;
    goto LABEL_34;
  }
  id v73 = v3;
  int v10 = isInternalBuild();
  id v11 = @"hh2AutoMigrationMaxAttempts";
  if (v10) {
    id v11 = @"hh2InternalAutoMigrationMaxAttempts";
  }
  v12 = v11;
  uint64_t v13 = [v9 integerValue];
  uint64_t v14 = [MEMORY[0x1E4F65530] sharedPreferences];
  v72 = v12;
  id v15 = [v14 preferenceForKey:v12];
  id v16 = [v15 numberValue];
  uint64_t v17 = [v16 integerValue];

  __int16 v18 = (void *)MEMORY[0x1D9452090]();
  id v19 = v5;
  double v20 = HMFGetOSLogHandle();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
  BOOL v22 = v13 < v17;
  BOOL v23 = v13 >= v17;
  if (v22)
  {
    if (v21)
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v79 = v24;
      __int16 v80 = 2114;
      v81 = v9;
      __int16 v82 = 2114;
      v83 = v8;
      v25 = "%{public}@Last auto migration attempt count %{public}@ for current build %{public}@";
      goto LABEL_32;
    }
  }
  else if (v21)
  {
    v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v79 = v24;
    __int16 v80 = 2114;
    v81 = v9;
    __int16 v82 = 2114;
    v83 = v8;
    v25 = "%{public}@Maximum auto migration attempts (%{public}@) reached for current build %{public}@";
LABEL_32:
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, v25, buf, 0x20u);
  }

  id v3 = v73;
LABEL_34:

LABEL_35:
LABEL_36:
  v58 = (void *)MEMORY[0x1D9452090]();
  id v59 = *(id *)(a1 + 32);
  v60 = HMFGetOSLogHandle();
  BOOL v61 = os_log_type_enabled(v60, OS_LOG_TYPE_INFO);
  if (v23)
  {
    if (v61)
    {
      v62 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v79 = v62;
      _os_log_impl(&dword_1D49D5000, v60, OS_LOG_TYPE_INFO, "%{public}@Will not perform HH2 auto migration since we are at maximum number of attempts", buf, 0xCu);
    }
    -[HMDHH2AutoMigrationMonitor submitStartMigrationEventWithAutoMigration:](*(void **)(a1 + 32), 1);
    id v30 = *(void **)(a1 + 32);
    uint64_t v31 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2733];
LABEL_40:
    v63 = (void *)v31;
    v64 = v30;
    uint64_t v65 = 1;
LABEL_49:
    -[HMDHH2AutoMigrationMonitor submitEndMigrationEventWithAutoMigration:error:](v64, v65, v63);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_50;
  }
  if (v61)
  {
    v66 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v79 = v66;
    _os_log_impl(&dword_1D49D5000, v60, OS_LOG_TYPE_INFO, "%{public}@Starting HH2 migration because current user is eligible", buf, 0xCu);
  }
  -[HMDHH2AutoMigrationMonitor submitStartMigrationEventWithAutoMigration:](*(void **)(a1 + 32), 1);
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __73__HMDHH2AutoMigrationMonitor__attemptAutoMigrationWithCompletionHandler___block_invoke_39;
  v74[3] = &unk_1E6A17D78;
  v67 = *(void **)(a1 + 40);
  v74[4] = *(void *)(a1 + 32);
  id v75 = v67;
  [v4 autoMigrateToHH2WithCompletionHandler:v74];
  uint64_t v41 = v75;
LABEL_44:

LABEL_50:
}

- (void)submitStartMigrationEventWithAutoMigration:(void *)a1
{
  if (a1)
  {
    id v4 = [[HMDHH2MigrationDailyTotalsLogEvent alloc] initStartWithAutoMigration:a2 dryRun:a2 ^ 1 attemptCount:0];
    objc_msgSend(objc_getProperty(a1, v3, 48, 1), "submitLogEvent:", v4);
  }
}

- (void)submitEndMigrationEventWithAutoMigration:(void *)a3 error:
{
  if (a1)
  {
    id v5 = a3;
    v6 = [HMDHH2MigrationDailyTotalsLogEvent alloc];
    id v7 = +[HMDHH2MigrationStateLogger autoMigrationAttempt];
    id v9 = [(HMDHH2MigrationDailyTotalsLogEvent *)v6 initEndWithAutoMigration:a2 dryRun:a2 ^ 1 attemptCount:v7 error:v5];

    objc_msgSend(objc_getProperty(a1, v8, 48, 1), "submitLogEvent:", v9);
  }
}

void __73__HMDHH2AutoMigrationMonitor__attemptAutoMigrationWithCompletionHandler___block_invoke_37(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      SEL v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      id v11 = v8;
      __int16 v12 = 2114;
      id v13 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to start HH2 dry run migration: %{public}@", (uint8_t *)&v10, 0x16u);
    }
    -[HMDHH2AutoMigrationMonitor submitEndMigrationEventWithAutoMigration:error:](*(void **)(a1 + 32), 0, v3);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully started HH2 Dry run migration", (uint8_t *)&v10, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __73__HMDHH2AutoMigrationMonitor__attemptAutoMigrationWithCompletionHandler___block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = v3;
    id v7 = v6;
    if (!v5) {
      goto LABEL_16;
    }
    SEL v8 = [v6 domain];
    int v9 = [v8 isEqualToString:*MEMORY[0x1E4F2D140]];

    if (!v9) {
      goto LABEL_16;
    }
    uint64_t v10 = [v7 code];
    if ((unint64_t)(v10 - 2704) > 0x17) {
      goto LABEL_16;
    }
    if (((1 << (v10 + 112)) & 0xC00102) != 0)
    {

      goto LABEL_18;
    }
    if (v10 == 2704)
    {
      uint64_t v17 = [v7 userInfo];
      __int16 v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v19 = v18;
      }
      else {
        id v19 = 0;
      }
      id v20 = v19;

      char v21 = isTransientCloudKitError(v20);
      if (v21)
      {
LABEL_18:
        BOOL v22 = (void *)MEMORY[0x1D9452090](v11);
        id v23 = *(id *)(a1 + 32);
        v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = HMFGetLogIdentifier();
          int v26 = 138543618;
          id v27 = v25;
          __int16 v28 = 2114;
          v29 = v7;
          _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to start HH2 migration: %{public}@", (uint8_t *)&v26, 0x16u);
        }
        -[HMDHH2AutoMigrationMonitor submitEndMigrationEventWithAutoMigration:error:](*(void **)(a1 + 32), 1, v7);
        id v16 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
        goto LABEL_21;
      }
    }
    else
    {
LABEL_16:
    }
    uint64_t v11 = +[HMDHH2MigrationStateLogger incrementAutoMigrationAttempt];
    goto LABEL_18;
  }
  __int16 v12 = (void *)MEMORY[0x1D9452090](+[HMDHH2MigrationStateLogger incrementAutoMigrationAttempt]);
  id v13 = *(id *)(a1 + 32);
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    int v26 = 138543362;
    id v27 = v15;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Successfully started HH2 migration", (uint8_t *)&v26, 0xCu);
  }
  id v16 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_21:
  v16();
}

- (void)attemptAutoMigrationWithCompletionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    SEL v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Asked to attempt auto migration", (uint8_t *)&v9, 0xCu);
  }
  -[HMDHH2AutoMigrationMonitor _attemptAutoMigrationWithCompletionHandler:](v6, v4);
}

- (void)stopMonitoring
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v10 = 138543362;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Asked to stop monitoring for HH2 auto-migration", (uint8_t *)&v10, 0xCu);
  }
  SEL v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  if (v4) {
    id Property = objc_getProperty(v4, v7, 16, 1);
  }
  else {
    id Property = 0;
  }
  [v8 removeObserver:v4 name:@"HMDFMFStatusUpdateNotification" object:Property];

  -[HMDHH2AutoMigrationMonitor _unregisterForBackgroundTask]((uint64_t)v4);
}

- (void)startMonitoring
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v16 = 138543362;
    uint64_t v17 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Asked to start monitoring for HH2 auto-migration", (uint8_t *)&v16, 0xCu);
  }
  if (v4) {
    id Property = objc_getProperty(v4, v7, 16, 1);
  }
  else {
    id Property = 0;
  }
  if ([Property isThisDesignatedFMFDevice])
  {
    -[HMDHH2AutoMigrationMonitor _registerForBackgroundTask]((uint64_t)v4);
  }
  else
  {
    int v9 = (void *)MEMORY[0x1D9452090]();
    int v10 = v4;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v16 = 138543362;
      uint64_t v17 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Not registering for background task because this device is not designated FMF device", (uint8_t *)&v16, 0xCu);
    }
  }
  uint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  if (v4) {
    id v15 = objc_getProperty(v4, v13, 16, 1);
  }
  else {
    id v15 = 0;
  }
  [v14 addObserver:v4 selector:sel_handleFMFStatusUpdatedNotification_ name:@"HMDFMFStatusUpdateNotification" object:v15];
}

- (HMDHH2AutoMigrationMonitor)initWithHomeManager:(id)a3 fmfHandler:(id)a4 backgroundTaskScheduler:(id)a5 eligibilityChecker:(id)a6 featuresDataSource:(id)a7 logEventSubmitter:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id obj = a7;
  id v18 = a7;
  id v29 = a8;
  id v19 = a8;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v15)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v16)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v17)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v18)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  id v20 = v19;
  if (!v19)
  {
LABEL_15:
    v24 = (HMDHH2AutoMigrationMonitor *)_HMFPreconditionFailure();
    return [(HMDHH2AutoMigrationMonitor *)v24 initWithHomeManager:v26 eligibilityChecker:v27];
  }
  v30.receiver = self;
  v30.super_class = (Class)HMDHH2AutoMigrationMonitor;
  char v21 = [(HMDHH2AutoMigrationMonitor *)&v30 init];
  BOOL v22 = v21;
  if (v21)
  {
    objc_storeWeak((id *)&v21->_homeManager, v14);
    objc_storeStrong((id *)&v22->_fmfHandler, a4);
    objc_storeStrong((id *)&v22->_taskScheduler, a5);
    objc_storeStrong((id *)&v22->_eligibilityChecker, a6);
    objc_storeStrong((id *)&v22->_featuresDataSource, obj);
    objc_storeStrong((id *)&v22->_logEventSubmitter, v29);
  }

  return v22;
}

- (HMDHH2AutoMigrationMonitor)initWithHomeManager:(id)a3 eligibilityChecker:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  SEL v8 = +[HMDFMFHandler sharedHandler];
  int v9 = objc_alloc_init(HMDBackgroundSystemTaskScheduler);
  int v10 = objc_alloc_init(HMDFeaturesDataSource);
  uint64_t v11 = [v7 logEventSubmitter];
  uint64_t v12 = [(HMDHH2AutoMigrationMonitor *)self initWithHomeManager:v7 fmfHandler:v8 backgroundTaskScheduler:v9 eligibilityChecker:v6 featuresDataSource:v10 logEventSubmitter:v11];

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t28_149109 != -1) {
    dispatch_once(&logCategory__hmf_once_t28_149109, &__block_literal_global_149110);
  }
  v2 = (void *)logCategory__hmf_once_v29_149111;
  return v2;
}

uint64_t __41__HMDHH2AutoMigrationMonitor_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v29_149111;
  logCategory__hmf_once_v29_149111 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end