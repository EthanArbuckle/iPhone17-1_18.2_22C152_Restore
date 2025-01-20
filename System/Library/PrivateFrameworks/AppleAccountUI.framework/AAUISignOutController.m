@interface AAUISignOutController
- (AAUIFinanceKitAdapterProtocol)walletOrderChecker;
- (AAUISignOutController)initWithAccount:(id)a3;
- (AAUISignOutController)initWithCoder:(id)a3;
- (ACAccount)account;
- (ACAccountStore)_accountStore;
- (BOOL)_hasOrders;
- (BOOL)_hasPaymentPasses;
- (BOOL)_hasiCloudDriveData;
- (BOOL)_hasiCloudPhotosData;
- (BOOL)_showWalletFooter;
- (BOOL)hasiCloudDriveData;
- (BOOL)hasiCloudPhotosData;
- (NSDictionary)_dataclassOptions;
- (NSString)telemetryFlowID;
- (id)_actionableDataclassOptions;
- (id)_appendToSignoutMessage:(id)a3 appendedString:(id)a4;
- (id)_dataclassViewController;
- (id)_signOutMessageSimplified:(BOOL)a3 withConfirmation:(BOOL)a4;
- (id)_spinnerViewControllerForActions:(id)a3;
- (id)footerTextForDataclassPickerViewController:(id)a3;
- (id)messageTextForDataclassPickerViewController:(id)a3;
- (id)titleTextForDataclassPickerViewController:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dataclassOptions;
- (void)_dataclassViewController;
- (void)_delegate_signOutControllerDidCancel;
- (void)_delegate_signOutControllerDidCompleteWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_mainQueue_continueSignOutWithDataclassActions:(id)a3;
- (void)_mainQueue_presentSpinnerPageWithDataclassActions:(id)a3 completion:(id)a4;
- (void)_mainQueue_promptForConfirmationInViewController:(id)a3 simplified:(BOOL)a4 withCompletion:(id)a5;
- (void)_setAccountStore:(id)a3;
- (void)_setDataclassOptions:(id)a3;
- (void)dataclassPickerViewController:(id)a3 didCompleteWithDataclassActions:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)prepareInViewController:(id)a3 completion:(id)a4;
- (void)setHasiCloudDriveData:(BOOL)a3;
- (void)setHasiCloudPhotosData:(BOOL)a3;
- (void)setTelemetryFlowID:(id)a3;
- (void)setWalletOrderChecker:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AAUISignOutController

- (AAUISignOutController)initWithAccount:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AAUISignOutController;
  v6 = [(AAUISignOutController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    uint64_t v8 = [(ACAccount *)v7->_account accountStore];
    accountStore = v7->_accountStore;
    v7->_accountStore = (ACAccountStore *)v8;
  }
  return v7;
}

- (AAUISignOutController)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AAUISignOutController;
  id v5 = [(AAUISignOutController *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_account"];
    account = v5->_account;
    v5->_account = (ACAccount *)v6;

    uint64_t v8 = [(ACAccount *)v5->_account accountStore];
    v9 = v8;
    if (!v8)
    {
      v9 = [MEMORY[0x263EFB210] defaultStore];
    }
    objc_storeStrong((id *)&v5->_accountStore, v9);
    if (!v8) {
  }
    }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v10[1] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)AAUISignOutController;
  [(AAUISignOutController *)&v8 viewDidLoad];
  v3 = [(AAUISignOutController *)self _actionableDataclassOptions];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(AAUISignOutController *)self _dataclassViewController];
    v10[0] = v5;
    uint64_t v6 = (void **)v10;
  }
  else
  {
    id v5 = [(AAUISignOutController *)self _spinnerViewControllerForActions:0];
    v9 = v5;
    uint64_t v6 = &v9;
  }
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [(AAUISignOutController *)self setViewControllers:v7 animated:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AAUISignOutController;
  [(AAUISignOutController *)&v7 viewWillAppear:a3];
  uint64_t v4 = [(AAUISignOutController *)self viewControllers];
  id v5 = [v4 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(AAUISignOutController *)self _mainQueue_continueSignOutWithDataclassActions:0];
  }
}

- (id)_dataclassViewController
{
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(AAUISignOutController *)(uint64_t)self _dataclassViewController];
  }

  uint64_t v4 = [AAUIDataclassPickerViewController alloc];
  id v5 = [(AAUISignOutController *)self _dataclassOptions];
  uint64_t v6 = [(AAUIDataclassPickerViewController *)v4 initWithDataclassOptions:v5 account:self->_account];

  objc_super v7 = [(AAUISignOutController *)self telemetryFlowID];
  [(AAUIDataclassPickerViewController *)v6 setTelemetryFlowID:v7];

  [(AAUIDataclassPickerViewController *)v6 setDelegate:self];
  return v6;
}

- (id)_spinnerViewControllerForActions:(id)a3
{
  v3 = [a3 allValues];
  uint64_t v4 = [MEMORY[0x263EFB238] actionWithType:2];
  int v5 = [v3 containsObject:v4];

  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v7 = v6;
  if (v5) {
    objc_super v8 = @"SIGN_OUT_SPINNER_KEEPING";
  }
  else {
    objc_super v8 = @"SIGN_OUT_SPINNER_REMOVING";
  }
  v9 = [v6 localizedStringForKey:v8 value:&stru_26BD39CD8 table:@"Localizable"];

  v10 = objc_alloc_init(AAUISpinnerViewController);
  objc_super v11 = [(AAUISpinnerViewController *)v10 label];
  [v11 setText:v9];

  return v10;
}

- (id)_signOutMessageSimplified:(BOOL)a3 withConfirmation:(BOOL)a4
{
  if (a3)
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v5 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"SIGN_OUT_CONFIRM_MESSAGE"];
    id v6 = [v4 localizedStringForKey:v5 value:&stru_26BD39CD8 table:@"Localizable"];

LABEL_20:
    goto LABEL_21;
  }
  BOOL v7 = a4;
  if ([(AAUISignOutController *)self _showWalletFooter])
  {
    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v9 localizedStringForKey:@"SIGN_OUT_PASSES_ORDERS" value:&stru_26BD39CD8 table:@"Localizable"];
  }
  else
  {
    id v6 = 0;
  }
  if ([(AAUISignOutController *)self _hasiCloudPhotosData])
  {
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v11 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"SIGN_OUT_CLOUDPHOTO"];
    v12 = [v10 localizedStringForKey:v11 value:&stru_26BD39CD8 table:@"Localizable"];

    if (v6)
    {
      uint64_t v13 = [(AAUISignOutController *)self _appendToSignoutMessage:v6 appendedString:v12];

      id v6 = (id)v13;
    }
    else
    {
      id v6 = v12;
    }
  }
  if ([(AAUISignOutController *)self _hasiCloudDriveData])
  {
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"SIGN_OUT_ICLOUD_DRIVE"];
    v16 = [v14 localizedStringForKey:v15 value:&stru_26BD39CD8 table:@"Localizable"];

    if (v6)
    {
      uint64_t v17 = [(AAUISignOutController *)self _appendToSignoutMessage:v6 appendedString:v16];

      id v6 = (id)v17;
    }
    else
    {
      id v6 = v16;
    }
  }
  if (v7)
  {
    v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v19 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"SIGN_OUT_CONFIRM_MESSAGE"];
    id v4 = [v18 localizedStringForKey:v19 value:&stru_26BD39CD8 table:@"Localizable"];

    if (v6)
    {
      uint64_t v20 = [(AAUISignOutController *)self _appendToSignoutMessage:v6 appendedString:v4];

      id v6 = (id)v20;
    }
    else
    {
      id v4 = v4;
      id v6 = v4;
    }
    goto LABEL_20;
  }
LABEL_21:
  return v6;
}

- (id)_appendToSignoutMessage:(id)a3 appendedString:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if ([v6 length]) {
    [v6 stringByAppendingFormat:@"\n\n%@", v5];
  }
  else {
  BOOL v7 = [v6 stringByAppendingString:v5];
  }

  return v7;
}

- (BOOL)_hasiCloudDriveData
{
  if ([(AAUISignOutController *)self hasiCloudDriveData]) {
    return 1;
  }
  id v4 = [(AAUISignOutController *)self account];
  char v5 = [v4 isEnabledForDataclass:*MEMORY[0x263EFB4C0]];

  return v5;
}

- (BOOL)_hasiCloudPhotosData
{
  if ([(AAUISignOutController *)self hasiCloudPhotosData]) {
    return 1;
  }
  id v4 = [(AAUISignOutController *)self account];
  if ([v4 isEnabledForDataclass:*MEMORY[0x263EFACF8]])
  {
    char v3 = 1;
  }
  else
  {
    char v5 = [(AAUISignOutController *)self account];
    if ([v5 isEnabledForDataclass:*MEMORY[0x263EFACC0]])
    {
      char v3 = 1;
    }
    else
    {
      id v6 = [(AAUISignOutController *)self account];
      char v3 = [v6 isEnabledForDataclass:*MEMORY[0x263EFAD28]];
    }
  }

  return v3;
}

- (BOOL)_hasOrders
{
  char v3 = [(AAUISignOutController *)self walletOrderChecker];

  if (!v3) {
    return 0;
  }
  id v4 = [(AAUISignOutController *)self walletOrderChecker];
  char v5 = [v4 hasOrders];

  return v5;
}

- (AAUIFinanceKitAdapterProtocol)walletOrderChecker
{
  walletOrderChecker = self->_walletOrderChecker;
  if (!walletOrderChecker)
  {
    id v4 = (AAUIFinanceKitAdapterProtocol *)objc_opt_new();
    char v5 = self->_walletOrderChecker;
    self->_walletOrderChecker = v4;

    walletOrderChecker = self->_walletOrderChecker;
  }
  return walletOrderChecker;
}

- (BOOL)_hasPaymentPasses
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v2 = (void *)getPKPassLibraryClass_softClass;
  uint64_t v12 = getPKPassLibraryClass_softClass;
  if (!getPKPassLibraryClass_softClass)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __getPKPassLibraryClass_block_invoke;
    v8[3] = &unk_263F92608;
    v8[4] = &v9;
    __getPKPassLibraryClass_block_invoke((uint64_t)v8);
    v2 = (void *)v10[3];
  }
  char v3 = v2;
  _Block_object_dispose(&v9, 8);
  id v4 = objc_alloc_init(v3);
  char v5 = [v4 passesOfType:1];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

- (BOOL)_showWalletFooter
{
  if ([(AAUISignOutController *)self _hasPaymentPasses]) {
    return 1;
  }
  return [(AAUISignOutController *)self _hasOrders];
}

- (NSDictionary)_dataclassOptions
{
  dataclassOptions = self->_dataclassOptions;
  if (!dataclassOptions)
  {
    id v4 = [(ACAccountStore *)self->_accountStore dataclassActionsForAccountDeletion:self->_account error:0];
    char v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(AAUISignOutController *)(uint64_t)v4 _dataclassOptions];
    }

    BOOL v6 = objc_msgSend(v4, "aaf_filter:", &__block_literal_global_22);
    objc_msgSend(v6, "aaf_map:", &__block_literal_global_103);
    BOOL v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    objc_super v8 = self->_dataclassOptions;
    self->_dataclassOptions = v7;

    dataclassOptions = self->_dataclassOptions;
  }
  return dataclassOptions;
}

uint64_t __42__AAUISignOutController__dataclassOptions__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  char v3 = (void *)MEMORY[0x263EFB238];
  id v4 = a3;
  char v5 = [v3 actionWithType:3];
  uint64_t v6 = [v4 containsObject:v5];

  return v6;
}

AAUIDataclassOption *__42__AAUISignOutController__dataclassOptions__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = [[AAUIDataclassOption alloc] initWithActions:v3];

  return v4;
}

- (id)_actionableDataclassOptions
{
  v2 = [(AAUISignOutController *)self _dataclassOptions];
  id v3 = objc_msgSend(v2, "aaf_filter:", &__block_literal_global_107);

  return v3;
}

uint64_t __52__AAUISignOutController__actionableDataclassOptions__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 isEditable];
}

- (void)prepareInViewController:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    account = self->_account;
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = account;
    _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Preflighting sign out of account %{public}@...", buf, 0xCu);
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__AAUISignOutController_prepareInViewController_completion___block_invoke;
  aBlock[3] = &unk_263F92B30;
  id v10 = v7;
  id v18 = v10;
  uint64_t v11 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
  uint64_t v12 = [(AAUISignOutController *)self _actionableDataclassOptions];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    v11[2](v11, 1, 0);
  }
  else
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __60__AAUISignOutController_prepareInViewController_completion___block_invoke_2;
    v14[3] = &unk_263F92DA0;
    v14[4] = self;
    id v15 = v6;
    v16 = v11;
    dispatch_async(MEMORY[0x263EF83A0], v14);
  }
}

uint64_t __60__AAUISignOutController_prepareInViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __60__AAUISignOutController_prepareInViewController_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_promptForConfirmationInViewController:simplified:withCompletion:", *(void *)(a1 + 40), 0, *(void *)(a1 + 48));
}

- (void)_mainQueue_promptForConfirmationInViewController:(id)a3 simplified:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  v30[2] = *MEMORY[0x263EF8340];
  id v25 = a5;
  id v27 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(AAUISignOutController *)self setModalInPresentation:1];
  objc_super v8 = (void *)MEMORY[0x263F202A8];
  uint64_t v9 = *MEMORY[0x263F25A90];
  id v10 = [(ACAccount *)self->_account aa_altDSID];
  uint64_t v11 = [v8 analyticsEventWithName:v9 altDSID:v10 flowID:self->_telemetryFlowID];

  uint64_t v12 = *MEMORY[0x263F25C00];
  v30[0] = *MEMORY[0x263F25BF8];
  v30[1] = v12;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
  uint64_t v13 = objc_msgSend(v26, "aaf_arrayAsCommaSeperatedString");
  [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x263F345E8]];

  v14 = [MEMORY[0x263F25780] reporter];
  [v14 sendEvent:v11];

  v24 = (void *)MEMORY[0x263F82418];
  id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"SIGN_OUT_CONFIRM_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];
  uint64_t v17 = [(AAUISignOutController *)self _signOutMessageSimplified:v5 withConfirmation:1];
  id v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"SIGN_OUT_CONFIRM_CANCEL" value:&stru_26BD39CD8 table:@"Localizable"];
  uint64_t v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v21 = [v20 localizedStringForKey:@"SIGN_OUT_CONFIRM_OK" value:&stru_26BD39CD8 table:@"Localizable"];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __100__AAUISignOutController__mainQueue_promptForConfirmationInViewController_simplified_withCompletion___block_invoke;
  v28[3] = &unk_263F94528;
  v28[4] = self;
  id v29 = v25;
  id v22 = v25;
  v23 = [v24 alertWithTitle:v16 message:v17 cancelButtonTitle:v19 destructiveButtonTitle:v21 actionHandler:v28];

  [v27 presentViewController:v23 animated:1 completion:0];
}

void __100__AAUISignOutController__mainQueue_promptForConfirmationInViewController_simplified_withCompletion___block_invoke(uint64_t a1, int a2)
{
  id v4 = (void *)MEMORY[0x263F202A8];
  uint64_t v5 = *MEMORY[0x263F25A98];
  id v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1448), "aa_altDSID");
  id v7 = [v4 analyticsEventWithName:v5 altDSID:v6 flowID:*(void *)(*(void *)(a1 + 32) + 1456)];

  objc_super v8 = _AAUILogSystem();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "User opted to cancel sign out.", buf, 2u);
    }

    [v7 setObject:*MEMORY[0x263F25BF8] forKeyedSubscript:*MEMORY[0x263F345F8]];
    id v10 = [MEMORY[0x263F25780] reporter];
    [v10 sendEvent:v7];

    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -1);
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Continuing sign out with user-specified dataclass actions.", v14, 2u);
    }

    [v7 setObject:*MEMORY[0x263F25C00] forKeyedSubscript:*MEMORY[0x263F345F8]];
    uint64_t v13 = [MEMORY[0x263F25780] reporter];
    [v13 sendEvent:v7];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_mainQueue_continueSignOutWithDataclassActions:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    account = self->_account;
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = account;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to sign out account %@ with dataclass actions %@.", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  accountStore = self->_accountStore;
  objc_super v8 = self->_account;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__AAUISignOutController__mainQueue_continueSignOutWithDataclassActions___block_invoke;
  v9[3] = &unk_263F93B20;
  objc_copyWeak(&v10, (id *)buf);
  [(ACAccountStore *)accountStore removeAccount:v8 withDataclassActions:v4 completion:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __72__AAUISignOutController__mainQueue_continueSignOutWithDataclassActions___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Removal of account completed with success: %@, error: %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__AAUISignOutController__mainQueue_continueSignOutWithDataclassActions___block_invoke_130;
  block[3] = &unk_263F926E0;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  char v12 = a2;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v11);
}

void __72__AAUISignOutController__mainQueue_continueSignOutWithDataclassActions___block_invoke_130(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_delegate_signOutControllerDidCompleteWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_mainQueue_presentSpinnerPageWithDataclassActions:(id)a3 completion:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v7 = [(AAUISignOutController *)self _spinnerViewControllerForActions:v6];

  [(AAUISignOutController *)self pushViewController:v7 animated:1];
  id v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    id v8 = v9;
  }
}

- (void)_delegate_signOutControllerDidCancel
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = [(AAUISignOutController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 signOutControllerDidCancel:self];
  }
  else {
    [(AAUISignOutController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_delegate_signOutControllerDidCompleteWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v6 = [(AAUISignOutController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 signOutController:self didCompleteWithSuccess:v4 error:v7];
  }
  else {
    [(AAUISignOutController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (id)footerTextForDataclassPickerViewController:(id)a3
{
  return [(AAUISignOutController *)self _signOutMessageSimplified:0 withConfirmation:0];
}

- (id)titleTextForDataclassPickerViewController:(id)a3
{
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v4 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"SIGN_OUT_TITLE"];
  id v5 = [v3 localizedStringForKey:v4 value:&stru_26BD39CD8 table:@"Localizable"];

  return v5;
}

- (id)messageTextForDataclassPickerViewController:(id)a3
{
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v4 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"SIGN_OUT_SUBTITLE"];
  id v5 = [v3 localizedStringForKey:v4 value:&stru_26BD39CD8 table:@"Localizable"];

  return v5;
}

- (void)dataclassPickerViewController:(id)a3 didCompleteWithDataclassActions:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __87__AAUISignOutController_dataclassPickerViewController_didCompleteWithDataclassActions___block_invoke;
  v7[3] = &unk_263F934B8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(AAUISignOutController *)self _mainQueue_promptForConfirmationInViewController:self simplified:1 withCompletion:v7];
}

void __87__AAUISignOutController_dataclassPickerViewController_didCompleteWithDataclassActions___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    v2 = *(void **)(a1 + 40);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __87__AAUISignOutController_dataclassPickerViewController_didCompleteWithDataclassActions___block_invoke_2;
    v4[3] = &unk_263F926B8;
    v4[4] = v3;
    id v5 = v2;
    objc_msgSend(v3, "_mainQueue_presentSpinnerPageWithDataclassActions:completion:", v5, v4);
  }
}

uint64_t __87__AAUISignOutController_dataclassPickerViewController_didCompleteWithDataclassActions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_continueSignOutWithDataclassActions:", *(void *)(a1 + 40));
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (ACAccountStore)_accountStore
{
  return self->_accountStore;
}

- (void)_setAccountStore:(id)a3
{
}

- (void)_setDataclassOptions:(id)a3
{
}

- (ACAccount)account
{
  return self->_account;
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
}

- (void)setWalletOrderChecker:(id)a3
{
}

- (BOOL)hasiCloudPhotosData
{
  return self->_hasiCloudPhotosData;
}

- (void)setHasiCloudPhotosData:(BOOL)a3
{
  self->_hasiCloudPhotosData = a3;
}

- (BOOL)hasiCloudDriveData
{
  return self->_hasiCloudDriveData;
}

- (void)setHasiCloudDriveData:(BOOL)a3
{
  self->_hasiCloudDriveData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletOrderChecker, 0);
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_dataclassOptions, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)_dataclassViewController
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 1440);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_209754000, a2, OS_LOG_TYPE_DEBUG, "Building dataclass picker for signout with options: %@", (uint8_t *)&v3, 0xCu);
}

- (void)_dataclassOptions
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_209754000, a2, OS_LOG_TYPE_DEBUG, "Initial dataclass actions for sign out: %@", (uint8_t *)&v2, 0xCu);
}

@end