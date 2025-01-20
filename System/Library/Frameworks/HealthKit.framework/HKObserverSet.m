@interface HKObserverSet
- (HKObserverSet)initWithName:(id)a3 loggingCategory:(id)a4;
- (NSArray)allObservers;
- (unint64_t)count;
- (void)_notifyObserver:(NSObject *)a3 queue:(void *)a4 handler:;
- (void)_notifyObserversInGroup:(void *)a3 handler:;
- (void)_registerObserver:(void *)a3 queue:(void *)a4 runIfFirstObserver:;
- (void)_unregisterObserver:(void *)a3 runIfLastObserver:;
- (void)notifyObserver:(id)a3 handler:(id)a4;
- (void)notifyObservers:(id)a3;
- (void)notifyObserversInGroup:(id)a3 handler:(id)a4;
- (void)registerObserver:(id)a3;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)registerObserver:(id)a3 queue:(id)a4 runIfFirstObserver:(id)a5;
- (void)unregisterAllObservers;
- (void)unregisterObserver:(id)a3;
- (void)unregisterObserver:(id)a3 runIfLastObserver:(id)a4;
@end

@implementation HKObserverSet

- (void)registerObserver:(id)a3
{
}

- (void)unregisterObserver:(id)a3
{
}

- (void)notifyObservers:(id)a3
{
}

- (HKObserverSet)initWithName:(id)a3 loggingCategory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKObserverSet;
  v8 = [(HKObserverSet *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeStrong((id *)&v8->_category, a4);
    v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (void)_registerObserver:(void *)a3 queue:(void *)a4 runIfFirstObserver:
{
  id v17 = a2;
  id v7 = a3;
  v8 = a4;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    uint64_t v9 = [*(id *)(a1 + 32) count];
    v10 = [*(id *)(a1 + 32) objectForKey:v17];

    if (!v10)
    {
      if (!v7)
      {
        v11 = *(void **)(a1 + 40);
        if (!v11)
        {
          uint64_t v12 = HKCreateSerialDispatchQueue((void *)a1, *(void **)(a1 + 8));
          v13 = *(void **)(a1 + 40);
          *(void *)(a1 + 40) = v12;

          v11 = *(void **)(a1 + 40);
        }
        id v7 = v11;
      }
      v14 = *(void **)(a1 + 32);
      if (!v14)
      {
        uint64_t v15 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
        v16 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v15;

        v14 = *(void **)(a1 + 32);
      }
      [v14 setObject:v7 forKey:v17];
    }
    if (v8 && !v9 && [*(id *)(a1 + 32) count] == 1) {
      v8[2](v8);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  }
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
}

- (void)registerObserver:(id)a3 queue:(id)a4 runIfFirstObserver:(id)a5
{
}

- (void)_unregisterObserver:(void *)a3 runIfLastObserver:
{
  v8 = a3;
  if (a1)
  {
    id v5 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    uint64_t v6 = [*(id *)(a1 + 32) count];
    [*(id *)(a1 + 32) removeObjectForKey:v5];

    if (![*(id *)(a1 + 32) count])
    {
      id v7 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;

      if (v8)
      {
        if (v6 >= 1) {
          v8[2]();
        }
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  }
}

- (void)unregisterObserver:(id)a3 runIfLastObserver:(id)a4
{
}

- (void)unregisterAllObservers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  queuesByObserver = self->_queuesByObserver;
  self->_queuesByObserver = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)_notifyObserversInGroup:(void *)a3 handler:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = objc_msgSend(*(id *)(a1 + 32), "keyEnumerator", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
          if (v5) {
            dispatch_group_enter(v5);
          }
          v13 = [*(id *)(a1 + 32) objectForKey:v12];
          -[HKObserverSet _notifyObserver:queue:handler:](a1, v12, v13, v6);

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  }
}

- (void)notifyObserversInGroup:(id)a3 handler:(id)a4
{
}

- (void)_notifyObserver:(NSObject *)a3 queue:(void *)a4 handler:
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = v8;
  if (a1)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__HKObserverSet__notifyObserver_queue_handler___block_invoke;
    v10[3] = &unk_1E58BBF10;
    id v12 = v8;
    id v11 = v7;
    dispatch_async(a3, v10);
  }
}

- (void)notifyObserver:(id)a3 handler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v7 = [(NSMapTable *)self->_queuesByObserver objectForKey:v8];
  if (v7) {
    -[HKObserverSet _notifyObserver:queue:handler:]((uint64_t)self, v8, v7, v6);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)count
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(NSMapTable *)self->_queuesByObserver count];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)allObservers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(NSMapTable *)self->_queuesByObserver keyEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (*(void *)(*((void *)&v12 + 1) + 8 * i)) {
          objc_msgSend(v4, "addObject:");
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  uint64_t v10 = (void *)[v4 copy];

  return (NSArray *)v10;
}

uint64_t __47__HKObserverSet__notifyObserver_queue_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultObserverQueue, 0);
  objc_storeStrong((id *)&self->_queuesByObserver, 0);
  objc_storeStrong((id *)&self->_category, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end