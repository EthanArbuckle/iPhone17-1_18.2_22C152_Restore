@interface _NSBarrierOperation
+ (BOOL)_removesDependenciesAfterFinish;
- (int64_t)queuePriority;
- (void)dealloc;
- (void)main;
@end

@implementation _NSBarrierOperation

- (void)main
{
  p_lock = &self->super._iop.__lock;
  os_unfair_lock_lock(&self->super._iop.__lock);
  block = (void (**)(void))self->_block;
  self->_block = 0;
  os_unfair_lock_unlock(p_lock);
  block[2]();
}

+ (BOOL)_removesDependenciesAfterFinish
{
  return 1;
}

- (int64_t)queuePriority
{
  return 12;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSBarrierOperation;
  [(NSOperation *)&v3 dealloc];
}

@end