@interface VerifiableHealthRecordsParsingServiceServer
- (_TtC19HealthRecordsDaemon43VerifiableHealthRecordsParsingServiceServer)init;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_parseDataSource:(id)a3 options:(unint64_t)a4 completion:(id)a5;
@end

@implementation VerifiableHealthRecordsParsingServiceServer

- (_TtC19HealthRecordsDaemon43VerifiableHealthRecordsParsingServiceServer)init
{
  result = (_TtC19HealthRecordsDaemon43VerifiableHealthRecordsParsingServiceServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19HealthRecordsDaemon43VerifiableHealthRecordsParsingServiceServer_client);
}

- (void)remote_parseDataSource:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  v11 = self;
  sub_22D0C6270(v10, a4, (uint64_t)sub_22D0C6DE8, v9);

  swift_release();
}

- (id)exportedInterface
{
  id v2 = (id)HKVerifiableHealthRecordsParsingServiceInterface();
  return v2;
}

- (id)remoteInterface
{
  return 0;
}

@end