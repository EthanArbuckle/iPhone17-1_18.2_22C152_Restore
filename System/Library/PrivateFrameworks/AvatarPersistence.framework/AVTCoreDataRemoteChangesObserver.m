@interface AVTCoreDataRemoteChangesObserver
- (AVTCoreDataPersistentStoreConfiguration)configuration;
- (AVTCoreDataRemoteChangesObserver)initWithConfiguration:(id)a3 workQueue:(id)a4 coalescer:(id)a5 environment:(id)a6;
- (AVTCoreEnvironment)environment;
- (AVTEventCoalescer)coalescer;
- (AVTUILogger)logger;
- (BOOL)isObservingChanges;
- (NSMutableArray)changeHandlers;
- (NSMutableArray)transactionsForPendingChanges;
- (NSObject)observationToken;
- (OS_dispatch_queue)workQueue;
- (id)changeTransactionsForToken:(id)a3 managedObjectContext:(id)a4;
- (void)addChangesHandler:(id)a3;
- (void)performManagedObjectContextWork:(id)a3;
- (void)processRemoteChangeNotification:(id)a3 completion:(id)a4;
- (void)registerCoalescerEventHandler;
- (void)setObservationToken:(id)a3;
- (void)startObservingChanges;
@end

@implementation AVTCoreDataRemoteChangesObserver

- (AVTCoreDataRemoteChangesObserver)initWithConfiguration:(id)a3 workQueue:(id)a4 coalescer:(id)a5 environment:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)AVTCoreDataRemoteChangesObserver;
  v15 = [(AVTCoreDataRemoteChangesObserver *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_configuration, a3);
    uint64_t v17 = [v14 logger];
    logger = v16->_logger;
    v16->_logger = (AVTUILogger *)v17;

    objc_storeStrong((id *)&v16->_workQueue, a4);
    objc_storeStrong((id *)&v16->_coalescer, a5);
    objc_storeStrong((id *)&v16->_environment, a6);
    uint64_t v19 = [MEMORY[0x263EFF980] array];
    changeHandlers = v16->_changeHandlers;
    v16->_changeHandlers = (NSMutableArray *)v19;

    uint64_t v21 = [MEMORY[0x263EFF980] array];
    transactionsForPendingChanges = v16->_transactionsForPendingChanges;
    v16->_transactionsForPendingChanges = (NSMutableArray *)v21;
  }
  return v16;
}

- (void)addChangesHandler:(id)a3
{
  id v4 = a3;
  v5 = [(AVTCoreDataRemoteChangesObserver *)self observationToken];

  if (v5) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Add handler before starting to observe!"];
  }
  id v8 = [(AVTCoreDataRemoteChangesObserver *)self changeHandlers];
  v6 = (void *)[v4 copy];

  v7 = (void *)MEMORY[0x22A660070](v6);
  [v8 addObject:v7];
}

- (void)registerCoalescerEventHandler
{
  objc_initWeak(&location, self);
  v3 = [(AVTCoreDataRemoteChangesObserver *)self coalescer];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__AVTCoreDataRemoteChangesObserver_registerCoalescerEventHandler__block_invoke;
  v4[3] = &unk_2647C3680;
  objc_copyWeak(&v5, &location);
  [v3 registerEventForCoalescingWithLabel:@"NSPersistentStoreRemoteChangeNotification" handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __65__AVTCoreDataRemoteChangesObserver_registerCoalescerEventHandler__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __65__AVTCoreDataRemoteChangesObserver_registerCoalescerEventHandler__block_invoke_2;
  v2[3] = &unk_2647C3960;
  v2[4] = WeakRetained;
  [WeakRetained performManagedObjectContextWork:v2];
}

void __65__AVTCoreDataRemoteChangesObserver_registerCoalescerEventHandler__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) transactionsForPendingChanges];
  id v5 = (void *)[v4 copy];

  v6 = [*(id *)(a1 + 32) transactionsForPendingChanges];
  [v6 removeAllObjects];

  v7 = [*(id *)(a1 + 32) logger];
  uint64_t v8 = [v5 count];
  v9 = [*(id *)(a1 + 32) changeHandlers];
  objc_msgSend(v7, "logDispatchingRemoteChangeWithTransactionCount:handlersCount:", v8, objc_msgSend(v9, "count"));

  v10 = [*(id *)(a1 + 32) changeHandlers];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__AVTCoreDataRemoteChangesObserver_registerCoalescerEventHandler__block_invoke_3;
  v13[3] = &unk_2647C3938;
  id v14 = v3;
  id v15 = v5;
  id v11 = v5;
  id v12 = v3;
  [v10 enumerateObjectsUsingBlock:v13];
}

uint64_t __65__AVTCoreDataRemoteChangesObserver_registerCoalescerEventHandler__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)startObservingChanges
{
  id v3 = [(AVTCoreDataRemoteChangesObserver *)self observationToken];

  if (v3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Already observing!"];
  }
  [(AVTCoreDataRemoteChangesObserver *)self registerCoalescerEventHandler];
  id v4 = [(AVTCoreDataRemoteChangesObserver *)self configuration];
  id v5 = [v4 persistentStoreCoordinator];

  v6 = [(AVTCoreDataRemoteChangesObserver *)self logger];
  v7 = [v5 description];
  [v6 logStartObservingRemoteChangeNotificationFrom:v7];

  objc_initWeak(&location, self);
  uint64_t v8 = [(AVTCoreDataRemoteChangesObserver *)self environment];
  v9 = [v8 notificationCenter];
  uint64_t v10 = *MEMORY[0x263EFF0F8];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __57__AVTCoreDataRemoteChangesObserver_startObservingChanges__block_invoke;
  id v15 = &unk_2647C3368;
  objc_copyWeak(&v16, &location);
  id v11 = [v9 addObserverForName:v10 object:v5 queue:0 usingBlock:&v12];
  -[AVTCoreDataRemoteChangesObserver setObservationToken:](self, "setObservationToken:", v11, v12, v13, v14, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __57__AVTCoreDataRemoteChangesObserver_startObservingChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = (void *)os_transaction_create();
    v6 = [WeakRetained workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__AVTCoreDataRemoteChangesObserver_startObservingChanges__block_invoke_2;
    block[3] = &unk_2647C39B0;
    block[4] = WeakRetained;
    id v9 = v3;
    id v10 = v5;
    id v7 = v5;
    dispatch_async(v6, block);
  }
}

void __57__AVTCoreDataRemoteChangesObserver_startObservingChanges__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__AVTCoreDataRemoteChangesObserver_startObservingChanges__block_invoke_3;
  v3[3] = &unk_2647C3988;
  id v4 = *(id *)(a1 + 48);
  [v1 processRemoteChangeNotification:v2 completion:v3];
}

- (BOOL)isObservingChanges
{
  uint64_t v2 = [(AVTCoreDataRemoteChangesObserver *)self observationToken];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)processRemoteChangeNotification:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AVTCoreDataRemoteChangesObserver *)self logger];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79__AVTCoreDataRemoteChangesObserver_processRemoteChangeNotification_completion___block_invoke;
  v11[3] = &unk_2647C3A28;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 processingRemoteChangeNotification:v11];
}

void __79__AVTCoreDataRemoteChangesObserver_processRemoteChangeNotification_completion___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] logger];
  BOOL v3 = [a1[5] description];
  id v4 = [a1[5] object];
  id v5 = [v3 stringByAppendingFormat:@" object:%@", v4];
  [v2 logReceivedRemoteChange:v5];

  id v6 = [a1[5] userInfo];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263EFF098]];

  id v8 = a1[4];
  if (v7)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __79__AVTCoreDataRemoteChangesObserver_processRemoteChangeNotification_completion___block_invoke_2;
    v10[3] = &unk_2647C3A00;
    v10[4] = v8;
    id v11 = v7;
    id v12 = a1[6];
    [v8 performManagedObjectContextWork:v10];
  }
  else
  {
    id v9 = [a1[4] logger];
    [v9 logNotificationDoesntContainChangeHistoryToken];

    (*((void (**)(void))a1[6] + 2))();
  }
}

void __79__AVTCoreDataRemoteChangesObserver_processRemoteChangeNotification_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  BOOL v3 = [*(id *)(a1 + 32) changeTransactionsForToken:*(void *)(a1 + 40) managedObjectContext:a2];
  id v4 = [*(id *)(a1 + 32) transactionsForPendingChanges];
  [v4 addObjectsFromArray:v3];

  id v5 = [*(id *)(a1 + 32) coalescer];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__AVTCoreDataRemoteChangesObserver_processRemoteChangeNotification_completion___block_invoke_3;
  v6[3] = &unk_2647C39D8;
  id v7 = *(id *)(a1 + 48);
  [v5 eventDidOccur:v6];
}

uint64_t __79__AVTCoreDataRemoteChangesObserver_processRemoteChangeNotification_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)changeTransactionsForToken:(id)a3 managedObjectContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AVTCoreDataRemoteChangesObserver *)self logger];
  id v9 = [v7 description];
  [v8 logInspectingChangesForExportAfterToken:v9];

  id v10 = [MEMORY[0x263EFF2F8] fetchHistoryTransactionForToken:v7];

  [v10 setResultType:5];
  id v17 = 0;
  id v11 = [v6 executeRequest:v10 error:&v17];

  id v12 = v17;
  if (v11)
  {
    id v13 = [v11 result];
  }
  else
  {
    id v14 = [(AVTCoreDataRemoteChangesObserver *)self logger];
    id v15 = [v12 description];
    [v14 logErrorFetchingChangeHistory:v15];

    id v13 = 0;
  }

  return v13;
}

- (void)performManagedObjectContextWork:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTCoreDataRemoteChangesObserver *)self configuration];
  id v6 = [v5 createManagedObjectContext];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__AVTCoreDataRemoteChangesObserver_performManagedObjectContextWork___block_invoke;
  v9[3] = &unk_2647C3848;
  id v10 = v6;
  id v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v6;
  [v8 performBlockAndWait:v9];
}

void __68__AVTCoreDataRemoteChangesObserver_performManagedObjectContextWork___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v3 = [MEMORY[0x263EFF340] currentQueryGenerationToken];
  id v8 = 0;
  char v4 = [v2 setQueryGenerationFromToken:v3 error:&v8];
  id v5 = v8;

  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) logger];
    id v7 = [v5 description];
    [v6 logErrorPinningContextToCurrentQueryGenerationToken:v7];
  }
}

- (AVTCoreDataPersistentStoreConfiguration)configuration
{
  return self->_configuration;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (AVTEventCoalescer)coalescer
{
  return self->_coalescer;
}

- (AVTCoreEnvironment)environment
{
  return self->_environment;
}

- (NSObject)observationToken
{
  return self->_observationToken;
}

- (void)setObservationToken:(id)a3
{
}

- (NSMutableArray)changeHandlers
{
  return self->_changeHandlers;
}

- (NSMutableArray)transactionsForPendingChanges
{
  return self->_transactionsForPendingChanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionsForPendingChanges, 0);
  objc_storeStrong((id *)&self->_changeHandlers, 0);
  objc_storeStrong((id *)&self->_observationToken, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_coalescer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end