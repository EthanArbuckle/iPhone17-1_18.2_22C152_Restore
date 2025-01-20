@interface LiveActivitySceneDelegate
- (UIWindow)window;
- (_TtC22GuestUserHandoverSetup25LiveActivitySceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation LiveActivitySceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC22GuestUserHandoverSetup25LiveActivitySceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC22GuestUserHandoverSetup25LiveActivitySceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC22GuestUserHandoverSetup25LiveActivitySceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10001BBBC(v8);
}

- (_TtC22GuestUserHandoverSetup25LiveActivitySceneDelegate)init
{
  return (_TtC22GuestUserHandoverSetup25LiveActivitySceneDelegate *)sub_10001B82C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22GuestUserHandoverSetup25LiveActivitySceneDelegate_window));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22GuestUserHandoverSetup25LiveActivitySceneDelegate____lazy_storage___dynamicIslandViewController));
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC22GuestUserHandoverSetup25LiveActivitySceneDelegate____lazy_storage___platterViewController);
}

@end