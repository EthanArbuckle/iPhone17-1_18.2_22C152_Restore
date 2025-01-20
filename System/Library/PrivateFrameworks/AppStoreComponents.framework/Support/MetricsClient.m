@interface MetricsClient
- (_TtC19appstorecomponentsd13MetricsClient)init;
- (void)logErrorMessage:(id)a3;
- (void)processMetricsData:(id)a3 pageFields:(id)a4 activity:(id)a5 withReplyHandler:(id)a6;
- (void)processViewRenderWithPredicate:(id)a3 withReplyHandler:(id)a4;
- (void)recordCampaignToken:(id)a3 providerToken:(id)a4 withLockup:(id)a5 withReplyHandler:(id)a6;
- (void)recordQToken:(id)a3 campaignToken:(id)a4 advertisementID:(id)a5 withLockup:(id)a6 withReplyHandler:(id)a7;
@end

@implementation MetricsClient

- (void)processMetricsData:(id)a3 pageFields:(id)a4 activity:(id)a5 withReplyHandler:(id)a6
{
  v10 = _Block_copy(a6);
  if (a4) {
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  id v13 = a5;
  v14 = self;
  sub_100110600(v12, (uint64_t)a4, a5, (uint64_t)sub_10006239C, v11);

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)processViewRenderWithPredicate:(id)a3 withReplyHandler:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_100113BFC(v7, (uint64_t)v8, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)recordCampaignToken:(id)a3 providerToken:(id)a4 withLockup:(id)a5 withReplyHandler:(id)a6
{
  v8 = _Block_copy(a6);
  v9 = (void (*)(char *, uint64_t))static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v8;
  id v16 = a5;
  v17 = self;
  sub_100111644(v9, v11, v12, v14, v16, (uint64_t)sub_10006239C, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)recordQToken:(id)a3 campaignToken:(id)a4 advertisementID:(id)a5 withLockup:(id)a6 withReplyHandler:(id)a7
{
  v9 = _Block_copy(a7);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v9;
  id v20 = a6;
  v21 = self;
  sub_100111B78(v10, v12, v13, v15, v16, v18, v20, (uint64_t)sub_100061788, v19);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)logErrorMessage:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_100112108(v4);

  swift_bridgeObjectRelease();
}

- (_TtC19appstorecomponentsd13MetricsClient)init
{
  result = (_TtC19appstorecomponentsd13MetricsClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC19appstorecomponentsd13MetricsClient_bag;
  uint64_t v4 = type metadata accessor for Bag();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC19appstorecomponentsd13MetricsClient_metricsPipeline;
  uint64_t v6 = type metadata accessor for MetricsPipeline();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  sub_10002ED08((uint64_t)self + OBJC_IVAR____TtC19appstorecomponentsd13MetricsClient_metricsService);
  sub_10002ED08((uint64_t)self + OBJC_IVAR____TtC19appstorecomponentsd13MetricsClient_metricsLogger);
  sub_10002ED08((uint64_t)self + OBJC_IVAR____TtC19appstorecomponentsd13MetricsClient_signpostExtractor);
  id v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd13MetricsClient_collectionQueue);
}

@end