@interface ParsecSubscriptionManager
- (_TtC7parsecd25ParsecSubscriptionManager)init;
- (void)bagChangeNotificationWithNotification:(id)a3;
- (void)dealloc;
@end

@implementation ParsecSubscriptionManager

- (void)dealloc
{
  v2 = self;
  sub_100039138();
}

- (void).cxx_destruct
{
  swift_release();
  sub_10001CDE0((uint64_t)self + OBJC_IVAR____TtC7parsecd25ParsecSubscriptionManager_assembly);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7parsecd25ParsecSubscriptionManager_storefrontIdentifierProvider));

  swift_release();
}

- (void)bagChangeNotificationWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10003924C(v4);
}

- (_TtC7parsecd25ParsecSubscriptionManager)init
{
}

@end