@interface CAMObservable
- (CAMObservable)init;
- (id)mutableChangeObject;
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

@implementation CAMObservable

- (CAMObservable)init
{
  v6.receiver = self;
  v6.super_class = (Class)CAMObservable;
  v2 = [(CAMObservable *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.camera.observable.internal-queue", 0);
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
    [(CAMObservable *)self _willChange];
    v7 = [(CAMObservable *)self mutableChangeObject];
    v12[2](v12, v7);

    [(CAMObservable *)self _didChange];
  }
}

- (void)registerChangeObserver:(id)a3 context:(void *)a4
{
  id v6 = a3;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__CAMObservable_registerChangeObserver_context___block_invoke;
  block[3] = &unk_263FA1FF8;
  block[4] = self;
  id v10 = v6;
  v11 = a4;
  id v8 = v6;
  dispatch_sync(observersQueue, block);
}

void __48__CAMObservable_registerChangeObserver_context___block_invoke(uint64_t a1)
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
  block[2] = __50__CAMObservable_unregisterChangeObserver_context___block_invoke;
  block[3] = &unk_263FA1FF8;
  block[4] = self;
  id v10 = v6;
  uint64_t v11 = a4;
  id v8 = v6;
  dispatch_sync(observersQueue, block);
}

void __50__CAMObservable_unregisterChangeObserver_context___block_invoke(uint64_t a1)
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

- (id)mutableChangeObject
{
  uint64_t v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  uint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)signalChange:(unint64_t)a3
{
  self->_currentChange |= a3;
}

- (void)enumerateObserversUsingBlock:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void, uint64_t))a3;
  BOOL isEnumeratingObservers = self->_isEnumeratingObservers;
  self->_BOOL isEnumeratingObservers = 1;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__30;
  v25 = __Block_byref_object_dispose__30;
  id v26 = 0;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__CAMObservable_enumerateObserversUsingBlock___block_invoke;
  block[3] = &unk_263FA35E8;
  block[4] = self;
  void block[5] = &v21;
  dispatch_sync(observersQueue, block);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(id)v22[5] keyEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [(id)v22[5] objectForKey:v10];
        for (unint64_t j = 0; j < [v11 count]; ++j)
          v4[2](v4, v10, [v11 pointerAtIndex:j]);
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v27 count:16];
    }
    while (v7);
  }

  v13 = self->_observersQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __46__CAMObservable_enumerateObserversUsingBlock___block_invoke_2;
  v15[3] = &unk_263FA0208;
  v15[4] = self;
  dispatch_sync(v13, v15);
  self->_BOOL isEnumeratingObservers = isEnumeratingObservers;
  _Block_object_dispose(&v21, 8);
}

void __46__CAMObservable_enumerateObserversUsingBlock___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
}

uint64_t __46__CAMObservable_enumerateObserversUsingBlock___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 56) = 0;
  return result;
}

- (void)_willChange
{
  int64_t nestedChanges = self->_nestedChanges;
  if (!nestedChanges)
  {
    [(CAMObservable *)self willPerformChanges];
    int64_t nestedChanges = self->_nestedChanges;
  }
  self->_int64_t nestedChanges = nestedChanges + 1;
}

- (void)_didChange
{
  int64_t nestedChanges = self->_nestedChanges;
  if (nestedChanges == 1)
  {
    [(CAMObservable *)self didPerformChanges];
    int64_t nestedChanges = self->_nestedChanges;
  }
  int64_t v4 = nestedChanges - 1;
  self->_int64_t nestedChanges = v4;
  if (!v4)
  {
    if (self->_currentChange)
    {
      [(CAMObservable *)self _publishChanges];
      [(CAMObservable *)self didPublishChanges];
      self->_currentChange = 0;
    }
    [(CAMObservable *)self _applyPendingChanges];
  }
}

- (void)_publishChanges
{
  unint64_t currentChange = self->_currentChange;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __32__CAMObservable__publishChanges__block_invoke;
  v3[3] = &unk_263FA6A70;
  v3[4] = self;
  v3[5] = currentChange;
  [(CAMObservable *)self enumerateObserversUsingBlock:v3];
}

uint64_t __32__CAMObservable__publishChanges__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 observable:*(void *)(a1 + 32) didPublishChange:*(void *)(a1 + 40) withContext:a3];
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
    v8[2] = __37__CAMObservable__applyPendingChanges__block_invoke;
    v8[3] = &unk_263FA6A98;
    v9 = v5;
    uint64_t v7 = v5;
    [(CAMObservable *)self performChanges:v8];

    int64_t numAppliedPendingChanges = self->_numAppliedPendingChanges - 1;
  }
  self->_int64_t numAppliedPendingChanges = numAppliedPendingChanges;
}

void __37__CAMObservable__applyPendingChanges__block_invoke(uint64_t a1, void *a2)
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