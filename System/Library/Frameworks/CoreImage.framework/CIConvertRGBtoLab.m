@interface CIConvertRGBtoLab
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputNormalize;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputNormalize:(id)a3;
@end

@implementation CIConvertRGBtoLab

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
  v7[1] = @"16";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"13.0";
  v6[3] = @"inputNormalize";
  v3[0] = @"CIAttributeDefault";
  v3[1] = @"CIAttributeMin";
  v4[0] = MEMORY[0x1E4F1CC28];
  v4[1] = MEMORY[0x1E4F1CC28];
  v3[2] = @"CIAttributeMax";
  v3[3] = @"CIAttributeType";
  v4[2] = MEMORY[0x1E4F1CC38];
  v4[3] = @"CIAttributeTypeBoolean";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (id)outputImage
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = +[CIKernel kernelWithInternalRepresentation:&CI::_LAB_normalize];
  v4 = [(CIImage *)self->inputImage imageByConvertingWorkingSpaceToLab];
  if ([(NSNumber *)self->inputNormalize BOOLValue])
  {
    [(CIImage *)v4 extent];
    v10[0] = v4;
    return -[CIColorKernel applyWithExtent:arguments:](v3, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1], v5, v6, v7, v8);
  }
  return v4;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputNormalize
{
  return self->inputNormalize;
}

- (void)setInputNormalize:(id)a3
{
}

@end