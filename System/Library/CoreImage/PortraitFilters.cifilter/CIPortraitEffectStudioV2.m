@interface CIPortraitEffectStudioV2
+ (id)customAttributes;
- (NSNumber)inputDepthThreshold;
- (NSNumber)inputFaceLight;
- (NSNumber)inputKickLight;
- (id)_applyFaceProtectStudio;
- (id)_faceVignetteStudio;
- (id)_prepareDepth;
- (id)backgroundPreviewCubeName;
- (id)outputImage;
- (id)previewCubeName;
- (void)setDefaults;
- (void)setInputDepthThreshold:(id)a3;
- (void)setInputFaceLight:(id)a3;
- (void)setInputKickLight:(id)a3;
@end

@implementation CIPortraitEffectStudioV2

+ (id)customAttributes
{
  v8[0] = kCIAttributeFilterCategories;
  v7[0] = kCICategoryColorEffect;
  v7[1] = kCICategoryVideo;
  v7[2] = kCICategoryInterlaced;
  v7[3] = kCICategoryNonSquarePixels;
  v7[4] = kCICategoryStillImage;
  v7[5] = kCICategoryBuiltIn;
  v7[6] = kCICategoryApplePrivate;
  v9[0] = +[NSArray arrayWithObjects:v7 count:7];
  v9[1] = @"10";
  v8[1] = kCIAttributeFilterAvailable_iOS;
  v8[2] = kCIAttributeFilterAvailable_Mac;
  v9[2] = @"10.11";
  v8[3] = @"inputKickLight";
  v5[0] = kCIAttributeMin;
  v5[1] = kCIAttributeSliderMin;
  v6[0] = &off_7A150;
  v6[1] = &off_7A150;
  v5[2] = kCIAttributeSliderMax;
  v5[3] = kCIAttributeDefault;
  v6[2] = &off_7A0F0;
  v6[3] = &off_7A110;
  v5[4] = kCIAttributeIdentity;
  v5[5] = kCIAttributeType;
  v6[4] = &off_7A120;
  v6[5] = kCIAttributeTypeScalar;
  v9[3] = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:6];
  v8[4] = @"inputFaceLight";
  v3[0] = kCIAttributeMin;
  v3[1] = kCIAttributeSliderMin;
  v4[0] = &off_7A150;
  v4[1] = &off_7A150;
  v3[2] = kCIAttributeSliderMax;
  v3[3] = kCIAttributeDefault;
  v4[2] = &off_7A0F0;
  v4[3] = &off_79E50;
  v3[4] = kCIAttributeIdentity;
  v3[5] = kCIAttributeType;
  v4[4] = &off_7A120;
  v4[5] = kCIAttributeTypeScalar;
  v9[4] = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:6];
  return +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (void)setDefaults
{
  [(CIPortraitEffectLightV2 *)self setInputSmooth:&off_7A180];
  [(CIPortraitEffectLightV2 *)self setInputEnrich:&off_7A160];
  [(CIPortraitEffectLightV2 *)self setInputLocalContrast:&off_7A1A0];
  [(CIPortraitEffectStudioV2 *)self setInputKickLight:&off_7A1D0];
  [(CIPortraitEffectStudioV2 *)self setInputFaceLight:&off_79E50];
  [(CIPortraitEffectV2 *)self setInputStrength:&off_7A170];
  [(CIPortraitEffectStudioV2 *)self setInputDepthThreshold:&off_7A160];
  [(CIPortraitEffectLightV2 *)self setInputEyes:&off_79DE0];
  [(CIPortraitEffectV2 *)self setInputScale:&off_7A110];
  [(CIPortraitEffectLightV2 *)self setInputTeeth:&off_7A1B0];
  [(CIPortraitEffectV2 *)self setInputRenderProxy:&off_7A140];

  [(CIPortraitEffectV2 *)self setInputGenerateSpillMatte:&off_7A140];
}

- (id)previewCubeName
{
  return @"CIStudioPreview";
}

- (id)backgroundPreviewCubeName
{
  return 0;
}

- (id)_prepareDepth
{
  if (qword_8CCD8 != -1) {
    dispatch_once(&qword_8CCD8, &stru_75288);
  }
  return (id)qword_8CCD0;
}

- (id)_faceVignetteStudio
{
  if (qword_8CCE8 != -1) {
    dispatch_once(&qword_8CCE8, &stru_752A8);
  }
  return (id)qword_8CCE0;
}

- (id)_applyFaceProtectStudio
{
  if (qword_8CCF8 != -1) {
    dispatch_once(&qword_8CCF8, &stru_752C8);
  }
  return (id)qword_8CCF0;
}

- (id)outputImage
{
  v2 = self;
  id result = self->super.super.inputImage;
  if (!result) {
    return result;
  }
  [result extent];
  double v221 = v5;
  double v222 = v4;
  double v226 = v6;
  double v220 = v7;
  v238.receiver = v2;
  v238.super_class = (Class)CIPortraitEffectStudioV2;
  id v8 = [(CIPortraitEffectLightV2 *)&v238 getDraftMode:&off_7A8C0];
  [(NSNumber *)v2->super.super.inputRenderProxy floatValue];
  float v10 = v9;
  if ((int)[v8 intValue] > 0 || v10 > 0.0)
  {
    id inputImage = v2->super.super.inputImage;
  }
  else
  {
    v237.receiver = v2;
    v237.super_class = (Class)CIPortraitEffectStudioV2;
    id inputImage = [(CIPortraitEffectLightV2 *)&v237 outputImage];
  }
  id v12 = objc_msgSend(objc_msgSend(objc_msgSend(inputImage, "imageByApplyingFilter:withInputParameters:", @"CISmartToneFilter", &off_7DB58), "imageByApplyingFilter:withInputParameters:", @"CIHighKey", &off_7DB80), "imageByApplyingFilter:withInputParameters:", @"CIVibrance", &off_7DBA8);
  v13 = +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  v14 = +[CIImage imageWithColor:v13];
  [(CIImage *)v2->super.super.inputImage extent];
  v228 = -[CIImage imageByCroppingToRect:](v14, "imageByCroppingToRect:");
  v15 = +[CIImage imageWithColor:v13];
  [(CIImage *)v2->super.super.inputImage extent];
  v227 = -[CIImage imageByCroppingToRect:](v15, "imageByCroppingToRect:");
  inputFaceLandmarkArray = v2->super.super.inputFaceLandmarkArray;
  if (inputFaceLandmarkArray)
  {
    long long v235 = 0u;
    long long v236 = 0u;
    long long v233 = 0u;
    long long v234 = 0u;
    id v17 = [(NSArray *)inputFaceLandmarkArray countByEnumeratingWithState:&v233 objects:v263 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v234;
      uint64_t v217 = *(void *)v234;
      v218 = inputFaceLandmarkArray;
      v219 = v2;
      do
      {
        v20 = 0;
        id v223 = v18;
        do
        {
          if (*(void *)v234 != v19) {
            objc_enumerationMutation(inputFaceLandmarkArray);
          }
          v21 = *(void **)(*((void *)&v233 + 1) + 8 * (void)v20);
          float v22 = 0.0;
          float v23 = 0.0;
          if ([v21 objectForKeyedSubscript:@"faceJunkinessIndex"])
          {
            objc_msgSend(objc_msgSend(v21, "objectForKeyedSubscript:", @"faceJunkinessIndex"), "floatValue");
            float v23 = v24;
          }
          if ([v21 objectForKeyedSubscript:@"faceBoundingBox"])
          {
            objc_msgSend(objc_msgSend(objc_msgSend(v21, "objectForKeyedSubscript:", @"faceBoundingBox"), "objectForKeyedSubscript:", @"w"), "floatValue");
            float v22 = v25;
          }
          if ([v21 objectForKeyedSubscript:@"roll"])
          {
            objc_msgSend(objc_msgSend(v21, "objectForKeyedSubscript:", @"roll"), "floatValue");
            float v27 = fabsf(v26);
          }
          else
          {
            float v27 = 0.0;
          }
          if (v23 < -0.2 && v22 > 0.15 && v27 < 1.05)
          {
            v28 = -[LightingFacePoints initWithFaceLandmarkDictionary:forImageRect:]([LightingFacePoints alloc], "initWithFaceLandmarkDictionary:forImageRect:", v21, v222, v221, v226, v220);
            id v29 = [v21 objectForKeyedSubscript:@"orientation"];
            [(LightingFacePoints *)v28 centerNose];
            double v31 = v30;
            [(LightingFacePoints *)v28 centerNose];
            double v33 = v32;
            [(LightingFacePoints *)v28 faceWidth];
            float v35 = v34 * 0.4;
            [(LightingFacePoints *)v28 faceHeight];
            float v37 = v36 * 0.3;
            v230 = v29;
            if ([v29 intValue] == 6
              || (unsigned int v38 = [v29 intValue], v39 = 0.0, v38 == 8))
            {
              float v40 = v35;
              float v39 = 1.5708;
            }
            else
            {
              float v40 = v37;
              float v37 = v35;
            }
            float v229 = v39;
            float v41 = v31;
            float v42 = v33;
            float v224 = v42;
            float v225 = v41;
            __float2 v43 = __sincosf_stret(v39);
            double v44 = (float)(v43.__cosval * v43.__cosval);
            double v45 = (float)(v43.__sinval * v43.__sinval);
            double v46 = sin(v229 + v229);
            v47 = +[CIVector vectorWithX:v44 / ((v37 + v37) * v37) + v45 / ((v40 + v40) * v40) Y:v46 / (v40 * 4.0 * v40) - v46 / (v37 * 4.0 * v37) Z:v45 / ((v37 + v37) * v37) + v44 / ((v40 + v40) * v40) W:0.7];
            v48 = +[CIVector vectorWithX:v225 Y:v224];
            id v49 = [(CIPortraitEffectStudioV2 *)v2 _faceVignetteStudio];
            [(CIImage *)v2->super.super.inputImage extent];
            v262[0] = v228;
            v262[1] = v48;
            v262[2] = v47;
            v228 = (CIImage *)objc_msgSend(v49, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v262, 3), v50, v51, v52, v53);
            [(LightingFacePoints *)v28 faceWidth];
            float v55 = v54 / v226;
            double v56 = v55;
            float v57 = fmin(v55 * 1.05, 1.0);
            [(LightingFacePoints *)v28 centerNose];
            float v59 = v58;
            [(LightingFacePoints *)v28 centerNose];
            float v61 = v60;
            [(LightingFacePoints *)v28 faceWidth];
            float v63 = v62 * 0.35;
            [(LightingFacePoints *)v28 faceHeight];
            float v65 = v64 * 3.5 * v57;
            double v66 = (v63 + v63) * v63;
            double v67 = v65;
            double v68 = (v67 + v67) * v67;
            double v69 = v44 / v66 + v45 / v68;
            double v70 = v44 / v68;
            int v71 = LODWORD(v229);
            v72 = +[CIVector vectorWithX:v69 Y:v46 / (v67 * 4.0 * v67) - v46 / (v63 * 4.0 * v63) Z:v45 / v66 + v70 W:0.7];
            v73 = +[CIVector vectorWithX:v59 Y:v61];
            [(CIImage *)v2->super.super.inputImage extent];
            v261[0] = v227;
            v261[1] = v73;
            v261[2] = v72;
            v227 = (CIImage *)objc_msgSend(v49, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v261, 3), v74, v75, v76, v77);
            v78 = [(LightingFacePoints *)v28 leftKickLights];
            v79 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *v78, v78[1]);
            v80 = [(LightingFacePoints *)v28 leftKickLights];
            v81 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v80[1].x, v80[1].y);
            v82 = [(LightingFacePoints *)v28 leftKickLights];
            v83 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v82[2].x, v82[2].y);
            v84 = [(LightingFacePoints *)v28 rightKickLights];
            v85 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *v84, v84[1]);
            v86 = [(LightingFacePoints *)v28 rightKickLights];
            v87 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v86[1].x, v86[1].y);
            v88 = v2;
            v89 = [(LightingFacePoints *)v28 rightKickLights];
            v90 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v89[2].x, v89[2].y);
            [(NSNumber *)v88->super.super.inputScale floatValue];
            v259[0] = @"inputImage";
            v259[1] = @"inputPt1";
            float v92 = fmin(v56 + v56, 1.0) * v91;
            v260[0] = v12;
            v260[1] = v79;
            v259[2] = @"inputPt2";
            v259[3] = @"inputPt3";
            v260[2] = v81;
            v260[3] = v83;
            v259[4] = @"inputPt4";
            v259[5] = @"inputPt5";
            v260[4] = v85;
            v260[5] = v87;
            v260[6] = v90;
            v259[6] = @"inputPt6";
            v259[7] = @"inputWidth";
            v260[7] = +[NSNumber numberWithDouble:v92 * 50.0];
            v260[8] = &off_7A1F0;
            v259[8] = @"inputRotate";
            v259[9] = @"inputOrientation";
            v259[10] = @"inputStrength";
            inputKickLight = v88->inputKickLight;
            v260[9] = v230;
            v260[10] = inputKickLight;
            id v94 = objc_msgSend(v12, "imageByApplyingFilter:withInputParameters:", @"CIPortraitLightingSide", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v260, v259, 11));
            [(LightingFacePoints *)v28 centerNose];
            v95 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:");
            [(LightingFacePoints *)v28 bottomShadow];
            v96 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:");
            [(LightingFacePoints *)v28 bottomShadow];
            v97 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:");
            v257[0] = @"inputImage";
            v257[1] = @"inputCenter1";
            v258[0] = v94;
            v258[1] = v95;
            v257[2] = @"inputBottom1";
            v257[3] = @"inputCenter2";
            v258[2] = v96;
            v258[3] = v97;
            v257[4] = @"inputHeight1";
            [(LightingFacePoints *)v28 faceHeight];
            v258[4] = +[NSNumber numberWithDouble:v98 * 0.75];
            v257[5] = @"inputWidth1";
            [(LightingFacePoints *)v28 faceWidth];
            v258[5] = +[NSNumber numberWithDouble:v99 * 0.45];
            v257[6] = @"inputHeight2";
            [(LightingFacePoints *)v28 faceHeight];
            v258[6] = +[NSNumber numberWithDouble:v100 * 0.55];
            v257[7] = @"inputWidth2";
            [(LightingFacePoints *)v28 faceWidth];
            v258[7] = +[NSNumber numberWithDouble:v101 * 0.55];
            v258[8] = &off_7A1F0;
            v257[8] = @"inputRotate2";
            v257[9] = @"inputContrast";
            v258[9] = &off_7A120;
            v258[10] = &off_7A110;
            v257[10] = @"inputBrighten";
            v257[11] = @"inputStrength";
            [(NSNumber *)v88->inputFaceLight floatValue];
            v258[11] = +[NSNumber numberWithDouble:v102 * 0.9];
            id v103 = objc_msgSend(v94, "imageByApplyingFilter:withInputParameters:", @"CIPortraitLightingFront", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v258, v257, 12));
            if ([v230 intValue] == 6 || objc_msgSend(v230, "intValue") == 8) {
              int v71 = 1070141403;
            }
            [(LightingFacePoints *)v28 centerNose];
            double v105 = v104;
            [(LightingFacePoints *)v28 centerNose];
            double v107 = v106;
            [(LightingFacePoints *)v28 centerChin];
            double v109 = v108;
            [(LightingFacePoints *)v28 centerChin];
            v111 = +[CIVector vectorWithX:v105 Y:v107 Z:v109 W:v110];
            v255[0] = @"inputImage";
            v255[1] = @"inputCenter";
            v256[0] = v103;
            v256[1] = v111;
            v256[2] = &off_7A200;
            v255[2] = @"inputStrength";
            v255[3] = @"inputRotate";
            LODWORD(v112) = v71;
            v256[3] = +[NSNumber numberWithFloat:v112];
            v255[4] = @"inputWidth";
            [(LightingFacePoints *)v28 faceWidth];
            v256[4] = +[NSNumber numberWithDouble:v113 * 0.275];
            v255[5] = @"inputHeight";
            [(LightingFacePoints *)v28 faceHeight];
            v256[5] = +[NSNumber numberWithDouble:v114 * 0.45];
            id v115 = objc_msgSend(v103, "imageByApplyingFilter:withInputParameters:", @"CIPortraitLightingSpot", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v256, v255, 6));
            v116 = [(LightingFacePoints *)v28 leftNose];
            v117 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *v116, v116[1]);
            v118 = [(LightingFacePoints *)v28 leftNose];
            v119 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v118[1].x, v118[1].y);
            v120 = [(LightingFacePoints *)v28 leftNose];
            v121 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v120[2].x, v120[2].y);
            v122 = [(LightingFacePoints *)v28 rightNose];
            v123 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *v122, v122[1]);
            v124 = [(LightingFacePoints *)v28 rightNose];
            v125 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v124[1].x, v124[1].y);
            v126 = [(LightingFacePoints *)v28 rightNose];
            v127 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v126[2].x, v126[2].y);
            v253[0] = @"inputImage";
            v253[1] = @"inputPt1";
            v254[0] = v115;
            v254[1] = v117;
            v253[2] = @"inputPt2";
            v253[3] = @"inputPt3";
            v254[2] = v119;
            v254[3] = v121;
            v253[4] = @"inputPt4";
            v253[5] = @"inputPt5";
            v254[4] = v123;
            v254[5] = v125;
            v254[6] = v127;
            v253[6] = @"inputPt6";
            v253[7] = @"inputWidth";
            *(float *)&double v128 = v92 * 40.0;
            v254[7] = +[NSNumber numberWithFloat:v128];
            v254[8] = &off_7A1F0;
            v253[8] = @"inputRotate";
            v253[9] = @"inputOrientation";
            v253[10] = @"inputStrength";
            v254[9] = v230;
            v254[10] = &off_7A210;
            id v129 = objc_msgSend(v115, "imageByApplyingFilter:withInputParameters:", @"CIPortraitLightingSide", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v254, v253, 11));
            [(LightingFacePoints *)v28 centerChin];
            double v131 = v130;
            [(LightingFacePoints *)v28 centerChin];
            double v133 = v132;
            [(LightingFacePoints *)v28 centerChin];
            double v135 = v134;
            [(LightingFacePoints *)v28 centerChin];
            v137 = +[CIVector vectorWithX:v131 Y:v133 Z:v135 W:v136];
            v251[0] = @"inputImage";
            v251[1] = @"inputCenter";
            v252[0] = v129;
            v252[1] = v137;
            v252[2] = &off_7A220;
            v251[2] = @"inputStrength";
            v251[3] = @"inputRotate";
            LODWORD(v138) = v71;
            v252[3] = +[NSNumber numberWithFloat:v138];
            v252[4] = &off_7A110;
            v251[4] = @"inputDarken";
            v251[5] = @"inputWidth";
            [(LightingFacePoints *)v28 faceWidth];
            v252[5] = +[NSNumber numberWithDouble:v139 * 0.035];
            v251[6] = @"inputHeight";
            [(LightingFacePoints *)v28 faceWidth];
            v252[6] = +[NSNumber numberWithDouble:v140 * 0.035];
            id v141 = objc_msgSend(v129, "imageByApplyingFilter:withInputParameters:", @"CIPortraitLightingSpot", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v252, v251, 7));
            v142 = [(LightingFacePoints *)v28 noseStrobe];
            v143 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *v142, v142[1]);
            v144 = [(LightingFacePoints *)v28 noseStrobe];
            v145 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v144[1].x, v144[1].y);
            v249[0] = @"inputImage";
            v249[1] = @"inputCenter1";
            v250[0] = v141;
            v250[1] = v143;
            v250[2] = v145;
            v249[2] = @"inputCenter2";
            v249[3] = @"inputWidth";
            *(float *)&double v146 = v92 * 45.0;
            v250[3] = +[NSNumber numberWithFloat:v146];
            v250[4] = &off_7A1F0;
            v249[4] = @"inputRotate";
            v249[5] = @"inputOrientation";
            v250[5] = v230;
            v249[6] = @"inputStrength";
            [(NSNumber *)[(CIPortraitEffectV2 *)v219 inputStrength] floatValue];
            v250[6] = +[NSNumber numberWithDouble:v147 * 1.2];
            id v148 = objc_msgSend(v141, "imageByApplyingFilter:withInputParameters:", @"CIPortraitLightingStrobeV2", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v250, v249, 7));
            [(LightingFacePoints *)v28 centerNose];
            double v150 = v149;
            [(LightingFacePoints *)v28 centerNose];
            double v152 = v151;
            [(LightingFacePoints *)v28 centerChin];
            double v154 = v153;
            [(LightingFacePoints *)v28 centerChin];
            v156 = +[CIVector vectorWithX:v150 Y:v152 Z:v154 W:v155];
            [(LightingFacePoints *)v28 leftEye];
            double v158 = v157;
            [(LightingFacePoints *)v28 leftEye];
            double v160 = v159;
            [(LightingFacePoints *)v28 rightEye];
            double v162 = v161;
            [(LightingFacePoints *)v28 rightEye];
            v164 = +[CIVector vectorWithX:v158 Y:v160 Z:v162 W:v163];
            v247[0] = @"inputImage";
            v247[1] = @"inputCenter";
            v248[0] = v148;
            v248[1] = v156;
            v247[2] = @"inputEyes";
            v247[3] = @"inputStrength";
            v248[2] = v164;
            v248[3] = &off_79D40;
            v247[4] = @"inputRotate";
            v2 = v219;
            LODWORD(v165) = v71;
            v248[4] = +[NSNumber numberWithFloat:v165];
            v247[5] = @"inputScale";
            *(float *)&double v166 = v92;
            v248[5] = +[NSNumber numberWithFloat:v166];
            v247[6] = @"inputWidth";
            [(LightingFacePoints *)v28 faceWidth];
            v248[6] = +[NSNumber numberWithDouble:v167 * 0.4];
            v247[7] = @"inputHeight";
            [(LightingFacePoints *)v28 faceHeight];
            v248[7] = +[NSNumber numberWithDouble:v168 * 0.35];
            id v12 = objc_msgSend(v148, "imageByApplyingFilter:withInputParameters:", @"CIPortraitLightingStudio", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v248, v247, 8));

            uint64_t v19 = v217;
            inputFaceLandmarkArray = v218;
            id v18 = v223;
          }
          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v18 = [(NSArray *)inputFaceLandmarkArray countByEnumeratingWithState:&v233 objects:v263 count:16];
      }
      while (v18);
    }
  }
  id v169 = [(CIPortraitEffectStudioV2 *)v2 _applyFaceProtectStudio];
  id v170 = objc_msgSend(objc_msgSend(objc_msgSend(v12, "imageByApplyingFilter:withInputParameters:", @"CIHighKey", &off_7DBD0), "imageByApplyingFilter:withInputParameters:", @"CIExposureAdjust", &off_7DBF8), "imageByApplyingFilter:withInputParameters:", @"CISmartToneFilter", &off_7DC20);
  [(CIImage *)v2->super.super.inputImage extent];
  v246[0] = v12;
  v246[1] = v170;
  v246[2] = v228;
  v246[3] = v227;
  v175 = (CIImage *)objc_msgSend(objc_msgSend(v169, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v246, 4), v171, v172, v173, v174), "imageByApplyingFilter:withInputParameters:", @"CIVibrance", &off_7DC48);
  inputMatte = v2->super.super.inputMatte;
  if (inputMatte)
  {
    [(CIImage *)v2->super.super.inputMatte extent];
    double v178 = v177;
    [(CIImage *)v2->super.super.inputImage extent];
    if (v178 != v179)
    {
      [(CIImage *)v2->super.super.inputImage extent];
      float v181 = v180;
      [(CIImage *)v2->super.super.inputMatte extent];
      float v183 = v182;
      float v184 = v181 / v183;
      [(CIImage *)v2->super.super.inputImage extent];
      float v186 = v185;
      [(CIImage *)v2->super.super.inputMatte extent];
      float v188 = v187;
      CGAffineTransformMakeScale(&v232, v184, (float)(v186 / v188));
      inputMatte = [(CIImage *)inputMatte imageByApplyingTransform:&v232];
    }
    v189 = v2->super.super.inputImage;
    v244[0] = @"inputBackgroundImage";
    v244[1] = @"inputMaskImage";
    v245[0] = v189;
    v245[1] = inputMatte;
    v190 = +[NSDictionary dictionaryWithObjects:v245 forKeys:v244 count:2];
    v191 = v175;
  }
  else
  {
    inputBlurMap = v2->super.super.inputBlurMap;
    if (!inputBlurMap) {
      goto LABEL_41;
    }
    [(CIImage *)v2->super.super.inputBlurMap extent];
    double v194 = v193;
    [(CIImage *)v2->super.super.inputImage extent];
    if (v194 != v195)
    {
      [(CIImage *)v2->super.super.inputImage extent];
      float v197 = v196;
      [(CIImage *)v2->super.super.inputBlurMap extent];
      float v199 = v198;
      float v200 = v197 / v199;
      [(CIImage *)v2->super.super.inputImage extent];
      float v202 = v201;
      [(CIImage *)v2->super.super.inputBlurMap extent];
      float v204 = v203;
      CGAffineTransformMakeScale(&v231, v200, (float)(v202 / v204));
      inputBlurMap = [(CIImage *)inputBlurMap imageByApplyingTransform:&v231];
    }
    id v205 = [(CIPortraitEffectStudioV2 *)v2 _prepareDepth];
    [(CIImage *)v2->super.super.inputImage extent];
    inputDepthThreshold = v2->inputDepthThreshold;
    v243[0] = inputBlurMap;
    v243[1] = inputDepthThreshold;
    id v211 = objc_msgSend(v205, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v243, 2), v207, v208, v209, v210);
    v212 = v2->super.super.inputImage;
    v241[0] = @"inputBackgroundImage";
    v241[1] = @"inputMaskImage";
    v242[0] = v175;
    v242[1] = v211;
    v190 = +[NSDictionary dictionaryWithObjects:v242 forKeys:v241 count:2];
    v191 = v212;
  }
  v175 = [(CIImage *)v191 imageByApplyingFilter:@"CIBlendWithMask" withInputParameters:v190];
LABEL_41:
  [(NSNumber *)v2->super.super.inputStrength floatValue];
  if (v213 < 1.0)
  {
    [(NSNumber *)v2->super.super.inputStrength floatValue];
    *(float *)&double v215 = powf(v214, 0.75);
    v216 = v2->super.super.inputImage;
    v239[0] = @"inputBackgroundImage";
    v239[1] = @"inputAmount";
    v240[0] = v216;
    v240[1] = +[NSNumber numberWithFloat:v215];
    v175 = [(CIImage *)v175 imageByApplyingFilter:@"CIMix" withInputParameters:+[NSDictionary dictionaryWithObjects:v240 forKeys:v239 count:2]];
  }
  return [(CIImage *)v175 _imageByRenderingToIntermediate];
}

- (NSNumber)inputKickLight
{
  return self->inputKickLight;
}

- (void)setInputKickLight:(id)a3
{
}

- (NSNumber)inputFaceLight
{
  return self->inputFaceLight;
}

- (void)setInputFaceLight:(id)a3
{
}

- (NSNumber)inputDepthThreshold
{
  return self->inputDepthThreshold;
}

- (void)setInputDepthThreshold:(id)a3
{
}

@end