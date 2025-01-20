@interface CSLPRFConcurrentObserverStore
- (CSLPRFConcurrentObserverStore)init;
- (CSLPRFConcurrentObserverStore)initWithServiceName:(id)a3;
- (NSPointerArray)observers;
- (os_unfair_lock_s)observersLock;
- (unint64_t)count;
- (void)_withLock:(id)a3;
- (void)addObserver:(id)a3;
- (void)enumerateObserversWithBlock:(id)a3;
- (void)performSelectorOnMainThreadWithRespondingObservers:(SEL)a3 object:(id)a4 waitUntilDone:(BOOL)a5;
- (void)removeObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setObserversLock:(os_unfair_lock_s)a3;
@end

@implementation CSLPRFConcurrentObserverStore

- (void).cxx_destruct
{
}

- (void)setObservers:(id)a3
{
}

- (NSPointerArray)observers
{
  return self->_observers;
}

- (void)setObserversLock:(os_unfair_lock_s)a3
{
  self->_observersLock = a3;
}

- (os_unfair_lock_s)observersLock
{
  return self->_observersLock;
}

- (void)enumerateObserversWithBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v4 = (void (**)(void))a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__874;
  v18 = __Block_byref_object_dispose__875;
  id v19 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__CSLPRFConcurrentObserverStore_enumerateObserversWithBlock___block_invoke;
  v13[3] = &unk_264A0BC58;
  v13[4] = self;
  v13[5] = &v14;
  [(CSLPRFConcurrentObserverStore *)self _withLock:v13];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = (id)v15[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        if (*(void *)(*((void *)&v9 + 1) + 8 * v8)) {
          v4[2](v4);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v20 count:16];
    }
    while (v6);
  }

  _Block_object_dispose(&v14, 8);
}

uint64_t __61__CSLPRFConcurrentObserverStore_enumerateObserversWithBlock___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) compact];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) allObjects];
  return MEMORY[0x270F9A758]();
}

- (void)performSelectorOnMainThreadWithRespondingObservers:(SEL)a3 object:(id)a4 waitUntilDone:(BOOL)a5
{
  id v8 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __105__CSLPRFConcurrentObserverStore_performSelectorOnMainThreadWithRespondingObservers_object_waitUntilDone___block_invoke;
  v10[3] = &unk_264A0AEF0;
  id v11 = v8;
  SEL v12 = a3;
  BOOL v13 = a5;
  id v9 = v8;
  [(CSLPRFConcurrentObserverStore *)self enumerateObserversWithBlock:v10];
}

void __105__CSLPRFConcurrentObserverStore_performSelectorOnMainThreadWithRespondingObservers_object_waitUntilDone___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 performSelectorOnMainThread:*(void *)(a1 + 40) withObject:*(void *)(a1 + 32) waitUntilDone:*(unsigned __int8 *)(a1 + 48)];
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__CSLPRFConcurrentObserverStore_removeObserver___block_invoke;
  v6[3] = &unk_264A0BCA8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CSLPRFConcurrentObserverStore *)self _withLock:v6];
}

uint64_t __48__CSLPRFConcurrentObserverStore_removeObserver___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    uint64_t v2 = 0;
    while (1)
    {
      id v3 = [*(id *)(*(void *)(a1 + 32) + 16) pointerAtIndex:v2];
      id v4 = v3;
      if (*(void **)(a1 + 40) == v3) {
        break;
      }

      if (++v2 >= (unint64_t)[*(id *)(*(void *)(a1 + 32) + 16) count]) {
        goto LABEL_7;
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 16) replacePointerAtIndex:v2 withPointer:0];
  }
LABEL_7:
  id v5 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v5 compact];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__CSLPRFConcurrentObserverStore_addObserver___block_invoke;
  v6[3] = &unk_264A0BCA8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CSLPRFConcurrentObserverStore *)self _withLock:v6];
}

uint64_t __45__CSLPRFConcurrentObserverStore_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addPointer:*(void *)(a1 + 40)];
}

- (void)_withLock:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_observersLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_observersLock);
}

- (unint64_t)count
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__CSLPRFConcurrentObserverStore_count__block_invoke;
  v4[3] = &unk_264A0BC58;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLPRFConcurrentObserverStore *)self _withLock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __38__CSLPRFConcurrentObserverStore_count__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) compact];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (CSLPRFConcurrentObserverStore)init
{
  return [(CSLPRFConcurrentObserverStore *)self initWithServiceName:0];
}

- (CSLPRFConcurrentObserverStore)initWithServiceName:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSLPRFConcurrentObserverStore;
  id v3 = [(CSLPRFConcurrentObserverStore *)&v7 init];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
    observers = v3->_observers;
    v3->_observers = (NSPointerArray *)v4;

    v3->_observersLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

@end