@interface HealthRecordsSupportedStateChangeListener
- (_TtC15HealthRecordsUI41HealthRecordsSupportedStateChangeListener)init;
- (void)healthRecordsStore:(id)a3 healthRecordsSupportedDidChangeTo:(BOOL)a4;
@end

@implementation HealthRecordsSupportedStateChangeListener

- (void)healthRecordsStore:(id)a3 healthRecordsSupportedDidChangeTo:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v6 = self;
  sub_1C2489128(v7, v4);
}

- (_TtC15HealthRecordsUI41HealthRecordsSupportedStateChangeListener)init
{
  result = (_TtC15HealthRecordsUI41HealthRecordsSupportedStateChangeListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI41HealthRecordsSupportedStateChangeListener__latestChange;
  sub_1C21A78B8(0, (unint64_t *)&unk_1EBB6FA38, MEMORY[0x1E4F1AC70]);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end