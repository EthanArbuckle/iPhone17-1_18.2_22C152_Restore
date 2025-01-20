@interface HKMedicationExposableDoseEventControl
+ (id)clientInterface;
+ (id)serverInterface;
- (HKHealthStore)healthStore;
- (HKMedicationExposableDoseEventControl)init;
- (HKMedicationExposableDoseEventControl)initWithHealthStore:(id)a3;
- (HKTaskServerProxyProvider)proxyProvider;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)deleteDoseEventWithPersistentUUID:(id)a3 completion:(id)a4;
- (void)doseEventsForDateInterval:(id)a3 medicationIdentifier:(id)a4 completion:(id)a5;
- (void)setHealthStore:(id)a3;
- (void)setProxyProvider:(id)a3;
- (void)unitTest_noOpWithCompletion:(id)a3;
- (void)writeDoseEvents:(id)a3 completion:(id)a4;
@end

@implementation HKMedicationExposableDoseEventControl

- (HKMedicationExposableDoseEventControl)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKMedicationExposableDoseEventControl)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKMedicationExposableDoseEventControl;
  v6 = [(HKMedicationExposableDoseEventControl *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    id v8 = objc_alloc(MEMORY[0x1E4F2B608]);
    healthStore = v7->_healthStore;
    v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v8 initWithHealthStore:healthStore taskIdentifier:@"HKMedicationExposableDoseEventControlServerIdentifier" exportedObject:v7 taskUUID:v10];
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v11;

    [(HKTaskServerProxyProvider *)v7->_proxyProvider setShouldRetryOnInterruption:0];
  }

  return v7;
}

- (void)doseEventsForDateInterval:(id)a3 medicationIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HKMedicationExposableDoseEventControl.m", 50, @"Invalid parameter not satisfying: %@", @"dateInterval != nil" object file lineNumber description];
  }
  v12 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:v11];

  proxyProvider = self->_proxyProvider;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __99__HKMedicationExposableDoseEventControl_doseEventsForDateInterval_medicationIdentifier_completion___block_invoke;
  v20[3] = &unk_1E62EB3E8;
  id v21 = v9;
  id v22 = v10;
  id v23 = v12;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __99__HKMedicationExposableDoseEventControl_doseEventsForDateInterval_medicationIdentifier_completion___block_invoke_2;
  v18[3] = &unk_1E62EB1F0;
  id v19 = v23;
  id v14 = v23;
  id v15 = v10;
  id v16 = v9;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v20 errorHandler:v18];
}

uint64_t __99__HKMedicationExposableDoseEventControl_doseEventsForDateInterval_medicationIdentifier_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_doseEventsForDateInterval:medicationIdentifier:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __99__HKMedicationExposableDoseEventControl_doseEventsForDateInterval_medicationIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)writeDoseEvents:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HKMedicationExposableDoseEventControl.m", 61, @"Invalid parameter not satisfying: %@", @"doseEvents != nil" object file lineNumber description];
  }
  id v9 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v8];

  proxyProvider = self->_proxyProvider;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__HKMedicationExposableDoseEventControl_writeDoseEvents_completion___block_invoke;
  v16[3] = &unk_1E62EB410;
  id v17 = v7;
  id v18 = v9;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__HKMedicationExposableDoseEventControl_writeDoseEvents_completion___block_invoke_2;
  v14[3] = &unk_1E62EB1F0;
  id v15 = v18;
  id v11 = v18;
  id v12 = v7;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v16 errorHandler:v14];
}

uint64_t __68__HKMedicationExposableDoseEventControl_writeDoseEvents_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_writeDoseEvents:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __68__HKMedicationExposableDoseEventControl_writeDoseEvents_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteDoseEventWithPersistentUUID:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HKMedicationExposableDoseEventControl.m", 72, @"Invalid parameter not satisfying: %@", @"persistentUUID != nil" object file lineNumber description];
  }
  id v9 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v8];

  proxyProvider = self->_proxyProvider;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__HKMedicationExposableDoseEventControl_deleteDoseEventWithPersistentUUID_completion___block_invoke;
  v16[3] = &unk_1E62EB410;
  id v17 = v7;
  id v18 = v9;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__HKMedicationExposableDoseEventControl_deleteDoseEventWithPersistentUUID_completion___block_invoke_2;
  v14[3] = &unk_1E62EB1F0;
  id v15 = v18;
  id v11 = v18;
  id v12 = v7;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v16 errorHandler:v14];
}

uint64_t __86__HKMedicationExposableDoseEventControl_deleteDoseEventWithPersistentUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteDoseEventWithPersistentUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __86__HKMedicationExposableDoseEventControl_deleteDoseEventWithPersistentUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F171CF88];
}

+ (id)serverInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F172AD90];
  id v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_doseEventsForDateInterval_medicationIdentifier_completion_, 0, 1);
  id v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_writeDoseEvents_completion_, 0, 0);

  return v2;
}

- (id)exportedInterface
{
  return +[HKMedicationExposableDoseEventControl clientInterface];
}

- (id)remoteInterface
{
  return +[HKMedicationExposableDoseEventControl serverInterface];
}

- (void)unitTest_noOpWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v4];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__HKMedicationExposableDoseEventControl_unitTest_noOpWithCompletion___block_invoke;
  v11[3] = &unk_1E62EB438;
  id v12 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__HKMedicationExposableDoseEventControl_unitTest_noOpWithCompletion___block_invoke_2;
  v9[3] = &unk_1E62EB1F0;
  id v10 = v5;
  id v7 = v5;
  id v8 = v4;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __69__HKMedicationExposableDoseEventControl_unitTest_noOpWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_unitTesting_createTaskServerNoOpWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __69__HKMedicationExposableDoseEventControl_unitTest_noOpWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (void)setProxyProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end