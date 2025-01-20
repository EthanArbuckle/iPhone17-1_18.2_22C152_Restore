@interface HUTitleDescriptionCell
- (BOOL)adjustsTextColorWhenDisabled;
- (BOOL)hideDescription;
- (BOOL)hideDescriptionIcon;
- (BOOL)hideTitle;
- (HUTitleDescriptionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)horizontalLabelConstraints;
- (NSArray)verticalLabelConstraints;
- (NSLayoutConstraint)descriptionTrailingConstraint;
- (NSLayoutConstraint)titleTrailingConstraint;
- (NSString)descriptionText;
- (NSString)titleText;
- (UIFont)descriptionFont;
- (UIFont)titleFont;
- (UIImage)descriptionIcon;
- (UIImageView)descriptionIconView;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (double)textAlpha;
- (unint64_t)maxNumberOfDescriptionLines;
- (unint64_t)maxNumberOfTitleLines;
- (void)_addDescriptionIconView;
- (void)_addDescriptionLabel;
- (void)_addTitleLabel;
- (void)prepareForReuse;
- (void)setAdjustsTextColorWhenDisabled:(BOOL)a3;
- (void)setDescriptionFont:(id)a3;
- (void)setDescriptionIcon:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setHideDescription:(BOOL)a3;
- (void)setHideDescriptionIcon:(BOOL)a3;
- (void)setHideTitle:(BOOL)a3;
- (void)setHorizontalLabelConstraints:(id)a3;
- (void)setMaxNumberOfDescriptionLines:(unint64_t)a3;
- (void)setMaxNumberOfTitleLines:(unint64_t)a3;
- (void)setTextAlpha:(double)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setVerticalLabelConstraints:(id)a3;
- (void)updateConstraints;
- (void)updateHorizontalLabelConstraints;
- (void)updateTitle;
- (void)updateUIWithAnimation:(BOOL)a3;
- (void)updateVerticalLabelConstraints;
@end

@implementation HUTitleDescriptionCell

- (HUTitleDescriptionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HUTitleDescriptionCell;
  v4 = [(HUIconCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    titleFont = v4->_titleFont;
    v4->_titleFont = (UIFont *)v5;

    uint64_t v7 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43880]];
    descriptionFont = v4->_descriptionFont;
    v4->_descriptionFont = (UIFont *)v7;

    v4->_textAlpha = 1.0;
    v4->_hideDescriptionIcon = 1;
    v4->_adjustsTextColorWhenDisabled = 1;
    v4->_maxNumberOfTitleLines = 2;
    v4->_maxNumberOfDescriptionLines = 2;
    [(HUTitleDescriptionCell *)v4 _addTitleLabel];
    [(HUTitleDescriptionCell *)v4 _addDescriptionLabel];
  }
  return v4;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)HUTitleDescriptionCell;
  [(HUIconCell *)&v5 prepareForReuse];
  [(HUTitleDescriptionCell *)self setHideTitle:0];
  [(HUTitleDescriptionCell *)self setTitleText:0];
  v3 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  [(HUTitleDescriptionCell *)self setTitleFont:v3];

  [(HUTitleDescriptionCell *)self updateTitle];
  [(HUTitleDescriptionCell *)self setHideDescription:0];
  [(HUTitleDescriptionCell *)self setDescriptionText:0];
  v4 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43880]];
  [(HUTitleDescriptionCell *)self setDescriptionFont:v4];

  [(HUTitleDescriptionCell *)self setHideDescriptionIcon:1];
  [(HUTitleDescriptionCell *)self setDescriptionIcon:0];
  [(HUIconCell *)self setIconAlpha:1.0];
}

- (UILabel)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    [(HUTitleDescriptionCell *)self _addTitleLabel];
    titleLabel = self->_titleLabel;
  }

  return titleLabel;
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
  id v5 = a3;
  id v6 = [(HUTitleDescriptionCell *)self titleLabel];
  [v6 setText:v5];
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
  id v5 = a3;
  id v6 = [(HUTitleDescriptionCell *)self titleLabel];
  [v6 setFont:v5];
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
      [(HUTitleDescriptionCell *)self _addTitleLabel];
    }
    [(HUTitleDescriptionCell *)self setNeedsUpdateConstraints];
  }
}

- (UILabel)descriptionLabel
{
  descriptionLabel = self->_descriptionLabel;
  if (!descriptionLabel)
  {
    [(HUTitleDescriptionCell *)self _addDescriptionLabel];
    descriptionLabel = self->_descriptionLabel;
  }

  return descriptionLabel;
}

- (void)setDescriptionText:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionText, a3);
  id v5 = a3;
  id v6 = [(HUTitleDescriptionCell *)self descriptionLabel];
  [v6 setText:v5];
}

- (void)setDescriptionFont:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionFont, a3);
  id v5 = a3;
  id v6 = [(HUTitleDescriptionCell *)self descriptionLabel];
  [v6 setFont:v5];
}

- (void)setHideDescription:(BOOL)a3
{
  if (self->_hideDescription != a3)
  {
    self->_hideDescription = a3;
    if (a3)
    {
      [(UILabel *)self->_descriptionLabel removeFromSuperview];
      [(HUTitleDescriptionCell *)self setHideDescriptionIcon:1];
    }
    else
    {
      [(HUTitleDescriptionCell *)self _addDescriptionLabel];
    }
    [(HUTitleDescriptionCell *)self setNeedsUpdateConstraints];
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
    uint64_t v7 = [(HUTitleDescriptionCell *)self descriptionIconView];
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
      [(HUTitleDescriptionCell *)self _addDescriptionIconView];
    }
    [(HUTitleDescriptionCell *)self setNeedsUpdateConstraints];
  }
}

- (void)setDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HUTitleDescriptionCell;
  -[HUIconCell setDisabled:](&v5, sel_setDisabled_);
  [(HUTitleDescriptionCell *)self updateTitle];
  [(HUTitleDescriptionCell *)self setAdjustsTextColorWhenDisabled:1];
  [(HUTitleDescriptionCell *)self setUserInteractionEnabled:!v3];
}

- (void)setTextAlpha:(double)a3
{
  self->_textAlpha = a3;
  [(HUTitleDescriptionCell *)self updateTitle];
}

- (void)updateConstraints
{
  BOOL v3 = [(UILabel *)self->_titleLabel traitCollection];
  v4 = [v3 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v4)) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 2;
  }
  id v6 = [(HUTitleDescriptionCell *)self titleLabel];
  [v6 setNumberOfLines:v5];

  uint64_t v7 = [(UILabel *)self->_descriptionLabel traitCollection];
  id v8 = [v7 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v8)) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = 2;
  }
  objc_super v10 = [(HUTitleDescriptionCell *)self descriptionLabel];
  [v10 setNumberOfLines:v9];

  [(HUTitleDescriptionCell *)self updateVerticalLabelConstraints];
  [(HUTitleDescriptionCell *)self updateHorizontalLabelConstraints];
  v11 = [(HUTitleDescriptionCell *)self traitCollection];
  v12 = [v11 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

  if (IsAccessibilityCategory) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = 2;
  }
  [(UILabel *)self->_titleLabel setNumberOfLines:v14];
  [(UILabel *)self->_descriptionLabel setNumberOfLines:v14];
  if ([(HUTitleDescriptionCell *)self maxNumberOfTitleLines] != 2) {
    [(UILabel *)self->_titleLabel setNumberOfLines:[(HUTitleDescriptionCell *)self maxNumberOfTitleLines]];
  }
  if ([(HUTitleDescriptionCell *)self maxNumberOfDescriptionLines] != 2) {
    [(UILabel *)self->_descriptionLabel setNumberOfLines:[(HUTitleDescriptionCell *)self maxNumberOfDescriptionLines]];
  }
  v15.receiver = self;
  v15.super_class = (Class)HUTitleDescriptionCell;
  [(HUIconCell *)&v15 updateConstraints];
}

- (void)updateVerticalLabelConstraints
{
  BOOL v3 = (void *)MEMORY[0x1E4F28DC8];
  v4 = [(HUTitleDescriptionCell *)self verticalLabelConstraints];
  [v3 deactivateConstraints:v4];

  id v42 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [(UILabel *)self->_titleLabel superview];

  if (v5)
  {
    id v6 = [(HUTitleDescriptionCell *)self titleLabel];
    uint64_t v7 = [v6 topAnchor];
    id v8 = [(HUIconCell *)self containerView];
    uint64_t v9 = [v8 topAnchor];
    objc_super v10 = [v7 constraintEqualToAnchor:v9];
    [v42 addObject:v10];

    v11 = [(UILabel *)self->_descriptionLabel superview];

    if (!v11)
    {
      v12 = [(HUTitleDescriptionCell *)self titleLabel];
      v13 = [v12 bottomAnchor];
      uint64_t v14 = [(HUIconCell *)self containerView];
      objc_super v15 = [v14 bottomAnchor];
      v16 = [v13 constraintEqualToAnchor:v15];
      [v42 addObject:v16];
    }
  }
  v17 = [(UILabel *)self->_descriptionLabel superview];

  if (v17)
  {
    v18 = [(UILabel *)self->_titleLabel superview];

    v19 = [(HUTitleDescriptionCell *)self descriptionLabel];
    v20 = [v19 topAnchor];
    if (v18)
    {
      v21 = [(UILabel *)self->_titleLabel bottomAnchor];
      v22 = [v20 constraintEqualToAnchor:v21 constant:3.0];
      [v42 addObject:v22];
    }
    else
    {
      v21 = [(HUIconCell *)self containerView];
      v22 = [v21 topAnchor];
      v23 = [v20 constraintEqualToAnchor:v22];
      [v42 addObject:v23];
    }
    v24 = [(HUTitleDescriptionCell *)self descriptionLabel];
    v25 = [v24 bottomAnchor];
    v26 = [(HUIconCell *)self containerView];
    v27 = [v26 bottomAnchor];
    v28 = [v25 constraintEqualToAnchor:v27];
    [v42 addObject:v28];

    v29 = [(UIImageView *)self->_descriptionIconView superview];

    if (v29)
    {
      v30 = [(HUTitleDescriptionCell *)self descriptionIconView];
      v31 = [v30 topAnchor];
      v32 = [(HUTitleDescriptionCell *)self descriptionLabel];
      v33 = [v32 topAnchor];
      v34 = [v31 constraintEqualToAnchor:v33];
      [v42 addObject:v34];

      v35 = [(HUTitleDescriptionCell *)self descriptionIconView];
      v36 = [v35 bottomAnchor];
      v37 = [(HUTitleDescriptionCell *)self descriptionLabel];
      v38 = [v37 bottomAnchor];
      v39 = [v36 constraintEqualToAnchor:v38];
      [v42 addObject:v39];
    }
  }
  [(HUTitleDescriptionCell *)self setVerticalLabelConstraints:v42];
  v40 = (void *)MEMORY[0x1E4F28DC8];
  v41 = [(HUTitleDescriptionCell *)self verticalLabelConstraints];
  [v40 activateConstraints:v41];
}

- (void)updateHorizontalLabelConstraints
{
  BOOL v3 = (void *)MEMORY[0x1E4F28DC8];
  v4 = [(HUTitleDescriptionCell *)self horizontalLabelConstraints];
  [v3 deactivateConstraints:v4];

  id v42 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [(UILabel *)self->_titleLabel superview];

  if (v5)
  {
    id v6 = [(HUTitleDescriptionCell *)self titleLabel];
    uint64_t v7 = [v6 leadingAnchor];
    id v8 = [(HUIconCell *)self containerView];
    uint64_t v9 = [v8 leadingAnchor];
    objc_super v10 = [v7 constraintEqualToAnchor:v9];
    [v42 addObject:v10];

    v11 = [(HUTitleDescriptionCell *)self titleLabel];
    v12 = [v11 trailingAnchor];
    v13 = [(HUIconCell *)self containerView];
    uint64_t v14 = [v13 trailingAnchor];
    objc_super v15 = [v12 constraintEqualToAnchor:v14];
    titleTrailingConstraint = self->_titleTrailingConstraint;
    self->_titleTrailingConstraint = v15;

    [v42 addObject:self->_titleTrailingConstraint];
  }
  v17 = [(UILabel *)self->_descriptionLabel superview];

  if (v17)
  {
    v18 = [(UIImageView *)self->_descriptionIconView superview];

    if (v18)
    {
      v19 = [(HUTitleDescriptionCell *)self descriptionIconView];
      v20 = [v19 leadingAnchor];
      v21 = [(HUIconCell *)self containerView];
      v22 = [v21 leadingAnchor];
      v23 = [v20 constraintEqualToAnchor:v22];
      [v42 addObject:v23];

      v24 = [(HUTitleDescriptionCell *)self descriptionIconView];
      v25 = [v24 widthAnchor];
      v26 = [(HUTitleDescriptionCell *)self descriptionIconView];
      v27 = [v26 heightAnchor];
      v28 = [v25 constraintEqualToAnchor:v27];
      [v42 addObject:v28];

      v29 = [(HUTitleDescriptionCell *)self descriptionIconView];
      v30 = [v29 trailingAnchor];
      v31 = [(HUTitleDescriptionCell *)self descriptionLabel];
      v32 = [v31 leadingAnchor];
      [v30 constraintEqualToAnchor:v32 constant:-5.0];
    }
    else
    {
      v29 = [(HUTitleDescriptionCell *)self descriptionLabel];
      v30 = [v29 leadingAnchor];
      v31 = [(HUIconCell *)self containerView];
      v32 = [v31 leadingAnchor];
      [v30 constraintEqualToAnchor:v32];
    v33 = };
    [v42 addObject:v33];

    v34 = [(HUTitleDescriptionCell *)self descriptionLabel];
    v35 = [v34 trailingAnchor];
    v36 = [(HUIconCell *)self containerView];
    v37 = [v36 trailingAnchor];
    v38 = [v35 constraintEqualToAnchor:v37];
    descriptionTrailingConstraint = self->_descriptionTrailingConstraint;
    self->_descriptionTrailingConstraint = v38;

    [v42 addObject:self->_descriptionTrailingConstraint];
  }
  [(HUTitleDescriptionCell *)self setHorizontalLabelConstraints:v42];
  v40 = (void *)MEMORY[0x1E4F28DC8];
  v41 = [(HUTitleDescriptionCell *)self horizontalLabelConstraints];
  [v40 activateConstraints:v41];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  v23[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HUIconCell *)self item];
  id v6 = [v5 latestResults];

  v21.receiver = self;
  v21.super_class = (Class)HUTitleDescriptionCell;
  [(HUIconCell *)&v21 updateUIWithAnimation:v3];
  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [(HUTitleDescriptionCell *)self setTitleText:v7];

  [(HUTitleDescriptionCell *)self updateTitle];
  uint64_t v8 = *MEMORY[0x1E4F68980];
  uint64_t v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];

  if (v9)
  {
    v22[0] = *MEMORY[0x1E4F42508];
    objc_super v10 = [(HUTitleDescriptionCell *)self descriptionLabel];
    v11 = [v10 font];
    v23[0] = v11;
    v22[1] = *MEMORY[0x1E4F42510];
    v12 = [(HUTitleDescriptionCell *)self descriptionLabel];
    v13 = [v12 textColor];
    v23[1] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

    objc_super v15 = [v6 objectForKeyedSubscript:v8];
    if ([v15 prefersDynamicString])
    {
      v16 = [(HUTitleDescriptionCell *)self descriptionLabel];
      [v16 bounds];
      v19 = objc_msgSend(v15, "dynamicStringForSize:attributes:", v14, v17, v18);
      v20 = [(HUTitleDescriptionCell *)self descriptionLabel];
      [v20 setAttributedText:v19];
    }
    else
    {
      v16 = [v15 stringWithAttributes:v14];
      v19 = [(HUTitleDescriptionCell *)self descriptionLabel];
      [v19 setAttributedText:v16];
    }
  }
  else
  {
    uint64_t v14 = [(HUTitleDescriptionCell *)self descriptionLabel];
    [v14 setAttributedText:0];
  }

  [(HUTitleDescriptionCell *)self setNeedsUpdateConstraints];
}

- (void)_addTitleLabel
{
  BOOL v3 = [(UILabel *)self->_titleLabel superview];

  if (v3) {
    NSLog(&cfstr_TitleLabelAlre.isa, self);
  }
  if (!self->_titleLabel)
  {
    v4 = (void *)MEMORY[0x1E4F42B38];
    uint64_t v5 = [(HUTitleDescriptionCell *)self titleText];
    id v6 = [(HUTitleDescriptionCell *)self titleFont];
    uint64_t v7 = [v4 labelWithText:v5 font:v6];
    titleLabel = self->_titleLabel;
    self->_titleLabel = v7;

    LODWORD(v9) = 1144766464;
    [(UILabel *)self->_titleLabel setContentCompressionResistancePriority:1 forAxis:v9];
    LODWORD(v10) = 1132134400;
    [(UILabel *)self->_titleLabel setContentHuggingPriority:1 forAxis:v10];
  }
  v11 = [(HUIconCell *)self containerView];
  [v11 addSubview:self->_titleLabel];

  [(HUTitleDescriptionCell *)self updateTitle];
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
    uint64_t v7 = [(HUTitleDescriptionCell *)self descriptionText];
    uint64_t v8 = [(HUTitleDescriptionCell *)self descriptionFont];
    double v9 = [v6 labelWithText:v7 font:v8];
    double v10 = self->_descriptionLabel;
    self->_descriptionLabel = v9;

    v11 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [(UILabel *)self->_descriptionLabel setTextColor:v11];

    descriptionLabel = self->_descriptionLabel;
  }
  LODWORD(v4) = 1144766464;
  [(UILabel *)descriptionLabel setContentHuggingPriority:1 forAxis:v4];
  id v12 = [(HUIconCell *)self containerView];
  [v12 addSubview:self->_descriptionLabel];
}

- (void)_addDescriptionIconView
{
  BOOL v3 = [(UIImageView *)self->_descriptionIconView superview];

  if (v3) {
    NSLog(&cfstr_DescriptionIco.isa, self);
  }
  if (!self->_descriptionIconView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    uint64_t v5 = (UIImageView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    descriptionIconView = self->_descriptionIconView;
    self->_descriptionIconView = v5;

    [(UIImageView *)self->_descriptionIconView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v7 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [(UIImageView *)self->_descriptionIconView setTintColor:v7];

    [(UIImageView *)self->_descriptionIconView setContentMode:1];
    uint64_t v8 = [(HUTitleDescriptionCell *)self descriptionIcon];

    if (v8)
    {
      double v10 = [(HUTitleDescriptionCell *)self descriptionIcon];
      v11 = [v10 imageWithRenderingMode:2];
      [(UIImageView *)self->_descriptionIconView setImage:v11];
    }
    LODWORD(v9) = 1132003328;
    [(UIImageView *)self->_descriptionIconView setContentCompressionResistancePriority:1 forAxis:v9];
  }
  id v12 = [(HUIconCell *)self containerView];
  [v12 addSubview:self->_descriptionIconView];
}

- (void)updateTitle
{
  if ([(HUIconCell *)self isDisabled]
    && [(HUTitleDescriptionCell *)self adjustsTextColorWhenDisabled])
  {
    uint64_t v3 = [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F428B8] labelColor];
  }
  id v5 = (id)v3;
  [(UILabel *)self->_titleLabel setTextColor:v3];
  [(HUTitleDescriptionCell *)self setTextColor:v5];
  [(HUTitleDescriptionCell *)self textAlpha];
  if (v4 != 0.0)
  {
    [(HUTitleDescriptionCell *)self textAlpha];
    -[UILabel setAlpha:](self->_titleLabel, "setAlpha:");
    [(HUTitleDescriptionCell *)self textAlpha];
    -[UILabel setAlpha:](self->_descriptionLabel, "setAlpha:");
    [(HUTitleDescriptionCell *)self textAlpha];
    -[UIImageView setAlpha:](self->_descriptionIconView, "setAlpha:");
  }
}

- (NSLayoutConstraint)titleTrailingConstraint
{
  return self->_titleTrailingConstraint;
}

- (NSLayoutConstraint)descriptionTrailingConstraint
{
  return self->_descriptionTrailingConstraint;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (BOOL)hideTitle
{
  return self->_hideTitle;
}

- (unint64_t)maxNumberOfTitleLines
{
  return self->_maxNumberOfTitleLines;
}

- (void)setMaxNumberOfTitleLines:(unint64_t)a3
{
  self->_maxNumberOfTitleLines = a3;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (UIFont)descriptionFont
{
  return self->_descriptionFont;
}

- (BOOL)hideDescription
{
  return self->_hideDescription;
}

- (unint64_t)maxNumberOfDescriptionLines
{
  return self->_maxNumberOfDescriptionLines;
}

- (void)setMaxNumberOfDescriptionLines:(unint64_t)a3
{
  self->_maxNumberOfDescriptionLines = a3;
}

- (UIImage)descriptionIcon
{
  return self->_descriptionIcon;
}

- (BOOL)hideDescriptionIcon
{
  return self->_hideDescriptionIcon;
}

- (double)textAlpha
{
  return self->_textAlpha;
}

- (BOOL)adjustsTextColorWhenDisabled
{
  return self->_adjustsTextColorWhenDisabled;
}

- (void)setAdjustsTextColorWhenDisabled:(BOOL)a3
{
  self->_adjustsTextColorWhenDisabled = a3;
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

- (UIImageView)descriptionIconView
{
  return self->_descriptionIconView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionIconView, 0);
  objc_storeStrong((id *)&self->_horizontalLabelConstraints, 0);
  objc_storeStrong((id *)&self->_verticalLabelConstraints, 0);
  objc_storeStrong((id *)&self->_descriptionIcon, 0);
  objc_storeStrong((id *)&self->_descriptionFont, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_descriptionTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_titleTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end