@interface CIGammaAdjust
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (NSNumber)inputPower;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputPower:(id)a3;
@end

@implementation CIGammaAdjust

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryColorAdjustment";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryInterlaced";
  v5[4] = @"CICategoryNonSquarePixels";
  v5[5] = @"CICategoryHighDynamicRange";
  v5[6] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:7];
  v7[1] = @"5";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.4";
  v6[3] = @"inputPower";
  v3[0] = @"CIAttributeSliderMin";
  v3[1] = @"CIAttributeSliderMax";
  v4[0] = &unk_1EE4A8C80;
  v4[1] = &unk_1EE4A8C90;
  v3[2] = @"CIAttributeDefault";
  v3[3] = @"CIAttributeIdentity";
  v4[2] = &unk_1EE4A8CA0;
  v4[3] = &unk_1EE4A8CA0;
  v3[4] = @"CIAttributeType";
  v4[4] = @"CIAttributeTypeScalar";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (BOOL)_isIdentity
{
  [(NSNumber *)self->inputPower doubleValue];
  return fabs(v2 + -1.0) < 0.01;
}

- (id)outputImage
{
  if (!self->inputImage) {
    return 0;
  }
  BOOL v3 = [(CIGammaAdjust *)self _isIdentity];
  inputImage = self->inputImage;
  if (v3)
  {
    v5 = inputImage;
    return v5;
  }
  else
  {
    [(NSNumber *)self->inputPower doubleValue];
    return -[CIImage _imageByApplyingGamma:](inputImage, "_imageByApplyingGamma:");
  }
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputPower
{
  return self->inputPower;
}

- (void)setInputPower:(id)a3
{
}

@end