@interface LAPasscodeVerificationService
- (LAPasscodeVerificationService)init;
- (LAPasscodeVerificationService)initWithControllerBuilder:(id)a3;
- (void)_startOperation:(id)a3 completion:(id)a4;
- (void)cancel;
- (void)startInParentVC:(id)a3 completion:(id)a4;
- (void)startInParentVC:(id)a3 options:(id)a4 completion:(id)a5;
@end

@implementation LAPasscodeVerificationService

- (LAPasscodeVerificationService)init
{
  v3 = objc_alloc_init(LAPSPasscodeChangeControllerProvider);
  v4 = [(LAPasscodeVerificationService *)self initWithControllerBuilder:v3];

  return v4;
}

- (LAPasscodeVerificationService)initWithControllerBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAPasscodeVerificationService;
  v6 = [(LAPasscodeVerificationService *)&v9 init];
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
  v8 = objc_alloc_init(LAPasscodeVerificationServiceOptions);
  [(LAPasscodeVerificationService *)self startInParentVC:v7 options:v8 completion:v6];
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
  v21[2] = __68__LAPasscodeVerificationService_startInParentVC_options_completion___block_invoke;
  v21[3] = &unk_26506EC30;
  id v13 = v8;
  id v22 = v13;
  id v14 = v9;
  id v23 = v14;
  v15 = __68__LAPasscodeVerificationService_startInParentVC_options_completion___block_invoke((uint64_t)v21);
  v16 = [(LAPSPasscodeChangeControllerProviding *)builder passcodeVerificationControllerWithOptions:v15];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __68__LAPasscodeVerificationService_startInParentVC_options_completion___block_invoke_2;
  v18[3] = &unk_26506EC58;
  objc_copyWeak(&v20, (id *)buf);
  id v17 = v10;
  id v19 = v17;
  [(LAPasscodeVerificationService *)self _startOperation:v16 completion:v18];

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

LAPSPasscodeChangeControllerProviderOptions *__68__LAPasscodeVerificationService_startInParentVC_options_completion___block_invoke(uint64_t a1)
{
  v2 = [[LAPSPasscodeChangeControllerProviderOptions alloc] initWithParentVC:*(void *)(a1 + 32)];
  v3 = [*(id *)(a1 + 40) title];
  if (v3)
  {
    [(LAPSPasscodeChangeControllerProviderOptions *)v2 setTitle:v3];
  }
  else
  {
    v4 = +[LALocalizedString passcodeVerificationTitle];
    [(LAPSPasscodeChangeControllerProviderOptions *)v2 setTitle:v4];
  }
  id v5 = [*(id *)(a1 + 40) passcodePrompt];
  if (v5)
  {
    [(LAPSPasscodeChangeControllerProviderOptions *)v2 setOldPasscodePrompt:v5];
  }
  else
  {
    id v6 = +[LALocalizedString passcodeVerificationPrompt];
    [(LAPSPasscodeChangeControllerProviderOptions *)v2 setOldPasscodePrompt:v6];
  }
  -[LAPSPasscodeChangeControllerProviderOptions setDismissUIAfterCompletion:](v2, "setDismissUIAfterCompletion:", [*(id *)(a1 + 40) dismissUIAfterCompletion]);

  return v2;
}

void __68__LAPasscodeVerificationService_startInParentVC_options_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  id v7 = LACLogPasscodeService();
  os_log_type_t v8 = 16 * (v5 != 0);
  if (os_log_type_enabled(v7, v8))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v12 = 138543618;
    id v13 = WeakRetained;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl(&dword_23F450000, v7, v8, "%{public}@ did finish (error=%{public}@)", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = +[LAPasscodeServiceErrorBuilder redactError:v5];
  (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v6, v11);
}

- (void)cancel
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F450000, a2, OS_LOG_TYPE_ERROR, "%{public}@ will cancel", (uint8_t *)&v2, 0xCu);
}

- (void)_startOperation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_storeWeak((id *)&self->_operation, v6);
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__LAPasscodeVerificationService__startOperation_completion___block_invoke;
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

void __60__LAPasscodeVerificationService__startOperation_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v10 = a2;
  unint64_t v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!(v10 | v5)) {
      __60__LAPasscodeVerificationService__startOperation_completion___block_invoke_cold_1();
    }
    if (v5)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      id v7 = [(id)v10 externalizePasscode];
      uint64_t v8 = *(void *)(a1 + 40);
      if (v7)
      {
        (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v7, 0);
      }
      else
      {
        id v9 = +[LAPasscodeServiceErrorBuilder genericErrorWithDebugDescription:@"Could not externalize passcode"];
        (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_operation);

  objc_storeStrong((id *)&self->_builder, 0);
}

void __60__LAPasscodeVerificationService__startOperation_completion___block_invoke_cold_1()
{
  __assert_rtn("-[LAPasscodeVerificationService _startOperation:completion:]_block_invoke", "LAPasscodeVerificationService.m", 75, "result != nil || error != nil");
}

@end