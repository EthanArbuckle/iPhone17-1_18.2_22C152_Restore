@interface GKResourceLoader
- (BOOL)isIdle;
- (BOOL)isIdleForReason:(int64_t)a3;
- (BOOL)isInBackground;
- (BOOL)loadResourceWithRequest:(id)a3 reason:(int64_t)a4;
- (BOOL)setReason:(int64_t)a3 forRequestWithKey:(id)a4;
- (GKResourceCache)cachedResources;
- (GKResourceLoader)init;
- (GKResourceLoader)initWithParentResourceLoader:(id)a3;
- (GKResourceLoader)initWithRequestQueue:(id)a3 accessQueue:(id)a4 notificationQueue:(id)a5 cacheLimit:(int64_t)a6;
- (NSMapTable)requestsByCacheKey;
- (NSMutableDictionary)pendingOperations;
- (NSOperationQueue)accessQueue;
- (NSOperationQueue)notificationQueue;
- (NSOperationQueue)requestQueue;
- (id)cachedResourcesForCacheKey:(id)a3;
- (id)description;
- (id)requestKeyForCacheKey:(id)a3;
- (int64_t)currentQualityOfService;
- (void)_commonInit;
- (void)addResource:(id)a3 forCacheKey:(id)a4;
- (void)cancelAllRequests;
- (void)cancelRequestForCacheKey:(id)a3;
- (void)dealloc;
- (void)enterBackground;
- (void)enterForeground;
- (void)finishLoadForRequest:(id)a3 withResource:(id)a4 error:(id)a5;
- (void)postDidBeginLoadingIfIdle;
- (void)postDidIdleIfIdle;
- (void)postDidLoadAllForReason:(int64_t)a3;
- (void)removeAllCachedResources;
- (void)removeResourcesForCacheKey:(id)a3;
- (void)reprioritizeOperations;
- (void)updateLoadReason:(int64_t)a3 forOperation:(id)a4;
@end

@implementation GKResourceLoader

- (void)_commonInit
{
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  pendingOperations = self->_pendingOperations;
  self->_pendingOperations = v3;

  v5 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
  requestsByCacheKey = self->_requestsByCacheKey;
  self->_requestsByCacheKey = v5;

  MEMORY[0x1F41817F8](v5, requestsByCacheKey);
}

- (GKResourceLoader)initWithRequestQueue:(id)a3 accessQueue:(id)a4 notificationQueue:(id)a5 cacheLimit:(int64_t)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if ([v13 maxConcurrentOperationCount] != 1)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"GKResourceLoader.m", 195, @"Cannot initialize resource loader with non-serial queue %@", v12 object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)GKResourceLoader;
  v15 = [(GKResourceLoader *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_requestQueue, a3);
    objc_storeStrong((id *)&v16->_accessQueue, a4);
    objc_storeStrong((id *)&v16->_notificationQueue, a5);
    v17 = objc_alloc_init(GKResourceCache);
    cachedResources = v16->_cachedResources;
    v16->_cachedResources = v17;

    [(GKResourceCache *)v16->_cachedResources setLimit:a6];
    [(GKResourceCache *)v16->_cachedResources setEvictsObjectsWhenApplicationEntersBackground:0];
    [(GKResourceLoader *)v16 _commonInit];
  }

  return v16;
}

- (GKResourceLoader)initWithParentResourceLoader:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GKResourceLoader;
  v5 = [(GKResourceLoader *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 requestQueue];
    requestQueue = v5->_requestQueue;
    v5->_requestQueue = (NSOperationQueue *)v6;

    uint64_t v8 = [v4 accessQueue];
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (NSOperationQueue *)v8;

    uint64_t v10 = [v4 notificationQueue];
    notificationQueue = v5->_notificationQueue;
    v5->_notificationQueue = (NSOperationQueue *)v10;

    uint64_t v12 = [v4 cachedResources];
    cachedResources = v5->_cachedResources;
    v5->_cachedResources = (GKResourceCache *)v12;

    [(GKResourceLoader *)v5 _commonInit];
    v5->_isInBackground = 1;
  }

  return v5;
}

- (GKResourceLoader)init
{
  return 0;
}

- (void)dealloc
{
  [(GKResourceLoader *)self cancelAllRequests];
  v3.receiver = self;
  v3.super_class = (Class)GKResourceLoader;
  [(GKResourceLoader *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(GKResourceLoader *)self requestQueue];
  v7 = [(GKResourceLoader *)self accessQueue];
  uint64_t v8 = [(GKResourceLoader *)self notificationQueue];
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[GKResourceLoader isInBackground](self, "isInBackground"));
  uint64_t v10 = [NSString stringWithFormat:@"{onScreen: %ld, cacheAhead: %ld, cacheFarAhead: %ld}", self->_requestCountMap[2], self->_requestCountMap[1], self->_requestCountMap[0]];
  v11 = [v3 stringWithFormat:@"<%@:%p requestQueue = %@, accessQueue = %@, notificationQueue = %@, isInBackground = %@, loadCounts = %@>", v5, self, v6, v7, v8, v9, v10];

  return v11;
}

- (void)addResource:(id)a3 forCacheKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKResourceLoader *)self cachedResources];
  [v8 addResource:v7 forKey:v6];
}

- (void)removeResourcesForCacheKey:(id)a3
{
  id v4 = a3;
  id v5 = [(GKResourceLoader *)self cachedResources];
  [v5 removeResourcesForKey:v4];
}

- (id)cachedResourcesForCacheKey:(id)a3
{
  id v4 = a3;
  id v5 = [(GKResourceLoader *)self cachedResources];
  id v6 = [v5 resourcesForKey:v4];

  return v6;
}

- (void)removeAllCachedResources
{
  id v2 = [(GKResourceLoader *)self cachedResources];
  [v2 removeAllResources];
}

- (id)requestKeyForCacheKey:(id)a3
{
  id v4 = a3;
  id v5 = [(GKResourceLoader *)self requestsByCacheKey];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)cancelAllRequests
{
  objc_super v3 = [(GKResourceLoader *)self pendingOperations];
  id v4 = [v3 allValues];
  [v4 makeObjectsPerformSelector:sel_cancel];

  id v5 = [(GKResourceLoader *)self pendingOperations];
  [v5 removeAllObjects];

  id v6 = [(GKResourceLoader *)self requestsByCacheKey];
  [v6 removeAllObjects];

  if (self->_requestCountMap[2] >= 1) {
    self->_requestCountMap[2] = 0;
  }
  if (self->_requestCountMap[1] >= 1) {
    self->_requestCountMap[1] = 0;
  }
  if (self->_requestCountMap[0] >= 1) {
    self->_requestCountMap[0] = 0;
  }
}

- (void)cancelRequestForCacheKey:(id)a3
{
  id v11 = a3;
  id v4 = -[GKResourceLoader requestKeyForCacheKey:](self, "requestKeyForCacheKey:");
  if (v4)
  {
    id v5 = [(GKResourceLoader *)self pendingOperations];
    id v6 = [v5 objectForKeyedSubscript:v4];

    if (v6)
    {
      [v6 cancel];
      id v7 = [(GKResourceLoader *)self pendingOperations];
      [v7 removeObjectForKey:v4];

      id v8 = [(GKResourceLoader *)self requestsByCacheKey];
      [v8 removeObjectForKey:v11];

      uint64_t v9 = [v6 _loadReason];
      uint64_t v10 = self->_requestCountMap[v9];
      if (v10 >= 1) {
        self->_requestCountMap[v9] = --v10;
      }
      if (!v10) {
        [(GKResourceLoader *)self postDidLoadAllForReason:v9];
      }
    }
  }
}

- (void)enterBackground
{
  if (!self->_isInBackground)
  {
    self->_isInBackground = 1;
    [(GKResourceLoader *)self reprioritizeOperations];
  }
}

- (void)enterForeground
{
  if (self->_isInBackground)
  {
    self->_isInBackground = 0;
    [(GKResourceLoader *)self reprioritizeOperations];
  }
}

- (BOOL)isIdle
{
  id v2 = [(GKResourceLoader *)self pendingOperations];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (BOOL)isIdleForReason:(int64_t)a3
{
  return self->_requestCountMap[a3] == 0;
}

- (BOOL)loadResourceWithRequest:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  id v7 = [v6 requestKey];
  id v8 = [(GKResourceLoader *)self pendingOperations];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    BOOL v10 = [(GKResourceLoader *)self isInBackground];
    int64_t v11 = 4 * a4;
    if ((unint64_t)a4 >= 3) {
      int64_t v11 = 4;
    }
    uint64_t v12 = -8;
    if (a4 == 1) {
      uint64_t v12 = -4;
    }
    if (a4 == 2) {
      uint64_t v12 = 0;
    }
    if (v10) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = v11;
    }
    if (v13 > [v9 queuePriority])
    {
      [(GKResourceLoader *)self updateLoadReason:a4 forOperation:v9];
      [v9 setQueuePriority:v13];
    }
  }
  else
  {
    id v14 = [v6 makeLoadOperation];
    [v14 _setLoadReason:a4];
    objc_msgSend(v14, "setQualityOfService:", -[GKResourceLoader currentQualityOfService](self, "currentQualityOfService"));
    BOOL v15 = [(GKResourceLoader *)self isInBackground];
    int64_t v16 = 4 * a4;
    if ((unint64_t)a4 >= 3) {
      int64_t v16 = 4;
    }
    uint64_t v17 = -8;
    if (a4 == 1) {
      uint64_t v17 = -4;
    }
    if (a4 == 2) {
      uint64_t v17 = 0;
    }
    if (v15) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = v16;
    }
    [v14 setQueuePriority:v18];
    objc_initWeak(&location, self);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __51__GKResourceLoader_loadResourceWithRequest_reason___block_invoke;
    v25[3] = &unk_1E5F66F80;
    objc_copyWeak(&v27, &location);
    id v19 = v6;
    id v26 = v19;
    [v14 setOutputBlock:v25];
    [(GKResourceLoader *)self postDidBeginLoadingIfIdle];
    v20 = [(GKResourceLoader *)self pendingOperations];
    [v20 setObject:v14 forKeyedSubscript:v7];

    objc_super v21 = [(GKResourceLoader *)self requestsByCacheKey];
    v22 = [v19 cacheKey];
    [v21 setObject:v7 forKey:v22];

    v23 = [(GKResourceLoader *)self requestQueue];
    [v23 addOperation:v14];

    ++self->_requestCountMap[a4];
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return v9 == 0;
}

void __51__GKResourceLoader_loadResourceWithRequest_reason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [WeakRetained accessQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__GKResourceLoader_loadResourceWithRequest_reason___block_invoke_2;
  v11[3] = &unk_1E5F65648;
  objc_copyWeak(&v15, (id *)(a1 + 40));
  id v12 = *(id *)(a1 + 32);
  id v9 = v5;
  id v13 = v9;
  id v10 = v6;
  id v14 = v10;
  [v8 addOperationWithBlock:v11];

  objc_destroyWeak(&v15);
}

void __51__GKResourceLoader_loadResourceWithRequest_reason___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained finishLoadForRequest:*(void *)(a1 + 32) withResource:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (BOOL)setReason:(int64_t)a3 forRequestWithKey:(id)a4
{
  id v6 = a4;
  id v7 = [(GKResourceLoader *)self pendingOperations];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    [(GKResourceLoader *)self updateLoadReason:a3 forOperation:v8];
    BOOL v9 = [(GKResourceLoader *)self isInBackground];
    int64_t v10 = 4 * a3;
    if ((unint64_t)a3 >= 3) {
      int64_t v10 = 4;
    }
    uint64_t v11 = -8;
    if (a3 == 1) {
      uint64_t v11 = -4;
    }
    if (a3 == 2) {
      uint64_t v11 = 0;
    }
    if (v9) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = v10;
    }
    [v8 setQueuePriority:v12];
  }

  return v8 != 0;
}

- (void)finishLoadForRequest:(id)a3 withResource:(id)a4 error:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  int64_t v10 = [v23 requestKey];
  uint64_t v11 = [v23 cacheKey];
  uint64_t v12 = [(GKResourceLoader *)self pendingOperations];
  id v13 = [v12 objectForKeyedSubscript:v10];

  uint64_t v14 = [v13 _loadReason];
  id v15 = [(GKResourceLoader *)self pendingOperations];
  [v15 removeObjectForKey:v10];

  int64_t v16 = [(GKResourceLoader *)self requestsByCacheKey];
  [v16 removeObjectForKey:v11];

  uint64_t v17 = [(GKResourceLoader *)self cachedResources];
  if ([v17 isGroupMember]) {
    BOOL v18 = [(GKResourceLoader *)self isInBackground];
  }
  else {
    BOOL v18 = 0;
  }

  if (v8)
  {
    if (!v18)
    {
      char v19 = [v23 cacheOptions];
      if ((v19 & 2) != 0)
      {
        v20 = [(GKResourceLoader *)self cachedResources];
        objc_super v21 = v20;
        if ((v19 & 4) != 0) {
          [v20 replaceResourcesForKey:v11 withResource:v8];
        }
        else {
          [v20 addResource:v8 forKey:v11];
        }
      }
    }
  }
  [v23 didLoadResource:v8 error:v9];
  uint64_t v22 = self->_requestCountMap[v14];
  if (v22 >= 1) {
    self->_requestCountMap[v14] = --v22;
  }
  if (!v22) {
    [(GKResourceLoader *)self postDidLoadAllForReason:v14];
  }
  [(GKResourceLoader *)self postDidIdleIfIdle];
}

- (int64_t)currentQualityOfService
{
  if ([(GKResourceLoader *)self isInBackground]) {
    return 9;
  }
  else {
    return 25;
  }
}

- (void)updateLoadReason:(int64_t)a3 forOperation:(id)a4
{
  id v9 = a4;
  uint64_t v6 = [v9 _loadReason];
  id v7 = v9;
  if (v6 != a3)
  {
    [v9 _setLoadReason:a3];
    ++self->_requestCountMap[a3];
    uint64_t v8 = self->_requestCountMap[v6];
    if (v8 >= 1) {
      self->_requestCountMap[v6] = --v8;
    }
    id v7 = v9;
    if (!v8)
    {
      [(GKResourceLoader *)self postDidLoadAllForReason:v6];
      id v7 = v9;
    }
  }
}

- (void)reprioritizeOperations
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(GKResourceLoader *)self currentQualityOfService];
  BOOL v4 = [(GKResourceLoader *)self isInBackground];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(GKResourceLoader *)self pendingOperations];
  uint64_t v6 = [v5 objectEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v12 = [v11 _loadReason];
        if (v4)
        {
          if (v12 == 1) {
            uint64_t v13 = -4;
          }
          else {
            uint64_t v13 = -8;
          }
          if (v12 == 2) {
            uint64_t v14 = 0;
          }
          else {
            uint64_t v14 = v13;
          }
        }
        else if (v12 >= 3)
        {
          uint64_t v14 = 4;
        }
        else
        {
          uint64_t v14 = 4 * v12;
        }
        [v11 setQueuePriority:v14];
        [v11 setQualityOfService:v3];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)postDidBeginLoadingIfIdle
{
  if ([(GKResourceLoader *)self isIdle])
  {
    objc_initWeak(&location, self);
    int64_t v3 = [(GKResourceLoader *)self notificationQueue];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __45__GKResourceLoader_postDidBeginLoadingIfIdle__block_invoke;
    v4[3] = &unk_1E5F634E8;
    objc_copyWeak(&v5, &location);
    [v3 addOperationWithBlock:v4];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __45__GKResourceLoader_postDidBeginLoadingIfIdle__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v1 postNotificationName:@"GKResourceLoaderDidBeginLoadingNotification" object:WeakRetained];
  }
}

- (void)postDidIdleIfIdle
{
  if ([(GKResourceLoader *)self isIdle])
  {
    objc_initWeak(&location, self);
    int64_t v3 = [(GKResourceLoader *)self notificationQueue];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __37__GKResourceLoader_postDidIdleIfIdle__block_invoke;
    v4[3] = &unk_1E5F634E8;
    objc_copyWeak(&v5, &location);
    [v3 addOperationWithBlock:v4];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __37__GKResourceLoader_postDidIdleIfIdle__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v1 postNotificationName:@"GKResourceLoaderDidIdleNotification" object:WeakRetained];
  }
}

- (void)postDidLoadAllForReason:(int64_t)a3
{
  objc_initWeak(&location, self);
  id v5 = [(GKResourceLoader *)self notificationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__GKResourceLoader_postDidLoadAllForReason___block_invoke;
  v6[3] = &unk_1E5F63E08;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  [v5 addOperationWithBlock:v6];

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __44__GKResourceLoader_postDidLoadAllForReason___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = @"GKResourceLoaderLoadReasonUserInfoKey";
    BOOL v4 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
    v7[0] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [v3 postNotificationName:@"GKResourceLoaderDidLoadAllForReasonNotification" object:WeakRetained userInfo:v5];
  }
}

- (NSOperationQueue)accessQueue
{
  return self->_accessQueue;
}

- (NSOperationQueue)notificationQueue
{
  return self->_notificationQueue;
}

- (NSOperationQueue)requestQueue
{
  return self->_requestQueue;
}

- (BOOL)isInBackground
{
  return self->_isInBackground;
}

- (NSMutableDictionary)pendingOperations
{
  return self->_pendingOperations;
}

- (NSMapTable)requestsByCacheKey
{
  return self->_requestsByCacheKey;
}

- (GKResourceCache)cachedResources
{
  return self->_cachedResources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedResources, 0);
  objc_storeStrong((id *)&self->_requestsByCacheKey, 0);
  objc_storeStrong((id *)&self->_pendingOperations, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end