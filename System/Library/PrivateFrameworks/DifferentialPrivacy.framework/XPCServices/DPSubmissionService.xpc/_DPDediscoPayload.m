@interface _DPDediscoPayload
- (_DPDediscoPayload)init;
- (_DPDediscoPayload)initWithCollectionId:(id)a3 algorithm:(id)a4 algorithmParameters:(id)a5 fsEncryptedShare:(id)a6 dsEncryptedShare:(id)a7 fsPublicKey:(id)a8 dsPublicKey:(id)a9 versionHash:(id)a10 report:(id)a11;
- (id)getCollectionId;
- (id)getReport;
- (id)serializeAndReturnError:(id *)a3;
@end

@implementation _DPDediscoPayload

- (_DPDediscoPayload)initWithCollectionId:(id)a3 algorithm:(id)a4 algorithmParameters:(id)a5 fsEncryptedShare:(id)a6 dsEncryptedShare:(id)a7 fsPublicKey:(id)a8 dsPublicKey:(id)a9 versionHash:(id)a10 report:(id)a11
{
  uint64_t v54 = sub_1000591E0();
  uint64_t v53 = v15;
  uint64_t v16 = sub_1000591E0();
  uint64_t v51 = v17;
  uint64_t v52 = v16;
  if (a6)
  {
    id v18 = a8;
    id v19 = a9;
    id v20 = a10;
    id v21 = a11;
    id v22 = a7;
    id v23 = a5;
    id v24 = a6;
    uint64_t v25 = sub_100058D80();
    uint64_t v49 = v26;
    uint64_t v50 = v25;

    id v55 = a5;
    if (a7)
    {
LABEL_3:
      uint64_t v48 = sub_100058D80();
      uint64_t v28 = v27;

      goto LABEL_6;
    }
  }
  else
  {
    id v29 = a8;
    id v30 = a9;
    id v31 = a10;
    id v32 = a11;
    id v33 = a7;
    id v34 = a5;
    uint64_t v49 = 0xF000000000000000;
    uint64_t v50 = 0;
    id v55 = a5;
    if (a7) {
      goto LABEL_3;
    }
  }
  uint64_t v48 = 0;
  uint64_t v28 = 0xF000000000000000;
LABEL_6:
  uint64_t v35 = sub_1000591E0();
  uint64_t v37 = v36;

  uint64_t v38 = sub_1000591E0();
  uint64_t v40 = v39;

  uint64_t v41 = sub_1000591E0();
  uint64_t v43 = v42;

  if (a11)
  {
    uint64_t v44 = sub_100058D80();
    uint64_t v46 = v45;
  }
  else
  {
    uint64_t v44 = 0;
    uint64_t v46 = 0xF000000000000000;
  }
  return (_DPDediscoPayload *)_DPDediscoPayload.init(collectionId:algorithm:algorithmParameters:fsEncryptedShare:dsEncryptedShare:fsPublicKey:dsPublicKey:versionHash:report:)(v54, v53, v52, v51, (uint64_t)v55, v50, v49, v48, v28, v35, v37, v38, v40, v41, v43, v44, v46);
}

- (id)serializeAndReturnError:(id *)a3
{
  uint64_t v4 = type metadata accessor for DediscoDonation(0);
  __chkstk_darwin(v4);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = self;
  sub_1000363B8(&qword_1000819D8, (void (*)(uint64_t))type metadata accessor for DediscoDonation);
  v7 = self;
  sub_100058F60();
  uint64_t v8 = sub_100058F30();
  unint64_t v10 = v9;
  sub_100035F40((uint64_t)v6);

  v11.super.isa = sub_100058D70().super.isa;
  sub_100016B2C(v8, v10);
  return v11.super.isa;
}

- (id)getCollectionId
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_1000591D0();
  swift_bridgeObjectRelease();
  return v2;
}

- (id)getReport
{
  NSString v2 = (uint64_t *)((char *)self + OBJC_IVAR____DPDediscoPayload_report);
  unint64_t v3 = *(void *)&self->collectionId[OBJC_IVAR____DPDediscoPayload_report];
  if (v3 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    uint64_t v5 = *v2;
    sub_100016E5C(*v2, v3);
    Class isa = sub_100058D70().super.isa;
    sub_100033FA4(v5, v3);
  }
  return isa;
}

- (_DPDediscoPayload)init
{
  result = (_DPDediscoPayload *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_100033FA4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____DPDediscoPayload_fsEncryptedShare), *(void *)&self->collectionId[OBJC_IVAR____DPDediscoPayload_fsEncryptedShare]);
  sub_100033FA4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____DPDediscoPayload_dsEncryptedShare), *(void *)&self->collectionId[OBJC_IVAR____DPDediscoPayload_dsEncryptedShare]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____DPDediscoPayload_report);
  unint64_t v4 = *(void *)&self->collectionId[OBJC_IVAR____DPDediscoPayload_report];
  sub_100033FA4(v3, v4);
}

@end