@interface ASCredentialRequestCABLEClientViewController
- (ASCredentialRequestCABLEClientViewController)initWithPresentationContext:(id)a3 loginChoice:(id)a4 activity:(id)a5;
- (double)_marginBelowQRCode;
- (double)_marginBelowSecurityKeyButton;
- (id)_qrCodeMessage;
- (id)_titleText;
- (void)_addBelowQRCodeSpacerView;
- (void)_setUpQRCodeView;
- (void)_setUpSecurityKeyButtonViewIfNeeded;
- (void)_setUpTitleView;
- (void)_useSecurityKeyButtonTapped;
- (void)viewDidLoad;
@end

@implementation ASCredentialRequestCABLEClientViewController

- (ASCredentialRequestCABLEClientViewController)initWithPresentationContext:(id)a3 loginChoice:(id)a4 activity:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ASCredentialRequestCABLEClientViewController;
  v12 = [(ASCredentialRequestPaneViewController *)&v16 initRequiringTableView:0];
  v13 = (ASCredentialRequestCABLEClientViewController *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 132, a3);
    objc_storeStrong((id *)&v13->_loginChoice, a4);
    objc_storeStrong((id *)&v13->_authorizationActivity, a5);
    v14 = v13;
  }

  return v13;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ASCredentialRequestCABLEClientViewController;
  [(ASCredentialRequestPaneViewController *)&v3 viewDidLoad];
  [(ASCredentialRequestCABLEClientViewController *)self _setUpTitleView];
  [(ASCredentialRequestCABLEClientViewController *)self _setUpQRCodeView];
  [(ASCredentialRequestCABLEClientViewController *)self _setUpSecurityKeyButtonViewIfNeeded];
  [(ASCredentialRequestCABLEClientViewController *)self _addBelowQRCodeSpacerView];
  [(ASCredentialRequestPaneViewController *)self sizeToFitPaneContent];
}

- (void)_setUpTitleView
{
  objc_super v3 = [ASCredentialRequestInfoLabelSubPane alloc];
  v4 = [(ASCredentialRequestCABLEClientViewController *)self _titleText];
  v6 = [(ASCredentialRequestInfoLabelSubPane *)v3 initWithString:v4 labelType:1];

  v5 = [(ASCredentialRequestPaneViewController *)self headerPaneContext];
  [v5 addSubPane:v6 withCustomSpacingAfter:24.0];
}

- (void)_setUpQRCodeView
{
  objc_super v3 = [_ASCABLEQRCodeView alloc];
  v4 = [(ASCredentialRequestCABLEClientViewController *)self _qrCodeMessage];
  v7 = [(_ASCABLEQRCodeView *)v3 initWithMessage:v4];

  v5 = [(ASCredentialRequestPaneViewController *)self paneHeaderStackView];
  [v5 addArrangedSubview:v7];

  v6 = [(ASCredentialRequestPaneViewController *)self paneHeaderStackView];
  [(ASCredentialRequestCABLEClientViewController *)self _marginBelowQRCode];
  objc_msgSend(v6, "setCustomSpacing:afterView:", v7);
}

- (void)_setUpSecurityKeyButtonViewIfNeeded
{
  if ([(ASCAuthorizationPresentationContext *)self->_presentationContext shouldAllowSecurityKeysFromCABLEView])
  {
    objc_super v3 = _WBSLocalizedString();
    id v7 = +[ASCredentialRequestSecondaryButton buttonWithTitle:v3 target:self action:sel__useSecurityKeyButtonTapped];

    LODWORD(v4) = 1148846080;
    [v7 setContentCompressionResistancePriority:1 forAxis:v4];
    v5 = [[ASCredentialRequestSubPane alloc] initWithView:v7];
    v6 = [(ASCredentialRequestPaneViewController *)self headerPaneContext];
    [(ASCredentialRequestCABLEClientViewController *)self _marginBelowSecurityKeyButton];
    objc_msgSend(v6, "addSubPane:withCustomSpacingAfter:", v5);
  }
}

- (id)_titleText
{
  if ([(ASCAuthorizationPresentationContext *)self->_presentationContext isRegistrationRequest])
  {
    if ([(ASCAuthorizationPresentationContext *)self->_presentationContext shouldUseFallbackPasskeyUI])
    {
      uint64_t v4 = [(ASCAuthorizationPresentationContext *)self->_presentationContext cableAuthenticatorRequirement];
      switch(v4)
      {
        case 2:
          v5 = NSString;
          goto LABEL_29;
        case 1:
          v5 = NSString;
          goto LABEL_29;
        case 0:
          v5 = NSString;
LABEL_29:
          v12 = _WBSLocalizedString();
          v13 = [(ASCAuthorizationPresentationContext *)self->_presentationContext serviceName];
          v2 = objc_msgSend(v5, "localizedStringWithFormat:", v12, v13);
          goto LABEL_30;
      }
    }
    uint64_t v6 = [(ASCAuthorizationPresentationContext *)self->_presentationContext cableAuthenticatorRequirement];
    switch(v6)
    {
      case 2:
        v5 = NSString;
        goto LABEL_29;
      case 1:
        v5 = NSString;
        goto LABEL_29;
      case 0:
        v5 = NSString;
        goto LABEL_29;
    }
  }
  id v7 = [(ASCAuthorizationPresentationContext *)self->_presentationContext destinationSiteForCrossSiteAssertion];
  uint64_t v8 = [v7 length];

  if (!v8) {
    goto LABEL_16;
  }
  uint64_t v9 = [(ASCAuthorizationPresentationContext *)self->_presentationContext cableAuthenticatorRequirement];
  if (v9 == 2)
  {
    id v10 = NSString;
    goto LABEL_22;
  }
  if (v9 == 1)
  {
    id v10 = NSString;
    goto LABEL_22;
  }
  if (v9)
  {
LABEL_16:
    uint64_t v11 = [(ASCAuthorizationPresentationContext *)self->_presentationContext cableAuthenticatorRequirement];
    if (v11 == 2)
    {
      v5 = NSString;
    }
    else if (v11 == 1)
    {
      v5 = NSString;
    }
    else
    {
      if (v11) {
        goto LABEL_31;
      }
      v5 = NSString;
    }
    goto LABEL_29;
  }
  id v10 = NSString;
LABEL_22:
  v12 = _WBSLocalizedString();
  v13 = [(ASCAuthorizationPresentationContext *)self->_presentationContext destinationSiteForCrossSiteAssertion];
  v14 = [(ASCAuthorizationPresentationContext *)self->_presentationContext serviceName];
  v2 = objc_msgSend(v10, "localizedStringWithFormat:", v12, v13, v14);

LABEL_30:
LABEL_31:

  return v2;
}

- (double)_marginBelowQRCode
{
  int v2 = [(ASCAuthorizationPresentationContext *)self->_presentationContext shouldAllowSecurityKeysFromCABLEView];
  int v3 = [MEMORY[0x263F29440] isPad];
  double result = 12.0;
  if (v3) {
    double result = 8.0;
  }
  double v5 = 48.0;
  if (v3) {
    double v5 = 32.0;
  }
  if (!v2) {
    return v5;
  }
  return result;
}

- (double)_marginBelowSecurityKeyButton
{
  return 10.0;
}

- (void)_addBelowQRCodeSpacerView
{
  id v2 = [(ASCredentialRequestPaneViewController *)self headerPaneContext];
  [v2 addEmptyViewWithSpacing:0.0];
}

- (id)_qrCodeMessage
{
  id v2 = [(ASCABLELoginChoice *)self->_loginChoice qrCodeURL];
  int v3 = [v2 absoluteString];

  return v3;
}

- (void)_useSecurityKeyButtonTapped
{
  id v6 = [(ASCredentialRequestPaneViewController *)self delegate];
  if (v6)
  {
    int v3 = [(ASCAuthorizationPresentationContext *)self->_presentationContext loginChoices];
    uint64_t v4 = objc_msgSend(v3, "safari_firstObjectPassingTest:", &__block_literal_global_50);

    if (v4)
    {
      [v6 requestPaneViewController:self didRequestCredentialForLoginChoice:v4 authenticatedContext:0 completionHandler:&__block_literal_global_57];
    }
    else
    {
      os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_52);
      double v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F29388] code:1 userInfo:0];
      [v6 requestPaneViewController:self dismissWithCredential:0 error:v5];
    }
  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_22);
  }
}

void __75__ASCredentialRequestCABLEClientViewController__useSecurityKeyButtonTapped__block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __75__ASCredentialRequestCABLEClientViewController__useSecurityKeyButtonTapped__block_invoke_cold_1(v0);
  }
}

BOOL __75__ASCredentialRequestCABLEClientViewController__useSecurityKeyButtonTapped__block_invoke_47(uint64_t a1, void *a2)
{
  return [a2 loginChoiceKind] == 3;
}

void __75__ASCredentialRequestCABLEClientViewController__useSecurityKeyButtonTapped__block_invoke_2()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __75__ASCredentialRequestCABLEClientViewController__useSecurityKeyButtonTapped__block_invoke_2_cold_1(v0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationActivity, 0);
  objc_storeStrong((id *)&self->_loginChoice, 0);

  objc_storeStrong((id *)&self->_presentationContext, 0);
}

void __75__ASCredentialRequestCABLEClientViewController__useSecurityKeyButtonTapped__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21918F000, log, OS_LOG_TYPE_ERROR, "Use Security Key button from AutoFill tapped but no delegate.", v1, 2u);
}

void __75__ASCredentialRequestCABLEClientViewController__useSecurityKeyButtonTapped__block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21918F000, log, OS_LOG_TYPE_ERROR, "Use Security Key button from AutoFill tapped but no security key login choice is available. Failing request.", v1, 2u);
}

@end