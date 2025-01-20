@interface TirePressureAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC12TirePressure23TirePressureAppDelegate)init;
@end

@implementation TirePressureAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_1000108A8();
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  CAFSignpostEmit_Launched();

  swift_bridgeObjectRelease();
  return 1;
}

- (_TtC12TirePressure23TirePressureAppDelegate)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC12TirePressure23TirePressureAppDelegate____lazy_storage___carManager) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC12TirePressure23TirePressureAppDelegate____lazy_storage___assetManager) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TirePressureAppDelegate();
  return [(TirePressureAppDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12TirePressure23TirePressureAppDelegate____lazy_storage___carManager));

  swift_release();
}

@end