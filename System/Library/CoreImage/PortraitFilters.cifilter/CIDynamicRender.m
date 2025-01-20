@interface CIDynamicRender
+ (id)customAttributes;
- ($3CC2805F0189FCCE51047C0D2B5A52A9)calcColorStats:(SEL)a3;
- (CIImage)inputImage;
- (CIImage)inputSkyMask;
- (NSArray)inputFaceBoxArray;
- (NSNumber)inputBrightSat;
- (NSNumber)inputBrightness;
- (NSNumber)inputConfidence;
- (NSNumber)inputContrast;
- (NSNumber)inputExposure;
- (NSNumber)inputHighConfidence;
- (NSNumber)inputHighlights;
- (NSNumber)inputIsSunsetSunrise;
- (NSNumber)inputLocalLight;
- (NSNumber)inputLowConfidence;
- (NSNumber)inputMaxFaceSize;
- (NSNumber)inputSaturation;
- (NSNumber)inputShadows;
- (NSNumber)inputStrength;
- (NSNumber)inputWhiteBalance;
- (id)_rectToHueChroma;
- (id)_softExposure;
- (id)_srgbToIPT;
- (id)captureType:(id)a3;
- (id)outputImage;
- (id)overlayText:(id)a3 strength:(float)a4 captureType:(int)a5 bv:(float)a6;
- (id)sceneLuminance:(id)a3;
- (id)writeDebugData:(id)a3;
- (void)setInputBrightSat:(id)a3;
- (void)setInputBrightness:(id)a3;
- (void)setInputConfidence:(id)a3;
- (void)setInputContrast:(id)a3;
- (void)setInputExposure:(id)a3;
- (void)setInputFaceBoxArray:(id)a3;
- (void)setInputHighConfidence:(id)a3;
- (void)setInputHighlights:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputIsSunsetSunrise:(id)a3;
- (void)setInputLocalLight:(id)a3;
- (void)setInputLowConfidence:(id)a3;
- (void)setInputMaxFaceSize:(id)a3;
- (void)setInputSaturation:(id)a3;
- (void)setInputShadows:(id)a3;
- (void)setInputSkyMask:(id)a3;
- (void)setInputStrength:(id)a3;
- (void)setInputWhiteBalance:(id)a3;
@end

@implementation CIDynamicRender

+ (id)customAttributes
{
  v34[0] = kCIAttributeFilterCategories;
  v33[0] = kCICategoryColorAdjustment;
  v33[1] = kCICategoryVideo;
  v33[2] = kCICategoryStillImage;
  v33[3] = kCICategoryApplePrivate;
  v35[0] = +[NSArray arrayWithObjects:v33 count:4];
  v34[1] = @"inputStrength";
  v31[0] = kCIAttributeDefault;
  v31[1] = kCIAttributeMax;
  v32[0] = &off_7A310;
  v32[1] = &off_7A320;
  v31[2] = kCIAttributeMin;
  v31[3] = kCIAttributeType;
  v32[2] = &off_7A330;
  v32[3] = kCIAttributeTypeScalar;
  v35[1] = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];
  v34[2] = @"inputIsSunsetSunrise";
  v29[0] = kCIAttributeDefault;
  v29[1] = kCIAttributeMax;
  v30[0] = &off_7A340;
  v30[1] = &off_7A350;
  v29[2] = kCIAttributeMin;
  v29[3] = kCIAttributeType;
  v30[2] = &off_7A340;
  v30[3] = kCIAttributeTypeScalar;
  v35[2] = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:4];
  v34[3] = @"inputLocalLight";
  v27[0] = kCIAttributeDefault;
  v27[1] = kCIAttributeMax;
  v28[0] = &off_7A360;
  v28[1] = &off_7A350;
  v27[2] = kCIAttributeMin;
  v27[3] = kCIAttributeType;
  v28[2] = &off_7A340;
  v28[3] = kCIAttributeTypeScalar;
  v35[3] = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:4];
  v34[4] = @"inputShadows";
  v25[0] = kCIAttributeDefault;
  v25[1] = kCIAttributeMax;
  v26[0] = &off_7A370;
  v26[1] = &off_7A350;
  v25[2] = kCIAttributeMin;
  v25[3] = kCIAttributeType;
  v26[2] = &off_7A340;
  v26[3] = kCIAttributeTypeScalar;
  v35[4] = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
  v34[5] = @"inputExposure";
  v23[0] = kCIAttributeDefault;
  v23[1] = kCIAttributeMax;
  v24[0] = &off_7A380;
  v24[1] = &off_7A350;
  v23[2] = kCIAttributeMin;
  v23[3] = kCIAttributeType;
  v24[2] = &off_7A340;
  v24[3] = kCIAttributeTypeScalar;
  v35[5] = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
  v34[6] = @"inputBrightness";
  v21[0] = kCIAttributeDefault;
  v21[1] = kCIAttributeMax;
  v22[0] = &off_7A390;
  v22[1] = &off_7A350;
  v21[2] = kCIAttributeMin;
  v21[3] = kCIAttributeType;
  v22[2] = &off_7A330;
  v22[3] = kCIAttributeTypeScalar;
  v35[6] = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
  v34[7] = @"inputHighlights";
  v19[0] = kCIAttributeDefault;
  v19[1] = kCIAttributeMax;
  v20[0] = &off_7A3A0;
  v20[1] = &off_7A350;
  v19[2] = kCIAttributeMin;
  v19[3] = kCIAttributeType;
  v20[2] = &off_7A330;
  v20[3] = kCIAttributeTypeScalar;
  v35[7] = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
  v34[8] = @"inputContrast";
  v17[0] = kCIAttributeDefault;
  v17[1] = kCIAttributeMax;
  v18[0] = &off_7A3B0;
  v18[1] = &off_7A350;
  v17[2] = kCIAttributeMin;
  v17[3] = kCIAttributeType;
  v18[2] = &off_7A330;
  v18[3] = kCIAttributeTypeScalar;
  v35[8] = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
  v34[9] = @"inputWhiteBalance";
  v15[0] = kCIAttributeDefault;
  v15[1] = kCIAttributeMax;
  v16[0] = &off_7A350;
  v16[1] = &off_7A350;
  v15[2] = kCIAttributeMin;
  v15[3] = kCIAttributeType;
  v16[2] = &off_7A340;
  v16[3] = kCIAttributeTypeScalar;
  v35[9] = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
  v34[10] = @"inputSaturation";
  v13[0] = kCIAttributeDefault;
  v13[1] = kCIAttributeMax;
  v14[0] = &off_7A3C0;
  v14[1] = &off_7A320;
  v13[2] = kCIAttributeMin;
  v13[3] = kCIAttributeType;
  v14[2] = &off_7A340;
  v14[3] = kCIAttributeTypeScalar;
  v35[10] = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  v34[11] = @"inputBrightSat";
  v11[0] = kCIAttributeDefault;
  v11[1] = kCIAttributeMax;
  v12[0] = &off_7A3D0;
  v12[1] = &off_7A350;
  v11[2] = kCIAttributeMin;
  v11[3] = kCIAttributeType;
  v12[2] = &off_7A340;
  v12[3] = kCIAttributeTypeScalar;
  v35[11] = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  v34[12] = @"inputConfidence";
  v9[0] = kCIAttributeDefault;
  v9[1] = kCIAttributeMax;
  v10[0] = &off_7A350;
  v10[1] = &off_7A350;
  v9[2] = kCIAttributeMin;
  v9[3] = kCIAttributeType;
  v10[2] = &off_7A340;
  v10[3] = kCIAttributeTypeScalar;
  v35[12] = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];
  v34[13] = @"inputLowConfidence";
  v7[0] = kCIAttributeDefault;
  v7[1] = kCIAttributeMax;
  v8[0] = &off_7A3E0;
  v8[1] = &off_7A350;
  v7[2] = kCIAttributeMin;
  v7[3] = kCIAttributeType;
  v8[2] = &off_7A340;
  v8[3] = kCIAttributeTypeScalar;
  v35[13] = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  v34[14] = @"inputHighConfidence";
  v5[0] = kCIAttributeDefault;
  v5[1] = kCIAttributeMax;
  v6[0] = &off_7A3F0;
  v6[1] = &off_7A350;
  v5[2] = kCIAttributeMin;
  v5[3] = kCIAttributeType;
  v6[2] = &off_7A340;
  v6[3] = kCIAttributeTypeScalar;
  v35[14] = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:4];
  v34[15] = @"inputMaxFaceSize";
  v3[0] = kCIAttributeDefault;
  v3[1] = kCIAttributeMax;
  v4[0] = &off_7A400;
  v4[1] = &off_7A350;
  v3[2] = kCIAttributeMin;
  v3[3] = kCIAttributeType;
  v4[2] = &off_7A340;
  v4[3] = kCIAttributeTypeScalar;
  v35[15] = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];
  return +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:16];
}

- (id)_srgbToIPT
{
  if (qword_8CF40 != -1) {
    dispatch_once(&qword_8CF40, &stru_75798);
  }
  return (id)qword_8CF38;
}

- (id)_rectToHueChroma
{
  if (qword_8CF50 != -1) {
    dispatch_once(&qword_8CF50, &stru_757B8);
  }
  return (id)qword_8CF48;
}

- ($3CC2805F0189FCCE51047C0D2B5A52A9)calcColorStats:(SEL)a3
{
  v4 = __chkstk_darwin(retstr, self, a3, a4);
  v6 = v5;
  v7 = v4;
  *(void *)(v8 + 32) = 0;
  *(_OWORD *)uint64_t v8 = 0u;
  *(_OWORD *)(v8 + 16) = 0u;
  uint64_t v75 = v8;
  id v9 = [v7 _srgbToIPT];
  [v6 extent];
  v83 = v6;
  id v14 = objc_msgSend(v9, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v83, 1), v10, v11, v12, v13);
  id v15 = [v7 _rectToHueChroma];
  [v14 extent];
  id v82 = v14;
  id v72 = objc_msgSend(v15, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v82, 1), v16, v17, v18, v19);
  CIContextOption v80 = kCIContextWorkingFormat;
  v81 = +[NSNumber numberWithInt:kCIFormatRGBAh];
  v73 = +[CIContext contextWithOptions:](CIContext, "contextWithOptions:", +[NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1]);
  [v72 extent];
  CGRect v85 = CGRectIntegral(v84);
  double x = v85.origin.x;
  double y = v85.origin.y;
  double width = v85.size.width;
  double height = v85.size.height;
  unint64_t v24 = (unint64_t)v85.size.width;
  unint64_t v25 = (unint64_t)v85.size.height;
  unint64_t v26 = 4 * (unint64_t)v85.size.width;
  bzero(v79, 0xB40uLL);
  bzero(v77, 0xB40uLL);
  bzero(v78, 0x320uLL);
  bzero(v76, 0x320uLL);
  v27 = +[NSMutableData dataWithLength:v26 * v25];
  v28 = (char *)[(NSMutableData *)v27 bytes];
  v29 = CGColorSpaceCreateWithName(kCGColorSpaceLinearSRGB);
  id v30 = [(NSMutableData *)v27 mutableBytes];
  -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v73, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v72, v30, v26, kCIFormatRGBA8, v29, x, y, width, height);
  CGColorSpaceRelease(v29);
  if (v25)
  {
    uint64_t v34 = 0;
    v35 = v28 + 2;
    do
    {
      v36 = v35;
      for (unint64_t i = v24; i; --i)
      {
        LOBYTE(v31) = *(v36 - 2);
        LOBYTE(v32) = *(v36 - 1);
        float v38 = (double)*(unint64_t *)&v32 / 255.0;
        LOBYTE(v33) = *v36;
        unsigned int v39 = llround(v38 * 359.0);
        float v40 = (double)v33 / 255.0;
        *(double *)&v79[v39] = *(double *)&v79[v39] + 1.0;
        double v41 = v40;
        unint64_t v33 = 0x4059000000000000;
        int v42 = llround(v41 * 100.0 + -1.0);
        uint64_t v43 = v42 & ~(v42 >> 31);
        float v44 = (double)*(unint64_t *)&v31 / 255.0;
        double v32 = v78[v43] + 1.0;
        v78[v43] = v32;
        double v31 = v44;
        if (v31 > 0.9)
        {
          v77[v39] = v77[v39] + 1.0;
          double v31 = v76[v43] + 1.0;
          v76[v43] = v31;
        }
        v36 += 4;
      }
      ++v34;
      v35 += v26;
    }
    while (v34 != v25);
  }
  uint64_t v45 = 0;
  double v46 = 0.0;
  double v47 = 0.0;
  double v48 = 0.0;
  double v49 = 0.0;
  double v50 = 0.0;
  double v51 = 0.0;
  do
  {
    __double2 v52 = __sincos_stret(((double)(int)v45 / 180.0 + -1.0) * 3.14159265);
    double v53 = *(double *)&v79[v45];
    double v51 = v51 + v52.__cosval * v53;
    double v50 = v50 + v52.__sinval * v53;
    double v54 = v77[v45];
    double v49 = v49 + v53;
    double v48 = v48 + v52.__cosval * v54;
    double v47 = v47 + v52.__sinval * v54;
    double v46 = v46 + v53;
    ++v45;
  }
  while (v45 != 360);
  long double v55 = v48 / v46;
  long double v56 = v47 / v46;
  long double v57 = atan2(v50 / v49, v51 / v49);
  long double v58 = atan2(v56, v55);
  long double v59 = log(v50 / v49 * (v50 / v49) + v51 / v49 * (v51 / v49));
  uint64_t v60 = 0;
  *(long double *)uint64_t v75 = v57;
  *(double *)(v75 + 8) = sqrt(-v59);
  *(long double *)(v75 + 24) = v58;
  double v61 = 0.0;
  double v62 = 0.0;
  double v63 = 0.0;
  double v64 = 0.0;
  do
  {
    double v65 = (double)(int)v60 / 99.0;
    double v66 = v78[v60];
    double v64 = v64 + v65 * v66;
    double v63 = v63 + v66;
    double v67 = v76[v60];
    double v62 = v62 + v65 * v67;
    double v61 = v61 + v67;
    ++v60;
  }
  while (v60 != 100);
  *(double *)(v75 + 16) = v64 / v63;
  double v68 = v62 / v61;
  BOOL v69 = v61 <= 0.0;
  double v70 = 0.0;
  if (!v69) {
    double v70 = v68;
  }
  *(double *)(v75 + 32) = v70;
  return result;
}

- (id)sceneLuminance:(id)a3
{
  id v3 = [a3 properties];
  if (!v3) {
    return &off_7A410;
  }
  id v4 = [v3 objectForKey:@"{Exif}"];
  if (!v4) {
    return &off_7A410;
  }
  id v5 = [v4 objectForKey:@"BrightnessValue"];
  if (!v5) {
    return &off_7A410;
  }
  [v5 doubleValue];
  double v7 = exp2(v6) * 12.5;

  return +[NSNumber numberWithDouble:v7];
}

- (id)captureType:(id)a3
{
  id v3 = [a3 properties];
  if (!v3) {
    return &off_7A8D8;
  }
  id v4 = [v3 objectForKey:@"{MakerApple}"];
  id v5 = &off_7A8D8;
  if (v4)
  {
    id v6 = [v4 objectForKey:@"20"];
    if (v6) {
      return v6;
    }
  }
  return v5;
}

- (id)writeDebugData:(id)a3
{
  if (qword_8CF58 != -1) {
    dispatch_once(&qword_8CF58, &stru_757D8);
  }
  if (dword_8C8A8 < 0) {
    return a3;
  }

  return +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
}

- (id)overlayText:(id)a3 strength:(float)a4 captureType:(int)a5 bv:(float)a6
{
  [a3 extent];
  double v11 = v10;
  [a3 extent];
  if (v11 >= v12) {
    double v13 = v12;
  }
  else {
    double v13 = v11;
  }
  float v14 = v13;
  if (v14 >= 2320.0) {
    CFStringRef v15 = @"full";
  }
  else {
    CFStringRef v15 = @"proxy";
  }
  if (a5 == 11) {
    CFStringRef v16 = @"night mode";
  }
  else {
    CFStringRef v16 = @"normal";
  }
  id v17 = objc_alloc_init((Class)NSNumberFormatter);
  [v17 setNumberStyle:1];
  [v17 setMaximumFractionDigits:3];
  *(float *)&double v18 = a4;
  id v19 = objc_msgSend(v17, "stringFromNumber:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18));
  *(float *)&double v20 = a6;
  v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Strength: %@, CaptureType: %@, BV: %@, size: %@", v19, v16, objc_msgSend(v17, "stringFromNumber:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v20)), v15);

  v22 = +[CIFilter filterWithName:@"CITextImageGenerator"];
  [(CIFilter *)v22 setValue:v21 forKey:@"inputText"];
  [(CIFilter *)v22 setValue:&off_7A8F0 forKey:@"inputFontSize"];
  v23 = [(CIFilter *)v22 outputImage];
  unint64_t v24 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]);
  [(CIImage *)v23 extent];
  unint64_t v25 = -[CIImage imageByCompositingOverImage:](v23, "imageByCompositingOverImage:", -[CIImage imageByCroppingToRect:](v24, "imageByCroppingToRect:"));

  return [(CIImage *)v25 imageByCompositingOverImage:a3];
}

- (id)_softExposure
{
  if (qword_8CF68 != -1) {
    dispatch_once(&qword_8CF68, &stru_757F8);
  }
  return (id)qword_8CF60;
}

- (id)outputImage
{
  inputImage = self->inputImage;
  if (!inputImage) {
    return 0;
  }
  [(CIImage *)inputImage extent];
  double v5 = v4;
  [(CIImage *)self->inputImage extent];
  if (v5 >= v6) {
    double v7 = v5;
  }
  else {
    double v7 = v6;
  }
  float v8 = 1024.0 / v7;
  id v9 = self->inputImage;
  CGAffineTransformMakeScale(&v130, v8, v8);
  double v10 = [(CIImage *)v9 imageByApplyingTransform:&v130 highQualityDownsample:1];
  id v11 = [(CIDynamicRender *)self sceneLuminance:self->inputImage];
  id v12 = [(CIDynamicRender *)self captureType:self->inputImage];
  double v129 = 0.0;
  long long v127 = 0u;
  long long v128 = 0u;
  [(CIDynamicRender *)self calcColorStats:v10];
  double v13 = self->inputImage;
  id v14 = [(CIImage *)v10 smartToneStatistics];
  id v15 = [(CIImage *)v10 localLightStatisticsNoProxy];
  objc_msgSend(objc_msgSend(v14, "objectForKeyedSubscript:", @"p25"), "floatValue");
  float v17 = v16;
  objc_msgSend(objc_msgSend(v14, "objectForKeyedSubscript:", @"p50"), "floatValue");
  float v19 = v18;
  objc_msgSend(objc_msgSend(v14, "objectForKeyedSubscript:", @"p98"), "floatValue");
  float v21 = v20;
  float v22 = 0.8;
  if (v19 < 0.18 && v20 < 0.85)
  {
    float v23 = 0.18 - v19;
    float v22 = powf(v23, 0.75) + 1.0;
  }
  float v24 = v21 - v17;
  float v25 = 1.5;
  float v121 = 1.0;
  if ((float)(v21 - v17) <= 0.5) {
    float v26 = 1.0;
  }
  else {
    float v26 = 1.5;
  }
  objc_msgSend(objc_msgSend(v14, "objectForKeyedSubscript:", @"highKey"), "floatValue");
  float v28 = 1.25;
  if (*(float *)&v27 >= 0.5)
  {
    double v27 = v24;
    float v28 = 0.75;
    if (v24 >= 0.4)
    {
      double v27 = (float)(v19 - v17);
      float v25 = 1.0;
      if (v27 <= 0.2)
      {
        float v28 = 1.0;
      }
      else
      {
        double v27 = v22 * 1.1;
        float v22 = v27;
        float v25 = 1.6;
      }
    }
  }
  else
  {
    float v25 = 1.0;
  }
  objc_msgSend(v11, "floatValue", v27);
  if (v30 < 25.0 && [v12 intValue] == 11)
  {
    [v11 floatValue];
    float v32 = v31 * 0.013 + 0.675;
    [v11 floatValue];
    float v34 = v33 * -0.01 + 1.25;
    float v26 = v26 * v28;
    float v28 = v28 * v34;
    float v22 = v22 * v32;
    [v11 floatValue];
    float v36 = v35 * 0.006 + 0.85;
    [v11 floatValue];
    float v38 = v37 * 0.016 + 0.6;
    float v121 = v38;
    [v11 floatValue];
    double v40 = v39 * -0.04 + 1.0;
    objc_msgSend(objc_msgSend(v14, "objectForKeyedSubscript:", @"blackPoint"), "floatValue");
    float v42 = v40 * v41;
    float v122 = v42;
  }
  else
  {
    float v122 = 0.0;
    float v36 = 1.0;
  }
  [(NSNumber *)self->inputLocalLight floatValue];
  float v44 = v22 * v43;
  [(NSNumber *)self->inputShadows floatValue];
  float v46 = v22 * v45;
  [(NSNumber *)self->inputExposure floatValue];
  int v48 = v47;
  [(NSNumber *)self->inputBrightness floatValue];
  float v50 = v28 * v49;
  [(NSNumber *)self->inputHighlights floatValue];
  int v52 = v51;
  [(NSNumber *)self->inputContrast floatValue];
  float v54 = v26 * v53;
  v141[0] = @"inputLightMap";
  id v55 = [v15 objectForKeyedSubscript:@"lightMap"];
  v141[1] = @"inputGuideImage";
  v142[0] = v55;
  v142[1] = v13;
  long double v56 = [+[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", @"CIDynamicLocalLightMapPrepare", +[NSDictionary dictionaryWithObjects:v142 forKeys:v141 count:2]) outputImage];
  v139[0] = @"inputLocalLight";
  *(float *)&double v57 = v44;
  v140[0] = +[NSNumber numberWithFloat:v57];
  v139[1] = @"inputSmartShadows";
  *(float *)&double v58 = v46;
  long double v59 = +[NSNumber numberWithFloat:v58];
  v139[2] = @"inputLightMapImage";
  v140[1] = v59;
  v140[2] = v56;
  uint64_t v60 = [(CIImage *)v13 imageByApplyingFilter:@"CILLFilter" withInputParameters:+[NSDictionary dictionaryWithObjects:v140 forKeys:v139 count:3]];
  [(NSNumber *)self->inputSaturation floatValue];
  if (v129 > 0.2 || *(double *)&v128 > 0.2)
  {
    float v63 = v61 + -0.15;
    float v61 = v63;
  }
  float v64 = v36 * v61;
  v137[0] = @"inputStrength";
  [(NSNumber *)self->inputBrightSat floatValue];
  *(float *)&double v66 = v25 * v65;
  v138[0] = +[NSNumber numberWithFloat:v66];
  v137[1] = @"inputSat";
  *(float *)&double v67 = v64;
  v138[1] = +[NSNumber numberWithFloat:v67];
  v137[2] = @"inputPShift";
  int v68 = 0;
  v138[2] = +[NSNumber numberWithFloat:0.0];
  v137[3] = @"inputTShift";
  v138[3] = +[NSNumber numberWithFloat:0.0];
  BOOL v69 = [(CIImage *)v60 imageByApplyingFilter:@"CIBrightenSat" withInputParameters:+[NSDictionary dictionaryWithObjects:v138 forKeys:v137 count:4]];
  [v11 floatValue];
  if (*(float *)&v70 <= 1000.0)
  {
    int v68 = v48;
  }
  else
  {
    id v71 = [(CIDynamicRender *)self _softExposure];
    [(CIImage *)self->inputImage extent];
    v136 = v69;
    BOOL v69 = (CIImage *)objc_msgSend(v71, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v136, 1), v72, v73, v74, v75);
  }
  v134[0] = @"inputExposure";
  LODWORD(v70) = v68;
  v135[0] = +[NSNumber numberWithFloat:v70];
  v134[1] = @"inputBrightness";
  *(float *)&double v76 = v50;
  v135[1] = +[NSNumber numberWithFloat:v76];
  v134[2] = @"inputContrast";
  *(float *)&double v77 = v54;
  v135[2] = +[NSNumber numberWithFloat:v77];
  v134[3] = @"inputHighlights";
  LODWORD(v78) = v52;
  v135[3] = +[NSNumber numberWithFloat:v78];
  v134[4] = @"inputBlack";
  *(float *)&double v79 = v122;
  v135[4] = +[NSNumber numberWithFloat:v79];
  v29 = [(CIImage *)v69 imageByApplyingFilter:@"CISmartToneFilter" withInputParameters:+[NSDictionary dictionaryWithObjects:v135 forKeys:v134 count:5]];
  [(NSNumber *)self->inputStrength floatValue];
  float v80 = 1.0;
  if (v81 < 1.0)
  {
    [(NSNumber *)self->inputStrength floatValue];
    float v83 = v82;
    [(NSNumber *)self->inputConfidence floatValue];
    float v85 = v84;
    [(NSNumber *)self->inputLowConfidence floatValue];
    float v87 = v85 - v86;
    [(NSNumber *)self->inputHighConfidence floatValue];
    float v89 = v88;
    [(NSNumber *)self->inputLowConfidence floatValue];
    double v91 = (float)(v87 / (float)(v89 - v90));
    if (v91 < 0.0) {
      double v91 = 0.0;
    }
    float v92 = fmin(v91, 1.0);
    double v93 = (v92 * -2.0 + 3.0) * (float)(v92 * v92);
    float v94 = v93;
    inputFaceBoxArradouble y = self->inputFaceBoxArray;
    if (inputFaceBoxArray && [(NSArray *)inputFaceBoxArray count])
    {
      id v120 = v12;
      long long v125 = 0u;
      long long v126 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      v96 = self->inputFaceBoxArray;
      id v97 = [(NSArray *)v96 countByEnumeratingWithState:&v123 objects:v133 count:16];
      if (v97)
      {
        id v98 = v97;
        uint64_t v99 = *(void *)v124;
        float v100 = 0.0;
        do
        {
          for (unint64_t i = 0; i != v98; unint64_t i = (char *)i + 1)
          {
            if (*(void *)v124 != v99) {
              objc_enumerationMutation(v96);
            }
            v102 = *(void **)(*((void *)&v123 + 1) + 8 * i);
            objc_msgSend(objc_msgSend(v102, "objectForKeyedSubscript:", @"w"), "floatValue");
            double v104 = v103;
            [(CIImage *)self->inputImage extent];
            float v106 = v105 * v104;
            objc_msgSend(objc_msgSend(v102, "objectForKeyedSubscript:", @"h"), "floatValue");
            double v108 = v107;
            [(CIImage *)self->inputImage extent];
            float v110 = v109 * v108;
            if (v106 >= v110) {
              float v110 = v106;
            }
            if (v110 > v100) {
              float v100 = v110;
            }
          }
          id v98 = [(NSArray *)v96 countByEnumeratingWithState:&v123 objects:v133 count:16];
        }
        while (v98);
      }
      else
      {
        float v100 = 0.0;
      }
      [(NSNumber *)self->inputMaxFaceSize floatValue];
      float v112 = fminf(v100 / v111, 1.0);
      double v93 = 1.0 - (float)(v112 * (float)(v112 * v112)) * (v112 * -2.0 + 3.0);
      float v80 = v93;
      id v12 = v120;
    }
    v113 = self->inputImage;
    v131[0] = @"inputBackgroundImage";
    v131[1] = @"inputAmount";
    v132[0] = v113;
    float v114 = v121 * (float)((float)(v83 * v94) * v80);
    *(float *)&double v93 = v114;
    v132[1] = +[NSNumber numberWithFloat:v93];
    v29 = [(CIImage *)v29 imageByApplyingFilter:@"CIMix" withInputParameters:+[NSDictionary dictionaryWithObjects:v132 forKeys:v131 count:2]];
    if ((int)objc_msgSend(-[CIDynamicRender writeDebugData:](self, "writeDebugData:", &off_7A908), "intValue") >= 1)
    {
      id v115 = [v12 intValue];
      [v11 floatValue];
      LODWORD(v117) = v116;
      *(float *)&double v118 = v114;
      return [(CIDynamicRender *)self overlayText:v29 strength:v115 captureType:v118 bv:v117];
    }
  }
  return v29;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputStrength
{
  return self->inputStrength;
}

- (void)setInputStrength:(id)a3
{
}

- (CIImage)inputSkyMask
{
  return self->inputSkyMask;
}

- (void)setInputSkyMask:(id)a3
{
}

- (NSNumber)inputIsSunsetSunrise
{
  return self->inputIsSunsetSunrise;
}

- (void)setInputIsSunsetSunrise:(id)a3
{
}

- (NSNumber)inputLocalLight
{
  return self->inputLocalLight;
}

- (void)setInputLocalLight:(id)a3
{
}

- (NSNumber)inputShadows
{
  return self->inputShadows;
}

- (void)setInputShadows:(id)a3
{
}

- (NSNumber)inputExposure
{
  return self->inputExposure;
}

- (void)setInputExposure:(id)a3
{
}

- (NSNumber)inputBrightness
{
  return self->inputBrightness;
}

- (void)setInputBrightness:(id)a3
{
}

- (NSNumber)inputHighlights
{
  return self->inputHighlights;
}

- (void)setInputHighlights:(id)a3
{
}

- (NSNumber)inputContrast
{
  return self->inputContrast;
}

- (void)setInputContrast:(id)a3
{
}

- (NSNumber)inputWhiteBalance
{
  return self->inputWhiteBalance;
}

- (void)setInputWhiteBalance:(id)a3
{
}

- (NSNumber)inputSaturation
{
  return self->inputSaturation;
}

- (void)setInputSaturation:(id)a3
{
}

- (NSNumber)inputBrightSat
{
  return self->inputBrightSat;
}

- (void)setInputBrightSat:(id)a3
{
}

- (NSNumber)inputConfidence
{
  return self->inputConfidence;
}

- (void)setInputConfidence:(id)a3
{
}

- (NSNumber)inputLowConfidence
{
  return self->inputLowConfidence;
}

- (void)setInputLowConfidence:(id)a3
{
}

- (NSNumber)inputHighConfidence
{
  return self->inputHighConfidence;
}

- (void)setInputHighConfidence:(id)a3
{
}

- (NSNumber)inputMaxFaceSize
{
  return self->inputMaxFaceSize;
}

- (void)setInputMaxFaceSize:(id)a3
{
}

- (NSArray)inputFaceBoxArray
{
  return self->inputFaceBoxArray;
}

- (void)setInputFaceBoxArray:(id)a3
{
}

@end