@interface ClarityUISceneDelegate
- (UIWindow)window;
- (_TtC13InCallService22ClarityUISceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation ClarityUISceneDelegate

- (UIWindow)window
{
  v2 = sub_100144448();

  return (UIWindow *)v2;
}

- (void)setWindow:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1001444D4((uint64_t)a3);
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1001444E8((uint64_t)v8);
}

- (_TtC13InCallService22ClarityUISceneDelegate)init
{
  return (_TtC13InCallService22ClarityUISceneDelegate *)sub_100144CCC();
}

- (void).cxx_destruct
{
}

@end