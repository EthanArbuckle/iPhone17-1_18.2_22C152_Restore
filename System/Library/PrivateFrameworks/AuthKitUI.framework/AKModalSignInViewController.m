@interface AKModalSignInViewController
- (AKModalSignInViewController)init;
- (AKRoundedButton)signInButton;
- (BOOL)_isSignInAllowed;
- (BOOL)_isUsingPasscodeAuth;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)hideTitle;
- (BOOL)resignFirstResponder;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSString)customBodyText;
- (NSString)customButtonTitle;
- (UIButton)iForgotButton;
- (UIColor)backgroundColor;
- (UILabel)bodyLabel;
- (UILabel)titleLabel;
- (UITextField)passwordField;
- (UIView)containerView;
- (id)_bodyText;
- (id)_buttonTitle;
- (void)_beginObservingTextFieldDidChangeNotifications;
- (void)_createViews;
- (void)_endObservingTextFieldDidChangeNotifications;
- (void)_passwordRecoveryButtonWasTapped:(id)a3;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)_signInButtonTapped:(id)a3;
- (void)_textFieldDidChange:(id)a3;
- (void)_updateSignInButtonEnabled:(BOOL)a3;
- (void)_updateViewConstraints;
- (void)context:(id)a3 needsPasswordWithCompletion:(id)a4;
- (void)dealloc;
- (void)displayAlertForContext:(id)a3 error:(id)a4 completion:(id)a5;
- (void)setBackgroundColor:(id)a3;
- (void)setBodyLabel:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setCustomBodyText:(id)a3;
- (void)setCustomButtonTitle:(id)a3;
- (void)setHideTitle:(BOOL)a3;
- (void)setIForgotButton:(id)a3;
- (void)setPasswordField:(id)a3;
- (void)setSignInButton:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)startAnimating;
- (void)stopAnimating;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AKModalSignInViewController

- (AKModalSignInViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)AKModalSignInViewController;
  return (AKModalSignInViewController *)[(AKBaseSignInViewController *)&v3 _initWithAuthController:0];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)AKModalSignInViewController;
  [(AKModalSignInViewController *)&v4 viewDidLoad];
  [(AKModalSignInViewController *)self _setupViews];
  [(AKModalSignInViewController *)self _setupConstraints];
  objc_super v3 = [(AKBaseSignInViewController *)self context];
  [v3 setAlertDelegate:self];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKModalSignInViewController;
  [(AKBaseSignInViewController *)&v5 viewDidAppear:a3];
  if (![(AKModalSignInViewController *)self _shouldHidePasswordField])
  {
    objc_super v4 = [(AKModalSignInViewController *)self passwordField];
    [v4 becomeFirstResponder];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKModalSignInViewController;
  [(AKModalSignInViewController *)&v4 viewWillAppear:a3];
  [(AKModalSignInViewController *)self _beginObservingTextFieldDidChangeNotifications];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKModalSignInViewController;
  [(AKModalSignInViewController *)&v5 viewWillDisappear:a3];
  if (![(AKModalSignInViewController *)self _shouldHidePasswordField])
  {
    objc_super v4 = [(AKModalSignInViewController *)self passwordField];
    [v4 resignFirstResponder];
  }
  [(AKModalSignInViewController *)self _endObservingTextFieldDidChangeNotifications];
}

- (void)dealloc
{
  [(AKModalSignInViewController *)self _endObservingTextFieldDidChangeNotifications];
  v3.receiver = self;
  v3.super_class = (Class)AKModalSignInViewController;
  [(AKBaseSignInViewController *)&v3 dealloc];
}

- (void)_setupViews
{
  [(AKModalSignInViewController *)self _createViews];
  objc_super v3 = [(AKModalSignInViewController *)self containerView];
  objc_super v4 = [(AKModalSignInViewController *)self titleLabel];
  [v3 addSubview:v4];

  objc_super v5 = [(AKModalSignInViewController *)self containerView];
  v6 = [(AKModalSignInViewController *)self bodyLabel];
  [v5 addSubview:v6];

  v7 = [(AKModalSignInViewController *)self containerView];
  v8 = [(AKModalSignInViewController *)self passwordField];
  [v7 addSubview:v8];

  v9 = [(AKModalSignInViewController *)self containerView];
  v10 = [(AKModalSignInViewController *)self signInButton];
  [v9 addSubview:v10];

  v11 = [(AKModalSignInViewController *)self containerView];
  v12 = [(AKModalSignInViewController *)self iForgotButton];
  [v11 addSubview:v12];

  id v14 = [(AKModalSignInViewController *)self view];
  v13 = [(AKModalSignInViewController *)self containerView];
  [v14 addSubview:v13];
}

- (void)_createViews
{
  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    objc_super v4 = [(AKModalSignInViewController *)self view];
    [v4 setBackgroundColor:backgroundColor];
  }
  else
  {
    objc_super v4 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    objc_super v5 = [(AKModalSignInViewController *)self view];
    [v5 setBackgroundColor:v4];
  }
  id v6 = objc_alloc(MEMORY[0x1E4F42B38]);
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
  [(AKModalSignInViewController *)self setTitleLabel:v11];

  v12 = [(AKModalSignInViewController *)self titleLabel];
  [v12 setNumberOfLines:0];

  v13 = [(AKModalSignInViewController *)self titleLabel];
  [v13 setTextAlignment:1];

  id v14 = [(AKBaseSignInViewController *)self context];
  [v14 serviceType];
  v15 = AKSignInStringFromServiceType();
  v16 = [(AKModalSignInViewController *)self titleLabel];
  [v16 setText:v15];

  id v68 = [MEMORY[0x1E4F42A38] defaultFontDescriptorWithTextStyle:*MEMORY[0x1E4F43870] addingSymbolicTraits:32770 options:0];
  v17 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v68 size:0.0];
  v18 = [(AKModalSignInViewController *)self titleLabel];
  [v18 setFont:v17];

  BOOL hideTitle = self->_hideTitle;
  v20 = [(AKModalSignInViewController *)self titleLabel];
  [v20 setHidden:hideTitle];

  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v7, v8, v9, v10);
  [(AKModalSignInViewController *)self setBodyLabel:v21];

  v22 = [(AKModalSignInViewController *)self bodyLabel];
  [v22 setNumberOfLines:0];

  v23 = [(AKModalSignInViewController *)self bodyLabel];
  [v23 setTextAlignment:1];

  uint64_t v24 = *MEMORY[0x1E4F438C0];
  v25 = [MEMORY[0x1E4F42A30] defaultFontForTextStyle:*MEMORY[0x1E4F438C0]];
  v26 = [(AKModalSignInViewController *)self bodyLabel];
  [v26 setFont:v25];

  v27 = [(AKModalSignInViewController *)self bodyLabel];
  [v27 setAdjustsFontForContentSizeCategory:1];

  v28 = [(AKModalSignInViewController *)self _bodyText];
  v29 = [(AKModalSignInViewController *)self bodyLabel];
  [v29 setText:v28];

  v30 = -[_AKInsetTextField initWithFrame:]([_AKInsetTextField alloc], "initWithFrame:", v7, v8, v9, v10);
  [(AKModalSignInViewController *)self setPasswordField:v30];

  v31 = [MEMORY[0x1E4F428B8] colorWithRed:0.0156862754 green:0.0156862754 blue:0.0588235296 alpha:0.150000006];
  v32 = [(AKModalSignInViewController *)self passwordField];
  [v32 setBackgroundColor:v31];

  v33 = [(AKModalSignInViewController *)self passwordField];
  [v33 setDelegate:self];

  v34 = [MEMORY[0x1E4F42A30] defaultFontForTextStyle:v24];
  v35 = [(AKModalSignInViewController *)self passwordField];
  [v35 setFont:v34];

  v36 = [(AKModalSignInViewController *)self passwordField];
  v37 = [v36 layer];
  [v37 setCornerRadius:12.0];

  v38 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v39 = [v38 localizedStringForKey:@"CAPITALIZED_PASSWORD" value:&stru_1F1EE8138 table:@"Localizable"];
  v40 = [(AKModalSignInViewController *)self passwordField];
  [v40 setPlaceholder:v39];

  v41 = [(AKModalSignInViewController *)self passwordField];
  [v41 setSecureTextEntry:1];

  v42 = [(AKModalSignInViewController *)self passwordField];
  [v42 setReturnKeyType:0];

  uint64_t v43 = *MEMORY[0x1E4F43DD8];
  v44 = [(AKModalSignInViewController *)self passwordField];
  [v44 setTextContentType:v43];

  BOOL v45 = [(AKModalSignInViewController *)self _shouldHidePasswordField];
  v46 = [(AKModalSignInViewController *)self passwordField];
  [v46 setHidden:v45];

  v47 = +[AKRoundedButton roundedButton];
  [(AKModalSignInViewController *)self setSignInButton:v47];

  v48 = [(AKModalSignInViewController *)self signInButton];
  [v48 addTarget:self action:sel__signInButtonTapped_ forControlEvents:64];

  v49 = [(AKModalSignInViewController *)self signInButton];
  v50 = [(AKModalSignInViewController *)self _buttonTitle];
  [v49 setTitle:v50 forState:0];

  v51 = [(AKModalSignInViewController *)self signInButton];
  [v51 setEnabled:0];

  v52 = [(AKModalSignInViewController *)self signInButton];
  v53 = (void *)MEMORY[0x1E4F42A80];
  v54 = [MEMORY[0x1E4F428B8] systemBlueColor];
  v55 = objc_msgSend(v53, "ak_imageWithColor:", v54);
  [v52 setBackgroundImage:v55 forState:0];

  v56 = [(AKModalSignInViewController *)self signInButton];
  v57 = (void *)MEMORY[0x1E4F42A80];
  v58 = [MEMORY[0x1E4F428B8] systemGrayColor];
  v59 = objc_msgSend(v57, "ak_imageWithColor:", v58);
  [v56 setBackgroundImage:v59 forState:2];

  v60 = [MEMORY[0x1E4F427E0] buttonWithType:1];
  [(AKModalSignInViewController *)self setIForgotButton:v60];

  v61 = [(AKModalSignInViewController *)self iForgotButton];
  [v61 addTarget:self action:sel__passwordRecoveryButtonWasTapped_ forControlEvents:64];

  v62 = [(AKModalSignInViewController *)self iForgotButton];
  v63 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v64 = [v63 localizedStringForKey:@"FORGOT_PASSWORD" value:&stru_1F1EE8138 table:@"Localizable"];
  [v62 setTitle:v64 forState:0];

  BOOL v65 = [(AKModalSignInViewController *)self _shouldHidePasswordField];
  v66 = [(AKModalSignInViewController *)self iForgotButton];
  [v66 setHidden:v65];

  v67 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v7, v8, v9, v10);
  [(AKModalSignInViewController *)self setContainerView:v67];
}

- (void)_beginObservingTextFieldDidChangeNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__textFieldDidChange_ name:*MEMORY[0x1E4F43E28] object:0];
}

- (void)_endObservingTextFieldDidChangeNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43E28] object:0];
}

- (void)_textFieldDidChange:(id)a3
{
  id v9 = [a3 object];
  id v4 = [(AKModalSignInViewController *)self passwordField];

  objc_super v5 = v9;
  if (v9 == v4)
  {
    id v6 = [(AKModalSignInViewController *)self passwordField];
    double v7 = [v6 text];
    BOOL v8 = [v7 length] != 0;

    [(AKModalSignInViewController *)self _updateSignInButtonEnabled:v8];
    objc_super v5 = v9;
  }
}

- (void)_updateSignInButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(AKModalSignInViewController *)self signInButton];
  int v6 = [v5 isEnabled];

  if (v6 != v3)
  {
    id v7 = [(AKModalSignInViewController *)self signInButton];
    [v7 setEnabled:v3];
  }
}

- (id)_bodyText
{
  customBodyText = self->_customBodyText;
  if (customBodyText)
  {
    id v4 = customBodyText;
  }
  else
  {
    objc_super v5 = [(AKBaseSignInViewController *)self context];
    id v4 = [v5 _interpolatedReason];
  }
  if (![(NSString *)v4 length])
  {
    int v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C38C1000, v6, OS_LOG_TYPE_DEFAULT, "Context interpolated reason was not providing, falling back to default strings...", buf, 2u);
    }

    id v7 = [MEMORY[0x1E4F4F010] currentDevice];
    int v8 = [v7 isMultiUserMode];

    if (v8)
    {
      id v9 = [(AKBaseSignInViewController *)self context];
      [v9 serviceType];
      uint64_t v10 = AKSharedDevicePasscodePromptAlertMessageWithServiceType();
    }
    else
    {
      if (![(AKModalSignInViewController *)self _isUsingPasscodeAuth])
      {
        v12 = NSString;
        id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v13 = [v9 localizedStringForKey:@"DEFAULT_PLACEHOLDER_AUTHENTICATION_REASON" value:&stru_1F1EE8138 table:@"Localizable"];
        id v14 = (void *)MEMORY[0x1E4F4F0E0];
        v15 = [(AKBaseSignInViewController *)self context];
        v16 = [v15 username];
        v17 = [v14 formattedUsernameFromUsername:v16];
        uint64_t v11 = objc_msgSend(v12, "stringWithFormat:", v13, v17);

        id v4 = (NSString *)v13;
        goto LABEL_13;
      }
      id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v10 = [v9 localizedStringForKey:@"PASSCODE_AUTHENTICATION_REASON" value:&stru_1F1EE8138 table:@"Localizable"];
    }
    uint64_t v11 = v10;
LABEL_13:

    id v4 = (NSString *)v11;
  }

  return v4;
}

- (id)_buttonTitle
{
  if ([(AKModalSignInViewController *)self _isUsingPasscodeAuth])
  {
    BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v4 = v3;
    objc_super v5 = @"CONTINUE_WITH_PASSCODE";
  }
  else
  {
    customButtonTitle = self->_customButtonTitle;
    if (customButtonTitle)
    {
      id v7 = customButtonTitle;
      goto LABEL_7;
    }
    BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v4 = v3;
    objc_super v5 = @"SIGN_IN";
  }
  id v7 = [v3 localizedStringForKey:v5 value:&stru_1F1EE8138 table:@"Localizable"];

LABEL_7:

  return v7;
}

- (void)_setupConstraints
{
  v137[13] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(AKModalSignInViewController *)self titleLabel];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = [(AKModalSignInViewController *)self bodyLabel];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v5 = [(AKModalSignInViewController *)self passwordField];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  int v6 = [(AKModalSignInViewController *)self signInButton];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v7 = [(AKModalSignInViewController *)self iForgotButton];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  int v8 = [(AKModalSignInViewController *)self containerView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v9 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v12 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v13 = [(AKModalSignInViewController *)self containerView];
    id v14 = [(AKModalSignInViewController *)self view];
    uint64_t v15 = [v12 constraintWithItem:v13 attribute:10 relatedBy:0 toItem:v14 attribute:10 multiplier:1.0 constant:0.0];
  }
  else
  {
    uint64_t v13 = [(AKModalSignInViewController *)self containerView];
    id v14 = [v13 topAnchor];
    v16 = [(AKModalSignInViewController *)self view];
    v17 = [v16 topAnchor];
    uint64_t v15 = [v14 constraintGreaterThanOrEqualToAnchor:v17 constant:0.0];
  }
  v133 = (void *)v15;
  [v9 addObject:v15];
  v131 = [(AKModalSignInViewController *)self containerView];
  v18 = [v131 leadingAnchor];
  v127 = v18;
  v129 = [(AKModalSignInViewController *)self view];
  uint64_t v19 = [v129 leadingAnchor];
  v123 = (void *)v19;
  v125 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v125 userInterfaceIdiom] == 1) {
    double v20 = 128.0;
  }
  else {
    double v20 = 32.0;
  }
  v121 = [v18 constraintEqualToAnchor:v19 constant:v20];
  v137[0] = v121;
  v119 = [(AKModalSignInViewController *)self containerView];
  v21 = [v119 trailingAnchor];
  v115 = v21;
  v117 = [(AKModalSignInViewController *)self view];
  uint64_t v22 = [v117 trailingAnchor];
  v111 = (void *)v22;
  v113 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v113 userInterfaceIdiom] == 1) {
    double v23 = 128.0;
  }
  else {
    double v23 = 32.0;
  }
  v109 = [v21 constraintEqualToAnchor:v22 constant:-v23];
  v137[1] = v109;
  v107 = [(AKModalSignInViewController *)self titleLabel];
  v103 = [v107 firstBaselineAnchor];
  v105 = [(AKModalSignInViewController *)self containerView];
  v101 = [v105 topAnchor];
  v99 = [v103 constraintEqualToAnchor:v101 constant:39.0];
  v137[2] = v99;
  v97 = [(AKModalSignInViewController *)self titleLabel];
  v93 = [v97 leadingAnchor];
  v95 = [(AKModalSignInViewController *)self containerView];
  v91 = [v95 leadingAnchor];
  v89 = [v93 constraintEqualToAnchor:v91];
  v137[3] = v89;
  v87 = [(AKModalSignInViewController *)self titleLabel];
  v83 = [v87 trailingAnchor];
  v85 = [(AKModalSignInViewController *)self containerView];
  v81 = [v85 trailingAnchor];
  v79 = [v83 constraintEqualToAnchor:v81];
  v137[4] = v79;
  v77 = [(AKModalSignInViewController *)self titleLabel];
  v75 = [v77 heightAnchor];
  v74 = [v75 constraintGreaterThanOrEqualToConstant:17.0];
  v137[5] = v74;
  v73 = [(AKModalSignInViewController *)self bodyLabel];
  v71 = [v73 firstBaselineAnchor];
  v72 = [(AKModalSignInViewController *)self titleLabel];
  v70 = [v72 lastBaselineAnchor];
  v69 = [v71 constraintEqualToAnchor:v70 constant:24.0];
  v137[6] = v69;
  id v68 = [(AKModalSignInViewController *)self bodyLabel];
  v66 = [v68 leadingAnchor];
  v67 = [(AKModalSignInViewController *)self containerView];
  BOOL v65 = [v67 leadingAnchor];
  v64 = [v66 constraintEqualToAnchor:v65];
  v137[7] = v64;
  v63 = [(AKModalSignInViewController *)self bodyLabel];
  v61 = [v63 trailingAnchor];
  v62 = [(AKModalSignInViewController *)self containerView];
  v60 = [v62 trailingAnchor];
  v59 = [v61 constraintEqualToAnchor:v60];
  v137[8] = v59;
  v58 = [(AKModalSignInViewController *)self bodyLabel];
  v57 = [v58 heightAnchor];
  v56 = [v57 constraintGreaterThanOrEqualToConstant:56.0];
  v137[9] = v56;
  v55 = [(AKModalSignInViewController *)self signInButton];
  v53 = [v55 centerXAnchor];
  v54 = [(AKModalSignInViewController *)self containerView];
  v52 = [v54 centerXAnchor];
  uint64_t v24 = [v53 constraintEqualToAnchor:v52];
  v137[10] = v24;
  v25 = [(AKModalSignInViewController *)self signInButton];
  v26 = [v25 heightAnchor];
  v27 = [v26 constraintGreaterThanOrEqualToConstant:44.0];
  v137[11] = v27;
  v28 = [(AKModalSignInViewController *)self containerView];
  v29 = [v28 heightAnchor];
  v30 = [v29 constraintGreaterThanOrEqualToConstant:220.0];
  v137[12] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v137 count:13];
  v134 = v9;
  [v9 addObjectsFromArray:v31];

  if ([(AKModalSignInViewController *)self _shouldHidePasswordField])
  {
    v32 = [(AKModalSignInViewController *)self signInButton];
    v33 = [v32 topAnchor];
    v34 = [(AKModalSignInViewController *)self bodyLabel];
    v35 = [v34 lastBaselineAnchor];
    v36 = [v33 constraintEqualToAnchor:v35 constant:20.0];
    v136[0] = v36;
    v37 = [(AKModalSignInViewController *)self containerView];
    v38 = [v37 bottomAnchor];
    v39 = [(AKModalSignInViewController *)self view];
    v40 = [v39 bottomAnchor];
    v132 = [v38 constraintEqualToAnchor:v40 constant:-20.0];
    v136[1] = v132;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v136 count:2];
    v130 = v41 = v134;
    objc_msgSend(v134, "addObjectsFromArray:");
  }
  else
  {
    v126 = [(AKModalSignInViewController *)self passwordField];
    v118 = [v126 topAnchor];
    v110 = [(AKModalSignInViewController *)self bodyLabel];
    uint64_t v112 = [v110 lastBaselineAnchor];
    uint64_t v120 = [v118 constraintEqualToAnchor:v112 constant:20.0];
    v135[0] = v120;
    v108 = [(AKModalSignInViewController *)self passwordField];
    v98 = [v108 leadingAnchor];
    v102 = [(AKModalSignInViewController *)self containerView];
    uint64_t v94 = [v102 leadingAnchor];
    v132 = [v98 constraintEqualToAnchor:v94 constant:20.0];
    v135[1] = v132;
    v130 = [(AKModalSignInViewController *)self passwordField];
    v124 = [v130 trailingAnchor];
    v128 = [(AKModalSignInViewController *)self containerView];
    v122 = [v128 trailingAnchor];
    v116 = [v124 constraintEqualToAnchor:v122 constant:-20.0];
    v135[2] = v116;
    v114 = [(AKModalSignInViewController *)self passwordField];
    v106 = [v114 heightAnchor];
    v104 = [v106 constraintEqualToConstant:44.0];
    v135[3] = v104;
    v100 = [(AKModalSignInViewController *)self signInButton];
    v92 = [v100 topAnchor];
    v96 = [(AKModalSignInViewController *)self passwordField];
    v90 = [v96 bottomAnchor];
    v88 = [v92 constraintEqualToAnchor:v90 constant:20.0];
    v135[4] = v88;
    v86 = [(AKModalSignInViewController *)self iForgotButton];
    v82 = [v86 topAnchor];
    v84 = [(AKModalSignInViewController *)self signInButton];
    v80 = [v84 bottomAnchor];
    v78 = [v82 constraintEqualToAnchor:v80 constant:16.0];
    v135[5] = v78;
    v76 = [(AKModalSignInViewController *)self iForgotButton];
    v42 = [v76 centerXAnchor];
    uint64_t v43 = [(AKModalSignInViewController *)self containerView];
    v44 = [v43 centerXAnchor];
    BOOL v45 = [v42 constraintEqualToAnchor:v44];
    v135[6] = v45;
    v46 = [(AKModalSignInViewController *)self iForgotButton];
    v47 = [v46 bottomAnchor];
    v48 = [(AKModalSignInViewController *)self containerView];
    v49 = [v48 bottomAnchor];
    v50 = [v47 constraintEqualToAnchor:v49 constant:-17.0];
    v135[7] = v50;
    v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v135 count:8];
    [v134 addObjectsFromArray:v51];

    v40 = (void *)v94;
    v34 = v110;

    v38 = v98;
    v39 = v102;

    v35 = (void *)v112;
    v37 = v108;

    v32 = v126;
    v33 = v118;

    v36 = (void *)v120;
    v41 = v134;
  }

  [MEMORY[0x1E4F28DC8] activateConstraints:v41];
}

- (void)_updateViewConstraints
{
  v11.receiver = self;
  v11.super_class = (Class)AKModalSignInViewController;
  [(AKModalSignInViewController *)&v11 updateViewConstraints];
  BOOL v3 = [(AKModalSignInViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  int v6 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];
  double v8 = 256.0;
  if (v7 != 1) {
    double v8 = 24.0;
  }
  double v9 = v5 - v8;
  uint64_t v10 = [(AKModalSignInViewController *)self bodyLabel];
  [v10 setPreferredMaxLayoutWidth:v9];
}

- (BOOL)_isUsingPasscodeAuth
{
  BOOL v3 = [MEMORY[0x1E4F4F020] sharedManager];
  if ([v3 isChildPasscodeEnabled])
  {
    double v4 = [(AKBaseSignInViewController *)self context];
    char v5 = [v4 isContextEligibleForPasscodeAuth];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)_passwordRecoveryButtonWasTapped:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  double v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = [(AKBaseSignInViewController *)self context];
    int v6 = [v5 username];
    int v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1C38C1000, v4, OS_LOG_TYPE_DEFAULT, "Will take user to password-reset flow for %@...", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v7 = [(AKBaseSignInViewController *)self context];
  double v8 = [v7 username];
  double v9 = [(AKModalSignInViewController *)self passwordField];
  uint64_t v10 = [v9 text];
  [(AKBaseSignInViewController *)self _beginAuthenticationIfPossibleWithOption:2 withUsername:v8 password:v10];
}

- (void)_signInButtonTapped:(id)a3
{
  if ([(AKModalSignInViewController *)self _isUsingPasscodeAuth])
  {
    id v10 = [(AKBaseSignInViewController *)self context];
    double v4 = [v10 username];
    [(AKBaseSignInViewController *)self _beginAuthenticationIfPossibleWithOption:1 withUsername:v4 password:0];
  }
  else
  {
    char v5 = [(AKModalSignInViewController *)self passwordField];
    int v6 = [v5 text];
    uint64_t v7 = [v6 length];

    if (!v7) {
      return;
    }
    id v10 = [(AKBaseSignInViewController *)self context];
    double v4 = [v10 username];
    double v8 = [(AKModalSignInViewController *)self passwordField];
    double v9 = [v8 text];
    [(AKBaseSignInViewController *)self _beginAuthenticationIfPossibleWithOption:1 withUsername:v4 password:v9];
  }
}

- (void)startAnimating
{
  v8.receiver = self;
  v8.super_class = (Class)AKModalSignInViewController;
  [(AKBaseSignInViewController *)&v8 startAnimating];
  BOOL v3 = [(AKModalSignInViewController *)self signInButton];
  double v4 = [MEMORY[0x1E4F428B8] systemGrayColor];
  [v3 setBackgroundColor:v4];

  char v5 = [(AKModalSignInViewController *)self signInButton];
  [v5 setEnabled:0];

  int v6 = [(AKModalSignInViewController *)self passwordField];
  id v7 = (id)objc_msgSend(v6, "ak_addActivityIndicator");
}

- (void)stopAnimating
{
  v6.receiver = self;
  v6.super_class = (Class)AKModalSignInViewController;
  [(AKBaseSignInViewController *)&v6 stopAnimating];
  BOOL v3 = [(AKModalSignInViewController *)self signInButton];
  double v4 = [MEMORY[0x1E4F428B8] systemBlueColor];
  [v3 setBackgroundColor:v4];

  char v5 = [(AKModalSignInViewController *)self passwordField];
  objc_msgSend(v5, "ak_clearActivityIndicatorIfExist");
}

- (BOOL)_isSignInAllowed
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)AKModalSignInViewController;
  id v7 = a4;
  -[AKModalSignInViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__AKModalSignInViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E648F230;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __82__AKModalSignInViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setNeedsUpdateConstraints];
}

- (BOOL)becomeFirstResponder
{
  v2 = [(AKModalSignInViewController *)self passwordField];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (BOOL)resignFirstResponder
{
  v2 = [(AKModalSignInViewController *)self passwordField];
  char v3 = [v2 resignFirstResponder];

  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  v2 = [(AKModalSignInViewController *)self passwordField];
  char v3 = [v2 canBecomeFirstResponder];

  return v3;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id v5 = [(AKModalSignInViewController *)self passwordField];
  if (v5 != v4) {
    goto LABEL_4;
  }
  objc_super v6 = [v4 text];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    id v5 = [(AKBaseSignInViewController *)self context];
    objc_super v8 = [v5 username];
    objc_super v9 = [(AKModalSignInViewController *)self passwordField];
    id v10 = [v9 text];
    [(AKBaseSignInViewController *)self _beginAuthenticationIfPossibleWithOption:1 withUsername:v8 password:v10];

LABEL_4:
  }

  return 1;
}

- (void)displayAlertForContext:(id)a3 error:(id)a4 completion:(id)a5
{
  id v15 = a4;
  id v7 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  objc_super v8 = [(AKModalSignInViewController *)self passwordField];
  objc_super v9 = [v8 layer];

  id v10 = objc_msgSend(MEMORY[0x1E4F39B30], "ak_jiggleAnimation");
  [v9 addAnimation:v10 forKey:@"ak_jiggleAnimation"];

  if ([v15 code] == -7006)
  {
    int v11 = [v15 domain];
    int v12 = [v11 isEqualToString:*MEMORY[0x1E4F4ED70]];

    if (v12)
    {
      uint64_t v13 = [(AKModalSignInViewController *)self passwordField];
      [v13 setText:0];

      id v14 = [(AKModalSignInViewController *)self signInButton];
      [v14 setEnabled:0];
    }
  }
  if (v7) {
    (*((void (**)(id, void, void, void, id))v7 + 2))(v7, 0, 0, 0, v15);
  }
}

- (void)context:(id)a3 needsPasswordWithCompletion:(id)a4
{
  id v6 = a4;
  id v8 = [(AKModalSignInViewController *)self passwordField];
  id v7 = [v8 text];
  (*((void (**)(id, void *, void))a4 + 2))(v6, v7, 0);
}

- (BOOL)hideTitle
{
  return self->_hideTitle;
}

- (void)setHideTitle:(BOOL)a3
{
  self->_BOOL hideTitle = a3;
}

- (NSString)customBodyText
{
  return self->_customBodyText;
}

- (void)setCustomBodyText:(id)a3
{
}

- (NSString)customButtonTitle
{
  return self->_customButtonTitle;
}

- (void)setCustomButtonTitle:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
}

- (UITextField)passwordField
{
  return self->_passwordField;
}

- (void)setPasswordField:(id)a3
{
}

- (AKRoundedButton)signInButton
{
  return self->_signInButton;
}

- (void)setSignInButton:(id)a3
{
}

- (UIButton)iForgotButton
{
  return self->_iForgotButton;
}

- (void)setIForgotButton:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_iForgotButton, 0);
  objc_storeStrong((id *)&self->_signInButton, 0);
  objc_storeStrong((id *)&self->_passwordField, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_customButtonTitle, 0);

  objc_storeStrong((id *)&self->_customBodyText, 0);
}

@end