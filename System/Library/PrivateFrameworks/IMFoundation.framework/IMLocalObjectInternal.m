@interface IMLocalObjectInternal
- (void)dealloc;
@end

@implementation IMLocalObjectInternal

- (void)dealloc
{
  p_componentQueueLock = &self->_componentQueueLock;
  os_unfair_lock_lock(&self->_componentQueueLock);
  componentQueue = self->_componentQueue;
  if (componentQueue) {
    CFRelease(componentQueue);
  }
  os_unfair_lock_unlock(p_componentQueueLock);
  v5.receiver = self;
  v5.super_class = (Class)IMLocalObjectInternal;
  [(IMLocalObjectInternal *)&v5 dealloc];
}

@end