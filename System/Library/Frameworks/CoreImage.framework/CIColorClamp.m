@interface CIColorClamp
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputMaxComponents;
- (CIVector)inputMinComponents;
- (id)_kernel;
- (id)_kernelAlphaPreserving;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputMaxComponents:(id)a3;
- (void)setInputMinComponents:(id)a3;
@end

@implementation CIColorClamp

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_colorClamp];
}

- (id)_kernelAlphaPreserving
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_colorClampAP];
}

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryColorAdjustment";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryInterlaced";
  v7[3] = @"CICategoryNonSquarePixels";
  v7[4] = @"CICategoryStillImage";
  v7[5] = @"CICategoryBuiltIn";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:6];
  v9[1] = @"7";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"10.9";
  v8[3] = @"inputMinComponents";
  v5 = @"CIAttributeDefault";
  v6 = +[CIVector vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v8[4] = @"inputMaxComponents";
  v3 = @"CIAttributeDefault";
  v4 = +[CIVector vectorWithX:1.0 Y:1.0 Z:1.0 W:1.0];
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v4 forKeys:&v3 count:1];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (id)outputImage
{
  v19[3] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  inputMinComponents = self->inputMinComponents;
  if (!inputMinComponents) {
    inputMinComponents = +[CIVector vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
  }
  inputMaxComponents = self->inputMaxComponents;
  if (!inputMaxComponents) {
    inputMaxComponents = +[CIVector vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
  }
  [(CIImage *)self->inputImage extent];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(CIVector *)self->inputMinComponents W];
  if (v13 > 0.0)
  {
    double v6 = *MEMORY[0x1E4F1DB10];
    double v8 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  }
  [(CIVector *)self->inputMinComponents W];
  if (v14 <= 0.0 && ([(CIVector *)self->inputMaxComponents W], v15 >= 1.0)) {
    id v16 = [(CIColorClamp *)self _kernelAlphaPreserving];
  }
  else {
    id v16 = [(CIColorClamp *)self _kernel];
  }
  v18 = v16;
  v19[0] = [(CIImage *)self->inputImage imageByUnpremultiplyingAlpha];
  v19[1] = inputMinComponents;
  v19[2] = inputMaxComponents;
  return (id)objc_msgSend((id)objc_msgSend(v18, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 3), v6, v8, v10, v12), "imageByPremultiplyingAlpha");
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIVector)inputMinComponents
{
  return self->inputMinComponents;
}

- (void)setInputMinComponents:(id)a3
{
}

- (CIVector)inputMaxComponents
{
  return self->inputMaxComponents;
}

- (void)setInputMaxComponents:(id)a3
{
}

@end