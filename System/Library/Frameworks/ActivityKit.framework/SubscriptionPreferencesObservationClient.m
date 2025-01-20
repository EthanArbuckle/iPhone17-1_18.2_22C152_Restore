@interface SubscriptionPreferencesObservationClient
- (_TtC11ActivityKit40SubscriptionPreferencesObservationClient)init;
- (void)subscriptionPreferencesDidChange:(id)a3;
@end

@implementation SubscriptionPreferencesObservationClient

- (_TtC11ActivityKit40SubscriptionPreferencesObservationClient)init
{
  return (_TtC11ActivityKit40SubscriptionPreferencesObservationClient *)SubscriptionPreferencesObservationClient.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11ActivityKit40SubscriptionPreferencesObservationClient_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11ActivityKit40SubscriptionPreferencesObservationClient_connection));

  swift_release();
}

- (void)subscriptionPreferencesDidChange:(id)a3
{
  id v4 = a3;
  v8 = self;
  uint64_t v5 = sub_242FDBBF0();
  unint64_t v7 = v6;

  SubscriptionPreferencesObservationClient.subscriptionPreferencesDidChange(_:)();
  sub_242F26068(v5, v7);
}

@end