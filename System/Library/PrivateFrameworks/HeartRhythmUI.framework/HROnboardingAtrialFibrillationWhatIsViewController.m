@interface HROnboardingAtrialFibrillationWhatIsViewController
- (HRVideoPlayerView)videoPlayerView;
- (id)bodyString;
- (id)buttonTitleString;
- (id)createHeroView;
- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4;
- (id)titleString;
- (int64_t)accessibilityGroupID;
- (int64_t)stackedButtonViewLastButtonMode;
- (void)setUpUI;
- (void)setVideoPlayerView:(id)a3;
- (void)viewControllerDidLeaveAdaptiveModal;
- (void)viewControllerWillEnterAdaptiveModal;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HROnboardingAtrialFibrillationWhatIsViewController

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  BOOL v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HROnboardingAtrialFibrillationWhatIsViewController;
  id v5 = [(HROnboardingAtrialFibrillationWhatIsViewController *)&v9 initForOnboarding:a3 upgradingFromAlgorithmVersion:a4];
  v6 = v5;
  if (v5) {
    BOOL v7 = !v4;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    [v5 configureNavigationButtonWithTypeCancelWithConfirmForAtrialFibrillation];
  }
  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HROnboardingAtrialFibrillationWhatIsViewController;
  [(HROnboardingAtrialFibrillationWhatIsViewController *)&v6 viewWillAppear:a3];
  BOOL v4 = [MEMORY[0x263EF93E0] sharedInstance];
  [v4 setCategory:*MEMORY[0x263EF9048] error:0];

  id v5 = [(HROnboardingAtrialFibrillationWhatIsViewController *)self videoPlayerView];
  [v5 play];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HROnboardingAtrialFibrillationWhatIsViewController;
  [(HROnboardingAtrialFibrillationWhatIsViewController *)&v5 viewDidDisappear:a3];
  BOOL v4 = [(HROnboardingAtrialFibrillationWhatIsViewController *)self videoPlayerView];
  [v4 pause];
}

- (void)setUpUI
{
  v3.receiver = self;
  v3.super_class = (Class)HROnboardingAtrialFibrillationWhatIsViewController;
  [(HROnboardingHeroExplanationViewController *)&v3 setUpUI];
  [(HROnboardingHeroExplanationViewController *)self setTextAlignment:1];
}

- (id)createHeroView
{
  videoPlayerView = self->_videoPlayerView;
  if (!videoPlayerView)
  {
    BOOL v4 = HRHeartRhythmUIFrameworkBundle();
    objc_super v5 = [v4 URLForResource:@"Atrial_Fibrillation_Detection_HowitWorks_h264" withExtension:@"mov"];

    objc_super v6 = +[HRVideoPlayerView playerViewWithURL:v5 looping:1];
    [(UIView *)v6 hrui_maskAllCornersWithRadius:*MEMORY[0x263F463A8]];
    BOOL v7 = self->_videoPlayerView;
    self->_videoPlayerView = v6;

    videoPlayerView = self->_videoPlayerView;
  }
  return videoPlayerView;
}

- (id)titleString
{
  v2 = HRHeartRhythmUIFrameworkBundle();
  objc_super v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_HOW_TITLE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  return v3;
}

- (id)bodyString
{
  v2 = HRHeartRhythmUIFrameworkBundle();
  objc_super v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_HOW_BODY" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  return v3;
}

- (id)buttonTitleString
{
  v2 = HRHeartRhythmUIFrameworkBundle();
  objc_super v3 = [v2 localizedStringForKey:@"ONBOARDING_CONTINUE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable"];

  return v3;
}

- (int64_t)stackedButtonViewLastButtonMode
{
  return 0;
}

- (int64_t)accessibilityGroupID
{
  return 2;
}

- (void)viewControllerWillEnterAdaptiveModal
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  BOOL v4 = (void *)MEMORY[0x263F1C3C0];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __90__HROnboardingAtrialFibrillationWhatIsViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v11 = &unk_264580E18;
  objc_copyWeak(&v12, &location);
  objc_super v5 = [v4 actionWithHandler:&v8];
  objc_super v6 = objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  BOOL v7 = [(HROnboardingAtrialFibrillationWhatIsViewController *)self navigationItem];
  [v7 setLeftBarButtonItem:v6];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __90__HROnboardingAtrialFibrillationWhatIsViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2 = [(HROnboardingAtrialFibrillationWhatIsViewController *)self navigationItem];
  [v2 setLeftBarButtonItem:0];
}

- (HRVideoPlayerView)videoPlayerView
{
  return self->_videoPlayerView;
}

- (void)setVideoPlayerView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end