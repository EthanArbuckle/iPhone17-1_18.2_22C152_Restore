@interface CAFilter(AmbientUI)
+ (id)brightnessFilterWithAmount:()AmbientUI;
+ (id)curvesFilterWithValues:()AmbientUI;
+ (id)gaussianFilterWithInputRadius:()AmbientUI;
+ (id)saturationFilterWithAmount:()AmbientUI;
@end

@implementation CAFilter(AmbientUI)

+ (id)gaussianFilterWithInputRadius:()AmbientUI
{
  id v2 = objc_alloc(MEMORY[0x263F157C8]);
  v3 = (void *)[v2 initWithType:*MEMORY[0x263F15BC8]];
  [v3 setValue:MEMORY[0x263EFFA88] forKey:@"inputNormalizeEdges"];
  v4 = [NSNumber numberWithDouble:a1];
  [v3 setValue:v4 forKey:@"inputRadius"];

  [v3 setValue:@"medium" forKey:@"inputQuality"];

  return v3;
}

+ (id)brightnessFilterWithAmount:()AmbientUI
{
  id v2 = objc_alloc(MEMORY[0x263F157C8]);
  v3 = (void *)[v2 initWithType:*MEMORY[0x263F15B10]];
  v4 = [NSNumber numberWithDouble:a1];
  [v3 setValue:v4 forKey:@"inputAmount"];

  return v3;
}

+ (id)saturationFilterWithAmount:()AmbientUI
{
  id v2 = objc_alloc(MEMORY[0x263F157C8]);
  v3 = (void *)[v2 initWithType:*MEMORY[0x263F15B50]];
  v4 = [NSNumber numberWithDouble:a1];
  [v3 setValue:v4 forKey:@"inputAmount"];

  return v3;
}

+ (id)curvesFilterWithValues:()AmbientUI
{
  v3 = (objc_class *)MEMORY[0x263F157C8];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = (void *)[v5 initWithType:*MEMORY[0x263F15B68]];
  [v6 setValue:v4 forKey:@"inputRedValues"];
  [v6 setValue:v4 forKey:@"inputGreenValues"];
  [v6 setValue:v4 forKey:@"inputBlueValues"];

  return v6;
}

@end