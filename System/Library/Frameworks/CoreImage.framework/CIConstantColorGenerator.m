@interface CIConstantColorGenerator
+ (id)customAttributes;
- (CIColor)inputColor;
- (id)outputImage;
- (void)setInputColor:(id)a3;
@end

@implementation CIConstantColorGenerator

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryGenerator";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryHighDynamicRange";
  v5[4] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:5];
  v7[1] = @"5";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.4";
  v6[3] = @"inputColor";
  v3[1] = @"CIAttributeType";
  v4[0] = +[CIColor colorWithRed:1.0, 0.0, 0.0, @"CIAttributeDefault" green blue];
  v4[1] = @"CIAttributeTypeColor";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (id)outputImage
{
  return +[CIImage imageWithColor:self->inputColor];
}

- (CIColor)inputColor
{
  return self->inputColor;
}

- (void)setInputColor:(id)a3
{
}

@end