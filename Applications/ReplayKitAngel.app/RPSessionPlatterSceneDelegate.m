@interface RPSessionPlatterSceneDelegate
- (UIWindow)window;
- (_TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation RPSessionPlatterSceneDelegate

- (UIWindow)window
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate_window);
  swift_beginAccess();
  return (UIWindow *)*v2;
}

- (void)setWindow:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate_window);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100028DCC(v8);
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002977C(0xD000000000000018, 0x8000000100037C40);
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000294C4();
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002977C(0xD00000000000001CLL, 0x8000000100037C00);
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002977C(0xD00000000000001BLL, 0x8000000100037BE0);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100029A10();
}

- (_TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate_window) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___systemApertureElementProvider) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___statusBarAssertion) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RPSessionPlatterSceneDelegate();
  return [(RPSessionPlatterSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___systemApertureElementProvider));
  objc_super v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___statusBarAssertion);
}

@end