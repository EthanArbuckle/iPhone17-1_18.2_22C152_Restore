@interface CIDisparityRefinement
+ (id)customAttributes;
- (CIImage)inputDisparityImage;
- (CIImage)inputImage;
- (CIVector)inputOriginalSize;
- (NSNumber)inputPropagateKernel;
- (NSNumber)inputPropagateMinWeightSum;
- (NSNumber)inputPropagateSigmaChma;
- (NSNumber)inputPropagateSigmaLuma;
- (NSNumber)inputScale;
- (NSNumber)inputSmoothSigma;
- (id)_combineImages;
- (id)_initialConversionRGB;
- (id)_propagateDisparity;
- (id)_propagateDisparityCombined;
- (id)_propagateDisparityR1;
- (id)_propagateDisparityR1Combined;
- (id)_pyramidGenerateLevel;
- (id)_smoothDisparity;
- (id)generatePyramidLevel:(id)a3 useMetal:(BOOL)a4;
- (id)initialConversionForSize:(CGSize)a3 useMetal:(BOOL)a4;
- (id)outputImage;
- (id)outputImageUsingMetal:(BOOL)a3;
- (id)propagateDisparity:(id)a3 pyramids:(id *)a4 useMetal:(BOOL)a5 computedPyramidLevels:(int)a6;
- (id)shiftmapLevelZeroWithSize:(CGSize)a3 useMetal:(BOOL)a4;
- (id)smoothDisparityImage:(id)a3 useMetal:(BOOL)a4;
- (void)setInputDisparityImage:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputOriginalSize:(id)a3;
- (void)setInputPropagateKernel:(id)a3;
- (void)setInputPropagateMinWeightSum:(id)a3;
- (void)setInputPropagateSigmaChma:(id)a3;
- (void)setInputPropagateSigmaLuma:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputSmoothSigma:(id)a3;
@end

@implementation CIDisparityRefinement

+ (id)customAttributes
{
  v15[8] = *MEMORY[0x1E4F143B8];
  v14[0] = @"CIAttributeFilterCategories";
  v13[0] = @"CICategoryColorAdjustment";
  v13[1] = @"CICategoryVideo";
  v13[2] = @"CICategoryStillImage";
  v13[3] = @"CICategoryBuiltIn";
  v13[4] = @"CICategoryApplePrivate";
  v15[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:5];
  v15[1] = @"11";
  v14[1] = @"CIAttributeFilterAvailable_iOS";
  v14[2] = @"CIAttributeFilterAvailable_Mac";
  v15[2] = @"10.13";
  v14[3] = @"inputPropagateKernel";
  v11[0] = @"CIAttributeSliderMin";
  v11[1] = @"CIAttributeSliderMax";
  v12[0] = &unk_1EE4A8500;
  v12[1] = &unk_1EE4A8510;
  v11[2] = @"CIAttributeMin";
  v11[3] = @"CIAttributeMax";
  v12[2] = &unk_1EE4A8500;
  v12[3] = &unk_1EE4A8510;
  v11[4] = @"CIAttributeDefault";
  v11[5] = @"CIAttributeType";
  v12[4] = &unk_1EE4A8520;
  v12[5] = @"CIAttributeTypeScalar";
  v15[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:6];
  v14[4] = @"inputSmoothSigma";
  v9[0] = @"CIAttributeSliderMin";
  v9[1] = @"CIAttributeSliderMax";
  v10[0] = &unk_1EE4A8500;
  v10[1] = &unk_1EE4A8520;
  v9[2] = @"CIAttributeMin";
  v9[3] = @"CIAttributeMax";
  v10[2] = &unk_1EE4A8500;
  v10[3] = &unk_1EE4A8520;
  v9[4] = @"CIAttributeDefault";
  v9[5] = @"CIAttributeType";
  v10[4] = &unk_1EE4A8530;
  v10[5] = @"CIAttributeTypeScalar";
  v15[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v14[5] = @"inputPropogateMinWeightSum";
  v7[0] = @"CIAttributeSliderMin";
  v7[1] = @"CIAttributeSliderMax";
  v8[0] = &unk_1EE4A8500;
  v8[1] = &unk_1EE4A8540;
  v8[2] = &unk_1EE4A8500;
  v8[3] = &unk_1EE4A8540;
  v7[2] = @"CIAttributeMin";
  v7[3] = @"CIAttributeMax";
  v7[4] = @"CIAttributeDefault";
  v7[5] = @"CIAttributeType";
  v8[4] = &unk_1EE4A8550;
  v8[5] = @"CIAttributeTypeScalar";
  v15[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v14[6] = @"inputPropogateSigmaLuma";
  v5[0] = @"CIAttributeSliderMin";
  v5[1] = @"CIAttributeSliderMax";
  v6[0] = &unk_1EE4A8500;
  v6[1] = &unk_1EE4A8560;
  v5[2] = @"CIAttributeMin";
  v5[3] = @"CIAttributeMax";
  v6[2] = &unk_1EE4A8500;
  v6[3] = &unk_1EE4A8560;
  v5[4] = @"CIAttributeDefault";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4A8570;
  v6[5] = @"CIAttributeTypeScalar";
  v15[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v14[7] = @"inputPropogateSigmaChroma";
  v3[0] = @"CIAttributeSliderMin";
  v3[1] = @"CIAttributeSliderMax";
  v4[0] = &unk_1EE4A8500;
  v4[1] = &unk_1EE4A8560;
  v3[2] = @"CIAttributeMin";
  v3[3] = @"CIAttributeMax";
  v4[2] = &unk_1EE4A8500;
  v4[3] = &unk_1EE4A8560;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A8510;
  v4[5] = @"CIAttributeTypeScalar";
  v15[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:8];
}

- (id)_initialConversionRGB
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_CIInitialConversionRGB];
}

- (id)_pyramidGenerateLevel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_CIPyramidGenerateLevel];
}

- (id)_propagateDisparity
{
  if (-[CIDisparityRefinement _propagateDisparity]::onceToken != -1) {
    dispatch_once(&-[CIDisparityRefinement _propagateDisparity]::onceToken, &__block_literal_global_16);
  }
  return (id)-[CIDisparityRefinement _propagateDisparity]::kernel;
}

CIKernel *__44__CIDisparityRefinement__propagateDisparity__block_invoke()
{
  result = +[CIKernel kernelWithString:@"float _local_yuvWeightG(vec4 pix1,vec4 pix2,vec2 sigmaLumaChmaRecip)\n{\n    vec3 yuv = pix1.xyz - pix2.xyz;\n    yuv.xyz = (yuv.xyz * yuv.xyz) * sigmaLumaChmaRecip.xyy;\n    return exp(-(yuv.x+yuv.y+yuv.z));\n}\n\nkernel vec4 _CIPropagateDisparity(sampler inDispMap,sampler yuv0,sampler yuv1,vec4 params)\n{\n    int   radius        = int(params.x); \n    vec2  sigmaLCRecip  = params.yz;\n    float pmws          = params.w; \n    vec2  dc            = destCoord();\n\n    vec2 gidHalf = floor(0.5*dc) + vec2(0.5);\n\n    vec4  ref           = sample(yuv0, samplerTransform(yuv0, dc));\n    float sow           = 0.0;\n    float sowd          = 0.0;\n    \n    for (int y = -radius; y <= radius; y++) {\n        for (int x = -radius; x <= radius; x++) {\n        \t vec2 p  = vec2(float(x),float(y));\n            vec4 p2 = sample(yuv1,      samplerTransform(yuv1,      gidHalf + p));\n            float d = sample(inDispMap, samplerTransform(inDispMap, gidHalf + p)).r;\n            float w = _local_yuvWeightG(ref, p2, sigmaLCRecip);\n            sow+= w; sowd+= w * d;\n        }\n    }\n    float alt = sample(inDispMap, samplerTransform(inDispMap, gidHalf)).r;\n    float rc = (sow < pmws) ? alt : (sowd / sow);\n\t\n\treturn vec4(rc,rc,rc,1.0);\n}\n\n"];
  -[CIDisparityRefinement _propagateDisparity]::kernel = (uint64_t)result;
  return result;
}

- (id)_propagateDisparityR1
{
  if (-[CIDisparityRefinement _propagateDisparityR1]::onceToken != -1) {
    dispatch_once(&-[CIDisparityRefinement _propagateDisparityR1]::onceToken, &__block_literal_global_51);
  }
  return (id)-[CIDisparityRefinement _propagateDisparityR1]::kernel;
}

CIKernel *__46__CIDisparityRefinement__propagateDisparityR1__block_invoke()
{
  result = +[CIKernel kernelWithString:@"float _local_yuvWeight(vec4 pix1,vec4 pix2,vec2 sigmaLumaChmaRecip)\n{\n    vec3 yuv = pix1.xyz - pix2.xyz;\n    yuv.xyz = (yuv.xyz * yuv.xyz) * sigmaLumaChmaRecip.xyy;\n    return exp(-(yuv.x+yuv.y+yuv.z));\n}\n\nkernel vec4 _CIPropagateDisparityR1(sampler inDispMap,sampler yuv0,sampler yuv1,vec4 params)\n{\n    vec2  sigmaLCRecip  = params.yz;\n    float pmws          = params.w; \n    vec2  dc            = destCoord();\n\n    vec2 gidHalf = floor(0.5*dc) + vec2(0.5);\n\n    vec4  ref           = sample(yuv0, samplerTransform(yuv0, dc));\n    float sow           = 0.0;\n    float sowd          = 0.0;\n    \n    vec4 p;\n    float d, w;\n    p = sample(yuv1,      samplerTransform(yuv1,      gidHalf + vec2(-1.0, -1.0)));\n    d = sample(inDispMap, samplerTransform(inDispMap, gidHalf + vec2(-1.0, -1.0))).r;\n    w = _local_yuvWeight(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * d;\n    p = sample(yuv1,      samplerTransform(yuv1,      gidHalf + vec2( 0.0, -1.0)));\n    d = sample(inDispMap, samplerTransform(inDispMap, gidHalf + vec2( 0.0, -1.0))).r;\n    w = _local_yuvWeight(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * d;\n    p = sample(yuv1,      samplerTransform(yuv1,      gidHalf + vec2( 1.0, -1.0)));\n    d = sample(inDispMap, samplerTransform(inDispMap, gidHalf + vec2( 1.0, -1.0))).r;\n    w = _local_yuvWeight(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * d;\n    p = sample(yuv1,      samplerTransform(yuv1,      gidHalf + vec2(-1.0, 0.0)));\n    d = sample(inDispMap, samplerTransform(inDispMap, gidHalf + vec2(-1.0, 0.0))).r;\n    w = _local_yuvWeight(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * d;\n    p = sample(yuv1,      samplerTransform(yuv1,      gidHalf + vec2( 0.0, 0.0)));\n    d = sample(inDispMap, samplerTransform(inDispMap, gidHalf + vec2( 0.0, 0.0))).r;\n    w = _local_yuvWeight(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * d;\n    float alt = d;\n    p = sample(yuv1,      samplerTransform(yuv1,      gidHalf + vec2( 1.0, 0.0)));\n    d = sample(inDispMap, samplerTransform(inDispMap, gidHalf + vec2( 1.0, 0.0))).r;\n    w = _local_yuvWeight(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * d;\n    p = sample(yuv1,      samplerTransform(yuv1,      gidHalf + vec2(-1.0, 1.0)));\n    d = sample(inDispMap, samplerTransform(inDispMap, gidHalf + vec2(-1.0, 1.0))).r;\n    w = _local_yuvWeight(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * d;\n    p = sample(yuv1,      samplerTransform(yuv1,      gidHalf + vec2( 0.0, 1.0)));\n    d = sample(inDispMap, samplerTransform(inDispMap, gidHalf + vec2( 0.0, 1.0))).r;\n    w = _local_yuvWeight(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * d;\n    p = sample(yuv1,      samplerTransform(yuv1,      gidHalf + vec2( 1.0, 1.0)));\n    d = sample(inDispMap, samplerTransform(inDispMap, gidHalf + vec2( 1.0, 1.0))).r;\n    w = _local_yuvWeight(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * d;\n    float rc = (sow < pmws) ? alt : (sowd / sow);\n\t\n\treturn vec4(rc,rc,rc,1.0);\n}\n\n"];
  -[CIDisparityRefinement _propagateDisparityR1]::kernel = (uint64_t)result;
  return result;
}

- (id)_propagateDisparityR1Combined
{
  if (-[CIDisparityRefinement _propagateDisparityR1Combined]::onceToken != -1) {
    dispatch_once(&-[CIDisparityRefinement _propagateDisparityR1Combined]::onceToken, &__block_literal_global_56);
  }
  return (id)-[CIDisparityRefinement _propagateDisparityR1Combined]::kernel;
}

CIKernel *__54__CIDisparityRefinement__propagateDisparityR1Combined__block_invoke()
{
  result = +[CIKernel kernelWithString:@"float _local_yuvWeightC(vec4 pix1,vec4 pix2,vec2 sigmaLumaChmaRecip)\n{\n    vec3 yuv = pix1.xyz - pix2.xyz;\n    yuv.xyz = (yuv.xyz * yuv.xyz) * sigmaLumaChmaRecip.xyy;\n    return exp(-(yuv.x+yuv.y+yuv.z));\n}\n\nkernel vec4 _CIPropagateDisparityR1C(sampler image,sampler yuv0,vec4 params)\n{\n    vec2  sigmaLCRecip  = params.yz;\n    float pmws          = params.w; \n    vec2  dc            = destCoord();\n\n    vec2 gidHalf = floor(0.5*dc) + vec2(0.5);\n\n    vec4  ref           = sample(yuv0, samplerTransform(yuv0, dc));\n    float sow           = 0.0;\n    float sowd          = 0.0;\n    \n    vec4 p;\n    float w;\n    p = sample(image, samplerTransform(image, gidHalf + vec2(-1.0, -1.0)));\n    w = _local_yuvWeightC(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * p.a;\n    p = sample(image, samplerTransform(image, gidHalf + vec2( 0.0, -1.0)));\n    w = _local_yuvWeightC(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * p.a;\n    p = sample(image, samplerTransform(image, gidHalf + vec2( 1.0, -1.0)));\n    w = _local_yuvWeightC(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * p.a;\n    p = sample(image, samplerTransform(image, gidHalf + vec2(-1.0, 0.0)));\n    w = _local_yuvWeightC(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * p.a;\n    p = sample(image, samplerTransform(image, gidHalf));\n    w = _local_yuvWeightC(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * p.a;\n    float alt = p.a;\n    p = sample(image, samplerTransform(image, gidHalf + vec2( 1.0, 0.0)));\n    w = _local_yuvWeightC(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * p.a;\n    p = sample(image, samplerTransform(image, gidHalf + vec2(-1.0, 1.0)));\n    w = _local_yuvWeightC(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * p.a;\n    p = sample(image, samplerTransform(image, gidHalf + vec2( 0.0, 1.0)));\n    w = _local_yuvWeightC(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * p.a;\n    p = sample(image, samplerTransform(image, gidHalf + vec2( 1.0, 1.0)));\n    w = _local_yuvWeightC(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * p.a;\n    float rc = (sow < pmws) ? alt : (sowd / sow);\n\t\n\treturn vec4(rc,rc,rc,1.0);\n}\n\n"];
  -[CIDisparityRefinement _propagateDisparityR1Combined]::kernel = (uint64_t)result;
  return result;
}

- (id)_propagateDisparityCombined
{
  if (-[CIDisparityRefinement _propagateDisparityCombined]::onceToken != -1) {
    dispatch_once(&-[CIDisparityRefinement _propagateDisparityCombined]::onceToken, &__block_literal_global_61);
  }
  return (id)-[CIDisparityRefinement _propagateDisparityCombined]::kernel;
}

CIKernel *__52__CIDisparityRefinement__propagateDisparityCombined__block_invoke()
{
  result = +[CIKernel kernelWithString:@"float _local_yuvWeightG2(vec4 pix1,vec4 pix2,vec2 sigmaLumaChmaRecip)\n{\n    vec3 yuv = pix1.xyz - pix2.xyz;\n    yuv.xyz = (yuv.xyz * yuv.xyz) * sigmaLumaChmaRecip.xyy;\n    return exp(-(yuv.x+yuv.y+yuv.z));\n}\n\nkernel vec4 _CIPropagateDisparityRC(sampler image,sampler yuv0,vec4 params)\n{\n    int   radius        = int(params.x); \n    vec2  sigmaLCRecip  = params.yz;\n    float pmws          = params.w; \n    vec2  dc            = destCoord();\n\n    vec2 gidHalf = floor(0.5*dc) + vec2(0.5);\n\n    vec4  ref           = sample(yuv0, samplerTransform(yuv0, dc));\n    float sow           = 0.0;\n    float sowd          = 0.0;\n    \n    for (int y = -radius; y <= radius; y++) {\n        for (int x = -radius; x <= radius; x++) {\n            vec4  p = sample(image, samplerTransform(image, gidHalf + vec2(float(x), float(y))));\n            float w = _local_yuvWeightG2(ref, p, sigmaLCRecip);\n            sow+= w; sowd+= w * p.a;\n        }\n    }\n    float alt = sample(image, samplerTransform(image, gidHalf)).r;\n    float rc = (sow < pmws) ? alt : (sowd / sow);\n\t\n\treturn vec4(rc,rc,rc,1.0);\n}\n\n"];
  -[CIDisparityRefinement _propagateDisparityCombined]::kernel = (uint64_t)result;
  return result;
}

- (id)_smoothDisparity
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_CISmoothDisparity];
}

- (id)initialConversionForSize:(CGSize)a3 useMetal:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  v37[3] = *MEMORY[0x1E4F143B8];
  v8 = [(CIImage *)self->inputImage colorSpace];
  if (v8)
  {
    v9 = [(CIImage *)self->inputImage imageByColorMatchingWorkingSpaceToColorSpace:v8];
  }
  else
  {
    v10 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    v9 = [(CIImage *)self->inputImage imageByColorMatchingWorkingSpaceToColorSpace:v10];
    CGColorSpaceRelease(v10);
  }
  v36[0] = @"inputRVector";
  v37[0] = +[CIVector vectorWithX:0.2126 Y:0.7152 Z:0.0722 W:0.0];
  v36[1] = @"inputGVector";
  v37[1] = +[CIVector vectorWithX:-0.114572 Y:-0.385428 Z:0.5 W:0.5];
  v36[2] = @"inputBVector";
  v37[2] = +[CIVector vectorWithX:0.5 Y:-0.454153 Z:-0.045847 W:0.5];
  v11 = -[CIImage imageByApplyingFilter:withInputParameters:](v9, "imageByApplyingFilter:withInputParameters:", @"CIColorMatrix", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:3]);
  saveImage(v11, @"/tmp/yuvImageUsingConstants.tiff", 0);
  uint64_t v29 = 0;
  v30 = (float *)&v29;
  uint64_t v31 = 0x2020000000;
  float v32 = 0.0;
  [(CIImage *)self->inputImage extent];
  float v13 = v12 / width;
  float v32 = v13;
  uint64_t v25 = 0;
  v26 = (float *)&v25;
  uint64_t v27 = 0x2020000000;
  float v28 = 0.0;
  [(CIImage *)self->inputImage extent];
  float v15 = v14 / height;
  float v28 = v15;
  id v16 = [(CIDisparityRefinement *)self _initialConversionRGB];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __59__CIDisparityRefinement_initialConversionForSize_useMetal___block_invoke;
  v24[3] = &unk_1E57716F8;
  v24[4] = &v29;
  v24[5] = &v25;
  v35[0] = v11;
  v35[1] = +[CIVector vectorWithX:v30[6] Y:v26[6]];
  v17 = (CIImage *)objc_msgSend(v16, "applyWithExtent:roiCallback:arguments:", v24, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v35, 2), 0.0, 0.0, width, height);
  uint64_t v23 = 0;
  v34 = v11;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  v33 = +[CIVector vectorWithX:-2.0 Y:-2.0];
  v19 = +[CIGenericMetalProcessor applyWithExtent:shader:inputs:roiMethods:insetRects:scaleFactors:arguments:error:](CIGenericMetalProcessor, "applyWithExtent:shader:inputs:roiMethods:insetRects:scaleFactors:arguments:error:", @"kernel_InitialConversion", v18, &unk_1EE4AB810, [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1], 0, 0, 0.0, 0.0, width, height, &v23);
  if (v19) {
    BOOL v20 = v4;
  }
  else {
    BOOL v20 = 0;
  }
  if (v20 && v23 == 0) {
    v17 = v19;
  }
  if (v4) {
    v21 = @"/tmp/initialConversion-Metal.tiff";
  }
  else {
    v21 = @"/tmp/initialConversion-CI.tiff";
  }
  saveImage(v17, (uint64_t)v21, 0);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v17;
}

double __59__CIDisparityRefinement_initialConversionForSize_useMetal___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v5 = *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v8.origin.x = a2 * v5;
  double v6 = *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  v8.origin.y = a3 * v6;
  v8.size.double width = a4 * v5;
  v8.size.double height = a5 * v6;
  *(void *)&double result = (unint64_t)CGRectInset(v8, -2.0, -2.0);
  return result;
}

- (id)shiftmapLevelZeroWithSize:(CGSize)a3 useMetal:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  v29[1] = *MEMORY[0x1E4F143B8];
  [(CIImage *)self->inputDisparityImage extent];
  float v9 = v8;
  float v10 = v9 / width;
  [(CIImage *)self->inputDisparityImage extent];
  float v12 = v11;
  inputDisparityImage = self->inputDisparityImage;
  float v14 = v12 / height;
  double v15 = v10;
  double v16 = v14;
  CGAffineTransformMakeScale(&v25, 1.0 / v15, 1.0 / v14);
  v17 = [(CIImage *)inputDisparityImage imageByApplyingTransform:&v25];
  uint64_t v24 = 0;
  v29[0] = self->inputDisparityImage;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  float v28 = +[CIVector vectorWithX:v15 Y:v16];
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v26 = @"scaleFactors";
  uint64_t v27 = +[CIVector vectorWithX:v15 Y:v16];
  BOOL v20 = +[CIGenericMetalProcessor applyWithExtent:shader:inputs:roiMethods:insetRects:scaleFactors:arguments:error:](CIGenericMetalProcessorSingleChannel, "applyWithExtent:shader:inputs:roiMethods:insetRects:scaleFactors:arguments:error:", @"kernel_UpscaleShiftmap", v18, 0, 0, v19, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1], 0.0, 0.0, width, height, &v24);
  if (v20) {
    BOOL v21 = v4;
  }
  else {
    BOOL v21 = 0;
  }
  if (v21 && v24 == 0) {
    v17 = v20;
  }
  if (v4) {
    v22 = @"/tmp/upsampledShiftmap-Metal.tiff";
  }
  else {
    v22 = @"/tmp/upsampledShiftmap-CI.tiff";
  }
  saveImage(v17, (uint64_t)v22, 1);
  return v17;
}

- (id)generatePyramidLevel:(id)a3 useMetal:(BOOL)a4
{
  BOOL v4 = a4;
  v25[1] = *MEMORY[0x1E4F143B8];
  [a3 extent];
  double v8 = v7 * 0.5;
  double v10 = v9 * 0.5;
  double v12 = v11 * 0.5;
  double v14 = v13 * 0.5;
  id v15 = [(CIDisparityRefinement *)self _pyramidGenerateLevel];
  v25[0] = a3;
  double v16 = (CIImage *)objc_msgSend(v15, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_109, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v25, 1), v8, v10, v12, v14);
  uint64_t v22 = 0;
  id v24 = a3;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  uint64_t v23 = +[CIVector vectorWithX:-1.0 Y:-1.0];
  uint64_t v18 = +[CIGenericMetalProcessor applyWithExtent:shader:inputs:roiMethods:insetRects:scaleFactors:arguments:error:](CIGenericMetalProcessor, "applyWithExtent:shader:inputs:roiMethods:insetRects:scaleFactors:arguments:error:", @"kernel_PyramidGenerateLevel", v17, &unk_1EE4AB828, [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1], 0, 0, v8, v10, v12, v14, &v22);
  if (v22) {
    BOOL v19 = 0;
  }
  else {
    BOOL v19 = v4;
  }
  if (v19 && v18 != 0) {
    double v16 = v18;
  }
  if (v4) {
    BOOL v20 = @"/tmp/pyramidLevel1-Metal.tiff";
  }
  else {
    BOOL v20 = @"/tmp/pyramidLevel1-CI.tiff";
  }
  saveImage(v16, (uint64_t)v20, 0);
  return v16;
}

double __55__CIDisparityRefinement_generatePyramidLevel_useMetal___block_invoke(double a1)
{
  return a1 + a1;
}

- (id)smoothDisparityImage:(id)a3 useMetal:(BOOL)a4
{
  v55[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v4 = a4;
    [(CIVector *)self->inputOriginalSize CGPointValue];
    double v8 = v7;
    double v10 = v9;
    [(CIImage *)self->inputImage extent];
    double v12 = v11;
    double v14 = v13;
    [(CIImage *)self->inputDisparityImage extent];
    double v16 = v15;
    double v18 = v17;
    [(NSNumber *)self->inputScale floatValue];
    double v19 = shiftmapSize(v12, v14, v16, v18, v8, v10);
    double v21 = v20;
    [(NSNumber *)self->inputSmoothSigma floatValue];
    LODWORD(v12) = v22;
    [(NSNumber *)self->inputPropagateSigmaLuma floatValue];
    unsigned int v46 = v23;
    [(NSNumber *)self->inputPropagateSigmaChma floatValue];
    unsigned int v45 = v24;
    float v25 = *(float *)&v12 * (float)(*(float *)&v12 + *(float *)&v12);
    v26 = objc_msgSend((id)objc_msgSend(a3, "imageByClampingToExtent"), "imageBySamplingNearest");
    if (v25 <= 0.0001) {
      float v27 = 0.0001;
    }
    else {
      float v27 = v25;
    }
    float v28 = exp(-1.0 / v27);
    float v29 = exp(-1.41421356 / v27);
    float v30 = v28 * 4.0 + 1.0 + v29 * 4.0;
    float v31 = 1.0 / v30;
    float v32 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:");
    id v33 = [(CIDisparityRefinement *)self _smoothDisparity];
    v55[0] = v26;
    v55[1] = v32;
    uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
    v53[0] = @"kCIKernelOutputFormat";
    v53[1] = @"kCIImageAlphaOne";
    v54[0] = [NSNumber numberWithInt:2053];
    v54[1] = MEMORY[0x1E4F1CC38];
    uint64_t v35 = objc_msgSend(v33, "applyWithExtent:roiCallback:arguments:options:", &__block_literal_global_124, v34, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v54, v53, 2), 0.0, 0.0, v19, v21);
    uint64_t v49 = 0;
    if (v4)
    {
      [(NSNumber *)self->inputPropagateKernel floatValue];
      v47[1] = (int)v36;
      [(NSNumber *)self->inputPropagateMinWeightSum floatValue];
      float32x2_t v48 = vmul_f32((float32x2_t)__PAIR64__(v45, v46), vadd_f32((float32x2_t)__PAIR64__(v45, v46), (float32x2_t)__PAIR64__(v45, v46)));
      v47[2] = v37;
      *(float *)v47 = v27;
      uint64_t v38 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v47 length:20];
      v52 = v26;
      uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
      v50 = @"config";
      uint64_t v51 = v38;
      v40 = +[CIGenericMetalProcessor applyWithExtent:shader:inputs:arguments:error:](CIGenericMetalProcessorSingleChannel, "applyWithExtent:shader:inputs:arguments:error:", @"kernel_SmoothDisparity", v39, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1], &v49, 0.0, 0.0, v19, v21);
      BOOL v41 = v49 == 0;
    }
    else
    {
      v40 = 0;
      BOOL v41 = 1;
    }
    if (v41 && v4 && v40 != 0) {
      v43 = v40;
    }
    else {
      v43 = (CIImage *)v35;
    }
    if (v28 == 0.0 && v29 == 0.0 && v31 == 1.0) {
      v43 = (CIImage *)objc_msgSend(v26, "imageByCroppingToRect:", 0.0, 0.0, v19, v21);
    }
    if (v4) {
      v44 = @"/tmp/smoothDisparity-Metal.tiff";
    }
    else {
      v44 = @"/tmp/smoothDisparity-CI.tiff";
    }
    saveImage(v43, (uint64_t)v44, 1);
    return v43;
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

double __55__CIDisparityRefinement_smoothDisparityImage_useMetal___block_invoke(double a1)
{
  return a1 + -1.0;
}

- (id)_combineImages
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_combineImages];
}

- (id)propagateDisparity:(id)a3 pyramids:(id *)a4 useMetal:(BOOL)a5 computedPyramidLevels:(int)a6
{
  BOOL v64 = a5;
  v81[2] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputSmoothSigma floatValue];
  float v11 = v10;
  [(NSNumber *)self->inputPropagateSigmaLuma floatValue];
  float v13 = v12;
  [(NSNumber *)self->inputPropagateSigmaChma floatValue];
  float v15 = v14;
  [(NSNumber *)self->inputPropagateMinWeightSum floatValue];
  float v17 = v16;
  uint64_t v70 = 0;
  v71 = (float *)&v70;
  uint64_t v72 = 0x2020000000;
  int v73 = 0;
  [(NSNumber *)self->inputPropagateKernel floatValue];
  int v73 = v18;
  v81[0] = a3;
  v81[1] = 0;
  [(NSNumber *)self->inputPropagateKernel floatValue];
  float v19 = v13 * (float)(v13 + v13);
  float v20 = v15 * (float)(v15 + v15);
  v66 = +[CIVector vectorWithX:v21 Y:65025.0 / v19 Z:65025.0 / v20 W:v17];
  if (fabs(v71[6] + -1.0) >= 0.001) {
    id v65 = [(CIDisparityRefinement *)self _propagateDisparity];
  }
  else {
    id v65 = [(CIDisparityRefinement *)self _propagateDisparityR1];
  }
  if (a6 >= 2)
  {
    v63 = self;
    int v22 = 0;
    uint64_t v23 = a6;
    float v24 = v11 * (float)(v11 + v11);
    while (1)
    {
      uint64_t v25 = [a3 imageByClampingToExtent];
      uint64_t v26 = (v23 - 2);
      uint64_t v27 = [a4[v26] imageByClampingToExtent];
      uint64_t v28 = [a4[--v23] imageByClampingToExtent];
      if (!v25) {
        break;
      }
      uint64_t v29 = v28;
      if (!v27 || v28 == 0) {
        break;
      }
      [a4[v26] extent];
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __84__CIDisparityRefinement_propagateDisparity_pyramids_useMetal_computedPyramidLevels___block_invoke;
      v69[3] = &unk_1E5771720;
      v69[4] = &v70;
      v80[0] = v25;
      v80[1] = v27;
      v80[2] = v29;
      v80[3] = v66;
      uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:4];
      v78[0] = @"kCIKernelOutputFormat";
      uint64_t v40 = [NSNumber numberWithInt:2053];
      v78[1] = @"kCIImageAlphaOne";
      v79[0] = v40;
      v79[1] = MEMORY[0x1E4F1CC38];
      BOOL v41 = objc_msgSend(v65, "applyWithExtent:roiCallback:arguments:options:", v69, v39, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v79, v78, 2), v32, v34, v36, v38);
      v42 = v41;
      if (v64)
      {
        uint64_t v68 = 0;
        v43 = +[CIVector vectorWithX:(float)-v71[6] Y:(float)-v71[6]];
        [(NSNumber *)v63->inputPropagateKernel floatValue];
        v67[1] = (int)v44;
        [(NSNumber *)v63->inputPropagateMinWeightSum floatValue];
        *(float *)&v67[3] = v19;
        *(float *)&v67[4] = v20;
        v67[2] = v45;
        *(float *)v67 = v24;
        uint64_t v46 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v67 length:20];
        [a4[v26] extent];
        double v48 = v47;
        double v50 = v49;
        double v52 = v51;
        double v54 = v53;
        uint64_t v55 = [a3 imageByClampingToExtent];
        id v56 = a4[v26];
        v77[0] = v55;
        v77[1] = v56;
        v77[2] = [a4[v23] imageByClampingToExtent];
        uint64_t v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:3];
        v76[0] = v43;
        v76[1] = +[CIVector vectorWithX:0.0 Y:0.0];
        v76[2] = v43;
        uint64_t v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:3];
        v74 = @"config";
        uint64_t v75 = v46;
        id v59 = +[CIGenericMetalProcessor applyWithExtent:shader:inputs:roiMethods:insetRects:scaleFactors:arguments:error:](CIGenericMetalProcessorSingleChannel, "applyWithExtent:shader:inputs:roiMethods:insetRects:scaleFactors:arguments:error:", @"kernel_PropagateDisparity", v57, &unk_1EE4AB840, v58, 0, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1], v48, v50, v52, v54, &v68);
        if (v59) {
          BOOL v60 = v68 == 0;
        }
        else {
          BOOL v60 = 0;
        }
        if (v60) {
          a3 = v59;
        }
        else {
          a3 = v42;
        }
        v61 = "Metal";
      }
      else
      {
        v61 = "CI";
        a3 = v41;
      }
      saveImage((CIImage *)a3, objc_msgSend(NSString, "stringWithFormat:", @"/tmp/propagateDisparity_%d-%s.tiff", v23, v61), 1);
      v22 ^= 1u;
      v81[v22] = a3;
      if ((unint64_t)(v23 + 1) <= 2) {
        goto LABEL_23;
      }
    }
    a3 = (id)v81[v22];
  }
LABEL_23:
  _Block_object_dispose(&v70, 8);
  return a3;
}

double __84__CIDisparityRefinement_propagateDisparity_pyramids_useMetal_computedPyramidLevels___block_invoke(uint64_t a1, int a2, double result, double a4, double a5, double a6)
{
  if (a2 != 1)
  {
    v7.origin.x = result * 0.5;
    v7.origin.y = a4 * 0.5;
    v7.size.double width = a5 * 0.5;
    v7.size.double height = a6 * 0.5;
    CGFloat v6 = (float)-*(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    *(void *)&double result = (unint64_t)CGRectInset(v7, v6, v6);
  }
  return result;
}

- (id)outputImageUsingMetal:(BOOL)a3
{
  v43[3] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    goto LABEL_18;
  }
  inputDisparityImage = self->inputDisparityImage;
  if (!inputDisparityImage) {
    goto LABEL_18;
  }
  BOOL v5 = a3;
  uint64_t v6 = 1;
  saveImage(inputDisparityImage, @"/tmp/inputToDisparity.tiff", 1);
  [(CIVector *)self->inputOriginalSize CGPointValue];
  double v8 = v7;
  double v10 = v9;
  [(CIImage *)self->inputImage extent];
  double v12 = v11;
  double v14 = v13;
  [(CIImage *)self->inputDisparityImage extent];
  double v16 = v15;
  double v18 = v17;
  [(NSNumber *)self->inputScale floatValue];
  double v19 = shiftmapSize(v12, v14, v16, v18, v8, v10);
  double v21 = v20;
  float v22 = v19;
  unsigned int v23 = vcvtps_u32_f32(v22);
  float v24 = v20;
  unsigned int v25 = vcvtps_u32_f32(v24);
  [(CIImage *)self->inputDisparityImage extent];
  unsigned int v27 = vcvtmd_u64_f64(v26);
  [(CIImage *)self->inputDisparityImage extent];
  unsigned int v29 = 2 * vcvtmd_u64_f64(v28);
  if (2 * v27 <= v23 && v29 <= v25)
  {
    do
    {
      unsigned int v31 = v6;
      uint64_t v6 = (v6 + 1);
      if (v31 > 2) {
        break;
      }
      unsigned int v23 = (v23 + 1) >> 1;
      if (v23 < 2 * v27) {
        break;
      }
      unsigned int v25 = (v25 + 1) >> 1;
    }
    while (v25 >= v29);
  }
  memset(v43, 0, 24);
  id v32 = -[CIDisparityRefinement initialConversionForSize:useMetal:](self, "initialConversionForSize:useMetal:", v5, v19, v21);
  id v42 = v32;
  if (v32)
  {
    if (v6 >= 2)
    {
      id v33 = v32;
      double v34 = v43;
      uint64_t v35 = v6 - 1;
      do
      {
        id v33 = [(CIDisparityRefinement *)self generatePyramidLevel:v33 useMetal:v5];
        *v34++ = v33;
        --v35;
      }
      while (v35);
    }
    [(id)v43[(v6 - 1) - 1] extent];
    double v38 = -[CIDisparityRefinement smoothDisparityImage:useMetal:](self, "smoothDisparityImage:useMetal:", -[CIDisparityRefinement propagateDisparity:pyramids:useMetal:computedPyramidLevels:](self, "propagateDisparity:pyramids:useMetal:computedPyramidLevels:", -[CIDisparityRefinement shiftmapLevelZeroWithSize:useMetal:](self, "shiftmapLevelZeroWithSize:useMetal:", v5, v36, v37), &v42, v5, v6), v5);
    uint64_t v39 = v38;
    if (v5) {
      uint64_t v40 = @"/tmp/smoothed-Metal.tiff";
    }
    else {
      uint64_t v40 = @"/tmp/smoothed-CI.tiff";
    }
    saveImage(v38, (uint64_t)v40, 1);
    return v39;
  }
  else
  {
LABEL_18:
    return +[CIImage emptyImage];
  }
}

- (id)outputImage
{
  v6[2] = *MEMORY[0x1E4F143B8];
  if (self->inputImage && self->inputDisparityImage)
  {
    id v3 = [(CIDisparityRefinement *)self outputImageUsingMetal:0];
    id v4 = [(CIDisparityRefinement *)self outputImageUsingMetal:1];
    if (v4)
    {
      v6[0] = v3;
      v6[1] = v4;
      return +[CIImage imageWithArrayOfImages:selector:](CIImage, "imageWithArrayOfImages:selector:", [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2], &__block_literal_global_169);
    }
    return v3;
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

uint64_t __36__CIDisparityRefinement_outputImage__block_invoke(uint64_t a1, void *a2)
{
  return useMetalImage(a2);
}

- (CIImage)inputDisparityImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputDisparityImage:(id)a3
{
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputPropagateKernel
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputPropagateKernel:(id)a3
{
}

- (NSNumber)inputSmoothSigma
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputSmoothSigma:(id)a3
{
}

- (NSNumber)inputPropagateMinWeightSum
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputPropagateMinWeightSum:(id)a3
{
}

- (NSNumber)inputPropagateSigmaLuma
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInputPropagateSigmaLuma:(id)a3
{
}

- (NSNumber)inputPropagateSigmaChma
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setInputPropagateSigmaChma:(id)a3
{
}

- (NSNumber)inputScale
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setInputScale:(id)a3
{
}

- (CIVector)inputOriginalSize
{
  return (CIVector *)objc_getProperty(self, a2, 144, 1);
}

- (void)setInputOriginalSize:(id)a3
{
}

@end