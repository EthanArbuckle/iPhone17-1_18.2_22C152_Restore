@interface DYFutureOperation
+ (id)operationWithBlock:(id)a3;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (void)_start_NOLOCK;
- (void)addDependency:(id)a3;
- (void)dealloc;
@end

@implementation DYFutureOperation

+ (id)operationWithBlock:(id)a3
{
  objc_opt_class();
  v4 = (id)objc_opt_new();
  if (v4)
  {
    v4[41] = [a3 copy];
    *((unsigned char *)v4 + 304) = 0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DYFutureOperation;
  [(DYFuture *)&v3 dealloc];
}

- (BOOL)isExecuting
{
  [(NSCondition *)self->super._condition lock];
  if (*(_WORD *)&self->super._resolved) {
    BOOL started = 0;
  }
  else {
    BOOL started = self->super._started;
  }
  [(NSCondition *)self->super._condition unlock];
  return started;
}

- (BOOL)isFinished
{
  [(NSCondition *)self->super._condition lock];
  if (*(_WORD *)&self->super._resolved) {
    BOOL started = self->super._started;
  }
  else {
    BOOL started = 0;
  }
  [(NSCondition *)self->super._condition unlock];
  return started;
}

- (void)_start_NOLOCK
{
  [(DYFutureOperation *)self willChangeValueForKey:@"isExecuting"];
  [(NSCondition *)self->super._condition lock];
  if (self->super._started)
  {
    condition = self->super._condition;
    [(NSCondition *)condition unlock];
  }
  else
  {
    self->super._BOOL started = 1;
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__DYFutureOperation__start_NOLOCK__block_invoke;
    block[3] = &unk_265335F98;
    block[4] = self;
    dispatch_async(global_queue, block);
    [(NSCondition *)self->super._condition unlock];
    [(DYFutureOperation *)self didChangeValueForKey:@"isExecuting"];
  }
}

void __34__DYFutureOperation__start_NOLOCK__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 256) lock];
  char v2 = objc_msgSend(*(id *)(a1 + 32), "_waitForDependencies_REQUIRESLOCK");
  uint64_t v3 = *(void *)(a1 + 32);
  if ((v2 & 1) != 0 && (v4 = *(void (***)(void, void))(v3 + 328)) != 0)
  {
    *(void *)(v3 + 328) = 0;
    [*(id *)(*(void *)(a1 + 32) + 256) unlock];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __34__DYFutureOperation__start_NOLOCK__block_invoke_2;
    v6[3] = &unk_265336498;
    v6[4] = *(void *)(a1 + 32);
    ((void (**)(void, void *))v4)[2](v4, v6);
  }
  else
  {
    v5 = *(void **)(v3 + 256);
    [v5 unlock];
  }
}

uint64_t __34__DYFutureOperation__start_NOLOCK__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setResult:error:notify_NOLOCK:", a2, a3, 1);
}

- (void)addDependency:(id)a3
{
  [(NSCondition *)self->super._condition lock];
  [(DYFuture *)self _addDependency_REQUIRESLOCK:a3];
  condition = self->super._condition;

  [(NSCondition *)condition unlock];
}

@end