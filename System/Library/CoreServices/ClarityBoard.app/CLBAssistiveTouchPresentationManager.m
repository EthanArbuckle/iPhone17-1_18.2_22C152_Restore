@interface CLBAssistiveTouchPresentationManager
- (BOOL)isAllowedOnLockScreen;
- (BOOL)requestsSceneWhenNeeded;
- (BOOL)supportsClarityUI;
- (CLBAssistiveTouchPresentationManager)init;
- (NSString)bundleIdentifier;
- (NSString)entitlement;
- (NSString)name;
- (NSString)sceneSessionRole;
@end

@implementation CLBAssistiveTouchPresentationManager

- (NSString)name
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (NSString)sceneSessionRole
{
  return (NSString *)@"CLBSceneSessionRoleAssistiveTouch";
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
  return 0;
}

- (NSString)entitlement
{
  return (NSString *)@"com.apple.assistivetouch.daemon";
}

- (CLBAssistiveTouchPresentationManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AssistiveTouchPresentationManager();
  return [(CLBScenePresentationManager *)&v3 init];
}

@end