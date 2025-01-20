@interface PHSearchQueryOptions
- (BOOL)disableMetadataSearch;
- (BOOL)disableSafetyCheck;
- (BOOL)disableSemanticSearch;
- (BOOL)disableU2;
- (BOOL)enableEmbeddingOnlyResultsInExactMatches;
- (BOOL)enableNextTokenSuggestions;
- (BOOL)enableQueryMatchDetails;
- (BOOL)enableQueryUnderstanding;
- (BOOL)enableQueryUnderstandingGenericLocations;
- (BOOL)enableResultRanking;
- (BOOL)excludeOCRTextResultMatches;
- (BOOL)fastRanking;
- (BOOL)limitSuggestionsToExactTextMatches;
- (NSSet)scopedIdentifiers;
- (OS_dispatch_queue)resultsHandlerQueue;
- (PHSearchQueryOptions)init;
- (double)collectionThreshold;
- (double)embeddingRelevanceThreshold;
- (double)spotlightQueryTimeout;
- (id)_rankingModeDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)jsonDictionary;
- (int64_t)embeddingGenerationTimeout;
- (int64_t)maxRankedAssetSearchResults;
- (int64_t)maxRankedCollectionSearchResults;
- (int64_t)maxSearchResults;
- (unint64_t)completionSuggestionLimit;
- (unint64_t)locationInQueryStringForSuggestionGeneration;
- (unint64_t)matchType;
- (unint64_t)minNumberOfResultsForNextTokenGeneration;
- (unint64_t)nextEntitySuggestionLimit;
- (unint64_t)searchQueryResultTypes;
- (unint64_t)suggestionLimit;
- (void)setCollectionThreshold:(double)a3;
- (void)setCompletionSuggestionLimit:(unint64_t)a3;
- (void)setDisableMetadataSearch:(BOOL)a3;
- (void)setDisableSafetyCheck:(BOOL)a3;
- (void)setDisableSemanticSearch:(BOOL)a3;
- (void)setDisableU2:(BOOL)a3;
- (void)setEmbeddingGenerationTimeout:(int64_t)a3;
- (void)setEmbeddingRelevanceThreshold:(double)a3;
- (void)setEnableEmbeddingOnlyResultsInExactMatches:(BOOL)a3;
- (void)setEnableNextTokenSuggestions:(BOOL)a3;
- (void)setEnableQueryMatchDetails:(BOOL)a3;
- (void)setEnableQueryUnderstanding:(BOOL)a3;
- (void)setEnableQueryUnderstandingGenericLocations:(BOOL)a3;
- (void)setEnableResultRanking:(BOOL)a3;
- (void)setExcludeOCRTextResultMatches:(BOOL)a3;
- (void)setFastRanking:(BOOL)a3;
- (void)setLimitSuggestionsToExactTextMatches:(BOOL)a3;
- (void)setLocationInQueryStringForSuggestionGeneration:(unint64_t)a3;
- (void)setMatchType:(unint64_t)a3;
- (void)setMaxRankedAssetSearchResults:(int64_t)a3;
- (void)setMaxRankedCollectionSearchResults:(int64_t)a3;
- (void)setMaxSearchResults:(int64_t)a3;
- (void)setMinNumberOfResultsForNextTokenGeneration:(unint64_t)a3;
- (void)setNextEntitySuggestionLimit:(unint64_t)a3;
- (void)setResultsHandlerQueue:(id)a3;
- (void)setScopedIdentifiers:(id)a3;
- (void)setSearchQueryResultTypes:(unint64_t)a3;
- (void)setSpotlightQueryTimeout:(double)a3;
- (void)setSuggestionLimit:(unint64_t)a3;
@end

@implementation PHSearchQueryOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsHandlerQueue, 0);

  objc_storeStrong((id *)&self->_scopedIdentifiers, 0);
}

- (void)setSpotlightQueryTimeout:(double)a3
{
  self->_spotlightQueryTimeout = a3;
}

- (double)spotlightQueryTimeout
{
  return self->_spotlightQueryTimeout;
}

- (BOOL)enableEmbeddingOnlyResultsInExactMatches
{
  return self->_enableEmbeddingOnlyResultsInExactMatches;
}

- (void)setMinNumberOfResultsForNextTokenGeneration:(unint64_t)a3
{
  self->_minNumberOfResultsForNextTokenGeneration = a3;
}

- (unint64_t)minNumberOfResultsForNextTokenGeneration
{
  return self->_minNumberOfResultsForNextTokenGeneration;
}

- (unint64_t)matchType
{
  return self->_matchType;
}

- (void)setCollectionThreshold:(double)a3
{
  self->_collectionThreshold = a3;
}

- (double)collectionThreshold
{
  return self->_collectionThreshold;
}

- (void)setEnableQueryUnderstandingGenericLocations:(BOOL)a3
{
  self->_enableQueryUnderstandingGenericLocations = a3;
}

- (BOOL)enableQueryUnderstandingGenericLocations
{
  return self->_enableQueryUnderstandingGenericLocations;
}

- (void)setDisableSafetyCheck:(BOOL)a3
{
  self->_disableSafetyCheck = a3;
}

- (BOOL)disableSafetyCheck
{
  return self->_disableSafetyCheck;
}

- (void)setEmbeddingGenerationTimeout:(int64_t)a3
{
  self->_embeddingGenerationTimeout = a3;
}

- (int64_t)embeddingGenerationTimeout
{
  return self->_embeddingGenerationTimeout;
}

- (void)setDisableU2:(BOOL)a3
{
  self->_disableU2 = a3;
}

- (BOOL)disableU2
{
  return self->_disableU2;
}

- (void)setEmbeddingRelevanceThreshold:(double)a3
{
  self->_embeddingRelevanceThreshold = a3;
}

- (double)embeddingRelevanceThreshold
{
  return self->_embeddingRelevanceThreshold;
}

- (void)setFastRanking:(BOOL)a3
{
  self->_fastRanking = a3;
}

- (BOOL)fastRanking
{
  return self->_fastRanking;
}

- (void)setLimitSuggestionsToExactTextMatches:(BOOL)a3
{
  self->_limitSuggestionsToExactTextMatches = a3;
}

- (BOOL)limitSuggestionsToExactTextMatches
{
  return self->_limitSuggestionsToExactTextMatches;
}

- (void)setNextEntitySuggestionLimit:(unint64_t)a3
{
  self->_nextEntitySuggestionLimit = a3;
}

- (unint64_t)nextEntitySuggestionLimit
{
  return self->_nextEntitySuggestionLimit;
}

- (void)setCompletionSuggestionLimit:(unint64_t)a3
{
  self->_completionSuggestionLimit = a3;
}

- (unint64_t)completionSuggestionLimit
{
  return self->_completionSuggestionLimit;
}

- (void)setEnableResultRanking:(BOOL)a3
{
  self->_enableResultRanking = a3;
}

- (BOOL)enableResultRanking
{
  return self->_enableResultRanking;
}

- (void)setLocationInQueryStringForSuggestionGeneration:(unint64_t)a3
{
  self->_locationInQueryStringForSuggestionGeneration = a3;
}

- (unint64_t)locationInQueryStringForSuggestionGeneration
{
  return self->_locationInQueryStringForSuggestionGeneration;
}

- (void)setEnableNextTokenSuggestions:(BOOL)a3
{
  self->_enableNextTokenSuggestions = a3;
}

- (BOOL)enableNextTokenSuggestions
{
  return self->_enableNextTokenSuggestions;
}

- (void)setSuggestionLimit:(unint64_t)a3
{
  self->_suggestionLimit = a3;
}

- (unint64_t)suggestionLimit
{
  return self->_suggestionLimit;
}

- (void)setEnableQueryUnderstanding:(BOOL)a3
{
  self->_enableQueryUnderstanding = a3;
}

- (BOOL)enableQueryUnderstanding
{
  return self->_enableQueryUnderstanding;
}

- (void)setExcludeOCRTextResultMatches:(BOOL)a3
{
  self->_excludeOCRTextResultMatches = a3;
}

- (BOOL)excludeOCRTextResultMatches
{
  return self->_excludeOCRTextResultMatches;
}

- (void)setMaxSearchResults:(int64_t)a3
{
  self->_maxSearchResults = a3;
}

- (int64_t)maxSearchResults
{
  return self->_maxSearchResults;
}

- (void)setEnableQueryMatchDetails:(BOOL)a3
{
  self->_enableQueryMatchDetails = a3;
}

- (BOOL)enableQueryMatchDetails
{
  return self->_enableQueryMatchDetails;
}

- (void)setDisableMetadataSearch:(BOOL)a3
{
  self->_disableMetadataSearch = a3;
}

- (BOOL)disableMetadataSearch
{
  return self->_disableMetadataSearch;
}

- (void)setResultsHandlerQueue:(id)a3
{
}

- (OS_dispatch_queue)resultsHandlerQueue
{
  return self->_resultsHandlerQueue;
}

- (void)setDisableSemanticSearch:(BOOL)a3
{
  self->_disableSemanticSearch = a3;
}

- (BOOL)disableSemanticSearch
{
  return self->_disableSemanticSearch;
}

- (void)setMaxRankedCollectionSearchResults:(int64_t)a3
{
  self->_maxRankedCollectionSearchResults = a3;
}

- (int64_t)maxRankedCollectionSearchResults
{
  return self->_maxRankedCollectionSearchResults;
}

- (void)setMaxRankedAssetSearchResults:(int64_t)a3
{
  self->_maxRankedAssetSearchResults = a3;
}

- (int64_t)maxRankedAssetSearchResults
{
  return self->_maxRankedAssetSearchResults;
}

- (void)setScopedIdentifiers:(id)a3
{
}

- (NSSet)scopedIdentifiers
{
  return self->_scopedIdentifiers;
}

- (void)setSearchQueryResultTypes:(unint64_t)a3
{
  self->_searchQueryResultTypes = a3;
}

- (unint64_t)searchQueryResultTypes
{
  return self->_searchQueryResultTypes;
}

- (id)jsonDictionary
{
  v43[26] = *MEMORY[0x1E4F143B8];
  id v34 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v42[0] = @"rankingMode_humanReadable";
  v41 = [(PHSearchQueryOptions *)self _rankingModeDescription];
  v43[0] = v41;
  v42[1] = @"disableSemanticSearch";
  v40 = objc_msgSend(NSNumber, "numberWithBool:", -[PHSearchQueryOptions disableSemanticSearch](self, "disableSemanticSearch"));
  v43[1] = v40;
  v42[2] = @"disableMetadataSearch";
  v39 = objc_msgSend(NSNumber, "numberWithBool:", -[PHSearchQueryOptions disableMetadataSearch](self, "disableMetadataSearch"));
  v43[2] = v39;
  v42[3] = @"disableSafetyCheck";
  v38 = objc_msgSend(NSNumber, "numberWithBool:", -[PHSearchQueryOptions disableSafetyCheck](self, "disableSafetyCheck"));
  v43[3] = v38;
  v42[4] = @"enableQueryMatchDetails";
  v37 = objc_msgSend(NSNumber, "numberWithBool:", -[PHSearchQueryOptions enableQueryMatchDetails](self, "enableQueryMatchDetails"));
  v43[4] = v37;
  v42[5] = @"maxSearchResults";
  v36 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHSearchQueryOptions maxSearchResults](self, "maxSearchResults"));
  v43[5] = v36;
  v42[6] = @"maxRankedAssetSearchResults";
  v35 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHSearchQueryOptions maxRankedAssetSearchResults](self, "maxRankedAssetSearchResults"));
  v43[6] = v35;
  v42[7] = @"maxRankedCollectionSearchResults";
  v33 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHSearchQueryOptions maxRankedCollectionSearchResults](self, "maxRankedCollectionSearchResults"));
  v43[7] = v33;
  v42[8] = @"suggestionLimit";
  v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHSearchQueryOptions suggestionLimit](self, "suggestionLimit"));
  v43[8] = v32;
  v42[9] = @"searchQueryResultTypes";
  v31 = PHSearchQueryResultTypesDescription([(PHSearchQueryOptions *)self searchQueryResultTypes]);
  v43[9] = v31;
  v42[10] = @"scopedIdentifiers";
  v30 = [(PHSearchQueryOptions *)self scopedIdentifiers];
  uint64_t v3 = [v30 allObjects];
  v29 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v3;
  v43[10] = v3;
  v42[11] = @"excludeOCRMatchedResults";
  v28 = objc_msgSend(NSNumber, "numberWithBool:", -[PHSearchQueryOptions excludeOCRTextResultMatches](self, "excludeOCRTextResultMatches"));
  v43[11] = v28;
  v42[12] = @"locationInQueryStringForSuggestionGeneration";
  if (-[PHSearchQueryOptions locationInQueryStringForSuggestionGeneration](self, "locationInQueryStringForSuggestionGeneration") == 0x7FFFFFFFFFFFFFFFLL)[MEMORY[0x1E4F1CA98] null]; {
  else
  }
  v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHSearchQueryOptions locationInQueryStringForSuggestionGeneration](self, "locationInQueryStringForSuggestionGeneration"));
  v43[12] = v27;
  v42[13] = @"enableQueryUnderstanding";
  v26 = objc_msgSend(NSNumber, "numberWithBool:", -[PHSearchQueryOptions enableQueryUnderstanding](self, "enableQueryUnderstanding"));
  v43[13] = v26;
  v42[14] = @"fastRanking";
  v25 = objc_msgSend(NSNumber, "numberWithBool:", -[PHSearchQueryOptions fastRanking](self, "fastRanking"));
  v43[14] = v25;
  v42[15] = @"collectionThreshold";
  v4 = NSNumber;
  [(PHSearchQueryOptions *)self collectionThreshold];
  v24 = objc_msgSend(v4, "numberWithDouble:");
  v43[15] = v24;
  v42[16] = @"embeddingRelevanceThreshold";
  v5 = NSNumber;
  [(PHSearchQueryOptions *)self embeddingRelevanceThreshold];
  v23 = objc_msgSend(v5, "numberWithDouble:");
  v43[16] = v23;
  v42[17] = @"disableU2";
  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[PHSearchQueryOptions disableU2](self, "disableU2"));
  v43[17] = v22;
  v42[18] = @"embeddingGenerationTimeout";
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHSearchQueryOptions embeddingGenerationTimeout](self, "embeddingGenerationTimeout"));
  v43[18] = v6;
  v42[19] = @"enableQueryUnderstandingGenericLocations";
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[PHSearchQueryOptions enableQueryUnderstandingGenericLocations](self, "enableQueryUnderstandingGenericLocations"));
  v43[19] = v7;
  v42[20] = @"minNumberOfResultsForNextTokenGeneration";
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHSearchQueryOptions minNumberOfResultsForNextTokenGeneration](self, "minNumberOfResultsForNextTokenGeneration"));
  v43[20] = v8;
  v42[21] = @"matchType";
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHSearchQueryOptions matchType](self, "matchType"));
  v43[21] = v9;
  v42[22] = @"matchType_humanReadable";
  unint64_t matchType = self->_matchType;
  if (matchType > 3) {
    v11 = @"Unknown";
  }
  else {
    v11 = off_1E58428A0[matchType];
  }
  v12 = v11;
  v43[22] = v12;
  v42[23] = @"enableEmbeddingOnlyResultsInExactMatches";
  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[PHSearchQueryOptions enableEmbeddingOnlyResultsInExactMatches](self, "enableEmbeddingOnlyResultsInExactMatches"));
  v43[23] = v13;
  v42[24] = @"spotlightQueryTimeout";
  v14 = NSNumber;
  [(PHSearchQueryOptions *)self spotlightQueryTimeout];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  v43[24] = v15;
  v42[25] = @"enableNextTokenSuggestions";
  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[PHSearchQueryOptions enableNextTokenSuggestions](self, "enableNextTokenSuggestions"));
  v43[25] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:26];
  v18 = (void *)[v34 initWithDictionary:v17];

  if (!v29) {
  v19 = (void *)[v18 copy];
  }

  return v19;
}

- (id)description
{
  unint64_t locationInQueryStringForSuggestionGeneration = self->_locationInQueryStringForSuggestionGeneration;
  if (locationInQueryStringForSuggestionGeneration == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = @"NSNotFound";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%tu", locationInQueryStringForSuggestionGeneration);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v6 = [(PHSearchQueryOptions *)self _rankingModeDescription];
  [v5 appendFormat:@"Ranking: %@, ", v6];

  if (self->_disableSemanticSearch) {
    v7 = @"NO";
  }
  else {
    v7 = @"YES";
  }
  [v5 appendFormat:@"Embeddings: %@, ", v7];
  if (self->_disableMetadataSearch) {
    v8 = @"NO";
  }
  else {
    v8 = @"YES";
  }
  [v5 appendFormat:@"Metadata: %@, ", v8];
  if (self->_enableQueryMatchDetails) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  [v5 appendFormat:@"QueryMatchDetails: %@, ", v9];
  [v5 appendFormat:@"SuggestionLimit: %tu, ", self->_suggestionLimit];
  [v5 appendFormat:@"ScopedIdentifiers count: %tu, ", -[NSSet count](self->_scopedIdentifiers, "count")];
  v10 = PHSearchQueryResultTypesDescription([(PHSearchQueryOptions *)self searchQueryResultTypes]);
  [v5 appendFormat:@"ResultTypes: %@, ", v10];

  [v5 appendFormat:@"Max Results: %tu, ", self->_maxSearchResults];
  [v5 appendFormat:@"Max Top Assets: %tu, ", self->_maxRankedAssetSearchResults];
  [v5 appendFormat:@"Max Top Collections: %tu, ", self->_maxRankedCollectionSearchResults];
  [v5 appendFormat:@"Query text position for suggestions: %@, ", v4];
  if (self->_enableQueryUnderstanding) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  [v5 appendFormat:@"Enable Query Understanding: %@, ", v11];
  if (self->_excludeOCRTextResultMatches) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  [v5 appendFormat:@"Exclude OCR results: %@, ", v12];
  if (self->_disableSafetyCheck) {
    v13 = @"NO";
  }
  else {
    v13 = @"YES";
  }
  [v5 appendFormat:@"SafetyCheck: %@, ", v13];
  if (self->_fastRanking) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  [v5 appendFormat:@"FastRanking: %@, ", v14];
  if (self->_disableU2) {
    v15 = @"NO";
  }
  else {
    v15 = @"YES";
  }
  [v5 appendFormat:@"U2: %@, ", v15];
  [v5 appendFormat:@"CollectionThreshold: %f, ", *(void *)&self->_collectionThreshold];
  [v5 appendFormat:@"EmbeddingThreshold: %f, ", *(void *)&self->_embeddingRelevanceThreshold];
  [v5 appendFormat:@"EmbeddingTimeout: %ld, ", self->_embeddingGenerationTimeout];
  if (self->_enableQueryUnderstandingGenericLocations) {
    v16 = @"YES";
  }
  else {
    v16 = @"NO";
  }
  [v5 appendFormat:@"Enable QU Generic Location: %@, ", v16];
  unint64_t matchType = self->_matchType;
  if (matchType > 3) {
    v18 = @"Unknown";
  }
  else {
    v18 = off_1E58428A0[matchType];
  }
  v19 = v18;
  [v5 appendFormat:@"Result match type: %@, ", v19];

  [v5 appendFormat:@"MinNumberOfResultsForNextTokenGeneration: %tu, ", self->_minNumberOfResultsForNextTokenGeneration];
  if (self->_enableEmbeddingOnlyResultsInExactMatches) {
    v20 = @"YES";
  }
  else {
    v20 = @"NO";
  }
  [v5 appendFormat:@"EnableEmbeddingOnlyResultsInExactMatches: %@, ", v20];
  [v5 appendFormat:@"Spotlight Query Timeout: %f, ", *(void *)&self->_spotlightQueryTimeout];
  if (self->_enableNextTokenSuggestions) {
    v21 = @"YES";
  }
  else {
    v21 = @"NO";
  }
  [v5 appendFormat:@"EnableNextTokenSuggestions: %@, ", v21];
  v22 = (void *)[v5 copy];

  return v22;
}

- (id)_rankingModeDescription
{
  if (!self->_maxRankedAssetSearchResults && !self->_maxRankedCollectionSearchResults) {
    return @"OFF";
  }
  if (self->_fastRanking) {
    return @"ON (L1)";
  }
  return @"ON (L2)";
}

- (void)setMatchType:(unint64_t)a3
{
  BOOL v5 = +[PHSearchQueryManager currentSpotlightVersionSupportsExactMatchBehavior];
  unint64_t v6 = 3;
  if (v5) {
    unint64_t v6 = a3;
  }
  self->_unint64_t matchType = v6;
}

- (void)setEnableEmbeddingOnlyResultsInExactMatches:(BOOL)a3
{
  if (!+[PHSearchQueryManager currentSpotlightVersionSupportsExactMatchBehaviorWithEmbeddingOnlyResults]|| [(PHSearchQueryOptions *)self disableSemanticSearch])
  {
    a3 = 0;
  }
  self->_enableEmbeddingOnlyResultsInExactMatches = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PHSearchQueryOptions);
  [(PHSearchQueryOptions *)v4 setSearchQueryResultTypes:self->_searchQueryResultTypes];
  BOOL v5 = (void *)[(NSSet *)self->_scopedIdentifiers copy];
  [(PHSearchQueryOptions *)v4 setScopedIdentifiers:v5];

  [(PHSearchQueryOptions *)v4 setSuggestionLimit:self->_suggestionLimit];
  [(PHSearchQueryOptions *)v4 setDisableSemanticSearch:self->_disableSemanticSearch];
  [(PHSearchQueryOptions *)v4 setDisableMetadataSearch:self->_disableMetadataSearch];
  [(PHSearchQueryOptions *)v4 setDisableSafetyCheck:self->_disableSafetyCheck];
  [(PHSearchQueryOptions *)v4 setEnableQueryMatchDetails:self->_enableQueryMatchDetails];
  [(PHSearchQueryOptions *)v4 setMaxSearchResults:self->_maxSearchResults];
  [(PHSearchQueryOptions *)v4 setExcludeOCRTextResultMatches:self->_excludeOCRTextResultMatches];
  [(PHSearchQueryOptions *)v4 setMaxRankedAssetSearchResults:self->_maxRankedAssetSearchResults];
  [(PHSearchQueryOptions *)v4 setMaxRankedCollectionSearchResults:self->_maxRankedCollectionSearchResults];
  [(PHSearchQueryOptions *)v4 setLocationInQueryStringForSuggestionGeneration:self->_locationInQueryStringForSuggestionGeneration];
  [(PHSearchQueryOptions *)v4 setEnableQueryUnderstanding:self->_enableQueryUnderstanding];
  [(PHSearchQueryOptions *)v4 setFastRanking:self->_fastRanking];
  [(PHSearchQueryOptions *)v4 setEmbeddingRelevanceThreshold:self->_embeddingRelevanceThreshold];
  [(PHSearchQueryOptions *)v4 setDisableU2:self->_disableU2];
  [(PHSearchQueryOptions *)v4 setEmbeddingGenerationTimeout:self->_embeddingGenerationTimeout];
  [(PHSearchQueryOptions *)v4 setEnableQueryUnderstandingGenericLocations:self->_enableQueryUnderstandingGenericLocations];
  [(PHSearchQueryOptions *)v4 setCollectionThreshold:self->_collectionThreshold];
  [(PHSearchQueryOptions *)v4 setMatchType:self->_matchType];
  [(PHSearchQueryOptions *)v4 setMinNumberOfResultsForNextTokenGeneration:self->_minNumberOfResultsForNextTokenGeneration];
  [(PHSearchQueryOptions *)v4 setEnableEmbeddingOnlyResultsInExactMatches:self->_enableEmbeddingOnlyResultsInExactMatches];
  [(PHSearchQueryOptions *)v4 setSpotlightQueryTimeout:self->_spotlightQueryTimeout];
  [(PHSearchQueryOptions *)v4 setEnableNextTokenSuggestions:self->_enableNextTokenSuggestions];
  return v4;
}

- (PHSearchQueryOptions)init
{
  v7.receiver = self;
  v7.super_class = (Class)PHSearchQueryOptions;
  v2 = [(PHSearchQueryOptions *)&v7 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_searchQueryResultTypes = 1;
    v2->_unint64_t locationInQueryStringForSuggestionGeneration = 0x7FFFFFFFFFFFFFFFLL;
    v2->_embeddingRelevanceThreshold = -1.0;
    v2->_embeddingGenerationTimeout = 1000;
    v2->_collectionThreshold = 0.33;
    v2->_minNumberOfResultsForNextTokenGeneration = 35;
    BOOL v4 = +[PHSearchQueryManager currentSpotlightVersionSupportsExactMatchBehavior];
    uint64_t v5 = 2;
    if (!v4) {
      uint64_t v5 = 3;
    }
    v3->_unint64_t matchType = v5;
    v3->_spotlightQueryTimeout = 10.0;
  }
  return v3;
}

@end