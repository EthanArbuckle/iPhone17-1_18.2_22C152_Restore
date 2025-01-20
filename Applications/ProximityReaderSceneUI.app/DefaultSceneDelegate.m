@interface DefaultSceneDelegate
- (UIWindow)window;
- (_TtC22ProximityReaderSceneUI20DefaultSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation DefaultSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC22ProximityReaderSceneUI20DefaultSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC22ProximityReaderSceneUI20DefaultSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC22ProximityReaderSceneUI20DefaultSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10000E66C(v8, v9);
}

- (_TtC22ProximityReaderSceneUI20DefaultSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC22ProximityReaderSceneUI20DefaultSceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DefaultSceneDelegate();
  return [(DefaultSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22ProximityReaderSceneUI20DefaultSceneDelegate_window));
}

@end