@interface NSUnitElectricCurrent
+ (NSUnitElectricCurrent)amperes;
+ (NSUnitElectricCurrent)kiloamperes;
+ (NSUnitElectricCurrent)megaamperes;
+ (NSUnitElectricCurrent)microamperes;
+ (NSUnitElectricCurrent)milliamperes;
+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4;
+ (id)baseUnit;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitElectricCurrent

+ (void)initialize
{
  if (NSUnitElectricCurrent == a1) {
    objc_opt_class();
  }
}

+ (id)baseUnit
{
  return +[NSUnitElectricCurrent amperes];
}

+ (id)icuType
{
  return @"electric";
}

+ (NSUnitElectricCurrent)megaamperes
{
  return (NSUnitElectricCurrent *)&megaamperes__struct_MA;
}

+ (NSUnitElectricCurrent)kiloamperes
{
  return (NSUnitElectricCurrent *)&kiloamperes__struct_kA;
}

+ (NSUnitElectricCurrent)amperes
{
  return (NSUnitElectricCurrent *)&amperes__struct_amp;
}

+ (NSUnitElectricCurrent)milliamperes
{
  return (NSUnitElectricCurrent *)&milliamperes__struct_mA;
}

+ (NSUnitElectricCurrent)microamperes
{
  return (NSUnitElectricCurrent *)&microamperes__struct_microA;
}

+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4
{
  id v4 = a3;
  if (a4) {
    return v4;
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitElectricCurrent baseUnit](NSUnitElectricCurrent, "baseUnit")) & 1) == 0)id v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitElectricCurrent baseUnit](NSUnitElectricCurrent, "baseUnit")); {
  [v4 doubleValue];
  }
  if (v6 >= 1000.0)
  {
    v7 = +[NSUnitElectricCurrent kiloamperes];
  }
  else
  {
    if (v6 > 0.001) {
      return v4;
    }
    v7 = +[NSUnitElectricCurrent milliamperes];
  }

  return (id)[v4 measurementByConvertingToUnit:v7];
}

@end