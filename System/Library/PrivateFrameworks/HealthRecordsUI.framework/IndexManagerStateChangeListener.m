@interface IndexManagerStateChangeListener
- (_TtC15HealthRecordsUI31IndexManagerStateChangeListener)init;
- (void)conceptStore:(id)a3 indexManagerDidChangeState:(unint64_t)a4;
@end

@implementation IndexManagerStateChangeListener

- (void)conceptStore:(id)a3 indexManagerDidChangeState:(unint64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_1C2532040(v6, a4);
}

- (_TtC15HealthRecordsUI31IndexManagerStateChangeListener)init
{
  result = (_TtC15HealthRecordsUI31IndexManagerStateChangeListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end