@interface NSLock
- (BOOL)lockBeforeDate:(NSDate *)limit;
- (BOOL)tryLock;
- (NSLock)init;
- (NSString)name;
- (id)description;
- (void)dealloc;
- (void)lock;
- (void)setName:(NSString *)name;
- (void)unlock;
@end

@implementation NSLock

- (void)unlock
{
  pthread_mutex_unlock(&self->_priv.m);
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
}

- (NSLock)init
{
  v2 = self;
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (pthread_mutex_init(&self->_priv.m, 0))
  {
    v4.receiver = v2;
    v4.super_class = (Class)NSLock;
    [(NSLock *)&v4 dealloc];
    return 0;
  }
  else
  {
    v2->_priv.n = 0;
  }
  return v2;
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
  v4.super_class = (Class)NSLock;
  [(NSLock *)&v4 dealloc];
}

- (void)setName:(NSString *)name
{
  n = self->_priv.n;
  if (n != name)
  {

    self->_priv.n = (NSString *)[(NSString *)name copy];
  }
}

- (BOOL)tryLock
{
  return pthread_mutex_trylock(&self->_priv.m) == 0;
}

- (BOOL)lockBeforeDate:(NSDate *)limit
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(NSDate *)limit timeIntervalSinceReferenceDate];
  double v5 = v4;
  p_priv = &self->_priv;
  cd = self->_priv.cd;
  if (cd) {
    goto LABEL_9;
  }
  v8 = (pthread_mutex_t *)malloc_type_malloc(0x70uLL, 0x1000040AC4F46D1uLL);
  cd = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v8;
  if (v8)
  {
    if (!pthread_mutex_init(v8, 0))
    {
      if (!pthread_cond_init((pthread_cond_t *)((char *)cd + 64), 0)) {
        goto LABEL_7;
      }
      pthread_mutex_destroy((pthread_mutex_t *)cd);
    }
    free(cd);
    cd = 0;
  }
LABEL_7:
  uint64_t v9 = 0;
  atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_priv.cd, (unint64_t *)&v9, (unint64_t)cd);
  if (v9)
  {
    pthread_cond_destroy((pthread_cond_t *)((char *)cd + 64));
    pthread_mutex_destroy((pthread_mutex_t *)cd);
    free(cd);
    cd = self->_priv.cd;
  }
LABEL_9:
  pthread_mutex_lock((pthread_mutex_t *)cd);
  if (pthread_mutex_trylock(&self->_priv.m) == 16)
  {
    do
    {
      double v10 = v5 - CFAbsoluteTimeGetCurrent();
      BOOL v11 = v10 >= 0.0;
      if (v10 < 0.0) {
        break;
      }
      v13.tv_sec = vcvtmd_s64_f64(v10);
      v13.tv_nsec = (int)((v10 - floor(v10)) * 1000000000.0);
      pthread_cond_timedwait_relative_np((pthread_cond_t *)((char *)cd + 64), (pthread_mutex_t *)cd, &v13);
    }
    while (pthread_mutex_trylock(&p_priv->m) == 16);
  }
  else
  {
    BOOL v11 = 1;
  }
  pthread_mutex_unlock((pthread_mutex_t *)cd);
  return v11;
}

- (id)description
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSLock;
  id v3 = [(NSLock *)&v8 description];
  double v4 = "'";
  n = self->_priv.n;
  if (!n) {
    double v4 = "";
  }
  v6 = (NSString *)@"nil";
  if (n) {
    v6 = self->_priv.n;
  }
  return +[NSString stringWithFormat:@"%@{name = %s%@%s}", v3, v4, v6, v4];
}

- (NSString)name
{
  return self->_priv.n;
}

@end