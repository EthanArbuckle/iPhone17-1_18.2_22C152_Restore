@interface SALocalSearchNavigationPromptManeuver
- (id)_ad_transformedMapsRequest;
- (id)_ad_transformedMapsSuccessResponse;
@end

@implementation SALocalSearchNavigationPromptManeuver

- (id)_ad_transformedMapsSuccessResponse
{
  id v2 = objc_alloc_init((Class)SALocalSearchNavigationPromptManeuverCompleted);
  return v2;
}

- (id)_ad_transformedMapsRequest
{
  id v2 = objc_alloc_init((Class)STPromptManeuverRequest);
  return v2;
}

@end