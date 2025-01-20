@interface ActivityPushTokenClient
- (_TtC11ActivityKit23ActivityPushTokenClient)init;
- (void)pushTokensChanged:(id)a3;
@end

@implementation ActivityPushTokenClient

- (_TtC11ActivityKit23ActivityPushTokenClient)init
{
  return (_TtC11ActivityKit23ActivityPushTokenClient *)sub_242F75594();
}

- (void)pushTokensChanged:(id)a3
{
  uint64_t v4 = sub_242FDC020();
  v5 = self;
  sub_242F76E80(v4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11ActivityKit23ActivityPushTokenClient_queue);
}

@end