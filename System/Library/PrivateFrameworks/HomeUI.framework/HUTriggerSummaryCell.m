@interface HUTriggerSummaryCell
- (BOOL)canBeSelected;
- (BOOL)hideDescription;
- (BOOL)hideDescriptionIcon;
- (BOOL)hideTitle;
- (BOOL)isDisabled;
- (HFItem)item;
- (HUIconListView)iconContainerView;
- (HUTriggerSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)horizontalLabelConstraints;
- (NSArray)iconDescriptors;
- (NSArray)verticalLabelConstraints;
- (NSString)descriptionText;
- (NSString)titleText;
- (UIColor)cellColor;
- (UIFont)descriptionFont;
- (UIFont)titleFont;
- (UIImage)descriptionIcon;
- (UIImageView)descriptionIconView;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (UIView)textContainerView;
- (double)textAlpha;
- (void)_addDescriptionIconView;
- (void)_addDescriptionLabel;
- (void)_addTitleLabel;
- (void)prepareForReuse;
- (void)setCanBeSelected:(BOOL)a3;
- (void)setDescriptionFont:(id)a3;
- (void)setDescriptionIcon:(id)a3;
- (void)setDescriptionIconView:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setHideDescription:(BOOL)a3;
- (void)setHideDescriptionIcon:(BOOL)a3;
- (void)setHideTitle:(BOOL)a3;
- (void)setHorizontalLabelConstraints:(id)a3;
- (void)setIconContainerView:(id)a3;
- (void)setIconDescriptors:(id)a3;
- (void)setItem:(id)a3;
- (void)setTextAlpha:(double)a3;
- (void)setTextContainerView:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setUpIconContainerViewConstraints;
- (void)setUpTextContainerViewConstraints;
- (void)setVerticalLabelConstraints:(id)a3;
- (void)updateConstraints;
- (void)updateHorizontalLabelConstraints;
- (void)updateSelectionUI;
- (void)updateTitle;
- (void)updateUIIconsWithResults:(id)a3;
- (void)updateUITextWithResults:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
- (void)updateVerticalLabelConstraints;
@end

@implementation HUTriggerSummaryCell

- (HUTriggerSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)HUTriggerSummaryCell;
  v4 = [(HUTriggerSummaryCell *)&v18 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438A0]];
    titleFont = v4->_titleFont;
    v4->_titleFont = (UIFont *)v5;

    uint64_t v7 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
    descriptionFont = v4->_descriptionFont;
    v4->_descriptionFont = (UIFont *)v7;

    v4->_textAlpha = 1.0;
    v4->_hideDescriptionIcon = 1;
    v9 = objc_alloc_init(HUIconListView);
    iconContainerView = v4->_iconContainerView;
    v4->_iconContainerView = v9;

    [(HUIconListView *)v4->_iconContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [MEMORY[0x1E4F428B8] clearColor];
    [(HUIconListView *)v4->_iconContainerView setBackgroundColor:v11];

    v12 = [(HUTriggerSummaryCell *)v4 contentView];
    [v12 addSubview:v4->_iconContainerView];

    [(HUTriggerSummaryCell *)v4 setUpIconContainerViewConstraints];
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    textContainerView = v4->_textContainerView;
    v4->_textContainerView = v13;

    [(UIView *)v4->_textContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = [(HUTriggerSummaryCell *)v4 contentView];
    [v15 addSubview:v4->_textContainerView];

    [(HUTriggerSummaryCell *)v4 setUpTextContainerViewConstraints];
    [(HUTriggerSummaryCell *)v4 _addTitleLabel];
    [(HUTriggerSummaryCell *)v4 _addDescriptionLabel];
    v16 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
    [(HUTriggerSummaryCell *)v4 setCellColor:v16];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HUTriggerSummaryCell;
  [(HUTriggerSummaryCell *)&v3 prepareForReuse];
  [(HUTriggerSummaryCell *)self setHideTitle:0];
  [(HUTriggerSummaryCell *)self setTitleText:0];
  [(HUTriggerSummaryCell *)self setDisabled:0];
  [(HUTriggerSummaryCell *)self setCanBeSelected:1];
  [(HUTriggerSummaryCell *)self setHideDescription:0];
  [(HUTriggerSummaryCell *)self setDescriptionText:0];
}

- (void)setIconDescriptors:(id)a3
{
  id v4 = a3;
  id v5 = [(HUTriggerSummaryCell *)self iconContainerView];
  [v5 setIconDescriptors:v4];
}

- (UILabel)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    [(HUTriggerSummaryCell *)self _addTitleLabel];
    titleLabel = self->_titleLabel;
  }

  return titleLabel;
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
  id v5 = a3;
  id v6 = [(HUTriggerSummaryCell *)self titleLabel];
  [v6 setText:v5];
}

- (void)setHideTitle:(BOOL)a3
{
  if (self->_hideTitle != a3)
  {
    self->_hideTitle = a3;
    if (a3) {
      [(UILabel *)self->_titleLabel removeFromSuperview];
    }
    else {
      [(HUTriggerSummaryCell *)self _addTitleLabel];
    }
    [(HUTriggerSummaryCell *)self setNeedsUpdateConstraints];
  }
}

- (UILabel)descriptionLabel
{
  descriptionLabel = self->_descriptionLabel;
  if (!descriptionLabel)
  {
    [(HUTriggerSummaryCell *)self _addDescriptionLabel];
    descriptionLabel = self->_descriptionLabel;
  }

  return descriptionLabel;
}

- (void)setDescriptionText:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionText, a3);
  id v5 = a3;
  id v6 = [(HUTriggerSummaryCell *)self descriptionLabel];
  [v6 setText:v5];
}

- (void)setHideDescription:(BOOL)a3
{
  if (self->_hideDescription != a3)
  {
    self->_hideDescription = a3;
    if (a3) {
      [(UILabel *)self->_descriptionLabel removeFromSuperview];
    }
    else {
      [(HUTriggerSummaryCell *)self _addDescriptionLabel];
    }
    [(HUTriggerSummaryCell *)self setNeedsUpdateConstraints];
  }
}

- (void)setDescriptionIcon:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_descriptionIcon, a3);
  id v5 = v8;
  if (!self->_hideDescriptionIcon)
  {
    if (v8)
    {
      id v6 = [v8 imageWithRenderingMode:2];
    }
    else
    {
      id v6 = 0;
    }
    uint64_t v7 = [(HUTriggerSummaryCell *)self descriptionIconView];
    [v7 setImage:v6];

    id v5 = v8;
  }
}

- (void)setHideDescriptionIcon:(BOOL)a3
{
  if (self->_hideDescriptionIcon != a3)
  {
    self->_hideDescriptionIcon = a3;
    if (a3) {
      [(UIImageView *)self->_descriptionIconView removeFromSuperview];
    }
    else {
      [(HUTriggerSummaryCell *)self _addDescriptionIconView];
    }
    [(HUTriggerSummaryCell *)self setNeedsUpdateConstraints];
  }
}

- (void)setDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_disabled = a3;
  [(HUTriggerSummaryCell *)self updateTitle];
  [(HUTriggerSummaryCell *)self updateSelectionUI];
  double v5 = 0.200000003;
  if (!v3) {
    double v5 = 1.0;
  }

  [(HUTriggerSummaryCell *)self setTextAlpha:v5];
}

- (BOOL)canBeSelected
{
  return ![(HUTriggerSummaryCell *)self isDisabled] && self->_canBeSelected;
}

- (void)setCanBeSelected:(BOOL)a3
{
  self->_canBeSelected = a3;
  [(HUTriggerSummaryCell *)self updateSelectionUI];
}

- (void)setTextAlpha:(double)a3
{
  self->_textAlpha = a3;
  [(HUTriggerSummaryCell *)self updateTitle];
}

- (void)updateConstraints
{
  BOOL v3 = [(HUTriggerSummaryCell *)self titleLabel];
  [v3 setNumberOfLines:0];

  id v4 = [(HUTriggerSummaryCell *)self descriptionLabel];
  [v4 setNumberOfLines:0];

  [(HUTriggerSummaryCell *)self updateVerticalLabelConstraints];
  [(HUTriggerSummaryCell *)self updateHorizontalLabelConstraints];
  v5.receiver = self;
  v5.super_class = (Class)HUTriggerSummaryCell;
  [(HUTriggerSummaryCell *)&v5 updateConstraints];
}

- (void)setUpIconContainerViewConstraints
{
  id v22 = [MEMORY[0x1E4F1CA48] array];
  BOOL v3 = [(HUTriggerSummaryCell *)self iconContainerView];
  id v4 = [v3 topAnchor];
  objc_super v5 = [(HUTriggerSummaryCell *)self contentView];
  id v6 = [v5 topAnchor];
  uint64_t v7 = [v4 constraintEqualToAnchor:v6 constant:16.0];
  [v22 addObject:v7];

  id v8 = [(HUTriggerSummaryCell *)self iconContainerView];
  v9 = [v8 leadingAnchor];
  v10 = [(HUTriggerSummaryCell *)self contentView];
  v11 = [v10 leadingAnchor];
  v12 = [v9 constraintEqualToAnchor:v11 constant:16.0];
  [v22 addObject:v12];

  v13 = [(HUTriggerSummaryCell *)self iconContainerView];
  v14 = [v13 trailingAnchor];
  v15 = [(HUTriggerSummaryCell *)self contentView];
  v16 = [v15 trailingAnchor];
  v17 = [v14 constraintEqualToAnchor:v16 constant:16.0];
  [v22 addObject:v17];

  objc_super v18 = (void *)MEMORY[0x1E4F28DC8];
  v19 = [(HUTriggerSummaryCell *)self iconContainerView];
  v20 = [v18 constraintWithItem:v19 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:32.0];

  v21 = [(HUTriggerSummaryCell *)self contentView];
  [v21 addConstraint:v20];

  [MEMORY[0x1E4F28DC8] activateConstraints:v22];
}

- (void)setUpTextContainerViewConstraints
{
  id v27 = [MEMORY[0x1E4F1CA48] array];
  BOOL v3 = [(HUTriggerSummaryCell *)self textContainerView];
  id v4 = [v3 topAnchor];
  objc_super v5 = [(HUTriggerSummaryCell *)self iconContainerView];
  id v6 = [v5 bottomAnchor];
  uint64_t v7 = [v4 constraintEqualToAnchor:v6 constant:8.0];
  [v27 addObject:v7];

  id v8 = [(HUTriggerSummaryCell *)self textContainerView];
  v9 = [v8 leadingAnchor];
  v10 = [(HUTriggerSummaryCell *)self contentView];
  v11 = [v10 leadingAnchor];
  v12 = [v9 constraintEqualToAnchor:v11 constant:16.0];
  [v27 addObject:v12];

  v13 = [(HUTriggerSummaryCell *)self textContainerView];
  v14 = [v13 trailingAnchor];
  v15 = [(HUTriggerSummaryCell *)self contentView];
  v16 = [v15 trailingAnchor];
  v17 = [v14 constraintEqualToAnchor:v16 constant:-16.0];
  [v27 addObject:v17];

  objc_super v18 = [(HUTriggerSummaryCell *)self textContainerView];
  v19 = [v18 bottomAnchor];
  v20 = [(HUTriggerSummaryCell *)self contentView];
  v21 = [v20 bottomAnchor];
  id v22 = [v19 constraintEqualToAnchor:v21 constant:-16.0];
  [v27 addObject:v22];

  v23 = (void *)MEMORY[0x1E4F28DC8];
  v24 = [(HUTriggerSummaryCell *)self iconContainerView];
  v25 = [v23 constraintWithItem:v24 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:32.0];

  v26 = [(HUTriggerSummaryCell *)self contentView];
  [v26 addConstraint:v25];

  [MEMORY[0x1E4F28DC8] activateConstraints:v27];
}

- (void)updateVerticalLabelConstraints
{
  BOOL v3 = (void *)MEMORY[0x1E4F28DC8];
  id v4 = [(HUTriggerSummaryCell *)self verticalLabelConstraints];
  [v3 deactivateConstraints:v4];

  id v42 = [MEMORY[0x1E4F1CA48] array];
  objc_super v5 = [(UILabel *)self->_titleLabel superview];

  if (v5)
  {
    id v6 = [(HUTriggerSummaryCell *)self titleLabel];
    uint64_t v7 = [v6 topAnchor];
    id v8 = [(HUTriggerSummaryCell *)self textContainerView];
    v9 = [v8 topAnchor];
    v10 = [v7 constraintEqualToAnchor:v9];
    [v42 addObject:v10];

    v11 = [(UILabel *)self->_descriptionLabel superview];

    if (!v11)
    {
      v12 = [(HUTriggerSummaryCell *)self titleLabel];
      v13 = [v12 bottomAnchor];
      v14 = [(HUTriggerSummaryCell *)self textContainerView];
      v15 = [v14 bottomAnchor];
      v16 = [v13 constraintEqualToAnchor:v15];
      [v42 addObject:v16];
    }
  }
  v17 = [(UILabel *)self->_descriptionLabel superview];

  if (v17)
  {
    objc_super v18 = [(UILabel *)self->_titleLabel superview];

    v19 = [(HUTriggerSummaryCell *)self descriptionLabel];
    v20 = [v19 topAnchor];
    if (v18)
    {
      v21 = [(UILabel *)self->_titleLabel bottomAnchor];
      id v22 = [v20 constraintEqualToAnchor:v21 constant:3.0];
      [v42 addObject:v22];
    }
    else
    {
      v21 = [(HUTriggerSummaryCell *)self textContainerView];
      id v22 = [v21 topAnchor];
      v23 = [v20 constraintEqualToAnchor:v22];
      [v42 addObject:v23];
    }
    v24 = [(HUTriggerSummaryCell *)self descriptionLabel];
    v25 = [v24 bottomAnchor];
    v26 = [(HUTriggerSummaryCell *)self textContainerView];
    id v27 = [v26 bottomAnchor];
    v28 = [v25 constraintEqualToAnchor:v27];
    [v42 addObject:v28];

    v29 = [(UIImageView *)self->_descriptionIconView superview];

    if (v29)
    {
      v30 = [(HUTriggerSummaryCell *)self descriptionIconView];
      v31 = [v30 topAnchor];
      v32 = [(HUTriggerSummaryCell *)self descriptionLabel];
      v33 = [v32 topAnchor];
      v34 = [v31 constraintEqualToAnchor:v33];
      [v42 addObject:v34];

      v35 = [(HUTriggerSummaryCell *)self descriptionIconView];
      v36 = [v35 bottomAnchor];
      v37 = [(HUTriggerSummaryCell *)self descriptionLabel];
      v38 = [v37 bottomAnchor];
      v39 = [v36 constraintEqualToAnchor:v38];
      [v42 addObject:v39];
    }
  }
  [(HUTriggerSummaryCell *)self setVerticalLabelConstraints:v42];
  v40 = (void *)MEMORY[0x1E4F28DC8];
  v41 = [(HUTriggerSummaryCell *)self verticalLabelConstraints];
  [v40 activateConstraints:v41];
}

- (void)updateHorizontalLabelConstraints
{
  BOOL v3 = (void *)MEMORY[0x1E4F28DC8];
  id v4 = [(HUTriggerSummaryCell *)self horizontalLabelConstraints];
  [v3 deactivateConstraints:v4];

  id v40 = [MEMORY[0x1E4F1CA48] array];
  objc_super v5 = [(UILabel *)self->_titleLabel superview];

  if (v5)
  {
    id v6 = [(HUTriggerSummaryCell *)self titleLabel];
    uint64_t v7 = [v6 leadingAnchor];
    id v8 = [(HUTriggerSummaryCell *)self textContainerView];
    v9 = [v8 leadingAnchor];
    v10 = [v7 constraintEqualToAnchor:v9];
    [v40 addObject:v10];

    v11 = [(HUTriggerSummaryCell *)self titleLabel];
    v12 = [v11 trailingAnchor];
    v13 = [(HUTriggerSummaryCell *)self textContainerView];
    v14 = [v13 trailingAnchor];
    v15 = [v12 constraintEqualToAnchor:v14];
    [v40 addObject:v15];
  }
  v16 = [(UILabel *)self->_descriptionLabel superview];

  if (v16)
  {
    v17 = [(UIImageView *)self->_descriptionIconView superview];

    if (v17)
    {
      objc_super v18 = [(HUTriggerSummaryCell *)self descriptionIconView];
      v19 = [v18 leadingAnchor];
      v20 = [(HUTriggerSummaryCell *)self textContainerView];
      v21 = [v20 leadingAnchor];
      id v22 = [v19 constraintEqualToAnchor:v21];
      [v40 addObject:v22];

      v23 = [(HUTriggerSummaryCell *)self descriptionIconView];
      v24 = [v23 widthAnchor];
      v25 = [(HUTriggerSummaryCell *)self descriptionIconView];
      v26 = [v25 heightAnchor];
      id v27 = [v24 constraintEqualToAnchor:v26];
      [v40 addObject:v27];

      v28 = [(HUTriggerSummaryCell *)self descriptionIconView];
      v29 = [v28 trailingAnchor];
      v30 = [(HUTriggerSummaryCell *)self descriptionLabel];
      v31 = [v30 leadingAnchor];
      [v29 constraintEqualToAnchor:v31 constant:-5.0];
    }
    else
    {
      v28 = [(HUTriggerSummaryCell *)self descriptionLabel];
      v29 = [v28 leadingAnchor];
      v30 = [(HUTriggerSummaryCell *)self textContainerView];
      v31 = [v30 leadingAnchor];
      [v29 constraintEqualToAnchor:v31];
    v32 = };
    [v40 addObject:v32];

    v33 = [(HUTriggerSummaryCell *)self descriptionLabel];
    v34 = [v33 trailingAnchor];
    v35 = [(HUTriggerSummaryCell *)self textContainerView];
    v36 = [v35 trailingAnchor];
    v37 = [v34 constraintEqualToAnchor:v36];
    [v40 addObject:v37];
  }
  [(HUTriggerSummaryCell *)self setHorizontalLabelConstraints:v40];
  v38 = (void *)MEMORY[0x1E4F28DC8];
  v39 = [(HUTriggerSummaryCell *)self horizontalLabelConstraints];
  [v38 activateConstraints:v39];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  id v4 = [(HUTriggerSummaryCell *)self item];
  id v5 = [v4 latestResults];

  [(HUTriggerSummaryCell *)self updateUITextWithResults:v5];
  [(HUTriggerSummaryCell *)self updateUIIconsWithResults:v5];
  [(HUTriggerSummaryCell *)self setNeedsUpdateConstraints];
}

- (void)updateUITextWithResults:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [(HUTriggerSummaryCell *)self setTitleText:v5];

  [(HUTriggerSummaryCell *)self updateTitle];
  uint64_t v6 = *MEMORY[0x1E4F68980];
  uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];

  if (v7)
  {
    v20[0] = *MEMORY[0x1E4F42508];
    id v8 = [(HUTriggerSummaryCell *)self descriptionLabel];
    v9 = [v8 font];
    v21[0] = v9;
    v20[1] = *MEMORY[0x1E4F42510];
    v10 = [(HUTriggerSummaryCell *)self descriptionLabel];
    v11 = [v10 textColor];
    v21[1] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

    v13 = [v4 objectForKeyedSubscript:v6];
    if ([v13 prefersDynamicString])
    {
      v14 = [(HUTriggerSummaryCell *)self descriptionLabel];
      [v14 bounds];
      v17 = objc_msgSend(v13, "dynamicStringForSize:attributes:", v12, v15, v16);
      objc_super v18 = [(HUTriggerSummaryCell *)self descriptionLabel];
      [v18 setAttributedText:v17];
    }
    else
    {
      v14 = [v13 stringWithAttributes:v12];
      v17 = [(HUTriggerSummaryCell *)self descriptionLabel];
      [v17 setAttributedText:v14];
    }
  }
  else
  {
    v19 = [(HUTriggerSummaryCell *)self descriptionLabel];
    [v19 setAttributedText:0];
  }
}

- (void)updateUIIconsWithResults:(id)a3
{
  id v9 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];
  if (v5)
  {
    [v4 addObject:v5];
    id v6 = objc_alloc(MEMORY[0x1E4F691D0]);
    uint64_t v7 = (void *)[v6 initWithImageIdentifier:*MEMORY[0x1E4F68650]];
    [v4 addObject:v7];
  }
  id v8 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F689F0]];
  if (v8) {
    [v4 addObjectsFromArray:v8];
  }
  [(HUTriggerSummaryCell *)self setIconDescriptors:v4];
}

- (void)_addTitleLabel
{
  BOOL v3 = [(UILabel *)self->_titleLabel superview];

  if (v3) {
    NSLog(&cfstr_TitleLabelAlre.isa, self);
  }
  if (!self->_titleLabel)
  {
    id v4 = (void *)MEMORY[0x1E4F42B38];
    id v5 = [(HUTriggerSummaryCell *)self titleText];
    id v6 = [(HUTriggerSummaryCell *)self titleFont];
    uint64_t v7 = [v4 labelWithText:v5 font:v6];
    titleLabel = self->_titleLabel;
    self->_titleLabel = v7;

    LODWORD(v9) = 1144766464;
    [(UILabel *)self->_titleLabel setContentCompressionResistancePriority:1 forAxis:v9];
    LODWORD(v10) = 1132134400;
    [(UILabel *)self->_titleLabel setContentHuggingPriority:1 forAxis:v10];
  }
  v11 = [(HUTriggerSummaryCell *)self textContainerView];
  [v11 addSubview:self->_titleLabel];

  [(HUTriggerSummaryCell *)self updateTitle];
}

- (void)_addDescriptionLabel
{
  BOOL v3 = [(UILabel *)self->_descriptionLabel superview];

  if (v3) {
    NSLog(&cfstr_DescriptionLab.isa, self);
  }
  descriptionLabel = self->_descriptionLabel;
  if (!descriptionLabel)
  {
    id v6 = (void *)MEMORY[0x1E4F42B38];
    uint64_t v7 = [(HUTriggerSummaryCell *)self descriptionText];
    id v8 = [(HUTriggerSummaryCell *)self descriptionFont];
    double v9 = [v6 labelWithText:v7 font:v8];
    double v10 = self->_descriptionLabel;
    self->_descriptionLabel = v9;

    v11 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [(UILabel *)self->_descriptionLabel setTextColor:v11];

    descriptionLabel = self->_descriptionLabel;
  }
  LODWORD(v4) = 1144766464;
  [(UILabel *)descriptionLabel setContentHuggingPriority:1 forAxis:v4];
  id v12 = [(HUTriggerSummaryCell *)self textContainerView];
  [v12 addSubview:self->_descriptionLabel];
}

- (void)_addDescriptionIconView
{
  if (!self->_descriptionIconView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F42AA0]);
    double v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    descriptionIconView = self->_descriptionIconView;
    self->_descriptionIconView = v4;

    [(UIImageView *)self->_descriptionIconView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v6 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [(UIImageView *)self->_descriptionIconView setTintColor:v6];

    [(UIImageView *)self->_descriptionIconView setContentMode:1];
    uint64_t v7 = [(HUTriggerSummaryCell *)self descriptionIcon];

    if (v7)
    {
      double v9 = [(HUTriggerSummaryCell *)self descriptionIcon];
      double v10 = [v9 imageWithRenderingMode:2];
      [(UIImageView *)self->_descriptionIconView setImage:v10];
    }
    LODWORD(v8) = 1132003328;
    [(UIImageView *)self->_descriptionIconView setContentCompressionResistancePriority:1 forAxis:v8];
  }
  id v11 = [(HUTriggerSummaryCell *)self textContainerView];
  [v11 addSubview:self->_descriptionIconView];
}

- (void)updateTitle
{
  if ([(HUTriggerSummaryCell *)self isDisabled]) {
    [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else {
  id v3 = [MEMORY[0x1E4F428B8] labelColor];
  }
  [(UILabel *)self->_titleLabel setTextColor:v3];

  [(HUTriggerSummaryCell *)self textAlpha];
  if (v4 != 0.0)
  {
    [(HUTriggerSummaryCell *)self textAlpha];
    -[UILabel setAlpha:](self->_titleLabel, "setAlpha:");
    [(HUTriggerSummaryCell *)self textAlpha];
    descriptionLabel = self->_descriptionLabel;
    -[UILabel setAlpha:](descriptionLabel, "setAlpha:");
  }
}

- (void)updateSelectionUI
{
  BOOL v3 = [(HUTriggerSummaryCell *)self canBeSelected];
  if (v3) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 0;
  }
  [(HUTriggerSummaryCell *)self setAccessoryType:v3];

  [(HUTriggerSummaryCell *)self setSelectionStyle:v4];
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (BOOL)hideTitle
{
  return self->_hideTitle;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (BOOL)hideDescription
{
  return self->_hideDescription;
}

- (UIImage)descriptionIcon
{
  return self->_descriptionIcon;
}

- (BOOL)hideDescriptionIcon
{
  return self->_hideDescriptionIcon;
}

- (NSArray)iconDescriptors
{
  return self->_iconDescriptors;
}

- (UIColor)cellColor
{
  return self->_cellColor;
}

- (NSArray)verticalLabelConstraints
{
  return self->_verticalLabelConstraints;
}

- (void)setVerticalLabelConstraints:(id)a3
{
}

- (NSArray)horizontalLabelConstraints
{
  return self->_horizontalLabelConstraints;
}

- (void)setHorizontalLabelConstraints:(id)a3
{
}

- (void)setTitleLabel:(id)a3
{
}

- (void)setDescriptionLabel:(id)a3
{
}

- (UIImageView)descriptionIconView
{
  return self->_descriptionIconView;
}

- (void)setDescriptionIconView:(id)a3
{
}

- (HUIconListView)iconContainerView
{
  return self->_iconContainerView;
}

- (void)setIconContainerView:(id)a3
{
}

- (UIView)textContainerView
{
  return self->_textContainerView;
}

- (void)setTextContainerView:(id)a3
{
}

- (double)textAlpha
{
  return self->_textAlpha;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
}

- (UIFont)descriptionFont
{
  return self->_descriptionFont;
}

- (void)setDescriptionFont:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_textContainerView, 0);
  objc_storeStrong((id *)&self->_iconContainerView, 0);
  objc_storeStrong((id *)&self->_descriptionIconView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_horizontalLabelConstraints, 0);
  objc_storeStrong((id *)&self->_verticalLabelConstraints, 0);
  objc_storeStrong((id *)&self->_cellColor, 0);
  objc_storeStrong((id *)&self->_iconDescriptors, 0);
  objc_storeStrong((id *)&self->_descriptionIcon, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end