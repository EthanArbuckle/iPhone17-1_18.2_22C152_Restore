@interface LocalizationJetPack
+ (id)loadWithUrl:(id)a3 client:(id)a4;
- (_TtC9storekitd19LocalizationJetPack)init;
- (id)stringForKey:(id)a3;
@end

@implementation LocalizationJetPack

+ (id)loadWithUrl:(id)a3 client:(id)a4
{
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  id v9 = a4;
  id v10 = sub_10011A7B8((uint64_t)v8, v9);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v10;
}

- (id)stringForKey:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = self;
  sub_10011C2D0();
  uint64_t v6 = v5;

  swift_bridgeObjectRelease();
  if (v6)
  {
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }

  return v7;
}

- (_TtC9storekitd19LocalizationJetPack)init
{
}

- (void).cxx_destruct
{
}

@end