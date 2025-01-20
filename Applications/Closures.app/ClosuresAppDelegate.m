@interface ClosuresAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC8Closures19ClosuresAppDelegate)init;
@end

@implementation ClosuresAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_100004E7C();
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  CAFSignpostEmit_Launched();

  swift_bridgeObjectRelease();
  return 1;
}

- (_TtC8Closures19ClosuresAppDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Closures19ClosuresAppDelegate____lazy_storage___carManager) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8Closures19ClosuresAppDelegate____lazy_storage___assetManager) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClosuresAppDelegate();
  return [(ClosuresAppDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Closures19ClosuresAppDelegate____lazy_storage___carManager));

  swift_release();
}

@end