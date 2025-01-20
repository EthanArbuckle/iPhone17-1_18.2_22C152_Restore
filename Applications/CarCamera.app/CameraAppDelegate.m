@interface CameraAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC9CarCamera17CameraAppDelegate)init;
@end

@implementation CameraAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_10000CD8C();
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  CAFSignpostEmit_Launched();
  v8 = (void *)qword_1000419E0;
  qword_1000419E0 = (uint64_t)self;

  swift_bridgeObjectRelease();
  return 1;
}

- (_TtC9CarCamera17CameraAppDelegate)init
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC9CarCamera17CameraAppDelegate_layoutConfig) = 2;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CameraAppDelegate();
  return [(CameraAppDelegate *)&v3 init];
}

@end