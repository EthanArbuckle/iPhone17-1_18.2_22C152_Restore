@interface UIHostingViewBase
- (void)didEndSnapshotSession;
- (void)sceneDidActivate;
- (void)sceneDidEnterBackground;
- (void)sceneWillDeactivate;
- (void)sceneWillEnterForeground;
- (void)willBeginSnapshotSession;
- (void)windowDidMoveToSceneWithNotification:(id)a3;
- (void)windowDidRotateWithNotification:(id)a3;
- (void)windowWillRotateWithNotification:(id)a3;
@end

@implementation UIHostingViewBase

- (void)windowDidRotateWithNotification:(id)a3
{
}

- (void)windowWillRotateWithNotification:(id)a3
{
}

- (void)windowDidMoveToSceneWithNotification:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  UIHostingViewBase.updateSceneNotifications()();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)sceneWillEnterForeground
{
}

- (void)sceneDidEnterBackground
{
}

- (void)sceneWillDeactivate
{
}

- (void)sceneDidActivate
{
}

- (void)willBeginSnapshotSession
{
  self->observedWindow[2] = 1;
}

- (void)didEndSnapshotSession
{
  self->observedWindow[2] = 0;
}

@end