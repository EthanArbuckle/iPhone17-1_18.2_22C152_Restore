@interface AKSharedAccountsStorageController
- (AKSharedAccountsStorageController)init;
- (AKSharedAccountsStorageController)initWithKeychainStorageController:(id)a3 keychainGroupManager:(id)a4;
- (BOOL)addSharedAccountWithCredential:(id)a3 error:(id *)a4;
- (BOOL)cleanupAllItemsFrom:(id)a3 error:(id *)a4;
- (BOOL)removeAllAccountsBelongingToParticipantWithParticipantID:(id)a3 from:(id)a4 error:(id *)a5;
- (BOOL)removeSharedAccount:(id)a3 error:(id *)a4;
- (id)shareTokenForAccount:(id)a3 inGroup:(id)a4 error:(id *)a5;
- (void)fetchAccountsSharedWithCurrentUserWithClientID:(NSString *)a3 completionHandler:(id)a4;
- (void)fetchAllAccountsSharedByCurrentUserWithCompletionHandler:(id)a3;
- (void)fetchAllSharedAccountsWithShareTokenWithCompletionHandler:(id)a3;
- (void)fetchSharedAccountsWithGroupID:(NSString *)a3 completionHandler:(id)a4;
- (void)isMemberOfGroupWithGroupID:(NSString *)a3 completion:(id)a4;
- (void)removeAllAccountsBelongingToCurrentUserFrom:(NSString *)a3 completionHandler:(id)a4;
- (void)removeSharedAccountBelongingToCurrentUserWithClientID:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation AKSharedAccountsStorageController

- (AKSharedAccountsStorageController)initWithKeychainStorageController:(id)a3 keychainGroupManager:(id)a4
{
  swift_getObjectType();
  swift_getObjectType();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();

  return (AKSharedAccountsStorageController *)sub_10011CBC4((uint64_t)a3, (uint64_t)a4, (char *)self);
}

- (BOOL)addSharedAccountWithCredential:(id)a3 error:(id *)a4
{
  return sub_10011A0C8(self, (uint64_t)a2, a3, (uint64_t)a4, sub_100114E44);
}

- (void)fetchSharedAccountsWithGroupID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100271228;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100271230;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_100271238, (uint64_t)v14);
  swift_release();
}

- (void)fetchAllSharedAccountsWithShareTokenWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100271208;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100271210;
  v12[5] = v11;
  v13 = self;
  sub_1001538E0((uint64_t)v7, (uint64_t)&unk_100271218, (uint64_t)v12);
  swift_release();
}

- (void)fetchAccountsSharedWithCurrentUserWithClientID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1002711E8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1002711F0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_1002711F8, (uint64_t)v14);
  swift_release();
}

- (id)shareTokenForAccount:(id)a3 inGroup:(id)a4 error:(id *)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  uint64_t v8 = self;
  sub_100118FCC(v7);
  swift_bridgeObjectRelease();

  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v9;
}

- (void)isMemberOfGroupWithGroupID:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  NSString v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1002711C8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1002711D0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_1002711D8, (uint64_t)v14);
  swift_release();
}

- (BOOL)removeSharedAccount:(id)a3 error:(id *)a4
{
  return sub_10011A0C8(self, (uint64_t)a2, a3, (uint64_t)a4, sub_100119E80);
}

- (void)fetchAllAccountsSharedByCurrentUserWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1002711A8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1002711B0;
  v12[5] = v11;
  v13 = self;
  sub_1001538E0((uint64_t)v7, (uint64_t)&unk_1002711B8, (uint64_t)v12);
  swift_release();
}

- (void)removeSharedAccountBelongingToCurrentUserWithClientID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100271190;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100271198;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_100271C00, (uint64_t)v14);
  swift_release();
}

- (void)removeAllAccountsBelongingToCurrentUserFrom:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100271180;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10026FD30;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_1002701D0, (uint64_t)v14);
  swift_release();
}

- (BOOL)removeAllAccountsBelongingToParticipantWithParticipantID:(id)a3 from:(id)a4 error:(id *)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = self;
  sub_10011BE78();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)cleanupAllItemsFrom:(id)a3 error:(id *)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = self;
  sub_10011C080();
  swift_bridgeObjectRelease();

  return 1;
}

- (AKSharedAccountsStorageController)init
{
  result = (AKSharedAccountsStorageController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000E2354((uint64_t)self + OBJC_IVAR___AKSharedAccountsStorageController_sharedGroupsMembershipController);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___AKSharedAccountsStorageController__cachedSharedGroupsMembershipInfo);
}

@end