@interface PHEdgeInsetButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (UIEdgeInsets)touchAreaEdgeInsets;
- (void)setTouchAreaEdgeInsets:(UIEdgeInsets)a3;
@end

@implementation PHEdgeInsetButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(PHEdgeInsetButton *)self touchAreaEdgeInsets];
  if (v11 == UIEdgeInsetsZero.left
    && v8 == UIEdgeInsetsZero.top
    && v10 == UIEdgeInsetsZero.right
    && v9 == UIEdgeInsetsZero.bottom)
  {
    v32.receiver = self;
    v32.super_class = (Class)PHEdgeInsetButton;
    BOOL v29 = -[PHEdgeInsetButton pointInside:withEvent:](&v32, "pointInside:withEvent:", v7, x, y);
  }
  else
  {
    [(PHEdgeInsetButton *)self bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    [(PHEdgeInsetButton *)self touchAreaEdgeInsets];
    CGFloat v24 = v18 + v23;
    CGFloat v27 = v20 - (v25 + v26);
    v34.size.height = v22 - (v23 + v28);
    v34.origin.double x = v16 + v25;
    v34.origin.double y = v24;
    v34.size.width = v27;
    v33.double x = x;
    v33.double y = y;
    BOOL v29 = CGRectContainsPoint(v34, v33);
  }
  BOOL v30 = v29;

  return v30;
}

- (UIEdgeInsets)touchAreaEdgeInsets
{
  double top = self->_touchAreaEdgeInsets.top;
  double left = self->_touchAreaEdgeInsets.left;
  double bottom = self->_touchAreaEdgeInsets.bottom;
  double right = self->_touchAreaEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTouchAreaEdgeInsets:(UIEdgeInsets)a3
{
  self->_touchAreaEdgeInsets = a3;
}

@end