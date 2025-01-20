@interface CICannyEdgeDetector
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputGaussianSigma;
- (NSNumber)inputHysteresisPasses;
- (NSNumber)inputPerceptual;
- (NSNumber)inputThresholdHigh;
- (NSNumber)inputThresholdLow;
- (id)outputImage;
- (void)setInputGaussianSigma:(id)a3;
- (void)setInputHysteresisPasses:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputPerceptual:(id)a3;
- (void)setInputThresholdHigh:(id)a3;
- (void)setInputThresholdLow:(id)a3;
@end

@implementation CICannyEdgeDetector

+ (id)customAttributes
{
  v15[8] = *MEMORY[0x1E4F143B8];
  v14[0] = @"CIAttributeFilterCategories";
  v13[0] = @"CICategoryStylize";
  v13[1] = @"CICategoryVideo";
  v13[2] = @"CICategoryStillImage";
  v13[3] = @"CICategoryHighDynamicRange";
  v13[4] = @"CICategoryBuiltIn";
  v15[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:5];
  v15[1] = @"17";
  v14[1] = @"CIAttributeFilterAvailable_iOS";
  v14[2] = @"CIAttributeFilterAvailable_Mac";
  v15[2] = @"14.0";
  v14[3] = @"inputGaussianSigma";
  v11[0] = @"CIAttributeType";
  v11[1] = @"CIAttributeMin";
  v12[0] = @"CIAttributeTypeScalar";
  v12[1] = &unk_1EE4A8A60;
  v11[2] = @"CIAttributeSliderMin";
  v11[3] = @"CIAttributeSliderMax";
  v12[2] = &unk_1EE4A8A60;
  v12[3] = &unk_1EE4A8A90;
  v11[4] = @"CIAttributeDefault";
  v12[4] = &unk_1EE4A8AA0;
  v15[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:5];
  v14[4] = @"inputPerceptual";
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeMax";
  v10[0] = MEMORY[0x1E4F1CC28];
  v10[1] = MEMORY[0x1E4F1CC38];
  v9[2] = @"CIAttributeDefault";
  v9[3] = @"CIAttributeType";
  v10[2] = MEMORY[0x1E4F1CC28];
  v10[3] = @"CIAttributeTypeBoolean";
  v15[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  v14[5] = @"inputThresholdHigh";
  v7[0] = @"CIAttributeType";
  v7[1] = @"CIAttributeMin";
  v8[0] = @"CIAttributeTypeScalar";
  v8[1] = &unk_1EE4A8A60;
  v7[2] = @"CIAttributeSliderMin";
  v7[3] = @"CIAttributeSliderMax";
  v8[2] = &unk_1EE4A8A60;
  v8[3] = &unk_1EE4A8AB0;
  v7[4] = @"CIAttributeDefault";
  v8[4] = &unk_1EE4A8AC0;
  v15[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  v14[6] = @"inputThresholdLow";
  v5[0] = @"CIAttributeType";
  v5[1] = @"CIAttributeMin";
  v6[0] = @"CIAttributeTypeScalar";
  v6[1] = &unk_1EE4A8A60;
  v5[2] = @"CIAttributeSliderMin";
  v5[3] = @"CIAttributeSliderMax";
  v6[2] = &unk_1EE4A8A60;
  v6[3] = &unk_1EE4A8AD0;
  v5[4] = @"CIAttributeDefault";
  v6[4] = &unk_1EE4A8AE0;
  v15[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v14[7] = @"inputHysteresisPasses";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeMin";
  v4[0] = @"CIAttributeTypeInteger";
  v4[1] = &unk_1EE4AA8C8;
  v3[2] = @"CIAttributeSliderMin";
  v3[3] = @"CIAttributeSliderMax";
  v4[2] = &unk_1EE4AA8C8;
  v4[3] = &unk_1EE4AA8E0;
  v3[4] = @"CIAttributeMax";
  v3[5] = @"CIAttributeDefault";
  v4[4] = &unk_1EE4AA8F8;
  v4[5] = &unk_1EE4AA910;
  v15[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:8];
}

- (id)outputImage
{
  v53[1] = *MEMORY[0x1E4F143B8];
  v3 = [(CIImage *)self->inputImage imageByClampingToExtent];
  [(NSNumber *)self->inputGaussianSigma floatValue];
  v5 = [(CIImage *)v3 imageByApplyingGaussianBlurWithSigma:v4];
  if ([(NSNumber *)self->inputPerceptual BOOLValue]) {
    v5 = [(CIImage *)v5 imageByApplyingFilter:@"CILinearToSRGBToneCurve"];
  }
  v6 = +[CIKernel kernelWithInternalRepresentation:&CI::_sobel_m];
  v7 = (double *)MEMORY[0x1E4F1DB10];
  double v8 = *MEMORY[0x1E4F1DB10];
  double v9 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  v53[0] = v5;
  uint64_t v12 = -[CIKernel applyWithExtent:roiCallback:arguments:](v6, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_90, [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1], v8, v9, v10, v11);
  v13 = +[CIKernel kernelWithInternalRepresentation:&CI::_maxGradOnly];
  double v14 = *v7;
  double v15 = v7[1];
  double v16 = v7[2];
  double v17 = v7[3];
  uint64_t v52 = v12;
  uint64_t v18 = -[CIKernel applyWithExtent:roiCallback:arguments:](v13, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_92, [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1], v14, v15, v16, v17);
  [(NSNumber *)self->inputThresholdHigh floatValue];
  float v20 = fmaxf(v19, 0.0001);
  [(NSNumber *)self->inputThresholdLow floatValue];
  float v22 = fmaxf(v21, 0.0001);
  v23 = +[CIKernel kernelWithInternalRepresentation:&CI::_cannyThreshold];
  double v24 = *v7;
  double v25 = v7[1];
  double v26 = v7[2];
  double v27 = v7[3];
  v51[0] = v18;
  *(float *)&double v28 = v20;
  v51[1] = [NSNumber numberWithFloat:v28];
  *(float *)&double v29 = v22;
  v51[2] = [NSNumber numberWithFloat:v29];
  uint64_t v30 = -[CIColorKernel applyWithExtent:arguments:](v23, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:3], v24, v25, v26, v27);
  int v31 = [(NSNumber *)self->inputHysteresisPasses intValue];
  int v32 = v31;
  if (v31 >= 20) {
    int v33 = 20;
  }
  else {
    int v33 = v31;
  }
  v34 = +[CIKernel kernelWithInternalRepresentation:&CI::_cannyHysteresis];
  if (v22 < v20 && v32 >= 1)
  {
    v35 = v34;
    unsigned int v36 = 0;
    unsigned int v37 = v33 & ~(v33 >> 31);
    do
    {
      double v38 = *v7;
      double v39 = v7[1];
      double v40 = v7[2];
      double v41 = v7[3];
      uint64_t v50 = v30;
      uint64_t v30 = -[CIKernel applyWithExtent:roiCallback:arguments:](v35, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_95, [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1], v38, v39, v40, v41);
      ++v36;
    }
    while (v37 > v36);
  }
  v42 = +[CIKernel kernelWithInternalRepresentation:&CI::_cannyFinal];
  double v43 = *v7;
  double v44 = v7[1];
  double v45 = v7[2];
  double v46 = v7[3];
  uint64_t v49 = v30;
  v47 = -[CIColorKernel applyWithExtent:arguments:](v42, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1], v43, v44, v45, v46);
  [(CIImage *)self->inputImage extent];
  return -[CIImage imageByCroppingToRect:](v47, "imageByCroppingToRect:");
}

double __34__CICannyEdgeDetector_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

double __34__CICannyEdgeDetector_outputImage__block_invoke_2(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

double __34__CICannyEdgeDetector_outputImage__block_invoke_3(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputGaussianSigma
{
  return self->inputGaussianSigma;
}

- (void)setInputGaussianSigma:(id)a3
{
}

- (NSNumber)inputPerceptual
{
  return self->inputPerceptual;
}

- (void)setInputPerceptual:(id)a3
{
}

- (NSNumber)inputThresholdHigh
{
  return self->inputThresholdHigh;
}

- (void)setInputThresholdHigh:(id)a3
{
}

- (NSNumber)inputThresholdLow
{
  return self->inputThresholdLow;
}

- (void)setInputThresholdLow:(id)a3
{
}

- (NSNumber)inputHysteresisPasses
{
  return self->inputHysteresisPasses;
}

- (void)setInputHysteresisPasses:(id)a3
{
}

@end