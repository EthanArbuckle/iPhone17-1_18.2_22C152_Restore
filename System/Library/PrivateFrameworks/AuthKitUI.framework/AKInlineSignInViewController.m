@interface AKInlineSignInViewController
- (AKInlineSignInViewController)init;
- (AKInlineSignInViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AKTextField)appleIDField;
- (AKTextField)passwordField;
- (BOOL)_canShowWhileLocked;
- (BOOL)isPrimaryButtonHidden;
- (BOOL)shouldPromptForPasswordOnly;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)usesDarkMode;
- (BOOL)usesVibrancy;
- (BOOL)wantsAuthenticationProgress;
- (NSString)primaryButtonTitle;
- (NSString)secondaryButtonTitle;
- (NSString)tertiaryButtonTitle;
- (UIActivityIndicatorView)spinner;
- (UIButton)createAppleIDButton;
- (UIButton)iforgotButton;
- (UIButton)signInButton;
- (UIColor)entryDescriptionTextColor;
- (UIColor)entryFieldTextColor;
- (UIColor)fieldBackgroundColor;
- (UIView)loginFieldsContainer;
- (id)_userFriendlyUsername:(id)a3;
- (id)context;
- (int64_t)blurEffectStyle;
- (void)_beginAuthenticationIfPossibleWithOption:(unint64_t)a3;
- (void)_passwordFieldTapped;
- (void)_prefillAuthFields;
- (void)_setButtonTitles;
- (void)_setCreateButtonEnabled:(BOOL)a3;
- (void)_setCreateButtonHidden:(BOOL)a3;
- (void)_setForgotButtonHidden:(BOOL)a3;
- (void)_setPasswordFieldHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateFonts:(id)a3;
- (void)_updateSignInButtonState;
- (void)_updateSignInFieldStatuses;
- (void)_updateVibrancyAndBlurInTextFields;
- (void)_usernameFieldTapped;
- (void)context:(id)a3 needsPasswordWithCompletion:(id)a4;
- (void)createAppleIDButtonWasTapped:(id)a3;
- (void)dealloc;
- (void)iForgotButtonWasTapped:(id)a3;
- (void)refreshCreateAppleIDButton;
- (void)setAppleIDField:(id)a3;
- (void)setBlurEffectStyle:(int64_t)a3;
- (void)setContext:(id)a3;
- (void)setCreateAppleIDButton:(id)a3;
- (void)setEntryDescriptionTextColor:(id)a3;
- (void)setEntryFieldTextColor:(id)a3;
- (void)setFieldBackgroundColor:(id)a3;
- (void)setIforgotButton:(id)a3;
- (void)setLoginFieldsContainer:(id)a3;
- (void)setPasswordField:(id)a3;
- (void)setPrimaryButtonHidden:(BOOL)a3;
- (void)setSecondaryButtonTarget:(id)a3 action:(SEL)a4;
- (void)setSecondaryButtonTitle:(id)a3;
- (void)setShouldPromptForPasswordOnly:(BOOL)a3;
- (void)setSignInButton:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setTertiaryButtonTarget:(id)a3 action:(SEL)a4;
- (void)setTertiaryButtonTitle:(id)a3;
- (void)setUsesDarkMode:(BOOL)a3;
- (void)setUsesVibrancy:(BOOL)a3;
- (void)setWantsAuthenticationProgress:(BOOL)a3;
- (void)signInButtonWasTapped:(id)a3;
- (void)startAnimating;
- (void)stopAnimating;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AKInlineSignInViewController

- (AKInlineSignInViewController)init
{
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [(AKBaseSignInViewController *)self _initWithNibName:@"AKInlineSignInViewController_iOS" bundle:v3];

  if (v4)
  {
    objc_initWeak(&location, v4);
    v5 = dispatch_get_global_queue(33, 0);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    v9 = __36__AKInlineSignInViewController_init__block_invoke;
    v10 = &unk_1E648F498;
    objc_copyWeak(&v11, &location);
    dispatch_async(v5, &v7);

    [(AKInlineSignInViewController *)v4 _setButtonTitles];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __36__AKInlineSignInViewController_init__block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__AKInlineSignInViewController_init__block_invoke_2;
  v3[3] = &unk_1E648F470;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  [v2 isCreateAppleIDAllowedWithCompletion:v3];
  objc_destroyWeak(&v4);
}

void __36__AKInlineSignInViewController_init__block_invoke_2(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__AKInlineSignInViewController_init__block_invoke_3;
  v3[3] = &unk_1E648F448;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
}

void __36__AKInlineSignInViewController_init__block_invoke_3(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1018] = *(unsigned char *)(a1 + 40);
    v3 = WeakRetained;
    [WeakRetained refreshCreateAppleIDButton];
    WeakRetained = v3;
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43788] object:0];

  v4.receiver = self;
  v4.super_class = (Class)AKInlineSignInViewController;
  [(AKBaseSignInViewController *)&v4 dealloc];
}

- (AKInlineSignInViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Call -init instead of -initWithNibName:bundle:"];
  v6.receiver = self;
  v6.super_class = (Class)AKInlineSignInViewController;
  return (AKInlineSignInViewController *)[(AKBaseSignInViewController *)&v6 _initWithNibName:0 bundle:0];
}

- (NSString)secondaryButtonTitle
{
  return self->_secondaryButtonTitle;
}

- (void)setSecondaryButtonTitle:(id)a3
{
  id v8 = a3;
  if (!-[NSString isEqualToString:](self->_secondaryButtonTitle, "isEqualToString:"))
  {
    objc_super v4 = (NSString *)[v8 copy];
    secondaryButtonTitle = self->_secondaryButtonTitle;
    self->_secondaryButtonTitle = v4;

    objc_super v6 = [(AKInlineSignInViewController *)self iforgotButton];
    [v6 setTitle:self->_secondaryButtonTitle forState:0];

    if ([(NSString *)self->_secondaryButtonTitle length])
    {
      uint64_t v7 = [(AKInlineSignInViewController *)self iforgotButton];
      [v7 setHidden:0];
    }
    else
    {
      [(AKInlineSignInViewController *)self _setForgotButtonHidden:1];
    }
  }
}

- (NSString)tertiaryButtonTitle
{
  return self->_tertiaryButtonTitle;
}

- (void)setTertiaryButtonTitle:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_tertiaryButtonTitle, "isEqualToString:"))
  {
    objc_super v4 = (NSString *)[v6 copy];
    tertiaryButtonTitle = self->_tertiaryButtonTitle;
    self->_tertiaryButtonTitle = v4;
  }
  [(AKInlineSignInViewController *)self refreshCreateAppleIDButton];
}

- (void)refreshCreateAppleIDButton
{
  if (self->_createAppleIDAllowed
    && ([(AKInlineSignInViewController *)self createAppleIDButton],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v3 setTitle:self->_tertiaryButtonTitle forState:0],
        v3,
        [(NSString *)self->_tertiaryButtonTitle length]))
  {
    [(AKInlineSignInViewController *)self _setCreateButtonHidden:0];
    id v4 = [(AKInlineSignInViewController *)self createAppleIDButton];
    [(AKInlineSignInViewController *)self _applyStyleForCreateOrForgot:v4];
  }
  else
  {
    [(AKInlineSignInViewController *)self _setCreateButtonHidden:1];
  }
}

- (void)_setCreateButtonHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AKInlineSignInViewController *)self createAppleIDButton];
  [v4 setHidden:v3];
}

- (void)_setForgotButtonHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AKInlineSignInViewController *)self iforgotButton];
  [v4 setHidden:v3];
}

- (void)_setCreateButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AKInlineSignInViewController *)self createAppleIDButton];
  [v4 setEnabled:v3];
}

- (void)setSecondaryButtonTarget:(id)a3 action:(SEL)a4
{
  id v9 = a3;
  id v6 = [(AKInlineSignInViewController *)self view];

  if (v6)
  {
    uint64_t v7 = [(AKInlineSignInViewController *)self iforgotButton];
    [v7 removeTarget:self action:sel_iForgotButtonWasTapped_ forControlEvents:64];

    id v8 = [(AKInlineSignInViewController *)self iforgotButton];
    [v8 addTarget:v9 action:a4 forControlEvents:64];
  }
}

- (void)setTertiaryButtonTarget:(id)a3 action:(SEL)a4
{
  id v9 = a3;
  id v6 = [(AKInlineSignInViewController *)self view];

  if (v6)
  {
    uint64_t v7 = [(AKInlineSignInViewController *)self createAppleIDButton];
    [v7 removeTarget:self action:sel_createAppleIDButtonWasTapped_ forControlEvents:64];

    id v8 = [(AKInlineSignInViewController *)self createAppleIDButton];
    [v8 addTarget:v9 action:a4 forControlEvents:64];
  }
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_context, a3);
  char v5 = [(AKAppleIDAuthenticationInAppContext *)self->_context _passwordDelegate];

  if (!v5) {
    [(AKAppleIDAuthenticationInAppContext *)self->_context _setPasswordDelegate:self];
  }
  [(AKInlineSignInViewController *)self _prefillAuthFields];
  [(AKInlineSignInViewController *)self _updateSignInFieldStatuses];
}

- (void)viewDidLoad
{
  v87.receiver = self;
  v87.super_class = (Class)AKInlineSignInViewController;
  [(AKInlineSignInViewController *)&v87 viewDidLoad];
  BOOL v3 = [(AKInlineSignInViewController *)self view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = [(AKInlineSignInViewController *)self iforgotButton];
  [v4 setTitle:self->_secondaryButtonTitle forState:0];

  char v5 = [(AKInlineSignInViewController *)self iforgotButton];
  [(AKInlineSignInViewController *)self _applyStyleForCreateOrForgot:v5];

  id v6 = [(AKInlineSignInViewController *)self iforgotButton];
  uint64_t v7 = [v6 allTargets];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    id v9 = [(AKInlineSignInViewController *)self iforgotButton];
    [v9 addTarget:self action:sel_iForgotButtonWasTapped_ forControlEvents:64];
  }
  if (![(NSString *)self->_secondaryButtonTitle length]) {
    [(AKInlineSignInViewController *)self _setForgotButtonHidden:1];
  }
  [(AKInlineSignInViewController *)self refreshCreateAppleIDButton];
  v10 = [(AKInlineSignInViewController *)self createAppleIDButton];
  id v11 = [v10 allTargets];
  uint64_t v12 = [v11 count];

  if (!v12)
  {
    v13 = [(AKInlineSignInViewController *)self createAppleIDButton];
    [v13 addTarget:self action:sel_createAppleIDButtonWasTapped_ forControlEvents:64];
  }
  v14 = [(AKInlineSignInViewController *)self signInButton];
  [v14 setTitle:self->_primaryButtonTitle forState:0];

  v15 = [(AKInlineSignInViewController *)self signInButton];
  [v15 addTarget:self action:sel_signInButtonWasTapped_ forControlEvents:64];

  v16 = [(AKInlineSignInViewController *)self signInButton];
  objc_msgSend(v16, "setHidden:", -[AKInlineSignInViewController isPrimaryButtonHidden](self, "isPrimaryButtonHidden"));

  v17 = [(AKInlineSignInViewController *)self signInButton];
  [(AKInlineSignInViewController *)self _applyStyleForButton:v17];

  v18 = [(AKInlineSignInViewController *)self appleIDField];
  [v18 setRowIdentifier:3];

  v19 = [(AKInlineSignInViewController *)self passwordField];
  if ([(AKInlineSignInViewController *)self shouldPromptForPasswordOnly]) {
    uint64_t v20 = 3;
  }
  else {
    uint64_t v20 = 1;
  }
  [v19 setRowIdentifier:v20];

  v21 = [(AKInlineSignInViewController *)self appleIDField];
  v22 = [v21 entryField];
  v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v24 = [v23 localizedStringForKey:@"EMAIL_OR_PHONE_PLACEHOLDER" value:&stru_1F1EE8138 table:@"Localizable"];
  [v22 setPlaceholder:v24];

  v25 = [(AKInlineSignInViewController *)self appleIDField];
  v26 = [v25 entryField];
  [v26 setKeyboardType:7];

  v27 = [(AKInlineSignInViewController *)self appleIDField];
  v28 = [v27 entryField];
  [v28 setAutocapitalizationType:0];

  v29 = [(AKInlineSignInViewController *)self appleIDField];
  v30 = [v29 entryField];
  [v30 setAutocorrectionType:1];

  v31 = [(AKInlineSignInViewController *)self appleIDField];
  v32 = [v31 entryField];
  [v32 setAdjustsFontSizeToFitWidth:1];

  v33 = [(AKInlineSignInViewController *)self appleIDField];
  v34 = [v33 entryField];
  [v34 setReturnKeyType:11];

  v35 = [(AKInlineSignInViewController *)self appleIDField];
  v36 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__usernameFieldTapped];
  [v35 addGestureRecognizer:v36];

  v37 = [(AKInlineSignInViewController *)self appleIDField];
  v38 = [v37 entryField];
  [v38 addTarget:self action:sel__appleIDTextFieldDidChange_ forControlEvents:983040];

  v39 = [(AKInlineSignInViewController *)self appleIDField];
  v40 = [v39 entryField];
  [v40 setDelegate:self];

  v41 = [(AKInlineSignInViewController *)self appleIDField];
  v42 = [v41 entryField];
  [v42 setTextContentType:*MEMORY[0x1E4F43E18]];

  [(AKInlineSignInViewController *)self _updateFonts:0];
  [(AKInlineSignInViewController *)self _prefillAuthFields];
  v43 = [(AKInlineSignInViewController *)self passwordField];
  v44 = [v43 entryField];
  v45 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v46 = [v45 localizedStringForKey:@"PASSWORD_PLACEHOLDER" value:&stru_1F1EE8138 table:@"Localizable"];
  [v44 setPlaceholder:v46];

  v47 = [(AKInlineSignInViewController *)self passwordField];
  v48 = [v47 entryField];
  [v48 setSecureTextEntry:1];

  v49 = [(AKInlineSignInViewController *)self passwordField];
  v50 = [v49 entryField];
  [v50 setAdjustsFontSizeToFitWidth:1];

  v51 = [(AKInlineSignInViewController *)self passwordField];
  v52 = [v51 entryField];
  [v52 setAutocapitalizationType:0];

  v53 = [(AKInlineSignInViewController *)self passwordField];
  v54 = [v53 entryField];
  [v54 setAutocorrectionType:1];

  v55 = [(AKInlineSignInViewController *)self passwordField];
  v56 = [v55 entryField];
  [v56 setReturnKeyType:9];

  v57 = [(AKInlineSignInViewController *)self passwordField];
  v58 = [v57 entryField];
  [v58 setEnablesReturnKeyAutomatically:1];

  v59 = [(AKInlineSignInViewController *)self passwordField];
  v60 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__passwordFieldTapped];
  [v59 addGestureRecognizer:v60];

  v61 = [(AKInlineSignInViewController *)self passwordField];
  v62 = [v61 entryField];
  [v62 addTarget:self action:sel__passwordTextFieldDidChange_ forControlEvents:983040];

  v63 = [(AKInlineSignInViewController *)self passwordField];
  v64 = [v63 entryField];
  [v64 setDelegate:self];

  v65 = [(AKInlineSignInViewController *)self passwordField];
  v66 = [v65 entryField];
  [v66 setTextContentType:*MEMORY[0x1E4F43DD8]];

  v67 = [(AKInlineSignInViewController *)self entryDescriptionTextColor];

  if (v67)
  {
    v68 = [(AKInlineSignInViewController *)self appleIDField];
    v69 = [(AKInlineSignInViewController *)self entryDescriptionTextColor];
    [v68 setEntryDescriptionTextColor:v69];

    v70 = [(AKInlineSignInViewController *)self passwordField];
    v71 = [(AKInlineSignInViewController *)self entryDescriptionTextColor];
    [v70 setEntryDescriptionTextColor:v71];
  }
  v72 = [(AKInlineSignInViewController *)self entryFieldTextColor];

  if (v72)
  {
    v73 = [(AKInlineSignInViewController *)self appleIDField];
    v74 = [(AKInlineSignInViewController *)self entryFieldTextColor];
    [v73 setEntryFieldTextColor:v74];

    v75 = [(AKInlineSignInViewController *)self passwordField];
    v76 = [(AKInlineSignInViewController *)self entryFieldTextColor];
    [v75 setEntryFieldTextColor:v76];
  }
  BOOL v77 = [(AKInlineSignInViewController *)self shouldPromptForPasswordOnly];
  v78 = [(AKInlineSignInViewController *)self passwordField];
  objc_msgSend(v78, "setHidden:", -[AKInlineSignInViewController shouldPromptForPasswordOnly](self, "shouldPromptForPasswordOnly") ^ 1);

  v79 = [(AKInlineSignInViewController *)self appleIDField];
  [v79 setHidden:v77];

  if (v77)
  {
    v80 = [(AKInlineSignInViewController *)self passwordField];
    v81 = [v80 entryField];
    [v81 becomeFirstResponder];
  }
  v82 = [(AKInlineSignInViewController *)self context];
  [v82 _setPasswordDelegate:self];

  [(AKInlineSignInViewController *)self _updateVibrancyAndBlurInTextFields];
  v83 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v83 addObserver:self selector:sel__updateFonts_ name:*MEMORY[0x1E4F43788] object:0];

  if ([(AKBaseSignInViewController *)self _isAccountModificationRestricted])
  {
    v84 = _AKLogSystem();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v86 = 0;
      _os_log_impl(&dword_1C38C1000, v84, OS_LOG_TYPE_DEFAULT, "MCFeatureAccountModificationAllowed is restricted. Disabling UI.", v86, 2u);
    }

    v85 = [(AKInlineSignInViewController *)self iforgotButton];
    [v85 setEnabled:0];

    [(AKInlineSignInViewController *)self _setCreateButtonEnabled:0];
    [(AKInlineSignInViewController *)self _updateSignInFieldStatuses];
  }
  [(AKInlineSignInViewController *)self _updateFonts:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKInlineSignInViewController;
  [(AKInlineSignInViewController *)&v4 viewWillAppear:a3];
  [(AKInlineSignInViewController *)self _updateSignInButtonState];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_setButtonTitles
{
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v4 = &stru_1F1EE8138;
  char v5 = [v3 localizedStringForKey:@"SIGN_IN_BUTTON_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];
  primaryButtonTitle = self->_primaryButtonTitle;
  self->_primaryButtonTitle = v5;

  uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"IFORGOT_BUTTON_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];
  secondaryButtonTitle = self->_secondaryButtonTitle;
  self->_secondaryButtonTitle = v8;

  id v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = @"CREATE_APPLE_ID_BUTTON_TITLE";
  char v11 = [@"CREATE_APPLE_ID_BUTTON_TITLE" containsString:@"REBRAND"];
  if (v11)
  {
    int v12 = 0;
  }
  else
  {
    objc_super v4 = [MEMORY[0x1E4F4F020] sharedManager];
    if ([(__CFString *)v4 isAABrandingEnabled])
    {
      v10 = [@"CREATE_APPLE_ID_BUTTON_TITLE" stringByAppendingString:@"_REBRAND"];
      int v12 = 1;
    }
    else
    {
      int v12 = 0;
    }
  }
  v13 = [v15 localizedStringForKey:v10 value:&stru_1F1EE8138 table:@"Localizable"];
  tertiaryButtonTitle = self->_tertiaryButtonTitle;
  self->_tertiaryButtonTitle = v13;

  if (v12) {
  if ((v11 & 1) == 0)
  }
}

- (void)_updateSignInFieldStatuses
{
  BOOL v3 = [(AKBaseSignInViewController *)self _isSignInAllowed];
  objc_super v4 = [(AKInlineSignInViewController *)self appleIDField];
  [v4 setEnabled:v3];

  char v5 = [(AKInlineSignInViewController *)self passwordField];
  [v5 setEnabled:v3];

  id v6 = [(AKInlineSignInViewController *)self signInButton];
  [v6 setEnabled:v3];
}

- (void)_prefillAuthFields
{
  BOOL v3 = [(AKInlineSignInViewController *)self appleIDField];
  objc_super v4 = [v3 entryField];
  char v5 = [(AKInlineSignInViewController *)self context];
  id v6 = [v5 username];
  [v4 setText:v6];

  uint64_t v7 = [(AKInlineSignInViewController *)self context];
  uint64_t v8 = [v7 username];

  if (v8)
  {
    id v10 = [(AKInlineSignInViewController *)self appleIDField];
    id v9 = [(AKInlineSignInViewController *)self context];
    objc_msgSend(v10, "setEnabled:", objc_msgSend(v9, "isUsernameEditable"));
  }
}

- (void)_updateVibrancyAndBlurInTextFields
{
  BOOL v3 = [(AKInlineSignInViewController *)self fieldBackgroundColor];

  if (v3)
  {
    objc_super v4 = _AKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C38C1000, v4, OS_LOG_TYPE_DEFAULT, "AKInlineSignInViewController - background color provided", buf, 2u);
    }

    char v5 = [(AKInlineSignInViewController *)self appleIDField];
    [v5 setUsesVibrancy:0];

    id v6 = [(AKInlineSignInViewController *)self passwordField];
    [v6 setUsesVibrancy:0];

    uint64_t v7 = [(AKInlineSignInViewController *)self appleIDField];
    [v7 setBlurEffectStyle:4];

    uint64_t v8 = [(AKInlineSignInViewController *)self passwordField];
    [v8 setBlurEffectStyle:4];

    id v9 = [(AKInlineSignInViewController *)self appleIDField];
    [v9 setFieldBackgroundColor:self->_fieldBackgroundColor];

    id v10 = [(AKInlineSignInViewController *)self passwordField];
    [v10 setFieldBackgroundColor:self->_fieldBackgroundColor];
  }
  else
  {
    char v11 = [(AKInlineSignInViewController *)self appleIDField];
    [v11 setUsesVibrancy:self->_usesVibrancy];

    int v12 = [(AKInlineSignInViewController *)self passwordField];
    [v12 setUsesVibrancy:self->_usesVibrancy];

    v13 = [(AKInlineSignInViewController *)self appleIDField];
    [v13 setBlurEffectStyle:self->_blurEffectStyle];

    id v14 = [(AKInlineSignInViewController *)self passwordField];
    [v14 setBlurEffectStyle:self->_blurEffectStyle];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  char v5 = [(AKInlineSignInViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    [(AKInlineSignInViewController *)self _updateVibrancyAndBlurInTextFields];
  }
}

- (void)signInButtonWasTapped:(id)a3
{
}

- (void)iForgotButtonWasTapped:(id)a3
{
  id v4 = [(AKInlineSignInViewController *)self iforgotButton];
  char v5 = [v4 isHidden];

  if ((v5 & 1) == 0)
  {
    [(AKInlineSignInViewController *)self _beginAuthenticationIfPossibleWithOption:2];
  }
}

- (void)createAppleIDButtonWasTapped:(id)a3
{
  id v4 = [(AKInlineSignInViewController *)self createAppleIDButton];
  char v5 = [v4 isHidden];

  if ((v5 & 1) == 0)
  {
    [(AKInlineSignInViewController *)self _beginAuthenticationIfPossibleWithOption:3];
  }
}

- (void)_beginAuthenticationIfPossibleWithOption:(unint64_t)a3
{
  if (!self->_passwordRequiredCompletion)
  {
    id v17 = [(AKInlineSignInViewController *)self appleIDField];
    uint64_t v6 = [v17 entryField];
    uint64_t v7 = [v6 text];
    uint64_t v8 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v9 = [v7 stringByTrimmingCharactersInSet:v8];
    id v10 = [(AKInlineSignInViewController *)self passwordField];
    char v11 = [v10 entryField];
    int v12 = [v11 text];
    [(AKBaseSignInViewController *)self _beginAuthenticationIfPossibleWithOption:a3 withUsername:v9 password:v12];

    goto LABEL_10;
  }
  [(AKInlineSignInViewController *)self startAnimating];
  if (a3 == 2)
  {
    uint64_t v5 = -7017;
  }
  else
  {
    if (a3 != 3)
    {
      id v17 = 0;
      goto LABEL_9;
    }
    uint64_t v5 = -7016;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", v5);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  passwordRequiredCompletion = (void (**)(id, void *, id))self->_passwordRequiredCompletion;
  id v14 = [(AKInlineSignInViewController *)self passwordField];
  id v15 = [v14 entryField];
  v16 = [v15 text];
  passwordRequiredCompletion[2](passwordRequiredCompletion, v16, v17);

  uint64_t v6 = self->_passwordRequiredCompletion;
  self->_passwordRequiredCompletion = 0;
LABEL_10:
}

- (void)startAnimating
{
  if ([(AKInlineSignInViewController *)self wantsAuthenticationProgress])
  {
    BOOL v3 = [(AKInlineSignInViewController *)self spinner];
    [v3 startAnimating];

    id v4 = [(AKInlineSignInViewController *)self signInButton];
    [v4 setHidden:1];

    [(AKInlineSignInViewController *)self _setCreateButtonHidden:1];
    uint64_t v5 = [(AKInlineSignInViewController *)self iforgotButton];
    [v5 setHidden:1];
  }
  else
  {
    uint64_t v6 = [(AKInlineSignInViewController *)self signInButton];
    [v6 setEnabled:0];

    [(AKInlineSignInViewController *)self _setCreateButtonEnabled:0];
    uint64_t v5 = [(AKInlineSignInViewController *)self iforgotButton];
    [v5 setEnabled:0];
  }

  uint64_t v7 = [(AKInlineSignInViewController *)self appleIDField];
  [v7 setEnabled:0];

  id v8 = [(AKInlineSignInViewController *)self passwordField];
  [v8 setEnabled:0];
}

- (void)stopAnimating
{
  if ([(AKInlineSignInViewController *)self wantsAuthenticationProgress])
  {
    BOOL v3 = [(AKInlineSignInViewController *)self spinner];
    [v3 stopAnimating];

    id v4 = [(AKInlineSignInViewController *)self signInButton];
    objc_msgSend(v4, "setHidden:", -[AKInlineSignInViewController isPrimaryButtonHidden](self, "isPrimaryButtonHidden"));

    uint64_t v5 = [(AKInlineSignInViewController *)self iforgotButton];
    [v5 setHidden:0];

    if (self->_createAppleIDAllowed) {
      [(AKInlineSignInViewController *)self _setCreateButtonHidden:0];
    }
  }
  else
  {
    [(AKInlineSignInViewController *)self _updateSignInButtonState];
    [(AKInlineSignInViewController *)self _setCreateButtonEnabled:1];
    uint64_t v6 = [(AKInlineSignInViewController *)self iforgotButton];
    [v6 setEnabled:1];
  }
  uint64_t v7 = [(AKInlineSignInViewController *)self appleIDField];
  id v8 = [(AKInlineSignInViewController *)self context];
  objc_msgSend(v7, "setEnabled:", objc_msgSend(v8, "isUsernameEditable"));

  id v9 = [(AKInlineSignInViewController *)self passwordField];
  [v9 setEnabled:1];
}

- (void)_setPasswordFieldHidden:(BOOL)a3 animated:(BOOL)a4
{
  double v4 = 0.7;
  if (!a4) {
    double v4 = 0.0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__AKInlineSignInViewController__setPasswordFieldHidden_animated___block_invoke;
  v7[3] = &unk_1E648F0D8;
  v7[4] = self;
  BOOL v8 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__AKInlineSignInViewController__setPasswordFieldHidden_animated___block_invoke_2;
  v5[3] = &unk_1E648F5E0;
  BOOL v6 = a3;
  v5[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v7 animations:v5 completion:v4];
}

void __65__AKInlineSignInViewController__setPasswordFieldHidden_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) appleIDField];
  BOOL v3 = v2;
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 0;
  }
  [v2 setRowIdentifier:v4];

  id v5 = [*(id *)(a1 + 32) passwordField];
  [v5 setHidden:*(unsigned __int8 *)(a1 + 40)];
}

void __65__AKInlineSignInViewController__setPasswordFieldHidden_animated___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  BOOL v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = [v3 appleIDField];
    id v5 = [v4 entryField];
    [v5 becomeFirstResponder];

    id v7 = [*(id *)(a1 + 32) passwordField];
    BOOL v6 = [v7 entryField];
    [v6 setText:0];
  }
  else
  {
    id v7 = [v3 passwordField];
    BOOL v6 = [v7 entryField];
    [v6 becomeFirstResponder];
  }
}

- (void)_passwordFieldTapped
{
  id v3 = [(AKInlineSignInViewController *)self passwordField];
  int v2 = [v3 entryField];
  [v2 becomeFirstResponder];
}

- (void)_usernameFieldTapped
{
  id v3 = [(AKInlineSignInViewController *)self appleIDField];
  int v2 = [v3 entryField];
  [v2 becomeFirstResponder];
}

- (void)_updateSignInButtonState
{
  if ([(AKBaseSignInViewController *)self _isSignInAllowed])
  {
    id v3 = [(AKInlineSignInViewController *)self appleIDField];
    uint64_t v4 = [v3 entryField];
    id v5 = [v4 text];
    BOOL v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v7 = [v5 stringByTrimmingCharactersInSet:v6];
    uint64_t v8 = [v7 length];

    id v9 = [(AKInlineSignInViewController *)self passwordField];
    if ([v9 isHidden])
    {
      BOOL v10 = 1;
    }
    else
    {
      v13 = [(AKInlineSignInViewController *)self passwordField];
      id v14 = [v13 entryField];
      id v15 = [v14 text];
      BOOL v10 = [v15 length] != 0;
    }
    char v11 = [(AKInlineSignInViewController *)self signInButton];
    id v16 = v11;
    if (v8) {
      BOOL v12 = v10;
    }
    else {
      BOOL v12 = 0;
    }
  }
  else
  {
    char v11 = [(AKInlineSignInViewController *)self signInButton];
    id v16 = v11;
    BOOL v12 = 0;
  }
  [v11 setEnabled:v12];
}

- (void)_updateFonts:(id)a3
{
  id v14 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43890] addingSymbolicTraits:0 options:2];
  uint64_t v4 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v14 size:0.0];
  id v5 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438F0] addingSymbolicTraits:0 options:2];
  BOOL v6 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v5 size:0.0];
  id v7 = [(AKInlineSignInViewController *)self createAppleIDButton];
  uint64_t v8 = [v7 titleLabel];
  [v8 setFont:v4];

  id v9 = [(AKInlineSignInViewController *)self iforgotButton];
  BOOL v10 = [v9 titleLabel];
  [v10 setFont:v4];

  char v11 = [(AKInlineSignInViewController *)self signInButton];
  BOOL v12 = [v11 titleLabel];
  [v12 setFont:v6];

  v13 = [(AKInlineSignInViewController *)self view];
  [v13 setNeedsUpdateConstraints];
}

- (void)setUsesVibrancy:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  self->_usesVibrancy = a3;
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1C38C1000, v5, OS_LOG_TYPE_DEFAULT, "AKInlineSignInViewController - setUsesVibrancy %d", (uint8_t *)v6, 8u);
  }

  [(AKInlineSignInViewController *)self _updateVibrancyAndBlurInTextFields];
}

- (BOOL)usesVibrancy
{
  return self->_usesVibrancy;
}

- (void)setBlurEffectStyle:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  self->_blurEffectStyle = a3;
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [NSNumber numberWithInteger:a3];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1C38C1000, v5, OS_LOG_TYPE_DEFAULT, "AKInlineSignInViewController - setBlurEffectStyle %@", (uint8_t *)&v7, 0xCu);
  }
  [(AKInlineSignInViewController *)self _updateVibrancyAndBlurInTextFields];
}

- (int64_t)blurEffectStyle
{
  return self->_blurEffectStyle;
}

- (void)setFieldBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_fieldBackgroundColor, a3);

  [(AKInlineSignInViewController *)self _updateVibrancyAndBlurInTextFields];
}

- (id)_userFriendlyUsername:(id)a3
{
  id v3 = a3;
  if ([v3 containsString:@"@"])
  {
    id v4 = v3;
  }
  else
  {
    id v5 = objc_opt_new();
    id v4 = [v5 displayFormatFor:v3];
  }

  return v4;
}

- (void)context:(id)a3 needsPasswordWithCompletion:(id)a4
{
  id v5 = (void *)MEMORY[0x1C8777520](a4, a2, a3);
  id passwordRequiredCompletion = self->_passwordRequiredCompletion;
  self->_id passwordRequiredCompletion = v5;

  [(AKInlineSignInViewController *)self stopAnimating];

  [(AKInlineSignInViewController *)self _setPasswordFieldHidden:0 animated:1];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id v5 = [(AKInlineSignInViewController *)self appleIDField];
  BOOL v6 = [v5 entryField];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = [(AKInlineSignInViewController *)self appleIDField];
    uint64_t v9 = [v8 entryField];
    BOOL v10 = [v9 text];

    char v11 = [(AKInlineSignInViewController *)self _userFriendlyUsername:v10];
    BOOL v12 = [(AKInlineSignInViewController *)self appleIDField];
    v13 = [v12 entryField];
    [v13 setText:v11];

    id v14 = [(AKInlineSignInViewController *)self appleIDField];
    uint64_t v15 = [v14 entryField];
    [(id)v15 resignFirstResponder];

    id v16 = [(AKInlineSignInViewController *)self passwordField];
    LOBYTE(v15) = [v16 isHidden];

    if (v15)
    {
      dispatch_time_t v17 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__AKInlineSignInViewController_textFieldShouldReturn___block_invoke;
      block[3] = &unk_1E648EF28;
      block[4] = self;
      dispatch_after(v17, MEMORY[0x1E4F14428], block);
    }
    else
    {
      v24 = [(AKInlineSignInViewController *)self passwordField];
      v25 = [v24 entryField];
      [v25 becomeFirstResponder];
    }
    goto LABEL_9;
  }
  v18 = [(AKInlineSignInViewController *)self passwordField];
  v19 = [v18 entryField];
  int v20 = [v4 isEqual:v19];

  if (!v20)
  {
LABEL_12:
    BOOL v26 = 1;
    goto LABEL_13;
  }
  v21 = [(AKInlineSignInViewController *)self appleIDField];
  v22 = [v21 entryField];
  v23 = [v22 text];
  if ([v23 length])
  {

LABEL_11:
    dispatch_time_t v29 = dispatch_time(0, 500000000);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __54__AKInlineSignInViewController_textFieldShouldReturn___block_invoke_2;
    v35[3] = &unk_1E648EF28;
    v35[4] = self;
    dispatch_after(v29, MEMORY[0x1E4F14428], v35);
    goto LABEL_12;
  }
  v27 = [(AKInlineSignInViewController *)self appleIDField];
  char v28 = [v27 isHidden];

  if (v28) {
    goto LABEL_11;
  }
  v31 = [(AKInlineSignInViewController *)self passwordField];
  v32 = [v31 entryField];
  [v32 resignFirstResponder];

  v33 = [(AKInlineSignInViewController *)self appleIDField];
  v34 = [v33 entryField];
  [v34 becomeFirstResponder];

LABEL_9:
  BOOL v26 = 0;
LABEL_13:

  return v26;
}

void __54__AKInlineSignInViewController_textFieldShouldReturn___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 signInButton];
  [v1 signInButtonWasTapped:v2];
}

void __54__AKInlineSignInViewController_textFieldShouldReturn___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 signInButton];
  [v1 signInButtonWasTapped:v2];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  char v11 = [(AKInlineSignInViewController *)self appleIDField];
  BOOL v12 = [v11 entryField];
  if (([v9 isEqual:v12] & 1) == 0) {
    goto LABEL_4;
  }
  v13 = [(AKInlineSignInViewController *)self passwordField];
  if ([v13 isHidden])
  {

LABEL_4:
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v15 = [v9 text];
  int v16 = [v15 isEqualToString:v10];
  BOOL v17 = (location | length) != 0;

  if (!v16 && v17)
  {
    [(AKInlineSignInViewController *)self _setPasswordFieldHidden:1 animated:0];
    id passwordRequiredCompletion = (void (**)(id, void, void *))self->_passwordRequiredCompletion;
    if (passwordRequiredCompletion)
    {
      v19 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7003);
      passwordRequiredCompletion[2](passwordRequiredCompletion, 0, v19);

      char v11 = self->_passwordRequiredCompletion;
      self->_id passwordRequiredCompletion = 0;
      goto LABEL_5;
    }
  }
LABEL_6:

  return 1;
}

- (BOOL)wantsAuthenticationProgress
{
  return self->_wantsAuthenticationProgress;
}

- (void)setWantsAuthenticationProgress:(BOOL)a3
{
  self->_wantsAuthenticationProgress = a3;
}

- (NSString)primaryButtonTitle
{
  return self->_primaryButtonTitle;
}

- (UIColor)fieldBackgroundColor
{
  return self->_fieldBackgroundColor;
}

- (UIColor)entryDescriptionTextColor
{
  return self->_entryDescriptionTextColor;
}

- (void)setEntryDescriptionTextColor:(id)a3
{
}

- (UIColor)entryFieldTextColor
{
  return self->_entryFieldTextColor;
}

- (void)setEntryFieldTextColor:(id)a3
{
}

- (BOOL)isPrimaryButtonHidden
{
  return self->_primaryButtonHidden;
}

- (void)setPrimaryButtonHidden:(BOOL)a3
{
  self->_primaryButtonHidden = a3;
}

- (BOOL)shouldPromptForPasswordOnly
{
  return self->_shouldPromptForPasswordOnly;
}

- (void)setShouldPromptForPasswordOnly:(BOOL)a3
{
  self->_shouldPromptForPasswordOnly = a3;
}

- (UIView)loginFieldsContainer
{
  return self->_loginFieldsContainer;
}

- (void)setLoginFieldsContainer:(id)a3
{
}

- (AKTextField)appleIDField
{
  return self->_appleIDField;
}

- (void)setAppleIDField:(id)a3
{
}

- (AKTextField)passwordField
{
  return self->_passwordField;
}

- (void)setPasswordField:(id)a3
{
}

- (UIButton)signInButton
{
  return self->_signInButton;
}

- (void)setSignInButton:(id)a3
{
}

- (UIButton)iforgotButton
{
  return self->_iforgotButton;
}

- (void)setIforgotButton:(id)a3
{
}

- (UIButton)createAppleIDButton
{
  return self->_createAppleIDButton;
}

- (void)setCreateAppleIDButton:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_createAppleIDButton, 0);
  objc_storeStrong((id *)&self->_iforgotButton, 0);
  objc_storeStrong((id *)&self->_signInButton, 0);
  objc_storeStrong((id *)&self->_passwordField, 0);
  objc_storeStrong((id *)&self->_appleIDField, 0);
  objc_storeStrong((id *)&self->_loginFieldsContainer, 0);
  objc_storeStrong((id *)&self->_entryFieldTextColor, 0);
  objc_storeStrong((id *)&self->_entryDescriptionTextColor, 0);
  objc_storeStrong((id *)&self->_fieldBackgroundColor, 0);
  objc_storeStrong((id *)&self->_primaryButtonTitle, 0);
  objc_storeStrong(&self->_passwordRequiredCompletion, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_tertiaryButtonTitle, 0);

  objc_storeStrong((id *)&self->_secondaryButtonTitle, 0);
}

- (void)setUsesDarkMode:(BOOL)a3
{
  if (self->_usesDarkMode != a3)
  {
    self->_usesDarkMode = a3;
    self->_usesVibrancy = a3;
    if (a3) {
      int64_t v3 = 2;
    }
    else {
      int64_t v3 = 1;
    }
    self->_blurEffectStyle = v3;
    [(AKInlineSignInViewController *)self _updateVibrancyAndBlurInTextFields];
  }
}

- (BOOL)usesDarkMode
{
  return self->_usesDarkMode;
}

@end