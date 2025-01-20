@interface MFMessageStoreObjectCache
- (MFMessageStoreObjectCache)initWithCapacity:(unint64_t)a3;
- (id)addObject:(id)a3 forMessage:(id)a4 kind:(int64_t)a5;
- (id)comparator;
- (id)debugDescription;
- (id)description;
- (id)keyGenerator;
- (id)objectForMessage:(id)a3 kind:(int64_t)a4;
- (void)_nts_evictObject;
- (void)_nts_setObject:(id)a3 forKey:(id)a4;
- (void)flush;
- (void)removeAllObjectsForMessage:(id)a3;
- (void)removeObjectForMessage:(id)a3 kind:(int64_t)a4;
- (void)setComparator:(id)a3;
- (void)setKeyGenerator:(id)a3;
- (void)setObject:(id)a3 forMessage:(id)a4 kind:(int64_t)a5;
@end

@implementation MFMessageStoreObjectCache

- (id)addObject:(id)a3 forMessage:(id)a4 kind:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  [(NSLock *)self->_lock lock];
  uint64_t v9 = (*((uint64_t (**)(void))self->_keyGenerator + 2))();
  cache = self->_cache;
  v11 = [NSNumber numberWithUnsignedInteger:v9];
  id v12 = [(NSMutableDictionary *)cache objectForKeyedSubscript:v11];

  if (v7 && v12)
  {
    comparator = (uint64_t (**)(id, id, id))self->_comparator;
    if (!comparator || comparator[2](comparator, v12, v7) != -1) {
      goto LABEL_9;
    }
    v14 = self->_cache;
    v15 = [NSNumber numberWithUnsignedInteger:v9];
    [(NSMutableDictionary *)v14 removeObjectForKey:v15];

    id v12 = 0;
  }
  if (v7 && !v12)
  {
    v16 = [NSNumber numberWithUnsignedInteger:v9];
    [(MFMessageStoreObjectCache *)self _nts_setObject:v7 forKey:v16];

    id v12 = v7;
  }
LABEL_9:
  [(NSLock *)self->_lock unlock];

  return v12;
}

- (void)_nts_setObject:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  unint64_t capacity = self->_capacity;
  if (capacity <= [(NSMutableDictionary *)self->_cache count]) {
    [(MFMessageStoreObjectCache *)self _nts_evictObject];
  }
  [(NSMutableDictionary *)self->_cache setObject:v8 forKey:v6];
}

- (void)_nts_evictObject
{
  if (_nts_evictObject_onceToken != -1) {
    dispatch_once(&_nts_evictObject_onceToken, &__block_literal_global_3);
  }
  unint64_t v3 = [(NSMutableDictionary *)self->_cache count];
  unint64_t v4 = arc4random() % v3;
  v5 = [(NSMutableDictionary *)self->_cache allKeys];
  cache = self->_cache;
  id v8 = v5;
  id v7 = [v5 objectAtIndexedSubscript:v4];
  [(NSMutableDictionary *)cache removeObjectForKey:v7];
}

- (void)setKeyGenerator:(id)a3
{
}

- (void)setComparator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong(&self->_keyGenerator, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (MFMessageStoreObjectCache)initWithCapacity:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MFMessageStoreObjectCache;
  unint64_t v4 = [(MFMessageStoreObjectCache *)&v11 init];
  if (v4)
  {
    v5 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v4->_lock;
    v4->_lock = v5;

    v4->_unint64_t capacity = 4 * a3;
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v4->_capacity];
    cache = v4->_cache;
    v4->_cache = (NSMutableDictionary *)v7;

    uint64_t v9 = v4;
  }

  return v4;
}

- (id)description
{
  [(NSLock *)self->_lock lock];
  unint64_t v3 = [(MFMessageStoreObjectCache *)self debugDescription];
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (id)debugDescription
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableDictionary *)self->_cache count];
  v18 = self;
  v19 = [(NSMutableDictionary *)self->_cache allValues];
  v20 = [MEMORY[0x1E4F28BD0] set];
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      v5 = [v19 objectAtIndexedSubscript:i];
      [v20 addObject:v5];
    }
  }
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v20, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v20;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v8; ++j)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_super v11 = [NSString stringWithFormat:@"%@ [%lu]", *(void *)(*((void *)&v21 + 1) + 8 * j), objc_msgSend(v7, "countForObject:", *(void *)(*((void *)&v21 + 1) + 8 * j))];
        [v6 addObject:v11];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  id v12 = NSString;
  uint64_t v13 = objc_opt_class();
  unint64_t capacity = v18->_capacity;
  v15 = [v6 componentsJoinedByString:@", "];
  v16 = [v12 stringWithFormat:@"<%@: %p> capacity %lu, size %lu, distribution (%@)", v13, v18, capacity, v3, v15];

  return v16;
}

- (void)setObject:(id)a3 forMessage:(id)a4 kind:(int64_t)a5
{
  id v9 = a3;
  id v7 = a4;
  [(NSLock *)self->_lock lock];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:(*((uint64_t (**)(void))self->_keyGenerator + 2))()];
  [(MFMessageStoreObjectCache *)self _nts_setObject:v9 forKey:v8];

  [(NSLock *)self->_lock unlock];
}

- (void)removeObjectForMessage:(id)a3 kind:(int64_t)a4
{
  id v8 = a3;
  [(NSLock *)self->_lock lock];
  uint64_t v5 = (*((uint64_t (**)(void))self->_keyGenerator + 2))();
  cache = self->_cache;
  id v7 = [NSNumber numberWithUnsignedInteger:v5];
  [(NSMutableDictionary *)cache removeObjectForKey:v7];

  [(NSLock *)self->_lock unlock];
}

- (void)removeAllObjectsForMessage:(id)a3
{
  id v8 = a3;
  [(NSLock *)self->_lock lock];
  for (uint64_t i = 0; i != 32; i += 8)
  {
    uint64_t v5 = (*((uint64_t (**)(void))self->_keyGenerator + 2))();
    cache = self->_cache;
    id v7 = [NSNumber numberWithUnsignedInteger:v5];
    [(NSMutableDictionary *)cache removeObjectForKey:v7];
  }
  [(NSLock *)self->_lock unlock];
}

- (id)objectForMessage:(id)a3 kind:(int64_t)a4
{
  id v5 = a3;
  [(NSLock *)self->_lock lock];
  uint64_t v6 = (*((uint64_t (**)(void))self->_keyGenerator + 2))();
  cache = self->_cache;
  id v8 = [NSNumber numberWithUnsignedInteger:v6];
  id v9 = [(NSMutableDictionary *)cache objectForKeyedSubscript:v8];

  [(NSLock *)self->_lock unlock];
  return v9;
}

- (void)flush
{
  [(NSLock *)self->_lock lock];
  [(NSMutableDictionary *)self->_cache removeAllObjects];
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (id)keyGenerator
{
  return self->_keyGenerator;
}

- (id)comparator
{
  return self->_comparator;
}

@end