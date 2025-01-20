@interface NSRecursiveLock
+ (NSRecursiveLock)allocWithZone:(_NSZone *)a3;
- (BOOL)isLocking;
- (BOOL)lockBeforeDate:(NSDate *)limit;
- (BOOL)tryLock;
- (NSRecursiveLock)init;
- (NSString)name;
- (id)description;
- (void)dealloc;
- (void)lock;
- (void)setName:(NSString *)name;
- (void)unlock;
@end

@implementation NSRecursiveLock

+ (NSRecursiveLock)allocWithZone:(_NSZone *)a3
{
  return (NSRecursiveLock *)NSAllocateObject((Class)a1, 0x60uLL, a3);
}

- (void)unlock
{
  p_priv = &self->_priv;
  unint64_t v4 = self->_priv.cnt - 1;
  self->_priv.cnt = v4;
  if (!v4) {
    self->_priv.t = 0;
  }
  pthread_mutex_unlock(&p_priv->m);
  cd = self->_priv.cd;
  if (cd)
  {
    pthread_mutex_lock((pthread_mutex_t *)cd);
    pthread_cond_broadcast((pthread_cond_t *)((char *)cd + 64));
    pthread_mutex_unlock((pthread_mutex_t *)cd);
  }
}

- (void)lock
{
  pthread_mutex_lock(&self->_priv.m);
  v3 = pthread_self();
  unint64_t v4 = self->_priv.cnt + 1;
  self->_priv.t = v3;
  self->_priv.cnt = v4;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  pthread_mutex_destroy(&self->_priv.m);
  cd = self->_priv.cd;
  if (cd)
  {
    pthread_cond_destroy((pthread_cond_t *)((char *)cd + 64));
    pthread_mutex_destroy((pthread_mutex_t *)cd);
    free(cd);
  }

  v4.receiver = self;
  v4.super_class = (Class)NSRecursiveLock;
  [(NSRecursiveLock *)&v4 dealloc];
}

- (NSRecursiveLock)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (_MergedGlobals_107 != -1) {
    dispatch_once(&_MergedGlobals_107, &__block_literal_global_24);
  }
  if (pthread_mutex_init(&self->_priv.m, &stru_1EB1ED3C8))
  {
    v4.receiver = self;
    v4.super_class = (Class)NSRecursiveLock;
    [(NSRecursiveLock *)&v4 dealloc];
    return 0;
  }
  else
  {
    self->_priv.n = 0;
    self->_priv.t = 0;
    self->_priv.cnt = 0;
  }
  return self;
}

uint64_t __23__NSRecursiveLock_init__block_invoke()
{
  pthread_mutexattr_init(&stru_1EB1ED3C8);

  return pthread_mutexattr_settype(&stru_1EB1ED3C8, 2);
}

- (BOOL)tryLock
{
  int v3 = pthread_mutex_trylock(&self->_priv.m);
  if (!v3)
  {
    objc_super v4 = pthread_self();
    unint64_t v5 = self->_priv.cnt + 1;
    self->_priv.t = v4;
    self->_priv.cnt = v5;
  }
  return v3 == 0;
}

- (void)setName:(NSString *)name
{
  n = self->_priv.n;
  if (n != name)
  {

    self->_priv.n = (NSString *)[(NSString *)name copy];
  }
}

- (BOOL)lockBeforeDate:(NSDate *)limit
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(NSDate *)limit timeIntervalSinceReferenceDate];
  double v5 = v4;
  cd = self->_priv.cd;
  if (!cd)
  {
    v7 = (pthread_mutex_t *)malloc_type_malloc(0x70uLL, 0x1000040AC4F46D1uLL);
    cd = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v7;
    if (!v7) {
      goto LABEL_7;
    }
    if (!pthread_mutex_init(v7, 0))
    {
      if (!pthread_cond_init((pthread_cond_t *)((char *)cd + 64), 0)) {
        goto LABEL_7;
      }
      pthread_mutex_destroy((pthread_mutex_t *)cd);
    }
    free(cd);
    cd = 0;
LABEL_7:
    uint64_t v8 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_priv.cd, (unint64_t *)&v8, (unint64_t)cd);
    if (v8)
    {
      pthread_cond_destroy((pthread_cond_t *)((char *)cd + 64));
      pthread_mutex_destroy((pthread_mutex_t *)cd);
      free(cd);
      cd = self->_priv.cd;
    }
  }
  pthread_mutex_lock((pthread_mutex_t *)cd);
  if (pthread_mutex_trylock(&self->_priv.m) == 16)
  {
    while (1)
    {
      double v9 = v5 - CFAbsoluteTimeGetCurrent();
      if (v9 < 0.0) {
        break;
      }
      v13.tv_sec = vcvtmd_s64_f64(v9);
      v13.tv_nsec = (int)((v9 - floor(v9)) * 1000000000.0);
      pthread_cond_timedwait_relative_np((pthread_cond_t *)((char *)cd + 64), (pthread_mutex_t *)cd, &v13);
      if (pthread_mutex_trylock(&self->_priv.m) != 16) {
        goto LABEL_12;
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)cd);
    return 0;
  }
  else
  {
LABEL_12:
    pthread_mutex_unlock((pthread_mutex_t *)cd);
    v10 = pthread_self();
    unint64_t v11 = self->_priv.cnt + 1;
    self->_priv.t = v10;
    self->_priv.cnt = v11;
    return 1;
  }
}

- (id)description
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSRecursiveLock;
  id v3 = [(NSRecursiveLock *)&v8 description];
  double v4 = "'";
  n = self->_priv.n;
  if (!n) {
    double v4 = "";
  }
  v6 = (NSString *)@"nil";
  if (n) {
    v6 = self->_priv.n;
  }
  return +[NSString stringWithFormat:@"%@{recursion count = %ld, name = %s%@%s}", v3, self->_priv.cnt, v4, v6, v4];
}

- (NSString)name
{
  return self->_priv.n;
}

- (BOOL)isLocking
{
  if (pthread_equal(0, self->_priv.t)) {
    return 0;
  }
  double v4 = pthread_self();
  return pthread_equal(v4, self->_priv.t) != 0;
}

@end