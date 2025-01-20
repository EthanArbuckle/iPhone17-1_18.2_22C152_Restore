@interface NSUnitFuelEfficiency(CAFUnit)
+ (id)millilitersPer100Kilometers;
@end

@implementation NSUnitFuelEfficiency(CAFUnit)

+ (id)millilitersPer100Kilometers
{
  if (millilitersPer100Kilometers_onceToken != -1) {
    dispatch_once(&millilitersPer100Kilometers_onceToken, &__block_literal_global_134);
  }
  v0 = (void *)millilitersPer100Kilometers__millilitersPer100Kilometers;
  return v0;
}

@end