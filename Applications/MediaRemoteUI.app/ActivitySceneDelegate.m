@interface ActivitySceneDelegate
- (BOOL)lockscreenViewController:(id)a3 didSelectArtworkView:(id)a4;
- (_TtC13MediaRemoteUI21ActivitySceneDelegate)init;
- (void)lockscreenViewController:(id)a3 didUpdatePreferredContentSize:(CGSize)a4;
- (void)lockscreenViewController:(id)a3 didUpdateRestrictedRects:(id)a4;
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
  sub_1000178CC(v8);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000160C4(v4);
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000164B4(v4);
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001654C(v4);
}

- (_TtC13MediaRemoteUI21ActivitySceneDelegate)init
{
  return (_TtC13MediaRemoteUI21ActivitySceneDelegate *)sub_10001704C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_routeRecommendationWindow));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingBannerWindow));
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

- (BOOL)lockscreenViewController:(id)a3 didSelectArtworkView:(id)a4
{
  uint64_t v6 = qword_10005C1C0;
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  if (v6 != -1) {
    swift_once();
  }
  char v10 = sub_10002A384();

  return v10 & 1;
}

- (void)lockscreenViewController:(id)a3 didUpdatePreferredContentSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = self;
  sub_100017328(v7, width, height);
}

- (void)lockscreenViewController:(id)a3 didUpdateRestrictedRects:(id)a4
{
  sub_100008C38(0, &qword_10005D230);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_100017500(v7, v6);

  swift_bridgeObjectRelease();
}

@end