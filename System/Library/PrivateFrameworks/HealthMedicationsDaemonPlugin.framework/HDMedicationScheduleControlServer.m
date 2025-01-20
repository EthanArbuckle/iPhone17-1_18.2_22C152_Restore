@interface HDMedicationScheduleControlServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)taskIdentifier;
- (BOOL)insertMedicationScheduleItems:(id)a3 error:(id *)a4;
- (HDMedicationScheduleControlServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)exportedInterface;
- (id)medicationSchedulesForMedicationIdentifiers:(id)a3 error:(id *)a4;
- (id)remoteInterface;
- (void)remote_deleteSchedule:(id)a3 completion:(id)a4;
- (void)remote_fetchAllSchedulesWithCompletion:(id)a3;
- (void)remote_fetchScheduleWithMedicationIdentifier:(id)a3 completion:(id)a4;
- (void)remote_fetchSchedulesWithMedicationIdentifiers:(id)a3 completion:(id)a4;
- (void)remote_logUnloggedMedicationsWithScheduledItemIdentifier:(id)a3 status:(int64_t)a4 logDate:(id)a5 completion:(id)a6;
- (void)remote_observeMedicationScheduleChanges:(BOOL)a3 completion:(id)a4;
- (void)remote_rescheduleMedicationsWithCompletion:(id)a3;
- (void)remote_saveSchedule:(id)a3 completion:(id)a4;
- (void)remote_saveScheduleItems:(id)a3 completion:(id)a4;
- (void)remote_setTimeZoneTipAsDismissedWithCompletion:(id)a3;
- (void)remote_updateNotificationSent:(BOOL)a3 scheduleItemIdentifier:(id)a4 completion:(id)a5;
- (void)remote_updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes:(BOOL)a3 completion:(id)a4;
- (void)scheduleManager:(id)a3 didAddOrModifySchedules:(id)a4;
- (void)scheduleManager:(id)a3 didPruneScheduleItems:(id)a4;
- (void)scheduleManagerDidRescheduleMedications:(id)a3;
@end

@implementation HDMedicationScheduleControlServer

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[HDMedicationScheduleControlServer alloc] initWithUUID:v13 configuration:v12 client:v11 delegate:v10];

  return v14;
}

- (void)remote_fetchScheduleWithMedicationIdentifier:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, void, id))a4;
  id v7 = a3;
  v8 = [(HDStandardTaskServer *)self profile];
  v9 = [v8 healthMedicationsProfileExtension];
  id v10 = [v9 medicationScheduleManager];

  id v14 = 0;
  id v15 = 0;
  LODWORD(v8) = [v10 medicationSchedule:&v15 medicationIdentifier:v7 error:&v14];

  id v11 = v15;
  id v12 = v14;
  if (v8) {
    id v13 = v11;
  }
  else {
    id v13 = 0;
  }
  ((void (**)(id, id, id))v6)[2](v6, v13, v12);
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F66B38] clientInterface];
}

- (HDMedicationScheduleControlServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)HDMedicationScheduleControlServer;
  result = [(HDStandardTaskServer *)&v7 initWithUUID:a3 configuration:a4 client:a5 delegate:a6];
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    result->_shouldObserveChanges = 0;
  }
  return result;
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F66B38] serverInterface];
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)remote_saveSchedule:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, uint64_t, id))a4;
  id v7 = a3;
  v8 = [(HDStandardTaskServer *)self profile];
  v9 = [v8 healthMedicationsProfileExtension];
  id v10 = [v9 medicationScheduleManager];

  id v13 = 0;
  uint64_t v11 = [v10 insertMedicationSchedule:v7 error:&v13];

  id v12 = v13;
  v6[2](v6, v11, v12);
}

- (void)remote_updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(id, uint64_t, id))a4;
  id v7 = [(HDStandardTaskServer *)self profile];
  v8 = [v7 healthMedicationsProfileExtension];
  v9 = [v8 medicationScheduleManager];

  id v12 = 0;
  uint64_t v10 = [v9 updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes:v4 error:&v12];
  id v11 = v12;
  v6[2](v6, v10, v11);
}

- (void)remote_setTimeZoneTipAsDismissedWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, uint64_t, id))a3;
  v5 = [(HDStandardTaskServer *)self profile];
  v6 = [v5 healthMedicationsProfileExtension];
  id v7 = [v6 medicationScheduleManager];

  id v10 = 0;
  uint64_t v8 = [v7 updateTimeZoneExperienceAsDismissedWithError:&v10];
  id v9 = v10;
  v4[2](v4, v8, v9);
}

- (void)remote_fetchSchedulesWithMedicationIdentifiers:(id)a3 completion:(id)a4
{
  id v9 = 0;
  v6 = (void (**)(id, void *, id))a4;
  id v7 = [(HDMedicationScheduleControlServer *)self medicationSchedulesForMedicationIdentifiers:a3 error:&v9];
  id v8 = v9;
  v6[2](v6, v7, v8);
}

- (void)remote_fetchAllSchedulesWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDStandardTaskServer *)self profile];
  v6 = [v5 healthMedicationsProfileExtension];
  id v7 = [v6 medicationScheduleManager];

  id v10 = 0;
  id v8 = [v7 medicationSchedulesWithError:&v10];
  id v9 = v10;
  v4[2](v4, v8, v9);
}

- (void)remote_deleteSchedule:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, uint64_t, id))a4;
  id v7 = a3;
  id v8 = [(HDStandardTaskServer *)self profile];
  id v9 = [v8 healthMedicationsProfileExtension];
  id v10 = [v9 medicationScheduleManager];

  id v13 = 0;
  uint64_t v11 = [v10 deleteMedicationSchedule:v7 error:&v13];

  id v12 = v13;
  v6[2](v6, v11, v12);
}

- (void)remote_rescheduleMedicationsWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, uint64_t, id))a3;
  v5 = [(HDStandardTaskServer *)self profile];
  v6 = [v5 healthMedicationsProfileExtension];
  id v7 = [v6 medicationScheduleManager];

  id v10 = 0;
  uint64_t v8 = [v7 rescheduleMedicationsWithError:&v10];
  id v9 = v10;
  v4[2](v4, v8, v9);
}

- (void)remote_observeMedicationScheduleChanges:(BOOL)a3 completion:(id)a4
{
  p_lock = &self->_lock;
  id v7 = (void (**)(id, uint64_t, void))a4;
  os_unfair_lock_lock(p_lock);
  self->_shouldObserveChanges = a3;
  uint64_t v8 = [(HDStandardTaskServer *)self profile];
  id v9 = [v8 healthMedicationsProfileExtension];
  id v10 = [v9 medicationScheduleManager];

  if (self->_shouldObserveChanges) {
    [v10 registerObserver:self queue:0];
  }
  else {
    [v10 unregisterObserver:self];
  }
  os_unfair_lock_unlock(p_lock);
  v7[2](v7, 1, 0);
}

- (id)medicationSchedulesForMedicationIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HDStandardTaskServer *)self profile];
  uint64_t v8 = [v7 healthMedicationsProfileExtension];
  id v9 = [v8 medicationScheduleManager];

  id v10 = HDMedicationSchedulePredicateForMedicationIdentifiers((uint64_t)v6);

  uint64_t v11 = [v9 medicationSchedulesWithPredicate:v10 error:a4];

  return v11;
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F66B38] taskIdentifier];
}

- (void)scheduleManagerDidRescheduleMedications:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL shouldObserveChanges = self->_shouldObserveChanges;
  os_unfair_lock_unlock(p_lock);
  if (shouldObserveChanges)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__HDMedicationScheduleControlServer_scheduleManagerDidRescheduleMedications___block_invoke;
    v10[3] = &unk_1E63374C8;
    v10[4] = self;
    id v6 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v10];
    _HKInitializeLogging();
    id v7 = HKLogMedication();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);

    if (v8)
    {
      id v9 = HKLogMedication();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v12 = self;
        _os_log_impl(&dword_1BD54A000, v9, OS_LOG_TYPE_INFO, "%{public}@: Notify client for did reschedule medications", buf, 0xCu);
      }
    }
    objc_msgSend(v6, "client_notifyForDidRescheduleMedications");
  }
}

void __77__HDMedicationScheduleControlServer_scheduleManagerDidRescheduleMedications___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  v3 = HKLogMedication();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __77__HDMedicationScheduleControlServer_scheduleManagerDidRescheduleMedications___block_invoke_cold_1();
  }
}

- (void)scheduleManager:(id)a3 didPruneScheduleItems:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  BOOL shouldObserveChanges = self->_shouldObserveChanges;
  os_unfair_lock_unlock(&self->_lock);
  if (shouldObserveChanges)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__HDMedicationScheduleControlServer_scheduleManager_didPruneScheduleItems___block_invoke;
    v11[3] = &unk_1E63374C8;
    v11[4] = self;
    id v7 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v11];
    _HKInitializeLogging();
    BOOL v8 = HKLogMedication();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

    if (v9)
    {
      id v10 = HKLogMedication();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v13 = self;
        _os_log_impl(&dword_1BD54A000, v10, OS_LOG_TYPE_INFO, "%{public}@: Notify client for didPruneScheduleItems", buf, 0xCu);
      }
    }
    objc_msgSend(v7, "client_notifyForDidPruneSchduleItems:", v5);
  }
}

void __75__HDMedicationScheduleControlServer_scheduleManager_didPruneScheduleItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  v3 = HKLogMedication();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __75__HDMedicationScheduleControlServer_scheduleManager_didPruneScheduleItems___block_invoke_cold_1();
  }
}

- (void)scheduleManager:(id)a3 didAddOrModifySchedules:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  BOOL shouldObserveChanges = self->_shouldObserveChanges;
  os_unfair_lock_unlock(&self->_lock);
  if (shouldObserveChanges)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__HDMedicationScheduleControlServer_scheduleManager_didAddOrModifySchedules___block_invoke;
    v12[3] = &unk_1E63374C8;
    v12[4] = self;
    id v7 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v12];
    _HKInitializeLogging();
    BOOL v8 = HKLogMedication();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

    if (v9)
    {
      id v10 = HKLogMedication();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = [v5 count];
        *(_DWORD *)buf = 138543618;
        uint64_t v14 = self;
        __int16 v15 = 2048;
        uint64_t v16 = v11;
        _os_log_impl(&dword_1BD54A000, v10, OS_LOG_TYPE_INFO, "%{public}@: Notify client for didAddOrModifySchedules %ld", buf, 0x16u);
      }
    }
    objc_msgSend(v7, "client_notifyForAddOrModifySchedules:", v5);
  }
}

void __77__HDMedicationScheduleControlServer_scheduleManager_didAddOrModifySchedules___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  v3 = HKLogMedication();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __77__HDMedicationScheduleControlServer_scheduleManager_didAddOrModifySchedules___block_invoke_cold_1();
  }
}

- (void)remote_saveScheduleItems:(id)a3 completion:(id)a4
{
  id v9 = 0;
  id v6 = (void (**)(id, BOOL, id))a4;
  BOOL v7 = [(HDMedicationScheduleControlServer *)self insertMedicationScheduleItems:a3 error:&v9];
  id v8 = v9;
  v6[2](v6, v7, v8);
}

- (BOOL)insertMedicationScheduleItems:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(HDStandardTaskServer *)self profile];
  id v8 = [v7 database];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__HDMedicationScheduleControlServer_insertMedicationScheduleItems_error___block_invoke;
  v11[3] = &unk_1E6336E90;
  id v12 = v6;
  id v9 = v6;
  LOBYTE(a4) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v8 error:a4 block:v11];

  return (char)a4;
}

uint64_t __73__HDMedicationScheduleControlServer_insertMedicationScheduleItems_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = +[HDMedicationScheduleItemEntity insertMedicationScheduleItem:transaction:error:](HDMedicationScheduleItemEntity, "insertMedicationScheduleItem:transaction:error:", *(void *)(*((void *)&v14 + 1) + 8 * v10), v5, a3, (void)v14);

        if (!v11)
        {
          uint64_t v12 = 0;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 1;
LABEL_11:

  return v12;
}

- (void)remote_updateNotificationSent:(BOOL)a3 scheduleItemIdentifier:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v8 = (void (**)(id, uint64_t, id))a5;
  id v9 = a4;
  uint64_t v10 = [(HDStandardTaskServer *)self profile];
  uint64_t v11 = [v10 healthMedicationsProfileExtension];
  uint64_t v12 = [v11 medicationScheduleManager];

  id v15 = 0;
  uint64_t v13 = [v12 updateNotificationSent:v6 scheduleItemIdentifier:v9 error:&v15];

  id v14 = v15;
  v8[2](v8, v13, v14);
}

- (void)remote_logUnloggedMedicationsWithScheduledItemIdentifier:(id)a3 status:(int64_t)a4 logDate:(id)a5 completion:(id)a6
{
  uint64_t v10 = (void (**)(id, uint64_t, id))a6;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = [(HDStandardTaskServer *)self profile];
  id v14 = [v13 healthMedicationsProfileExtension];
  id v15 = [v14 medicationScheduleManager];

  id v18 = 0;
  uint64_t v16 = [v15 logUnloggedDoseEventsForScheduledItemIdentifier:v12 status:a4 logDate:v11 error:&v18];

  id v17 = v18;
  v10[2](v10, v16, v17);
}

void __77__HDMedicationScheduleControlServer_scheduleManagerDidRescheduleMedications___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "%{public}@: Unable to notify client for did reschedule medications: %{public}@");
}

void __75__HDMedicationScheduleControlServer_scheduleManager_didPruneScheduleItems___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "%{public}@: Unable to notify client for didPruneScheduleItems: %{public}@");
}

void __77__HDMedicationScheduleControlServer_scheduleManager_didAddOrModifySchedules___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "%{public}@: Unable to notify client for didAddOrModifySchedules: %{public}@");
}

@end