@interface CLBDruidPresentationManager
- (BOOL)isAllowedOnLockScreen;
- (BOOL)requestsSceneWhenNeeded;
- (BOOL)supportsClarityUI;
- (CLBDruidPresentationManager)init;
- (NSString)bundleIdentifier;
- (NSString)entitlement;
- (NSString)name;
- (NSString)sceneSessionRole;
@end

@implementation CLBDruidPresentationManager

- (NSString)name
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (NSString)sceneSessionRole
{
  return (NSString *)@"CLBSceneSessionRoleDruid";
}

- (BOOL)isAllowedOnLockScreen
{
  return 0;
}

- (NSString)bundleIdentifier
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (BOOL)supportsClarityUI
{
  return 0;
}

- (BOOL)requestsSceneWhenNeeded
{
  return 0;
}

- (NSString)entitlement
{
  return (NSString *)@"com.apple.druid";
}

- (CLBDruidPresentationManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DruidPresentationManager();
  return [(CLBScenePresentationManager *)&v3 init];
}

@end