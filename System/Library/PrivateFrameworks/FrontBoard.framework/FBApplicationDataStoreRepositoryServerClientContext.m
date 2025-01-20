@interface FBApplicationDataStoreRepositoryServerClientContext
- (BOOL)interestedInAllChanges;
- (FBApplicationDataStoreRepositoryServerClientContext)initWithDataStore:(id)a3;
- (FBApplicationDataStoreRepositoryServerClientContextDelegate)delegate;
- (FBSServiceFacilityClientHandle)clientHandle;
- (NSSet)prefetchedKeys;
- (void)_queue_updateObservers;
- (void)_repositoryInvalidated:(id)a3;
- (void)_valueChanged:(id)a3;
- (void)dealloc;
- (void)setClientHandle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInterestedInAllChanges:(BOOL)a3;
- (void)setPrefetchedKeys:(id)a3;
@end

@implementation FBApplicationDataStoreRepositoryServerClientContext

- (FBApplicationDataStoreRepositoryServerClientContext)initWithDataStore:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FBApplicationDataStoreRepositoryServerClientContext;
  v6 = [(FBApplicationDataStoreRepositoryServerClientContext *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataStore, a3);
    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)Serial;

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel__repositoryInvalidated_ name:@"FBApplicationStoreRepositoryInvalidatedNotification" object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FBApplicationDataStoreRepositoryServerClientContext;
  [(FBApplicationDataStoreRepositoryServerClientContext *)&v4 dealloc];
}

- (void)setInterestedInAllChanges:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__FBApplicationDataStoreRepositoryServerClientContext_setInterestedInAllChanges___block_invoke;
  v4[3] = &unk_1E5C49EA8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

uint64_t __81__FBApplicationDataStoreRepositoryServerClientContext_setInterestedInAllChanges___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 32) != v2)
  {
    *(unsigned char *)(v1 + 32) = v2;
    return objc_msgSend(*(id *)(result + 32), "_queue_updateObservers");
  }
  return result;
}

- (void)setPrefetchedKeys:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__FBApplicationDataStoreRepositoryServerClientContext_setPrefetchedKeys___block_invoke;
  v7[3] = &unk_1E5C497A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __73__FBApplicationDataStoreRepositoryServerClientContext_setPrefetchedKeys___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  BOOL v5 = *(void **)(a1 + 32);

  return objc_msgSend(v5, "_queue_updateObservers");
}

- (void)_queue_updateObservers
{
  if ([(NSSet *)self->_prefetchedKeys count]) { {
    BOOL interestedInAllChanges = 1;
  }
  }
  else {
    BOOL interestedInAllChanges = self->_interestedInAllChanges;
  }
  if (self->_observingChanges != interestedInAllChanges)
  {
    self->_observingChanges = interestedInAllChanges;
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v5 = v4;
    if (self->_observingChanges) { {
      [v4 addObserver:self selector:sel__valueChanged_ name:@"FBApplicationStoreRepositoryChangeNotification" object:0];
    }
    }
    else {
      [v4 removeObserver:self name:@"FBApplicationStoreRepositoryChangeNotification" object:0];
    }
  }
}

- (void)_valueChanged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v11 = [v5 objectForKey:@"FBApplicationStoreRepositoryChangeApp"];

  id v6 = [v4 userInfo];
  v7 = [v6 objectForKey:@"FBApplicationStoreRepositoryChangeKey"];

  id v8 = [v4 userInfo];

  v9 = [v8 objectForKey:@"FBApplicationStoreRepositoryChangeValue"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained applicationDataStoreRepositoryClientContext:self valueChangedForObject:v9 key:v7 appID:v11];
}

- (void)_repositoryInvalidated:(id)a3
{
  id v4 = [a3 userInfo];
  id v6 = [v4 objectForKey:@"FBApplicationStoreRepositoryChangeApp"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained applicationDataStoreRepositoryClientContext:self repositoryInvalidatedForAppID:v6];
}

- (FBApplicationDataStoreRepositoryServerClientContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FBApplicationDataStoreRepositoryServerClientContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FBSServiceFacilityClientHandle)clientHandle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  return (FBSServiceFacilityClientHandle *)WeakRetained;
}

- (void)setClientHandle:(id)a3
{
}

- (NSSet)prefetchedKeys
{
  return self->_prefetchedKeys;
}

- (BOOL)interestedInAllChanges
{
  return self->_interestedInAllChanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end