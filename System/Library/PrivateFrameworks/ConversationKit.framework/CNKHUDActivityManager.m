@interface CNKHUDActivityManager
+ (CNKHUDActivityManager)sharedManager;
- (CNKHUDActivityManager)init;
@end

@implementation CNKHUDActivityManager

+ (CNKHUDActivityManager)sharedManager
{
  id v2 = static HUDActivityManager.shared.getter();
  return (CNKHUDActivityManager *)v2;
}

- (CNKHUDActivityManager)init
{
  return (CNKHUDActivityManager *)HUDActivityManager.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_bridgeObjectRelease();
}

@end