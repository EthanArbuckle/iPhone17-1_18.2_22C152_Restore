@interface CIVariableBoxBlur
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIImage)inputRadiusImage;
- (NSNumber)inputScale;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputRadiusImage:(id)a3;
- (void)setInputScale:(id)a3;
@end

@implementation CIVariableBoxBlur

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryStylize";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryBuiltIn";
  v5[4] = @"CICategoryApplePrivate";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:5];
  v7[1] = @"10";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.12";
  v6[3] = @"inputScale";
  v3[0] = @"CIAttributeIdentity";
  v3[1] = @"CIAttributeDefault";
  v4[0] = &unk_1EE4AA160;
  v4[1] = &unk_1EE4AA160;
  v3[2] = @"CIAttributeMin";
  v4[2] = &unk_1EE4AA160;
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:3];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (id)outputImage
{
  v19[4] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage || !self->inputRadiusImage) {
    return 0;
  }
  [(NSNumber *)self->inputScale floatValue];
  if (v3 < 0.5) {
    return self->inputImage;
  }
  v4 = +[CIKernel kernelWithInternalRepresentation:&CI::_variableBoxBlur];
  v5 = [(CIImage *)self->inputImage imageByApplyingFilter:@"CIIntegralImage" withInputParameters:0];
  if (!v5) {
    return self->inputImage;
  }
  v6 = v5;
  [(CIImage *)self->inputImage extent];
  v7 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  [(CIImage *)self->inputImage extent];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v19[0] = v6;
  v16 = [(CIImage *)self->inputRadiusImage imageByClampingToExtent];
  inputScale = self->inputScale;
  v19[1] = v16;
  v19[2] = inputScale;
  v19[3] = v7;
  return -[CIKernel applyWithExtent:roiCallback:arguments:](v4, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_66, [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4], v9, v11, v13, v15);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputRadiusImage
{
  return self->inputRadiusImage;
}

- (void)setInputRadiusImage:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

@end