@interface CIBlurmapSmoothing
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSDictionary)inputTuningParameters;
- (NSNumber)inputDraftMode;
- (NSNumber)inputScale;
- (id)_kernelH;
- (id)_kernelV;
- (id)outputImage;
- (id)performPass:(id)a3 reference:(id)a4 values:(id)a5 rect:(CGRect)a6;
- (void)setInputDraftMode:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputTuningParameters:(id)a3;
@end

@implementation CIBlurmapSmoothing

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryColorAdjustment";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryBuiltIn";
  v5[4] = @"CICategoryApplePrivate";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:5];
  v7[1] = @"11";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.13";
  v6[3] = @"inputDraftMode";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = @"CIAttributeTypeInteger";
  v4[1] = &unk_1EE4AAC88;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4AACA0;
  v4[3] = &unk_1EE4AAC88;
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (id)_kernelH
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_xSmooth];
}

- (id)_kernelV
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_ySmooth];
}

- (id)performPass:(id)a3 reference:(id)a4 values:(id)a5 rect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  v36[1] = *MEMORY[0x1E4F143B8];
  [a3 extent];
  CGRect v38 = CGRectInset(v37, -4.0, 0.0);
  double v14 = v38.origin.x;
  double v15 = v38.origin.y;
  double v16 = v38.size.width;
  double v17 = v38.size.height;
  id v18 = [(CIBlurmapSmoothing *)self _kernelH];
  v36[0] = [a3 imageByClampingToExtent];
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  v34[0] = @"kCIKernelOutputFormat";
  uint64_t v20 = [NSNumber numberWithInt:2054];
  v34[1] = @"kCIImageAlphaOne";
  uint64_t v21 = MEMORY[0x1E4F1CC38];
  v35[0] = v20;
  v35[1] = MEMORY[0x1E4F1CC38];
  v22 = objc_msgSend(v18, "applyWithExtent:roiCallback:arguments:options:", &__block_literal_global_55, v19, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v35, v34, 2), v14, v15, v16, v17);
  v39.origin.double x = x;
  v39.origin.double y = y;
  v39.size.double width = width;
  v39.size.double height = height;
  if (!CGRectIsInfinite(v39)) {
    v22 = objc_msgSend(v22, "imageByCroppingToRect:", x, y, width, height);
  }
  [v22 extent];
  CGRect v41 = CGRectInset(v40, 0.0, -4.0);
  double v23 = v41.origin.x;
  double v24 = v41.origin.y;
  double v25 = v41.size.width;
  double v26 = v41.size.height;
  id v27 = [(CIBlurmapSmoothing *)self _kernelV];
  v33[0] = [v22 imageByClampingToExtent];
  v33[1] = a4;
  v33[2] = a5;
  uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  v31[0] = @"kCIKernelOutputFormat";
  v31[1] = @"kCIImageAlphaOne";
  v32[0] = [NSNumber numberWithInt:2053];
  v32[1] = v21;
  v29 = objc_msgSend(v27, "applyWithExtent:roiCallback:arguments:options:", &__block_literal_global_31_0, v28, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v32, v31, 2), v23, v24, v25, v26);
  v42.origin.double x = x;
  v42.origin.double y = y;
  v42.size.double width = width;
  v42.size.double height = height;
  if (!CGRectIsInfinite(v42)) {
    return (id)objc_msgSend(v29, "imageByCroppingToRect:", x, y, width, height);
  }
  return v29;
}

double __56__CIBlurmapSmoothing_performPass_reference_values_rect___block_invoke(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -4.0, 0.0);
  return result;
}

double __56__CIBlurmapSmoothing_performPass_reference_values_rect___block_invoke_2(double result, double a2, double a3, double a4, uint64_t a5, int a6)
{
  if (!a6) {
    *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&result, 0.0, -4.0);
  }
  return result;
}

- (id)outputImage
{
  if (self->inputImage)
  {
    SDOFBlurmapSmoothingParameterValue(&cfstr_Niterations.isa, self->inputTuningParameters);
    int v4 = (int)v3;
    if ((int)v3 <= 0) {
      return self->inputImage;
    }
    [(NSNumber *)self->inputScale floatValue];
    int v5 = v4;
    if (v6 < 1.0)
    {
      [(NSNumber *)self->inputScale floatValue];
      if (ceilf(v7 * (float)v4) >= 1.0)
      {
        [(NSNumber *)self->inputScale floatValue];
        int v5 = vcvtps_s32_f32(v9 * (float)v4);
      }
      else
      {
        int v5 = 1;
      }
    }
    int v10 = +[CIDepthBlurEffect getDraftMode:[(CIBlurmapSmoothing *)self inputDraftMode]];
    if (v10 == 1) {
      return self->inputImage;
    }
    if (v10 != 2 && (int v4 = v5, v5 <= 0))
    {
      return self->inputImage;
    }
    else
    {
      id v11 = [(CIImage *)self->inputImage _imageByApplyingGamma:2.0];
      [(CIImage *)self->inputImage extent];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      SDOFBlurmapSmoothingParameterValue(&cfstr_Originalblurva.isa, self->inputTuningParameters);
      double v21 = v20;
      SDOFBlurmapSmoothingParameterValue(&cfstr_Originalblurva_0.isa, self->inputTuningParameters);
      double v23 = v22;
      SDOFBlurmapSmoothingParameterValue(&cfstr_Localminimumbl.isa, self->inputTuningParameters);
      double v25 = v24;
      SDOFBlurmapSmoothingParameterValue(&cfstr_Localminimumbl_0.isa, self->inputTuningParameters);
      id v27 = +[CIVector vectorWithX:v21 Y:v23 Z:v25 W:v26];
      uint64_t v28 = [v11 imageByClampingToExtent];
      id v29 = (id)v28;
      do
      {
        id v29 = -[CIBlurmapSmoothing performPass:reference:values:rect:](self, "performPass:reference:values:rect:", v29, v28, v27, v13, v15, v17, v19);
        --v4;
      }
      while (v4);
      v31.origin.double x = v13;
      v31.origin.double y = v15;
      v31.size.double width = v17;
      v31.size.double height = v19;
      if (!CGRectIsInfinite(v31)) {
        id v29 = (id)objc_msgSend(v29, "imageByCroppingToRect:", v13, v15, v17, v19);
      }
      return (id)[v29 _imageByApplyingGamma:0.5];
    }
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (NSDictionary)inputTuningParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputTuningParameters:(id)a3
{
}

- (NSNumber)inputScale
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputScale:(id)a3
{
}

- (NSNumber)inputDraftMode
{
  return self->inputDraftMode;
}

- (void)setInputDraftMode:(id)a3
{
}

@end