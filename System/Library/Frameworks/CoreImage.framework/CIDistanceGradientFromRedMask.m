@interface CIDistanceGradientFromRedMask
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputMaximumDistance;
- (id)outputImage;
- (void)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputMaximumDistance:(id)a3;
@end

@implementation CIDistanceGradientFromRedMask

- (id)outputImage
{
  v42[2] = *MEMORY[0x1E4F143B8];
  [(CIImage *)self->inputImage extent];
  BOOL IsEmpty = CGRectIsEmpty(v43);
  id result = self->inputImage;
  if (!IsEmpty)
  {
    [result extent];
    double x = v44.origin.x;
    double y = v44.origin.y;
    double width = v44.size.width;
    double height = v44.size.height;
    if (CGRectIsInfinite(v44))
    {
      v9 = ci_logger_filter();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CIDistanceGradientFromRedMask outputImage]();
      }
      return 0;
    }
    v10 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", x, y, width, height);
    [(NSNumber *)self->inputMaximumDistance floatValue];
    float v12 = v11;
    if (v11 < 1.0 || v11 > 1000.0)
    {
      v14 = ci_logger_filter();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[CIDistanceGradientFromRedMask outputImage]();
      }
      return 0;
    }
    v15 = +[CIKernel kernelWithInternalRepresentation:&CI::_distanceMaskPrep];
    v42[0] = self->inputImage;
    v42[1] = v10;
    v16 = -[CIImage imageBySamplingNearest](-[CIColorKernel applyWithExtent:arguments:](v15, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2], x, y, width, height), "imageBySamplingNearest");
    v17 = +[CIKernel kernelWithInternalRepresentation:&CI::_distanceMask];
    int v18 = vcvtpd_s64_f64(log2(ceilf(v12) + 1.0));
    float v36 = v12;
    if (v18 >= 1)
    {
      uint64_t v19 = (1 << (v18 - 1));
      do
      {
        [(CIImage *)v16 extent];
        CGRect v46 = CGRectInset(v45, (double)-(int)v19, (double)-(int)v19);
        double v20 = v46.origin.x;
        double v21 = v46.origin.y;
        double v22 = v46.size.width;
        double v23 = v46.size.height;
        *(void *)&recta.origin.double y = MEMORY[0x1E4F143A8];
        *(void *)&recta.size.double width = 3221225472;
        *(void *)&recta.size.double height = __44__CIDistanceGradientFromRedMask_outputImage__block_invoke;
        v38 = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
        int v39 = v19;
        v41[0] = v16;
        v41[1] = v10;
        v41[2] = [NSNumber numberWithInt:v19];
        v16 = -[CIImage imageBySamplingNearest](-[CIKernel applyWithExtent:roiCallback:arguments:](v17, "applyWithExtent:roiCallback:arguments:", &recta.origin.y, [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:3], v20, v21, v22, v23), "imageBySamplingNearest");
        if ((int)v19 >= 0) {
          int v24 = v19;
        }
        else {
          int v24 = v19 + 1;
        }
        uint64_t v19 = (v24 >> 1);
        --v18;
      }
      while (v18);
    }
    v25 = +[CIKernel kernelWithInternalRepresentation:&CI::_distanceMaskPost];
    [(CIImage *)v16 extent];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    inputImage = self->inputImage;
    v40[0] = v16;
    v40[1] = inputImage;
    v40[2] = v10;
    *(float *)&double v26 = v36;
    v40[3] = [NSNumber numberWithFloat:v26];
    v35 = -[CIColorKernel applyWithExtent:arguments:](v25, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4], v27, v29, v31, v33);
    v47.origin.double x = x;
    v47.origin.double y = y;
    v47.size.double width = width;
    v47.size.double height = height;
    CGRect v48 = CGRectInset(v47, (float)-v36, (float)-v36);
    CGRect v49 = CGRectIntegral(v48);
    return -[CIImage imageByClampingToRect:](v35, "imageByClampingToRect:", v49.origin.x, v49.origin.y, v49.size.width, v49.size.height);
  }
  return result;
}

double __44__CIDistanceGradientFromRedMask_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, (double)-*(_DWORD *)(a1 + 32), (double)-*(_DWORD *)(a1 + 32));
  return result;
}

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryGradient";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  v7[1] = @"18";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"15.0";
  v6[3] = @"inputMaximumDistance";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A7A90;
  v4[1] = &unk_1EE4A7AA0;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A7AB0;
  v4[3] = &unk_1EE4A7AC0;
  v3[4] = @"CIAttributeMax";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A7AD0;
  v4[5] = @"CIAttributeTypeDistance";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputMaximumDistance
{
  return self->inputMaximumDistance;
}

- (void)setInputMaximumDistance:(id)a3
{
}

- (void)outputImage
{
  [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193671000, v0, v1, "%{public}@: inputMaximumDistance must be in the range 1...1000.", v2, v3, v4, v5, v6);
}

@end