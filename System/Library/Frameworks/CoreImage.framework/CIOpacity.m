@interface CIOpacity
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputOpacity;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputOpacity:(id)a3;
@end

@implementation CIOpacity

+ (id)customAttributes
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"CIAttributeFilterCategories";
  v6[0] = @"CICategoryColorAdjustment";
  v6[1] = @"CICategoryVideo";
  v6[2] = @"CICategoryStillImage";
  v6[3] = @"CICategoryInterlaced";
  v6[4] = @"CICategoryNonSquarePixels";
  v6[5] = @"CICategoryBuiltIn";
  v6[6] = @"CICategoryApplePrivate";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:7];
  v7[1] = @"inputOpacity";
  v8[0] = v2;
  v4[0] = @"CIAttributeSliderMin";
  v4[1] = @"CIAttributeSliderMax";
  v5[0] = &unk_1EE4A9560;
  v5[1] = &unk_1EE4A9570;
  v4[2] = @"CIAttributeMin";
  v4[3] = @"CIAttributeMax";
  v5[2] = &unk_1EE4A9560;
  v5[3] = &unk_1EE4A9570;
  v4[4] = @"CIAttributeDefault";
  v4[5] = @"CIAttributeIdentity";
  v5[4] = &unk_1EE4A9570;
  v5[5] = &unk_1EE4A9560;
  v4[6] = @"CIAttributeType";
  v5[6] = @"CIAttributeTypeScalar";
  v8[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:7];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
}

- (id)outputImage
{
  if (!self->inputImage) {
    return 0;
  }
  [(NSNumber *)self->inputOpacity floatValue];
  if (v3 == 1.0)
  {
    v4 = self->inputImage;
    return v4;
  }
  else if (v3 == 0.0)
  {
    return +[CIImage nullImage];
  }
  else
  {
    return [(CIImage *)self->inputImage filteredImage:@"CIColorMatrix", @"inputAVector", +[CIVector vectorWithX:0.0 Y:0.0 Z:0.0 W:v3], 0 keysAndValues];
  }
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputOpacity
{
  return self->inputOpacity;
}

- (void)setInputOpacity:(id)a3
{
}

@end