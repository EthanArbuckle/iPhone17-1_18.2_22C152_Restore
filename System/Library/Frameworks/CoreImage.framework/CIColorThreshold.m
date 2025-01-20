@interface CIColorThreshold
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputThreshold;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputThreshold:(id)a3;
@end

@implementation CIColorThreshold

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryColorAdjustment";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryInterlaced";
  v5[3] = @"CICategoryNonSquarePixels";
  v5[4] = @"CICategoryStillImage";
  v5[5] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:6];
  v7[1] = @"14";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"11.0";
  v6[3] = @"inputThreshold";
  v3[0] = @"CIAttributeSliderMin";
  v3[1] = @"CIAttributeSliderMax";
  v4[0] = &unk_1EE4A8140;
  v4[1] = &unk_1EE4A8150;
  v3[2] = @"CIAttributeDefault";
  v3[3] = @"CIAttributeClass";
  v4[2] = &unk_1EE4A8160;
  v4[3] = @"NSNumber";
  v3[4] = @"CIAttributeType";
  v4[4] = @"CIAttributeTypeScalar";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (id)outputImage
{
  v17[2] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  if (inputImage && ([(CIImage *)inputImage extent], !CGRectIsEmpty(v19)))
  {
    v5 = +[CIKernel kernelWithInternalRepresentation:&CI::_colorThreshold];
    [(NSNumber *)self->inputThreshold floatValue];
    int v7 = v6;
    v8 = [(CIImage *)self->inputImage imageByUnpremultiplyingAlpha];
    [(CIImage *)self->inputImage extent];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    v17[0] = v8;
    LODWORD(v9) = v7;
    v17[1] = [NSNumber numberWithFloat:v9];
    return -[CIImage imageByPremultiplyingAlpha](-[CIColorKernel applyWithExtent:arguments:](v5, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2], v10, v12, v14, v16), "imageByPremultiplyingAlpha");
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputThreshold
{
  return self->inputThreshold;
}

- (void)setInputThreshold:(id)a3
{
}

@end