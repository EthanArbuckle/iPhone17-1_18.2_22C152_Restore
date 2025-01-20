@interface HKRemoteFeatureAvailabilityAlwaysFalseRule
+ (id)ruleIdentifier;
- (BOOL)evaluate;
- (HKRemoteFeatureAvailabilityAlwaysFalseRule)initWithRawValue:(id)a3 dataSource:(id)a4;
@end

@implementation HKRemoteFeatureAvailabilityAlwaysFalseRule

+ (id)ruleIdentifier
{
  return @"AlwaysFalse";
}

- (HKRemoteFeatureAvailabilityAlwaysFalseRule)initWithRawValue:(id)a3 dataSource:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HKRemoteFeatureAvailabilityAlwaysFalseRule;
  return [(HKRemoteFeatureAvailabilityAlwaysFalseRule *)&v5 init];
}

- (BOOL)evaluate
{
  return 0;
}

@end