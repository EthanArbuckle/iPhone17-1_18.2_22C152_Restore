@interface HKConceptStore
+ (id)clientInterface;
+ (id)serverInterface;
+ (id)taskServerIdentifier;
- (HKConceptStore)init;
- (HKConceptStore)initWithHealthStore:(id)a3;
- (HKHealthStore)healthStore;
- (HKTaskServerProxyProvider)proxyProvider;
- (NSUUID)identifier;
- (id)countOfConceptsAssociatedToUserRecordsWithError:(id *)a3;
- (id)exportedInterface;
- (id)remoteInterface;
- (unint64_t)currentConceptIndexerState;
- (void)_startObservingConceptIndexManager;
- (void)clientRemote_conceptIndexManagerDidChangeState:(unint64_t)a3;
- (void)connectionInvalidated;
- (void)fetchConceptForIdentifier:(id)a3 loadRelationships:(BOOL)a4 completionHandler:(id)a5;
- (void)registerAsConceptObserver:(id)a3 onQueue:(id)a4;
- (void)setHealthStore:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setProxyProvider:(id)a3;
- (void)startObservingConceptIndexManagerWithCompletion:(id)a3;
- (void)unregisterAsConceptObserver:(id)a3;
@end

@implementation HKConceptStore

+ (id)taskServerIdentifier
{
  return @"HDOntologyTaskServerIdentifier";
}

- (HKConceptStore)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKConceptStore)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKConceptStore;
  v6 = [(HKConceptStore *)&v17 init];
  v7 = v6;
  if (v6)
  {
    v6->_conceptIndexManagerStateLock._os_unfair_lock_opaque = 0;
    v6->_lastKnownConceptIndexManagerState = 0;
    objc_storeStrong((id *)&v6->_healthStore, a3);
    uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v8;

    v10 = [[HKTaskServerProxyProvider alloc] initWithHealthStore:v7->_healthStore taskIdentifier:@"HDOntologyTaskServerIdentifier" exportedObject:v7 taskUUID:v7->_identifier];
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = v10;

    [(HKProxyProvider *)v7->_proxyProvider setShouldRetryOnInterruption:0];
    v12 = objc_alloc_init(HKConceptStoreServerConfiguration);
    [(HKTaskServerProxyProvider *)v7->_proxyProvider setTaskConfiguration:v12];

    v13 = [HKObserverSet alloc];
    uint64_t v14 = [(HKObserverSet *)v13 initWithName:@"Concept Store Observers" loggingCategory:HKLogHealthRecords];
    conceptObservers = v7->_conceptObservers;
    v7->_conceptObservers = (HKObserverSet *)v14;
  }
  return v7;
}

- (void)_startObservingConceptIndexManager
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__HKConceptStore__startObservingConceptIndexManager__block_invoke;
  aBlock[3] = &unk_1E58BBE28;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  [(HKConceptStore *)self startObservingConceptIndexManagerWithCompletion:v3];
}

void __52__HKConceptStore__startObservingConceptIndexManager__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      __52__HKConceptStore__startObservingConceptIndexManager__block_invoke_cold_1(a1, (uint64_t)v5, v6);
    }
  }
}

- (void)startObservingConceptIndexManagerWithCompletion:(id)a3
{
  uint64_t v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__HKConceptStore_startObservingConceptIndexManagerWithCompletion___block_invoke;
  v9[3] = &unk_1E58C7A40;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__HKConceptStore_startObservingConceptIndexManagerWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __66__HKConceptStore_startObservingConceptIndexManagerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startObservingConceptIndexManagerWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __66__HKConceptStore_startObservingConceptIndexManagerWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchConceptForIdentifier:(id)a3 loadRelationships:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__HKConceptStore_fetchConceptForIdentifier_loadRelationships_completionHandler___block_invoke;
  v15[3] = &unk_1E58C7A90;
  id v16 = v8;
  BOOL v18 = a4;
  id v17 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__HKConceptStore_fetchConceptForIdentifier_loadRelationships_completionHandler___block_invoke_3;
  v13[3] = &unk_1E58BBD88;
  id v14 = v17;
  id v11 = v17;
  id v12 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v15 errorHandler:v13];
}

void __80__HKConceptStore_fetchConceptForIdentifier_loadRelationships_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__HKConceptStore_fetchConceptForIdentifier_loadRelationships_completionHandler___block_invoke_2;
  v5[3] = &unk_1E58C7A68;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_queryConceptByIdentifier:loadRelationships:completion:", v4, v3, v5);
}

uint64_t __80__HKConceptStore_fetchConceptForIdentifier_loadRelationships_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__HKConceptStore_fetchConceptForIdentifier_loadRelationships_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)countOfConceptsAssociatedToUserRecordsWithError:(id *)a3
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__46;
  v20 = __Block_byref_object_dispose__46;
  id v21 = 0;
  uint64_t v13 = 0;
  v14[0] = &v13;
  v14[1] = 0x3032000000;
  v14[2] = __Block_byref_object_copy__46;
  v14[3] = __Block_byref_object_dispose__46;
  id v15 = 0;
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__HKConceptStore_countOfConceptsAssociatedToUserRecordsWithError___block_invoke;
  v12[3] = &unk_1E58C5340;
  v12[4] = &v16;
  v12[5] = &v13;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__HKConceptStore_countOfConceptsAssociatedToUserRecordsWithError___block_invoke_3;
  v11[3] = &unk_1E58BDBD8;
  v11[4] = &v13;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v12 errorHandler:v11];
  id v5 = (void *)v17[5];
  if (!v5)
  {
    id v6 = *(id *)(v14[0] + 40);
    v7 = v6;
    if (v6)
    {
      if (a3) {
        *a3 = v6;
      }
      else {
        _HKLogDroppedError(v6);
      }
    }

    _HKInitializeLogging();
    id v8 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      -[HKConceptStore countOfConceptsAssociatedToUserRecordsWithError:]((uint64_t)v14, v8);
    }
    id v5 = (void *)v17[5];
  }
  id v9 = v5;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v16, 8);

  return v9;
}

uint64_t __66__HKConceptStore_countOfConceptsAssociatedToUserRecordsWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__HKConceptStore_countOfConceptsAssociatedToUserRecordsWithError___block_invoke_2;
  v3[3] = &unk_1E58C5318;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_queryCountOfConceptsAssociatedToUserRecordsWithCompletion:", v3);
}

void __66__HKConceptStore_countOfConceptsAssociatedToUserRecordsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

uint64_t __66__HKConceptStore_countOfConceptsAssociatedToUserRecordsWithError___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return MEMORY[0x1F41817F8](v3, v5);
}

- (unint64_t)currentConceptIndexerState
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  proxyProvider = self->_proxyProvider;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__HKConceptStore_currentConceptIndexerState__block_invoke;
  v7[3] = &unk_1E58C7AE0;
  void v7[4] = &v8;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v7 errorHandler:&__block_literal_global_108];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__HKConceptStore_currentConceptIndexerState__block_invoke_30;
  v6[3] = &unk_1E58BBBA8;
  v6[4] = self;
  v6[5] = &v8;
  HKWithUnfairLock(&self->_conceptIndexManagerStateLock, v6);
  unint64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __44__HKConceptStore_currentConceptIndexerState__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__HKConceptStore_currentConceptIndexerState__block_invoke_2;
  v3[3] = &unk_1E58C7AB8;
  void v3[4] = *(void *)(a1 + 32);
  return objc_msgSend(a2, "remote_currentIndexingState:", v3);
}

uint64_t __44__HKConceptStore_currentConceptIndexerState__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __44__HKConceptStore_currentConceptIndexerState__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  uint64_t v3 = HKLogHealthRecords;
  if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
    __44__HKConceptStore_currentConceptIndexerState__block_invoke_3_cold_1((uint64_t)v2, v3);
  }
}

uint64_t __44__HKConceptStore_currentConceptIndexerState__block_invoke_30(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 24) = *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  return result;
}

- (void)registerAsConceptObserver:(id)a3 onQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__HKConceptStore_registerAsConceptObserver_onQueue___block_invoke;
  v11[3] = &unk_1E58BB9C8;
  p_conceptIndexManagerStateLock = &self->_conceptIndexManagerStateLock;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  HKWithUnfairLock(p_conceptIndexManagerStateLock, v11);
}

uint64_t __52__HKConceptStore_registerAsConceptObserver_onQueue___block_invoke(void *a1)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = a1[5];
  uint64_t v4 = *(void *)(v3 + 24);
  uint64_t v5 = *(void **)(v3 + 8);
  uint64_t v6 = a1[6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__HKConceptStore_registerAsConceptObserver_onQueue___block_invoke_2;
  v12[3] = &unk_1E58BBA00;
  v12[4] = v3;
  [v5 registerObserver:v2 queue:v6 runIfFirstObserver:v12];
  uint64_t v8 = a1[4];
  uint64_t v7 = a1[5];
  id v9 = *(void **)(v8 + 8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__HKConceptStore_registerAsConceptObserver_onQueue___block_invoke_3;
  v11[3] = &unk_1E58C7B08;
  v11[4] = v8;
  void v11[5] = v4;
  return [v9 notifyObserver:v7 handler:v11];
}

uint64_t __52__HKConceptStore_registerAsConceptObserver_onQueue___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startObservingConceptIndexManager];
}

uint64_t __52__HKConceptStore_registerAsConceptObserver_onQueue___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 conceptStore:*(void *)(a1 + 32) indexManagerDidChangeState:*(void *)(a1 + 40)];
}

- (void)unregisterAsConceptObserver:(id)a3
{
}

- (void)clientRemote_conceptIndexManagerDidChangeState:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__HKConceptStore_clientRemote_conceptIndexManagerDidChangeState___block_invoke;
  v3[3] = &unk_1E58BD9D0;
  void v3[4] = self;
  void v3[5] = a3;
  HKWithUnfairLock(&self->_conceptIndexManagerStateLock, v3);
}

uint64_t __65__HKConceptStore_clientRemote_conceptIndexManagerDidChangeState___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(result + 40);
  if (*(void *)(v1 + 24) != v2)
  {
    *(void *)(v1 + 24) = v2;
    uint64_t v3 = *(void *)(result + 32);
    uint64_t v4 = *(void **)(v3 + 8);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__HKConceptStore_clientRemote_conceptIndexManagerDidChangeState___block_invoke_2;
    v6[3] = &unk_1E58C7B08;
    uint64_t v5 = *(void *)(result + 40);
    v6[4] = v3;
    v6[5] = v5;
    return [v4 notifyObservers:v6];
  }
  return result;
}

uint64_t __65__HKConceptStore_clientRemote_conceptIndexManagerDidChangeState___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 conceptStore:*(void *)(a1 + 32) indexManagerDidChangeState:*(void *)(a1 + 40)];
}

+ (id)serverInterface
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED53930];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_remote_queryRelationshipsForNodeWithID_completion_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v7 forSelector:sel_remote_queryRelationshipsForNodeWithID_completion_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED22550];
}

- (id)exportedInterface
{
  uint64_t v2 = objc_opt_class();

  return (id)[v2 clientInterface];
}

- (id)remoteInterface
{
  uint64_t v2 = objc_opt_class();

  return (id)[v2 serverInterface];
}

- (void)connectionInvalidated
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "Connection Invalidated", v1, 2u);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
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
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);

  objc_storeStrong((id *)&self->_conceptObservers, 0);
}

void __52__HKConceptStore__startObservingConceptIndexManager__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 40);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "Unable to fetch ontology task server %@ proxy after interrupted connection with error: %@", (uint8_t *)&v4, 0x16u);
}

- (void)countOfConceptsAssociatedToUserRecordsWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Error getting count of concepts associated to user records: %@", (uint8_t *)&v3, 0xCu);
}

void __44__HKConceptStore_currentConceptIndexerState__block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Error fetching proxy attempting to get current concept indexer state: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end