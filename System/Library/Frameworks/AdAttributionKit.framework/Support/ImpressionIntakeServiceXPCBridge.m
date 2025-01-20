@interface ImpressionIntakeServiceXPCBridge
- (_TtC20AttributionKitDaemon32ImpressionIntakeServiceXPCBridge)init;
- (void)processReengagementWithAdvertisedItemID:(unint64_t)a3 intakeRequestData:(id)a4 reengagementURL:(id)a5 reply:(id)a6;
- (void)recordImpressionWithAdvertisedItemID:(unint64_t)a3 intakeRequestData:(id)a4 reply:(id)a5;
@end

@implementation ImpressionIntakeServiceXPCBridge

- (void)recordImpressionWithAdvertisedItemID:(unint64_t)a3 intakeRequestData:(id)a4 reply:(id)a5
{
  uint64_t v9 = sub_100012960(&qword_1001E0EC0);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  id v13 = a4;
  v14 = self;
  uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v17 = v16;

  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v12;
  uint64_t v19 = (uint64_t)v14 + OBJC_IVAR____TtC20AttributionKitDaemon32ImpressionIntakeServiceXPCBridge_service;
  uint64_t v20 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v11, 1, 1, v20);
  v21 = (void *)swift_allocObject();
  v21[2] = a3;
  v21[3] = v15;
  v21[4] = v17;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = &unk_1001E2388;
  *(void *)(v22 + 24) = v21;
  swift_retain();
  sub_10003CF30(v15, v17);
  swift_retain();
  sub_10014135C((uint64_t)"Record Impression", 17, 2, (void (*)(void))sub_10006C590, v18, v19, (uint64_t)v11, (uint64_t)&unk_1001E2398, v22);
  swift_release();
  swift_release();
  swift_release();
  sub_100019960((uint64_t)v11, &qword_1001E0EC0);
  swift_release();
  sub_100020930(v15, v17);
}

- (void)processReengagementWithAdvertisedItemID:(unint64_t)a3 intakeRequestData:(id)a4 reengagementURL:(id)a5 reply:(id)a6
{
  unint64_t v33 = a3;
  uint64_t v10 = sub_100012960(&qword_1001E0EC0);
  __chkstk_darwin(v10 - 8);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100012960(&qword_1001E1170);
  uint64_t v32 = *(void *)(v13 - 8);
  uint64_t v14 = *(void *)(v32 + 64);
  uint64_t v15 = __chkstk_darwin(v13 - 8);
  unint64_t v16 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v32 - v17;
  uint64_t v19 = _Block_copy(a6);
  id v20 = a4;
  v21 = self;
  id v22 = a5;
  uint64_t v23 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v25 = v24;

  if (v22)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v26 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v18, 0, 1, v26);
  }
  else
  {
    uint64_t v27 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v18, 1, 1, v27);
  }
  uint64_t v28 = (uint64_t)v21 + OBJC_IVAR____TtC20AttributionKitDaemon32ImpressionIntakeServiceXPCBridge_service;
  uint64_t v29 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v12, 1, 1, v29);
  sub_1000207C4((uint64_t)v18, (uint64_t)v16);
  unint64_t v30 = (*(unsigned __int8 *)(v32 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
  v31 = (void *)swift_allocObject();
  v31[2] = v33;
  v31[3] = v23;
  v31[4] = v25;
  sub_10004DA50((uint64_t)v16, (uint64_t)v31 + v30);
  _Block_copy(v19);
  sub_10003CF30(v23, v25);
  sub_1000C1BD4((uint8_t *)"Process Reengagement", (uint8_t *)0x14, 2, v28, (uint64_t)v12, (uint64_t)&unk_1001E2378, (uint64_t)v31, v21, (void (**)(void, void))v19);
  _Block_release(v19);
  swift_release();
  sub_100019960((uint64_t)v12, &qword_1001E0EC0);
  _Block_release(v19);
  sub_100020930(v23, v25);

  sub_100019960((uint64_t)v18, &qword_1001E1170);
}

- (_TtC20AttributionKitDaemon32ImpressionIntakeServiceXPCBridge)init
{
  result = (_TtC20AttributionKitDaemon32ImpressionIntakeServiceXPCBridge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end