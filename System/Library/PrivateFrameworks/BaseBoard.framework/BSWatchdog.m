@interface BSWatchdog
- (BOOL)hasFired;
- (BSWatchdog)initWithProvider:(id)a3 queue:(id)a4;
- (BSWatchdog)initWithProvider:(id)a3 queue:(id)a4 completion:(id)a5;
- (BSWatchdog)initWithTimeout:(double)a3 queue:(id)a4;
- (BSWatchdog)initWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5;
- (BSWatchdogDelegate)delegate;
- (BSWatchdogProviding)provider;
- (NSDate)startDate;
- (OS_dispatch_queue)queue;
- (double)timeout;
- (id)description;
- (void)_completeWatchdogAfterFiring:(void *)a1;
- (void)_setupTimerWithInterval:(double)a3 handler:;
- (void)dealloc;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)start;
@end

@implementation BSWatchdog

- (BSWatchdog)initWithProvider:(id)a3 queue:(id)a4
{
  return [(BSWatchdog *)self initWithProvider:a3 queue:a4 completion:0];
}

- (void)_completeWatchdogAfterFiring:(void *)a1
{
  if (a1)
  {
    v3 = a1;
    v10 = v3;
    if (!*((unsigned char *)v3 + 25))
    {
      *((unsigned char *)v3 + 25) = 1;
      if ((a2 & 1) == 0)
      {
        [v3 _watchdogInvalidated];
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10[4], "watchdogCancelled:");
        }
      }
      v4 = v10;
      v5 = (void (**)(id, void))v10[2];
      if (v5)
      {
        v5[2](v5, a2);
        id v6 = v10[2];
        v10[2] = 0;

        v4 = v10;
      }
      id v7 = v4[4];
      v4[4] = 0;

      id v8 = v10[5];
      v10[5] = 0;

      v3 = v10;
    }
    [v3[1] invalidate];
    id v9 = v10[1];
    v10[1] = 0;
  }
}

- (void)start
{
  if (!self->_timer && !self->_invalidated && !self->_completed)
  {
    v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    startDate = self->_startDate;
    self->_startDate = v3;

    if (objc_opt_respondsToSelector()) {
      [(BSWatchdogDelegate *)self->_delegate watchdogStarted:self];
    }
    double timeout = self->_timeout;
    if (timeout >= 1.0) {
      double v6 = self->_timeout;
    }
    else {
      double v6 = 1.0;
    }
    double v7 = fmax(timeout + -1.0, 1.0);
    if (v6 <= v7) {
      double v7 = v6;
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __33__BSWatchdog__startWatchdogTimer__block_invoke;
    v8[3] = &unk_1E54457C8;
    v8[4] = self;
    -[BSWatchdog _setupTimerWithInterval:handler:]((uint64_t)self, v8, v7);
  }
}

- (void)_setupTimerWithInterval:(double)a3 handler:
{
  id v5 = a2;
  [*(id *)(a1 + 8) invalidate];
  double v6 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = 0;

  double v7 = [BSAbsoluteMachTimer alloc];
  id v8 = [NSString stringWithFormat:@"<BSWatchdog:%@>", *(void *)(a1 + 32)];
  uint64_t v9 = [(BSAbsoluteMachTimer *)v7 initWithIdentifier:v8];
  v10 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v9;

  v11 = *(void **)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 56);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__BSWatchdog__setupTimerWithInterval_handler___block_invoke;
  v14[3] = &unk_1E5446190;
  id v13 = v5;
  id v15 = v13;
  [v11 scheduleWithFireInterval:v12 leewayInterval:v14 queue:a3 handler:0.0];
}

- (void)setDelegate:(id)a3
{
  id v8 = (BSWatchdogDelegate *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  delegate = self->_delegate;
  p_delegate = &self->_delegate;
  double v7 = v8;
  if (delegate != v8)
  {
    objc_storeStrong((id *)p_delegate, a3);
    double v7 = v8;
  }
}

- (BSWatchdog)initWithProvider:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"BSWatchdog.m", 35, @"Invalid parameter not satisfying: %@", @"provider" object file lineNumber description];
  }
  [v10 watchdogTimeout];
  id v13 = -[BSWatchdog initWithTimeout:queue:completion:](self, "initWithTimeout:queue:completion:", v11, v12);
  v14 = v13;
  if (v13) {
    objc_storeStrong((id *)&v13->_provider, a3);
  }

  return v14;
}

- (BSWatchdog)initWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5
{
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"BSWatchdog.m", 48, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
  }
  id v12 = [(BSWatchdog *)self init];
  id v13 = v12;
  if (v12)
  {
    v12->_double timeout = a3;
    objc_storeStrong((id *)&v12->_queue, a4);
    uint64_t v14 = [v11 copy];
    id completion = v13->_completion;
    v13->_id completion = (id)v14;
  }
  return v13;
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[BSWatchdog _completeWatchdogAfterFiring:](self, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"BSWatchdog.m", 59, @"Invalid parameter not satisfying: %@", @"_invalidated" object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)BSWatchdog;
  [(BSWatchdog *)&v5 dealloc];
}

- (BSWatchdog)initWithTimeout:(double)a3 queue:(id)a4
{
  return [(BSWatchdog *)self initWithTimeout:a4 queue:0 completion:a3];
}

- (id)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  [(BSWatchdog *)self timeout];
  id v4 = (id)objc_msgSend(v3, "appendFloat:withName:", @"timeout");
  if (self->_completed)
  {
    id v5 = (id)[v3 appendObject:@"(completed)" withName:0];
  }
  else
  {
    if (self->_provider)
    {
      double v6 = +[BSDescriptionBuilder succinctDescriptionForObject:](BSDescriptionBuilder, "succinctDescriptionForObject:");
      id v7 = (id)[v3 appendObject:v6 withName:@"provider"];
    }
    if (self->_delegate)
    {
      id v8 = +[BSDescriptionBuilder succinctDescriptionForObject:](BSDescriptionBuilder, "succinctDescriptionForObject:");
      id v9 = (id)[v3 appendObject:v8 withName:@"delegate"];
    }
  }
  id v10 = [v3 build];

  return v10;
}

uint64_t __46__BSWatchdog__setupTimerWithInterval_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __33__BSWatchdog__startWatchdogTimer__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __33__BSWatchdog__stageOneTimerFired__block_invoke;
    v2[3] = &unk_1E54457C8;
    v2[4] = v1;
    -[BSWatchdog _setupTimerWithInterval:handler:](v1, v2, 1.0);
  }
}

void __33__BSWatchdog__stageOneTimerFired__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    *(unsigned char *)(v1 + 26) = 1;
    [(id)v1 _watchdogTimerFired];
    if (objc_opt_respondsToSelector()) {
      [*(id *)(v1 + 32) watchdogFired:v1];
    }
    -[BSWatchdog _completeWatchdogAfterFiring:]((void *)v1, 1);
  }
}

- (BSWatchdogDelegate)delegate
{
  return self->_delegate;
}

- (BSWatchdogProviding)provider
{
  return self->_provider;
}

- (double)timeout
{
  return self->_timeout;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (BOOL)hasFired
{
  return self->_hasFired;
}

@end