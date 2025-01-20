@interface CNUIIDSAvailabilityProvider
+ (id)makeExpanseRequestsCache;
+ (id)makeFaceTimeRequestsCache;
+ (id)makeIMessageRequestsCache;
- (CNScheduler)resourceLock;
- (CNUIDSHandleAvailabilityCache)expanseRequests;
- (CNUIDSHandleAvailabilityCache)faceTimeRequests;
- (CNUIDSHandleAvailabilityCache)iMessageRequests;
- (CNUIIDSAvailabilityProvider)init;
- (CNUIIDSAvailabilityProvider)initWithQueryControllerWrapper:(id)a3;
- (CNUIIDSIDQueryControllerWrapper)queryControllerWrapper;
- (NSArray)requestFutures;
- (id)cacheForService:(int64_t)a3;
- (id)validateHandles:(id)a3 forService:(int64_t)a4 schedulerProvider:(id)a5;
- (id)validateHandlesForExpanse:(id)a3 schedulerProvider:(id)a4;
- (id)validateHandlesForFaceTime:(id)a3 schedulerProvider:(id)a4;
- (id)validateHandlesForIMessage:(id)a3 schedulerProvider:(id)a4;
- (void)setExpanseRequests:(id)a3;
- (void)setFaceTimeRequests:(id)a3;
- (void)setIMessageRequests:(id)a3;
- (void)setQueryControllerWrapper:(id)a3;
- (void)setRequestFutures:(id)a3;
- (void)setResourceLock:(id)a3;
- (void)startRequestForCacheMisses:(id)a3 service:(int64_t)a4 scheduler:(id)a5;
@end

@implementation CNUIIDSAvailabilityProvider

- (CNUIIDSAvailabilityProvider)initWithQueryControllerWrapper:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CNUIIDSAvailabilityProvider;
  v6 = [(CNUIIDSAvailabilityProvider *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queryControllerWrapper, a3);
    uint64_t v8 = [(id)objc_opt_class() makeFaceTimeRequestsCache];
    faceTimeRequests = v7->_faceTimeRequests;
    v7->_faceTimeRequests = (CNUIDSHandleAvailabilityCache *)v8;

    uint64_t v10 = [(id)objc_opt_class() makeIMessageRequestsCache];
    iMessageRequests = v7->_iMessageRequests;
    v7->_iMessageRequests = (CNUIDSHandleAvailabilityCache *)v10;

    uint64_t v12 = [(id)objc_opt_class() makeExpanseRequestsCache];
    expanseRequests = v7->_expanseRequests;
    v7->_expanseRequests = (CNUIDSHandleAvailabilityCache *)v12;

    requestFutures = v7->_requestFutures;
    v7->_requestFutures = (NSArray *)MEMORY[0x263EFFA68];

    uint64_t v15 = [MEMORY[0x263F33660] synchronousSerialDispatchQueueWithName:@"com.apple.contactsuicore.CNUIIDSAvailabilityProvider"];
    resourceLock = v7->_resourceLock;
    v7->_resourceLock = (CNScheduler *)v15;

    v17 = v7;
  }

  return v7;
}

+ (id)makeFaceTimeRequestsCache
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F33568] boundingStrategyWithCapacity:20];
  v8[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  v4 = [CNUIDSFaceTimeHandleAvailabilityCache alloc];
  id v5 = [MEMORY[0x263F33568] nonatomicCacheScheduler];
  v6 = [(CNCache *)v4 initWithBoundingStrategies:v3 resourceScheduler:v5];

  [(CNCache *)v6 addDidEvictHandler:&__block_literal_global_38];
  return v6;
}

uint64_t __56__CNUIIDSAvailabilityProvider_makeFaceTimeRequestsCache__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 cancel];
}

+ (id)makeIMessageRequestsCache
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F33568] boundingStrategyWithCapacity:20];
  v8[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  v4 = [CNUIDSIMessageHandleAvailabilityCache alloc];
  id v5 = [MEMORY[0x263F33568] nonatomicCacheScheduler];
  v6 = [(CNCache *)v4 initWithBoundingStrategies:v3 resourceScheduler:v5];

  [(CNCache *)v6 addDidEvictHandler:&__block_literal_global_22_1];
  return v6;
}

uint64_t __56__CNUIIDSAvailabilityProvider_makeIMessageRequestsCache__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 cancel];
}

+ (id)makeExpanseRequestsCache
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F33568] boundingStrategyWithCapacity:20];
  v8[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  v4 = [CNUIDSExpanseHandleAvailabilityCache alloc];
  id v5 = [MEMORY[0x263F33568] nonatomicCacheScheduler];
  v6 = [(CNCache *)v4 initWithBoundingStrategies:v3 resourceScheduler:v5];

  [(CNCache *)v6 addDidEvictHandler:&__block_literal_global_25_0];
  return v6;
}

uint64_t __55__CNUIIDSAvailabilityProvider_makeExpanseRequestsCache__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 cancel];
}

- (CNUIIDSAvailabilityProvider)init
{
  v3 = objc_alloc_init(CNUIIDSIDQueryControllerWrapper);
  v4 = [(CNUIIDSAvailabilityProvider *)self initWithQueryControllerWrapper:v3];

  return v4;
}

- (void)startRequestForCacheMisses:(id)a3 service:(int64_t)a4 scheduler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (((*(uint64_t (**)(void))(*MEMORY[0x263F334C0] + 16))() & 1) == 0)
  {
    uint64_t v10 = [v8 allKeys];
    v11 = [(CNUIIDSAvailabilityProvider *)self queryControllerWrapper];
    uint64_t v12 = +[CNUIIDSRequest validateHandles:v10 forService:a4 scheduler:v9 queryControllerWrapper:v11];

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __76__CNUIIDSAvailabilityProvider_startRequestForCacheMisses_service_scheduler___block_invoke;
    v16[3] = &unk_264018738;
    id v13 = v8;
    id v17 = v13;
    [v12 addSuccessBlock:v16];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __76__CNUIIDSAvailabilityProvider_startRequestForCacheMisses_service_scheduler___block_invoke_2;
    v14[3] = &unk_264017210;
    id v15 = v13;
    [v12 addFailureBlock:v14];
  }
}

void __76__CNUIIDSAvailabilityProvider_startRequestForCacheMisses_service_scheduler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v4 = objc_msgSend(v3, "_cn_filter:", &__block_literal_global_33_0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v10 = *(void **)(a1 + 32);
        v11 = [v9 handle];
        uint64_t v12 = [v10 objectForKeyedSubscript:v11];
        [v12 finishWithResult:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v6);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = CNLogicalNot();
  v14 = objc_msgSend(v3, "_cn_filter:", v13, 0);

  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_super v19 = *(void **)(a1 + 32);
        v20 = [*(id *)(*((void *)&v23 + 1) + 8 * j) handle];
        v21 = [v19 objectForKeyedSubscript:v20];
        v22 = +[CNContactsUIError errorWithCode:209];
        [v21 finishWithError:v22];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v16);
  }
}

void __76__CNUIIDSAvailabilityProvider_startRequestForCacheMisses_service_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = objc_msgSend(*(id *)(a1 + 32), "allValues", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) finishWithError:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)cacheForService:(int64_t)a3
{
  if (a3 == 2)
  {
    id v3 = [(CNUIIDSAvailabilityProvider *)self expanseRequests];
  }
  else if (a3 == 1)
  {
    id v3 = [(CNUIIDSAvailabilityProvider *)self iMessageRequests];
  }
  else
  {
    if (a3) {
      goto LABEL_8;
    }
    id v3 = [(CNUIIDSAvailabilityProvider *)self faceTimeRequests];
  }
  a2 = v3;
LABEL_8:
  return (id)(id)a2;
}

- (id)validateHandles:(id)a3 forService:(int64_t)a4 schedulerProvider:(id)a5
{
  id v8 = a3;
  long long v9 = (void *)MEMORY[0x263EFF980];
  id v10 = a5;
  long long v11 = [v9 array];
  long long v12 = [MEMORY[0x263EFF9A0] dictionary];
  id v13 = [(CNUIIDSAvailabilityProvider *)self cacheForService:a4];
  uint64_t v14 = [(CNUIIDSAvailabilityProvider *)self resourceLock];
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  long long v25 = __76__CNUIIDSAvailabilityProvider_validateHandles_forService_schedulerProvider___block_invoke;
  long long v26 = &unk_264018780;
  id v27 = v8;
  id v28 = v13;
  id v29 = v12;
  id v30 = v11;
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  id v18 = v8;
  [v14 performBlock:&v23];

  objc_super v19 = objc_msgSend(v10, "backgroundScheduler", v23, v24, v25, v26);
  [(CNUIIDSAvailabilityProvider *)self startRequestForCacheMisses:v16 service:a4 scheduler:v19];

  v20 = objc_msgSend(v15, "_cn_map:", &__block_literal_global_40_0);
  v21 = [MEMORY[0x263F33608] merge:v20 schedulerProvider:v10];

  return v21;
}

void __76__CNUIIDSAvailabilityProvider_validateHandles_forService_schedulerProvider___block_invoke(id *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v8 = objc_msgSend(a1[5], "objectForKey:", v7, (void)v13);
        long long v9 = v8;
        if (!v8
          || [v8 isFinished]
          && ([v9 result:0],
              id v10 = objc_claimAutoreleasedReturnValue(),
              v10,
              !v10))
        {
          long long v11 = objc_alloc_init(CNUIDSHandleAvailabilityPromise);
          [a1[6] setObject:v11 forKeyedSubscript:v7];
          uint64_t v12 = [(CNPromise *)v11 future];

          [a1[5] setObject:v12 forKey:v7];
          long long v9 = (void *)v12;
        }
        [a1[7] addObject:v9];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

id __76__CNUIIDSAvailabilityProvider_validateHandles_forService_schedulerProvider___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = [MEMORY[0x263F33608] observableWithFuture:a2];
  uint64_t v3 = [MEMORY[0x263F33608] emptyObservable];
  uint64_t v4 = [v2 onError:v3];

  return v4;
}

- (id)validateHandlesForFaceTime:(id)a3 schedulerProvider:(id)a4
{
  return [(CNUIIDSAvailabilityProvider *)self validateHandles:a3 forService:0 schedulerProvider:a4];
}

- (id)validateHandlesForIMessage:(id)a3 schedulerProvider:(id)a4
{
  return [(CNUIIDSAvailabilityProvider *)self validateHandles:a3 forService:1 schedulerProvider:a4];
}

- (id)validateHandlesForExpanse:(id)a3 schedulerProvider:(id)a4
{
  return [(CNUIIDSAvailabilityProvider *)self validateHandles:a3 forService:2 schedulerProvider:a4];
}

- (CNUIIDSIDQueryControllerWrapper)queryControllerWrapper
{
  return self->_queryControllerWrapper;
}

- (void)setQueryControllerWrapper:(id)a3
{
}

- (CNUIDSHandleAvailabilityCache)faceTimeRequests
{
  return self->_faceTimeRequests;
}

- (void)setFaceTimeRequests:(id)a3
{
}

- (CNUIDSHandleAvailabilityCache)iMessageRequests
{
  return self->_iMessageRequests;
}

- (void)setIMessageRequests:(id)a3
{
}

- (CNUIDSHandleAvailabilityCache)expanseRequests
{
  return self->_expanseRequests;
}

- (void)setExpanseRequests:(id)a3
{
}

- (NSArray)requestFutures
{
  return self->_requestFutures;
}

- (void)setRequestFutures:(id)a3
{
}

- (CNScheduler)resourceLock
{
  return self->_resourceLock;
}

- (void)setResourceLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceLock, 0);
  objc_storeStrong((id *)&self->_requestFutures, 0);
  objc_storeStrong((id *)&self->_expanseRequests, 0);
  objc_storeStrong((id *)&self->_iMessageRequests, 0);
  objc_storeStrong((id *)&self->_faceTimeRequests, 0);
  objc_storeStrong((id *)&self->_queryControllerWrapper, 0);
}

@end