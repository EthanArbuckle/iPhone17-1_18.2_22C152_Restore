@interface CLBInCallServicePresentationManager
- (BOOL)isAllowedOnLockScreen;
- (BOOL)requestsSceneWhenNeeded;
- (BOOL)shouldDisableIdleTimer;
- (BOOL)supportsClarityUI;
- (CLBInCallServicePresentationManager)init;
- (NSString)bundleIdentifier;
- (NSString)entitlement;
- (NSString)name;
- (NSString)sceneSessionRole;
- (int64_t)displayLayoutStyle;
@end

@implementation CLBInCallServicePresentationManager

- (NSString)name
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (NSString)sceneSessionRole
{
  return (NSString *)@"CLBSceneSessionRoleInCallService";
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
  return 1;
}

- (BOOL)requestsSceneWhenNeeded
{
  return 1;
}

- (BOOL)shouldDisableIdleTimer
{
  return 1;
}

- (int64_t)displayLayoutStyle
{
  return 2;
}

- (NSString)entitlement
{
  return (NSString *)@"com.apple.clarityboard.inCallPresentation";
}

- (CLBInCallServicePresentationManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InCallServicePresentationManager();
  return [(CLBScenePresentationManager *)&v3 init];
}

@end