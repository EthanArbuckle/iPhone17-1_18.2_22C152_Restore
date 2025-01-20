@interface CSFGMFeatureFlags
+ (BOOL)anyFeatureEnabled;
- (_TtC25CloudSubscriptionFeatures17CSFGMFeatureFlags)init;
@end

@implementation CSFGMFeatureFlags

+ (BOOL)anyFeatureEnabled
{
  return sub_1A8CBCC00() & 1;
}

- (_TtC25CloudSubscriptionFeatures17CSFGMFeatureFlags)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CSFGMFeatureFlags();
  return [(CSFGMFeatureFlags *)&v3 init];
}

@end