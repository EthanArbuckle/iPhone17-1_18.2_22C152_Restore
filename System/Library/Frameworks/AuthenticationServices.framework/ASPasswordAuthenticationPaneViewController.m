@interface ASPasswordAuthenticationPaneViewController
- (ASPasswordAuthenticationPaneViewController)initWithPersona:(unint64_t)a3 presentationContext:(id)a4;
- (ASPasswordAuthenticationPaneViewControllerDelegate)authenticationDelegate;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)textFieldShouldReturn:(id)a3;
- (double)_containerViewHorizontalMargin;
- (double)_intrinsicContentHeight;
- (double)_secureTextFieldInsetMargin;
- (double)_signInButtonInsetMargin;
- (double)_topViewMargin;
- (id)_manualPasswordEntryTitleLabelText;
- (id)_secureTextFieldPlaceholderText;
- (id)_securityKeyTitleLabelText;
- (id)_subtitleLabelFont;
- (id)_titleLabelFont;
- (id)_titleLabelText;
- (id)_titleLabelTextColor;
- (void)_completeManualPasswordCredentialEntry;
- (void)_createViews;
- (void)_keyboardHeightDidChange;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_setConstraints;
- (void)_setUpAndAddIconImage;
- (void)_setUpSubtitleLabel;
- (void)_setUpUsernameLabel;
- (void)_signInButtonTapped;
- (void)_textFieldChanged:(id)a3;
- (void)setAuthenticationDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ASPasswordAuthenticationPaneViewController

- (ASPasswordAuthenticationPaneViewController)initWithPersona:(unint64_t)a3 presentationContext:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASPasswordAuthenticationPaneViewController;
  v8 = [(ASCredentialRequestPaneViewController *)&v12 initRequiringTableView:0];
  v9 = v8;
  if (v8)
  {
    v8->_persona = a3;
    objc_storeStrong((id *)&v8->_presentationContext, a4);
    v10 = v9;
  }

  return v9;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)ASPasswordAuthenticationPaneViewController;
  [(ASCredentialRequestPaneViewController *)&v5 viewDidLoad];
  [(ASPasswordAuthenticationPaneViewController *)self _createViews];
  [(ASPasswordAuthenticationPaneViewController *)self _setConstraints];
  [(ASCredentialRequestPaneViewController *)self sizeToFitPaneContent];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__keyboardWillShow_ name:*MEMORY[0x263F83808] object:0];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__keyboardWillHide_ name:*MEMORY[0x263F83800] object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASPasswordAuthenticationPaneViewController;
  [(ASPasswordAuthenticationPaneViewController *)&v5 viewDidDisappear:a3];
  if (self->_didForceSoftwareKeyboardOn)
  {
    self->_didForceSoftwareKeyboardOn = 0;
    v4 = [MEMORY[0x263F828B0] activeInstance];
    [v4 hardwareKeyboardAvailabilityChanged];
  }
}

- (void)_createViews
{
  v3 = [MEMORY[0x263F825C8] clearColor];
  v4 = [(ASPasswordAuthenticationPaneViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc(MEMORY[0x263F828E0]);
  double v6 = *MEMORY[0x263F001A8];
  double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
  id obj = (id)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], v7, v8, v9);
  [obj setNumberOfLines:0];
  [obj setTextAlignment:1];
  v10 = [(ASPasswordAuthenticationPaneViewController *)self _titleLabelText];
  [obj setText:v10];

  LODWORD(v11) = 1148846080;
  [obj setContentCompressionResistancePriority:1 forAxis:v11];
  [obj setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v12 = [(ASPasswordAuthenticationPaneViewController *)self _titleLabelFont];
  [obj setFont:v12];

  v13 = [(ASPasswordAuthenticationPaneViewController *)self _titleLabelTextColor];
  [obj setTextColor:v13];

  p_titleLabel = &self->_titleLabel;
  objc_storeStrong((id *)&self->_titleLabel, obj);
  unint64_t persona = self->_persona;
  if (persona == 1)
  {
    [(ASPasswordAuthenticationPaneViewController *)self _setUpUsernameLabel];
  }
  else if (!persona)
  {
    [(ASPasswordAuthenticationPaneViewController *)self _setUpSubtitleLabel];
  }
  v16 = -[_ASInsetTextField initWithFrame:]([_ASInsetTextField alloc], "initWithFrame:", v6, v7, v8, v9);
  [(_ASInsetTextField *)v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  v17 = [MEMORY[0x263F825C8] colorWithRed:0.0156862745 green:0.0156862745 blue:0.0588235294 alpha:0.15];
  [(_ASInsetTextField *)v16 setBackgroundColor:v17];

  v18 = [(_ASInsetTextField *)v16 layer];
  [v18 setCornerRadius:8.0];

  v19 = [(ASPasswordAuthenticationPaneViewController *)self _secureTextFieldPlaceholderText];
  [(_ASInsetTextField *)v16 setPlaceholder:v19];

  [(_ASInsetTextField *)v16 setSecureTextEntry:1];
  [(_ASInsetTextField *)v16 setReturnKeyType:9];
  [(_ASInsetTextField *)v16 setEnablesReturnKeyAutomatically:1];
  [(_ASInsetTextField *)v16 setTextContentType:*MEMORY[0x263F83A70]];
  [(_ASInsetTextField *)v16 setDelegate:self];
  v20 = +[ASViewServiceInterfaceUtilities headerMessageFont];
  [(_ASInsetTextField *)v16 setFont:v20];

  if (self->_persona == 1) {
    [(_ASInsetTextField *)v16 addTarget:self action:sel__textFieldChanged_ forControlEvents:0x20000];
  }
  p_secureTextField = &self->_secureTextField;
  objc_storeStrong((id *)&self->_secureTextField, v16);
  v22 = -[ASCredentialRequestButtonContinue initWithFrame:]([ASCredentialRequestButtonContinue alloc], "initWithFrame:", v6, v7, v8, v9);
  [(ASCredentialRequestButtonContinue *)v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ASCredentialRequestButton *)v22 addTarget:self action:sel__signInButtonTapped];
  unint64_t v24 = self->_persona;
  if (v24 == 1)
  {
    v26 = _WBSLocalizedString();
    [(ASCredentialRequestButton *)v22 setButtonText:v26];

    [(ASCredentialRequestButtonContinue *)v22 setEnabled:0];
  }
  else if (!v24)
  {
    v25 = _WBSLocalizedString();
    [(ASCredentialRequestButton *)v22 setButtonText:v25];
  }
  LODWORD(v23) = 1148846080;
  [(ASCredentialRequestButtonContinue *)v22 setContentCompressionResistancePriority:0 forAxis:v23];
  p_signInButton = &self->_signInButton;
  objc_storeStrong((id *)&self->_signInButton, v22);
  v28 = [(ASCredentialRequestPaneViewController *)self paneHeaderStackView];
  v29 = [(ASCredentialRequestPaneViewController *)self headerPaneContext];
  [(ASPasswordAuthenticationPaneViewController *)self _topViewMargin];
  objc_msgSend(v29, "addEmptyViewWithSpacing:");

  [(ASPasswordAuthenticationPaneViewController *)self _setUpAndAddIconImage];
  [v28 addArrangedSubview:*p_titleLabel];
  unint64_t v30 = self->_persona;
  if (v30)
  {
    if (v30 != 1) {
      goto LABEL_16;
    }
    double v31 = 8.0;
    v32 = &OBJC_IVAR___ASPasswordAuthenticationPaneViewController__usernameField;
    double v33 = 19.0;
  }
  else
  {
    double v31 = 19.0;
    v32 = &OBJC_IVAR___ASPasswordAuthenticationPaneViewController__subtitleLabel;
    double v33 = 10.0;
  }
  [v28 setCustomSpacing:*p_titleLabel afterView:v33];
  uint64_t v34 = *v32;
  [v28 addArrangedSubview:*(Class *)((char *)&self->super.super.super.super.isa + v34)];
  [v28 setCustomSpacing:*(Class *)((char *)&self->super.super.super.super.isa + v34) afterView:v31];
LABEL_16:
  [v28 addArrangedSubview:*p_secureTextField];
  [v28 setCustomSpacing:*p_secureTextField afterView:30.0];
  [v28 addArrangedSubview:*p_signInButton];
  [v28 setCustomSpacing:*p_signInButton afterView:32.0];
  v35 = [(ASCredentialRequestPaneViewController *)self headerPaneContext];
  [v35 addEmptyViewWithSpacing:0.0];
}

- (void)_setConstraints
{
  v43[5] = *MEMORY[0x263EF8340];
  v3 = [(ASCredentialRequestPaneViewController *)self paneHeaderStackView];
  [(ASPasswordAuthenticationPaneViewController *)self _containerViewHorizontalMargin];
  double v5 = v4;
  double v6 = [(ASPasswordAuthenticationPaneViewController *)self view];
  double v7 = [v6 bottomAnchor];
  double v8 = [(ASCredentialRequestPaneViewController *)self paneHeaderStackView];
  double v9 = [v8 superview];
  v10 = [v9 bottomAnchor];
  double v11 = [v7 constraintGreaterThanOrEqualToAnchor:v10];
  paneHeaderStackViewBottomKeyboardConstraint = self->_paneHeaderStackViewBottomKeyboardConstraint;
  self->_paneHeaderStackViewBottomKeyboardConstraint = v11;

  LODWORD(v13) = 1144766464;
  [(NSLayoutConstraint *)self->_paneHeaderStackViewBottomKeyboardConstraint setPriority:v13];
  v37 = (void *)MEMORY[0x263F08938];
  v40 = [(UILabel *)self->_titleLabel widthAnchor];
  v39 = [v3 widthAnchor];
  double v14 = v5 * -2.0;
  v38 = [v40 constraintEqualToAnchor:v39 constant:v14];
  v43[0] = v38;
  v15 = [(UITextField *)self->_secureTextField widthAnchor];
  v36 = v3;
  v16 = [v3 widthAnchor];
  [(ASPasswordAuthenticationPaneViewController *)self _secureTextFieldInsetMargin];
  v18 = [v15 constraintEqualToAnchor:v16 constant:v17 * -2.0];
  v43[1] = v18;
  v19 = [(UITextField *)self->_secureTextField heightAnchor];
  v20 = [v19 constraintGreaterThanOrEqualToConstant:32.0];
  v43[2] = v20;
  v21 = [(ASCredentialRequestButtonContinue *)self->_signInButton heightAnchor];
  v22 = [v21 constraintEqualToConstant:36.0];
  double v23 = self->_paneHeaderStackViewBottomKeyboardConstraint;
  v43[3] = v22;
  v43[4] = v23;
  unint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:5];
  [v37 activateConstraints:v24];

  unint64_t persona = self->_persona;
  if (!persona)
  {
    v35 = (void *)MEMORY[0x263F08938];
    v28 = [(UILabel *)self->_subtitleLabel widthAnchor];
    v26 = v36;
    v29 = [v36 widthAnchor];
    double v31 = [v28 constraintEqualToAnchor:v29 constant:v14];
    v41 = v31;
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:1];
    [v35 activateConstraints:v32];
    goto LABEL_5;
  }
  v26 = v36;
  if (persona == 1)
  {
    v27 = (void *)MEMORY[0x263F08938];
    v28 = [(UITextField *)self->_usernameField widthAnchor];
    v29 = [v36 widthAnchor];
    [(ASPasswordAuthenticationPaneViewController *)self _secureTextFieldInsetMargin];
    double v31 = [v28 constraintEqualToAnchor:v29 constant:v30 * -2.0];
    v42[0] = v31;
    v32 = [(UITextField *)self->_usernameField heightAnchor];
    double v33 = [v32 constraintGreaterThanOrEqualToConstant:32.0];
    v42[1] = v33;
    uint64_t v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:2];
    [v27 activateConstraints:v34];

LABEL_5:
  }
}

- (void)_setUpAndAddIconImage
{
  if (self->_persona)
  {
    v3 = +[ASCredentialRequestIconGenerator headerIconForPresentationContext:self->_presentationContext];
    if (!v3) {
      goto LABEL_9;
    }
    id v10 = v3;
    double v4 = [[ASCredentialRequestImageSubPane alloc] initWithImage:v3];
  }
  else
  {
    if ([(ASCAuthorizationPresentationContext *)self->_presentationContext useAlternativeSecurityKeysIcon])
    {
      uint64_t v5 = +[ASCredentialRequestIconGenerator alternativeSecurityKeysIcon];
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v5 = +[ASCredentialRequestIconGenerator systemSecurityKeysIcon];
      uint64_t v6 = 2;
    }
    id v10 = (id)v5;
    double v4 = [[ASCredentialRequestImageSubPane alloc] initWithImage:v5 imageStyle:v6];
    double v7 = [(ASCredentialRequestSubPane *)v4 view];
    LODWORD(v8) = 1148846080;
    [v7 setContentCompressionResistancePriority:1 forAxis:v8];
  }
  double v9 = [(ASCredentialRequestPaneViewController *)self headerPaneContext];
  [v9 addSubPane:v4 withCustomSpacingAfter:10.0];

  v3 = v10;
LABEL_9:
}

- (void)_setUpSubtitleLabel
{
  _WBSLocalizedString();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = objc_alloc(MEMORY[0x263F828E0]);
  double v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(UILabel *)v4 setNumberOfLines:0];
  [(UILabel *)v4 setTextAlignment:1];
  [(UILabel *)v4 setText:v9];
  LODWORD(v5) = 1148846080;
  [(UILabel *)v4 setContentCompressionResistancePriority:1 forAxis:v5];
  [(UILabel *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v6 = [(ASPasswordAuthenticationPaneViewController *)self _subtitleLabelFont];
  [(UILabel *)v4 setFont:v6];

  double v7 = [MEMORY[0x263F825C8] labelColor];
  [(UILabel *)v4 setTextColor:v7];

  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v4;
}

- (void)_setUpUsernameLabel
{
  id v3 = [_ASInsetTextField alloc];
  double v4 = -[_ASInsetTextField initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(UITextField *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v5 = [MEMORY[0x263F825C8] colorWithRed:0.0156862745 green:0.0156862745 blue:0.0588235294 alpha:0.15];
  [(UITextField *)v4 setBackgroundColor:v5];

  uint64_t v6 = [MEMORY[0x263F82760] defaultFontForTextStyle:*MEMORY[0x263F835E8]];
  [(UITextField *)v4 setFont:v6];

  double v7 = [(UITextField *)v4 layer];
  [v7 setCornerRadius:8.0];

  double v8 = _WBSLocalizedString();
  [(UITextField *)v4 setPlaceholder:v8];

  [(UITextField *)v4 setReturnKeyType:4];
  [(UITextField *)v4 setEnablesReturnKeyAutomatically:1];
  [(UITextField *)v4 setTextContentType:*MEMORY[0x263F83AA8]];
  [(UITextField *)v4 setDelegate:self];
  [(UITextField *)v4 addTarget:self action:sel__textFieldChanged_ forControlEvents:0x20000];
  usernameField = self->_usernameField;
  self->_usernameField = v4;
}

- (id)_titleLabelText
{
  id v3 = [(ASCAuthorizationPresentationContext *)self->_presentationContext overrideTitle];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    double v5 = [(ASCAuthorizationPresentationContext *)self->_presentationContext overrideTitle];
  }
  else
  {
    unint64_t persona = self->_persona;
    if (persona == 1)
    {
      double v5 = [(ASPasswordAuthenticationPaneViewController *)self _manualPasswordEntryTitleLabelText];
    }
    else if (!persona)
    {
      double v5 = [(ASPasswordAuthenticationPaneViewController *)self _securityKeyTitleLabelText];
    }
  }

  return v5;
}

- (id)_securityKeyTitleLabelText
{
  return +[ASCredentialRequestSecurityKeyStringUtilities titleWithPresentationContext:self->_presentationContext];
}

- (id)_manualPasswordEntryTitleLabelText
{
  id v3 = [(ASCAuthorizationPresentationContext *)self->_presentationContext proxiedOriginDeviceName];

  uint64_t v4 = NSString;
  _WBSLocalizedString();
  if (v3) {
    double v5 = {;
  }
    uint64_t v6 = [(ASCAuthorizationPresentationContext *)self->_presentationContext serviceName];
    double v7 = [(ASCAuthorizationPresentationContext *)self->_presentationContext proxiedOriginDeviceName];
    double v8 = objc_msgSend(v4, "stringWithFormat:", v5, v6, v7);
  }
  else {
    double v5 = {;
  }
    uint64_t v6 = [(ASCAuthorizationPresentationContext *)self->_presentationContext serviceName];
    double v8 = objc_msgSend(v4, "stringWithFormat:", v5, v6);
  }

  return v8;
}

- (id)_secureTextFieldPlaceholderText
{
  if (self->_persona <= 1)
  {
    _WBSLocalizedString();
    self = (ASPasswordAuthenticationPaneViewController *)objc_claimAutoreleasedReturnValue();
  }

  return self;
}

- (double)_topViewMargin
{
  return 10.0;
}

- (double)_containerViewHorizontalMargin
{
  int v2 = [MEMORY[0x263F29440] isPad];
  double result = 32.0;
  if (v2) {
    return 128.0;
  }
  return result;
}

- (double)_signInButtonInsetMargin
{
  [(ASPasswordAuthenticationPaneViewController *)self _containerViewHorizontalMargin];
  return v2 + 90.0;
}

- (double)_secureTextFieldInsetMargin
{
  [(ASPasswordAuthenticationPaneViewController *)self _containerViewHorizontalMargin];
  return v2 + 13.0;
}

- (id)_titleLabelFont
{
  unint64_t persona = self->_persona;
  if (persona == 1)
  {
    self = +[ASViewServiceInterfaceUtilities headerTitleFont];
  }
  else if (!persona)
  {
    self = [MEMORY[0x263F82760] _preferredFontForTextStyle:*MEMORY[0x263F83618] weight:*MEMORY[0x263F83630]];
  }

  return self;
}

- (id)_titleLabelTextColor
{
  unint64_t persona = self->_persona;
  if (persona == 1)
  {
    self = +[ASViewServiceInterfaceUtilities headerTitleColor];
  }
  else if (!persona)
  {
    self = [MEMORY[0x263F825C8] labelColor];
  }

  return self;
}

- (id)_subtitleLabelFont
{
  return (id)[MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
}

- (void)_signInButtonTapped
{
  if (self->_persona == 1)
  {
    [(ASPasswordAuthenticationPaneViewController *)self _completeManualPasswordCredentialEntry];
  }
  else
  {
    id v4 = [(UITextField *)self->_secureTextField text];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_authenticationDelegate);
    [WeakRetained passwordAuthenticationViewController:self completedWithUserEnteredPIN:v4];
  }
}

- (double)_intrinsicContentHeight
{
  id v3 = [(ASCredentialRequestPaneViewController *)self paneHeaderStackView];
  [v3 bounds];
  CGFloat Width = CGRectGetWidth(v10);
  LODWORD(v5) = 1148846080;
  LODWORD(v6) = 1112014848;
  objc_msgSend(v3, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, 0.0, v5, v6);
  double v8 = v7 + 0.0 + self->_keyboardHeight;

  return v8;
}

- (void)_textFieldChanged:(id)a3
{
  id v5 = [(UITextField *)self->_secureTextField text];
  if ([v5 length])
  {
    id v4 = [(UITextField *)self->_usernameField text];
    -[ASCredentialRequestButtonContinue setEnabled:](self->_signInButton, "setEnabled:", [v4 length] != 0);
  }
  else
  {
    [(ASCredentialRequestButtonContinue *)self->_signInButton setEnabled:0];
  }
}

- (void)_completeManualPasswordCredentialEntry
{
  [(UITextField *)self->_usernameField setEnabled:0];
  [(UITextField *)self->_secureTextField setEnabled:0];
  id v3 = [(ASCAuthorizationPresentationContext *)self->_presentationContext proxiedAssociatedDomains];
  uint64_t v4 = [v3 firstObject];
  id v5 = (void *)v4;
  double v6 = &stru_26CA92B70;
  if (v4) {
    double v6 = (__CFString *)v4;
  }
  double v7 = v6;

  id v8 = objc_alloc(MEMORY[0x263F293E0]);
  id v9 = [(UITextField *)self->_usernameField text];
  CGRect v10 = [(UITextField *)self->_secureTextField text];
  double v11 = [MEMORY[0x263EFF910] now];
  id v13 = (id)[v8 initWithUser:v9 password:v10 site:v7 creationDate:v11 externalProviderBundleIdentifier:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_authenticationDelegate);
  [WeakRetained passwordAuthenticationViewController:self completedWithManuallyEnteredPasswordCredential:v13];
}

- (void)_keyboardWillShow:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F837B8]];

  [v5 CGRectValue];
  self->_keyboardHeight = CGRectGetHeight(v7);
  [(ASPasswordAuthenticationPaneViewController *)self _keyboardHeightDidChange];
}

- (void)_keyboardWillHide:(id)a3
{
  self->_keyboardHeight = 0.0;
  [(ASPasswordAuthenticationPaneViewController *)self _keyboardHeightDidChange];
}

- (void)_keyboardHeightDidChange
{
  [(NSLayoutConstraint *)self->_paneHeaderStackViewBottomKeyboardConstraint setConstant:self->_keyboardHeight];

  [(ASCredentialRequestPaneViewController *)self sizeToFitPaneContent];
}

- (BOOL)becomeFirstResponder
{
  unint64_t persona = self->_persona;
  if (persona == 1)
  {
    usernameField = self->_usernameField;
    return [(UITextField *)usernameField becomeFirstResponder];
  }
  else
  {
    if (!persona)
    {
      if ([(UITextField *)self->_secureTextField becomeFirstResponder])
      {
        char v2 = 1;
        if ((UIKeyboardAutomaticIsOnScreen() & 1) == 0)
        {
          self->_didForceSoftwareKeyboardOn = 1;
          id v5 = [MEMORY[0x263F828B0] activeInstance];
          [v5 ejectKeyDown];
        }
      }
      else
      {
        char v2 = 0;
      }
    }
    return v2 & 1;
  }
}

- (BOOL)resignFirstResponder
{
  unsigned __int8 v2 = 48;
  unint64_t persona = self->_persona;
  if (persona == 1)
  {
    v6.receiver = self;
    v6.super_class = (Class)ASPasswordAuthenticationPaneViewController;
    unsigned __int8 v2 = [(ASPasswordAuthenticationPaneViewController *)&v6 resignFirstResponder];
    return v2 & 1;
  }
  if (persona) {
    return v2 & 1;
  }
  secureTextField = self->_secureTextField;

  return [(UITextField *)secureTextField resignFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
  unint64_t persona = self->_persona;
  if (!persona)
  {
    id v3 = &OBJC_IVAR___ASPasswordAuthenticationPaneViewController__secureTextField;
    return [*(id *)((char *)&self->super.super.super.super.isa + *v3) canBecomeFirstResponder];
  }
  if (persona == 1)
  {
    id v3 = &OBJC_IVAR___ASPasswordAuthenticationPaneViewController__usernameField;
    return [*(id *)((char *)&self->super.super.super.super.isa + *v3) canBecomeFirstResponder];
  }
  return 0;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  if (self->_usernameField == a3) {
    [(UITextField *)self->_secureTextField becomeFirstResponder];
  }
  else {
    [(ASPasswordAuthenticationPaneViewController *)self _signInButtonTapped];
  }
  return 0;
}

- (ASPasswordAuthenticationPaneViewControllerDelegate)authenticationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_authenticationDelegate);

  return (ASPasswordAuthenticationPaneViewControllerDelegate *)WeakRetained;
}

- (void)setAuthenticationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_authenticationDelegate);
  objc_storeStrong((id *)&self->_paneHeaderStackViewBottomKeyboardConstraint, 0);
  objc_storeStrong((id *)&self->_signInButton, 0);
  objc_storeStrong((id *)&self->_secureTextField, 0);
  objc_storeStrong((id *)&self->_usernameField, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_presentationContext, 0);
}

@end