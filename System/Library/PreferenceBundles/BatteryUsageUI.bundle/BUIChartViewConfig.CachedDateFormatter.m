@interface BUIChartViewConfig.CachedDateFormatter
- (_TtCC14BatteryUsageUI18BUIChartViewConfig19CachedDateFormatter)init;
- (_TtCC14BatteryUsageUI18BUIChartViewConfig19CachedDateFormatter)initWithCoder:(id)a3;
- (id)stringFromDate:(id)a3;
@end

@implementation BUIChartViewConfig.CachedDateFormatter

- (id)stringFromDate:(id)a3
{
  uint64_t v4 = sub_8F150();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_8F130();
  v8 = self;
  sub_52B18((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  NSString v9 = sub_90010();
  swift_bridgeObjectRelease();

  return v9;
}

- (_TtCC14BatteryUsageUI18BUIChartViewConfig19CachedDateFormatter)init
{
  return (_TtCC14BatteryUsageUI18BUIChartViewConfig19CachedDateFormatter *)sub_531A0((char *)self, (uint64_t)a2, &OBJC_IVAR____TtCC14BatteryUsageUI18BUIChartViewConfig19CachedDateFormatter_cache, (uint64_t (*)(void *))sub_526FC, type metadata accessor for BUIChartViewConfig.CachedDateFormatter);
}

- (_TtCC14BatteryUsageUI18BUIChartViewConfig19CachedDateFormatter)initWithCoder:(id)a3
{
  return (_TtCC14BatteryUsageUI18BUIChartViewConfig19CachedDateFormatter *)sub_53254((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtCC14BatteryUsageUI18BUIChartViewConfig19CachedDateFormatter_cache, (uint64_t (*)(void *))sub_526FC, type metadata accessor for BUIChartViewConfig.CachedDateFormatter);
}

- (void).cxx_destruct
{
}

@end