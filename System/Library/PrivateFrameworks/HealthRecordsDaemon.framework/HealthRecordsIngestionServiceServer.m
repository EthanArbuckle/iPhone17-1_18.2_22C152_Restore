@interface HealthRecordsIngestionServiceServer
- (_TtC19HealthRecordsDaemon35HealthRecordsIngestionServiceServer)init;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_addCardToWalletForRecord:(id)a3 completion:(id)a4;
- (void)remote_didUpdateSignedClinicalDataRecord:(id)a3;
- (void)remote_handleSignedClinicalDataFeature:(id)a3 context:(id)a4 completion:(id)a5;
- (void)remote_parseSignedClinicalData:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)remote_processOriginalSignedClinicalDataRecords:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)remote_reverifySignatureForRecord:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)remote_triggerDownloadIssuerRegistryWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)remote_triggerDownloadPublicKeysWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)remote_willDeleteSignedClinicalDataRecordWithSyncIdentifier:(id)a3;
@end

@implementation HealthRecordsIngestionServiceServer

- (_TtC19HealthRecordsDaemon35HealthRecordsIngestionServiceServer)init
{
  result = (_TtC19HealthRecordsDaemon35HealthRecordsIngestionServiceServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19HealthRecordsDaemon35HealthRecordsIngestionServiceServer_client);
}

- (void)remote_parseSignedClinicalData:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
}

- (void)remote_handleSignedClinicalDataFeature:(id)a3 context:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_22D200434(v10, v11, (uint64_t)sub_22D204BCC, v9);

  swift_release();
}

- (void)remote_processOriginalSignedClinicalDataRecords:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  sub_22D030474(0, &qword_2685426D8);
  uint64_t v8 = sub_22D2BCE00();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  id v10 = self;
  sub_22D2008C8(v8, a4, (uint64_t)sub_22D204BCC, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)remote_reverifySignatureForRecord:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
}

- (void)remote_addCardToWalletForRecord:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_22D2019D4(v8, (uint64_t)sub_22D0DB8C0, v7);

  swift_release();
}

- (void)remote_didUpdateSignedClinicalDataRecord:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22D202070(v4);
}

- (void)remote_willDeleteSignedClinicalDataRecordWithSyncIdentifier:(id)a3
{
  uint64_t v4 = sub_22D2BBC90();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D2BBC70();
  id v8 = self;
  sub_22D202900((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)remote_triggerDownloadIssuerRegistryWithOptions:(unint64_t)a3 completion:(id)a4
{
}

- (void)remote_triggerDownloadPublicKeysWithOptions:(unint64_t)a3 completion:(id)a4
{
}

- (id)exportedInterface
{
  id v2 = (id)HDHealthRecordsIngestionServiceInterface();
  return v2;
}

- (id)remoteInterface
{
  return 0;
}

@end