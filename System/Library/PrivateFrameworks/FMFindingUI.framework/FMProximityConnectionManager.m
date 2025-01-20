@interface FMProximityConnectionManager
@end

@implementation FMProximityConnectionManager

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMProximityConnectionManager_nearbyInteractionManager));
  v3 = (char *)self + OBJC_IVAR____TtC11FMFindingUI28FMProximityConnectionManager_delegate;
  sub_24D2C6E6C((uint64_t)v3);
}

@end