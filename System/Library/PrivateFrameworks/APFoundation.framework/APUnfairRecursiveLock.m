@interface APUnfairRecursiveLock
- (APUnfairRecursiveLock)init;
- (void)lock;
- (void)unlock;
@end

@implementation APUnfairRecursiveLock

- (void)unlock
{
}

- (void)lock
{
}

- (APUnfairRecursiveLock)init
{
  v3.receiver = self;
  v3.super_class = (Class)APUnfairRecursiveLock;
  result = [(APUnfairRecursiveLock *)&v3 init];
  if (result) {
    result->_lock = 0;
  }
  return result;
}

@end