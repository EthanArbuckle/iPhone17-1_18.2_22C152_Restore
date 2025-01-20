@interface ActivityRemoteSubscriptionPreferencesListener
- (_TtC11ActivityKit45ActivityRemoteSubscriptionPreferencesListener)init;
@end

@implementation ActivityRemoteSubscriptionPreferencesListener

- (_TtC11ActivityKit45ActivityRemoteSubscriptionPreferencesListener)init
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for SubscriptionPreferencesObservationClient());
  v4 = self;
  v5 = (objc_class *)objc_msgSend(v3, sel_init);
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC11ActivityKit45ActivityRemoteSubscriptionPreferencesListener_client) = v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for ActivityRemoteSubscriptionPreferencesListener();
  return [(ActivityRemoteSubscriptionPreferencesListener *)&v7 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11ActivityKit45ActivityRemoteSubscriptionPreferencesListener_client));
}

@end