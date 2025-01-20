@interface WOFunctionalThresholdPower
- (BOOL)isAvailable;
- (HKQuantity)quantity;
- (NSDate)creationDate;
- (WOFunctionalThresholdPower)init;
- (double)value;
@end

@implementation WOFunctionalThresholdPower

- (HKQuantity)quantity
{
  v3 = self;
  v4 = self;
  id v5 = [v3 wattUnit];
  sub_20080();
  id v7 = [self quantityWithUnit:v5 doubleValue:v6];

  return (HKQuantity *)v7;
}

- (BOOL)isAvailable
{
  v2 = self;
  char v3 = sub_20050();

  return v3 & 1;
}

- (NSDate)creationDate
{
  uint64_t v3 = sub_1FD90();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  double v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = self;
  sub_20060();

  v8.super.isa = sub_1FD60().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSDate *)v8.super.isa;
}

- (double)value
{
  v2 = self;
  sub_20080();
  double v4 = v3;

  return v4;
}

- (WOFunctionalThresholdPower)init
{
  result = (WOFunctionalThresholdPower *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end