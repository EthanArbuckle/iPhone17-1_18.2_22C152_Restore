@interface CIIntegralImage
+ (id)customAttributes;
- (CIImage)inputImage;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CIIntegralImage

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryStylize";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryBuiltIn";
  v3[4] = @"CICategoryApplePrivate";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:5];
  v5[1] = @"10";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.12";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)outputImage
{
  v15[1] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  if (!inputImage) {
    return 0;
  }
  [(CIImage *)inputImage extent];
  double x = v16.origin.x;
  double y = v16.origin.y;
  double width = v16.size.width;
  double height = v16.size.height;
  if (CGRectIsEmpty(v16)) {
    return 0;
  }
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  if (CGRectIsInfinite(v17)) {
    return 0;
  }
  v10 = self->inputImage;
  v15[0] = v10;
  v8 = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](CIIntegralImageProcessorCPU, "applyWithExtent:inputs:arguments:error:", [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1], 0, 0, x, y, width, height);
  if (CI_ENABLE_MPS())
  {
    int v11 = CI_FLIP_IMAGE_PROCESSOR();
    if (v11) {
      v10 = [(CIImage *)v10 imageByApplyingOrientation:4];
    }
    v14 = v10;
    v12 = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](CIIntegralImageProcessorGPU, "applyWithExtent:inputs:arguments:error:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1], 0, 0, x, y, width, height);
    uint64_t v13 = (uint64_t)v12;
    if (v11) {
      uint64_t v13 = [(CIImage *)v12 imageByApplyingOrientation:4];
    }
    return +[CIImage imageForRenderingWithMPS:v13 orNonMPS:v8];
  }
  return v8;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end