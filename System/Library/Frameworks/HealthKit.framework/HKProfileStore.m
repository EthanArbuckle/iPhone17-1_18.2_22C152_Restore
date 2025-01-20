@interface HKProfileStore
+ (id)taskIdentifier;
- (HKProfileStore)initWithHealthStore:(id)a3;
- (id)synchronouslyFetchFirstName;
- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)_getSynchronousProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)addObserver:(id)a3 completion:(id)a4;
- (void)createProfileOfType:(int64_t)a3 displayName:(id)a4 completion:(id)a5;
- (void)deleteProfile:(id)a3 completion:(id)a4;
- (void)dispatchProfileListDidUpdate;
- (void)fetchAllProfilesWithCompletion:(id)a3;
- (void)fetchDisplayImageData:(id)a3;
- (void)fetchDisplayName:(id)a3;
- (void)fetchProfileIdentifierForNRDeviceUUID:(id)a3 completion:(id)a4;
- (void)fetchProfileIdentifierForNRDeviceUUID:(id)a3 ownerAppleID:(id)a4 completion:(id)a5;
- (void)fetchSharingInformationForProfileIdentifier:(id)a3 completion:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setDisplayFirstName:(id)a3 lastName:(id)a4 completion:(id)a5;
- (void)setDisplayImageData:(id)a3 completion:(id)a4;
- (void)startObservingWithCompletion:(id)a3;
@end

@implementation HKProfileStore

- (HKProfileStore)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKProfileStore;
  v5 = [(HKProfileStore *)&v15 init];
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    v7 = [(id)objc_opt_class() taskIdentifier];
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [(HKTaskServerProxyProvider *)v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 taskUUID:v8];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v9;

    v11 = [HKObserverSet alloc];
    uint64_t v12 = [(HKObserverSet *)v11 initWithName:@"HKProfileStoreObservers" loggingCategory:HKLogDefault];
    observers = v5->_observers;
    v5->_observers = (HKProfileStoreObserver *)v12;

    v5->_startedObserving = 0;
  }

  return v5;
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)createProfileOfType:(int64_t)a3 displayName:(id)a4 completion:(id)a5
{
  id v8 = a4;
  uint64_t v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__HKProfileStore_createProfileOfType_displayName_completion___block_invoke;
  v14[3] = &unk_1E58C8158;
  int64_t v17 = a3;
  id v15 = v8;
  id v16 = v9;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__HKProfileStore_createProfileOfType_displayName_completion___block_invoke_2;
  v12[3] = &unk_1E58BBD88;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(HKProfileStore *)self _fetchProxyWithHandler:v14 errorHandler:v12];
}

uint64_t __61__HKProfileStore_createProfileOfType_displayName_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_createProfileOfType:displayName:completion:", a1[6], a1[4], a1[5]);
}

uint64_t __61__HKProfileStore_createProfileOfType_displayName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteProfile:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__HKProfileStore_deleteProfile_completion___block_invoke;
  v12[3] = &unk_1E58C8180;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__HKProfileStore_deleteProfile_completion___block_invoke_2;
  v10[3] = &unk_1E58BBD88;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKProfileStore *)self _fetchProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __43__HKProfileStore_deleteProfile_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteProfile:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __43__HKProfileStore_deleteProfile_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAllProfilesWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__HKProfileStore_fetchAllProfilesWithCompletion___block_invoke;
  v8[3] = &unk_1E58C81A8;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__HKProfileStore_fetchAllProfilesWithCompletion___block_invoke_2;
  v6[3] = &unk_1E58BBD88;
  id v7 = v9;
  id v5 = v9;
  [(HKProfileStore *)self _fetchProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __49__HKProfileStore_fetchAllProfilesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_getAllProfilesWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __49__HKProfileStore_fetchAllProfilesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchProfileIdentifierForNRDeviceUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__HKProfileStore_fetchProfileIdentifierForNRDeviceUUID_completion___block_invoke;
  v12[3] = &unk_1E58C8180;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__HKProfileStore_fetchProfileIdentifierForNRDeviceUUID_completion___block_invoke_2;
  v10[3] = &unk_1E58BBD88;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKProfileStore *)self _fetchProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __67__HKProfileStore_fetchProfileIdentifierForNRDeviceUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_profileIdentifierForNRDeviceUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __67__HKProfileStore_fetchProfileIdentifierForNRDeviceUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchProfileIdentifierForNRDeviceUUID:(id)a3 ownerAppleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__HKProfileStore_fetchProfileIdentifierForNRDeviceUUID_ownerAppleID_completion___block_invoke;
  v16[3] = &unk_1E58C81D0;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__HKProfileStore_fetchProfileIdentifierForNRDeviceUUID_ownerAppleID_completion___block_invoke_2;
  v14[3] = &unk_1E58BBD88;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(HKProfileStore *)self _fetchProxyWithHandler:v16 errorHandler:v14];
}

uint64_t __80__HKProfileStore_fetchProfileIdentifierForNRDeviceUUID_ownerAppleID_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_profileIdentifierForNRDeviceUUID:ownerAppleID:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __80__HKProfileStore_fetchProfileIdentifierForNRDeviceUUID_ownerAppleID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)synchronouslyFetchFirstName
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__53;
  id v10 = __Block_byref_object_dispose__53;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__HKProfileStore_synchronouslyFetchFirstName__block_invoke;
  v5[3] = &unk_1E58C8220;
  v5[4] = &v6;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__HKProfileStore_synchronouslyFetchFirstName__block_invoke_3;
  v4[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v4[4] = a2;
  [(HKProfileStore *)self _getSynchronousProxyWithHandler:v5 errorHandler:v4];
  id v2 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v2;
}

uint64_t __45__HKProfileStore_synchronouslyFetchFirstName__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__HKProfileStore_synchronouslyFetchFirstName__block_invoke_2;
  v3[3] = &unk_1E58C81F8;
  v3[4] = *(void *)(a1 + 32);
  return objc_msgSend(a2, "remote_fetchDisplayNameWithCompletion:", v3);
}

void __45__HKProfileStore_synchronouslyFetchFirstName__block_invoke_2(uint64_t a1, void *a2)
{
}

void __45__HKProfileStore_synchronouslyFetchFirstName__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogInfrastructure();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__HKProfileStore_synchronouslyFetchFirstName__block_invoke_3_cold_1(a1);
  }
}

- (void)fetchDisplayName:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueDoubleObjectHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__HKProfileStore_fetchDisplayName___block_invoke;
  v8[3] = &unk_1E58C81A8;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__HKProfileStore_fetchDisplayName___block_invoke_2;
  v6[3] = &unk_1E58BBD88;
  id v7 = v9;
  id v5 = v9;
  [(HKProfileStore *)self _fetchProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __35__HKProfileStore_fetchDisplayName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchDisplayNameWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __35__HKProfileStore_fetchDisplayName___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setDisplayFirstName:(id)a3 lastName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__HKProfileStore_setDisplayFirstName_lastName_completion___block_invoke;
  v16[3] = &unk_1E58C81D0;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__HKProfileStore_setDisplayFirstName_lastName_completion___block_invoke_2;
  v14[3] = &unk_1E58BBD88;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(HKProfileStore *)self _fetchProxyWithHandler:v16 errorHandler:v14];
}

uint64_t __58__HKProfileStore_setDisplayFirstName_lastName_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setDisplayFirstName:lastName:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __58__HKProfileStore_setDisplayFirstName_lastName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchDisplayImageData:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__HKProfileStore_fetchDisplayImageData___block_invoke;
  v8[3] = &unk_1E58C81A8;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__HKProfileStore_fetchDisplayImageData___block_invoke_2;
  v6[3] = &unk_1E58BBD88;
  id v7 = v9;
  id v5 = v9;
  [(HKProfileStore *)self _fetchProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __40__HKProfileStore_fetchDisplayImageData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchDisplayImageData:", *(void *)(a1 + 32));
}

uint64_t __40__HKProfileStore_fetchDisplayImageData___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setDisplayImageData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__HKProfileStore_setDisplayImageData_completion___block_invoke;
  v12[3] = &unk_1E58C8180;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__HKProfileStore_setDisplayImageData_completion___block_invoke_2;
  v10[3] = &unk_1E58BBD88;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKProfileStore *)self _fetchProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __49__HKProfileStore_setDisplayImageData_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setDisplayImageData:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __49__HKProfileStore_setDisplayImageData_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_getSynchronousProxyWithHandler:(id)a3 errorHandler:(id)a4
{
}

- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4
{
}

- (void)fetchSharingInformationForProfileIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueDoubleObjectHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__HKProfileStore_fetchSharingInformationForProfileIdentifier_completion___block_invoke;
  v12[3] = &unk_1E58C8180;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__HKProfileStore_fetchSharingInformationForProfileIdentifier_completion___block_invoke_2;
  v10[3] = &unk_1E58BBD88;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKProfileStore *)self _fetchProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __73__HKProfileStore_fetchSharingInformationForProfileIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSharingInformationForProfileIdentifier:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __73__HKProfileStore_fetchSharingInformationForProfileIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startObservingWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__HKProfileStore_startObservingWithCompletion___block_invoke;
  aBlock[3] = &unk_1E58BBC48;
  aBlock[4] = self;
  id v14 = v5;
  id v6 = _Block_copy(aBlock);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__HKProfileStore_startObservingWithCompletion___block_invoke_3;
  v11[3] = &unk_1E58C81A8;
  id v12 = v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__HKProfileStore_startObservingWithCompletion___block_invoke_5;
  v8[3] = &unk_1E58C8268;
  id v9 = v12;
  SEL v10 = a2;
  id v7 = v12;
  [(HKProfileStore *)self _fetchProxyWithHandler:v11 errorHandler:v8];
}

void __47__HKProfileStore_startObservingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__HKProfileStore_startObservingWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBF10;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __47__HKProfileStore_startObservingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __47__HKProfileStore_startObservingWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__HKProfileStore_startObservingWithCompletion___block_invoke_4;
  v3[3] = &unk_1E58BBEC0;
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_startObservingWithCompletion:", v3);
}

uint64_t __47__HKProfileStore_startObservingWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __47__HKProfileStore_startObservingWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogInfrastructure();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__HKProfileStore_startObservingWithCompletion___block_invoke_5_cold_1(a1);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addObserver:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_startedObserving)
  {
    self->_startedObserving = 1;
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __41__HKProfileStore_addObserver_completion___block_invoke;
    v13[3] = &unk_1E58BE428;
    objc_copyWeak(&v14, &location);
    [(HKProxyProvider *)self->_proxyProvider setAutomaticProxyReconnectionHandler:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__HKProfileStore_addObserver_completion___block_invoke_3;
  v11[3] = &unk_1E58BBD88;
  id v12 = v7;
  id v8 = v7;
  [(HKProfileStore *)self startObservingWithCompletion:v11];
  observers = self->_observers;
  SEL v10 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  [(HKProfileStoreObserver *)observers registerObserver:v6 queue:v10];
}

void __41__HKProfileStore_addObserver_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__HKProfileStore_addObserver_completion___block_invoke_2;
  v9[3] = &unk_1E58C8290;
  objc_copyWeak(&v10, v7);
  [WeakRetained startObservingWithCompletion:v9];

  objc_destroyWeak(&v10);
}

void __41__HKProfileStore_addObserver_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained dispatchProfileListDidUpdate];
  }
}

uint64_t __41__HKProfileStore_addObserver_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeObserver:(id)a3
{
}

- (void)dispatchProfileListDidUpdate
{
  observers = self->_observers;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__HKProfileStore_dispatchProfileListDidUpdate__block_invoke;
  v3[3] = &unk_1E58BBF38;
  void v3[4] = self;
  [(HKProfileStoreObserver *)observers notifyObservers:v3];
}

uint64_t __46__HKProfileStore_dispatchProfileListDidUpdate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 profileListDidUpdateForProfileStore:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __45__HKProfileStore_synchronouslyFetchFirstName__block_invoke_3_cold_1(uint64_t a1)
{
  v1 = NSStringFromSelector(*(SEL *)(a1 + 32));
  OUTLINED_FUNCTION_0_20();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v2, v3, "%{public}@ failed: %{public}@", v4, v5, v6, v7, v8);
}

void __47__HKProfileStore_startObservingWithCompletion___block_invoke_5_cold_1(uint64_t a1)
{
  v1 = NSStringFromSelector(*(SEL *)(a1 + 40));
  OUTLINED_FUNCTION_0_20();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v2, v3, "%{public}@ failed: %{public}@", v4, v5, v6, v7, v8);
}

@end