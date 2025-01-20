@interface ShareSheetRemoteSceneSession
- (_TtC16SharingUIService28ShareSheetRemoteSceneSession)init;
- (_UIHostedWindowScene)hostedWindowScene;
- (void)activityContentViewControllerDidUpdateDataSource:(id)a3;
- (void)activityContentViewControllerDidUpdateHeaderMetadata:(id)a3;
- (void)addParticipantsViewController:(id)a3 completedSharingWithShareURL:(id)a4 ckShare:(id)a5;
- (void)addParticipantsViewController:(id)a3 failedToSaveShareWithError:(id)a4;
- (void)dealloc;
@end

@implementation ShareSheetRemoteSceneSession

- (void)dealloc
{
  v2 = self;
  sub_1000050E8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_fbsScene));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_windowScene));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_uiSession));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_rootViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_contentViewController));

  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_activeCloudShareRequest);
}

- (_UIHostedWindowScene)hostedWindowScene
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_windowScene);
  self;
  v3 = (void *)swift_dynamicCastObjCClass();
  if (v3) {
    id v4 = v2;
  }

  return (_UIHostedWindowScene *)v3;
}

- (_TtC16SharingUIService28ShareSheetRemoteSceneSession)init
{
  result = (_TtC16SharingUIService28ShareSheetRemoteSceneSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)activityContentViewControllerDidUpdateDataSource:(id)a3
{
  id v5 = objc_allocWithZone((Class)SHSheetAction);
  id v6 = a3;
  v7 = self;
  id v8 = [v5 initWithType:10];
  v9 = *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_windowScene);
  self;
  id v11 = (id)swift_dynamicCastObjCClass();
  if (v11) {
    id v10 = v9;
  }
  [v11 sendAction:v8];
}

- (void)activityContentViewControllerDidUpdateHeaderMetadata:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100005A54(v4);
}

- (void)addParticipantsViewController:(id)a3 failedToSaveShareWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_100008620();
}

- (void)addParticipantsViewController:(id)a3 completedSharingWithShareURL:(id)a4 ckShare:(id)a5
{
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  id v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a5;
  v14 = self;
  sub_100008994((uint64_t)v11, v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

@end