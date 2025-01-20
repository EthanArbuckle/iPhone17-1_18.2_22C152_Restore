@interface NSUnitEnergy(CAFUnit)
+ (id)milliwattHours;
+ (id)wattHours;
@end

@implementation NSUnitEnergy(CAFUnit)

+ (id)wattHours
{
  if (wattHours_onceToken != -1) {
    dispatch_once(&wattHours_onceToken, &__block_literal_global_68);
  }
  v0 = (void *)wattHours__wattHours;
  return v0;
}

+ (id)milliwattHours
{
  if (milliwattHours_onceToken != -1) {
    dispatch_once(&milliwattHours_onceToken, &__block_literal_global_74);
  }
  v0 = (void *)milliwattHours__wattHours;
  return v0;
}

@end