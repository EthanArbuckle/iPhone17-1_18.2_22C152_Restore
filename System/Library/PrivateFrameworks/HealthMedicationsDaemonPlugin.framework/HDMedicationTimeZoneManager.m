@interface HDMedicationTimeZoneManager
- (BOOL)_isAuthorizedToFireTimeZoneNotificationWithProfile:(id)a3;
- (BOOL)_updateTimeZoneExperienceAsEnabled:(BOOL)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)_updateTimeZoneOffsetOffset:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDMedicationTimeZoneManager)initWithProfile:(id)a3;
- (id)_mostRecentTimeZoneOffsetWithProfile:(id)a3;
- (id)unitTestingAuthorizedToFireTimeZoneNotificationHandler;
- (id)unitTestingNotificationFiringHandler;
- (id)unitTestingOperationDetectionHandler;
- (void)_performTimeZoneDetectionOperationOrJournalWithProfile:(uint64_t)a3 motive:;
- (void)handleTimeZoneChange;
- (void)profileDidBecomeReady:(id)a3;
- (void)scheduleManager:(id)a3 didAddOrModifySchedules:(id)a4;
- (void)setUnitTestingAuthorizedToFireTimeZoneNotificationHandler:(id)a3;
- (void)setUnitTestingNotificationFiringHandler:(id)a3;
- (void)setUnitTestingOperationDetectionHandler:(id)a3;
@end

@implementation HDMedicationTimeZoneManager

- (HDMedicationTimeZoneManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDMedicationTimeZoneManager;
  v5 = [(HDMedicationTimeZoneManager *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = [v4 daemon];
    v8 = [v7 behavior];
    int v9 = objc_msgSend(v8, "hkmd_supportsTimeZone");

    if (v9)
    {
      uint64_t v10 = HKCreateSerialDispatchQueue();
      queue = v6->_queue;
      v6->_queue = (OS_dispatch_queue *)v10;

      id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
      [WeakRetained registerProfileReadyObserver:v6 queue:v6->_queue];
    }
  }

  return v6;
}

- (void)handleTimeZoneChange
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = HKLogMedication();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1BD54A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Time zone changed", (uint8_t *)&v5, 0xCu);
  }

  [MEMORY[0x1E4F1CAF0] resetSystemTimeZone];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  -[HDMedicationTimeZoneManager _performTimeZoneDetectionOperationOrJournalWithProfile:motive:]((uint64_t)self, WeakRetained, 1);
}

- (void)_performTimeZoneDetectionOperationOrJournalWithProfile:(uint64_t)a3 motive:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v5 = a2;
    v6 = [[HDMedicationTimeZoneDetectionOperation alloc] initWithMotive:a3];
    id v14 = 0;
    uint64_t v7 = [(HDJournalableOperation *)v6 performOrJournalWithProfile:v5 error:&v14];

    id v8 = v14;
    int v9 = (void (**)(void, void, void, void, void))MEMORY[0x1C187D5B0](*(void *)(a1 + 32));
    if (v9) {
      ((void (**)(void, uint64_t, BOOL, uint64_t, id))v9)[2](v9, v7, [(HDJournalableOperation *)v6 didJournal], a3, v8);
    }
    _HKInitializeLogging();
    uint64_t v10 = HKLogMedication();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (a3 == 2)
      {
        v11 = @"Schedule Change";
      }
      else if (a3 == 1)
      {
        v11 = @"TimeZone Change";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%d)", a3);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;
      v13 = HKStringFromBool();

      *(_DWORD *)buf = 138544130;
      uint64_t v16 = a1;
      __int16 v17 = 2114;
      v18 = v11;
      __int16 v19 = 2114;
      v20 = v13;
      __int16 v21 = 2114;
      id v22 = v8;
      _os_log_impl(&dword_1BD54A000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]: TimeZone operation ran with motive: '%{public}@' and returned result: '%{public}@ error: '%{public}@'", buf, 0x2Au);
    }
  }
}

- (BOOL)_isAuthorizedToFireTimeZoneNotificationWithProfile:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MEMORY[0x1C187D5B0](self->_unitTestingAuthorizedToFireTimeZoneNotificationHandler);
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v10 = [v4 healthMedicationsProfileExtension];
    id v8 = [v10 medicationUserDefaults];

    v11 = [v8 objectForKey:*MEMORY[0x1E4F66A50]];
    int v9 = v11;
    if (v11 && ([v11 BOOLValue] & 1) == 0)
    {
      _HKInitializeLogging();
      id v14 = HKLogMedication();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543362;
        v18 = self;
        v15 = "[%{public}@]: Should not fire timezone alert. Setting toggle off";
        goto LABEL_12;
      }
    }
    else
    {
      v12 = [v4 notificationManager];
      char v13 = [v12 areHealthNotificationsAuthorized];

      if (v13)
      {
        char v7 = 1;
        goto LABEL_14;
      }
      _HKInitializeLogging();
      id v14 = HKLogMedication();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543362;
        v18 = self;
        v15 = "[%{public}@]: Should not fire timezone alert. Health notifications not authorized.";
LABEL_12:
        _os_log_impl(&dword_1BD54A000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v17, 0xCu);
      }
    }

    char v7 = 0;
    goto LABEL_14;
  }
  char v7 = (*(uint64_t (**)(uint64_t))(v5 + 16))(v5);
  _HKInitializeLogging();
  id v8 = HKLogMedication();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = HKStringFromBool();
    int v17 = 138543618;
    v18 = self;
    __int16 v19 = 2114;
    v20 = v9;
    _os_log_impl(&dword_1BD54A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Unit testing. Handler returned value: '%{public}@'", (uint8_t *)&v17, 0x16u);
LABEL_14:
  }
  return v7;
}

- (BOOL)_updateTimeZoneOffsetOffset:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v6 = (void *)MEMORY[0x1E4F65B28];
  p_profile = &self->_profile;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  uint64_t v10 = objc_msgSend(v6, "hdmd_timeZoneDomainWithProfile:", WeakRetained);

  [v10 setNumber:v8 forKey:*MEMORY[0x1E4F66A68] error:a5];
  v11 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(a5) = [v10 setDate:v11 forKey:*MEMORY[0x1E4F66A60] error:a5];

  return (char)a5;
}

- (BOOL)_updateTimeZoneExperienceAsEnabled:(BOOL)a3 transaction:(id)a4 error:(id *)a5
{
  BOOL v5 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  char v7 = (void *)MEMORY[0x1E4F65B28];
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v10 = objc_msgSend(v7, "hdmd_timeZoneDomainWithProfile:", WeakRetained);

  _HKInitializeLogging();
  v11 = HKLogMedication();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = HKStringFromBool();
    *(_DWORD *)buf = 138543618;
    v32 = self;
    __int16 v33 = 2114;
    v34 = v12;
  }
  char v13 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
  uint64_t v14 = *MEMORY[0x1E4F66A40];
  id v29 = 0;
  [v10 setNumber:v13 forKey:v14 error:&v29];
  id v15 = v29;

  if (v15)
  {
    _HKInitializeLogging();
    uint64_t v16 = HKLogMedication();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationTimeZoneManager _updateTimeZoneExperienceAsEnabled:transaction:error:]();
    }
  }
  else
  {
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F44628], "hkmd_requestForTimeZoneNotification");
    if (v5)
    {
      _HKInitializeLogging();
      int v17 = HKLogMedication();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [v16 content];
        __int16 v19 = [v18 title];
        *(_DWORD *)buf = 138543618;
        v32 = self;
        __int16 v33 = 2114;
        v34 = v19;
        _os_log_impl(&dword_1BD54A000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Will post notification request: %{public}@", buf, 0x16u);
      }
      uint64_t v20 = MEMORY[0x1C187D5B0](self->_unitTestingNotificationFiringHandler);
      id v21 = (id)v20;
      if (v20) {
        (*(void (**)(uint64_t, NSObject *))(v20 + 16))(v20, v16);
      }
      id v22 = objc_loadWeakRetained((id *)p_profile);
      uint64_t v23 = [v22 notificationManager];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __84__HDMedicationTimeZoneManager__updateTimeZoneExperienceAsEnabled_transaction_error___block_invoke;
      v28[3] = &unk_1E6337EB8;
      v28[4] = self;
      [v23 postNotificationWithRequest:v16 completion:v28];
    }
    else
    {
      id v21 = objc_loadWeakRetained((id *)p_profile);
      v24 = [v21 notificationManager];
      v25 = [v16 identifier];
      v30 = v25;
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
      [v24 removeDeliveredNotificationsWithIdentifiers:v26];
    }
  }

  return v15 == 0;
}

void __84__HDMedicationTimeZoneManager__updateTimeZoneExperienceAsEnabled_transaction_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogMedication();
  char v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1BD54A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Did successfully post timezone changed notification", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __84__HDMedicationTimeZoneManager__updateTimeZoneExperienceAsEnabled_transaction_error___block_invoke_cold_1(a1, (uint64_t)v5, v7);
  }
}

- (id)_mostRecentTimeZoneOffsetWithProfile:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F65B28];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = objc_msgSend(v3, "hdmd_timeZoneDomainWithProfile:", WeakRetained);

  v6 = [v5 numberForKey:*MEMORY[0x1E4F66A68] error:0];

  return v6;
}

- (void)profileDidBecomeReady:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained healthMedicationsProfileExtension];
  id v5 = [v4 medicationScheduleManager];
  [v5 registerObserver:self queue:self->_queue];
}

- (void)scheduleManager:(id)a3 didAddOrModifySchedules:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v5 = HKLogMedication();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    uint64_t v8 = self;
    _os_log_impl(&dword_1BD54A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: schedules modified re-evaluating our timezone tile status.", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  -[HDMedicationTimeZoneManager _performTimeZoneDetectionOperationOrJournalWithProfile:motive:]((uint64_t)self, WeakRetained, 2);
}

- (id)unitTestingAuthorizedToFireTimeZoneNotificationHandler
{
  return self->_unitTestingAuthorizedToFireTimeZoneNotificationHandler;
}

- (void)setUnitTestingAuthorizedToFireTimeZoneNotificationHandler:(id)a3
{
}

- (id)unitTestingOperationDetectionHandler
{
  return self->_unitTestingOperationDetectionHandler;
}

- (void)setUnitTestingOperationDetectionHandler:(id)a3
{
}

- (id)unitTestingNotificationFiringHandler
{
  return self->_unitTestingNotificationFiringHandler;
}

- (void)setUnitTestingNotificationFiringHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTestingNotificationFiringHandler, 0);
  objc_storeStrong(&self->_unitTestingOperationDetectionHandler, 0);
  objc_storeStrong(&self->_unitTestingAuthorizedToFireTimeZoneNotificationHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_updateTimeZoneExperienceAsEnabled:transaction:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
}

void __84__HDMedicationTimeZoneManager__updateTimeZoneExperienceAsEnabled_transaction_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_1BD54A000, a2, a3, "[%{public}@]: Failed to post timezone changed notification request error:%{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end