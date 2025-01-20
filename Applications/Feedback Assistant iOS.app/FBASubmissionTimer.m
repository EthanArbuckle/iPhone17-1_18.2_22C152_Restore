@interface FBASubmissionTimer
- (FBASubmissionTimer)initWithDelegate:(id)a3 forTask:(id)a4 initialTimeout:(double)a5;
- (FBASubmissionTimerDelegate)delegate;
- (FBKUploadTask)task;
- (NSTimer)timer;
- (double)currentInterval;
- (double)givenInterval;
- (void)dealloc;
- (void)resetTimerWithInterval:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setGivenInterval:(double)a3;
- (void)setTask:(id)a3;
- (void)setTimer:(id)a3;
- (void)timerDidTick;
@end

@implementation FBASubmissionTimer

- (FBASubmissionTimer)initWithDelegate:(id)a3 forTask:(id)a4 initialTimeout:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)FBASubmissionTimer;
  v10 = [(FBASubmissionTimer *)&v15 init];
  if (v10)
  {
    v11 = +[FBALog appHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v9 taskIdentifier];
      unsigned int v13 = [v12 intValue];
      *(_DWORD *)buf = 67109376;
      unsigned int v17 = v13;
      __int16 v18 = 2048;
      double v19 = a5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "starting submission timer for [%i] with timeout [%f]", buf, 0x12u);
    }
    [(FBASubmissionTimer *)v10 setGivenInterval:a5];
    [(FBASubmissionTimer *)v10 resetTimerWithInterval:a5];
    [(FBASubmissionTimer *)v10 setDelegate:v8];
    [(FBASubmissionTimer *)v10 setTask:v9];
  }

  return v10;
}

- (void)dealloc
{
  v3 = [(FBASubmissionTimer *)self timer];
  [v3 invalidate];

  [(FBASubmissionTimer *)self setTimer:0];
  v4.receiver = self;
  v4.super_class = (Class)FBASubmissionTimer;
  [(FBASubmissionTimer *)&v4 dealloc];
}

- (void)timerDidTick
{
  v3 = [(FBASubmissionTimer *)self timer];
  [v3 invalidate];

  [(FBASubmissionTimer *)self setTimer:0];
  id v5 = [(FBASubmissionTimer *)self delegate];
  objc_super v4 = [(FBASubmissionTimer *)self task];
  [v5 timer:self didTimeoutForTask:v4];
}

- (void)resetTimerWithInterval:(double)a3
{
  id v5 = [(FBASubmissionTimer *)self timer];
  [v5 invalidate];

  v6 = +[NSTimer timerWithTimeInterval:self target:"timerDidTick" selector:0 userInfo:1 repeats:a3];
  [(FBASubmissionTimer *)self setTimer:v6];

  id v8 = +[NSRunLoop currentRunLoop];
  v7 = [(FBASubmissionTimer *)self timer];
  [v8 addTimer:v7 forMode:NSRunLoopCommonModes];
}

- (double)currentInterval
{
  [(FBASubmissionTimer *)self givenInterval];
  return result;
}

- (NSTimer)timer
{
  return (NSTimer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTimer:(id)a3
{
}

- (FBASubmissionTimerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FBASubmissionTimerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FBKUploadTask)task
{
  return (FBKUploadTask *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTask:(id)a3
{
}

- (double)givenInterval
{
  return self->_givenInterval;
}

- (void)setGivenInterval:(double)a3
{
  self->_givenInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end