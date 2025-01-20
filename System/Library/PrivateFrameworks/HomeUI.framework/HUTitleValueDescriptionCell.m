@interface HUTitleValueDescriptionCell
- (BOOL)hideValue;
- (BOOL)valueColorFollowsTintColor;
- (HUTitleValueDescriptionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSLayoutConstraint)valueLabelWidthConstraint;
- (NSString)valueText;
- (UIFont)valueFont;
- (UILabel)valueLabel;
- (void)_updateValue;
- (void)_updateValueHidden;
- (void)_updateValueWidthConstraintConstant;
- (void)prepareForReuse;
- (void)setHideValue:(BOOL)a3;
- (void)setValueColorFollowsTintColor:(BOOL)a3;
- (void)setValueFont:(id)a3;
- (void)setValueLabel:(id)a3;
- (void)setValueLabelWidthConstraint:(id)a3;
- (void)setValueText:(id)a3;
- (void)updateConstraints;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUTitleValueDescriptionCell

- (HUTitleValueDescriptionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)HUTitleValueDescriptionCell;
  v4 = [(HUTitleDescriptionCell *)&v14 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
    valueFont = v4->_valueFont;
    v4->_valueFont = (UIFont *)v5;

    [(HUTitleDescriptionCell *)v4 setMaxNumberOfTitleLines:0];
    v7 = (void *)MEMORY[0x1E4F42B38];
    v8 = [(HUTitleDescriptionCell *)v4 titleText];
    v9 = [(HUTitleDescriptionCell *)v4 titleFont];
    uint64_t v10 = [v7 labelWithText:v8 font:v9];
    valueLabel = v4->_valueLabel;
    v4->_valueLabel = (UILabel *)v10;

    [(UILabel *)v4->_valueLabel _setTextColorFollowsTintColor:[(HUTitleValueDescriptionCell *)v4 valueColorFollowsTintColor]];
    v12 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [(UILabel *)v4->_valueLabel setTextColor:v12];
  }
  return v4;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)HUTitleValueDescriptionCell;
  [(HUTitleDescriptionCell *)&v4 prepareForReuse];
  [(HUTitleValueDescriptionCell *)self setHideValue:0];
  [(HUTitleValueDescriptionCell *)self setValueText:0];
  v3 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
  [(HUTitleValueDescriptionCell *)self setValueFont:v3];

  [(HUTitleValueDescriptionCell *)self setValueColorFollowsTintColor:0];
}

- (void)setHideValue:(BOOL)a3
{
  if (self->_hideValue != a3)
  {
    self->_hideValue = a3;
    [(HUTitleValueDescriptionCell *)self _updateValueHidden];
  }
}

- (void)setValueText:(id)a3
{
  id v5 = a3;
  id v6 = [(HUTitleValueDescriptionCell *)self valueText];
  id v7 = v5;
  id v10 = v7;
  if (v6 == v7)
  {

    goto LABEL_8;
  }
  if (!v6)
  {

    goto LABEL_7;
  }
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_valueText, a3);
    v9 = [(HUTitleValueDescriptionCell *)self valueLabel];
    [v9 setText:v10];

    [(HUTitleValueDescriptionCell *)self _updateValueHidden];
    [(HUTitleValueDescriptionCell *)self _updateValueWidthConstraintConstant];
  }
LABEL_8:
}

- (void)setValueFont:(id)a3
{
  id v6 = a3;
  if ((-[UIFont isEqual:](self->_valueFont, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_valueFont, a3);
    id v5 = [(HUTitleValueDescriptionCell *)self valueLabel];
    [v5 setFont:v6];

    [(HUTitleValueDescriptionCell *)self _updateValueWidthConstraintConstant];
  }
}

- (void)setValueColorFollowsTintColor:(BOOL)a3
{
  if (self->_valueColorFollowsTintColor != a3)
  {
    BOOL v3 = a3;
    self->_valueColorFollowsTintColor = a3;
    id v5 = [(HUTitleValueDescriptionCell *)self valueLabel];
    [v5 _setTextColorFollowsTintColor:v3];

    [(HUTitleValueDescriptionCell *)self _updateValue];
  }
}

- (void)updateConstraints
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  objc_super v4 = [(HUTitleValueDescriptionCell *)self valueLabel];
  [v4 setNumberOfLines:0];

  v44.receiver = self;
  v44.super_class = (Class)HUTitleValueDescriptionCell;
  [(HUTitleDescriptionCell *)&v44 updateConstraints];
  id v5 = [(HUTitleValueDescriptionCell *)self valueLabel];
  id v6 = [v5 superview];

  if (v6)
  {
    id v7 = [(HUTitleValueDescriptionCell *)self valueLabel];
    char v8 = [v7 centerYAnchor];
    v9 = [(HUTitleValueDescriptionCell *)self contentView];
    id v10 = [v9 centerYAnchor];
    v11 = [v8 constraintEqualToAnchor:v10];
    [v3 addObject:v11];

    v12 = [(HUTitleValueDescriptionCell *)self contentView];
    v13 = [v12 layoutMarginsGuide];
    objc_super v14 = [v13 trailingAnchor];
    v15 = [(HUTitleValueDescriptionCell *)self valueLabel];
    v16 = [v15 trailingAnchor];
    v17 = [v14 constraintEqualToSystemSpacingAfterAnchor:v16 multiplier:1.0];
    [v3 addObject:v17];

    v18 = [(HUTitleValueDescriptionCell *)self valueLabelWidthConstraint];

    if (!v18)
    {
      v19 = [(HUTitleValueDescriptionCell *)self valueLabel];
      v20 = [v19 widthAnchor];
      v21 = [v20 constraintEqualToConstant:1.0];
      [(HUTitleValueDescriptionCell *)self setValueLabelWidthConstraint:v21];
    }
    [(HUTitleValueDescriptionCell *)self _updateValueWidthConstraintConstant];
    v22 = [(HUTitleValueDescriptionCell *)self valueLabelWidthConstraint];
    [v3 addObject:v22];

    v23 = [(HUTitleDescriptionCell *)self titleLabel];
    v24 = [v23 trailingAnchor];
    v25 = [v24 constraintsAffectingLayout];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __48__HUTitleValueDescriptionCell_updateConstraints__block_invoke;
    v43[3] = &unk_1E638D2A8;
    v43[4] = self;
    objc_msgSend(v25, "na_each:", v43);

    v26 = [(HUTitleDescriptionCell *)self descriptionLabel];
    v27 = [v26 trailingAnchor];
    v28 = [v27 constraintsAffectingLayout];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __48__HUTitleValueDescriptionCell_updateConstraints__block_invoke_2;
    v42[3] = &unk_1E638D2A8;
    v42[4] = self;
    objc_msgSend(v28, "na_each:", v42);

    v29 = [(HUTitleDescriptionCell *)self titleTrailingConstraint];
    [v29 setActive:0];

    v30 = [(HUTitleDescriptionCell *)self descriptionTrailingConstraint];
    [v30 setActive:0];

    v31 = [(HUTitleValueDescriptionCell *)self valueLabel];
    v32 = [v31 leadingAnchor];
    v33 = [(HUTitleDescriptionCell *)self titleLabel];
    v34 = [v33 trailingAnchor];
    v35 = [v32 constraintEqualToSystemSpacingAfterAnchor:v34 multiplier:1.0];
    [v3 addObject:v35];

    v36 = [(HUTitleValueDescriptionCell *)self valueLabel];
    v37 = [v36 leadingAnchor];
    v38 = [(HUTitleDescriptionCell *)self descriptionLabel];
    v39 = [v38 trailingAnchor];
    v40 = [v37 constraintEqualToSystemSpacingAfterAnchor:v39 multiplier:1.0];
    [v3 addObject:v40];
  }
  else
  {
    v41 = [(HUTitleValueDescriptionCell *)self valueLabelWidthConstraint];
    [v41 setActive:0];

    [(HUTitleValueDescriptionCell *)self setValueLabelWidthConstraint:0];
  }
  [MEMORY[0x1E4F28DC8] activateConstraints:v3];
}

void __48__HUTitleValueDescriptionCell_updateConstraints__block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  BOOL v3 = [v13 firstAnchor];
  objc_super v4 = [*(id *)(a1 + 32) titleLabel];
  id v5 = [v4 trailingAnchor];
  if ([v3 isEqual:v5]) {
    [v13 secondAnchor];
  }
  else {
  id v6 = [v13 firstAnchor];
  }

  id v7 = [*(id *)(a1 + 32) titleLabel];
  char v8 = [v7 superview];
  v9 = [v8 trailingAnchor];
  if ([v6 isEqual:v9])
  {
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) containerView];
    v11 = [v10 trailingAnchor];
    int v12 = [v6 isEqual:v11];

    if (!v12) {
      goto LABEL_8;
    }
  }
  [v13 setActive:0];
LABEL_8:
}

void __48__HUTitleValueDescriptionCell_updateConstraints__block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  BOOL v3 = [v13 firstAnchor];
  objc_super v4 = [*(id *)(a1 + 32) descriptionLabel];
  id v5 = [v4 trailingAnchor];
  if ([v3 isEqual:v5]) {
    [v13 secondAnchor];
  }
  else {
  id v6 = [v13 firstAnchor];
  }

  id v7 = [*(id *)(a1 + 32) descriptionLabel];
  char v8 = [v7 superview];
  v9 = [v8 trailingAnchor];
  if ([v6 isEqual:v9])
  {
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) containerView];
    v11 = [v10 trailingAnchor];
    int v12 = [v6 isEqual:v11];

    if (!v12) {
      goto LABEL_8;
    }
  }
  [v13 setActive:0];
LABEL_8:
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HUTitleValueDescriptionCell;
  [(HUTitleDescriptionCell *)&v9 updateUIWithAnimation:a3];
  objc_opt_class();
  objc_super v4 = [(HUIconCell *)self item];
  id v5 = [v4 latestResults];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68990]];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  [(HUTitleValueDescriptionCell *)self setValueText:v8];

  [(HUTitleValueDescriptionCell *)self _updateValueWidthConstraintConstant];
}

- (void)_updateValueWidthConstraintConstant
{
  BOOL v3 = [(HUTitleValueDescriptionCell *)self valueLabel];
  [(HUTitleValueDescriptionCell *)self bounds];
  objc_msgSend(v3, "sizeThatFits:", v4, v5);
  double v7 = v6;

  id v8 = [(HUTitleValueDescriptionCell *)self valueLabelWidthConstraint];

  if (v8)
  {
    id v9 = [(HUTitleValueDescriptionCell *)self valueLabelWidthConstraint];
    [v9 setConstant:v7];
  }
}

- (void)_updateValueHidden
{
  if ([(HUTitleValueDescriptionCell *)self hideValue])
  {
    BOOL v3 = 1;
  }
  else
  {
    double v4 = [(HUTitleValueDescriptionCell *)self valueText];
    BOOL v3 = [v4 length] == 0;
  }
  double v5 = [(HUTitleValueDescriptionCell *)self valueLabel];
  double v6 = [v5 superview];
  BOOL v7 = v6 != 0;

  if (((v3 ^ v7) & 1) == 0)
  {
    if (v3)
    {
      id v8 = [(HUTitleValueDescriptionCell *)self valueLabel];
      [v8 removeFromSuperview];
    }
    else
    {
      id v9 = [(HUIconCell *)self containerView];
      id v10 = [(HUTitleValueDescriptionCell *)self valueLabel];
      [v9 addSubview:v10];

      [(HUTitleValueDescriptionCell *)self _updateValueWidthConstraintConstant];
    }
    [(HUTitleValueDescriptionCell *)self setNeedsUpdateConstraints];
    [(HUTitleDescriptionCell *)self updateTitle];
  }
}

- (void)_updateValue
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__HUTitleValueDescriptionCell__updateValue__block_invoke;
  v4[3] = &unk_1E638CC28;
  v4[4] = self;
  BOOL v3 = __43__HUTitleValueDescriptionCell__updateValue__block_invoke((uint64_t)v4);
  [(UILabel *)self->_valueLabel setTextColor:v3];
}

id __43__HUTitleValueDescriptionCell__updateValue__block_invoke(uint64_t a1)
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

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
}

- (BOOL)valueColorFollowsTintColor
{
  return self->_valueColorFollowsTintColor;
}

- (NSLayoutConstraint)valueLabelWidthConstraint
{
  return self->_valueLabelWidthConstraint;
}

- (void)setValueLabelWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_valueFont, 0);

  objc_storeStrong((id *)&self->_valueText, 0);
}

@end