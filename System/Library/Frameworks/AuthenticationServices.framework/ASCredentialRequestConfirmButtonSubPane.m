@interface ASCredentialRequestConfirmButtonSubPane
+ (id)_createMainStackView;
- (ASCredentialRequestButton)authorizationButton;
- (ASCredentialRequestConfirmButtonSubPane)initWithActivity:(id)a3;
- (ASCredentialRequestConfirmButtonSubPane)initWithActivity:(id)a3 auditTokenData:(id)a4;
- (ASCredentialRequestSubPaneConfirmButtonDelegate)delegate;
- (BOOL)_isDelegateReadyForAuthorization;
- (BOOL)_shouldAllowFallbackToPasscodeAuthentication;
- (BOOL)authorizationCapabilityEnabled;
- (NSString)buttonText;
- (id)_passcodeOrPasswordButtonTitle;
- (id)_passwordAuthenticationButtonTitle;
- (id)_setUpAlertImageWithConstraints;
- (id)_verticalSpacerWithConstant:(double)a3;
- (unint64_t)_authenticationMechanism;
- (void)_addArrangedSpaceToMainStackView:(double)a3;
- (void)_authorizationButtonBioSelected:(id)a3;
- (void)_authorizationButtonCompanionSelected:(id)a3;
- (void)_authorizationWithPasscodeOrPasswordButtonSelected:(id)a3;
- (void)_authorizeAppleAccountWithPasswordButtonSelected:(id)a3;
- (void)_continueButtonTapped;
- (void)_enableLAUIAuthenticationMechanism;
- (void)_enterProcessingStateWithCompletionHandler:(id)a3;
- (void)_initializeAuthorizationButton;
- (void)_performCompanionValidation:(id)a3;
- (void)_performPasscodeOrPasswordValidation:(id)a3;
- (void)_setGlyphViewGestureRecognizerEnabled:(BOOL)a3;
- (void)_setupBiometricButtonWithConstraints:(id)a3;
- (void)_setupLabelWithTitle:(id)a3 animated:(BOOL)a4;
- (void)_switchToAppleAccountPassword;
- (void)_switchToBiometricsView:(BOOL)a3 withAuthenticationMechanismEnabled:(BOOL)a4 showAlert:(BOOL)a5 alertString:(id)a6;
- (void)_switchToPasscodeOrPassword;
- (void)_updateLabelAnimatedWithTitle:(id)a3;
- (void)_waitForTimeInterval:(double)a3 withGroup:(id)a4;
- (void)_windowDidBecomeKey:(id)a3;
- (void)addToStackView:(id)a3 withCustomSpacingAfter:(double)a4 context:(id)a5;
- (void)authenticationResult:(id)a3 error:(id)a4 context:(id)a5;
- (void)biometricAuthenticationFailureWithAlertString:(id)a3;
- (void)dealloc;
- (void)disableBiometricView;
- (void)finishProcessingWithCompletionHandler:(id)a3;
- (void)invalidateProcessingState;
- (void)processBiometricMatchWithCompletionHandler:(id)a3;
- (void)setAuthorizationCapabilityEnabled:(BOOL)a3;
- (void)setButtonText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUpButtonInPaneContext:(id)a3;
- (void)setUpButtonInPaneContext:(id)a3 buttonTitle:(id)a4;
- (void)showActivityIndicator;
- (void)showAlertContinuingWithPassword:(BOOL)a3;
- (void)showAuthenticationMechanismForExternalPasswordCredential;
- (void)showContinueButton;
- (void)showContinueButtonWithTitle:(id)a3;
@end

@implementation ASCredentialRequestConfirmButtonSubPane

- (ASCredentialRequestConfirmButtonSubPane)initWithActivity:(id)a3
{
  return [(ASCredentialRequestConfirmButtonSubPane *)self initWithActivity:a3 auditTokenData:0];
}

- (ASCredentialRequestConfirmButtonSubPane)initWithActivity:(id)a3 auditTokenData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(id)objc_opt_class() _createMainStackView];
  v18.receiver = self;
  v18.super_class = (Class)ASCredentialRequestConfirmButtonSubPane;
  v10 = [(ASCredentialRequestSubPane *)&v18 initWithView:v9];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_authorizationActivity, a3);
    objc_storeStrong((id *)&v11->_mainStackView, v9);
    LODWORD(v12) = 1148846080;
    [(UIStackView *)v11->_mainStackView setContentCompressionResistancePriority:1 forAxis:v12];
    v11->_canPerformBiometricAuthentication = [MEMORY[0x263F29440] isBiometricAuthenticationAvailable];
    v11->_canPerformCompanionAuthentication = [MEMORY[0x263F29440] isCompanionAuthenticationAvailable];
    [(ASCredentialRequestConfirmButtonSubPane *)v11 _initializeAuthorizationButton];
    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v11 selector:sel__windowDidBecomeKey_ name:*MEMORY[0x263F83C38] object:0];

    uint64_t v14 = [v8 copy];
    auditTokenData = v11->_auditTokenData;
    v11->_auditTokenData = (NSData *)v14;

    v16 = v11;
  }

  return v11;
}

- (NSString)buttonText
{
  v2 = [(ASCredentialRequestConfirmButtonSubPane *)self authorizationButton];
  v3 = [v2 buttonText];

  return (NSString *)v3;
}

- (void)setButtonText:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCredentialRequestConfirmButtonSubPane *)self authorizationButton];
  [v5 setButtonText:v4];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ASCredentialRequestConfirmButtonSubPane;
  [(ASCredentialRequestConfirmButtonSubPane *)&v4 dealloc];
}

+ (id)_createMainStackView
{
  id v2 = objc_alloc_init(MEMORY[0x263F82BF8]);
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v2 setAccessibilityIdentifier:@"ASAuthorizationControllerContinueButton"];
  [v2 setSpacing:0.0];
  [v2 setAlignment:3];
  [v2 setAxis:1];
  [v2 setDistribution:0];
  v3 = [MEMORY[0x263F825C8] clearColor];
  [v2 setBackgroundColor:v3];

  return v2;
}

- (void)_initializeAuthorizationButton
{
  v28[5] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F82E00]);
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  id v8 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
  authorizationButtonContainerView = self->_authorizationButtonContainerView;
  self->_authorizationButtonContainerView = v8;

  [(UIView *)self->_authorizationButtonContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = -[ASCredentialRequestButtonContinue initWithFrame:]([ASCredentialRequestButtonContinue alloc], "initWithFrame:", v4, v5, v6, v7);
  authorizationButton = self->_authorizationButton;
  self->_authorizationButton = &v10->super;

  [(ASCredentialRequestButton *)self->_authorizationButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_authorizationButtonContainerView addSubview:self->_authorizationButton];
  [(UIStackView *)self->_mainStackView addArrangedSubview:self->_authorizationButtonContainerView];
  v22 = (void *)MEMORY[0x263F08938];
  v27 = [(ASCredentialRequestButton *)self->_authorizationButton centerXAnchor];
  v26 = [(UIView *)self->_authorizationButtonContainerView centerXAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v28[0] = v25;
  v24 = [(ASCredentialRequestButton *)self->_authorizationButton centerYAnchor];
  v23 = [(UIView *)self->_authorizationButtonContainerView centerYAnchor];
  double v12 = [v24 constraintEqualToAnchor:v23];
  v28[1] = v12;
  v13 = [(UIView *)self->_authorizationButtonContainerView widthAnchor];
  uint64_t v14 = [(ASCredentialRequestButton *)self->_authorizationButton widthAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v28[2] = v15;
  v16 = [(UIView *)self->_authorizationButtonContainerView heightAnchor];
  v17 = [(ASCredentialRequestButton *)self->_authorizationButton heightAnchor];
  objc_super v18 = [v16 constraintEqualToAnchor:v17];
  v28[3] = v18;
  v19 = [(ASCredentialRequestButton *)self->_authorizationButton heightAnchor];
  +[ASViewServiceInterfaceUtilities continueButtonHeight];
  v20 = objc_msgSend(v19, "constraintEqualToConstant:");
  v28[4] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:5];
  [v22 activateConstraints:v21];
}

- (void)_windowDidBecomeKey:(id)a3
{
  if ([(LAUIAuthenticationView *)self->_biometricsView isMechanismEnabled:4])
  {
    [(ASCredentialRequestConfirmButtonSubPane *)self _enableLAUIAuthenticationMechanism];
  }
}

- (void)_enableLAUIAuthenticationMechanism
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__ASCredentialRequestConfirmButtonSubPane__enableLAUIAuthenticationMechanism__block_invoke;
  block[3] = &unk_264395388;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __77__ASCredentialRequestConfirmButtonSubPane__enableLAUIAuthenticationMechanism__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[7];
  id v10 = 0;
  char v4 = objc_msgSend(v3, "enableMechanism:error:", objc_msgSend(v2, "_authenticationMechanism"), &v10);
  id v5 = v10;
  double v6 = v5;
  if (v5 || (v4 & 1) == 0)
  {
    double v7 = *(NSObject **)(*(void *)(a1 + 32) + 72);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __77__ASCredentialRequestConfirmButtonSubPane__enableLAUIAuthenticationMechanism__block_invoke_2;
    v8[3] = &unk_264395388;
    id v9 = v5;
    os_activity_apply(v7, v8);
  }
}

void __77__ASCredentialRequestConfirmButtonSubPane__enableLAUIAuthenticationMechanism__block_invoke_2(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __77__ASCredentialRequestConfirmButtonSubPane__enableLAUIAuthenticationMechanism__block_invoke_2_cold_1(a1, v2);
  }
}

- (unint64_t)_authenticationMechanism
{
  return 4;
}

- (void)setAuthorizationCapabilityEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([MEMORY[0x263F29440] biometryType] == 1 && self->_canPerformBiometricAuthentication)
  {
    id v5 = self;
    uint64_t v6 = 1;
    uint64_t v7 = 1;
  }
  else
  {
    id v5 = self;
    uint64_t v6 = 0;
    uint64_t v7 = v3;
  }

  [(ASCredentialRequestConfirmButtonSubPane *)v5 _switchToBiometricsView:v6 withAuthenticationMechanismEnabled:v7 showAlert:0 alertString:0];
}

- (BOOL)authorizationCapabilityEnabled
{
  id v2 = [(ASCredentialRequestConfirmButtonSubPane *)self authorizationButton];
  char v3 = [v2 isEnabled];

  return v3;
}

- (void)showAlertContinuingWithPassword:(BOOL)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__ASCredentialRequestConfirmButtonSubPane_showAlertContinuingWithPassword___block_invoke;
  block[3] = &unk_264395388;
  block[4] = self;
  id v5 = MEMORY[0x263EF83A0];
  dispatch_async(MEMORY[0x263EF83A0], block);
  dispatch_time_t v6 = dispatch_time(0, 1700000000);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__ASCredentialRequestConfirmButtonSubPane_showAlertContinuingWithPassword___block_invoke_2;
  v7[3] = &unk_264396968;
  BOOL v8 = a3;
  v7[4] = self;
  dispatch_after(v6, v5, v7);
}

void __75__ASCredentialRequestConfirmButtonSubPane_showAlertContinuingWithPassword___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  _WBSLocalizedString();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _switchToBiometricsView:0 withAuthenticationMechanismEnabled:0 showAlert:1 alertString:v2];
}

uint64_t __75__ASCredentialRequestConfirmButtonSubPane_showAlertContinuingWithPassword___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) _passcodeOrPasswordButtonTitle];
    [*(id *)(*(void *)(a1 + 32) + 112) setButtonText:v2];

    [*(id *)(*(void *)(a1 + 32) + 112) addTarget:*(void *)(a1 + 32) action:sel__authorizeAppleAccountWithPasswordButtonSelected_];
  }
  char v3 = *(void **)(a1 + 32);

  return [v3 _switchToBiometricsView:0 withAuthenticationMechanismEnabled:1 showAlert:0 alertString:0];
}

- (void)setUpButtonInPaneContext:(id)a3
{
}

- (void)setUpButtonInPaneContext:(id)a3 buttonTitle:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (self->_canPerformBiometricAuthentication)
  {
    BOOL v8 = &selRef__authorizationButtonBioSelected_;
  }
  else if (self->_canPerformCompanionAuthentication)
  {
    BOOL v8 = &selRef__authorizationButtonCompanionSelected_;
  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_23);
    BOOL v8 = &selRef__authorizationWithPasscodeOrPasswordButtonSelected_;
  }
  id v9 = *v8;
  if (!v7)
  {
    _WBSLocalizedString();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v10 = (void *)MEMORY[0x263F08938];
  v11 = [(UIStackView *)self->_mainStackView widthAnchor];
  double v12 = [v6 stackView];
  v13 = [v12 widthAnchor];
  uint64_t v14 = [v11 constraintEqualToAnchor:v13];
  v16[0] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  [v10 activateConstraints:v15];

  [(ASCredentialRequestButton *)self->_authorizationButton setButtonText:v7];
  [(ASCredentialRequestButton *)self->_authorizationButton addTarget:self action:v9];
}

void __80__ASCredentialRequestConfirmButtonSubPane_setUpButtonInPaneContext_buttonTitle___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21918F000, v0, OS_LOG_TYPE_INFO, "Biometric authentication not available. Falling back to passcode.", v1, 2u);
  }
}

- (void)showContinueButton
{
  _WBSLocalizedString();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(ASCredentialRequestConfirmButtonSubPane *)self showContinueButtonWithTitle:v3];
}

- (void)showContinueButtonWithTitle:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__ASCredentialRequestConfirmButtonSubPane_showContinueButtonWithTitle___block_invoke;
  v6[3] = &unk_264395428;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __71__ASCredentialRequestConfirmButtonSubPane_showContinueButtonWithTitle___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 112) setButtonText:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 112) addTarget:*(void *)(a1 + 32) action:sel__continueButtonTapped];
  id v2 = *(void **)(a1 + 32);

  return [v2 _switchToBiometricsView:0 withAuthenticationMechanismEnabled:1 showAlert:0 alertString:0];
}

- (void)showAuthenticationMechanismForExternalPasswordCredential
{
  if (self->_canPerformBiometricAuthentication)
  {
    [(ASCredentialRequestConfirmButtonSubPane *)self _switchToBiometricsView:1 withAuthenticationMechanismEnabled:1 showAlert:0 alertString:0];
  }
  else if ([(ASCredentialRequestConfirmButtonSubPane *)self _shouldAllowFallbackToPasscodeAuthentication])
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __99__ASCredentialRequestConfirmButtonSubPane_showAuthenticationMechanismForExternalPasswordCredential__block_invoke;
    v4[3] = &unk_264396990;
    v4[4] = self;
    [(ASCredentialRequestConfirmButtonSubPane *)self _performPasscodeOrPasswordValidation:v4];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained confirmButtonSubPaneDidFailBiometry:self allowingPasscodeFallback:0];
  }
}

void __99__ASCredentialRequestConfirmButtonSubPane_showAuthenticationMechanismForExternalPasswordCredential__block_invoke(uint64_t a1, int a2, void *a3)
{
  if (a2)
  {
    id v4 = (id *)(*(void *)(a1 + 32) + 120);
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained(v4);
    [WeakRetained performAuthorization:*(void *)(a1 + 32) withAuthenticatedLAContext:v5];
  }
}

- (void)_authorizationButtonBioSelected:(id)a3
{
  if ([(ASCredentialRequestConfirmButtonSubPane *)self _isDelegateReadyForAuthorization])
  {
    [(ASCredentialRequestConfirmButtonSubPane *)self _switchToBiometricsView:1 withAuthenticationMechanismEnabled:1 showAlert:0 alertString:0];
  }
}

- (void)_authorizationButtonCompanionSelected:(id)a3
{
  if ([(ASCredentialRequestConfirmButtonSubPane *)self _isDelegateReadyForAuthorization])
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __81__ASCredentialRequestConfirmButtonSubPane__authorizationButtonCompanionSelected___block_invoke;
    v4[3] = &unk_264396990;
    v4[4] = self;
    [(ASCredentialRequestConfirmButtonSubPane *)self _performCompanionValidation:v4];
  }
}

void __81__ASCredentialRequestConfirmButtonSubPane__authorizationButtonCompanionSelected___block_invoke(uint64_t a1, int a2, void *a3)
{
  if (a2)
  {
    id v4 = (id *)(*(void *)(a1 + 32) + 120);
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained(v4);
    [WeakRetained performAuthorization:*(void *)(a1 + 32) withAuthenticatedLAContext:v5];
  }
}

- (void)_authorizationWithPasscodeOrPasswordButtonSelected:(id)a3
{
  if ([(ASCredentialRequestConfirmButtonSubPane *)self _isDelegateReadyForAuthorization])
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __94__ASCredentialRequestConfirmButtonSubPane__authorizationWithPasscodeOrPasswordButtonSelected___block_invoke;
    v4[3] = &unk_264396990;
    v4[4] = self;
    [(ASCredentialRequestConfirmButtonSubPane *)self _performPasscodeOrPasswordValidation:v4];
  }
}

void __94__ASCredentialRequestConfirmButtonSubPane__authorizationWithPasscodeOrPasswordButtonSelected___block_invoke(uint64_t a1, int a2, void *a3)
{
  if (a2)
  {
    id v4 = (id *)(*(void *)(a1 + 32) + 120);
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained(v4);
    [WeakRetained performAuthorization:*(void *)(a1 + 32) withAuthenticatedLAContext:v5];
  }
}

- (void)_authorizeAppleAccountWithPasswordButtonSelected:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained performPasswordAuthentication:self];
}

- (void)_continueButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained userTappedContinueButton];
}

- (void)_performCompanionValidation:(id)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F10468]);
  id v6 = [(ASCredentialRequestConfirmButtonSubPane *)self _passcodeOrPasswordButtonTitle];
  id v7 = (void *)MEMORY[0x263EFF9A0];
  v16[0] = &unk_26CAA54F0;
  v16[1] = &unk_26CAA5508;
  v17[0] = v6;
  v17[1] = &stru_26CA92B70;
  BOOL v8 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  id v9 = [v7 dictionaryWithDictionary:v8];

  auditTokenData = self->_auditTokenData;
  if (auditTokenData) {
    [v9 setObject:auditTokenData forKey:&unk_26CAA5520];
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __71__ASCredentialRequestConfirmButtonSubPane__performCompanionValidation___block_invoke;
  v13[3] = &unk_2643969B8;
  id v14 = v5;
  id v15 = v4;
  v13[4] = self;
  id v11 = v5;
  id v12 = v4;
  [v11 evaluatePolicy:3 options:v9 reply:v13];
}

void __71__ASCredentialRequestConfirmButtonSubPane__performCompanionValidation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = *(NSObject **)(*(void *)(a1 + 32) + 72);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__ASCredentialRequestConfirmButtonSubPane__performCompanionValidation___block_invoke_2;
    block[3] = &unk_264395388;
    id v8 = v4;
    os_activity_apply(v6, block);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __71__ASCredentialRequestConfirmButtonSubPane__performCompanionValidation___block_invoke_2(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __71__ASCredentialRequestConfirmButtonSubPane__performCompanionValidation___block_invoke_2_cold_1(a1, v2);
  }
}

- (void)_performPasscodeOrPasswordValidation:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F10468]);
  id v6 = [(ASCredentialRequestConfirmButtonSubPane *)self _passcodeOrPasswordButtonTitle];
  v13[0] = &unk_26CAA54F0;
  v13[1] = &unk_26CAA5508;
  v14[0] = v6;
  v14[1] = &stru_26CA92B70;
  id v7 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __80__ASCredentialRequestConfirmButtonSubPane__performPasscodeOrPasswordValidation___block_invoke;
  v10[3] = &unk_2643969B8;
  id v11 = v5;
  id v12 = v4;
  v10[4] = self;
  id v8 = v5;
  id v9 = v4;
  [v8 evaluatePolicy:1007 options:v7 reply:v10];
}

void __80__ASCredentialRequestConfirmButtonSubPane__performPasscodeOrPasswordValidation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = *(NSObject **)(*(void *)(a1 + 32) + 72);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__ASCredentialRequestConfirmButtonSubPane__performPasscodeOrPasswordValidation___block_invoke_2;
    block[3] = &unk_264395388;
    id v8 = v4;
    os_activity_apply(v6, block);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __80__ASCredentialRequestConfirmButtonSubPane__performPasscodeOrPasswordValidation___block_invoke_2(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __80__ASCredentialRequestConfirmButtonSubPane__performPasscodeOrPasswordValidation___block_invoke_2_cold_1(a1, v2);
  }
}

- (BOOL)_isDelegateReadyForAuthorization
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained validateReadyForAuthorization:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)_switchToBiometricsView:(BOOL)a3 withAuthenticationMechanismEnabled:(BOOL)a4 showAlert:(BOOL)a5 alertString:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a6;
  if (!v8 || !v7 || !self->_biometricsView)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = [(UIStackView *)self->_mainStackView subviews];
    id v12 = (void *)[v11 copy];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * v16++) removeFromSuperview];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v14);
    }

    if (v6)
    {
      [(ASCredentialRequestConfirmButtonSubPane *)self disableBiometricView];
      [(ASCredentialRequestConfirmButtonSubPane *)self _addArrangedSpaceToMainStackView:12.0];
      id v17 = [(ASCredentialRequestConfirmButtonSubPane *)self _setUpAlertImageWithConstraints];
      [(ASCredentialRequestConfirmButtonSubPane *)self _setupLabelWithTitle:v10 animated:1];
LABEL_22:
      [MEMORY[0x263F08938] activateConstraints:v17];

      goto LABEL_23;
    }
    if (!v8)
    {
      [(ASCredentialRequestConfirmButtonSubPane *)self disableBiometricView];
      [(UIStackView *)self->_mainStackView addArrangedSubview:self->_authorizationButtonContainerView];
      v19 = [(ASCredentialRequestConfirmButtonSubPane *)self authorizationButton];
      [v19 setEnabled:v7];

      goto LABEL_23;
    }
    id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(ASCredentialRequestConfirmButtonSubPane *)self _setupBiometricButtonWithConstraints:v17];
    uint64_t v18 = [MEMORY[0x263F29440] biometryType];
    if (v18 == 2)
    {
      v20 = _WBSLocalizedString();
      v21 = self;
      v22 = v20;
      uint64_t v23 = 1;
    }
    else
    {
      if (!v18)
      {
        os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_49);
        goto LABEL_22;
      }
      v20 = _WBSLocalizedString();
      v21 = self;
      v22 = v20;
      uint64_t v23 = 0;
    }
    [(ASCredentialRequestConfirmButtonSubPane *)v21 _setupLabelWithTitle:v22 animated:v23];

    goto LABEL_22;
  }
  [(ASCredentialRequestConfirmButtonSubPane *)self _enableLAUIAuthenticationMechanism];
LABEL_23:
}

void __124__ASCredentialRequestConfirmButtonSubPane__switchToBiometricsView_withAuthenticationMechanismEnabled_showAlert_alertString___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __124__ASCredentialRequestConfirmButtonSubPane__switchToBiometricsView_withAuthenticationMechanismEnabled_showAlert_alertString___block_invoke_cold_1(v0);
  }
}

- (void)disableBiometricView
{
  biometricsView = self->_biometricsView;
  if (biometricsView)
  {
    [(LAUIAuthenticationView *)biometricsView setDelegate:0];
    char v4 = self->_biometricsView;
    id v12 = 0;
    char v5 = [(LAUIAuthenticationView *)v4 disableMechanism:4 error:&v12];
    id v6 = v12;
    BOOL v7 = v6;
    if (v6 || (v5 & 1) == 0)
    {
      authorizationActivity = self->_authorizationActivity;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __63__ASCredentialRequestConfirmButtonSubPane_disableBiometricView__block_invoke;
      v10[3] = &unk_264395388;
      id v11 = v6;
      os_activity_apply(authorizationActivity, v10);
    }
    id v9 = self->_biometricsView;
    self->_biometricsView = 0;
  }
}

void __63__ASCredentialRequestConfirmButtonSubPane_disableBiometricView__block_invoke(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __63__ASCredentialRequestConfirmButtonSubPane_disableBiometricView__block_invoke_cold_1(a1, v2);
  }
}

- (void)_addArrangedSpaceToMainStackView:(double)a3
{
  id v4 = [(ASCredentialRequestConfirmButtonSubPane *)self _verticalSpacerWithConstant:a3];
  [(UIStackView *)self->_mainStackView addArrangedSubview:v4];
}

- (id)_verticalSpacerWithConstant:(double)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F82E00]);
  char v5 = [v4 heightAnchor];
  id v6 = [v5 constraintEqualToConstant:a3];
  [v4 addConstraint:v6];

  return v4;
}

- (id)_setUpAlertImageWithConstraints
{
  void v17[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F82828]);
  id v4 = [MEMORY[0x263F825C8] redColor];
  [v3 setTintColor:v4];

  char v5 = [MEMORY[0x263F82818] configurationWithPointSize:3 weight:50.0];
  [v3 setPreferredSymbolConfiguration:v5];

  id v6 = [MEMORY[0x263F827E8] systemImageNamed:@"exclamationmark.circle"];
  [v3 setImage:v6];

  [v3 setContentMode:1];
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, 50.0, 50.0);
  [(UIStackView *)self->_mainStackView addArrangedSubview:v3];
  BOOL v7 = [v3 heightAnchor];
  BOOL v8 = [v7 constraintEqualToConstant:50.0];
  id v9 = objc_msgSend(v3, "widthAnchor", v8);
  id v10 = [v9 constraintEqualToConstant:50.0];
  v17[1] = v10;
  id v11 = [v3 centerXAnchor];
  id v12 = [(ASCredentialRequestSubPane *)self view];
  uint64_t v13 = [v12 centerXAnchor];
  uint64_t v14 = [v11 constraintEqualToAnchor:v13];
  v17[2] = v14;
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];

  return v15;
}

- (void)_setupLabelWithTitle:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = (__CFString *)a3;
  id v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  [(UILabel *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v7 = [MEMORY[0x263F82770] defaultMetrics];
  BOOL v8 = [MEMORY[0x263F82760] systemFontOfSize:15.0 weight:*MEMORY[0x263F83640]];
  id v9 = [v7 scaledFontForFont:v8];
  [(UILabel *)v6 setFont:v9];

  [(UILabel *)v6 setTextAlignment:1];
  [(UILabel *)v6 setNumberOfLines:1];
  [(UILabel *)v6 setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)v6 setAdjustsFontSizeToFitWidth:1];
  if (v4) {
    id v10 = &stru_26CA92B70;
  }
  else {
    id v10 = v13;
  }
  [(UILabel *)v6 setText:v10];
  LODWORD(v11) = 1148846080;
  [(UILabel *)v6 setContentCompressionResistancePriority:1 forAxis:v11];
  [(UILabel *)v6 setMaximumContentSizeCategory:*MEMORY[0x263F83418]];
  [(UIStackView *)self->_mainStackView addArrangedSubview:v6];
  if (self->_biometricsView) {
    -[UIStackView setCustomSpacing:afterView:](self->_mainStackView, "setCustomSpacing:afterView:", 12.0);
  }
  biometricLabel = self->_biometricLabel;
  self->_biometricLabel = v6;

  if (v4) {
    [(ASCredentialRequestConfirmButtonSubPane *)self _updateLabelAnimatedWithTitle:v13];
  }
}

- (void)_updateLabelAnimatedWithTitle:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x263F15910];
  id v5 = a3;
  id v9 = [v4 animation];
  id v6 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
  [v9 setTimingFunction:v6];

  uint64_t v7 = *MEMORY[0x263F15FD8];
  [v9 setType:*MEMORY[0x263F15FD8]];
  [v9 setDuration:0.15];
  BOOL v8 = [(UILabel *)self->_biometricLabel layer];
  [v8 addAnimation:v9 forKey:v7];

  [(UILabel *)self->_biometricLabel setText:v5];
}

- (void)_setupBiometricButtonWithConstraints:(id)a3
{
  void v13[2] = *MEMORY[0x263EF8340];
  BOOL v4 = (objc_class *)MEMORY[0x263F52568];
  id v5 = a3;
  id v6 = (LAUIAuthenticationView *)objc_msgSend([v4 alloc], "initWithFrame:mechanisms:", 4, 0.0, 0.0, 50.0, 50.0);
  biometricsView = self->_biometricsView;
  self->_biometricsView = v6;

  [(LAUIAuthenticationView *)self->_biometricsView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(LAUIAuthenticationView *)self->_biometricsView setDelegate:self];
  [(UIStackView *)self->_mainStackView addArrangedSubview:self->_biometricsView];
  BOOL v8 = [(LAUIAuthenticationView *)self->_biometricsView widthAnchor];
  id v9 = [v8 constraintEqualToConstant:50.0];
  v13[0] = v9;
  id v10 = [(LAUIAuthenticationView *)self->_biometricsView heightAnchor];
  double v11 = [v10 constraintEqualToConstant:50.0];
  v13[1] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  [v5 addObjectsFromArray:v12];
}

- (void)_switchToPasscodeOrPassword
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__ASCredentialRequestConfirmButtonSubPane__switchToPasscodeOrPassword__block_invoke;
  block[3] = &unk_264395388;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __70__ASCredentialRequestConfirmButtonSubPane__switchToPasscodeOrPassword__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _passcodeOrPasswordButtonTitle];
  [*(id *)(*(void *)(a1 + 32) + 112) setButtonText:v2];

  [*(id *)(*(void *)(a1 + 32) + 112) addTarget:*(void *)(a1 + 32) action:sel__authorizationWithPasscodeOrPasswordButtonSelected_];
  id v3 = *(void **)(a1 + 32);

  return [v3 _switchToBiometricsView:0 withAuthenticationMechanismEnabled:1 showAlert:0 alertString:0];
}

- (void)_switchToAppleAccountPassword
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__ASCredentialRequestConfirmButtonSubPane__switchToAppleAccountPassword__block_invoke;
  block[3] = &unk_264395388;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __72__ASCredentialRequestConfirmButtonSubPane__switchToAppleAccountPassword__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _passwordAuthenticationButtonTitle];
  [*(id *)(*(void *)(a1 + 32) + 112) setButtonText:v2];

  [*(id *)(*(void *)(a1 + 32) + 112) addTarget:*(void *)(a1 + 32) action:sel__authorizeAppleAccountWithPasswordButtonSelected_];
  id v3 = *(void **)(a1 + 32);

  return [v3 _switchToBiometricsView:0 withAuthenticationMechanismEnabled:1 showAlert:0 alertString:0];
}

- (id)_passcodeOrPasswordButtonTitle
{
  return (id)_WBSLocalizedString();
}

- (id)_passwordAuthenticationButtonTitle
{
  return (id)_WBSLocalizedString();
}

- (void)_enterProcessingStateWithCompletionHandler:(id)a3
{
  BOOL v8 = (void (**)(void))a3;
  if (*(_OWORD *)&self->_processingStateCompletionHandler == 0)
  {
    BOOL v4 = (OS_dispatch_group *)dispatch_group_create();
    processingStateGroup = self->_processingStateGroup;
    self->_processingStateGroup = v4;

    id v6 = (void *)MEMORY[0x21D484070](v8);
    id processingStateCompletionHandler = self->_processingStateCompletionHandler;
    self->_id processingStateCompletionHandler = v6;

    [(ASCredentialRequestConfirmButtonSubPane *)self _setGlyphViewGestureRecognizerEnabled:0];
  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_75);
    v8[2]();
  }
}

void __86__ASCredentialRequestConfirmButtonSubPane__enterProcessingStateWithCompletionHandler___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21918F000, v0, OS_LOG_TYPE_INFO, "ASCredentialRequestConfirmButtonSubPane already in processing state, ignoring attempt.", v1, 2u);
  }
}

- (void)_waitForTimeInterval:(double)a3 withGroup:(id)a4
{
  id v5 = a4;
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_group_enter(v5);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__ASCredentialRequestConfirmButtonSubPane__waitForTimeInterval_withGroup___block_invoke;
  block[3] = &unk_264395388;
  id v9 = v5;
  uint64_t v7 = v5;
  dispatch_after(v6, MEMORY[0x263EF83A0], block);
}

void __74__ASCredentialRequestConfirmButtonSubPane__waitForTimeInterval_withGroup___block_invoke(uint64_t a1)
{
}

- (void)_setGlyphViewGestureRecognizerEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(LAUIAuthenticationView *)self->_biometricsView subviews];
  id v8 = [v4 firstObject];

  id v5 = v8;
  if (v8)
  {
    dispatch_time_t v6 = [v8 gestureRecognizers];
    uint64_t v7 = [v6 firstObject];

    [v7 setEnabled:v3];
    id v5 = v8;
  }
}

- (void)biometricAuthenticationFailureWithAlertString:(id)a3
{
  [(ASCredentialRequestConfirmButtonSubPane *)self _switchToBiometricsView:0 withAuthenticationMechanismEnabled:0 showAlert:1 alertString:a3];
  dispatch_time_t v4 = dispatch_time(0, 1700000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__ASCredentialRequestConfirmButtonSubPane_biometricAuthenticationFailureWithAlertString___block_invoke;
  block[3] = &unk_264395388;
  void block[4] = self;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

uint64_t __89__ASCredentialRequestConfirmButtonSubPane_biometricAuthenticationFailureWithAlertString___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _switchToBiometricsView:0 withAuthenticationMechanismEnabled:1 showAlert:0 alertString:0];
}

- (void)finishProcessingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __81__ASCredentialRequestConfirmButtonSubPane_finishProcessingWithCompletionHandler___block_invoke;
  v6[3] = &unk_264395C60;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __81__ASCredentialRequestConfirmButtonSubPane_finishProcessingWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 96);
  uint64_t v3 = MEMORY[0x21D484070](*(void *)(*(void *)(a1 + 32) + 88));
  if (!((unint64_t)v2 | v3)) {
    goto LABEL_6;
  }
  id v4 = *(void **)(a1 + 32);
  id v5 = _WBSLocalizedString();
  [v4 _updateLabelAnimatedWithTitle:v5];

  [*(id *)(a1 + 32) _waitForTimeInterval:v2 withGroup:1.0];
  if (v3) {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  if (v2)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__ASCredentialRequestConfirmButtonSubPane_finishProcessingWithCompletionHandler___block_invoke_2;
    block[3] = &unk_2643969E0;
    objc_copyWeak(&v8, &location);
    id v7 = *(id *)(a1 + 40);
    dispatch_group_notify(v2, MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
LABEL_6:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __81__ASCredentialRequestConfirmButtonSubPane_finishProcessingWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidateProcessingState];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidateProcessingState
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __68__ASCredentialRequestConfirmButtonSubPane_invalidateProcessingState__block_invoke;
  v2[3] = &unk_264395360;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __68__ASCredentialRequestConfirmButtonSubPane_invalidateProcessingState__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[12];
    WeakRetained[12] = 0;
    id v4 = WeakRetained;

    id v3 = (void *)v4[11];
    v4[11] = 0;

    [v4 _setGlyphViewGestureRecognizerEnabled:1];
    id WeakRetained = v4;
  }
}

- (BOOL)_shouldAllowFallbackToPasscodeAuthentication
{
  v7[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F10468]);
  v6[0] = &unk_26CAA5538;
  v6[1] = &unk_26CAA5550;
  v7[0] = MEMORY[0x263EFFA88];
  v7[1] = MEMORY[0x263EFFA88];
  id v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  id v4 = [v2 evaluatePolicy:1025 options:v3 error:0];

  return v4 != 0;
}

- (void)showActivityIndicator
{
  v18[4] = *MEMORY[0x263EF8340];
  [(ASCredentialRequestButton *)self->_authorizationButton setHidden:1];
  id v3 = objc_alloc_init(MEMORY[0x263F823E8]);
  [v3 setHidden:0];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_authorizationButtonContainerView addSubview:v3];
  uint64_t v15 = (void *)MEMORY[0x263F08938];
  id v17 = [v3 centerXAnchor];
  uint64_t v16 = [(UIView *)self->_authorizationButtonContainerView centerXAnchor];
  id v4 = [v17 constraintEqualToAnchor:v16];
  v18[0] = v4;
  id v5 = [v3 centerYAnchor];
  dispatch_time_t v6 = [(UIView *)self->_authorizationButtonContainerView centerYAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6];
  v18[1] = v7;
  id v8 = [v3 heightAnchor];
  +[ASViewServiceInterfaceUtilities continueButtonHeight];
  id v10 = [v8 constraintEqualToConstant:v9 * 0.5];
  v18[2] = v10;
  double v11 = [v3 widthAnchor];
  +[ASViewServiceInterfaceUtilities continueButtonHeight];
  uint64_t v13 = [v11 constraintEqualToConstant:v12 * 0.5];
  v18[3] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];
  [v15 activateConstraints:v14];

  [v3 startAnimating];
}

- (void)authenticationResult:(id)a3 error:(id)a4 context:(id)a5
{
  v28[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = v10;
  if (!v9)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78__ASCredentialRequestConfirmButtonSubPane_authenticationResult_error_context___block_invoke;
    block[3] = &unk_264395428;
    void block[4] = self;
    id v26 = v10;
    dispatch_async(MEMORY[0x263EF83A0], block);
    v19 = v26;
    goto LABEL_9;
  }
  uint64_t v27 = *MEMORY[0x263F10440];
  v28[0] = &unk_26CAA5490;
  double v12 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
  int v13 = objc_msgSend(v9, "safari_matchesErrorDomainsAndCodes:", v12);

  BOOL v14 = [(ASCredentialRequestConfirmButtonSubPane *)self _shouldAllowFallbackToPasscodeAuthentication];
  authorizationActivity = self->_authorizationActivity;
  if (v13) {
    BOOL v16 = !v14;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    BOOL v17 = v14;
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __78__ASCredentialRequestConfirmButtonSubPane_authenticationResult_error_context___block_invoke_91;
    uint64_t v23 = &unk_264395388;
    id v24 = v9;
    os_activity_apply(authorizationActivity, &v20);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "confirmButtonSubPaneDidFailBiometry:allowingPasscodeFallback:", self, v17, v20, v21, v22, v23);

    v19 = v24;
LABEL_9:

    goto LABEL_10;
  }
  os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_90);
  [(ASCredentialRequestConfirmButtonSubPane *)self _switchToPasscodeOrPassword];
LABEL_10:
}

void __78__ASCredentialRequestConfirmButtonSubPane_authenticationResult_error_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  [WeakRetained confirmButtonSubPaneDidEnterProcessingState:*(void *)(a1 + 32) withAuthenticatedContext:*(void *)(a1 + 40)];
}

void __78__ASCredentialRequestConfirmButtonSubPane_authenticationResult_error_context___block_invoke_88()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21918F000, v0, OS_LOG_TYPE_INFO, "Biometric auth failed or locked out. Switching to passcode authentication.", v1, 2u);
  }
}

void __78__ASCredentialRequestConfirmButtonSubPane_authenticationResult_error_context___block_invoke_91(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __78__ASCredentialRequestConfirmButtonSubPane_authenticationResult_error_context___block_invoke_91_cold_1(a1, v2);
  }
}

- (void)processBiometricMatchWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __86__ASCredentialRequestConfirmButtonSubPane_processBiometricMatchWithCompletionHandler___block_invoke;
  v6[3] = &unk_264395C60;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __86__ASCredentialRequestConfirmButtonSubPane_processBiometricMatchWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = _WBSLocalizedString();
  [v2 _updateLabelAnimatedWithTitle:v3];

  [*(id *)(a1 + 32) _enterProcessingStateWithCompletionHandler:*(void *)(a1 + 40)];
  uint64_t result = [MEMORY[0x263F29440] biometryType];
  if (result == 1)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = v5[12];
    return [v5 _waitForTimeInterval:v6 withGroup:2.2];
  }
  return result;
}

- (void)addToStackView:(id)a3 withCustomSpacingAfter:(double)a4 context:(id)a5
{
  id v8 = (ASCredentialRequestPaneContext *)a5;
  v10.receiver = self;
  v10.super_class = (Class)ASCredentialRequestConfirmButtonSubPane;
  [(ASCredentialRequestSubPane *)&v10 addToStackView:a3 withCustomSpacingAfter:v8 context:a4];
  paneContext = self->_paneContext;
  self->_paneContext = v8;
}

- (ASCredentialRequestButton)authorizationButton
{
  return self->_authorizationButton;
}

- (ASCredentialRequestSubPaneConfirmButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASCredentialRequestSubPaneConfirmButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_authorizationButton, 0);
  objc_storeStrong((id *)&self->_auditTokenData, 0);
  objc_storeStrong((id *)&self->_processingStateGroup, 0);
  objc_storeStrong(&self->_processingStateCompletionHandler, 0);
  objc_storeStrong((id *)&self->_biometricLabel, 0);
  objc_storeStrong((id *)&self->_authorizationActivity, 0);
  objc_storeStrong((id *)&self->_paneContext, 0);
  objc_storeStrong((id *)&self->_biometricsView, 0);
  objc_storeStrong((id *)&self->_authorizationButtonContainerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);

  objc_storeStrong((id *)&self->_mainStackView, 0);
}

void __77__ASCredentialRequestConfirmButtonSubPane__enableLAUIAuthenticationMechanism__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v4, v5, "Error enabling biometrics in credential picker: %{public}@", v6, v7, v8, v9, v10);
}

void __71__ASCredentialRequestConfirmButtonSubPane__performCompanionValidation___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v4, v5, "Companion authentication in ASAuthorizationController credential picker failed with error: %{public}@", v6, v7, v8, v9, v10);
}

void __80__ASCredentialRequestConfirmButtonSubPane__performPasscodeOrPasswordValidation___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v4, v5, "Passcode authentication in ASAuthorizationController credential picker failed with error: %{public}@", v6, v7, v8, v9, v10);
}

void __124__ASCredentialRequestConfirmButtonSubPane__switchToBiometricsView_withAuthenticationMechanismEnabled_showAlert_alertString___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21918F000, log, OS_LOG_TYPE_ERROR, "Asked to show biometric view without any biometrics available.", v1, 2u);
}

void __63__ASCredentialRequestConfirmButtonSubPane_disableBiometricView__block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v4, v5, "Error disabling biometrics UI: %{public}@", v6, v7, v8, v9, v10);
}

void __78__ASCredentialRequestConfirmButtonSubPane_authenticationResult_error_context___block_invoke_91_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v4, v5, "Biometric auth failed with error: %{public}@", v6, v7, v8, v9, v10);
}

@end