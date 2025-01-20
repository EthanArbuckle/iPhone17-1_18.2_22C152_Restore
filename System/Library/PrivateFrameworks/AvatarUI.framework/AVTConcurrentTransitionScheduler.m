@interface AVTConcurrentTransitionScheduler
- (AVTConcurrentTransitionScheduler)initWithEventHandler:(id)a3;
- (AVTConcurrentTransitionScheduler)initWithEventHandler:(id)a3 delay:(double)a4;
- (NSTimer)transitionTimer;
- (double)delay;
- (id)eventHandler;
- (void)scheduleEvent;
- (void)scheduleTransitionTimer;
- (void)setTransitionTimer:(id)a3;
- (void)stop;
@end

@implementation AVTConcurrentTransitionScheduler

- (AVTConcurrentTransitionScheduler)initWithEventHandler:(id)a3 delay:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVTConcurrentTransitionScheduler;
  v7 = [(AVTConcurrentTransitionScheduler *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    id eventHandler = v7->_eventHandler;
    v7->_id eventHandler = (id)v8;

    v7->_delay = a4;
  }

  return v7;
}

- (AVTConcurrentTransitionScheduler)initWithEventHandler:(id)a3
{
  return [(AVTConcurrentTransitionScheduler *)self initWithEventHandler:a3 delay:0.0];
}

- (void)scheduleEvent
{
  v3 = [(AVTConcurrentTransitionScheduler *)self transitionTimer];

  if (!v3)
  {
    [(AVTConcurrentTransitionScheduler *)self scheduleTransitionTimer];
    v4 = [(AVTConcurrentTransitionScheduler *)self eventHandler];
    v4[2]();
  }
}

- (void)stop
{
  v3 = [(AVTConcurrentTransitionScheduler *)self transitionTimer];
  [v3 invalidate];

  [(AVTConcurrentTransitionScheduler *)self setTransitionTimer:0];
}

- (void)scheduleTransitionTimer
{
  v3 = [(AVTConcurrentTransitionScheduler *)self transitionTimer];

  if (v3)
  {
    v4 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Calling schedule transition timer while timer is already running" userInfo:0];
    [v4 raise];
  }
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x263EFFA20];
  [(AVTConcurrentTransitionScheduler *)self delay];
  double v7 = v6;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __59__AVTConcurrentTransitionScheduler_scheduleTransitionTimer__block_invoke;
  v13 = &unk_263FF1340;
  objc_copyWeak(&v14, &location);
  uint64_t v8 = [v5 timerWithTimeInterval:1 repeats:&v10 block:v7];
  v9 = objc_msgSend(MEMORY[0x263EFF9F0], "mainRunLoop", v10, v11, v12, v13);
  [v9 addTimer:v8 forMode:*MEMORY[0x263EFF588]];

  [(AVTConcurrentTransitionScheduler *)self setTransitionTimer:v8];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __59__AVTConcurrentTransitionScheduler_scheduleTransitionTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained eventHandler];
  v1[2]();
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (NSTimer)transitionTimer
{
  return self->_transitionTimer;
}

- (void)setTransitionTimer:(id)a3
{
}

- (double)delay
{
  return self->_delay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionTimer, 0);
  objc_storeStrong(&self->_eventHandler, 0);
}

@end