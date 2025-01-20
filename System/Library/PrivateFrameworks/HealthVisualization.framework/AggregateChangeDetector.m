@interface AggregateChangeDetector
- (_TtC19HealthVisualization23AggregateChangeDetector)init;
@end

@implementation AggregateChangeDetector

- (_TtC19HealthVisualization23AggregateChangeDetector)init
{
  result = (_TtC19HealthVisualization23AggregateChangeDetector *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_healthStore));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_deliveryQueue));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_1C2A9BA54((uint64_t)self + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_pendingChangeSet, (uint64_t (*)(void))sub_1C2A3FF84);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_pendingError);
}

@end