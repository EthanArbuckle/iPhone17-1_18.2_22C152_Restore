@interface CISaliencyMapFilter
+ (id)customAttributes;
- (CIImage)inputImage;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CISaliencyMapFilter

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryVideo";
  v3[1] = @"CICategoryStillImage";
  v3[2] = @"CICategoryBuiltIn";
  v3[3] = @"CICategoryStylize";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:4];
  v5[1] = @"12";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.14";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)outputImage
{
  v19[1] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  if (inputImage && ([(CIImage *)inputImage extent], !CGRectIsInfinite(v21)))
  {
    uint64_t v16 = 0;
    v5 = self->inputImage;
    [(CIImage *)v5 extent];
    CGFloat v7 = -v6;
    [(CIImage *)self->inputImage extent];
    CGAffineTransformMakeTranslation(&v15, v7, -v8);
    v9 = [(CIImage *)v5 imageByApplyingTransform:&v15];
    v10 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    v11 = [(CIImage *)v9 imageByColorMatchingWorkingSpaceToColorSpace:v10];
    v19[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v17 = @"rect";
    [(CIImage *)v11 extent];
    v18 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
    v13 = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](CISaliencyMapKernel, "applyWithExtent:inputs:arguments:error:", v12, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1], &v16, 0.0, 0.0, 64.0, 64.0);
    if (v16)
    {
      CGColorSpaceRelease(v10);
      return +[CIImage emptyImage];
    }
    else
    {
      v14 = [(CIImage *)v13 imageByColorMatchingColorSpaceToWorkingSpace:v10];
      CGColorSpaceRelease(v10);
    }
    return v14;
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end