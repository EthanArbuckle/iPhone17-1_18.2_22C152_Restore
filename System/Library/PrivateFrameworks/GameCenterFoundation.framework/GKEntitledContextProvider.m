@interface GKEntitledContextProvider
+ (BOOL)hasAnyGameCenterEntitlement;
+ (BOOL)hasBooleanPublicGameCenterEntitlement;
+ (BOOL)hasPublicGroupActivitiesEntitlement;
+ (id)getCurrentDeviceName;
- (GKEntitledContextProvider)init;
@end

@implementation GKEntitledContextProvider

+ (BOOL)hasAnyGameCenterEntitlement
{
  return static EntitledContextProvider.hasAnyGameCenterEntitlement()() & 1;
}

+ (id)getCurrentDeviceName
{
  static EntitledContextProvider.getCurrentDeviceName()();
  if (v2)
  {
    v3 = (void *)sub_1C2E922C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (BOOL)hasBooleanPublicGameCenterEntitlement
{
  return static EntitledContextProvider.hasBooleanPublicGameCenterEntitlement()(a1, a2) & 1;
}

+ (BOOL)hasPublicGroupActivitiesEntitlement
{
  return static EntitledContextProvider.hasPublicGroupActivitiesEntitlement()(a1, a2) & 1;
}

- (GKEntitledContextProvider)init
{
  return (GKEntitledContextProvider *)sub_1C2E559D4();
}

@end