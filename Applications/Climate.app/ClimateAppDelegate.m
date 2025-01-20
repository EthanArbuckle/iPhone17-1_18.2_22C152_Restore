@interface ClimateAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC7Climate18ClimateAppDelegate)init;
@end

@implementation ClimateAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_10008ECE4();
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  CAFSignpostEmit_Launched();

  swift_bridgeObjectRelease();
  return 1;
}

- (_TtC7Climate18ClimateAppDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Climate18ClimateAppDelegate____lazy_storage___coordinator) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClimateAppDelegate();
  return [(ClimateAppDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Climate18ClimateAppDelegate____lazy_storage___coordinator));
}

@end