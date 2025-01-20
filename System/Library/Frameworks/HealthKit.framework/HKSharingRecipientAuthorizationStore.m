@interface HKSharingRecipientAuthorizationStore
+ (id)clientInterface;
+ (id)serverInterface;
- (HKHealthStore)healthStore;
- (HKObserverSet)observers;
- (HKSharingRecipientAuthorizationStore)initWithHealthStore:(id)a3 recipientIdentifier:(id)a4;
- (HKSharingRecipientIdentifier)recipientIdentifier;
- (HKTaskServerProxyProvider)proxyProvider;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_registerRemoteObservers;
- (void)addObserver:(id)a3;
- (void)addSharingAuthorizations:(id)a3 completion:(id)a4;
- (void)clientRemote_didAddSharingAuthorizations:(id)a3;
- (void)clientRemote_didRemoveSharingAuthorizations:(id)a3;
- (void)clientRemote_wasRevoked;
- (void)fetchSharingAuthorizationsMarkedForDeletionWithCompletion:(id)a3;
- (void)fetchSharingAuthorizationsWithCompletion:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeSharingAuthorizations:(id)a3 completion:(id)a4;
- (void)revokeWithCompletion:(id)a3;
@end

@implementation HKSharingRecipientAuthorizationStore

- (HKSharingRecipientAuthorizationStore)initWithHealthStore:(id)a3 recipientIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)HKSharingRecipientAuthorizationStore;
  v9 = [(HKSharingRecipientAuthorizationStore *)&v26 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_healthStore, a3);
    uint64_t v11 = [v8 copy];
    recipientIdentifier = v10->_recipientIdentifier;
    v10->_recipientIdentifier = (HKSharingRecipientIdentifier *)v11;

    v13 = [HKTaskServerProxyProvider alloc];
    healthStore = v10->_healthStore;
    v15 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v16 = [(HKTaskServerProxyProvider *)v13 initWithHealthStore:healthStore taskIdentifier:@"HKSharingRecipientAuthorizationStoreServerIdentifier" exportedObject:v10 taskUUID:v15];
    proxyProvider = v10->_proxyProvider;
    v10->_proxyProvider = (HKTaskServerProxyProvider *)v16;

    v18 = objc_alloc_init(HKSharingRecipientAuthorizationStoreTaskConfiguration);
    [(HKSharingRecipientAuthorizationStoreTaskConfiguration *)v18 setRecipientIdentifier:v10->_recipientIdentifier];
    [(HKTaskServerProxyProvider *)v10->_proxyProvider setTaskConfiguration:v18];
    v19 = [HKObserverSet alloc];
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    v22 = HKLogSharing();
    uint64_t v23 = [(HKObserverSet *)v19 initWithName:v21 loggingCategory:v22];
    observers = v10->_observers;
    v10->_observers = (HKObserverSet *)v23;
  }
  return v10;
}

- (void)fetchSharingAuthorizationsWithCompletion:(id)a3
{
  v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsWithCompletion___block_invoke;
  v9[3] = &unk_1E58C6310;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBC48;
  v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __81__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSharingAuthorizationsWithCompletion:", *(void *)(a1 + 32));
}

void __81__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __81__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchSharingAuthorizationsMarkedForDeletionWithCompletion:(id)a3
{
  v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __98__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsMarkedForDeletionWithCompletion___block_invoke;
  v9[3] = &unk_1E58C6310;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsMarkedForDeletionWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBC48;
  v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __98__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsMarkedForDeletionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSharingAuthorizationsMarkedForDeletionWithCompletion:", *(void *)(a1 + 32));
}

void __98__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsMarkedForDeletionWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __98__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsMarkedForDeletionWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)addSharingAuthorizations:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__HKSharingRecipientAuthorizationStore_addSharingAuthorizations_completion___block_invoke;
  v13[3] = &unk_1E58C6338;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__HKSharingRecipientAuthorizationStore_addSharingAuthorizations_completion___block_invoke_2;
  v11[3] = &unk_1E58BBC48;
  v11[4] = self;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __76__HKSharingRecipientAuthorizationStore_addSharingAuthorizations_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_addSharingAuthorizations:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __76__HKSharingRecipientAuthorizationStore_addSharingAuthorizations_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__HKSharingRecipientAuthorizationStore_addSharingAuthorizations_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removeSharingAuthorizations:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__HKSharingRecipientAuthorizationStore_removeSharingAuthorizations_completion___block_invoke;
  v13[3] = &unk_1E58C6338;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__HKSharingRecipientAuthorizationStore_removeSharingAuthorizations_completion___block_invoke_2;
  v11[3] = &unk_1E58BBC48;
  v11[4] = self;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __79__HKSharingRecipientAuthorizationStore_removeSharingAuthorizations_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_removeSharingAuthorizations:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __79__HKSharingRecipientAuthorizationStore_removeSharingAuthorizations_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __79__HKSharingRecipientAuthorizationStore_removeSharingAuthorizations_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)revokeWithCompletion:(id)a3
{
  v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__HKSharingRecipientAuthorizationStore_revokeWithCompletion___block_invoke;
  v9[3] = &unk_1E58C6310;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__HKSharingRecipientAuthorizationStore_revokeWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBC48;
  v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __61__HKSharingRecipientAuthorizationStore_revokeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_revokeWithCompletion:", *(void *)(a1 + 32));
}

void __61__HKSharingRecipientAuthorizationStore_revokeWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__HKSharingRecipientAuthorizationStore_revokeWithCompletion___block_invoke_2_cold_1();
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
  v8[2] = __52__HKSharingRecipientAuthorizationStore_addObserver___block_invoke;
  v8[3] = &unk_1E58BBA00;
  v8[4] = self;
  [(HKObserverSet *)observers registerObserver:v6 queue:v7 runIfFirstObserver:v8];
}

void __52__HKSharingRecipientAuthorizationStore_addObserver___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = MEMORY[0x1E4F143A8];
  uint64_t v3 = 3221225472;
  v4 = __52__HKSharingRecipientAuthorizationStore_addObserver___block_invoke_2;
  v5 = &unk_1E58BE428;
  objc_copyWeak(&v6, &location);
  [*(id *)(*(void *)(a1 + 32) + 24) setAutomaticProxyReconnectionHandler:&v2];
  objc_msgSend(*(id *)(a1 + 32), "_registerRemoteObservers", v2, v3, v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __52__HKSharingRecipientAuthorizationStore_addObserver___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _registerRemoteObservers];
}

- (void)removeObserver:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__HKSharingRecipientAuthorizationStore_removeObserver___block_invoke;
  v4[3] = &unk_1E58BBA00;
  v4[4] = self;
  [(HKObserverSet *)observers unregisterObserver:a3 runIfLastObserver:v4];
}

uint64_t __55__HKSharingRecipientAuthorizationStore_removeObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) setAutomaticProxyReconnectionHandler:0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__HKSharingRecipientAuthorizationStore_removeObserver___block_invoke_3;
  v5[3] = &unk_1E58BBCC0;
  v5[4] = v2;
  return [v3 fetchProxyWithHandler:&__block_literal_global_98 errorHandler:v5];
}

uint64_t __55__HKSharingRecipientAuthorizationStore_removeObserver___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_unregisterObservers");
}

void __55__HKSharingRecipientAuthorizationStore_removeObserver___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  uint64_t v3 = HKLogSharing();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __55__HKSharingRecipientAuthorizationStore_removeObserver___block_invoke_3_cold_1();
  }
}

+ (id)clientInterface
{
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED536F0];
  id v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_clientRemote_didAddSharingAuthorizations_, 0, 0);
  id v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_clientRemote_didRemoveSharingAuthorizations_, 0, 0);

  return v2;
}

+ (id)serverInterface
{
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED53750];
  id v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_fetchSharingAuthorizationsWithCompletion_, 0, 1);
  id v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_addSharingAuthorizations_completion_, 0, 0);
  id v5 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_removeSharingAuthorizations_completion_, 0, 0);

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

- (void)clientRemote_didAddSharingAuthorizations:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__HKSharingRecipientAuthorizationStore_clientRemote_didAddSharingAuthorizations___block_invoke;
  v7[3] = &unk_1E58C6380;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HKObserverSet *)observers notifyObservers:v7];
}

uint64_t __81__HKSharingRecipientAuthorizationStore_clientRemote_didAddSharingAuthorizations___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sharingRecipientAuthorizationStore:*(void *)(a1 + 32) didAddSharingAuthorizations:*(void *)(a1 + 40)];
}

- (void)clientRemote_didRemoveSharingAuthorizations:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__HKSharingRecipientAuthorizationStore_clientRemote_didRemoveSharingAuthorizations___block_invoke;
  v7[3] = &unk_1E58C6380;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HKObserverSet *)observers notifyObservers:v7];
}

uint64_t __84__HKSharingRecipientAuthorizationStore_clientRemote_didRemoveSharingAuthorizations___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sharingRecipientAuthorizationStore:*(void *)(a1 + 32) didRemoveSharingAuthorizations:*(void *)(a1 + 40)];
}

- (void)clientRemote_wasRevoked
{
  observers = self->_observers;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__HKSharingRecipientAuthorizationStore_clientRemote_wasRevoked__block_invoke;
  v3[3] = &unk_1E58C63A8;
  v3[4] = self;
  [(HKObserverSet *)observers notifyObservers:v3];
}

uint64_t __63__HKSharingRecipientAuthorizationStore_clientRemote_wasRevoked__block_invoke(uint64_t a1, void *a2)
{
  return [a2 sharingRecipientAuthorizationWasRevokedForStore:*(void *)(a1 + 32)];
}

- (void)_registerRemoteObservers
{
  proxyProvider = self->_proxyProvider;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__HKSharingRecipientAuthorizationStore__registerRemoteObservers__block_invoke_2;
  v3[3] = &unk_1E58BBCC0;
  v3[4] = self;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:&__block_literal_global_83 errorHandler:v3];
}

uint64_t __64__HKSharingRecipientAuthorizationStore__registerRemoteObservers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_registerObservers");
}

void __64__HKSharingRecipientAuthorizationStore__registerRemoteObservers__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  id v3 = HKLogSharing();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __64__HKSharingRecipientAuthorizationStore__registerRemoteObservers__block_invoke_2_cold_1();
  }
}

- (HKSharingRecipientIdentifier)recipientIdentifier
{
  return self->_recipientIdentifier;
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

  objc_storeStrong((id *)&self->_recipientIdentifier, 0);
}

void __81__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[summary-sharing] %{public}@: Error fetching sharing authorizations %{public}@");
}

void __98__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsMarkedForDeletionWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[summary-sharing] %{public}@: Error fetching sharing authorizations marked for deletion %{public}@");
}

void __76__HKSharingRecipientAuthorizationStore_addSharingAuthorizations_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: Error adding sharing authorizations %{public}@");
}

void __79__HKSharingRecipientAuthorizationStore_removeSharingAuthorizations_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: Error removing sharing authorizations %{public}@");
}

void __61__HKSharingRecipientAuthorizationStore_revokeWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: Error revoking sharing authorizations %{public}@");
}

void __55__HKSharingRecipientAuthorizationStore_removeObserver___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[summary-sharing] %{public}@: Error unregistering observers %{public}@");
}

void __64__HKSharingRecipientAuthorizationStore__registerRemoteObservers__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[summary-sharing] %{public}@: Error registering observers %{public}@");
}

@end