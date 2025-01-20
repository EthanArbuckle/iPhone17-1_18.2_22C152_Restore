@interface BDSSyncEnginePipeline
- (_TtC13BookDataStore21BDSSyncEnginePipeline)init;
- (_TtC13BookDataStore21BDSSyncEnginePipeline)initWithRecordType:(id)a3 zoneName:(id)a4 delegate:(id)a5;
- (_TtC13BookDataStore21BDSSyncEnginePipeline)initWithRecordType:(id)a3 zoneName:(id)a4 delegate:(id)a5 dataMapper:(id)a6;
- (id)privacyDelegate;
- (void)fetchRecordForRecordID:(CKRecordID *)a3 completion:(id)a4;
- (void)saltUpdatedWithSaltVersionIdentifier:(id)a3;
- (void)signalSyncToCK;
- (void)startSyncToCKWithCompletion:(id)a3;
@end

@implementation BDSSyncEnginePipeline

- (_TtC13BookDataStore21BDSSyncEnginePipeline)initWithRecordType:(id)a3 zoneName:(id)a4 delegate:(id)a5
{
  sub_2361FE8D8();
  sub_2361FE8D8();
  swift_unknownObjectRetain();
  v7 = (void *)sub_2361FE8C8();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_2361FE8C8();
  swift_bridgeObjectRelease();
  v9 = [(BDSSyncEnginePipeline *)self initWithRecordType:v7 zoneName:v8 delegate:a5 dataMapper:0];

  swift_unknownObjectRelease();
  return v9;
}

- (_TtC13BookDataStore21BDSSyncEnginePipeline)initWithRecordType:(id)a3 zoneName:(id)a4 delegate:(id)a5 dataMapper:(id)a6
{
  uint64_t v8 = sub_2361FE8D8();
  uint64_t v10 = v9;
  uint64_t v11 = sub_2361FE8D8();
  uint64_t v13 = v12;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (_TtC13BookDataStore21BDSSyncEnginePipeline *)sub_2361E615C(v8, v10, v11, v13, (uint64_t)a5, (uint64_t)a6);
}

- (void)saltUpdatedWithSaltVersionIdentifier:(id)a3
{
  v3 = self;
  sub_2361E8FE4();
}

- (void)signalSyncToCK
{
  v2 = self;
  sub_2361E8FE4();
}

- (void)startSyncToCKWithCompletion:(id)a3
{
  uint64_t v5 = sub_236126188(&qword_268853ED0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2361FEB08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_268854A68;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_268854A70;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_2361F1D08((uint64_t)v7, (uint64_t)&unk_268854A78, (uint64_t)v12);
  swift_release();
}

- (void)fetchRecordForRecordID:(CKRecordID *)a3 completion:(id)a4
{
  uint64_t v7 = sub_236126188(&qword_268853ED0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2361FEB08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268854A28;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2688535C0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_2361F1D08((uint64_t)v9, (uint64_t)&unk_2688535C8, (uint64_t)v14);
  swift_release();
}

- (id)privacyDelegate
{
  uint64_t v2 = qword_26AD748D8;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  id v4 = (id)qword_26AD748D0;

  return v4;
}

- (_TtC13BookDataStore21BDSSyncEnginePipeline)init
{
  result = (_TtC13BookDataStore21BDSSyncEnginePipeline *)_swift_stdlib_reportUnimplementedInitializer();
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

  v3 = (char *)self + OBJC_IVAR____TtC13BookDataStore21BDSSyncEnginePipeline_logger;
  uint64_t v4 = sub_2361FDB58();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13BookDataStore21BDSSyncEnginePipeline_scheduleSyncBlock);
}

@end