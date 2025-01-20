@interface HDMedicationsWidgetSchedulingManager
+ (BOOL)_deviceRequiresInvalidationForWidgetRelevance;
+ (id)_reloadReasonsStringForReasons:(id)a3;
+ (id)defaultMedicationsWidgetRelevanceController;
+ (id)defaultMedicationsWidgetTimelineControllerForProfile:(id)a3;
- (HDMedicationsWidgetSchedulingManager)initWithProfile:(id)a3;
- (id)unitTesting_didInvalidateRelevancesHandler;
- (void)_invalidateRelevancesWithReason:(id)a3;
- (void)_queue_reloadWidgets;
- (void)_reloadWidgetIfNecessaryWithDoseEvents:(id)a3;
- (void)_runReloadOperationForReason:(int64_t)a3;
- (void)_startObservingMedicationChanges;
- (void)_stopObservingMedicationChanges;
- (void)dealloc;
- (void)profileDidBecomeReady:(id)a3;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4;
- (void)scheduleManager:(id)a3 didAddOrModifySchedules:(id)a4;
- (void)scheduleManager:(id)a3 didPruneScheduleItems:(id)a4;
- (void)scheduleManagerDidRescheduleMedications:(id)a3;
- (void)setUnitTesting_didInvalidateRelevancesHandler:(id)a3;
@end

@implementation HDMedicationsWidgetSchedulingManager

- (HDMedicationsWidgetSchedulingManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HDMedicationsWidgetSchedulingManager;
  v5 = [(HDMedicationsWidgetSchedulingManager *)&v20 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    queue_reloadReasons = v6->_queue_reloadReasons;
    v6->_queue_reloadReasons = v9;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    [WeakRetained registerProfileReadyObserver:v6 queue:v6->_queue];

    objc_initWeak(&location, v6);
    id v12 = objc_alloc(MEMORY[0x1E4F2B8C8]);
    v13 = v6->_queue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__HDMedicationsWidgetSchedulingManager_initWithProfile___block_invoke;
    v17[3] = &unk_1E6337200;
    objc_copyWeak(&v18, &location);
    uint64_t v14 = [v12 initWithMode:0 clock:1 queue:v13 delay:v17 block:1.0];
    reloadOperation = v6->_reloadOperation;
    v6->_reloadOperation = (_HKDelayedOperation *)v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __56__HDMedicationsWidgetSchedulingManager_initWithProfile___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_reloadWidgets");
}

- (void)dealloc
{
  [(HDMedicationsWidgetSchedulingManager *)self _stopObservingMedicationChanges];
  v3.receiver = self;
  v3.super_class = (Class)HDMedicationsWidgetSchedulingManager;
  [(HDMedicationsWidgetSchedulingManager *)&v3 dealloc];
}

+ (id)defaultMedicationsWidgetTimelineControllerForProfile:(id)a3
{
  id v3 = a3;
  id v4 = [v3 daemon];
  v5 = [v4 behavior];

  int v6 = [v5 isAppleWatch];
  uint64_t v7 = (id *)MEMORY[0x1E4F66A88];
  if (!v6) {
    uint64_t v7 = (id *)MEMORY[0x1E4F66A80];
  }
  id v8 = *v7;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v9 = (void *)getCHSTimelineControllerClass_softClass;
  uint64_t v18 = getCHSTimelineControllerClass_softClass;
  if (!getCHSTimelineControllerClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getCHSTimelineControllerClass_block_invoke;
    v14[3] = &unk_1E63386E0;
    v14[4] = &v15;
    __getCHSTimelineControllerClass_block_invoke((uint64_t)v14);
    v9 = (void *)v16[3];
  }
  v10 = v9;
  _Block_object_dispose(&v15, 8);
  id v11 = [v10 alloc];
  id v12 = (void *)[v11 initWithExtensionBundleIdentifier:v8 kind:*MEMORY[0x1E4F66A90]];

  return v12;
}

+ (id)defaultMedicationsWidgetRelevanceController
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getCHSWidgetServiceClass_softClass;
  uint64_t v10 = getCHSWidgetServiceClass_softClass;
  if (!getCHSWidgetServiceClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getCHSWidgetServiceClass_block_invoke;
    v6[3] = &unk_1E63386E0;
    v6[4] = &v7;
    __getCHSWidgetServiceClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = [v3 sharedWidgetService];
  return v4;
}

- (void)profileDidBecomeReady:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  id v4 = HKLogMedication();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = (id)objc_opt_class();
    id v5 = v11;
    _os_log_impl(&dword_1BD54A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] profileDidBecomeReady", buf, 0xCu);
  }
  [(HDMedicationsWidgetSchedulingManager *)self _startObservingMedicationChanges];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v7 = [WeakRetained database];
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__HDMedicationsWidgetSchedulingManager_profileDidBecomeReady___block_invoke;
  v9[3] = &unk_1E63374A0;
  v9[4] = self;
  [v7 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:queue block:v9];
}

uint64_t __62__HDMedicationsWidgetSchedulingManager_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = HKLogMedication();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v3 = v6;
    _os_log_impl(&dword_1BD54A000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] first unlock occurred", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) _runReloadOperationForReason:0];
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogMedication();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = self;
    _os_log_impl(&dword_1BD54A000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] dose event samples added", (uint8_t *)&v7, 0xCu);
  }

  [(HDMedicationsWidgetSchedulingManager *)self _reloadWidgetIfNecessaryWithDoseEvents:v5];
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F2B1F8];
  id v6 = a3;
  int v7 = [v5 medicationDoseEventType];
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
    _HKInitializeLogging();
    uint64_t v9 = HKLogMedication();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = self;
      _os_log_impl(&dword_1BD54A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] dose event samples removed", (uint8_t *)&v10, 0xCu);
    }

    [(HDMedicationsWidgetSchedulingManager *)self _runReloadOperationForReason:2];
  }
}

- (void)scheduleManagerDidRescheduleMedications:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v4 = HKLogMedication();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl(&dword_1BD54A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] medications rescheduled", (uint8_t *)&v5, 0xCu);
  }

  [(HDMedicationsWidgetSchedulingManager *)self _runReloadOperationForReason:3];
}

- (void)scheduleManager:(id)a3 didPruneScheduleItems:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  int v5 = HKLogMedication();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    uint64_t v7 = self;
    _os_log_impl(&dword_1BD54A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] medication schedules pruned", (uint8_t *)&v6, 0xCu);
  }

  [(HDMedicationsWidgetSchedulingManager *)self _runReloadOperationForReason:4];
}

- (void)scheduleManager:(id)a3 didAddOrModifySchedules:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  int v5 = HKLogMedication();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    uint64_t v7 = self;
    _os_log_impl(&dword_1BD54A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] medication schedules added or updated", (uint8_t *)&v6, 0xCu);
  }

  [(HDMedicationsWidgetSchedulingManager *)self _runReloadOperationForReason:5];
}

- (void)_startObservingMedicationChanges
{
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  int v5 = [WeakRetained dataManager];
  int v6 = [MEMORY[0x1E4F2B1F8] medicationDoseEventType];
  [v5 addObserver:self forDataType:v6];

  id v9 = objc_loadWeakRetained((id *)p_profile);
  uint64_t v7 = [v9 healthMedicationsProfileExtension];
  uint64_t v8 = [v7 medicationScheduleManager];
  [v8 registerObserver:self queue:0];
}

- (void)_stopObservingMedicationChanges
{
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  int v5 = [WeakRetained dataManager];
  int v6 = [MEMORY[0x1E4F2B1F8] medicationDoseEventType];
  [v5 removeObserver:self forDataType:v6];

  id v9 = objc_loadWeakRetained((id *)p_profile);
  uint64_t v7 = [v9 healthMedicationsProfileExtension];
  uint64_t v8 = [v7 medicationScheduleManager];
  [v8 unregisterObserver:self];
}

- (void)_runReloadOperationForReason:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__HDMedicationsWidgetSchedulingManager__runReloadOperationForReason___block_invoke;
  v4[3] = &unk_1E6337278;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __69__HDMedicationsWidgetSchedulingManager__runReloadOperationForReason___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 40)];
  [v2 addObject:v3];

  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  return [v4 execute];
}

- (void)_queue_reloadWidgets
{
  id v3 = (id)objc_opt_class();
  int v10 = [a2 description];
  OUTLINED_FUNCTION_1_1(&dword_1BD54A000, v4, v5, "[%{public}@] error while trying to reload widget: %@", v6, v7, v8, v9, 2u);
}

+ (id)_reloadReasonsStringForReasons:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 allObjects];
  uint64_t v5 = [v4 sortedArrayUsingSelector:sel_compare_];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"medications ["];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__HDMedicationsWidgetSchedulingManager__reloadReasonsStringForReasons___block_invoke;
  v9[3] = &unk_1E6338668;
  id v10 = v3;
  id v7 = v3;
  objc_msgSend(v6, "hk_appendComponentsJoinedByString:container:componentGenerator:", @", ", v5, v9);
  [v6 appendString:@"]"];

  return v6;
}

id __71__HDMedicationsWidgetSchedulingManager__reloadReasonsStringForReasons___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 integerValue];
  id v5 = [NSString alloc];
  uint64_t v6 = HDStringFromMedicationsWidgetSchedulingManagerReloadReason(v4);
  uint64_t v7 = [*(id *)(a1 + 32) countForObject:v3];

  uint64_t v8 = (void *)[v5 initWithFormat:@"%@: %d", v6, v7];
  return v8;
}

- (void)_reloadWidgetIfNecessaryWithDoseEvents:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  uint64_t v6 = [v4 currentCalendar];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__HDMedicationsWidgetSchedulingManager__reloadWidgetIfNecessaryWithDoseEvents___block_invoke;
  v15[3] = &unk_1E6338690;
  id v7 = v6;
  id v16 = v7;
  int v8 = objc_msgSend(v5, "hk_containsObjectPassingTest:", v15);

  _HKInitializeLogging();
  uint64_t v9 = HKLogMedication();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      id v11 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v11;
      id v12 = v11;
      _os_log_impl(&dword_1BD54A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] recent dose events detected scheduling reload", buf, 0xCu);
    }
    [(HDMedicationsWidgetSchedulingManager *)self _runReloadOperationForReason:1];
  }
  else
  {
    if (v10)
    {
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v13;
      id v14 = v13;
      _os_log_impl(&dword_1BD54A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] no recent dose events detected skipping reload", buf, 0xCu);
    }
  }
}

unint64_t __79__HDMedicationsWidgetSchedulingManager__reloadWidgetIfNecessaryWithDoseEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v3 startDate];
    if ([v4 isDateInToday:v5])
    {
      LODWORD(v6) = 1;
    }
    else
    {
      unint64_t v6 = *(void *)(a1 + 32);
      id v7 = [v3 endDate];
      LODWORD(v6) = [(id)v6 isDateInToday:v7];
    }
    if ([v3 logOrigin] == 2) {
      unint64_t v6 = v6;
    }
    else {
      unint64_t v6 = 0;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (void)_invalidateRelevancesWithReason:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  unint64_t v6 = [WeakRetained healthMedicationsProfileExtension];
  id v7 = [v6 createMedicationsWidgetRelevanceController];

  uint64_t v8 = *MEMORY[0x1E4F66A90];
  uint64_t v9 = *MEMORY[0x1E4F2A268];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__HDMedicationsWidgetSchedulingManager__invalidateRelevancesWithReason___block_invoke;
  v11[3] = &unk_1E63386B8;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v7 invalidateRelevancesOfKind:v8 inBundle:v9 completion:v11];
}

void __72__HDMedicationsWidgetSchedulingManager__invalidateRelevancesWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x1C187D5B0](*(void *)(*(void *)(a1 + 32) + 40));
  id v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, *(void *)(a1 + 40), v3);
  }
  _HKInitializeLogging();
  unint64_t v6 = HKLogMedication();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __72__HDMedicationsWidgetSchedulingManager__invalidateRelevancesWithReason___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = (id)objc_opt_class();
    id v8 = v10;
    _os_log_impl(&dword_1BD54A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully invalidated relevances", (uint8_t *)&v9, 0xCu);
  }
}

+ (BOOL)_deviceRequiresInvalidationForWidgetRelevance
{
  v2 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v3 = [v2 isAppleWatch];

  return v3;
}

- (id)unitTesting_didInvalidateRelevancesHandler
{
  return self->_unitTesting_didInvalidateRelevancesHandler;
}

- (void)setUnitTesting_didInvalidateRelevancesHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didInvalidateRelevancesHandler, 0);
  objc_storeStrong((id *)&self->_reloadOperation, 0);
  objc_storeStrong((id *)&self->_queue_reloadReasons, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

void __72__HDMedicationsWidgetSchedulingManager__invalidateRelevancesWithReason___block_invoke_cold_1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_1_1(&dword_1BD54A000, v1, v2, "[%{public}@] error invalidating relevances: %{public}@", v3, v4, v5, v6, 2u);
}

@end