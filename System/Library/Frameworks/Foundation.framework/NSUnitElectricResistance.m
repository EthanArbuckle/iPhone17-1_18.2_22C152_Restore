@interface NSUnitElectricResistance
+ (NSUnitElectricResistance)kiloohms;
+ (NSUnitElectricResistance)megaohms;
+ (NSUnitElectricResistance)microohms;
+ (NSUnitElectricResistance)milliohms;
+ (NSUnitElectricResistance)ohms;
+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4;
+ (id)baseUnit;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitElectricResistance

+ (void)initialize
{
  if (NSUnitElectricResistance == a1) {
    objc_opt_class();
  }
}

+ (id)baseUnit
{
  return +[NSUnitElectricResistance ohms];
}

+ (id)icuType
{
  return @"electric";
}

+ (NSUnitElectricResistance)megaohms
{
  return (NSUnitElectricResistance *)&megaohms__struct_MO;
}

+ (NSUnitElectricResistance)kiloohms
{
  return (NSUnitElectricResistance *)&kiloohms__struct_kO;
}

+ (NSUnitElectricResistance)ohms
{
  return (NSUnitElectricResistance *)&ohms__struct_ohm;
}

+ (NSUnitElectricResistance)milliohms
{
  return (NSUnitElectricResistance *)&milliohms__struct_mO;
}

+ (NSUnitElectricResistance)microohms
{
  return (NSUnitElectricResistance *)&microohms__struct_microO;
}

+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4
{
  id v4 = a3;
  if (a4) {
    return v4;
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitElectricResistance baseUnit](NSUnitElectricResistance, "baseUnit")) & 1) == 0)id v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitElectricResistance baseUnit](NSUnitElectricResistance, "baseUnit")); {
  [v4 doubleValue];
  }
  if (v6 >= 1000.0)
  {
    v7 = +[NSUnitElectricResistance kiloohms];
  }
  else
  {
    if (v6 > 0.001) {
      return v4;
    }
    v7 = +[NSUnitElectricResistance milliohms];
  }

  return (id)[v4 measurementByConvertingToUnit:v7];
}

@end