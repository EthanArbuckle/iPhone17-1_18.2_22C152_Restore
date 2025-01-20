@interface ASDTCondition
+ (ASDTCondition)conditionWithName:(id)a3;
- (ASDTCondition)init;
- (BOOL)waitUntilTime:(ASDTTime *)a3;
- (NSString)name;
- (void)broadcast;
- (void)dealloc;
- (void)lock;
- (void)setName:(id)a3;
- (void)signal;
- (void)unlock;
- (void)wait;
@end

@implementation ASDTCondition

- (ASDTCondition)init
{
  v6.receiver = self;
  v6.super_class = (Class)ASDTCondition;
  v2 = [(ASDTCondition *)&v6 init];
  v3 = v2;
  if (v2)
  {
    pthread_cond_init(&v2->_cond, 0);
    pthread_mutex_init(&v3->_mutex, 0);
    v4 = v3;
  }

  return v3;
}

+ (ASDTCondition)conditionWithName:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setName:v4];

  return (ASDTCondition *)v5;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_mutex);
  pthread_cond_destroy(&self->_cond);
  v3.receiver = self;
  v3.super_class = (Class)ASDTCondition;
  [(ASDTCondition *)&v3 dealloc];
}

- (void)lock
{
}

- (void)unlock
{
}

- (void)wait
{
}

- (BOOL)waitUntilTime:(ASDTTime *)a3
{
  ASDTTime::machAbsoluteTime((ASDTTime *)self, (uint64_t)&v15);
  if ((uint64_t)v15 >= a3->nsec) {
    return 0;
  }
  p_cond = &self->_cond;
  p_mutex = &self->_mutex;
  do
  {
    long long v12 = *(_OWORD *)&a3->nsec;
    uint64_t v13 = *(void *)&a3->hostFrac;
    ASDTTime::operator-=((_anonymous_namespace_ **)&v12, (uint64_t *)&v15, v5, v6);
    v14.tv_sec = (uint64_t)v12 / 1000000000;
    v14.tv_nsec = (uint64_t)v12 % 1000000000;
    v9 = (ASDTTime *)pthread_cond_timedwait_relative_np(p_cond, p_mutex, &v14);
    BOOL v10 = v9 != 60;
    if (v9 != 60) {
      break;
    }
    ASDTTime::machAbsoluteTime(v9, (uint64_t)&v12);
    long long v15 = v12;
    uint64_t v16 = v13;
  }
  while ((uint64_t)v12 < a3->nsec);
  return v10;
}

- (void)signal
{
}

- (void)broadcast
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end