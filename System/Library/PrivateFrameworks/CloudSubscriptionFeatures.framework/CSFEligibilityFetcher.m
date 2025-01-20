@interface CSFEligibilityFetcher
+ (CSFEligibility)current;
- (CSFEligibilityFetcher)init;
@end

@implementation CSFEligibilityFetcher

+ (CSFEligibility)current
{
  id v2 = _s25CloudSubscriptionFeatures18EligibilityFetcherC7currentAA0D0CvgZ_0();
  return (CSFEligibility *)v2;
}

- (CSFEligibilityFetcher)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EligibilityFetcher();
  return [(CSFEligibilityFetcher *)&v3 init];
}

@end