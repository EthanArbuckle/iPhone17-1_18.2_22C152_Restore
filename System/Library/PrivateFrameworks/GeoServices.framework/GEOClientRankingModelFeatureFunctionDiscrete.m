@interface GEOClientRankingModelFeatureFunctionDiscrete
- (GEOClientRankingModelFeatureFunctionDiscrete)init;
- (GEOClientRankingModelFeatureFunctionDiscrete)initWithValueThresholdLow:(float)a3 weightLow:(float)a4 valueThresholdHigh:(float)a5 weightHigh:(float)a6;
- (float)valueThresholdHigh;
- (float)valueThresholdLow;
- (float)weightHigh;
- (float)weightLow;
- (int64_t)functionType;
@end

@implementation GEOClientRankingModelFeatureFunctionDiscrete

- (GEOClientRankingModelFeatureFunctionDiscrete)init
{
  result = (GEOClientRankingModelFeatureFunctionDiscrete *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOClientRankingModelFeatureFunctionDiscrete)initWithValueThresholdLow:(float)a3 weightLow:(float)a4 valueThresholdHigh:(float)a5 weightHigh:(float)a6
{
  v11.receiver = self;
  v11.super_class = (Class)GEOClientRankingModelFeatureFunctionDiscrete;
  result = [(GEOClientRankingModelFeatureFunctionDiscrete *)&v11 init];
  if (result)
  {
    result->_valueThresholdLow = a3;
    result->_weightLow = a4;
    result->_valueThresholdHigh = a5;
    result->_weightHigh = a6;
  }
  return result;
}

- (int64_t)functionType
{
  return 2;
}

- (float)valueThresholdLow
{
  return self->_valueThresholdLow;
}

- (float)weightLow
{
  return self->_weightLow;
}

- (float)valueThresholdHigh
{
  return self->_valueThresholdHigh;
}

- (float)weightHigh
{
  return self->_weightHigh;
}

@end