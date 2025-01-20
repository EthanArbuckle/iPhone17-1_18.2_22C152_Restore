@interface HROnboardingElectrocardiogramUpdateCompleteViewController
- (HRMiniTilePlatterView)otherDevicesTile;
- (HROnboardingElectrocardiogramUpdateCompleteViewControllerDelegate)electrocardiogramDelegate;
- (HRStackedButtonView)stackedButtonView;
- (NSLayoutConstraint)contentViewBottomConstraint;
- (UILabel)bodyLabel;
- (UILabel)titleLabel;
- (id)_bodyFont;
- (id)_bodyFontTextStyle;
- (id)_titleFont;
- (id)_titleFontTextStyle;
- (id)bodyString;
- (id)buttonTitleString;
- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4 electrocardiogramDelegate:(id)a5;
- (id)otherDevicesTileAction;
- (id)otherDevicesTileBody;
- (id)otherDevicesTileTitle;
- (id)otherDevicesWithUpdateAvailable;
- (id)titleString;
- (void)_setUpConstraints;
- (void)_setUpUI;
- (void)_showDevicesInWatchAppTapped:(id)a3;
- (void)setBodyLabel:(id)a3;
- (void)setContentViewBottomConstraint:(id)a3;
- (void)setElectrocardiogramDelegate:(id)a3;
- (void)setOtherDevicesTile:(id)a3;
- (void)setStackedButtonView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation HROnboardingElectrocardiogramUpdateCompleteViewController

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4 electrocardiogramDelegate:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HROnboardingElectrocardiogramUpdateCompleteViewController;
  v9 = (id *)[(HROnboardingElectrocardiogramUpdateCompleteViewController *)&v13 initForOnboarding:v6 upgradingFromAlgorithmVersion:a4];
  v10 = v9;
  if (v9)
  {
    v11 = [v9 navigationItem];
    [v11 setHidesBackButton:1];

    objc_storeWeak(v10 + 134, v8);
  }

  return v10;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HROnboardingElectrocardiogramUpdateCompleteViewController;
  [(HROnboardingElectrocardiogramUpdateCompleteViewController *)&v3 viewDidLoad];
  [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self _setUpUI];
  [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self _setUpConstraints];
}

- (void)_setUpUI
{
  v27[1] = *MEMORY[0x263EF8340];
  objc_super v3 = objc_msgSend(MEMORY[0x263F1C768], "hrui_fontAdjustingLabel");
  v4 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self titleString];
  [v3 setText:v4];

  [v3 setTextAlignment:1];
  v5 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self _titleFont];
  [v3 setFont:v5];

  [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self setTitleLabel:v3];
  BOOL v6 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self contentView];
  v7 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self titleLabel];
  [v6 addSubview:v7];

  id v8 = objc_msgSend(MEMORY[0x263F1C768], "hrui_fontAdjustingLabel");
  v9 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self bodyString];
  [v8 setText:v9];

  [v8 setTextAlignment:1];
  v10 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self _bodyFont];
  [v8 setFont:v10];

  [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self setBodyLabel:v8];
  v11 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self contentView];
  v12 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self bodyLabel];
  [v11 addSubview:v12];

  objc_super v13 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self otherDevicesWithUpdateAvailable];
  if ([v13 count])
  {
    v14 = [v13 componentsJoinedByString:@"\n"];
    v15 = [HRMiniTilePlatterView alloc];
    v16 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self otherDevicesTileTitle];
    v17 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self otherDevicesTileBody];
    v18 = objc_msgSend(MEMORY[0x263F1C6B0], "hrui_watchIconImage");
    v19 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self otherDevicesTileAction];
    v20 = [(HRMiniTilePlatterView *)v15 initWithtitle:v16 body:v17 footnote:v14 icon:v18 actionText:v19];

    v21 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__showDevicesInWatchAppTapped_];
    [(HRMiniTilePlatterView *)v20 addGestureRecognizer:v21];
    [(HRMiniTilePlatterView *)v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HRMiniTilePlatterView *)v20 setUserInteractionEnabled:1];

    [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self setOtherDevicesTile:v20];
    v22 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self contentView];
    v23 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self otherDevicesTile];
    [v22 addSubview:v23];
  }
  v24 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self buttonTitleString];
  v27[0] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  v26 = +[HRStackedButtonView buddyStackedButtonViewWithTitles:v25 footerText:0 boldFooterText:0 delegate:self];

  [v26 setBlurHidden:0];
  [v26 setFixedBottomButtonSpacing:1];
  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self setStackedButtonView:v26];
}

- (void)_setUpConstraints
{
  v94[1] = *MEMORY[0x263EF8340];
  objc_super v3 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self titleLabel];
  v4 = [v3 centerXAnchor];
  v5 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self contentView];
  BOOL v6 = [v5 centerXAnchor];
  v7 = [v4 constraintEqualToAnchor:v6];
  [v7 setActive:1];

  id v8 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self titleLabel];
  v9 = [v8 topAnchor];
  v10 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self contentView];
  v11 = [v10 topAnchor];
  [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self contentTop];
  v12 = objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11);
  [v12 setActive:1];

  objc_super v13 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self view];
  [v13 frame];
  double Width = CGRectGetWidth(v95);
  HKHealthUIBuddyDirectionalEdgeInsets();
  double v16 = Width - v15;
  HKHealthUIBuddyDirectionalEdgeInsets();
  double v18 = v16 - v17;

  v19 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self titleLabel];
  [v19 setPreferredMaxLayoutWidth:v18];

  v20 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self titleLabel];
  [v20 intrinsicContentSize];
  double v22 = v21;

  if (v18 >= v22) {
    double v18 = v22;
  }
  v23 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self titleLabel];
  v24 = [v23 widthAnchor];
  v25 = [v24 constraintLessThanOrEqualToConstant:v18];
  [v25 setActive:1];

  v26 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self titleLabel];
  LODWORD(v27) = 1148846080;
  [v26 setContentHuggingPriority:0 forAxis:v27];

  v28 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self bodyLabel];
  v29 = [v28 topAnchor];
  v30 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self titleLabel];
  v31 = [v30 bottomAnchor];
  v32 = [v29 constraintEqualToAnchor:v31 constant:16.0];
  [v32 setActive:1];

  v33 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self bodyLabel];
  v34 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self contentView];
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v33, "hrui_alignHorizontalConstraintsWithView:insets:", v34);

  v35 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self otherDevicesTile];

  if (v35)
  {
    v36 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self otherDevicesTile];
    v37 = [v36 topAnchor];
    v38 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self bodyLabel];
    v39 = [v38 bottomAnchor];
    v40 = [v37 constraintEqualToAnchor:v39 constant:24.0];
    [v40 setActive:1];

    v41 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self otherDevicesTile];
    v42 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self contentView];
    HKHealthUIBuddyDirectionalEdgeInsets();
    objc_msgSend(v41, "hrui_alignHorizontalConstraintsWithView:insets:", v42);

    [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self otherDevicesTile];
  }
  else
  {
    [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self bodyLabel];
  v43 = };
  v44 = [v43 bottomAnchor];

  v45 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self contentView];
  v46 = [v45 bottomAnchor];
  v47 = [v46 constraintEqualToAnchor:v44];
  [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self setContentViewBottomConstraint:v47];

  v48 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self contentViewBottomConstraint];
  [v48 setActive:1];

  v49 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self stackedButtonView];
  HKHealthUIBuddyDirectionalEdgeInsets();
  -[HROnboardingElectrocardiogramUpdateCompleteViewController setFooterView:insets:](self, "setFooterView:insets:", v49);

  v50 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self stackedButtonView];
  v51 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self view];
  [v50 alignBlurViewHorizontalConstraintsWithView:v51];

  v52 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self view];
  [v52 layoutIfNeeded];

  v53 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self view];
  v54 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self stackedButtonView];
  v55 = [v54 buttons];
  v56 = [v55 firstObject];
  [v56 frame];
  double v58 = v57;
  double v60 = v59;
  double v62 = v61;
  double v64 = v63;
  v65 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self stackedButtonView];
  objc_msgSend(v53, "convertRect:fromView:", v65, v58, v60, v62, v64);
  double v67 = v66;

  v68 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self contentView];
  [v68 frame];
  double v70 = v69;
  v71 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self view];
  [v71 safeAreaInsets];
  double v73 = v67 - v72;

  if (v70 <= v73)
  {
    v89 = (void *)MEMORY[0x263F08938];
    v90 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self contentViewBottomConstraint];
    v93 = v90;
    v91 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v93 count:1];
    [v89 deactivateConstraints:v91];

    [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self setContentViewBottomConstraint:0];
    v84 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self contentView];
    v85 = [v84 bottomAnchor];
    v86 = [v85 constraintEqualToAnchor:v44];
    [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self setContentViewBottomConstraint:v86];
  }
  else
  {
    [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self removeFooterView];
    v74 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self contentView];
    v75 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self stackedButtonView];
    [v74 addSubview:v75];

    v76 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self stackedButtonView];
    v77 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self titleLabel];
    objc_msgSend(v76, "hk_alignHorizontalConstraintsWithView:margin:", v77, 0.0);

    v78 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self stackedButtonView];
    v79 = [v78 topAnchor];
    v80 = [v79 constraintEqualToAnchor:v44 constant:*MEMORY[0x263F463B0]];
    [v80 setActive:1];

    v81 = (void *)MEMORY[0x263F08938];
    v82 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self contentViewBottomConstraint];
    v94[0] = v82;
    v83 = [MEMORY[0x263EFF8C0] arrayWithObjects:v94 count:1];
    [v81 deactivateConstraints:v83];

    [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self setContentViewBottomConstraint:0];
    v84 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self contentView];
    v85 = [v84 bottomAnchor];
    v86 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self stackedButtonView];
    v87 = [v86 bottomAnchor];
    v88 = [v85 constraintEqualToAnchor:v87];
    [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self setContentViewBottomConstraint:v88];
  }
  v92 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self contentViewBottomConstraint];
  [v92 setActive:1];
}

- (id)otherDevicesWithUpdateAvailable
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F57730] sharedInstance];
  objc_super v3 = [v2 getPairedDevices];
  double v21 = v2;
  v4 = [v2 getActivePairedDevice];
  id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    uint64_t v9 = *MEMORY[0x263F57580];
    uint64_t v22 = *MEMORY[0x263F57610];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (v11 != v4)
        {
          v12 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"68AB2987-CE75-463C-9EAF-9861B292F01E"];
          int v13 = [v11 supportsCapability:v12];

          v14 = [v11 valueForProperty:v9];

          if (v13 && v14 == 0)
          {
            uint64_t v16 = [v11 valueForProperty:v22];
            double v17 = (void *)v16;
            double v18 = @"(null)";
            if (v16) {
              double v18 = (__CFString *)v16;
            }
            v19 = v18;

            [v23 addObject:v19];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  return v23;
}

- (void)_showDevicesInWatchAppTapped:(id)a3
{
  v4 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self electrocardiogramDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self electrocardiogramDelegate];
    [v6 didTapOnShowDevicesInWatchApp];
  }
}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  if (!a4)
  {
    id v5 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self delegate];
    [v5 stepForward];
  }
}

- (id)_titleFontTextStyle
{
  return (id)*MEMORY[0x263F1D2B0];
}

- (id)_titleFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  objc_super v3 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self _titleFontTextStyle];
  uint64_t v4 = objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 32770);

  return v4;
}

- (id)_bodyFontTextStyle
{
  return (id)*MEMORY[0x263F1D260];
}

- (id)_bodyFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  objc_super v3 = [(HROnboardingElectrocardiogramUpdateCompleteViewController *)self _bodyFontTextStyle];
  uint64_t v4 = [v2 preferredFontForTextStyle:v3];

  return v4;
}

- (id)titleString
{
  return HRUIECGLocalizedString(@"ECG_V2_ONBOARDING_6_TITLE");
}

- (id)bodyString
{
  return HRUIECGLocalizedString(@"ECG_V2_ONBOARDING_6_BODY");
}

- (id)buttonTitleString
{
  v2 = HRHeartRhythmUIFrameworkBundle();
  objc_super v3 = [v2 localizedStringForKey:@"ONBOARDING_DONE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable"];

  return v3;
}

- (id)otherDevicesTileTitle
{
  return HRUIECGLocalizedString(@"ECG_V2_ONBOARDING_6_DEVICES_TITLE");
}

- (id)otherDevicesTileBody
{
  return HRUIECGLocalizedString(@"ECG_V2_ONBOARDING_6_DEVICES_BODY");
}

- (id)otherDevicesTileAction
{
  return HRUIECGLocalizedString(@"ECG_V2_ONBOARDING_6_DEVICES_ACTION");
}

- (HROnboardingElectrocardiogramUpdateCompleteViewControllerDelegate)electrocardiogramDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_electrocardiogramDelegate);
  return (HROnboardingElectrocardiogramUpdateCompleteViewControllerDelegate *)WeakRetained;
}

- (void)setElectrocardiogramDelegate:(id)a3
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

- (HRMiniTilePlatterView)otherDevicesTile
{
  return self->_otherDevicesTile;
}

- (void)setOtherDevicesTile:(id)a3
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
  objc_storeStrong((id *)&self->_otherDevicesTile, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_electrocardiogramDelegate);
}

@end