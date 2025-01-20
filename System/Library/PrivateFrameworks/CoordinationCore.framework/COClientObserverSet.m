@interface COClientObserverSet
- (COClientObserverSet)init;
- (NSDictionary)registrations;
- (NSMapTable)observers;
- (id)clientObservers;
- (id)clientObserversForNotificationName:(id)a3;
- (id)clientObserversForXPCConnection:(id)a3;
- (void)_withLock:(id)a3;
- (void)addClientObserver:(id)a3 forNotificationName:(id)a4;
- (void)removeClientObserver:(id)a3 forNotificationName:(id)a4;
- (void)setObservers:(id)a3;
- (void)setRegistrations:(id)a3;
@end

@implementation COClientObserverSet

- (COClientObserverSet)init
{
  v8.receiver = self;
  v8.super_class = (Class)COClientObserverSet;
  v2 = [(COClientObserverSet *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    observers = v2->_observers;
    v2->_observers = (NSMapTable *)v3;

    v5 = (NSDictionary *)objc_alloc_init(NSDictionary);
    registrations = v2->_registrations;
    v2->_registrations = v5;
  }
  return v2;
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)clientObservers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__COClientObserverSet_clientObservers__block_invoke;
  v8[3] = &unk_2645CAE80;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  [(COClientObserverSet *)self _withLock:v8];
  v5 = v9;
  id v6 = v4;

  return v6;
}

void __38__COClientObserverSet_clientObservers__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) observers];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(a1 + 40);
        objc_super v8 = [v2 objectForKey:*(void *)(*((void *)&v9 + 1) + 8 * v6)];
        [v7 addObjectsFromArray:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (id)clientObserversForXPCConnection:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__17;
  v15 = __Block_byref_object_dispose__17;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__COClientObserverSet_clientObserversForXPCConnection___block_invoke;
  v8[3] = &unk_2645CB1E8;
  long long v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(COClientObserverSet *)self _withLock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __55__COClientObserverSet_clientObserversForXPCConnection___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) observers];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)clientObserversForNotificationName:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__17;
  v15 = __Block_byref_object_dispose__17;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__COClientObserverSet_clientObserversForNotificationName___block_invoke;
  v8[3] = &unk_2645CB1E8;
  long long v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(COClientObserverSet *)self _withLock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __58__COClientObserverSet_clientObserversForNotificationName___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) registrations];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)addClientObserver:(id)a3 forNotificationName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__COClientObserverSet_addClientObserver_forNotificationName___block_invoke;
  v10[3] = &unk_2645CAEF8;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(COClientObserverSet *)self _withLock:v10];
}

void __61__COClientObserverSet_addClientObserver_forNotificationName___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) registrations];
  uint64_t v2 = [v8 objectForKey:*(void *)(a1 + 40)];
  if (([v2 containsObject:*(void *)(a1 + 48)] & 1) == 0)
  {
    if (v2)
    {
      uint64_t v3 = [v2 arrayByAddingObject:*(void *)(a1 + 48)];
    }
    else
    {
      uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObject:*(void *)(a1 + 48)];
    }
    id v4 = (void *)[v8 mutableCopy];
    [v4 setObject:v3 forKey:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setRegistrations:v4];

    id v5 = [*(id *)(a1 + 32) observers];
    id v6 = [*(id *)(a1 + 48) connection];
    uint64_t v2 = [v5 objectForKey:v6];

    if (([v2 containsObject:*(void *)(a1 + 48)] & 1) == 0)
    {
      if (v2)
      {
        uint64_t v7 = [v2 arrayByAddingObject:*(void *)(a1 + 48)];

        uint64_t v2 = (void *)v7;
      }
      else
      {
        uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObject:*(void *)(a1 + 48)];
      }
      [v5 setObject:v2 forKey:v6];
    }
  }
}

- (void)removeClientObserver:(id)a3 forNotificationName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__COClientObserverSet_removeClientObserver_forNotificationName___block_invoke;
  v10[3] = &unk_2645CAEF8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(COClientObserverSet *)self _withLock:v10];
}

void __64__COClientObserverSet_removeClientObserver_forNotificationName___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) registrations];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v3 = [v2 allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v4)
  {

LABEL_17:
    v17 = [*(id *)(a1 + 32) observers];
    v18 = [*(id *)(a1 + 40) connection];
    v19 = [v17 objectForKey:v18];
    v20 = (void *)[v19 mutableCopy];
    [v20 removeObject:*(void *)(a1 + 40)];
    if ([v20 count]) {
      [v17 setObject:v20 forKey:v18];
    }
    else {
      [v17 removeObjectForKey:v18];
    }

    goto LABEL_21;
  }
  uint64_t v5 = v4;
  char v21 = 0;
  uint64_t v6 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v23 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void *)(*((void *)&v22 + 1) + 8 * i);
      id v9 = [v2 objectForKey:v8];
      uint64_t v10 = [v9 indexOfObject:*(void *)(a1 + 40)];
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v11 = v10;
        id v12 = *(void **)(a1 + 48);
        if (v12 && ![v12 isEqualToString:v8])
        {
          char v21 = 1;
        }
        else
        {
          uint64_t v13 = v3;
          uint64_t v14 = (void *)[v9 mutableCopy];
          [v14 removeObjectAtIndex:v11];
          v15 = (void *)[v2 mutableCopy];
          [v15 setObject:v14 forKey:v8];
          id v16 = v15;

          [*(id *)(a1 + 32) setRegistrations:v16];
          uint64_t v3 = v13;
          uint64_t v2 = v16;
        }
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v5);

  if ((v21 & 1) == 0 || !*(void *)(a1 + 48)) {
    goto LABEL_17;
  }
LABEL_21:
}

- (NSMapTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSDictionary)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end