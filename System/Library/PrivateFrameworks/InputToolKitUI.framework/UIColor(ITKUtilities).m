@interface UIColor(ITKUtilities)
+ (uint64_t)itk_colorWith256Red:()ITKUtilities green:blue:alpha:;
+ (uint64_t)itk_colorWith256Red:()ITKUtilities green:blue:unitAlpha:;
+ (uint64_t)itk_labelColor;
+ (uint64_t)itk_quaternaryLabelColor;
+ (uint64_t)itk_randomColor;
+ (uint64_t)itk_secondaryLabelColor;
+ (uint64_t)itk_tertiaryLabelColor;
- (id)itk_colorWithMaxSaturation;
- (uint64_t)itk_colorWith20PercentOpacity;
- (uint64_t)itk_colorWith40PercentOpacity;
- (uint64_t)itk_colorWith60PercentOpacity;
- (uint64_t)itk_colorWith80PercentOpacity;
- (uint64_t)itk_resolvedColor;
@end

@implementation UIColor(ITKUtilities)

+ (uint64_t)itk_randomColor
{
  double v0 = (double)arc4random_uniform(0xFFu) / 255.0;
  double v1 = (double)arc4random_uniform(0xFFu) / 255.0;
  double v2 = (double)arc4random_uniform(0xFFu) / 255.0;
  v3 = (void *)MEMORY[0x263F825C8];
  return [v3 colorWithRed:v0 green:v1 blue:v2 alpha:1.0];
}

- (uint64_t)itk_colorWith20PercentOpacity
{
  return [a1 colorWithAlphaComponent:0.2];
}

- (uint64_t)itk_colorWith40PercentOpacity
{
  return [a1 colorWithAlphaComponent:0.4];
}

- (uint64_t)itk_colorWith60PercentOpacity
{
  return [a1 colorWithAlphaComponent:0.6];
}

- (uint64_t)itk_colorWith80PercentOpacity
{
  return [a1 colorWithAlphaComponent:0.8];
}

- (id)itk_colorWithMaxSaturation
{
  double v6 = 0.0;
  double v4 = 0.0;
  uint64_t v5 = 0;
  double v3 = 0.0;
  [a1 getHue:&v6 saturation:&v5 brightness:&v4 alpha:&v3];
  double v1 = [MEMORY[0x263F825C8] colorWithHue:v6 saturation:1.0 brightness:v4 alpha:v3];
  return v1;
}

- (uint64_t)itk_resolvedColor
{
  double v1 = (void *)MEMORY[0x263F825C8];
  uint64_t v2 = [a1 CGColor];
  return [v1 colorWithCGColor:v2];
}

+ (uint64_t)itk_labelColor
{
  return [MEMORY[0x263F825C8] labelColor];
}

+ (uint64_t)itk_secondaryLabelColor
{
  return [MEMORY[0x263F825C8] secondaryLabelColor];
}

+ (uint64_t)itk_tertiaryLabelColor
{
  return [MEMORY[0x263F825C8] tertiaryLabelColor];
}

+ (uint64_t)itk_quaternaryLabelColor
{
  return [MEMORY[0x263F825C8] quaternaryLabelColor];
}

+ (uint64_t)itk_colorWith256Red:()ITKUtilities green:blue:alpha:
{
  return [MEMORY[0x263F825C8] colorWithRed:a1 / 255.0 green:a2 / 255.0 blue:a3 / 255.0 alpha:a4 / 255.0];
}

+ (uint64_t)itk_colorWith256Red:()ITKUtilities green:blue:unitAlpha:
{
  return objc_msgSend(MEMORY[0x263F825C8], "colorWithRed:green:blue:alpha:", a1 / 255.0, a2 / 255.0, a3 / 255.0);
}

@end