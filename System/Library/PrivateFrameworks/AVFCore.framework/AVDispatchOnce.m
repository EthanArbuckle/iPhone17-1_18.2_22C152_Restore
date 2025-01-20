@interface AVDispatchOnce
- (AVDispatchOnce)init;
- (void)runBlockOnce:(id)a3;
@end

@implementation AVDispatchOnce

- (void)runBlockOnce:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_testFlag)
  {
    self->_testFlag = 1;
    (*((void (**)(id))a3 + 2))(a3);
  }
  os_unfair_lock_unlock(p_lock);
}

- (AVDispatchOnce)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVDispatchOnce;
  result = [(AVDispatchOnce *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

@end