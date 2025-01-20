@interface HKMedicationControl
+ (id)clientInterface;
+ (id)serverInterface;
- (HKHealthStore)healthStore;
- (HKMedicationControl)init;
- (HKMedicationControl)initWithHealthStore:(id)a3;
- (HKTaskServerProxyProvider)proxyProvider;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)accountDevicesInfoTriggeringUpdate:(BOOL)a3 completion:(id)a4;
- (void)allDismissedDrugInteractionsWithCompletion:(id)a3;
- (void)allDismissedPregnancyLactationInteractionsWithCompletion:(id)a3;
- (void)allDismissedRemoteScheduleUnavailableRecordsWithCompletion:(id)a3;
- (void)deleteDismissedDrugInteractionsForMedication:(id)a3 completion:(id)a4;
- (void)deleteDismissedPregnancyLactationInteractionsForMedication:(id)a3 interactionTypes:(id)a4 completion:(id)a5;
- (void)deleteDismissedRemoteScheduleUnavailableForMedication:(id)a3 completion:(id)a4;
- (void)markDrugInteractionAsDismissed:(id)a3 completion:(id)a4;
- (void)markPregnancyLactationInteractionForMedicationAsDismissed:(id)a3 interactionType:(int64_t)a4 completion:(id)a5;
- (void)markRemoteScheduleUnavailableRecordsAsDismissed:(id)a3 completion:(id)a4;
- (void)setHealthStore:(id)a3;
- (void)setProxyProvider:(id)a3;
- (void)unitTest_noOpWithCompletion:(id)a3;
- (void)updateLocalDeviceValuesNowWithCompletion:(id)a3;
@end

@implementation HKMedicationControl

- (HKMedicationControl)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKMedicationControl)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKMedicationControl;
  v6 = [(HKMedicationControl *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    id v8 = objc_alloc(MEMORY[0x1E4F2B608]);
    healthStore = v7->_healthStore;
    v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v8 initWithHealthStore:healthStore taskIdentifier:@"HKMedicationControlServerIdentifier" exportedObject:v7 taskUUID:v10];
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v11;

    [(HKTaskServerProxyProvider *)v7->_proxyProvider setShouldRetryOnInterruption:0];
  }

  return v7;
}

- (void)updateLocalDeviceValuesNowWithCompletion:(id)a3
{
  uint64_t v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__HKMedicationControl_updateLocalDeviceValuesNowWithCompletion___block_invoke;
  v9[3] = &unk_1E62EBB28;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HKMedicationControl_updateLocalDeviceValuesNowWithCompletion___block_invoke_2;
  v7[3] = &unk_1E62EB1F0;
  id v8 = v10;
  id v6 = v10;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __64__HKMedicationControl_updateLocalDeviceValuesNowWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateLocalDeviceValuesNowWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __64__HKMedicationControl_updateLocalDeviceValuesNowWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)accountDevicesInfoTriggeringUpdate:(BOOL)a3 completion:(id)a4
{
  id v6 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__HKMedicationControl_accountDevicesInfoTriggeringUpdate_completion___block_invoke;
  v11[3] = &unk_1E62EBB50;
  BOOL v13 = a3;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__HKMedicationControl_accountDevicesInfoTriggeringUpdate_completion___block_invoke_2;
  v9[3] = &unk_1E62EB1F0;
  id v10 = v12;
  id v8 = v12;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __69__HKMedicationControl_accountDevicesInfoTriggeringUpdate_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_accountDevicesInfoTriggeringUpdate:completion:", *(unsigned __int8 *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __69__HKMedicationControl_accountDevicesInfoTriggeringUpdate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)markRemoteScheduleUnavailableRecordsAsDismissed:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    BOOL v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HKMedicationControl.m", 72, @"Invalid parameter not satisfying: %@", @"remoteRecords != nil" object file lineNumber description];
  }
  if (![v7 count])
  {
    objc_super v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HKMedicationControl.m", 73, @"Invalid parameter not satisfying: %@", @"remoteRecords.count > 0" object file lineNumber description];
  }
  v9 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v8];

  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __82__HKMedicationControl_markRemoteScheduleUnavailableRecordsAsDismissed_completion___block_invoke;
  v17[3] = &unk_1E62EBB78;
  id v18 = v7;
  id v19 = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__HKMedicationControl_markRemoteScheduleUnavailableRecordsAsDismissed_completion___block_invoke_2;
  v15[3] = &unk_1E62EB1F0;
  id v16 = v19;
  id v11 = v19;
  id v12 = v7;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __82__HKMedicationControl_markRemoteScheduleUnavailableRecordsAsDismissed_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_markRemoteScheduleUnavailableRecordsAsDismissed:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __82__HKMedicationControl_markRemoteScheduleUnavailableRecordsAsDismissed_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)allDismissedRemoteScheduleUnavailableRecordsWithCompletion:(id)a3
{
  uint64_t v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__HKMedicationControl_allDismissedRemoteScheduleUnavailableRecordsWithCompletion___block_invoke;
  v9[3] = &unk_1E62EBB28;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__HKMedicationControl_allDismissedRemoteScheduleUnavailableRecordsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E62EB1F0;
  id v8 = v10;
  id v6 = v10;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __82__HKMedicationControl_allDismissedRemoteScheduleUnavailableRecordsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_allDismissedRemoteScheduleUnavailableRecordsWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __82__HKMedicationControl_allDismissedRemoteScheduleUnavailableRecordsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteDismissedRemoteScheduleUnavailableForMedication:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__HKMedicationControl_deleteDismissedRemoteScheduleUnavailableForMedication_completion___block_invoke;
  v13[3] = &unk_1E62EBB78;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__HKMedicationControl_deleteDismissedRemoteScheduleUnavailableForMedication_completion___block_invoke_2;
  v11[3] = &unk_1E62EB1F0;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __88__HKMedicationControl_deleteDismissedRemoteScheduleUnavailableForMedication_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteDismissedRemoteScheduleUnavailableForMedication:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __88__HKMedicationControl_deleteDismissedRemoteScheduleUnavailableForMedication_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)markDrugInteractionAsDismissed:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    BOOL v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HKMedicationControl.m", 104, @"Invalid parameter not satisfying: %@", @"interactionResult != nil" object file lineNumber description];
  }
  id v9 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v8];

  proxyProvider = self->_proxyProvider;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__HKMedicationControl_markDrugInteractionAsDismissed_completion___block_invoke;
  v16[3] = &unk_1E62EBB78;
  id v17 = v7;
  id v18 = v9;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__HKMedicationControl_markDrugInteractionAsDismissed_completion___block_invoke_2;
  v14[3] = &unk_1E62EB1F0;
  id v15 = v18;
  id v11 = v18;
  id v12 = v7;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v16 errorHandler:v14];
}

uint64_t __65__HKMedicationControl_markDrugInteractionAsDismissed_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_markDrugInteractionAsDismissed:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __65__HKMedicationControl_markDrugInteractionAsDismissed_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)allDismissedDrugInteractionsWithCompletion:(id)a3
{
  uint64_t v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__HKMedicationControl_allDismissedDrugInteractionsWithCompletion___block_invoke;
  v9[3] = &unk_1E62EBB28;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__HKMedicationControl_allDismissedDrugInteractionsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E62EB1F0;
  id v8 = v10;
  id v6 = v10;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __66__HKMedicationControl_allDismissedDrugInteractionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_allDismissedDrugInteractionsWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __66__HKMedicationControl_allDismissedDrugInteractionsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteDismissedDrugInteractionsForMedication:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 firstConceptIdentifier];

  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HKMedicationControl.m", 125, @"Invalid parameter not satisfying: %@", @"medication.firstConceptIdentifier != nil" object file lineNumber description];
  }
  id v10 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v8];

  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__HKMedicationControl_deleteDismissedDrugInteractionsForMedication_completion___block_invoke;
  v17[3] = &unk_1E62EBB78;
  id v18 = v7;
  id v19 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__HKMedicationControl_deleteDismissedDrugInteractionsForMedication_completion___block_invoke_2;
  v15[3] = &unk_1E62EB1F0;
  id v16 = v19;
  id v12 = v19;
  id v13 = v7;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __79__HKMedicationControl_deleteDismissedDrugInteractionsForMedication_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteDismissedDrugInteractionsForMedication:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __79__HKMedicationControl_deleteDismissedDrugInteractionsForMedication_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)markPregnancyLactationInteractionForMedicationAsDismissed:(id)a3 interactionType:(int64_t)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = [v9 firstConceptIdentifier];

  if (!v11)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HKMedicationControl.m", 139, @"Invalid parameter not satisfying: %@", @"medication.firstConceptIdentifier != nil" object file lineNumber description];
  }
  id v12 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v10];

  proxyProvider = self->_proxyProvider;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __108__HKMedicationControl_markPregnancyLactationInteractionForMedicationAsDismissed_interactionType_completion___block_invoke;
  v19[3] = &unk_1E62EBBA0;
  id v20 = v9;
  int64_t v22 = a4;
  id v21 = v12;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __108__HKMedicationControl_markPregnancyLactationInteractionForMedicationAsDismissed_interactionType_completion___block_invoke_2;
  v17[3] = &unk_1E62EB1F0;
  id v18 = v21;
  id v14 = v21;
  id v15 = v9;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v19 errorHandler:v17];
}

uint64_t __108__HKMedicationControl_markPregnancyLactationInteractionForMedicationAsDismissed_interactionType_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_markPregnancyLactationInteractionForMedicationAsDismissed:interactionType:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __108__HKMedicationControl_markPregnancyLactationInteractionForMedicationAsDismissed_interactionType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)allDismissedPregnancyLactationInteractionsWithCompletion:(id)a3
{
  uint64_t v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__HKMedicationControl_allDismissedPregnancyLactationInteractionsWithCompletion___block_invoke;
  v9[3] = &unk_1E62EBB28;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__HKMedicationControl_allDismissedPregnancyLactationInteractionsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E62EB1F0;
  id v8 = v10;
  id v6 = v10;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __80__HKMedicationControl_allDismissedPregnancyLactationInteractionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_allDismissedPregnancyLactationInteractionsWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __80__HKMedicationControl_allDismissedPregnancyLactationInteractionsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteDismissedPregnancyLactationInteractionsForMedication:(id)a3 interactionTypes:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v9 firstConceptIdentifier];

  if (!v12)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HKMedicationControl.m", 161, @"Invalid parameter not satisfying: %@", @"medication.firstConceptIdentifier != nil" object file lineNumber description];
  }
  id v13 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v11];

  proxyProvider = self->_proxyProvider;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __110__HKMedicationControl_deleteDismissedPregnancyLactationInteractionsForMedication_interactionTypes_completion___block_invoke;
  v21[3] = &unk_1E62EBBC8;
  id v22 = v9;
  id v23 = v10;
  id v24 = v13;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __110__HKMedicationControl_deleteDismissedPregnancyLactationInteractionsForMedication_interactionTypes_completion___block_invoke_2;
  v19[3] = &unk_1E62EB1F0;
  id v20 = v24;
  id v15 = v24;
  id v16 = v10;
  id v17 = v9;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v21 errorHandler:v19];
}

uint64_t __110__HKMedicationControl_deleteDismissedPregnancyLactationInteractionsForMedication_interactionTypes_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteDismissedPregnancyLactationInteractionsForMedication:interactionTypes:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __110__HKMedicationControl_deleteDismissedPregnancyLactationInteractionsForMedication_interactionTypes_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1720900];
}

+ (id)serverInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F172ADF0];
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForSetOf:", objc_opt_class());
  [v2 setClasses:v3 forSelector:sel_remote_accountDevicesInfoTriggeringUpdate_completion_ argumentIndex:0 ofReply:1];

  id v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_markRemoteScheduleUnavailableRecordsAsDismissed_completion_, 0, 0);
  id v5 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_allDismissedRemoteScheduleUnavailableRecordsWithCompletion_, 0, 1);
  id v6 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_allDismissedDrugInteractionsWithCompletion_, 0, 1);
  id v7 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_allDismissedPregnancyLactationInteractionsWithCompletion_, 0, 1);

  return v2;
}

- (id)exportedInterface
{
  return +[HKMedicationControl clientInterface];
}

- (id)remoteInterface
{
  return +[HKMedicationControl serverInterface];
}

- (void)unitTest_noOpWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v4];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__HKMedicationControl_unitTest_noOpWithCompletion___block_invoke;
  v11[3] = &unk_1E62EBB28;
  id v12 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__HKMedicationControl_unitTest_noOpWithCompletion___block_invoke_2;
  v9[3] = &unk_1E62EB1F0;
  id v10 = v5;
  id v7 = v5;
  id v8 = v4;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __51__HKMedicationControl_unitTest_noOpWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_unitTesting_createTaskServerNoOpWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __51__HKMedicationControl_unitTest_noOpWithCompletion___block_invoke_2(uint64_t a1)
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