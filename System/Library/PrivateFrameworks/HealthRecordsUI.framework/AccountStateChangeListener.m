@interface AccountStateChangeListener
- (_TtC15HealthRecordsUI26AccountStateChangeListener)init;
- (void)clinicalAccountStore:(id)a3 accountDidChange:(id)a4 changeType:(int64_t)a5;
@end

@implementation AccountStateChangeListener

- (void)clinicalAccountStore:(id)a3 accountDidChange:(id)a4 changeType:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  v9 = self;
  sub_1C23E7F9C(v10, v8, a5);
}

- (_TtC15HealthRecordsUI26AccountStateChangeListener)init
{
  result = (_TtC15HealthRecordsUI26AccountStateChangeListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI26AccountStateChangeListener__latestChange;
  sub_1C21A85D8(0, &qword_1EBB6FA48, MEMORY[0x1E4F1AC70]);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  swift_release();
}

@end