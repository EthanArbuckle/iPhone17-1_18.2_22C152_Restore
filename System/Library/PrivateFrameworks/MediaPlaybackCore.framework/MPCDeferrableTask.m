@interface MPCDeferrableTask
- (BOOL)cancel;
- (BOOL)deallocating;
- (BOOL)isFinished;
- (MPCDeferrableTask)initWithIdentifier:(id)a3 timeout:(double)a4 queue:(id)a5 block:(id)a6;
- (MSVBlockGuard)guard;
- (NSString)identifier;
- (OS_dispatch_queue)queue;
- (id)block;
- (id)description;
- (os_unfair_lock_s)lock;
- (void)dealloc;
- (void)execute:(int64_t)a3;
- (void)setBlock:(id)a3;
- (void)setDeallocating:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)setGuard:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setQueue:(id)a3;
- (void)taskDidExecute;
@end

@implementation MPCDeferrableTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guard, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setDeallocating:(BOOL)a3
{
  self->_deallocating = a3;
}

- (BOOL)deallocating
{
  return self->_deallocating;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setGuard:(id)a3
{
}

- (MSVBlockGuard)guard
{
  return self->_guard;
}

- (void)setBlock:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)taskDidExecute
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(MPCDeferrableTask *)self setBlock:0];

  os_unfair_lock_unlock(p_lock);
}

- (void)execute:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v7 = [(MPCDeferrableTask *)self block];
  os_unfair_lock_unlock(p_lock);
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = @"Optimal";
    if (a3 == 1) {
      v9 = @"Timed out";
    }
    if (a3 == 2) {
      v9 = @"Canceled";
    }
    *(_DWORD *)buf = 138543618;
    v22 = self;
    __int16 v23 = 2114;
    v24 = v9;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Started executing (%{public}@)", buf, 0x16u);
  }

  if (!v7)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"MPCDeferrableTask.m", 84, @"%@ Deferred task can't be executed multiple times", self object file lineNumber description];
  }
  BOOL v10 = [(MPCDeferrableTask *)self deallocating];
  v11 = [(MPCDeferrableTask *)self queue];
  if (v10)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __29__MPCDeferrableTask_execute___block_invoke;
    v19[3] = &unk_2643C1478;
    v12 = (id *)v20;
    v20[0] = v7;
    v20[1] = a3;
    id v13 = v7;
    v14 = v19;
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__MPCDeferrableTask_execute___block_invoke_2;
    block[3] = &unk_2643C6818;
    v12 = (id *)v18;
    v18[0] = v7;
    v18[1] = a3;
    block[4] = self;
    id v15 = v7;
    v14 = block;
  }
  dispatch_async(v11, v14);

  [(MPCDeferrableTask *)self taskDidExecute];
}

uint64_t __29__MPCDeferrableTask_execute___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __29__MPCDeferrableTask_execute___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 setFinished:1];
}

- (void)dealloc
{
  [(MPCDeferrableTask *)self setDeallocating:1];
  [(MPCDeferrableTask *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)MPCDeferrableTask;
  [(MPCDeferrableTask *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MPCDeferrableTask *)self identifier];
  v6 = [v3 stringWithFormat:@"<%@: %p identifier=%@>", v4, self, v5];

  return v6;
}

- (BOOL)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(MPCDeferrableTask *)self block];
  os_unfair_lock_unlock(p_lock);
  if (v4
    && ([(MPCDeferrableTask *)self guard],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 disarm],
        v5,
        v6))
  {
    [(MPCDeferrableTask *)self execute:2];
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (MPCDeferrableTask)initWithIdentifier:(id)a3 timeout:(double)a4 queue:(id)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)MPCDeferrableTask;
  id v13 = [(MPCDeferrableTask *)&v24 init];
  v14 = v13;
  if (v13)
  {
    [(MPCDeferrableTask *)v13 setIdentifier:v10];
    [(MPCDeferrableTask *)v14 setQueue:v11];
    [(MPCDeferrableTask *)v14 setBlock:v12];
    v14->_lock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v14);
    id v15 = objc_alloc(MEMORY[0x263F54ED0]);
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __60__MPCDeferrableTask_initWithIdentifier_timeout_queue_block___block_invoke;
    v21 = &unk_2643C3A78;
    objc_copyWeak(&v22, &location);
    v16 = (void *)[v15 initWithTimeout:&v18 interruptionHandler:a4];
    -[MPCDeferrableTask setGuard:](v14, "setGuard:", v16, v18, v19, v20, v21);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __60__MPCDeferrableTask_initWithIdentifier_timeout_queue_block___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained execute:1];
  }
}

@end