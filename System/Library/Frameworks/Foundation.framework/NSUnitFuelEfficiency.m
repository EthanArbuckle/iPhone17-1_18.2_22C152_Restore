@interface NSUnitFuelEfficiency
+ (BOOL)supportsRegionalPreference;
+ (NSUnitFuelEfficiency)litersPer100Kilometers;
+ (NSUnitFuelEfficiency)milesPerGallon;
+ (NSUnitFuelEfficiency)milesPerImperialGallon;
+ (id)baseUnit;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitFuelEfficiency

+ (BOOL)supportsRegionalPreference
{
  return 1;
}

+ (void)initialize
{
  if (NSUnitFuelEfficiency == a1) {
    objc_opt_class();
  }
}

+ (id)baseUnit
{
  return +[NSUnitFuelEfficiency litersPer100Kilometers];
}

+ (id)icuType
{
  return @"consumption";
}

+ (NSUnitFuelEfficiency)milesPerImperialGallon
{
  if (qword_1E8EECD78 != -1) {
    dispatch_once(&qword_1E8EECD78, &__block_literal_global_14);
  }
  return (NSUnitFuelEfficiency *)_MergedGlobals_49;
}

NSUnitFuelEfficiency *__46__NSUnitFuelEfficiency_milesPerImperialGallon__block_invoke()
{
  result = [(NSDimension *)[NSUnitFuelEfficiency alloc] initWithSpecifier:3331 symbol:@"mpg" converter:[[NSUnitConverterReciprocal alloc] initWithReciprocalValue:282.481]];
  _MergedGlobals_49 = (uint64_t)result;
  return result;
}

+ (NSUnitFuelEfficiency)milesPerGallon
{
  if (qword_1E8EECD88 != -1) {
    dispatch_once(&qword_1E8EECD88, &__block_literal_global_868);
  }
  return (NSUnitFuelEfficiency *)qword_1E8EECD80;
}

NSUnitFuelEfficiency *__38__NSUnitFuelEfficiency_milesPerGallon__block_invoke()
{
  result = [(NSDimension *)[NSUnitFuelEfficiency alloc] initWithSpecifier:3329 symbol:@"mpg" converter:[[NSUnitConverterReciprocal alloc] initWithReciprocalValue:235.215]];
  qword_1E8EECD80 = (uint64_t)result;
  return result;
}

+ (NSUnitFuelEfficiency)litersPer100Kilometers
{
  return (NSUnitFuelEfficiency *)&litersPer100Kilometers__struct_lpkm;
}

@end