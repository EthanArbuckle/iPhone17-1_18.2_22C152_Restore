@interface _AXTodayPanGestureRecognizer
- (BOOL)leading;
- (BOOL)show;
- (CGPoint)translationInView:(id)a3;
- (CGPoint)velocityInView:(id)a3;
- (double)_xDimensionForTransition;
- (id)initGestureToShow:(BOOL)a3 leading:(BOOL)a4;
- (int64_t)overriddenState;
- (void)setLeading:(BOOL)a3;
- (void)setOverriddenState:(int64_t)a3;
- (void)setShow:(BOOL)a3;
@end

@implementation _AXTodayPanGestureRecognizer

- (id)initGestureToShow:(BOOL)a3 leading:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AXTodayPanGestureRecognizer;
  v6 = [(_AXTodayPanGestureRecognizer *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(_AXTodayPanGestureRecognizer *)v6 setShow:v5];
    [(_AXTodayPanGestureRecognizer *)v7 setLeading:v4];
  }
  return v7;
}

- (CGPoint)translationInView:(id)a3
{
  [(_AXTodayPanGestureRecognizer *)self _xDimensionForTransition];
  double v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)velocityInView:(id)a3
{
  [(_AXTodayPanGestureRecognizer *)self _xDimensionForTransition];
  double v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)_xDimensionForTransition
{
  int v3 = [(_AXTodayPanGestureRecognizer *)self _accessibilityIsRTL];
  BOOL v4 = [(_AXTodayPanGestureRecognizer *)self leading];
  double v5 = 5000.0;
  if (v4) {
    double v6 = -5000.0;
  }
  else {
    double v6 = 5000.0;
  }
  if (!v4) {
    double v5 = -5000.0;
  }
  if (v3) {
    double v7 = v6;
  }
  else {
    double v7 = v5;
  }
  BOOL v8 = [(_AXTodayPanGestureRecognizer *)self show];
  double result = -v7;
  if (v8) {
    return v7;
  }
  return result;
}

- (int64_t)overriddenState
{
  return self->_overriddenState;
}

- (void)setOverriddenState:(int64_t)a3
{
  self->_overriddenState = a3;
}

- (BOOL)show
{
  return self->_show;
}

- (void)setShow:(BOOL)a3
{
  self->_show = a3;
}

- (BOOL)leading
{
  return self->_leading;
}

- (void)setLeading:(BOOL)a3
{
  self->_leading = a3;
}

@end