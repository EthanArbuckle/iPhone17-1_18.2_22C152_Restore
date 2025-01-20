@interface ACHSyncingMonthlyChallengeTemplateCache
- (ACHSyncingMonthlyChallengeTemplateCache)initWithHealthStore:(id)a3;
- (ACHSyncingMonthlyChallengeTemplateCache)initWithProfile:(id)a3;
- (BOOL)_daemon_cacheTemplate:(id)a3 error:(id *)a4;
- (BOOL)_store_cacheTemplate:(id)a3 error:(id *)a4;
- (BOOL)cacheTemplate:(id)a3 error:(id *)a4;
- (HDDatabaseTransactionContext)databaseContext;
- (HDKeyValueDomain)keyValueDomain;
- (HDProfile)profile;
- (HKHealthStore)healthStore;
- (HKKeyValueDomain)kvDomain;
- (NSCalendar)gregorianCalendar;
- (id)_daemon_allCachedTemplatesWithError:(id *)a3;
- (id)_daemon_templateForDateComponents:(id)a3 error:(id *)a4;
- (id)_store_allCachedTemplatesWithError:(id *)a3;
- (id)_store_templateForDateComponents:(id)a3 error:(id *)a4;
- (id)allCachedTemplatesWithError:(id *)a3;
- (id)templateForDateComponents:(id)a3 error:(id *)a4;
- (void)setDatabaseContext:(id)a3;
- (void)setGregorianCalendar:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setKeyValueDomain:(id)a3;
- (void)setKvDomain:(id)a3;
- (void)setProfile:(id)a3;
@end

@implementation ACHSyncingMonthlyChallengeTemplateCache

- (ACHSyncingMonthlyChallengeTemplateCache)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ACHSyncingMonthlyChallengeTemplateCache;
  v6 = [(ACHSyncingMonthlyChallengeTemplateCache *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    uint64_t v8 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    gregorianCalendar = v7->_gregorianCalendar;
    v7->_gregorianCalendar = (NSCalendar *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263F0A470]) initWithCategory:0 domainName:@"com.apple.ActivityAchievements.MonthlyChallengeTemplateCache" healthStore:v5];
    kvDomain = v7->_kvDomain;
    v7->_kvDomain = (HKKeyValueDomain *)v10;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (ACHSyncingMonthlyChallengeTemplateCache)initWithProfile:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ACHSyncingMonthlyChallengeTemplateCache;
  id v5 = [(ACHSyncingMonthlyChallengeTemplateCache *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    gregorianCalendar = v6->_gregorianCalendar;
    v6->_gregorianCalendar = (NSCalendar *)v7;

    id v9 = objc_alloc(MEMORY[0x263F43218]);
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    uint64_t v11 = [v9 initWithCategory:105 domainName:@"com.apple.ActivityAchievements.MonthlyChallengeTemplateCache" profile:WeakRetained];
    keyValueDomain = v6->_keyValueDomain;
    v6->_keyValueDomain = (HDKeyValueDomain *)v11;

    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (BOOL)cacheTemplate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(ACHSyncingMonthlyChallengeTemplateCache *)self healthStore];

  if (v7) {
    BOOL v8 = [(ACHSyncingMonthlyChallengeTemplateCache *)self _store_cacheTemplate:v6 error:a4];
  }
  else {
    BOOL v8 = [(ACHSyncingMonthlyChallengeTemplateCache *)self _daemon_cacheTemplate:v6 error:a4];
  }
  BOOL v9 = v8;

  return v9;
}

- (BOOL)_store_cacheTemplate:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = _ACHMonthlyChallengeKeyFromTemplate(v6);
  BOOL v8 = ACHMonthlyChallengeCacheValue();

  if (v8)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    uint64_t v10 = [(ACHSyncingMonthlyChallengeTemplateCache *)self kvDomain];
    uint64_t v11 = [v10 stringForKey:v7 error:a4];

    os_unfair_lock_unlock(&self->_lock);
    if (*a4)
    {
      v12 = ACHLogMonthlyChallenges();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = *a4;
        int v18 = 138412290;
        id v19 = v13;
        _os_log_impl(&dword_21F5DA000, v12, OS_LOG_TYPE_DEFAULT, "Unable to access values in key-value domain for cache: %@", (uint8_t *)&v18, 0xCu);
      }
    }
    else
    {
      if (!v11)
      {
        os_unfair_lock_lock(&self->_lock);
        v17 = [(ACHSyncingMonthlyChallengeTemplateCache *)self kvDomain];
        char v14 = [v17 setString:v8 forKey:v7 error:a4];

        os_unfair_lock_unlock(p_lock);
        goto LABEL_12;
      }
      v15 = ACHLogMonthlyChallenges();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412802;
        id v19 = v7;
        __int16 v20 = 2112;
        v21 = v8;
        __int16 v22 = 2112;
        v23 = v11;
        _os_log_impl(&dword_21F5DA000, v15, OS_LOG_TYPE_DEFAULT, "Monthly challenge already cached for %@; ignoring template %@ in favor of %@",
          (uint8_t *)&v18,
          0x20u);
      }
    }
    char v14 = 0;
LABEL_12:

    goto LABEL_13;
  }
  char v14 = 0;
LABEL_13:

  return v14;
}

- (BOOL)_daemon_cacheTemplate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = _ACHMonthlyChallengeKeyFromTemplate(v6);
  BOOL v8 = ACHMonthlyChallengeCacheValue();
  if (v8)
  {
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    BOOL v9 = [(ACHSyncingMonthlyChallengeTemplateCache *)self keyValueDomain];
    v17 = (void *)MEMORY[0x263F432E0];
    uint64_t v10 = [(ACHSyncingMonthlyChallengeTemplateCache *)self profile];
    uint64_t v11 = [v10 database];
    v12 = [(ACHSyncingMonthlyChallengeTemplateCache *)self databaseContext];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __71__ACHSyncingMonthlyChallengeTemplateCache__daemon_cacheTemplate_error___block_invoke;
    v23[3] = &unk_264516AD8;
    id v24 = v9;
    id v25 = v7;
    id v26 = v8;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __71__ACHSyncingMonthlyChallengeTemplateCache__daemon_cacheTemplate_error___block_invoke_305;
    v19[3] = &unk_264516B68;
    id v13 = v24;
    id v20 = v13;
    id v21 = v26;
    id v22 = v25;
    char v14 = [v17 performWriteTransactionWithHealthDatabase:v11 context:v12 error:a4 block:v23 inaccessibilityHandler:v19];

    os_unfair_lock_unlock(lock);
    if (*a4)
    {
      v15 = ACHLogMonthlyChallenges();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[ACHSyncingMonthlyChallengeTemplateCache _daemon_cacheTemplate:error:]();
      }
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

void *__71__ACHSyncingMonthlyChallengeTemplateCache__daemon_cacheTemplate_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = (void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) stringForKey:*(void *)(a1 + 40) error:a3];
  if (!v6)
  {
    if (!v3 || !*v3)
    {
      v3 = (void *)[*(id *)(a1 + 32) setString:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40) error:v3];
      goto LABEL_13;
    }
    v12 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __71__ACHSyncingMonthlyChallengeTemplateCache__daemon_cacheTemplate_error___block_invoke_cold_1(v5, v3, v12);
    }

    goto LABEL_11;
  }
  uint64_t v7 = ACHLogMonthlyChallenges();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Monthly challenge already cached for %@; ignoring template %@ in favor of %@",
      buf,
      0x20u);
  }

  if (v3)
  {
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08320];
    v15 = @"Monthly challenge already cached for requested month/year combination.";
    uint64_t v11 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    void *v3 = [v10 errorWithDomain:@"com.apple.ActivityAchievements" code:42 userInfo:v11];

LABEL_11:
    v3 = 0;
  }
LABEL_13:

  return v3;
}

uint64_t __71__ACHSyncingMonthlyChallengeTemplateCache__daemon_cacheTemplate_error___block_invoke_305(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setString:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48) error:a3];
}

- (id)allCachedTemplatesWithError:(id *)a3
{
  id v5 = [(ACHSyncingMonthlyChallengeTemplateCache *)self healthStore];

  if (v5) {
    [(ACHSyncingMonthlyChallengeTemplateCache *)self _store_allCachedTemplatesWithError:a3];
  }
  else {
  id v6 = [(ACHSyncingMonthlyChallengeTemplateCache *)self _daemon_allCachedTemplatesWithError:a3];
  }
  return v6;
}

- (id)_store_allCachedTemplatesWithError:(id *)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__8;
  v35 = __Block_byref_object_dispose__8;
  id v36 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__8;
  v29[4] = __Block_byref_object_dispose__8;
  id v30 = 0;
  uint64_t v7 = [(ACHSyncingMonthlyChallengeTemplateCache *)self kvDomain];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __78__ACHSyncingMonthlyChallengeTemplateCache__store_allCachedTemplatesWithError___block_invoke;
  v25[3] = &unk_264516CF0;
  v27 = &v31;
  v28 = v29;
  dispatch_semaphore_t dsema = v6;
  dispatch_semaphore_t v26 = dsema;
  [v7 allValuesWithCompletion:v25];

  os_unfair_lock_unlock(p_lock);
  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(dsema, v8))
  {
    uint64_t v9 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v9, OS_LOG_TYPE_DEFAULT, "Timed out waiting for fetch of cached monthly challenge templates.", buf, 2u);
    }
    id v10 = 0;
LABEL_5:

    goto LABEL_6;
  }
  if (*a3)
  {
    v12 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ACHSyncingMonthlyChallengeTemplateCache _store_allCachedTemplatesWithError:]((uint64_t *)a3, v12);
    }
  }
  if ([(id)v32[5] count])
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = [(id)v32[5] allValues];
    uint64_t v13 = [v9 countByEnumeratingWithState:&v21 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v9);
          }
          v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v17 = [(ACHSyncingMonthlyChallengeTemplateCache *)self gregorianCalendar];
          __int16 v18 = ACHMonthlyChallengeTemplateFromCacheValue(v16, v17);

          if (v18)
          {
            [v10 addObject:v18];
          }
          else
          {
            uint64_t v19 = ACHLogMonthlyChallenges();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v38 = v16;
              _os_log_impl(&dword_21F5DA000, v19, OS_LOG_TYPE_DEFAULT, "Failed to deserialize template from cache value %@", buf, 0xCu);
            }
          }
        }
        uint64_t v13 = [v9 countByEnumeratingWithState:&v21 objects:v39 count:16];
      }
      while (v13);
    }
    goto LABEL_5;
  }
  id v10 = 0;
LABEL_6:

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v31, 8);

  return v10;
}

void __78__ACHSyncingMonthlyChallengeTemplateCache__store_allCachedTemplatesWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_time_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_daemon_allCachedTemplatesWithError:(id *)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__8;
  v34 = __Block_byref_object_dispose__8;
  id v35 = 0;
  id v6 = [(ACHSyncingMonthlyChallengeTemplateCache *)self keyValueDomain];
  uint64_t v7 = (void *)MEMORY[0x263F432E0];
  dispatch_time_t v8 = [(ACHSyncingMonthlyChallengeTemplateCache *)self profile];
  uint64_t v9 = [v8 database];
  id v10 = [(ACHSyncingMonthlyChallengeTemplateCache *)self databaseContext];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __79__ACHSyncingMonthlyChallengeTemplateCache__daemon_allCachedTemplatesWithError___block_invoke;
  v27[3] = &unk_264516D18;
  v29 = &v30;
  id v22 = v6;
  id v28 = v22;
  [v7 performReadTransactionWithHealthDatabase:v9 context:v10 error:a3 block:v27];

  os_unfair_lock_unlock(p_lock);
  if (*a3)
  {
    id v11 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ACHSyncingMonthlyChallengeTemplateCache _store_allCachedTemplatesWithError:]((uint64_t *)a3, v11);
    }
  }
  if ([(id)v31[5] count])
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v13 = [(id)v31[5] allValues];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          __int16 v18 = [(ACHSyncingMonthlyChallengeTemplateCache *)self gregorianCalendar];
          uint64_t v19 = ACHMonthlyChallengeTemplateFromCacheValue(v17, v18);

          if (v19)
          {
            [v12 addObject:v19];
          }
          else
          {
            __int16 v20 = ACHLogMonthlyChallenges();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v17;
              _os_log_impl(&dword_21F5DA000, v20, OS_LOG_TYPE_DEFAULT, "Failed to deserialize template from cache value %@", buf, 0xCu);
            }
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v38 count:16];
      }
      while (v14);
    }
  }
  else
  {
    id v12 = 0;
  }

  _Block_object_dispose(&v30, 8);
  return v12;
}

BOOL __79__ACHSyncingMonthlyChallengeTemplateCache__daemon_allCachedTemplatesWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "allValuesWithError:");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (id)templateForDateComponents:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(ACHSyncingMonthlyChallengeTemplateCache *)self healthStore];

  if (v7) {
    [(ACHSyncingMonthlyChallengeTemplateCache *)self _store_templateForDateComponents:v6 error:a4];
  }
  else {
  dispatch_time_t v8 = [(ACHSyncingMonthlyChallengeTemplateCache *)self _daemon_templateForDateComponents:v6 error:a4];
  }

  return v8;
}

- (id)_store_templateForDateComponents:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = _ACHMonthlyChallengeKeyFromDateComponents(v6);
  os_unfair_lock_lock(&self->_lock);
  dispatch_time_t v8 = [(ACHSyncingMonthlyChallengeTemplateCache *)self kvDomain];
  uint64_t v9 = [v8 stringForKey:v7 error:a4];

  os_unfair_lock_unlock(&self->_lock);
  if (*a4)
  {
    id v10 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACHSyncingMonthlyChallengeTemplateCache _store_templateForDateComponents:error:]();
    }
  }
  if (v9)
  {
    id v11 = [(ACHSyncingMonthlyChallengeTemplateCache *)self gregorianCalendar];
    id v12 = ACHMonthlyChallengeTemplateFromCacheValue(v9, v11);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_daemon_templateForDateComponents:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = _ACHMonthlyChallengeKeyFromDateComponents(v6);
  os_unfair_lock_lock(&self->_lock);
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__8;
  id v28 = __Block_byref_object_dispose__8;
  id v29 = 0;
  dispatch_time_t v8 = [(ACHSyncingMonthlyChallengeTemplateCache *)self keyValueDomain];
  uint64_t v9 = (void *)MEMORY[0x263F432E0];
  id v10 = [(ACHSyncingMonthlyChallengeTemplateCache *)self profile];
  id v11 = [v10 database];
  id v12 = [(ACHSyncingMonthlyChallengeTemplateCache *)self databaseContext];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __83__ACHSyncingMonthlyChallengeTemplateCache__daemon_templateForDateComponents_error___block_invoke;
  v20[3] = &unk_264515F30;
  long long v23 = &v24;
  id v13 = v8;
  id v21 = v13;
  id v14 = v7;
  id v22 = v14;
  [v9 performReadTransactionWithHealthDatabase:v11 context:v12 error:a4 block:v20];

  os_unfair_lock_unlock(&self->_lock);
  if (*a4)
  {
    uint64_t v15 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ACHSyncingMonthlyChallengeTemplateCache _store_templateForDateComponents:error:]();
    }
  }
  v16 = (void *)v25[5];
  if (v16)
  {
    uint64_t v17 = [(ACHSyncingMonthlyChallengeTemplateCache *)self gregorianCalendar];
    __int16 v18 = ACHMonthlyChallengeTemplateFromCacheValue(v16, v17);
  }
  else
  {
    __int16 v18 = 0;
  }

  _Block_object_dispose(&v24, 8);
  return v18;
}

uint64_t __83__ACHSyncingMonthlyChallengeTemplateCache__daemon_templateForDateComponents_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [*(id *)(a1 + 32) stringForKey:*(void *)(a1 + 40) error:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 1;
}

- (HDDatabaseTransactionContext)databaseContext
{
  return self->_databaseContext;
}

- (void)setDatabaseContext:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKKeyValueDomain)kvDomain
{
  return self->_kvDomain;
}

- (void)setKvDomain:(id)a3
{
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (void)setGregorianCalendar:(id)a3
{
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (HDKeyValueDomain)keyValueDomain
{
  return self->_keyValueDomain;
}

- (void)setKeyValueDomain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_kvDomain, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_databaseContext, 0);
}

- (void)_daemon_cacheTemplate:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_21F5DA000, v0, OS_LOG_TYPE_DEBUG, "Error caching monthly challenge template %@: %@", v1, 0x16u);
}

void __71__ACHSyncingMonthlyChallengeTemplateCache__daemon_cacheTemplate_error___block_invoke_cold_1(void *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, (uint64_t)a2, a3, "Error retrieving existing value for %@: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)_store_allCachedTemplatesWithError:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_ERROR, "Error pulling monthly challenge cache: %@", (uint8_t *)&v3, 0xCu);
}

- (void)_store_templateForDateComponents:error:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v0, v1, "Error pulling cached value for date components %@: %@");
}

@end