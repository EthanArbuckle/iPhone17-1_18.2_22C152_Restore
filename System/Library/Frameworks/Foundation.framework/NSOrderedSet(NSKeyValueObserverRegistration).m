@interface NSOrderedSet(NSKeyValueObserverRegistration)
- (void)addObserver:()NSKeyValueObserverRegistration forKeyPath:options:context:;
- (void)removeObserver:()NSKeyValueObserverRegistration forKeyPath:;
- (void)removeObserver:()NSKeyValueObserverRegistration forKeyPath:context:;
@end

@implementation NSOrderedSet(NSKeyValueObserverRegistration)

- (void)addObserver:()NSKeyValueObserverRegistration forKeyPath:options:context:
{
  v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[<%@ %p> addObserver:forKeyPath:options:context:] is not supported. Key path: %@", objc_opt_class(), a1, a4), 0 reason userInfo];
  objc_exception_throw(v4);
}

- (void)removeObserver:()NSKeyValueObserverRegistration forKeyPath:context:
{
  v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[<%@ %p> removeObserver:forKeyPath:context:] is not supported. Key path: %@", objc_opt_class(), a1, a4), 0 reason userInfo];
  objc_exception_throw(v4);
}

- (void)removeObserver:()NSKeyValueObserverRegistration forKeyPath:
{
  v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[<%@ %p> removeObserver:forKeyPath:] is not supported. Key path: %@", objc_opt_class(), a1, a4), 0 reason userInfo];
  objc_exception_throw(v4);
}

@end