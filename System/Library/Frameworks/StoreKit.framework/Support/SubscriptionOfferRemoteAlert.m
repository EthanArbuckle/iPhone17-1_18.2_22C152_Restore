@interface SubscriptionOfferRemoteAlert
- (_TtC9storekitd28SubscriptionOfferRemoteAlert)init;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
@end

@implementation SubscriptionOfferRemoteAlert

- (_TtC9storekitd28SubscriptionOfferRemoteAlert)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100016F0C((uint64_t)self + OBJC_IVAR____TtC9storekitd28SubscriptionOfferRemoteAlert_logger, (void (*)(void))type metadata accessor for SKLogger);

  swift_release();
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10013C57C();
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10013C830(v4);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_10013CAD4((uint64_t)v8, (uint64_t)a4);
}

@end