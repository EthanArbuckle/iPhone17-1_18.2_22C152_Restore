@interface CSAttSiriTimer
- (CSAttSiriTimer)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (id)completionBlock;
- (void)cancelTimer;
- (void)setCompletionBlock:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTimerForSecs:(double)a3 completionBlock:(id)a4;
@end

@implementation CSAttSiriTimer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)cancelTimer
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DCAF4;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setTimerForSecs:(double)a3 completionBlock:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DCC68;
  block[3] = &unk_100251130;
  block[4] = self;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (CSAttSiriTimer)initWithQueue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSAttSiriTimer;
  v5 = [(CSAttSiriTimer *)&v9 init];
  if (v5)
  {
    if (v4) {
      dispatch_queue_t v6 = (dispatch_queue_t)v4;
    }
    else {
      dispatch_queue_t v6 = dispatch_queue_create("com.apple.corespeech.attsiri-timer", 0);
    }
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;
  }
  return v5;
}

@end