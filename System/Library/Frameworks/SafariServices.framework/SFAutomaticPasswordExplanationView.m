@interface SFAutomaticPasswordExplanationView
- (BOOL)_scrollViewNeedsShadow:(BOOL)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (SFAutomaticPasswordExplanationView)initWithKeyboardType:(int64_t)a3;
- (UIButton)useOtherPasswordButton;
- (UIButton)useStrongPasswordButton;
- (UILabel)explanationLabel;
- (UILabel)passwordRetrievalExpalantionLabel;
- (int64_t)keyboardAppearance;
- (void)_createLayoutConstraints;
- (void)_createSubviews;
- (void)_scrollViewDidLayoutSubviews:(id)a3;
- (void)_updateContentLayoutGuideBottomConstraint;
- (void)_updateMaximumPadding;
- (void)_updateShadowViewAlpha;
- (void)_updateStrongPasswordHeightConstraint;
- (void)_updateUseCustomPasswordBaselineToBottomConstraint;
- (void)_updateWideAppearanceRequirement;
- (void)automaticPasswordScrollContentViewDidLayout:(id)a3;
- (void)layoutSubviews;
- (void)safeAreaInsetsDidChange;
- (void)setKeyboardAppearance:(int64_t)a3;
- (void)updateConstraints;
@end

@implementation SFAutomaticPasswordExplanationView

- (SFAutomaticPasswordExplanationView)initWithKeyboardType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFAutomaticPasswordExplanationView;
  v4 = -[SFAutomaticPasswordExplanationView initWithFrame:](&v8, sel_initWithFrame_, 0.0, 0.0, 100.0, 100.0);
  if (v4)
  {
    v4->_isPad = _SFDeviceIsPad();
    v4->_keyboardType = a3;
    v5 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [(SFAutomaticPasswordExplanationView *)v4 setTintColor:v5];

    [(SFAutomaticPasswordExplanationView *)v4 _createSubviews];
    [(SFAutomaticPasswordExplanationView *)v4 _createLayoutConstraints];
    v6 = v4;
  }

  return v4;
}

- (void)_createSubviews
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1BE0]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  objc_super v8 = (UIScrollView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  scrollView = self->_scrollView;
  self->_scrollView = v8;

  [(UIScrollView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIScrollView *)self->_scrollView setDelegate:self];
  [(UIScrollView *)self->_scrollView _setLayoutObserver:self];
  [(SFAutomaticPasswordExplanationView *)self addSubview:self->_scrollView];
  v10 = -[SFAutomaticPasswordScrollViewContentView initWithFrame:]([SFAutomaticPasswordScrollViewContentView alloc], "initWithFrame:", v4, v5, v6, v7);
  scrollableContentView = self->_scrollableContentView;
  self->_scrollableContentView = v10;

  [(SFAutomaticPasswordScrollViewContentView *)self->_scrollableContentView setLayoutObserver:self];
  [(UIScrollView *)self->_scrollView addSubview:self->_scrollableContentView];
  [(SFAutomaticPasswordScrollViewContentView *)self->_scrollableContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v12) = 1144750080;
  [(SFAutomaticPasswordScrollViewContentView *)self->_scrollableContentView setContentHuggingPriority:1 forAxis:v12];
  v13 = objc_msgSend(MEMORY[0x1E4FB1818], "sf_imageNamed:", @"ASPContentScrollShadow");
  objc_msgSend(v13, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, 16.0, 0.0, 16.0);
  id v34 = (id)objc_claimAutoreleasedReturnValue();

  v14 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v34];
  shadowImageView = self->_shadowImageView;
  self->_shadowImageView = v14;

  [(UIImageView *)self->_shadowImageView setContentMode:0];
  [(UIImageView *)self->_shadowImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SFAutomaticPasswordExplanationView *)self addSubview:self->_shadowImageView];
  [(UIImageView *)self->_shadowImageView setHidden:1];
  v16 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
  explanationLabel = self->_explanationLabel;
  self->_explanationLabel = v16;

  [(UILabel *)self->_explanationLabel setTextAlignment:1];
  [(UILabel *)self->_explanationLabel setNumberOfLines:0];
  v18 = _SFAutoFillInputViewLabelFont();
  [(UILabel *)self->_explanationLabel setFont:v18];

  [(SFAutomaticPasswordScrollViewContentView *)self->_scrollableContentView addSubview:self->_explanationLabel];
  [(UILabel *)self->_explanationLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v19 = [MEMORY[0x1E4F98AA8] currentDevice];
  [v19 deviceClass];

  v20 = _WBSLocalizedString();
  [(UILabel *)self->_explanationLabel setText:v20];

  v21 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
  passwordRetrievalExpalantionLabel = self->_passwordRetrievalExpalantionLabel;
  self->_passwordRetrievalExpalantionLabel = v21;

  [(UILabel *)self->_passwordRetrievalExpalantionLabel setTextAlignment:1];
  [(UILabel *)self->_passwordRetrievalExpalantionLabel setNumberOfLines:0];
  if (self->_isPad) {
    v23 = (void *)MEMORY[0x1E4FB28F0];
  }
  else {
    v23 = (void *)MEMORY[0x1E4FB28E0];
  }
  v24 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*v23];
  [(UILabel *)self->_passwordRetrievalExpalantionLabel setFont:v24];

  v25 = _WBSLocalizedString();
  [(UILabel *)self->_passwordRetrievalExpalantionLabel setText:v25];

  [(SFAutomaticPasswordScrollViewContentView *)self->_scrollableContentView addSubview:self->_passwordRetrievalExpalantionLabel];
  [(UILabel *)self->_passwordRetrievalExpalantionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v26 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  useStrongPasswordButton = self->_useStrongPasswordButton;
  self->_useStrongPasswordButton = v26;

  v28 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
  [v28 setButtonSize:3];
  v29 = _WBSLocalizedString();
  [v28 setTitle:v29];

  [(UIButton *)self->_useStrongPasswordButton setConfiguration:v28];
  [(UIButton *)self->_useStrongPasswordButton setAccessibilityIdentifier:@"UseStrongPasswordButton"];
  [(SFAutomaticPasswordExplanationView *)self addSubview:self->_useStrongPasswordButton];
  [(UIButton *)self->_useStrongPasswordButton sizeToFit];
  [(UIButton *)self->_useStrongPasswordButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v30 = _WBSLocalizedString();
  v31 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  useOtherPasswordButton = self->_useOtherPasswordButton;
  self->_useOtherPasswordButton = v31;

  v33 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  [v33 setButtonSize:3];
  [v33 setTitle:v30];
  [(UIButton *)self->_useOtherPasswordButton setConfiguration:v33];
  [(SFAutomaticPasswordExplanationView *)self addSubview:self->_useOtherPasswordButton];
  [(UIButton *)self->_useOtherPasswordButton sizeToFit];
  [(UIButton *)self->_useOtherPasswordButton setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)_createLayoutConstraints
{
  v205[3] = *MEMORY[0x1E4F143B8];
  id v3 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
  contentLayoutGuide = self->_contentLayoutGuide;
  self->_contentLayoutGuide = v3;

  [(SFAutomaticPasswordExplanationView *)self addLayoutGuide:self->_contentLayoutGuide];
  double v5 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
  double v6 = [(SFAutomaticPasswordExplanationView *)self bottomAnchor];
  double v7 = [v5 constraintEqualToAnchor:v6];
  contentLayoutGuideBottomConstraint = self->_contentLayoutGuideBottomConstraint;
  self->_contentLayoutGuideBottomConstraint = v7;

  v9 = (void *)MEMORY[0x1E4F28DC8];
  v10 = [(UILayoutGuide *)self->_contentLayoutGuide centerXAnchor];
  v11 = [(SFAutomaticPasswordExplanationView *)self centerXAnchor];
  double v12 = [v10 constraintEqualToAnchor:v11];
  v205[0] = v12;
  v13 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
  v14 = [(SFAutomaticPasswordExplanationView *)self topAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v16 = self->_contentLayoutGuideBottomConstraint;
  v205[1] = v15;
  v205[2] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v205 count:3];
  [v9 activateConstraints:v17];

  v18 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
  v19 = [(SFAutomaticPasswordExplanationView *)self leadingAnchor];
  v20 = [v18 constraintLessThanOrEqualToAnchor:v19];
  wideContentLeadingConstraint = self->_wideContentLeadingConstraint;
  self->_wideContentLeadingConstraint = v20;

  v22 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
  v23 = [(SFAutomaticPasswordExplanationView *)self trailingAnchor];
  v24 = [v22 constraintGreaterThanOrEqualToAnchor:v23];
  wideContentTrailingConstraint = self->_wideContentTrailingConstraint;
  self->_wideContentTrailingConstraint = v24;

  v26 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
  v27 = [(SFAutomaticPasswordExplanationView *)self leadingAnchor];
  v28 = [v26 constraintEqualToAnchor:v27 constant:16.0];
  narrowContentLeadingConstraint = self->_narrowContentLeadingConstraint;
  self->_narrowContentLeadingConstraint = v28;

  v30 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
  v31 = [(SFAutomaticPasswordExplanationView *)self trailingAnchor];
  v32 = [v30 constraintEqualToAnchor:v31 constant:-16.0];
  narrowContentTrailingConstraint = self->_narrowContentTrailingConstraint;
  self->_narrowContentTrailingConstraint = v32;

  id v34 = [(UILayoutGuide *)self->_contentLayoutGuide widthAnchor];
  v35 = [v34 constraintEqualToConstant:420.0];
  iPadWidthConstraint = self->_iPadWidthConstraint;
  self->_iPadWidthConstraint = v35;

  v37 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
  scrollableContentCenterLayoutGuide = self->_scrollableContentCenterLayoutGuide;
  self->_scrollableContentCenterLayoutGuide = v37;

  [(SFAutomaticPasswordExplanationView *)self addLayoutGuide:self->_scrollableContentCenterLayoutGuide];
  v39 = [(UIButton *)self->_useOtherPasswordButton widthAnchor];
  v40 = [v39 constraintLessThanOrEqualToConstant:343.0];
  useCustomPasswordButtonWidthConstraint = self->_useCustomPasswordButtonWidthConstraint;
  self->_useCustomPasswordButtonWidthConstraint = v40;

  v42 = [(UIButton *)self->_useOtherPasswordButton lastBaselineAnchor];
  v43 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  useCustomPasswordBaselineToBottomConstraint = self->_useCustomPasswordBaselineToBottomConstraint;
  self->_useCustomPasswordBaselineToBottomConstraint = v44;

  v46 = [(UIButton *)self->_useOtherPasswordButton leadingAnchor];
  v47 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
  v48 = [v46 constraintEqualToAnchor:v47];

  LODWORD(v49) = 1144750080;
  [v48 setPriority:v49];
  v50 = [(UIButton *)self->_useOtherPasswordButton trailingAnchor];
  v51 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
  v52 = [v50 constraintEqualToAnchor:v51];

  LODWORD(v53) = 1144750080;
  [v52 setPriority:v53];
  v54 = (void *)MEMORY[0x1E4F28DC8];
  v191 = v52;
  v192 = v48;
  v204[0] = v48;
  v204[1] = v52;
  v55 = [(UIButton *)self->_useOtherPasswordButton centerXAnchor];
  v56 = [(UILayoutGuide *)self->_contentLayoutGuide centerXAnchor];
  v57 = [v55 constraintEqualToAnchor:v56];
  v58 = self->_useCustomPasswordBaselineToBottomConstraint;
  v204[2] = v57;
  v204[3] = v58;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v204 count:4];
  [v54 activateConstraints:v59];

  v60 = [(UIButton *)self->_useStrongPasswordButton widthAnchor];
  v61 = [v60 constraintLessThanOrEqualToConstant:343.0];
  strongPasswordButtonWidthConstraint = self->_strongPasswordButtonWidthConstraint;
  self->_strongPasswordButtonWidthConstraint = v61;

  v63 = [(UIButton *)self->_useStrongPasswordButton heightAnchor];
  v64 = [v63 constraintEqualToConstant:0.0];
  strongPasswordButtonHeightConstraint = self->_strongPasswordButtonHeightConstraint;
  self->_strongPasswordButtonHeightConstraint = v64;

  [(SFAutomaticPasswordExplanationView *)self _updateStrongPasswordHeightConstraint];
  v66 = [(UIButton *)self->_useStrongPasswordButton leadingAnchor];
  v67 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
  v68 = [v66 constraintEqualToAnchor:v67];

  LODWORD(v69) = 1144750080;
  [v68 setPriority:v69];
  v70 = [(UIButton *)self->_useStrongPasswordButton trailingAnchor];
  v71 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
  v72 = [v70 constraintEqualToAnchor:v71];

  LODWORD(v73) = 1144750080;
  [v72 setPriority:v73];
  v187 = (void *)MEMORY[0x1E4F28DC8];
  v189 = v72;
  v190 = v68;
  v203[0] = v68;
  v203[1] = v72;
  v193 = [(UIButton *)self->_useStrongPasswordButton centerXAnchor];
  v74 = [(UILayoutGuide *)self->_contentLayoutGuide centerXAnchor];
  v75 = [v193 constraintEqualToAnchor:v74];
  v203[2] = v75;
  v76 = [(UIButton *)self->_useStrongPasswordButton bottomAnchor];
  v77 = [(UIButton *)self->_useOtherPasswordButton lastBaselineAnchor];
  v78 = [v76 constraintEqualToAnchor:v77 constant:-36.0];
  v79 = self->_strongPasswordButtonHeightConstraint;
  v203[3] = v78;
  v203[4] = v79;
  v80 = [(UIButton *)self->_useOtherPasswordButton topAnchor];
  v81 = [(UIButton *)self->_useStrongPasswordButton bottomAnchor];
  v82 = [v80 constraintEqualToSystemSpacingBelowAnchor:v81 multiplier:1.0];
  v203[5] = v82;
  v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v203 count:6];
  [v187 activateConstraints:v83];

  v84 = [(UIScrollView *)self->_scrollView heightAnchor];
  v85 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  v86 = [v85 heightAnchor];
  v87 = [v84 constraintEqualToAnchor:v86];

  LODWORD(v88) = 1132068864;
  [v87 setPriority:v88];
  v155 = (void *)MEMORY[0x1E4F28DC8];
  v188 = v87;
  v202[0] = v87;
  v178 = [(UIScrollView *)self->_scrollView topAnchor];
  v168 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
  v165 = [v178 constraintEqualToAnchor:v168];
  v202[1] = v165;
  v162 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v159 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
  v157 = [v162 constraintEqualToAnchor:v159];
  v202[2] = v157;
  v154 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v173 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
  v153 = [v154 constraintEqualToAnchor:v173];
  v202[3] = v153;
  v89 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v90 = [(UIButton *)self->_useStrongPasswordButton topAnchor];
  v91 = [v89 constraintEqualToAnchor:v90 constant:-9.0];
  v202[4] = v91;
  v92 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  v93 = [v92 widthAnchor];
  v94 = [(UIScrollView *)self->_scrollView widthAnchor];
  v95 = [v93 constraintEqualToAnchor:v94];
  v202[5] = v95;
  v96 = [MEMORY[0x1E4F1C978] arrayWithObjects:v202 count:6];
  [v155 activateConstraints:v96];

  v163 = (void *)MEMORY[0x1E4F28DC8];
  v183 = [(SFAutomaticPasswordScrollViewContentView *)self->_scrollableContentView topAnchor];
  v179 = [(UIScrollView *)self->_scrollView topAnchor];
  v174 = [v183 constraintEqualToAnchor:v179];
  v201[0] = v174;
  v169 = [(SFAutomaticPasswordScrollViewContentView *)self->_scrollableContentView leadingAnchor];
  v166 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v160 = [v169 constraintEqualToAnchor:v166];
  v201[1] = v160;
  v97 = [(SFAutomaticPasswordScrollViewContentView *)self->_scrollableContentView trailingAnchor];
  v98 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v99 = [v97 constraintEqualToAnchor:v98];
  v201[2] = v99;
  v100 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  v101 = [v100 heightAnchor];
  v102 = [(SFAutomaticPasswordScrollViewContentView *)self->_scrollableContentView heightAnchor];
  v103 = [v101 constraintEqualToAnchor:v102];
  v201[3] = v103;
  v104 = [MEMORY[0x1E4F1C978] arrayWithObjects:v201 count:4];
  [v163 activateConstraints:v104];

  v161 = (void *)MEMORY[0x1E4F28DC8];
  v184 = [(UILayoutGuide *)self->_scrollableContentCenterLayoutGuide topAnchor];
  v180 = [(SFAutomaticPasswordScrollViewContentView *)self->_scrollableContentView topAnchor];
  v175 = [v184 constraintGreaterThanOrEqualToAnchor:v180 constant:10.0];
  v200[0] = v175;
  v170 = [(UILayoutGuide *)self->_scrollableContentCenterLayoutGuide centerYAnchor];
  v167 = [(SFAutomaticPasswordScrollViewContentView *)self->_scrollableContentView centerYAnchor];
  v164 = [v170 constraintEqualToAnchor:v167];
  v200[1] = v164;
  v158 = [(UILayoutGuide *)self->_scrollableContentCenterLayoutGuide leadingAnchor];
  v156 = [(SFAutomaticPasswordScrollViewContentView *)self->_scrollableContentView leadingAnchor];
  v105 = [v158 constraintEqualToAnchor:v156];
  v200[2] = v105;
  v106 = [(UILayoutGuide *)self->_scrollableContentCenterLayoutGuide trailingAnchor];
  v107 = [(SFAutomaticPasswordScrollViewContentView *)self->_scrollableContentView trailingAnchor];
  v108 = [v106 constraintEqualToAnchor:v107];
  v200[3] = v108;
  v109 = [(UILayoutGuide *)self->_scrollableContentCenterLayoutGuide bottomAnchor];
  v110 = [(SFAutomaticPasswordScrollViewContentView *)self->_scrollableContentView bottomAnchor];
  v111 = [v109 constraintLessThanOrEqualToAnchor:v110];
  v200[4] = v111;
  v112 = [MEMORY[0x1E4F1C978] arrayWithObjects:v200 count:5];
  [v161 activateConstraints:v112];

  v113 = [(UIImageView *)self->_shadowImageView leadingAnchor];
  v114 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v115 = [v113 constraintEqualToAnchor:v114];
  v199[0] = v115;
  v116 = [(UIImageView *)self->_shadowImageView trailingAnchor];
  v117 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v118 = [v116 constraintEqualToAnchor:v117];
  v199[1] = v118;
  v119 = [MEMORY[0x1E4F1C978] arrayWithObjects:v199 count:2];
  wideShadowImageViewConstraints = self->_wideShadowImageViewConstraints;
  self->_wideShadowImageViewConstraints = v119;

  v121 = [(UIImageView *)self->_shadowImageView leadingAnchor];
  v122 = [(SFAutomaticPasswordExplanationView *)self leadingAnchor];
  v123 = [v121 constraintEqualToAnchor:v122];
  v198[0] = v123;
  v124 = [(UIImageView *)self->_shadowImageView trailingAnchor];
  v125 = [(SFAutomaticPasswordExplanationView *)self trailingAnchor];
  v126 = [v124 constraintEqualToAnchor:v125];
  v198[1] = v126;
  v127 = [MEMORY[0x1E4F1C978] arrayWithObjects:v198 count:2];
  narrowShadowImageViewConstraints = self->_narrowShadowImageViewConstraints;
  self->_narrowShadowImageViewConstraints = v127;

  v129 = (void *)MEMORY[0x1E4F28DC8];
  v130 = [(UIImageView *)self->_shadowImageView bottomAnchor];
  v131 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v132 = [v130 constraintEqualToAnchor:v131];
  v197[0] = v132;
  v133 = [(UIImageView *)self->_shadowImageView heightAnchor];
  v134 = [v133 constraintEqualToConstant:1.0];
  v197[1] = v134;
  v135 = [MEMORY[0x1E4F1C978] arrayWithObjects:v197 count:2];
  [v129 activateConstraints:v135];

  if (self->_isPad) {
    [MEMORY[0x1E4F28DC8] activateConstraints:self->_wideShadowImageViewConstraints];
  }
  v171 = (void *)MEMORY[0x1E4F28DC8];
  v185 = [(UILabel *)self->_passwordRetrievalExpalantionLabel leadingAnchor];
  v181 = [(UILayoutGuide *)self->_scrollableContentCenterLayoutGuide leadingAnchor];
  v176 = [v185 constraintEqualToAnchor:v181];
  v196[0] = v176;
  v136 = [(UILabel *)self->_passwordRetrievalExpalantionLabel trailingAnchor];
  v137 = [(UILayoutGuide *)self->_scrollableContentCenterLayoutGuide trailingAnchor];
  v138 = [v136 constraintEqualToAnchor:v137];
  v196[1] = v138;
  v139 = [(UILabel *)self->_passwordRetrievalExpalantionLabel bottomAnchor];
  v140 = [(UILayoutGuide *)self->_scrollableContentCenterLayoutGuide bottomAnchor];
  v141 = [v139 constraintEqualToAnchor:v140];
  v196[2] = v141;
  v142 = [MEMORY[0x1E4F1C978] arrayWithObjects:v196 count:3];
  [v171 activateConstraints:v142];

  if (self->_isPad) {
    double v143 = 12.0;
  }
  else {
    double v143 = 8.0;
  }
  v172 = (void *)MEMORY[0x1E4F28DC8];
  v194 = [(UILabel *)self->_explanationLabel bottomAnchor];
  v186 = [(UILabel *)self->_passwordRetrievalExpalantionLabel topAnchor];
  v182 = [v194 constraintEqualToAnchor:v186 constant:-v143];
  v195[0] = v182;
  v177 = [(UILabel *)self->_explanationLabel leadingAnchor];
  v144 = [(UILayoutGuide *)self->_scrollableContentCenterLayoutGuide leadingAnchor];
  v145 = [v177 constraintEqualToAnchor:v144];
  v195[1] = v145;
  v146 = [(UILabel *)self->_explanationLabel trailingAnchor];
  v147 = [(UILayoutGuide *)self->_scrollableContentCenterLayoutGuide trailingAnchor];
  v148 = [v146 constraintEqualToAnchor:v147];
  v195[2] = v148;
  v149 = [(UILabel *)self->_explanationLabel topAnchor];
  v150 = [(UILayoutGuide *)self->_scrollableContentCenterLayoutGuide topAnchor];
  v151 = [v149 constraintGreaterThanOrEqualToAnchor:v150];
  v195[3] = v151;
  v152 = [MEMORY[0x1E4F1C978] arrayWithObjects:v195 count:4];
  [v172 activateConstraints:v152];
}

- (void)_updateWideAppearanceRequirement
{
  [(SFAutomaticPasswordExplanationView *)self bounds];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  double v7 = CGRectGetWidth(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGFloat v8 = CGRectGetHeight(v12);
  BOOL v9 = v7 > v8 + v8;
  if (self->_requiresWideAppearance != v9)
  {
    self->_requiresWideAppearance = v9;
    [(SFAutomaticPasswordExplanationView *)self setNeedsUpdateConstraints];
  }
}

- (void)_updateStrongPasswordHeightConstraint
{
  if (self->_requiresWideAppearance && !self->_isPad) {
    v2 = &_SFAutoFillInputViewDefaultButonHeightLandscapePhone;
  }
  else {
    v2 = &_SFAutoFillInputViewDefaultButonHeight;
  }
  [(NSLayoutConstraint *)self->_strongPasswordButtonHeightConstraint setConstant:*(double *)v2];
}

- (void)_updateUseCustomPasswordBaselineToBottomConstraint
{
  id v3 = [(SFAutomaticPasswordExplanationView *)self window];
  [v3 safeAreaInsets];
  double v5 = v4;

  useCustomPasswordBaselineToBottomConstraint = self->_useCustomPasswordBaselineToBottomConstraint;
  double v7 = -14.0;
  if (!self->_requiresWideAppearance) {
    double v7 = 0.0;
  }
  if (v5 <= 0.0) {
    double v7 = -4.0;
  }

  [(NSLayoutConstraint *)useCustomPasswordBaselineToBottomConstraint setConstant:v7];
}

- (void)_updateMaximumPadding
{
  id v23 = [(SFAutomaticPasswordExplanationView *)self window];
  [v23 bounds];
  CGFloat v22 = v3;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [(SFAutomaticPasswordExplanationView *)self bounds];
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  double v14 = CGRectGetWidth(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double v15 = fmax(v14, CGRectGetHeight(v26));
  v27.origin.CGFloat x = v22;
  v27.origin.CGFloat y = v5;
  v27.size.CGFloat width = v7;
  v27.size.CGFloat height = v9;
  double v16 = CGRectGetWidth(v27);
  v28.origin.CGFloat x = v22;
  v28.origin.CGFloat y = v5;
  v28.size.CGFloat width = v7;
  v28.size.CGFloat height = v9;
  double v17 = CGRectGetHeight(v28);
  if (v15 == 568.0)
  {
    double v18 = 80.0;
  }
  else if (fmax(v16, v17) <= v15)
  {
    double v18 = 140.0;
  }
  else
  {
    _SFRoundFloatToPixels();
    double v20 = 140.0 - v19;
    [v23 safeAreaInsets];
    double v18 = fmax(v20 + v21, 0.0);
  }
  if (self->_wideContentMaximumPadding != v18)
  {
    self->_wideContentMaximumPadding = v18;
    [(SFAutomaticPasswordExplanationView *)self setNeedsUpdateConstraints];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SFAutomaticPasswordExplanationView;
  [(SFAutomaticPasswordExplanationView *)&v3 layoutSubviews];
  [(SFAutomaticPasswordExplanationView *)self _updateWideAppearanceRequirement];
  [(SFAutomaticPasswordExplanationView *)self _updateMaximumPadding];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double v3 = *MEMORY[0x1E4FB2C70];
  double v4 = *(double *)(MEMORY[0x1E4FB2C70] + 8);
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SFAutomaticPasswordExplanationView;
  [(SFAutomaticPasswordExplanationView *)&v3 safeAreaInsetsDidChange];
  [(SFAutomaticPasswordExplanationView *)self _updateMaximumPadding];
  [(SFAutomaticPasswordExplanationView *)self _updateContentLayoutGuideBottomConstraint];
  [(SFAutomaticPasswordExplanationView *)self _updateUseCustomPasswordBaselineToBottomConstraint];
}

- (void)_updateContentLayoutGuideBottomConstraint
{
  if (self->_isPad)
  {
    contentLayoutGuideBottomConstraint = self->_contentLayoutGuideBottomConstraint;
    [(NSLayoutConstraint *)contentLayoutGuideBottomConstraint setConstant:-20.0];
  }
  else
  {
    id v6 = [(SFAutomaticPasswordExplanationView *)self window];
    [v6 safeAreaInsets];
    double v4 = -20.0;
    if (v5 > 0.0) {
      double v4 = 0.0;
    }
    [(NSLayoutConstraint *)self->_contentLayoutGuideBottomConstraint setConstant:v4];
  }
}

- (void)updateConstraints
{
  v33[2] = *MEMORY[0x1E4F143B8];
  [(SFAutomaticPasswordExplanationView *)self _updateContentLayoutGuideBottomConstraint];
  [(SFAutomaticPasswordExplanationView *)self _updateStrongPasswordHeightConstraint];
  [(SFAutomaticPasswordExplanationView *)self _updateUseCustomPasswordBaselineToBottomConstraint];
  objc_super v3 = (void *)MEMORY[0x1E4F28DC8];
  useCustomPasswordButtonWidthConstraint = self->_useCustomPasswordButtonWidthConstraint;
  v33[0] = self->_strongPasswordButtonWidthConstraint;
  v33[1] = useCustomPasswordButtonWidthConstraint;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  objc_msgSend(v3, "sf_setConstraints:active:", v5, self->_requiresWideAppearance);

  if (self->_isPad)
  {
    [(NSLayoutConstraint *)self->_iPadWidthConstraint setActive:self->_requiresWideAppearance];
    id v6 = (void *)MEMORY[0x1E4F28DC8];
    narrowContentTrailingConstraint = self->_narrowContentTrailingConstraint;
    v28[0] = self->_narrowContentLeadingConstraint;
    v28[1] = narrowContentTrailingConstraint;
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    objc_msgSend(v6, "sf_setConstraints:active:", v8, !self->_requiresWideAppearance);

    CGFloat v9 = (void *)MEMORY[0x1E4F28DC8];
    wideContentTrailingConstraint = self->_wideContentTrailingConstraint;
    v27[0] = self->_wideContentLeadingConstraint;
    v27[1] = wideContentTrailingConstraint;
    CGRect v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    [v9 deactivateConstraints:v11];
  }
  else
  {
    if (self->_requiresWideAppearance)
    {
      [(NSLayoutConstraint *)self->_wideContentLeadingConstraint setConstant:self->_wideContentMaximumPadding];
      [(NSLayoutConstraint *)self->_wideContentTrailingConstraint setConstant:-self->_wideContentMaximumPadding];
      CGRect v12 = (void *)MEMORY[0x1E4F28DC8];
      v13 = self->_wideContentTrailingConstraint;
      v32[0] = self->_wideContentLeadingConstraint;
      v32[1] = v13;
      double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
      [v12 activateConstraints:v14];

      double v15 = (void *)MEMORY[0x1E4F28DC8];
      double v16 = self->_narrowContentTrailingConstraint;
      v31[0] = self->_narrowContentLeadingConstraint;
      v31[1] = v16;
      double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
      [v15 deactivateConstraints:v17];

      [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_narrowShadowImageViewConstraints];
      double v18 = (void *)MEMORY[0x1E4F28DC8];
      uint64_t v19 = 480;
    }
    else
    {
      double v20 = (void *)MEMORY[0x1E4F28DC8];
      double v21 = self->_narrowContentTrailingConstraint;
      v30[0] = self->_narrowContentLeadingConstraint;
      v30[1] = v21;
      CGFloat v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
      [v20 activateConstraints:v22];

      id v23 = (void *)MEMORY[0x1E4F28DC8];
      v24 = self->_wideContentTrailingConstraint;
      v29[0] = self->_wideContentLeadingConstraint;
      v29[1] = v24;
      CGRect v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
      [v23 deactivateConstraints:v25];

      [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_wideShadowImageViewConstraints];
      double v18 = (void *)MEMORY[0x1E4F28DC8];
      uint64_t v19 = 488;
    }
    [v18 activateConstraints:*(Class *)((char *)&self->super.super.super.isa + v19)];
  }
  v26.receiver = self;
  v26.super_class = (Class)SFAutomaticPasswordExplanationView;
  [(SFAutomaticPasswordExplanationView *)&v26 updateConstraints];
}

- (BOOL)_scrollViewNeedsShadow:(BOOL)a3
{
  if (!a3) {
    return self->_scrollViewNeedsShadowCachedValue;
  }
  [(UILabel *)self->_passwordRetrievalExpalantionLabel frame];
  double MaxY = CGRectGetMaxY(v7);
  [(UIScrollView *)self->_scrollView frame];
  BOOL result = MaxY > v5;
  self->_scrollViewNeedsShadowCachedValue = MaxY > v5;
  return result;
}

- (void)_updateShadowViewAlpha
{
  BOOL v3 = [(SFAutomaticPasswordExplanationView *)self _scrollViewNeedsShadow:0];
  double v4 = 0.0;
  if (v3)
  {
    [(UIScrollView *)self->_scrollView frame];
    double v6 = v5;
    [(UIScrollView *)self->_scrollView contentSize];
    double v8 = v7;
    [(UIScrollView *)self->_scrollView contentOffset];
    double v4 = fmin(fmax((v8 - (v6 + v9)) / 12.0, 0.0), 1.0);
  }
  shadowImageView = self->_shadowImageView;

  [(UIImageView *)shadowImageView setAlpha:v4];
}

- (void)_scrollViewDidLayoutSubviews:(id)a3
{
  [(UIImageView *)self->_shadowImageView setHidden:[(SFAutomaticPasswordExplanationView *)self _scrollViewNeedsShadow:1] ^ 1];

  [(SFAutomaticPasswordExplanationView *)self _updateShadowViewAlpha];
}

- (void)automaticPasswordScrollContentViewDidLayout:(id)a3
{
  [(UIImageView *)self->_shadowImageView setHidden:[(SFAutomaticPasswordExplanationView *)self _scrollViewNeedsShadow:1] ^ 1];

  [(SFAutomaticPasswordExplanationView *)self _updateShadowViewAlpha];
}

- (UILabel)explanationLabel
{
  return self->_explanationLabel;
}

- (UILabel)passwordRetrievalExpalantionLabel
{
  return self->_passwordRetrievalExpalantionLabel;
}

- (UIButton)useStrongPasswordButton
{
  return self->_useStrongPasswordButton;
}

- (UIButton)useOtherPasswordButton
{
  return self->_useOtherPasswordButton;
}

- (int64_t)keyboardAppearance
{
  return self->_keyboardAppearance;
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  self->_keyboardAppearance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useOtherPasswordButton, 0);
  objc_storeStrong((id *)&self->_useStrongPasswordButton, 0);
  objc_storeStrong((id *)&self->_passwordRetrievalExpalantionLabel, 0);
  objc_storeStrong((id *)&self->_explanationLabel, 0);
  objc_storeStrong((id *)&self->_iPadWidthConstraint, 0);
  objc_storeStrong((id *)&self->_narrowContentTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_narrowContentLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_wideContentTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_wideContentLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_scrollableContentCenterLayoutGuide, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuideBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_narrowShadowImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_wideShadowImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_useCustomPasswordBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_useCustomPasswordButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_strongPasswordButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_strongPasswordButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_shadowImageView, 0);
  objc_storeStrong((id *)&self->_scrollableContentView, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end