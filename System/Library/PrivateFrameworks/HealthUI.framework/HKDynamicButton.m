@interface HKDynamicButton
- (CGSize)intrinsicContentSize;
- (NSLayoutConstraint)heightConstraint;
- (double)_buttonLabelHeight;
- (void)_updateForCurrentSizeCategory;
- (void)setHeightConstraint:(id)a3;
- (void)setTitle:(id)a3 forState:(unint64_t)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HKDynamicButton

- (void)setHeightConstraint:(id)a3
{
  id v5 = a3;
  p_heightConstraint = (id *)&self->_heightConstraint;
  id v7 = *p_heightConstraint;
  if (*p_heightConstraint != v5)
  {
    id v8 = v5;
    [v7 setActive:0];
    objc_storeStrong(p_heightConstraint, a3);
    id v7 = (id)[*p_heightConstraint setActive:1];
    id v5 = v8;
  }
  MEMORY[0x1F41817F8](v7, v5);
}

- (CGSize)intrinsicContentSize
{
  [(HKDynamicButton *)self _buttonLabelHeight];
  double v3 = v2;
  double v4 = 288.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (double)_buttonLabelHeight
{
  [(HKDynamicButton *)self contentEdgeInsets];
  double v4 = 288.0 - v3;
  [(HKDynamicButton *)self contentEdgeInsets];
  double v6 = fmax(v4 - v5, 0.0);
  id v7 = [(HKDynamicButton *)self titleLabel];
  objc_msgSend(v7, "sizeThatFits:", v6, 0.0);
  double v9 = v8 + 22.0;

  double result = 50.0;
  if (v9 >= 50.0) {
    return v9;
  }
  return result;
}

- (void)_updateForCurrentSizeCategory
{
  double v3 = [(HKDynamicButton *)self titleLabel];
  double v4 = _HKMediumScaledPreferredBodyFontWithValue(17.0);
  [v3 setFont:v4];

  [(HKDynamicButton *)self _buttonLabelHeight];
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:");
  [(HKDynamicButton *)self setNeedsDisplay];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKDynamicButton;
  [(HKDynamicButton *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    double v5 = [(HKDynamicButton *)self traitCollection];
    double v6 = [v5 preferredContentSizeCategory];
    id v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(HKDynamicButton *)self _updateForCurrentSizeCategory];
    }
  }
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HKDynamicButton;
  [(HKDynamicButton *)&v5 setTitle:a3 forState:a4];
  [(HKDynamicButton *)self _updateForCurrentSizeCategory];
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void).cxx_destruct
{
}

@end