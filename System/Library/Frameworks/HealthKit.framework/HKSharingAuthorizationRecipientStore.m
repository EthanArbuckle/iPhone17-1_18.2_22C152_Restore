@interface HKSharingAuthorizationRecipientStore
+ (id)clientInterface;
+ (id)serverInterface;
- (HKHealthStore)healthStore;
- (HKObserverSet)observers;
- (HKSharingAuthorizationRecipientStore)initWithHealthStore:(id)a3 sharingAuthorizations:(id)a4;
- (HKTaskServerProxyProvider)proxyProvider;
- (NSArray)authorizationIdentifiers;
- (NSArray)sharingAuthorizations;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_registerRemoteObservers;
- (void)addObserver:(id)a3;
- (void)clientRemote_didAddRecipientIdentifier:(id)a3 sharingAuthorizations:(id)a4;
- (void)clientRemote_didRemoveRecipientIdentifier:(id)a3 sharingAuthorizations:(id)a4;
- (void)clientRemote_didRevokeRecipientIdentifier:(id)a3;
- (void)fetchRecipientIdentifiersByAuthorizationWithCompletion:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation HKSharingAuthorizationRecipientStore

- (HKSharingAuthorizationRecipientStore)initWithHealthStore:(id)a3 sharingAuthorizations:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)HKSharingAuthorizationRecipientStore;
  v9 = [(HKSharingAuthorizationRecipientStore *)&v28 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_healthStore, a3);
    uint64_t v11 = [v8 copy];
    sharingAuthorizations = v10->_sharingAuthorizations;
    v10->_sharingAuthorizations = (NSArray *)v11;

    uint64_t v13 = HKAuthorizationIdentifiersFromSharingAuthorizations(v8);
    authorizationIdentifiers = v10->_authorizationIdentifiers;
    v10->_authorizationIdentifiers = (NSArray *)v13;

    v15 = [HKTaskServerProxyProvider alloc];
    healthStore = v10->_healthStore;
    v17 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v18 = [(HKTaskServerProxyProvider *)v15 initWithHealthStore:healthStore taskIdentifier:@"HKSharingAuthorizationRecipientStoreServerIdentifier" exportedObject:v10 taskUUID:v17];
    proxyProvider = v10->_proxyProvider;
    v10->_proxyProvider = (HKTaskServerProxyProvider *)v18;

    v20 = objc_alloc_init(HKSharingAuthorizationRecipientStoreTaskConfiguration);
    [(HKSharingAuthorizationRecipientStoreTaskConfiguration *)v20 setSharingAuthorizations:v10->_sharingAuthorizations];
    [(HKTaskServerProxyProvider *)v10->_proxyProvider setTaskConfiguration:v20];
    v21 = [HKObserverSet alloc];
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    v24 = HKLogSharing();
    uint64_t v25 = [(HKObserverSet *)v21 initWithName:v23 loggingCategory:v24];
    observers = v10->_observers;
    v10->_observers = (HKObserverSet *)v25;
  }
  return v10;
}

- (void)fetchRecipientIdentifiersByAuthorizationWithCompletion:(id)a3
{
  v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__HKSharingAuthorizationRecipientStore_fetchRecipientIdentifiersByAuthorizationWithCompletion___block_invoke;
  v9[3] = &unk_1E58BF390;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__HKSharingAuthorizationRecipientStore_fetchRecipientIdentifiersByAuthorizationWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBC48;
  v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __95__HKSharingAuthorizationRecipientStore_fetchRecipientIdentifiersByAuthorizationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchRecipientIdentifiersWithCompletion:", *(void *)(a1 + 32));
}

void __95__HKSharingAuthorizationRecipientStore_fetchRecipientIdentifiersByAuthorizationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __95__HKSharingAuthorizationRecipientStore_fetchRecipientIdentifiersByAuthorizationWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)addObserver:(id)a3
{
  proxyProvider = self->_proxyProvider;
  observers = self->_observers;
  id v6 = a3;
  id v7 = [(HKProxyProvider *)proxyProvider clientQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__HKSharingAuthorizationRecipientStore_addObserver___block_invoke;
  v8[3] = &unk_1E58BBA00;
  v8[4] = self;
  [(HKObserverSet *)observers registerObserver:v6 queue:v7 runIfFirstObserver:v8];
}

void __52__HKSharingAuthorizationRecipientStore_addObserver___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = MEMORY[0x1E4F143A8];
  uint64_t v3 = 3221225472;
  v4 = __52__HKSharingAuthorizationRecipientStore_addObserver___block_invoke_2;
  v5 = &unk_1E58BE428;
  objc_copyWeak(&v6, &location);
  [*(id *)(*(void *)(a1 + 32) + 32) setAutomaticProxyReconnectionHandler:&v2];
  objc_msgSend(*(id *)(a1 + 32), "_registerRemoteObservers", v2, v3, v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __52__HKSharingAuthorizationRecipientStore_addObserver___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _registerRemoteObservers];
}

- (void)removeObserver:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__HKSharingAuthorizationRecipientStore_removeObserver___block_invoke;
  v4[3] = &unk_1E58BBA00;
  v4[4] = self;
  [(HKObserverSet *)observers unregisterObserver:a3 runIfLastObserver:v4];
}

uint64_t __55__HKSharingAuthorizationRecipientStore_removeObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) setAutomaticProxyReconnectionHandler:0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__HKSharingAuthorizationRecipientStore_removeObserver___block_invoke_3;
  v5[3] = &unk_1E58BBCC0;
  v5[4] = v2;
  return [v3 fetchProxyWithHandler:&__block_literal_global_17 errorHandler:v5];
}

uint64_t __55__HKSharingAuthorizationRecipientStore_removeObserver___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_unregisterObservers");
}

void __55__HKSharingAuthorizationRecipientStore_removeObserver___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  uint64_t v3 = HKLogSharing();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __55__HKSharingAuthorizationRecipientStore_removeObserver___block_invoke_3_cold_1();
  }
}

- (void)clientRemote_didAddRecipientIdentifier:(id)a3 sharingAuthorizations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  observers = self->_observers;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __101__HKSharingAuthorizationRecipientStore_clientRemote_didAddRecipientIdentifier_sharingAuthorizations___block_invoke;
  v11[3] = &unk_1E58BF3D8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(HKObserverSet *)observers notifyObservers:v11];
}

uint64_t __101__HKSharingAuthorizationRecipientStore_clientRemote_didAddRecipientIdentifier_sharingAuthorizations___block_invoke(void *a1, void *a2)
{
  return [a2 sharingAuthorizationRecipientStore:a1[4] didAddRecipientIdentifier:a1[5] sharingAuthorizations:a1[6]];
}

- (void)clientRemote_didRemoveRecipientIdentifier:(id)a3 sharingAuthorizations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  observers = self->_observers;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __104__HKSharingAuthorizationRecipientStore_clientRemote_didRemoveRecipientIdentifier_sharingAuthorizations___block_invoke;
  v11[3] = &unk_1E58BF3D8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(HKObserverSet *)observers notifyObservers:v11];
}

uint64_t __104__HKSharingAuthorizationRecipientStore_clientRemote_didRemoveRecipientIdentifier_sharingAuthorizations___block_invoke(void *a1, void *a2)
{
  return [a2 sharingAuthorizationRecipientStore:a1[4] didRemoveRecipientIdentifier:a1[5] sharingAuthorizations:a1[6]];
}

- (void)clientRemote_didRevokeRecipientIdentifier:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__HKSharingAuthorizationRecipientStore_clientRemote_didRevokeRecipientIdentifier___block_invoke;
  v7[3] = &unk_1E58BF400;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HKObserverSet *)observers notifyObservers:v7];
}

uint64_t __82__HKSharingAuthorizationRecipientStore_clientRemote_didRevokeRecipientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sharingAuthorizationRecipientStore:*(void *)(a1 + 32) didRevokeRecipientIdentifier:*(void *)(a1 + 40)];
}

- (void)_registerRemoteObservers
{
  proxyProvider = self->_proxyProvider;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__HKSharingAuthorizationRecipientStore__registerRemoteObservers__block_invoke_2;
  v3[3] = &unk_1E58BBCC0;
  v3[4] = self;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:&__block_literal_global_16 errorHandler:v3];
}

uint64_t __64__HKSharingAuthorizationRecipientStore__registerRemoteObservers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_registerObservers");
}

void __64__HKSharingAuthorizationRecipientStore__registerRemoteObservers__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  uint64_t v3 = HKLogSharing();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __64__HKSharingAuthorizationRecipientStore__registerRemoteObservers__block_invoke_2_cold_1();
  }
}

+ (id)clientInterface
{
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED52130];
  id v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_clientRemote_didAddRecipientIdentifier_sharingAuthorizations_, 1, 0);
  id v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_clientRemote_didRemoveRecipientIdentifier_sharingAuthorizations_, 1, 0);

  return v2;
}

+ (id)serverInterface
{
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED52190];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, objc_opt_class(), 0);
  [v2 setClasses:v7 forSelector:sel_remote_fetchRecipientIdentifiersWithCompletion_ argumentIndex:0 ofReply:1];

  return v2;
}

- (id)exportedInterface
{
  id v2 = objc_opt_class();

  return (id)[v2 clientInterface];
}

- (id)remoteInterface
{
  id v2 = objc_opt_class();

  return (id)[v2 serverInterface];
}

- (NSArray)authorizationIdentifiers
{
  return self->_authorizationIdentifiers;
}

- (NSArray)sharingAuthorizations
{
  return self->_sharingAuthorizations;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (HKObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_sharingAuthorizations, 0);

  objc_storeStrong((id *)&self->_authorizationIdentifiers, 0);
}

void __95__HKSharingAuthorizationRecipientStore_fetchRecipientIdentifiersByAuthorizationWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[summary-sharing] %{public}@: Error fetching recipient identifiers %{public}@");
}

void __55__HKSharingAuthorizationRecipientStore_removeObserver___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[summary-sharing] %{public}@: Error unregistering observers %{public}@");
}

void __64__HKSharingAuthorizationRecipientStore__registerRemoteObservers__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[summary-sharing] %{public}@: Error registering observers %{public}@");
}

@end