@interface LAPasscodeRecoveryService
- (BOOL)isRecoveryAvailableWithError:(id *)a3;
- (LAPasscodeRecoveryService)init;
- (LAPasscodeRecoveryService)initWithControllerBuilder:(id)a3;
- (id)lastPasscodeChange;
- (void)cancelRecovery;
- (void)startRecoveryInParentVC:(id)a3 completion:(id)a4;
@end

@implementation LAPasscodeRecoveryService

- (LAPasscodeRecoveryService)init
{
  v3 = objc_alloc_init(LAPSPasscodeChangeControllerProvider);
  v4 = [(LAPasscodeRecoveryService *)self initWithControllerBuilder:v3];

  return v4;
}

- (LAPasscodeRecoveryService)initWithControllerBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAPasscodeRecoveryService;
  v6 = [(LAPasscodeRecoveryService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_builder, a3);
  }

  return v7;
}

- (id)lastPasscodeChange
{
  v2 = [(LAPSPasscodeChangeControllerProviding *)self->_builder passcodeRecoveryPreflightController];
  v3 = [v2 lastPasscodeChange];

  return v3;
}

- (BOOL)isRecoveryAvailableWithError:(id *)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = LACLogPasscodeService();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F450000, v5, OS_LOG_TYPE_DEFAULT, "LAPasscodeRecoveryService preflight will start", buf, 2u);
  }

  v6 = [(LAPSPasscodeChangeControllerProviding *)self->_builder passcodeRecoveryPreflightController];
  id v12 = 0;
  char v7 = [v6 canChangePasscodeWithError:&v12];
  id v8 = v12;

  if (a3 && (v7 & 1) == 0)
  {
    *a3 = +[LAPasscodeServiceErrorBuilder redactError:v8];
  }
  objc_super v9 = LACLogPasscodeService();
  os_log_type_t v10 = 16 * (v8 != 0);
  if (os_log_type_enabled(v9, v10))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v8;
    _os_log_impl(&dword_23F450000, v9, v10, "LAPasscodeRecoveryService preflight did finish (error=%{public}@)", buf, 0xCu);
  }

  return v7;
}

- (void)startRecoveryInParentVC:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = LACLogPasscodeService();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v22 = self;
    __int16 v23 = 2114;
    id v24 = v6;
    _os_log_impl(&dword_23F450000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ will start on parentVC: %{public}@", buf, 0x16u);
  }

  builder = self->_builder;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __64__LAPasscodeRecoveryService_startRecoveryInParentVC_completion___block_invoke;
  v19[3] = &unk_26506F328;
  id v10 = v6;
  id v20 = v10;
  v11 = __64__LAPasscodeRecoveryService_startRecoveryInParentVC_completion___block_invoke((uint64_t)v19);
  id v12 = [(LAPSPasscodeChangeControllerProviding *)builder passcodeRecoveryControllerWithOptions:v11];

  objc_initWeak((id *)buf, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__LAPasscodeRecoveryService_startRecoveryInParentVC_completion___block_invoke_2;
  v15[3] = &unk_26506EC80;
  objc_copyWeak(&v18, (id *)buf);
  id v13 = v7;
  id v17 = v13;
  id v14 = v12;
  id v16 = v14;
  [v14 startWithCompletion:v15];
  objc_storeWeak((id *)&self->_recoveryController, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

LAPSPasscodeChangeControllerProviderOptions *__64__LAPasscodeRecoveryService_startRecoveryInParentVC_completion___block_invoke(uint64_t a1)
{
  v1 = [[LAPSPasscodeChangeControllerProviderOptions alloc] initWithParentVC:*(void *)(a1 + 32)];
  v2 = +[LALocalizedString passcodeRecoveryTitle];
  [(LAPSPasscodeChangeControllerProviderOptions *)v1 setTitle:v2];

  v3 = +[LALocalizedString passcodeRecoveryOldPasscode];
  [(LAPSPasscodeChangeControllerProviderOptions *)v1 setOldPasscodePrompt:v3];

  return v1;
}

void __64__LAPasscodeRecoveryService_startRecoveryInParentVC_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = LACLogPasscodeService();
  os_log_type_t v6 = 16 * (v4 != 0);
  if (os_log_type_enabled(v5, v6))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    int v10 = 138543618;
    id v11 = WeakRetained;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_23F450000, v5, v6, "%{public}@ did finish (error=%{public}@)", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  objc_super v9 = +[LAPasscodeServiceErrorBuilder redactError:v4];
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
}

- (void)cancelRecovery
{
  v3 = LACLogPasscodeService();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_23F450000, v3, OS_LOG_TYPE_DEFAULT, "LAPasscodeRecoveryService will cancel", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_recoveryController);
  [WeakRetained cancel];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_recoveryController);

  objc_storeStrong((id *)&self->_builder, 0);
}

@end