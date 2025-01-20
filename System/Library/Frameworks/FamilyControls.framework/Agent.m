@interface Agent
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC19FamilyControlsAgent5Agent)init;
- (void)authorizationRecordsWithReplyHandler:(id)a3;
- (void)fetchAllSharedActivityWithReplyHandler:(id)a3;
- (void)getAuthorizationStatus:(id)a3;
- (void)getRemoteContentByBundleIDWithBundleIdentifier:(id)a3 slotID:(int64_t)a4 slotStyle:(id)a5 slotType:(int64_t)a6 :(id)a7;
- (void)getRemoteContentForActivitySlotWithSlotID:(int64_t)a3 slotStyle:(id)a4 slotType:(int64_t)a5 tokenToPresent:(id)a6 tokenType:(int64_t)a7 :(id)a8;
- (void)removeAllActivityWithReplyHandler:(id)a3;
- (void)requestAuthorizationFor:(int64_t)a3 :(id)a4;
- (void)requestAuthorizationWithRecordIdentifier:(id)a3 replyHandler:(id)a4;
- (void)requestInternalAuthorizationForMember:(int64_t)a3 replyHandler:(id)a4;
- (void)resetAuthorizationWithRecordIdentifier:(id)a3 replyHandler:(id)a4;
- (void)revokeAuthorization:(id)a3;
- (void)revokeAuthorizationForDeletionWithRecordIdentifier:(id)a3 replyHandler:(id)a4;
- (void)revokeAuthorizationWithRecordIdentifier:(id)a3 replyHandler:(id)a4;
- (void)revokeInternalAuthorizationWithReplyHandler:(id)a3;
- (void)updateActivityWithReplyHandler:(id)a3;
@end

@implementation Agent

- (_TtC19FamilyControlsAgent5Agent)init
{
  return (_TtC19FamilyControlsAgent5Agent *)sub_10002D6BC();
}

- (void).cxx_destruct
{
  sub_10000BE50((uint64_t)self + OBJC_IVAR____TtC19FamilyControlsAgent5Agent_manager);
  swift_release();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19FamilyControlsAgent5Agent____lazy_storage___slotMachine);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1000317C0(v7);

  return v9 & 1;
}

- (void)getAuthorizationStatus:(id)a3
{
}

- (void)requestAuthorizationFor:(int64_t)a3 :(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = self;
  char v9 = self;
  id v10 = [v8 currentConnection];
  sub_100044154(a3, (void (*)(id, uint64_t))sub_10003485C, v7, v9, v10);
  swift_release();
}

- (void)revokeAuthorization:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  uint64_t v7 = self;
  id v8 = [v6 currentConnection];
  char v9 = (Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC19FamilyControlsAgent5Agent_manager);
  id v10 = v7;
  swift_retain();
  sub_10000F988(v8, v9, v10, (void (*)(id, uint64_t))sub_1000344A8, v5);

  swift_release_n();
}

- (void)getRemoteContentByBundleIDWithBundleIdentifier:(id)a3 slotID:(int64_t)a4 slotStyle:(id)a5 slotType:(int64_t)a6 :(id)a7
{
  v11 = _Block_copy(a7);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;
  _Block_copy(v11);
  id v15 = a5;
  v16 = self;
  sub_100032748(v12, v14, a4, v15, a6, (uint64_t)v16, (uint64_t)v11);
  _Block_release(v11);
  _Block_release(v11);

  swift_bridgeObjectRelease();
}

- (void)getRemoteContentForActivitySlotWithSlotID:(int64_t)a3 slotStyle:(id)a4 slotType:(int64_t)a5 tokenToPresent:(id)a6 tokenType:(int64_t)a7 :(id)a8
{
  unint64_t v14 = _Block_copy(a8);
  id v15 = a4;
  id v16 = a6;
  v20 = self;
  uint64_t v17 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v19 = v18;

  _Block_copy(v14);
  sub_100033098(a3, v15, a5, v17, v19, a7, (uint64_t)v20, (uint64_t)v14);
  _Block_release(v14);
  _Block_release(v14);
  sub_10000BF6C(v17, v19);
}

- (void)authorizationRecordsWithReplyHandler:(id)a3
{
}

- (void)requestAuthorizationWithRecordIdentifier:(id)a3 replyHandler:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v10 = __chkstk_darwin(v6, v9);
  v11 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10, v12);
  unint64_t v14 = (char *)&v22 - v13;
  id v15 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v14, v6);
  unint64_t v17 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v18 = (v8 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = self;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v19 + v17, v11, v6);
  v20 = (void *)(v19 + v18);
  void *v20 = sub_100034860;
  v20[1] = v16;
  v21 = self;
  swift_retain();
  sub_10004490C((void (*)(uint64_t, char *))sub_1000341D8, v19);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v14, v6);
}

- (void)resetAuthorizationWithRecordIdentifier:(id)a3 replyHandler:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  uint64_t v13 = (char *)self + OBJC_IVAR____TtC19FamilyControlsAgent5Agent_manager;
  unint64_t v14 = self;
  sub_100010FF8((uint64_t)v10, (uint64_t)v13, v14, (void (*)(uint64_t))sub_100034860, v12);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)revokeAuthorizationWithRecordIdentifier:(id)a3 replyHandler:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  uint64_t v13 = (char *)self + OBJC_IVAR____TtC19FamilyControlsAgent5Agent_manager;
  unint64_t v14 = self;
  sub_1000124BC((uint64_t)v10, 0, (uint64_t)v13, v14, (void (*)(uint64_t))sub_100034860, v12);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)revokeAuthorizationForDeletionWithRecordIdentifier:(id)a3 replyHandler:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  uint64_t v13 = (char *)self + OBJC_IVAR____TtC19FamilyControlsAgent5Agent_manager;
  unint64_t v14 = self;
  sub_100013A80((uint64_t)v10, 1, (uint64_t)v13, v14, (void (*)(uint64_t))sub_100034860, v12);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)requestInternalAuthorizationForMember:(int64_t)a3 replyHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  uint64_t v7 = self;
  sub_100033E40(a3, (uint64_t)v7, (uint64_t (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)revokeInternalAuthorizationWithReplyHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19FamilyControlsAgent5Agent_manager);
  uint64_t v7 = self;
  sub_100015210(v6, (uint64_t)v7, (uint64_t (*)(void))sub_100034860, v5);

  swift_release();
}

- (void)fetchAllSharedActivityWithReplyHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_1000303DC((uint64_t)sub_100034860, v5);

  swift_release();
}

- (void)updateActivityWithReplyHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = qword_100073A38;
  uint64_t v7 = self;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_100034860;
  *(void *)(v8 + 24) = v5;
  swift_retain();
  sub_10004E1B4((uint64_t)sub_1000310C0, v8);

  swift_release();

  swift_release();
}

- (void)removeAllActivityWithReplyHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = qword_100073A38;
  uint64_t v7 = self;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_100031080;
  *(void *)(v8 + 24) = v5;
  swift_retain();
  sub_10004E994((uint64_t (*)(void, void))sub_1000348C4, v8);

  swift_release();

  swift_release();
}

@end