@interface NSMeasurement(AccessoryNavigation)
- (uint64_t)accNav_safeToBeConvertedToUnit:()AccessoryNavigation;
@end

@implementation NSMeasurement(AccessoryNavigation)

- (uint64_t)accNav_safeToBeConvertedToUnit:()AccessoryNavigation
{
  id v4 = a3;
  v5 = [a1 unit];
  if (objc_opt_respondsToSelector())
  {
  }
  else
  {
    v6 = [a1 unit];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v8 = 0;
      goto LABEL_6;
    }
  }
  uint64_t v8 = [a1 canBeConvertedToUnit:v4];
LABEL_6:

  return v8;
}

@end