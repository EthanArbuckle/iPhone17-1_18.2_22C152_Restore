@interface SceneDelegate
- (UIWindow)window;
- (_TtC16AccessorySetupUI13SceneDelegate)init;
- (void)setWindow:(id)a3;
@end

@implementation SceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC16AccessorySetupUI13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16AccessorySetupUI13SceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16AccessorySetupUI13SceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (_TtC16AccessorySetupUI13SceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16AccessorySetupUI13SceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneDelegate();
  return [(SceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
}

@end