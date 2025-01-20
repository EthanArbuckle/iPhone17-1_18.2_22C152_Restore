@interface HKOntologyStore
+ (id)clientInterface;
+ (id)serverInterface;
- (BOOL)_synchronouslyRegisterToObserveOntologyStoreChanges:(id *)a3;
- (HKOntologyStore)init;
- (HKOntologyStore)initWithHealthStore:(id)a3;
- (id)exportedInterface;
- (id)remoteInterface;
- (id)unitTesting_didChangeObserverRegistration;
- (void)_callUnitTestHookObserving:(BOOL)a3 success:(BOOL)a4 error:(id)a5;
- (void)_handleAutomaticProxyReconnection;
- (void)_notifyObserversAboutReconnect;
- (void)_observeOntologyStoreChanges:(BOOL)a3 completion:(id)a4;
- (void)_registerFirstObserver;
- (void)_unregisterLastObserver;
- (void)client_didImportEntry:(id)a3;
- (void)client_didStageEntry:(id)a3;
- (void)downloadRequiredShardsWithCompletion:(id)a3;
- (void)importRequiredShardsWithCompletion:(id)a3;
- (void)insertEntries:(id)a3 completion:(id)a4;
- (void)markShardsWithIdentifiers:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)ontologyServerURLWithCompletion:(id)a3;
- (void)ontologyShardRegistryEntriesWithCompletion:(id)a3;
- (void)pruneOntologyWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)requestGatedOntologyUpdateWithCompletion:(id)a3;
- (void)setOntologyServerURL:(id)a3 completion:(id)a4;
- (void)setUnitTesting_didChangeObserverRegistration:(id)a3;
- (void)shardRequirementStatusesWithCompletion:(id)a3;
- (void)unitTest_noOpWithCompletion:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateOntologyForReason:(int64_t)a3 completion:(id)a4;
- (void)updateShardRegistryWithCompletion:(id)a3;
@end

@implementation HKOntologyStore

- (HKOntologyStore)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKOntologyStore)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HKOntologyStore;
  v5 = [(HKOntologyStore *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v8 = [[HKTaskServerProxyProvider alloc] initWithHealthStore:v4 taskIdentifier:@"HKOntologyStoreServerIdentifier" exportedObject:v5 taskUUID:v5->_identifier];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = v8;

    objc_initWeak(&location, v5);
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __39__HKOntologyStore_initWithHealthStore___block_invoke;
    v19 = &unk_1E58BE428;
    objc_copyWeak(&v20, &location);
    [(HKProxyProvider *)v5->_proxyProvider setAutomaticProxyReconnectionHandler:&v16];
    -[HKProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 1, v16, v17, v18, v19);
    v10 = [HKObserverSet alloc];
    v11 = NSStringFromProtocol((Protocol *)&unk_1EED53C30);
    v12 = HKLogHealthOntology();
    uint64_t v13 = [(HKObserverSet *)v10 initWithName:v11 loggingCategory:v12];
    observers = v5->_observers;
    v5->_observers = (HKOntologyStoreObserver *)v13;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __39__HKOntologyStore_initWithHealthStore___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleAutomaticProxyReconnection];
}

- (void)insertEntries:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v7];
  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__HKOntologyStore_insertEntries_completion___block_invoke;
  v15[3] = &unk_1E58C8F30;
  id v16 = v6;
  id v17 = v7;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__HKOntologyStore_insertEntries_completion___block_invoke_2;
  v13[3] = &unk_1E58BBD88;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v15 errorHandler:v13];
}

uint64_t __44__HKOntologyStore_insertEntries_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_insertEntries:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __44__HKOntologyStore_insertEntries_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ontologyShardRegistryEntriesWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__HKOntologyStore_ontologyShardRegistryEntriesWithCompletion___block_invoke;
  v9[3] = &unk_1E58C8F58;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__HKOntologyStore_ontologyShardRegistryEntriesWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __62__HKOntologyStore_ontologyShardRegistryEntriesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_ontologyShardRegistryEntriesWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __62__HKOntologyStore_ontologyShardRegistryEntriesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ontologyServerURLWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__HKOntologyStore_ontologyServerURLWithCompletion___block_invoke;
  v9[3] = &unk_1E58C8F58;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__HKOntologyStore_ontologyServerURLWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __51__HKOntologyStore_ontologyServerURLWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_ontologyServerURLWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __51__HKOntologyStore_ontologyServerURLWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setOntologyServerURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__HKOntologyStore_setOntologyServerURL_completion___block_invoke;
  v13[3] = &unk_1E58C8F30;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__HKOntologyStore_setOntologyServerURL_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __51__HKOntologyStore_setOntologyServerURL_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setOntologyServerURL:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __51__HKOntologyStore_setOntologyServerURL_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateShardRegistryWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__HKOntologyStore_updateShardRegistryWithCompletion___block_invoke;
  v9[3] = &unk_1E58C8F58;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__HKOntologyStore_updateShardRegistryWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __53__HKOntologyStore_updateShardRegistryWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateShardRegistryWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __53__HKOntologyStore_updateShardRegistryWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)downloadRequiredShardsWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__HKOntologyStore_downloadRequiredShardsWithCompletion___block_invoke;
  v9[3] = &unk_1E58C8F58;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__HKOntologyStore_downloadRequiredShardsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __56__HKOntologyStore_downloadRequiredShardsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_downloadRequiredShardsWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __56__HKOntologyStore_downloadRequiredShardsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)importRequiredShardsWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__HKOntologyStore_importRequiredShardsWithCompletion___block_invoke;
  v9[3] = &unk_1E58C8F58;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__HKOntologyStore_importRequiredShardsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __54__HKOntologyStore_importRequiredShardsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_importRequiredShardsWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __54__HKOntologyStore_importRequiredShardsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateOntologyForReason:(int64_t)a3 completion:(id)a4
{
  id v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__HKOntologyStore_updateOntologyForReason_completion___block_invoke;
  v11[3] = &unk_1E58C8F80;
  int64_t v13 = a3;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__HKOntologyStore_updateOntologyForReason_completion___block_invoke_2;
  v9[3] = &unk_1E58BBD88;
  id v10 = v12;
  id v8 = v12;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __54__HKOntologyStore_updateOntologyForReason_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateOntologyForReason:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __54__HKOntologyStore_updateOntologyForReason_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestGatedOntologyUpdateWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__HKOntologyStore_requestGatedOntologyUpdateWithCompletion___block_invoke;
  v9[3] = &unk_1E58C8F58;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__HKOntologyStore_requestGatedOntologyUpdateWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __60__HKOntologyStore_requestGatedOntologyUpdateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_requestGatedOntologyUpdateWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __60__HKOntologyStore_requestGatedOntologyUpdateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pruneOntologyWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__HKOntologyStore_pruneOntologyWithOptions_completion___block_invoke;
  v11[3] = &unk_1E58C8F80;
  unint64_t v13 = a3;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__HKOntologyStore_pruneOntologyWithOptions_completion___block_invoke_2;
  v9[3] = &unk_1E58BBD88;
  id v10 = v12;
  id v8 = v12;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __55__HKOntologyStore_pruneOntologyWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_pruneOntologyWithOptions:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __55__HKOntologyStore_pruneOntologyWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)markShardsWithIdentifiers:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__HKOntologyStore_markShardsWithIdentifiers_options_completion___block_invoke;
  v15[3] = &unk_1E58C8FA8;
  id v16 = v8;
  unint64_t v18 = a4;
  id v17 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__HKOntologyStore_markShardsWithIdentifiers_options_completion___block_invoke_2;
  v13[3] = &unk_1E58BBD88;
  id v14 = v17;
  id v11 = v17;
  id v12 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v15 errorHandler:v13];
}

uint64_t __64__HKOntologyStore_markShardsWithIdentifiers_options_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_markShardsWithIdentifiers:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __64__HKOntologyStore_markShardsWithIdentifiers_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)shardRequirementStatusesWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__HKOntologyStore_shardRequirementStatusesWithCompletion___block_invoke;
  v9[3] = &unk_1E58C8F58;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__HKOntologyStore_shardRequirementStatusesWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __58__HKOntologyStore_shardRequirementStatusesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_shardRequirementStatusesWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __58__HKOntologyStore_shardRequirementStatusesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  observers = self->_observers;
  id v9 = v7;
  if (!v7)
  {
    id v9 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__HKOntologyStore_registerObserver_queue___block_invoke;
  v10[3] = &unk_1E58BBA00;
  v10[4] = self;
  [(HKOntologyStoreObserver *)observers registerObserver:v6 queue:v9 runIfFirstObserver:v10];
  if (!v7) {
}
  }

uint64_t __42__HKOntologyStore_registerObserver_queue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerFirstObserver];
}

- (void)unregisterObserver:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__HKOntologyStore_unregisterObserver___block_invoke;
  v4[3] = &unk_1E58BBA00;
  v4[4] = self;
  [(HKOntologyStoreObserver *)observers unregisterObserver:a3 runIfLastObserver:v4];
}

uint64_t __38__HKOntologyStore_unregisterObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unregisterLastObserver];
}

- (void)client_didStageEntry:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__HKOntologyStore_client_didStageEntry___block_invoke;
  v7[3] = &unk_1E58C8FD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HKOntologyStoreObserver *)observers notifyObservers:v7];
}

uint64_t __40__HKOntologyStore_client_didStageEntry___block_invoke(uint64_t a1, void *a2)
{
  return [a2 ontologyStore:*(void *)(a1 + 32) didStageEntry:*(void *)(a1 + 40)];
}

- (void)client_didImportEntry:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__HKOntologyStore_client_didImportEntry___block_invoke;
  v7[3] = &unk_1E58C8FD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HKOntologyStoreObserver *)observers notifyObservers:v7];
}

uint64_t __41__HKOntologyStore_client_didImportEntry___block_invoke(uint64_t a1, void *a2)
{
  return [a2 ontologyStore:*(void *)(a1 + 32) didImportEntry:*(void *)(a1 + 40)];
}

- (id)exportedInterface
{
  v2 = objc_opt_class();

  return (id)[v2 clientInterface];
}

- (id)remoteInterface
{
  v2 = objc_opt_class();

  return (id)[v2 serverInterface];
}

+ (id)serverInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED53C90];
  id v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_insertEntries_completion_, 0, 0);
  id v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_ontologyShardRegistryEntriesWithCompletion_, 0, 1);
  id v5 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_markShardsWithIdentifiers_options_completion_, 0, 0);

  return v2;
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED2BDE8];
}

- (void)_handleAutomaticProxyReconnection
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HKOntologyStoreObserver *)self->_observers count];
  _HKInitializeLogging();
  id v4 = HKLogHealthOntology();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unint64_t v13 = self;
      _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Resume observation on server reconnection", buf, 0xCu);
    }

    id v11 = 0;
    BOOL v6 = [(HKOntologyStore *)self _synchronouslyRegisterToObserveOntologyStoreChanges:&v11];
    id v7 = v11;
    _HKInitializeLogging();
    id v8 = HKLogHealthOntology();
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        unint64_t v13 = self;
        _os_log_impl(&dword_19C023000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Received notification of successful server reconnection", buf, 0xCu);
      }

      [(HKOntologyStore *)self _notifyObserversAboutReconnect];
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(HKKeyValueDomain *)(uint64_t)self _handleAutomaticProxyReconnection];
      }
    }
  }
  else
  {
    BOOL v10 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

    if (!v10) {
      return;
    }
    id v7 = HKLogHealthOntology();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      unint64_t v13 = self;
      _os_log_impl(&dword_19C023000, v7, OS_LOG_TYPE_INFO, "%{public}@: No need to restart observation, because there are no registered observers", buf, 0xCu);
    }
  }
}

- (void)_notifyObserversAboutReconnect
{
  observers = self->_observers;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__HKOntologyStore__notifyObserversAboutReconnect__block_invoke;
  v3[3] = &unk_1E58C8FF8;
  v3[4] = self;
  [(HKOntologyStoreObserver *)observers notifyObservers:v3];
}

uint64_t __49__HKOntologyStore__notifyObserversAboutReconnect__block_invoke(uint64_t a1, void *a2)
{
  return [a2 ontologyStoreDidReconnect:*(void *)(a1 + 32)];
}

- (void)_registerFirstObserver
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41__HKOntologyStore__registerFirstObserver__block_invoke;
  v2[3] = &unk_1E58BBE28;
  v2[4] = self;
  [(HKOntologyStore *)self _observeOntologyStoreChanges:1 completion:v2];
}

void __41__HKOntologyStore__registerFirstObserver__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    BOOL v6 = HKLogHealthOntology();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __57__HKKeyValueDomain__registerFirstObserverWithCompletion___block_invoke_cold_1(a1, (uint64_t)v5, v6);
    }
  }
  [*(id *)(a1 + 32) _callUnitTestHookObserving:1 success:a2 error:v5];
}

- (void)_unregisterLastObserver
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42__HKOntologyStore__unregisterLastObserver__block_invoke;
  v2[3] = &unk_1E58BBE28;
  v2[4] = self;
  [(HKOntologyStore *)self _observeOntologyStoreChanges:0 completion:v2];
}

void __42__HKOntologyStore__unregisterLastObserver__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    BOOL v6 = HKLogHealthOntology();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);

    if (v7)
    {
      id v8 = HKLogHealthOntology();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v10 = 138543618;
        uint64_t v11 = v9;
        __int16 v12 = 2114;
        id v13 = v5;
        _os_log_impl(&dword_19C023000, v8, OS_LOG_TYPE_INFO, "%{public}@: unable to unregister observing changes: %{public}@", (uint8_t *)&v10, 0x16u);
      }
    }
  }
  [*(id *)(a1 + 32) _callUnitTestHookObserving:0 success:a2 error:v5];
}

- (void)_observeOntologyStoreChanges:(BOOL)a3 completion:(id)a4
{
  BOOL v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__HKOntologyStore__observeOntologyStoreChanges_completion___block_invoke;
  v11[3] = &unk_1E58C9020;
  BOOL v13 = a3;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__HKOntologyStore__observeOntologyStoreChanges_completion___block_invoke_2;
  v9[3] = &unk_1E58BBD88;
  id v10 = v12;
  id v8 = v12;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __59__HKOntologyStore__observeOntologyStoreChanges_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_observeOntologyStoreChanges:completion:", *(unsigned __int8 *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __59__HKOntologyStore__observeOntologyStoreChanges_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_synchronouslyRegisterToObserveOntologyStoreChanges:(id *)a3
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__58;
  id v16 = __Block_byref_object_dispose__58;
  id v17 = 0;
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__HKOntologyStore__synchronouslyRegisterToObserveOntologyStoreChanges___block_invoke;
  v11[3] = &unk_1E58C9048;
  void v11[4] = &v18;
  v11[5] = &v12;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__HKOntologyStore__synchronouslyRegisterToObserveOntologyStoreChanges___block_invoke_3;
  v10[3] = &unk_1E58BDBD8;
  v10[4] = &v12;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v11 errorHandler:v10];
  [(HKOntologyStore *)self _callUnitTestHookObserving:1 success:*((unsigned __int8 *)v19 + 24) error:v13[5]];
  id v6 = (id)v13[5];
  BOOL v7 = v6;
  if (v6)
  {
    if (a3) {
      *a3 = v6;
    }
    else {
      _HKLogDroppedError(v6);
    }
  }

  char v8 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

uint64_t __71__HKOntologyStore__synchronouslyRegisterToObserveOntologyStoreChanges___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__HKOntologyStore__synchronouslyRegisterToObserveOntologyStoreChanges___block_invoke_2;
  v3[3] = &unk_1E58BE050;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_observeOntologyStoreChanges:completion:", 1, v3);
}

void __71__HKOntologyStore__synchronouslyRegisterToObserveOntologyStoreChanges___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __71__HKOntologyStore__synchronouslyRegisterToObserveOntologyStoreChanges___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)_callUnitTestHookObserving:(BOOL)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v10 = a5;
  char v8 = _Block_copy(self->_unitTesting_didChangeObserverRegistration);
  uint64_t v9 = v8;
  if (v8) {
    (*((void (**)(void *, BOOL, BOOL, id))v8 + 2))(v8, v6, v5, v10);
  }
}

- (void)unitTest_noOpWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v4];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__HKOntologyStore_unitTest_noOpWithCompletion___block_invoke;
  v11[3] = &unk_1E58C8F58;
  id v12 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__HKOntologyStore_unitTest_noOpWithCompletion___block_invoke_2;
  v9[3] = &unk_1E58BBD88;
  id v10 = v5;
  id v7 = v5;
  id v8 = v4;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __47__HKOntologyStore_unitTest_noOpWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_unitTesting_createTaskServerNoOpWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __47__HKOntologyStore_unitTest_noOpWithCompletion___block_invoke_2(uint64_t a1)
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

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end