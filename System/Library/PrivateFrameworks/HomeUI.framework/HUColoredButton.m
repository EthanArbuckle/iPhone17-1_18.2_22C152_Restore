@interface HUColoredButton
- (BOOL)backgroundColorFollowsTintColor;
- (HUColoredButton)initWithFrame:(CGRect)a3;
- (HUColoredButton)initWithFrame:(CGRect)a3 highlightedAlpha:(double)a4 highlightedTextAlpha:(double)a5;
- (double)highlightedAlpha;
- (double)highlightedTextAlpha;
- (void)setBackgroundColorFollowsTintColor:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedAlpha:(double)a3;
- (void)setHighlightedTextAlpha:(double)a3;
- (void)tintColorDidChange;
@end

@implementation HUColoredButton

- (HUColoredButton)initWithFrame:(CGRect)a3
{
  return -[HUColoredButton initWithFrame:highlightedAlpha:highlightedTextAlpha:](self, "initWithFrame:highlightedAlpha:highlightedTextAlpha:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.5, 0.25);
}

- (HUColoredButton)initWithFrame:(CGRect)a3 highlightedAlpha:(double)a4 highlightedTextAlpha:(double)a5
{
  v17.receiver = self;
  v17.super_class = (Class)HUColoredButton;
  v7 = -[HUColoredButton initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    [(HUColoredButton *)v7 setCornerRadius:8.0];
    [(HUColoredButton *)v8 setHighlightedAlpha:a4];
    [(HUColoredButton *)v8 setHighlightedTextAlpha:a5];
    v9 = [MEMORY[0x1E4F42A30] systemFontOfSize:17.0 weight:*MEMORY[0x1E4F43920]];
    v10 = [(HUColoredButton *)v8 titleLabel];
    [v10 setFont:v9];

    v11 = [(HUColoredButton *)v8 titleLabel];
    [v11 setBaselineAdjustment:1];

    v12 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(HUColoredButton *)v8 setTitleColor:v12 forState:0];

    v13 = (void *)MEMORY[0x1E4F428B8];
    [(HUColoredButton *)v8 highlightedTextAlpha];
    v15 = [v13 colorWithWhite:1.0 alpha:v14];
    [(HUColoredButton *)v8 setTitleColor:v15 forState:1];
  }
  return v8;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HUColoredButton;
  -[HUColoredButton setHighlighted:](&v6, sel_setHighlighted_);
  double v5 = 1.0;
  if (v3) {
    [(HUColoredButton *)self highlightedAlpha];
  }
  [(HUColoredButton *)self setAlpha:v5];
}

- (void)setBackgroundColorFollowsTintColor:(BOOL)a3
{
  if (self->_backgroundColorFollowsTintColor != a3)
  {
    self->_backgroundColorFollowsTintColor = a3;
    if (a3)
    {
      id v4 = [(HUColoredButton *)self tintColor];
      [(HUColoredButton *)self setBackgroundColor:v4];
    }
  }
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)HUColoredButton;
  [(HUColoredButton *)&v4 tintColorDidChange];
  if ([(HUColoredButton *)self backgroundColorFollowsTintColor])
  {
    BOOL v3 = [(HUColoredButton *)self tintColor];
    [(HUColoredButton *)self setBackgroundColor:v3];
  }
}

- (BOOL)backgroundColorFollowsTintColor
{
  return self->_backgroundColorFollowsTintColor;
}

- (double)highlightedAlpha
{
  return self->_highlightedAlpha;
}

- (void)setHighlightedAlpha:(double)a3
{
  self->_highlightedAlpha = a3;
}

- (double)highlightedTextAlpha
{
  return self->_highlightedTextAlpha;
}

- (void)setHighlightedTextAlpha:(double)a3
{
  self->_highlightedTextAlpha = a3;
}

@end