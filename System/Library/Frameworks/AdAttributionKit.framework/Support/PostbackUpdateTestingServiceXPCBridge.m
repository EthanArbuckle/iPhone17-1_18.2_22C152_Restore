@interface PostbackUpdateTestingServiceXPCBridge
- (_TtC20AttributionKitDaemon37PostbackUpdateTestingServiceXPCBridge)init;
- (void)clearBiomeWithClearEvent:(id)a3 reply:(id)a4;
- (void)fetchReengagementTokensWithReply:(id)a3;
- (void)getSnoutStoriesWithReply:(id)a3;
- (void)submitConversionEventWithEventData:(id)a3 reply:(id)a4;
- (void)submitPurchaseEventWithEventData:(id)a3 reply:(id)a4;
- (void)updateConversionValue:(id)a3 reply:(id)a4;
@end

@implementation PostbackUpdateTestingServiceXPCBridge

- (void)updateConversionValue:(id)a3 reply:(id)a4
{
  uint64_t v7 = sub_100012960(&qword_1001E0EC0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  id v11 = a3;
  v12 = self;
  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;

  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v10;
  uint64_t v17 = (uint64_t)v12 + OBJC_IVAR____TtC20AttributionKitDaemon37PostbackUpdateTestingServiceXPCBridge_service;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v9, 1, 1, v18);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v13;
  *(void *)(v19 + 24) = v15;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = &unk_1001E24E0;
  *(void *)(v20 + 24) = v19;
  swift_retain();
  sub_10003CF30(v13, v15);
  swift_retain();
  sub_100141794((uint64_t)"Postback Update Testing", 23, 2, (void (*)(void))sub_10006EC80, v16, v17, (uint64_t)v9, (uint64_t)&unk_1001E24E8, v20);
  swift_release();
  swift_release();
  swift_release();
  sub_10006E9CC((uint64_t)v9);
  swift_release();
  sub_100020930(v13, v15);
}

- (void)getSnoutStoriesWithReply:(id)a3
{
  uint64_t v5 = sub_100012960(&qword_1001E0EC0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  v10 = (char *)self + OBJC_IVAR____TtC20AttributionKitDaemon37PostbackUpdateTestingServiceXPCBridge_service;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
  v12 = self;
  sub_100141BCC((uint64_t)"Get Snout Stories", 17, 2, (void (*)(void))sub_10006EC80, v9, (uint64_t)v10, (uint64_t)v7, (uint64_t)&unk_1001E24D0, 0);
  sub_10006E9CC((uint64_t)v7);

  swift_release();
}

- (void)fetchReengagementTokensWithReply:(id)a3
{
  uint64_t v5 = sub_100012960(&qword_1001E0EC0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  v10 = (char *)self + OBJC_IVAR____TtC20AttributionKitDaemon37PostbackUpdateTestingServiceXPCBridge_service;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
  v12 = self;
  sub_100141794((uint64_t)"Fetch Reengagement Tokens", 25, 2, (void (*)(void))sub_10006EC80, v9, (uint64_t)v10, (uint64_t)v7, (uint64_t)&unk_1001E24C8, 0);
  sub_10006E9CC((uint64_t)v7);

  swift_release();
}

- (void)submitConversionEventWithEventData:(id)a3 reply:(id)a4
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
  uint64_t v17 = (uint64_t)v12 + OBJC_IVAR____TtC20AttributionKitDaemon37PostbackUpdateTestingServiceXPCBridge_service;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v9, 1, 1, v18);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v13;
  *(void *)(v19 + 24) = v15;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = &unk_1001E24B8;
  *(void *)(v20 + 24) = v19;
  swift_retain();
  sub_10003CF30(v13, v15);
  swift_retain();
  sub_100141794((uint64_t)"Submit Conversion Event", 23, 2, (void (*)(void))sub_10006EC80, v16, v17, (uint64_t)v9, (uint64_t)&unk_1001E24C0, v20);
  swift_release();
  swift_release();
  swift_release();
  sub_10006E9CC((uint64_t)v9);
  swift_release();
  sub_100020930(v13, v15);
}

- (void)submitPurchaseEventWithEventData:(id)a3 reply:(id)a4
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
  uint64_t v17 = (uint64_t)v12 + OBJC_IVAR____TtC20AttributionKitDaemon37PostbackUpdateTestingServiceXPCBridge_service;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v9, 1, 1, v18);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v13;
  *(void *)(v19 + 24) = v15;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = &unk_1001E24A0;
  *(void *)(v20 + 24) = v19;
  swift_retain();
  sub_10003CF30(v13, v15);
  swift_retain();
  sub_100141794((uint64_t)"Submit Purchase Event", 21, 2, (void (*)(void))sub_10006EC80, v16, v17, (uint64_t)v9, (uint64_t)&unk_1001E24A8, v20);
  swift_release();
  swift_release();
  swift_release();
  sub_10006E9CC((uint64_t)v9);
  swift_release();
  sub_100020930(v13, v15);
}

- (void)clearBiomeWithClearEvent:(id)a3 reply:(id)a4
{
  uint64_t v6 = sub_100012960(&qword_1001E0EC0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a4);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v9;
  unint64_t v14 = (char *)self + OBJC_IVAR____TtC20AttributionKitDaemon37PostbackUpdateTestingServiceXPCBridge_service;
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v8, 1, 1, v15);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v10;
  *(void *)(v16 + 24) = v12;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = &unk_1001E2480;
  *(void *)(v17 + 24) = v16;
  uint64_t v18 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100141794((uint64_t)"Clear Biome", 11, 2, (void (*)(void))sub_10006C590, v13, (uint64_t)v14, (uint64_t)v8, (uint64_t)&unk_1001E2490, v17);
  swift_release();
  swift_release();
  swift_release();
  sub_10006E9CC((uint64_t)v8);

  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC20AttributionKitDaemon37PostbackUpdateTestingServiceXPCBridge)init
{
  result = (_TtC20AttributionKitDaemon37PostbackUpdateTestingServiceXPCBridge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end