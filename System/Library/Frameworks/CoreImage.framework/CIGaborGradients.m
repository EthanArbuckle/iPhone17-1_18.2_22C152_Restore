@interface CIGaborGradients
+ (id)customAttributes;
- (CIImage)inputImage;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CIGaborGradients

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryStylize";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryHighDynamicRange";
  v3[4] = @"CICategoryBuiltIn";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:5];
  v5[1] = @"13";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.15";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)outputImage
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = +[CIKernel kernelWithInternalRepresentation:&CI::_gabor];
  v4 = [(CIImage *)self->inputImage imageByClampingToExtent];
  double v5 = *MEMORY[0x1E4F1DB10];
  double v6 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  v11[0] = v4;
  v9 = -[CIKernel applyWithExtent:roiCallback:arguments:](v3, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_36, [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1], v5, v6, v7, v8);
  [(CIImage *)self->inputImage extent];
  return -[CIImage imageByCroppingToRect:](v9, "imageByCroppingToRect:");
}

double __31__CIGaborGradients_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -2.0, -2.0);
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end