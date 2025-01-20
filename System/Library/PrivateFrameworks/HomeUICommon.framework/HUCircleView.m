@interface HUCircleView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)backgroundColorFollowsTintColor;
- (BOOL)borderColorFollowsTintColor;
- (HUCircleView)initWithFrame:(CGRect)a3;
- (UIView)controlCenterMaterialView;
- (void)layoutSubviews;
- (void)setBackgroundColorFollowsTintColor:(BOOL)a3;
- (void)setBorderColorFollowsTintColor:(BOOL)a3;
- (void)setControlCenterMaterialView:(id)a3;
- (void)tintColorDidChange;
@end

@implementation HUCircleView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUCircleView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HUCircleView;
  v3 = -[HUCircleView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(HUCircleView *)v3 setOpaque:0];
    [(HUCircleView *)v4 setUserInteractionEnabled:0];
    v5 = [(HUCircleView *)v4 widthAnchor];
    v6 = [(HUCircleView *)v4 heightAnchor];
    v7 = [v5 constraintEqualToAnchor:v6];
    [v7 setActive:1];

    if ([MEMORY[0x263F47C58] shouldUseControlCenterMaterials])
    {
      uint64_t v8 = [MEMORY[0x263F33CA0] controlCenterTertiaryMaterial];
      controlCenterMaterialView = v4->_controlCenterMaterialView;
      v4->_controlCenterMaterialView = (UIView *)v8;

      [(HUCircleView *)v4 addSubview:v4->_controlCenterMaterialView];
    }
  }
  return v4;
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)HUCircleView;
  [(HUCircleView *)&v19 layoutSubviews];
  [(HUCircleView *)self bounds];
  CGFloat v3 = CGRectGetWidth(v20) * 0.5;
  v4 = [(HUCircleView *)self layer];
  [v4 setCornerRadius:v3];

  if ([MEMORY[0x263F47C58] shouldUseControlCenterMaterials])
  {
    [(HUCircleView *)self frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [(HUCircleView *)self controlCenterMaterialView];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    v14 = [(HUCircleView *)self layer];
    [v14 cornerRadius];
    double v16 = v15;
    v17 = [(HUCircleView *)self controlCenterMaterialView];
    v18 = [v17 layer];
    [v18 setCornerRadius:v16];
  }
}

- (void)tintColorDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)HUCircleView;
  [(HUCircleView *)&v7 tintColorDidChange];
  if ([(HUCircleView *)self backgroundColorFollowsTintColor])
  {
    CGFloat v3 = [(HUCircleView *)self tintColor];
    [(HUCircleView *)self setBackgroundColor:v3];
  }
  if ([(HUCircleView *)self borderColorFollowsTintColor])
  {
    id v4 = [(HUCircleView *)self tintColor];
    uint64_t v5 = [v4 CGColor];
    double v6 = [(HUCircleView *)self layer];
    [v6 setBorderColor:v5];
  }
}

- (void)setBackgroundColorFollowsTintColor:(BOOL)a3
{
  self->_backgroundColorFollowsTintColor = a3;
  [(HUCircleView *)self tintColorDidChange];
}

- (void)setBorderColorFollowsTintColor:(BOOL)a3
{
  self->_borderColorFollowsTintColor = a3;
  [(HUCircleView *)self tintColorDidChange];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"cornerRadius"] & 1) != 0
    || ([v4 isEqualToString:@"borderColor"] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HUCircleView;
    BOOL v5 = [(HUCircleView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (BOOL)backgroundColorFollowsTintColor
{
  return self->_backgroundColorFollowsTintColor;
}

- (BOOL)borderColorFollowsTintColor
{
  return self->_borderColorFollowsTintColor;
}

- (UIView)controlCenterMaterialView
{
  return self->_controlCenterMaterialView;
}

- (void)setControlCenterMaterialView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end