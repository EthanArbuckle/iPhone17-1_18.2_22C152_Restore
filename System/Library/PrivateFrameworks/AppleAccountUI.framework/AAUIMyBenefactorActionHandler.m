@interface AAUIMyBenefactorActionHandler
- (AAUIMyBenefactorActionHandler)initWithAccountManager:(id)a3 localContact:(id)a4;
- (void)_navigateToAccessKeyScreenFromViewController:(id)a3;
- (void)_popViewController:(id)a3;
- (void)_showAlert:(id)a3;
- (void)_showAuthPromptInViewController:(id)a3;
- (void)_startSpinnerInSpecifier:(id)a3;
- (void)_stopAllSpinners;
- (void)doDestructiveAction:(id)a3 specifier:(id)a4;
- (void)doPrimaryAction:(id)a3 specifier:(id)a4;
- (void)doSecondaryAction:(id)a3 specifier:(id)a4;
- (void)remoteUIRequestComplete:(id)a3 error:(id)a4;
@end

@implementation AAUIMyBenefactorActionHandler

- (AAUIMyBenefactorActionHandler)initWithAccountManager:(id)a3 localContact:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AAUIMyBenefactorActionHandler;
  v9 = [(AAUIMyBenefactorActionHandler *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeStrong((id *)&v10->_contact, a4);
    v11 = objc_alloc_init(AAUISpinnerManager);
    spinnerManager = v10->_spinnerManager;
    v10->_spinnerManager = v11;
  }
  return v10;
}

- (void)doDestructiveAction:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  id v7 = [(AALocalContactInfo *)self->_contact inheritanceContactInfo];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__AAUIMyBenefactorActionHandler_doDestructiveAction_specifier___block_invoke;
  v9[3] = &unk_263F933C8;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v6 removeBenefactor:v7 completion:v9];
}

void __63__AAUIMyBenefactorActionHandler_doDestructiveAction_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _AAUILogSystem();
  id v5 = v4;
  if (!v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __63__AAUIMyBenefactorActionHandler_doDestructiveAction_specifier___block_invoke_cold_1(v5);
    }

    v13 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    goto LABEL_9;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__AAUIMyBenefactorActionHandler_doDestructiveAction_specifier___block_invoke_cold_2((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }

  uint64_t v12 = [v3 code];
  v13 = *(void **)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  if (v12 != 2113)
  {
LABEL_9:
    [v13 _popViewController:v14];
    goto LABEL_10;
  }
  [v13 _showAlert:v14];
LABEL_10:
}

- (void)_popViewController:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__AAUIMyBenefactorActionHandler__popViewController___block_invoke;
  block[3] = &unk_263F92168;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __52__AAUIMyBenefactorActionHandler__popViewController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popViewControllerAnimated:1];
}

- (void)_showAlert:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x263F82418];
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"LEGACY_CONTACT_DELETION_FAILURE_ALERT_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"LEGACY_CONTACT_DELETION_FAILURE_ALERT_MESSAGE" value:&stru_26BD39CD8 table:@"Localizable"];
  uint64_t v9 = [v4 alertWithTitle:v6 message:v8];

  uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v11 = [v10 localizedStringForKey:@"OK" value:&stru_26BD39CD8 table:@"Localizable"];

  uint64_t v12 = (void *)MEMORY[0x263F82400];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __44__AAUIMyBenefactorActionHandler__showAlert___block_invoke;
  v20[3] = &unk_263F927A8;
  id v13 = v3;
  id v21 = v13;
  uint64_t v14 = [v12 actionWithTitle:v11 style:0 handler:v20];
  [v9 addAction:v14];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__AAUIMyBenefactorActionHandler__showAlert___block_invoke_3;
  block[3] = &unk_263F926B8;
  id v18 = v13;
  id v19 = v9;
  id v15 = v9;
  id v16 = v13;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __44__AAUIMyBenefactorActionHandler__showAlert___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__AAUIMyBenefactorActionHandler__showAlert___block_invoke_2;
  block[3] = &unk_263F92168;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __44__AAUIMyBenefactorActionHandler__showAlert___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popViewControllerAnimated:1];
}

uint64_t __44__AAUIMyBenefactorActionHandler__showAlert___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)doPrimaryAction:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  [(AAUIMyBenefactorActionHandler *)self _startSpinnerInSpecifier:a4];
  [(AAUIMyBenefactorActionHandler *)self _showAuthPromptInViewController:v6];
}

- (void)_showAuthPromptInViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(AIDAAccountManager *)self->_accountManager accounts];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  uint64_t v7 = objc_opt_new();
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__AAUIMyBenefactorActionHandler__showAuthPromptInViewController___block_invoke;
  v9[3] = &unk_263F933F0;
  objc_copyWeak(&v11, &location);
  id v8 = v4;
  id v10 = v8;
  objc_msgSend(v7, "aaui_authenticateAccount:forceInteraction:presentingViewController:completion:", v6, 1, v8, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __65__AAUIMyBenefactorActionHandler__showAuthPromptInViewController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _stopAllSpinners];
    id v8 = _AAUILogSystem();
    uint64_t v9 = v8;
    if (!a2 || v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __65__AAUIMyBenefactorActionHandler__showAuthPromptInViewController___block_invoke_cold_1((uint64_t)v5, v9, v10, v11, v12, v13, v14, v15);
      }
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Authentication successful, continuing to show Access Key...", buf, 2u);
      }

      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __65__AAUIMyBenefactorActionHandler__showAuthPromptInViewController___block_invoke_54;
      v16[3] = &unk_263F926B8;
      v16[4] = v7;
      id v17 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x263EF83A0], v16);
    }
  }
}

uint64_t __65__AAUIMyBenefactorActionHandler__showAuthPromptInViewController___block_invoke_54(uint64_t a1)
{
  return [*(id *)(a1 + 32) _navigateToAccessKeyScreenFromViewController:*(void *)(a1 + 40)];
}

- (void)_navigateToAccessKeyScreenFromViewController:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F25880];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [(AALocalContactInfo *)self->_contact inheritanceContactInfo];
  id v15 = (id)objc_msgSend(v6, "initWithContactInfo:contactType:", v7, -[AALocalContactInfo contactType](self->_contact, "contactType"));

  id v8 = [v15 accessKeyString];
  uint64_t v9 = [v15 accessKeyQRCodeImageDataWithSize:155.0];
  uint64_t v10 = [MEMORY[0x263F827E8] imageWithData:v9];
  uint64_t v11 = [(AIDAAccountManager *)self->_accountManager accounts];
  uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  uint64_t v13 = [[AAUIShowAccessKeyViewController alloc] initWithAppleAccount:v12 localContactInfo:self->_contact accessKey:v8 accessKeyQRCodeImage:v10];
  uint64_t v14 = [v5 navigationController];

  [v14 showViewController:v13 sender:0];
}

- (void)doSecondaryAction:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Request Access Tapped. Beginning Beneficiary Claim RUI...", buf, 2u);
  }

  id v9 = objc_alloc(MEMORY[0x263F25880]);
  uint64_t v10 = [(AALocalContactInfo *)self->_contact inheritanceContactInfo];
  uint64_t v11 = objc_msgSend(v9, "initWithContactInfo:contactType:", v10, -[AALocalContactInfo contactType](self->_contact, "contactType"));

  uint64_t v12 = [(AIDAAccountManager *)self->_accountManager accountStore];
  uint64_t v13 = [(AIDAAccountManager *)self->_accountManager accounts];
  uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  if (v14)
  {
    id v15 = objc_msgSend(v12, "aida_accountForiCloudAccount:", v14);
    if (v15)
    {
      id v16 = objc_alloc(MEMORY[0x263F257A0]);
      id v17 = [v11 claimTokenString];
      id v18 = [v16 initWithGrandSlamAccount:v15 accountStore:v12 claimCode:v17];

      [(AAUIMyBenefactorActionHandler *)self _startSpinnerInSpecifier:v7];
      id v19 = _AAUILogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_209754000, v19, OS_LOG_TYPE_DEFAULT, "Presenting Beneficiary Claim RUI...", v24, 2u);
      }

      v20 = [[AAUIGrandSlamRemoteUIPresenter alloc] initWithAccountManager:self->_accountManager presenter:v6];
      remoteUIPresenter = self->_remoteUIPresenter;
      self->_remoteUIPresenter = v20;

      [(AAUIGrandSlamRemoteUIPresenter *)self->_remoteUIPresenter setDelegate:self];
      v22 = self->_remoteUIPresenter;
      v23 = [v18 urlRequest];
      [(AAUIGrandSlamRemoteUIPresenter *)v22 loadRequest:v23];
    }
    else
    {
      id v18 = _AAUILogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[AAUIMyBenefactorActionHandler doSecondaryAction:specifier:](v18);
      }
    }
  }
  else
  {
    id v15 = _AAUILogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[AAUIMyBenefactorActionHandler doSecondaryAction:specifier:](v15);
    }
  }
}

- (void)_startSpinnerInSpecifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__AAUIMyBenefactorActionHandler__startSpinnerInSpecifier___block_invoke;
  block[3] = &unk_263F92668;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __58__AAUIMyBenefactorActionHandler__startSpinnerInSpecifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = (void *)WeakRetained[3];
    id v4 = *(void **)(a1 + 32);
    id v6 = WeakRetained;
    id v5 = [v4 identifier];
    [v3 startSpinnerInSpecifier:v4 forKey:v5];

    id WeakRetained = v6;
  }
}

- (void)_stopAllSpinners
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __49__AAUIMyBenefactorActionHandler__stopAllSpinners__block_invoke;
  v2[3] = &unk_263F92AB8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __49__AAUIMyBenefactorActionHandler__stopAllSpinners__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[3] stopAllSpinners];
    id WeakRetained = v2;
  }
}

- (void)remoteUIRequestComplete:(id)a3 error:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AAUIMyBenefactorActionHandler remoteUIRequestComplete:error:]((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  [(AAUIMyBenefactorActionHandler *)self _stopAllSpinners];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteUIPresenter, 0);
  objc_storeStrong((id *)&self->_spinnerManager, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

void __63__AAUIMyBenefactorActionHandler_doDestructiveAction_specifier___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_209754000, log, OS_LOG_TYPE_DEBUG, "Successfully removed Benefactor", v1, 2u);
}

void __63__AAUIMyBenefactorActionHandler_doDestructiveAction_specifier___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __65__AAUIMyBenefactorActionHandler__showAuthPromptInViewController___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)doSecondaryAction:(os_log_t)log specifier:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "Could not fetch Apple Account", v1, 2u);
}

- (void)doSecondaryAction:(os_log_t)log specifier:.cold.2(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "Could not fetch GrandSlam Account", v1, 2u);
}

- (void)remoteUIRequestComplete:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end