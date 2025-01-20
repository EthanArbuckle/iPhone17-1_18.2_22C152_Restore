@interface CSPoseidonViewController
- (BOOL)handleEvent:(id)a3;
- (BOOL)hasBiometricAuthenticationCapabilityEnabled;
- (BOOL)isBiometricLockedOut;
- (SBFAuthenticationStatusProvider)authenticationStatusProvider;
- (SBUIBiometricResource)biometricResource;
- (SBUIPoseidonContainerViewController)poseidonContainerViewController;
- (UIView)poseidonView;
- (void)aggregateAppearance:(id)a3;
- (void)setAuthenticationStatusProvider:(id)a3;
- (void)setBiometricResource:(id)a3;
- (void)setPoseidonContainerViewController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CSPoseidonViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CSPoseidonViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FA7CD8]) initWithAuthenticationInformationProvider:self];
  [v3 setDelegate:self];
  [(CSPoseidonViewController *)self bs_addChildViewController:v3];
  [(CSPoseidonViewController *)self setPoseidonContainerViewController:v3];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CSPoseidonViewController;
  [(CSCoverSheetViewControllerBase *)&v13 viewDidLayoutSubviews];
  v3 = [(CSPoseidonViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(SBUIPoseidonContainerViewController *)self->_poseidonContainerViewController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (UIView)poseidonView
{
  v2 = [(CSPoseidonViewController *)self poseidonContainerViewController];
  v3 = [v2 view];

  return (UIView *)v3;
}

- (BOOL)isBiometricLockedOut
{
  v2 = [(CSPoseidonViewController *)self biometricResource];
  BOOL v3 = [v2 biometricLockoutState] != 0;

  return v3;
}

- (BOOL)hasBiometricAuthenticationCapabilityEnabled
{
  v2 = [(CSPoseidonViewController *)self biometricResource];
  char v3 = [v2 hasBiometricAuthenticationCapabilityEnabled];

  return v3;
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CSPoseidonViewController;
  if (![(CSCoverSheetViewControllerBase *)&v19 handleEvent:v4]
    || ([v4 isConsumable] & 1) == 0)
  {
    uint64_t v6 = [v4 type];
    char v5 = 0;
    if (v6 <= 23)
    {
      switch(v6)
      {
        case 10:
          double v7 = [(CSPoseidonViewController *)self poseidonContainerViewController];
          double v8 = v7;
          uint64_t v9 = 1;
          goto LABEL_15;
        case 11:
          double v7 = [(CSPoseidonViewController *)self poseidonContainerViewController];
          double v8 = v7;
          uint64_t v9 = 0;
LABEL_15:
          [v7 setResignActive:v9];
          goto LABEL_20;
        case 12:
          goto LABEL_22;
        case 13:
          v15 = [v4 value];
          uint64_t v16 = [v15 BOOLValue];

          double v8 = [(CSPoseidonViewController *)self poseidonContainerViewController];
          [v8 setAuthenticated:v16];
          goto LABEL_20;
        case 14:
          double v8 = [(CSPoseidonViewController *)self poseidonContainerViewController];
          [v8 setBioLockout:1];
          goto LABEL_20;
        default:
          if (v6 != 1) {
            goto LABEL_22;
          }
          v12 = [(CSCoverSheetViewControllerBase *)self activeAppearance];
          objc_super v13 = [v12 legibilitySettings];

          v14 = [(CSPoseidonViewController *)self poseidonContainerViewController];
          [v14 setLegibilitySettings:v13];

          break;
      }
      goto LABEL_21;
    }
    switch(v6)
    {
      case 24:
        v17 = [(CSPoseidonViewController *)self poseidonContainerViewController];
        [v17 setScreenOn:1];

        [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
        break;
      case 25:
        double v8 = [(CSPoseidonViewController *)self poseidonContainerViewController];
        [v8 setScreenOn:0];
        goto LABEL_20;
      case 36:
        double v10 = [(CSPoseidonViewController *)self poseidonContainerViewController];
        int v11 = [v10 isAuthenticated];

        if (v11)
        {
          double v8 = [(CSPoseidonViewController *)self poseidonContainerViewController];
          [v8 startRestToOpenCoaching:0 withCompletion:0];
LABEL_20:
        }
        break;
      default:
        goto LABEL_22;
    }
LABEL_21:
    char v5 = 0;
    goto LABEL_22;
  }
  char v5 = [v4 isConsumable];
LABEL_22:

  return v5;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CSPoseidonViewController;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
}

- (void)aggregateAppearance:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CSPoseidonViewController;
  [(CSCoverSheetViewControllerBase *)&v29 aggregateAppearance:v4];
  objc_super v5 = [(CSPoseidonViewController *)self poseidonContainerViewController];
  int v6 = [v5 coachingActive];

  if (v6)
  {
    double v7 = +[CSComponent footerCallToActionLabel];
    double v8 = [v7 priority:60];
    uint64_t v9 = [(CSCoverSheetViewControllerBase *)self coverSheetIdentifier];
    double v10 = [v8 identifier:v9];
    int v11 = [v10 hidden:1];
    [v4 addComponent:v11];

    v12 = objc_opt_new();
    objc_super v13 = [v12 priority:60];
    v14 = [(CSCoverSheetViewControllerBase *)self coverSheetIdentifier];
    v15 = [v13 identifier:v14];
    uint64_t v16 = [v15 suppressTeachableMomentsAnimation:1];
    [v4 addComponent:v16];

    v17 = [(CSPoseidonViewController *)self view];
    v18 = [v17 window];
    uint64_t v19 = [v18 _toWindowOrientation];

    if (v19 == 1)
    {
      v20 = objc_opt_new();
      v21 = [v20 priority:60];
      v22 = [(CSCoverSheetViewControllerBase *)self appearanceIdentifier];
      v23 = [v21 identifier:v22];

      [v23 setHidden:1];
      [v23 setFakeStatusBar:0];
      [v23 setPriority:60];
      [v4 addComponent:v23];
      v24 = +[CSComponent controlCenterGrabber];
      v25 = [v24 priority:60];
      v26 = [(CSCoverSheetViewControllerBase *)self coverSheetIdentifier];
      v27 = [v25 identifier:v26];
      v28 = [v27 hidden:1];
      [v4 addComponent:v28];
    }
  }
}

- (SBUIPoseidonContainerViewController)poseidonContainerViewController
{
  return self->_poseidonContainerViewController;
}

- (void)setPoseidonContainerViewController:(id)a3
{
}

- (SBUIBiometricResource)biometricResource
{
  return self->_biometricResource;
}

- (void)setBiometricResource:(id)a3
{
}

- (SBFAuthenticationStatusProvider)authenticationStatusProvider
{
  return self->_authenticationStatusProvider;
}

- (void)setAuthenticationStatusProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);

  objc_storeStrong((id *)&self->_poseidonContainerViewController, 0);
}

@end