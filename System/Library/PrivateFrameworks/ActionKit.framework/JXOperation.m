@interface JXOperation
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (JXOperation)init;
- (OS_dispatch_queue)stateQueue;
- (void)cancel;
- (void)dealloc;
- (void)finish;
- (void)setIsExecuting:(BOOL)a3;
- (void)setIsFinished:(BOOL)a3;
- (void)setStateQueue:(id)a3;
- (void)start;
- (void)startAndWaitUntilFinished;
@end

@implementation JXOperation

- (void).cxx_destruct
{
}

- (void)setStateQueue:(id)a3
{
}

- (OS_dispatch_queue)stateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 256, 1);
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsExecuting:(BOOL)a3
{
  self->_isExecuting = a3;
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (void)startAndWaitUntilFinished
{
  id v3 = objc_alloc_init(MEMORY[0x263F08A48]);
  [v3 addOperation:self];
  [v3 waitUntilAllOperationsAreFinished];
}

- (void)finish
{
  id v3 = [(JXOperation *)self stateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __21__JXOperation_finish__block_invoke;
  block[3] = &unk_264E5EE70;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __21__JXOperation_finish__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isFinished];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) willFinish];
    int v3 = [*(id *)(a1 + 32) isExecuting];
    v4 = *(void **)(a1 + 32);
    if (v3)
    {
      [v4 willChangeValueForKey:@"isExecuting"];
      [*(id *)(a1 + 32) willChangeValueForKey:@"isFinished"];
      [*(id *)(a1 + 32) setIsExecuting:0];
      [*(id *)(a1 + 32) setIsFinished:1];
      [*(id *)(a1 + 32) didChangeValueForKey:@"isExecuting"];
      v5 = *(void **)(a1 + 32);
      return [v5 didChangeValueForKey:@"isFinished"];
    }
    else
    {
      uint64_t result = [v4 isFinished];
      if ((result & 1) == 0)
      {
        [*(id *)(a1 + 32) setIsExecuting:0];
        v6 = *(void **)(a1 + 32);
        return [v6 setIsFinished:1];
      }
    }
  }
  return result;
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)JXOperation;
  [(JXOperation *)&v3 cancel];
  [(JXOperation *)self finish];
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)start
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  objc_super v3 = [(JXOperation *)self stateQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __20__JXOperation_start__block_invoke;
  v5[3] = &unk_264E5EEC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  if (*((unsigned char *)v7 + 24))
  {
    v4 = (void *)MEMORY[0x23ECE6170]();
    [(JXOperation *)self main];
  }
  _Block_object_dispose(&v6, 8);
}

uint64_t __20__JXOperation_start__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) != 0
    || (uint64_t result = [*(id *)(a1 + 32) isReady], !result)
    || (uint64_t result = [*(id *)(a1 + 32) isExecuting], (result & 1) != 0)
    || (uint64_t result = [*(id *)(a1 + 32) isFinished], result))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    [*(id *)(a1 + 32) willChangeValueForKey:@"isExecuting"];
    [*(id *)(a1 + 32) setIsExecuting:1];
    objc_super v3 = *(void **)(a1 + 32);
    return [v3 didChangeValueForKey:@"isExecuting"];
  }
  return result;
}

- (JXOperation)init
{
  v10.receiver = self;
  v10.super_class = (Class)JXOperation;
  v2 = [(JXOperation *)&v10 init];
  if (v2)
  {
    id v3 = [NSString alloc];
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    uint64_t v6 = (void *)[v3 initWithFormat:@"%@.%p.state", v5, v2];

    id v7 = v6;
    dispatch_queue_t v8 = dispatch_queue_create((const char *)[v7 UTF8String], 0);
    [(JXOperation *)v2 setStateQueue:v8];

    [(JXOperation *)v2 setIsExecuting:0];
    [(JXOperation *)v2 setIsFinished:0];
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)JXOperation;
  [(JXOperation *)&v2 dealloc];
}

@end