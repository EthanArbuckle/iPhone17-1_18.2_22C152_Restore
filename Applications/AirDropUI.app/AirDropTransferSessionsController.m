@interface AirDropTransferSessionsController
- (_TtC9AirDropUI33AirDropTransferSessionsController)init;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)registerForPermissionRequests:(id)a3;
- (void)transferEndedForIdentifier:(id)a3;
- (void)transferStartedForIdentifier:(id)a3 isFromMe:(id)a4 withTransferState:(id)a5 itemCount:(id)a6 senderName:(id)a7 localizedTransferDescription:(id)a8 previewImageData:(id)a9 previewImageIsSensitive:(id)a10;
- (void)transferUpdatedForIdentifier:(id)a3 withTransferState:(id)a4 transferAccepted:(id)a5 completedUnitCount:(id)a6 totalUnitCount:(id)a7 localizedTransferDescription:(id)a8 actionsData:(id)a9 completedURLsData:(id)a10;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation AirDropTransferSessionsController

- (_TtC9AirDropUI33AirDropTransferSessionsController)init
{
  return (_TtC9AirDropUI33AirDropTransferSessionsController *)sub_100032398();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9AirDropUI33AirDropTransferSessionsController_connection));
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9AirDropUI33AirDropTransferSessionsController_nearbySharingInteractionCoordinator));
  v3 = (char *)self + OBJC_IVAR____TtC9AirDropUI33AirDropTransferSessionsController__airDropSessionsByID;
  uint64_t v4 = sub_10000AA4C(&qword_1001815E0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9AirDropUI33AirDropTransferSessionsController__bannerAirDropSession;
  uint64_t v6 = sub_10000AA4C(&qword_1001815D8);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9AirDropUI33AirDropTransferSessionsController_userNotificationsCenter));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9AirDropUI33AirDropTransferSessionsController_contactIconProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9AirDropUI33AirDropTransferSessionsController_appCornerIconProvider));

  swift_bridgeObjectRelease();
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_10004D330(v8);

  swift_unknownObjectRelease();
}

- (void)registerForPermissionRequests:(id)a3
{
  uint64_t v5 = sub_10000AA4C(&qword_1001829C0);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100181580;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100181590;
  v12[5] = v11;
  v13 = self;
  sub_100047B78((uint64_t)v7, (uint64_t)&unk_1001815A0, (uint64_t)v12);
  swift_release();
}

- (void)transferStartedForIdentifier:(id)a3 isFromMe:(id)a4 withTransferState:(id)a5 itemCount:(id)a6 senderName:(id)a7 localizedTransferDescription:(id)a8 previewImageData:(id)a9 previewImageIsSensitive:(id)a10
{
  uint64_t v16 = (uint64_t)a9;
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v32 = v18;
  if (a7)
  {
    a7 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v31 = v19;
    if (a8)
    {
LABEL_3:
      uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      a8 = v20;
      goto LABEL_6;
    }
  }
  else
  {
    unint64_t v31 = 0;
    if (a8) {
      goto LABEL_3;
    }
  }
  uint64_t v30 = 0;
LABEL_6:
  id v29 = a4;
  id v28 = a5;
  id v27 = a6;
  id v21 = a10;
  v26 = self;
  if (a9)
  {
    id v22 = a7;
    id v23 = a9;
    uint64_t v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v25 = v24;

    a7 = v22;
  }
  else
  {
    unint64_t v25 = 0xF000000000000000;
  }
  sub_10003CA40(v17, v32, v29, v28, v27, (uint64_t)a7, v31, v30, (uint64_t)a8, v16, v25, v21);
  sub_10001EBC4(v16, v25);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)transferUpdatedForIdentifier:(id)a3 withTransferState:(id)a4 transferAccepted:(id)a5 completedUnitCount:(id)a6 totalUnitCount:(id)a7 localizedTransferDescription:(id)a8 actionsData:(id)a9 completedURLsData:(id)a10
{
  v33 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v35 = v16;
  if (a8)
  {
    uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v34 = v17;
  }
  else
  {
    uint64_t v31 = 0;
    unint64_t v34 = 0;
  }
  id v32 = a4;
  id v18 = a5;
  id v19 = a6;
  id v30 = a7;
  id v29 = self;
  id v20 = a10;
  id v21 = v20;
  if (a9)
  {
    id v22 = a9;
    uint64_t v23 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v25 = v24;

    if (v21)
    {
LABEL_6:
      uint64_t v26 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v28 = v27;

      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v23 = 0;
    unint64_t v25 = 0xF000000000000000;
    if (v20) {
      goto LABEL_6;
    }
  }
  uint64_t v26 = 0;
  unint64_t v28 = 0xF000000000000000;
LABEL_9:
  sub_1000433FC(v33, v35, v32, v18, v19, v30, v31, v34, v23, v25, v26, v28);
  sub_10001EBC4(v26, v28);
  sub_10001EBC4(v23, v25);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)transferEndedForIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v6 = v5;
  id v7 = self;
  sub_100039D3C(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_10004F360(v10, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

@end