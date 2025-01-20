@interface CIDisparityRefinementAntialiasV3
- (CIImage)inputDisparityWeightImage;
- (CIImage)inputImage;
- (CIImage)inputPreprocImage;
- (NSDictionary)inputTuningParameters;
- (NSNumber)inputScale;
- (id)antialiasKernel;
- (id)outputImage;
- (void)setInputDisparityWeightImage:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputPreprocImage:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputTuningParameters:(id)a3;
@end

@implementation CIDisparityRefinementAntialiasV3

- (id)antialiasKernel
{
  if (-[CIDisparityRefinementAntialiasV3 antialiasKernel]::onceToken != -1) {
    dispatch_once(&-[CIDisparityRefinementAntialiasV3 antialiasKernel]::onceToken, &__block_literal_global_275);
  }
  return (id)-[CIDisparityRefinementAntialiasV3 antialiasKernel]::k;
}

id __51__CIDisparityRefinementAntialiasV3_antialiasKernel__block_invoke()
{
  id result = +[CIKernel SDOFV3MetalKernelNamed:@"disparity_refinement_antialias"];
  -[CIDisparityRefinementAntialiasV3 antialiasKernel]::k = (uint64_t)result;
  return result;
}

- (id)outputImage
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  inputPreprocImage = self->inputPreprocImage;
  inputDisparityWeightImage = self->inputDisparityWeightImage;
  [(CIImage *)inputPreprocImage extent];
  double v7 = v6;
  [(CIImage *)inputDisparityWeightImage extent];
  CGFloat v9 = v7 / v8;
  [(CIImage *)inputPreprocImage extent];
  double v11 = v10;
  [(CIImage *)inputDisparityWeightImage extent];
  CGAffineTransformMakeScale(&v41, v9, v11 / v12);
  v13 = [(CIImage *)inputDisparityWeightImage imageByApplyingTransform:&v41];
  SDOFDisparityRefinementParameterValue(&cfstr_Maxreconstruct.isa, self->inputTuningParameters);
  LODWORD(v9) = v14;
  SDOFDisparityRefinementParameterValue(&cfstr_Aalumasigma.isa, self->inputTuningParameters);
  unsigned int v40 = v15;
  SDOFDisparityRefinementParameterValue(&cfstr_Aachromasigma.isa, self->inputTuningParameters);
  unsigned int v39 = v16;
  SDOFDisparityRefinementParameterValue(&cfstr_Aasegmentation.isa, self->inputTuningParameters);
  float32x2_t v17 = vmul_f32((float32x2_t)__PAIR64__(v39, v40), (float32x2_t)__PAIR64__(v39, v40));
  __asm { FMOV            V2.2S, #-1.0 }
  float64x2_t v45 = vcvtq_f64_f32(vdiv_f32(_D2, vadd_f32(v17, v17)));
  float64_t v46 = v45.f64[1];
  double v47 = (float)(-1.0 / (float)((float)(v23 * v23) + (float)(v23 * v23)));
  v24 = +[CIVector vectorWithValues:&v45 count:4];
  SDOFDisparityRefinementParameterValue(&cfstr_Aaspatialsigma.isa, self->inputTuningParameters);
  *(float *)&double v11 = -1.0 / (float)((float)(v25 * v25) + (float)(v25 * v25));
  v26 = [(CIImage *)inputImage imageByClampingToExtent];
  v27 = [(CIImage *)inputPreprocImage imageByClampingToExtent];
  v28 = [(CIImage *)v13 imageByClampingToExtent];
  [(NSNumber *)self->inputScale floatValue];
  v30 = +[CIVector vectorWithX:*(float *)&v9 Y:*(float *)&v11 Z:v29];
  id v31 = [(CIDisparityRefinementAntialiasV3 *)self antialiasKernel];
  double v32 = *MEMORY[0x1E4F1DB10];
  double v33 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v34 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v35 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  v44[0] = [(CIImage *)v28 imageByClampingToExtent];
  v44[1] = [(CIImage *)v27 imageByClampingToExtent];
  v44[2] = [(CIImage *)v26 imageByClampingToExtent];
  v44[3] = v24;
  v44[4] = v30;
  uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:5];
  v42 = @"kCIKernelOutputFormat";
  uint64_t v43 = [NSNumber numberWithInt:2053];
  v37 = objc_msgSend(v31, "applyWithExtent:roiCallback:arguments:options:", &__block_literal_global_292, v36, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1), v32, v33, v34, v35);
  [(CIImage *)inputPreprocImage extent];
  return (id)objc_msgSend(v37, "imageByCroppingToRect:");
}

double __47__CIDisparityRefinementAntialiasV3_outputImage__block_invoke(double result, double a2, double a3, double a4, uint64_t a5, int a6)
{
  if ((a6 - 1) < 2 || a6) {
    *(void *)&id result = (unint64_t)CGRectInset(*(CGRect *)&result, -2.0, -2.0);
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

- (CIImage)inputPreprocImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputPreprocImage:(id)a3
{
}

- (CIImage)inputDisparityWeightImage
{
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputDisparityWeightImage:(id)a3
{
}

- (NSDictionary)inputTuningParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputTuningParameters:(id)a3
{
}

- (NSNumber)inputScale
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputScale:(id)a3
{
}

@end