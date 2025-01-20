@interface AAUIManateeStateValidator
- (AAUIManateeStateValidator)initWithFlowContext:(id)a3 withPresentingViewController:(id)a4;
- (CDPContext)context;
- (void)repairIfPrimaryAppleAccountIsCDP:(id)a3;
- (void)setContext:(id)a3;
- (void)verifyAndRepairManateeWithCompletion:(id)a3;
@end

@implementation AAUIManateeStateValidator

- (AAUIManateeStateValidator)initWithFlowContext:(id)a3 withPresentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AAUIManateeStateValidator;
  v9 = [(AAUIManateeStateValidator *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presentingViewController, a4);
    objc_storeStrong((id *)&v10->_flowContext, a3);
    v11 = [MEMORY[0x263F34328] sharedInstance];
    uint64_t v12 = [v11 contextForPrimaryAccount];
    context = v10->_context;
    v10->_context = (CDPContext *)v12;
  }
  return v10;
}

- (void)repairIfPrimaryAppleAccountIsCDP:(id)a3
{
  v4 = (void *)MEMORY[0x263F34328];
  v5 = (void (**)(id, uint64_t, void))a3;
  v6 = [v4 sharedInstance];
  id v7 = [v6 primaryAccountDSID];

  if ([MEMORY[0x263F34328] isICDPEnabledForDSID:v7 checkWithServer:0]) {
    [(AAUIManateeStateValidator *)self verifyAndRepairManateeWithCompletion:v5];
  }
  else {
    v5[2](v5, 1, 0);
  }
}

- (void)verifyAndRepairManateeWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Attempting manatee state repair.", buf, 2u);
  }

  p_presentingViewController = &self->_presentingViewController;
  presentingViewController = self->_presentingViewController;
  id v8 = p_presentingViewController[1];
  [(UIViewController *)v8 setPresentingViewController:presentingViewController];
  v9 = (void *)[objc_alloc(MEMORY[0x263F34A20]) initWithContext:v8];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__AAUIManateeStateValidator_verifyAndRepairManateeWithCompletion___block_invoke;
  v11[3] = &unk_263F92B30;
  id v12 = v4;
  id v10 = v4;
  [v9 performDeviceToDeviceEncryptionStateRepairWithCompletion:v11];
}

void __66__AAUIManateeStateValidator_verifyAndRepairManateeWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_msgSend(v4, "cdp_isCDPErrorWithCode:", 5903))
  {
    v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Manatee state validation completed. Already in good-state", v7, 2u);
    }

    v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (CDPContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_flowContext, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end