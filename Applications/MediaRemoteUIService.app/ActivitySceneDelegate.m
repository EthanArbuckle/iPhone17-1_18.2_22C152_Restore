@interface ActivitySceneDelegate
- (_TtC20MediaRemoteUIService21ActivitySceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
@end

@implementation ActivitySceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100006F30(v8);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100005920(v4);
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100005AB8(v4);
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100005CE4(v4);
}

- (_TtC20MediaRemoteUIService21ActivitySceneDelegate)init
{
  return (_TtC20MediaRemoteUIService21ActivitySceneDelegate *)sub_100005F10();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionLowPowerWindow));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionNearbyViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionNearbyWindow));
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationWindow);
}

@end