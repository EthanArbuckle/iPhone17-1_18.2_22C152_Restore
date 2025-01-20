@interface _DPLaplaceNoiseGenerator
+ (id)zeroMeanLaplaceNoiseGenerator:(double)a3;
- (_DPLaplaceNoiseGenerator)init;
- (_DPLaplaceNoiseGenerator)initWithScale:(double)a3;
- (double)b;
- (double)sample;
- (id)description;
@end

@implementation _DPLaplaceNoiseGenerator

- (_DPLaplaceNoiseGenerator)init
{
  return 0;
}

- (_DPLaplaceNoiseGenerator)initWithScale:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_DPLaplaceNoiseGenerator;
  result = [(_DPLaplaceNoiseGenerator *)&v5 init];
  if (result) {
    result->_b = a3;
  }
  return result;
}

+ (id)zeroMeanLaplaceNoiseGenerator:(double)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithScale:a3];
  return v3;
}

- (double)sample
{
  do
  {
    double v3 = uniformRandomProbability() + -0.5;
    double v4 = fabs(v3);
  }
  while (isEqualToOne(v4 + v4));
  double v5 = log(v4 * -2.0 + 1.0);
  if (v3 <= 0.0) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0;
  }
  if (v3 < 0.0) {
    double v6 = -1.0;
  }
  return 0.0 - v5 * (v6 * self->_b);
}

- (id)description
{
  double v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  double v6 = [v3 stringWithFormat:@"%@: { scale=%.16g }", v5, *(void *)&self->_b];

  return v6;
}

- (double)b
{
  return self->_b;
}

@end