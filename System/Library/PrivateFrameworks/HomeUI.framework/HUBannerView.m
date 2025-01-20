@interface HUBannerView
+ (Class)layoutOptionsClass;
- (BOOL)areCellContentsHidden;
- (BOOL)disableHighlighting;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (HFItem)item;
- (HUBannerView)initWithFrame:(CGRect)a3;
- (HUBannerViewDelegate)delegate;
- (HUGridBannerCellLayoutOptions)layoutOptions;
- (HUIconView)iconView;
- (HUIconView)supplementaryIconView;
- (NSArray)layoutConstraints;
- (NSString)description;
- (UIButton)continueButton;
- (UIButton)dismissButton;
- (UIImageView)iconImageView;
- (UIImageView)supplementaryIconImageView;
- (UILabel)descriptionLabel;
- (UILabel)footerViewLabel;
- (UILabel)titleLabel;
- (UIView)footerView;
- (UIView)lineView;
- (void)_dismissButtonTapped:(id)a3;
- (void)_footerViewTapped:(id)a3;
- (void)_subclass_updateConstraints;
- (void)layoutOptionsDidChange;
- (void)prepareForReuse;
- (void)setCellContentsHidden:(BOOL)a3;
- (void)setContinueButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setDisableHighlighting:(BOOL)a3;
- (void)setDismissButton:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setFooterViewLabel:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setIconImageView:(id)a3;
- (void)setIconView:(id)a3;
- (void)setItem:(id)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)setLineView:(id)a3;
- (void)setSupplementaryIconImageView:(id)a3;
- (void)setSupplementaryIconView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateConstraints;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUBannerView

- (HUBannerView)initWithFrame:(CGRect)a3
{
  v50.receiver = self;
  v50.super_class = (Class)HUBannerView;
  v3 = -[HUBannerView initWithFrame:](&v50, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(HUBannerView *)v3 setClipsToBounds:1];
    v5 = [MEMORY[0x1E4F428B8] tableCellGroupedBackgroundColor];
    [(HUBannerView *)v4 setBackgroundColor:v5];

    uint64_t v6 = [MEMORY[0x1E4F427E0] buttonWithType:7];
    dismissButton = v4->_dismissButton;
    v4->_dismissButton = (UIButton *)v6;

    [(UIButton *)v4->_dismissButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v4->_dismissButton setContentMode:1];
    [(UIButton *)v4->_dismissButton setHidden:1];
    [(UIButton *)v4->_dismissButton addTarget:v4 action:sel__dismissButtonTapped_ forControlEvents:64];
    [(HUBannerView *)v4 addSubview:v4->_dismissButton];
    id v8 = objc_alloc(MEMORY[0x1E4F42AA0]);
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v13 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], v10, v11, v12);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = (UIImageView *)v13;

    [(UIImageView *)v4->_iconImageView setContentMode:4];
    [(UIImageView *)v4->_iconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUBannerView *)v4 addSubview:v4->_iconImageView];
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v9, v10, v11, v12);
    supplementaryIconImageView = v4->_supplementaryIconImageView;
    v4->_supplementaryIconImageView = (UIImageView *)v15;

    [(UIImageView *)v4->_supplementaryIconImageView setContentMode:4];
    [(UIImageView *)v4->_supplementaryIconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_iconImageView addSubview:v4->_supplementaryIconImageView];
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6A428]), "initWithFrame:contentMode:", 1, v9, v10, v11, v12);
    iconView = v4->_iconView;
    v4->_iconView = (HUIconView *)v17;

    [(HUIconView *)v4->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUBannerView *)v4 addSubview:v4->_iconView];
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6A428]), "initWithFrame:contentMode:", 1, v9, v10, v11, v12);
    supplementaryIconView = v4->_supplementaryIconView;
    v4->_supplementaryIconView = (HUIconView *)v19;

    [(HUIconView *)v4->_supplementaryIconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUIconView *)v4->_iconView addSubview:v4->_supplementaryIconView];
    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v9, v10, v11, v12);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v21;

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(HUBannerView *)v4 addSubview:v4->_titleLabel];
    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v9, v10, v11, v12);
    descriptionLabel = v4->_descriptionLabel;
    v4->_descriptionLabel = (UILabel *)v23;

    v25 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [(UILabel *)v4->_descriptionLabel setTextColor:v25];

    [(UILabel *)v4->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_descriptionLabel setAdjustsFontForContentSizeCategory:1];
    [(HUBannerView *)v4 addSubview:v4->_descriptionLabel];
    uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v9, v10, v11, v12);
    lineView = v4->_lineView;
    v4->_lineView = (UIView *)v26;

    v28 = [MEMORY[0x1E4F428B8] tableSeparatorLightColor];
    [(UIView *)v4->_lineView setBackgroundColor:v28];
    [(UIView *)v4->_lineView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUBannerView *)v4 addSubview:v4->_lineView];
    uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v9, v10, v11, v12);
    footerView = v4->_footerView;
    v4->_footerView = (UIView *)v29;

    v31 = v4->_footerView;
    v32 = [(HUBannerView *)v4 backgroundColor];
    [(UIView *)v31 setBackgroundColor:v32];

    [(UIView *)v4->_footerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v33 = [(HUBannerView *)v4 layoutOptions];
    [v33 cellCornerRadius];
    double v35 = v34;
    v36 = [(UIView *)v4->_footerView layer];
    [v36 setCornerRadius:v35];

    v37 = [(UIView *)v4->_footerView layer];
    [v37 setMaskedCorners:12];

    [(HUBannerView *)v4 addSubview:v4->_footerView];
    uint64_t v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v9, v10, v11, v12);
    footerViewLabel = v4->_footerViewLabel;
    v4->_footerViewLabel = (UILabel *)v38;

    [(UILabel *)v4->_footerViewLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_footerViewLabel setAdjustsFontForContentSizeCategory:1];
    v40 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
    [(UILabel *)v4->_footerViewLabel setTextColor:v40];

    [(UIView *)v4->_footerView addSubview:v4->_footerViewLabel];
    v41 = (UIButton *)objc_alloc_init(MEMORY[0x1E4F427E0]);
    continueButton = v4->_continueButton;
    v4->_continueButton = v41;

    [(UIButton *)v4->_continueButton setHidden:1];
    v43 = v4->_continueButton;
    v44 = HUCommonImageNamed();
    v45 = [v44 imageFlippedForRightToLeftLayoutDirection];
    [(UIButton *)v43 setImage:v45 forState:0];

    v46 = v4->_continueButton;
    v47 = [MEMORY[0x1E4F428B8] tableSeparatorLightColor];
    [(UIButton *)v46 setTintColor:v47];

    [(UIButton *)v4->_continueButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_footerView addSubview:v4->_continueButton];
    v48 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v4 action:sel__footerViewTapped_];
    [v48 setDelegate:v4];
    [(UIView *)v4->_footerView addGestureRecognizer:v48];
  }
  return v4;
}

- (void)setLayoutOptions:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_layoutOptions] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    [(HUBannerView *)self layoutOptionsDidChange];
  }
}

- (void)updateConstraints
{
  [(HUBannerView *)self _subclass_updateConstraints];
  v3.receiver = self;
  v3.super_class = (Class)HUBannerView;
  [(HUBannerView *)&v3 updateConstraints];
}

- (void)_subclass_updateConstraints
{
  objc_super v3 = [(HUBannerView *)self layoutConstraints];

  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    objc_opt_class();
    id v5 = [(HUBannerView *)self layoutOptions];
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;

    id v8 = [(HUBannerView *)self dismissButton];
    double v9 = [v8 topAnchor];
    double v10 = [(HUBannerView *)self topAnchor];
    if (v7)
    {
      [v7 dismissButtonTopInset];
      double v11 = objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10);
      [v4 addObject:v11];

      double v12 = [(HUBannerView *)self dismissButton];
      uint64_t v13 = [v12 trailingAnchor];
      v14 = [(HUBannerView *)self trailingAnchor];
      [v7 dismissButtonTrailingInset];
      v16 = [v13 constraintEqualToAnchor:v14 constant:-v15];
      [v4 addObject:v16];

      uint64_t v17 = [(HUBannerView *)self dismissButton];
      v18 = [v17 heightAnchor];
      [v7 dismissButtonHeightAndWidth];
      uint64_t v19 = objc_msgSend(v18, "constraintEqualToConstant:");
      [v4 addObject:v19];

      v20 = [(HUBannerView *)self dismissButton];
      uint64_t v21 = [v20 widthAnchor];
      [v7 dismissButtonHeightAndWidth];
      uint64_t v23 = v21;
    }
    else
    {
      v24 = [v9 constraintEqualToAnchor:v10];
      [v4 addObject:v24];

      v25 = [(HUBannerView *)self dismissButton];
      uint64_t v26 = [v25 trailingAnchor];
      v27 = [(HUBannerView *)self trailingAnchor];
      v28 = [v26 constraintEqualToAnchor:v27];
      [v4 addObject:v28];

      uint64_t v29 = [(HUBannerView *)self dismissButton];
      v30 = [v29 heightAnchor];
      v31 = [v30 constraintEqualToConstant:0.0];
      [v4 addObject:v31];

      v20 = [(HUBannerView *)self dismissButton];
      uint64_t v23 = [v20 widthAnchor];
      uint64_t v21 = v23;
      double v22 = 0.0;
    }
    v32 = [v23 constraintEqualToConstant:v22];
    [v4 addObject:v32];

    v33 = [(HUBannerView *)self iconView];
    double v34 = [v33 leadingAnchor];
    double v35 = [(HUBannerView *)self leadingAnchor];
    v36 = [(HUBannerView *)self layoutOptions];
    [v36 leadingInset];
    v37 = objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35);
    [v4 addObject:v37];

    uint64_t v38 = [(HUBannerView *)self iconImageView];
    v39 = [v38 leadingAnchor];
    v40 = [(HUBannerView *)self iconView];
    v41 = [v40 leadingAnchor];
    v42 = [v39 constraintEqualToAnchor:v41];
    [v4 addObject:v42];

    v43 = [(HUBannerView *)self iconView];
    v44 = [v43 topAnchor];
    v45 = [(HUBannerView *)self topAnchor];
    v46 = [(HUBannerView *)self layoutOptions];
    [v46 titleTopInset];
    v47 = objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45);
    [v4 addObject:v47];

    v48 = [(HUBannerView *)self iconImageView];
    v49 = [v48 topAnchor];
    objc_super v50 = [(HUBannerView *)self iconView];
    v51 = [v50 topAnchor];
    v52 = [v49 constraintEqualToAnchor:v51];
    [v4 addObject:v52];

    v53 = [(HUBannerView *)self iconView];
    v54 = [v53 heightAnchor];
    v55 = [(HUBannerView *)self layoutOptions];
    [v55 iconHeight];
    v56 = objc_msgSend(v54, "constraintEqualToConstant:");
    [v4 addObject:v56];

    v57 = [(HUBannerView *)self iconImageView];
    v58 = [v57 heightAnchor];
    v59 = [(HUBannerView *)self iconImageView];
    v60 = [v59 image];
    if (v60)
    {
      v52 = [(HUBannerView *)self layoutOptions];
      [v52 iconHeight];
    }
    else
    {
      double v61 = 0.0;
    }
    v62 = [v58 constraintEqualToConstant:v61];
    [v4 addObject:v62];

    if (v60) {
    v63 = [(HUBannerView *)self iconView];
    }
    v64 = [v63 widthAnchor];
    v65 = [(HUBannerView *)self iconView];
    v66 = [v65 heightAnchor];
    v67 = [v64 constraintEqualToAnchor:v66];
    [v4 addObject:v67];

    v68 = [(HUBannerView *)self iconImageView];
    v69 = [v68 widthAnchor];
    v70 = [(HUBannerView *)self iconImageView];
    v71 = [v70 heightAnchor];
    v72 = [v69 constraintEqualToAnchor:v71];
    [v4 addObject:v72];

    objc_opt_class();
    v73 = [(HUBannerView *)self item];
    v74 = [v73 latestResults];
    v75 = [v74 objectForKeyedSubscript:*MEMORY[0x1E4F68A98]];
    if (objc_opt_isKindOfClass()) {
      v76 = v75;
    }
    else {
      v76 = 0;
    }
    id v77 = v76;

    v238 = v77;
    if (v77)
    {
      [v77 floatValue];
      double v79 = v78;
    }
    else
    {
      double v79 = 1.0;
    }
    v80 = [(HUBannerView *)self supplementaryIconView];
    v81 = [v80 widthAnchor];
    v82 = [(HUBannerView *)self iconView];
    v83 = [v82 widthAnchor];
    v84 = [v81 constraintEqualToAnchor:v83];
    [v4 addObject:v84];

    v85 = [(HUBannerView *)self supplementaryIconView];
    v86 = [v85 heightAnchor];
    v87 = [(HUBannerView *)self iconView];
    v88 = [v87 heightAnchor];
    v89 = [v86 constraintEqualToAnchor:v88 multiplier:v79];
    [v4 addObject:v89];

    v90 = [(HUBannerView *)self supplementaryIconView];
    v91 = [v90 bottomAnchor];
    v92 = [(HUBannerView *)self iconView];
    v93 = [v92 bottomAnchor];
    v94 = [v91 constraintEqualToAnchor:v93];
    [v4 addObject:v94];

    v95 = [(HUBannerView *)self supplementaryIconImageView];
    v96 = [v95 widthAnchor];
    v97 = [(HUBannerView *)self iconImageView];
    v98 = [v97 widthAnchor];
    v99 = [v96 constraintEqualToAnchor:v98];
    [v4 addObject:v99];

    v100 = [(HUBannerView *)self supplementaryIconImageView];
    v101 = [v100 heightAnchor];
    v102 = [(HUBannerView *)self iconImageView];
    v103 = [v102 heightAnchor];
    v104 = [v101 constraintEqualToAnchor:v103 multiplier:v79];
    [v4 addObject:v104];

    v105 = [(HUBannerView *)self supplementaryIconImageView];
    v106 = [v105 bottomAnchor];
    v107 = [(HUBannerView *)self iconImageView];
    v108 = [v107 bottomAnchor];
    v109 = [v106 constraintEqualToAnchor:v108];
    [v4 addObject:v109];

    v110 = [(HUBannerView *)self traitCollection];
    v111 = [v110 preferredContentSizeCategory];
    unint64_t v112 = *MEMORY[0x1E4F43770];

    v113 = [(HUBannerView *)self titleLabel];
    v114 = [v113 topAnchor];
    if ((unint64_t)v111 >= v112)
    {
      v124 = [(HUBannerView *)self iconView];
      v125 = [v124 bottomAnchor];
      v126 = [(HUBannerView *)self layoutOptions];
      [v126 verticalSpacingForLipElements];
      v127 = objc_msgSend(v114, "constraintEqualToAnchor:constant:", v125);
      [v4 addObject:v127];

      v118 = [(HUBannerView *)self titleLabel];
      v119 = [v118 leadingAnchor];
      v120 = [(HUBannerView *)self leadingAnchor];
      v121 = [(HUBannerView *)self layoutOptions];
      [v121 leadingInset];
      v122 = objc_msgSend(v119, "constraintEqualToAnchor:constant:", v120);
      [v4 addObject:v122];
    }
    else
    {
      v115 = [(HUBannerView *)self topAnchor];
      v116 = [(HUBannerView *)self layoutOptions];
      [v116 titleTopInset];
      v117 = objc_msgSend(v114, "constraintEqualToAnchor:constant:", v115);
      [v4 addObject:v117];

      v118 = [(HUBannerView *)self titleLabel];
      v119 = [v118 leadingAnchor];
      v120 = [(HUBannerView *)self iconView];
      v121 = [v120 trailingAnchor];
      v122 = [(HUBannerView *)self layoutOptions];
      [v122 horizontalItemSpacing];
      v123 = objc_msgSend(v119, "constraintEqualToAnchor:constant:", v121);
      [v4 addObject:v123];
    }
    v128 = [(HUBannerView *)self titleLabel];
    v129 = [v128 trailingAnchor];
    v130 = [(HUBannerView *)self trailingAnchor];
    v131 = [(HUBannerView *)self layoutOptions];
    [v131 trailingInset];
    v133 = [v129 constraintEqualToAnchor:v130 constant:-v132];
    [v4 addObject:v133];

    v134 = [(HUBannerView *)self descriptionLabel];
    v135 = [v134 topAnchor];
    v136 = [(HUBannerView *)self titleLabel];
    v137 = [v136 bottomAnchor];
    v138 = [(HUBannerView *)self layoutOptions];
    [v138 verticalLabelSpacing];
    v139 = objc_msgSend(v135, "constraintEqualToAnchor:constant:", v137);
    [v4 addObject:v139];

    v140 = [(HUBannerView *)self traitCollection];
    v141 = [v140 preferredContentSizeCategory];

    v142 = [(HUBannerView *)self descriptionLabel];
    v143 = [v142 leadingAnchor];
    if ((unint64_t)v141 >= v112)
    {
      v144 = [(HUBannerView *)self leadingAnchor];
      v145 = [(HUBannerView *)self layoutOptions];
      [v145 leadingInset];
      v146 = objc_msgSend(v143, "constraintEqualToAnchor:constant:", v144);
      [v4 addObject:v146];
    }
    else
    {
      v144 = [(HUBannerView *)self iconView];
      v145 = [v144 trailingAnchor];
      v146 = [(HUBannerView *)self layoutOptions];
      [v146 horizontalItemSpacing];
      v147 = objc_msgSend(v143, "constraintEqualToAnchor:constant:", v145);
      [v4 addObject:v147];
    }
    v148 = [(HUBannerView *)self descriptionLabel];
    v149 = [v148 trailingAnchor];
    v150 = [(HUBannerView *)self trailingAnchor];
    v151 = [(HUBannerView *)self layoutOptions];
    [v151 trailingInset];
    v153 = [v149 constraintEqualToAnchor:v150 constant:-v152];
    [v4 addObject:v153];

    v154 = [(HUBannerView *)self lineView];
    if ([v154 isHidden])
    {
      v155 = [(HUBannerView *)self footerView];
      int v156 = [v155 isHidden];

      if (v156)
      {
        v157 = [(HUBannerView *)self descriptionLabel];
        v158 = [v157 bottomAnchor];
        v159 = [(HUBannerView *)self bottomAnchor];
        v160 = [(HUBannerView *)self layoutOptions];
        [v160 verticalSpacingForLineView];
        uint64_t v162 = [v158 constraintEqualToAnchor:v159 constant:-v161];
        goto LABEL_34;
      }
    }
    else
    {
    }
    v163 = [(HUBannerView *)self lineView];
    v164 = [v163 topAnchor];
    v165 = [(HUBannerView *)self descriptionLabel];
    v166 = [v165 bottomAnchor];
    v167 = [(HUBannerView *)self layoutOptions];
    [v167 verticalSpacingForLineView];
    v168 = objc_msgSend(v164, "constraintEqualToAnchor:constant:", v166);
    [v4 addObject:v168];

    v169 = [(HUBannerView *)self lineView];
    v170 = [v169 leadingAnchor];
    v171 = [(HUBannerView *)self descriptionLabel];
    v172 = [v171 leadingAnchor];
    v173 = [v170 constraintEqualToAnchor:v172];
    [v4 addObject:v173];

    v174 = [(HUBannerView *)self lineView];
    v175 = [v174 trailingAnchor];
    v176 = [(HUBannerView *)self trailingAnchor];
    v177 = [v175 constraintEqualToAnchor:v176];
    [v4 addObject:v177];

    v178 = [(HUBannerView *)self lineView];
    v179 = [v178 heightAnchor];
    v180 = [v179 constraintEqualToConstant:1.0];
    [v4 addObject:v180];

    v181 = [(HUBannerView *)self footerView];
    v182 = [v181 topAnchor];
    v183 = [(HUBannerView *)self lineView];
    v184 = [v183 bottomAnchor];
    v185 = [v182 constraintEqualToAnchor:v184];
    [v4 addObject:v185];

    v186 = [(HUBannerView *)self footerView];
    v187 = [v186 leadingAnchor];
    v188 = [(HUBannerView *)self leadingAnchor];
    v189 = [v187 constraintEqualToAnchor:v188];
    [v4 addObject:v189];

    v190 = [(HUBannerView *)self footerView];
    v191 = [v190 trailingAnchor];
    v192 = [(HUBannerView *)self trailingAnchor];
    v193 = [v191 constraintEqualToAnchor:v192];
    [v4 addObject:v193];

    v194 = [(HUBannerView *)self footerView];
    v195 = [v194 bottomAnchor];
    v196 = [(HUBannerView *)self bottomAnchor];
    v197 = [v195 constraintEqualToAnchor:v196];
    [v4 addObject:v197];

    v198 = [(HUBannerView *)self footerViewLabel];
    v199 = [v198 topAnchor];
    v200 = [(HUBannerView *)self footerView];
    v201 = [v200 topAnchor];
    v202 = [(HUBannerView *)self layoutOptions];
    [v202 verticalSpacingForLipElements];
    v203 = objc_msgSend(v199, "constraintEqualToAnchor:constant:", v201);
    [v4 addObject:v203];

    v204 = [(HUBannerView *)self footerViewLabel];
    v205 = [v204 leadingAnchor];
    v206 = [(HUBannerView *)self descriptionLabel];
    v207 = [v206 leadingAnchor];
    v208 = [v205 constraintEqualToAnchor:v207];
    [v4 addObject:v208];

    v209 = [(HUBannerView *)self footerViewLabel];
    v210 = [v209 trailingAnchor];
    v211 = [(HUBannerView *)self continueButton];
    if ([v211 isHidden])
    {
      v212 = [(HUBannerView *)self footerView];
      [v212 trailingAnchor];
    }
    else
    {
      v212 = [(HUBannerView *)self continueButton];
      [v212 leadingAnchor];
    v213 = };
    v214 = [(HUBannerView *)self layoutOptions];
    [v214 trailingInset];
    v216 = [v210 constraintLessThanOrEqualToAnchor:v213 constant:-v215];
    [v4 addObject:v216];

    uint64_t v217 = [(HUBannerView *)self footerViewLabel];
    v218 = [(id)v217 bottomAnchor];
    v219 = [(HUBannerView *)self footerView];
    v220 = [v219 bottomAnchor];
    v221 = [(HUBannerView *)self layoutOptions];
    [v221 verticalSpacingForLipElements];
    v223 = [v218 constraintEqualToAnchor:v220 constant:-v222];
    [v4 addObject:v223];

    v224 = [(HUBannerView *)self continueButton];
    LOBYTE(v217) = [v224 isHidden];

    if (v217) {
      goto LABEL_35;
    }
    v225 = [(HUBannerView *)self continueButton];
    v226 = [v225 centerXAnchor];
    v227 = [(HUBannerView *)self footerViewLabel];
    v228 = [v227 centerXAnchor];
    v229 = [v226 constraintEqualToAnchor:v228];
    [v4 addObject:v229];

    v230 = [(HUBannerView *)self continueButton];
    v231 = [v230 trailingAnchor];
    v232 = [(HUBannerView *)self footerView];
    v233 = [v232 trailingAnchor];
    v234 = [(HUBannerView *)self layoutOptions];
    [v234 trailingInset];
    v236 = [v231 constraintEqualToAnchor:v233 constant:-v235];
    [v4 addObject:v236];

    v157 = [(HUBannerView *)self continueButton];
    v158 = [v157 centerYAnchor];
    v159 = [(HUBannerView *)self footerView];
    v160 = [v159 centerYAnchor];
    uint64_t v162 = [v158 constraintEqualToAnchor:v160];
LABEL_34:
    v237 = (void *)v162;
    [v4 addObject:v162];

LABEL_35:
    [MEMORY[0x1E4F28DC8] activateConstraints:v4];
    [(HUBannerView *)self setLayoutConstraints:v4];
  }
  v239.receiver = self;
  v239.super_class = (Class)HUBannerView;
  [(HUBannerView *)&v239 updateConstraints];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(HUBannerView *)self disableHighlighting])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__HUBannerView_setHighlighted_animated___block_invoke;
    v9[3] = &unk_1E6385A70;
    v9[4] = self;
    BOOL v10 = a3;
    id v7 = _Block_copy(v9);
    id v8 = v7;
    if (v4) {
      [MEMORY[0x1E4F42FF0] animateWithDuration:v7 animations:0.15];
    }
    else {
      (*((void (**)(void *))v7 + 2))(v7);
    }
  }
}

void __40__HUBannerView_setHighlighted_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    [MEMORY[0x1E4F428B8] systemLightGrayColor];
  }
  else {
  id v3 = [*(id *)(a1 + 32) backgroundColor];
  }
  v2 = [*(id *)(a1 + 32) footerView];
  [v2 setBackgroundColor:v3];
}

- (void)layoutOptionsDidChange
{
  id v3 = [(HUBannerView *)self layoutOptions];
  BOOL v4 = [v3 font];
  id v5 = [(HUBannerView *)self titleLabel];
  [v5 setFont:v4];

  uint64_t v6 = [(HUBannerView *)self layoutOptions];
  id v7 = [v6 descriptionFont];
  id v8 = [(HUBannerView *)self descriptionLabel];
  [v8 setFont:v7];

  double v9 = [(HUBannerView *)self layoutOptions];
  [v9 cellCornerRadius];
  -[HUBannerView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");

  BOOL v10 = [(HUBannerView *)self layoutOptions];
  [v10 cellCornerRadius];
  double v12 = v11;
  uint64_t v13 = [(HUBannerView *)self footerView];
  v14 = [v13 layer];
  [v14 setCornerRadius:v12];

  double v15 = [(HUBannerView *)self layoutOptions];
  v16 = [v15 footerViewLabelFont];
  uint64_t v17 = [(HUBannerView *)self footerViewLabel];
  [v17 setFont:v16];

  v18 = [(HUBannerView *)self layoutConstraints];

  if (v18)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28DC8];
    v20 = [(HUBannerView *)self layoutConstraints];
    [v19 deactivateConstraints:v20];
  }
  [(HUBannerView *)self setLayoutConstraints:0];

  [(HUBannerView *)self setNeedsUpdateConstraints];
}

- (void)prepareForReuse
{
  id v3 = [(HUBannerView *)self layoutOptions];
  BOOL v4 = [v3 font];
  id v5 = [(HUBannerView *)self titleLabel];
  [v5 setFont:v4];

  uint64_t v6 = [(HUBannerView *)self layoutOptions];
  id v7 = [v6 descriptionFont];
  id v8 = [(HUBannerView *)self descriptionLabel];
  [v8 setFont:v7];

  double v9 = [(HUBannerView *)self layoutOptions];
  BOOL v10 = [v9 footerViewLabelFont];
  double v11 = [(HUBannerView *)self footerViewLabel];
  [v11 setFont:v10];

  double v12 = [(HUBannerView *)self iconImageView];
  [v12 setImage:0];

  uint64_t v13 = [(HUBannerView *)self iconView];
  [v13 updateWithIconDescriptor:0 displayStyle:1 animated:0];

  v14 = [(HUBannerView *)self supplementaryIconImageView];
  [v14 setImage:0];

  id v15 = [(HUBannerView *)self supplementaryIconView];
  [v15 updateWithIconDescriptor:0 displayStyle:1 animated:0];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  v82[2] = *MEMORY[0x1E4F143B8];
  id v5 = [(HUBannerView *)self item];
  uint64_t v6 = [v5 latestResults];

  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  id v8 = [(HUBannerView *)self titleLabel];
  [v8 setText:v7];

  double v9 = [(HUBannerView *)self layoutOptions];
  uint64_t v10 = [v9 maxNumberOfTitleLines];
  double v11 = [(HUBannerView *)self titleLabel];
  [v11 setNumberOfLines:v10];

  double v12 = [(HUBannerView *)self titleLabel];
  [v12 sizeToFit];

  uint64_t v13 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
  v81[0] = *MEMORY[0x1E4F42508];
  v14 = [(HUBannerView *)self descriptionLabel];
  id v15 = [v14 font];
  v82[0] = v15;
  v81[1] = *MEMORY[0x1E4F42510];
  v16 = [(HUBannerView *)self descriptionLabel];
  uint64_t v17 = [v16 textColor];
  v82[1] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:2];

  if ([v13 prefersDynamicString])
  {
    uint64_t v19 = [(HUBannerView *)self descriptionLabel];
    [v19 bounds];
    double v22 = objc_msgSend(v13, "dynamicStringForSize:attributes:", v18, v20, v21);
    uint64_t v23 = [(HUBannerView *)self descriptionLabel];
    [v23 setAttributedText:v22];
  }
  else
  {
    uint64_t v19 = [v13 stringWithAttributes:v18];
    double v22 = [(HUBannerView *)self descriptionLabel];
    [v22 setAttributedText:v19];
  }

  v24 = [(HUBannerView *)self layoutOptions];
  uint64_t v25 = [v24 maxNumberOfDescriptionLines];
  uint64_t v26 = [(HUBannerView *)self descriptionLabel];
  [v26 setNumberOfLines:v25];

  v27 = [(HUBannerView *)self descriptionLabel];
  [v27 sizeToFit];

  v28 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68948]];
  uint64_t v29 = [(HUBannerView *)self footerViewLabel];
  [v29 setText:v28];

  v30 = [(HUBannerView *)self footerViewLabel];
  [v30 setAccessibilityIdentifier:@"Home.Banners.Cells.Footer.Text"];

  v31 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68950]];
  if (v31)
  {
    v32 = [(HUBannerView *)self footerViewLabel];
    [v32 setTextColor:v31];
  }
  v33 = [(HUBannerView *)self item];
  double v34 = [v33 latestResults];
  double v35 = [v34 objectForKeyedSubscript:*MEMORY[0x1E4F689F8]];

  v80 = (void *)v18;
  if (v35)
  {
    v36 = [(HUBannerView *)self iconImageView];
    [v36 setContentMode:1];

    v37 = [(HUBannerView *)self iconImageView];
    [v37 setImage:v35];

    uint64_t v38 = [(HUBannerView *)self iconImageView];
    [v38 setHidden:0];

    v39 = [(HUBannerView *)self iconView];
    [v39 setHidden:1];

    v40 = [(HUBannerView *)self item];
    v41 = [v40 latestResults];
    v42 = [v41 objectForKeyedSubscript:*MEMORY[0x1E4F68AB0]];

    if (v42)
    {
      v43 = [(HUBannerView *)self iconImageView];
      [v43 setTintColor:v42];
    }
    v44 = [(HUBannerView *)self item];
    v45 = [v44 latestResults];
    v46 = [v45 objectForKeyedSubscript:*MEMORY[0x1E4F68AA0]];

    v47 = [(HUBannerView *)self supplementaryIconImageView];
    v48 = v47;
    if (v46)
    {
      [v47 setContentMode:1];

      v49 = [(HUBannerView *)self supplementaryIconImageView];
      [v49 setImage:v46];

      if (v42)
      {
        objc_super v50 = [(HUBannerView *)self supplementaryIconImageView];
        [v50 setTintColor:v42];
      }
      v47 = [(HUBannerView *)self supplementaryIconImageView];
      goto LABEL_23;
    }
  }
  else
  {
    v51 = [(HUBannerView *)self item];
    v52 = [v51 latestResults];
    v42 = [v52 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];

    objc_opt_class();
    BOOL v79 = v3;
    if (objc_opt_isKindOfClass())
    {
      v53 = (objc_class *)MEMORY[0x1E4F68F38];
      id v54 = v42;
      id v55 = [v53 alloc];
      [v54 packageIdentifier];
      v57 = BOOL v56 = v3;

      v58 = (void *)[v55 initWithPackageIdentifier:v57 state:*MEMORY[0x1E4F68360]];
      v59 = [(HUBannerView *)self iconView];
      [v59 updateWithIconDescriptor:v58 displayStyle:1 animated:v56];
    }
    else
    {
      v58 = [(HUBannerView *)self iconView];
      [v58 updateWithIconDescriptor:v42 displayStyle:1 animated:v3];
    }

    v60 = [(HUBannerView *)self iconView];
    [v60 setHidden:0];

    double v61 = [(HUBannerView *)self iconImageView];
    [v61 setHidden:1];

    v62 = [(HUBannerView *)self item];
    v63 = [v62 latestResults];
    v46 = [v63 objectForKeyedSubscript:*MEMORY[0x1E4F68A90]];

    if (v46)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v64 = (objc_class *)MEMORY[0x1E4F68F38];
        id v65 = v42;
        id v66 = [v64 alloc];
        v67 = [v65 packageIdentifier];

        v68 = (void *)[v66 initWithPackageIdentifier:v67 state:*MEMORY[0x1E4F68360]];
        v69 = [(HUBannerView *)self supplementaryIconView];
        [v69 updateWithIconDescriptor:v68 displayStyle:1 animated:v79];
      }
      else
      {
        v68 = [(HUBannerView *)self supplementaryIconView];
        [v68 updateWithIconDescriptor:v46 displayStyle:1 animated:v79];
      }

      v47 = [(HUBannerView *)self supplementaryIconView];
LABEL_23:
      v48 = v47;
      uint64_t v70 = 0;
      goto LABEL_24;
    }
    v47 = [(HUBannerView *)self supplementaryIconView];
    v48 = v47;
  }
  uint64_t v70 = 1;
LABEL_24:
  [v47 setHidden:v70];

  v71 = [(HUBannerView *)self footerViewLabel];
  v72 = [v71 text];
  v73 = [(HUBannerView *)self lineView];
  [v73 setHidden:v72 == 0];

  v74 = [(HUBannerView *)self footerViewLabel];
  v75 = [v74 text];
  v76 = [(HUBannerView *)self footerView];
  [v76 setHidden:v75 == 0];

  id v77 = [(HUBannerView *)self footerViewLabel];
  [v77 setNumberOfLines:0];

  float v78 = [(HUBannerView *)self footerViewLabel];
  [v78 setLineBreakMode:0];

  [(HUBannerView *)self setNeedsUpdateConstraints];
}

+ (Class)layoutOptionsClass
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  BOOL v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  BOOL v4 = [(HUBannerView *)self titleLabel];
  id v5 = [v4 text];
  uint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v3 appendString:v5 withName:v7];

  id v8 = [v3 build];

  return (NSString *)v8;
}

- (void)_dismissButtonTapped:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    uint64_t v10 = self;
    __int16 v11 = 2080;
    double v12 = "-[HUBannerView _dismissButtonTapped:]";
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped dismiss button", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v6 = [(HUBannerView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(HUBannerView *)self delegate];
    [v8 bannerView:self dismissButtonTapped:v4];
  }
}

- (void)_footerViewTapped:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    uint64_t v10 = self;
    __int16 v11 = 2080;
    double v12 = "-[HUBannerView _footerViewTapped:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped footer view %@", (uint8_t *)&v9, 0x20u);
  }

  uint64_t v6 = [(HUBannerView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(HUBannerView *)self delegate];
    [v8 bannerView:self footerViewTapped:v4];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = objc_msgSend(a4, "view", a3);
  uint64_t v6 = [(HUBannerView *)self footerView];
  if (v5 == (void *)v6)
  {
    uint64_t v10 = [(HUBannerView *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0) {
      return 0;
    }
    double v12 = [(HUBannerView *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0) {
      return 1;
    }
    id v5 = [(HUBannerView *)self delegate];
    char v7 = [(HUBannerView *)self footerView];
    char v8 = [v5 bannerView:self shouldReceiveFooterViewTaps:v7];
  }
  else
  {
    char v7 = (void *)v6;
    char v8 = 0;
  }

  return v8;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v10 = [(HUBannerView *)self traitCollection];
  char v11 = [v10 preferredContentSizeCategory];
  unint64_t v12 = *MEMORY[0x1E4F43770];

  char v13 = [(HUBannerView *)self layoutOptions];
  [v13 leadingInset];
  double v15 = v14;
  v16 = [(HUBannerView *)self layoutOptions];
  uint64_t v17 = v16;
  if ((unint64_t)v11 >= v12)
  {
    [v16 trailingInset];
    double v25 = v15 + v26;
  }
  else
  {
    [v16 iconWidth];
    double v19 = v15 + v18;
    double v20 = [(HUBannerView *)self layoutOptions];
    [v20 horizontalItemSpacing];
    double v22 = v19 + v21;
    uint64_t v23 = [(HUBannerView *)self layoutOptions];
    [v23 trailingInset];
    double v25 = v22 + v24;
  }
  double v27 = width - v25;
  v28 = [(HUBannerView *)self titleLabel];
  *(float *)&double v29 = a4;
  *(float *)&double v30 = a5;
  objc_msgSend(v28, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v27, height, v29, v30);
  double v32 = v31;

  v33 = [(HUBannerView *)self layoutOptions];
  [v33 verticalLabelSpacing];
  double v35 = ceil(v32) + 0.0 + v34;

  v36 = [(HUBannerView *)self descriptionLabel];
  *(float *)&double v37 = a4;
  *(float *)&double v38 = a5;
  objc_msgSend(v36, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v27, height, v37, v38);
  double v40 = v39;

  double v41 = v35 + ceil(v40);
  if ((unint64_t)v11 < v12)
  {
    v42 = [(HUBannerView *)self footerViewLabel];
    v43 = [v42 text];
    if ([v43 length])
    {
    }
    else
    {
      v44 = [(HUBannerView *)self layoutOptions];
      [v44 iconHeight];
      double v46 = v45;

      if (v46 <= v41) {
        goto LABEL_10;
      }
      v42 = [(HUBannerView *)self layoutOptions];
      [v42 iconHeight];
      double v41 = v47;
    }
  }
LABEL_10:
  v48 = [(HUBannerView *)self layoutOptions];
  [v48 titleTopInset];
  double v50 = v41 + v49;

  if ((unint64_t)v11 >= v12)
  {
    v51 = [(HUBannerView *)self layoutOptions];
    [v51 iconHeight];
    double v53 = v52;
    id v54 = [(HUBannerView *)self layoutOptions];
    [v54 verticalSpacingForLipElements];
    double v50 = v50 + v53 + v55;
  }
  BOOL v56 = [(HUBannerView *)self footerViewLabel];
  v57 = [v56 text];
  uint64_t v58 = [v57 length];

  if (v58)
  {
    v59 = [(HUBannerView *)self layoutOptions];
    [v59 verticalSpacingForLineView];
    double v61 = v50 + v60 + 1.0;

    v62 = [(HUBannerView *)self footerViewLabel];
    *(float *)&double v63 = a4;
    *(float *)&double v64 = a5;
    objc_msgSend(v62, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v27, height, v63, v64);
    double v66 = v65;

    v67 = [(HUBannerView *)self layoutOptions];
    [v67 verticalSpacingForLipElements];
    double v50 = v61 + ceil(v66) + v68 * 2.0;
LABEL_14:

    goto LABEL_15;
  }
  if ((unint64_t)v11 < v12)
  {
    v71 = [(HUBannerView *)self layoutOptions];
    [v71 iconHeight];
    double v73 = v72;

    if (v41 >= v73)
    {
      v67 = [(HUBannerView *)self layoutOptions];
      [v67 verticalSpacingForLineView];
      double v50 = v50 + v74 + 1.0;
      goto LABEL_14;
    }
  }
LABEL_15:
  double v69 = width;
  double v70 = v50;
  result.double height = v70;
  result.double width = v69;
  return result;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7 = a4;
  unint64_t v8 = a6 - 3;
  if ((unint64_t)(a6 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    int v9 = [MEMORY[0x1E4F69378] sharedInstance];
    id v10 = (id)[v9 openURL:v7];
  }
  return v8 < 0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)areCellContentsHidden
{
  return self->_cellContentsHidden;
}

- (void)setCellContentsHidden:(BOOL)a3
{
  self->_cellContentsHidden = a3;
}

- (HUGridBannerCellLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (BOOL)disableHighlighting
{
  return self->_disableHighlighting;
}

- (void)setDisableHighlighting:(BOOL)a3
{
  self->_disableHighlighting = a3;
}

- (HUBannerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUBannerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UIImageView)supplementaryIconImageView
{
  return self->_supplementaryIconImageView;
}

- (void)setSupplementaryIconImageView:(id)a3
{
}

- (HUIconView)supplementaryIconView
{
  return self->_supplementaryIconView;
}

- (void)setSupplementaryIconView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (UIView)lineView
{
  return self->_lineView;
}

- (void)setLineView:(id)a3
{
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (UILabel)footerViewLabel
{
  return self->_footerViewLabel;
}

- (void)setFooterViewLabel:(id)a3
{
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
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
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_footerViewLabel, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_lineView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_supplementaryIconView, 0);
  objc_storeStrong((id *)&self->_supplementaryIconImageView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);

  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end