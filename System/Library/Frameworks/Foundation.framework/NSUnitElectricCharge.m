@interface NSUnitElectricCharge
+ (NSUnitElectricCharge)ampereHours;
+ (NSUnitElectricCharge)coulombs;
+ (NSUnitElectricCharge)kiloampereHours;
+ (NSUnitElectricCharge)megaampereHours;
+ (NSUnitElectricCharge)microampereHours;
+ (NSUnitElectricCharge)milliampereHours;
+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4;
+ (id)baseUnit;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitElectricCharge

+ (void)initialize
{
  if (NSUnitElectricCharge == a1) {
    objc_opt_class();
  }
}

+ (id)baseUnit
{
  return +[NSUnitElectricCharge coulombs];
}

+ (id)icuType
{
  return @"electric";
}

+ (NSUnitElectricCharge)coulombs
{
  return (NSUnitElectricCharge *)&coulombs__struct_coul;
}

+ (NSUnitElectricCharge)megaampereHours
{
  return (NSUnitElectricCharge *)&megaampereHours__struct_MAh;
}

+ (NSUnitElectricCharge)kiloampereHours
{
  return (NSUnitElectricCharge *)&kiloampereHours__struct_kAh;
}

+ (NSUnitElectricCharge)ampereHours
{
  return (NSUnitElectricCharge *)&ampereHours__struct_Ah;
}

+ (NSUnitElectricCharge)milliampereHours
{
  return (NSUnitElectricCharge *)&milliampereHours__struct_mAh;
}

+ (NSUnitElectricCharge)microampereHours
{
  return (NSUnitElectricCharge *)&microampereHours__struct_microAh;
}

+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4
{
  id v4 = a3;
  if (a4) {
    return v4;
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitElectricCharge baseUnit](NSUnitElectricCharge, "baseUnit")) & 1) == 0)id v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitElectricCharge baseUnit](NSUnitElectricCharge, "baseUnit")); {
  [v4 doubleValue];
  }
  if (v6 >= 1000.0)
  {
    v7 = +[NSUnitElectricCharge kiloampereHours];
  }
  else
  {
    if (v6 > 0.001) {
      return v4;
    }
    v7 = +[NSUnitElectricCharge milliampereHours];
  }

  return (id)[v4 measurementByConvertingToUnit:v7];
}

@end