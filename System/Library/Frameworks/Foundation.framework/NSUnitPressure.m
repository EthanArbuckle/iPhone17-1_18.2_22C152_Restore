@interface NSUnitPressure
+ (BOOL)supportsRegionalPreference;
+ (NSUnitPressure)bars;
+ (NSUnitPressure)gigapascals;
+ (NSUnitPressure)hectopascals;
+ (NSUnitPressure)inchesOfMercury;
+ (NSUnitPressure)kilopascals;
+ (NSUnitPressure)megapascals;
+ (NSUnitPressure)millibars;
+ (NSUnitPressure)millimetersOfMercury;
+ (NSUnitPressure)newtonsPerMetersSquared;
+ (NSUnitPressure)poundsForcePerSquareInch;
+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4;
+ (id)baseUnit;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitPressure

+ (NSUnitPressure)millibars
{
  return (NSUnitPressure *)&millibars__struct_mbar;
}

+ (NSUnitPressure)inchesOfMercury
{
  return (NSUnitPressure *)&inchesOfMercury__struct_inHg;
}

+ (NSUnitPressure)newtonsPerMetersSquared
{
  return (NSUnitPressure *)&newtonsPerMetersSquared__struct_nms;
}

+ (id)baseUnit
{
  return +[NSUnitPressure newtonsPerMetersSquared];
}

+ (id)icuType
{
  return @"pressure";
}

+ (NSUnitPressure)megapascals
{
  return (NSUnitPressure *)&megapascals__struct_MPa;
}

+ (NSUnitPressure)kilopascals
{
  return (NSUnitPressure *)&kilopascals__struct_kPa;
}

+ (NSUnitPressure)hectopascals
{
  return (NSUnitPressure *)&hectopascals__struct_hPa;
}

+ (NSUnitPressure)gigapascals
{
  return (NSUnitPressure *)&gigapascals__struct_GPa;
}

+ (NSUnitPressure)millimetersOfMercury
{
  return (NSUnitPressure *)&millimetersOfMercury__struct_mmHg;
}

+ (NSUnitPressure)bars
{
  return (NSUnitPressure *)&bars__struct_bar;
}

+ (void)initialize
{
  if (NSUnitPressure == a1) {
    objc_opt_class();
  }
}

+ (BOOL)supportsRegionalPreference
{
  return 1;
}

+ (NSUnitPressure)poundsForcePerSquareInch
{
  return (NSUnitPressure *)&poundsForcePerSquareInch__struct_psi;
}

+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4
{
  id v4 = a3;
  if (a4) {
    return v4;
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitPressure baseUnit](NSUnitPressure, "baseUnit")) & 1) == 0)id v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitPressure baseUnit](NSUnitPressure, "baseUnit")); {
  [v4 doubleValue];
  }
  if (v5 < 1000.0) {
    return v4;
  }
  v7 = +[NSUnitPressure kilopascals];

  return (id)[v4 measurementByConvertingToUnit:v7];
}

@end