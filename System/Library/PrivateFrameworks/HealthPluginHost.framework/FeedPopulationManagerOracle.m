@interface FeedPopulationManagerOracle
- (void)debuggingInfoRequestedWithNote:(id)a3;
- (void)storeDidUpdateWithNote:(id)a3;
@end

@implementation FeedPopulationManagerOracle

- (void)storeDidUpdateWithNote:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  sub_10002AB98();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)debuggingInfoRequestedWithNote:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  sub_10002B0E8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end