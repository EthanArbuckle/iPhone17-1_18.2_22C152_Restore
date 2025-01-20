@interface CRKExponentialGrowthFunction
- (CRKExponentialGrowthFunction)initWithGrowthRate:(double)a3;
- (double)evaluateWithValue:(double)a3;
- (double)growthRate;
@end

@implementation CRKExponentialGrowthFunction

- (CRKExponentialGrowthFunction)initWithGrowthRate:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRKExponentialGrowthFunction;
  result = [(CRKExponentialGrowthFunction *)&v5 init];
  if (result) {
    result->_growthRate = a3;
  }
  return result;
}

- (double)evaluateWithValue:(double)a3
{
  [(CRKExponentialGrowthFunction *)self growthRate];
  return v4 * a3;
}

- (double)growthRate
{
  return self->_growthRate;
}

@end