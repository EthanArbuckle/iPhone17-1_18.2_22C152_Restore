@interface FMItemR1ConnectionManager
@end

@implementation FMItemR1ConnectionManager

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI25FMItemR1ConnectionManager_proximityManager));
  v3 = (char *)self + OBJC_IVAR____TtC11FMFindingUI25FMItemR1ConnectionManager_delegate;
  sub_24D2C6E6C((uint64_t)v3);
}

@end