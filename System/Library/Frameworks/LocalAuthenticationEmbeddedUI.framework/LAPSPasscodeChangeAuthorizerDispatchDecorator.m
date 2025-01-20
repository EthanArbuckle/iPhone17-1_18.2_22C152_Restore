@interface LAPSPasscodeChangeAuthorizerDispatchDecorator
- (LAPSPasscodeChangeAuthorizerDispatchDecorator)initWithAuthorizer:(id)a3;
- (void)_performOnBackgroundQueue:(id)a3;
- (void)_performOnMainQueue:(id)a3;
- (void)authorizeWithCompletion:(id)a3;
@end

@implementation LAPSPasscodeChangeAuthorizerDispatchDecorator

- (LAPSPasscodeChangeAuthorizerDispatchDecorator)initWithAuthorizer:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LAPSPasscodeChangeAuthorizerDispatchDecorator;
  v6 = [(LAPSPasscodeChangeAuthorizerDispatchDecorator *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_authorizer, a3);
    v8 = (void *)MEMORY[0x263F52428];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    uint64_t v11 = [v8 createUserInitiatedSerialQueueWithIdentifier:v10];
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v11;
  }
  return v7;
}

- (void)authorizeWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__LAPSPasscodeChangeAuthorizerDispatchDecorator_authorizeWithCompletion___block_invoke;
  v6[3] = &unk_26506ECF8;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(LAPSPasscodeChangeAuthorizerDispatchDecorator *)self _performOnBackgroundQueue:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __73__LAPSPasscodeChangeAuthorizerDispatchDecorator_authorizeWithCompletion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)*((void *)WeakRetained + 1);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __73__LAPSPasscodeChangeAuthorizerDispatchDecorator_authorizeWithCompletion___block_invoke_2;
    v6[3] = &unk_26506ECD0;
    objc_copyWeak(&v8, v2);
    id v7 = *(id *)(a1 + 32);
    [v5 authorizeWithCompletion:v6];

    objc_destroyWeak(&v8);
  }
}

void __73__LAPSPasscodeChangeAuthorizerDispatchDecorator_authorizeWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __73__LAPSPasscodeChangeAuthorizerDispatchDecorator_authorizeWithCompletion___block_invoke_3;
    v5[3] = &unk_26506ECA8;
    id v7 = *(id *)(a1 + 32);
    id v6 = v3;
    [WeakRetained _performOnMainQueue:v5];
  }
}

uint64_t __73__LAPSPasscodeChangeAuthorizerDispatchDecorator_authorizeWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_performOnBackgroundQueue:(id)a3
{
}

- (void)_performOnMainQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_authorizer, 0);
}

@end