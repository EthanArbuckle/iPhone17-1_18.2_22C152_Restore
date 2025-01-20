@interface AAUIPasscodeValidateController
+ (id)stingrayControllerWithPresenter:(id)a3;
+ (id)stingrayControllerWithPresenter:(id)a3 forceInline:(BOOL)a4;
- (AAUIPasscodeValidationDelegate)delegate;
- (id)_presentingViewController;
- (id)_specifierForMode:(int)a3;
- (id)passcodeValidationCompletion;
- (void)_setupNavController;
- (void)_showPasscodePromptWithMode:(int)a3;
- (void)createPasscodeStateWithCompletion:(id)a3;
- (void)dealloc;
- (void)devicePINController:(id)a3 canCancelWithCompletion:(id)a4;
- (void)devicePINController:(id)a3 didAcceptSetPIN:(id)a4;
- (void)devicePINController:(id)a3 didFailToSetPinWithError:(id)a4;
- (void)didAcceptEnteredPIN:(id)a3;
- (void)didCancelEnteringPIN;
- (void)dismissFlowWithLocalSecret:(id)a3 error:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPasscodeValidationCompletion:(id)a3;
- (void)validatePasscodeStateWithCompletion:(id)a3;
- (void)validateStingrayPasscodeStateWithCompletion:(id)a3;
@end

@implementation AAUIPasscodeValidateController

+ (id)stingrayControllerWithPresenter:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [a1 stingrayControllerWithPresenter:v4 forceInline:objc_opt_isKindOfClass() & 1];

  return v5;
}

+ (id)stingrayControllerWithPresenter:(id)a3 forceInline:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [NSNumber numberWithBool:v4];
    int v15 = 138412290;
    v16 = v7;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "creating controller with inline forced: %@", (uint8_t *)&v15, 0xCu);
  }
  id v8 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v9 = +[AAUICDPHelper helperWithPresenter:v5];
  v10 = (void *)*((void *)v8 + 1);
  *((void *)v8 + 1) = v9;

  if (v4)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  [*((id *)v8 + 1) setForceInline:isKindOfClass & 1];
  *((_DWORD *)v8 + 10) = 0;
  v12 = [MEMORY[0x263F5FBC0] appearance];
  v13 = [MEMORY[0x263F825C8] labelColor];
  [v12 setTextColor:v13];

  return v8;
}

- (void)dealloc
{
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "AAUIPasscodeValidateController dealloc", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)AAUIPasscodeValidateController;
  [(AAUIPasscodeValidateController *)&v4 dealloc];
}

- (id)passcodeValidationCompletion
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__11;
  int v15 = __Block_byref_object_dispose__11;
  id v16 = 0;
  p_completionLock = &self->_completionLock;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v7 = __62__AAUIPasscodeValidateController_passcodeValidationCompletion__block_invoke;
  id v8 = &unk_263F94050;
  uint64_t v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_completionLock);
  v7((uint64_t)v3);

  os_unfair_lock_unlock(p_completionLock);
  objc_super v4 = _Block_copy((const void *)v12[5]);
  _Block_object_dispose(&v11, 8);

  return v4;
}

uint64_t __62__AAUIPasscodeValidateController_passcodeValidationCompletion__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 32));
  return MEMORY[0x270F9A758]();
}

- (void)setPasscodeValidationCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__AAUIPasscodeValidateController_setPasscodeValidationCompletion___block_invoke;
  v7[3] = &unk_263F92048;
  p_completionLock = &self->_completionLock;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_unfair_lock_lock(p_completionLock);
  __66__AAUIPasscodeValidateController_setPasscodeValidationCompletion___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_completionLock);
}

uint64_t __66__AAUIPasscodeValidateController_setPasscodeValidationCompletion___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = _Block_copy(*(const void **)(a1 + 40));
  return MEMORY[0x270F9A758]();
}

- (void)validateStingrayPasscodeStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Passcode validation was requested", buf, 2u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__AAUIPasscodeValidateController_validateStingrayPasscodeStateWithCompletion___block_invoke;
  v7[3] = &unk_263F94078;
  id v8 = v4;
  id v6 = v4;
  [(AAUIPasscodeValidateController *)self validatePasscodeStateWithCompletion:v7];
}

uint64_t __78__AAUIPasscodeValidateController_validateStingrayPasscodeStateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

- (void)validatePasscodeStateWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Passcode validation was requested", buf, 2u);
  }

  id v6 = [(AAUIPasscodeValidateController *)self passcodeValidationCompletion];

  if (v6)
  {
    v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "Passcode Creation/Validation in progress.", v10, 2u);
    }

    id v8 = objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -4405);
    v4[2](v4, 0, v8);
  }
  else
  {
    [(AAUIPasscodeValidateController *)self setPasscodeValidationCompletion:v4];
    if ([MEMORY[0x263F343A8] hasLocalSecret]) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 0;
    }
    [(AAUIPasscodeValidateController *)self _showPasscodePromptWithMode:v9];
  }
}

- (void)createPasscodeStateWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Create passcode was requested", buf, 2u);
  }

  id v6 = [(AAUIPasscodeValidateController *)self passcodeValidationCompletion];

  if (v6)
  {
    v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "Passcode Creation/Validation in progress.", v9, 2u);
    }

    id v8 = objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -4405);
    v4[2](v4, 0, v8);
  }
  else
  {
    [(AAUIPasscodeValidateController *)self setPasscodeValidationCompletion:v4];
    [(AAUIPasscodeValidateController *)self _showPasscodePromptWithMode:0];
  }
}

- (void)_showPasscodePromptWithMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v3;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Showing passcode collection with mode: %d", (uint8_t *)v11, 8u);
  }

  [(AAUIPasscodeValidateController *)self _setupNavController];
  id v6 = objc_alloc_init(AAUIDevicePINController);
  pinController = self->_pinController;
  self->_pinController = v6;

  if (!v3) {
    [(DevicePINController *)self->_pinController setAllowOptionsButton:1];
  }
  [(DevicePINController *)self->_pinController setShouldDismissWhenDone:0];
  id v8 = self->_pinController;
  uint64_t v9 = [(AAUIPasscodeValidateController *)self _specifierForMode:v3];
  [(DevicePINController *)v8 setSpecifier:v9];

  [(PSSetupController *)self->_navController showController:self->_pinController];
  v10 = [(AAUIPasscodeValidateController *)self _presentingViewController];
  [v10 presentViewController:self->_navController animated:1 completion:0];
}

- (id)_presentingViewController
{
  return [(AAUICDPHelper *)self->_helper presentingViewController];
}

- (void)_setupNavController
{
  navController = self->_navController;
  self->_navController = 0;

  id v4 = objc_alloc_init(MEMORY[0x263F5FC30]);
  id v5 = [(AAUIPasscodeValidateController *)self _presentingViewController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(AAUIPasscodeValidateController *)self _presentingViewController];
    id v8 = [v7 rootController];
    [v4 setRootController:v8];
  }
  uint64_t v9 = self->_navController;
  self->_navController = (PSSetupController *)v4;
  id v10 = v4;

  [(PSSetupController *)self->_navController setModalInPresentation:1];
}

- (id)_specifierForMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"CDPSecretValidation" target:0 set:0 get:0 detail:0 cell:13 edit:0];
  char v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 setProperty:v7 forKey:*MEMORY[0x263F60228]];

  [v5 setEditPaneClass:objc_opt_class()];
  id v8 = [NSNumber numberWithUnsignedInt:v3];
  [v5 setProperty:v8 forKey:@"mode"];

  [v5 setProperty:self forKey:*MEMORY[0x263F60318]];
  return v5;
}

- (void)didAcceptEnteredPIN:(id)a3
{
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Passcode accepted, proceeding", v8, 2u);
  }

  if ([(DevicePINController *)self->_pinController simplePIN]) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 3;
  }
  v7 = (void *)[objc_alloc(MEMORY[0x263F343B0]) initWithValidatedSecret:v4 secretType:v6];

  [(AAUIPasscodeValidateController *)self dismissFlowWithLocalSecret:v7 error:0];
}

- (void)dismissFlowWithLocalSecret:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AAUICDPHelper *)self->_helper presentingViewController];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _DWORD v11[2] = __67__AAUIPasscodeValidateController_dismissFlowWithLocalSecret_error___block_invoke;
  v11[3] = &unk_263F92758;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 dismissViewControllerAnimated:1 completion:v11];
}

void __67__AAUIPasscodeValidateController_dismissFlowWithLocalSecret_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) passcodeValidationCompletion];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) passcodeValidationCompletion];
    v3[2](v3, *(void *)(a1 + 40), *(void *)(a1 + 48));

    id v4 = *(void **)(a1 + 32);
    [v4 setPasscodeValidationCompletion:0];
  }
}

- (void)didCancelEnteringPIN
{
  uint64_t v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "Passcode entry cancelled, stopping the flow", v5, 2u);
  }

  id v4 = objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -1);
  [(AAUIPasscodeValidateController *)self dismissFlowWithLocalSecret:0 error:v4];
}

- (void)devicePINController:(id)a3 didFailToSetPinWithError:(id)a4
{
  id v5 = a4;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Passcode accepted, proceeding", v7, 2u);
  }

  [(AAUIPasscodeValidateController *)self dismissFlowWithLocalSecret:0 error:v5];
}

- (void)devicePINController:(id)a3 didAcceptSetPIN:(id)a4
{
  id v5 = a4;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Detected passcode set accepted", buf, 2u);
  }

  if (v5)
  {
    if ([(DevicePINController *)self->_pinController simplePIN]) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 3;
    }
    id v8 = (void *)[objc_alloc(MEMORY[0x263F343B0]) initWithValidatedSecret:v5 secretType:v7];
    [(AAUIPasscodeValidateController *)self dismissFlowWithLocalSecret:v8 error:0];
  }
  else
  {
    id v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Passcode was accepted, but it was not set, initiate revalidation", v10, 2u);
    }

    id v8 = [(AAUIPasscodeValidateController *)self passcodeValidationCompletion];
    [(AAUIPasscodeValidateController *)self validatePasscodeStateWithCompletion:v8];
  }
}

- (void)devicePINController:(id)a3 canCancelWithCompletion:(id)a4
{
  id v5 = (void (**)(id, uint64_t))a4;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Passcode entry cancel tapped. Check with delegate", v10, 2u);
  }

  uint64_t v7 = [(AAUIPasscodeValidateController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(AAUIPasscodeValidateController *)self delegate];
    [v9 localSecretValidationCanCancelWithViewController:self->_navController completion:v5];
  }
  else
  {
    v5[2](v5, 1);
  }
}

- (AAUIPasscodeValidationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUIPasscodeValidationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_passcodeValidationCompletion, 0);
  objc_storeStrong((id *)&self->_pinController, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_helper, 0);
}

@end