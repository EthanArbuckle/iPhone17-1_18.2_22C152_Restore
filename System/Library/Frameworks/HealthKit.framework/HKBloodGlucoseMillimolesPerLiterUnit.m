@interface HKBloodGlucoseMillimolesPerLiterUnit
@end

@implementation HKBloodGlucoseMillimolesPerLiterUnit

void ___HKBloodGlucoseMillimolesPerLiterUnit_block_invoke()
{
  id v3 = +[HKUnit moleUnitWithMetricPrefix:4 molarMass:180.15588];
  v0 = +[HKUnit literUnit];
  uint64_t v1 = [v3 unitDividedByUnit:v0];
  v2 = (void *)_HKBloodGlucoseMillimolesPerLiterUnit_glucoseUnit;
  _HKBloodGlucoseMillimolesPerLiterUnit_glucoseUnit = v1;
}

@end