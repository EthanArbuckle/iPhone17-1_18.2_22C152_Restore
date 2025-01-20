@interface BWFencedAnimationQueue
- (BWFencedAnimationQueue)initWithQueueSize:(unsigned int)a3;
- (id)dequeueFencedAnimation;
- (unint64_t)count;
- (void)dealloc;
- (void)enqueueFencedAnimation:(id)a3;
- (void)flush;
@end

@implementation BWFencedAnimationQueue

- (id)dequeueFencedAnimation
{
  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  id v4 = (id)[(NSMutableArray *)self->_fencedAnimationQueue firstObject];
  if (v4)
  {
    [(NSMutableArray *)self->_fencedAnimationQueue removeObject:v4];
    os_unfair_lock_unlock(p_queueLock);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_fencedAnimationQueueSemaphore);
  }
  else
  {
    os_unfair_lock_unlock(p_queueLock);
  }
  return v4;
}

- (BWFencedAnimationQueue)initWithQueueSize:(unsigned int)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWFencedAnimationQueue;
  id v4 = [(BWFencedAnimationQueue *)&v6 init];
  if (v4)
  {
    v4->_fencedAnimationQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4->_fencedAnimationQueueSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(a3);
    v4->_fencedAnimationFramerateThrottle = 0;
    v4->_timeOfLastFencedAnimation = 0.0;
    v4->_queueLock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_fencedAnimationQueue count];
}

- (void)enqueueFencedAnimation:(id)a3
{
  if (self->_fencedAnimationFramerateThrottle)
  {
    double v5 = CFAbsoluteTimeGetCurrent() - self->_timeOfLastFencedAnimation;
    double v6 = (float)(1.0 / (float)self->_fencedAnimationFramerateThrottle);
    if (v5 < v6) {
      usleep(((v6 - v5) * 1000000.0));
    }
  }
  fencedAnimationQueueSemaphore = self->_fencedAnimationQueueSemaphore;
  dispatch_time_t v8 = dispatch_time(0, 500000000);
  if (!dispatch_semaphore_wait(fencedAnimationQueueSemaphore, v8))
  {
    os_unfair_lock_lock(&self->_queueLock);
    [(NSMutableArray *)self->_fencedAnimationQueue addObject:a3];
    os_unfair_lock_unlock(&self->_queueLock);
    self->_timeOfLastFencedAnimation = CFAbsoluteTimeGetCurrent();
  }
}

- (void)dealloc
{
  [(BWFencedAnimationQueue *)self flush];

  dispatch_release((dispatch_object_t)self->_fencedAnimationQueueSemaphore);
  v3.receiver = self;
  v3.super_class = (Class)BWFencedAnimationQueue;
  [(BWFencedAnimationQueue *)&v3 dealloc];
}

- (void)flush
{
  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  while ([(NSMutableArray *)self->_fencedAnimationQueue count])
  {
    [(NSMutableArray *)self->_fencedAnimationQueue removeObjectAtIndex:0];
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_fencedAnimationQueueSemaphore);
  }
  os_unfair_lock_unlock(p_queueLock);
}

@end