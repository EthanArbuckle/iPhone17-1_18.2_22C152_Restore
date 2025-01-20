@interface AKBasicLoginViewController
- (AKAppleIDAuthenticationInAppContext)context;
- (AKBasicLoginActions)loginActions;
- (AKBasicLoginControllerDelegate)delegate;
- (AKBasicLoginOptionsViewController)loginOptionsViewController;
- (AKBasicLoginTableViewCell)passwordCell;
- (AKBasicLoginTableViewCell)usernameCell;
- (AKBasicLoginViewController)initWithContext:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldShowPassword;
- (BOOL)_shouldShowUserName;
- (BOOL)isPasswordFieldVisible;
- (BOOL)isPresentedModally;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSLayoutConstraint)heightAnchor;
- (UITableView)tableView;
- (UIView)loginOptions;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_cancelBarButtonItem;
- (id)_formatUsernameAsPhoneNumberIfNeeded:(id)a3;
- (id)_loginOptions;
- (id)_passwordCell;
- (id)_signInBarButtonItem;
- (id)_tableView;
- (id)_title;
- (id)_usernameCell;
- (id)passwordCellTextField;
- (id)passwordHandler;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)usernameCellTextField;
- (int64_t)modalPresentationStyle;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancelPressed:(id)a3;
- (void)_initializeView;
- (void)_keyboardDidHide:(id)a3;
- (void)_keyboardDidShow:(id)a3;
- (void)_setContentInset:(double)a3;
- (void)_setPasswordHiddenIfNeeded;
- (void)_signInPressed:(id)a3;
- (void)clearPasswordField;
- (void)context:(id)a3 needsPasswordWithCompletion:(id)a4;
- (void)initializePasswordCellTextField:(id)a3;
- (void)initializeUsernameCellTextField:(id)a3;
- (void)loadView;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeightAnchor:(id)a3;
- (void)setIsPasswordFieldVisible:(BOOL)a3;
- (void)setLoginActions:(id)a3;
- (void)setLoginOptions:(id)a3;
- (void)setLoginOptionsViewController:(id)a3;
- (void)setPasswordCell:(id)a3;
- (void)setPasswordHandler:(id)a3;
- (void)setTableView:(id)a3;
- (void)setUsernameCell:(id)a3;
- (void)startAnimating;
- (void)stopAnimating;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AKBasicLoginViewController

- (AKBasicLoginViewController)initWithContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 title];
  v6 = [v4 reason];
  v9.receiver = self;
  v9.super_class = (Class)AKBasicLoginViewController;
  v7 = [(AKBasicLoginViewController *)&v9 initWithTitle:v5 detailText:v6 icon:0];

  if (v7)
  {
    objc_storeWeak((id *)&v7->_context, v4);
    if ([v4 shouldAllowAppleIDCreation]) {
      [v4 setIsUsernameEditable:1];
    }
  }

  return v7;
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)AKBasicLoginViewController;
  [(OBBaseWelcomeController *)&v7 loadView];
  v3 = [(OBBaseWelcomeController *)self navigationItem];
  id v4 = [(AKBasicLoginViewController *)self _cancelBarButtonItem];
  [v3 setLeftBarButtonItem:v4];

  v5 = [(OBBaseWelcomeController *)self navigationItem];
  v6 = [(AKBasicLoginViewController *)self _signInBarButtonItem];
  [v5 setRightBarButtonItem:v6];

  [(AKBasicLoginViewController *)self _initializeView];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AKBasicLoginViewController;
  [(AKBasicLoginViewController *)&v3 viewWillAppear:a3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AKBasicLoginViewController;
  [(OBBaseWelcomeController *)&v8 viewDidAppear:a3];
  id v4 = [(AKBasicLoginViewController *)self delegate];
  [v4 basicLoginControllerDidPresent:self];

  [(UITableView *)self->_tableView reloadData];
  BOOL v5 = [(AKBasicLoginViewController *)self _shouldShowUserName];
  v6 = &OBJC_IVAR___AKBasicLoginViewController__passwordCell;
  if (v5) {
    v6 = &OBJC_IVAR___AKBasicLoginViewController__usernameCell;
  }
  objc_super v7 = [*(id *)((char *)&self->super.super.super.super.super.isa + *v6) cellTextField];
  [v7 becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKBasicLoginViewController;
  [(AKBasicLoginViewController *)&v5 viewWillDisappear:a3];
  id v4 = [(AKBasicLoginViewController *)self delegate];
  [v4 basicLoginControllerWillDismiss:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AKBasicLoginViewController;
  [(AKBasicLoginViewController *)&v9 viewDidDisappear:a3];
  id v4 = [(AKBasicLoginViewController *)self delegate];
  [v4 basicLoginControllerDidDismiss:self];

  objc_super v5 = [(AKBasicLoginViewController *)self loginActions];
  v6 = objc_msgSend(v5, "ak_cancelAction");

  if (v6)
  {
    objc_super v7 = [(AKBasicLoginViewController *)self loginActions];
    objc_msgSend(v7, "ak_cancelAction");
    objc_super v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();
  }
}

- (void)viewDidLayoutSubviews
{
  objc_super v3 = [(AKBasicLoginViewController *)self view];
  [v3 layoutIfNeeded];

  id v4 = [(AKBasicLoginViewController *)self tableView];
  [v4 contentSize];
  double v6 = v5;
  objc_super v7 = [(AKBasicLoginViewController *)self heightAnchor];
  [v7 setConstant:v6];

  v8.receiver = self;
  v8.super_class = (Class)AKBasicLoginViewController;
  [(OBBaseWelcomeController *)&v8 viewDidLayoutSubviews];
}

- (int64_t)modalPresentationStyle
{
  return 2;
}

- (BOOL)isPresentedModally
{
  objc_super v3 = [(AKBasicLoginViewController *)self navigationController];

  if (!v3) {
    goto LABEL_4;
  }
  id v4 = [(AKBasicLoginViewController *)self navigationController];
  double v5 = [v4 viewControllers];
  double v6 = [v5 firstObject];

  if (v6 != self) {
    return 0;
  }
LABEL_4:
  objc_super v8 = [(AKBasicLoginViewController *)self presentingViewController];
  BOOL v7 = v8 != 0;

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)startAnimating
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v5];
  id v4 = [(OBBaseWelcomeController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  [v5 startAnimating];
}

- (void)stopAnimating
{
  id v4 = [(OBBaseWelcomeController *)self navigationItem];
  objc_super v3 = [(AKBasicLoginViewController *)self _signInBarButtonItem];
  [v4 setRightBarButtonItem:v3];
}

- (void)clearPasswordField
{
  id v2 = [(AKBasicLoginViewController *)self passwordCellTextField];
  [v2 setText:0];
}

- (void)_cancelPressed:(id)a3
{
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v9 = 0;
    _os_log_impl(&dword_1C38C1000, v4, OS_LOG_TYPE_DEFAULT, "Cancel Pressed", v9, 2u);
  }

  id v5 = [(AKBasicLoginViewController *)self loginActions];
  double v6 = objc_msgSend(v5, "ak_cancelAction");

  if (v6)
  {
    BOOL v7 = [(AKBasicLoginViewController *)self loginActions];
    objc_msgSend(v7, "ak_cancelAction");
    objc_super v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();
  }
}

- (void)_signInPressed:(id)a3
{
  if ([(AKBasicLoginViewController *)self _shouldShowUserName])
  {
    WeakRetained = [(AKBasicLoginViewController *)self usernameCellTextField];
    [WeakRetained text];
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    [WeakRetained username];
  }
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [(AKBasicLoginViewController *)self passwordCellTextField];
  double v6 = [v5 text];

  BOOL v7 = [(AKBasicLoginViewController *)self passwordHandler];

  if (v7)
  {
    objc_super v8 = [(AKBasicLoginViewController *)self passwordHandler];
    ((void (**)(void, void *, void))v8)[2](v8, v6, 0);

    [(AKBasicLoginViewController *)self setPasswordHandler:0];
  }
  else
  {
    objc_super v9 = [(AKBasicLoginViewController *)self loginActions];
    v10 = [v9 authenticateAction];

    if (v10)
    {
      uint64_t v11 = [(AKBasicLoginViewController *)self _formatUsernameAsPhoneNumberIfNeeded:v14];

      v12 = [(AKBasicLoginViewController *)self loginActions];
      v13 = [v12 authenticateAction];
      ((void (**)(void, uint64_t, void *))v13)[2](v13, v11, v6);

      id v14 = (id)v11;
    }
  }
}

- (id)_title
{
  objc_super v3 = [(AKBasicLoginViewController *)self context];
  id v4 = [v3 title];

  if (v4)
  {
    id v5 = [v3 title];
    goto LABEL_15;
  }
  if (([v3 isUsernameEditable] & 1) == 0 && (objc_msgSend(v3, "shouldAllowAppleIDCreation") & 1) == 0)
  {
    double v6 = [MEMORY[0x1E4F4F010] currentDevice];
    char v9 = [v6 isMultiUserMode];
    v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
    BOOL v7 = v10;
    if ((v9 & 1) == 0)
    {
      v13 = @"APPLE_ID_PASSWORD_HEADER";
      char v14 = [@"APPLE_ID_PASSWORD_HEADER" containsString:@"REBRAND"];
      if (v14)
      {
        int v15 = 0;
      }
      else
      {
        id v2 = [MEMORY[0x1E4F4F020] sharedManager];
        if ([v2 isAABrandingEnabled])
        {
          v13 = [@"APPLE_ID_PASSWORD_HEADER" stringByAppendingString:@"_REBRAND"];
          int v15 = 1;
        }
        else
        {
          int v15 = 0;
        }
      }
      id v5 = [v7 localizedStringForKey:v13 value:&stru_1F1EE8138 table:@"Localizable"];
      if (v15) {

      }
      if ((v14 & 1) == 0) {
      goto LABEL_13;
      }
    }
    uint64_t v11 = @"APPLE_ID_PASSCODE_HEADER_IPAD";
    goto LABEL_12;
  }
  double v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  if (![@"APPLE_ID_SIGN_IN_HEADER" containsString:@"REBRAND"])
  {
    BOOL v7 = [MEMORY[0x1E4F4F020] sharedManager];
    if ([v7 isAABrandingEnabled])
    {
      objc_super v8 = [@"APPLE_ID_SIGN_IN_HEADER" stringByAppendingString:@"_REBRAND"];
      id v5 = [v6 localizedStringForKey:v8 value:&stru_1F1EE8138 table:@"Localizable"];

LABEL_13:
      goto LABEL_14;
    }
    uint64_t v11 = @"APPLE_ID_SIGN_IN_HEADER";
    v10 = v6;
LABEL_12:
    id v5 = [v10 localizedStringForKey:v11 value:&stru_1F1EE8138 table:@"Localizable"];
    goto LABEL_13;
  }
  id v5 = [v6 localizedStringForKey:@"APPLE_ID_SIGN_IN_HEADER" value:&stru_1F1EE8138 table:@"Localizable"];
LABEL_14:

LABEL_15:

  return v5;
}

- (BOOL)_shouldShowUserName
{
  id v2 = [(AKBasicLoginViewController *)self context];
  char v3 = [v2 isUsernameEditable];

  return v3;
}

- (BOOL)_shouldShowPassword
{
  char v3 = [(AKBasicLoginViewController *)self context];
  BOOL v4 = ([v3 _requiresPasswordInput] & 1) != 0
    || [(AKBasicLoginViewController *)self isPasswordFieldVisible];

  return v4;
}

- (id)_loginOptions
{
  v45[4] = *MEMORY[0x1E4F143B8];
  loginOptions = self->_loginOptions;
  if (!loginOptions)
  {
    BOOL v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    id v5 = self->_loginOptions;
    self->_loginOptions = v4;

    double v6 = [AKBasicLoginOptionsViewController alloc];
    BOOL v7 = [(AKBasicLoginViewController *)self context];
    objc_super v8 = [(AKBasicLoginOptionsViewController *)v6 initWithContext:v7];
    [(AKBasicLoginViewController *)self setLoginOptionsViewController:v8];

    char v9 = [(AKBasicLoginViewController *)self loginOptionsViewController];
    v10 = [v9 view];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

    uint64_t v11 = [(AKBasicLoginViewController *)self loginOptionsViewController];
    [(AKBasicLoginViewController *)self addChildViewController:v11];

    objc_initWeak(&location, self);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __43__AKBasicLoginViewController__loginOptions__block_invoke;
    v42[3] = &unk_1E648F498;
    objc_copyWeak(&v43, &location);
    v12 = [(AKBasicLoginViewController *)self loginOptionsViewController];
    [v12 setCreateIDAction:v42];

    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __43__AKBasicLoginViewController__loginOptions__block_invoke_62;
    v40[3] = &unk_1E648F498;
    objc_copyWeak(&v41, &location);
    v13 = [(AKBasicLoginViewController *)self loginOptionsViewController];
    [v13 setForgotAction:v40];

    [(UIView *)self->_loginOptions setTranslatesAutoresizingMaskIntoConstraints:0];
    char v14 = self->_loginOptions;
    int v15 = [(AKBasicLoginViewController *)self loginOptionsViewController];
    v16 = [v15 view];
    [(UIView *)v14 addSubview:v16];

    v17 = [(AKBasicLoginViewController *)self loginOptionsViewController];
    [v17 didMoveToParentViewController:self];

    v39 = [(AKBasicLoginViewController *)self loginOptionsViewController];
    v38 = [v39 view];
    v37 = [v38 topAnchor];
    v36 = [(UIView *)self->_loginOptions topAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v45[0] = v35;
    v34 = [(AKBasicLoginViewController *)self loginOptionsViewController];
    v33 = [v34 view];
    v32 = [v33 bottomAnchor];
    v31 = [(UIView *)self->_loginOptions bottomAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v45[1] = v30;
    v29 = [(AKBasicLoginViewController *)self loginOptionsViewController];
    v28 = [v29 view];
    v18 = [v28 leadingAnchor];
    v19 = [(UIView *)self->_loginOptions leadingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19 constant:20.0];
    v45[2] = v20;
    v21 = [(AKBasicLoginViewController *)self loginOptionsViewController];
    v22 = [v21 view];
    v23 = [v22 trailingAnchor];
    v24 = [(UIView *)self->_loginOptions trailingAnchor];
    v25 = [v23 constraintEqualToAnchor:v24 constant:-20.0];
    v45[3] = v25;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];

    [MEMORY[0x1E4F28DC8] activateConstraints:v27];
    objc_destroyWeak(&v41);
    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
    loginOptions = self->_loginOptions;
  }

  return loginOptions;
}

void __43__AKBasicLoginViewController__loginOptions__block_invoke(uint64_t a1)
{
  id v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v9 = 0;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "Create Pressed", v9, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained loginActions];
    double v6 = [v5 createIDAction];

    if (v6)
    {
      BOOL v7 = [v4 loginActions];
      objc_super v8 = [v7 createIDAction];
      v8[2]();
    }
  }
}

void __43__AKBasicLoginViewController__loginOptions__block_invoke_62(uint64_t a1)
{
  id v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "Forgot Pressed", v11, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained loginActions];
    double v6 = [v5 forgotPasswordAction];

    if (v6)
    {
      if ([v4 _shouldShowUserName])
      {
        BOOL v7 = [v4 usernameCellTextField];
        [v7 text];
      }
      else
      {
        BOOL v7 = [v4 context];
        [v7 username];
      objc_super v8 = };

      char v9 = [v4 loginActions];
      v10 = [v9 forgotPasswordAction];
      ((void (**)(void, void *))v10)[2](v10, v8);
    }
  }
}

- (id)_cancelBarButtonItem
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel__cancelPressed_];

  return v2;
}

- (id)_signInBarButtonItem
{
  id v3 = objc_alloc(MEMORY[0x1E4F427C0]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  id v5 = [WeakRetained defaultButtonString];
  if (v5)
  {
    double v6 = (void *)[v3 initWithTitle:v5 style:0 target:self action:sel__signInPressed_];
  }
  else
  {
    BOOL v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
    objc_super v8 = [v7 localizedStringForKey:@"SIGN_IN" value:&stru_1F1EE8138 table:@"Localizable"];
    double v6 = (void *)[v3 initWithTitle:v8 style:0 target:self action:sel__signInPressed_];
  }

  return v6;
}

- (id)_formatUsernameAsPhoneNumberIfNeeded:(id)a3
{
  id v4 = a3;
  if ([v4 containsString:@"@"])
  {
    id v5 = v4;
  }
  else
  {
    double v6 = objc_opt_new();
    BOOL v7 = [v6 displayFormatFor:v4];
    id v5 = [v6 normalizedFormatFor:v7];
    if (([v7 isEqualToString:v4] & 1) == 0)
    {
      objc_super v8 = [(AKBasicLoginViewController *)self usernameCellTextField];
      [v8 setText:v7];
    }
  }

  return v5;
}

- (void)context:(id)a3 needsPasswordWithCompletion:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(AKBasicLoginViewController *)self isPasswordFieldVisible];
  [(AKBasicLoginViewController *)self setPasswordHandler:v5];

  if (!v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__AKBasicLoginViewController_context_needsPasswordWithCompletion___block_invoke;
    v10[3] = &unk_1E648F208;
    v10[4] = self;
    BOOL v7 = (void (**)(void, void))MEMORY[0x1C8777520](v10);
    if ([(AKBasicLoginViewController *)self _shouldShowUserName])
    {
      [(AKBasicLoginViewController *)self setIsPasswordFieldVisible:1];
      objc_super v8 = [(AKBasicLoginViewController *)self tableView];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __66__AKBasicLoginViewController_context_needsPasswordWithCompletion___block_invoke_2;
      v9[3] = &unk_1E648EF28;
      v9[4] = self;
      [v8 performBatchUpdates:v9 completion:v7];
    }
    else
    {
      v7[2](v7, 1);
    }
  }
}

uint64_t __66__AKBasicLoginViewController_context_needsPasswordWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) passwordCell];
  id v3 = [v2 cellTextField];
  [v3 becomeFirstResponder];

  id v4 = *(void **)(a1 + 32);

  return [v4 stopAnimating];
}

void __66__AKBasicLoginViewController_context_needsPasswordWithCompletion___block_invoke_2(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) tableView];
  id v2 = [MEMORY[0x1E4F28D58] indexPathForRow:1 inSection:0];
  v4[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v1 insertRowsAtIndexPaths:v3 withRowAnimation:100];
}

- (void)_setPasswordHiddenIfNeeded
{
  if ([(AKBasicLoginViewController *)self isPasswordFieldVisible])
  {
    [(AKBasicLoginViewController *)self setIsPasswordFieldVisible:0];
    id v3 = [(AKBasicLoginViewController *)self passwordCellTextField];
    [v3 setText:0];

    [(AKBasicLoginViewController *)self setPasswordHandler:0];
    id v4 = [MEMORY[0x1E4F28D58] indexPathForRow:1 inSection:0];
    uint64_t v5 = [v4 section];
    BOOL v6 = [(AKBasicLoginViewController *)self tableView];
    if (v5 >= [v6 numberOfSections])
    {
    }
    else
    {
      uint64_t v7 = [v4 row];
      objc_super v8 = [(AKBasicLoginViewController *)self tableView];
      uint64_t v9 = objc_msgSend(v8, "numberOfRowsInSection:", objc_msgSend(v4, "section"));

      if (v7 < v9)
      {
        v10 = [(AKBasicLoginViewController *)self tableView];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __56__AKBasicLoginViewController__setPasswordHiddenIfNeeded__block_invoke;
        v12[3] = &unk_1E648F2C8;
        v12[4] = self;
        id v13 = v4;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __56__AKBasicLoginViewController__setPasswordHiddenIfNeeded__block_invoke_2;
        v11[3] = &unk_1E648F208;
        v11[4] = self;
        [v10 performBatchUpdates:v12 completion:v11];
      }
    }
  }
}

void __56__AKBasicLoginViewController__setPasswordHiddenIfNeeded__block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) tableView];
  v4[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v2 deleteRowsAtIndexPaths:v3 withRowAnimation:100];
}

void __56__AKBasicLoginViewController__setPasswordHiddenIfNeeded__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) usernameCell];
  v1 = [v2 cellTextField];
  [v1 becomeFirstResponder];
}

- (void)initializePasswordCellTextField:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28B50];
  id v7 = a3;
  uint64_t v5 = [v4 bundleWithIdentifier:@"com.apple.AuthKitUI"];
  BOOL v6 = [v5 localizedStringForKey:@"PASSWORD_PLACEHOLDER" value:&stru_1F1EE8138 table:@"Localizable"];
  [v7 setPlaceholder:v6];

  [v7 setTextContentType:*MEMORY[0x1E4F43DC0]];
  [v7 setSecureTextEntry:1];
  [v7 setReturnKeyType:9];
  [v7 setDelegate:self];
}

- (void)initializeUsernameCellTextField:(id)a3
{
  id v12 = a3;
  id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  uint64_t v5 = [v4 localizedStringForKey:@"EMAIL_OR_PHONE_PLACEHOLDER" value:&stru_1F1EE8138 table:@"Localizable"];
  [v12 setPlaceholder:v5];

  [v12 setTextContentType:*MEMORY[0x1E4F43DC0]];
  [v12 setAutocapitalizationType:0];
  [v12 setKeyboardType:7];
  [v12 setReturnKeyType:11];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  id v7 = [WeakRetained username];

  if (v7)
  {
    objc_super v8 = [(AKBasicLoginViewController *)self context];
    uint64_t v9 = [v8 username];
    [v12 setText:v9];

    v10 = [(OBBaseWelcomeController *)self navigationItem];
    uint64_t v11 = [v10 rightBarButtonItem];
    [v11 setEnabled:1];
  }
  [v12 setDelegate:self];
}

- (void)_initializeView
{
  v64[11] = *MEMORY[0x1E4F143B8];
  id v3 = [(AKBasicLoginViewController *)self headerView];
  id v4 = [(AKBasicLoginViewController *)self _title];
  [v3 setTitle:v4];

  uint64_t v5 = [(AKBasicLoginViewController *)self headerView];
  BOOL v6 = [(AKBasicLoginViewController *)self context];
  id v7 = [v6 _interpolatedReasonWithBlame];
  [v5 setDetailText:v7];

  objc_super v8 = [(AKBasicLoginViewController *)self _tableView];
  uint64_t v9 = [(AKBasicLoginViewController *)self contentView];
  [v9 addSubview:v8];

  v10 = [(AKBasicLoginViewController *)self _loginOptions];
  uint64_t v11 = [(AKBasicLoginViewController *)self contentView];
  [v11 addSubview:v10];

  id v43 = (void *)MEMORY[0x1E4F28DC8];
  v63 = [(AKBasicLoginViewController *)self headerView];
  v61 = [v63 leadingAnchor];
  v62 = [(AKBasicLoginViewController *)self view];
  v60 = [v62 leadingAnchor];
  v59 = [v61 constraintEqualToAnchor:v60 constant:20.0];
  v64[0] = v59;
  v58 = [(AKBasicLoginViewController *)self headerView];
  v56 = [v58 trailingAnchor];
  v57 = [(AKBasicLoginViewController *)self view];
  v55 = [v57 trailingAnchor];
  v54 = [v56 constraintEqualToAnchor:v55 constant:-20.0];
  v64[1] = v54;
  v53 = [(AKBasicLoginViewController *)self contentView];
  v51 = [v53 leadingAnchor];
  v52 = [(AKBasicLoginViewController *)self view];
  v50 = [v52 leadingAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v64[2] = v49;
  v48 = [(AKBasicLoginViewController *)self contentView];
  v46 = [v48 trailingAnchor];
  v47 = [(AKBasicLoginViewController *)self view];
  v45 = [v47 trailingAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v64[3] = v44;
  v42 = [(AKBasicLoginViewController *)self contentView];
  v39 = [v42 topAnchor];
  v38 = [v8 topAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v64[4] = v37;
  v36 = [(AKBasicLoginViewController *)self contentView];
  v35 = [v36 leadingAnchor];
  v34 = [v8 leadingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v64[5] = v33;
  v32 = [(AKBasicLoginViewController *)self contentView];
  v31 = [v32 trailingAnchor];
  v40 = v8;
  v30 = [v8 trailingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v64[6] = v29;
  v28 = [(AKBasicLoginViewController *)self contentView];
  v27 = [v28 leadingAnchor];
  v26 = [v10 leadingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v64[7] = v25;
  v24 = [(AKBasicLoginViewController *)self contentView];
  v23 = [v24 trailingAnchor];
  id v41 = v10;
  v22 = [v10 trailingAnchor];
  id v12 = [v23 constraintEqualToAnchor:v22];
  v64[8] = v12;
  id v13 = [(AKBasicLoginViewController *)self contentView];
  char v14 = [v13 bottomAnchor];
  int v15 = [v10 bottomAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v64[9] = v16;
  v17 = [v10 topAnchor];
  v18 = [v8 bottomAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  v64[10] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:11];
  [v43 activateConstraints:v20];

  v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v21 addObserver:self selector:sel__keyboardDidShow_ name:*MEMORY[0x1E4F43AC8] object:0];
  [v21 addObserver:self selector:sel__keyboardDidHide_ name:*MEMORY[0x1E4F43AC0] object:0];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (![(AKBasicLoginViewController *)self _shouldShowUserName]) {
    return 1;
  }
  if ([(AKBasicLoginViewController *)self _shouldShowPassword]) {
    return 2;
  }
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 row])
  {
    if ([v5 row] != 1)
    {
      BOOL v6 = 0;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (![(AKBasicLoginViewController *)self _shouldShowUserName])
  {
LABEL_6:
    uint64_t v7 = [(AKBasicLoginViewController *)self _passwordCell];
    goto LABEL_7;
  }
  uint64_t v7 = [(AKBasicLoginViewController *)self _usernameCell];
LABEL_7:
  BOOL v6 = (void *)v7;
LABEL_8:

  return v6;
}

- (id)passwordCellTextField
{
  id v2 = [(AKBasicLoginViewController *)self passwordCell];
  id v3 = [v2 cellTextField];

  return v3;
}

- (id)usernameCellTextField
{
  id v2 = [(AKBasicLoginViewController *)self usernameCell];
  id v3 = [v2 cellTextField];

  return v3;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  id v6 = a3;
  uint64_t v7 = [(AKBasicLoginViewController *)self usernameCell];
  objc_super v8 = [v7 cellTextField];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    v10 = [(AKBasicLoginViewController *)self context];
    uint64_t v11 = [v10 username];

    if (v11)
    {
      id v12 = _AKLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v14 = 0;
        _os_log_impl(&dword_1C38C1000, v12, OS_LOG_TYPE_DEFAULT, "Username is changing", v14, 2u);
      }

      [v10 setUsername:0];
    }
    [(AKBasicLoginViewController *)self _setPasswordHiddenIfNeeded];
  }
  return 1;
}

- (id)_usernameCell
{
  usernameCell = self->_usernameCell;
  if (!usernameCell)
  {
    id v4 = [[AKBasicLoginTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
    id v5 = self->_usernameCell;
    self->_usernameCell = v4;

    id v6 = [(AKBasicLoginTableViewCell *)self->_usernameCell cellTextField];
    [(AKBasicLoginViewController *)self initializeUsernameCellTextField:v6];

    usernameCell = self->_usernameCell;
  }

  return usernameCell;
}

- (id)_passwordCell
{
  passwordCell = self->_passwordCell;
  if (!passwordCell)
  {
    id v4 = [[AKBasicLoginTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
    id v5 = self->_passwordCell;
    self->_passwordCell = v4;

    id v6 = [(AKBasicLoginTableViewCell *)self->_passwordCell cellTextField];
    [(AKBasicLoginViewController *)self initializePasswordCellTextField:v6];

    passwordCell = self->_passwordCell;
  }

  return passwordCell;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v4 = [(AKBasicLoginViewController *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  double result = *MEMORY[0x1E4F43D18];
  if (!IsAccessibilityCategory) {
    return 44.0;
  }
  return result;
}

- (id)_tableView
{
  tableView = self->_tableView;
  if (!tableView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42E98]);
    int64_t v5 = +[AKBasicLoginAppearance tableViewStyle];
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    int v9 = (UITableView *)objc_msgSend(v4, "initWithFrame:style:", v5, *MEMORY[0x1E4F1DB28], v7, v8, *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v10 = self->_tableView;
    self->_tableView = v9;

    uint64_t v11 = [MEMORY[0x1E4F428B8] clearColor];
    [(UITableView *)self->_tableView setBackgroundColor:v11];

    [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITableView *)self->_tableView setDelegate:self];
    [(UITableView *)self->_tableView setDataSource:self];
    [(UITableView *)self->_tableView setRowHeight:*MEMORY[0x1E4F43D18]];
    [(UITableView *)self->_tableView setEstimatedRowHeight:0.0];
    [(UITableView *)self->_tableView setScrollEnabled:0];
    [(UITableView *)self->_tableView setAllowsSelection:0];
    [(UITableView *)self->_tableView setSeparatorStyle:1];
    id v12 = self->_tableView;
    id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v6, v7, v8, 10.0);
    [(UITableView *)v12 setTableHeaderView:v13];

    char v14 = self->_tableView;
    int v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v6, v7, v8, 2.0);
    [(UITableView *)v14 setTableFooterView:v15];

    [(UITableView *)self->_tableView reloadData];
    v16 = [(UITableView *)self->_tableView heightAnchor];
    v17 = [(AKBasicLoginViewController *)self tableView];
    [v17 contentSize];
    v19 = [v16 constraintEqualToConstant:v18];
    [(AKBasicLoginViewController *)self setHeightAnchor:v19];

    v20 = [(AKBasicLoginViewController *)self heightAnchor];
    [v20 setActive:1];

    tableView = self->_tableView;
  }

  return tableView;
}

- (void)_keyboardDidShow:(id)a3
{
  id v7 = [a3 userInfo];
  id v4 = [v7 objectForKey:*MEMORY[0x1E4F43AF0]];
  [v4 CGRectValue];
  double v6 = v5;

  [(AKBasicLoginViewController *)self _setContentInset:v6];
}

- (void)_keyboardDidHide:(id)a3
{
}

- (void)_setContentInset:(double)a3
{
  double v5 = [(AKBasicLoginViewController *)self contentScrollView];
  [v5 contentInset];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = [(AKBasicLoginViewController *)self contentScrollView];
  objc_msgSend(v12, "setContentInset:", v7, v9, a3, v11);

  id v13 = [(AKBasicLoginViewController *)self contentScrollView];
  objc_msgSend(v13, "setScrollIndicatorInsets:", v7, v9, a3, v11);
}

- (AKBasicLoginActions)loginActions
{
  return self->_loginActions;
}

- (void)setLoginActions:(id)a3
{
}

- (AKBasicLoginControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKBasicLoginControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AKAppleIDAuthenticationInAppContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);

  return (AKAppleIDAuthenticationInAppContext *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (UIView)loginOptions
{
  return self->_loginOptions;
}

- (void)setLoginOptions:(id)a3
{
}

- (AKBasicLoginOptionsViewController)loginOptionsViewController
{
  return self->_loginOptionsViewController;
}

- (void)setLoginOptionsViewController:(id)a3
{
}

- (id)passwordHandler
{
  return self->_passwordHandler;
}

- (void)setPasswordHandler:(id)a3
{
}

- (BOOL)isPasswordFieldVisible
{
  return self->_isPasswordFieldVisible;
}

- (void)setIsPasswordFieldVisible:(BOOL)a3
{
  self->_isPasswordFieldVisible = a3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSLayoutConstraint)heightAnchor
{
  return self->_heightAnchor;
}

- (void)setHeightAnchor:(id)a3
{
}

- (AKBasicLoginTableViewCell)usernameCell
{
  return self->_usernameCell;
}

- (void)setUsernameCell:(id)a3
{
}

- (AKBasicLoginTableViewCell)passwordCell
{
  return self->_passwordCell;
}

- (void)setPasswordCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordCell, 0);
  objc_storeStrong((id *)&self->_usernameCell, 0);
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong(&self->_passwordHandler, 0);
  objc_storeStrong((id *)&self->_loginOptionsViewController, 0);
  objc_storeStrong((id *)&self->_loginOptions, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_loginActions, 0);
}

@end