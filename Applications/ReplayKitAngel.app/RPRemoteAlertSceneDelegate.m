@interface RPRemoteAlertSceneDelegate
- (UIWindow)window;
- (_TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation RPRemoteAlertSceneDelegate

- (UIWindow)window
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate_window);
  swift_beginAccess();
  return (UIWindow *)*v2;
}

- (void)setWindow:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate_window);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10002B2B4(v8);
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002BCF8();
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002C114(0xD000000000000019, 0x8000000100037C20);
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002C114(0xD00000000000001CLL, 0x8000000100037C00);
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002C114(0xD00000000000001BLL, 0x8000000100037BE0);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002C3A8();
}

- (_TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RPRemoteAlertSceneDelegate();
  return [(RPRemoteAlertSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
}

@end