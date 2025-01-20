@interface HKCloudSyncShareParticipantManager
+ (id)clientInterface;
+ (id)serverInterface;
+ (id)taskIdentifier;
- (HKCloudSyncShareParticipantManager)initWithHealthStore:(id)a3;
- (id)exportedInterface;
- (id)remoteInterface;
- (int64_t)lastKnownParticipantSharingStatus;
- (void)fetchAllShareParticipantEmailAddressesForSharingType:(unint64_t)a3 completion:(id)a4;
- (void)revokeAccessForAllShareParticipantsForSharingType:(unint64_t)a3 completion:(id)a4;
- (void)tearDownHealthSharingForProfile:(id)a3 completion:(id)a4;
@end

@implementation HKCloudSyncShareParticipantManager

- (int64_t)lastKnownParticipantSharingStatus
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  proxyProvider = self->_proxyProvider;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__HKCloudSyncShareParticipantManager_lastKnownParticipantSharingStatus__block_invoke;
  v5[3] = &unk_1E58BEF98;
  v5[4] = &v6;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v5 errorHandler:&__block_literal_global_12];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __71__HKCloudSyncShareParticipantManager_lastKnownParticipantSharingStatus__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__HKCloudSyncShareParticipantManager_lastKnownParticipantSharingStatus__block_invoke_2;
  v3[3] = &unk_1E58BEF70;
  v3[4] = *(void *)(a1 + 32);
  return objc_msgSend(a2, "remote_fetchSharingParticipantStatus:", v3);
}

uint64_t __71__HKCloudSyncShareParticipantManager_lastKnownParticipantSharingStatus__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __71__HKCloudSyncShareParticipantManager_lastKnownParticipantSharingStatus__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  int64_t v3 = HKLogInfrastructure();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __71__HKCloudSyncShareParticipantManager_lastKnownParticipantSharingStatus__block_invoke_3_cold_1((uint64_t)v2, v3);
  }
}

- (HKCloudSyncShareParticipantManager)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKCloudSyncShareParticipantManager;
  uint64_t v6 = [(HKCloudSyncShareParticipantManager *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    uint64_t v8 = [HKTaskServerProxyProvider alloc];
    uint64_t v9 = [(id)objc_opt_class() taskIdentifier];
    v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [(HKTaskServerProxyProvider *)v8 initWithHealthStore:v5 taskIdentifier:v9 exportedObject:v7 taskUUID:v10];
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v11;

    [(HKProxyProvider *)v7->_proxyProvider setShouldRetryOnInterruption:0];
  }

  return v7;
}

+ (id)taskIdentifier
{
  id v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)exportedInterface
{
  return +[HKCloudSyncShareParticipantManager clientInterface];
}

- (id)remoteInterface
{
  return +[HKCloudSyncShareParticipantManager serverInterface];
}

+ (id)serverInterface
{
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED51F50];
  int64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  id v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_remote_fetchAllShareParticipantEmailAddressesForSharingType_completion_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED51FB0];
}

- (void)fetchAllShareParticipantEmailAddressesForSharingType:(unint64_t)a3 completion:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HKCloudSyncShareParticipantManager.m", 94, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];
  }
  uint64_t v8 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:v7];

  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __102__HKCloudSyncShareParticipantManager_fetchAllShareParticipantEmailAddressesForSharingType_completion___block_invoke;
  v14[3] = &unk_1E58BEFC0;
  unint64_t v16 = a3;
  id v15 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102__HKCloudSyncShareParticipantManager_fetchAllShareParticipantEmailAddressesForSharingType_completion___block_invoke_2;
  v12[3] = &unk_1E58BBD88;
  id v13 = v15;
  id v10 = v15;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v14 errorHandler:v12];
}

uint64_t __102__HKCloudSyncShareParticipantManager_fetchAllShareParticipantEmailAddressesForSharingType_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAllShareParticipantEmailAddressesForSharingType:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __102__HKCloudSyncShareParticipantManager_fetchAllShareParticipantEmailAddressesForSharingType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)revokeAccessForAllShareParticipantsForSharingType:(unint64_t)a3 completion:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HKCloudSyncShareParticipantManager.m", 106, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];
  }
  uint64_t v8 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v7];

  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __99__HKCloudSyncShareParticipantManager_revokeAccessForAllShareParticipantsForSharingType_completion___block_invoke;
  v14[3] = &unk_1E58BEFC0;
  unint64_t v16 = a3;
  id v15 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __99__HKCloudSyncShareParticipantManager_revokeAccessForAllShareParticipantsForSharingType_completion___block_invoke_2;
  v12[3] = &unk_1E58BBD88;
  id v13 = v15;
  id v10 = v15;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v14 errorHandler:v12];
}

uint64_t __99__HKCloudSyncShareParticipantManager_revokeAccessForAllShareParticipantsForSharingType_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_revokeAccessForAllShareParticipantsForSharingType:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __99__HKCloudSyncShareParticipantManager_revokeAccessForAllShareParticipantsForSharingType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)tearDownHealthSharingForProfile:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HKCloudSyncShareParticipantManager.m", 118, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];
  }
  uint64_t v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v8];

  proxyProvider = self->_proxyProvider;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__HKCloudSyncShareParticipantManager_tearDownHealthSharingForProfile_completion___block_invoke;
  v16[3] = &unk_1E58BEFE8;
  id v17 = v7;
  id v18 = v9;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__HKCloudSyncShareParticipantManager_tearDownHealthSharingForProfile_completion___block_invoke_2;
  v14[3] = &unk_1E58BBD88;
  id v15 = v18;
  id v11 = v18;
  id v12 = v7;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v16 errorHandler:v14];
}

uint64_t __81__HKCloudSyncShareParticipantManager_tearDownHealthSharingForProfile_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_tearDownHealthSharingForProfile:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __81__HKCloudSyncShareParticipantManager_tearDownHealthSharingForProfile_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);

  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __71__HKCloudSyncShareParticipantManager_lastKnownParticipantSharingStatus__block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Failed to retrieve proxy with error, %{public}@", (uint8_t *)&v2, 0xCu);
}

@end