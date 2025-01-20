@interface HFReaderWriterCache
- (HFReaderWriterCache)init;
- (NSMutableDictionary)cachedObjects;
- (id)objectForKey:(id)a3;
- (id)tryObjectForKey:(id)a3;
- (void)dealloc;
- (void)performBlockWithWriteLock:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 onlyIfNoObjectForKey:(id)a4;
@end

@implementation HFReaderWriterCache

- (void)performBlockWithWriteLock:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *))a3;
  p_rwlock = &self->_rwlock;
  int v6 = pthread_rwlock_wrlock(&self->_rwlock);
  if (v6)
  {
    v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v6 userInfo:0];
    v8 = HFLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      v13 = v7;
      v9 = "Failed to take write lock: %@";
LABEL_7:
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v10 = [(HFReaderWriterCache *)self cachedObjects];
  v4[2](v4, v10);

  int v11 = pthread_rwlock_unlock(p_rwlock);
  if (v11)
  {
    v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v11 userInfo:0];
    v8 = HFLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      v13 = v7;
      v9 = "Failed to unlock write lock: %@";
      goto LABEL_7;
    }
LABEL_8:
  }
}

- (HFReaderWriterCache)init
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)HFReaderWriterCache;
  v2 = [(HFReaderWriterCache *)&v10 init];
  if (v2
    && ([MEMORY[0x263EFF9A0] dictionary],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        cachedObjects = v2->_cachedObjects,
        v2->_cachedObjects = (NSMutableDictionary *)v3,
        cachedObjects,
        (int v5 = pthread_rwlock_init(&v2->_rwlock, 0)) != 0))
  {
    int v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v5 userInfo:0];
    v7 = HFLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v12 = v6;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Failed to init read-write lock: %@", buf, 0xCu);
    }

    v8 = 0;
  }
  else
  {
    v8 = v2;
  }

  return v8;
}

- (id)objectForKey:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_rwlock = &self->_rwlock;
  int v6 = pthread_rwlock_rdlock(&self->_rwlock);
  if (v6)
  {
    v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v6 userInfo:0];
    v8 = HFLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      uint64_t v14 = v7;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Failed to take read lock: %@", (uint8_t *)&v13, 0xCu);
    }
    v9 = 0;
LABEL_5:

    goto LABEL_6;
  }
  int v11 = [(HFReaderWriterCache *)self cachedObjects];
  v9 = [v11 objectForKey:v4];

  int v12 = pthread_rwlock_unlock(p_rwlock);
  if (v12)
  {
    v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v12 userInfo:0];
    v8 = HFLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      uint64_t v14 = v7;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Failed to unlock read lock: %@", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_5;
  }
LABEL_6:

  return v9;
}

- (id)tryObjectForKey:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_rwlock = &self->_rwlock;
  if (pthread_rwlock_tryrdlock(&self->_rwlock))
  {
    int v6 = 0;
  }
  else
  {
    v7 = [(HFReaderWriterCache *)self cachedObjects];
    int v6 = [v7 objectForKey:v4];

    int v8 = pthread_rwlock_unlock(p_rwlock);
    if (v8)
    {
      v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v8 userInfo:0];
      objc_super v10 = HFLogForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        int v13 = v9;
        _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "Failed to unlock read lock: %@", (uint8_t *)&v12, 0xCu);
      }
    }
  }

  return v6;
}

- (NSMutableDictionary)cachedObjects
{
  return self->_cachedObjects;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = pthread_rwlock_destroy(&self->_rwlock);
  if (v3)
  {
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v3 userInfo:0];
    int v5 = HFLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v8 = v4;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Failed to destroy read-write lock: %@", buf, 0xCu);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)HFReaderWriterCache;
  [(HFReaderWriterCache *)&v6 dealloc];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__HFReaderWriterCache_setObject_forKey___block_invoke;
  v10[3] = &unk_26408D9B8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(HFReaderWriterCache *)self performBlockWithWriteLock:v10];
}

uint64_t __40__HFReaderWriterCache_setObject_forKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
}

- (void)setObject:(id)a3 onlyIfNoObjectForKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__HFReaderWriterCache_setObject_onlyIfNoObjectForKey___block_invoke;
  v10[3] = &unk_26408D9B8;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(HFReaderWriterCache *)self performBlockWithWriteLock:v10];
}

void __54__HFReaderWriterCache_setObject_onlyIfNoObjectForKey___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  int v3 = [v4 objectForKey:*(void *)(a1 + 32)];

  if (!v3) {
    [v4 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  }
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__HFReaderWriterCache_removeObjectForKey___block_invoke;
  v6[3] = &unk_26408D9E0;
  id v7 = v4;
  id v5 = v4;
  [(HFReaderWriterCache *)self performBlockWithWriteLock:v6];
}

uint64_t __42__HFReaderWriterCache_removeObjectForKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObjectForKey:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
}

@end