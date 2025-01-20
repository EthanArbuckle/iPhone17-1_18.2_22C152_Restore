@interface DKAccountProvider
- (AAUIRecoveryFactorController)recoveryFactorController;
- (ACAccountStore)accountStore;
- (AIDAAccountManager)accountManager;
- (AIDAServiceOwnerProtocol)serviceOwnersManager;
- (CDPLocalSecret)cachedLocalSecret;
- (CDPWalrusStateController)walrusStateController;
- (DKAccountProvider)initWithFindMyProvider:(id)a3;
- (DKFindMyProvider)findMyProvider;
- (UIViewController)presentingViewController;
- (id)accountsForAccountManager:(id)a3;
- (id)pendingWalrusValidationCompletion;
- (void)_addAccountDataForAccounts:(id)a3 toAccountsData:(id)a4 completion:(id)a5;
- (void)_determineEligibilityWithCompletion:(id)a3;
- (void)_fetchAccountDataForAccount:(id)a3 completion:(id)a4;
- (void)_performLastDeviceCheckWithCompletion:(id)a3;
- (void)_presentLastDeviceAlertWithCompletion:(id)a3;
- (void)_presentLastDeviceAlertWithRecoveryFactors:(unint64_t)a3 withCompletion:(id)a4;
- (void)_verifyAndRepairManateeWithPresentingViewController:(id)a3 completion:(id)a4;
- (void)_walrusStatusWithCompletion:(id)a3;
- (void)cacheLocalDevicePasscode:(id)a3 passcodeType:(int)a4;
- (void)fetchAccounts:(id)a3;
- (void)preparationRequiredForPrimaryAppleAccountWithCompletion:(id)a3;
- (void)preparePrimaryAppleAccountForSignOutWithPresentingViewController:(id)a3 completion:(id)a4;
- (void)primaryAppleAccountRequiresADPSpecificInternetWarning:(id)a3;
- (void)recoveryFactorController:(id)a3 didFinishAddingRecoveryContactWithError:(id)a4;
- (void)setAccountManager:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setCachedLocalSecret:(id)a3;
- (void)setFindMyProvider:(id)a3;
- (void)setPendingWalrusValidationCompletion:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setRecoveryFactorController:(id)a3;
- (void)setServiceOwnersManager:(id)a3;
- (void)setWalrusStateController:(id)a3;
- (void)signOutFlowController:(id)a3 disableFindMyDeviceForAccount:(id)a4 completion:(id)a5;
- (void)signOutFlowController:(id)a3 performWalrusValidationForAccount:(id)a4 completion:(id)a5;
- (void)signOutFlowController:(id)a3 showAlertWithTitle:(id)a4 message:(id)a5 completion:(id)a6;
- (void)signOutFlowController:(id)a3 signOutAccount:(id)a4 completion:(id)a5;
- (void)signOutPrimaryAppleAccountWithPresentingViewController:(id)a3 completion:(id)a4;
@end

@implementation DKAccountProvider

- (DKAccountProvider)initWithFindMyProvider:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DKAccountProvider;
  v5 = [(DKAccountProvider *)&v17 init];
  v6 = v5;
  if (v5)
  {
    [(DKAccountProvider *)v5 setFindMyProvider:v4];
    v7 = [MEMORY[0x263EFB210] defaultStore];
    [(DKAccountProvider *)v6 setAccountStore:v7];

    id v8 = objc_alloc(MEMORY[0x263F26D88]);
    v9 = [(DKAccountProvider *)v6 accountStore];
    v10 = (void *)[v8 initWithAccountStore:v9];
    [(DKAccountProvider *)v6 setServiceOwnersManager:v10];

    id v11 = objc_alloc(MEMORY[0x263F26D70]);
    v12 = [(DKAccountProvider *)v6 accountStore];
    v13 = (void *)[v11 initWithAccountStore:v12];
    [(DKAccountProvider *)v6 setAccountManager:v13];

    v14 = [(DKAccountProvider *)v6 accountManager];
    [v14 setDelegate:v6];

    id v15 = objc_alloc_init(MEMORY[0x263F34408]);
    [(DKAccountProvider *)v6 setWalrusStateController:v15];
  }
  return v6;
}

- (void)fetchAccounts:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  v6 = [(DKAccountProvider *)self accountStore];
  v7 = objc_msgSend(v6, "aa_primaryAppleAccount");

  id v8 = [(DKAccountProvider *)self accountStore];
  v9 = objc_msgSend(v8, "aa_appleAccounts");
  v10 = (void *)[v9 mutableCopy];

  if ([v10 count])
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __35__DKAccountProvider_fetchAccounts___block_invoke;
    v13[3] = &unk_264CF0B30;
    id v11 = v7;
    id v14 = v11;
    uint64_t v12 = [v10 indexOfObjectPassingTest:v13];
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [v10 removeObjectAtIndex:v12];
      [v10 insertObject:v11 atIndex:0];
    }
  }
  [(DKAccountProvider *)self _addAccountDataForAccounts:v10 toAccountsData:v5 completion:v4];
}

uint64_t __35__DKAccountProvider_fetchAccounts___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)primaryAppleAccountRequiresADPSpecificInternetWarning:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __75__DKAccountProvider_primaryAppleAccountRequiresADPSpecificInternetWarning___block_invoke;
  v6[3] = &unk_264CF0B58;
  id v7 = v4;
  id v5 = v4;
  [(DKAccountProvider *)self _walrusStatusWithCompletion:v6];
}

uint64_t __75__DKAccountProvider_primaryAppleAccountRequiresADPSpecificInternetWarning___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 1);
}

- (void)cacheLocalDevicePasscode:(id)a3 passcodeType:(int)a4
{
  if (a4 == -1) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  v6 = (objc_class *)MEMORY[0x263F343B0];
  id v7 = a3;
  id v8 = (id)[[v6 alloc] initWithValidatedSecret:v7 secretType:v5];

  [(DKAccountProvider *)self setCachedLocalSecret:v8];
}

- (void)preparationRequiredForPrimaryAppleAccountWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __77__DKAccountProvider_preparationRequiredForPrimaryAppleAccountWithCompletion___block_invoke;
  v6[3] = &unk_264CF0B58;
  id v7 = v4;
  id v5 = v4;
  [(DKAccountProvider *)self _walrusStatusWithCompletion:v6];
}

void __77__DKAccountProvider_preparationRequiredForPrimaryAppleAccountWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    v3 = [MEMORY[0x263F34328] sharedInstance];
    id v4 = [v3 contextForPrimaryAccount];

    id v5 = (void *)[objc_alloc(MEMORY[0x263F343F0]) initWithContext:v4];
    id v8 = 0;
    [v5 isManateeAvailable:&v8];
    id v6 = v8;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v7();
  }
}

- (void)preparePrimaryAppleAccountForSignOutWithPresentingViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __97__DKAccountProvider_preparePrimaryAppleAccountForSignOutWithPresentingViewController_completion___block_invoke;
  v10[3] = &unk_264CF0BD0;
  objc_copyWeak(&v13, &location);
  id v8 = v7;
  id v12 = v8;
  id v9 = v6;
  id v11 = v9;
  [(DKAccountProvider *)self _walrusStatusWithCompletion:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __97__DKAccountProvider_preparePrimaryAppleAccountForSignOutWithPresentingViewController_completion___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v7 = WeakRetained;
  if (!WeakRetained)
  {
    id v8 = (void (*)(void))*((void *)a1[5] + 2);
LABEL_7:
    v8();
    goto LABEL_9;
  }
  if (a2 == 2)
  {
    id v8 = (void (*)(void))*((void *)a1[5] + 2);
    goto LABEL_7;
  }
  if (a2 == 1)
  {
    [WeakRetained _verifyAndRepairManateeWithPresentingViewController:a1[4] completion:a1[5]];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __97__DKAccountProvider_preparePrimaryAppleAccountForSignOutWithPresentingViewController_completion___block_invoke_2;
    block[3] = &unk_264CF0BA8;
    id v10 = v5;
    id v12 = a1[5];
    id v11 = a1[4];
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
LABEL_9:
}

void __97__DKAccountProvider_preparePrimaryAppleAccountForSignOutWithPresentingViewController_completion___block_invoke_2(id *a1)
{
  v2 = _DKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __97__DKAccountProvider_preparePrimaryAppleAccountForSignOutWithPresentingViewController_completion___block_invoke_2_cold_1((uint64_t)a1, v2, v3, v4, v5, v6, v7, v8);
  }

  id v9 = (void *)MEMORY[0x263F1C3F8];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __97__DKAccountProvider_preparePrimaryAppleAccountForSignOutWithPresentingViewController_completion___block_invoke_32;
  id v14 = &unk_264CF0B80;
  id v16 = a1[6];
  id v15 = a1[4];
  id v10 = objc_msgSend(v9, "dkui_unknownFailureAlertControllerWithCompletion:", &v11);
  objc_msgSend(a1[5], "presentViewController:animated:completion:", v10, 1, 0, v11, v12, v13, v14);
}

uint64_t __97__DKAccountProvider_preparePrimaryAppleAccountForSignOutWithPresentingViewController_completion___block_invoke_32(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)signOutPrimaryAppleAccountWithPresentingViewController:(id)a3 completion:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = (objc_class *)MEMORY[0x263F26D78];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 setViewController:v8];
  uint64_t v13 = *MEMORY[0x263F26D28];
  uint64_t v10 = v13;
  v14[0] = self;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  [v9 setSignOutContexts:v11];

  [(DKAccountProvider *)self setPresentingViewController:v8];
  uint64_t v12 = [(DKAccountProvider *)self serviceOwnersManager];
  [v12 signOutService:v10 withContext:v9 completion:v7];
}

- (void)signOutFlowController:(id)a3 performWalrusValidationForAccount:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__DKAccountProvider_signOutFlowController_performWalrusValidationForAccount_completion___block_invoke;
  v12[3] = &unk_264CF0BF8;
  objc_copyWeak(&v14, &location);
  id v11 = v10;
  id v13 = v11;
  [(DKAccountProvider *)self _walrusStatusWithCompletion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __88__DKAccountProvider_signOutFlowController_performWalrusValidationForAccount_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  uint64_t v7 = *(void *)(a1 + 32);
  if (a2 == 1 && WeakRetained) {
    [WeakRetained _performLastDeviceCheckWithCompletion:v7];
  }
  else {
    (*(void (**)(void, BOOL, id))(v7 + 16))(*(void *)(a1 + 32), a2 == 2, v8);
  }
}

- (void)signOutFlowController:(id)a3 disableFindMyDeviceForAccount:(id)a4 completion:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(DKAccountProvider *)self findMyProvider];
  id v8 = [(DKAccountProvider *)self presentingViewController];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __84__DKAccountProvider_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke;
  v10[3] = &unk_264CF0C20;
  id v11 = v6;
  id v9 = v6;
  [v7 disableFindMyWithPresentingViewController:v8 completion:v10];
}

uint64_t __84__DKAccountProvider_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)signOutFlowController:(id)a3 signOutAccount:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(DKAccountProvider *)self accountStore];
  [v9 removeAccount:v8 withCompletionHandler:v7];
}

- (void)signOutFlowController:(id)a3 showAlertWithTitle:(id)a4 message:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(DKAccountProvider *)self presentingViewController];
  if (v12)
  {
    id v13 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v9 message:v10 preferredStyle:1];
    id v14 = (void *)MEMORY[0x263F1C3F0];
    id v15 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleAccountUI"];
    id v16 = [v15 localizedStringForKey:@"OK" value:&stru_26EAA9F58 table:@"Localizable"];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __81__DKAccountProvider_signOutFlowController_showAlertWithTitle_message_completion___block_invoke;
    v18[3] = &unk_264CF0C48;
    id v19 = v11;
    objc_super v17 = [v14 actionWithTitle:v16 style:0 handler:v18];
    [v13 addAction:v17];

    [v12 presentViewController:v13 animated:1 completion:0];
  }
  else
  {
    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
}

uint64_t __81__DKAccountProvider_signOutFlowController_showAlertWithTitle_message_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)accountsForAccountManager:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(DKAccountProvider *)self serviceOwnersManager];
  uint64_t v4 = *MEMORY[0x263F26D28];
  uint64_t v5 = [v3 accountForService:*MEMORY[0x263F26D28]];

  if (v5)
  {
    uint64_t v8 = v4;
    v9[0] = v5;
    id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFFA78];
  }

  return v6;
}

- (void)recoveryFactorController:(id)a3 didFinishAddingRecoveryContactWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(DKAccountProvider *)self pendingWalrusValidationCompletion];

  if (v6)
  {
    id v7 = [(DKAccountProvider *)self pendingWalrusValidationCompletion];
    uint64_t v8 = v7;
    if (v5)
    {
      id v9 = objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:underlyingError:", 0, v5);
      v8[2](v8, 0, v9);
    }
    else
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __86__DKAccountProvider_recoveryFactorController_didFinishAddingRecoveryContactWithError___block_invoke;
      v10[3] = &unk_264CF0B58;
      id v11 = v7;
      uint64_t v8 = v7;
      [(DKAccountProvider *)self _walrusStatusWithCompletion:v10];
    }
    [(DKAccountProvider *)self setPendingWalrusValidationCompletion:0];
    [(DKAccountProvider *)self setRecoveryFactorController:0];
  }
}

void __86__DKAccountProvider_recoveryFactorController_didFinishAddingRecoveryContactWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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

- (void)_addAccountDataForAccounts:(id)a3 toAccountsData:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v11 = [v8 firstObject];
    uint64_t v12 = objc_msgSend(v8, "subarrayWithRange:", 1, objc_msgSend(v8, "count") - 1);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __74__DKAccountProvider__addAccountDataForAccounts_toAccountsData_completion___block_invoke;
    v15[3] = &unk_264CF0C70;
    id v16 = v9;
    objc_super v17 = self;
    id v18 = v12;
    id v19 = v10;
    id v13 = v12;
    [(DKAccountProvider *)self _fetchAccountDataForAccount:v11 completion:v15];
  }
  else
  {
    id v14 = (void *)[v9 copy];
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }
}

uint64_t __74__DKAccountProvider__addAccountDataForAccounts_toAccountsData_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addObject:a2];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  return [v3 _addAccountDataForAccounts:v5 toAccountsData:v4 completion:v6];
}

- (void)_fetchAccountDataForAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x263F25D08]);
  id v9 = [(DKAccountProvider *)self accountStore];
  id v10 = (void *)[v8 initWithAppleAccount:v6 store:v9];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__DKAccountProvider__fetchAccountDataForAccount_completion___block_invoke;
  v13[3] = &unk_264CF0C98;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v10 fetchProfilePictureForAccountOwner:v13];
}

void __60__DKAccountProvider__fetchAccountDataForAccount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _DKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__DKAccountProvider__fetchAccountDataForAccount_completion___block_invoke_cold_1(v6, v7);
    }
  }
  id v8 = objc_msgSend(*(id *)(a1 + 32), "aa_formattedUsername");
  id v9 = objc_msgSend(*(id *)(a1 + 32), "aa_fullName");
  id v10 = [[DKNotableUserDataAccount alloc] initWithProfilePicture:v5 name:v8 username:v9];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_verifyAndRepairManateeWithPresentingViewController:(id)a3 completion:(id)a4
{
  id v6 = (void *)MEMORY[0x263F25C98];
  id v7 = a4;
  id v8 = a3;
  id v11 = [v6 contextWithType:6];
  [v11 setForceInlinePresentation:1];
  id v9 = [(DKAccountProvider *)self cachedLocalSecret];
  [v11 setCachedLocalSecret:v9];

  id v10 = (void *)[objc_alloc(MEMORY[0x263F25CF0]) initWithFlowContext:v11 withPresentingViewController:v8];
  [v10 verifyAndRepairManateeWithCompletion:v7];
}

- (AAUIRecoveryFactorController)recoveryFactorController
{
  recoveryFactorController = self->_recoveryFactorController;
  if (!recoveryFactorController)
  {
    uint64_t v4 = [(DKAccountProvider *)self presentingViewController];
    id v5 = [v4 navigationController];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [(DKAccountProvider *)self presentingViewController];
    }
    id v8 = v7;

    id v9 = objc_alloc(MEMORY[0x263F25D20]);
    id v10 = [(DKAccountProvider *)self accountManager];
    id v11 = (AAUIRecoveryFactorController *)[v9 initWithAccountManager:v10 presentingViewController:v8];
    id v12 = self->_recoveryFactorController;
    self->_recoveryFactorController = v11;

    [(AAUIRecoveryFactorController *)self->_recoveryFactorController setDelegate:self];
    objc_opt_class();
    [(AAUIRecoveryFactorController *)self->_recoveryFactorController setForceInlinePresentation:objc_opt_isKindOfClass() & 1];

    recoveryFactorController = self->_recoveryFactorController;
  }
  return recoveryFactorController;
}

- (void)_walrusStatusWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(DKAccountProvider *)self walrusStateController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__DKAccountProvider__walrusStatusWithCompletion___block_invoke;
  v7[3] = &unk_264CF0B58;
  id v8 = v4;
  id v6 = v4;
  [v5 walrusStatusWithCompletion:v7];
}

void __49__DKAccountProvider__walrusStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = _DKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __49__DKAccountProvider__walrusStatusWithCompletion___block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (!a2 && objc_msgSend(v5, "cdp_isCDPErrorWithCode:", -5102))
  {
    id v13 = _DKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_237B3F000, v13, OS_LOG_TYPE_DEFAULT, "Received unknown walrus status due to no primary Apple account, treating as disabled.", v14, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_performLastDeviceCheckWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__DKAccountProvider__performLastDeviceCheckWithCompletion___block_invoke;
  v6[3] = &unk_264CF0CC0;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(DKAccountProvider *)self _determineEligibilityWithCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __59__DKAccountProvider__performLastDeviceCheckWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (a2 && WeakRetained) {
    [WeakRetained _presentLastDeviceAlertWithCompletion:*(void *)(a1 + 32)];
  }
  else {
    (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v7 == 0);
  }
}

- (void)_determineEligibilityWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F34328] sharedInstance];
  id v5 = [v4 contextForPrimaryAccount];

  id v6 = objc_alloc_init(MEMORY[0x263F343F0]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__DKAccountProvider__determineEligibilityWithCompletion___block_invoke;
  v8[3] = &unk_264CF0CE8;
  id v9 = v3;
  id v7 = v3;
  [v6 fetchEscrowRecordDevicesWithContext:v5 usingCache:0 completion:v8];
}

void __57__DKAccountProvider__determineEligibilityWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count] == 1
    && ([v5 firstObject],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isCurrentDevice],
        v7,
        v8))
  {
    id v9 = _DKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_237B3F000, v9, OS_LOG_TYPE_DEFAULT, "Current device is determined to be the last escrow device for primary account.", buf, 2u);
    }

    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    uint64_t v11 = _DKLogSystem();
    uint64_t v12 = v11;
    if (v6)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __57__DKAccountProvider__determineEligibilityWithCompletion___block_invoke_cold_1((uint64_t)v6, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_237B3F000, v12, OS_LOG_TYPE_DEFAULT, "Determined that the current device is not the last escrow device for the primary account.", v19, 2u);
    }

    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v10();
}

- (void)_presentLastDeviceAlertWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(DKAccountProvider *)self recoveryFactorController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__DKAccountProvider__presentLastDeviceAlertWithCompletion___block_invoke;
  v7[3] = &unk_264CF0BF8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 availableRecoveryFactorsWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __59__DKAccountProvider__presentLastDeviceAlertWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (v5 || !WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__DKAccountProvider__presentLastDeviceAlertWithCompletion___block_invoke_2;
    block[3] = &unk_264CF0D10;
    id v9 = WeakRetained;
    uint64_t v11 = a2;
    id v10 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __59__DKAccountProvider__presentLastDeviceAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentLastDeviceAlertWithRecoveryFactors:*(void *)(a1 + 48) withCompletion:*(void *)(a1 + 40)];
}

- (void)_presentLastDeviceAlertWithRecoveryFactors:(unint64_t)a3 withCompletion:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  id v7 = _DKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[DKAccountProvider _presentLastDeviceAlertWithRecoveryFactors:withCompletion:](v7);
  }

  unint64_t v35 = (unint64_t)(v4 & 4) >> 2;
  id v8 = @"CONTACT";
  if ((v4 & 4) != 0) {
    id v8 = @"KEY";
  }
  id v9 = NSString;
  id v10 = v8;
  v40 = [v9 stringWithFormat:@"SIGN_OUT_LAST_DEVICE_RECOVERY_%@_TITLE", v10];
  v39 = [NSString stringWithFormat:@"SIGN_OUT_ADD_RECOVERY_%@_BUTTON", v10];
  v38 = [NSString stringWithFormat:@"ERASE_LAST_DEVICE_RECOVERY_%@_MESSAGE", v10];

  uint64_t v11 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleAccountUI"];
  v37 = [v11 localizedStringForKey:v40 value:&stru_26EAA9F58 table:@"Localizable-Walrus"];

  uint64_t v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleAccountUI"];
  v34 = [v12 localizedStringForKey:v39 value:&stru_26EAA9F58 table:@"Localizable-Walrus"];

  uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v36 = [v13 localizedStringForKey:v38 value:&stru_26EAA9F58 table:@"Localizable-Walrus"];

  uint64_t v14 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v37 message:v36 preferredStyle:1];
  uint64_t v15 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v17 = [v16 localizedStringForKey:@"CONTINUE" value:&stru_26EAA9F58 table:@"Localizable"];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __79__DKAccountProvider__presentLastDeviceAlertWithRecoveryFactors_withCompletion___block_invoke;
  v48[3] = &unk_264CF0C48;
  id v18 = v6;
  id v49 = v18;
  id v19 = [v15 actionWithTitle:v17 style:2 handler:v48];
  [v14 addAction:v19];

  v20 = (void *)MEMORY[0x263F1C3F0];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __79__DKAccountProvider__presentLastDeviceAlertWithRecoveryFactors_withCompletion___block_invoke_2;
  v45[3] = &unk_264CF0D60;
  char v47 = v35;
  v45[4] = self;
  id v21 = v18;
  id v46 = v21;
  v22 = [v20 actionWithTitle:v34 style:0 handler:v45];
  [v14 addAction:v22];

  v23 = (void *)MEMORY[0x263F1C3F0];
  v24 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleAccountUI"];
  v25 = [v24 localizedStringForKey:@"SIGN_OUT_ADD_DATA_RECOVERY_SERVICE_BUTTON" value:&stru_26EAA9F58 table:@"Localizable-Walrus"];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __79__DKAccountProvider__presentLastDeviceAlertWithRecoveryFactors_withCompletion___block_invoke_4;
  v43[3] = &unk_264CF0D88;
  v43[4] = self;
  id v26 = v21;
  id v44 = v26;
  v27 = [v23 actionWithTitle:v25 style:0 handler:v43];
  [v14 addAction:v27];

  v28 = (void *)MEMORY[0x263F1C3F0];
  v29 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleAccountUI"];
  v30 = [v29 localizedStringForKey:@"SIGN_OUT_CANCEL_BUTTON" value:&stru_26EAA9F58 table:@"Localizable-Walrus"];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __79__DKAccountProvider__presentLastDeviceAlertWithRecoveryFactors_withCompletion___block_invoke_5;
  v41[3] = &unk_264CF0C48;
  id v42 = v26;
  id v31 = v26;
  v32 = [v28 actionWithTitle:v30 style:1 handler:v41];
  [v14 addAction:v32];

  v33 = [(DKAccountProvider *)self presentingViewController];
  [v33 presentViewController:v14 animated:1 completion:0];
}

uint64_t __79__DKAccountProvider__presentLastDeviceAlertWithRecoveryFactors_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__DKAccountProvider__presentLastDeviceAlertWithRecoveryFactors_withCompletion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = [*(id *)(a1 + 32) recoveryFactorController];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __79__DKAccountProvider__presentLastDeviceAlertWithRecoveryFactors_withCompletion___block_invoke_3;
    v4[3] = &unk_264CF0D38;
    id v5 = *(id *)(a1 + 40);
    [v2 generateRecoveryKeyWithCompletion:v4];
  }
  else
  {
    [*(id *)(a1 + 32) setPendingWalrusValidationCompletion:*(void *)(a1 + 40)];
    id v3 = [*(id *)(a1 + 32) recoveryFactorController];
    [v3 startAddingRecoveryContact];
  }
}

void __79__DKAccountProvider__presentLastDeviceAlertWithRecoveryFactors_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
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
    char v4 = *(void (**)(uint64_t))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5);
  }
}

void __79__DKAccountProvider__presentLastDeviceAlertWithRecoveryFactors_withCompletion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setPendingWalrusValidationCompletion:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) recoveryFactorController];
  [v2 startAddingDataRecoveryService];
}

void __79__DKAccountProvider__presentLastDeviceAlertWithRecoveryFactors_withCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (DKFindMyProvider)findMyProvider
{
  return self->_findMyProvider;
}

- (void)setFindMyProvider:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (AIDAServiceOwnerProtocol)serviceOwnersManager
{
  return self->_serviceOwnersManager;
}

- (void)setServiceOwnersManager:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (CDPLocalSecret)cachedLocalSecret
{
  return self->_cachedLocalSecret;
}

- (void)setCachedLocalSecret:(id)a3
{
}

- (CDPWalrusStateController)walrusStateController
{
  return self->_walrusStateController;
}

- (void)setWalrusStateController:(id)a3
{
}

- (void)setRecoveryFactorController:(id)a3
{
}

- (id)pendingWalrusValidationCompletion
{
  return self->_pendingWalrusValidationCompletion;
}

- (void)setPendingWalrusValidationCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingWalrusValidationCompletion, 0);
  objc_storeStrong((id *)&self->_recoveryFactorController, 0);
  objc_storeStrong((id *)&self->_walrusStateController, 0);
  objc_storeStrong((id *)&self->_cachedLocalSecret, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_findMyProvider, 0);
}

void __97__DKAccountProvider_preparePrimaryAppleAccountForSignOutWithPresentingViewController_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60__DKAccountProvider__fetchAccountDataForAccount_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = _DKIsInternalInstall();
  if ((v5 & 1) == 0)
  {
    id v6 = NSString;
    id v2 = [a1 domain];
    a1 = [v6 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(a1, "code")];
  }
  *(_DWORD *)buf = 138543362;
  id v8 = a1;
  _os_log_error_impl(&dword_237B3F000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch profile image: %{public}@", buf, 0xCu);
  if (!v5)
  {
  }
}

void __49__DKAccountProvider__walrusStatusWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __57__DKAccountProvider__determineEligibilityWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_presentLastDeviceAlertWithRecoveryFactors:(os_log_t)log withCompletion:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_237B3F000, log, OS_LOG_TYPE_DEBUG, "Presenting warning to walrus user for signing out of last circle device", v1, 2u);
}

@end