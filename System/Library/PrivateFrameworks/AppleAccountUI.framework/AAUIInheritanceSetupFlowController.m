@interface AAUIInheritanceSetupFlowController
- (AAUIInheritanceSetupFlowController)initWithAccount:(id)a3;
- (AAUIInheritanceSetupFlowController)initWithAccount:(id)a3 navigationController:(id)a4;
- (UINavigationController)navigationController;
- (id)_doneButton;
- (void)_beginAddBeneficiaryFlow;
- (void)_dismiss;
- (void)_dismissAndNavigateToDateOfBirthSettings;
- (void)_fetchSuggestedContacts;
- (void)_setupBeneficiary;
- (void)_showAlertWithTitle:(id)a3 message:(id)a4;
- (void)_showContactSelector:(id)a3;
- (void)_showDefaultContactPicker;
- (void)_showDefaultContactPickerWithCancel;
- (void)_showIntro;
- (void)_showPrintPreview;
- (void)_showSetupCompleteWithShareTypePrint;
- (void)_showShareAccessKey;
- (void)_showShareData;
- (void)_startInviteMessageFlow;
- (void)_validateAccountWithCompletion:(id)a3;
- (void)_verifyCDPWithCompletion:(id)a3;
- (void)accountContactSelector:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)inheritanceDidSelectSharingOption:(unint64_t)a3;
- (void)inviteMessageWasSent:(id)a3 completion:(id)a4;
- (void)setNavigationController:(id)a3;
@end

@implementation AAUIInheritanceSetupFlowController

- (AAUIInheritanceSetupFlowController)initWithAccount:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(AAUIInheritanceSetupFlowController *)self initWithAccount:v4 navigationController:v5];

  return v6;
}

- (AAUIInheritanceSetupFlowController)initWithAccount:(id)a3 navigationController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AAUIInheritanceSetupFlowController;
  v9 = [(AAUIInheritanceSetupFlowController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_navigationController, a4);
    objc_storeStrong((id *)&v10->_appleAccount, a3);
    uint64_t v11 = objc_opt_new();
    contactsProvider = v10->_contactsProvider;
    v10->_contactsProvider = (AAUIContactsProvider *)v11;
  }
  return v10;
}

- (void)_showIntro
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    int v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "%@ : Showing Intro...", (uint8_t *)&v12, 0xCu);
  }
  v6 = objc_alloc_init(AAUIOBInheritanceIntroViewModel);
  id v7 = [[AAUIOBWelcomeController alloc] initWithViewModel:v6];
  firstTimeSetupVC = self->_firstTimeSetupVC;
  self->_firstTimeSetupVC = v7;

  v9 = [(AAUIOBWelcomeController *)self->_firstTimeSetupVC primaryButton];
  [v9 addTarget:self action:sel__beginAddBeneficiaryFlow forControlEvents:64];

  v10 = [(AAUIOBWelcomeController *)self->_firstTimeSetupVC secondaryButton];
  [v10 addTarget:self action:sel__dismiss forControlEvents:64];

  uint64_t v11 = [(AAUIInheritanceSetupFlowController *)self navigationController];
  [v11 showViewController:self->_firstTimeSetupVC sender:0];
}

- (void)_beginAddBeneficiaryFlow
{
  v3 = [(AAUIOBWelcomeController *)self->_firstTimeSetupVC primaryButton];
  [v3 setEnabled:0];

  [(UINavigationController *)self->_navigationController aaui_showActivityIndicator];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__AAUIInheritanceSetupFlowController__beginAddBeneficiaryFlow__block_invoke;
  v4[3] = &unk_263F93B20;
  objc_copyWeak(&v5, &location);
  [(AAUIInheritanceSetupFlowController *)self _validateAccountWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __62__AAUIInheritanceSetupFlowController__beginAddBeneficiaryFlow__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    id v4 = WeakRetained;
    [WeakRetained _fetchSuggestedContacts];
  }
  else
  {
    if (WeakRetained)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __62__AAUIInheritanceSetupFlowController__beginAddBeneficiaryFlow__block_invoke_2;
      block[3] = &unk_263F92168;
      block[4] = WeakRetained;
      id v5 = WeakRetained;
      dispatch_async(MEMORY[0x263EF83A0], block);
      id WeakRetained = v5;
    }
  }
}

void __62__AAUIInheritanceSetupFlowController__beginAddBeneficiaryFlow__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 48) primaryButton];
  [v1 setEnabled:1];
}

- (void)_validateAccountWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "%@ : Showing Interactive Auth Prompt...", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v8 = objc_opt_new();
  appleAccount = self->_appleAccount;
  v10 = [(AAUIInheritanceSetupFlowController *)self navigationController];
  uint64_t v11 = [v10 topViewController];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__AAUIInheritanceSetupFlowController__validateAccountWithCompletion___block_invoke;
  v13[3] = &unk_263F93B48;
  objc_copyWeak(&v15, (id *)buf);
  v13[4] = self;
  id v12 = v4;
  id v14 = v12;
  objc_msgSend(v8, "aaui_beneficiaryAuthForAccount:presentingViewController:completion:", appleAccount, v11, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __69__AAUIInheritanceSetupFlowController__validateAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!v5 || v6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__AAUIInheritanceSetupFlowController__validateAccountWithCompletion___block_invoke_2;
    block[3] = &unk_263F92DA0;
    block[4] = *(void *)(a1 + 32);
    id v15 = v6;
    id v16 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v10;
      _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "%@ : Authentication successful, continue setup...", buf, 0xCu);
    }
    uint64_t v11 = [v5 objectForKeyedSubscript:*MEMORY[0x263F28FC8]];
    id v12 = (void *)WeakRetained[5];
    WeakRetained[5] = v11;

    id v13 = objc_loadWeakRetained((id *)(a1 + 48));
    [v13 _verifyCDPWithCompletion:*(void *)(a1 + 40)];
  }
}

uint64_t __69__AAUIInheritanceSetupFlowController__validateAccountWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "aaui_hideActivityIndicator");
  uint64_t v2 = [*(id *)(a1 + 40) code];
  v3 = _AAUILogSystem();
  id v4 = v3;
  if (v2 == -7003)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      int v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "%@ : User canceled auth", (uint8_t *)&v9, 0xCu);
    }
    id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __69__AAUIInheritanceSetupFlowController__validateAccountWithCompletion___block_invoke_2_cold_1();
    }

    id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }
  return v7();
}

- (void)_verifyCDPWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [[AAUID2DEncryptionFlowContext alloc] initWithType:3];
  id v6 = [AAUIManateeStateValidator alloc];
  id v7 = [(AAUIInheritanceSetupFlowController *)self navigationController];
  id v8 = [(AAUIManateeStateValidator *)v6 initWithFlowContext:v5 withPresentingViewController:v7];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__AAUIInheritanceSetupFlowController__verifyCDPWithCompletion___block_invoke;
  v11[3] = &unk_263F93178;
  id v12 = v8;
  id v13 = v4;
  id v9 = v4;
  v10 = v8;
  [(AAUIManateeStateValidator *)v10 verifyAndRepairManateeWithCompletion:v11];
}

uint64_t __63__AAUIInheritanceSetupFlowController__verifyCDPWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_fetchSuggestedContacts
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "%@ : Fetching suggested contacts...", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  [(UINavigationController *)self->_navigationController aaui_showActivityIndicator];
  contactsProvider = self->_contactsProvider;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__AAUIInheritanceSetupFlowController__fetchSuggestedContacts__block_invoke;
  v7[3] = &unk_263F93B98;
  v7[4] = self;
  objc_copyWeak(&v8, (id *)buf);
  [(AAUIContactsProvider *)contactsProvider fetchSuggestedBeneficiariesWithImagesOfSize:v7 andCompletion:16.0];
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __61__AAUIInheritanceSetupFlowController__fetchSuggestedContacts__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__AAUIInheritanceSetupFlowController__fetchSuggestedContacts__block_invoke_2;
  block[3] = &unk_263F93B70;
  block[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v7);
}

void __61__AAUIInheritanceSetupFlowController__fetchSuggestedContacts__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "aaui_hideActivityIndicator");
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) primaryButton];
  [v2 setEnabled:1];

  uint64_t v3 = [*(id *)(a1 + 40) count];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (v3) {
    [WeakRetained _showContactSelector:*(void *)(a1 + 40)];
  }
  else {
    [WeakRetained _showDefaultContactPickerWithCancel];
  }
}

- (void)_showContactSelector:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v13 = 138412290;
    id v14 = v7;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "%@ : Showing Trusted/Family Contacts Picker...", (uint8_t *)&v13, 0xCu);
  }
  id v8 = [[AAUIOBContactSelectorViewModel alloc] initWithFlow:1];
  [(AAUIOBContactSelectorViewModel *)v8 setSuggestedContacts:v4];

  id v9 = [[AAUIAccountContactSelectorViewController alloc] initWithViewModel:v8];
  [(AAUIOBTableWelcomeController *)v9 setDelegate:self];
  v10 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__dismiss];
  uint64_t v11 = [(OBBaseWelcomeController *)v9 navigationItem];
  [v11 setLeftBarButtonItem:v10];

  id v12 = [(AAUIInheritanceSetupFlowController *)self navigationController];
  [v12 showViewController:v9 sender:0];
}

- (void)_showDefaultContactPicker
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "%@ : Showing Default Contacts Picker...", (uint8_t *)&v8, 0xCu);
  }
  id v6 = objc_opt_new();
  [v6 setDelegate:self];
  id v7 = [(AAUIInheritanceSetupFlowController *)self navigationController];
  [v7 presentViewController:v6 animated:1 completion:0];
}

- (void)_showDefaultContactPickerWithCancel
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    int v10 = 138412290;
    uint64_t v11 = v5;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "%@ : Showing Default Contacts Picker...", (uint8_t *)&v10, 0xCu);
  }
  id v6 = objc_opt_new();
  [v6 setDelegate:self];
  id v7 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__dismiss];
  int v8 = [v6 navigationItem];
  [v8 setLeftBarButtonItem:v7];

  id v9 = [(AAUIInheritanceSetupFlowController *)self navigationController];
  [v9 presentViewController:v6 animated:1 completion:0];
}

- (void)_showShareData
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    int v13 = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "%@ : Showing Share Data Priming Step...", (uint8_t *)&v13, 0xCu);
  }
  id v6 = [AAUIOBInheritanceShareDataViewModel alloc];
  id v7 = [(AALocalContactInfo *)self->_selectedContact firstName];
  int v8 = [(AAUIOBInheritanceShareDataViewModel *)v6 initWithBeneficiaryName:v7];

  id v9 = [[AAUIOBWelcomeController alloc] initWithViewModel:v8];
  shareDataVC = self->_shareDataVC;
  self->_shareDataVC = v9;

  uint64_t v11 = [(AAUIOBWelcomeController *)self->_shareDataVC primaryButton];
  [v11 addTarget:self action:sel__shareDataDidContinue forEvents:64];

  uint64_t v12 = [(AAUIInheritanceSetupFlowController *)self navigationController];
  [v12 showViewController:self->_shareDataVC sender:0];
}

- (void)_showShareAccessKey
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    int v13 = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "%@ : Showing Share Access Key Options...", (uint8_t *)&v13, 0xCu);
  }
  id v6 = [AAUIInheritanceShareAccessKeyOptionsViewController alloc];
  id v7 = [(AALocalContactInfo *)self->_selectedContact firstName];
  int v8 = [(AALocalContactInfo *)self->_selectedContact handle];
  id v9 = [(AAUIInheritanceShareAccessKeyOptionsViewController *)v6 initWithBeneficiaryName:v7 handle:v8];
  shareAccessKeyOptionsViewController = self->_shareAccessKeyOptionsViewController;
  self->_shareAccessKeyOptionsViewController = v9;

  [(AAUIInheritanceShareAccessKeyOptionsViewController *)self->_shareAccessKeyOptionsViewController setFlowDelegate:self];
  uint64_t v11 = [(OBBaseWelcomeController *)self->_shareAccessKeyOptionsViewController navigationItem];
  [v11 setHidesBackButton:1];

  uint64_t v12 = [(AAUIInheritanceSetupFlowController *)self navigationController];
  [v12 showViewController:self->_shareAccessKeyOptionsViewController sender:0];
}

- (void)_showPrintPreview
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    id v16 = v5;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "%@ : Showing Print Preview...", buf, 0xCu);
  }
  [(AALocalContactInfo *)self->_selectedContact setInheritanceContactInfo:self->_selectedBeneficiary];
  id v6 = [[AAUIInheritanceAccessKeyPDFGenerator alloc] initWithAppleAccount:self->_appleAccount localContactInfo:self->_selectedContact];
  id v7 = [(AAUIInheritanceAccessKeyPDFGenerator *)v6 createPDFDocumentData];
  if ([MEMORY[0x263F61090] canPrintData:v7])
  {
    int v8 = [MEMORY[0x263F61088] printInfo];
    id v9 = NSString;
    int v10 = [(AALocalContactInfo *)self->_selectedContact firstName];
    uint64_t v11 = [MEMORY[0x263F259B0] printAccessKeyDocumentTitle];
    uint64_t v12 = [v9 stringWithFormat:@"%@ - %@", v10, v11];
    [v8 setJobName:v12];

    [v8 setOrientation:0];
    [v8 setOutputType:2];
    int v13 = [MEMORY[0x263F61090] sharedPrintController];
    [v13 setPrintInfo:v8];
    [v13 setShowsNumberOfCopies:1];
    [v13 setPrintingItem:v7];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __55__AAUIInheritanceSetupFlowController__showPrintPreview__block_invoke;
    v14[3] = &unk_263F92D78;
    v14[4] = self;
    [v13 presentAnimated:1 completionHandler:v14];
  }
}

void __55__AAUIInheritanceSetupFlowController__showPrintPreview__block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    id v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Error presenting printInteractionController - %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__AAUIInheritanceSetupFlowController__showPrintPreview__block_invoke_82;
    block[3] = &unk_263F926B8;
    block[4] = *(void *)(a1 + 32);
    id v15 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
    int v10 = v15;
    goto LABEL_8;
  }
  if (!a3)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __55__AAUIInheritanceSetupFlowController__showPrintPreview__block_invoke_3;
    v11[3] = &unk_263F926B8;
    void v11[4] = *(void *)(a1 + 32);
    id v12 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v11);
    int v10 = v12;
LABEL_8:

    goto LABEL_9;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__AAUIInheritanceSetupFlowController__showPrintPreview__block_invoke_2;
  v13[3] = &unk_263F92168;
  v13[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v13);
LABEL_9:
}

void __55__AAUIInheritanceSetupFlowController__showPrintPreview__block_invoke_82(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) localizedDescription];
  [v1 _showAlertWithTitle:0 message:v2];
}

uint64_t __55__AAUIInheritanceSetupFlowController__showPrintPreview__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showSetupCompleteWithShareTypePrint];
}

uint64_t __55__AAUIInheritanceSetupFlowController__showPrintPreview__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 72) navigationItem];
  uint64_t v3 = [*(id *)(a1 + 32) _doneButton];
  [v2 setRightBarButtonItem:v3 animated:1];

  id v4 = *(void **)(a1 + 40);
  return [v4 dismissAnimated:1];
}

- (void)_startInviteMessageFlow
{
  [*a1 isFamilyMember];
  OUTLINED_FUNCTION_3_0(&dword_209754000, v1, v2, "LCInvite: Initialing LC Invite Message view based on receiver isFamilyMember: %d", v3, v4, v5, v6, 0);
}

- (void)_showSetupCompleteWithShareTypePrint
{
  uint64_t v3 = [AAUIOBInheritanceSetupCompleteViewModel alloc];
  uint64_t v4 = [(AALocalContactInfo *)self->_selectedContact displayName];
  int v10 = [(AAUIOBInheritanceSetupCompleteViewModel *)v3 initWithBeneficiaryName:v4 accessKeyShareType:1];

  uint64_t v5 = [[AAUIOBWelcomeController alloc] initWithViewModel:v10];
  uint64_t v6 = [(AAUIOBWelcomeController *)v5 primaryButton];
  [v6 addTarget:self action:sel__dismiss forControlEvents:64];

  id v7 = [(AAUIOBWelcomeController *)v5 secondaryButton];
  [v7 addTarget:self action:sel__dismissAndNavigateToDateOfBirthSettings forControlEvents:64];

  id v8 = [(OBBaseWelcomeController *)v5 navigationItem];
  [v8 setHidesBackButton:1];

  id v9 = [(AAUIInheritanceSetupFlowController *)self navigationController];
  [v9 showViewController:v5 sender:0];
}

- (void)_dismiss
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__AAUIInheritanceSetupFlowController__dismiss__block_invoke;
  block[3] = &unk_263F92168;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __46__AAUIInheritanceSetupFlowController__dismiss__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) navigationController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (void)_dismissAndNavigateToDateOfBirthSettings
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__AAUIInheritanceSetupFlowController__dismissAndNavigateToDateOfBirthSettings__block_invoke;
  block[3] = &unk_263F92168;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __78__AAUIInheritanceSetupFlowController__dismissAndNavigateToDateOfBirthSettings__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) navigationController];
  [v1 dismissViewControllerAnimated:1 completion:&__block_literal_global_16];
}

void __78__AAUIInheritanceSetupFlowController__dismissAndNavigateToDateOfBirthSettings__block_invoke_2()
{
  [NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&aaaction=accountContactDetails"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x263F01880] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

- (void)inheritanceDidSelectSharingOption:(unint64_t)a3
{
  if (a3 == 1)
  {
    [(AAUIInheritanceSetupFlowController *)self _showPrintPreview];
  }
  else if (!a3)
  {
    [(AAUIInheritanceSetupFlowController *)self _startInviteMessageFlow];
  }
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[AAUITrustedContactPickerViewController addressKindAndHandleForSingleAddressContact:v6];
  id v9 = objc_alloc(MEMORY[0x263F258A0]);
  int v10 = [v8 handle];
  uint64_t v11 = (AALocalContactInfo *)[v9 initWithHandle:v10 contact:v6];

  selectedContact = self->_selectedContact;
  self->_selectedContact = v11;

  [(AALocalContactInfo *)self->_selectedContact setContactType:[(AALocalContactInfo *)self->_selectedContact contactType] | 4];
  id v13 = objc_alloc(MEMORY[0x263F257A8]);
  id v14 = [MEMORY[0x263F08C38] UUID];
  id v15 = [(ACAccount *)self->_appleAccount aa_altDSID];
  id v16 = [v8 handle];
  id v17 = (AABeneficiaryInfo *)[v13 initWithBeneficiaryID:v14 benefactorAltDSID:v15 handle:v16];
  selectedBeneficiary = self->_selectedBeneficiary;
  self->_selectedBeneficiary = v17;

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __69__AAUIInheritanceSetupFlowController_contactPicker_didSelectContact___block_invoke;
  v19[3] = &unk_263F92168;
  v19[4] = self;
  [v7 dismissViewControllerAnimated:1 completion:v19];
}

uint64_t __69__AAUIInheritanceSetupFlowController_contactPicker_didSelectContact___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showShareData];
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 stringValue];
LABEL_5:
    int v10 = v9;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    goto LABEL_5;
  }
  int v10 = 0;
LABEL_7:
  uint64_t v11 = _AAUILogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[AAUIInheritanceSetupFlowController contactPicker:didSelectContactProperty:]();
  }

  id v12 = objc_alloc(MEMORY[0x263F258A0]);
  id v13 = [v6 contact];

  id v14 = (AALocalContactInfo *)[v12 initWithHandle:v10 contact:v13];
  selectedContact = self->_selectedContact;
  self->_selectedContact = v14;

  [(AALocalContactInfo *)self->_selectedContact setContactType:[(AALocalContactInfo *)self->_selectedContact contactType] | 4];
  id v16 = objc_alloc(MEMORY[0x263F257A8]);
  id v17 = [MEMORY[0x263F08C38] UUID];
  uint64_t v18 = [(ACAccount *)self->_appleAccount aa_altDSID];
  uint64_t v19 = (AABeneficiaryInfo *)[v16 initWithBeneficiaryID:v17 benefactorAltDSID:v18 handle:v10];
  selectedBeneficiary = self->_selectedBeneficiary;
  self->_selectedBeneficiary = v19;

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __77__AAUIInheritanceSetupFlowController_contactPicker_didSelectContactProperty___block_invoke;
  v21[3] = &unk_263F92168;
  v21[4] = self;
  [v7 dismissViewControllerAnimated:1 completion:v21];
}

uint64_t __77__AAUIInheritanceSetupFlowController_contactPicker_didSelectContactProperty___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showShareData];
}

- (void)accountContactSelector:(id)a3 didSelectContact:(id)a4
{
  id v5 = a4;
  id v6 = (AALocalContactInfo *)[v5 copy];
  selectedContact = self->_selectedContact;
  self->_selectedContact = v6;

  [(AALocalContactInfo *)self->_selectedContact setContactType:[(AALocalContactInfo *)self->_selectedContact contactType] | 4];
  id v8 = objc_alloc(MEMORY[0x263F257A8]);
  id v9 = [MEMORY[0x263F08C38] UUID];
  int v10 = [(ACAccount *)self->_appleAccount aa_altDSID];
  uint64_t v11 = [v5 handle];
  id v12 = (AABeneficiaryInfo *)[v8 initWithBeneficiaryID:v9 benefactorAltDSID:v10 handle:v11];
  selectedBeneficiary = self->_selectedBeneficiary;
  self->_selectedBeneficiary = v12;

  id v14 = _AAUILogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[AAUIInheritanceSetupFlowController accountContactSelector:didSelectContact:]();
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__AAUIInheritanceSetupFlowController_accountContactSelector_didSelectContact___block_invoke;
  block[3] = &unk_263F92168;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __78__AAUIInheritanceSetupFlowController_accountContactSelector_didSelectContact___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showShareData];
}

- (void)inviteMessageWasSent:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138412290;
    id v15 = v8;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "%@ : Sending IDS Message to Beneficiary", buf, 0xCu);
  }
  id v9 = objc_opt_new();
  [(UINavigationController *)self->_navigationController aaui_showActivityIndicator];
  selectedBeneficiary = self->_selectedBeneficiary;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __70__AAUIInheritanceSetupFlowController_inviteMessageWasSent_completion___block_invoke;
  v12[3] = &unk_263F92DC8;
  v12[4] = self;
  id v13 = v5;
  id v11 = v5;
  [v9 sendInvitationToContact:selectedBeneficiary completion:v12];
}

void __70__AAUIInheritanceSetupFlowController_inviteMessageWasSent_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__AAUIInheritanceSetupFlowController_inviteMessageWasSent_completion___block_invoke_2;
  block[3] = &unk_263F92DA0;
  uint64_t v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __70__AAUIInheritanceSetupFlowController_inviteMessageWasSent_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "aaui_hideActivityIndicator");
  if (*(void *)(v2 + 8))
  {
    id v3 = _AALogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __70__AAUIInheritanceSetupFlowController_inviteMessageWasSent_completion___block_invoke_2_cold_1(v2, v3);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v5();
  }
}

- (void)_setupBeneficiary
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "%@ : Creating Beneficiary...", buf, 0xCu);
  }
  id v6 = objc_alloc(MEMORY[0x263F29190]);
  id v7 = (void *)[v6 initWithBundleInformation:MEMORY[0x263EFFA68] manifestOptions:1];
  id v8 = objc_opt_new();
  id v9 = [(AAUIOBWelcomeController *)self->_shareDataVC primaryButton];
  [v9 setEnabled:0];

  [(UINavigationController *)self->_navigationController aaui_showActivityIndicator];
  selectedBeneficiary = self->_selectedBeneficiary;
  setupAuthToken = self->_setupAuthToken;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__AAUIInheritanceSetupFlowController__setupBeneficiary__block_invoke;
  v12[3] = &unk_263F93BC0;
  v12[4] = self;
  [v8 setupBeneficiaryManifest:v7 contactInfo:selectedBeneficiary setupAuthToken:setupAuthToken completion:v12];
}

void __55__AAUIInheritanceSetupFlowController__setupBeneficiary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [a2 accessKey];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = a1 + 32;
  [*(id *)(v8 + 32) setAccessKey:v6];

  id v9 = _AAUILogSystem();
  int v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __55__AAUIInheritanceSetupFlowController__setupBeneficiary__block_invoke_cold_1();
    }

    if ([v5 code] == 6)
    {
      id v11 = [MEMORY[0x263F259B0] cannotAddAnExistingBeneficiaryErrorTitle];
      id v12 = NSString;
      id v13 = [MEMORY[0x263F259B0] cannotAddAnExistingBeneficiaryErrorMessage];
      id v14 = [*(id *)(*(void *)v7 + 32) handle];
      uint64_t v15 = objc_msgSend(v12, "stringWithFormat:", v13, v14);
    }
    else
    {
      id v11 = [MEMORY[0x263F259B0] setupBeneficiaryErrorTitle];
      uint64_t v15 = [MEMORY[0x263F259B0] setupBeneficiaryErrorMessage];
    }
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __55__AAUIInheritanceSetupFlowController__setupBeneficiary__block_invoke_107;
    v21[3] = &unk_263F92758;
    v21[4] = *(void *)v7;
    id v22 = v11;
    id v23 = v15;
    id v18 = v15;
    id v19 = v11;
    dispatch_async(MEMORY[0x263EF83A0], v21);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "%@ : Beneficiary setup successful.", buf, 0xCu);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__AAUIInheritanceSetupFlowController__setupBeneficiary__block_invoke_108;
    block[3] = &unk_263F92168;
    block[4] = *(void *)v7;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __55__AAUIInheritanceSetupFlowController__setupBeneficiary__block_invoke_107(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 56) primaryButton];
  [v2 setEnabled:1];

  objc_msgSend(*(id *)(a1[4] + 80), "aaui_hideActivityIndicator");
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  return [v3 _showAlertWithTitle:v4 message:v5];
}

uint64_t __55__AAUIInheritanceSetupFlowController__setupBeneficiary__block_invoke_108(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) primaryButton];
  [v2 setEnabled:1];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "aaui_hideActivityIndicator");
  id v3 = *(void **)(a1 + 32);
  return [v3 _showShareAccessKey];
}

- (void)_showAlertWithTitle:(id)a3 message:(id)a4
{
  id v9 = [MEMORY[0x263F82418] alertWithTitle:a3 message:a4];
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"OK" value:&stru_26BD39CD8 table:@"Localizable"];

  uint64_t v7 = [MEMORY[0x263F82400] actionWithTitle:v6 style:0 handler:0];
  [v9 addAction:v7];

  uint64_t v8 = [(AAUIInheritanceSetupFlowController *)self navigationController];
  [v8 presentViewController:v9 animated:1 completion:0];
}

- (id)_doneButton
{
  id v3 = objc_alloc(MEMORY[0x263F824A8]);
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"NEXT" value:&stru_26BD39CD8 table:@"Localizable"];
  id v6 = (void *)[v3 initWithTitle:v5 style:0 target:self action:sel__showSetupCompleteWithShareTypePrint];

  return v6;
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_shareAccessKeyOptionsViewController, 0);
  objc_storeStrong((id *)&self->_inviteFlowController, 0);
  objc_storeStrong((id *)&self->_shareDataVC, 0);
  objc_storeStrong((id *)&self->_firstTimeSetupVC, 0);
  objc_storeStrong((id *)&self->_setupAuthToken, 0);
  objc_storeStrong((id *)&self->_selectedBeneficiary, 0);
  objc_storeStrong((id *)&self->_contactsProvider, 0);
  objc_storeStrong((id *)&self->_selectedContact, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
}

void __69__AAUIInheritanceSetupFlowController__validateAccountWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  v0 = (objc_class *)objc_opt_class();
  id v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_2_0(&dword_209754000, v2, v3, "%@ : Unable to authenticate: %@", v4, v5, v6, v7, 2u);
}

- (void)contactPicker:didSelectContactProperty:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  v0 = (objc_class *)objc_opt_class();
  id v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_4_1(&dword_209754000, v2, v3, "%@ : Selected Contact with handle - %@", v4, v5, v6, v7, v8);
}

- (void)accountContactSelector:didSelectContact:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  id v1 = (objc_class *)objc_opt_class();
  uint64_t v2 = NSStringFromClass(v1);
  id v9 = [v0 handle];
  OUTLINED_FUNCTION_4_1(&dword_209754000, v3, v4, "%@ : Selected Trusted/Family contact with handle - %@", v5, v6, v7, v8, 2u);
}

void __70__AAUIInheritanceSetupFlowController_inviteMessageWasSent_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_209754000, a2, OS_LOG_TYPE_ERROR, "%@ : Failed to notify beneficiary via private IDS channel.", (uint8_t *)&v5, 0xCu);
}

void __55__AAUIInheritanceSetupFlowController__setupBeneficiary__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  v0 = (objc_class *)objc_opt_class();
  id v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_0(&dword_209754000, v2, v3, "%@ : Error setting up beneficiary: %@", v4, v5, v6, v7, v8);
}

@end