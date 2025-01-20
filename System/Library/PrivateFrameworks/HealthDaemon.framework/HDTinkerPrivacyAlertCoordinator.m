@interface HDTinkerPrivacyAlertCoordinator
- (BOOL)_queue_alarm:(uint64_t)a1 didReceiveDueEvents:(void *)a2;
- (BOOL)_unitTest_didReceiveDueEvents:(id)a3;
- (BOOL)_unitTest_scheduleTransparencyAlertIfRequiredForBirthdate:(id)a3 error:(id *)a4;
- (BOOL)removeAllEventsWithError:(id *)a3;
- (BOOL)scheduleEventIfRequiredForDateComponents:(id)a3 eventIdentifier:(id)a4 error:(id *)a5;
- (HDTinkerPrivacyAlertCoordinator)initWithProfile:(id)a3;
- (NSDate)_unitTest_currentDate;
- (NSDateComponents)_unitTest_scheduledBirthdayTransparencyAlertComponents;
- (id)allScheduledDueDatesWithError:(id *)a3;
- (id)allScheduledEventsWithError:(id *)a3;
- (uint64_t)_queue_scheduleEventIfRequiredForDateComponents:(void *)a3 eventIdentifier:(uint64_t *)a4 error:;
- (uint64_t)_queue_scheduleTransparencyAlertIfRequiredForBirthdate:(uint64_t *)a3 error:;
- (uint64_t)_shouldScheduleTransparencyAlertsWithError:(uint64_t)a1;
- (void)_queue_clearDueEvents:(id)a3;
- (void)_userCharacteristicsDidChangeNotification:(id)a3;
- (void)set_unitTest_currentDate:(id)a3;
@end

@implementation HDTinkerPrivacyAlertCoordinator

- (HDTinkerPrivacyAlertCoordinator)initWithProfile:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HDTinkerPrivacyAlertCoordinator;
  v5 = [(HDTinkerPrivacyAlertCoordinator *)&v19 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = [HDRestorableAlarm alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    uint64_t v11 = [(HDRestorableAlarm *)v9 initWithProfile:WeakRetained clientIdentifier:@"HDTinkerPrivacyAlertCoordinator" eventHandlerQueue:v6->_queue];
    scheduler = v6->_scheduler;
    v6->_scheduler = (HDRestorableAlarm *)v11;

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v6 selector:sel__userCharacteristicsDidChangeNotification_ name:@"HDUserCharacteristicsDidChangeNotification" object:0];

    objc_initWeak(&location, v6);
    v14 = v6->_scheduler;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__HDTinkerPrivacyAlertCoordinator_initWithProfile___block_invoke;
    v16[3] = &unk_1E6301A80;
    objc_copyWeak(&v17, &location);
    [(HDRestorableAlarm *)v14 beginReceivingEventsWithHandler:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __51__HDTinkerPrivacyAlertCoordinator_initWithProfile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  -[HDTinkerPrivacyAlertCoordinator _queue_alarm:didReceiveDueEvents:]((uint64_t)WeakRetained, v5);
}

- (BOOL)_queue_alarm:(uint64_t)a1 didReceiveDueEvents:(void *)a2
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    _HKInitializeLogging();
    id v4 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = NSNumber;
      id v6 = v4;
      objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
      uint64_t v7 = (HDSharedDataPrivacyNotification *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      uint64_t v50 = a1;
      __int16 v51 = 2114;
      v52 = v7;
      __int16 v53 = 2112;
      id v54 = v3;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Received %{public}@ due events: %@ (#t0)", buf, 0x20u);
    }
    v43 = 0;
    id v8 = v3;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:buf count:16];
    if (!v10) {
      goto LABEL_12;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v45;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v45 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v44 + 1) + 8 * v13) eventIdentifier];
        char valid = HDIsValidTinkerEventIdentifier(v14);

        if (valid)
        {

          id v20 = objc_loadWeakRetained((id *)(a1 + 8));
          v21 = [HDKeyValueDomain alloc];
          v22 = [(HDKeyValueDomain *)v21 initWithCategory:100 domainName:*MEMORY[0x1E4F2BDD8] profile:v20];

          uint64_t v23 = *MEMORY[0x1E4F2BDD0];
          id v48 = 0;
          v24 = [(HDKeyValueDomain *)v22 dateForKey:v23 error:&v48];
          id v25 = v48;
          if (v25)
          {
            _HKInitializeLogging();
            v26 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v55 = 138543362;
              *(void *)&v55[4] = v25;
              _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "Error reading sharing disabled date: %{public}@ (#t0)", v55, 0xCu);
            }
          }

          if (v24)
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v43, 100, @"Sharing is disabled (#t0)");
          }
          else if (-[HDTinkerPrivacyAlertCoordinator _shouldScheduleTransparencyAlertsWithError:](a1, (uint64_t)&v43))
          {
            id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
            *(void *)v55 = 0;
            id v17 = [WeakRetained pairedGuardianUserInfoWithError:v55];
            objc_super v19 = (HDSharedDataPrivacyNotification *)*(id *)v55;

            BOOL v18 = v17 != 0;
            if (v17)
            {
              id v28 = objc_loadWeakRetained((id *)(a1 + 8));
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) == 0)
              {
                v41 = [MEMORY[0x1E4F28B00] currentHandler];
                id v42 = objc_loadWeakRetained((id *)(a1 + 8));
                [v41 handleFailureInMethod:sel__queue_showAlertIfRequiredForDueEvents_error_, a1, @"HDTinkerPrivacyAlertCoordinator.m", 152, @"Profile %@ is not an instance of type HDPrimaryProfile (#t0)", v42, v43, (void)v44 object file lineNumber description];
              }
              v30 = [HDNotificationManager alloc];
              id v31 = objc_loadWeakRetained((id *)(a1 + 8));
              v32 = [(HDNotificationManager *)v30 initWithProfile:v31 bundle:1];

              v33 = [HDSharedDataPrivacyNotification alloc];
              v34 = [(HDSharedDataPrivacyNotification *)v17 firstName];
              v35 = [(HDSharedDataPrivacyNotification *)v17 lastName];
              v36 = [(HDSharedDataPrivacyNotification *)v33 initWithNotificationManager:v32 guardianFirstName:v34 lastName:v35];

              [(HDNanoHealthNotification *)v36 triggerNotification];
            }
            else
            {
              objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:underlyingError:", 100, @"Unable to find guardian info (#t0)", v19);
              id v37 = (id)objc_claimAutoreleasedReturnValue();
              if (v37)
              {
                v36 = (HDSharedDataPrivacyNotification *)v37;
                v43 = v36;
                v32 = (HDNotificationManager *)v36;
              }
              else
              {
                v36 = 0;
                v32 = 0;
              }
            }

            goto LABEL_30;
          }
          BOOL v18 = 0;
          goto LABEL_31;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:buf count:16];
      if (v11) {
        continue;
      }
      break;
    }
LABEL_12:

    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Did not any find valid events, not firing alert (#t0)");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      id v17 = (HDSharedDataPrivacyNotification *)v16;
      BOOL v18 = 0;
      v43 = v17;
      objc_super v19 = v17;
    }
    else
    {
      id v17 = 0;
      objc_super v19 = 0;
      BOOL v18 = 0;
    }
LABEL_30:

LABEL_31:
    v38 = v43;
    if (v38)
    {
      _HKInitializeLogging();
      v39 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v50 = a1;
        __int16 v51 = 2114;
        v52 = v38;
        _os_log_error_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_ERROR, "%{public}@ Did not fire alert, error: %{public}@ (#t0)", buf, 0x16u);
      }
    }
    objc_msgSend((id)a1, "_queue_clearDueEvents:", v9);
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (void)_queue_clearDueEvents:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  scheduler = self->_scheduler;
  id v10 = 0;
  BOOL v7 = [(HDRestorableAlarm *)scheduler removeEvents:v5 error:&v10];

  id v8 = v10;
  if (!v7)
  {
    _HKInitializeLogging();
    id v9 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = self;
      __int16 v13 = 2114;
      id v14 = v8;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Error removing events %{public}@ (#t0)", buf, 0x16u);
    }
  }
}

- (BOOL)_unitTest_didReceiveDueEvents:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HDTinkerPrivacyAlertCoordinator__unitTest_didReceiveDueEvents___block_invoke;
  block[3] = &unk_1E62FEE30;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

BOOL __65__HDTinkerPrivacyAlertCoordinator__unitTest_didReceiveDueEvents___block_invoke(uint64_t a1)
{
  BOOL result = -[HDTinkerPrivacyAlertCoordinator _queue_alarm:didReceiveDueEvents:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)allScheduledEventsWithError:(id *)a3
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  objc_super v19 = __Block_byref_object_copy__104;
  id v20 = __Block_byref_object_dispose__104;
  id v21 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__104;
  char v14 = __Block_byref_object_dispose__104;
  id v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__HDTinkerPrivacyAlertCoordinator_allScheduledEventsWithError___block_invoke;
  block[3] = &unk_1E62F9270;
  block[4] = self;
  void block[5] = &v10;
  block[6] = &v16;
  dispatch_sync(queue, block);
  id v5 = (id)v17[5];
  id v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);

  return v7;
}

void __63__HDTinkerPrivacyAlertCoordinator_allScheduledEventsWithError___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 16);
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 allScheduledEventsWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)allScheduledDueDatesWithError:(id *)a3
{
  uint64_t v3 = [(HDTinkerPrivacyAlertCoordinator *)self allScheduledEventsWithError:a3];
  uint64_t v4 = objc_msgSend(v3, "hk_map:", &__block_literal_global_114);

  return v4;
}

uint64_t __65__HDTinkerPrivacyAlertCoordinator_allScheduledDueDatesWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 currentDueDate];
}

- (BOOL)scheduleEventIfRequiredForDateComponents:(id)a3 eventIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__104;
  v26 = __Block_byref_object_dispose__104;
  id v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__HDTinkerPrivacyAlertCoordinator_scheduleEventIfRequiredForDateComponents_eventIdentifier_error___block_invoke;
  block[3] = &unk_1E6301AC8;
  id v20 = &v28;
  block[4] = self;
  id v11 = v8;
  id v18 = v11;
  id v12 = v9;
  id v19 = v12;
  id v21 = &v22;
  dispatch_sync(queue, block);
  id v13 = (id)v23[5];
  char v14 = v13;
  if (v13)
  {
    if (a5) {
      *a5 = v13;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v15 = *((unsigned char *)v29 + 24);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v15;
}

void __98__HDTinkerPrivacyAlertCoordinator_scheduleEventIfRequiredForDateComponents_eventIdentifier_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  uint64_t v4 = (void *)a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  char v6 = -[HDTinkerPrivacyAlertCoordinator _queue_scheduleEventIfRequiredForDateComponents:eventIdentifier:error:](v2, v3, v4, (uint64_t *)&obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
}

- (uint64_t)_queue_scheduleEventIfRequiredForDateComponents:(void *)a3 eventIdentifier:(uint64_t *)a4 error:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (!a1) {
    goto LABEL_8;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  if ((HDIsValidTinkerEventIdentifier(v8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 100, @"Invalid event identifier %@ (#t0)", v8);
LABEL_8:
    uint64_t v12 = 0;
    goto LABEL_9;
  }
  if ((-[HDTinkerPrivacyAlertCoordinator _shouldScheduleTransparencyAlertsWithError:](a1, (uint64_t)a4) & 1) == 0)
  {
    _HKInitializeLogging();
    id v13 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *a4;
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = a1;
      __int16 v19 = 2114;
      uint64_t v20 = v15;
      _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Not scheduling event %{public}@ (#t0)", buf, 0x16u);
    }
    goto LABEL_8;
  }
  id v9 = [*(id *)(a1 + 16) eventWithIdentifier:v8 dueDateComponents:v7 eventOptions:3];
  uint64_t v10 = *(void **)(a1 + 16);
  uint64_t v16 = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  uint64_t v12 = [v10 scheduleEvents:v11 error:a4];

LABEL_9:
  return v12;
}

- (uint64_t)_shouldScheduleTransparencyAlertsWithError:(uint64_t)a1
{
  uint64_t v3 = (id *)(a1 + 8);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  uint64_t v5 = [WeakRetained daemon];
  char v6 = [v5 behavior];
  char v7 = [v6 tinkerModeEnabled];

  if (v7)
  {
    id v8 = objc_loadWeakRetained(v3);
    id v16 = 0;
    id v9 = [v8 pairedGuardianUserInfoWithError:&v16];
    id v10 = v16;

    if (v9
      && ([v9 firstName], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0)
      && (uint64_t v12 = (void *)v11,
          [v9 lastName],
          id v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          v13))
    {
      uint64_t v14 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:underlyingError:", a2, 100, @"Error fetching guardian name (#t0)", v10);
      uint64_t v14 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a2, 100, @"Device not in tinker mode (#t0)");
    return 0;
  }
  return v14;
}

- (uint64_t)_queue_scheduleTransparencyAlertIfRequiredForBirthdate:(uint64_t *)a3 error:
{
  if (!a1) {
    return 0;
  }
  uint64_t v5 = a1[3];
  id v6 = a2;
  dispatch_assert_queue_V2(v5);
  char v7 = [v6 calendar];
  id v8 = [v6 date];

  id v9 = [v7 dateByAddingUnit:4 value:13 toDate:v8 options:0];

  id v10 = [v7 dateByAddingUnit:16 value:1 toDate:v9 options:0];
  uint64_t v11 = objc_msgSend(a1, "_unitTest_currentDate");
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F1C9C8] date];
  }
  uint64_t v14 = v13;

  if (objc_msgSend(v14, "hk_isBeforeDate:", v10))
  {
    uint64_t v15 = [v7 components:30 fromDate:v10];
    [v15 setCalendar:v7];
    id v16 = (void *)a1[5];
    a1[5] = v15;
    id v17 = v15;

    uint64_t v18 = -[HDTinkerPrivacyAlertCoordinator _queue_scheduleEventIfRequiredForDateComponents:eventIdentifier:error:]((uint64_t)a1, v17, @"TinkerPrivacyAlertEventBirthday", a3);
  }
  else
  {
    _HKInitializeLogging();
    __int16 v19 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "User's already passed age limitations, not scheduling alert.", v21, 2u);
    }
    uint64_t v18 = 1;
  }

  return v18;
}

- (void)_userCharacteristicsDidChangeNotification:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__HDTinkerPrivacyAlertCoordinator__userCharacteristicsDidChangeNotification___block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(queue, block);
}

void __77__HDTinkerPrivacyAlertCoordinator__userCharacteristicsDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298B8]];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v4 = [WeakRetained userCharacteristicsManager];
  id v13 = 0;
  uint64_t v5 = [v4 userCharacteristicForType:v2 error:&v13];
  id v6 = v13;

  if (v5)
  {
    char v7 = *(void **)(a1 + 32);
    id v12 = 0;
    char v8 = -[HDTinkerPrivacyAlertCoordinator _queue_scheduleTransparencyAlertIfRequiredForBirthdate:error:](v7, v5, (uint64_t *)&v12);
    id v9 = v12;
    if ((v8 & 1) == 0 && (HKIsUnitTesting() & 1) == 0)
    {
      _HKInitializeLogging();
      id v10 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v9;
        _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "Error scheduling birthdate transparency alert: %{public}@ (#t0)", buf, 0xCu);
      }
    }
  }
  else if ((HKIsUnitTesting() & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v11 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "Could not fetch date of birth components from DB: %{public}@ (#t0)", buf, 0xCu);
    }
  }
}

- (BOOL)removeAllEventsWithError:(id *)a3
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__104;
  uint64_t v18 = __Block_byref_object_dispose__104;
  id v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HDTinkerPrivacyAlertCoordinator_removeAllEventsWithError___block_invoke;
  block[3] = &unk_1E62F9270;
  block[4] = self;
  void block[5] = &v10;
  block[6] = &v14;
  dispatch_async(queue, block);
  id v5 = (id)v15[5];
  id v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v7 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __60__HDTinkerPrivacyAlertCoordinator_removeAllEventsWithError___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 16);
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = [v2 removeAllEventsWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v4;
}

- (BOOL)_unitTest_scheduleTransparencyAlertIfRequiredForBirthdate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__104;
  uint64_t v21 = __Block_byref_object_dispose__104;
  id v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __99__HDTinkerPrivacyAlertCoordinator__unitTest_scheduleTransparencyAlertIfRequiredForBirthdate_error___block_invoke;
  v13[3] = &unk_1E62F93D8;
  id v15 = &v23;
  v13[4] = self;
  id v8 = v6;
  id v14 = v8;
  uint64_t v16 = &v17;
  dispatch_sync(queue, v13);
  id v9 = (id)v18[5];
  uint64_t v10 = v9;
  if (v9)
  {
    if (a4) {
      *a4 = v9;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v11 = *((unsigned char *)v24 + 24);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v11;
}

void __99__HDTinkerPrivacyAlertCoordinator__unitTest_scheduleTransparencyAlertIfRequiredForBirthdate_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = (void *)a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = -[HDTinkerPrivacyAlertCoordinator _queue_scheduleTransparencyAlertIfRequiredForBirthdate:error:](v2, v3, (uint64_t *)&obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
}

- (NSDate)_unitTest_currentDate
{
  return self->__unitTest_currentDate;
}

- (void)set_unitTest_currentDate:(id)a3
{
}

- (NSDateComponents)_unitTest_scheduledBirthdayTransparencyAlertComponents
{
  return self->__unitTest_scheduledBirthdayTransparencyAlertComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__unitTest_scheduledBirthdayTransparencyAlertComponents, 0);
  objc_storeStrong((id *)&self->__unitTest_currentDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end