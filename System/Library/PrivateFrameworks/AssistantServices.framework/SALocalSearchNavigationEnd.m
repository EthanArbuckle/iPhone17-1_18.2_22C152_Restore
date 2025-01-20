@interface SALocalSearchNavigationEnd
- (id)_ad_transformedMapsRequest;
- (id)_ad_transformedMapsSuccessResponse;
@end

@implementation SALocalSearchNavigationEnd

- (id)_ad_transformedMapsSuccessResponse
{
  id v2 = objc_alloc_init((Class)SALocalSearchNavigationEndCompleted);
  return v2;
}

- (id)_ad_transformedMapsRequest
{
  id v2 = objc_alloc_init((Class)STStopNavigationRequest);
  return v2;
}

@end