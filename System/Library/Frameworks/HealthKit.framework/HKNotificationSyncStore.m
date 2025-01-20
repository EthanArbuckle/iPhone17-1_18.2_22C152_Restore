@interface HKNotificationSyncStore
+ (id)taskIdentifier;
- (HKNotificationSyncStore)initWithClientIdentifier:(id)a3 healthStore:(id)a4;
- (NSString)clientIdentifier;
- (void)fakeReceivedNotificationInstruction:(id)a3 sendingDeviceInfo:(id)a4 completion:(id)a5;
- (void)getNotificationHoldInstructionsWithCompletion:(id)a3;
- (void)obliterateNotificationInstructionsWithCompletion:(id)a3;
- (void)sendNewDeviceNotificationWithMessageKind:(int64_t)a3 completion:(id)a4;
- (void)sendNotificationInstruction:(id)a3 completion:(id)a4;
- (void)sendNotificationInstruction:(id)a3 savingObjectAsExistsCriteria:(id)a4 completion:(id)a5;
@end

@implementation HKNotificationSyncStore

- (HKNotificationSyncStore)initWithClientIdentifier:(id)a3 healthStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HKNotificationSyncStore;
  v8 = [(HKNotificationSyncStore *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    clientIdentifier = v8->_clientIdentifier;
    v8->_clientIdentifier = (NSString *)v9;

    v11 = [HKTaskServerProxyProvider alloc];
    v12 = [(id)objc_opt_class() taskIdentifier];
    v13 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v14 = [(HKTaskServerProxyProvider *)v11 initWithHealthStore:v7 taskIdentifier:v12 exportedObject:v8 taskUUID:v13];
    proxyProvider = v8->_proxyProvider;
    v8->_proxyProvider = (HKTaskServerProxyProvider *)v14;

    [(HKProxyProvider *)v8->_proxyProvider setShouldRetryOnInterruption:0];
    v16 = [[HKNotificationSyncStoreServerConfiguration alloc] initWithClientIdentifier:v6];
    [(HKTaskServerProxyProvider *)v8->_proxyProvider setTaskConfiguration:v16];
  }
  return v8;
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)sendNotificationInstruction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__HKNotificationSyncStore_sendNotificationInstruction_completion___block_invoke;
  v13[3] = &unk_1E58C0F38;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__HKNotificationSyncStore_sendNotificationInstruction_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __66__HKNotificationSyncStore_sendNotificationInstruction_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_sendNotificationInstruction:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __66__HKNotificationSyncStore_sendNotificationInstruction_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendNotificationInstruction:(id)a3 savingObjectAsExistsCriteria:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __95__HKNotificationSyncStore_sendNotificationInstruction_savingObjectAsExistsCriteria_completion___block_invoke;
  v17[3] = &unk_1E58C0F60;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95__HKNotificationSyncStore_sendNotificationInstruction_savingObjectAsExistsCriteria_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v20;
  id v12 = v20;
  id v13 = v9;
  id v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __95__HKNotificationSyncStore_sendNotificationInstruction_savingObjectAsExistsCriteria_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_sendNotificationInstruction:savingObjectAsExistsCriteria:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __95__HKNotificationSyncStore_sendNotificationInstruction_savingObjectAsExistsCriteria_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getNotificationHoldInstructionsWithCompletion:(id)a3
{
  v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__HKNotificationSyncStore_getNotificationHoldInstructionsWithCompletion___block_invoke;
  v9[3] = &unk_1E58C0F88;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__HKNotificationSyncStore_getNotificationHoldInstructionsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __73__HKNotificationSyncStore_getNotificationHoldInstructionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_notificationHoldInstructionsWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __73__HKNotificationSyncStore_getNotificationHoldInstructionsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fakeReceivedNotificationInstruction:(id)a3 sendingDeviceInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__HKNotificationSyncStore_fakeReceivedNotificationInstruction_sendingDeviceInfo_completion___block_invoke;
  v17[3] = &unk_1E58C0F60;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__HKNotificationSyncStore_fakeReceivedNotificationInstruction_sendingDeviceInfo_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v20;
  id v12 = v20;
  id v13 = v9;
  id v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __92__HKNotificationSyncStore_fakeReceivedNotificationInstruction_sendingDeviceInfo_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fakeReceivedNotificationInstruction:sendingDeviceInfo:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __92__HKNotificationSyncStore_fakeReceivedNotificationInstruction_sendingDeviceInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)obliterateNotificationInstructionsWithCompletion:(id)a3
{
  v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__HKNotificationSyncStore_obliterateNotificationInstructionsWithCompletion___block_invoke;
  v9[3] = &unk_1E58C0F88;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__HKNotificationSyncStore_obliterateNotificationInstructionsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __76__HKNotificationSyncStore_obliterateNotificationInstructionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_obliterateNotificationInstructionsWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __76__HKNotificationSyncStore_obliterateNotificationInstructionsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendNewDeviceNotificationWithMessageKind:(int64_t)a3 completion:(id)a4
{
  id v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__HKNotificationSyncStore_sendNewDeviceNotificationWithMessageKind_completion___block_invoke;
  v11[3] = &unk_1E58C0FB0;
  int64_t v13 = a3;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__HKNotificationSyncStore_sendNewDeviceNotificationWithMessageKind_completion___block_invoke_2;
  v9[3] = &unk_1E58BBD88;
  id v10 = v12;
  id v8 = v12;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __79__HKNotificationSyncStore_sendNewDeviceNotificationWithMessageKind_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_sendNewDeviceNotificationWithMessageKind:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __79__HKNotificationSyncStore_sendNewDeviceNotificationWithMessageKind_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);

  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end