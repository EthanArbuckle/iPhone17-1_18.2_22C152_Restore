@interface CIPortraitBlur
+ (id)customAttributes;
- (CIImage)inputBlurmapImage;
- (CIImage)inputImage;
- (CIImage)inputMatteImage;
- (NSDictionary)inputTuningParameters;
- (NSNumber)inputAperture;
- (NSNumber)inputDraftMode;
- (NSNumber)inputLumaNoiseScale;
- (NSNumber)inputScale;
- (NSString)inputShape;
- (id)_kernel;
- (id)_kernelMetal;
- (id)_kernelWithShapesMetal;
- (id)_kernelsWithShapes;
- (id)_ourBlendKernel;
- (id)_ourBlendKernelMetal;
- (id)outputImage;
- (id)outputImage:(BOOL)a3;
- (id)outputImageV2;
- (id)outputImageV3;
- (void)setInputAperture:(id)a3;
- (void)setInputBlurmapImage:(id)a3;
- (void)setInputDraftMode:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputLumaNoiseScale:(id)a3;
- (void)setInputMatteImage:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputShape:(id)a3;
- (void)setInputTuningParameters:(id)a3;
@end

@implementation CIPortraitBlur

+ (id)customAttributes
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryColorAdjustment";
  v11[1] = @"CICategoryVideo";
  v11[2] = @"CICategoryStillImage";
  v11[3] = @"CICategoryBuiltIn";
  v11[4] = @"CICategoryApplePrivate";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
  v13[1] = @"11";
  v12[1] = @"CIAttributeFilterAvailable_iOS";
  v12[2] = @"CIAttributeFilterAvailable_Mac";
  v13[2] = @"10.13";
  v12[3] = @"inputLumaNoiseScale";
  v9[0] = @"CIAttributeSliderMin";
  v9[1] = @"CIAttributeSliderMax";
  v10[0] = &unk_1EE4A97D0;
  v10[1] = &unk_1EE4A97E0;
  v9[2] = @"CIAttributeMin";
  v9[3] = @"CIAttributeMax";
  v10[2] = &unk_1EE4A97D0;
  v10[3] = &unk_1EE4A97E0;
  v9[4] = @"CIAttributeDefault";
  v9[5] = @"CIAttributeType";
  v10[4] = &unk_1EE4A97F0;
  v10[5] = @"CIAttributeTypeScalar";
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v12[4] = @"inputAperture";
  v7[0] = @"CIAttributeSliderMin";
  v7[1] = @"CIAttributeSliderMax";
  v8[0] = &unk_1EE4A9800;
  v8[1] = &unk_1EE4A9810;
  v7[2] = @"CIAttributeMin";
  v7[3] = @"CIAttributeMax";
  v8[2] = &unk_1EE4A97D0;
  v8[3] = &unk_1EE4A9810;
  v7[4] = @"CIAttributeDefault";
  v7[5] = @"CIAttributeType";
  v8[4] = &unk_1EE4A97D0;
  v8[5] = @"CIAttributeTypeScalar";
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v12[5] = @"inputShape";
  v5 = @"CIAttributeClass";
  v6 = @"NSString";
  v13[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v12[6] = @"inputDraftMode";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = @"CIAttributeTypeInteger";
  v4[1] = &unk_1EE4AAC88;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4AACA0;
  v4[3] = &unk_1EE4AAC88;
  v13[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
}

- (id)_kernel
{
  if (-[CIPortraitBlur _kernel]::onceToken != -1) {
    dispatch_once(&-[CIPortraitBlur _kernel]::onceToken, &__block_literal_global_152);
  }
  return (id)-[CIPortraitBlur _kernel]::k;
}

CIKernel *__25__CIPortraitBlur__kernel__block_invoke()
{
  result = +[CIKernel kernelWithString:@"vec2 _pseudo_randPBN( vec2 pos)\n{\n    float rand1 = mod(12.63 * pos.x - 57.3 * pos.y * pos.y, 0.01369) + mod(75.833 * pos.y - 37.135 * pos.x * pos.x, 0.014) + mod(39.7 * pos.x * pos.y + 21.7 * pos.x * pos.y * pos.y, 0.0879);\n\n    vec2 rand2 = fract(3576.7453 * vec2( rand1, 2.0 * rand1));\n    return fract(vec2(7.7387 * (rand2.x + rand2.y), 33.707 * (rand2.x - rand2.y)));\n}\n\nvec4 _pixWeight( vec4 sampledPix,vec2 offset,float basePixRawR,float distWeight,vec2 spatialWeightSoftMinMax ,float highlightBoostGain,vec2 relativeWeightThreshold) {\n    float sampleR = 1.0 / sqrt(offset.x*offset.x + offset.y*offset.y);\n    float spatialWeight = clamp(spatialWeightSoftMinMax.x * sampledPix.w * sampleR + spatialWeightSoftMinMax.y, 0.0, 1.0);\n    float colorWeight = highlightBoostGain * (sampledPix.x + sampledPix.y + sampledPix.z) + 1.0; \n    float backgroundWeight = (3.0 - 2.0 * sampledPix.w);\n    float rwT = clamp(relativeWeightThreshold.x * (sampledPix.w - basePixRawR) + relativeWeightThreshold.y, 0.0, 1.0);\n    float relativeWeight = rwT * rwT * (3.0 - 2.0 * rwT); \n    float totalWeight = distWeight * spatialWeight * colorWeight * backgroundWeight * relativeWeight;\n    return vec4( totalWeight * sampledPix.xyz, totalWeight);\n}\nfloat _ushortMultiply(float a,float multiplier) {\n   int q = int(a) * int(multiplier);\n   int r = q/65536;\n   int m = q - r * 65536;\n   float mf = float(m);\n   return mf + compare(mf, 65535.0, 0.0);\n}\nkernel vec4 _CIPortraitBlur(sampler image,vec4 sizeAndScale,vec3 p0,vec4 p1,vec2 relativeWeightThreshold) \n{\n   float maxBlurInPixels         = p0.x;\n   float sharpRadius             = p0.y;\n   float highlightBoostGain      = p0.z;\n   vec2 spatialWeightSoftMinMax  = p1.xy;\n   float basePixelWeight         = p1.z;\n   int numSamples                = int(p1.w);\n    vec2 dc = destCoord();\n    vec4 basePix = sample(image, samplerCoord(image));\n    float rawBlurRadius = basePix.w * basePix.w;\n    float blurRadius = rawBlurRadius * maxBlurInPixels;\n    vec4 outRGB;\n    if (blurRadius >= sharpRadius)\n    {\n      vec4 pixSum = vec4(basePix.xyz * basePixelWeight, basePixelWeight);\n\t   vec2 randXY = _pseudo_randPBN(dc/sizeAndScale.xy) * sizeAndScale.zw * 65536.0;\n      for (int i = 0; i < numSamples; i++)\n      {\n           vec2 randXY2 = (1./32767.5) * randXY - 1.0; \n           float randDist = randXY2.x*randXY2.x + randXY2.y*randXY2.y;\n           float randNorm0 = max(abs(randXY2.x),abs(randXY2.y));\n           float randShape = randNorm0 / sqrt(randDist);\n           vec2  samplePos = randShape * rawBlurRadius * randXY2;\n           float randW = randShape * randShape;\n           samplePos.y = -samplePos.y;\n           randXY.x = _ushortMultiply(randXY.x, 28563.0);\n           randXY.y = _ushortMultiply(randXY.y, 44519.0);\n\t        vec4 pix = sample( image, samplerTransform(image, dc + maxBlurInPixels * samplePos));\n           pix.w = pix.w * pix.w;\n           pixSum += _pixWeight(pix, samplePos, rawBlurRadius, randW, spatialWeightSoftMinMax, highlightBoostGain, relativeWeightThreshold);\n        }\n        outRGB.xyz = pixSum.w > 0.0 ?  vec3(pixSum.xyz / pixSum.w) : basePix.xyz;\n        outRGB.w = basePix.w;\n    }\n    else\n    {\n        outRGB = basePix;\n    }\n\treturn outRGB;\n}\n\n"];
  -[CIPortraitBlur _kernel]::k = (uint64_t)result;
  return result;
}

- (id)_kernelMetal
{
  if (-[CIPortraitBlur _kernelMetal]::onceToken != -1) {
    dispatch_once(&-[CIPortraitBlur _kernelMetal]::onceToken, &__block_literal_global_157);
  }
  return (id)-[CIPortraitBlur _kernelMetal]::k;
}

id __30__CIPortraitBlur__kernelMetal__block_invoke()
{
  id result = +[CIKernel SDOFV2MetalKernelNamed:@"_CIPortraitBlurM"];
  -[CIPortraitBlur _kernelMetal]::k = (uint64_t)result;
  return result;
}

- (id)_kernelWithShapesMetal
{
  if (-[CIPortraitBlur _kernelWithShapesMetal]::onceToken != -1) {
    dispatch_once(&-[CIPortraitBlur _kernelWithShapesMetal]::onceToken, &__block_literal_global_162);
  }
  return (id)-[CIPortraitBlur _kernelWithShapesMetal]::k;
}

id __40__CIPortraitBlur__kernelWithShapesMetal__block_invoke()
{
  id result = +[CIKernel SDOFV2MetalKernelNamed:@"_CIPortraitBlurShapeM"];
  -[CIPortraitBlur _kernelWithShapesMetal]::k = (uint64_t)result;
  return result;
}

- (id)_kernelsWithShapes
{
  if (-[CIPortraitBlur _kernelsWithShapes]::onceToken != -1) {
    dispatch_once(&-[CIPortraitBlur _kernelsWithShapes]::onceToken, &__block_literal_global_167);
  }
  return (id)-[CIPortraitBlur _kernelsWithShapes]::k;
}

CIKernel *__36__CIPortraitBlur__kernelsWithShapes__block_invoke()
{
  id result = +[CIKernel kernelWithString:&cfstr_Vec2PseudoRand_1];
  -[CIPortraitBlur _kernelsWithShapes]::k = (uint64_t)result;
  return result;
}

- (id)_ourBlendKernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_CIPortraitBlurBlendWithMaskFromAlpha];
}

- (id)_ourBlendKernelMetal
{
  if (-[CIPortraitBlur _ourBlendKernelMetal]::onceToken != -1) {
    dispatch_once(&-[CIPortraitBlur _ourBlendKernelMetal]::onceToken, &__block_literal_global_172);
  }
  return (id)-[CIPortraitBlur _ourBlendKernelMetal]::k;
}

id __38__CIPortraitBlur__ourBlendKernelMetal__block_invoke()
{
  id result = +[CIColorKernel SDOFV2MetalKernelNamed:@"_CIPortraitBlurBlendWithMaskFromAlphaM"];
  -[CIPortraitBlur _ourBlendKernelMetal]::k = (uint64_t)result;
  return result;
}

- (id)outputImage:(BOOL)a3
{
  BOOL v3 = a3;
  v152[2] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  inputBlurmapImage = self->inputBlurmapImage;
  [(CIImage *)inputBlurmapImage extent];
  double v7 = v6;
  [(CIImage *)self->inputImage extent];
  if (vabdd_f64(v7, v8) > 0.001)
  {
    [(CIImage *)self->inputBlurmapImage extent];
    double v10 = v9;
    [(CIImage *)self->inputImage extent];
    float v12 = v10 / v11;
    [(CIImage *)self->inputBlurmapImage extent];
    double v14 = v13;
    [(CIImage *)self->inputImage extent];
    float v16 = v14 / v15;
    [(CIImage *)self->inputImage extent];
    double v18 = v17;
    [(CIImage *)self->inputBlurmapImage extent];
    if (v18 <= v19)
    {
      v20 = self->inputBlurmapImage;
      CGAffineTransformMakeScale(&v134, 1.0 / v12, 1.0 / v16);
      inputBlurmapImage = [(CIImage *)v20 imageByApplyingTransform:&v134];
    }
    else
    {
      CGAffineTransformMakeScale(&v135, v12, v16);
      inputImage = [(CIImage *)inputImage imageByApplyingTransform:&v135];
    }
  }
  v151[0] = @"inputBlurmapImage";
  v151[1] = @"inputUseMetal";
  v152[0] = inputBlurmapImage;
  v152[1] = [NSNumber numberWithBool:v3];
  v21 = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", @"CIPortraitBlurPreProcess", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v152 forKeys:v151 count:2]);
  saveImage(v21, @"/tmp/preprocessed-CI.tiff", 0);
  [(CIImage *)v21 extent];
  double v24 = v22;
  double v25 = v23;
  v132[0] = 0;
  v132[1] = v132;
  v132[2] = 0x2020000000;
  double v133 = 0.0;
  if (v22 <= v23) {
    double v26 = v23;
  }
  else {
    double v26 = v22;
  }
  SDOFRenderingValue(&cfstr_Maxblur.isa, self->inputTuningParameters);
  double v133 = v26 * v27;
  if (v3) {
    id v28 = [(CIPortraitBlur *)self _kernelMetal];
  }
  else {
    id v28 = [(CIPortraitBlur *)self _kernel];
  }
  id v29 = v28;
  if (!v28) {
    id v29 = [(CIPortraitBlur *)self _kernel];
  }
  [(NSNumber *)self->inputScale floatValue];
  double v31 = 1.0;
  if (v30 > 0.0) {
    double v31 = 1.0 / v30;
  }
  v32 = +[CIVector vectorWithX:v24 Y:v25 Z:v31 W:v31];
  SDOFRenderingValue(&cfstr_Maxblur.isa, self->inputTuningParameters);
  float v34 = v33;
  SDOFRenderingValue(&cfstr_Sharpradius.isa, self->inputTuningParameters);
  float v36 = v35;
  SDOFRenderingValue(&cfstr_Highlightboost.isa, self->inputTuningParameters);
  float v37 = v24 * v34;
  v39 = +[CIVector vectorWithX:v37 Y:v36 Z:v38];
  SDOFRenderingValue(&cfstr_Nsamples.isa, self->inputTuningParameters);
  float v41 = v40;
  if (v31 > 1.0)
  {
    float v42 = 1.0 / v31;
    float v43 = sqrtf(v42) * v41;
    double v44 = v41 * 0.5;
    if (v44 >= v43) {
      float v41 = v44;
    }
    else {
      float v41 = v43;
    }
  }
  SDOFRenderingValue(&cfstr_Spatialweights.isa, self->inputTuningParameters);
  float v46 = v45;
  SDOFRenderingValue(&cfstr_Spatialweights_0.isa, self->inputTuningParameters);
  float v48 = v47;
  double v127 = v31;
  SDOFRenderingValue(&cfstr_Relativeweight.isa, self->inputTuningParameters);
  float v50 = v49;
  SDOFRenderingValue(&cfstr_Maxblur.isa, self->inputTuningParameters);
  float v52 = v51;
  SDOFRenderingValue(&cfstr_Relativeweight.isa, self->inputTuningParameters);
  float v54 = v53;
  SDOFRenderingValue(&cfstr_Maxblur.isa, self->inputTuningParameters);
  float v56 = v55;
  v125 = v39;
  v126 = v32;
  SDOFRenderingValue(&cfstr_Basepixelweigh.isa, self->inputTuningParameters);
  v124 = +[CIVector vectorWithX:(float)(1.0 / (float)(v48 - v46)) Y:(float)-(float)((float)(1.0 / (float)(v48 - v46)) * v46) Z:v57 W:v41];
  v58 = +[CIVector vectorWithX:(float)(0.5 / (float)(v50 / v52)) Y:(float)((float)((float)(0.5 / (float)(v50 / v52)) * v54) / v56)];
  uint64_t v59 = [(CIImage *)v21 imageByClampingToExtent];
  inputShape = self->inputShape;
  if (!inputShape || [(NSString *)self->inputShape isEqualToString:&stru_1EE465CC0]) {
    goto LABEL_28;
  }
  uint64_t v61 = 0;
  while (!-[NSString isEqualToString:](inputShape, "isEqualToString:", [NSString stringWithUTF8String:off_1E57728A0[v61]]))
  {
    if (++v61 == 8) {
      goto LABEL_28;
    }
  }
  if (v61 == -1)
  {
LABEL_28:
    double v63 = *MEMORY[0x1E4F1DB10];
    double v64 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double v65 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double v66 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    v131[0] = MEMORY[0x1E4F143A8];
    v131[1] = 3221225472;
    v131[2] = __30__CIPortraitBlur_outputImage___block_invoke;
    v131[3] = &unk_1E5771720;
    v131[4] = v132;
    v150[0] = v59;
    v150[1] = v126;
    v150[2] = v125;
    v150[3] = v124;
    v150[4] = v58;
    uint64_t v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v150 count:5];
    v148 = @"kCIKernelOutputFormat";
    uint64_t v149 = [NSNumber numberWithInt:264];
    uint64_t v68 = objc_msgSend(v29, "applyWithExtent:roiCallback:arguments:options:", v131, v67, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v149, &v148, 1), v63, v64, v65, v66);
  }
  else
  {
    if (v3) {
      id v62 = [(CIPortraitBlur *)self _kernelWithShapesMetal];
    }
    else {
      id v62 = [(CIPortraitBlur *)self _kernelsWithShapes];
    }
    id v111 = v62;
    if (!v62) {
      id v111 = [(CIPortraitBlur *)self _kernelsWithShapes];
    }
    v112 = [(CIImage *)self->inputImage properties];
    float v113 = 0.0;
    if (v112)
    {
      id v114 = [(NSDictionary *)v112 objectForKey:*MEMORY[0x1E4F2FCA0]];
      if (v114)
      {
        int v115 = [v114 intValue];
        int v116 = (v115 - 9) >= 0xFFFFFFF8 ? v115 - 3 : -3;
        if (v116 <= 5) {
          float v113 = flt_193955358[v116];
        }
      }
    }
    __float2 v117 = __sincosf_stret(v113);
    v118 = +[CIVector vectorWithX:v117.__cosval Y:v117.__sinval Z:v117.__sinval W:(float)-v117.__cosval];
    double v119 = *MEMORY[0x1E4F1DB10];
    double v120 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double v121 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double v122 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    v130[0] = MEMORY[0x1E4F143A8];
    v130[1] = 3221225472;
    v130[2] = __30__CIPortraitBlur_outputImage___block_invoke_2;
    v130[3] = &unk_1E5771720;
    v130[4] = v132;
    v147[0] = v59;
    v147[1] = v126;
    v147[2] = v125;
    v147[3] = v124;
    v147[4] = v58;
    v147[5] = v118;
    v147[6] = [NSNumber numberWithFloat:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT((float)(int)v61))];
    uint64_t v123 = [MEMORY[0x1E4F1C978] arrayWithObjects:v147 count:7];
    v145 = @"kCIKernelOutputFormat";
    uint64_t v146 = [NSNumber numberWithInt:264];
    uint64_t v68 = objc_msgSend(v111, "applyWithExtent:roiCallback:arguments:options:", v130, v123, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1), v119, v120, v121, v122);
  }
  v69 = (void *)v68;
  [(CIImage *)inputImage extent];
  saveImage((CIImage *)objc_msgSend(v69, "imageByCroppingToRect:"), @"/tmp/blur-CI.tiff", 0);
  SDOFRenderingValue(&cfstr_Antialiasblurs.isa, self->inputTuningParameters);
  int v71 = v70;
  v144[0] = MEMORY[0x1E4F1CC38];
  v143[0] = @"inputHorizontalBlur";
  v143[1] = @"inputMaxBlur";
  *(float *)&double v72 = v37;
  v144[1] = [NSNumber numberWithFloat:v72];
  v143[2] = @"inputAntiAliasBlurStrength";
  LODWORD(v73) = v71;
  v144[2] = [NSNumber numberWithFloat:v73];
  v143[3] = @"inputUseMetal";
  v144[3] = [NSNumber numberWithBool:v3];
  v74 = objc_msgSend(v69, "imageByApplyingFilter:withInputParameters:", @"CIPortraitBlurDirectionalBlur", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v144, v143, 4));
  [(CIImage *)inputImage extent];
  saveImage((CIImage *)objc_msgSend(v74, "imageByCroppingToRect:"), @"/tmp/blur-X-CI.tiff", 0);
  v142[0] = MEMORY[0x1E4F1CC28];
  v141[0] = @"inputHorizontalBlur";
  v141[1] = @"inputMaxBlur";
  *(float *)&double v75 = v37;
  v142[1] = [NSNumber numberWithFloat:v75];
  v141[2] = @"inputAntiAliasBlurStrength";
  LODWORD(v76) = v71;
  v142[2] = [NSNumber numberWithFloat:v76];
  v141[3] = @"inputUseMetal";
  v142[3] = [NSNumber numberWithBool:v3];
  v77 = objc_msgSend(v74, "imageByApplyingFilter:withInputParameters:", @"CIPortraitBlurDirectionalBlur", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v142, v141, 4));
  [(CIImage *)inputImage extent];
  saveImage((CIImage *)objc_msgSend(v77, "imageByCroppingToRect:"), @"/tmp/blur-Y-CI.tiff", 0);
  [(NSNumber *)self->inputLumaNoiseScale floatValue];
  float v79 = v78 / v127;
  double v80 = 1.5;
  if (v127 < 1.5)
  {
    v139[0] = @"inputLumaNoiseAmpl";
    *(float *)&double v80 = v79;
    v140[0] = [NSNumber numberWithFloat:v80];
    v139[1] = @"inputLumaNoiseModelCoeff";
    v81 = NSNumber;
    SDOFRenderingValue(&cfstr_Lumanoisemodel.isa, self->inputTuningParameters);
    v140[1] = objc_msgSend(v81, "numberWithFloat:");
    v139[2] = @"inputExtent";
    [(CIImage *)v21 extent];
    v140[2] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
    v139[3] = @"inputUseMetal";
    v140[3] = [NSNumber numberWithBool:v3];
    v77 = objc_msgSend(v77, "imageByApplyingFilter:withInputParameters:", @"CIPortraitBlurNoise", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v140, v139, 4));
    [(CIImage *)inputImage extent];
    saveImage((CIImage *)objc_msgSend(v77, "imageByCroppingToRect:"), @"/tmp/blur-NoiseAddedHalfRes-CI.tiff", 0);
  }
  v82 = (void *)[v77 _imageByRenderingToIntermediate];
  [(CIImage *)self->inputImage extent];
  double v84 = v83;
  [(CIImage *)inputImage extent];
  double v86 = v85;
  [(CIImage *)self->inputImage extent];
  double v88 = v87;
  [(CIImage *)inputImage extent];
  float v89 = v84 / v86;
  float v91 = v88 / v90;
  CGAffineTransformMakeScale(&v129, v89, v91);
  v92 = (void *)[v82 imageByApplyingTransform:&v129];
  [(CIImage *)self->inputImage extent];
  saveImage((CIImage *)objc_msgSend(v92, "imageByCroppingToRect:"), @"/tmp/upsampledBlurredImage.tiff", 0);
  double v93 = 1.5;
  if (v127 >= 1.5)
  {
    v137[0] = @"inputLumaNoiseAmpl";
    *(float *)&double v93 = v79;
    v138[0] = [NSNumber numberWithFloat:v93];
    v137[1] = @"inputLumaNoiseModelCoeff";
    v94 = NSNumber;
    SDOFRenderingValue(&cfstr_Lumanoisemodel.isa, self->inputTuningParameters);
    v138[1] = objc_msgSend(v94, "numberWithFloat:");
    v137[2] = @"inputExtent";
    [(CIImage *)v21 extent];
    v138[2] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
    v137[3] = @"inputUseMetal";
    v138[3] = [NSNumber numberWithBool:v3];
    v92 = objc_msgSend(v92, "imageByApplyingFilter:withInputParameters:", @"CIPortraitBlurNoise", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v138, v137, 4));
    [(CIImage *)inputImage extent];
    saveImage((CIImage *)objc_msgSend(v92, "imageByCroppingToRect:"), @"/tmp/blur-NoiseAddedFullRes-CI.tiff", 0);
  }
  SDOFRenderingValue(&cfstr_Maxblur.isa, self->inputTuningParameters);
  float v96 = v95;
  SDOFRenderingValue(&cfstr_Sharpradius.isa, self->inputTuningParameters);
  float v98 = v97;
  SDOFRenderingValue(&cfstr_Softradius.isa, self->inputTuningParameters);
  float v100 = v99;
  [(CIImage *)inputImage extent];
  v102 = +[CIVector vectorWithX:v96 Y:v98 Z:v100 W:v101];
  if (v3) {
    id v103 = [(CIPortraitBlur *)self _ourBlendKernelMetal];
  }
  else {
    id v103 = [(CIPortraitBlur *)self _ourBlendKernel];
  }
  id v104 = v103;
  if (!v103) {
    id v104 = [(CIPortraitBlur *)self _ourBlendKernel];
  }
  [(CIImage *)self->inputImage extent];
  v136[0] = self->inputImage;
  v136[1] = v92;
  v136[2] = v102;
  v109 = objc_msgSend(v104, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v136, 3), v105, v106, v107, v108);
  [(CIImage *)self->inputImage extent];
  saveImage((CIImage *)objc_msgSend(v109, "imageByCroppingToRect:"), @"/tmp/finalBlend.tiff", 0);
  _Block_object_dispose(v132, 8);
  return v109;
}

double __30__CIPortraitBlur_outputImage___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  CGFloat v5 = -*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, v5, v5);
  return result;
}

double __30__CIPortraitBlur_outputImage___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  CGFloat v5 = -*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, v5, v5);
  return result;
}

- (id)outputImageV2
{
  id v3 = [(CIPortraitBlur *)self outputImage:0];
  if (-[CIPortraitBlur outputImageV2]::onceToken != -1) {
    dispatch_once(&-[CIPortraitBlur outputImageV2]::onceToken, &__block_literal_global_267);
  }
  if (-[CIPortraitBlur outputImageV2]::disableHandWrittenMetal) {
    return v3;
  }
  id v5 = [(CIPortraitBlur *)self outputImage:1];
  if (!v5) {
    return v3;
  }

  return +[CIImage imageForRenderingWithMetal:v5 orNonMetal:v3];
}

uint64_t __31__CIPortraitBlur_outputImageV2__block_invoke()
{
  v0 = getenv("CI_DISABLE_PORTRAIT_METAL");
  if (v0) {
    uint64_t result = atoi(v0);
  }
  else {
    uint64_t result = -[CIPortraitBlur outputImageV2]::disableHandWrittenMetal;
  }
  -[CIPortraitBlur outputImageV2]::disableHandWrittenMetal = result != 0;
  return result;
}

- (id)outputImageV3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = +[CIFilter metalFilterWithName:@"CIPortraitBlurV2"];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(CIFilter *)self inputKeys];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "setValue:forKey:", -[CIPortraitBlur valueForKey:](self, "valueForKey:", *(void *)(*((void *)&v10 + 1) + 8 * v8)), *(void *)(*((void *)&v10 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return (id)[v3 outputImage];
}

- (id)outputImage
{
  if (-[CIPortraitBlur outputImage]::onceTokenNP != -1) {
    dispatch_once(&-[CIPortraitBlur outputImage]::onceTokenNP, &__block_literal_global_274);
  }
  if (-[CIPortraitBlur outputImage]::enableNewPortraitCodePath
    && (inputTuningParameters = self->inputTuningParameters) != 0
    && (id v4 = -[NSDictionary objectForKeyedSubscript:](inputTuningParameters, "objectForKeyedSubscript:", @"Version")) != 0&& ([v4 integerValue] & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    return [(CIPortraitBlur *)self outputImageV3];
  }
  else
  {
    return [(CIPortraitBlur *)self outputImageV2];
  }
}

uint64_t __29__CIPortraitBlur_outputImage__block_invoke()
{
  v0 = getenv("CI_ENABLE_NEW_PORTRAIT");
  if (v0) {
    uint64_t result = atoi(v0);
  }
  else {
    uint64_t result = -[CIPortraitBlur outputImage]::enableNewPortraitCodePath;
  }
  -[CIPortraitBlur outputImage]::enableNewPortraitCodePath = result != 0;
  return result;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputBlurmapImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputBlurmapImage:(id)a3
{
}

- (CIImage)inputMatteImage
{
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputMatteImage:(id)a3
{
}

- (NSNumber)inputLumaNoiseScale
{
  return self->inputLumaNoiseScale;
}

- (void)setInputLumaNoiseScale:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

- (NSNumber)inputAperture
{
  return self->inputAperture;
}

- (void)setInputAperture:(id)a3
{
}

- (NSDictionary)inputTuningParameters
{
  return self->inputTuningParameters;
}

- (void)setInputTuningParameters:(id)a3
{
}

- (NSString)inputShape
{
  return self->inputShape;
}

- (void)setInputShape:(id)a3
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