@interface NSUnitEnergy
+ (BOOL)supportsRegionalPreference;
+ (NSUnitEnergy)calories;
+ (NSUnitEnergy)joules;
+ (NSUnitEnergy)kilocalories;
+ (NSUnitEnergy)kilojoules;
+ (NSUnitEnergy)kilowattHours;
+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4;
+ (id)baseUnit;
+ (id)foodcalories;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitEnergy

+ (BOOL)supportsRegionalPreference
{
  return 1;
}

+ (void)initialize
{
  if (NSUnitEnergy == a1) {
    objc_opt_class();
  }
}

+ (id)baseUnit
{
  return +[NSUnitEnergy joules];
}

+ (id)icuType
{
  return @"energy";
}

+ (NSUnitEnergy)kilojoules
{
  return (NSUnitEnergy *)&kilojoules__struct_kJ;
}

+ (NSUnitEnergy)joules
{
  return (NSUnitEnergy *)&joules__struct_joule;
}

+ (NSUnitEnergy)kilocalories
{
  return (NSUnitEnergy *)&kilocalories__struct_kCal;
}

+ (id)foodcalories
{
  return &foodcalories__struct_c;
}

+ (NSUnitEnergy)calories
{
  return (NSUnitEnergy *)&calories__struct_cal;
}

+ (NSUnitEnergy)kilowattHours
{
  return (NSUnitEnergy *)&kilowattHours__struct_kWh;
}

+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4
{
  id v4 = a3;
  if (a4 - 1 >= 2)
  {
    if (!a4)
    {
      if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitEnergy baseUnit](NSUnitEnergy, "baseUnit")) & 1) == 0)id v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitEnergy baseUnit](NSUnitEnergy, "baseUnit")); {
      [v4 doubleValue];
      }
      if (v7 >= 1000.0)
      {
        v6 = +[NSUnitEnergy kilojoules];
        goto LABEL_12;
      }
    }
    return v4;
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitEnergy calories](NSUnitEnergy, "calories")) & 1) == 0)id v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitEnergy calories](NSUnitEnergy, "calories")); {
  [v4 doubleValue];
  }
  if (v5 < 1000.0) {
    return v4;
  }
  v6 = +[NSUnitEnergy kilocalories];
LABEL_12:

  return (id)[v4 measurementByConvertingToUnit:v6];
}

@end