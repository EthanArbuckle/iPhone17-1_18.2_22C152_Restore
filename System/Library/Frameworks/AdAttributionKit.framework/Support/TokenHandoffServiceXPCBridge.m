@interface TokenHandoffServiceXPCBridge
- (_TtC20AttributionKitDaemon28TokenHandoffServiceXPCBridge)init;
- (void)handoffPODTokenWithAdvertisedItemID:(unint64_t)a3 tokenData:(id)a4 reply:(id)a5;
- (void)handoffTokenWithAdvertisedItemID:(unint64_t)a3 tokenData:(id)a4 requestData:(id)a5 reply:(id)a6;
- (void)handoffUTMetricsWithAdvertisedItemID:(unint64_t)a3 eventsData:(id)a4 reply:(id)a5;
- (void)processInAppPurchaseWithAppItemID:(unint64_t)a3 requestData:(id)a4 reply:(id)a5;
@end

@implementation TokenHandoffServiceXPCBridge

- (void)handoffTokenWithAdvertisedItemID:(unint64_t)a3 tokenData:(id)a4 requestData:(id)a5 reply:(id)a6
{
  uint64_t v11 = sub_100012960(&qword_1001E0EC0);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  id v15 = a4;
  id v16 = a5;
  v17 = self;
  uint64_t v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v20 = v19;

  uint64_t v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v23 = v22;

  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v14;
  uint64_t v25 = (uint64_t)v17 + OBJC_IVAR____TtC20AttributionKitDaemon28TokenHandoffServiceXPCBridge_service;
  uint64_t v26 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v13, 1, 1, v26);
  v27 = (void *)swift_allocObject();
  v27[2] = a3;
  v27[3] = v18;
  v27[4] = v20;
  v27[5] = v21;
  v27[6] = v23;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = &unk_1001E3330;
  *(void *)(v28 + 24) = v27;
  swift_retain();
  sub_10003CF30(v18, v20);
  sub_10003CF30(v21, v23);
  swift_retain();
  sub_100141FF8((uint64_t)"Handoff Token", 13, 2, (void (*)(void))sub_10006EC80, v24, v25, (uint64_t)v13, (uint64_t)&unk_1001E3338, v28);
  swift_release();
  swift_release();
  swift_release();
  sub_10006E9CC((uint64_t)v13);
  swift_release();
  sub_100020930(v21, v23);
  sub_100020930(v18, v20);
}

- (void)handoffUTMetricsWithAdvertisedItemID:(unint64_t)a3 eventsData:(id)a4 reply:(id)a5
{
  uint64_t v9 = sub_100012960(&qword_1001E0EC0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  id v13 = a4;
  v14 = self;
  uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v17 = v16;

  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v12;
  uint64_t v19 = (uint64_t)v14 + OBJC_IVAR____TtC20AttributionKitDaemon28TokenHandoffServiceXPCBridge_service;
  uint64_t v20 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v11, 1, 1, v20);
  uint64_t v21 = (void *)swift_allocObject();
  v21[2] = a3;
  v21[3] = v15;
  v21[4] = v17;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = &unk_1001E3318;
  *(void *)(v22 + 24) = v21;
  swift_retain();
  sub_10003CF30(v15, v17);
  swift_retain();
  sub_100141FF8((uint64_t)"Handoff UT Metrics", 18, 2, (void (*)(void))sub_10006EC80, v18, v19, (uint64_t)v11, (uint64_t)&unk_1001E3320, v22);
  swift_release();
  swift_release();
  swift_release();
  sub_10006E9CC((uint64_t)v11);
  swift_release();
  sub_100020930(v15, v17);
}

- (void)handoffPODTokenWithAdvertisedItemID:(unint64_t)a3 tokenData:(id)a4 reply:(id)a5
{
  uint64_t v9 = sub_100012960(&qword_1001E0EC0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  id v13 = a4;
  v14 = self;
  uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v17 = v16;

  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v12;
  uint64_t v19 = (uint64_t)v14 + OBJC_IVAR____TtC20AttributionKitDaemon28TokenHandoffServiceXPCBridge_service;
  uint64_t v20 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v11, 1, 1, v20);
  uint64_t v21 = (void *)swift_allocObject();
  v21[2] = a3;
  v21[3] = v15;
  v21[4] = v17;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = &unk_1001E3300;
  *(void *)(v22 + 24) = v21;
  swift_retain();
  sub_10003CF30(v15, v17);
  swift_retain();
  sub_100141FF8((uint64_t)"Handoff Token", 13, 2, (void (*)(void))sub_10006EC80, v18, v19, (uint64_t)v11, (uint64_t)&unk_1001E3308, v22);
  swift_release();
  swift_release();
  swift_release();
  sub_10006E9CC((uint64_t)v11);
  swift_release();
  sub_100020930(v15, v17);
}

- (void)processInAppPurchaseWithAppItemID:(unint64_t)a3 requestData:(id)a4 reply:(id)a5
{
  uint64_t v9 = sub_100012960(&qword_1001E0EC0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  id v13 = a4;
  v14 = self;
  uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v17 = v16;

  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v12;
  uint64_t v19 = (uint64_t)v14 + OBJC_IVAR____TtC20AttributionKitDaemon28TokenHandoffServiceXPCBridge_service;
  uint64_t v20 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v11, 1, 1, v20);
  uint64_t v21 = (void *)swift_allocObject();
  v21[2] = a3;
  v21[3] = v15;
  v21[4] = v17;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = &unk_1001E32E0;
  *(void *)(v22 + 24) = v21;
  swift_retain();
  sub_10003CF30(v15, v17);
  swift_retain();
  sub_100141FF8((uint64_t)"Process In-App Purchase", 23, 2, (void (*)(void))sub_10006C590, v18, v19, (uint64_t)v11, (uint64_t)&unk_1001E32F0, v22);
  swift_release();
  swift_release();
  swift_release();
  sub_10006E9CC((uint64_t)v11);
  swift_release();
  sub_100020930(v15, v17);
}

- (_TtC20AttributionKitDaemon28TokenHandoffServiceXPCBridge)init
{
  result = (_TtC20AttributionKitDaemon28TokenHandoffServiceXPCBridge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end