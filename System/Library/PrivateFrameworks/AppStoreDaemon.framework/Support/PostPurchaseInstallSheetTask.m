@interface PostPurchaseInstallSheetTask
- (_TtC9appstored28PostPurchaseInstallSheetTask)init;
- (_TtC9appstored28PostPurchaseInstallSheetTask)initWithItemID:(id)a3 versionID:(id)a4 purchaseInfo:(id)a5 isRedownload:(BOOL)a6;
- (_TtC9appstored28PostPurchaseInstallSheetTask)initWithoutKeepAlive;
- (void)mainWithCompletionHandler:(id)a3;
@end

@implementation PostPurchaseInstallSheetTask

- (_TtC9appstored28PostPurchaseInstallSheetTask)initWithItemID:(id)a3 versionID:(id)a4 purchaseInfo:(id)a5 isRedownload:(BOOL)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = a5;
  v15 = (_TtC9appstored28PostPurchaseInstallSheetTask *)sub_1000B00C4(v9, v11, (uint64_t)a4, v13, v14, a6);

  return v15;
}

- (void)mainWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1005A59E8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1005A35A0;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_1000DFAB0((uint64_t)v7, (uint64_t)&unk_1005A4930, (uint64_t)v12);
  swift_release();
}

- (_TtC9appstored28PostPurchaseInstallSheetTask)init
{
  result = (_TtC9appstored28PostPurchaseInstallSheetTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9appstored28PostPurchaseInstallSheetTask)initWithoutKeepAlive
{
  result = (_TtC9appstored28PostPurchaseInstallSheetTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9appstored28PostPurchaseInstallSheetTask_logKey));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9appstored28PostPurchaseInstallSheetTask_account);
}

@end