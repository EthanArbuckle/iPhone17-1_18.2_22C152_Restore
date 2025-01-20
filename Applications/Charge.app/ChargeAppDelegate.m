@interface ChargeAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC6Charge17ChargeAppDelegate)init;
@end

@implementation ChargeAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_100005694(&qword_10002A930, type metadata accessor for LaunchOptionsKey);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  CAFSignpostEmit_Launched();

  swift_bridgeObjectRelease();
  return 1;
}

- (_TtC6Charge17ChargeAppDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ChargeAppDelegate();
  return [(ChargeAppDelegate *)&v3 init];
}

@end