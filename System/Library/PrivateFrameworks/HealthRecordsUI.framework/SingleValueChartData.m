@interface SingleValueChartData
- (_TtC15HealthRecordsUI20SingleValueChartData)init;
@end

@implementation SingleValueChartData

- (_TtC15HealthRecordsUI20SingleValueChartData)init
{
  result = (_TtC15HealthRecordsUI20SingleValueChartData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI20SingleValueChartData_chartableQuantitySet));
  v3 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI20SingleValueChartData_date;
  uint64_t v4 = sub_1C254CAD0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end