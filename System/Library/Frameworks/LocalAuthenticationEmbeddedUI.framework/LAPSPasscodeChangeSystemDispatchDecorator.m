@interface LAPSPasscodeChangeSystemDispatchDecorator
- (BOOL)canChangePasscodeWithError:(id *)a3;
- (BOOL)hasPasscode;
- (LAPSPasscodeChangeSystemDispatchDecorator)initWithSystem:(id)a3;
- (LAPSPasscodeChangeSystemDispatchDecorator)initWithSystem:(id)a3 workQueue:(id)a4;
- (id)lastPasscodeChange;
- (id)newPasscodeRequest;
- (id)oldPasscodeRequest;
- (void)_performOnBackgroundQueue:(id)a3;
- (void)_performOnMainQueue:(id)a3;
- (void)changePasscode:(id)a3 to:(id)a4 completion:(id)a5;
- (void)verifyNewPasscode:(id)a3 completion:(id)a4;
- (void)verifyPasscode:(id)a3 completion:(id)a4;
@end

@implementation LAPSPasscodeChangeSystemDispatchDecorator

- (LAPSPasscodeChangeSystemDispatchDecorator)initWithSystem:(id)a3
{
  v4 = (void *)MEMORY[0x263F52428];
  id v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v4 createUserInitiatedSerialQueueWithIdentifier:v7];

  v9 = [(LAPSPasscodeChangeSystemDispatchDecorator *)self initWithSystem:v5 workQueue:v8];
  return v9;
}

- (LAPSPasscodeChangeSystemDispatchDecorator)initWithSystem:(id)a3 workQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LAPSPasscodeChangeSystemDispatchDecorator;
  v9 = [(LAPSPasscodeChangeSystemDispatchDecorator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_system, a3);
    objc_storeStrong((id *)&v10->_workQueue, a4);
  }

  return v10;
}

- (id)oldPasscodeRequest
{
  return (id)[(LAPSPasscodeChangeSystem *)self->_system oldPasscodeRequest];
}

- (id)newPasscodeRequest
{
  return (id)[(LAPSPasscodeChangeSystem *)self->_system newPasscodeRequest];
}

- (BOOL)hasPasscode
{
  return [(LAPSPasscodeChangeSystem *)self->_system hasPasscode];
}

- (id)lastPasscodeChange
{
  return (id)[(LAPSPasscodeChangeSystem *)self->_system lastPasscodeChange];
}

- (void)verifyPasscode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__LAPSPasscodeChangeSystemDispatchDecorator_verifyPasscode_completion___block_invoke;
  v10[3] = &unk_26506EDC0;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  [(LAPSPasscodeChangeSystemDispatchDecorator *)self _performOnBackgroundQueue:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __71__LAPSPasscodeChangeSystemDispatchDecorator_verifyPasscode_completion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)*((void *)WeakRetained + 1);
    uint64_t v6 = *(void *)(a1 + 32);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __71__LAPSPasscodeChangeSystemDispatchDecorator_verifyPasscode_completion___block_invoke_2;
    v7[3] = &unk_26506ECD0;
    objc_copyWeak(&v9, v2);
    id v8 = *(id *)(a1 + 40);
    [v5 verifyPasscode:v6 completion:v7];

    objc_destroyWeak(&v9);
  }
}

void __71__LAPSPasscodeChangeSystemDispatchDecorator_verifyPasscode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __71__LAPSPasscodeChangeSystemDispatchDecorator_verifyPasscode_completion___block_invoke_3;
    v5[3] = &unk_26506ECA8;
    id v7 = *(id *)(a1 + 32);
    id v6 = v3;
    [WeakRetained _performOnMainQueue:v5];
  }
}

uint64_t __71__LAPSPasscodeChangeSystemDispatchDecorator_verifyPasscode_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)verifyNewPasscode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74__LAPSPasscodeChangeSystemDispatchDecorator_verifyNewPasscode_completion___block_invoke;
  v10[3] = &unk_26506EDC0;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  [(LAPSPasscodeChangeSystemDispatchDecorator *)self _performOnBackgroundQueue:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __74__LAPSPasscodeChangeSystemDispatchDecorator_verifyNewPasscode_completion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)*((void *)WeakRetained + 1);
    uint64_t v6 = *(void *)(a1 + 32);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __74__LAPSPasscodeChangeSystemDispatchDecorator_verifyNewPasscode_completion___block_invoke_2;
    v7[3] = &unk_26506ECD0;
    objc_copyWeak(&v9, v2);
    id v8 = *(id *)(a1 + 40);
    [v5 verifyNewPasscode:v6 completion:v7];

    objc_destroyWeak(&v9);
  }
}

void __74__LAPSPasscodeChangeSystemDispatchDecorator_verifyNewPasscode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __74__LAPSPasscodeChangeSystemDispatchDecorator_verifyNewPasscode_completion___block_invoke_3;
    v5[3] = &unk_26506ECA8;
    id v7 = *(id *)(a1 + 32);
    id v6 = v3;
    [WeakRetained _performOnMainQueue:v5];
  }
}

uint64_t __74__LAPSPasscodeChangeSystemDispatchDecorator_verifyNewPasscode_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)canChangePasscodeWithError:(id *)a3
{
  return [(LAPSPasscodeChangeSystem *)self->_system canChangePasscodeWithError:a3];
}

- (void)changePasscode:(id)a3 to:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74__LAPSPasscodeChangeSystemDispatchDecorator_changePasscode_to_completion___block_invoke;
  v14[3] = &unk_26506F000;
  objc_copyWeak(&v18, &location);
  id v11 = v8;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  id v13 = v10;
  id v17 = v13;
  [(LAPSPasscodeChangeSystemDispatchDecorator *)self _performOnBackgroundQueue:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __74__LAPSPasscodeChangeSystemDispatchDecorator_changePasscode_to_completion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)*((void *)WeakRetained + 1);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __74__LAPSPasscodeChangeSystemDispatchDecorator_changePasscode_to_completion___block_invoke_2;
    v8[3] = &unk_26506ECD0;
    objc_copyWeak(&v10, v2);
    id v9 = *(id *)(a1 + 48);
    [v5 changePasscode:v6 to:v7 completion:v8];

    objc_destroyWeak(&v10);
  }
}

void __74__LAPSPasscodeChangeSystemDispatchDecorator_changePasscode_to_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __74__LAPSPasscodeChangeSystemDispatchDecorator_changePasscode_to_completion___block_invoke_3;
    v5[3] = &unk_26506ECA8;
    id v7 = *(id *)(a1 + 32);
    id v6 = v3;
    [WeakRetained _performOnMainQueue:v5];
  }
}

uint64_t __74__LAPSPasscodeChangeSystemDispatchDecorator_changePasscode_to_completion___block_invoke_3(uint64_t a1)
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

  objc_storeStrong((id *)&self->_system, 0);
}

@end