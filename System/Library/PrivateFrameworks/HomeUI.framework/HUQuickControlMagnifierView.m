@interface HUQuickControlMagnifierView
- (CGSize)sizeThatFits:(CGSize)a3;
- (HUQuickControlMagnifierView)initWithFrame:(CGRect)a3;
- (double)_outlineWidth;
- (double)innerRadius;
- (void)layoutSubviews;
- (void)setInnerRadius:(double)a3;
@end

@implementation HUQuickControlMagnifierView

- (HUQuickControlMagnifierView)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)HUQuickControlMagnifierView;
  v3 = -[HUQuickControlMagnifierView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(HUQuickControlMagnifierView *)v3 setSelectedColor:0];
    [(HUQuickControlMagnifierView *)v4 _outlineWidth];
    double v6 = v5;
    v7 = [(HUQuickControlMagnifierView *)v4 layer];
    [v7 setBorderWidth:v6];

    id v8 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    uint64_t v9 = [v8 CGColor];
    v10 = [(HUQuickControlMagnifierView *)v4 layer];
    [v10 setBorderColor:v9];

    v11 = [(HUQuickControlMagnifierView *)v4 layer];
    LODWORD(v12) = 1045220557;
    [v11 setShadowOpacity:v12];

    v13 = [(HUQuickControlMagnifierView *)v4 layer];
    [v13 setShadowRadius:15.0];

    double v14 = *MEMORY[0x1E4F1DB30];
    double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    v16 = [(HUQuickControlMagnifierView *)v4 layer];
    objc_msgSend(v16, "setShadowOffset:", v14, v15);
  }
  return v4;
}

- (double)_outlineWidth
{
  v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 scale];
  double v4 = v3;

  double result = 1.66666667;
  if (v4 <= 2.0) {
    return 1.5;
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(HUQuickControlMagnifierView *)self innerRadius];
  double v5 = v4;
  [(HUQuickControlMagnifierView *)self _outlineWidth];
  double v7 = v5 + v6 + v5 + v6;
  double v8 = v7;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)HUQuickControlMagnifierView;
  [(HUQuickControlMagnifierView *)&v10 layoutSubviews];
  [(HUQuickControlMagnifierView *)self bounds];
  double v4 = v3 * 0.5;
  double v5 = [(HUQuickControlMagnifierView *)self layer];
  [v5 setCornerRadius:v4];

  double v6 = (void *)MEMORY[0x1E4F427D0];
  [(HUQuickControlMagnifierView *)self bounds];
  objc_msgSend(v6, "bezierPathWithOvalInRect:");
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 CGPath];
  uint64_t v9 = [(HUQuickControlMagnifierView *)self layer];
  [v9 setShadowPath:v8];
}

- (double)innerRadius
{
  return self->_innerRadius;
}

- (void)setInnerRadius:(double)a3
{
  self->_innerRadius = a3;
}

@end