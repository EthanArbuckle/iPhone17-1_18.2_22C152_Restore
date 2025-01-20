@interface HDPeriodicCountryMonitor
- (HDKeyValueDomain)_lastActivePairedBuildIdentifiersDomain;
- (HDPeriodicCountryMonitor)initWithProfile:(id)a3 nanoSyncManager:(id)a4;
- (HDPeriodicCountryMonitor)initWithProfile:(id)a3 nanoSyncManager:(id)a4 countryCodeProvider:(id)a5 userDefaults:(id)a6;
- (NSDate)lastCheckAttemptDate;
- (NSDate)lastFetchAttemptDate;
- (NSDate)unitTest_currentDate;
- (NSString)lastFetchAttemptBuild;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)observerQueue;
- (_HDPeriodicCountryMonitorPairedBuildIdentifiers)_currentPairedBuildIdentifiers;
- (id)diagnosticDescription;
- (uint64_t)_lock_enterStateIfPossible:(uint64_t)result;
- (void)_enqueueMaintenanceOperationIfNeeded;
- (void)_fetchCountryIfNeededWithCompletion:(uint64_t)a1;
- (void)_recordSuccessfulFetchForCurrentPairedBuilds;
- (void)enqueueMaintenanceFetch;
- (void)fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion:(id)a3;
- (void)nanoSyncManager:(id)a3 pairedDevicesChanged:(id)a4;
- (void)registerObserver:(id)a3;
- (void)setUnitTest_currentDate:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation HDPeriodicCountryMonitor

- (HDPeriodicCountryMonitor)initWithProfile:(id)a3 nanoSyncManager:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1CB18];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 standardUserDefaults];
  v10 = [(HDPeriodicCountryMonitor *)self initWithProfile:v8 nanoSyncManager:v7 countryCodeProvider:&__block_literal_global_13 userDefaults:v9];

  return v10;
}

uint64_t __60__HDPeriodicCountryMonitor_initWithProfile_nanoSyncManager___block_invoke()
{
  return MEMORY[0x1F40E7EA8]();
}

- (HDPeriodicCountryMonitor)initWithProfile:(id)a3 nanoSyncManager:(id)a4 countryCodeProvider:(id)a5 userDefaults:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)HDPeriodicCountryMonitor;
  v14 = [(HDPeriodicCountryMonitor *)&v27 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_profile, v10);
    objc_storeStrong((id *)&v15->_nanoSyncManager, a4);
    v16 = _Block_copy(v12);
    id countryCodeProvider = v15->_countryCodeProvider;
    v15->_id countryCodeProvider = v16;

    objc_storeStrong((id *)&v15->_userDefaults, a6);
    id v18 = objc_alloc(MEMORY[0x1E4F2B5F0]);
    v19 = [(HDPeriodicCountryMonitor *)v15 hk_classNameWithTag:@"observers"];
    v20 = HKLogInfrastructure();
    uint64_t v21 = [v18 initWithName:v19 loggingCategory:v20];
    observers = v15->_observers;
    v15->_observers = (HKSynchronousObserverSet *)v21;

    v15->_state = 0;
    v15->_lock_shouldBypassNextBuildVersionLimit = 0;
    v15->_lock._os_unfair_lock_opaque = 0;
    uint64_t v23 = HKCreateSerialDispatchQueue();
    observerQueue = v15->_observerQueue;
    v15->_observerQueue = (OS_dispatch_queue *)v23;

    [v11 addObserver:v15];
    v25 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v25 addObject:v15];
  }
  return v15;
}

- (void)registerObserver:(id)a3
{
}

- (void)unregisterObserver:(id)a3
{
}

- (void)fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = HKLogInfrastructure();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = (id)objc_opt_class();
    id v6 = v13;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Client requesting immediate fetch", (uint8_t *)&v12, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  self->_lock_shouldBypassNextBuildVersionLimit = 1;
  char v7 = -[HDPeriodicCountryMonitor _lock_enterStateIfPossible:]((uint64_t)self, 3);
  os_unfair_lock_unlock(&self->_lock);
  if (v7)
  {
    -[HDPeriodicCountryMonitor _fetchCountryIfNeededWithCompletion:]((uint64_t)self, v4);
  }
  else
  {
    _HKInitializeLogging();
    id v8 = HKLogInfrastructure();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_opt_class();
      int v12 = 138543362;
      id v13 = v10;
      id v11 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to enter fetching state. Returning error to client.", (uint8_t *)&v12, 0xCu);
    }
    v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"A fetch is already in progress");
    (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v9);
  }
}

- (uint64_t)_lock_enterStateIfPossible:(uint64_t)result
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(result + 48));
    uint64_t v4 = *(void *)(v3 + 56);
    switch(v4)
    {
      case 0:
        if (((a2 - 1) & 0xFFFFFFFFFFFFFFFDLL) != 0) {
          goto LABEL_4;
        }
        goto LABEL_11;
      case 1:
        if ((a2 & 0xFFFFFFFFFFFFFFFELL) == 2) {
          goto LABEL_11;
        }
        goto LABEL_4;
      case 2:
      case 3:
        if ((a2 & 0xFFFFFFFFFFFFFFFBLL) != 0) {
          goto LABEL_4;
        }
        goto LABEL_11;
      case 4:
        if (!a2) {
          goto LABEL_11;
        }
LABEL_4:
        _HKInitializeLogging();
        v5 = HKLogInfrastructure();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          id v11 = objc_opt_class();
          if ((unint64_t)(v4 - 1) > 3) {
            int v12 = @"WaitingForPairingChanges";
          }
          else {
            int v12 = off_1E62F4998[v4 - 1];
          }
          if ((unint64_t)(a2 - 1) > 3) {
            id v13 = @"WaitingForPairingChanges";
          }
          else {
            id v13 = off_1E62F4998[a2 - 1];
          }
          int v15 = 138543874;
          v16 = v11;
          __int16 v17 = 2114;
          id v18 = v12;
          __int16 v19 = 2114;
          v20 = v13;
          id v14 = v11;
          _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Invalid attempt to change state from %{public}@ to %{public}@", (uint8_t *)&v15, 0x20u);
        }
        result = 0;
        break;
      default:
LABEL_11:
        _HKInitializeLogging();
        id v6 = HKLogInfrastructure();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          char v7 = objc_opt_class();
          if ((unint64_t)(v4 - 1) > 3) {
            id v8 = @"WaitingForPairingChanges";
          }
          else {
            id v8 = off_1E62F4998[v4 - 1];
          }
          if ((unint64_t)(a2 - 1) > 3) {
            v9 = @"WaitingForPairingChanges";
          }
          else {
            v9 = off_1E62F4998[a2 - 1];
          }
          int v15 = 138543874;
          v16 = v7;
          __int16 v17 = 2114;
          id v18 = v8;
          __int16 v19 = 2114;
          v20 = v9;
          id v10 = v7;
          _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] State will change from %{public}@ to %{public}@", (uint8_t *)&v15, 0x20u);
        }
        *(void *)(v3 + 56) = a2;
        result = 1;
        break;
    }
  }
  return result;
}

- (void)_fetchCountryIfNeededWithCompletion:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 80);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __64__HDPeriodicCountryMonitor__fetchCountryIfNeededWithCompletion___block_invoke;
    v6[3] = &unk_1E62F4928;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

- (void)enqueueMaintenanceFetch
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v3 = HKLogInfrastructure();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Client requesting maintenance fetch", (uint8_t *)&v5, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  self->_lock_shouldBypassNextBuildVersionLimit = 1;
  os_unfair_lock_unlock(&self->_lock);
  -[HDPeriodicCountryMonitor _enqueueMaintenanceOperationIfNeeded]((uint64_t)self);
}

- (void)_enqueueMaintenanceOperationIfNeeded
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 48);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    char v3 = -[HDPeriodicCountryMonitor _lock_enterStateIfPossible:](a1, 1);
    os_unfair_lock_unlock(v2);
    if (v3)
    {
      id v4 = (objc_class *)objc_opt_class();
      int v5 = NSStringFromClass(v4);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __64__HDPeriodicCountryMonitor__enqueueMaintenanceOperationIfNeeded__block_invoke;
      v10[3] = &unk_1E62F48B0;
      v10[4] = a1;
      id v6 = +[HDMaintenanceOperation maintenanceOperationWithName:v5 asynchronousBlock:v10];

      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      id v8 = [WeakRetained daemon];
      v9 = [v8 maintenanceWorkCoordinator];
      [v9 enqueueMaintenanceOperation:v6];
    }
    else
    {
      _HKInitializeLogging();
      id v6 = HKLogInfrastructure();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      *(_DWORD *)buf = 138543362;
      id v12 = (id)objc_opt_class();
      id WeakRetained = v12;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to enter maintenance operation state", buf, 0xCu);
    }

LABEL_6:
  }
}

- (NSDate)lastCheckAttemptDate
{
  return (NSDate *)[(NSUserDefaults *)self->_userDefaults hk_dateForKey:*MEMORY[0x1E4F2A320]];
}

- (NSString)lastFetchAttemptBuild
{
  return [(NSUserDefaults *)self->_userDefaults stringForKey:@"HDPeriodicCountryMonitor_LastFetchAttemptBuild"];
}

- (NSDate)lastFetchAttemptDate
{
  return (NSDate *)[(NSUserDefaults *)self->_userDefaults hk_dateForKey:@"HDPeriodicCountryMonitor_LastFetchAttemptDate"];
}

- (HDKeyValueDomain)_lastActivePairedBuildIdentifiersDomain
{
  v2 = [HDKeyValueDomain alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  id v4 = [(HDKeyValueDomain *)v2 initWithCategory:0 domainName:@"HDPeriodicCountryMonitor_ActivePairedBuildIdentifiers" profile:WeakRetained];

  return v4;
}

- (_HDPeriodicCountryMonitorPairedBuildIdentifiers)_currentPairedBuildIdentifiers
{
  if (a1)
  {
    v2 = [MEMORY[0x1E4F2B860] sharedBehavior];
    char v3 = [v2 currentOSBuild];

    id v4 = [*(id *)(a1 + 16) pairedDevicesSnapshot];
    int v5 = [v4 activeDeviceInfo];

    if (v5)
    {
      id v6 = [v5 sourceBundleIdentifier];
      uint64_t v7 = NSString;
      id v8 = [v5 systemBuildVersion];
      uint64_t v9 = [v7 stringWithFormat:@"%@_%@", v3, v8];

      char v3 = (void *)v9;
    }
    else
    {
      id v6 = @"NO_ACTIVE_PAIRED_DEVICE";
    }
    id v10 = [[_HDPeriodicCountryMonitorPairedBuildIdentifiers alloc] initWithPairingIdentifier:v6 buildIdentifier:v3];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_recordSuccessfulFetchForCurrentPairedBuilds
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v3 = -[HDPeriodicCountryMonitor _currentPairedBuildIdentifiers]((uint64_t)self);
  id v4 = [v3 buildIdentifier];
  int v5 = [v3 pairingIdentifier];
  id v6 = v5;
  v16 = 0;
  if (self)
  {
    id v7 = v5;
    id v8 = v4;
    uint64_t v9 = -[HDPeriodicCountryMonitor _lastActivePairedBuildIdentifiersDomain]((uint64_t)self);
    char v10 = [v9 setString:v8 forKey:v7 error:&v16];

    id v11 = v16;
  }
  else
  {
    id v11 = 0;
    char v10 = 0;
  }
  id v12 = v11;

  if ((v10 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v13 = HKLogInfrastructure();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v18 = v14;
      id v15 = v14;
      _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Error recording successful fetch for current paired builds", buf, 0xCu);
    }
  }
}

- (void)nanoSyncManager:(id)a3 pairedDevicesChanged:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  _HKInitializeLogging();
  id v6 = HKLogInfrastructure();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2112;
    id v11 = v5;
    id v7 = v9;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Observed paired devices snapshot change: %@", (uint8_t *)&v8, 0x16u);
  }
  -[HDPeriodicCountryMonitor _enqueueMaintenanceOperationIfNeeded]((uint64_t)self);
}

void __64__HDPeriodicCountryMonitor__enqueueMaintenanceOperationIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(os_unfair_lock_s **)(a1 + 32);
  char v3 = a2;
  if (v2)
  {
    os_unfair_lock_lock(v2 + 12);
    char v4 = -[HDPeriodicCountryMonitor _lock_enterStateIfPossible:]((uint64_t)v2, 2);
    os_unfair_lock_unlock(v2 + 12);
    if (v4)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __67__HDPeriodicCountryMonitor__runMaintenanceOperationWithCompletion___block_invoke;
      v5[3] = &unk_1E62F48D8;
      id v6 = v3;
      -[HDPeriodicCountryMonitor _fetchCountryIfNeededWithCompletion:]((uint64_t)v2, v5);
    }
    else
    {
      v3[2](v3);
    }
  }
}

uint64_t __67__HDPeriodicCountryMonitor__runMaintenanceOperationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__HDPeriodicCountryMonitor__fetchCountryIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = [MEMORY[0x1E4F1C9C8] date];
  if (v2) {
    [*(id *)(v2 + 24) setObject:v3 forKey:*MEMORY[0x1E4F2A320]];
  }

  char v4 = [*(id *)(*(void *)(a1 + 32) + 40) allObservers];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __64__HDPeriodicCountryMonitor__fetchCountryIfNeededWithCompletion___block_invoke_2;
  v69[3] = &unk_1E62F4900;
  v69[4] = *(void *)(a1 + 32);
  char v5 = objc_msgSend(v4, "hk_containsObjectPassingTest:", v69);

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48));
  if ((v5 & 1) == 0)
  {
    _HKInitializeLogging();
    id v18 = HKLogInfrastructure();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v19;
      id v20 = v19;
      _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping fetch as we have no observers", buf, 0xCu);
    }
    -[HDPeriodicCountryMonitor _lock_enterStateIfPossible:](*(void *)(a1 + 32), 0);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48));
    uint64_t v21 = *(void *)(a1 + 40);
    v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = @"Skipped fetch due to no observers";
    uint64_t v24 = 11;
    goto LABEL_31;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (!v6) {
    goto LABEL_28;
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)(v6 + 48));
  if (*(unsigned char *)(v6 + 64))
  {
    *(unsigned char *)(v6 + 64) = 0;
    goto LABEL_7;
  }
  v25 = -[HDPeriodicCountryMonitor _currentPairedBuildIdentifiers](v6);
  v26 = [v25 buildIdentifier];
  objc_super v27 = [v25 pairingIdentifier];
  id v28 = v26;
  id v70 = 0;
  id v29 = v27;
  v30 = -[HDPeriodicCountryMonitor _lastActivePairedBuildIdentifiersDomain](v6);
  v31 = [v30 stringForKey:v29 error:&v70];

  id v32 = v70;
  v33 = v32;
  if (!v31 && v32)
  {
    _HKInitializeLogging();
    v34 = HKLogInfrastructure();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v58 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v58;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v33;
      id v59 = v58;
      _os_log_error_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_ERROR, "[%{public}@] Error attempting to read last active paired build identifier: %{public}@", buf, 0x16u);
    }
    goto LABEL_28;
  }
  if (v31)
  {
    int v35 = [v31 isEqualToString:v28];

    if (v35)
    {
LABEL_28:
      _HKInitializeLogging();
      v36 = HKLogInfrastructure();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v37;
        id v38 = v37;
        _os_log_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping fetch as we've already fetched for this paired build configuration", buf, 0xCu);
      }
      -[HDPeriodicCountryMonitor _lock_enterStateIfPossible:](*(void *)(a1 + 32), 0);
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48));
      uint64_t v21 = *(void *)(a1 + 40);
      v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = @"Background check already performed on this build configuration";
      uint64_t v24 = 130;
      goto LABEL_31;
    }
  }
  else
  {
  }
LABEL_7:
  int v7 = -[HDPeriodicCountryMonitor _lock_enterStateIfPossible:](*(void *)(a1 + 32), 4);
  _HKInitializeLogging();
  int v8 = HKLogInfrastructure();
  id v9 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v56 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v56;
      id v57 = v56;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to enter fetching state", buf, 0xCu);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48));
    uint64_t v21 = *(void *)(a1 + 40);
    v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = @"A fetch is already in progress";
    uint64_t v24 = 100;
LABEL_31:
    v39 = objc_msgSend(v22, "hk_error:description:", v24, v23);
    (*(void (**)(uint64_t, void, void, void *))(v21 + 16))(v21, 0, 0, v39);
    goto LABEL_32;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v10;
    id v11 = v10;
    _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetching country code during maintenance operation", buf, 0xCu);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48));
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v66 = __64__HDPeriodicCountryMonitor__fetchCountryIfNeededWithCompletion___block_invoke_317;
  v67 = &unk_1E62F48D8;
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v68 = v13;
  if (v12)
  {
    id v14 = v65;
    os_unfair_lock_lock((os_unfair_lock_t)(v12 + 48));
    if (*(void *)(v12 + 56) != 4)
    {
      v62 = [MEMORY[0x1E4F28B00] currentHandler];
      [v62 handleFailureInMethod:sel__fetchCountryCodeWithCompletion_ object:v12 file:@"HDPeriodicCountryMonitor.m" lineNumber:461 description:@"Must be in the fetching state"];
    }
    uint64_t v15 = (*(void (**)(void))(*(void *)(v12 + 32) + 16))();
    v16 = *(void **)(v12 + 72);
    *(void *)(v12 + 72) = v15;

    os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 48));
    __int16 v17 = [*(id *)(v12 + 72) currentEstimate];
    if (v17)
    {
      v64 = 0;
    }
    else
    {
      _HKInitializeLogging();
      v40 = HKLogInfrastructure();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v60 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v60;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = 0;
        id v61 = v60;
        _os_log_error_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_ERROR, "[%{public}@] Error fetching mobile country code: %{public}@", buf, 0x16u);
      }
      v64 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 109, @"Unexpectedly did not receive a countryCode");
    }
    id v41 = v17;
    os_unfair_lock_lock((os_unfair_lock_t)(v12 + 48));
    if (*(void *)(v12 + 56) != 4)
    {
      v63 = [MEMORY[0x1E4F28B00] currentHandler];
      [v63 handleFailureInMethod:sel__processCountryCodeResult_ object:v12 file:@"HDPeriodicCountryMonitor.m" lineNumber:482 description:@"Must be in the fetching state"];
    }
    v42 = *(void **)(v12 + 72);
    *(void *)(v12 + 72) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 48));
    if (v17)
    {
      uint64_t v43 = [v41 provenance];
      v44 = *(NSObject **)(v12 + 80);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __54__HDPeriodicCountryMonitor__processCountryCodeResult___block_invoke;
      v72 = &unk_1E62F4978;
      uint64_t v73 = v12;
      id v74 = v41;
      uint64_t v75 = v43;
      dispatch_async(v44, buf);
      [(id)v12 _recordSuccessfulFetchForCurrentPairedBuilds];
    }
    v45 = *(void **)(v12 + 88);
    v46 = v14;
    if (v45)
    {
      id v47 = v45;
    }
    else
    {
      id v47 = [MEMORY[0x1E4F1C9C8] date];
    }
    id v48 = v47;
    os_unfair_lock_lock((os_unfair_lock_t)(v12 + 48));
    [*(id *)(v12 + 24) setObject:v48 forKey:@"HDPeriodicCountryMonitor_LastFetchAttemptDate"];

    v49 = *(void **)(v12 + 24);
    id WeakRetained = objc_loadWeakRetained((id *)(v12 + 8));
    v51 = [WeakRetained healthDaemon];
    v52 = [v51 behavior];
    v53 = [v52 currentOSBuild];
    [v49 setObject:v53 forKey:@"HDPeriodicCountryMonitor_LastFetchAttemptBuild"];

    os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 48));
    os_unfair_lock_lock((os_unfair_lock_t)(v12 + 48));
    -[HDPeriodicCountryMonitor _lock_enterStateIfPossible:](v12, 0);
    os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 48));

    v54 = [v41 ISOCode];
    uint64_t v55 = [v41 provenance];
    ((void (*)(void *, void *, uint64_t, void *))v66)(v46, v54, v55, v64);

    v39 = v68;
  }
  else
  {
    v39 = v13;
  }
LABEL_32:
}

uint64_t __64__HDPeriodicCountryMonitor__fetchCountryIfNeededWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEligibleForFetchByPeriodicCountryMonitor:*(void *)(a1 + 32)];
}

uint64_t __64__HDPeriodicCountryMonitor__fetchCountryIfNeededWithCompletion___block_invoke_317(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54__HDPeriodicCountryMonitor__processCountryCodeResult___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = HKLogInfrastructure();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    char v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    id v5 = v3;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observers of country code: %@", buf, 0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(void **)(v6 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__HDPeriodicCountryMonitor__processCountryCodeResult___block_invoke_333;
  v10[3] = &unk_1E62F4950;
  v10[4] = v6;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v11 = v8;
  uint64_t v12 = v9;
  [v7 notifyObservers:v10];
}

void __54__HDPeriodicCountryMonitor__processCountryCodeResult___block_invoke_333(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v4 ISOCode];
  [v5 periodicCountryMonitor:v3 didFetchISOCountryCode:v6 countryCodeProvenance:a1[6]];
}

- (id)diagnosticDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v4 = v3;
  unint64_t v5 = self->_state - 1;
  if (v5 > 3) {
    id v6 = @"WaitingForPairingChanges";
  }
  else {
    id v6 = off_1E62F4998[v5];
  }
  [v3 appendFormat:@"Current State: %@\n", v6];
  int v7 = [(HDPeriodicCountryMonitor *)self lastCheckAttemptDate];
  [v4 appendFormat:@"Last Ran: %@\n", v7];

  id v8 = [(HDPeriodicCountryMonitor *)self lastFetchAttemptDate];
  [v4 appendFormat:@"Last Fetched: %@\n", v8];

  uint64_t v9 = [(HDPeriodicCountryMonitor *)self lastFetchAttemptBuild];
  [v4 appendFormat:@"Last Build: %@\n", v9];

  __int16 v10 = (void *)[v4 copy];

  return v10;
}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (NSDate)unitTest_currentDate
{
  return self->_unitTest_currentDate;
}

- (void)setUnitTest_currentDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTest_currentDate, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_countryCodeManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_countryCodeProvider, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_nanoSyncManager, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end