@interface NSUnitDuration
+ (NSUnitDuration)hours;
+ (NSUnitDuration)microseconds;
+ (NSUnitDuration)milliseconds;
+ (NSUnitDuration)minutes;
+ (NSUnitDuration)nanoseconds;
+ (NSUnitDuration)picoseconds;
+ (NSUnitDuration)seconds;
+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4;
+ (id)baseUnit;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitDuration

+ (NSUnitDuration)seconds
{
  return (NSUnitDuration *)&seconds__struct_sec;
}

+ (id)baseUnit
{
  return +[NSUnitDuration seconds];
}

+ (id)icuType
{
  return @"duration";
}

+ (NSUnitDuration)nanoseconds
{
  return (NSUnitDuration *)&nanoseconds__struct_nanoseconds;
}

+ (NSUnitDuration)milliseconds
{
  return (NSUnitDuration *)&milliseconds__struct_milliseconds;
}

+ (void)initialize
{
  if (NSUnitDuration == a1) {
    objc_opt_class();
  }
}

+ (NSUnitDuration)hours
{
  return (NSUnitDuration *)&hours__struct_hour;
}

+ (NSUnitDuration)minutes
{
  return (NSUnitDuration *)&minutes__struct_min;
}

+ (NSUnitDuration)microseconds
{
  return (NSUnitDuration *)&microseconds__struct_microseconds;
}

+ (NSUnitDuration)picoseconds
{
  return (NSUnitDuration *)&picoseconds__struct_picoseconds;
}

+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4
{
  id v4 = a3;
  if (a4 != 3) {
    return v4;
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitDuration baseUnit](NSUnitDuration, "baseUnit")) & 1) == 0)id v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitDuration baseUnit](NSUnitDuration, "baseUnit")); {
  [v4 doubleValue];
  }
  if (v5 >= 3600.0)
  {
    v8 = +[NSUnitDuration hours];
    goto LABEL_12;
  }
  if (v5 > 3600.0 || v5 < 60.0) {
    return v4;
  }
  v8 = +[NSUnitDuration minutes];
LABEL_12:

  return (id)[v4 measurementByConvertingToUnit:v8];
}

@end