@interface _AXTodayPanGestureRecognizer
- (BOOL)show;
- (CGPoint)translationInView:(id)a3;
- (CGPoint)velocityInView:(id)a3;
- (int64_t)overriddenState;
- (void)setOverriddenState:(int64_t)a3;
- (void)setShow:(BOOL)a3;
@end

@implementation _AXTodayPanGestureRecognizer

- (CGPoint)translationInView:(id)a3
{
  BOOL v4 = [(_AXTodayPanGestureRecognizer *)self show];
  int v5 = [(_AXTodayPanGestureRecognizer *)self _accessibilityIsRTL];
  double v6 = 5000.0;
  if (v5) {
    double v7 = -5000.0;
  }
  else {
    double v7 = 5000.0;
  }
  if (!v5) {
    double v6 = -5000.0;
  }
  if (v4) {
    double v6 = v7;
  }
  double v8 = 0.0;
  result.y = v8;
  result.x = v6;
  return result;
}

- (CGPoint)velocityInView:(id)a3
{
  BOOL v4 = [(_AXTodayPanGestureRecognizer *)self show];
  int v5 = [(_AXTodayPanGestureRecognizer *)self _accessibilityIsRTL];
  double v6 = 5000.0;
  if (v5) {
    double v7 = -5000.0;
  }
  else {
    double v7 = 5000.0;
  }
  if (!v5) {
    double v6 = -5000.0;
  }
  if (v4) {
    double v6 = v7;
  }
  double v8 = 0.0;
  result.y = v8;
  result.x = v6;
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

@end