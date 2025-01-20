@interface HROnboardingElectrocardiogramExplanationViewController
- (HRStackedButtonView)stackedButtonView;
- (HRVideoPlayerView)animatedWatchRhythmVideoView;
- (NSLayoutConstraint)contentViewBottomConstraint;
- (UILabel)bodyLabel;
- (UILabel)titleLabel;
- (double)_titleBottomToVideoViewTop;
- (double)_videoViewBottomToBodyFirstBaseline;
- (id)_bodyFont;
- (id)_bodyFontTextStyle;
- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4;
- (void)_adjustButtonFooterViewLocationForViewContentHeight;
- (void)_setUpButtonFooterView;
- (void)setAnimatedWatchRhythmVideoView:(id)a3;
- (void)setBodyLabel:(id)a3;
- (void)setContentViewBottomConstraint:(id)a3;
- (void)setStackedButtonView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpConstraints;
- (void)setUpUI;
- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4;
- (void)viewControllerDidLeaveAdaptiveModal;
- (void)viewControllerWillEnterAdaptiveModal;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HROnboardingElectrocardiogramExplanationViewController

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  BOOL v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HROnboardingElectrocardiogramExplanationViewController;
  id v5 = [(HROnboardingElectrocardiogramExplanationViewController *)&v9 initForOnboarding:a3 upgradingFromAlgorithmVersion:a4];
  v6 = v5;
  if (v5) {
    BOOL v7 = !v4;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    [v5 configureNavigationButtonWithTypeCancelWithConfirmForElectrocardiogram];
  }
  return v6;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HROnboardingElectrocardiogramExplanationViewController;
  [(HROnboardingElectrocardiogramExplanationViewController *)&v3 viewDidLoad];
  [(HROnboardingElectrocardiogramExplanationViewController *)self _setUpButtonFooterView];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HROnboardingElectrocardiogramExplanationViewController;
  [(HROnboardingElectrocardiogramExplanationViewController *)&v3 viewDidLayoutSubviews];
  [(HROnboardingElectrocardiogramExplanationViewController *)self _adjustButtonFooterViewLocationForViewContentHeight];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HROnboardingElectrocardiogramExplanationViewController;
  [(HROnboardingElectrocardiogramExplanationViewController *)&v6 viewWillAppear:a3];
  BOOL v4 = [MEMORY[0x263EF93E0] sharedInstance];
  [v4 setCategory:*MEMORY[0x263EF9048] error:0];

  id v5 = [(HROnboardingElectrocardiogramExplanationViewController *)self animatedWatchRhythmVideoView];
  [v5 play];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HROnboardingElectrocardiogramExplanationViewController;
  [(HROnboardingElectrocardiogramExplanationViewController *)&v5 viewDidDisappear:a3];
  BOOL v4 = [(HROnboardingElectrocardiogramExplanationViewController *)self animatedWatchRhythmVideoView];
  [v4 pause];
}

- (void)setUpUI
{
  v44[1] = *MEMORY[0x263EF8340];
  v43.receiver = self;
  v43.super_class = (Class)HROnboardingElectrocardiogramExplanationViewController;
  [(HROnboardingElectrocardiogramExplanationViewController *)&v43 setUpUI];
  id v3 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingElectrocardiogramExplanationViewController *)self setTitleLabel:v3];

  BOOL v4 = HRUIECGLocalizedString(@"ECG_ONBOARDING_2_TITLE");
  objc_super v5 = [(HROnboardingElectrocardiogramExplanationViewController *)self titleLabel];
  [v5 setText:v4];

  objc_super v6 = [NSString healthAccessibilityIdentifier:1 suffix:@"Onboarding.PageTitle"];
  BOOL v7 = [(HROnboardingElectrocardiogramExplanationViewController *)self titleLabel];
  [v7 setAccessibilityIdentifier:v6];

  v8 = [(HROnboardingElectrocardiogramExplanationViewController *)self titleLabel];
  [v8 setTextAlignment:1];

  objc_super v9 = [(HROnboardingElectrocardiogramExplanationViewController *)self titleFont];
  v10 = [(HROnboardingElectrocardiogramExplanationViewController *)self titleLabel];
  [v10 setFont:v9];

  v11 = [(HROnboardingElectrocardiogramExplanationViewController *)self titleLabel];
  [v11 setAdjustsFontForContentSizeCategory:1];

  v12 = [(HROnboardingElectrocardiogramExplanationViewController *)self titleLabel];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  v13 = [(HROnboardingElectrocardiogramExplanationViewController *)self titleLabel];
  [v13 setNumberOfLines:0];

  v14 = [(HROnboardingElectrocardiogramExplanationViewController *)self contentView];
  v15 = [(HROnboardingElectrocardiogramExplanationViewController *)self titleLabel];
  [v14 addSubview:v15];

  v16 = NSURL;
  v17 = objc_msgSend(NSString, "hrui_explanationVideoPath");
  v18 = [v16 fileURLWithPath:v17];

  v19 = +[HRVideoPlayerView playerViewWithURL:v18 looping:1];
  [(HROnboardingElectrocardiogramExplanationViewController *)self setAnimatedWatchRhythmVideoView:v19];

  v20 = [(HROnboardingElectrocardiogramExplanationViewController *)self animatedWatchRhythmVideoView];
  objc_msgSend(v20, "hrui_maskAllCornersWithRadius:", *MEMORY[0x263F463A8]);

  v21 = [(HROnboardingElectrocardiogramExplanationViewController *)self contentView];
  v22 = [(HROnboardingElectrocardiogramExplanationViewController *)self animatedWatchRhythmVideoView];
  [v21 addSubview:v22];

  id v23 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingElectrocardiogramExplanationViewController *)self setBodyLabel:v23];

  v24 = HRUIECGLocalizedString(@"ECG_ONBOARDING_2_BODY");
  v25 = [(HROnboardingElectrocardiogramExplanationViewController *)self bodyLabel];
  [v25 setText:v24];

  v26 = [NSString healthAccessibilityIdentifier:1 suffix:@"Onboarding.HowECGWorks"];
  v27 = [(HROnboardingElectrocardiogramExplanationViewController *)self bodyLabel];
  [v27 setAccessibilityIdentifier:v26];

  v28 = [(HROnboardingElectrocardiogramExplanationViewController *)self bodyLabel];
  [v28 setTextAlignment:1];

  v29 = [(HROnboardingElectrocardiogramExplanationViewController *)self _bodyFont];
  v30 = [(HROnboardingElectrocardiogramExplanationViewController *)self bodyLabel];
  [v30 setFont:v29];

  v31 = [(HROnboardingElectrocardiogramExplanationViewController *)self bodyLabel];
  [v31 setAdjustsFontForContentSizeCategory:1];

  v32 = [(HROnboardingElectrocardiogramExplanationViewController *)self bodyLabel];
  [v32 setTranslatesAutoresizingMaskIntoConstraints:0];

  v33 = [(HROnboardingElectrocardiogramExplanationViewController *)self bodyLabel];
  [v33 setNumberOfLines:0];

  v34 = [(HROnboardingElectrocardiogramExplanationViewController *)self contentView];
  v35 = [(HROnboardingElectrocardiogramExplanationViewController *)self bodyLabel];
  [v34 addSubview:v35];

  if ([(HROnboardingElectrocardiogramExplanationViewController *)self isOnboarding])
  {
    v36 = HRHeartRhythmUIFrameworkBundle();
    v37 = [v36 localizedStringForKey:@"ONBOARDING_CONTINUE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable"];
    v44[0] = v37;
    v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:1];
    v39 = +[HRStackedButtonView buddyStackedButtonViewWithTitles:v38 footerText:0 boldFooterText:0 delegate:self];
    [(HROnboardingElectrocardiogramExplanationViewController *)self setStackedButtonView:v39];

    v40 = [(HROnboardingElectrocardiogramExplanationViewController *)self stackedButtonView];
    [v40 setBlurHidden:0];

    v41 = [(HROnboardingElectrocardiogramExplanationViewController *)self stackedButtonView];
    [v41 setFixedBottomButtonSpacing:1];

    v42 = [(HROnboardingElectrocardiogramExplanationViewController *)self stackedButtonView];
    [v42 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
}

- (void)setUpConstraints
{
  v30.receiver = self;
  v30.super_class = (Class)HROnboardingElectrocardiogramExplanationViewController;
  [(HROnboardingElectrocardiogramExplanationViewController *)&v30 setUpConstraints];
  id v3 = [(HROnboardingElectrocardiogramExplanationViewController *)self titleLabel];
  BOOL v4 = [(HROnboardingElectrocardiogramExplanationViewController *)self contentView];
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v3, "hrui_alignHorizontalConstraintsWithView:insets:", v4);

  objc_super v5 = [(HROnboardingElectrocardiogramExplanationViewController *)self titleLabel];
  objc_super v6 = [v5 topAnchor];
  BOOL v7 = [(HROnboardingElectrocardiogramExplanationViewController *)self contentView];
  v8 = [v7 topAnchor];
  [(HROnboardingElectrocardiogramExplanationViewController *)self contentTop];
  objc_super v9 = objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8);
  [v9 setActive:1];

  v10 = [(HROnboardingElectrocardiogramExplanationViewController *)self animatedWatchRhythmVideoView];
  v11 = [(HROnboardingElectrocardiogramExplanationViewController *)self titleLabel];
  objc_msgSend(v10, "hk_alignHorizontalConstraintsWithView:margin:", v11, 0.0);

  v12 = [(HROnboardingElectrocardiogramExplanationViewController *)self animatedWatchRhythmVideoView];
  v13 = [v12 topAnchor];
  v14 = [(HROnboardingElectrocardiogramExplanationViewController *)self titleLabel];
  v15 = [v14 bottomAnchor];
  [(HROnboardingElectrocardiogramExplanationViewController *)self _titleBottomToVideoViewTop];
  v16 = objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15);
  [v16 setActive:1];

  v17 = [(HROnboardingElectrocardiogramExplanationViewController *)self bodyLabel];
  v18 = [(HROnboardingElectrocardiogramExplanationViewController *)self titleLabel];
  objc_msgSend(v17, "hk_alignHorizontalConstraintsWithView:margin:", v18, 0.0);

  v19 = [(HROnboardingElectrocardiogramExplanationViewController *)self bodyLabel];
  v20 = [v19 firstBaselineAnchor];
  v21 = [(HROnboardingElectrocardiogramExplanationViewController *)self animatedWatchRhythmVideoView];
  v22 = [v21 bottomAnchor];
  [(HROnboardingElectrocardiogramExplanationViewController *)self _videoViewBottomToBodyFirstBaseline];
  id v23 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22);
  [v23 setActive:1];

  v24 = [(HROnboardingElectrocardiogramExplanationViewController *)self contentView];
  v25 = [v24 bottomAnchor];
  v26 = [(HROnboardingElectrocardiogramExplanationViewController *)self bodyLabel];
  v27 = [v26 bottomAnchor];
  v28 = [v25 constraintEqualToAnchor:v27 constant:*MEMORY[0x263F46378]];
  [(HROnboardingElectrocardiogramExplanationViewController *)self setContentViewBottomConstraint:v28];

  v29 = [(HROnboardingElectrocardiogramExplanationViewController *)self contentViewBottomConstraint];
  [v29 setActive:1];
}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  if (!a4)
  {
    id v5 = [(HROnboardingElectrocardiogramExplanationViewController *)self delegate];
    [v5 stepForward];
  }
}

- (void)_setUpButtonFooterView
{
  if ([(HROnboardingElectrocardiogramExplanationViewController *)self isOnboarding])
  {
    id v3 = [(HROnboardingElectrocardiogramExplanationViewController *)self stackedButtonView];
    HKHealthUIBuddyDirectionalEdgeInsets();
    -[HROnboardingElectrocardiogramExplanationViewController setFooterView:insets:](self, "setFooterView:insets:", v3);

    id v5 = [(HROnboardingElectrocardiogramExplanationViewController *)self stackedButtonView];
    uint64_t v4 = [(HROnboardingElectrocardiogramExplanationViewController *)self view];
    [v5 alignBlurViewHorizontalConstraintsWithView:v4];
  }
}

- (void)_adjustButtonFooterViewLocationForViewContentHeight
{
  v44[1] = *MEMORY[0x263EF8340];
  if ([(HROnboardingElectrocardiogramExplanationViewController *)self isOnboarding])
  {
    id v3 = [(HROnboardingElectrocardiogramExplanationViewController *)self view];
    [v3 layoutIfNeeded];

    uint64_t v4 = [(HROnboardingElectrocardiogramExplanationViewController *)self view];
    id v5 = [(HROnboardingElectrocardiogramExplanationViewController *)self stackedButtonView];
    objc_super v6 = [v5 buttons];
    BOOL v7 = [v6 firstObject];
    [v7 frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16 = [(HROnboardingElectrocardiogramExplanationViewController *)self stackedButtonView];
    objc_msgSend(v4, "convertRect:fromView:", v16, v9, v11, v13, v15);
    double v18 = v17;

    v19 = [(HROnboardingElectrocardiogramExplanationViewController *)self contentView];
    [v19 frame];
    double v21 = v20;
    v22 = [(HROnboardingElectrocardiogramExplanationViewController *)self view];
    [v22 safeAreaInsets];
    double v24 = v18 - v23;

    if (v21 > v24)
    {
      [(HROnboardingElectrocardiogramExplanationViewController *)self removeFooterView];
      v25 = [(HROnboardingElectrocardiogramExplanationViewController *)self contentView];
      v26 = [(HROnboardingElectrocardiogramExplanationViewController *)self stackedButtonView];
      [v25 addSubview:v26];

      v27 = [(HROnboardingElectrocardiogramExplanationViewController *)self stackedButtonView];
      [v27 setBlurHidden:1];

      v28 = [(HROnboardingElectrocardiogramExplanationViewController *)self stackedButtonView];
      v29 = [(HROnboardingElectrocardiogramExplanationViewController *)self titleLabel];
      objc_msgSend(v28, "hk_alignHorizontalConstraintsWithView:margin:", v29, 0.0);

      objc_super v30 = [(HROnboardingElectrocardiogramExplanationViewController *)self stackedButtonView];
      v31 = [v30 topAnchor];
      v32 = [(HROnboardingElectrocardiogramExplanationViewController *)self bodyLabel];
      v33 = [v32 bottomAnchor];
      v34 = [v31 constraintEqualToAnchor:v33 constant:*MEMORY[0x263F463B0]];
      [v34 setActive:1];

      v35 = (void *)MEMORY[0x263F08938];
      v36 = [(HROnboardingElectrocardiogramExplanationViewController *)self contentViewBottomConstraint];
      v44[0] = v36;
      v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:1];
      [v35 deactivateConstraints:v37];

      [(HROnboardingElectrocardiogramExplanationViewController *)self setContentViewBottomConstraint:0];
      v38 = [(HROnboardingElectrocardiogramExplanationViewController *)self contentView];
      v39 = [v38 bottomAnchor];
      v40 = [(HROnboardingElectrocardiogramExplanationViewController *)self stackedButtonView];
      v41 = [v40 bottomAnchor];
      v42 = [v39 constraintEqualToAnchor:v41];
      [(HROnboardingElectrocardiogramExplanationViewController *)self setContentViewBottomConstraint:v42];

      objc_super v43 = [(HROnboardingElectrocardiogramExplanationViewController *)self contentViewBottomConstraint];
      [v43 setActive:1];
    }
  }
}

- (double)_titleBottomToVideoViewTop
{
  v2 = [(HROnboardingElectrocardiogramExplanationViewController *)self titleFont];
  [v2 _scaledValueForValue:37.0];
  double v4 = v3;

  return v4;
}

- (id)_bodyFontTextStyle
{
  return (id)*MEMORY[0x263F1D260];
}

- (id)_bodyFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  double v3 = [(HROnboardingElectrocardiogramExplanationViewController *)self _bodyFontTextStyle];
  double v4 = [v2 preferredFontForTextStyle:v3];

  return v4;
}

- (double)_videoViewBottomToBodyFirstBaseline
{
  v2 = [(HROnboardingElectrocardiogramExplanationViewController *)self _bodyFont];
  [v2 _scaledValueForValue:30.0];
  double v4 = v3;

  return v4;
}

- (void)viewControllerWillEnterAdaptiveModal
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  double v4 = (void *)MEMORY[0x263F1C3C0];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  double v10 = __94__HROnboardingElectrocardiogramExplanationViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  double v11 = &unk_264580E18;
  objc_copyWeak(&v12, &location);
  id v5 = [v4 actionWithHandler:&v8];
  objc_super v6 = objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  BOOL v7 = [(HROnboardingElectrocardiogramExplanationViewController *)self navigationItem];
  [v7 setLeftBarButtonItem:v6];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __94__HROnboardingElectrocardiogramExplanationViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2 = [(HROnboardingElectrocardiogramExplanationViewController *)self navigationItem];
  [v2 setLeftBarButtonItem:0];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (HRVideoPlayerView)animatedWatchRhythmVideoView
{
  return self->_animatedWatchRhythmVideoView;
}

- (void)setAnimatedWatchRhythmVideoView:(id)a3
{
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
}

- (HRStackedButtonView)stackedButtonView
{
  return self->_stackedButtonView;
}

- (void)setStackedButtonView:(id)a3
{
}

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return self->_contentViewBottomConstraint;
}

- (void)setContentViewBottomConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_stackedButtonView, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_animatedWatchRhythmVideoView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end