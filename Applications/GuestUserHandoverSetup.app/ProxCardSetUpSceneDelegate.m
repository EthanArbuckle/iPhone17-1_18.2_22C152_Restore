@interface ProxCardSetUpSceneDelegate
- (UIWindow)window;
- (_TtC22GuestUserHandoverSetup26ProxCardSetUpSceneDelegate)init;
- (void)remoteAlertSceneDidUpdateActivationContext:(id)a3;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation ProxCardSetUpSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC22GuestUserHandoverSetup26ProxCardSetUpSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC22GuestUserHandoverSetup26ProxCardSetUpSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC22GuestUserHandoverSetup26ProxCardSetUpSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10001D44C(v8);
}

- (_TtC22GuestUserHandoverSetup26ProxCardSetUpSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC22GuestUserHandoverSetup26ProxCardSetUpSceneDelegate_window) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC22GuestUserHandoverSetup26ProxCardSetUpSceneDelegate_rootViewController) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProxCardSetUpSceneDelegate();
  return [(ProxCardSetUpSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22GuestUserHandoverSetup26ProxCardSetUpSceneDelegate_window));
  objc_super v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC22GuestUserHandoverSetup26ProxCardSetUpSceneDelegate_rootViewController);
}

- (void)remoteAlertSceneDidUpdateActivationContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001C1D4(v4);
}

@end