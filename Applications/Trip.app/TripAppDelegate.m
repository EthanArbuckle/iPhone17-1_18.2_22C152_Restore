@interface TripAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC4Trip15TripAppDelegate)init;
@end

@implementation TripAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_100014C74();
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  CAFSignpostEmit_Launched();

  swift_bridgeObjectRelease();
  return 1;
}

- (_TtC4Trip15TripAppDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TripAppDelegate();
  return [(TripAppDelegate *)&v3 init];
}

@end