@interface PHIntervalTimer
+ (id)oneSecondTimer;
- (NSMutableSet)observers;
- (NSTimer)timer;
- (OS_dispatch_queue)queue;
- (PHIntervalTimer)init;
- (PHIntervalTimer)initWithInterval:(double)a3;
- (double)interval;
- (void)_createTimerIfNecessary;
- (void)_invalidateTimerIfNecessary;
- (void)_postNotification;
- (void)addObserver:(id)a3 selector:(SEL)a4;
- (void)dealloc;
- (void)fire;
- (void)pause;
- (void)removeObserver:(id)a3;
- (void)resume;
- (void)setInterval:(double)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation PHIntervalTimer

+ (id)oneSecondTimer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010B03C;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_1003263A0 != -1) {
    dispatch_once(&qword_1003263A0, block);
  }
  v2 = (void *)qword_100326398;

  return v2;
}

- (PHIntervalTimer)initWithInterval:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PHIntervalTimer;
  v4 = [(PHIntervalTimer *)&v9 init];
  v5 = v4;
  if (v4)
  {
    [(PHIntervalTimer *)v4 setInterval:a3];
    v6 = +[NSMutableSet set];
    [(PHIntervalTimer *)v5 setObservers:v6];

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mobilephone.PHIntervalTimer", 0);
    [(PHIntervalTimer *)v5 setQueue:v7];
  }
  return v5;
}

- (PHIntervalTimer)init
{
  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PHIntervalTimer init]");
  v4 = +[NSString stringWithFormat:@"Don't call %@, call designated initializer instead.", v3];
  NSLog(@"** TUAssertion failure: %@", v4);

  _TUAssertShouldCrashApplication();
  return 0;
}

- (void)dealloc
{
  v3 = [(PHIntervalTimer *)self timer];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)PHIntervalTimer;
  [(PHIntervalTimer *)&v4 dealloc];
}

- (void)addObserver:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  dispatch_queue_t v7 = [(PHIntervalTimer *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010B2CC;
  block[3] = &unk_1002CE6A0;
  block[4] = self;
  id v10 = v6;
  SEL v11 = a4;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = [(PHIntervalTimer *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010B3FC;
  v7[3] = &unk_1002CDDE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)fire
{
  v3 = [(PHIntervalTimer *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010B4FC;
  block[3] = &unk_1002CD518;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)pause
{
  v3 = [(PHIntervalTimer *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010B5C8;
  block[3] = &unk_1002CD518;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)resume
{
  v3 = [(PHIntervalTimer *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010B6D4;
  block[3] = &unk_1002CD518;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_createTimerIfNecessary
{
  v3 = [(PHIntervalTimer *)self queue];
  dispatch_assert_queue_V2(v3);

  id v10 = [(PHIntervalTimer *)self observers];
  if ([v10 count])
  {
    uint64_t v4 = [(PHIntervalTimer *)self timer];
    if (v4)
    {
      v5 = (void *)v4;
      id v6 = [(PHIntervalTimer *)self timer];
      unsigned __int8 v7 = [v6 isValid];

      if (v7) {
        return;
      }
    }
    else
    {
    }
    id v8 = sub_1000D5130();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Creating interval timer", buf, 2u);
    }

    [(PHIntervalTimer *)self interval];
    objc_super v9 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_postNotification", 0, 1);
    [(PHIntervalTimer *)self setTimer:v9];
  }
  else
  {
  }
}

- (void)_invalidateTimerIfNecessary
{
  v3 = [(PHIntervalTimer *)self queue];
  dispatch_assert_queue_V2(v3);

  id v6 = [(PHIntervalTimer *)self observers];
  if ([v6 count])
  {
  }
  else
  {
    uint64_t v4 = [(PHIntervalTimer *)self timer];

    if (v4)
    {
      v5 = [(PHIntervalTimer *)self timer];
      [v5 invalidate];

      [(PHIntervalTimer *)self setTimer:0];
    }
  }
}

- (void)_postNotification
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"PHIntervalTimerNotification" object:self];
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end