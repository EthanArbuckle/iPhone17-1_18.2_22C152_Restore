@interface CIDynamicFood
+ (id)customAttributes;
- (NSArray)inputBoundingBoxArray;
- (NSNumber)inputUnionBox;
- (NSNumber)inputVignetteStrength;
- (id)_applyVignette;
- (id)_foodVignette;
- (id)outputImage;
- (void)setInputBoundingBoxArray:(id)a3;
- (void)setInputUnionBox:(id)a3;
- (void)setInputVignetteStrength:(id)a3;
@end

@implementation CIDynamicFood

+ (id)customAttributes
{
  v30[0] = kCIAttributeFilterCategories;
  v29[0] = kCICategoryColorAdjustment;
  v29[1] = kCICategoryVideo;
  v29[2] = kCICategoryStillImage;
  v29[3] = kCICategoryApplePrivate;
  v31[0] = +[NSArray arrayWithObjects:v29 count:4];
  v30[1] = @"inputStrength";
  v27[0] = kCIAttributeDefault;
  v27[1] = kCIAttributeMax;
  v28[0] = &off_7A310;
  v28[1] = &off_7A320;
  v27[2] = kCIAttributeMin;
  v27[3] = kCIAttributeType;
  v28[2] = &off_7A340;
  v28[3] = kCIAttributeTypeScalar;
  v31[1] = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:4];
  v30[2] = @"inputUnionBox";
  v25[0] = kCIAttributeDefault;
  v25[1] = kCIAttributeMax;
  v26[0] = &off_7A340;
  v26[1] = &off_7A350;
  v25[2] = kCIAttributeMin;
  v25[3] = kCIAttributeType;
  v26[2] = &off_7A340;
  v26[3] = kCIAttributeTypeScalar;
  v31[2] = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
  v30[3] = @"inputVignetteStrength";
  v23[0] = kCIAttributeDefault;
  v23[1] = kCIAttributeMax;
  v24[0] = &off_7A420;
  v24[1] = &off_7A350;
  v23[2] = kCIAttributeMin;
  v23[3] = kCIAttributeType;
  v24[2] = &off_7A340;
  v24[3] = kCIAttributeTypeScalar;
  v31[3] = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
  v30[4] = @"inputShadows";
  v21[0] = kCIAttributeDefault;
  v21[1] = kCIAttributeMax;
  v22[0] = &off_7A430;
  v22[1] = &off_7A350;
  v21[2] = kCIAttributeMin;
  v21[3] = kCIAttributeType;
  v22[2] = &off_7A340;
  v22[3] = kCIAttributeTypeScalar;
  v31[4] = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
  v30[5] = @"inputBrightness";
  v19[0] = kCIAttributeDefault;
  v19[1] = kCIAttributeMax;
  v20[0] = &off_7A440;
  v20[1] = &off_7A350;
  v19[2] = kCIAttributeMin;
  v19[3] = kCIAttributeType;
  v20[2] = &off_7A330;
  v20[3] = kCIAttributeTypeScalar;
  v31[5] = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
  v30[6] = @"inputHighlights";
  v17[0] = kCIAttributeDefault;
  v17[1] = kCIAttributeMax;
  v18[0] = &off_7A450;
  v18[1] = &off_7A350;
  v17[2] = kCIAttributeMin;
  v17[3] = kCIAttributeType;
  v18[2] = &off_7A330;
  v18[3] = kCIAttributeTypeScalar;
  v31[6] = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
  v30[7] = @"inputWhiteBalance";
  v15[0] = kCIAttributeDefault;
  v15[1] = kCIAttributeMax;
  v16[0] = &off_7A460;
  v16[1] = &off_7A350;
  v15[2] = kCIAttributeMin;
  v15[3] = kCIAttributeType;
  v16[2] = &off_7A340;
  v16[3] = kCIAttributeTypeScalar;
  v31[7] = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
  v30[8] = @"inputSaturation";
  v13[0] = kCIAttributeDefault;
  v13[1] = kCIAttributeMax;
  v14[0] = &off_7A470;
  v14[1] = &off_7A320;
  v13[2] = kCIAttributeMin;
  v13[3] = kCIAttributeType;
  v14[2] = &off_7A340;
  v14[3] = kCIAttributeTypeScalar;
  v31[8] = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  v30[9] = @"inputBrightSat";
  v11[0] = kCIAttributeDefault;
  v11[1] = kCIAttributeMax;
  v12[0] = &off_7A3C0;
  v12[1] = &off_7A320;
  v11[2] = kCIAttributeMin;
  v11[3] = kCIAttributeType;
  v12[2] = &off_7A340;
  v12[3] = kCIAttributeTypeScalar;
  v31[9] = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  v30[10] = @"inputConfidence";
  v9[0] = kCIAttributeDefault;
  v9[1] = kCIAttributeMax;
  v10[0] = &off_7A350;
  v10[1] = &off_7A350;
  v9[2] = kCIAttributeMin;
  v9[3] = kCIAttributeType;
  v10[2] = &off_7A340;
  v10[3] = kCIAttributeTypeScalar;
  v31[10] = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];
  v30[11] = @"inputLowConfidence";
  v7[0] = kCIAttributeDefault;
  v7[1] = kCIAttributeMax;
  v8[0] = &off_7A3E0;
  v8[1] = &off_7A350;
  v7[2] = kCIAttributeMin;
  v7[3] = kCIAttributeType;
  v8[2] = &off_7A340;
  v8[3] = kCIAttributeTypeScalar;
  v31[11] = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  v30[12] = @"inputHighConfidence";
  v5[0] = kCIAttributeDefault;
  v5[1] = kCIAttributeMax;
  v6[0] = &off_7A3F0;
  v6[1] = &off_7A350;
  v5[2] = kCIAttributeMin;
  v5[3] = kCIAttributeType;
  v6[2] = &off_7A340;
  v6[3] = kCIAttributeTypeScalar;
  v31[12] = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:4];
  v30[13] = @"inputMaxFaceSize";
  v3[0] = kCIAttributeDefault;
  v3[1] = kCIAttributeMax;
  v4[0] = &off_7A400;
  v4[1] = &off_7A350;
  v3[2] = kCIAttributeMin;
  v3[3] = kCIAttributeType;
  v4[2] = &off_7A340;
  v4[3] = kCIAttributeTypeScalar;
  v31[13] = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];
  return +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:14];
}

- (id)_foodVignette
{
  if (qword_8CF78 != -1) {
    dispatch_once(&qword_8CF78, &stru_75818);
  }
  return (id)qword_8CF70;
}

- (id)_applyVignette
{
  if (qword_8CF88 != -1) {
    dispatch_once(&qword_8CF88, &stru_75838);
  }
  return (id)qword_8CF80;
}

- (id)outputImage
{
  inputImage = self->super.inputImage;
  if (!inputImage) {
    return 0;
  }
  [(CIImage *)inputImage extent];
  double v5 = v4;
  [(CIImage *)self->super.inputImage extent];
  if (v5 >= v6) {
    double v7 = v5;
  }
  else {
    double v7 = v6;
  }
  float v8 = 1024.0 / v7;
  v9 = self->super.inputImage;
  CGAffineTransformMakeScale(&v226, v8, v8);
  v10 = [(CIImage *)v9 imageByApplyingTransform:&v226 highQualityDownsample:1];
  v11 = self->super.inputImage;
  uint64_t v225 = 0;
  long long v223 = 0u;
  long long v224 = 0u;
  p_info = &CFSTR("kernel vec4 _pf_eyeBrightenSoftlight (__sample uCb, __sample m, float str) \n"
                  " { \n"
                  " float g = .75*(1.0-dot(uCb.rgb, vec3(.333333))); \n"
                  " vec4 uCf = vec4(g, g, g, 1.0); \n"
                  " vec4 D = compare(uCb-0.25, ((16.0*uCb-12.0)*uCb+4.0)*uCb, sqrt(uCb)); \n"
                  " vec4 Ct = clamp(uCb + (2.0*uCf-1.0) * compare(uCf - 0.5, uCb*(1.0-uCb), D-uCb), 0.0, 1.0); \n"
                  " vec4 bright = Ct; \n"
                  " uCf.rgb = mix(uCb.rgb, bright.rgb, m.r); \n"
                  " uCf.rgb = mix(uCb.rgb, uCf.rgb, str); \n"
                  " return uCf; \n"
                  " }").info;
  v222.receiver = self;
  v222.super_class = (Class)CIDynamicFood;
  [(CIDynamicRender *)&v222 calcColorStats:v10];
  v13 = self->super.inputImage;
  v221.receiver = self;
  v221.super_class = (Class)CIDynamicFood;
  id v14 = [(CIDynamicRender *)&v221 sceneLuminance:v13];
  v15 = self->super.inputImage;
  v220.receiver = self;
  v220.super_class = (Class)CIDynamicFood;
  id v16 = [(CIDynamicRender *)&v220 captureType:v15];
  [(NSNumber *)self->super.inputSaturation floatValue];
  float v18 = v17;
  [(NSNumber *)self->super.inputWhiteBalance floatValue];
  float v20 = v19;
  [v14 floatValue];
  v21 = &CFBooleanGetTypeID_ptr;
  v22 = &CFBooleanGetTypeID_ptr;
  if (v23 >= 150.0)
  {
    float v44 = 1.0;
  }
  else
  {
    [v14 floatValue];
    if (v24 >= 100.0) {
      float v25 = 150.0 - v24;
    }
    else {
      float v25 = 50.0;
    }
    id v26 = [(CIImage *)v10 localLightStatisticsNoProxy];
    double v27 = dbl_56800[[v16 intValue] == 11];
    double v28 = v18;
    v245[0] = @"inputLightMap";
    id v29 = [v26 objectForKeyedSubscript:@"lightMap"];
    v245[1] = @"inputGuideImage";
    v246[0] = v29;
    v246[1] = v11;
    v30 = [+[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", @"CIDynamicLocalLightMapPrepare", +[NSDictionary dictionaryWithObjects:v246 forKeys:v245 count:2]) outputImage];
    [(NSNumber *)self->super.inputShadows floatValue];
    float v32 = v31;
    [v14 floatValue];
    double v34 = (float)(v32 * vabds_f32(150.0, v33));
    if (v34 >= 0.0) {
      double v35 = v34;
    }
    else {
      double v35 = 0.0;
    }
    [(NSNumber *)self->super.inputShadows floatValue];
    if (v35 >= v36) {
      float v37 = v36;
    }
    else {
      float v37 = v35;
    }
    [v14 floatValue];
    if (v38 < 20.0 && [v16 intValue] != 11)
    {
      [v14 floatValue];
      float v40 = vabds_f32(20.0, v39) * 0.0275 + 1.0;
      float v37 = v37 * v40;
    }
    float v41 = fabsf(v25);
    double v42 = v27 + v28;
    [v14 floatValue];
    float v44 = 1.0;
    if (*(float *)&v43 >= 25.0)
    {
      v22 = &CFBooleanGetTypeID_ptr;
    }
    else
    {
      v22 = &CFBooleanGetTypeID_ptr;
      if ([v16 intValue] == 11)
      {
        [v14 floatValue];
        double v43 = v45 * 0.016 + 0.6;
        float v44 = v43;
      }
    }
    float v20 = v20 + (float)(v41 * 0.004);
    float v18 = v42;
    v243[0] = @"inputSmartShadows";
    *(float *)&double v43 = v37;
    id v47 = [v22[198] numberWithFloat:v43];
    v243[1] = @"inputLightMapImage";
    v244[0] = v47;
    v244[1] = v30;
    v11 = [(CIImage *)v11 imageByApplyingFilter:@"CILLFilter" withInputParameters:+[NSDictionary dictionaryWithObjects:v244 forKeys:v243 count:2]];
  }
  double v48 = v20;
  if (*((double *)&v224 + 1) > 0.0 && v48 >= 0.95)
  {
    v49 = +[CIVector vectorWithX:7000.0 Y:0.0];
    CFStringRef v241 = @"inputTargetNeutral";
    v242 = v49;
    v11 = [(CIImage *)v11 imageByApplyingFilter:@"CITemperatureAndTint" withInputParameters:+[NSDictionary dictionaryWithObjects:&v242 forKeys:&v241 count:1]];
  }
  double v50 = *(double *)&v224 * -0.4;
  __double2 v51 = __sincos_stret(*(double *)&v223);
  float v52 = v50 * v51.__cosval * v48;
  double v53 = v50 * v51.__sinval;
  if (v50 * v51.__sinval < -0.05) {
    double v53 = -0.05;
  }
  float v54 = v53 * v48;
  [(NSNumber *)self->super.inputBrightness floatValue];
  id v56 = [(CIImage *)v11 _imageByApplyingGamma:v55];
  v240[0] = self->super.inputBrightSat;
  v239[0] = @"inputStrength";
  v239[1] = @"inputSat";
  *(float *)&double v57 = v18;
  v240[1] = [v22[198] numberWithFloat:v57];
  v239[2] = @"inputPShift";
  *(float *)&double v58 = v52;
  v240[2] = [v22[198] numberWithFloat:v58];
  v239[3] = @"inputTShift";
  *(float *)&double v59 = v54;
  v240[3] = [v22[198] numberWithFloat:v59];
  id v60 = objc_msgSend(v56, "imageByApplyingFilter:withInputParameters:", @"CIBrightenFood", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v240, v239, 4));
  CFStringRef v237 = @"inputHighlights";
  inputHighlights = self->super.inputHighlights;
  v46 = (CIImage *)objc_msgSend(v60, "imageByApplyingFilter:withInputParameters:", @"CISmartToneFilter", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &inputHighlights, &v237, 1));
  double v61 = *((double *)&v224 + 1);
  if (*((double *)&v224 + 1) > 0.0)
  {
    double v61 = 0.95;
    if (v48 > 0.95)
    {
      v62 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor colorWithRed:0.63 green:0.576 blue:0.94 alpha:0.1]);
      [(CIImage *)self->super.inputImage extent];
      v63 = -[CIImage imageByCroppingToRect:](v62, "imageByCroppingToRect:");
      CFStringRef v235 = @"inputBackgroundImage";
      v236 = v46;
      v46 = [(CIImage *)v63 imageByApplyingFilter:@"CIOverlayBlendMode" withInputParameters:+[NSDictionary dictionaryWithObjects:&v236 forKeys:&v235 count:1]];
    }
  }
  inputBoundingBoxArradouble y = self->inputBoundingBoxArray;
  if (inputBoundingBoxArray && [(NSArray *)inputBoundingBoxArray count])
  {
    double height = 0.0;
    v66 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0]);
    [(CIImage *)self->super.inputImage extent];
    v67 = -[CIImage imageByCroppingToRect:](v66, "imageByCroppingToRect:");
    [(NSNumber *)self->inputUnionBox floatValue];
    id v201 = v14;
    id v202 = v16;
    float v200 = v44;
    v205 = v46;
    if (v68 <= 0.0)
    {
      long long v214 = 0uLL;
      long long v215 = 0uLL;
      long long v212 = 0uLL;
      long long v213 = 0uLL;
      v204 = self->inputBoundingBoxArray;
      id v113 = [(NSArray *)v204 countByEnumeratingWithState:&v212 objects:v232 count:16];
      if (v113)
      {
        id v114 = v113;
        uint64_t v115 = *(void *)v213;
        double x = -1000.0;
        double width = 0.0;
        double y = 0.0;
        do
        {
          for (i = 0; i != v114; i = (char *)i + 1)
          {
            if (*(void *)v213 != v115) {
              objc_enumerationMutation(v204);
            }
            v120 = *(void **)(*((void *)&v212 + 1) + 8 * i);
            objc_msgSend(objc_msgSend(v120, "objectForKeyedSubscript:", @"x"), "floatValue");
            double v122 = v121;
            [(CIImage *)self->super.inputImage extent];
            float v124 = v123 * v122;
            objc_msgSend(objc_msgSend(v120, "objectForKeyedSubscript:", @"y"), "floatValue");
            double v126 = v125;
            [(CIImage *)self->super.inputImage extent];
            float v128 = v127 * v126;
            objc_msgSend(objc_msgSend(v120, "objectForKeyedSubscript:", @"w"), "floatValue");
            double v130 = v129;
            [(CIImage *)self->super.inputImage extent];
            float v132 = v131 * v130;
            objc_msgSend(objc_msgSend(v120, "objectForKeyedSubscript:", @"h"), "floatValue");
            double v134 = v133;
            [(CIImage *)self->super.inputImage extent];
            float v136 = v135 * v134;
            double v140 = v136;
            if (x >= -900.0)
            {
              v247.origin.double x = x;
              v247.origin.double y = y;
              v247.size.double width = width;
              v247.size.double height = height;
              double v137 = v124;
              double v138 = v128;
              double v139 = v132;
              CGRect v248 = CGRectUnion(v247, *(CGRect *)(&v140 - 3));
              double x = v248.origin.x;
              double y = v248.origin.y;
              double width = v248.size.width;
              double height = v248.size.height;
            }
            else
            {
              double height = v136;
              double width = v132;
              double y = v128;
              double x = v124;
            }
          }
          id v114 = [(NSArray *)v204 countByEnumeratingWithState:&v212 objects:v232 count:16];
        }
        while (v114);
      }
      else
      {
        double x = -1000.0;
        double width = 0.0;
        double y = 0.0;
      }
      float v143 = width * 0.45;
      float v144 = height * 0.45;
      v145 = +[CIVector vectorWithX:0.0 / ((v144 + v144) * v144) + 1.0 / ((v143 + v143) * v143) Y:0.0 / (v144 * 4.0 * v144) - 0.0 / (v143 * 4.0 * v143) Z:1.0 / ((v144 + v144) * v144) + 0.0 / ((v143 + v143) * v143) W:0.7];
      float v141 = width * 0.5 + x;
      float v142 = height * 0.5 + y;
      v146 = +[CIVector vectorWithX:v141 Y:v142];
      id v147 = [(CIDynamicFood *)self _foodVignette];
      [(CIImage *)self->super.inputImage extent];
      v231[0] = v205;
      v231[1] = v67;
      v231[2] = v146;
      v231[3] = v145;
      v67 = (CIImage *)objc_msgSend(v147, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v231, 4), v148, v149, v150, v151);
    }
    else
    {
      long long v218 = 0uLL;
      long long v219 = 0uLL;
      long long v216 = 0uLL;
      long long v217 = 0uLL;
      obj = self->inputBoundingBoxArray;
      id v69 = [(NSArray *)obj countByEnumeratingWithState:&v216 objects:v234 count:16];
      if (v69)
      {
        id v70 = v69;
        uint64_t v71 = *(void *)v217;
        do
        {
          for (j = 0; j != v70; j = (char *)j + 1)
          {
            if (*(void *)v217 != v71) {
              objc_enumerationMutation(obj);
            }
            v73 = *(void **)(*((void *)&v216 + 1) + 8 * (void)j);
            objc_msgSend(objc_msgSend(v73, "objectForKeyedSubscript:", @"x"), "floatValue");
            double v75 = v74;
            [(CIImage *)self->super.inputImage extent];
            float v77 = v76 * v75;
            objc_msgSend(objc_msgSend(v73, "objectForKeyedSubscript:", @"y"), "floatValue");
            double v79 = v78;
            [(CIImage *)self->super.inputImage extent];
            float v81 = v80 * v79;
            objc_msgSend(objc_msgSend(v73, "objectForKeyedSubscript:", @"w"), "floatValue");
            double v83 = v82;
            [(CIImage *)self->super.inputImage extent];
            float v85 = v84 * v83;
            objc_msgSend(objc_msgSend(v73, "objectForKeyedSubscript:", @"h"), "floatValue");
            double v87 = v86;
            [(CIImage *)self->super.inputImage extent];
            float v89 = v88 * v87;
            NSUInteger v90 = [(NSArray *)self->inputBoundingBoxArray count];
            [(CIImage *)self->super.inputImage extent];
            double v92 = v91;
            [(CIImage *)self->super.inputImage extent];
            if (v92 / 3.0 <= v85)
            {
              float v95 = v85;
            }
            else
            {
              float v94 = v92 / 3.0;
              float v95 = v94;
            }
            double v96 = v93 / 3.0;
            if (v92 * 0.5 <= v85)
            {
              float v98 = v85;
            }
            else
            {
              float v97 = v92 * 0.5;
              float v98 = v97;
            }
            double v99 = v93 * 0.5;
            if (v90 == 1)
            {
              double v96 = v99;
              float v95 = v98;
            }
            if (v96 <= v89)
            {
              float v101 = v89;
            }
            else
            {
              float v100 = v96;
              float v101 = v100;
            }
            double v102 = v95;
            float v103 = v102 * 0.5 + v77;
            double v104 = v101;
            float v105 = v104 * 0.5 + v81;
            *(float *)&double v102 = v102 * 0.45;
            *(float *)&double v104 = v104 * 0.45;
            v106 = +[CIVector vectorWithX:0.0 / ((*(float *)&v104 + *(float *)&v104) * *(float *)&v104)+ 1.0 / ((*(float *)&v102 + *(float *)&v102) * *(float *)&v102) Y:0.0 / (*(float *)&v104 * 4.0 * *(float *)&v104) - 0.0 / (*(float *)&v102 * 4.0 * *(float *)&v102) Z:1.0 / ((*(float *)&v104 + *(float *)&v104) * *(float *)&v104)+ 0.0 / ((*(float *)&v102 + *(float *)&v102) * *(float *)&v102) W:0.7];
            v107 = +[CIVector vectorWithX:v103 Y:v105];
            id v108 = [(CIDynamicFood *)self _foodVignette];
            [(CIImage *)self->super.inputImage extent];
            v233[0] = v205;
            v233[1] = v67;
            v233[2] = v107;
            v233[3] = v106;
            v67 = (CIImage *)objc_msgSend(v108, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v233, 4), v109, v110, v111, v112);
          }
          id v70 = [(NSArray *)obj countByEnumeratingWithState:&v216 objects:v234 count:16];
        }
        while (v70);
      }
    }
    id v152 = [(CIDynamicFood *)self _applyVignette];
    [(CIImage *)self->super.inputImage extent];
    v153 = self->super.inputImage;
    v230[0] = v205;
    v230[1] = v153;
    inputVignetteStrength = self->inputVignetteStrength;
    v230[2] = v67;
    v230[3] = inputVignetteStrength;
    v46 = (CIImage *)objc_msgSend(v152, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v230, 4), v155, v156, v157, v158);
    id v14 = v201;
    id v16 = v202;
    p_info = (void *)(@"kernel vec4 _pf_eyeBrightenSoftlight (__sample uCb, __sample m, float str) \n { \n float g = .75*(1.0-dot(uCb.rgb, vec3(.333333))); \n vec4 uCf = vec4(g, g, g, 1.0); \n vec4 D = compare(uCb-0.25, ((16.0*uCb-12.0)*uCb+4.0)*uCb, sqrt(uCb)); \n vec4 Ct = clamp(uCb + (2.0*uCf-1.0) * compare(uCf - 0.5, uCb*(1.0-uCb), D-uCb), 0.0, 1.0); \n vec4 bright = Ct; \n uCf.rgb = mix(uCb.rgb, bright.rgb, m.r); \n uCf.rgb = mix(uCb.rgb, uCf.rgb, str); \n return uCf; \n }"
                      + 8);
    v21 = &CFBooleanGetTypeID_ptr;
    v22 = &CFBooleanGetTypeID_ptr;
    float v44 = v200;
  }
  [(NSNumber *)self->super.inputStrength floatValue];
  float v159 = 1.0;
  if (v160 < 1.0)
  {
    [(NSNumber *)self->super.inputStrength floatValue];
    float v162 = v161;
    [(NSNumber *)self->super.inputConfidence floatValue];
    float v164 = v163;
    [(NSNumber *)self->super.inputLowConfidence floatValue];
    float v166 = v164 - v165;
    [(NSNumber *)self->super.inputHighConfidence floatValue];
    float v168 = v167;
    [(NSNumber *)self->super.inputLowConfidence floatValue];
    double v170 = (float)(v166 / (float)(v168 - v169));
    if (v170 < 0.0) {
      double v170 = 0.0;
    }
    float v171 = fmin(v170, 1.0);
    double v172 = (v171 * -2.0 + 3.0) * (float)(v171 * v171);
    float v173 = v172;
    inputFaceBoxArradouble y = self->super.inputFaceBoxArray;
    if (inputFaceBoxArray && [(NSArray *)inputFaceBoxArray count])
    {
      v206 = v46;
      long long v210 = 0u;
      long long v211 = 0u;
      long long v208 = 0u;
      long long v209 = 0u;
      v175 = self->super.inputFaceBoxArray;
      id v176 = [(NSArray *)v175 countByEnumeratingWithState:&v208 objects:v229 count:16];
      if (v176)
      {
        id v177 = v176;
        uint64_t v178 = *(void *)v209;
        float v179 = 0.0;
        do
        {
          for (k = 0; k != v177; k = (char *)k + 1)
          {
            if (*(void *)v209 != v178) {
              objc_enumerationMutation(v175);
            }
            v181 = *(void **)(*((void *)&v208 + 1) + 8 * (void)k);
            objc_msgSend(objc_msgSend(v181, "objectForKeyedSubscript:", @"w"), "floatValue");
            double v183 = v182;
            [(CIImage *)self->super.inputImage extent];
            float v185 = v184 * v183;
            objc_msgSend(objc_msgSend(v181, "objectForKeyedSubscript:", @"h"), "floatValue");
            double v187 = v186;
            [(CIImage *)self->super.inputImage extent];
            float v189 = v188 * v187;
            if (v185 >= v189) {
              float v189 = v185;
            }
            if (v189 > v179) {
              float v179 = v189;
            }
          }
          id v177 = [(NSArray *)v175 countByEnumeratingWithState:&v208 objects:v229 count:16];
        }
        while (v177);
      }
      else
      {
        float v179 = 0.0;
      }
      [(NSNumber *)self->super.inputMaxFaceSize floatValue];
      float v191 = fminf(v179 / v190, 1.0);
      double v172 = 1.0 - (float)(v191 * (float)(v191 * v191)) * (v191 * -2.0 + 3.0);
      float v159 = v172;
      p_info = &CFSTR("kernel vec4 _pf_eyeBrightenSoftlight (__sample uCb, __sample m, float str) \n"
                      " { \n"
                      " float g = .75*(1.0-dot(uCb.rgb, vec3(.333333))); \n"
                      " vec4 uCf = vec4(g, g, g, 1.0); \n"
                      " vec4 D = compare(uCb-0.25, ((16.0*uCb-12.0)*uCb+4.0)*uCb, sqrt(uCb)); \n"
                      " vec4 Ct = clamp(uCb + (2.0*uCf-1.0) * compare(uCf - 0.5, uCb*(1.0-uCb), D-uCb), 0.0, 1.0); \n"
                      " vec4 bright = Ct; \n"
                      " uCf.rgb = mix(uCb.rgb, bright.rgb, m.r); \n"
                      " uCf.rgb = mix(uCb.rgb, uCf.rgb, str); \n"
                      " return uCf; \n"
                      " }").info;
      v21 = &CFBooleanGetTypeID_ptr;
      v22 = &CFBooleanGetTypeID_ptr;
      v46 = v206;
    }
    v192 = self->super.inputImage;
    v227[0] = @"inputBackgroundImage";
    v227[1] = @"inputAmount";
    v228[0] = v192;
    float v193 = v44 * (float)((float)(v162 * v173) * v159);
    *(float *)&double v172 = v193;
    v228[1] = [v22[198] numberWithFloat:v172];
    v46 = -[CIImage imageByApplyingFilter:withInputParameters:](v46, "imageByApplyingFilter:withInputParameters:", @"CIMix", [v21[191] dictionaryWithObjects:v228 forKeys:v227 count:2]);
    v194 = (objc_class *)p_info[310];
    v207.receiver = self;
    v207.super_class = v194;
    if ((int)objc_msgSend(-[CIDynamicRender writeDebugData:](&v207, "writeDebugData:", &off_7A908), "intValue") >= 1)
    {
      id v195 = [v16 intValue];
      [v14 floatValue];
      LODWORD(v197) = v196;
      *(float *)&double v198 = v193;
      return [(CIDynamicRender *)self overlayText:v46 strength:v195 captureType:v198 bv:v197];
    }
  }
  return v46;
}

- (NSArray)inputBoundingBoxArray
{
  return self->inputBoundingBoxArray;
}

- (void)setInputBoundingBoxArray:(id)a3
{
}

- (NSNumber)inputUnionBox
{
  return self->inputUnionBox;
}

- (void)setInputUnionBox:(id)a3
{
}

- (NSNumber)inputVignetteStrength
{
  return self->inputVignetteStrength;
}

- (void)setInputVignetteStrength:(id)a3
{
}

@end