@interface HMCache
+ (id)shortDescription;
- (HMCache)initWithCachedObjects:(id)a3 name:(id)a4;
- (HMCacheDelegate)delegate;
- (NSDictionary)cachedObjects;
- (NSString)cacheName;
- (id)dataForKey:(id)a3;
- (id)numberForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (void)_setData:(id)a3 forKey:(id)a4;
- (void)removeObjectForKey:(id)a3;
- (void)setData:(id)a3 forKey:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setNumber:(id)a3 forKey:(id)a4;
- (void)setString:(id)a3 forKey:(id)a4;
@end

@implementation HMCache

- (id)dataForKey:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  v5 = [(NSMutableDictionary *)self->_cachedItems objectForKeyedSubscript:v4];
  v6 = v5;
  if (v5 && [v5 isExpired])
  {
    [(NSMutableDictionary *)self->_cachedItems setObject:0 forKeyedSubscript:v4];

    os_unfair_lock_unlock(&self->_lock);
    v7 = [(HMCache *)self delegate];
    [v7 cacheDidUpdate:self];

    v6 = 0;
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  v8 = [v6 data];

  return v8;
}

- (void)setData:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (!v8)
  {
    id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Data cannot be nil" userInfo:0];
    objc_exception_throw(v7);
  }
  [(HMCache *)self _setData:v8 forKey:v6];
}

- (id)numberForKey:(id)a3
{
  v3 = [(HMCache *)self dataForKey:a3];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_setData:(id)a3 forKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    id v7 = [HMCacheEntry alloc];
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    v9 = [(HMCacheEntry *)v7 initWithData:v11 lastModificationDate:v8];

    os_unfair_lock_lock_with_options();
    [(NSMutableDictionary *)self->_cachedItems setObject:v9 forKeyedSubscript:v6];
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    os_unfair_lock_lock_with_options();
    [(NSMutableDictionary *)self->_cachedItems setObject:0 forKeyedSubscript:v6];
    os_unfair_lock_unlock(&self->_lock);
  }
  v10 = [(HMCache *)self delegate];
  [v10 cacheDidUpdate:self];
}

- (HMCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMCacheDelegate *)WeakRetained;
}

- (NSString)cacheName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMCache)initWithCachedObjects:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMCache;
  id v8 = [(HMCache *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    uint64_t v10 = [v6 mutableCopy];
    cachedItems = v9->_cachedItems;
    v9->_cachedItems = (NSMutableDictionary *)v10;

    objc_storeStrong((id *)&v9->_cacheName, a4);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheName, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_cachedItems, 0);
}

- (void)setString:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:0];
  if (!v7)
  {
    id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"String cannot be nil" userInfo:0];
    objc_exception_throw(v9);
  }
  id v8 = (void *)v7;
  [(HMCache *)self setData:v7 forKey:v6];
}

- (id)stringForKey:(id)a3
{
  v3 = [(HMCache *)self dataForKey:a3];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)setNumber:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:0];
  if (!v7)
  {
    id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Number cannot be nil" userInfo:0];
    objc_exception_throw(v9);
  }
  id v8 = (void *)v7;
  [(HMCache *)self setData:v7 forKey:v6];
}

- (NSDictionary)cachedObjects
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_cachedItems, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = (void *)[(NSMutableDictionary *)self->_cachedItems copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedItems, "objectForKeyedSubscript:", v8, lock);
        int v10 = [v9 isExpired];

        cachedItems = self->_cachedItems;
        if (v10)
        {
          [(NSMutableDictionary *)cachedItems setObject:0 forKeyedSubscript:v8];
          char v5 = 1;
        }
        else
        {
          v12 = [(NSMutableDictionary *)cachedItems objectForKeyedSubscript:v8];
          [v17 setObject:v12 forKeyedSubscript:v8];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);

    os_unfair_lock_unlock(lock);
    if (v5)
    {
      objc_super v13 = [(HMCache *)self delegate];
      [v13 cacheDidUpdate:self];
    }
  }
  else
  {

    os_unfair_lock_unlock(lock);
  }
  v14 = objc_msgSend(v17, "copy", lock);

  return (NSDictionary *)v14;
}

- (void)removeObjectForKey:(id)a3
{
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end