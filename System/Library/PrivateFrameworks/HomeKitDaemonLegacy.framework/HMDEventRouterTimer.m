@interface HMDEventRouterTimer
- (HMDEventRouterTimer)initWithQueue:(id)a3 interval:(double)a4 timerFireHandler:(id)a5;
- (HMFTimer)timer;
- (double)timeInterval;
- (id)timerFireHandler;
- (void)resume;
- (void)suspend;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDEventRouterTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_timerFireHandler, 0);
}

- (HMFTimer)timer
{
  return (HMFTimer *)objc_getProperty(self, a2, 16, 1);
}

- (id)timerFireHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (double)timeInterval
{
  v2 = [(HMDEventRouterTimer *)self timer];
  [v2 timeInterval];
  double v4 = v3;

  return v4;
}

- (void)timerDidFire:(id)a3
{
  double v3 = [(HMDEventRouterTimer *)self timerFireHandler];
  v3[2]();
}

- (void)suspend
{
  id v2 = [(HMDEventRouterTimer *)self timer];
  [v2 suspend];
}

- (void)resume
{
  id v2 = [(HMDEventRouterTimer *)self timer];
  [v2 resume];
}

- (HMDEventRouterTimer)initWithQueue:(id)a3 interval:(double)a4 timerFireHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDEventRouterTimer;
  v10 = [(HMDEventRouterTimer *)&v16 init];
  if (v10)
  {
    v11 = _Block_copy(v9);
    id timerFireHandler = v10->_timerFireHandler;
    v10->_id timerFireHandler = v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:8 options:a4];
    timer = v10->_timer;
    v10->_timer = (HMFTimer *)v13;

    [(HMFTimer *)v10->_timer setDelegateQueue:v8];
    [(HMFTimer *)v10->_timer setDelegate:v10];
  }

  return v10;
}

@end