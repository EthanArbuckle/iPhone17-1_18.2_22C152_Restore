@interface MUHikingTipCoordinator
- (MUHikingTipCoordinator)init;
- (MUHikingTipCoordinator)initWithMapService:(id)a3 locationDelegate:(id)a4 mapAccessProvider:(id)a5 presenter:(id)a6;
@end

@implementation MUHikingTipCoordinator

- (MUHikingTipCoordinator)initWithMapService:(id)a3 locationDelegate:(id)a4 mapAccessProvider:(id)a5 presenter:(id)a6
{
  id v6 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v7 = (MUHikingTipCoordinator *)sub_19324D4F8(v6);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v7;
}

- (MUHikingTipCoordinator)init
{
  result = (MUHikingTipCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1931F0EAC((uint64_t)self + OBJC_IVAR___MUHikingTipCoordinator_locationDelegate);
  sub_1931F0EAC((uint64_t)self + OBJC_IVAR___MUHikingTipCoordinator_mapAccessProvider);
  sub_1931F0EAC((uint64_t)self + OBJC_IVAR___MUHikingTipCoordinator_presenter);
  swift_bridgeObjectRelease();
}

@end