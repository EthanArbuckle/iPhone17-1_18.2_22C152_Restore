@interface HRAtrialFibrillationIntroViewController
- (UILabel)bodyLabel;
- (UILabel)titleLabel;
- (UIScrollView)scrollView;
- (UIView)contentView;
- (UIView)heroView;
- (UIView)learnMoreContentView;
- (double)_assetImageBottomToTitleFirstBaseline;
- (double)_bodyLastBaselineToContentBottom;
- (double)_titleLastBaselineToBodyFirstBaseline;
- (double)_titleTopToFirstBaselineLeading;
- (id)_bodyFont;
- (id)_bodyFontTextStyle;
- (id)_createHeroView;
- (id)_titleFont;
- (id)_titleFontTextStyle;
- (void)setBodyLabel:(id)a3;
- (void)setContentView:(id)a3;
- (void)setHeroView:(id)a3;
- (void)setLearnMoreContentView:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpConstraints;
- (void)setUpUI;
- (void)viewControllerDidLeaveAdaptiveModal;
- (void)viewControllerWillEnterAdaptiveModal;
- (void)viewDidLoad;
@end

@implementation HRAtrialFibrillationIntroViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HRAtrialFibrillationIntroViewController;
  [(HRAtrialFibrillationIntroViewController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x263F1C550] systemBackgroundColor];
  v4 = [(HRAtrialFibrillationIntroViewController *)self view];
  [v4 setBackgroundColor:v3];

  [(HRAtrialFibrillationIntroViewController *)self setUpUI];
  [(HRAtrialFibrillationIntroViewController *)self setUpConstraints];
}

- (void)setUpUI
{
  id v3 = objc_alloc_init(MEMORY[0x263F1C940]);
  [(HRAtrialFibrillationIntroViewController *)self setScrollView:v3];

  v4 = [(HRAtrialFibrillationIntroViewController *)self scrollView];
  [v4 setAlwaysBounceVertical:1];

  objc_super v5 = [(HRAtrialFibrillationIntroViewController *)self scrollView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(HRAtrialFibrillationIntroViewController *)self view];
  v7 = [(HRAtrialFibrillationIntroViewController *)self scrollView];
  [v6 addSubview:v7];

  id v8 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [(HRAtrialFibrillationIntroViewController *)self setContentView:v8];

  v9 = [(HRAtrialFibrillationIntroViewController *)self contentView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = [(HRAtrialFibrillationIntroViewController *)self scrollView];
  v11 = [(HRAtrialFibrillationIntroViewController *)self contentView];
  [v10 addSubview:v11];

  v12 = [(HRAtrialFibrillationIntroViewController *)self _createHeroView];
  [(HRAtrialFibrillationIntroViewController *)self setHeroView:v12];

  v13 = [(HRAtrialFibrillationIntroViewController *)self heroView];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  v14 = [(HRAtrialFibrillationIntroViewController *)self contentView];
  v15 = [(HRAtrialFibrillationIntroViewController *)self heroView];
  [v14 addSubview:v15];

  id v16 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HRAtrialFibrillationIntroViewController *)self setTitleLabel:v16];

  v17 = HRHeartRhythmUIFrameworkBundle();
  v18 = [v17 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_INTRO_TITLE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
  v19 = [(HRAtrialFibrillationIntroViewController *)self titleLabel];
  [v19 setText:v18];

  v20 = [(HRAtrialFibrillationIntroViewController *)self titleLabel];
  [v20 setTextAlignment:1];

  v21 = [(HRAtrialFibrillationIntroViewController *)self _titleFont];
  v22 = [(HRAtrialFibrillationIntroViewController *)self titleLabel];
  [v22 setFont:v21];

  v23 = [(HRAtrialFibrillationIntroViewController *)self titleLabel];
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

  v24 = [(HRAtrialFibrillationIntroViewController *)self titleLabel];
  [v24 setNumberOfLines:0];

  v25 = [(HRAtrialFibrillationIntroViewController *)self contentView];
  v26 = [(HRAtrialFibrillationIntroViewController *)self titleLabel];
  [v25 addSubview:v26];

  id v27 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HRAtrialFibrillationIntroViewController *)self setBodyLabel:v27];

  v28 = HRHeartRhythmUIFrameworkBundle();
  v29 = [v28 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_INTRO_BODY" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
  v30 = [(HRAtrialFibrillationIntroViewController *)self bodyLabel];
  [v30 setText:v29];

  v31 = [(HRAtrialFibrillationIntroViewController *)self _bodyFont];
  v32 = [(HRAtrialFibrillationIntroViewController *)self bodyLabel];
  [v32 setFont:v31];

  v33 = [(HRAtrialFibrillationIntroViewController *)self bodyLabel];
  [v33 setTranslatesAutoresizingMaskIntoConstraints:0];

  v34 = [(HRAtrialFibrillationIntroViewController *)self bodyLabel];
  [v34 setNumberOfLines:0];

  v35 = [(HRAtrialFibrillationIntroViewController *)self contentView];
  v36 = [(HRAtrialFibrillationIntroViewController *)self bodyLabel];
  [v35 addSubview:v36];

  v37 = +[HROnboardingInlineExpandedContentView learnMoreAboutAtrialFibrillationExpandedView];
  [(HRAtrialFibrillationIntroViewController *)self setLearnMoreContentView:v37];

  id v39 = [(HRAtrialFibrillationIntroViewController *)self contentView];
  v38 = [(HRAtrialFibrillationIntroViewController *)self learnMoreContentView];
  [v39 addSubview:v38];
}

- (void)setUpConstraints
{
  id v3 = [(HRAtrialFibrillationIntroViewController *)self scrollView];
  v4 = [(HRAtrialFibrillationIntroViewController *)self view];
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:margin:", v4, 0.0);

  objc_super v5 = [(HRAtrialFibrillationIntroViewController *)self scrollView];
  v6 = [v5 topAnchor];
  v7 = [(HRAtrialFibrillationIntroViewController *)self view];
  id v8 = [v7 topAnchor];
  v9 = [v6 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  v10 = [(HRAtrialFibrillationIntroViewController *)self scrollView];
  v11 = [v10 bottomAnchor];
  v12 = [(HRAtrialFibrillationIntroViewController *)self view];
  v13 = [v12 bottomAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  v15 = [(HRAtrialFibrillationIntroViewController *)self contentView];
  id v16 = [(HRAtrialFibrillationIntroViewController *)self scrollView];
  objc_msgSend(v15, "hk_alignHorizontalConstraintsWithView:margin:", v16, 0.0);

  v17 = [(HRAtrialFibrillationIntroViewController *)self contentView];
  v18 = [(HRAtrialFibrillationIntroViewController *)self scrollView];
  objc_msgSend(v17, "hk_alignVerticalConstraintsWithView:margin:", v18, 0.0);

  v19 = [(HRAtrialFibrillationIntroViewController *)self contentView];
  v20 = [(HRAtrialFibrillationIntroViewController *)self view];
  objc_msgSend(v19, "hk_alignHorizontalConstraintsWithView:margin:", v20, 0.0);

  v21 = [(HRAtrialFibrillationIntroViewController *)self heroView];
  v22 = [(HRAtrialFibrillationIntroViewController *)self contentView];
  objc_msgSend(v21, "hk_alignHorizontalConstraintsWithView:margin:", v22, 0.0);

  v23 = [(HRAtrialFibrillationIntroViewController *)self heroView];
  v24 = [v23 topAnchor];
  v25 = [(HRAtrialFibrillationIntroViewController *)self contentView];
  v26 = [v25 topAnchor];
  id v27 = [v24 constraintEqualToAnchor:v26 constant:16.0];
  [v27 setActive:1];

  v28 = [(HRAtrialFibrillationIntroViewController *)self titleLabel];
  v29 = [(HRAtrialFibrillationIntroViewController *)self contentView];
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v28, "hrui_alignHorizontalConstraintsWithView:insets:", v29);

  v30 = [(HRAtrialFibrillationIntroViewController *)self titleLabel];
  v31 = [v30 firstBaselineAnchor];
  v32 = [(HRAtrialFibrillationIntroViewController *)self heroView];
  v33 = [v32 bottomAnchor];
  [(HRAtrialFibrillationIntroViewController *)self _assetImageBottomToTitleFirstBaseline];
  v34 = objc_msgSend(v31, "constraintEqualToAnchor:constant:", v33);
  [v34 setActive:1];

  v35 = [(HRAtrialFibrillationIntroViewController *)self bodyLabel];
  v36 = [(HRAtrialFibrillationIntroViewController *)self titleLabel];
  objc_msgSend(v35, "hk_alignHorizontalConstraintsWithView:margin:", v36, 0.0);

  v37 = [(HRAtrialFibrillationIntroViewController *)self bodyLabel];
  v38 = [v37 firstBaselineAnchor];
  id v39 = [(HRAtrialFibrillationIntroViewController *)self titleLabel];
  v40 = [v39 lastBaselineAnchor];
  [(HRAtrialFibrillationIntroViewController *)self _titleLastBaselineToBodyFirstBaseline];
  v41 = objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40);
  [v41 setActive:1];

  v42 = [(HRAtrialFibrillationIntroViewController *)self learnMoreContentView];
  v43 = [v42 leadingAnchor];
  v44 = [(HRAtrialFibrillationIntroViewController *)self titleLabel];
  v45 = [v44 leadingAnchor];
  v46 = [v43 constraintEqualToAnchor:v45];
  [v46 setActive:1];

  v47 = [(HRAtrialFibrillationIntroViewController *)self learnMoreContentView];
  v48 = [v47 trailingAnchor];
  v49 = [(HRAtrialFibrillationIntroViewController *)self titleLabel];
  v50 = [v49 trailingAnchor];
  v51 = [v48 constraintLessThanOrEqualToAnchor:v50];
  [v51 setActive:1];

  v52 = [(HRAtrialFibrillationIntroViewController *)self learnMoreContentView];
  v53 = [v52 topAnchor];
  v54 = [(HRAtrialFibrillationIntroViewController *)self bodyLabel];
  v55 = [v54 bottomAnchor];
  v56 = [v53 constraintEqualToAnchor:v55];
  [v56 setActive:1];

  id v61 = [(HRAtrialFibrillationIntroViewController *)self contentView];
  v57 = [v61 bottomAnchor];
  v58 = [(HRAtrialFibrillationIntroViewController *)self learnMoreContentView];
  v59 = [v58 lastBaselineAnchor];
  [(HRAtrialFibrillationIntroViewController *)self _bodyLastBaselineToContentBottom];
  v60 = objc_msgSend(v57, "constraintEqualToAnchor:constant:", v59);
  [v60 setActive:1];
}

- (id)_createHeroView
{
  v13[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F1CB60]);
  id v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v4 = objc_alloc_init(HRSimulatedAtrialFibrillationNotificationView);
  [v3 addSubview:v4];
  [(HRSimulatedAtrialFibrillationNotificationView *)v4 hk_alignVerticalConstraintsWithView:v3 margin:0.0];
  objc_super v5 = (void *)MEMORY[0x263F08938];
  v6 = [(HRSimulatedAtrialFibrillationNotificationView *)v4 widthAnchor];
  v7 = [v6 constraintEqualToConstant:160.0];
  v13[0] = v7;
  id v8 = [(HRSimulatedAtrialFibrillationNotificationView *)v4 centerXAnchor];
  v9 = [v3 centerXAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  v13[1] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  [v5 activateConstraints:v11];

  return v3;
}

- (id)_titleFontTextStyle
{
  return (id)*MEMORY[0x263F1D2B0];
}

- (id)_titleFont
{
  id v2 = (void *)MEMORY[0x263F1C658];
  id v3 = [(HRAtrialFibrillationIntroViewController *)self _titleFontTextStyle];
  v4 = objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 32770);

  return v4;
}

- (id)_bodyFontTextStyle
{
  return (id)*MEMORY[0x263F1D260];
}

- (id)_bodyFont
{
  id v2 = (void *)MEMORY[0x263F1C658];
  id v3 = [(HRAtrialFibrillationIntroViewController *)self _bodyFontTextStyle];
  v4 = [v2 preferredFontForTextStyle:v3];

  return v4;
}

- (double)_assetImageBottomToTitleFirstBaseline
{
  id v2 = [(HRAtrialFibrillationIntroViewController *)self _titleFont];
  [v2 _scaledValueForValue:54.0];
  double v4 = v3;

  return v4;
}

- (double)_titleTopToFirstBaselineLeading
{
  int v2 = objc_msgSend(MEMORY[0x263F1C920], "hrui_currentDeviceHas5Point8InchScreen");
  double result = 36.0;
  if (v2) {
    return 44.0;
  }
  return result;
}

- (double)_titleLastBaselineToBodyFirstBaseline
{
  id v3 = objc_alloc(MEMORY[0x263F1C668]);
  double v4 = [(HRAtrialFibrillationIntroViewController *)self _bodyFontTextStyle];
  objc_super v5 = (void *)[v3 initForTextStyle:v4];

  [v5 scaledValueForValue:32.0];
  double v7 = v6;

  return v7;
}

- (double)_bodyLastBaselineToContentBottom
{
  id v3 = objc_alloc(MEMORY[0x263F1C668]);
  double v4 = [(HRAtrialFibrillationIntroViewController *)self _bodyFontTextStyle];
  objc_super v5 = (void *)[v3 initForTextStyle:v4];

  [v5 scaledValueForValue:48.0];
  double v7 = v6;

  return v7;
}

- (void)viewControllerWillEnterAdaptiveModal
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  double v4 = (void *)MEMORY[0x263F1C3C0];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __79__HRAtrialFibrillationIntroViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v11 = &unk_264580E18;
  objc_copyWeak(&v12, &location);
  objc_super v5 = [v4 actionWithHandler:&v8];
  double v6 = objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  double v7 = [(HRAtrialFibrillationIntroViewController *)self navigationItem];
  [v7 setLeftBarButtonItem:v6];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __79__HRAtrialFibrillationIntroViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2 = [(HRAtrialFibrillationIntroViewController *)self navigationItem];
  [v2 setLeftBarButtonItem:0];
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIView)heroView
{
  return self->_heroView;
}

- (void)setHeroView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
}

- (UIView)learnMoreContentView
{
  return self->_learnMoreContentView;
}

- (void)setLearnMoreContentView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_learnMoreContentView, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_heroView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end