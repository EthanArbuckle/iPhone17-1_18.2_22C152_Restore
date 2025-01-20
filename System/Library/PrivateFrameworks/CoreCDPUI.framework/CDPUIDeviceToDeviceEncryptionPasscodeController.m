@interface CDPUIDeviceToDeviceEncryptionPasscodeController
+ (id)passcodeControllerWithPresenter:(id)a3 vm:(id)a4;
- (BOOL)passcodeViewControllerAllowSkip:(id)a3;
- (CDPUIDeviceToDeviceEncryptionPasscodeValidationDelegate)delegate;
- (id)passcodeValidationCompletion;
- (id)passcodeViewControllerCustomFirstEntryInstructions:(id)a3;
- (void)_userTappedCancel:(id)a3;
- (void)createPasscodeStateWithCompletion:(id)a3;
- (void)dealloc;
- (void)dismissFlowWithLocalSecret:(id)a3 error:(id)a4;
- (void)passcodeViewController:(id)a3 didFinishWithPasscodeCreation:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPasscodeValidationCompletion:(id)a3;
@end

@implementation CDPUIDeviceToDeviceEncryptionPasscodeController

+ (id)passcodeControllerWithPresenter:(id)a3 vm:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init((Class)objc_opt_class());
  v8 = (void *)v7[1];
  v7[1] = v5;
  id v9 = v5;

  v10 = (void *)v7[5];
  v7[5] = v6;

  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2187CF000, a2, OS_LOG_TYPE_DEBUG, "CDPUIDeviceToDeviceEncryptionPasscodeController %p deallocated", (uint8_t *)&v2, 0xCu);
}

- (id)passcodeValidationCompletion
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  p_completionLock = &self->_completionLock;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v7 = __79__CDPUIDeviceToDeviceEncryptionPasscodeController_passcodeValidationCompletion__block_invoke;
  v8 = &unk_26433DD40;
  id v9 = self;
  v10 = &v11;
  uint64_t v3 = v6;
  os_unfair_lock_lock(p_completionLock);
  v7((uint64_t)v3);

  os_unfair_lock_unlock(p_completionLock);
  uint64_t v4 = _Block_copy((const void *)v12[5]);
  _Block_object_dispose(&v11, 8);

  return v4;
}

uint64_t __79__CDPUIDeviceToDeviceEncryptionPasscodeController_passcodeValidationCompletion__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 24));

  return MEMORY[0x270F9A758]();
}

- (void)setPasscodeValidationCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__CDPUIDeviceToDeviceEncryptionPasscodeController_setPasscodeValidationCompletion___block_invoke;
  v7[3] = &unk_26433CEF8;
  p_completionLock = &self->_completionLock;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_unfair_lock_lock(p_completionLock);
  __83__CDPUIDeviceToDeviceEncryptionPasscodeController_setPasscodeValidationCompletion___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_completionLock);
}

uint64_t __83__CDPUIDeviceToDeviceEncryptionPasscodeController_setPasscodeValidationCompletion___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = _Block_copy(*(const void **)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

- (void)createPasscodeStateWithCompletion:(id)a3
{
  id v4 = a3;
  [(CDPUIDeviceToDeviceEncryptionPasscodeController *)self setPasscodeValidationCompletion:v4];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  id v5 = (void *)getBFFPasscodeViewControllerClass_softClass;
  uint64_t v19 = getBFFPasscodeViewControllerClass_softClass;
  if (!getBFFPasscodeViewControllerClass_softClass)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __getBFFPasscodeViewControllerClass_block_invoke;
    v15[3] = &unk_26433D708;
    v15[4] = &v16;
    __getBFFPasscodeViewControllerClass_block_invoke((uint64_t)v15);
    id v5 = (void *)v17[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v16, 8);
  v7 = (BFFPasscodeViewController *)objc_alloc_init(v6);
  passcodeViewController = self->_passcodeViewController;
  self->_passcodeViewController = v7;

  [(BFFPasscodeViewController *)self->_passcodeViewController setPasscodeCreationDelegate:self];
  id v9 = [(BFFPasscodeViewController *)self->_passcodeViewController view];
  v10 = [(CDPUIDeviceToDeviceEncryptionMessagingViewModelProtocol *)self->_vm title];
  [v9 setTitle:v10];

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__userTappedCancel_];
  v12 = [(BFFPasscodeViewController *)self->_passcodeViewController navigationItem];
  [v12 setLeftBarButtonItem:v11 animated:0];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(UIViewController *)self->_presentingViewController pushViewController:self->_passcodeViewController animated:1];
  }
  else
  {
    uint64_t v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[CDPUIDeviceToDeviceEncryptionPasscodeController createPasscodeStateWithCompletion:](v13);
    }

    v14 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5004);
    [(CDPUIDeviceToDeviceEncryptionPasscodeController *)self dismissFlowWithLocalSecret:0 error:v14];
  }
}

- (void)dismissFlowWithLocalSecret:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CDPUIDeviceToDeviceEncryptionPasscodeController *)self passcodeValidationCompletion];
  v8[2](v8, v7, v6);
}

- (void)_userTappedCancel:(id)a3
{
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2187CF000, v4, OS_LOG_TYPE_DEFAULT, "Cancel was tapped", buf, 2u);
  }

  id v5 = [(CDPUIDeviceToDeviceEncryptionPasscodeController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CDPUIDeviceToDeviceEncryptionPasscodeController *)self delegate];
    id v8 = [(BFFPasscodeViewController *)self->_passcodeViewController navigationController];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __69__CDPUIDeviceToDeviceEncryptionPasscodeController__userTappedCancel___block_invoke;
    v9[3] = &unk_26433DD68;
    v9[4] = self;
    [v7 localSecretValidationCanCancelWithViewController:v8 completion:v9];
  }
  else
  {
    id v7 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5307);
    [(CDPUIDeviceToDeviceEncryptionPasscodeController *)self dismissFlowWithLocalSecret:0 error:v7];
  }
}

void __69__CDPUIDeviceToDeviceEncryptionPasscodeController__userTappedCancel___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    int v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5307);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v2 dismissFlowWithLocalSecret:0 error:v3];
  }
}

- (BOOL)passcodeViewControllerAllowSkip:(id)a3
{
  return 0;
}

- (id)passcodeViewControllerCustomFirstEntryInstructions:(id)a3
{
  return (id)[(CDPUIDeviceToDeviceEncryptionMessagingViewModelProtocol *)self->_vm message];
}

- (void)passcodeViewController:(id)a3 didFinishWithPasscodeCreation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [v6 passcodeInputView];
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2050000000;
    id v9 = (void *)getBFFSimplePasscodeInputViewClass_softClass;
    uint64_t v20 = getBFFSimplePasscodeInputViewClass_softClass;
    if (!getBFFSimplePasscodeInputViewClass_softClass)
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __getBFFSimplePasscodeInputViewClass_block_invoke;
      v16[3] = &unk_26433D708;
      v16[4] = &v17;
      __getBFFSimplePasscodeInputViewClass_block_invoke((uint64_t)v16);
      id v9 = (void *)v18[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v17, 8);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 3;
    }

    v12 = (void *)[objc_alloc(MEMORY[0x263F343B0]) initWithValidatedSecret:v7 secretType:v11];
    uint64_t v13 = self;
    v14 = v12;
    v15 = 0;
  }
  else
  {
    v12 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5307);
    uint64_t v13 = self;
    v14 = 0;
    v15 = v12;
  }
  [(CDPUIDeviceToDeviceEncryptionPasscodeController *)v13 dismissFlowWithLocalSecret:v14 error:v15];
}

- (CDPUIDeviceToDeviceEncryptionPasscodeValidationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CDPUIDeviceToDeviceEncryptionPasscodeValidationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vm, 0);
  objc_storeStrong(&self->_passcodeValidationCompletion, 0);
  objc_storeStrong((id *)&self->_passcodeViewController, 0);

  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

- (void)createPasscodeStateWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2187CF000, log, OS_LOG_TYPE_DEBUG, "CDPUIDeviceToDeviceEncryptionPasscodeController not supported in a non navigation stack", v1, 2u);
}

@end