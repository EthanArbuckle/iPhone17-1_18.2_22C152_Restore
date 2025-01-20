@interface AAUIMyPendingBeneficiaryActionHandler
- (id)_appleAccount;
- (id)_doneButton;
- (void)_checkMessageEligibility;
- (void)_dismiss;
- (void)_dismissAndNavigateToDateOfBirthSettings;
- (void)_showAlertWithTitle:(id)a3 message:(id)a4;
- (void)_showIncompatibleDeviceAlert;
- (void)_showPrintPreview;
- (void)_showSetupCompleteWithShareTypePrint;
- (void)_startInviteMessageFlow;
- (void)doPrimaryAction:(id)a3 specifier:(id)a4;
- (void)inheritanceDidSelectSharingOption:(unint64_t)a3;
- (void)inviteMessageFlowDidFinish:(id)a3;
- (void)inviteMessageWasSent:(id)a3 completion:(id)a4;
@end

@implementation AAUIMyPendingBeneficiaryActionHandler

- (void)doPrimaryAction:(id)a3 specifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    int v19 = 138412290;
    v20 = v8;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "%@ : Showing Share Access Key Options...", (uint8_t *)&v19, 0xCu);
  }
  v9 = [AAUIInheritanceShareAccessKeyOptionsViewController alloc];
  v10 = [(AAUIMyBeneficiaryActionHandler *)self contact];
  v11 = [v10 firstName];
  v12 = [(AAUIMyBeneficiaryActionHandler *)self contact];
  v13 = [v12 handle];
  v14 = [(AAUIInheritanceShareAccessKeyOptionsViewController *)v9 initWithBeneficiaryName:v11 handle:v13];
  shareAccessKeyOptionsViewController = self->_shareAccessKeyOptionsViewController;
  self->_shareAccessKeyOptionsViewController = v14;

  [(AAUIInheritanceShareAccessKeyOptionsViewController *)self->_shareAccessKeyOptionsViewController setFlowDelegate:self];
  v16 = (UINavigationController *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:self->_shareAccessKeyOptionsViewController];
  navigationController = self->_navigationController;
  self->_navigationController = v16;

  v18 = [v5 navigationController];

  [v18 presentViewController:self->_navigationController animated:1 completion:0];
}

- (void)inheritanceDidSelectSharingOption:(unint64_t)a3
{
  if (a3 == 1)
  {
    [(AAUIMyPendingBeneficiaryActionHandler *)self _showPrintPreview];
  }
  else if (!a3)
  {
    [(AAUIMyPendingBeneficiaryActionHandler *)self _startInviteMessageFlow];
  }
}

- (void)_checkMessageEligibility
{
  v3 = objc_opt_new();
  v4 = (void *)[objc_alloc(MEMORY[0x263F258C8]) initWithCapabilityType:2];
  objc_initWeak(&location, self);
  id v5 = [(AAUIMyBeneficiaryActionHandler *)self contact];
  v6 = [v5 handle];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__AAUIMyPendingBeneficiaryActionHandler__checkMessageEligibility__block_invoke;
  v7[3] = &unk_263F92D50;
  objc_copyWeak(&v8, &location);
  [v3 isRecipient:v6 capableOf:v4 completion:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __65__AAUIMyPendingBeneficiaryActionHandler__checkMessageEligibility__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __65__AAUIMyPendingBeneficiaryActionHandler__checkMessageEligibility__block_invoke_2;
    v5[3] = &unk_263F92D28;
    char v6 = a2;
    v5[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
}

uint64_t __65__AAUIMyPendingBeneficiaryActionHandler__checkMessageEligibility__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = _AAUILogSystem();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      id v5 = (objc_class *)objc_opt_class();
      char v6 = NSStringFromClass(v5);
      int v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "%@ : Recipient has compatible device to recieve access key. Starting message invite flow...", (uint8_t *)&v10, 0xCu);
    }
    return [*(id *)(a1 + 32) _startInviteMessageFlow];
  }
  else
  {
    if (v4)
    {
      id v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      int v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "%@ : Recipient does not have compatible device to recieve access key. Showing incompatible device alert...", (uint8_t *)&v10, 0xCu);
    }
    return [*(id *)(a1 + 32) _showIncompatibleDeviceAlert];
  }
}

- (void)_startInviteMessageFlow
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_209754000, log, OS_LOG_TYPE_DEBUG, "LCInvite: Initialing LC Invite Message view without checking if receiver isFamilyMember", v1, 2u);
}

- (void)_showPrintPreview
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "%@ : Showing Print Preview...", buf, 0xCu);
  }
  char v6 = [AAUIInheritanceAccessKeyPDFGenerator alloc];
  v7 = [(AAUIMyPendingBeneficiaryActionHandler *)self _appleAccount];
  id v8 = [(AAUIMyBeneficiaryActionHandler *)self contact];
  v9 = [(AAUIInheritanceAccessKeyPDFGenerator *)v6 initWithAppleAccount:v7 localContactInfo:v8];

  int v10 = [(AAUIInheritanceAccessKeyPDFGenerator *)v9 createPDFDocumentData];
  if ([MEMORY[0x263F61090] canPrintData:v10])
  {
    v11 = [MEMORY[0x263F61088] printInfo];
    uint64_t v12 = NSString;
    v13 = [(AAUIMyBeneficiaryActionHandler *)self contact];
    v14 = [v13 firstName];
    v15 = [MEMORY[0x263F259B0] printAccessKeyDocumentTitle];
    v16 = [v12 stringWithFormat:@"%@ - %@", v14, v15];
    [v11 setJobName:v16];

    [v11 setOrientation:0];
    [v11 setOutputType:2];
    v17 = [MEMORY[0x263F61090] sharedPrintController];
    [v17 setPrintInfo:v11];
    [v17 setShowsNumberOfCopies:1];
    [v17 setPrintingItem:v10];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __58__AAUIMyPendingBeneficiaryActionHandler__showPrintPreview__block_invoke;
    v18[3] = &unk_263F92D78;
    v18[4] = self;
    [v17 presentAnimated:1 completionHandler:v18];
  }
}

void __58__AAUIMyPendingBeneficiaryActionHandler__showPrintPreview__block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Error presenting printInteractionController - %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__AAUIMyPendingBeneficiaryActionHandler__showPrintPreview__block_invoke_52;
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
    v11[2] = __58__AAUIMyPendingBeneficiaryActionHandler__showPrintPreview__block_invoke_3;
    v11[3] = &unk_263F926B8;
    v11[4] = *(void *)(a1 + 32);
    id v12 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v11);
    int v10 = v12;
LABEL_8:

    goto LABEL_9;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__AAUIMyPendingBeneficiaryActionHandler__showPrintPreview__block_invoke_2;
  v13[3] = &unk_263F92168;
  v13[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v13);
LABEL_9:
}

void __58__AAUIMyPendingBeneficiaryActionHandler__showPrintPreview__block_invoke_52(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) localizedDescription];
  [v1 _showAlertWithTitle:0 message:v2];
}

uint64_t __58__AAUIMyPendingBeneficiaryActionHandler__showPrintPreview__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showSetupCompleteWithShareTypePrint];
}

uint64_t __58__AAUIMyPendingBeneficiaryActionHandler__showPrintPreview__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) navigationItem];
  v3 = [*(id *)(a1 + 32) _doneButton];
  [v2 setRightBarButtonItem:v3 animated:1];

  BOOL v4 = *(void **)(a1 + 40);
  return [v4 dismissAnimated:1];
}

- (void)_showSetupCompleteWithShareTypePrint
{
  v3 = [AAUIOBInheritanceSetupCompleteViewModel alloc];
  BOOL v4 = [(AAUIMyBeneficiaryActionHandler *)self contact];
  id v5 = [v4 displayName];
  int v10 = [(AAUIOBInheritanceSetupCompleteViewModel *)v3 initWithBeneficiaryName:v5 accessKeyShareType:1];

  char v6 = [[AAUIOBWelcomeController alloc] initWithViewModel:v10];
  id v7 = [(AAUIOBWelcomeController *)v6 primaryButton];
  [v7 addTarget:self action:sel__dismiss forControlEvents:64];

  id v8 = [(AAUIOBWelcomeController *)v6 secondaryButton];
  [v8 addTarget:self action:sel__dismissAndNavigateToDateOfBirthSettings forControlEvents:64];

  v9 = [(OBBaseWelcomeController *)v6 navigationItem];
  [v9 setHidesBackButton:1];

  [(UINavigationController *)self->_navigationController showViewController:v6 sender:0];
}

- (void)_showIncompatibleDeviceAlert
{
  v3 = (void *)MEMORY[0x263F82418];
  BOOL v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"ALERT_BENEFICIARY_INELIGIBLE_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];
  char v6 = NSString;
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"ALERT_BENEFICIARY_INELIGIBLE_MESSAGE" value:&stru_26BD39CD8 table:@"Localizable"];
  v9 = [(AAUIMyBeneficiaryActionHandler *)self contact];
  int v10 = [v9 firstName];
  v11 = objc_msgSend(v6, "stringWithFormat:", v8, v10);
  id v12 = [v3 alertWithTitle:v5 message:v11];

  v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"ALERT_BENEFICIARY_INELIGIBLE_BUTTON_PRIMARY" value:&stru_26BD39CD8 table:@"Localizable"];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __69__AAUIMyPendingBeneficiaryActionHandler__showIncompatibleDeviceAlert__block_invoke;
  v20[3] = &unk_263F927A8;
  v20[4] = self;
  id v15 = [MEMORY[0x263F82400] actionWithTitle:v14 style:0 handler:v20];
  [v12 addAction:v15];

  v16 = (void *)MEMORY[0x263F82400];
  id v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v18 = [v17 localizedStringForKey:@"ALERT_BENEFICIARY_INELIGIBLE_BUTTON_DISMISS" value:&stru_26BD39CD8 table:@"Localizable"];
  int v19 = [v16 actionWithTitle:v18 style:1 handler:0];
  [v12 addAction:v19];

  [(UINavigationController *)self->_navigationController presentViewController:v12 animated:1 completion:0];
}

uint64_t __69__AAUIMyPendingBeneficiaryActionHandler__showIncompatibleDeviceAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showPrintPreview];
}

- (void)inviteMessageFlowDidFinish:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    char v6 = NSStringFromClass(v5);
    int v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "%@ : Resend Invite flow did finish", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [v3 navigationController];

  [v7 dismissViewControllerAnimated:1 completion:0];
}

- (void)inviteMessageWasSent:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  char v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "%@ : Sending IDS Message to Beneficiary", buf, 0xCu);
  }
  v9 = objc_opt_new();
  uint64_t v10 = [(AAUIMyBeneficiaryActionHandler *)self contact];
  v11 = [v10 inheritanceContactInfo];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __73__AAUIMyPendingBeneficiaryActionHandler_inviteMessageWasSent_completion___block_invoke;
  v13[3] = &unk_263F92DC8;
  v13[4] = self;
  id v14 = v5;
  id v12 = v5;
  [v9 sendInvitationToContact:v11 completion:v13];
}

void __73__AAUIMyPendingBeneficiaryActionHandler_inviteMessageWasSent_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__AAUIMyPendingBeneficiaryActionHandler_inviteMessageWasSent_completion___block_invoke_2;
  block[3] = &unk_263F92DA0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __73__AAUIMyPendingBeneficiaryActionHandler_inviteMessageWasSent_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = _AALogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __73__AAUIMyPendingBeneficiaryActionHandler_inviteMessageWasSent_completion___block_invoke_2_cold_1(a1, v2);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v4();
  }
}

- (id)_appleAccount
{
  id v2 = [(AAUIMyBeneficiaryActionHandler *)self accountManager];
  id v3 = [v2 accounts];
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v4;
}

- (void)_showAlertWithTitle:(id)a3 message:(id)a4
{
  id v8 = [MEMORY[0x263F82418] alertWithTitle:a3 message:a4];
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"OK" value:&stru_26BD39CD8 table:@"Localizable"];

  id v7 = [MEMORY[0x263F82400] actionWithTitle:v6 style:0 handler:0];
  [v8 addAction:v7];

  [(UINavigationController *)self->_navigationController presentViewController:v8 animated:1 completion:0];
}

- (void)_dismiss
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__AAUIMyPendingBeneficiaryActionHandler__dismiss__block_invoke;
  block[3] = &unk_263F92168;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __49__AAUIMyPendingBeneficiaryActionHandler__dismiss__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)_dismissAndNavigateToDateOfBirthSettings
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__AAUIMyPendingBeneficiaryActionHandler__dismissAndNavigateToDateOfBirthSettings__block_invoke;
  block[3] = &unk_263F92168;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __81__AAUIMyPendingBeneficiaryActionHandler__dismissAndNavigateToDateOfBirthSettings__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) dismissViewControllerAnimated:1 completion:&__block_literal_global_8];
}

void __81__AAUIMyPendingBeneficiaryActionHandler__dismissAndNavigateToDateOfBirthSettings__block_invoke_2()
{
  [NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&aaaction=accountContactDetails"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x263F01880] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

- (id)_doneButton
{
  id v3 = objc_alloc(MEMORY[0x263F824A8]);
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"NEXT" value:&stru_26BD39CD8 table:@"Localizable"];
  id v6 = (void *)[v3 initWithTitle:v5 style:0 target:self action:sel__showSetupCompleteWithShareTypePrint];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviteFlowController, 0);
  objc_storeStrong((id *)&self->_shareAccessKeyOptionsViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

void __73__AAUIMyPendingBeneficiaryActionHandler_inviteMessageWasSent_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_209754000, a2, OS_LOG_TYPE_ERROR, "%@ : Failed to notify beneficiary via private IDS channel.", (uint8_t *)&v5, 0xCu);
}

@end