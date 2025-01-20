@interface QLPXObservable
- (QLPXObservable)init;
- (unint64_t)currentChanges;
- (void)_applyPendingChanges;
- (void)_didChange;
- (void)_observersQueue_copyChangeObserversForWriteIfNeeded;
- (void)_publishChanges;
- (void)_willChange;
- (void)enumerateObserversUsingBlock:(id)a3;
- (void)performChanges:(id)a3;
- (void)registerChangeObserver:(id)a3 context:(void *)a4;
- (void)signalChange:(unint64_t)a3;
- (void)unregisterChangeObserver:(id)a3 context:(void *)a4;
@end

@implementation QLPXObservable

- (QLPXObservable)init
{
  v6.receiver = self;
  v6.super_class = (Class)QLPXObservable;
  v2 = [(QLPXObservable *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.photosuicore.observable.internal-queue", 0);
    observersQueue = v2->_observersQueue;
    v2->_observersQueue = (OS_dispatch_queue *)v3;

    v2->_currentChange = 0;
  }
  return v2;
}

- (void)performChanges:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v12 = v4;
  if (self->_isEnumeratingObservers)
  {
    pendingChangeBlocks = self->_pendingChangeBlocks;
    if (pendingChangeBlocks)
    {
      objc_super v6 = (void *)[v4 copy];
      [(NSMutableArray *)pendingChangeBlocks addObject:v6];
    }
    else
    {
      v8 = (void *)MEMORY[0x263EFF980];
      v9 = (void *)[v4 copy];
      v10 = [v8 arrayWithObject:v9];
      v11 = self->_pendingChangeBlocks;
      self->_pendingChangeBlocks = v10;
    }
  }
  else
  {
    [(QLPXObservable *)self _willChange];
    v7 = [(QLPXObservable *)self mutableChangeObject];
    v12[2](v12, v7);

    [(QLPXObservable *)self _didChange];
  }
}

- (void)registerChangeObserver:(id)a3 context:(void *)a4
{
  id v6 = a3;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__QLPXObservable_registerChangeObserver_context___block_invoke;
  block[3] = &unk_2642F5720;
  block[4] = self;
  id v10 = v6;
  v11 = a4;
  id v8 = v6;
  dispatch_sync(observersQueue, block);
}

void __49__QLPXObservable_registerChangeObserver_context___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_observersQueue_copyChangeObserversForWriteIfNeeded");
  v2 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    id v12 = v2;
    uint64_t v6 = [v2 count];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      v9 = v12;
      while (1)
      {
        uint64_t v10 = [v9 pointerAtIndex:v8];
        uint64_t v11 = *(void *)(a1 + 48);
        if (v10 == v11) {
          break;
        }
        ++v8;
        v9 = v12;
        if (v7 == v8) {
          goto LABEL_14;
        }
      }
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 48);
LABEL_14:
      [v12 addPointer:v11];
    }
  }
  else
  {
    if (!*(void *)(*(void *)(a1 + 32) + 64))
    {
      uint64_t v3 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
      uint64_t v4 = *(void *)(a1 + 32);
      v5 = *(void **)(v4 + 64);
      *(void *)(v4 + 64) = v3;
    }
    id v12 = (id)[objc_alloc(MEMORY[0x263F08A88]) initWithOptions:256];
    [v12 addPointer:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 64) setObject:v12 forKey:*(void *)(a1 + 40)];
  }
}

- (void)unregisterChangeObserver:(id)a3 context:(void *)a4
{
  id v6 = a3;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__QLPXObservable_unregisterChangeObserver_context___block_invoke;
  block[3] = &unk_2642F5720;
  block[4] = self;
  id v10 = v6;
  uint64_t v11 = a4;
  id v8 = v6;
  dispatch_sync(observersQueue, block);
}

void __51__QLPXObservable_unregisterChangeObserver_context___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_observersQueue_copyChangeObserversForWriteIfNeeded");
  id v5 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKey:*(void *)(a1 + 40)];
  uint64_t v2 = [v5 count];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    while ([v5 pointerAtIndex:v4] != *(void *)(a1 + 48))
    {
      if (v3 == ++v4) {
        goto LABEL_7;
      }
    }
    [v5 removePointerAtIndex:v4];
  }
LABEL_7:
  if (v5 && ![v5 count]) {
    [*(id *)(*(void *)(a1 + 32) + 64) removeObjectForKey:*(void *)(a1 + 40)];
  }
}

- (void)signalChange:(unint64_t)a3
{
  self->_currentChange |= a3;
}

- (unint64_t)currentChanges
{
  return self->_currentChange;
}

- (void)enumerateObserversUsingBlock:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, uint64_t, uint64_t, char *))a3;
  BOOL isEnumeratingObservers = self->_isEnumeratingObservers;
  self->_BOOL isEnumeratingObservers = 1;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1;
  v27 = __Block_byref_object_dispose__1;
  id v28 = 0;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__QLPXObservable_enumerateObserversUsingBlock___block_invoke;
  block[3] = &unk_2642F5940;
  block[4] = self;
  void block[5] = &v23;
  dispatch_sync(observersQueue, block);
  char v21 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(id)v24[5] keyEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * v9);
      uint64_t v11 = [(id)v24[5] objectForKey:v10];
      unint64_t v12 = 0;
      while (v12 < [v11 count])
      {
        v4[2](v4, v10, [v11 pointerAtIndex:v12++], &v21);
        if (v21)
        {

          goto LABEL_13;
        }
      }
      BOOL v13 = v21 == 0;

      if (!v13) {
        break;
      }
      if (++v9 == v7)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v29 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
LABEL_13:

  v14 = self->_observersQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __47__QLPXObservable_enumerateObserversUsingBlock___block_invoke_2;
  v16[3] = &unk_2642F5430;
  v16[4] = self;
  dispatch_sync(v14, v16);
  self->_BOOL isEnumeratingObservers = isEnumeratingObservers;
  _Block_object_dispose(&v23, 8);
}

void __47__QLPXObservable_enumerateObserversUsingBlock___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
}

uint64_t __47__QLPXObservable_enumerateObserversUsingBlock___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 56) = 0;
  return result;
}

- (void)_willChange
{
  int64_t nestedChanges = self->_nestedChanges;
  if (!nestedChanges)
  {
    [(QLPXObservable *)self willPerformChanges];
    int64_t nestedChanges = self->_nestedChanges;
  }
  self->_int64_t nestedChanges = nestedChanges + 1;
}

- (void)_didChange
{
  int64_t nestedChanges = self->_nestedChanges;
  if (nestedChanges == 1)
  {
    [(QLPXObservable *)self didPerformChanges];
    int64_t nestedChanges = self->_nestedChanges;
  }
  int64_t v4 = nestedChanges - 1;
  self->_int64_t nestedChanges = v4;
  if (!v4)
  {
    if (self->_currentChange)
    {
      [(QLPXObservable *)self _publishChanges];
      [(QLPXObservable *)self didPublishChanges];
      self->_currentChange = 0;
    }
    [(QLPXObservable *)self _applyPendingChanges];
  }
}

- (void)_publishChanges
{
  unint64_t currentChange = self->_currentChange;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __33__QLPXObservable__publishChanges__block_invoke;
  v3[3] = &unk_2642F5968;
  v3[4] = self;
  v3[5] = currentChange;
  [(QLPXObservable *)self enumerateObserversUsingBlock:v3];
}

uint64_t __33__QLPXObservable__publishChanges__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 observable:*(void *)(a1 + 32) didChange:*(void *)(a1 + 40) context:a3];
}

- (void)_applyPendingChanges
{
  pendingChangeBlocks = self->_pendingChangeBlocks;
  int64_t numAppliedPendingChanges = self->_numAppliedPendingChanges;
  self->_int64_t numAppliedPendingChanges = numAppliedPendingChanges + 1;
  if (pendingChangeBlocks)
  {
    id v5 = pendingChangeBlocks;
    id v6 = self->_pendingChangeBlocks;
    self->_pendingChangeBlocks = 0;

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __38__QLPXObservable__applyPendingChanges__block_invoke;
    v8[3] = &unk_2642F5990;
    uint64_t v9 = v5;
    uint64_t v7 = v5;
    [(QLPXObservable *)self performChanges:v8];

    int64_t numAppliedPendingChanges = self->_numAppliedPendingChanges - 1;
  }
  self->_int64_t numAppliedPendingChanges = numAppliedPendingChanges;
}

void __38__QLPXObservable__applyPendingChanges__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_observersQueue_copyChangeObserversForWriteIfNeeded
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_observersQueue_shouldCopyChangeObserversOnWrite)
  {
    id v3 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = [(NSMapTable *)self->_observersQueue_changeObserversWithContexts keyEnumerator];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          long long v10 = [(NSMapTable *)self->_observersQueue_changeObserversWithContexts objectForKey:v9];
          long long v11 = (void *)[v10 copy];

          [(NSMapTable *)v3 setObject:v11 forKey:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }

    observersQueue_changeObserversWithContexts = self->_observersQueue_changeObserversWithContexts;
    self->_observersQueue_changeObserversWithContexts = v3;

    self->_observersQueue_shouldCopyChangeObserversOnWrite = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersQueue_changeObserversWithContexts, 0);
  objc_storeStrong((id *)&self->_observersQueue, 0);

  objc_storeStrong((id *)&self->_pendingChangeBlocks, 0);
}

@end