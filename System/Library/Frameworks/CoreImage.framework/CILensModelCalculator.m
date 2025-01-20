@interface CILensModelCalculator
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIImage)inputMinMaxImage;
- (CIVector)inputFocusRect;
- (CIVector)inputOriginalSize;
- (NSDictionary)inputTuningParameters;
- (NSNumber)inputIntrinsicMatrixFocalLength;
- (NSNumber)inputSimulatedAperture;
- (id)cpuParams;
- (id)kernel;
- (id)mtlKernel;
- (id)outputImage;
- (void)setInputFocusRect:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputIntrinsicMatrixFocalLength:(id)a3;
- (void)setInputMinMaxImage:(id)a3;
- (void)setInputOriginalSize:(id)a3;
- (void)setInputSimulatedAperture:(id)a3;
- (void)setInputTuningParameters:(id)a3;
@end

@implementation CILensModelCalculator

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryColorAdjustment";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryBuiltIn";
  v3[4] = @"CICategoryApplePrivate";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:5];
  v5[1] = @"11";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.13";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)mtlKernel
{
  uint64_t v2 = SDOFV2MetalLibURL();

  return +[CIKernel cachedKernelWithFunctionName:@"slm_calcV2" fromMetalLibrary:v2 error:0];
}

- (id)kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_ciLensModelCalculator];
}

- (id)cpuParams
{
  SDOFSimpleLensModelValue(@"zeroShiftPercentile", self->inputTuningParameters);
  float v4 = v3;
  [(CIVector *)self->inputOriginalSize X];
  double v6 = v5;
  [(CIVector *)self->inputOriginalSize Y];
  inputOriginalSize = self->inputOriginalSize;
  if (v6 <= v8) {
    [(CIVector *)inputOriginalSize Y];
  }
  else {
    [(CIVector *)inputOriginalSize X];
  }
  double v10 = v9;
  [(NSNumber *)self->inputIntrinsicMatrixFocalLength floatValue];
  float v12 = v11;
  [(NSNumber *)self->inputSimulatedAperture floatValue];
  float v14 = v13;
  SDOFSimpleLensModelValue(@"disparityScalingFactor", self->inputTuningParameters);
  if (v15 == 0.0) {
    float v15 = 1.0;
  }
  float v16 = v10;
  float v17 = v12 / v16;
  float v18 = (float)(v17 * 36.0) / (v14 * 1000.0);
  float v19 = v18 * 0.5 * v17;
  float v20 = v15 * v19;
  SDOFRenderingValue(&cfstr_Maxblur.isa, self->inputTuningParameters);
  float v22 = v20 / v21;
  SDOFSimpleLensModelValue(@"maxFGBlur", self->inputTuningParameters);
  float v24 = v23 / v19;
  SDOFSimpleLensModelValue(@"shiftDeadZone", self->inputTuningParameters);

  return +[CIVector vectorWithX:v4 Y:v22 Z:v24 W:(float)(1.0 / v25)];
}

- (id)outputImage
{
  v69[4] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  if (inputImage)
  {
    [(CIImage *)inputImage extent];
    memset(&v62, 0, sizeof(v62));
    CGAffineTransformMakeScale(&v62, v4, v5);
    [(CIVector *)self->inputFocusRect CGRectValue];
    CGAffineTransform v61 = v62;
    CGRect v72 = CGRectApplyAffineTransform(v71, &v61);
    double x = v72.origin.x;
    double y = v72.origin.y;
    double width = v72.size.width;
    double height = v72.size.height;
    double v10 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
    float v11 = [(CIImage *)self->inputMinMaxImage imageByClampingToExtent];
    id v12 = [(CILensModelCalculator *)self cpuParams];
    id v13 = [(CILensModelCalculator *)self kernel];
    float v14 = (double *)MEMORY[0x1E4F1DB10];
    double v15 = *MEMORY[0x1E4F1DB10];
    double v16 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double v17 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __36__CILensModelCalculator_outputImage__block_invoke;
    v60[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    *(double *)&v60[4] = x;
    *(double *)&v60[5] = y;
    *(double *)&v60[6] = width;
    *(double *)&v60[7] = height;
    v69[0] = self->inputImage;
    v69[1] = v10;
    v69[2] = v11;
    v69[3] = v12;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:4];
    v67 = @"kCIKernelOutputFormat";
    uint64_t v68 = [NSNumber numberWithInt:2056];
    float v20 = (CIImage *)objc_msgSend(v13, "applyWithExtent:roiCallback:arguments:options:", v60, v19, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1), v15, v16, v17, v18);
    id v21 = [(CILensModelCalculator *)self mtlKernel];
    if (v21)
    {
      float v22 = v21;
      [(CIVector *)self->inputOriginalSize X];
      double v24 = v23;
      [(CIVector *)self->inputOriginalSize Y];
      inputOriginalSize = self->inputOriginalSize;
      if (v24 <= v26) {
        [(CIVector *)inputOriginalSize Y];
      }
      else {
        [(CIVector *)inputOriginalSize X];
      }
      float v29 = v27;
      [(NSNumber *)self->inputIntrinsicMatrixFocalLength floatValue];
      float v31 = v30 / v29;
      int v32 = 0;
      int v33 = 0;
      if ((unint64_t)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->inputTuningParameters, "objectForKeyedSubscript:", @"Version"), "unsignedIntegerValue") >= 2)
      {
        SDOFRenderingValue(&cfstr_Minimumsimulat.isa, self->inputTuningParameters);
        int v32 = v34;
        SDOFSimpleLensModelValue(@"maximumSimulatedAperture", self->inputTuningParameters);
        int v33 = v35;
      }
      float v36 = x;
      float v37 = y;
      *(float *)v59 = v36;
      *(float *)&v59[1] = v37;
      float v38 = width;
      float v39 = height;
      *(float *)&v59[2] = v38;
      *(float *)&v59[3] = v39;
      SDOFSimpleLensModelValue(@"zeroShiftPercentile", self->inputTuningParameters);
      v59[4] = v40;
      *(float *)&v59[5] = v31 * 36.0;
      [(NSNumber *)self->inputSimulatedAperture floatValue];
      v59[6] = v41;
      v59[7] = v32;
      v59[8] = v33;
      *(float *)&v59[9] = v31;
      SDOFSimpleLensModelValue(@"maxFGBlur", self->inputTuningParameters);
      v59[10] = v42;
      SDOFRenderingValue(&cfstr_Maxblur.isa, self->inputTuningParameters);
      v59[11] = v43;
      SDOFSimpleLensModelValue(@"shiftDeadZone", self->inputTuningParameters);
      v59[12] = v44;
      SDOFSimpleLensModelValue(@"disparityScalingFactor", self->inputTuningParameters);
      v59[13] = v45;
      uint64_t v46 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v59 length:56];
      [(CIImage *)self->inputImage extent];
      v47 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
      double v48 = *v14;
      double v49 = v14[1];
      double v50 = v14[2];
      double v51 = v14[3];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __36__CILensModelCalculator_outputImage__block_invoke_101;
      v58[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      *(double *)&v58[4] = x;
      *(double *)&v58[5] = y;
      *(double *)&v58[6] = width;
      *(double *)&v58[7] = height;
      v66[0] = v46;
      v66[1] = v12;
      v52 = self->inputImage;
      v66[2] = v11;
      v66[3] = v52;
      v66[4] = v47;
      uint64_t v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:5];
      v64[0] = @"kCIKernelOutputFormat";
      v65[0] = [NSNumber numberWithInt:2056];
      v65[1] = &unk_1EE4AB8E8;
      v64[1] = @"kCIKernelThreadgroupsPerGrid";
      v64[2] = @"kCIKernelThreadsPerThreadgroup";
      v65[2] = &unk_1EE4AB8D0;
      uint64_t v54 = objc_msgSend(v22, "applyWithExtent:roiCallback:arguments:options:", v58, v53, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v65, v64, 3), v48, v49, v50, v51);
      if (v54)
      {
        uint64_t v55 = v54;
        v63[0] = v20;
        v63[1] = v54;
        uint64_t v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __36__CILensModelCalculator_outputImage__block_invoke_2;
        v57[3] = &unk_1E5772600;
        v57[4] = v55;
        float v20 = +[CIImage imageWithArrayOfImages:v56 selector:v57];
      }
    }
    return -[CIImage imageByClampingToExtent](-[CIImage imageByInsertingIntermediate](-[CIImage imageByCroppingToRect:](v20, "imageByCroppingToRect:", 0.0, 0.0, 1.0, 1.0), "imageByInsertingIntermediate"), "imageByClampingToExtent");
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

double __36__CILensModelCalculator_outputImage__block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    return 0.0;
  }
  else {
    return *(double *)(a1 + 32);
  }
}

double __36__CILensModelCalculator_outputImage__block_invoke_101(uint64_t a1, int a2)
{
  if (a2) {
    return 0.0;
  }
  else {
    return *(double *)(a1 + 32);
  }
}

uint64_t __36__CILensModelCalculator_outputImage__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"kContextInfoIsMetal"), "BOOLValue");
  if (result) {
    return *(void *)(a1 + 32) != 0;
  }
  return result;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputMinMaxImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputMinMaxImage:(id)a3
{
}

- (CIVector)inputOriginalSize
{
  return self->inputOriginalSize;
}

- (void)setInputOriginalSize:(id)a3
{
}

- (CIVector)inputFocusRect
{
  return self->inputFocusRect;
}

- (void)setInputFocusRect:(id)a3
{
}

- (NSNumber)inputSimulatedAperture
{
  return self->inputSimulatedAperture;
}

- (void)setInputSimulatedAperture:(id)a3
{
}

- (NSNumber)inputIntrinsicMatrixFocalLength
{
  return self->inputIntrinsicMatrixFocalLength;
}

- (void)setInputIntrinsicMatrixFocalLength:(id)a3
{
}

- (NSDictionary)inputTuningParameters
{
  return self->inputTuningParameters;
}

- (void)setInputTuningParameters:(id)a3
{
}

@end