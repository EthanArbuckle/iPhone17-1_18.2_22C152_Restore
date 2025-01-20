@interface KerberosPasswordViewController
- (BOOL)_formIsValid;
- (BOOL)_hasFilledRequiredFormFields;
- (BOOL)_hasVerifiedNewPassword;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityPerformMagicTap;
- (BOOL)textFieldShouldReturn:(id)a3;
- (KerberosPasswordChangeViewControllerDelegate)delegate;
- (KerberosPasswordViewController)initWithCoder:(id)a3;
- (KerberosPasswordViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSLayoutConstraint)bottomConstraint;
- (SOKerberosContext)currentUIContext;
- (SOKerberosExtensionProcess)process;
- (SOKeychainHelper)keychainHelper;
- (UIActivityIndicatorView)spinner;
- (UIBarButtonItem)cancelButton;
- (UIButton)changePasswordButton;
- (UILabel)realmLabel;
- (UINavigationBar)navigationBar;
- (UINavigationItem)navigationItem;
- (UITextField)changedPasswordAgainTextField;
- (UITextField)changedPasswordTextField;
- (UITextField)passwordTextField;
- (UITextField)usernameTextField;
- (UIView)containerView;
- (UIView)separator1;
- (UIView)separator2;
- (UIView)userNamePasswordView;
- (id)nibName;
- (void)_disableUI;
- (void)_enableUI;
- (void)_showMessage:(id)a3 completionHandler:(id)a4;
- (void)cancelClicked:(id)a3;
- (void)cancelCurrentOperation;
- (void)changeADPassword;
- (void)changeFocusedElementForAccessibilityIfNeeded;
- (void)changePasswordClicked;
- (void)disableElementAutoFocusForAccessibility;
- (void)enableElementAutoFocusForAccessibility;
- (void)handleKerberosOperation:(id)a3 withMessage:(id)a4;
- (void)keyboardWillChangeFrame:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)setBottomConstraint:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setChangePasswordButton:(id)a3;
- (void)setChangedPasswordAgainTextField:(id)a3;
- (void)setChangedPasswordTextField:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setCurrentUIContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setKeychainHelper:(id)a3;
- (void)setNavigationBar:(id)a3;
- (void)setNavigationItem:(id)a3;
- (void)setPasswordTextField:(id)a3;
- (void)setProcess:(id)a3;
- (void)setRealmLabel:(id)a3;
- (void)setSeparator1:(id)a3;
- (void)setSeparator2:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setUserNamePasswordView:(id)a3;
- (void)setUsernameTextField:(id)a3;
- (void)textFieldDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation KerberosPasswordViewController

- (id)nibName
{
  return @"KerberosPasswordViewController";
}

- (KerberosPasswordViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)KerberosPasswordViewController;
  result = [(KerberosPasswordViewController *)&v5 initWithNibName:a3 bundle:a4];
  if (result) {
    result->_shouldChangeFocusedElementForAccessibility = 1;
  }
  return result;
}

- (KerberosPasswordViewController)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)KerberosPasswordViewController;
  result = [(KerberosPasswordViewController *)&v4 initWithCoder:a3];
  if (result) {
    result->_shouldChangeFocusedElementForAccessibility = 1;
  }
  return result;
}

- (void)viewDidLoad
{
  v35.receiver = self;
  v35.super_class = (Class)KerberosPasswordViewController;
  [(KerberosPasswordViewController *)&v35 viewDidLoad];
  v3 = sub_1000033E0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000CFAC();
  }

  objc_super v4 = [(KerberosPasswordViewController *)self changePasswordButton];
  objc_super v5 = [v4 layer];
  [v5 setCornerRadius:10.0];

  v6 = [(KerberosPasswordViewController *)self userNamePasswordView];
  v7 = [v6 layer];
  [v7 setCornerRadius:10.0];

  v8 = +[UIColor secondarySystemBackgroundColor];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_separator1);
  [WeakRetained setBackgroundColor:v8];

  v10 = +[UIColor secondarySystemBackgroundColor];
  id v11 = objc_loadWeakRetained((id *)&self->_separator2);
  [v11 setBackgroundColor:v10];

  id v12 = objc_alloc_init((Class)UILabel);
  [v12 setText:@"Change Password"];
  [v12 setTextAlignment:0];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
  [v12 setFont:v13];

  [v12 setAdjustsFontForContentSizeCategory:1];
  id v14 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v12];
  v15 = [(KerberosPasswordViewController *)self navigationItem];
  [v15 setLeftBarButtonItem:v14];

  id v16 = objc_loadWeakRetained((id *)&self->_usernameTextField);
  [v16 setDelegate:self];

  id v17 = objc_loadWeakRetained((id *)&self->_passwordTextField);
  [v17 setDelegate:self];

  id v18 = objc_loadWeakRetained((id *)&self->_changedPasswordTextField);
  [v18 setDelegate:self];

  id v19 = objc_loadWeakRetained((id *)&self->_changedPasswordAgainTextField);
  [v19 setDelegate:self];

  id v20 = objc_loadWeakRetained((id *)&self->_usernameTextField);
  [v20 addTarget:self action:"textFieldDidChange:" forControlEvents:0x20000];

  id v21 = objc_loadWeakRetained((id *)&self->_passwordTextField);
  [v21 addTarget:self action:"textFieldDidChange:" forControlEvents:0x20000];

  id v22 = objc_loadWeakRetained((id *)&self->_changedPasswordTextField);
  [v22 addTarget:self action:"textFieldDidChange:" forControlEvents:0x20000];

  id v23 = objc_loadWeakRetained((id *)&self->_changedPasswordAgainTextField);
  [v23 addTarget:self action:"textFieldDidChange:" forControlEvents:0x20000];

  id v24 = objc_loadWeakRetained((id *)&self->_usernameTextField);
  [v24 setTextContentType:UITextContentTypeUsername];

  id v25 = objc_loadWeakRetained((id *)&self->_passwordTextField);
  [v25 setTextContentType:UITextContentTypePassword];

  id v26 = objc_loadWeakRetained((id *)&self->_changedPasswordTextField);
  [v26 setTextContentType:UITextContentTypeNewPassword];

  id v27 = objc_loadWeakRetained((id *)&self->_changedPasswordAgainTextField);
  [v27 setTextContentType:UITextContentTypeNewPassword];

  v28 = [(KerberosPasswordViewController *)self containerView];
  [v28 setClipsToBounds:1];

  v29 = [(KerberosPasswordViewController *)self containerView];
  v30 = [v29 layer];
  [v30 setCornerRadius:10.0];

  v31 = [(KerberosPasswordViewController *)self containerView];
  v32 = [v31 layer];
  [v32 setMaskedCorners:3];

  v33 = +[NSNotificationCenter defaultCenter];
  [v33 addObserver:self selector:"keyboardWillChangeFrame:" name:UIKeyboardWillChangeFrameNotification object:0];

  v34 = +[NSNotificationCenter defaultCenter];
  [v34 addObserver:self selector:"keyboardWillHide:" name:UIKeyboardWillHideNotification object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v19.receiver = self;
  v19.super_class = (Class)KerberosPasswordViewController;
  [(KerberosPasswordViewController *)&v19 viewWillAppear:a3];
  objc_super v4 = [(KerberosPasswordViewController *)self currentUIContext];
  objc_super v5 = [v4 realm];
  v6 = [(KerberosPasswordViewController *)self realmLabel];
  [v6 setText:v5];

  v7 = [(KerberosPasswordViewController *)self currentUIContext];
  v8 = [v7 userName];
  v9 = [(KerberosPasswordViewController *)self usernameTextField];
  [v9 setText:v8];

  v10 = [(KerberosPasswordViewController *)self currentUIContext];
  uint64_t v11 = [v10 userNameIsReadOnly] ^ 1;
  id v12 = [(KerberosPasswordViewController *)self usernameTextField];
  [v12 setEnabled:v11];

  v13 = [(KerberosPasswordViewController *)self passwordTextField];
  [v13 setText:&stru_100014860];

  [(KerberosPasswordViewController *)self _enableUI];
  p_usernameTextField = &self->_usernameTextField;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_usernameTextField);
  id v16 = [WeakRetained text];
  id v17 = [v16 length];

  if (v17) {
    p_usernameTextField = &self->_passwordTextField;
  }
  id v18 = objc_loadWeakRetained((id *)p_usernameTextField);
  [v18 becomeFirstResponder];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)KerberosPasswordViewController;
  [(KerberosPasswordViewController *)&v5 viewDidAppear:a3];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100003674;
  v4[3] = &unk_100014358;
  v4[4] = self;
  +[UIView animateWithDuration:1 delay:v4 options:&stru_100014398 animations:0.35 completion:0.35];
}

- (void)keyboardWillChangeFrame:(id)a3
{
  objc_super v4 = [a3 userInfo];
  objc_super v5 = [v4 objectForKey:UIKeyboardFrameEndUserInfoKey];
  [v5 CGRectValue];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;

  id v14 = [v4 objectForKey:UIKeyboardAnimationDurationUserInfoKey];
  [v14 doubleValue];
  double v16 = v15;

  id v17 = [v4 objectForKey:UIKeyboardAnimationCurveUserInfoKey];
  id v18 = [v17 unsignedIntegerValue];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100003840;
  v19[3] = &unk_1000143C0;
  v19[4] = self;
  v19[5] = v7;
  v19[6] = v9;
  v19[7] = v11;
  v19[8] = v13;
  +[UIView animateWithDuration:v18 delay:v19 options:&stru_1000143E0 animations:v16 completion:0.0];
}

- (void)keyboardWillHide:(id)a3
{
  objc_super v4 = [a3 userInfo];
  objc_super v5 = [v4 objectForKey:UIKeyboardAnimationDurationUserInfoKey];
  [v5 doubleValue];
  double v7 = v6;

  uint64_t v8 = [v4 objectForKey:UIKeyboardAnimationCurveUserInfoKey];
  id v9 = [v8 unsignedIntegerValue];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000039C8;
  v10[3] = &unk_100014358;
  v10[4] = self;
  +[UIView animateWithDuration:v9 delay:v10 options:&stru_100014400 animations:v7 completion:0.0];
}

- (void)changePasswordClicked
{
  v3 = sub_1000033E0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000D048();
  }

  if ([(KerberosPasswordViewController *)self _formIsValid])
  {
    objc_super v4 = sub_1000033E0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10000CFE0();
    }

    objc_super v5 = [(KerberosPasswordViewController *)self usernameTextField];
    double v6 = [v5 text];
    double v7 = [(KerberosPasswordViewController *)self currentUIContext];
    [v7 setUserName:v6];

    uint64_t v8 = [(KerberosPasswordViewController *)self passwordTextField];
    id v9 = [v8 text];
    uint64_t v10 = [(KerberosPasswordViewController *)self currentUIContext];
    [v10 setPassword:v9];

    uint64_t v11 = [(KerberosPasswordViewController *)self changedPasswordTextField];
    uint64_t v12 = [v11 text];
    uint64_t v13 = [(KerberosPasswordViewController *)self currentUIContext];
    [v13 setChangedPassword:v12];

    [(KerberosPasswordViewController *)self changeADPassword];
  }
  else if (![(KerberosPasswordViewController *)self _hasVerifiedNewPassword])
  {
    [(KerberosPasswordViewController *)self _disableUI];
    id v14 = +[NSBundle mainBundle];
    double v15 = [v14 localizedStringForKey:@"PASSWORD_CHANGE_PASSWORD_MATCH_ALERT_TEXT" value:&stru_100014860 table:0];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100003C64;
    v17[3] = &unk_100014358;
    v17[4] = self;
    [(KerberosPasswordViewController *)self _showMessage:v15 completionHandler:v17];

    double v16 = sub_1000033E0();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10000D014();
    }
  }
}

- (void)cancelClicked:(id)a3
{
  objc_super v4 = sub_1000033E0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000D07C();
  }

  objc_super v5 = [(KerberosPasswordViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(KerberosPasswordViewController *)self delegate];
    [v7 didClose];
  }
  else
  {
    uint64_t v8 = [(KerberosPasswordViewController *)self presentingViewController];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100003D70;
    v9[3] = &unk_100014358;
    v9[4] = self;
    [v8 dismissViewControllerAnimated:1 completion:v9];
  }
}

- (void)_disableUI
{
  v3 = [(KerberosPasswordViewController *)self changePasswordButton];
  [v3 setEnabled:0];

  objc_super v4 = [(KerberosPasswordViewController *)self cancelButton];
  [v4 setEnabled:0];

  objc_super v5 = [(KerberosPasswordViewController *)self cancelButton];
  [v5 setIsAccessibilityElement:0];

  char v6 = [(KerberosPasswordViewController *)self usernameTextField];
  [v6 setEnabled:0];

  double v7 = [(KerberosPasswordViewController *)self passwordTextField];
  [v7 setEnabled:0];

  uint64_t v8 = [(KerberosPasswordViewController *)self changedPasswordTextField];
  [v8 setEnabled:0];

  id v9 = [(KerberosPasswordViewController *)self changedPasswordAgainTextField];
  [v9 setEnabled:0];

  uint64_t v10 = [(KerberosPasswordViewController *)self spinner];
  [v10 startAnimating];

  [(KerberosPasswordViewController *)self changeFocusedElementForAccessibilityIfNeeded];
}

- (void)_enableUI
{
  BOOL v3 = [(KerberosPasswordViewController *)self _hasFilledRequiredFormFields];
  objc_super v4 = [(KerberosPasswordViewController *)self changePasswordButton];
  [v4 setEnabled:v3];

  objc_super v5 = [(KerberosPasswordViewController *)self cancelButton];
  [v5 setEnabled:1];

  char v6 = [(KerberosPasswordViewController *)self cancelButton];
  [v6 setIsAccessibilityElement:1];

  double v7 = [(KerberosPasswordViewController *)self currentUIContext];
  uint64_t v8 = [v7 userNameIsReadOnly] ^ 1;
  id v9 = [(KerberosPasswordViewController *)self usernameTextField];
  [v9 setEnabled:v8];

  uint64_t v10 = [(KerberosPasswordViewController *)self passwordTextField];
  [v10 setEnabled:1];

  uint64_t v11 = [(KerberosPasswordViewController *)self changedPasswordTextField];
  [v11 setEnabled:1];

  uint64_t v12 = [(KerberosPasswordViewController *)self changedPasswordAgainTextField];
  [v12 setEnabled:1];

  id v13 = [(KerberosPasswordViewController *)self spinner];
  [v13 stopAnimating];
}

- (void)cancelCurrentOperation
{
  id v2 = [(KerberosPasswordViewController *)self currentUIContext];
  [v2 cancelRequest];
}

- (void)handleKerberosOperation:(id)a3 withMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_1000033E0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10000D0B0((uint64_t)v6, (uint64_t)v7, v8);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000412C;
  v10[3] = &unk_100014450;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v9 presentAuthorizationViewControllerWithCompletion:v10];
}

- (void)changeADPassword
{
  BOOL v3 = sub_1000033E0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000D138();
  }

  [(KerberosPasswordViewController *)self _disableUI];
  objc_super v4 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004394;
  block[3] = &unk_100014358;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_showMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"CHANGE_PASSWORD_ERROR" value:&stru_100014860 table:0];
  uint64_t v10 = +[UIAlertController alertControllerWithTitle:v9 message:v7 preferredStyle:1];

  id v11 = +[NSBundle mainBundle];
  uint64_t v12 = [v11 localizedStringForKey:@"OK_TEXT" value:&stru_100014860 table:0];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100004AF0;
  v16[3] = &unk_100014478;
  v16[4] = self;
  id v17 = v6;
  id v13 = v6;
  id v14 = +[UIAlertAction actionWithTitle:v12 style:0 handler:v16];
  [v10 addAction:v14];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100004B38;
  v15[3] = &unk_100014358;
  v15[4] = self;
  [(KerberosPasswordViewController *)self presentViewController:v10 animated:1 completion:v15];
}

- (void)textFieldDidChange:(id)a3
{
  BOOL v4 = [(KerberosPasswordViewController *)self _hasFilledRequiredFormFields];
  changePasswordButton = self->_changePasswordButton;
  [(UIButton *)changePasswordButton setEnabled:v4];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_usernameTextField);

  id v6 = objc_loadWeakRetained((id *)&self->_passwordTextField);
  id v7 = v6;
  if (WeakRetained == v4) {
    goto LABEL_7;
  }

  id v8 = objc_loadWeakRetained((id *)&self->_changedPasswordTextField);
  id v9 = v8;
  if (v7 == v4)
  {
    [v8 becomeFirstResponder];

    goto LABEL_9;
  }

  id v10 = objc_loadWeakRetained((id *)&self->_changedPasswordAgainTextField);
  id v7 = v10;
  if (v9 == v4)
  {
LABEL_7:
    [v7 becomeFirstResponder];
  }
  else
  {

    if (v7 == v4
      && [(KerberosPasswordViewController *)self _hasFilledRequiredFormFields])
    {
      [(KerberosPasswordViewController *)self changePasswordClicked];
    }
  }
LABEL_9:

  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  BOOL v3 = sub_1000033E0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "cancelled via accessibility gesture", v5, 2u);
  }

  [(KerberosPasswordViewController *)self cancelClicked:0];
  return 1;
}

- (BOOL)accessibilityPerformMagicTap
{
  BOOL v3 = [(KerberosPasswordViewController *)self _hasFilledRequiredFormFields];
  if (v3)
  {
    id v4 = sub_1000033E0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Submitted password change request via accessibility gesture", v6, 2u);
    }

    [(KerberosPasswordViewController *)self changePasswordClicked:0];
  }
  return v3;
}

- (void)changeFocusedElementForAccessibilityIfNeeded
{
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004E0C;
  block[3] = &unk_100014358;
  block[4] = self;
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

- (BOOL)_formIsValid
{
  unsigned __int8 v3 = [(KerberosPasswordViewController *)self _hasFilledRequiredFormFields];
  return v3 & [(KerberosPasswordViewController *)self _hasVerifiedNewPassword];
}

- (BOOL)_hasFilledRequiredFormFields
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_usernameTextField);
  id v4 = [WeakRetained text];
  id v5 = [v4 length];

  id v6 = objc_loadWeakRetained((id *)&self->_passwordTextField);
  id v7 = [v6 text];
  id v8 = [v7 length];

  id v9 = objc_loadWeakRetained((id *)&self->_changedPasswordTextField);
  id v10 = [v9 text];
  id v11 = [v10 length];

  id v12 = objc_loadWeakRetained((id *)&self->_changedPasswordAgainTextField);
  id v13 = [v12 text];
  id v14 = [v13 length];

  BOOL result = 0;
  if (v5 && v8)
  {
    if (v11) {
      BOOL v16 = v14 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    return !v16;
  }
  return result;
}

- (BOOL)_hasVerifiedNewPassword
{
  unsigned __int8 v3 = [(KerberosPasswordViewController *)self changedPasswordTextField];
  id v4 = [v3 text];
  id v5 = [(KerberosPasswordViewController *)self changedPasswordAgainTextField];
  id v6 = [v5 text];
  unsigned __int8 v7 = [v4 isEqualToString:v6];

  return v7;
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

- (KerberosPasswordChangeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (KerberosPasswordChangeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
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

- (UILabel)realmLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_realmLabel);
  return (UILabel *)WeakRetained;
}

- (void)setRealmLabel:(id)a3
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

- (UITextField)changedPasswordTextField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changedPasswordTextField);
  return (UITextField *)WeakRetained;
}

- (void)setChangedPasswordTextField:(id)a3
{
}

- (UITextField)changedPasswordAgainTextField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changedPasswordAgainTextField);
  return (UITextField *)WeakRetained;
}

- (void)setChangedPasswordAgainTextField:(id)a3
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

- (UIView)separator1
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_separator1);
  return (UIView *)WeakRetained;
}

- (void)setSeparator1:(id)a3
{
}

- (UIView)separator2
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_separator2);
  return (UIView *)WeakRetained;
}

- (void)setSeparator2:(id)a3
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

- (UINavigationItem)navigationItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationItem);
  return (UINavigationItem *)WeakRetained;
}

- (void)setNavigationItem:(id)a3
{
}

- (UIButton)changePasswordButton
{
  return self->_changePasswordButton;
}

- (void)setChangePasswordButton:(id)a3
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

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (UIView)userNamePasswordView
{
  return self->_userNamePasswordView;
}

- (void)setUserNamePasswordView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNamePasswordView, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_destroyWeak((id *)&self->_cancelButton);
  objc_storeStrong((id *)&self->_changePasswordButton, 0);
  objc_destroyWeak((id *)&self->_navigationItem);
  objc_destroyWeak((id *)&self->_bottomConstraint);
  objc_destroyWeak((id *)&self->_separator2);
  objc_destroyWeak((id *)&self->_separator1);
  objc_destroyWeak((id *)&self->_navigationBar);
  objc_destroyWeak((id *)&self->_changedPasswordAgainTextField);
  objc_destroyWeak((id *)&self->_changedPasswordTextField);
  objc_destroyWeak((id *)&self->_passwordTextField);
  objc_destroyWeak((id *)&self->_usernameTextField);
  objc_destroyWeak((id *)&self->_realmLabel);
  objc_destroyWeak((id *)&self->_containerView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentUIContext, 0);
  objc_storeStrong((id *)&self->_keychainHelper, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

@end