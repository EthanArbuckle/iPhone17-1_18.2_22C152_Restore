@interface AXPIFingerLayer
- (AXPIFingerAppearanceDelegate)appearanceDelegate;
- (AXPIFingerLayer)initWithAppearanceDelegate:(id)a3;
- (BOOL)isPressed;
- (BOOL)isSelected;
- (CGRect)outerFrame;
- (unint64_t)shape;
- (void)setAppearanceDelegate:(id)a3;
- (void)setPressed:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShape:(unint64_t)a3;
@end

@implementation AXPIFingerLayer

- (AXPIFingerLayer)initWithAppearanceDelegate:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AXPIFingerLayer;
  v5 = [(AXPIFingerLayer *)&v21 init];
  v6 = v5;
  if (v5)
  {
    [(AXPIFingerLayer *)v5 setAppearanceDelegate:v4];
    v7 = [(AXPIFingerLayer *)v6 appearanceDelegate];
    [v7 fingerInnerRadius];
    double v9 = v8;
    v10 = [(AXPIFingerLayer *)v6 appearanceDelegate];
    [v10 strokeWidth];
    CGFloat v12 = v11 + v9 * 2.0;

    v13 = [(AXPIFingerLayer *)v6 appearanceDelegate];
    [v13 fingerWidth];
    CGFloat v15 = (v14 - v12) * 0.5;

    v6->_outerFrame.origin.x = v15;
    v6->_outerFrame.origin.y = v15;
    v6->_outerFrame.size.width = v12;
    v6->_outerFrame.size.height = v12;
    v6->_shape = 0;
    if (!+[AXPIFingerUtilities laserEnabled]
      || ([(AXPIFingerLayer *)v6 appearanceDelegate],
          v16 = objc_claimAutoreleasedReturnValue(),
          char v17 = [v16 useSystemFilters],
          v16,
          (v17 & 1) == 0))
    {
      v18 = [(AXPIFingerLayer *)v6 appearanceDelegate];
      id v19 = [v18 deselectedFillColor];
      -[AXPIFingerLayer setFillColor:](v6, "setFillColor:", [v19 CGColor]);
    }
  }

  return v6;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (void)setPressed:(BOOL)a3
{
  self->_pressed = a3;
}

- (unint64_t)shape
{
  return self->_shape;
}

- (void)setShape:(unint64_t)a3
{
  self->_shape = a3;
}

- (AXPIFingerAppearanceDelegate)appearanceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  return (AXPIFingerAppearanceDelegate *)WeakRetained;
}

- (void)setAppearanceDelegate:(id)a3
{
}

- (CGRect)outerFrame
{
  double x = self->_outerFrame.origin.x;
  double y = self->_outerFrame.origin.y;
  double width = self->_outerFrame.size.width;
  double height = self->_outerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
}

@end