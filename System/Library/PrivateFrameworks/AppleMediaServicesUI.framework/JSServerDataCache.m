@interface JSServerDataCache
- (_TtC14amsengagementd17JSServerDataCache)init;
- (id)data:(id)a3 :(id)a4 :(id)a5;
- (id)granularNotificationSettings:(id)a3 :(id)a4 :(id)a5;
- (id)offerRankingItemsForServices:(id)a3 :(id)a4 :(id)a5;
@end

@implementation JSServerDataCache

- (id)data:(id)a3 :(id)a4 :(id)a5
{
  return sub_10000CBBC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10000CD3C);
}

- (_TtC14amsengagementd17JSServerDataCache)init
{
  return (_TtC14amsengagementd17JSServerDataCache *)sub_100054230();
}

- (id)granularNotificationSettings:(id)a3 :(id)a4 :(id)a5
{
  return sub_10000CBBC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000F8940);
}

- (id)offerRankingItemsForServices:(id)a3 :(id)a4 :(id)a5
{
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v7 = self;
  v8 = (void *)sub_1000F8970();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

@end