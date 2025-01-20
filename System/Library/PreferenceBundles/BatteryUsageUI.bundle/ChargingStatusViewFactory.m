@interface ChargingStatusViewFactory
+ (id)create;
- (_TtC14BatteryUsageUI25ChargingStatusViewFactory)init;
@end

@implementation ChargingStatusViewFactory

+ (id)create
{
  id v2 = sub_4BB90();

  return v2;
}

- (_TtC14BatteryUsageUI25ChargingStatusViewFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ChargingStatusViewFactory();
  return [(ChargingStatusViewFactory *)&v3 init];
}

@end