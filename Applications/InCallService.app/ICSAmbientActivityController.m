@interface ICSAmbientActivityController
- (ICSAmbientActivityController)init;
- (ICSAmbientActivityController)initWithCallCenter:(id)a3 notificationCenter:(id)a4 sceneManager:(id)a5;
- (void)handleCallStatusChanged:(id)a3;
- (void)requestActivityForCall:(id)a3;
@end

@implementation ICSAmbientActivityController

- (ICSAmbientActivityController)initWithCallCenter:(id)a3 notificationCenter:(id)a4 sceneManager:(id)a5
{
  return (ICSAmbientActivityController *)sub_1001926F8(a3, a4, a5);
}

- (void)requestActivityForCall:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_100192A00(v5);
}

- (ICSAmbientActivityController)init
{
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSAmbientActivityController_ambientActivityQueue);
}

- (void)handleCallStatusChanged:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  sub_100194024((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

@end