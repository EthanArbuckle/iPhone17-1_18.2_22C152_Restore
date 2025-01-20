@interface CIPortraitBlurCombiner
- (CIImage)inputBlurImage;
- (CIImage)inputImage;
- (CIImage)inputMatteImage;
- (NSDictionary)inputTuningParameters;
- (id)_blendKernel:(BOOL)a3;
- (id)_ourBlendKernelMetal;
- (id)nonMetalKernel;
- (id)nonMetalKernelYCC;
- (id)outputImage;
- (void)setInputBlurImage:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputMatteImage:(id)a3;
- (void)setInputTuningParameters:(id)a3;
@end

@implementation CIPortraitBlurCombiner

- (id)_blendKernel:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = SDOFV2MetalLibURL();
  if (v3) {
    v5 = @"_CIPortraitBlurBlendWithMaskFromAlphaWithMatte";
  }
  else {
    v5 = @"_CIPortraitBlurBlendWithMaskFromAlphaM";
  }

  return +[CIKernel cachedKernelWithFunctionName:v5 fromMetalLibrary:v4 error:0];
}

- (id)nonMetalKernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_CIPortraitBlurBlendWithMaskMatteFromAlpha];
}

- (id)nonMetalKernelYCC
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_CIPortraitBlurBlendWithMaskMatteFromAlphaYCC];
}

- (id)_ourBlendKernelMetal
{
  if (-[CIPortraitBlurCombiner _ourBlendKernelMetal]::onceToken != -1) {
    dispatch_once(&-[CIPortraitBlurCombiner _ourBlendKernelMetal]::onceToken, &__block_literal_global_504);
  }
  return (id)-[CIPortraitBlurCombiner _ourBlendKernelMetal]::k;
}

id __46__CIPortraitBlurCombiner__ourBlendKernelMetal__block_invoke()
{
  id result = +[CIColorKernel SDOFV2MetalKernelNamed:@"_CIPortraitBlurBlendWithMaskFromAlphaM"];
  -[CIPortraitBlurCombiner _ourBlendKernelMetal]::k = (uint64_t)result;
  return result;
}

- (id)outputImage
{
  v90[4] = *MEMORY[0x1E4F143B8];
  SDOFRenderingValue(&cfstr_Alphagain.isa, self->inputTuningParameters);
  float v4 = v3;
  SDOFRenderingValue(&cfstr_Alphaepsilon.isa, self->inputTuningParameters);
  float v6 = v5;
  [(CIImage *)self->inputBlurImage extent];
  float v8 = v7;
  inputMatteImage = self->inputMatteImage;
  if (!inputMatteImage
    || ([(CIImage *)inputMatteImage extent], v10 <= 1.0)
    || ([(CIImage *)self->inputMatteImage extent], v11 == 0.0))
  {
    v12 = 0;
  }
  else
  {
    v12 = self->inputMatteImage;
  }
  SDOFRenderingValue(&cfstr_Maxblur.isa, self->inputTuningParameters);
  double v14 = v13;
  SDOFRenderingValue(&cfstr_Sharpradius.isa, self->inputTuningParameters);
  double v16 = v15;
  SDOFRenderingValue(&cfstr_Softradius.isa, self->inputTuningParameters);
  v18 = +[CIVector vectorWithX:v14 Y:v16 Z:v17 W:v8];
  [(CIImage *)self->inputImage extent];
  double v20 = v19;
  [(CIImage *)self->inputBlurImage extent];
  *(float *)&double v16 = v20 / v21;
  [(CIImage *)self->inputImage extent];
  double v23 = v22;
  [(CIImage *)self->inputBlurImage extent];
  float v25 = v23 / v24;
  memset(&v83, 0, sizeof(v83));
  CGAffineTransformMakeScale(&v83, *(float *)&v16, v25);
  inputBlurImage = self->inputBlurImage;
  CGAffineTransform v82 = v83;
  uint64_t v27 = [(CIImage *)inputBlurImage imageByApplyingTransform:&v82];
  uint64_t v28 = 0;
  if (v4 != 0.0 && v6 != 0.0 && v12)
  {
    [(CIImage *)self->inputImage extent];
    double v30 = v29;
    [(CIImage *)v12 extent];
    float v32 = v30 / v31;
    [(CIImage *)self->inputImage extent];
    double v34 = v33;
    [(CIImage *)v12 extent];
    float v36 = v34 / v35;
    memset(&v81, 0, sizeof(v81));
    CGAffineTransformMakeScale(&v81, v32, v36);
    CGAffineTransform v80 = v81;
    uint64_t v28 = [(CIImage *)v12 imageByApplyingTransform:&v80];
  }
  SDOFRenderingValue(&cfstr_Blendingquarte.isa, self->inputTuningParameters);
  float v38 = v37;
  SDOFRenderingValue(&cfstr_Blendingfullre.isa, self->inputTuningParameters);
  BOOL v39 = fabsf(v38) >= 0.001;
  if (fabsf(v40) >= 0.001) {
    BOOL v39 = 1;
  }
  if (!v28 || !v39)
  {
    id v62 = [(CIPortraitBlurCombiner *)self _ourBlendKernelMetal];
    [(CIImage *)self->inputImage extent];
    double v53 = v63;
    double v55 = v64;
    double v57 = v65;
    double v59 = v66;
    v84[0] = self->inputImage;
    v84[1] = v27;
    v84[2] = v18;
    uint64_t v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:3];
    v61 = v62;
    return (id)objc_msgSend(v61, "applyWithExtent:arguments:", v60, v53, v55, v57, v59);
  }
  SDOFRenderingValue(&cfstr_Blendingquarte.isa, self->inputTuningParameters);
  float v42 = v41;
  SDOFRenderingValue(&cfstr_Blendingfullre.isa, self->inputTuningParameters);
  float v44 = v43;
  SDOFRenderingValue(&cfstr_Maxblur.isa, self->inputTuningParameters);
  double v46 = (float)(v45 * v8);
  SDOFRenderingValue(&cfstr_Sharpradius.isa, self->inputTuningParameters);
  double v48 = v47;
  SDOFRenderingValue(&cfstr_Softradius.isa, self->inputTuningParameters);
  v50 = +[CIVector vectorWithX:v46 Y:v48 Z:v49 W:v44];
  if (vabds_f32(v42, v44) < 0.001)
  {
    id v51 = [(CIPortraitBlurCombiner *)self nonMetalKernel];
    [(CIImage *)self->inputImage extent];
    double v53 = v52;
    double v55 = v54;
    double v57 = v56;
    double v59 = v58;
    v90[0] = self->inputImage;
    v90[1] = v27;
    v90[2] = v28;
    v90[3] = v50;
    uint64_t v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:4];
    v61 = v51;
    return (id)objc_msgSend(v61, "applyWithExtent:arguments:", v60, v53, v55, v57, v59);
  }
  id v68 = +[CIImage imageYCC444:self->inputImage matrix:709 fullRange:1 colorSpace:[(CIImage *)self->inputImage colorSpace]];
  id v69 = [(CIPortraitBlurCombiner *)self nonMetalKernelYCC];
  [(CIImage *)self->inputImage extent];
  double v71 = v70;
  double v73 = v72;
  double v75 = v74;
  double v77 = v76;
  v89[0] = v68;
  v89[1] = v27;
  v89[2] = v28;
  v89[3] = v50;
  *(float *)&double v70 = v42;
  v89[4] = [NSNumber numberWithFloat:v70];
  v78 = objc_msgSend(v69, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v89, 5), v71, v73, v75, v77);
  v87 = @"inputBiasVector";
  v88 = +[CIVector vectorWithX:0.0 Y:0.501960814 Z:0.501960814];
  v79 = objc_msgSend(v78, "imageByApplyingFilter:withInputParameters:", @"CIColorMatrix", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1));
  v85[0] = @"inputRVector";
  v86[0] = +[CIVector vectorWithX:0.212599993 Y:0.715200007 Z:0.0722000003];
  v85[1] = @"inputGVector";
  v86[1] = +[CIVector vectorWithX:-0.114122704 Y:-0.383916527 Z:0.498039216];
  v85[2] = @"inputBVector";
  v86[2] = +[CIVector vectorWithX:0.498039216 Y:-0.452372015 Z:-0.0456672079];
  return (id)objc_msgSend(v79, "imageByApplyingFilter:withInputParameters:", @"CIColorMatrix", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v86, v85, 3));
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputBlurImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputBlurImage:(id)a3
{
}

- (CIImage)inputMatteImage
{
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputMatteImage:(id)a3
{
}

- (NSDictionary)inputTuningParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputTuningParameters:(id)a3
{
}

@end