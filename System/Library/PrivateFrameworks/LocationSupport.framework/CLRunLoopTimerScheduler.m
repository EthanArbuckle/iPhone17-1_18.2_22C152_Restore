@interface CLRunLoopTimerScheduler
- (CLRunLoopTimerScheduler)initWithRunLoopSilo:(id)a3;
- (CLTimer)timer;
- (NSRunLoop)runloop;
- (NSTimer)underlyingTimer;
- (id)fireBlock;
- (void)dealloc;
- (void)reflectNextFireDelay:(double)a3 fireInterval:(double)a4;
- (void)setFireBlock:(id)a3;
- (void)setRunloop:(id)a3;
- (void)setTimer:(id)a3;
- (void)setUnderlyingTimer:(id)a3;
@end

@implementation CLRunLoopTimerScheduler

- (CLRunLoopTimerScheduler)initWithRunLoopSilo:(id)a3
{
  id v4 = a3;
  [v4 inPermissiveMode];
  v17.receiver = self;
  v17.super_class = (Class)CLRunLoopTimerScheduler;
  v5 = [(CLRunLoopTimerScheduler *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 runloop];
    runloop = v5->_runloop;
    v5->_runloop = (NSRunLoop *)v6;

    objc_initWeak(&location, v5);
    objc_initWeak(&from, v4);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1A45559B4;
    v12[3] = &unk_1E5B3E8D0;
    objc_copyWeak(&v13, &from);
    objc_copyWeak(&v14, &location);
    v8 = _Block_copy(v12);
    id fireBlock = v5->_fireBlock;
    v5->_id fireBlock = v8;

    v10 = v5;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  [(NSTimer *)self->_underlyingTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CLRunLoopTimerScheduler;
  [(CLRunLoopTimerScheduler *)&v3 dealloc];
}

- (void)reflectNextFireDelay:(double)a3 fireInterval:(double)a4
{
  underlyingTimer = self->_underlyingTimer;
  if (underlyingTimer) {
    [(NSTimer *)underlyingTimer invalidate];
  }
  v8 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:1 repeats:self->_fireBlock block:a4];
  v9 = self->_underlyingTimer;
  self->_underlyingTimer = v8;

  v10 = self->_underlyingTimer;
  v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a3];
  [(NSTimer *)v10 setFireDate:v11];

  runloop = self->_runloop;
  MEMORY[0x1F4181798](runloop, sel_addTimer_forMode_);
}

- (CLTimer)timer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timer);
  return (CLTimer *)WeakRetained;
}

- (void)setTimer:(id)a3
{
}

- (NSTimer)underlyingTimer
{
  return self->_underlyingTimer;
}

- (void)setUnderlyingTimer:(id)a3
{
}

- (id)fireBlock
{
  return self->_fireBlock;
}

- (void)setFireBlock:(id)a3
{
}

- (NSRunLoop)runloop
{
  return self->_runloop;
}

- (void)setRunloop:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_timer);
  objc_storeStrong((id *)&self->_runloop, 0);
  objc_storeStrong(&self->_fireBlock, 0);
  objc_storeStrong((id *)&self->_underlyingTimer, 0);
}

@end