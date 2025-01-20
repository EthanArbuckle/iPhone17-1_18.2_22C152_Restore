@interface ACDAccountCache
- (ACDAccountCache)initWithValidityDuration:(unsigned int)a3;
- (NSMutableDictionary)cachedAccountIDsByType;
- (NSMutableDictionary)cachedAccountTypesByID;
- (NSMutableDictionary)cachedAccountsByID;
- (NSMutableDictionary)expirersByID;
- (NSMutableDictionary)generationWritersByKey;
- (id)_expirerIdentifierForAccountTypeID:(id)a3;
- (id)_keyForType:(id)a3 justActive:(BOOL)a4;
- (id)_lock_nonCopyOfAccountWithIdentifier:(id)a3;
- (id)_lock_writerForKey:(id)a3;
- (id)cachedAccountForIdentifier:(id)a3;
- (id)cachedAccountTypeForID:(id)a3;
- (id)cachedAccountsOfType:(id)a3 justActive:(BOOL)a4;
- (id)cachedAccountsOfType:(id)a3 justActive:(BOOL)a4 fetchBlock:(id)a5;
- (unsigned)cacheValidityDuration;
- (void)_caches_lock_cacheAccounts:(id)a3 forType:(id)a4 justActive:(BOOL)a5;
- (void)_expirerScheduleForAccountIdentifier:(id)a3;
- (void)_lock_cacheAccount:(id)a3;
- (void)_lock_cacheAccountCopy:(id)a3;
- (void)_lock_cacheGenerationForAccounts:(id)a3 cacheSuffix:(id)a4;
- (void)_lock_cacheParent:(id)a3;
- (void)_lock_removeAccountsForType:(id)a3;
- (void)_lock_resetAllAccountTypeIdentifiers;
- (void)_lock_resetCacheGenerationsForChildren:(id)a3 recurseDepth:(unint64_t)a4 store:(id)a5;
- (void)_lock_resetGenerationForType:(id)a3;
- (void)_resetParentAccountForCachedAccountIfNeeded:(id)a3;
- (void)cacheAccount:(id)a3;
- (void)cacheAccountType:(id)a3;
- (void)cacheAccounts:(id)a3 forType:(id)a4 justActive:(BOOL)a5;
- (void)cacheGenerationForAccounts:(id)a3 cacheSuffix:(id)a4;
- (void)clearCache;
- (void)removeAccount:(id)a3 store:(id)a4;
- (void)removeAccountType:(id)a3;
- (void)setCacheValidityDuration:(unsigned int)a3;
- (void)setCachedAccountIDsByType:(id)a3;
- (void)setCachedAccountTypesByID:(id)a3;
- (void)setCachedAccountsByID:(id)a3;
- (void)setExpirersByID:(id)a3;
- (void)setGenerationWritersByKey:(id)a3;
@end

@implementation ACDAccountCache

- (id)cachedAccountsOfType:(id)a3 justActive:(BOOL)a4 fetchBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __62__ACDAccountCache_cachedAccountsOfType_justActive_fetchBlock___block_invoke;
  v15[3] = &unk_264320E30;
  p_cachesLock = &self->_cachesLock;
  v15[4] = self;
  id v16 = v8;
  BOOL v18 = a4;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  v13 = ac_unfair_lock_perform_with_result(p_cachesLock, v15);

  return v13;
}

- (id)cachedAccountTypeForID:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__ACDAccountCache_cachedAccountTypeForID___block_invoke;
  v9[3] = &unk_264320D90;
  p_cachesLock = &self->_cachesLock;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  v7 = ac_unfair_lock_perform_with_result(p_cachesLock, v9);

  return v7;
}

id __62__ACDAccountCache_cachedAccountsOfType_justActive_fetchBlock___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _keyForType:*(void *)(a1 + 40) justActive:*(unsigned __int8 *)(a1 + 56)];
  v3 = [*(id *)(a1 + 32) cachedAccountIDsByType];
  id v4 = [v3 objectForKeyedSubscript:v2];

  if (v4)
  {
    v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
        id v12 = objc_msgSend(*(id *)(a1 + 32), "cachedAccountsByID", (void)v19);
        v13 = [v12 objectForKeyedSubscript:v11];

        if (!v13) {
          break;
        }
        [v5 addObject:v13];

        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    uint64_t v14 = [v5 count];
    if (v14 == [v6 count])
    {
      v15 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v5 copyItems:1];

      if (v15) {
        goto LABEL_17;
      }
    }
    else
    {
    }
  }
  uint64_t v16 = *(void *)(a1 + 48);
  if (v16)
  {
    id v17 = (*(void (**)(void))(v16 + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_caches_lock_cacheAccounts:forType:justActive:", v17, *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
    v15 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v17 copyItems:1];
  }
  else
  {
    v15 = 0;
  }
LABEL_17:

  return v15;
}

- (NSMutableDictionary)cachedAccountIDsByType
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (id)_keyForType:(id)a3 justActive:(BOOL)a4
{
  id v4 = @"all";
  if (a4) {
    id v4 = @"active";
  }
  return (id)[NSString stringWithFormat:@"%@.%@", a3, v4];
}

id __42__ACDAccountCache_cachedAccountTypeForID___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cachedAccountTypesByID];
  v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (NSMutableDictionary)cachedAccountTypesByID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

id __46__ACDAccountCache_cachedAccountForIdentifier___block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 32), "_lock_nonCopyOfAccountWithIdentifier:", *(void *)(a1 + 40));
  v2 = (void *)[v1 copy];

  return v2;
}

- (id)_lock_nonCopyOfAccountWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(ACDAccountCache *)self cachedAccountsByID];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)cachedAccountForIdentifier:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__ACDAccountCache_cachedAccountForIdentifier___block_invoke;
  v9[3] = &unk_264320D90;
  p_cachesLock = &self->_cachesLock;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = ac_unfair_lock_perform_with_result(p_cachesLock, v9);

  return v7;
}

- (void)cacheAccountType:(id)a3
{
  id v4 = a3;
  v5 = (void *)[v4 copy];
  id v6 = [v5 identifier];
  uint64_t v7 = [(ACDAccountCache *)self _expirerIdentifierForAccountTypeID:v6];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  long long v21 = __36__ACDAccountCache_cacheAccountType___block_invoke;
  long long v22 = &unk_264320D40;
  v23 = self;
  id v8 = v5;
  id v24 = v8;
  uint64_t v9 = v20;
  os_unfair_lock_lock(&self->_cachesLock);
  v21((uint64_t)v9);
  os_unfair_lock_unlock(&self->_cachesLock);

  p_expirersLock = &self->_expirersLock;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v15 = __36__ACDAccountCache_cacheAccountType___block_invoke_2;
  uint64_t v16 = &unk_264320E08;
  id v17 = self;
  id v11 = v7;
  id v18 = v11;
  id v12 = v8;
  id v19 = v12;
  v13 = v14;
  os_unfair_lock_lock(p_expirersLock);
  v15((uint64_t)v13);
  os_unfair_lock_unlock(p_expirersLock);
}

void __36__ACDAccountCache_cacheAccountType___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) cachedAccountTypesByID];
  v3 = [*(id *)(a1 + 40) identifier];
  [v4 setObject:v2 forKeyedSubscript:v3];
}

- (id)_expirerIdentifierForAccountTypeID:(id)a3
{
  return (id)[NSString stringWithFormat:@"account-type.%@", a3];
}

void __56__ACDAccountCache__expirerScheduleForAccountIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) expirersByID];
  v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v3)
  {
    v3 = objc_msgSend(MEMORY[0x263EFB280], "expirerWithTimeout:", objc_msgSend(*(id *)(a1 + 32), "cacheValidityDuration"));
    id v4 = [*(id *)(a1 + 32) expirersByID];
    [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__ACDAccountCache__expirerScheduleForAccountIdentifier___block_invoke_2;
  v5[3] = &unk_264320D68;
  objc_copyWeak(&v7, &location);
  id v6 = *(id *)(a1 + 40);
  [v3 scheduleExpiration:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __36__ACDAccountCache_cacheAccountType___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) expirersByID];
  v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v3)
  {
    v3 = objc_msgSend(MEMORY[0x263EFB280], "expirerWithTimeout:", objc_msgSend(*(id *)(a1 + 32), "cacheValidityDuration"));
    id v4 = [*(id *)(a1 + 32) expirersByID];
    [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__ACDAccountCache_cacheAccountType___block_invoke_3;
  v7[3] = &unk_264320DE0;
  objc_copyWeak(&v10, &location);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  [v3 scheduleExpiration:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_caches_lock_cacheAccounts:(id)a3 forType:(id)a4 justActive:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = (id)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v8 copyItems:1];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v29;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v10);
        }
        [(ACDAccountCache *)self _lock_cacheAccount:*(void *)(*((void *)&v28 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v11);
  }

  uint64_t v14 = [MEMORY[0x263EFB250] suffixForAccountsForAccountType:v9 fetchOptions:v5 ^ 1];
  [(ACDAccountCache *)self _lock_cacheGenerationForAccounts:v8 cacheSuffix:v14];

  v15 = [(ACDAccountCache *)self _keyForType:v9 justActive:v5];
  uint64_t v16 = [v10 valueForKeyPath:@"identifier"];
  id v17 = [(ACDAccountCache *)self cachedAccountIDsByType];
  [v17 setObject:v16 forKeyedSubscript:v15];

  p_expirersLock = &self->_expirersLock;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v23 = __65__ACDAccountCache__caches_lock_cacheAccounts_forType_justActive___block_invoke;
  id v24 = &unk_264320E08;
  v25 = self;
  id v19 = v9;
  id v26 = v19;
  id v20 = v15;
  id v27 = v20;
  long long v21 = v22;
  os_unfair_lock_lock(p_expirersLock);
  v23((uint64_t)v21);
  os_unfair_lock_unlock(p_expirersLock);
}

void __65__ACDAccountCache__caches_lock_cacheAccounts_forType_justActive___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) expirersByID];
  v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v3)
  {
    v3 = objc_msgSend(MEMORY[0x263EFB280], "expirerWithTimeout:", objc_msgSend(*(id *)(a1 + 32), "cacheValidityDuration"));
    id v4 = [*(id *)(a1 + 32) expirersByID];
    [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 48)];
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__ACDAccountCache__caches_lock_cacheAccounts_forType_justActive___block_invoke_2;
  v7[3] = &unk_264320DE0;
  objc_copyWeak(&v10, &location);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  [v3 scheduleExpiration:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (NSMutableDictionary)expirersByID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (unsigned)cacheValidityDuration
{
  return self->_cacheValidityDuration;
}

- (void)_lock_cacheGenerationForAccounts:(id)a3 cacheSuffix:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x263EFB250];
  id v7 = a3;
  id v10 = [v6 cacheKeyForSuffix:a4];
  id v8 = [(ACDAccountCache *)self _lock_writerForKey:v10];
  uint64_t v9 = [MEMORY[0x263EFB250] generationForAccounts:v7];

  [v8 write:v9];
}

- (id)_lock_writerForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(ACDAccountCache *)self generationWritersByKey];
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];

    if (!v6)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x263EFB258]) initWithKey:v4];
      id v8 = [(ACDAccountCache *)self generationWritersByKey];
      [v8 setObject:v7 forKeyedSubscript:v4];
    }
    uint64_t v9 = [(ACDAccountCache *)self generationWritersByKey];
    id v10 = [v9 objectForKeyedSubscript:v4];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (NSMutableDictionary)generationWritersByKey
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)_lock_cacheAccountCopy:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ACDAccountCache *)self cachedAccountsByID];
  uint64_t v6 = [v4 identifier];
  [v5 setObject:v4 forKey:v6];

  id v7 = [v4 identifier];
  [(ACDAccountCache *)self _expirerScheduleForAccountIdentifier:v7];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v19 = self;
  id v8 = [(ACDAccountCache *)self cachedAccountsByID];
  uint64_t v9 = [v8 allValues];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v15 = [v14 parentAccount];
        uint64_t v16 = [v15 identifier];
        id v17 = [v4 identifier];
        int v18 = [v16 isEqualToString:v17];

        if (v18)
        {
          [v14 _resetParentAccount:v4];
          [(ACDAccountCache *)v19 _lock_cacheAccountCopy:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }
}

- (NSMutableDictionary)cachedAccountsByID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)_lock_cacheAccount:(id)a3
{
  id v4 = (void *)[a3 copy];
  id v5 = [v4 identifier];

  if (v5)
  {
    uint64_t v6 = [v4 parentAccount];

    if (v6)
    {
      id v7 = [v4 parentAccount];
      [(ACDAccountCache *)self _lock_cacheParent:v7];
    }
    [(ACDAccountCache *)self _lock_cacheAccountCopy:v4];
  }
  else
  {
    id v8 = _ACLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountCache _lock_cacheAccount:]((uint64_t)v4, v8);
    }
  }
}

- (void)_expirerScheduleForAccountIdentifier:(id)a3
{
  id v4 = a3;
  p_expirersLock = &self->_expirersLock;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  uint64_t v9 = __56__ACDAccountCache__expirerScheduleForAccountIdentifier___block_invoke;
  uint64_t v10 = &unk_264320D40;
  uint64_t v11 = self;
  id v6 = v4;
  id v12 = v6;
  id v7 = v8;
  os_unfair_lock_lock(p_expirersLock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_expirersLock);
}

void __65__ACDAccountCache__caches_lock_cacheAccounts_forType_justActive___block_invoke_2(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    id v7 = __65__ACDAccountCache__caches_lock_cacheAccounts_forType_justActive___block_invoke_3;
    id v8 = &unk_264320D40;
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

void __65__ACDAccountCache__caches_lock_cacheAccounts_forType_justActive___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = _ACDLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __65__ACDAccountCache__caches_lock_cacheAccounts_forType_justActive___block_invoke_3_cold_1(a1, v2);
  }

  id v3 = [*(id *)(a1 + 40) cachedAccountIDsByType];
  [v3 removeObjectForKey:*(void *)(a1 + 32)];
}

void __36__ACDAccountCache_cacheAccountType___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = _ACDLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __36__ACDAccountCache_cacheAccountType___block_invoke_4_cold_1(a1, v2);
  }

  id v3 = [*(id *)(a1 + 40) cachedAccountTypesByID];
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  [v3 removeObjectForKey:v4];
}

void __36__ACDAccountCache_cacheAccountType___block_invoke_3(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    id v7 = __36__ACDAccountCache_cacheAccountType___block_invoke_4;
    id v8 = &unk_264320D40;
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

- (ACDAccountCache)initWithValidityDuration:(unsigned int)a3
{
  v16.receiver = self;
  v16.super_class = (Class)ACDAccountCache;
  uint64_t v4 = [(ACDAccountCache *)&v16 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:20];
    cachedAccountsByID = v4->_cachedAccountsByID;
    v4->_cachedAccountsByID = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:10];
    cachedAccountIDsByType = v4->_cachedAccountIDsByType;
    v4->_cachedAccountIDsByType = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:20];
    cachedAccountTypesByID = v4->_cachedAccountTypesByID;
    v4->_cachedAccountTypesByID = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:10];
    expirersByID = v4->_expirersByID;
    v4->_expirersByID = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:10];
    generationWritersByKey = v4->_generationWritersByKey;
    v4->_generationWritersByKey = (NSMutableDictionary *)v13;

    *(void *)&v4->_cachesLock._os_unfair_lock_opaque = 0;
    v4->_cacheValidityDuration = a3;
  }
  return v4;
}

- (void)cacheAccount:(id)a3
{
  id v4 = a3;
  p_cachesLock = &self->_cachesLock;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  uint64_t v9 = __32__ACDAccountCache_cacheAccount___block_invoke;
  uint64_t v10 = &unk_264320D40;
  uint64_t v11 = self;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = v8;
  os_unfair_lock_lock(p_cachesLock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_cachesLock);
}

uint64_t __32__ACDAccountCache_cacheAccount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_cacheAccount:", *(void *)(a1 + 40));
}

void __56__ACDAccountCache__expirerScheduleForAccountIdentifier___block_invoke_2(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    uint64_t v5 = __56__ACDAccountCache__expirerScheduleForAccountIdentifier___block_invoke_3;
    id v6 = &unk_264320D40;
    id v7 = *(id *)(a1 + 32);
    id v8 = WeakRetained;
    id v3 = v4;
    os_unfair_lock_lock(WeakRetained + 2);
    v5((uint64_t)v3);
    os_unfair_lock_unlock(WeakRetained + 2);
  }
}

void __56__ACDAccountCache__expirerScheduleForAccountIdentifier___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = _ACDLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __56__ACDAccountCache__expirerScheduleForAccountIdentifier___block_invoke_3_cold_1(a1, v2);
  }

  id v3 = [*(id *)(a1 + 40) cachedAccountsByID];
  [v3 removeObjectForKey:*(void *)(a1 + 32)];
}

- (void)_lock_cacheParent:(id)a3
{
  id v9 = a3;
  id v4 = [(ACDAccountCache *)self cachedAccountsByID];
  uint64_t v5 = [v9 identifier];
  [v4 setObject:v9 forKey:v5];

  id v6 = [v9 identifier];
  [(ACDAccountCache *)self _expirerScheduleForAccountIdentifier:v6];

  id v7 = [v9 parentAccount];

  if (v7)
  {
    id v8 = [v9 parentAccount];
    [(ACDAccountCache *)self _lock_cacheParent:v8];
  }
}

- (void)cacheAccounts:(id)a3 forType:(id)a4 justActive:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  p_cachesLock = &self->_cachesLock;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v15 = __52__ACDAccountCache_cacheAccounts_forType_justActive___block_invoke;
  objc_super v16 = &unk_264320DB8;
  id v17 = self;
  id v11 = v8;
  id v18 = v11;
  id v12 = v9;
  id v19 = v12;
  BOOL v20 = a5;
  uint64_t v13 = v14;
  os_unfair_lock_lock(p_cachesLock);
  v15((uint64_t)v13);
  os_unfair_lock_unlock(p_cachesLock);
}

uint64_t __52__ACDAccountCache_cacheAccounts_forType_justActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_caches_lock_cacheAccounts:forType:justActive:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

- (id)cachedAccountsOfType:(id)a3 justActive:(BOOL)a4
{
  return [(ACDAccountCache *)self cachedAccountsOfType:a3 justActive:a4 fetchBlock:0];
}

- (void)_lock_removeAccountsForType:(id)a3
{
  id v8 = a3;
  id v4 = [(ACDAccountCache *)self cachedAccountIDsByType];
  uint64_t v5 = [(ACDAccountCache *)self _keyForType:v8 justActive:1];
  [v4 removeObjectForKey:v5];

  id v6 = [(ACDAccountCache *)self cachedAccountIDsByType];
  id v7 = [(ACDAccountCache *)self _keyForType:v8 justActive:0];
  [v6 removeObjectForKey:v7];

  [(ACDAccountCache *)self _lock_resetGenerationForType:v8];
}

- (void)removeAccountType:(id)a3
{
  id v4 = a3;
  p_cachesLock = &self->_cachesLock;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  id v9 = __37__ACDAccountCache_removeAccountType___block_invoke;
  uint64_t v10 = &unk_264320D40;
  id v11 = self;
  id v6 = v4;
  id v12 = v6;
  id v7 = v8;
  os_unfair_lock_lock(p_cachesLock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_cachesLock);
}

uint64_t __37__ACDAccountCache_removeAccountType___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cachedAccountTypesByID];
  id v3 = [*(id *)(a1 + 40) identifier];
  [v2 removeObjectForKey:v3];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) identifier];
  objc_msgSend(v4, "_lock_removeAccountsForType:", v5);

  id v6 = [*(id *)(a1 + 32) cachedAccountsByID];
  [v6 removeAllObjects];

  id v7 = *(void **)(a1 + 32);

  return objc_msgSend(v7, "_lock_resetAllAccountTypeIdentifiers");
}

- (void)removeAccount:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_cachesLock = &self->_cachesLock;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  uint64_t v13 = __39__ACDAccountCache_removeAccount_store___block_invoke;
  uint64_t v14 = &unk_264320E08;
  v15 = self;
  id v9 = v6;
  id v16 = v9;
  id v10 = v7;
  id v17 = v10;
  id v11 = v12;
  os_unfair_lock_lock(p_cachesLock);
  v13((uint64_t)v11);
  os_unfair_lock_unlock(p_cachesLock);
}

void __39__ACDAccountCache_removeAccount_store___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) cachedAccountsByID];
  id v3 = [*(id *)(a1 + 40) identifier];
  [v2 removeObjectForKey:v3];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "cachedAccountsByID", 0);
  uint64_t v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v11 = [v10 parentAccount];
        id v12 = [v11 identifier];
        uint64_t v13 = [*(id *)(a1 + 40) identifier];
        int v14 = [v12 isEqualToString:v13];

        if (v14)
        {
          v15 = [*(id *)(a1 + 32) cachedAccountsByID];
          id v16 = [v10 identifier];
          [v15 removeObjectForKey:v16];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  id v17 = *(void **)(a1 + 32);
  id v18 = [*(id *)(a1 + 40) accountType];
  id v19 = [v18 identifier];
  objc_msgSend(v17, "_lock_removeAccountsForType:", v19);

  BOOL v20 = *(void **)(a1 + 48);
  long long v21 = [*(id *)(a1 + 40) identifier];
  long long v22 = [v20 _childAccountsForAccountWithID:v21];

  objc_msgSend(*(id *)(a1 + 32), "_lock_resetCacheGenerationsForChildren:recurseDepth:store:", v22, 1, *(void *)(a1 + 48));
}

- (void)clearCache
{
  p_cachesLock = &self->_cachesLock;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  uint64_t v5 = __29__ACDAccountCache_clearCache__block_invoke;
  uint64_t v6 = &unk_264320CF0;
  uint64_t v7 = self;
  id v3 = v4;
  os_unfair_lock_lock(p_cachesLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_cachesLock);
}

uint64_t __29__ACDAccountCache_clearCache__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cachedAccountsByID];
  [v2 removeAllObjects];

  id v3 = [*(id *)(a1 + 32) cachedAccountIDsByType];
  [v3 removeAllObjects];

  id v4 = [*(id *)(a1 + 32) cachedAccountTypesByID];
  [v4 removeAllObjects];

  uint64_t v5 = *(void **)(a1 + 32);

  return objc_msgSend(v5, "_lock_resetAllAccountTypeIdentifiers");
}

- (void)_resetParentAccountForCachedAccountIfNeeded:(id)a3
{
  id v9 = a3;
  id v4 = [v9 parentAccount];

  if (v4)
  {
    uint64_t v5 = [(ACDAccountCache *)self cachedAccountsByID];
    uint64_t v6 = [v9 parentAccount];
    uint64_t v7 = [v6 identifier];
    uint64_t v8 = [v5 objectForKeyedSubscript:v7];

    if (v8) {
      [v9 _resetParentAccount:v8];
    }
  }
}

- (void)cacheGenerationForAccounts:(id)a3 cacheSuffix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_cachesLock = &self->_cachesLock;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  uint64_t v13 = __58__ACDAccountCache_cacheGenerationForAccounts_cacheSuffix___block_invoke;
  int v14 = &unk_264320E08;
  v15 = self;
  id v9 = v6;
  id v16 = v9;
  id v10 = v7;
  id v17 = v10;
  id v11 = v12;
  os_unfair_lock_lock(p_cachesLock);
  v13((uint64_t)v11);
  os_unfair_lock_unlock(p_cachesLock);
}

uint64_t __58__ACDAccountCache_cacheGenerationForAccounts_cacheSuffix___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_cacheGenerationForAccounts:cacheSuffix:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_lock_resetCacheGenerationsForChildren:(id)a3 recurseDepth:(unint64_t)a4 store:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (a4 <= 0xA)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      unint64_t v13 = a4 + 1;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v8);
          }
          v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v16 = [v15 accountType];
          id v17 = [v16 identifier];
          [(ACDAccountCache *)self _lock_resetGenerationForType:v17];

          id v18 = [v15 identifier];
          id v19 = [v9 _childAccountsForAccountWithID:v18];

          if ([v19 count]) {
            [(ACDAccountCache *)self _lock_resetCacheGenerationsForChildren:v19 recurseDepth:v13 store:v9];
          }
        }
        uint64_t v11 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }
  }
}

- (void)_lock_resetAllAccountTypeIdentifiers
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(MEMORY[0x263EFB220], "allIdentifiers", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(ACDAccountCache *)self _lock_resetGenerationForType:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_lock_resetGenerationForType:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263EFB250];
  id v5 = a3;
  uint64_t v6 = [v4 suffixForAccountsForAccountType:v5 fetchOptions:0];
  id v12 = [v4 cacheKeyForSuffix:v6];

  uint64_t v7 = [(ACDAccountCache *)self _lock_writerForKey:v12];
  objc_msgSend(v7, "write:", objc_msgSend(MEMORY[0x263EFB250], "generationForAccounts:", 0));

  long long v8 = (void *)MEMORY[0x263EFB250];
  long long v9 = [MEMORY[0x263EFB250] suffixForAccountsForAccountType:v5 fetchOptions:1];

  long long v10 = [v8 cacheKeyForSuffix:v9];

  long long v11 = [(ACDAccountCache *)self _lock_writerForKey:v10];
  objc_msgSend(v11, "write:", objc_msgSend(MEMORY[0x263EFB250], "generationForAccounts:", 0));
}

- (void)setCacheValidityDuration:(unsigned int)a3
{
  self->_cacheValidityDuration = a3;
}

- (void)setCachedAccountsByID:(id)a3
{
}

- (void)setCachedAccountIDsByType:(id)a3
{
}

- (void)setCachedAccountTypesByID:(id)a3
{
}

- (void)setExpirersByID:(id)a3
{
}

- (void)setGenerationWritersByKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generationWritersByKey, 0);
  objc_storeStrong((id *)&self->_expirersByID, 0);
  objc_storeStrong((id *)&self->_cachedAccountTypesByID, 0);
  objc_storeStrong((id *)&self->_cachedAccountIDsByType, 0);

  objc_storeStrong((id *)&self->_cachedAccountsByID, 0);
}

- (void)_lock_cacheAccount:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2183AD000, a2, OS_LOG_TYPE_ERROR, "\"ACDAccountCache just ran into an account (%@) missing an identifier, not caching it\"", (uint8_t *)&v2, 0xCu);
}

void __56__ACDAccountCache__expirerScheduleForAccountIdentifier___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_2183AD000, a2, OS_LOG_TYPE_DEBUG, "@\"Clearing account cache for %@\"", (uint8_t *)&v3, 0xCu);
}

void __65__ACDAccountCache__caches_lock_cacheAccounts_forType_justActive___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_2183AD000, a2, OS_LOG_TYPE_DEBUG, "@\"Clearing accounts cached for type: %@\"", (uint8_t *)&v3, 0xCu);
}

void __36__ACDAccountCache_cacheAccountType___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = [*(id *)(a1 + 32) identifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_2183AD000, a2, OS_LOG_TYPE_DEBUG, "@\"Clearing type cached for %@\"", (uint8_t *)&v4, 0xCu);
}

@end