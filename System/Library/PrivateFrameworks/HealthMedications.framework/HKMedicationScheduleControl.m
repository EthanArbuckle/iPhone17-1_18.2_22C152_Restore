@interface HKMedicationScheduleControl
+ (id)clientInterface;
+ (id)serverInterface;
+ (id)taskIdentifier;
- (BOOL)_synchronouslyRegisterToObserveMedicationScheduleChangesWithError:(id *)a3;
- (HKMedicationScheduleControl)initWithHealthStore:(id)a3;
- (id)exportedInterface;
- (id)remoteInterface;
- (id)unitTesting_didChangeObserverRegistration;
- (void)_callUnitTestHookObserving:(BOOL)a3 success:(BOOL)a4 error:(id)a5;
- (void)_handleAutomaticProxyReconnection;
- (void)_notifyObserversAboutReconnect;
- (void)_observeMedicationScheduleChanges:(BOOL)a3 completion:(id)a4;
- (void)_registerFirstObserver;
- (void)_unregisterLastObserver;
- (void)client_notifyForAddOrModifySchedules:(id)a3;
- (void)client_notifyForDidPruneSchduleItems:(id)a3;
- (void)client_notifyForDidRescheduleMedications;
- (void)deleteSchedule:(id)a3 completion:(id)a4;
- (void)fetchAllSchedulesWithCompletion:(id)a3;
- (void)fetchScheduleWithMedicationIdentifier:(id)a3 completion:(id)a4;
- (void)fetchSchedulesWithMedicationIdentifiers:(id)a3 completion:(id)a4;
- (void)logUnloggedDoseEventsForScheduledItemIdentifier:(id)a3 status:(int64_t)a4 logDate:(id)a5 completion:(id)a6;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)rescheduleMedicationsWithCompletion:(id)a3;
- (void)saveSchedule:(id)a3 completion:(id)a4;
- (void)saveScheduleItems:(id)a3 completion:(id)a4;
- (void)setTimeZoneTipAsDismissedWithCompletion:(id)a3;
- (void)setUnitTesting_didChangeObserverRegistration:(id)a3;
- (void)unitTest_noOpWithCompletion:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateNotificationSent:(BOOL)a3 scheduleItemIdentifier:(id)a4 completion:(id)a5;
- (void)updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes:(BOOL)a3 completion:(id)a4;
@end

@implementation HKMedicationScheduleControl

- (HKMedicationScheduleControl)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HKMedicationScheduleControl;
  v5 = [(HKMedicationScheduleControl *)&v24 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F2B608]);
    v7 = [(id)objc_opt_class() taskIdentifier];
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 taskUUID:v8];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v9;

    objc_initWeak(&location, v5);
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __51__HKMedicationScheduleControl_initWithHealthStore___block_invoke;
    v21 = &unk_1E62EB068;
    objc_copyWeak(&v22, &location);
    [(HKTaskServerProxyProvider *)v5->_proxyProvider setAutomaticProxyReconnectionHandler:&v18];
    -[HKTaskServerProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 1, v18, v19, v20, v21);
    id v11 = objc_alloc_init(MEMORY[0x1E4F2B600]);
    [(HKTaskServerProxyProvider *)v5->_proxyProvider setTaskConfiguration:v11];

    id v12 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v13 = NSStringFromProtocol((Protocol *)&unk_1F172ACD0);
    v14 = HKLogMedication();
    uint64_t v15 = [v12 initWithName:v13 loggingCategory:v14];
    observers = v5->_observers;
    v5->_observers = (HKMedicationScheduleControlObserver *)v15;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)fetchScheduleWithMedicationIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__HKMedicationScheduleControl_fetchScheduleWithMedicationIdentifier_completion___block_invoke;
  v14[3] = &unk_1E62EB090;
  id v15 = v6;
  id v16 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__HKMedicationScheduleControl_fetchScheduleWithMedicationIdentifier_completion___block_invoke_2;
  v11[3] = &unk_1E62EB0B8;
  v11[4] = self;
  id v12 = v15;
  id v13 = v16;
  id v9 = v16;
  id v10 = v15;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v14 errorHandler:v11];
}

+ (id)clientInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F171B5F8];
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
  [v2 setClasses:v3 forSelector:sel_client_notifyForDidPruneSchduleItems_ argumentIndex:0 ofReply:0];

  id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
  [v2 setClasses:v4 forSelector:sel_client_notifyForAddOrModifySchedules_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)serverInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F172AD30];
  id v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_saveScheduleItems_completion_, 0, 0);
  id v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_fetchAllSchedulesWithCompletion_, 0, 1);
  id v5 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_fetchSchedulesWithMedicationIdentifiers_completion_, 0, 1);

  return v2;
}

uint64_t __80__HKMedicationScheduleControl_fetchScheduleWithMedicationIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchScheduleWithMedicationIdentifier:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (id)remoteInterface
{
  v2 = objc_opt_class();

  return (id)[v2 serverInterface];
}

- (id)exportedInterface
{
  v2 = objc_opt_class();

  return (id)[v2 clientInterface];
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

void __51__HKMedicationScheduleControl_initWithHealthStore___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleAutomaticProxyReconnection];
}

- (void)saveSchedule:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__HKMedicationScheduleControl_saveSchedule_completion___block_invoke;
  v14[3] = &unk_1E62EB090;
  id v15 = v6;
  id v16 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__HKMedicationScheduleControl_saveSchedule_completion___block_invoke_2;
  v11[3] = &unk_1E62EB0B8;
  v11[4] = self;
  id v12 = v15;
  id v13 = v16;
  id v9 = v16;
  id v10 = v15;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v14 errorHandler:v11];
}

uint64_t __55__HKMedicationScheduleControl_saveSchedule_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_saveSchedule:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __55__HKMedicationScheduleControl_saveSchedule_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogMedication();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __55__HKMedicationScheduleControl_saveSchedule_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes:(BOOL)a3 completion:(id)a4
{
  id v6 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __105__HKMedicationScheduleControl_updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes_completion___block_invoke;
  v11[3] = &unk_1E62EB0E0;
  BOOL v13 = a3;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __105__HKMedicationScheduleControl_updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes_completion___block_invoke_2;
  v9[3] = &unk_1E62EB108;
  v9[4] = self;
  id v10 = v12;
  id v8 = v12;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __105__HKMedicationScheduleControl_updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes:completion:", *(unsigned __int8 *)(a1 + 40), *(void *)(a1 + 32));
}

void __105__HKMedicationScheduleControl_updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogMedication();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __105__HKMedicationScheduleControl_updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setTimeZoneTipAsDismissedWithCompletion:(id)a3
{
  id v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__HKMedicationScheduleControl_setTimeZoneTipAsDismissedWithCompletion___block_invoke;
  v9[3] = &unk_1E62EB130;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__HKMedicationScheduleControl_setTimeZoneTipAsDismissedWithCompletion___block_invoke_2;
  v7[3] = &unk_1E62EB108;
  v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __71__HKMedicationScheduleControl_setTimeZoneTipAsDismissedWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setTimeZoneTipAsDismissedWithCompletion:", *(void *)(a1 + 32));
}

void __71__HKMedicationScheduleControl_setTimeZoneTipAsDismissedWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogMedication();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__HKMedicationScheduleControl_setTimeZoneTipAsDismissedWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __80__HKMedicationScheduleControl_fetchScheduleWithMedicationIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogMedication();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __80__HKMedicationScheduleControl_fetchScheduleWithMedicationIdentifier_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchSchedulesWithMedicationIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__HKMedicationScheduleControl_fetchSchedulesWithMedicationIdentifiers_completion___block_invoke;
  v14[3] = &unk_1E62EB090;
  id v15 = v6;
  id v16 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__HKMedicationScheduleControl_fetchSchedulesWithMedicationIdentifiers_completion___block_invoke_2;
  v11[3] = &unk_1E62EB0B8;
  void v11[4] = self;
  id v12 = v15;
  id v13 = v16;
  id v9 = v16;
  id v10 = v15;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v14 errorHandler:v11];
}

uint64_t __82__HKMedicationScheduleControl_fetchSchedulesWithMedicationIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSchedulesWithMedicationIdentifiers:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __82__HKMedicationScheduleControl_fetchSchedulesWithMedicationIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogMedication();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __82__HKMedicationScheduleControl_fetchSchedulesWithMedicationIdentifiers_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchAllSchedulesWithCompletion:(id)a3
{
  id v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__HKMedicationScheduleControl_fetchAllSchedulesWithCompletion___block_invoke;
  v9[3] = &unk_1E62EB130;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__HKMedicationScheduleControl_fetchAllSchedulesWithCompletion___block_invoke_2;
  v7[3] = &unk_1E62EB108;
  v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __63__HKMedicationScheduleControl_fetchAllSchedulesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAllSchedulesWithCompletion:", *(void *)(a1 + 32));
}

void __63__HKMedicationScheduleControl_fetchAllSchedulesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogMedication();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__HKMedicationScheduleControl_fetchAllSchedulesWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deleteSchedule:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__HKMedicationScheduleControl_deleteSchedule_completion___block_invoke;
  v14[3] = &unk_1E62EB090;
  id v15 = v6;
  id v16 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__HKMedicationScheduleControl_deleteSchedule_completion___block_invoke_2;
  v11[3] = &unk_1E62EB0B8;
  void v11[4] = self;
  id v12 = v15;
  id v13 = v16;
  id v9 = v16;
  id v10 = v15;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v14 errorHandler:v11];
}

uint64_t __57__HKMedicationScheduleControl_deleteSchedule_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteSchedule:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __57__HKMedicationScheduleControl_deleteSchedule_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogMedication();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __57__HKMedicationScheduleControl_deleteSchedule_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)saveScheduleItems:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__HKMedicationScheduleControl_saveScheduleItems_completion___block_invoke;
  v14[3] = &unk_1E62EB090;
  id v15 = v6;
  id v16 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__HKMedicationScheduleControl_saveScheduleItems_completion___block_invoke_2;
  v11[3] = &unk_1E62EB0B8;
  void v11[4] = self;
  id v12 = v15;
  id v13 = v16;
  id v9 = v16;
  id v10 = v15;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v14 errorHandler:v11];
}

uint64_t __60__HKMedicationScheduleControl_saveScheduleItems_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_saveScheduleItems:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __60__HKMedicationScheduleControl_saveScheduleItems_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogMedication();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__HKMedicationScheduleControl_saveScheduleItems_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)updateNotificationSent:(BOOL)a3 scheduleItemIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__HKMedicationScheduleControl_updateNotificationSent_scheduleItemIdentifier_completion___block_invoke;
  v16[3] = &unk_1E62EB158;
  BOOL v19 = a3;
  id v17 = v8;
  id v18 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__HKMedicationScheduleControl_updateNotificationSent_scheduleItemIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E62EB0B8;
  v13[4] = self;
  id v14 = v17;
  id v15 = v18;
  id v11 = v18;
  id v12 = v17;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v16 errorHandler:v13];
}

uint64_t __88__HKMedicationScheduleControl_updateNotificationSent_scheduleItemIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateNotificationSent:scheduleItemIdentifier:completion:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __88__HKMedicationScheduleControl_updateNotificationSent_scheduleItemIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogMedication();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __88__HKMedicationScheduleControl_updateNotificationSent_scheduleItemIdentifier_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)rescheduleMedicationsWithCompletion:(id)a3
{
  id v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__HKMedicationScheduleControl_rescheduleMedicationsWithCompletion___block_invoke;
  v9[3] = &unk_1E62EB130;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HKMedicationScheduleControl_rescheduleMedicationsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E62EB108;
  v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __67__HKMedicationScheduleControl_rescheduleMedicationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_rescheduleMedicationsWithCompletion:", *(void *)(a1 + 32));
}

void __67__HKMedicationScheduleControl_rescheduleMedicationsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogMedication();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __67__HKMedicationScheduleControl_rescheduleMedicationsWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)logUnloggedDoseEventsForScheduledItemIdentifier:(id)a3 status:(int64_t)a4 logDate:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a6];
  proxyProvider = self->_proxyProvider;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __105__HKMedicationScheduleControl_logUnloggedDoseEventsForScheduledItemIdentifier_status_logDate_completion___block_invoke;
  v19[3] = &unk_1E62EB180;
  int64_t v23 = a4;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __105__HKMedicationScheduleControl_logUnloggedDoseEventsForScheduledItemIdentifier_status_logDate_completion___block_invoke_2;
  v17[3] = &unk_1E62EB108;
  v17[4] = self;
  id v18 = v22;
  id v14 = v22;
  id v15 = v11;
  id v16 = v10;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v19 errorHandler:v17];
}

uint64_t __105__HKMedicationScheduleControl_logUnloggedDoseEventsForScheduledItemIdentifier_status_logDate_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_logUnloggedMedicationsWithScheduledItemIdentifier:status:logDate:completion:", a1[4], a1[7], a1[5], a1[6]);
}

void __105__HKMedicationScheduleControl_logUnloggedDoseEventsForScheduledItemIdentifier_status_logDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogMedication();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __105__HKMedicationScheduleControl_logUnloggedDoseEventsForScheduledItemIdentifier_status_logDate_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  observers = self->_observers;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__HKMedicationScheduleControl_registerObserver_queue___block_invoke;
  v5[3] = &unk_1E62EAFB0;
  v5[4] = self;
  [(HKMedicationScheduleControlObserver *)observers registerObserver:a3 queue:a4 runIfFirstObserver:v5];
}

uint64_t __54__HKMedicationScheduleControl_registerObserver_queue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerFirstObserver];
}

- (void)unregisterObserver:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__HKMedicationScheduleControl_unregisterObserver___block_invoke;
  v4[3] = &unk_1E62EAFB0;
  v4[4] = self;
  [(HKMedicationScheduleControlObserver *)observers unregisterObserver:a3 runIfLastObserver:v4];
}

uint64_t __50__HKMedicationScheduleControl_unregisterObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unregisterLastObserver];
}

- (void)_handleAutomaticProxyReconnection
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2(&dword_1BCB4A000, a2, a3, "[%{public}@] Failed to resume observation on server reconnection: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)_notifyObserversAboutReconnect
{
}

uint64_t __61__HKMedicationScheduleControl__notifyObserversAboutReconnect__block_invoke(uint64_t a1, void *a2)
{
  return [a2 scheduleControlDidRescheduleItems];
}

- (void)_registerFirstObserver
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __53__HKMedicationScheduleControl__registerFirstObserver__block_invoke;
  v2[3] = &unk_1E62EB1C8;
  v2[4] = self;
  [(HKMedicationScheduleControl *)self _observeMedicationScheduleChanges:1 completion:v2];
}

void __53__HKMedicationScheduleControl__registerFirstObserver__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = HKLogMedication();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __53__HKMedicationScheduleControl__registerFirstObserver__block_invoke_cold_1();
    }
  }
  [*(id *)(a1 + 32) _callUnitTestHookObserving:1 success:a2 error:v5];
}

- (void)_unregisterLastObserver
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__HKMedicationScheduleControl__unregisterLastObserver__block_invoke;
  v2[3] = &unk_1E62EB1C8;
  v2[4] = self;
  [(HKMedicationScheduleControl *)self _observeMedicationScheduleChanges:0 completion:v2];
}

void __54__HKMedicationScheduleControl__unregisterLastObserver__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = HKLogMedication();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);

    if (v7)
    {
      id v8 = HKLogMedication();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v10 = 138543618;
        uint64_t v11 = v9;
        __int16 v12 = 2114;
        id v13 = v5;
        _os_log_impl(&dword_1BCB4A000, v8, OS_LOG_TYPE_INFO, "%{public}@: Error unregistering observer: %{public}@", (uint8_t *)&v10, 0x16u);
      }
    }
  }
  [*(id *)(a1 + 32) _callUnitTestHookObserving:0 success:a2 error:v5];
}

- (void)_observeMedicationScheduleChanges:(BOOL)a3 completion:(id)a4
{
  id v6 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__HKMedicationScheduleControl__observeMedicationScheduleChanges_completion___block_invoke;
  v11[3] = &unk_1E62EB0E0;
  BOOL v13 = a3;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__HKMedicationScheduleControl__observeMedicationScheduleChanges_completion___block_invoke_2;
  v9[3] = &unk_1E62EB1F0;
  id v10 = v12;
  id v8 = v12;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __76__HKMedicationScheduleControl__observeMedicationScheduleChanges_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_observeMedicationScheduleChanges:completion:", *(unsigned __int8 *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __76__HKMedicationScheduleControl__observeMedicationScheduleChanges_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_synchronouslyRegisterToObserveMedicationScheduleChangesWithError:(id *)a3
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__0;
  id v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __97__HKMedicationScheduleControl__synchronouslyRegisterToObserveMedicationScheduleChangesWithError___block_invoke;
  v10[3] = &unk_1E62EB240;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __97__HKMedicationScheduleControl__synchronouslyRegisterToObserveMedicationScheduleChangesWithError___block_invoke_3;
  v9[3] = &unk_1E62EB268;
  void v9[4] = &v11;
  [(HKTaskServerProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
  id v5 = (id)v12[5];
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

  char v7 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __97__HKMedicationScheduleControl__synchronouslyRegisterToObserveMedicationScheduleChangesWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __97__HKMedicationScheduleControl__synchronouslyRegisterToObserveMedicationScheduleChangesWithError___block_invoke_2;
  v3[3] = &unk_1E62EB218;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_observeMedicationScheduleChanges:completion:", 1, v3);
}

void __97__HKMedicationScheduleControl__synchronouslyRegisterToObserveMedicationScheduleChangesWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __97__HKMedicationScheduleControl__synchronouslyRegisterToObserveMedicationScheduleChangesWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)_callUnitTestHookObserving:(BOOL)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v10 = a5;
  uint64_t v8 = MEMORY[0x1C18793D0](self->_unitTesting_didChangeObserverRegistration);
  uint64_t v9 = (void *)v8;
  if (v8) {
    (*(void (**)(uint64_t, BOOL, BOOL, id))(v8 + 16))(v8, v6, v5, v10);
  }
}

- (void)client_notifyForDidRescheduleMedications
{
}

uint64_t __71__HKMedicationScheduleControl_client_notifyForDidRescheduleMedications__block_invoke(uint64_t a1, void *a2)
{
  return [a2 scheduleControlDidRescheduleItems];
}

- (void)client_notifyForDidPruneSchduleItems:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__HKMedicationScheduleControl_client_notifyForDidPruneSchduleItems___block_invoke;
  v7[3] = &unk_1E62EB2B0;
  id v8 = v4;
  uint64_t v9 = sel_scheduleControl_didDeleteScheduleItems_;
  v7[4] = self;
  id v6 = v4;
  [(HKMedicationScheduleControlObserver *)observers notifyObservers:v7];
}

void __68__HKMedicationScheduleControl_client_notifyForDidPruneSchduleItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 scheduleControl:*(void *)(a1 + 32) didDeleteScheduleItems:*(void *)(a1 + 40)];
  }
}

- (void)client_notifyForAddOrModifySchedules:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__HKMedicationScheduleControl_client_notifyForAddOrModifySchedules___block_invoke;
  v7[3] = &unk_1E62EB2D8;
  id v8 = v4;
  uint64_t v9 = sel_scheduleControl_didAddOrModifySchedules_;
  v7[4] = self;
  id v6 = v4;
  [(HKMedicationScheduleControlObserver *)observers notifyObservers:v7];
}

void __68__HKMedicationScheduleControl_client_notifyForAddOrModifySchedules___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 scheduleControl:*(void *)(a1 + 32) didAddOrModifySchedules:*(void *)(a1 + 40)];
  }
}

- (void)unitTest_noOpWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v4];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__HKMedicationScheduleControl_unitTest_noOpWithCompletion___block_invoke;
  v11[3] = &unk_1E62EB130;
  id v12 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__HKMedicationScheduleControl_unitTest_noOpWithCompletion___block_invoke_2;
  v9[3] = &unk_1E62EB1F0;
  id v10 = v5;
  id v7 = v5;
  id v8 = v4;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __59__HKMedicationScheduleControl_unitTest_noOpWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_unitTesting_createTaskServerNoOpWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __59__HKMedicationScheduleControl_unitTest_noOpWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)unitTesting_didChangeObserverRegistration
{
  return self->_unitTesting_didChangeObserverRegistration;
}

- (void)setUnitTesting_didChangeObserverRegistration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didChangeObserverRegistration, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __55__HKMedicationScheduleControl_saveSchedule_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  v1 = [*(id *)(v0 + 40) medicationIdentifier];
  v2 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_1BCB4A000, v3, v4, "[%{public}@] Error when inserting schedule for medication with identifier %{public}@: %{public}@", v5, v6, v7, v8, 2u);
}

void __105__HKMedicationScheduleControl_updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BCB4A000, v0, v1, "[%{public}@] Error when updating schedules to local time zone: %{public}@");
}

void __71__HKMedicationScheduleControl_setTimeZoneTipAsDismissedWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BCB4A000, v0, v1, "[%{public}@] Error when dismissing timezone tile %{public}@");
}

void __80__HKMedicationScheduleControl_fetchScheduleWithMedicationIdentifier_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(v0);
  os_log_t v1 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_1BCB4A000, v2, v3, "[%{public}@] Error when querying schedule for medication with identifier %{public}@: %{public}@", v4, v5, v6, v7, 2u);
}

void __82__HKMedicationScheduleControl_fetchSchedulesWithMedicationIdentifiers_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(v0);
  os_log_t v1 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_1BCB4A000, v2, v3, "[%{public}@] Error when querying schedules for medications with identifiers %{public}@: %{public}@", v4, v5, v6, v7, 2u);
}

void __63__HKMedicationScheduleControl_fetchAllSchedulesWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BCB4A000, v0, v1, "[%{public}@] Error when querying all schedules: %{public}@");
}

void __57__HKMedicationScheduleControl_deleteSchedule_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  os_log_t v1 = [*(id *)(v0 + 40) medicationIdentifier];
  uint64_t v2 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_1BCB4A000, v3, v4, "[%{public}@] Error when deleting schedule with medication identifier: %{public}@ error: %{public}@", v5, v6, v7, v8, 2u);
}

void __60__HKMedicationScheduleControl_saveScheduleItems_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(v0);
  os_log_t v1 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_1BCB4A000, v2, v3, "[%{public}@] Error when inserting scheduleItems %{public}@ error %{public}@", v4, v5, v6, v7, 2u);
}

void __88__HKMedicationScheduleControl_updateNotificationSent_scheduleItemIdentifier_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(v0);
  os_log_t v1 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_1BCB4A000, v2, v3, "[%{public}@] Error when updating scheduleItem with identifier %{public}@: %{public}@", v4, v5, v6, v7, 2u);
}

void __67__HKMedicationScheduleControl_rescheduleMedicationsWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BCB4A000, v0, v1, "[%{public}@] Error when rescheduling medications: %{public}@");
}

void __105__HKMedicationScheduleControl_logUnloggedDoseEventsForScheduledItemIdentifier_status_logDate_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BCB4A000, v0, v1, "[%{public}@] Error when logging scheduled unlogged medications: %{public}@");
}

void __53__HKMedicationScheduleControl__registerFirstObserver__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BCB4A000, v0, v1, "%{public}@: Error registering observer: %{public}@");
}

@end