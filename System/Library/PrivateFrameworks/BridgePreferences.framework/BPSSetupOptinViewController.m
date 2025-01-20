@interface BPSSetupOptinViewController
- (BOOL)wantsAlternateChoicePillButton;
- (BOOL)wantsAlternateChoiceSystemButton;
- (BOOL)wantsLearnMoreButton;
- (BOOL)wantsLightenBlendedScreen;
- (BOOL)wantsOkayPillButton;
- (BOOL)wantsSuggestedChoicePillButton;
- (BOOL)wantsToShowWatchHW;
- (BPSSetupOptinViewController)init;
- (BPSWatchView)watchView;
- (UIButton)alternateChoiceButton;
- (UIButton)learnMoreButton;
- (UIButton)okayButton;
- (UIButton)suggestedChoiceButton;
- (UILabel)detailTextLabel;
- (UILabel)detailTextTitleLabel;
- (UIScrollView)scrollView;
- (double)alternateButtonDetailTextPaddingWithImage;
- (double)imageDetailPadding;
- (double)noHWDetailOffset;
- (double)noHWImageOffset;
- (double)okayButtonTopPadding;
- (double)sidePadding;
- (double)suggestedChoicePillDetailTextLabelVerticalOffset;
- (id)alternateButtonTitle;
- (id)detailAttributedString;
- (id)detailString;
- (id)detailTitleString;
- (id)imageResource;
- (id)imageResourceBundleIdentifier;
- (id)imageTintColor;
- (id)learnMoreButtonTitle;
- (id)okayButtonTitle;
- (id)optinLocalizationBundle;
- (id)optinLocalizationStringsFile;
- (id)suggestedButtonTitle;
- (unint64_t)style;
- (void)alternateButtonPressed:(id)a3;
- (void)applyConfirmedOptin:(BOOL)a3;
- (void)learnMoreButtonPressed:(id)a3;
- (void)okayButtonPressed:(id)a3;
- (void)setAlternateChoiceButton:(id)a3;
- (void)setDetailTextLabel:(id)a3;
- (void)setDetailTextTitleLabel:(id)a3;
- (void)setLearnMoreButton:(id)a3;
- (void)setOkayButton:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setSuggestedChoiceButton:(id)a3;
- (void)setWatchView:(id)a3;
- (void)showOptinConfirmationAlert:(id)a3 optinChoice:(BOOL)a4;
- (void)suggestedButtonPressed:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation BPSSetupOptinViewController

- (BPSSetupOptinViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)BPSSetupOptinViewController;
  v2 = [(BPSSetupOptinViewController *)&v7 initWithNibName:0 bundle:0];
  v3 = v2;
  if (v2
    && [(BPSSetupOptinViewController *)v2 wantsAlternateChoicePillButton]
    && [(BPSSetupOptinViewController *)v3 wantsAlternateChoiceSystemButton])
  {
    v4 = bps_setup_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21C513000, v4, OS_LOG_TYPE_DEFAULT, "Declared CONFLICTING Alternate Button Choices! Choose either BPSSetupOptinLayoutStyleAlternateChoicePillButton or BPSSetupOptinLayoutStyleAlternateChoiceSystemButton", v6, 2u);
    }
  }
  return v3;
}

- (BOOL)wantsLightenBlendedScreen
{
  return 0;
}

- (id)suggestedButtonTitle
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([(BPSSetupOptinViewController *)self wantsSuggestedChoicePillButton])
  {
    v2 = bps_setup_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      v5 = "-[BPSSetupOptinViewController suggestedButtonTitle]";
      _os_log_impl(&dword_21C513000, v2, OS_LOG_TYPE_DEFAULT, "Wants Suggested Choice Button so %s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
    }
  }
  return 0;
}

- (id)alternateButtonTitle
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ([(BPSSetupOptinViewController *)self wantsAlternateChoicePillButton]
    && [(BPSSetupOptinViewController *)self wantsAlternateChoiceSystemButton])
  {
    v3 = bps_setup_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[BPSSetupOptinViewController alternateButtonTitle]";
      _os_log_impl(&dword_21C513000, v3, OS_LOG_TYPE_DEFAULT, "Wants Alternate Choice Button so %s should be overridden by subclasses", (uint8_t *)&v5, 0xCu);
    }
  }
  return 0;
}

- (id)learnMoreButtonTitle
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([(BPSSetupOptinViewController *)self wantsLearnMoreButton])
  {
    v2 = bps_setup_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      int v5 = "-[BPSSetupOptinViewController learnMoreButtonTitle]";
      _os_log_impl(&dword_21C513000, v2, OS_LOG_TYPE_DEFAULT, "Wants Learn More Button so %s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
    }
  }
  return 0;
}

- (id)okayButtonTitle
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([(BPSSetupOptinViewController *)self wantsOkayPillButton])
  {
    v2 = bps_setup_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      int v5 = "-[BPSSetupOptinViewController okayButtonTitle]";
      _os_log_impl(&dword_21C513000, v2, OS_LOG_TYPE_DEFAULT, "Wants OkayPillButton Button so %s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
    }
  }
  return 0;
}

- (void)suggestedButtonPressed:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([(BPSSetupOptinViewController *)self wantsSuggestedChoicePillButton])
  {
    v3 = bps_setup_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      int v5 = "-[BPSSetupOptinViewController suggestedButtonPressed:]";
      _os_log_impl(&dword_21C513000, v3, OS_LOG_TYPE_DEFAULT, "Wants Suggested Choice Button so %s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)alternateButtonPressed:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ([(BPSSetupOptinViewController *)self wantsAlternateChoicePillButton]
    && [(BPSSetupOptinViewController *)self wantsAlternateChoiceSystemButton])
  {
    int v4 = bps_setup_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[BPSSetupOptinViewController alternateButtonPressed:]";
      _os_log_impl(&dword_21C513000, v4, OS_LOG_TYPE_DEFAULT, "Wants Alternate Choice Button so %s should be overridden by subclasses", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)learnMoreButtonPressed:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([(BPSSetupOptinViewController *)self wantsLearnMoreButton])
  {
    v3 = bps_setup_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      int v5 = "-[BPSSetupOptinViewController learnMoreButtonPressed:]";
      _os_log_impl(&dword_21C513000, v3, OS_LOG_TYPE_DEFAULT, "Wants Learn More Button so %s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)okayButtonPressed:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([(BPSSetupOptinViewController *)self wantsOkayPillButton])
  {
    v3 = bps_setup_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      int v5 = "-[BPSSetupOptinViewController okayButtonPressed:]";
      _os_log_impl(&dword_21C513000, v3, OS_LOG_TYPE_DEFAULT, "Wants OkayPillButton Button so %s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (id)detailTitleString
{
  return 0;
}

- (id)detailString
{
  return 0;
}

- (id)detailAttributedString
{
  return 0;
}

- (id)imageResource
{
  return 0;
}

- (id)imageResourceBundleIdentifier
{
  return 0;
}

- (id)imageTintColor
{
  return 0;
}

- (double)sidePadding
{
  v9[1] = *MEMORY[0x263EF8340];
  v8 = &unk_26CCBC438;
  v9[0] = &unk_26CCBC4C8;
  v2 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v5[0] = xmmword_21C53C830;
  v5[1] = xmmword_21C53C840;
  int64x2_t v6 = vdupq_n_s64(0x4045C00000000000uLL);
  int64x2_t v7 = v6;
  double RelevantZoomValue = BPSScreenValueGetRelevantZoomValue((double *)v5, v2);

  return RelevantZoomValue;
}

- (double)imageDetailPadding
{
  __asm { FMOV            V1.2D, #27.0 }
  v8[0] = xmmword_21C53C850;
  v8[1] = _Q1;
  v8[2] = _Q1;
  v8[3] = _Q1;
  return BPSScreenValueGetRelevantValue((uint64_t)v8);
}

- (double)okayButtonTopPadding
{
  __asm { FMOV            V1.2D, #27.0 }
  v8[0] = xmmword_21C53C850;
  v8[1] = _Q1;
  v8[2] = _Q1;
  v8[3] = _Q1;
  return BPSScreenValueGetRelevantValue((uint64_t)v8);
}

- (double)alternateButtonDetailTextPaddingWithImage
{
  __asm { FMOV            V1.2D, #27.0 }
  v8[0] = xmmword_21C53C850;
  v8[1] = _Q1;
  v8[2] = xmmword_21C53C860;
  v8[3] = xmmword_21C53C870;
  return BPSScreenValueGetRelevantValue((uint64_t)v8);
}

- (double)noHWImageOffset
{
  long long v3 = xmmword_21C53C880;
  int64x2_t v4 = vdupq_n_s64(0x4059000000000000uLL);
  int64x2_t v5 = v4;
  int64x2_t v6 = v4;
  return BPSScreenValueGetRelevantValue((uint64_t)&v3);
}

- (double)noHWDetailOffset
{
  long long v3 = xmmword_21C53C890;
  int64x2_t v4 = vdupq_n_s64(0x4066800000000000uLL);
  int64x2_t v5 = v4;
  int64x2_t v6 = v4;
  return BPSScreenValueGetRelevantValue((uint64_t)&v3);
}

- (void)viewDidLoad
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  v93.receiver = self;
  v93.super_class = (Class)BPSSetupOptinViewController;
  [(BPSSetupPageViewController *)&v93 viewDidLoad];
  if (!self->_style)
  {
    long long v3 = bps_setup_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int64x2_t v4 = (objc_class *)objc_opt_class();
      int64x2_t v5 = NSStringFromClass(v4);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_21C513000, v3, OS_LOG_TYPE_DEFAULT, "Error: Style should be set in -init! (%@ - %@)", buf, 0x16u);
    }
  }
  id v6 = objc_alloc(MEMORY[0x263F1C940]);
  double v7 = *MEMORY[0x263F001A8];
  double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
  v11 = (UIScrollView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], v8, v9, v10);
  scrollView = self->_scrollView;
  self->_scrollView = v11;

  v13 = [(BPSSetupPageViewController *)self contentView];
  __asm { FMOV            V0.2D, #16.0 }
  long long v86 = xmmword_21C53C8A0;
  long long v88 = _Q0;
  *(_OWORD *)buf = xmmword_21C53C8A0;
  *(_OWORD *)&buf[16] = _Q0;
  long long v95 = _Q0;
  long long v96 = _Q0;
  double RelevantValue = BPSScreenValueGetRelevantValue((uint64_t)buf);
  uint64_t v20 = [(BPSSetupOptinViewController *)self detailTitleString];
  v21 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v7, v8, v9, v10);
  detailTextTitleLabel = self->_detailTextTitleLabel;
  self->_detailTextTitleLabel = v21;

  v23 = self->_detailTextTitleLabel;
  v24 = [MEMORY[0x263F1C550] clearColor];
  [(UILabel *)v23 setBackgroundColor:v24];

  v25 = self->_detailTextTitleLabel;
  v26 = BPSTextColor();
  [(UILabel *)v25 setTextColor:v26];

  v27 = self->_detailTextTitleLabel;
  v28 = BPSFontWithSize(RelevantValue);
  [(UILabel *)v27 setFont:v28];

  [(UILabel *)self->_detailTextTitleLabel setTextAlignment:1];
  [(UILabel *)self->_detailTextTitleLabel setNumberOfLines:0];
  v92 = (void *)v20;
  [(UILabel *)self->_detailTextTitleLabel setText:v20];
  [v13 addSubview:self->_detailTextTitleLabel];
  uint64_t v29 = [(BPSSetupOptinViewController *)self detailString];
  uint64_t v30 = [(BPSSetupOptinViewController *)self detailAttributedString];
  if (v29 | v30)
  {
    v31 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v7, v8, v9, v10);
    detailTextLabel = self->_detailTextLabel;
    self->_detailTextLabel = v31;

    v33 = self->_detailTextLabel;
    v34 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)v33 setBackgroundColor:v34];

    v35 = self->_detailTextLabel;
    v36 = [MEMORY[0x263F1C550] systemGrayColor];
    [(UILabel *)v35 setTextColor:v36];

    v37 = self->_detailTextLabel;
    v38 = BPSRegularFontWithSize(RelevantValue);
    [(UILabel *)v37 setFont:v38];

    [(UILabel *)self->_detailTextLabel setTextAlignment:1];
    [(UILabel *)self->_detailTextLabel setNumberOfLines:0];
    v39 = self->_detailTextLabel;
    if (v29) {
      [(UILabel *)v39 setText:v29];
    }
    else {
      [(UILabel *)v39 setAttributedText:v30];
    }
    objc_msgSend(v13, "addSubview:", self->_detailTextLabel, 0x402E000000000000, 0x4030000000000000, v88);
  }
  if ([(BPSSetupOptinViewController *)self wantsToShowWatchHW])
  {
    v40 = [(BPSSetupOptinViewController *)self imageResource];
    v41 = [(BPSSetupOptinViewController *)self imageResourceBundleIdentifier];
    if (v40)
    {
      v42 = [[BPSWatchView alloc] initWithStyle:2];
      watchView = self->_watchView;
      self->_watchView = v42;

      [(BPSWatchView *)self->_watchView setWantsLightenBlendedScreen:[(BPSSetupOptinViewController *)self wantsLightenBlendedScreen]];
      [(BPSWatchView *)self->_watchView setScreenImageSearchBundleIdentifier:v41];
      [(BPSWatchView *)self->_watchView setScreenImageName:v40];
      [v13 addSubview:self->_watchView];
    }
  }
  v90 = (void *)v30;
  v91 = (void *)v29;
  v44 = [(BPSSetupOptinViewController *)self suggestedButtonTitle];
  v45 = [(BPSSetupOptinViewController *)self alternateButtonTitle];
  v46 = [(BPSSetupOptinViewController *)self okayButtonTitle];
  [v13 frame];
  double Width = CGRectGetWidth(v98);
  [(BPSSetupOptinViewController *)self sidePadding];
  double v49 = Width + v48 * -2.0;
  BPSPillButtonImageDesiredSize(v44);
  BPSPillButtonImageDesiredSize(v45);
  BOOL v50 = [(BPSSetupOptinViewController *)self wantsSuggestedChoicePillButton];
  BOOL v51 = [(BPSSetupOptinViewController *)self wantsAlternateChoicePillButton];
  BOOL v52 = [(BPSSetupOptinViewController *)self wantsAlternateChoiceSystemButton];
  BOOL v53 = [(BPSSetupOptinViewController *)self wantsOkayPillButton];
  if (v50)
  {
    if (v44)
    {
      v54 = [MEMORY[0x263F1C488] buttonWithType:0];
      suggestedChoiceButton = self->_suggestedChoiceButton;
      self->_suggestedChoiceButton = v54;

      [(UIButton *)self->_suggestedChoiceButton addTarget:self action:sel_suggestedButtonPressed_ forControlEvents:64];
    }
    if (v51)
    {
      v56 = [MEMORY[0x263F1C488] buttonWithType:0];
      alternateChoiceButton = self->_alternateChoiceButton;
      self->_alternateChoiceButton = v56;

      v58 = self->_alternateChoiceButton;
      v59 = BPSPillButtonImage(v45, v49, 0.0, 0, 0);
      [(UIButton *)v58 setImage:v59 forState:0];

      v60 = self->_suggestedChoiceButton;
      v61 = BPSPillButtonImage(v44, v49, 0.0, 0, 0);
      [(UIButton *)v60 setImage:v61 forState:0];
    }
    else
    {
      v62 = self->_suggestedChoiceButton;
      v63 = BPSPillButtonImage(v44, v49, 0.0, 0, 0);
      [(UIButton *)v62 setImage:v63 forState:0];

      if (!v52) {
        goto LABEL_23;
      }
      v64 = [MEMORY[0x263F1C488] buttonWithType:1];
      v65 = self->_alternateChoiceButton;
      self->_alternateChoiceButton = v64;

      [(UIButton *)self->_alternateChoiceButton setTitle:v45 forState:0];
      v66 = self->_alternateChoiceButton;
      v67 = BPSBridgeTintColor();
      v68 = [v13 _accessibilityHigherContrastTintColorForColor:v67];
      [(UIButton *)v66 setTitleColor:v68 forState:0];

      v69 = [(UIButton *)self->_alternateChoiceButton titleLabel];
      *(_OWORD *)buf = v87;
      *(_OWORD *)&buf[16] = v89;
      long long v95 = v89;
      long long v96 = v89;
      double v70 = BPSScreenValueGetRelevantValue((uint64_t)buf);
      v71 = BPSRegularFontWithSize(v70);
      [v69 setFont:v71];

      v72 = self->_alternateChoiceButton;
      v61 = BPSTextColor();
      [(UIButton *)v72 setTintColor:v61];
    }
  }
LABEL_23:
  if (v53)
  {
    v73 = [MEMORY[0x263F1C488] buttonWithType:0];
    okayButton = self->_okayButton;
    self->_okayButton = v73;

    v75 = self->_okayButton;
    v76 = BPSPillButtonImage(v46, v49, 0.0, 0, 0);
    [(UIButton *)v75 setImage:v76 forState:0];

    [(UIButton *)self->_okayButton addTarget:self action:sel_okayButtonPressed_ forControlEvents:64];
  }
  [(UIButton *)self->_alternateChoiceButton addTarget:self action:sel_alternateButtonPressed_ forControlEvents:64];
  [v13 addSubview:self->_alternateChoiceButton];
  [v13 addSubview:self->_suggestedChoiceButton];
  [v13 addSubview:self->_okayButton];
  if ([(BPSSetupOptinViewController *)self wantsLearnMoreButton])
  {
    v77 = [(BPSSetupOptinViewController *)self learnMoreButtonTitle];
    if (v77)
    {
      v78 = [MEMORY[0x263F1C488] buttonWithType:1];
      learnMoreButton = self->_learnMoreButton;
      self->_learnMoreButton = v78;

      [(UIButton *)self->_learnMoreButton setTitle:v77 forState:0];
      v80 = self->_learnMoreButton;
      v81 = BPSBridgeTintColor();
      v82 = [v13 _accessibilityHigherContrastTintColorForColor:v81];
      [(UIButton *)v80 setTitleColor:v82 forState:0];

      v83 = [(UIButton *)self->_learnMoreButton titleLabel];
      v84 = BPSRegularFontWithSize(RelevantValue);
      [v83 setFont:v84];

      [(UIButton *)self->_learnMoreButton addTarget:self action:sel_learnMoreButtonPressed_ forControlEvents:64];
      [v13 addSubview:self->_learnMoreButton];
    }
  }
  v85 = [(BPSSetupOptinViewController *)self view];
  [v85 addSubview:self->_scrollView];

  [(UIScrollView *)self->_scrollView addSubview:v13];
}

- (double)suggestedChoicePillDetailTextLabelVerticalOffset
{
  [(UILabel *)self->_detailTextTitleLabel _firstLineBaselineFrameOriginY];
  __asm { FMOV            V1.2D, #27.0 }
  v9[0] = xmmword_21C53C8B0;
  v9[1] = _Q1;
  void v9[2] = _Q1;
  v9[3] = _Q1;
  return v7 + BPSScreenValueGetRelevantValue((uint64_t)v9);
}

- (void)viewDidLayoutSubviews
{
  v132[1] = *MEMORY[0x263EF8340];
  v128.receiver = self;
  v128.super_class = (Class)BPSSetupOptinViewController;
  [(BPSSetupPageViewController *)&v128 viewDidLayoutSubviews];
  long long v3 = [(BPSSetupOptinViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v131 = &unk_26CCBC438;
  v132[0] = &unk_26CCBC4D8;
  v12 = [NSDictionary dictionaryWithObjects:v132 forKeys:&v131 count:1];
  int64x2_t v124 = vdupq_n_s64(0x4040000000000000uLL);
  int64x2_t v125 = v124;
  int64x2_t v126 = v124;
  int64x2_t v127 = v124;
  double RelevantZoomValue = BPSScreenValueGetRelevantZoomValue((double *)v124.i64, v12);

  double v118 = RelevantZoomValue;
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", 0.0, RelevantZoomValue, v9, v11 - RelevantZoomValue);
  [(UIScrollView *)self->_scrollView setAlwaysBounceVertical:0];
  v133.origin.x = v5;
  v133.origin.y = v7;
  v133.size.width = v9;
  CGFloat v117 = v11;
  v133.size.height = v11;
  double Width = CGRectGetWidth(v133);
  [(BPSSetupOptinViewController *)self sidePadding];
  double v16 = v15;
  double v17 = *MEMORY[0x263F001B0];
  double v18 = *(double *)(MEMORY[0x263F001B0] + 8);
  -[BPSWatchView sizeThatFits:](self->_watchView, "sizeThatFits:", *MEMORY[0x263F001B0], v18);
  double v20 = v19;
  double v22 = v21;
  -[UIButton sizeThatFits:](self->_suggestedChoiceButton, "sizeThatFits:", v17, v18);
  double rect = v23;
  double v108 = v24;
  -[UIButton sizeThatFits:](self->_alternateChoiceButton, "sizeThatFits:", v17, v18);
  double v112 = v25;
  double v106 = v26;
  p_detailTextTitleLabel = &self->_detailTextTitleLabel;
  CGFloat v119 = v16;
  double v28 = Width + v16 * -2.0;
  -[UILabel sizeThatFits:](self->_detailTextTitleLabel, "sizeThatFits:", v28, 0.0);
  double v115 = v29;
  p_detailTextLabel = (id *)&self->_detailTextLabel;
  -[UILabel sizeThatFits:](self->_detailTextLabel, "sizeThatFits:", v28, 0.0);
  double v120 = v31;
  -[UIButton sizeThatFits:](self->_learnMoreButton, "sizeThatFits:", v17, v18);
  double v113 = v32;
  double v114 = v33;
  -[UIButton sizeThatFits:](self->_okayButton, "sizeThatFits:", v17, v18);
  double v109 = v35;
  double v110 = v34;
  double v123 = Width;
  *(float *)&double v34 = (Width - v20) * 0.5;
  double v36 = floorf(*(float *)&v34);
  v37 = [(BPSSetupPageViewController *)self titleLabel];
  [v37 _lastLineBaselineFrameOriginY];
  double v39 = v38;
  __asm { FMOV            V0.2D, #20.0 }
  int64x2_t v107 = _Q0;
  int64x2_t v124 = (int64x2_t)xmmword_21C53C8C0;
  int64x2_t v125 = _Q0;
  int64x2_t v126 = _Q0;
  int64x2_t v127 = _Q0;
  double v45 = v39 + BPSScreenValueGetRelevantValue((uint64_t)&v124);

  -[BPSWatchView setFrame:](self->_watchView, "setFrame:", v36, v45, v20, v22);
  v46 = [(BPSSetupOptinViewController *)self imageResource];

  BOOL v47 = [(BPSSetupOptinViewController *)self wantsSuggestedChoicePillButton];
  BOOL v48 = [(BPSSetupOptinViewController *)self wantsAlternateChoicePillButton];
  BOOL v49 = [(BPSSetupOptinViewController *)self wantsAlternateChoiceSystemButton];
  if (![(BPSSetupOptinViewController *)self wantsToShowWatchHW])
  {
    [(BPSSetupOptinViewController *)self noHWImageOffset];
    double v22 = v50;
  }
  double v51 = v118 * -2.0;
  if (v47)
  {
    CGFloat v111 = v9;
    if (!v46)
    {
      [(BPSSetupOptinViewController *)self noHWImageOffset];
      double v22 = v52;
    }
    float v53 = (v123 - rect) * 0.5;
    double v54 = floorf(v53);
    v134.origin.x = v36;
    v134.origin.y = v45;
    v134.size.width = v20;
    v134.size.height = v22;
    double MaxY = CGRectGetMaxY(v134);
    int64x2_t v124 = (int64x2_t)xmmword_21C53C8C0;
    int64x2_t v125 = v107;
    int64x2_t v126 = v107;
    int64x2_t v127 = v107;
    double v56 = MaxY + BPSScreenValueGetRelevantValue((uint64_t)&v124);
    -[UIButton setFrame:](self->_suggestedChoiceButton, "setFrame:", v54, v56, rect, v108);
    if (v48 || v49)
    {
      float v57 = (v123 - v112) * 0.5;
      double v58 = floorf(v57);
      v135.origin.x = v54;
      v135.origin.y = v56;
      v135.size.width = rect;
      v135.size.height = v108;
      double v59 = CGRectGetMaxY(v135) + 8.0;
      CGFloat v60 = v106;
      -[UIButton setFrame:](self->_alternateChoiceButton, "setFrame:", v58, v59, v112, v106);
    }
    else
    {
      CGFloat v60 = *(double *)(MEMORY[0x263F001A8] + 24);
      double v112 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v58 = *MEMORY[0x263F001A8];
      double v59 = *(double *)(MEMORY[0x263F001A8] + 8);
    }
    if (v48 || v49)
    {
      if (v46) {
        [(BPSSetupOptinViewController *)self alternateButtonDetailTextPaddingWithImage];
      }
      else {
        [(BPSSetupOptinViewController *)self noHWDetailOffset];
      }
      double v84 = v79;
      double v83 = v118 * -2.0;
      v145.origin.x = v58;
      v145.origin.y = v59;
      v145.size.width = v112;
      v145.size.height = v60;
      double v82 = v84 + CGRectGetMaxY(v145);
    }
    else
    {
      v144.origin.x = v54;
      v144.origin.y = v56;
      v144.size.width = rect;
      v144.size.height = v108;
      double v80 = CGRectGetMaxY(v144);
      v129 = &unk_26CCBC438;
      v130 = &unk_26CCBC4E8;
      v81 = [NSDictionary dictionaryWithObjects:&v130 forKeys:&v129 count:1];
      int64x2_t v124 = (int64x2_t)xmmword_21C53C8D0;
      int64x2_t v125 = vdupq_n_s64(0x4055800000000000uLL);
      int64x2_t v126 = v125;
      int64x2_t v127 = v125;
      double v82 = v80 + BPSScreenValueGetRelevantZoomValue((double *)v124.i64, v81);

      double v83 = v118 * -2.0;
    }
    -[UILabel setFrame:](*p_detailTextTitleLabel, "setFrame:", v16, 0.0, v28, v115);
    [(UILabel *)*p_detailTextTitleLabel _setFirstLineCapFrameOriginY:v82];
    double v85 = v120;
    objc_msgSend(*p_detailTextLabel, "setFrame:", v16, 0.0, v28, v120);
    id v86 = *p_detailTextLabel;
    [(BPSSetupOptinViewController *)self suggestedChoicePillDetailTextLabelVerticalOffset];
    objc_msgSend(v86, "_setFirstLineBaselineFrameOriginY:");
    double v87 = 0.0;
    if (self->_learnMoreButton)
    {
      double v28 = v113;
      float v88 = (v123 - v113) * 0.5;
      CGFloat v89 = floorf(v88);
      [*p_detailTextLabel frame];
      double v87 = CGRectGetMaxY(v146) + 1.0;
      CGFloat v119 = v89;
      double v90 = v89;
      double v85 = v114;
      -[UIButton setFrame:](self->_learnMoreButton, "setFrame:", v90, v87, v113, v114);
    }
    v147.origin.x = 0.0;
    v147.origin.y = v83;
    v147.size.width = v111;
    v147.size.height = v117;
    double Height = CGRectGetHeight(v147);
    CGFloat v92 = v85;
    CGFloat v93 = v119;
    CGFloat v94 = v87;
    CGFloat v95 = v28;
    CGFloat v122 = v92;
    if (!self->_learnMoreButton)
    {
      [*p_detailTextLabel frame];
      CGFloat v93 = v96;
      CGFloat v94 = v97;
      CGFloat v95 = v98;
      CGFloat v92 = v99;
    }
    v148.origin.x = v93;
    v148.origin.y = v94;
    v148.size.width = v95;
    v148.size.height = v92;
    double v100 = Height + -5.0;
    if (CGRectGetMaxY(v148) < v100)
    {
      v149.origin.x = v119;
      v149.origin.y = v87;
      v149.size.width = v28;
      v149.size.height = v122;
      if (CGRectGetMaxY(v149) < v100)
      {
        double v51 = v118 * -2.0;
        double v9 = v111;
        double v70 = v117;
        goto LABEL_33;
      }
    }
    v150.origin.x = v93;
    v150.origin.y = v94;
    v150.size.width = v95;
    v150.size.height = v92;
    double v101 = CGRectGetMaxY(v150);
    v151.origin.x = v119;
    v151.origin.y = v87;
    v151.size.width = v28;
    v151.size.height = v122;
    double v102 = CGRectGetMaxY(v151);
    if (v101 >= v102) {
      double v102 = v101;
    }
    float v103 = v102;
    double v70 = v103;
    double v78 = v103 + 5.0;
    double v51 = v118 * -2.0;
    double v9 = v111;
LABEL_32:
    float v104 = v78 + v118 * -2.0;
    -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v9, v104);
    goto LABEL_33;
  }
  -[UILabel setFrame:](*p_detailTextTitleLabel, "setFrame:", v16, 0.0, v28, v115);
  v61 = *p_detailTextTitleLabel;
  v136.origin.x = v36;
  v136.origin.y = v45;
  v136.size.width = v20;
  v136.size.height = v22;
  double v62 = CGRectGetMaxY(v136);
  [(BPSSetupOptinViewController *)self imageDetailPadding];
  [(UILabel *)v61 _setFirstLineCapFrameOriginY:v62 + v63];
  objc_msgSend(*p_detailTextLabel, "setFrame:", v16, 0.0, v28, v120);
  id v64 = *p_detailTextLabel;
  [(UILabel *)*p_detailTextTitleLabel _firstLineBaselineFrameOriginY];
  __asm { FMOV            V1.2D, #27.0 }
  int64x2_t v121 = _Q1;
  int64x2_t v124 = (int64x2_t)xmmword_21C53C8B0;
  int64x2_t v125 = _Q1;
  int64x2_t v126 = _Q1;
  int64x2_t v127 = _Q1;
  [v64 _setFirstLineBaselineFrameOriginY:v66 + BPSScreenValueGetRelevantValue((uint64_t)&v124)];
  float v67 = (v123 - v113) * 0.5;
  double v68 = floorf(v67);
  [*p_detailTextLabel frame];
  double v69 = CGRectGetMaxY(v137);
  int64x2_t v124 = (int64x2_t)xmmword_21C53C850;
  int64x2_t v125 = v121;
  int64x2_t v126 = v121;
  int64x2_t v127 = v121;
  -[UIButton setFrame:](self->_learnMoreButton, "setFrame:", v68, v69 + BPSScreenValueGetRelevantValue((uint64_t)&v124), v113, v114);
  v138.origin.x = 0.0;
  v138.origin.y = v118 * -2.0;
  v138.size.width = v9;
  double v70 = v117;
  v138.size.height = v117;
  double v71 = CGRectGetHeight(v138);
  [*p_detailTextLabel frame];
  if (CGRectIsEmpty(v139))
  {
    [(UILabel *)*p_detailTextTitleLabel frame];
    if (CGRectIsEmpty(v140)) {
      p_detailTextLabel = (id *)&self->_watchView;
    }
    else {
      p_detailTextLabel = (id *)&self->_detailTextTitleLabel;
    }
  }
  [*p_detailTextLabel frame];
  float v72 = (v123 - v110) * 0.5;
  double v73 = floorf(v72);
  double v74 = CGRectGetMaxY(v141);
  [(BPSSetupOptinViewController *)self okayButtonTopPadding];
  double v76 = v74 + v75;
  -[UIButton setFrame:](self->_okayButton, "setFrame:", v73, v76, v110, v109);
  v142.origin.x = v73;
  v142.origin.y = v76;
  v142.size.width = v110;
  v142.size.height = v109;
  if (CGRectGetMaxY(v142) >= v71 + -5.0)
  {
    v143.origin.x = v73;
    v143.origin.y = v76;
    v143.size.width = v110;
    v143.size.height = v109;
    float v77 = CGRectGetMaxY(v143) + 5.0;
    double v78 = v77;
    double v70 = v78;
    goto LABEL_32;
  }
LABEL_33:
  v105 = [(BPSSetupPageViewController *)self contentView];
  objc_msgSend(v105, "setFrame:", 0.0, v51, v9, v70);
}

- (id)optinLocalizationStringsFile
{
  return @"OptinDescriptions";
}

- (id)optinLocalizationBundle
{
  return (id)[MEMORY[0x263F086E0] mainBundle];
}

- (void)showOptinConfirmationAlert:(id)a3 optinChoice:(BOOL)a4
{
  CGFloat v5 = NSString;
  id v6 = a3;
  uint64_t v7 = [v5 stringWithFormat:@"%@_ENABLE_ALERT_TITLE", v6];
  uint64_t v8 = [NSString stringWithFormat:@"%@_ENABLE_ALERT_BODY", v6];
  uint64_t v30 = [NSString stringWithFormat:@"%@_ENABLE_ALERT_CANCEL", v6];
  double v9 = [NSString stringWithFormat:@"%@_ENABLE_ALERT_OK", v6];

  double v10 = (void *)MEMORY[0x263F1C3F8];
  double v11 = [(BPSSetupOptinViewController *)self optinLocalizationBundle];
  v12 = [(BPSSetupOptinViewController *)self optinLocalizationStringsFile];
  double v33 = (void *)v7;
  v13 = [v11 localizedStringForKey:v7 value:&stru_26CCB36C8 table:v12];
  v14 = [(BPSSetupOptinViewController *)self optinLocalizationBundle];
  double v15 = [(BPSSetupOptinViewController *)self optinLocalizationStringsFile];
  double v32 = (void *)v8;
  double v16 = [v14 localizedStringForKey:v8 value:&stru_26CCB36C8 table:v15];
  double v17 = [v10 alertControllerWithTitle:v13 message:v16 preferredStyle:1];

  double v18 = (void *)MEMORY[0x263F1C3F0];
  double v19 = [(BPSSetupOptinViewController *)self optinLocalizationBundle];
  double v20 = [(BPSSetupOptinViewController *)self optinLocalizationStringsFile];
  double v21 = [v19 localizedStringForKey:v30 value:&stru_26CCB36C8 table:v20];
  double v22 = [v18 actionWithTitle:v21 style:1 handler:0];
  [v17 addAction:v22];

  double v23 = (void *)MEMORY[0x263F1C3F0];
  double v24 = [(BPSSetupOptinViewController *)self optinLocalizationBundle];
  double v25 = [(BPSSetupOptinViewController *)self optinLocalizationStringsFile];
  double v26 = [v24 localizedStringForKey:v9 value:&stru_26CCB36C8 table:v25];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __70__BPSSetupOptinViewController_showOptinConfirmationAlert_optinChoice___block_invoke;
  v38[3] = &unk_264408A58;
  v38[4] = self;
  BOOL v39 = a4;
  v27 = [v23 actionWithTitle:v26 style:0 handler:v38];
  [v17 addAction:v27];

  double v28 = bps_setup_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C513000, v28, OS_LOG_TYPE_DEFAULT, "Presenting 'opt-in confirmation' alert", buf, 2u);
  }

  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __70__BPSSetupOptinViewController_showOptinConfirmationAlert_optinChoice___block_invoke_61;
  v34[3] = &unk_264408A80;
  BOOL v36 = a4;
  v34[4] = self;
  id v35 = v17;
  id v29 = v17;
  [(BPSSetupOptinViewController *)self presentViewController:v29 animated:1 completion:v34];
}

uint64_t __70__BPSSetupOptinViewController_showOptinConfirmationAlert_optinChoice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) applyConfirmedOptin:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __70__BPSSetupOptinViewController_showOptinConfirmationAlert_optinChoice___block_invoke_61(uint64_t a1)
{
  return [*(id *)(a1 + 32) _madeOptinChoice:*(unsigned __int8 *)(a1 + 48) withAlertController:*(void *)(a1 + 40)];
}

- (void)applyConfirmedOptin:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  long long v3 = bps_setup_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    CGFloat v5 = "-[BPSSetupOptinViewController applyConfirmedOptin:]";
    _os_log_impl(&dword_21C513000, v3, OS_LOG_TYPE_DEFAULT, "%s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)wantsSuggestedChoicePillButton
{
  return (LOBYTE(self->_style) >> 1) & 1;
}

- (BOOL)wantsAlternateChoicePillButton
{
  return (LOBYTE(self->_style) >> 2) & 1;
}

- (BOOL)wantsAlternateChoiceSystemButton
{
  return (LOBYTE(self->_style) >> 3) & 1;
}

- (BOOL)wantsLearnMoreButton
{
  return (LOBYTE(self->_style) >> 4) & 1;
}

- (BOOL)wantsToShowWatchHW
{
  return (LOBYTE(self->_style) >> 6) & 1;
}

- (BOOL)wantsOkayPillButton
{
  return (LOBYTE(self->_style) >> 5) & 1;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (BPSWatchView)watchView
{
  return self->_watchView;
}

- (void)setWatchView:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UILabel)detailTextTitleLabel
{
  return self->_detailTextTitleLabel;
}

- (void)setDetailTextTitleLabel:(id)a3
{
}

- (UILabel)detailTextLabel
{
  return self->_detailTextLabel;
}

- (void)setDetailTextLabel:(id)a3
{
}

- (UIButton)suggestedChoiceButton
{
  return self->_suggestedChoiceButton;
}

- (void)setSuggestedChoiceButton:(id)a3
{
}

- (UIButton)alternateChoiceButton
{
  return self->_alternateChoiceButton;
}

- (void)setAlternateChoiceButton:(id)a3
{
}

- (UIButton)learnMoreButton
{
  return self->_learnMoreButton;
}

- (void)setLearnMoreButton:(id)a3
{
}

- (UIButton)okayButton
{
  return self->_okayButton;
}

- (void)setOkayButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_okayButton, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_alternateChoiceButton, 0);
  objc_storeStrong((id *)&self->_suggestedChoiceButton, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_detailTextTitleLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_watchView, 0);
}

@end