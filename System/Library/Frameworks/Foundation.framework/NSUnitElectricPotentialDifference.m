@interface NSUnitElectricPotentialDifference
+ (NSUnitElectricPotentialDifference)kilovolts;
+ (NSUnitElectricPotentialDifference)megavolts;
+ (NSUnitElectricPotentialDifference)microvolts;
+ (NSUnitElectricPotentialDifference)millivolts;
+ (NSUnitElectricPotentialDifference)volts;
+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4;
+ (id)baseUnit;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitElectricPotentialDifference

+ (void)initialize
{
  if (NSUnitElectricPotentialDifference == a1) {
    objc_opt_class();
  }
}

+ (id)baseUnit
{
  return +[NSUnitElectricPotentialDifference volts];
}

+ (id)icuType
{
  return @"electric";
}

+ (NSUnitElectricPotentialDifference)megavolts
{
  return (NSUnitElectricPotentialDifference *)&megavolts__struct_MV;
}

+ (NSUnitElectricPotentialDifference)kilovolts
{
  return (NSUnitElectricPotentialDifference *)&kilovolts__struct_kV;
}

+ (NSUnitElectricPotentialDifference)volts
{
  return (NSUnitElectricPotentialDifference *)&volts__struct_volt;
}

+ (NSUnitElectricPotentialDifference)millivolts
{
  return (NSUnitElectricPotentialDifference *)&millivolts__struct_mV;
}

+ (NSUnitElectricPotentialDifference)microvolts
{
  return (NSUnitElectricPotentialDifference *)&microvolts__struct_microV;
}

+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4
{
  id v4 = a3;
  if (a4) {
    return v4;
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitElectricPotentialDifference baseUnit](NSUnitElectricPotentialDifference, "baseUnit")) & 1) == 0)id v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitElectricPotentialDifference baseUnit](NSUnitElectricPotentialDifference, "baseUnit")); {
  [v4 doubleValue];
  }
  if (v6 >= 1000.0)
  {
    v7 = +[NSUnitElectricPotentialDifference kilovolts];
  }
  else
  {
    if (v6 > 0.001) {
      return v4;
    }
    v7 = +[NSUnitElectricPotentialDifference millivolts];
  }

  return (id)[v4 measurementByConvertingToUnit:v7];
}

@end