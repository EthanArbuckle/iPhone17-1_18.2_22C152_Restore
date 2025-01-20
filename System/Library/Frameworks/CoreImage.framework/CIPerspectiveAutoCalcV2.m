@interface CIPerspectiveAutoCalcV2
- (BOOL)compute;
- (CIPerspectiveAutoCalcV2)initWithContext:(id)a3 image:(id)a4 config:(id *)a5;
- (double)unlimitedPitch;
- (double)unlimitedRoll;
- (double)unlimitedYaw;
- (float)evaluateCost:(CIPerspectiveAutoCalcV2 *)self;
- (float)evaluateCostXZ:(CIPerspectiveAutoCalcV2 *)self;
- (float)evaluateCostYZ:(CIPerspectiveAutoCalcV2 *)self;
- (id).cxx_construct;
- (void)clusterLineSegments;
- (void)computeConfidence;
- (void)createGradientMap;
- (void)dealloc;
- (void)extractLineSegments;
- (void)normalizeGradientMap;
- (void)runOptimization;
- (void)setupCostFunction;
- (void)standardizeImage;
- (void)thresholdGradientMap;
@end

@implementation CIPerspectiveAutoCalcV2

- (CIPerspectiveAutoCalcV2)initWithContext:(id)a3 image:(id)a4 config:(id *)a5
{
  v26.receiver = self;
  v26.super_class = (Class)CIPerspectiveAutoCalcV2;
  v5 = [(CIPerspectiveAutoCalc *)&v26 initWithContext:a3 image:a4 config:a5];
  [(CIImage *)v5->super.img extent];
  *(float *)&unsigned int v7 = v6;
  v9.f64[1] = v8;
  *(float *)&float64_t v8 = v10;
  float v23 = *(float *)&v8;
  float v24 = *(float *)&v7;
  int32x2_t v25 = (int32x2_t)vmla_f32(vcvt_f32_f64(v9), (float32x2_t)0x3F0000003F000000, (float32x2_t)__PAIR64__(LODWORD(v8), v7));
  float focalLength = v5->super.config.focalLength;
  float v12 = focalLength / hypotf(36.0, 24.0);
  float v13 = hypotf(v24, v23);
  v15.i64[0] = COERCE_UNSIGNED_INT(v12 * v13);
  v15.u64[1] = (unint64_t)v25;
  v27.columns[0].i32[1] = 0;
  v27.columns[0].i64[1] = 0;
  v27.columns[0].f32[0] = v12 * v13;
  *(float *)v14.i32 = v27.columns[0].f32[0];
  __asm { FMOV            V3.4S, #1.0 }
  int32x4_t v21 = vzip2q_s32(v15, _Q3);
  *(int32x2_t *)_Q3.i8 = vdup_lane_s32(v25, 1);
  v27.columns[2] = (simd_float3)vzip1q_s32(v21, _Q3);
  v27.columns[1] = (simd_float3)vzip2q_s32((int32x4_t)v27.columns[0].u32[0], vdupq_lane_s32(v14, 0));
  *(_OWORD *)v5->_anon_90 = v27.columns[0].u32[0];
  *(simd_float3 *)&v5->_anon_90[16] = v27.columns[1];
  *(simd_float3 *)&v5->_anon_90[32] = v27.columns[2];
  simd_float3x3 v28 = __invert_f3(v27);
  *(void *)v5->_anon_c0 = v28.columns[0].i64[0];
  *(_DWORD *)&v5->_anon_c0[8] = v28.columns[0].i32[2];
  *(_DWORD *)&v5->_anon_c0[24] = v28.columns[1].i32[2];
  *(void *)&v5->_anon_c0[16] = v28.columns[1].i64[0];
  *(_DWORD *)&v5->_anon_c0[40] = v28.columns[2].i32[2];
  *(void *)&v5->_anon_c0[32] = v28.columns[2].i64[0];
  v5->super.confidence = -1.0;
  return v5;
}

- (void)dealloc
{
  free(*(void **)self->gradMapBmp);
  v3.receiver = self;
  v3.super_class = (Class)CIPerspectiveAutoCalcV2;
  [(CIPerspectiveAutoCalc *)&v3 dealloc];
}

- (BOOL)compute
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  self->super.pitchFailureReason = 0;
  self->super.yawFailureReason = 0;
  objc_super v3 = ci_signpost_log_perspectiveAC();
  v4 = ci_signpost_log_perspectiveAC();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v3))
    {
      [(CIImage *)self->super.img extent];
      int v8 = (int)v7;
      [(CIImage *)self->super.img extent];
      v46[0] = 67109376;
      v46[1] = v8;
      __int16 v47 = 1024;
      int v48 = (int)v9;
      _os_signpost_emit_with_name_impl(&dword_193671000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v6, "compute", "imageSize: %d x %d", (uint8_t *)v46, 0xEu);
    }
  }
  [(CIPerspectiveAutoCalcV2 *)self standardizeImage];
  [(CIPerspectiveAutoCalcV2 *)self createGradientMap];
  [(CIPerspectiveAutoCalcV2 *)self normalizeGradientMap];
  [(CIPerspectiveAutoCalcV2 *)self thresholdGradientMap];
  [(CIPerspectiveAutoCalcV2 *)self extractLineSegments];
  [(CIPerspectiveAutoCalcV2 *)self clusterLineSegments];
  if ([(CIPerspectiveAutoCalc *)self generateDebugImage])
  {
    img = self->super.img;
    self->super.debugImage = img;
    v11 = CGColorCreateSRGB(0.0, 1.0, 0.0, 1.0);
    float v12 = (CIImage *)CI::Perspective::plotLines<CI::Perspective::Line>(img, v11, (uint64_t **)&self->vClusterInliers);
    self->super.debugImage = v12;
    float v13 = CGColorCreateSRGB(1.0, 1.0, 0.0, 1.0);
    int32x2_t v14 = (CIImage *)CI::Perspective::plotLines<CI::Perspective::Line>(v12, v13, (uint64_t **)&self->vClusterOutliers);
    self->super.debugImage = v14;
    int32x4_t v15 = CGColorCreateSRGB(0.0, 1.0, 1.0, 1.0);
    v16 = (CIImage *)CI::Perspective::plotLines<CI::Perspective::Line>(v14, v15, (uint64_t **)&self->hClusterInliers);
    self->super.debugImage = v16;
    v17 = CGColorCreateSRGB(1.0, 0.0, 0.0, 1.0);
    self->super.debugImage = (CIImage *)CI::Perspective::plotLines<CI::Perspective::Line>(v16, v17, (uint64_t **)&self->hClusterOutliers);
  }
  [(CIPerspectiveAutoCalcV2 *)self setupCostFunction];
  [(CIPerspectiveAutoCalcV2 *)self runOptimization];
  [(CIPerspectiveAutoCalcV2 *)self computeConfidence];
  if ([(CIPerspectiveAutoCalc *)self generateDebugImage])
  {
    debugImage = self->super.debugImage;
    float pitch = self->super.pitch;
    float yaw = self->super.yaw;
    float roll = self->super.roll;
    v22 = +[CIFilter filterWithName:@"CIPerspectiveRotate"];
    [(CIFilter *)v22 setValue:debugImage forKey:@"inputImage"];
    *(float *)&double v23 = pitch;
    -[CIFilter setValue:forKey:](v22, "setValue:forKey:", [NSNumber numberWithFloat:v23], @"inputPitch");
    *(float *)&double v24 = yaw;
    -[CIFilter setValue:forKey:](v22, "setValue:forKey:", [NSNumber numberWithFloat:v24], @"inputYaw");
    *(float *)&double v25 = roll;
    -[CIFilter setValue:forKey:](v22, "setValue:forKey:", [NSNumber numberWithFloat:v25], @"inputRoll");
    objc_super v26 = [(CIFilter *)v22 outputImage];
    self->super.debugImage = v26;
    [(CIImage *)v26 extent];
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    v35 = +[CIFilter filterWithName:@"CICheckerboardGenerator"];
    v50.origin.x = v28;
    v50.origin.y = v30;
    v50.size.width = v32;
    v50.size.height = v34;
    double MidX = CGRectGetMidX(v50);
    v51.origin.x = v28;
    v51.origin.y = v30;
    v51.size.width = v32;
    v51.size.height = v34;
    [(CIFilter *)v35 setValue:+[CIVector vectorWithX:MidX Y:CGRectGetMidY(v51)] forKey:@"inputCenter"];
    if (v32 >= v34) {
      double v37 = v34;
    }
    else {
      double v37 = v32;
    }
    -[CIFilter setValue:forKey:](v35, "setValue:forKey:", [NSNumber numberWithDouble:v37 * 0.05], @"inputWidth");
    uint64_t v38 = -[CIImage imageByCroppingToRect:]([(CIFilter *)v35 outputImage], "imageByCroppingToRect:", v28, v30, v32, v34);
    v39 = +[CIFilter filterWithName:@"CIBlendWithAlphaMask"];
    v40 = -[CIImage imageByCroppingToRect:](+[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.95)), "imageByCroppingToRect:", v28, v30, v32, v34);
    [(CIFilter *)v39 setValue:v26 forKey:@"inputImage"];
    [(CIFilter *)v39 setValue:v38 forKey:@"inputBackgroundImage"];
    [(CIFilter *)v39 setValue:v40 forKey:@"inputMaskImage"];
    self->super.debugImage = [(CIImage *)[(CIFilter *)v39 outputImage] imageByCompositingOverImage:v38];
  }
  v41 = ci_signpost_log_perspectiveAC();
  v42 = ci_signpost_log_perspectiveAC();
  os_signpost_id_t v43 = os_signpost_id_make_with_pointer(v42, self);
  if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v44 = v43;
    if (os_signpost_enabled(v41))
    {
      LOWORD(v46[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_193671000, v41, OS_SIGNPOST_INTERVAL_END, v44, "compute", "", (uint8_t *)v46, 2u);
    }
  }
  return 1;
}

- (void)standardizeImage
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  objc_super v3 = ci_signpost_log_perspectiveAC();
  v4 = ci_signpost_log_perspectiveAC();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);
  if (v5 - 1 < 0xFFFFFFFFFFFFFFFELL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v3))
    {
      [(CIImage *)self->super.img extent];
      uint64_t v8 = v7;
      [(CIImage *)self->super.img extent];
      *(_DWORD *)buf = 134218240;
      uint64_t v42 = v8;
      __int16 v43 = 2048;
      uint64_t v44 = v9;
      _os_signpost_emit_with_name_impl(&dword_193671000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v6, "StandardizeImage", "imageSize: %f x %f", buf, 0x16u);
    }
  }
  [(CIImage *)self->super.img extent];
  float64_t v36 = v13;
  float64_t v37 = v12;
  if (v10 <= v11) {
    double v14 = v11;
  }
  else {
    double v14 = v10;
  }
  float v15 = v14 * 0.0009765625;
  float v16 = logf(v15);
  *(float *)&unsigned int v17 = 1.0 / exp2(ceilf(v16));
  double v18 = (float)-*(float *)&v17;
  v46.columns[1].i32[0] = 0;
  v46.columns[1].i64[1] = 0;
  v46.columns[0] = (simd_float3)v17;
  v46.columns[1].i32[1] = v17;
  *(_OWORD *)self->_anon_f0 = v17;
  *(_OWORD *)&self->_anon_f0[16] = v46.columns[1].u64[0];
  double v19 = *(float *)&v17;
  v20.f64[0] = v37;
  v20.f64[1] = v36;
  *(float32x2_t *)v21.i8 = vcvt_f32_f64(vmulq_n_f64(v20, v18));
  float32x2_t v38 = *(float32x2_t *)v21.i8;
  int32x4_t v22 = vuzp2q_s32(v21, vzip1q_s32(v21, v21));
  __asm { FMOV            V3.4S, #1.0 }
  v46.columns[2] = (simd_float3)vzip1q_s32(vzip2q_s32(v22, _Q3), v22);
  *(simd_float3 *)&self->_anon_f0[32] = v46.columns[2];
  simd_float3x3 v47 = __invert_f3(v46);
  *(void *)self->_anon_120 = v47.columns[0].i64[0];
  *(_DWORD *)&self->_anon_120[8] = v47.columns[0].i32[2];
  *(void *)&self->_anon_120[16] = v47.columns[1].i64[0];
  *(_DWORD *)&self->_anon_120[24] = v47.columns[1].i32[2];
  *(void *)&self->_anon_120[32] = v47.columns[2].i64[0];
  *(_DWORD *)&self->_anon_120[40] = v47.columns[2].i32[2];
  v39[1] = 0;
  v39[2] = 0;
  img = self->super.img;
  *(double *)v39 = v19;
  *(double *)&v39[3] = v19;
  float64x2_t v40 = vcvtq_f64_f32(v38);
  self->super.img = [(CIImage *)img imageByApplyingTransform:v39 highQualityDownsample:1];
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1) {
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_51);
  }
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    double v29 = self->super.img;
    double v30 = (CIImage *)[NSString stringWithFormat:@"/tmp/PerspectiveV2_%@.png", @"0_standardized"];
    CI::Perspective::CIImageToFile((CI::Perspective *)v29, v30, v31, *MEMORY[0x1E4F1DB20]);
  }
  double v32 = ci_signpost_log_perspectiveAC();
  double v33 = ci_signpost_log_perspectiveAC();
  os_signpost_id_t v34 = os_signpost_id_make_with_pointer(v33, self);
  if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v35 = v34;
    if (os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193671000, v32, OS_SIGNPOST_INTERVAL_END, v35, "StandardizeImage", "", buf, 2u);
    }
  }
}

- (void)createGradientMap
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  objc_super v3 = ci_signpost_log_perspectiveAC();
  v4 = ci_signpost_log_perspectiveAC();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v3))
    {
      unint64_t gradMapW = self->gradMapW;
      unint64_t gradMapH = self->gradMapH;
      *(_DWORD *)buf = 134218240;
      unint64_t v46 = gradMapW;
      __int16 v47 = 2048;
      unint64_t v48 = gradMapH;
      _os_signpost_emit_with_name_impl(&dword_193671000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CreateGradientMap", "gradMapSize: %lu x %lu", buf, 0x16u);
    }
  }
  [(CIImage *)self->super.img extent];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  self->unint64_t gradMapW = (unint64_t)v13;
  self->unint64_t gradMapH = (unint64_t)v15;
  unsigned int v17 = [(CIImage *)self->super.img imageByApplyingFilter:@"CIColorControls" withInputParameters:&unk_1EE4AB1F8];
  double v18 = +[CIKernel kernelWithInternalRepresentation:&CI::_lumaRange];
  v44[0] = self->super.img;
  v44[1] = &unk_1EE4AB6B0;
  v44[2] = &unk_1EE4AB6C0;
  uint64_t v19 = -[CIColorKernel applyWithExtent:arguments:](v18, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3], v10, v12, v14, v16);
  float64x2_t v20 = +[CIFilter filterWithName:@"CIBlendWithMask"];
  [(CIFilter *)v20 setValue:self->super.img forKey:@"inputImage"];
  [(CIFilter *)v20 setValue:v17 forKey:@"inputBackgroundImage"];
  [(CIFilter *)v20 setValue:v19 forKey:@"inputMaskImage"];
  int32x4_t v21 = [(CIFilter *)v20 outputImage];
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1) {
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_51);
  }
  int32x4_t v22 = (CGRect *)MEMORY[0x1E4F1DB20];
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    double v23 = (CIImage *)[NSString stringWithFormat:@"/tmp/PerspectiveV2_%@.png", @"0_Enhanced"];
    CI::Perspective::CIImageToFile(v21, v23, v24, *v22);
  }
  double v25 = (CI::Perspective *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[CI::Perspective imageByApplyingFilter:](v21, "imageByApplyingFilter:", @"CILinearToSRGBToneCurve"), "imageByClampingToExtent"), "imageByApplyingGaussianBlurWithSigma:", 1.4), "imageByCroppingToRect:", v10, v12, v14, v16);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1) {
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_51);
  }
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    objc_super v26 = (CIImage *)[NSString stringWithFormat:@"/tmp/PerspectiveV2_%@.png", @"1_Preprocessed"];
    CI::Perspective::CIImageToFile(v25, v26, v27, *v22);
  }
  double v28 = (CIImage *)[(CI::Perspective *)v25 imageByApplyingFilter:@"CIGaborGradients"];
  self->gradMap = v28;
  [(CIImage *)v28 extent];
  CGRect v51 = CGRectInset(v50, 5.0, 5.0);
  double v29 = -[CIImage imageByCroppingToRect:](v28, "imageByCroppingToRect:", v51.origin.x, v51.origin.y, v51.size.width, v51.size.height);
  self->gradMap = v29;
  double v30 = [(CIImage *)v29 imageByCompositingOverImage:+[CIImage blackImage]];
  self->gradMap = v30;
  double v31 = -[CIImage imageByCroppingToRect:](v30, "imageByCroppingToRect:", v10, v12, v14, v16);
  self->gradMap = v31;
  self->gradMap = [(CIImage *)v31 imageByInsertingIntermediate:1];
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1) {
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_51);
  }
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    double v33 = CI::Perspective::gradDirImage((CI::Perspective *)self->gradMap, v32);
    os_signpost_id_t v34 = (CIImage *)[NSString stringWithFormat:@"/tmp/PerspectiveV2_%@.png", @"2_GradMap_dir"];
    CI::Perspective::CIImageToFile((CI::Perspective *)v33, v34, v35, *v22);
    float64_t v37 = CI::Perspective::gradMagImage((CI::Perspective *)self->gradMap, v36);
    float32x2_t v38 = (CIImage *)[NSString stringWithFormat:@"/tmp/PerspectiveV2_%@.png", @"2_GradMap_mag"];
    CI::Perspective::CIImageToFile((CI::Perspective *)v37, v38, v39, *v22);
  }
  float64x2_t v40 = ci_signpost_log_perspectiveAC();
  v41 = ci_signpost_log_perspectiveAC();
  os_signpost_id_t v42 = os_signpost_id_make_with_pointer(v41, self);
  if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v43 = v42;
    if (os_signpost_enabled(v40))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193671000, v40, OS_SIGNPOST_INTERVAL_END, v43, "CreateGradientMap", "", buf, 2u);
    }
  }
}

- (void)normalizeGradientMap
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  objc_super v3 = ci_signpost_log_perspectiveAC();
  v4 = ci_signpost_log_perspectiveAC();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v3))
    {
      unint64_t gradMapW = self->gradMapW;
      unint64_t gradMapH = self->gradMapH;
      *(_DWORD *)buf = 134218240;
      unint64_t v38 = gradMapW;
      __int16 v39 = 2048;
      unint64_t v40 = gradMapH;
      _os_signpost_emit_with_name_impl(&dword_193671000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v6, "NormalizeGradientMap", "gradMapSize: %lu x %lu", buf, 0x16u);
    }
  }
  [(CIImage *)self->gradMap extent];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = CI::Perspective::gradMagImage((CI::Perspective *)self->gradMap, v17);
  os_signpost_id_t v35 = @"inputExtent";
  [(CIImage *)v18 extent];
  float64_t v36 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  uint64_t v19 = -[CIImage imageByApplyingFilter:withInputParameters:](v18, "imageByApplyingFilter:withInputParameters:", @"CIAreaMinMaxRed", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1]);
  float64x2_t v20 = +[CIKernel kernelWithInternalRepresentation:&CI::_gradientNormalizeV2];
  v34[0] = self->gradMap;
  v34[1] = v19;
  self->gradMap = -[CIColorKernel applyWithExtent:arguments:](v20, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2], v10, v12, v14, v16);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1) {
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_51);
  }
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    int32x4_t v22 = CI::Perspective::gradDirImage((CI::Perspective *)self->gradMap, v21);
    double v23 = (CIImage *)[NSString stringWithFormat:@"/tmp/PerspectiveV2_%@.png", @"3_GradMapNormalized_dir"];
    double v24 = (CGRect *)MEMORY[0x1E4F1DB20];
    CI::Perspective::CIImageToFile((CI::Perspective *)v22, v23, v25, *MEMORY[0x1E4F1DB20]);
    double v27 = CI::Perspective::gradMagImage((CI::Perspective *)self->gradMap, v26);
    double v28 = (CIImage *)[NSString stringWithFormat:@"/tmp/PerspectiveV2_%@.png", @"3_GradMapNormalized_mag"];
    CI::Perspective::CIImageToFile((CI::Perspective *)v27, v28, v29, *v24);
  }
  double v30 = ci_signpost_log_perspectiveAC();
  double v31 = ci_signpost_log_perspectiveAC();
  os_signpost_id_t v32 = os_signpost_id_make_with_pointer(v31, self);
  if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v33 = v32;
    if (os_signpost_enabled(v30))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193671000, v30, OS_SIGNPOST_INTERVAL_END, v33, "NormalizeGradientMap", "", buf, 2u);
    }
  }
}

- (void)thresholdGradientMap
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  objc_super v3 = ci_signpost_log_perspectiveAC();
  v4 = ci_signpost_log_perspectiveAC();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v3))
    {
      unint64_t gradMapW = self->gradMapW;
      unint64_t gradMapH = self->gradMapH;
      *(_DWORD *)buf = 134218240;
      unint64_t v33 = gradMapW;
      __int16 v34 = 2048;
      unint64_t v35 = gradMapH;
      _os_signpost_emit_with_name_impl(&dword_193671000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ThresholdGradientMap", "gradMapSize: %lu x %lu", buf, 0x16u);
    }
  }
  [(CIImage *)self->gradMap extent];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  unsigned int v17 = +[CIKernel kernelWithInternalRepresentation:&CI::_gradientThresholdV2];
  v31[0] = self->gradMap;
  v31[1] = &unk_1EE4AB6D0;
  v31[2] = &unk_1EE4AB6E0;
  self->gradMap = -[CIColorKernel applyWithExtent:arguments:](v17, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3], v10, v12, v14, v16);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1) {
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_51);
  }
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    uint64_t v19 = CI::Perspective::gradDirImage((CI::Perspective *)self->gradMap, v18);
    float64x2_t v20 = (CIImage *)[NSString stringWithFormat:@"/tmp/PerspectiveV2_%@.png", @"4_GradMapThresholded_dir"];
    int32x4_t v21 = (CGRect *)MEMORY[0x1E4F1DB20];
    CI::Perspective::CIImageToFile((CI::Perspective *)v19, v20, v22, *MEMORY[0x1E4F1DB20]);
    double v24 = CI::Perspective::gradMagImage((CI::Perspective *)self->gradMap, v23);
    double v25 = (CIImage *)[NSString stringWithFormat:@"/tmp/PerspectiveV2_%@.png", @"4_GradMapThresholded_mag"];
    CI::Perspective::CIImageToFile((CI::Perspective *)v24, v25, v26, *v21);
  }
  double v27 = ci_signpost_log_perspectiveAC();
  double v28 = ci_signpost_log_perspectiveAC();
  os_signpost_id_t v29 = os_signpost_id_make_with_pointer(v28, self);
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v30 = v29;
    if (os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193671000, v27, OS_SIGNPOST_INTERVAL_END, v30, "ThresholdGradientMap", "", buf, 2u);
    }
  }
}

- (void)extractLineSegments
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  objc_super v3 = ci_signpost_log_perspectiveAC();
  v4 = ci_signpost_log_perspectiveAC();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v3))
    {
      unint64_t gradMapW = self->gradMapW;
      unint64_t gradMapH = self->gradMapH;
      *(_DWORD *)buf = 134218240;
      unint64_t v24 = gradMapW;
      __int16 v25 = 2048;
      unint64_t v26 = gradMapH;
      _os_signpost_emit_with_name_impl(&dword_193671000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ExtractLineSegments", "gradMapSize: %lu x %lu", buf, 0x16u);
    }
  }
  double v9 = ci_signpost_log_perspectiveAC();
  double v10 = ci_signpost_log_perspectiveAC();
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v12 = v11;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193671000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v12, "GradientMapRender", "", buf, 2u);
    }
  }
  unint64_t v13 = (8 * self->gradMapW + 15) & 0xFFFFFFFFFFFFFFF0;
  self->gradMapRb = v13;
  double v14 = malloc_type_malloc(self->gradMapH * v13, 0x199F2148uLL);
  *(void *)self->gradMapBmp = v14;
  -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](self->super.ctx, "render:toBitmap:rowBytes:bounds:format:colorSpace:", self->gradMap, v14, self->gradMapRb, 2310, 0, 0.0, 0.0, (double)self->gradMapW, (double)self->gradMapH);
  double v15 = ci_signpost_log_perspectiveAC();
  double v16 = ci_signpost_log_perspectiveAC();
  os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, self);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v18 = v17;
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193671000, v15, OS_SIGNPOST_INTERVAL_END, v18, "GradientMapRender", "", buf, 2u);
    }
  }
  uint64_t v19 = ci_signpost_log_perspectiveAC();
  float64x2_t v20 = ci_signpost_log_perspectiveAC();
  os_signpost_id_t v21 = os_signpost_id_make_with_pointer(v20, self);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v22 = v21;
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193671000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v22, "EDLines", "", buf, 2u);
    }
  }
  CI::Perspective::EDLines::Create();
}

- (void)clusterLineSegments
{
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  uint64_t v5 = a3 + 16;
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  unint64_t v8 = ((v6 - *a2) >> 4) * ((v6 - *a2) >> 4);
  v102 = (void *)v5;
  if (v8 >= 2)
  {
    if (v8 >= 0xCCCCCCCCCCCCCCELL) {
      abort();
    }
    std::__split_buffer<[(CIPerspectiveAutoCalcV1 *)&v107 clusterLineSegments];
    double v9 = *(char **)a3;
    double v10 = *(unsigned char **)(a3 + 8);
    uint64_t v11 = *((void *)&v107 + 1);
    if (v10 == *(unsigned char **)a3)
    {
      double v9 = *(char **)(a3 + 8);
    }
    else
    {
      os_signpost_id_t v12 = *(char **)(a3 + 8);
      do
      {
        long long v13 = *(_OWORD *)(v12 - 40);
        long long v14 = *(_OWORD *)(v12 - 24);
        *(void *)(v11 - 8) = *((void *)v12 - 1);
        *(_OWORD *)(v11 - 24) = v14;
        *(_OWORD *)(v11 - 40) = v13;
        v11 -= 40;
        v12 -= 40;
      }
      while (v12 != v9);
    }
    *(void *)a3 = v11;
    double v15 = *(void **)(a3 + 16);
    *(_OWORD *)(a3 + 8) = *(_OWORD *)v108;
    v108[0] = v10;
    v108[1] = v15;
    *(void *)&long long v107 = v9;
    *((void *)&v107 + 1) = v9;
    if (v10 != v9) {
      v108[0] = &v9[(v10 - v9 - 40) % 0x28uLL];
    }
    if (v9) {
      operator delete(v9);
    }
    uint64_t v7 = *a2;
    uint64_t v6 = a2[1];
  }
  if (v6 != v7)
  {
    unint64_t v16 = 0;
    do
    {
      if (v16)
      {
        float32x2_t v17 = 0;
        do
        {
          os_signpost_id_t v18 = (float32x2_t *)(*a2 + 16 * v16);
          uint64_t v19 = (float32x2_t *)(*a2 + 16 * *(void *)&v17);
          v104[0] = 0;
          long long v107 = *(_OWORD *)v18->f32;
          float64x2_t v20 = v18 + 1;
          long long v105 = *(_OWORD *)v19->f32;
          os_signpost_id_t v21 = v19 + 1;
          BOOL v22 = CI::Perspective::intersect((int32x2_t *)&v107, (int32x2_t *)&v105, v104);
          BOOL v23 = v22;
          if (!v22 || (CI::Perspective::pointInBounds(v104, a1) & 1) == 0)
          {
            float32x2_t v24 = *v18;
            float32x2_t v25 = *v20;
            if (vcgt_f32(*v20, *v18).u8[0]) {
              LODWORD(v26) = *(float32x2_t *)v18->f32;
            }
            else {
              LODWORD(v26) = *(float32x2_t *)v20->f32;
            }
            float32x2_t v27 = *v19;
            float32x2_t v28 = *v21;
            if (vcgt_f32(*v21, *v19).u8[0]) {
              LODWORD(v29) = *(float32x2_t *)v19->f32;
            }
            else {
              LODWORD(v29) = *(float32x2_t *)v21->f32;
            }
            if (v26 >= v29) {
              float v26 = v29;
            }
            if (vcgt_f32(v24, v25).u8[0]) {
              LODWORD(v30) = *(float32x2_t *)v18->f32;
            }
            else {
              LODWORD(v30) = *(float32x2_t *)v20->f32;
            }
            if (vcgt_f32(v27, v28).u8[0]) {
              LODWORD(v31) = *(float32x2_t *)v19->f32;
            }
            else {
              LODWORD(v31) = *(float32x2_t *)v21->f32;
            }
            if (v30 <= v31) {
              float v30 = v31;
            }
            LODWORD(v32) = HIDWORD(*(unint64_t *)v18);
            v27.i32[0] = HIDWORD(*(unint64_t *)v19);
            if (v27.f32[1] <= v28.f32[1]) {
              LODWORD(v33) = HIDWORD(*(unint64_t *)v21);
            }
            else {
              LODWORD(v33) = HIDWORD(*(unint64_t *)v19);
            }
            if (v27.f32[1] >= v28.f32[1]) {
              v27.i32[0] = HIDWORD(*(unint64_t *)v21);
            }
            if (v24.f32[1] <= v25.f32[1]) {
              LODWORD(v34) = HIDWORD(*(unint64_t *)v20);
            }
            else {
              LODWORD(v34) = HIDWORD(*(unint64_t *)v18);
            }
            if (v24.f32[1] >= v25.f32[1]) {
              LODWORD(v32) = HIDWORD(*(unint64_t *)v20);
            }
            if (v34 <= v33) {
              float v35 = v33;
            }
            else {
              float v35 = v34;
            }
            if (v32 >= v27.f32[0]) {
              float v32 = v27.f32[0];
            }
            float v36 = (float)(v30 - v26) * (float)(v35 - v32);
            float32x2_t v37 = v104[0];
            __int16 v39 = *(float32x2_t **)(a3 + 8);
            unint64_t v38 = *(void *)(a3 + 16);
            if ((unint64_t)v39 >= v38)
            {
              uint64_t v41 = 0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v39 - *(void *)a3) >> 3);
              unint64_t v42 = v41 + 1;
              if ((unint64_t)(v41 + 1) > 0x666666666666666) {
                abort();
              }
              unint64_t v43 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v38 - *(void *)a3) >> 3);
              if (2 * v43 > v42) {
                unint64_t v42 = 2 * v43;
              }
              if (v43 >= 0x333333333333333) {
                unint64_t v44 = 0x666666666666666;
              }
              else {
                unint64_t v44 = v42;
              }
              std::__split_buffer<[(CIPerspectiveAutoCalcV1 *)&v107 clusterLineSegments];
              uint64_t v45 = (float32x2_t *)v108[0];
              *(void *)v108[0] = v16;
              v45[1] = v17;
              v45[2].i8[0] = v23;
              v45[3] = v37;
              v45[4].f32[0] = v36;
              unint64_t v40 = v45 + 5;
              v108[0] = &v45[5];
              unint64_t v46 = *(char **)a3;
              __int16 v47 = *(char **)(a3 + 8);
              uint64_t v48 = *((void *)&v107 + 1);
              if (v47 == *(char **)a3)
              {
                unint64_t v46 = *(char **)(a3 + 8);
              }
              else
              {
                uint64_t v49 = *(char **)(a3 + 8);
                do
                {
                  long long v50 = *(_OWORD *)(v49 - 40);
                  long long v51 = *(_OWORD *)(v49 - 24);
                  *(void *)(v48 - 8) = *((void *)v49 - 1);
                  *(_OWORD *)(v48 - 24) = v51;
                  *(_OWORD *)(v48 - 40) = v50;
                  v48 -= 40;
                  v49 -= 40;
                }
                while (v49 != v46);
                unint64_t v40 = (float32x2_t *)v108[0];
              }
              *(void *)a3 = v48;
              *(void *)(a3 + 8) = v40;
              v52 = *(void **)(a3 + 16);
              *(void **)(a3 + 16) = v108[1];
              v108[0] = v47;
              v108[1] = v52;
              *(void *)&long long v107 = v46;
              *((void *)&v107 + 1) = v46;
              if (v47 != v46) {
                v108[0] = &v47[-40 - 40 * ((v47 - v46 - 40) / 0x28uLL)];
              }
              if (v46) {
                operator delete(v46);
              }
            }
            else
            {
              float32x2_t *v39 = (float32x2_t)v16;
              v39[1] = v17;
              v39[2].i8[0] = v23;
              v39[3] = v37;
              unint64_t v40 = v39 + 5;
              v39[4].f32[0] = v36;
            }
            *(void *)(a3 + 8) = v40;
          }
          ++*(void *)&v17;
        }
        while (*(void *)&v17 != v16);
        uint64_t v7 = *a2;
        uint64_t v6 = a2[1];
      }
      ++v16;
    }
    while (v16 < (v6 - v7) >> 4);
  }
  uint64_t v53 = *(void *)a3;
  uint64_t v54 = *(void *)(a3 + 8);
  if (0xCCCCCCCCCCCCCCCDLL * ((v54 - *(void *)a3) >> 3) >= 0x29)
  {
    for (uint64_t i = 760; i != -40; i -= 40)
      std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,-[CIPerspectiveAutoCalcV1 clusterLineSegments]::$_0::operator() const(std::vector<CI::Perspective::Line> const&,unsigned long)::{lambda(-[CIPerspectiveAutoCalcV1 clusterLineSegments]::Hypothesis const&,-[CIPerspectiveAutoCalcV1 clusterLineSegments]::Hypothesis const&)#1} &,std::__wrap_iter<[(CIPerspectiveAutoCalcV1 *)v53 clusterLineSegments];
    uint64_t v56 = v53 + 1600;
    if (v53 + 1600 != v54)
    {
      uint64_t v57 = v53 + 1600;
      do
      {
        if (*(float *)(v57 + 32) > *(float *)(v53 + 32))
        {
          long long v58 = *(_OWORD *)v57;
          long long v59 = *(_OWORD *)(v57 + 16);
          uint64_t v60 = *(void *)(v57 + 32);
          uint64_t v61 = *(void *)(v53 + 32);
          long long v62 = *(_OWORD *)(v53 + 16);
          *(_OWORD *)uint64_t v57 = *(_OWORD *)v53;
          *(_OWORD *)(v57 + 16) = v62;
          *(void *)(v57 + 32) = v61;
          *(void *)(v53 + 32) = v60;
          *(_OWORD *)uint64_t v53 = v58;
          *(_OWORD *)(v53 + 16) = v59;
          std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,-[CIPerspectiveAutoCalcV1 clusterLineSegments]::$_0::operator() const(std::vector<CI::Perspective::Line> const&,unsigned long)::{lambda(-[CIPerspectiveAutoCalcV1 clusterLineSegments]::Hypothesis const&,-[CIPerspectiveAutoCalcV1 clusterLineSegments]::Hypothesis const&)#1} &,std::__wrap_iter<[(CIPerspectiveAutoCalcV1 *)v53 clusterLineSegments];
        }
        v57 += 40;
      }
      while (v57 != v54);
    }
    unint64_t v63 = 40;
    do
    {
      uint64_t v64 = 0;
      long long v107 = *(_OWORD *)v53;
      *(_OWORD *)v108 = *(_OWORD *)(v53 + 16);
      uint64_t v109 = *(void *)(v53 + 32);
      uint64_t v65 = v53;
      do
      {
        uint64_t v66 = v65;
        uint64_t v67 = v64 + 1;
        v65 += 40 * (v64 + 1);
        uint64_t v68 = 2 * v64;
        uint64_t v64 = (2 * v64) | 1;
        uint64_t v69 = v68 + 2;
        if (v69 < (uint64_t)v63 && *(float *)(v66 + 40 * v67 + 32) > *(float *)(v65 + 72))
        {
          v65 += 40;
          uint64_t v64 = v69;
        }
        long long v70 = *(_OWORD *)v65;
        long long v71 = *(_OWORD *)(v65 + 16);
        *(void *)(v66 + 32) = *(void *)(v65 + 32);
        *(_OWORD *)uint64_t v66 = v70;
        *(_OWORD *)(v66 + 16) = v71;
      }
      while (v64 <= (uint64_t)((v63 - 2) >> 1));
      v56 -= 40;
      if (v65 == v56)
      {
        long long v82 = v107;
        long long v83 = *(_OWORD *)v108;
        *(void *)(v65 + 32) = v109;
        *(_OWORD *)uint64_t v65 = v82;
        *(_OWORD *)(v65 + 16) = v83;
      }
      else
      {
        long long v72 = *(_OWORD *)v56;
        long long v73 = *(_OWORD *)(v56 + 16);
        *(void *)(v65 + 32) = *(void *)(v56 + 32);
        *(_OWORD *)uint64_t v65 = v72;
        *(_OWORD *)(v65 + 16) = v73;
        *(_OWORD *)uint64_t v56 = v107;
        *(_OWORD *)(v56 + 16) = *(_OWORD *)v108;
        *(void *)(v56 + 32) = v109;
        uint64_t v74 = v65 - v53 + 40;
        if (v74 >= 41)
        {
          unint64_t v75 = (v74 / 0x28uLL - 2) >> 1;
          float v76 = *(float *)(v65 + 32);
          if (*(float *)(v53 + 40 * v75 + 32) > v76)
          {
            long long v77 = *(_OWORD *)(v65 + 16);
            long long v105 = *(_OWORD *)v65;
            long long v106 = v77;
            int v78 = *(_DWORD *)(v65 + 36);
            do
            {
              uint64_t v79 = v65;
              uint64_t v65 = v53 + 40 * v75;
              long long v80 = *(_OWORD *)v65;
              long long v81 = *(_OWORD *)(v65 + 16);
              *(void *)(v79 + 32) = *(void *)(v65 + 32);
              *(_OWORD *)uint64_t v79 = v80;
              *(_OWORD *)(v79 + 16) = v81;
              if (!v75) {
                break;
              }
              unint64_t v75 = (v75 - 1) >> 1;
            }
            while (*(float *)(v53 + 40 * v75 + 32) > v76);
            *(_OWORD *)uint64_t v65 = v105;
            *(_OWORD *)(v65 + 16) = v106;
            *(float *)(v65 + 32) = v76;
            *(_DWORD *)(v65 + 36) = v78;
          }
        }
      }
    }
    while (v63-- > 2);
    uint64_t v85 = *(void *)a3;
    uint64_t v86 = *(void *)(a3 + 8);
    uint64_t v87 = v86 - *(void *)a3;
    unint64_t v88 = 0xCCCCCCCCCCCCCCCDLL * (v87 >> 3);
    if (v88 > 0x27)
    {
      if (v87 == 1600) {
        return;
      }
      uint64_t v100 = v85 + 1600;
    }
    else
    {
      if (0xCCCCCCCCCCCCCCCDLL * ((*v102 - v86) >> 3) < 40 - v88)
      {
        unint64_t v89 = 0xCCCCCCCCCCCCCCCDLL * ((*v102 - v85) >> 3);
        uint64_t v90 = 2 * v89;
        if (2 * v89 <= 0x28) {
          uint64_t v90 = 40;
        }
        if (v89 >= 0x333333333333333) {
          unint64_t v91 = 0x666666666666666;
        }
        else {
          unint64_t v91 = v90;
        }
        std::__split_buffer<[(CIPerspectiveAutoCalcV1 *)&v107 clusterLineSegments];
        v92 = (char *)v108[0];
        bzero(v108[0], 1560 - v87 - (unsigned __int16)(1560 - v87) % 0x28u + 40);
        v93 = &v92[1560 - v87 - (unsigned __int16)(1560 - v87) % 0x28u + 40];
        v108[0] = v93;
        v94 = *(char **)a3;
        v95 = *(unsigned char **)(a3 + 8);
        uint64_t v96 = *((void *)&v107 + 1);
        if (v95 == *(unsigned char **)a3)
        {
          v94 = *(char **)(a3 + 8);
        }
        else
        {
          v97 = *(char **)(a3 + 8);
          do
          {
            long long v98 = *(_OWORD *)(v97 - 40);
            long long v99 = *(_OWORD *)(v97 - 24);
            *(void *)(v96 - 8) = *((void *)v97 - 1);
            *(_OWORD *)(v96 - 24) = v99;
            *(_OWORD *)(v96 - 40) = v98;
            v96 -= 40;
            v97 -= 40;
          }
          while (v97 != v94);
          v93 = (char *)v108[0];
        }
        *(void *)a3 = v96;
        *(void *)(a3 + 8) = v93;
        v101 = *(void **)(a3 + 16);
        *(void **)(a3 + 16) = v108[1];
        v108[0] = v95;
        v108[1] = v101;
        *(void *)&long long v107 = v94;
        *((void *)&v107 + 1) = v94;
        if (v95 != v94) {
          v108[0] = &v94[(v95 - v94 - 40) % 0x28uLL];
        }
        if (v94) {
          operator delete(v94);
        }
        return;
      }
      bzero(*(void **)(a3 + 8), 1560 - v87 - (unsigned __int16)(1560 - v87) % 0x28u + 40);
      uint64_t v100 = v86 + 1560 - v87 - (unsigned __int16)(1560 - v87) % 0x28u + 40;
    }
    *(void *)(a3 + 8) = v100;
  }
}

- (void)setupCostFunction
{
  p_vClusterInliersProxies = &self->vClusterInliersProxies;
  p_vClusterInliers = &self->vClusterInliers;
  std::vector<LineCostProxy>::reserve((void **)&self->vClusterInliersProxies.__begin_, (self->vClusterInliers.__end_ - self->vClusterInliers.__begin_) >> 4);
  p_vClusterOutliersProxies = &self->vClusterOutliersProxies;
  p_vClusterOutliers = &self->vClusterOutliers;
  std::vector<LineCostProxy>::reserve((void **)&self->vClusterOutliersProxies.__begin_, (self->vClusterOutliers.__end_ - self->vClusterOutliers.__begin_) >> 4);
  p_hClusterInliersProxies = &self->hClusterInliersProxies;
  p_hClusterInliers = &self->hClusterInliers;
  std::vector<LineCostProxy>::reserve((void **)&self->hClusterInliersProxies.__begin_, (self->hClusterInliers.__end_ - self->hClusterInliers.__begin_) >> 4);
  p_hClusterOutliersProxies = &self->hClusterOutliersProxies;
  v163 = self;
  p_hClusterOutliers = &self->hClusterOutliers;
  std::vector<LineCostProxy>::reserve((void **)&self->hClusterOutliersProxies.__begin_, (self->hClusterOutliers.__end_ - self->hClusterOutliers.__begin_) >> 4);
  begin = (float32x2_t *)p_vClusterInliers->__begin_;
  end = p_vClusterInliers->__end_;
  if (p_vClusterInliers->__begin_ != end)
  {
    anon_120 = self->_anon_120;
    do
    {
      uint64_t v11 = 0;
      float32x4_t v12 = *(float32x4_t *)self->_anon_c0;
      float32x4_t v13 = *(float32x4_t *)&self->_anon_c0[16];
      float32x4_t v14 = *(float32x4_t *)&self->_anon_c0[32];
      long long v15 = *(_OWORD *)anon_120;
      long long v16 = *(_OWORD *)&self->_anon_120[16];
      long long v17 = *(_OWORD *)&self->_anon_120[32];
      long long v165 = *(_OWORD *)anon_120;
      long long v166 = v16;
      long long v167 = v17;
      do
      {
        *(float32x4_t *)((char *)&v168 + v11) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v12, COERCE_FLOAT(*(long long *)((char *)&v165 + v11))), v13, *(float32x2_t *)((char *)&v165 + v11), 1), v14, *(float32x4_t *)((char *)&v165 + v11), 2);
        v11 += 16;
      }
      while (v11 != 48);
      uint64_t v18 = 0;
      float32x4_t v20 = v168;
      float32x4_t v19 = v169;
      float32x4_t v21 = v170;
      float32x2_t v22 = *begin;
      long long v165 = v15;
      long long v166 = v16;
      long long v167 = v17;
      do
      {
        *(float32x4_t *)((char *)&v168 + v18) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v12, COERCE_FLOAT(*(long long *)((char *)&v165 + v18))), v13, *(float32x2_t *)((char *)&v165 + v18), 1), v14, *(float32x4_t *)((char *)&v165 + v18), 2);
        v18 += 16;
      }
      while (v18 != 48);
      int32x4_t v23 = (int32x4_t)vaddq_f32(v21, vmlaq_lane_f32(vmulq_n_f32(v20, v22.f32[0]), v19, v22, 1));
      float32x2_t v24 = vdiv_f32(*(float32x2_t *)v23.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v23, 2));
      int32x4_t v25 = (int32x4_t)vaddq_f32(v170, vmlaq_lane_f32(vmulq_n_f32(v168, COERCE_FLOAT(*(void *)&begin[1])), v169, begin[1], 1));
      float32x2_t v26 = vdiv_f32(*(float32x2_t *)v25.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v25, 2));
      *(float32x2_t *)v25.i8 = vsub_f32(v24, v26);
      *(double *)&long long v8 = pow(sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)v25.i8, *(float32x2_t *)v25.i8))), 0.25);
      if (*(double *)&v8 >= 1.0) {
        *(double *)&long long v8 = 1.0;
      }
      float v27 = *(double *)&v8;
      float32x2_t v28 = vmul_f32(vadd_f32(v24, v26), (float32x2_t)0x3F0000003F000000);
      v28.f32[0] = sqrtf(vaddv_f32(vmul_f32(v28, v28)));
      *(double *)&long long v8 = 1.0 / ((float)(v28.f32[0] + 1.0) * (float)(v28.f32[0] + 1.0));
      if (*(double *)&v8 >= 1.0) {
        *(double *)&long long v8 = 1.0;
      }
      float v29 = *(double *)&v8;
      float v31 = p_vClusterInliersProxies->__end_;
      value = p_vClusterInliersProxies->__end_cap_.__value_;
      if (v31 >= value)
      {
        unint64_t v33 = 0xAAAAAAAAAAAAAAABLL * ((v31 - p_vClusterInliersProxies->__begin_) >> 3);
        unint64_t v34 = v33 + 1;
        if (v33 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_124:
        }
          abort();
        unint64_t v35 = 0xAAAAAAAAAAAAAAABLL * ((value - p_vClusterInliersProxies->__begin_) >> 3);
        if (2 * v35 > v34) {
          unint64_t v34 = 2 * v35;
        }
        if (v35 >= 0x555555555555555) {
          unint64_t v36 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v36 = v34;
        }
        if (v36) {
          float32x2_t v37 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<CI::SWRendererFunctionInputNode>>((uint64_t)&p_vClusterInliersProxies->__end_cap_, v36);
        }
        else {
          float32x2_t v37 = 0;
        }
        unint64_t v38 = &v37[24 * v33];
        *(float32x2_t *)unint64_t v38 = v24;
        *((float32x2_t *)v38 + 1) = v26;
        *((float *)v38 + 4) = v27;
        *((float *)v38 + 5) = v29;
        unint64_t v40 = p_vClusterInliersProxies->__begin_;
        __int16 v39 = p_vClusterInliersProxies->__end_;
        uint64_t v41 = (LineCostProxy *)v38;
        if (v39 != p_vClusterInliersProxies->__begin_)
        {
          do
          {
            long long v8 = *(_OWORD *)((char *)v39 - 24);
            *((void *)v41 - 1) = *((void *)v39 - 1);
            *(_OWORD *)((char *)v41 - 24) = v8;
            uint64_t v41 = (LineCostProxy *)((char *)v41 - 24);
            __int16 v39 = (LineCostProxy *)((char *)v39 - 24);
          }
          while (v39 != v40);
          __int16 v39 = p_vClusterInliersProxies->__begin_;
        }
        float v32 = (LineCostProxy *)(v38 + 24);
        p_vClusterInliersProxies->__begin_ = v41;
        p_vClusterInliersProxies->__end_ = (LineCostProxy *)(v38 + 24);
        p_vClusterInliersProxies->__end_cap_.__value_ = (LineCostProxy *)&v37[24 * v36];
        if (v39) {
          operator delete(v39);
        }
      }
      else
      {
        *(float32x2_t *)float v31 = v24;
        *((float32x2_t *)v31 + 1) = v26;
        float v32 = (LineCostProxy *)((char *)v31 + 24);
        *((float *)v31 + 4) = v27;
        *((float *)v31 + 5) = v29;
      }
      p_vClusterInliersProxies->__end_ = v32;
      begin += 2;
    }
    while (begin != (float32x2_t *)end);
  }
  unint64_t v42 = (float32x2_t *)p_vClusterOutliers->__begin_;
  unint64_t v43 = self->vClusterOutliers.__end_;
  if (p_vClusterOutliers->__begin_ != v43)
  {
    unint64_t v44 = v163->_anon_120;
    do
    {
      uint64_t v45 = 0;
      float32x4_t v46 = *(float32x4_t *)v163->_anon_c0;
      float32x4_t v47 = *(float32x4_t *)&v163->_anon_c0[16];
      float32x4_t v48 = *(float32x4_t *)&v163->_anon_c0[32];
      long long v49 = *(_OWORD *)v44;
      long long v50 = *(_OWORD *)&v163->_anon_120[16];
      long long v51 = *(_OWORD *)&v163->_anon_120[32];
      long long v165 = *(_OWORD *)v44;
      long long v166 = v50;
      long long v167 = v51;
      do
      {
        *(float32x4_t *)((char *)&v168 + v45) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v46, COERCE_FLOAT(*(long long *)((char *)&v165 + v45))), v47, *(float32x2_t *)((char *)&v165 + v45), 1), v48, *(float32x4_t *)((char *)&v165 + v45), 2);
        v45 += 16;
      }
      while (v45 != 48);
      uint64_t v52 = 0;
      float32x4_t v54 = v168;
      float32x4_t v53 = v169;
      float32x4_t v55 = v170;
      float32x2_t v56 = *v42;
      long long v165 = v49;
      long long v166 = v50;
      long long v167 = v51;
      do
      {
        *(float32x4_t *)((char *)&v168 + v52) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v46, COERCE_FLOAT(*(long long *)((char *)&v165 + v52))), v47, *(float32x2_t *)((char *)&v165 + v52), 1), v48, *(float32x4_t *)((char *)&v165 + v52), 2);
        v52 += 16;
      }
      while (v52 != 48);
      int32x4_t v57 = (int32x4_t)vaddq_f32(v55, vmlaq_lane_f32(vmulq_n_f32(v54, v56.f32[0]), v53, v56, 1));
      float32x2_t v58 = vdiv_f32(*(float32x2_t *)v57.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v57, 2));
      int32x4_t v59 = (int32x4_t)vaddq_f32(v170, vmlaq_lane_f32(vmulq_n_f32(v168, COERCE_FLOAT(*(void *)&v42[1])), v169, v42[1], 1));
      float32x2_t v60 = vdiv_f32(*(float32x2_t *)v59.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v59, 2));
      *(float32x2_t *)v59.i8 = vsub_f32(v58, v60);
      *(double *)&long long v8 = pow(sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)v59.i8, *(float32x2_t *)v59.i8))), 0.25);
      if (*(double *)&v8 >= 1.0) {
        *(double *)&long long v8 = 1.0;
      }
      float v61 = *(double *)&v8;
      float32x2_t v62 = vmul_f32(vadd_f32(v58, v60), (float32x2_t)0x3F0000003F000000);
      v62.f32[0] = sqrtf(vaddv_f32(vmul_f32(v62, v62)));
      *(double *)&long long v8 = 1.0 / ((float)(v62.f32[0] + 1.0) * (float)(v62.f32[0] + 1.0));
      if (*(double *)&v8 >= 1.0) {
        *(double *)&long long v8 = 1.0;
      }
      float v63 = *(double *)&v8;
      uint64_t v65 = p_vClusterOutliersProxies->__end_;
      uint64_t v64 = p_vClusterOutliersProxies->__end_cap_.__value_;
      if (v65 >= v64)
      {
        unint64_t v67 = 0xAAAAAAAAAAAAAAABLL * ((v65 - p_vClusterOutliersProxies->__begin_) >> 3);
        unint64_t v68 = v67 + 1;
        if (v67 + 1 > 0xAAAAAAAAAAAAAAALL) {
          goto LABEL_124;
        }
        unint64_t v69 = 0xAAAAAAAAAAAAAAABLL * ((v64 - p_vClusterOutliersProxies->__begin_) >> 3);
        if (2 * v69 > v68) {
          unint64_t v68 = 2 * v69;
        }
        if (v69 >= 0x555555555555555) {
          unint64_t v70 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v70 = v68;
        }
        if (v70) {
          long long v71 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<CI::SWRendererFunctionInputNode>>((uint64_t)&p_vClusterOutliersProxies->__end_cap_, v70);
        }
        else {
          long long v71 = 0;
        }
        long long v72 = &v71[24 * v67];
        *(float32x2_t *)long long v72 = v58;
        *((float32x2_t *)v72 + 1) = v60;
        *((float *)v72 + 4) = v61;
        *((float *)v72 + 5) = v63;
        uint64_t v74 = p_vClusterOutliersProxies->__begin_;
        long long v73 = p_vClusterOutliersProxies->__end_;
        unint64_t v75 = (LineCostProxy *)v72;
        if (v73 != p_vClusterOutliersProxies->__begin_)
        {
          do
          {
            long long v8 = *(_OWORD *)((char *)v73 - 24);
            *((void *)v75 - 1) = *((void *)v73 - 1);
            *(_OWORD *)((char *)v75 - 24) = v8;
            unint64_t v75 = (LineCostProxy *)((char *)v75 - 24);
            long long v73 = (LineCostProxy *)((char *)v73 - 24);
          }
          while (v73 != v74);
          long long v73 = p_vClusterOutliersProxies->__begin_;
        }
        uint64_t v66 = (LineCostProxy *)(v72 + 24);
        p_vClusterOutliersProxies->__begin_ = v75;
        p_vClusterOutliersProxies->__end_ = (LineCostProxy *)(v72 + 24);
        p_vClusterOutliersProxies->__end_cap_.__value_ = (LineCostProxy *)&v71[24 * v70];
        if (v73) {
          operator delete(v73);
        }
      }
      else
      {
        *(float32x2_t *)uint64_t v65 = v58;
        *((float32x2_t *)v65 + 1) = v60;
        uint64_t v66 = (LineCostProxy *)((char *)v65 + 24);
        *((float *)v65 + 4) = v61;
        *((float *)v65 + 5) = v63;
      }
      p_vClusterOutliersProxies->__end_ = v66;
      v42 += 2;
    }
    while (v42 != (float32x2_t *)v43);
  }
  float v76 = (float32x2_t *)p_hClusterInliers->__begin_;
  long long v77 = p_hClusterInliers->__end_;
  if (p_hClusterInliers->__begin_ != v77)
  {
    int v78 = v163->_anon_120;
    do
    {
      uint64_t v79 = 0;
      float32x4_t v80 = *(float32x4_t *)v163->_anon_c0;
      float32x4_t v81 = *(float32x4_t *)&v163->_anon_c0[16];
      float32x4_t v82 = *(float32x4_t *)&v163->_anon_c0[32];
      long long v83 = *(_OWORD *)v78;
      long long v84 = *(_OWORD *)&v163->_anon_120[16];
      long long v85 = *(_OWORD *)&v163->_anon_120[32];
      long long v165 = *(_OWORD *)v78;
      long long v166 = v84;
      long long v167 = v85;
      do
      {
        *(float32x4_t *)((char *)&v168 + v79) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v80, COERCE_FLOAT(*(long long *)((char *)&v165 + v79))), v81, *(float32x2_t *)((char *)&v165 + v79), 1), v82, *(float32x4_t *)((char *)&v165 + v79), 2);
        v79 += 16;
      }
      while (v79 != 48);
      uint64_t v86 = 0;
      float32x4_t v88 = v168;
      float32x4_t v87 = v169;
      float32x4_t v89 = v170;
      float32x2_t v90 = *v76;
      long long v165 = v83;
      long long v166 = v84;
      long long v167 = v85;
      do
      {
        *(float32x4_t *)((char *)&v168 + v86) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v80, COERCE_FLOAT(*(long long *)((char *)&v165 + v86))), v81, *(float32x2_t *)((char *)&v165 + v86), 1), v82, *(float32x4_t *)((char *)&v165 + v86), 2);
        v86 += 16;
      }
      while (v86 != 48);
      int32x4_t v91 = (int32x4_t)vaddq_f32(v89, vmlaq_lane_f32(vmulq_n_f32(v88, v90.f32[0]), v87, v90, 1));
      float32x2_t v92 = vdiv_f32(*(float32x2_t *)v91.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v91, 2));
      int32x4_t v93 = (int32x4_t)vaddq_f32(v170, vmlaq_lane_f32(vmulq_n_f32(v168, COERCE_FLOAT(*(void *)&v76[1])), v169, v76[1], 1));
      float32x2_t v94 = vdiv_f32(*(float32x2_t *)v93.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v93, 2));
      *(float32x2_t *)v93.i8 = vsub_f32(v92, v94);
      *(double *)&long long v8 = pow(sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)v93.i8, *(float32x2_t *)v93.i8))), 0.25);
      if (*(double *)&v8 >= 1.0) {
        *(double *)&long long v8 = 1.0;
      }
      float v95 = *(double *)&v8;
      float32x2_t v96 = vmul_f32(vadd_f32(v92, v94), (float32x2_t)0x3F0000003F000000);
      v96.f32[0] = sqrtf(vaddv_f32(vmul_f32(v96, v96)));
      *(double *)&long long v8 = 1.0 / ((float)(v96.f32[0] + 1.0) * (float)(v96.f32[0] + 1.0));
      if (*(double *)&v8 >= 1.0) {
        *(double *)&long long v8 = 1.0;
      }
      float v97 = *(double *)&v8;
      long long v99 = p_hClusterInliersProxies->__end_;
      long long v98 = p_hClusterInliersProxies->__end_cap_.__value_;
      if (v99 >= v98)
      {
        unint64_t v101 = 0xAAAAAAAAAAAAAAABLL * ((v99 - p_hClusterInliersProxies->__begin_) >> 3);
        unint64_t v102 = v101 + 1;
        if (v101 + 1 > 0xAAAAAAAAAAAAAAALL) {
          goto LABEL_124;
        }
        unint64_t v103 = 0xAAAAAAAAAAAAAAABLL * ((v98 - p_hClusterInliersProxies->__begin_) >> 3);
        if (2 * v103 > v102) {
          unint64_t v102 = 2 * v103;
        }
        if (v103 >= 0x555555555555555) {
          unint64_t v104 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v104 = v102;
        }
        if (v104) {
          long long v105 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<CI::SWRendererFunctionInputNode>>((uint64_t)&p_hClusterInliersProxies->__end_cap_, v104);
        }
        else {
          long long v105 = 0;
        }
        long long v106 = &v105[24 * v101];
        *(float32x2_t *)long long v106 = v92;
        *((float32x2_t *)v106 + 1) = v94;
        *((float *)v106 + 4) = v95;
        *((float *)v106 + 5) = v97;
        v108 = p_hClusterInliersProxies->__begin_;
        long long v107 = p_hClusterInliersProxies->__end_;
        uint64_t v109 = (LineCostProxy *)v106;
        if (v107 != p_hClusterInliersProxies->__begin_)
        {
          do
          {
            long long v8 = *(_OWORD *)((char *)v107 - 24);
            *((void *)v109 - 1) = *((void *)v107 - 1);
            *(_OWORD *)((char *)v109 - 24) = v8;
            uint64_t v109 = (LineCostProxy *)((char *)v109 - 24);
            long long v107 = (LineCostProxy *)((char *)v107 - 24);
          }
          while (v107 != v108);
          long long v107 = p_hClusterInliersProxies->__begin_;
        }
        uint64_t v100 = (LineCostProxy *)(v106 + 24);
        p_hClusterInliersProxies->__begin_ = v109;
        p_hClusterInliersProxies->__end_ = (LineCostProxy *)(v106 + 24);
        p_hClusterInliersProxies->__end_cap_.__value_ = (LineCostProxy *)&v105[24 * v104];
        if (v107) {
          operator delete(v107);
        }
      }
      else
      {
        *(float32x2_t *)long long v99 = v92;
        *((float32x2_t *)v99 + 1) = v94;
        uint64_t v100 = (LineCostProxy *)((char *)v99 + 24);
        *((float *)v99 + 4) = v95;
        *((float *)v99 + 5) = v97;
      }
      p_hClusterInliersProxies->__end_ = v100;
      v76 += 2;
    }
    while (v76 != (float32x2_t *)v77);
  }
  v110 = (float32x2_t *)p_hClusterOutliers->__begin_;
  v111 = p_hClusterOutliers->__end_;
  if (p_hClusterOutliers->__begin_ != v111)
  {
    v112 = v163->_anon_120;
    do
    {
      uint64_t v113 = 0;
      float32x4_t v114 = *(float32x4_t *)v163->_anon_c0;
      float32x4_t v115 = *(float32x4_t *)&v163->_anon_c0[16];
      float32x4_t v116 = *(float32x4_t *)&v163->_anon_c0[32];
      long long v117 = *(_OWORD *)v112;
      long long v118 = *(_OWORD *)&v163->_anon_120[16];
      long long v119 = *(_OWORD *)&v163->_anon_120[32];
      long long v165 = *(_OWORD *)v112;
      long long v166 = v118;
      long long v167 = v119;
      do
      {
        *(float32x4_t *)((char *)&v168 + v113) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v114, COERCE_FLOAT(*(long long *)((char *)&v165 + v113))), v115, *(float32x2_t *)((char *)&v165 + v113), 1), v116, *(float32x4_t *)((char *)&v165 + v113), 2);
        v113 += 16;
      }
      while (v113 != 48);
      uint64_t v120 = 0;
      float32x4_t v122 = v168;
      float32x4_t v121 = v169;
      float32x4_t v123 = v170;
      float32x2_t v124 = *v110;
      long long v165 = v117;
      long long v166 = v118;
      long long v167 = v119;
      do
      {
        *(float32x4_t *)((char *)&v168 + v120) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v114, COERCE_FLOAT(*(long long *)((char *)&v165 + v120))), v115, *(float32x2_t *)((char *)&v165 + v120), 1), v116, *(float32x4_t *)((char *)&v165 + v120), 2);
        v120 += 16;
      }
      while (v120 != 48);
      int32x4_t v125 = (int32x4_t)vaddq_f32(v123, vmlaq_lane_f32(vmulq_n_f32(v122, v124.f32[0]), v121, v124, 1));
      float32x2_t v126 = vdiv_f32(*(float32x2_t *)v125.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v125, 2));
      int32x4_t v127 = (int32x4_t)vaddq_f32(v170, vmlaq_lane_f32(vmulq_n_f32(v168, COERCE_FLOAT(*(void *)&v110[1])), v169, v110[1], 1));
      float32x2_t v128 = vdiv_f32(*(float32x2_t *)v127.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v127, 2));
      *(float32x2_t *)v127.i8 = vsub_f32(v126, v128);
      *(double *)&long long v8 = pow(sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)v127.i8, *(float32x2_t *)v127.i8))), 0.25);
      if (*(double *)&v8 >= 1.0) {
        *(double *)&long long v8 = 1.0;
      }
      float v129 = *(double *)&v8;
      float32x2_t v130 = vmul_f32(vadd_f32(v126, v128), (float32x2_t)0x3F0000003F000000);
      v130.f32[0] = sqrtf(vaddv_f32(vmul_f32(v130, v130)));
      *(double *)&long long v8 = 1.0 / ((float)(v130.f32[0] + 1.0) * (float)(v130.f32[0] + 1.0));
      if (*(double *)&v8 >= 1.0) {
        *(double *)&long long v8 = 1.0;
      }
      float v131 = *(double *)&v8;
      v133 = p_hClusterOutliersProxies->__end_;
      v132 = p_hClusterOutliersProxies->__end_cap_.__value_;
      if (v133 >= v132)
      {
        unint64_t v135 = 0xAAAAAAAAAAAAAAABLL * ((v133 - p_hClusterOutliersProxies->__begin_) >> 3);
        unint64_t v136 = v135 + 1;
        if (v135 + 1 > 0xAAAAAAAAAAAAAAALL) {
          goto LABEL_124;
        }
        unint64_t v137 = 0xAAAAAAAAAAAAAAABLL * ((v132 - p_hClusterOutliersProxies->__begin_) >> 3);
        if (2 * v137 > v136) {
          unint64_t v136 = 2 * v137;
        }
        if (v137 >= 0x555555555555555) {
          unint64_t v138 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v138 = v136;
        }
        if (v138) {
          v139 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<CI::SWRendererFunctionInputNode>>((uint64_t)&p_hClusterOutliersProxies->__end_cap_, v138);
        }
        else {
          v139 = 0;
        }
        v140 = &v139[24 * v135];
        *(float32x2_t *)v140 = v126;
        *((float32x2_t *)v140 + 1) = v128;
        *((float *)v140 + 4) = v129;
        *((float *)v140 + 5) = v131;
        v142 = p_hClusterOutliersProxies->__begin_;
        v141 = p_hClusterOutliersProxies->__end_;
        v143 = (LineCostProxy *)v140;
        if (v141 != p_hClusterOutliersProxies->__begin_)
        {
          do
          {
            long long v8 = *(_OWORD *)((char *)v141 - 24);
            *((void *)v143 - 1) = *((void *)v141 - 1);
            *(_OWORD *)((char *)v143 - 24) = v8;
            v143 = (LineCostProxy *)((char *)v143 - 24);
            v141 = (LineCostProxy *)((char *)v141 - 24);
          }
          while (v141 != v142);
          v141 = p_hClusterOutliersProxies->__begin_;
        }
        v134 = (LineCostProxy *)(v140 + 24);
        p_hClusterOutliersProxies->__begin_ = v143;
        p_hClusterOutliersProxies->__end_ = (LineCostProxy *)(v140 + 24);
        p_hClusterOutliersProxies->__end_cap_.__value_ = (LineCostProxy *)&v139[24 * v138];
        if (v141) {
          operator delete(v141);
        }
      }
      else
      {
        *(float32x2_t *)v133 = v126;
        *((float32x2_t *)v133 + 1) = v128;
        v134 = (LineCostProxy *)((char *)v133 + 24);
        *((float *)v133 + 4) = v129;
        *((float *)v133 + 5) = v131;
      }
      p_hClusterOutliersProxies->__end_ = v134;
      v110 += 2;
    }
    while (v110 != (float32x2_t *)v111);
  }
  uint64_t v144 = 0;
  uint64_t v145 = 0;
  do
  {
    uint64_t v146 = 0;
    LODWORD(v8) = dword_193954EF0[v144];
    do
    {
      uint64_t v147 = 0;
      long long v148 = v8;
      DWORD1(v148) = dword_193954EF0[v146];
      do
      {
        long long v149 = v148;
        DWORD2(v149) = dword_193954EF0[v147];
        *(_OWORD *)&v163->initialSimplexVerticesXYZ[16 * v145 + 16 * v147++] = v149;
      }
      while (v147 != 4);
      ++v146;
      v145 += 4;
    }
    while (v146 != 4);
    ++v144;
  }
  while (v144 != 4);
  uint64_t v150 = 0;
  uint64_t v151 = 0;
  do
  {
    uint64_t v152 = 0;
    int v153 = dword_193954EF0[v150];
    do
    {
      LODWORD(v154) = v153;
      HIDWORD(v154) = dword_193954EF0[v152];
      *(void *)&v163->initialSimplexVerticesXZ[8 * v151 + 8 * v152++] = v154;
    }
    while (v152 != 4);
    ++v150;
    v151 += 4;
  }
  while (v150 != 4);
  uint64_t v155 = 0;
  uint64_t v156 = 0;
  do
  {
    uint64_t v157 = 0;
    int v158 = dword_193954EF0[v155];
    do
    {
      LODWORD(v159) = v158;
      HIDWORD(v159) = dword_193954EF0[v157];
      *(void *)&v163->initialSimplexVerticesYZ[8 * v156 + 8 * v157++] = v159;
    }
    while (v157 != 4);
    ++v155;
    v156 += 4;
  }
  while (v155 != 4);
}

- (float)evaluateCost:(CIPerspectiveAutoCalcV2 *)self
{
  *(__n64 *)v4.f32 = CI::Perspective::getRotation((CI::Perspective *)self, *(float *)&v2, *((float *)&v2 + 1), *((float *)&v2 + 2));
  begin = self->vClusterInliersProxies.__begin_;
  end = self->vClusterInliersProxies.__end_;
  float v9 = 0.0;
  for (float i = 0.0; begin != end; begin = (LineCostProxy *)((char *)begin + 24))
  {
    float32x4_t v11 = vaddq_f32(v6, vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*(void *)begin)), v5, *(float32x2_t *)begin, 1));
    float32x4_t v12 = vaddq_f32(v6, vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*((void *)begin + 1))), v5, *(float32x2_t *)((char *)begin + 8), 1));
    float32x4_t v13 = vsubq_f32(vdivq_f32(v12, (float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2)), vdivq_f32(v11, (float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2)));
    float32x2_t v14 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v13, v13)));
    *(float32x2_t *)v12.f32 = vrsqrte_f32(v14);
    *(float32x2_t *)v12.f32 = vmul_f32(*(float32x2_t *)v12.f32, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(*(float32x2_t *)v12.f32, *(float32x2_t *)v12.f32)));
    float v15 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v13.f32, vmul_f32(*(float32x2_t *)v12.f32, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(*(float32x2_t *)v12.f32, *(float32x2_t *)v12.f32))).f32[0]), (float32x2_t)1065353216));
    if (v15 < 0.0) {
      float v15 = -v15;
    }
    float i = i + (float)(*((float *)begin + 5) * (float)(*((float *)begin + 4) * v15));
  }
  long long v16 = self->vClusterOutliersProxies.__begin_;
  long long v17 = self->vClusterOutliersProxies.__end_;
  if (v16 != v17)
  {
    float v9 = 0.0;
    do
    {
      float32x4_t v18 = vaddq_f32(v6, vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*(void *)v16)), v5, *(float32x2_t *)v16, 1));
      float32x4_t v19 = vaddq_f32(v6, vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*((void *)v16 + 1))), v5, *(float32x2_t *)((char *)v16 + 8), 1));
      float32x4_t v20 = vsubq_f32(vdivq_f32(v19, (float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2)), vdivq_f32(v18, (float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2)));
      float32x2_t v21 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v20, v20)));
      *(float32x2_t *)v19.f32 = vrsqrte_f32(v21);
      *(float32x2_t *)v19.f32 = vmul_f32(*(float32x2_t *)v19.f32, vrsqrts_f32((float32x2_t)v21.u32[0], vmul_f32(*(float32x2_t *)v19.f32, *(float32x2_t *)v19.f32)));
      float v22 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v20.f32, vmul_f32(*(float32x2_t *)v19.f32, vrsqrts_f32((float32x2_t)v21.u32[0], vmul_f32(*(float32x2_t *)v19.f32, *(float32x2_t *)v19.f32))).f32[0]), (float32x2_t)1065353216));
      if (v22 < 0.0) {
        float v22 = -v22;
      }
      float v9 = v9 + (float)(*((float *)v16 + 5) * (float)(*((float *)v16 + 4) * v22));
      long long v16 = (LineCostProxy *)((char *)v16 + 24);
    }
    while (v16 != v17);
  }
  int32x4_t v23 = self->hClusterInliersProxies.__begin_;
  float32x2_t v24 = self->hClusterInliersProxies.__end_;
  float v25 = 0.0;
  for (j = 0.0; v23 != v24; int32x4_t v23 = (LineCostProxy *)((char *)v23 + 24))
  {
    float32x4_t v27 = vaddq_f32(v6, vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*(void *)v23)), v5, *(float32x2_t *)v23, 1));
    float32x4_t v28 = vaddq_f32(v6, vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*((void *)v23 + 1))), v5, *(float32x2_t *)((char *)v23 + 8), 1));
    float32x4_t v29 = vsubq_f32(vdivq_f32(v28, (float32x4_t)vdupq_laneq_s32((int32x4_t)v28, 2)), vdivq_f32(v27, (float32x4_t)vdupq_laneq_s32((int32x4_t)v27, 2)));
    float32x2_t v30 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v29, v29)));
    *(float32x2_t *)v28.f32 = vrsqrte_f32(v30);
    *(float32x2_t *)v28.f32 = vmul_f32(*(float32x2_t *)v28.f32, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(*(float32x2_t *)v28.f32, *(float32x2_t *)v28.f32)));
    float v31 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v29.f32, vmul_f32(*(float32x2_t *)v28.f32, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(*(float32x2_t *)v28.f32, *(float32x2_t *)v28.f32))).f32[0]), (float32x2_t)0x3F80000000000000));
    if (v31 < 0.0) {
      float v31 = -v31;
    }
    float j = j + (float)(*((float *)v23 + 5) * (float)(*((float *)v23 + 4) * v31));
  }
  float v32 = self->hClusterOutliersProxies.__begin_;
  unint64_t v33 = self->hClusterOutliersProxies.__end_;
  if (v32 != v33)
  {
    float v25 = 0.0;
    do
    {
      float32x4_t v34 = vaddq_f32(v6, vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*(void *)v32)), v5, *(float32x2_t *)v32, 1));
      float32x4_t v35 = vaddq_f32(v6, vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*((void *)v32 + 1))), v5, *(float32x2_t *)((char *)v32 + 8), 1));
      float32x4_t v36 = vsubq_f32(vdivq_f32(v35, (float32x4_t)vdupq_laneq_s32((int32x4_t)v35, 2)), vdivq_f32(v34, (float32x4_t)vdupq_laneq_s32((int32x4_t)v34, 2)));
      float32x2_t v37 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v36, v36)));
      *(float32x2_t *)v35.f32 = vrsqrte_f32(v37);
      *(float32x2_t *)v35.f32 = vmul_f32(*(float32x2_t *)v35.f32, vrsqrts_f32((float32x2_t)v37.u32[0], vmul_f32(*(float32x2_t *)v35.f32, *(float32x2_t *)v35.f32)));
      float v38 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v36.f32, vmul_f32(*(float32x2_t *)v35.f32, vrsqrts_f32((float32x2_t)v37.u32[0], vmul_f32(*(float32x2_t *)v35.f32, *(float32x2_t *)v35.f32))).f32[0]), (float32x2_t)0x3F80000000000000));
      if (v38 < 0.0) {
        float v38 = -v38;
      }
      float v25 = v25 + (float)(*((float *)v32 + 5) * (float)(*((float *)v32 + 4) * v38));
      float v32 = (LineCostProxy *)((char *)v32 + 24);
    }
    while (v32 != v33);
  }
  return (float)((float)((float)(v9 + (float)(i * 1.5)) * 1.25) + (float)((float)(v25 + (float)(j * 1.5)) * 0.75)) * 0.5;
}

- (float)evaluateCostXZ:(CIPerspectiveAutoCalcV2 *)self
{
  float v4 = 0.0;
  *(__n64 *)v5.f32 = CI::Perspective::getRotation((CI::Perspective *)self, *(float *)&v2, 0.0, *((float *)&v2 + 1));
  begin = self->vClusterInliersProxies.__begin_;
  end = self->vClusterInliersProxies.__end_;
  for (float i = 0.0; begin != end; begin = (LineCostProxy *)((char *)begin + 24))
  {
    float32x4_t v11 = vaddq_f32(v7, vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*(void *)begin)), v6, *(float32x2_t *)begin, 1));
    float32x4_t v12 = vaddq_f32(v7, vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*((void *)begin + 1))), v6, *(float32x2_t *)((char *)begin + 8), 1));
    float32x4_t v13 = vsubq_f32(vdivq_f32(v12, (float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2)), vdivq_f32(v11, (float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2)));
    float32x2_t v14 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v13, v13)));
    *(float32x2_t *)v12.f32 = vrsqrte_f32(v14);
    *(float32x2_t *)v12.f32 = vmul_f32(*(float32x2_t *)v12.f32, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(*(float32x2_t *)v12.f32, *(float32x2_t *)v12.f32)));
    float v15 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v13.f32, vmul_f32(*(float32x2_t *)v12.f32, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(*(float32x2_t *)v12.f32, *(float32x2_t *)v12.f32))).f32[0]), (float32x2_t)1065353216));
    if (v15 < 0.0) {
      float v15 = -v15;
    }
    float i = i + (float)(*((float *)begin + 5) * (float)(*((float *)begin + 4) * v15));
  }
  long long v16 = self->vClusterOutliersProxies.__begin_;
  long long v17 = self->vClusterOutliersProxies.__end_;
  if (v16 != v17)
  {
    float v4 = 0.0;
    do
    {
      float32x4_t v18 = vaddq_f32(v7, vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*(void *)v16)), v6, *(float32x2_t *)v16, 1));
      float32x4_t v19 = vaddq_f32(v7, vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*((void *)v16 + 1))), v6, *(float32x2_t *)((char *)v16 + 8), 1));
      float32x4_t v20 = vsubq_f32(vdivq_f32(v19, (float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2)), vdivq_f32(v18, (float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2)));
      float32x2_t v21 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v20, v20)));
      *(float32x2_t *)v19.f32 = vrsqrte_f32(v21);
      *(float32x2_t *)v19.f32 = vmul_f32(*(float32x2_t *)v19.f32, vrsqrts_f32((float32x2_t)v21.u32[0], vmul_f32(*(float32x2_t *)v19.f32, *(float32x2_t *)v19.f32)));
      float v22 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v20.f32, vmul_f32(*(float32x2_t *)v19.f32, vrsqrts_f32((float32x2_t)v21.u32[0], vmul_f32(*(float32x2_t *)v19.f32, *(float32x2_t *)v19.f32))).f32[0]), (float32x2_t)1065353216));
      if (v22 < 0.0) {
        float v22 = -v22;
      }
      float v4 = v4 + (float)(*((float *)v16 + 5) * (float)(*((float *)v16 + 4) * v22));
      long long v16 = (LineCostProxy *)((char *)v16 + 24);
    }
    while (v16 != v17);
  }
  return v4 + (float)(i * 1.5);
}

- (float)evaluateCostYZ:(CIPerspectiveAutoCalcV2 *)self
{
  float v4 = 0.0;
  *(__n64 *)v5.f32 = CI::Perspective::getRotation((CI::Perspective *)self, 0.0, *(float *)&v2, *((float *)&v2 + 1));
  begin = self->hClusterInliersProxies.__begin_;
  end = self->hClusterInliersProxies.__end_;
  for (float i = 0.0; begin != end; begin = (LineCostProxy *)((char *)begin + 24))
  {
    float32x4_t v11 = vaddq_f32(v7, vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*(void *)begin)), v6, *(float32x2_t *)begin, 1));
    float32x4_t v12 = vaddq_f32(v7, vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*((void *)begin + 1))), v6, *(float32x2_t *)((char *)begin + 8), 1));
    float32x4_t v13 = vsubq_f32(vdivq_f32(v12, (float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2)), vdivq_f32(v11, (float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2)));
    float32x2_t v14 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v13, v13)));
    *(float32x2_t *)v12.f32 = vrsqrte_f32(v14);
    *(float32x2_t *)v12.f32 = vmul_f32(*(float32x2_t *)v12.f32, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(*(float32x2_t *)v12.f32, *(float32x2_t *)v12.f32)));
    float v15 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v13.f32, vmul_f32(*(float32x2_t *)v12.f32, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(*(float32x2_t *)v12.f32, *(float32x2_t *)v12.f32))).f32[0]), (float32x2_t)0x3F80000000000000));
    if (v15 < 0.0) {
      float v15 = -v15;
    }
    float i = i + (float)(*((float *)begin + 5) * (float)(*((float *)begin + 4) * v15));
  }
  long long v16 = self->hClusterOutliersProxies.__begin_;
  long long v17 = self->hClusterOutliersProxies.__end_;
  if (v16 != v17)
  {
    float v4 = 0.0;
    do
    {
      float32x4_t v18 = vaddq_f32(v7, vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*(void *)v16)), v6, *(float32x2_t *)v16, 1));
      float32x4_t v19 = vaddq_f32(v7, vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*((void *)v16 + 1))), v6, *(float32x2_t *)((char *)v16 + 8), 1));
      float32x4_t v20 = vsubq_f32(vdivq_f32(v19, (float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2)), vdivq_f32(v18, (float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2)));
      float32x2_t v21 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v20, v20)));
      *(float32x2_t *)v19.f32 = vrsqrte_f32(v21);
      *(float32x2_t *)v19.f32 = vmul_f32(*(float32x2_t *)v19.f32, vrsqrts_f32((float32x2_t)v21.u32[0], vmul_f32(*(float32x2_t *)v19.f32, *(float32x2_t *)v19.f32)));
      float v22 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v20.f32, vmul_f32(*(float32x2_t *)v19.f32, vrsqrts_f32((float32x2_t)v21.u32[0], vmul_f32(*(float32x2_t *)v19.f32, *(float32x2_t *)v19.f32))).f32[0]), (float32x2_t)0x3F80000000000000));
      if (v22 < 0.0) {
        float v22 = -v22;
      }
      float v4 = v4 + (float)(*((float *)v16 + 5) * (float)(*((float *)v16 + 4) * v22));
      long long v16 = (LineCostProxy *)((char *)v16 + 24);
    }
    while (v16 != v17);
  }
  return v4 + (float)(i * 2.0);
}

- (void)runOptimization
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  objc_super v3 = ci_signpost_log_perspectiveAC();
  float v4 = ci_signpost_log_perspectiveAC();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v3))
    {
      int64_t v7 = (self->vClusterInliers.__end_ - self->vClusterInliers.__begin_) >> 4;
      int64_t v8 = (self->vClusterOutliers.__end_ - self->vClusterOutliers.__begin_) >> 4;
      int64_t v9 = (self->hClusterInliers.__end_ - self->hClusterInliers.__begin_) >> 4;
      int64_t v10 = (self->hClusterOutliers.__end_ - self->hClusterOutliers.__begin_) >> 4;
      *(_DWORD *)buf = 134218752;
      int64_t v75 = v7;
      __int16 v76 = 2048;
      int64_t v77 = v8;
      __int16 v78 = 2048;
      int64_t v79 = v9;
      __int16 v80 = 2048;
      *(void *)float32x4_t v81 = v10;
      _os_signpost_emit_with_name_impl(&dword_193671000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v6, "runOptimization", "vClusterInliers: %lu vClusterOutliers: %luhClusterInliers: %lu hClusterOutliers: %lu", buf, 0x2Au);
    }
  }
  self->solutionType = 0;
  p_solution = &self->solution;
  self->solution = (Solution)xmmword_193954F00;
  begin = self->vLines.__begin_;
  end = self->vLines.__end_;
  if (begin == end)
  {
    float32x4_t v18 = self->hLines.__begin_;
    float32x4_t v19 = self->hLines.__end_;
    float v14 = 0.0;
    if (v18 == v19)
    {
      uint64_t v20 = 0;
      float v59 = 0.0;
      float v31 = INFINITY;
      float v60 = 0.0;
      float v30 = 0.0;
      float v26 = 0.0;
      float rX = 0.0;
      float rY = 0.0;
      float rZ = 0.0;
      float v22 = INFINITY;
      float v32 = INFINITY;
      goto LABEL_24;
    }
LABEL_11:
    float v26 = 0.0;
    do
    {
      float32x2_t v27 = *(float32x2_t *)v18;
      float32x2_t v28 = *(float32x2_t *)((char *)v18 + 8);
      float32x4_t v18 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v18 + 16);
      float32x2_t v29 = vsub_f32(v27, v28);
      float v26 = v26 + sqrtf(vaddv_f32(vmul_f32(v29, v29)));
    }
    while (v18 != v19);
    float v30 = v14 + v26;
    BOOL v23 = v26 > 500.0;
    if (v14 <= 500.0 || v26 <= 500.0)
    {
      if (v14 <= 500.0)
      {
        uint64_t v20 = 0;
        float v59 = 0.0;
        float v31 = INFINITY;
        float v60 = 0.0;
        float rX = 0.0;
        float rY = 0.0;
        float rZ = 0.0;
        float v22 = INFINITY;
        float v32 = INFINITY;
        if (v26 <= 500.0) {
          goto LABEL_24;
        }
        goto LABEL_22;
      }
      float v61 = v14 + v26;
      float rZ = 0.0;
      float v22 = INFINITY;
      float rY = 0.0;
      float rX = 0.0;
    }
    else
    {
      float v61 = v14 + v26;
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __42__CIPerspectiveAutoCalcV2_runOptimization__block_invoke;
      v73[3] = &unk_1E5772858;
      v73[4] = self;
      long long v70 = xmmword_193954ED0;
      uint64_t v71 = 981668463;
      uint64_t v72 = 0;
      _ZN2CI11Perspective9NMSimplexIDv3_fEC2ENS0_8NMParamsEU13block_pointerFfRKS2_EPS5_m((uint64_t)buf, (uint64_t)&v70, (uint64_t)v73, (uint64_t)self->initialSimplexVerticesXYZ, 0x40uLL);
      float rX = **(float **)&v81[6];
      float rY = *(float *)(*(void *)&v81[6] + 4);
      float rZ = *(float *)(*(void *)&v81[6] + 8);
      float v22 = *(float *)(*(void *)&v81[6] + 16);
      uint64_t v82 = *(void *)&v81[6];
      operator delete(*(void **)&v81[6]);
      BOOL v23 = 1;
    }
LABEL_18:
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __42__CIPerspectiveAutoCalcV2_runOptimization__block_invoke_2;
    v69[3] = &unk_1E5772858;
    v69[4] = self;
    long long v66 = xmmword_193954ED0;
    uint64_t v67 = 981668463;
    uint64_t v68 = 0;
    _ZN2CI11Perspective9NMSimplexIDv2_fEC2ENS0_8NMParamsEU13block_pointerFfRKS2_EPS5_m((uint64_t)buf, (uint64_t)&v66, (uint64_t)v69, (uint64_t)self->initialSimplexVerticesXZ, 0x10uLL);
    LODWORD(v60) = **(void **)&v81[6];
    LODWORD(v59) = HIDWORD(**(void **)&v81[6]);
    float v31 = *(float *)(*(void *)&v81[6] + 8);
    uint64_t v82 = *(void *)&v81[6];
    operator delete(*(void **)&v81[6]);
    if (!v23)
    {
      uint64_t v20 = 0;
      float v32 = INFINITY;
LABEL_23:
      float v30 = v61;
      goto LABEL_24;
    }
    float v30 = v61;
LABEL_22:
    float v61 = v30;
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __42__CIPerspectiveAutoCalcV2_runOptimization__block_invoke_3;
    v65[3] = &unk_1E5772858;
    v65[4] = self;
    long long v62 = xmmword_193954ED0;
    uint64_t v63 = 981668463;
    uint64_t v64 = 0;
    _ZN2CI11Perspective9NMSimplexIDv2_fEC2ENS0_8NMParamsEU13block_pointerFfRKS2_EPS5_m((uint64_t)buf, (uint64_t)&v62, (uint64_t)v65, (uint64_t)self->initialSimplexVerticesYZ, 0x10uLL);
    uint64_t v58 = **(void **)&v81[6];
    float v32 = *(float *)(*(void *)&v81[6] + 8);
    uint64_t v82 = *(void *)&v81[6];
    operator delete(*(void **)&v81[6]);
    uint64_t v20 = v58;
    goto LABEL_23;
  }
  float v14 = 0.0;
  do
  {
    float32x2_t v15 = *(float32x2_t *)begin;
    float32x2_t v16 = *(float32x2_t *)((char *)begin + 8);
    begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 16);
    float32x2_t v17 = vsub_f32(v15, v16);
    float v14 = v14 + sqrtf(vaddv_f32(vmul_f32(v17, v17)));
  }
  while (begin != end);
  float32x4_t v18 = self->hLines.__begin_;
  float32x4_t v19 = self->hLines.__end_;
  if (v18 != v19) {
    goto LABEL_11;
  }
  uint64_t v20 = 0;
  float rZ = 0.0;
  float v22 = INFINITY;
  if (v14 > 500.0)
  {
    BOOL v23 = 0;
    float rY = 0.0;
    float rX = 0.0;
    float v26 = 0.0;
    float v61 = v14;
    goto LABEL_18;
  }
  float v31 = INFINITY;
  float v59 = 0.0;
  float v60 = 0.0;
  float v30 = v14;
  float v26 = 0.0;
  float rX = 0.0;
  float v32 = INFINITY;
  float rY = 0.0;
LABEL_24:
  float v33 = (float)(v22 / v30) * 0.5;
  float v34 = (float)(v31 / v14) * 0.75;
  float v35 = v32 / v26;
  if (v33 > v34 || v33 > v35)
  {
    if (v34 > v33 || v34 > v35)
    {
      if (v35 > v33 || v35 > v34)
      {
        int v39 = 0;
        float rX = p_solution->rX;
        float rY = self->solution.rY;
        float rZ = self->solution.rZ;
        float v41 = 0.0;
        float v40 = INFINITY;
        float v42 = 0.0;
        float v43 = 0.0;
      }
      else
      {
        self->solutionType = 3;
        p_solution->float rX = 0.0;
        *(void *)&self->solution.float rY = v20;
        self->solution.cost = v32;
        BOOL v45 = v33 > v34;
        if (v33 <= v34) {
          int v39 = 1;
        }
        else {
          int v39 = 2;
        }
        if (v33 <= v34) {
          float v40 = v22;
        }
        else {
          float v40 = v31;
        }
        float v41 = v59;
        if (!v45) {
          float v41 = rZ;
        }
        float v42 = 0.0;
        if (!v45) {
          float v42 = rY;
        }
        float v43 = v60;
        if (!v45) {
          float v43 = rX;
        }
        float rZ = *((float *)&v20 + 1);
        float rY = *(float *)&v20;
        float rX = 0.0;
      }
    }
    else
    {
      self->solutionType = 2;
      *(void *)&p_solution->float rX = LODWORD(v60);
      self->solution.float rZ = v59;
      self->solution.cost = v31;
      BOOL v44 = v33 > v35;
      if (v33 <= v35) {
        int v39 = 1;
      }
      else {
        int v39 = 3;
      }
      if (v33 <= v35) {
        float v40 = v22;
      }
      else {
        float v40 = v32;
      }
      float v41 = *((float *)&v20 + 1);
      if (v44)
      {
        float v42 = *(float *)&v20;
      }
      else
      {
        float v41 = rZ;
        float v42 = rY;
      }
      float rY = 0.0;
      if (v44) {
        float v43 = 0.0;
      }
      else {
        float v43 = rX;
      }
      float rZ = v59;
      float rX = v60;
    }
  }
  else
  {
    self->solutionType = 1;
    p_solution->float rX = rX;
    self->solution.float rY = rY;
    self->solution.float rZ = rZ;
    self->solution.cost = v22;
    int v39 = 2;
    float v40 = v31;
    float v41 = v59;
    float v42 = 0.0;
    float v43 = v60;
  }
  self->unlimitedPitch = rX;
  self->unlimitedYaw = rY;
  self->unlimitedRoll = rZ;
  float v46 = -rX;
  if (rX >= 0.0) {
    float v46 = rX;
  }
  double v47 = v46;
  double pitchLimit = self->super.config.pitchLimit;
  if (pitchLimit < v47) {
    goto LABEL_76;
  }
  float v49 = -rY;
  if (rY >= 0.0) {
    float v49 = rY;
  }
  if (self->super.config.yawLimit < v49) {
    goto LABEL_76;
  }
  float v50 = -rZ;
  if (rZ >= 0.0) {
    float v50 = rZ;
  }
  if (self->super.config.rollLimit >= v50)
  {
    self->super.float pitch = rX;
    self->super.float yaw = rY;
    self->super.float roll = rZ;
  }
  else
  {
LABEL_76:
    float v51 = -v43;
    if (v43 >= 0.0) {
      float v51 = v43;
    }
    if (pitchLimit < v51) {
      goto LABEL_85;
    }
    float v52 = -v42;
    if (v42 >= 0.0) {
      float v52 = v42;
    }
    if (self->super.config.yawLimit < v52) {
      goto LABEL_85;
    }
    float v53 = -v41;
    if (v41 >= 0.0) {
      float v53 = v41;
    }
    if (self->super.config.rollLimit >= v53)
    {
      self->solutionType = v39;
      p_solution->float rX = v43;
      self->solution.float rY = v42;
      self->solution.float rZ = v41;
      self->solution.cost = v40;
      self->super.float pitch = v43;
      self->super.float yaw = v42;
      self->super.float roll = v41;
    }
    else
    {
LABEL_85:
      self->super.pitchFailureReason = 1;
      self->super.yawFailureReason = 1;
    }
  }
  if (self->solution.cost == INFINITY)
  {
    self->super.pitchFailureReason = 2;
    self->super.yawFailureReason = 2;
  }
  else
  {
    float32x4_t v54 = ci_signpost_log_perspectiveAC();
    float32x4_t v55 = ci_signpost_log_perspectiveAC();
    os_signpost_id_t v56 = os_signpost_id_make_with_pointer(v55, self);
    if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v57 = v56;
      if (os_signpost_enabled(v54))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_193671000, v54, OS_SIGNPOST_INTERVAL_END, v57, "runOptimization", "", buf, 2u);
      }
    }
  }
}

uint64_t __42__CIPerspectiveAutoCalcV2_runOptimization__block_invoke(uint64_t a1, double *a2)
{
  return [*(id *)(a1 + 32) evaluateCost:*a2];
}

uint64_t __42__CIPerspectiveAutoCalcV2_runOptimization__block_invoke_2(uint64_t a1, double *a2)
{
  return [*(id *)(a1 + 32) evaluateCostXZ:*a2];
}

uint64_t __42__CIPerspectiveAutoCalcV2_runOptimization__block_invoke_3(uint64_t a1, double *a2)
{
  return [*(id *)(a1 + 32) evaluateCostYZ:*a2];
}

- (void)computeConfidence
{
  double v3 = 0.0;
  if (self->solution.cost != INFINITY)
  {
    float pitch = self->super.pitch;
    float yaw = self->super.yaw;
    float roll = self->super.roll;
    *(__n64 *)v7.f32 = CI::Perspective::getRotation((CI::Perspective *)self, pitch, yaw, roll);
    float v10 = 0.0;
    float v11 = 0.0;
    switch(self->solutionType)
    {
      case 0:
        break;
      case 1:
        begin = self->vClusterInliersProxies.__begin_;
        for (float i = self->vClusterInliersProxies.__end_; begin != i; begin = (LineCostProxy *)((char *)begin + 24))
        {
          float32x4_t v14 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*(void *)begin)), v8, *(float32x2_t *)begin, 1));
          float32x4_t v15 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*((void *)begin + 1))), v8, *(float32x2_t *)((char *)begin + 8), 1));
          float32x4_t v16 = vsubq_f32(vdivq_f32(v15, (float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2)), vdivq_f32(v14, (float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2)));
          float32x2_t v17 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v16, v16)));
          *(float32x2_t *)v15.f32 = vrsqrte_f32(v17);
          *(float32x2_t *)v15.f32 = vmul_f32(*(float32x2_t *)v15.f32, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(*(float32x2_t *)v15.f32, *(float32x2_t *)v15.f32)));
          float v18 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v16.f32, vmul_f32(*(float32x2_t *)v15.f32, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(*(float32x2_t *)v15.f32, *(float32x2_t *)v15.f32))).f32[0]), (float32x2_t)1065353216));
          if (v18 < 0.0) {
            float v18 = -v18;
          }
          float v19 = *((float *)begin + 4);
          float v20 = *((float *)begin + 5);
          float v10 = v10 + (float)((float)(v20 * (float)(v19 * v18)) * 2.0);
          float v11 = v11 + (float)(v19 * v20);
        }
        float32x2_t v21 = self->vClusterOutliersProxies.__begin_;
        for (j = self->vClusterOutliersProxies.__end_; v21 != j; float32x2_t v21 = (LineCostProxy *)((char *)v21 + 24))
        {
          float32x4_t v23 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*(void *)v21)), v8, *(float32x2_t *)v21, 1));
          float32x4_t v24 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*((void *)v21 + 1))), v8, *(float32x2_t *)((char *)v21 + 8), 1));
          float32x4_t v25 = vsubq_f32(vdivq_f32(v24, (float32x4_t)vdupq_laneq_s32((int32x4_t)v24, 2)), vdivq_f32(v23, (float32x4_t)vdupq_laneq_s32((int32x4_t)v23, 2)));
          float32x2_t v26 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v25, v25)));
          *(float32x2_t *)v24.f32 = vrsqrte_f32(v26);
          *(float32x2_t *)v24.f32 = vmul_f32(*(float32x2_t *)v24.f32, vrsqrts_f32((float32x2_t)v26.u32[0], vmul_f32(*(float32x2_t *)v24.f32, *(float32x2_t *)v24.f32)));
          float v27 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v25.f32, vmul_f32(*(float32x2_t *)v24.f32, vrsqrts_f32((float32x2_t)v26.u32[0], vmul_f32(*(float32x2_t *)v24.f32, *(float32x2_t *)v24.f32))).f32[0]), (float32x2_t)1065353216));
          if (v27 < 0.0) {
            float v27 = -v27;
          }
          float v28 = *((float *)v21 + 4);
          float v29 = *((float *)v21 + 5);
          float v10 = v10 + (float)(v29 * (float)(v28 * v27));
          float v11 = v11 + (float)(v28 * v29);
        }
        float v30 = self->hClusterInliersProxies.__begin_;
        for (k = self->hClusterInliersProxies.__end_; v30 != k; float v30 = (LineCostProxy *)((char *)v30 + 24))
        {
          float32x4_t v32 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*(void *)v30)), v8, *(float32x2_t *)v30, 1));
          float32x4_t v33 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*((void *)v30 + 1))), v8, *(float32x2_t *)((char *)v30 + 8), 1));
          float32x4_t v34 = vsubq_f32(vdivq_f32(v33, (float32x4_t)vdupq_laneq_s32((int32x4_t)v33, 2)), vdivq_f32(v32, (float32x4_t)vdupq_laneq_s32((int32x4_t)v32, 2)));
          float32x2_t v35 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v34, v34)));
          *(float32x2_t *)v33.f32 = vrsqrte_f32(v35);
          *(float32x2_t *)v33.f32 = vmul_f32(*(float32x2_t *)v33.f32, vrsqrts_f32((float32x2_t)v35.u32[0], vmul_f32(*(float32x2_t *)v33.f32, *(float32x2_t *)v33.f32)));
          float v36 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v34.f32, vmul_f32(*(float32x2_t *)v33.f32, vrsqrts_f32((float32x2_t)v35.u32[0], vmul_f32(*(float32x2_t *)v33.f32, *(float32x2_t *)v33.f32))).f32[0]), (float32x2_t)0x3F80000000000000));
          if (v36 < 0.0) {
            float v36 = -v36;
          }
          float v37 = *((float *)v30 + 4);
          float v38 = *((float *)v30 + 5);
          float v10 = v10 + (float)((float)(v38 * (float)(v37 * v36)) * 2.0);
          float v11 = v11 + (float)(v37 * v38);
        }
        int v39 = self->hClusterOutliersProxies.__begin_;
        for (m = self->hClusterOutliersProxies.__end_; v39 != m; int v39 = (LineCostProxy *)((char *)v39 + 24))
        {
          float32x4_t v41 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*(void *)v39)), v8, *(float32x2_t *)v39, 1));
          float32x4_t v42 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*((void *)v39 + 1))), v8, *(float32x2_t *)((char *)v39 + 8), 1));
          float32x4_t v43 = vsubq_f32(vdivq_f32(v42, (float32x4_t)vdupq_laneq_s32((int32x4_t)v42, 2)), vdivq_f32(v41, (float32x4_t)vdupq_laneq_s32((int32x4_t)v41, 2)));
          float32x2_t v44 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v43, v43)));
          *(float32x2_t *)v42.f32 = vrsqrte_f32(v44);
          *(float32x2_t *)v42.f32 = vmul_f32(*(float32x2_t *)v42.f32, vrsqrts_f32((float32x2_t)v44.u32[0], vmul_f32(*(float32x2_t *)v42.f32, *(float32x2_t *)v42.f32)));
          float v45 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v43.f32, vmul_f32(*(float32x2_t *)v42.f32, vrsqrts_f32((float32x2_t)v44.u32[0], vmul_f32(*(float32x2_t *)v42.f32, *(float32x2_t *)v42.f32))).f32[0]), (float32x2_t)0x3F80000000000000));
          if (v45 < 0.0) {
            float v45 = -v45;
          }
          float v46 = *((float *)v39 + 4);
          float v47 = *((float *)v39 + 5);
          float v10 = v10 + (float)(v47 * (float)(v46 * v45));
          float v11 = v11 + (float)(v46 * v47);
        }
        goto LABEL_37;
      case 2:
        float32x4_t v48 = self->vClusterInliersProxies.__begin_;
        for (n = self->vClusterInliersProxies.__end_; v48 != n; float32x4_t v48 = (LineCostProxy *)((char *)v48 + 24))
        {
          float32x4_t v50 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*(void *)v48)), v8, *(float32x2_t *)v48, 1));
          float32x4_t v51 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*((void *)v48 + 1))), v8, *(float32x2_t *)((char *)v48 + 8), 1));
          float32x4_t v52 = vsubq_f32(vdivq_f32(v51, (float32x4_t)vdupq_laneq_s32((int32x4_t)v51, 2)), vdivq_f32(v50, (float32x4_t)vdupq_laneq_s32((int32x4_t)v50, 2)));
          float32x2_t v53 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v52, v52)));
          *(float32x2_t *)v51.f32 = vrsqrte_f32(v53);
          *(float32x2_t *)v51.f32 = vmul_f32(*(float32x2_t *)v51.f32, vrsqrts_f32((float32x2_t)v53.u32[0], vmul_f32(*(float32x2_t *)v51.f32, *(float32x2_t *)v51.f32)));
          float v54 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v52.f32, vmul_f32(*(float32x2_t *)v51.f32, vrsqrts_f32((float32x2_t)v53.u32[0], vmul_f32(*(float32x2_t *)v51.f32, *(float32x2_t *)v51.f32))).f32[0]), (float32x2_t)1065353216));
          if (v54 < 0.0) {
            float v54 = -v54;
          }
          float v55 = *((float *)v48 + 4);
          float v56 = *((float *)v48 + 5);
          float v10 = v10 + (float)((float)(v56 * (float)(v55 * v54)) * 2.0);
          float v11 = v11 + (float)(v55 * v56);
        }
        os_signpost_id_t v57 = self->vClusterOutliersProxies.__begin_;
        for (ifloat i = self->vClusterOutliersProxies.__end_; v57 != ii; v57 = (LineCostProxy *)((char *)v57 + 24))
        {
          float32x4_t v59 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*(void *)v57)), v8, *(float32x2_t *)v57, 1));
          float32x4_t v60 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*((void *)v57 + 1))), v8, *(float32x2_t *)((char *)v57 + 8), 1));
          float32x4_t v61 = vsubq_f32(vdivq_f32(v60, (float32x4_t)vdupq_laneq_s32((int32x4_t)v60, 2)), vdivq_f32(v59, (float32x4_t)vdupq_laneq_s32((int32x4_t)v59, 2)));
          float32x2_t v62 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v61, v61)));
          *(float32x2_t *)v60.f32 = vrsqrte_f32(v62);
          *(float32x2_t *)v60.f32 = vmul_f32(*(float32x2_t *)v60.f32, vrsqrts_f32((float32x2_t)v62.u32[0], vmul_f32(*(float32x2_t *)v60.f32, *(float32x2_t *)v60.f32)));
          float v63 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v61.f32, vmul_f32(*(float32x2_t *)v60.f32, vrsqrts_f32((float32x2_t)v62.u32[0], vmul_f32(*(float32x2_t *)v60.f32, *(float32x2_t *)v60.f32))).f32[0]), (float32x2_t)1065353216));
          if (v63 < 0.0) {
            float v63 = -v63;
          }
          float v64 = *((float *)v57 + 4);
          float v65 = *((float *)v57 + 5);
          float v10 = v10 + (float)(v65 * (float)(v64 * v63));
          float v11 = v11 + (float)(v64 * v65);
        }
        goto LABEL_37;
      case 3:
        long long v66 = self->hClusterInliersProxies.__begin_;
        for (jj = self->hClusterInliersProxies.__end_; v66 != jj; long long v66 = (LineCostProxy *)((char *)v66 + 24))
        {
          float32x4_t v68 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*(void *)v66)), v8, *(float32x2_t *)v66, 1));
          float32x4_t v69 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*((void *)v66 + 1))), v8, *(float32x2_t *)((char *)v66 + 8), 1));
          float32x4_t v70 = vsubq_f32(vdivq_f32(v69, (float32x4_t)vdupq_laneq_s32((int32x4_t)v69, 2)), vdivq_f32(v68, (float32x4_t)vdupq_laneq_s32((int32x4_t)v68, 2)));
          float32x2_t v71 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v70, v70)));
          *(float32x2_t *)v69.f32 = vrsqrte_f32(v71);
          *(float32x2_t *)v69.f32 = vmul_f32(*(float32x2_t *)v69.f32, vrsqrts_f32((float32x2_t)v71.u32[0], vmul_f32(*(float32x2_t *)v69.f32, *(float32x2_t *)v69.f32)));
          float v72 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v70.f32, vmul_f32(*(float32x2_t *)v69.f32, vrsqrts_f32((float32x2_t)v71.u32[0], vmul_f32(*(float32x2_t *)v69.f32, *(float32x2_t *)v69.f32))).f32[0]), (float32x2_t)0x3F80000000000000));
          if (v72 < 0.0) {
            float v72 = -v72;
          }
          float v73 = *((float *)v66 + 4);
          float v74 = *((float *)v66 + 5);
          float v10 = v10 + (float)((float)(v74 * (float)(v73 * v72)) * 2.0);
          float v11 = v11 + (float)(v73 * v74);
        }
        int64_t v75 = self->hClusterOutliersProxies.__begin_;
        for (kk = self->hClusterOutliersProxies.__end_; v75 != kk; int64_t v75 = (LineCostProxy *)((char *)v75 + 24))
        {
          float32x4_t v77 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*(void *)v75)), v8, *(float32x2_t *)v75, 1));
          float32x4_t v78 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*((void *)v75 + 1))), v8, *(float32x2_t *)((char *)v75 + 8), 1));
          float32x4_t v79 = vsubq_f32(vdivq_f32(v78, (float32x4_t)vdupq_laneq_s32((int32x4_t)v78, 2)), vdivq_f32(v77, (float32x4_t)vdupq_laneq_s32((int32x4_t)v77, 2)));
          float32x2_t v80 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v79, v79)));
          *(float32x2_t *)v78.f32 = vrsqrte_f32(v80);
          *(float32x2_t *)v78.f32 = vmul_f32(*(float32x2_t *)v78.f32, vrsqrts_f32((float32x2_t)v80.u32[0], vmul_f32(*(float32x2_t *)v78.f32, *(float32x2_t *)v78.f32)));
          float v81 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v79.f32, vmul_f32(*(float32x2_t *)v78.f32, vrsqrts_f32((float32x2_t)v80.u32[0], vmul_f32(*(float32x2_t *)v78.f32, *(float32x2_t *)v78.f32))).f32[0]), (float32x2_t)0x3F80000000000000));
          if (v81 < 0.0) {
            float v81 = -v81;
          }
          float v82 = *((float *)v75 + 4);
          float v83 = *((float *)v75 + 5);
          float v10 = v10 + (float)(v83 * (float)(v82 * v81));
          float v11 = v11 + (float)(v82 * v83);
        }
        goto LABEL_37;
      default:
LABEL_37:
        float v84 = fminf(fmaxf((float)((float)(v10 / v11) + -0.01) / 0.09, 0.0), 1.0);
        double v3 = 1.0 - (v84 * -2.0 + 3.0) * (float)(v84 * v84);
        break;
    }
  }
  self->super.confidence = v3;
}

- (double)unlimitedPitch
{
  return self->unlimitedPitch;
}

- (double)unlimitedYaw
{
  return self->unlimitedYaw;
}

- (double)unlimitedRoll
{
  return self->unlimitedRoll;
}

- (void).cxx_destruct
{
  p_hClusterOutliersProxies = &self->hClusterOutliersProxies;
  begin = self->hClusterOutliersProxies.__begin_;
  if (begin)
  {
    p_hClusterOutliersProxies->__end_ = begin;
    operator delete(begin);
  }
  os_signpost_id_t v5 = self->vClusterOutliersProxies.__begin_;
  if (v5)
  {
    self->vClusterOutliersProxies.__end_ = v5;
    operator delete(v5);
  }
  os_signpost_id_t v6 = self->hClusterInliersProxies.__begin_;
  if (v6)
  {
    self->hClusterInliersProxies.__end_ = v6;
    operator delete(v6);
  }
  float32x4_t v7 = self->vClusterInliersProxies.__begin_;
  if (v7)
  {
    self->vClusterInliersProxies.__end_ = v7;
    operator delete(v7);
  }
  float32x4_t v8 = self->hClusterOutliers.__begin_;
  if (v8)
  {
    self->hClusterOutliers.__end_ = v8;
    operator delete(v8);
  }
  float32x4_t v9 = self->vClusterOutliers.__begin_;
  if (v9)
  {
    self->vClusterOutliers.__end_ = v9;
    operator delete(v9);
  }
  float v10 = self->hClusterInliers.__begin_;
  if (v10)
  {
    self->hClusterInliers.__end_ = v10;
    operator delete(v10);
  }
  float v11 = self->vClusterInliers.__begin_;
  if (v11)
  {
    self->vClusterInliers.__end_ = v11;
    operator delete(v11);
  }
  float32x4_t v12 = self->hLines.__begin_;
  if (v12)
  {
    self->hLines.__end_ = v12;
    operator delete(v12);
  }
  float32x4_t v13 = self->vLines.__begin_;
  if (v13)
  {
    self->vLines.__end_ = v13;
    operator delete(v13);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 20) = 0u;
  *((void *)self + 48) = 0;
  *((void *)self + 49) = 0;
  *((void *)self + 47) = 0;
  *((void *)self + 51) = 0;
  *((void *)self + 52) = 0;
  *((void *)self + 50) = 0;
  *((void *)self + 54) = 0;
  *((void *)self + 55) = 0;
  *((void *)self + 53) = 0;
  *((void *)self + 57) = 0;
  *((void *)self + 58) = 0;
  *((void *)self + 56) = 0;
  *((void *)self + 60) = 0;
  *((void *)self + 61) = 0;
  *((void *)self + 59) = 0;
  *((void *)self + 63) = 0;
  *((void *)self + 64) = 0;
  *((void *)self + 62) = 0;
  *((void *)self + 66) = 0;
  *((void *)self + 67) = 0;
  *((void *)self + 65) = 0;
  *((void *)self + 69) = 0;
  *((void *)self + 70) = 0;
  *((void *)self + 68) = 0;
  *((void *)self + 72) = 0;
  *((void *)self + 73) = 0;
  *((void *)self + 71) = 0;
  *((void *)self + 75) = 0;
  *((void *)self + 76) = 0;
  *((void *)self + 74) = 0;
  return self;
}

@end