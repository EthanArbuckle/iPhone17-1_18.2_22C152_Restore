@interface HULockupView
- (HFItem)item;
- (HUDownloadControl)downloadControl;
- (HUExpandableTextView)descriptionExpandableTextView;
- (HULockupInternalResizingDelegate)internalViewResizingDelegate;
- (HULockupView)initWithFrame:(CGRect)a3;
- (HULockupViewDelegate)delegate;
- (NSLayoutConstraint)downloadControlCenterYConstraint;
- (NSLayoutConstraint)downloadControlTopConstraint;
- (NSLayoutConstraint)downloadControlWidthConstraint;
- (UILabel)detailLabel;
- (UILabel)secondaryDetailLabel;
- (UILabel)titleLabel;
- (UIStackView)labelStackView;
- (UIStackView)stackView;
- (UIView)iconView;
- (double)_maxPossibleTitleLengthForDownloadControl;
- (id)initializeIconViewWithSize:(unint64_t)a3;
- (unint64_t)iconSize;
- (void)_buttonTapped:(id)a3;
- (void)expandableTextViewDidCollapse:(id)a3;
- (void)expandableTextViewDidExpand:(id)a3;
- (void)resetDownloadControlVerticalConstraint;
- (void)setDelegate:(id)a3;
- (void)setDescriptionExpandableTextView:(id)a3;
- (void)setDetailLabel:(id)a3;
- (void)setDownloadControl:(id)a3;
- (void)setDownloadControlCenterYConstraint:(id)a3;
- (void)setDownloadControlTopConstraint:(id)a3;
- (void)setDownloadControlWidthConstraint:(id)a3;
- (void)setIconSize:(unint64_t)a3;
- (void)setIconView:(id)a3;
- (void)setInternalViewResizingDelegate:(id)a3;
- (void)setItem:(id)a3;
- (void)setLabelStackView:(id)a3;
- (void)setSecondaryDetailLabel:(id)a3;
- (void)setStackView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateDescriptionExpandableTextView:(id)a3 animate:(BOOL)a4;
- (void)updateIconView:(id)a3 animate:(BOOL)a4;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HULockupView

- (HULockupView)initWithFrame:(CGRect)a3
{
  v184[3] = *MEMORY[0x1E4F143B8];
  v179.receiver = self;
  v179.super_class = (Class)HULockupView;
  v3 = -[HULockupView initWithFrame:](&v179, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(HULockupView *)v3 setIconSize:4];
    v5 = [(HULockupView *)v4 initializeIconViewWithSize:[(HULockupView *)v4 iconSize]];
    [(HULockupView *)v4 setIconView:v5];

    v6 = [(HULockupView *)v4 iconView];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v7 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = [MEMORY[0x1E4F428B8] systemExtraLightGrayColor];
    uint64_t v9 = [v8 CGColor];
    v10 = [v7 layer];
    [v10 setBorderColor:v9];

    v11 = [v7 layer];
    [v11 setBorderWidth:1.0];

    v12 = [v7 layer];
    [v12 setCornerRadius:10.0];

    v13 = [(HULockupView *)v4 iconView];
    [v7 addSubview:v13];

    id v14 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v15 = *MEMORY[0x1E4F1DB28];
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v19 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], v16, v17, v18);
    [(HULockupView *)v4 setTitleLabel:v19];

    v20 = [(HULockupView *)v4 titleLabel];
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

    v21 = [(HULockupView *)v4 titleLabel];
    [v21 setAdjustsFontSizeToFitWidth:1];

    v22 = [(HULockupView *)v4 titleLabel];
    [v22 setMinimumScaleFactor:0.75];

    v23 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    v24 = [(HULockupView *)v4 titleLabel];
    [v24 setFont:v23];

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v15, v16, v17, v18);
    [(HULockupView *)v4 setDetailLabel:v25];

    v26 = [(HULockupView *)v4 detailLabel];
    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

    uint64_t v27 = *MEMORY[0x1E4F43880];
    v28 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43880]];
    v29 = [(HULockupView *)v4 detailLabel];
    [v29 setFont:v28];

    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v15, v16, v17, v18);
    [(HULockupView *)v4 setSecondaryDetailLabel:v30];

    v31 = [(HULockupView *)v4 secondaryDetailLabel];
    [v31 setTranslatesAutoresizingMaskIntoConstraints:0];

    v32 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v27];
    v33 = [(HULockupView *)v4 secondaryDetailLabel];
    [v33 setFont:v32];

    v34 = [MEMORY[0x1E4F428B8] systemGrayColor];
    v35 = [(HULockupView *)v4 secondaryDetailLabel];
    [v35 setTextColor:v34];

    id v36 = objc_alloc(MEMORY[0x1E4F42E20]);
    v37 = [(HULockupView *)v4 titleLabel];
    v184[0] = v37;
    v38 = [(HULockupView *)v4 detailLabel];
    v184[1] = v38;
    v39 = [(HULockupView *)v4 secondaryDetailLabel];
    v184[2] = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v184 count:3];
    v41 = (void *)[v36 initWithArrangedSubviews:v40];
    [(HULockupView *)v4 setLabelStackView:v41];

    v42 = [(HULockupView *)v4 labelStackView];
    [v42 setSpacing:2.0];

    v43 = [(HULockupView *)v4 labelStackView];
    [v43 setAxis:1];

    v44 = [(HULockupView *)v4 labelStackView];
    [v44 setTranslatesAutoresizingMaskIntoConstraints:0];

    v45 = objc_alloc_init(HUDownloadControl);
    [(HULockupView *)v4 setDownloadControl:v45];

    v46 = [(HULockupView *)v4 downloadControl];
    [v46 setTranslatesAutoresizingMaskIntoConstraints:0];

    v47 = [(HULockupView *)v4 downloadControl];
    [v47 setAllowsAddImage:0];

    v48 = [(HULockupView *)v4 downloadControl];
    [v48 setDisplayStyle:1];

    v49 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
    v50 = [(HULockupView *)v4 downloadControl];
    [v50 setFilledTintColor:v49];

    v51 = [MEMORY[0x1E4F428B8] systemFillColor];
    v52 = [(HULockupView *)v4 downloadControl];
    [v52 setTintColor:v51];

    v53 = [(HULockupView *)v4 downloadControl];
    [v53 addTarget:v4 action:sel__buttonTapped_ forControlEvents:64];

    v54 = [(HULockupView *)v4 downloadControl];
    objc_msgSend(v54, "setControlStatus:animated:", 1, 0x3FF0000000000000, 0);

    v55 = [(HULockupView *)v4 downloadControl];
    v56 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateControlTitle_Update", @"HUSoftwareUpdateControlTitle_Update", 1);
    [v55 setTitle:v56 forControlStatusType:1];

    [(HULockupView *)v4 _maxPossibleTitleLengthForDownloadControl];
    double v58 = v57;
    v59 = [(HULockupView *)v4 downloadControl];
    [v59 setMinTitleLength:v58];

    v60 = [(HULockupView *)v4 downloadControl];
    [v60 sizeToFit];

    v61 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v15, v16, v17, v18);
    [v61 addSubview:v7];
    v62 = [(HULockupView *)v4 labelStackView];
    [v61 addSubview:v62];

    v63 = [(HULockupView *)v4 downloadControl];
    [v61 addSubview:v63];

    uint64_t v181 = *MEMORY[0x1E4F42508];
    v64 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43878]];
    v183[0] = v64;
    uint64_t v182 = *MEMORY[0x1E4F42510];
    uint64_t v65 = v182;
    v66 = [MEMORY[0x1E4F428B8] labelColor];
    v183[1] = v66;
    v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v183 forKeys:&v181 count:2];

    v178 = v67;
    v68 = (void *)[v67 mutableCopy];
    v69 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
    [v68 setObject:v69 forKeyedSubscript:v65];

    v70 = -[HUExpandableTextView initWithFrame:]([HUExpandableTextView alloc], "initWithFrame:", v15, v16, v17, v18);
    [(HULockupView *)v4 setDescriptionExpandableTextView:v70];

    v71 = [(HULockupView *)v4 descriptionExpandableTextView];
    [v71 setTextAttributes:v67];

    v72 = [(HULockupView *)v4 descriptionExpandableTextView];
    [v72 setDelegate:v4];

    v73 = [(HULockupView *)v4 descriptionExpandableTextView];
    [v73 setTranslatesAutoresizingMaskIntoConstraints:0];

    v74 = +[HUFadeInButton button];
    v75 = [(HULockupView *)v4 descriptionExpandableTextView];
    [v75 setMoreButton:v74];

    id v76 = objc_alloc(MEMORY[0x1E4F28B18]);
    v77 = _HULocalizedStringWithDefaultValue(@"HUMoreButtonTitle", @"HUMoreButtonTitle", 1);
    v177 = (void *)[v76 initWithString:v77 attributes:v68];

    v78 = [(HULockupView *)v4 descriptionExpandableTextView];
    v79 = [v78 moreButton];
    [v79 setAttributedTitle:v177 forState:0];

    v80 = [(HULockupView *)v4 descriptionExpandableTextView];
    [v80 setAlwaysShowMoreButtonUnlessExpanded:1];

    v81 = [(HULockupView *)v4 descriptionExpandableTextView];
    v82 = [v81 moreButton];
    [v82 sizeToFit];

    id v83 = objc_alloc(MEMORY[0x1E4F42E20]);
    v180[0] = v61;
    v84 = [(HULockupView *)v4 descriptionExpandableTextView];
    v180[1] = v84;
    v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:v180 count:2];
    v86 = (void *)[v83 initWithArrangedSubviews:v85];
    [(HULockupView *)v4 setStackView:v86];

    v87 = [(HULockupView *)v4 stackView];
    [v87 setSpacing:16.0];

    v88 = [(HULockupView *)v4 stackView];
    [v88 setAxis:1];

    v89 = [(HULockupView *)v4 stackView];
    [v89 setTranslatesAutoresizingMaskIntoConstraints:0];

    v90 = [(HULockupView *)v4 stackView];
    [(HULockupView *)v4 addSubview:v90];

    v91 = [MEMORY[0x1E4F1CA48] array];
    [(HULockupView *)v4 iconSize];
    HUDefaultSizeForIconSize();
    double v93 = v92;
    double v95 = v94;
    v96 = [v7 widthAnchor];
    v97 = [v96 constraintEqualToConstant:v93 + 10.0];
    [v91 addObject:v97];

    v98 = [v7 heightAnchor];
    v99 = [v98 constraintEqualToConstant:v95 + 10.0];
    [v91 addObject:v99];

    v100 = [v7 leadingAnchor];
    v101 = [(HULockupView *)v4 leadingAnchor];
    v102 = [v100 constraintEqualToAnchor:v101];
    [v91 addObject:v102];

    v103 = [v7 centerYAnchor];
    v104 = [(HULockupView *)v4 labelStackView];
    v105 = [v104 centerYAnchor];
    v106 = [v103 constraintEqualToAnchor:v105];
    [v91 addObject:v106];

    v107 = [(HULockupView *)v4 iconView];
    v108 = [v107 widthAnchor];
    v109 = [v108 constraintEqualToConstant:v93 + -15.0];
    [v91 addObject:v109];

    v110 = [(HULockupView *)v4 iconView];
    v111 = [v110 heightAnchor];
    v112 = [v111 constraintEqualToConstant:v95 + -15.0];
    [v91 addObject:v112];

    v113 = [(HULockupView *)v4 iconView];
    v114 = [v113 centerXAnchor];
    v115 = [v7 centerXAnchor];
    v116 = [v114 constraintEqualToAnchor:v115];
    [v91 addObject:v116];

    v117 = [(HULockupView *)v4 iconView];
    v118 = [v117 centerYAnchor];
    v119 = [v7 centerYAnchor];
    v120 = [v118 constraintEqualToAnchor:v119];
    [v91 addObject:v120];

    v121 = [(HULockupView *)v4 labelStackView];
    v122 = [v121 topAnchor];
    v123 = [v61 layoutMarginsGuide];
    v124 = [v123 topAnchor];
    v125 = [v122 constraintEqualToAnchor:v124];
    [v91 addObject:v125];

    v126 = [(HULockupView *)v4 labelStackView];
    v127 = [v126 leadingAnchor];
    v128 = [v7 trailingAnchor];
    v129 = [v127 constraintEqualToAnchor:v128 constant:12.0];
    [v91 addObject:v129];

    v130 = [(HULockupView *)v4 labelStackView];
    v131 = [v130 bottomAnchor];
    v132 = [v61 bottomAnchor];
    v133 = [v131 constraintEqualToAnchor:v132];
    [v91 addObject:v133];

    v134 = [(HULockupView *)v4 downloadControl];
    v135 = [v134 topAnchor];
    v136 = [v7 topAnchor];
    v137 = [v135 constraintEqualToAnchor:v136];
    [(HULockupView *)v4 setDownloadControlTopConstraint:v137];

    v138 = [(HULockupView *)v4 downloadControl];
    v139 = [v138 centerYAnchor];
    v140 = [(HULockupView *)v4 labelStackView];
    v141 = [v140 centerYAnchor];
    v142 = [v139 constraintEqualToAnchor:v141];
    [(HULockupView *)v4 setDownloadControlCenterYConstraint:v142];

    v143 = [(HULockupView *)v4 downloadControlCenterYConstraint];
    [v91 addObject:v143];

    v144 = [(HULockupView *)v4 downloadControl];
    v145 = [v144 leadingAnchor];
    v146 = [(HULockupView *)v4 labelStackView];
    v147 = [v146 trailingAnchor];
    v148 = [v145 constraintGreaterThanOrEqualToAnchor:v147 constant:12.0];
    [v91 addObject:v148];

    v149 = [(HULockupView *)v4 downloadControl];
    v150 = [v149 trailingAnchor];
    v151 = [v61 safeAreaLayoutGuide];
    v152 = [v151 trailingAnchor];
    v153 = [v150 constraintEqualToAnchor:v152];
    [v91 addObject:v153];

    v154 = [(HULockupView *)v4 downloadControl];
    v155 = [v154 widthAnchor];
    v156 = [(HULockupView *)v4 downloadControl];
    [v156 intrinsicContentSize];
    v157 = objc_msgSend(v155, "constraintEqualToConstant:");
    [(HULockupView *)v4 setDownloadControlWidthConstraint:v157];

    v158 = [(HULockupView *)v4 downloadControlWidthConstraint];
    [v91 addObject:v158];

    v159 = [(HULockupView *)v4 stackView];
    v160 = [v159 topAnchor];
    v161 = [(HULockupView *)v4 topAnchor];
    v162 = [v160 constraintEqualToAnchor:v161];
    [v91 addObject:v162];

    v163 = [(HULockupView *)v4 stackView];
    v164 = [v163 leadingAnchor];
    v165 = [(HULockupView *)v4 leadingAnchor];
    v166 = [v164 constraintEqualToAnchor:v165];
    [v91 addObject:v166];

    v167 = [(HULockupView *)v4 stackView];
    v168 = [v167 trailingAnchor];
    v169 = [(HULockupView *)v4 trailingAnchor];
    v170 = [v168 constraintEqualToAnchor:v169];
    [v91 addObject:v170];

    v171 = [(HULockupView *)v4 stackView];
    v172 = [v171 bottomAnchor];
    v173 = [(HULockupView *)v4 layoutMarginsGuide];
    v174 = [v173 bottomAnchor];
    v175 = [v172 constraintEqualToAnchor:v174];
    [v91 addObject:v175];

    [MEMORY[0x1E4F28DC8] activateConstraints:v91];
  }
  return v4;
}

- (id)initializeIconViewWithSize:(unint64_t)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F42AA0]);

  return v3;
}

- (void)updateIconView:(id)a3 animate:(BOOL)a4
{
  id v5 = a3;
  id v8 = [(HULockupView *)self item];
  v6 = [v8 latestResults];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F689F8]];
  [v5 setImage:v7];
}

- (void)updateDescriptionExpandableTextView:(id)a3 animate:(BOOL)a4
{
  id v8 = a3;
  id v5 = [(HULockupView *)self item];
  v6 = [v5 latestResults];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];

  if (v7) {
    [v8 setStringGenerator:v7];
  }
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HULockupView *)self item];
  id v57 = [v5 latestResults];

  v6 = [(HULockupView *)self iconView];
  [(HULockupView *)self updateIconView:v6 animate:v3];

  id v7 = [v57 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  id v8 = [(HULockupView *)self titleLabel];
  [v8 setText:v7];

  uint64_t v9 = [v57 objectForKeyedSubscript:*MEMORY[0x1E4F68990]];
  v10 = [(HULockupView *)self detailLabel];
  [v10 setText:v9];

  v11 = [v57 objectForKeyedSubscript:*MEMORY[0x1E4F68A58]];
  v12 = [(HULockupView *)self secondaryDetailLabel];
  [v12 setText:v11];

  v13 = [v57 objectForKeyedSubscript:*MEMORY[0x1E4F68C48]];
  int v14 = [v13 BOOLValue];

  double v15 = [v57 objectForKeyedSubscript:*MEMORY[0x1E4F68C58]];
  uint64_t v16 = [v15 BOOLValue];

  double v17 = [v57 objectForKeyedSubscript:*MEMORY[0x1E4F68C68]];
  int v18 = [v17 BOOLValue];

  if (!v14)
  {
    v23 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
    v24 = [(HULockupView *)self downloadControl];
    [v24 setFilledTintColor:v23];

    v21 = [MEMORY[0x1E4F428B8] systemFillColor];
    v22 = [(HULockupView *)self downloadControl];
    [v22 setTintColor:v21];
    goto LABEL_5;
  }
  if (v18)
  {
    v19 = [MEMORY[0x1E4F428B8] systemFillColor];
    v20 = [(HULockupView *)self downloadControl];
    [v20 setTintColor:v19];

    v21 = [MEMORY[0x1E4F428B8] systemGrayColor];
    v22 = [(HULockupView *)self downloadControl];
    [v22 setFilledTintColor:v21];
LABEL_5:
    double v25 = 1.0;
    uint64_t v26 = 1;
    goto LABEL_10;
  }
  uint64_t v27 = [v57 objectForKeyedSubscript:*MEMORY[0x1E4F68C60]];
  v21 = v27;
  if (v27)
  {
    [v27 floatValue];
    double v25 = v28;
    v29 = [MEMORY[0x1E4F428B8] systemFillColor];
    v30 = [(HULockupView *)self downloadControl];
    [v30 setFilledTintColor:v29];

    v22 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
    v31 = [(HULockupView *)self downloadControl];
    [v31 setTintColor:v22];
    uint64_t v26 = 4;
  }
  else
  {
    v32 = [MEMORY[0x1E4F428B8] systemFillColor];
    v33 = [(HULockupView *)self downloadControl];
    [v33 setFilledTintColor:v32];

    v22 = [MEMORY[0x1E4F428B8] systemFillColor];
    v31 = [(HULockupView *)self downloadControl];
    [v31 setTintColor:v22];
    double v25 = 1.0;
    uint64_t v26 = 3;
  }

LABEL_10:
  v34 = [(HULockupView *)self downloadControl];
  uint64_t v35 = [v34 controlStatus];

  id v36 = [(HULockupView *)self downloadControl];
  objc_msgSend(v36, "setControlStatus:animated:", v26, *(void *)&v25, v3);

  v37 = [(HULockupView *)self downloadControl];
  v38 = [v57 objectForKeyedSubscript:*MEMORY[0x1E4F68948]];
  [v37 setTitle:v38 forControlStatusType:1];

  v39 = [(HULockupView *)self downloadControl];
  [v39 setHidden:v16];

  if (v26 == 1) {
    uint64_t v40 = v18 ^ 1u;
  }
  else {
    uint64_t v40 = 0;
  }
  v41 = [(HULockupView *)self downloadControl];
  [v41 setEnabled:v40];

  if (v35 != v26)
  {
    v42 = [(HULockupView *)self downloadControl];
    [v42 intrinsicContentSize];
    double v44 = v43;
    v45 = [(HULockupView *)self downloadControlWidthConstraint];
    [v45 setConstant:v44];
  }
  v46 = [(HULockupView *)self descriptionExpandableTextView];
  [(HULockupView *)self updateDescriptionExpandableTextView:v46 animate:v3];

  v47 = [(HULockupView *)self descriptionExpandableTextView];
  v48 = [v47 text];
  BOOL v49 = [v48 length] == 0;
  v50 = [(HULockupView *)self descriptionExpandableTextView];
  [v50 setHidden:v49];

  v51 = [(HULockupView *)self descriptionExpandableTextView];
  v52 = [v51 text];
  uint64_t v53 = [v52 length];

  if (!v53)
  {
    v54 = [(HULockupView *)self descriptionExpandableTextView];
    [v54 setDelegate:0];

    v55 = [(HULockupView *)self descriptionExpandableTextView];
    [v55 setExpanded:1];

    v56 = [(HULockupView *)self descriptionExpandableTextView];
    [v56 setDelegate:self];
  }
  [(HULockupView *)self resetDownloadControlVerticalConstraint];
}

- (void)_buttonTapped:(id)a3
{
  id v7 = a3;
  v4 = [(HULockupView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(HULockupView *)self delegate];
    [v6 lockupView:self downloadControlTapped:v7];
  }
  [(HULockupView *)self resetDownloadControlVerticalConstraint];
}

- (void)resetDownloadControlVerticalConstraint
{
  BOOL v3 = [(HULockupView *)self downloadControl];
  uint64_t v4 = [v3 controlStatus];

  char v5 = [(HULockupView *)self downloadControlTopConstraint];
  [v5 setActive:(unint64_t)(v4 - 3) < 2];

  id v6 = [(HULockupView *)self downloadControlCenterYConstraint];
  [v6 setActive:(unint64_t)(v4 - 3) > 1];
}

- (double)_maxPossibleTitleLengthForDownloadControl
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v2 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateControlTitle_Update", @"HUSoftwareUpdateControlTitle_Update", 1);
  v14[0] = v2;
  BOOL v3 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateControlTitle_Requested", @"HUSoftwareUpdateControlTitle_Requested", 1);
  v14[1] = v3;
  uint64_t v4 = _HULocalizedStringWithDefaultValue(@"HUDownloadButtonTitle_Open", @"HUDownloadButtonTitle_Open", 1);
  v14[2] = v4;
  char v5 = _HULocalizedStringWithDefaultValue(@"HUDownloadButtonTitle_View", @"HUDownloadButtonTitle_View", 1);
  v14[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];

  uint64_t v10 = 0;
  v11 = (double *)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__HULockupView__maxPossibleTitleLengthForDownloadControl__block_invoke;
  v9[3] = &unk_1E6392508;
  v9[4] = &v10;
  objc_msgSend(v6, "na_each:", v9);
  double v7 = v11[3];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __57__HULockupView__maxPossibleTitleLengthForDownloadControl__block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *MEMORY[0x1E4F42508];
  id v3 = a2;
  uint64_t v4 = +[HUDownloadControl controlTitleFontForControlStatusType:1];
  v10[0] = v4;
  char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v3 sizeWithAttributes:v5];
  double v7 = v6;

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v7 > *(double *)(v8 + 24)) {
    *(double *)(v8 + 24) = v7;
  }
}

- (void)expandableTextViewDidExpand:(id)a3
{
  uint64_t v4 = [(HULockupView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(HULockupView *)self delegate];
    double v6 = [(HULockupView *)self descriptionExpandableTextView];
    [v7 lockupView:self expandableTextViewDidExpand:v6];
  }
}

- (void)expandableTextViewDidCollapse:(id)a3
{
  uint64_t v4 = [(HULockupView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(HULockupView *)self delegate];
    double v6 = [(HULockupView *)self descriptionExpandableTextView];
    [v7 lockupView:self expandableTextViewDidCollapse:v6];
  }
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (HULockupViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HULockupViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HUExpandableTextView)descriptionExpandableTextView
{
  return self->_descriptionExpandableTextView;
}

- (void)setDescriptionExpandableTextView:(id)a3
{
}

- (HULockupInternalResizingDelegate)internalViewResizingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalViewResizingDelegate);

  return (HULockupInternalResizingDelegate *)WeakRetained;
}

- (void)setInternalViewResizingDelegate:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
}

- (UILabel)secondaryDetailLabel
{
  return self->_secondaryDetailLabel;
}

- (void)setSecondaryDetailLabel:(id)a3
{
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
}

- (unint64_t)iconSize
{
  return self->_iconSize;
}

- (void)setIconSize:(unint64_t)a3
{
  self->_iconSize = a3;
}

- (UIView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (HUDownloadControl)downloadControl
{
  return self->_downloadControl;
}

- (void)setDownloadControl:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (NSLayoutConstraint)downloadControlTopConstraint
{
  return self->_downloadControlTopConstraint;
}

- (void)setDownloadControlTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)downloadControlCenterYConstraint
{
  return self->_downloadControlCenterYConstraint;
}

- (void)setDownloadControlCenterYConstraint:(id)a3
{
}

- (NSLayoutConstraint)downloadControlWidthConstraint
{
  return self->_downloadControlWidthConstraint;
}

- (void)setDownloadControlWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadControlWidthConstraint, 0);
  objc_storeStrong((id *)&self->_downloadControlCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_downloadControlTopConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_downloadControl, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_secondaryDetailLabel, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_internalViewResizingDelegate);
  objc_storeStrong((id *)&self->_descriptionExpandableTextView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_item, 0);
}

@end