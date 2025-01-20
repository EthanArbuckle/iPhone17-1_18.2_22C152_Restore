@interface HKRemoteFeatureAvailabilityAlwaysTrueRule
+ (id)ruleIdentifier;
- (BOOL)evaluate;
- (HKRemoteFeatureAvailabilityAlwaysTrueRule)initWithRawValue:(id)a3 dataSource:(id)a4;
@end

@implementation HKRemoteFeatureAvailabilityAlwaysTrueRule

+ (id)ruleIdentifier
{
  return @"AlwaysTrue";
}

- (HKRemoteFeatureAvailabilityAlwaysTrueRule)initWithRawValue:(id)a3 dataSource:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HKRemoteFeatureAvailabilityAlwaysTrueRule;
  return [(HKRemoteFeatureAvailabilityAlwaysTrueRule *)&v5 init];
}

- (BOOL)evaluate
{
  return 1;
}

@end