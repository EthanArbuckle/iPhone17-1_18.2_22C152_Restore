@interface HDHRHealthLiteDataCollector
- (BOOL)_queue_hasHeartRateClientsWithoutWorkouts;
- (BOOL)_queue_shouldStreamReducedRateHeartRateUpdates;
- (HDHRHealthLiteDataCollector)initWithProfile:(id)a3;
- (id)deviceForDataAggregator:(id)a3;
- (id)diagnosticDescription;
- (id)identifierForDataAggregator:(id)a3;
- (id)sourceForDataAggregator:(id)a3;
- (void)_assertionManagerStateChanged:(id)a3;
- (void)_queue_createHealthLiteManager;
- (void)_queue_privacyPreferencesDidChange;
- (void)_queue_updateAllCollectionTypes;
- (void)_queue_updateBradycardiaCollectionType;
- (void)_queue_updateHeartRateCollectionType;
- (void)_queue_updateTachycardiaCollectionType;
- (void)_registerPowerLogEvent:(id)a3;
- (void)_startObservingAssertionManagerChanges;
- (void)_startObservingCurrentWorkoutChanges;
- (void)_workoutManagerStateDidChange;
- (void)daemonReady:(id)a3;
- (void)dataAggregator:(id)a3 wantsCollectionWithConfiguration:(id)a4;
- (void)dealloc;
@end

@implementation HDHRHealthLiteDataCollector

- (HDHRHealthLiteDataCollector)initWithProfile:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HDHRHealthLiteDataCollector;
  v6 = [(HDHRHealthLiteDataCollector *)&v29 init];
  if (v6)
  {
    if (!v5)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, v6, @"HDHRHealthLiteDataCollector.m", 76, @"Invalid parameter not satisfying: %@", @"profile != nil" object file lineNumber description];
    }
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138543362;
      v31 = v10;
      _os_log_impl(&dword_1D3AC6000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Initializing", buf, 0xCu);
    }
    v11 = (const char *)HDDispatchQueueName();
    dispatch_queue_t v12 = dispatch_queue_create(v11, 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v12;

    objc_storeWeak((id *)&v6->_profile, v5);
    v14 = (HKDataCollectorState *)objc_alloc_init(MEMORY[0x1E4F2AEB0]);
    heartRateCollectionState = v6->_heartRateCollectionState;
    v6->_heartRateCollectionState = v14;

    v16 = (HKDataCollectorState *)objc_alloc_init(MEMORY[0x1E4F2AEB0]);
    tachycardiaCollectionState = v6->_tachycardiaCollectionState;
    v6->_tachycardiaCollectionState = v16;

    v18 = (HKDataCollectorState *)objc_alloc_init(MEMORY[0x1E4F2AEB0]);
    bradycardiaCollectionState = v6->_bradycardiaCollectionState;
    v6->_bradycardiaCollectionState = v18;

    v20 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v20 addObject:v6];

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    v22 = [WeakRetained healthDaemon];
    [v22 registerForDaemonReady:v6];

    v6->_heartRateEnabledInPrivacy = HKIsHeartRateEnabled();
    v6->_privacyPreferencesNotificationToken = -1;
    objc_initWeak((id *)buf, v6);
    v23 = (const char *)[ (id) *MEMORY[0x1E4F2BEE0] UTF8String];
    v24 = v6->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __47__HDHRHealthLiteDataCollector_initWithProfile___block_invoke;
    handler[3] = &unk_1E69B46A8;
    objc_copyWeak(&v28, (id *)buf);
    notify_register_dispatch(v23, &v6->_privacyPreferencesNotificationToken, v24, handler);
    [(HDHRHealthLiteDataCollector *)v6 _startObservingCurrentWorkoutChanges];
    [(HDHRHealthLiteDataCollector *)v6 _startObservingAssertionManagerChanges];
    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }

  return v6;
}

void __47__HDHRHealthLiteDataCollector_initWithProfile___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_privacyPreferencesDidChange");
}

- (void)dealloc
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__HDHRHealthLiteDataCollector_dealloc__block_invoke;
  block[3] = &unk_1E69B41B8;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
  [v4 removeObject:self];

  int privacyPreferencesNotificationToken = self->_privacyPreferencesNotificationToken;
  if (privacyPreferencesNotificationToken != -1) {
    notify_cancel(privacyPreferencesNotificationToken);
  }
  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)HDHRHealthLiteDataCollector;
  [(HDHRHealthLiteDataCollector *)&v7 dealloc];
}

uint64_t __38__HDHRHealthLiteDataCollector_dealloc__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "unregisterDataCollector:");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "unregisterDataCollector:");
  v2 = *(void **)(*(void *)(a1 + 32) + 48);

  return objc_msgSend(v2, "unregisterDataCollector:");
}

- (void)daemonReady:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_super v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138543362;
    v15 = v8;
    _os_log_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received daemon ready", buf, 0xCu);
  }
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__HDHRHealthLiteDataCollector_daemonReady___block_invoke;
  v11[3] = &unk_1E69B4578;
  id v12 = v4;
  v13 = self;
  id v10 = v4;
  dispatch_async(queue, v11);
}

uint64_t __43__HDHRHealthLiteDataCollector_daemonReady___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) behavior];
  v3 = [v2 features];
  char v4 = [v3 heartRatePush];

  if ((v4 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    v6 = [WeakRetained dataCollectionManager];
    objc_super v7 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
    uint64_t v8 = [v6 aggregatorForType:v7];
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = *(void **)(v9 + 32);
    *(void *)(v9 + 32) = v8;

    [*(id *)(*(void *)(a1 + 40) + 32) registerDataCollector:*(void *)(a1 + 40) state:*(void *)(*(void *)(a1 + 40) + 80)];
  }
  id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  id v12 = [v11 dataCollectionManager];
  v13 = [MEMORY[0x1E4F2ACB8] tachycardiaType];
  uint64_t v14 = [v12 aggregatorForType:v13];
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  [*(id *)(*(void *)(a1 + 40) + 40) registerDataCollector:*(void *)(a1 + 40) state:*(void *)(*(void *)(a1 + 40) + 88)];
  id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  v18 = [v17 dataCollectionManager];
  v19 = [MEMORY[0x1E4F2ACB8] bradycardiaType];
  uint64_t v20 = [v18 aggregatorForType:v19];
  uint64_t v21 = *(void *)(a1 + 40);
  v22 = *(void **)(v21 + 48);
  *(void *)(v21 + 48) = v20;

  [*(id *)(*(void *)(a1 + 40) + 48) registerDataCollector:*(void *)(a1 + 40) state:*(void *)(*(void *)(a1 + 40) + 96)];
  v23 = *(void **)(a1 + 40);

  return objc_msgSend(v23, "_queue_createHealthLiteManager");
}

- (void)dataAggregator:(id)a3 wantsCollectionWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  uint64_t v8 = *MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEBUG)) {
    -[HDHRHealthLiteDataCollector dataAggregator:wantsCollectionWithConfiguration:]((uint64_t)v6, (uint64_t)v7, v8);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__HDHRHealthLiteDataCollector_dataAggregator_wantsCollectionWithConfiguration___block_invoke;
  block[3] = &unk_1E69B4528;
  id v13 = v6;
  uint64_t v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

uint64_t __79__HDHRHealthLiteDataCollector_dataAggregator_wantsCollectionWithConfiguration___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v3 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(result + 40);
  if (v3 == *(void *)(v2 + 32))
  {
    objc_storeStrong((id *)(v2 + 56), *(id *)(result + 48));
    char v4 = *(void **)(v1 + 40);
    return objc_msgSend(v4, "_queue_updateHeartRateCollectionType");
  }
  else if (v3 == *(void *)(v2 + 40))
  {
    objc_storeStrong((id *)(v2 + 64), *(id *)(result + 48));
    id v5 = *(void **)(v1 + 40);
    return objc_msgSend(v5, "_queue_updateTachycardiaCollectionType");
  }
  else if (v3 == *(void *)(v2 + 48))
  {
    objc_storeStrong((id *)(v2 + 72), *(id *)(result + 48));
    id v6 = *(void **)(v1 + 40);
    return objc_msgSend(v6, "_queue_updateBradycardiaCollectionType");
  }
  return result;
}

- (id)deviceForDataAggregator:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F2AEF8], "localDevice", a3);
}

- (id)sourceForDataAggregator:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F2B560], "_localDeviceSource", a3);
}

- (id)identifierForDataAggregator:(id)a3
{
  return @"HDHRHealthLiteDataCollector";
}

- (void)_queue_updateAllCollectionTypes
{
  [(HDHRHealthLiteDataCollector *)self _queue_updateHeartRateCollectionType];
  [(HDHRHealthLiteDataCollector *)self _queue_updateTachycardiaCollectionType];

  [(HDHRHealthLiteDataCollector *)self _queue_updateBradycardiaCollectionType];
}

- (void)_queue_updateHeartRateCollectionType
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [(HDDataCollectorConfiguration *)self->_heartRateCollectionConfiguration collectionType];
  if (self->_heartRateEnabledInPrivacy) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  if ([(HKDataCollectorState *)self->_heartRateCollectionState collectionType] != v4)
  {
    _HKInitializeLogging();
    id v5 = (void *)*MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      id v7 = objc_opt_class();
      id v8 = v7;
      uint64_t v9 = HKDataCollectionTypeToString();
      id v10 = HKDataCollectionTypeToString();
      int v13 = 138543874;
      uint64_t v14 = v7;
      __int16 v15 = 2114;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Heart rate collection transitioning from %{public}@ to %{public}@", (uint8_t *)&v13, 0x20u);
    }
    id v11 = [(HKDataCollectorState *)self->_heartRateCollectionState cloneWithNewType:v4];
    heartRateCollectionState = self->_heartRateCollectionState;
    self->_heartRateCollectionState = v11;

    [(HDHeartRateDataAggregator *)self->_heartRateAggregator dataCollector:self didChangeState:self->_heartRateCollectionState];
  }
}

- (void)_queue_updateTachycardiaCollectionType
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [(HDDataCollectorConfiguration *)self->_tachycardiaCollectionConfiguration collectionType];
  if ([(HKDataCollectorState *)self->_tachycardiaCollectionState collectionType] != v3)
  {
    _HKInitializeLogging();
    uint64_t v4 = (void *)*MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      tachycardiaCollectionState = self->_tachycardiaCollectionState;
      id v6 = v4;
      [(HKDataCollectorState *)tachycardiaCollectionState collectionType];
      id v7 = HKDataCollectionTypeToString();
      id v8 = HKDataCollectionTypeToString();
      int v11 = 138543618;
      id v12 = v7;
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_DEFAULT, "tachycardia collection transitioning from %{public}@ to %{public}@", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v9 = [(HKDataCollectorState *)self->_tachycardiaCollectionState cloneWithNewType:v3];
    id v10 = self->_tachycardiaCollectionState;
    self->_tachycardiaCollectionState = v9;

    [(HDTachycardiaDataAggregator *)self->_tachycardiaAggregator dataCollector:self didChangeState:self->_tachycardiaCollectionState];
  }
}

- (void)_queue_updateBradycardiaCollectionType
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [(HDDataCollectorConfiguration *)self->_bradycardiaCollectionConfiguration collectionType];
  if ([(HKDataCollectorState *)self->_bradycardiaCollectionState collectionType] != v3)
  {
    _HKInitializeLogging();
    uint64_t v4 = (void *)*MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      bradycardiaCollectionState = self->_bradycardiaCollectionState;
      id v6 = v4;
      [(HKDataCollectorState *)bradycardiaCollectionState collectionType];
      id v7 = HKDataCollectionTypeToString();
      id v8 = HKDataCollectionTypeToString();
      int v11 = 138543618;
      id v12 = v7;
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_DEFAULT, "bradycardia collection transitioning from %{public}@ to %{public}@", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v9 = [(HKDataCollectorState *)self->_bradycardiaCollectionState cloneWithNewType:v3];
    id v10 = self->_bradycardiaCollectionState;
    self->_bradycardiaCollectionState = v9;

    [(HDBradycardiaDataAggregator *)self->_bradycardiaAggregator dataCollector:self didChangeState:self->_bradycardiaCollectionState];
  }
}

- (void)_queue_createHealthLiteManager
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_heartRateEnabledInPrivacy)
  {
    _HKInitializeLogging();
    uint64_t v3 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1D3AC6000, v3, OS_LOG_TYPE_DEFAULT, "heart rate collection is disabled due to privacy", v4, 2u);
    }
  }
}

- (void)_startObservingCurrentWorkoutChanges
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__workoutManagerStateDidChange name:*MEMORY[0x1E4F65A68] object:0];
}

- (void)_workoutManagerStateDidChange
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HDHRHealthLiteDataCollector__workoutManagerStateDidChange__block_invoke;
  block[3] = &unk_1E69B41B8;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __60__HDHRHealthLiteDataCollector__workoutManagerStateDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateHeartRateCollectionType");
}

- (void)_startObservingAssertionManagerChanges
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__assertionManagerStateChanged_ name:*MEMORY[0x1E4F65C68] object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__assertionManagerStateChanged_ name:*MEMORY[0x1E4F65C60] object:0];
}

- (void)_assertionManagerStateChanged:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_assertionManagerStateChanged__onceToken != -1) {
    dispatch_once(&_assertionManagerStateChanged__onceToken, &__block_literal_global_5);
  }
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x1E4F65C58]];

  if ([(id)_assertionManagerStateChanged__relevantAssertionIdentifiers containsObject:v6])
  {
    _HKInitializeLogging();
    id v7 = (void *)*MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      *(_DWORD *)buf = 138543618;
      id v13 = (id)objc_opt_class();
      __int16 v14 = 2114;
      uint64_t v15 = v6;
      id v9 = v13;
      _os_log_impl(&dword_1D3AC6000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating heart rate collection type because assertion changed: %{public}@", buf, 0x16u);
    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__HDHRHealthLiteDataCollector__assertionManagerStateChanged___block_invoke_334;
    block[3] = &unk_1E69B41B8;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

void __61__HDHRHealthLiteDataCollector__assertionManagerStateChanged___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
  uint64_t v1 = HDQueryServerSampleTypeObservationAssertionName();
  uint64_t v2 = objc_msgSend(v0, "setWithObjects:", v1, *MEMORY[0x1E4F659B0], 0);
  id v3 = (void *)_assertionManagerStateChanged__relevantAssertionIdentifiers;
  _assertionManagerStateChanged__relevantAssertionIdentifiers = v2;
}

uint64_t __61__HDHRHealthLiteDataCollector__assertionManagerStateChanged___block_invoke_334(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateHeartRateCollectionType");
}

- (BOOL)_queue_shouldStreamReducedRateHeartRateUpdates
{
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = [WeakRetained workoutManager];
  int v6 = [v5 currentActivityRequiresExtendedMode];

  if (v6
    && (id v7 = objc_loadWeakRetained((id *)p_profile),
        [v7 workoutManager],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isInHeartRateRecovery],
        v8,
        v7,
        (v9 & 1) == 0))
  {
    return ![(HDHRHealthLiteDataCollector *)self _queue_hasHeartRateClientsWithoutWorkouts];
  }
  else
  {
    return 0;
  }
}

- (BOOL)_queue_hasHeartRateClientsWithoutWorkouts
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
  id v4 = HDQueryServerSampleTypeObservationAssertionName();

  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v7 = [WeakRetained sessionAssertionManager];
  id v8 = [v7 ownerIdentifiersForAssertionIdentifier:v4];

  id v9 = objc_loadWeakRetained((id *)p_profile);
  id v10 = [v9 sessionAssertionManager];
  int v11 = [v10 ownerIdentifiersForAssertionIdentifier:*MEMORY[0x1E4F659B0]];

  id v12 = (void *)[v8 mutableCopy];
  [v12 minusSet:v11];
  uint64_t v13 = [v12 count];
  _HKInitializeLogging();
  __int16 v14 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = v14;
    __int16 v17 = HKStringFromBool();
    int v18 = 138412802;
    uint64_t v19 = v17;
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    v23 = v11;
    _os_log_debug_impl(&dword_1D3AC6000, v16, OS_LOG_TYPE_DEBUG, "Workout power saving mode is active, full-fidelity streaming allowed: %@, heart rate clients: %@, workout clients: %@", (uint8_t *)&v18, 0x20u);
  }
  return v13 != 0;
}

- (void)_queue_privacyPreferencesDidChange
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = HKIsHeartRateEnabled();
  if (self->_heartRateEnabledInPrivacy != v3)
  {
    int v4 = v3;
    self->_heartRateEnabledInPrivacy = v3;
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = "disabled";
      if (v4) {
        int v6 = "enabled";
      }
      int v7 = 136315138;
      id v8 = v6;
      _os_log_impl(&dword_1D3AC6000, v5, OS_LOG_TYPE_DEFAULT, "heart rate privacy setting changed to %s", (uint8_t *)&v7, 0xCu);
    }
    [(HDHRHealthLiteDataCollector *)self _queue_updateAllCollectionTypes];
  }
}

- (id)diagnosticDescription
{
  int v3 = NSString;
  if (self->_heartRateEnabledInPrivacy) {
    int v4 = @"YES";
  }
  else {
    int v4 = @"NO";
  }
  [(HKDataCollectorState *)self->_heartRateCollectionState collectionType];
  id v5 = HKDataCollectionTypeToString();
  [(HKDataCollectorState *)self->_tachycardiaCollectionState collectionType];
  int v6 = HKDataCollectionTypeToString();
  [(HKDataCollectorState *)self->_bradycardiaCollectionState collectionType];
  int v7 = HKDataCollectionTypeToString();
  id v8 = [v3 stringWithFormat:@"\nHeart enabled in privacy: %@\nHeart Rate Collection: %@\nTachycardia Collection: %@\nBradycardia Collection: %@", v4, v5, v6, v7];

  return v8;
}

- (void)_registerPowerLogEvent:(id)a3
{
  id v3 = a3;
  _HKInitializeLogging();
  int v4 = *MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEBUG)) {
    -[HDHRHealthLiteDataCollector _registerPowerLogEvent:]((uint64_t)v3, v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceEntity, 0);
  objc_storeStrong((id *)&self->_bradycardiaCollectionState, 0);
  objc_storeStrong((id *)&self->_tachycardiaCollectionState, 0);
  objc_storeStrong((id *)&self->_heartRateCollectionState, 0);
  objc_storeStrong((id *)&self->_bradycardiaCollectionConfiguration, 0);
  objc_storeStrong((id *)&self->_tachycardiaCollectionConfiguration, 0);
  objc_storeStrong((id *)&self->_heartRateCollectionConfiguration, 0);
  objc_storeStrong((id *)&self->_bradycardiaAggregator, 0);
  objc_storeStrong((id *)&self->_tachycardiaAggregator, 0);
  objc_storeStrong((id *)&self->_heartRateAggregator, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_profile);
}

- (void)dataAggregator:(os_log_t)log wantsCollectionWithConfiguration:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1D3AC6000, log, OS_LOG_TYPE_DEBUG, "aggregator %{public}@ wants collection with configuration: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)_registerPowerLogEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  int v3 = @"healthlite_event";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_1D3AC6000, a2, OS_LOG_TYPE_DEBUG, "PowerLog %@: %@", (uint8_t *)&v2, 0x16u);
}

@end