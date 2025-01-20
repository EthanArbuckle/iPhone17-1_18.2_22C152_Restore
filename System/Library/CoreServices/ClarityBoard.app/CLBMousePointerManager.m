@interface CLBMousePointerManager
- (CLBMousePointerManager)init;
- (void)dealloc;
- (void)mousePointerDevicesDidChange:(id)a3;
- (void)pointerClientController:(id)a3 didAddScene:(id)a4;
- (void)pointerClientController:(id)a3 sceneDidActivate:(id)a4;
- (void)pointerClientController:(id)a3 sceneWillDeactivate:(id)a4;
- (void)pointerClientController:(id)a3 willRemoveScene:(id)a4;
@end

@implementation CLBMousePointerManager

- (CLBMousePointerManager)init
{
  return (CLBMousePointerManager *)sub_100054364();
}

- (void)dealloc
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLBMousePointerManager_mousePointerDeviceObserverToken);
  v4 = self;
  if (v3) {
    [v3 invalidate];
  }
  [*(id *)((char *)&self->super.isa + OBJC_IVAR___CLBMousePointerManager_pointerClientController) invalidate];
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MousePointerManager();
  [(CLBMousePointerManager *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (void)mousePointerDevicesDidChange:(id)a3
{
  sub_100056CF8();
  sub_100056E64(&qword_10017D118, (void (*)(uint64_t))sub_100056CF8);
  uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  objc_super v5 = self;
  sub_100055514(v4);
  swift_bridgeObjectRelease();
}

- (void)pointerClientController:(id)a3 didAddScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100056614(v7, "Did add pointer scene: %@");
}

- (void)pointerClientController:(id)a3 willRemoveScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100056614(v7, "Will remove pointer scene: %@");
}

- (void)pointerClientController:(id)a3 sceneDidActivate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100056828(v7, "Did activate pointer scene: %@", (uint64_t)&unk_10015EDE8, (uint64_t)&unk_10017D108);
}

- (void)pointerClientController:(id)a3 sceneWillDeactivate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100056828(v7, "Will deactivate pointer scene: %@", (uint64_t)&unk_10015EDC0, (uint64_t)&unk_10017D0F8);
}

@end