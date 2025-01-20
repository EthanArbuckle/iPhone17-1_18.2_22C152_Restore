@interface DeviceAppStateDataSource
- (_TtC19appstorecomponentsd24DeviceAppStateDataSource)init;
@end

@implementation DeviceAppStateDataSource

- (_TtC19appstorecomponentsd24DeviceAppStateDataSource)init
{
  result = (_TtC19appstorecomponentsd24DeviceAppStateDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10002ED08((uint64_t)self + OBJC_IVAR____TtC19appstorecomponentsd24DeviceAppStateDataSource_fetcher);
  sub_10002ED08((uint64_t)self + OBJC_IVAR____TtC19appstorecomponentsd24DeviceAppStateDataSource_availableUpdatesRegistry);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19appstorecomponentsd24DeviceAppStateDataSource_workQueue));
  swift_bridgeObjectRelease();
  sub_1000709E0((uint64_t)self + OBJC_IVAR____TtC19appstorecomponentsd24DeviceAppStateDataSource_queryObservation);

  swift_release();
}

@end