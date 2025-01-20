@interface SceneDelegate
- (UIWindow)window;
- (_TtC24AMSEngagementViewService13SceneDelegate)init;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation SceneDelegate

- (UIWindow)window
{
  v2 = sub_10000EB78();

  return (UIWindow *)v2;
}

- (void)setWindow:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10000EC04((uint64_t)a3);
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10000EC18((int)v8, (int)v11, v10);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  sub_1000079A8(0, &qword_10001E9B8);
  sub_1000118A0(&qword_10001E9C0, &qword_10001E9B8);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_10000EFB0((uint64_t)v8, v6);

  swift_bridgeObjectRelease();
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10000F404((uint64_t)v8, v7);
}

- (_TtC24AMSEngagementViewService13SceneDelegate)init
{
  return (_TtC24AMSEngagementViewService13SceneDelegate *)sub_100011640();
}

- (void).cxx_destruct
{
}

@end