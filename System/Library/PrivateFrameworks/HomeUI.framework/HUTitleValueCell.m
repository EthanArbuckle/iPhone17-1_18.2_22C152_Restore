@interface HUTitleValueCell
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)allowCopyValueToPasteboard;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)hideTitle;
- (BOOL)hideValue;
- (BOOL)titleColorFollowsTintColor;
- (BOOL)useVerticalLayoutOnly;
- (BOOL)valueColorFollowsTintColor;
- (HUTitleValueCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)stackViewConstraints;
- (NSString)titleText;
- (NSString)valueText;
- (UIFont)titleFont;
- (UIFont)valueFont;
- (UILabel)titleLabel;
- (UILabel)valueLabel;
- (UIStackView)labelsStackView;
- (double)labelSpacing;
- (void)_addTitleLabel;
- (void)_addValueLabel;
- (void)_ensureCorrectHeaderViewOrientation;
- (void)_updateTitle;
- (void)_updateValue;
- (void)copy:(id)a3;
- (void)prepareForReuse;
- (void)setAllowCopyValueToPasteboard:(BOOL)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setHideTitle:(BOOL)a3;
- (void)setHideValue:(BOOL)a3;
- (void)setStackViewConstraints:(id)a3;
- (void)setTitleColorFollowsTintColor:(BOOL)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setUseVerticalLayoutOnly:(BOOL)a3;
- (void)setValueColorFollowsTintColor:(BOOL)a3;
- (void)setValueFont:(id)a3;
- (void)setValueText:(id)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUTitleValueCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUTitleValueCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)HUTitleValueCell;
  v4 = [(HUIconCell *)&v14 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = *MEMORY[0x1E4F43870];
    uint64_t v6 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    titleFont = v4->_titleFont;
    v4->_titleFont = (UIFont *)v6;

    uint64_t v8 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v5];
    valueFont = v4->_valueFont;
    v4->_valueFont = (UIFont *)v8;

    v10 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4F42E20]);
    labelsStackView = v4->_labelsStackView;
    v4->_labelsStackView = v10;

    [(UIStackView *)v4->_labelsStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_labelsStackView setAxis:0];
    v4->_useVerticalLayoutOnly = 0;
    v12 = [(HUIconCell *)v4 containerView];
    [v12 addSubview:v4->_labelsStackView];

    [(HUTitleValueCell *)v4 _addTitleLabel];
    [(HUTitleValueCell *)v4 _addValueLabel];
  }
  return v4;
}

- (void)prepareForReuse
{
  v8.receiver = self;
  v8.super_class = (Class)HUTitleValueCell;
  [(HUIconCell *)&v8 prepareForReuse];
  [(HUTitleValueCell *)self setHideTitle:0];
  [(HUTitleValueCell *)self setTitleText:0];
  uint64_t v3 = *MEMORY[0x1E4F43870];
  v4 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  [(HUTitleValueCell *)self setTitleFont:v4];

  [(HUTitleValueCell *)self setHideValue:0];
  [(HUTitleValueCell *)self setValueText:0];
  uint64_t v5 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v3];
  [(HUTitleValueCell *)self setValueFont:v5];

  uint64_t v6 = [(HUTitleValueCell *)self titleLabel];
  [v6 setNumberOfLines:1];

  v7 = [(HUTitleValueCell *)self valueLabel];
  [v7 setNumberOfLines:1];

  [(HUTitleValueCell *)self setValueColorFollowsTintColor:0];
  [(HUTitleValueCell *)self setTitleColorFollowsTintColor:0];
  [(HUTitleValueCell *)self setAllowCopyValueToPasteboard:0];
  [(HUTitleValueCell *)self setUseVerticalLayoutOnly:0];
  [(HUTitleValueCell *)self setAccessoryView:0];
  [(HUTitleValueCell *)self setNeedsUpdateConstraints];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)HUTitleValueCell;
  [(HUTitleValueCell *)&v3 tintColorDidChange];
  [(HUTitleValueCell *)self _updateValue];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return sel_copy_ == a3 && [(HUTitleValueCell *)self allowCopyValueToPasteboard];
}

- (void)copy:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F42C50], "generalPasteboard", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [(HUTitleValueCell *)self valueLabel];
  uint64_t v5 = [v4 text];
  [v6 setString:v5];
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
  id v5 = a3;
  id v6 = [(HUTitleValueCell *)self titleLabel];
  [v6 setText:v5];

  id v7 = [(HUTitleValueCell *)self titleLabel];
  [v7 sizeToFit];
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
  id v5 = a3;
  id v6 = [(HUTitleValueCell *)self titleLabel];
  [v6 setFont:v5];
}

- (void)setHideTitle:(BOOL)a3
{
  if (self->_hideTitle != a3)
  {
    self->_hideTitle = a3;
    if (a3)
    {
      titleLabel = self->_titleLabel;
      [(UILabel *)titleLabel removeFromSuperview];
    }
    else
    {
      [(HUTitleValueCell *)self _addTitleLabel];
      [(HUTitleValueCell *)self setNeedsUpdateConstraints];
    }
  }
}

- (void)setValueText:(id)a3
{
  objc_storeStrong((id *)&self->_valueText, a3);
  id v5 = a3;
  id v6 = [(HUTitleValueCell *)self valueLabel];
  [v6 setText:v5];

  id v7 = [(HUTitleValueCell *)self valueLabel];
  [v7 sizeToFit];
}

- (void)setValueFont:(id)a3
{
  objc_storeStrong((id *)&self->_valueFont, a3);
  id v5 = a3;
  id v6 = [(HUTitleValueCell *)self valueLabel];
  [v6 setFont:v5];
}

- (void)setTitleColorFollowsTintColor:(BOOL)a3
{
  BOOL v3 = a3;
  self->_titleColorFollowsTintColor = a3;
  id v5 = [(HUTitleValueCell *)self titleLabel];
  [v5 _setTextColorFollowsTintColor:v3];

  [(HUTitleValueCell *)self _updateTitle];
}

- (void)setValueColorFollowsTintColor:(BOOL)a3
{
  BOOL v3 = a3;
  self->_valueColorFollowsTintColor = a3;
  id v5 = [(HUTitleValueCell *)self valueLabel];
  [v5 _setTextColorFollowsTintColor:v3];

  [(HUTitleValueCell *)self _updateValue];
}

- (void)setHideValue:(BOOL)a3
{
  if (self->_hideValue != a3)
  {
    self->_hideValue = a3;
    if (a3)
    {
      valueLabel = self->_valueLabel;
      [(UILabel *)valueLabel removeFromSuperview];
    }
    else
    {
      [(HUTitleValueCell *)self _addValueLabel];
      [(HUTitleValueCell *)self setNeedsUpdateConstraints];
    }
  }
}

- (void)setDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HUTitleValueCell;
  -[HUIconCell setDisabled:](&v5, sel_setDisabled_);
  [(HUTitleValueCell *)self _updateTitle];
  [(HUTitleValueCell *)self setUserInteractionEnabled:!v3];
}

- (void)updateConstraints
{
  BOOL v3 = [(HUTitleValueCell *)self stackViewConstraints];

  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    objc_super v5 = (void *)MEMORY[0x1E4F28DC8];
    id v6 = _NSDictionaryOfVariableBindings(&cfstr_Labelsstackvie_0.isa, self->_labelsStackView, 0);
    id v7 = [v5 constraintsWithVisualFormat:@"|[_labelsStackView]|" options:0 metrics:0 views:v6];
    [v4 addObjectsFromArray:v7];

    objc_super v8 = (void *)MEMORY[0x1E4F28DC8];
    v9 = _NSDictionaryOfVariableBindings(&cfstr_Labelsstackvie_0.isa, self->_labelsStackView, 0);
    v10 = [v8 constraintsWithVisualFormat:@"V:|[_labelsStackView]|" options:0 metrics:0 views:v9];
    [v4 addObjectsFromArray:v10];

    [(HUTitleValueCell *)self setStackViewConstraints:v4];
    [(UIStackView *)self->_labelsStackView updateConstraintsIfNeeded];
    [(UIStackView *)self->_labelsStackView setNeedsLayout];
    [MEMORY[0x1E4F28DC8] activateConstraints:v4];
  }
  [(HUTitleValueCell *)self _ensureCorrectHeaderViewOrientation];
  v11.receiver = self;
  v11.super_class = (Class)HUTitleValueCell;
  [(HUIconCell *)&v11 updateConstraints];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUTitleValueCell;
  [(HUTitleValueCell *)&v4 traitCollectionDidChange:a3];
  [(HUTitleValueCell *)self _ensureCorrectHeaderViewOrientation];
}

- (void)_ensureCorrectHeaderViewOrientation
{
  BOOL v3 = self->_labelsStackView;
  objc_super v4 = [(HUTitleValueCell *)self titleLabel];
  uint64_t v5 = [(HUTitleValueCell *)self valueLabel];
  id v6 = (void *)v5;
  if (v4 && v5)
  {
    [v4 sizeToFit];
    [v6 sizeToFit];
    id v7 = [v4 text];
    if ([v7 length])
    {
      objc_super v8 = [v6 text];
      if ([v8 length]) {
        [(HUTitleValueCell *)self labelSpacing];
      }
      else {
        double v9 = 0.0;
      }
      [(UIStackView *)v3 setSpacing:v9];
    }
    else
    {
      [(UIStackView *)v3 setSpacing:0.0];
    }

    id v15 = (id)MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __55__HUTitleValueCell__ensureCorrectHeaderViewOrientation__block_invoke;
    v18 = &unk_1E638F408;
    v19 = self;
    id v10 = v4;
    id v20 = v10;
    id v11 = v6;
    id v21 = v11;
    v12 = v3;
    v22 = v12;
    BOOL v13 = __55__HUTitleValueCell__ensureCorrectHeaderViewOrientation__block_invoke(&v15);
    -[UIStackView setDistribution:](v12, "setDistribution:", 0, v15, v16, v17, v18, v19);
    if (v13)
    {
      [(UIStackView *)v12 setAxis:1];
      [(UIStackView *)v12 setAlignment:0];
      [v10 setNumberOfLines:0];
      [v11 setNumberOfLines:0];
      uint64_t v14 = 4;
    }
    else
    {
      [(UIStackView *)v12 setAxis:0];
      [(UIStackView *)v12 setAlignment:2];
      [v10 setNumberOfLines:1];
      [v11 setNumberOfLines:1];
      uint64_t v14 = 2
          * ([(HUTitleValueCell *)self effectiveUserInterfaceLayoutDirection] == 0);
    }
    [v11 setTextAlignment:v14];
  }
}

BOOL __55__HUTitleValueCell__ensureCorrectHeaderViewOrientation__block_invoke(id *a1)
{
  if ([a1[4] useVerticalLayoutOnly]) {
    return 1;
  }
  BOOL v3 = [a1[4] iconView];
  objc_super v4 = [v3 iconDescriptor];
  double Width = 0.0;
  double v6 = 0.0;
  if (v4 && ([a1[4] hideIcon] & 1) == 0)
  {
    id v7 = [a1[4] contentMetrics];
    [v7 iconSize];
    double v9 = v8;
    id v10 = [a1[4] contentMetrics];
    [v10 contentInset];
    double v12 = v9 + v11;
    BOOL v13 = [a1[4] contentMetrics];
    [v13 contentInset];
    double v6 = v12 + v14;
  }
  id v15 = [a1[4] accessoryView];
  if (v15)
  {
    uint64_t v16 = [a1[4] accessoryView];
    [v16 frame];
    double Width = CGRectGetWidth(v24);
  }
  [a1[5] frame];
  double v17 = CGRectGetWidth(v25);
  [a1[6] frame];
  double v18 = v17 + CGRectGetWidth(v26);
  [a1[7] spacing];
  CGFloat v20 = v18 + v19;
  id v21 = [a1[4] contentView];
  v22 = [v21 readableContentGuide];
  [v22 layoutFrame];
  CGFloat v23 = CGRectGetWidth(v27) - v6 - Width;

  return v20 > v23;
}

- (double)labelSpacing
{
  return 16.0;
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  v31[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HUIconCell *)self item];
  double v6 = [v5 latestResults];

  v29.receiver = self;
  v29.super_class = (Class)HUTitleValueCell;
  [(HUIconCell *)&v29 updateUIWithAnimation:v3];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [(HUTitleValueCell *)self setTitleText:v7];

  double v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
  [(HUTitleValueCell *)self setAccessibilityIdentifier:v8];

  double v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
  if (v9
    || ([v6 objectForKeyedSubscript:*MEMORY[0x1E4F68990]],
        (double v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v30[0] = *MEMORY[0x1E4F42508];
    id v10 = [(HUTitleValueCell *)self valueLabel];
    double v11 = [v10 font];
    v31[0] = v11;
    v30[1] = *MEMORY[0x1E4F42510];
    double v12 = [(HUTitleValueCell *)self valueLabel];
    BOOL v13 = [v12 textColor];
    v31[1] = v13;
    double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

    if ([v9 prefersDynamicString])
    {
      id v15 = [(HUTitleValueCell *)self valueLabel];
      [v15 bounds];
      double v18 = objc_msgSend(v9, "dynamicStringForSize:attributes:", v14, v16, v17);
      double v19 = [(HUTitleValueCell *)self valueLabel];
      [v19 setAttributedText:v18];
    }
    else
    {
      id v15 = [v9 stringWithAttributes:v14];
      double v18 = [(HUTitleValueCell *)self valueLabel];
      [v18 setAttributedText:v15];
    }

    CGFloat v20 = [(HUTitleValueCell *)self valueLabel];
    [v20 sizeToFit];
  }
  else
  {
    double v9 = [(HUTitleValueCell *)self valueLabel];
    [v9 setAttributedText:0];
  }

  objc_opt_class();
  id v21 = [(HUTitleValueCell *)self accessoryView];
  if (objc_opt_isKindOfClass()) {
    v22 = v21;
  }
  else {
    v22 = 0;
  }
  CGFloat v23 = v22;

  CGRect v24 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68940]];
  uint64_t v25 = [v24 unsignedIntegerValue];

  if (v25 == 2)
  {
    if (!v23)
    {
      CGRect v26 = [HUBadgeAndDisclosureAccessoryView alloc];
      id v21 = -[HUBadgeAndDisclosureAccessoryView initWithFrame:](v26, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
    CGRect v27 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68930]];
    -[HUBadgeAndDisclosureAccessoryView setBadgeCount:](v21, "setBadgeCount:", [v27 integerValue]);

    [(HUBadgeAndDisclosureAccessoryView *)v21 sizeToFit];
    v28 = v21;
    goto LABEL_16;
  }
  if (v23)
  {
    v28 = 0;
LABEL_16:
    [(HUTitleValueCell *)self setAccessoryView:v28];
  }
  [(HUTitleValueCell *)self _updateTitle];
  [(HUTitleValueCell *)self _ensureCorrectHeaderViewOrientation];
}

- (void)_addTitleLabel
{
  BOOL v3 = [(UILabel *)self->_titleLabel superview];

  if (v3) {
    NSLog(&cfstr_TitleLabelAlre.isa, self);
  }
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v6 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v7 = self->_titleLabel;
    self->_titleLabel = v6;

    [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    double v8 = [(HUTitleValueCell *)self titleFont];
    [(UILabel *)self->_titleLabel setFont:v8];

    double v9 = [(HUTitleValueCell *)self titleText];
    [(UILabel *)self->_titleLabel setText:v9];

    [(UILabel *)self->_titleLabel _setTextColorFollowsTintColor:[(HUTitleValueCell *)self titleColorFollowsTintColor]];
    id v10 = [MEMORY[0x1E4F428B8] labelColor];
    [(UILabel *)self->_titleLabel setTextColor:v10];

    [(UILabel *)self->_titleLabel setLineBreakMode:0];
    titleLabel = self->_titleLabel;
  }
  [(UIStackView *)self->_labelsStackView addArrangedSubview:titleLabel];

  [(HUTitleValueCell *)self _updateTitle];
}

- (void)_addValueLabel
{
  BOOL v3 = [(UILabel *)self->_valueLabel superview];

  if (v3) {
    NSLog(&cfstr_ValueLabelAlre.isa, self);
  }
  valueLabel = self->_valueLabel;
  if (!valueLabel)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v6 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v7 = self->_valueLabel;
    self->_valueLabel = v6;

    [(UILabel *)self->_valueLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    double v8 = [(HUTitleValueCell *)self valueFont];
    [(UILabel *)self->_valueLabel setFont:v8];

    double v9 = [(HUTitleValueCell *)self valueText];
    [(UILabel *)self->_valueLabel setText:v9];

    [(UILabel *)self->_valueLabel _setTextColorFollowsTintColor:[(HUTitleValueCell *)self valueColorFollowsTintColor]];
    [(UILabel *)self->_valueLabel setLineBreakMode:0];
    valueLabel = self->_valueLabel;
  }
  [(UIStackView *)self->_labelsStackView addArrangedSubview:valueLabel];

  [(HUTitleValueCell *)self _updateValue];
}

- (void)_updateTitle
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__HUTitleValueCell__updateTitle__block_invoke;
  v4[3] = &unk_1E638CC28;
  v4[4] = self;
  BOOL v3 = __32__HUTitleValueCell__updateTitle__block_invoke((uint64_t)v4);
  [(UILabel *)self->_titleLabel setTextColor:v3];
  [(HUTitleValueCell *)self setTextColor:v3];
}

id __32__HUTitleValueCell__updateTitle__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isDisabled])
  {
    v2 = [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else
  {
    if ([*(id *)(a1 + 32) titleColorFollowsTintColor]) {
      [*(id *)(a1 + 32) tintColor];
    }
    else {
    v2 = [MEMORY[0x1E4F428B8] labelColor];
    }
  }

  return v2;
}

- (void)_updateValue
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__HUTitleValueCell__updateValue__block_invoke;
  v4[3] = &unk_1E638CC28;
  v4[4] = self;
  BOOL v3 = __32__HUTitleValueCell__updateValue__block_invoke((uint64_t)v4);
  [(UILabel *)self->_valueLabel setTextColor:v3];
}

id __32__HUTitleValueCell__updateValue__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isDisabled] & 1) != 0
    || ([*(id *)(a1 + 32) valueColorFollowsTintColor] & 1) == 0)
  {
    v2 = [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else
  {
    v2 = [*(id *)(a1 + 32) tintColor];
  }

  return v2;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (UIStackView)labelsStackView
{
  return self->_labelsStackView;
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

- (NSString)valueText
{
  return self->_valueText;
}

- (UIFont)valueFont
{
  return self->_valueFont;
}

- (BOOL)hideValue
{
  return self->_hideValue;
}

- (BOOL)titleColorFollowsTintColor
{
  return self->_titleColorFollowsTintColor;
}

- (BOOL)valueColorFollowsTintColor
{
  return self->_valueColorFollowsTintColor;
}

- (BOOL)allowCopyValueToPasteboard
{
  return self->_allowCopyValueToPasteboard;
}

- (void)setAllowCopyValueToPasteboard:(BOOL)a3
{
  self->_allowCopyValueToPasteboard = a3;
}

- (BOOL)useVerticalLayoutOnly
{
  return self->_useVerticalLayoutOnly;
}

- (void)setUseVerticalLayoutOnly:(BOOL)a3
{
  self->_useVerticalLayoutOnly = a3;
}

- (NSArray)stackViewConstraints
{
  return self->_stackViewConstraints;
}

- (void)setStackViewConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackViewConstraints, 0);
  objc_storeStrong((id *)&self->_valueFont, 0);
  objc_storeStrong((id *)&self->_valueText, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_labelsStackView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end