@interface HUQuickControlCircleButton
- (HUQuickControlCircleButton)initWithFrame:(CGRect)a3;
- (UIColor)selectedColor;
- (UIColor)standardBackgroundColor;
- (UIView)backgroundView;
- (double)fontSize;
- (void)_adjustTitleColor;
- (void)_controlStateChanged;
- (void)layoutSubviews;
- (void)setBackgroundView:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFontSize:(double)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelectedColor:(id)a3;
- (void)setStandardBackgroundColor:(id)a3;
@end

@implementation HUQuickControlCircleButton

- (HUQuickControlCircleButton)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)HUQuickControlCircleButton;
  v3 = -[HUQuickControlCircleButton initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(HUQuickControlCircleButton *)v3 layer];
    [v5 setAllowsGroupOpacity:0];

    [(HUQuickControlCircleButton *)v4 setFontSize:21.0];
    v6 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(HUQuickControlCircleButton *)v4 setTitleColor:v6 forState:0];

    v7 = [(HUQuickControlCircleButton *)v4 titleLabel];
    [v7 setAdjustsFontSizeToFitWidth:1];

    v8 = [[HUQuickControlBackgroundEffectView alloc] initWithEffectType:1];
    [(HUQuickControlCircleButton *)v4 setBackgroundView:v8];

    v9 = [(HUQuickControlCircleButton *)v4 backgroundView];
    [v9 setUserInteractionEnabled:0];

    v10 = [(HUQuickControlCircleButton *)v4 backgroundView];
    [(HUQuickControlCircleButton *)v4 insertSubview:v10 atIndex:0];

    v11 = [(HUQuickControlCircleButton *)v4 backgroundView];
    v12 = [v11 tintColor];
    [(HUQuickControlCircleButton *)v4 setStandardBackgroundColor:v12];
  }
  return v4;
}

- (double)fontSize
{
  v2 = [(HUQuickControlCircleButton *)self titleLabel];
  v3 = [v2 font];
  [v3 pointSize];
  double v5 = v4;

  return v5;
}

- (void)setFontSize:(double)a3
{
  id v5 = [MEMORY[0x1E4F42A30] systemFontOfSize:a3 weight:*MEMORY[0x1E4F43930]];
  double v4 = [(HUQuickControlCircleButton *)self titleLabel];
  [v4 setFont:v5];
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlCircleButton;
  [(HUQuickControlCircleButton *)&v4 setEnabled:a3];
  [(HUQuickControlCircleButton *)self _controlStateChanged];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlCircleButton;
  [(HUQuickControlCircleButton *)&v4 setHighlighted:a3];
  [(HUQuickControlCircleButton *)self _controlStateChanged];
}

- (void)setSelectedColor:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_selectedColor, a3);
  if (v8)
  {
    [(HUQuickControlCircleButton *)self setBackgroundColor:v8];
    id v5 = [(HUQuickControlCircleButton *)self backgroundView];
    v6 = v5;
    uint64_t v7 = 1;
  }
  else
  {
    [(HUQuickControlCircleButton *)self setBackgroundColor:0];
    id v5 = [(HUQuickControlCircleButton *)self backgroundView];
    v6 = v5;
    uint64_t v7 = 0;
  }
  [v5 setHidden:v7];

  [(HUQuickControlCircleButton *)self _adjustTitleColor];
}

- (void)_adjustTitleColor
{
  v3 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  objc_super v4 = [(HUQuickControlCircleButton *)self selectedColor];
  [v3 _luminanceDifferenceFromColor:v4];
  double v6 = v5;

  uint64_t v7 = [(HUQuickControlCircleButton *)self selectedColor];

  if (v7 && v6 < 0.1)
  {
    uint64_t v8 = [MEMORY[0x1E4F428B8] systemBlackColor];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  }
  id v9 = (id)v8;
  [(HUQuickControlCircleButton *)self setTitleColor:v8 forState:0];
}

- (void)_controlStateChanged
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__HUQuickControlCircleButton__controlStateChanged__block_invoke;
  v2[3] = &unk_1E6386018;
  v2[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v2 animations:0.2];
}

void __50__HUQuickControlCircleButton__controlStateChanged__block_invoke(uint64_t a1)
{
  double v2 = 1.0;
  if ([*(id *)(a1 + 32) isHighlighted]) {
    double v3 = 0.3;
  }
  else {
    double v3 = 1.0;
  }
  [*(id *)(a1 + 32) setAlpha:v3];
  if ([*(id *)(a1 + 32) isHighlighted]) {
    double v4 = 0.3;
  }
  else {
    double v4 = 1.0;
  }
  double v5 = [*(id *)(a1 + 32) backgroundView];
  [v5 setAlpha:v4];

  if (([*(id *)(a1 + 32) isHighlighted] & 1) != 0
    || ([*(id *)(a1 + 32) isEnabled] & 1) == 0)
  {
    double v2 = 0.3;
  }
  id v6 = [*(id *)(a1 + 32) titleLabel];
  [v6 setAlpha:v2];
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)HUQuickControlCircleButton;
  [(HUQuickControlCircleButton *)&v19 layoutSubviews];
  [(HUQuickControlCircleButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(HUQuickControlCircleButton *)self backgroundView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(HUQuickControlCircleButton *)self bounds];
  double v13 = v12 * 0.5;
  objc_super v14 = [(HUQuickControlCircleButton *)self backgroundView];
  v15 = [v14 layer];
  [v15 setCornerRadius:v13];

  [(HUQuickControlCircleButton *)self bounds];
  double v17 = v16 * 0.5;
  v18 = [(HUQuickControlCircleButton *)self layer];
  [v18 setCornerRadius:v17];
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIColor)standardBackgroundColor
{
  return self->_standardBackgroundColor;
}

- (void)setStandardBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standardBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_selectedColor, 0);
}

@end