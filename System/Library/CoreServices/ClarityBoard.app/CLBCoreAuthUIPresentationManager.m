@interface CLBCoreAuthUIPresentationManager
- (BOOL)avoidsBackButton;
- (BOOL)isAllowedOnLockScreen;
- (BOOL)requestsSceneWhenNeeded;
- (BOOL)supportsClarityUI;
- (CLBCoreAuthUIPresentationManager)init;
- (NSString)bundleIdentifier;
- (NSString)entitlement;
- (NSString)name;
- (NSString)sceneSessionRole;
@end

@implementation CLBCoreAuthUIPresentationManager

- (NSString)name
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (NSString)sceneSessionRole
{
  return (NSString *)@"CLBSceneSessionRoleCoreAuthUI";
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
  return 1;
}

- (NSString)entitlement
{
  return (NSString *)@"com.apple.clarityboard.coreAuthUIPresentation";
}

- (BOOL)avoidsBackButton
{
  return 1;
}

- (CLBCoreAuthUIPresentationManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CoreAuthUIPresentationManager();
  return [(CLBScenePresentationManager *)&v3 init];
}

@end