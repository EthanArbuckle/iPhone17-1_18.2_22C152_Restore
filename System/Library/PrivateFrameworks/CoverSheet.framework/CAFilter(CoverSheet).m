@interface CAFilter(CoverSheet)
+ (id)brightnessFilterWithAmount:()CoverSheet;
+ (id)curvesFilterWithValues:()CoverSheet;
+ (id)gaussianFilterWithInputRadius:()CoverSheet;
+ (id)saturationFilterWithAmount:()CoverSheet;
@end

@implementation CAFilter(CoverSheet)

+ (id)gaussianFilterWithInputRadius:()CoverSheet
{
  id v2 = objc_alloc(MEMORY[0x1E4F39BC0]);
  v3 = (void *)[v2 initWithType:*MEMORY[0x1E4F3A0D0]];
  [v3 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputNormalizeEdges"];
  v4 = [NSNumber numberWithDouble:a1];
  [v3 setValue:v4 forKey:@"inputRadius"];

  [v3 setValue:@"medium" forKey:@"inputQuality"];

  return v3;
}

+ (id)brightnessFilterWithAmount:()CoverSheet
{
  id v2 = objc_alloc(MEMORY[0x1E4F39BC0]);
  v3 = (void *)[v2 initWithType:*MEMORY[0x1E4F3A000]];
  v4 = [NSNumber numberWithDouble:a1];
  [v3 setValue:v4 forKey:@"inputAmount"];

  return v3;
}

+ (id)saturationFilterWithAmount:()CoverSheet
{
  id v2 = objc_alloc(MEMORY[0x1E4F39BC0]);
  v3 = (void *)[v2 initWithType:*MEMORY[0x1E4F3A048]];
  v4 = [NSNumber numberWithDouble:a1];
  [v3 setValue:v4 forKey:@"inputAmount"];

  return v3;
}

+ (id)curvesFilterWithValues:()CoverSheet
{
  v3 = (objc_class *)MEMORY[0x1E4F39BC0];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = (void *)[v5 initWithType:*MEMORY[0x1E4F3A068]];
  [v6 setValue:v4 forKey:@"inputRedValues"];
  [v6 setValue:v4 forKey:@"inputGreenValues"];
  [v6 setValue:v4 forKey:@"inputBlueValues"];

  return v6;
}

@end