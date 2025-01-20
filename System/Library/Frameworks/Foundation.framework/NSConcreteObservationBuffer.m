@interface NSConcreteObservationBuffer
- (BOOL)automaticallyEmitsObjects;
- (BOOL)isMemoryPressureSensitive;
- (NSConcreteObservationBuffer)initWithMaximumObjectCount:(unint64_t)a3 fullPolicy:(int64_t)a4 outputQueue:(id)a5;
- (id)bufferFullHandler;
- (void)_alreadyOnQueueEmitAllObjects;
- (void)_alreadyOnQueueEmitObject;
- (void)_receiveBox:(id)a3;
- (void)dealloc;
- (void)emitAllObjects;
- (void)emitObject;
- (void)setAutomaticallyEmitsObjects:(BOOL)a3;
- (void)setBufferFullHandler:(id)a3;
- (void)setMemoryPressureSensitive:(BOOL)a3;
@end

@implementation NSConcreteObservationBuffer

- (NSConcreteObservationBuffer)initWithMaximumObjectCount:(unint64_t)a3 fullPolicy:(int64_t)a4 outputQueue:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)NSConcreteObservationBuffer;
  v8 = -[NSObservationBuffer initWithMaximumObjectCount:fullPolicy:outputQueue:](&v10, sel_initWithMaximumObjectCount_fullPolicy_outputQueue_);
  if (v8)
  {
    v8->_dequeue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8->_policy = a4;
    v8->_maxCount = a3;
    v8->_outputQueue = (NSOperationQueue *)a5;
    v8->_inputQueue = (OS_dispatch_queue *)dispatch_queue_create("Input Queue", 0);
    v8->_automaticallyEmitsObjects = 1;
    pthread_mutex_init(&v8->_lock, 0);
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);

  self->_dequeue = 0;
  pthread_mutex_unlock(p_lock);

  dispatch_release((dispatch_object_t)self->_inputQueue);
  v4.receiver = self;
  v4.super_class = (Class)NSConcreteObservationBuffer;
  [(NSObservationSource *)&v4 dealloc];
}

- (void)_alreadyOnQueueEmitObject
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v3 = _popFront((uint64_t)self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v12 = __56__NSConcreteObservationBuffer__alreadyOnQueueEmitObject__block_invoke;
  v13 = &unk_1E51F76A8;
  v14 = self;
  v15[0] = 0;
  objc_super v4 = v3[1];
  int v5 = *((_DWORD *)v3 + 6);
  uint64_t StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(v15);
  MEMORY[0x1F4188790](StackObservedValueClassAndBoxSize);
  v9 = objc_constructInstance(v8, (char *)&v11[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9[6] = v5;
  *((void *)v9 + 1) = v4;
  *((void *)v9 + 2) = self;
  v12(v11, (uint64_t)v9);
}

id __56__NSConcreteObservationBuffer__alreadyOnQueueEmitObject__block_invoke(id result, uint64_t a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a2 + 24))
  {
    v2.receiver = (id)*((void *)result + 4);
    v2.super_class = (Class)NSConcreteObservationBuffer;
    return objc_msgSendSuper2(&v2, sel__receiveBox_, a2);
  }
  return result;
}

- (void)emitObject
{
  v3[5] = *MEMORY[0x1E4F143B8];
  outputQueue = self->_outputQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__NSConcreteObservationBuffer_emitObject__block_invoke;
  v3[3] = &unk_1E51F71D0;
  v3[4] = self;
  [(NSOperationQueue *)outputQueue addOperationWithBlock:v3];
}

uint64_t __41__NSConcreteObservationBuffer_emitObject__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _alreadyOnQueueEmitObject];
}

- (void)_alreadyOnQueueEmitAllObjects
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_suspend((dispatch_object_t)self->_inputQueue);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v9 = __60__NSConcreteObservationBuffer__alreadyOnQueueEmitAllObjects__block_invoke;
  objc_super v10 = &unk_1E51FAEA0;
  uint64_t v11 = self;
  if (self->_state)
  {
    pthread_mutex_lock(&self->_lock);
    uint64_t v3 = (void *)[(NSMutableArray *)self->_dequeue copy];
    [(NSMutableArray *)self->_dequeue removeAllObjects];
    int updated = updateState((uint64_t)self);
    pthread_mutex_unlock(&self->_lock);
    if (updated == 2 || updated == 1) {
      (*(void (**)(void))([(NSConcreteObservationBuffer *)self bufferFullHandler] + 16))();
    }
    memset(v12, 0, sizeof(v12));
    unint64_t v5 = [v3 count];
    unint64_t v6 = v5;
    uint64_t v7 = (uint64_t *)v12;
    if (v5 >= 0x21) {
      uint64_t v7 = (uint64_t *)malloc_type_malloc(8 * v5, 0x80040B8603338uLL);
    }
    objc_msgSend(v3, "getObjects:range:", v7, 0, v6);
    v9((uint64_t)v8, v7, v6);
    if (v7 != (uint64_t *)v12) {
      free(v7);
    }
  }
  else
  {
    __60__NSConcreteObservationBuffer__alreadyOnQueueEmitAllObjects__block_invoke((uint64_t)v8, (uint64_t *)&emptyValue, 1);
  }
  dispatch_resume((dispatch_object_t)self->_inputQueue);
}

uint64_t __60__NSConcreteObservationBuffer__alreadyOnQueueEmitAllObjects__block_invoke(uint64_t result, uint64_t *a2, uint64_t a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v3 = a3;
    uint64_t v5 = result;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    do
    {
      uint64_t v6 = *a2++;
      uint64_t v7 = *(void *)(v5 + 32);
      v15[0] = v14;
      v15[1] = 3221225472;
      v16 = __60__NSConcreteObservationBuffer__alreadyOnQueueEmitAllObjects__block_invoke_2;
      v17 = &unk_1E51F76A8;
      uint64_t v18 = v7;
      v19[0] = 0;
      uint64_t v8 = *(void *)(v6 + 8);
      int v9 = *(_DWORD *)(v6 + 24);
      uint64_t StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(v19);
      MEMORY[0x1F4188790](StackObservedValueClassAndBoxSize);
      uint64_t v13 = objc_constructInstance(v12, (char *)&v15[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
      v13[6] = v9;
      *((void *)v13 + 1) = v8;
      *((void *)v13 + 2) = v7;
      result = (uint64_t)v16(v15, (uint64_t)v13);
      --v3;
    }
    while (v3);
  }
  return result;
}

id __60__NSConcreteObservationBuffer__alreadyOnQueueEmitAllObjects__block_invoke_2(id result, uint64_t a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a2 + 24))
  {
    v2.receiver = (id)*((void *)result + 4);
    v2.super_class = (Class)NSConcreteObservationBuffer;
    return objc_msgSendSuper2(&v2, sel__receiveBox_, a2);
  }
  return result;
}

- (void)emitAllObjects
{
  v3[5] = *MEMORY[0x1E4F143B8];
  outputQueue = self->_outputQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__NSConcreteObservationBuffer_emitAllObjects__block_invoke;
  v3[3] = &unk_1E51F71D0;
  v3[4] = self;
  [(NSOperationQueue *)outputQueue addOperationWithBlock:v3];
}

uint64_t __45__NSConcreteObservationBuffer_emitAllObjects__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _alreadyOnQueueEmitAllObjects];
}

- (void)_receiveBox:(id)a3
{
  v8[6] = *MEMORY[0x1E4F143B8];
  if (self->_state == 2)
  {
    int64_t policy = self->_policy;
    if (policy == 2)
    {
      [(NSConcreteObservationBuffer *)self _mergeChanges];
    }
    else if (policy == 1)
    {
      do
        _popFront((uint64_t)self);
      while (self->_state == 2);
    }
  }
  uint64_t v6 = [a3 copyToHeap];
  v8[0] = 0;
  v8[1] = v8;
  void v8[2] = 0x3052000000;
  v8[3] = __Block_byref_object_copy__19;
  v8[4] = __Block_byref_object_dispose__19;
  v8[5] = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__NSConcreteObservationBuffer__receiveBox___block_invoke;
  block[3] = &unk_1E51FAD90;
  block[4] = v6;
  block[5] = v8;
  dispatch_sync((dispatch_queue_t)self->_inputQueue, block);
  _Block_object_dispose(v8, 8);
}

uint64_t __43__NSConcreteObservationBuffer__receiveBox___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40);
  if (v1)
  {
    uint64_t v2 = result;
    pthread_mutex_lock((pthread_mutex_t *)(v1 + 72));
    [*(id *)(v1 + 136) addObject:*(void *)(v2 + 32)];

    int updated = updateState(v1);
    result = pthread_mutex_unlock((pthread_mutex_t *)(v1 + 72));
    if (updated == 2 || updated == 1)
    {
      objc_super v4 = *(uint64_t (**)(void))([(id)v1 bufferFullHandler] + 16);
      return v4();
    }
  }
  return result;
}

- (id)bufferFullHandler
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setBufferFullHandler:(id)a3
{
}

- (BOOL)automaticallyEmitsObjects
{
  return self->_automaticallyEmitsObjects;
}

- (void)setAutomaticallyEmitsObjects:(BOOL)a3
{
  self->_automaticallyEmitsObjects = a3;
}

- (BOOL)isMemoryPressureSensitive
{
  return self->_memoryPressureSensitive;
}

- (void)setMemoryPressureSensitive:(BOOL)a3
{
  self->_memoryPressureSensitive = a3;
}

@end