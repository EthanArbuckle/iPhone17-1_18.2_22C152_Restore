@interface CSReusableBufferPool
- (BOOL)_canCreateNewBackingStore;
- (CSReusableBufferPool)initWithConfiguration:(id)a3;
- (CSReusableBufferPoolConfiguration)configuration;
- (id)_createNewBackingStore;
- (id)_getAvailableBackingStore;
- (id)dataWithBytes:(const void *)a3 length:(unint64_t)a4;
- (void)_checkIdleBackingStores;
- (void)_recycleUsedBackingStore:(id)a3;
- (void)cleanup;
- (void)handleUsedBackingStore:(id)a3;
@end

@implementation CSReusableBufferPool

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_recycledBackingStores, 0);
}

- (CSReusableBufferPoolConfiguration)configuration
{
  return self->_configuration;
}

- (void)_checkIdleBackingStores
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t numberOfBackingStores = self->_numberOfBackingStores;
  if (numberOfBackingStores > [(CSReusableBufferPoolConfiguration *)self->_configuration minimalNumberOfBackingStores])
  {
    [(CSReusableBufferPoolConfiguration *)self->_configuration backingStoreIdleTimeout];
    if (v4 != 0.0)
    {
      double v5 = v4;
      if ([(NSMutableArray *)self->_recycledBackingStores count])
      {
        uint64_t v6 = mach_absolute_time();
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        v7 = self->_recycledBackingStores;
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = 0;
          uint64_t v11 = *(void *)v17;
          while (2)
          {
            uint64_t v12 = 0;
            uint64_t v15 = v10 + v9;
            do
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v7);
              }
              uint64_t v13 = [*(id *)(*((void *)&v16 + 1) + 8 * v12) recycleHostTime];
              if (_CSMachAbsoluteTimeRate_onceToken != -1) {
                dispatch_once(&_CSMachAbsoluteTimeRate_onceToken, &__block_literal_global_407);
              }
              if (*(double *)&_CSMachAbsoluteTimeRate_rate * (double)(v6 - v13) / 1000000000.0 <= v5)
              {
                uint64_t v14 = v10 + v12;
                goto LABEL_17;
              }
              ++v12;
            }
            while (v9 != v12);
            uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
            uint64_t v14 = v15;
            uint64_t v10 = v15;
            if (v9) {
              continue;
            }
            break;
          }
LABEL_17:

          if (v14) {
            -[NSMutableArray removeObjectsInRange:](self->_recycledBackingStores, "removeObjectsInRange:", 0, v14);
          }
        }
        else
        {
        }
      }
    }
  }
}

- (void)_recycleUsedBackingStore:(id)a3
{
  id v4 = a3;
  [v4 setRecycleHostTime:mach_absolute_time()];
  [(NSMutableArray *)self->_recycledBackingStores addObject:v4];
}

- (BOOL)_canCreateNewBackingStore
{
  unint64_t v3 = [(CSReusableBufferPoolConfiguration *)self->_configuration maximumNumberOfBackingStores];
  return !v3 || self->_numberOfBackingStores < v3;
}

- (id)_createNewBackingStore
{
  if ([(CSReusableBufferPool *)self _canCreateNewBackingStore])
  {
    unint64_t v3 = [[CSReusablePrivateMemoryBackingStore alloc] initWithBufferSize:[(CSReusableBufferPoolConfiguration *)self->_configuration backingStoreCapacity]];
    ++self->_numberOfBackingStores;
  }
  else
  {
    unint64_t v3 = 0;
  }
  return v3;
}

- (id)_getAvailableBackingStore
{
  unint64_t v3 = [(NSMutableArray *)self->_recycledBackingStores lastObject];
  if (v3) {
    [(NSMutableArray *)self->_recycledBackingStores removeLastObject];
  }
  return v3;
}

- (void)handleUsedBackingStore:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(CSReusableBufferPool *)self _recycleUsedBackingStore:v5];

  [(CSReusableBufferPool *)self _checkIdleBackingStores];
  os_unfair_lock_unlock(p_lock);
}

- (void)cleanup
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(CSReusableBufferPool *)self _checkIdleBackingStores];
  os_unfair_lock_unlock(p_lock);
}

- (id)dataWithBytes:(const void *)a3 length:(unint64_t)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v8 = [(CSReusableBufferPool *)self _getAvailableBackingStore];
  if (v8)
  {
    id v9 = (id)v8;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    id v9 = [(CSReusableBufferPool *)self _createNewBackingStore];
    os_unfair_lock_unlock(p_lock);
    if (!v9) {
      goto LABEL_6;
    }
  }
  if ([v9 configureWithBytes:a3 length:a4])
  {
    objc_initWeak(&location, self);
    id v10 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    id v11 = v9;
    uint64_t v12 = [v11 bytes];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __45__CSReusableBufferPool_dataWithBytes_length___block_invoke;
    v15[3] = &unk_1E6200DB0;
    objc_copyWeak(&v17, &location);
    id v9 = v11;
    id v16 = v9;
    uint64_t v13 = (void *)[v10 initWithBytesNoCopy:v12 length:a4 deallocator:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    goto LABEL_7;
  }
LABEL_6:
  uint64_t v13 = 0;
LABEL_7:

  return v13;
}

void __45__CSReusableBufferPool_dataWithBytes_length___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleUsedBackingStore:*(void *)(a1 + 32)];
}

- (CSReusableBufferPool)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSReusableBufferPool;
  uint64_t v6 = [(CSReusableBufferPool *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    recycledBackingStores = v7->_recycledBackingStores;
    v7->_recycledBackingStores = v8;
  }
  return v7;
}

@end