@interface CIAreaMinMaxNormalize
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputExtent;
- (id)outputImage;
- (void)setInputExtent:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIAreaMinMaxNormalize

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryColorAdjustment";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryBuiltIn";
  v3[4] = @"CICategoryHighDynamicRange";
  v3[5] = @"CICategoryApplePrivate";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:6];
  v5[1] = @"11";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.13";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)outputImage
{
  v32[1] = *MEMORY[0x1E4F143B8];
  [(CIImage *)self->inputImage extent];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(CIVector *)self->inputExtent CGRectValue];
  v36.origin.x = v11;
  v36.origin.y = v12;
  v36.size.width = v13;
  v36.size.height = v14;
  v34.origin.x = v4;
  v34.origin.y = v6;
  v34.size.width = v8;
  v34.size.height = v10;
  CGRect v35 = CGRectIntersection(v34, v36);
  if (CGRectIsEmpty(v35))
  {
    return +[CIImage emptyImage];
  }
  else
  {
    inputImage = self->inputImage;
    inputExtent = self->inputExtent;
    v31 = @"inputExtent";
    v32[0] = inputExtent;
    uint64_t v18 = -[CIImage imageByUnpremultiplyingAlpha](-[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", @"CIAreaMinimum", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1]), "imageByClampingToExtent"), "imageByUnpremultiplyingAlpha");
    v19 = self->inputImage;
    v20 = self->inputExtent;
    v29 = @"inputExtent";
    v30 = v20;
    uint64_t v21 = -[CIImage imageByUnpremultiplyingAlpha](-[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v19, "imageByApplyingFilter:withInputParameters:", @"CIAreaMaximum", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1]), "imageByClampingToExtent"), "imageByUnpremultiplyingAlpha");
    v22 = +[CIKernel kernelWithInternalRepresentation:&CI::_minMaxNormalize];
    v23 = [(CIImage *)self->inputImage imageByUnpremultiplyingAlpha];
    [(CIImage *)v23 extent];
    v28[0] = v23;
    v28[1] = v18;
    v28[2] = v21;
    return -[CIImage imageByPremultiplyingAlpha](-[CIColorKernel applyWithExtent:arguments:](v22, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3], v24, v25, v26, v27), "imageByPremultiplyingAlpha");
  }
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
{
}

@end