@interface AMPTintedBackgroundButton
- (void)setHighlighted:(BOOL)a3;
- (void)tintColorDidChange;
- (void)updateBackgroundColor;
@end

@implementation AMPTintedBackgroundButton

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)AMPTintedBackgroundButton;
  [(AMPTintedBackgroundButton *)&v3 tintColorDidChange];
  [(AMPTintedBackgroundButton *)self updateBackgroundColor];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMPTintedBackgroundButton;
  [(AMPTintedBackgroundButton *)&v4 setHighlighted:a3];
  [(AMPTintedBackgroundButton *)self updateBackgroundColor];
}

- (void)updateBackgroundColor
{
  char v3 = [(AMPTintedBackgroundButton *)self isHighlighted];
  objc_super v4 = [(AMPTintedBackgroundButton *)self tintColor];
  id v6 = v4;
  if (v3)
  {
    v5 = [v4 colorWithAlphaComponent:0.6];
    [(AMPTintedBackgroundButton *)self setBackgroundColor:v5];
  }
  else
  {
    [(AMPTintedBackgroundButton *)self setBackgroundColor:v4];
  }
}

@end