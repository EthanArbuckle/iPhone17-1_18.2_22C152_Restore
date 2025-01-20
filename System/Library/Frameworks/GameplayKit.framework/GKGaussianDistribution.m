@interface GKGaussianDistribution
- (GKGaussianDistribution)initWithRandomSource:(id)source lowestValue:(NSInteger)lowestInclusive highestValue:(NSInteger)highestInclusive;
- (GKGaussianDistribution)initWithRandomSource:(id)source mean:(float)mean deviation:(float)deviation;
- (float)deviation;
- (float)mean;
- (int64_t)nextInt;
@end

@implementation GKGaussianDistribution

- (GKGaussianDistribution)initWithRandomSource:(id)source lowestValue:(NSInteger)lowestInclusive highestValue:(NSInteger)highestInclusive
{
  v10.receiver = self;
  v10.super_class = (Class)GKGaussianDistribution;
  result = -[GKRandomDistribution initWithRandomSource:lowestValue:highestValue:](&v10, sel_initWithRandomSource_lowestValue_highestValue_, source);
  if (result)
  {
    float v8 = (double)(highestInclusive + lowestInclusive) * 0.5;
    result->_mean = v8;
    float v9 = (float)((float)highestInclusive - v8) * 0.333333333;
    result->_deviation = v9;
  }
  return result;
}

- (GKGaussianDistribution)initWithRandomSource:(id)source mean:(float)mean deviation:(float)deviation
{
  v8.receiver = self;
  v8.super_class = (Class)GKGaussianDistribution;
  result = [(GKRandomDistribution *)&v8 initWithRandomSource:source lowestValue:(int)(float)(mean - (float)(deviation * 3.0)) highestValue:(int)(float)((float)(deviation * 3.0) + mean)];
  if (result)
  {
    result->_mean = mean;
    result->_deviation = deviation;
  }
  return result;
}

- (int64_t)nextInt
{
  [(GKRandom *)self->super._source nextUniform];
  float v4 = v3;
  [(GKRandom *)self->super._source nextUniform];
  float v6 = v5;
  float v7 = v5 * 6.28318531;
  float v8 = cosf(v7);
  signed int v9 = llroundf(self->_mean + (float)((float)(self->_deviation * v8) * sqrtf(logf(v4) * -2.0)));
  int64_t lowest = self->super._lowest;
  int64_t highest = self->super._highest;
  if (lowest > v9 || highest < v9) {
    return (int)(lowest + (uint64_t)(float)(v6 * (float)(highest - lowest)));
  }
  else {
    return v9;
  }
}

- (float)mean
{
  return self->_mean;
}

- (float)deviation
{
  return self->_deviation;
}

@end