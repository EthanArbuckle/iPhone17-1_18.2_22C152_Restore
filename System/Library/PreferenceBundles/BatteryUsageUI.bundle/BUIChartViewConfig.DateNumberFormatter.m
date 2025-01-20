@interface BUIChartViewConfig.DateNumberFormatter
- (_TtCC14BatteryUsageUI18BUIChartViewConfig19DateNumberFormatter)init;
- (_TtCC14BatteryUsageUI18BUIChartViewConfig19DateNumberFormatter)initWithCoder:(id)a3;
- (id)stringForObjectValue:(id)a3;
@end

@implementation BUIChartViewConfig.DateNumberFormatter

- (_TtCC14BatteryUsageUI18BUIChartViewConfig19DateNumberFormatter)initWithCoder:(id)a3
{
  result = (_TtCC14BatteryUsageUI18BUIChartViewConfig19DateNumberFormatter *)sub_904C0();
  __break(1u);
  return result;
}

- (id)stringForObjectValue:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_90370();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  sub_52468((uint64_t)v8);

  sub_4AE2C((uint64_t)v8, &qword_D5C78);
  NSString v6 = sub_90010();
  swift_bridgeObjectRelease();

  return v6;
}

- (_TtCC14BatteryUsageUI18BUIChartViewConfig19DateNumberFormatter)init
{
  result = (_TtCC14BatteryUsageUI18BUIChartViewConfig19DateNumberFormatter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC14BatteryUsageUI18BUIChartViewConfig19DateNumberFormatter__formatter));
}

@end