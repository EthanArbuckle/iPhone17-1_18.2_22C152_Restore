@interface TestingSceneDelegate
- (UIWindow)window;
- (_TtC7SwiftUI20TestingSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation TestingSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC7SwiftUI20TestingSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI20TestingSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI20TestingSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  specialized TestingSceneDelegate.scene(_:willConnectTo:options:)(v8);
}

- (_TtC7SwiftUI20TestingSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI20TestingSceneDelegate_window) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI20TestingSceneDelegate_comparisonWindow) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TestingSceneDelegate();
  return [(TestingSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_super v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI20TestingSceneDelegate_comparisonWindow);
}

@end