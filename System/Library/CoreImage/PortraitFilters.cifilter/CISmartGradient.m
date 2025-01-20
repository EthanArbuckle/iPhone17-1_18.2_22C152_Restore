@interface CISmartGradient
+ (id)customAttributes;
- (id)_scaleHuePi;
- (id)_scaleHueZeroOne;
- (id)findPeakHue:(id)a3 chromaMin:(float)a4 hueRange:(float)a5;
- (id)findPeakHue_Renderless:(id)a3 chromaMin:(id)a4 hueRange:(id)a5;
- (id)outputImage;
@end

@implementation CISmartGradient

+ (id)customAttributes
{
  v16[0] = kCIAttributeFilterCategories;
  v15[0] = kCICategoryColorEffect;
  v15[1] = kCICategoryVideo;
  v15[2] = kCICategoryStillImage;
  v15[3] = kCICategoryApplePrivate;
  v17[0] = +[NSArray arrayWithObjects:v15 count:4];
  v17[1] = @"13";
  v16[1] = kCIAttributeFilterAvailable_iOS;
  v16[2] = kCIAttributeFilterAvailable_Mac;
  v17[2] = @"10.15";
  v16[3] = @"inputReturnSmartColor";
  v13[0] = kCIAttributeDefault;
  v13[1] = kCIAttributeType;
  v14[0] = &__kCFBooleanFalse;
  v14[1] = kCIAttributeTypeScalar;
  v17[3] = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[4] = @"inputHueRange";
  v11[0] = kCIAttributeDefault;
  v11[1] = kCIAttributeMax;
  v12[0] = &off_79AF0;
  v12[1] = &off_79B00;
  v11[2] = kCIAttributeMin;
  v11[3] = kCIAttributeType;
  v12[2] = &off_79B10;
  v12[3] = kCIAttributeTypeScalar;
  v17[4] = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  v16[5] = @"inputChromaMin";
  v9[0] = kCIAttributeDefault;
  v9[1] = kCIAttributeMax;
  v10[0] = &off_79B10;
  v10[1] = &off_79B20;
  v9[2] = kCIAttributeMin;
  v9[3] = kCIAttributeType;
  v10[2] = &off_79B10;
  v10[3] = kCIAttributeTypeScalar;
  v17[5] = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];
  v16[6] = @"inputMaxDimension";
  v7[0] = kCIAttributeDefault;
  v7[1] = kCIAttributeType;
  v8[0] = &off_79B30;
  v8[1] = kCIAttributeTypeScalar;
  v17[6] = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  v16[7] = @"inputWidth";
  v5[0] = kCIAttributeDefault;
  v5[1] = kCIAttributeType;
  v6[0] = &off_79B40;
  v6[1] = kCIAttributeTypeScalar;
  v17[7] = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  v16[8] = @"inputHeight";
  v3[0] = kCIAttributeDefault;
  v3[1] = kCIAttributeType;
  v4[0] = &off_7A848;
  v4[1] = kCIAttributeTypeScalar;
  v17[8] = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  return +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:9];
}

- (id)_scaleHueZeroOne
{
  if (qword_8CBC0 != -1) {
    dispatch_once(&qword_8CBC0, &stru_75000);
  }
  return (id)qword_8CBB8;
}

- (id)_scaleHuePi
{
  if (qword_8CBD0 != -1) {
    dispatch_once(&qword_8CBD0, &stru_75020);
  }
  return (id)qword_8CBC8;
}

- (id)findPeakHue:(id)a3 chromaMin:(float)a4 hueRange:(float)a5
{
  id v9 = [(CISmartGradient *)self _scaleHueZeroOne];
  [a3 extent];
  v144[0] = a3;
  v144[1] = &off_79B50;
  id v14 = objc_msgSend(v9, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v144, 2), v10, v11, v12, v13);
  CIContextOption v142 = kCIContextWorkingFormat;
  v143 = +[NSNumber numberWithInt:kCIFormatRGBAh];
  v15 = +[CIContext contextWithOptions:](CIContext, "contextWithOptions:", +[NSDictionary dictionaryWithObjects:&v143 forKeys:&v142 count:1]);
  [a3 extent];
  CGRect v146 = CGRectIntegral(v145);
  double x = v146.origin.x;
  double y = v146.origin.y;
  double width = v146.size.width;
  double height = v146.size.height;
  unint64_t v20 = (unint64_t)v146.size.width;
  unint64_t v21 = (unint64_t)v146.size.height;
  unint64_t v22 = 4 * (unint64_t)v146.size.width;
  v23 = +[NSMutableData dataWithLength:v22 * (unint64_t)v146.size.height];
  v24 = (char *)[(NSMutableData *)v23 bytes];
  id v25 = [(NSMutableData *)v23 mutableBytes];
  uint64_t v26 = kCIFormatRGBA8;
  -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v15, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v14, v25, v22, kCIFormatRGBA8, 0, x, y, width, height);
  long long v141 = 0u;
  long long v140 = 0u;
  long long v139 = 0u;
  long long v138 = 0u;
  long long v137 = 0u;
  long long v136 = 0u;
  long long v135 = 0u;
  long long v134 = 0u;
  long long v133 = 0u;
  long long v132 = 0u;
  long long v131 = 0u;
  long long v130 = 0u;
  long long v129 = 0u;
  long long v128 = 0u;
  long long v127 = 0u;
  long long v126 = 0u;
  unint64_t v27 = vcvtad_u64_f64(a4 * 255.0);
  if ((int)v21 < 1) {
    goto LABEL_11;
  }
  uint64_t v28 = 0;
  v29 = (unsigned __int8 *)(v24 + 2);
  char v30 = 1;
  do
  {
    uint64_t v31 = v20;
    v32 = v29;
    if ((int)v20 >= 1)
    {
      do
      {
        unsigned int v33 = *(v32 - 1);
        unint64_t v34 = *v32;
        if (v34 > v27)
        {
          char v30 = 0;
          signed int v35 = vcvtmd_s64_f64((double)v33 * 0.125);
          *((float *)&v134 + v35) = *((float *)&v134 + v35) + 1.0;
        }
        if (v34 >= v27)
        {
          signed int v36 = vcvtmd_s64_f64((double)v33 * 0.125);
          *((float *)&v126 + v36) = *((float *)&v126 + v36) + 1.0;
        }
        v32 += 4;
        --v31;
      }
      while (v31);
    }
    ++v28;
    v29 += v22;
  }
  while (v28 != v21);
  if (v30)
  {
LABEL_11:
    int v37 = 0;
    long long v138 = v130;
    long long v139 = v131;
    long long v140 = v132;
    long long v141 = v133;
    long long v134 = v126;
    long long v135 = v127;
    long long v136 = v128;
    long long v137 = v129;
  }
  else
  {
    int v37 = 1;
  }
  unint64_t v38 = 0;
  float v39 = 0.0;
  float v40 = 0.0;
  do
  {
    if (*((float *)&v134 + v38) > v40)
    {
      float v40 = *((float *)&v134 + v38);
      float v39 = (float)v38;
    }
    ++v38;
  }
  while (v38 != 32);
  bzero(v125, 0xC00uLL);
  if ((int)v21 < 1)
  {
    unint64_t v43 = 0;
  }
  else
  {
    uint64_t v42 = 0;
    unint64_t v43 = 0;
    float v44 = a5 * 3.14159265 / 180.0;
    float v45 = ((float)(v39 / 31.0) + (float)(v39 / 31.0)) * 3.14159265 + -3.14159265;
    double v46 = v45;
    double v47 = (float)(v44 * 0.5);
    double v48 = v47 + -3.14159265;
    double v49 = 3.14159265 - v47;
    v50 = (unsigned __int8 *)(v24 + 2);
    do
    {
      uint64_t v51 = v20;
      v52 = v50;
      if ((int)v20 >= 1)
      {
        do
        {
          LOBYTE(v41) = *(v52 - 1);
          float v41 = (float)LODWORD(v41);
          float v53 = ((float)(v41 * 0.0039216) + (float)(v41 * 0.0039216)) * 3.14159265 + -3.14159265;
          double v54 = v53;
          if ((v48 <= v46 || v49 >= v54) && (v49 >= v46 || v48 <= v54)) {
            float v55 = v45 - v53;
          }
          else {
            float v55 = v45 + v53;
          }
          unint64_t v56 = *v52;
          float v57 = fabsf(v55);
          if (v57 < v44) {
            int v58 = v37;
          }
          else {
            int v58 = 0;
          }
          BOOL v59 = v58 == 1 && v56 > v27;
          if (v59 || (v57 > v44 ? (char v60 = 1) : (char v60 = v37), (v60 & 1) == 0 && v56 >= v27))
          {
            v61 = &v125[3 * *(v52 - 2)];
            float v62 = v61[1];
            float *v61 = *v61 + 1.0;
            v61[1] = v62 + (float)(v41 * 0.0039216);
            float v41 = v61[2] + (float)((float)v56 * 0.0039216);
            v61[2] = v41;
            ++v43;
          }
          v52 += 4;
          --v51;
        }
        while (v51);
      }
      ++v42;
      v50 += v22;
    }
    while (v42 != v21);
  }
  if ([(NSNumber *)self->inputReturnSmartColor BOOLValue])
  {
    uint64_t v63 = 0;
    float v64 = 0.0;
    v65 = v125;
    float v66 = 0.0;
    do
    {
      float v67 = *v65;
      v65 += 3;
      float v68 = v67;
      if (v67 > v64)
      {
        float v66 = (float)(int)v63;
        float v64 = v68;
      }
      ++v63;
    }
    while (v63 != 256);
    v69 = &v125[3 * (int)v66];
    float v70 = v69[1] / *v69;
    float v71 = v69[2] / *v69;
    float v72 = v66 / 255.0;
    v73 = CGColorSpaceCreateWithName(kCGColorSpaceLinearSRGB);
    v74 = +[CIColor colorWithRed:v73 green:v72 blue:v70 alpha:v71 colorSpace:1.0];
    CGColorSpaceRelease(v73);
    v75 = +[CIImage imageWithColor:v74];
    id v76 = [(CISmartGradient *)self _scaleHuePi];
    [(CIImage *)v75 extent];
    v124[0] = v75;
    v124[1] = &off_79B50;
    id v81 = objc_msgSend(objc_msgSend(v76, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v124, 2), v77, v78, v79, v80), "imageByApplyingFilter:withInputParameters:", @"CIIPTtoSRGB", &off_7C438);
    [(NSNumber *)self->inputWidth floatValue];
    double v83 = v82;
    [(NSNumber *)self->inputHeight floatValue];
    return objc_msgSend(v81, "imageByCroppingToRect:", 0.0, 0.0, v83, v84);
  }
  else
  {
    [(NSNumber *)self->inputHeight floatValue];
    float v87 = v86 / (float)v43;
    unint64_t v88 = vcvtas_u32_f32(v87 * (float)v43);
    id v89 = [objc_alloc((Class)NSMutableData) initWithLength:4 * v88];
    v90 = (char *)[v89 mutableBytes];
    unint64_t v91 = 0;
    unint64_t v92 = 0;
    v93 = v90 + 1;
    float64x2_t v94 = (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL);
    do
    {
      float v95 = v125[3 * v91];
      unint64_t v96 = vcvtas_u32_f32(v87 * v95);
      if (v96)
      {
        float64x2_t v97 = vdivq_f64(vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)&v125[3 * v91 + 1]), v94), (float64x2_t)vdupq_lane_s64(COERCE__INT64(v95), 0));
        int32x2_t v98 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vminnmq_f64((float64x2_t)vbicq_s8((int8x16_t)v97, (int8x16_t)vcltzq_f64(v97)), v94))));
        v99 = &v93[4 * v92];
        unint64_t v100 = 1;
        do
        {
          *(v99 - 1) = v91;
          v99[1] = v98.i8[4];
          char *v99 = v98.i8[0];
          v99[2] = -1;
          unint64_t v101 = v100 + 1;
          if (v100 >= v96) {
            break;
          }
          unint64_t v102 = v92 + v100;
          v99 += 4;
          ++v100;
        }
        while (v102 <= v88);
        unint64_t v92 = v92 + v101 - 1;
      }
      if (v91 > 0xFE) {
        break;
      }
      ++v91;
    }
    while (v92 <= v88);
    unint64_t v103 = v92 - 1;
    double v104 = (double)(v92 - 1);
    v105 = CGColorSpaceCreateWithName(kCGColorSpaceLinearSRGB);
    v106 = +[CIImage imageWithBitmapData:bytesPerRow:size:format:colorSpace:](CIImage, "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v89, 4, v26, v105, 1.0, v104);
    CGColorSpaceRelease(v105);
    if (v106)
    {
      [(CIImage *)v106 extent];
      v107 = -[CIImage imageByClampingToExtent](-[CIImage imageBySettingAlphaOneInExtent:](v106, "imageBySettingAlphaOneInExtent:"), "imageByClampingToExtent");
      [(NSNumber *)self->inputHeight floatValue];
      CFStringRef v122 = @"inputScale";
      *(float *)&double v109 = (float)v103 / v108;
      v123 = +[NSNumber numberWithFloat:v109];
      v110 = [(CIImage *)v107 imageByApplyingFilter:@"CISoftCubicUpsample" withInputParameters:+[NSDictionary dictionaryWithObjects:&v123 forKeys:&v122 count:1]];
      [(NSNumber *)self->inputWidth floatValue];
      double v112 = v111;
      [(NSNumber *)self->inputHeight floatValue];
      double v114 = v113;
      v115 = -[CIImage imageByCroppingToRect:](v110, "imageByCroppingToRect:", 0.0, 0.0, v112, v113);
      id v116 = [(CISmartGradient *)self _scaleHuePi];
      [(CIImage *)v115 extent];
      v121[0] = v115;
      v121[1] = &off_79B50;
      return objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v116, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v121, 2), v117, v118, v119, v120), "imageByApplyingFilter:withInputParameters:", @"CIIPTtoSRGB", &off_7C460), "imageByClampingToExtent"), "imageByApplyingGaussianBlurWithSigma:", 500.0), "imageByCroppingToRect:",
                 0.0,
                 0.0,
                 v112,
                 v114),
               "imageByApplyingFilter:withInputParameters:",
               @"CIDither",
               &off_7C488);
    }
    else
    {
      return 0;
    }
  }
}

- (id)findPeakHue_Renderless:(id)a3 chromaMin:(id)a4 hueRange:(id)a5
{
  [a3 extent];
  if (a3 && (CGFloat v13 = v9, v14 = v10, v15 = v11, v16 = v12, !CGRectIsInfinite(*(CGRect *)&v9)))
  {
    memset(&v55, 0, sizeof(v55));
    [a3 extent];
    CGFloat v19 = v18;
    [a3 extent];
    CGAffineTransformMakeScale(&v55, v19, v20);
    CGAffineTransform v70 = v55;
    v71.origin.double x = v13;
    v71.origin.double y = v14;
    v71.size.double width = v15;
    v71.size.double height = v16;
    CGRect v72 = CGRectApplyAffineTransform(v71, &v70);
    v69 = kCIInputExtentKey;
    *(void *)&v70.a = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v72.origin.x, v72.origin.y, v72.size.width, v72.size.height);
    id v17 = objc_msgSend(a3, "imageByApplyingFilter:withInputParameters:", @"CIAreaAverage", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));
  }
  else
  {
    id v17 = 0;
  }
  id v21 = [(CISmartGradient *)self _scaleHueZeroOne];
  [a3 extent];
  v68[0] = a3;
  v68[1] = &off_79B50;
  v67[0] = objc_msgSend(v21, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v68, 2), v22, v23, v24, v25);
  v67[1] = v17;
  uint64_t v26 = +[NSArray arrayWithObjects:v67 count:2];
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](v26, "objectAtIndexedSubscript:", 0), "extent");
  v66[0] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](v26, "objectAtIndexedSubscript:", 1), "extent");
  v66[1] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  unint64_t v27 = +[NSArray arrayWithObjects:v66 count:2];
  v64[0] = @"imageExtents";
  v64[1] = @"chromaMin";
  v65[0] = v27;
  v65[1] = a4;
  v64[2] = @"hueRange";
  v65[2] = a5;
  id v28 = +[CIHueChromaHistProcessor applyWithExtent:inputs:arguments:error:](CIHueChromaHistProcessor, "applyWithExtent:inputs:arguments:error:", v26, +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:3], 0, 0.0, 0.0, 256.0, 1.0);
  if ([(NSNumber *)self->inputReturnSmartColor BOOLValue])
  {
    id v63 = v28;
    v29 = +[NSArray arrayWithObjects:&v63 count:1];
    CFStringRef v61 = @"imageExtent";
    [v28 extent];
    float v62 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
    id v30 = objc_msgSend(+[CIAveColorProcessor applyWithExtent:inputs:arguments:error:](CIAveColorProcessor, "applyWithExtent:inputs:arguments:error:", v29, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1), 0, 0.0, 0.0, 1.0, 1.0), "imageByClampingToExtent");
    id v31 = [(CISmartGradient *)self _scaleHuePi];
    [v30 extent];
    v60[0] = v30;
    v60[1] = &off_79B50;
    id v36 = objc_msgSend(objc_msgSend(v31, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v60, 2), v32, v33, v34, v35), "imageByApplyingFilter:withInputParameters:", @"CIIPTtoSRGB", &off_7C4B0);
    [(NSNumber *)self->inputWidth floatValue];
    double v38 = v37;
    [(NSNumber *)self->inputHeight floatValue];
    return objc_msgSend(v36, "imageByCroppingToRect:", 0.0, 0.0, v38, v39);
  }
  else
  {
    double v41 = (double)[(NSNumber *)self->inputHeight intValue];
    id v59 = v28;
    uint64_t v42 = +[NSArray arrayWithObjects:&v59 count:1];
    CFStringRef v57 = @"imageExtent";
    [v28 extent];
    int v58 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
    id result = +[CIColorGradientProcessor applyWithExtent:inputs:arguments:error:](CIColorGradientProcessor, "applyWithExtent:inputs:arguments:error:", v42, +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1], 0, 0.0, 0.0, 1.0, v41);
    if (result)
    {
      id v43 = result;
      [result extent];
      id v44 = objc_msgSend(objc_msgSend(v43, "imageBySettingAlphaOneInExtent:"), "imageByClampingToExtent");
      [(NSNumber *)self->inputWidth floatValue];
      double v46 = v45;
      [(NSNumber *)self->inputHeight floatValue];
      double v48 = v47;
      id v49 = objc_msgSend(v44, "imageByCroppingToRect:", 0.0, 0.0, v46, v47);
      id v50 = [(CISmartGradient *)self _scaleHuePi];
      [v49 extent];
      v56[0] = v49;
      v56[1] = &off_79B50;
      return objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v50, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 2), v51, v52, v53, v54), "imageByApplyingFilter:withInputParameters:", @"CIIPTtoSRGB", &off_7C4D8), "imageByClampingToExtent"), "imageByApplyingGaussianBlurWithSigma:", 500.0), "imageByCroppingToRect:",
                 0.0,
                 0.0,
                 v46,
                 v48),
               "imageByApplyingFilter:withInputParameters:",
               @"CIDither",
               &off_7C500);
    }
  }
  return result;
}

- (id)outputImage
{
  id result = self->inputImage;
  if (result)
  {
    [result extent];
    double v5 = v4;
    [(CIImage *)self->inputImage extent];
    if (v5 >= v6) {
      double v5 = v6;
    }
    [(NSNumber *)self->inputMaxDimension floatValue];
    double v8 = v7 / v5;
    inputImage = self->inputImage;
    if (v8 < 1.0)
    {
      CGAffineTransformMakeScale(&v10, v8, v8);
      inputImage = [(CIImage *)inputImage imageByApplyingTransform:&v10];
    }
    id result = [(CISmartGradient *)self findPeakHue_Renderless:[(CIImage *)inputImage imageByApplyingFilter:@"CISRGBtoIPT" withInputParameters:&off_7C528] chromaMin:self->inputChromaMin hueRange:self->inputHueRange];
    if (!result) {
      return self->inputImage;
    }
  }
  return result;
}

@end