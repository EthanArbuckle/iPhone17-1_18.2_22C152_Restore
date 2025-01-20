@interface MCManagedDomainsCache
+ (id)sharedCache;
- (BOOL)isURLManaged:(id)a3;
- (MCManagedDomainsCache)init;
- (NSMutableArray)memberQueueCache;
- (OS_dispatch_queue)memberQueue;
- (void)memberQueueRereadCache;
- (void)rereadCache;
- (void)setMemberQueue:(id)a3;
- (void)setMemberQueueCache:(id)a3;
@end

@implementation MCManagedDomainsCache

+ (id)sharedCache
{
  if (sharedCache_onceToken_0 != -1) {
    dispatch_once(&sharedCache_onceToken_0, &__block_literal_global_12);
  }
  v2 = (void *)sharedCache_cache_0;
  return v2;
}

uint64_t __36__MCManagedDomainsCache_sharedCache__block_invoke()
{
  sharedCache_cache_0 = objc_alloc_init(MCManagedDomainsCache);
  return MEMORY[0x1F41817F8]();
}

- (MCManagedDomainsCache)init
{
  v16.receiver = self;
  v16.super_class = (Class)MCManagedDomainsCache;
  v2 = [(MCManagedDomainsCache *)&v16 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("MCManagedDomainsCache member queue", MEMORY[0x1E4F14430]);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    memberQueueCache = v2->_memberQueueCache;
    v2->_memberQueueCache = v5;

    objc_initWeak(&location, v2);
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __29__MCManagedDomainsCache_init__block_invoke;
    v13[3] = &unk_1E5A67900;
    objc_copyWeak(&v14, &location);
    id v8 = (id)[v7 addObserverForName:@"com.apple.managedconfiguration.effectivesettingschanged" object:0 queue:0 usingBlock:v13];

    v9 = v2->_memberQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__MCManagedDomainsCache_init__block_invoke_2;
    block[3] = &unk_1E5A65CB0;
    v12 = v2;
    dispatch_barrier_sync(v9, block);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __29__MCManagedDomainsCache_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained rereadCache];
}

uint64_t __29__MCManagedDomainsCache_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) memberQueueRereadCache];
}

- (BOOL)isURLManaged:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    *(void *)buf = 0;
    v13 = buf;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    v5 = [(MCManagedDomainsCache *)self memberQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__MCManagedDomainsCache_isURLManaged___block_invoke;
    block[3] = &unk_1E5A67AB0;
    void block[4] = self;
    id v10 = v4;
    v11 = buf;
    dispatch_sync(v5, block);

    BOOL v6 = v13[24] != 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v7 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_ERROR, "URL isn't managed since it's nil", buf, 2u);
    }
    BOOL v6 = 0;
  }

  return v6;
}

void __38__MCManagedDomainsCache_isURLManaged___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "memberQueueCache", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) matchesURL:*(void *)(a1 + 40)])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)rereadCache
{
  uint64_t v3 = [(MCManagedDomainsCache *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MCManagedDomainsCache_rereadCache__block_invoke;
  block[3] = &unk_1E5A65CB0;
  void block[4] = self;
  dispatch_barrier_async(v3, block);
}

uint64_t __36__MCManagedDomainsCache_rereadCache__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) memberQueueRereadCache];
}

- (void)memberQueueRereadCache
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MCManagedDomainsCache *)self memberQueueCache];
  [v3 removeAllObjects];

  uint64_t v4 = +[MCRestrictionManager sharedManager];
  uint64_t v5 = [v4 effectiveUnionValuesForSetting:@"managedWebDomains"];

  BOOL v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [[MCDomainsCacheEntry alloc] initWithPattern:*(void *)(*((void *)&v13 + 1) + 8 * v10)];
        uint64_t v12 = [(MCManagedDomainsCache *)self memberQueueCache];
        [v12 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

uint64_t __47__MCManagedDomainsCache_memberQueueRereadCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 length];
  unint64_t v6 = [v4 length];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
}

- (NSMutableArray)memberQueueCache
{
  return self->_memberQueueCache;
}

- (void)setMemberQueueCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueueCache, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
}

@end