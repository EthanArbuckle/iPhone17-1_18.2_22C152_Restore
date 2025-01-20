@interface DNDSPlatformEligibility
+ (BOOL)isIntelligenceAvailable;
- (DNDSPlatformEligibility)init;
@end

@implementation DNDSPlatformEligibility

+ (BOOL)isIntelligenceAvailable
{
  return sub_1D3109990() & 1;
}

- (DNDSPlatformEligibility)init
{
  v3.receiver = self;
  v3.super_class = (Class)DNDSPlatformEligibility;
  return [(DNDSPlatformEligibility *)&v3 init];
}

@end