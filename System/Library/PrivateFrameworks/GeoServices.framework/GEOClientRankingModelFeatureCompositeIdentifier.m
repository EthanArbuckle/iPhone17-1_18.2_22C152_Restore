@interface GEOClientRankingModelFeatureCompositeIdentifier
- (GEOClientRankingModelFeatureCompositeIdentifier)initWithUnitExponentPairs:(id)a3 featureWeight:(float)a4;
- (NSArray)unitExponentPairs;
- (float)featureWeight;
- (int64_t)featureIdentifierType;
- (void)setUnitExponentPairs:(id)a3;
@end

@implementation GEOClientRankingModelFeatureCompositeIdentifier

- (GEOClientRankingModelFeatureCompositeIdentifier)initWithUnitExponentPairs:(id)a3 featureWeight:(float)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOClientRankingModelFeatureCompositeIdentifier;
  v7 = [(GEOClientRankingModelFeatureCompositeIdentifier *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    unitExponentPairs = v7->_unitExponentPairs;
    v7->_unitExponentPairs = (NSArray *)v8;

    v7->_featureWeight = a4;
  }

  return v7;
}

- (int64_t)featureIdentifierType
{
  return 3;
}

- (NSArray)unitExponentPairs
{
  return self->_unitExponentPairs;
}

- (void)setUnitExponentPairs:(id)a3
{
}

- (float)featureWeight
{
  return self->_featureWeight;
}

- (void).cxx_destruct
{
}

@end