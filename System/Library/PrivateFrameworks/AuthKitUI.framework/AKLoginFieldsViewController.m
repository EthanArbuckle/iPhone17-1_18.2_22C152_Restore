@interface AKLoginFieldsViewController
- (AKAppleIDAuthenticationContext)context;
- (AKLoginFieldsDelegate)delegate;
- (AKLoginFieldsViewController)initWithContext:(id)a3;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (UITextField)passwordField;
- (UITextField)usernameField;
- (id)passwordText;
- (id)usernameText;
- (void)_hidePasswordIfNeeded;
- (void)_preparePasswordField;
- (void)_prepareUsernameField;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPasswordField:(id)a3;
- (void)setUsernameField:(id)a3;
- (void)showPasswordField;
- (void)viewDidLoad;
@end

@implementation AKLoginFieldsViewController

- (AKLoginFieldsViewController)initWithContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKLoginFieldsViewController;
  v5 = [(AKLoginFieldsViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_context, v4);
  }

  return v6;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AKLoginFieldsViewController;
  [(AKLoginFieldsViewController *)&v3 viewDidLoad];
  [(AKLoginFieldsViewController *)self _prepareUsernameField];
  [(AKLoginFieldsViewController *)self _preparePasswordField];
}

- (id)usernameText
{
  v2 = [(AKLoginFieldsViewController *)self usernameField];
  objc_super v3 = [v2 text];

  return v3;
}

- (id)passwordText
{
  objc_super v3 = [(AKLoginFieldsViewController *)self passwordField];
  if ([v3 isHidden])
  {
    id v4 = 0;
  }
  else
  {
    v5 = [(AKLoginFieldsViewController *)self passwordField];
    id v4 = [v5 text];
  }

  return v4;
}

- (void)showPasswordField
{
  objc_super v3 = [(AKLoginFieldsViewController *)self passwordField];
  [v3 setHidden:0];

  id v4 = [(AKLoginFieldsViewController *)self passwordField];
  [v4 becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = [(AKLoginFieldsViewController *)self delegate];
  [v4 loginFieldsDidReturn:self];

  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  id v6 = a3;
  v7 = [(AKLoginFieldsViewController *)self usernameField];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    v9 = [(AKLoginFieldsViewController *)self context];
    v10 = [v9 username];

    if (v10)
    {
      v11 = _AKLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1C38C1000, v11, OS_LOG_TYPE_DEFAULT, "Username is changing", v13, 2u);
      }

      [v9 setUsername:0];
    }
    [(AKLoginFieldsViewController *)self _hidePasswordIfNeeded];
  }
  return 1;
}

- (void)_prepareUsernameField
{
  objc_super v3 = [(AKLoginFieldsViewController *)self usernameField];
  [v3 setAutocapitalizationType:0];

  id v4 = [(AKLoginFieldsViewController *)self usernameField];
  [v4 setKeyboardType:7];

  v5 = [(AKLoginFieldsViewController *)self usernameField];
  [v5 setTextContentType:*MEMORY[0x1E4F43E18]];

  id v6 = [(AKLoginFieldsViewController *)self usernameField];
  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v8 = [v7 localizedStringForKey:@"EMAIL_OR_PHONE_PLACEHOLDER" value:&stru_1F1EE8138 table:@"Localizable"];
  [v6 setPlaceholder:v8];

  id v15 = [(AKLoginFieldsViewController *)self context];
  v9 = [v15 username];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    v11 = [v15 username];
    v12 = [(AKLoginFieldsViewController *)self usernameField];
    [v12 setText:v11];
  }
  uint64_t v13 = [v15 isUsernameEditable] ^ 1;
  v14 = [(AKLoginFieldsViewController *)self usernameField];
  [v14 setHidden:v13];
}

- (void)_preparePasswordField
{
  objc_super v3 = [(AKLoginFieldsViewController *)self passwordField];
  [v3 setSecureTextEntry:1];

  id v6 = [(AKLoginFieldsViewController *)self passwordField];
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"PASSWORD_ALERT_PLACEHOLDER" value:&stru_1F1EE8138 table:@"Localizable"];
  [v6 setPlaceholder:v5];
}

- (void)_hidePasswordIfNeeded
{
  objc_super v3 = [(AKLoginFieldsViewController *)self passwordField];
  char v4 = [v3 isHidden];

  if ((v4 & 1) == 0)
  {
    v5 = [(AKLoginFieldsViewController *)self passwordField];
    [v5 setHidden:1];

    id v6 = [(AKLoginFieldsViewController *)self passwordField];
    [v6 setText:0];

    v7 = [(AKLoginFieldsViewController *)self delegate];
    [v7 passwordFieldDidHide:self];

    id v8 = [(AKLoginFieldsViewController *)self usernameField];
    [v8 becomeFirstResponder];
  }
}

- (AKLoginFieldsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKLoginFieldsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AKAppleIDAuthenticationContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);

  return (AKAppleIDAuthenticationContext *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (UITextField)usernameField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_usernameField);

  return (UITextField *)WeakRetained;
}

- (void)setUsernameField:(id)a3
{
}

- (UITextField)passwordField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passwordField);

  return (UITextField *)WeakRetained;
}

- (void)setPasswordField:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_passwordField);
  objc_destroyWeak((id *)&self->_usernameField);
  objc_destroyWeak((id *)&self->_context);

  objc_destroyWeak((id *)&self->_delegate);
}

@end