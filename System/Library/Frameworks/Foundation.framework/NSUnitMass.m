@interface NSUnitMass
+ (BOOL)supportsRegionalPreference;
+ (NSUnitMass)carats;
+ (NSUnitMass)centigrams;
+ (NSUnitMass)decigrams;
+ (NSUnitMass)grams;
+ (NSUnitMass)kilograms;
+ (NSUnitMass)metricTons;
+ (NSUnitMass)micrograms;
+ (NSUnitMass)milligrams;
+ (NSUnitMass)nanograms;
+ (NSUnitMass)ounces;
+ (NSUnitMass)ouncesTroy;
+ (NSUnitMass)picograms;
+ (NSUnitMass)poundsMass;
+ (NSUnitMass)shortTons;
+ (NSUnitMass)slugs;
+ (NSUnitMass)stones;
+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4;
+ (id)baseUnit;
+ (id)icuType;
+ (void)initialize;
@end

@implementation NSUnitMass

+ (BOOL)supportsRegionalPreference
{
  return 1;
}

+ (void)initialize
{
  if (NSUnitMass == a1) {
    objc_opt_class();
  }
}

+ (id)baseUnit
{
  return +[NSUnitMass kilograms];
}

+ (id)icuType
{
  return @"mass";
}

+ (NSUnitMass)kilograms
{
  return (NSUnitMass *)&kilograms__struct_kg;
}

+ (NSUnitMass)grams
{
  return (NSUnitMass *)&grams__struct_gram;
}

+ (NSUnitMass)decigrams
{
  return (NSUnitMass *)&decigrams__struct_dg;
}

+ (NSUnitMass)centigrams
{
  return (NSUnitMass *)&centigrams__struct_cg;
}

+ (NSUnitMass)milligrams
{
  return (NSUnitMass *)&milligrams__struct_mg;
}

+ (NSUnitMass)micrograms
{
  return (NSUnitMass *)&micrograms__struct_microg;
}

+ (NSUnitMass)nanograms
{
  return (NSUnitMass *)&nanograms__struct_ng;
}

+ (NSUnitMass)picograms
{
  return (NSUnitMass *)&picograms__struct_pg;
}

+ (NSUnitMass)ounces
{
  return (NSUnitMass *)&ounces__struct_oz;
}

+ (NSUnitMass)poundsMass
{
  return (NSUnitMass *)&poundsMass__struct_lb;
}

+ (NSUnitMass)stones
{
  return (NSUnitMass *)&stones__struct_st;
}

+ (NSUnitMass)metricTons
{
  return (NSUnitMass *)&metricTons__struct_ton;
}

+ (NSUnitMass)shortTons
{
  return (NSUnitMass *)&shortTons__struct_ton;
}

+ (NSUnitMass)carats
{
  return (NSUnitMass *)&carats__struct_ct;
}

+ (NSUnitMass)ouncesTroy
{
  return (NSUnitMass *)&ouncesTroy__struct_ozt;
}

+ (NSUnitMass)slugs
{
  return (NSUnitMass *)&slugs__struct_slug;
}

+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4
{
  id v4 = a3;
  if (a4 == 2)
  {
    if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitMass poundsMass](NSUnitMass, "poundsMass")) & 1) == 0)id v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitMass poundsMass](NSUnitMass, "poundsMass")); {
    [v4 doubleValue];
    }
    if (v8 >= 1000.0)
    {
      v6 = +[NSUnitMass shortTons];
      goto LABEL_19;
    }
    if (v8 <= 0.9)
    {
      v6 = +[NSUnitMass ounces];
      goto LABEL_19;
    }
    return v4;
  }
  if (a4 == 1)
  {
    if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitMass stones](NSUnitMass, "stones")) & 1) == 0)id v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitMass stones](NSUnitMass, "stones")); {
    [v4 doubleValue];
    }
    if (v7 <= 0.25)
    {
      v6 = +[NSUnitMass ouncesTroy];
      goto LABEL_19;
    }
    return v4;
  }
  if (a4) {
    return v4;
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitMass baseUnit](NSUnitMass, "baseUnit")) & 1) == 0)id v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitMass baseUnit](NSUnitMass, "baseUnit")); {
  [v4 doubleValue];
  }
  if (v5 > 0.001) {
    return v4;
  }
  v6 = +[NSUnitMass grams];
LABEL_19:

  return (id)[v4 measurementByConvertingToUnit:v6];
}

@end