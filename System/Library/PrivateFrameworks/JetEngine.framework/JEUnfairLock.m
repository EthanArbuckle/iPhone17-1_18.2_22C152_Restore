@interface JEUnfairLock
+ (void)initialize;
- (JEUnfairLock)init;
- (void)lock;
- (void)unlock;
@end

@implementation JEUnfairLock

- (void)lock
{
}

- (void)unlock
{
}

- (JEUnfairLock)init
{
  v3.receiver = self;
  v3.super_class = (Class)JEUnfairLock;
  result = [(JEUnfairLock *)&v3 init];
  if (result) {
    result->_unfairLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() != a1)
  {
    v2 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v3 = *MEMORY[0x1E4F1C3B8];
    [v2 raise:v3 format:@"JEUnfairLock (aka UnfairLock) does not allow subclassing."];
  }
}

@end