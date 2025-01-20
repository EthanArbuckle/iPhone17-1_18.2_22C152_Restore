@interface CISparseRenderer
+ (id)customAttributes;
- (BOOL)_useD2XRenderer;
- (CIImage)inputImage;
- (CIImage)inputMatteImage;
- (NSDictionary)inputTuningParameters;
- (NSNumber)inputAperture;
- (NSNumber)inputApertureScaling;
- (NSNumber)inputDraftMode;
- (NSNumber)inputScale;
- (id)_kernel:(BOOL)a3 alpha:(BOOL)a4;
- (id)_lutKernel:(BOOL)a3 alpha:(BOOL)a4;
- (id)_packageParams:(BOOL)a3 extent:(CGRect)a4 image:(id)a5 haveAlpha:(BOOL)a6;
- (id)baseVecsLUT:(unsigned int)a3;
- (id)baseVecsLUTGenerator;
- (id)outputImage;
- (id)stepsLUT:(unsigned int)a3;
- (id)stepsLUTGenerator;
- (void)setInputAperture:(id)a3;
- (void)setInputApertureScaling:(id)a3;
- (void)setInputDraftMode:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputMatteImage:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputTuningParameters:(id)a3;
@end

@implementation CISparseRenderer

+ (id)customAttributes
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"inputScale";
  v6[0] = @"CIAttributeType";
  v6[1] = @"CIAttributeSliderMin";
  v7[0] = @"CIAttributeTypeScalar";
  v7[1] = &unk_1EE4A9870;
  v6[2] = @"CIAttributeSliderMax";
  v6[3] = @"CIAttributeDefault";
  v7[2] = &unk_1EE4A9830;
  v7[3] = &unk_1EE4A9830;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
  v8[1] = @"inputDraftMode";
  v9[0] = v2;
  v4[0] = @"CIAttributeType";
  v4[1] = @"CIAttributeSliderMin";
  v5[0] = @"CIAttributeTypeInteger";
  v5[1] = &unk_1EE4AACB8;
  v4[2] = @"CIAttributeSliderMax";
  v4[3] = @"CIAttributeDefault";
  v5[2] = &unk_1EE4AAD00;
  v5[3] = &unk_1EE4AACB8;
  v9[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
}

- (id)_packageParams:(BOOL)a3 extent:(CGRect)a4 image:(id)a5 haveAlpha:(BOOL)a6
{
  BOOL v73 = a3;
  BOOL v74 = a6;
  double width = a4.size.width;
  double height = a4.size.height;
  v77[6] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputApertureScaling floatValue];
  float v9 = v8;
  double v10 = v8;
  SDOFRenderingValue(&cfstr_Ringamplitude.isa, self->inputTuningParameters);
  float v69 = v11;
  SDOFRenderingValue(&cfstr_Ringsharpness.isa, self->inputTuningParameters);
  float v67 = v12;
  SDOFRenderingValue(&cfstr_Highlightboost.isa, self->inputTuningParameters);
  float v66 = v13;
  SDOFRenderingValue(&cfstr_Relativeweight.isa, self->inputTuningParameters);
  float v15 = v14;
  SDOFRenderingValue(&cfstr_Maxblur.isa, self->inputTuningParameters);
  float v17 = 0.5 / (float)(v15 / v16);
  SDOFRenderingValue(&cfstr_Relativeweight.isa, self->inputTuningParameters);
  float v19 = v17 * v18;
  SDOFRenderingValue(&cfstr_Maxblur.isa, self->inputTuningParameters);
  float v65 = v19 / v20;
  SDOFRenderingValue(&cfstr_Maxblur.isa, self->inputTuningParameters);
  float v22 = v21;
  SDOFRenderingValue(&cfstr_Shapeobstructi.isa, self->inputTuningParameters);
  BOOL v24 = v10 * v23 <= 1.0;
  double v25 = 1.0;
  if (v24)
  {
    SDOFRenderingValue(&cfstr_Shapeobstructi.isa, self->inputTuningParameters);
    double v25 = (float)(v9 * v26);
  }
  double v64 = v25;
  SDOFRenderingValue(&cfstr_Sharpradius.isa, self->inputTuningParameters);
  float v61 = v27;
  SDOFRenderingValue(&cfstr_Basepixelweigh.isa, self->inputTuningParameters);
  float v63 = v28;
  SDOFRenderingValue(&cfstr_Alphaepsilon.isa, self->inputTuningParameters);
  double v62 = v29;
  float v60 = 1.0 - v29;
  SDOFRenderingValue(&cfstr_Alphagain.isa, self->inputTuningParameters);
  float v59 = v30;
  inputTuningParameters = self->inputTuningParameters;
  [(NSNumber *)self->inputScale floatValue];
  int v33 = nRingsFromTuningParameters(inputTuningParameters, v32, +[CIDepthBlurEffect getDraftMode:[(CISparseRenderer *)self inputDraftMode]], self->inputAperture);
  SDOFHighlightRecoveryValue(&cfstr_Blurradiust0.isa, self->inputTuningParameters);
  double v35 = v22;
  float v36 = v10 * v34 / v22;
  SDOFHighlightRecoveryValue(&cfstr_Blurradiust1.isa, self->inputTuningParameters);
  float v38 = v10 * v37 / v35;
  float v39 = 1.0 / (float)(v38 - v36);
  float v40 = -(float)(v39 * v36);
  SDOFHighlightRecoveryValue(&cfstr_Mode.isa, self->inputTuningParameters);
  float v42 = v41;
  SDOFHighlightRecoveryValue(&cfstr_Prefiltergain.isa, self->inputTuningParameters);
  float v44 = v43;
  SDOFHighlightRecoveryValue(&cfstr_Weightgain.isa, self->inputTuningParameters);
  float v46 = v45;
  SDOFHighlightRecoveryValue(&cfstr_Intensitygain.isa, self->inputTuningParameters);
  float v48 = v47;
  v49 = +[CIVector vectorWithX:v69 Y:v67 Z:v66 W:v17];
  v68 = +[CIVector vectorWithX:v65 Y:v35 Z:v64 W:v61];
  v50 = +[CIVector vectorWithX:v63 Y:v62 Z:v60 W:v59];
  v51 = +[CIVector vectorWithX:(double)v33 Y:v39 Z:v40 W:(double)(3 * v33 * v33)];
  double v52 = 0.0;
  if (v42 >= 0.0) {
    double v52 = 1.0;
  }
  v70 = +[CIVector vectorWithX:v52 Y:v44 Z:v46 W:v48];
  v53 = +[CIVector vectorWithX:width Y:height Z:(double)v74];
  v54 = (void *)MEMORY[0x1E4F1CA48];
  v77[0] = a5;
  v77[1] = v49;
  v77[2] = v68;
  v77[3] = v50;
  v77[4] = v51;
  v77[5] = +[CIVector vectorWithX:width Y:height];
  v55 = objc_msgSend(v54, "arrayWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v77, 6));
  v56 = v55;
  if (v74) {
    [v55 insertObject:self->inputMatteImage atIndex:1];
  }
  v76[0] = a5;
  v76[1] = v49;
  v76[2] = v68;
  v76[3] = v50;
  v76[4] = v51;
  v76[5] = v70;
  v76[6] = v53;
  id result = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:7];
  if (v74)
  {
    inputMatteImage = self->inputMatteImage;
    v75[0] = a5;
    v75[1] = inputMatteImage;
    v75[2] = v49;
    v75[3] = v68;
    v75[4] = v50;
    v75[5] = v51;
    v75[6] = v70;
    v75[7] = v53;
    id result = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:8];
  }
  if (v73) {
    return v56;
  }
  return result;
}

- (BOOL)_useD2XRenderer
{
  SDOFRenderingValue(&cfstr_Ringamplitude.isa, self->inputTuningParameters);
  float v4 = v3;
  SDOFRenderingValue(&cfstr_Shapeobstructi.isa, self->inputTuningParameters);
  if (v5 <= 1.0)
  {
    SDOFRenderingValue(&cfstr_Shapeobstructi.isa, self->inputTuningParameters);
    BOOL v6 = v7 == 0.0;
  }
  else
  {
    BOOL v6 = 0;
  }
  SDOFHighlightRecoveryValue(&cfstr_Weightgain.isa, self->inputTuningParameters);
  float v9 = v8;
  SDOFHighlightRecoveryValue(&cfstr_Intensitygain.isa, self->inputTuningParameters);
  float v11 = v10;
  SDOFRenderingValue(&cfstr_Alphagain.isa, self->inputTuningParameters);
  float v13 = v12;
  SDOFRenderingValue(&cfstr_Alphaepsilon.isa, self->inputTuningParameters);
  BOOL v15 = v4 != 1.0 || !v6;
  if (v15 || v9 != 0.0 || v11 != 0.0) {
    return 0;
  }
  BOOL result = 1;
  if (self->inputMatteImage)
  {
    if (v13 != 0.0 && v14 != 1.0) {
      return 0;
    }
  }
  return result;
}

- (id)stepsLUTGenerator
{
  uint64_t v2 = SDOFV2MetalLibURL();

  return +[CIKernel cachedKernelWithFunctionName:@"_sparserendering_stepLUT" fromMetalLibrary:v2 error:0];
}

- (id)baseVecsLUTGenerator
{
  uint64_t v2 = SDOFV2MetalLibURL();

  return +[CIKernel cachedKernelWithFunctionName:@"_sparserendering_baseVecLUT" fromMetalLibrary:v2 error:0];
}

- (id)stepsLUT:(unsigned int)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = 3 * a3 * a3;
  id v4 = [(CISparseRenderer *)self stepsLUTGenerator];
  double v5 = (double)v3;
  v10[0] = [NSNumber numberWithUnsignedLong:v3];
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", 2056, @"kCIKernelOutputFormat");
  return (id)objc_msgSend(v4, "applyWithExtent:arguments:options:", v6, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1), 0.0, 0.0, v5, 1.0);
}

- (id)baseVecsLUT:(unsigned int)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  unsigned int v3 = 3 * a3 * a3;
  id v4 = [(CISparseRenderer *)self baseVecsLUTGenerator];
  float v7 = @"kCIKernelOutputFormat";
  v8[0] = [NSNumber numberWithInt:2054];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  return (id)objc_msgSend(v4, "applyWithExtent:arguments:options:", MEMORY[0x1E4F1CBF0], v5, 0.0, 0.0, (double)v3, 1.0);
}

- (id)_lutKernel:(BOOL)a3 alpha:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v6 = SDOFV2MetalLibURL();
  float v7 = @"_sparserendering_opt2x_sample_noAlphaLUT";
  if (v4) {
    float v7 = @"_sparserendering_opt2x_sample_withAlphaLUT";
  }
  uint64_t v8 = @"_sparserendering_sample_withAlphaLUT";
  if (!v4) {
    uint64_t v8 = @"_sparserendering_sample_noAlphaLUT";
  }
  if (v5) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = v8;
  }

  return +[CIKernel cachedKernelWithFunctionName:v9 fromMetalLibrary:v6 error:0];
}

- (id)_kernel:(BOOL)a3 alpha:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v6 = SDOFV2MetalLibURL();
  float v7 = @"_sparserendering_opt2x_sample";
  if (v4) {
    float v7 = @"_sparserendering_opt2x_sampleWithAlpha";
  }
  uint64_t v8 = @"_sparserendering_sample_h";
  if (!v4) {
    uint64_t v8 = @"_sparserendering_opt_sample_h";
  }
  if (v5) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = v8;
  }

  return +[CIKernel cachedKernelWithFunctionName:v9 fromMetalLibrary:v6 error:0];
}

- (id)outputImage
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CISparseRenderer *)self _useD2XRenderer];
  uint64_t v4 = 96;
  SDOFRenderingValue(&cfstr_Alphaepsilon.isa, self->inputTuningParameters);
  BOOL v5 = &off_19394C000;
  if (v6 == 1.0)
  {
    BOOL v7 = 0;
    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x2020000000;
    BOOL v72 = 0;
  }
  else
  {
    SDOFRenderingValue(&cfstr_Alphagain.isa, self->inputTuningParameters);
    BOOL v7 = 0;
    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x2020000000;
    BOOL v72 = 0;
    if (v8 != 0.0)
    {
      inputMatteImage = self->inputMatteImage;
      if (inputMatteImage && ([(CIImage *)inputMatteImage extent], v10 > 1.0))
      {
        [(CIImage *)self->inputImage extent];
        BOOL v7 = v11 > 1.0;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
  }
  BOOL v72 = v7;
  if (-[CISparseRenderer outputImage]::onceToken != -1) {
    dispatch_once(&-[CISparseRenderer outputImage]::onceToken, &__block_literal_global_56);
  }
  inputTuningParameters = self->inputTuningParameters;
  [(NSNumber *)self->inputScale floatValue];
  uint64_t v14 = nRingsFromTuningParameters(inputTuningParameters, v13, +[CIDepthBlurEffect getDraftMode:[(CISparseRenderer *)self inputDraftMode]], self->inputAperture);
  BOOL v15 = &CI::print_graph_recursive<CI::Image,CI::ImageIndex,CI::Image::ImageStats>(__sFILE *,CI::Image const*,int,std::unordered_map<CI::ImageIndex,CI::Image::ImageStats> const&)::indent_str[64];
  if (-[CISparseRenderer outputImage]::useLUTBasedImages)
  {
    uint64_t v16 = v14;
    id v17 = [(CISparseRenderer *)self stepsLUT:v14];
    id v18 = [(CISparseRenderer *)self baseVecsLUT:v16];
    id v19 = [(CISparseRenderer *)self _lutKernel:v3 alpha:*((unsigned __int8 *)v70 + 24)];
  }
  else
  {
    id v19 = [(CISparseRenderer *)self _kernel:v3 alpha:*((unsigned __int8 *)v70 + 24)];
    id v18 = 0;
    id v17 = 0;
  }
  [(CIImage *)self->inputImage extent];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  float v28 = [(CIImage *)self->inputImage imageByClampingToExtent];
  id v29 = -[CISparseRenderer _packageParams:extent:image:haveAlpha:](self, "_packageParams:extent:image:haveAlpha:", v3, v28, *((unsigned __int8 *)v70 + 24), v21, v23, v25, v27);
  float v30 = v29;
  if (-[CISparseRenderer outputImage]::useLUTBasedImages)
  {
    v31 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v29, "count") + 2);
    [v31 addObject:v17];
    [v31 addObject:v18];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    uint64_t v32 = [v30 countByEnumeratingWithState:&v65 objects:v75 count:16];
    if (v32)
    {
      id v54 = v17;
      id v55 = v18;
      id v56 = v19;
      uint64_t v57 = 96;
      int v33 = 0;
      uint64_t v34 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v66 != v34) {
            objc_enumerationMutation(v30);
          }
          uint64_t v36 = *(void *)(*((void *)&v65 + 1) + 8 * i);
          if (v36)
          {
            objc_opt_class();
            int v37 = objc_opt_isKindOfClass() & 1;
            if (v37) {
              int v38 = v33 + 1;
            }
            else {
              int v38 = v33;
            }
            if (v37 && (!*((unsigned char *)v70 + 24) ? (BOOL v39 = v33 == 1) : (BOOL v39 = 0), v39))
            {
              int v33 = 2;
            }
            else
            {
              objc_msgSend(v31, "addObject:", v36, v54, v55, v56, v57);
              int v33 = v38;
            }
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v65 objects:v75 count:16];
      }
      while (v32);
      float v30 = v31;
      id v19 = v56;
      uint64_t v4 = v57;
      BOOL v5 = &off_19394C000;
      BOOL v15 = CI::print_graph_recursive<CI::Image,CI::ImageIndex,CI::Image::ImageStats>(__sFILE *,CI::Image const*,int,std::unordered_map<CI::ImageIndex,CI::Image::ImageStats> const&)::indent_str
          + 64;
      id v17 = v54;
      id v18 = v55;
    }
    else
    {
      float v30 = v31;
      BOOL v5 = &off_19394C000;
    }
  }
  v63[0] = 0;
  v63[1] = v63;
  uint64_t v40 = *((void *)v5 + 288);
  v63[2] = v40;
  double v64 = 0.0;
  SDOFRenderingValue(&cfstr_Maxblur.isa, *(void **)((char *)&self->super.super.isa + v4));
  if (v25 <= v27) {
    double v42 = v27;
  }
  else {
    double v42 = v25;
  }
  double v64 = v42 * v41;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = v40;
  unint64_t v62 = 0;
  if (v17)
  {
    [v17 extent];
    unint64_t v44 = (unint64_t)v43;
  }
  else
  {
    unint64_t v44 = 0;
  }
  unint64_t v62 = v44;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = v40;
  unint64_t v60 = 0;
  if (v18)
  {
    [v18 extent];
    unint64_t v46 = (unint64_t)v45;
  }
  else
  {
    unint64_t v46 = 0;
  }
  unint64_t v60 = v46;
  double v47 = *MEMORY[0x1E4F1DB10];
  double v48 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v49 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v50 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  BOOL v73 = @"kCIKernelOutputFormat";
  uint64_t v74 = objc_msgSend(NSNumber, "numberWithInt:", 2056, v54, v55, v56, v57, MEMORY[0x1E4F143A8], 3221225472, __31__CISparseRenderer_outputImage__block_invoke_2, &unk_1E57729B0, v61, v59, &v69, v63);
  v51 = objc_msgSend(v19, "applyWithExtent:roiCallback:arguments:options:", &v58, v30, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1), v47, v48, v49, v50);
  double v52 = v51;
  if (v15[1504]) {
    double v52 = objc_msgSend(v51, "imageByCroppingToRect:", v21, v23, v25, v27);
  }
  _Block_object_dispose(v59, 8);
  _Block_object_dispose(v61, 8);
  _Block_object_dispose(v63, 8);
  _Block_object_dispose(&v69, 8);
  return v52;
}

uint64_t __31__CISparseRenderer_outputImage__block_invoke()
{
  v0 = getenv("CI_SDOF_LUT");
  if (v0) {
    uint64_t result = atoi(v0);
  }
  else {
    uint64_t result = -[CISparseRenderer outputImage]::useLUTBasedImages;
  }
  -[CISparseRenderer outputImage]::useLUTBasedImages = result != 0;
  return result;
}

double __31__CISparseRenderer_outputImage__block_invoke_2(uint64_t a1, unsigned int a2, double a3, double a4, double a5, double a6)
{
  if (-[CISparseRenderer outputImage]::useLUTBasedImages && a2 < 2) {
    return 0.0;
  }
  if (-[CISparseRenderer outputImage]::useLUTBasedImages) {
    unsigned int v6 = a2 - 2;
  }
  else {
    unsigned int v6 = a2;
  }
  if (v6 == 1 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    return *MEMORY[0x1E4F1DB28];
  }
  CGFloat v7 = -*(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a3, v7, v7);
  return result;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputMatteImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputMatteImage:(id)a3
{
}

- (NSDictionary)inputTuningParameters
{
  return self->inputTuningParameters;
}

- (void)setInputTuningParameters:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

- (NSNumber)inputApertureScaling
{
  return self->inputApertureScaling;
}

- (void)setInputApertureScaling:(id)a3
{
}

- (NSNumber)inputDraftMode
{
  return self->inputDraftMode;
}

- (void)setInputDraftMode:(id)a3
{
}

- (NSNumber)inputAperture
{
  return self->inputAperture;
}

- (void)setInputAperture:(id)a3
{
}

@end