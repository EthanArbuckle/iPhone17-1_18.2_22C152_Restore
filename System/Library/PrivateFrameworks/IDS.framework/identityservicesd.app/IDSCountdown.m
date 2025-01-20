@interface IDSCountdown
- (BOOL)_criticalIsCountingDown;
- (BOOL)isCountingDown;
- (BOOL)startCountingDown;
- (IDSCountdown)initWithTimeInterval:(double)a3;
- (void)dealloc;
@end

@implementation IDSCountdown

- (void)dealloc
{
  pthread_mutex_destroy(&self->_startDateMutex);
  v3.receiver = self;
  v3.super_class = (Class)IDSCountdown;
  [(IDSCountdown *)&v3 dealloc];
}

- (IDSCountdown)initWithTimeInterval:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IDSCountdown;
  v4 = [(IDSCountdown *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_timeInterval = a3;
    pthread_mutex_init(&v4->_startDateMutex, 0);
  }
  return v5;
}

- (BOOL)startCountingDown
{
  p_startDateMutex = &self->_startDateMutex;
  pthread_mutex_lock(&self->_startDateMutex);
  unsigned __int8 v4 = [(IDSCountdown *)self _criticalIsCountingDown];
  if ((v4 & 1) == 0)
  {
    v5 = (NSDate *)objc_alloc_init((Class)NSDate);
    startDate = self->_startDate;
    self->_startDate = v5;
  }
  pthread_mutex_unlock(p_startDateMutex);
  return v4 ^ 1;
}

- (BOOL)isCountingDown
{
  v2 = self;
  p_startDateMutex = &self->_startDateMutex;
  pthread_mutex_lock(&self->_startDateMutex);
  LOBYTE(v2) = [(IDSCountdown *)v2 _criticalIsCountingDown];
  pthread_mutex_unlock(p_startDateMutex);
  return (char)v2;
}

- (BOOL)_criticalIsCountingDown
{
  p_startDate = (id *)&self->_startDate;
  if (self->_startDate)
  {
    unsigned __int8 v4 = +[NSDate date];
    [v4 timeIntervalSinceDate:self->_startDate];
    double v6 = v5;

    double timeInterval = self->_timeInterval;
    BOOL v8 = timeInterval - v6 > 2.22044605e-16 && timeInterval - v6 <= timeInterval;
    if (v8) {
      id v9 = *p_startDate;
    }
    else {
      id v9 = 0;
    }
    objc_storeStrong(p_startDate, v9);
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (void).cxx_destruct
{
}

@end