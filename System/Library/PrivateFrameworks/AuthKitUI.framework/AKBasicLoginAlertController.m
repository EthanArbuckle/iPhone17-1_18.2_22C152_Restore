@interface AKBasicLoginAlertController
- (AKBasicLoginActions)loginActions;
- (AKBasicLoginAlertController)initWithAlertStyle:(int64_t)a3;
- (AKBasicLoginAlertController)initWithNibName:(id)a3 bundle:(id)a4;
- (AKBasicLoginControllerDelegate)delegate;
- (AKBasicLoginSecondFactorActions)secondFactorActions;
- (BOOL)disablesAutomaticKeyboardDismissal;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSString)authenticateButtonTitle;
- (NSString)authenticateTitle;
- (NSString)cancelButtonTitle;
- (NSString)generatedCode;
- (NSString)password;
- (NSString)reason;
- (NSString)username;
- (id)_passwordField;
- (id)_wrappedCancelAction;
- (int64_t)alertStyle;
- (void)_beginObservingDidEnterCodeNotifications;
- (void)_didEnterCode:(id)a3;
- (void)_dismissAndShowiForgot:(id)a3;
- (void)_endObservingDidEnterCodeNotifications;
- (void)_passwordFieldDidChange:(id)a3;
- (void)_setupAuthenticateAndCancelButtons;
- (void)_setupAuthenticateAndCancelButtonsWithIForgot:(BOOL)a3;
- (void)_setupViewControllerForAlertStyle;
- (void)_setupViewControllerForDefaultStyle;
- (void)_setupViewControllerForIForgotStyle;
- (void)_setupViewControllerForNonEditableUsernameFieldStyle;
- (void)_setupViewControllerForSecondFactorEntryStyle:(int64_t)a3;
- (void)_setupViewControllerForUserOrCreateAppleIDStyle;
- (void)_syncUsernameAndPasswordPropertiesWithTextFieldContent;
- (void)clearPasswordField;
- (void)clearSecondFactorEntry;
- (void)dealloc;
- (void)jiggleAView;
- (void)setAlertStyle:(int64_t)a3;
- (void)setAuthenticateButtonTitle:(id)a3;
- (void)setAuthenticateTitle:(id)a3;
- (void)setCancelButtonTitle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGeneratedCode:(id)a3;
- (void)setLoginActions:(id)a3;
- (void)setPasscodeFieldDisabled:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setReason:(id)a3;
- (void)setSecondFactorActions:(id)a3;
- (void)setUsername:(id)a3;
- (void)startAnimating;
- (void)stopAnimating;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AKBasicLoginAlertController

- (AKBasicLoginAlertController)initWithAlertStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AKBasicLoginAlertController;
  v4 = [(AKBasicLoginAlertController *)&v7 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    [(AKBasicLoginAlertController *)v4 setPreferredStyle:1];
    [(AKBasicLoginAlertController *)v5 setAlertStyle:a3];
    [(AKBasicLoginAlertController *)v5 _beginObservingDidEnterCodeNotifications];
  }
  return v5;
}

- (AKBasicLoginAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AKBasicLoginAlertController;
  v4 = [(AKBasicLoginAlertController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    [(AKBasicLoginAlertController *)v4 setPreferredStyle:1];
    [(AKBasicLoginAlertController *)v5 _setupViewControllerForAlertStyle];
    [(AKBasicLoginAlertController *)v5 _beginObservingDidEnterCodeNotifications];
  }
  return v5;
}

- (void)dealloc
{
  [(AKBasicLoginAlertController *)self _endObservingDidEnterCodeNotifications];
  v3.receiver = self;
  v3.super_class = (Class)AKBasicLoginAlertController;
  [(AKBasicLoginAlertController *)&v3 dealloc];
}

- (void)_setupViewControllerForAlertStyle
{
  [(AKBasicLoginAlertController *)self _removeAllTextFields];
  [(AKBasicLoginAlertController *)self setTitle:0];
  [(AKBasicLoginAlertController *)self setMessage:0];
  [(AKBasicLoginAlertController *)self setPreferredAction:0];
  switch([(AKBasicLoginAlertController *)self alertStyle])
  {
    case 0:
      [(AKBasicLoginAlertController *)self _setupViewControllerForDefaultStyle];
      break;
    case 1:
      [(AKBasicLoginAlertController *)self _setupViewControllerForNonEditableUsernameFieldStyle];
      break;
    case 2:
      [(AKBasicLoginAlertController *)self _setupViewControllerForUserOrCreateAppleIDStyle];
      break;
    case 3:
      [(AKBasicLoginAlertController *)self _setupViewControllerForIForgotStyle];
      break;
    case 4:
      objc_super v3 = self;
      uint64_t v4 = 4;
      goto LABEL_16;
    case 5:
      objc_super v3 = self;
      uint64_t v4 = 5;
LABEL_16:
      [(AKBasicLoginAlertController *)v3 _setupViewControllerForSecondFactorEntryStyle:v4];
      break;
    default:
      return;
  }
}

- (id)_wrappedCancelAction
{
  objc_initWeak(&location, self);
  uint64_t v4 = (void *)MEMORY[0x1E4F42720];
  v5 = [(AKBasicLoginAlertController *)self cancelButtonTitle];
  v6 = v5;
  if (!v5)
  {
    v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = [v2 localizedStringForKey:@"ALERT_CANCEL" value:&stru_1F1EE8138 table:@"Localizable"];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__AKBasicLoginAlertController__wrappedCancelAction__block_invoke;
  v9[3] = &unk_1E648FDA0;
  objc_copyWeak(&v10, &location);
  objc_super v7 = [v4 actionWithTitle:v6 style:1 handler:v9];
  if (!v5)
  {
  }
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

void __51__AKBasicLoginAlertController__wrappedCancelAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    v2 = [WeakRetained loginActions];
    objc_super v3 = objc_msgSend(v2, "ak_cancelAction");

    if (v3)
    {
      uint64_t v4 = [v9 loginActions];
    }
    else
    {
      v5 = [v9 secondFactorActions];
      v6 = objc_msgSend(v5, "ak_cancelAction");

      id WeakRetained = v9;
      if (!v6) {
        goto LABEL_7;
      }
      uint64_t v4 = [v9 secondFactorActions];
    }
    objc_super v7 = v4;
    objc_msgSend(v4, "ak_cancelAction");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

    id WeakRetained = v9;
  }
LABEL_7:
}

- (void)_syncUsernameAndPasswordPropertiesWithTextFieldContent
{
  int64_t v3 = [(AKBasicLoginAlertController *)self alertStyle];
  if (v3 == 1)
  {
    id v15 = [(AKBasicLoginAlertController *)self username];
    v6 = [(AKBasicLoginAlertController *)self textFields];
    objc_super v7 = v6;
    uint64_t v8 = 0;
    goto LABEL_5;
  }
  if (!v3)
  {
    uint64_t v4 = [(AKBasicLoginAlertController *)self textFields];
    v5 = [v4 objectAtIndexedSubscript:0];
    id v15 = [v5 text];

    v6 = [(AKBasicLoginAlertController *)self textFields];
    objc_super v7 = v6;
    uint64_t v8 = 1;
LABEL_5:
    id v9 = [v6 objectAtIndexedSubscript:v8];
    id v10 = [v9 text];

    goto LABEL_7;
  }
  id v15 = [(AKBasicLoginAlertController *)self username];
  id v10 = [(AKBasicLoginAlertController *)self password];
LABEL_7:
  v11 = (NSString *)[v15 copy];
  ak_username = self->_ak_username;
  self->_ak_username = v11;

  v13 = (NSString *)[v10 copy];
  ak_password = self->_ak_password;
  self->_ak_password = v13;
}

- (void)_setupAuthenticateAndCancelButtons
{
}

- (void)_setupAuthenticateAndCancelButtonsWithIForgot:(BOOL)a3
{
  BOOL v3 = a3;
  v22[3] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__AKBasicLoginAlertController__setupAuthenticateAndCancelButtonsWithIForgot___block_invoke;
  v18[3] = &unk_1E648FDA0;
  objc_copyWeak(&v19, &location);
  v5 = (void *)MEMORY[0x1C8777520](v18);
  v6 = (void *)0x1E4F42000;
  if (v3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F42720];
    uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"FORGOT_PASSWORD_ALERT" value:&stru_1F1EE8138 table:@"Localizable"];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __77__AKBasicLoginAlertController__setupAuthenticateAndCancelButtonsWithIForgot___block_invoke_2;
    v17[3] = &unk_1E648FDC8;
    v17[4] = self;
    id v10 = [v7 actionWithTitle:v9 style:0 handler:v17];
  }
  else
  {
    id v10 = 0;
  }
  v11 = (void *)MEMORY[0x1E4F42720];
  v12 = [(AKBasicLoginAlertController *)self authenticateButtonTitle];
  v13 = v12;
  if (!v12)
  {
    v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v13 = [v6 localizedStringForKey:@"SIGN_IN" value:&stru_1F1EE8138 table:@"Localizable"];
  }
  v14 = [v11 _actionWithTitle:v13 descriptiveText:0 image:0 style:0 handler:v5 shouldDismissHandler:&__block_literal_global_5];
  if (!v12)
  {
  }
  if (v10)
  {
    v22[0] = v14;
    v22[1] = v10;
    id v15 = [(AKBasicLoginAlertController *)self _wrappedCancelAction];
    v22[2] = v15;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  }
  else
  {
    v21[0] = v14;
    id v15 = [(AKBasicLoginAlertController *)self _wrappedCancelAction];
    v21[1] = v15;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v16 = };
  [(AKBasicLoginAlertController *)self _setActions:v16];

  [(AKBasicLoginAlertController *)self setPreferredAction:v14];
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __77__AKBasicLoginAlertController__setupAuthenticateAndCancelButtonsWithIForgot___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _syncUsernameAndPasswordPropertiesWithTextFieldContent];
  v1 = [WeakRetained loginActions];
  v2 = [v1 authenticateAction];

  if (v2)
  {
    BOOL v3 = [WeakRetained loginActions];
    uint64_t v4 = [v3 authenticateAction];
    v5 = [WeakRetained username];
    v6 = [WeakRetained password];
    ((void (**)(void, void *, void *))v4)[2](v4, v5, v6);
  }
}

uint64_t __77__AKBasicLoginAlertController__setupAuthenticateAndCancelButtonsWithIForgot___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissAndShowiForgot:0];
}

uint64_t __77__AKBasicLoginAlertController__setupAuthenticateAndCancelButtonsWithIForgot___block_invoke_3()
{
  return 0;
}

- (void)_setupViewControllerForDefaultStyle
{
  v6 = [(AKBasicLoginAlertController *)self contentViewController];
  if (!v6)
  {
    v6 = [[AKBasicLoginContentViewController alloc] initWithNibName:0 bundle:0];
    [(AKBasicLoginAlertController *)self setContentViewController:v6];
  }
  uint64_t v7 = [(AKBasicLoginAlertController *)self authenticateTitle];
  uint64_t v8 = (void *)v7;
  if (v7)
  {
    int v9 = 0;
    int v10 = 0;
    v11 = (void *)v7;
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F28B50];
    v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v4 = @"APPLE_ID_SIGN_IN_HEADER";
    int v13 = [@"APPLE_ID_SIGN_IN_HEADER" containsString:@"REBRAND"];
    if (v13)
    {
      int v10 = 0;
    }
    else
    {
      v2 = [MEMORY[0x1E4F4F020] sharedManager];
      if ([v2 isAABrandingEnabled])
      {
        uint64_t v4 = [@"APPLE_ID_SIGN_IN_HEADER" stringByAppendingString:@"_REBRAND"];
        int v10 = 1;
      }
      else
      {
        int v10 = 0;
      }
    }
    int v9 = v13 ^ 1;
    BOOL v3 = v12;
    v11 = [v12 localizedStringForKey:v4 value:&stru_1F1EE8138 table:@"Localizable"];
  }
  v14 = [(AKBasicLoginContentViewController *)v6 contentContainerView];
  [v14 setTitleText:v11];

  if (v8)
  {
    if (!v10) {
      goto LABEL_13;
    }
  }
  else
  {

    if (!v10)
    {
LABEL_13:
      if (!v9) {
        goto LABEL_14;
      }
LABEL_21:

      if (v8) {
        goto LABEL_15;
      }
      goto LABEL_22;
    }
  }

  if (v9) {
    goto LABEL_21;
  }
LABEL_14:
  if (v8) {
    goto LABEL_15;
  }
LABEL_22:

LABEL_15:
  id v15 = [(AKBasicLoginAlertController *)self reason];
  v16 = [(AKBasicLoginContentViewController *)v6 contentContainerView];
  [v16 setMessageText:v15];

  v17 = (void *)MEMORY[0x1E4F4F0E0];
  v18 = [(AKBasicLoginAlertController *)self username];
  id v19 = [v17 formattedUsernameFromUsername:v18];

  v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  if ([@"APPLE_ID_ALERT_PLACEHOLDER" containsString:@"REBRAND"])
  {
    v21 = [v20 localizedStringForKey:@"APPLE_ID_ALERT_PLACEHOLDER" value:&stru_1F1EE8138 table:@"Localizable"];
  }
  else
  {
    v22 = [MEMORY[0x1E4F4F020] sharedManager];
    if ([v22 isAABrandingEnabled])
    {
      v23 = [@"APPLE_ID_ALERT_PLACEHOLDER" stringByAppendingString:@"_REBRAND"];
      v21 = [v20 localizedStringForKey:v23 value:&stru_1F1EE8138 table:@"Localizable"];
    }
    else
    {
      v21 = [v20 localizedStringForKey:@"APPLE_ID_ALERT_PLACEHOLDER" value:&stru_1F1EE8138 table:@"Localizable"];
    }
  }
  v24 = [MEMORY[0x1E4F4F010] currentDevice];
  int v25 = [v24 isMultiUserMode];
  v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v27 = v26;
  if (v25) {
    v28 = @"PASSCODE_ALERT_PLACEHOLDER";
  }
  else {
    v28 = @"PASSWORD_ALERT_PLACEHOLDER";
  }
  v29 = [v26 localizedStringForKey:v28 value:&stru_1F1EE8138 table:@"Localizable"];

  objc_initWeak(&location, self);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __66__AKBasicLoginAlertController__setupViewControllerForDefaultStyle__block_invoke;
  v36[3] = &unk_1E648FE10;
  id v30 = v19;
  id v37 = v30;
  id v31 = v21;
  id v38 = v31;
  [(AKBasicLoginAlertController *)self addTextFieldWithConfigurationHandler:v36];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __66__AKBasicLoginAlertController__setupViewControllerForDefaultStyle__block_invoke_2;
  v33[3] = &unk_1E648FE38;
  objc_copyWeak(&v35, &location);
  id v32 = v29;
  id v34 = v32;
  [(AKBasicLoginAlertController *)self addTextFieldWithConfigurationHandler:v33];
  [(AKBasicLoginAlertController *)self _setupAuthenticateAndCancelButtons];

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

void __66__AKBasicLoginAlertController__setupViewControllerForDefaultStyle__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setKeyboardType:7];
  [v4 setText:*(void *)(a1 + 32)];
  [v4 setBorderStyle:0];
  BOOL v3 = [MEMORY[0x1E4F428B8] clearColor];
  [v4 setBackgroundColor:v3];

  [v4 setTextContentType:*MEMORY[0x1E4F43E18]];
  [v4 setPlaceholder:*(void *)(a1 + 40)];
}

void __66__AKBasicLoginAlertController__setupViewControllerForDefaultStyle__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [v6 setSecureTextEntry:1];
    [v6 setBorderStyle:0];
    id v4 = [MEMORY[0x1E4F428B8] clearColor];
    [v6 setBackgroundColor:v4];

    [v6 setDelegate:WeakRetained];
    [v6 setEnablesReturnKeyAutomatically:1];
    [v6 setTextContentType:*MEMORY[0x1E4F43DD8]];
    [v6 setPlaceholder:*(void *)(a1 + 32)];
    [v6 addTarget:WeakRetained action:sel__passwordFieldDidChange_ forControlEvents:0x20000];
    id v5 = (id)objc_msgSend(v6, "ak_addForgotButtonWithTarget:action:", WeakRetained, sel__dismissAndShowiForgot_);
  }
}

- (void)_setupViewControllerForNonEditableUsernameFieldStyle
{
  BOOL v3 = [(AKBasicLoginAlertController *)self contentViewController];
  if (!v3)
  {
    BOOL v3 = [[AKBasicLoginContentViewController alloc] initWithNibName:0 bundle:0];
    [(AKBasicLoginAlertController *)self setContentViewController:v3];
  }
  id v4 = (void *)0x1E4F4F000;
  id v5 = [MEMORY[0x1E4F4F010] currentDevice];
  char v6 = [v5 isMultiUserMode];
  uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v8 = v7;
  if (v6)
  {
    int v9 = [v7 localizedStringForKey:@"APPLE_ID_PASSCODE_HEADER_IPAD" value:&stru_1F1EE8138 table:@"Localizable"];
  }
  else
  {
    int v10 = @"APPLE_ID_PASSWORD_HEADER";
    char v11 = [@"APPLE_ID_PASSWORD_HEADER" containsString:@"REBRAND"];
    if (v11)
    {
      int v12 = 0;
    }
    else
    {
      id v4 = [MEMORY[0x1E4F4F020] sharedManager];
      if ([v4 isAABrandingEnabled])
      {
        int v10 = [@"APPLE_ID_PASSWORD_HEADER" stringByAppendingString:@"_REBRAND"];
        int v12 = 1;
      }
      else
      {
        int v12 = 0;
      }
    }
    int v9 = [v8 localizedStringForKey:v10 value:&stru_1F1EE8138 table:@"Localizable"];
    if (v12) {

    }
    if ((v11 & 1) == 0) {
  }
    }

  uint64_t v13 = [(AKBasicLoginAlertController *)self authenticateTitle];
  v14 = (void *)v13;
  if (v13) {
    id v15 = (void *)v13;
  }
  else {
    id v15 = v9;
  }
  v16 = [(AKBasicLoginContentViewController *)v3 contentContainerView];
  [v16 setTitleText:v15];

  v17 = [(AKBasicLoginAlertController *)self reason];
  v18 = [(AKBasicLoginContentViewController *)v3 contentContainerView];
  [v18 setMessageText:v17];

  id v19 = [MEMORY[0x1E4F4F010] currentDevice];
  LODWORD(v18) = [v19 isMultiUserMode];
  v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v21 = v20;
  if (v18) {
    v22 = @"PASSCODE_ALERT_PLACEHOLDER";
  }
  else {
    v22 = @"PASSWORD_ALERT_PLACEHOLDER";
  }
  v23 = [v20 localizedStringForKey:v22 value:&stru_1F1EE8138 table:@"Localizable"];

  objc_initWeak(&location, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __83__AKBasicLoginAlertController__setupViewControllerForNonEditableUsernameFieldStyle__block_invoke;
  v25[3] = &unk_1E648FE38;
  objc_copyWeak(&v27, &location);
  id v24 = v23;
  id v26 = v24;
  [(AKBasicLoginAlertController *)self addTextFieldWithConfigurationHandler:v25];
  [(AKBasicLoginAlertController *)self _setupAuthenticateAndCancelButtons];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __83__AKBasicLoginAlertController__setupViewControllerForNonEditableUsernameFieldStyle__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [v6 setSecureTextEntry:1];
    [v6 setBorderStyle:0];
    id v4 = [MEMORY[0x1E4F428B8] clearColor];
    [v6 setBackgroundColor:v4];

    [v6 setDelegate:WeakRetained];
    [v6 setEnablesReturnKeyAutomatically:1];
    [v6 setTextContentType:*MEMORY[0x1E4F43DD8]];
    [v6 setPlaceholder:*(void *)(a1 + 32)];
    [v6 addTarget:WeakRetained action:sel__passwordFieldDidChange_ forControlEvents:0x20000];
    id v5 = (id)objc_msgSend(v6, "ak_addForgotButtonWithTarget:action:", WeakRetained, sel__dismissAndShowiForgot_);
  }
}

- (void)_setupViewControllerForUserOrCreateAppleIDStyle
{
  v32[3] = *MEMORY[0x1E4F143B8];
  id v4 = [(AKBasicLoginAlertController *)self contentViewController];
  if (!v4)
  {
    id v4 = [[AKBasicLoginContentViewController alloc] initWithNibName:0 bundle:0];
    [(AKBasicLoginAlertController *)self setContentViewController:v4];
  }
  id v5 = [(AKBasicLoginAlertController *)self authenticateTitle];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [(AKBasicLoginAlertController *)self reason];
  }
  uint64_t v7 = [(AKBasicLoginContentViewController *)v4 contentContainerView];
  [v7 setTitleText:v6];

  if (!v5) {
  uint64_t v8 = [(AKBasicLoginContentViewController *)v4 contentContainerView];
  }
  [v8 setMessageText:0];

  objc_initWeak(&location, self);
  int v9 = (void *)MEMORY[0x1E4F42720];
  int v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v11 = [@"USE_APPLE_ID" containsString:@"REBRAND"];
  if (v11)
  {
    int v12 = 0;
    uint64_t v13 = @"USE_APPLE_ID";
  }
  else
  {
    v2 = [MEMORY[0x1E4F4F020] sharedManager];
    if ([v2 isAABrandingEnabled])
    {
      uint64_t v13 = [@"USE_APPLE_ID" stringByAppendingString:@"_REBRAND"];
      int v12 = 1;
    }
    else
    {
      int v12 = 0;
      uint64_t v13 = @"USE_APPLE_ID";
    }
  }
  v14 = [v10 localizedStringForKey:v13 value:&stru_1F1EE8138 table:@"Localizable"];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __78__AKBasicLoginAlertController__setupViewControllerForUserOrCreateAppleIDStyle__block_invoke;
  v29[3] = &unk_1E648FDA0;
  id v24 = &v30;
  objc_copyWeak(&v30, &location);
  id v26 = [v9 _actionWithTitle:v14 descriptiveText:0 image:0 style:0 handler:v29 shouldDismissHandler:&__block_literal_global_78];

  if (v12) {
  if ((v11 & 1) == 0)
  }

  id v15 = (void *)MEMORY[0x1E4F42720];
  v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v17 = [@"CREATE_APPLE_ID" containsString:@"REBRAND"];
  if (v17)
  {
    int v18 = 0;
    id v19 = @"CREATE_APPLE_ID";
  }
  else
  {
    v14 = objc_msgSend(MEMORY[0x1E4F4F020], "sharedManager", &v30);
    if ([v14 isAABrandingEnabled])
    {
      id v19 = [@"CREATE_APPLE_ID" stringByAppendingString:@"_REBRAND"];
      int v18 = 1;
    }
    else
    {
      int v18 = 0;
      id v19 = @"CREATE_APPLE_ID";
    }
  }
  v20 = objc_msgSend(v16, "localizedStringForKey:value:table:", v19, &stru_1F1EE8138, @"Localizable", v24);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __78__AKBasicLoginAlertController__setupViewControllerForUserOrCreateAppleIDStyle__block_invoke_3;
  v27[3] = &unk_1E648FDA0;
  objc_copyWeak(&v28, &location);
  v21 = [v15 actionWithTitle:v20 style:0 handler:v27];

  if (v18) {
  if ((v17 & 1) == 0)
  }

  v32[0] = v26;
  v32[1] = v21;
  v22 = [(AKBasicLoginAlertController *)self _wrappedCancelAction];
  v32[2] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
  [(AKBasicLoginAlertController *)self _setActions:v23];

  objc_destroyWeak(&v28);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

void __78__AKBasicLoginAlertController__setupViewControllerForUserOrCreateAppleIDStyle__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained loginActions];
  v2 = [v1 useIDAction];

  if (v2)
  {
    BOOL v3 = [WeakRetained loginActions];
    id v4 = [v3 useIDAction];
    v4[2]();
  }
}

uint64_t __78__AKBasicLoginAlertController__setupViewControllerForUserOrCreateAppleIDStyle__block_invoke_2()
{
  return 0;
}

void __78__AKBasicLoginAlertController__setupViewControllerForUserOrCreateAppleIDStyle__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained loginActions];
  v2 = [v1 createIDAction];

  if (v2)
  {
    BOOL v3 = [WeakRetained loginActions];
    id v4 = [v3 createIDAction];
    v4[2]();
  }
}

- (void)_setupViewControllerForIForgotStyle
{
  v34[3] = *MEMORY[0x1E4F143B8];
  [(AKBasicLoginAlertController *)self setContentViewController:0];
  objc_initWeak(&location, self);
  id v4 = (void *)MEMORY[0x1E4F42720];
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v6 = [@"FORGOT_APPLE_ID" containsString:@"REBRAND"];
  if (v6)
  {
    int v7 = 0;
    uint64_t v8 = @"FORGOT_APPLE_ID";
  }
  else
  {
    v2 = [MEMORY[0x1E4F4F020] sharedManager];
    if ([v2 isAABrandingEnabled])
    {
      uint64_t v8 = [@"FORGOT_APPLE_ID" stringByAppendingString:@"_REBRAND"];
      int v7 = 1;
    }
    else
    {
      int v7 = 0;
      uint64_t v8 = @"FORGOT_APPLE_ID";
    }
  }
  int v9 = [v5 localizedStringForKey:v8 value:&stru_1F1EE8138 table:@"Localizable"];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __66__AKBasicLoginAlertController__setupViewControllerForIForgotStyle__block_invoke;
  v31[3] = &unk_1E648FDA0;
  id v24 = &v32;
  objc_copyWeak(&v32, &location);
  int v10 = [v4 actionWithTitle:v9 style:0 handler:v31];

  if (v7) {
  if ((v6 & 1) == 0)
  }

  char v11 = (void *)MEMORY[0x1E4F42720];
  int v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v13 = [v12 localizedStringForKey:@"FORGOT_PASSWORD_ALERT" value:&stru_1F1EE8138 table:@"Localizable"];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  id v28 = __66__AKBasicLoginAlertController__setupViewControllerForIForgotStyle__block_invoke_2;
  v29 = &unk_1E648FDA0;
  objc_copyWeak(&v30, &location);
  v14 = [v11 actionWithTitle:v13 style:0 handler:&v26];

  v34[0] = v10;
  v34[1] = v14;
  id v15 = [(AKBasicLoginAlertController *)self _wrappedCancelAction];
  v34[2] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
  [(AKBasicLoginAlertController *)self _setActions:v16];

  char v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v18 = [v17 localizedStringForKey:@"FORGOT_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];
  [(AKBasicLoginAlertController *)self setTitle:v18];

  id v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v20 = [@"FORGOT_DESCRIPTION" containsString:@"REBRAND"];
  if (v20)
  {
    int v21 = 0;
    v22 = @"FORGOT_DESCRIPTION";
  }
  else
  {
    int v9 = objc_msgSend(MEMORY[0x1E4F4F020], "sharedManager", &v32, v26, v27, v28, v29);
    if ([v9 isAABrandingEnabled])
    {
      v22 = [@"FORGOT_DESCRIPTION" stringByAppendingString:@"_REBRAND"];
      int v21 = 1;
    }
    else
    {
      int v21 = 0;
      v22 = @"FORGOT_DESCRIPTION";
    }
  }
  v23 = objc_msgSend(v19, "localizedStringForKey:value:table:", v22, &stru_1F1EE8138, @"Localizable", v24);
  [(AKBasicLoginAlertController *)self setMessage:v23];

  if (v21) {
  if ((v20 & 1) == 0)
  }

  objc_destroyWeak(&v30);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

void __66__AKBasicLoginAlertController__setupViewControllerForIForgotStyle__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained loginActions];
  v2 = [v1 forgotIDAction];

  if (v2)
  {
    BOOL v3 = [WeakRetained loginActions];
    id v4 = [v3 forgotIDAction];
    v4[2]();
  }
}

void __66__AKBasicLoginAlertController__setupViewControllerForIForgotStyle__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    v2 = [WeakRetained loginActions];
    BOOL v3 = [v2 forgotPasswordAction];

    id WeakRetained = v7;
    if (v3)
    {
      [v7 _syncUsernameAndPasswordPropertiesWithTextFieldContent];
      id v4 = [v7 loginActions];
      id v5 = [v4 forgotPasswordAction];
      char v6 = [v7 username];
      ((void (**)(void, void *))v5)[2](v5, v6);

      id WeakRetained = v7;
    }
  }
}

- (void)_setupViewControllerForSecondFactorEntryStyle:(int64_t)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v5 = [(AKBasicLoginAlertController *)self contentViewController];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v6 = v5;
  }
  else
  {
    char v6 = [[AKSecondFactorCodeEntryContentViewController alloc] initWithNibName:0 bundle:0];

    if (a3 == 5) {
      [(AKSecondFactorCodeEntryContentViewController *)v6 setPiggybackingForTrustedDevice:1];
    }
    [(AKBasicLoginAlertController *)self setContentViewController:v6];
  }
  id v7 = [(AKBasicLoginAlertController *)self reason];
  [(AKSecondFactorCodeEntryContentViewController *)v6 setReason:v7];

  objc_initWeak(&location, self);
  uint64_t v8 = (void *)MEMORY[0x1E4F42720];
  int v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v10 = [v9 localizedStringForKey:@"DIDNT_GET_A_CODE" value:&stru_1F1EE8138 table:@"Localizable"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__AKBasicLoginAlertController__setupViewControllerForSecondFactorEntryStyle___block_invoke;
  v14[3] = &unk_1E648FDA0;
  objc_copyWeak(&v15, &location);
  char v11 = [v8 actionWithTitle:v10 style:0 handler:v14];

  v17[0] = v11;
  int v12 = [(AKBasicLoginAlertController *)self _wrappedCancelAction];
  v17[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  [(AKBasicLoginAlertController *)self _setActions:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __77__AKBasicLoginAlertController__setupViewControllerForSecondFactorEntryStyle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained secondFactorActions];
  v2 = [v1 regenerateCodeAction];

  if (v2)
  {
    BOOL v3 = [WeakRetained secondFactorActions];
    id v4 = [v3 regenerateCodeAction];
    v4[2]();
  }
}

- (void)_dismissAndShowiForgot:(id)a3
{
  id v4 = [(AKBasicLoginAlertController *)self loginActions];
  id v5 = [v4 forgotPasswordAction];

  if (v5)
  {
    [(AKBasicLoginAlertController *)self _syncUsernameAndPasswordPropertiesWithTextFieldContent];
    id v7 = [(AKBasicLoginAlertController *)self loginActions];
    char v6 = [v7 forgotPasswordAction];
    ((void (**)(void, NSString *))v6)[2](v6, self->_ak_username);
  }
}

- (void)setAlertStyle:(int64_t)a3
{
  self->_alertStyle = a3;
  [(AKBasicLoginAlertController *)self _setupViewControllerForAlertStyle];
}

- (int64_t)alertStyle
{
  return self->_alertStyle;
}

- (void)setUsername:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  ak_username = self->_ak_username;
  self->_ak_username = v4;

  [(AKBasicLoginAlertController *)self _setupViewControllerForAlertStyle];
}

- (NSString)username
{
  v2 = (void *)[(NSString *)self->_ak_username copy];

  return (NSString *)v2;
}

- (void)setPassword:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  ak_password = self->_ak_password;
  self->_ak_password = v4;

  [(AKBasicLoginAlertController *)self _setupViewControllerForAlertStyle];
}

- (NSString)password
{
  v2 = (void *)[(NSString *)self->_ak_password copy];

  return (NSString *)v2;
}

- (void)setAuthenticateTitle:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  ak_title = self->_ak_title;
  self->_ak_title = v4;

  [(AKBasicLoginAlertController *)self _setupViewControllerForAlertStyle];
}

- (NSString)authenticateTitle
{
  v2 = (void *)[(NSString *)self->_ak_title copy];

  return (NSString *)v2;
}

- (void)setReason:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  ak_reason = self->_ak_reason;
  self->_ak_reason = v4;

  [(AKBasicLoginAlertController *)self _setupViewControllerForAlertStyle];
}

- (NSString)reason
{
  v2 = (void *)[(NSString *)self->_ak_reason copy];

  return (NSString *)v2;
}

- (void)setAuthenticateButtonTitle:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  ak_authenticateButtonTitle = self->_ak_authenticateButtonTitle;
  self->_ak_authenticateButtonTitle = v4;

  [(AKBasicLoginAlertController *)self _setupViewControllerForAlertStyle];
}

- (NSString)authenticateButtonTitle
{
  v2 = (void *)[(NSString *)self->_ak_authenticateButtonTitle copy];

  return (NSString *)v2;
}

- (void)setCancelButtonTitle:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  ak_cancelButtonTitle = self->_ak_cancelButtonTitle;
  self->_ak_cancelButtonTitle = v4;

  [(AKBasicLoginAlertController *)self _setupViewControllerForAlertStyle];
}

- (NSString)cancelButtonTitle
{
  v2 = (void *)[(NSString *)self->_ak_cancelButtonTitle copy];

  return (NSString *)v2;
}

- (void)clearSecondFactorEntry
{
  BOOL v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1C38C1000, v3, OS_LOG_TYPE_DEFAULT, "Received request to clear 2FA Entry Field", v7, 2u);
  }

  id v4 = [(AKBasicLoginAlertController *)self contentViewController];
  int v5 = [v4 conformsToProtocol:&unk_1F1F25B40];

  if (v5)
  {
    char v6 = [(AKBasicLoginAlertController *)self contentViewController];
    [v6 clearSecondFactorEntry];
  }
}

- (void)setPasscodeFieldDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(AKBasicLoginAlertController *)self contentViewController];
  int v6 = [v5 conformsToProtocol:&unk_1F1F25B40];

  if (v6)
  {
    id v7 = [(AKBasicLoginAlertController *)self contentViewController];
    [v7 setPasscodeFieldDisabled:v3];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKBasicLoginAlertController;
  [(AKBasicLoginAlertController *)&v5 viewDidAppear:a3];
  id v4 = [(AKBasicLoginAlertController *)self delegate];
  [v4 basicLoginControllerDidPresent:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKBasicLoginAlertController;
  [(AKBasicLoginAlertController *)&v5 viewWillDisappear:a3];
  id v4 = [(AKBasicLoginAlertController *)self delegate];
  [v4 basicLoginControllerWillDismiss:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKBasicLoginAlertController;
  [(AKBasicLoginAlertController *)&v5 viewDidDisappear:a3];
  id v4 = [(AKBasicLoginAlertController *)self delegate];
  [v4 basicLoginControllerDidDismiss:self];
}

- (id)_passwordField
{
  v2 = [(AKBasicLoginAlertController *)self textFields];
  BOOL v3 = (void *)[v2 copy];

  uint64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_149];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v5 = 0;
  }
  else
  {
    objc_super v5 = [v3 objectAtIndexedSubscript:v4];
  }

  return v5;
}

uint64_t __45__AKBasicLoginAlertController__passwordField__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSecureTextEntry];
}

- (BOOL)disablesAutomaticKeyboardDismissal
{
  return 1;
}

- (void)startAnimating
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (![(AKBasicLoginAlertController *)self alertStyle]
    || [(AKBasicLoginAlertController *)self alertStyle] == 1)
  {
    BOOL v3 = [(AKBasicLoginAlertController *)self textFields];
    uint64_t v4 = [v3 lastObject];
    [v4 _beginPinningInputViews];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  objc_super v5 = [(AKBasicLoginAlertController *)self textFields];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v9++) setEnabled:0];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v10 = [(AKBasicLoginAlertController *)self actions];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v14++) setEnabled:0];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  id v15 = [(AKBasicLoginAlertController *)self _passwordField];
  id v16 = (id)objc_msgSend(v15, "ak_addActivityIndicator");
}

- (void)stopAnimating
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  BOOL v3 = [(AKBasicLoginAlertController *)self textFields];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v29;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * v7++) setEnabled:1];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v5);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = [(AKBasicLoginAlertController *)self actions];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * v12++) setEnabled:1];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v10);
  }

  uint64_t v13 = [(AKBasicLoginAlertController *)self _passwordField];
  uint64_t v14 = [v13 text];
  uint64_t v15 = [v14 length];

  if (v15) {
    [v13 setRightView:0];
  }
  else {
    id v16 = (id)objc_msgSend(v13, "ak_addForgotButtonWithTarget:action:", self, sel__dismissAndShowiForgot_);
  }
  long long v17 = [(AKBasicLoginAlertController *)self textFields];
  long long v18 = [v17 lastObject];
  [v18 becomeFirstResponder];

  long long v19 = [(AKBasicLoginAlertController *)self textFields];
  long long v20 = [v19 lastObject];
  int v21 = [v20 _isPinningInputViews];

  if (v21)
  {
    long long v22 = [(AKBasicLoginAlertController *)self textFields];
    long long v23 = [v22 lastObject];
    [v23 _endPinningInputViews];
  }
}

- (void)jiggleAView
{
  BOOL v3 = [(AKBasicLoginAlertController *)self contentViewController];
  int v4 = [v3 conformsToProtocol:&unk_1F1F25B40];

  if (v4)
  {
    id v7 = [(AKBasicLoginAlertController *)self contentViewController];
    [v7 jiggleAView];
  }
  else
  {
    uint64_t v5 = [(AKBasicLoginAlertController *)self view];
    id v7 = [v5 layer];

    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F39B30], "ak_jiggleAnimation");
    [v7 addAnimation:v6 forKey:@"jiggle"];
  }
}

- (void)clearPasswordField
{
  id v3 = [(AKBasicLoginAlertController *)self _passwordField];
  [v3 setText:0];
  [(AKBasicLoginAlertController *)self _passwordFieldDidChange:v3];
}

- (void)_passwordFieldDidChange:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v10 = v4;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = v10;
    if (!v10) {
      goto LABEL_11;
    }
    uint64_t v6 = [v10 text];
    if ([v6 length]
      || ([v10 rightView], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
    {
      if ([v6 length])
      {
        uint64_t v8 = [v10 rightView];

        if (v8) {
          [v10 setRightView:0];
        }
      }
    }
    else
    {
      id v9 = (id)objc_msgSend(v10, "ak_addForgotButtonWithTarget:action:", self, sel__dismissAndShowiForgot_);
    }
  }
  uint64_t v5 = v10;
LABEL_11:
}

- (void)_beginObservingDidEnterCodeNotifications
{
  objc_initWeak(&location, self);
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = [MEMORY[0x1E4F28F08] mainQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__AKBasicLoginAlertController__beginObservingDidEnterCodeNotifications__block_invoke;
  v7[3] = &unk_1E648FE80;
  objc_copyWeak(&v8, &location);
  uint64_t v5 = [v3 addObserverForName:@"AKSecondFactorCodeEntryContentViewControllerDidEnterCodeNotification" object:0 queue:v4 usingBlock:v7];
  didEnterCodeObserver = self->_didEnterCodeObserver;
  self->_didEnterCodeObserver = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __71__AKBasicLoginAlertController__beginObservingDidEnterCodeNotifications__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _didEnterCode:v3];
}

- (void)_didEnterCode:(id)a3
{
  id v8 = a3;
  id v4 = [(AKBasicLoginAlertController *)self secondFactorActions];
  uint64_t v5 = [v4 codeEnteredAction];

  if (v5)
  {
    uint64_t v6 = [v8 userInfo];
    id v7 = [v6 objectForKeyedSubscript:@"generatedCode"];
    ((void (**)(void, void *))v5)[2](v5, v7);
  }
}

- (void)_endObservingDidEnterCodeNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_didEnterCodeObserver];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (NSString)generatedCode
{
  return self->_generatedCode;
}

- (void)setGeneratedCode:(id)a3
{
}

- (AKBasicLoginActions)loginActions
{
  return self->_loginActions;
}

- (void)setLoginActions:(id)a3
{
}

- (AKBasicLoginSecondFactorActions)secondFactorActions
{
  return self->_secondFactorActions;
}

- (void)setSecondFactorActions:(id)a3
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secondFactorActions, 0);
  objc_storeStrong((id *)&self->_loginActions, 0);
  objc_storeStrong((id *)&self->_generatedCode, 0);
  objc_storeStrong((id *)&self->_ak_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_ak_authenticateButtonTitle, 0);
  objc_storeStrong((id *)&self->_ak_reason, 0);
  objc_storeStrong((id *)&self->_ak_title, 0);
  objc_storeStrong((id *)&self->_ak_password, 0);
  objc_storeStrong((id *)&self->_ak_username, 0);

  objc_storeStrong((id *)&self->_didEnterCodeObserver, 0);
}

@end