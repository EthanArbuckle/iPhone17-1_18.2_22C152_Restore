@interface _DPBiasedCoin
+ (_DPBiasedCoin)coinWithBias:(double)a3;
+ (double)sanitizedProbability:(double)a3;
- (BOOL)flip;
- (_DPBiasedCoin)init;
- (_DPBiasedCoin)initWithBias:(double)a3;
- (double)bias;
- (id)description;
- (unsigned)generateByte;
@end

@implementation _DPBiasedCoin

- (_DPBiasedCoin)init
{
  return 0;
}

- (_DPBiasedCoin)initWithBias:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_DPBiasedCoin;
  result = [(_DPBiasedCoin *)&v6 init];
  if (result)
  {
    double v5 = 1.0;
    if (a3 <= 1.0) {
      double v5 = a3;
    }
    if (a3 < 0.0) {
      double v5 = 0.0;
    }
    result->_bias = v5;
  }
  return result;
}

+ (_DPBiasedCoin)coinWithBias:(double)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithBias:a3];
  return (_DPBiasedCoin *)v3;
}

- (BOOL)flip
{
  double bias = self->_bias;
  return bias >= 2.22044605e-16 && uniformRandomProbability() >= 1.0 - bias;
}

- (unsigned)generateByte
{
  if (self->_bias < 2.22044605e-16) {
    return 0;
  }
  unsigned __int8 v2 = 0;
  uint64_t v4 = 8;
  do
  {
    double bias = self->_bias;
    unsigned __int8 v2 = (uniformRandomProbability() >= 1.0 - bias) | (2 * v2);
    --v4;
  }
  while (v4);
  return v2;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  objc_super v6 = [v3 stringWithFormat:@"%@: { bias=%.16g }", v5, *(void *)&self->_bias];

  return v6;
}

+ (double)sanitizedProbability:(double)a3
{
  double v3 = 1.0;
  if (a3 <= 1.0) {
    double v3 = a3;
  }
  BOOL v4 = a3 < 0.0;
  double result = 0.0;
  if (!v4) {
    return v3;
  }
  return result;
}

- (double)bias
{
  return self->_bias;
}

@end