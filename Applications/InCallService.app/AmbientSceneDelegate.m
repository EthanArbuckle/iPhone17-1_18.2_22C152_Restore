@interface AmbientSceneDelegate
- (UIWindow)window;
- (_TtC13InCallService20AmbientSceneDelegate)init;
- (id)sceneDidDisconnectBlock;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setSceneDidDisconnectBlock:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation AmbientSceneDelegate

- (UIWindow)window
{
  v2 = sub_10019B56C();

  return (UIWindow *)v2;
}

- (void)setWindow:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10019B5F8((uint64_t)a3);
}

- (id)sceneDidDisconnectBlock
{
  uint64_t v2 = sub_10019B6B4();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_10012EDF4;
    v6[3] = &unk_1002D4128;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSceneDidDisconnectBlock:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_10011F72C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_10019B79C((uint64_t)v4, v5);
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10019B7BC(v8);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10019BED8();
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10019C0A4((uint64_t)v5, 1);
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10019C0A4((uint64_t)v5, 0);
}

- (_TtC13InCallService20AmbientSceneDelegate)init
{
  return (_TtC13InCallService20AmbientSceneDelegate *)sub_10019C1B8();
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC13InCallService20AmbientSceneDelegate_sceneDidDisconnectBlock);

  sub_100142E2C(v3);
}

@end