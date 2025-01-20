@interface BUIChartViewConfig.CachedNumberFormatter
- (_TtCC14BatteryUsageUI18BUIChartViewConfig21CachedNumberFormatter)init;
- (_TtCC14BatteryUsageUI18BUIChartViewConfig21CachedNumberFormatter)initWithCoder:(id)a3;
- (id)stringFromNumber:(id)a3;
@end

@implementation BUIChartViewConfig.CachedNumberFormatter

- (id)stringFromNumber:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_52F24(v4);
  uint64_t v7 = v6;

  if (v7)
  {
    NSString v8 = sub_90010();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return v8;
}

- (_TtCC14BatteryUsageUI18BUIChartViewConfig21CachedNumberFormatter)init
{
  return (_TtCC14BatteryUsageUI18BUIChartViewConfig21CachedNumberFormatter *)sub_531A0((char *)self, (uint64_t)a2, &OBJC_IVAR____TtCC14BatteryUsageUI18BUIChartViewConfig21CachedNumberFormatter_cache, (uint64_t (*)(void *))sub_528F8, type metadata accessor for BUIChartViewConfig.CachedNumberFormatter);
}

- (_TtCC14BatteryUsageUI18BUIChartViewConfig21CachedNumberFormatter)initWithCoder:(id)a3
{
  return (_TtCC14BatteryUsageUI18BUIChartViewConfig21CachedNumberFormatter *)sub_53254((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtCC14BatteryUsageUI18BUIChartViewConfig21CachedNumberFormatter_cache, (uint64_t (*)(void *))sub_528F8, type metadata accessor for BUIChartViewConfig.CachedNumberFormatter);
}

- (void).cxx_destruct
{
}

@end