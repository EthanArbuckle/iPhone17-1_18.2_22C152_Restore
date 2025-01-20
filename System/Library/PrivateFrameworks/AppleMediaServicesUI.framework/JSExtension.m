@interface JSExtension
- (_TtC14amsengagementd11JSExtension)init;
- (id)request:(id)a3 :(id)a4 :(id)a5;
- (id)requestSync:(id)a3 :(id)a4 :(id)a5;
- (void)requestAsyncEvent:(id)a3 :(id)a4 :(id)a5;
@end

@implementation JSExtension

- (id)request:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  swift_unknownObjectRetain();
  id v10 = a5;
  v11 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  uint64_t v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v13 = (void *)sub_1000DE88C(v7, v9, (uint64_t)v15, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10004377C((uint64_t)v15);
  return v13;
}

- (id)requestSync:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  swift_unknownObjectRetain();
  id v10 = a5;
  v11 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v12 = sub_1000DF384(v7, v9, (uint64_t)v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10004377C((uint64_t)v15);
  if (v12)
  {
    v13.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v13.super.isa = 0;
  }
  return v13.super.isa;
}

- (void)requestAsyncEvent:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  swift_unknownObjectRetain();
  uint64_t v12 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_1000DF940(v6, v8, v9, v11, (uint64_t)v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10004377C((uint64_t)v13);
}

- (_TtC14amsengagementd11JSExtension)init
{
}

- (void).cxx_destruct
{
  v2 = *(void **)&self->config[OBJC_IVAR____TtC14amsengagementd11JSExtension_config];
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
}

@end