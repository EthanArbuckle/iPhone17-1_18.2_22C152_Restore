@interface CNFRegSplashSignInController
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_controllerToPresentOn;
- (id)_existingLearnMoreViewForSection:(int64_t)a3;
- (id)_existingLearnMoreViewForSpecifier:(id)a3;
- (id)specifierList;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (void)_handleTimeout;
- (void)dealloc;
- (void)tapToSignInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CNFRegSplashSignInController

- (id)_controllerToPresentOn
{
  v2 = [MEMORY[0x263F82438] sharedApplication];
  v3 = [v2 windows];
  v4 = [v3 firstObject];
  v5 = [v4 rootViewController];

  id v6 = v5;
  v7 = [v6 presentedViewController];

  v8 = v6;
  if (v7)
  {
    v8 = [v6 presentedViewController];
  }
  return v8;
}

- (void)dealloc
{
  [(AKTapToSignInViewController *)self->_akSignInVC setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)CNFRegSplashSignInController;
  [(CNFRegSignInController *)&v3 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  signInView = self->_signInView;
  id v6 = [(CNFRegListController *)self regController];
  -[CNFRegSigninLearnMoreView setSigningIn:](signInView, "setSigningIn:", [v6 accountIsAuthenticating]);

  v7.receiver = self;
  v7.super_class = (Class)CNFRegSplashSignInController;
  [(CNFRegSignInController *)&v7 viewWillAppear:v3];
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)CNFRegSplashSignInController;
  [(CNFRegSignInController *)&v18 viewDidLoad];
  BOOL v3 = (void *)MEMORY[0x263F827E8];
  v4 = CommunicationsSetupUIBundle();
  v5 = [v3 imageNamed:@"splash-top-glow" inBundle:v4];

  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v5];
    [v6 setAutoresizingMask:5];
    objc_super v7 = [(CNFRegSplashSignInController *)self table];
    v8 = [v7 backgroundView];

    [v6 bounds];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    double v14 = v13;
    double v16 = v15;
    [v8 bounds];
    double MidX = CGRectGetMidX(v19);
    v20.origin.x = v10;
    v20.origin.y = v12;
    v20.size.width = v14;
    v20.size.height = v16;
    objc_msgSend(v6, "setFrame:", floor(MidX + CGRectGetWidth(v20) * -0.5), 0.0, v14, v16);
    [v8 addSubview:v6];
  }
}

- (id)specifierList
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(CNFRegListController *)self regController];
    [v5 refreshSystemAccount];

    id v6 = [(CNFRegListController *)self regController];
    int v7 = [v6 hasSystemAccount];

    if (v7)
    {
      v8 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v15 = 0;
        _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "We have a system account available, using it", v15, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
      self->super._useSystemAccount = 1;
    }
    double v9 = [MEMORY[0x263EFF980] array];
    CGFloat v10 = (objc_class *)objc_opt_class();
    double v11 = NSStringFromClass(v10);
    CGFloat v12 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v12 setProperty:v11 forKey:*MEMORY[0x263F60118]];
    if (v12) {
      [v9 insertObject:v12 atIndex:0];
    }
    double v13 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3) = (Class)v9;

    [(CNFRegFirstRunController *)self _stopValidationModeAnimated:0];
    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)_handleTimeout
{
  v3.receiver = self;
  v3.super_class = (Class)CNFRegSplashSignInController;
  [(CNFRegSignInController *)&v3 _handleTimeout];
  [(CNFRegSigninLearnMoreView *)self->_signInView setSigningIn:0];
}

- (id)_existingLearnMoreViewForSpecifier:(id)a3
{
  objc_super v3 = (char *)a3;
  v4 = v3;
  if (v3 && !*(void *)&v3[*MEMORY[0x263F5FE10]])
  {
    id v6 = [v3 propertyForKey:*MEMORY[0x263F60128]];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v5 = v6;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_existingLearnMoreViewForSection:(int64_t)a3
{
  uint64_t v4 = [(CNFRegSplashSignInController *)self indexOfGroup:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v4];
    id v5 = [(CNFRegSplashSignInController *)self _existingLearnMoreViewForSpecifier:v6];
  }
  return v5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  int v7 = [(CNFRegSplashSignInController *)self _existingLearnMoreViewForSection:a4];
  v23.receiver = self;
  v23.super_class = (Class)CNFRegSplashSignInController;
  [(CNFRegListController *)&v23 tableView:v6 heightForHeaderInSection:a4];
  if (!v7)
  {
    int v7 = [(CNFRegSplashSignInController *)self _existingLearnMoreViewForSection:a4];
    double v9 = [(CNFRegListController *)self regController];
    objc_msgSend(v7, "setServiceType:", objc_msgSend(v9, "serviceType"));

    p_signInView = (id *)&self->_signInView;
    objc_storeStrong((id *)&self->_signInView, v7);
    if (!self->_akSignInVC)
    {
      double v11 = (AKTapToSignInViewController *)objc_alloc_init(MEMORY[0x263F29308]);
      akSignInVC = self->_akSignInVC;
      self->_akSignInVC = v11;

      [(AKTapToSignInViewController *)self->_akSignInVC setUsesDarkMode:1];
      [(AKTapToSignInViewController *)self->_akSignInVC setDelegate:self];
      id v13 = objc_alloc_init(MEMORY[0x263F292A8]);
      double v14 = [(CNFRegSplashSignInController *)self _controllerToPresentOn];
      [v13 setPresentingViewController:v14];

      id v21 = objc_alloc_init((Class)CUTWeakLinkClass());
      CGRect v20 = objc_msgSend(v21, "aa_primaryAppleAccount");
      double v15 = [v20 username];
      if ([v15 length])
      {
        [v13 setUsername:v15];
        [v13 setReason:v15];
      }
      [(AKTapToSignInViewController *)self->_akSignInVC setContext:v13];
      id v16 = *p_signInView;
      v17 = [(AKTapToSignInViewController *)self->_akSignInVC view];
      [v16 setAuthKitSignInView:v17];
    }
    [*p_signInView setController:self];
    v22.receiver = self;
    v22.super_class = (Class)CNFRegSplashSignInController;
    [(CNFRegListController *)&v22 tableView:v6 heightForHeaderInSection:a4];
  }
  double v18 = v8;

  return v18;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CNFRegSplashSignInController;
  id v5 = [(CNFRegListController *)&v9 tableView:a3 viewForHeaderInSection:a4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      int v7 = [(CNFRegListController *)self regController];
      objc_msgSend(v6, "setServiceType:", objc_msgSend(v7, "serviceType"));
    }
  }
  return v5;
}

- (void)tapToSignInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    [(CNFRegSigninLearnMoreView *)self->_signInView setSigningIn:0];
    double v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v10;
      _os_log_impl(&dword_21ED18000, v11, OS_LOG_TYPE_DEFAULT, "Could not authenticate: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
  else
  {
    CGFloat v12 = [v9 objectForKey:*MEMORY[0x263F29010]];
    uint64_t v13 = [v9 objectForKey:*MEMORY[0x263F28FF0]];
    double v14 = (void *)v13;
    if (v12) {
      BOOL v15 = v13 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15)
    {
      [(CNFRegSigninLearnMoreView *)self->_signInView setSigningIn:0];
      id v16 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED18000, v16, OS_LOG_TYPE_DEFAULT, "Authentication handler: Missing either username or password", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
    }
    else
    {
      [(CNFRegSignInController *)self signInWithUsername:v12 password:v13];
      [(CNFRegSigninLearnMoreView *)self->_signInView setSigningIn:1];
      [(CNFRegSigninLearnMoreView *)self->_signInView setNeedsDisplay];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_akSignInVC, 0);
  objc_storeStrong((id *)&self->_signInView, 0);
}

@end