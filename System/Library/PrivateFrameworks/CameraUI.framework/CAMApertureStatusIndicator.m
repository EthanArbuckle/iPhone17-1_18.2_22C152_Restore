@interface CAMApertureStatusIndicator
- (BOOL)canShowValue;
- (BOOL)isOn;
- (double)apertureValue;
- (id)imageNameForCurrentState;
- (id)valueText;
- (void)setApertureValue:(double)a3;
- (void)setOn:(BOOL)a3;
@end

@implementation CAMApertureStatusIndicator

- (BOOL)canShowValue
{
  return 1;
}

- (void)setApertureValue:(double)a3
{
  if (self->_apertureValue != a3)
  {
    self->_apertureValue = a3;
    [(CAMControlStatusIndicator *)self setNeedsUpdateValueText];
  }
}

- (id)imageNameForCurrentState
{
  return @"f.cursive";
}

- (id)valueText
{
  [(CAMApertureStatusIndicator *)self apertureValue];
  double v3 = v2;
  v4 = objc_opt_class();
  if (v3 >= 10.0) {
    [v4 integerFormatter];
  }
  else {
  v5 = [v4 decimalFormatter];
  }
  v6 = [NSNumber numberWithDouble:v3];
  v7 = [v5 stringFromNumber:v6];

  return v7;
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    [(CAMControlStatusIndicator *)self updateImage];
  }
}

- (double)apertureValue
{
  return self->_apertureValue;
}

- (BOOL)isOn
{
  return self->_on;
}

@end