@interface BWPhotonicEngineNodeSampleBufferAndInputQueue
- (BWPhotonicEngineNodeSampleBufferAndInputQueue)init;
- (id)newDequeuedSampleBufferAndInput;
- (id)newSampleBuffersAndInputsWithPredicate:(id)a3;
- (void)dealloc;
- (void)enqueue:(id)a3;
@end

@implementation BWPhotonicEngineNodeSampleBufferAndInputQueue

- (BWPhotonicEngineNodeSampleBufferAndInputQueue)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWPhotonicEngineNodeSampleBufferAndInputQueue;
  v2 = [(BWPhotonicEngineNodeSampleBufferAndInputQueue *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_sampleBufferAndInputQueueLock._os_unfair_lock_opaque = 0;
    v2->_sampleBufferAndInputQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWPhotonicEngineNodeSampleBufferAndInputQueue;
  [(BWPhotonicEngineNodeSampleBufferAndInputQueue *)&v3 dealloc];
}

- (id)newDequeuedSampleBufferAndInput
{
  p_sampleBufferAndInputQueueLock = &self->_sampleBufferAndInputQueueLock;
  os_unfair_lock_lock(&self->_sampleBufferAndInputQueueLock);
  if ([(NSMutableArray *)self->_sampleBufferAndInputQueue count])
  {
    id v4 = (id)[(NSMutableArray *)self->_sampleBufferAndInputQueue firstObject];
    [(NSMutableArray *)self->_sampleBufferAndInputQueue removeObjectAtIndex:0];
  }
  else
  {
    id v4 = 0;
  }
  os_unfair_lock_unlock(p_sampleBufferAndInputQueueLock);
  return v4;
}

- (void)enqueue:(id)a3
{
  p_sampleBufferAndInputQueueLock = &self->_sampleBufferAndInputQueueLock;
  os_unfair_lock_lock(&self->_sampleBufferAndInputQueueLock);
  [(NSMutableArray *)self->_sampleBufferAndInputQueue addObject:a3];
  os_unfair_lock_unlock(p_sampleBufferAndInputQueueLock);
}

- (id)newSampleBuffersAndInputsWithPredicate:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    p_sampleBufferAndInputQueueLock = &self->_sampleBufferAndInputQueueLock;
    os_unfair_lock_lock(&self->_sampleBufferAndInputQueueLock);
    v6 = (void *)MEMORY[0x1A6272C70]();
    id v3 = (id)[(NSMutableArray *)self->_sampleBufferAndInputQueue filteredArrayUsingPredicate:v3];
    [(NSMutableArray *)self->_sampleBufferAndInputQueue removeObjectsInArray:v3];
    os_unfair_lock_unlock(p_sampleBufferAndInputQueueLock);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v3;
}

@end