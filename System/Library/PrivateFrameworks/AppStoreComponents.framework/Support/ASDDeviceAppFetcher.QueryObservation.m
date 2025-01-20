@interface ASDDeviceAppFetcher.QueryObservation
- (NSString)description;
- (_TtCV19appstorecomponentsd19ASDDeviceAppFetcherP33_602223BA61A39827BF84AE6E0E050E1316QueryObservation)init;
- (void)appQuery:(id)a3 resultsDidChange:(id)a4;
@end

@implementation ASDDeviceAppFetcher.QueryObservation

- (NSString)description
{
  v2 = self;
  sub_1000A526C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)appQuery:(id)a3 resultsDidChange:(id)a4
{
  sub_10002EE34(0, (unint64_t *)&unk_1001A3190);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10002EC6C((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtCV19appstorecomponentsd19ASDDeviceAppFetcherP33_602223BA61A39827BF84AE6E0E050E1316QueryObservation_taskScheduler), *(void *)&self->taskScheduler[OBJC_IVAR____TtCV19appstorecomponentsd19ASDDeviceAppFetcherP33_602223BA61A39827BF84AE6E0E050E1316QueryObservation_taskScheduler+ 8]);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCV19appstorecomponentsd19ASDDeviceAppFetcherP33_602223BA61A39827BF84AE6E0E050E1316QueryObservation_observer);
  uint64_t v7 = *(void *)&self->appQuery[OBJC_IVAR____TtCV19appstorecomponentsd19ASDDeviceAppFetcherP33_602223BA61A39827BF84AE6E0E050E1316QueryObservation_observer];
  v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = v7;
  v9[4] = v6;
  id v10 = a3;
  v11 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  dispatch thunk of TaskScheduler.schedule(task:)();

  swift_bridgeObjectRelease();

  swift_release();
}

- (_TtCV19appstorecomponentsd19ASDDeviceAppFetcherP33_602223BA61A39827BF84AE6E0E050E1316QueryObservation)init
{
  result = (_TtCV19appstorecomponentsd19ASDDeviceAppFetcherP33_602223BA61A39827BF84AE6E0E050E1316QueryObservation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV19appstorecomponentsd19ASDDeviceAppFetcherP33_602223BA61A39827BF84AE6E0E050E1316QueryObservation_appQuery));
  sub_10002ED08((uint64_t)self+ OBJC_IVAR____TtCV19appstorecomponentsd19ASDDeviceAppFetcherP33_602223BA61A39827BF84AE6E0E050E1316QueryObservation_taskScheduler);

  swift_release();
}

@end