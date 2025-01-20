@interface SkannerCoordinator
+ (_TtC9appstored18SkannerCoordinator)sharedInstance;
- (_TtC9appstored18SkannerCoordinator)init;
- (void)completeStoryForAdvertisedAppAdamID:(int64_t)a3;
- (void)flushPendingEvents;
- (void)logEvent:(id)a3 forAdvertisedAppAdamID:(int64_t)a4;
- (void)logEvent:(id)a3 forAdvertisedAppAdamID:(int64_t)a4 synchronizeWithSnout:(BOOL)a5;
- (void)logEvents:(id)a3 forAdvertisedAppAdamID:(int64_t)a4;
- (void)startStoryIfNeededWith:(id)a3 forAdvertisedAppAdamID:(int64_t)a4;
@end

@implementation SkannerCoordinator

+ (_TtC9appstored18SkannerCoordinator)sharedInstance
{
  if (qword_1005A2FD0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1005B1490;
  return (_TtC9appstored18SkannerCoordinator *)v2;
}

- (void)startStoryIfNeededWith:(id)a3 forAdvertisedAppAdamID:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_10003C93C(v6, a4);
}

- (void)logEvent:(id)a3 forAdvertisedAppAdamID:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_10003C4A0(v6, a4);
}

- (void)logEvent:(id)a3 forAdvertisedAppAdamID:(int64_t)a4 synchronizeWithSnout:(BOOL)a5
{
  id v7 = a3;
  v8 = self;
  sub_10003C4A0(v7, a4);
}

- (void)logEvents:(id)a3 forAdvertisedAppAdamID:(int64_t)a4
{
  type metadata accessor for SkannerEvent();
  id v6 = (char *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = self;
  sub_10003D85C(v6, a4);

  swift_bridgeObjectRelease();
}

- (void)completeStoryForAdvertisedAppAdamID:(int64_t)a3
{
  v4 = self;
  sub_10003DE10(a3);
}

- (void)flushPendingEvents
{
  v2 = self;
  sub_10003E29C();
}

- (_TtC9appstored18SkannerCoordinator)init
{
  result = (_TtC9appstored18SkannerCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10002E618((uint64_t)self + OBJC_IVAR____TtC9appstored18SkannerCoordinator_storyMetrics);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored18SkannerCoordinator_databaseStore);
}

@end