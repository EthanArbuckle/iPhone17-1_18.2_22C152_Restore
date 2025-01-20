@interface ServiceXPCBridge
- (_TtC20AttributionKitDaemon16ServiceXPCBridge)init;
- (void)endViewWithAdvertisedItemID:(unint64_t)a3 compactJWS:(id)a4 reply:(id)a5;
- (void)handleHeartbeatWithReply:(id)a3;
- (void)preflightImpressionWithAdvertisedItemID:(unint64_t)a3 compactJWS:(id)a4 adNetworkID:(id)a5 reply:(id)a6;
- (void)processTapWithAdvertisedItemID:(unint64_t)a3 compactJWS:(id)a4 eventMessage:(id)a5 reengagementURL:(id)a6 reply:(id)a7;
- (void)startViewWithAdvertisedItemID:(unint64_t)a3 compactJWS:(id)a4 reply:(id)a5;
- (void)updateConversionValue:(id)a3 reply:(id)a4;
@end

@implementation ServiceXPCBridge

- (void)handleHeartbeatWithReply:(id)a3
{
  uint64_t v5 = sub_100012960(&qword_1001E0EC0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  v10 = (char *)self + OBJC_IVAR____TtC20AttributionKitDaemon16ServiceXPCBridge_service;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
  v12 = self;
  sub_100142434((uint64_t)"Heartbeat", 9, 2, (void (*)(void))sub_10006EC80, v9, (uint64_t)v10, (uint64_t)v7, (uint64_t)&unk_1001E43B0, 0);
  sub_100019960((uint64_t)v7, &qword_1001E0EC0);

  swift_release();
}

- (void)updateConversionValue:(id)a3 reply:(id)a4
{
  uint64_t v7 = sub_100012960(&qword_1001E0EC0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  id v11 = a3;
  v12 = self;
  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;

  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v10;
  uint64_t v17 = (uint64_t)v12 + OBJC_IVAR____TtC20AttributionKitDaemon16ServiceXPCBridge_service;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v9, 1, 1, v18);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v13;
  *(void *)(v19 + 24) = v15;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = &unk_1001E43A0;
  *(void *)(v20 + 24) = v19;
  swift_retain();
  sub_10003CF30(v13, v15);
  swift_retain();
  sub_100142434((uint64_t)"Update Postback", 15, 2, (void (*)(void))sub_10006EC80, v16, v17, (uint64_t)v9, (uint64_t)&unk_1001E43A8, v20);
  swift_release();
  swift_release();
  swift_release();
  sub_100019960((uint64_t)v9, &qword_1001E0EC0);
  swift_release();
  sub_100020930(v13, v15);
}

- (void)preflightImpressionWithAdvertisedItemID:(unint64_t)a3 compactJWS:(id)a4 adNetworkID:(id)a5 reply:(id)a6
{
  uint64_t v9 = sub_100012960(&qword_1001E0EC0);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a6);
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v12;
  uint64_t v20 = (char *)self + OBJC_IVAR____TtC20AttributionKitDaemon16ServiceXPCBridge_service;
  uint64_t v21 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v11, 1, 1, v21);
  v22 = (void *)swift_allocObject();
  v22[2] = a3;
  v22[3] = v13;
  v22[4] = v15;
  v22[5] = v16;
  v22[6] = v18;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = &unk_1001E4388;
  *(void *)(v23 + 24) = v22;
  v24 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100142434((uint64_t)"Preflight Impression", 20, 2, (void (*)(void))sub_10006EC80, v19, (uint64_t)v20, (uint64_t)v11, (uint64_t)&unk_1001E4390, v23);
  swift_release();
  swift_release();
  swift_release();
  sub_100019960((uint64_t)v11, &qword_1001E0EC0);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)startViewWithAdvertisedItemID:(unint64_t)a3 compactJWS:(id)a4 reply:(id)a5
{
  uint64_t v8 = sub_100012960(&qword_1001E0EC0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = _Block_copy(a5);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v11;
  uint64_t v16 = (char *)self + OBJC_IVAR____TtC20AttributionKitDaemon16ServiceXPCBridge_service;
  uint64_t v17 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v10, 1, 1, v17);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = a3;
  v18[3] = v12;
  v18[4] = v14;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = &unk_1001E4370;
  *(void *)(v19 + 24) = v18;
  uint64_t v20 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100142434((uint64_t)"Start View", 10, 2, (void (*)(void))sub_10006EC80, v15, (uint64_t)v16, (uint64_t)v10, (uint64_t)&unk_1001E4378, v19);
  swift_release();
  swift_release();
  swift_release();
  sub_100019960((uint64_t)v10, &qword_1001E0EC0);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)endViewWithAdvertisedItemID:(unint64_t)a3 compactJWS:(id)a4 reply:(id)a5
{
  uint64_t v8 = sub_100012960(&qword_1001E0EC0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = _Block_copy(a5);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v11;
  uint64_t v16 = (char *)self + OBJC_IVAR____TtC20AttributionKitDaemon16ServiceXPCBridge_service;
  uint64_t v17 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v10, 1, 1, v17);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = a3;
  v18[3] = v12;
  v18[4] = v14;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = &unk_1001E4358;
  *(void *)(v19 + 24) = v18;
  uint64_t v20 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100142434((uint64_t)"End View", 8, 2, (void (*)(void))sub_10006EC80, v15, (uint64_t)v16, (uint64_t)v10, (uint64_t)&unk_1001E4360, v19);
  swift_release();
  swift_release();
  swift_release();
  sub_100019960((uint64_t)v10, &qword_1001E0EC0);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)processTapWithAdvertisedItemID:(unint64_t)a3 compactJWS:(id)a4 eventMessage:(id)a5 reengagementURL:(id)a6 reply:(id)a7
{
  uint64_t v12 = sub_100012960(&qword_1001E1170);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = _Block_copy(a7);
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;
  if (a6)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v19 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v14, 0, 1, v19);
  }
  else
  {
    uint64_t v20 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v14, 1, 1, v20);
  }
  _Block_copy(v15);
  id v21 = a5;
  v22 = self;
  sub_100118404(a3, v16, v18, v21, (uint64_t)v14, (uint64_t)v22, (uint64_t)v15);
  _Block_release(v15);

  swift_bridgeObjectRelease();
  sub_100019960((uint64_t)v14, &qword_1001E1170);
}

- (_TtC20AttributionKitDaemon16ServiceXPCBridge)init
{
  result = (_TtC20AttributionKitDaemon16ServiceXPCBridge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end