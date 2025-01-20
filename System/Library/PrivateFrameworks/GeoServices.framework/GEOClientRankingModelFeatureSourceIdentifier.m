@interface GEOClientRankingModelFeatureSourceIdentifier
- (GEOClientRankingModelFeatureSourceIdentifier)init;
- (GEOClientRankingModelFeatureSourceIdentifier)initWithSuggestionType:(int)a3 serverEntryType:(int)a4 sourceType:(int64_t)a5;
- (int)serverEntryType;
- (int)suggestionType;
- (int64_t)featureIdentifierType;
- (int64_t)sourceType;
@end

@implementation GEOClientRankingModelFeatureSourceIdentifier

- (GEOClientRankingModelFeatureSourceIdentifier)init
{
  result = (GEOClientRankingModelFeatureSourceIdentifier *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOClientRankingModelFeatureSourceIdentifier)initWithSuggestionType:(int)a3 serverEntryType:(int)a4 sourceType:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)GEOClientRankingModelFeatureSourceIdentifier;
  result = [(GEOClientRankingModelFeatureSourceIdentifier *)&v9 init];
  if (result)
  {
    result->_sourceType = a5;
    result->_suggestionType = a3;
    result->_serverEntryType = a4;
  }
  return result;
}

- (int64_t)featureIdentifierType
{
  return 1;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (int)suggestionType
{
  return self->_suggestionType;
}

- (int)serverEntryType
{
  return self->_serverEntryType;
}

@end