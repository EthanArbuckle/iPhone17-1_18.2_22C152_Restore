@interface AKAuthorizationSubPaneConfirmButton
+ (id)_createMainStackView;
- (AKAuthorizationButton)authorizationButton;
- (AKAuthorizationPaneContext)context;
- (AKAuthorizationPresentationContext)presentationContext;
- (AKAuthorizationSubPaneConfirmButton)initWithPresentationContext:(id)a3;
- (AKAuthorizationSubPaneConfirmButtonDelegate)delegate;
- (BOOL)_delegate_validateReadyForAuthorization;
- (BOOL)_hasTouchIDOnly;
- (BOOL)_isSubscriptionFlow;
- (BOOL)_isUpgradeFromPassword;
- (BOOL)_shouldUseSIWAButton;
- (BOOL)canPerformBiometricValidation;
- (BOOL)hasTouchIDOnly;
- (BOOL)isPasscodeAuthorizationInProcess;
- (LAUIAuthenticationView)bioView;
- (NSString)bioTextForInactiveState;
- (NSString)buttonText;
- (UILabel)bioLabel;
- (UIStackView)mainStackView;
- (UIView)authorizationButtonContainer;
- (id)_bioButtonTitle;
- (id)_passcodeButtonTitle;
- (id)_passwordButtonTitle;
- (id)_spaceWithConstant:(double)a3;
- (unint64_t)_authenticationMechanism;
- (void)_addArrangedSpaceToMainStackView:(double)a3;
- (void)_authorizationButtonBioSelected:(id)a3;
- (void)_authorizationButtonExternalAuthenticationSelected:(id)a3;
- (void)_authorizationButtonSkipBioSelected:(id)a3;
- (void)_authorizationButtonWithAccountPasswordSelected:(id)a3;
- (void)_authorizationWithPasscodeButtonSelected:(id)a3;
- (void)_checkIfPasscodeFallbackAllowedWithCompletion:(id)a3;
- (void)_createAccountSelected;
- (void)_disableBioView;
- (void)_enableLAUIAuthMechanism;
- (void)_enterProcessingStateWithCompletionHandler:(id)a3;
- (void)_handleBiometricAuthFailureWithError:(id)a3 forContext:(id)a4;
- (void)_initializeAuthorizationButton;
- (void)_performPasscodeValidations:(id)a3;
- (void)_setGlyphViewGestureRecognizerEnabled:(BOOL)a3;
- (void)_setupAlertImageWithConstraints:(id)a3;
- (void)_setupBioButtonWithConstraints:(id)a3;
- (void)_setupLabelWithTitle:(id)a3 withConstraints:(id)a4 animated:(BOOL)a5;
- (void)_switchToBioView:(BOOL)a3 withEnabled:(BOOL)a4 showAlert:(BOOL)a5 alertString:(id)a6;
- (void)_switchToPasscode;
- (void)_updateLabelWithTitle:(id)a3;
- (void)_waitForTimeInterval:(double)a3 withGroup:(id)a4;
- (void)_windowDidBecomeKey:(id)a3;
- (void)addToConstraints:(id)a3 context:(id)a4;
- (void)addToStackView:(id)a3 context:(id)a4;
- (void)authenticationResult:(id)a3 error:(id)a4 context:(id)a5;
- (void)bioAuthFailWithAlertString:(id)a3;
- (void)dealloc;
- (void)enableAuthorizationCapability:(BOOL)a3;
- (void)finishProcessingWithCompletionHandler:(id)a3;
- (void)invalidateProcessingState;
- (void)processAuthenticationSuccessWithCompletionHandler:(id)a3;
- (void)resetToDefault;
- (void)setBioLabel:(id)a3;
- (void)setBioTextForInactiveState:(id)a3;
- (void)setBioView:(id)a3;
- (void)setButtonText:(id)a3;
- (void)setCanPerformBiometricValidation:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasTouchIDOnly:(BOOL)a3;
- (void)setIsPasscodeAuthorizationInProcess:(BOOL)a3;
- (void)setMainStackView:(id)a3;
- (void)setPresentationContext:(id)a3;
- (void)setUpButtonToPaneContext:(id)a3;
- (void)showAlertAndContinueWithPassword:(BOOL)a3;
- (void)switchToAccountCreation;
@end

@implementation AKAuthorizationSubPaneConfirmButton

- (AKAuthorizationSubPaneConfirmButton)initWithPresentationContext:(id)a3
{
  id v5 = a3;
  v6 = [(id)objc_opt_class() _createMainStackView];
  v13.receiver = self;
  v13.super_class = (Class)AKAuthorizationSubPaneConfirmButton;
  v7 = [(AKAuthorizationSubPane *)&v13 initWithView:v6];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_mainStackView, v6);
    objc_storeStrong((id *)&v8->_presentationContext, a3);
    v9 = [MEMORY[0x1E4F4F010] currentDevice];
    -[AKAuthorizationSubPaneConfirmButton setCanPerformBiometricValidation:](v8, "setCanPerformBiometricValidation:", [v9 isBiometricAuthCapable]);

    if ([(AKAuthorizationSubPaneConfirmButton *)v8 canPerformBiometricValidation])
    {
      v10 = [MEMORY[0x1E4F4F010] currentDevice];
      -[AKAuthorizationSubPaneConfirmButton setHasTouchIDOnly:](v8, "setHasTouchIDOnly:", [v10 isFaceIDCapable] ^ 1);
    }
    else
    {
      [(AKAuthorizationSubPaneConfirmButton *)v8 setHasTouchIDOnly:0];
    }
    [(AKAuthorizationSubPaneConfirmButton *)v8 _initializeAuthorizationButton];
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v8 selector:sel__windowDidBecomeKey_ name:*MEMORY[0x1E4F43EF0] object:0];
  }
  return v8;
}

- (void)_initializeAuthorizationButton
{
  v42[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F42FF0]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  authorizationButtonContainer = self->_authorizationButtonContainer;
  self->_authorizationButtonContainer = v8;

  [(UIView *)self->_authorizationButtonContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v39 = [(AKAuthorizationSubPaneConfirmButton *)self _shouldUseSIWAButton];
  if (v39)
  {
    v10 = [(AKAuthorizationSubPaneConfirmButton *)self presentationContext];
    v11 = [v10 credentialRequestContext];
    v12 = [v11 authorizationRequest];
    uint64_t v13 = [v12 existingStatus];

    BOOL v14 = [(AKAuthorizationSubPaneConfirmButton *)self _isSubscriptionFlow];
    BOOL v15 = v13 != 1 && v14;
    v16 = +[AKAuthorizationAppleIDButton buttonWithType:v15 style:3];
  }
  else
  {
    v16 = -[AKAuthorizationContinueButton initWithFrame:]([AKAuthorizationContinueButton alloc], "initWithFrame:", v4, v5, v6, v7);
  }
  authorizationButton = self->_authorizationButton;
  self->_authorizationButton = &v16->super;

  [(AKAuthorizationButton *)self->_authorizationButton setAccessibilityIdentifier:@"SIWA_CONTINUE_BUTTON"];
  [(AKAuthorizationButton *)self->_authorizationButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_authorizationButtonContainer addSubview:self->_authorizationButton];
  [(UIStackView *)self->_mainStackView addArrangedSubview:self->_authorizationButtonContainer];
  v33 = (void *)MEMORY[0x1E4F28DC8];
  v38 = [(AKAuthorizationButton *)self->_authorizationButton centerXAnchor];
  v37 = [(UIView *)self->_authorizationButtonContainer centerXAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v42[0] = v36;
  v35 = [(AKAuthorizationButton *)self->_authorizationButton centerYAnchor];
  v34 = [(UIView *)self->_authorizationButtonContainer centerYAnchor];
  v18 = [v35 constraintEqualToAnchor:v34];
  v42[1] = v18;
  v19 = [(UIView *)self->_authorizationButtonContainer widthAnchor];
  v20 = [(AKAuthorizationButton *)self->_authorizationButton widthAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v42[2] = v21;
  v22 = [(UIView *)self->_authorizationButtonContainer heightAnchor];
  v23 = [(AKAuthorizationButton *)self->_authorizationButton heightAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  v42[3] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
  [v33 activateConstraints:v25];

  v26 = (void *)MEMORY[0x1E4F28DC8];
  v27 = [(AKAuthorizationButton *)self->_authorizationButton heightAnchor];
  v28 = v27;
  if (v39)
  {
    v29 = [v27 constraintEqualToConstant:40.0];
    v41[0] = v29;
    v30 = [(AKAuthorizationButton *)self->_authorizationButton widthAnchor];
    v31 = [v30 constraintEqualToConstant:180.0];
    v41[1] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
    [v26 activateConstraints:v32];
  }
  else
  {
    +[AKAuthorizationPaneMetrics continueButtonHeight];
    v29 = objc_msgSend(v28, "constraintEqualToConstant:");
    v40 = v29;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
    [v26 activateConstraints:v30];
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationSubPaneConfirmButton;
  [(AKAuthorizationSubPaneConfirmButton *)&v4 dealloc];
}

- (NSString)buttonText
{
  v2 = [(AKAuthorizationSubPaneConfirmButton *)self authorizationButton];
  id v3 = [v2 buttonText];

  return (NSString *)v3;
}

- (void)setButtonText:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAuthorizationSubPaneConfirmButton *)self authorizationButton];
  [v5 setButtonText:v4];
}

- (BOOL)_shouldUseSIWAButton
{
  id v3 = [(AKAuthorizationSubPaneConfirmButton *)self presentationContext];
  id v4 = [v3 credentialRequestContext];
  id v5 = [v4 authorizationRequest];
  BOOL v6 = [v5 isEligibleForUpgradeFromPassword]
    && ![(AKAuthorizationSubPaneConfirmButton *)self hasTouchIDOnly]
    || [(AKAuthorizationSubPaneConfirmButton *)self _isSubscriptionFlow];

  return v6;
}

- (BOOL)_isSubscriptionFlow
{
  v2 = [(AKAuthorizationSubPaneConfirmButton *)self presentationContext];
  id v3 = [v2 credentialRequestContext];
  char v4 = [v3 _clientShouldAuthenticateExternally];

  return v4;
}

- (void)addToStackView:(id)a3 context:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AKAuthorizationSubPaneConfirmButton;
  id v6 = a4;
  [(AKAuthorizationSubPane *)&v7 addToStackView:a3 context:v6];
  -[AKAuthorizationSubPaneConfirmButton setContext:](self, "setContext:", v6, v7.receiver, v7.super_class);
}

- (void)addToConstraints:(id)a3 context:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationSubPaneConfirmButton;
  [(AKAuthorizationSubPane *)&v4 addToConstraints:a3 context:a4];
}

- (void)setUpButtonToPaneContext:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  objc_super v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  id v6 = [v4 bundleForClass:objc_opt_class()];
  objc_super v7 = [v6 localizedStringForKey:@"AUTHORIZE_BUTTON_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];

  v8 = [(AKAuthorizationSubPaneConfirmButton *)self presentationContext];
  v9 = [v8 credentialRequestContext];
  int v10 = [v9 _shouldSkipBiometrics];

  if (v10)
  {
    v11 = _AKLogSiwa();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_1C38C1000, v11, OS_LOG_TYPE_DEFAULT, "AKAuthorizationSubPaneConfirmButton - Skipping biometrics", v31, 2u);
    }

    v12 = sel__authorizationButtonSkipBioSelected_;
  }
  else
  {
    uint64_t v13 = [(AKAuthorizationSubPaneConfirmButton *)self presentationContext];
    BOOL v14 = [v13 credentialRequestContext];
    int v15 = [v14 _clientShouldAuthenticateExternally];

    if (v15)
    {
      v16 = _AKLogSiwa();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_1C38C1000, v16, OS_LOG_TYPE_DEFAULT, "AKAuthorizationSubPaneConfirmButton - Skipping biometrics and Authentication", v31, 2u);
      }

      v12 = sel__authorizationButtonExternalAuthenticationSelected_;
    }
    else
    {
      v17 = [(AKAuthorizationSubPaneConfirmButton *)self presentationContext];
      v18 = [v17 credentialRequestContext];
      int v19 = [v18 _requirePassword];

      if (v19)
      {
        v20 = _AKLogSiwa();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v31 = 0;
          _os_log_impl(&dword_1C38C1000, v20, OS_LOG_TYPE_DEFAULT, "AKAuthorizationSubPaneConfirmButton - Request requires password or device is not protected with passcode.", v31, 2u);
        }

        uint64_t v21 = [(AKAuthorizationSubPaneConfirmButton *)self _passwordButtonTitle];

        v12 = sel__authorizationButtonWithAccountPasswordSelected_;
      }
      else
      {
        BOOL v22 = [(AKAuthorizationSubPaneConfirmButton *)self canPerformBiometricValidation];
        v23 = _AKLogSiwa();
        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        if (v22)
        {
          if (v24)
          {
            *(_WORD *)v31 = 0;
            _os_log_impl(&dword_1C38C1000, v23, OS_LOG_TYPE_DEFAULT, "AKAuthorizationSubPaneConfirmButton - Can perform biometric auth.", v31, 2u);
          }

          v12 = sel__authorizationButtonBioSelected_;
          uint64_t v21 = [(AKAuthorizationSubPaneConfirmButton *)self _bioButtonTitle];
        }
        else
        {
          if (v24)
          {
            *(_WORD *)v31 = 0;
            _os_log_impl(&dword_1C38C1000, v23, OS_LOG_TYPE_DEFAULT, "AKAuthorizationSubPaneConfirmButton - Falling back to passcode.", v31, 2u);
          }

          uint64_t v21 = [(AKAuthorizationSubPaneConfirmButton *)self _passcodeButtonTitle];

          v12 = sel__authorizationWithPasscodeButtonSelected_;
        }
      }
      objc_super v7 = (void *)v21;
    }
  }
  [(AKAuthorizationButton *)self->_authorizationButton setButtonText:v7];
  v25 = [v5 mutableConstraints];
  v26 = [(UIStackView *)self->_mainStackView widthAnchor];
  v27 = [v5 stackView];

  v28 = [v27 widthAnchor];
  v29 = [v26 constraintEqualToAnchor:v28];
  v32[0] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  [v25 addObjectsFromArray:v30];

  [(AKAuthorizationButton *)self->_authorizationButton addTarget:self action:v12];
}

- (BOOL)_delegate_validateReadyForAuthorization
{
  v2 = [(AKAuthorizationSubPaneConfirmButton *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 validateReadyForAuthorization];
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (void)_authorizationButtonExternalAuthenticationSelected:(id)a3
{
  id v4 = [(AKAuthorizationSubPaneConfirmButton *)self delegate];
  if ([(AKAuthorizationSubPaneConfirmButton *)self _delegate_validateReadyForAuthorization]&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v4 subPaneConfirmButtonPerformExternalAuthentication:self];
  }
}

- (void)_authorizationButtonSkipBioSelected:(id)a3
{
  id v4 = [(AKAuthorizationSubPaneConfirmButton *)self delegate];
  if ([(AKAuthorizationSubPaneConfirmButton *)self _delegate_validateReadyForAuthorization])
  {
    [v4 performAuthorization];
  }
}

- (void)_authorizationButtonWithAccountPasswordSelected:(id)a3
{
  id v4 = [(AKAuthorizationSubPaneConfirmButton *)self delegate];
  if ([(AKAuthorizationSubPaneConfirmButton *)self _delegate_validateReadyForAuthorization])
  {
    [v4 performPasswordAuthentication];
  }
}

- (void)_authorizationButtonBioSelected:(id)a3
{
  if ([(AKAuthorizationSubPaneConfirmButton *)self _delegate_validateReadyForAuthorization])
  {
    [(AKAuthorizationSubPaneConfirmButton *)self _switchToBioView:1 withEnabled:1 showAlert:0 alertString:0];
  }
}

- (void)_authorizationWithPasscodeButtonSelected:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AKAuthorizationSubPaneConfirmButton *)self isPasscodeAuthorizationInProcess];
  id v6 = _AKLogSiwa();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1C38C1000, v6, OS_LOG_TYPE_DEFAULT, "Passcode/Password authorization is already in progress, so ignoring this request.", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    if (v7)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1C38C1000, v6, OS_LOG_TYPE_DEFAULT, "Starting Passcode/Password authorization", (uint8_t *)buf, 2u);
    }

    if ([(AKAuthorizationSubPaneConfirmButton *)self _delegate_validateReadyForAuthorization])
    {
      [(AKAuthorizationSubPaneConfirmButton *)self setIsPasscodeAuthorizationInProcess:1];
      objc_initWeak(buf, self);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __80__AKAuthorizationSubPaneConfirmButton__authorizationWithPasscodeButtonSelected___block_invoke;
      v8[3] = &unk_1E648FEA8;
      objc_copyWeak(&v9, buf);
      [(AKAuthorizationSubPaneConfirmButton *)self _performPasscodeValidations:v8];
      objc_destroyWeak(&v9);
      objc_destroyWeak(buf);
    }
  }
}

void __80__AKAuthorizationSubPaneConfirmButton__authorizationWithPasscodeButtonSelected___block_invoke(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = _AKLogSiwa();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = @"NO";
      if (a2) {
        BOOL v5 = @"YES";
      }
      int v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1C38C1000, v4, OS_LOG_TYPE_DEFAULT, "Passcode/Password completed with response: %@", (uint8_t *)&v7, 0xCu);
    }

    if (a2)
    {
      id v6 = [WeakRetained delegate];
      [v6 performAuthorization];
    }
    [WeakRetained setIsPasscodeAuthorizationInProcess:0];
  }
}

- (void)_disableBioView
{
}

- (void)bioAuthFailWithAlertString:(id)a3
{
}

- (void)enableAuthorizationCapability:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(AKAuthorizationSubPaneConfirmButton *)self hasTouchIDOnly]) {
    goto LABEL_5;
  }
  BOOL v5 = [(AKAuthorizationSubPaneConfirmButton *)self presentationContext];
  id v6 = [v5 credentialRequestContext];
  if ([v6 _requirePassword])
  {

LABEL_5:
    v8 = self;
    uint64_t v9 = 0;
    uint64_t v10 = v3;
    goto LABEL_6;
  }
  BOOL v7 = [(AKAuthorizationSubPaneConfirmButton *)self _isSubscriptionFlow];

  if (v7) {
    goto LABEL_5;
  }
  v8 = self;
  uint64_t v9 = 1;
  uint64_t v10 = 1;
LABEL_6:

  [(AKAuthorizationSubPaneConfirmButton *)v8 _switchToBioView:v9 withEnabled:v10 showAlert:0 alertString:0];
}

- (void)showAlertAndContinueWithPassword:(BOOL)a3
{
  BOOL v3 = a3;
  [(AKAuthorizationSubPaneConfirmButton *)self _switchToBioView:0 withEnabled:1 showAlert:1 alertString:0];
  if (v3)
  {
    BOOL v5 = [(AKAuthorizationSubPaneConfirmButton *)self presentationContext];
    id v6 = [v5 credentialRequestContext];
    objc_msgSend(v6, "set_requirePassword:", 1);

    authorizationButton = self->_authorizationButton;
    v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"AUTHORIZE_BUTTON_TITLE_PASSWORD_MODERN" value:&stru_1F1EE8138 table:@"Localizable"];
    [(AKAuthorizationButton *)authorizationButton setButtonText:v9];

    [(AKAuthorizationButton *)self->_authorizationButton addTarget:self action:sel__authorizationButtonWithAccountPasswordSelected_];
  }
  dispatch_time_t v10 = dispatch_time(0, 1700000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__AKAuthorizationSubPaneConfirmButton_showAlertAndContinueWithPassword___block_invoke;
  block[3] = &unk_1E648EF28;
  block[4] = self;
  dispatch_after(v10, MEMORY[0x1E4F14428], block);
}

uint64_t __72__AKAuthorizationSubPaneConfirmButton_showAlertAndContinueWithPassword___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _switchToBioView:0 withEnabled:1 showAlert:0 alertString:0];
}

- (void)_windowDidBecomeKey:(id)a3
{
  id v4 = [(AKAuthorizationSubPaneConfirmButton *)self bioView];
  int v5 = objc_msgSend(v4, "isMechanismEnabled:", -[AKAuthorizationSubPaneConfirmButton _authenticationMechanism](self, "_authenticationMechanism"));

  if (v5)
  {
    id v6 = _AKLogSiwa();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[AKAuthorizationSubPaneConfirmButton _windowDidBecomeKey:](v6, v7, v8, v9, v10, v11, v12, v13);
    }

    [(AKAuthorizationSubPaneConfirmButton *)self _enableLAUIAuthMechanism];
  }
}

- (void)_switchToBioView:(BOOL)a3 withEnabled:(BOOL)a4 showAlert:(BOOL)a5 alertString:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  if (!v8
    || !v7
    || ([(AKAuthorizationSubPaneConfirmButton *)self bioView],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v13 = [(AKAuthorizationSubPaneConfirmButton *)self mainStackView];
    BOOL v14 = [v13 subviews];
    int v15 = (void *)[v14 copy];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v37;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v37 != v18) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v36 + 1) + 8 * v19++) removeFromSuperview];
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v17);
    }

    if (v6)
    {
      v20 = _AKLogSiwa();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C38C1000, v20, OS_LOG_TYPE_DEFAULT, "Showing Authorization UI Alert", buf, 2u);
      }

      [(AKAuthorizationSubPaneConfirmButton *)self _disableBioView];
      [(AKAuthorizationSubPaneConfirmButton *)self _addArrangedSpaceToMainStackView:12.0];
      id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(AKAuthorizationSubPaneConfirmButton *)self _setupAlertImageWithConstraints:v21];
      if (v10)
      {
        [(AKAuthorizationSubPaneConfirmButton *)self _setupLabelWithTitle:v10 withConstraints:v21 animated:1];
      }
      else
      {
        v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v33 = [v32 localizedStringForKey:@"AUTH_ALERT_SIGN_UP_NOT_COMPLETED" value:&stru_1F1EE8138 table:@"Localizable"];
        [(AKAuthorizationSubPaneConfirmButton *)self _setupLabelWithTitle:v33 withConstraints:v21 animated:1];
      }
      [MEMORY[0x1E4F28DC8] activateConstraints:v21];
      goto LABEL_31;
    }
    if (!v8)
    {
      [(AKAuthorizationSubPaneConfirmButton *)self _disableBioView];
      v29 = [(AKAuthorizationSubPaneConfirmButton *)self mainStackView];
      v30 = [(AKAuthorizationSubPaneConfirmButton *)self authorizationButtonContainer];
      [v29 addArrangedSubview:v30];

      v31 = [(AKAuthorizationSubPaneConfirmButton *)self authorizationButton];
      [v31 setEnabled:v7];

      goto LABEL_32;
    }
    BOOL v22 = _AKLogSiwa();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C38C1000, v22, OS_LOG_TYPE_DEFAULT, "Switch to enabled bio view.", buf, 2u);
    }

    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(AKAuthorizationSubPaneConfirmButton *)self _setupBioButtonWithConstraints:v21];
    if ([(AKAuthorizationSubPaneConfirmButton *)self hasTouchIDOnly])
    {
      v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      BOOL v24 = [v23 localizedStringForKey:@"BIO_BUTTON_CONTINUE_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];
      v25 = self;
      v26 = v24;
      id v27 = v21;
      uint64_t v28 = 0;
    }
    else
    {
      v34 = [MEMORY[0x1E4F4F010] currentDevice];
      int v35 = [v34 isFaceIDCapable];

      if (!v35)
      {
LABEL_30:
        [MEMORY[0x1E4F28DC8] activateConstraints:v21];
        [(AKAuthorizationSubPaneConfirmButton *)self _enableLAUIAuthMechanism];
LABEL_31:

        goto LABEL_32;
      }
      v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      BOOL v24 = [v23 localizedStringForKey:@"BIO_BUTTON_PEARL_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];
      v25 = self;
      v26 = v24;
      id v27 = v21;
      uint64_t v28 = 1;
    }
    [(AKAuthorizationSubPaneConfirmButton *)v25 _setupLabelWithTitle:v26 withConstraints:v27 animated:v28];

    goto LABEL_30;
  }
  uint64_t v12 = _AKLogSiwa();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v12, OS_LOG_TYPE_DEFAULT, "Already switched to bio view.", buf, 2u);
  }

  [(AKAuthorizationSubPaneConfirmButton *)self _enableLAUIAuthMechanism];
LABEL_32:
}

- (void)_enableLAUIAuthMechanism
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AKAuthorizationSubPaneConfirmButton__enableLAUIAuthMechanism__block_invoke;
  block[3] = &unk_1E648EF28;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __63__AKAuthorizationSubPaneConfirmButton__enableLAUIAuthMechanism__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) bioView];
  uint64_t v3 = [*(id *)(a1 + 32) _authenticationMechanism];
  id v21 = 0;
  char v4 = [v2 enableMechanism:v3 error:&v21];
  id v5 = v21;

  BOOL v6 = _AKLogSiwa();
  BOOL v7 = v6;
  if (v5 || (v4 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __63__AKAuthorizationSubPaneConfirmButton__enableLAUIAuthMechanism__block_invoke_cold_2((uint64_t)v5, v7, v15, v16, v17, v18, v19, v20);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __63__AKAuthorizationSubPaneConfirmButton__enableLAUIAuthMechanism__block_invoke_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (id)_spaceWithConstant:(double)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  id v5 = [v4 heightAnchor];
  BOOL v6 = [v5 constraintEqualToConstant:a3];
  [v4 addConstraint:v6];

  return v4;
}

- (void)_addArrangedSpaceToMainStackView:(double)a3
{
  id v5 = [(AKAuthorizationSubPaneConfirmButton *)self _spaceWithConstant:a3];
  id v4 = [(AKAuthorizationSubPaneConfirmButton *)self mainStackView];
  [v4 addArrangedSubview:v5];
}

- (void)_setupLabelWithTitle:(id)a3 withConstraints:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v16 = (__CFString *)a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v8 = [MEMORY[0x1E4F42A40] defaultMetrics];
  uint64_t v9 = [MEMORY[0x1E4F42A30] systemFontOfSize:15.0 weight:*MEMORY[0x1E4F43928]];
  uint64_t v10 = [v8 scaledFontForFont:v9];
  [v7 setFont:v10];

  [v7 setTextAlignment:1];
  [v7 setNumberOfLines:1];
  [v7 setAdjustsFontSizeToFitWidth:0];
  [v7 setAdjustsFontForContentSizeCategory:1];
  if (v5) {
    uint64_t v11 = &stru_1F1EE8138;
  }
  else {
    uint64_t v11 = v16;
  }
  [v7 setText:v11];
  uint64_t v12 = [(AKAuthorizationSubPaneConfirmButton *)self mainStackView];
  [v12 addArrangedSubview:v7];

  uint64_t v13 = [(AKAuthorizationSubPaneConfirmButton *)self bioView];

  if (v13)
  {
    uint64_t v14 = [(AKAuthorizationSubPaneConfirmButton *)self mainStackView];
    uint64_t v15 = [(AKAuthorizationSubPaneConfirmButton *)self bioView];
    [v14 setCustomSpacing:v15 afterView:12.0];
  }
  [(AKAuthorizationSubPaneConfirmButton *)self setBioLabel:v7];
  if (v5) {
    [(AKAuthorizationSubPaneConfirmButton *)self _updateLabelWithTitle:v16];
  }
}

- (void)_setupBioButtonWithConstraints:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F72FB0];
  id v5 = a3;
  BOOL v6 = objc_msgSend([v4 alloc], "initWithFrame:mechanisms:", -[AKAuthorizationSubPaneConfirmButton _authenticationMechanism](self, "_authenticationMechanism"), 0.0, 0.0, 50.0, 50.0);
  [(AKAuthorizationSubPaneConfirmButton *)self setBioView:v6];

  id v7 = [(AKAuthorizationSubPaneConfirmButton *)self bioView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v8 = [(AKAuthorizationSubPaneConfirmButton *)self bioView];
  [v8 setDelegate:self];

  uint64_t v9 = [(AKAuthorizationSubPaneConfirmButton *)self mainStackView];
  uint64_t v10 = [(AKAuthorizationSubPaneConfirmButton *)self bioView];
  [v9 addArrangedSubview:v10];

  uint64_t v11 = [(AKAuthorizationSubPaneConfirmButton *)self bioView];
  uint64_t v12 = [v11 widthAnchor];
  uint64_t v13 = [v12 constraintEqualToConstant:50.0];
  v18[0] = v13;
  uint64_t v14 = [(AKAuthorizationSubPaneConfirmButton *)self bioView];
  uint64_t v15 = [v14 heightAnchor];
  uint64_t v16 = [v15 constraintEqualToConstant:50.0];
  v18[1] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  [v5 addObjectsFromArray:v17];
}

- (void)_setupAlertImageWithConstraints:(id)a3
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F42AA0];
  id v19 = a3;
  id v5 = objc_alloc_init(v4);
  BOOL v6 = [MEMORY[0x1E4F428B8] systemRedColor];
  [v5 setTintColor:v6];

  id v7 = [MEMORY[0x1E4F42A98] configurationWithPointSize:3 weight:50.0];
  [v5 setPreferredSymbolConfiguration:v7];

  uint64_t v8 = [MEMORY[0x1E4F42A80] systemImageNamed:@"exclamationmark.circle"];
  [v5 setImage:v8];

  [v5 setContentMode:1];
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, 50.0, 50.0);
  uint64_t v9 = [(AKAuthorizationSubPaneConfirmButton *)self mainStackView];
  [v9 addArrangedSubview:v5];

  uint64_t v18 = [v5 heightAnchor];
  uint64_t v10 = [v18 constraintEqualToConstant:50.0];
  v20[0] = v10;
  uint64_t v11 = [v5 widthAnchor];
  uint64_t v12 = [v11 constraintEqualToConstant:50.0];
  v20[1] = v12;
  uint64_t v13 = [v5 centerXAnchor];
  uint64_t v14 = [(AKAuthorizationSubPane *)self view];
  uint64_t v15 = [v14 centerXAnchor];
  uint64_t v16 = [v13 constraintEqualToAnchor:v15];
  v20[2] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  [v19 addObjectsFromArray:v17];
}

- (void)_updateLabelWithTitle:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F39D18];
  id v5 = a3;
  id v11 = [v4 animation];
  BOOL v6 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
  [v11 setTimingFunction:v6];

  uint64_t v7 = *MEMORY[0x1E4F3A5B8];
  [v11 setType:*MEMORY[0x1E4F3A5B8]];
  [v11 setDuration:0.15];
  uint64_t v8 = [(AKAuthorizationSubPaneConfirmButton *)self bioLabel];
  uint64_t v9 = [v8 layer];
  [v9 addAnimation:v11 forKey:v7];

  uint64_t v10 = [(AKAuthorizationSubPaneConfirmButton *)self bioLabel];
  [v10 setText:v5];
}

+ (id)_createMainStackView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F42E20]);
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  id v4 = [v3 localizedStringForKey:@"AUTHORIZE_BUTTON_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];
  [v2 setAccessibilityIdentifier:v4];

  [v2 setSpacing:0.0];
  [v2 setAlignment:3];
  [v2 setAxis:1];
  [v2 setDistribution:0];
  id v5 = [MEMORY[0x1E4F428B8] clearColor];
  [v2 setBackgroundColor:v5];

  return v2;
}

- (BOOL)_hasTouchIDOnly
{
  id v2 = [MEMORY[0x1E4F4F010] currentDevice];
  char v3 = [v2 usesTouchID];

  return v3;
}

- (BOOL)_isUpgradeFromPassword
{
  id v2 = [(AKAuthorizationSubPaneConfirmButton *)self presentationContext];
  char v3 = [v2 credentialRequestContext];
  char v4 = [v3 _isEligibleForUpgradeFromPassword];

  return v4;
}

- (void)authenticationResult:(id)a3 error:(id)a4 context:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _AKLogSiwa();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v10;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl(&dword_1C38C1000, v11, OS_LOG_TYPE_DEFAULT, "biometric authentication context: %@ result: %@", (uint8_t *)&v12, 0x16u);
  }

  if (v9) {
    [(AKAuthorizationSubPaneConfirmButton *)self _handleBiometricAuthFailureWithError:v9 forContext:v10];
  }
}

- (void)processAuthenticationSuccessWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__AKAuthorizationSubPaneConfirmButton_processAuthenticationSuccessWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E648F2A0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __89__AKAuthorizationSubPaneConfirmButton_processAuthenticationSuccessWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  char v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"AUTH_PROCESSING_LOADING" value:&stru_1F1EE8138 table:@"Localizable"];
  [v2 _updateLabelWithTitle:v4];

  [*(id *)(a1 + 32) _enterProcessingStateWithCompletionHandler:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 32) _hasTouchIDOnly]) {
    [*(id *)(a1 + 32) _waitForTimeInterval:*(void *)(*(void *)(a1 + 32) + 40) withGroup:2.2];
  }
  id v5 = [*(id *)(a1 + 32) delegate];
  [v5 subPaneConfirmButtonDidEnterProcessingState:*(void *)(a1 + 32)];
}

- (void)_checkIfPasscodeFallbackAllowedWithCompletion:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  v9[0] = &unk_1F1F03780;
  v9[1] = &unk_1F1F03798;
  v10[0] = MEMORY[0x1E4F1CC38];
  v10[1] = MEMORY[0x1E4F1CC38];
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__AKAuthorizationSubPaneConfirmButton__checkIfPasscodeFallbackAllowedWithCompletion___block_invoke;
  v7[3] = &unk_1E648F4C0;
  id v8 = v3;
  id v6 = v3;
  [v4 evaluatePolicy:1025 options:v5 reply:v7];
}

void __85__AKAuthorizationSubPaneConfirmButton__checkIfPasscodeFallbackAllowedWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _AKLogSiwa();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1C38C1000, v6, OS_LOG_TYPE_DEFAULT, "Location based device policy preflight passcode validation returned with error %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, a2 != 0);
  }
}

- (void)_handleBiometricAuthFailureWithError:(id)a3 forContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 domain];
  if ([v8 isEqualToString:*MEMORY[0x1E4F30B38]])
  {
    if ([v6 code] == -8)
    {

LABEL_9:
      int v12 = _AKLogSiwa();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v18 = v7;
        __int16 v19 = 2112;
        id v20 = v6;
        _os_log_impl(&dword_1C38C1000, v12, OS_LOG_TYPE_DEFAULT, "biometric lockedout: %@ error: %@", buf, 0x16u);
      }

      id v13 = [(AKAuthorizationSubPaneConfirmButton *)self presentationContext];
      __int16 v14 = [v13 credentialRequestContext];
      int v15 = [v14 _isFirstPartyLogin];

      if (v15)
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __87__AKAuthorizationSubPaneConfirmButton__handleBiometricAuthFailureWithError_forContext___block_invoke;
        v16[3] = &unk_1E648F208;
        v16[4] = self;
        [(AKAuthorizationSubPaneConfirmButton *)self _checkIfPasscodeFallbackAllowedWithCompletion:v16];
      }
      else
      {
        [(AKAuthorizationSubPaneConfirmButton *)self _switchToPasscode];
      }
      goto LABEL_14;
    }
    uint64_t v9 = [v6 code];

    if (v9 == -1) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  uint64_t v10 = _AKLogSiwa();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_1C38C1000, v10, OS_LOG_TYPE_DEFAULT, "biometric authentication context: %@ error: %@", buf, 0x16u);
  }

  id v11 = [(AKAuthorizationSubPaneConfirmButton *)self delegate];
  [v11 subpaneConfirmButtonDidFailBiometry:self];

LABEL_14:
}

uint64_t __87__AKAuthorizationSubPaneConfirmButton__handleBiometricAuthFailureWithError_forContext___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _switchToPasscode];
  }
  return result;
}

- (void)_enterProcessingStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (*(_OWORD *)&self->_processingStateCompletionHandler == 0)
  {
    id v6 = (OS_dispatch_group *)dispatch_group_create();
    processingStateGroup = self->_processingStateGroup;
    self->_processingStateGroup = v6;

    int v8 = (void *)MEMORY[0x1C8777520](v4);
    id processingStateCompletionHandler = self->_processingStateCompletionHandler;
    self->_id processingStateCompletionHandler = v8;

    [(AKAuthorizationSubPaneConfirmButton *)self _setGlyphViewGestureRecognizerEnabled:0];
  }
  else
  {
    id v5 = _AKLogSiwa();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1C38C1000, v5, OS_LOG_TYPE_DEFAULT, "AKAuthorizationSubPaneConfirmButton already in processing state, ignoring attempt.", v10, 2u);
    }
  }
}

- (void)finishProcessingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__AKAuthorizationSubPaneConfirmButton_finishProcessingWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E648F2A0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __77__AKAuthorizationSubPaneConfirmButton_finishProcessingWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = MEMORY[0x1C8777520](*(void *)(*(void *)(a1 + 32) + 32));
  if ((unint64_t)v2 | v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"AUTH_PROCESSING_COMPLETE" value:&stru_1F1EE8138 table:@"Localizable"];
    [v4 _updateLabelWithTitle:v6];

    [*(id *)(a1 + 32) _waitForTimeInterval:v2 withGroup:1.0];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    objc_initWeak(&location, *(id *)(a1 + 32));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__AKAuthorizationSubPaneConfirmButton_finishProcessingWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E648FBE8;
    objc_copyWeak(&v9, &location);
    id v8 = *(id *)(a1 + 40);
    dispatch_group_notify(v2, MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __77__AKAuthorizationSubPaneConfirmButton_finishProcessingWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidateProcessingState];

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

- (void)invalidateProcessingState
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__AKAuthorizationSubPaneConfirmButton_invalidateProcessingState__block_invoke;
  block[3] = &unk_1E648EF28;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __64__AKAuthorizationSubPaneConfirmButton_invalidateProcessingState__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;

  id v6 = *(void **)(a1 + 32);

  return [v6 _setGlyphViewGestureRecognizerEnabled:1];
}

- (void)_waitForTimeInterval:(double)a3 withGroup:(id)a4
{
  id v5 = a4;
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_group_enter(v5);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__AKAuthorizationSubPaneConfirmButton__waitForTimeInterval_withGroup___block_invoke;
  block[3] = &unk_1E648EF28;
  id v9 = v5;
  id v7 = v5;
  dispatch_after(v6, MEMORY[0x1E4F14428], block);
}

void __70__AKAuthorizationSubPaneConfirmButton__waitForTimeInterval_withGroup___block_invoke(uint64_t a1)
{
}

- (void)_setGlyphViewGestureRecognizerEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(AKAuthorizationSubPaneConfirmButton *)self bioView];
  id v5 = [v4 subviews];
  id v9 = [v5 firstObject];

  dispatch_time_t v6 = v9;
  if (v9)
  {
    id v7 = [v9 gestureRecognizers];
    id v8 = [v7 firstObject];

    [v8 setEnabled:v3];
    dispatch_time_t v6 = v9;
  }
}

- (unint64_t)_authenticationMechanism
{
  return 4;
}

- (void)_switchToPasscode
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AKAuthorizationSubPaneConfirmButton__switchToPasscode__block_invoke;
  block[3] = &unk_1E648EF28;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __56__AKAuthorizationSubPaneConfirmButton__switchToPasscode__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v3 = (void *)v2[8];
  uint64_t v4 = [v2 _passcodeButtonTitle];
  [v3 setButtonText:v4];

  [*(id *)(*(void *)(a1 + 32) + 64) addTarget:*(void *)(a1 + 32) action:sel__authorizationWithPasscodeButtonSelected_];
  id v5 = *(void **)(a1 + 32);

  return [v5 _switchToBioView:0 withEnabled:1 showAlert:0 alertString:0];
}

- (id)_passwordButtonTitle
{
  int v2 = [(AKAuthorizationPresentationContext *)self->_presentationContext isSignInFlow];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = v3;
  if (v2) {
    id v5 = @"AUTHORIZE_BUTTON_TITLE_SIGN_IN_PASSWORD";
  }
  else {
    id v5 = @"AUTHORIZE_BUTTON_TITLE_CREATE_ACCOUNT_PASSWORD";
  }
  dispatch_time_t v6 = [v3 localizedStringForKey:v5 value:&stru_1F1EE8138 table:@"Localizable"];

  return v6;
}

- (id)_passcodeButtonTitle
{
  int v2 = [(AKAuthorizationPresentationContext *)self->_presentationContext isSignInFlow];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = v3;
  if (v2) {
    id v5 = @"AUTHORIZE_BUTTON_TITLE_SIGN_IN_PASSCODE";
  }
  else {
    id v5 = @"AUTHORIZE_BUTTON_TITLE_CREATE_ACCOUNT_PASSCODE";
  }
  dispatch_time_t v6 = [v3 localizedStringForKey:v5 value:&stru_1F1EE8138 table:@"Localizable"];

  return v6;
}

- (id)_bioButtonTitle
{
  int v3 = [(AKAuthorizationPresentationContext *)self->_presentationContext isSignInFlow];
  BOOL hasTouchIDOnly = self->_hasTouchIDOnly;
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  dispatch_time_t v6 = v5;
  id v7 = @"AUTHORIZE_BUTTON_TITLE_SIGN_IN_TOUCH_ID";
  if (!hasTouchIDOnly) {
    id v7 = @"AUTHORIZE_BUTTON_TITLE_SIGN_IN_DEFAULT";
  }
  id v8 = @"AUTHORIZE_BUTTON_TITLE_CREATE_ACCOUNT_DEFAULT";
  if (hasTouchIDOnly) {
    id v8 = @"AUTHORIZE_BUTTON_TITLE_CREATE_ACCOUNT_TOUCH_ID";
  }
  if (v3) {
    id v9 = v7;
  }
  else {
    id v9 = v8;
  }
  uint64_t v10 = [v5 localizedStringForKey:v9 value:&stru_1F1EE8138 table:@"Localizable"];

  return v10;
}

- (void)_performPasscodeValidations:(id)a3
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  v14[0] = &stru_1F1EE8138;
  v13[0] = &unk_1F1F037B0;
  v13[1] = &unk_1F1F037C8;
  dispatch_time_t v6 = [(AKAuthorizationPresentationContext *)self->_presentationContext localizedAppName];
  v14[1] = v6;
  v13[2] = &unk_1F1F037E0;
  id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"AUTHORIZE_PASSCODE_VALIDATION_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];
  v14[2] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__AKAuthorizationSubPaneConfirmButton__performPasscodeValidations___block_invoke;
  v11[3] = &unk_1E648F4C0;
  id v12 = v4;
  id v10 = v4;
  [v5 evaluatePolicy:1007 options:v9 reply:v11];
}

void __67__AKAuthorizationSubPaneConfirmButton__performPasscodeValidations___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  dispatch_time_t v6 = _AKLogSiwa();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __67__AKAuthorizationSubPaneConfirmButton__performPasscodeValidations___block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
  }

  (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0);
}

- (void)switchToAccountCreation
{
  authorizationButton = self->_authorizationButton;
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"AUTHORIZE_BUTTON_TITLE_LOGIN_OPTION_CREATE_NEW_ACCOUNT" value:&stru_1F1EE8138 table:@"Localizable"];
  [(AKAuthorizationButton *)authorizationButton setButtonText:v5];

  [(AKAuthorizationButton *)self->_authorizationButton addTarget:self action:sel__createAccountSelected];

  [(AKAuthorizationSubPaneConfirmButton *)self _switchToBioView:0 withEnabled:1 showAlert:0 alertString:0];
}

- (void)_createAccountSelected
{
  id v3 = [(AKAuthorizationSubPaneConfirmButton *)self delegate];
  if ([(AKAuthorizationSubPaneConfirmButton *)self _delegate_validateReadyForAuthorization]&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v3 subPaneConfirmButtonPerformAccountCreation:self];
  }
}

- (void)resetToDefault
{
  id v3 = [(AKAuthorizationSubPaneConfirmButton *)self context];
  [(AKAuthorizationSubPaneConfirmButton *)self setUpButtonToPaneContext:v3];
}

- (NSString)bioTextForInactiveState
{
  return self->_bioTextForInactiveState;
}

- (void)setBioTextForInactiveState:(id)a3
{
}

- (AKAuthorizationButton)authorizationButton
{
  return self->_authorizationButton;
}

- (AKAuthorizationSubPaneConfirmButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKAuthorizationSubPaneConfirmButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AKAuthorizationPaneContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (AKAuthorizationPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
}

- (UIStackView)mainStackView
{
  return self->_mainStackView;
}

- (void)setMainStackView:(id)a3
{
}

- (UIView)authorizationButtonContainer
{
  return self->_authorizationButtonContainer;
}

- (BOOL)hasTouchIDOnly
{
  return self->_hasTouchIDOnly;
}

- (void)setHasTouchIDOnly:(BOOL)a3
{
  self->_BOOL hasTouchIDOnly = a3;
}

- (BOOL)canPerformBiometricValidation
{
  return self->_canPerformBiometricValidation;
}

- (void)setCanPerformBiometricValidation:(BOOL)a3
{
  self->_canPerformBiometricValidation = a3;
}

- (UILabel)bioLabel
{
  return self->_bioLabel;
}

- (void)setBioLabel:(id)a3
{
}

- (LAUIAuthenticationView)bioView
{
  return self->_bioView;
}

- (void)setBioView:(id)a3
{
}

- (BOOL)isPasscodeAuthorizationInProcess
{
  return self->_isPasscodeAuthorizationInProcess;
}

- (void)setIsPasscodeAuthorizationInProcess:(BOOL)a3
{
  self->_isPasscodeAuthorizationInProcess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bioView, 0);
  objc_storeStrong((id *)&self->_bioLabel, 0);
  objc_storeStrong((id *)&self->_authorizationButtonContainer, 0);
  objc_storeStrong((id *)&self->_mainStackView, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_authorizationButton, 0);
  objc_storeStrong((id *)&self->_bioTextForInactiveState, 0);
  objc_storeStrong((id *)&self->_processingStateGroup, 0);

  objc_storeStrong(&self->_processingStateCompletionHandler, 0);
}

- (void)_windowDidBecomeKey:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __63__AKAuthorizationSubPaneConfirmButton__enableLAUIAuthMechanism__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __63__AKAuthorizationSubPaneConfirmButton__enableLAUIAuthMechanism__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __67__AKAuthorizationSubPaneConfirmButton__performPasscodeValidations___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end