@interface _MLCGaussianRandomGenerator
+ (id)zeroMeanGaussianRandomGenerator;
+ (id)zeroMeanGaussianRandomGeneratorWithSeed:(unint64_t)a3;
- (BOOL)seeded;
- (_MLCGaussianRandomGenerator)initWithMean:(double)a3 scale:(double)a4 seeded:(BOOL)a5 seedValue:(unint64_t)a6;
- (double)mean;
- (double)sample;
- (double)scale;
- (unint64_t)seedValue;
@end

@implementation _MLCGaussianRandomGenerator

- (_MLCGaussianRandomGenerator)initWithMean:(double)a3 scale:(double)a4 seeded:(BOOL)a5 seedValue:(unint64_t)a6
{
  BOOL v7 = a5;
  v11.receiver = self;
  v11.super_class = (Class)_MLCGaussianRandomGenerator;
  result = [(_MLCGaussianRandomGenerator *)&v11 init];
  if (result)
  {
    result->_mean = a3;
    result->_scale = a4;
    result->_seeded = v7;
    if (v7) {
      result->_seedValue = a6;
    }
  }
  return result;
}

+ (id)zeroMeanGaussianRandomGenerator
{
  v2 = (void *)[objc_alloc((Class)a1) initWithMean:0 scale:arc4random_uniform(0x40000000u) seeded:0.0 seedValue:1.0];

  return v2;
}

+ (id)zeroMeanGaussianRandomGeneratorWithSeed:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithMean:0 scale:a3 seeded:0.0 seedValue:1.0];

  return v3;
}

- (double)sample
{
  int v3 = sample_generateNoise;
  sample_generateNoise ^= 1u;
  if (v3)
  {
    double v4 = *(double *)&sample_z1;
  }
  else
  {
    do
    {
      double v5 = (double)rand_r((unsigned int *)&self->_seedValue) * 4.65661288e-10;
      int v6 = rand_r((unsigned int *)&self->_seedValue);
    }
    while (v5 <= 2.22044605e-16);
    double v7 = (double)v6 * 4.65661288e-10;
    double v8 = sqrt(log(v5) * -2.0);
    __double2 v9 = __sincos_stret(v7 * 6.28318531);
    double v4 = v8 * v9.__cosval;
    *(double *)&sample_z1 = v8 * v9.__sinval;
  }
  [(_MLCGaussianRandomGenerator *)self scale];
  double v11 = v10;
  [(_MLCGaussianRandomGenerator *)self mean];
  return v12 + v4 * v11;
}

- (double)mean
{
  return self->_mean;
}

- (double)scale
{
  return self->_scale;
}

- (BOOL)seeded
{
  return self->_seeded;
}

- (unint64_t)seedValue
{
  return self->_seedValue;
}

@end