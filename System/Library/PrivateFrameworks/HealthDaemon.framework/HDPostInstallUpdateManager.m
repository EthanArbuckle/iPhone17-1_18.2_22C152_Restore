@interface HDPostInstallUpdateManager
- (HDDaemon)daemon;
- (HDPostInstallUpdateManager)initWithDaemon:(id)a3;
- (void)_monitoringQueue_stopMonitoringForDeferral;
- (void)_triggerMigrationForProfile:(void *)a1 protected:(char)a2 completion:(void *)a3;
- (void)registerUpdateTaskHandler:(id)a3 queue:(id)a4;
- (void)start;
- (void)unregisterUpdateTaskHandler:(id)a3;
@end

@implementation HDPostInstallUpdateManager

- (HDPostInstallUpdateManager)initWithDaemon:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDPostInstallUpdateManager;
  v5 = [(HDPostInstallUpdateManager *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    monitoringQueue = v6->_monitoringQueue;
    v6->_monitoringQueue = (OS_dispatch_queue *)v7;

    id v9 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v10 = HKLogInfrastructure();
    uint64_t v11 = [v9 initWithName:@"post-install-update-handlers" loggingCategory:v10];
    observers = v6->_observers;
    v6->_observers = (HKObserverSet *)v11;
  }
  return v6;
}

- (void)start
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F142A8], 1);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14318], 1);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14308], 1);
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__HDPostInstallUpdateManager_start__block_invoke;
  v4[3] = &unk_1E62FB408;
  objc_copyWeak(&v5, &location);
  xpc_activity_register("com.apple.healthd.post-install-update", empty, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __35__HDPostInstallUpdateManager_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1C187C0E0]();
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = (_xpc_activity_s *)v3;
  uint64_t v7 = v6;
  v54 = v6;
  if (WeakRetained)
  {
    xpc_activity_state_t state = xpc_activity_get_state(v6);
    if (state == 2)
    {
      v12 = v54;
      _HKInitializeLogging();
      v13 = HKLogInfrastructure();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = objc_loadWeakRetained((id *)WeakRetained + 4);
        v15 = [v14 behavior];
        v16 = [v15 currentOSBuild];
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v16;
        _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "Updated to %{public}@; performing post-install update tasks.",
          (uint8_t *)&buf,
          0xCu);
      }
      id v17 = objc_alloc_init(MEMORY[0x1E4F65D90]);
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke;
      v71[3] = &unk_1E6300198;
      v71[4] = WeakRetained;
      v18 = v12;
      v72 = v18;
      [v17 setDidFinish:v71];
      v19 = (id *)(WeakRetained + 32);
      id v20 = objc_loadWeakRetained((id *)WeakRetained + 4);
      v21 = [v20 behavior];
      char v22 = [v21 isDeviceSupported];

      if (v22)
      {
        v53 = v4;
        [v17 beginTask];
        [v17 beginTask];
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_286;
        v69[3] = &unk_1E62F3208;
        id v55 = v17;
        id v70 = v55;
        v23 = v69;
        id v24 = objc_loadWeakRetained((id *)WeakRetained + 4);
        v25 = [v24 primaryProfile];
        v26 = [v25 medicalIDDataManager];
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v74 = __76__HDPostInstallUpdateManager__migrateEmergencySOSIfNecessaryWithCompletion___block_invoke;
        v75 = &unk_1E62F29A0;
        v27 = v23;
        id v76 = v27;
        [v26 runEmergencyContactConsolidationWithCompletion:&buf];

        v52 = v18;
        v28 = v18;
        dispatch_assert_queue_not_V2(*((dispatch_queue_t *)WeakRetained + 2));
        v29 = *((void *)WeakRetained + 2);
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v74 = __69__HDPostInstallUpdateManager__startMonitoringForDeferralForActivity___block_invoke;
        v75 = &unk_1E62F31C0;
        id v76 = WeakRetained;
        v30 = v28;
        v77 = v30;
        dispatch_sync(v29, &buf);

        id v31 = objc_loadWeakRetained(v19);
        v32 = [v31 primaryProfile];
        v33 = [v32 medicalIDDataManager];
        *(void *)&long long v65 = 0;
        v34 = [v33 fetchMedicalIDWithError:&v65];
        id v35 = (id)v65;

        if (!v34)
        {
          if (v35)
          {
            _HKInitializeLogging();
            v36 = *MEMORY[0x1E4F29F18];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(void *)((char *)&buf + 4) = v35;
              _os_log_error_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_ERROR, "Failed to fetch MedicalID during database migration with error %{public}@", (uint8_t *)&buf, 0xCu);
            }
          }
        }

        id v37 = objc_loadWeakRetained(v19);
        v38 = [v37 profileManager];

        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        v39 = [v38 allProfileIdentifiers];
        uint64_t v40 = [v39 countByEnumeratingWithState:&v65 objects:&buf count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v66;
          do
          {
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v66 != v42) {
                objc_enumerationMutation(v39);
              }
              v44 = [v38 profileForIdentifier:*(void *)(*((void *)&v65 + 1) + 8 * i)];
              if (v44)
              {
                [v55 beginTask];
                v63[0] = MEMORY[0x1E4F143A8];
                v63[1] = 3221225472;
                v63[2] = __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_2;
                v63[3] = &unk_1E62F3208;
                id v45 = v55;
                id v64 = v45;
                -[HDPostInstallUpdateManager _triggerMigrationForProfile:protected:completion:](v44, 0, v63);
                [v45 beginTask];
                v61[0] = MEMORY[0x1E4F143A8];
                v61[1] = 3221225472;
                v61[2] = __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_3;
                v61[3] = &unk_1E62F3208;
                id v62 = v45;
                -[HDPostInstallUpdateManager _triggerMigrationForProfile:protected:completion:](v44, 1, v61);
              }
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v65 objects:&buf count:16];
          }
          while (v41);
        }

        [v55 beginTask];
        v46 = dispatch_group_create();
        v47 = (void *)*((void *)WeakRetained + 3);
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_4;
        v58[3] = &unk_1E63001C0;
        id v48 = v55;
        id v59 = v48;
        v60 = WeakRetained;
        [v47 notifyObserversInGroup:v46 handler:v58];
        v49 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_290;
        block[3] = &unk_1E62F3208;
        id v50 = v48;
        id v57 = v50;
        dispatch_group_notify(v46, v49, block);

        [v50 finishTask];
        id v4 = v53;
        v18 = v52;
      }
      else
      {
        _HKInitializeLogging();
        v51 = *MEMORY[0x1E4F29F28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1BCB7D000, v51, OS_LOG_TYPE_DEFAULT, "Current device is not supported; skipping post-install update since profiles are not available.",
            (uint8_t *)&buf,
            2u);
        }
        [v17 beginTask];
        [v17 finishTask];
      }

      goto LABEL_29;
    }
    uint64_t v7 = v54;
    if (!state)
    {
      _HKInitializeLogging();
      id v9 = HKLogInfrastructure();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

      uint64_t v7 = v54;
      if (v10)
      {
        uint64_t v11 = HKLogInfrastructure();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_INFO, "Checking in for post-install update handler.", (uint8_t *)&buf, 2u);
        }

LABEL_29:
        uint64_t v7 = v54;
      }
    }
  }
}

- (void)_monitoringQueue_stopMonitoringForDeferral
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    v2 = *(NSObject **)(a1 + 8);
    if (v2)
    {
      dispatch_source_cancel(v2);
      id v3 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = 0;
    }
  }
}

void __69__HDPostInstallUpdateManager__startMonitoringForDeferralForActivity___block_invoke(uint64_t a1)
{
  -[HDPostInstallUpdateManager _monitoringQueue_stopMonitoringForDeferral](*(void *)(a1 + 32));
  dispatch_source_t v2 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__HDPostInstallUpdateManager__startMonitoringForDeferralForActivity___block_invoke_2;
  v10[3] = &unk_1E62F31C0;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  dispatch_source_set_event_handler(v5, v10);
  v8 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  dispatch_time_t v9 = dispatch_walltime(0, 1000000000);
  dispatch_source_set_timer(v8, v9, 0x3B9ACA00uLL, 0x1DCD6500uLL);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
}

void __69__HDPostInstallUpdateManager__startMonitoringForDeferralForActivity___block_invoke_2(uint64_t a1)
{
  xpc_activity_state_t state = xpc_activity_get_state(*(xpc_activity_t *)(a1 + 32));
  if (state != 4)
  {
    if (state == 3)
    {
      _HKInitializeLogging();
      uint64_t v3 = HKLogInfrastructure();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "Post-install update activity requested deferal. Completing activity.", v5, 2u);
      }

      xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
      -[HDPostInstallUpdateManager _monitoringQueue_stopMonitoringForDeferral](*(void *)(a1 + 40));
    }
    else
    {
      uint64_t v4 = *(void *)(a1 + 40);
      -[HDPostInstallUpdateManager _monitoringQueue_stopMonitoringForDeferral](v4);
    }
  }
}

void __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  dispatch_source_t v2 = HKLogInfrastructure();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    uint64_t v4 = [WeakRetained behavior];
    id v5 = [v4 currentOSBuild];
    *(_DWORD *)long long buf = 138543362;
    id v11 = v5;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "Finished post-install update tasks after updating to %{public}@.", buf, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_284;
  block[3] = &unk_1E62F3208;
  void block[4] = v6;
  dispatch_async(v7, block);
  if (xpc_activity_get_state(*(xpc_activity_t *)(a1 + 40)) == 4
    && !xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
  {
    _HKInitializeLogging();
    v8 = HKLogInfrastructure();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "Failed to update XPC activity state after completing post-install update.", buf, 2u);
    }
  }
}

void __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_284(uint64_t a1)
{
}

uint64_t __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_286(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishTask];
}

uint64_t __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishTask];
}

- (void)_triggerMigrationForProfile:(void *)a1 protected:(char)a2 completion:(void *)a3
{
  id v5 = a1;
  id v6 = a3;
  uint64_t v7 = [v5 database];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__HDPostInstallUpdateManager__triggerMigrationForProfile_protected_completion___block_invoke;
  v10[3] = &unk_1E62F61F8;
  char v13 = a2;
  id v8 = v5;
  id v11 = v8;
  id v9 = v6;
  id v12 = v9;
  [v7 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:0 block:v10];
}

uint64_t __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishTask];
}

void __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) beginTask];
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "Notifying %{public}@ for post-install update", buf, 0xCu);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_287;
  v7[3] = &unk_1E62F5D48;
  id v8 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v6 = v3;
  [v6 performPostInstallUpdateTaskForManager:v5 completion:v7];
}

void __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_287(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29F28];
  uint64_t v7 = *MEMORY[0x1E4F29F28];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138543362;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "Received successful post-install update completion from %{public}@.", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138543618;
    uint64_t v11 = v9;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Post install update failed for %{public}@: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  [*(id *)(a1 + 40) finishTask];
}

uint64_t __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_290(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishTask];
}

void __79__HDPostInstallUpdateManager__triggerMigrationForProfile_protected_completion___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48)) {
    dispatch_source_t v2 = @"protected";
  }
  else {
    dispatch_source_t v2 = @"unprotected";
  }
  id v3 = v2;
  _HKInitializeLogging();
  uint64_t v4 = (void **)MEMORY[0x1E4F29F28];
  id v5 = (void *)*MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = v5;
    uint64_t v8 = [v6 profileIdentifier];
    *(_DWORD *)long long buf = 138543618;
    v21 = v3;
    __int16 v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "Performing %{public}@ Health database migration for %{public}@...", buf, 0x16u);
  }
  if (*(unsigned char *)(a1 + 48)) {
    +[HDDatabaseTransactionContext contextForWritingProtectedData];
  }
  else {
  uint64_t v9 = +[HDDatabaseTransactionContext contextForWriting];
  }
  int v10 = [*(id *)(a1 + 32) database];
  id v19 = 0;
  int v11 = [v10 performTransactionWithContext:v9 error:&v19 block:&__block_literal_global_98 inaccessibilityHandler:0];
  id v12 = v19;

  _HKInitializeLogging();
  id v13 = *v4;
  uint64_t v14 = *v4;
  if (!v11)
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    v18 = *(void **)(a1 + 32);
    v16 = v13;
    id v17 = [v18 profileIdentifier];
    *(_DWORD *)long long buf = 138543874;
    v21 = v3;
    __int16 v22 = 2114;
    v23 = v17;
    __int16 v24 = 2114;
    id v25 = v12;
    _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "Failed %{public}@ Health database migration for %{public}@: %{public}@", buf, 0x20u);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(void **)(a1 + 32);
    v16 = v13;
    id v17 = [v15 profileIdentifier];
    *(_DWORD *)long long buf = 138543618;
    v21 = v3;
    __int16 v22 = 2114;
    v23 = v17;
    _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "Finished %{public}@ Health database migration for %{public}@.", buf, 0x16u);
LABEL_12:
  }
LABEL_14:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __79__HDPostInstallUpdateManager__triggerMigrationForProfile_protected_completion___block_invoke_298()
{
  return 1;
}

void __76__HDPostInstallUpdateManager__migrateEmergencySOSIfNecessaryWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29F58];
  uint64_t v7 = *MEMORY[0x1E4F29F58];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "Migrated Emergency SOS completed successfully", (uint8_t *)&v8, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Migration for Emergency SOS failed: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerUpdateTaskHandler:(id)a3 queue:(id)a4
{
}

- (void)unregisterUpdateTaskHandler:(id)a3
{
}

- (HDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);

  return (HDDaemon *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_monitoringQueue, 0);

  objc_storeStrong((id *)&self->_activityPollSource, 0);
}

@end