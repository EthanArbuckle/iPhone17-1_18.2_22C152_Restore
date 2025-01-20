@interface MetricDetailViewModel
- (void)checLoadingStateWithNotification:(id)a3;
@end

@implementation MetricDetailViewModel

- (void)checLoadingStateWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = *(void *)(*(void *)self->metrics + 16);
  swift_retain();
  sub_1001D1D3C(v8);
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end