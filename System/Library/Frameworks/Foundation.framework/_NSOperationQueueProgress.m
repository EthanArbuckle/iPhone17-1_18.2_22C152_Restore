@interface _NSOperationQueueProgress
- (id)initWithQueue:(id)result;
- (void)setTotalUnitCount:(int64_t)a3;
@end

@implementation _NSOperationQueueProgress

- (id)initWithQueue:(id)result
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)_NSOperationQueueProgress;
    result = objc_msgSendSuper2(&v3, sel_initWithParent_userInfo_, 0, 0);
    if (result)
    {
      *((void *)result + 15) = a2;
      *((_DWORD *)result + 32) = 0;
    }
  }
  return result;
}

- (void)setTotalUnitCount:(int64_t)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)_NSOperationQueueProgress;
  [(NSProgress *)&v4 setTotalUnitCount:a3];
  os_unfair_lock_lock(&self->_queueLock);
  atomic_store(1u, &self->_queue->_iqp.__progressReporting);
  os_unfair_lock_unlock(&self->_queueLock);
}

@end