@interface AAUISignOutFlowControllerDelegate
- (AAUISignOutFlowControllerDelegate)init;
- (AAUISignOutFlowControllerDelegate)initWithPresentingViewController:(id)a3;
- (AIDAAccountManager)accountManager;
- (NSString)telemetryFlowID;
- (UIViewController)presentingViewController;
- (id)_recoveryFactorController;
- (void)_completedRestoreFromiCloud:(id)a3;
- (void)_disableDeviceLocatorForAccount:(id)a3 inViewController:(id)a4 completion:(id)a5;
- (void)_offerManateeRepairWithContext:(id)a3 completion:(id)a4;
- (void)_performLastDeviceCheckForAccount:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)_presentLastDeviceAlertForAccount:(id)a3 withRecoveryFactors:(unint64_t)a4 withCompletion:(id)a5;
- (void)recoveryFactorController:(id)a3 didFinishAddingRecoveryContactWithError:(id)a4;
- (void)setAccountManager:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setTelemetryFlowID:(id)a3;
- (void)signOutController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5;
- (void)signOutControllerDidCancel:(id)a3;
- (void)signOutFlowController:(id)a3 disableFindMyDeviceForAccount:(id)a4 completion:(id)a5;
- (void)signOutFlowController:(id)a3 performWalrusValidationForAccount:(id)a4 completion:(id)a5;
- (void)signOutFlowController:(id)a3 showAlertWithTitle:(id)a4 message:(id)a5 completion:(id)a6;
- (void)signOutFlowController:(id)a3 signOutAccount:(id)a4 completion:(id)a5;
@end

@implementation AAUISignOutFlowControllerDelegate

- (AAUISignOutFlowControllerDelegate)init
{
  v9.receiver = self;
  v9.super_class = (Class)AAUISignOutFlowControllerDelegate;
  v2 = [(AAUISignOutFlowControllerDelegate *)&v9 init];
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x263EFB210]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;
  }
  v5 = [MEMORY[0x263F08C38] UUID];
  uint64_t v6 = [v5 UUIDString];
  telemetryFlowID = v2->_telemetryFlowID;
  v2->_telemetryFlowID = (NSString *)v6;

  return v2;
}

- (AAUISignOutFlowControllerDelegate)initWithPresentingViewController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AAUISignOutFlowControllerDelegate;
  v5 = [(AAUISignOutFlowControllerDelegate *)&v12 init];
  if (v5)
  {
    uint64_t v6 = (ACAccountStore *)objc_alloc_init(MEMORY[0x263EFB210]);
    accountStore = v5->_accountStore;
    v5->_accountStore = v6;

    objc_storeWeak((id *)&v5->_presentingViewController, v4);
    v8 = [MEMORY[0x263F08C38] UUID];
    uint64_t v9 = [v8 UUIDString];
    telemetryFlowID = v5->_telemetryFlowID;
    v5->_telemetryFlowID = (NSString *)v9;
  }
  return v5;
}

- (void)signOutFlowController:(id)a3 showAlertWithTitle:(id)a4 message:(id)a5 completion:(id)a6
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
    v19[2] = __97__AAUISignOutFlowControllerDelegate_signOutFlowController_showAlertWithTitle_message_completion___block_invoke;
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

uint64_t __97__AAUISignOutFlowControllerDelegate_signOutFlowController_showAlertWithTitle_message_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)signOutFlowController:(id)a3 disableFindMyDeviceForAccount:(id)a4 completion:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = _AAUILogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v7;
    _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Attempting to disableFindMyDevice for %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __100__AAUISignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke;
  v12[3] = &unk_263F92E18;
  id v13 = v7;
  id v14 = v8;
  v12[4] = self;
  id v10 = v7;
  id v11 = v8;
  [(AAUISignOutFlowControllerDelegate *)self _completedRestoreFromiCloud:v12];
}

void __100__AAUISignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke(uint64_t a1, char a2)
{
  id v4 = _AAUILogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Starting to refresh current FMIP state...", buf, 2u);
    }

    uint64_t v6 = +[AAUIDeviceLocatorService sharedInstance];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __100__AAUISignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke_46;
    v12[3] = &unk_263F92DF0;
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    id v14 = v7;
    v12[4] = v8;
    id v13 = v9;
    [v6 refreshCurrentState:v12];

    id v10 = v14;
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Device is restoring from iCloud, not allowing account removal!", buf, 2u);
    }

    uint64_t v11 = *(void *)(a1 + 48);
    id v10 = objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -12);
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v10);
  }
}

void __100__AAUISignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke_46(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = a2;
    _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "FMIP state came back as %lu", buf, 0xCu);
  }

  BOOL v5 = +[AAUIDeviceLocatorService sharedInstance];
  char v6 = [v5 isStateKnown];

  if ((v6 & 1) == 0)
  {
    id v13 = _AAUILogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v13, OS_LOG_TYPE_DEFAULT, "FMiP state is unknown, so not allowing account removal!", buf, 2u);
    }

    uint64_t v14 = *(void *)(a1 + 48);
    id WeakRetained = objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -11);
    (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, WeakRetained);
    goto LABEL_17;
  }
  id v7 = +[AAUIDeviceLocatorService sharedInstance];
  char v8 = [v7 isEnabled];

  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    if (WeakRetained)
    {
      id v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __100__AAUISignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke_47;
      v18[3] = &unk_263F92B30;
      id v19 = *(id *)(a1 + 48);
      [v10 _disableDeviceLocatorForAccount:v11 inViewController:WeakRetained completion:v18];
      objc_super v12 = v19;
    }
    else
    {
      id v16 = _AAUILogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209754000, v16, OS_LOG_TYPE_DEFAULT, "No view controller provided for sign out, unable to disable FMiP!", buf, 2u);
      }

      uint64_t v17 = *(void *)(a1 + 48);
      objc_super v12 = objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -11);
      (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v12);
    }

LABEL_17:
    return;
  }
  v15 = _AAUILogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v15, OS_LOG_TYPE_DEFAULT, "Device locator not enabled, allowing account removal!", buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __100__AAUISignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke_47(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Device locator disabled with success %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_disableDeviceLocatorForAccount:(id)a3 inViewController:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(AAUISignOutFlowControllerDelegate *)self telemetryFlowID];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __97__AAUISignOutFlowControllerDelegate__disableDeviceLocatorForAccount_inViewController_completion___block_invoke;
  v13[3] = &unk_263F92E68;
  id v14 = v8;
  id v12 = v8;
  +[AAUIDeviceLocatorConfirmationUtilities showDisableAlertForAccount:v10 presentingViewController:v9 telemetryFlowID:v11 withCompletion:v13];
}

void __97__AAUISignOutFlowControllerDelegate__disableDeviceLocatorForAccount_inViewController_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    char v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "User canceled FMiP password prompt.", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v7 = +[AAUIDeviceLocatorService sharedInstance];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __97__AAUISignOutFlowControllerDelegate__disableDeviceLocatorForAccount_inViewController_completion___block_invoke_57;
    v8[3] = &unk_263F92E40;
    id v9 = *(id *)(a1 + 32);
    [v7 disableInContext:2 withWipeToken:v5 completion:v8];
  }
}

void __97__AAUISignOutFlowControllerDelegate__disableDeviceLocatorForAccount_inViewController_completion___block_invoke_57(uint64_t a1, int a2)
{
  id v4 = _AAUILogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Failed to disable FMiP for account deletion.", buf, 2u);
    }

    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -11);
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Successfully disabled FMiP for account deletion!", v8, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)signOutFlowController:(id)a3 signOutAccount:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [[AAUISignOutController alloc] initWithAccount:v8];

  id v10 = [(AAUISignOutFlowControllerDelegate *)self telemetryFlowID];
  [(AAUISignOutController *)v9 setTelemetryFlowID:v10];

  [(AAUISignOutController *)v9 setDelegate:self];
  id v11 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if (v12 == 1)
  {
    [(AAUISignOutController *)v9 setModalPresentationStyle:2];
    [(AAUISignOutController *)v9 setModalTransitionStyle:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __85__AAUISignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke;
  v16[3] = &unk_263F93EE8;
  uint64_t v17 = v9;
  id v18 = v7;
  v16[4] = self;
  id v14 = v9;
  id v15 = v7;
  [(AAUISignOutController *)v14 prepareInViewController:WeakRetained completion:v16];
}

void __85__AAUISignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = _Block_copy(*(const void **)(a1 + 48));
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 8);
    *(void *)(v7 + 8) = v6;

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __85__AAUISignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke_2;
    v11[3] = &unk_263F926B8;
    id v9 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v9;
    dispatch_async(MEMORY[0x263EF83A0], v11);
  }
  else
  {
    id v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __85__AAUISignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke_cold_1((uint64_t)v5, v10);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __85__AAUISignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)signOutFlowController:(id)a3 performWalrusValidationForAccount:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = (void *)MEMORY[0x263F202A8];
  id v12 = objc_msgSend(v9, "aida_alternateDSID");
  id v13 = [(AAUISignOutFlowControllerDelegate *)self telemetryFlowID];
  id v14 = [v11 analyticsEventWithName:*MEMORY[0x263F25A38] altDSID:v12 flowID:v13];

  id v15 = objc_alloc_init(MEMORY[0x263F34408]);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __104__AAUISignOutFlowControllerDelegate_signOutFlowController_performWalrusValidationForAccount_completion___block_invoke;
  v19[3] = &unk_263F93F38;
  objc_copyWeak(&v24, &location);
  id v16 = v14;
  id v20 = v16;
  id v17 = v10;
  id v23 = v17;
  id v18 = v9;
  id v21 = v18;
  uint64_t v22 = self;
  [v15 walrusStatusWithCompletion:v19];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __104__AAUISignOutFlowControllerDelegate_signOutFlowController_performWalrusValidationForAccount_completion___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a2];
  [a1[4] setObject:v7 forKeyedSubscript:*MEMORY[0x263F344E8]];

  id v8 = [MEMORY[0x263F25780] reporter];
  [v8 sendEvent:a1[4]];

  if (!a2)
  {
    id v23 = _AAUILogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __104__AAUISignOutFlowControllerDelegate_signOutFlowController_performWalrusValidationForAccount_completion___block_invoke_cold_2((uint64_t)v5, v23);
    }

    goto LABEL_8;
  }
  if (a2 != 1)
  {
LABEL_8:
    (*((void (**)(void))a1[7] + 2))();
    goto LABEL_9;
  }
  if (WeakRetained)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F34350]);
    id v10 = NSNumber;
    id v11 = objc_msgSend(a1[5], "aida_dsid");
    id v12 = objc_msgSend(v10, "numberWithLongLong:", objc_msgSend(v11, "longLongValue"));
    [v9 setDsid:v12];

    id v13 = objc_msgSend(a1[5], "aida_alternateDSID");
    [v9 setAltDSID:v13];

    id v14 = [a1[5] appleID];
    [v9 setAppleID:v14];

    id v15 = [a1[6] telemetryFlowID];
    [v9 setTelemetryFlowID:v15];

    id v16 = (void *)MEMORY[0x263F202A8];
    uint64_t v17 = *MEMORY[0x263F25A68];
    id v18 = objc_msgSend(a1[5], "aida_alternateDSID");
    id v19 = [a1[6] telemetryFlowID];
    id v20 = [v16 analyticsEventWithName:v17 altDSID:v18 flowID:v19];

    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __104__AAUISignOutFlowControllerDelegate_signOutFlowController_performWalrusValidationForAccount_completion___block_invoke_67;
    v27[3] = &unk_263F93F10;
    objc_copyWeak(&v32, a1 + 8);
    id v21 = v20;
    id v28 = v21;
    id v29 = a1[5];
    id v22 = v9;
    id v30 = v22;
    id v31 = a1[7];
    [WeakRetained _offerManateeRepairWithContext:v22 completion:v27];

    objc_destroyWeak(&v32);
  }
  else
  {
    id v24 = _AALogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      __104__AAUISignOutFlowControllerDelegate_signOutFlowController_performWalrusValidationForAccount_completion___block_invoke_cold_1(v24);
    }

    v25 = (void (**)(id, void, void *))a1[7];
    v26 = objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", 0);
    v25[2](v25, 0, v26);
  }
LABEL_9:
}

void __104__AAUISignOutFlowControllerDelegate_signOutFlowController_performWalrusValidationForAccount_completion___block_invoke_67(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v7 = WeakRetained;
  if (a2)
  {
    if (WeakRetained)
    {
      [*(id *)(a1 + 32) setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F20330]];
      id v8 = [MEMORY[0x263F25780] reporter];
      [v8 sendEvent:*(void *)(a1 + 32)];

      [v7 _performLastDeviceCheckForAccount:*(void *)(a1 + 40) withContext:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
    }
    else
    {
      id v10 = _AALogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __104__AAUISignOutFlowControllerDelegate_signOutFlowController_performWalrusValidationForAccount_completion___block_invoke_cold_1(v10);
      }

      [*(id *)(a1 + 32) setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F20330]];
      id v11 = objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", 0);
      [*(id *)(a1 + 32) populateUnderlyingErrorsStartingWithRootError:v11];
      id v12 = [MEMORY[0x263F25780] reporter];
      [v12 sendEvent:*(void *)(a1 + 32)];

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    [*(id *)(a1 + 32) setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F20330]];
    [*(id *)(a1 + 32) populateUnderlyingErrorsStartingWithRootError:v5];
    id v9 = [MEMORY[0x263F25780] reporter];
    [v9 sendEvent:*(void *)(a1 + 32)];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)_performLastDeviceCheckForAccount:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _AAUILogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[AAUISignOutFlowControllerDelegate _performLastDeviceCheckForAccount:withContext:completion:]((uint64_t)v9, v11);
  }

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  char v29 = 0;
  id v12 = objc_alloc_init(MEMORY[0x263F343F0]);
  id v13 = (void *)MEMORY[0x263F202A8];
  id v14 = objc_msgSend(v8, "aida_alternateDSID");
  id v15 = [(AAUISignOutFlowControllerDelegate *)self telemetryFlowID];
  id v16 = [v13 analyticsEventWithName:*MEMORY[0x263F25A88] altDSID:v14 flowID:v15];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __94__AAUISignOutFlowControllerDelegate__performLastDeviceCheckForAccount_withContext_completion___block_invoke;
  v21[3] = &unk_263F93F88;
  id v17 = v16;
  id v22 = v17;
  id v18 = v9;
  id v23 = v18;
  id v24 = self;
  v27 = v28;
  id v19 = v8;
  id v25 = v19;
  id v20 = v10;
  id v26 = v20;
  [v12 fetchEscrowRecordDevicesWithContext:v18 usingCache:0 completion:v21];

  _Block_object_dispose(v28, 8);
}

void __94__AAUISignOutFlowControllerDelegate__performLastDeviceCheckForAccount_withContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:*MEMORY[0x263F347B0]];

  if ([v5 count] == 1
    && ([v5 firstObject],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isCurrentDevice],
        v8,
        v9))
  {
    id v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v11;
      _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "Current device is determined to be the last escrow device for context (%@)", buf, 0xCu);
    }

    id v12 = [*(id *)(a1 + 48) _recoveryFactorController];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __94__AAUISignOutFlowControllerDelegate__performLastDeviceCheckForAccount_withContext_completion___block_invoke_70;
    v19[3] = &unk_263F93F60;
    uint64_t v24 = *(void *)(a1 + 72);
    id v20 = *(id *)(a1 + 32);
    id v13 = *(id *)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 48);
    id v21 = v13;
    uint64_t v22 = v14;
    id v23 = *(id *)(a1 + 64);
    [v12 availableRecoveryFactorsWithCompletion:v19];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v6 == 0;
    [*(id *)(a1 + 32) populateUnderlyingErrorsStartingWithRootError:v6];
    id v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
    [*(id *)(a1 + 32) setObject:v15 forKeyedSubscript:*MEMORY[0x263F20330]];

    id v16 = _AAUILogSystem();
    id v17 = v16;
    if (v6)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __94__AAUISignOutFlowControllerDelegate__performLastDeviceCheckForAccount_withContext_completion___block_invoke_cold_2(a1, (uint64_t)v6, v17);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      __94__AAUISignOutFlowControllerDelegate__performLastDeviceCheckForAccount_withContext_completion___block_invoke_cold_1(a1, v17);
    }

    id v18 = [MEMORY[0x263F25780] reporter];
    [v18 sendEvent:*(void *)(a1 + 32)];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __94__AAUISignOutFlowControllerDelegate__performLastDeviceCheckForAccount_withContext_completion___block_invoke_70(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v5 == 0;
  id v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:*MEMORY[0x263F20330]];

  uint64_t v7 = [NSNumber numberWithBool:(a2 >> 2) & 1];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:*MEMORY[0x263F346F8]];

  if ((a2 & 2) != 0)
  {
    int v9 = [MEMORY[0x263F290F0] sharedInstance];
    id v10 = objc_msgSend(*(id *)(a1 + 40), "aida_alternateDSID");
    uint64_t v8 = [v9 numberOfApprovedRecoveryContactsForAltDSID:v10];
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:v8];
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:*MEMORY[0x263F34688]];

  [*(id *)(a1 + 32) populateUnderlyingErrorsStartingWithRootError:v5];
  id v12 = [MEMORY[0x263F25780] reporter];
  [v12 sendEvent:*(void *)(a1 + 32)];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__AAUISignOutFlowControllerDelegate__performLastDeviceCheckForAccount_withContext_completion___block_invoke_2;
  block[3] = &unk_263F925E0;
  int8x16_t v14 = *(int8x16_t *)(a1 + 40);
  id v13 = (id)v14.i64[0];
  int8x16_t v16 = vextq_s8(v14, v14, 8uLL);
  unint64_t v18 = a2;
  id v17 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __94__AAUISignOutFlowControllerDelegate__performLastDeviceCheckForAccount_withContext_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentLastDeviceAlertForAccount:*(void *)(a1 + 40) withRecoveryFactors:*(void *)(a1 + 56) withCompletion:*(void *)(a1 + 48)];
}

- (void)_presentLastDeviceAlertForAccount:(id)a3 withRecoveryFactors:(unint64_t)a4 withCompletion:(id)a5
{
  char v6 = a4;
  id v8 = a3;
  id v55 = a5;
  int v9 = _AAUILogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[AAUISignOutFlowControllerDelegate _presentLastDeviceAlertForAccount:withRecoveryFactors:withCompletion:](v9);
  }

  id v10 = (void *)MEMORY[0x263F202A8];
  uint64_t v11 = *MEMORY[0x263F25A90];
  objc_msgSend(v8, "aida_alternateDSID");
  id v12 = v59 = v8;
  id v13 = [(AAUISignOutFlowControllerDelegate *)self telemetryFlowID];
  v61 = [v10 analyticsEventWithName:v11 altDSID:v12 flowID:v13];

  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v15 = @"KEY";
  unint64_t v16 = v6 & 4;
  if (!v16) {
    id v15 = @"CONTACT";
  }
  id v17 = NSString;
  if (v16) {
    unint64_t v18 = (void *)MEMORY[0x263F25BF0];
  }
  else {
    unint64_t v18 = (void *)MEMORY[0x263F25BE8];
  }
  id v19 = v15;
  v62 = [v17 stringWithFormat:@"SIGN_OUT_LAST_DEVICE_RECOVERY_%@_TITLE", v19];
  v60 = [NSString stringWithFormat:@"SIGN_OUT_LAST_DEVICE_RECOVERY_%@_MESSAGE", v19];
  v58 = [NSString stringWithFormat:@"SIGN_OUT_ADD_RECOVERY_%@_BUTTON", v19];

  [v14 addObject:*v18];
  unint64_t v54 = v16 >> 2;
  id v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v57 = [v20 localizedStringForKey:v62 value:&stru_26BD39CD8 table:@"Localizable"];

  id v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v56 = [v21 localizedStringForKey:v60 value:&stru_26BD39CD8 table:@"Localizable"];

  uint64_t v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v63 = [v22 localizedStringForKey:v58 value:&stru_26BD39CD8 table:@"Localizable"];

  id v23 = (void *)MEMORY[0x263F202A8];
  uint64_t v24 = *MEMORY[0x263F25A98];
  id v25 = objc_msgSend(v8, "aida_alternateDSID");
  uint64_t v26 = [(AAUISignOutFlowControllerDelegate *)self telemetryFlowID];
  uint64_t v27 = [v23 analyticsEventWithName:v24 altDSID:v25 flowID:v26];

  id v28 = [MEMORY[0x263F82418] alertWithTitle:v57 message:v56];
  char v29 = (void *)MEMORY[0x263F82400];
  id v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v31 = [v30 localizedStringForKey:@"SIGN_OUT_CONFIRMATION_BUTTON" value:&stru_26BD39CD8 table:@"Localizable"];
  v76[0] = MEMORY[0x263EF8330];
  v76[1] = 3221225472;
  v76[2] = __106__AAUISignOutFlowControllerDelegate__presentLastDeviceAlertForAccount_withRecoveryFactors_withCompletion___block_invoke;
  v76[3] = &unk_263F93FB0;
  id v32 = v27;
  id v77 = v32;
  id v33 = v55;
  id v78 = v33;
  v34 = [v29 actionWithTitle:v31 style:2 handler:v76];
  [v28 addAction:v34];

  [v14 addObject:*MEMORY[0x263F25C00]];
  v35 = (void *)MEMORY[0x263F82400];
  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __106__AAUISignOutFlowControllerDelegate__presentLastDeviceAlertForAccount_withRecoveryFactors_withCompletion___block_invoke_2;
  v71[3] = &unk_263F93FD8;
  char v75 = v54;
  id v36 = v32;
  id v72 = v36;
  v73 = self;
  id v37 = v33;
  id v74 = v37;
  v38 = [v35 actionWithTitle:v63 style:0 handler:v71];
  [v28 addAction:v38];

  v39 = (void *)MEMORY[0x263F82400];
  v40 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v41 = [v40 localizedStringForKey:@"SIGN_OUT_ADD_DATA_RECOVERY_SERVICE_BUTTON" value:&stru_26BD39CD8 table:@"Localizable"];
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __106__AAUISignOutFlowControllerDelegate__presentLastDeviceAlertForAccount_withRecoveryFactors_withCompletion___block_invoke_4;
  v67[3] = &unk_263F94000;
  id v42 = v36;
  id v68 = v42;
  v69 = self;
  id v43 = v37;
  id v70 = v43;
  v44 = [v39 actionWithTitle:v41 style:0 handler:v67];
  [v28 addAction:v44];

  [v14 addObject:*MEMORY[0x263F25BE0]];
  v45 = (void *)MEMORY[0x263F82400];
  v46 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v47 = [v46 localizedStringForKey:@"SIGN_OUT_CANCEL_BUTTON" value:&stru_26BD39CD8 table:@"Localizable"];
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __106__AAUISignOutFlowControllerDelegate__presentLastDeviceAlertForAccount_withRecoveryFactors_withCompletion___block_invoke_5;
  v64[3] = &unk_263F93FB0;
  id v65 = v42;
  id v66 = v43;
  id v48 = v43;
  id v49 = v42;
  v50 = [v45 actionWithTitle:v47 style:1 handler:v64];
  [v28 addAction:v50];

  [v14 addObject:*MEMORY[0x263F25BF8]];
  v51 = objc_msgSend(v14, "aaf_arrayAsCommaSeperatedString");
  [v61 setObject:v51 forKeyedSubscript:*MEMORY[0x263F345E8]];

  v52 = [MEMORY[0x263F25780] reporter];
  [v52 sendEvent:v61];

  v53 = [(AAUISignOutFlowControllerDelegate *)self presentingViewController];
  [v53 presentViewController:v28 animated:1 completion:0];
}

uint64_t __106__AAUISignOutFlowControllerDelegate__presentLastDeviceAlertForAccount_withRecoveryFactors_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setObject:*MEMORY[0x263F25C00] forKeyedSubscript:*MEMORY[0x263F345F8]];
  v2 = [MEMORY[0x263F25780] reporter];
  [v2 sendEvent:*(void *)(a1 + 32)];

  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void __106__AAUISignOutFlowControllerDelegate__presentLastDeviceAlertForAccount_withRecoveryFactors_withCompletion___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *MEMORY[0x263F345F8];
  if (v2)
  {
    [v3 setObject:*MEMORY[0x263F25BF0] forKeyedSubscript:v4];
    id v5 = [MEMORY[0x263F25780] reporter];
    [v5 sendEvent:*(void *)(a1 + 32)];

    char v6 = [*(id *)(a1 + 40) _recoveryFactorController];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __106__AAUISignOutFlowControllerDelegate__presentLastDeviceAlertForAccount_withRecoveryFactors_withCompletion___block_invoke_3;
    v12[3] = &unk_263F92B30;
    id v13 = *(id *)(a1 + 48);
    [v6 generateRecoveryKeyWithCompletion:v12];
  }
  else
  {
    [v3 setObject:*MEMORY[0x263F25BE8] forKeyedSubscript:v4];
    uint64_t v7 = [MEMORY[0x263F25780] reporter];
    [v7 sendEvent:*(void *)(a1 + 32)];

    id v8 = _Block_copy(*(const void **)(a1 + 48));
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = *(void **)(v9 + 32);
    *(void *)(v9 + 32) = v8;

    id v11 = [*(id *)(a1 + 40) _recoveryFactorController];
    [v11 startAddingRecoveryContact];
  }
}

void __106__AAUISignOutFlowControllerDelegate__presentLastDeviceAlertForAccount_withRecoveryFactors_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:underlyingError:", 0, a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v6);
  }
  else
  {
    uint64_t v4 = *(void (**)(uint64_t))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5);
  }
}

void __106__AAUISignOutFlowControllerDelegate__presentLastDeviceAlertForAccount_withRecoveryFactors_withCompletion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setObject:*MEMORY[0x263F25BE0] forKeyedSubscript:*MEMORY[0x263F345F8]];
  int v2 = [MEMORY[0x263F25780] reporter];
  [v2 sendEvent:*(void *)(a1 + 32)];

  uint64_t v3 = _Block_copy(*(const void **)(a1 + 48));
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v3;

  id v6 = [*(id *)(a1 + 40) _recoveryFactorController];
  [v6 startAddingDataRecoveryService];
}

void __106__AAUISignOutFlowControllerDelegate__presentLastDeviceAlertForAccount_withRecoveryFactors_withCompletion___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setObject:*MEMORY[0x263F25BF8] forKeyedSubscript:*MEMORY[0x263F345F8]];
  int v2 = [MEMORY[0x263F25780] reporter];
  [v2 sendEvent:*(void *)(a1 + 32)];

  uint64_t v3 = *(void *)(a1 + 40);
  objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v4);
}

- (void)_offerManateeRepairWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 altDSID];
  id v13 = +[AAUID2DEncryptionFlowContext contextWithType:5 altDSID:v8];

  uint64_t v9 = [v7 telemetryFlowID];
  [v13 setTelemetryFlowID:v9];

  id v10 = [AAUIManateeStateValidator alloc];
  id v11 = [(AAUISignOutFlowControllerDelegate *)self presentingViewController];
  id v12 = [(AAUIManateeStateValidator *)v10 initWithFlowContext:v13 withPresentingViewController:v11];

  [(AAUIManateeStateValidator *)v12 setContext:v7];
  [(AAUIManateeStateValidator *)v12 verifyAndRepairManateeWithCompletion:v6];
}

- (id)_recoveryFactorController
{
  recoveryFactorController = self->_recoveryFactorController;
  if (!recoveryFactorController)
  {
    id v4 = [AAUIRecoveryFactorController alloc];
    accountManager = self->_accountManager;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
    id v7 = [(AAUIRecoveryFactorController *)v4 initWithAccountManager:accountManager presentingViewController:WeakRetained];
    id v8 = self->_recoveryFactorController;
    self->_recoveryFactorController = v7;

    [(AAUIRecoveryFactorController *)self->_recoveryFactorController setDelegate:self];
    [(AAUIRecoveryFactorController *)self->_recoveryFactorController setTelemetryFlowID:self->_telemetryFlowID];
    recoveryFactorController = self->_recoveryFactorController;
  }
  return recoveryFactorController;
}

- (void)signOutControllerDidCancel:(id)a3
{
  pendingSignOutCompletion = (void (**)(id, void, void *))self->_pendingSignOutCompletion;
  if (pendingSignOutCompletion)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -1);
    pendingSignOutCompletion[2](pendingSignOutCompletion, 0, v5);

    id v6 = self->_pendingSignOutCompletion;
    self->_pendingSignOutCompletion = 0;
  }
}

- (void)signOutController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5
{
  pendingSignOutCompletion = (void (**)(id, BOOL, id))self->_pendingSignOutCompletion;
  if (pendingSignOutCompletion)
  {
    pendingSignOutCompletion[2](pendingSignOutCompletion, a4, a5);
    id v7 = self->_pendingSignOutCompletion;
    self->_pendingSignOutCompletion = 0;
  }
}

- (void)recoveryFactorController:(id)a3 didFinishAddingRecoveryContactWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  pendingWalrusValidationCompletion = (void (**)(id, void, id))self->_pendingWalrusValidationCompletion;
  if (pendingWalrusValidationCompletion)
  {
    if (v7)
    {
      pendingWalrusValidationCompletion[2](pendingWalrusValidationCompletion, 0, v7);
    }
    else
    {
      uint64_t v9 = _Block_copy(pendingWalrusValidationCompletion);
      id v10 = objc_alloc_init(MEMORY[0x263F34408]);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __102__AAUISignOutFlowControllerDelegate_recoveryFactorController_didFinishAddingRecoveryContactWithError___block_invoke;
      v14[3] = &unk_263F94028;
      id v15 = v9;
      id v11 = v9;
      [v10 walrusStatusWithCompletion:v14];
    }
    id v12 = self->_pendingWalrusValidationCompletion;
    self->_pendingWalrusValidationCompletion = 0;

    recoveryFactorController = self->_recoveryFactorController;
    self->_recoveryFactorController = 0;
  }
}

void __102__AAUISignOutFlowControllerDelegate_recoveryFactorController_didFinishAddingRecoveryContactWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
  else
  {
    if (a3) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = -1;
    }
    uint64_t v6 = *(void *)(a1 + 32);
    objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:underlyingError:", v5, a3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v7);
  }
}

- (void)_completedRestoreFromiCloud:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = _AAUISignpostLogSystem();
  os_signpost_id_t v5 = _AAUISignpostCreate(v4);
  uint64_t v7 = v6;

  id v8 = _AAUISignpostLogSystem();
  uint64_t v9 = v8;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_209754000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SignOutRestoreBackupCheck", " enableTelemetry=YES ", buf, 2u);
  }

  id v10 = _AAUISignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v18 = v5;
    _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignOutRestoreBackupCheck  enableTelemetry=YES ", buf, 0xCu);
  }

  id v11 = objc_alloc_init(MEMORY[0x263F559D8]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__AAUISignOutFlowControllerDelegate__completedRestoreFromiCloud___block_invoke;
  v13[3] = &unk_263F92E90;
  os_signpost_id_t v15 = v5;
  uint64_t v16 = v7;
  id v14 = v3;
  id v12 = v3;
  [v11 fetchiCloudRestoreIsCompleteWithCompletion:v13];
}

void __65__AAUISignOutFlowControllerDelegate__completedRestoreFromiCloud___block_invoke(void *a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t Nanoseconds = _AAUISignpostGetNanoseconds(a1[5], a1[6]);
  uint64_t v7 = _AAUISignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v14 = 67240448;
    *(_DWORD *)os_signpost_id_t v15 = a2;
    *(_WORD *)&v15[4] = 1026;
    *(_DWORD *)&v15[6] = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_209754000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SignOutRestoreBackupCheck", " RestoreIsComplete=%{public,signpost.telemetry:number1,name=RestoreIsComplete}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v14, 0xEu);
  }

  id v10 = _AAUISignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (double)Nanoseconds / 1000000000.0;
    uint64_t v12 = a1[5];
    int v13 = [v5 code];
    int v14 = 134218752;
    *(void *)os_signpost_id_t v15 = v12;
    *(_WORD *)&v15[8] = 2048;
    double v16 = v11;
    __int16 v17 = 1026;
    int v18 = a2;
    __int16 v19 = 1026;
    int v20 = v13;
    _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SignOutRestoreBackupCheck  RestoreIsComplete=%{public,signpost.telemetry:number1,name=RestoreIsComplete}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v14, 0x22u);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong(&self->_pendingWalrusValidationCompletion, 0);
  objc_storeStrong((id *)&self->_recoveryFactorController, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong(&self->_pendingSignOutCompletion, 0);
}

void __85__AAUISignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_209754000, a2, OS_LOG_TYPE_ERROR, "Sign out preparation failed with error: %@", (uint8_t *)&v2, 0xCu);
}

void __104__AAUISignOutFlowControllerDelegate_signOutFlowController_performWalrusValidationForAccount_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "AAUISignOutFlowControllerDelegate has been deallocated, failing sign out", v1, 2u);
}

void __104__AAUISignOutFlowControllerDelegate_signOutFlowController_performWalrusValidationForAccount_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_209754000, a2, OS_LOG_TYPE_ERROR, "Failed to determine walrus status, but not blocking sign out: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_performLastDeviceCheckForAccount:(uint64_t)a1 withContext:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_209754000, a2, OS_LOG_TYPE_DEBUG, "Performing last device check with context: %@", (uint8_t *)&v2, 0xCu);
}

void __94__AAUISignOutFlowControllerDelegate__performLastDeviceCheckForAccount_withContext_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_209754000, a2, OS_LOG_TYPE_DEBUG, "Determined that the current device is not the last escrow device for context (%@)", (uint8_t *)&v3, 0xCu);
}

void __94__AAUISignOutFlowControllerDelegate__performLastDeviceCheckForAccount_withContext_completion___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "Failed to fetch escrow record devices with context (%@), failing validation: %@", (uint8_t *)&v4, 0x16u);
}

- (void)_presentLastDeviceAlertForAccount:(os_log_t)log withRecoveryFactors:withCompletion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_209754000, log, OS_LOG_TYPE_DEBUG, "Presenting warning to walrus user for signing out of last circle device", v1, 2u);
}

@end