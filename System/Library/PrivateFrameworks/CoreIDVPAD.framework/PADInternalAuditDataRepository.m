@interface PADInternalAuditDataRepository
- (_TtC10CoreIDVPAD30PADInternalAuditDataRepository)init;
- (void)storeClassifierResult:(id)a3 imageData:(id)a4;
- (void)storeFACPoseBuffer:(__CVBuffer *)a3 identifier:(id)a4 values:(id)a5;
- (void)storePRDBuffer:(__CVBuffer *)a3 name:(id)a4;
- (void)storeTAValues:(id)a3;
- (void)storeUnencryptedVideoFrom:(id)a3;
@end

@implementation PADInternalAuditDataRepository

- (void)storeClassifierResult:(id)a3 imageData:(id)a4
{
  if (a4)
  {
    id v7 = a3;
    v8 = self;
    id v9 = a4;
    uint64_t v10 = sub_21F0C8F48();
    unint64_t v12 = v11;
  }
  else
  {
    id v13 = a3;
    v14 = self;
    uint64_t v10 = 0;
    unint64_t v12 = 0xF000000000000000;
  }
  sub_21F0ABDF0((uint64_t)v17);
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10CoreIDVPAD30PADInternalAuditDataRepository_dataRecorder))
  {
    v15[12] = v17[12];
    v15[13] = v17[13];
    v15[14] = v17[14];
    uint64_t v16 = v18;
    v15[8] = v17[8];
    v15[9] = v17[9];
    v15[10] = v17[10];
    v15[11] = v17[11];
    v15[4] = v17[4];
    v15[5] = v17[5];
    v15[6] = v17[6];
    v15[7] = v17[7];
    v15[0] = v17[0];
    v15[1] = v17[1];
    v15[2] = v17[2];
    v15[3] = v17[3];
    sub_21F096398(v15, v10, v12);
  }
  sub_21F08FAF0((uint64_t)v17);
  sub_21F09ECF8(v10, v12);
}

- (void)storeUnencryptedVideoFrom:(id)a3
{
  uint64_t v4 = sub_21F0C8F08();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F0C8ED8();
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10CoreIDVPAD30PADInternalAuditDataRepository_dataRecorder))
  {
    v8 = self;
    sub_21F09A5CC();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)storePRDBuffer:(__CVBuffer *)a3 name:(id)a4
{
  uint64_t v6 = sub_21F0C9078();
  v8 = v7;
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10CoreIDVPAD30PADInternalAuditDataRepository_dataRecorder))
  {
    uint64_t v9 = v6;
    uint64_t v10 = a3;
    unint64_t v11 = self;
    sub_21F09AB14((void (*)(char *, uint64_t))v10, v9, v8);
  }
  swift_bridgeObjectRelease();
}

- (void)storeFACPoseBuffer:(__CVBuffer *)a3 identifier:(id)a4 values:(id)a5
{
  uint64_t v8 = sub_21F0C9078();
  uint64_t v10 = v9;
  unint64_t v11 = a3;
  id v12 = a5;
  id v13 = self;
  sub_21F0AD600((uint64_t)v11, v8, v10, v12);

  swift_bridgeObjectRelease();
}

- (void)storeTAValues:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_21F0AD8D0(v4);
}

- (_TtC10CoreIDVPAD30PADInternalAuditDataRepository)init
{
  uint64_t v2 = OBJC_IVAR____TtC10CoreIDVPAD30PADInternalAuditDataRepository_dataRecorder;
  uint64_t v3 = qword_267EBABA8;
  id v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  *(Class *)((char *)&v4->super.isa + v2) = (Class)qword_267EBAF00;
  swift_retain();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for PADInternalAuditDataRepository();
  return [(PADInternalAuditDataRepository *)&v6 init];
}

- (void).cxx_destruct
{
}

@end