@interface HROnboardingElectrocardiogramResultView
+ (id)resultViewWithItem:(id)a3;
- (BOOL)isAlwaysExpanded;
- (BOOL)isExpanded;
- (BOOL)isHidingNumberedTitle;
- (BOOL)shouldHideSeparatorLine;
- (HKSeparatorLineView)separatorLineView;
- (HROnboardingElectrocardiogramResultView)initWithBadge:(id)a3 title:(id)a4 numberedTitle:(id)a5 visibleBodyText:(id)a6 video:(id)a7 expandedView:(id)a8;
- (HRPaddingLabel)badgeLabel;
- (HRVideoPlayerView)playerView;
- (NSLayoutConstraint)bottomConstraint;
- (NSLayoutConstraint)playerViewOrVisibleBodyLabelTopConstraint;
- (NSString)badge;
- (NSString)numberedTitle;
- (NSString)title;
- (NSString)visibleBody;
- (UIButton)learnMoreButton;
- (UILabel)numberedTitleLabel;
- (UILabel)visibleBodyLabel;
- (UIView)expandedView;
- (double)_badgeTopToFirstBaseline;
- (double)_learnMoreButtonLastBaselineToBottom;
- (double)_numberedTitleLastBaseLineToVideoTop;
- (double)_numberedTitleToBadgeLastBaseline;
- (double)_numberedTitleTopToFirstBaseline;
- (double)_playerViewOrVisibleBodyLabelTopConstant;
- (double)_visibleBodyFirstBaselineDistance;
- (double)_visibleBodyLastBaselineToLearnMoreButtonFirstBaseline;
- (id)_badgeFont;
- (id)_numberedTitleFont;
- (id)_playerViewOrVisibleBodyLabelTopConstraint;
- (id)_visibleBodyFont;
- (id)_visibleBodyFontTextStyle;
- (void)_setUpConstraints;
- (void)_setUpNumberedTitleLabelConstraints;
- (void)_setUpPlayerViewTopConstraint;
- (void)_setUpUI;
- (void)_setUpVisibleBodyLabelTopConstraint;
- (void)_updateExpandedViewState;
- (void)_updateNumberedTitleViewState;
- (void)learnMoreButtonTapped:(id)a3;
- (void)setAlwaysExpanded:(BOOL)a3;
- (void)setBadge:(id)a3;
- (void)setBadgeLabel:(id)a3;
- (void)setBottomConstraint:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpandedView:(id)a3;
- (void)setHideNumberedTitle:(BOOL)a3;
- (void)setLearnMoreButton:(id)a3;
- (void)setNumberedTitle:(id)a3;
- (void)setNumberedTitleLabel:(id)a3;
- (void)setPlayerView:(id)a3;
- (void)setPlayerViewOrVisibleBodyLabelTopConstraint:(id)a3;
- (void)setSeparatorLineView:(id)a3;
- (void)setShouldHideSeparatorLine:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setVisibleBody:(id)a3;
- (void)setVisibleBodyLabel:(id)a3;
@end

@implementation HROnboardingElectrocardiogramResultView

- (HROnboardingElectrocardiogramResultView)initWithBadge:(id)a3 title:(id)a4 numberedTitle:(id)a5 visibleBodyText:(id)a6 video:(id)a7 expandedView:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HROnboardingElectrocardiogramResultView;
  v18 = -[HROnboardingElectrocardiogramResultView initWithFrame:](&v24, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_badge, a3);
    objc_storeStrong((id *)&v19->_title, a4);
    objc_storeStrong((id *)&v19->_numberedTitle, a5);
    objc_storeStrong((id *)&v19->_visibleBody, a6);
    objc_storeStrong((id *)&v19->_playerView, a7);
    objc_storeStrong((id *)&v19->_expandedView, a8);
    [(HROnboardingElectrocardiogramResultView *)v19 _setUpUI];
    [(HROnboardingElectrocardiogramResultView *)v19 _setUpConstraints];
  }

  return v19;
}

+ (id)resultViewWithItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 videoPath];

  if (v4)
  {
    v5 = NSURL;
    v6 = [v3 videoPath];
    v7 = [v5 fileURLWithPath:v6];

    v4 = +[HRVideoPlayerView playerViewWithURL:v7 looping:1];
  }
  v8 = [v3 expandedContentItems];
  v9 = +[HROnboardingInlineExpandedContentView viewWithItems:v8];

  v10 = [HROnboardingElectrocardiogramResultView alloc];
  v11 = [v3 badge];
  v12 = [v3 title];
  v13 = [v3 numberedTitle];
  v14 = [v3 visibleBodyText];
  id v15 = [(HROnboardingElectrocardiogramResultView *)v10 initWithBadge:v11 title:v12 numberedTitle:v13 visibleBodyText:v14 video:v4 expandedView:v9];

  return v15;
}

- (void)learnMoreButtonTapped:(id)a3
{
}

- (void)setHideNumberedTitle:(BOOL)a3
{
  self->_hideNumberedTitle = a3;
  [(HROnboardingElectrocardiogramResultView *)self _updateNumberedTitleViewState];
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
  [(HROnboardingElectrocardiogramResultView *)self _updateExpandedViewState];
}

- (void)setAlwaysExpanded:(BOOL)a3
{
  self->_alwaysExpanded = a3;
  if (a3) {
    [(HROnboardingElectrocardiogramResultView *)self setExpanded:1];
  }
  else {
    [(HROnboardingElectrocardiogramResultView *)self _updateExpandedViewState];
  }
}

- (void)setShouldHideSeparatorLine:(BOOL)a3
{
  self->_shouldHideSeparatorLine = a3;
  [(HROnboardingElectrocardiogramResultView *)self _updateExpandedViewState];
}

- (void)_setUpUI
{
  id v3 = [(HROnboardingElectrocardiogramResultView *)self badge];

  if (v3)
  {
    v4 = [HRPaddingLabel alloc];
    v5 = -[HRPaddingLabel initWithFrame:](v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(HROnboardingElectrocardiogramResultView *)self setBadgeLabel:v5];

    v6 = [(HROnboardingElectrocardiogramResultView *)self badgeLabel];
    [v6 setAdjustsFontForContentSizeCategory:1];

    v7 = objc_msgSend(MEMORY[0x263F1C550], "hk_heartKeyColor");
    v8 = [(HROnboardingElectrocardiogramResultView *)self badgeLabel];
    [v8 setBackgroundColor:v7];

    v9 = [(HROnboardingElectrocardiogramResultView *)self badgeLabel];
    LODWORD(v10) = 1148846080;
    [v9 setContentHuggingPriority:0 forAxis:v10];

    v11 = [(HROnboardingElectrocardiogramResultView *)self _badgeFont];
    v12 = [(HROnboardingElectrocardiogramResultView *)self badgeLabel];
    [v12 setFont:v11];

    v13 = [(HROnboardingElectrocardiogramResultView *)self badgeLabel];
    [v13 setNumberOfLines:2];

    v14 = [(HROnboardingElectrocardiogramResultView *)self badgeLabel];
    objc_msgSend(v14, "setPadding:", 5.0, 8.0, 5.0, 8.0);

    id v15 = [(HROnboardingElectrocardiogramResultView *)self badge];
    id v16 = [v15 localizedUppercaseString];
    id v17 = [(HROnboardingElectrocardiogramResultView *)self badgeLabel];
    [v17 setText:v16];

    v18 = [MEMORY[0x263F1C550] whiteColor];
    v19 = [(HROnboardingElectrocardiogramResultView *)self badgeLabel];
    [v19 setTextColor:v18];

    v20 = [(HROnboardingElectrocardiogramResultView *)self badgeLabel];
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v21 = [(HROnboardingElectrocardiogramResultView *)self badgeLabel];
    objc_msgSend(v21, "hrui_maskAllCornersWithRadius:", 4.0);

    id v22 = [(HROnboardingElectrocardiogramResultView *)self badgeLabel];
    [(HROnboardingElectrocardiogramResultView *)self addSubview:v22];
  }
  id v23 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingElectrocardiogramResultView *)self setNumberedTitleLabel:v23];

  objc_super v24 = [(HROnboardingElectrocardiogramResultView *)self numberedTitle];
  v25 = [(HROnboardingElectrocardiogramResultView *)self numberedTitleLabel];
  [v25 setText:v24];

  v26 = NSString;
  v27 = [(HROnboardingElectrocardiogramResultView *)self numberedTitle];
  id v78 = [v26 stringWithFormat:@"ResultsYouMaySee.%@.Title", v27];

  v28 = [NSString healthAccessibilityIdentifier:1 suffix:v78];
  v29 = [(HROnboardingElectrocardiogramResultView *)self numberedTitleLabel];
  [v29 setAccessibilityIdentifier:v28];

  v30 = [(HROnboardingElectrocardiogramResultView *)self _numberedTitleFont];
  v31 = [(HROnboardingElectrocardiogramResultView *)self numberedTitleLabel];
  [v31 setFont:v30];

  v32 = [(HROnboardingElectrocardiogramResultView *)self numberedTitleLabel];
  [v32 setTranslatesAutoresizingMaskIntoConstraints:0];

  v33 = [(HROnboardingElectrocardiogramResultView *)self numberedTitleLabel];
  [v33 setAdjustsFontForContentSizeCategory:1];

  v34 = [(HROnboardingElectrocardiogramResultView *)self numberedTitleLabel];
  [v34 setNumberOfLines:0];

  v35 = [(HROnboardingElectrocardiogramResultView *)self numberedTitleLabel];
  [(HROnboardingElectrocardiogramResultView *)self addSubview:v35];

  v36 = [(HROnboardingElectrocardiogramResultView *)self playerView];

  if (v36)
  {
    v37 = [(HROnboardingElectrocardiogramResultView *)self playerView];
    [v37 setTranslatesAutoresizingMaskIntoConstraints:0];

    v38 = [(HROnboardingElectrocardiogramResultView *)self playerView];
    objc_msgSend(v38, "hrui_maskAllCornersWithRadius:", *MEMORY[0x263F463A8]);

    v39 = [(HROnboardingElectrocardiogramResultView *)self playerView];
    [(HROnboardingElectrocardiogramResultView *)self addSubview:v39];
  }
  id v40 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingElectrocardiogramResultView *)self setVisibleBodyLabel:v40];

  v41 = [(HROnboardingElectrocardiogramResultView *)self visibleBody];
  v42 = [(HROnboardingElectrocardiogramResultView *)self visibleBodyLabel];
  [v42 setText:v41];

  v43 = NSString;
  v44 = [(HROnboardingElectrocardiogramResultView *)self numberedTitle];
  v45 = [v43 stringWithFormat:@"ResultsYouMaySee.%@.Description", v44];

  v46 = [NSString healthAccessibilityIdentifier:1 suffix:v45];
  v47 = [(HROnboardingElectrocardiogramResultView *)self visibleBodyLabel];
  [v47 setAccessibilityIdentifier:v46];

  v48 = [(HROnboardingElectrocardiogramResultView *)self _visibleBodyFont];
  v49 = [(HROnboardingElectrocardiogramResultView *)self visibleBodyLabel];
  [v49 setFont:v48];

  v50 = [(HROnboardingElectrocardiogramResultView *)self visibleBodyLabel];
  [v50 setTranslatesAutoresizingMaskIntoConstraints:0];

  v51 = [(HROnboardingElectrocardiogramResultView *)self visibleBodyLabel];
  [v51 setAdjustsFontForContentSizeCategory:1];

  v52 = [(HROnboardingElectrocardiogramResultView *)self visibleBodyLabel];
  [v52 setNumberOfLines:0];

  v53 = [(HROnboardingElectrocardiogramResultView *)self visibleBodyLabel];
  [(HROnboardingElectrocardiogramResultView *)self addSubview:v53];

  id v54 = objc_alloc_init(MEMORY[0x263F1C488]);
  [(HROnboardingElectrocardiogramResultView *)self setLearnMoreButton:v54];

  v55 = [(HROnboardingElectrocardiogramResultView *)self learnMoreButton];
  v56 = HRHeartRhythmUIFrameworkBundle();
  v57 = [v56 localizedStringForKey:@"ONBOARDING_LEARN_MORE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable"];
  [v55 setTitle:v57 forState:0];

  v58 = [(HROnboardingElectrocardiogramResultView *)self learnMoreButton];
  v59 = [NSString healthAccessibilityIdentifier:1 suffix:@"ResultsYouMaySee.LearnMoreButton"];
  [v58 setAccessibilityIdentifier:v59];

  v60 = [(HROnboardingElectrocardiogramResultView *)self learnMoreButton];
  v61 = objc_msgSend(MEMORY[0x263F1C550], "hk_appKeyColor");
  [v60 setTitleColor:v61 forState:0];

  v62 = [(HROnboardingElectrocardiogramResultView *)self learnMoreButton];
  [v62 addTarget:self action:sel_learnMoreButtonTapped_ forControlEvents:64];

  v63 = [(HROnboardingElectrocardiogramResultView *)self learnMoreButton];
  [v63 setContentHorizontalAlignment:4];

  v64 = [(HROnboardingElectrocardiogramResultView *)self _visibleBodyFont];
  v65 = [(HROnboardingElectrocardiogramResultView *)self learnMoreButton];
  v66 = [v65 titleLabel];
  [v66 setFont:v64];

  v67 = [(HROnboardingElectrocardiogramResultView *)self learnMoreButton];
  v68 = [v67 titleLabel];
  [v68 setAdjustsFontForContentSizeCategory:1];

  v69 = [(HROnboardingElectrocardiogramResultView *)self learnMoreButton];
  [(HROnboardingElectrocardiogramResultView *)self addSubview:v69];

  v70 = [(HROnboardingElectrocardiogramResultView *)self expandedView];
  [v70 setTranslatesAutoresizingMaskIntoConstraints:0];

  v71 = [(HROnboardingElectrocardiogramResultView *)self expandedView];
  [v71 setHidden:1];

  v72 = [(HROnboardingElectrocardiogramResultView *)self expandedView];
  [(HROnboardingElectrocardiogramResultView *)self addSubview:v72];

  id v73 = objc_alloc_init(MEMORY[0x263F46968]);
  [(HROnboardingElectrocardiogramResultView *)self setSeparatorLineView:v73];

  v74 = [MEMORY[0x263F1C550] separatorColor];
  v75 = [(HROnboardingElectrocardiogramResultView *)self separatorLineView];
  [v75 setColor:v74];

  v76 = [(HROnboardingElectrocardiogramResultView *)self separatorLineView];
  [v76 setTranslatesAutoresizingMaskIntoConstraints:0];

  v77 = [(HROnboardingElectrocardiogramResultView *)self separatorLineView];
  [(HROnboardingElectrocardiogramResultView *)self addSubview:v77];
}

- (void)_setUpConstraints
{
  id v3 = [(HROnboardingElectrocardiogramResultView *)self badgeLabel];

  if (v3)
  {
    v4 = [(HROnboardingElectrocardiogramResultView *)self badgeLabel];
    v5 = [v4 leadingAnchor];
    v6 = [(HROnboardingElectrocardiogramResultView *)self leadingAnchor];
    v7 = [v5 constraintEqualToAnchor:v6];
    [v7 setActive:1];

    v8 = [(HROnboardingElectrocardiogramResultView *)self badgeLabel];
    v9 = [v8 trailingAnchor];
    double v10 = [(HROnboardingElectrocardiogramResultView *)self trailingAnchor];
    v11 = [v9 constraintLessThanOrEqualToAnchor:v10];
    [v11 setActive:1];

    v12 = [(HROnboardingElectrocardiogramResultView *)self badgeLabel];
    v13 = [v12 firstBaselineAnchor];
    v14 = [(HROnboardingElectrocardiogramResultView *)self topAnchor];
    [(HROnboardingElectrocardiogramResultView *)self _badgeTopToFirstBaseline];
    id v15 = objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14);
    [v15 setActive:1];
  }
  [(HROnboardingElectrocardiogramResultView *)self _setUpNumberedTitleLabelConstraints];
  id v16 = [(HROnboardingElectrocardiogramResultView *)self playerView];

  if (v16)
  {
    id v17 = [(HROnboardingElectrocardiogramResultView *)self playerView];
    objc_msgSend(v17, "hk_alignHorizontalConstraintsWithView:margin:", self, 0.0);

    [(HROnboardingElectrocardiogramResultView *)self _setUpPlayerViewTopConstraint];
    v18 = [(HROnboardingElectrocardiogramResultView *)self visibleBodyLabel];
    objc_msgSend(v18, "hk_alignHorizontalConstraintsWithView:margin:", self, 0.0);

    v19 = [(HROnboardingElectrocardiogramResultView *)self visibleBodyLabel];
    v20 = [v19 firstBaselineAnchor];
    id v21 = [(HROnboardingElectrocardiogramResultView *)self playerView];
    id v22 = [v21 bottomAnchor];
    [(HROnboardingElectrocardiogramResultView *)self _visibleBodyFirstBaselineDistance];
    id v23 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22);
    [v23 setActive:1];
  }
  else
  {
    objc_super v24 = [(HROnboardingElectrocardiogramResultView *)self visibleBodyLabel];
    objc_msgSend(v24, "hk_alignHorizontalConstraintsWithView:margin:", self, 0.0);

    [(HROnboardingElectrocardiogramResultView *)self _setUpVisibleBodyLabelTopConstraint];
  }
  v25 = [(HROnboardingElectrocardiogramResultView *)self learnMoreButton];
  objc_msgSend(v25, "hk_alignHorizontalConstraintsWithView:margin:", self, 0.0);

  v26 = [(HROnboardingElectrocardiogramResultView *)self learnMoreButton];
  v27 = [v26 firstBaselineAnchor];
  v28 = [(HROnboardingElectrocardiogramResultView *)self visibleBodyLabel];
  v29 = [v28 lastBaselineAnchor];
  [(HROnboardingElectrocardiogramResultView *)self _visibleBodyLastBaselineToLearnMoreButtonFirstBaseline];
  v30 = objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29);
  [v30 setActive:1];

  v31 = [(HROnboardingElectrocardiogramResultView *)self expandedView];
  objc_msgSend(v31, "hk_alignHorizontalConstraintsWithView:margin:", self, 0.0);

  v32 = [(HROnboardingElectrocardiogramResultView *)self expandedView];
  v33 = [v32 topAnchor];
  v34 = [(HROnboardingElectrocardiogramResultView *)self visibleBodyLabel];
  v35 = [v34 bottomAnchor];
  v36 = [v33 constraintEqualToAnchor:v35];
  [v36 setActive:1];

  v37 = [(HROnboardingElectrocardiogramResultView *)self separatorLineView];
  objc_msgSend(v37, "hk_alignHorizontalConstraintsWithView:margin:", self, 0.0);

  v38 = [(HROnboardingElectrocardiogramResultView *)self separatorLineView];
  v39 = [v38 heightAnchor];
  id v40 = [v39 constraintEqualToConstant:1.0];
  [v40 setActive:1];

  v41 = [(HROnboardingElectrocardiogramResultView *)self separatorLineView];
  v42 = [v41 bottomAnchor];
  v43 = [(HROnboardingElectrocardiogramResultView *)self bottomAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  [v44 setActive:1];

  v45 = [(HROnboardingElectrocardiogramResultView *)self bottomAnchor];
  v46 = [(HROnboardingElectrocardiogramResultView *)self learnMoreButton];
  v47 = [v46 lastBaselineAnchor];
  [(HROnboardingElectrocardiogramResultView *)self _learnMoreButtonLastBaselineToBottom];
  v48 = objc_msgSend(v45, "constraintEqualToAnchor:constant:", v47);
  [(HROnboardingElectrocardiogramResultView *)self setBottomConstraint:v48];

  id v49 = [(HROnboardingElectrocardiogramResultView *)self bottomConstraint];
  [v49 setActive:1];
}

- (void)_setUpNumberedTitleLabelConstraints
{
  id v3 = [(HROnboardingElectrocardiogramResultView *)self numberedTitleLabel];
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:margin:", self, 0.0);

  v4 = [(HROnboardingElectrocardiogramResultView *)self badgeLabel];

  id v9 = [(HROnboardingElectrocardiogramResultView *)self numberedTitleLabel];
  v5 = [v9 firstBaselineAnchor];
  if (v4)
  {
    v6 = [(HROnboardingElectrocardiogramResultView *)self badgeLabel];
    v7 = [v6 bottomAnchor];
    [(HROnboardingElectrocardiogramResultView *)self _numberedTitleToBadgeLastBaseline];
    v8 = objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7);
    [v8 setActive:1];
  }
  else
  {
    v6 = [(HROnboardingElectrocardiogramResultView *)self topAnchor];
    [(HROnboardingElectrocardiogramResultView *)self _numberedTitleTopToFirstBaseline];
    v7 = objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6);
    [v7 setActive:1];
  }
}

- (void)_setUpPlayerViewTopConstraint
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = [(HROnboardingElectrocardiogramResultView *)self playerViewOrVisibleBodyLabelTopConstraint];

  if (v3)
  {
    v4 = (void *)MEMORY[0x263F08938];
    v5 = [(HROnboardingElectrocardiogramResultView *)self playerViewOrVisibleBodyLabelTopConstraint];
    v14[0] = v5;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    [v4 deactivateConstraints:v6];

    [(HROnboardingElectrocardiogramResultView *)self setPlayerViewOrVisibleBodyLabelTopConstraint:0];
  }
  v7 = [(HROnboardingElectrocardiogramResultView *)self _playerViewOrVisibleBodyLabelTopConstraint];
  [(HROnboardingElectrocardiogramResultView *)self _playerViewOrVisibleBodyLabelTopConstant];
  double v9 = v8;
  double v10 = [(HROnboardingElectrocardiogramResultView *)self playerView];
  v11 = [v10 topAnchor];
  v12 = [v11 constraintEqualToAnchor:v7 constant:v9];
  [(HROnboardingElectrocardiogramResultView *)self setPlayerViewOrVisibleBodyLabelTopConstraint:v12];

  v13 = [(HROnboardingElectrocardiogramResultView *)self playerViewOrVisibleBodyLabelTopConstraint];
  [v13 setActive:1];
}

- (void)_setUpVisibleBodyLabelTopConstraint
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = [(HROnboardingElectrocardiogramResultView *)self playerViewOrVisibleBodyLabelTopConstraint];

  if (v3)
  {
    v4 = (void *)MEMORY[0x263F08938];
    v5 = [(HROnboardingElectrocardiogramResultView *)self playerViewOrVisibleBodyLabelTopConstraint];
    v14[0] = v5;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    [v4 deactivateConstraints:v6];

    [(HROnboardingElectrocardiogramResultView *)self setPlayerViewOrVisibleBodyLabelTopConstraint:0];
  }
  v7 = [(HROnboardingElectrocardiogramResultView *)self _playerViewOrVisibleBodyLabelTopConstraint];
  [(HROnboardingElectrocardiogramResultView *)self _playerViewOrVisibleBodyLabelTopConstant];
  double v9 = v8;
  double v10 = [(HROnboardingElectrocardiogramResultView *)self visibleBodyLabel];
  v11 = [v10 topAnchor];
  v12 = [v11 constraintEqualToAnchor:v7 constant:v9];
  [(HROnboardingElectrocardiogramResultView *)self setPlayerViewOrVisibleBodyLabelTopConstraint:v12];

  v13 = [(HROnboardingElectrocardiogramResultView *)self playerViewOrVisibleBodyLabelTopConstraint];
  [v13 setActive:1];
}

- (id)_playerViewOrVisibleBodyLabelTopConstraint
{
  if ([(HROnboardingElectrocardiogramResultView *)self isHidingNumberedTitle])
  {
    id v3 = [(HROnboardingElectrocardiogramResultView *)self topAnchor];
  }
  else
  {
    v4 = [(HROnboardingElectrocardiogramResultView *)self numberedTitleLabel];
    id v3 = [v4 lastBaselineAnchor];
  }
  return v3;
}

- (double)_playerViewOrVisibleBodyLabelTopConstant
{
  if ([(HROnboardingElectrocardiogramResultView *)self isHidingNumberedTitle])
  {
    HKHealthUIBuddyDirectionalEdgeInsets();
    return v3;
  }
  else
  {
    [(HROnboardingElectrocardiogramResultView *)self _numberedTitleLastBaseLineToVideoTop];
  }
  return result;
}

- (void)_updateNumberedTitleViewState
{
  BOOL v3 = [(HROnboardingElectrocardiogramResultView *)self isHidingNumberedTitle];
  v4 = [(HROnboardingElectrocardiogramResultView *)self numberedTitleLabel];
  v5 = v4;
  if (v3)
  {
    [v4 removeFromSuperview];
  }
  else
  {
    [(HROnboardingElectrocardiogramResultView *)self addSubview:v4];

    [(HROnboardingElectrocardiogramResultView *)self _setUpNumberedTitleLabelConstraints];
  }
  v6 = [(HROnboardingElectrocardiogramResultView *)self playerView];

  if (v6)
  {
    [(HROnboardingElectrocardiogramResultView *)self _setUpPlayerViewTopConstraint];
  }
  else
  {
    [(HROnboardingElectrocardiogramResultView *)self _setUpVisibleBodyLabelTopConstraint];
  }
}

- (void)_updateExpandedViewState
{
  v22[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(HROnboardingElectrocardiogramResultView *)self shouldHideSeparatorLine];
  v4 = [(HROnboardingElectrocardiogramResultView *)self separatorLineView];
  [v4 setHidden:v3];

  LODWORD(v4) = [(HROnboardingElectrocardiogramResultView *)self isExpanded];
  v5 = [(HROnboardingElectrocardiogramResultView *)self learnMoreButton];
  v6 = v5;
  if (v4)
  {
    [v5 setHidden:1];

    v7 = [(HROnboardingElectrocardiogramResultView *)self expandedView];
    [v7 setHidden:0];

    double v8 = (void *)MEMORY[0x263F08938];
    double v9 = [(HROnboardingElectrocardiogramResultView *)self bottomConstraint];
    v22[0] = v9;
    double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
    [v8 deactivateConstraints:v10];

    [(HROnboardingElectrocardiogramResultView *)self setBottomConstraint:0];
    v11 = [(HROnboardingElectrocardiogramResultView *)self bottomAnchor];
    v12 = [(HROnboardingElectrocardiogramResultView *)self expandedView];
    uint64_t v13 = [v12 bottomAnchor];
  }
  else
  {
    [v5 setHidden:0];

    v14 = [(HROnboardingElectrocardiogramResultView *)self expandedView];
    [v14 setHidden:1];

    id v15 = (void *)MEMORY[0x263F08938];
    id v16 = [(HROnboardingElectrocardiogramResultView *)self bottomConstraint];
    id v21 = v16;
    id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
    [v15 deactivateConstraints:v17];

    [(HROnboardingElectrocardiogramResultView *)self setBottomConstraint:0];
    v11 = [(HROnboardingElectrocardiogramResultView *)self bottomAnchor];
    v12 = [(HROnboardingElectrocardiogramResultView *)self learnMoreButton];
    uint64_t v13 = [v12 lastBaselineAnchor];
  }
  v18 = (void *)v13;
  [(HROnboardingElectrocardiogramResultView *)self _learnMoreButtonLastBaselineToBottom];
  v19 = objc_msgSend(v11, "constraintEqualToAnchor:constant:", v18);
  [(HROnboardingElectrocardiogramResultView *)self setBottomConstraint:v19];

  v20 = [(HROnboardingElectrocardiogramResultView *)self bottomConstraint];
  [v20 setActive:1];
}

- (id)_badgeFont
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x263F1D280], 2);
}

- (double)_badgeTopToFirstBaseline
{
  v2 = [(HROnboardingElectrocardiogramResultView *)self _badgeFont];
  [v2 _scaledValueForValue:52.0];
  double v4 = v3;

  return v4;
}

- (id)_numberedTitleFont
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x263F1D300], 32770);
}

- (double)_numberedTitleTopToFirstBaseline
{
  v2 = [(HROnboardingElectrocardiogramResultView *)self _numberedTitleFont];
  [v2 _scaledValueForValue:52.0];
  double v4 = v3;

  return v4;
}

- (double)_numberedTitleToBadgeLastBaseline
{
  v2 = [(HROnboardingElectrocardiogramResultView *)self _numberedTitleFont];
  [v2 _scaledValueForValue:26.0];
  double v4 = v3;

  return v4;
}

- (double)_numberedTitleLastBaseLineToVideoTop
{
  v2 = [(HROnboardingElectrocardiogramResultView *)self _numberedTitleFont];
  [v2 _scaledValueForValue:18.0];
  double v4 = v3;

  return v4;
}

- (id)_visibleBodyFontTextStyle
{
  return (id)*MEMORY[0x263F1D260];
}

- (id)_visibleBodyFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  double v3 = [(HROnboardingElectrocardiogramResultView *)self _visibleBodyFontTextStyle];
  double v4 = [v2 preferredFontForTextStyle:v3];

  return v4;
}

- (double)_visibleBodyFirstBaselineDistance
{
  v2 = [(HROnboardingElectrocardiogramResultView *)self _visibleBodyFont];
  [v2 _scaledValueForValue:30.0];
  double v4 = v3;

  return v4;
}

- (double)_visibleBodyLastBaselineToLearnMoreButtonFirstBaseline
{
  v2 = [(HROnboardingElectrocardiogramResultView *)self _visibleBodyFont];
  [v2 _scaledValueForValue:40.0];
  double v4 = v3;

  return v4;
}

- (double)_learnMoreButtonLastBaselineToBottom
{
  v2 = [(HROnboardingElectrocardiogramResultView *)self _visibleBodyFont];
  [v2 _scaledValueForValue:40.0];
  double v4 = v3;

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (HRVideoPlayerView)playerView
{
  return self->_playerView;
}

- (void)setPlayerView:(id)a3
{
}

- (BOOL)isHidingNumberedTitle
{
  return self->_hideNumberedTitle;
}

- (BOOL)isAlwaysExpanded
{
  return self->_alwaysExpanded;
}

- (BOOL)shouldHideSeparatorLine
{
  return self->_shouldHideSeparatorLine;
}

- (NSString)badge
{
  return self->_badge;
}

- (void)setBadge:(id)a3
{
}

- (NSString)numberedTitle
{
  return self->_numberedTitle;
}

- (void)setNumberedTitle:(id)a3
{
}

- (NSString)visibleBody
{
  return self->_visibleBody;
}

- (void)setVisibleBody:(id)a3
{
}

- (HRPaddingLabel)badgeLabel
{
  return self->_badgeLabel;
}

- (void)setBadgeLabel:(id)a3
{
}

- (UILabel)numberedTitleLabel
{
  return self->_numberedTitleLabel;
}

- (void)setNumberedTitleLabel:(id)a3
{
}

- (UILabel)visibleBodyLabel
{
  return self->_visibleBodyLabel;
}

- (void)setVisibleBodyLabel:(id)a3
{
}

- (UIButton)learnMoreButton
{
  return self->_learnMoreButton;
}

- (void)setLearnMoreButton:(id)a3
{
}

- (UIView)expandedView
{
  return self->_expandedView;
}

- (void)setExpandedView:(id)a3
{
}

- (HKSeparatorLineView)separatorLineView
{
  return self->_separatorLineView;
}

- (void)setSeparatorLineView:(id)a3
{
}

- (NSLayoutConstraint)playerViewOrVisibleBodyLabelTopConstraint
{
  return self->_playerViewOrVisibleBodyLabelTopConstraint;
}

- (void)setPlayerViewOrVisibleBodyLabelTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_playerViewOrVisibleBodyLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_separatorLineView, 0);
  objc_storeStrong((id *)&self->_expandedView, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_visibleBodyLabel, 0);
  objc_storeStrong((id *)&self->_numberedTitleLabel, 0);
  objc_storeStrong((id *)&self->_badgeLabel, 0);
  objc_storeStrong((id *)&self->_visibleBody, 0);
  objc_storeStrong((id *)&self->_numberedTitle, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end