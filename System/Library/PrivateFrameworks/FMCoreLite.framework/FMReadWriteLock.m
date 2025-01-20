@interface FMReadWriteLock
- (FMReadWriteLock)init;
- (FMReadWriteLock)initWithLockName:(id)a3;
- (NSString)lockName;
- (_opaque_pthread_rwlock_t)lock;
- (void)performWithReadLock:(id)a3;
- (void)performWithWriteLock:(id)a3;
- (void)setLock:(_opaque_pthread_rwlock_t *)a3;
- (void)setLockName:(id)a3;
@end

@implementation FMReadWriteLock

- (FMReadWriteLock)init
{
  return [(FMReadWriteLock *)self initWithLockName:&stru_1F0B11478];
}

- (FMReadWriteLock)initWithLockName:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FMReadWriteLock;
  v6 = [(FMReadWriteLock *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lockName, a3);
    int v8 = pthread_rwlock_init(&v7->_lock, 0);
    if (v8)
    {
      int v9 = v8;
      v10 = LogCategory_Unspecified();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        [(FMReadWriteLock *)(uint64_t)v5 initWithLockName:v10];
      }
    }
  }

  return v7;
}

- (void)performWithReadLock:(id)a3
{
  v4 = (void (**)(void))a3;
  int v5 = pthread_rwlock_rdlock(&self->_lock);
  if (v5)
  {
    v6 = LogCategory_Unspecified();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[FMReadWriteLock performWithReadLock:](self);
    }
  }
  v4[2](v4);
  if (!v5) {
    pthread_rwlock_unlock(&self->_lock);
  }
}

- (void)performWithWriteLock:(id)a3
{
  v4 = (void (**)(void))a3;
  int v5 = pthread_rwlock_wrlock(&self->_lock);
  if (v5)
  {
    v6 = LogCategory_Unspecified();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[FMReadWriteLock performWithWriteLock:](self);
    }
  }
  v4[2](v4);
  if (!v5) {
    pthread_rwlock_unlock(&self->_lock);
  }
}

- (NSString)lockName
{
  return self->_lockName;
}

- (void)setLockName:(id)a3
{
}

- (_opaque_pthread_rwlock_t)lock
{
  long long v3 = *(_OWORD *)&self->__opaque[184];
  *(_OWORD *)&retstr->__opaque[152] = *(_OWORD *)&self->__opaque[168];
  *(_OWORD *)&retstr->__opaque[168] = v3;
  *(void *)&retstr->__opaque[184] = *(void *)self[1].__opaque;
  long long v4 = *(_OWORD *)&self->__opaque[120];
  *(_OWORD *)&retstr->__opaque[88] = *(_OWORD *)&self->__opaque[104];
  *(_OWORD *)&retstr->__opaque[104] = v4;
  long long v5 = *(_OWORD *)&self->__opaque[152];
  *(_OWORD *)&retstr->__opaque[120] = *(_OWORD *)&self->__opaque[136];
  *(_OWORD *)&retstr->__opaque[136] = v5;
  long long v6 = *(_OWORD *)&self->__opaque[56];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self->__opaque[40];
  *(_OWORD *)&retstr->__opaque[40] = v6;
  long long v7 = *(_OWORD *)&self->__opaque[88];
  *(_OWORD *)&retstr->__opaque[56] = *(_OWORD *)&self->__opaque[72];
  *(_OWORD *)&retstr->__opaque[72] = v7;
  long long v8 = *(_OWORD *)&self->__opaque[24];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self->__opaque[8];
  *(_OWORD *)&retstr->__opaque[8] = v8;
  return self;
}

- (void)setLock:(_opaque_pthread_rwlock_t *)a3
{
  *(_OWORD *)&self->_lock.__sig = *(_OWORD *)&a3->__sig;
  long long v3 = *(_OWORD *)&a3->__opaque[8];
  long long v4 = *(_OWORD *)&a3->__opaque[24];
  long long v5 = *(_OWORD *)&a3->__opaque[56];
  *(_OWORD *)&self->_lock.__opaque[40] = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_lock.__opaque[56] = v5;
  *(_OWORD *)&self->_lock.__opaque[8] = v3;
  *(_OWORD *)&self->_lock.__opaque[24] = v4;
  long long v6 = *(_OWORD *)&a3->__opaque[72];
  long long v7 = *(_OWORD *)&a3->__opaque[88];
  long long v8 = *(_OWORD *)&a3->__opaque[120];
  *(_OWORD *)&self->_lock.__opaque[104] = *(_OWORD *)&a3->__opaque[104];
  *(_OWORD *)&self->_lock.__opaque[120] = v8;
  *(_OWORD *)&self->_lock.__opaque[72] = v6;
  *(_OWORD *)&self->_lock.__opaque[88] = v7;
  long long v9 = *(_OWORD *)&a3->__opaque[136];
  long long v10 = *(_OWORD *)&a3->__opaque[152];
  long long v11 = *(_OWORD *)&a3->__opaque[168];
  *(void *)&self->_lock.__opaque[184] = *(void *)&a3->__opaque[184];
  *(_OWORD *)&self->_lock.__opaque[152] = v10;
  *(_OWORD *)&self->_lock.__opaque[168] = v11;
  *(_OWORD *)&self->_lock.__opaque[136] = v9;
}

- (void).cxx_destruct
{
}

- (void)initWithLockName:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_1B2FB9000, log, OS_LOG_TYPE_ERROR, "Error initializing the lock '%@': %d", (uint8_t *)&v3, 0x12u);
}

- (void)performWithReadLock:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 lockName];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B2FB9000, v2, v3, "Error obtaining read lock '%@': %d", v4, v5, v6, v7, v8);
}

- (void)performWithWriteLock:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 lockName];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B2FB9000, v2, v3, "Error obtaining write lock '%@': %d", v4, v5, v6, v7, v8);
}

@end