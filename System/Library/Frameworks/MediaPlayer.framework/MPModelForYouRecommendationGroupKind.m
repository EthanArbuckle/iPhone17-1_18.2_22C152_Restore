@interface MPModelForYouRecommendationGroupKind
+ (id)identityKind;
- (id)humanDescription;
@end

@implementation MPModelForYouRecommendationGroupKind

+ (id)identityKind
{
  uint64_t v2 = objc_opt_class();

  return +[MPModelKind kindWithModelClass:v2];
}

- (id)humanDescription
{
  return @"recommendation group";
}

@end