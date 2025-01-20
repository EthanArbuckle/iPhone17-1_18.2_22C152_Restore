@interface NSUnitArea
+ (BOOL)supportsRegionalPreference;
+ (NSUnitArea)acres;
+ (NSUnitArea)ares;
+ (NSUnitArea)hectares;
+ (NSUnitArea)squareCentimeters;
+ (NSUnitArea)squareFeet;
+ (NSUnitArea)squareInches;
+ (NSUnitArea)squareKilometers;
+ (NSUnitArea)squareMegameters;
+ (NSUnitArea)squareMeters;
+ (NSUnitArea)squareMicrometers;
+ (NSUnitArea)squareMiles;
+ (NSUnitArea)squareMillimeters;
+ (NSUnitArea)squareNanometers;
+ (NSUnitArea)squareYards;
+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4;
+ (id)baseUnit;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitArea

+ (BOOL)supportsRegionalPreference
{
  return 1;
}

+ (void)initialize
{
  if (NSUnitArea == a1) {
    objc_opt_class();
  }
}

+ (id)baseUnit
{
  return +[NSUnitArea squareMeters];
}

+ (id)icuType
{
  return @"area";
}

+ (NSUnitArea)squareMegameters
{
  return (NSUnitArea *)&squareMegameters__struct_sqMm;
}

+ (NSUnitArea)squareKilometers
{
  return (NSUnitArea *)&squareKilometers__struct_sqkm;
}

+ (NSUnitArea)squareMeters
{
  return (NSUnitArea *)&squareMeters__struct_sqm;
}

+ (NSUnitArea)squareCentimeters
{
  return (NSUnitArea *)&squareCentimeters__struct_sqcm;
}

+ (NSUnitArea)squareMillimeters
{
  return (NSUnitArea *)&squareMillimeters__struct_sqmm;
}

+ (NSUnitArea)squareMicrometers
{
  return (NSUnitArea *)&squareMicrometers__struct_sqMicrom;
}

+ (NSUnitArea)squareNanometers
{
  return (NSUnitArea *)&squareNanometers__struct_sqnm;
}

+ (NSUnitArea)squareInches
{
  return (NSUnitArea *)&squareInches__struct_sqin;
}

+ (NSUnitArea)squareFeet
{
  return (NSUnitArea *)&squareFeet__struct_sqft;
}

+ (NSUnitArea)squareYards
{
  return (NSUnitArea *)&squareYards__struct_sqyd;
}

+ (NSUnitArea)squareMiles
{
  return (NSUnitArea *)&squareMiles__struct_sqmi;
}

+ (NSUnitArea)acres
{
  return (NSUnitArea *)&acres__struct_ac;
}

+ (NSUnitArea)ares
{
  return (NSUnitArea *)&ares__struct_are;
}

+ (NSUnitArea)hectares
{
  return (NSUnitArea *)&hectares__struct_ha;
}

+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4
{
  id v4 = a3;
  if (a4 - 1 >= 2)
  {
    if (!a4)
    {
      if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitArea baseUnit](NSUnitArea, "baseUnit")) & 1) == 0)id v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitArea baseUnit](NSUnitArea, "baseUnit")); {
      [v4 doubleValue];
      }
      if (v7 >= 1000.0)
      {
        v6 = +[NSUnitArea squareKilometers];
        goto LABEL_18;
      }
      if (v7 <= 0.001)
      {
        v6 = +[NSUnitArea squareCentimeters];
        goto LABEL_18;
      }
    }
    return v4;
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitArea squareFeet](NSUnitArea, "squareFeet")) & 1) == 0)id v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitArea squareFeet](NSUnitArea, "squareFeet")); {
  [v4 doubleValue];
  }
  if (v5 >= 27880000.0)
  {
    v6 = +[NSUnitArea squareMiles];
    goto LABEL_18;
  }
  if (v5 >= 900.0)
  {
    v6 = +[NSUnitArea squareYards];
    goto LABEL_18;
  }
  if (v5 > 0.5) {
    return v4;
  }
  v6 = +[NSUnitArea squareInches];
LABEL_18:

  return (id)[v4 measurementByConvertingToUnit:v6];
}

@end