@interface HKDisplayTypeContextVerticalCollectionViewCell
+ (id)reuseIdentifier;
- (HKDisplayTypeContextItem)contextItem;
- (HKDisplayTypeContextVerticalCollectionViewCell)initWithFrame:(CGRect)a3;
- (HKDisplayTypeContextVerticalCollectionViewCellDelegate)delegate;
- (HKUIMetricColors)currentMetricColors;
- (NSLayoutConstraint)minTitleWidthConstraint;
- (UIButton)infoButton;
- (UILabel)titleLabel;
- (UILabel)valueAndUnitLabel;
- (UIStackView)contentStackView;
- (id)_attributedTitleWithAccessoryForContextItem:(id)a3 selected:(BOOL)a4;
- (id)_attributedValueAndUnitForContextItem:(id)a3 selected:(BOOL)a4;
- (id)_backgroundViewWithColor:(id)a3 userInteractive:(BOOL)a4;
- (id)_generateInfoButton;
- (id)_labelWithFont:(id)a3 allowsMultiline:(BOOL)a4 supportsDyanmicType:(BOOL)a5 layoutPriority:(float)a6;
- (id)_stackViewWithArrangedSubviews:(id)a3;
- (id)_titleAttributes;
- (id)_unitStringForContextItem:(id)a3 isUnitStringIncludedInValueString:(BOOL)a4;
- (id)_updateAttributedString:(id)a3 withTraitCollection:(id)a4;
- (int64_t)_widthDesignationFromTraitCollection:(id)a3;
- (int64_t)mode;
- (void)_configureForContextItem:(id)a3;
- (void)_setLabel:(id)a3 allowsMultiline:(BOOL)a4 textAlignment:(int64_t)a5 layoutPriority:(float)a6;
- (void)_updateLabelsMultilineAndAlignmentForContentSizeCategoryAndUIDirection;
- (void)_updateUI:(BOOL)a3;
- (void)configureForTraitCollection;
- (void)infoButtonTapped:(id)a3;
- (void)prepareForReuse;
- (void)setContentStackView:(id)a3;
- (void)setContextItem:(id)a3;
- (void)setCurrentMetricColors:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInfoButton:(id)a3;
- (void)setMinTitleWidthConstraint:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)setValueAndUnitLabel:(id)a3;
- (void)updateWithContextItem:(id)a3 mode:(int64_t)a4;
@end

@implementation HKDisplayTypeContextVerticalCollectionViewCell

- (HKDisplayTypeContextVerticalCollectionViewCell)initWithFrame:(CGRect)a3
{
  v49[3] = *MEMORY[0x1E4F143B8];
  v47.receiver = self;
  v47.super_class = (Class)HKDisplayTypeContextVerticalCollectionViewCell;
  v3 = -[HKDisplayTypeContextVerticalCollectionViewCell initWithFrame:](&v47, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartOverlaySectionItemTitleFont");
    LODWORD(v5) = 1132068864;
    uint64_t v6 = [(HKDisplayTypeContextVerticalCollectionViewCell *)v3 _labelWithFont:v4 allowsMultiline:1 supportsDyanmicType:1 layoutPriority:v5];
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v6;

    v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartOverlaySectionItemValueAndUnitFont");
    LODWORD(v9) = 1148813312;
    uint64_t v10 = [(HKDisplayTypeContextVerticalCollectionViewCell *)v3 _labelWithFont:v8 allowsMultiline:1 supportsDyanmicType:1 layoutPriority:v9];
    valueAndUnitLabel = v3->_valueAndUnitLabel;
    v3->_valueAndUnitLabel = (UILabel *)v10;

    uint64_t v12 = [(HKDisplayTypeContextVerticalCollectionViewCell *)v3 _generateInfoButton];
    infoButton = v3->_infoButton;
    v3->_infoButton = (UIButton *)v12;

    v49[0] = v3->_titleLabel;
    v49[1] = v3->_valueAndUnitLabel;
    v49[2] = v3->_infoButton;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
    uint64_t v15 = [(HKDisplayTypeContextVerticalCollectionViewCell *)v3 _stackViewWithArrangedSubviews:v14];
    contentStackView = v3->_contentStackView;
    v3->_contentStackView = (UIStackView *)v15;

    [(HKDisplayTypeContextVerticalCollectionViewCell *)v3 configureForTraitCollection];
    v17 = [(HKDisplayTypeContextVerticalCollectionViewCell *)v3 contentView];
    [v17 addSubview:v3->_contentStackView];

    v18 = [(UILabel *)v3->_titleLabel widthAnchor];
    v19 = [(HKDisplayTypeContextVerticalCollectionViewCell *)v3 contentView];
    v20 = [v19 widthAnchor];
    uint64_t v21 = [v18 constraintGreaterThanOrEqualToAnchor:v20 multiplier:0.25];
    minTitleWidthConstraint = v3->_minTitleWidthConstraint;
    v3->_minTitleWidthConstraint = (NSLayoutConstraint *)v21;

    LODWORD(v23) = 1148829696;
    [(NSLayoutConstraint *)v3->_minTitleWidthConstraint setPriority:v23];
    [(NSLayoutConstraint *)v3->_minTitleWidthConstraint setActive:1];
    v39 = (void *)MEMORY[0x1E4F28DC8];
    v45 = [(UIStackView *)v3->_contentStackView topAnchor];
    v46 = [(HKDisplayTypeContextVerticalCollectionViewCell *)v3 contentView];
    v44 = [v46 topAnchor];
    v43 = [v45 constraintEqualToAnchor:v44];
    v48[0] = v43;
    v41 = [(UIStackView *)v3->_contentStackView leadingAnchor];
    v42 = [(HKDisplayTypeContextVerticalCollectionViewCell *)v3 contentView];
    v40 = [v42 leadingAnchor];
    v38 = [v41 constraintEqualToAnchor:v40];
    v48[1] = v38;
    v24 = [(UIStackView *)v3->_contentStackView bottomAnchor];
    v25 = [(HKDisplayTypeContextVerticalCollectionViewCell *)v3 contentView];
    v26 = [v25 bottomAnchor];
    v27 = [v24 constraintEqualToAnchor:v26];
    v48[2] = v27;
    v28 = [(UIStackView *)v3->_contentStackView trailingAnchor];
    v29 = [(HKDisplayTypeContextVerticalCollectionViewCell *)v3 contentView];
    v30 = [v29 trailingAnchor];
    v31 = [v28 constraintEqualToAnchor:v30];
    v48[3] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:4];
    [v39 activateConstraints:v32];

    v33 = [(HKDisplayTypeContextVerticalCollectionViewCell *)v3 contentView];
    v34 = [v33 layer];
    [v34 setCornerRadius:10.0];

    v35 = [(HKDisplayTypeContextVerticalCollectionViewCell *)v3 contentView];
    v36 = [v35 layer];
    [v36 setMasksToBounds:1];
  }
  return v3;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HKDisplayTypeContextVerticalCollectionViewCell;
  -[HKDisplayTypeContextVerticalCollectionViewCell setSelected:](&v5, sel_setSelected_);
  [(HKDisplayTypeContextVerticalCollectionViewCell *)self _updateUI:v3];
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)HKDisplayTypeContextVerticalCollectionViewCell;
  [(HKDisplayTypeContextVerticalCollectionViewCell *)&v6 prepareForReuse];
  [(HKDisplayTypeContextVerticalCollectionViewCell *)self setSelected:0];
  BOOL v3 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self titleLabel];
  [v3 setText:0];

  v4 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self valueAndUnitLabel];
  [v4 setText:0];

  objc_super v5 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self valueAndUnitLabel];
  [v5 setAttributedText:0];

  [(HKDisplayTypeContextVerticalCollectionViewCell *)self configureForTraitCollection];
}

- (void)updateWithContextItem:(id)a3 mode:(int64_t)a4
{
  id v6 = a3;
  [(HKDisplayTypeContextVerticalCollectionViewCell *)self setContextItem:v6];
  [(HKDisplayTypeContextVerticalCollectionViewCell *)self setMode:a4];
  [(HKDisplayTypeContextVerticalCollectionViewCell *)self _configureForContextItem:v6];
}

+ (id)reuseIdentifier
{
  return @"HKDisplayTypeContextVerticalCollectionViewCell";
}

- (int64_t)_widthDesignationFromTraitCollection:(id)a3
{
  id v3 = a3;
  int64_t v4 = [v3 valueForNSIntegerTrait:objc_opt_class()];

  return v4;
}

- (void)configureForTraitCollection
{
  id v3 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self traitCollection];
  int64_t v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (!IsAccessibilityCategory)
  {
    v8 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self contentStackView];
    double v9 = v8;
    goto LABEL_6;
  }
  id v6 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self traitCollection];
  int64_t v7 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self _widthDesignationFromTraitCollection:v6];

  if ((unint64_t)(v7 - 1) >= 4)
  {
    if ((unint64_t)(v7 - 5) >= 2) {
      return;
    }
    uint64_t v12 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self traitCollection];
    v13 = [v12 preferredContentSizeCategory];
    unint64_t v14 = *MEMORY[0x1E4FB2780];

    v8 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self contentStackView];
    double v9 = v8;
    if ((unint64_t)v13 >= v14) {
      goto LABEL_4;
    }
LABEL_6:
    [v8 setAxis:0];

    uint64_t v10 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self contentStackView];
    id v15 = v10;
    uint64_t v11 = 3;
    goto LABEL_7;
  }
  v8 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self contentStackView];
  double v9 = v8;
LABEL_4:
  [v8 setAxis:1];

  uint64_t v10 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self contentStackView];
  id v15 = v10;
  uint64_t v11 = 1;
LABEL_7:
  [v10 setAlignment:v11];
}

- (void)_configureForContextItem:(id)a3
{
  id v22 = a3;
  if ([v22 hasTitleAccessory])
  {
    int64_t v4 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self _attributedTitleWithAccessoryForContextItem:v22 selected:0];
    objc_super v5 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self titleLabel];
    [v5 setAttributedText:v4];
  }
  else
  {
    int64_t v4 = [v22 title];
    objc_super v5 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self titleLabel];
    [v5 setText:v4];
  }

  id v6 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self _attributedValueAndUnitForContextItem:v22 selected:1];
  int64_t v7 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self valueAndUnitLabel];
  [v7 setAttributedText:v6];

  v8 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self contentStackView];
  double v9 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self titleLabel];
  [v8 setCustomSpacing:v9 afterView:14.0];

  uint64_t v10 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self contentStackView];
  uint64_t v11 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self valueAndUnitLabel];
  [v10 setCustomSpacing:v11 afterView:5.0];

  uint64_t v12 = [v22 accessibilityIdentifier];
  if (v12)
  {
    v13 = [v22 accessibilityIdentifier];
    [(HKDisplayTypeContextVerticalCollectionViewCell *)self setAccessibilityIdentifier:v13];
  }
  else
  {
    [(HKDisplayTypeContextVerticalCollectionViewCell *)self setAccessibilityIdentifier:@"UnknownOverlayContext"];
  }

  unint64_t v14 = [v22 metricColors];
  id v15 = [v14 keyColor];
  v16 = -[HKDisplayTypeContextVerticalCollectionViewCell _backgroundViewWithColor:userInteractive:](self, "_backgroundViewWithColor:userInteractive:", v15, [v22 userInteractive]);
  [(HKDisplayTypeContextVerticalCollectionViewCell *)self setBackgroundView:v16];

  v17 = [v22 selectedMetricColors];
  v18 = [v17 keyColor];
  v19 = -[HKDisplayTypeContextVerticalCollectionViewCell _backgroundViewWithColor:userInteractive:](self, "_backgroundViewWithColor:userInteractive:", v18, [v22 userInteractive]);
  [(HKDisplayTypeContextVerticalCollectionViewCell *)self setSelectedBackgroundView:v19];

  uint64_t v20 = [v22 infoHidden];
  uint64_t v21 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self infoButton];
  [v21 setHidden:v20];

  [(HKDisplayTypeContextVerticalCollectionViewCell *)self _updateUI:[(HKDisplayTypeContextVerticalCollectionViewCell *)self isSelected]];
  [(HKDisplayTypeContextVerticalCollectionViewCell *)self _updateLabelsMultilineAndAlignmentForContentSizeCategoryAndUIDirection];
}

- (void)_updateLabelsMultilineAndAlignmentForContentSizeCategoryAndUIDirection
{
  id v3 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self traitCollection];
  int64_t v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  id v6 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self titleLabel];
  LODWORD(v7) = 1132068864;
  [(HKDisplayTypeContextVerticalCollectionViewCell *)self _setLabel:v6 allowsMultiline:1 textAlignment:4 layoutPriority:v7];

  if ([(UIView *)self hk_isLeftToRight] && !IsAccessibilityCategory) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 0;
  }
  id v10 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self valueAndUnitLabel];
  LODWORD(v9) = 1148813312;
  [(HKDisplayTypeContextVerticalCollectionViewCell *)self _setLabel:v10 allowsMultiline:1 textAlignment:v8 layoutPriority:v9];
}

- (id)_attributedTitleWithAccessoryForContextItem:(id)a3 selected:(BOOL)a4
{
  id v6 = a3;
  double v7 = v6;
  if (a4)
  {
    uint64_t v8 = [v6 selectedTitleAccessory];
    double v9 = [v8 systemImageName];

    [v7 selectedTitleAccessory];
  }
  else
  {
    id v10 = [v6 titleAccessory];
    double v9 = [v10 systemImageName];

    [v7 titleAccessory];
  uint64_t v11 = };
  uint64_t v12 = [v11 color];

  v13 = (void *)MEMORY[0x1E4FB1830];
  unint64_t v14 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartOverlaySectionItemTitleFont");
  id v15 = [v13 configurationWithFont:v14 scale:1];

  v16 = [MEMORY[0x1E4FB1818] systemImageNamed:v9 withConfiguration:v15];
  id v17 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  v18 = [v16 imageWithRenderingMode:2];
  [v17 setImage:v18];

  id v19 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  uint64_t v20 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v17];
  [v19 appendAttributedString:v20];

  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
  [v19 appendAttributedString:v21];

  objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v12, 0, objc_msgSend(v19, "length"));
  id v22 = objc_alloc(MEMORY[0x1E4F28B18]);
  double v23 = [v7 title];
  v24 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self _titleAttributes];
  v25 = (void *)[v22 initWithString:v23 attributes:v24];
  [v19 appendAttributedString:v25];

  v26 = (void *)[v19 copy];
  return v26;
}

- (id)_attributedValueAndUnitForContextItem:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  v41[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 attributedLabelTextOverride];

  if (v7)
  {
    uint64_t v8 = [v6 attributedLabelTextOverride];
    double v9 = [v8 attributedLabelTextWithSelectionState:v4];

    id v10 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self traitCollection];
    uint64_t v11 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self _updateAttributedString:v9 withTraitCollection:v10];

    goto LABEL_25;
  }
  uint64_t v12 = [v6 value];
  uint64_t v13 = [v6 unit];
  if (v13)
  {
    unint64_t v14 = (void *)v13;
    uint64_t v15 = [v6 isUnitIncludedInValue];
  }
  else
  {
    uint64_t v15 = 0;
  }
  v16 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self _unitStringForContextItem:v6 isUnitStringIncludedInValueString:v15];
  int v39 = v15;
  if (v16)
  {
    int v17 = [v6 useTightSpacingBetweenValueAndUnit];
    v18 = @" ";
    if (v17) {
      v18 = @" ";
    }
    id v19 = [NSString stringWithFormat:@"%@%@%@", v12, v18, v16];
  }
  else
  {
    id v19 = v12;
  }
  uint64_t v20 = v19;
  uint64_t v40 = *MEMORY[0x1E4FB06F8];
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartOverlaySectionItemValueAndUnitFont");
  v41[0] = v21;
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v20 attributes:v22];
  double v23 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self currentMetricColors];
  v24 = [v23 contextViewPrimaryTextColor];

  if (!v4)
  {
    v26 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self currentMetricColors];
    id v25 = [v26 contextViewSecondaryTextColor];

    if (!v12) {
      goto LABEL_17;
    }
LABEL_15:
    if (v24)
    {
      uint64_t v27 = *MEMORY[0x1E4FB0700];
      uint64_t v28 = [v20 rangeOfString:v12];
      objc_msgSend(v11, "addAttribute:value:range:", v27, v24, v28, v29);
    }
    goto LABEL_17;
  }
  id v25 = v24;
  if (v12) {
    goto LABEL_15;
  }
LABEL_17:
  if (v16 && v25)
  {
    uint64_t v30 = *MEMORY[0x1E4FB0700];
    uint64_t v31 = [v20 rangeOfString:v16];
    objc_msgSend(v11, "addAttribute:value:range:", v30, v25, v31, v32);
  }
  int v33 = v39;
  if (!v25) {
    int v33 = 0;
  }
  if (v33 == 1)
  {
    uint64_t v34 = *MEMORY[0x1E4FB0700];
    v35 = [v6 unit];
    uint64_t v36 = [v20 rangeOfString:v35];
    objc_msgSend(v11, "addAttribute:value:range:", v34, v25, v36, v37);
  }
LABEL_25:

  return v11;
}

- (id)_updateAttributedString:(id)a3 withTraitCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    double v7 = (void *)[v5 mutableCopy];
    uint64_t v8 = [v7 length];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    unint64_t v14 = __94__HKDisplayTypeContextVerticalCollectionViewCell__updateAttributedString_withTraitCollection___block_invoke;
    uint64_t v15 = &unk_1E6D531D0;
    id v16 = v6;
    id v17 = v7;
    id v9 = v7;
    objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", 0, v8, 0, &v12);
    id v10 = (id)objc_msgSend(v9, "copy", v12, v13, v14, v15);
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

void __94__HKDisplayTypeContextVerticalCollectionViewCell__updateAttributedString_withTraitCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *MEMORY[0x1E4FB06F8];
  uint64_t v8 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  if (v8)
  {
    id v10 = v8;
    id v9 = [v8 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:*(void *)(a1 + 32)];
    objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", v7, a3, a4);
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", v7, v9, a3, a4);

    uint64_t v8 = v10;
  }
}

- (id)_unitStringForContextItem:(id)a3 isUnitStringIncludedInValueString:(BOOL)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [v5 unit];
  }
  uint64_t v8 = [v6 valueContext];

  if (v8)
  {
    id v9 = NSString;
    uint64_t v10 = [v6 valueContext];
    uint64_t v11 = (void *)v10;
    if (v7) {
      [v9 stringWithFormat:@"%@ (%@)", v7, v10];
    }
    else {
    uint64_t v12 = [v9 stringWithFormat:@"(%@)", v10, v14];
    }

    uint64_t v7 = (void *)v12;
  }

  return v7;
}

- (id)_titleAttributes
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = *MEMORY[0x1E4FB06F8];
  id v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartOverlaySectionItemTitleFont");
  v10[0] = v3;
  v9[1] = *MEMORY[0x1E4FB0700];
  BOOL v4 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self currentMetricColors];
  id v5 = [v4 contextViewPrimaryTextColor];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4FB1618] labelColor];
  }
  v10[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (!v5) {

  }
  return v7;
}

- (void)_updateUI:(BOOL)a3
{
  BOOL v3 = a3;
  contextItem = self->_contextItem;
  if (a3) {
    [(HKDisplayTypeContextItem *)contextItem selectedMetricColors];
  }
  else {
  id v6 = [(HKDisplayTypeContextItem *)contextItem metricColors];
  }
  [(HKDisplayTypeContextVerticalCollectionViewCell *)self setCurrentMetricColors:v6];

  if ([(HKDisplayTypeContextItem *)self->_contextItem hasTitleAccessory])
  {
    uint64_t v7 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self _attributedTitleWithAccessoryForContextItem:self->_contextItem selected:v3];
    [(UILabel *)self->_titleLabel setAttributedText:v7];
  }
  else
  {
    uint64_t v7 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self currentMetricColors];
    uint64_t v8 = [v7 contextViewPrimaryTextColor];
    [(UILabel *)self->_titleLabel setTextColor:v8];
  }
  id v9 = self->_contextItem;
  if (v9)
  {
    uint64_t v10 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self _attributedValueAndUnitForContextItem:v9 selected:v3];
    [(UILabel *)self->_valueAndUnitLabel setAttributedText:v10];

    if (v3)
    {
LABEL_9:
      uint64_t v11 = [(UILabel *)self->_valueAndUnitLabel textColor];
      goto LABEL_12;
    }
  }
  else
  {
    -[UILabel setAttributedText:](self->_valueAndUnitLabel, "setAttributedText:");
    if (v3) {
      goto LABEL_9;
    }
  }
  uint64_t v11 = [MEMORY[0x1E4FB1618] systemBlueColor];
LABEL_12:
  id v12 = (id)v11;
  [(UIButton *)self->_infoButton setTintColor:v11];
}

- (id)_backgroundViewWithColor:(id)a3 userInteractive:(BOOL)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4FB1618];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __91__HKDisplayTypeContextVerticalCollectionViewCell__backgroundViewWithColor_userInteractive___block_invoke;
    uint64_t v20 = &unk_1E6D531F8;
    BOOL v22 = a4;
    id v21 = v5;
    id v9 = [v8 colorWithDynamicProvider:&v17];
    objc_msgSend(v7, "setBackgroundColor:", v9, v17, v18, v19, v20);
  }
  else
  {
    [v6 setBackgroundColor:0];
  }
  uint64_t v10 = [v7 layer];
  [v10 setCornerRadius:10.0];

  uint64_t v11 = *MEMORY[0x1E4F39EA8];
  id v12 = [v7 layer];
  [v12 setCornerCurve:v11];

  [v7 setClipsToBounds:1];
  if (!a4)
  {
    uint64_t v13 = [v5 CGColor];
    uint64_t v14 = [v7 layer];
    [v14 setBorderColor:v13];

    uint64_t v15 = [v7 layer];
    [v15 setBorderWidth:1.0];
  }
  return v7;
}

id __91__HKDisplayTypeContextVerticalCollectionViewCell__backgroundViewWithColor_userInteractive___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v1 = *(id *)(a1 + 32);
  }
  else
  {
    id v1 = [MEMORY[0x1E4FB1618] clearColor];
  }
  return v1;
}

- (id)_stackViewWithArrangedSubviews:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x1E4FB1C60];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithArrangedSubviews:v4];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setSpacing:4.0];
  [v5 setAlignment:1];
  [v5 setDistribution:0];
  [v5 setLayoutMarginsRelativeArrangement:1];
  objc_msgSend(v5, "setLayoutMargins:", 16.0, 16.0, 16.0, 16.0);
  return v5;
}

- (id)_generateInfoButton
{
  BOOL v3 = [MEMORY[0x1E4FB14D0] buttonWithType:4];
  id v4 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [v3 setTintColor:v4];

  [v3 addTarget:self action:sel_infoButtonTapped_ forControlEvents:64];
  LODWORD(v5) = 1148813312;
  [v3 setContentHuggingPriority:0 forAxis:v5];
  LODWORD(v6) = 1148813312;
  [v3 setContentCompressionResistancePriority:0 forAxis:v6];
  return v3;
}

- (void)infoButtonTapped:(id)a3
{
  id v4 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self delegate];

  if (v4)
  {
    id v5 = [(HKDisplayTypeContextVerticalCollectionViewCell *)self delegate];
    [v5 didTapOnInfoButtonForCollectionViewCell:self];
  }
}

- (id)_labelWithFont:(id)a3 allowsMultiline:(BOOL)a4 supportsDyanmicType:(BOOL)a5 layoutPriority:(float)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v10 = (objc_class *)MEMORY[0x1E4FB1930];
  id v11 = a3;
  id v12 = [v10 alloc];
  uint64_t v13 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v13 setFont:v11];

  [v13 setAdjustsFontForContentSizeCategory:v7];
  uint64_t v14 = [MEMORY[0x1E4FB1618] whiteColor];
  [v13 setTextColor:v14];

  uint64_t v15 = [MEMORY[0x1E4FB1618] clearColor];
  [v13 setBackgroundColor:v15];

  [v13 setClipsToBounds:0];
  *(float *)&double v16 = a6;
  [(HKDisplayTypeContextVerticalCollectionViewCell *)self _setLabel:v13 allowsMultiline:v8 textAlignment:4 layoutPriority:v16];
  return v13;
}

- (void)_setLabel:(id)a3 allowsMultiline:(BOOL)a4 textAlignment:(int64_t)a5 layoutPriority:(float)a6
{
  BOOL v8 = a4;
  id v13 = a3;
  BOOL v9 = !v8;
  [v13 setNumberOfLines:v9];
  [v13 setTextAlignment:a5];
  double v10 = 0.0;
  if (!v9)
  {
    objc_msgSend(v13, "setLineBreakMode:", 0, 0.0);
    LODWORD(v10) = 1.0;
  }
  [v13 _setHyphenationFactor:v10];
  *(float *)&double v11 = a6;
  [v13 setContentCompressionResistancePriority:0 forAxis:v11];
  *(float *)&double v12 = a6;
  [v13 setContentHuggingPriority:0 forAxis:v12];
}

- (HKDisplayTypeContextVerticalCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKDisplayTypeContextVerticalCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HKDisplayTypeContextItem)contextItem
{
  return self->_contextItem;
}

- (void)setContextItem:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)valueAndUnitLabel
{
  return self->_valueAndUnitLabel;
}

- (void)setValueAndUnitLabel:(id)a3
{
}

- (UIButton)infoButton
{
  return self->_infoButton;
}

- (void)setInfoButton:(id)a3
{
}

- (UIStackView)contentStackView
{
  return self->_contentStackView;
}

- (void)setContentStackView:(id)a3
{
}

- (HKUIMetricColors)currentMetricColors
{
  return self->_currentMetricColors;
}

- (void)setCurrentMetricColors:(id)a3
{
}

- (NSLayoutConstraint)minTitleWidthConstraint
{
  return self->_minTitleWidthConstraint;
}

- (void)setMinTitleWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minTitleWidthConstraint, 0);
  objc_storeStrong((id *)&self->_currentMetricColors, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_valueAndUnitLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contextItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end