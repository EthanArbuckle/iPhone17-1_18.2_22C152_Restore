@interface ASDUnfairLock
- (ASDUnfairLock)init;
- (void)lock;
- (void)unlock;
@end

@implementation ASDUnfairLock

- (void)unlock
{
}

- (void)lock
{
}

- (ASDUnfairLock)init
{
  v3.receiver = self;
  v3.super_class = (Class)ASDUnfairLock;
  result = [(ASDUnfairLock *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

@end