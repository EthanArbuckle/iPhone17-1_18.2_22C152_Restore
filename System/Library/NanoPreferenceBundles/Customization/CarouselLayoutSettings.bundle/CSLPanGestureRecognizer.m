@interface CSLPanGestureRecognizer
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (CGPoint)touchPoint;
- (void)setTouchPoint:(CGPoint)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation CSLPanGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 anyObject];
  [v8 locationInView:0];
  -[CSLPanGestureRecognizer setTouchPoint:](self, "setTouchPoint:");
  v9.receiver = self;
  v9.super_class = (Class)CSLPanGestureRecognizer;
  [(CSLPanGestureRecognizer *)&v9 touchesBegan:v6 withEvent:v7];
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CSLPanGestureRecognizer;
    BOOL v5 = [(CSLPanGestureRecognizer *)&v7 canBePreventedByGestureRecognizer:v4];
  }

  return v5;
}

- (CGPoint)touchPoint
{
  double x = self->_touchPoint.x;
  double y = self->_touchPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTouchPoint:(CGPoint)a3
{
  self->_touchPoint = a3;
}

@end