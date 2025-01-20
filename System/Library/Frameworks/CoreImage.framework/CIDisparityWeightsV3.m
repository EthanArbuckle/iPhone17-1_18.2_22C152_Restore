@interface CIDisparityWeightsV3
- (CIImage)inputImage;
- (NSDictionary)inputTuningParameters;
- (NSNumber)inputScale;
- (id)outputImage;
- (id)weightsXKernel;
- (id)weightsYKernel;
- (void)setInputImage:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputTuningParameters:(id)a3;
@end

@implementation CIDisparityWeightsV3

- (id)weightsXKernel
{
  if (-[CIDisparityWeightsV3 weightsXKernel]::onceToken != -1) {
    dispatch_once(&-[CIDisparityWeightsV3 weightsXKernel]::onceToken, &__block_literal_global_173);
  }
  return (id)-[CIDisparityWeightsV3 weightsXKernel]::k;
}

id __38__CIDisparityWeightsV3_weightsXKernel__block_invoke()
{
  id result = +[CIKernel SDOFV3MetalKernelNamed:@"disparity_refinement_calcweightsX"];
  -[CIDisparityWeightsV3 weightsXKernel]::k = (uint64_t)result;
  return result;
}

- (id)weightsYKernel
{
  if (-[CIDisparityWeightsV3 weightsYKernel]::onceToken != -1) {
    dispatch_once(&-[CIDisparityWeightsV3 weightsYKernel]::onceToken, &__block_literal_global_178);
  }
  return (id)-[CIDisparityWeightsV3 weightsYKernel]::k;
}

id __38__CIDisparityWeightsV3_weightsYKernel__block_invoke()
{
  id result = +[CIKernel SDOFV3MetalKernelNamed:@"disparity_refinement_calcweightsY"];
  -[CIDisparityWeightsV3 weightsYKernel]::k = (uint64_t)result;
  return result;
}

- (id)outputImage
{
  v45[3] = *MEMORY[0x1E4F143B8];
  [(CIImage *)self->inputImage extent];
  double v4 = v3;
  double v31 = v5;
  double v32 = v3;
  double v6 = v5;
  double v33 = v8;
  double v34 = v7;
  SDOFDisparityRefinementParameterValue(&cfstr_Radius.isa, self->inputTuningParameters);
  int v10 = v9;
  v11 = [(CIImage *)self->inputImage imageByClampingToExtent];
  SDOFDisparityRefinementParameterValue(&cfstr_Weightscaling.isa, self->inputTuningParameters);
  float v35 = -1.0 / (float)((float)(v12 * v12) + (float)(v12 * v12));
  id v13 = [(CIDisparityWeightsV3 *)self weightsXKernel];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __35__CIDisparityWeightsV3_outputImage__block_invoke;
  v38[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  int v39 = v10;
  v14 = (double *)MEMORY[0x1E4F1DB10];
  double v15 = *MEMORY[0x1E4F1DB10];
  double v16 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v18 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v17 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  v45[0] = v11;
  LODWORD(v19) = v10;
  v45[1] = [NSNumber numberWithFloat:v19];
  v45[2] = [(CIDisparityWeightsV3 *)self inputScale];
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
  v43 = @"kCIKernelOutputFormat";
  uint64_t v44 = [NSNumber numberWithInt:2054];
  uint64_t v21 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "applyWithExtent:roiCallback:arguments:options:", v38, v20, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1), v15, v16, v18, v17), "imageByCroppingToRect:", v4, v6, v34, v33), "imageByClampingToExtent");
  id v22 = [(CIDisparityWeightsV3 *)self weightsYKernel];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __35__CIDisparityWeightsV3_outputImage__block_invoke_2;
  v36[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  int v37 = v10;
  double v23 = *v14;
  double v24 = v14[1];
  double v25 = v14[2];
  double v26 = v14[3];
  v42[0] = v11;
  v42[1] = v21;
  LODWORD(v27) = v10;
  v42[2] = [NSNumber numberWithFloat:v27];
  v42[3] = [(CIDisparityWeightsV3 *)self inputScale];
  *(float *)&double v28 = v35;
  v42[4] = [NSNumber numberWithFloat:v28];
  uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:5];
  v40 = @"kCIKernelOutputFormat";
  uint64_t v41 = [NSNumber numberWithInt:2054];
  return (id)objc_msgSend((id)objc_msgSend(v22, "applyWithExtent:roiCallback:arguments:options:", v36, v29, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1), v23, v24, v25, v26), "imageByCroppingToRect:", v32, v31, v34, v33);
}

double __35__CIDisparityWeightsV3_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, (float)-*(float *)(a1 + 32), 0.0);
  return result;
}

double __35__CIDisparityWeightsV3_outputImage__block_invoke_2(uint64_t a1, int a2, double result, double a4, double a5, double a6)
{
  if (a2) {
    *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&result, 0.0, (float)-*(float *)(a1 + 32));
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

@end