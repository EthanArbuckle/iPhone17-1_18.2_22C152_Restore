@interface AmbientCompactSceneDelegate
- (UIWindow)window;
- (_TtC13InCallService27AmbientCompactSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation AmbientCompactSceneDelegate

- (UIWindow)window
{
  v2 = sub_1001BE61C();

  return (UIWindow *)v2;
}

- (void)setWindow:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1001BE6A8((uint64_t)a3);
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1001BE6BC(v8);
}

- (_TtC13InCallService27AmbientCompactSceneDelegate)init
{
  return (_TtC13InCallService27AmbientCompactSceneDelegate *)sub_1001BE9D4();
}

- (void).cxx_destruct
{
}

@end