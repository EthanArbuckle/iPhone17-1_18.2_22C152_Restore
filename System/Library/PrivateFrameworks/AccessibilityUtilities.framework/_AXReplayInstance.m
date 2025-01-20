@interface _AXReplayInstance
+ (id)replayBlock:(id)a3 name:(id)a4 attempts:(int64_t)a5 interval:(double)a6 async:(BOOL)a7 queue:(id)a8 completion:(id)a9;
- (BOOL)async;
- (BOOL)didSucceed;
- (NSError)underlyingError;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (double)interval;
- (id)_genericFailError;
- (id)completionBlock;
- (id)replayBlock;
- (id)underlyingResult;
- (int64_t)attemptsRemaining;
- (int64_t)maxAttempts;
- (void)_dispatchAsynchronously;
- (void)_dispatchSynchronously;
- (void)dispatch;
- (void)setAsync:(BOOL)a3;
- (void)setAttemptsRemaining:(int64_t)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDidSucceed:(BOOL)a3;
- (void)setInterval:(double)a3;
- (void)setMaxAttempts:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReplayBlock:(id)a3;
- (void)setUnderlyingError:(id)a3;
- (void)setUnderlyingResult:(id)a3;
@end

@implementation _AXReplayInstance

+ (id)replayBlock:(id)a3 name:(id)a4 attempts:(int64_t)a5 interval:(double)a6 async:(BOOL)a7 queue:(id)a8 completion:(id)a9
{
  BOOL v10 = a7;
  id v15 = a9;
  id v16 = a8;
  id v17 = a4;
  id v18 = a3;
  v19 = objc_alloc_init(_AXReplayInstance);
  [(_AXReplayInstance *)v19 setName:v17];

  [(_AXReplayInstance *)v19 setReplayBlock:v18];
  [(_AXReplayInstance *)v19 setCompletionBlock:v15];

  [(_AXReplayInstance *)v19 setAttemptsRemaining:a5];
  [(_AXReplayInstance *)v19 setMaxAttempts:a5];
  [(_AXReplayInstance *)v19 setInterval:a6];
  [(_AXReplayInstance *)v19 setAsync:v10];
  [(_AXReplayInstance *)v19 setQueue:v16];

  v20 = [(_AXReplayInstance *)v19 queue];

  if (!v20) {
    [(_AXReplayInstance *)v19 setQueue:MEMORY[0x1E4F14428]];
  }

  return v19;
}

- (void)dispatch
{
  if ([(_AXReplayInstance *)self async])
  {
    v3 = [(_AXReplayInstance *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29___AXReplayInstance_dispatch__block_invoke;
    block[3] = &unk_1E5585F48;
    block[4] = self;
    dispatch_async(v3, block);
  }
  else
  {
    [(_AXReplayInstance *)self _dispatchSynchronously];
  }
}

- (void)_dispatchSynchronously
{
  int64_t attemptsRemaining = self->_attemptsRemaining;
  if (attemptsRemaining >= 1)
  {
    do
    {
      self->_int64_t attemptsRemaining = attemptsRemaining - 1;
      v4 = [(_AXReplayInstance *)self replayBlock];
      id v17 = 0;
      id v18 = 0;
      int v5 = ((uint64_t (**)(void, id *, id *))v4)[2](v4, &v18, &v17);
      id v6 = v18;
      id v7 = v17;

      [(_AXReplayInstance *)self setUnderlyingResult:v6];
      [(_AXReplayInstance *)self setUnderlyingError:v7];
      if (v5)
      {
        self->_BOOL didSucceed = 1;
      }
      else
      {
        v8 = (void *)MEMORY[0x1E4F29060];
        [(_AXReplayInstance *)self interval];
        double v10 = v9;

        [v8 sleepForTimeInterval:v10];
      }

      int64_t attemptsRemaining = self->_attemptsRemaining;
    }
    while (attemptsRemaining > 0);
  }
  if (self->_didSucceed)
  {
    v11 = 0;
  }
  else
  {
    v12 = [(_AXReplayInstance *)self underlyingError];

    if (v12) {
      [(_AXReplayInstance *)self underlyingError];
    }
    else {
    v11 = [(_AXReplayInstance *)self _genericFailError];
    }
  }
  v13 = [(_AXReplayInstance *)self completionBlock];

  if (v13)
  {
    v14 = [(_AXReplayInstance *)self completionBlock];
    BOOL didSucceed = self->_didSucceed;
    id v16 = [(_AXReplayInstance *)self underlyingResult];
    ((void (**)(void, BOOL, void *, void *))v14)[2](v14, didSucceed, v16, v11);
  }
}

- (void)_dispatchAsynchronously
{
  --self->_attemptsRemaining;
  v3 = [(_AXReplayInstance *)self replayBlock];
  id v19 = 0;
  id v20 = 0;
  char v4 = ((uint64_t (**)(void, id *, id *))v3)[2](v3, &v20, &v19);
  id v5 = v20;
  id v6 = v19;
  self->_BOOL didSucceed = v4;

  [(_AXReplayInstance *)self setUnderlyingError:v6];
  [(_AXReplayInstance *)self setUnderlyingResult:v5];
  if (!self->_didSucceed)
  {
    if (self->_attemptsRemaining >= 1)
    {
      [(_AXReplayInstance *)self interval];
      dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
      v12 = [(_AXReplayInstance *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44___AXReplayInstance__dispatchAsynchronously__block_invoke;
      block[3] = &unk_1E5585F48;
      block[4] = self;
      dispatch_after(v11, v12, block);

      goto LABEL_7;
    }
    v13 = [(_AXReplayInstance *)self underlyingError];
    if (v13) {
      [(_AXReplayInstance *)self underlyingError];
    }
    else {
    v8 = [(_AXReplayInstance *)self _genericFailError];
    }

    v14 = [(_AXReplayInstance *)self completionBlock];

    if (v14)
    {
      id v15 = [(_AXReplayInstance *)self completionBlock];
      BOOL didSucceed = self->_didSucceed;
      id v17 = [(_AXReplayInstance *)self underlyingResult];
      ((void (**)(void, BOOL, void *, void))v15)[2](v15, didSucceed, v17, v8);
    }
    goto LABEL_4;
  }
  id v7 = [(_AXReplayInstance *)self completionBlock];

  if (v7)
  {
    v8 = [(_AXReplayInstance *)self completionBlock];
    double v9 = [(_AXReplayInstance *)self underlyingResult];
    ((void (**)(void, uint64_t, void *, void))v8)[2](v8, 1, v9, 0);

LABEL_4:
  }
LABEL_7:
}

- (id)_genericFailError
{
  v2 = (void *)MEMORY[0x1E4F28C58];
  v3 = [(_AXReplayInstance *)self name];
  char v4 = objc_msgSend(v2, "ax_errorWithDomain:description:", @"AXReplayer", @"Exhausted retry attempts for block: %@", v3);

  return v4;
}

- (id)replayBlock
{
  return self->_replayBlock;
}

- (void)setReplayBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (int64_t)maxAttempts
{
  return self->_maxAttempts;
}

- (void)setMaxAttempts:(int64_t)a3
{
  self->_maxAttempts = a3;
}

- (int64_t)attemptsRemaining
{
  return self->_attemptsRemaining;
}

- (void)setAttemptsRemaining:(int64_t)a3
{
  self->_int64_t attemptsRemaining = a3;
}

- (BOOL)async
{
  return self->_async;
}

- (void)setAsync:(BOOL)a3
{
  self->_async = a3;
}

- (OS_dispatch_queue)queue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queue);

  return (OS_dispatch_queue *)WeakRetained;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
}

- (void)setDidSucceed:(BOOL)a3
{
  self->_BOOL didSucceed = a3;
}

- (NSError)underlyingError
{
  return self->_underlyingError;
}

- (void)setUnderlyingError:(id)a3
{
}

- (id)underlyingResult
{
  return self->_underlyingResult;
}

- (void)setUnderlyingResult:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_underlyingResult, 0);
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_destroyWeak((id *)&self->_queue);
  objc_storeStrong(&self->_completionBlock, 0);

  objc_storeStrong(&self->_replayBlock, 0);
}

@end