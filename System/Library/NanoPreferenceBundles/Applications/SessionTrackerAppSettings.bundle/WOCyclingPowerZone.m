@interface WOCyclingPowerZone
- (BOOL)isEmpty;
- (BOOL)isFTPRange;
- (HKQuantity)lowerBound;
- (HKQuantity)upperBound;
- (WOCyclingPowerZone)init;
- (double)percentageLowerBound;
- (double)percentageUpperBound;
- (int64_t)index;
@end

@implementation WOCyclingPowerZone

- (HKQuantity)lowerBound
{
  v2 = self;
  v3 = (void *)sub_1FEE0();

  return (HKQuantity *)v3;
}

- (HKQuantity)upperBound
{
  v2 = self;
  v3 = (void *)sub_1FEF0();

  return (HKQuantity *)v3;
}

- (double)percentageLowerBound
{
  sub_20200();
  v3 = self;
  sub_1FF00();
  sub_201F0();
  double v5 = v4;

  return v5;
}

- (double)percentageUpperBound
{
  sub_20200();
  v3 = self;
  sub_1FF00();
  sub_201F0();
  double v5 = v4;

  return v5;
}

- (int64_t)index
{
  v2 = self;
  int64_t v3 = sub_20220();

  return v3;
}

- (BOOL)isEmpty
{
  v2 = self;
  char v3 = sub_1FF10();

  return v3 & 1;
}

- (BOOL)isFTPRange
{
  v2 = self;
  sub_1FF00();
  double v4 = v3;
  double v6 = v5;

  return v6 > 1.0 && v4 <= 1.0;
}

- (WOCyclingPowerZone)init
{
  result = (WOCyclingPowerZone *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end