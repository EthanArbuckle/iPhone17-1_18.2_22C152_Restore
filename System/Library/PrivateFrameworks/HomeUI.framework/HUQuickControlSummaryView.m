@interface HUQuickControlSummaryView
+ (BOOL)requiresConstraintBasedLayout;
- (HUBaseIconView)baseIconView;
- (HUIconView)iconView;
- (HUQuickControlSummaryView)initWithFrame:(CGRect)a3;
- (NSAttributedString)microphoneStatusText;
- (NSLayoutConstraint)baseIconViewWidthConstraint;
- (NSMutableArray)contentConstraints;
- (NSString)primaryText;
- (NSString)secondaryText;
- (UIImage)image;
- (UIImageView)imageView;
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (UIStackView)verticalStackView;
- (UIVisualEffectView)secondaryLabelEffectView;
- (void)baseIconViewDidUpdateConfiguration:(id)a3;
- (void)setBaseIconView:(id)a3;
- (void)setBaseIconViewWidthConstraint:(id)a3;
- (void)setContentConstraints:(id)a3;
- (void)setImage:(id)a3;
- (void)setMicrophoneStatusText:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setSecondaryLabelEffectView:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)setVerticalStackView:(id)a3;
- (void)updateConstraints;
@end

@implementation HUQuickControlSummaryView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUQuickControlSummaryView)initWithFrame:(CGRect)a3
{
  v38.receiver = self;
  v38.super_class = (Class)HUQuickControlSummaryView;
  v3 = -[HUQuickControlSummaryView initWithFrame:](&v38, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if ([MEMORY[0x1E4F69758] shouldUseProxHandOffMaterials])
    {
      v4 = [MEMORY[0x1E4F69430] sharedInstance];
      objc_opt_class();
      v5 = [v4 lastIdentifier];
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
      id v7 = v6;

      objc_opt_class();
      v8 = [v4 lastIdentifier];
      if (objc_opt_isKindOfClass()) {
        v9 = v8;
      }
      else {
        v9 = 0;
      }
      id v10 = v9;

      if (v7) {
        v11 = v7;
      }
      else {
        v11 = v10;
      }
      v19 = (void *)[v11 assetType];
      if (v19)
      {
        v20 = (void *)MEMORY[0x1E4F94238];
        v21 = [v4 lastDisambiguationContext];
        v22 = [v21 activity];
        v19 = [v20 composedImageFor:v22 assetType:v19];
      }
      v23 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
      imageView = v3->_imageView;
      v3->_imageView = v23;

      [(UIImageView *)v3->_imageView setContentMode:1];
      [(UIImageView *)v3->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(HUQuickControlSummaryView *)v3 addSubview:v3->_imageView];
      if (v19) {
        [(HUQuickControlSummaryView *)v3 setImage:v19];
      }
    }
    else
    {
      if ([MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation])
      {
        v12 = (HUIconView *)objc_alloc_init(MEMORY[0x1E4F6A428]);
        iconView = v3->_iconView;
        v3->_iconView = v12;

        [(HUIconView *)v3->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
        [(HUIconView *)v3->_iconView setDisplayContext:0];
        [(HUIconView *)v3->_iconView setIconSize:3];
        v14 = [MEMORY[0x1E4F428B8] systemMidGrayColor];
        [(HUIconView *)v3->_iconView setTintColor:v14];

        [(HUIconView *)v3->_iconView setContentMode:1];
        if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
        {
          v15 = [MEMORY[0x1E4F42FE8] controlCenterSecondaryVibrancyEffect];
          [(HUIconView *)v3->_iconView setVibrancyEffect:v15];
        }
        else
        {
          [(HUIconView *)v3->_iconView setVibrancyEffect:0];
        }
        v18 = v3->_iconView;
      }
      else
      {
        v16 = objc_alloc_init(HUBaseIconView);
        baseIconView = v3->_baseIconView;
        v3->_baseIconView = v16;

        [(HUBaseIconView *)v3->_baseIconView setTranslatesAutoresizingMaskIntoConstraints:0];
        [(HUBaseIconView *)v3->_baseIconView setDelegate:v3];
        v18 = v3->_baseIconView;
      }
      [(HUQuickControlSummaryView *)v3 addSubview:v18];
    }
    v25 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    primaryLabel = v3->_primaryLabel;
    v3->_primaryLabel = v25;

    [(UILabel *)v3->_primaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_primaryLabel setNumberOfLines:2];
    uint64_t v27 = *MEMORY[0x1E4F43870];
    v28 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*MEMORY[0x1E4F43870] variant:1024];
    [(UILabel *)v3->_primaryLabel setFont:v28];

    [(UILabel *)v3->_primaryLabel setAdjustsFontForContentSizeCategory:1];
    [(HUQuickControlSummaryView *)v3 addSubview:v3->_primaryLabel];
    uint64_t v29 = [objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
    secondaryLabelEffectView = v3->_secondaryLabelEffectView;
    v3->_secondaryLabelEffectView = (UIVisualEffectView *)v29;

    [(UIVisualEffectView *)v3->_secondaryLabelEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
    if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
    {
      v31 = [MEMORY[0x1E4F42FE8] controlCenterSecondaryVibrancyEffect];
      [(UIVisualEffectView *)v3->_secondaryLabelEffectView setEffect:v31];
    }
    else
    {
      [(UIVisualEffectView *)v3->_secondaryLabelEffectView setEffect:0];
    }
    [(HUQuickControlSummaryView *)v3 addSubview:v3->_secondaryLabelEffectView];
    v32 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    secondaryLabel = v3->_secondaryLabel;
    v3->_secondaryLabel = v32;

    [(UILabel *)v3->_secondaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_secondaryLabel setNumberOfLines:0];
    v34 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [(UILabel *)v3->_secondaryLabel setTextColor:v34];

    v35 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:v27 variant:1024];
    [(UILabel *)v3->_secondaryLabel setFont:v35];

    [(UILabel *)v3->_secondaryLabel setAdjustsFontForContentSizeCategory:1];
    v36 = [(UIVisualEffectView *)v3->_secondaryLabelEffectView contentView];
    [v36 addSubview:v3->_secondaryLabel];
  }
  return v3;
}

- (void)setBaseIconView:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    [(HUBaseIconView *)self->_baseIconView removeFromSuperview];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 setDelegate:self];
    [(HUQuickControlSummaryView *)self addSubview:v5];
    objc_storeStrong((id *)&self->_baseIconView, a3);
  }
}

- (void)setPrimaryText:(id)a3
{
  p_primaryText = (id *)&self->_primaryText;
  id v9 = a3;
  if ((objc_msgSend(*p_primaryText, "isEqualToString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_primaryText, a3);
    id v6 = *p_primaryText;
    id v7 = [(HUQuickControlSummaryView *)self primaryLabel];
    [v7 setText:v6];

    v8 = [(HUQuickControlSummaryView *)self primaryLabel];
    [v8 setNeedsLayout];
  }
}

- (void)setSecondaryText:(id)a3
{
  p_secondaryText = (id *)&self->_secondaryText;
  id v9 = a3;
  if ((objc_msgSend(*p_secondaryText, "isEqualToString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_secondaryText, a3);
    id v6 = *p_secondaryText;
    id v7 = [(HUQuickControlSummaryView *)self secondaryLabel];
    [v7 setText:v6];

    v8 = [(HUQuickControlSummaryView *)self secondaryLabel];
    [v8 setNeedsLayout];
  }
}

- (void)setMicrophoneStatusText:(id)a3
{
  p_microphoneStatusText = (id *)&self->_microphoneStatusText;
  id v9 = a3;
  if ((objc_msgSend(*p_microphoneStatusText, "isEqualToAttributedString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_microphoneStatusText, a3);
    id v6 = *p_microphoneStatusText;
    id v7 = [(HUQuickControlSummaryView *)self secondaryLabel];
    [v7 setAttributedText:v6];

    v8 = [(HUQuickControlSummaryView *)self secondaryLabel];
    [v8 setNeedsLayout];
  }
}

- (void)setImage:(id)a3
{
  id v6 = a3;
  if ((-[UIImage isEqual:](self->_image, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_image, a3);
    id v5 = [(HUQuickControlSummaryView *)self imageView];
    [v5 setImage:v6];
  }
}

- (void)updateConstraints
{
  v134.receiver = self;
  v134.super_class = (Class)HUQuickControlSummaryView;
  [(HUQuickControlSummaryView *)&v134 updateConstraints];
  v3 = [(HUQuickControlSummaryView *)self contentConstraints];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F28DC8];
    id v5 = [(HUQuickControlSummaryView *)self contentConstraints];
    [v4 deactivateConstraints:v5];
  }
  [(HUQuickControlSummaryView *)self setBaseIconViewWidthConstraint:0];
  id v6 = objc_opt_new();
  [(HUQuickControlSummaryView *)self setContentConstraints:v6];

  if ([MEMORY[0x1E4F69758] shouldUseProxHandOffMaterials])
  {
    id v7 = [(HUQuickControlSummaryView *)self contentConstraints];
    v8 = [(HUQuickControlSummaryView *)self imageView];
    id v9 = [v8 leadingAnchor];
    id v10 = [(HUQuickControlSummaryView *)self leadingAnchor];
    v11 = [v9 constraintEqualToAnchor:v10 constant:14.0];
    [v7 addObject:v11];

    v12 = [(HUQuickControlSummaryView *)self contentConstraints];
    v13 = [(HUQuickControlSummaryView *)self primaryLabel];
    v14 = [v13 leadingAnchor];
    v15 = [(HUQuickControlSummaryView *)self imageView];
  }
  else
  {
    char v16 = [MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation];
    v17 = [(HUQuickControlSummaryView *)self contentConstraints];
    if (v16)
    {
      v18 = [(HUQuickControlSummaryView *)self iconView];
      v19 = [v18 leadingAnchor];
      v20 = [(HUQuickControlSummaryView *)self leadingAnchor];
      v21 = [v19 constraintEqualToAnchor:v20 constant:14.0];
      [v17 addObject:v21];

      v12 = [(HUQuickControlSummaryView *)self contentConstraints];
      v13 = [(HUQuickControlSummaryView *)self primaryLabel];
      v14 = [v13 leadingAnchor];
      [(HUQuickControlSummaryView *)self iconView];
    }
    else
    {
      v22 = [(HUQuickControlSummaryView *)self baseIconView];
      v23 = [v22 leadingAnchor];
      v24 = [(HUQuickControlSummaryView *)self leadingAnchor];
      v25 = [v23 constraintEqualToAnchor:v24 constant:14.0];
      [v17 addObject:v25];

      v12 = [(HUQuickControlSummaryView *)self contentConstraints];
      v13 = [(HUQuickControlSummaryView *)self primaryLabel];
      v14 = [v13 leadingAnchor];
      [(HUQuickControlSummaryView *)self baseIconView];
    v15 = };
  }
  v26 = v15;
  uint64_t v27 = [v15 trailingAnchor];
  v28 = [v14 constraintEqualToAnchor:v27 constant:14.0];
  [v12 addObject:v28];

  uint64_t v29 = [(HUQuickControlSummaryView *)self contentConstraints];
  v30 = [(HUQuickControlSummaryView *)self primaryLabel];
  v31 = [v30 trailingAnchor];
  v32 = [(HUQuickControlSummaryView *)self layoutMarginsGuide];
  v33 = [v32 trailingAnchor];
  v34 = [v31 constraintEqualToAnchor:v33];
  [v29 addObject:v34];

  v35 = [(HUQuickControlSummaryView *)self contentConstraints];
  v36 = [(HUQuickControlSummaryView *)self secondaryLabelEffectView];
  v37 = [v36 leadingAnchor];
  objc_super v38 = [(HUQuickControlSummaryView *)self primaryLabel];
  v39 = [v38 leadingAnchor];
  v40 = [v37 constraintEqualToAnchor:v39];
  [v35 addObject:v40];

  v41 = [(HUQuickControlSummaryView *)self contentConstraints];
  v42 = [(HUQuickControlSummaryView *)self secondaryLabelEffectView];
  v43 = [v42 trailingAnchor];
  v44 = [(HUQuickControlSummaryView *)self layoutMarginsGuide];
  v45 = [v44 trailingAnchor];
  v46 = [v43 constraintEqualToAnchor:v45];
  [v41 addObject:v46];

  v47 = [(HUQuickControlSummaryView *)self contentConstraints];
  v48 = [(HUQuickControlSummaryView *)self secondaryLabel];
  v49 = [v48 leadingAnchor];
  v50 = [(HUQuickControlSummaryView *)self secondaryLabelEffectView];
  v51 = [v50 leadingAnchor];
  v52 = [v49 constraintEqualToAnchor:v51];
  [v47 addObject:v52];

  v53 = [(HUQuickControlSummaryView *)self contentConstraints];
  v54 = [(HUQuickControlSummaryView *)self secondaryLabel];
  v55 = [v54 trailingAnchor];
  v56 = [(HUQuickControlSummaryView *)self secondaryLabelEffectView];
  v57 = [v56 trailingAnchor];
  v58 = [v55 constraintEqualToAnchor:v57];
  [v53 addObject:v58];

  if ([MEMORY[0x1E4F69758] shouldUseProxHandOffMaterials])
  {
    v59 = [(HUQuickControlSummaryView *)self contentConstraints];
    v60 = [(HUQuickControlSummaryView *)self imageView];
    v61 = [v60 topAnchor];
    v62 = [(HUQuickControlSummaryView *)self topAnchor];
    v63 = [v61 constraintEqualToAnchor:v62 constant:14.0];
    [v59 addObject:v63];
  }
  else
  {
    char v64 = [MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation];
    v65 = [(HUQuickControlSummaryView *)self contentConstraints];
    if (v64)
    {
      v66 = [(HUQuickControlSummaryView *)self iconView];
      v67 = [v66 topAnchor];
      v68 = [(HUQuickControlSummaryView *)self layoutMarginsGuide];
      v69 = [v68 topAnchor];
      v70 = [v67 constraintEqualToAnchor:v69 constant:14.0];
      [v65 addObject:v70];

      v59 = [(HUQuickControlSummaryView *)self contentConstraints];
      v71 = [(HUQuickControlSummaryView *)self iconView];
    }
    else
    {
      v72 = [(HUQuickControlSummaryView *)self baseIconView];
      v73 = [v72 topAnchor];
      v74 = [(HUQuickControlSummaryView *)self layoutMarginsGuide];
      v75 = [v74 topAnchor];
      v76 = [(HUQuickControlSummaryView *)self baseIconView];
      v77 = [v76 configuration];
      uint64_t v78 = [v77 viewType];
      double v79 = 14.0;
      if (!v78) {
        double v79 = 0.0;
      }
      v80 = [v73 constraintEqualToAnchor:v75 constant:v79];
      [v65 addObject:v80];

      v59 = [(HUQuickControlSummaryView *)self contentConstraints];
      v71 = [(HUQuickControlSummaryView *)self baseIconView];
    }
    v60 = v71;
    v61 = [v71 bottomAnchor];
    v62 = [(HUQuickControlSummaryView *)self layoutMarginsGuide];
    v63 = [v62 bottomAnchor];
    v81 = [v61 constraintLessThanOrEqualToAnchor:v63];
    [v59 addObject:v81];
  }
  v82 = [(HUQuickControlSummaryView *)self contentConstraints];
  v83 = [(HUQuickControlSummaryView *)self primaryLabel];
  v84 = [v83 topAnchor];
  v85 = [(HUQuickControlSummaryView *)self topAnchor];
  v86 = [v84 constraintEqualToAnchor:v85 constant:16.0];
  [v82 addObject:v86];

  v87 = [(HUQuickControlSummaryView *)self contentConstraints];
  v88 = [(HUQuickControlSummaryView *)self primaryLabel];
  v89 = [v88 bottomAnchor];
  v90 = [(HUQuickControlSummaryView *)self secondaryLabelEffectView];
  v91 = [v90 topAnchor];
  v92 = [v89 constraintEqualToAnchor:v91];
  [v87 addObject:v92];

  v93 = [(HUQuickControlSummaryView *)self contentConstraints];
  v94 = [(HUQuickControlSummaryView *)self secondaryLabelEffectView];
  v95 = [v94 bottomAnchor];
  v96 = [(HUQuickControlSummaryView *)self bottomAnchor];
  v97 = [v95 constraintLessThanOrEqualToAnchor:v96 constant:-16.0];
  [v93 addObject:v97];

  v98 = [(HUQuickControlSummaryView *)self contentConstraints];
  v99 = [(HUQuickControlSummaryView *)self secondaryLabel];
  v100 = [v99 topAnchor];
  v101 = [(HUQuickControlSummaryView *)self secondaryLabelEffectView];
  v102 = [v101 topAnchor];
  v103 = [v100 constraintEqualToAnchor:v102];
  [v98 addObject:v103];

  v104 = [(HUQuickControlSummaryView *)self contentConstraints];
  v105 = [(HUQuickControlSummaryView *)self secondaryLabel];
  v106 = [v105 bottomAnchor];
  v107 = [(HUQuickControlSummaryView *)self secondaryLabelEffectView];
  v108 = [v107 bottomAnchor];
  v109 = [v106 constraintEqualToAnchor:v108];
  [v104 addObject:v109];

  if ([MEMORY[0x1E4F69758] shouldUseProxHandOffMaterials])
  {
    v110 = [(HUQuickControlSummaryView *)self contentConstraints];
    v111 = [(HUQuickControlSummaryView *)self imageView];
    v112 = [v111 heightAnchor];
    v113 = [v112 constraintEqualToConstant:44.0];
    [v110 addObject:v113];

    v114 = [(HUQuickControlSummaryView *)self contentConstraints];
    v115 = [(HUQuickControlSummaryView *)self imageView];
    v116 = [v115 widthAnchor];
    v117 = [v116 constraintEqualToConstant:44.0];
    [v114 addObject:v117];
LABEL_21:

    goto LABEL_22;
  }
  if ([MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation])
  {
    v118 = [(HUQuickControlSummaryView *)self contentConstraints];
    v119 = [(HUQuickControlSummaryView *)self iconView];
    v120 = [v119 heightAnchor];
    v121 = [(HUQuickControlSummaryView *)self iconView];
    [v121 iconSize];
    HUDefaultSizeForIconSize();
    v123 = [v120 constraintEqualToConstant:v122];
    [v118 addObject:v123];

    v114 = [(HUQuickControlSummaryView *)self contentConstraints];
    v115 = [(HUQuickControlSummaryView *)self iconView];
    v116 = [v115 widthAnchor];
    v117 = [(HUQuickControlSummaryView *)self iconView];
    [v117 iconSize];
    HUDefaultSizeForIconSize();
    v124 = objc_msgSend(v116, "constraintEqualToConstant:");
    [v114 addObject:v124];

    goto LABEL_21;
  }
  v127 = [(HUQuickControlSummaryView *)self baseIconView];
  v128 = [v127 configuration];
  uint64_t v129 = [v128 viewType];

  if (v129) {
    goto LABEL_23;
  }
  v130 = [(HUQuickControlSummaryView *)self baseIconView];
  v131 = [v130 widthAnchor];
  v132 = [(HUQuickControlSummaryView *)self baseIconView];
  [v132 intrinsicContentSize];
  v133 = objc_msgSend(v131, "constraintEqualToConstant:");
  [(HUQuickControlSummaryView *)self setBaseIconViewWidthConstraint:v133];

  v114 = [(HUQuickControlSummaryView *)self contentConstraints];
  v115 = [(HUQuickControlSummaryView *)self baseIconViewWidthConstraint];
  [v114 addObject:v115];
LABEL_22:

LABEL_23:
  v125 = (void *)MEMORY[0x1E4F28DC8];
  v126 = [(HUQuickControlSummaryView *)self contentConstraints];
  [v125 activateConstraints:v126];
}

- (void)baseIconViewDidUpdateConfiguration:(id)a3
{
  id v10 = a3;
  v4 = [(HUQuickControlSummaryView *)self baseIconView];
  id v5 = [v4 configuration];
  uint64_t v6 = [v5 viewType];

  if (!v6)
  {
    [v10 intrinsicContentSize];
    double v8 = v7;
    id v9 = [(HUQuickControlSummaryView *)self baseIconViewWidthConstraint];
    [v9 setConstant:v8];
  }
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (NSAttributedString)microphoneStatusText
{
  return self->_microphoneStatusText;
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (HUBaseIconView)baseIconView
{
  return self->_baseIconView;
}

- (UIImage)image
{
  return self->_image;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (NSMutableArray)contentConstraints
{
  return self->_contentConstraints;
}

- (void)setContentConstraints:(id)a3
{
}

- (NSLayoutConstraint)baseIconViewWidthConstraint
{
  return self->_baseIconViewWidthConstraint;
}

- (void)setBaseIconViewWidthConstraint:(id)a3
{
}

- (UIVisualEffectView)secondaryLabelEffectView
{
  return self->_secondaryLabelEffectView;
}

- (void)setSecondaryLabelEffectView:(id)a3
{
}

- (UIStackView)verticalStackView
{
  return self->_verticalStackView;
}

- (void)setVerticalStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalStackView, 0);
  objc_storeStrong((id *)&self->_secondaryLabelEffectView, 0);
  objc_storeStrong((id *)&self->_baseIconViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentConstraints, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_baseIconView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_microphoneStatusText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);

  objc_storeStrong((id *)&self->_primaryText, 0);
}

@end