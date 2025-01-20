@interface CalculateScanRequest
+ (id)concurrentQueue;
+ (void)_lock;
+ (void)_unlock;
- (BOOL)isCanceled;
- (NSDictionary)options;
- (NSString)string;
- (id)resultHandler;
- (void)cancel;
- (void)setIsCanceled:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setResultHandler:(id)a3;
- (void)setString:(id)a3;
- (void)update;
@end

@implementation CalculateScanRequest

uint64_t __30__CalculateScanRequest_update__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) string];
  v3 = [*(id *)(a1 + 32) options];
  id v7 = +[Calculate scan:v2 options:v3 stop:*(void *)(a1 + 32) + 8];

  +[CalculateScanRequest _lock];
  if ([*(id *)(a1 + 32) isCanceled])
  {

    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }
  +[CalculateScanRequest _unlock];
  v4 = [*(id *)(a1 + 32) resultHandler];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) resultHandler];
    ((void (**)(void, id))v5)[2](v5, v7);
  }
  return MEMORY[0x1F41817F8]();
}

- (id)resultHandler
{
  return self->_resultHandler;
}

uint64_t __39__CalculateScanRequest_concurrentQueue__block_invoke()
{
  concurrentQueue_queue = (uint64_t)dispatch_queue_create("com.apple.framework.calculate.scan", MEMORY[0x1E4F14430]);
  return MEMORY[0x1F41817F8]();
}

uint64_t __29__CalculateScanRequest__lock__block_invoke()
{
  calculateScanRequestLock = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28E08]);
  return MEMORY[0x1F41817F8]();
}

- (void)update
{
  v3 = +[CalculateScanRequest concurrentQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CalculateScanRequest_update__block_invoke;
  block[3] = &unk_1E6365CF0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (void)setResultHandler:(id)a3
{
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

+ (id)concurrentQueue
{
  if (concurrentQueue_onceToken != -1) {
    dispatch_once(&concurrentQueue_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)concurrentQueue_queue;
  return v2;
}

+ (void)_unlock
{
}

+ (void)_lock
{
  if (_lock_onceToken_558 != -1) {
    dispatch_once(&_lock_onceToken_558, &__block_literal_global_559);
  }
  v2 = (void *)calculateScanRequestLock;
  [v2 lock];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

- (void)setIsCanceled:(BOOL)a3
{
  self->_isCanceled = a3;
}

- (void)cancel
{
  +[CalculateScanRequest _lock];
  [(CalculateScanRequest *)self setIsCanceled:1];
  +[CalculateScanRequest _unlock];
}

@end