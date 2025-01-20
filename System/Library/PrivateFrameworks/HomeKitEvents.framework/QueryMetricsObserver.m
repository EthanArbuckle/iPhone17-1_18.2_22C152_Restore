@interface QueryMetricsObserver
- (_TtC13HomeKitEvents20QueryMetricsObserver)init;
- (void)didReceiveEventFromDispatcher:(id)a3;
@end

@implementation QueryMetricsObserver

- (void)didReceiveEventFromDispatcher:(id)a3
{
  type metadata accessor for CloudKitQueryLogEvent();
  uint64_t v4 = swift_dynamicCastClass();
  if (v4)
  {
    v5 = (char *)v4;
    id v6 = a3;
    v7 = self;
    sub_2523E4504(v5);
  }
  else
  {
    type metadata accessor for EventsAsyncSequenceLogEvent();
    uint64_t v8 = swift_dynamicCastClass();
    if (!v8) {
      return;
    }
    v9 = (char *)v8;
    id v10 = a3;
    v11 = self;
    sub_2523E481C(v9);
  }
}

- (_TtC13HomeKitEvents20QueryMetricsObserver)init
{
  result = (_TtC13HomeKitEvents20QueryMetricsObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13HomeKitEvents20QueryMetricsObserver_features);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end