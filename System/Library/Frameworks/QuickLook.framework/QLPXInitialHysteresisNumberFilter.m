@interface QLPXInitialHysteresisNumberFilter
- (double)hysteresis;
- (double)outputDerivative;
- (double)updatedOutput;
- (void)setHysteresis:(double)a3;
@end

@implementation QLPXInitialHysteresisNumberFilter

- (double)updatedOutput
{
  [(QLPXNumberFilter *)self output];
  double v4 = v3;
  [(QLPXNumberFilter *)self input];
  double v6 = v5;
  if (!self->_didReachThreshold)
  {
    [(QLPXInitialHysteresisNumberFilter *)self hysteresis];
    if (v6 - v4 >= v7 || (double v7 = -v7, v6 - v4 <= v7))
    {
      self->_offset = v7;
      self->_didReachThreshold = 1;
    }
    else if (!self->_didReachThreshold)
    {
      return v4;
    }
  }
  return v6 - self->_offset;
}

- (double)outputDerivative
{
  double result = 1.0;
  if (!self->_didReachThreshold) {
    return 0.0;
  }
  return result;
}

- (double)hysteresis
{
  return self->_hysteresis;
}

- (void)setHysteresis:(double)a3
{
  self->_hysteresis = a3;
}

@end