@interface ARUIFloatPropertyAnimation
+ (id)animationWithEndingFloatValue:(float)a3 duration:(double)a4 customTimingFunction:(id)a5 completion:(id)a6;
+ (id)animationWithEndingFloatValue:(float)a3 duration:(double)a4 timingFunction:(id)a5 completion:(id)a6;
- (float)currentValue;
- (float)endValue;
- (float)startValue;
- (id)_currentValue;
- (id)_endValue;
- (id)_startValue;
- (id)valueByAddingCurrentValueToValue:(id)a3;
- (void)_setCurrentValue:(id)a3;
- (void)_setEndValue:(id)a3;
- (void)_setStartValue:(id)a3;
- (void)_updateWithProgress:(float)a3;
@end

@implementation ARUIFloatPropertyAnimation

+ (id)animationWithEndingFloatValue:(float)a3 duration:(double)a4 timingFunction:(id)a5 completion:(id)a6
{
  id v10 = a6;
  v11 = [a1 timingFunctionForMediaTimingFunction:a5];
  *(float *)&double v12 = a3;
  v13 = [a1 animationWithEndingFloatValue:v11 duration:v10 customTimingFunction:v12 completion:a4];

  return v13;
}

+ (id)animationWithEndingFloatValue:(float)a3 duration:(double)a4 customTimingFunction:(id)a5 completion:(id)a6
{
  id result = +[ARUIAnimatableObjectPropertyAnimation animationWithDuration:a5 timingFunction:a6 completion:a4];
  *((float *)result + 11) = a3;
  return result;
}

- (void)_setStartValue:(id)a3
{
  [a3 floatValue];
  self->_startValue = v4;
}

- (void)_setEndValue:(id)a3
{
  [a3 floatValue];
  self->_endValue = v4;
}

- (void)_setCurrentValue:(id)a3
{
  [a3 floatValue];
  self->_currentValue = v4;
}

- (id)_startValue
{
  *(float *)&double v2 = self->_startValue;
  return (id)[NSNumber numberWithFloat:v2];
}

- (id)_endValue
{
  *(float *)&double v2 = self->_endValue;
  return (id)[NSNumber numberWithFloat:v2];
}

- (id)_currentValue
{
  *(float *)&double v2 = self->_currentValue;
  return (id)[NSNumber numberWithFloat:v2];
}

- (void)_updateWithProgress:(float)a3
{
  self->_currentValue = self->_startValue + (float)((float)(self->_endValue - self->_startValue) * a3);
}

- (id)valueByAddingCurrentValueToValue:(id)a3
{
  [a3 floatValue];
  *(float *)&double v4 = (float)(*(float *)&v4 + self->_currentValue) - self->_startValue;
  v5 = NSNumber;

  return (id)[v5 numberWithFloat:v4];
}

- (float)startValue
{
  return self->_startValue;
}

- (float)endValue
{
  return self->_endValue;
}

- (float)currentValue
{
  return self->_currentValue;
}

@end