@interface CIFillHolesInRedMask
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputMaximumHoleSize;
- (NSNumber)inputRefinementPassCount;
- (id)outputImage;
- (void)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputMaximumHoleSize:(id)a3;
- (void)setInputRefinementPassCount:(id)a3;
@end

@implementation CIFillHolesInRedMask

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryGradient";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryBuiltIn";
  v7[4] = @"CICategoryApplePrivate";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];
  v9[1] = @"18";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"15.0";
  v8[3] = @"inputMaximumHoleSize";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A7A90;
  v6[1] = &unk_1EE4A7AA0;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A7AB0;
  v6[3] = &unk_1EE4A7AC0;
  v5[4] = @"CIAttributeMax";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4A7AE0;
  v6[5] = @"CIAttributeTypeDistance";
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v8[4] = @"inputRefinementPassCount";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A7AA0;
  v4[1] = &unk_1EE4A7AA0;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A7AF0;
  v4[3] = &unk_1EE4A7AC0;
  v3[4] = @"CIAttributeMax";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A7B00;
  v4[5] = @"CIAttributeTypeCount";
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (id)outputImage
{
  v40[1] = *MEMORY[0x1E4F143B8];
  [(CIImage *)self->inputImage extent];
  BOOL IsEmpty = CGRectIsEmpty(v41);
  id result = self->inputImage;
  if (!IsEmpty)
  {
    [result extent];
    CGFloat x = v42.origin.x;
    double y = v42.origin.y;
    double width = v42.size.width;
    double height = v42.size.height;
    if (CGRectIsInfinite(v42))
    {
      v9 = ci_logger_filter();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CIDistanceGradientFromRedMask outputImage]();
      }
      return 0;
    }
    [(NSNumber *)self->inputMaximumHoleSize floatValue];
    float v11 = v10;
    if (v10 >= 1.0)
    {
      if (v10 > 500.0)
      {
        v12 = ci_logger_filter();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[CIFillHolesInRedMask outputImage]();
        }
        return 0;
      }
      double v34 = x;
      int v13 = [(NSNumber *)self->inputRefinementPassCount intValue];
      if (v13 <= 1) {
        unsigned int v15 = 1;
      }
      else {
        unsigned int v15 = v13;
      }
      inputImage = self->inputImage;
      if (v15 >= 0x20) {
        int v17 = 32;
      }
      else {
        int v17 = v15;
      }
      v39 = @"inputMaximumDistance";
      *(float *)&double v14 = v11;
      v40[0] = [NSNumber numberWithFloat:v14];
      v18 = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", @"CIDistanceGradientFromRedMask", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1]);
      [(CIImage *)self->inputImage extent];
      CGRect v44 = CGRectInset(v43, (float)-v11, (float)-v11);
      CGRect v45 = CGRectIntegral(v44);
      v19 = -[CIImage imageByCroppingToRect:](v18, "imageByCroppingToRect:", v45.origin.x, v45.origin.y, v45.size.width, v45.size.height);
      v20 = +[CIKernel kernelWithInternalRepresentation:&CI::_holeFillRefine];
      do
      {
        [(CIImage *)v19 extent];
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __35__CIFillHolesInRedMask_outputImage__block_invoke;
        v35[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
        float v36 = v11;
        v38[0] = v19;
        *(float *)&double v21 = v11;
        v38[1] = [NSNumber numberWithFloat:v21];
        v19 = -[CIImage imageBySamplingNearest](-[CIKernel applyWithExtent:roiCallback:arguments:](v20, "applyWithExtent:roiCallback:arguments:", v35, [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2], v22, v24, v26, v28), "imageBySamplingNearest");
        --v17;
      }
      while (v17);
      v29 = +[CIKernel kernelWithInternalRepresentation:&CI::_holeFillPost];
      [(CIImage *)v19 extent];
      v37 = v19;
      return -[CIImage imageByCroppingToRect:](-[CIColorKernel applyWithExtent:arguments:](v29, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1], v30, v31, v32, v33), "imageByCroppingToRect:", v34, y, width, height);
    }
    else
    {
      return self->inputImage;
    }
  }
  return result;
}

double __35__CIFillHolesInRedMask_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, (float)-*(float *)(a1 + 32), (float)-*(float *)(a1 + 32));
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputMaximumHoleSize
{
  return self->inputMaximumHoleSize;
}

- (void)setInputMaximumHoleSize:(id)a3
{
}

- (NSNumber)inputRefinementPassCount
{
  return self->inputRefinementPassCount;
}

- (void)setInputRefinementPassCount:(id)a3
{
}

- (void)outputImage
{
  [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193671000, v0, v1, "%{public}@: inputMaximumHoleSize must be in the range 1...500.", v2, v3, v4, v5, v6);
}

@end