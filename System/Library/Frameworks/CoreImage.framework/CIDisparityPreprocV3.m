@interface CIDisparityPreprocV3
- (CIImage)inputAlphaImage;
- (CIImage)inputImage;
- (id)outputImage;
- (id)preprocKernel;
- (id)preprocKernelNoAlpha;
- (void)setInputAlphaImage:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIDisparityPreprocV3

- (id)preprocKernel
{
  if (-[CIDisparityPreprocV3 preprocKernel]::onceToken != -1) {
    dispatch_once(&-[CIDisparityPreprocV3 preprocKernel]::onceToken, &__block_literal_global_204);
  }
  return (id)-[CIDisparityPreprocV3 preprocKernel]::k;
}

id __37__CIDisparityPreprocV3_preprocKernel__block_invoke()
{
  id result = +[CIColorKernel SDOFV3MetalKernelNamed:@"disparity_refinement_preproc"];
  -[CIDisparityPreprocV3 preprocKernel]::k = (uint64_t)result;
  return result;
}

- (id)preprocKernelNoAlpha
{
  if (-[CIDisparityPreprocV3 preprocKernelNoAlpha]::onceToken != -1) {
    dispatch_once(&-[CIDisparityPreprocV3 preprocKernelNoAlpha]::onceToken, &__block_literal_global_209);
  }
  return (id)-[CIDisparityPreprocV3 preprocKernelNoAlpha]::k;
}

id __44__CIDisparityPreprocV3_preprocKernelNoAlpha__block_invoke()
{
  id result = +[CIColorKernel SDOFV3MetalKernelNamed:@"disparity_refinement_preproc_no_alpha"];
  -[CIDisparityPreprocV3 preprocKernelNoAlpha]::k = (uint64_t)result;
  return result;
}

- (id)outputImage
{
  v34[2] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  inputAlphaImage = self->inputAlphaImage;
  CGColorSpaceRef v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  CFAutorelease(v5);
  id v6 = +[CIImage imageYCC444:inputImage matrix:709 fullRange:1 colorSpace:v5];
  v7 = v6;
  if (inputAlphaImage)
  {
    [v6 extent];
    double v9 = v8;
    [(CIImage *)inputAlphaImage extent];
    CGFloat v11 = v9 / v10;
    [v7 extent];
    double v13 = v12;
    [(CIImage *)inputAlphaImage extent];
    memset(&v29, 0, sizeof(v29));
    CGAffineTransformMakeScale(&v29, v11, v13 / v14);
    CGAffineTransform v28 = v29;
    uint64_t v15 = [(CIImage *)inputAlphaImage imageByApplyingTransform:&v28];
    id v16 = [(CIDisparityPreprocV3 *)self preprocKernel];
    [v7 extent];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    v34[0] = v7;
    v34[1] = v15;
    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    v32 = @"kCIKernelOutputFormat";
    uint64_t v33 = [NSNumber numberWithInt:264];
    v26 = objc_msgSend(v16, "applyWithExtent:arguments:options:", v25, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1), v18, v20, v22, v24);
  }
  else
  {
    v30 = @"inputAVector";
    v31 = +[CIVector vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
    v26 = objc_msgSend(v7, "imageByApplyingFilter:withInputParameters:", @"CIColorMatrix", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
  }
  return (id)[v26 _imageByRenderingToIntermediate];
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputAlphaImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputAlphaImage:(id)a3
{
}

@end