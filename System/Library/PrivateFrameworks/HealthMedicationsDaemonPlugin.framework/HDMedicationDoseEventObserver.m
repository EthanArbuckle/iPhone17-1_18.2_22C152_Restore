@interface HDMedicationDoseEventObserver
- (BOOL)_rescheduleIfNecessaryWithDoseEvents:(id)a3;
- (HDMedicationDoseEventObserver)initWithProfile:(id)a3;
- (HDMedicationDoseEventObserver)initWithProfile:(id)a3 notificationSyncManager:(id)a4;
- (id)samplesAddedDidRecheduleHandler;
- (void)_logDoseEventSamplesAdded:(id)a3 anchor:(id)a4;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4;
- (void)setSamplesAddedDidRecheduleHandler:(id)a3;
@end

@implementation HDMedicationDoseEventObserver

- (HDMedicationDoseEventObserver)initWithProfile:(id)a3
{
  id v4 = a3;
  v5 = [v4 healthMedicationsProfileExtension];
  v6 = [v5 medicationNotificationSyncManager];
  v7 = [(HDMedicationDoseEventObserver *)self initWithProfile:v4 notificationSyncManager:v6];

  return v7;
}

- (HDMedicationDoseEventObserver)initWithProfile:(id)a3 notificationSyncManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDMedicationDoseEventObserver;
  v8 = [(HDMedicationDoseEventObserver *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeStrong((id *)&v9->_notificationSyncManager, a4);
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_profile);
    v11 = [WeakRetained dataManager];
    v12 = [MEMORY[0x1E4F2B1F8] medicationDoseEventType];
    [v11 addObserver:v9 forDataType:v12];
  }
  return v9;
}

- (BOOL)_rescheduleIfNecessaryWithDoseEvents:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v4 = objc_msgSend(a3, "hk_containsObjectPassingTest:", &__block_literal_global_16);
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v6 = [WeakRetained healthMedicationsProfileExtension];
    id v7 = [v6 medicationScheduleManager];

    [v7 rescheduleMedicationsSynchronously:0];
  }
  else
  {
    _HKInitializeLogging();
    v8 = HKLogMedication();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      v11 = self;
      _os_log_impl(&dword_1BD54A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Samples added are of not schduled doses. Skipping reschedule.", (uint8_t *)&v10, 0xCu);
    }
  }
  return v4;
}

BOOL __70__HDMedicationDoseEventObserver__rescheduleIfNecessaryWithDoseEvents___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 logOrigin] == 2 && objc_msgSend(v2, "status") != 1;

  return v3;
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  v8 = HKLogMedication();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    int v10 = HKLogMedication();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v23 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      *(_DWORD *)buf = 138543874;
      v26 = self;
      __int16 v27 = 2114;
      v28 = v23;
      __int16 v29 = 2114;
      id v30 = v7;
      _os_log_debug_impl(&dword_1BD54A000, v10, OS_LOG_TYPE_DEBUG, "[%{public}@] %{public}@ new samples added. anchor: %{public}@", buf, 0x20u);
    }
  }
  [(HDMedicationDoseEventObserver *)self _logDoseEventSamplesAdded:v6 anchor:v7];
  BOOL v11 = [(HDMedicationDoseEventObserver *)self _rescheduleIfNecessaryWithDoseEvents:v6];
  samplesAddedDidRecheduleHandler = (void (**)(id, BOOL))self->_samplesAddedDidRecheduleHandler;
  if (samplesAddedDidRecheduleHandler) {
    samplesAddedDidRecheduleHandler[2](samplesAddedDidRecheduleHandler, v11);
  }
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v15 = [WeakRetained syncIdentityManager];
  v16 = [v15 currentSyncIdentity];
  v17 = [v16 entity];
  uint64_t v18 = [v17 persistentID];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __53__HDMedicationDoseEventObserver_samplesAdded_anchor___block_invoke;
  v24[3] = &__block_descriptor_40_e31_B16__0__HKMedicationDoseEvent_8l;
  v24[4] = v18;
  if (objc_msgSend(v6, "hk_containsObjectPassingTest:", v24))
  {
    [(HDMedicationNotificationSyncManager *)self->_notificationSyncManager doseEventsAdded:v6];
    v19 = (void *)[[NSString alloc] initWithFormat:@"%@ observed medication samples added", objc_opt_class()];
    id v20 = objc_loadWeakRetained((id *)p_profile);
    v21 = [v20 healthMedicationsProfileExtension];
    v22 = [v21 medicationSyncRequester];
    [v22 requestSyncsWithReason:v19];
  }
}

BOOL __53__HDMedicationDoseEventObserver_samplesAdded_anchor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = objc_msgSend(v3, "hd_dataOriginProvenance");
  BOOL v5 = [v4 syncIdentity] == *(void *)(a1 + 32) && objc_msgSend(v3, "status") != 1;

  return v5;
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  v8 = HKLogMedication();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    int v10 = HKLogMedication();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      *(_DWORD *)buf = 138544130;
      v22 = self;
      __int16 v23 = 2114;
      v24 = v20;
      __int16 v25 = 2114;
      id v26 = v6;
      __int16 v27 = 2114;
      id v28 = v7;
      _os_log_debug_impl(&dword_1BD54A000, v10, OS_LOG_TYPE_DEBUG, "[%{public}@] %{public}@ samples of types removed: %{public}@. anchor: %{public}@", buf, 0x2Au);
    }
  }
  BOOL v11 = [MEMORY[0x1E4F2B1F8] medicationDoseEventType];
  int v12 = [v6 containsObject:v11];

  if (v12)
  {
    _HKInitializeLogging();
    v13 = HKLogMedication();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);

    if (v14)
    {
      v15 = HKLogMedication();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v22 = self;
        _os_log_impl(&dword_1BD54A000, v15, OS_LOG_TYPE_INFO, "[%{public}@] dose event samples removed, requesting sync", buf, 0xCu);
      }
    }
    v16 = (void *)[[NSString alloc] initWithFormat:@"%@ observed medication samples removed", objc_opt_class()];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v18 = [WeakRetained healthMedicationsProfileExtension];
    v19 = [v18 medicationSyncRequester];
    [v19 requestSyncsWithReason:v16];
  }
}

- (void)_logDoseEventSamplesAdded:(id)a3 anchor:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ((unint64_t)[v6 count] <= 9)
  {
    [v8 appendFormat:@"["];
    objc_msgSend(v8, "hk_appendComponentsJoinedByString:container:componentGenerator:", @", ", v6, &__block_literal_global_322);
    [v8 appendFormat:@"]"];
  }
  _HKInitializeLogging();
  BOOL v9 = HKLogMedication();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138544130;
    BOOL v11 = self;
    __int16 v12 = 2048;
    uint64_t v13 = [v6 count];
    __int16 v14 = 2114;
    id v15 = v7;
    __int16 v16 = 2114;
    id v17 = v8;
    _os_log_impl(&dword_1BD54A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] %ld dose event samples added. anchor: %{public}@ %{public}@", (uint8_t *)&v10, 0x2Au);
  }
}

id __66__HDMedicationDoseEventObserver__logDoseEventSamplesAdded_anchor___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 UUID];
  id v3 = objc_msgSend(v2, "hk_shortRepresentation");

  return v3;
}

- (id)samplesAddedDidRecheduleHandler
{
  return self->_samplesAddedDidRecheduleHandler;
}

- (void)setSamplesAddedDidRecheduleHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_samplesAddedDidRecheduleHandler, 0);
  objc_storeStrong((id *)&self->_notificationSyncManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end