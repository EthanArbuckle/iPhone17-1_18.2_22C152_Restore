@interface FMR1ProximityManager
- (_TtC11FMFindingUI20FMR1ProximityManager)init;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
@end

@implementation FMR1ProximityManager

- (_TtC11FMFindingUI20FMR1ProximityManager)init
{
  return (_TtC11FMFindingUI20FMR1ProximityManager *)sub_24D2F1C6C();
}

- (void)applicationDidEnterBackground
{
  v2 = self;
  sub_24D2F2174();
}

- (void)applicationWillEnterForeground
{
  v2 = self;
  sub_24D2F24D4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11FMFindingUI20FMR1ProximityManager_serialQueue);
}

@end