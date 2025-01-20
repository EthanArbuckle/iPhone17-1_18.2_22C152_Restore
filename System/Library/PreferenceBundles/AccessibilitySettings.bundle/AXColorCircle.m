@interface AXColorCircle
- (BOOL)accessibilityIgnoresInvertColors;
- (BOOL)fillCircle;
- (UIColor)color;
- (void)drawRect:(CGRect)a3;
- (void)setColor:(id)a3;
- (void)setFillCircle:(BOOL)a3;
@end

@implementation AXColorCircle

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = 1.0;
  double v9 = 1.0;
  if (AXPreferredContentSizeCategoryIsAccessibilityCategory())
  {
    if ([(AXColorCircle *)self fillCircle]) {
      double v8 = 1.0;
    }
    else {
      double v8 = 2.0;
    }
    double v9 = 4.0;
  }
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  CGRectInset(v15, v8, v8);
  AX_CGRectGetCenter();
  +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v13 setLineWidth:v9];
  AX_CGRectGetCenter();
  objc_msgSend(v13, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1);
  [v13 closePath];
  unsigned int v10 = [(AXColorCircle *)self fillCircle];
  v11 = [(AXColorCircle *)self color];
  v12 = v11;
  if (v10)
  {
    [v11 setFill];

    [v13 fill];
  }
  else
  {
    [v11 setStroke];

    [v13 stroke];
  }
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (BOOL)fillCircle
{
  return self->_fillCircle;
}

- (void)setFillCircle:(BOOL)a3
{
  self->_fillCircle = a3;
}

- (void).cxx_destruct
{
}

@end