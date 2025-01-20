@interface UnusedModelsVersionMismatchAlertDataSource
- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5;
@end

@implementation UnusedModelsVersionMismatchAlertDataSource

- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5
{
  sub_1AD20E2C8();
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v9 = (char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73D2B0();
  swift_retain();
  sub_1AD480C5C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end