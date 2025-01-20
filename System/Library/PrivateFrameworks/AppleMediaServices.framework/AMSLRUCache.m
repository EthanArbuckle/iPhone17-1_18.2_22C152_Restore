@interface AMSLRUCache
- (AMSDoubleLinkedList)backingList;
- (AMSLRUCache)init;
- (AMSLRUCache)initWithMaxSize:(unint64_t)a3;
- (NSMutableDictionary)backingDictionary;
- (id)allObjectsAndKeys;
- (id)description;
- (id)objectForKey:(id)a3;
- (id)objectForKey:(id)a3 canLogCacheMisses:(BOOL)a4;
- (id)objectForKey:(id)a3 withCreationBlock:(id)a4;
- (unint64_t)_count;
- (unint64_t)count;
- (unint64_t)maxSize;
- (void)_addObject:(id)a3 forKey:(id)a4;
- (void)_removeObjectForKey:(id)a3;
- (void)performExclusively:(id)a3;
- (void)removeAllObjects;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation AMSLRUCache

- (id)objectForKey:(id)a3 canLogCacheMisses:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  v7 = [(AMSLRUCache *)self backingDictionary];
  v8 = [v7 objectForKey:v6];

  if (v8)
  {
    v9 = [(AMSLRUCache *)self backingList];
    [v9 removeNode:v8];

    v10 = [(AMSLRUCache *)self backingList];
    [v10 insertNode:v8];
  }
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v11 = [v8 object];
  v12 = (void *)v11;
  if (v4 && !v11)
  {
    v13 = +[AMSLogConfig sharedConfig];
    if (!v13)
    {
      v13 = +[AMSLogConfig sharedConfig];
    }
    v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v18 = 138412546;
      *(void *)&v18[4] = objc_opt_class();
      *(_WORD *)&v18[12] = 2112;
      *(void *)&v18[14] = v6;
      id v15 = *(id *)&v18[4];
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEBUG, "%@: %@ resulted in a cache miss.", v18, 0x16u);
    }
  }
  v16 = objc_msgSend(v12, "object", *(_OWORD *)v18, *(void *)&v18[16], v19);

  return v16;
}

- (AMSDoubleLinkedList)backingList
{
  return self->_backingList;
}

- (NSMutableDictionary)backingDictionary
{
  return self->_backingDictionary;
}

- (id)objectForKey:(id)a3
{
  return [(AMSLRUCache *)self objectForKey:a3 canLogCacheMisses:1];
}

- (id)objectForKey:(id)a3 withCreationBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = [(AMSLRUCache *)self backingDictionary];
  v10 = [v9 objectForKey:v6];

  if (!v10)
  {
    uint64_t v11 = v7[2](v7, v6);
    [(AMSLRUCache *)self _addObject:v11 forKey:v6];

    v12 = [(AMSLRUCache *)self backingDictionary];
    v10 = [v12 objectForKey:v6];
  }
  v13 = [(AMSLRUCache *)self backingList];
  [v13 removeNode:v10];

  v14 = [(AMSLRUCache *)self backingList];
  [v14 insertNode:v10];

  os_unfair_lock_unlock(p_lock);
  id v15 = [v10 object];
  v16 = [v15 object];

  return v16;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  if (v7) {
    [(AMSLRUCache *)self _addObject:v7 forKey:v6];
  }
  else {
    [(AMSLRUCache *)self _removeObjectForKey:v6];
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_addObject:(id)a3 forKey:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v7)
  {
    v8 = [(AMSLRUCache *)self backingDictionary];
    v9 = [v8 objectForKey:v7];

    if (v9)
    {
      v10 = [(AMSLRUCache *)self backingList];
      [v10 removeNode:v9];
    }
    uint64_t v11 = [[AMSLRUCacheItem alloc] initWithKey:v7 object:v6];
    v12 = [(AMSLRUCache *)self backingList];
    v13 = [v12 insertObject:v11];

    v14 = [(AMSLRUCache *)self backingDictionary];
    [v14 setObject:v13 forKey:v7];

    unint64_t v15 = [(AMSLRUCache *)self _count];
    if (v15 > [(AMSLRUCache *)self maxSize])
    {
      v16 = +[AMSLogConfig sharedConfig];
      if (!v16)
      {
        v16 = +[AMSLogConfig sharedConfig];
      }
      v17 = [v16 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        int v23 = 138412290;
        id v24 = (id)objc_opt_class();
        id v18 = v24;
        _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEBUG, "%@: Cache is full. The oldest object will be evicted.", (uint8_t *)&v23, 0xCu);
      }
      uint64_t v19 = [(AMSLRUCache *)self backingList];
      v20 = [v19 tail];

      v21 = [v20 object];
      v22 = [v21 key];
      [(AMSLRUCache *)self _removeObjectForKey:v22];
    }
  }
}

- (unint64_t)maxSize
{
  return self->_maxSize;
}

- (unint64_t)_count
{
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = [(AMSLRUCache *)self backingDictionary];
  unint64_t v4 = [v3 count];

  return v4;
}

- (void)_removeObjectForKey:(id)a3
{
  id v8 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  unint64_t v4 = [(AMSLRUCache *)self backingDictionary];
  v5 = [v4 objectForKey:v8];

  if (v5)
  {
    id v6 = [(AMSLRUCache *)self backingList];
    [v6 removeNode:v5];

    id v7 = [(AMSLRUCache *)self backingDictionary];
    [v7 removeObjectForKey:v8];
  }
}

- (AMSLRUCache)initWithMaxSize:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AMSLRUCache;
  unint64_t v4 = [(AMSLRUCache *)&v10 init];
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    backingDictionary = v4->_backingDictionary;
    v4->_backingDictionary = v5;

    id v7 = objc_alloc_init(AMSDoubleLinkedList);
    backingList = v4->_backingList;
    v4->_backingList = v7;

    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_maxSize = a3;
  }
  return v4;
}

- (AMSLRUCache)init
{
  return [(AMSLRUCache *)self initWithMaxSize:5];
}

- (unint64_t)count
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [(AMSLRUCache *)self _count];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)allObjectsAndKeys
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = [(AMSLRUCache *)self backingDictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__AMSLRUCache_allObjectsAndKeys__block_invoke;
  v8[3] = &unk_1E55A38C0;
  id v6 = v3;
  id v9 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

void __32__AMSLRUCache_allObjectsAndKeys__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [v5 object];
  id v7 = [v6 object];

  if (v7)
  {
    id v8 = [v5 object];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v9];
  }
}

- (void)removeAllObjects
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [(AMSLRUCache *)self backingDictionary];
  [v4 removeAllObjects];

  id v5 = [(AMSLRUCache *)self backingList];
  [v5 removeAllNodes];

  os_unfair_lock_unlock(p_lock);
}

- (id)description
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v21.receiver = self;
  v21.super_class = (Class)AMSLRUCache;
  unint64_t v4 = [(AMSLRUCache *)&v21 description];
  [v3 appendString:v4];

  [v3 appendString:@" {"];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(AMSLRUCache *)self backingList];
  id v7 = [v6 allNodes];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v17 + 1) + 8 * i) object];
        v13 = v12;
        if (v12)
        {
          v14 = [v12 key];
          unint64_t v15 = [v13 object];
          [v3 appendFormat:@"\n%@: %@,", v14, v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_lock);
  [v3 appendString:@"\n}"];
  return v3;
}

- (void)performExclusively:(id)a3
{
  p_lock = &self->_lock;
  unint64_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingList, 0);
  objc_storeStrong((id *)&self->_backingDictionary, 0);
}

@end