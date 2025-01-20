@interface PurchaseHistoryAppStateDataSource
- (void)purchaseHistoryUpdated:(id)a3;
@end

@implementation PurchaseHistoryAppStateDataSource

- (void)purchaseHistoryUpdated:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  sub_1001273F4((uint64_t)v6, (uint64_t)sub_10012A89C, (uint64_t)&unk_10018A478);
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end