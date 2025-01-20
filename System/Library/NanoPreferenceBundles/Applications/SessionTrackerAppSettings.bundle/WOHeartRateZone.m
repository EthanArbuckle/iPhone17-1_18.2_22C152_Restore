@interface WOHeartRateZone
+ (id)zones:(id)a3 replacingZoneAtIndex:(int64_t)a4 withZone:(id)a5;
- (HKQuantity)lowerDisplayBound;
- (HKQuantity)upperDisplayBound;
- (NSString)description;
- (WOHeartRateZone)init;
- (double)lowerBoundMaximum;
- (double)lowerBoundMinimum;
- (double)upperBoundMaximum;
- (double)upperBoundMinimum;
- (id)zoneByMutatingLowerBound:(double)a3;
- (id)zoneByMutatingUpperBound:(double)a3;
- (int64_t)zoneCount;
- (int64_t)zoneIndex;
@end

@implementation WOHeartRateZone

- (id)zoneByMutatingLowerBound:(double)a3
{
  v4 = self;
  id v5 = sub_1BA74(a3);

  return v5;
}

- (id)zoneByMutatingUpperBound:(double)a3
{
  v4 = self;
  id v5 = sub_1BBAC(a3);

  return v5;
}

- (HKQuantity)lowerDisplayBound
{
  v2 = self;
  uint64_t v3 = sub_20230();
  if (v4)
  {
    id v7 = 0;
  }
  else
  {
    double v5 = *(double *)&v3;
    v6 = (WOHeartRateZone *)[self _countPerMinuteUnit];
    id v7 = [self quantityWithUnit:v6 doubleValue:v5];

    v2 = v6;
  }

  return (HKQuantity *)v7;
}

- (HKQuantity)upperDisplayBound
{
  v2 = self;
  uint64_t v3 = sub_20240();
  if (v4)
  {
    id v7 = 0;
  }
  else
  {
    double v5 = *(double *)&v3;
    v6 = (WOHeartRateZone *)[self _countPerMinuteUnit];
    id v7 = [self quantityWithUnit:v6 doubleValue:v5];

    v2 = v6;
  }

  return (HKQuantity *)v7;
}

- (int64_t)zoneIndex
{
  v2 = self;
  int64_t v3 = sub_20220();

  return v3;
}

- (int64_t)zoneCount
{
  v2 = self;
  sub_20220();
  int64_t v4 = v3;

  return v4;
}

- (double)lowerBoundMinimum
{
  return sub_1BF08(self, (uint64_t)a2, &enum case for HeartRateZone.Bound.lower(_:));
}

- (double)lowerBoundMaximum
{
  return sub_1C02C(self, (uint64_t)a2, &enum case for HeartRateZone.Bound.lower(_:));
}

- (double)upperBoundMinimum
{
  return sub_1BF08(self, (uint64_t)a2, &enum case for HeartRateZone.Bound.upper(_:));
}

- (double)upperBoundMaximum
{
  return sub_1C02C(self, (uint64_t)a2, &enum case for HeartRateZone.Bound.upper(_:));
}

- (NSString)description
{
  v2 = self;
  HeartRateZoneBridge.description.getter();

  NSString v3 = sub_20280();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

+ (id)zones:(id)a3 replacingZoneAtIndex:(int64_t)a4 withZone:(id)a5
{
  type metadata accessor for HeartRateZoneBridge();
  unint64_t v6 = sub_202E0();
  id v7 = a5;
  sub_1D218(v6);

  swift_bridgeObjectRelease();
  v8.super.isa = sub_202D0().super.isa;
  swift_bridgeObjectRelease();

  return v8.super.isa;
}

- (WOHeartRateZone)init
{
  result = (WOHeartRateZone *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end