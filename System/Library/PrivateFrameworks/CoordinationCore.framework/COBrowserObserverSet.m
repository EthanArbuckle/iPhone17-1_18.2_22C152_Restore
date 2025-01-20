@interface COBrowserObserverSet
- (COBrowserObserverSet)init;
- (NSArray)observers;
- (void)_withLock:(id)a3;
- (void)addObserver:(id)a3;
- (void)informObserverAboutDevice:(id)a3 added:(BOOL)a4;
- (void)removeObserver:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation COBrowserObserverSet

- (COBrowserObserverSet)init
{
  v7.receiver = self;
  v7.super_class = (Class)COBrowserObserverSet;
  v2 = [(COBrowserObserverSet *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x263EFF8C0] array];
    observers = v3->_observers;
    v3->_observers = (NSArray *)v4;
  }
  return v3;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__COBrowserObserverSet_addObserver___block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COBrowserObserverSet *)self _withLock:v6];
}

void __36__COBrowserObserverSet_addObserver___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) mutableCopy];
  [v2 addObject:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__COBrowserObserverSet_removeObserver___block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COBrowserObserverSet *)self _withLock:v6];
}

void __39__COBrowserObserverSet_removeObserver___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) mutableCopy];
  [v2 removeObject:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;
}

- (NSArray)observers
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__28;
  v9 = __Block_byref_object_dispose__28;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__COBrowserObserverSet_observers__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COBrowserObserverSet *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __33__COBrowserObserverSet_observers__block_invoke(uint64_t a1)
{
}

- (void)informObserverAboutDevice:(id)a3 added:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__COBrowserObserverSet_informObserverAboutDevice_added___block_invoke;
  v8[3] = &unk_2645CC168;
  BOOL v10 = a4;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(COBrowserObserverSet *)self _withLock:v8];
}

void __56__COBrowserObserverSet_informObserverAboutDevice_added___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6), "block", (void)v8);
        id v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        v7[2](v7, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
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

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end