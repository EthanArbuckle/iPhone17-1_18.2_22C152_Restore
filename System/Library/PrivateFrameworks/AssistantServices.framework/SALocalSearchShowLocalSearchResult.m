@interface SALocalSearchShowLocalSearchResult
- (id)_ad_transformedMapsRequest;
- (id)_ad_transformedMapsSuccessResponse;
@end

@implementation SALocalSearchShowLocalSearchResult

- (id)_ad_transformedMapsSuccessResponse
{
  id v2 = objc_alloc_init((Class)SACommandSucceeded);
  return v2;
}

- (id)_ad_transformedMapsRequest
{
  id v3 = objc_alloc_init((Class)STSiriLocation);
  v4 = [(SALocalSearchShowLocalSearchResult *)self rawData];
  [v3 setGeoResult:v4];

  [v3 setResultType:2];
  id v5 = objc_alloc((Class)STShowMapsSearchResultsRequest);
  v6 = [(SALocalSearchShowLocalSearchResult *)self extSessionGuid];
  v7 = [(SALocalSearchShowLocalSearchResult *)self extSessionGuidCreatedTimestamp];
  id v8 = [v5 _initWithLocation:v3 extSessionGuid:v6 extSessionGuidCreatedTimestamp:v7];

  return v8;
}

@end