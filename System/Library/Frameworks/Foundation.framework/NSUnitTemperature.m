@interface NSUnitTemperature
+ (BOOL)supportsRegionalPreference;
+ (NSUnitTemperature)celsius;
+ (NSUnitTemperature)fahrenheit;
+ (NSUnitTemperature)kelvin;
+ (id)baseUnit;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitTemperature

+ (NSUnitTemperature)celsius
{
  return (NSUnitTemperature *)&celsius__struct_cels;
}

+ (NSUnitTemperature)kelvin
{
  return (NSUnitTemperature *)&kelvin__struct_kelv;
}

+ (id)baseUnit
{
  return +[NSUnitTemperature kelvin];
}

+ (NSUnitTemperature)fahrenheit
{
  return (NSUnitTemperature *)&fahrenheit__struct_fahr;
}

+ (id)icuType
{
  return @"temperature";
}

+ (void)initialize
{
  if (NSUnitTemperature == a1) {
    objc_opt_class();
  }
}

+ (BOOL)supportsRegionalPreference
{
  return 1;
}

@end