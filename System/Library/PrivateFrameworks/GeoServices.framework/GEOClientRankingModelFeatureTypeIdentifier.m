@interface GEOClientRankingModelFeatureTypeIdentifier
- (GEOClientRankingModelFeatureTypeIdentifier)init;
- (GEOClientRankingModelFeatureTypeIdentifier)initWithFeatureType:(int64_t)a3;
- (int64_t)featureIdentifierType;
- (int64_t)featureType;
@end

@implementation GEOClientRankingModelFeatureTypeIdentifier

- (GEOClientRankingModelFeatureTypeIdentifier)init
{
  result = (GEOClientRankingModelFeatureTypeIdentifier *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOClientRankingModelFeatureTypeIdentifier)initWithFeatureType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOClientRankingModelFeatureTypeIdentifier;
  result = [(GEOClientRankingModelFeatureTypeIdentifier *)&v5 init];
  if (result) {
    result->_featureType = a3;
  }
  return result;
}

- (int64_t)featureIdentifierType
{
  return 2;
}

- (int64_t)featureType
{
  return self->_featureType;
}

@end