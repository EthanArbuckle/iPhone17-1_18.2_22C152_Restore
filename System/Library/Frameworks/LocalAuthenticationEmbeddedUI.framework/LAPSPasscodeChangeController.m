@interface LAPSPasscodeChangeController
- (LAPSPasscodeChangeController)initWithSystem:(id)a3 authorizer:(id)a4 ui:(id)a5;
- (LAPSPasscodeChangeController)initWithSystem:(id)a3 authorizer:(id)a4 ui:(id)a5 options:(id)a6;
- (void)_checkCanChangePasscodeWithCompletion:(id)a3;
- (void)_extractPasscode:(id)a3 completion:(id)a4;
- (void)_fetchNewPasscode:(id)a3 completion:(id)a4;
- (void)_fetchOldPasscode:(id)a3 completion:(id)a4;
- (void)_injectNewPasscodeWithCompletion:(id)a3;
- (void)_injectOldPasscodeWithCompletion:(id)a3;
- (void)_notifyCompletionWithPasscode:(id)a3 error:(id)a4;
- (void)_presentErrorIfNeed:(id)a3 completion:(id)a4;
- (void)_runWithCompletion:(id)a3;
- (void)cancel;
- (void)passcodeChangeUI:(id)a3 verifyNewPasscode:(id)a4 completion:(id)a5;
- (void)passcodeChangeUI:(id)a3 verifyPasscode:(id)a4 completion:(id)a5;
- (void)passcodeChangeUIDidDisappear:(id)a3;
- (void)startWithCompletion:(id)a3;
@end

@implementation LAPSPasscodeChangeController

- (LAPSPasscodeChangeController)initWithSystem:(id)a3 authorizer:(id)a4 ui:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(LAPSPasscodeChangeControllerOptions);
  v12 = [(LAPSPasscodeChangeController *)self initWithSystem:v10 authorizer:v9 ui:v8 options:v11];

  return v12;
}

- (LAPSPasscodeChangeController)initWithSystem:(id)a3 authorizer:(id)a4 ui:(id)a5 options:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)LAPSPasscodeChangeController;
  v15 = [(LAPSPasscodeChangeController *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_system, a3);
    objc_storeStrong((id *)&v16->_authorizer, a4);
    objc_storeStrong((id *)&v16->_ui, a5);
    objc_storeStrong((id *)&v16->_options, a6);
    [(LAPSPasscodeChangeUI *)v16->_ui setDelegate:v16];
  }

  return v16;
}

- (void)startWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x2455CBB70]();
  id handler = self->_handler;
  self->_id handler = v5;

  objc_initWeak(&location, self);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __52__LAPSPasscodeChangeController_startWithCompletion___block_invoke;
  id v11 = &unk_26506F4A8;
  objc_copyWeak(&v12, &location);
  v7 = (void *)MEMORY[0x2455CBB70](&v8);
  -[LAPSPasscodeChangeController _runWithCompletion:](self, "_runWithCompletion:", v7, v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __52__LAPSPasscodeChangeController_startWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _notifyCompletionWithPasscode:v8 error:v5];
  }
}

- (void)cancel
{
  id v3 = +[LAPSErrorBuilder clientCanceledError];
  [(LAPSPasscodeChangeController *)self _notifyCompletionWithPasscode:0 error:v3];
}

- (void)passcodeChangeUI:(id)a3 verifyPasscode:(id)a4 completion:(id)a5
{
}

- (void)passcodeChangeUI:(id)a3 verifyNewPasscode:(id)a4 completion:(id)a5
{
}

- (void)passcodeChangeUIDidDisappear:(id)a3
{
  id v4 = +[LAPSErrorBuilder systemCanceledErrorWithDebugDescription:@"Service UI was dismissed"];
  [(LAPSPasscodeChangeController *)self _notifyCompletionWithPasscode:0 error:v4];
}

- (void)_notifyCompletionWithPasscode:(id)a3 error:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = self->_handler == 0;
  uint64_t v9 = LACLogPasscodeService();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138543362;
      v19 = self;
      _os_log_impl(&dword_23F450000, v9, OS_LOG_TYPE_INFO, "%{public}@ Ignoring redundant completion call", buf, 0xCu);
    }
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138543362;
      v19 = self;
      _os_log_impl(&dword_23F450000, v9, OS_LOG_TYPE_INFO, "%{public}@ will notify completion", buf, 0xCu);
    }

    id v11 = (void *)[self->_handler copy];
    id handler = self->_handler;
    self->_id handler = 0;

    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __68__LAPSPasscodeChangeController__notifyCompletionWithPasscode_error___block_invoke;
    v13[3] = &unk_26506F4F8;
    objc_copyWeak(&v17, (id *)buf);
    uint64_t v9 = v11;
    v16 = v9;
    id v14 = v6;
    id v15 = v7;
    [(LAPSPasscodeChangeController *)self _presentErrorIfNeed:v15 completion:v13];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
}

void __68__LAPSPasscodeChangeController__notifyCompletionWithPasscode_error___block_invoke(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained[4] dismissUIAfterCompletion])
    {
      (*((void (**)(void))a1[6] + 2))();
      [v3[2] deactivateWithCompletion:&__block_literal_global_7];
    }
    else
    {
      id v4 = v3[2];
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __68__LAPSPasscodeChangeController__notifyCompletionWithPasscode_error___block_invoke_3;
      v5[3] = &unk_26506F4D0;
      id v8 = a1[6];
      id v6 = a1[4];
      id v7 = a1[5];
      [v4 deactivateWithCompletion:v5];
    }
  }
}

uint64_t __68__LAPSPasscodeChangeController__notifyCompletionWithPasscode_error___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_presentErrorIfNeed:(id)a3 completion:(id)a4
{
  id v14 = a3;
  id v7 = (void (**)(id, void))a4;
  if (v14
    && (BOOL v8 = +[LAPSErrorBuilder checkErrorIsInteractive:v14], v6 = v14, v8))
  {
    uint64_t v9 = [v14 userInfo];
    BOOL v10 = [v9 objectForKey:*MEMORY[0x263F08320]];

    id v11 = [v14 userInfo];
    id v12 = [v11 objectForKey:*MEMORY[0x263F08348]];

    id v13 = +[LALocalizedString ok];
    [(LAPSPasscodeChangeUI *)self->_ui presentAlertWithTitle:v10 message:v12 button:v13 completion:v7];
  }
  else
  {
    ((void (**)(id, id))v7)[2](v7, v6);
  }
}

- (void)_runWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__LAPSPasscodeChangeController__runWithCompletion___block_invoke;
  v6[3] = &unk_26506ECD0;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(LAPSPasscodeChangeController *)self _checkCanChangePasscodeWithCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __51__LAPSPasscodeChangeController__runWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      id v6 = [WeakRetained[1] oldPasscodeRequest];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __51__LAPSPasscodeChangeController__runWithCompletion___block_invoke_2;
      v7[3] = &unk_26506F570;
      objc_copyWeak(&v9, (id *)(a1 + 40));
      id v8 = *(id *)(a1 + 32);
      [v5 _fetchOldPasscode:v6 completion:v7];

      objc_destroyWeak(&v9);
    }
  }
}

void __51__LAPSPasscodeChangeController__runWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      id v9 = (void *)[WeakRetained[1] newPasscodeRequest];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __51__LAPSPasscodeChangeController__runWithCompletion___block_invoke_3;
      v10[3] = &unk_26506F548;
      objc_copyWeak(&v13, (id *)(a1 + 40));
      id v12 = *(id *)(a1 + 32);
      id v11 = v5;
      [v8 _fetchNewPasscode:v9 completion:v10];

      objc_destroyWeak(&v13);
    }
  }
}

void __51__LAPSPasscodeChangeController__runWithCompletion___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      (*((void (**)(void))a1[5] + 2))();
    }
    else
    {
      id v9 = (void *)*((void *)WeakRetained + 1);
      id v10 = a1[4];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __51__LAPSPasscodeChangeController__runWithCompletion___block_invoke_4;
      v11[3] = &unk_26506F520;
      objc_copyWeak(&v15, a1 + 6);
      id v14 = a1[5];
      id v12 = a1[4];
      id v13 = v5;
      [v9 changePasscode:v10 to:v13 completion:v11];

      objc_destroyWeak(&v15);
    }
  }
}

void __51__LAPSPasscodeChangeController__runWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v8)
    {
      (*(void (**)(void, void))(v5 + 16))(*(void *)(a1 + 48), 0);
    }
    else
    {
      if ([WeakRetained[4] skipNewPasscode]) {
        id v6 = *(void **)(a1 + 32);
      }
      else {
        id v6 = *(void **)(a1 + 40);
      }
      id v7 = [v6 passcode];
      (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v7, 0);
    }
  }
}

- (void)_checkCanChangePasscodeWithCompletion:(id)a3
{
  id v4 = a3;
  system = self->_system;
  id v14 = 0;
  char v6 = [(LAPSPasscodeChangeSystem *)system canChangePasscodeWithError:&v14];
  id v7 = v14;
  id v8 = v7;
  if (v6)
  {
    objc_initWeak(&location, self);
    authorizer = self->_authorizer;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __70__LAPSPasscodeChangeController__checkCanChangePasscodeWithCompletion___block_invoke;
    v10[3] = &unk_26506ECD0;
    objc_copyWeak(&v12, &location);
    id v11 = v4;
    [(LAPSPasscodeChangeAuthorizer *)authorizer authorizeWithCompletion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    if (!v7) {
      -[LAPSPasscodeChangeController _checkCanChangePasscodeWithCompletion:]();
    }
    (*((void (**)(id, id))v4 + 2))(v4, v7);
  }
}

void __70__LAPSPasscodeChangeController__checkCanChangePasscodeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_fetchOldPasscode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(LAPSPasscodeChangeControllerOptions *)self->_options skipOldPasscode]
    || ([(LAPSPasscodeChangeControllerOptions *)self->_options oldPasscode],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    [(LAPSPasscodeChangeController *)self _injectOldPasscodeWithCompletion:v7];
  }
  else
  {
    objc_initWeak(&location, self);
    ui = self->_ui;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __61__LAPSPasscodeChangeController__fetchOldPasscode_completion___block_invoke;
    v10[3] = &unk_26506F570;
    objc_copyWeak(&v12, &location);
    id v11 = v7;
    [(LAPSPasscodeChangeUI *)ui fetchOldPasscode:v6 completion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __61__LAPSPasscodeChangeController__fetchOldPasscode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  if (!(v5 | v6)) {
    __61__LAPSPasscodeChangeController__fetchOldPasscode_completion___block_invoke_cold_1();
  }
  id v7 = (void *)v6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v7)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      id v10 = (void *)*((void *)WeakRetained + 1);
      id v11 = [(id)v5 passcode];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __61__LAPSPasscodeChangeController__fetchOldPasscode_completion___block_invoke_2;
      v12[3] = &unk_26506F598;
      objc_copyWeak(&v15, (id *)(a1 + 40));
      id v14 = *(id *)(a1 + 32);
      id v13 = (id)v5;
      [v10 verifyPasscode:v11 completion:v12];

      objc_destroyWeak(&v15);
    }
  }
}

void __61__LAPSPasscodeChangeController__fetchOldPasscode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_injectOldPasscodeWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  if (![(LAPSPasscodeChangeControllerOptions *)self->_options skipOldPasscode])
  {
    unint64_t v5 = [(LAPSPasscodeChangeControllerOptions *)self->_options oldPasscode];
    if (!v5) {
      -[LAPSPasscodeChangeController _injectOldPasscodeWithCompletion:]();
    }
  }
  if ([(LAPSPasscodeChangeControllerOptions *)self->_options skipOldPasscode])
  {
    unint64_t v6 = [LAPSFetchOldPasscodeResult alloc];
    id v7 = +[LAPSPasscode emptyPasscode];
    id v8 = [(LAPSFetchOldPasscodeResult *)v6 initWithPasscode:v7];
    v4[2](v4, v8, 0);
  }
  else
  {
    id v9 = [(LAPSPasscodeChangeControllerOptions *)self->_options oldPasscode];

    if (v9)
    {
      id v10 = [(LAPSPasscodeChangeControllerOptions *)self->_options oldPasscode];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __65__LAPSPasscodeChangeController__injectOldPasscodeWithCompletion___block_invoke;
      v12[3] = &unk_26506F5C0;
      id v13 = v4;
      [(LAPSPasscodeChangeController *)self _extractPasscode:v10 completion:v12];
    }
    else
    {
      id v11 = +[LAPSErrorBuilder genericErrorWithDebugDescription:@"Unexpected controller configuration"];
      ((void (**)(id, void *, void *))v4)[2](v4, 0, v11);
    }
  }
}

void __65__LAPSPasscodeChangeController__injectOldPasscodeWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v5, 0, a3);
  }
  else
  {
    unint64_t v6 = [[LAPSFetchOldPasscodeResult alloc] initWithPasscode:v7];
    (*(void (**)(uint64_t, LAPSFetchOldPasscodeResult *, void))(v5 + 16))(v5, v6, 0);
  }
}

- (void)_fetchNewPasscode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(LAPSPasscodeChangeControllerOptions *)self->_options skipNewPasscode]
    || ([(LAPSPasscodeChangeControllerOptions *)self->_options newPasscode],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    [(LAPSPasscodeChangeController *)self _injectNewPasscodeWithCompletion:v7];
  }
  else
  {
    objc_initWeak(&location, self);
    ui = self->_ui;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __61__LAPSPasscodeChangeController__fetchNewPasscode_completion___block_invoke;
    v10[3] = &unk_26506F5E8;
    objc_copyWeak(&v12, &location);
    id v11 = v7;
    [(LAPSPasscodeChangeUI *)ui fetchNewPasscode:v6 completion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __61__LAPSPasscodeChangeController__fetchNewPasscode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  if (!(v5 | v6)) {
    __61__LAPSPasscodeChangeController__fetchNewPasscode_completion___block_invoke_cold_1();
  }
  id v7 = (void *)v6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v7)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      id v10 = (void *)*((void *)WeakRetained + 1);
      id v11 = [(id)v5 passcode];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __61__LAPSPasscodeChangeController__fetchNewPasscode_completion___block_invoke_2;
      v12[3] = &unk_26506F598;
      objc_copyWeak(&v15, (id *)(a1 + 40));
      id v14 = *(id *)(a1 + 32);
      id v13 = (id)v5;
      [v10 verifyNewPasscode:v11 completion:v12];

      objc_destroyWeak(&v15);
    }
  }
}

void __61__LAPSPasscodeChangeController__fetchNewPasscode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v7)
    {
      id v4 = [v7 domain];
      if ([v4 isEqualToString:@"com.apple.LocalAuthentication.LAPSErrorDomain"])
      {
        uint64_t v5 = [v7 code];

        if (v5 == 5) {
          goto LABEL_5;
        }
      }
      else
      {
      }
      unint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      goto LABEL_8;
    }
LABEL_5:
    unint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_8:
    v6();
  }
}

- (void)_injectNewPasscodeWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  if (![(LAPSPasscodeChangeControllerOptions *)self->_options skipNewPasscode])
  {
    uint64_t v5 = [(LAPSPasscodeChangeControllerOptions *)self->_options newPasscode];
    if (!v5) {
      -[LAPSPasscodeChangeController _injectNewPasscodeWithCompletion:]();
    }
  }
  if ([(LAPSPasscodeChangeControllerOptions *)self->_options skipNewPasscode])
  {
    unint64_t v6 = [LAPSFetchNewPasscodeResult alloc];
    id v7 = +[LAPSPasscode emptyPasscode];
    id v8 = [(LAPSFetchNewPasscodeResult *)v6 initWithPasscode:v7 isPasscodeRecoveryEnabled:[(LAPSPasscodeChangeControllerOptions *)self->_options skipNewPasscode] ^ 1];
    v4[2](v4, v8, 0);
  }
  else
  {
    id v9 = [(LAPSPasscodeChangeControllerOptions *)self->_options newPasscode];

    if (v9)
    {
      id v10 = [(LAPSPasscodeChangeControllerOptions *)self->_options newPasscode];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __65__LAPSPasscodeChangeController__injectNewPasscodeWithCompletion___block_invoke;
      v12[3] = &unk_26506F610;
      void v12[4] = self;
      id v13 = v4;
      [(LAPSPasscodeChangeController *)self _extractPasscode:v10 completion:v12];
    }
    else
    {
      id v11 = +[LAPSErrorBuilder genericErrorWithDebugDescription:@"Unexpected controller configuration"];
      ((void (**)(id, void *, void *))v4)[2](v4, 0, v11);
    }
  }
}

void __65__LAPSPasscodeChangeController__injectNewPasscodeWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  uint64_t v5 = *(void *)(a1 + 40);
  if (a3)
  {
    (*(void (**)(void, void, uint64_t))(v5 + 16))(*(void *)(a1 + 40), 0, a3);
  }
  else
  {
    unint64_t v6 = -[LAPSFetchNewPasscodeResult initWithPasscode:isPasscodeRecoveryEnabled:]([LAPSFetchNewPasscodeResult alloc], "initWithPasscode:isPasscodeRecoveryEnabled:", v7, [*(id *)(*(void *)(a1 + 32) + 32) skipNewPasscode] ^ 1);
    (*(void (**)(uint64_t, LAPSFetchNewPasscodeResult *, void))(v5 + 16))(v5, v6, 0);
  }
}

- (void)_extractPasscode:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__LAPSPasscodeChangeController__extractPasscode_completion___block_invoke;
  v7[3] = &unk_26506F638;
  id v8 = v5;
  id v6 = v5;
  [a3 extractPasswordWithCompletion:v7];
}

void __60__LAPSPasscodeChangeController__extractPasscode_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  if (a3)
  {
    id v6 = +[LAPSErrorBuilder genericErrorWithUnderlyingError:a3];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
  }
  else
  {
    id v7 = [LAPSPasscode alloc];
    id v6 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
    id v8 = [(LAPSPasscode *)v7 initWithPasscode:v6];
    (*(void (**)(uint64_t, LAPSPasscode *, void))(v5 + 16))(v5, v8, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_authorizer, 0);
  objc_storeStrong((id *)&self->_ui, 0);

  objc_storeStrong((id *)&self->_system, 0);
}

- (void)_checkCanChangePasscodeWithCompletion:.cold.1()
{
}

void __61__LAPSPasscodeChangeController__fetchOldPasscode_completion___block_invoke_cold_1()
{
  __assert_rtn("-[LAPSPasscodeChangeController _fetchOldPasscode:completion:]_block_invoke", "LAPSPasscodeChangeController.m", 216, "result != nil || error != nil");
}

- (void)_injectOldPasscodeWithCompletion:.cold.1()
{
}

void __61__LAPSPasscodeChangeController__fetchNewPasscode_completion___block_invoke_cold_1()
{
  __assert_rtn("-[LAPSPasscodeChangeController _fetchNewPasscode:completion:]_block_invoke", "LAPSPasscodeChangeController.m", 273, "result != nil || error != nil");
}

- (void)_injectNewPasscodeWithCompletion:.cold.1()
{
}

@end