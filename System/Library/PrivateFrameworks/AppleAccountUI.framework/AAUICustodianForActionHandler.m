@interface AAUICustodianForActionHandler
- (AAUICustodianForActionHandler)initWithLocalContact:(id)a3;
- (void)_dismissRecoveryViewController;
- (void)_showHelpNowUnavailableAlertWithMessage:(id)a3 viewController:(id)a4;
- (void)_showHelpNowViewWithRecoveryCode:(id)a3 presentingViewController:(id)a4;
- (void)doDestructiveAction:(id)a3 specifier:(id)a4;
- (void)doPrimaryAction:(id)a3 specifier:(id)a4;
@end

@implementation AAUICustodianForActionHandler

- (AAUICustodianForActionHandler)initWithLocalContact:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUICustodianForActionHandler;
  v6 = [(AAUICustodianForActionHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contact, a3);
  }

  return v7;
}

- (void)doDestructiveAction:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  v7 = [(AALocalContactInfo *)self->_contact custodianID];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__AAUICustodianForActionHandler_doDestructiveAction_specifier___block_invoke;
  v9[3] = &unk_263F92730;
  id v10 = v5;
  id v8 = v5;
  [v6 stopBeingCustodian:v7 completion:v9];
}

void __63__AAUICustodianForActionHandler_doDestructiveAction_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __63__AAUICustodianForActionHandler_doDestructiveAction_specifier___block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__AAUICustodianForActionHandler_doDestructiveAction_specifier___block_invoke_34;
    block[3] = &unk_263F92168;
    v6 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
    v4 = v6;
  }
}

void __63__AAUICustodianForActionHandler_doDestructiveAction_specifier___block_invoke_34(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popViewControllerAnimated:1];
}

- (void)doPrimaryAction:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  v7 = objc_opt_new();
  id v8 = [(AALocalContactInfo *)self->_contact custodianID];
  [v7 setCustodianUUID:v8];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__AAUICustodianForActionHandler_doPrimaryAction_specifier___block_invoke;
  v10[3] = &unk_263F92780;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  [v6 generateCustodianRecoveryCodeWithContext:v7 completion:v10];
}

void __59__AAUICustodianForActionHandler_doPrimaryAction_specifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 length])
  {
    v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __59__AAUICustodianForActionHandler_doPrimaryAction_specifier___block_invoke_cold_1((uint64_t)v6, v7);
    }

    id v8 = [v6 userInfo];
    id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F08320]];

    if ([v9 length]) {
      [*(id *)(a1 + 32) _showHelpNowUnavailableAlertWithMessage:v9 viewController:*(void *)(a1 + 40)];
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__AAUICustodianForActionHandler_doPrimaryAction_specifier___block_invoke_38;
    block[3] = &unk_263F92758;
    void block[4] = *(void *)(a1 + 32);
    id v11 = v5;
    id v12 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __59__AAUICustodianForActionHandler_doPrimaryAction_specifier___block_invoke_38(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showHelpNowViewWithRecoveryCode:*(void *)(a1 + 40) presentingViewController:*(void *)(a1 + 48)];
}

- (void)_showHelpNowViewWithRecoveryCode:(id)a3 presentingViewController:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263F258E8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  id v10 = [(AALocalContactInfo *)self->_contact firstNameOrHandleForDisplay];
  id v19 = (id)[v9 initWithRecoveryCode:v8 ownerName:v10];

  id v11 = [[AAUIOBCustodianHelpNowViewModel alloc] initWithModel:v19];
  id v12 = [[AAUIOBWelcomeController alloc] initWithViewModel:v11];
  recoveryViewController = self->_recoveryViewController;
  self->_recoveryViewController = v12;

  v14 = [(AAUIOBWelcomeController *)self->_recoveryViewController primaryButton];
  [v14 addTarget:self action:sel__dismissRecoveryViewController forControlEvents:64];

  v15 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:self->_recoveryViewController];
  v16 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__dismissRecoveryViewController];
  v17 = [(OBBaseWelcomeController *)self->_recoveryViewController navigationItem];
  [v17 setLeftBarButtonItem:v16];

  v18 = [v7 navigationController];

  [v18 presentViewController:v15 animated:1 completion:0];
}

- (void)_dismissRecoveryViewController
{
  id v2 = [(AAUIOBWelcomeController *)self->_recoveryViewController navigationController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)_showHelpNowUnavailableAlertWithMessage:(id)a3 viewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__AAUICustodianForActionHandler__showHelpNowUnavailableAlertWithMessage_viewController___block_invoke;
  block[3] = &unk_263F92758;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __88__AAUICustodianForActionHandler__showHelpNowUnavailableAlertWithMessage_viewController___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F82418];
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"ACCOUNT_RECOVERY_CONTACT_STATUS_NOT_REACHABLE" value:&stru_26BD39CD8 table:@"Localizable"];
  id v5 = [v2 alertWithTitle:v4 message:*(void *)(a1 + 32)];

  id v6 = (void *)MEMORY[0x263F82400];
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"OK" value:&stru_26BD39CD8 table:@"Localizable"];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __88__AAUICustodianForActionHandler__showHelpNowUnavailableAlertWithMessage_viewController___block_invoke_2;
  v10[3] = &unk_263F927A8;
  id v11 = *(id *)(a1 + 32);
  id v9 = [v6 actionWithTitle:v8 style:0 handler:v10];
  [v5 addAction:v9];

  [*(id *)(a1 + 48) presentViewController:v5 animated:1 completion:0];
}

void __88__AAUICustodianForActionHandler__showHelpNowUnavailableAlertWithMessage_viewController___block_invoke_2(uint64_t a1)
{
  id v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __88__AAUICustodianForActionHandler__showHelpNowUnavailableAlertWithMessage_viewController___block_invoke_2_cold_1(a1, v2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryViewController, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

void __63__AAUICustodianForActionHandler_doDestructiveAction_specifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_209754000, a2, OS_LOG_TYPE_ERROR, "Error ending Custodianship - %@", (uint8_t *)&v2, 0xCu);
}

void __59__AAUICustodianForActionHandler_doPrimaryAction_specifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_209754000, a2, OS_LOG_TYPE_FAULT, "Failed to generate custodian recovery code with error: %@", (uint8_t *)&v2, 0xCu);
}

void __88__AAUICustodianForActionHandler__showHelpNowUnavailableAlertWithMessage_viewController___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_209754000, a2, OS_LOG_TYPE_DEBUG, "User dismissed generate code alert for message: %@", (uint8_t *)&v3, 0xCu);
}

@end