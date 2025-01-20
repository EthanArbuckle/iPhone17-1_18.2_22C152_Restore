@interface ACAccountStoreCache
+ (id)sharedCache;
- (ACAccountStoreCache)init;
- (id)cachedAccountTypeWithIdentifier:(id)a3;
- (id)cachedAccountsForSuffix:(id)a3;
- (id)cachedAllAccountTypes;
- (unint64_t)generationForCacheSuffix:(id)a3;
- (void)_clearAllCaches;
- (void)_lock_cacheAccountType:(id)a3;
- (void)cacheAccountType:(id)a3;
- (void)cacheAccounts:(id)a3 forSuffix:(id)a4;
- (void)cacheAllAccountTypes:(id)a3;
- (void)setupMemoryNotifications;
@end

@implementation ACAccountStoreCache

- (void)cacheAccounts:(id)a3 forSuffix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((ACIsAccountsd() & 1) == 0)
  {
    v8 = +[ACNotifyAccountCache cacheKeyForSuffix:v7];
    v9 = v8;
    if (v8)
    {
      p_accountNotifyCachesLock = &self->_accountNotifyCachesLock;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v13 = __47__ACAccountStoreCache_cacheAccounts_forSuffix___block_invoke;
      v14 = &unk_1E5BCEFA8;
      v15 = self;
      id v16 = v8;
      id v17 = v6;
      v11 = v12;
      os_unfair_lock_lock(p_accountNotifyCachesLock);
      v13(v11);
      os_unfair_lock_unlock(p_accountNotifyCachesLock);
    }
  }
}

void __47__ACAccountStoreCache_cacheAccounts_forSuffix___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];

  if (!v2)
  {
    v3 = [[ACNotifyAccountCache alloc] initWithKey:a1[5]];
    [*(id *)(a1[4] + 32) setObject:v3 forKeyedSubscript:a1[5]];
  }
  id v4 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  [v4 cacheAccounts:a1[6]];
}

- (id)cachedAccountsForSuffix:(id)a3
{
  id v4 = a3;
  if (ACIsAccountsd())
  {
    v5 = 0;
  }
  else
  {
    id v6 = +[ACNotifyAccountCache cacheKeyForSuffix:v4];
    id v7 = v6;
    if (v6)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __47__ACAccountStoreCache_cachedAccountsForSuffix___block_invoke;
      v9[3] = &unk_1E5BCEF80;
      v9[4] = self;
      id v10 = v6;
      v5 = ac_unfair_lock_perform_with_result_1(&self->_accountNotifyCachesLock, v9);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

id __47__ACAccountStoreCache_cachedAccountsForSuffix___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v2)
  {
    v3 = [[ACNotifyAccountCache alloc] initWithKey:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  id v4 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  v5 = [v4 cachedAccounts];

  return v5;
}

id __55__ACAccountStoreCache_cachedAccountTypeWithIdentifier___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];
  v2 = (void *)[v1 copy];

  return v2;
}

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)sharedCache__sharedCache;

  return v2;
}

- (id)cachedAccountTypeWithIdentifier:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__ACAccountStoreCache_cachedAccountTypeWithIdentifier___block_invoke;
  v9[3] = &unk_1E5BCEFD0;
  p_accountTypeCacheLock = &self->_accountTypeCacheLock;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = ac_unfair_lock_perform_with_result_1(p_accountTypeCacheLock, v9);

  return v7;
}

- (void)cacheAccountType:(id)a3
{
  id v4 = a3;
  p_accountTypeCacheLock = &self->_accountTypeCacheLock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v9 = __40__ACAccountStoreCache_cacheAccountType___block_invoke;
  id v10 = &unk_1E5BCCD58;
  v11 = self;
  id v6 = v4;
  id v12 = v6;
  id v7 = v8;
  os_unfair_lock_lock(p_accountTypeCacheLock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_accountTypeCacheLock);
}

uint64_t __40__ACAccountStoreCache_cacheAccountType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_cacheAccountType:", *(void *)(a1 + 40));
}

- (void)_lock_cacheAccountType:(id)a3
{
  id v7 = a3;
  id v4 = [v7 identifier];

  if (v4)
  {
    accountTypeCache = self->_accountTypeCache;
    id v6 = [v7 identifier];
    [(NSMutableDictionary *)accountTypeCache setObject:v7 forKeyedSubscript:v6];
  }
}

uint64_t __47__ACAccountStoreCache_setupMemoryNotifications__block_invoke(uint64_t a1)
{
  v2 = _ACLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __47__ACAccountStoreCache_setupMemoryNotifications__block_invoke_cold_1(v2);
  }

  return [*(id *)(a1 + 32) _clearAllCaches];
}

- (void)_clearAllCaches
{
  p_accountTypeCacheLock = &self->_accountTypeCacheLock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v12 = __38__ACAccountStoreCache__clearAllCaches__block_invoke;
  v13 = &unk_1E5BCD220;
  v14 = self;
  id v4 = v11;
  os_unfair_lock_lock(p_accountTypeCacheLock);
  v12((uint64_t)v4);
  os_unfair_lock_unlock(p_accountTypeCacheLock);

  p_accountNotifyCachesLock = &self->_accountNotifyCachesLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v8 = __38__ACAccountStoreCache__clearAllCaches__block_invoke_2;
  v9 = &unk_1E5BCD220;
  id v10 = self;
  id v6 = v7;
  os_unfair_lock_lock(p_accountNotifyCachesLock);
  v8((uint64_t)v6);
  os_unfair_lock_unlock(p_accountNotifyCachesLock);
}

uint64_t __38__ACAccountStoreCache__clearAllCaches__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
}

uint64_t __38__ACAccountStoreCache__clearAllCaches__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

uint64_t __34__ACAccountStoreCache_sharedCache__block_invoke()
{
  sharedCache__sharedCache = objc_alloc_init(ACAccountStoreCache);

  return MEMORY[0x1F41817F8]();
}

- (ACAccountStoreCache)init
{
  v9.receiver = self;
  v9.super_class = (Class)ACAccountStoreCache;
  v2 = [(ACAccountStoreCache *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_accountNotifyCachesLock._os_unfair_lock_opaque = 0;
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    accountNotifyCaches = v3->_accountNotifyCaches;
    v3->_accountNotifyCaches = v4;

    v3->_accountTypeCacheLock._os_unfair_lock_opaque = 0;
    v3->_allAccountTypeCached = 0;
    uint64_t v6 = objc_opt_new();
    accountTypeCache = v3->_accountTypeCache;
    v3->_accountTypeCache = (NSMutableDictionary *)v6;

    [(ACAccountStoreCache *)v3 setupMemoryNotifications];
  }
  return v3;
}

- (void)setupMemoryNotifications
{
  v3 = dispatch_get_global_queue(17, 0);
  id v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14468], 0, 6uLL, v3);
  memoryNotificationSource = self->_memoryNotificationSource;
  self->_memoryNotificationSource = v4;

  uint64_t v6 = self->_memoryNotificationSource;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __47__ACAccountStoreCache_setupMemoryNotifications__block_invoke;
  handler[3] = &unk_1E5BCD220;
  handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);
  dispatch_resume((dispatch_object_t)self->_memoryNotificationSource);
}

- (unint64_t)generationForCacheSuffix:(id)a3
{
  id v4 = a3;
  v5 = +[ACNotifyAccountCache cacheKeyForSuffix:v4];
  uint64_t v6 = v5;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  if (v5)
  {
    p_accountNotifyCachesLock = &self->_accountNotifyCachesLock;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v12 = __48__ACAccountStoreCache_generationForCacheSuffix___block_invoke;
    v13 = &unk_1E5BCEA70;
    v14 = self;
    id v15 = v5;
    id v16 = &v17;
    v8 = v11;
    os_unfair_lock_lock(p_accountNotifyCachesLock);
    v12(v8);
    os_unfair_lock_unlock(p_accountNotifyCachesLock);

    unint64_t v9 = v18[3];
  }
  else
  {
    unint64_t v9 = 0;
  }
  _Block_object_dispose(&v17, 8);

  return v9;
}

void __48__ACAccountStoreCache_generationForCacheSuffix___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];

  if (!v2)
  {
    v3 = [[ACNotifyAccountCache alloc] initWithKey:a1[5]];
    [*(id *)(a1[4] + 32) setObject:v3 forKeyedSubscript:a1[5]];
  }
  id v4 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = [v4 generation];
}

- (void)cacheAllAccountTypes:(id)a3
{
  id v4 = a3;
  p_accountTypeCacheLock = &self->_accountTypeCacheLock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  unint64_t v9 = __44__ACAccountStoreCache_cacheAllAccountTypes___block_invoke;
  id v10 = &unk_1E5BCCD58;
  id v6 = v4;
  id v11 = v6;
  id v12 = self;
  id v7 = v8;
  os_unfair_lock_lock(p_accountTypeCacheLock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_accountTypeCacheLock);
}

void __44__ACAccountStoreCache_cacheAllAccountTypes___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_lock_cacheAccountType:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  *(unsigned char *)(*(void *)(a1 + 40) + 8) = 1;
}

- (id)cachedAllAccountTypes
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__ACAccountStoreCache_cachedAllAccountTypes__block_invoke;
  v4[3] = &unk_1E5BCE910;
  v4[4] = self;
  id v2 = ac_unfair_lock_perform_with_result_1(&self->_accountTypeCacheLock, v4);

  return v2;
}

id __44__ACAccountStoreCache_cachedAllAccountTypes__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    id v2 = objc_alloc(MEMORY[0x1E4F1C978]);
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) allValues];
    uint64_t v4 = (void *)[v2 initWithArray:v3 copyItems:1];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryNotificationSource, 0);
  objc_storeStrong((id *)&self->_accountNotifyCaches, 0);

  objc_storeStrong((id *)&self->_accountTypeCache, 0);
}

void __47__ACAccountStoreCache_setupMemoryNotifications__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A57C5000, log, OS_LOG_TYPE_DEBUG, "\"ACAccountStoreCache: Memory pressure notification received, flushing cache\"", v1, 2u);
}

@end