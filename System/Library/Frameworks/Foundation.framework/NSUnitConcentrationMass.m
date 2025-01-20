@interface NSUnitConcentrationMass
+ (BOOL)supportsRegionalPreference;
+ (NSUnitConcentrationMass)gramsPerLiter;
+ (NSUnitConcentrationMass)milligramsPerDeciliter;
+ (NSUnitConcentrationMass)millimolesPerLiterWithGramsPerMole:(double)gramsPerMole;
+ (id)baseUnit;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitConcentrationMass

+ (void)initialize
{
  if (NSUnitConcentrationMass == a1) {
    objc_opt_class();
  }
}

+ (BOOL)supportsRegionalPreference
{
  return 1;
}

+ (id)baseUnit
{
  return +[NSUnitConcentrationMass gramsPerLiter];
}

+ (id)icuType
{
  return @"concentr";
}

+ (NSUnitConcentrationMass)gramsPerLiter
{
  return (NSUnitConcentrationMass *)&gramsPerLiter__struct_gpl;
}

+ (NSUnitConcentrationMass)milligramsPerDeciliter
{
  return (NSUnitConcentrationMass *)&milligramsPerDeciliter__struct_mgpd;
}

+ (NSUnitConcentrationMass)millimolesPerLiterWithGramsPerMole:(double)gramsPerMole
{
  v3 = [(NSDimension *)[NSUnitConcentrationMass alloc] initWithSpecifier:4610 symbol:@"mmol/L" converter:[[NSUnitConverterLinear alloc] initWithCoefficient:gramsPerMole * 0.001]];

  return v3;
}

@end