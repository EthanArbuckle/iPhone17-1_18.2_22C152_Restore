@interface CNFRegSignInController
- (BOOL)hideLearnMoreButton;
- (BOOL)passwordIsEmpty;
- (BOOL)usernameIsEmpty;
- (NSString)pendingPassword;
- (NSString)pendingUsername;
- (id)_rightButtonItem;
- (id)getPasswordForSpecifier:(id)a3;
- (id)getUserNameForSpecifier:(id)a3;
- (id)logName;
- (id)passwordTextField;
- (id)specifierList;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)usernameTextField;
- (id)validationString;
- (unint64_t)signinFailureCount;
- (void)__userTappedTextField;
- (void)_buildCreateAccountButtonSpecifierCache:(id)a3;
- (void)_buildCredentialSpecifierCache:(id)a3;
- (void)_buildSignInGroupSpecifierCache:(id)a3;
- (void)_buildSpecifierCache:(id)a3;
- (void)_finishSignInWithAccount:(id)a3 animated:(BOOL)a4;
- (void)_handleTimeout;
- (void)_incrementSigninFailureCount;
- (void)_launchForgotPasswordUrl;
- (void)_layoutLearnMoreButton;
- (void)_loadRegionsIfNecessary;
- (void)_resetSigninFailureCount;
- (void)_resignFirstResponders;
- (void)_returnKeyPressed;
- (void)_setFieldsEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)_setupAppearBlockForAccountAuthorizeWithAuthID:(id)a3 token:(id)a4;
- (void)_setupAppearBlockForNewPasswordWithAppleID:(id)a3;
- (void)_setupEventHandlers;
- (void)_showAccountNotAuthorizedSheetWithAuthID:(id)a3 token:(id)a4;
- (void)_showNewPasswordNeededSheetWithAppleID:(id)a3;
- (void)_showRegistrationFailureWithError:(id)a3;
- (void)_showSigninFailureAlert;
- (void)_startTimeout;
- (void)_updateControllerState;
- (void)_updateUI;
- (void)applicationDidResume;
- (void)cancelButtonTapped;
- (void)createAccountControllerDidFinish:(id)a3 withAppleId:(id)a4 authID:(id)a5 authToken:(id)a6;
- (void)dealloc;
- (void)forgotIDButtonTapped;
- (void)learnMorePressed:(id)a3;
- (void)loadView;
- (void)passwordFieldEmptyStateChanged:(id)a3 forSpecifier:(id)a4;
- (void)setCreateAccountButtonEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setHideLearnMoreButton:(BOOL)a3;
- (void)setPasswordEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setPasswordText:(id)a3;
- (void)setPendingPassword:(id)a3;
- (void)setPendingUsername:(id)a3;
- (void)setSignInButtonEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setSigninFailureCount:(unint64_t)a3;
- (void)setSpecifier:(id)a3;
- (void)setUsernameEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setUsernameText:(id)a3;
- (void)showCreateAccountController;
- (void)signInTapped:(id)a3;
- (void)signInWithUsername:(id)a3 password:(id)a4;
- (void)systemApplicationDidEnterBackground;
- (void)systemApplicationWillEnterForeground;
- (void)usernameFieldEmptyStateChanged:(id)a3 forSpecifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CNFRegSignInController

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNFRegSignInController;
  [(CNFRegFirstRunController *)&v4 dealloc];
}

- (id)specifierList
{
  uint64_t v69 = (int)*MEMORY[0x263F5FDB8];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v69);
  if (!v3)
  {
    int v4 = _os_feature_enabled_impl();
    v5 = [(CNFRegListController *)self regController];
    [v5 refreshSystemAccount];

    v6 = [(CNFRegListController *)self regController];
    int v7 = [v6 hasSystemAccount];

    if (v7)
    {
      v8 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "We have a system account available, using it", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
      self->_useSystemAccount = 1;
    }
    v9 = CNFRegLoadSpecifiersFromPlist(self, @"CNFRegSignIn", self);
    v10 = [v9 specifierForID:@"FACETIME_SIGNIN_USERNAME_ID"];
    v11 = CommunicationsSetupUIBundle();
    v12 = CNFRegStringTableName();
    if (v4) {
      v13 = @"FACETIME_USERNAME_DESCRIPTION_LABEL_APPLEACCOUNT";
    }
    else {
      v13 = @"FACETIME_USERNAME_DESCRIPTION_LABEL";
    }
    if (v4) {
      v14 = @"FACETIME_SIGNIN_FORGOT_BUTTON_LABEL_APPLEACCOUNT";
    }
    else {
      v14 = @"FACETIME_SIGNIN_FORGOT_BUTTON_LABEL";
    }
    v15 = [v11 localizedStringForKey:v13 value:&stru_26D05D4F8 table:v12];
    [v10 setName:v15];

    v16 = [v9 specifierForID:@"FACETIME_SIGNIN_PASSWORD_ID"];
    v17 = CommunicationsSetupUIBundle();
    v18 = CNFRegStringTableName();
    v19 = [v17 localizedStringForKey:@"FACETIME_PASSWORD_DESCRIPTION_LABEL" value:&stru_26D05D4F8 table:v18];
    [v16 setName:v19];

    v20 = [v9 specifierForID:@"FACETIME_SIGNIN_BUTTON_GROUP_ID"];
    v21 = CommunicationsSetupUIBundle();
    v22 = CNFRegStringTableName();
    v23 = [v21 localizedStringForKey:v14 value:&stru_26D05D4F8 table:v22];

    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    uint64_t v67 = *MEMORY[0x263F600C0];
    objc_msgSend(v20, "setProperty:forKey:", v25);

    uint64_t v66 = *MEMORY[0x263F600E8];
    objc_msgSend(v20, "setProperty:forKey:", v23);
    v26 = CNFRegiForgotURL();
    uint64_t v65 = *MEMORY[0x263F600F0];
    objc_msgSend(v20, "setProperty:forKey:", v26);

    v68 = v23;
    v72.length = [v23 length];
    v72.location = 0;
    v27 = NSStringFromRange(v72);
    uint64_t v64 = *MEMORY[0x263F600D0];
    objc_msgSend(v20, "setProperty:forKey:", v27);

    v28 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
    uint64_t v63 = *MEMORY[0x263F600E0];
    objc_msgSend(v20, "setProperty:forKey:", v28);

    v29 = [(CNFRegListController *)self regController];
    if ([v29 hasSystemAccount])
    {
      BOOL v30 = 1;
    }
    else
    {
      v31 = [(CNFRegListController *)self regController];
      v32 = [v31 guessedAccountName];
      BOOL v30 = v32 != 0;
    }
    v33 = [v9 specifierForID:@"FACETIME_SIGNIN_CREATE_ACCOUNT_ID"];
    if (v33) {
      int v34 = v4;
    }
    else {
      int v34 = 0;
    }
    if (v34 == 1)
    {
      v35 = CommunicationsSetupUIBundle();
      v36 = CNFRegStringTableName();
      [v35 localizedStringForKey:@"FACETIME_SIGNIN_CREATE_ACCOUNT_BUTTON_LABEL_APPLEACCOUNT" value:&stru_26D05D4F8 table:v36];
      v38 = int v37 = v4;

      [v33 setProperty:v38 forKey:*MEMORY[0x263F602D0]];
      [v33 setName:v38];

      int v4 = v37;
    }
    v39 = [v9 specifierForID:@"FACETIME_SIGNIN_CREATE_ACCOUNT_GROUP_ID"];
    if (v30)
    {
      [v9 removeObject:v39];

      v39 = [v9 specifierForID:@"FACETIME_SIGNIN_CREATE_ACCOUNT_ID"];
      [v9 removeObject:v39];
    }
    else
    {
      CommunicationsSetupUIBundle();
      v62 = v33;
      v41 = int v40 = v4;
      v42 = CNFRegStringTableName();
      v43 = [v41 localizedStringForKey:@"FACETIME_SIGNIN_CREATE_ACCOUNT_FOOTER_LEARN_MORE" value:&stru_26D05D4F8 table:v42];

      v44 = NSString;
      v45 = CommunicationsSetupUIBundle();
      v46 = CNFRegStringTableName();
      if (v40) {
        v47 = @"FACETIME_SIGNIN_CREATE_ACCOUNT_FOOTER_FORMAT_APPLEACCOUNT";
      }
      else {
        v47 = @"FACETIME_SIGNIN_CREATE_ACCOUNT_FOOTER_FORMAT";
      }
      v48 = [v45 localizedStringForKey:v47 value:&stru_26D05D4F8 table:v46];
      v49 = objc_msgSend(v44, "stringWithFormat:", v48, v43);

      v33 = v62;
      NSUInteger v50 = [v49 rangeOfString:v43];
      NSUInteger v52 = v51;
      v53 = (objc_class *)objc_opt_class();
      v54 = NSStringFromClass(v53);
      [v39 setProperty:v54 forKey:v67];

      [v39 setProperty:v49 forKey:v66];
      v55 = CNFRegAppleIDLearnMoreURL();
      [v39 setProperty:v55 forKey:v65];

      v73.location = v50;
      v73.length = v52;
      v56 = NSStringFromRange(v73);
      [v39 setProperty:v56 forKey:v64];

      v57 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
      [v39 setProperty:v57 forKey:v63];
    }
    [(CNFRegSignInController *)self _buildSpecifierCache:v9];
    v58 = [(CNFRegSignInController *)self presentingViewController];
    if (v58)
    {
      createAccountButtonSpecifier = self->_createAccountButtonSpecifier;

      if (createAccountButtonSpecifier) {
        *(void *)((char *)self->_createAccountButtonSpecifier + (int)*MEMORY[0x263F5FE10]) = 2;
      }
    }
    v60 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v69);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v69) = (Class)v9;

    [(CNFRegFirstRunController *)self _stopValidationModeAnimated:0];
    v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v69);
  }
  return v3;
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)CNFRegSignInController;
  [(CNFRegListController *)&v3 loadView];
  [(CNFRegSignInController *)self _layoutLearnMoreButton];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegSignInController;
  [(CNFRegSignInController *)&v4 viewDidLoad];
  objc_super v3 = [(CNFRegSignInController *)self table];
  [v3 setShowsVerticalScrollIndicator:0];
}

- (void)setHideLearnMoreButton:(BOOL)a3
{
  if (self->_hideLearnMoreButton != a3)
  {
    self->_hideLearnMoreButton = a3;
    if ([(CNFRegSignInController *)self isViewLoaded])
    {
      [(CNFRegSignInController *)self _layoutLearnMoreButton];
    }
  }
}

- (void)_layoutLearnMoreButton
{
  learnMoreButton = self->_learnMoreButton;
  if (learnMoreButton)
  {
    if (self->_hideLearnMoreButton)
    {
      [(CNFRegLearnMoreButton *)learnMoreButton removeTarget:self forEvents:64];
      [(CNFRegLearnMoreButton *)self->_learnMoreButton removeFromSuperview];
      objc_super v4 = self->_learnMoreButton;
      self->_learnMoreButton = 0;
LABEL_6:
    }
  }
  else if (!self->_hideLearnMoreButton)
  {
    v5 = [CNFRegLearnMoreButton alloc];
    v6 = -[CNFRegLearnMoreButton initWithFrame:style:](v5, "initWithFrame:style:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    int v7 = self->_learnMoreButton;
    self->_learnMoreButton = v6;

    [(CNFRegLearnMoreButton *)self->_learnMoreButton setAutoresizingMask:13];
    [(CNFRegLearnMoreButton *)self->_learnMoreButton addTarget:self action:sel_learnMorePressed_ forEvents:64];
    objc_super v4 = [(CNFRegSignInController *)self view];
    [v4 addSubview:self->_learnMoreButton];
    goto LABEL_6;
  }
  if (!self->_hideLearnMoreButton && self->_learnMoreButton)
  {
    v8 = [(CNFRegSignInController *)self view];
    [v8 bounds];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    [(CNFRegLearnMoreButton *)self->_learnMoreButton sizeToFit];
    v22.origin.x = v10;
    v22.origin.y = v12;
    v22.size.width = v14;
    v22.size.height = v16;
    double MidX = CGRectGetMidX(v22);
    v23.origin.x = v10;
    v23.origin.y = v12;
    v23.size.width = v14;
    v23.size.height = v16;
    double MaxY = CGRectGetMaxY(v23);
    [(CNFRegLearnMoreButton *)self->_learnMoreButton bounds];
    double v19 = MaxY + CGRectGetHeight(v24) * -0.5 + -17.0;
    v20 = self->_learnMoreButton;
    -[CNFRegLearnMoreButton setCenter:](v20, "setCenter:", MidX, v19);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegSignInController;
  [(CNFRegFirstRunController *)&v4 viewWillAppear:a3];
  [(CNFRegSignInController *)self _updateUI];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegSignInController;
  [(CNFRegFirstRunController *)&v4 viewDidAppear:a3];
  [(CNFRegSignInController *)self _updateUI];
  [(CNFRegListController *)self _showWiFiAlertIfNecessary];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegSignInController;
  [(CNFRegFirstRunController *)&v4 viewWillDisappear:a3];
  [(CNFRegSignInController *)self _resignFirstResponders];
}

- (void)setSpecifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNFRegSignInController;
  [(CNFRegFirstRunController *)&v8 setSpecifier:v4];
  v5 = [v4 propertyForKey:@"cnf-hideLearnMoreButton"];
  if (v5)
  {
    v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CGFloat v10 = v5;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Setting hide learn more button to : %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      int v7 = v5;
      IMLogString();
    }
    -[CNFRegSignInController setHideLearnMoreButton:](self, "setHideLearnMoreButton:", objc_msgSend(v5, "BOOLValue", v7));
  }
}

- (void)systemApplicationWillEnterForeground
{
  v3.receiver = self;
  v3.super_class = (Class)CNFRegSignInController;
  [(CNFRegFirstRunController *)&v3 systemApplicationWillEnterForeground];
  [(CNFRegSignInController *)self _updateUI];
}

- (void)systemApplicationDidEnterBackground
{
  v2.receiver = self;
  v2.super_class = (Class)CNFRegSignInController;
  [(CNFRegFirstRunController *)&v2 systemApplicationDidEnterBackground];
}

- (void)applicationDidResume
{
  objc_super v3 = [(CNFRegFirstRunController *)self account];

  if (!v3)
  {
    id v4 = [(CNFRegListController *)self regController];
    v5 = [v4 accounts];
    v6 = [v5 firstObject];
    [(CNFRegFirstRunController *)self setAccount:v6];
  }
  [(CNFRegSignInController *)self _updateControllerState];
}

- (id)_rightButtonItem
{
  return 0;
}

- (id)logName
{
  return @"Signin";
}

- (id)validationString
{
  objc_super v2 = CommunicationsSetupUIBundle();
  objc_super v3 = CNFRegStringTableName();
  id v4 = [v2 localizedStringForKey:@"SIGNING_IN" value:&stru_26D05D4F8 table:v3];

  return v4;
}

- (void)_resignFirstResponders
{
  id v4 = [(CNFRegSignInController *)self usernameTextField];
  objc_super v3 = [(CNFRegSignInController *)self passwordTextField];
  if ([v4 isFirstResponder]) {
    [v4 resignFirstResponder];
  }
  if ([v3 isFirstResponder]) {
    [v3 resignFirstResponder];
  }
}

- (id)getUserNameForSpecifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_useSystemAccount)
  {
    v5 = [(CNFRegListController *)self regController];
    v6 = [v5 systemAccount];

    int v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v15 = v6;
      _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Using system account for username field: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      double v13 = v6;
      IMLogString();
    }
    objc_super v8 = [(CNFRegListController *)self regController];
    double v9 = [v8 loginForAccount:v6];

    if (!v9 || ![v9 length])
    {
      CGFloat v10 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v15 = v6;
        _os_log_impl(&dword_21ED18000, v10, OS_LOG_TYPE_DEFAULT, "** WARNING ** We are using a system account but it has no login: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
    }
  }
  else
  {
    double v9 = [(CNFRegSignInController *)self pendingUsername];
    if (!v9)
    {
      uint64_t v11 = [(CNFRegListController *)self regController];
      double v9 = [v11 guessedAccountName];
    }
  }

  return v9;
}

- (id)getPasswordForSpecifier:(id)a3
{
  id v4 = a3;
  if (self->_useSystemAccount)
  {
    v5 = [(CNFRegListController *)self regController];
    v6 = [v5 systemAccount];

    int v7 = [(CNFRegListController *)self regController];
    objc_super v8 = [v7 loginForAccount:v6];

    if (v8)
    {
      if ([v8 length]) {
        double v9 = @"•••••••";
      }
      else {
        double v9 = 0;
      }
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  double v9 = [(CNFRegSignInController *)self pendingPassword];
  if (v9) {
    goto LABEL_11;
  }
  v6 = [(CNFRegSignInController *)self getUserNameForSpecifier:v4];
  CGFloat v10 = [(CNFRegListController *)self regController];
  objc_super v8 = [v10 accountWithLogin:v6];

  if (!v8)
  {
LABEL_9:
    double v9 = 0;
    goto LABEL_10;
  }
  double v9 = [v8 password];
LABEL_10:

LABEL_11:
  return v9;
}

- (id)usernameTextField
{
  objc_super v2 = [(CNFRegSignInController *)self cachedCellForSpecifier:self->_usernameSpecifier];
  objc_super v3 = [v2 editableTextField];

  return v3;
}

- (void)setUsernameText:(id)a3
{
  usernameSpecifier = self->_usernameSpecifier;
  id v5 = a3;
  id v7 = [(CNFRegSignInController *)self cachedCellForSpecifier:usernameSpecifier];
  v6 = [v7 editableTextField];
  [v6 setText:v5];

  if (objc_opt_respondsToSelector()) {
    [v7 textFieldChangedExternally];
  }
}

- (BOOL)usernameIsEmpty
{
  objc_super v3 = [(CNFRegSignInController *)self usernameTextField];

  if (!v3)
  {
    id v5 = [(CNFRegSignInController *)self getUserNameForSpecifier:self->_usernameSpecifier];
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    BOOL v6 = 1;
    goto LABEL_6;
  }
  id v4 = [(CNFRegSignInController *)self usernameTextField];
  id v5 = [v4 text];

  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  BOOL v6 = [v5 length] == 0;
LABEL_6:

  return v6;
}

- (id)passwordTextField
{
  objc_super v2 = [(CNFRegSignInController *)self cachedCellForSpecifier:self->_passwordSpecifier];
  objc_super v3 = [v2 editableTextField];

  return v3;
}

- (void)setPasswordText:(id)a3
{
  passwordSpecifier = self->_passwordSpecifier;
  id v5 = a3;
  id v7 = [(CNFRegSignInController *)self cachedCellForSpecifier:passwordSpecifier];
  BOOL v6 = [v7 editableTextField];
  [v6 setText:v5];

  if (objc_opt_respondsToSelector()) {
    [v7 textFieldChangedExternally];
  }
}

- (BOOL)passwordIsEmpty
{
  objc_super v3 = [(CNFRegSignInController *)self passwordTextField];

  if (!v3)
  {
    id v5 = [(CNFRegSignInController *)self getPasswordForSpecifier:self->_passwordSpecifier];
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    BOOL v6 = 1;
    goto LABEL_6;
  }
  id v4 = [(CNFRegSignInController *)self passwordTextField];
  id v5 = [v4 text];

  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  BOOL v6 = [v5 length] == 0;
LABEL_6:

  return v6;
}

- (void)usernameFieldEmptyStateChanged:(id)a3 forSpecifier:(id)a4
{
  BOOL v5 = ([a3 BOOLValue] & 1) == 0 && !-[CNFRegSignInController passwordIsEmpty](self, "passwordIsEmpty");
  [(CNFRegSignInController *)self setSignInButtonEnabled:v5 animated:1];
}

- (void)passwordFieldEmptyStateChanged:(id)a3 forSpecifier:(id)a4
{
  BOOL v5 = ([a3 BOOLValue] & 1) == 0 && !-[CNFRegSignInController usernameIsEmpty](self, "usernameIsEmpty");
  [(CNFRegSignInController *)self setSignInButtonEnabled:v5 animated:1];
}

- (void)__userTappedTextField
{
  if (self->_useSystemAccount)
  {
    objc_super v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "User tapped a text field and we were using a system account, clearing password and going to normal mode", v5, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    self->_useSystemAccount = 0;
    id v4 = [(CNFRegSignInController *)self passwordTextField];
    [v4 setClearsOnBeginEditing:0];

    [(CNFRegSignInController *)self setPasswordText:0];
  }
}

- (void)showCreateAccountController
{
  if (![(CNFRegListController *)self _showWiFiAlertIfNecessary])
  {
    objc_super v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGFloat v14 = 0;
      _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Show create account controller", v14, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    [(CNFRegListController *)self setShowingChildController:1];
    [(CNFRegSignInController *)self _resignFirstResponders];
    id v4 = [CNFRegCreateAccountController alloc];
    BOOL v5 = [(CNFRegListController *)self regController];
    BOOL v6 = [(CNFRegAccountWebViewController *)v4 initWithRegController:v5];

    [(CNFRegCreateAccountController *)v6 setDelegate:self];
    [(CNFRegCreateAccountController *)v6 setEdgesForExtendedLayout:0];
    id v7 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v6];
    objc_super v8 = +[CNFRegAppearanceController globalAppearanceController];
    objc_msgSend(v7, "setModalPresentationStyle:", objc_msgSend(v8, "modalPresentationStyle"));
    uint64_t v9 = [v8 navigationBarStyle];
    CGFloat v10 = [v7 navigationBar];
    [v10 setBarStyle:v9];

    uint64_t v11 = [v8 navigationBarIsTranslucent];
    CGFloat v12 = [v7 navigationBar];
    [v12 setTranslucent:v11];

    double v13 = [(CNFRegSignInController *)self navigationController];
    [v13 presentViewController:v7 animated:1 completion:0];
  }
}

- (void)forgotIDButtonTapped
{
  if (![(CNFRegListController *)self _showWiFiAlertIfNecessary])
  {
    [(CNFRegSignInController *)self _launchForgotPasswordUrl];
  }
}

- (void)createAccountControllerDidFinish:(id)a3 withAppleId:(id)a4 authID:(id)a5 authToken:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    [(CNFRegSignInController *)self setUsernameText:v11];
    int v14 = 0;
    if (v12 && v13)
    {
      [(CNFRegSignInController *)self setPasswordText:0];
      int v14 = 1;
    }
  }
  else
  {
    int v14 = 0;
  }
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __88__CNFRegSignInController_createAccountControllerDidFinish_withAppleId_authID_authToken___block_invoke;
  v25[3] = &unk_2644F0868;
  id v15 = v10;
  id v26 = v15;
  v27 = self;
  [(CNFRegFirstRunController *)self _executeDismissBlock:v25];
  if (v14)
  {
    uint64_t v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v29 = v11;
      __int16 v30 = 2112;
      id v31 = v12;
      __int16 v32 = 2112;
      id v33 = v13;
      _os_log_impl(&dword_21ED18000, v16, OS_LOG_TYPE_DEFAULT, "Signing in with username (new account): %@  profileID: %@ token: %@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      id v19 = v12;
      id v20 = v13;
      id v18 = v11;
      IMLogString();
    }
    -[CNFRegSignInController setPendingUsername:](self, "setPendingUsername:", v11, v18, v19, v20);
    [(CNFRegSignInController *)self setPendingPassword:0];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __88__CNFRegSignInController_createAccountControllerDidFinish_withAppleId_authID_authToken___block_invoke_161;
    v21[3] = &unk_2644F0C40;
    v21[4] = self;
    id v22 = v11;
    id v23 = v12;
    id v24 = v13;
    v17 = (void (**)(void))MEMORY[0x223C3AA40](v21);
    if ([(CNFRegListController *)self appeared]) {
      v17[2](v17);
    }
    else {
      [(CNFRegListController *)self setAppearBlock:v17];
    }
  }
}

uint64_t __88__CNFRegSignInController_createAccountControllerDidFinish_withAppleId_authID_authToken___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:0];
  objc_super v2 = *(void **)(a1 + 40);
  return [v2 dismissViewControllerAnimated:1 completion:0];
}

uint64_t __88__CNFRegSignInController_createAccountControllerDidFinish_withAppleId_authID_authToken___block_invoke_161(uint64_t a1)
{
  char v5 = 0;
  [*(id *)(a1 + 32) _startValidationModeAnimated:0];
  objc_super v2 = [*(id *)(a1 + 32) regController];
  objc_super v3 = [v2 beginAccountSetupWithLogin:*(void *)(a1 + 40) authID:*(void *)(a1 + 48) authToken:*(void *)(a1 + 56) regionInfo:0 foundExisting:&v5];
  [*(id *)(a1 + 32) setAccount:v3];

  if (!v5) {
    [*(id *)(a1 + 32) _resetSigninFailureCount];
  }
  [*(id *)(a1 + 32) _startTimeout];
  return [*(id *)(a1 + 32) _loadRegionsIfNecessary];
}

- (void)_updateUI
{
  if (!self->super._showingActivityIndicator)
  {
    BOOL v3 = ![(CNFRegSignInController *)self passwordIsEmpty]
      && ![(CNFRegSignInController *)self usernameIsEmpty];
    [(CNFRegSignInController *)self setSignInButtonEnabled:v3 animated:0];
  }
  [(CNFRegSignInController *)self _layoutLearnMoreButton];
}

- (void)_updateControllerState
{
  v14.receiver = self;
  v14.super_class = (Class)CNFRegSignInController;
  [(CNFRegFirstRunController *)&v14 _updateControllerState];
  BOOL v3 = [(CNFRegListController *)self regController];
  id v4 = [(CNFRegFirstRunController *)self account];
  uint64_t v5 = [v3 accountStateForAccount:v4];

  if (v5)
  {
    BOOL v6 = [(CNFRegSignInController *)self navigationController];
    id v7 = [v6 visibleViewController];

    if ((v5 & 2) != 0)
    {
      if ((v5 & 4) != 0)
      {
        if ([(CNFRegFirstRunController *)self pushCompletionControllerIfPossible]) {
          char v13 = 1;
        }
        else {
          char v13 = [(CNFRegFirstRunController *)self dismissWithState:v5];
        }
        CNFAssert(v13, 7, @"Finished signin but no action was taken");
        goto LABEL_13;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_super v8 = CNFRegEmailController;
        goto LABEL_8;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_super v8 = CNFRegLocaleController;
LABEL_8:
        id v9 = [v8 alloc];
        id v10 = [(CNFRegFirstRunController *)self account];
        id v11 = (void *)[v9 initWithParentController:self account:v10];

        objc_msgSend(v11, "setCompletionControllerClass:", -[CNFRegFirstRunController completionControllerClass](self, "completionControllerClass"));
        id v12 = [(CNFRegFirstRunController *)self delegate];
        [v11 setDelegate:v12];

        [(CNFRegSignInController *)self showController:v11 animate:1];
      }
    }
LABEL_13:
  }
}

- (void)_setFieldsEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNFRegSignInController;
  -[CNFRegListController _setFieldsEnabled:animated:](&v8, sel__setFieldsEnabled_animated_);
  [(CNFRegSignInController *)self setUsernameEnabled:v5 animated:v4];
  [(CNFRegSignInController *)self setPasswordEnabled:v5 animated:v4];
  [(CNFRegSignInController *)self setCreateAccountButtonEnabled:v5 animated:v4];
  BOOL v7 = v5
    && ![(CNFRegSignInController *)self passwordIsEmpty]
    && ![(CNFRegSignInController *)self usernameIsEmpty];
  [(CNFRegSignInController *)self setSignInButtonEnabled:v7 animated:v4];
}

- (void)_finishSignInWithAccount:(id)a3 animated:(BOOL)a4
{
  -[CNFRegFirstRunController _stopValidationModeAnimated:](self, "_stopValidationModeAnimated:", 1, a4);
  [(CNFRegSignInController *)self _updateControllerState];
}

- (void)_returnKeyPressed
{
  if (![(CNFRegSignInController *)self usernameIsEmpty])
  {
    if ([(CNFRegSignInController *)self passwordIsEmpty])
    {
      BOOL v3 = [(CNFRegSignInController *)self usernameTextField];
      int v4 = [v3 isFirstResponder];

      if (v4)
      {
        id v6 = [(CNFRegSignInController *)self passwordTextField];
        [v6 becomeFirstResponder];
      }
    }
    else
    {
      signInButtonSpecifier = self->_signInButtonSpecifier;
      [(CNFRegSignInController *)self signInTapped:signInButtonSpecifier];
    }
  }
}

- (void)signInWithUsername:(id)a3 password:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "Signing in with username (password entered): %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    id v11 = v6;
    IMLogString();
  }
  -[CNFRegSignInController setPendingUsername:](self, "setPendingUsername:", v6, v11);
  [(CNFRegSignInController *)self setPendingPassword:v7];
  [(CNFRegFirstRunController *)self _startValidationModeAnimated:0];
  buf[0] = 0;
  id v9 = [(CNFRegListController *)self regController];
  id v10 = [v9 beginAccountSetupWithLogin:v6 password:v7 foundExisting:buf];
  [(CNFRegFirstRunController *)self setAccount:v10];

  if (!buf[0]) {
    [(CNFRegSignInController *)self _resetSigninFailureCount];
  }
  [(CNFRegSignInController *)self _startTimeout];
  [(CNFRegSignInController *)self _loadRegionsIfNecessary];
}

- (void)signInTapped:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "signInTapped", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  if (![(CNFRegListController *)self _showWiFiAlertIfNecessary])
  {
    if (!self->_useSystemAccount)
    {
      id v7 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      id v10 = [(CNFRegSignInController *)self usernameTextField];
      id v11 = [v10 text];

      objc_super v8 = [v11 stringByTrimmingCharactersInSet:v7];

      id v12 = [(CNFRegSignInController *)self passwordTextField];
      id v9 = [v12 text];

      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __39__CNFRegSignInController_signInTapped___block_invoke;
      v23[3] = &unk_2644F1050;
      v23[4] = self;
      id v13 = (void (**)(void, void))MEMORY[0x223C3AA40](v23);
      if (v8 && [v8 length])
      {
        if (v9 && [v9 length])
        {
          uint64_t v14 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v8;
            _os_log_impl(&dword_21ED18000, v14, OS_LOG_TYPE_DEFAULT, "Signing in with username (password entered): %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            id v22 = v8;
            IMLogString();
          }
          -[CNFRegSignInController setPendingUsername:](self, "setPendingUsername:", v8, v22);
          [(CNFRegSignInController *)self setPendingPassword:v9];
          [(CNFRegFirstRunController *)self _startValidationModeAnimated:0];
          buf[0] = 0;
          id v15 = [(CNFRegListController *)self regController];
          uint64_t v16 = [v15 beginAccountSetupWithLogin:v8 password:v9 foundExisting:buf];
          [(CNFRegFirstRunController *)self setAccount:v16];

          if (!buf[0]) {
            [(CNFRegSignInController *)self _resetSigninFailureCount];
          }

          goto LABEL_10;
        }
        id v20 = NSString;
        v17 = CommunicationsSetupUIBundle();
        id v18 = CNFRegStringTableName();
        id v19 = [v17 localizedStringForKey:@"FACETIME_SIGNIN_ERROR_INVALID_CREDENTIALS_FOR_%@" value:&stru_26D05D4F8 table:v18];
        v21 = objc_msgSend(v20, "stringWithFormat:", v19, v8);
        ((void (**)(void, void *))v13)[2](v13, v21);
      }
      else
      {
        v17 = CommunicationsSetupUIBundle();
        id v18 = CNFRegStringTableName();
        id v19 = [v17 localizedStringForKey:@"FACETIME_SIGNIN_ERROR_BLANK_USERNAME" value:&stru_26D05D4F8 table:v18];
        ((void (**)(void, void *))v13)[2](v13, v19);
      }

      goto LABEL_26;
    }
    id v6 = [(CNFRegListController *)self regController];
    id v7 = [v6 systemAccount];

    if (v7)
    {
      [(CNFRegFirstRunController *)self _startValidationModeAnimated:0];
      objc_super v8 = [(CNFRegListController *)self regController];
      id v9 = [v8 beginAccountSetupWithAccount:v7];
      [(CNFRegFirstRunController *)self setAccount:v9];
LABEL_10:

      [(CNFRegSignInController *)self _startTimeout];
      [(CNFRegSignInController *)self _loadRegionsIfNecessary];
    }
  }
LABEL_26:
}

void __39__CNFRegSignInController_signInTapped___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CommunicationsSetupUIBundle();
  BOOL v5 = CNFRegStringTableName();
  id v11 = [v4 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_TITLE" value:&stru_26D05D4F8 table:v5];

  id v6 = CommunicationsSetupUIBundle();
  id v7 = CNFRegStringTableName();
  objc_super v8 = [v6 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v7];

  id v9 = [MEMORY[0x263F82418] alertControllerWithTitle:v11 message:v3 preferredStyle:1];

  id v10 = [MEMORY[0x263F82400] actionWithTitle:v8 style:0 handler:0];
  [v9 addAction:v10];

  [*(id *)(a1 + 32) presentViewController:v9 animated:1 completion:0];
}

- (void)learnMorePressed:(id)a3
{
  id v3 = (void *)*MEMORY[0x263F83300];
  CNFRegLocalizedSplashScreenURL();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 openURL:v4 withCompletionHandler:0];
}

- (void)_loadRegionsIfNecessary
{
  id v2 = [MEMORY[0x263F3BB50] sharedInstance];
  if (([v2 isLoaded] & 1) == 0) {
    [v2 startLoading];
  }
}

- (void)_startTimeout
{
}

- (void)_handleTimeout
{
  [(CNFRegFirstRunController *)self _stopValidationModeAnimated:1];
  id v3 = CommunicationsSetupUIBundle();
  id v4 = CNFRegStringTableName();
  id v13 = [v3 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_TITLE" value:&stru_26D05D4F8 table:v4];

  BOOL v5 = CommunicationsSetupUIBundle();
  id v6 = CNFRegStringTableName();
  id v7 = [v5 localizedStringForKey:@"FACETIME_SIGNIN_ERROR_TIMEOUT" value:&stru_26D05D4F8 table:v6];

  objc_super v8 = CommunicationsSetupUIBundle();
  id v9 = CNFRegStringTableName();
  id v10 = [v8 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v9];

  id v11 = [MEMORY[0x263F82418] alertControllerWithTitle:v13 message:v7 preferredStyle:1];
  id v12 = [MEMORY[0x263F82400] actionWithTitle:v10 style:0 handler:0];
  [v11 addAction:v12];

  [(CNFRegSignInController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)cancelButtonTapped
{
  id v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Cancel button tapped", v7, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  id v4 = [(CNFRegListController *)self regController];
  unint64_t v5 = [v4 accountState];

  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.super.isa
                                            + (int)*MEMORY[0x263F5FE78]));
  [WeakRetained dismissFinished:(v5 >> 30) & 1];
}

- (void)setUsernameEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = @"NO";
    if (v5) {
      objc_super v8 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    id v12 = v8;
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Setting username enabled to :%@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    id v9 = @"NO";
    if (v5) {
      id v9 = @"YES";
    }
    id v10 = v9;
    IMLogString();
  }
  -[CNFRegListController _setSpecifierEnabled:enabled:animated:](self, "_setSpecifierEnabled:enabled:animated:", self->_usernameSpecifier, v5, v4, v10);
}

- (void)setPasswordEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = @"NO";
    if (v5) {
      objc_super v8 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    id v12 = v8;
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Setting password enabled to :%@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    id v9 = @"NO";
    if (v5) {
      id v9 = @"YES";
    }
    id v10 = v9;
    IMLogString();
  }
  -[CNFRegListController _setSpecifierEnabled:enabled:animated:](self, "_setSpecifierEnabled:enabled:animated:", self->_passwordSpecifier, v5, v4, v10);
}

- (void)setCreateAccountButtonEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = @"NO";
    if (v5) {
      objc_super v8 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    id v12 = v8;
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Setting account button enabled to :%@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    id v9 = @"NO";
    if (v5) {
      id v9 = @"YES";
    }
    id v10 = v9;
    IMLogString();
  }
  -[CNFRegListController _setSpecifierEnabled:enabled:animated:](self, "_setSpecifierEnabled:enabled:animated:", self->_createAccountButtonSpecifier, v5, v4, v10);
}

- (void)setSignInButtonEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = @"NO";
    if (v5) {
      objc_super v8 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    id v12 = v8;
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Setting signin button enabled to :%@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    id v9 = @"NO";
    if (v5) {
      id v9 = @"YES";
    }
    id v10 = v9;
    IMLogString();
  }
  -[CNFRegListController _setSpecifierEnabled:enabled:animated:](self, "_setSpecifierEnabled:enabled:animated:", self->_signInButtonSpecifier, v5, v4, v10);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CNFRegSignInController;
  BOOL v5 = [(CNFRegSignInController *)&v9 tableView:a3 cellForRowAtIndexPath:a4];
  id v6 = [(CNFRegSignInController *)self cachedCellForSpecifierID:@"FACETIME_SIGNIN_PASSWORD_ID"];

  if (v5 == v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v7 = [v5 textField];
    if ([v7 conformsToProtocol:&unk_26D0B93E8]) {
      [v7 setReturnKeyType:1];
    }
    if (self->_useSystemAccount) {
      [v7 setClearsOnBeginEditing:1];
    }
  }
  return v5;
}

- (void)_buildCreateAccountButtonSpecifierCache:(id)a3
{
  self->_createAccountButtonSpecifier = [a3 specifierForID:@"FACETIME_SIGNIN_CREATE_ACCOUNT_ID"];
  MEMORY[0x270F9A758]();
}

- (void)_buildSignInGroupSpecifierCache:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 specifierForID:@"FACETIME_SIGNIN_BUTTON_GROUP_ID"];
  actionGroupSpecifier = self->_actionGroupSpecifier;
  self->_actionGroupSpecifier = v5;

  id v7 = [v4 specifierForID:@"FACETIME_SIGNIN_BUTTON_ID"];

  signInButtonSpecifier = self->_signInButtonSpecifier;
  self->_signInButtonSpecifier = v7;
}

- (void)_buildCredentialSpecifierCache:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 specifierForID:@"FACETIME_SIGNIN_USERNAME_ID"];
  usernameSpecifier = self->_usernameSpecifier;
  self->_usernameSpecifier = v5;

  id v7 = [v4 specifierForID:@"FACETIME_SIGNIN_PASSWORD_ID"];

  passwordSpecifier = self->_passwordSpecifier;
  self->_passwordSpecifier = v7;
}

- (void)_buildSpecifierCache:(id)a3
{
  id v4 = a3;
  [(CNFRegSignInController *)self _buildCreateAccountButtonSpecifierCache:v4];
  [(CNFRegSignInController *)self _buildSignInGroupSpecifierCache:v4];
  [(CNFRegSignInController *)self _buildCredentialSpecifierCache:v4];
}

- (void)_showRegistrationFailureWithError:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v4;
      _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Received sign in error : %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      id v34 = v4;
      IMLogString();
    }
    unint64_t v6 = objc_msgSend(v4, "code", v34);
  }
  else
  {
    unint64_t v6 = -1;
  }
  id v7 = [(CNFRegListController *)self regController];
  int v8 = [v7 shouldShowAlertForError:v4];

  if (v8 && (v6 > 0x1A || ((1 << v6) & 0x4100C00) == 0))
  {
    objc_super v9 = [v4 userInfo];
    id v10 = [v9 objectForKey:@"cnf-customTitle"];
    id v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      uint64_t v13 = CommunicationsSetupUIBundle();
      uint64_t v14 = CNFRegStringTableName();
      id v12 = [v13 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_TITLE" value:&stru_26D05D4F8 table:v14];
    }
    id v15 = [v4 localizedDescription];
    uint64_t v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v18 = CommunicationsSetupUIBundle();
      id v19 = CNFRegStringTableName();
      id v17 = [v18 localizedStringForKey:@"FACETIME_SIGNIN_ERROR_GENERIC" value:&stru_26D05D4F8 table:v19];
    }
    id v20 = [v4 userInfo];
    v21 = [v20 objectForKey:@"cnf-customButton"];
    id v22 = v21;
    if (v21)
    {
      id v23 = v21;
    }
    else
    {
      id v24 = CommunicationsSetupUIBundle();
      v25 = CNFRegStringTableName();
      id v23 = [v24 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v25];
    }
    uint64_t v26 = [MEMORY[0x263F82418] alertControllerWithTitle:v12 message:v17 preferredStyle:1];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __60__CNFRegSignInController__showRegistrationFailureWithError___block_invoke;
    v38[3] = &unk_2644F1078;
    v38[4] = self;
    v38[5] = v6;
    v27 = [MEMORY[0x263F82400] actionWithTitle:v23 style:0 handler:v38];
    [v26 addAction:v27];

    v28 = [v4 userInfo];
    id v29 = [v28 objectForKey:@"cnf-customActionTitle"];

    if (v29)
    {
      __int16 v30 = (void *)MEMORY[0x263F82400];
      id v31 = [v4 userInfo];
      __int16 v32 = [v31 objectForKey:@"cnf-customActionTitle"];
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __60__CNFRegSignInController__showRegistrationFailureWithError___block_invoke_2;
      v35[3] = &unk_2644F0A80;
      id v36 = v4;
      int v37 = self;
      id v33 = [v30 actionWithTitle:v32 style:0 handler:v35];
      [v26 addAction:v33];
    }
    [(CNFRegSignInController *)self presentViewController:v26 animated:1 completion:0];
  }
}

unint64_t __60__CNFRegSignInController__showRegistrationFailureWithError___block_invoke(unint64_t result)
{
  if (*(void *)(result + 40) == 3)
  {
    unint64_t v1 = result;
    [*(id *)(result + 32) _incrementSigninFailureCount];
    result = [*(id *)(v1 + 32) signinFailureCount];
    if (result >= 3)
    {
      id v2 = *(void **)(v1 + 32);
      return [v2 _showSigninFailureAlert];
    }
  }
  return result;
}

void __60__CNFRegSignInController__showRegistrationFailureWithError___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) userInfo];
  BOOL v5 = [v4 objectForKey:@"cnf-customActionURLString"];

  if (v5)
  {
    unint64_t v6 = [NSURL URLWithString:v5];
    if (v6)
    {
      id v7 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v6;
        _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Launching URL : %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        objc_super v9 = v6;
        IMLogString();
      }
      int v8 = objc_msgSend(*(id *)(a1 + 40), "regController", v9);
      [v8 openURL:v6];
    }
  }
}

- (void)_showSigninFailureAlert
{
  int v3 = _os_feature_enabled_impl();
  id v4 = CommunicationsSetupUIBundle();
  BOOL v5 = CNFRegStringTableName();
  if (v3) {
    unint64_t v6 = @"FACETIME_FORGOT_PASSWORD_ALERT_TITLE_APPLEACCOUNT";
  }
  else {
    unint64_t v6 = @"FACETIME_FORGOT_PASSWORD_ALERT_TITLE";
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_26D05D4F8 table:v5];

  int v8 = CommunicationsSetupUIBundle();
  objc_super v9 = CNFRegStringTableName();
  id v10 = [v8 localizedStringForKey:@"FACETIME_FORGOT_PASSWORD_ALERT_MESSAGE" value:&stru_26D05D4F8 table:v9];

  id v11 = CommunicationsSetupUIBundle();
  uint64_t v12 = CNFRegStringTableName();
  uint64_t v13 = [v11 localizedStringForKey:@"FACETIME_ALERT_CANCEL" value:&stru_26D05D4F8 table:v12];

  uint64_t v14 = CommunicationsSetupUIBundle();
  id v15 = CNFRegStringTableName();
  uint64_t v16 = [v14 localizedStringForKey:@"FACETIME_FORGOT_PASSWORD_ALERT_OK" value:&stru_26D05D4F8 table:v15];

  id v17 = [MEMORY[0x263F82418] alertControllerWithTitle:v7 message:v10 preferredStyle:1];
  id v18 = [MEMORY[0x263F82400] actionWithTitle:v13 style:1 handler:0];
  [v17 addAction:v18];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __49__CNFRegSignInController__showSigninFailureAlert__block_invoke;
  v20[3] = &unk_2644F0988;
  v20[4] = self;
  id v19 = [MEMORY[0x263F82400] actionWithTitle:v16 style:0 handler:v20];
  [v17 addAction:v19];

  [(CNFRegSignInController *)self presentViewController:v17 animated:1 completion:0];
}

uint64_t __49__CNFRegSignInController__showSigninFailureAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchForgotPasswordUrl];
}

- (void)_resetSigninFailureCount
{
}

- (void)_incrementSigninFailureCount
{
  if ([(CNFRegSignInController *)self signinFailureCount] != -1)
  {
    unint64_t v3 = [(CNFRegSignInController *)self signinFailureCount] + 1;
    [(CNFRegSignInController *)self setSigninFailureCount:v3];
  }
}

- (void)_launchForgotPasswordUrl
{
  id v3 = [MEMORY[0x263F82438] sharedApplication];
  id v2 = CNFRegiForgotURL();
  [v3 openURL:v2 withCompletionHandler:0];
}

- (void)_showNewPasswordNeededSheetWithAppleID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [CNFRegChangeAccountPasswordController alloc];
  unint64_t v6 = [(CNFRegListController *)self regController];
  uint64_t v14 = [(CNFRegChangeAccountPasswordController *)v5 initWithRegController:v6 appleID:v4];

  [(CNFRegChangeAccountPasswordController *)v14 setDelegate:self];
  id v7 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v14];
  int v8 = +[CNFRegAppearanceController globalAppearanceController];
  objc_msgSend(v7, "setModalPresentationStyle:", objc_msgSend(v8, "modalPresentationStyle"));
  uint64_t v9 = [v8 navigationBarStyle];
  id v10 = [v7 navigationBar];
  [v10 setBarStyle:v9];

  uint64_t v11 = [v8 navigationBarIsTranslucent];
  uint64_t v12 = [v7 navigationBar];
  [v12 setTranslucent:v11];

  uint64_t v13 = [(CNFRegSignInController *)self navigationController];
  [v13 presentViewController:v7 animated:1 completion:0];
}

- (void)_setupAppearBlockForNewPasswordWithAppleID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__CNFRegSignInController__setupAppearBlockForNewPasswordWithAppleID___block_invoke;
  v6[3] = &unk_2644F10A0;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(CNFRegListController *)self setAppearBlock:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __69__CNFRegSignInController__setupAppearBlockForNewPasswordWithAppleID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _showNewPasswordNeededSheetWithAppleID:*(void *)(a1 + 32)];
}

- (void)_showAccountNotAuthorizedSheetWithAuthID:(id)a3 token:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [CNFRegAccountAuthorizationController alloc];
  uint64_t v9 = [(CNFRegListController *)self regController];
  id v17 = [(CNFRegAccountAuthorizationController *)v8 initWithRegController:v9 authID:v7 token:v6];

  [(CNFRegAccountAuthorizationController *)v17 setDelegate:self];
  id v10 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v17];
  uint64_t v11 = +[CNFRegAppearanceController globalAppearanceController];
  objc_msgSend(v10, "setModalPresentationStyle:", objc_msgSend(v11, "modalPresentationStyle"));
  uint64_t v12 = [v11 navigationBarStyle];
  uint64_t v13 = [v10 navigationBar];
  [v13 setBarStyle:v12];

  uint64_t v14 = [v11 navigationBarIsTranslucent];
  id v15 = [v10 navigationBar];
  [v15 setTranslucent:v14];

  uint64_t v16 = [(CNFRegSignInController *)self navigationController];
  [v16 presentViewController:v10 animated:1 completion:0];
}

- (void)_setupAppearBlockForAccountAuthorizeWithAuthID:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__CNFRegSignInController__setupAppearBlockForAccountAuthorizeWithAuthID_token___block_invoke;
  v10[3] = &unk_2644F10C8;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  [(CNFRegListController *)self setAppearBlock:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __79__CNFRegSignInController__setupAppearBlockForAccountAuthorizeWithAuthID_token___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _showAccountNotAuthorizedSheetWithAuthID:*(void *)(a1 + 32) token:*(void *)(a1 + 40)];
}

- (void)_setupEventHandlers
{
  v5.receiver = self;
  v5.super_class = (Class)CNFRegSignInController;
  [(CNFRegFirstRunController *)&v5 _setupEventHandlers];
  id v3 = [(CNFRegListController *)self regController];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__CNFRegSignInController__setupEventHandlers__block_invoke;
  v4[3] = &unk_2644F0B98;
  v4[4] = self;
  [v3 setAccountRegistrationBlock:v4];
}

void __45__CNFRegSignInController__setupEventHandlers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [v8 registrationStatus];
  id v7 = [*(id *)(a1 + 32) account];

  if (v7 == v8)
  {
    if ((unint64_t)(v6 - 3) >= 3)
    {
      if (v6 == -1)
      {
        [*(id *)(a1 + 32) _stopTimeout];
        if (([*(id *)(a1 + 32) timedOut] & 1) == 0)
        {
          [*(id *)(a1 + 32) _showRegistrationFailureWithError:v5];
          [*(id *)(a1 + 32) _stopValidationModeAnimated:1];
        }
      }
    }
    else
    {
      [*(id *)(a1 + 32) _stopTimeout];
      [*(id *)(a1 + 32) _resetSigninFailureCount];
      [*(id *)(a1 + 32) _finishSignInWithAccount:v8 animated:1];
    }
  }
}

- (NSString)pendingUsername
{
  return self->_pendingUsername;
}

- (void)setPendingUsername:(id)a3
{
}

- (NSString)pendingPassword
{
  return self->_pendingPassword;
}

- (void)setPendingPassword:(id)a3
{
}

- (unint64_t)signinFailureCount
{
  return self->_signinFailureCount;
}

- (void)setSigninFailureCount:(unint64_t)a3
{
  self->_signinFailureCount = a3;
}

- (BOOL)hideLearnMoreButton
{
  return self->_hideLearnMoreButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_pendingPassword, 0);
  objc_storeStrong((id *)&self->_pendingUsername, 0);
  objc_storeStrong((id *)&self->_createAccountButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_signInButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_actionGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_passwordSpecifier, 0);
  objc_storeStrong((id *)&self->_usernameSpecifier, 0);
}

@end