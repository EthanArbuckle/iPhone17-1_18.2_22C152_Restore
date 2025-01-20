@interface HROnboardingElectrocardiogramSetupCompleteViewController
- (BOOL)firstViewDidLayoutSubviews;
- (BOOL)isSampleInteractive;
- (HKAnchoredObjectQuery)electrocardiogramQuery;
- (HKElectrocardiogram)electrocardiogram;
- (HKElectrocardiogramCardView)electrocardiogramCardView;
- (HROnboardingElectrocardiogramSetupCompleteViewControllerDelegate)electrocardiogramDelegate;
- (HRStackedButtonView)stackedButtonView;
- (NSLayoutConstraint)contentViewBottomConstraint;
- (NSLayoutYAxisAnchor)viewBottomAnchor;
- (UIActivityIndicatorView)activityIndicatorView;
- (UILabel)bodyLabel;
- (UILabel)classificationLabel;
- (UILabel)titleLabel;
- (UITapGestureRecognizer)electrocardiogramCardTapGestureRecognizer;
- (double)_classificationTextDistance;
- (id)_bodyFont;
- (id)_bodyFontTextStyle;
- (id)_classificationAttributedTextForElectrocardiogram:(id)a3 activeAlgorithmVersion:(int64_t)a4;
- (id)_subheadlineFont;
- (id)initForOnboarding:(BOOL)a3 isSampleInteractive:(BOOL)a4 electrocardiogramDelegate:(id)a5;
- (int64_t)state;
- (void)_electrocardiogramCardViewTapped:(id)a3;
- (void)_recomputeState;
- (void)_resetUI;
- (void)_setUpConstraints;
- (void)_setUpElectrocardiogramQuery;
- (void)_setUpUI;
- (void)_setupBodyLabelForSetupCompleteState:(int64_t)a3;
- (void)_stopElectrocardiogramQuery;
- (void)_updateUI;
- (void)_updateUIForElectrocardiogram:(id)a3;
- (void)setActivityIndicatorView:(id)a3;
- (void)setBodyLabel:(id)a3;
- (void)setClassificationLabel:(id)a3;
- (void)setContentViewBottomConstraint:(id)a3;
- (void)setElectrocardiogram:(id)a3;
- (void)setElectrocardiogramCardTapGestureRecognizer:(id)a3;
- (void)setElectrocardiogramCardView:(id)a3;
- (void)setElectrocardiogramDelegate:(id)a3;
- (void)setElectrocardiogramQuery:(id)a3;
- (void)setFirstViewDidLayoutSubviews:(BOOL)a3;
- (void)setStackedButtonView:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTitleLabel:(id)a3;
- (void)setViewBottomAnchor:(id)a3;
- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation HROnboardingElectrocardiogramSetupCompleteViewController

- (id)initForOnboarding:(BOOL)a3 isSampleInteractive:(BOOL)a4 electrocardiogramDelegate:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  uint64_t v9 = *MEMORY[0x263F0AA58];
  v14.receiver = self;
  v14.super_class = (Class)HROnboardingElectrocardiogramSetupCompleteViewController;
  v10 = (id *)[(HROnboardingElectrocardiogramSetupCompleteViewController *)&v14 initForOnboarding:v6 upgradingFromAlgorithmVersion:v9];
  v11 = v10;
  if (v10)
  {
    v12 = [v10 navigationItem];
    [v12 setHidesBackButton:1];

    objc_storeWeak(v11 + 139, v8);
    *((unsigned char *)v11 + 1072) = 1;
    *((unsigned char *)v11 + 1073) = a4;
  }

  return v11;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HROnboardingElectrocardiogramSetupCompleteViewController;
  [(HROnboardingElectrocardiogramSetupCompleteViewController *)&v3 viewDidLoad];
  [(HROnboardingElectrocardiogramSetupCompleteViewController *)self _recomputeState];
  [(HROnboardingElectrocardiogramSetupCompleteViewController *)self _setUpUI];
  [(HROnboardingElectrocardiogramSetupCompleteViewController *)self _setUpConstraints];
  if ([(HROnboardingElectrocardiogramSetupCompleteViewController *)self state] == 1) {
    [(HROnboardingElectrocardiogramSetupCompleteViewController *)self _setUpElectrocardiogramQuery];
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HROnboardingElectrocardiogramSetupCompleteViewController;
  [(HROnboardingElectrocardiogramSetupCompleteViewController *)&v3 viewDidLayoutSubviews];
  if ([(HROnboardingElectrocardiogramSetupCompleteViewController *)self firstViewDidLayoutSubviews])
  {
    [(HROnboardingElectrocardiogramSetupCompleteViewController *)self setFirstViewDidLayoutSubviews:0];
    [(HROnboardingElectrocardiogramSetupCompleteViewController *)self _updateUI];
  }
}

- (void)_setUpUI
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  v2 = "-[HROnboardingElectrocardiogramSetupCompleteViewController _setUpUI]";
  _os_log_error_impl(&dword_220CA3000, log, OS_LOG_TYPE_ERROR, "%{public}s: Failed to fetch active algorithm version.", (uint8_t *)&v1, 0xCu);
}

- (void)_resetUI
{
  uint64_t v3 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self titleLabel];
  [v3 removeFromSuperview];

  v4 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self activityIndicatorView];
  [v4 removeFromSuperview];

  v5 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self activityIndicatorView];
  [v5 stopAnimating];

  BOOL v6 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self classificationLabel];
  [v6 removeFromSuperview];

  v7 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self electrocardiogramCardView];
  id v8 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self electrocardiogramCardTapGestureRecognizer];
  [v7 removeGestureRecognizer:v8];

  uint64_t v9 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self electrocardiogramCardView];
  [v9 removeFromSuperview];

  v10 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self bodyLabel];
  [v10 removeFromSuperview];

  v11 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self stackedButtonView];
  [v11 removeFromSuperview];

  [(HROnboardingElectrocardiogramSetupCompleteViewController *)self removeFooterView];
}

- (void)_setUpConstraints
{
  v113[1] = *MEMORY[0x263EF8340];
  HKHealthUIBuddyDirectionalEdgeInsets();
  double v4 = v3;
  double v6 = v5;
  v7 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self titleLabel];
  id v8 = [v7 leadingAnchor];
  uint64_t v9 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self contentView];
  v10 = [v9 leadingAnchor];
  v11 = [v8 constraintGreaterThanOrEqualToAnchor:v10 constant:v4];
  [v11 setActive:1];

  v12 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self titleLabel];
  v13 = [v12 centerXAnchor];
  objc_super v14 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self contentView];
  v15 = [v14 centerXAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  v17 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self titleLabel];
  v18 = [v17 topAnchor];
  v19 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self contentView];
  v20 = [v19 topAnchor];
  [(HROnboardingElectrocardiogramSetupCompleteViewController *)self contentTop];
  v21 = objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20);
  [v21 setActive:1];

  v22 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self titleLabel];
  LODWORD(v23) = 1148846080;
  [v22 setContentHuggingPriority:0 forAxis:v23];

  if ([(HROnboardingElectrocardiogramSetupCompleteViewController *)self state] == 1)
  {
    v24 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self activityIndicatorView];
    v25 = [v24 leadingAnchor];
    v26 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self titleLabel];
    v27 = [v26 trailingAnchor];
    v28 = [v25 constraintEqualToAnchor:v27 constant:12.0];
    [v28 setActive:1];

    v29 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self activityIndicatorView];
    v30 = [v29 trailingAnchor];
    v31 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self contentView];
    v32 = [v31 trailingAnchor];
    v33 = [v30 constraintEqualToAnchor:v32 constant:-v6];
    [v33 setActive:1];

    v34 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self activityIndicatorView];
    v35 = [v34 bottomAnchor];
    v36 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self titleLabel];
    v37 = [v36 lastBaselineAnchor];
    [v35 constraintEqualToAnchor:v37 constant:2.0];
  }
  else
  {
    v34 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self titleLabel];
    v35 = [v34 trailingAnchor];
    v36 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self contentView];
    v37 = [v36 trailingAnchor];
    [v35 constraintLessThanOrEqualToAnchor:v37 constant:-v6];
  v38 = };
  [v38 setActive:1];

  if ([(HROnboardingElectrocardiogramSetupCompleteViewController *)self state] == 2)
  {
    v39 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self classificationLabel];

    if (v39)
    {
      v40 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self classificationLabel];
      v41 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self contentView];
      HKHealthUIBuddyDirectionalEdgeInsets();
      objc_msgSend(v40, "hrui_alignHorizontalConstraintsWithView:insets:", v41);

      v42 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self classificationLabel];
      v43 = [v42 topAnchor];
      v44 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self titleLabel];
      v45 = [v44 bottomAnchor];
      v46 = [v43 constraintEqualToAnchor:v45 constant:15.0];
      [v46 setActive:1];

      v47 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self electrocardiogramCardView];
      v48 = [v47 topAnchor];
      [(HROnboardingElectrocardiogramSetupCompleteViewController *)self classificationLabel];
    }
    else
    {
      v47 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self electrocardiogramCardView];
      v48 = [v47 topAnchor];
      [(HROnboardingElectrocardiogramSetupCompleteViewController *)self titleLabel];
    v54 = };
    v55 = [v54 bottomAnchor];
    v56 = [v48 constraintEqualToAnchor:v55 constant:37.0];
    [v56 setActive:1];

    v57 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self electrocardiogramCardView];
    v58 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self contentView];
    HKHealthUIBuddyDirectionalEdgeInsets();
    objc_msgSend(v57, "hrui_alignHorizontalConstraintsWithView:insets:", v58);

    v49 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self bodyLabel];
    v50 = [v49 topAnchor];
    v51 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self electrocardiogramCardView];
    v52 = [v51 bottomAnchor];
    double v53 = 12.0;
  }
  else
  {
    v49 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self bodyLabel];
    v50 = [v49 topAnchor];
    v51 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self titleLabel];
    v52 = [v51 bottomAnchor];
    double v53 = 15.0;
  }
  v59 = [v50 constraintEqualToAnchor:v52 constant:v53];
  [v59 setActive:1];

  v60 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self bodyLabel];
  v61 = [v60 bottomAnchor];

  v62 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self bodyLabel];
  v63 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self contentView];
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v62, "hrui_alignHorizontalConstraintsWithView:insets:", v63);

  v64 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self contentView];
  v65 = [v64 bottomAnchor];
  v66 = [v65 constraintEqualToAnchor:v61];
  [(HROnboardingElectrocardiogramSetupCompleteViewController *)self setContentViewBottomConstraint:v66];

  v67 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self contentViewBottomConstraint];
  [v67 setActive:1];

  v68 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self stackedButtonView];
  HKHealthUIBuddyDirectionalEdgeInsets();
  -[HROnboardingElectrocardiogramSetupCompleteViewController setFooterView:insets:](self, "setFooterView:insets:", v68);

  v69 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self stackedButtonView];
  v70 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self view];
  [v69 alignBlurViewHorizontalConstraintsWithView:v70];

  v71 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self view];
  [v71 layoutIfNeeded];

  v72 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self view];
  v73 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self stackedButtonView];
  v74 = [v73 buttons];
  v75 = [v74 firstObject];
  [v75 frame];
  double v77 = v76;
  double v79 = v78;
  double v81 = v80;
  double v83 = v82;
  v84 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self stackedButtonView];
  objc_msgSend(v72, "convertRect:fromView:", v84, v77, v79, v81, v83);
  double v86 = v85;

  v87 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self contentView];
  [v87 frame];
  double v89 = v88;
  v90 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self view];
  [v90 safeAreaInsets];
  double v92 = v86 - v91;

  if (v89 <= v92)
  {
    v108 = (void *)MEMORY[0x263F08938];
    v109 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self contentViewBottomConstraint];
    v112 = v109;
    v110 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v112 count:1];
    [v108 deactivateConstraints:v110];

    [(HROnboardingElectrocardiogramSetupCompleteViewController *)self setContentViewBottomConstraint:0];
    v103 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self contentView];
    v104 = [v103 bottomAnchor];
    v105 = [v104 constraintEqualToAnchor:v61];
    [(HROnboardingElectrocardiogramSetupCompleteViewController *)self setContentViewBottomConstraint:v105];
  }
  else
  {
    [(HROnboardingElectrocardiogramSetupCompleteViewController *)self removeFooterView];
    v93 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self contentView];
    v94 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self stackedButtonView];
    [v93 addSubview:v94];

    v95 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self stackedButtonView];
    v96 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self titleLabel];
    objc_msgSend(v95, "hk_alignHorizontalConstraintsWithView:margin:", v96, 0.0);

    v97 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self stackedButtonView];
    v98 = [v97 topAnchor];
    v99 = [v98 constraintEqualToAnchor:v61 constant:*MEMORY[0x263F463B0]];
    [v99 setActive:1];

    v100 = (void *)MEMORY[0x263F08938];
    v101 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self contentViewBottomConstraint];
    v113[0] = v101;
    v102 = [MEMORY[0x263EFF8C0] arrayWithObjects:v113 count:1];
    [v100 deactivateConstraints:v102];

    [(HROnboardingElectrocardiogramSetupCompleteViewController *)self setContentViewBottomConstraint:0];
    v103 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self contentView];
    v104 = [v103 bottomAnchor];
    v105 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self stackedButtonView];
    v106 = [v105 bottomAnchor];
    v107 = [v104 constraintEqualToAnchor:v106];
    [(HROnboardingElectrocardiogramSetupCompleteViewController *)self setContentViewBottomConstraint:v107];
  }
  v111 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self contentViewBottomConstraint];
  [v111 setActive:1];
}

- (void)_updateUIForElectrocardiogram:(id)a3
{
  id v4 = a3;
  double v5 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self electrocardiogramQuery];

  if (v5) {
    [(HROnboardingElectrocardiogramSetupCompleteViewController *)self _stopElectrocardiogramQuery];
  }
  [(HROnboardingElectrocardiogramSetupCompleteViewController *)self setElectrocardiogram:v4];
  [(HROnboardingElectrocardiogramSetupCompleteViewController *)self _recomputeState];
  double v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v7 = [v6 integerForKey:@"HROnboardingCinnamonSetupDelayInSec"];

  if ([MEMORY[0x263F0A980] isAppleInternalInstall] && v7 >= 1)
  {
    dispatch_time_t v8 = dispatch_time(0, 1000000000 * v7);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __90__HROnboardingElectrocardiogramSetupCompleteViewController__updateUIForElectrocardiogram___block_invoke;
    block[3] = &unk_264581110;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x263EF83A0], block);
  }
  else
  {
    [(HROnboardingElectrocardiogramSetupCompleteViewController *)self _resetUI];
    [(HROnboardingElectrocardiogramSetupCompleteViewController *)self _setUpUI];
    [(HROnboardingElectrocardiogramSetupCompleteViewController *)self _setUpConstraints];
    [(HROnboardingElectrocardiogramSetupCompleteViewController *)self _updateUI];
  }
}

uint64_t __90__HROnboardingElectrocardiogramSetupCompleteViewController__updateUIForElectrocardiogram___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetUI];
  [*(id *)(a1 + 32) _setUpUI];
  [*(id *)(a1 + 32) _setUpConstraints];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateUI];
}

- (void)_updateUI
{
  id v2 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self electrocardiogramCardView];
  [v2 updateUI];
}

- (void)_electrocardiogramCardViewTapped:(id)a3
{
  [(HROnboardingElectrocardiogramSetupCompleteViewController *)self _stopElectrocardiogramQuery];
  id v4 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self electrocardiogramDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self electrocardiogramDelegate];
    double v6 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self electrocardiogram];
    [v7 didTapOnElectrocardiogram:v6];
  }
}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  if (!a4)
  {
    [(HROnboardingElectrocardiogramSetupCompleteViewController *)self _stopElectrocardiogramQuery];
    id v6 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self delegate];
    [v6 stepForward];
  }
}

- (void)_recomputeState
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  double v3 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self delegate];
  uint64_t v4 = [v3 userInfo];
  char v5 = [v4 objectForKeyedSubscript:@"HROnboardingElectrocardiogramDidCompleteRecordingKey"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    id v7 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self electrocardiogram];

    if (v7) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  [(HROnboardingElectrocardiogramSetupCompleteViewController *)self setState:v8];
  _HKInitializeLogging();
  uint64_t v9 = (void *)*MEMORY[0x263F09920];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = objc_opt_class();
    id v12 = v11;
    int v13 = 138412546;
    objc_super v14 = v11;
    __int16 v15 = 2048;
    int64_t v16 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self state];
    _os_log_impl(&dword_220CA3000, v10, OS_LOG_TYPE_DEFAULT, "[%@]: Cinnamon Setup Complete state: %ld", (uint8_t *)&v13, 0x16u);
  }
}

- (id)_classificationAttributedTextForElectrocardiogram:(id)a3 activeAlgorithmVersion:(int64_t)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  int v6 = (void *)MEMORY[0x263F1C358];
  id v7 = a3;
  uint64_t v8 = [v6 defaultParagraphStyle];
  uint64_t v9 = (void *)[v8 mutableCopy];

  [(HROnboardingElectrocardiogramSetupCompleteViewController *)self _classificationTextDistance];
  double v11 = v10;
  id v12 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self _bodyFont];
  [v12 ascender];
  double v14 = v11 - v13;
  __int16 v15 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self _bodyFont];
  [v15 descender];
  [v9 setParagraphSpacing:v14 - v16];

  uint64_t v22 = *MEMORY[0x263F1C268];
  v23[0] = v9;
  uint64_t v17 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
  id v18 = objc_alloc(MEMORY[0x263F086A0]);
  v19 = objc_msgSend(v7, "hrui_classificationShortBodyTextWithActiveAlgorithmVersion:isSharedData:", a4, 0);

  v20 = (void *)[v18 initWithString:v19 attributes:v17];
  return v20;
}

- (void)_setupBodyLabelForSetupCompleteState:(int64_t)a3
{
  if (a3 == 2)
  {
    char v5 = HRUIECGLocalizedString(@"ECG_ONBOARDING_6_BODY");
    int v6 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self bodyLabel];
    [v6 setText:v5];

    id v7 = [MEMORY[0x263F1C550] secondaryLabelColor];
    uint64_t v8 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self bodyLabel];
    [v8 setTextColor:v7];

    uint64_t v9 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self bodyLabel];
    [v9 setTextAlignment:4];

    uint64_t v10 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self _subheadlineFont];
  }
  else
  {
    if (a3 == 1)
    {
      uint64_t v4 = @"ECG_ONBOARDING_6_BODY_WAITING_FOR_SAMPLE";
    }
    else
    {
      if (a3) {
        return;
      }
      uint64_t v4 = @"ECG_ONBOARDING_6_BODY_TAKEN_LATER";
    }
    double v11 = HRUIECGLocalizedString(v4);
    id v12 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self bodyLabel];
    [v12 setText:v11];

    double v13 = [MEMORY[0x263F1C550] labelColor];
    double v14 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self bodyLabel];
    [v14 setTextColor:v13];

    __int16 v15 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self bodyLabel];
    [v15 setTextAlignment:1];

    uint64_t v10 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self _bodyFont];
  }
  id v17 = (id)v10;
  double v16 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self bodyLabel];
  [v16 setFont:v17];
}

- (void)_setUpElectrocardiogramQuery
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  double v3 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self delegate];
  uint64_t v4 = [v3 userInfo];
  char v5 = [v4 objectForKeyedSubscript:@"HROnboardingElectrocardiogramStartDateKey"];

  int v6 = [MEMORY[0x263F0A668] predicateForSamplesWithStartDate:v5 endDate:0 options:0];
  objc_initWeak(&location, self);
  _HKInitializeLogging();
  id v7 = (id)*MEMORY[0x263F09920];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    double v23 = v8;
    __int16 v24 = 2112;
    v25 = v5;
    id v9 = v8;
    _os_log_impl(&dword_220CA3000, v7, OS_LOG_TYPE_DEFAULT, "[%@]: Querying for new electrocardiograms during on-boarding after %@", buf, 0x16u);
  }
  id v10 = objc_alloc(MEMORY[0x263F0A0C8]);
  double v11 = [MEMORY[0x263F0A358] electrocardiogramType];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke;
  v19[3] = &unk_264581160;
  v19[4] = self;
  objc_copyWeak(&v20, &location);
  id v12 = (void *)[v10 initWithType:v11 predicate:v6 anchor:0 limit:0 resultsHandler:v19];
  [(HROnboardingElectrocardiogramSetupCompleteViewController *)self setElectrocardiogramQuery:v12];

  uint64_t v17 = MEMORY[0x263EF8330];
  objc_copyWeak(&v18, &location);
  double v13 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self electrocardiogramQuery];
  [v13 setUpdateHandler:&v17];

  double v14 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self delegate];
  __int16 v15 = [v14 healthStore];
  double v16 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self electrocardiogramQuery];
  [v15 executeQuery:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8 = a3;
  id v9 = a6;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_2;
  v13[3] = &unk_264581138;
  uint64_t v10 = *(void *)(a1 + 32);
  id v14 = v9;
  uint64_t v15 = v10;
  id v16 = v8;
  id v11 = v8;
  id v12 = v9;
  objc_copyWeak(&v17, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x263EF83A0], v13);
  objc_destroyWeak(&v17);
}

void __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_2(uint64_t a1)
{
  v23[1] = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    _HKInitializeLogging();
    id v2 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_2_cold_1(a1, v2);
    }
  }
  else
  {
    if (*(void *)(a1 + 48))
    {
      double v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F09F88] ascending:0];
      uint64_t v4 = *(void **)(a1 + 48);
      v23[0] = v3;
      char v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
      int v6 = [v4 sortedArrayUsingDescriptors:v5];

      id v7 = [v6 firstObject];

      if (v7)
      {
        _HKInitializeLogging();
        id v8 = (id)*MEMORY[0x263F09920];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = (id)objc_opt_class();
          uint64_t v10 = [MEMORY[0x263F0A980] sharedBehavior];
          char v11 = [v10 showSensitiveLogItems];
          id v12 = [v6 firstObject];
          double v13 = v12;
          id v14 = v12;
          if ((v11 & 1) == 0)
          {
            id v14 = [v12 UUID];
          }
          int v19 = 138412546;
          id v20 = v9;
          __int16 v21 = 2112;
          uint64_t v22 = v14;
          _os_log_impl(&dword_220CA3000, v8, OS_LOG_TYPE_DEFAULT, "[%@]: Initial electrocardiogram retrieved during on-boarding: %@", (uint8_t *)&v19, 0x16u);
          if ((v11 & 1) == 0) {
        }
          }
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
        id v16 = [v6 firstObject];
        [WeakRetained _updateUIForElectrocardiogram:v16];
      }
    }
    else
    {
      _HKInitializeLogging();
      id v17 = (void *)*MEMORY[0x263F09920];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      double v3 = v17;
      int v19 = 138412290;
      id v20 = (id)objc_opt_class();
      id v18 = v20;
      _os_log_impl(&dword_220CA3000, v3, OS_LOG_TYPE_DEFAULT, "[%@]: No initial electrocardiograms retrieved during on-boarding", (uint8_t *)&v19, 0xCu);
    }
  }
}

void __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_332(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8 = a3;
  id v9 = a6;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_2_333;
  block[3] = &unk_264581188;
  id v13 = v9;
  id v10 = v9;
  objc_copyWeak(&v15, (id *)(a1 + 32));
  id v14 = v8;
  id v11 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v15);
}

void __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_2_333(uint64_t a1)
{
  v22[1] = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    _HKInitializeLogging();
    id v2 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_2_333_cold_1(a1, v2);
    }
  }
  else if (*(void *)(a1 + 40))
  {
    double v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F09F88] ascending:0];
    uint64_t v4 = *(void **)(a1 + 40);
    v22[0] = v3;
    char v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
    int v6 = [v4 sortedArrayUsingDescriptors:v5];

    id v7 = [v6 firstObject];

    if (v7)
    {
      _HKInitializeLogging();
      id v8 = (id)*MEMORY[0x263F09920];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        id v10 = (id)objc_opt_class();
        id v11 = [MEMORY[0x263F0A980] sharedBehavior];
        char v12 = [v11 showSensitiveLogItems];
        id v13 = [v6 firstObject];
        id v14 = v13;
        id v15 = v13;
        if ((v12 & 1) == 0)
        {
          id v15 = [v13 UUID];
        }
        int v18 = 138412546;
        id v19 = v10;
        __int16 v20 = 2112;
        __int16 v21 = v15;
        _os_log_impl(&dword_220CA3000, v8, OS_LOG_TYPE_DEFAULT, "[%@]: New electrocardiogram received during on-boarding: %@", (uint8_t *)&v18, 0x16u);
        if ((v12 & 1) == 0) {
      }
        }
      id v16 = objc_loadWeakRetained((id *)(a1 + 48));
      id v17 = [v6 firstObject];
      [v16 _updateUIForElectrocardiogram:v17];
    }
  }
}

- (void)_stopElectrocardiogramQuery
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  double v3 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self electrocardiogramQuery];

  if (v3)
  {
    _HKInitializeLogging();
    uint64_t v4 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
    {
      char v5 = v4;
      *(_DWORD *)id v10 = 138412290;
      *(void *)&v10[4] = objc_opt_class();
      id v6 = *(id *)&v10[4];
      _os_log_impl(&dword_220CA3000, v5, OS_LOG_TYPE_DEFAULT, "[%@]: Stopping query for new electrocardiograms", v10, 0xCu);
    }
    id v7 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self delegate];
    id v8 = [v7 healthStore];
    id v9 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self electrocardiogramQuery];
    [v8 stopQuery:v9];

    [(HROnboardingElectrocardiogramSetupCompleteViewController *)self setElectrocardiogramQuery:0];
  }
}

- (double)_classificationTextDistance
{
  id v2 = (void *)MEMORY[0x263F1C668];
  double v3 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self _bodyFontTextStyle];
  uint64_t v4 = [v2 metricsForTextStyle:v3];

  [v4 scaledValueForValue:30.0];
  double v6 = v5;

  return v6;
}

- (id)_bodyFontTextStyle
{
  return (id)*MEMORY[0x263F1D260];
}

- (id)_bodyFont
{
  id v2 = (void *)MEMORY[0x263F1C658];
  double v3 = [(HROnboardingElectrocardiogramSetupCompleteViewController *)self _bodyFontTextStyle];
  uint64_t v4 = objc_msgSend(v2, "hk_preferredFontForTextStyle:", v3);

  return v4;
}

- (id)_subheadlineFont
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:", *MEMORY[0x263F1D2C0]);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (HKAnchoredObjectQuery)electrocardiogramQuery
{
  return self->_electrocardiogramQuery;
}

- (void)setElectrocardiogramQuery:(id)a3
{
}

- (HKElectrocardiogram)electrocardiogram
{
  return self->_electrocardiogram;
}

- (void)setElectrocardiogram:(id)a3
{
}

- (UITapGestureRecognizer)electrocardiogramCardTapGestureRecognizer
{
  return self->_electrocardiogramCardTapGestureRecognizer;
}

- (void)setElectrocardiogramCardTapGestureRecognizer:(id)a3
{
}

- (HROnboardingElectrocardiogramSetupCompleteViewControllerDelegate)electrocardiogramDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_electrocardiogramDelegate);
  return (HROnboardingElectrocardiogramSetupCompleteViewControllerDelegate *)WeakRetained;
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

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (UILabel)classificationLabel
{
  return self->_classificationLabel;
}

- (void)setClassificationLabel:(id)a3
{
}

- (HKElectrocardiogramCardView)electrocardiogramCardView
{
  return self->_electrocardiogramCardView;
}

- (void)setElectrocardiogramCardView:(id)a3
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

- (NSLayoutYAxisAnchor)viewBottomAnchor
{
  return self->_viewBottomAnchor;
}

- (void)setViewBottomAnchor:(id)a3
{
}

- (BOOL)firstViewDidLayoutSubviews
{
  return self->_firstViewDidLayoutSubviews;
}

- (void)setFirstViewDidLayoutSubviews:(BOOL)a3
{
  self->_firstViewDidLayoutSubviews = a3;
}

- (BOOL)isSampleInteractive
{
  return self->_isSampleInteractive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewBottomAnchor, 0);
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_stackedButtonView, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_electrocardiogramCardView, 0);
  objc_storeStrong((id *)&self->_classificationLabel, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_electrocardiogramDelegate);
  objc_storeStrong((id *)&self->_electrocardiogramCardTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_electrocardiogram, 0);
  objc_storeStrong((id *)&self->_electrocardiogramQuery, 0);
}

void __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_0_1(v3);
  OUTLINED_FUNCTION_1_1(&dword_220CA3000, v5, v6, "[%@]: Error fetching electrocardiograms during on-boarding: %@", v7, v8, v9, v10, v11);
}

void __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_2_333_cold_1(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 48);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = objc_opt_class();
  id v6 = OUTLINED_FUNCTION_0_1(v5);
  OUTLINED_FUNCTION_1_1(&dword_220CA3000, v7, v8, "[%@]: Error fetching electrocardiograms during on-boarding: %@", v9, v10, v11, v12, v13);
}

@end