@interface AAUIAccountConversionSignOutFlowControllerDelegate
- (AAUIAccountConversionSignOutFlowControllerDelegate)init;
- (AAUIAccountConversionSignOutFlowControllerDelegate)initWithPresentingViewController:(id)a3 shouldRemoveAppleAccount:(BOOL)a4;
- (UIViewController)presentingViewController;
- (void)_completedRestoreFromiCloud:(id)a3;
- (void)_disableDeviceLocatorForAccount:(id)a3 inViewController:(id)a4 completion:(id)a5;
- (void)setPresentingViewController:(id)a3;
- (void)signOutController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5;
- (void)signOutControllerDidCancel:(id)a3;
- (void)signOutFlowController:(id)a3 disableFindMyDeviceForAccount:(id)a4 completion:(id)a5;
- (void)signOutFlowController:(id)a3 performWalrusValidationForAccount:(id)a4 completion:(id)a5;
- (void)signOutFlowController:(id)a3 showAlertWithTitle:(id)a4 message:(id)a5 completion:(id)a6;
- (void)signOutFlowController:(id)a3 signOutAccount:(id)a4 completion:(id)a5;
@end

@implementation AAUIAccountConversionSignOutFlowControllerDelegate

- (AAUIAccountConversionSignOutFlowControllerDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)AAUIAccountConversionSignOutFlowControllerDelegate;
  v2 = [(AAUIAccountConversionSignOutFlowControllerDelegate *)&v6 init];
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x263EFB210]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

    v2->_shouldRemoveAppleAccount = 1;
  }
  return v2;
}

- (AAUIAccountConversionSignOutFlowControllerDelegate)initWithPresentingViewController:(id)a3 shouldRemoveAppleAccount:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AAUIAccountConversionSignOutFlowControllerDelegate;
  v7 = [(AAUIAccountConversionSignOutFlowControllerDelegate *)&v11 init];
  if (v7)
  {
    v8 = (ACAccountStore *)objc_alloc_init(MEMORY[0x263EFB210]);
    accountStore = v7->_accountStore;
    v7->_accountStore = v8;

    objc_storeWeak((id *)&v7->_presentingViewController, v6);
    v7->_shouldRemoveAppleAccount = a4;
  }

  return v7;
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
    v19[2] = __114__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_showAlertWithTitle_message_completion___block_invoke;
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

uint64_t __114__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_showAlertWithTitle_message_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Account Conversion - Attempting to disableFindMyDevice for %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __117__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke;
  v12[3] = &unk_263F92E18;
  id v13 = v7;
  id v14 = v8;
  v12[4] = self;
  id v10 = v7;
  id v11 = v8;
  [(AAUIAccountConversionSignOutFlowControllerDelegate *)self _completedRestoreFromiCloud:v12];
}

void __117__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Account Conversion - Device is restoring from iCloud but allowing account removal anyways", buf, 2u);
    }
  }
  id v7 = _AAUILogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "Account Conversion - Starting to refresh current FMIP state...", buf, 2u);
  }

  id v8 = +[AAUIDeviceLocatorService sharedInstance];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __117__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke_44;
  v12[3] = &unk_263F92DF0;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(a1 + 40);
  id v14 = v9;
  v12[4] = v10;
  id v13 = v11;
  [v8 refreshCurrentState:v12];
}

void __117__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke_44(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = a2;
    _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Account Conversion - FMIP state came back as %lu", buf, 0xCu);
  }

  id v5 = +[AAUIDeviceLocatorService sharedInstance];
  char v6 = [v5 isStateKnown];

  if ((v6 & 1) == 0)
  {
    id v13 = _AAUILogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v13, OS_LOG_TYPE_DEFAULT, "Account Conversion - FMiP state is unknown, stopping converison.", buf, 2u);
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
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    if (WeakRetained)
    {
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __117__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke_46;
      v18[3] = &unk_263F92B30;
      id v19 = *(id *)(a1 + 48);
      [v10 _disableDeviceLocatorForAccount:v11 inViewController:WeakRetained completion:v18];
      v12 = v19;
    }
    else
    {
      id v16 = _AAUILogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209754000, v16, OS_LOG_TYPE_DEFAULT, "Account Conversion - No view controller provided for sign out, unable to disable FMiP.", buf, 2u);
      }

      uint64_t v17 = *(void *)(a1 + 48);
      v12 = objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -11);
      (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v12);
    }

LABEL_17:
    return;
  }
  v15 = _AAUILogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v15, OS_LOG_TYPE_DEFAULT, "Account Conversion - Device locator not enabled, allowing account removal.", buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __117__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke_46(uint64_t a1, int a2, void *a3)
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
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Account Conversion - Device locator disabled with success %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_disableDeviceLocatorForAccount:(id)a3 inViewController:(id)a4 completion:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __114__AAUIAccountConversionSignOutFlowControllerDelegate__disableDeviceLocatorForAccount_inViewController_completion___block_invoke;
  v9[3] = &unk_263F92E68;
  id v10 = v7;
  id v8 = v7;
  +[AAUIDeviceLocatorConfirmationUtilities showDisableAlertForAccount:a3 presentingViewController:a4 withCompletion:v9];
}

void __114__AAUIAccountConversionSignOutFlowControllerDelegate__disableDeviceLocatorForAccount_inViewController_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    char v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Account Conversion - User canceled FMiP password prompt.", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v7 = +[AAUIDeviceLocatorService sharedInstance];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __114__AAUIAccountConversionSignOutFlowControllerDelegate__disableDeviceLocatorForAccount_inViewController_completion___block_invoke_56;
    v8[3] = &unk_263F92E40;
    id v9 = *(id *)(a1 + 32);
    [v7 disableInContext:2 withWipeToken:v5 completion:v8];
  }
}

void __114__AAUIAccountConversionSignOutFlowControllerDelegate__disableDeviceLocatorForAccount_inViewController_completion___block_invoke_56(uint64_t a1, int a2)
{
  v4 = _AAUILogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Account Conversion - Failed to disable FMiP for account deletion.", buf, 2u);
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
      _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Account Conversion - Successfully disabled FMiP for account deletion!", v8, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)signOutFlowController:(id)a3 signOutAccount:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  BOOL shouldRemoveAppleAccount = self->_shouldRemoveAppleAccount;
  id v10 = _AAUILogSystem();
  id v11 = v10;
  if (shouldRemoveAppleAccount)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v11, OS_LOG_TYPE_DEFAULT, "Account Conversion - Removing Apple Account", buf, 2u);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __102__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke;
    block[3] = &unk_263F92DA0;
    id v13 = v7;
    uint64_t v14 = self;
    id v15 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[AAUIAccountConversionSignOutFlowControllerDelegate signOutFlowController:signOutAccount:completion:](v11);
    }

    (*((void (**)(id, uint64_t, void))v8 + 2))(v8, 1, 0);
  }
}

void __102__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke(uint64_t a1)
{
  v2 = [[AAUISignOutController alloc] initWithAccount:*(void *)(a1 + 32)];
  v3 = [NSDictionary dictionary];
  [(AAUISignOutController *)v2 _setDataclassOptions:v3];

  [(AAUISignOutController *)v2 setDelegate:*(void *)(a1 + 40)];
  v4 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __102__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke_2;
  block[3] = &unk_263F92DA0;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v7;
  dispatch_async(v4, block);
}

void __102__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_209754000, v2, OS_LOG_TYPE_DEFAULT, "Account Conversion - Attempting to sign out account %@ with no dataclass actions.", buf, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(*(void *)(a1 + 40) + 16);
  uint64_t v6 = [NSDictionary dictionary];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __102__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke_61;
  v7[3] = &unk_263F92B30;
  id v8 = *(id *)(a1 + 48);
  [v5 removeAccount:v4 withDataclassActions:v6 completion:v7];
}

void __102__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke_61(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = _AAUILogSystem();
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
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Account Conversion - Removal of account completed with success: %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)signOutFlowController:(id)a3 performWalrusValidationForAccount:(id)a4 completion:(id)a5
{
  id v5 = (void (**)(id, uint64_t, void))a5;
  uint64_t v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[AAUIAccountConversionSignOutFlowControllerDelegate signOutFlowController:performWalrusValidationForAccount:completion:](v6);
  }

  v5[2](v5, 1, 0);
}

- (void)signOutControllerDidCancel:(id)a3
{
  pendingSignOutCompletion = (void (**)(id, void, void *))self->_pendingSignOutCompletion;
  if (pendingSignOutCompletion)
  {
    id v5 = objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -1);
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

- (void)_completedRestoreFromiCloud:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = _AAUISignpostLogSystem();
  os_signpost_id_t v5 = _AAUISignpostCreate(v4);
  uint64_t v7 = v6;

  int v8 = _AAUISignpostLogSystem();
  id v9 = v8;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_209754000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SignOutRestoreBackupCheck", " enableTelemetry=YES ", buf, 2u);
  }

  __int16 v10 = _AAUISignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v18 = v5;
    _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignOutRestoreBackupCheck  enableTelemetry=YES ", buf, 0xCu);
  }

  id v11 = objc_alloc_init(MEMORY[0x263F559D8]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__AAUIAccountConversionSignOutFlowControllerDelegate__completedRestoreFromiCloud___block_invoke;
  v13[3] = &unk_263F92E90;
  os_signpost_id_t v15 = v5;
  uint64_t v16 = v7;
  id v14 = v3;
  id v12 = v3;
  [v11 fetchiCloudRestoreIsCompleteWithCompletion:v13];
}

void __82__AAUIAccountConversionSignOutFlowControllerDelegate__completedRestoreFromiCloud___block_invoke(void *a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t Nanoseconds = _AAUISignpostGetNanoseconds(a1[5], a1[6]);
  uint64_t v7 = _AAUISignpostLogSystem();
  int v8 = v7;
  os_signpost_id_t v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v14 = 67240448;
    *(_DWORD *)os_signpost_id_t v15 = a2;
    *(_WORD *)&v15[4] = 1026;
    *(_DWORD *)&v15[6] = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_209754000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SignOutRestoreBackupCheck", " RestoreIsComplete=%{public,signpost.telemetry:number1,name=RestoreIsComplete}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v14, 0xEu);
  }

  __int16 v10 = _AAUISignpostLogSystem();
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong(&self->_pendingSignOutCompletion, 0);
}

- (void)signOutFlowController:(os_log_t)log signOutAccount:completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_209754000, log, OS_LOG_TYPE_DEBUG, "Account Conversion - Hook requested to not remove Apple Account, skipping removal of Apple Account and returning success.", v1, 2u);
}

- (void)signOutFlowController:(os_log_t)log performWalrusValidationForAccount:completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "Account Conversion - User was asked to remove ADP already this will cause a problem if not", v1, 2u);
}

@end