@interface BBObjectCache
- (BBObjectCache)init;
- (id)cacheObject:(id)a3;
@end

@implementation BBObjectCache

- (BBObjectCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)BBObjectCache;
  v2 = [(BBObjectCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] hashTableWithOptions:5];
    cache = v2->_cache;
    v2->_cache = (NSHashTable *)v3;
  }
  return v2;
}

- (id)cacheObject:(id)a3
{
  id v4 = a3;
  v5 = self->_cache;
  objc_sync_enter(v5);
  objc_super v6 = [(NSHashTable *)self->_cache member:v4];
  objc_initWeak(&location, v6);

  id v7 = objc_loadWeakRetained(&location);
  if (!v7)
  {
    [(NSHashTable *)self->_cache removeObject:v4];
    [(NSHashTable *)self->_cache addObject:v4];
    id v7 = v4;
  }
  objc_destroyWeak(&location);
  objc_sync_exit(v5);

  return v7;
}

- (void).cxx_destruct
{
}

@end