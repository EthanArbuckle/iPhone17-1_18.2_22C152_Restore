@interface JSMetrics
- (_TtC14amsengagementd9JSMetrics)init;
- (id)flush;
- (id)loadIdentifier:(id)a3 :(id)a4 :(id)a5 :(BOOL)a6;
- (id)loadIdentifierFields:(id)a3 :(id)a4 :(id)a5 :(BOOL)a6;
- (void)enqueue:(id)a3 :(id)a4 :(id)a5;
- (void)enqueueBatch:(id)a3 :(id)a4;
@end

@implementation JSMetrics

- (void)enqueueBatch:(id)a3 :(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = self;
  sub_100009118(v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)enqueue:(id)a3 :(id)a4 :(id)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = self;
  sub_1000F1600();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)flush
{
  v2 = self;
  v3 = (void *)sub_1000F1AC0();

  return v3;
}

- (id)loadIdentifier:(id)a3 :(id)a4 :(id)a5 :(BOOL)a6
{
  return sub_1000F5F84();
}

- (id)loadIdentifierFields:(id)a3 :(id)a4 :(id)a5 :(BOOL)a6
{
  return sub_1000F5F84();
}

- (_TtC14amsengagementd9JSMetrics)init
{
}

- (void).cxx_destruct
{
  v2 = *(void **)&self->config[OBJC_IVAR____TtC14amsengagementd9JSMetrics_config];
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end