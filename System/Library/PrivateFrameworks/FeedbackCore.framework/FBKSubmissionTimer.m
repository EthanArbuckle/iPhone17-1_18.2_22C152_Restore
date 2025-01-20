@interface FBKSubmissionTimer
- (FBKSubmissionTimer)initWithDelegate:(id)a3 forTask:(id)a4 initialTimeout:(double)a5;
- (FBKSubmissionTimerDelegate)delegate;
- (FBKUploadTask)task;
- (NSTimer)timer;
- (double)givenInterval;
- (void)dealloc;
- (void)resetTimerWithInterval:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setGivenInterval:(double)a3;
- (void)setTask:(id)a3;
- (void)setTimer:(id)a3;
- (void)timerDidTick;
@end

@implementation FBKSubmissionTimer

- (FBKSubmissionTimer)initWithDelegate:(id)a3 forTask:(id)a4 initialTimeout:(double)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)FBKSubmissionTimer;
  v10 = [(FBKSubmissionTimer *)&v15 init];
  if (v10)
  {
    v11 = +[FBKLog appHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v9 taskIdentifier];
      int v13 = [v12 intValue];
      *(_DWORD *)buf = 67109376;
      int v17 = v13;
      __int16 v18 = 2048;
      double v19 = a5;
      _os_log_impl(&dword_22A36D000, v11, OS_LOG_TYPE_DEFAULT, "starting submission timer for [%i] with timeout [%f]", buf, 0x12u);
    }
    [(FBKSubmissionTimer *)v10 setGivenInterval:a5];
    [(FBKSubmissionTimer *)v10 resetTimerWithInterval:a5];
    [(FBKSubmissionTimer *)v10 setDelegate:v8];
    [(FBKSubmissionTimer *)v10 setTask:v9];
  }

  return v10;
}

- (void)dealloc
{
  v3 = [(FBKSubmissionTimer *)self timer];
  [v3 invalidate];

  [(FBKSubmissionTimer *)self setTimer:0];
  v4.receiver = self;
  v4.super_class = (Class)FBKSubmissionTimer;
  [(FBKSubmissionTimer *)&v4 dealloc];
}

- (void)timerDidTick
{
  v3 = [(FBKSubmissionTimer *)self timer];
  [v3 invalidate];

  [(FBKSubmissionTimer *)self setTimer:0];
  id v5 = [(FBKSubmissionTimer *)self delegate];
  objc_super v4 = [(FBKSubmissionTimer *)self task];
  [v5 timer:self didTimeoutForTask:v4];
}

- (void)resetTimerWithInterval:(double)a3
{
  id v5 = [(FBKSubmissionTimer *)self timer];
  [v5 invalidate];

  v6 = [MEMORY[0x263EFFA20] timerWithTimeInterval:self target:sel_timerDidTick selector:0 userInfo:1 repeats:a3];
  [(FBKSubmissionTimer *)self setTimer:v6];

  id v8 = [MEMORY[0x263EFF9F0] currentRunLoop];
  v7 = [(FBKSubmissionTimer *)self timer];
  [v8 addTimer:v7 forMode:*MEMORY[0x263EFF588]];
}

- (NSTimer)timer
{
  return (NSTimer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTimer:(id)a3
{
}

- (FBKSubmissionTimerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FBKSubmissionTimerDelegate *)WeakRetained;
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