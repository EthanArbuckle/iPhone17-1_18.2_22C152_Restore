@interface PHSafeNSCacheDelegateReflector
+ (id)sharedInstance;
+ (void)setDelegate:(id)a3 forCache:(id)a4;
- (PHSafeNSCacheDelegateReflector)init;
- (void)cache:(id)a3 willEvictObject:(id)a4;
- (void)setDelegate:(id)a3 forCache:(id)a4;
@end

@implementation PHSafeNSCacheDelegateReflector

void __55__PHSafeNSCacheDelegateReflector_setDelegate_forCache___block_invoke(void *a1)
{
  v2 = (void *)MEMORY[0x19F389B10]();
  [*(id *)(a1[4] + 16) setObject:a1[5] forKey:a1[6]];
}

+ (void)setDelegate:(id)a3 forCache:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 sharedInstance];
  [v8 setDelegate:v7 forCache:v6];
}

- (void)setDelegate:(id)a3 forCache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PHSafeNSCacheDelegateReflector.m", 54, @"Invalid parameter not satisfying: %@", @"delegate != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PHSafeNSCacheDelegateReflector.m", 55, @"Invalid parameter not satisfying: %@", @"cache != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v14 = v7;
  v15 = v9;
  id v10 = v9;
  id v11 = v7;
  PLRunWithUnfairLock();
  [v10 setDelegate:self];
}

+ (id)sharedInstance
{
  pl_dispatch_once();
  v2 = (void *)sharedInstance_pl_once_object_17;

  return v2;
}

void __48__PHSafeNSCacheDelegateReflector_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PHSafeNSCacheDelegateReflector);
  v1 = (void *)sharedInstance_pl_once_object_17;
  sharedInstance_pl_once_object_17 = (uint64_t)v0;
}

- (PHSafeNSCacheDelegateReflector)init
{
  v8.receiver = self;
  v8.super_class = (Class)PHSafeNSCacheDelegateReflector;
  v2 = [(PHSafeNSCacheDelegateReflector *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    delegatesByCache = v3->_delegatesByCache;
    v3->_delegatesByCache = (NSMapTable *)v4;

    id v6 = v3;
  }

  return v3;
}

- (void).cxx_destruct
{
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  id v11 = self;
  id v8 = v6;
  v12 = v8;
  v9 = PLResultWithUnfairLock();
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend(v9, "cache:willEvictObject:", v8, v7, v10, 3221225472, __56__PHSafeNSCacheDelegateReflector_cache_willEvictObject___block_invoke, &unk_1E5841BD0, v11, v8);
  }
}

id __56__PHSafeNSCacheDelegateReflector_cache_willEvictObject___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x19F389B10]();
  v3 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];

  return v3;
}

@end