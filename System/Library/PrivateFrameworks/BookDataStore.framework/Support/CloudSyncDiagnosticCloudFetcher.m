@interface CloudSyncDiagnosticCloudFetcher
- (_TtC14bookdatastored31CloudSyncDiagnosticCloudFetcher)init;
- (_TtC14bookdatastored31CloudSyncDiagnosticCloudFetcher)initWithCloudKitDatabaseController:(id)a3;
@end

@implementation CloudSyncDiagnosticCloudFetcher

- (_TtC14bookdatastored31CloudSyncDiagnosticCloudFetcher)initWithCloudKitDatabaseController:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (objc_class *)a3;
  v7 = self;
  sub_1001EB550();
  *(Class *)((char *)&v7->super.isa
           + OBJC_IVAR____TtC14bookdatastored31CloudSyncDiagnosticCloudFetcher_cloudKitDatabaseController) = v6;
  v8 = v6;

  v11.receiver = v7;
  v11.super_class = ObjectType;
  v9 = [(CloudSyncDiagnosticCloudFetcher *)&v11 init];

  return v9;
}

- (_TtC14bookdatastored31CloudSyncDiagnosticCloudFetcher)init
{
  result = (_TtC14bookdatastored31CloudSyncDiagnosticCloudFetcher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14bookdatastored31CloudSyncDiagnosticCloudFetcher_logger;
  uint64_t v4 = sub_1001EB560();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14bookdatastored31CloudSyncDiagnosticCloudFetcher_cloudKitDatabaseController);
}

@end