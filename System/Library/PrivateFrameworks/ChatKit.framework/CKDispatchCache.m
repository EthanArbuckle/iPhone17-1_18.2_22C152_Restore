@interface CKDispatchCache
- (BOOL)isConcurrent;
- (BOOL)isGeneratingForKey:(id)a3;
- (BOOL)waitOnGenerationForKey:(id)a3;
- (CKDispatchCache)init;
- (CKDispatchCache)initWithCacheLimit:(unint64_t)a3 dispatchPriority:(int64_t)a4 isConcurrent:(BOOL)a5;
- (IMDispatchQueue)dispatchQueue;
- (NSCache)objectCache;
- (NSCountedSet)pendingKeys;
- (NSMutableDictionary)pendingGroups;
- (OS_dispatch_queue)lockQueue;
- (id)cachedObjectForKey:(id)a3;
- (int64_t)dispatchPriority;
- (void)_beginGeneratingForKeyUnlocked:(id)a3;
- (void)_endGeneratingForKeyUnlocked:(id)a3;
- (void)beginGeneratingForKey:(id)a3;
- (void)clearQueue;
- (void)dealloc;
- (void)emptyCache;
- (void)endGeneratingForKey:(id)a3;
- (void)enqueueBlock:(id)a3 withPriority:(int64_t)a4;
- (void)enqueueGenerationBlock:(id)a3 completion:(id)a4 withPriority:(int64_t)a5 forKey:(id)a6;
- (void)resume;
- (void)setCachedObject:(id)a3 forKey:(id)a4;
- (void)setDispatchPriority:(int64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setIsConcurrent:(BOOL)a3;
- (void)setLockQueue:(id)a3;
- (void)setObjectCache:(id)a3;
- (void)setPendingGroups:(id)a3;
- (void)setPendingKeys:(id)a3;
- (void)suspend;
@end

@implementation CKDispatchCache

- (CKDispatchCache)initWithCacheLimit:(unint64_t)a3 dispatchPriority:(int64_t)a4 isConcurrent:(BOOL)a5
{
  v19.receiver = self;
  v19.super_class = (Class)CKDispatchCache;
  v8 = [(CKDispatchCache *)&v19 init];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F6C3E0] sharedInstance];
    [v9 addListener:v8];

    v10 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    pendingKeys = v8->_pendingKeys;
    v8->_pendingKeys = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingGroups = v8->_pendingGroups;
    v8->_pendingGroups = v12;

    uint64_t v14 = CKCreateNSCache(a3);
    objectCache = v8->_objectCache;
    v8->_objectCache = (NSCache *)v14;

    dispatch_queue_t v16 = dispatch_queue_create(0, MEMORY[0x1E4F14430]);
    lockQueue = v8->_lockQueue;
    v8->_lockQueue = (OS_dispatch_queue *)v16;

    v8->_dispatchPriority = a4;
    v8->_isConcurrent = a5;
  }
  return v8;
}

- (void)resume
{
  id v2 = [(CKDispatchCache *)self dispatchQueue];
  [v2 setSuspended:0];
}

- (IMDispatchQueue)dispatchQueue
{
  dispatchQueue = self->_dispatchQueue;
  if (!dispatchQueue)
  {
    int64_t dispatchPriority = self->_dispatchPriority;
    if (self->_isConcurrent) {
      [MEMORY[0x1E4F6C918] concurrentQueueWithDispatchPriority:dispatchPriority];
    }
    else {
    v5 = [MEMORY[0x1E4F6C918] serialQueueWithDispatchPriority:dispatchPriority];
    }
    v6 = self->_dispatchQueue;
    self->_dispatchQueue = v5;

    [(IMDispatchQueue *)self->_dispatchQueue setSuspended:1];
    dispatchQueue = self->_dispatchQueue;
  }

  return dispatchQueue;
}

- (CKDispatchCache)init
{
  return [(CKDispatchCache *)self initWithCacheLimit:0 dispatchPriority:-2 isConcurrent:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F6C3E0] sharedInstance];
  [v3 removeListener:self];

  v4.receiver = self;
  v4.super_class = (Class)CKDispatchCache;
  [(CKDispatchCache *)&v4 dealloc];
}

- (id)cachedObjectForKey:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  if ([v4 length])
  {
    lockQueue = self->_lockQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__CKDispatchCache_cachedObjectForKey___block_invoke;
    block[3] = &unk_1E5620A80;
    v13 = &v14;
    block[4] = self;
    id v6 = v4;
    id v12 = v6;
    dispatch_sync(lockQueue, block);
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        if (v15[5]) {
          v8 = @"YES";
        }
        else {
          v8 = @"NO";
        }
        *(_DWORD *)buf = 138412546;
        id v21 = v6;
        __int16 v22 = 2112;
        v23 = v8;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_DEBUG, "Dispatch cache lookup [%@]: %@", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
  }
  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __38__CKDispatchCache_cachedObjectForKey___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setCachedObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    lockQueue = self->_lockQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__CKDispatchCache_setCachedObject_forKey___block_invoke;
    v9[3] = &unk_1E5620AA8;
    id v10 = v6;
    v11 = self;
    id v12 = v7;
    ck_dispatch_isolated(lockQueue, v9);
  }
}

void __42__CKDispatchCache_setCachedObject_forKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) objectCache];
  id v4 = v3;
  if (v2) {
    [v3 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 48)];
  }
  else {
    [v3 removeObjectForKey:*(void *)(a1 + 48)];
  }
}

- (void)enqueueBlock:(id)a3 withPriority:(int64_t)a4
{
  if (a3)
  {
    id v6 = a3;
    id v7 = [(CKDispatchCache *)self dispatchQueue];
    [v7 addBlock:v6 withQueuePriority:a4];
  }
}

- (void)enqueueGenerationBlock:(id)a3 completion:(id)a4 withPriority:(int64_t)a5 forKey:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = v12;
  if (v10 && [v12 length])
  {
    [(CKDispatchCache *)self beginGeneratingForKey:v13];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __73__CKDispatchCache_enqueueGenerationBlock_completion_withPriority_forKey___block_invoke;
    id v19 = &unk_1E5620AD0;
    id v22 = v10;
    id v20 = v13;
    id v21 = self;
    id v23 = v11;
    uint64_t v14 = _Block_copy(&v16);
    v15 = [(CKDispatchCache *)self dispatchQueue];
    [v15 addBlock:v14 withQueuePriority:a5];
  }
}

void __73__CKDispatchCache_enqueueGenerationBlock_completion_withPriority_forKey___block_invoke(int8x16_t *a1)
{
  uint64_t v2 = (*(void (**)(void))(a1[3].i64[0] + 16))();
  uint64_t v3 = *(void **)(a1[2].i64[1] + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__CKDispatchCache_enqueueGenerationBlock_completion_withPriority_forKey___block_invoke_2;
  v8[3] = &unk_1E5620AA8;
  id v4 = v2;
  id v9 = v4;
  int8x16_t v7 = a1[2];
  id v5 = (id)v7.i64[0];
  int8x16_t v10 = vextq_s8(v7, v7, 8uLL);
  ck_dispatch_isolated(v3, v8);
  uint64_t v6 = a1[3].i64[1];
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

uint64_t __73__CKDispatchCache_enqueueGenerationBlock_completion_withPriority_forKey___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [*(id *)(a1 + 40) objectCache];
    [v2 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 48)];
  }
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 _endGeneratingForKeyUnlocked:v4];
}

- (BOOL)isGeneratingForKey:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  if ([v4 length])
  {
    lockQueue = self->_lockQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__CKDispatchCache_isGeneratingForKey___block_invoke;
    block[3] = &unk_1E5620A80;
    int8x16_t v10 = &v11;
    block[4] = self;
    id v9 = v4;
    dispatch_sync(lockQueue, block);
  }
  char v6 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __38__CKDispatchCache_isGeneratingForKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pendingKeys];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

- (void)_beginGeneratingForKeyUnlocked:(id)a3
{
  id v9 = a3;
  id v4 = [(CKDispatchCache *)self pendingKeys];
  char v5 = [v4 containsObject:v9];

  if ((v5 & 1) == 0)
  {
    char v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    int8x16_t v7 = [(CKDispatchCache *)self pendingGroups];
    [v7 setObject:v6 forKey:v9];
  }
  v8 = [(CKDispatchCache *)self pendingKeys];
  [v8 addObject:v9];
}

- (void)beginGeneratingForKey:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    lockQueue = self->_lockQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__CKDispatchCache_beginGeneratingForKey___block_invoke;
    v6[3] = &unk_1E5620AF8;
    v6[4] = self;
    id v7 = v4;
    ck_dispatch_isolated(lockQueue, v6);
  }
}

uint64_t __41__CKDispatchCache_beginGeneratingForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginGeneratingForKeyUnlocked:*(void *)(a1 + 40)];
}

- (void)_endGeneratingForKeyUnlocked:(id)a3
{
  id v10 = a3;
  id v4 = [(CKDispatchCache *)self pendingKeys];
  uint64_t v5 = [v4 countForObject:v10];

  char v6 = [(CKDispatchCache *)self pendingKeys];
  [v6 removeObject:v10];

  if (v5 == 1)
  {
    id v7 = [(CKDispatchCache *)self pendingGroups];
    v8 = [v7 objectForKey:v10];

    if (v8) {
      dispatch_group_leave(v8);
    }
    id v9 = [(CKDispatchCache *)self pendingGroups];
    [v9 removeObjectForKey:v10];
  }
}

- (void)endGeneratingForKey:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    lockQueue = self->_lockQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__CKDispatchCache_endGeneratingForKey___block_invoke;
    v6[3] = &unk_1E5620AF8;
    v6[4] = self;
    id v7 = v4;
    ck_dispatch_isolated(lockQueue, v6);
  }
}

uint64_t __39__CKDispatchCache_endGeneratingForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endGeneratingForKeyUnlocked:*(void *)(a1 + 40)];
}

- (BOOL)waitOnGenerationForKey:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    uint64_t v16 = __Block_byref_object_dispose_;
    id v17 = 0;
    lockQueue = self->_lockQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__CKDispatchCache_waitOnGenerationForKey___block_invoke;
    block[3] = &unk_1E5620A80;
    uint64_t v11 = &v12;
    block[4] = self;
    id v10 = v4;
    dispatch_sync(lockQueue, block);
    if (v13[5])
    {
      dispatch_time_t v6 = dispatch_time(0, 2000000000);
      BOOL v7 = dispatch_group_wait((dispatch_group_t)v13[5], v6) == 0;
    }
    else
    {
      BOOL v7 = 1;
    }

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

void __42__CKDispatchCache_waitOnGenerationForKey___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) pendingGroups];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)suspend
{
  id v2 = [(CKDispatchCache *)self dispatchQueue];
  [v2 setSuspended:1];
}

- (void)clearQueue
{
  uint64_t v3 = [(CKDispatchCache *)self pendingGroups];
  id v6 = (id)[v3 copy];

  id v4 = [(CKDispatchCache *)self pendingKeys];
  [v4 removeAllObjects];

  id v5 = [(CKDispatchCache *)self pendingGroups];
  [v5 removeAllObjects];

  [(IMDispatchQueue *)self->_dispatchQueue removeAllOutstandingBlocks];
  [v6 enumerateKeysAndObjectsUsingBlock:&__block_literal_global];
}

void __29__CKDispatchCache_clearQueue__block_invoke(int a1, int a2, dispatch_group_t group)
{
}

- (void)emptyCache
{
}

- (NSCache)objectCache
{
  return self->_objectCache;
}

- (void)setObjectCache:(id)a3
{
}

- (NSCountedSet)pendingKeys
{
  return self->_pendingKeys;
}

- (void)setPendingKeys:(id)a3
{
}

- (NSMutableDictionary)pendingGroups
{
  return self->_pendingGroups;
}

- (void)setPendingGroups:(id)a3
{
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)lockQueue
{
  return self->_lockQueue;
}

- (void)setLockQueue:(id)a3
{
}

- (int64_t)dispatchPriority
{
  return self->_dispatchPriority;
}

- (void)setDispatchPriority:(int64_t)a3
{
  self->_int64_t dispatchPriority = a3;
}

- (BOOL)isConcurrent
{
  return self->_isConcurrent;
}

- (void)setIsConcurrent:(BOOL)a3
{
  self->_isConcurrent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_pendingGroups, 0);
  objc_storeStrong((id *)&self->_pendingKeys, 0);

  objc_storeStrong((id *)&self->_objectCache, 0);
}

@end