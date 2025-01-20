@interface GEOClientRankingModelFeatureFunctionLinear
- (GEOClientRankingModelFeatureFunctionLinear)init;
- (GEOClientRankingModelFeatureFunctionLinear)initWithWeight:(float)a3 maxRelativeValue:(float)a4 meanValue:(float)a5;
- (float)maxRelativeValue;
- (float)meanValue;
- (float)weight;
- (int64_t)functionType;
@end

@implementation GEOClientRankingModelFeatureFunctionLinear

- (GEOClientRankingModelFeatureFunctionLinear)init
{
  result = (GEOClientRankingModelFeatureFunctionLinear *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOClientRankingModelFeatureFunctionLinear)initWithWeight:(float)a3 maxRelativeValue:(float)a4 meanValue:(float)a5
{
  v9.receiver = self;
  v9.super_class = (Class)GEOClientRankingModelFeatureFunctionLinear;
  result = [(GEOClientRankingModelFeatureFunctionLinear *)&v9 init];
  if (result)
  {
    result->_weight = a3;
    result->_maxRelativeValue = a4;
    result->_meanValue = a5;
  }
  return result;
}

- (int64_t)functionType
{
  return 1;
}

- (float)weight
{
  return self->_weight;
}

- (float)maxRelativeValue
{
  return self->_maxRelativeValue;
}

- (float)meanValue
{
  return self->_meanValue;
}

@end