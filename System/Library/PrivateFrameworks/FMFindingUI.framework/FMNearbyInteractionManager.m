@interface FMNearbyInteractionManager
- (_TtC11FMFindingUI26FMNearbyInteractionManager)init;
- (id)description;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
@end

@implementation FMNearbyInteractionManager

- (id)description
{
  id v1 = a1;
  sub_24D2C9FD0();

  v2 = (void *)sub_24D39CAC0();
  swift_bridgeObjectRelease();
  return v2;
}

- (void)applicationDidEnterBackground
{
  v2 = self;
  sub_24D2E12E8();
}

- (void)applicationWillEnterForeground
{
  v2 = self;
  sub_24D2E1648();
}

- (_TtC11FMFindingUI26FMNearbyInteractionManager)init
{
  result = (_TtC11FMFindingUI26FMNearbyInteractionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11FMFindingUI26FMNearbyInteractionManager_arSession);
}

@end