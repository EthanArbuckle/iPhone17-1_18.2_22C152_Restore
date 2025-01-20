@interface AAUISignInViewController
+ (BOOL)_isRunningInBridge;
+ (BOOL)_isRunningInMuseBuddy;
+ (BOOL)_isRunningInSettings;
- (AAUIAppleLogoMicaView)appleLogoMicaView;
- (AAUIButton)createButton;
- (AAUIButton)forgotButton;
- (AAUISignInViewController)initWithCoder:(id)a3;
- (AAUISignInViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AAUISignInViewControllerDelegate)delegate;
- (AKAppleIDAuthenticationController)authenticationController;
- (AKURLBag)akURLBag;
- (BOOL)_hasValidCredentials;
- (BOOL)_isGreenTeaCapable;
- (BOOL)_isPasswordFieldVisible;
- (BOOL)_shouldAnticipatePiggybacking;
- (BOOL)_shouldShowChildSignButton;
- (BOOL)_showOnlyPassword;
- (BOOL)_showsChildSignIn;
- (BOOL)allowSkip;
- (BOOL)allowsAccountCreation;
- (BOOL)canEditUsername;
- (BOOL)hideCreationAndForgotPasswordButton;
- (BOOL)hidesBackOrCancelButton;
- (BOOL)isChildSetupFlow;
- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5;
- (BOOL)shouldShowSystemBackButton;
- (BOOL)showOtherOptions;
- (BOOL)showServiceIcons;
- (BOOL)showingPasswordCell;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSArray)privacyLinkIdentifiers;
- (NSNumber)initialHeight;
- (NSString)footerText;
- (NSString)messageLabel;
- (NSString)username;
- (UIButton)forgotOrCreateButton;
- (UIColor)cellBackgroundColor;
- (UIColor)tintColor;
- (UIImageView)headerImageView;
- (UIStackView)accountHelpStackView;
- (UIView)logoContainerView;
- (double)_initialHeight;
- (double)_navigationBarHeight;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_accountHelpStackView;
- (id)_authorizationValueForAuthenticationResults:(id)a3;
- (id)_backBarButtonItem;
- (id)_cancelBarButtonItem;
- (id)_continueButton;
- (id)_defaultHeaderImage;
- (id)_otherOptionsButton;
- (id)_passwordCell;
- (id)_passwordFieldIndexPath;
- (id)_prepareOBHeaderView;
- (id)_serverFriendlyUsername:(id)a3;
- (id)_tableFooterView;
- (id)_tableHeaderView;
- (id)_tableView;
- (id)_usernameCell;
- (id)authenticationContext;
- (id)forgotButtonLocalizedString;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)_akServiceType;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableViewStyle;
- (void)_actionButtonSelected:(id)a3;
- (void)_attemptAuthentication;
- (void)_attemptAuthenticationWithContext:(id)a3;
- (void)_beginObservingKeyboardWillShowNotifications;
- (void)_beginObservingSizeCategoryNotification;
- (void)_beginObservingTextFieldDidChangeNotifications;
- (void)_cancelPasswordDelegateIfNecessary;
- (void)_childSignInSelected:(id)a3;
- (void)_continueButtonSelected:(id)a3;
- (void)_delegate_signInViewControllerDidCancel;
- (void)_delegate_signInViewControllerDidCompleteWithAuthenticationResults:(id)a3 completionHandler:(id)a4;
- (void)_delegate_signInViewControllerDidSelectOtherOptions;
- (void)_delegate_signInViewControllerDidSkip;
- (void)_endObservingKeyboardWillShowNotifications;
- (void)_endObservingSizeCategoryNotification;
- (void)_endObservingTextFieldDidChangeNotifications;
- (void)_formatUsernameAsPhoneNumberIfNeeded;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_presentCreateAppleIDPane;
- (void)_presentForgotAppleIDPane;
- (void)_prewarmSignInFlowIfApplicable;
- (void)_repairCloudAccountWithAuthenticationResults:(id)a3;
- (void)_resignFirstResponderForAppropriateTextField;
- (void)_setAkServiceType:(int64_t)a3;
- (void)_setContinueButtonEnabled:(BOOL)a3;
- (void)_setEnabled:(BOOL)a3;
- (void)_setPasswordFieldHidden:(BOOL)a3;
- (void)_setShouldAnticipatePiggybacking:(BOOL)a3;
- (void)_setUsernameCellWaiting:(BOOL)a3;
- (void)_textFieldDidChange:(id)a3;
- (void)_updateContentInsetWithHeight:(double)a3;
- (void)_updateExpandingViewInFooterForCellChange:(BOOL)a3;
- (void)_updateScrollIndicatorInsetWithHeight:(double)a3;
- (void)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6 completion:(id)a7;
- (void)constrainView:(id)a3 toFillHeaderFooterView:(id)a4;
- (void)context:(id)a3 needsPasswordWithCompletion:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)passwordCellTapped:(id)a3;
- (void)setAKURLBag:(id)a3;
- (void)setAccountHelpStackView:(id)a3;
- (void)setAllowSkip:(BOOL)a3;
- (void)setAllowsAccountCreation:(BOOL)a3;
- (void)setAppleLogoMicaView:(id)a3;
- (void)setAuthenticationController:(id)a3;
- (void)setCanEditUsername:(BOOL)a3;
- (void)setCellBackgroundColor:(id)a3;
- (void)setChildSetupFlow:(BOOL)a3;
- (void)setCreateButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFooterText:(id)a3;
- (void)setForgotButton:(id)a3;
- (void)setForgotOrCreateButton:(id)a3;
- (void)setHeaderImage:(id)a3;
- (void)setHideCreationAndForgotPasswordButton:(BOOL)a3;
- (void)setHidesBackOrCancelButton:(BOOL)a3;
- (void)setInitialHeight:(id)a3;
- (void)setLogoContainerView:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setPrivacyLinkIdentifiers:(id)a3;
- (void)setShouldShowSystemBackButton:(BOOL)a3;
- (void)setShowOtherOptions:(BOOL)a3;
- (void)setShowServiceIcons:(BOOL)a3;
- (void)setShowingPasswordCell:(BOOL)a3;
- (void)setShowsChildSignIn:(BOOL)a3;
- (void)setTableViewStyle:(int64_t)a3;
- (void)setTintColor:(id)a3;
- (void)setUsername:(id)a3;
- (void)sizeCategoryDidChange:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)usernameCellTapped:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AAUISignInViewController

- (AAUISignInViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AAUISignInViewController;
  v4 = [(AAUISignInViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    _AAUISignInViewControllerCommonInit(v4);
  }
  return v5;
}

- (AAUISignInViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AAUISignInViewController;
  v3 = [(AAUISignInViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    _AAUISignInViewControllerCommonInit(v3);
  }
  return v4;
}

- (void)loadView
{
  v3 = [AAUIBuddyView alloc];
  v4 = -[AAUIBuddyView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(AAUISignInViewController *)self setView:v4];

  id v6 = [(AAUISignInViewController *)self view];
  v5 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v6 setBackgroundColor:v5];
}

- (void)viewDidLoad
{
  v46[4] = *MEMORY[0x263EF8340];
  v45.receiver = self;
  v45.super_class = (Class)AAUISignInViewController;
  [(AAUISignInViewController *)&v45 viewDidLoad];
  v3 = [(AAUISignInViewController *)self authenticationContext];
  v4 = [v3 proxiedDevice];

  if (v4)
  {
    v5 = [(AAUISignInViewController *)self navigationItem];
    [v5 setHidesBackButton:0 animated:0];

    id v6 = [(AAUISignInViewController *)self navigationItem];
    [v6 setLeftBarButtonItem:0 animated:0];
  }
  else if ([(AAUISignInViewController *)self hidesBackOrCancelButton])
  {
    id v6 = [(AAUISignInViewController *)self navigationItem];
    [v6 setHidesBackButton:1 animated:0];
  }
  else
  {
    if ([(AAUISignInViewController *)self allowSkip]
      || [(AAUISignInViewController *)self shouldShowSystemBackButton])
    {
      id v6 = [(AAUISignInViewController *)self navigationItem];
      objc_super v7 = [(AAUISignInViewController *)self _backBarButtonItem];
      [v6 setLeftBarButtonItem:v7];
    }
    else
    {
      id v6 = [(AAUISignInViewController *)self navigationItem];
      objc_super v7 = [(AAUISignInViewController *)self _cancelBarButtonItem];
      [v6 setRightBarButtonItem:v7];
    }
  }
  v8 = [(AAUISignInViewController *)self _tableView];
  v9 = [(AAUISignInViewController *)self view];
  [v9 addSubview:v8];

  uint64_t v10 = [(AAUISignInViewController *)self navigationController];
  double v11 = 0.0;
  if (v10)
  {
    v12 = (void *)v10;
    v13 = [(AAUISignInViewController *)self navigationController];
    if ([v13 modalPresentationStyle])
    {
      v14 = [(AAUISignInViewController *)self navigationController];
      uint64_t v15 = [v14 modalPresentationStyle];

      if (v15 != 5) {
        goto LABEL_18;
      }
    }
    else
    {
    }
    v16 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v17 = [v16 userInterfaceIdiom];

    if (v17 == 1)
    {
      id v18 = objc_alloc_init(MEMORY[0x263F829A0]);
      [v18 intrinsicContentSize];
      double v11 = v19 + 0.0;
    }
    else
    {
      v20 = [MEMORY[0x263F82438] sharedApplication];
      [v20 statusBarFrame];
      double v22 = v21;

      double v11 = v22 + 0.0;
    }
  }
LABEL_18:
  v36 = (void *)MEMORY[0x263F08938];
  v43 = [v8 topAnchor];
  v44 = [(AAUISignInViewController *)self view];
  v42 = [v44 topAnchor];
  v41 = [v43 constraintEqualToAnchor:v42 constant:v11];
  v46[0] = v41;
  v38 = [v8 leadingAnchor];
  v40 = [(AAUISignInViewController *)self view];
  v39 = [v40 contentLayoutGuide];
  v37 = [v39 leadingAnchor];
  v35 = [v38 constraintEqualToSystemSpacingAfterAnchor:v37 multiplier:0.0];
  v46[1] = v35;
  v33 = [v8 trailingAnchor];
  v23 = [(AAUISignInViewController *)self view];
  v24 = [v23 contentLayoutGuide];
  v25 = [v24 trailingAnchor];
  v26 = [v33 constraintEqualToSystemSpacingAfterAnchor:v25 multiplier:0.0];
  v46[2] = v26;
  v27 = [v8 bottomAnchor];
  v28 = [(AAUISignInViewController *)self view];
  [v28 contentLayoutGuide];
  v29 = v34 = v8;
  v30 = [v29 bottomAnchor];
  v31 = [v27 constraintEqualToAnchor:v30];
  v46[3] = v31;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:4];
  [v36 activateConstraints:v32];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AAUISignInViewController;
  [(AAUISignInViewController *)&v8 viewWillAppear:a3];
  [(AAUISignInViewController *)self _beginObservingTextFieldDidChangeNotifications];
  [(AAUISignInViewController *)self _beginObservingKeyboardWillShowNotifications];
  [(AAUISignInViewController *)self _beginObservingSizeCategoryNotification];
  [(AAUISignInViewController *)self _setEnabled:1];
  v4 = [(AAUISignInViewController *)self _usernameCell];
  v5 = [v4 cellTextField];

  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v7 = [v6 localizedStringForKey:@"SIGN_IN_USERNAME_PLACEHOLDER" value:&stru_26BD39CD8 table:@"Localizable"];
  [v5 setPlaceholder:v7];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AAUISignInViewController;
  [(AAUISignInViewController *)&v3 viewDidAppear:a3];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)AAUISignInViewController;
  [(AAUISignInViewController *)&v4 viewWillLayoutSubviews];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__AAUISignInViewController_viewWillLayoutSubviews__block_invoke;
  v3[3] = &unk_263F92168;
  v3[4] = self;
  [MEMORY[0x263F82E00] performWithoutAnimation:v3];
}

uint64_t __50__AAUISignInViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 976);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__AAUISignInViewController_viewWillLayoutSubviews__block_invoke_2;
  v4[3] = &unk_263F92168;
  v4[4] = v1;
  return [v2 performBatchUpdates:v4 completion:0];
}

uint64_t __50__AAUISignInViewController_viewWillLayoutSubviews__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateExpandingViewInFooterForCellChange:0];
}

- (double)_initialHeight
{
  initialHeight = self->_initialHeight;
  if (!initialHeight)
  {
    objc_super v4 = NSNumber;
    v5 = [(AAUISignInViewController *)self view];
    [v5 frame];
    objc_super v7 = [v4 numberWithDouble:v6];
    objc_super v8 = self->_initialHeight;
    self->_initialHeight = v7;

    initialHeight = self->_initialHeight;
  }
  [(NSNumber *)initialHeight floatValue];
  return v9;
}

- (void)_updateExpandingViewInFooterForCellChange:(BOOL)a3
{
  BOOL v3 = a3;
  [(AAUISignInViewController *)self _navigationBarHeight];
  double v6 = v5;
  [(AAUIOBHeaderView *)self->_obHeaderView topPadding];
  if (v6 >= v7) {
    double v8 = v6;
  }
  else {
    double v8 = v7;
  }
  [(AAUISignInViewControllerTableFooterView *)self->_tableFooterView frame];
  double v10 = v9;
  double v11 = [MEMORY[0x263F82670] currentDevice];
  if (objc_msgSend(v11, "sf_isiPad"))
  {

LABEL_7:
    [(AAUISignInViewController *)self _initialHeight];
    double v15 = v14;
    goto LABEL_9;
  }
  v12 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  if (v13 == 6) {
    goto LABEL_7;
  }
  v16 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v17 = [v16 keyWindow];

  [v17 safeAreaInsets];
  double v19 = v18;
  double v21 = v20;
  double v22 = [MEMORY[0x263F82B60] mainScreen];
  [v22 bounds];
  double v24 = v23;

  double v15 = v24 - v21 - v19;
LABEL_9:
  [(AAUISignInViewControllerTableFooterView *)self->_tableFooterView naturalHeight];
  double v26 = v25;
  double v27 = v15 - v8 - v10;
  double v28 = 0.0;
  if (v27 >= v26)
  {
    double v29 = v27 - v26;
    BOOL v30 = [(AAUISignInViewController *)self _isPasswordFieldVisible];
    double v31 = 44.0;
    if (v30) {
      double v31 = -44.0;
    }
    if (!v3) {
      double v31 = 0.0;
    }
    double v28 = v29 + v31;
  }
  tableFooterView = self->_tableFooterView;
  [(AAUISignInViewControllerTableFooterView *)tableFooterView setExpandableViewToHeight:v28];
}

- (double)_navigationBarHeight
{
  BOOL v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 orientation];

  if ((unint64_t)(v4 - 1) > 1)
  {
    double v9 = [(AAUISignInViewController *)self navigationController];
    double v10 = [v9 navigationBar];
    [v10 frame];
    double navigationBarHeightPortrait = v11;
  }
  else
  {
    double navigationBarHeightPortrait = self->_navigationBarHeightPortrait;
    if (navigationBarHeightPortrait == 0.0)
    {
      double v6 = [(AAUISignInViewController *)self navigationController];
      double v7 = [v6 navigationBar];
      [v7 frame];
      self->_double navigationBarHeightPortrait = v8;

      return self->_navigationBarHeightPortrait;
    }
  }
  return navigationBarHeightPortrait;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AAUISignInViewController;
  [(AAUISignInViewController *)&v4 viewDidDisappear:a3];
  [(AAUISignInViewController *)self _endObservingSizeCategoryNotification];
  [(AAUISignInViewController *)self _endObservingTextFieldDidChangeNotifications];
  [(AAUISignInViewController *)self _endObservingKeyboardWillShowNotifications];
}

- (void)dealloc
{
  [(AAUISignInViewController *)self _endObservingSizeCategoryNotification];
  [(AAUISignInViewController *)self _endObservingTextFieldDidChangeNotifications];
  [(AAUISignInViewController *)self _endObservingKeyboardWillShowNotifications];
  v3.receiver = self;
  v3.super_class = (Class)AAUISignInViewController;
  [(AAUISignInViewController *)&v3 dealloc];
}

- (id)authenticationContext
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_super v3 = [(AAUISignInViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 authenticationContext];
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x263F292A8]);
    [v4 setAuthenticationType:2];
    [v4 setFirstTimeLogin:1];
    [v4 setPresentingViewController:self];
    objc_msgSend(v4, "setServiceType:", -[AAUISignInViewController _akServiceType](self, "_akServiceType"));
    [v4 setShouldOfferSecurityUpgrade:0];
    [v4 setShouldUpdatePersistentServiceTokens:1];
    BOOL v5 = [(AAUISignInViewController *)self _shouldAnticipatePiggybacking];
    double v6 = _AAUILogSystem();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        double v8 = (objc_class *)objc_opt_class();
        double v9 = NSStringFromClass(v8);
        int v13 = 138412290;
        double v14 = v9;
        _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "%@ detected primary iCloud sign in.", (uint8_t *)&v13, 0xCu);
      }
      [v4 setAnticipateEscrowAttempt:1];
      [v4 setShouldOfferSecurityUpgrade:1];
      [v4 setSupportsPiggybacking:1];
    }
    else
    {
      if (v7)
      {
        double v10 = (objc_class *)objc_opt_class();
        double v11 = NSStringFromClass(v10);
        int v13 = 138412290;
        double v14 = v11;
        _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "%@ detected non-primary iCloud sign in.", (uint8_t *)&v13, 0xCu);
      }
    }
  }

  return v4;
}

- (UIImageView)headerImageView
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:self->_headerImage];
  return (UIImageView *)v2;
}

- (void)setHeaderImage:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_headerImage, a3);
  obHeaderView = self->_obHeaderView;
  if (obHeaderView) {
    [(AAUIOBHeaderView *)obHeaderView setIcon:v6 accessibilityLabel:0];
  }
}

- (id)_cancelBarButtonItem
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:24 target:self action:sel__cancelButtonSelected_];
  [v2 setAccessibilityIdentifier:@"cancel-button"];
  return v2;
}

- (id)_backBarButtonItem
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:101 target:self action:sel__cancelButtonSelected_];
  [v2 setAccessibilityIdentifier:@"back-button"];
  return v2;
}

- (id)_defaultHeaderImage
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (+[AAUISignInViewController _isRunningInBridge]) {
    objc_super v3 = @"AppleAccount_Icon_Orange";
  }
  else {
    objc_super v3 = @"AppleAccount_Icon_Blue";
  }
  id v4 = [MEMORY[0x263F827E8] imageNamed:v3 inBundle:v2];

  return v4;
}

- (id)_tableHeaderView
{
  tableHeaderView = self->_tableHeaderView;
  if (!tableHeaderView)
  {
    id v4 = [AAUIBuddyView alloc];
    BOOL v5 = -[AAUIBuddyView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v6 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(AAUIBuddyView *)v5 setBackgroundColor:v6];

    [(AAUIBuddyView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    BOOL v7 = [(AAUISignInViewController *)self _prepareOBHeaderView];
    double v8 = (UITableViewHeaderFooterView *)objc_alloc_init(MEMORY[0x263F82CA0]);
    double v9 = self->_tableHeaderView;
    self->_tableHeaderView = v8;

    double v10 = self->_tableHeaderView;
    double v11 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(UITableViewHeaderFooterView *)v10 setBackgroundColor:v11];

    [(UITableViewHeaderFooterView *)self->_tableHeaderView setAccessibilityIdentifier:@"header-view"];
    [(AAUISignInViewController *)self constrainView:self->_obHeaderView toFillHeaderFooterView:self->_tableHeaderView];
    [MEMORY[0x263F08938] activateConstraints:v7];
    [(AAUIOBHeaderView *)self->_obHeaderView setNeedsLayout];
    [(AAUIOBHeaderView *)self->_obHeaderView layoutIfNeeded];

    tableHeaderView = self->_tableHeaderView;
  }
  return tableHeaderView;
}

- (AKAppleIDAuthenticationController)authenticationController
{
  authenticationController = self->_authenticationController;
  if (authenticationController) {
    objc_super v3 = authenticationController;
  }
  else {
    objc_super v3 = (AKAppleIDAuthenticationController *)objc_alloc_init(MEMORY[0x263F29118]);
  }
  return v3;
}

- (id)_prepareOBHeaderView
{
  v54[8] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [(AAUISignInViewController *)self authenticationContext];
  BOOL v5 = [v4 title];
  if ([v5 length])
  {
    id v6 = [v4 title];
  }
  else
  {
    BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v8 = @"SIGN_IN_TITLE";
    if (([@"SIGN_IN_TITLE" containsString:@"REBRAND"] & 1) != 0
      || !_os_feature_enabled_impl())
    {
      int v9 = 0;
    }
    else
    {
      double v8 = [@"SIGN_IN_TITLE" stringByAppendingString:@"_REBRAND"];
      int v9 = 1;
    }
    id v6 = [v7 localizedStringForKey:v8 value:&stru_26BD39CD8 table:@"Localizable"];
    if (v9) {
  }
    }
  double v10 = [v4 reason];
  if ([v10 length]) {
    [v4 reason];
  }
  else {
  double v11 = [(AAUISignInViewController *)self messageLabel];
  }

  headerImage = self->_headerImage;
  int v13 = [AAUIOBHeaderView alloc];
  if (headerImage)
  {
    double v14 = self->_headerImage;
    uint64_t v15 = v6;
    v16 = v11;
  }
  else
  {
    uint64_t v15 = v6;
    v16 = v11;
    double v14 = 0;
  }
  uint64_t v17 = [(AAUIOBHeaderView *)v13 initWithTitle:v15 detailText:v16 icon:v14];
  obHeaderView = self->_obHeaderView;
  self->_obHeaderView = v17;

  [(AAUIOBHeaderView *)self->_obHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
  if (!self->_headerImage && self->_showServiceIcons)
  {
    double v19 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    logoContainerView = self->_logoContainerView;
    self->_logoContainerView = v19;

    -[UIView setFrame:](self->_logoContainerView, "setFrame:", 0.0, 50.0, 373.0, 373.0);
    [(UIView *)self->_logoContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    double v21 = objc_alloc_init(AAUIAppleLogoMicaView);
    appleLogoMicaView = self->_appleLogoMicaView;
    self->_appleLogoMicaView = v21;

    [(AAUIAppleLogoMicaView *)self->_appleLogoMicaView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_logoContainerView addSubview:self->_appleLogoMicaView];
    double v23 = [(AAUIOBHeaderView *)self->_obHeaderView animationView];
    [v23 addSubview:self->_logoContainerView];

    double v24 = [(AAUIOBHeaderView *)self->_obHeaderView animationView];
    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v25 = [(AAUIOBHeaderView *)self->_obHeaderView animationView];
    [v25 setClipsToBounds:1];

    v51 = [(UIView *)self->_logoContainerView centerXAnchor];
    v52 = [(AAUIOBHeaderView *)self->_obHeaderView animationView];
    v50 = [v52 centerXAnchor];
    v49 = [v51 constraintEqualToAnchor:v50];
    v54[0] = v49;
    v47 = [(UIView *)self->_logoContainerView centerYAnchor];
    v48 = [(AAUIOBHeaderView *)self->_obHeaderView animationView];
    v46 = [v48 centerYAnchor];
    objc_super v45 = [v47 constraintEqualToAnchor:v46];
    v54[1] = v45;
    v44 = [(UIView *)self->_logoContainerView heightAnchor];
    v43 = [v44 constraintEqualToConstant:373.0];
    v54[2] = v43;
    v42 = [(UIView *)self->_logoContainerView widthAnchor];
    v41 = [v42 constraintEqualToConstant:373.0];
    v54[3] = v41;
    v40 = [(AAUIAppleLogoMicaView *)self->_appleLogoMicaView topAnchor];
    v39 = [(UIView *)self->_logoContainerView topAnchor];
    v38 = [v40 constraintEqualToAnchor:v39];
    v54[4] = v38;
    v36 = [(AAUIAppleLogoMicaView *)self->_appleLogoMicaView bottomAnchor];
    v35 = [(UIView *)self->_logoContainerView bottomAnchor];
    double v26 = [v36 constraintEqualToAnchor:v35];
    v54[5] = v26;
    [(AAUIAppleLogoMicaView *)self->_appleLogoMicaView leadingAnchor];
    v28 = double v27 = v3;
    [(UIView *)self->_logoContainerView leadingAnchor];
    double v29 = v53 = v6;
    BOOL v30 = [v28 constraintEqualToAnchor:v29];
    v54[6] = v30;
    double v31 = [(AAUIAppleLogoMicaView *)self->_appleLogoMicaView trailingAnchor];
    v32 = [(UIView *)self->_logoContainerView trailingAnchor];
    v33 = [v31 constraintEqualToAnchor:v32];
    v54[7] = v33;
    uint64_t v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:8];

    id v6 = v53;
    id v3 = (id)v37;
  }

  return v3;
}

- (void)setMessageLabel:(id)a3
{
  self->_messageLabel = (NSString *)a3;
  obHeaderView = self->_obHeaderView;
  id v5 = a3;
  id v6 = [(AAUIOBHeaderView *)obHeaderView title];
  id v7 = (id)[v6 copy];

  [(AAUIOBHeaderView *)self->_obHeaderView setDetailText:v5];
  [(AAUIOBHeaderView *)self->_obHeaderView setTitle:v7];
}

- (id)_tableView
{
  tableView = self->_tableView;
  if (!tableView)
  {
    id v4 = objc_alloc(MEMORY[0x263F82C78]);
    id v5 = (UITableView *)objc_msgSend(v4, "initWithFrame:style:", self->_tableViewStyle, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v6 = self->_tableView;
    self->_tableView = v5;

    [(UITableView *)self->_tableView setAllowsSelection:0];
    id v7 = self->_tableView;
    double v8 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(UITableView *)v7 setBackgroundColor:v8];

    [(UITableView *)self->_tableView setClipsToBounds:0];
    [(UITableView *)self->_tableView setDataSource:self];
    [(UITableView *)self->_tableView setDelegate:self];
    [(UITableView *)self->_tableView _setDrawsSeparatorAtTopOfSections:1];
    [(UITableView *)self->_tableView setSeparatorStyle:1];
    [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITableView *)self->_tableView setContentInsetAdjustmentBehavior:2];
    [(UITableView *)self->_tableView registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"AAUISignInViewControllerTableFooterView"];
    tableView = self->_tableView;
  }
  return tableView;
}

- (id)_usernameCell
{
  usernameCell = self->_usernameCell;
  if (!usernameCell)
  {
    id v4 = (AKBasicLoginTableViewCell *)[objc_alloc(MEMORY[0x263F292D0]) initWithStyle:0 reuseIdentifier:0];
    id v5 = self->_usernameCell;
    self->_usernameCell = v4;

    if (self->_cellBackgroundColor)
    {
      -[AKBasicLoginTableViewCell setBackgroundColor:](self->_usernameCell, "setBackgroundColor:");
      id v6 = [(AKBasicLoginTableViewCell *)self->_usernameCell contentView];
      [v6 setBackgroundColor:self->_cellBackgroundColor];
    }
    id v7 = self->_usernameCell;
    double v8 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_usernameCellTapped_];
    [(AKBasicLoginTableViewCell *)v7 addGestureRecognizer:v8];

    int v9 = [(AKBasicLoginTableViewCell *)self->_usernameCell cellTextField];
    [v9 setDelegate:self];

    double v10 = [(AKBasicLoginTableViewCell *)self->_usernameCell cellTextField];
    [v10 setKeyboardType:7];

    double v11 = [(AKBasicLoginTableViewCell *)self->_usernameCell cellTextField];
    [v11 setReturnKeyType:11];

    v12 = [(AKBasicLoginTableViewCell *)self->_usernameCell cellTextField];
    int v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v14 = [v13 localizedStringForKey:@"SIGN_IN_USERNAME_PLACEHOLDER" value:&stru_26BD39CD8 table:@"Localizable"];
    [v12 setPlaceholder:v14];

    uint64_t v15 = [(AKBasicLoginTableViewCell *)self->_usernameCell cellTextField];
    [v15 setTextContentType:*MEMORY[0x263F83AA8]];

    v16 = [(AKBasicLoginTableViewCell *)self->_usernameCell cellTextField];
    uint64_t v17 = [MEMORY[0x263F825C8] labelColor];
    [v16 setTextColor:v17];

    if (self->_username)
    {
      double v18 = [(AKBasicLoginTableViewCell *)self->_usernameCell cellTextField];
      [v18 setText:self->_username];

      if (!self->_canEditUsername)
      {
        double v19 = [(AKBasicLoginTableViewCell *)self->_usernameCell cellTextField];
        double v20 = [MEMORY[0x263F825C8] lightGrayColor];
        [v19 setTextColor:v20];

        double v21 = [(AKBasicLoginTableViewCell *)self->_usernameCell cellTextField];
        [v21 setUserInteractionEnabled:0];
      }
      [(AAUISignInViewController *)self _setContinueButtonEnabled:1];
      double v22 = [(AAUISignInViewController *)self navigationItem];
      double v23 = [v22 rightBarButtonItem];
      [v23 setEnabled:1];
    }
    double v24 = [(AKBasicLoginTableViewCell *)self->_usernameCell cellTextField];
    [v24 setAccessibilityIdentifier:@"username-field"];

    usernameCell = self->_usernameCell;
  }
  return usernameCell;
}

- (id)_passwordCell
{
  passwordCell = self->_passwordCell;
  if (!passwordCell)
  {
    id v4 = (AKBasicLoginTableViewCell *)[objc_alloc(MEMORY[0x263F292D0]) initWithStyle:0 reuseIdentifier:0];
    id v5 = self->_passwordCell;
    self->_passwordCell = v4;

    if (self->_cellBackgroundColor)
    {
      -[AKBasicLoginTableViewCell setBackgroundColor:](self->_passwordCell, "setBackgroundColor:");
      id v6 = [(AKBasicLoginTableViewCell *)self->_passwordCell contentView];
      [v6 setBackgroundColor:self->_cellBackgroundColor];
    }
    id v7 = self->_passwordCell;
    double v8 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_passwordCellTapped_];
    [(AKBasicLoginTableViewCell *)v7 addGestureRecognizer:v8];

    int v9 = [(AKBasicLoginTableViewCell *)self->_passwordCell cellTextField];
    [v9 setDelegate:self];

    double v10 = [(AKBasicLoginTableViewCell *)self->_passwordCell cellTextField];
    [v10 setReturnKeyType:9];

    double v11 = [(AKBasicLoginTableViewCell *)self->_passwordCell cellTextField];
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v13 = [v12 localizedStringForKey:@"SIGN_IN_PASSWORD_PLACEHOLDER" value:&stru_26BD39CD8 table:@"Localizable"];
    [v11 setPlaceholder:v13];

    double v14 = [(AKBasicLoginTableViewCell *)self->_passwordCell cellTextField];
    [v14 setSecureTextEntry:1];

    uint64_t v15 = [(AKBasicLoginTableViewCell *)self->_passwordCell cellTextField];
    v16 = [MEMORY[0x263F825C8] labelColor];
    [v15 setTextColor:v16];

    uint64_t v17 = [(AKBasicLoginTableViewCell *)self->_passwordCell cellTextField];
    [v17 setTextContentType:*MEMORY[0x263F83A70]];

    double v18 = [(AKBasicLoginTableViewCell *)self->_passwordCell cellTextField];
    [v18 setAccessibilityIdentifier:@"password-field"];

    passwordCell = self->_passwordCell;
  }
  return passwordCell;
}

- (void)usernameCellTapped:(id)a3
{
  id v3 = [(AKBasicLoginTableViewCell *)self->_usernameCell cellTextField];
  [v3 becomeFirstResponder];
}

- (void)passwordCellTapped:(id)a3
{
  id v3 = [(AKBasicLoginTableViewCell *)self->_passwordCell cellTextField];
  [v3 becomeFirstResponder];
}

- (id)forgotButtonLocalizedString
{
  if ([(AAUISignInViewController *)self allowsAccountCreation]) {
    v2 = @"SIGN_IN_HELP_BUTTON_FORGOT_OR_CREATE";
  }
  else {
    v2 = @"SIGN_IN_HELP_BUTTON_FORGOT";
  }
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:v2 value:&stru_26BD39CD8 table:@"Localizable"];

  return v4;
}

- (void)setHideCreationAndForgotPasswordButton:(BOOL)a3
{
  self->_hideCreationAndForgotPasswordButton = a3;
  BOOL v4 = [(AAUISignInViewController *)self hideCreationAndForgotPasswordButton];
  id v5 = [(AAUISignInViewController *)self forgotOrCreateButton];
  [v5 setHidden:v4];
}

- (id)_accountHelpStackView
{
  accountHelpStackView = self->_accountHelpStackView;
  if (!accountHelpStackView)
  {
    id v4 = objc_alloc(MEMORY[0x263F82BF8]);
    id v5 = (UIStackView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(UIStackView *)v5 setAxis:1];
    [(UIStackView *)v5 setAlignment:0];
    [(UIStackView *)v5 setDistribution:0];
    [(UIStackView *)v5 setLayoutMarginsRelativeArrangement:1];
    [(UIStackView *)v5 setSpacing:16.0];
    [(UIStackView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    BOOL v6 = [(AAUISignInViewController *)self hideCreationAndForgotPasswordButton];
    id v7 = (void *)MEMORY[0x263F83570];
    if (!v6)
    {
      double v8 = +[AAUIButton buttonWithType:1];
      [(AAUISignInViewController *)self setForgotOrCreateButton:v8];
      [v8 addTarget:self action:sel__actionButtonSelected_ forControlEvents:64];
      int v9 = [(AAUISignInViewController *)self forgotButtonLocalizedString];
      [v8 setTitle:v9 forState:0];

      double v10 = [v8 titleLabel];
      [v10 setAdjustsFontForContentSizeCategory:1];

      double v11 = [v8 titleLabel];
      [v11 setLineBreakMode:0];

      v12 = [v8 titleLabel];
      [v12 setNumberOfLines:0];

      int v13 = [v8 titleLabel];
      [v13 setTextAlignment:1];

      double v14 = [v8 titleLabel];
      uint64_t v15 = [MEMORY[0x263F81708] preferredFontForTextStyle:*v7];
      [v14 setFont:v15];

      [v8 setAccessibilityIdentifier:@"footer-button"];
      [(UIStackView *)v5 addArrangedSubview:v8];
    }
    if ([(AAUISignInViewController *)self _shouldShowChildSignButton])
    {
      v16 = +[AAUIButton buttonWithType:1];
      [v16 addTarget:self action:sel__childSignInSelected_ forControlEvents:64];
      uint64_t v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v18 = [v17 localizedStringForKey:@"SIGN_IN_FOR_CHILD_BUTTON_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];
      [v16 setTitle:v18 forState:0];

      double v19 = [v16 titleLabel];
      [v19 setAdjustsFontForContentSizeCategory:1];

      double v20 = [v16 titleLabel];
      [v20 setLineBreakMode:0];

      double v21 = [v16 titleLabel];
      [v21 setNumberOfLines:0];

      double v22 = [v16 titleLabel];
      [v22 setTextAlignment:1];

      double v23 = [v16 titleLabel];
      double v24 = [MEMORY[0x263F81708] preferredFontForTextStyle:*v7];
      [v23 setFont:v24];

      [v16 setAccessibilityIdentifier:@"child-sign-in-button"];
      [(UIStackView *)v5 addArrangedSubview:v16];
    }
    double v25 = self->_accountHelpStackView;
    self->_accountHelpStackView = v5;

    accountHelpStackView = self->_accountHelpStackView;
  }
  return accountHelpStackView;
}

- (id)_continueButton
{
  continueButton = self->_continueButton;
  if (!continueButton)
  {
    id v4 = [MEMORY[0x263F5B898] boldButton];
    id v5 = self->_continueButton;
    self->_continueButton = v4;

    BOOL v6 = [MEMORY[0x263F824F0] filledButtonConfiguration];
    [v6 setButtonSize:3];
    id v7 = [v6 background];
    [v7 setCornerRadius:14.0];

    [(OBBoldTrayButton *)self->_continueButton setConfiguration:v6];
    [(OBBoldTrayButton *)self->_continueButton setTranslatesAutoresizingMaskIntoConstraints:0];
    double v8 = self->_continueButton;
    int v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v10 = [v9 localizedStringForKey:@"SIGN_IN_BUTTON_CONTINUE" value:&stru_26BD39CD8 table:@"Localizable"];
    [(OBBoldTrayButton *)v8 setTitle:v10 forState:0];

    [(OBBoldTrayButton *)self->_continueButton addTarget:self action:sel__continueButtonSelected_ forControlEvents:64];
    [(OBBoldTrayButton *)self->_continueButton setAccessibilityIdentifier:@"continue-button"];

    continueButton = self->_continueButton;
  }
  return continueButton;
}

- (id)_otherOptionsButton
{
  otherOptionsButton = self->_otherOptionsButton;
  if (!otherOptionsButton)
  {
    id v4 = (UIButton *)objc_alloc_init(MEMORY[0x263F824E8]);
    [(UIButton *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v6 = [v5 localizedStringForKey:@"SIGN_IN_OTHER_SIGN_IN_OPTIONS" value:&stru_26BD39CD8 table:@"Localizable"];
    [(UIButton *)v4 setTitle:v6 forState:0];

    [(UIButton *)v4 addTarget:self action:sel__delegate_signInViewControllerDidSelectOtherOptions forControlEvents:64];
    id v7 = [MEMORY[0x263F824F0] plainButtonConfiguration];
    [v7 setButtonSize:0];
    [(UIButton *)v4 setConfiguration:v7];
    double v8 = self->_otherOptionsButton;
    self->_otherOptionsButton = v4;
    int v9 = v4;

    [(UIButton *)self->_otherOptionsButton setAccessibilityIdentifier:@"other-options-button"];
    otherOptionsButton = self->_otherOptionsButton;
  }
  return otherOptionsButton;
}

- (void)constrainView:(id)a3 toFillHeaderFooterView:(id)a4
{
  v38[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 contentView];
  [v7 addSubview:v5];

  double v29 = [v5 topAnchor];
  BOOL v30 = [v6 contentView];
  double v28 = [v30 topAnchor];
  double v27 = [v29 constraintEqualToAnchor:v28];
  v38[0] = v27;
  double v25 = [v5 leftAnchor];
  double v26 = [v6 contentView];
  double v8 = [v26 leftAnchor];
  int v9 = [v25 constraintEqualToAnchor:v8];
  v38[1] = v9;
  double v10 = [v5 bottomAnchor];
  double v11 = [v6 contentView];
  v12 = [v11 bottomAnchor];
  int v13 = [v10 constraintEqualToAnchor:v12];
  v38[2] = v13;
  v32 = v5;
  double v14 = [v5 rightAnchor];
  double v31 = v6;
  uint64_t v15 = [v6 contentView];
  v16 = [v15 rightAnchor];
  uint64_t v17 = [v14 constraintEqualToAnchor:v16];
  v38[3] = v17;
  double v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:4];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v18 = v24;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v34;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v18);
        }
        LODWORD(v20) = 1148829696;
        [*(id *)(*((void *)&v33 + 1) + 8 * v23++) setPriority:v20];
      }
      while (v21 != v23);
      uint64_t v21 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v21);
  }

  [MEMORY[0x263F08938] activateConstraints:v18];
}

- (BOOL)_hasValidCredentials
{
  id v3 = [(AKBasicLoginTableViewCell *)self->_usernameCell cellTextField];
  id v4 = [v3 text];
  uint64_t v5 = [v4 length];

  if (!v5) {
    return 0;
  }
  if (![(AAUISignInViewController *)self _isPasswordFieldVisible]) {
    return 1;
  }
  id v6 = [(AKBasicLoginTableViewCell *)self->_passwordCell cellTextField];
  id v7 = [v6 text];
  BOOL v8 = [v7 length] != 0;

  return v8;
}

- (BOOL)_isPasswordFieldVisible
{
  return [(AAUISignInViewController *)self _showOnlyPassword] || self->_showingPasswordCell;
}

- (BOOL)_isGreenTeaCapable
{
  return MEMORY[0x270F95FB8](@"green-tea", a2);
}

+ (BOOL)_isRunningInMuseBuddy
{
  if (_isRunningInMuseBuddy_onceToken != -1) {
    dispatch_once(&_isRunningInMuseBuddy_onceToken, &__block_literal_global_2);
  }
  return _isRunningInMuseBuddy_isRunningInMuseBuddy;
}

void __49__AAUISignInViewController__isRunningInMuseBuddy__block_invoke()
{
  id v1 = [MEMORY[0x263F086E0] mainBundle];
  v0 = [v1 bundleIdentifier];
  _isRunningInMuseBuddy_isRunningInMuseBuddy = [v0 isEqualToString:@"com.apple.MuseBuddy"];
}

+ (BOOL)_isRunningInSettings
{
  if (_isRunningInSettings_onceToken != -1) {
    dispatch_once(&_isRunningInSettings_onceToken, &__block_literal_global_174);
  }
  return _isRunningInSettings_isRunningInSettings;
}

void __48__AAUISignInViewController__isRunningInSettings__block_invoke()
{
  id v1 = [MEMORY[0x263F086E0] mainBundle];
  v0 = [v1 bundleIdentifier];
  _isRunningInSettings_isRunningInSettings = [v0 isEqualToString:@"com.apple.Preferences"];
}

+ (BOOL)_isRunningInBridge
{
  if (_isRunningInBridge_onceToken != -1) {
    dispatch_once(&_isRunningInBridge_onceToken, &__block_literal_global_179);
  }
  return _isRunningInBridge_isRunningInBridge;
}

void __46__AAUISignInViewController__isRunningInBridge__block_invoke()
{
  id v1 = [MEMORY[0x263F086E0] mainBundle];
  v0 = [v1 bundleIdentifier];
  _isRunningInBridge_isRunningInBridge = [v0 isEqualToString:@"com.apple.Bridge"];
}

- (BOOL)_shouldShowChildSignButton
{
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    LOBYTE(v3) = [(AAUISignInViewController *)self _showsChildSignIn];
  }
  return v3;
}

- (void)_setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(AAUISignInViewController *)self navigationItem];
  id v6 = [v5 leftBarButtonItem];
  [v6 setEnabled:v3];

  id v7 = [(AKBasicLoginTableViewCell *)self->_usernameCell cellTextField];
  [v7 setEnabled:v3];

  BOOL v8 = [(AKBasicLoginTableViewCell *)self->_passwordCell cellTextField];
  [v8 setEnabled:v3];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_forgotOrCreateButton);
  if (WeakRetained)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_forgotOrCreateButton);
    [v10 setEnabled:v3];
  }
  id v11 = objc_loadWeakRetained((id *)&self->_forgotButton);

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_forgotButton);
    [v12 setEnabled:v3];
  }
  id v13 = objc_loadWeakRetained((id *)&self->_createButton);

  if (v13)
  {
    id v14 = objc_loadWeakRetained((id *)&self->_createButton);
    [v14 setEnabled:v3];
  }
  otherOptionsButton = self->_otherOptionsButton;
  if (otherOptionsButton) {
    [(UIButton *)otherOptionsButton setEnabled:v3];
  }
  v16 = [(AAUISignInViewControllerTableFooterView *)self->_tableFooterView privacyLinkController];

  if (v16)
  {
    uint64_t v17 = [(AAUISignInViewControllerTableFooterView *)self->_tableFooterView privacyLinkController];
    [v17 setLinkEnabled:v3];

    if (v3)
    {
      tintColor = self->_tintColor;
      if (tintColor)
      {
        uint64_t v19 = [(AAUISignInViewControllerTableFooterView *)self->_tableFooterView privacyLinkController];
        [v19 setCustomTintColor:tintColor];
      }
      [(AAUISignInViewController *)self _setUsernameCellWaiting:0];
      goto LABEL_15;
    }
    [(AAUISignInViewController *)self _setUsernameCellWaiting:1];
  }
  else
  {
    uint64_t v20 = v3 ^ 1;
    [(AAUISignInViewController *)self _setUsernameCellWaiting:v20];
    if ((v20 & 1) == 0)
    {
LABEL_15:
      BOOL v21 = [(AAUISignInViewController *)self _hasValidCredentials];
      goto LABEL_18;
    }
  }
  BOOL v21 = 0;
LABEL_18:
  [(AAUISignInViewController *)self _setContinueButtonEnabled:v21];
}

- (void)_setContinueButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AAUISignInViewController *)self _continueButton];
  [v4 setEnabled:v3];
}

- (void)_continueButtonSelected:(id)a3
{
  if ([(AAUISignInViewController *)self _hasValidCredentials])
  {
    [(AAUISignInViewController *)self _attemptAuthentication];
    [(AAUISignInViewController *)self _prewarmSignInFlowIfApplicable];
  }
}

- (void)_actionButtonSelected:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "User selected the action button...", (uint8_t *)buf, 2u);
  }

  [(AAUISignInViewController *)self _setEnabled:0];
  if ([(AAUISignInViewController *)self allowsAccountCreation]
    || [(AAUISignInViewController *)self allowSkip])
  {
    id v29 = v4;
    [(AAUISignInViewController *)self _resignFirstResponderForAppropriateTextField];
    BOOL v6 = [(AAUISignInViewController *)self allowsAccountCreation];
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v8 = v7;
    if (v6) {
      int v9 = @"SIGN_IN_HELP_ALERT_TITLE_FORGOT_OR_CREATE";
    }
    else {
      int v9 = @"SIGN_IN_HELP_ALERT_TITLE_FORGOT_PASSWORD";
    }
    id v10 = [v7 localizedStringForKey:v9 value:&stru_26BD39CD8 table:@"Localizable"];

    id v11 = [MEMORY[0x263F82418] alertWithTitle:v10 message:0];
    id v12 = (void *)MEMORY[0x263F82400];
    id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v14 = [v13 localizedStringForKey:@"SIGN_IN_HELP_ALERT_BUTTON_FORGOT" value:&stru_26BD39CD8 table:@"Localizable"];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __50__AAUISignInViewController__actionButtonSelected___block_invoke;
    v35[3] = &unk_263F927A8;
    v35[4] = self;
    uint64_t v15 = [v12 actionWithTitle:v14 style:0 handler:v35];
    [v11 addAction:v15];

    if ([(AAUISignInViewController *)self allowsAccountCreation])
    {
      v16 = (void *)MEMORY[0x263F82400];
      uint64_t v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v18 = [v17 localizedStringForKey:@"SIGN_IN_HELP_ALERT_BUTTON_CREATE" value:&stru_26BD39CD8 table:@"Localizable"];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __50__AAUISignInViewController__actionButtonSelected___block_invoke_2;
      v34[3] = &unk_263F927A8;
      v34[4] = self;
      uint64_t v19 = [v16 actionWithTitle:v18 style:0 handler:v34];
      [v11 addAction:v19];
    }
    if ([(AAUISignInViewController *)self allowSkip])
    {
      uint64_t v20 = (void *)MEMORY[0x263F82400];
      BOOL v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v22 = [v21 localizedStringForKey:@"SIGN_IN_HELP_ALERT_BUTTON_LATER" value:&stru_26BD39CD8 table:@"Localizable"];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __50__AAUISignInViewController__actionButtonSelected___block_invoke_3;
      v33[3] = &unk_263F927A8;
      v33[4] = self;
      uint64_t v23 = [v20 actionWithTitle:v22 style:0 handler:v33];
      [v11 addAction:v23];
    }
    objc_initWeak(buf, self);
    double v24 = (void *)MEMORY[0x263F82400];
    double v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v26 = [v25 localizedStringForKey:@"SIGN_IN_HELP_ALERT_BUTTON_CANCEL" value:&stru_26BD39CD8 table:@"Localizable"];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __50__AAUISignInViewController__actionButtonSelected___block_invoke_4;
    v30[3] = &unk_263F928F0;
    objc_copyWeak(&v31, buf);
    double v27 = [v24 actionWithTitle:v26 style:1 handler:v30];
    [v11 addAction:v27];

    [(AAUISignInViewController *)self presentViewController:v11 animated:1 completion:0];
    objc_destroyWeak(&v31);
    objc_destroyWeak(buf);

    id v4 = v29;
  }
  else
  {
    double v28 = _AAUILogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_209754000, v28, OS_LOG_TYPE_DEFAULT, "Not allowed to create account, presenting iForgot...", (uint8_t *)buf, 2u);
    }

    [(AAUISignInViewController *)self _presentForgotAppleIDPane];
  }
}

uint64_t __50__AAUISignInViewController__actionButtonSelected___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentForgotAppleIDPane];
}

uint64_t __50__AAUISignInViewController__actionButtonSelected___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentCreateAppleIDPane];
}

uint64_t __50__AAUISignInViewController__actionButtonSelected___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_delegate_signInViewControllerDidSkip");
}

void __50__AAUISignInViewController__actionButtonSelected___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setEnabled:1];

  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_209754000, v2, OS_LOG_TYPE_DEFAULT, "User canceled the action alert.", v3, 2u);
  }
}

- (void)_resignFirstResponderForAppropriateTextField
{
  BOOL v3 = [(AAUISignInViewController *)self _isPasswordFieldVisible];
  id v4 = &OBJC_IVAR___AAUISignInViewController__usernameCell;
  if (v3) {
    id v4 = &OBJC_IVAR___AAUISignInViewController__passwordCell;
  }
  id v5 = [*(id *)((char *)&self->super.super.super.isa + *v4) cellTextField];
  [v5 resignFirstResponder];
}

- (void)_presentCreateAppleIDPane
{
  BOOL v3 = [(AAUISignInViewController *)self authenticationContext];
  [v3 setNeedsCredentialRecovery:0];
  [v3 setNeedsNewAppleID:1];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2050000000;
  id v4 = (void *)getBYWarrantyClass_softClass;
  uint64_t v17 = getBYWarrantyClass_softClass;
  if (!getBYWarrantyClass_softClass)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __getBYWarrantyClass_block_invoke;
    v13[3] = &unk_263F92608;
    v13[4] = &v14;
    __getBYWarrantyClass_block_invoke((uint64_t)v13);
    id v4 = (void *)v15[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v14, 8);
  if ([v5 shouldDisplay])
  {
    BOOL v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Device warranty needed", (uint8_t *)v13, 2u);
    }

    id v7 = [v3 httpHeadersForRemoteUI];
    BOOL v8 = (void *)[v7 mutableCopy];
    int v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = (id)objc_opt_new();
    }
    id v11 = v10;

    [v11 setObject:@"true" forKey:@"X-MMe-Show-Warranty"];
    [v3 setHttpHeadersForRemoteUI:v11];
  }
  id v12 = _AAUILogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl(&dword_209754000, v12, OS_LOG_TYPE_DEFAULT, "User wants a new Apple ID, presenting AuthKit...", (uint8_t *)v13, 2u);
  }

  [(AAUISignInViewController *)self _attemptAuthenticationWithContext:v3];
}

- (void)_presentForgotAppleIDPane
{
  BOOL v3 = [(AAUISignInViewController *)self authenticationContext];
  [v3 setNeedsCredentialRecovery:1];
  [v3 setNeedsNewAppleID:0];
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "User forgot their Apple ID, presenting AuthKit...", v5, 2u);
  }

  [(AAUISignInViewController *)self _attemptAuthenticationWithContext:v3];
}

- (void)_childSignInSelected:(id)a3
{
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "User selected the child sign in button...", v6, 2u);
  }

  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(AAUISignInViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 signInViewControllerDidSelectChildSignIn:self];
  }
}

- (void)_prewarmSignInFlowIfApplicable
{
  if ([(AAUISignInViewController *)self showServiceIcons])
  {
    id v2 = objc_alloc_init(MEMORY[0x263F25988]);
    [v2 prewarmOperationsWithCompletion:0];
  }
}

- (void)_attemptAuthentication
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(AAUISignInViewController *)self _formatUsernameAsPhoneNumberIfNeeded];
  if (self->_passwordHandler)
  {
    [(AAUISignInViewController *)self _setEnabled:0];
    passwordHandler = (void (**)(id, void *, void))self->_passwordHandler;
    id v4 = [(AKBasicLoginTableViewCell *)self->_passwordCell cellTextField];
    id v5 = [v4 text];
    passwordHandler[2](passwordHandler, v5, 0);

    id v6 = self->_passwordHandler;
    self->_passwordHandler = 0;
  }
  else
  {
    id v7 = [(AKBasicLoginTableViewCell *)self->_usernameCell cellTextField];
    BOOL v8 = [v7 text];

    int v9 = [(AAUISignInViewController *)self _serverFriendlyUsername:v8];

    if ([(AAUISignInViewController *)self _isPasswordFieldVisible])
    {
      id v10 = [(AKBasicLoginTableViewCell *)self->_passwordCell cellTextField];
      id v11 = [v10 text];
    }
    else
    {
      id v11 = 0;
    }
    id v12 = [(AAUISignInViewController *)self authenticationContext];
    [v12 setNeedsCredentialRecovery:0];
    [v12 setNeedsNewAppleID:0];
    [v12 setUsername:v9];
    [v12 _setPassword:v11];
    [v12 _setPasswordDelegate:self];
    if (+[AAUISignInViewController _isRunningInSettings]&& ![(AAUISignInViewController *)self isChildSetupFlow])
    {
      [v12 setAppProvidedContext:*MEMORY[0x263F28F48]];
    }
    id v13 = _AAUILogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      uint64_t v15 = v9;
      _os_log_impl(&dword_209754000, v13, OS_LOG_TYPE_DEFAULT, "Attempting authentication for username '%{public}@'", (uint8_t *)&v14, 0xCu);
    }

    [(AAUISignInViewController *)self _attemptAuthenticationWithContext:v12];
  }
}

- (void)_attemptAuthenticationWithContext:(id)a3
{
  id v4 = a3;
  [(AAUISignInViewController *)self _setEnabled:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 willAuthenticateWithContext:v4];
  }
  BOOL v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AAUISignInViewController _attemptAuthenticationWithContext:](v8);
  }

  [MEMORY[0x263F25908] verifyAndFixPersonaIfNeeded:self->_originalPersona desiredContext:self->_originalPersonaContext];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy__2;
  uint64_t v15 = __Block_byref_object_dispose__2;
  id v16 = [(AAUISignInViewController *)self authenticationController];
  [(id)v12[5] setDelegate:self];
  int v9 = (void *)v12[5];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__AAUISignInViewController__attemptAuthenticationWithContext___block_invoke;
  v10[3] = &unk_263F92918;
  v10[4] = self;
  v10[5] = &v11;
  [v9 authenticateWithContext:v4 completion:v10];
  [MEMORY[0x263F25908] personaConsistencyCheck:self->_originalPersona];
  _Block_object_dispose(&v11, 8);
}

void __62__AAUISignInViewController__attemptAuthenticationWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__AAUISignInViewController__attemptAuthenticationWithContext___block_invoke_2;
  block[3] = &unk_263F92758;
  uint64_t v7 = *(void *)(a1 + 32);
  id v13 = v5;
  uint64_t v14 = v7;
  id v15 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

void __62__AAUISignInViewController__attemptAuthenticationWithContext___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263F28FE8]];

  if (v2)
  {
    BOOL v3 = _AAUILogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "Server returned continuation data, attempting to repair account...", buf, 2u);
    }

    [*(id *)(a1 + 40) _repairCloudAccountWithAuthenticationResults:*(void *)(a1 + 32)];
LABEL_5:
    [*(id *)(a1 + 40) _setEnabled:1];
    return;
  }
  id v4 = *(void **)(a1 + 32);
  if (!v4)
  {
    uint64_t v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __62__AAUISignInViewController__attemptAuthenticationWithContext___block_invoke_2_cold_1(a1, v11, v12, v13, v14, v15, v16, v17);
    }

    goto LABEL_5;
  }
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F29010]];
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263F28FF0]];
  uint64_t v7 = _AAUILogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"(*****)";
    if (!v6) {
      id v8 = @"(null)";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v5;
    __int16 v21 = 2114;
    uint64_t v22 = v8;
    _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "Successfully authenticated account for username: %{public}@, password: %{public}@", buf, 0x16u);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __62__AAUISignInViewController__attemptAuthenticationWithContext___block_invoke_225;
  v18[3] = &unk_263F92168;
  v18[4] = v9;
  objc_msgSend(v9, "_delegate_signInViewControllerDidCompleteWithAuthenticationResults:completionHandler:", v10, v18);
}

uint64_t __62__AAUISignInViewController__attemptAuthenticationWithContext___block_invoke_225(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setEnabled:1];
}

- (void)_repairCloudAccountWithAuthenticationResults:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F259C0] urlConfiguration];
  id v6 = [v5 repairCloudAccountUIURL];

  uint64_t v7 = [NSURL URLWithString:v6];
  id v8 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v7];
  [v8 setHTTPMethod:@"POST"];
  id v9 = [v4 objectForKeyedSubscript:*MEMORY[0x263F28FE8]];
  [v8 setValue:v9 forHTTPHeaderField:@"X-Apple-AK-Continuation-Data"];

  uint64_t v10 = [(AAUISignInViewController *)self _authorizationValueForAuthenticationResults:v4];
  [v8 setValue:v10 forHTTPHeaderField:@"Authorization"];

  objc_msgSend(v8, "ak_addCountryHeader");
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__2;
  __int16 v21 = __Block_byref_object_dispose__2;
  uint64_t v22 = [[AAUIRemoteUIController alloc] initWithIdentifier:@"com.apple.AppleAccountUI.SignIn"];
  [(id)v18[5] setDelegate:self];
  uint64_t v11 = (void *)v18[5];
  uint64_t v12 = [(AAUISignInViewController *)self navigationController];
  [v11 setNavigationController:v12];

  uint64_t v13 = _AAUILogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v13, OS_LOG_TYPE_DEFAULT, "Calling out to server to repair account...", buf, 2u);
  }

  uint64_t v14 = (void *)v18[5];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __73__AAUISignInViewController__repairCloudAccountWithAuthenticationResults___block_invoke;
  v15[3] = &unk_263F92940;
  v15[4] = &v17;
  [v14 loadRequest:v8 completion:v15];
  _Block_object_dispose(&v17, 8);
}

void __73__AAUISignInViewController__repairCloudAccountWithAuthenticationResults___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (a2) {
      uint64_t v7 = @"YES";
    }
    int v10 = 138412546;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Request came back with success: %@, error: %@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

- (BOOL)_showOnlyPassword
{
  if (!self->_username || self->_canEditUsername) {
    return 0;
  }
  BOOL v3 = [(AAUISignInViewController *)self authenticationContext];
  id v4 = [v3 proxiedDevice];
  BOOL v2 = v4 != 0;

  return v2;
}

- (id)_authorizationValueForAuthenticationResults:(id)a3
{
  uint64_t v3 = *MEMORY[0x263F28F58];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:v3];
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F28FF0]];

  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    uint64_t v7 = [NSString stringWithFormat:@"%@:%@", v5, v6];
    uint64_t v8 = [v7 dataUsingEncoding:4];
    id v9 = [v8 base64EncodedStringWithOptions:0];

    if ([v9 length])
    {
      int v10 = [NSString stringWithFormat:@"Basic %@", v9];
    }
    else
    {
      int v10 = 0;
    }
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (void)_cancelPasswordDelegateIfNecessary
{
  passwordHandler = (void (**)(id, void, void *))self->_passwordHandler;
  if (passwordHandler)
  {
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F28F30] code:-7003 userInfo:0];
    passwordHandler[2](passwordHandler, 0, v4);

    id v5 = self->_passwordHandler;
    self->_passwordHandler = 0;
  }
}

- (void)_setPasswordFieldHidden:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(AAUISignInViewController *)self _isPasswordFieldVisible];
  if (v3)
  {
    if (!v5) {
      return;
    }
    id v6 = [(AKBasicLoginTableViewCell *)self->_passwordCell cellTextField];
    [v6 setText:0];

    self->_showingPasswordCell = 0;
    uint64_t v7 = (void *)MEMORY[0x263F82E00];
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke;
    uint64_t v17 = &unk_263F92168;
    id v18 = self;
    uint64_t v8 = &v14;
  }
  else
  {
    if (v5) {
      return;
    }
    self->_showingPasswordCell = 1;
    uint64_t v7 = (void *)MEMORY[0x263F82E00];
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke_4;
    __int16 v12 = &unk_263F92168;
    id v13 = self;
    uint64_t v8 = &v9;
  }
  objc_msgSend(v7, "animateWithDuration:animations:", v8, 0.2, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
}

uint64_t __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateExpandingViewInFooterForCellChange:1];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 976);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke_2;
  v6[3] = &unk_263F92168;
  v6[4] = v2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke_3;
  v5[3] = &unk_263F92968;
  v5[4] = v2;
  return [v3 performBatchUpdates:v6 completion:v5];
}

void __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = (void *)v1[122];
  BOOL v3 = [v1 _passwordFieldIndexPath];
  v5[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  [v2 deleteRowsAtIndexPaths:v4 withRowAnimation:3];
}

void __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 984) cellTextField];
  [v1 becomeFirstResponder];
}

uint64_t __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateExpandingViewInFooterForCellChange:1];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 976);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke_5;
  v6[3] = &unk_263F92168;
  v6[4] = v2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke_6;
  v5[3] = &unk_263F92968;
  v5[4] = v2;
  return [v3 performBatchUpdates:v6 completion:v5];
}

void __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke_5(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = (void *)v1[122];
  BOOL v3 = [v1 _passwordFieldIndexPath];
  v5[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  [v2 insertRowsAtIndexPaths:v4 withRowAnimation:4];
}

uint64_t __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 992) cellTextField];
  [v2 becomeFirstResponder];

  BOOL v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 _hasValidCredentials];
  return [v3 _setContinueButtonEnabled:v4];
}

- (void)_setUsernameCellWaiting:(BOOL)a3
{
  continueButton = self->_continueButton;
  if (a3) {
    [(OBBoldTrayButton *)continueButton showsBusyIndicator];
  }
  else {
    [(OBBoldTrayButton *)continueButton hidesBusyIndicator];
  }
}

- (id)_passwordFieldIndexPath
{
  return (id)[MEMORY[0x263F088C8] indexPathForRow:1 inSection:0];
}

- (void)_formatUsernameAsPhoneNumberIfNeeded
{
  BOOL v3 = [(AKBasicLoginTableViewCell *)self->_usernameCell cellTextField];
  id v7 = [v3 text];

  if (([v7 containsString:@"@"] & 1) == 0)
  {
    uint64_t v4 = objc_opt_new();
    BOOL v5 = [v4 displayFormatFor:v7];
    id v6 = [(AKBasicLoginTableViewCell *)self->_usernameCell cellTextField];
    [v6 setText:v5];
  }
}

- (id)_serverFriendlyUsername:(id)a3
{
  id v3 = a3;
  if ([v3 containsString:@"@"])
  {
    id v4 = v3;
  }
  else
  {
    BOOL v5 = objc_opt_new();
    id v4 = [v5 normalizedFormatFor:v3];
  }
  return v4;
}

- (void)_beginObservingTextFieldDidChangeNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__textFieldDidChange_ name:*MEMORY[0x263F83AC8] object:0];
}

- (void)_endObservingTextFieldDidChangeNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83AC8] object:0];
}

- (void)_textFieldDidChange:(id)a3
{
  id v7 = [a3 object];
  id v4 = [(AKBasicLoginTableViewCell *)self->_usernameCell cellTextField];
  if (v7 == v4)
  {
  }
  else
  {
    id v5 = [(AKBasicLoginTableViewCell *)self->_passwordCell cellTextField];

    id v6 = v7;
    if (v7 != v5) {
      goto LABEL_6;
    }
  }
  [(AAUISignInViewController *)self _setContinueButtonEnabled:[(AAUISignInViewController *)self _hasValidCredentials]];
  id v6 = v7;
LABEL_6:
}

- (void)_beginObservingKeyboardWillShowNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__keyboardWillShow_ name:*MEMORY[0x263F83808] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__keyboardWillShow_ name:*MEMORY[0x263F837F8] object:0];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel__keyboardWillHide_ name:*MEMORY[0x263F83800] object:0];
}

- (void)_endObservingKeyboardWillShowNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83808] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F837F8] object:0];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F83800] object:0];
}

- (void)_keyboardWillShow:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F83780]];

  id v7 = [v4 userInfo];

  uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F837B8]];

  uint64_t v9 = [(AAUISignInViewController *)self view];
  [v8 CGRectValue];
  objc_msgSend(v9, "convertRect:fromView:", 0);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  if (+[AAUISignInViewController _isRunningInSettings])
  {
    id v18 = [(AAUISignInViewController *)self view];
    [v18 safeAreaInsets];
    double v20 = v19;
  }
  else
  {
    __int16 v21 = [(AAUISignInViewController *)self view];
    [v21 bounds];
    double Height = CGRectGetHeight(v31);
    v32.origin.x = v11;
    v32.origin.y = v13;
    v32.size.width = v15;
    v32.size.height = v17;
    double v23 = Height - CGRectGetMinY(v32);

    double v24 = [MEMORY[0x263F82670] currentDevice];
    int v25 = objc_msgSend(v24, "sf_isiPad");

    if (v25)
    {
      [(AAUISignInViewController *)self _navigationBarHeight];
      double v23 = v23 - v26;
    }
    double v27 = [(AAUISignInViewController *)self view];
    [v27 safeAreaInsets];
    double v20 = v28;

    if (v20 < v23) {
      double v20 = v23;
    }
  }
  id v29 = (void *)MEMORY[0x263F82E00];
  [v6 doubleValue];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __46__AAUISignInViewController__keyboardWillShow___block_invoke;
  v30[3] = &unk_263F92990;
  void v30[4] = self;
  *(double *)&v30[5] = v20;
  objc_msgSend(v29, "animateWithDuration:animations:", v30);
}

uint64_t __46__AAUISignInViewController__keyboardWillShow___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContentInsetWithHeight:*(double *)(a1 + 40)];
}

- (void)_keyboardWillHide:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F83780]];

  id v6 = (void *)MEMORY[0x263F82E00];
  [v5 doubleValue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__AAUISignInViewController__keyboardWillHide___block_invoke;
  v7[3] = &unk_263F92168;
  v7[4] = self;
  objc_msgSend(v6, "animateWithDuration:animations:", v7);
}

void __46__AAUISignInViewController__keyboardWillHide___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v3 = [v1 view];
  [v3 safeAreaInsets];
  [v1 _updateContentInsetWithHeight:v2];
}

- (void)_updateContentInsetWithHeight:(double)a3
{
  -[UITableView _setContentScrollInset:](self->_tableView, "_setContentScrollInset:", 0.0, 0.0, a3, 0.0);
  [(AAUISignInViewController *)self _updateScrollIndicatorInsetWithHeight:a3];
}

- (void)_updateScrollIndicatorInsetWithHeight:(double)a3
{
  [(UITableView *)self->_tableView frame];
  double MaxX = CGRectGetMaxX(v9);
  id v6 = [(AAUISignInViewController *)self view];
  [v6 bounds];
  -[UITableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:", 0.0, 0.0, a3, MaxX - CGRectGetWidth(v10));

  tableView = self->_tableView;
  [(UITableView *)tableView setNeedsLayout];
}

- (void)_beginObservingSizeCategoryNotification
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_sizeCategoryDidChange_ name:*MEMORY[0x263F83428] object:0];
}

- (void)_endObservingSizeCategoryNotification
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83428] object:0];
}

- (void)sizeCategoryDidChange:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__AAUISignInViewController_sizeCategoryDidChange___block_invoke;
  block[3] = &unk_263F92168;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __50__AAUISignInViewController_sizeCategoryDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 984);
  *(void *)(v2 + 984) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 992);
  *(void *)(v4 + 992) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 1040);
  *(void *)(v6 + 1040) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  CGRect v9 = *(void **)(v8 + 1048);
  *(void *)(v8 + 1048) = 0;

  CGRect v10 = *(void **)(*(void *)(a1 + 32) + 976);
  return [v10 reloadData];
}

- (void)_delegate_signInViewControllerDidCompleteWithAuthenticationResults:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  uint64_t v6 = (void (**)(void))a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v7 = [(AAUISignInViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v7 signInViewController:self didCompleteWithAuthenticationResults:v8 completionHandler:v6];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v7 signInViewController:self didCompleteWithAuthenticationResults:v8];
    if (v6) {
      v6[2](v6);
    }
  }
  else
  {
    if (v6) {
      v6[2](v6);
    }
    [(AAUISignInViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_delegate_signInViewControllerDidCancel
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = [(AAUISignInViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 signInViewControllerDidCancel:self];
  }
  else {
    [(AAUISignInViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_delegate_signInViewControllerDidSkip
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = [(AAUISignInViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 signInViewControllerDidSkip:self];
  }
  else {
    [(AAUISignInViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_delegate_signInViewControllerDidSelectOtherOptions
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = [(AAUISignInViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 signInViewControllerDidSelectOtherOptions:self];
  }
  else {
    [(AAUISignInViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)context:(id)a3 needsPasswordWithCompletion:(id)a4
{
  id v5 = _Block_copy(a4);
  id passwordHandler = self->_passwordHandler;
  self->_id passwordHandler = v5;

  [(AAUISignInViewController *)self _setPasswordFieldHidden:0];
  [(AAUISignInViewController *)self _setEnabled:1];
}

- (void)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6 completion:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = (void (**)(id, void))a7;
  dispatch_assert_queue_not_V2(MEMORY[0x263EF83A0]);
  CGFloat v15 = _AAUILogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v25 = 0;
    _os_log_impl(&dword_209754000, v15, OS_LOG_TYPE_DEFAULT, "Authentication controller called back with auth results.", v25, 2u);
  }

  double v16 = [(AAUISignInViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    CGFloat v17 = _AAUILogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[AAUISignInViewController authenticationController:shouldContinueWithAuthenticationResults:error:forContext:completion:](v17);
    }

    [v16 signInViewController:self shouldContinueWithAuthenticationResults:v11 error:v12 forContext:v13 completion:v14];
  }
  else if (v12)
  {
    id v18 = _AAUILogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[AAUISignInViewController authenticationController:shouldContinueWithAuthenticationResults:error:forContext:completion:]((uint64_t)v12, v18, v19, v20, v21, v22, v23, v24);
    }

    v14[2](v14, 0);
  }
  else
  {
    v14[2](v14, 1);
  }
}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  id v5 = a4;
  [v5 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
  uint64_t v6 = [MEMORY[0x263F25820] userAgentHeader];
  [v5 setValue:v6 forHTTPHeaderField:@"User-Agent"];

  id v7 = [MEMORY[0x263F25820] clientInfoHeader];
  [v5 setValue:v7 forHTTPHeaderField:@"X-MMe-Client-Info"];

  id v8 = [MEMORY[0x263EFF960] currentLocale];
  CGRect v9 = [v8 objectForKey:*MEMORY[0x263EFF4D0]];
  CGRect v10 = [v9 uppercaseString];
  [v5 setValue:v10 forHTTPHeaderField:@"X-MMe-Country"];

  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (!self->_showingPasswordCell) {
    return 1;
  }
  if ([(AAUISignInViewController *)self _showOnlyPassword]) {
    return 1;
  }
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section] || objc_msgSend(v7, "row"))
  {
    id v8 = [(AAUISignInViewController *)self _passwordFieldIndexPath];
    int v9 = [v7 isEqual:v8];

    if (!v9)
    {
      [NSString stringWithFormat:@"Invalid index path (%@) for %@.", v7, self];
      id v13 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
      objc_exception_throw(v13);
    }
    goto LABEL_4;
  }
  if ([(AAUISignInViewController *)self _showOnlyPassword])
  {
LABEL_4:
    uint64_t v10 = [(AAUISignInViewController *)self _passwordCell];
    goto LABEL_5;
  }
  uint64_t v10 = [(AAUISignInViewController *)self _usernameCell];
LABEL_5:
  id v11 = (void *)v10;

  return v11;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  [v5 setSeparatorStyle:1];
  [v5 _setShouldHaveFullLengthBottomSeparator:0];
  [v5 _setShouldHaveFullLengthTopSeparator:0];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [(AAUISignInViewController *)self _tableHeaderView];
  }
  return v6;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if (a4)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [(AAUISignInViewController *)self _tableFooterView];
    [v4 setNeedsLayout];
    [v4 layoutIfNeeded];
  }
  return v4;
}

- (id)_tableFooterView
{
  tableFooterView = self->_tableFooterView;
  if (!tableFooterView)
  {
    uint64_t v4 = [(UITableView *)self->_tableView dequeueReusableHeaderFooterViewWithIdentifier:@"AAUISignInViewControllerTableFooterView"];
    [(AAUISignInViewControllerTableFooterView *)v4 setParentForPrivacyController:self];
    uint64_t v5 = [(AAUISignInViewController *)self privacyLinkIdentifiers];
    [(AAUISignInViewControllerTableFooterView *)v4 setPrivacyLinkIdentifiers:v5];

    id v6 = [(AAUISignInViewController *)self _accountHelpStackView];
    [(AAUISignInViewControllerTableFooterView *)v4 addActionButtonStackView:v6];

    id v7 = [(AAUISignInViewController *)self _continueButton];
    [(AAUISignInViewControllerTableFooterView *)v4 addContinueButton:v7];

    if ([(AAUISignInViewController *)self showOtherOptions])
    {
      id v8 = [(AAUISignInViewController *)self _otherOptionsButton];
      [(AAUISignInViewControllerTableFooterView *)v4 addOtherButton:v8];
    }
    int v9 = [(AAUISignInViewControllerTableFooterView *)v4 privacyLinkController];

    if (v9)
    {
      tintColor = self->_tintColor;
      id v11 = [(AAUISignInViewControllerTableFooterView *)v4 privacyLinkController];
      [v11 setCustomTintColor:tintColor];
    }
    id v12 = self->_tableFooterView;
    self->_tableFooterView = v4;

    tableFooterView = self->_tableFooterView;
  }
  return tableFooterView;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  uint64_t v4 = [(AAUISignInViewController *)self _tableFooterView];
  uint64_t v5 = [v4 contentView];
  [v5 setNeedsLayout];

  id v6 = [v4 contentView];
  [v6 layoutIfNeeded];

  [v4 totalHeight];
  double v8 = v7;

  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v4 = [(AAUISignInViewController *)self traitCollection];
  uint64_t v5 = [v4 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  double result = *MEMORY[0x263F839B8];
  if (!IsAccessibilityCategory) {
    return 44.0;
  }
  return result;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  if ([(AAUISignInViewController *)self _hasValidCredentials]) {
    [(AAUISignInViewController *)self _attemptAuthentication];
  }
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(AKBasicLoginTableViewCell *)self->_usernameCell cellTextField];
  if (v9 == v7 && [(AAUISignInViewController *)self _isPasswordFieldVisible])
  {
    uint64_t v10 = [v7 text];
    char v11 = [v10 isEqualToString:v8];

    if ((v11 & 1) == 0)
    {
      [(AAUISignInViewController *)self _cancelPasswordDelegateIfNecessary];
      [(AAUISignInViewController *)self _setPasswordFieldHidden:1];
    }
  }
  else
  {
  }
  return 1;
}

- (int64_t)_akServiceType
{
  return self->_akServiceType;
}

- (void)_setAkServiceType:(int64_t)a3
{
  self->_akServiceType = a3;
}

- (BOOL)_shouldAnticipatePiggybacking
{
  return self->_shouldAnticipatePiggybacking;
}

- (void)_setShouldAnticipatePiggybacking:(BOOL)a3
{
  self->_shouldAnticipatePiggybacking = a3;
}

- (AAUISignInViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUISignInViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)allowsAccountCreation
{
  return self->_allowsAccountCreation;
}

- (void)setAllowsAccountCreation:(BOOL)a3
{
  self->_allowsAccountCreation = a3;
}

- (BOOL)showServiceIcons
{
  return self->_showServiceIcons;
}

- (void)setShowServiceIcons:(BOOL)a3
{
  self->_showServiceIcons = a3;
}

- (int64_t)tableViewStyle
{
  return self->_tableViewStyle;
}

- (void)setTableViewStyle:(int64_t)a3
{
  self->_tableViewStyle = a3;
}

- (UIColor)cellBackgroundColor
{
  return self->_cellBackgroundColor;
}

- (void)setCellBackgroundColor:(id)a3
{
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
}

- (NSString)messageLabel
{
  return self->_messageLabel;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (BOOL)canEditUsername
{
  return self->_canEditUsername;
}

- (void)setCanEditUsername:(BOOL)a3
{
  self->_canEditUsername = a3;
}

- (BOOL)allowSkip
{
  return self->_allowSkip;
}

- (void)setAllowSkip:(BOOL)a3
{
  self->_allowSkip = a3;
}

- (BOOL)shouldShowSystemBackButton
{
  return self->_shouldShowSystemBackButton;
}

- (void)setShouldShowSystemBackButton:(BOOL)a3
{
  self->_shouldShowSystemBackButton = a3;
}

- (NSArray)privacyLinkIdentifiers
{
  return self->_privacyLinkIdentifiers;
}

- (void)setPrivacyLinkIdentifiers:(id)a3
{
}

- (BOOL)isChildSetupFlow
{
  return self->_childSetupFlow;
}

- (void)setChildSetupFlow:(BOOL)a3
{
  self->_childSetupFlow = a3;
}

- (BOOL)showingPasswordCell
{
  return self->_showingPasswordCell;
}

- (void)setShowingPasswordCell:(BOOL)a3
{
  self->_showingPasswordCell = a3;
}

- (AAUIAppleLogoMicaView)appleLogoMicaView
{
  return self->_appleLogoMicaView;
}

- (void)setAppleLogoMicaView:(id)a3
{
}

- (UIView)logoContainerView
{
  return self->_logoContainerView;
}

- (void)setLogoContainerView:(id)a3
{
}

- (NSNumber)initialHeight
{
  return self->_initialHeight;
}

- (void)setInitialHeight:(id)a3
{
}

- (UIButton)forgotOrCreateButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_forgotOrCreateButton);
  return (UIButton *)WeakRetained;
}

- (void)setForgotOrCreateButton:(id)a3
{
}

- (AAUIButton)forgotButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_forgotButton);
  return (AAUIButton *)WeakRetained;
}

- (void)setForgotButton:(id)a3
{
}

- (AAUIButton)createButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_createButton);
  return (AAUIButton *)WeakRetained;
}

- (void)setCreateButton:(id)a3
{
}

- (BOOL)hideCreationAndForgotPasswordButton
{
  return self->_hideCreationAndForgotPasswordButton;
}

- (UIStackView)accountHelpStackView
{
  return self->_accountHelpStackView;
}

- (void)setAccountHelpStackView:(id)a3
{
}

- (BOOL)_showsChildSignIn
{
  return self->__showsChildSignIn;
}

- (void)setShowsChildSignIn:(BOOL)a3
{
  self->__showsChildSignIn = a3;
}

- (AKURLBag)akURLBag
{
  return self->_akURLBag;
}

- (void)setAKURLBag:(id)a3
{
}

- (BOOL)showOtherOptions
{
  return self->_showOtherOptions;
}

- (void)setShowOtherOptions:(BOOL)a3
{
  self->_showOtherOptions = a3;
}

- (BOOL)hidesBackOrCancelButton
{
  return self->_hidesBackOrCancelButton;
}

- (void)setHidesBackOrCancelButton:(BOOL)a3
{
  self->_hidesBackOrCancelButton = a3;
}

- (void)setAuthenticationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_akURLBag, 0);
  objc_storeStrong((id *)&self->_accountHelpStackView, 0);
  objc_destroyWeak((id *)&self->_createButton);
  objc_destroyWeak((id *)&self->_forgotButton);
  objc_destroyWeak((id *)&self->_forgotOrCreateButton);
  objc_storeStrong((id *)&self->_initialHeight, 0);
  objc_storeStrong((id *)&self->_logoContainerView, 0);
  objc_storeStrong((id *)&self->_appleLogoMicaView, 0);
  objc_storeStrong((id *)&self->_privacyLinkIdentifiers, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_cellBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_originalPersonaContext, 0);
  objc_storeStrong((id *)&self->_originalPersona, 0);
  objc_storeStrong(&self->_passwordHandler, 0);
  objc_storeStrong((id *)&self->_tableFooterView, 0);
  objc_storeStrong((id *)&self->_tableHeaderView, 0);
  objc_storeStrong((id *)&self->_actionButtonsStackView, 0);
  objc_storeStrong((id *)&self->_otherOptionsButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_storeStrong((id *)&self->_obHeaderView, 0);
  objc_storeStrong((id *)&self->_passwordCell, 0);
  objc_storeStrong((id *)&self->_usernameCell, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

- (void)_attemptAuthenticationWithContext:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[AAUISignInViewController _attemptAuthenticationWithContext:]";
  _os_log_debug_impl(&dword_209754000, log, OS_LOG_TYPE_DEBUG, "Verifying persona in %s", (uint8_t *)&v1, 0xCu);
}

void __62__AAUISignInViewController__attemptAuthenticationWithContext___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)authenticationController:(os_log_t)log shouldContinueWithAuthenticationResults:error:forContext:completion:.cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_209754000, log, OS_LOG_TYPE_DEBUG, "Calling delegate for should continue", v1, 2u);
}

- (void)authenticationController:(uint64_t)a3 shouldContinueWithAuthenticationResults:(uint64_t)a4 error:(uint64_t)a5 forContext:(uint64_t)a6 completion:(uint64_t)a7 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end