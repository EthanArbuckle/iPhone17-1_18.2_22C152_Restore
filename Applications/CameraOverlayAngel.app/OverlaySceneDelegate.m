@interface OverlaySceneDelegate
- (_TtC18CameraOverlayAngel20OverlaySceneDelegate)init;
- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4;
- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4;
- (void)cameraViewfinderSessionDidFinishMovieRecording:(id)a3;
- (void)cameraViewfinderSessionDidStartMovieRecording:(id)a3;
- (void)clientConnection:(id)a3 didApplyControlUpdate:(id)a4;
- (void)clientConnection:(id)a3 didChangeStatus:(unint64_t)a4;
- (void)clientConnectionDidChangeControls:(id)a3;
- (void)clientMonitor:(id)a3 didUpdateWithAuditToken:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)serverActivatedConnection:(id)a3;
- (void)systemOverlayViewController:(id)a3 didChangeActiveControl:(id)a4;
- (void)systemOverlayViewController:(id)a3 didChangeSliderVisible:(BOOL)a4;
- (void)systemOverlayViewController:(id)a3 didUpdateControl:(id)a4;
- (void)systemOverlayViewController:(id)a3 menuDidScrollToControlAtIndex:(int64_t)a4;
- (void)systemOverlayViewControllerCancelledHidingSlider:(id)a3;
- (void)systemOverlayViewControllerWillHideSlider:(id)a3;
- (void)touchUpOccuredForIdentifier:(unsigned int)a3 detached:(BOOL)a4 context:(unsigned int)a5 pid:(int)a6;
@end

@implementation OverlaySceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  v8 = (char **)a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100012204(v8);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000CE60(v4);
}

- (void)clientMonitor:(id)a3 didUpdateWithAuditToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100012798(a4);
}

- (void)serverActivatedConnection:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000DB88();
}

- (void)clientConnection:(id)a3 didChangeStatus:(unint64_t)a4
{
  id v5 = a3;
  id v6 = self;
  sub_10000DB88();
}

- (void)clientConnectionDidChangeControls:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10000E4A8();
}

- (void)clientConnection:(id)a3 didApplyControlUpdate:(id)a4
{
}

- (void)systemOverlayViewController:(id)a3 didChangeSliderVisible:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_10000F404(v6, a4);
}

- (void)systemOverlayViewController:(id)a3 didUpdateControl:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10000F5CC(v6, v7);
}

- (void)systemOverlayViewController:(id)a3 menuDidScrollToControlAtIndex:(int64_t)a4
{
  id v5 = a3;
  id v6 = self;
  sub_100012CC8();
}

- (void)systemOverlayViewController:(id)a3 didChangeActiveControl:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100012D40(v7);
}

- (void)systemOverlayViewControllerWillHideSlider:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100012E2C();
}

- (void)systemOverlayViewControllerCancelledHidingSlider:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUIEndTimer;
  id v5 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUIEndTimer);
  id v6 = a3;
  id v7 = self;
  [v5 invalidate];
  id v8 = *(Class *)((char *)&self->super.super.isa + v4);
  *(Class *)((char *)&self->super.super.isa + v4) = 0;
}

- (void)touchUpOccuredForIdentifier:(unsigned int)a3 detached:(BOOL)a4 context:(unsigned int)a5 pid:(int)a6
{
  id v7 = self;
  sub_100013018(a6);
}

- (_TtC18CameraOverlayAngel20OverlaySceneDelegate)init
{
  return (_TtC18CameraOverlayAngel20OverlaySceneDelegate *)sub_100010348();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientMonitor));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_figCameraViewfinder));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_sceneTeardownTimer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientAuditToken));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_lastUsedControl));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate____lazy_storage___focusLockContactRecognizer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUIEndTimer);
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1000132D0(a4, "SceneDelegate: Client %{public}d session began", "SceneDelegate: Ignoring session began for %{public}d");
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1000132D0(a4, "SceneDelegate: Client %{public}d session ended", "SceneDelegate: Ignoring session ended for %{public}d");
}

- (void)cameraViewfinderSessionDidStartMovieRecording:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_100010764(a3, "SceneDelegate: Client %{public}d began recording", 1, "SceneDelegate: Ignoring recording began for %{public}d");
}

- (void)cameraViewfinderSessionDidFinishMovieRecording:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_100010764(a3, "SceneDelegate: Client %{public}d) finished recording", 0, "SceneDelegate: Ignoring recording finished for %{public}d");
}

@end