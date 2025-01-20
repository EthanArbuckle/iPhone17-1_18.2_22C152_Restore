@interface AVWeakReferencingDelegateStorage
+ (void)initialize;
- (AVWeakReferencingDelegateStorage)init;
- (OS_dispatch_queue)delegateQueue;
- (id)_delegate;
- (id)delegate;
- (void)_collectUncollectables;
- (void)_setDelegateViaWeakReference:(id)a3;
- (void)dealloc;
- (void)getRetainedDelegate:(id *)a3 retainedDelegateQueue:(id *)a4;
- (void)invokeDelegateCallbackWithBlock:(id)a3;
- (void)invokeDelegateCallbackWithBlock:(id)a3 synchronouslyIfDelegateQueueIsQueue:(id)a4;
- (void)setDelegate:(id)a3 queue:(id)a4;
@end

@implementation AVWeakReferencingDelegateStorage

- (void)dealloc
{
  [(AVWeakReferencingDelegateStorage *)self _collectUncollectables];
  v3.receiver = self;
  v3.super_class = (Class)AVWeakReferencingDelegateStorage;
  [(AVWeakReferencingDelegateStorage *)&v3 dealloc];
}

- (void)_collectUncollectables
{
  delegateReadWriteQueue = self->_delegateReadWriteQueue;
  if (delegateReadWriteQueue) {
    dispatch_release(delegateReadWriteQueue);
  }
  if (self->_detectorForWeakReferenceToDelegate) {
    FigConcurrentAccessDetectorDestroy();
  }
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
  }
}

void __78__AVWeakReferencingDelegateStorage_getRetainedDelegate_retainedDelegateQueue___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (id)[*(id *)(a1 + 32) _delegate];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = *(void *)(*(void *)(a1 + 32) + 32);
  v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v2)
  {
    dispatch_retain(v2);
  }
}

- (id)_delegate
{
  if (MEMORY[0x1E4F1EB48]) {
    FigConcurrentAccessDetectorBeginReading();
  }
  id v3 = [(AVWeakReference *)self->_weakReferenceToDelegate referencedObject];
  if (MEMORY[0x1E4F1EB58]) {
    FigConcurrentAccessDetectorEndReading();
  }
  return v3;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  if (!a3 && a4)
  {
    v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)a4, v4, v5, v6, v7, (uint64_t)"newDelegateQueue == NULL"), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  if (a4) {
    dispatch_retain((dispatch_object_t)a4);
  }
  v11 = [[AVWeakReference alloc] initWithReferencedObject:a3];
  delegateReadWriteQueue = self->_delegateReadWriteQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__AVWeakReferencingDelegateStorage_setDelegate_queue___block_invoke;
  block[3] = &unk_1E57B2138;
  block[4] = self;
  block[5] = v11;
  block[6] = a4;
  av_readwrite_dispatch_queue_write_async(delegateReadWriteQueue, block);
}

void __54__AVWeakReferencingDelegateStorage_setDelegate_queue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setDelegateViaWeakReference:*(void *)(a1 + 40)];
  v2 = *(NSObject **)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 32);
  if (v2 != v4)
  {
    *(void *)(v3 + 32) = v2;
    v2 = v4;
  }
  if (v2)
  {
    dispatch_release(v2);
  }
}

- (void)_setDelegateViaWeakReference:(id)a3
{
  if (MEMORY[0x1E4F1EB50]) {
    FigConcurrentAccessDetectorBeginWriting();
  }
  id v5 = a3;

  self->_weakReferenceToDelegate = (AVWeakReference *)a3;
  if (MEMORY[0x1E4F1EB60]) {
    FigConcurrentAccessDetectorEndWriting();
  }
}

- (OS_dispatch_queue)delegateQueue
{
  dispatch_object_t object = 0;
  [(AVWeakReferencingDelegateStorage *)self getRetainedDelegate:0 retainedDelegateQueue:&object];
  result = (OS_dispatch_queue *)object;
  if (object)
  {
    dispatch_release(object);
    return (OS_dispatch_queue *)object;
  }
  return result;
}

- (id)delegate
{
  id v3 = 0;
  [(AVWeakReferencingDelegateStorage *)self getRetainedDelegate:&v3 retainedDelegateQueue:0];
  return v3;
}

- (void)getRetainedDelegate:(id *)a3 retainedDelegateQueue:(id *)a4
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__27;
  v21 = __Block_byref_object_dispose__27;
  uint64_t v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__27;
  v15 = __Block_byref_object_dispose__27;
  uint64_t v16 = 0;
  delegateReadWriteQueue = self->_delegateReadWriteQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__AVWeakReferencingDelegateStorage_getRetainedDelegate_retainedDelegateQueue___block_invoke;
  block[3] = &unk_1E57B3888;
  block[4] = self;
  block[5] = &v17;
  block[6] = &v11;
  av_readwrite_dispatch_queue_read(delegateReadWriteQueue, block);
  if (a3) {
    *a3 = (id)v18[5];
  }
  if (a4)
  {
    uint64_t v7 = v12[5];
    if (v7)
    {
      dispatch_retain(v7);
      v8 = (void *)v12[5];
    }
    else
    {
      v8 = 0;
    }
    *a4 = v8;
  }

  v9 = v12[5];
  if (v9) {
    dispatch_release(v9);
  }
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
}

- (void)invokeDelegateCallbackWithBlock:(id)a3 synchronouslyIfDelegateQueueIsQueue:(id)a4
{
}

- (void)invokeDelegateCallbackWithBlock:(id)a3
{
}

+ (void)initialize
{
}

- (AVWeakReferencingDelegateStorage)init
{
  v7.receiver = self;
  v7.super_class = (Class)AVWeakReferencingDelegateStorage;
  v2 = [(AVWeakReferencingDelegateStorage *)&v7 init];
  if (v2)
  {
    id v3 = NSString;
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = (const char *)[(id)objc_msgSend(v3 stringWithFormat:@"<%@: %p> delegate serialization queue", NSStringFromClass(v4), v2), "UTF8String"];
    v2->_delegateReadWriteQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create(v5);
    v2->_detectorForWeakReferenceToDelegate = (OpaqueConcurrentAccessDetector *)FigConcurrentAccessDetectorCreate();
  }
  return v2;
}

@end