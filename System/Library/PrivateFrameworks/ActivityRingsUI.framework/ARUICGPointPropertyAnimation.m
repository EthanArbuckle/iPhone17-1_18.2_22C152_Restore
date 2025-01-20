@interface ARUICGPointPropertyAnimation
+ (id)animationWithEndingCGPointValue:(CGPoint)a3 duration:(double)a4 timingFunction:(id)a5 completion:(id)a6;
- (CGPoint)currentValue;
- (CGPoint)endValue;
- (CGPoint)startValue;
- (id)_currentValue;
- (id)_endValue;
- (id)_startValue;
- (id)valueByAddingCurrentValueToValue:(id)a3;
- (void)_setCurrentValue:(id)a3;
- (void)_setEndValue:(id)a3;
- (void)_setStartValue:(id)a3;
- (void)_updateWithProgress:(float)a3;
@end

@implementation ARUICGPointPropertyAnimation

+ (id)animationWithEndingCGPointValue:(CGPoint)a3 duration:(double)a4 timingFunction:(id)a5 completion:(id)a6
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v11 = a6;
  v12 = [a1 timingFunctionForMediaTimingFunction:a5];
  v13 = +[ARUIAnimatableObjectPropertyAnimation animationWithDuration:v12 timingFunction:v11 completion:a4];

  v13[7] = x;
  v13[8] = y;

  return v13;
}

- (id)_startValue
{
  return (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", self->_startValue.x, self->_startValue.y);
}

- (id)_endValue
{
  return (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", self->_endValue.x, self->_endValue.y);
}

- (id)_currentValue
{
  return (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", self->_currentValue.x, self->_currentValue.y);
}

- (void)_setStartValue:(id)a3
{
  p_startValue = &self->_startValue;
  [a3 CGPointValue];
  p_startValue->CGFloat x = v4;
  p_startValue->CGFloat y = v5;
}

- (void)_setEndValue:(id)a3
{
  p_endValue = &self->_endValue;
  [a3 CGPointValue];
  p_endValue->CGFloat x = v4;
  p_endValue->CGFloat y = v5;
}

- (void)_setCurrentValue:(id)a3
{
  p_currentValue = &self->_currentValue;
  [a3 CGPointValue];
  p_currentValue->CGFloat x = v4;
  p_currentValue->CGFloat y = v5;
}

- (void)_updateWithProgress:(float)a3
{
  float32x2_t v3 = vcvt_f32_f64((float64x2_t)self->_startValue);
  self->_currentValue = (CGPoint)vcvtq_f64_f32(vmla_n_f32(v3, vsub_f32(vcvt_f32_f64((float64x2_t)self->_endValue), v3), a3));
}

- (id)valueByAddingCurrentValueToValue:(id)a3
{
  [a3 CGPointValue];
  double v5 = v4 + self->_currentValue.x - self->_startValue.x;
  double v7 = v6 + self->_currentValue.y - self->_startValue.y;
  v8 = (void *)MEMORY[0x263F08D40];

  return (id)objc_msgSend(v8, "valueWithCGPoint:", v5, v7);
}

- (CGPoint)startValue
{
  double x = self->_startValue.x;
  double y = self->_startValue.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)endValue
{
  double x = self->_endValue.x;
  double y = self->_endValue.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)currentValue
{
  double x = self->_currentValue.x;
  double y = self->_currentValue.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end