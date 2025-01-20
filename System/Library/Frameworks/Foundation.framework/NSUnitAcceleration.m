@interface NSUnitAcceleration
+ (NSUnitAcceleration)gravity;
+ (NSUnitAcceleration)metersPerSecondSquared;
+ (id)baseUnit;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitAcceleration

+ (void)initialize
{
  if (NSUnitAcceleration == a1) {
    objc_opt_class();
  }
}

+ (id)baseUnit
{
  return +[NSUnitAcceleration metersPerSecondSquared];
}

+ (id)icuType
{
  return @"acceleration";
}

+ (NSUnitAcceleration)gravity
{
  return (NSUnitAcceleration *)&gravity__struct_gravity;
}

+ (NSUnitAcceleration)metersPerSecondSquared
{
  return (NSUnitAcceleration *)&metersPerSecondSquared__struct_mpss;
}

@end