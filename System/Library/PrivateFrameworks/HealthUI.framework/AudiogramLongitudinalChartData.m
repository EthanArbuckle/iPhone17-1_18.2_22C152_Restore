@interface AudiogramLongitudinalChartData
- (_TtC8HealthUI30AudiogramLongitudinalChartData)init;
@end

@implementation AudiogramLongitudinalChartData

- (_TtC8HealthUI30AudiogramLongitudinalChartData)init
{
  result = (_TtC8HealthUI30AudiogramLongitudinalChartData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUI30AudiogramLongitudinalChartData_aggregateSummary));
  v3 = (char *)self + OBJC_IVAR____TtC8HealthUI30AudiogramLongitudinalChartData_aggregationIntervalMidpoint;
  uint64_t v4 = sub_1E0ECB980();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end