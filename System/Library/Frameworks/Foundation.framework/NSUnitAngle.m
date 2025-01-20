@interface NSUnitAngle
+ (NSUnitAngle)arcMinutes;
+ (NSUnitAngle)arcSeconds;
+ (NSUnitAngle)degrees;
+ (NSUnitAngle)gradians;
+ (NSUnitAngle)radians;
+ (NSUnitAngle)revolutions;
+ (id)baseUnit;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitAngle

+ (NSUnitAngle)degrees
{
  return (NSUnitAngle *)&degrees__struct_deg;
}

+ (id)icuType
{
  return @"angle";
}

+ (void)initialize
{
  if (NSUnitAngle == a1) {
    objc_opt_class();
  }
}

+ (id)baseUnit
{
  return +[NSUnitAngle degrees];
}

+ (NSUnitAngle)arcMinutes
{
  return (NSUnitAngle *)&arcMinutes__struct_arcMin;
}

+ (NSUnitAngle)arcSeconds
{
  return (NSUnitAngle *)&arcSeconds__struct_arcSec;
}

+ (NSUnitAngle)radians
{
  return (NSUnitAngle *)&radians__struct_rad;
}

+ (NSUnitAngle)gradians
{
  return (NSUnitAngle *)&gradians__struct_grad;
}

+ (NSUnitAngle)revolutions
{
  return (NSUnitAngle *)&revolutions__struct_rev;
}

@end