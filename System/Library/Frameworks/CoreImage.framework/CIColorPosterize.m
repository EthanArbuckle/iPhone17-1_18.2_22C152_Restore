@interface CIColorPosterize
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (NSNumber)inputLevels;
- (id)_kernel;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputLevels:(id)a3;
@end

@implementation CIColorPosterize

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryColorEffect";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryInterlaced";
  v5[3] = @"CICategoryNonSquarePixels";
  v5[4] = @"CICategoryStillImage";
  v5[5] = @"CICategoryHighDynamicRange";
  v5[6] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:7];
  v7[1] = @"6";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.4";
  v6[3] = @"inputLevels";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A80F0;
  v4[1] = &unk_1EE4A8100;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A8110;
  v4[3] = &unk_1EE4A8120;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A8130;
  v4[5] = @"CIAttributeTypeScalar";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_colorPosterize];
}

- (BOOL)_isIdentity
{
  [(NSNumber *)self->inputLevels doubleValue];
  return v2 >= 300.0;
}

- (id)outputImage
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  if ([(CIColorPosterize *)self _isIdentity])
  {
    v3 = self->inputImage;
    return v3;
  }
  else
  {
    [(NSNumber *)self->inputLevels floatValue];
    float v6 = floorf(v5 + -1.0);
    if (v6 <= 0.0)
    {
      double v7 = 0.0;
      double v8 = 1.0;
    }
    else
    {
      double v7 = v6;
      double v8 = (float)(1.0 / v6);
    }
    v9 = [(CIImage *)self->inputImage imageByUnpremultiplyingAlpha];
    id v10 = [(CIColorPosterize *)self _kernel];
    [(CIImage *)v9 extent];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    v19[0] = v9;
    v19[1] = +[CIVector vectorWithX:v7 Y:v8];
    return (id)objc_msgSend((id)objc_msgSend(v10, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 2), v12, v14, v16, v18), "imageByPremultiplyingAlpha");
  }
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputLevels
{
  return self->inputLevels;
}

- (void)setInputLevels:(id)a3
{
}

@end