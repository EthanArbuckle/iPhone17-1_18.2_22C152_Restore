@interface MCSafariPasswordAutoFillDomainsCache
+ (id)sharedCache;
- (BOOL)isSafariPasswordAutoFillAllowedForURL:(id)a3;
- (MCSafariPasswordAutoFillDomainsCache)init;
- (NSMutableArray)memberQueueCache;
- (OS_dispatch_queue)memberQueue;
- (void)memberQueueRereadCache;
- (void)rereadCache;
- (void)setMemberQueue:(id)a3;
- (void)setMemberQueueCache:(id)a3;
@end

@implementation MCSafariPasswordAutoFillDomainsCache

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedCache_cache;
  return v2;
}

uint64_t __51__MCSafariPasswordAutoFillDomainsCache_sharedCache__block_invoke()
{
  sharedCache_cache = objc_alloc_init(MCSafariPasswordAutoFillDomainsCache);
  return MEMORY[0x1F41817F8]();
}

- (MCSafariPasswordAutoFillDomainsCache)init
{
  v14.receiver = self;
  v14.super_class = (Class)MCSafariPasswordAutoFillDomainsCache;
  v2 = [(MCSafariPasswordAutoFillDomainsCache *)&v14 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("MCSafariPasswordAutoFillDomainsCache member queue", MEMORY[0x1E4F14430]);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v3;

    objc_initWeak(&location, v2);
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__MCSafariPasswordAutoFillDomainsCache_init__block_invoke;
    v11[3] = &unk_1E5A67900;
    objc_copyWeak(&v12, &location);
    id v6 = (id)[v5 addObserverForName:@"com.apple.managedconfiguration.effectivesettingschanged" object:0 queue:0 usingBlock:v11];

    v7 = v2->_memberQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__MCSafariPasswordAutoFillDomainsCache_init__block_invoke_2;
    block[3] = &unk_1E5A65CB0;
    v10 = v2;
    dispatch_barrier_async(v7, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __44__MCSafariPasswordAutoFillDomainsCache_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained rereadCache];
}

uint64_t __44__MCSafariPasswordAutoFillDomainsCache_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) memberQueueRereadCache];
}

- (BOOL)isSafariPasswordAutoFillAllowedForURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    *(void *)buf = 0;
    v13 = buf;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    v5 = [(MCSafariPasswordAutoFillDomainsCache *)self memberQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__MCSafariPasswordAutoFillDomainsCache_isSafariPasswordAutoFillAllowedForURL___block_invoke;
    block[3] = &unk_1E5A67928;
    void block[4] = self;
    v11 = buf;
    id v10 = v4;
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
      _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_ERROR, "Safari Password Auto Fill isn't allowed since the URL is nil", buf, 2u);
    }
    BOOL v6 = 0;
  }

  return v6;
}

void __78__MCSafariPasswordAutoFillDomainsCache_isSafariPasswordAutoFillAllowedForURL___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) memberQueueCache];

  if (v2)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    dispatch_queue_t v3 = [*(id *)(a1 + 32) memberQueueCache];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          if ([*(id *)(*((void *)&v9 + 1) + 8 * i) matchesURL:*(void *)(a1 + 40)])
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v8 = [MEMORY[0x1E4F73168] sharedConfiguration];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v8 userMode] != 1;
  }
}

- (void)rereadCache
{
  dispatch_queue_t v3 = [(MCSafariPasswordAutoFillDomainsCache *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MCSafariPasswordAutoFillDomainsCache_rereadCache__block_invoke;
  block[3] = &unk_1E5A65CB0;
  void block[4] = self;
  dispatch_barrier_async(v3, block);
}

uint64_t __51__MCSafariPasswordAutoFillDomainsCache_rereadCache__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) memberQueueRereadCache];
}

- (void)memberQueueRereadCache
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v3 = +[MCRestrictionManager sharedManager];
  uint64_t v4 = [v3 effectiveUnionValuesForSetting:@"allowedSafariPasswordAutoFillDomains"];

  if (v4)
  {
    uint64_t v5 = [(MCSafariPasswordAutoFillDomainsCache *)self memberQueueCache];

    if (v5)
    {
      uint64_t v6 = [(MCSafariPasswordAutoFillDomainsCache *)self memberQueueCache];
      [v6 removeAllObjects];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
      [(MCSafariPasswordAutoFillDomainsCache *)self setMemberQueueCache:v6];
    }

    v7 = [v4 sortedArrayUsingComparator:&__block_literal_global_9];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = [[MCDomainsCacheEntry alloc] initWithPattern:*(void *)(*((void *)&v14 + 1) + 8 * v11)];
          v13 = [(MCSafariPasswordAutoFillDomainsCache *)self memberQueueCache];
          [v13 addObject:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    [(MCSafariPasswordAutoFillDomainsCache *)self setMemberQueueCache:0];
  }
}

uint64_t __62__MCSafariPasswordAutoFillDomainsCache_memberQueueRereadCache__block_invoke(uint64_t a1, void *a2, void *a3)
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