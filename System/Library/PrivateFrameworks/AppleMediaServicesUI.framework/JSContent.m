@interface JSContent
- (_TtC14amsengagementd9JSContent)init;
- (id)batchInfo:(id)a3;
- (id)info:(id)a3 :(id)a4;
- (id)metadataInfo:(id)a3;
- (id)readJSON:(id)a3 :(id)a4;
- (void)batchDownload:(id)a3 :(id)a4 :(id)a5;
- (void)batchRemove:(id)a3;
- (void)download:(id)a3 :(id)a4 :(id)a5 :(id)a6;
- (void)extend:(id)a3 :(id)a4;
- (void)remove:(id)a3;
- (void)save:(id)a3 :(id)a4 :(id)a5 :(id)a6;
- (void)saveFilePath:(id)a3 :(id)a4 :(id)a5;
@end

@implementation JSContent

- (void)batchDownload:(id)a3 :(id)a4 :(id)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a4;
  v8 = self;
  sub_1000D67AC();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)batchInfo:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = self;
  uint64_t v5 = sub_1000D70E4();

  swift_bridgeObjectRelease();
  if (v5)
  {
    v6.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6.super.isa = 0;
  }
  return v6.super.isa;
}

- (void)batchRemove:(id)a3
{
}

- (void)download:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  NSDictionary v6 = self;
  sub_1000D72EC();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)extend:(id)a3 :(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  if (a4)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v11 = self;
  sub_1000D79E4(v6, v8, v9, (uint64_t)a4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)info:(id)a3 :(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = self;
  uint64_t v10 = sub_1000D813C(v5, v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v10)
  {
    v11.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v11.super.isa = 0;
  }
  return v11.super.isa;
}

- (id)metadataInfo:(id)a3
{
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = self;
  uint64_t v5 = sub_1000D8B00();

  swift_bridgeObjectRelease();
  if (v5)
  {
    v6.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6.super.isa = 0;
  }
  return v6.super.isa;
}

- (id)readJSON:(id)a3 :(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = self;
  sub_1000D8C20();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v14;
  if (v14)
  {
    uint64_t v7 = sub_100049788(v13, v14);
    uint64_t v8 = *(void *)(v6 - 8);
    __chkstk_darwin(v7);
    uint64_t v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v8 + 16))(v10);
    NSDictionary v11 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
    sub_10004377C((uint64_t)v13);
  }
  else
  {
    NSDictionary v11 = 0;
  }
  return v11;
}

- (void)remove:(id)a3
{
}

- (void)save:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a3;
  uint64_t v9 = self;
  sub_1000D9CD4();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)saveFilePath:(id)a3 :(id)a4 :(id)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = self;
  sub_1000DA47C();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC14amsengagementd9JSContent)init
{
}

- (void).cxx_destruct
{
  v2 = *(void **)&self->config[OBJC_IVAR____TtC14amsengagementd9JSContent_config];
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end