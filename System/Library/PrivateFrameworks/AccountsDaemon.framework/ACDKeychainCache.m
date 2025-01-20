@interface ACDKeychainCache
- (ACDKeychainCache)initWithValidityDuration:(unsigned int)a3;
- (NSDictionary)cachesByUsername;
- (NSMutableDictionary)expirersByUsername;
- (id)dataForService:(id)a3 username:(id)a4 syncState:(unint64_t)a5;
- (unsigned)cacheValidityDuration;
- (void)cacheData:(id)a3 forService:(id)a4 username:(id)a5 syncState:(unint64_t)a6;
- (void)clearCacheForSyncState:(unint64_t)a3;
- (void)clearDataForService:(id)a3 username:(id)a4 syncState:(unint64_t)a5;
- (void)setCacheValidityDuration:(unsigned int)a3;
- (void)setCachesByUsername:(id)a3;
- (void)setExpirersByUsername:(id)a3;
@end

@implementation ACDKeychainCache

- (ACDKeychainCache)initWithValidityDuration:(unsigned int)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ACDKeychainCache;
  v4 = [(ACDKeychainCache *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [NSDictionary dictionary];
    cachesByUsername = v4->_cachesByUsername;
    v4->_cachesByUsername = (NSDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:10];
    expirersByUsername = v4->_expirersByUsername;
    v4->_expirersByUsername = (NSMutableDictionary *)v7;

    *(void *)&v4->_cachesLock._os_unfair_lock_opaque = 0;
    v4->_cacheValidityDuration = a3;
  }
  return v4;
}

- (void)cacheData:(id)a3 forService:(id)a4 username:(id)a5 syncState:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__0;
  v35[4] = __Block_byref_object_dispose__0;
  id v36 = 0;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v27 = __60__ACDKeychainCache_cacheData_forService_username_syncState___block_invoke;
  v28 = &unk_264320C28;
  v33 = v35;
  v29 = self;
  id v13 = v12;
  id v30 = v13;
  unint64_t v34 = a6;
  id v14 = v10;
  id v31 = v14;
  id v15 = v11;
  id v32 = v15;
  v16 = v26;
  os_unfair_lock_lock(&self->_cachesLock);
  v27((uint64_t)v16);
  os_unfair_lock_unlock(&self->_cachesLock);

  p_expirersLock = &self->_expirersLock;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v21 = __60__ACDKeychainCache_cacheData_forService_username_syncState___block_invoke_2;
  v22 = &unk_264320CA0;
  v23 = self;
  id v18 = v13;
  id v24 = v18;
  v25 = v35;
  v19 = v20;
  os_unfair_lock_lock(p_expirersLock);
  v21((uint64_t)v19);
  os_unfair_lock_unlock(p_expirersLock);

  _Block_object_dispose(v35, 8);
}

void __60__ACDKeychainCache_cacheData_forService_username_syncState___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cachesByUsername];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    v9 = [*(id *)(a1 + 32) cachesByUsername];
    id v10 = (void *)[v9 mutableCopy];

    [v10 setObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 40)];
    id v11 = (void *)[v10 copy];
    [*(id *)(a1 + 32) setCachesByUsername:v11];
  }
  uint64_t v12 = *(void *)(a1 + 72);
  if (v12 == 2)
  {
    id v14 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) nonSyncableItems];
    [v14 setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 56)];

    goto LABEL_8;
  }
  if (v12 == 1)
  {
LABEL_8:
    id v13 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) syncableItems];
    goto LABEL_9;
  }
  if (v12) {
    return;
  }
  id v13 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) nonSyncableItems];
LABEL_9:
  id v15 = v13;
  [v13 setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 56)];
}

void __60__ACDKeychainCache_cacheData_forService_username_syncState___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) expirersByUsername];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v3)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263EFB280], "expirerWithTimeout:", objc_msgSend(*(id *)(a1 + 32), "cacheValidityDuration"));
    uint64_t v4 = [*(id *)(a1 + 32) expirersByUsername];
    [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__ACDKeychainCache_cacheData_forService_username_syncState___block_invoke_3;
  v7[3] = &unk_264320C78;
  objc_copyWeak(&v10, &location);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  [v3 scheduleExpiration:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __60__ACDKeychainCache_cacheData_forService_username_syncState___block_invoke_3(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    uint64_t v7 = __60__ACDKeychainCache_cacheData_forService_username_syncState___block_invoke_4;
    id v8 = &unk_264320C50;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v9 = v3;
    uint64_t v10 = v4;
    id v5 = v6;
    os_unfair_lock_lock(WeakRetained + 2);
    v7((uint64_t)v5);
    os_unfair_lock_unlock(WeakRetained + 2);
  }
}

void __60__ACDKeychainCache_cacheData_forService_username_syncState___block_invoke_4(uint64_t a1)
{
  v2 = _ACDLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __60__ACDKeychainCache_cacheData_forService_username_syncState___block_invoke_4_cold_1(a1, v2);
  }

  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) nonSyncableItems];
  [v3 removeAllObjects];

  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) syncableItems];
  [v4 removeAllObjects];
}

- (id)dataForService:(id)a3 username:(id)a4 syncState:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  p_cachesLock = &self->_cachesLock;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v17 = __54__ACDKeychainCache_dataForService_username_syncState___block_invoke;
  id v18 = &unk_264320CC8;
  v19 = self;
  id v11 = v9;
  id v20 = v11;
  unint64_t v22 = a5;
  id v12 = v8;
  id v21 = v12;
  id v13 = v16;
  os_unfair_lock_lock(p_cachesLock);
  id v14 = v17((uint64_t)v13);
  os_unfair_lock_unlock(p_cachesLock);

  return v14;
}

id __54__ACDKeychainCache_dataForService_username_syncState___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) cachesByUsername];
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v5 = *(void *)(a1 + 56);
  if (v5 == 2)
  {
    uint64_t v7 = [v4 nonSyncableItems];
    id v8 = [v7 objectForKey:*(void *)(a1 + 48)];

    id v9 = [v4 syncableItems];
    uint64_t v10 = [v9 objectForKey:*(void *)(a1 + 48)];

    uint64_t v11 = [MEMORY[0x263EFF9D0] null];
    if (v8 == (void *)v11)
    {
    }
    else
    {
      id v12 = (void *)v11;
      id v13 = [MEMORY[0x263EFF9D0] null];

      if (v10 != v13)
      {
        if (v8) {
          id v14 = v8;
        }
        else {
          id v14 = v10;
        }
        id v15 = v14;
        goto LABEL_11;
      }
    }
    v16 = [MEMORY[0x263EFF9D0] null];
    if (v8 == v16)
    {
      v17 = [MEMORY[0x263EFF9D0] null];

      if (v10 == v17)
      {
        id v15 = [MEMORY[0x263EFF9D0] null];
LABEL_11:
        v1 = v15;
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
    }
    v1 = 0;
    goto LABEL_19;
  }
  if (v5 == 1)
  {
    uint64_t v6 = [v4 syncableItems];
  }
  else
  {
    if (v5) {
      goto LABEL_21;
    }
    uint64_t v6 = [v4 nonSyncableItems];
  }
  id v8 = v6;
  v1 = [v6 objectForKey:*(void *)(a1 + 48)];
LABEL_20:

LABEL_21:

  return v1;
}

- (void)clearDataForService:(id)a3 username:(id)a4 syncState:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  p_cachesLock = &self->_cachesLock;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  id v15 = __59__ACDKeychainCache_clearDataForService_username_syncState___block_invoke;
  v16 = &unk_264320B88;
  v17 = self;
  id v11 = v9;
  id v18 = v11;
  unint64_t v20 = a5;
  id v12 = v8;
  id v19 = v12;
  id v13 = v14;
  os_unfair_lock_lock(p_cachesLock);
  v15((uint64_t)v13);
  os_unfair_lock_unlock(p_cachesLock);
}

void __59__ACDKeychainCache_clearDataForService_username_syncState___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cachesByUsername];
  id v9 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v3 = *(void *)(a1 + 56);
  if (v3 == 2)
  {
    uint64_t v5 = [v9 nonSyncableItems];
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v6 = (void *)(a1 + 48);
    [v5 removeObjectForKey:v7];

    id v8 = [v9 syncableItems];
  }
  else
  {
    if (v3 == 1)
    {
      uint64_t v4 = [v9 syncableItems];
    }
    else
    {
      if (v3) {
        goto LABEL_9;
      }
      uint64_t v4 = [v9 nonSyncableItems];
    }
    id v8 = (void *)v4;
    uint64_t v6 = (void *)(a1 + 48);
  }
  [v8 removeObjectForKey:*v6];

LABEL_9:
}

- (void)clearCacheForSyncState:(unint64_t)a3
{
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  id v13 = __43__ACDKeychainCache_clearCacheForSyncState___block_invoke;
  id v14 = &unk_264320A98;
  p_cachesLock = &self->_cachesLock;
  id v15 = self;
  unint64_t v16 = a3;
  uint64_t v5 = v12;
  os_unfair_lock_lock(p_cachesLock);
  v13((uint64_t)v5);
  os_unfair_lock_unlock(p_cachesLock);

  p_expirersLock = &self->_expirersLock;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  id v9 = __43__ACDKeychainCache_clearCacheForSyncState___block_invoke_2;
  uint64_t v10 = &unk_264320CF0;
  id v11 = self;
  uint64_t v7 = v8;
  os_unfair_lock_lock(p_expirersLock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_expirersLock);
}

void __43__ACDKeychainCache_clearCacheForSyncState___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "cachesByUsername", 0);
  uint64_t v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        uint64_t v9 = *(void *)(a1 + 40);
        if (v9 == 2)
        {
          id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * v7) nonSyncableItems];
          [v11 removeAllObjects];

LABEL_11:
          uint64_t v10 = [v8 syncableItems];
          goto LABEL_12;
        }
        if (v9 == 1) {
          goto LABEL_11;
        }
        if (v9) {
          goto LABEL_13;
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * v7) nonSyncableItems];
LABEL_12:
        id v12 = v10;
        [v10 removeAllObjects];

LABEL_13:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

void __43__ACDKeychainCache_clearCacheForSyncState___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) expirersByUsername];
  [v1 removeAllObjects];
}

- (unsigned)cacheValidityDuration
{
  return self->_cacheValidityDuration;
}

- (void)setCacheValidityDuration:(unsigned int)a3
{
  self->_cacheValidityDuration = a3;
}

- (NSDictionary)cachesByUsername
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCachesByUsername:(id)a3
{
}

- (NSMutableDictionary)expirersByUsername
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExpirersByUsername:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirersByUsername, 0);

  objc_storeStrong((id *)&self->_cachesByUsername, 0);
}

void __60__ACDKeychainCache_cacheData_forService_username_syncState___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_2183AD000, a2, OS_LOG_TYPE_DEBUG, "@\"Clearing keychain cache for %@\"", (uint8_t *)&v3, 0xCu);
}

@end