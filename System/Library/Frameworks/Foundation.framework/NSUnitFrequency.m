@interface NSUnitFrequency
+ (NSUnitFrequency)framesPerSecond;
+ (NSUnitFrequency)gigahertz;
+ (NSUnitFrequency)hertz;
+ (NSUnitFrequency)kilohertz;
+ (NSUnitFrequency)megahertz;
+ (NSUnitFrequency)microhertz;
+ (NSUnitFrequency)millihertz;
+ (NSUnitFrequency)nanohertz;
+ (NSUnitFrequency)terahertz;
+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4;
+ (id)baseUnit;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitFrequency

+ (void)initialize
{
  if (NSUnitFrequency == a1) {
    objc_opt_class();
  }
}

+ (id)baseUnit
{
  return +[NSUnitFrequency hertz];
}

+ (id)icuType
{
  return @"frequency";
}

+ (NSUnitFrequency)terahertz
{
  return (NSUnitFrequency *)&terahertz__struct_THz;
}

+ (NSUnitFrequency)gigahertz
{
  return (NSUnitFrequency *)&gigahertz__struct_GHz;
}

+ (NSUnitFrequency)megahertz
{
  return (NSUnitFrequency *)&megahertz__struct_MHz;
}

+ (NSUnitFrequency)kilohertz
{
  return (NSUnitFrequency *)&kilohertz__struct_kHz;
}

+ (NSUnitFrequency)hertz
{
  return (NSUnitFrequency *)&hertz__struct_Hz;
}

+ (NSUnitFrequency)millihertz
{
  return (NSUnitFrequency *)&millihertz__struct_mHz;
}

+ (NSUnitFrequency)microhertz
{
  return (NSUnitFrequency *)&microhertz__struct_microHz;
}

+ (NSUnitFrequency)nanohertz
{
  return (NSUnitFrequency *)&nanohertz__struct_nHz;
}

+ (NSUnitFrequency)framesPerSecond
{
  return (NSUnitFrequency *)&framesPerSecond__struct_framesPerSecond;
}

+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4
{
  id v4 = a3;
  if (a4) {
    return v4;
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitFrequency baseUnit](NSUnitFrequency, "baseUnit")) & 1) == 0)id v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitFrequency baseUnit](NSUnitFrequency, "baseUnit")); {
  [v4 doubleValue];
  }
  if (v6 >= 1000.0)
  {
    v7 = +[NSUnitFrequency kilohertz];
  }
  else
  {
    if (v6 > 0.001) {
      return v4;
    }
    v7 = +[NSUnitFrequency millihertz];
  }

  return (id)[v4 measurementByConvertingToUnit:v7];
}

@end