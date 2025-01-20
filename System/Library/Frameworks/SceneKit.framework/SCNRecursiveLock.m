@interface SCNRecursiveLock
- (SCNRecursiveLock)init;
- (void)dealloc;
- (void)lock;
- (void)unlock;
@end

@implementation SCNRecursiveLock

- (void)lock
{
}

- (void)unlock
{
}

- (SCNRecursiveLock)init
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v4.receiver = self;
  v4.super_class = (Class)SCNRecursiveLock;
  v2 = [(SCNRecursiveLock *)&v4 init];
  if (v2)
  {
    v5.__sig = 0;
    *(void *)v5.__opaque = 0;
    pthread_mutexattr_init(&v5);
    pthread_mutexattr_settype(&v5, 2);
    pthread_mutexattr_setpolicy_np(&v5, 1);
    pthread_mutex_init(&v2->_mutex, &v5);
  }
  return v2;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_mutex);
  v3.receiver = self;
  v3.super_class = (Class)SCNRecursiveLock;
  [(SCNRecursiveLock *)&v3 dealloc];
}

@end