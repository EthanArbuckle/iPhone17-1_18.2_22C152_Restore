@interface AAUIAppleIDRepairController
- (AAUIAppleIDRepairController)init;
- (AAUIAppleIDRepairControllerDelegate)delegate;
- (ACAccount)primaryAccount;
- (AKAppleIDAuthenticationPurpleBuddyContext)authContext;
- (void)_prepareAction;
- (void)setAuthContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPrimaryAccount:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AAUIAppleIDRepairController

- (AAUIAppleIDRepairController)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = @"UPDATING_APPLE_ID_LABEL";
  if (([@"UPDATING_APPLE_ID_LABEL" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    int v5 = 0;
  }
  else
  {
    v4 = [@"UPDATING_APPLE_ID_LABEL" stringByAppendingString:@"_REBRAND"];
    int v5 = 1;
  }
  v6 = [v3 localizedStringForKey:v4 value:&stru_26BD39CD8 table:@"Localizable"];
  v17.receiver = self;
  v17.super_class = (Class)AAUIAppleIDRepairController;
  v7 = [(OBSetupAssistantSpinnerController *)&v17 initWithSpinnerText:v6];

  if (v5) {
  if (v7)
  }
  {
    v8 = [(OBBaseWelcomeController *)v7 navigationItem];
    [v8 setHidesBackButton:1 animated:0];

    v9 = [MEMORY[0x263EFB210] defaultStore];
    v10 = objc_msgSend(v9, "aa_primaryAppleAccount");
    [(AAUIAppleIDRepairController *)v7 setPrimaryAccount:v10];

    id v11 = objc_alloc_init(MEMORY[0x263F292B0]);
    [(AAUIAppleIDRepairController *)v7 setAuthContext:v11];

    v12 = [(AAUIAppleIDRepairController *)v7 primaryAccount];
    v13 = objc_msgSend(v12, "aa_altDSID");
    v14 = [(AAUIAppleIDRepairController *)v7 authContext];
    [v14 setAltDSID:v13];

    v15 = [(AAUIAppleIDRepairController *)v7 authContext];
    [v15 setNeedsRepair:1];
  }
  return v7;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AAUIAppleIDRepairController;
  [(OBBaseWelcomeController *)&v3 viewDidLoad];
  [(AAUIAppleIDRepairController *)self _prepareAction];
}

- (void)_prepareAction
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__AAUIAppleIDRepairController__prepareAction__block_invoke;
  v3[3] = &unk_263F92AB8;
  objc_copyWeak(&v4, &location);
  [(AAUIOBSpinnerViewController *)self setActionBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __45__AAUIAppleIDRepairController__prepareAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_alloc_init(MEMORY[0x263F29118]);
  objc_super v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "Starting Apple ID repair flow...", buf, 2u);
  }

  id v4 = [WeakRetained authContext];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__AAUIAppleIDRepairController__prepareAction__block_invoke_38;
  v6[3] = &unk_263F92F30;
  id v7 = WeakRetained;
  id v5 = WeakRetained;
  [v2 authenticateWithContext:v4 completion:v6];
}

void __45__AAUIAppleIDRepairController__prepareAction__block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AAUILogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8) {
      goto LABEL_7;
    }
    *(_DWORD *)v14 = 138412290;
    *(void *)&v14[4] = v6;
    v9 = "Repair flow completed with error: %@";
    v10 = v7;
    uint32_t v11 = 12;
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    *(_WORD *)v14 = 0;
    v9 = "Repair flow completed successfully!";
    v10 = v7;
    uint32_t v11 = 2;
  }
  _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, v9, v14, v11);
LABEL_7:

  v12 = [*(id *)(a1 + 32) delegate];

  if (v12)
  {
    v13 = objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v14);
    [v13 repairController:*(void *)(a1 + 32) didCompleteWithSuccess:v6 == 0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AAUIAppleIDRepairController *)self authContext];
  id v6 = [(AAUIAppleIDRepairController *)self navigationController];
  [v5 setPresentingViewController:v6];

  v7.receiver = self;
  v7.super_class = (Class)AAUIAppleIDRepairController;
  [(AAUIOBSpinnerViewController *)&v7 viewDidAppear:v3];
}

- (AAUIAppleIDRepairControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUIAppleIDRepairControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ACAccount)primaryAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setPrimaryAccount:(id)a3
{
}

- (AKAppleIDAuthenticationPurpleBuddyContext)authContext
{
  return (AKAppleIDAuthenticationPurpleBuddyContext *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setAuthContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_primaryAccount, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end