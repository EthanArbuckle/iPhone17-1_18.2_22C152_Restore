@interface CIColorMap
+ (id)customAttributes;
- (CIImage)inputGradientImage;
- (CIImage)inputImage;
- (id)_kernel;
- (id)outputImage;
- (void)setInputGradientImage:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIColorMap

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryColorEffect";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryInterlaced";
  v3[3] = @"CICategoryNonSquarePixels";
  v3[4] = @"CICategoryStillImage";
  v3[5] = @"CICategoryBuiltIn";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:6];
  v5[1] = @"6";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.4";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_colorMap];
}

- (id)outputImage
{
  v20[3] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  if (!inputImage) {
    return 0;
  }
  id result = self->inputGradientImage;
  if (!result) {
    return result;
  }
  [result extent];
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  double width = v21.size.width;
  CGFloat height = v21.size.height;
  if (CGRectIsInfinite(v21))
  {
    NSLog(&cfstr_SRequiresTheIn.isa, "-[CIColorMap outputImage]");
    return 0;
  }
  id v9 = [(CIColorMap *)self _kernel];
  [(CIImage *)self->inputImage extent];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __25__CIColorMap_outputImage__block_invoke;
  v19[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  *(CGFloat *)&v19[4] = x;
  *(CGFloat *)&v19[5] = y;
  *(double *)&v19[6] = width;
  *(CGFloat *)&v19[7] = height;
  inputGradientImage = self->inputGradientImage;
  v20[0] = inputImage;
  v20[1] = inputGradientImage;
  v20[2] = [NSNumber numberWithDouble:width + -1.0];
  return (id)objc_msgSend(v9, "applyWithExtent:roiCallback:arguments:", v19, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v20, 3), v11, v13, v15, v17);
}

double __25__CIColorMap_outputImage__block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    return *(double *)(a1 + 32);
  }
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputGradientImage
{
  return self->inputGradientImage;
}

- (void)setInputGradientImage:(id)a3
{
}

@end