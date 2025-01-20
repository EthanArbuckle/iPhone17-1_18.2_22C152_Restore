@interface ASCLockupFetcher
+ (ASCLockupFetcher)sharedFetcher;
- (ASCLazy)bundleCoordinator;
- (ASCLockupFetcher)initWithConnection:(id)a3;
- (ASCPendingPromises)pendingRequests;
- (ASCServices)connection;
- (ASCTaskCoordinator)requestCoordinator;
- (id)collectionWithRequest:(id)a3;
- (id)loadedLockupWithRequest:(id)a3;
- (id)lockupForBundleID:(id)a3 withContext:(id)a4 enableAppDistribution:(BOOL)a5;
- (id)lockupFromMediaAPIResponse:(id)a3 withContext:(id)a4;
- (id)lockupWithRequest:(id)a3;
- (void)daemonConnectionWasLost:(id)a3;
- (void)daemonDidRebootstrap:(id)a3;
- (void)dealloc;
- (void)submitBatchRequest:(id)a3;
@end

@implementation ASCLockupFetcher

+ (ASCLockupFetcher)sharedFetcher
{
  if (sharedFetcher_onceToken_0 != -1) {
    dispatch_once(&sharedFetcher_onceToken_0, &__block_literal_global_9);
  }
  v2 = (void *)sharedFetcher_sharedFetcher_0;

  return (ASCLockupFetcher *)v2;
}

void __33__ASCLockupFetcher_sharedFetcher__block_invoke()
{
  v0 = [ASCLockupFetcher alloc];
  id v3 = +[ASCServicesConnection sharedConnection];
  uint64_t v1 = [(ASCLockupFetcher *)v0 initWithConnection:v3];
  v2 = (void *)sharedFetcher_sharedFetcher_0;
  sharedFetcher_sharedFetcher_0 = v1;
}

- (ASCLockupFetcher)initWithConnection:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ASCLockupFetcher;
  v6 = [(ASCLockupFetcher *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = objc_alloc_init(ASCPendingPromises);
    pendingRequests = v7->_pendingRequests;
    v7->_pendingRequests = v8;

    v10 = [[ASCTaskCoordinator alloc] initWithName:@"ASCLockupFetcher.requests"];
    requestCoordinator = v7->_requestCoordinator;
    v7->_requestCoordinator = v10;

    v12 = [[ASCLazy alloc] initWithFactory:&__block_literal_global_11];
    bundleCoordinator = v7->_bundleCoordinator;
    v7->_bundleCoordinator = v12;

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v7 selector:sel_daemonConnectionWasLost_ name:0x1F1E052D8 object:v5];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v7 selector:sel_daemonConnectionWasLost_ name:0x1F1E052F8 object:v5];

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v17 = +[ASCRebootstrapNotifier sharedNotifier];
    [v16 addObserver:v7 selector:sel_daemonDidRebootstrap_ name:0x1F1E05278 object:v17];
  }
  return v7;
}

ASCTaskCoordinator *__39__ASCLockupFetcher_initWithConnection___block_invoke()
{
  v0 = [[ASCTaskCoordinator alloc] initWithName:@"ASCLockupFetcher.bundleIDs"];

  return v0;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ASCLockupFetcher;
  [(ASCLockupFetcher *)&v4 dealloc];
}

- (void)daemonConnectionWasLost:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = @"Connection to daemon was lost";
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = (void *)[v4 initWithDomain:@"ASCLockupFetcherErrorDomain" code:1 userInfo:v5];

  v7 = [(ASCLockupFetcher *)self pendingRequests];
  [v7 finishAllWithError:v6];
}

- (void)daemonDidRebootstrap:(id)a3
{
  id v3 = [(ASCLockupFetcher *)self requestCoordinator];
  [v3 removeAllFinishedTasks];
}

- (id)loadedLockupWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCLockupFetcher *)self requestCoordinator];
  v6 = [v5 taskForKey:v4];

  if (v6 && [v6 isFinished]) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)lockupWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCLockupFetcher *)self requestCoordinator];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __38__ASCLockupFetcher_lockupWithRequest___block_invoke;
  v9[3] = &unk_1E645DB10;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 taskForKey:v6 withCreatorBlock:v9];

  return v7;
}

id __38__ASCLockupFetcher_lockupWithRequest___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pendingRequests];
  objc_initWeak(&location, v2);

  id v3 = [*(id *)(a1 + 32) connection];
  id v4 = [v3 lockupFetcherService];
  id v5 = [v4 mutablePromiseAdapter];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__ASCLockupFetcher_lockupWithRequest___block_invoke_2;
  v8[3] = &unk_1E645DE40;
  objc_copyWeak(&v10, &location);
  id v9 = *(id *)(a1 + 40);
  id v6 = [v5 thenWithBlock:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

id __38__ASCLockupFetcher_lockupWithRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F4DDB0];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained addPromise:v5];

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = [v5 completionHandlerAdapter];
  [v4 getLockupWithRequest:v7 withReplyHandler:v8];

  return v5;
}

- (void)submitBatchRequest:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 ids];
  id v5 = (void *)[v4 mutableCopy];

  id v6 = [(ASCLockupFetcher *)self requestCoordinator];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __39__ASCLockupFetcher_submitBatchRequest___block_invoke;
  v37[3] = &unk_1E645D8F8;
  id v22 = v3;
  id v38 = v22;
  v39 = self;
  id v23 = v5;
  id v40 = v23;
  [v6 withLock:v37];

  v24 = [v22 lockupBatchRequestWithIDs:v23];
  uint64_t v7 = [v24 ids];
  LOBYTE(v3) = [v7 count] == 0;

  if ((v3 & 1) == 0)
  {
    uint64_t v8 = [(ASCLockupFetcher *)self pendingRequests];
    objc_initWeak(&location, v8);

    id v9 = [(ASCLockupFetcher *)self connection];
    id v10 = [v9 lockupFetcherService];
    v21 = [v10 mutablePromiseAdapter];

    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __39__ASCLockupFetcher_submitBatchRequest___block_invoke_2;
    v33[3] = &unk_1E645DE40;
    v20 = &v35;
    objc_copyWeak(&v35, &location);
    id v11 = v24;
    id v34 = v11;
    v12 = [v21 thenWithBlock:v33];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v13 = [v11 requests];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v41 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v30;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8 * v16);
          v18 = [(ASCLockupFetcher *)self requestCoordinator];
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __39__ASCLockupFetcher_submitBatchRequest___block_invoke_3;
          v26[3] = &unk_1E645DB10;
          id v27 = v12;
          uint64_t v28 = v17;
          id v19 = (id)[v18 taskForKey:v17 withCreatorBlock:v26];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v41 count:16];
      }
      while (v14);
    }

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
}

void __39__ASCLockupFetcher_submitBatchRequest___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "requests", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
        uint64_t v8 = [*(id *)(a1 + 40) requestCoordinator];
        int v9 = [v8 hasTaskForKey:v7];

        if (v9)
        {
          id v10 = *(void **)(a1 + 48);
          id v11 = [v7 id];
          [v10 removeObject:v11];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

id __39__ASCLockupFetcher_submitBatchRequest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F4DDB0];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained addPromise:v5];

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = [v5 completionHandlerAdapter];
  [v4 getLockupsWithRequest:v7 withReplyHandler:v8];

  return v5;
}

id __39__ASCLockupFetcher_submitBatchRequest___block_invoke_3(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__ASCLockupFetcher_submitBatchRequest___block_invoke_4;
  v4[3] = &unk_1E645DE68;
  uint64_t v1 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  v2 = [v1 thenWithBlock:v4];

  return v2;
}

id __39__ASCLockupFetcher_submitBatchRequest___block_invoke_4(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F4DDD0] promiseWithResult:v3];
  }
  else
  {
    id v5 = NSString;
    uint64_t v6 = [*(id *)(a1 + 32) id];
    uint64_t v7 = [v5 stringWithFormat:@"No lockup for %@ was fetched from batch request", v6];

    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = v7;
    int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v10 = [v8 errorWithDomain:@"ASCLockupFetcherErrorDomain" code:0 userInfo:v9];

    id v4 = [MEMORY[0x1E4F4DDD0] promiseWithError:v10];
  }

  return v4;
}

- (id)lockupForBundleID:(id)a3 withContext:(id)a4 enableAppDistribution:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [[ASCPair alloc] initWithFirst:v8 second:v9];
  id v11 = [(ASCLockupFetcher *)self bundleCoordinator];
  uint64_t v12 = [v11 object];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__ASCLockupFetcher_lockupForBundleID_withContext_enableAppDistribution___block_invoke;
  v17[3] = &unk_1E645DF08;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  BOOL v20 = a5;
  id v13 = v9;
  id v14 = v8;
  long long v15 = [v12 taskForKey:v10 withCreatorBlock:v17];

  return v15;
}

id __72__ASCLockupFetcher_lockupForBundleID_withContext_enableAppDistribution___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pendingRequests];
  objc_initWeak(&location, v2);

  uint64_t v3 = [*(id *)(a1 + 32) requestCoordinator];
  objc_initWeak(&from, v3);

  id v4 = [*(id *)(a1 + 32) connection];
  id v5 = [v4 lockupFetcherService];
  uint64_t v6 = [v5 mutablePromiseAdapter];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __72__ASCLockupFetcher_lockupForBundleID_withContext_enableAppDistribution___block_invoke_2;
  v9[3] = &unk_1E645DEE0;
  objc_copyWeak(&v12, &location);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  char v14 = *(unsigned char *)(a1 + 56);
  objc_copyWeak(&v13, &from);
  uint64_t v7 = [v6 thenWithBlock:v9];
  objc_destroyWeak(&v13);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v7;
}

id __72__ASCLockupFetcher_lockupForBundleID_withContext_enableAppDistribution___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F4DDB0]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained addPromise:v4];

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 64);
  id v9 = [v4 completionHandlerAdapter];
  [v3 getLockupForBundleID:v6 withContext:v7 enableAppDistribution:v8 withReplyHandler:v9];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__ASCLockupFetcher_lockupForBundleID_withContext_enableAppDistribution___block_invoke_3;
  v11[3] = &unk_1E645DEB8;
  id v12 = *(id *)(a1 + 40);
  char v14 = *(unsigned char *)(a1 + 64);
  objc_copyWeak(&v13, (id *)(a1 + 56));
  [v4 addSuccessBlock:v11];
  objc_destroyWeak(&v13);

  return v4;
}

void __72__ASCLockupFetcher_lockupForBundleID_withContext_enableAppDistribution___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [ASCLockupRequest alloc];
  id v5 = [v3 id];
  uint64_t v6 = [v3 kind];
  uint64_t v7 = [(ASCLockupRequest *)v4 initWithID:v5 kind:v6 context:*(void *)(a1 + 32)];

  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v8 = [(ASCLockupRequest *)v7 lockupRequestWithAppDistributionEnabled];

    uint64_t v7 = (ASCLockupRequest *)v8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__ASCLockupFetcher_lockupForBundleID_withContext_enableAppDistribution___block_invoke_4;
  v12[3] = &unk_1E645DE90;
  id v13 = v3;
  id v10 = v3;
  id v11 = (id)[WeakRetained taskForKey:v7 withCreatorBlock:v12];
}

uint64_t __72__ASCLockupFetcher_lockupForBundleID_withContext_enableAppDistribution___block_invoke_4(uint64_t a1)
{
  return [MEMORY[0x1E4F4DDB0] promiseWithResult:*(void *)(a1 + 32)];
}

- (id)lockupFromMediaAPIResponse:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ASCLockupFetcher *)self connection];
  id v9 = [v8 lockupFetcherService];
  id v10 = [v9 mutablePromiseAdapter];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__ASCLockupFetcher_lockupFromMediaAPIResponse_withContext___block_invoke;
  v15[3] = &unk_1E645DF30;
  id v16 = v6;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = [v10 thenWithBlock:v15];

  return v13;
}

id __59__ASCLockupFetcher_lockupFromMediaAPIResponse_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F4DDB0];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v8 = [v5 completionHandlerAdapter];
  [v4 buildLockupFromMediaAPIResponse:v7 withContext:v6 withReplyHandler:v8];

  return v5;
}

- (id)collectionWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCLockupFetcher *)self pendingRequests];
  objc_initWeak(&location, v5);

  uint64_t v6 = [(ASCLockupFetcher *)self requestCoordinator];
  objc_initWeak(&from, v6);

  uint64_t v7 = [(ASCLockupFetcher *)self connection];
  uint64_t v8 = [v7 lockupFetcherService];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__ASCLockupFetcher_collectionWithRequest___block_invoke;
  v12[3] = &unk_1E645DF80;
  objc_copyWeak(&v14, &location);
  id v9 = v4;
  id v13 = v9;
  objc_copyWeak(&v15, &from);
  id v10 = [v8 thenWithBlock:v12];
  objc_destroyWeak(&v15);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v10;
}

id __42__ASCLockupFetcher_collectionWithRequest___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F4DDB0]);
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  [WeakRetained addPromise:v4];

  id v6 = a1[4];
  uint64_t v7 = [v4 completionHandlerAdapter];
  [v3 getLockupCollectionWithRequest:v6 withReplyHandler:v7];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __42__ASCLockupFetcher_collectionWithRequest___block_invoke_2;
  v9[3] = &unk_1E645DF58;
  id v10 = a1[4];
  objc_copyWeak(&v11, a1 + 6);
  [v4 addSuccessBlock:v9];
  objc_destroyWeak(&v11);

  return v4;
}

void __42__ASCLockupFetcher_collectionWithRequest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = a2;
  uint64_t v2 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v18 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v7 = [ASCLockupRequest alloc];
        uint64_t v8 = [v6 id];
        id v9 = [v6 kind];
        id v10 = [*(id *)(a1 + 32) context];
        id v11 = [(ASCLockupRequest *)v7 initWithID:v8 kind:v9 context:v10];

        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __42__ASCLockupFetcher_collectionWithRequest___block_invoke_3;
        v16[3] = &unk_1E645DE90;
        v16[4] = v6;
        id v13 = (id)[WeakRetained taskForKey:v11 withCreatorBlock:v16];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v3);
  }
}

uint64_t __42__ASCLockupFetcher_collectionWithRequest___block_invoke_3(uint64_t a1)
{
  return [MEMORY[0x1E4F4DDB0] promiseWithResult:*(void *)(a1 + 32)];
}

- (ASCServices)connection
{
  return self->_connection;
}

- (ASCPendingPromises)pendingRequests
{
  return self->_pendingRequests;
}

- (ASCTaskCoordinator)requestCoordinator
{
  return self->_requestCoordinator;
}

- (ASCLazy)bundleCoordinator
{
  return self->_bundleCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleCoordinator, 0);
  objc_storeStrong((id *)&self->_requestCoordinator, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end