@interface CIPortraitEffectStageWhite
- (NSNumber)inputGrainAmount;
- (NSNumber)inputSharpenRadius;
- (NSNumber)inputUseAbsoluteDisparity;
- (id)_CIPrepareWhiteDepth;
- (id)_applyRefinedWhiteMatte;
- (id)_applyWhiteNoFeather;
- (id)_getRefinedWhiteMatte;
- (id)outputImage;
- (id)previewCubeName;
- (id)thresholdAndApplyWhiteBG;
- (id)thresholdWhiteMatte;
- (void)setDefaults;
- (void)setInputGrainAmount:(id)a3;
- (void)setInputSharpenRadius:(id)a3;
- (void)setInputUseAbsoluteDisparity:(id)a3;
@end

@implementation CIPortraitEffectStageWhite

- (id)previewCubeName
{
  return @"CIPhotoEffectStageMono";
}

- (id)thresholdAndApplyWhiteBG
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_8CE68, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_8CE68))
  {
    qword_8CE60 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_thresholdAndApplyWhiteBG(__sample im, __sample matte, __sample m2, float low, float high, float gamma, float gain) \n { \n float m = smoothstep(low, high, pow(matte.r, gamma+.5*m2.r)); \n im.rgb = mix(vec3(1.0), im.rgb, m); \n im.rgb = clamp(im.rgb, 0.0, 1.0); \n im.rgb = pow(im.rgb, vec3(1.0+gain-gain*m)); \n im.rgb = mix(.5*im.rgb*im.rgb, im.rgb, 1.0-m2.r); \n float r = im.r/(im.r+im.g+im.b+0.00001); \n float sat = max(min(1.0, (1.3-.9*r)), 0.0); \n float y = dot(im.rgb, vec3(.3333333)); \n im.rgb = mix(sat*(im.rgb-y)+y, im.rgb, m); \n return im; \n } \n"];
    __cxa_guard_release(&qword_8CE68);
  }
  return (id)qword_8CE60;
}

- (id)thresholdWhiteMatte
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_8CE78, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_8CE78))
  {
    qword_8CE70 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_thresholdWhiteMatte(__sample matte, __sample blurMatte, float low, float high) \n { \n float m = smoothstep(low, high, matte.r)*blurMatte.r; \n matte.rgb *= m; \n return matte; \n } \n"];
    __cxa_guard_release(&qword_8CE78);
  }
  return (id)qword_8CE70;
}

- (id)_CIPrepareWhiteDepth
{
  if (qword_8CE88 != -1) {
    dispatch_once(&qword_8CE88, &stru_75568);
  }
  return (id)qword_8CE80;
}

- (id)_applyWhiteNoFeather
{
  if (qword_8CE98 != -1) {
    dispatch_once(&qword_8CE98, &stru_75588);
  }
  return (id)qword_8CE90;
}

- (id)_getRefinedWhiteMatte
{
  if (qword_8CEA8 != -1) {
    dispatch_once(&qword_8CEA8, &stru_755A8);
  }
  return (id)qword_8CEA0;
}

- (id)_applyRefinedWhiteMatte
{
  if (qword_8CEB8 != -1) {
    dispatch_once(&qword_8CEB8, &stru_755C8);
  }
  return (id)qword_8CEB0;
}

- (void)setDefaults
{
  [(CIPortraitEffectLightV2 *)self setInputSmooth:&off_7A2A0];
  [(CIPortraitEffectLightV2 *)self setInputEnrich:&off_7A190];
  [(CIPortraitEffectLightV2 *)self setInputLocalContrast:&off_7A2B0];
  [(CIPortraitEffectStudioV2 *)self setInputKickLight:&off_7A0F0];
  [(CIPortraitEffectStudioV2 *)self setInputFaceLight:&off_79E50];
  [(CIPortraitEffectV2 *)self setInputStrength:&off_7A170];
  [(CIPortraitEffectStudioV2 *)self setInputDepthThreshold:&off_7A160];
  [(CIPortraitEffectLightV2 *)self setInputEyes:&off_7A170];
  [(CIPortraitEffectV2 *)self setInputScale:&off_7A110];
  [(CIPortraitEffectStageWhite *)self setInputSharpenRadius:&off_7A290];
  [(CIPortraitEffectLightV2 *)self setInputTeeth:&off_7A1B0];
  [(CIPortraitEffectStageWhite *)self setInputGrainAmount:&off_7A2C0];
  [(CIPortraitEffectV2 *)self setInputRenderProxy:&off_7A140];

  [(CIPortraitEffectV2 *)self setInputGenerateSpillMatte:&off_7A140];
}

- (id)outputImage
{
  id result = self->super.super.super.inputImage;
  if (result && (self->super.super.super.inputMatte || self->super.super.super.inputBlurMap))
  {
    v126.receiver = self;
    v126.super_class = (Class)CIPortraitEffectStageWhite;
    id v4 = [(CIPortraitEffectStudioV2 *)&v126 outputImage];
    if (self->super.super.super.inputMatte)
    {
      v125.receiver = self;
      v125.super_class = (Class)CIPortraitEffectStageWhite;
      id v5 = [(CIPortraitEffectLightV2 *)&v125 getRefinedMatteMode:&off_7A8C0];
      if (self->super.super.super.inputSpillCorrectedRatioImage
        || (v6 = v5, [(NSNumber *)self->super.super.super.inputGenerateSpillMatte floatValue], v7 > 0.0)
        || ([v6 floatValue], double v8 = 1.0, v9 > 0.0))
      {
        double v8 = 0.5;
      }
      [(CIImage *)self->super.super.super.inputImage extent];
      float v11 = v10;
      [(CIImage *)self->super.super.super.inputMatte extent];
      float v13 = v12;
      float v14 = v11 / v13;
      [(CIImage *)self->super.super.super.inputImage extent];
      float v16 = v15;
      [(CIImage *)self->super.super.super.inputMatte extent];
      float v18 = v17;
      float v19 = v16 / v18;
      id v20 = [(CIPortraitEffectStageWhite *)self thresholdWhiteMatte];
      v21 = [(CIImage *)self->super.super.super.inputMatte imageByClampingToExtent];
      CGAffineTransformMakeScale(&v124, 0.5, 0.5);
      v22 = [(CIImage *)v21 imageByApplyingTransform:&v124];
      [(NSNumber *)self->super.super.super.inputScale floatValue];
      v24 = [(CIImage *)v22 imageByApplyingGaussianBlurWithSigma:v23 * 8.0];
      [(NSNumber *)self->super.super.super.inputScale floatValue];
      v26 = [(CIImage *)v24 imageByApplyingGaussianBlurWithSigma:v8 * (v25 * 12.0)];
      CGAffineTransformMakeScale(&v123, 2.0, 2.0);
      v27 = [(CIImage *)v24 imageByApplyingTransform:&v123];
      CGAffineTransformMakeScale(&v122, 2.0, 2.0);
      v28 = [(CIImage *)v26 imageByApplyingTransform:&v122];
      [(CIImage *)self->super.super.super.inputMatte extent];
      v147[0] = v21;
      v147[1] = v27;
      v147[2] = &off_7A120;
      v147[3] = &off_7A160;
      id v33 = objc_msgSend(v20, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v147, 4), v29, v30, v31, v32);
      inputMatte = self->super.super.super.inputMatte;
      CFStringRef v145 = @"inputBackgroundImage";
      v146 = inputMatte;
      v35 = [(CIImage *)v28 imageByApplyingFilter:@"CIDifferenceBlendMode" withInputParameters:+[NSDictionary dictionaryWithObjects:&v146 forKeys:&v145 count:1]];
      CGAffineTransformMakeScale(&v121, v14, v19);
      id v36 = [v33 imageByApplyingTransform:&v121];
      [v4 extent];
      id v37 = objc_msgSend(v36, "imageByCroppingToRect:");
      CGAffineTransformMakeScale(&v120, v14, v19);
      v38 = [(CIImage *)v35 imageByApplyingTransform:&v120];
      [v4 extent];
      v39 = -[CIImage imageByCroppingToRect:](v38, "imageByCroppingToRect:");
      id v40 = [(CIPortraitEffectStageWhite *)self thresholdAndApplyWhiteBG];
      float v41 = dbl_56150[v8 < 1.0];
      [v4 extent];
      double v43 = v42;
      double v45 = v44;
      double v47 = v46;
      double v49 = v48;
      v144[0] = v4;
      v144[1] = v37;
      v144[2] = v39;
      v144[3] = &off_7A120;
      v144[4] = &off_7A110;
      *(float *)&double v42 = v41;
      v144[5] = +[NSNumber numberWithFloat:v42];
      v144[6] = &off_7A250;
      id v50 = objc_msgSend(v40, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v144, 7), v43, v45, v47, v49);
      [(NSNumber *)self->inputSharpenRadius floatValue];
      float v52 = v51;
      [(NSNumber *)self->super.super.super.inputScale floatValue];
      *(float *)&double v54 = v52 * v53;
      v143[0] = &off_79E40;
      v142[0] = @"inputSharpness";
      v142[1] = @"inputRadius";
      v143[1] = +[NSNumber numberWithFloat:v54];
      id v55 = objc_msgSend(v50, "imageByApplyingFilter:withInputParameters:", @"CISharpenLuminance", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v143, v142, 2));
      v140 = kCIInputEVKey;
      v141 = &off_7A1B0;
      id v56 = objc_msgSend(v55, "imageByApplyingFilter:withInputParameters:", @"CIExposureAdjust", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1));
      [(NSNumber *)self->super.super.super.inputScale floatValue];
      float v58 = v57;
      [(NSNumber *)self->inputGrainAmount floatValue];
      *(float *)&double v60 = v58 * v59;
      v138[0] = @"inputAmount";
      v61 = +[NSNumber numberWithFloat:v60];
      v138[1] = @"inputISO";
      v139[0] = v61;
      v139[1] = &off_7A8A8;
      v62 = v139;
      v63 = v138;
    }
    else
    {
      if (!self->super.super.super.inputBlurMap) {
        return objc_msgSend(objc_msgSend(v4, "imageByApplyingFilter:", @"CIPhotoEffectStageMono"), "imageByApplyingFilter:withInputParameters:", @"CISmartBlackAndWhite", &off_7DDB0);
      }
      [(CIImage *)self->super.super.super.inputImage extent];
      float v65 = v64;
      [(CIImage *)self->super.super.super.inputBlurMap extent];
      float v67 = v66;
      float v68 = v65 / v67;
      [(CIImage *)self->super.super.super.inputImage extent];
      float v70 = v69;
      [(CIImage *)self->super.super.super.inputBlurMap extent];
      float v72 = v71;
      float v73 = v70 / v72;
      id v74 = [(CIPortraitEffectStageWhite *)self thresholdWhiteMatte];
      inputBlurMap = self->super.super.super.inputBlurMap;
      id v76 = [(CIPortraitEffectStageWhite *)self _CIPrepareWhiteDepth];
      [(CIImage *)self->super.super.super.inputBlurMap extent];
      v137[0] = inputBlurMap;
      v137[1] = &off_79DE0;
      id v81 = objc_msgSend(objc_msgSend(v76, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v137, 2), v77, v78, v79, v80), "imageByClampingToExtent");
      CGAffineTransformMakeScale(&v119, 0.5, 0.5);
      id v82 = [v81 imageByApplyingTransform:&v119];
      [(NSNumber *)self->super.super.super.inputScale floatValue];
      id v84 = [v82 imageByApplyingGaussianBlurWithSigma:v83 * 8.0];
      [(NSNumber *)self->super.super.super.inputScale floatValue];
      id v86 = [v84 imageByApplyingGaussianBlurWithSigma:v85 * 12.0];
      CGAffineTransformMakeScale(&v118, 2.0, 2.0);
      id v87 = [v84 imageByApplyingTransform:&v118];
      CGAffineTransformMakeScale(&v117, 2.0, 2.0);
      id v88 = [v86 imageByApplyingTransform:&v117];
      [(CIImage *)self->super.super.super.inputBlurMap extent];
      v136[0] = v81;
      v136[1] = v87;
      v136[2] = &off_7A120;
      v136[3] = &off_7A160;
      id v93 = objc_msgSend(v74, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v136, 4), v89, v90, v91, v92);
      CFStringRef v134 = @"inputBackgroundImage";
      id v135 = v93;
      id v94 = objc_msgSend(v88, "imageByApplyingFilter:withInputParameters:", @"CIDifferenceBlendMode", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1));
      CGAffineTransformMakeScale(&v116, v68, v73);
      id v95 = [v93 imageByApplyingTransform:&v116];
      [v4 extent];
      id v96 = objc_msgSend(v95, "imageByCroppingToRect:");
      CGAffineTransformMakeScale(&v115, v68, v73);
      id v97 = [v94 imageByApplyingTransform:&v115];
      [v4 extent];
      id v98 = objc_msgSend(v97, "imageByCroppingToRect:");
      id v99 = [(CIPortraitEffectStageWhite *)self thresholdAndApplyWhiteBG];
      [v4 extent];
      v133[0] = v4;
      v133[1] = v96;
      v133[2] = v98;
      v133[3] = &off_7A120;
      v133[4] = &off_7A110;
      v133[5] = &off_79E20;
      v133[6] = &off_7A250;
      id v104 = objc_msgSend(v99, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v133, 7), v100, v101, v102, v103);
      [(NSNumber *)self->inputSharpenRadius floatValue];
      float v106 = v105;
      [(NSNumber *)self->super.super.super.inputScale floatValue];
      *(float *)&double v108 = v106 * v107;
      v132[0] = &off_79E40;
      v131[0] = @"inputSharpness";
      v131[1] = @"inputRadius";
      v132[1] = +[NSNumber numberWithFloat:v108];
      id v109 = objc_msgSend(v104, "imageByApplyingFilter:withInputParameters:", @"CISharpenLuminance", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v132, v131, 2));
      v129 = kCIInputEVKey;
      v130 = &off_7A1B0;
      id v56 = objc_msgSend(v109, "imageByApplyingFilter:withInputParameters:", @"CIExposureAdjust", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1));
      [(NSNumber *)self->super.super.super.inputScale floatValue];
      float v111 = v110;
      [(NSNumber *)self->inputGrainAmount floatValue];
      *(float *)&double v113 = v111 * v112;
      v127[0] = @"inputAmount";
      v114 = +[NSNumber numberWithFloat:v113];
      v127[1] = @"inputISO";
      v128[0] = v114;
      v128[1] = &off_7A8A8;
      v62 = v128;
      v63 = v127;
    }
    id v4 = objc_msgSend(v56, "imageByApplyingFilter:withInputParameters:", @"CIPhotoGrain", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v62, v63, 2));
    return objc_msgSend(objc_msgSend(v4, "imageByApplyingFilter:", @"CIPhotoEffectStageMono"), "imageByApplyingFilter:withInputParameters:", @"CISmartBlackAndWhite", &off_7DDB0);
  }
  return result;
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