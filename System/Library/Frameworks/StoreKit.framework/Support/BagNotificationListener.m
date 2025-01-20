@interface BagNotificationListener
- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D23BagNotificationListener)init;
- (void)bagChanged:(id)a3;
- (void)dealloc;
@end

@implementation BagNotificationListener

- (void)dealloc
{
  v2 = self;
  sub_10017D8CC();
}

- (void).cxx_destruct
{
  v2 = (char *)self
     + OBJC_IVAR____TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D23BagNotificationListener_continuation;
  uint64_t v3 = sub_10001E6FC(&qword_10039DA50);
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

- (void)bagChanged:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_10017DA7C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D23BagNotificationListener)init
{
}

@end