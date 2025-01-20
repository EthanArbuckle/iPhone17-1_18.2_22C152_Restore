@interface LNDebouncer
- (LNDebouncer)initWithDelay:(double)a3 maxDelay:(double)a4 queue:(id)a5 block:(id)a6;
- (LNWatchdogTimer)longTimer;
- (LNWatchdogTimer)timer;
- (OS_dispatch_queue)queue;
- (double)delay;
- (double)maxDelay;
- (id)block;
- (void)trigger;
@end

@implementation LNDebouncer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longTimer, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (LNWatchdogTimer)longTimer
{
  return self->_longTimer;
}

- (LNWatchdogTimer)timer
{
  return self->_timer;
}

- (id)block
{
  return self->_block;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (double)maxDelay
{
  return self->_maxDelay;
}

- (double)delay
{
  return self->_delay;
}

- (void)trigger
{
  [(LNWatchdogTimer *)self->_timer reset];
  if ([(LNWatchdogTimer *)self->_longTimer isStopped])
  {
    longTimer = self->_longTimer;
    [(LNWatchdogTimer *)longTimer reset];
  }
}

- (LNDebouncer)initWithDelay:(double)a3 maxDelay:(double)a4 queue:(id)a5 block:(id)a6
{
  id v12 = a5;
  id v13 = a6;
  if (a3 < 0.0)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"LNDebouncer.m", 33, @"Invalid parameter not satisfying: %@", @"delay >= 0" object file lineNumber description];
  }
  if (a4 >= 0.0)
  {
    if (v12) {
      goto LABEL_5;
    }
LABEL_10:
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"LNDebouncer.m", 35, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

    if (v13) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"LNDebouncer.m", 34, @"Invalid parameter not satisfying: %@", @"maxDelay >= 0" object file lineNumber description];

  if (!v12) {
    goto LABEL_10;
  }
LABEL_5:
  if (v13) {
    goto LABEL_6;
  }
LABEL_11:
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"LNDebouncer.m", 36, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

LABEL_6:
  v32.receiver = self;
  v32.super_class = (Class)LNDebouncer;
  v14 = [(LNDebouncer *)&v32 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_queue, a5);
    v15->_maxDelay = a4;
    v16 = _Block_copy(v13);
    id block = v15->_block;
    v15->_id block = v16;

    v15->_delay = a3;
    objc_initWeak(&location, v15);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__LNDebouncer_initWithDelay_maxDelay_queue_block___block_invoke;
    aBlock[3] = &unk_1E5B3A1D0;
    objc_copyWeak(&v30, &location);
    v18 = _Block_copy(aBlock);
    v19 = [[LNWatchdogTimer alloc] initWithTimeoutInterval:0 singleUse:v18 timeoutHandler:v15->_delay];
    timer = v15->_timer;
    v15->_timer = v19;

    v21 = [[LNWatchdogTimer alloc] initWithTimeoutInterval:0 singleUse:v18 timeoutHandler:v15->_maxDelay];
    longTimer = v15->_longTimer;
    v15->_longTimer = v21;

    v23 = v15;
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __50__LNDebouncer_initWithDelay_maxDelay_queue_block___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[6] stop];
  [WeakRetained[5] stop];
  (*((void (**)(void))WeakRetained[4] + 2))();
}

@end