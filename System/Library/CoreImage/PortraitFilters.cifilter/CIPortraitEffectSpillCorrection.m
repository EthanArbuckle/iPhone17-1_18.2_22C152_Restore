@interface CIPortraitEffectSpillCorrection
+ (id)customAttributes;
- (CIColor)bgColor;
- (CIImage)inputImage;
- (CIImage)inputMatte;
- (NSNumber)inputRenderCache;
- (id)outputImage;
- (id)outputImageOfTile:(id)a3 rgb:(id)a4;
- (void)setBgColor:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputMatte:(id)a3;
- (void)setInputRenderCache:(id)a3;
@end

@implementation CIPortraitEffectSpillCorrection

+ (id)customAttributes
{
  return &__NSDictionary0__struct;
}

- (id)outputImageOfTile:(id)a3 rgb:(id)a4
{
  uint64_t v24 = 0;
  [a4 extent];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v29[0] = a4;
  v29[1] = a3;
  v15 = +[NSArray arrayWithObjects:v29 count:2];
  bgColor = self->bgColor;
  CFStringRef v27 = @"bgColor";
  v28 = bgColor;
  v17 = (CIImage *)+[CIPortraitEffectSpillCorrectionProcessor applyWithExtent:inputs:arguments:error:](CIPortraitEffectSpillCorrectionProcessor, "applyWithExtent:inputs:arguments:error:", v15, +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1], &v24, v8, v10, v12, v14);
  if (v24) {
    NSLog(@"Error = %@", v24);
  }
  if ([(NSNumber *)self->inputRenderCache intValue] >= 1)
  {
    CVPixelBufferRef pixelBufferOut = 0;
    [(CIImage *)v17 extent];
    size_t v19 = (unint64_t)v18;
    [(CIImage *)v17 extent];
    CFStringRef v25 = kCVPixelBufferIOSurfacePropertiesKey;
    v26 = &__NSDictionary0__struct;
    CVPixelBufferCreate(0, v19, (unint64_t)v20, 0x42475241u, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1], &pixelBufferOut);
    v21 = +[CIContext context];
    [(CIContext *)v21 render:v17 toCVPixelBuffer:pixelBufferOut];
    v17 = +[CIImage imageWithCVPixelBuffer:pixelBufferOut];
    CVPixelBufferRelease(pixelBufferOut);
  }
  return v17;
}

- (id)outputImage
{
  [(CIImage *)self->inputImage extent];
  float v4 = v3;
  [(CIImage *)self->inputMatte extent];
  float v6 = v5;
  float v7 = v4 / v6;
  [(CIImage *)self->inputImage extent];
  float v9 = v8;
  [(CIImage *)self->inputMatte extent];
  float v11 = v10;
  inputImage = self->inputImage;
  CGAffineTransformMakeScale(&v63, 1.0 / v7, 1.0 / (float)(v9 / v11));
  double v13 = [(CIImage *)inputImage imageByApplyingTransform:&v63];
  [(CIImage *)self->inputMatte extent];
  double v14 = -[CIImage imageByCroppingToRect:](v13, "imageByCroppingToRect:");
  v15 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor blackColor]);
  v55 = v14;
  [(CIImage *)v14 extent];
  v16 = -[CIImage imageByCroppingToRect:](v15, "imageByCroppingToRect:");
  [(CIImage *)v16 extent];
  float64_t v58 = v17;
  [(CIImage *)v16 extent];
  int v56 = 0;
  v18.f64[0] = v58;
  v18.f64[1] = v19;
  __asm { FMOV            V0.2D, #0.5 }
  *(int32x2_t *)&_Q0.f64[0] = vmovn_s64(vcvtq_s64_f64(vmulq_f64(v18, _Q0)));
  __asm { FMOV            V2.2S, #1.25 }
  *(int32x2_t *)&v18.f64[0] = vcvt_s32_f32(vmul_f32(vcvt_f32_u32(*(uint32x2_t *)&_Q0.f64[0]), _D2));
  *(int32x2_t *)&_Q0.f64[0] = vsub_s32(*(int32x2_t *)&_Q0.f64[0], *(int32x2_t *)&v18.f64[0]);
  double v52 = (double)LODWORD(v18.f64[0]);
  int32x2_t v53 = vadd_s32(vadd_s32(*(int32x2_t *)&_Q0.f64[0], *(int32x2_t *)&_Q0.f64[0]), *(int32x2_t *)&v18.f64[0]);
  int32x2_t v54 = *(int32x2_t *)&v18.f64[0];
  char v25 = 1;
  double v51 = (double)HIDWORD(v18.f64[0]);
  do
  {
    int v26 = 0;
    char v50 = v25;
    char v27 = 1;
    do
    {
      int32x2_t v57 = (int32x2_t)__PAIR64__(v56, v26);
      int32x2_t v59 = vmul_s32((int32x2_t)__PAIR64__(v56, v26), v53);
      char v28 = v27;
      id v29 = -[CIPortraitEffectSpillCorrection outputImageOfTile:rgb:](self, "outputImageOfTile:rgb:", -[CIImage imageByCroppingToRect:](self->inputMatte, "imageByCroppingToRect:", (double)v59.u16[0], (double)v59.u16[2], v52, v51), -[CIImage imageByCroppingToRect:](v55, "imageByCroppingToRect:", (double)v59.u16[0], (double)v59.u16[2], v52, v51));
      int32x2_t v30 = vmla_s32(v54, vadd_s32(v57, (int32x2_t)0xFFFF0000FFFFLL), v53);
      int32x2_t v31 = vtst_s32(v57, (int32x2_t)0xFFFF0000FFFFLL);
      HIWORD(v62) = v31.i16[2];
      LOWORD(v62) = v31.i16[0];
      _ZF = v31.u16[0] == 0;
      int32x2_t v33 = vmul_s32(vadd_s32(v57, (int32x2_t)0x100000001), v53);
      if (_ZF) {
        unsigned __int16 v34 = 0;
      }
      else {
        unsigned __int16 v34 = v30.i16[0];
      }
      HIWORD(v61) = v33.i16[2];
      LOWORD(v61) = v33.i16[0];
      int32x2_t v35 = vadd_s32(v59, v54);
      HIWORD(v60) = v35.i16[2];
      LOWORD(v60) = v35.i16[0];
      if (_ZF) {
        unsigned __int16 v36 = v61;
      }
      else {
        unsigned __int16 v36 = v35.i16[0];
      }
      if (v62 >= 0x10000) {
        unsigned __int16 v37 = v30.u16[2];
      }
      else {
        unsigned __int16 v37 = 0;
      }
      if (v62 >= 0x10000) {
        unsigned int v38 = v60;
      }
      else {
        unsigned int v38 = v61;
      }
      if (qword_8CF00 != -1) {
        dispatch_once(&qword_8CF00, &stru_75680);
      }
      v39 = (void *)qword_8CEF8;
      if (!qword_8CEF8) {
        sub_4C544();
      }
      [(CIImage *)v16 extent];
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;
      double v47 = v46;
      v64[0] = v16;
      v64[1] = v29;
      [v29 extent];
      v64[2] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
      v64[3] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", (double)v34, (double)v37, (double)(v36 - v34), (double)(int)(HIWORD(v38) - v37));
      v48 = (CIImage *)objc_msgSend(v39, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v64, 4), v41, v43, v45, v47);
      v16 = v48;
      char v27 = 0;
      int v26 = 1;
    }
    while ((v28 & 1) != 0);
    char v25 = 0;
    int v56 = 1;
  }
  while ((v50 & 1) != 0);
  return [(CIImage *)v48 imageByInsertingIntermediate:0];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputMatte
{
  return self->inputMatte;
}

- (void)setInputMatte:(id)a3
{
}

- (CIColor)bgColor
{
  return self->bgColor;
}

- (void)setBgColor:(id)a3
{
}

- (NSNumber)inputRenderCache
{
  return self->inputRenderCache;
}

- (void)setInputRenderCache:(id)a3
{
}

@end