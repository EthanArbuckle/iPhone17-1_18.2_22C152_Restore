@interface BMCache
+ (id)strongCache;
+ (id)strongCacheWithFallbackCache:(id)a3;
+ (id)weakCache;
- (id)_initWithMapTable:(id)a3 fallback:(id)a4;
- (id)cachedObjectWithKey:(id)a3;
- (id)cachedObjectWithKey:(id)a3 missHandler:(id)a4;
- (id)isExpiredBlock;
- (void)pruneCacheWithBlock:(id)a3 completion:(id)a4;
- (void)removeCachedObjectForKey:(id)a3;
- (void)removeCachedObjectForKey:(id)a3 performWhileLocked:(id)a4;
- (void)setIsExpiredBlock:(id)a3;
@end

@implementation BMCache

- (id)cachedObjectWithKey:(id)a3 missHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = [(NSMapTable *)self->_mapTable objectForKey:v6];
  if (v9)
  {
    uint64_t v10 = [(BMCache *)self isExpiredBlock];
    v11 = (void *)v10;
    if (!v10 || !(*(unsigned int (**)(uint64_t, void *))(v10 + 16))(v10, v9))
    {
      id v14 = v9;

      goto LABEL_14;
    }
    [(NSMapTable *)self->_mapTable removeObjectForKey:v6];
  }
  fallback = self->_fallback;
  if (fallback)
  {
    v13 = [(BMCache *)fallback cachedObjectWithKey:v6 missHandler:v7];
    goto LABEL_10;
  }
  if (v7)
  {
    v15 = (void *)MEMORY[0x1B3EB5880]();
    v13 = v7[2](v7);
LABEL_10:
    if (v13)
    {
      mapTable = self->_mapTable;
      v17 = (void *)[v6 copyWithZone:0];
      [(NSMapTable *)mapTable setObject:v13 forKey:v17];
    }
    goto LABEL_13;
  }
  v13 = 0;
LABEL_13:
  id v14 = v13;
LABEL_14:

  os_unfair_lock_unlock(p_lock);
  return v14;
}

- (id)isExpiredBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_isExpiredBlock, 0);
  objc_storeStrong((id *)&self->_fallback, 0);
  objc_storeStrong((id *)&self->_mapTable, 0);
}

+ (id)weakCache
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  v4 = (void *)[v2 _initWithMapTable:v3 fallback:0];

  return v4;
}

- (void)setIsExpiredBlock:(id)a3
{
}

+ (id)strongCacheWithFallbackCache:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v7 = (void *)[v5 _initWithMapTable:v6 fallback:v4];

  return v7;
}

- (id)_initWithMapTable:(id)a3 fallback:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMCache;
  v9 = [(BMCache *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_mapTable, a3);
    objc_storeStrong(p_isa + 3, a4);
  }

  return p_isa;
}

+ (id)strongCache
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v4 = (void *)[v2 _initWithMapTable:v3 fallback:0];

  return v4;
}

- (id)cachedObjectWithKey:(id)a3
{
  return [(BMCache *)self cachedObjectWithKey:a3 missHandler:0];
}

- (void)removeCachedObjectForKey:(id)a3
{
}

- (void)removeCachedObjectForKey:(id)a3 performWhileLocked:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(void))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v8 = [(NSMapTable *)self->_mapTable removeObjectForKey:v10];
  if (v6)
  {
    v9 = (void *)MEMORY[0x1B3EB5880](v8);
    v6[2](v6);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)pruneCacheWithBlock:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = (unsigned int (**)(id, uint64_t, void *, char *))a3;
  id v26 = a4;
  if (!v7)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"BMCache.m", 101, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v8 = MEMORY[0x1B3EB5880]();
  char v35 = 0;
  v9 = objc_opt_new();
  context = (void *)v8;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = self->_mapTable;
  uint64_t v11 = [(NSMapTable *)v10 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v32;
LABEL_5:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v32 != v12) {
        objc_enumerationMutation(v10);
      }
      uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * v13);
      v15 = [(NSMapTable *)self->_mapTable objectForKey:v14];
      if (!v15 || v7[2](v7, v14, v15, &v35)) {
        [v9 addObject:v14];
      }
      BOOL v16 = v35 == 0;

      if (!v16) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSMapTable *)v10 countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v11) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = v9;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v17);
        }
        [(NSMapTable *)self->_mapTable removeObjectForKey:*(void *)(*((void *)&v27 + 1) + 8 * i)];
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v18);
  }

  v21 = v26;
  if (v26)
  {
    v22 = (void *)MEMORY[0x1B3EB5880]();
    v21 = v26;
    (*((void (**)(id))v26 + 2))(v26);
  }
  os_unfair_lock_unlock(lock);
}

@end