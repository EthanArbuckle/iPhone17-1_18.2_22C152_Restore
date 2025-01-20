@interface HUWelcomeUIBannerView
- (HUWelcomeUIBannerView)initWithFrame:(CGRect)a3;
- (NSArray)layoutConstraints;
- (UIImageView)backgroundImageView;
- (UIView)welcomeFooterView;
- (void)_subclass_updateConstraints;
- (void)layoutOptionsDidChange;
- (void)setBackgroundImageView:(id)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setWelcomeFooterView:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUWelcomeUIBannerView

- (HUWelcomeUIBannerView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)HUWelcomeUIBannerView;
  v3 = -[HUBannerView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    if (([MEMORY[0x1E4F69758] isAMac] & 1) != 0
      || [MEMORY[0x1E4F69758] isAnIPad])
    {
      v5 = HUImageNamed(@"WelcomeBanner-Background-large");
      int v6 = 0;
      int v7 = 1;
    }
    else
    {
      v5 = HUImageNamed(@"WelcomeBanner-Background");
      int v7 = 0;
      int v6 = 1;
    }
    uint64_t v8 = [v4 initWithImage:v5];
    backgroundImageView = v3->_backgroundImageView;
    v3->_backgroundImageView = (UIImageView *)v8;

    if (v6) {
    if (v7)
    }

    [(UIImageView *)v3->_backgroundImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_backgroundImageView setContentMode:2];
    [(UIImageView *)v3->_backgroundImageView setClipsToBounds:1];
    [(HUWelcomeUIBannerView *)v3 addSubview:v3->_backgroundImageView];
    [(HUWelcomeUIBannerView *)v3 sendSubviewToBack:v3->_backgroundImageView];
    v10 = [(HUBannerView *)v3 footerView];
    [(HUWelcomeUIBannerView *)v3 willRemoveSubview:v10];

    v11 = [MEMORY[0x1E4F427D8] effectWithStyle:9];
    v12 = [MEMORY[0x1E4F42FE8] effectForBlurEffect:v11 style:4];
    v13 = [HULayeredVisualEffectView alloc];
    v14 = +[HULayeredContentEffect contentWithVibrancyEffect:v12];
    v15 = +[HULayeredBackgroundEffect backgroundWithBlurEffect:v11];
    uint64_t v16 = [(HULayeredVisualEffectView *)v13 initWithContentEffect:v14 backgroundEffect:v15];
    welcomeFooterView = v3->_welcomeFooterView;
    v3->_welcomeFooterView = (UIView *)v16;

    v18 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIView *)v3->_welcomeFooterView setBackgroundColor:v18];

    [(UIView *)v3->_welcomeFooterView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_welcomeFooterView setClipsToBounds:1];
    [(HUWelcomeUIBannerView *)v3 addSubview:v3->_welcomeFooterView];
    [(HUWelcomeUIBannerView *)v3 sendSubviewToBack:v3->_welcomeFooterView];
    v19 = [MEMORY[0x1E4F428B8] clearColor];
    [(HUWelcomeUIBannerView *)v3 setBackgroundColor:v19];
  }
  return v3;
}

- (void)layoutOptionsDidChange
{
  objc_opt_class();
  v3 = [(HUBannerView *)self layoutOptions];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    int v6 = [(HUBannerView *)self titleLabel];
    int v7 = [v5 titleLabelColor];
    [v6 setTextColor:v7];

    uint64_t v8 = [(HUBannerView *)self descriptionLabel];
    v9 = [v5 descriptionLabelColor];
    [v8 setTextColor:v9];

    v10 = [(HUBannerView *)self footerViewLabel];
    v11 = [v5 footerLabelColor];
    [v10 setTextColor:v11];

    v12 = [(HUBannerView *)self continueButton];
    v13 = [v5 continueButtonColor];
    [v12 setTitleColor:v13 forState:0];
  }
  v14 = [(HUWelcomeUIBannerView *)self layoutConstraints];

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v16 = [(HUWelcomeUIBannerView *)self layoutConstraints];
    [v15 deactivateConstraints:v16];
  }
  [(HUWelcomeUIBannerView *)self setLayoutConstraints:0];
  v17.receiver = self;
  v17.super_class = (Class)HUWelcomeUIBannerView;
  [(HUBannerView *)&v17 layoutOptionsDidChange];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  v22.receiver = self;
  v22.super_class = (Class)HUWelcomeUIBannerView;
  [(HUBannerView *)&v22 updateUIWithAnimation:a3];
  objc_opt_class();
  id v4 = [(HUBannerView *)self layoutOptions];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  [v6 cellCornerRadius];
  double v8 = v7;
  v9 = [(HUWelcomeUIBannerView *)self backgroundImageView];
  v10 = [v9 layer];
  [v10 setCornerRadius:v8];

  v11 = [(HUWelcomeUIBannerView *)self backgroundImageView];
  v12 = [v11 layer];
  [v12 setMaskedCorners:3];

  [v6 cellCornerRadius];
  double v14 = v13;

  v15 = [(HUWelcomeUIBannerView *)self welcomeFooterView];
  uint64_t v16 = [v15 layer];
  [v16 setCornerRadius:v14];

  objc_super v17 = [(HUWelcomeUIBannerView *)self welcomeFooterView];
  v18 = [v17 layer];
  [v18 setMaskedCorners:12];

  v19 = [(HUBannerView *)self lineView];
  [v19 setHidden:1];

  v20 = [(HUBannerView *)self continueButton];
  [v20 setHidden:0];

  objc_super v21 = [(HUBannerView *)self dismissButton];
  [v21 setHidden:0];

  [(HUWelcomeUIBannerView *)self setNeedsUpdateConstraints];
}

- (void)_subclass_updateConstraints
{
  v3 = [(HUWelcomeUIBannerView *)self layoutConstraints];

  if (!v3)
  {
    id v183 = [MEMORY[0x1E4F1CA48] array];
    objc_opt_class();
    id v4 = [(HUBannerView *)self layoutOptions];
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;

    double v7 = [(HUBannerView *)self dismissButton];
    double v8 = [v7 topAnchor];
    v9 = [(HUWelcomeUIBannerView *)self topAnchor];
    if (v6)
    {
      [v6 dismissButtonTopInset];
      v10 = objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9);
      [v183 addObject:v10];

      v11 = [(HUBannerView *)self dismissButton];
      v12 = [v11 trailingAnchor];
      double v13 = [(HUWelcomeUIBannerView *)self trailingAnchor];
      [v6 dismissButtonTrailingInset];
      v15 = [v12 constraintEqualToAnchor:v13 constant:-v14];
      [v183 addObject:v15];

      uint64_t v16 = [(HUBannerView *)self dismissButton];
      objc_super v17 = [v16 heightAnchor];
      [v6 dismissButtonHeightAndWidth];
      v18 = objc_msgSend(v17, "constraintEqualToConstant:");
      [v183 addObject:v18];

      v19 = [(HUBannerView *)self dismissButton];
      v20 = [v19 widthAnchor];
      [v6 dismissButtonHeightAndWidth];
      objc_super v22 = v20;
    }
    else
    {
      v23 = [v8 constraintEqualToAnchor:v9];
      [v183 addObject:v23];

      v24 = [(HUBannerView *)self dismissButton];
      v25 = [v24 trailingAnchor];
      v26 = [(HUWelcomeUIBannerView *)self trailingAnchor];
      v27 = [v25 constraintEqualToAnchor:v26];
      [v183 addObject:v27];

      v28 = [(HUBannerView *)self dismissButton];
      v29 = [v28 heightAnchor];
      v30 = [v29 constraintEqualToConstant:0.0];
      [v183 addObject:v30];

      v19 = [(HUBannerView *)self dismissButton];
      objc_super v22 = [v19 widthAnchor];
      v20 = v22;
      double v21 = 0.0;
    }
    v31 = [v22 constraintEqualToConstant:v21];
    [v183 addObject:v31];

    v32 = [(HUBannerView *)self iconImageView];
    v33 = [v32 leadingAnchor];
    v34 = [(HUWelcomeUIBannerView *)self leadingAnchor];
    [v6 leadingInset];
    v35 = objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34);
    [v183 addObject:v35];

    v36 = [(HUWelcomeUIBannerView *)self traitCollection];
    v37 = [v36 preferredContentSizeCategory];
    unint64_t v38 = *MEMORY[0x1E4F43770];

    v39 = [(HUBannerView *)self iconImageView];
    v40 = [v39 topAnchor];
    if ((unint64_t)v37 >= v38)
    {
      v41 = [(HUWelcomeUIBannerView *)self topAnchor];
      [v6 titleTopInset];
      v42 = objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41);
      [v183 addObject:v42];
    }
    else
    {
      v41 = [(HUBannerView *)self titleLabel];
      v42 = [v41 firstBaselineAnchor];
      v43 = [v6 font];
      [v43 lineHeight];
      double v45 = v44;
      [v6 font];
      v46 = unint64_t v182 = v38;
      [v46 ascender];
      double v48 = v45 - v47;
      v49 = [v6 font];
      [v49 descender];
      v51 = [v40 constraintEqualToAnchor:v42 constant:-(v48 - v50)];
      [v183 addObject:v51];

      unint64_t v38 = v182;
    }

    v52 = [(HUBannerView *)self iconImageView];
    v53 = [v52 heightAnchor];
    v54 = [(HUBannerView *)self iconImageView];
    v55 = [v54 image];
    if (v55) {
      [v6 iconHeight];
    }
    else {
      double v56 = 0.0;
    }
    v57 = [v53 constraintEqualToConstant:v56];
    [v183 addObject:v57];

    v58 = [(HUBannerView *)self iconImageView];
    v59 = [v58 widthAnchor];
    v60 = [(HUBannerView *)self iconImageView];
    v61 = [v60 heightAnchor];
    v62 = [v59 constraintEqualToAnchor:v61];
    [v183 addObject:v62];

    v63 = [(HUWelcomeUIBannerView *)self traitCollection];
    v64 = [v63 preferredContentSizeCategory];

    v65 = [(HUBannerView *)self titleLabel];
    v66 = [v65 topAnchor];
    if ((unint64_t)v64 >= v38)
    {
      v67 = [(HUBannerView *)self iconImageView];
      v68 = [v67 bottomAnchor];
      [v6 verticalSpacingForLipElements];
      v69 = objc_msgSend(v66, "constraintEqualToAnchor:constant:", v68);
      [v183 addObject:v69];
    }
    else
    {
      v67 = [(HUWelcomeUIBannerView *)self topAnchor];
      [v6 titleTopInset];
      v68 = objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67);
      [v183 addObject:v68];
    }

    v70 = [(HUBannerView *)self titleLabel];
    v71 = [v70 leadingAnchor];
    v72 = [(HUWelcomeUIBannerView *)self leadingAnchor];
    [v6 leadingInset];
    v73 = objc_msgSend(v71, "constraintEqualToAnchor:constant:", v72);
    [v183 addObject:v73];

    v74 = [(HUBannerView *)self titleLabel];
    v75 = [v74 trailingAnchor];
    v76 = [(HUBannerView *)self dismissButton];
    v77 = [v76 leadingAnchor];
    v78 = [v75 constraintEqualToAnchor:v77];
    [v183 addObject:v78];

    v79 = [(HUBannerView *)self descriptionLabel];
    v80 = [v79 topAnchor];
    v81 = [(HUBannerView *)self titleLabel];
    v82 = [v81 bottomAnchor];
    [v6 verticalLabelSpacing];
    v83 = objc_msgSend(v80, "constraintEqualToAnchor:constant:", v82);
    [v183 addObject:v83];

    v84 = [(HUBannerView *)self descriptionLabel];
    v85 = [v84 leadingAnchor];
    v86 = [(HUWelcomeUIBannerView *)self leadingAnchor];
    [v6 leadingInset];
    v87 = objc_msgSend(v85, "constraintEqualToAnchor:constant:", v86);
    [v183 addObject:v87];

    v88 = [(HUBannerView *)self descriptionLabel];
    v89 = [v88 trailingAnchor];
    v90 = [(HUWelcomeUIBannerView *)self trailingAnchor];
    [v6 trailingInset];
    v92 = [v89 constraintEqualToAnchor:v90 constant:-v91];
    [v183 addObject:v92];

    v93 = [(HUBannerView *)self lineView];
    v94 = [v93 topAnchor];
    v95 = [(HUBannerView *)self descriptionLabel];
    v96 = [v95 bottomAnchor];
    [v6 verticalSpacingForLineView];
    v97 = objc_msgSend(v94, "constraintEqualToAnchor:constant:", v96);
    [v183 addObject:v97];

    v98 = [(HUBannerView *)self lineView];
    v99 = [v98 leadingAnchor];
    v100 = [(HUWelcomeUIBannerView *)self leadingAnchor];
    [v6 leadingInset];
    v101 = objc_msgSend(v99, "constraintEqualToAnchor:constant:", v100);
    [v183 addObject:v101];

    v102 = [(HUBannerView *)self lineView];
    v103 = [v102 trailingAnchor];
    v104 = [(HUWelcomeUIBannerView *)self trailingAnchor];
    v105 = [v103 constraintEqualToAnchor:v104];
    [v183 addObject:v105];

    v106 = [(HUBannerView *)self lineView];
    v107 = [v106 heightAnchor];
    v108 = [v107 constraintEqualToConstant:1.0];
    [v183 addObject:v108];

    v109 = [(HUWelcomeUIBannerView *)self welcomeFooterView];
    v110 = [v109 bottomAnchor];
    v111 = [(HUWelcomeUIBannerView *)self bottomAnchor];
    v112 = [v110 constraintEqualToAnchor:v111];
    [v183 addObject:v112];

    v113 = [(HUWelcomeUIBannerView *)self welcomeFooterView];
    v114 = [v113 leadingAnchor];
    v115 = [(HUWelcomeUIBannerView *)self leadingAnchor];
    v116 = [v114 constraintEqualToAnchor:v115];
    [v183 addObject:v116];

    v117 = [(HUWelcomeUIBannerView *)self welcomeFooterView];
    v118 = [v117 trailingAnchor];
    v119 = [(HUWelcomeUIBannerView *)self trailingAnchor];
    v120 = [v118 constraintEqualToAnchor:v119];
    [v183 addObject:v120];

    v121 = [(HUWelcomeUIBannerView *)self welcomeFooterView];
    v122 = [v121 heightAnchor];
    v123 = [v6 footerViewLabelFont];
    [v123 lineHeight];
    double v125 = v124;
    [v6 verticalSpacingForLipElements];
    v127 = [v122 constraintEqualToConstant:v125 + v126 * 2.0];
    [v183 addObject:v127];

    v128 = [(HUBannerView *)self footerViewLabel];
    v129 = [v128 topAnchor];
    v130 = [(HUWelcomeUIBannerView *)self welcomeFooterView];
    v131 = [v130 topAnchor];
    [v6 verticalSpacingForLipElements];
    v132 = objc_msgSend(v129, "constraintEqualToAnchor:constant:", v131);
    [v183 addObject:v132];

    v133 = [(HUBannerView *)self footerViewLabel];
    v134 = [v133 leadingAnchor];
    v135 = [(HUWelcomeUIBannerView *)self welcomeFooterView];
    v136 = [v135 leadingAnchor];
    [v6 leadingInset];
    v137 = objc_msgSend(v134, "constraintEqualToAnchor:constant:", v136);
    [v183 addObject:v137];

    v138 = [(HUBannerView *)self footerViewLabel];
    v139 = [v138 trailingAnchor];
    v140 = [(HUBannerView *)self continueButton];
    v141 = [v140 leadingAnchor];
    [v6 trailingInset];
    v143 = [v139 constraintLessThanOrEqualToAnchor:v141 constant:-v142];
    [v183 addObject:v143];

    v144 = [(HUBannerView *)self footerViewLabel];
    v145 = [v144 bottomAnchor];
    v146 = [(HUWelcomeUIBannerView *)self welcomeFooterView];
    v147 = [v146 bottomAnchor];
    [v6 verticalSpacingForLipElements];
    v149 = [v145 constraintEqualToAnchor:v147 constant:-v148];
    [v183 addObject:v149];

    v150 = [(HUBannerView *)self continueButton];
    v151 = [v150 topAnchor];
    v152 = [(HUWelcomeUIBannerView *)self welcomeFooterView];
    v153 = [v152 topAnchor];
    [v6 verticalSpacingForLipElements];
    v154 = objc_msgSend(v151, "constraintEqualToAnchor:constant:", v153);
    [v183 addObject:v154];

    v155 = [(HUBannerView *)self continueButton];
    v156 = [v155 centerXAnchor];
    v157 = [(HUBannerView *)self dismissButton];
    v158 = [v157 centerXAnchor];
    v159 = [v156 constraintEqualToAnchor:v158];
    [v183 addObject:v159];

    v160 = [(HUBannerView *)self continueButton];
    v161 = [v160 centerYAnchor];
    v162 = [(HUWelcomeUIBannerView *)self welcomeFooterView];
    v163 = [v162 centerYAnchor];
    v164 = [v161 constraintEqualToAnchor:v163];
    [v183 addObject:v164];

    v165 = [(HUWelcomeUIBannerView *)self backgroundImageView];
    v166 = [v165 topAnchor];
    v167 = [(HUWelcomeUIBannerView *)self topAnchor];
    v168 = [v166 constraintEqualToAnchor:v167];
    [v183 addObject:v168];

    v169 = [(HUWelcomeUIBannerView *)self backgroundImageView];
    v170 = [v169 trailingAnchor];
    v171 = [(HUWelcomeUIBannerView *)self trailingAnchor];
    v172 = [v170 constraintEqualToAnchor:v171];
    [v183 addObject:v172];

    v173 = [(HUWelcomeUIBannerView *)self backgroundImageView];
    v174 = [v173 leadingAnchor];
    v175 = [(HUWelcomeUIBannerView *)self leadingAnchor];
    v176 = [v174 constraintEqualToAnchor:v175];
    [v183 addObject:v176];

    v177 = [(HUWelcomeUIBannerView *)self backgroundImageView];
    v178 = [v177 bottomAnchor];
    v179 = [(HUWelcomeUIBannerView *)self welcomeFooterView];
    v180 = [v179 topAnchor];
    v181 = [v178 constraintEqualToAnchor:v180];
    [v183 addObject:v181];

    [MEMORY[0x1E4F28DC8] activateConstraints:v183];
    [(HUWelcomeUIBannerView *)self setLayoutConstraints:v183];
  }
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
}

- (UIView)welcomeFooterView
{
  return self->_welcomeFooterView;
}

- (void)setWelcomeFooterView:(id)a3
{
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_welcomeFooterView, 0);

  objc_storeStrong((id *)&self->_backgroundImageView, 0);
}

@end