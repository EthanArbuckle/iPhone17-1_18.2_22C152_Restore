@interface CIDisparitySmoothing
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputNumIterations;
- (id)_customBoxBlur5Kernel;
- (id)outputImage;
- (id)outputImageMetal;
- (void)setInputImage:(id)a3;
- (void)setInputNumIterations:(id)a3;
@end

@implementation CIDisparitySmoothing

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryBlur";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryBuiltIn";
  v5[4] = @"CICategoryApplePrivate";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:5];
  v7[1] = @"11";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.13";
  v6[3] = @"inputNumIterations";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeMin";
  v3[2] = @"CIAttributeSliderMin";
  v3[3] = @"CIAttributeSliderMax";
  v4[0] = @"CIAttributeTypeInteger";
  v4[1] = &unk_1EE4AA700;
  v4[2] = &unk_1EE4AA700;
  v4[3] = &unk_1EE4AA718;
  v3[4] = @"CIAttributeDefault";
  v4[4] = &unk_1EE4AA730;
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (id)_customBoxBlur5Kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_CIBoxBlur5Min];
}

- (id)outputImageMetal
{
  v17[1] = *MEMORY[0x1E4F143B8];
  NSInteger v3 = [(NSNumber *)self->inputNumIterations integerValue];
  inputImage = self->inputImage;
  if (v3)
  {
    uint64_t v5 = v3;
    [(CIImage *)inputImage extent];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    inputImage = [(CIImage *)inputImage imageByClampingToExtent];
    uint64_t v16 = 0;
    if (v5 >= 1)
    {
      uint64_t v14 = MEMORY[0x1E4F1CC08];
      do
      {
        v17[0] = inputImage;
        inputImage = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](CIDisparitySmoothingProcessor, "applyWithExtent:inputs:arguments:error:", [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1], v14, &v16, v7, v9, v11, v13);
        --v5;
      }
      while (v5);
    }
    v18.origin.x = v7;
    v18.origin.y = v9;
    v18.size.width = v11;
    v18.size.height = v13;
    if (!CGRectIsInfinite(v18)) {
      return -[CIImage imageByCroppingToRect:](inputImage, "imageByCroppingToRect:", v7, v9, v11, v13);
    }
  }
  return inputImage;
}

- (id)outputImage
{
  v26[1] = *MEMORY[0x1E4F143B8];
  NSInteger v3 = [(NSNumber *)self->inputNumIterations integerValue];
  inputImage = self->inputImage;
  if (v3)
  {
    uint64_t v5 = v3;
    saveImage(self->inputImage, @"/tmp/inputToBoxBlur.tiff", 1);
    [(CIImage *)inputImage extent];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    uint64_t v14 = [(CIImage *)inputImage imageByClampingToExtent];
    if (v5 >= 1)
    {
      uint64_t v15 = MEMORY[0x1E4F1CC38];
      do
      {
        id v16 = [(CIDisparitySmoothing *)self _customBoxBlur5Kernel];
        [(CIImage *)v14 extent];
        CGRect v28 = CGRectInset(v27, -2.0, -2.0);
        double x = v28.origin.x;
        double y = v28.origin.y;
        double width = v28.size.width;
        double height = v28.size.height;
        v26[0] = v14;
        uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
        uint64_t v22 = objc_msgSend(NSNumber, "numberWithInt:", 2053, @"kCIKernelOutputFormat");
        v24[1] = @"kCIImageAlphaOne";
        v25[0] = v22;
        v25[1] = v15;
        uint64_t v14 = (CIImage *)objc_msgSend(v16, "applyWithExtent:roiCallback:arguments:options:", &__block_literal_global_17, v21, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, v24, 2), x, y, width, height);
        --v5;
      }
      while (v5);
    }
    inputImage = -[CIImage imageByCroppingToRect:](v14, "imageByCroppingToRect:", v7, v9, v11, v13);
    saveImage(inputImage, @"/tmp/outputFromBoxBlur.tiff", 1);
  }
  return inputImage;
}

double __35__CIDisparitySmoothing_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -2.0, -2.0);
  return result;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputNumIterations
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputNumIterations:(id)a3
{
}

@end