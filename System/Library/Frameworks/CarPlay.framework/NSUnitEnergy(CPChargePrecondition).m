@interface NSUnitEnergy(CPChargePrecondition)
+ (id)wattHours;
@end

@implementation NSUnitEnergy(CPChargePrecondition)

+ (id)wattHours
{
  if (wattHours_onceToken != -1) {
    dispatch_once(&wattHours_onceToken, &__block_literal_global_9);
  }
  v0 = (void *)wattHours__wattHours;

  return v0;
}

@end