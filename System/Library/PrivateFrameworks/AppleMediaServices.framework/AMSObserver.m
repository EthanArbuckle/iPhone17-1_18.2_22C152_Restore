@interface AMSObserver
- (AMSObserver)initWithResultBlock:(id)a3;
- (AMSObserver)initWithResultBlock:(id)a3 completionBlock:(id)a4 failureBlock:(id)a5;
- (id)completionBlock;
- (id)failureBlock;
- (id)resultBlock;
- (void)_sendCompletionUsingQueue:(id)a3;
- (void)_sendFailure:(id)a3 usingQueue:(id)a4;
- (void)_sendResult:(id)a3 usingQueue:(id)a4;
- (void)setCompletionBlock:(id)a3;
- (void)setFailureBlock:(id)a3;
- (void)setResultBlock:(id)a3;
@end

@implementation AMSObserver

- (AMSObserver)initWithResultBlock:(id)a3 completionBlock:(id)a4 failureBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AMSObserver;
  v11 = [(AMSObserver *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    id completionBlock = v11->_completionBlock;
    v11->_id completionBlock = (id)v12;

    uint64_t v14 = [v10 copy];
    id failureBlock = v11->_failureBlock;
    v11->_id failureBlock = (id)v14;

    uint64_t v16 = [v8 copy];
    id resultBlock = v11->_resultBlock;
    v11->_id resultBlock = (id)v16;
  }
  return v11;
}

- (AMSObserver)initWithResultBlock:(id)a3
{
  return [(AMSObserver *)self initWithResultBlock:a3 completionBlock:0 failureBlock:0];
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)failureBlock
{
  return self->_failureBlock;
}

- (void)setFailureBlock:(id)a3
{
}

- (id)resultBlock
{
  return self->_resultBlock;
}

- (void)setResultBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultBlock, 0);
  objc_storeStrong(&self->_failureBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
}

- (void)_sendCompletionUsingQueue:(id)a3
{
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(AMSObserver *)v5 completionBlock];
  objc_sync_exit(v5);

  if (v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__AMSObserver_AMSObservable___sendCompletionUsingQueue___block_invoke;
    block[3] = &unk_1E55A2790;
    id v8 = v6;
    dispatch_async(v4, block);
  }
}

uint64_t __56__AMSObserver_AMSObservable___sendCompletionUsingQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_sendFailure:(id)a3 usingQueue:(id)a4
{
  id v6 = a3;
  v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = [(AMSObserver *)v8 failureBlock];
  objc_sync_exit(v8);

  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__AMSObserver_AMSObservable___sendFailure_usingQueue___block_invoke;
    v10[3] = &unk_1E559F868;
    id v12 = v9;
    id v11 = v6;
    dispatch_async(v7, v10);
  }
}

uint64_t __54__AMSObserver_AMSObservable___sendFailure_usingQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_sendResult:(id)a3 usingQueue:(id)a4
{
  id v6 = a3;
  v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = [(AMSObserver *)v8 resultBlock];
  objc_sync_exit(v8);

  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__AMSObserver_AMSObservable___sendResult_usingQueue___block_invoke;
    v10[3] = &unk_1E559F868;
    id v12 = v9;
    id v11 = v6;
    dispatch_async(v7, v10);
  }
}

uint64_t __53__AMSObserver_AMSObservable___sendResult_usingQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end