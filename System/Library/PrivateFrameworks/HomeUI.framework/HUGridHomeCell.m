@interface HUGridHomeCell
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)shouldShowAsEmptyHome;
- (BOOL)shouldShowHomeName;
- (HUCCInfoMosaicGridView)infoView;
- (HUGridHomeCell)initWithFrame:(CGRect)a3;
- (HUMosaicLayoutGeometry)mosaicLayoutGeometry;
- (NSArray)cellConstraints;
- (UIImage)homeImage;
- (UIImageView)iconView;
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (UIStackView)verticalStackView;
- (UIVisualEffectView)secondaryLabelEffectView;
- (id)cellLayoutOptions;
- (id)item;
- (void)_invalidateConstraints;
- (void)_setupCell;
- (void)_updatePrimaryLabel;
- (void)layoutOptionsDidChange;
- (void)prepareForReuse;
- (void)setCellConstraints:(id)a3;
- (void)setHomeImage:(id)a3;
- (void)setIconView:(id)a3;
- (void)setInfoView:(id)a3;
- (void)setItem:(id)a3;
- (void)setMosaicLayoutGeometry:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setSecondaryLabelEffectView:(id)a3;
- (void)setShouldShowAsEmptyHome:(BOOL)a3;
- (void)setShouldShowHomeName:(BOOL)a3;
- (void)setVerticalStackView:(id)a3;
- (void)updateConstraints;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUGridHomeCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUGridHomeCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUGridHomeCell;
  v3 = -[HUGridCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_shouldShowHomeName = 0;
    v3->_shouldShowAsEmptyHome = 0;
    [(HUGridHomeCell *)v3 _setupCell];
  }
  return v4;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)HUGridHomeCell;
  [(HUGridCell *)&v5 prepareForReuse];
  [(HUGridHomeCell *)self setShouldShowHomeName:0];
  [(HUGridHomeCell *)self setShouldShowAsEmptyHome:0];
  [(HUGridHomeCell *)self setItem:0];
  v3 = [(HUGridHomeCell *)self primaryLabel];
  [v3 setText:&stru_1F18F92B8];

  v4 = [(HUGridHomeCell *)self infoView];
  [v4 resetView];
}

- (void)setShouldShowAsEmptyHome:(BOOL)a3
{
  self->_shouldShowAsEmptyHome = a3;
  BOOL v4 = [(HUGridHomeCell *)self shouldShowAsEmptyHome];
  objc_super v5 = [(HUGridHomeCell *)self infoView];
  objc_super v6 = v5;
  if (v4)
  {
    [v5 setHidden:0];

    v7 = [(HUGridHomeCell *)self iconView];
    [v7 setHidden:1];

    v8 = [(HUGridHomeCell *)self verticalStackView];
    [v8 setHidden:1];

    v9 = [(HUGridCell *)self gridBackgroundView];
    id v13 = v9;
    uint64_t v10 = 1;
  }
  else
  {
    [v5 setHidden:1];

    v11 = [(HUGridHomeCell *)self iconView];
    [v11 setHidden:0];

    v12 = [(HUGridHomeCell *)self verticalStackView];
    [v12 setHidden:0];

    v9 = [(HUGridCell *)self gridBackgroundView];
    id v13 = v9;
    uint64_t v10 = 0;
  }
  [v9 setHidden:v10];
}

- (void)_setupCell
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F42AA0]);
  [(HUGridHomeCell *)self setIconView:v3];

  BOOL v4 = [(HUGridHomeCell *)self iconView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v5 = [(HUGridHomeCell *)self iconView];
  [v5 setContentMode:1];

  objc_super v6 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  v7 = [(HUGridHomeCell *)self iconView];
  [v7 setTintColor:v6];

  v8 = [MEMORY[0x1E4F42A98] configurationWithPointSize:4 weight:38.0];
  v9 = [MEMORY[0x1E4F42A80] systemImageNamed:@"homekit"];
  uint64_t v10 = [v9 imageWithConfiguration:v8];
  v11 = [v10 imageWithRenderingMode:2];
  v12 = [(HUGridHomeCell *)self iconView];
  [v12 setImage:v11];

  id v13 = [(HUGridHomeCell *)self contentView];
  v14 = [(HUGridHomeCell *)self iconView];
  [v13 addSubview:v14];

  id v15 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [(HUGridHomeCell *)self setPrimaryLabel:v15];

  v16 = [(HUGridHomeCell *)self primaryLabel];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  v17 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  v18 = [(HUGridHomeCell *)self primaryLabel];
  [v18 setTextColor:v17];

  v19 = [(HUGridHomeCell *)self primaryLabel];
  [v19 setAdjustsFontForContentSizeCategory:1];

  v20 = [(HUGridHomeCell *)self primaryLabel];
  [v20 setNumberOfLines:2];

  id v21 = objc_alloc(MEMORY[0x1E4F43028]);
  v22 = [(HUGridCell *)self layoutOptions];
  v23 = [v22 secondaryVibrancyEffect];
  v24 = (void *)[v21 initWithEffect:v23];
  [(HUGridHomeCell *)self setSecondaryLabelEffectView:v24];

  v25 = [(HUGridHomeCell *)self secondaryLabelEffectView];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v26 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [(HUGridHomeCell *)self setSecondaryLabel:v26];

  v27 = [(HUGridHomeCell *)self secondaryLabel];
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];

  v28 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  v29 = [(HUGridHomeCell *)self secondaryLabel];
  [v29 setTextColor:v28];

  v30 = [(HUGridHomeCell *)self secondaryLabel];
  [v30 setAdjustsFontForContentSizeCategory:1];

  v31 = [(HUGridHomeCell *)self secondaryLabelEffectView];
  v32 = [v31 contentView];
  v33 = [(HUGridHomeCell *)self secondaryLabel];
  [v32 addSubview:v33];

  id v34 = objc_alloc(MEMORY[0x1E4F42E20]);
  v35 = [(HUGridHomeCell *)self primaryLabel];
  v48[0] = v35;
  v36 = [(HUGridHomeCell *)self secondaryLabelEffectView];
  v48[1] = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  v38 = (void *)[v34 initWithArrangedSubviews:v37];
  [(HUGridHomeCell *)self setVerticalStackView:v38];

  v39 = [(HUGridHomeCell *)self verticalStackView];
  [v39 setTranslatesAutoresizingMaskIntoConstraints:0];

  v40 = [(HUGridHomeCell *)self verticalStackView];
  [v40 setAxis:1];

  v41 = [(HUGridHomeCell *)self contentView];
  v42 = [(HUGridHomeCell *)self verticalStackView];
  [v41 addSubview:v42];

  v43 = [HUCCInfoMosaicGridView alloc];
  v44 = -[HUCCInfoMosaicGridView initWithFrame:](v43, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(HUGridHomeCell *)self setInfoView:v44];

  v45 = [(HUGridHomeCell *)self contentView];
  v46 = [(HUGridHomeCell *)self infoView];
  [v45 addSubview:v46];

  v47 = [(HUGridHomeCell *)self infoView];
  [v47 setHidden:1];
}

- (id)cellLayoutOptions
{
  uint64_t v3 = [(id)objc_opt_class() layoutOptionsClass];
  id v4 = [(HUGridCell *)self layoutOptions];
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v5 = v4;
    }
    else {
      objc_super v5 = 0;
    }
    objc_super v6 = v4;
    if (v5) {
      goto LABEL_8;
    }
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];
  }
  objc_super v6 = 0;
LABEL_8:

  return v6;
}

- (void)setShouldShowHomeName:(BOOL)a3
{
  if (self->_shouldShowHomeName != a3)
  {
    self->_shouldShowHomeName = a3;
    [(HUGridHomeCell *)self _updatePrimaryLabel];
  }
}

- (void)_updatePrimaryLabel
{
  if ([(HUGridHomeCell *)self shouldShowHomeName])
  {
    uint64_t v3 = [(HUGridHomeCell *)self item];
    id v4 = [v3 latestResults];
    id v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  }
  else
  {
    _HULocalizedStringWithDefaultValue(@"HUControlCenterHomeTileTitle", @"HUControlCenterHomeTileTitle", 1);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_super v5 = [(HUGridHomeCell *)self primaryLabel];
  objc_super v6 = [v5 text];
  char v7 = [v6 isEqualToString:v10];

  if ((v7 & 1) == 0)
  {
    v8 = [(HUGridHomeCell *)self primaryLabel];
    [v8 setText:v10];

    v9 = [(HUGridHomeCell *)self primaryLabel];
    [v9 sizeToFit];
  }
}

- (HUMosaicLayoutGeometry)mosaicLayoutGeometry
{
  return [(HUCCInfoMosaicGridView *)self->_infoView mosaicLayoutGeometry];
}

- (void)setMosaicLayoutGeometry:(id)a3
{
  id v4 = a3;
  id v5 = [(HUGridHomeCell *)self infoView];
  [v5 setMosaicLayoutGeometry:v4];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  v15[1] = *MEMORY[0x1E4F143B8];
  if ([(HUGridHomeCell *)self shouldShowAsEmptyHome])
  {
    v14.receiver = self;
    v14.super_class = (Class)HUGridHomeCell;
    [(HUGridCell *)&v14 updateUIWithAnimation:v3];
LABEL_8:
    id v10 = [(HUGridHomeCell *)self primaryLabel];
    [v10 setText:&stru_1F18F92B8];

    goto LABEL_9;
  }
  id v5 = [(HUGridHomeCell *)self item];
  v15[0] = *MEMORY[0x1E4F68AB8];
  objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  char v7 = [v5 resultsContainRequiredProperties:v6];

  v8 = [(HUGridHomeCell *)self item];

  if (v8 && (v7 & 1) == 0)
  {
    v9 = [(HUGridHomeCell *)self item];
    NSLog(&cfstr_ItemIsMissingR.isa, v9);
  }
  v14.receiver = self;
  v14.super_class = (Class)HUGridHomeCell;
  [(HUGridCell *)&v14 updateUIWithAnimation:v3];
  if ((v7 & 1) == 0) {
    goto LABEL_8;
  }
  [(HUGridHomeCell *)self _updatePrimaryLabel];
LABEL_9:
  v11 = [(HUGridHomeCell *)self infoView];
  v12 = _HULocalizedStringWithDefaultValue(@"HUControlCenterEmptyHomeWarning", @"HUControlCenterEmptyHomeWarning", 1);
  id v13 = _HULocalizedStringWithDefaultValue(@"HUControlCenterEmptyHomeAction", @"HUControlCenterEmptyHomeAction", 1);
  [v11 updateUIWithInfoText:v12 andActionText:v13];
}

- (void)layoutOptionsDidChange
{
  v12.receiver = self;
  v12.super_class = (Class)HUGridHomeCell;
  [(HUGridCell *)&v12 layoutOptionsDidChange];
  [(HUGridHomeCell *)self _invalidateConstraints];
  BOOL v3 = [(HUGridCell *)self layoutOptions];
  id v4 = [v3 font];
  id v5 = [(HUGridHomeCell *)self primaryLabel];
  [v5 setFont:v4];

  objc_super v6 = [(HUGridCell *)self layoutOptions];
  char v7 = [v6 font];
  v8 = [(HUGridHomeCell *)self secondaryLabel];
  [v8 setFont:v7];

  v9 = [(HUGridCell *)self layoutOptions];
  id v10 = [v9 secondaryVibrancyEffect];
  v11 = [(HUGridHomeCell *)self secondaryLabelEffectView];
  [v11 setEffect:v10];
}

- (void)_invalidateConstraints
{
  BOOL v3 = [(HUGridHomeCell *)self cellConstraints];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28DC8];
    id v5 = [(HUGridHomeCell *)self cellConstraints];
    [v4 deactivateConstraints:v5];

    [(HUGridHomeCell *)self setCellConstraints:0];
  }

  [(HUGridHomeCell *)self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  v111[19] = *MEMORY[0x1E4F143B8];
  v110.receiver = self;
  v110.super_class = (Class)HUGridHomeCell;
  [(HUGridHomeCell *)&v110 updateConstraints];
  BOOL v3 = [(HUGridHomeCell *)self cellConstraints];

  if (!v3)
  {
    v109 = [(HUGridHomeCell *)self iconView];
    v107 = [v109 leadingAnchor];
    v108 = [(HUGridHomeCell *)self contentView];
    v105 = [v108 leadingAnchor];
    v106 = [(HUGridHomeCell *)self cellLayoutOptions];
    [v106 cellInnerMargin];
    v104 = [v107 constraintEqualToAnchor:v105 constant:v4 * 1.5];
    v111[0] = v104;
    v103 = [(HUGridHomeCell *)self iconView];
    v101 = [v103 trailingAnchor];
    v102 = [(HUGridHomeCell *)self verticalStackView];
    v99 = [v102 leadingAnchor];
    v100 = [(HUGridHomeCell *)self cellLayoutOptions];
    [v100 iconInnerHorizontalMargin];
    v98 = [v101 constraintEqualToAnchor:v99 constant:-v5];
    v111[1] = v98;
    v97 = [(HUGridHomeCell *)self verticalStackView];
    v95 = [v97 trailingAnchor];
    v96 = [(HUGridHomeCell *)self contentView];
    v93 = [v96 trailingAnchor];
    v94 = [(HUGridHomeCell *)self cellLayoutOptions];
    [v94 cellInnerMargin];
    v92 = [v95 constraintEqualToAnchor:v93 constant:v6 * -1.5];
    v111[2] = v92;
    v91 = [(HUGridHomeCell *)self secondaryLabel];
    v89 = [v91 leadingAnchor];
    v90 = [(HUGridHomeCell *)self secondaryLabelEffectView];
    v88 = [v90 leadingAnchor];
    v87 = [v89 constraintEqualToAnchor:v88];
    v111[3] = v87;
    v86 = [(HUGridHomeCell *)self secondaryLabel];
    v84 = [v86 trailingAnchor];
    v85 = [(HUGridHomeCell *)self secondaryLabelEffectView];
    v83 = [v85 trailingAnchor];
    v82 = [v84 constraintEqualToAnchor:v83];
    v111[4] = v82;
    v81 = [(HUGridHomeCell *)self iconView];
    v79 = [v81 topAnchor];
    v80 = [(HUGridHomeCell *)self contentView];
    v77 = [v80 topAnchor];
    v78 = [(HUGridHomeCell *)self cellLayoutOptions];
    [v78 cellInnerMargin];
    v76 = objc_msgSend(v79, "constraintGreaterThanOrEqualToAnchor:constant:", v77);
    v111[5] = v76;
    v75 = [(HUGridHomeCell *)self iconView];
    v73 = [v75 bottomAnchor];
    v74 = [(HUGridHomeCell *)self contentView];
    v71 = [v74 bottomAnchor];
    v72 = [(HUGridHomeCell *)self cellLayoutOptions];
    [v72 cellInnerMargin];
    v70 = [v73 constraintLessThanOrEqualToAnchor:v71 constant:-v7];
    v111[6] = v70;
    v69 = [(HUGridHomeCell *)self iconView];
    v67 = [v69 centerYAnchor];
    v68 = [(HUGridHomeCell *)self contentView];
    v66 = [v68 centerYAnchor];
    v65 = [v67 constraintEqualToAnchor:v66];
    v111[7] = v65;
    v64 = [(HUGridHomeCell *)self verticalStackView];
    v62 = [v64 topAnchor];
    v63 = [(HUGridHomeCell *)self contentView];
    v60 = [v63 topAnchor];
    v61 = [(HUGridHomeCell *)self cellLayoutOptions];
    [v61 cellInnerMargin];
    v59 = objc_msgSend(v62, "constraintGreaterThanOrEqualToAnchor:constant:", v60);
    v111[8] = v59;
    v58 = [(HUGridHomeCell *)self verticalStackView];
    v56 = [v58 bottomAnchor];
    v57 = [(HUGridHomeCell *)self contentView];
    v54 = [v57 bottomAnchor];
    v55 = [(HUGridHomeCell *)self cellLayoutOptions];
    [v55 cellInnerMargin];
    v53 = [v56 constraintLessThanOrEqualToAnchor:v54 constant:-v8];
    v111[9] = v53;
    v52 = [(HUGridHomeCell *)self verticalStackView];
    v50 = [v52 centerYAnchor];
    v51 = [(HUGridHomeCell *)self contentView];
    v49 = [v51 centerYAnchor];
    v48 = [v50 constraintEqualToAnchor:v49];
    v111[10] = v48;
    v47 = [(HUGridHomeCell *)self secondaryLabel];
    v45 = [v47 topAnchor];
    v46 = [(HUGridHomeCell *)self secondaryLabelEffectView];
    v44 = [v46 topAnchor];
    v43 = [v45 constraintEqualToAnchor:v44];
    v111[11] = v43;
    v42 = [(HUGridHomeCell *)self secondaryLabel];
    v40 = [v42 bottomAnchor];
    v41 = [(HUGridHomeCell *)self secondaryLabelEffectView];
    v39 = [v41 bottomAnchor];
    v38 = [v40 constraintEqualToAnchor:v39];
    v111[12] = v38;
    v37 = [(HUGridHomeCell *)self iconView];
    v36 = [v37 widthAnchor];
    v35 = [v36 constraintEqualToConstant:38.0];
    v111[13] = v35;
    id v34 = [(HUGridHomeCell *)self iconView];
    v33 = [v34 heightAnchor];
    v32 = [v33 constraintEqualToConstant:38.0];
    v111[14] = v32;
    v31 = [(HUGridHomeCell *)self infoView];
    v29 = [v31 leadingAnchor];
    v30 = [(HUGridHomeCell *)self contentView];
    v28 = [v30 leadingAnchor];
    v27 = [v29 constraintEqualToAnchor:v28];
    v111[15] = v27;
    id v26 = [(HUGridHomeCell *)self infoView];
    v24 = [v26 trailingAnchor];
    v25 = [(HUGridHomeCell *)self contentView];
    v23 = [v25 trailingAnchor];
    v22 = [v24 constraintEqualToAnchor:v23];
    v111[16] = v22;
    id v21 = [(HUGridHomeCell *)self infoView];
    v20 = [v21 topAnchor];
    v9 = [(HUGridHomeCell *)self contentView];
    id v10 = [v9 topAnchor];
    v11 = [v20 constraintEqualToAnchor:v10];
    v111[17] = v11;
    objc_super v12 = [(HUGridHomeCell *)self infoView];
    id v13 = [v12 bottomAnchor];
    objc_super v14 = [(HUGridHomeCell *)self contentView];
    id v15 = [v14 bottomAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    v111[18] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:19];
    [(HUGridHomeCell *)self setCellConstraints:v17];

    v18 = (void *)MEMORY[0x1E4F28DC8];
    v19 = [(HUGridHomeCell *)self cellConstraints];
    [v18 activateConstraints:v19];
  }
}

- (id)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
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

- (UIStackView)verticalStackView
{
  return self->_verticalStackView;
}

- (void)setVerticalStackView:(id)a3
{
}

- (BOOL)shouldShowHomeName
{
  return self->_shouldShowHomeName;
}

- (BOOL)shouldShowAsEmptyHome
{
  return self->_shouldShowAsEmptyHome;
}

- (UIImage)homeImage
{
  return self->_homeImage;
}

- (void)setHomeImage:(id)a3
{
}

- (UIVisualEffectView)secondaryLabelEffectView
{
  return self->_secondaryLabelEffectView;
}

- (void)setSecondaryLabelEffectView:(id)a3
{
}

- (NSArray)cellConstraints
{
  return self->_cellConstraints;
}

- (void)setCellConstraints:(id)a3
{
}

- (HUCCInfoMosaicGridView)infoView
{
  return self->_infoView;
}

- (void)setInfoView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoView, 0);
  objc_storeStrong((id *)&self->_cellConstraints, 0);
  objc_storeStrong((id *)&self->_secondaryLabelEffectView, 0);
  objc_storeStrong((id *)&self->_homeImage, 0);
  objc_storeStrong((id *)&self->_verticalStackView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end