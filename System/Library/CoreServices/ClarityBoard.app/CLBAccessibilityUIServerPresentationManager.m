@interface CLBAccessibilityUIServerPresentationManager
- (BOOL)isAllowedOnLockScreen;
- (BOOL)requestsSceneWhenNeeded;
- (BOOL)supportsClarityUI;
- (CLBAccessibilityUIServerPresentationManager)init;
- (NSString)bundleIdentifier;
- (NSString)entitlement;
- (NSString)name;
- (NSString)sceneSessionRole;
@end

@implementation CLBAccessibilityUIServerPresentationManager

- (NSString)name
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (NSString)sceneSessionRole
{
  return (NSString *)@"CLBSceneSessionRoleAccessibilityUIServer";
}

- (BOOL)isAllowedOnLockScreen
{
  return 1;
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
  return 1;
}

- (NSString)entitlement
{
  return (NSString *)@"com.apple.accessibility.AccessibilityUIServer";
}

- (CLBAccessibilityUIServerPresentationManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AccessibilityUIServerPresentationManager();
  return [(CLBScenePresentationManager *)&v3 init];
}

@end