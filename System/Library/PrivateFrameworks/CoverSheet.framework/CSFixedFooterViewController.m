@interface CSFixedFooterViewController
+ (Class)viewClass;
- (BOOL)handleEvent:(id)a3;
- (CSFixedFooterViewController)init;
- (SBFAuthenticationStatusProvider)authenticationStatusProvider;
- (void)_addStatusTextViewControllerIfNecessary;
- (void)_updateCallToActionTextAnimated:(BOOL)a3;
- (void)coverSheetStatusTextViewControllerContentDidChange:(id)a3;
- (void)setAuthenticationStatusProvider:(id)a3;
- (void)updateCallToActionForMesaMatchFailure;
- (void)updateCallToActionForReversingInteractiveTransition;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CSFixedFooterViewController

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (CSFixedFooterViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSFixedFooterViewController;
  v2 = [(CSFixedFooterViewController *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v4 = [v3 localizedStringForKey:@"AWAY_LOCK_TRY_AGAIN" value:&stru_1F3020248 table:@"CoverSheet"];
    cachedMesaFailureText = v2->_cachedMesaFailureText;
    v2->_cachedMesaFailureText = (NSString *)v4;
  }
  return v2;
}

- (void)viewDidLoad
{
  [(CSFixedFooterViewController *)self _updateCallToActionTextAnimated:0];
  v3.receiver = self;
  v3.super_class = (Class)CSFixedFooterViewController;
  [(CSCoverSheetViewControllerBase *)&v3 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSFixedFooterViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewWillAppear:a3];
  [(CSFixedFooterViewController *)self _addStatusTextViewControllerIfNecessary];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSFixedFooterViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewDidAppear:a3];
  [(CSFixedFooterViewController *)self _updateCallToActionTextAnimated:0];
  objc_super v4 = [(CSFixedFooterViewController *)self fixedFooterView];
  v5 = [v4 callToActionLabel];
  [v5 fadeIn];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSFixedFooterViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewDidDisappear:a3];
  objc_super v4 = [(CSFixedFooterViewController *)self fixedFooterView];
  v5 = [v4 callToActionLabel];
  [v5 fadeOut];
}

- (void)_addStatusTextViewControllerIfNecessary
{
  if (!self->_statusTextViewController)
  {
    objc_super v3 = objc_alloc_init(CSStatusTextViewController);
    statusTextViewController = self->_statusTextViewController;
    self->_statusTextViewController = v3;

    [(CSStatusTextViewController *)self->_statusTextViewController setDelegate:self];
    [(CSCoverSheetViewControllerBase *)self->_statusTextViewController setPresenter:self];
    v5 = self->_statusTextViewController;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __70__CSFixedFooterViewController__addStatusTextViewControllerIfNecessary__block_invoke;
    v6[3] = &unk_1E6AD8820;
    v6[4] = self;
    [(CSFixedFooterViewController *)self bs_addChildViewController:v5 animated:0 transitionBlock:v6];
  }
}

void __70__CSFixedFooterViewController__addStatusTextViewControllerIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  objc_super v6 = a2;
  objc_super v4 = [v3 fixedFooterView];
  v5 = [*(id *)(*(void *)(a1 + 32) + 1048) statusTextView];
  [v4 setStatusTextView:v5];

  v6[2]();
}

- (void)updateCallToActionForReversingInteractiveTransition
{
}

- (void)_updateCallToActionTextAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (SBFEffectiveHomeButtonType() == 2) {
    return;
  }
  if ([(SBFAuthenticationStatusProvider *)self->_authenticationStatusProvider isAuthenticated])
  {
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_super v6 = v5;
    objc_super v7 = @"PRESS_HOME_TO_OPEN";
    v8 = @"CoverSheetCommon";
LABEL_7:
    v21 = [v5 localizedStringForKey:v7 value:&stru_1F3020248 table:v8];

    v9 = v21;
    goto LABEL_8;
  }
  if (!self->_temporaryMesaFailureTextActive)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_super v6 = v5;
    objc_super v7 = @"PRESS_HOME_TO_UNLOCK";
    v8 = @"CoverSheet";
    goto LABEL_7;
  }
  v9 = self->_cachedMesaFailureText;
LABEL_8:
  v22 = v9;
  uint64_t v10 = [(NSString *)v9 length];
  v11 = [(CSFixedFooterViewController *)self fixedFooterView];
  v12 = v11;
  if (v10)
  {
    id v13 = [v11 callToActionLabel];

    if (!v13)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4FA7C78]);
      v14 = [(CSFixedFooterViewController *)self fixedFooterView];
      [v14 setCallToActionLabel:v13];
    }
    v15 = [(CSCoverSheetViewControllerBase *)self activeAppearance];
    v16 = [v15 componentForType:9 property:1];
    int v17 = [v16 isHidden];

    [v13 setVisible:v17 ^ 1u animated:v3];
    double v18 = 1.0;
    if (v17) {
      double v18 = 0.0;
    }
    [v13 setAlpha:v18];
    v19 = [MEMORY[0x1E4F1CA20] currentLocale];
    v20 = [v19 localeIdentifier];
    [v13 setText:v22 forLanguage:v20 animated:v3];

    v12 = v13;
  }
  else
  {
    [v11 setCallToActionLabel:0];
  }

  [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
}

- (void)updateCallToActionForMesaMatchFailure
{
  BOOL v3 = [(CSFixedFooterViewController *)self fixedFooterView];
  objc_super v4 = [v3 callToActionShakeView];

  v5 = [(CSFixedFooterViewController *)self fixedFooterView];
  objc_super v6 = [v5 callToActionLabel];

  self->_temporaryMesaFailureTextActive = 1;
  [(CSFixedFooterViewController *)self _updateCallToActionTextAnimated:0];
  [v6 setVisible:1 animated:0];
  ++updateCallToActionForMesaMatchFailure___token;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__CSFixedFooterViewController_updateCallToActionForMesaMatchFailure__block_invoke;
  v8[3] = &unk_1E6ADA380;
  int v10 = updateCallToActionForMesaMatchFailure___token;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [v4 beginShakingWithCompletion:v8];
}

void __68__CSFixedFooterViewController_updateCallToActionForMesaMatchFailure__block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__CSFixedFooterViewController_updateCallToActionForMesaMatchFailure__block_invoke_2;
  block[3] = &unk_1E6ADA380;
  int v6 = *(_DWORD *)(a1 + 48);
  BOOL v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

void __68__CSFixedFooterViewController_updateCallToActionForMesaMatchFailure__block_invoke_2(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48) == updateCallToActionForMesaMatchFailure___token)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 1064) = 0;
    dispatch_time_t v2 = *(void **)(*(void *)(a1 + 32) + 1056);
    BOOL v3 = [*(id *)(a1 + 40) text];
    LODWORD(v2) = [v2 isEqualToString:v3];

    if (v2)
    {
      objc_super v4 = *(void **)(a1 + 32);
      [v4 _updateCallToActionTextAnimated:1];
    }
  }
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CSFixedFooterViewController;
  if ([(CSCoverSheetViewControllerBase *)&v27 handleEvent:v4]
    && ([v4 isConsumable] & 1) != 0)
  {
    char v5 = [v4 isConsumable];
  }
  else
  {
    uint64_t v6 = [v4 type];
    char v5 = 0;
    switch(v6)
    {
      case 1:
        [(CSFixedFooterViewController *)self _addStatusTextViewControllerIfNecessary];
        [(CSFixedFooterViewController *)self _updateCallToActionTextAnimated:0];
        id v7 = [(CSCoverSheetViewControllerBase *)self activeAppearance];
        v8 = [v7 legibilitySettings];

        id v9 = [(CSFixedFooterViewController *)self fixedFooterView];
        [v9 updateForLegibilitySettings:v8];

        goto LABEL_23;
      case 2:
        [(CSFixedFooterViewController *)self _addStatusTextViewControllerIfNecessary];
        goto LABEL_23;
      case 3:
      case 4:
      case 5:
      case 7:
      case 9:
      case 10:
      case 12:
      case 14:
      case 15:
        break;
      case 6:
        goto LABEL_10;
      case 8:
      case 11:
        goto LABEL_11;
      case 13:
        v15 = [v4 value];
        uint64_t v16 = [v15 BOOLValue];

        [(CSFixedFooterViewController *)self _updateCallToActionTextAnimated:v16];
        if (v16)
        {
          self->_temporaryMesaFailureTextActive = 0;
          self->_authenticatedSinceFingerOn = 1;
          int v17 = +[CSAction actionWithType:3];
          [(CSCoverSheetViewControllerBase *)self handleAction:v17 fromSender:self];
        }
        goto LABEL_23;
      case 16:
        double v18 = [v4 value];
        [v18 floatValue];
        float v20 = v19;

        if (v20 <= 0.0)
        {
          id v21 = [(CSFixedFooterViewController *)self fixedFooterView];
          v22 = [v21 callToActionLabel];
          [v22 fadeOut];
        }
        else
        {
          if (v20 <= 0.01) {
            goto LABEL_23;
          }
          [(CSFixedFooterViewController *)self _updateCallToActionTextAnimated:0];
          id v21 = [(CSFixedFooterViewController *)self fixedFooterView];
          v22 = [v21 callToActionLabel];
          [v22 fadeIn];
        }

        goto LABEL_22;
      default:
        if (v6 == 25)
        {
LABEL_10:
          self->_temporaryMesaFailureTextActive = 0;
LABEL_11:
          [(CSFixedFooterViewController *)self _updateCallToActionTextAnimated:0];
        }
        else
        {
          if (v6 != 34) {
            break;
          }
          int v10 = [(CSFixedFooterViewController *)self fixedFooterView];
          v11 = [v10 callToActionLabel];

          v12 = [MEMORY[0x1E4FA7C68] sharedInstance];
          int v13 = [v12 hasBiometricAuthenticationCapabilityEnabled];

          if (v13)
          {
            [v11 cancelFadeInTimerIfNecessary];
            int64_t v14 = 1000000000;
          }
          else
          {
            int64_t v14 = 350000000;
          }
          dispatch_time_t v23 = dispatch_time(0, v14);
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __43__CSFixedFooterViewController_handleEvent___block_invoke;
          v25[3] = &unk_1E6AD88C0;
          v25[4] = self;
          id v26 = v11;
          id v21 = v11;
          dispatch_after(v23, MEMORY[0x1E4F14428], v25);

LABEL_22:
        }
LABEL_23:
        char v5 = 0;
        break;
    }
  }

  return v5;
}

unsigned char *__43__CSFixedFooterViewController_handleEvent___block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[1065])
  {
    [result _updateCallToActionTextAnimated:1];
    [*(id *)(a1 + 40) fadeInImmediately:1];
    result = *(unsigned char **)(a1 + 32);
  }
  result[1065] = 0;
  return result;
}

- (void)coverSheetStatusTextViewControllerContentDidChange:(id)a3
{
  id v4 = [(CSFixedFooterViewController *)self view];
  [v4 setNeedsLayout];

  [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
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
  objc_storeStrong((id *)&self->_cachedMesaFailureText, 0);

  objc_storeStrong((id *)&self->_statusTextViewController, 0);
}

@end