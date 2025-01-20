@interface Service
- (_TtC28AppInstallationMetricsDaemon7Service)init;
- (void)clearEventsWithReply:(id)a3;
- (void)getClientEventsWithReply:(id)a3;
- (void)handleAppInstall:(id)a3 reply:(id)a4;
- (void)handleFlushWithReply:(id)a3;
- (void)handlePingWithReply:(id)a3;
- (void)handlePostImmediatelyWithReply:(id)a3;
@end

@implementation Service

- (void)handleAppInstall:(id)a3 reply:(id)a4
{
  uint64_t v7 = sub_1000034A8(&qword_10003A1F8);
  __chkstk_darwin(v7 - 8, v8);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  id v12 = a3;
  v13 = self;
  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;

  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v11;
  v18 = (void *)swift_allocObject();
  v18[2] = v14;
  v18[3] = v16;
  v18[4] = v13;
  uint64_t v19 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v10, 1, 1, v19);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = &unk_10003A458;
  *(void *)(v20 + 24) = v18;
  v21 = v13;
  swift_retain();
  sub_100020A94(v14, v16);
  swift_retain();
  sub_1000195B0((uint64_t)"handleAppInstall", 16, 2, (uint64_t)sub_10001F3BC, v17, (uint64_t)v10, (uint64_t)&unk_10003A460, v20, (uint64_t)&unk_100035E50, (uint64_t)&unk_10003A3B8);
  swift_release();
  sub_10000D2D4((uint64_t)v10, &qword_10003A1F8);
  swift_release();
  swift_release();
  sub_10000D3E4(v14, v16);
}

- (void)clearEventsWithReply:(id)a3
{
  uint64_t v5 = sub_1000034A8(&qword_10003A1F8);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  id v12 = self;
  swift_retain();
  sub_1000195B0((uint64_t)"clearEvents", 11, 2, (uint64_t)sub_10001F3BC, v10, (uint64_t)v8, (uint64_t)&unk_10003A440, 0, (uint64_t)&unk_100035E50, (uint64_t)&unk_10003A3B8);
  sub_10000D2D4((uint64_t)v8, &qword_10003A1F8);

  swift_release();
}

- (void)handlePingWithReply:(id)a3
{
  uint64_t v5 = sub_1000034A8(&qword_10003A1F8);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  id v12 = self;
  swift_retain();
  sub_1000195B0((uint64_t)"handlePing", 10, 2, (uint64_t)sub_10001F3BC, v10, (uint64_t)v8, (uint64_t)&unk_10003A408, 0, (uint64_t)&unk_100035F18, (uint64_t)&unk_10003A418);
  sub_10000D2D4((uint64_t)v8, &qword_10003A1F8);

  swift_release();
}

- (void)handleFlushWithReply:(id)a3
{
  uint64_t v5 = sub_1000034A8(&qword_10003A1F8);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 1, 1, v12);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = &unk_10003A3F0;
  *(void *)(v13 + 24) = v11;
  uint64_t v14 = self;
  swift_retain();
  swift_retain();
  sub_1000195B0((uint64_t)"flush", 5, 2, (uint64_t)sub_10001F3BC, v10, (uint64_t)v8, (uint64_t)&unk_10003A400, v13, (uint64_t)&unk_100035E50, (uint64_t)&unk_10003A3B8);
  swift_release();
  sub_10000D2D4((uint64_t)v8, &qword_10003A1F8);

  swift_release();
  swift_release();
}

- (void)handlePostImmediatelyWithReply:(id)a3
{
  uint64_t v5 = sub_1000034A8(&qword_10003A1F8);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = self;
  swift_retain();
  sub_1000195B0((uint64_t)"handlePostImmediately", 21, 2, (uint64_t)sub_10001F3BC, v10, (uint64_t)v8, (uint64_t)&unk_10003A3A8, 0, (uint64_t)&unk_100035E50, (uint64_t)&unk_10003A3B8);
  sub_10000D2D4((uint64_t)v8, &qword_10003A1F8);

  swift_release();
}

- (void)getClientEventsWithReply:(id)a3
{
  uint64_t v5 = sub_1000034A8(&qword_10003A1F8);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = self;
  swift_retain();
  sub_1000195B0((uint64_t)"getClientEvents", 15, 2, (uint64_t)sub_10001F3BC, v10, (uint64_t)v8, (uint64_t)&unk_10003A320, 0, (uint64_t)&unk_100035DD8, (uint64_t)&unk_10003A338);
  sub_10000D2D4((uint64_t)v8, &qword_10003A1F8);

  swift_release();
}

- (_TtC28AppInstallationMetricsDaemon7Service)init
{
  result = (_TtC28AppInstallationMetricsDaemon7Service *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end