@interface DashboardViewModel
- (void)checLoadingStateWithNotification:(id)a3;
- (void)reloadDataWithNotification:(id)a3;
@end

@implementation DashboardViewModel

- (void)reloadDataWithNotification:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  sub_1001F96D8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)checLoadingStateWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = *(void *)(*(void *)&self->metrics[7] + 16);
  swift_retain();
  sub_1001FA330(v8, 0);
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end