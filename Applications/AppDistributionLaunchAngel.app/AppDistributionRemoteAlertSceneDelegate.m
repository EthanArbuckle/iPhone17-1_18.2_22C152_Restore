@interface AppDistributionRemoteAlertSceneDelegate
- (UIWindow)window;
- (_TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation AppDistributionRemoteAlertSceneDelegate

- (UIWindow)window
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v4 = (id *)((char *)&v3->super.isa
            + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window);
  swift_beginAccess();
  id v5 = *v4;
  swift_release();

  swift_release();

  return (UIWindow *)v5;
}

- (void)setWindow:(id)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v7 = (void **)((char *)&v6->super.isa
               + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window);
  swift_beginAccess();
  v8 = *v7;
  *v7 = v5;
  swift_release();

  swift_release();
}

- (_TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate)init
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v2 = (_TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate *)sub_100012438();
  swift_release();
  return v2;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  sub_100017338(v9);
  swift_release();
}

- (void)sceneDidBecomeActive:(id)a3
{
}

- (void)sceneWillResignActive:(id)a3
{
}

- (void)sceneWillEnterForeground:(id)a3
{
}

- (void)sceneDidEnterBackground:(id)a3
{
}

- (void)sceneDidDisconnect:(id)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  sub_100017ED4();
  swift_release();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_bag));

  swift_release();
}

@end