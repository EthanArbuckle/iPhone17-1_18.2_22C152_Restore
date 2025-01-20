@interface GKRWLock
- (GKRWLock)init;
- (int)tryrdlock;
- (void)dealloc;
- (void)rdlock;
- (void)unlock;
- (void)wrlock;
@end

@implementation GKRWLock

- (GKRWLock)init
{
  v5.receiver = self;
  v5.super_class = (Class)GKRWLock;
  v2 = [(GKRWLock *)&v5 init];
  v3 = v2;
  if (v2) {
    pthread_rwlock_init(&v2->_rwLock, 0);
  }
  return v3;
}

- (void)dealloc
{
  pthread_rwlock_destroy(&self->_rwLock);
  v3.receiver = self;
  v3.super_class = (Class)GKRWLock;
  [(GKRWLock *)&v3 dealloc];
}

- (void)wrlock
{
}

- (int)tryrdlock
{
  return pthread_rwlock_tryrdlock(&self->_rwLock);
}

- (void)rdlock
{
}

- (void)unlock
{
}

@end