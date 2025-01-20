@interface EFLazyCache
- (EFLazyCache)init;
- (EFLazyCache)initWithCountLimit:(unint64_t)a3;
- (EFLazyCacheDelegate)delegate;
- (id)cachedObjectForKey:(id)a3;
- (id)objectForKey:(id)a3 generator:(id)a4;
- (id)storedObjectForKey:(id)a3;
- (int64_t)waiterCountForKey:(id)a3;
- (void)_exchangeOriginalObject:(id)a3 forKey:(id)a4 withObject:(id)a5;
- (void)cache:(id)a3 willEvictObject:(id)a4;
- (void)dealloc;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation EFLazyCache

- (void)_exchangeOriginalObject:(id)a3 forKey:(id)a4 withObject:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  [(NSRecursiveLock *)self->_lock lock];
  id v10 = [(NSCache *)self->_storage objectForKey:v8];
  if (v10 == v12)
  {
    storage = self->_storage;
    if (v9) {
      [(NSCache *)storage setObject:v9 forKey:v8];
    }
    else {
      [(NSCache *)storage removeObjectForKey:v8];
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (id)objectForKey:(id)a3 generator:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  while (1)
  {
    [(NSRecursiveLock *)self->_lock lock];
    id v8 = [(NSCache *)self->_storage objectForKey:v6];
    if (v8)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v10 = v8;
      id v11 = (isKindOfClass & 1) != 0 ? 0 : v10;
      id v12 = (isKindOfClass & 1) != 0 ? (_EFLazyCacheConditionLock *)v10 : 0;
    }
    else
    {
      id v12 = [[_EFLazyCacheConditionLock alloc] initWithCondition:0];
      [(NSCache *)self->_storage setObject:v12 forKey:v6];
      id v11 = 0;
    }

    [(NSRecursiveLock *)self->_lock unlock];
    if (v11) {
      break;
    }
    if ([(NSConditionLock *)v12 tryLockWhenCondition:0])
    {
      v7[2](v7);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      [(EFLazyCache *)self _exchangeOriginalObject:v12 forKey:v6 withObject:v11];
      [(NSConditionLock *)v12 unlockWithCondition:1];
      break;
    }
    [(_EFLazyCacheConditionLock *)v12 incrementWaiterCount];
    [(NSConditionLock *)v12 lockWhenCondition:1];
    [(NSConditionLock *)v12 unlock];
    [(_EFLazyCacheConditionLock *)v12 decrementWaiterCount];
  }
  return v11;
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v8 = (NSCache *)a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (self->_storage == v8 && (*(unsigned char *)&self->_flags & 1) != 0) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    }
    else {
      id WeakRetained = 0;
    }
    [WeakRetained lazyCache:self willEvictObject:v6];
  }
}

- (EFLazyCache)init
{
  return [(EFLazyCache *)self initWithCountLimit:20];
}

- (void)removeAllObjects
{
  [(NSRecursiveLock *)self->_lock lock];
  [(NSCache *)self->_storage removeAllObjects];
  lock = self->_lock;
  [(NSRecursiveLock *)lock unlock];
}

- (void)dealloc
{
  [(NSCache *)self->_storage setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)EFLazyCache;
  [(EFLazyCache *)&v3 dealloc];
}

- (EFLazyCache)initWithCountLimit:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)EFLazyCache;
  v4 = [(EFLazyCache *)&v10 init];
  if (v4)
  {
    v5 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    lock = v4->_lock;
    v4->_lock = v5;

    v7 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    storage = v4->_storage;
    v4->_storage = v7;

    [(NSCache *)v4->_storage setCountLimit:a3];
    [(NSCache *)v4->_storage setDelegate:v4];
  }
  return v4;
}

- (id)cachedObjectForKey:(id)a3
{
  objc_super v3 = [(EFLazyCache *)self storedObjectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = 0;
  }
  else {
    v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (id)storedObjectForKey:(id)a3
{
  id v4 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = [(NSCache *)self->_storage objectForKey:v4];
  [(NSRecursiveLock *)self->_lock unlock];

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | objc_opt_respondsToSelector() & 1;
    id v5 = obj;
  }
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  [(NSCache *)self->_storage removeObjectForKey:v4];
  [(NSRecursiveLock *)self->_lock unlock];
}

- (EFLazyCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (EFLazyCacheDelegate *)WeakRetained;
}

- (int64_t)waiterCountForKey:(id)a3
{
  objc_super v3 = [(EFLazyCache *)self storedObjectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v4 = [v3 waiterCount];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

@end