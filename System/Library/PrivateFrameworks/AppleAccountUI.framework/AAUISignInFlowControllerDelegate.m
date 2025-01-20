@interface AAUISignInFlowControllerDelegate
- (AAUISignInFlowControllerDelegate)init;
- (AAUISignInFlowControllerDelegate)initWithPresentingViewController:(id)a3;
- (BOOL)backgroundDataclassEnablement;
- (BOOL)isFastSignInEnabled;
- (BOOL)newSignInReauth;
- (BOOL)parentViewControllerPresentsErrorAlert;
- (BOOL)shouldStashLoginResponse;
- (BOOL)skipCDPEnablement;
- (BOOL)skipDataclassEnablement;
- (BOOL)wasProgressViewAlreadyPresented;
- (CDPContext)cdpContext;
- (NSSet)requiredTerms;
- (UIViewController)presentingViewController;
- (unint64_t)findMyActivationAction;
- (void)_hasActivationLockSupportedWatchWithCompletion:(id)a3;
- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4 serverInfo:(id)a5;
- (void)setBackgroundDataclassEnablement:(BOOL)a3;
- (void)setCdpContext:(id)a3;
- (void)setFastSignInEnabled:(BOOL)a3;
- (void)setFindMyActivationAction:(unint64_t)a3;
- (void)setNewSignInReauth:(BOOL)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setProgressViewAlreadyPresented:(BOOL)a3;
- (void)setRequiredTerms:(id)a3;
- (void)setShouldStashLoginResponse:(BOOL)a3;
- (void)setSkipCDPEnablement:(BOOL)a3;
- (void)setSkipDataclassEnablement:(BOOL)a3;
- (void)signInFlowController:(id)a3 enableFindMyWithAction:(unint64_t)a4 completion:(id)a5;
- (void)signInFlowController:(id)a3 presentGenericTermsUIForAccount:(id)a4 completion:(id)a5;
- (void)signInFlowController:(id)a3 presentProgressViewForAccount:(id)a4 completion:(id)a5;
- (void)signInFlowController:(id)a3 saveAccount:(id)a4 withAllDataclassesEnabledIfPossibleWithCompletion:(id)a5;
- (void)signInFlowController:(id)a3 showAlertWithTitle:(id)a4 message:(id)a5 completion:(id)a6;
- (void)signInOperationManager:(id)a3 didSaveAccount:(id)a4 error:(id)a5;
@end

@implementation AAUISignInFlowControllerDelegate

- (AAUISignInFlowControllerDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)AAUISignInFlowControllerDelegate;
  v2 = [(AAUISignInFlowControllerDelegate *)&v6 init];
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x263EFB210]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;
  }
  return v2;
}

- (AAUISignInFlowControllerDelegate)initWithPresentingViewController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUISignInFlowControllerDelegate;
  v5 = [(AAUISignInFlowControllerDelegate *)&v9 init];
  if (v5)
  {
    objc_super v6 = (ACAccountStore *)objc_alloc_init(MEMORY[0x263EFB210]);
    accountStore = v5->_accountStore;
    v5->_accountStore = v6;

    objc_storeWeak((id *)&v5->_presentingViewController, v4);
  }

  return v5;
}

- (BOOL)parentViewControllerPresentsErrorAlert
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)signInFlowController:(id)a3 showAlertWithTitle:(id)a4 message:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  p_presentingViewController = &self->_presentingViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  if (WeakRetained)
  {
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"OK" value:&stru_26BD39CD8 table:@"Localizable"];

    v16 = (void *)MEMORY[0x263F82418];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __95__AAUISignInFlowControllerDelegate_signInFlowController_showAlertWithTitle_message_completion___block_invoke;
    v19[3] = &unk_263F920E8;
    id v20 = v11;
    v17 = [v16 alertWithTitle:v9 message:v10 buttonTitle:v15 actionHandler:v19];
    id v18 = objc_loadWeakRetained((id *)p_presentingViewController);
    [v18 presentViewController:v17 animated:1 completion:0];
  }
  else
  {
    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
}

uint64_t __95__AAUISignInFlowControllerDelegate_signInFlowController_showAlertWithTitle_message_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)signInFlowController:(id)a3 saveAccount:(id)a4 withAllDataclassesEnabledIfPossibleWithCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  if (WeakRetained)
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__9;
    v32 = __Block_byref_object_dispose__9;
    v33 = [[AAUISignInOperationManager alloc] initWithPresentingViewController:WeakRetained];
    [(id)v29[5] setDelegate:self];
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"SAVE_FAILED_MESSAGE" value:&stru_26BD39CD8 table:@"Localizable"];

    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __119__AAUISignInFlowControllerDelegate_signInFlowController_saveAccount_withAllDataclassesEnabledIfPossibleWithCompletion___block_invoke;
    v23 = &unk_263F934E0;
    id v26 = v10;
    id v14 = v9;
    id v24 = v14;
    id v15 = v13;
    id v25 = v15;
    v27 = &v28;
    v16 = _Block_copy(&v20);
    id pendingEnableDataclassesCompletion = self->_pendingEnableDataclassesCompletion;
    self->_id pendingEnableDataclassesCompletion = v16;

    objc_msgSend((id)v29[5], "signInAccount:enablingDataclasses:", v14, 1, v20, v21, v22, v23);
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    id v18 = _AAUILogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[AAUISignInFlowControllerDelegate signInFlowController:saveAccount:withAllDataclassesEnabledIfPossibleWithCompletion:](v18);
    }

    v19 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F25710] code:-8005 userInfo:0];
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v19);
  }
}

void __119__AAUISignInFlowControllerDelegate_signInFlowController_saveAccount_withAllDataclassesEnabledIfPossibleWithCompletion___block_invoke(void *a1, int a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    uint64_t v3 = a1[5];
    uint64_t v9 = *MEMORY[0x263F08320];
    v10[0] = v3;
    id v4 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v5 = a1[6];
    objc_super v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F25710] code:-8004 userInfo:v4];
    (*(void (**)(uint64_t, void, void, void *))(v5 + 16))(v5, 0, 0, v6);
  }
  uint64_t v7 = *(void *)(a1[7] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

- (void)signInOperationManager:(id)a3 didSaveAccount:(id)a4 error:(id)a5
{
  id pendingEnableDataclassesCompletion = (void (**)(id, BOOL, id, id))self->_pendingEnableDataclassesCompletion;
  if (pendingEnableDataclassesCompletion)
  {
    pendingEnableDataclassesCompletion[2](pendingEnableDataclassesCompletion, a4 != 0, a4, a5);
    id v7 = self->_pendingEnableDataclassesCompletion;
    self->_id pendingEnableDataclassesCompletion = 0;
  }
  else
  {
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AAUISignInFlowControllerDelegate signInOperationManager:didSaveAccount:error:](v8);
    }
  }
}

- (void)signInFlowController:(id)a3 enableFindMyWithAction:(unint64_t)a4 completion:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __91__AAUISignInFlowControllerDelegate_signInFlowController_enableFindMyWithAction_completion___block_invoke;
  v9[3] = &unk_263F93558;
  id v10 = v7;
  unint64_t v11 = a4;
  id v8 = v7;
  [(AAUISignInFlowControllerDelegate *)self _hasActivationLockSupportedWatchWithCompletion:v9];
}

void __91__AAUISignInFlowControllerDelegate_signInFlowController_enableFindMyWithAction_completion___block_invoke(uint64_t a1, char a2)
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__AAUISignInFlowControllerDelegate_signInFlowController_enableFindMyWithAction_completion___block_invoke_2;
  aBlock[3] = &unk_263F93508;
  char v11 = a2;
  id v10 = *(id *)(a1 + 32);
  uint64_t v3 = _Block_copy(aBlock);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __91__AAUISignInFlowControllerDelegate_signInFlowController_enableFindMyWithAction_completion___block_invoke_59;
  v6[3] = &unk_263F93530;
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __91__AAUISignInFlowControllerDelegate_signInFlowController_enableFindMyWithAction_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v3 = @"YES";
    }
    else {
      uint64_t v3 = @"NO";
    }
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_209754000, v2, OS_LOG_TYPE_DEFAULT, "Enabling FindMy for newly added account, hasWatch: %{public}@.", (uint8_t *)&v7, 0xCu);
  }

  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v4 = [MEMORY[0x263F3CC60] sharedInstance];
    [v4 userNotifiedOfActivationLockForAllPairedDevices];
  }
  id v5 = +[AAUIDeviceLocatorService sharedInstance];
  [v5 enableInContext:3];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __91__AAUISignInFlowControllerDelegate_signInFlowController_enableFindMyWithAction_completion___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_hasActivationLockSupportedWatchWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__AAUISignInFlowControllerDelegate__hasActivationLockSupportedWatchWithCompletion___block_invoke;
  aBlock[3] = &unk_263F932D8;
  id v5 = v4;
  void aBlock[4] = self;
  id v14 = v5;
  objc_super v6 = _Block_copy(aBlock);
  int v7 = [MEMORY[0x263F57730] sharedInstance];
  uint64_t v8 = [v7 getActivePairedDevice];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"02168E84-5DD8-4B19-9204-A79F04B33A32"];
  int v10 = [v8 supportsCapability:v9];

  if (v10)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __83__AAUISignInFlowControllerDelegate__hasActivationLockSupportedWatchWithCompletion___block_invoke_2;
    v11[3] = &unk_263F93300;
    id v12 = v6;
    +[AAUIDeviceLocatorConfirmationUtilities checkIfWatchHasAppleIDAccount:v11];
  }
  else
  {
    (*((void (**)(void *, void))v6 + 2))(v6, 0);
  }
}

void __83__AAUISignInFlowControllerDelegate__hasActivationLockSupportedWatchWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2) {
    return;
  }
  id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (a2)
  {
    id v4 = @"DEVICE_LOCATOR_MESSAGE_WATCH";
    if (([@"DEVICE_LOCATOR_MESSAGE_WATCH" containsString:@"REBRAND"] & 1) != 0
      || !_os_feature_enabled_impl())
    {
      char v5 = 0;
    }
    else
    {
      id v4 = [@"DEVICE_LOCATOR_MESSAGE_WATCH" stringByAppendingString:@"_REBRAND"];
      char v5 = 1;
    }
    uint64_t v8 = [v11 localizedStringForKey:v4 value:&stru_26BD39CD8 table:@"Localizable"];
    (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, 1, v8);

    if ((v5 & 1) == 0) {
      goto LABEL_16;
    }
  }
  else
  {
    objc_super v6 = (void *)MEMORY[0x263F82670];
    id v4 = @"DEVICE_LOCATOR_MESSAGE";
    if (([@"DEVICE_LOCATOR_MESSAGE" containsString:@"REBRAND"] & 1) != 0
      || !_os_feature_enabled_impl())
    {
      int v7 = 0;
    }
    else
    {
      id v4 = [@"DEVICE_LOCATOR_MESSAGE" stringByAppendingString:@"_REBRAND"];
      int v7 = 1;
    }
    uint64_t v9 = [v6 modelSpecificLocalizedStringKeyForKey:v4];
    int v10 = [v11 localizedStringForKey:v9 value:&stru_26BD39CD8 table:@"Localizable"];
    (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v10);

    if (!v7) {
      goto LABEL_16;
    }
  }

LABEL_16:
}

uint64_t __83__AAUISignInFlowControllerDelegate__hasActivationLockSupportedWatchWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)signInFlowController:(id)a3 presentGenericTermsUIForAccount:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  if (WeakRetained)
  {
    if (self->_pendingTermsCompletion)
    {
      int v10 = _AAUILogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[AAUISignInFlowControllerDelegate signInFlowController:presentGenericTermsUIForAccount:completion:](v10);
      }
    }
    id v11 = _Block_copy(v8);
    id pendingTermsCompletion = self->_pendingTermsCompletion;
    self->_id pendingTermsCompletion = v11;

    id v13 = objc_loadWeakRetained((id *)&self->_presentingViewController);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v15 = objc_loadWeakRetained((id *)&self->_presentingViewController);
    v16 = v15;
    if (isKindOfClass)
    {
      uint64_t v17 = [v15 topViewController];

      v16 = (void *)v17;
    }
    id v18 = [(AAUISignInFlowControllerDelegate *)self requiredTerms];
    uint64_t v19 = [v18 count];

    uint64_t v20 = [AAUIGenericTermsRemoteUI alloc];
    uint64_t v21 = v20;
    accountStore = self->_accountStore;
    if (v19)
    {
      v23 = [(AAUISignInFlowControllerDelegate *)self requiredTerms];
      id v24 = [(AAUIGenericTermsRemoteUI *)v21 initWithAccount:v7 inStore:accountStore termsEntries:v23];
      genericTermsRemoteUI = self->_genericTermsRemoteUI;
      self->_genericTermsRemoteUI = v24;
    }
    else
    {
      v27 = [(AAUIGenericTermsRemoteUI *)v20 initWithAccount:v7 inStore:self->_accountStore];
      v23 = self->_genericTermsRemoteUI;
      self->_genericTermsRemoteUI = v27;
    }

    [(AAUIGenericTermsRemoteUI *)self->_genericTermsRemoteUI setDelegate:self];
    [(AAUIGenericTermsRemoteUI *)self->_genericTermsRemoteUI presentFromViewController:v16 modal:1];
  }
  else
  {
    id v26 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F25710] code:-8005 userInfo:0];
    (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v26);
  }
}

- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4 serverInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  genericTermsRemoteUI = self->_genericTermsRemoteUI;
  self->_genericTermsRemoteUI = 0;

  id pendingTermsCompletion = self->_pendingTermsCompletion;
  if (pendingTermsCompletion)
  {
    uint64_t v12 = (uint64_t)_Block_copy(pendingTermsCompletion);
    id v13 = self->_pendingTermsCompletion;
    self->_id pendingTermsCompletion = 0;

    if (a4)
    {
      id v14 = [v8 account];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v14, "_aa_setTermsServerInfo:", v9);
      }
      id v15 = [v8 account];
      (*(void (**)(uint64_t, uint64_t, void *, void))(v12 + 16))(v12, 1, v15, 0);
    }
    else
    {
      id v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F25710] code:-8006 userInfo:0];
      (*(void (**)(uint64_t, void, void, void *))(v12 + 16))(v12, 0, 0, v14);
    }
  }
  else
  {
    uint64_t v12 = _AAUILogSystem();
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT)) {
      -[AAUISignInFlowControllerDelegate genericTermsRemoteUI:didFinishWithSuccess:serverInfo:]((uint64_t)self, v12);
    }
  }
}

- (void)signInFlowController:(id)a3 presentProgressViewForAccount:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, uint64_t))a5;
  if (![(AAUISignInFlowControllerDelegate *)self wasProgressViewAlreadyPresented])
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke;
    aBlock[3] = &unk_263F93580;
    id v10 = v7;
    id v29 = v10;
    uint64_t v30 = self;
    id v11 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v12 = [(AAUISignInFlowControllerDelegate *)self presentingViewController];
    objc_opt_class();
    id v13 = [(AAUISignInFlowControllerDelegate *)self presentingViewController];
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    if (v14)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        uint64_t v19 = v11[2](v11);
        [v14 pushViewController:v19 animated:0];

        uint64_t v20 = _AAUILogSystem();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[AAUISignInFlowControllerDelegate signInFlowController:presentProgressViewForAccount:completion:].cold.4();
        }

        if (v8) {
          v8[2](v8, 1);
        }
        goto LABEL_25;
      }
      id v15 = _AAUILogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[AAUISignInFlowControllerDelegate signInFlowController:presentProgressViewForAccount:completion:]((uint64_t)self, v15);
      }

      v16 = v11[2](v11);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke_92;
      v25[3] = &unk_263F92DA0;
      v25[4] = self;
      id v26 = v10;
      v27 = v8;
      [v14 pushViewController:v16 completion:v25];

      uint64_t v17 = v26;
    }
    else
    {
      if (!v12)
      {
        uint64_t v21 = _AAUILogSystem();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[AAUISignInFlowControllerDelegate signInFlowController:presentProgressViewForAccount:completion:]();
        }

        if (v8) {
          v8[2](v8, 0);
        }
        goto LABEL_25;
      }
      id v18 = v11[2](v11);
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke_93;
      v22[3] = &unk_263F92DA0;
      v22[4] = self;
      id v23 = v10;
      id v24 = v8;
      [v12 presentViewController:v18 animated:1 completion:v22];

      uint64_t v17 = v23;
    }

LABEL_25:
    goto LABEL_26;
  }
  id v9 = _AAUILogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[AAUISignInFlowControllerDelegate signInFlowController:presentProgressViewForAccount:completion:]((uint64_t)self, v9);
  }

  if (v8) {
    v8[2](v8, 0);
  }
LABEL_26:
}

id __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke(uint64_t a1)
{
  v1 = (void *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "aa_fullName");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    uint64_t v3 = _AAUILogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke_cold_1();
    }

    uint64_t v2 = &stru_26BD39CD8;
  }
  id v4 = +[AAUISpinnerViewController newSignInProgressViewWithFullName:v2 forAccount:*v1];

  return v4;
}

uint64_t __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke_92(uint64_t a1)
{
  uint64_t v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke_92_cold_1();
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke_93(uint64_t a1)
{
  uint64_t v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke_93_cold_1();
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (CDPContext)cdpContext
{
  return self->cdpContext;
}

- (void)setCdpContext:(id)a3
{
}

- (BOOL)skipCDPEnablement
{
  return self->skipCDPEnablement;
}

- (void)setSkipCDPEnablement:(BOOL)a3
{
  self->skipCDPEnablement = a3;
}

- (BOOL)backgroundDataclassEnablement
{
  return self->backgroundDataclassEnablement;
}

- (void)setBackgroundDataclassEnablement:(BOOL)a3
{
  self->backgroundDataclassEnablement = a3;
}

- (BOOL)skipDataclassEnablement
{
  return self->skipDataclassEnablement;
}

- (void)setSkipDataclassEnablement:(BOOL)a3
{
  self->skipDataclassEnablement = a3;
}

- (NSSet)requiredTerms
{
  return self->requiredTerms;
}

- (void)setRequiredTerms:(id)a3
{
}

- (BOOL)shouldStashLoginResponse
{
  return self->shouldStashLoginResponse;
}

- (void)setShouldStashLoginResponse:(BOOL)a3
{
  self->shouldStashLoginResponse = a3;
}

- (unint64_t)findMyActivationAction
{
  return self->findMyActivationAction;
}

- (void)setFindMyActivationAction:(unint64_t)a3
{
  self->findMyActivationAction = a3;
}

- (BOOL)isFastSignInEnabled
{
  return self->fastSignInEnabled;
}

- (void)setFastSignInEnabled:(BOOL)a3
{
  self->fastSignInEnabled = a3;
}

- (BOOL)newSignInReauth
{
  return self->newSignInReauth;
}

- (void)setNewSignInReauth:(BOOL)a3
{
  self->newSignInReauth = a3;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (BOOL)wasProgressViewAlreadyPresented
{
  return self->_progressViewAlreadyPresented;
}

- (void)setProgressViewAlreadyPresented:(BOOL)a3
{
  self->_progressViewAlreadyPresented = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->requiredTerms, 0);
  objc_storeStrong((id *)&self->cdpContext, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_genericTermsRemoteUI, 0);
  objc_storeStrong(&self->_pendingTermsCompletion, 0);
  objc_storeStrong(&self->_pendingEnableDataclassesCompletion, 0);
}

- (void)signInFlowController:(os_log_t)log saveAccount:withAllDataclassesEnabledIfPossibleWithCompletion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "Attempt to save without a valid presenting view controller!", v1, 2u);
}

- (void)signInOperationManager:(os_log_t)log didSaveAccount:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "Sign in operation manager completed without a callback!", v1, 2u);
}

- (void)signInFlowController:(os_log_t)log presentGenericTermsUIForAccount:completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_209754000, log, OS_LOG_TYPE_FAULT, "A pending completion for showing terms already exists and we are about to overwrite it!", v1, 2u);
}

- (void)genericTermsRemoteUI:(uint64_t)a1 didFinishWithSuccess:(NSObject *)a2 serverInfo:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_209754000, a2, OS_LOG_TYPE_FAULT, "Terms completion for %@ is nil. This should never occur.", (uint8_t *)&v2, 0xCu);
}

- (void)signInFlowController:(uint64_t)a1 presentProgressViewForAccount:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_209754000, a2, OS_LOG_TYPE_DEBUG, "%@: Progress view is already presented, skipping new presentation", (uint8_t *)&v2, 0xCu);
}

- (void)signInFlowController:presentProgressViewForAccount:completion:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_209754000, v0, v1, "%@: Unable to present progress view for account (%@) with nil presentingViewController");
}

- (void)signInFlowController:(uint64_t)a1 presentProgressViewForAccount:(NSObject *)a2 completion:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_209754000, a2, OS_LOG_TYPE_DEBUG, "%@: Calling BFF-specific push method", (uint8_t *)&v2, 0xCu);
}

- (void)signInFlowController:presentProgressViewForAccount:completion:.cold.4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_209754000, v0, OS_LOG_TYPE_DEBUG, "%@: Pushed progress view for account (%@) on navigation stack", v1, 0x16u);
}

void __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_0_2(&dword_209754000, v0, v1, "%@: Unable to retrieve full name from account (%@) for progress view");
}

void __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke_92_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_3();
  _os_log_debug_impl(&dword_209754000, v0, OS_LOG_TYPE_DEBUG, "%@: Pushed progress view for account (%@) on navigation stack", v1, 0x16u);
}

void __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke_93_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_3();
  _os_log_debug_impl(&dword_209754000, v0, OS_LOG_TYPE_DEBUG, "%@: Presented progress view for account (%@) modally", v1, 0x16u);
}

@end