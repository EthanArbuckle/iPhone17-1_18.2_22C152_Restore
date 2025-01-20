@interface _FMLazyFuture
- (BOOL)started;
- (FMScheduler)scheduler;
- (OS_dispatch_queue)accessQueue;
- (_FMLazyFuture)initWithBlock:(id)a3 scheduler:(id)a4;
- (id)addCompletionBlock:(id)a3;
- (id)addFailureBlock:(id)a3;
- (id)addSuccessBlock:(id)a3;
- (id)block;
- (void)_runIfNecessary;
- (void)setAccessQueue:(id)a3;
- (void)setBlock:(id)a3;
- (void)setScheduler:(id)a3;
- (void)setStarted:(BOOL)a3;
@end

@implementation _FMLazyFuture

- (_FMLazyFuture)initWithBlock:(id)a3 scheduler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_FMLazyFuture;
  v8 = [(FMFuture *)&v13 init];
  v9 = v8;
  if (v8)
  {
    [(_FMLazyFuture *)v8 setBlock:v6];
    if (v7)
    {
      [(_FMLazyFuture *)v9 setScheduler:v7];
    }
    else
    {
      v10 = +[FMScheduler mainThreadScheduler];
      [(_FMLazyFuture *)v9 setScheduler:v10];
    }
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.iCloud.FMCore.LazyFutureAccessQueue", 0);
    [(_FMLazyFuture *)v9 setAccessQueue:v11];
  }
  return v9;
}

- (void)_runIfNecessary
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v3 = [(_FMLazyFuture *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32___FMLazyFuture__runIfNecessary__block_invoke;
  block[3] = &unk_1E6019580;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(v3, block);

  if (*((unsigned char *)v8 + 24))
  {
    v4 = [(_FMLazyFuture *)self scheduler];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __32___FMLazyFuture__runIfNecessary__block_invoke_2;
    v5[3] = &unk_1E60193F0;
    v5[4] = self;
    [v4 performBlock:v5];
  }
  _Block_object_dispose(&v7, 8);
}

- (id)addSuccessBlock:(id)a3
{
  id v4 = a3;
  [(_FMLazyFuture *)self _runIfNecessary];
  v7.receiver = self;
  v7.super_class = (Class)_FMLazyFuture;
  v5 = [(FMFuture *)&v7 addSuccessBlock:v4];

  return v5;
}

- (id)addFailureBlock:(id)a3
{
  id v4 = a3;
  [(_FMLazyFuture *)self _runIfNecessary];
  v7.receiver = self;
  v7.super_class = (Class)_FMLazyFuture;
  v5 = [(FMFuture *)&v7 addFailureBlock:v4];

  return v5;
}

- (id)addCompletionBlock:(id)a3
{
  id v4 = a3;
  [(_FMLazyFuture *)self _runIfNecessary];
  v7.receiver = self;
  v7.super_class = (Class)_FMLazyFuture;
  v5 = [(FMFuture *)&v7 addCompletionBlock:v4];

  return v5;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (FMScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong(&self->_block, 0);
}

@end