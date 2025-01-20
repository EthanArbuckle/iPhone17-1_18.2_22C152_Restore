@interface CIColorThresholdOtsu
+ (id)customAttributes;
- (CIImage)inputImage;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CIColorThresholdOtsu

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryColorAdjustment";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryInterlaced";
  v3[3] = @"CICategoryNonSquarePixels";
  v3[4] = @"CICategoryStillImage";
  v3[5] = @"CICategoryBuiltIn";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:6];
  v5[1] = @"14";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"11.0";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)outputImage
{
  v33[2] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  if (!inputImage
    || ([(CIImage *)inputImage extent], CGRectIsEmpty(v35))
    || ([(CIImage *)self->inputImage extent], CGRectIsInfinite(v36)))
  {
    return +[CIImage emptyImage];
  }
  else
  {
    v5 = self->inputImage;
    [(CIImage *)v5 extent];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    *(float *)&CGFloat v8 = 1024.0 / v10;
    *(float *)&CGFloat v6 = 1024.0 / v12;
    float v14 = fminf(fminf(*(float *)&v8, *(float *)&v6), 1.0);
    v15 = [(CIImage *)v5 imageByUnpremultiplyingAlpha];
    memset(&v29, 0, sizeof(v29));
    CGAffineTransformMakeScale(&v29, v14, v14);
    v16 = [(CIImage *)v15 imageByClampingToExtent];
    CGAffineTransform v28 = v29;
    v17 = [(CIImage *)v16 imageByApplyingTransform:&v28];
    CGAffineTransform v27 = v29;
    v37.origin.x = v7;
    v37.origin.y = v9;
    v37.size.width = v11;
    v37.size.height = v13;
    CGRect v38 = CGRectApplyAffineTransform(v37, &v27);
    CGRect v39 = CGRectInset(v38, 0.001, 0.001);
    CGRect v40 = CGRectIntegral(v39);
    v32[0] = @"inputExtent";
    v18 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v40.origin.x, v40.origin.y, v40.size.width, v40.size.height);
    v32[1] = @"inputCount";
    v33[0] = v18;
    v33[1] = &unk_1EE4AA5C8;
    uint64_t v19 = -[CIImage imageByApplyingFilter:withInputParameters:](v17, "imageByApplyingFilter:withInputParameters:", @"CIAreaHistogram", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2]);
    v20 = +[CIKernel kernelWithInternalRepresentation:&CI::_otsu];
    v21 = +[CIKernel kernelWithInternalRepresentation:&CI::_otsuThresh];
    v31[0] = v19;
    v31[1] = &unk_1EE4AA5C8;
    uint64_t v22 = -[CIImage imageByClampingToExtent](-[CIKernel applyWithExtent:roiCallback:arguments:](v20, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_9, [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2], 0.0, 0.0, 1.0, 1.0), "imageByClampingToExtent");
    [(CIImage *)v15 extent];
    v30[0] = v15;
    v30[1] = v22;
    return -[CIImage imageByPremultiplyingAlpha](-[CIColorKernel applyWithExtent:arguments:](v21, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2], v23, v24, v25, v26), "imageByPremultiplyingAlpha");
  }
}

double __35__CIColorThresholdOtsu_outputImage__block_invoke()
{
  return 0.0;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end