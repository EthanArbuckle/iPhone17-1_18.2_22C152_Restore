@interface FBSApplicationDataStoreMonitor
- (BOOL)_hasObserver:(id)a3;
- (FBSApplicationDataStoreMonitor)init;
- (FBSApplicationDataStoreMonitor)initWithClient:(id)a3;
- (void)addObserver:(id)a3;
- (void)applicationDataStoreRepositoryClient:(id)a3 application:(id)a4 changedObject:(id)a5 forKey:(id)a6;
- (void)applicationDataStoreRepositoryClient:(id)a3 storeInvalidatedForApplication:(id)a4;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation FBSApplicationDataStoreMonitor

- (FBSApplicationDataStoreMonitor)init
{
  return [(FBSApplicationDataStoreMonitor *)self initWithClient:0];
}

- (FBSApplicationDataStoreMonitor)initWithClient:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FBSApplicationDataStoreMonitor;
  v5 = [(FBSApplicationDataStoreMonitor *)&v15 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    if (v4)
    {
      v7 = (FBSApplicationDataStoreRepositoryClient *)v4;
      char v8 = 0;
      client = v6->_client;
      v6->_client = v7;
    }
    else
    {
      client = +[FBSApplicationDataStoreClientFactory sharedInstance];
      uint64_t v10 = [client checkout];
      v11 = v6->_client;
      v6->_client = (FBSApplicationDataStoreRepositoryClient *)v10;

      char v8 = 1;
    }

    v6->_clientNeedsCheckin = v8;
    [(FBSApplicationDataStoreRepositoryClient *)v6->_client addObserver:v6];
    uint64_t v12 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    lock_observers = v6->_lock_observers;
    v6->_lock_observers = (NSHashTable *)v12;
  }
  return v6;
}

- (void)dealloc
{
  [(FBSApplicationDataStoreRepositoryClient *)self->_client removeObserver:self];
  if (self->_clientNeedsCheckin)
  {
    v3 = +[FBSApplicationDataStoreClientFactory sharedInstance];
    [v3 checkin];
  }
  v4.receiver = self;
  v4.super_class = (Class)FBSApplicationDataStoreMonitor;
  [(FBSApplicationDataStoreMonitor *)&v4 dealloc];
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_hasObserver:(id)a3
{
  v3 = self;
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  LOBYTE(v3) = [(NSHashTable *)v3->_lock_observers containsObject:v5];

  os_unfair_lock_unlock(p_lock);
  return (char)v3;
}

- (void)applicationDataStoreRepositoryClient:(id)a3 application:(id)a4 changedObject:(id)a5 forKey:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a6;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v10 = [(NSHashTable *)self->_lock_observers allObjects];
  os_unfair_lock_unlock(&self->_lock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          [v16 dataStoreMonitor:self didUpdateApplication:v8 forKey:v9];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (void)applicationDataStoreRepositoryClient:(id)a3 storeInvalidatedForApplication:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(NSHashTable *)self->_lock_observers allObjects];
  os_unfair_lock_unlock(&self->_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 dataStoreMonitor:self didInvalidateApplication:v5];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observers, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end