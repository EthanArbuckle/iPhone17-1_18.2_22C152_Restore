@interface AKBasicLoginOptionsViewController
- (AKAppleIDAuthenticationInAppContext)context;
- (AKBasicLoginOptionsViewController)initWithContext:(id)a3;
- (BOOL)_shouldHideCreateButton;
- (BOOL)isCreateAppleIDAllowed;
- (OBPrivacyLinkController)privacyController;
- (UIButton)createButton;
- (UIButton)forgotButton;
- (UIStackView)stackView;
- (id)_createLinkButtonWithSelector:(SEL)a3;
- (id)createIDAction;
- (id)forgotAction;
- (void)_configureButtonForFontAdjustment:(id)a3;
- (void)_refreshCreateAppleIDButton;
- (void)_setupPrivacyLinkControllerWithContext:(id)a3;
- (void)_setupStackView;
- (void)createPressed:(id)a3;
- (void)forgotPressed:(id)a3;
- (void)setContext:(id)a3;
- (void)setCreateButton:(id)a3;
- (void)setCreateIDAction:(id)a3;
- (void)setForgotAction:(id)a3;
- (void)setForgotButton:(id)a3;
- (void)setIsCreateAppleIDAllowed:(BOOL)a3;
- (void)setPrivacyController:(id)a3;
- (void)setStackView:(id)a3;
- (void)viewDidLoad;
@end

@implementation AKBasicLoginOptionsViewController

- (AKBasicLoginOptionsViewController)initWithContext:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AKBasicLoginOptionsViewController;
  v5 = [(AKBasicLoginOptionsViewController *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_context, v4);
    objc_initWeak(&location, v6);
    v7 = dispatch_get_global_queue(33, 0);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__AKBasicLoginOptionsViewController_initWithContext___block_invoke;
    v9[3] = &unk_1E648F498;
    objc_copyWeak(&v10, &location);
    dispatch_async(v7, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __53__AKBasicLoginOptionsViewController_initWithContext___block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__AKBasicLoginOptionsViewController_initWithContext___block_invoke_2;
  v3[3] = &unk_1E648F470;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  [v2 isCreateAppleIDAllowedWithCompletion:v3];
  objc_destroyWeak(&v4);
}

void __53__AKBasicLoginOptionsViewController_initWithContext___block_invoke_2(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__AKBasicLoginOptionsViewController_initWithContext___block_invoke_3;
  v3[3] = &unk_1E648F448;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
}

void __53__AKBasicLoginOptionsViewController_initWithContext___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsCreateAppleIDAllowed:*(unsigned __int8 *)(a1 + 40)];
  [WeakRetained _refreshCreateAppleIDButton];
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)AKBasicLoginOptionsViewController;
  [(AKBasicLoginOptionsViewController *)&v20 viewDidLoad];
  v3 = [(AKBasicLoginOptionsViewController *)self context];
  [(AKBasicLoginOptionsViewController *)self _refreshCreateAppleIDButton];
  id v4 = [(AKBasicLoginOptionsViewController *)self _createLinkButtonWithSelector:sel_forgotPressed_];
  [(AKBasicLoginOptionsViewController *)self setForgotButton:v4];

  char v5 = [(AKBasicLoginOptionsViewController *)self _createLinkButtonWithSelector:sel_createPressed_];
  [(AKBasicLoginOptionsViewController *)self setCreateButton:v5];

  [(AKBasicLoginOptionsViewController *)self _setupStackView];
  v6 = [(AKBasicLoginOptionsViewController *)self forgotButton];
  [(AKBasicLoginOptionsViewController *)self _configureButtonForFontAdjustment:v6];

  v7 = [(AKBasicLoginOptionsViewController *)self createButton];
  [(AKBasicLoginOptionsViewController *)self _configureButtonForFontAdjustment:v7];

  v8 = [(AKBasicLoginOptionsViewController *)self forgotButton];
  int v9 = [v3 isUsernameEditable];
  id v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  v11 = v10;
  if (v9) {
    objc_super v12 = @"IFORGOT_BUTTON_TITLE";
  }
  else {
    objc_super v12 = @"FORGOT_PASSWORD";
  }
  v13 = [v10 localizedStringForKey:v12 value:&stru_1F1EE8138 table:@"Localizable"];
  [v8 setTitle:v13 forState:0];

  v14 = [(AKBasicLoginOptionsViewController *)self createButton];
  v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  v16 = @"CREATE_APPLE_ID_BUTTON_TITLE";
  char v17 = [@"CREATE_APPLE_ID_BUTTON_TITLE" containsString:@"REBRAND"];
  if (v17)
  {
    int v18 = 0;
  }
  else
  {
    v11 = [MEMORY[0x1E4F4F020] sharedManager];
    if ([v11 isAABrandingEnabled])
    {
      v16 = [@"CREATE_APPLE_ID_BUTTON_TITLE" stringByAppendingString:@"_REBRAND"];
      int v18 = 1;
    }
    else
    {
      int v18 = 0;
    }
  }
  v19 = [v15 localizedStringForKey:v16 value:&stru_1F1EE8138 table:@"Localizable"];
  [v14 setTitle:v19 forState:0];

  if (v18) {
  if ((v17 & 1) == 0)
  }

  [(AKBasicLoginOptionsViewController *)self _setupPrivacyLinkControllerWithContext:v3];
  [(AKBasicLoginOptionsViewController *)self setView:self->_stackView];
}

- (void)_setupStackView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42E20]);
  id v4 = (UIStackView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  stackView = self->_stackView;
  self->_stackView = v4;

  [(UIStackView *)self->_stackView setAlignment:3];
  [(UIStackView *)self->_stackView setAxis:1];
  [(UIStackView *)self->_stackView setDistribution:0];
  [(UIStackView *)self->_stackView setLayoutMarginsRelativeArrangement:1];
  [(UIStackView *)self->_stackView setSpacing:7.0];
  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = self->_stackView;
  v7 = [(AKBasicLoginOptionsViewController *)self forgotButton];
  [(UIStackView *)v6 addArrangedSubview:v7];

  v8 = self->_stackView;
  id v9 = [(AKBasicLoginOptionsViewController *)self createButton];
  [(UIStackView *)v8 addArrangedSubview:v9];
}

- (void)_setupPrivacyLinkControllerWithContext:(id)a3
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 privacyBundleIdentifier];

  if (v5)
  {
    v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[AKBasicLoginOptionsViewController _setupPrivacyLinkControllerWithContext:](v6);
    }

    v7 = (void *)MEMORY[0x1E4F83AD0];
    v8 = [v4 privacyBundleIdentifier];
    id v9 = [v7 linkWithBundleIdentifier:v8];
    [(AKBasicLoginOptionsViewController *)self setPrivacyController:v9];

    id v10 = [(AKBasicLoginOptionsViewController *)self privacyController];
    [(AKBasicLoginOptionsViewController *)self addChildViewController:v10];

    v11 = [(UIStackView *)self->_stackView arrangedSubviews];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      v13 = [(UIStackView *)self->_stackView arrangedSubviews];
      v14 = [(UIStackView *)self->_stackView arrangedSubviews];
      v15 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v14, "count") - 1);

      stackView = self->_stackView;
      char v17 = [(AKBasicLoginOptionsViewController *)self privacyController];
      int v18 = [v17 view];
      [(UIStackView *)stackView addArrangedSubview:v18];

      if (v15) {
        [(UIStackView *)self->_stackView setCustomSpacing:v15 afterView:20.0];
      }
    }
    v19 = [(AKBasicLoginOptionsViewController *)self privacyController];
    [v19 didMoveToParentViewController:self];

    objc_super v20 = [(AKBasicLoginOptionsViewController *)self privacyController];
    v21 = [v20 view];
    v22 = [v21 leadingAnchor];
    v23 = [(UIStackView *)self->_stackView leadingAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];

    v25 = [(AKBasicLoginOptionsViewController *)self privacyController];
    v26 = [v25 view];
    v27 = [v26 trailingAnchor];
    v28 = [(UIStackView *)self->_stackView trailingAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];

    v30 = (void *)MEMORY[0x1E4F28DC8];
    v32[0] = v24;
    v32[1] = v29;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    [v30 activateConstraints:v31];
  }
}

- (void)forgotPressed:(id)a3
{
  id v4 = [(AKBasicLoginOptionsViewController *)self forgotAction];

  if (v4)
  {
    char v5 = [(AKBasicLoginOptionsViewController *)self forgotAction];
    v5[2]();
  }
}

- (void)createPressed:(id)a3
{
  id v4 = [(AKBasicLoginOptionsViewController *)self createIDAction];

  if (v4)
  {
    char v5 = [(AKBasicLoginOptionsViewController *)self createIDAction];
    v5[2]();
  }
}

- (void)_configureButtonForFontAdjustment:(id)a3
{
  v25[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 titleLabel];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v24 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43870] addingSymbolicTraits:0x8000 options:0];
  char v5 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v24 size:0.0];
  [v4 setFont:v5];

  [v4 setNumberOfLines:0];
  [v4 setAdjustsFontForContentSizeCategory:1];
  [v4 setLineBreakMode:0];
  [v4 setTextAlignment:1];
  v19 = (void *)MEMORY[0x1E4F28DC8];
  v23 = [v4 leadingAnchor];
  v22 = [v3 leadingAnchor];
  [v3 contentEdgeInsets];
  v21 = [v23 constraintGreaterThanOrEqualToAnchor:v22 constant:v6];
  v25[0] = v21;
  objc_super v20 = [v4 trailingAnchor];
  v7 = [v3 trailingAnchor];
  [v3 contentEdgeInsets];
  id v9 = [v20 constraintGreaterThanOrEqualToAnchor:v7 constant:v8];
  v25[1] = v9;
  id v10 = [v4 topAnchor];
  v11 = [v3 topAnchor];
  [v3 contentEdgeInsets];
  uint64_t v12 = objc_msgSend(v10, "constraintGreaterThanOrEqualToAnchor:constant:", v11);
  v25[2] = v12;
  v13 = [v4 bottomAnchor];
  v14 = [v3 bottomAnchor];
  [v3 contentEdgeInsets];
  double v16 = v15;

  char v17 = [v13 constraintGreaterThanOrEqualToAnchor:v14 constant:v16];
  v25[3] = v17;
  int v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
  [v19 activateConstraints:v18];
}

- (void)_refreshCreateAppleIDButton
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = @"NO";
  if (a1) {
    v2 = @"YES";
  }
  int v3 = 138412290;
  id v4 = v2;
  _os_log_debug_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_DEBUG, "Create button hidden - %@", (uint8_t *)&v3, 0xCu);
}

- (BOOL)_shouldHideCreateButton
{
  int v3 = [(AKBasicLoginOptionsViewController *)self context];
  if ([v3 shouldAllowAppleIDCreation]) {
    BOOL v4 = ![(AKBasicLoginOptionsViewController *)self isCreateAppleIDAllowed];
  }
  else {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (id)_createLinkButtonWithSelector:(SEL)a3
{
  uint64_t v5 = [MEMORY[0x1E4F427E0] buttonWithType:1];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 addTarget:self action:a3 forControlEvents:64];

  return v5;
}

- (id)createIDAction
{
  return self->_createIDAction;
}

- (void)setCreateIDAction:(id)a3
{
}

- (id)forgotAction
{
  return self->_forgotAction;
}

- (void)setForgotAction:(id)a3
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

- (UIButton)forgotButton
{
  return self->_forgotButton;
}

- (void)setForgotButton:(id)a3
{
}

- (UIButton)createButton
{
  return self->_createButton;
}

- (void)setCreateButton:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (OBPrivacyLinkController)privacyController
{
  return self->_privacyController;
}

- (void)setPrivacyController:(id)a3
{
}

- (BOOL)isCreateAppleIDAllowed
{
  return self->_isCreateAppleIDAllowed;
}

- (void)setIsCreateAppleIDAllowed:(BOOL)a3
{
  self->_isCreateAppleIDAllowed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_createButton, 0);
  objc_storeStrong((id *)&self->_forgotButton, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong(&self->_forgotAction, 0);

  objc_storeStrong(&self->_createIDAction, 0);
}

- (void)_setupPrivacyLinkControllerWithContext:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C38C1000, log, OS_LOG_TYPE_DEBUG, "Showing On Boarding Privacy link...", v1, 2u);
}

@end