@interface ScreenSharingBroadcasterSceneDelegate
- (UIWindow)window;
- (_TtC13InCallService37ScreenSharingBroadcasterSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation ScreenSharingBroadcasterSceneDelegate

- (UIWindow)window
{
  v2 = sub_10018A830();

  return (UIWindow *)v2;
}

- (void)setWindow:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10018A8BC((uint64_t)a3);
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10018A8D4(v8);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10018AFD4();
}

- (_TtC13InCallService37ScreenSharingBroadcasterSceneDelegate)init
{
  return (_TtC13InCallService37ScreenSharingBroadcasterSceneDelegate *)sub_10018B0F8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC13InCallService37ScreenSharingBroadcasterSceneDelegate_window));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC13InCallService37ScreenSharingBroadcasterSceneDelegate_cloneTerminatingWindow);
}

@end