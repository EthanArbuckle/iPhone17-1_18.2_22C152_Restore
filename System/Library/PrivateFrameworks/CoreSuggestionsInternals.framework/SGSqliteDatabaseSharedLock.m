@interface SGSqliteDatabaseSharedLock
- (SGSqliteDatabaseSharedLock)init;
- (int64_t)writeTransactionDepth;
- (void)dealloc;
- (void)runWithLockAcquired:(id)a3;
@end

@implementation SGSqliteDatabaseSharedLock

- (int64_t)writeTransactionDepth
{
  return self->_writeTransactionDepth;
}

- (void)runWithLockAcquired:(id)a3
{
  v4 = (void (**)(void))a3;
  pthread_mutex_lock(&self->_lock);
  ++self->_writeTransactionDepth;
  v4[2]();
  --self->_writeTransactionDepth;
  pthread_mutex_unlock(&self->_lock);
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)SGSqliteDatabaseSharedLock;
  [(SGSqliteDatabaseSharedLock *)&v3 dealloc];
}

- (SGSqliteDatabaseSharedLock)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)SGSqliteDatabaseSharedLock;
  v2 = [(SGSqliteDatabaseSharedLock *)&v5 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_writeTransactionDepth = 0;
    v6.__sig = 0;
    *(void *)v6.__opaque = 0;
    pthread_mutexattr_init(&v6);
    pthread_mutexattr_settype(&v6, 2);
    pthread_mutex_init(&v3->_lock, &v6);
    pthread_mutexattr_destroy(&v6);
  }
  return v3;
}

@end