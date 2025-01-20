@interface HNFeatureFlags
+ (BOOL)isContextualUnderstandingEnabled;
+ (BOOL)isContextualUnderstandingNotificationsEnabled;
+ (BOOL)isHumanUnderstandingDataCollectionEnabled;
+ (BOOL)isHumanUnderstandingEvidenceEnabled;
- (HNFeatureFlags)init;
@end

@implementation HNFeatureFlags

+ (BOOL)isContextualUnderstandingEnabled
{
  return static HUFeatureFlags.isContextualUnderstandingEnabled()() & 1;
}

+ (BOOL)isHumanUnderstandingEvidenceEnabled
{
  return static HUFeatureFlags.isHumanUnderstandingEvidenceEnabled()() & 1;
}

+ (BOOL)isHumanUnderstandingDataCollectionEnabled
{
  return static HUFeatureFlags.isHumanUnderstandingDataCollectionEnabled()() & 1;
}

+ (BOOL)isContextualUnderstandingNotificationsEnabled
{
  return static HUFeatureFlags.isContextualUnderstandingNotificationsEnabled()() & 1;
}

- (HNFeatureFlags)init
{
  return (HNFeatureFlags *)HUFeatureFlags.init()();
}

@end