@interface objc_AnalyticsManager
+ (void)sendEvent:(id)a3;
+ (void)sendEventLazy:(id)a3 buildEvent:(id)a4;
- (_TtC17StoreKitUIService21objc_AnalyticsManager)init;
@end

@implementation objc_AnalyticsManager

+ (void)sendEvent:(id)a3
{
  swift_unknownObjectRetain();
  sub_10002C820(a3);

  swift_unknownObjectRelease();
}

+ (void)sendEventLazy:(id)a3 buildEvent:(id)a4
{
  v4 = _Block_copy(a4);
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v4;
  sub_10002C868(v5, v7, (uint64_t)sub_10002C1D0, v8);
  swift_bridgeObjectRelease();

  swift_release();
}

- (_TtC17StoreKitUIService21objc_AnalyticsManager)init
{
  return (_TtC17StoreKitUIService21objc_AnalyticsManager *)sub_10002C90C();
}

@end