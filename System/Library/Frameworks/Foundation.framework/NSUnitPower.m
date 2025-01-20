@interface NSUnitPower
+ (BOOL)supportsRegionalPreference;
+ (NSUnitPower)femtowatts;
+ (NSUnitPower)gigawatts;
+ (NSUnitPower)horsepower;
+ (NSUnitPower)kilowatts;
+ (NSUnitPower)megawatts;
+ (NSUnitPower)microwatts;
+ (NSUnitPower)milliwatts;
+ (NSUnitPower)nanowatts;
+ (NSUnitPower)picowatts;
+ (NSUnitPower)terawatts;
+ (NSUnitPower)watts;
+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4;
+ (id)baseUnit;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitPower

+ (BOOL)supportsRegionalPreference
{
  return 1;
}

+ (void)initialize
{
  if (NSUnitPower == a1) {
    objc_opt_class();
  }
}

+ (id)baseUnit
{
  return +[NSUnitPower watts];
}

+ (id)icuType
{
  return @"power";
}

+ (NSUnitPower)terawatts
{
  return (NSUnitPower *)&terawatts__struct_tw;
}

+ (NSUnitPower)gigawatts
{
  return (NSUnitPower *)&gigawatts__struct_gw;
}

+ (NSUnitPower)megawatts
{
  return (NSUnitPower *)&megawatts__struct_mw;
}

+ (NSUnitPower)kilowatts
{
  return (NSUnitPower *)&kilowatts__struct_kw;
}

+ (NSUnitPower)watts
{
  return (NSUnitPower *)&watts__struct_watt;
}

+ (NSUnitPower)milliwatts
{
  return (NSUnitPower *)&milliwatts__struct_mW;
}

+ (NSUnitPower)microwatts
{
  return (NSUnitPower *)&microwatts__struct_microW;
}

+ (NSUnitPower)nanowatts
{
  return (NSUnitPower *)&nanowatts__struct_nw;
}

+ (NSUnitPower)picowatts
{
  return (NSUnitPower *)&picowatts__struct_pw;
}

+ (NSUnitPower)femtowatts
{
  return (NSUnitPower *)&femtowatts__struct_fw;
}

+ (NSUnitPower)horsepower
{
  return (NSUnitPower *)&horsepower__struct_hp;
}

+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4
{
  id v4 = a3;
  if (a4) {
    return v4;
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitPower baseUnit](NSUnitPower, "baseUnit")) & 1) == 0)id v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitPower baseUnit](NSUnitPower, "baseUnit")); {
  [v4 doubleValue];
  }
  if (v6 >= 1000.0)
  {
    v7 = +[NSUnitPower kilowatts];
  }
  else
  {
    if (v6 > 0.001) {
      return v4;
    }
    v7 = +[NSUnitPower milliwatts];
  }

  return (id)[v4 measurementByConvertingToUnit:v7];
}

@end