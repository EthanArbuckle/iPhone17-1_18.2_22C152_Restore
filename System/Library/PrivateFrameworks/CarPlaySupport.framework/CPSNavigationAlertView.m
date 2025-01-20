@interface CPSNavigationAlertView
+ (id)createPlatterView;
- (BOOL)_layoutHeightDependsOnWidth;
- (BOOL)hasStartedAnimating;
- (CPNavigationAlert)navigationAlert;
- (CPSAbridgableNewlineLabel)subtitleLabel;
- (CPSAbridgableNewlineLabel)titleLabel;
- (CPSButton)closeButton;
- (CPSCardPlatterView)cardPlatterView;
- (CPSNavigationAlertFocusButton)primaryButton;
- (CPSNavigationAlertFocusButton)secondaryButton;
- (CPSNavigationAlertProgressView)progressView;
- (CPSNavigationAlertView)initWithFrame:(CGRect)a3 navigationAlert:(id)a4 templateDelegate:(id)a5 buttonDelegate:(id)a6;
- (CPUIFocusRingView)focusRingView;
- (NSArray)ringConstraints;
- (UIImageView)imageView;
- (UIStackView)stackView;
- (id)_linearFocusItems;
- (id)preferredFocusEnvironments;
- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setCardPlatterView:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setFocusRingView:(id)a3;
- (void)setHasStartedAnimating:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setPrimaryButton:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setRingConstraints:(id)a3;
- (void)setSecondaryButton:(id)a3;
- (void)setStackView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)startAnimating;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateNavigationAlert:(id)a3;
@end

@implementation CPSNavigationAlertView

- (id)_linearFocusItems
{
  v11 = self;
  v10[1] = (id)a2;
  v10[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  v9 = [(CPSNavigationAlertView *)v11 closeButton];

  if (v9)
  {
    v8 = [(CPSNavigationAlertView *)v11 closeButton];
    objc_msgSend(v10[0], "addObject:");
  }
  v7 = [(CPSNavigationAlertView *)v11 primaryButton];

  if (v7)
  {
    v6 = [(CPSNavigationAlertView *)v11 primaryButton];
    objc_msgSend(v10[0], "addObject:");
  }
  v5 = [(CPSNavigationAlertView *)v11 secondaryButton];

  if (v5)
  {
    v4 = [(CPSNavigationAlertView *)v11 secondaryButton];
    objc_msgSend(v10[0], "addObject:");
  }
  id v3 = (id)[v10[0] copy];
  objc_storeStrong(v10, 0);

  return v3;
}

- (id)preferredFocusEnvironments
{
  v11 = self;
  v10[1] = (id)a2;
  v10[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  v9 = [(CPSNavigationAlertView *)v11 closeButton];

  if (v9)
  {
    v8 = [(CPSNavigationAlertView *)v11 closeButton];
    objc_msgSend(v10[0], "addObject:");
  }
  v7 = [(CPSNavigationAlertView *)v11 primaryButton];

  if (v7)
  {
    v6 = [(CPSNavigationAlertView *)v11 primaryButton];
    objc_msgSend(v10[0], "addObject:");
  }
  v5 = [(CPSNavigationAlertView *)v11 secondaryButton];

  if (v5)
  {
    v4 = [(CPSNavigationAlertView *)v11 secondaryButton];
    objc_msgSend(v10[0], "addObject:");
  }
  id v3 = v10[0];
  objc_storeStrong(v10, 0);

  return v3;
}

- (CPSNavigationAlertView)initWithFrame:(CGRect)a3 navigationAlert:(id)a4 templateDelegate:(id)a5 buttonDelegate:(id)a6
{
  v185[4] = *MEMORY[0x263EF8340];
  CGRect v179 = a3;
  v178 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  id v176 = 0;
  objc_storeStrong(&v176, a5);
  id v175 = 0;
  objc_storeStrong(&v175, a6);
  v6 = v178;
  v178 = 0;
  v174.receiver = v6;
  v174.super_class = (Class)CPSNavigationAlertView;
  v157 = -[CPSNavigationAlertView initWithFrame:](&v174, sel_initWithFrame_, v179.origin.x, v179.origin.y, v179.size.width, v179.size.height);
  v178 = v157;
  objc_storeStrong((id *)&v178, v157);
  if (v157)
  {
    v110 = v178;
    id v111 = (id)[MEMORY[0x263F1C550] clearColor];
    -[CPSNavigationAlertView setBackgroundColor:](v110, "setBackgroundColor:");

    id v173 = (id)[MEMORY[0x263F1C480] effectWithStyle:9];
    id v172 = (id)[objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:v173];
    [v172 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPSNavigationAlertView *)v178 addSubview:v172];
    id v112 = (id)[MEMORY[0x263F1C408] sharedApplication];
    BOOL v113 = [v112 userInterfaceLayoutDirection] == 1;

    BOOL v171 = v113;
    uint64_t v170 = 0;
    uint64_t v7 = 2;
    if (!v113) {
      uint64_t v7 = 0;
    }
    uint64_t v170 = v7;
    id v116 = (id)[location[0] subtitleVariants];
    id v115 = (id)[v116 firstObject];
    id v114 = +[CPSAbridgableNewlineLabel sanitizedTextForText:](CPSAbridgableNewlineLabel, "sanitizedTextForText:");
    BOOL v117 = [v114 length] != 0;

    BOOL v169 = v117;
    id v120 = (id)[location[0] titleVariants];
    id v119 = (id)[v120 firstObject];
    id v118 = +[CPSAbridgableNewlineLabel sanitizedTextForText:](CPSAbridgableNewlineLabel, "sanitizedTextForText:");
    BOOL v121 = [v118 length] != 0;

    BOOL v168 = v121;
    BOOL v167 = CPSAlertUsesMinimalStyle(location[0]);
    id v166 = (id)[(id)objc_opt_class() createPlatterView];
    id v122 = (id)objc_msgSend(MEMORY[0x263F1C550], "crsui_consoleTurnCardETATrayBackgroundColor");
    objc_msgSend(v166, "setBackgroundColor:");

    [v166 setShadowWithRadius:20.0 opacity:0.18];
    [(CPSNavigationAlertView *)v178 addSubview:v166];
    [v166 setTranslatesAutoresizingMaskIntoConstraints:0];
    v123 = (void *)MEMORY[0x263F08938];
    id v136 = (id)[v166 topAnchor];
    id v135 = (id)[(CPSNavigationAlertView *)v178 topAnchor];
    id v134 = (id)objc_msgSend(v136, "constraintEqualToAnchor:");
    v185[0] = v134;
    id v133 = (id)[v166 bottomAnchor];
    id v132 = (id)[(CPSNavigationAlertView *)v178 bottomAnchor];
    id v131 = (id)objc_msgSend(v133, "constraintEqualToAnchor:");
    v185[1] = v131;
    id v130 = (id)[v166 leadingAnchor];
    id v129 = (id)[(CPSNavigationAlertView *)v178 leadingAnchor];
    id v128 = (id)objc_msgSend(v130, "constraintEqualToAnchor:");
    v185[2] = v128;
    id v127 = (id)[v166 trailingAnchor];
    id v126 = (id)[(CPSNavigationAlertView *)v178 trailingAnchor];
    id v125 = (id)objc_msgSend(v127, "constraintEqualToAnchor:");
    v185[3] = v125;
    id v124 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v185);
    objc_msgSend(v123, "activateConstraints:");

    objc_storeStrong((id *)&v178->_navigationAlert, location[0]);
    id v8 = objc_alloc(MEMORY[0x263F31368]);
    v138 = (double *)MEMORY[0x263F001A8];
    uint64_t v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    focusRingView = v178->_focusRingView;
    v178->_focusRingView = (CPUIFocusRingView *)v9;

    [(CPUIFocusRingView *)v178->_focusRingView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v137 = (id)[MEMORY[0x263F1C550] systemBlueColor];
    -[CPUIFocusRingView setRingColor:](v178->_focusRingView, "setRingColor:");

    [(CPUIFocusRingView *)v178->_focusRingView setCornerRadius:8.0];
    [(CPUIFocusRingView *)v178->_focusRingView setHidden:1];
    [v166 addSubview:v178->_focusRingView];
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1C9B8]), "initWithFrame:", *v138, v138[1], v138[2], v138[3]);
    stackView = v178->_stackView;
    v178->_stackView = (UIStackView *)v11;

    [(UIStackView *)v178->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v178->_stackView setAxis:1];
    [(UIStackView *)v178->_stackView setDistribution:0];
    [(UIStackView *)v178->_stackView setAlignment:0];
    [(UIStackView *)v178->_stackView setSpacing:0.0];
    id v139 = (id)[MEMORY[0x263F1C550] clearColor];
    -[UIStackView setBackgroundColor:](v178->_stackView, "setBackgroundColor:");

    v140 = [(CPSNavigationAlertView *)v178 stackView];
    objc_msgSend(v166, "addSubview:");

    v141 = (void *)MEMORY[0x263F08938];
    id v154 = (id)[(UIStackView *)v178->_stackView topAnchor];
    id v153 = (id)[(CPSNavigationAlertView *)v178 topAnchor];
    id v152 = (id)objc_msgSend(v154, "constraintEqualToAnchor:constant:", 10.0);
    v184[0] = v152;
    id v151 = (id)[(UIStackView *)v178->_stackView bottomAnchor];
    id v150 = (id)[(CPSNavigationAlertView *)v178 bottomAnchor];
    id v149 = (id)objc_msgSend(v151, "constraintEqualToAnchor:constant:", -10.0);
    v184[1] = v149;
    id v148 = (id)[(UIStackView *)v178->_stackView leadingAnchor];
    id v147 = (id)[(CPSNavigationAlertView *)v178 leadingAnchor];
    id v146 = (id)objc_msgSend(v148, "constraintEqualToAnchor:constant:", 10.0);
    v184[2] = v146;
    id v145 = (id)[(UIStackView *)v178->_stackView trailingAnchor];
    id v144 = (id)[(CPSNavigationAlertView *)v178 trailingAnchor];
    id v143 = (id)objc_msgSend(v145, "constraintEqualToAnchor:constant:", -10.0);
    v184[3] = v143;
    id v142 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v184 count:4];
    objc_msgSend(v141, "activateConstraints:");

    [location[0] duration];
    if (v13 > 0.0)
    {
      v14 = [CPSNavigationAlertProgressView alloc];
      uint64_t v15 = -[CPSNavigationAlertProgressView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      progressView = v178->_progressView;
      v178->_progressView = (CPSNavigationAlertProgressView *)v15;

      [(CPSNavigationAlertProgressView *)v178->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
      if (CPSAlertUsesMinimalStyle(location[0]))
      {
        id v109 = (id)[MEMORY[0x263F1C550] separatorColor];
        -[CPSNavigationAlertProgressView setBackgroundColor:](v178->_progressView, "setBackgroundColor:");
      }
    }
    if (v168)
    {
      v17 = [CPSAbridgableNewlineLabel alloc];
      uint64_t v18 = -[CPSAbridgableNewlineLabel initWithFrame:](v17, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      titleLabel = v178->_titleLabel;
      v178->_titleLabel = (CPSAbridgableNewlineLabel *)v18;

      id v105 = (id)[MEMORY[0x263F1C550] labelColor];
      -[CPSAbridgableNewlineLabel setTextColor:](v178->_titleLabel, "setTextColor:");

      id v106 = (id)[MEMORY[0x263F1C658] systemFontOfSize:16.0 weight:*MEMORY[0x263F1D340]];
      -[CPSAbridgableNewlineLabel setFont:](v178->_titleLabel, "setFont:");

      [(CPSAbridgableNewlineLabel *)v178->_titleLabel setTextAlignment:v170];
      [(CPSAbridgableNewlineLabel *)v178->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      [(CPSAbridgableNewlineLabel *)v178->_titleLabel setNumberOfLines:2];
      LODWORD(v20) = 1144750080;
      -[CPSAbridgableNewlineLabel setContentCompressionResistancePriority:forAxis:](v178->_titleLabel, "setContentCompressionResistancePriority:forAxis:", v20);
      -[CPSAbridgableNewlineLabel setContentCompressionResistancePriority:forAxis:](v178->_titleLabel, "setContentCompressionResistancePriority:forAxis:");
      LODWORD(v21) = 1148846080;
      [(CPSAbridgableNewlineLabel *)v178->_titleLabel setContentHuggingPriority:1 forAxis:v21];
      LODWORD(v22) = 1148846080;
      [(CPSAbridgableNewlineLabel *)v178->_titleLabel setContentHuggingPriority:0 forAxis:v22];
      v107 = v178->_titleLabel;
      id v108 = (id)[location[0] titleVariants];
      -[CPSAbridgableLabel setTextVariants:](v107, "setTextVariants:");
    }
    if (v169)
    {
      v23 = [CPSAbridgableNewlineLabel alloc];
      uint64_t v24 = -[CPSAbridgableNewlineLabel initWithFrame:](v23, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      subtitleLabel = v178->_subtitleLabel;
      v178->_subtitleLabel = (CPSAbridgableNewlineLabel *)v24;

      id v101 = (id)[MEMORY[0x263F1C550] secondaryLabelColor];
      -[CPSAbridgableNewlineLabel setTextColor:](v178->_subtitleLabel, "setTextColor:");

      id v102 = (id)[MEMORY[0x263F1C658] systemFontOfSize:12.0 weight:*MEMORY[0x263F1D338]];
      -[CPSAbridgableNewlineLabel setFont:](v178->_subtitleLabel, "setFont:");

      [(CPSAbridgableNewlineLabel *)v178->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      -[CPSAbridgableNewlineLabel setNumberOfLines:](v178->_subtitleLabel, "setNumberOfLines:");
      [(CPSAbridgableNewlineLabel *)v178->_subtitleLabel setTextAlignment:v170];
      [(CPSAbridgableNewlineLabel *)v178->_subtitleLabel setLineBreakMode:0];
      LODWORD(v26) = 1132068864;
      -[CPSAbridgableNewlineLabel setContentCompressionResistancePriority:forAxis:](v178->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", v26);
      -[CPSAbridgableNewlineLabel setContentCompressionResistancePriority:forAxis:](v178->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 0);
      LODWORD(v27) = 1148846080;
      [(CPSAbridgableNewlineLabel *)v178->_subtitleLabel setContentHuggingPriority:1 forAxis:v27];
      LODWORD(v28) = 1148846080;
      [(CPSAbridgableNewlineLabel *)v178->_subtitleLabel setContentHuggingPriority:0 forAxis:v28];
      v103 = v178->_subtitleLabel;
      id v104 = (id)[location[0] subtitleVariants];
      -[CPSAbridgableLabel setTextVariants:](v103, "setTextVariants:");
    }
    id v100 = (id)[location[0] image];

    if (v100)
    {
      id v29 = objc_alloc(MEMORY[0x263F1C6D0]);
      uint64_t v30 = objc_msgSend(v29, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      imageView = v178->_imageView;
      v178->_imageView = (UIImageView *)v30;

      -[UIImageView setContentMode:](v178->_imageView, "setContentMode:");
      v97 = v178->_imageView;
      id v99 = (id)[location[0] image];
      id v98 = (id)CPImageByScalingImageToSize();
      -[UIImageView setImage:](v97, "setImage:");

      [(UIImageView *)v178->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
      -[UIImageView setContentCompressionResistancePriority:forAxis:](v178->_imageView, "setContentCompressionResistancePriority:forAxis:", 1);
      LODWORD(v32) = 1148846080;
      -[UIImageView setContentCompressionResistancePriority:forAxis:](v178->_imageView, "setContentCompressionResistancePriority:forAxis:", v32);
      LODWORD(v33) = 1148846080;
      [(UIImageView *)v178->_imageView setContentHuggingPriority:1 forAxis:v33];
      LODWORD(v34) = 1148846080;
      [(UIImageView *)v178->_imageView setContentHuggingPriority:0 forAxis:v34];
    }
    if (v167)
    {
      v35 = +[CPUIButton buttonWithType:](CPSButton, "buttonWithType:");
      closeButton = v178->_closeButton;
      v178->_closeButton = v35;

      [(CPSButton *)v178->_closeButton setTranslatesAutoresizingMaskIntoConstraints:0];
      id v86 = (id)[MEMORY[0x263F1C6B0] systemImageNamed:@"xmark.circle.fill"];
      id v165 = (id)objc_msgSend(v86, "imageWithRenderingMode:");

      [(CPSButton *)v178->_closeButton setImage:v165 forState:0];
      v87 = (void *)MEMORY[0x263F1C6C8];
      id v90 = (id)[MEMORY[0x263F1C550] secondaryLabelColor];
      v183[0] = v90;
      id v89 = (id)[MEMORY[0x263F1C550] tertiarySystemFillColor];
      v183[1] = v89;
      id v88 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v183 count:2];
      id v164 = (id)objc_msgSend(v87, "configurationWithPaletteColors:");

      [(CPSButton *)v178->_closeButton setPreferredSymbolConfiguration:v164 forImageInState:0];
      -[CPSButton setImage:forState:](v178->_closeButton, "setImage:forState:", v165);
      v91 = (void *)MEMORY[0x263F1C6C8];
      id v94 = (id)[MEMORY[0x263F1C550] whiteColor];
      v182[0] = v94;
      id v93 = (id)[MEMORY[0x263F1C550] systemBlueColor];
      v182[1] = v93;
      id v92 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v182 count:2];
      id v163 = (id)objc_msgSend(v91, "configurationWithPaletteColors:");

      [(CPSButton *)v178->_closeButton setPreferredSymbolConfiguration:v163 forImageInState:8];
      [(CPSButton *)v178->_closeButton setAdjustsImageWhenHighlighted:1];
      -[CPSButton setContentCompressionResistancePriority:forAxis:](v178->_closeButton, "setContentCompressionResistancePriority:forAxis:");
      LODWORD(v37) = 1148846080;
      [(CPSButton *)v178->_closeButton setContentCompressionResistancePriority:0 forAxis:v37];
      LODWORD(v38) = 1148846080;
      [(CPSButton *)v178->_closeButton setContentHuggingPriority:1 forAxis:v38];
      LODWORD(v39) = 1148846080;
      [(CPSButton *)v178->_closeButton setContentHuggingPriority:0 forAxis:v39];
      [(CPSButton *)v178->_closeButton setDelegate:v175];
      id v96 = (id)[MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B08]];
      id v95 = (id)[(CPSButton *)v178->_closeButton layer];
      [v95 setCompositingFilter:v96];

      objc_storeStrong(&v163, 0);
      objc_storeStrong(&v164, 0);
      objc_storeStrong(&v165, 0);
    }
    id v162 = (id)[MEMORY[0x263EFF980] array];
    char v161 = 0;
    id v85 = (id)[location[0] image];

    if (v85)
    {
      if (v167)
      {
        v181[0] = v178->_imageView;
        v181[1] = v178->_closeButton;
        id v84 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v181 count:2];
        objc_msgSend(v162, "addObjectsFromArray:");
      }
      else if (v168)
      {
        v180[0] = v178->_titleLabel;
        v180[1] = v178->_imageView;
        id v83 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v180 count:2];
        objc_msgSend(v162, "addObjectsFromArray:");

        char v161 = 1;
      }
      else
      {
        [v162 addObject:v178->_imageView];
      }
    }
    else if (v168)
    {
      [v162 addObject:v178->_titleLabel];
      char v161 = 1;
      if (v167) {
        [v162 addObject:v178->_closeButton];
      }
    }
    else if (v167)
    {
      [v162 addObject:v178->_closeButton];
    }
    if ([v162 count] == 1)
    {
      id v82 = (id)objc_opt_new();
      objc_msgSend(v162, "addObject:");
    }
    id v160 = (id)[objc_alloc(MEMORY[0x263F1C9B8]) initWithArrangedSubviews:v162];
    [v160 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_msgSend(v160, "setAxis:");
    [v160 setAlignment:2];
    if (v161) {
      uint64_t v40 = 4;
    }
    else {
      uint64_t v40 = 3;
    }
    [v160 setDistribution:v40];
    float v41 = 10.0;
    if ((v161 & 1) == 0) {
      float v41 = 2.0;
    }
    [v160 setSpacing:v41];
    id v79 = (id)[MEMORY[0x263F1C550] clearColor];
    objc_msgSend(v160, "setBackgroundColor:");

    objc_msgSend(v160, "setContentCompressionResistancePriority:forAxis:");
    LODWORD(v42) = 1148846080;
    [v160 setContentCompressionResistancePriority:0 forAxis:v42];
    LODWORD(v43) = 1148846080;
    [v160 setContentHuggingPriority:1 forAxis:v43];
    LODWORD(v44) = 1148846080;
    [v160 setContentHuggingPriority:0 forAxis:v44];
    v80 = [(CPSNavigationAlertView *)v178 stackView];
    [(UIStackView *)v80 addArrangedSubview:v160];

    v45 = [(CPSNavigationAlertView *)v178 stackView];
    v81 = v45;
    float v46 = 4.0;
    if ((v161 & 1) == 0) {
      float v46 = 8.0;
    }
    [(UIStackView *)v45 setCustomSpacing:v160 afterView:v46];

    if (v168 && (v161 & 1) == 0)
    {
      v78 = [(CPSNavigationAlertView *)v178 stackView];
      [(UIStackView *)v78 addArrangedSubview:v178->_titleLabel];

      if (v169) {
        double v159 = 0.0;
      }
      else {
        double v159 = 10.0;
      }
      v77 = [(CPSNavigationAlertView *)v178 stackView];
      [(UIStackView *)v77 setCustomSpacing:v178->_titleLabel afterView:v159];
    }
    if (v169)
    {
      v76 = [(CPSNavigationAlertView *)v178 stackView];
      [(UIStackView *)v76 addArrangedSubview:v178->_subtitleLabel];

      if (CPSAlertUsesMinimalStyle(location[0]))
      {
        [location[0] duration];
        if (v47 <= 0.0) {
          double v158 = 0.0;
        }
        else {
          double v158 = 10.0;
        }
      }
      else
      {
        double v158 = 10.0;
      }
      v75 = [(CPSNavigationAlertView *)v178 stackView];
      [(UIStackView *)v75 setCustomSpacing:v178->_subtitleLabel afterView:v158];
    }
    id v73 = (id)[location[0] primaryAction];
    LOBYTE(v74) = 0;
    if (v73) {
      BOOL v74 = !CPSAlertUsesMinimalStyle(location[0]);
    }

    if (v74)
    {
      id v69 = (id)[location[0] primaryAction];
      v48 = +[CPSNavigationAlertFocusButton buttonWithAction:progressView:isPrimary:](CPSNavigationAlertFocusButton, "buttonWithAction:progressView:isPrimary:");
      primaryButton = v178->_primaryButton;
      v178->_primaryButton = v48;

      [(CPSButton *)v178->_primaryButton setDelegate:v175];
      [(CPSNavigationAlertFocusButton *)v178->_primaryButton setTranslatesAutoresizingMaskIntoConstraints:0];
      -[CPSNavigationAlertFocusButton setContentCompressionResistancePriority:forAxis:](v178->_primaryButton, "setContentCompressionResistancePriority:forAxis:");
      LODWORD(v50) = 1148846080;
      -[CPSNavigationAlertFocusButton setContentCompressionResistancePriority:forAxis:](v178->_primaryButton, "setContentCompressionResistancePriority:forAxis:", v50);
      LODWORD(v51) = 1148846080;
      [(CPSNavigationAlertFocusButton *)v178->_primaryButton setContentHuggingPriority:1 forAxis:v51];
      LODWORD(v52) = 1148846080;
      [(CPSNavigationAlertFocusButton *)v178->_primaryButton setContentHuggingPriority:0 forAxis:v52];
      v70 = [(CPSNavigationAlertView *)v178 stackView];
      [(UIStackView *)v70 addArrangedSubview:v178->_primaryButton];

      v72 = [(CPSNavigationAlertView *)v178 stackView];
      id v71 = (id)[location[0] secondaryAction];
      float v53 = 4.0;
      if (!v71) {
        float v53 = 0.0;
      }
      [(UIStackView *)v72 setCustomSpacing:v178->_primaryButton afterView:v53];
    }
    id v68 = (id)[location[0] secondaryAction];

    if (v68)
    {
      id v66 = (id)[location[0] secondaryAction];
      v54 = +[CPSNavigationAlertFocusButton buttonWithAction:progressView:isPrimary:](CPSNavigationAlertFocusButton, "buttonWithAction:progressView:isPrimary:");
      secondaryButton = v178->_secondaryButton;
      v178->_secondaryButton = v54;

      [(CPSButton *)v178->_secondaryButton setDelegate:v175];
      [(CPSNavigationAlertFocusButton *)v178->_secondaryButton setTranslatesAutoresizingMaskIntoConstraints:0];
      -[CPSNavigationAlertFocusButton setContentCompressionResistancePriority:forAxis:](v178->_secondaryButton, "setContentCompressionResistancePriority:forAxis:");
      LODWORD(v56) = 1148846080;
      -[CPSNavigationAlertFocusButton setContentCompressionResistancePriority:forAxis:](v178->_secondaryButton, "setContentCompressionResistancePriority:forAxis:", v56);
      LODWORD(v57) = 1148846080;
      [(CPSNavigationAlertFocusButton *)v178->_secondaryButton setContentHuggingPriority:1 forAxis:v57];
      LODWORD(v58) = 1148846080;
      [(CPSNavigationAlertFocusButton *)v178->_secondaryButton setContentHuggingPriority:0 forAxis:v58];
      v67 = [(CPSNavigationAlertView *)v178 stackView];
      [(UIStackView *)v67 addArrangedSubview:v178->_secondaryButton];
    }
    if (CPSAlertUsesMinimalStyle(location[0]))
    {
      [location[0] duration];
      if (v59 > 0.0)
      {
        -[CPSNavigationAlertProgressView setContentCompressionResistancePriority:forAxis:](v178->_progressView, "setContentCompressionResistancePriority:forAxis:");
        LODWORD(v60) = 1148846080;
        -[CPSNavigationAlertProgressView setContentCompressionResistancePriority:forAxis:](v178->_progressView, "setContentCompressionResistancePriority:forAxis:", v60);
        LODWORD(v61) = 1148846080;
        [(CPSNavigationAlertProgressView *)v178->_progressView setContentHuggingPriority:1 forAxis:v61];
        LODWORD(v62) = 1148846080;
        [(CPSNavigationAlertProgressView *)v178->_progressView setContentHuggingPriority:0 forAxis:v62];
        v65 = [(CPSNavigationAlertView *)v178 stackView];
        [(UIStackView *)v65 addArrangedSubview:v178->_progressView];
      }
    }
    objc_storeStrong(&v160, 0);
    objc_storeStrong(&v162, 0);
    objc_storeStrong(&v166, 0);
    objc_storeStrong(&v172, 0);
    objc_storeStrong(&v173, 0);
  }
  v64 = v178;
  objc_storeStrong(&v175, 0);
  objc_storeStrong(&v176, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v178, 0);
  return v64;
}

- (void)startAnimating
{
  v61[3] = *MEMORY[0x263EF8340];
  double v60 = self;
  v59[1] = (id)a2;
  if (!self->_hasStartedAnimating)
  {
    v60->_hasStartedAnimating = 1;
    id v2 = objc_alloc(MEMORY[0x263F1CB60]);
    v59[0] = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v59[0] setTranslatesAutoresizingMaskIntoConstraints:0];
    id v44 = (id)[v59[0] layer];
    [v44 setMasksToBounds:1];

    double v58 = 0.0;
    v45 = [(CPSNavigationAlertView *)v60 navigationAlert];
    BOOL v46 = CPSAlertUsesMinimalStyle(v45);

    if (v46)
    {
      id v39 = (id)[v59[0] layer];
      [v39 setCornerRadius:2.0];

      id v40 = (id)[v59[0] layer];
      [v40 setMaskedCorners:15];

      uint64_t v41 = *MEMORY[0x263F15A20];
      id v42 = (id)[v59[0] layer];
      [v42 setCornerCurve:v41];

      id v43 = (id)[MEMORY[0x263F1C550] systemBlueColor];
      objc_msgSend(v59[0], "setBackgroundColor:");

      double v58 = 4.0;
    }
    else
    {
      double v57 = 0.0;
      id location = 0;
      double v38 = [(CPSNavigationAlertView *)v60 navigationAlert];
      double v37 = [(CPNavigationAlert *)v38 primaryAction];
      id v36 = CPSBackgroundColorForAlertAction(v37, 1);
      *(void *)&v55[1] = (id)CPContrastingColorForColor();

      if (!*(void *)&v55[1])
      {
        id v34 = (id)[MEMORY[0x263F1C920] _carScreen];
        id v33 = (id)[v34 traitCollection];
        BOOL v35 = [v33 userInterfaceStyle] == 2;

        *(void *)v55 = v35;
        if (v35) {
          id v3 = (id)[MEMORY[0x263F1C550] whiteColor];
        }
        else {
          id v3 = (id)[MEMORY[0x263F1C550] blackColor];
        }
        v4 = *(void **)&v55[1];
        *(void *)&v55[1] = v3;
      }
      id v31 = (id)[MEMORY[0x263F1C550] whiteColor];
      char v32 = objc_msgSend(*(id *)&v55[1], "isEqual:");

      if (v32)
      {
        double v57 = 0.100000001;
        objc_storeStrong(&location, (id)*MEMORY[0x263F15D58]);
      }
      else
      {
        double v57 = 0.0599999987;
        objc_storeStrong(&location, (id)*MEMORY[0x263F15D50]);
      }
      id v27 = (id)[*(id *)&v55[1] colorWithAlphaComponent:v57];
      objc_msgSend(v59[0], "setBackgroundColor:");

      id v54 = (id)[MEMORY[0x263F157C8] filterWithType:location];
      id v28 = v54;
      uint64_t v5 = [*(id *)&v55[1] CGColor];
      [v28 setValue:v5 forKey:*MEMORY[0x263F15C20]];
      id v29 = v54;
      id v30 = (id)[v59[0] layer];
      [v30 setCompositingFilter:v29];

      double v58 = 36.0;
      objc_storeStrong(&v54, 0);
      objc_storeStrong((id *)&v55[1], 0);
      objc_storeStrong(&location, 0);
    }
    id v24 = (id)[(CPSNavigationAlertProgressView *)v60->_progressView superview];
    [v24 addSubview:v59[0]];

    v25 = [(CPSNavigationAlertView *)v60 navigationAlert];
    BOOL v26 = CPSAlertUsesMinimalStyle(v25);

    if (!v26)
    {
      id v23 = (id)[(CPSNavigationAlertProgressView *)v60->_progressView superview];
      id v22 = (id)[(CPSNavigationAlertProgressView *)v60->_progressView superview];
      id v21 = (id)[v22 titleLabel];
      objc_msgSend(v23, "bringSubviewToFront:");
    }
    id v8 = (id)[v59[0] widthAnchor];
    id v7 = (id)[(CPSNavigationAlertProgressView *)v60->_progressView widthAnchor];
    id v53 = (id)objc_msgSend(v8, "constraintEqualToAnchor:");

    uint64_t v9 = (void *)MEMORY[0x263F08938];
    id v18 = (id)[v59[0] leadingAnchor];
    id v17 = (id)[(CPSNavigationAlertProgressView *)v60->_progressView leadingAnchor];
    id v16 = (id)objc_msgSend(v18, "constraintEqualToAnchor:");
    v61[0] = v16;
    id v15 = (id)[v59[0] topAnchor];
    id v14 = (id)[(CPSNavigationAlertProgressView *)v60->_progressView topAnchor];
    id v13 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
    v61[1] = v13;
    id v12 = (id)[v59[0] heightAnchor];
    id v11 = (id)[v12 constraintEqualToConstant:v58];
    v61[2] = v11;
    id v10 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:3];
    objc_msgSend(v9, "activateConstraints:");

    [(CPSNavigationAlertView *)v60 layoutIfNeeded];
    [v53 setActive:1];
    double v20 = (void *)MEMORY[0x263F1CB60];
    [(CPNavigationAlert *)v60->_navigationAlert duration];
    double v19 = v6;
    uint64_t v47 = MEMORY[0x263EF8330];
    int v48 = -1073741824;
    int v49 = 0;
    double v50 = __40__CPSNavigationAlertView_startAnimating__block_invoke;
    double v51 = &unk_2648A3BE0;
    double v52 = v60;
    objc_msgSend(v20, "animateWithDuration:delay:options:animations:completion:", 196614, &v47, v19, 0.0);
    objc_storeStrong((id *)&v52, 0);
    objc_storeStrong(&v53, 0);
    objc_storeStrong(v59, 0);
  }
}

uint64_t __40__CPSNavigationAlertView_startAnimating__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded", a1, a1);
}

- (void)updateNavigationAlert:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = CarPlaySupportGeneralLogging();
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)location[0]);
    _os_log_impl(&dword_22B689000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "Received update for navigation alert %@", v10, 0xCu);
  }
  objc_storeStrong(&v7, 0);
  v4 = [(CPSNavigationAlertView *)v9 titleLabel];
  id v3 = (id)[location[0] titleVariants];
  -[CPSAbridgableLabel setTextVariants:](v4, "setTextVariants:");

  double v6 = [(CPSNavigationAlertView *)v9 subtitleLabel];
  id v5 = (id)[location[0] subtitleVariants];
  -[CPSAbridgableLabel setTextVariants:](v6, "setTextVariants:");

  [(CPSNavigationAlertView *)v9 invalidateIntrinsicContentSize];
  [(CPSNavigationAlertView *)v9 setNeedsLayout];
  objc_storeStrong(location, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16.receiver = v18;
  v16.super_class = (Class)CPSNavigationAlertView;
  [(CPSNavigationAlertView *)&v16 traitCollectionDidChange:location[0]];
  id v15 = 0;
  id v13 = (id)[(CPSNavigationAlertView *)v18 traitCollection];
  uint64_t v14 = [v13 userInterfaceStyle];

  switch(v14)
  {
    case 0:
      goto LABEL_4;
    case 1:
      id v5 = (id)[MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D50]];
      id v6 = v15;
      id v15 = v5;

      break;
    case 2:
LABEL_4:
      id v3 = (id)[MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D58]];
      id v4 = v15;
      id v15 = v3;

      break;
  }
  id v7 = v15;
  uint64_t v9 = [(CPSNavigationAlertView *)v18 titleLabel];
  id v8 = (id)[(CPSAbridgableNewlineLabel *)v9 layer];
  [v8 setCompositingFilter:v7];

  id v10 = v15;
  id v12 = [(CPSNavigationAlertView *)v18 subtitleLabel];
  id v11 = (id)[(CPSAbridgableNewlineLabel *)v12 layer];
  [v11 setCompositingFilter:v10];

  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v31[4] = *MEMORY[0x263EF8340];
  id v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v28 = 0;
  objc_storeStrong(&v28, a4);
  v27.receiver = v30;
  v27.super_class = (Class)CPSNavigationAlertView;
  [(CPSNavigationAlertView *)&v27 didUpdateFocusInContext:location[0] withAnimationCoordinator:v28];
  id v26 = (id)[location[0] nextFocusedView];
  if (!v26) {
    goto LABEL_10;
  }
  id v21 = [(CPSNavigationAlertView *)v30 primaryButton];
  char v24 = 0;
  BOOL v22 = 1;
  if (v26 != v21)
  {
    v25 = [(CPSNavigationAlertView *)v30 secondaryButton];
    char v24 = 1;
    BOOL v22 = v26 == v25;
  }
  if (v24) {

  }
  if (v22)
  {
    double v20 = [(CPSNavigationAlertView *)v30 ringConstraints];

    if (v20)
    {
      id v18 = (void *)MEMORY[0x263F08938];
      double v19 = [(CPSNavigationAlertView *)v30 ringConstraints];
      objc_msgSend(v18, "deactivateConstraints:");

      objc_storeStrong((id *)&v30->_ringConstraints, 0);
    }
    [(CPUIFocusRingView *)v30->_focusRingView setHidden:0];
    id v17 = (id)[(CPUIFocusRingView *)v30->_focusRingView topAnchor];
    id v16 = (id)[v26 topAnchor];
    id v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:constant:");
    v31[0] = v15;
    id v14 = (id)[(CPUIFocusRingView *)v30->_focusRingView bottomAnchor];
    id v13 = (id)[v26 bottomAnchor];
    id v12 = (id)objc_msgSend(v14, "constraintEqualToAnchor:constant:");
    v31[1] = v12;
    id v11 = (id)[(CPUIFocusRingView *)v30->_focusRingView leadingAnchor];
    id v10 = (id)[v26 leadingAnchor];
    id v9 = (id)objc_msgSend(v11, "constraintEqualToAnchor:constant:", -3.0);
    v31[2] = v9;
    id v8 = (id)[(CPUIFocusRingView *)v30->_focusRingView trailingAnchor];
    id v7 = (id)[v26 trailingAnchor];
    id v6 = (id)objc_msgSend(v8, "constraintEqualToAnchor:constant:", 3.0);
    v31[3] = v6;
    id v4 = (NSArray *)(id)[MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:4];
    ringConstraints = v30->_ringConstraints;
    v30->_ringConstraints = v4;

    [MEMORY[0x263F08938] activateConstraints:v30->_ringConstraints];
    [(CPSNavigationAlertView *)v30 bringSubviewToFront:v30->_focusRingView];
  }
  else
  {
LABEL_10:
    [(CPUIFocusRingView *)v30->_focusRingView setHidden:1];
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_layoutHeightDependsOnWidth
{
  return 1;
}

- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize
{
  return 1;
}

+ (id)createPlatterView
{
  id v2 = [CPSCardPlatterView alloc];
  id v3 = -[CPSCardPlatterView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  return v3;
}

- (CPSCardPlatterView)cardPlatterView
{
  return self->_cardPlatterView;
}

- (void)setCardPlatterView:(id)a3
{
}

- (CPNavigationAlert)navigationAlert
{
  return self->_navigationAlert;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (CPSButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (CPSAbridgableNewlineLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (CPSAbridgableNewlineLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (CPSNavigationAlertFocusButton)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
}

- (CPSNavigationAlertFocusButton)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
}

- (CPSNavigationAlertProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (CPUIFocusRingView)focusRingView
{
  return self->_focusRingView;
}

- (void)setFocusRingView:(id)a3
{
}

- (NSArray)ringConstraints
{
  return self->_ringConstraints;
}

- (void)setRingConstraints:(id)a3
{
}

- (BOOL)hasStartedAnimating
{
  return self->_hasStartedAnimating;
}

- (void)setHasStartedAnimating:(BOOL)a3
{
  self->_hasStartedAnimating = a3;
}

- (void).cxx_destruct
{
}

@end