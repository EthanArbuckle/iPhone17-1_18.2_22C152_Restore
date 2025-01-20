@interface CoreTelephonyCAAgent
- (_TtC8SOSBuddy20CoreTelephonyCAAgent)init;
- (void)activeSubscriptionsDidChange;
- (void)connectionAssistantStateChanged:(id)a3;
- (void)dealloc;
- (void)displayStatusChanged:(id)a3 status:(id)a4;
@end

@implementation CoreTelephonyCAAgent

- (void)dealloc
{
  v2 = self;
  sub_10001A240();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

- (_TtC8SOSBuddy20CoreTelephonyCAAgent)init
{
  result = (_TtC8SOSBuddy20CoreTelephonyCAAgent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)connectionAssistantStateChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001BCC0(v4);
}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_10001C220(a3, a4);
}

- (void)activeSubscriptionsDidChange
{
  v2 = self;
  sub_10001E1F8();
}

@end