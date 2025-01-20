@interface NSUnitSpeed(CAFUnit)
+ (id)metersPerHour;
@end

@implementation NSUnitSpeed(CAFUnit)

+ (id)metersPerHour
{
  if (metersPerHour_onceToken != -1) {
    dispatch_once(&metersPerHour_onceToken, &__block_literal_global_173);
  }
  v0 = (void *)metersPerHour_metersPerHour;
  return v0;
}

@end