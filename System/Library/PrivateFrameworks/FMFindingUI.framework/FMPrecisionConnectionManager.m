@interface FMPrecisionConnectionManager
@end

@implementation FMPrecisionConnectionManager

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMPrecisionConnectionManager_nearbyInteractionManager));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMPrecisionConnectionManager_arSession));
  v3 = (char *)self + OBJC_IVAR____TtC11FMFindingUI28FMPrecisionConnectionManager_delegate;
  sub_24D2C6E6C((uint64_t)v3);
}

@end