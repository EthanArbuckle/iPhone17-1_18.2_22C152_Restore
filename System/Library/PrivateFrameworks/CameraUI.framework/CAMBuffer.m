@interface CAMBuffer
+ (id)keyPathsForValuesAffectingCurrentValue;
+ (id)keyPathsForValuesAffectingEnabled;
- (BOOL)_isBufferQueue;
- (BOOL)isBufferEmpty;
- (BOOL)isBufferQueueEnabled;
- (BOOL)isEnabled;
- (CAMBuffer)init;
- (NSArray)bufferedValues;
- (NSCopying)bufferQueueCurrentValue;
- (NSMutableArray)_bufferQueueBufferedValues;
- (NSMutableArray)_bufferQueueObservances;
- (NSMutableDictionary)_bufferQueueObservers;
- (OS_dispatch_queue)_bufferQueue;
- (id)_addObserver:(id)a3 onMainQueue:(BOOL)a4;
- (id)addMainQueueObserver:(id)a3;
- (id)addObserver:(id)a3;
- (id)currentValue;
- (id)firstBufferedValue;
- (id)lastBufferedValue;
- (void)_bufferQueueEvaluateObservances;
- (void)_bufferQueueFulfillAndEvaluateWithChange:(id)a3;
- (void)_bufferQueueFulfillObservancesWithChange:(id)a3;
- (void)_bufferQueueSetupObservance:(id)a3;
- (void)_bufferQueueTeardownObservance:(id)a3;
- (void)_bufferQueueTeardownObservances:(id)a3;
- (void)_emitBufferedValues;
- (void)dealloc;
- (void)disableUntil:(id)a3;
- (void)disableUntilKeyPath:(id)a3 ofObject:(id)a4 evaluates:(id)a5;
- (void)disableUntilNotification:(id)a3 fromObject:(id)a4 usingNotificationCenter:(id)a5;
- (void)disableWhile:(id)a3;
- (void)disableWhileKeyPath:(id)a3 ofObject:(id)a4 evaluates:(id)a5;
- (void)disableWhileNotification:(id)a3 fromObject:(id)a4 usingNotificationCenter:(id)a5;
- (void)handleObservedNotification:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)push:(id)a3;
- (void)reevaluate;
- (void)removeObserverForKey:(id)a3;
- (void)replaceWith:(id)a3;
- (void)setBufferQueueCurrentValue:(id)a3;
- (void)setBufferQueueEnabled:(BOOL)a3;
@end

@implementation CAMBuffer

- (CAMBuffer)init
{
  v12.receiver = self;
  v12.super_class = (Class)CAMBuffer;
  id v2 = [(CAMBuffer *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.camera.execution-buffer", v3);
    v5 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v4;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v2 + 2), @"bufferQueueIdentification", @"bufferQueueIdentification", 0);
    v6 = *((void *)v2 + 2);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __17__CAMBuffer_init__block_invoke;
    block[3] = &unk_263FA0208;
    id v7 = v2;
    id v11 = v7;
    dispatch_sync(v6, block);
    id v8 = v7;
  }
  return (CAMBuffer *)v2;
}

uint64_t __17__CAMBuffer_init__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v3 = *(void *)(a1 + 32);
  dispatch_queue_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(v9 + 48);
  *(void *)(v9 + 48) = v8;
  return MEMORY[0x270F9A758](v8, v10);
}

- (void)dealloc
{
  bufferQueue = self->__bufferQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __20__CAMBuffer_dealloc__block_invoke;
  block[3] = &unk_263FA0208;
  void block[4] = self;
  dispatch_sync(bufferQueue, block);
  dispatch_queue_t v4 = self->__bufferQueue;
  self->__bufferQueue = 0;

  v5.receiver = self;
  v5.super_class = (Class)CAMBuffer;
  [(CAMBuffer *)&v5 dealloc];
}

void __20__CAMBuffer_dealloc__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 _bufferQueueObservances];
  [v2 _bufferQueueTeardownObservances:v3];
}

- (BOOL)isEnabled
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if ([(CAMBuffer *)self _isBufferQueue])
  {
    BOOL v3 = [(CAMBuffer *)self isBufferQueueEnabled];
    *((unsigned char *)v8 + 24) = v3;
  }
  else
  {
    dispatch_queue_t v4 = [(CAMBuffer *)self _bufferQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __22__CAMBuffer_isEnabled__block_invoke;
    v6[3] = &unk_263FA35E8;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(v4, v6);

    BOOL v3 = *((unsigned char *)v8 + 24) != 0;
  }
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __22__CAMBuffer_isEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isBufferQueueEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_bufferQueueFulfillObservancesWithChange:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [(CAMBuffer *)self _bufferQueueObservances];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_super v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "fulfillWithChange:", v4, (void)v16);
        int v13 = [v12 isEnabled];
        int v14 = [v12 isRemovedOnceEnabled];
        if (v13) {
          BOOL v15 = v14 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  [(CAMBuffer *)self _bufferQueueTeardownObservances:v6];
}

- (void)_bufferQueueEvaluateObservances
{
  id v3 = [(CAMBuffer *)self _bufferQueueObservances];
  if ([v3 indexOfObjectPassingTest:&__block_literal_global_57] == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(CAMBuffer *)self setBufferQueueEnabled:1];
    [(CAMBuffer *)self _emitBufferedValues];
  }
  else
  {
    [(CAMBuffer *)self setBufferQueueEnabled:0];
  }
}

uint64_t __44__CAMBuffer__bufferQueueEvaluateObservances__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = a2;
  if ([v5 isFulfilled])
  {
    if ([v5 isFulfilled]) {
      uint64_t v6 = [v5 isEnabled] ^ 1;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 1;
  }
  *a4 = v6;

  return v6;
}

- (void)_bufferQueueFulfillAndEvaluateWithChange:(id)a3
{
  [(CAMBuffer *)self _bufferQueueFulfillObservancesWithChange:a3];
  [(CAMBuffer *)self _bufferQueueEvaluateObservances];
}

- (void)reevaluate
{
  id v3 = [(CAMBuffer *)self _bufferQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__CAMBuffer_reevaluate__block_invoke;
  block[3] = &unk_263FA0208;
  void block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __23__CAMBuffer_reevaluate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _bufferQueueFulfillAndEvaluateWithChange:0];
}

- (void)_bufferQueueSetupObservance:(id)a3
{
  id v4 = a3;
  [v4 setupObservanceForBuffer:self];
  id v5 = [(CAMBuffer *)self _bufferQueueObservances];
  [v5 addObject:v4];
}

- (void)_bufferQueueTeardownObservance:(id)a3
{
  id v4 = a3;
  [v4 teardownObservanceForBuffer:self];
  id v5 = [(CAMBuffer *)self _bufferQueueObservances];
  [v5 removeObject:v4];
}

- (void)_bufferQueueTeardownObservances:(id)a3
{
  id v4 = a3;
  [v4 makeObjectsPerformSelector:sel_teardownObservanceForBuffer_ withObject:self];
  id v5 = [(CAMBuffer *)self _bufferQueueObservances];
  [v5 removeObjectsInArray:v4];
}

- (void)disableWhile:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMBuffer *)self _bufferQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __26__CAMBuffer_disableWhile___block_invoke;
  v7[3] = &unk_263FA0C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __26__CAMBuffer_disableWhile___block_invoke(uint64_t a1)
{
  id v2 = [[CAMBufferObservance alloc] initWithPredicate:*(void *)(a1 + 40) removedOnceEnabled:0];
  [*(id *)(a1 + 32) _bufferQueueSetupObservance:v2];
  [*(id *)(a1 + 32) _bufferQueueFulfillAndEvaluateWithChange:0];
}

- (void)disableWhileKeyPath:(id)a3 ofObject:(id)a4 evaluates:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CAMBuffer *)self _bufferQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __52__CAMBuffer_disableWhileKeyPath_ofObject_evaluates___block_invoke;
  v15[3] = &unk_263FA3B48;
  id v16 = v8;
  id v17 = v9;
  long long v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(v11, v15);
}

void __52__CAMBuffer_disableWhileKeyPath_ofObject_evaluates___block_invoke(uint64_t a1)
{
  id v3 = [[CAMBufferKeyValueObserverObservance alloc] initWithKeyPath:*(void *)(a1 + 32) ofObject:*(void *)(a1 + 40) withPredicate:*(void *)(a1 + 56) removedOnceEnabled:0];
  [*(id *)(a1 + 48) _bufferQueueSetupObservance:v3];
  id v2 = [[CAMBufferKeyValueObserverObservanceChange alloc] initWithKeyPath:*(void *)(a1 + 32) ofObject:*(void *)(a1 + 40) withChange:0];
  [*(id *)(a1 + 48) _bufferQueueFulfillAndEvaluateWithChange:v2];
}

- (void)disableWhileNotification:(id)a3 fromObject:(id)a4 usingNotificationCenter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CAMBuffer *)self _bufferQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __73__CAMBuffer_disableWhileNotification_fromObject_usingNotificationCenter___block_invoke;
  v15[3] = &unk_263FA0A60;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v19 = self;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(v11, v15);
}

void __73__CAMBuffer_disableWhileNotification_fromObject_usingNotificationCenter___block_invoke(uint64_t a1)
{
  id v2 = [[CAMBufferNotificationObservance alloc] initWithNotification:*(void *)(a1 + 32) object:*(void *)(a1 + 40) center:*(void *)(a1 + 48) removeOnceEnabled:0];
  [*(id *)(a1 + 56) _bufferQueueSetupObservance:v2];
  [*(id *)(a1 + 56) _bufferQueueEvaluateObservances];
}

- (void)disableUntil:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMBuffer *)self _bufferQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __26__CAMBuffer_disableUntil___block_invoke;
  v7[3] = &unk_263FA0C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __26__CAMBuffer_disableUntil___block_invoke(uint64_t a1)
{
  id v2 = [[CAMBufferObservance alloc] initWithPredicate:*(void *)(a1 + 40) removedOnceEnabled:1];
  [*(id *)(a1 + 32) _bufferQueueSetupObservance:v2];
  [*(id *)(a1 + 32) _bufferQueueFulfillAndEvaluateWithChange:0];
}

- (void)disableUntilKeyPath:(id)a3 ofObject:(id)a4 evaluates:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CAMBuffer *)self _bufferQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __52__CAMBuffer_disableUntilKeyPath_ofObject_evaluates___block_invoke;
  v15[3] = &unk_263FA3B48;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(v11, v15);
}

void __52__CAMBuffer_disableUntilKeyPath_ofObject_evaluates___block_invoke(uint64_t a1)
{
  id v3 = [[CAMBufferKeyValueObserverObservance alloc] initWithKeyPath:*(void *)(a1 + 32) ofObject:*(void *)(a1 + 40) withPredicate:*(void *)(a1 + 56) removedOnceEnabled:1];
  [*(id *)(a1 + 48) _bufferQueueSetupObservance:v3];
  id v2 = [[CAMBufferKeyValueObserverObservanceChange alloc] initWithKeyPath:*(void *)(a1 + 32) ofObject:*(void *)(a1 + 40) withChange:0];
  [*(id *)(a1 + 48) _bufferQueueFulfillAndEvaluateWithChange:v2];
}

- (void)disableUntilNotification:(id)a3 fromObject:(id)a4 usingNotificationCenter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CAMBuffer *)self _bufferQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __73__CAMBuffer_disableUntilNotification_fromObject_usingNotificationCenter___block_invoke;
  v15[3] = &unk_263FA0A60;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v19 = self;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(v11, v15);
}

void __73__CAMBuffer_disableUntilNotification_fromObject_usingNotificationCenter___block_invoke(uint64_t a1)
{
  id v2 = [[CAMBufferNotificationObservance alloc] initWithNotification:*(void *)(a1 + 32) object:*(void *)(a1 + 40) center:*(void *)(a1 + 48) removeOnceEnabled:1];
  [*(id *)(a1 + 56) _bufferQueueSetupObservance:v2];
  [*(id *)(a1 + 56) _bufferQueueEvaluateObservances];
}

- (void)_emitBufferedValues
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = [(CAMBuffer *)self _bufferQueueBufferedValues];
  v20 = [(CAMBuffer *)self _bufferQueueObservers];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v3;
  uint64_t v19 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v30;
    id v17 = self;
LABEL_3:
    uint64_t v4 = 0;
    while (1)
    {
      if (*(void *)v30 != v18) {
        objc_enumerationMutation(obj);
      }
      uint64_t v5 = *(void *)(*((void *)&v29 + 1) + 8 * v4);
      if (![(CAMBuffer *)self isBufferQueueEnabled]) {
        break;
      }
      uint64_t v22 = v4;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v6 = v20;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v26;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v26 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v25 + 1) + 8 * v10)];
            id v12 = _Block_copy(v11);
            id v13 = objc_getAssociatedObject(v12, (const void *)_shouldEmitValuesOnMainQueueKey);
            int v14 = [v13 BOOLValue];

            if (v14)
            {
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __32__CAMBuffer__emitBufferedValues__block_invoke;
              block[3] = &unk_263FA0C08;
              BOOL v15 = v11;
              void block[4] = v5;
              id v24 = v15;
              dispatch_async(MEMORY[0x263EF83A0], block);
            }
            else
            {
              v11[2](v11, v5);
            }

            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v8);
      }

      self = v17;
      [(CAMBuffer *)v17 setBufferQueueCurrentValue:v5];
      [v21 addObject:v5];
      uint64_t v4 = v22 + 1;
      if (v22 + 1 == v19)
      {
        uint64_t v19 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v19) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  [obj removeObjectsInArray:v21];
}

uint64_t __32__CAMBuffer__emitBufferedValues__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)push:(id)a3
{
  uint64_t v4 = (void *)[a3 copyWithZone:0];
  uint64_t v5 = [(CAMBuffer *)self _bufferQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __18__CAMBuffer_push___block_invoke;
  v7[3] = &unk_263FA0408;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __18__CAMBuffer_push___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _bufferQueueBufferedValues];
  [v2 addObject:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 32) isBufferQueueEnabled]) {
    [*(id *)(a1 + 32) _emitBufferedValues];
  }
}

- (void)replaceWith:(id)a3
{
  uint64_t v4 = (void *)[a3 copyWithZone:0];
  uint64_t v5 = [(CAMBuffer *)self _bufferQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __25__CAMBuffer_replaceWith___block_invoke;
  v7[3] = &unk_263FA0408;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __25__CAMBuffer_replaceWith___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _bufferQueueBufferedValues];
  [v2 removeAllObjects];
  [v2 addObject:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 32) isBufferQueueEnabled]) {
    [*(id *)(a1 + 32) _emitBufferedValues];
  }
}

- (BOOL)_isBufferQueue
{
  return dispatch_get_specific(@"bufferQueueIdentification") == @"bufferQueueIdentification";
}

- (id)currentValue
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__29;
  id v13 = __Block_byref_object_dispose__29;
  id v14 = 0;
  if ([(CAMBuffer *)self _isBufferQueue])
  {
    uint64_t v3 = [(CAMBuffer *)self bufferQueueCurrentValue];
    uint64_t v4 = (void *)v10[5];
    v10[5] = v3;
  }
  else
  {
    uint64_t v5 = [(CAMBuffer *)self _bufferQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __25__CAMBuffer_currentValue__block_invoke;
    v8[3] = &unk_263FA35E8;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(v5, v8);
  }
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __25__CAMBuffer_currentValue__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) bufferQueueCurrentValue];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (BOOL)isBufferEmpty
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(CAMBuffer *)self _bufferQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __26__CAMBuffer_isBufferEmpty__block_invoke;
  v5[3] = &unk_263FA35E8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __26__CAMBuffer_isBufferEmpty__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _bufferQueueBufferedValues];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count] == 0;
}

- (id)firstBufferedValue
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__29;
  uint64_t v11 = __Block_byref_object_dispose__29;
  id v12 = 0;
  uint64_t v3 = [(CAMBuffer *)self _bufferQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__CAMBuffer_firstBufferedValue__block_invoke;
  v6[3] = &unk_263FA35E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __31__CAMBuffer_firstBufferedValue__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _bufferQueueBufferedValues];
  uint64_t v2 = [v5 firstObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)lastBufferedValue
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__29;
  uint64_t v11 = __Block_byref_object_dispose__29;
  id v12 = 0;
  uint64_t v3 = [(CAMBuffer *)self _bufferQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__CAMBuffer_lastBufferedValue__block_invoke;
  v6[3] = &unk_263FA35E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __30__CAMBuffer_lastBufferedValue__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _bufferQueueBufferedValues];
  uint64_t v2 = [v5 lastObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)bufferedValues
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__29;
  uint64_t v11 = __Block_byref_object_dispose__29;
  id v12 = 0;
  uint64_t v3 = [(CAMBuffer *)self _bufferQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __27__CAMBuffer_bufferedValues__block_invoke;
  v6[3] = &unk_263FA35E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __27__CAMBuffer_bufferedValues__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _bufferQueueBufferedValues];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_addObserver:(id)a3 onMainQueue:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (void *)MEMORY[0x263F08C38];
  id v7 = a3;
  uint64_t v8 = [v6 UUID];
  uint64_t v9 = [v8 UUIDString];

  uint64_t v10 = (void *)[v7 copy];
  uint64_t v11 = _Block_copy(v10);
  id v12 = (const void *)_shouldEmitValuesOnMainQueueKey;
  id v13 = [NSNumber numberWithBool:v4];
  objc_setAssociatedObject(v11, v12, v13, (void *)1);

  id v14 = [(CAMBuffer *)self _bufferQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__CAMBuffer__addObserver_onMainQueue___block_invoke;
  block[3] = &unk_263FA5238;
  void block[4] = self;
  id v22 = v10;
  id v15 = v9;
  id v21 = v15;
  id v16 = v10;
  dispatch_sync(v14, block);

  id v17 = v21;
  id v18 = v15;

  return v18;
}

void __38__CAMBuffer__addObserver_onMainQueue___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _bufferQueueObservers];
  uint64_t v2 = _Block_copy(*(const void **)(a1 + 48));
  [v3 setObject:v2 forKey:*(void *)(a1 + 40)];
}

- (id)addObserver:(id)a3
{
  return [(CAMBuffer *)self _addObserver:a3 onMainQueue:0];
}

- (id)addMainQueueObserver:(id)a3
{
  return [(CAMBuffer *)self _addObserver:a3 onMainQueue:1];
}

- (void)removeObserverForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMBuffer *)self _bufferQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__CAMBuffer_removeObserverForKey___block_invoke;
  v7[3] = &unk_263FA0408;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __34__CAMBuffer_removeObserverForKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _bufferQueueObservers];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(CAMBuffer *)self _bufferQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __60__CAMBuffer_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v16[3] = &unk_263FA0A60;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  v20 = self;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_sync(v12, v16);
}

void __60__CAMBuffer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v2 = [[CAMBufferKeyValueObserverObservanceChange alloc] initWithKeyPath:*(void *)(a1 + 32) ofObject:*(void *)(a1 + 40) withChange:*(void *)(a1 + 48)];
  [*(id *)(a1 + 56) _bufferQueueFulfillAndEvaluateWithChange:v2];
}

- (void)handleObservedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMBuffer *)self _bufferQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__CAMBuffer_handleObservedNotification___block_invoke;
  v7[3] = &unk_263FA0408;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __40__CAMBuffer_handleObservedNotification___block_invoke(uint64_t a1)
{
  id v2 = [CAMBufferNotificationObservanceChange alloc];
  id v3 = [*(id *)(a1 + 32) name];
  id v4 = [*(id *)(a1 + 32) object];
  id v5 = [(CAMBufferNotificationObservanceChange *)v2 initWithNotification:v3 object:v4];

  [*(id *)(a1 + 40) _bufferQueueFulfillAndEvaluateWithChange:v5];
}

+ (id)keyPathsForValuesAffectingEnabled
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"bufferQueueEnabled"];
}

+ (id)keyPathsForValuesAffectingCurrentValue
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"bufferQueueCurrentValue"];
}

- (OS_dispatch_queue)_bufferQueue
{
  return self->__bufferQueue;
}

- (BOOL)isBufferQueueEnabled
{
  return self->_bufferQueueEnabled;
}

- (void)setBufferQueueEnabled:(BOOL)a3
{
  self->_bufferQueueEnabled = a3;
}

- (NSCopying)bufferQueueCurrentValue
{
  return self->_bufferQueueCurrentValue;
}

- (void)setBufferQueueCurrentValue:(id)a3
{
}

- (NSMutableArray)_bufferQueueBufferedValues
{
  return self->__bufferQueueBufferedValues;
}

- (NSMutableDictionary)_bufferQueueObservers
{
  return self->__bufferQueueObservers;
}

- (NSMutableArray)_bufferQueueObservances
{
  return self->__bufferQueueObservances;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__bufferQueueObservances, 0);
  objc_storeStrong((id *)&self->__bufferQueueObservers, 0);
  objc_storeStrong((id *)&self->__bufferQueueBufferedValues, 0);
  objc_storeStrong((id *)&self->_bufferQueueCurrentValue, 0);
  objc_storeStrong((id *)&self->__bufferQueue, 0);
}

@end