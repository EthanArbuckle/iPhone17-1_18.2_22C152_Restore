@interface AmbientCompactSceneDelegate
- (UIWindow)window;
- (_TtC13MediaRemoteUI27AmbientCompactSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation AmbientCompactSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC13MediaRemoteUI27AmbientCompactSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI27AmbientCompactSceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI27AmbientCompactSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10000CB6C(v8);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000CDA4();
}

- (void)sceneWillEnterForeground:(id)a3
{
}

- (void)sceneDidEnterBackground:(id)a3
{
}

- (_TtC13MediaRemoteUI27AmbientCompactSceneDelegate)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI27AmbientCompactSceneDelegate_window) = 0;
  uint64_t v2 = OBJC_IVAR____TtC13MediaRemoteUI27AmbientCompactSceneDelegate_dependency;
  uint64_t v3 = qword_10005C188;
  id v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  *(Class *)((char *)&v4->super.isa + v2) = (Class)qword_10005E718;
  swift_retain();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for AmbientCompactSceneDelegate();
  return [(AmbientCompactSceneDelegate *)&v6 init];
}

- (void).cxx_destruct
{
  swift_release();
}

@end