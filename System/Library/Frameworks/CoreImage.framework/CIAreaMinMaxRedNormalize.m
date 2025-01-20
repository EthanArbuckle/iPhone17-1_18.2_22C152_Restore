@interface CIAreaMinMaxRedNormalize
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputExtent;
- (id)outputImage;
- (void)setInputExtent:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIAreaMinMaxRedNormalize

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
  v27[1] = *MEMORY[0x1E4F143B8];
  [(CIImage *)self->inputImage extent];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(CIVector *)self->inputExtent CGRectValue];
  v31.origin.x = v11;
  v31.origin.y = v12;
  v31.size.width = v13;
  v31.size.height = v14;
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  CGRect v30 = CGRectIntersection(v29, v31);
  if (CGRectIsEmpty(v30))
  {
    return +[CIImage emptyImage];
  }
  else
  {
    inputImage = self->inputImage;
    inputExtent = self->inputExtent;
    v26 = @"inputExtent";
    v27[0] = inputExtent;
    uint64_t v18 = -[CIImage imageByUnpremultiplyingAlpha](-[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", @"CIAreaMinMaxRed", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1]), "imageByClampingToExtent"), "imageByUnpremultiplyingAlpha");
    v19 = +[CIKernel kernelWithInternalRepresentation:&CI::_minMaxRedNormalize];
    v20 = [(CIImage *)self->inputImage imageByUnpremultiplyingAlpha];
    [(CIImage *)v20 extent];
    v25[0] = v20;
    v25[1] = v18;
    return -[CIImage imageByPremultiplyingAlpha](-[CIColorKernel applyWithExtent:arguments:](v19, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2], v21, v22, v23, v24), "imageByPremultiplyingAlpha");
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