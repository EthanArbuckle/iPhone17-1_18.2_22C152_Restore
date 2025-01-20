@interface HDHeadphoneDoseManager
- (BOOL)_lock_rebuildWithAssertion:(id)a3 error:(id *)a4;
- (BOOL)_lock_rebuildWithAssertion:(id)a3 resetSyncNotification:(BOOL)a4 error:(id *)a5;
- (BOOL)_lock_updateCurrentDoseUsingStatisticsResult:(id)a3 assertion:(id)a4 error:(id *)a5;
- (BOOL)_overrideDoseLimit:(id)a3 error:(id *)a4;
- (BOOL)_rebuildWithError:(id *)a3;
- (HDHeadphoneAudioExposureStatisticsCalculator)unitTesting_calculator;
- (HDHeadphoneDoseManager)initWithProfile:(id)a3;
- (HDHeadphoneDoseMetadataStore)unitTesting_keyValueStore;
- (id)_fetchDoseLimitInfoWithError:(id *)a3;
- (id)_infoDictWithError:(id *)a3;
- (id)_infoWithError:(id *)a3;
- (id)_initWithProfile:(id)a3 keyValueStore:(id)a4 calculator:(id)a5;
- (id)_initWithProfile:(id)a3 keyValueStore:(id)a4 calculator:(id)a5 unitTesting_didUpdateHandler:(id)a6;
- (id)_initWithProfile:(id)a3 keyValueStore:(id)a4 calculator:(id)a5 unitTesting_profileDidBecomeReadyHandler:(id)a6 unitTesting_didObserveProtectedDataHandler:(id)a7 unitTesting_didUpdateHandler:(id)a8;
- (id)_lock_pruneWithNowDate:(id)a3 limit:(unint64_t)a4 error:(id *)a5;
- (id)_pruneWithNowDate:(id)a3 limit:(unint64_t)a4 error:(id *)a5;
- (id)_takeAccessibilityAssertion;
- (id)transactionalQuantityInsertHandlerForProfile:(id)a3 journaled:(BOOL)a4 count:(int64_t)a5;
- (id)unitTesting_didFinishResetDosageToFireDate;
- (id)unitTesting_didNotifyUser;
- (id)unitTesting_didObserveProtectedDataHandler;
- (id)unitTesting_didUpdateHandler;
- (id)unitTesting_profileDidBecomeReadyHandler;
- (id)unitTesting_protectedDataDidBecomeAvailable;
- (id)unitTesting_updateCurrentDoseNowDateProvider;
- (void)_handleSignificantTimeChangeNotification:(id)a3;
- (void)_headphoneExposureNotificationsEnabledDidChange:(id)a3;
- (void)_lock_setCollectionAssertion:(id)a3;
- (void)_lock_updateCollectionAssertionForDoseAccumulated:(double)a3;
- (void)_lock_updateIsEnabledForInitialSetup:(BOOL)a3 assertion:(id)a4;
- (void)_lock_updateWithNotifications:(id)a3 journaled:(BOOL)a4 assertion:(id)a5;
- (void)_lock_updateWithRemoteNotificationDismissalDate:(id)a3 assertion:(id)a4;
- (void)_registerForSignificantTimeChangeNotification;
- (void)_reportSyncedHeadphoneNotificationSamples:(id)a3 journaled:(BOOL)a4 nowDate:(id)a5;
- (void)_takeAccessibilityAssertion;
- (void)_unregisterForSignificantTimeChangeNotification;
- (void)_updateCurrentDoseFromResult:(id)a3 context:(id)a4 sampleCount:(unint64_t)a5 assertion:(id)a6;
- (void)_updateWithRemoteNotificationDismissalDate:(id)a3 assertion:(id)a4;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)didReceiveResetDosageToFireDate:(id)a3;
- (void)profile:(id)a3 didDiscardSeriesOfType:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)samplesJournaled:(id)a3 type:(id)a4;
- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4;
- (void)setUnitTesting_didFinishResetDosageToFireDate:(id)a3;
- (void)setUnitTesting_didNotifyUser:(id)a3;
- (void)setUnitTesting_didObserveProtectedDataHandler:(id)a3;
- (void)setUnitTesting_didUpdateHandler:(id)a3;
- (void)setUnitTesting_profileDidBecomeReadyHandler:(id)a3;
- (void)setUnitTesting_protectedDataDidBecomeAvailable:(id)a3;
- (void)setUnitTesting_updateCurrentDoseNowDateProvider:(id)a3;
- (void)unitTesting_didReceiveResetDosageToFireDate:(id)a3;
@end

@implementation HDHeadphoneDoseManager

- (HDHeadphoneDoseManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v5 = [[HDHeadphoneDoseMetadataStore alloc] initWithProfile:v4];
  v6 = [[HDHeadphoneAudioExposureStatisticsCalculator alloc] initWithProfile:v4 keyValueStore:v5];
  v7 = [(HDHeadphoneDoseManager *)self _initWithProfile:v4 keyValueStore:v5 calculator:v6];

  return v7;
}

- (id)_initWithProfile:(id)a3 keyValueStore:(id)a4 calculator:(id)a5
{
  return [(HDHeadphoneDoseManager *)self _initWithProfile:a3 keyValueStore:a4 calculator:a5 unitTesting_didUpdateHandler:0];
}

- (id)_initWithProfile:(id)a3 keyValueStore:(id)a4 calculator:(id)a5 unitTesting_didUpdateHandler:(id)a6
{
  return [(HDHeadphoneDoseManager *)self _initWithProfile:a3 keyValueStore:a4 calculator:a5 unitTesting_profileDidBecomeReadyHandler:0 unitTesting_didObserveProtectedDataHandler:0 unitTesting_didUpdateHandler:a6];
}

- (id)_initWithProfile:(id)a3 keyValueStore:(id)a4 calculator:(id)a5 unitTesting_profileDidBecomeReadyHandler:(id)a6 unitTesting_didObserveProtectedDataHandler:(id)a7 unitTesting_didUpdateHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id obj = a5;
  id v51 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = [v14 profileIdentifier];
  v20 = [v15 _profileIdentifier];
  LOBYTE(a7) = [v19 isEqual:v20];

  if ((a7 & 1) == 0)
  {
    v48 = [MEMORY[0x263F08690] currentHandler];
    [v48 handleFailureInMethod:a2, self, @"HDHeadphoneDoseManager.m", 94, @"Invalid parameter not satisfying: %@", @"[profile.profileIdentifier isEqual:keyValueStore._profileIdentifier]" object file lineNumber description];
  }
  v52.receiver = self;
  v52.super_class = (Class)HDHeadphoneDoseManager;
  v21 = [(HDHeadphoneDoseManager *)&v52 init];
  v22 = v21;
  if (v21)
  {
    objc_storeWeak((id *)&v21->_profile, v14);
    v22->_dose = -1.0;
    v22->_lock._os_unfair_lock_opaque = 0;
    uint64_t v23 = HKCreateSerialDispatchQueue();
    queue = v22->_queue;
    v22->_queue = (OS_dispatch_queue *)v23;

    v22->_enabled = [MEMORY[0x263F44978] isHeadphoneExposureNotificationsEnabled];
    objc_storeStrong((id *)&v22->_keyValueStore, a4);
    v25 = [[HDHeadphoneExposureNotificationSyncManager alloc] initWithProfile:v14];
    notificationSyncManager = v22->_notificationSyncManager;
    v22->_notificationSyncManager = v25;

    v27 = [[HDHeadphoneExposureNotificationCenter alloc] initWithProfile:v14 syncManager:v22->_notificationSyncManager];
    notificationCenter = v22->_notificationCenter;
    v22->_notificationCenter = v27;

    objc_storeStrong((id *)&v22->_statisticsCalculator, obj);
    collectionAssertion = v22->_collectionAssertion;
    v22->_collectionAssertion = 0;

    uint64_t v30 = MEMORY[0x22A647340](v16);
    id unitTesting_profileDidBecomeReadyHandler = v22->_unitTesting_profileDidBecomeReadyHandler;
    v22->_id unitTesting_profileDidBecomeReadyHandler = (id)v30;

    uint64_t v32 = MEMORY[0x22A647340](v17);
    id unitTesting_didObserveProtectedDataHandler = v22->_unitTesting_didObserveProtectedDataHandler;
    v22->_id unitTesting_didObserveProtectedDataHandler = (id)v32;

    uint64_t v34 = MEMORY[0x22A647340](v18);
    id unitTesting_didUpdateHandler = v22->_unitTesting_didUpdateHandler;
    v22->_id unitTesting_didUpdateHandler = (id)v34;

    lastLockDateForAnalytics = v22->_lastLockDateForAnalytics;
    v22->_lastLockDateForAnalytics = 0;

    [(HDHeadphoneDoseManager *)v22 _registerForSignificantTimeChangeNotification];
    id WeakRetained = objc_loadWeakRetained((id *)&v22->_profile);
    v38 = [WeakRetained dataManager];
    v39 = HKHeadphoneAudioExposureEventType();
    [v38 addObserver:v22 forDataType:v39];

    id v40 = objc_loadWeakRetained((id *)&v22->_profile);
    v41 = [v40 dataManager];
    v42 = [v41 quantitySeriesManager];
    HKHeadphoneAudioExposureType();
    v44 = id v43 = v16;
    [v42 addObserver:v22 forType:v44 queue:v22->_queue];

    id v16 = v43;
    id v45 = objc_loadWeakRetained((id *)&v22->_profile);
    [v45 registerProfileReadyObserver:v22 queue:v22->_queue];

    [(HDHeadphoneExposureNotificationSyncManager *)v22->_notificationSyncManager addObserver:v22 queue:v22->_queue];
    v46 = v22;
  }

  return v22;
}

- (void)dealloc
{
  [(HDHeadphoneDoseManager *)self _unregisterForSignificantTimeChangeNotification];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained database];
  [v4 removeProtectedDataObserver:self];

  id v5 = objc_loadWeakRetained((id *)&self->_profile);
  v6 = [v5 dataManager];
  v7 = HKHeadphoneAudioExposureEventType();
  [v6 removeObserver:self forDataType:v7];

  id v8 = objc_loadWeakRetained((id *)&self->_profile);
  v9 = [v8 dataManager];
  v10 = [v9 quantitySeriesManager];
  v11 = HKHeadphoneAudioExposureType();
  [v10 removeObserver:self forType:v11];

  [(HDHeadphoneExposureNotificationSyncManager *)self->_notificationSyncManager removeObserver:self];
  [(HDDataCollectionAssertion *)self->_collectionAssertion invalidate];
  v12.receiver = self;
  v12.super_class = (Class)HDHeadphoneDoseManager;
  [(HDHeadphoneDoseManager *)&v12 dealloc];
}

- (void)profileDidBecomeReady:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class();
    id v6 = v13;
    _os_log_impl(&dword_22615C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Profile ready; Dispatch setup to maintenance queue.",
      buf,
      0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = [WeakRetained database];
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__HDHeadphoneDoseManager_profileDidBecomeReady___block_invoke;
  v11[3] = &unk_264795D40;
  v11[4] = self;
  [v8 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:queue block:v11];

  id unitTesting_profileDidBecomeReadyHandler = (void (**)(id, HDHeadphoneDoseManager *))self->_unitTesting_profileDidBecomeReadyHandler;
  if (unitTesting_profileDidBecomeReadyHandler) {
    unitTesting_profileDidBecomeReadyHandler[2](unitTesting_profileDidBecomeReadyHandler, self);
  }
}

void __48__HDHeadphoneDoseManager_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 32));
  id v6 = [*(id *)(a1 + 32) _takeAccessibilityAssertion];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__headphoneExposureNotificationsEnabledDidChange_ name:*MEMORY[0x263F44958] object:0];

  [MEMORY[0x263F44978] startObservingForChanges];
  objc_msgSend(*(id *)(a1 + 32), "_lock_updateIsEnabledForInitialSetup:assertion:", 1, v6);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v4 = [WeakRetained database];
  [v4 addProtectedDataObserver:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 32)];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  [v6 invalidate];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 120);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v45 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  id v6 = (os_log_t *)MEMORY[0x263F09910];
  v7 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    uint64_t v9 = objc_opt_class();
    v10 = HKStringFromBool();
    *(_DWORD *)buf = 138543618;
    uint64_t v42 = v9;
    __int16 v43 = 2114;
    v44 = v10;
    _os_log_impl(&dword_22615C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Protected data available: %{public}@.", buf, 0x16u);
  }
  if (!v4)
  {
    os_unfair_lock_lock(&self->_lock);
    id v15 = [MEMORY[0x263EFF910] now];
    lastLockDateForAnalytics = self->_lastLockDateForAnalytics;
    self->_lastLockDateForAnalytics = v15;

    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_29;
  }
  v11 = [(HDHeadphoneDoseManager *)self _takeAccessibilityAssertion];
  os_unfair_lock_lock(&self->_lock);
  BOOL v12 = [(HDHeadphoneAudioExposureStatisticsCalculator *)self->_statisticsCalculator needsRebuild];
  LOBYTE(v13) = v12;
  if (self->_enabled)
  {
    if (v12)
    {
      id v14 = 0;
      goto LABEL_20;
    }
    keyValueStore = self->_keyValueStore;
    id v40 = 0;
    BOOL v21 = [(HDHeadphoneDoseMetadataStore *)keyValueStore _shouldRebuildPreviousSevenDayNotificationWithError:&v40];
    id v22 = v40;
    id v14 = v22;
    if (v22)
    {
      int v23 = objc_msgSend(v22, "hk_isHealthStoreUnavailableError");
      _HKInitializeLogging();
      v24 = *v6;
      if (v23)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          -[HDHeadphoneDoseManager database:protectedDataDidBecomeAvailable:].cold.5();
          if (v21) {
            goto LABEL_20;
          }
LABEL_33:

          uint64_t v34 = self->_keyValueStore;
          id v39 = 0;
          BOOL v13 = [(HDHeadphoneDoseMetadataStore *)v34 _shouldRebuildSevenDayStatisticsWithError:&v39];
          id v35 = v39;
          id v14 = v35;
          if (v35)
          {
            int v36 = objc_msgSend(v35, "hk_isHealthStoreUnavailableError");
            _HKInitializeLogging();
            v37 = *v6;
            if (v36)
            {
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
                -[HDHeadphoneDoseManager database:protectedDataDidBecomeAvailable:]();
              }
            }
            else if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
            {
              -[HDHeadphoneDoseManager database:protectedDataDidBecomeAvailable:].cold.4();
            }
            goto LABEL_11;
          }
          if (!v13) {
            goto LABEL_28;
          }
LABEL_20:
          v25 = v14;
          id v38 = v14;
          BOOL v26 = [(HDHeadphoneDoseManager *)self _lock_rebuildWithAssertion:v11 error:&v38];
          id v14 = v38;

          if (v26)
          {
            _HKInitializeLogging();
            os_log_t v27 = *v6;
            if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
            {
              v28 = v27;
              uint64_t v29 = objc_opt_class();
              *(_DWORD *)buf = 138543362;
              uint64_t v42 = v29;
              _os_log_impl(&dword_22615C000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] Succesfully rebuilt 7-Day HAEN dose after device unlock.", buf, 0xCu);
            }
          }
          else
          {
            int v30 = objc_msgSend(v14, "hearing_isExpectedError");
            _HKInitializeLogging();
            v31 = *v6;
            if (v30)
            {
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
                -[HDHeadphoneDoseManager database:protectedDataDidBecomeAvailable:]();
              }
            }
            else if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
            {
              -[HDHeadphoneDoseManager database:protectedDataDidBecomeAvailable:]();
            }
          }
          goto LABEL_28;
        }
      }
      else if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        -[HDHeadphoneDoseManager database:protectedDataDidBecomeAvailable:].cold.6();
        if (v21) {
          goto LABEL_20;
        }
        goto LABEL_33;
      }
    }
    if (v21) {
      goto LABEL_20;
    }
    goto LABEL_33;
  }
  _HKInitializeLogging();
  os_log_t v17 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = v17;
    uint64_t v19 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    uint64_t v42 = v19;
    _os_log_impl(&dword_22615C000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring protected data availability since HAEN is disabled.", buf, 0xCu);
  }
  id v14 = 0;
LABEL_11:
  if (v13) {
    goto LABEL_20;
  }
LABEL_28:
  [v11 invalidate];
  uint64_t v32 = self->_lastLockDateForAnalytics;
  self->_lastLockDateForAnalytics = 0;

  os_unfair_lock_unlock(&self->_lock);
LABEL_29:
  unitTesting_protectedDataDidBecomeAvailable = (void (**)(id, BOOL))self->_unitTesting_protectedDataDidBecomeAvailable;
  if (unitTesting_protectedDataDidBecomeAvailable) {
    unitTesting_protectedDataDidBecomeAvailable[2](unitTesting_protectedDataDidBecomeAvailable, v4);
  }
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = objc_opt_class();
    __int16 v14 = 2048;
    uint64_t v15 = [v5 count];
    _os_log_impl(&dword_22615C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processing %lu added HAEN samples.", buf, 0x16u);
  }
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__HDHeadphoneDoseManager_samplesAdded_anchor___block_invoke;
  v10[3] = &unk_264795D68;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(queue, v10);
}

void __46__HDHeadphoneDoseManager_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _takeAccessibilityAssertion];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 32), "_lock_updateWithNotifications:journaled:assertion:", *(void *)(a1 + 40), 0, v2);
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [MEMORY[0x263EFF910] now];
  [v3 _reportSyncedHeadphoneNotificationSamples:v4 journaled:0 nowDate:v5];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  [v2 invalidate];
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [*(id *)(a1 + 40) count];
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2048;
    uint64_t v13 = v9;
    _os_log_impl(&dword_22615C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processed added %lu HAEN samples.", (uint8_t *)&v10, 0x16u);
  }
}

- (void)samplesJournaled:(id)a3 type:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = objc_opt_class();
    __int16 v14 = 2048;
    uint64_t v15 = [v5 count];
    _os_log_impl(&dword_22615C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processing %lu journaled HAEN samples.", buf, 0x16u);
  }
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__HDHeadphoneDoseManager_samplesJournaled_type___block_invoke;
  v10[3] = &unk_264795D68;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(queue, v10);
}

void __48__HDHeadphoneDoseManager_samplesJournaled_type___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 32), "_lock_updateWithNotifications:journaled:assertion:", *(void *)(a1 + 40), 1, 0);
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [MEMORY[0x263EFF910] now];
  [v2 _reportSyncedHeadphoneNotificationSamples:v3 journaled:1 nowDate:v4];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = [*(id *)(a1 + 40) count];
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2048;
    uint64_t v12 = v8;
    _os_log_impl(&dword_22615C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processed %lu journaled HAEN samples.", (uint8_t *)&v9, 0x16u);
  }
}

- (void)_reportSyncedHeadphoneNotificationSamples:(id)a3 journaled:(BOOL)a4 nowDate:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v19 = a5;
  if (HKImproveHealthAndActivityAnalyticsAllowed())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    [WeakRetained profileType];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v18 = v7;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          __int16 v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (objc_msgSend(v14, "hk_isHearingSevenDayDoseNotification"))
            {
              uint64_t v15 = [v14 sourceRevision];
              uint64_t v16 = [v15 source];
              char v17 = [v16 _isLocalDevice];

              if ((v17 & 1) == 0)
              {
                id v20 = v19;
                AnalyticsSendEventLazy();
              }
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    id v7 = v18;
  }
}

id __86__HDHeadphoneDoseManager__reportSyncedHeadphoneNotificationSamples_journaled_nowDate___block_invoke(uint64_t a1)
{
  v13[3] = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  double v3 = v2;
  uint64_t v4 = [*(id *)(a1 + 40) endDate];
  [v4 timeIntervalSinceReferenceDate];
  double v6 = v3 - v5;

  v12[0] = @"notificationSyncDelta";
  id v7 = +[HDAudioAnalyticsUtilities boundedIntegerForSyncDelayDuration:v6];
  v13[0] = v7;
  v12[1] = @"journaled";
  uint64_t v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v13[1] = v8;
  v12[2] = @"primaryProfile";
  id v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 49)];
  v13[2] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  double v6 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = objc_opt_class();
    _os_log_impl(&dword_22615C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] HAEN samples were removed, requesting rebuild.", buf, 0xCu);
  }
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__HDHeadphoneDoseManager_samplesOfTypesWereRemoved_anchor___block_invoke;
  v10[3] = &unk_264795D68;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(queue, v10);
}

void __59__HDHeadphoneDoseManager_samplesOfTypesWereRemoved_anchor___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  double v2 = (os_unfair_lock_s **)(a1 + 32);
  double v3 = [*(id *)(a1 + 32) _takeAccessibilityAssertion];
  os_unfair_lock_lock(*v2 + 6);
  uint64_t v4 = *v2;
  if (LOBYTE((*v2)[10]._os_unfair_lock_opaque))
  {
    id v18 = 0;
    int v5 = [(os_unfair_lock_s *)v4 _lock_rebuildWithAssertion:v3 resetSyncNotification:1 error:&v18];
    id v6 = v18;
    id v7 = v6;
    if (v5)
    {
      _HKInitializeLogging();
      uint64_t v8 = (void *)*MEMORY[0x263F09910];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
      {
        id v9 = v8;
        uint64_t v10 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        uint64_t v20 = v10;
        _os_log_impl(&dword_22615C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Succesfully rebuilt 7-Day HAEN dose after discarding HAENs.", buf, 0xCu);
      }
    }
    else
    {
      int v15 = objc_msgSend(v6, "hearing_isExpectedError");
      _HKInitializeLogging();
      uint64_t v16 = (void *)*MEMORY[0x263F09910];
      char v17 = *MEMORY[0x263F09910];
      if (v15)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          __59__HDHeadphoneDoseManager_samplesOfTypesWereRemoved_anchor___block_invoke_cold_1((uint64_t)v2, v16);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        __59__HDHeadphoneDoseManager_samplesOfTypesWereRemoved_anchor___block_invoke_cold_2((uint64_t)v2, v16);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v11 = (void *)*MEMORY[0x263F09910];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v11;
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = [*(id *)(a1 + 40) count];
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v13;
      __int16 v21 = 2048;
      uint64_t v22 = v14;
      _os_log_impl(&dword_22615C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring %lu removed sampleTypes since HAEN is disabled.", buf, 0x16u);
    }
    id v7 = 0;
  }
  os_unfair_lock_unlock(*v2 + 6);
  [v3 invalidate];
}

- (void)profile:(id)a3 didDiscardSeriesOfType:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  int v5 = (os_log_t *)MEMORY[0x263F09910];
  id v6 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    *(_DWORD *)buf = 138543362;
    uint64_t v21 = objc_opt_class();
    _os_log_impl(&dword_22615C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] HAE samples were removed, requesting rebuild.", buf, 0xCu);
  }
  uint64_t v8 = [(HDHeadphoneDoseManager *)self _takeAccessibilityAssertion];
  os_unfair_lock_lock(&self->_lock);
  if (self->_enabled)
  {
    id v19 = 0;
    BOOL v9 = [(HDHeadphoneDoseManager *)self _lock_rebuildWithAssertion:v8 error:&v19];
    uint64_t v10 = v19;
    id v11 = v10;
    if (v9)
    {
      _HKInitializeLogging();
      os_log_t v12 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = v12;
        uint64_t v14 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        uint64_t v21 = v14;
        _os_log_impl(&dword_22615C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Succesfully rebuilt 7-Day HAEN dose after discarding HAE Series.", buf, 0xCu);
      }
    }
    else
    {
      int v17 = [v10 hearing_isExpectedError];
      _HKInitializeLogging();
      id v18 = *v5;
      if (v17)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[HDHeadphoneDoseManager profile:didDiscardSeriesOfType:]();
        }
      }
      else if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        -[HDHeadphoneDoseManager profile:didDiscardSeriesOfType:]();
      }
    }
    goto LABEL_14;
  }
  _HKInitializeLogging();
  os_log_t v15 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v15;
    uint64_t v16 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    uint64_t v21 = v16;
    _os_log_impl(&dword_22615C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring removed HAE Series since HAEN is disabled.", buf, 0xCu);
LABEL_14:
  }
  os_unfair_lock_unlock(&self->_lock);
  [v8 invalidate];
}

- (id)transactionalQuantityInsertHandlerForProfile:(id)a3 journaled:(BOOL)a4 count:(int64_t)a5
{
  BOOL v6 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (os_unfair_lock_trylock(&self->_lock))
  {
    BOOL enabled = self->_enabled;
    os_unfair_lock_unlock(&self->_lock);
    if (enabled)
    {
LABEL_3:
      _HKInitializeLogging();
      uint64_t v10 = (void *)*MEMORY[0x263F09910];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
      {
        id v11 = v10;
        uint64_t v12 = objc_opt_class();
        uint64_t v13 = @"added";
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v12;
        if (v6) {
          uint64_t v13 = @"journaled";
        }
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = a5;
        *(_WORD *)&buf[22] = 2114;
        uint64_t v29 = (uint64_t (*)(uint64_t, uint64_t))v13;
        _os_log_impl(&dword_22615C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Inserted %ld %{public}@ samples", buf, 0x20u);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      uint64_t v29 = __Block_byref_object_copy_;
      int v30 = __Block_byref_object_dispose_;
      id v31 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a5];
      if (v6)
      {
        uint64_t v14 = 0;
      }
      else
      {
        uint64_t v14 = [(HDHeadphoneDoseManager *)self _takeAccessibilityAssertion];
      }
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __87__HDHeadphoneDoseManager_transactionalQuantityInsertHandlerForProfile_journaled_count___block_invoke;
      v23[3] = &unk_264795DB8;
      v25 = buf;
      int64_t v26 = a5;
      BOOL v27 = v6;
      v23[4] = self;
      id v24 = v14;
      id v21 = v14;
      uint64_t v20 = (void *)MEMORY[0x22A647340](v23);

      _Block_object_dispose(buf, 8);
      goto LABEL_17;
    }
  }
  else if ([MEMORY[0x263F44978] isHeadphoneExposureNotificationsEnabled])
  {
    goto LABEL_3;
  }
  _HKInitializeLogging();
  os_log_t v15 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v15;
    int v17 = objc_opt_class();
    id v18 = @"added";
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v17;
    if (v6) {
      id v18 = @"journaled";
    }
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a5;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v29 = (uint64_t (*)(uint64_t, uint64_t))v18;
    id v19 = v17;
    _os_log_impl(&dword_22615C000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring %lu %{public}@ HAE sample(s) since HAEN Feature is disabled", buf, 0x20u);
  }
  uint64_t v20 = 0;
LABEL_17:

  return v20;
}

void __87__HDHeadphoneDoseManager_transactionalQuantityInsertHandlerForProfile_journaled_count___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, int a7)
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 32));
  id v18 = [v15 endDate];
  [v18 timeIntervalSinceNow];
  double v20 = v19;

  if (v20 >= -(608400.0 + 3600.0))
  {
    id v21 = (void *)MEMORY[0x263F0A648];
    uint64_t v22 = [v15 startDate];
    [v15 endDate];
    uint64_t v23 = v86 = v17;
    id v24 = [v16 metadata];
    v25 = [v21 quantitySampleWithType:v14 quantity:v13 startDate:v22 endDate:v23 metadata:v24];

    id v17 = v86;
    int64_t v26 = [v16 sourceRevision];
    [v25 _setSourceRevision:v26];

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v25];
  }
  if (a7)
  {
    if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
    {
LABEL_35:
      [*(id *)(a1 + 40) invalidate];
      goto LABEL_36;
    }
    _HKInitializeLogging();
    BOOL v27 = (os_log_t *)MEMORY[0x263F09910];
    v28 = (void *)*MEMORY[0x263F09910];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = v28;
      int v30 = objc_opt_class();
      id v31 = *(__CFString **)(a1 + 56);
      uint64_t v32 = @"journaled";
      if (!*(unsigned char *)(a1 + 64)) {
        uint64_t v32 = @"added";
      }
      *(_DWORD *)buf = 138543874;
      uint64_t v92 = (uint64_t)v30;
      __int16 v93 = 2048;
      v94 = v31;
      __int16 v95 = 2114;
      v96 = v32;
      id v33 = v30;
      _os_log_impl(&dword_22615C000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Applying %ld %{public}@ samples", buf, 0x20u);
    }
    _HKInitializeLogging();
    os_log_t v34 = *v27;
    if (os_log_type_enabled(*v27, OS_LOG_TYPE_DEFAULT))
    {
      id v35 = v34;
      int v36 = objc_opt_class();
      uint64_t v37 = (uint64_t)v36;
      id v38 = v15;
      id v39 = v16;
      id v40 = v14;
      id v41 = v13;
      id v42 = v17;
      if (*(unsigned char *)(a1 + 64)) {
        __int16 v43 = @"journaled";
      }
      else {
        __int16 v43 = @"added";
      }
      v44 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      id v87 = v36;
      uint64_t v45 = v44;
      BOOL v27 = (os_log_t *)MEMORY[0x263F09910];
      uint64_t v46 = [v45 count];
      *(_DWORD *)buf = 138543874;
      uint64_t v92 = v37;
      __int16 v93 = 2114;
      v94 = v43;
      id v17 = v42;
      id v13 = v41;
      id v14 = v40;
      id v16 = v39;
      id v15 = v38;
      __int16 v95 = 2048;
      v96 = (__CFString *)v46;
      _os_log_impl(&dword_22615C000, v35, OS_LOG_TYPE_DEFAULT, "[%{public}@] Total Accumulated %{public}@ samples: %ld", buf, 0x20u);
    }
    uint64_t v47 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (*(unsigned char *)(a1 + 64)) {
      +[HDHeadphoneExposureSampleBatch batchWithJournaledSamples:v47];
    }
    else {
    v48 = +[HDHeadphoneExposureSampleBatch batchWithAddedSamples:v47 anchor:v17];
    }
    id v88 = v17;
    _HKInitializeLogging();
    v49 = (void **)v27;
    v50 = *v27;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      id v51 = v50;
      objc_super v52 = objc_opt_class();
      id v53 = v52;
      int v54 = [v48 canTriggerUserNotification];
      v55 = @"NO";
      if (v54) {
        v55 = @"YES";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v92 = (uint64_t)v52;
      __int16 v93 = 2112;
      v94 = v55;
      _os_log_impl(&dword_22615C000, v51, OS_LOG_TYPE_DEFAULT, "[%{public}@] Is Batch Eligible For Notifications: %@", buf, 0x16u);
    }
    v56 = @"journaled";
    if (!*(unsigned char *)(a1 + 64)) {
      v56 = @"added";
    }
    v57 = v56;
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
    uint64_t v58 = *(void *)(a1 + 40);
    v59 = *(void **)(*(void *)(a1 + 32) + 72);
    id v90 = 0;
    uint64_t v60 = [v59 updateWithExposure:v48 assertion:v58 error:&v90];
    id v84 = v90;
    v85 = (void *)v60;
    if (v60)
    {
      v83 = v48;
      v61 = v57;
      v62 = *(void **)(a1 + 32);
      uint64_t v63 = *(void *)(a1 + 40);
      id v89 = 0;
      int v64 = objc_msgSend(v62, "_lock_updateCurrentDoseUsingStatisticsResult:assertion:error:", v60, v63, &v89);
      id v65 = v89;
      _HKInitializeLogging();
      v66 = *v49;
      v67 = *v49;
      if (v64)
      {
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          v68 = v66;
          uint64_t v69 = objc_opt_class();
          v70 = *(__CFString **)(a1 + 56);
          *(_DWORD *)buf = 138543874;
          uint64_t v92 = v69;
          __int16 v93 = 2048;
          v94 = v70;
          __int16 v95 = 2114;
          v96 = v61;
          _os_log_impl(&dword_22615C000, v68, OS_LOG_TYPE_DEFAULT, "[%{public}@] Applied %ld %{public}@ samples to dose", buf, 0x20u);
        }
      }
      else if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        v78 = v66;
        uint64_t v79 = objc_opt_class();
        v80 = *(__CFString **)(a1 + 56);
        *(_DWORD *)buf = 138544130;
        uint64_t v92 = v79;
        __int16 v93 = 2048;
        v94 = v80;
        __int16 v95 = 2114;
        v96 = v61;
        __int16 v97 = 2112;
        v77 = v84;
        id v98 = v84;
        _os_log_error_impl(&dword_22615C000, v78, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to apply %ld %{public}@ samples to dose: %@", buf, 0x2Au);

        v57 = v61;
        v48 = v83;
        goto LABEL_34;
      }
      v57 = v61;
      v48 = v83;
      v77 = v84;
LABEL_34:
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));

      id v17 = v88;
      goto LABEL_35;
    }
    uint64_t v71 = *(void *)(a1 + 40);
    _HKInitializeLogging();
    v72 = *v49;
    v73 = *v49;
    if (v71)
    {
      if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
      {
        v74 = v72;
        uint64_t v75 = objc_opt_class();
        v76 = *(__CFString **)(a1 + 56);
        *(_DWORD *)buf = 138544130;
        uint64_t v92 = v75;
        __int16 v93 = 2048;
        v94 = v76;
        __int16 v95 = 2114;
        v96 = v57;
        __int16 v97 = 2112;
        v77 = v84;
        id v98 = v84;
        _os_log_fault_impl(&dword_22615C000, v74, OS_LOG_TYPE_FAULT, "[%{public}@] Failed to apply %ld %{public}@ samples to statistics: %@", buf, 0x2Au);
LABEL_39:

        id v65 = 0;
        goto LABEL_34;
      }
    }
    else if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
    {
      v74 = v72;
      uint64_t v81 = objc_opt_class();
      v82 = *(__CFString **)(a1 + 56);
      *(_DWORD *)buf = 138544130;
      uint64_t v92 = v81;
      __int16 v93 = 2048;
      v94 = v82;
      __int16 v95 = 2114;
      v96 = v57;
      __int16 v97 = 2112;
      v77 = v84;
      id v98 = v84;
      _os_log_error_impl(&dword_22615C000, v74, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to apply %ld %{public}@ samples to statistics: %@", buf, 0x2Au);
      goto LABEL_39;
    }
    id v65 = 0;
    v77 = v84;
    goto LABEL_34;
  }
LABEL_36:
}

- (void)didReceiveResetDosageToFireDate:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  int v5 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = v5;
    uint64_t v7 = objc_opt_class();
    id v8 = [MEMORY[0x263EFF910] now];
    *(_DWORD *)buf = 138543875;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    id v14 = v8;
    __int16 v15 = 2113;
    id v16 = v4;
    _os_log_impl(&dword_22615C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received reset dosage notification at %{public}@ for fire date %{private}@.", buf, 0x20u);
  }
  BOOL v9 = [(HDHeadphoneDoseManager *)self _takeAccessibilityAssertion];
  [(HDHeadphoneDoseManager *)self _updateWithRemoteNotificationDismissalDate:v4 assertion:v9];
  [v9 invalidate];
  if (self->_unitTesting_didFinishResetDosageToFireDate)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__HDHeadphoneDoseManager_didReceiveResetDosageToFireDate___block_invoke;
    block[3] = &unk_264795D40;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __58__HDHeadphoneDoseManager_didReceiveResetDosageToFireDate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "unitTesting_didFinishResetDosageToFireDate");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();
}

- (BOOL)_rebuildWithError:(id *)a3
{
  int v5 = [(HDHeadphoneDoseManager *)self _takeAccessibilityAssertion];
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(a3) = [(HDHeadphoneDoseManager *)self _lock_rebuildWithAssertion:v5 error:a3];
  os_unfair_lock_unlock(&self->_lock);
  [v5 invalidate];

  return (char)a3;
}

- (id)_infoWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v5 = [MEMORY[0x263EFF910] now];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v7 = +[HDHeadphoneAudioExposureStatisticsBucket _currentDoseStringForEndDate:v5 earliestStartDate:0 profile:WeakRetained];

  id v8 = objc_alloc_init(MEMORY[0x263F089D8]);
  [MEMORY[0x263F44978] isHeadphoneExposureNotificationsEnabled];
  BOOL v9 = HKStringFromBool();
  [v8 appendFormat:@"HAEN Enabled:\t\t %@\n", v9];

  [v8 appendFormat:@"Current Dose:\t\t %@\n", v7];
  double dose = self->_dose;
  if (dose >= 0.0)
  {
    double v15 = dose * 100.0;
    id v11 = @"Accumulated Dose:\t %.2f%%\n";
  }
  else
  {
    id v11 = @"Accumulated Dose:\t Not Yet Determined\n";
  }
  objc_msgSend(v8, "appendFormat:", v11, *(void *)&v15);
  uint64_t v12 = [(HDHeadphoneDoseMetadataStore *)self->_keyValueStore _info];
  [v8 appendString:v12];

  os_unfair_lock_unlock(p_lock);
  __int16 v13 = (void *)[v8 copy];

  return v13;
}

- (id)_infoDictWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  BOOL v6 = [MEMORY[0x263EFF910] now];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = +[HDHeadphoneAudioExposureStatisticsBucket _currentDoseStringForEndDate:v6 earliestStartDate:0 profile:WeakRetained];

  [MEMORY[0x263F44978] isHeadphoneExposureNotificationsEnabled];
  BOOL v9 = HKStringFromBool();
  [v5 setObject:v9 forKeyedSubscript:@"haen_enabled"];

  [v5 setObject:v8 forKeyedSubscript:@"current_dose"];
  if (self->_dose < 0.0)
  {
    [v5 setObject:@"n/a" forKeyedSubscript:@"accumulated_dose"];
  }
  else
  {
    uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"%.2f", self->_dose * 100.0];
    [v5 setObject:v10 forKeyedSubscript:@"accumulated_dose"];
  }
  id v11 = [(HDHeadphoneDoseMetadataStore *)self->_keyValueStore _infoDict];
  [v5 addEntriesFromDictionary:v11];

  os_unfair_lock_unlock(p_lock);
  uint64_t v12 = (void *)[v5 copy];

  return v12;
}

- (id)_pruneWithNowDate:(id)a3 limit:(unint64_t)a4 error:(id *)a5
{
  p_lock = &self->_lock;
  id v9 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v10 = [(HDHeadphoneDoseManager *)self _lock_pruneWithNowDate:v9 limit:a4 error:a5];

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (id)_lock_pruneWithNowDate:(id)a3 limit:(unint64_t)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = [(HDHeadphoneDoseManager *)self _takeAccessibilityAssertion];
  uint64_t v10 = [(HDHeadphoneAudioExposureStatisticsCalculator *)self->_statisticsCalculator pruneWithNowDate:v8 limit:a4 error:a5];

  _HKInitializeLogging();
  id v11 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    uint64_t v13 = objc_opt_class();
    id v14 = [v10 prunedCount];
    int v20 = 138543618;
    uint64_t v21 = v13;
    __int16 v22 = 2114;
    uint64_t v23 = v14;
    _os_log_impl(&dword_22615C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Pruned %{public}@ HAE Buckets.", (uint8_t *)&v20, 0x16u);
  }
  if (!v10)
  {
    [v9 invalidate];
    goto LABEL_8;
  }
  double v15 = [v10 prunedCount];
  uint64_t v16 = [v15 unsignedLongValue];

  if (v16)
  {
    BOOL v17 = [(HDHeadphoneDoseManager *)self _lock_updateCurrentDoseUsingStatisticsResult:v10 assertion:v9 error:a5];
    [v9 invalidate];
    if (v17) {
      goto LABEL_10;
    }
LABEL_8:
    id v18 = 0;
    goto LABEL_11;
  }
  [v9 invalidate];
LABEL_10:
  id v18 = [v10 prunedCount];
LABEL_11:

  return v18;
}

- (HDHeadphoneAudioExposureStatisticsCalculator)unitTesting_calculator
{
  return self->_statisticsCalculator;
}

- (HDHeadphoneDoseMetadataStore)unitTesting_keyValueStore
{
  return self->_keyValueStore;
}

- (void)unitTesting_didReceiveResetDosageToFireDate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__HDHeadphoneDoseManager_unitTesting_didReceiveResetDosageToFireDate___block_invoke;
  v7[3] = &unk_264795D68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __70__HDHeadphoneDoseManager_unitTesting_didReceiveResetDosageToFireDate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didReceiveResetDosageToFireDate:*(void *)(a1 + 40)];
}

- (id)_fetchDoseLimitInfoWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(HDHeadphoneDoseMetadataStore *)self->_keyValueStore _fetchDoseLimitInfoWithError:a3];
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (BOOL)_overrideDoseLimit:(id)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  LOBYTE(a4) = [(HDHeadphoneDoseMetadataStore *)self->_keyValueStore _overrideDoseLimit:v7 error:a4];

  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (id)_takeAccessibilityAssertion
{
  double v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [MEMORY[0x263F08C38] UUID];
  id v7 = [v6 UUIDString];
  id v8 = [v3 stringWithFormat:@"%@-%@", v5, v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v10 = [WeakRetained database];
  id v14 = 0;
  id v11 = [v10 takeAccessibilityAssertionWithOwnerIdentifier:v8 timeout:&v14 error:300.0];
  id v12 = v14;

  if (!v11)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_ERROR)) {
      -[HDHeadphoneDoseManager _takeAccessibilityAssertion]();
    }
  }

  return v11;
}

- (void)_headphoneExposureNotificationsEnabledDidChange:(id)a3
{
  id v4 = [(HDHeadphoneDoseManager *)self _takeAccessibilityAssertion];
  os_unfair_lock_lock(&self->_lock);
  [(HDHeadphoneDoseManager *)self _lock_updateIsEnabledForInitialSetup:0 assertion:v4];
  os_unfair_lock_unlock(&self->_lock);
  [v4 invalidate];
}

- (void)_lock_updateIsEnabledForInitialSetup:(BOOL)a3 assertion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL enabled = self->_enabled;
  self->_BOOL enabled = [MEMORY[0x263F44978] isHeadphoneExposureNotificationsEnabled];
  BOOL v9 = [(HDHeadphoneAudioExposureStatisticsCalculator *)self->_statisticsCalculator isSetup];
  int v10 = !v9;
  if (!enabled) {
    int v10 = 1;
  }
  if (self->_enabled && v10 != 0)
  {
    uint64_t v16 = (os_log_t *)MEMORY[0x263F09910];
    if (v9)
    {
      if (enabled)
      {
        BOOL v17 = [MEMORY[0x263F08690] currentHandler];
        [v17 handleFailureInMethod:a2 object:self file:@"HDHeadphoneDoseManager.m" lineNumber:572 description:@"Unreachable code has been executed"];

        goto LABEL_31;
      }
      if (v4)
      {
        __int16 v43 = [MEMORY[0x263F08690] currentHandler];
        [v43 handleFailureInMethod:a2, self, @"HDHeadphoneDoseManager.m", 569, @"Invalid parameter not satisfying: %@", @"initialSetup == NO" object file lineNumber description];
      }
      _HKInitializeLogging();
      os_log_t v23 = *v16;
      if (!os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_31:
        statisticsCalculator = self->_statisticsCalculator;
        id v45 = 0;
        v25 = [(HDHeadphoneAudioExposureStatisticsCalculator *)statisticsCalculator rebuildWithAssertion:v7 error:&v45];
        int64_t v26 = v45;
        BOOL v27 = v26;
        if (v25)
        {
          id v44 = 0;
          BOOL v28 = [(HDHeadphoneDoseManager *)self _lock_updateCurrentDoseUsingStatisticsResult:v25 assertion:v7 error:&v44];
          uint64_t v29 = v44;
          _HKInitializeLogging();
          int v30 = *v16;
          if (!v28)
          {
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
              goto LABEL_41;
            }
            id v31 = v30;
            uint64_t v39 = objc_opt_class();
            BOOL v40 = self->_enabled;
            *(_DWORD *)buf = 138544386;
            uint64_t v47 = v39;
            __int16 v48 = 1024;
            *(_DWORD *)v49 = v40;
            *(_WORD *)&v49[4] = 1024;
            *(_DWORD *)&v49[6] = enabled;
            __int16 v50 = 1024;
            int v51 = v4;
            __int16 v52 = 2112;
            id v53 = v29;
            _os_log_fault_impl(&dword_22615C000, v31, OS_LOG_TYPE_FAULT, "[%{public}@] Failure to handle HAEN isEnabled change (enabled: %d, wasEnabled: %d, initialSetup: %d, changed: YES): %@", buf, 0x28u);
            goto LABEL_35;
          }
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            id v31 = v30;
            uint64_t v32 = objc_opt_class();
            BOOL v33 = self->_enabled;
            *(_DWORD *)buf = 138544130;
            uint64_t v47 = v32;
            __int16 v48 = 1024;
            *(_DWORD *)v49 = v33;
            *(_WORD *)&v49[4] = 1024;
            *(_DWORD *)&v49[6] = enabled;
            __int16 v50 = 1024;
            int v51 = v4;
            _os_log_impl(&dword_22615C000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handled HAEN isEnabled change (enabled: %d, wasEnabled: %d, initialSetup: %d, changed: YES)", buf, 0x1Eu);
LABEL_35:
          }
        }
        else
        {
          if (v4 && [v26 hearing_isExpectedError])
          {
            _HKInitializeLogging();
            os_log_t v34 = *v16;
            if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
            {
              id v35 = v34;
              uint64_t v36 = objc_opt_class();
              BOOL v37 = self->_enabled;
              *(_DWORD *)buf = 138544386;
              uint64_t v47 = v36;
              __int16 v48 = 1024;
              *(_DWORD *)v49 = v37;
              *(_WORD *)&v49[4] = 1024;
              *(_DWORD *)&v49[6] = enabled;
              __int16 v50 = 1024;
              int v51 = 1;
              __int16 v52 = 2112;
              id v53 = v27;
              _os_log_error_impl(&dword_22615C000, v35, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to handle HAEN isEnabled change (enabled: %d, wasEnabled: %d, initialSetup: %d): %@", buf, 0x28u);
            }
            goto LABEL_43;
          }
          _HKInitializeLogging();
          os_log_t v38 = *v16;
          if (!os_log_type_enabled(*v16, OS_LOG_TYPE_FAULT))
          {
LABEL_43:

            goto LABEL_44;
          }
          uint64_t v29 = v38;
          uint64_t v41 = objc_opt_class();
          BOOL v42 = self->_enabled;
          *(_DWORD *)buf = 138544386;
          uint64_t v47 = v41;
          __int16 v48 = 1024;
          *(_DWORD *)v49 = v42;
          *(_WORD *)&v49[4] = 1024;
          *(_DWORD *)&v49[6] = enabled;
          __int16 v50 = 1024;
          int v51 = v4;
          __int16 v52 = 2112;
          id v53 = v27;
          _os_log_fault_impl(&dword_22615C000, v29, OS_LOG_TYPE_FAULT, "[%{public}@] Unable to handle HAEN isEnabled change (enabled: %d, wasEnabled: %d, initialSetup: %d): %@", buf, 0x28u);
        }
LABEL_41:

        goto LABEL_43;
      }
      int v20 = v23;
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = objc_opt_class();
      _os_log_impl(&dword_22615C000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has re-ENABLED Headphone Exposure Notifications while healthd is running.", buf, 0xCu);
    }
    else
    {
      double v19 = @"while healthd is running.";
      if (v4) {
        double v19 = @"before launching healthd or first unlock";
      }
      int v20 = v19;
      _HKInitializeLogging();
      os_log_t v21 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v22 = v21;
        *(_DWORD *)buf = 138543618;
        uint64_t v47 = objc_opt_class();
        __int16 v48 = 2114;
        *(void *)v49 = v20;
        _os_log_impl(&dword_22615C000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has ENABLED Headphone Exposure Notifications %{public}@", buf, 0x16u);
      }
    }

    goto LABEL_31;
  }
  if (enabled && !self->_enabled)
  {
    id v12 = @"while healthd is running.";
    if (v4) {
      id v12 = @"before launching healthd or first unlock";
    }
    uint64_t v13 = v12;
    _HKInitializeLogging();
    id v14 = (void *)*MEMORY[0x263F09910];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
    {
      double v15 = v14;
      *(_DWORD *)buf = 138543618;
      uint64_t v47 = objc_opt_class();
      __int16 v48 = 2114;
      *(void *)v49 = v13;
      _os_log_impl(&dword_22615C000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has DISABLED Headphone Exposure Notifications %{public}@.", buf, 0x16u);
    }
    goto LABEL_25;
  }
  if (enabled != self->_enabled)
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"HDHeadphoneDoseManager.m" lineNumber:602 description:@"Unreachable code has been executed"];
    goto LABEL_25;
  }
  _HKInitializeLogging();
  id v18 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v18;
    *(_DWORD *)buf = 138543362;
    uint64_t v47 = objc_opt_class();
    _os_log_impl(&dword_22615C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] No changes to Headphone Exposure Notifications setting occurred.", buf, 0xCu);
LABEL_25:
  }
LABEL_44:
}

- (BOOL)_lock_rebuildWithAssertion:(id)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_assert_owner(p_lock);
  LOBYTE(a4) = [(HDHeadphoneDoseManager *)self _lock_rebuildWithAssertion:v7 resetSyncNotification:0 error:a4];

  return (char)a4;
}

- (BOOL)_lock_rebuildWithAssertion:(id)a3 resetSyncNotification:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v6)
  {
    keyValueStore = self->_keyValueStore;
    id v27 = 0;
    BOOL v10 = [(HDHeadphoneDoseMetadataStore *)keyValueStore _clearPreviousSevenDayRemoteNotificationFireDateWithError:&v27];
    id v11 = v27;
    if (!v10)
    {
      _HKInitializeLogging();
      id v12 = (void *)*MEMORY[0x263F09910];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = v12;
        uint64_t v14 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v14;
        __int16 v30 = 2112;
        id v31 = v11;
        _os_log_impl(&dword_22615C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Clear Previous Seven Date Remote Notification Fire Date returned with error:%@", buf, 0x16u);
      }
      id v15 = v11;
      if (!v15) {
        goto LABEL_18;
      }
      if (!a5)
      {
LABEL_7:
        _HKLogDroppedError();
LABEL_18:
        BOOL v21 = 0;
        id v18 = v15;
        goto LABEL_21;
      }
      goto LABEL_17;
    }
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v16 = self->_keyValueStore;
  id v26 = v11;
  BOOL v17 = [(HDHeadphoneDoseMetadataStore *)v16 rebuildCachedFireDateFromLocalHAENStoreWithError:&v26];
  id v18 = v26;

  if (!v17)
  {
    _HKInitializeLogging();
    __int16 v22 = (void *)*MEMORY[0x263F09910];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v23 = v22;
      uint64_t v24 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v24;
      __int16 v30 = 2112;
      id v31 = v18;
      _os_log_impl(&dword_22615C000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Rebuild Cache Fire Date from Local HAEN Store returned with error:%@", buf, 0x16u);
    }
    id v15 = v18;
    if (!v15) {
      goto LABEL_18;
    }
    if (!a5) {
      goto LABEL_7;
    }
LABEL_17:
    id v15 = v15;
    BOOL v21 = 0;
    *a5 = v15;
    id v18 = v15;
    goto LABEL_21;
  }
  double v19 = [(HDHeadphoneAudioExposureStatisticsCalculator *)self->_statisticsCalculator rebuildWithAssertion:v8 error:a5];
  id v15 = v19;
  if (!v19)
  {
LABEL_20:
    BOOL v21 = 0;
    goto LABEL_21;
  }
  int v20 = [v19 cache];

  if (!v20)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a5, 100, @"Cache not ready. Pending samples should be replayed soon.");
    goto LABEL_20;
  }
  BOOL v21 = [(HDHeadphoneDoseManager *)self _lock_updateCurrentDoseUsingStatisticsResult:v15 assertion:v8 error:a5];
LABEL_21:

  return v21;
}

- (void)_lock_updateWithNotifications:(id)a3 journaled:(BOOL)a4 assertion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL v10 = @"added";
  if (v6) {
    BOOL v10 = @"journaled";
  }
  id v11 = v10;
  if (self->_enabled)
  {
    statisticsCalculator = self->_statisticsCalculator;
    id v20 = 0;
    uint64_t v13 = [(HDHeadphoneAudioExposureStatisticsCalculator *)statisticsCalculator updateWithNotifications:v8 assertion:v9 error:&v20];
    uint64_t v14 = (__CFString *)v20;
    if (v13)
    {
      -[HDHeadphoneDoseManager _updateCurrentDoseFromResult:context:sampleCount:assertion:](self, "_updateCurrentDoseFromResult:context:sampleCount:assertion:", v13, v11, [v8 count], v9);
    }
    else
    {
      _HKInitializeLogging();
      BOOL v17 = (void *)*MEMORY[0x263F09910];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT))
      {
        id v18 = v17;
        uint64_t v19 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        uint64_t v22 = v19;
        __int16 v23 = 2114;
        uint64_t v24 = (uint64_t)v11;
        __int16 v25 = 2112;
        id v26 = v14;
        _os_log_fault_impl(&dword_22615C000, v18, OS_LOG_TYPE_FAULT, "[%{public}@] Unable to process %{public}@ 7-Day HAEN: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v15 = (void *)*MEMORY[0x263F09910];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v15;
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = objc_opt_class();
      __int16 v23 = 2048;
      uint64_t v24 = [v8 count];
      __int16 v25 = 2114;
      id v26 = v11;
      _os_log_impl(&dword_22615C000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring %lu %{public}@ HAEN samples since HAEN is disabled.", buf, 0x20u);
    }
  }
}

- (void)_updateCurrentDoseFromResult:(id)a3 context:(id)a4 sampleCount:(unint64_t)a5 assertion:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = [v11 statistics];

  if (v14)
  {
    id v15 = [v11 statistics];
    int v16 = [v15 eligbleForUserNotification];

    if (v16)
    {
      uint64_t v27 = [MEMORY[0x263F08690] currentHandler];
      [v27 handleFailureInMethod:a2, self, @"HDHeadphoneDoseManager.m", 678, @"Invalid parameter not satisfying: %@", @"result.statistics.eligbleForUserNotification == NO" object file lineNumber description];
    }
    BOOL v17 = [v11 statistics];
    id v28 = 0;
    BOOL v18 = [(HDHeadphoneDoseManager *)self _lock_updateCurrentDoseUsingStatisticsResult:v17 assertion:v13 error:&v28];
    uint64_t v19 = v28;

    _HKInitializeLogging();
    id v20 = (void *)*MEMORY[0x263F09910];
    BOOL v21 = *MEMORY[0x263F09910];
    if (v18)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = v20;
        uint64_t v23 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        uint64_t v30 = v23;
        __int16 v31 = 2048;
        unint64_t v32 = a5;
        __int16 v33 = 2114;
        os_log_t v34 = v12;
        _os_log_impl(&dword_22615C000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully updated dose for %lu %{public}@ HAEN samples.", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      __int16 v25 = v20;
      uint64_t v26 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v30 = v26;
      __int16 v31 = 2114;
      unint64_t v32 = (unint64_t)v12;
      __int16 v33 = 2112;
      os_log_t v34 = v19;
      _os_log_fault_impl(&dword_22615C000, v25, OS_LOG_TYPE_FAULT, "[%{public}@] Unable to update 7-Day HAE Dose due to 7-Day HAEN %{public}@ sample arrival: %@", buf, 0x20u);
    }
    goto LABEL_11;
  }
  _HKInitializeLogging();
  uint64_t v24 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = v24;
    *(_DWORD *)buf = 138543874;
    uint64_t v30 = objc_opt_class();
    __int16 v31 = 2048;
    unint64_t v32 = a5;
    __int16 v33 = 2114;
    os_log_t v34 = v12;
    _os_log_impl(&dword_22615C000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully processed %lu %{public}@ HAEN samples which did NOT impact current dose", buf, 0x20u);
LABEL_11:
  }
}

- (BOOL)_lock_updateCurrentDoseUsingStatisticsResult:(id)a3 assertion:(id)a4 error:(id *)a5
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    uint64_t v71 = [MEMORY[0x263F08690] currentHandler];
    [v71 handleFailureInMethod:a2, self, @"HDHeadphoneDoseManager.m", 691, @"Invalid parameter not satisfying: %@", @"statistics" object file lineNumber description];
  }
  os_unfair_lock_assert_owner(&self->_lock);
  id v11 = [MEMORY[0x263EFF910] now];
  unitTesting_updateCurrentDoseNowDateProvider = (void (**)(id, void *))self->_unitTesting_updateCurrentDoseNowDateProvider;
  if (unitTesting_updateCurrentDoseNowDateProvider)
  {
    uint64_t v13 = unitTesting_updateCurrentDoseNowDateProvider[2](unitTesting_updateCurrentDoseNowDateProvider, v11);

    id v11 = (void *)v13;
  }
  int v14 = [v9 eligbleForUserNotification];
  id v15 = [v9 cache];
  int v16 = v15;
  if (v15)
  {
    BOOL v17 = [v15 snapshotStatisticsForNowDate:v11 error:a5];
    BOOL v18 = v17;
    if (!v17)
    {
      BOOL v29 = 0;
LABEL_74:

      goto LABEL_75;
    }
    SEL v82 = a2;
    uint64_t v19 = [v17 statistics];
    id v20 = objc_msgSend(v19, "hk_hearingSevenDayDosePercentageWithError:", a5);

    if (!v20)
    {
      BOOL v29 = 0;
LABEL_73:

      goto LABEL_74;
    }
    uint64_t v21 = MEMORY[0x22A647340](self->_unitTesting_didUpdateHandler);
    double dose = self->_dose;
    v88[0] = MEMORY[0x263EF8330];
    v88[1] = 3221225472;
    v88[2] = __87__HDHeadphoneDoseManager__lock_updateCurrentDoseUsingStatisticsResult_assertion_error___block_invoke;
    v88[3] = &unk_264795DE0;
    v83 = (void *)v21;
    v88[4] = v21;
    *(double *)&v88[5] = dose;
    uint64_t v23 = MEMORY[0x22A647340](v88);
    [v20 doubleValue];
    double v25 = v24;
    double v26 = dose - v24;
    if (v26 < 0.0) {
      double v26 = -v26;
    }
    if (v14) {
      BOOL lastUpdateSuppressedUserNotification = self->_lastUpdateSuppressedUserNotification;
    }
    else {
      BOOL lastUpdateSuppressedUserNotification = 0;
    }
    if (v26 <= 2.22044605e-16 && !lastUpdateSuppressedUserNotification)
    {
      (*(void (**)(uint64_t, double))(v23 + 16))(v23, v25);
      uint64_t v30 = (void *)v23;
      BOOL v29 = 1;
      __int16 v31 = v83;
LABEL_72:

      goto LABEL_73;
    }
    v80 = v20;
    uint64_t v81 = (void (**)(double))v23;
    _HKInitializeLogging();
    unint64_t v32 = *MEMORY[0x263F09910];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
    {
      double v33 = self->_dose * 100.0;
      *(_DWORD *)buf = 134283777;
      double v91 = v33;
      __int16 v92 = 2049;
      double v93 = v25 * 100.0;
      _os_log_impl(&dword_22615C000, v32, OS_LOG_TYPE_DEFAULT, "Updating dose from %{private}.2f%% to %{private}.2f%%", buf, 0x16u);
    }
    self->_double dose = v25;
    v81[2](v25);
    [(HDHeadphoneDoseManager *)self _lock_updateCollectionAssertionForDoseAccumulated:v25];
    BOOL v34 = [(HDHeadphoneDoseMetadataStore *)self->_keyValueStore shouldNotifyUserForAccumulatedDose:v25];
    if (((!v34 | v14) & 1) == 0)
    {
      BOOL v34 = 0;
      self->_BOOL lastUpdateSuppressedUserNotification = 1;
    }
    _HKInitializeLogging();
    uint64_t v35 = (void *)*MEMORY[0x263F09910];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = v35;
      *(double *)&uint64_t v37 = COERCE_DOUBLE(objc_opt_class());
      *(double *)&os_log_t v38 = COERCE_DOUBLE(@"NO");
      if (v34) {
        *(double *)&os_log_t v38 = COERCE_DOUBLE(@"YES");
      }
      *(_DWORD *)buf = 138543618;
      double v91 = *(double *)&v37;
      __int16 v92 = 2112;
      double v93 = *(double *)&v38;
      _os_log_impl(&dword_22615C000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@] Update Current Dose should notify user:%@", buf, 0x16u);
    }
    if (!v34)
    {
      BOOL v29 = 1;
      __int16 v31 = v83;
LABEL_71:
      uint64_t v30 = v81;
      goto LABEL_72;
    }
    self->_BOOL lastUpdateSuppressedUserNotification = 0;
    v87[0] = MEMORY[0x263EF8330];
    v87[1] = 3221225472;
    v87[2] = __87__HDHeadphoneDoseManager__lock_updateCurrentDoseUsingStatisticsResult_assertion_error___block_invoke_389;
    v87[3] = &unk_264795E08;
    v87[4] = self;
    uint64_t v77 = MEMORY[0x22A647340](v87);
    uint64_t v39 = [HDHeadphoneExposureNotificationAnalyticsInfo alloc];
    lastLockDateForAnalytics = self->_lastLockDateForAnalytics;
    uint64_t v41 = [v18 previousNotificationDate];
    BOOL v42 = [(HDHeadphoneExposureNotificationAnalyticsInfo *)v39 initWithLastLockDate:lastLockDateForAnalytics lastNotificationDate:v41];

    _HKInitializeLogging();
    __int16 v43 = (void *)*MEMORY[0x263F09910];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
    {
      id v44 = v43;
      *(double *)&uint64_t v45 = COERCE_DOUBLE(objc_opt_class());
      *(_DWORD *)buf = 138543362;
      double v91 = *(double *)&v45;
      _os_log_impl(&dword_22615C000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@] Posting 7-Day HAE Notification", buf, 0xCu);
    }
    notificationCenter = self->_notificationCenter;
    id v86 = 0;
    uint64_t v47 = [(HDHeadphoneExposureNotificationCenter *)notificationCenter postSevenDayDoseNotification:v18 nowDate:v11 analyticsInfo:v42 error:&v86];
    id v48 = v86;
    v78 = v48;
    uint64_t v79 = (void *)v47;
    if (v47)
    {
      _HKInitializeLogging();
      v49 = *MEMORY[0x263F09910];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22615C000, v49, OS_LOG_TYPE_DEFAULT, "Posted 7-Day HAE Notification.", buf, 2u);
      }
      v76 = v42;
      if ([v16 isDirty])
      {
        _HKInitializeLogging();
        __int16 v50 = *MEMORY[0x263F09910];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22615C000, v50, OS_LOG_TYPE_DEFAULT, "Marking doseLimit as needing rebuild on next unlock.", buf, 2u);
        }
        [(HDHeadphoneAudioExposureStatisticsCalculator *)self->_statisticsCalculator setNeedsRebuild];
      }
      statisticsCalculator = self->_statisticsCalculator;
      id v89 = v79;
      __int16 v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v89 count:1];
      id v85 = 0;
      id v53 = [(HDHeadphoneAudioExposureStatisticsCalculator *)statisticsCalculator updateWithNotifications:v52 assertion:v10 error:&v85];
      id v54 = v85;

      v74 = v53;
      id v75 = v54;
      if (v53)
      {
        v55 = [v53 statistics];

        if (!v55)
        {
          v72 = [MEMORY[0x263F08690] currentHandler];
          [v72 handleFailureInMethod:v82, self, @"HDHeadphoneDoseManager.m", 797, @"Invalid parameter not satisfying: %@", @"result.statistics", v53 object file lineNumber description];
        }
        v56 = [v53 statistics];
        int v57 = [v56 eligbleForUserNotification];

        if (v57)
        {
          v73 = [MEMORY[0x263F08690] currentHandler];
          [v73 handleFailureInMethod:v82, self, @"HDHeadphoneDoseManager.m", 798, @"Invalid parameter not satisfying: %@", @"result.statistics.eligbleForUserNotification == NO" object file lineNumber description];
        }
        uint64_t v58 = [v53 statistics];
        id v84 = 0;
        BOOL v29 = [(HDHeadphoneDoseManager *)self _lock_updateCurrentDoseUsingStatisticsResult:v58 assertion:v10 error:&v84];
        id v59 = v84;

        uint64_t v60 = 0;
        id v20 = v80;
        if (!v29)
        {
          id v61 = v59;
          uint64_t v60 = v61;
          if (v61)
          {
            if (a5) {
              *a5 = v61;
            }
            else {
              _HKLogDroppedError();
            }
          }
        }
        uint64_t v69 = v60;
        int v64 = (void (**)(void, void))v77;
        (*(void (**)(uint64_t, void *))(v77 + 16))(v77, v69);
      }
      else
      {
        int v64 = (void (**)(void, void))v77;
        (*(void (**)(uint64_t, id))(v77 + 16))(v77, v54);
        id v65 = v54;
        id v59 = v65;
        if (v65)
        {
          id v20 = v80;
          if (a5)
          {
            id v59 = v65;
            BOOL v29 = 0;
            *a5 = v59;
          }
          else
          {
            _HKLogDroppedError();
            BOOL v29 = 0;
          }
        }
        else
        {
          BOOL v29 = 0;
          id v20 = v80;
        }
      }

      __int16 v31 = v83;
      id v67 = v75;
      BOOL v42 = v76;
      goto LABEL_70;
    }
    v62 = v48;
    id v20 = v80;
    if ((objc_msgSend(v48, "hk_isFeatureDisabledError") & 1) != 0
      || objc_msgSend(v62, "hearing_audioDSP_isHAENDisabled"))
    {
      _HKInitializeLogging();
      uint64_t v63 = *MEMORY[0x263F09910];
      int v64 = (void (**)(void, void))v77;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_ERROR)) {
        -[HDHeadphoneDoseManager _lock_updateCurrentDoseUsingStatisticsResult:assertion:error:]((uint64_t)v78, v63);
      }
    }
    else
    {
      _HKInitializeLogging();
      v66 = *MEMORY[0x263F09910];
      int v64 = (void (**)(void, void))v77;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
        -[HDHeadphoneDoseManager _lock_updateCurrentDoseUsingStatisticsResult:assertion:error:]((uint64_t)v78, v66);
      }
    }
    ((void (**)(void, void *))v64)[2](v64, v78);
    id v67 = v78;
    if (v67)
    {
      if (a5)
      {
        id v67 = v67;
        BOOL v29 = 0;
        *a5 = v67;
LABEL_64:
        __int16 v31 = v83;
LABEL_70:

        goto LABEL_71;
      }
      id v68 = v67;
      _HKLogDroppedError();
      id v67 = v68;
    }
    BOOL v29 = 0;
    goto LABEL_64;
  }
  _HKInitializeLogging();
  id v28 = *MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22615C000, v28, OS_LOG_TYPE_DEFAULT, "Dose did not need updating", buf, 2u);
  }
  BOOL v29 = 1;
LABEL_75:

  return v29;
}

uint64_t __87__HDHeadphoneDoseManager__lock_updateCurrentDoseUsingStatisticsResult_assertion_error___block_invoke(uint64_t a1, __n128 a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(__n128, double))(result + 16))(a2, *(double *)(a1 + 40));
  }
  return result;
}

void __87__HDHeadphoneDoseManager__lock_updateCurrentDoseUsingStatisticsResult_assertion_error___block_invoke_389(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x22A647340](*(void *)(*(void *)(a1 + 32) + 128));
  BOOL v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
}

- (void)_lock_setCollectionAssertion:(id)a3
{
  BOOL v4 = (HDDataCollectionAssertion *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  collectionAssertion = self->_collectionAssertion;
  if (collectionAssertion) {
    [(HDDataCollectionAssertion *)collectionAssertion invalidate];
  }
  BOOL v6 = self->_collectionAssertion;
  self->_collectionAssertion = v4;
}

- (void)_lock_updateCollectionAssertionForDoseAccumulated:(double)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = [(HDHeadphoneDoseMetadataStore *)self->_keyValueStore collectionIntervalForDoseAccumulated:a3];
  BOOL v6 = v5;
  if (!v5)
  {
    _HKInitializeLogging();
    id v11 = *MEMORY[0x263F09910];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22615C000, v11, OS_LOG_TYPE_DEFAULT, "Using default HAE collection interval.", buf, 2u);
    }
    goto LABEL_7;
  }
  [v5 doubleValue];
  double v8 = v7;
  _HKInitializeLogging();
  id v9 = *MEMORY[0x263F09910];
  id v10 = *MEMORY[0x263F09910];
  if (v8 < 5.0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[HDHeadphoneDoseManager _lock_updateCollectionAssertionForDoseAccumulated:](v9, v8);
    }
LABEL_7:
    [(HDHeadphoneDoseManager *)self _lock_setCollectionAssertion:0];
    goto LABEL_11;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v26 = v8;
    _os_log_impl(&dword_22615C000, v9, OS_LOG_TYPE_DEFAULT, "Requesting custom HAE collection interval: %f", buf, 0xCu);
  }
  id v12 = NSString;
  uint64_t v13 = (objc_class *)objc_opt_class();
  int v14 = NSStringFromClass(v13);
  id v15 = [MEMORY[0x263F08C38] UUID];
  int v16 = [v15 UUIDString];
  BOOL v17 = [v12 stringWithFormat:@"%@-%@", v14, v16];

  BOOL v18 = (void *)MEMORY[0x263EFFA08];
  uint64_t v19 = HKHeadphoneAudioExposureType();
  id v20 = [v18 setWithObject:v19];

  uint64_t v21 = [MEMORY[0x263F431B8] dataCollectionObserverStateInForeground:1 hasRunningWorkout:0 hasBackgroundObserver:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v23 = [WeakRetained dataCollectionManager];
  double v24 = [v23 takeCollectionAssertionWithOwnerIdentifier:v17 sampleTypes:v20 observerState:v21 collectionInterval:v8];

  [(HDHeadphoneDoseManager *)self _lock_setCollectionAssertion:v24];
LABEL_11:
}

- (void)_updateWithRemoteNotificationDismissalDate:(id)a3 assertion:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  [(HDHeadphoneDoseManager *)self _lock_updateWithRemoteNotificationDismissalDate:v8 assertion:v7];

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_updateWithRemoteNotificationDismissalDate:(id)a3 assertion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_enabled)
  {
    statisticsCalculator = self->_statisticsCalculator;
    id v13 = 0;
    id v9 = [(HDHeadphoneAudioExposureStatisticsCalculator *)statisticsCalculator updateWithRemoteNotificationDismissalFireDate:v6 assertion:v7 error:&v13];
    id v10 = v13;
    if (v9)
    {
      [(HDHeadphoneDoseManager *)self _updateCurrentDoseFromResult:v9 context:@"Notification Synced" sampleCount:1 assertion:v7];
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
        -[HDHeadphoneDoseManager _lock_updateWithRemoteNotificationDismissalDate:assertion:]();
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v11 = (void *)*MEMORY[0x263F09910];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = objc_opt_class();
      _os_log_impl(&dword_22615C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring incoming reset dosage notification since HAEN is disabled.", buf, 0xCu);
    }
  }
}

- (void)_registerForSignificantTimeChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_significantTimeChange, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorCoalesce);
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__handleSignificantTimeChangeNotification_ name:*MEMORY[0x263EFF3C8] object:0];
}

- (void)_unregisterForSignificantTimeChangeNotification
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263EFF3C8] object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SignificantTimeChangeNotification", 0);
}

- (void)_handleSignificantTimeChangeNotification:(id)a3
{
  _HKInitializeLogging();
  id v4 = *MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22615C000, v4, OS_LOG_TYPE_DEFAULT, "Queueing dose recomputation due to significant time change.", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__HDHeadphoneDoseManager__handleSignificantTimeChangeNotification___block_invoke;
  block[3] = &unk_264795D40;
  block[4] = self;
  dispatch_async(queue, block);
}

void __67__HDHeadphoneDoseManager__handleSignificantTimeChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  double v2 = (os_log_t *)MEMORY[0x263F09910];
  uint64_t v3 = *MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22615C000, v3, OS_LOG_TYPE_DEFAULT, "Starting dose recomputation due to significant time change.", buf, 2u);
  }
  id v5 = *(void **)(a1 + 32);
  id v4 = (os_unfair_lock_s **)(a1 + 32);
  id v6 = [v5 _takeAccessibilityAssertion];
  os_unfair_lock_lock(*v4 + 6);
  id v7 = *v4;
  if (LOBYTE((*v4)[10]._os_unfair_lock_opaque))
  {
    id v20 = 0;
    int v8 = [(os_unfair_lock_s *)v7 _lock_rebuildWithAssertion:v6 error:&v20];
    id v9 = v20;
    id v10 = v9;
    if (v8)
    {
      _HKInitializeLogging();
      os_log_t v11 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = v11;
        uint64_t v13 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        uint64_t v22 = v13;
        _os_log_impl(&dword_22615C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Succesfully rebuilt HAEN dose after significant time change.", buf, 0xCu);
      }
    }
    else
    {
      int v17 = objc_msgSend(v9, "hearing_isExpectedError");
      _HKInitializeLogging();
      os_log_t v18 = *v2;
      uint64_t v19 = *v2;
      if (v17)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          __67__HDHeadphoneDoseManager__handleSignificantTimeChangeNotification___block_invoke_cold_1((uint64_t)v4, v18);
        }
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        __67__HDHeadphoneDoseManager__handleSignificantTimeChangeNotification___block_invoke_cold_2((uint64_t)v4, v18);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    os_log_t v14 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = v14;
      uint64_t v16 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v16;
      _os_log_impl(&dword_22615C000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring significant time change since HAEN is disabled.", buf, 0xCu);
    }
    id v10 = 0;
  }
  os_unfair_lock_unlock(*v4 + 6);
  [v6 invalidate];
}

- (id)unitTesting_profileDidBecomeReadyHandler
{
  return self->_unitTesting_profileDidBecomeReadyHandler;
}

- (void)setUnitTesting_profileDidBecomeReadyHandler:(id)a3
{
}

- (id)unitTesting_didUpdateHandler
{
  return self->_unitTesting_didUpdateHandler;
}

- (void)setUnitTesting_didUpdateHandler:(id)a3
{
}

- (id)unitTesting_didObserveProtectedDataHandler
{
  return self->_unitTesting_didObserveProtectedDataHandler;
}

- (void)setUnitTesting_didObserveProtectedDataHandler:(id)a3
{
}

- (id)unitTesting_didNotifyUser
{
  return self->_unitTesting_didNotifyUser;
}

- (void)setUnitTesting_didNotifyUser:(id)a3
{
}

- (id)unitTesting_protectedDataDidBecomeAvailable
{
  return self->_unitTesting_protectedDataDidBecomeAvailable;
}

- (void)setUnitTesting_protectedDataDidBecomeAvailable:(id)a3
{
}

- (id)unitTesting_didFinishResetDosageToFireDate
{
  return self->_unitTesting_didFinishResetDosageToFireDate;
}

- (void)setUnitTesting_didFinishResetDosageToFireDate:(id)a3
{
}

- (id)unitTesting_updateCurrentDoseNowDateProvider
{
  return self->_unitTesting_updateCurrentDoseNowDateProvider;
}

- (void)setUnitTesting_updateCurrentDoseNowDateProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_updateCurrentDoseNowDateProvider, 0);
  objc_storeStrong(&self->_unitTesting_didFinishResetDosageToFireDate, 0);
  objc_storeStrong(&self->_unitTesting_protectedDataDidBecomeAvailable, 0);
  objc_storeStrong(&self->_unitTesting_didNotifyUser, 0);
  objc_storeStrong(&self->_unitTesting_didObserveProtectedDataHandler, 0);
  objc_storeStrong(&self->_unitTesting_didUpdateHandler, 0);
  objc_storeStrong(&self->_unitTesting_profileDidBecomeReadyHandler, 0);
  objc_storeStrong((id *)&self->_lastLockDateForAnalytics, 0);
  objc_storeStrong((id *)&self->_collectionAssertion, 0);
  objc_storeStrong((id *)&self->_statisticsCalculator, 0);
  objc_storeStrong((id *)&self->_notificationSyncManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)database:protectedDataDidBecomeAvailable:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_22615C000, v3, v4, "[%{public}@] Failed to rebuild 7-Day HAEN dose after device unlock: %@", v5, v6, v7, v8, v9);
}

- (void)database:protectedDataDidBecomeAvailable:.cold.2()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_22615C000, v3, v4, "[%{public}@] Failed to rebuild 7-Day HAEN dose after device unlock: %@", v5, v6, v7, v8, v9);
}

- (void)database:protectedDataDidBecomeAvailable:.cold.3()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_22615C000, v3, v4, "[%{public}@] Unable to fetch shouldRebuild flag for 7-Day HAEN Dose Statistics: %@", v5, v6, v7, v8, v9);
}

- (void)database:protectedDataDidBecomeAvailable:.cold.4()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_22615C000, v3, v4, "[%{public}@] Unable to fetch shouldRebuild flag for 7-Day HAEN Dose Statistics: %@", v5, v6, v7, v8, v9);
}

- (void)database:protectedDataDidBecomeAvailable:.cold.5()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_22615C000, v3, v4, "[%{public}@] Unable to fetch shouldRebuild flag for Previous 7-Day HAEN FireDate: %@", v5, v6, v7, v8, v9);
}

- (void)database:protectedDataDidBecomeAvailable:.cold.6()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_22615C000, v3, v4, "[%{public}@] Unable to fetch shouldRebuild flag for Previous 7-Day HAEN FireDate: %@", v5, v6, v7, v8, v9);
}

void __59__HDHeadphoneDoseManager_samplesOfTypesWereRemoved_anchor___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_22615C000, v3, v4, "[%{public}@] Failed to rebuild 7-Day HAEN dose after discarding HAENs: %@", v5, v6, v7, v8, v9);
}

void __59__HDHeadphoneDoseManager_samplesOfTypesWereRemoved_anchor___block_invoke_cold_2(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_22615C000, v3, v4, "[%{public}@] Failed to rebuild 7-Day HAEN dose after discarding HAENs: %@", v5, v6, v7, v8, v9);
}

- (void)profile:didDiscardSeriesOfType:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_22615C000, v3, v4, "[%{public}@] Failed to rebuild 7-Day HAEN dose after discarding HAE Series: %@", v5, v6, v7, v8, v9);
}

- (void)profile:didDiscardSeriesOfType:.cold.2()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_22615C000, v3, v4, "[%{public}@] Failed to rebuild 7-Day HAEN dose after discarding HAE Series: %@", v5, v6, v7, v8, v9);
}

- (void)_takeAccessibilityAssertion
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22615C000, v3, v4, "%{public}@: unable to take accessibility assertion: %{public}@", v5, v6, v7, v8, 2u);
}

- (void)_lock_updateCurrentDoseUsingStatisticsResult:(uint64_t)a1 assertion:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22615C000, a2, OS_LOG_TYPE_ERROR, "Unable to post 7-Day HAE Notification since feature was disabled: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_lock_updateCurrentDoseUsingStatisticsResult:(uint64_t)a1 assertion:(NSObject *)a2 error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_22615C000, a2, OS_LOG_TYPE_FAULT, "Unable to post 7-Day HAE Notification: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_lock_updateCollectionAssertionForDoseAccumulated:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_error_impl(&dword_22615C000, log, OS_LOG_TYPE_ERROR, "Computed HAE collection interval (%f) is too frequent so using default instead.", (uint8_t *)&v2, 0xCu);
}

- (void)_lock_updateWithRemoteNotificationDismissalDate:assertion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_22615C000, v3, v4, "[%{public}@] Unable to rebuild bucket collection earliest date: %@", v5, v6, v7, v8, v9);
}

void __67__HDHeadphoneDoseManager__handleSignificantTimeChangeNotification___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_22615C000, v3, v4, "[%{public}@] Failed to rebuild HAEN dose after significant time change: %@.", v5, v6, v7, v8, v9);
}

void __67__HDHeadphoneDoseManager__handleSignificantTimeChangeNotification___block_invoke_cold_2(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_22615C000, v3, v4, "[%{public}@] Failed to rebuild HAEN dose after significant time change: %@.", v5, v6, v7, v8, v9);
}

@end