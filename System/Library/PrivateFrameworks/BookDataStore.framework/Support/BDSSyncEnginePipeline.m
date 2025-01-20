@interface BDSSyncEnginePipeline
- (_TtC14bookdatastored21BDSSyncEnginePipeline)init;
- (_TtC14bookdatastored21BDSSyncEnginePipeline)initWithRecordType:(id)a3 zoneName:(id)a4 delegate:(id)a5;
- (_TtC14bookdatastored21BDSSyncEnginePipeline)initWithRecordType:(id)a3 zoneName:(id)a4 delegate:(id)a5 dataMapper:(id)a6;
- (id)privacyDelegate;
- (void)fetchRecordForRecordID:(CKRecordID *)a3 completion:(id)a4;
- (void)saltUpdatedWithSaltVersionIdentifier:(id)a3;
- (void)signalSyncToCK;
- (void)startSyncToCKWithCompletion:(id)a3;
@end

@implementation BDSSyncEnginePipeline

- (_TtC14bookdatastored21BDSSyncEnginePipeline)initWithRecordType:(id)a3 zoneName:(id)a4 delegate:(id)a5
{
  sub_1001EC370();
  sub_1001EC370();
  swift_unknownObjectRetain();
  NSString v7 = sub_1001EC340();
  swift_bridgeObjectRelease();
  NSString v8 = sub_1001EC340();
  swift_bridgeObjectRelease();
  v9 = [(BDSSyncEnginePipeline *)self initWithRecordType:v7 zoneName:v8 delegate:a5 dataMapper:0];

  swift_unknownObjectRelease();
  return v9;
}

- (_TtC14bookdatastored21BDSSyncEnginePipeline)initWithRecordType:(id)a3 zoneName:(id)a4 delegate:(id)a5 dataMapper:(id)a6
{
  uint64_t v8 = sub_1001EC370();
  uint64_t v10 = v9;
  uint64_t v11 = sub_1001EC370();
  v13 = v12;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (_TtC14bookdatastored21BDSSyncEnginePipeline *)sub_1000F465C(v8, v10, v11, v13, (uint64_t)a5, (uint64_t)a6);
}

- (void)saltUpdatedWithSaltVersionIdentifier:(id)a3
{
  v3 = self;
  BDSSyncEnginePipeline.signalSyncToCK()();
}

- (void)signalSyncToCK
{
  v2 = self;
  BDSSyncEnginePipeline.signalSyncToCK()();
}

- (void)startSyncToCKWithCompletion:(id)a3
{
  uint64_t v5 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v5 - 8);
  NSString v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100293870;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100293878;
  v12[5] = v11;
  v13 = self;
  sub_100124BC8((uint64_t)v7, (uint64_t)&unk_100293880, (uint64_t)v12);
  swift_release();
}

- (void)fetchRecordForRecordID:(CKRecordID *)a3 completion:(id)a4
{
  uint64_t v7 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100293850;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100291B00;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100124BC8((uint64_t)v9, (uint64_t)&unk_100293860, (uint64_t)v14);
  swift_release();
}

- (id)privacyDelegate
{
  uint64_t v2 = qword_100291188;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  id v4 = (id)static BDSSyncEngine.shared;

  return v4;
}

- (_TtC14bookdatastored21BDSSyncEnginePipeline)init
{
  result = (_TtC14bookdatastored21BDSSyncEnginePipeline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = (char *)self + OBJC_IVAR____TtC14bookdatastored21BDSSyncEnginePipeline_logger;
  uint64_t v4 = sub_1001EB560();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14bookdatastored21BDSSyncEnginePipeline_scheduleSyncBlock);
}

@end