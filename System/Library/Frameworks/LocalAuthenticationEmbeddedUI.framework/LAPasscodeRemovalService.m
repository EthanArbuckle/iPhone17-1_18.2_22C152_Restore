@interface LAPasscodeRemovalService
- (LAPasscodeRemovalService)init;
- (LAPasscodeRemovalService)initWithControllerBuilder:(id)a3;
- (void)_startOperation:(id)a3 completion:(id)a4;
- (void)cancel;
- (void)startInParentVC:(id)a3 completion:(id)a4;
- (void)startInParentVC:(id)a3 options:(id)a4 completion:(id)a5;
@end

@implementation LAPasscodeRemovalService

- (LAPasscodeRemovalService)init
{
  v3 = objc_alloc_init(LAPSPasscodeChangeControllerProvider);
  v4 = [(LAPasscodeRemovalService *)self initWithControllerBuilder:v3];

  return v4;
}

- (LAPasscodeRemovalService)initWithControllerBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAPasscodeRemovalService;
  v6 = [(LAPasscodeRemovalService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_builder, a3);
  }

  return v7;
}

- (void)startInParentVC:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(LAPasscodeRemovalServiceOptions);
  [(LAPasscodeRemovalService *)self startInParentVC:v7 options:v8 completion:v6];
}

- (void)startInParentVC:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = LACLogPasscodeService();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v25 = self;
    __int16 v26 = 2114;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_impl(&dword_23F450000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ will start on parentVC: %{public}@ with options: %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  builder = self->_builder;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __63__LAPasscodeRemovalService_startInParentVC_options_completion___block_invoke;
  v21[3] = &unk_26506EC30;
  id v13 = v8;
  id v22 = v13;
  id v14 = v9;
  id v23 = v14;
  v15 = __63__LAPasscodeRemovalService_startInParentVC_options_completion___block_invoke((uint64_t)v21);
  v16 = [(LAPSPasscodeChangeControllerProviding *)builder passcodeRemovalControllerWithOptions:v15];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __63__LAPasscodeRemovalService_startInParentVC_options_completion___block_invoke_2;
  v18[3] = &unk_26506ECD0;
  objc_copyWeak(&v20, (id *)buf);
  id v17 = v10;
  id v19 = v17;
  [(LAPasscodeRemovalService *)self _startOperation:v16 completion:v18];

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

LAPSPasscodeChangeControllerProviderOptions *__63__LAPasscodeRemovalService_startInParentVC_options_completion___block_invoke(uint64_t a1)
{
  v2 = [[LAPSPasscodeChangeControllerProviderOptions alloc] initWithParentVC:*(void *)(a1 + 32)];
  v3 = [*(id *)(a1 + 40) title];
  if (v3)
  {
    [(LAPSPasscodeChangeControllerProviderOptions *)v2 setTitle:v3];
  }
  else
  {
    v4 = +[LALocalizedString passcodeRemovalTitle];
    [(LAPSPasscodeChangeControllerProviderOptions *)v2 setTitle:v4];
  }
  id v5 = [*(id *)(a1 + 40) passcodePrompt];
  if (v5)
  {
    [(LAPSPasscodeChangeControllerProviderOptions *)v2 setOldPasscodePrompt:v5];
  }
  else
  {
    id v6 = +[LALocalizedString passcodeRemovalOldPasscode];
    [(LAPSPasscodeChangeControllerProviderOptions *)v2 setOldPasscodePrompt:v6];
  }

  return v2;
}

void __63__LAPasscodeRemovalService_startInParentVC_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = LACLogPasscodeService();
  os_log_type_t v5 = 16 * (v3 != 0);
  if (os_log_type_enabled(v4, v5))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v7 = 138543618;
    id v8 = WeakRetained;
    __int16 v9 = 2114;
    id v10 = v3;
    _os_log_impl(&dword_23F450000, v4, v5, "%{public}@ did finish (error=%{public}@)", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancel
{
  id v3 = LACLogPasscodeService();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    [(LAPasscodeVerificationService *)(uint64_t)self cancel];
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
  [WeakRetained cancel];
}

- (void)_startOperation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_storeWeak((id *)&self->_operation, v6);
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__LAPasscodeRemovalService__startOperation_completion___block_invoke;
  v10[3] = &unk_26506EC80;
  objc_copyWeak(&v13, &location);
  id v8 = v7;
  id v12 = v8;
  id v9 = v6;
  id v11 = v9;
  [v9 startWithCompletion:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __55__LAPasscodeRemovalService__startOperation_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = +[LAPasscodeServiceErrorBuilder redactError:v7];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_operation);

  objc_storeStrong((id *)&self->_builder, 0);
}

@end