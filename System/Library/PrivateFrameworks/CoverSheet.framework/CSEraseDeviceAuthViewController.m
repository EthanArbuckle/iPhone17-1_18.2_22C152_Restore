@interface CSEraseDeviceAuthViewController
- (AKAppleIDAuthenticationInAppContext)authContext;
- (BOOL)_canShowWhileLocked;
- (CSEraseDeviceAuthViewControllerDelegate)delegate;
- (id)_authenticationView;
- (void)_activateConstraints;
- (void)_handleCancelButtonAction;
- (void)_presentEraseConfirmationAlertWithAuthResults:(id)a3;
- (void)_updateForFailedAppleIDAuthentication;
- (void)loadView;
- (void)setAuthContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSubtitleLabelText:(id)a3;
- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5;
- (void)viewDidLoad;
@end

@implementation CSEraseDeviceAuthViewController

- (void)loadView
{
  v39.receiver = self;
  v39.super_class = (Class)CSEraseDeviceAuthViewController;
  [(CSEraseDeviceAuthViewController *)&v39 loadView];
  v3 = [(CSEraseDeviceAuthViewController *)self view];
  v4 = [MEMORY[0x1E4F427E8] plainButtonConfiguration];
  v5 = [MEMORY[0x1E4F428B8] whiteColor];
  [v4 setBaseForegroundColor:v5];

  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"DASHBOARD_BLOCK_CANCEL_BUTTON" value:&stru_1F3020248 table:@"CoverSheet"];
  [v4 setTitle:v7];

  v8 = [MEMORY[0x1E4F427E0] buttonWithType:1];
  cancelButton = self->_cancelButton;
  self->_cancelButton = v8;

  [(UIButton *)self->_cancelButton setConfiguration:v4];
  [(UIButton *)self->_cancelButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_cancelButton addTarget:self action:sel__handleCancelButtonAction forControlEvents:64];
  [v3 addSubview:self->_cancelButton];
  v10 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  labelsContainerView = self->_labelsContainerView;
  self->_labelsContainerView = v10;

  v12 = self->_labelsContainerView;
  v13 = [MEMORY[0x1E4F428B8] clearColor];
  [(UIView *)v12 setBackgroundColor:v13];

  [(UIView *)self->_labelsContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:self->_labelsContainerView];
  v14 = [MEMORY[0x1E4F4F8B8] preferredFontProvider];
  v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v15;

  v17 = self->_titleLabel;
  v18 = [MEMORY[0x1E4F428B8] whiteColor];
  [(UILabel *)v17 setTextColor:v18];

  v19 = self->_titleLabel;
  v20 = [v14 preferredFontForTextStyle:*MEMORY[0x1E4F438E8] hiFontStyle:1];
  [(UILabel *)v19 setFont:v20];

  v21 = self->_titleLabel;
  v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v23 = [v22 localizedStringForKey:@"DASHBOARD_BLOCK_ERASE_AUTH_TITLE" value:&stru_1F3020248 table:@"CoverSheet"];
  [(UILabel *)v21 setText:v23];

  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_labelsContainerView addSubview:self->_titleLabel];
  v24 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v24;

  v26 = self->_subtitleLabel;
  v27 = [MEMORY[0x1E4F428B8] whiteColor];
  [(UILabel *)v26 setTextColor:v27];

  v28 = self->_subtitleLabel;
  v29 = [v14 preferredFontForTextStyle:*MEMORY[0x1E4F43870] hiFontStyle:1];
  [(UILabel *)v28 setFont:v29];

  [(UILabel *)self->_subtitleLabel setNumberOfLines:0];
  [(UILabel *)self->_subtitleLabel setTextAlignment:1];
  [(UILabel *)self->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_labelsContainerView addSubview:self->_subtitleLabel];
  v30 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  springView = self->_springView;
  self->_springView = v30;

  [(UIView *)self->_springView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:self->_springView];
  v32 = (AKInlineSignInViewController *)objc_alloc_init(MEMORY[0x1E4F4F108]);
  authenticationViewController = self->_authenticationViewController;
  self->_authenticationViewController = v32;

  [(AKInlineSignInViewController *)self->_authenticationViewController setDelegate:self];
  [(AKInlineSignInViewController *)self->_authenticationViewController setSecondaryButtonTitle:0];
  [(AKInlineSignInViewController *)self->_authenticationViewController setTertiaryButtonTitle:0];
  v34 = self->_authenticationViewController;
  v35 = [MEMORY[0x1E4F428B8] whiteColor];
  [(AKInlineSignInViewController *)v34 setEntryDescriptionTextColor:v35];

  v36 = self->_authenticationViewController;
  v37 = [MEMORY[0x1E4F428B8] whiteColor];
  [(AKInlineSignInViewController *)v36 setEntryFieldTextColor:v37];

  [(AKInlineSignInViewController *)self->_authenticationViewController setPrimaryButtonHidden:1];
  [(AKInlineSignInViewController *)self->_authenticationViewController setShouldPromptForPasswordOnly:1];
  [(AKInlineSignInViewController *)self->_authenticationViewController setWantsAuthenticationProgress:1];
  v38 = [(AKInlineSignInViewController *)self->_authenticationViewController view];
  [(UIView *)self->_springView addSubview:v38];
  [(CSEraseDeviceAuthViewController *)self _activateConstraints];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CSEraseDeviceAuthViewController;
  [(CSEraseDeviceAuthViewController *)&v5 viewDidLoad];
  authenticationViewController = self->_authenticationViewController;
  if (authenticationViewController)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __46__CSEraseDeviceAuthViewController_viewDidLoad__block_invoke;
    v4[3] = &unk_1E6AD8820;
    v4[4] = self;
    [(CSEraseDeviceAuthViewController *)self bs_addChildViewController:authenticationViewController animated:0 transitionBlock:v4];
  }
}

void __46__CSEraseDeviceAuthViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  v21[3] = *MEMORY[0x1E4F143B8];
  v14 = (void *)MEMORY[0x1E4F28DC8];
  v3 = *(void **)(a1 + 32);
  v20 = a2;
  v19 = [v3 _authenticationView];
  v18 = [v19 topAnchor];
  v17 = [*(id *)(*(void *)(a1 + 32) + 1000) bottomAnchor];
  v16 = [v18 constraintEqualToAnchor:v17 constant:-29.0];
  v21[0] = v16;
  v15 = [*(id *)(a1 + 32) _authenticationView];
  v4 = [v15 leadingAnchor];
  objc_super v5 = [*(id *)(a1 + 32) view];
  v6 = [v5 leadingAnchor];
  v7 = [v4 constraintEqualToAnchor:v6];
  v21[1] = v7;
  v8 = [*(id *)(a1 + 32) _authenticationView];
  v9 = [v8 trailingAnchor];
  v10 = [*(id *)(a1 + 32) view];
  v11 = [v10 trailingAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  v21[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
  [v14 activateConstraints:v13];

  v20[2]();
}

- (void)setAuthContext:(id)a3
{
  authenticationViewController = (AKInlineSignInViewController *)a3;
  objc_super v5 = authenticationViewController;
  if (self->_authContext != authenticationViewController)
  {
    self->_authContext = authenticationViewController;
    authenticationViewController = self->_authenticationViewController;
    if (authenticationViewController)
    {
      v6 = v5;
      authenticationViewController = (AKInlineSignInViewController *)[(AKInlineSignInViewController *)authenticationViewController setContext:v5];
      objc_super v5 = v6;
    }
  }

  MEMORY[0x1F41817F8](authenticationViewController, v5);
}

- (void)setSubtitleLabelText:(id)a3
{
}

- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__CSEraseDeviceAuthViewController_signInViewController_didAuthenticateWithResults_error___block_invoke;
  block[3] = &unk_1E6AD8848;
  id v12 = v8;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __89__CSEraseDeviceAuthViewController_signInViewController_didAuthenticateWithResults_error___block_invoke(void *a1)
{
  uint64_t v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3) {
    return [v2 _updateForFailedAppleIDAuthentication];
  }
  else {
    return [v2 _presentEraseConfirmationAlertWithAuthResults:a1[6]];
  }
}

- (void)_activateConstraints
{
  v94[17] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CSEraseDeviceAuthViewController *)self view];
  v74 = (void *)MEMORY[0x1E4F28DC8];
  v4 = [(UIButton *)self->_cancelButton topAnchor];
  v91 = [v3 safeAreaLayoutGuide];
  uint64_t v5 = [v91 topAnchor];
  int v89 = __sb__runningInSpringBoard();
  if (v89)
  {
    BOOL v6 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    v41 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v6 = [v41 userInterfaceIdiom] == 1;
  }
  double v7 = 5.0;
  if (v6) {
    double v7 = 9.0;
  }
  v88 = [v4 constraintEqualToAnchor:v5 constant:v7];
  v94[0] = v88;
  id v8 = [(UIButton *)self->_cancelButton leadingAnchor];
  uint64_t v9 = [v3 leadingAnchor];
  int v85 = __sb__runningInSpringBoard();
  v92 = v4;
  v90 = (void *)v5;
  if (v85)
  {
    BOOL v10 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    v40 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v10 = [v40 userInterfaceIdiom] == 1;
  }
  double v11 = 15.0;
  if (v10) {
    double v11 = 8.0;
  }
  v87 = v8;
  v84 = [v8 constraintEqualToAnchor:v9 constant:v11];
  v94[1] = v84;
  id v12 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
  v82 = [(UIView *)self->_labelsContainerView topAnchor];
  v83 = v12;
  v81 = objc_msgSend(v12, "constraintEqualToAnchor:");
  v94[2] = v81;
  v13 = [(UILabel *)self->_titleLabel centerXAnchor];
  v79 = [(UIView *)self->_labelsContainerView centerXAnchor];
  v80 = v13;
  v78 = objc_msgSend(v13, "constraintEqualToAnchor:");
  v94[3] = v78;
  id v14 = [(UILabel *)self->_subtitleLabel topAnchor];
  v76 = [(UILabel *)self->_titleLabel bottomAnchor];
  v77 = v14;
  v75 = objc_msgSend(v14, "constraintEqualToAnchor:constant:", 8.0);
  v94[4] = v75;
  v15 = [(UILabel *)self->_subtitleLabel leadingAnchor];
  v72 = [(UIView *)self->_labelsContainerView leadingAnchor];
  v73 = v15;
  v71 = objc_msgSend(v15, "constraintEqualToAnchor:");
  v94[5] = v71;
  v16 = [(UILabel *)self->_subtitleLabel trailingAnchor];
  v69 = [(UIView *)self->_labelsContainerView trailingAnchor];
  v70 = v16;
  v68 = objc_msgSend(v16, "constraintEqualToAnchor:");
  v94[6] = v68;
  v17 = [(UIView *)self->_labelsContainerView bottomAnchor];
  v66 = [(UILabel *)self->_subtitleLabel bottomAnchor];
  v67 = v17;
  v65 = objc_msgSend(v17, "constraintEqualToAnchor:");
  v94[7] = v65;
  v18 = [(UIView *)self->_labelsContainerView widthAnchor];
  v63 = [(UILabel *)self->_titleLabel widthAnchor];
  v64 = v18;
  v62 = objc_msgSend(v18, "constraintLessThanOrEqualToAnchor:");
  v94[8] = v62;
  v19 = [(UIView *)self->_labelsContainerView widthAnchor];
  v60 = [(UILabel *)self->_subtitleLabel widthAnchor];
  v61 = v19;
  v59 = objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:");
  v94[9] = v59;
  v20 = [(UIView *)self->_labelsContainerView leadingAnchor];
  uint64_t v21 = [v3 leadingAnchor];
  int v56 = __sb__runningInSpringBoard();
  if (v56)
  {
    BOOL v22 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_super v39 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v22 = [v39 userInterfaceIdiom] == 1;
  }
  double v23 = 130.0;
  if (!v22) {
    double v23 = 20.0;
  }
  v55 = [v20 constraintEqualToAnchor:v21 constant:v23];
  v94[10] = v55;
  v24 = [(UIView *)self->_labelsContainerView trailingAnchor];
  uint64_t v25 = [v3 trailingAnchor];
  int v52 = __sb__runningInSpringBoard();
  v93 = v3;
  v86 = (void *)v9;
  v57 = (void *)v21;
  v58 = v20;
  if (v52)
  {
    BOOL v26 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    v38 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v26 = [v38 userInterfaceIdiom] == 1;
  }
  double v27 = -130.0;
  if (!v26) {
    double v27 = -20.0;
  }
  v53 = (void *)v25;
  v54 = v24;
  v51 = [v24 constraintEqualToAnchor:v25 constant:v27];
  v94[11] = v51;
  v50 = [(UIView *)self->_labelsContainerView topAnchor];
  v49 = [(UIButton *)self->_cancelButton topAnchor];
  v48 = [v50 constraintEqualToAnchor:v49 constant:80.0];
  v94[12] = v48;
  v47 = [(UIView *)self->_springView topAnchor];
  v46 = [(UIView *)self->_labelsContainerView bottomAnchor];
  v45 = [v47 constraintEqualToAnchor:v46 constant:-29.0];
  v94[13] = v45;
  v43 = [(UIView *)self->_springView leadingAnchor];
  v44 = [(CSEraseDeviceAuthViewController *)self view];
  v42 = [v44 leadingAnchor];
  v28 = [v43 constraintEqualToAnchor:v42];
  v94[14] = v28;
  v29 = [(UIView *)self->_springView trailingAnchor];
  v30 = [(CSEraseDeviceAuthViewController *)self view];
  v31 = [v30 trailingAnchor];
  v32 = [v29 constraintEqualToAnchor:v31];
  v94[15] = v32;
  v33 = [(UIView *)self->_springView heightAnchor];
  v34 = [(CSEraseDeviceAuthViewController *)self _authenticationView];
  v35 = [v34 heightAnchor];
  v36 = [v33 constraintEqualToAnchor:v35];
  v94[16] = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:17];
  [v74 activateConstraints:v37];

  if ((v52 & 1) == 0) {
  if ((v56 & 1) == 0)
  }

  if ((v85 & 1) == 0) {
  if ((v89 & 1) == 0)
  }
}

- (void)_handleCancelButtonAction
{
  id v2 = [(CSEraseDeviceAuthViewController *)self delegate];
  [v2 cancelButtonTapped];
}

- (id)_authenticationView
{
  return (id)[(AKInlineSignInViewController *)self->_authenticationViewController view];
}

- (void)_presentEraseConfirmationAlertWithAuthResults:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSEraseDeviceAuthViewController *)self delegate];
  BOOL v6 = (void *)MEMORY[0x1E4F5F4F0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__CSEraseDeviceAuthViewController__presentEraseConfirmationAlertWithAuthResults___block_invoke;
  v10[3] = &unk_1E6AD8870;
  id v11 = v5;
  id v12 = self;
  id v13 = v4;
  id v7 = v4;
  id v8 = v5;
  uint64_t v9 = [v6 alertControllerWithCompletion:v10];
  [(CSEraseDeviceAuthViewController *)self presentViewController:v9 animated:1 completion:0];
}

uint64_t __81__CSEraseDeviceAuthViewController__presentEraseConfirmationAlertWithAuthResults___block_invoke(void *a1, int a2, uint64_t a3, uint64_t a4)
{
  BOOL v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  if (a2) {
    return [v6 authViewController:v7 didConfirmEraseAfterAuthenticationWithResults:a1[6] shouldEraseDataPlan:a3];
  }
  else {
    return objc_msgSend(v6, "authViewControllerDidCancelToEraseDeviceAfterAuthentication:", v7, a4, a3);
  }
}

- (void)_updateForFailedAppleIDAuthentication
{
  uint64_t v3 = [(AKInlineSignInViewController *)self->_authenticationViewController view];
  id v4 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position.x"];
  [v4 setMass:1.20000005];
  [v4 setStiffness:1200.0];
  [v4 setDamping:12.0];
  LODWORD(v5) = 1028389654;
  LODWORD(v6) = 990057071;
  LODWORD(v7) = 1059712716;
  LODWORD(v8) = 1.0;
  uint64_t v9 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v5 :v6 :v7 :v8];
  [v4 setTimingFunction:v9];

  [v4 setDuration:0.666999996];
  [v4 setVelocity:0.0];
  uint64_t v10 = *MEMORY[0x1E4F39F98];
  [v4 setFillMode:*MEMORY[0x1E4F39F98]];
  id v11 = NSNumber;
  id v12 = [v3 layer];
  [v12 position];
  double v14 = v13 + 75.0;
  *(float *)&double v14 = v14;
  v15 = [v11 numberWithFloat:v14];
  [v4 setFromValue:v15];

  v16 = [v3 layer];
  [v16 addAnimation:v4 forKey:@"shake"];

  v17 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"position.x"];
  LODWORD(v18) = 1054276898;
  LODWORD(v19) = 1058305108;
  LODWORD(v20) = 1.0;
  uint64_t v21 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v18 :0.0 :v19 :v20];
  [v17 setTimingFunction:v21];

  [v17 setDuration:0.100000001];
  [v17 setFillMode:v10];
  BOOL v22 = NSNumber;
  double v23 = [(UIView *)self->_springView layer];
  [v23 position];
  double v25 = v24 + -75.0;
  *(float *)&double v25 = v25;
  BOOL v26 = [v22 numberWithFloat:v25];
  [v17 setFromValue:v26];

  double v27 = [(UIView *)self->_springView layer];
  [v27 addAnimation:v17 forKey:@"force-off-center"];

  v28 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F306BD40, 0);
  id v29 = objc_alloc(MEMORY[0x1E4F42C10]);
  v30 = [MEMORY[0x1E4F43268] privateConfigurationForTypes:v28];
  v31 = (void *)[v29 initWithConfiguration:v30];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __72__CSEraseDeviceAuthViewController__updateForFailedAppleIDAuthentication__block_invoke;
  v33[3] = &unk_1E6AD8898;
  id v34 = v31;
  uint64_t v35 = 1001;
  id v32 = v31;
  [v32 activateWithCompletionBlock:v33];
}

uint64_t __72__CSEraseDeviceAuthViewController__updateForFailedAppleIDAuthentication__block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    [*(id *)(a1 + 32) _privateNotificationOccurred:*(void *)(a1 + 40)];
  }
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 deactivate];
}

- (CSEraseDeviceAuthViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSEraseDeviceAuthViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AKAppleIDAuthenticationInAppContext)authContext
{
  return self->_authContext;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_springView, 0);
  objc_storeStrong((id *)&self->_authenticationViewController, 0);
  objc_storeStrong((id *)&self->_labelsContainerView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_cancelButton, 0);
}

@end