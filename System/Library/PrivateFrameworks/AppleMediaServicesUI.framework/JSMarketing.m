@interface JSMarketing
- (_TtC14amsengagementd11JSMarketing)init;
- (void)cacheItem:(id)a3 :(id)a4 :(id)a5;
@end

@implementation JSMarketing

- (void)cacheItem:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a4;
  v11 = self;
  sub_1000EB950(v7, v9, v12, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC14amsengagementd11JSMarketing)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14amsengagementd11JSMarketing_bag;
  type metadata accessor for Bag();
  sub_1000456E0();
  (*(void (**)(char *))(v4 + 8))(v3);

  swift_bridgeObjectRelease();
}

@end