@interface PARBagConfigFactory
- (_TtC7parsecdP33_A71F4EB6BEA682B89431D07BAC0060AE19PARBagConfigFactory)init;
- (id)loadWithData:(id)a3 userAgent:(id)a4 userDefaults:(id)a5;
- (id)loadWithUrl:(id)a3 userAgent:(id)a4 userDefaults:(id)a5;
@end

@implementation PARBagConfigFactory

- (id)loadWithUrl:(id)a3 userAgent:(id)a4 userDefaults:(id)a5
{
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v13;
  }
  else
  {
    uint64_t v12 = 0;
  }
  v14 = self;
  id v15 = a5;
  id v16 = sub_100104AE4((uint64_t)v11, v12, (uint64_t)a4, a5);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  return v16;
}

- (id)loadWithData:(id)a3 userAgent:(id)a4 userDefaults:(id)a5
{
  id v8 = a3;
  uint64_t v9 = self;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;

  if (v10)
  {
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v17 = v16;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v17 = 0;
  }
  id v18 = sub_100104D38(v12, v14, v15, v17, v11);
  swift_bridgeObjectRelease();
  sub_1000291B4(v12, v14);

  return v18;
}

- (_TtC7parsecdP33_A71F4EB6BEA682B89431D07BAC0060AE19PARBagConfigFactory)init
{
  return (_TtC7parsecdP33_A71F4EB6BEA682B89431D07BAC0060AE19PARBagConfigFactory *)sub_100104EA4();
}

@end