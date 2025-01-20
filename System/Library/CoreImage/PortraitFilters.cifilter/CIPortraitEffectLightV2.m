@interface CIPortraitEffectLightV2
+ (id)customAttributes;
- (NSNumber)inputEnrich;
- (NSNumber)inputEyes;
- (NSNumber)inputLocalContrast;
- (NSNumber)inputSmooth;
- (NSNumber)inputTeeth;
- (id)_cheapEdgePreserve;
- (id)_enrichV2;
- (id)_eyeBlurV2;
- (id)_eyeBrightenSoftlight;
- (id)_eyeBrightenV2;
- (id)_featherEdge;
- (id)_protectEyesNose;
- (id)_textureAdd;
- (id)_textureDiff;
- (id)_whitenTeeth;
- (id)enrichImage:(id)a3;
- (id)eyeBlurForLandmarks:(id)a3;
- (id)faceMaskForLandmarks:(id)a3;
- (id)getDraftMode:(id)a3;
- (id)getRefinedMatteMode:(id)a3;
- (id)getRenderSpillCache:(id)a3;
- (id)imageForLandmarks:(id)a3;
- (id)maskForLandmarks:(id)a3 withFilterNamed:(id)a4;
- (id)outputImage;
- (id)processEyesIn:(id)a3 withEyeBlur:(id)a4 landmarks:(id)a5;
- (id)processSkinIn:(id)a3 withFaceMask:(id)a4;
- (id)processTeethIn:(id)a3 withFaceMask:(id)a4;
- (id)processTeethIn:(id)a3 withTeethMask:(id)a4;
- (id)protectEyesNose:(id)a3 withFaceMask:(id)a4 withOrientation:(int)a5;
- (id)skinMaskForLandmarks:(id)a3;
- (id)teethMaskForLandmarks:(id)a3;
- (void)setDefaults;
- (void)setInputEnrich:(id)a3;
- (void)setInputEyes:(id)a3;
- (void)setInputLocalContrast:(id)a3;
- (void)setInputSmooth:(id)a3;
- (void)setInputTeeth:(id)a3;
@end

@implementation CIPortraitEffectLightV2

+ (id)customAttributes
{
  v14[0] = kCIAttributeFilterCategories;
  v13[0] = kCICategoryColorEffect;
  v13[1] = kCICategoryVideo;
  v13[2] = kCICategoryInterlaced;
  v13[3] = kCICategoryNonSquarePixels;
  v13[4] = kCICategoryStillImage;
  v13[5] = kCICategoryBuiltIn;
  v13[6] = kCICategoryApplePrivate;
  v15[0] = +[NSArray arrayWithObjects:v13 count:7];
  v15[1] = @"12";
  v14[1] = kCIAttributeFilterAvailable_iOS;
  v14[2] = kCIAttributeFilterAvailable_Mac;
  v15[2] = @"10.13";
  v14[3] = @"inputSmooth";
  v11[0] = kCIAttributeMin;
  v11[1] = kCIAttributeSliderMin;
  v12[0] = &off_7A150;
  v12[1] = &off_7A150;
  v11[2] = kCIAttributeSliderMax;
  v11[3] = kCIAttributeDefault;
  v12[2] = &off_7A0F0;
  v12[3] = &off_79CA0;
  v11[4] = kCIAttributeIdentity;
  v11[5] = kCIAttributeType;
  v12[4] = &off_7A120;
  v12[5] = kCIAttributeTypeScalar;
  v15[3] = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:6];
  v14[4] = @"inputEnrich";
  v9[0] = kCIAttributeMin;
  v9[1] = kCIAttributeSliderMin;
  v10[0] = &off_7A120;
  v10[1] = &off_7A120;
  v9[2] = kCIAttributeSliderMax;
  v9[3] = kCIAttributeDefault;
  v10[2] = &off_7A0F0;
  v10[3] = &off_7A160;
  v9[4] = kCIAttributeIdentity;
  v9[5] = kCIAttributeType;
  v10[4] = &off_7A120;
  v10[5] = kCIAttributeTypeScalar;
  v15[4] = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:6];
  v14[5] = @"inputTeeth";
  v7[0] = kCIAttributeMin;
  v7[1] = kCIAttributeSliderMin;
  v8[0] = &off_7A120;
  v8[1] = &off_7A120;
  v7[2] = kCIAttributeSliderMax;
  v7[3] = kCIAttributeDefault;
  v8[2] = &off_7A0F0;
  v8[3] = &off_79C40;
  v7[4] = kCIAttributeIdentity;
  v7[5] = kCIAttributeType;
  v8[4] = &off_7A120;
  v8[5] = kCIAttributeTypeScalar;
  v15[5] = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:6];
  v14[6] = @"inputEyes";
  v5[0] = kCIAttributeMin;
  v5[1] = kCIAttributeSliderMin;
  v6[0] = &off_7A120;
  v6[1] = &off_7A120;
  v5[2] = kCIAttributeSliderMax;
  v5[3] = kCIAttributeDefault;
  v6[2] = &off_7A0F0;
  v6[3] = &off_7A170;
  v5[4] = kCIAttributeIdentity;
  v5[5] = kCIAttributeType;
  v6[4] = &off_7A120;
  v6[5] = kCIAttributeTypeScalar;
  v15[6] = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:6];
  v14[7] = @"inputLocalContrast";
  v3[0] = kCIAttributeMin;
  v3[1] = kCIAttributeSliderMin;
  v4[0] = &off_7A150;
  v4[1] = &off_7A150;
  v3[2] = kCIAttributeSliderMax;
  v3[3] = kCIAttributeDefault;
  v4[2] = &off_7A0F0;
  v4[3] = &off_7A120;
  v3[4] = kCIAttributeIdentity;
  v3[5] = kCIAttributeType;
  v4[4] = &off_7A120;
  v4[5] = kCIAttributeTypeScalar;
  v15[7] = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:6];
  return +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:8];
}

- (id)getDraftMode:(id)a3
{
  if (qword_8CC18 != -1) {
    dispatch_once(&qword_8CC18, &stru_750E8);
  }
  if (dword_8C7B8 < 0) {
    return a3;
  }

  return +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
}

- (id)getRefinedMatteMode:(id)a3
{
  if (qword_8CC20 != -1) {
    dispatch_once(&qword_8CC20, &stru_75108);
  }
  if (dword_8C7BC < 0) {
    return a3;
  }

  return +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
}

- (id)getRenderSpillCache:(id)a3
{
  if (qword_8CC28 != -1) {
    dispatch_once(&qword_8CC28, &stru_75128);
  }
  if (dword_8C7C0 < 0) {
    return a3;
  }

  return +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
}

- (void)setDefaults
{
  [(CIPortraitEffectLightV2 *)self setInputSmooth:&off_7A180];
  [(CIPortraitEffectLightV2 *)self setInputEnrich:&off_7A190];
  [(CIPortraitEffectLightV2 *)self setInputTeeth:&off_79C40];
  [(CIPortraitEffectLightV2 *)self setInputLocalContrast:&off_7A1A0];
  [(CIPortraitEffectV2 *)self setInputStrength:&off_7A170];
  [(CIPortraitEffectLightV2 *)self setInputEyes:&off_79DE0];
  [(CIPortraitEffectV2 *)self setInputScale:&off_7A110];
  [(CIPortraitEffectV2 *)self setInputRenderProxy:&off_7A140];

  [(CIPortraitEffectV2 *)self setInputGenerateSpillMatte:&off_7A140];
}

- (id)_whitenTeeth
{
  if (qword_8CC38 != -1) {
    dispatch_once(&qword_8CC38, &stru_75148);
  }
  return (id)qword_8CC30;
}

- (id)_enrichV2
{
  if (qword_8CC48 != -1) {
    dispatch_once(&qword_8CC48, &stru_75168);
  }
  return (id)qword_8CC40;
}

- (id)_eyeBrightenV2
{
  if (qword_8CC58 != -1) {
    dispatch_once(&qword_8CC58, &stru_75188);
  }
  return (id)qword_8CC50;
}

- (id)_eyeBrightenSoftlight
{
  if (qword_8CC68 != -1) {
    dispatch_once(&qword_8CC68, &stru_751A8);
  }
  return (id)qword_8CC60;
}

- (id)_textureDiff
{
  if (qword_8CC78 != -1) {
    dispatch_once(&qword_8CC78, &stru_751C8);
  }
  return (id)qword_8CC70;
}

- (id)_textureAdd
{
  if (qword_8CC88 != -1) {
    dispatch_once(&qword_8CC88, &stru_751E8);
  }
  return (id)qword_8CC80;
}

- (id)_cheapEdgePreserve
{
  if (qword_8CC98 != -1) {
    dispatch_once(&qword_8CC98, &stru_75208);
  }
  return (id)qword_8CC90;
}

- (id)_protectEyesNose
{
  if (qword_8CCA8 != -1) {
    dispatch_once(&qword_8CCA8, &stru_75228);
  }
  return (id)qword_8CCA0;
}

- (id)_eyeBlurV2
{
  if (qword_8CCB8 != -1) {
    dispatch_once(&qword_8CCB8, &stru_75248);
  }
  return (id)qword_8CCB0;
}

- (id)_featherEdge
{
  if (qword_8CCC8 != -1) {
    dispatch_once(&qword_8CCC8, &stru_75268);
  }
  return (id)qword_8CCC0;
}

- (id)maskForLandmarks:(id)a3 withFilterNamed:(id)a4
{
  inputImage = self->super.inputImage;
  CGAffineTransformMakeScale(&v11, 0.25, 0.25);
  v7 = [(CIImage *)inputImage imageByApplyingTransform:&v11];
  CFStringRef v12 = @"inputFaceLandmarks";
  id v13 = a3;
  id result = [(CIImage *)v7 imageByApplyingFilter:a4 withInputParameters:+[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1]];
  if (result)
  {
    id v9 = result;
    CGAffineTransformMakeScale(&v10, 0.25, 0.25);
    return objc_msgSend(objc_msgSend(v9, "imageByApplyingTransform:", &v10), "imageByApplyingFilter:withInputParameters:", @"CISoftCubicUpsample", &off_7DB30);
  }
  return result;
}

- (id)eyeBlurForLandmarks:(id)a3
{
  [(NSNumber *)self->inputEyes floatValue];
  if (!a3 || fabsf(v5) < 1.0e-10) {
    return 0;
  }
  v7 = +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  v8 = +[CIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  id v9 = [LightingFacePoints alloc];
  [(CIImage *)self->super.inputImage extent];
  CGAffineTransform v10 = -[LightingFacePoints initWithFaceLandmarkDictionary:forImageRect:](v9, "initWithFaceLandmarkDictionary:forImageRect:", a3);
  CGAffineTransform v11 = +[CIFilter filterWithName:@"CIGaussianGradient"];
  float v12 = 0.0;
  float v13 = 0.0;
  if ([a3 objectForKeyedSubscript:@"faceJunkinessIndex"])
  {
    objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"faceJunkinessIndex"), "floatValue");
    float v13 = v14;
  }
  if ([a3 objectForKeyedSubscript:@"faceBoundingBox"])
  {
    objc_msgSend(objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"faceBoundingBox"), "objectForKeyedSubscript:", @"w"), "floatValue");
    float v12 = v15;
  }
  if ([a3 objectForKeyedSubscript:@"roll"])
  {
    objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"roll"), "floatValue");
    BOOL v17 = fabsf(v16) < 1.05;
  }
  else
  {
    BOOL v17 = 1;
  }
  v18 = 0;
  if (v13 >= -0.2 || v12 <= 0.15)
  {
    id v19 = 0;
  }
  else
  {
    id v19 = 0;
    if (v17)
    {
      [(LightingFacePoints *)v10 leftEye];
      double v21 = v20;
      double v23 = v22;
      [(LightingFacePoints *)v10 rightEye];
      *(float *)&double v24 = sqrt((v23 - v25) * (v23 - v25) + (v21 - v24) * (v21 - v24));
      *(float *)&double v21 = *(float *)&v24 * 0.4335;
      [(LightingFacePoints *)v10 leftEye];
      [(CIFilter *)v11 setValue:+[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:") forKey:@"inputCenter"];
      LODWORD(v26) = LODWORD(v21);
      [(CIFilter *)v11 setValue:+[NSNumber numberWithFloat:v26] forKey:@"inputRadius"];
      [(CIFilter *)v11 setValue:v8 forKey:@"inputColor0"];
      [(CIFilter *)v11 setValue:v7 forKey:@"inputColor1"];
      v27 = [(CIFilter *)v11 outputImage];
      [(LightingFacePoints *)v10 rightEye];
      [(CIFilter *)v11 setValue:+[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:") forKey:@"inputCenter"];
      CFStringRef v130 = @"inputBackgroundImage";
      v131 = [(CIFilter *)v11 outputImage];
      v18 = [(CIImage *)v27 imageByApplyingFilter:@"CIAdditionCompositing" withInputParameters:+[NSDictionary dictionaryWithObjects:&v131 forKeys:&v130 count:1]];
      v28 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0]);
      [(CIImage *)self->super.inputImage extent];
      v29 = -[CIImage imageByCroppingToRect:](v28, "imageByCroppingToRect:");
      unsigned int v30 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"orientation"), "intValue");
      double v31 = *(double *)[(LightingFacePoints *)v10 leftEyeOutline];
      double v32 = *((double *)[(LightingFacePoints *)v10 leftEyeOutline] + 4);
      double v33 = *((double *)[(LightingFacePoints *)v10 leftEyeOutline] + 3);
      float v34 = v33 - *((double *)[(LightingFacePoints *)v10 leftEyeOutline] + 7);
      float v35 = fabsf(v34) * 1.05;
      double v36 = *(double *)[(LightingFacePoints *)v10 leftEyeOutline];
      float v37 = v36 - *((double *)[(LightingFacePoints *)v10 leftEyeOutline] + 4);
      *(float *)&double v38 = atan2f(v35, v37);
      unsigned int v39 = v30 - 5;
      if (v30 - 5 > 3)
      {
        float v48 = v31 - v32;
        float v42 = fabsf(v48);
        float v47 = *(float *)&v38 + 1.57079633;
      }
      else
      {
        double v40 = *((double *)[(LightingFacePoints *)v10 leftEyeOutline] + 1);
        float v41 = v40 - *((double *)[(LightingFacePoints *)v10 leftEyeOutline] + 5);
        float v42 = fabsf(v41);
        double v43 = *((double *)[(LightingFacePoints *)v10 leftEyeOutline] + 2);
        float v44 = v43 - *((double *)[(LightingFacePoints *)v10 leftEyeOutline] + 6);
        float v35 = fabsf(v44) * 1.05;
        double v45 = *((double *)[(LightingFacePoints *)v10 leftEyeOutline] + 1);
        float v46 = v45 - *((double *)[(LightingFacePoints *)v10 leftEyeOutline] + 5);
        float v47 = atan2f(v35, -v46);
      }
      __float2 v49 = __sincosf_stret(v47);
      double v50 = (float)(v42 * 0.175);
      long double v51 = sin(v47 + v47);
      v52 = +[CIVector vectorWithX:(float)(v49.__cosval * v49.__cosval) / ((v50 + v50) * v50)+ (float)(v49.__sinval * v49.__sinval) / ((v35 + v35) * v35) Y:(double)(v51 / (v35 * 4.0 * v35) - v51 / (v50 * 4.0 * v50)) Z:(float)(v49.__sinval * v49.__sinval) / ((v50 + v50) * v50)+ (float)(v49.__cosval * v49.__cosval) / ((v35 + v35) * v35) W:1.0];
      double v53 = *(double *)[(LightingFacePoints *)v10 rightEyeOutline];
      double v54 = *((double *)[(LightingFacePoints *)v10 rightEyeOutline] + 4);
      double v55 = *((double *)[(LightingFacePoints *)v10 rightEyeOutline] + 3);
      float v56 = v55 - *((double *)[(LightingFacePoints *)v10 rightEyeOutline] + 7);
      float v57 = fabsf(v56) * 1.05;
      double v58 = *(double *)[(LightingFacePoints *)v10 rightEyeOutline];
      float v59 = v58 - *((double *)[(LightingFacePoints *)v10 rightEyeOutline] + 4);
      *(float *)&double v60 = atan2f(v57, -v59);
      if (v39 > 3)
      {
        float v69 = v53 - v54;
        float v63 = fabsf(v69);
        float v68 = *(float *)&v60 + 1.57079633;
      }
      else
      {
        double v61 = *((double *)[(LightingFacePoints *)v10 rightEyeOutline] + 1);
        float v62 = v61 - *((double *)[(LightingFacePoints *)v10 rightEyeOutline] + 5);
        float v63 = fabsf(v62);
        double v64 = *((double *)[(LightingFacePoints *)v10 rightEyeOutline] + 2);
        float v65 = v64 - *((double *)[(LightingFacePoints *)v10 rightEyeOutline] + 6);
        float v57 = fabsf(v65) * 1.05;
        double v66 = *((double *)[(LightingFacePoints *)v10 rightEyeOutline] + 1);
        float v67 = v66 - *((double *)[(LightingFacePoints *)v10 rightEyeOutline] + 5);
        float v68 = atan2f(v57, v67);
      }
      __float2 v70 = __sincosf_stret(v68);
      double v71 = (float)(v63 * 0.175);
      long double v72 = sin(v68 + v68);
      v73 = +[CIVector vectorWithX:(float)(v70.__cosval * v70.__cosval) / ((v71 + v71) * v71)+ (float)(v70.__sinval * v70.__sinval) / ((v57 + v57) * v57) Y:(double)(v72 / (v57 * 4.0 * v57) - v72 / (v71 * 4.0 * v71)) Z:(float)(v70.__sinval * v70.__sinval) / ((v71 + v71) * v71)+ (float)(v70.__cosval * v70.__cosval) / ((v57 + v57) * v57) W:1.0];
      [(LightingFacePoints *)v10 leftEye];
      double v75 = v74;
      [(LightingFacePoints *)v10 leftEye];
      double v77 = v76;
      [(LightingFacePoints *)v10 rightEye];
      double v79 = v78;
      [(LightingFacePoints *)v10 rightEye];
      v81 = +[CIVector vectorWithX:v75 Y:v77 Z:v79 W:v80];
      double v82 = *(double *)[(LightingFacePoints *)v10 leftEyeOutline];
      double v83 = *((double *)[(LightingFacePoints *)v10 leftEyeOutline] + 4);
      double v84 = *((double *)[(LightingFacePoints *)v10 leftEyeOutline] + 3);
      float v85 = v84 - *((double *)[(LightingFacePoints *)v10 leftEyeOutline] + 7);
      float v86 = fabsf(v85) * 1.45;
      double v87 = *(double *)[(LightingFacePoints *)v10 leftEyeOutline];
      float v88 = v87 - *((double *)[(LightingFacePoints *)v10 leftEyeOutline] + 4);
      *(float *)&double v89 = atan2f(v86, v88);
      if (v39 > 3)
      {
        float v98 = v82 - v83;
        float v92 = fabsf(v98);
        float v97 = *(float *)&v89 + 1.57079633;
      }
      else
      {
        double v90 = *((double *)[(LightingFacePoints *)v10 leftEyeOutline] + 1);
        float v91 = v90 - *((double *)[(LightingFacePoints *)v10 leftEyeOutline] + 5);
        float v92 = fabsf(v91);
        double v93 = *((double *)[(LightingFacePoints *)v10 leftEyeOutline] + 2);
        float v94 = v93 - *((double *)[(LightingFacePoints *)v10 leftEyeOutline] + 6);
        float v86 = fabsf(v94) * 1.45;
        double v95 = *((double *)[(LightingFacePoints *)v10 leftEyeOutline] + 1);
        float v96 = v95 - *((double *)[(LightingFacePoints *)v10 leftEyeOutline] + 5);
        float v97 = atan2f(v86, -v96);
      }
      __float2 v99 = __sincosf_stret(v97);
      double v100 = (float)(v92 * 0.45);
      long double v101 = sin(v97 + v97);
      v102 = +[CIVector vectorWithX:(float)(v99.__cosval * v99.__cosval) / ((v100 + v100) * v100)+ (float)(v99.__sinval * v99.__sinval) / ((v86 + v86) * v86) Y:(double)(v101 / (v86 * 4.0 * v86) - v101 / (v100 * 4.0 * v100)) Z:(float)(v99.__sinval * v99.__sinval) / ((v100 + v100) * v100)+ (float)(v99.__cosval * v99.__cosval) / ((v86 + v86) * v86) W:1.0];
      double v103 = *(double *)[(LightingFacePoints *)v10 rightEyeOutline];
      double v104 = *((double *)[(LightingFacePoints *)v10 rightEyeOutline] + 4);
      double v105 = *((double *)[(LightingFacePoints *)v10 rightEyeOutline] + 3);
      float v106 = v105 - *((double *)[(LightingFacePoints *)v10 rightEyeOutline] + 7);
      float v107 = fabsf(v106) * 1.45;
      double v108 = *(double *)[(LightingFacePoints *)v10 rightEyeOutline];
      float v109 = v108 - *((double *)[(LightingFacePoints *)v10 rightEyeOutline] + 4);
      *(float *)&double v110 = atan2f(v107, -v109);
      if (v39 > 3)
      {
        float v119 = v103 - v104;
        float v113 = fabsf(v119);
        float v118 = *(float *)&v110 + 1.57079633;
      }
      else
      {
        double v111 = *((double *)[(LightingFacePoints *)v10 rightEyeOutline] + 1);
        float v112 = v111 - *((double *)[(LightingFacePoints *)v10 rightEyeOutline] + 5);
        float v113 = fabsf(v112);
        double v114 = *((double *)[(LightingFacePoints *)v10 rightEyeOutline] + 2);
        float v115 = v114 - *((double *)[(LightingFacePoints *)v10 rightEyeOutline] + 6);
        float v107 = fabsf(v115) * 1.45;
        double v116 = *((double *)[(LightingFacePoints *)v10 rightEyeOutline] + 1);
        float v117 = v116 - *((double *)[(LightingFacePoints *)v10 rightEyeOutline] + 5);
        float v118 = atan2f(v107, v117);
      }
      __float2 v120 = __sincosf_stret(v118);
      double v121 = (float)(v113 * 0.45);
      long double v122 = sin(v118 + v118);
      v123 = +[CIVector vectorWithX:(float)(v120.__cosval * v120.__cosval) / ((v121 + v121) * v121)+ (float)(v120.__sinval * v120.__sinval) / ((v107 + v107) * v107) Y:(double)(v122 / (v107 * 4.0 * v107) - v122 / (v121 * 4.0 * v121)) Z:(float)(v120.__sinval * v120.__sinval) / ((v121 + v121) * v121)+ (float)(v120.__cosval * v120.__cosval) / ((v107 + v107) * v107) W:1.0];
      id v124 = [(CIPortraitEffectLightV2 *)self _eyeBlurV2];
      [(CIImage *)self->super.inputImage extent];
      v129[0] = v29;
      v129[1] = v81;
      v129[2] = v52;
      v129[3] = v73;
      v129[4] = v102;
      v129[5] = v123;
      id v19 = objc_msgSend(v124, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v129, 6), v125, v126, v127, v128);
    }
  }

  [(CIImage *)v18 extent];
  return objc_msgSend(v19, "imageByCroppingToRect:");
}

- (id)protectEyesNose:(id)a3 withFaceMask:(id)a4 withOrientation:(int)a5
{
  if (!a3) {
    return 0;
  }
  double v9 = *(double *)[a3 leftEyeOutline];
  double v10 = *((double *)[a3 leftEyeOutline] + 4);
  double v11 = *((double *)[a3 leftEyeOutline] + 3);
  float v12 = v11 - *((double *)[a3 leftEyeOutline] + 7);
  float v13 = fabsf(v12) * 1.3;
  double v14 = *(double *)[a3 leftEyeOutline];
  float v15 = v14 - *((double *)[a3 leftEyeOutline] + 4);
  *(float *)&double v16 = atan2f(v13, v15);
  unsigned int v17 = a5 - 5;
  if ((a5 - 5) > 3)
  {
    float v27 = v9 - v10;
    float v20 = fabsf(v27);
    float v25 = *(float *)&v16 + 1.57079633;
  }
  else
  {
    double v18 = *((double *)objc_msgSend(a3, "leftEyeOutline", v16) + 1);
    float v19 = v18 - *((double *)[a3 leftEyeOutline] + 5);
    float v20 = fabsf(v19);
    double v21 = *((double *)[a3 leftEyeOutline] + 2);
    float v22 = v21 - *((double *)[a3 leftEyeOutline] + 6);
    float v13 = fabsf(v22) * 1.3;
    double v23 = *((double *)[a3 leftEyeOutline] + 1);
    float v24 = v23 - *((double *)[a3 leftEyeOutline] + 5);
    float v25 = atan2f(v13, -v24);
  }
  __float2 v28 = __sincosf_stret(v25);
  double v29 = (float)(v20 * 0.3);
  long double v30 = sin(v25 + v25);
  double v31 = +[CIVector vectorWithX:(float)(v28.__sinval * v28.__sinval) / ((v13 + v13) * v13)+ (float)(v28.__cosval * v28.__cosval) / ((v29 + v29) * v29) Y:(double)(v30 / (v13 * 4.0 * v13) - v30 / (v29 * 4.0 * v29)) Z:(float)(v28.__cosval * v28.__cosval) / ((v13 + v13) * v13)+ (float)(v28.__sinval * v28.__sinval) / ((v29 + v29) * v29) W:1.0];
  double v32 = *(double *)[a3 rightEyeOutline];
  double v33 = *((double *)[a3 rightEyeOutline] + 4);
  double v34 = *((double *)[a3 rightEyeOutline] + 3);
  float v35 = v34 - *((double *)[a3 rightEyeOutline] + 7);
  float v36 = fabsf(v35) * 1.3;
  double v37 = *(double *)[a3 rightEyeOutline];
  float v38 = v37 - *((double *)[a3 rightEyeOutline] + 4);
  *(float *)&double v39 = atan2f(v36, -v38);
  if (v17 > 3)
  {
    float v48 = v32 - v33;
    float v42 = fabsf(v48);
    float v47 = *(float *)&v39 + 1.57079633;
  }
  else
  {
    double v40 = *((double *)objc_msgSend(a3, "rightEyeOutline", v39) + 1);
    float v41 = v40 - *((double *)[a3 rightEyeOutline] + 5);
    float v42 = fabsf(v41);
    double v43 = *((double *)[a3 rightEyeOutline] + 2);
    float v44 = v43 - *((double *)[a3 rightEyeOutline] + 6);
    float v36 = fabsf(v44) * 1.3;
    double v45 = *((double *)[a3 rightEyeOutline] + 1);
    float v46 = v45 - *((double *)[a3 rightEyeOutline] + 5);
    float v47 = atan2f(v36, v46);
  }
  float v105 = v42 * 0.3;
  __float2 v49 = __sincosf_stret(v47);
  double v50 = (float)(v49.__cosval * v49.__cosval);
  double v51 = (float)(v49.__sinval * v49.__sinval);
  double v52 = sin(v47 + v47);
  double v53 = +[CIVector vectorWithX:v51 / ((v36 + v36) * v36) + v50 / ((v105 + v105) * v105) Y:v52 / (v36 * 4.0 * v36) - v52 / (v105 * 4.0 * v105) Z:v50 / ((v36 + v36) * v36) + v51 / ((v105 + v105) * v105) W:1.0];
  [a3 leftEye];
  double v55 = v54;
  [a3 leftEye];
  double v57 = v56;
  [a3 rightEye];
  double v59 = v58;
  [a3 rightEye];
  double v61 = +[CIVector vectorWithX:v55 Y:v57 Z:v59 W:v60];
  double v62 = (float)((float)(v42 * 0.3) * 1.25);
  double v63 = (float)(v36 * 1.25);
  double v64 = +[CIVector vectorWithX:v51 / ((v63 + v63) * v63) + v50 / ((v62 + v62) * v62) Y:v52 / (v63 * 4.0 * v63) - v52 / (v62 * 4.0 * v62) Z:v50 / ((v63 + v63) * v63) + v51 / ((v62 + v62) * v62) W:1.0];
  [a3 noseTip];
  double v66 = v65;
  [a3 noseTip];
  float v67 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v66);
  id v68 = [(CIPortraitEffectLightV2 *)self _protectEyesNose];
  [a4 extent];
  v109[0] = a4;
  v109[1] = v61;
  v109[2] = v31;
  v109[3] = v53;
  v109[4] = v67;
  v109[5] = v64;
  id v73 = objc_msgSend(v68, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v109, 6), v69, v70, v71, v72);
  double v74 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]);
  [v73 extent];
  double v75 = -[CIImage imageByCroppingToRect:](v74, "imageByCroppingToRect:");
  [v73 extent];
  double v77 = v76;
  [v73 extent];
  double v79 = v78;
  [v73 extent];
  double v81 = v80;
  [v73 extent];
  double v83 = v81 + v82;
  [v73 extent];
  double v85 = v84;
  [v73 extent];
  double v87 = +[CIVector vectorWithX:v77 Y:v79 Z:v83 W:v85 + v86];
  [v73 extent];
  double v89 = v88;
  [v73 extent];
  double v91 = v90;
  [v73 extent];
  if (v89 >= v91) {
    double v94 = v92;
  }
  else {
    double v94 = v93;
  }
  float v95 = v94 * 0.055;
  id v96 = [(CIPortraitEffectLightV2 *)self _featherEdge];
  [v73 extent];
  double v98 = v97;
  double v100 = v99;
  double v102 = v101;
  double v104 = v103;
  v108[0] = v75;
  v108[1] = v87;
  *(float *)&double v97 = v95;
  v108[2] = +[NSNumber numberWithFloat:v97];
  CFStringRef v106 = @"inputBackgroundImage";
  id v107 = v73;
  return objc_msgSend(objc_msgSend(v96, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v108, 3), v98, v100, v102, v104), "imageByApplyingFilter:withInputParameters:", @"CIMultiplyBlendMode", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1));
}

- (id)faceMaskForLandmarks:(id)a3
{
  return [(CIPortraitEffectLightV2 *)self maskForLandmarks:a3 withFilterNamed:@"CIPortraitFaceMask"];
}

- (id)processSkinIn:(id)a3 withFaceMask:(id)a4
{
  [(NSNumber *)self->inputSmooth floatValue];
  float v8 = v7;
  [(NSNumber *)self->inputLocalContrast floatValue];
  double v10 = fabsf(v8);
  if (v10 >= 1.0e-10 || fabsf(v9) >= 1.0e-10)
  {
    float v55 = v8;
    [a3 extent];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    [(NSNumber *)self->super.inputScale floatValue];
    double v20 = v19;
    double v21 = (float)(v19 * 1.5);
    id v22 = objc_msgSend(objc_msgSend(a3, "imageByClampingToExtent"), "imageByApplyingGaussianBlurWithSigma:", v21);
    v68[0] = a3;
    v68[1] = v22;
    v68[2] = &off_7A1B0;
    id v23 = objc_msgSend(-[CIPortraitEffectLightV2 _textureDiff](self, "_textureDiff"), "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v68, 3), v12, v14, v16, v18);
    id v24 = [v22 imageByApplyingGaussianBlurWithSigma:v21 * 3.0];
    v67[0] = a3;
    v67[1] = v24;
    v67[2] = &off_7A1C0;
    id v25 = objc_msgSend(-[CIPortraitEffectLightV2 _textureDiff](self, "_textureDiff"), "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v67, 3), v12, v14, v16, v18);
    id v26 = objc_msgSend(v24, "imageByCroppingToRect:", v12, v14, v16, v18);
    id v27 = objc_msgSend(v23, "imageByCroppingToRect:", v12, v14, v16, v18);
    id v28 = objc_msgSend(v25, "imageByCroppingToRect:", v12, v14, v16, v18);
    if (v10 >= 1.0e-10)
    {
      CGAffineTransformMakeScale(&v57, 0.25, 0.25);
      id v29 = [v26 imageByApplyingTransform:&v57];
      [a4 extent];
      double v31 = v30;
      [(CIImage *)self->super.inputImage extent];
      float v33 = v31 / v32;
      [a4 extent];
      double v35 = v34;
      [(CIImage *)self->super.inputImage extent];
      float v37 = v35 / v36;
      if (v33 < v37) {
        float v37 = v33;
      }
      double v38 = v37 + v37;
      float v39 = v38;
      double v40 = v39;
      if (v38 >= 1.0) {
        double v41 = 1.0;
      }
      else {
        double v41 = v40;
      }
      id v42 = objc_msgSend(objc_msgSend(v29, "imageByClampingToExtent"), "imageByApplyingGaussianBlurWithSigma:", v20 * 6.0 * v41);
      CGAffineTransformMakeScale(&v56, 4.0, 4.0);
      id v43 = objc_msgSend(objc_msgSend(v42, "imageByApplyingTransform:", &v56), "imageByCroppingToRect:", v12, v14, v16, v18);
      id v44 = [(CIPortraitEffectLightV2 *)self _cheapEdgePreserve];
      v66[0] = a3;
      v66[1] = v43;
      id v26 = objc_msgSend(v44, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v66, 2), v12, v14, v16, v18);
    }
    v64[0] = @"inputAmount";
    double v45 = +[NSNumber numberWithDouble:v20 * 0.2];
    v64[1] = @"inputISO";
    v65[0] = v45;
    v65[1] = &off_7A8A8;
    id v46 = objc_msgSend(v26, "imageByApplyingFilter:withInputParameters:", @"CIPhotoGrain", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v65, v64, 2));
    id v47 = [(CIPortraitEffectLightV2 *)self _textureAdd];
    v63[0] = v46;
    v63[1] = v28;
    v63[2] = &off_79E50;
    id v48 = objc_msgSend(v47, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v63, 3), v12, v14, v16, v18);
    id v49 = [(CIPortraitEffectLightV2 *)self _textureAdd];
    v62[0] = v48;
    v62[1] = v27;
    v62[2] = &off_7A1D0;
    id v50 = objc_msgSend(v49, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v62, 3), v12, v14, v16, v18);
    v60[0] = kCIInputBackgroundImageKey;
    v60[1] = kCIInputMaskImageKey;
    v61[0] = a3;
    v61[1] = a4;
    id v51 = objc_msgSend(v50, "imageByApplyingFilter:withInputParameters:", @"CIBlendWithBlueMask", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v61, v60, 2));
    double v52 = v51;
    *(float *)&double v53 = v55;
    if (v55 >= 1.0)
    {
      return v51;
    }
    else
    {
      v58[0] = @"inputBackgroundImage";
      v58[1] = @"inputAmount";
      v59[0] = a3;
      v59[1] = +[NSNumber numberWithFloat:v53];
      return objc_msgSend(v52, "imageByApplyingFilter:withInputParameters:", @"CIMix", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v59, v58, 2));
    }
  }
  return a3;
}

- (id)processTeethIn:(id)a3 withFaceMask:(id)a4
{
  [(NSNumber *)self->inputTeeth floatValue];
  float v8 = v7;
  [a3 extent];
  double v12 = v11;
  double v14 = v13;
  if (fabsf(v8) >= 1.0e-10)
  {
    double v15 = v9;
    double v16 = v10;
    id v17 = [(CIPortraitEffectLightV2 *)self _whitenTeeth];
    v19[0] = a3;
    v19[1] = a4;
    v19[2] = self->inputTeeth;
    return objc_msgSend(v17, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 3), v12, v14, v15, v16);
  }
  return a3;
}

- (id)skinMaskForLandmarks:(id)a3
{
  return [(CIPortraitEffectLightV2 *)self maskForLandmarks:a3 withFilterNamed:@"CIPortraitSkinMask"];
}

- (id)teethMaskForLandmarks:(id)a3
{
  return [(CIPortraitEffectLightV2 *)self maskForLandmarks:a3 withFilterNamed:@"CIPortraitToothMask"];
}

- (id)processTeethIn:(id)a3 withTeethMask:(id)a4
{
  [(NSNumber *)self->inputTeeth floatValue];
  float v8 = v7;
  [a4 extent];
  double v10 = v9;
  [(CIImage *)self->super.inputImage extent];
  if (v10 != v11)
  {
    [(CIImage *)self->super.inputImage extent];
    float v13 = v12;
    [a4 extent];
    float v15 = v14;
    float v16 = v13 / v15;
    [(CIImage *)self->super.inputImage extent];
    float v18 = v17;
    [a4 extent];
    float v20 = v19;
    CGAffineTransformMakeScale(&v34, v16, (float)(v18 / v20));
    a4 = [a4 imageByApplyingTransform:&v34];
  }
  [a3 extent];
  double v24 = v23;
  double v26 = v25;
  if (fabsf(v8) >= 1.0e-10)
  {
    double v27 = v21;
    double v28 = v22;
    id v29 = [(CIPortraitEffectLightV2 *)self _whitenTeeth];
    double y = CGRectInfinite.origin.y;
    double width = CGRectInfinite.size.width;
    double height = CGRectInfinite.size.height;
    v35[0] = a3;
    v35[1] = a4;
    v35[2] = self->inputTeeth;
    return objc_msgSend(objc_msgSend(objc_msgSend(v29, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 3), CGRectInfinite.origin.x, y, width, height), "imageByCroppingToRect:", v24, v26, v27, v28), "imageByInsertingIntermediate:", 0);
  }
  return a3;
}

- (id)processEyesIn:(id)a3 withEyeBlur:(id)a4 landmarks:(id)a5
{
  if (!a4) {
    sub_4C124();
  }
  [(NSNumber *)self->inputEyes floatValue];
  float v10 = v9;
  [a4 extent];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  id v19 = objc_msgSend(objc_msgSend(a3, "imageByCroppingToRect:"), "_imageByRenderingToIntermediate");
  id v20 = [(CIPortraitEffectLightV2 *)self _eyeBrightenV2];
  v38[0] = v19;
  v38[1] = a4;
  v38[2] = self->inputEyes;
  id v21 = objc_msgSend(v20, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 3), v12, v14, v16, v18);
  id v22 = [(CIPortraitEffectLightV2 *)self _eyeBrightenSoftlight];
  v37[0] = v21;
  v37[1] = a4;
  [(NSNumber *)self->inputEyes floatValue];
  v37[2] = +[NSNumber numberWithDouble:v23 * 0.6];
  id v24 = objc_msgSend(v22, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 3), v12, v14, v16, v18);
  id v25 = [(CIPortraitEffectLightV2 *)self eyeBlurForLandmarks:a5];
  v35[0] = kCIInputBackgroundImageKey;
  v35[1] = kCIInputMaskImageKey;
  v36[0] = v19;
  v36[1] = v25;
  id v26 = objc_msgSend(v24, "imageByApplyingFilter:withInputParameters:", @"CIBlendWithRedMask", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 2));
  double v27 = v10 * 1.2;
  *(float *)&double v27 = v27;
  float v28 = v10 * 2.19;
  v33[0] = @"inputSharpness";
  v33[1] = @"inputRadius";
  v34[0] = +[NSNumber numberWithFloat:v27];
  *(float *)&double v29 = v28;
  v34[1] = +[NSNumber numberWithFloat:v29];
  v31[0] = kCIInputBackgroundImageKey;
  v31[1] = kCIInputMaskImageKey;
  v32[0] = v26;
  v32[1] = v25;
  return objc_msgSend(objc_msgSend(objc_msgSend(v26, "imageByApplyingFilter:withInputParameters:", @"CISharpenLuminance", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 2)), "imageByApplyingFilter:withInputParameters:", @"CIBlendWithBlueMask", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 2)),
           "imageByCompositingOverImage:",
           a3);
}

- (id)imageForLandmarks:(id)a3
{
  if (!self->super.inputImage) {
    return 0;
  }
  id v5 = -[CIPortraitEffectLightV2 eyeBlurForLandmarks:](self, "eyeBlurForLandmarks:");
  id v6 = v5;
  if (v5)
  {
    [v5 extent];
    CGFloat x = v7;
    CGFloat y = v9;
    CGFloat width = v11;
    CGFloat height = v13;
  }
  else
  {
    CGFloat x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
  }
  if (self->super.inputFaceMask)
  {
    double v78 = height;
    double v15 = [LightingFacePoints alloc];
    [(CIImage *)self->super.inputImage extent];
    double v16 = -[LightingFacePoints initWithFaceLandmarkDictionary:forImageRect:](v15, "initWithFaceLandmarkDictionary:forImageRect:", a3);
    [(LightingFacePoints *)v16 faceRect];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    id v25 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"orientation"), "intValue");
    memset(&v84, 0, sizeof(v84));
    [(CIImage *)self->super.inputFaceMask extent];
    sub_1DC78((int)v25, &v84, v26, v27, v28);
    CGAffineTransform v82 = v84;
    memset(&v83, 0, sizeof(v83));
    CGAffineTransformInvert(&v83, &v82);
    CGAffineTransform v81 = v84;
    v87.origin.CGFloat x = v18;
    v87.origin.CGFloat y = v20;
    v87.size.CGFloat width = v22;
    v87.size.CGFloat height = v24;
    CGRect v88 = CGRectApplyAffineTransform(v87, &v81);
    CGRect v89 = CGRectInset(v88, 0.0, v88.size.height * -0.6);
    CGFloat v29 = v89.origin.x;
    CGFloat v30 = v89.origin.y;
    CGFloat v31 = v89.size.width;
    CGFloat v32 = v89.size.height;
    CGRect v97 = CGRectOffset(v89, 0.0, v89.size.height * -0.333);
    v90.origin.CGFloat x = v29;
    v90.origin.CGFloat y = v30;
    v90.size.CGFloat width = v31;
    v90.size.CGFloat height = v32;
    CGRect v91 = CGRectUnion(v90, v97);
    CGAffineTransform v80 = v83;
    CGRect v92 = CGRectApplyAffineTransform(v91, &v80);
    CGFloat v33 = v92.origin.x;
    CGFloat v34 = v92.origin.y;
    CGFloat v35 = v92.size.width;
    CGFloat v36 = v92.size.height;
    [(CIImage *)self->super.inputImage extent];
    v98.origin.CGFloat x = v37;
    v98.origin.CGFloat y = v38;
    v98.size.CGFloat width = v39;
    v98.size.CGFloat height = v40;
    v93.origin.CGFloat x = v33;
    v93.origin.CGFloat y = v34;
    v93.size.CGFloat width = v35;
    v93.size.CGFloat height = v36;
    CGRect v94 = CGRectIntersection(v93, v98);
    double v41 = v94.origin.x;
    double v42 = v94.origin.y;
    double v43 = v94.size.width;
    double v44 = v94.size.height;
    [(CIImage *)self->super.inputFaceMask extent];
    double v46 = v45;
    [(CIImage *)self->super.inputImage extent];
    if (v46 == v47)
    {
      inputFaceMask = self->super.inputFaceMask;
    }
    else
    {
      [(CIImage *)self->super.inputImage extent];
      float v49 = v48;
      [(CIImage *)self->super.inputFaceMask extent];
      float v51 = v50;
      float v77 = v49 / v51;
      [(CIImage *)self->super.inputImage extent];
      double v52 = v44;
      double v53 = v43;
      double v54 = v42;
      double v55 = v41;
      double v56 = width;
      double v57 = y;
      double v58 = x;
      float v60 = v59;
      [(CIImage *)self->super.inputFaceMask extent];
      float v62 = v61;
      float v63 = v60 / v62;
      CGFloat x = v58;
      CGFloat y = v57;
      CGFloat width = v56;
      double v41 = v55;
      double v42 = v54;
      double v43 = v53;
      double v44 = v52;
      double v64 = self->super.inputFaceMask;
      CGAffineTransformMakeScale(&v79, v77, v63);
      inputFaceMask = [(CIImage *)v64 imageByApplyingTransform:&v79];
    }
    id v66 = -[CIPortraitEffectLightV2 protectEyesNose:withFaceMask:withOrientation:](self, "protectEyesNose:withFaceMask:withOrientation:", v16, -[CIImage imageByCroppingToRect:](inputFaceMask, "imageByCroppingToRect:", v41, v42, v43, v44), v25);

    CGFloat height = v78;
    if (v66) {
      goto LABEL_13;
    }
    return 0;
  }
  id v66 = [(CIPortraitEffectLightV2 *)self faceMaskForLandmarks:a3];
  if (!v66) {
    return 0;
  }
LABEL_13:
  [v66 extent];
  v99.origin.CGFloat x = x;
  v99.origin.CGFloat y = y;
  v99.size.CGFloat width = width;
  v99.size.CGFloat height = height;
  CGRect v96 = CGRectUnion(v95, v99);
  double v69 = v96.origin.x;
  double v70 = v96.origin.y;
  double v71 = v96.size.width;
  double v72 = v96.size.height;
  id v73 = objc_msgSend(objc_msgSend(v66, "imageByClampingToExtent"), "imageByCroppingToRect:", v96.origin.x, v96.origin.y, v96.size.width, v96.size.height);
  double v74 = -[CIImage imageByCroppingToRect:](self->super.inputImage, "imageByCroppingToRect:", v69, v70, v71, v72);
  id v67 = [(CIPortraitEffectLightV2 *)self processSkinIn:v74 withFaceMask:v73];
  if (!self->super.inputFaceMask) {
    id v67 = [(CIPortraitEffectLightV2 *)self processTeethIn:v67 withFaceMask:v73];
  }
  if (self->super.inputTeethMask) {
    id v67 = -[CIPortraitEffectLightV2 processTeethIn:withTeethMask:](self, "processTeethIn:withTeethMask:", v67);
  }
  if (v67)
  {
    if (v6) {
      id v67 = [(CIPortraitEffectLightV2 *)self processEyesIn:v67 withEyeBlur:v6 landmarks:a3];
    }
    [(NSNumber *)self->super.inputStrength floatValue];
    if (v75 < 1.0)
    {
      v85[0] = @"inputBackgroundImage";
      v85[1] = @"inputAmount";
      inputStrength = self->super.inputStrength;
      v86[0] = v74;
      v86[1] = inputStrength;
      return objc_msgSend(v67, "imageByApplyingFilter:withInputParameters:", @"CIMix", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v86, v85, 2));
    }
  }
  return v67;
}

- (id)enrichImage:(id)a3
{
  [(NSNumber *)self->inputEnrich floatValue];
  if (fabsf(v5) >= 1.0e-10)
  {
    id v6 = [(CIPortraitEffectLightV2 *)self _enrichV2];
    double v7 = +[CIVector vectorWithX:0.0799999982 Y:0.400249988 Z:0.0 W:0.548565447];
    [a3 extent];
    inputEnrich = self->inputEnrich;
    v14[0] = a3;
    v14[1] = inputEnrich;
    v14[2] = v7;
    return objc_msgSend(v6, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 3), v9, v10, v11, v12);
  }
  return a3;
}

- (id)outputImage
{
  inputImage = self->super.inputImage;
  if (!inputImage) {
    return 0;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  inputFaceLandmarkArraCGFloat y = self->super.inputFaceLandmarkArray;
  id v5 = [(NSArray *)inputFaceLandmarkArray countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(inputFaceLandmarkArray);
        }
        double v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        float v10 = 0.0;
        float v11 = 0.0;
        if ([v9 objectForKeyedSubscript:@"faceJunkinessIndex"])
        {
          objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", @"faceJunkinessIndex"), "floatValue");
          float v11 = v12;
        }
        if ([v9 objectForKeyedSubscript:@"faceBoundingBox"])
        {
          objc_msgSend(objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", @"faceBoundingBox"), "objectForKeyedSubscript:", @"w"), "floatValue");
          float v10 = v13;
        }
        if ([v9 objectForKeyedSubscript:@"roll"])
        {
          objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", @"roll"), "floatValue");
          float v15 = fabsf(v14);
        }
        else
        {
          float v15 = 0.0;
        }
        if (v11 < -0.2 && v10 > 0.15 && v15 < 1.05)
        {
          id v16 = [(CIPortraitEffectLightV2 *)self imageForLandmarks:v9];
          if (v16) {
            inputImage = (CIImage *)[v16 imageByCompositingOverImage:inputImage];
          }
        }
      }
      id v6 = [(NSArray *)inputFaceLandmarkArray countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  return [(CIPortraitEffectLightV2 *)self enrichImage:inputImage];
}

- (NSNumber)inputSmooth
{
  return self->inputSmooth;
}

- (void)setInputSmooth:(id)a3
{
}

- (NSNumber)inputEnrich
{
  return self->inputEnrich;
}

- (void)setInputEnrich:(id)a3
{
}

- (NSNumber)inputTeeth
{
  return self->inputTeeth;
}

- (void)setInputTeeth:(id)a3
{
}

- (NSNumber)inputEyes
{
  return self->inputEyes;
}

- (void)setInputEyes:(id)a3
{
}

- (NSNumber)inputLocalContrast
{
  return self->inputLocalContrast;
}

- (void)setInputLocalContrast:(id)a3
{
}

@end