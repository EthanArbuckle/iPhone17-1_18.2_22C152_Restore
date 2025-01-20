@interface __HMFOSUnfairLock
- (__HMFOSUnfairLock)initWithOptions:(unint64_t)a3;
- (void)assertNotOwner;
- (void)assertOwner;
- (void)lock;
- (void)performBlock:(id)a3;
- (void)unlock;
@end

@implementation __HMFOSUnfairLock

- (__HMFOSUnfairLock)initWithOptions:(unint64_t)a3
{
  char v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)__HMFOSUnfairLock;
  result = -[HMFUnfairLock initWithOptions:](&v5, sel_initWithOptions_);
  if (result)
  {
    result->_internal._os_unfair_lock_opaque = 0;
    result->_internalOptions = (v3 & 1) << 16;
  }
  return result;
}

- (void)performBlock:(id)a3
{
  if (a3)
  {
    v4 = (void (**)(void))a3;
    os_unfair_lock_lock_with_options();
    v4[2](v4);

    os_unfair_lock_unlock(&self->_internal);
  }
}

- (void)lock
{
}

- (void)unlock
{
}

- (void)assertOwner
{
}

- (void)assertNotOwner
{
}

@end