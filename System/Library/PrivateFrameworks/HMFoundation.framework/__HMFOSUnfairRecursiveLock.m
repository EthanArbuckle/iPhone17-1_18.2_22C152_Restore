@interface __HMFOSUnfairRecursiveLock
- (__HMFOSUnfairRecursiveLock)initWithOptions:(unint64_t)a3;
- (void)assertNotOwner;
- (void)assertOwner;
- (void)lock;
- (void)performBlock:(id)a3;
- (void)unlock;
@end

@implementation __HMFOSUnfairRecursiveLock

- (__HMFOSUnfairRecursiveLock)initWithOptions:(unint64_t)a3
{
  char v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)__HMFOSUnfairRecursiveLock;
  result = [(HMFUnfairLock *)&v5 initWithOptions:a3 | 2];
  if (result)
  {
    result->_internal = 0;
    result->_internalOptions = (v3 & 1) << 16;
  }
  return result;
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

- (void)performBlock:(id)a3
{
  if (a3)
  {
    char v3 = (void (**)(void))a3;
    os_unfair_recursive_lock_lock_with_options();
    v3[2](v3);

    os_unfair_recursive_lock_unlock();
  }
}

@end