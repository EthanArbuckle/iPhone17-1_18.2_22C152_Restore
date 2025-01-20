@interface CalculateRequest
+ (id)serialQueue;
+ (void)_lock;
+ (void)_unlock;
- (BOOL)isCanceled;
- (CalculateResult)result;
- (NSDictionary)options;
- (NSError)error;
- (NSString)expression;
- (id)resultHandler;
- (void)cancel;
- (void)evaluate;
- (void)finish;
- (void)setError:(id)a3;
- (void)setExpression:(id)a3;
- (void)setIsCanceled:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setResult:(id)a3;
- (void)setResultHandler:(id)a3;
- (void)update;
@end

@implementation CalculateRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_expression, 0);
}

- (void)setResultHandler:(id)a3
{
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void)setIsCanceled:(BOOL)a3
{
  self->_isCanceled = a3;
}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setResult:(id)a3
{
}

- (CalculateResult)result
{
  return self->_result;
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setExpression:(id)a3
{
}

- (NSString)expression
{
  return self->_expression;
}

- (void)finish
{
  +[CalculateRequest _lock];
  BOOL v3 = [(CalculateRequest *)self isCanceled];
  id v7 = [(CalculateRequest *)self result];
  v4 = [(CalculateRequest *)self error];
  [(CalculateRequest *)self setResult:0];
  [(CalculateRequest *)self setError:0];
  [(CalculateRequest *)self setIsCanceled:1];
  +[CalculateRequest _unlock];
  if (!v3)
  {
    v5 = [(CalculateRequest *)self resultHandler];

    if (v5)
    {
      v6 = [(CalculateRequest *)self resultHandler];
      ((void (**)(void, id, void *))v6)[2](v6, v7, v4);
    }
  }
}

- (void)cancel
{
  +[CalculateRequest _lock];
  BOOL v3 = [(CalculateRequest *)self isCanceled];
  [(CalculateRequest *)self setResult:0];
  [(CalculateRequest *)self setError:0];
  [(CalculateRequest *)self setIsCanceled:1];
  +[CalculateRequest _unlock];
  if (!v3)
  {
    v4 = [(CalculateRequest *)self resultHandler];

    if (v4)
    {
      id v5 = [(CalculateRequest *)self resultHandler];
      (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
    }
  }
}

- (void)update
{
  if (+[StocksKitCurrencyCache isEnabled])
  {
    BOOL v3 = +[StocksKitCurrencyCache shared];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __26__CalculateRequest_update__block_invoke;
    v6[3] = &unk_1E6365860;
    v6[4] = self;
    [v3 refreshWithCompletionHandler:v6];
  }
  else
  {
    +[CalculateRequest _lock];
    if ((calculateRequestUpdating & 1) == 0)
    {
      calculateRequestUpdating = 1;
      v4 = +[CalculateRequest serialQueue];
      dispatch_async(v4, &__block_literal_global_886);
    }
    +[CalculateRequest _unlock];
    BOOL v3 = +[CalculateRequest serialQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __26__CalculateRequest_update__block_invoke_3;
    v5[3] = &unk_1E6365CF0;
    v5[4] = self;
    dispatch_async(v3, v5);
  }
}

uint64_t __26__CalculateRequest_update__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) evaluate];
}

uint64_t __26__CalculateRequest_update__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) evaluate];
}

uint64_t __26__CalculateRequest_update__block_invoke_2()
{
  v0 = +[CalculateCurrencyCache shared];
  [v0 refresh];

  +[CalculateRequest _lock];
  calculateRequestUpdating = 0;
  return +[CalculateRequest _unlock];
}

- (void)evaluate
{
  +[CalculateRequest _lock];
  if ([(CalculateRequest *)self isCanceled])
  {
    +[CalculateRequest _unlock];
  }
  else
  {
    [(CalculateRequest *)self setIsCanceled:1];
    [(CalculateRequest *)self setResult:0];
    [(CalculateRequest *)self setError:0];
    char v10 = 0;
    BOOL v3 = [(CalculateRequest *)self expression];
    v4 = [(CalculateRequest *)self options];
    id v9 = 0;
    id v5 = +[Calculate evaluate:v3 options:v4 error:&v9 needsUpdate:&v10];
    id v6 = v9;

    +[CalculateRequest _unlock];
    id v7 = [(CalculateRequest *)self resultHandler];

    if (v7)
    {
      v8 = [(CalculateRequest *)self resultHandler];
      ((void (**)(void, void *, id))v8)[2](v8, v5, v6);
    }
  }
}

+ (id)serialQueue
{
  if (serialQueue_onceToken != -1) {
    dispatch_once(&serialQueue_onceToken, &__block_literal_global_881);
  }
  v2 = (void *)serialQueue_queue;
  return v2;
}

uint64_t __31__CalculateRequest_serialQueue__block_invoke()
{
  serialQueue_queue = (uint64_t)dispatch_queue_create("com.apple.framework.calculate.evaluate", 0);
  return MEMORY[0x1F41817F8]();
}

+ (void)_unlock
{
}

+ (void)_lock
{
  if (_lock_onceToken[0] != -1) {
    dispatch_once(_lock_onceToken, &__block_literal_global_878);
  }
  v2 = (void *)calculateRequestLock;
  [v2 lock];
}

uint64_t __25__CalculateRequest__lock__block_invoke()
{
  calculateRequestLock = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28E08]);
  return MEMORY[0x1F41817F8]();
}

@end