@interface _DKDiscoverabilityUsageMetadataKey
+ (id)analyticsEvent;
+ (id)bundleID;
+ (id)contentType;
+ (id)context;
+ (id)eligibleContext;
+ (id)ineligibleReason;
+ (id)osBuild;
+ (id)state;
@end

@implementation _DKDiscoverabilityUsageMetadataKey

+ (id)contentType
{
  return @"_DKDiscoverabilityUsageMetadataKey-contentType";
}

+ (id)eligibleContext
{
  return @"_DKDiscoverabilityUsageMetadataKey-eligibleContext";
}

+ (id)ineligibleReason
{
  return @"_DKDiscoverabilityUsageMetadataKey-ineligibleReason";
}

+ (id)analyticsEvent
{
  return @"_DKDiscoverabilityUsageMetadataKey-analyticsEvent";
}

+ (id)context
{
  return @"_DKDiscoverabilityUsageMetadataKey-context";
}

+ (id)state
{
  return @"_DKDiscoverabilityUsageMetadataKey-state";
}

+ (id)bundleID
{
  return @"_DKDiscoverabilityUsageMetadataKey-bundleID";
}

+ (id)osBuild
{
  return @"_DKDiscoverabilityUsageMetadataKey-osBuild";
}

@end