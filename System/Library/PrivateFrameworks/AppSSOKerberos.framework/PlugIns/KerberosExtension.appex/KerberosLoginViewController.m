@interface KerberosLoginViewController
- (BOOL)_formIsValid;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityPerformMagicTap;
- (BOOL)promptForSmartCard;
- (BOOL)shouldPromptUserForConsentToPerformFutureAutomaticLogins;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)viewControllerIsShowing;
- (KerberosLoginViewController)initWithCoder:(id)a3;
- (KerberosLoginViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (KerberosPasswordViewController)passwordViewController;
- (NSLayoutConstraint)bottomConstraint;
- (SOKerberosContext)currentUIContext;
- (SOKerberosExtensionProcess)process;
- (SOKeychainHelper)keychainHelper;
- (TKTokenWatcher)watcher;
- (UIActivityIndicatorView)spinner;
- (UIBarButtonItem)cancelButton;
- (UIButton)identityButton;
- (UIButton)loginButton;
- (UIButton)optionsButton;
- (UILabel)customHelpTitleLabel;
- (UILabel)identityLabel;
- (UILabel)signInTitleLabel;
- (UINavigationBar)navigationBar;
- (UINavigationItem)navigationItem;
- (UIStackView)loginStackView;
- (UITextField)passwordTextField;
- (UITextField)usernameTextField;
- (UIView)containerView;
- (UIView)userNamePasswordView;
- (id)buildIdentityMenu;
- (id)buildOptionsMenu;
- (id)nibName;
- (void)_updateLoginButtonState;
- (void)cancelClicked:(id)a3;
- (void)cancelCurrentOperation;
- (void)changeFocusedElementForAccessibilityIfNeeded;
- (void)changeUIForCertIdentity;
- (void)didChangePassword;
- (void)didClose;
- (void)disableElementAutoFocusForAccessibility;
- (void)disableUI;
- (void)enableElementAutoFocusForAccessibility;
- (void)enableUI;
- (void)handleKerberosOperation:(id)a3 withMessage:(id)a4;
- (void)handleResult:(unint64_t)a3 context:(id)a4 error:(id)a5;
- (void)keyboardWillChangeFrame:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)loginClicked:(id)a3;
- (void)prefillWithCredentialsFromContextIfPossible:(id)a3;
- (void)prefillWithCredentialsFromKeychainIfPossible;
- (void)prepareContextForLogin;
- (void)presentPendingAlertIfNeeded;
- (void)promptForCertificateWithContext:(id)a3;
- (void)promptForPasswordWithContext:(id)a3;
- (void)promptForPrincipalWithContext:(id)a3;
- (void)promptForSmartcardWithContext:(id)a3;
- (void)promptUserForConsentToPerformFutureAutomaticLogins:(id)a3;
- (void)promptUserForConsentToPerformFutureAutomaticLoginsIfNeeded:(id)a3;
- (void)resetUI;
- (void)selectCertForAuth:(id)a3;
- (void)setBottomConstraint:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setCurrentUIContext:(id)a3;
- (void)setCustomHelpTitleLabel:(id)a3;
- (void)setIdentityButton:(id)a3;
- (void)setIdentityLabel:(id)a3;
- (void)setKeychainHelper:(id)a3;
- (void)setLoginButton:(id)a3;
- (void)setLoginStackView:(id)a3;
- (void)setNavigationBar:(id)a3;
- (void)setNavigationItem:(id)a3;
- (void)setOptionsButton:(id)a3;
- (void)setPasswordTextField:(id)a3;
- (void)setPasswordViewController:(id)a3;
- (void)setProcess:(id)a3;
- (void)setPromptForSmartCard:(BOOL)a3;
- (void)setSignInTitleLabel:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setUserNamePasswordView:(id)a3;
- (void)setUsernameTextField:(id)a3;
- (void)setViewControllerIsShowing:(BOOL)a3;
- (void)setWatcher:(id)a3;
- (void)showAuthControllerForContext:(id)a3 completion:(id)a4;
- (void)showMessage:(id)a3 andContext:(id)a4 completion:(id)a5;
- (void)showPasswordViewController;
- (void)updateIdentityMenu;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation KerberosLoginViewController

- (KerberosLoginViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)KerberosLoginViewController;
  v4 = [(KerberosLoginViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    [(KerberosLoginViewController *)v4 setViewControllerIsShowing:0];
    v5->_shouldChangeFocusedElementForAccessibility = 1;
  }
  return v5;
}

- (KerberosLoginViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)KerberosLoginViewController;
  v3 = [(KerberosLoginViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(KerberosLoginViewController *)v3 setViewControllerIsShowing:0];
  }
  return v4;
}

- (id)nibName
{
  return @"KerberosLoginViewController";
}

- (void)viewDidLoad
{
  v44.receiver = self;
  v44.super_class = (Class)KerberosLoginViewController;
  [(KerberosLoginViewController *)&v44 viewDidLoad];
  v3 = sub_100005D28();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000CFAC();
  }

  v4 = [(UIButton *)self->_loginButton layer];
  [v4 setCornerRadius:10.0];

  v5 = [(UIView *)self->_userNamePasswordView layer];
  [v5 setCornerRadius:10.0];

  id v6 = objc_alloc_init((Class)UILabel);
  objc_super v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"SIGN_IN_TEXT" value:&stru_100014860 table:0];
  [v6 setText:v8];

  [v6 setTextAlignment:0];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
  [v6 setFont:v9];

  [v6 setAdjustsFontForContentSizeCategory:1];
  id v10 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v6];
  v11 = [(KerberosLoginViewController *)self navigationItem];
  [v11 setLeftBarButtonItem:v10];

  v12 = [(KerberosLoginViewController *)self loginStackView];
  v13 = [(KerberosLoginViewController *)self loginStackView];
  v14 = [v13 subviews];
  v15 = [v14 objectAtIndexedSubscript:0];
  [v12 setCustomSpacing:v15 afterView:16.0];

  v16 = [(KerberosLoginViewController *)self loginStackView];
  v17 = [(KerberosLoginViewController *)self loginStackView];
  v18 = [v17 subviews];
  v19 = [v18 objectAtIndexedSubscript:1];
  [v16 setCustomSpacing:v19 afterView:16.0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_usernameTextField);
  [WeakRetained setDelegate:self];

  id v21 = objc_loadWeakRetained((id *)&self->_passwordTextField);
  [v21 setDelegate:self];

  id v22 = objc_loadWeakRetained((id *)&self->_usernameTextField);
  [v22 addTarget:self action:"textFieldDidChange:" forControlEvents:0x20000];

  id v23 = objc_loadWeakRetained((id *)&self->_passwordTextField);
  [v23 addTarget:self action:"textFieldDidChange:" forControlEvents:0x20000];

  id v24 = objc_loadWeakRetained((id *)&self->_usernameTextField);
  [v24 setTextContentType:UITextContentTypeUsername];

  id v25 = objc_loadWeakRetained((id *)&self->_passwordTextField);
  [v25 setTextContentType:UITextContentTypePassword];

  v26 = [(KerberosLoginViewController *)self containerView];
  [v26 setClipsToBounds:1];

  v27 = [(KerberosLoginViewController *)self containerView];
  v28 = [v27 layer];
  [v28 setCornerRadius:10.0];

  v29 = [(KerberosLoginViewController *)self containerView];
  v30 = [v29 layer];
  [v30 setMaskedCorners:3];

  v31 = +[NSNotificationCenter defaultCenter];
  [v31 addObserver:self selector:"keyboardWillChangeFrame:" name:UIKeyboardWillChangeFrameNotification object:0];

  v32 = +[NSNotificationCenter defaultCenter];
  [v32 addObserver:self selector:"keyboardWillHide:" name:UIKeyboardWillHideNotification object:0];

  [(KerberosLoginViewController *)self changeUIForCertIdentity];
  v33 = [(KerberosLoginViewController *)self buildOptionsMenu];
  v34 = [(KerberosLoginViewController *)self optionsButton];
  [v34 setMenu:v33];

  v35 = [(KerberosLoginViewController *)self optionsButton];
  [v35 setShowsMenuAsPrimaryAction:1];

  v36 = [(KerberosLoginViewController *)self buildIdentityMenu];
  v37 = [(KerberosLoginViewController *)self identityButton];
  [v37 setMenu:v36];

  v38 = [(KerberosLoginViewController *)self identityButton];
  [v38 setShowsMenuAsPrimaryAction:1];

  objc_initWeak(&location, self);
  id v39 = objc_alloc_init((Class)TKTokenWatcher);
  [(KerberosLoginViewController *)self setWatcher:v39];

  v40 = [(KerberosLoginViewController *)self watcher];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100005D7C;
  v41[3] = &unk_1000144E0;
  objc_copyWeak(&v42, &location);
  [v40 setInsertionHandler:v41];

  objc_destroyWeak(&v42);
  objc_destroyWeak(&location);
}

- (void)selectCertForAuth:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)LAContext);
  id v6 = [(KerberosLoginViewController *)self currentUIContext];
  [v6 setSmartCardLAContext:v5];

  objc_super v7 = [v4 attributes];
  v8 = [(KerberosLoginViewController *)self currentUIContext];
  v9 = [v8 smartCardLAContext];
  id v10 = +[SOSmartcard getLocalAuthIdentityForCert:v7 withLAContext:v9];
  v11 = [(KerberosLoginViewController *)self currentUIContext];
  [v11 setPkinitIdentity:v10];

  v12 = [v4 persistientRef];
  v13 = [(KerberosLoginViewController *)self currentUIContext];
  [v13 setPkinitPersistientRef:v12];

  v14 = [v4 tokenID];
  v15 = [(KerberosLoginViewController *)self currentUIContext];
  [v15 setCertificateTokenID:v14];

  v16 = [v4 upn];
  v17 = [(KerberosLoginViewController *)self currentUIContext];
  [v17 setUserPrincipalName:v16];

  [(KerberosLoginViewController *)self changeUIForCertIdentity];
  id v19 = [v4 certName];

  v18 = [(KerberosLoginViewController *)self identityLabel];
  [v18 setText:v19];
}

- (id)buildOptionsMenu
{
  v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"USE_SMARTCARD_TEXT" value:&stru_100014860 table:0];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100006698;
  v32[3] = &unk_100014508;
  v32[4] = self;
  id v5 = +[UIAction actionWithTitle:v4 image:0 identifier:@"smartcard" handler:v32];

  id v6 = [(KerberosLoginViewController *)self currentUIContext];
  objc_super v7 = [v6 pkinitPersistientRef];
  if (v7)
  {

    uint64_t v8 = 1;
  }
  else
  {
    v9 = [(KerberosLoginViewController *)self currentUIContext];
    id v10 = [v9 extensionUserData];
    unsigned int v11 = [v10 useSmartCard];

    uint64_t v8 = v11;
  }
  [v5 setState:v8];
  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"SIGN_IN_AUTO_TEXT" value:&stru_100014860 table:0];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000067FC;
  v31[3] = &unk_100014508;
  v31[4] = self;
  v14 = +[UIAction actionWithTitle:v13 image:0 identifier:@"automatic" handler:v31];

  v15 = [(KerberosLoginViewController *)self currentUIContext];
  v16 = [v15 extensionUserData];
  unsigned int v17 = [v16 useKeychain];

  [v14 setState:v17];
  v18 = +[NSBundle mainBundle];
  id v19 = [v18 localizedStringForKey:@"CHANGE_PASSWORD_TEXT" value:&stru_100014860 table:0];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000068F0;
  v30[3] = &unk_100014508;
  v30[4] = self;
  v20 = +[UIAction actionWithTitle:v19 image:0 identifier:@"password" handler:v30];

  id v21 = +[NSBundle mainBundle];
  id v22 = [v21 localizedStringForKey:@"SIGN_OUT_TEXT" value:&stru_100014860 table:0];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100006908;
  v29[3] = &unk_100014508;
  v29[4] = self;
  id v23 = +[UIAction actionWithTitle:v22 image:0 identifier:@"logout" handler:v29];

  id v24 = +[NSBundle mainBundle];
  id v25 = [v24 localizedStringForKey:@"OPTIONS_TEXT" value:&stru_100014860 table:0];
  v33[0] = v23;
  v33[1] = v5;
  v33[2] = v14;
  v33[3] = v20;
  v26 = +[NSArray arrayWithObjects:v33 count:4];
  v27 = +[UIMenu menuWithTitle:v25 children:v26];

  return v27;
}

- (void)showPasswordViewController
{
  objc_super v7 = [[KerberosPasswordViewController alloc] initWithNibName:@"KerberosPasswordViewController" bundle:0];
  [(KerberosPasswordViewController *)v7 setModalPresentationStyle:5];
  v3 = [(KerberosLoginViewController *)self process];
  [(KerberosPasswordViewController *)v7 setProcess:v3];

  id v4 = [(KerberosLoginViewController *)self keychainHelper];
  [(KerberosPasswordViewController *)v7 setKeychainHelper:v4];

  id v5 = [(KerberosLoginViewController *)self currentUIContext];
  [(KerberosPasswordViewController *)v7 setCurrentUIContext:v5];

  [(KerberosPasswordViewController *)v7 setDelegate:self];
  [(KerberosLoginViewController *)self setPasswordViewController:v7];
  id v6 = [(KerberosLoginViewController *)self passwordViewController];
  [(KerberosLoginViewController *)self presentViewController:v6 animated:1 completion:&stru_100014528];
}

- (id)buildIdentityMenu
{
  v34 = objc_opt_new();
  v3 = +[SOSmartcard availableSmartCards];
  id v4 = [v3 count];
  id v5 = +[NSBundle mainBundle];
  id v6 = v5;
  if (v4) {
    CFStringRef v7 = @"NONE_TEXT";
  }
  else {
    CFStringRef v7 = @"NO_SMARTCARDS_AVAILABLE_TEXT";
  }
  uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_100014860 table:0];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100007034;
  v40[3] = &unk_100014508;
  v40[4] = self;
  v9 = +[UIAction actionWithTitle:v8 image:0 identifier:@"none" handler:v40];

  id v10 = [(KerberosLoginViewController *)self currentUIContext];
  uint64_t v11 = [v10 certificateTokenID];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = [(KerberosLoginViewController *)self currentUIContext];
    v14 = [v13 certificateTokenID];
    unsigned int v15 = [v14 isEqualToString:&stru_100014860];

    uint64_t v16 = v15;
  }
  else
  {

    uint64_t v16 = 1;
  }
  [v9 setState:v16];
  [v34 addObject:v9];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v3;
  id v17 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v37;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v37 != v19) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v22 = [v21 certName];
        id v23 = [v21 tokenID];
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_100007140;
        v35[3] = &unk_100014550;
        v35[4] = self;
        v35[5] = v21;
        id v24 = +[UIAction actionWithTitle:v22 image:0 identifier:v23 handler:v35];

        id v25 = [(KerberosLoginViewController *)self currentUIContext];
        v26 = [v25 certificateTokenID];
        v27 = [v21 tokenID];
        unsigned int v28 = [v26 isEqualToString:v27];

        [v24 setState:v28];
        [v34 addObject:v24];
      }
      id v18 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v18);
  }

  v29 = +[NSBundle mainBundle];
  v30 = [v29 localizedStringForKey:@"SELECT_IDENTITY_TEXT" value:&stru_100014860 table:0];
  v31 = +[UIMenu menuWithTitle:v30 image:0 identifier:@"identity" options:0 children:v34];

  return v31;
}

- (void)updateIdentityMenu
{
  v3 = [(KerberosLoginViewController *)self identityButton];
  [v3 setMenu:0];

  id v5 = [(KerberosLoginViewController *)self buildIdentityMenu];
  id v4 = [(KerberosLoginViewController *)self identityButton];
  [v4 setMenu:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)KerberosLoginViewController;
  [(KerberosLoginViewController *)&v9 viewWillAppear:a3];
  [(KerberosLoginViewController *)self enableUI];
  p_usernameTextField = &self->_usernameTextField;
  id WeakRetained = objc_loadWeakRetained((id *)p_usernameTextField);
  id v6 = [WeakRetained text];
  id v7 = [v6 length];

  if (!v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_usernameTextField);
    [v8 becomeFirstResponder];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v32.receiver = self;
  v32.super_class = (Class)KerberosLoginViewController;
  [(KerberosLoginViewController *)&v32 viewDidAppear:a3];
  [(KerberosLoginViewController *)self presentPendingAlertIfNeeded];
  id v4 = [(KerberosLoginViewController *)self currentUIContext];
  id v5 = [v4 callerLocalizedName];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_signInTitleLabel);
  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"SIGN_IN_TITLE" value:&stru_100014860 table:0];
  objc_super v9 = [(KerberosLoginViewController *)self currentUIContext];
  id v10 = [v9 realm];
  uint64_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v5, v10);
  [WeakRetained setText:v11];

  id v12 = objc_loadWeakRetained((id *)&self->_signInTitleLabel);
  [v12 sizeToFit];

  v13 = [(KerberosLoginViewController *)self currentUIContext];
  v14 = [v13 extensionData];
  unsigned int v15 = [v14 helpText];
  id v16 = [v15 length];

  id v17 = objc_loadWeakRetained((id *)&self->_customHelpTitleLabel);
  id v18 = v17;
  if (v16)
  {
    uint64_t v19 = [(KerberosLoginViewController *)self currentUIContext];
    v20 = [v19 extensionData];
    id v21 = [v20 helpText];
    [v18 setText:v21];
  }
  else
  {
    [v17 setText:&stru_100014860];
  }

  id v22 = [(KerberosLoginViewController *)self currentUIContext];
  id v23 = [v22 extensionData];
  id v24 = [v23 customUsernameLabel];
  id v25 = [v24 length];

  if (v25)
  {
    id v26 = objc_loadWeakRetained((id *)&self->_usernameTextField);
    v27 = [(KerberosLoginViewController *)self currentUIContext];
    unsigned int v28 = [v27 extensionData];
    v29 = [v28 customUsernameLabel];
    [v26 setPlaceholder:v29];
  }
  id v30 = objc_loadWeakRetained((id *)&self->_customHelpTitleLabel);
  [v30 sizeToFit];

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000075C4;
  v31[3] = &unk_100014358;
  v31[4] = self;
  +[UIView animateWithDuration:1 delay:v31 options:&stru_100014570 animations:0.35 completion:0.35];
}

- (void)cancelClicked:(id)a3
{
  id v4 = sub_100005D28();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000D07C();
  }

  [(KerberosLoginViewController *)self removeFromParentViewController];
  id v5 = [(KerberosLoginViewController *)self view];
  [v5 removeFromSuperview];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007708;
  v6[3] = &unk_100014358;
  v6[4] = self;
  [(KerberosLoginViewController *)self dismissViewControllerAnimated:1 completion:v6];
}

- (void)loginClicked:(id)a3
{
  id v4 = sub_100005D28();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000D218();
  }

  [(KerberosLoginViewController *)self disableUI];
  [(KerberosLoginViewController *)self prepareContextForLogin];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000077C4;
  v5[3] = &unk_100014358;
  v5[4] = self;
  [(KerberosLoginViewController *)self promptUserForConsentToPerformFutureAutomaticLoginsIfNeeded:v5];
}

- (void)disableUI
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_usernameTextField);
  [WeakRetained resignFirstResponder];

  id v4 = objc_loadWeakRetained((id *)&self->_passwordTextField);
  [v4 resignFirstResponder];

  [(UIButton *)self->_loginButton setEnabled:0];
  id v5 = objc_loadWeakRetained((id *)&self->_cancelButton);
  [v5 setEnabled:0];

  id v6 = objc_loadWeakRetained((id *)&self->_cancelButton);
  [v6 setIsAccessibilityElement:0];

  id v7 = [(KerberosLoginViewController *)self spinner];
  [v7 startAnimating];

  [(KerberosLoginViewController *)self changeFocusedElementForAccessibilityIfNeeded];
}

- (void)prepareContextForLogin
{
  id v4 = [(KerberosLoginViewController *)self currentUIContext];
  if (([v4 userNameIsReadOnly] & 1) == 0)
  {
    id v5 = [(KerberosLoginViewController *)self usernameTextField];
    uint64_t v6 = [v5 text];
    if (v6)
    {
      id v7 = (void *)v6;
      v2 = [(KerberosLoginViewController *)self usernameTextField];
      id v8 = [v2 text];
      if ([v8 isEqualToString:&stru_100014860])
      {
      }
      else
      {
        objc_super v9 = [(KerberosLoginViewController *)self usernameTextField];
        id v10 = [v9 text];
        uint64_t v11 = [(KerberosLoginViewController *)self currentUIContext];
        id v12 = [v11 userName];
        unsigned __int8 v20 = [v10 isEqualToString:v12];

        if (v20) {
          goto LABEL_10;
        }
        id v4 = [(KerberosLoginViewController *)self usernameTextField];
        id v5 = [v4 text];
        id v7 = [(KerberosLoginViewController *)self currentUIContext];
        [v7 setUserName:v5];
      }
    }
  }

LABEL_10:
  v13 = [(KerberosLoginViewController *)self passwordTextField];
  v14 = [v13 text];
  unsigned int v15 = [(KerberosLoginViewController *)self currentUIContext];
  [v15 setPassword:v14];

  id v21 = [(KerberosLoginViewController *)self usernameTextField];
  id v16 = [v21 text];
  unsigned int v17 = [v16 isEqualToString:self->_prefilledUsername];
  if (v17)
  {
    unsigned int v15 = [(KerberosLoginViewController *)self passwordTextField];
    v2 = [v15 text];
    id v18 = [v2 isEqualToString:self->_prefilledPassword];
  }
  else
  {
    id v18 = 0;
  }
  uint64_t v19 = [(KerberosLoginViewController *)self currentUIContext];
  [v19 setCredsCameFromKeychain:v18];

  if (v17)
  {
  }
}

- (void)promptUserForConsentToPerformFutureAutomaticLoginsIfNeeded:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(KerberosLoginViewController *)self shouldPromptUserForConsentToPerformFutureAutomaticLogins])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100007CB0;
    v5[3] = &unk_100014598;
    v5[4] = self;
    uint64_t v6 = v4;
    [(KerberosLoginViewController *)self promptUserForConsentToPerformFutureAutomaticLogins:v5];
  }
  else
  {
    v4[2](v4);
  }
}

- (BOOL)shouldPromptUserForConsentToPerformFutureAutomaticLogins
{
  v3 = [(KerberosLoginViewController *)self currentUIContext];
  uint64_t v4 = [v3 extensionData];
  unsigned __int8 v5 = [(id)v4 allowAutomaticLogin];

  uint64_t v6 = [(KerberosLoginViewController *)self currentUIContext];
  id v7 = [v6 extensionUserData];
  LOBYTE(v4) = [v7 userSetKeychainChoice] ^ 1;

  return v5 & v4;
}

- (void)promptUserForConsentToPerformFutureAutomaticLogins:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSBundle mainBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"KEYCHAIN_ALERT_TITLE" value:&stru_100014860 table:0];
  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"KEYCHAIN_ALERT_TEXT" value:&stru_100014860 table:0];
  objc_super v9 = +[UIAlertController alertControllerWithTitle:v6 message:v8 preferredStyle:1];

  id v10 = +[NSBundle mainBundle];
  uint64_t v11 = [v10 localizedStringForKey:@"YES_TEXT" value:&stru_100014860 table:0];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100008104;
  v21[3] = &unk_1000145C0;
  v21[4] = self;
  id v12 = v4;
  id v22 = v12;
  v13 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v21];
  [v9 addAction:v13];

  v14 = +[NSBundle mainBundle];
  unsigned int v15 = [v14 localizedStringForKey:@"NO_TEXT" value:&stru_100014860 table:0];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000814C;
  v19[3] = &unk_1000145C0;
  v19[4] = self;
  id v20 = v12;
  id v16 = v12;
  unsigned int v17 = +[UIAlertAction actionWithTitle:v15 style:0 handler:v19];
  [v9 addAction:v17];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100008194;
  v18[3] = &unk_100014358;
  v18[4] = self;
  [(KerberosLoginViewController *)self presentViewController:v9 animated:1 completion:v18];
}

- (void)keyboardWillChangeFrame:(id)a3
{
  id v4 = [a3 userInfo];
  unsigned __int8 v5 = [v4 objectForKey:UIKeyboardFrameEndUserInfoKey];
  [v5 CGRectValue];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;

  v14 = [v4 objectForKey:UIKeyboardAnimationDurationUserInfoKey];
  [v14 doubleValue];
  double v16 = v15;

  unsigned int v17 = [v4 objectForKey:UIKeyboardAnimationCurveUserInfoKey];
  id v18 = [v17 unsignedIntegerValue];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000082EC;
  v19[3] = &unk_1000143C0;
  v19[4] = self;
  void v19[5] = v7;
  v19[6] = v9;
  v19[7] = v11;
  v19[8] = v13;
  +[UIView animateWithDuration:v18 delay:v19 options:&stru_1000145E0 animations:v16 completion:0.0];
}

- (void)keyboardWillHide:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(KerberosLoginViewController *)self bottomConstraint];
  [v5 setConstant:16.0];

  uint64_t v6 = [v4 userInfo];

  uint64_t v7 = [v6 objectForKey:UIKeyboardAnimationDurationUserInfoKey];
  [v7 doubleValue];
  double v9 = v8;

  uint64_t v10 = [v6 objectForKey:UIKeyboardAnimationCurveUserInfoKey];
  id v11 = [v10 unsignedIntegerValue];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000084A0;
  v12[3] = &unk_100014358;
  v12[4] = self;
  +[UIView animateWithDuration:v11 delay:v12 options:&stru_100014600 animations:v9 completion:0.0];
}

- (void)handleKerberosOperation:(id)a3 withMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = sub_100005D28();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10000D24C();
  }

  [(KerberosLoginViewController *)self setCurrentUIContext:v6];
  [(KerberosLoginViewController *)self showMessage:v7 andContext:v6 completion:0];
}

- (void)resetUI
{
  v3 = sub_100005D28();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000D2D0();
  }

  if ([(KerberosLoginViewController *)self viewControllerIsShowing]) {
    [(KerberosLoginViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
  [(KerberosLoginViewController *)self setViewControllerIsShowing:0];
  [(KerberosLoginViewController *)self setCurrentUIContext:0];
  id v4 = [(KerberosLoginViewController *)self usernameTextField];
  [v4 setText:&stru_100014860];

  unsigned __int8 v5 = [(KerberosLoginViewController *)self usernameTextField];
  [v5 setEnabled:1];

  id v6 = [(KerberosLoginViewController *)self passwordTextField];
  [v6 setText:&stru_100014860];

  id v7 = [(KerberosLoginViewController *)self passwordTextField];
  [v7 setEnabled:1];

  double v8 = [(KerberosLoginViewController *)self loginButton];
  [v8 setEnabled:0];
}

- (void)cancelCurrentOperation
{
  v3 = sub_100005D28();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000D304();
  }

  id v4 = [(KerberosLoginViewController *)self currentUIContext];
  [v4 cancelRequest];
}

- (void)handleResult:(unint64_t)a3 context:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = sub_100005D28();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    unint64_t v34 = a3;
    __int16 v35 = 2112;
    id v36 = v8;
    __int16 v37 = 2112;
    id v38 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "login handleResult: %lu, %@, %@", buf, 0x20u);
  }

  switch(a3)
  {
    case 1uLL:
      id v11 = sub_100005D28();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_10000D338();
      }

      [(KerberosLoginViewController *)self promptForPasswordWithContext:v8];
      break;
    case 2uLL:
      id v21 = sub_100005D28();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_10000D36C();
      }

      [(KerberosLoginViewController *)self promptForPrincipalWithContext:v8];
      break;
    case 3uLL:
      uint64_t v12 = sub_100005D28();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_10000D3A0();
      }

      [(KerberosLoginViewController *)self setPromptForSmartCard:1];
      [(KerberosLoginViewController *)self promptForSmartcardWithContext:v8];
      break;
    case 7uLL:
      double v16 = [v9 localizedDescription];
      [(KerberosLoginViewController *)self showMessage:v16 andContext:v8 completion:0];
      goto LABEL_28;
    case 8uLL:
      double v16 = +[NSBundle mainBundle];
      id v22 = [v16 localizedStringForKey:@"PASSWORD_EXPIRED" value:&stru_100014860 table:0];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100008C54;
      v32[3] = &unk_100014628;
      v32[4] = self;
      id v23 = v32;
      id v24 = self;
      id v25 = v22;
      id v26 = v8;
      goto LABEL_27;
    case 9uLL:
      uint64_t v13 = [(KerberosLoginViewController *)self keychainHelper];
      v14 = [v8 serviceName];
      [v13 removeCredentialsFromKeychainWithService:v14];

      double v15 = +[NSBundle mainBundle];
      double v16 = v15;
      CFStringRef v17 = @"ACCOUNT_LOCKED";
      goto LABEL_26;
    case 0xAuLL:
      v27 = [(KerberosLoginViewController *)self keychainHelper];
      unsigned int v28 = [v8 serviceName];
      [v27 removeCredentialsFromKeychainWithService:v28];

      double v15 = +[NSBundle mainBundle];
      double v16 = v15;
      CFStringRef v17 = @"PASSWORD_INCORRECT";
      goto LABEL_26;
    case 0xBuLL:
      v29 = [(KerberosLoginViewController *)self keychainHelper];
      id v30 = [v8 serviceName];
      [v29 removeCredentialsFromKeychainWithService:v30];

      double v15 = +[NSBundle mainBundle];
      double v16 = v15;
      CFStringRef v17 = @"USERNAME_INCORRECT";
      goto LABEL_26;
    case 0xCuLL:
      double v15 = +[NSBundle mainBundle];
      double v16 = v15;
      CFStringRef v17 = @"KDC_UNREACHABLE";
      goto LABEL_26;
    case 0xDuLL:
      double v15 = +[NSBundle mainBundle];
      double v16 = v15;
      CFStringRef v17 = @"UNABLE_TO_RESOLVE_REALM";
      goto LABEL_26;
    case 0xEuLL:
      double v15 = +[NSBundle mainBundle];
      double v16 = v15;
      CFStringRef v17 = @"UNSUPPORTED_ENC_TYPE";
      goto LABEL_26;
    case 0xFuLL:
      double v15 = +[NSBundle mainBundle];
      double v16 = v15;
      CFStringRef v17 = @"CERTIFICATE_NOT_FOUND";
      goto LABEL_26;
    case 0x10uLL:
      id v18 = [(KerberosLoginViewController *)self keychainHelper];
      uint64_t v19 = [v8 serviceName];
      [v18 removeCredentialsFromKeychainWithService:v19];

      double v15 = +[NSBundle mainBundle];
      double v16 = v15;
      CFStringRef v17 = @"PASSWORD_CHANGED_TEXT";
LABEL_26:
      id v22 = [v15 localizedStringForKey:v17 value:&stru_100014860 table:0];
      id v24 = self;
      id v25 = v22;
      id v26 = v8;
      id v23 = 0;
LABEL_27:
      [(KerberosLoginViewController *)v24 showMessage:v25 andContext:v26 completion:v23];

LABEL_28:
      break;
    case 0x11uLL:
      id v20 = sub_100005D28();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_10000D408(v8, v20);
      }

      [v8 completeRequestWithDoNotHandle];
      break;
    case 0x12uLL:
      v31 = sub_100005D28();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        sub_10000D3D4();
      }

      [(KerberosLoginViewController *)self promptForCertificateWithContext:v8];
      break;
    default:
      break;
  }
}

- (void)promptForCertificateWithContext:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008D6C;
  v4[3] = &unk_100014428;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)promptForPrincipalWithContext:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100009338;
  v4[3] = &unk_100014428;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)promptForPasswordWithContext:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100009508;
  v4[3] = &unk_100014428;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)presentPendingAlertIfNeeded
{
  id pendingAlert = self->_pendingAlert;
  if (pendingAlert)
  {
    id v5 = (void (**)(void))objc_retainBlock(pendingAlert);
    v5[2]();
    id v4 = self->_pendingAlert;
    self->_id pendingAlert = 0;
  }
}

- (void)showMessage:(id)a3 andContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000098E0;
  v24[3] = &unk_100014678;
  id v11 = v8;
  id v25 = v11;
  id v26 = self;
  id v12 = v9;
  id v27 = v12;
  id v13 = v10;
  id v28 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009AFC;
  block[3] = &unk_1000146A0;
  id v19 = v11;
  id v20 = self;
  id v21 = v12;
  id v22 = objc_retainBlock(v24);
  id v23 = v13;
  id v14 = v13;
  id v15 = v12;
  double v16 = v22;
  id v17 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)promptForSmartcardWithContext:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_usernameTextField);
  [WeakRetained resignFirstResponder];

  id v5 = objc_loadWeakRetained((id *)&self->_passwordTextField);
  [v5 resignFirstResponder];

  id v6 = [(KerberosLoginViewController *)self loginButton];
  [v6 setEnabled:0];

  id v7 = [(KerberosLoginViewController *)self optionsButton];
  [v7 setEnabled:1];

  id v8 = [(KerberosLoginViewController *)self usernameTextField];
  [v8 setEnabled:0];

  id v9 = [(KerberosLoginViewController *)self passwordTextField];
  [v9 setEnabled:0];

  id v10 = [(KerberosLoginViewController *)self cancelButton];
  [v10 setEnabled:1];

  id v13 = +[NSBundle mainBundle];
  id v11 = [v13 localizedStringForKey:@"PLEASE_INSERT_SMARTCARD" value:&stru_100014860 table:0];
  id v12 = [(KerberosLoginViewController *)self signInTitleLabel];
  [v12 setText:v11];
}

- (void)showAuthControllerForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = sub_100005D28();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10000D5D4();
  }

  [(KerberosLoginViewController *)self enableUI];
  [(KerberosLoginViewController *)self prefillWithCredentialsFromContextIfPossible:v6];
  if ([v6 smartCardNeedsInsert])
  {
    [(KerberosLoginViewController *)self setPromptForSmartCard:1];
    [(KerberosLoginViewController *)self promptForSmartcardWithContext:v6];
  }
  if ([(KerberosLoginViewController *)self viewControllerIsShowing])
  {
    id v9 = sub_100005D28();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10000D5A0();
    }

    if (v7) {
      v7[2](v7, 1, 0);
    }
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100009E68;
    v10[3] = &unk_1000146F0;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [v11 presentAuthorizationViewControllerWithCompletion:v10];
  }
}

- (void)enableUI
{
  [(KerberosLoginViewController *)self _updateLoginButtonState];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cancelButton);
  [WeakRetained setEnabled:1];

  id v4 = objc_loadWeakRetained((id *)&self->_cancelButton);
  [v4 setIsAccessibilityElement:1];

  id v5 = [(KerberosLoginViewController *)self spinner];
  [v5 stopAnimating];
}

- (void)changeUIForCertIdentity
{
  id v3 = [(KerberosLoginViewController *)self currentUIContext];
  id v4 = [v3 pkinitPersistientRef];
  if (v4)
  {

LABEL_4:
    id v8 = [(KerberosLoginViewController *)self currentUIContext];
    id v9 = [v8 userPrincipalName];
    id v10 = [(KerberosLoginViewController *)self usernameTextField];
    [v10 setText:v9];

    id v11 = [(KerberosLoginViewController *)self usernameTextField];
    [v11 setEnabled:0];

    id v12 = +[NSBundle mainBundle];
    id v13 = [v12 localizedStringForKey:@"NO_IDENTITY_SELECTED_TEXT" value:&stru_100014860 table:0];
    id v14 = [(KerberosLoginViewController *)self identityLabel];
    [v14 setText:v13];

    id v15 = [(KerberosLoginViewController *)self identityLabel];
    [v15 setHidden:0];

    double v16 = [(KerberosLoginViewController *)self identityButton];
    [v16 setHidden:0];

    id v17 = [(KerberosLoginViewController *)self passwordTextField];
    [v17 setHidden:1];

    id v18 = [(KerberosLoginViewController *)self passwordTextField];
    [v18 resignFirstResponder];
    goto LABEL_6;
  }
  id v5 = [(KerberosLoginViewController *)self currentUIContext];
  id v6 = [v5 extensionUserData];
  unsigned int v7 = [v6 useSmartCard];

  if (v7) {
    goto LABEL_4;
  }
  id v19 = [(KerberosLoginViewController *)self currentUIContext];
  unsigned int v20 = [v19 userNameIsReadOnly];

  id v21 = [(KerberosLoginViewController *)self usernameTextField];
  [v21 setEnabled:v20 ^ 1];

  id v22 = [(KerberosLoginViewController *)self passwordTextField];
  [v22 setHidden:0];

  id v23 = [(KerberosLoginViewController *)self identityLabel];
  [v23 setHidden:1];

  id v18 = [(KerberosLoginViewController *)self identityButton];
  [v18 setHidden:1];
LABEL_6:

  [(KerberosLoginViewController *)self _updateLoginButtonState];
}

- (void)prefillWithCredentialsFromContextIfPossible:(id)a3
{
  id v4 = a3;
  id v5 = [(KerberosLoginViewController *)self currentUIContext];
  uint64_t v6 = [v5 userName];
  if (v6)
  {
    unsigned int v7 = (void *)v6;
    id v8 = [(KerberosLoginViewController *)self usernameTextField];
    id v9 = [v8 text];
    unsigned int v10 = [v9 isEqualToString:&stru_100014860];

    if (v10)
    {
      id v11 = [(KerberosLoginViewController *)self currentUIContext];
      id v12 = [v11 userName];
      id v13 = [(KerberosLoginViewController *)self usernameTextField];
      [v13 setText:v12];

      id v14 = [(KerberosLoginViewController *)self usernameTextField];
      id v15 = v14;
      uint64_t v16 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v14 = [(KerberosLoginViewController *)self usernameTextField];
  id v15 = v14;
  uint64_t v16 = 1;
LABEL_6:
  [v14 setEnabled:v16];

  p_usernameTextField = &self->_usernameTextField;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_usernameTextField);
  id v19 = [WeakRetained text];
  id v20 = [v19 length];

  if (v20) {
    p_usernameTextField = &self->_passwordTextField;
  }
  id v21 = objc_loadWeakRetained((id *)p_usernameTextField);
  [v21 becomeFirstResponder];

  LODWORD(v21) = [v4 userNameIsReadOnly];
  if (v21)
  {
    id v22 = [(KerberosLoginViewController *)self usernameTextField];
    [v22 setEnabled:0];
  }
  [(KerberosLoginViewController *)self changeUIForCertIdentity];
}

- (void)prefillWithCredentialsFromKeychainIfPossible
{
  id v3 = objc_alloc_init((Class)LAContext);
  id v4 = [(KerberosLoginViewController *)self currentUIContext];
  [v4 setKeychainLAContext:v3];

  id v5 = [(KerberosLoginViewController *)self currentUIContext];
  uint64_t v6 = [v5 keychainLAContext];
  [v6 setOptionCallerName:@"Kerberos"];

  unsigned int v7 = [(KerberosLoginViewController *)self keychainHelper];
  id v8 = [(KerberosLoginViewController *)self currentUIContext];
  id v9 = [v8 keychainLAContext];
  unsigned int v10 = [(KerberosLoginViewController *)self currentUIContext];
  id v11 = [v10 serviceName];
  id v25 = 0;
  id v26 = 0;
  unsigned int v12 = [v7 retrieveCredentialsFromKeychainWithContext:v9 service:v11 returnedUsername:&v26 returnedPassword:&v25];
  id v13 = (NSString *)v26;
  id v14 = (NSString *)v25;

  if (!v12)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_passwordTextField);
    [WeakRetained setText:v14];

    id v16 = objc_loadWeakRetained((id *)&self->_usernameTextField);
    [v16 setText:v13];

    id v17 = sub_100005D28();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "prefilled credentials", v24, 2u);
    }

    [(KerberosLoginViewController *)self _updateLoginButtonState];
    id v18 = [(KerberosLoginViewController *)self loginButton];
    unsigned int v19 = [v18 isEnabled];

    if (v19) {
      [(KerberosLoginViewController *)self loginClicked:0];
    }
  }
  prefilledPassword = self->_prefilledPassword;
  self->_prefilledPassword = v14;
  id v21 = v14;

  prefilledUsername = self->_prefilledUsername;
  self->_prefilledUsername = v13;
  id v23 = v13;
}

- (BOOL)accessibilityPerformEscape
{
  id v3 = sub_100005D28();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "cancelled via accessibility gesture", v5, 2u);
  }

  [(KerberosLoginViewController *)self cancelClicked:0];
  return 1;
}

- (BOOL)accessibilityPerformMagicTap
{
  BOOL v3 = [(KerberosLoginViewController *)self _formIsValid];
  if (v3)
  {
    id v4 = sub_100005D28();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Submitted login request via accessibility gesture", v6, 2u);
    }

    [(KerberosLoginViewController *)self loginClicked:0];
  }
  return v3;
}

- (void)changeFocusedElementForAccessibilityIfNeeded
{
  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A854;
  block[3] = &unk_100014358;
  void block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)disableElementAutoFocusForAccessibility
{
  self->_shouldChangeFocusedElementForAccessibility = 0;
}

- (void)enableElementAutoFocusForAccessibility
{
  self->_shouldChangeFocusedElementForAccessibility = 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_usernameTextField);

  id v6 = objc_loadWeakRetained((id *)&self->_passwordTextField);
  id v7 = v6;
  if (WeakRetained == v4)
  {
    [v6 becomeFirstResponder];
  }
  else
  {

    if (v7 == v4 && [(KerberosLoginViewController *)self _formIsValid]) {
      [(KerberosLoginViewController *)self loginClicked:self];
    }
  }

  return 1;
}

- (void)_updateLoginButtonState
{
  BOOL v3 = [(KerberosLoginViewController *)self _formIsValid];
  loginButton = self->_loginButton;
  [(UIButton *)loginButton setEnabled:v3];
}

- (BOOL)_formIsValid
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_usernameTextField);
  id v4 = [WeakRetained text];
  id v5 = [v4 length];

  id v6 = objc_loadWeakRetained((id *)&self->_passwordTextField);
  id v7 = [v6 text];
  id v8 = [v7 length];

  if (!v5) {
    return 0;
  }
  if (v8) {
    return 1;
  }
  unsigned int v10 = [(KerberosLoginViewController *)self currentUIContext];
  id v11 = [v10 pkinitPersistientRef];
  BOOL v9 = v11 != 0;

  return v9;
}

- (void)didClose
{
  BOOL v3 = [(KerberosLoginViewController *)self passwordViewController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000AB64;
  v4[3] = &unk_100014358;
  v4[4] = self;
  [v3 dismissViewControllerAnimated:1 completion:v4];

  if ([(KerberosLoginViewController *)self _formIsValid]) {
    [(KerberosLoginViewController *)self performSelectorOnMainThread:"loginClicked:" withObject:0 waitUntilDone:0];
  }
}

- (void)didChangePassword
{
  BOOL v3 = [(KerberosLoginViewController *)self currentUIContext];
  id v4 = [v3 password];
  id v5 = [(KerberosLoginViewController *)self passwordTextField];
  [v5 setText:v4];

  id v6 = [(KerberosLoginViewController *)self currentUIContext];
  id v7 = [v6 userName];
  id v8 = [(KerberosLoginViewController *)self usernameTextField];
  [v8 setText:v7];

  BOOL v9 = [(KerberosLoginViewController *)self _formIsValid];
  loginButton = self->_loginButton;
  [(UIButton *)loginButton setEnabled:v9];
}

- (SOKerberosExtensionProcess)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
}

- (SOKeychainHelper)keychainHelper
{
  return self->_keychainHelper;
}

- (void)setKeychainHelper:(id)a3
{
}

- (SOKerberosContext)currentUIContext
{
  return self->_currentUIContext;
}

- (void)setCurrentUIContext:(id)a3
{
}

- (UILabel)signInTitleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_signInTitleLabel);
  return (UILabel *)WeakRetained;
}

- (void)setSignInTitleLabel:(id)a3
{
}

- (UIView)containerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  return (UIView *)WeakRetained;
}

- (void)setContainerView:(id)a3
{
}

- (UITextField)usernameTextField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_usernameTextField);
  return (UITextField *)WeakRetained;
}

- (void)setUsernameTextField:(id)a3
{
}

- (UITextField)passwordTextField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passwordTextField);
  return (UITextField *)WeakRetained;
}

- (void)setPasswordTextField:(id)a3
{
}

- (UINavigationBar)navigationBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
  return (UINavigationBar *)WeakRetained;
}

- (void)setNavigationBar:(id)a3
{
}

- (UINavigationItem)navigationItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationItem);
  return (UINavigationItem *)WeakRetained;
}

- (void)setNavigationItem:(id)a3
{
}

- (NSLayoutConstraint)bottomConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bottomConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setBottomConstraint:(id)a3
{
}

- (UIButton)loginButton
{
  return self->_loginButton;
}

- (void)setLoginButton:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cancelButton);
  return (UIBarButtonItem *)WeakRetained;
}

- (void)setCancelButton:(id)a3
{
}

- (UILabel)customHelpTitleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customHelpTitleLabel);
  return (UILabel *)WeakRetained;
}

- (void)setCustomHelpTitleLabel:(id)a3
{
}

- (UIButton)optionsButton
{
  return self->_optionsButton;
}

- (void)setOptionsButton:(id)a3
{
}

- (UILabel)identityLabel
{
  return self->_identityLabel;
}

- (void)setIdentityLabel:(id)a3
{
}

- (UIButton)identityButton
{
  return self->_identityButton;
}

- (void)setIdentityButton:(id)a3
{
}

- (UIView)userNamePasswordView
{
  return self->_userNamePasswordView;
}

- (void)setUserNamePasswordView:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (UIStackView)loginStackView
{
  return self->_loginStackView;
}

- (void)setLoginStackView:(id)a3
{
}

- (BOOL)viewControllerIsShowing
{
  return self->_viewControllerIsShowing;
}

- (void)setViewControllerIsShowing:(BOOL)a3
{
  self->_viewControllerIsShowing = a3;
}

- (BOOL)promptForSmartCard
{
  return self->_promptForSmartCard;
}

- (void)setPromptForSmartCard:(BOOL)a3
{
  self->_promptForSmartCard = a3;
}

- (TKTokenWatcher)watcher
{
  return (TKTokenWatcher *)objc_getProperty(self, a2, 200, 1);
}

- (void)setWatcher:(id)a3
{
}

- (KerberosPasswordViewController)passwordViewController
{
  return (KerberosPasswordViewController *)objc_getProperty(self, a2, 208, 1);
}

- (void)setPasswordViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordViewController, 0);
  objc_storeStrong((id *)&self->_watcher, 0);
  objc_storeStrong((id *)&self->_loginStackView, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_userNamePasswordView, 0);
  objc_storeStrong((id *)&self->_identityButton, 0);
  objc_storeStrong((id *)&self->_identityLabel, 0);
  objc_storeStrong((id *)&self->_optionsButton, 0);
  objc_destroyWeak((id *)&self->_customHelpTitleLabel);
  objc_destroyWeak((id *)&self->_cancelButton);
  objc_storeStrong((id *)&self->_loginButton, 0);
  objc_destroyWeak((id *)&self->_bottomConstraint);
  objc_destroyWeak((id *)&self->_navigationItem);
  objc_destroyWeak((id *)&self->_navigationBar);
  objc_destroyWeak((id *)&self->_passwordTextField);
  objc_destroyWeak((id *)&self->_usernameTextField);
  objc_destroyWeak((id *)&self->_containerView);
  objc_destroyWeak((id *)&self->_signInTitleLabel);
  objc_storeStrong((id *)&self->_currentUIContext, 0);
  objc_storeStrong((id *)&self->_keychainHelper, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong(&self->_pendingAlert, 0);
  objc_storeStrong((id *)&self->_prefilledPassword, 0);
  objc_storeStrong((id *)&self->_prefilledUsername, 0);
}

@end