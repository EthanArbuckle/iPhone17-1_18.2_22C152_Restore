@interface COObserverSet
- (COObserverSet)init;
- (NSHashTable)registrations;
- (NSOperationQueue)queue;
- (id)addObserverForName:(id)a3 observable:(id)a4 queue:(id)a5 usingBlock:(id)a6;
- (id)registeredNames;
- (void)_withLock:(id)a3;
- (void)postNotification:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation COObserverSet

- (COObserverSet)init
{
  v7.receiver = self;
  v7.super_class = (Class)COObserverSet;
  v2 = [(COObserverSet *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x263F088B0] hashTableWithOptions:0];
    registrations = v3->_registrations;
    v3->_registrations = (NSHashTable *)v4;
  }
  return v3;
}

- (NSOperationQueue)queue
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __22__COObserverSet_queue__block_invoke;
  v4[3] = &unk_264444468;
  v4[4] = self;
  v4[5] = &v5;
  [(COObserverSet *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSOperationQueue *)v2;
}

void __22__COObserverSet_queue__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 16));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v2 = objc_alloc_init(MEMORY[0x263F08A48]);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v2;

    uint64_t v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v5, v2);
  }
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  uint64_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)addObserverForName:(id)a3 observable:(id)a4 queue:(id)a5 usingBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [COObserver alloc];
  v15 = v14;
  if (v12)
  {
    id v16 = [(COObserver *)v14 initForName:v10 onObservable:v11 handler:v13 queue:v12];
  }
  else
  {
    v17 = [(COObserverSet *)self queue];
    id v16 = [(COObserver *)v15 initForName:v10 onObservable:v11 handler:v13 queue:v17];
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __64__COObserverSet_addObserverForName_observable_queue_usingBlock___block_invoke;
  v22[3] = &unk_2644444E0;
  v22[4] = self;
  id v18 = v16;
  id v23 = v18;
  [(COObserverSet *)self _withLock:v22];
  v19 = v23;
  id v20 = v18;

  return v20;
}

void __64__COObserverSet_addObserverForName_observable_queue_usingBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) registrations];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __32__COObserverSet_removeObserver___block_invoke;
    v5[3] = &unk_2644444E0;
    v5[4] = self;
    id v6 = v4;
    [(COObserverSet *)self _withLock:v5];
  }
}

void __32__COObserverSet_removeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) registrations];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)postNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 name];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__COObserverSet_postNotification___block_invoke;
  v8[3] = &unk_2644448B0;
  v8[4] = self;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [(COObserverSet *)self _withLock:v8];
}

void __34__COObserverSet_postNotification___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "registrations", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        v8 = [v7 name];
        int v9 = [v8 isEqualToString:*(void *)(a1 + 40)];

        if (v9) {
          [v7 notify:*(void *)(a1 + 48)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (id)registeredNames
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __32__COObserverSet_registeredNames__block_invoke;
  v8[3] = &unk_2644444E0;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  [(COObserverSet *)self _withLock:v8];
  uint64_t v5 = v9;
  id v6 = v4;

  return v6;
}

void __32__COObserverSet_registeredNames__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "registrations", 0);
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
        id v7 = *(void **)(a1 + 40);
        v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) name];
        [v7 addObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (NSHashTable)registrations
{
  return self->_registrations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrations, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end