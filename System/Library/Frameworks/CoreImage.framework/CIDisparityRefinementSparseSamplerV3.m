@interface CIDisparityRefinementSparseSamplerV3
- (CIImage)inputImage;
- (CIImage)inputPreprocImage;
- (NSDictionary)inputTuningParameters;
- (NSNumber)inputScale;
- (id)outputImage;
- (id)sampleKernel;
- (void)setInputImage:(id)a3;
- (void)setInputPreprocImage:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputTuningParameters:(id)a3;
@end

@implementation CIDisparityRefinementSparseSamplerV3

- (id)sampleKernel
{
  if (-[CIDisparityRefinementSparseSamplerV3 sampleKernel]::onceToken != -1) {
    dispatch_once(&-[CIDisparityRefinementSparseSamplerV3 sampleKernel]::onceToken, &__block_literal_global_231);
  }
  return (id)-[CIDisparityRefinementSparseSamplerV3 sampleKernel]::k;
}

id __52__CIDisparityRefinementSparseSamplerV3_sampleKernel__block_invoke()
{
  id result = +[CIKernel SDOFV3MetalKernelNamed:@"disparity_refinement_sample"];
  -[CIDisparityRefinementSparseSamplerV3 sampleKernel]::k = (uint64_t)result;
  return result;
}

- (id)outputImage
{
  v70[6] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  inputPreprocImage = self->inputPreprocImage;
  [(CIImage *)inputImage extent];
  double v6 = v5;
  double v63 = v7;
  [(CIImage *)inputPreprocImage extent];
  double v61 = v8;
  double v62 = v9;
  [(NSNumber *)[(CIDisparityRefinementSparseSamplerV3 *)self inputScale] floatValue];
  float v11 = v10;
  SDOFDisparityRefinementParameterValue(&cfstr_Radius.isa, self->inputTuningParameters);
  float v13 = v11 * v12;
  [(CIImage *)inputPreprocImage extent];
  float v15 = v14;
  [(CIImage *)inputImage extent];
  float v17 = v16;
  float v60 = (float)(v13 * v15) / v17;
  SDOFDisparityRefinementParameterValue(&cfstr_Maxreconstruct.isa, self->inputTuningParameters);
  float v59 = v18;
  if (v11 >= 0.5) {
    double v19 = v11;
  }
  else {
    double v19 = 0.5;
  }
  SDOFDisparityRefinementParameterValue(&cfstr_Nsamples.isa, self->inputTuningParameters);
  float v21 = v19 * v20;
  float v58 = ceilf(v21);
  SDOFDisparityRefinementParameterValue(&cfstr_Disparitysigma.isa, self->inputTuningParameters);
  float v57 = -1.0 / (float)((float)(v22 * v22) + (float)(v22 * v22));
  SDOFDisparityRefinementParameterValue(&cfstr_Lumasigma.isa, self->inputTuningParameters);
  float v24 = v23;
  SDOFDisparityRefinementParameterValue(&cfstr_Chromasigma.isa, self->inputTuningParameters);
  float v26 = v25;
  SDOFDisparityRefinementParameterValue(&cfstr_Segmentationsi.isa, self->inputTuningParameters);
  float v27 = -1.0 / (float)((float)(v26 * v26) + (float)(v26 * v26));
  float v29 = -1.0 / (float)((float)(v28 * v28) + (float)(v28 * v28));
  SDOFDisparityRefinementParameterValue(&cfstr_Accumulatedwei.isa, self->inputTuningParameters);
  float v56 = v30;
  SDOFDisparityRefinementParameterValue(&cfstr_Accumulatedwei_0.isa, self->inputTuningParameters);
  float v32 = v31;
  SDOFDisparityRefinementParameterValue(&cfstr_Innersamplingr.isa, self->inputTuningParameters);
  float v34 = v11 * v33;
  SDOFDisparityRefinementParameterValue(&cfstr_Outersamplingr.isa, self->inputTuningParameters);
  float v36 = v61 * v13 / v6;
  float v37 = v36 * v36;
  float v38 = v37 * (float)(v34 * v34);
  float v39 = v37 * (float)((float)(v11 * v35) * (float)(v11 * v35));
  v40 = +[CIVector vectorWithX:v60 Y:v59 Z:v58 W:v57];
  v41 = +[CIVector vectorWithX:(float)(-1.0 / (float)((float)(v24 * v24) + (float)(v24 * v24))) Y:v27 Z:v27 W:v29];
  v42 = +[CIVector vectorWithX:v38 Y:v39 Z:v56 W:v32];
  v43 = +[CIVector vectorWithX:v61 Y:v62];
  id v44 = [(CIDisparityRefinementSparseSamplerV3 *)self sampleKernel];
  memset(&v67, 0, sizeof(v67));
  CGAffineTransformMakeScale(&v67, v61 / v6, v62 / v63);
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __51__CIDisparityRefinementSparseSamplerV3_outputImage__block_invoke;
  v65[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  float v66 = v60;
  CGAffineTransform v64 = v67;
  v45 = [(CIImage *)inputImage imageByApplyingTransform:&v64];
  [(CIImage *)inputPreprocImage extent];
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;
  double v53 = v52;
  v70[0] = [(CIImage *)inputPreprocImage imageByClampingToExtent];
  v70[1] = [(CIImage *)v45 imageByClampingToExtent];
  v70[2] = v40;
  v70[3] = v41;
  v70[4] = v42;
  v70[5] = v43;
  uint64_t v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:6];
  v68 = @"kCIKernelOutputFormat";
  uint64_t v69 = [NSNumber numberWithInt:2053];
  return (id)objc_msgSend(v44, "applyWithExtent:roiCallback:arguments:options:", v65, v54, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1), v47, v49, v51, v53);
}

double __51__CIDisparityRefinementSparseSamplerV3_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, (float)-*(float *)(a1 + 32), (float)-*(float *)(a1 + 32));
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

- (NSDictionary)inputTuningParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputTuningParameters:(id)a3
{
}

- (NSNumber)inputScale
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputScale:(id)a3
{
}

@end