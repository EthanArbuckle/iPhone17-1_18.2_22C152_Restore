@interface HDDatabaseValueCache
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)statistics;
- (HDDatabaseValueCache)init;
- (HDDatabaseValueCache)initWithName:(id)a3;
- (HDDatabaseValueCache)initWithName:(id)a3 cacheScope:(int64_t)a4;
- (HDDatabaseValueCacheTransactionStorage)_storageForTransaction:(int)a3 createIfNecessary:;
- (NSString)name;
- (id)_lock_objectForKey:(void *)a3 storage:;
- (id)diagnosticDescription;
- (id)fetchObjectForKey:(id)a3 transaction:(id)a4 error:(id *)a5 faultHandler:(id)a6;
- (id)objectForKey:(id)a3;
- (int64_t)cacheScope;
- (void)_lock_storeObject:(void *)a3 forKey:(void *)a4 transaction:;
- (void)dealloc;
- (void)removeAllObjectsWithTransaction:(id)a3;
- (void)removeObjectForKey:(id)a3 transaction:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4 transaction:(id)a5;
@end

@implementation HDDatabaseValueCache

- (id)objectForKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = -[HDDatabaseValueCache _storageForTransaction:createIfNecessary:]((uint64_t)self, 0, 0);
  v7 = -[HDDatabaseValueCache _lock_objectForKey:storage:](self, v5, v6);

  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (HDDatabaseValueCache)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDDatabaseValueCache)initWithName:(id)a3
{
  return [(HDDatabaseValueCache *)self initWithName:a3 cacheScope:0];
}

- (HDDatabaseValueCache)initWithName:(id)a3 cacheScope:(int64_t)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDDatabaseValueCache;
  v7 = [(HDDatabaseValueCache *)&v16 init];
  if (v7)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cache = v7->_cache;
    v7->_cache = v8;

    uint64_t v10 = [v6 copy];
    name = v7->_name;
    v7->_name = (NSString *)v10;

    v7->_cacheScope = a4;
    v7->_lock._os_unfair_lock_opaque = 0;
    uint64_t v12 = [[NSString alloc] initWithFormat:@"%@.%p", objc_opt_class(), v7];
    threadLocalKey = v7->_threadLocalKey;
    v7->_threadLocalKey = (NSString *)v12;

    v7->_statistics.faultCount = 0;
    v7->_statistics.lookupCount = 0;
    v7->_statistics.resetCount = 0;
    v14 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v14 addObject:v7];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
  [v3 removeObject:self];

  v4.receiver = self;
  v4.super_class = (Class)HDDatabaseValueCache;
  [(HDDatabaseValueCache *)&v4 dealloc];
}

- (int64_t)cacheScope
{
  return self->_cacheScope;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)statistics
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  *($F5DB93FF7B13EBFF3E2EFA7670924866 *)retstr = self->_statistics;

  os_unfair_lock_unlock(p_lock);
  return result;
}

- (id)fetchObjectForKey:(id)a3 transaction:(id)a4 error:(id *)a5 faultHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v13 = (void (**)(id, id, id *))a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_21:
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HDDatabaseValueCache.m", 98, @"Invalid parameter not satisfying: %@", @"transaction != nil" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_22;
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"HDDatabaseValueCache.m", 97, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];

  if (!v12) {
    goto LABEL_21;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_22:
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"HDDatabaseValueCache.m", 99, @"Invalid parameter not satisfying: %@", @"handler != NULL" object file lineNumber description];

LABEL_4:
  os_unfair_lock_lock(&self->_lock);
  v14 = -[HDDatabaseValueCache _storageForTransaction:createIfNecessary:]((uint64_t)self, v12, 0);
  uint64_t v15 = -[HDDatabaseValueCache _lock_objectForKey:storage:](self, v11, v14);
  if (v15)
  {
    objc_super v16 = (void *)v15;
    id v17 = 0;
LABEL_11:
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_12;
  }
  ++self->_statistics.faultCount;
  v18 = (void *)MEMORY[0x1C187C0E0]();
  id v24 = 0;
  objc_super v16 = v13[2](v13, v12, &v24);
  id v17 = v24;
  if (v16)
  {
    if (v14
      || (-[HDDatabaseValueCache _storageForTransaction:createIfNecessary:]((uint64_t)self, v12, 1),
          v19 = objc_claimAutoreleasedReturnValue(),
          (v14 = v19) != 0))
    {
      v19 = (void *)v14[2];
    }
    [v19 setObject:v16 forKeyedSubscript:v11];
    goto LABEL_11;
  }
  os_unfair_lock_unlock(&self->_lock);
  id v17 = v17;
  if (v17)
  {
    if (a5) {
      *a5 = v17;
    }
    else {
      _HKLogDroppedError();
    }
  }

  objc_super v16 = 0;
LABEL_12:

  return v16;
}

- (HDDatabaseValueCacheTransactionStorage)_storageForTransaction:(int)a3 createIfNecessary:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = [MEMORY[0x1E4F29060] currentThread];
    v7 = [v6 threadDictionary];

    v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 16)];
    if (v8) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = a3 == 0;
    }
    if (!v9)
    {
      if (!v5)
      {
        v19 = [MEMORY[0x1E4F28B00] currentHandler];
        [v19 handleFailureInMethod:sel__storageForTransaction_createIfNecessary_, a1, @"HDDatabaseValueCache.m", 221, @"Invalid parameter not satisfying: %@", @"transaction != nil" object file lineNumber description];
      }
      uint64_t v10 = objc_alloc_init(HDDatabaseValueCacheTransactionStorage);
      id v11 = v5;
      id v12 = v11;
      uint64_t v13 = *(void *)(a1 + 24);
      if (!v13)
      {
        if (v5 && [v11 cacheScope])
        {
          uint64_t v13 = [v12 cacheScope];
        }
        else
        {
          v14 = [MEMORY[0x1E4F2B860] sharedBehavior];
          uint64_t v15 = [v14 features];
          int v16 = [v15 databaseStateCacheTransactionScoped];

          if (v16) {
            uint64_t v13 = 1;
          }
          else {
            uint64_t v13 = 2;
          }
        }
      }

      if (!v10 || (v10->_cacheScope = v13) == 0)
      {
        v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:sel__storageForTransaction_createIfNecessary_, a1, @"HDDatabaseValueCache.m", 224, @"Invalid parameter not satisfying: %@", @"storage.cacheScope != HDDatabaseTransactionCacheScopeUnspecified" object file lineNumber description];
      }
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __65__HDDatabaseValueCache__storageForTransaction_createIfNecessary___block_invoke;
      v24[3] = &unk_1E62F30F8;
      v24[4] = a1;
      v8 = v10;
      v25 = v8;
      id v26 = v7;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __65__HDDatabaseValueCache__storageForTransaction_createIfNecessary___block_invoke_2;
      v21[3] = &unk_1E62F91D0;
      id v17 = v26;
      id v22 = v17;
      uint64_t v23 = a1;
      [v12 onCommit:v24 orRollback:v21];
      [v17 setObject:v8 forKeyedSubscript:*(void *)(a1 + 16)];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_lock_objectForKey:(void *)a3 storage:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)a1 + 8);
    ++*((void *)a1 + 6);
    if (v6) {
      v7 = (void *)v6[2];
    }
    else {
      v7 = 0;
    }
    v8 = [v7 objectForKeyedSubscript:v5];
    BOOL v9 = [MEMORY[0x1E4F1CA98] null];
    char v10 = [v8 isEqual:v9];

    if (v10) {
      goto LABEL_5;
    }
    if (v8)
    {
      id v11 = v8;
    }
    else
    {
      if (v6 && *((unsigned char *)v6 + 8))
      {
LABEL_5:
        a1 = 0;
LABEL_9:

        goto LABEL_10;
      }
      id v11 = [*((id *)a1 + 1) objectForKeyedSubscript:v5];
    }
    a1 = v11;
    goto LABEL_9;
  }
LABEL_10:

  return a1;
}

- (void)_lock_storeObject:(void *)a3 forKey:(void *)a4 transaction:
{
  if (a1)
  {
    v7 = (const os_unfair_lock *)(a1 + 32);
    id v8 = a4;
    id v9 = a3;
    id v10 = a2;
    os_unfair_lock_assert_owner(v7);
    id v12 = -[HDDatabaseValueCache _storageForTransaction:createIfNecessary:](a1, v8, 1);

    id v11 = v12;
    if (v12) {
      id v11 = (void *)v12[2];
    }
    [v11 setObject:v10 forKeyedSubscript:v9];
  }
}

- (void)setObject:(id)a3 forKey:(id)a4 transaction:(id)a5
{
  id v12 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HDDatabaseValueCache.m", 173, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  -[HDDatabaseValueCache _lock_storeObject:forKey:transaction:]((uint64_t)self, v12, v9, v10);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeObjectForKey:(id)a3 transaction:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (!v10)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HDDatabaseValueCache.m", 181, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  id v8 = [MEMORY[0x1E4F1CA98] null];
  -[HDDatabaseValueCache _lock_storeObject:forKey:transaction:]((uint64_t)self, v8, v10, v7);

  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeAllObjectsWithTransaction:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  if (self)
  {
    id v6 = v5;
    os_unfair_lock_assert_owner(p_lock);
    uint64_t v7 = -[HDDatabaseValueCache _storageForTransaction:createIfNecessary:]((uint64_t)self, v6, 1);

    if (v7)
    {
      [*(id *)(v7 + 16) removeAllObjects];
      *(unsigned char *)(v7 + 8) = 1;
    }
    else
    {
      [0 removeAllObjects];
    }
    ++self->_statistics.resetCount;
  }

  os_unfair_lock_unlock(p_lock);
}

uint64_t __65__HDDatabaseValueCache__storageForTransaction_createIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  if (v2)
  {
    objc_super v4 = (os_unfair_lock_s *)(v2 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 32));
    if (v3)
    {
      if (v3[8]) {
        [*(id *)(v2 + 8) removeAllObjects];
      }
      uint64_t v5 = *((void *)v3 + 3);
      if (!v5)
      {
        uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:sel__commitTransactionStorage_, v2, @"HDDatabaseValueCache.m", 243, @"Invalid parameter not satisfying: %@", @"transactionStorage.cacheScope != HDDatabaseTransactionCacheScopeUnspecified" object file lineNumber description];

        uint64_t v5 = *((void *)v3 + 3);
      }
      BOOL v6 = v5 != 1;
    }
    else
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:sel__commitTransactionStorage_, v2, @"HDDatabaseValueCache.m", 243, @"Invalid parameter not satisfying: %@", @"transactionStorage.cacheScope != HDDatabaseTransactionCacheScopeUnspecified" object file lineNumber description];

      BOOL v6 = 1;
    }
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
    if (v3) {
      id v8 = (void *)*((void *)v3 + 2);
    }
    else {
      id v8 = 0;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__HDDatabaseValueCache__commitTransactionStorage___block_invoke;
    v15[3] = &unk_1E630CF88;
    id v16 = v7;
    uint64_t v17 = v2;
    BOOL v18 = v6;
    id v9 = v7;
    [v8 enumerateKeysAndObjectsUsingBlock:v15];
    os_unfair_lock_unlock(v4);
  }
  id v10 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 16);

  return [v10 removeObjectForKey:v11];
}

uint64_t __65__HDDatabaseValueCache__storageForTransaction_createIfNecessary___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeObjectForKey:*(void *)(*(void *)(a1 + 40) + 16)];
}

void __50__HDDatabaseValueCache__commitTransactionStorage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 isEqual:*(void *)(a1 + 32)])
  {
    [*(id *)(*(void *)(a1 + 40) + 8) removeObjectForKey:v6];
  }
  else if (*(unsigned char *)(a1 + 48))
  {
    [*(id *)(*(void *)(a1 + 40) + 8) setObject:v5 forKeyedSubscript:v6];
  }
}

- (id)diagnosticDescription
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lookupCount = self->_statistics.lookupCount;
  if (lookupCount < 1) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = (int)((double)self->_statistics.faultCount / (double)lookupCount * 100.0);
  }
  id v6 = NSString;
  uint64_t v7 = [(HDDatabaseValueCache *)self name];
  id v8 = [v6 stringWithFormat:@"%@: %lu values, %d%% fault rate (%ld/%ld), %ld resets", v7, -[NSMutableDictionary count](self->_cache, "count"), v5, self->_statistics.faultCount, self->_statistics.lookupCount, self->_statistics.resetCount, 0];

  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_threadLocalKey, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

@end