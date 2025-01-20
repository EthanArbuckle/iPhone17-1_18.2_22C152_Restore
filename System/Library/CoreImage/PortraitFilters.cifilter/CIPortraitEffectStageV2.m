@interface CIPortraitEffectStageV2
+ (id)customAttributes;
- (NSNumber)inputGrainAmount;
- (NSNumber)inputSharpenRadius;
- (NSNumber)inputUseAbsoluteDisparity;
- (id)_CIApplyBlackDepth;
- (id)_CIApplyStageNoFeather;
- (id)_CIApplyStageNoFeatherWithSpillRatio;
- (id)_CIPrepareBlackDepth;
- (id)_CIPrepareBlackDisparity;
- (id)_CIRefineBlackDepth;
- (id)_applyRefinedMatte;
- (id)_applyVignetteStage;
- (id)_faceProtect;
- (id)_faceVignette;
- (id)_getRefinedMatte;
- (id)backgroundPreviewCubeName;
- (id)blendDepth;
- (id)invertRed;
- (id)outputImage;
- (id)previewCubeName;
- (id)standbyCubeName;
- (id)thresholdAndApplyMatte;
- (id)thresholdMatte;
- (void)setDefaults;
- (void)setInputGrainAmount:(id)a3;
- (void)setInputSharpenRadius:(id)a3;
- (void)setInputUseAbsoluteDisparity:(id)a3;
@end

@implementation CIPortraitEffectStageV2

- (id)previewCubeName
{
  return @"CIContourPreview";
}

- (id)standbyCubeName
{
  return @"CIStageStandby";
}

- (id)backgroundPreviewCubeName
{
  return 0;
}

- (void)setDefaults
{
  [(CIPortraitEffectLightV2 *)self setInputSmooth:&off_79E20];
  [(CIPortraitEffectLightV2 *)self setInputEnrich:&off_7A120];
  [(CIPortraitEffectLightV2 *)self setInputEyes:&off_79E20];
  [(CIPortraitEffectLightV2 *)self setInputLocalContrast:&off_7A260];
  [(CIPortraitEffectV2 *)self setInputStrength:&off_7A110];
  [(CIPortraitEffectContourV2 *)self setInputDepthThreshold:&off_7A160];
  [(CIPortraitEffectV2 *)self setInputScale:&off_7A110];
  [(CIPortraitEffectLightV2 *)self setInputTeeth:&off_7A1B0];
  [(CIPortraitEffectStageV2 *)self setInputUseAbsoluteDisparity:&__kCFBooleanFalse];
  [(CIPortraitEffectStageV2 *)self setInputSharpenRadius:&off_7A270];
  [(CIPortraitEffectStageV2 *)self setInputGrainAmount:&off_79EC0];
  [(CIPortraitEffectV2 *)self setInputRenderProxy:&off_7A140];

  [(CIPortraitEffectV2 *)self setInputGenerateSpillMatte:&off_7A140];
}

+ (id)customAttributes
{
  v10[0] = kCIAttributeFilterCategories;
  v9[0] = kCICategoryColorAdjustment;
  v9[1] = kCICategoryVideo;
  v9[2] = kCICategoryStillImage;
  v9[3] = kCICategoryBuiltIn;
  v9[4] = kCICategoryApplePrivate;
  v11[0] = +[NSArray arrayWithObjects:v9 count:5];
  v11[1] = @"11";
  v10[1] = kCIAttributeFilterAvailable_iOS;
  v10[2] = kCIAttributeFilterAvailable_Mac;
  v11[2] = @"10.13";
  v10[3] = @"inputUseAbsoluteDisparity";
  v7[0] = kCIAttributeDefault;
  v7[1] = kCIAttributeType;
  v8[0] = &__kCFBooleanFalse;
  v8[1] = kCIAttributeTypeBoolean;
  v11[3] = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  v10[4] = @"inputSharpenRadius";
  v5[0] = kCIAttributeDefault;
  v5[1] = kCIAttributeType;
  v6[0] = &off_7A270;
  v6[1] = kCIAttributeTypeScalar;
  v11[4] = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  v10[5] = @"inputGrainAmount";
  v3[0] = kCIAttributeDefault;
  v3[1] = kCIAttributeType;
  v4[0] = &off_79EC0;
  v4[1] = kCIAttributeTypeScalar;
  v11[5] = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  return +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:6];
}

- (id)_CIPrepareBlackDisparity
{
  if (qword_8CD78 != -1) {
    dispatch_once(&qword_8CD78, &stru_753C8);
  }
  return (id)qword_8CD70;
}

- (id)_CIPrepareBlackDepth
{
  if (qword_8CD88 != -1) {
    dispatch_once(&qword_8CD88, &stru_753E8);
  }
  return (id)qword_8CD80;
}

- (id)_CIApplyBlackDepth
{
  if (qword_8CD98 != -1) {
    dispatch_once(&qword_8CD98, &stru_75408);
  }
  return (id)qword_8CD90;
}

- (id)_CIApplyStageNoFeather
{
  if (qword_8CDA8 != -1) {
    dispatch_once(&qword_8CDA8, &stru_75428);
  }
  return (id)qword_8CDA0;
}

- (id)_CIApplyStageNoFeatherWithSpillRatio
{
  if (qword_8CDB8 != -1) {
    dispatch_once(&qword_8CDB8, &stru_75448);
  }
  return (id)qword_8CDB0;
}

- (id)_getRefinedMatte
{
  if (qword_8CDC8 != -1) {
    dispatch_once(&qword_8CDC8, &stru_75468);
  }
  return (id)qword_8CDC0;
}

- (id)_applyRefinedMatte
{
  if (qword_8CDD8 != -1) {
    dispatch_once(&qword_8CDD8, &stru_75488);
  }
  return (id)qword_8CDD0;
}

- (id)_CIRefineBlackDepth
{
  if (qword_8CDE8 != -1) {
    dispatch_once(&qword_8CDE8, &stru_754A8);
  }
  return (id)qword_8CDE0;
}

- (id)_faceVignette
{
  if (qword_8CDF8 != -1) {
    dispatch_once(&qword_8CDF8, &stru_754C8);
  }
  return (id)qword_8CDF0;
}

- (id)_faceProtect
{
  if (qword_8CE08 != -1) {
    dispatch_once(&qword_8CE08, &stru_754E8);
  }
  return (id)qword_8CE00;
}

- (id)_applyVignetteStage
{
  if (qword_8CE18 != -1) {
    dispatch_once(&qword_8CE18, &stru_75508);
  }
  return (id)qword_8CE10;
}

- (id)invertRed
{
  if (qword_8CE28 != -1) {
    dispatch_once(&qword_8CE28, &stru_75528);
  }
  return (id)qword_8CE20;
}

- (id)blendDepth
{
  if (qword_8CE38 != -1) {
    dispatch_once(&qword_8CE38, &stru_75548);
  }
  return (id)qword_8CE30;
}

- (id)thresholdMatte
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_8CE48, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_8CE48))
  {
    qword_8CE40 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_thresholdMatteV2(__sample matte, __sample blurMatte, float low, float high) \n { \n float m = smoothstep(low, high, matte.r)*blurMatte.r; \n matte.rgb *= m; \n return matte; \n } \n"];
    __cxa_guard_release(&qword_8CE48);
  }
  return (id)qword_8CE40;
}

- (id)thresholdAndApplyMatte
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_8CE58, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_8CE58))
  {
    qword_8CE50 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_thresholdAndApplyMatteV2(__sample im, __sample matte, __sample m2, vec4 params, float edgeGamma) \n { \n float low = params.x; float high = params.y; float gamma = params.z; float gain = params.w; float m = smoothstep(low, high, pow(matte.r, gamma+edgeGamma*m2.r)); \n im.rgb *= m; \n im.rgb = clamp(im.rgb, 0.0, 1.0); \n im.rgb = pow(im.rgb, vec3(1.0+gain-gain*matte.r)); \n im.rgb = mix(.5*im.rgb*im.rgb, im.rgb, 1.0-m2.r); \n float r = im.r/(im.r+im.g+im.b+0.00001); \n float sat = max(min(1.0, (1.0-r)), 0.0); \n float y = dot(im.rgb, vec3(.3333333)); \n im.rgb = mix(sat*(im.rgb-y)+y, im.rgb, m); \n return im; \n } \n"];
    __cxa_guard_release(&qword_8CE58);
  }
  return (id)qword_8CE50;
}

- (id)outputImage
{
  if (!self->super.super.super.inputImage) {
    return 0;
  }
  inputDisparity = self->super.super.super.inputDisparity;
  if (inputDisparity
    && (v4 = [(CIImage *)inputDisparity depthData]) != 0
    && (char *)[(AVDepthData *)v4 depthDataAccuracy] == (char *)&dword_0 + 1)
  {
    char v5 = 1;
  }
  else
  {
    [(NSNumber *)self->inputUseAbsoluteDisparity BOOLValue];
    char v5 = 0;
  }
  v299.receiver = self;
  v299.super_class = (Class)CIPortraitEffectStageV2;
  id v6 = [(CIPortraitEffectContourV2 *)&v299 outputImage];
  v272 = self;
  if (self->super.super.super.inputMatte)
  {
    char v263 = v5;
    v7 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0]);
    [(CIImage *)self->super.super.super.inputImage extent];
    v278 = -[CIImage imageByCroppingToRect:](v7, "imageByCroppingToRect:");
    [(CIImage *)self->super.super.super.inputImage extent];
    float v9 = v8;
    float v268 = v9;
    [(CIImage *)self->super.super.super.inputMatte extent];
    float v11 = v10;
    float v267 = v11;
    [(CIImage *)self->super.super.super.inputImage extent];
    float v13 = v12;
    float v266 = v13;
    [(CIImage *)self->super.super.super.inputMatte extent];
    float v15 = v14;
    float v265 = v15;
    inputFaceLandmarkArray = self->super.super.super.inputFaceLandmarkArray;
    v271 = v6;
    if (inputFaceLandmarkArray
      && [(NSArray *)inputFaceLandmarkArray count]
      && (long long v297 = 0u,
          long long v298 = 0u,
          long long v295 = 0u,
          long long v296 = 0u,
          obj = self->super.super.super.inputFaceLandmarkArray,
          (id v17 = [(NSArray *)obj countByEnumeratingWithState:&v295 objects:v336 count:16]) != 0))
    {
      id v18 = v17;
      unsigned int v270 = 0;
      int v279 = 0;
      CFStringRef v19 = @"faceJunkinessIndex";
      uint64_t v20 = *(void *)v296;
      CFStringRef v21 = @"faceBoundingBox";
      CFStringRef v22 = @"roll";
      uint64_t v269 = *(void *)v296;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v296 != v20) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v295 + 1) + 8 * i);
          float v25 = 0.0;
          float v26 = 0.0;
          if ([v24 objectForKeyedSubscript:v19])
          {
            objc_msgSend(objc_msgSend(v24, "objectForKeyedSubscript:", v19), "floatValue");
            float v26 = v27;
          }
          if ([v24 objectForKeyedSubscript:v21])
          {
            objc_msgSend(objc_msgSend(objc_msgSend(v24, "objectForKeyedSubscript:", v21), "objectForKeyedSubscript:", @"w"), "floatValue");
            float v25 = v28;
          }
          if ([v24 objectForKeyedSubscript:v22])
          {
            objc_msgSend(objc_msgSend(v24, "objectForKeyedSubscript:", v22), "floatValue");
            float v30 = fabsf(v29);
          }
          else
          {
            float v30 = 0.0;
          }
          if (v26 < -0.2 && v25 > 0.15 && v30 < 1.05)
          {
            ++v279;
            v31 = [LightingFacePoints alloc];
            [(CIImage *)v272->super.super.super.inputImage extent];
            v32 = -[LightingFacePoints initWithFaceLandmarkDictionary:forImageRect:](v31, "initWithFaceLandmarkDictionary:forImageRect:", v24);
            [(LightingFacePoints *)v32 faceWidth];
            double v34 = v33;
            [(CIImage *)v272->super.super.super.inputImage extent];
            float v36 = v34 / v35;
            float v37 = fmax(fmin(v36 * 1.05, 1.0), 0.36);
            unsigned int v270 = objc_msgSend(objc_msgSend(v24, "objectForKeyedSubscript:", @"orientation"), "intValue");
            if (v270 - 5 >= 4) {
              float v38 = 0.0;
            }
            else {
              float v38 = 1.5708;
            }
            [(LightingFacePoints *)v32 centerChin];
            *(float *)&double v39 = v39;
            float v276 = *(float *)&v39;
            [(LightingFacePoints *)v32 centerChin];
            float v41 = v40;
            float v274 = v41;
            [(LightingFacePoints *)v32 faceWidth];
            double v43 = v37;
            float v44 = v42 * 1.5 * v43;
            [(LightingFacePoints *)v32 faceHeight];
            *(float *)&double v43 = v45 * 4.5 * v43;
            __float2 v46 = __sincosf_stret(v38);
            long double v47 = sin(v38 + v38);
            v48 = +[CIVector vectorWithX:(float)(v46.__cosval * v46.__cosval) / ((v44 + v44) * v44)+ (float)(v46.__sinval * v46.__sinval) / ((*(float *)&v43 + *(float *)&v43) * *(float *)&v43) Y:(double)(v47 / (*(float *)&v43 * 4.0 * *(float *)&v43) - v47 / (v44 * 4.0 * v44)) Z:(float)(v46.__sinval * v46.__sinval) / ((v44 + v44) * v44)+ (float)(v46.__cosval * v46.__cosval) / ((*(float *)&v43 + *(float *)&v43) * *(float *)&v43) W:0.7];
            CFStringRef v49 = v22;
            id v50 = v18;
            CFStringRef v51 = v21;
            v52 = +[CIVector vectorWithX:v276 Y:v274];
            CFStringRef v53 = v19;
            id v54 = [(CIPortraitEffectStageV2 *)v272 _faceVignette];
            [(CIImage *)v272->super.super.super.inputImage extent];
            double v56 = v55;
            double v58 = v57;
            double v60 = v59;
            double v62 = v61;
            v335[0] = v271;
            v335[1] = v278;
            v335[2] = v52;
            CFStringRef v21 = v51;
            id v18 = v50;
            CFStringRef v22 = v49;
            v335[3] = v48;
            v63 = +[NSArray arrayWithObjects:v335 count:4];
            v64 = v54;
            CFStringRef v19 = v53;
            uint64_t v20 = v269;
            v278 = (CIImage *)objc_msgSend(v64, "applyWithExtent:arguments:", v63, v56, v58, v60, v62);
          }
        }
        id v18 = [(NSArray *)obj countByEnumeratingWithState:&v295 objects:v336 count:16];
      }
      while (v18);
    }
    else
    {
      unsigned int v270 = 0;
      int v279 = 0;
    }
    float v65 = v268 / v267;
    p_isa = (id *)&v272->super.super.super.super.super.isa;
    v294.receiver = v272;
    v294.super_class = (Class)CIPortraitEffectStageV2;
    float v67 = v266 / v265;
    id v68 = [(CIPortraitEffectLightV2 *)&v294 getRefinedMatteMode:&off_7A8C0];
    if (v272->super.super.super.inputSpillCorrectedRatioImage
      || ([(NSNumber *)v272->super.super.super.inputGenerateSpillMatte floatValue], v69 > 0.0)
      || ([v68 floatValue], v70 > 0.0))
    {
      inputMatte = v272->super.super.super.inputMatte;
      [(NSNumber *)v272->super.super.super.inputGenerateSpillMatte floatValue];
      if (v72 <= 0.0 && ([v68 floatValue], v73 <= 0.0))
      {
        if (v272->super.super.super.inputSpillCorrectedRatioImage) {
          inputSpillCorrectedRatioImage = v272->super.super.super.inputSpillCorrectedRatioImage;
        }
        else {
          inputSpillCorrectedRatioImage = inputMatte;
        }
        v77 = v271;
      }
      else
      {
        v74 = +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
        v293.receiver = v272;
        v293.super_class = (Class)CIPortraitEffectStageV2;
        id v75 = [(CIPortraitEffectLightV2 *)&v293 getRenderSpillCache:&off_7A140];
        v76 = v272->super.super.super.inputMatte;
        v333[0] = @"inputMatte";
        v333[1] = @"bgColor";
        v334[0] = v76;
        v334[1] = v74;
        v333[2] = @"inputRenderCache";
        v334[2] = v75;
        v77 = v271;
        inputSpillCorrectedRatioImage = (CIImage *)objc_msgSend(v271, "imageByApplyingFilter:withInputParameters:", @"CIPortraitEffectSpillCorrection", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v334, v333, 3));
      }
      id v163 = [(CIPortraitEffectStageV2 *)v272 _getRefinedMatte];
      [(CIImage *)inputSpillCorrectedRatioImage extent];
      v332 = inputSpillCorrectedRatioImage;
      id v168 = objc_msgSend(v163, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v332, 1), v164, v165, v166, v167);
      id v169 = objc_msgSend(objc_msgSend(v168, "imageByClampingToExtent"), "imageByApplyingGaussianBlurWithSigma:", 15.0);
      [v168 extent];
      id v170 = objc_msgSend(v169, "imageByCroppingToRect:");
      CFStringRef v330 = @"inputBackgroundImage";
      id v331 = v170;
      id v171 = objc_msgSend(v168, "imageByApplyingFilter:withInputParameters:", @"CIMultiplyBlendMode", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v331, &v330, 1));
      CFStringRef v328 = @"inputBackgroundImage";
      id v329 = v170;
      id v172 = objc_msgSend(v168, "imageByApplyingFilter:withInputParameters:", @"CIDifferenceBlendMode", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v329, &v328, 1));
      [v171 extent];
      double v174 = v173;
      [v77 extent];
      if (v174 != v175)
      {
        id v176 = [v171 imageByClampingToExtent];
        CGAffineTransformMakeScale(&v292, v65, v67);
        id v177 = [v176 imageByApplyingTransform:&v292];
        [v77 extent];
        id v171 = objc_msgSend(v177, "imageByCroppingToRect:");
        CGAffineTransformMakeScale(&v291, v65, v67);
        id v172 = [v172 imageByApplyingTransform:&v291];
      }
      id v178 = [(CIPortraitEffectStageV2 *)v272 _applyRefinedMatte];
      [v77 extent];
      double v180 = v179;
      double v182 = v181;
      double v184 = v183;
      double v186 = v185;
      v327[0] = v77;
      v327[1] = v171;
      v327[2] = v172;
      v187 = +[NSArray arrayWithObjects:v327 count:3];
      v188 = v178;
      double v189 = v180;
      double v190 = v182;
      double v191 = v184;
      double v192 = v186;
    }
    else
    {
      id v277 = [(CIPortraitEffectStageV2 *)v272 thresholdMatte];
      v214 = [(CIImage *)v272->super.super.super.inputMatte imageByClampingToExtent];
      CGAffineTransformMakeScale(&v290, 0.5, 0.5);
      v275 = v214;
      v215 = [(CIImage *)v214 imageByApplyingTransform:&v290];
      id v216 = +[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_red(__sample s) { return s.xxxw; }"];
      [(CIImage *)v215 extent];
      double v218 = v217;
      double v220 = v219;
      double v222 = v221;
      double v224 = v223;
      v326 = v215;
      v225 = +[NSArray arrayWithObjects:&v326 count:1];
      uint64_t v324 = kCIKernelOutputFormat;
      v325 = +[NSNumber numberWithInt:kCIFormatR8];
      id v226 = objc_msgSend(v216, "applyWithExtent:arguments:options:", v225, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v325, &v324, 1), v218, v220, v222, v224);
      [(NSNumber *)v272->super.super.super.inputScale floatValue];
      float v228 = v227 * 5.0;
      [(NSNumber *)v272->super.super.super.inputScale floatValue];
      float v230 = *(float *)&v229;
      if ((v263 & 1) != 0 || [(NSNumber *)v272->inputUseAbsoluteDisparity BOOLValue])
      {
        *(float *)&double v229 = v228 * 2.75;
        float v230 = v230 * 1.25;
      }
      else
      {
        *(float *)&double v229 = v228 * 1.75;
      }
      if (v270)
      {
        if (v270 - 5 >= 4) {
          float v231 = 1.5708;
        }
        else {
          float v231 = 0.0;
        }
        v322[0] = @"inputRadius";
        v323[0] = +[NSNumber numberWithFloat:v229];
        v322[1] = @"inputAngle";
        *(float *)&double v232 = v231;
        v323[1] = +[NSNumber numberWithFloat:v232];
        id v233 = objc_msgSend(objc_msgSend(v226, "imageByApplyingFilter:withInputParameters:", @"CIMotionBlur", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v323, v322, 2)), "imageByApplyingGaussianBlurWithSigma:", v230);
        p_isa = (id *)&v272->super.super.super.super.super.isa;
      }
      else
      {
        p_isa = (id *)&v272->super.super.super.super.super.isa;
        [(NSNumber *)v272->super.super.super.inputScale floatValue];
        id v233 = [v226 imageByApplyingGaussianBlurWithSigma:v234 * 8.0];
      }
      CFStringRef v320 = @"inputRadius";
      [p_isa[18] floatValue];
      v321 = +[NSNumber numberWithDouble:v235 * -3.0];
      id v236 = objc_msgSend(v226, "imageByApplyingFilter:withInputParameters:", @"CICheapMorphology", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v321, &v320, 1));
      CFStringRef v318 = @"inputBackgroundImage";
      id v319 = v236;
      id v237 = objc_msgSend(v233, "imageByApplyingFilter:withInputParameters:", @"CIDifferenceBlendMode", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v319, &v318, 1));
      CGAffineTransformMakeScale(&v289, 2.0, 2.0);
      id v238 = [v233 imageByApplyingTransform:&v289];
      CGAffineTransformMakeScale(&v288, 2.0, 2.0);
      id v239 = [v237 imageByApplyingTransform:&v288];
      [p_isa[15] extent];
      v317[0] = v275;
      v317[1] = v238;
      v317[2] = &off_7A120;
      v317[3] = &off_7A160;
      id v244 = objc_msgSend(v277, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v317, 4), v240, v241, v242, v243);
      CGAffineTransformMakeScale(&v287, v65, v67);
      id v245 = [v244 imageByApplyingTransform:&v287];
      [v271 extent];
      id v246 = objc_msgSend(v245, "imageByCroppingToRect:");
      CGAffineTransformMakeScale(&v286, v65, v67);
      id v247 = [v239 imageByApplyingTransform:&v286];
      [v271 extent];
      id v248 = objc_msgSend(v247, "imageByCroppingToRect:");
      id v249 = [p_isa thresholdAndApplyMatte];
      double v250 = 0.5;
      double v251 = 0.100000001;
      int v252 = 1059481190;
      double v253 = 2.20000005;
      if ((v263 & 1) == 0 && ([p_isa[31] BOOLValue] & 1) == 0)
      {
        double v251 = 0.0;
        double v253 = 1.75;
        double v250 = 0.400000006;
        int v252 = 1036831949;
      }
      v254 = +[CIVector vectorWithX:v251 Y:1.0 Z:v250 W:v253];
      [v271 extent];
      double v256 = v255;
      double v258 = v257;
      double v260 = v259;
      double v262 = v261;
      v316[0] = v271;
      v316[1] = v246;
      v316[2] = v248;
      v316[3] = v254;
      LODWORD(v255) = v252;
      v316[4] = +[NSNumber numberWithFloat:v255];
      v187 = +[NSArray arrayWithObjects:v316 count:5];
      v188 = v249;
      double v189 = v256;
      double v190 = v258;
      double v191 = v260;
      double v192 = v262;
    }
    id v193 = objc_msgSend(v188, "applyWithExtent:arguments:", v187, v189, v190, v191, v192);
    [p_isa[32] floatValue];
    float v195 = v194;
    [p_isa[18] floatValue];
    *(float *)&double v197 = v195 * v196;
    v315[0] = &off_79E40;
    v314[0] = @"inputSharpness";
    v314[1] = @"inputRadius";
    v315[1] = +[NSNumber numberWithFloat:v197];
    id v198 = objc_msgSend(v193, "imageByApplyingFilter:withInputParameters:", @"CISharpenLuminance", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v315, v314, 2));
    if (v279 >= 1)
    {
      id v199 = [p_isa _applyVignetteStage];
      [p_isa[9] extent];
      double v201 = v200;
      double v203 = v202;
      double v205 = v204;
      double v207 = v206;
      v313[0] = v198;
      v313[1] = v278;
      LODWORD(v200) = 1061997773;
      v313[2] = +[NSNumber numberWithFloat:v200];
      id v198 = objc_msgSend(v199, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v313, 3), v201, v203, v205, v207);
    }
    [p_isa[18] floatValue];
    float v209 = v208;
    [p_isa[33] floatValue];
    *(float *)&double v211 = v209 * v210;
    v311[0] = @"inputAmount";
    v212 = +[NSNumber numberWithFloat:v211];
    v311[1] = @"inputISO";
    v312[0] = v212;
    v312[1] = &off_7A8A8;
    v161 = +[NSDictionary dictionaryWithObjects:v312 forKeys:v311 count:2];
    v162 = v198;
    return [v162 imageByApplyingFilter:@"CIPhotoGrain" withInputParameters:v161];
  }
  if (self->super.super.super.inputBlurMap)
  {
    char v264 = v5;
    v79 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0]);
    [(CIImage *)self->super.super.super.inputImage extent];
    v80 = -[CIImage imageByCroppingToRect:](v79, "imageByCroppingToRect:");
    [(CIImage *)self->super.super.super.inputImage extent];
    double v81 = 0.5;
    float v83 = v82 * 0.5;
    [(CIImage *)self->super.super.super.inputImage extent];
    float v85 = v84 * 0.5;
    double v86 = v83;
    float v87 = v86 * 0.3;
    double v88 = v85;
    float v89 = v85 * 0.3;
    v90 = +[CIVector vectorWithX:1.0 / ((v87 + v87) * v87) + 0.0 / ((v89 + v89) * v89) Y:0.0 / (v89 * 4.0 * v89) - 0.0 / (v87 * 4.0 * v87) Z:0.0 / ((v87 + v87) * v87) + 1.0 / ((v89 + v89) * v89) W:0.7];
    v91 = +[CIVector vectorWithX:v86 Y:v88];
    id v92 = [(CIPortraitEffectStageV2 *)self _faceVignette];
    [(CIImage *)self->super.super.super.inputImage extent];
    v310[0] = v6;
    v310[1] = v80;
    v310[2] = v91;
    v310[3] = v90;
    id v280 = objc_msgSend(v92, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v310, 4), v93, v94, v95, v96);
    inputBlurMap = self->super.super.super.inputBlurMap;
    id v98 = [(CIPortraitEffectStageV2 *)self _CIPrepareBlackDepth];
    [(CIImage *)self->super.super.super.inputBlurMap extent];
    v309[0] = inputBlurMap;
    v309[1] = &off_79DE0;
    id v103 = objc_msgSend(objc_msgSend(v98, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v309, 2), v99, v100, v101, v102), "imageByClampingToExtent");
    CGAffineTransformMakeScale(&v285, 0.5, 0.5);
    id v104 = [v103 imageByApplyingTransform:&v285];
    [(NSNumber *)self->super.super.super.inputScale floatValue];
    id v106 = [v104 imageByApplyingGaussianBlurWithSigma:v105 * 8.0];
    id v107 = [v104 imageByApplyingFilter:@"CICheapMorphology" withInputParameters:&off_7DD38];
    CFStringRef v307 = @"inputBackgroundImage";
    id v308 = v107;
    id v108 = objc_msgSend(v106, "imageByApplyingFilter:withInputParameters:", @"CIDifferenceBlendMode", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v308, &v307, 1));
    CGAffineTransformMakeScale(&v284, 2.0, 2.0);
    id v109 = [v106 imageByApplyingTransform:&v284];
    CGAffineTransformMakeScale(&v283, 2.0, 2.0);
    id v110 = [v108 imageByApplyingTransform:&v283];
    id v111 = [(CIPortraitEffectStageV2 *)self thresholdMatte];
    [v103 extent];
    v306[0] = v103;
    v306[1] = v109;
    v306[2] = &off_7A120;
    v306[3] = &off_7A160;
    id v116 = objc_msgSend(v111, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v306, 4), v112, v113, v114, v115);
    [(CIImage *)self->super.super.super.inputImage extent];
    *(float *)&double v86 = v117;
    [(CIImage *)self->super.super.super.inputBlurMap extent];
    float v119 = v118;
    *(float *)&double v86 = *(float *)&v86 / v119;
    [(CIImage *)self->super.super.super.inputImage extent];
    *(float *)&double v88 = v120;
    [(CIImage *)self->super.super.super.inputBlurMap extent];
    float v122 = v121;
    CGFloat v123 = *(float *)&v86;
    CGFloat v124 = (float)(*(float *)&v88 / v122);
    CGAffineTransformMakeScale(&v282, v123, v124);
    id v125 = [v116 imageByApplyingTransform:&v282];
    [v6 extent];
    id v126 = objc_msgSend(v125, "imageByCroppingToRect:");
    CGAffineTransformMakeScale(&v281, v123, v124);
    id v127 = [v110 imageByApplyingTransform:&v281];
    [v6 extent];
    id v128 = objc_msgSend(v127, "imageByCroppingToRect:");
    id v129 = [(CIPortraitEffectStageV2 *)self thresholdAndApplyMatte];
    double v130 = 2.20000005;
    int v131 = 1059481190;
    double v132 = 0.100000001;
    if ((v264 & 1) == 0 && ![(NSNumber *)self->inputUseAbsoluteDisparity BOOLValue])
    {
      double v130 = 1.75;
      double v132 = 0.0;
      int v131 = 1036831949;
      double v81 = 0.400000006;
    }
    v133 = +[CIVector vectorWithX:v132 Y:1.0 Z:v81 W:v130];
    [v6 extent];
    double v135 = v134;
    double v137 = v136;
    double v139 = v138;
    double v141 = v140;
    v305[0] = v6;
    v305[1] = v126;
    v305[2] = v128;
    v305[3] = v133;
    LODWORD(v134) = v131;
    v305[4] = +[NSNumber numberWithFloat:v134];
    id v142 = objc_msgSend(v129, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v305, 5), v135, v137, v139, v141);
    [(NSNumber *)self->inputSharpenRadius floatValue];
    LODWORD(v135) = v143;
    [(NSNumber *)self->super.super.super.inputScale floatValue];
    *(float *)&double v145 = *(float *)&v135 * v144;
    v304[0] = &off_79E40;
    v303[0] = @"inputSharpness";
    v303[1] = @"inputRadius";
    v304[1] = +[NSNumber numberWithFloat:v145];
    id v146 = objc_msgSend(v142, "imageByApplyingFilter:withInputParameters:", @"CISharpenLuminance", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v304, v303, 2));
    id v147 = [(CIPortraitEffectStageV2 *)self _applyVignetteStage];
    [(CIImage *)self->super.super.super.inputImage extent];
    double v149 = v148;
    double v151 = v150;
    double v153 = v152;
    double v155 = v154;
    v302[0] = v146;
    v302[1] = v280;
    LODWORD(v148) = 1061997773;
    v302[2] = +[NSNumber numberWithFloat:v148];
    id v156 = objc_msgSend(v147, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v302, 3), v149, v151, v153, v155);
    [(NSNumber *)self->super.super.super.inputScale floatValue];
    LODWORD(v149) = v157;
    [(NSNumber *)self->inputGrainAmount floatValue];
    *(float *)&double v159 = *(float *)&v149 * v158;
    v300[0] = @"inputAmount";
    v160 = +[NSNumber numberWithFloat:v159];
    v300[1] = @"inputISO";
    v301[0] = v160;
    v301[1] = &off_7A8A8;
    v161 = +[NSDictionary dictionaryWithObjects:v301 forKeys:v300 count:2];
    v162 = v156;
    return [v162 imageByApplyingFilter:@"CIPhotoGrain" withInputParameters:v161];
  }
  return v6;
}

- (NSNumber)inputUseAbsoluteDisparity
{
  return self->inputUseAbsoluteDisparity;
}

- (void)setInputUseAbsoluteDisparity:(id)a3
{
}

- (NSNumber)inputSharpenRadius
{
  return self->inputSharpenRadius;
}

- (void)setInputSharpenRadius:(id)a3
{
}

- (NSNumber)inputGrainAmount
{
  return self->inputGrainAmount;
}

- (void)setInputGrainAmount:(id)a3
{
}

@end