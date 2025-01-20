@interface AMUIInlineAuthenticationViewController
- (AMAuthenticationHandling)authenticationHandler;
- (AMUIDateProviding)dateProvider;
- (AMUIInlineAuthenticationViewController)initWithUnlockDestination:(id)a3;
- (AMUIInlineAuthenticationViewControllerDelegate)delegate;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldSkipBiometricPresentation;
- (BOOL)_wantsBioUnlockBlocked;
- (id)_unlockReason;
- (id)passcode;
- (unint64_t)supportedInterfaceOrientations;
- (void)_attemptUnlockForBioUnlock:(BOOL)a3;
- (void)_handlePasscodeButtonAction;
- (void)_reset;
- (void)_setBiometricAuthenticationDisabled:(BOOL)a3;
- (void)_setBiometricAuthenticationDisabled:(BOOL)a3 resettingTimeout:(BOOL)a4;
- (void)_setDateTimeLayerHidden:(BOOL)a3;
- (void)_setPasscodeVisible:(BOOL)a3;
- (void)_setUpBiometricAuthenticationTimeout;
- (void)dealloc;
- (void)passcodeLockViewPasscodeEntered:(id)a3;
- (void)passcodeLockViewPasscodeEnteredViaMesa:(id)a3;
- (void)passcodeLockViewStateChange:(id)a3;
- (void)resetForFailedPasscode;
- (void)resetForSuccess;
- (void)setAuthenticationHandler:(id)a3;
- (void)setDateProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AMUIInlineAuthenticationViewController

- (AMUIInlineAuthenticationViewController)initWithUnlockDestination:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMUIInlineAuthenticationViewController;
  v6 = [(AMUIInlineAuthenticationViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_unlockDestination, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(NSTimer *)self->_biometricAuthenticationTimer invalidate];
  v3 = [(AMUIInlineAuthenticationViewController *)self delegate];
  [v3 authenticationViewController:self didSetBiometricAuthenticationDisabled:0];

  v4.receiver = self;
  v4.super_class = (Class)AMUIInlineAuthenticationViewController;
  [(AMUIInlineAuthenticationViewController *)&v4 dealloc];
}

- (void)setDateProvider:(id)a3
{
  p_dateProvider = &self->_dateProvider;
  objc_storeStrong((id *)&self->_dateProvider, a3);
  id v6 = a3;
  [(AMUIDateTimeDataLayerViewController *)self->_dateTimeLayerViewController setDateProvider:*p_dateProvider];
}

- (void)viewDidLoad
{
  v54[3] = *MEMORY[0x263EF8340];
  v53.receiver = self;
  v53.super_class = (Class)AMUIInlineAuthenticationViewController;
  [(AMUIInlineAuthenticationViewController *)&v53 viewDidLoad];
  id val = [(AMUIInlineAuthenticationViewController *)self view];
  [val bounds];
  objc_super v4 = v3;
  id v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = [MEMORY[0x263F53FE8] materialViewWithRecipe:53];
  materialView = self->_materialView;
  self->_materialView = v11;

  [(MTMaterialView *)self->_materialView setOverrideUserInterfaceStyle:2];
  -[MTMaterialView setFrame:](self->_materialView, "setFrame:", *(double *)&v4, *(double *)&v6, *(double *)&v8, *(double *)&v10);
  [val addSubview:self->_materialView];
  v13 = [MEMORY[0x263F79740] passcodeLockViewForUsersCurrentStyle];
  passcodeView = self->_passcodeView;
  self->_passcodeView = v13;

  [(SBUIPasscodeLockView *)self->_passcodeView setDelegate:self];
  [(SBUIPasscodeLockView *)self->_passcodeView setUnlockDestination:self->_unlockDestination];
  [(SBUIPasscodeLockView *)self->_passcodeView setShowsCancelButton:0];
  [(SBUIPasscodeLockView *)self->_passcodeView setShowsEmergencyCallButton:0];
  [(SBUIPasscodeLockView *)self->_passcodeView setUsesBiometricPresentation:[(AMUIInlineAuthenticationViewController *)self _shouldSkipBiometricPresentation] ^ 1];
  [(SBUIPasscodeLockView *)self->_passcodeView setShowsProudLock:SBUIIsSystemApertureEnabled() ^ 1];
  [(SBUIPasscodeLockView *)self->_passcodeView setShowsLockIconForFaceID:1];
  v15 = self->_passcodeView;
  v16 = [(AMUIInlineAuthenticationViewController *)self _unlockReason];
  [(SBUIPasscodeLockView *)v15 setOverridePasscodeButtonTitle:v16];

  [(SBUIPasscodeLockView *)self->_passcodeView setAlwaysShowPasscodeButtonForFaceIDMatchFailure:1];
  v17 = self->_passcodeView;
  v18 = [(AMUIInlineAuthenticationViewController *)self _unlockReason];
  [(SBUIPasscodeLockView *)v17 setOverrideFaceIDReason:v18];

  v19 = self->_passcodeView;
  v20 = [MEMORY[0x263F1C550] clearColor];
  [(SBUIPasscodeLockView *)v19 setCustomBackgroundColor:v20];

  [val addSubview:self->_passcodeView];
  if (([(SBUIPasscodeLockView *)self->_passcodeView canPeformBiometricAuthentication] & 1) == 0)
  {
    [(SBUIPasscodeLockView *)self->_passcodeView setAlpha:0.0];
    [(SBUIPasscodeLockView *)self->_passcodeView setPasscodeLockViewState:0 animated:0];
    v21 = [AMUIPasscodeButton alloc];
    v22 = -[AMUIPasscodeButton initWithFrame:](v21, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    passcodeButton = self->_passcodeButton;
    self->_passcodeButton = v22;

    v24 = self->_passcodeButton;
    v25 = (void *)MEMORY[0x263F1C658];
    v26 = [MEMORY[0x263F1C660] defaultFontDescriptorWithTextStyle:*MEMORY[0x263F1D300] addingSymbolicTraits:0x8000 options:1];
    v27 = [v25 fontWithDescriptor:v26 size:0.0];
    [(AMUIPasscodeButton *)v24 setFont:v27];

    v28 = self->_passcodeButton;
    v29 = [(AMUIInlineAuthenticationViewController *)self _unlockReason];
    [(AMUIPasscodeButton *)v28 setTitle:v29];

    [(AMUIPasscodeButton *)self->_passcodeButton addTarget:self action:sel__handlePasscodeButtonAction forControlEvents:64];
    [(AMUIPasscodeButton *)self->_passcodeButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [val addSubview:self->_passcodeButton];
    v30 = [(AMUIPasscodeButton *)self->_passcodeButton widthAnchor];
    v31 = [v30 constraintEqualToConstant:225.0];

    LODWORD(v32) = 1132068864;
    [v31 setPriority:v32];
    v33 = (void *)MEMORY[0x263F08938];
    v34 = [(AMUIPasscodeButton *)self->_passcodeButton centerYAnchor];
    v35 = [val centerYAnchor];
    v36 = [v34 constraintEqualToAnchor:v35];
    v54[0] = v36;
    v37 = [(AMUIPasscodeButton *)self->_passcodeButton centerXAnchor];
    v38 = [val centerXAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    v54[1] = v39;
    v54[2] = v31;
    v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:3];
    [v33 activateConstraints:v40];
  }
  v41 = objc_alloc_init(AMUIDateTimeDataLayerViewController);
  dateTimeLayerViewController = self->_dateTimeLayerViewController;
  self->_dateTimeLayerViewController = v41;

  [(AMUIDateTimeDataLayerViewController *)self->_dateTimeLayerViewController setChromeOrientationPolicy:2];
  [(AMUIDateTimeDataLayerViewController *)self->_dateTimeLayerViewController setDateProvider:self->_dateProvider];
  v43 = [(AMUIDateTimeDataLayerViewController *)self->_dateTimeLayerViewController view];
  objc_initWeak(&location, v43);

  objc_initWeak(&from, val);
  v44 = self->_dateTimeLayerViewController;
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __53__AMUIInlineAuthenticationViewController_viewDidLoad__block_invoke;
  v47[3] = &unk_265224E80;
  objc_copyWeak(&v49, &location);
  objc_copyWeak(v50, &from);
  v50[1] = v4;
  v50[2] = v6;
  v50[3] = v8;
  v50[4] = v10;
  id v45 = val;
  id v48 = v45;
  [(AMUIInlineAuthenticationViewController *)self bs_addChildViewController:v44 animated:0 transitionBlock:v47];
  [v45 setNeedsUpdateConstraints];
  [(AMUIInlineAuthenticationViewController *)self _reset];
  [(SBUIPasscodeLockView *)self->_passcodeView becomeFirstResponder];

  objc_destroyWeak(v50);
  objc_destroyWeak(&v49);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __53__AMUIInlineAuthenticationViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && v2)
  {
    objc_msgSend(WeakRetained, "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    [WeakRetained setAutoresizingMask:18];
    [*(id *)(a1 + 32) bringSubviewToFront:WeakRetained];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMUIInlineAuthenticationViewController;
  [(AMUIInlineAuthenticationViewController *)&v5 viewWillDisappear:a3];
  [(AMUIInlineAuthenticationViewController *)self _setBiometricAuthenticationDisabled:[(AMUIInlineAuthenticationViewController *)self _wantsBioUnlockBlocked] resettingTimeout:0];
  [(NSTimer *)self->_biometricAuthenticationTimer invalidate];
  biometricAuthenticationTimer = self->_biometricAuthenticationTimer;
  self->_biometricAuthenticationTimer = 0;
}

- (void)viewDidLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)AMUIInlineAuthenticationViewController;
  [(AMUIInlineAuthenticationViewController *)&v12 viewDidLayoutSubviews];
  v3 = [(AMUIInlineAuthenticationViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[MTMaterialView setFrame:](self->_materialView, "setFrame:", v5, v7, v9, v11);
  -[SBUIPasscodeLockView setFrame:](self->_passcodeView, "setFrame:", v5, v7, v9, v11);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 24;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)passcodeLockViewPasscodeEntered:(id)a3
{
}

- (void)passcodeLockViewPasscodeEnteredViaMesa:(id)a3
{
}

- (void)passcodeLockViewStateChange:(id)a3
{
  BOOL v4 = [a3 passcodeLockViewState] == 1;
  double v5 = [(AMUIInlineAuthenticationViewController *)self delegate];
  [v5 authenticationViewController:self setDidSetPasscodeVisible:v4];

  [(SBUIPasscodeLockView *)self->_passcodeView setShowsCancelButton:v4];

  [(AMUIInlineAuthenticationViewController *)self _setDateTimeLayerHidden:1];
}

- (id)passcode
{
  return (id)[(SBUIPasscodeLockView *)self->_passcodeView passcode];
}

- (void)resetForSuccess
{
}

- (void)resetForFailedPasscode
{
}

- (void)_attemptUnlockForBioUnlock:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(AMUIInlineAuthenticationViewController *)self authenticationHandler];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__AMUIInlineAuthenticationViewController__attemptUnlockForBioUnlock___block_invoke;
  v6[3] = &unk_265224B88;
  v6[4] = self;
  [v5 attemptUnlockForSender:self forBioUnlock:v3 completion:v6];
}

void __69__AMUIInlineAuthenticationViewController__attemptUnlockForBioUnlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  [v4 authenticationViewController:*(void *)(a1 + 32) didAuthenticateWithSuccess:a2];
}

- (void)_handlePasscodeButtonAction
{
  [(AMUIInlineAuthenticationViewController *)self _setPasscodeVisible:1];
  [(SBUIPasscodeLockView *)self->_passcodeView setShowsCancelButton:1];

  [(AMUIInlineAuthenticationViewController *)self _setBiometricAuthenticationDisabled:0];
}

- (void)_setPasscodeVisible:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(AMUIInlineAuthenticationViewController *)self delegate];
  [v5 authenticationViewController:self setDidSetPasscodeVisible:v3];

  objc_initWeak(&location, self);
  double v6 = (void *)MEMORY[0x263F1CB60];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__AMUIInlineAuthenticationViewController__setPasscodeVisible___block_invoke;
  v7[3] = &unk_265224950;
  objc_copyWeak(&v8, &location);
  BOOL v9 = v3;
  [v6 animateWithDuration:0 delay:v7 options:0 animations:0.3 completion:0.0];
  [(AMUIInlineAuthenticationViewController *)self _setDateTimeLayerHidden:v3];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __62__AMUIInlineAuthenticationViewController__setPasscodeVisible___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v6 = WeakRetained;
    id v3 = WeakRetained[124];
    double v4 = *(unsigned char *)(a1 + 40) ? 0.0 : 1.0;
    [v3 setAlpha:v4];
    double v5 = *(unsigned char *)(a1 + 40) ? 1.0 : 0.0;
    [v6[123] setAlpha:v5];
    id WeakRetained = v6;
    if (*(unsigned char *)(a1 + 40))
    {
      [v6[123] setPasscodeLockViewState:1 animated:1];
      id WeakRetained = v6;
    }
  }
}

- (void)_setDateTimeLayerHidden:(BOOL)a3
{
  double v4 = [(AMUIDateTimeDataLayerViewController *)self->_dateTimeLayerViewController view];
  double v5 = (void *)MEMORY[0x263F1CB60];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__AMUIInlineAuthenticationViewController__setDateTimeLayerHidden___block_invoke;
  v7[3] = &unk_265224D18;
  id v8 = v4;
  BOOL v9 = a3;
  id v6 = v4;
  [v5 animateWithDuration:0 delay:v7 options:0 animations:0.3 completion:0.0];
}

uint64_t __66__AMUIInlineAuthenticationViewController__setDateTimeLayerHidden___block_invoke(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

- (void)_reset
{
  BOOL v3 = [(AMUIInlineAuthenticationViewController *)self _wantsBioUnlockBlocked];
  char v4 = [(SBUIPasscodeLockView *)self->_passcodeView canPeformBiometricAuthentication];
  [(AMUIInlineAuthenticationViewController *)self _setBiometricAuthenticationDisabled:v3];
  [(SBUIPasscodeLockView *)self->_passcodeView setPasscodeLockViewState:0 animated:1];
  [(SBUIPasscodeLockView *)self->_passcodeView setShowsProudLock:0];
  [(SBUIPasscodeLockView *)self->_passcodeView reset];
  [(AMUIInlineAuthenticationViewController *)self _setDateTimeLayerHidden:0];
  if ((v4 & 1) == 0)
  {
    [(AMUIInlineAuthenticationViewController *)self _setPasscodeVisible:0];
  }
}

- (id)_unlockReason
{
  BOOL v3 = NSString;
  char v4 = AMUIAmbientUIFrameworkBundle();
  double v5 = [v4 localizedStringForKey:@"INLINE_AUTH_REASON" value:&stru_26FBC9C48 table:0];
  id v6 = objc_msgSend(v3, "stringWithFormat:", v5, self->_unlockDestination);

  return v6;
}

- (BOOL)_shouldSkipBiometricPresentation
{
  int v3 = MGGetBoolAnswer();
  int v4 = MGGetBoolAnswer();
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5) {
    return 1;
  }

  return [(AMUIInlineAuthenticationViewController *)self _wantsBioUnlockBlocked];
}

- (BOOL)_wantsBioUnlockBlocked
{
  id v2 = self;
  int v3 = [(AMUIInlineAuthenticationViewController *)self delegate];
  LOBYTE(v2) = [v3 authenticationViewControllerWantsBiometricAuthenticationBlocked:v2];

  return (char)v2;
}

- (void)_setUpBiometricAuthenticationTimeout
{
  biometricAuthenticationTimer = self->_biometricAuthenticationTimer;
  if (biometricAuthenticationTimer)
  {
    [(NSTimer *)biometricAuthenticationTimer invalidate];
    int v4 = self->_biometricAuthenticationTimer;
    self->_biometricAuthenticationTimer = 0;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__AMUIInlineAuthenticationViewController__setUpBiometricAuthenticationTimeout__block_invoke;
  v7[3] = &unk_265224EA8;
  void v7[4] = self;
  BOOL v5 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:0 repeats:v7 block:20.0];
  id v6 = self->_biometricAuthenticationTimer;
  self->_biometricAuthenticationTimer = v5;
}

uint64_t __78__AMUIInlineAuthenticationViewController__setUpBiometricAuthenticationTimeout__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setBiometricAuthenticationDisabled:1];
}

- (void)_setBiometricAuthenticationDisabled:(BOOL)a3
{
}

- (void)_setBiometricAuthenticationDisabled:(BOOL)a3 resettingTimeout:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([(SBUIPasscodeLockView *)self->_passcodeView isBiometricAuthenticationAllowed] != a3)
  {
    if (!v4 || v5) {
      return;
    }
LABEL_10:
    [(AMUIInlineAuthenticationViewController *)self _setUpBiometricAuthenticationTimeout];
    return;
  }
  double v7 = AMUILogGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v5;
    _os_log_impl(&dword_247837000, v7, OS_LOG_TYPE_DEFAULT, "Inline authentication view controller setting biometric authentication disabled: %{BOOL}u", (uint8_t *)v9, 8u);
  }

  [(SBUIPasscodeLockView *)self->_passcodeView setBiometricAuthenticationAllowed:v5 ^ 1];
  id v8 = [(AMUIInlineAuthenticationViewController *)self delegate];
  [v8 authenticationViewController:self didSetBiometricAuthenticationDisabled:v5];

  if (v5)
  {
    [(SBUIPasscodeLockView *)self->_passcodeView setPasscodeLockViewState:1];
    return;
  }
  if (v4) {
    goto LABEL_10;
  }
}

- (AMUIDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (AMUIInlineAuthenticationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AMUIInlineAuthenticationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AMAuthenticationHandling)authenticationHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_authenticationHandler);

  return (AMAuthenticationHandling *)WeakRetained;
}

- (void)setAuthenticationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_authenticationHandler);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_biometricAuthenticationTimer, 0);
  objc_storeStrong((id *)&self->_dateTimeLayerViewController, 0);
  objc_storeStrong((id *)&self->_unlockDestination, 0);
  objc_storeStrong((id *)&self->_passcodeButton, 0);
  objc_storeStrong((id *)&self->_passcodeView, 0);

  objc_storeStrong((id *)&self->_materialView, 0);
}

@end