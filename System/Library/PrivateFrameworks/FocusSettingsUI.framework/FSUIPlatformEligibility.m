@interface FSUIPlatformEligibility
+ (BOOL)isIntelligenceAvailable;
- (FSUIPlatformEligibility)init;
@end

@implementation FSUIPlatformEligibility

+ (BOOL)isIntelligenceAvailable
{
  return sub_220D77388() & 1;
}

- (FSUIPlatformEligibility)init
{
  v3.receiver = self;
  v3.super_class = (Class)FSUIPlatformEligibility;
  return [(FSUIPlatformEligibility *)&v3 init];
}

@end