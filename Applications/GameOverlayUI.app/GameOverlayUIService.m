@interface GameOverlayUIService
- (_TtC13GameOverlayUI20GameOverlayUIService)init;
- (void)dealloc;
- (void)hideAccessPointWithSceneIdentifier:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)presentActivitySharingRepromptWithRecipientName:(id)a3 sceneIdentifier:(id)a4;
- (void)presentOnboardingFlowWithGameBundleID:(id)a3 sceneIdentifier:(id)a4;
- (void)setUpAccessPointWithLocation:(id)a3 useCase:(id)a4 gameInternal:(id)a5 didReturnToForeground:(id)a6 newToGameCenter:(id)a7 sceneIdentifier:(id)a8;
- (void)showAccessPointWithSceneIdentifier:(id)a3;
- (void)showDashboardWithInitialState:(id)a3 canDismissWithGesture:(id)a4 sceneIdentifier:(id)a5;
- (void)showGameModeBannerWithBundleIdentifier:(id)a3 available:(id)a4 required:(id)a5 enabled:(id)a6 showText:(id)a7;
- (void)showInGameBannerWithData:(id)a3 gameInternal:(id)a4 sceneIdentifier:(id)a5;
- (void)showMultiplayerUI;
- (void)showTurnBasedMultiplayerUI;
- (void)tearDownAccessPointWithSceneIdentifier:(id)a3;
- (void)updateAccessPointWithLocation:(id)a3 gameInternal:(id)a4 sceneIdentifier:(id)a5;
@end

@implementation GameOverlayUIService

- (void)setUpAccessPointWithLocation:(id)a3 useCase:(id)a4 gameInternal:(id)a5 didReturnToForeground:(id)a6 newToGameCenter:(id)a7 sceneIdentifier:(id)a8
{
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v17 = v16;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  v28 = self;
  id v21 = a8;
  uint64_t v22 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v24 = v23;

  if (v21)
  {
    uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v27 = v26;
  }
  else
  {
    uint64_t v25 = 0;
    v27 = 0;
  }
  sub_100067CB4(v29, v14, v15, v17, v22, v24, v19, v20, v25, v27);
  swift_bridgeObjectRelease();
  sub_1000247CC(v22, v24);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)tearDownAccessPointWithSceneIdentifier:(id)a3
{
  uint64_t v5 = sub_100005B18(&qword_100142A60);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a3 = v9;
  }
  else
  {
    uint64_t v8 = 0;
  }
  v10 = self;
  uint64_t v11 = sub_10008E8D4(0, v8, a3);
  if (v12)
  {
    uint64_t v13 = v11;
    uint64_t v14 = v12;
    uint64_t v15 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v7, 1, 1, v15);
    v16 = (void *)swift_allocObject();
    v16[2] = 0;
    v16[3] = 0;
    v16[4] = v13;
    v16[5] = v14;
    sub_10002C340((uint64_t)v7, (uint64_t)&unk_100142328, (uint64_t)v16);

    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
}

- (void)showAccessPointWithSceneIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  uint64_t v8 = sub_10008E8D4(0, v4, v6);
  if (v9)
  {
    sub_100067E34(v8, v9, 0);

    swift_bridgeObjectRelease();
  }
  else
  {
  }

  swift_bridgeObjectRelease();
}

- (void)hideAccessPointWithSceneIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  uint64_t v8 = sub_10008E8D4(0, v4, v6);
  if (v9)
  {
    sub_100067E34(v8, v9, 1);

    swift_bridgeObjectRelease();
  }
  else
  {
  }

  swift_bridgeObjectRelease();
}

- (void)updateAccessPointWithLocation:(id)a3 gameInternal:(id)a4 sceneIdentifier:(id)a5
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  id v11 = a4;
  uint64_t v12 = self;
  id v13 = a5;
  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;

  if (v13)
  {
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v19 = v18;
  }
  else
  {
    uint64_t v17 = 0;
    id v19 = 0;
  }
  sub_10006380C(v8, v10, v14, v16, v17, v19);
  swift_bridgeObjectRelease();
  sub_1000247CC(v14, v16);

  swift_bridgeObjectRelease();
}

- (void)showInGameBannerWithData:(id)a3 gameInternal:(id)a4 sceneIdentifier:(id)a5
{
  id v8 = a3;
  id v20 = self;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v13 = v12;

  if (v9)
  {
    uint64_t v14 = (uint8_t *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v16 = v15;

    if (v10)
    {
LABEL_3:
      uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      id v19 = v18;

      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v14 = 0;
    unint64_t v16 = 0xF000000000000000;
    if (v10) {
      goto LABEL_3;
    }
  }
  uint64_t v17 = 0;
  id v19 = 0;
LABEL_6:
  sub_10006522C(v11, v13, v14, v16, v17, v19);
  swift_bridgeObjectRelease();
  sub_1000247B8((uint64_t)v14, v16);
  sub_1000247CC(v11, v13);
}

- (void)showDashboardWithInitialState:(id)a3 canDismissWithGesture:(id)a4 sceneIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v17 = self;
  id v10 = a5;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v13 = v12;

  if (v10)
  {
    uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v16 = v15;
  }
  else
  {
    uint64_t v14 = 0;
    unint64_t v16 = 0;
  }
  sub_100068088(v11, v13, v9, v14, v16);
  swift_bridgeObjectRelease();
  sub_1000247CC(v11, v13);
}

- (void)showGameModeBannerWithBundleIdentifier:(id)a3 available:(id)a4 required:(id)a5 enabled:(id)a6 showText:(id)a7
{
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = self;
  sub_100068B54(v12, v14, v15, v16, v17);

  swift_bridgeObjectRelease();
}

- (_TtC13GameOverlayUI20GameOverlayUIService)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13GameOverlayUI20GameOverlayUIService_listener) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(GameOverlayUIService *)&v5 init];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v9 = a3;
  id v7 = a4;
  swift_unknownObjectRetain();
  id v8 = self;
  sub_10008ED80(v7);

  swift_unknownObjectRelease();
}

- (void)dealloc
{
  v2 = self;
  sub_10008E7FC();
}

- (void).cxx_destruct
{
}

- (void)presentOnboardingFlowWithGameBundleID:(id)a3 sceneIdentifier:(id)a4
{
}

- (void)presentActivitySharingRepromptWithRecipientName:(id)a3 sceneIdentifier:(id)a4
{
}

- (void)showMultiplayerUI
{
}

- (void)showTurnBasedMultiplayerUI
{
}

@end