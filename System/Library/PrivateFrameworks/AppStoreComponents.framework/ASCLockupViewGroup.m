@interface ASCLockupViewGroup
+ (OS_os_log)log;
+ (void)createConnectionWithCompletionBlock:(id)a3;
- (ASCLockupFetcher)lockupFetcher;
- (ASCLockupViewGroup)init;
- (ASCLockupViewGroup)initWithName:(id)a3;
- (ASCLockupViewGroup)initWithName:(id)a3 lockupFetcher:(id)a4;
- (BOOL)hasScheduledBatchRequest;
- (NSMutableArray)prefetchSpans;
- (NSMutableArray)prefetchSpansIfLoaded;
- (NSMutableDictionary)deferredRequests;
- (NSString)name;
- (id)description;
- (id)lockupWithRequest:(id)a3;
- (void)_cacheLockupsWithCollectionRequest:(id)a3 withCompletionBlock:(id)a4;
- (void)_cacheLockupsWithRequests:(id)a3 withCompletionBlock:(id)a4;
- (void)_lockupDictionaryForRequest:(id)a3 includingKeys:(id)a4 withCompletionBlock:(id)a5;
- (void)_lockupFromMediaAPIResponse:(id)a3 withContext:(id)a4 completionBlock:(id)a5;
- (void)_lockupRequestForBundleID:(id)a3 withContext:(id)a4 completionBlock:(id)a5;
- (void)_lockupRequestForBundleID:(id)a3 withContext:(id)a4 enableAppDistribution:(BOOL)a5 completionBlock:(id)a6;
- (void)_prefetchLockupsWithRequests:(id)a3 withCompletionBlock:(id)a4;
- (void)performBatchRequests;
- (void)scheduleBatchRequestsIfNeeded;
- (void)setHasScheduledBatchRequest:(BOOL)a3;
- (void)setPrefetchSpansIfLoaded:(id)a3;
@end

@implementation ASCLockupViewGroup

+ (OS_os_log)log
{
  if (log_onceToken_4 != -1) {
    dispatch_once(&log_onceToken_4, &__block_literal_global_13);
  }
  v2 = (void *)log_log_4;

  return (OS_os_log *)v2;
}

uint64_t __25__ASCLockupViewGroup_log__block_invoke()
{
  log_log_4 = (uint64_t)os_log_create("com.apple.AppStoreComponents", "ASCLockupViewGroup");

  return MEMORY[0x1F41817F8]();
}

- (ASCLockupViewGroup)initWithName:(id)a3 lockupFetcher:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v14.receiver = self;
  v14.super_class = (Class)ASCLockupViewGroup;
  v8 = [(ASCLockupViewGroup *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeStrong((id *)&v8->_lockupFetcher, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deferredRequests = v8->_deferredRequests;
    v8->_deferredRequests = v11;
  }
  return v8;
}

- (ASCLockupViewGroup)initWithName:(id)a3
{
  id v4 = a3;
  v5 = +[ASCLockupFetcher sharedFetcher];
  id v6 = [(ASCLockupViewGroup *)self initWithName:v4 lockupFetcher:v5];

  return v6;
}

- (ASCLockupViewGroup)init
{
  return [(ASCLockupViewGroup *)self initWithName:0];
}

- (NSMutableArray)prefetchSpans
{
  v3 = [(ASCLockupViewGroup *)self prefetchSpansIfLoaded];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(ASCLockupViewGroup *)self setPrefetchSpansIfLoaded:v5];
  }

  return (NSMutableArray *)v5;
}

- (void)scheduleBatchRequestsIfNeeded
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1C2B8D000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: Scheduled batch request of deferred lockup requests", (uint8_t *)&v2, 0xCu);
}

void __51__ASCLockupViewGroup_scheduleBatchRequestsIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performBatchRequests];
}

- (void)performBatchRequests
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = [a1 deferredRequests];
  int v7 = 138543874;
  v8 = a1;
  __int16 v9 = 2048;
  uint64_t v10 = [v6 count];
  __int16 v11 = 2048;
  uint64_t v12 = [a2 count];
  _os_log_debug_impl(&dword_1C2B8D000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: Started %ld requests in %ld batches", (uint8_t *)&v7, 0x20u);
}

void __42__ASCLockupViewGroup_performBatchRequests__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  int v7 = [v4 lockupFetcher];
  id v9 = [v7 lockupWithRequest:v6];

  v8 = [v5 completionHandlerAdapter];

  [v9 addFinishBlock:v8];
}

- (id)lockupWithRequest:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = [(ASCLockupViewGroup *)self lockupFetcher];
  id v6 = [v5 loadedLockupWithRequest:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    v8 = [(ASCLockupViewGroup *)self deferredRequests];
    id v9 = [v8 objectForKeyedSubscript:v4];

    if (v9)
    {
      objc_msgSend(v9, "asc_copy");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F4DDB0]);
      __int16 v11 = [(ASCLockupViewGroup *)self deferredRequests];
      [v11 setObject:v10 forKeyedSubscript:v4];

      [(ASCLockupViewGroup *)self scheduleBatchRequestsIfNeeded];
      uint64_t v12 = +[ASCLockupViewGroup log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        [(ASCLockupViewGroup *)(uint64_t)self lockupWithRequest:v12];
      }

      objc_msgSend(v10, "asc_copy");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

- (id)description
{
  uint64_t v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCLockupViewGroup *)self name];
  [(ASCDescriber *)v3 addObject:v4 withName:@"name"];

  id v5 = [(ASCDescriber *)v3 finalizeDescription];

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (ASCLockupFetcher)lockupFetcher
{
  return self->_lockupFetcher;
}

- (NSMutableDictionary)deferredRequests
{
  return self->_deferredRequests;
}

- (BOOL)hasScheduledBatchRequest
{
  return self->_hasScheduledBatchRequest;
}

- (void)setHasScheduledBatchRequest:(BOOL)a3
{
  self->_hasScheduledBatchRequest = a3;
}

- (NSMutableArray)prefetchSpansIfLoaded
{
  return self->_prefetchSpansIfLoaded;
}

- (void)setPrefetchSpansIfLoaded:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchSpansIfLoaded, 0);
  objc_storeStrong((id *)&self->_deferredRequests, 0);
  objc_storeStrong((id *)&self->_lockupFetcher, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)_lockupRequestForBundleID:(id)a3 withContext:(id)a4 completionBlock:(id)a5
{
}

- (void)_lockupRequestForBundleID:(id)a3 withContext:(id)a4 enableAppDistribution:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v13 = objc_alloc_init(ASCSignpostSpan);
  [(ASCSignpostSpan *)v13 beginEmitting];
  +[ASCViewRender modelPrefetchDidBeginWithTag:[(ASCSignpostSpan *)v13 primaryTag]];
  objc_super v14 = [(ASCLockupViewGroup *)self lockupFetcher];
  v15 = [v14 lockupForBundleID:v10 withContext:v11 enableAppDistribution:v7];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __108__ASCLockupViewGroup_BundleID___lockupRequestForBundleID_withContext_enableAppDistribution_completionBlock___block_invoke;
  v28[3] = &unk_1E645E230;
  id v16 = v11;
  id v29 = v16;
  BOOL v30 = v7;
  v17 = [v15 thenWithBlock:v28];
  objc_initWeak(&location, self);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __108__ASCLockupViewGroup_BundleID___lockupRequestForBundleID_withContext_enableAppDistribution_completionBlock___block_invoke_2;
  v23[3] = &unk_1E645E280;
  v18 = v13;
  v24 = v18;
  objc_copyWeak(&v26, &location);
  id v19 = v12;
  id v25 = v19;
  [v17 addSuccessBlock:v23];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __108__ASCLockupViewGroup_BundleID___lockupRequestForBundleID_withContext_enableAppDistribution_completionBlock___block_invoke_4;
  v21[3] = &unk_1E645DCB0;
  id v20 = v19;
  id v22 = v20;
  [v17 addErrorBlock:v21];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

id __108__ASCLockupViewGroup_BundleID___lockupRequestForBundleID_withContext_enableAppDistribution_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [ASCLockupRequest alloc];
  id v5 = [v3 id];
  id v6 = [v3 kind];

  BOOL v7 = [(ASCLockupRequest *)v4 initWithID:v5 kind:v6 context:*(void *)(a1 + 32)];
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v8 = [(ASCLockupRequest *)v7 lockupRequestWithAppDistributionEnabled];

    BOOL v7 = (ASCLockupRequest *)v8;
  }
  id v9 = [MEMORY[0x1E4F4DDD0] promiseWithResult:v7];

  return v9;
}

void __108__ASCLockupViewGroup_BundleID___lockupRequestForBundleID_withContext_enableAppDistribution_completionBlock___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __108__ASCLockupViewGroup_BundleID___lockupRequestForBundleID_withContext_enableAppDistribution_completionBlock___block_invoke_3;
  v6[3] = &unk_1E645E258;
  id v7 = a1[4];
  objc_copyWeak(&v10, a1 + 6);
  id v4 = a1[5];
  id v8 = v3;
  id v9 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v10);
}

uint64_t __108__ASCLockupViewGroup_BundleID___lockupRequestForBundleID_withContext_enableAppDistribution_completionBlock___block_invoke_3(uint64_t a1)
{
  +[ASCViewRender modelPrefetchDidEndWithTag:](ASCViewRender, "modelPrefetchDidEndWithTag:", [*(id *)(a1 + 32) primaryTag]);
  [*(id *)(a1 + 32) endEmitting];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [WeakRetained prefetchSpans];
  [v3 addObject:*(void *)(a1 + 32)];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v4();
}

void __108__ASCLockupViewGroup_BundleID___lockupRequestForBundleID_withContext_enableAppDistribution_completionBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __108__ASCLockupViewGroup_BundleID___lockupRequestForBundleID_withContext_enableAppDistribution_completionBlock___block_invoke_5;
  v6[3] = &unk_1E645DC60;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __108__ASCLockupViewGroup_BundleID___lockupRequestForBundleID_withContext_enableAppDistribution_completionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)_cacheLockupsWithRequests:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = MEMORY[0x1E4F14428];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v9 = objc_alloc_init(ASCSignpostSpan);
  [(ASCSignpostSpan *)v9 beginEmitting];
  +[ASCViewRender modelPrefetchDidBeginWithTag:[(ASCSignpostSpan *)v9 primaryTag]];
  id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v11 = dispatch_queue_create("ASCLockupViewGroup.cachingLockups", v10);

  id v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke;
  v26[3] = &unk_1E645E390;
  v27 = v12;
  id v14 = v13;
  id v28 = v14;
  id v29 = self;
  dispatch_queue_t v30 = v11;
  v15 = v11;
  id v16 = v12;
  [v7 enumerateObjectsUsingBlock:v26];

  dispatch_group_leave(v16);
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke_6;
  block[3] = &unk_1E645E3D8;
  id v21 = v14;
  id v22 = v9;
  v17 = v9;
  id v18 = v14;
  objc_copyWeak(&v24, &location);
  id v23 = v6;
  id v19 = v6;
  dispatch_group_notify(v16, v8, block);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v6 = *(void **)(a1 + 40);
  id v7 = [MEMORY[0x1E4F1CA98] null];
  [v6 addObject:v7];

  id v8 = [*(id *)(a1 + 48) lockupWithRequest:v5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke_2;
  v14[3] = &unk_1E645E340;
  id v15 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 40);
  uint64_t v19 = a3;
  id v16 = v9;
  id v17 = v5;
  id v18 = *(id *)(a1 + 32);
  id v10 = v5;
  [v8 addSuccessBlock:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke_4;
  v11[3] = &unk_1E645E368;
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 32);
  [v8 addErrorBlock:v11];
}

void __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke_3;
  v5[3] = &unk_1E645E020;
  int v2 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);
  id v6 = v3;
  uint64_t v9 = v4;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  dispatch_async(v2, v5);
}

void __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) replaceObjectAtIndex:*(void *)(a1 + 56) withObject:*(void *)(a1 + 40)];
  int v2 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v2);
}

void __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke_4(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke_5;
  block[3] = &unk_1E645D710;
  v1 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

void __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke_5(uint64_t a1)
{
}

void __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "ams_removeObjectsPassingTest:", &__block_literal_global_14);
  +[ASCViewRender modelPrefetchDidEndWithTag:](ASCViewRender, "modelPrefetchDidEndWithTag:", [*(id *)(a1 + 40) primaryTag]);
  [*(id *)(a1 + 40) endEmitting];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [WeakRetained prefetchSpans];
  [v3 addObject:*(void *)(a1 + 40)];

  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
}

BOOL __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke_7(uint64_t a1, void *a2)
{
  int v2 = (void *)MEMORY[0x1E4F1CA98];
  id v3 = a2;
  id v4 = [v2 null];

  return v4 == v3;
}

- (void)_lockupDictionaryForRequest:(id)a3 includingKeys:(id)a4 withCompletionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  dispatch_queue_t v11 = objc_alloc_init(ASCSignpostSpan);
  [(ASCSignpostSpan *)v11 beginEmitting];
  +[ASCViewRender modelPrefetchDidBeginWithTag:[(ASCSignpostSpan *)v11 primaryTag]];
  objc_initWeak(&location, self);
  id v12 = [(ASCLockupViewGroup *)self lockupWithRequest:v8];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __94__ASCLockupViewGroup_Fetching___lockupDictionaryForRequest_includingKeys_withCompletionBlock___block_invoke;
  v19[3] = &unk_1E645E428;
  id v13 = v11;
  id v20 = v13;
  objc_copyWeak(&v23, &location);
  id v14 = v9;
  id v21 = v14;
  id v15 = v10;
  id v22 = v15;
  [v12 addSuccessBlock:v19];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __94__ASCLockupViewGroup_Fetching___lockupDictionaryForRequest_includingKeys_withCompletionBlock___block_invoke_3;
  v17[3] = &unk_1E645DCB0;
  id v16 = v15;
  id v18 = v16;
  [v12 addErrorBlock:v17];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __94__ASCLockupViewGroup_Fetching___lockupDictionaryForRequest_includingKeys_withCompletionBlock___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__ASCLockupViewGroup_Fetching___lockupDictionaryForRequest_includingKeys_withCompletionBlock___block_invoke_2;
  block[3] = &unk_1E645E400;
  id v6 = a1[4];
  objc_copyWeak(&v10, a1 + 7);
  id v7 = v3;
  id v8 = a1[5];
  id v9 = a1[6];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v10);
}

void __94__ASCLockupViewGroup_Fetching___lockupDictionaryForRequest_includingKeys_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  +[ASCViewRender modelPrefetchDidEndWithTag:](ASCViewRender, "modelPrefetchDidEndWithTag:", [*(id *)(a1 + 32) primaryTag]);
  [*(id *)(a1 + 32) endEmitting];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = [WeakRetained prefetchSpans];
  [v3 addObject:*(void *)(a1 + 32)];

  uint64_t v17 = a1;
  id v4 = *(void **)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  id v6 = v4;
  id v7 = v5;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
        if (_ASCLockupKeyGetAllCases_onceToken != -1) {
          dispatch_once(&_ASCLockupKeyGetAllCases_onceToken, &__block_literal_global_117);
        }
        if ([(id)_ASCLockupKeyGetAllCases_allCases containsObject:v14])
        {
          id v15 = [v6 valueForKey:v14];
          if (v15) {
            [v8 setObject:v15 forKeyedSubscript:v14];
          }
        }
        else
        {
          id v15 = +[ASCLockupViewGroup log];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v23 = v14;
            _os_log_error_impl(&dword_1C2B8D000, v15, OS_LOG_TYPE_ERROR, "*** Ignoring unknown _ASCLockupKey %{safe}@", buf, 0xCu);
          }
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v11);
  }

  id v16 = (void *)[v8 copy];
  (*(void (**)(void))(*(void *)(v17 + 56) + 16))();
}

void __94__ASCLockupViewGroup_Fetching___lockupDictionaryForRequest_includingKeys_withCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __94__ASCLockupViewGroup_Fetching___lockupDictionaryForRequest_includingKeys_withCompletionBlock___block_invoke_4;
  v6[3] = &unk_1E645DC60;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __94__ASCLockupViewGroup_Fetching___lockupDictionaryForRequest_includingKeys_withCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)_cacheLockupsWithCollectionRequest:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v8 = objc_alloc_init(ASCSignpostSpan);
  [(ASCSignpostSpan *)v8 beginEmitting];
  +[ASCViewRender modelPrefetchDidBeginWithTag:[(ASCSignpostSpan *)v8 primaryTag]];
  objc_initWeak(&location, self);
  id v9 = [(ASCLockupViewGroup *)self lockupFetcher];
  uint64_t v10 = [v9 collectionWithRequest:v6];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87__ASCLockupViewGroup_Fetching___cacheLockupsWithCollectionRequest_withCompletionBlock___block_invoke;
  v17[3] = &unk_1E645E478;
  uint64_t v11 = v8;
  long long v18 = v11;
  objc_copyWeak(&v21, &location);
  id v12 = v6;
  id v19 = v12;
  id v13 = v7;
  id v20 = v13;
  [v10 addSuccessBlock:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__ASCLockupViewGroup_Fetching___cacheLockupsWithCollectionRequest_withCompletionBlock___block_invoke_4;
  v15[3] = &unk_1E645DCB0;
  id v14 = v13;
  id v16 = v14;
  [v10 addErrorBlock:v15];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __87__ASCLockupViewGroup_Fetching___cacheLockupsWithCollectionRequest_withCompletionBlock___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__ASCLockupViewGroup_Fetching___cacheLockupsWithCollectionRequest_withCompletionBlock___block_invoke_2;
  block[3] = &unk_1E645E400;
  id v6 = a1[4];
  objc_copyWeak(&v10, a1 + 7);
  id v7 = v3;
  id v8 = a1[5];
  id v9 = a1[6];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v10);
}

void __87__ASCLockupViewGroup_Fetching___cacheLockupsWithCollectionRequest_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  +[ASCViewRender modelPrefetchDidEndWithTag:](ASCViewRender, "modelPrefetchDidEndWithTag:", [*(id *)(a1 + 32) primaryTag]);
  [*(id *)(a1 + 32) endEmitting];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = [WeakRetained prefetchSpans];
  [v3 addObject:*(void *)(a1 + 32)];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__ASCLockupViewGroup_Fetching___cacheLockupsWithCollectionRequest_withCompletionBlock___block_invoke_3;
  v6[3] = &unk_1E645E450;
  id v4 = *(void **)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v5 = objc_msgSend(v4, "ams_mapWithTransform:", v6);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

ASCLockupRequest *__87__ASCLockupViewGroup_Fetching___cacheLockupsWithCollectionRequest_withCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [ASCLockupRequest alloc];
  id v5 = [v3 id];

  id v6 = [*(id *)(a1 + 32) kind];
  id v7 = [*(id *)(a1 + 32) context];
  id v8 = [(ASCLockupRequest *)v4 initWithID:v5 kind:v6 context:v7];

  return v8;
}

void __87__ASCLockupViewGroup_Fetching___cacheLockupsWithCollectionRequest_withCompletionBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__ASCLockupViewGroup_Fetching___cacheLockupsWithCollectionRequest_withCompletionBlock___block_invoke_5;
  v6[3] = &unk_1E645DC60;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __87__ASCLockupViewGroup_Fetching___cacheLockupsWithCollectionRequest_withCompletionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)_prefetchLockupsWithRequests:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = MEMORY[0x1E4F14428];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v9 = objc_alloc_init(ASCSignpostSpan);
  [(ASCSignpostSpan *)v9 beginEmitting];
  +[ASCViewRender modelPrefetchDidBeginWithTag:[(ASCSignpostSpan *)v9 primaryTag]];
  id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v11 = dispatch_queue_create("ASCLockupViewGroup.prefetchingResults", v10);

  id v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __92__ASCLockupViewGroup_Fetching_Deprecated___prefetchLockupsWithRequests_withCompletionBlock___block_invoke;
  v26[3] = &unk_1E645E390;
  v27 = v12;
  id v14 = v13;
  id v28 = v14;
  id v29 = self;
  dispatch_queue_t v30 = v11;
  id v15 = v11;
  id v16 = v12;
  [v7 enumerateObjectsUsingBlock:v26];

  dispatch_group_leave(v16);
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__ASCLockupViewGroup_Fetching_Deprecated___prefetchLockupsWithRequests_withCompletionBlock___block_invoke_4;
  block[3] = &unk_1E645E258;
  id v21 = v9;
  uint64_t v17 = v9;
  objc_copyWeak(&v24, &location);
  id v22 = v14;
  id v23 = v6;
  id v18 = v14;
  id v19 = v6;
  dispatch_group_notify(v16, v8, block);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __92__ASCLockupViewGroup_Fetching_Deprecated___prefetchLockupsWithRequests_withCompletionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v6 = *(void **)(a1 + 40);
  id v7 = [MEMORY[0x1E4F1CA98] null];
  [v6 addObject:v7];

  id v8 = [*(id *)(a1 + 48) lockupWithRequest:v5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__ASCLockupViewGroup_Fetching_Deprecated___prefetchLockupsWithRequests_withCompletionBlock___block_invoke_2;
  v10[3] = &unk_1E645E4A0;
  id v11 = v5;
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 40);
  uint64_t v15 = a3;
  id v14 = *(id *)(a1 + 32);
  id v9 = v5;
  [v8 addFinishBlock:v10];
}

void __92__ASCLockupViewGroup_Fetching_Deprecated___prefetchLockupsWithRequests_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[_ASCLockupResponse alloc] initWithRequest:*(void *)(a1 + 32) lockup:v6 error:v5];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __92__ASCLockupViewGroup_Fetching_Deprecated___prefetchLockupsWithRequests_withCompletionBlock___block_invoke_3;
  v12[3] = &unk_1E645E020;
  id v8 = *(NSObject **)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v10 = *(void **)(a1 + 56);
  uint64_t v16 = *(void *)(a1 + 64);
  id v13 = v9;
  id v14 = v7;
  id v15 = v10;
  id v11 = v7;
  dispatch_async(v8, v12);
}

void __92__ASCLockupViewGroup_Fetching_Deprecated___prefetchLockupsWithRequests_withCompletionBlock___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) replaceObjectAtIndex:*(void *)(a1 + 56) withObject:*(void *)(a1 + 40)];
  int v2 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v2);
}

void __92__ASCLockupViewGroup_Fetching_Deprecated___prefetchLockupsWithRequests_withCompletionBlock___block_invoke_4(uint64_t a1)
{
  +[ASCViewRender modelPrefetchDidEndWithTag:](ASCViewRender, "modelPrefetchDidEndWithTag:", [*(id *)(a1 + 32) primaryTag]);
  [*(id *)(a1 + 32) endEmitting];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [WeakRetained prefetchSpans];
  [v3 addObject:*(void *)(a1 + 32)];

  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = (id)[*(id *)(a1 + 40) copy];
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
}

+ (void)createConnectionWithCompletionBlock:(id)a3
{
  id v3 = a3;
  +[ASCEligibility assertCurrentProcessEligibility]();
  uint64_t v4 = +[ASCServicesConnection sharedConnection];
  id v5 = [v4 testConnection];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__ASCLockupViewGroup_ForSpotlight__createConnectionWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E645E190;
  id v8 = v3;
  id v6 = v3;
  [v5 addFinishBlock:v7];
}

uint64_t __72__ASCLockupViewGroup_ForSpotlight__createConnectionWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_lockupFromMediaAPIResponse:(id)a3 withContext:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v11 = [(ASCLockupViewGroup *)self lockupFetcher];
  id v12 = [v11 lockupFromMediaAPIResponse:v10 withContext:v9];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __96__ASCLockupViewGroup_FromMAPIResponse___lockupFromMediaAPIResponse_withContext_completionBlock___block_invoke;
  v17[3] = &unk_1E645E4C8;
  id v13 = v8;
  id v18 = v13;
  [v12 addSuccessBlock:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __96__ASCLockupViewGroup_FromMAPIResponse___lockupFromMediaAPIResponse_withContext_completionBlock___block_invoke_3;
  v15[3] = &unk_1E645DCB0;
  id v16 = v13;
  id v14 = v13;
  [v12 addErrorBlock:v15];
}

void __96__ASCLockupViewGroup_FromMAPIResponse___lockupFromMediaAPIResponse_withContext_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __96__ASCLockupViewGroup_FromMAPIResponse___lockupFromMediaAPIResponse_withContext_completionBlock___block_invoke_2;
  v6[3] = &unk_1E645DC60;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __96__ASCLockupViewGroup_FromMAPIResponse___lockupFromMediaAPIResponse_withContext_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __96__ASCLockupViewGroup_FromMAPIResponse___lockupFromMediaAPIResponse_withContext_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __96__ASCLockupViewGroup_FromMAPIResponse___lockupFromMediaAPIResponse_withContext_completionBlock___block_invoke_4;
  v6[3] = &unk_1E645DC60;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __96__ASCLockupViewGroup_FromMAPIResponse___lockupFromMediaAPIResponse_withContext_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)lockupWithRequest:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1C2B8D000, log, OS_LOG_TYPE_DEBUG, "%{public}@: Deferred request %@", (uint8_t *)&v3, 0x16u);
}

@end