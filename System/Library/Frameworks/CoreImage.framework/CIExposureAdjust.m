@interface CIExposureAdjust
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (NSNumber)inputEV;
- (id)outputImage;
- (void)setInputEV:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIExposureAdjust

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
  v5[7] = @"CICategoryXMPSerializable";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:8];
  v7[1] = @"5";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.4";
  v6[3] = @"inputEV";
  v3[0] = @"CIAttributeSliderMin";
  v3[1] = @"CIAttributeSliderMax";
  v4[0] = &unk_1EE4A8AF0;
  v4[1] = &unk_1EE4A8B00;
  v3[2] = @"CIAttributeDefault";
  v3[3] = @"CIAttributeIdentity";
  v4[2] = &unk_1EE4A8B10;
  v4[3] = &unk_1EE4A8B10;
  v3[4] = @"CIAttributeType";
  v4[4] = @"CIAttributeTypeScalar";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (BOOL)_isIdentity
{
  [(NSNumber *)self->inputEV doubleValue];
  return fabs(v2) < 0.001;
}

- (id)outputImage
{
  if (!self->inputImage) {
    return 0;
  }
  [(NSNumber *)self->inputEV doubleValue];
  long double v4 = v3;
  [(NSNumber *)self->inputEV doubleValue];
  if (fabs(v5) >= 0.001)
  {
    double v8 = exp2(v4);
    return [(CIImage *)self->inputImage filteredImage:@"CIColorMatrix", @"inputRVector", +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v8, 0.0, 0.0), @"inputGVector", +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", 0.0, v8, 0.0), @"inputBVector", +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", 0.0, 0.0, v8), @"inputAVector", +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0), @"inputBiasVector", +[CIVector vectorWithX:0.0 Y:0.0 Z:0.0], 0 keysAndValues];
  }
  else
  {
    v6 = self->inputImage;
    return v6;
  }
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputEV
{
  return self->inputEV;
}

- (void)setInputEV:(id)a3
{
}

@end