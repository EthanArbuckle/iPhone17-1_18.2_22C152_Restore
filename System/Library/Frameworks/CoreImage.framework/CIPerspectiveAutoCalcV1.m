@interface CIPerspectiveAutoCalcV1
- (BOOL)compute;
- (CIPerspectiveAutoCalcV1)initWithContext:(id)a3 image:(id)a4 config:(id *)a5;
- (double)confidence;
- (double)minimumPitchCorrectionAreaCoverage;
- (double)minimumYawCorrectionAreaCoverage;
- (float)pitchCorrectionAreaCoverage;
- (float)yawCorrectionAreaCoverage;
- (id).cxx_construct;
- (void)clusterLineSegments;
- (void)computeGuides;
- (void)computeTransform;
- (void)createGradientMap;
- (void)dealloc;
- (void)extractLineSegments;
- (void)normalizeGradientMap;
- (void)rangeLimitGradientMap;
- (void)setMinimumPitchCorrectionAreaCoverage:(double)a3;
- (void)setMinimumYawCorrectionAreaCoverage:(double)a3;
- (void)standardizeImage;
- (void)thresholdGradientMap;
@end

@implementation CIPerspectiveAutoCalcV1

- (CIPerspectiveAutoCalcV1)initWithContext:(id)a3 image:(id)a4 config:(id *)a5
{
  v26.receiver = self;
  v26.super_class = (Class)CIPerspectiveAutoCalcV1;
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
  v3.super_class = (Class)CIPerspectiveAutoCalcV1;
  [(CIPerspectiveAutoCalc *)&v3 dealloc];
}

- (BOOL)compute
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
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
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v8;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = (int)v9;
      _os_signpost_emit_with_name_impl(&dword_193671000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v6, "compute", "imageSize: %d x %d", buf, 0xEu);
    }
  }
  [(CIPerspectiveAutoCalcV1 *)self standardizeImage];
  [(CIPerspectiveAutoCalcV1 *)self createGradientMap];
  [(CIPerspectiveAutoCalcV1 *)self normalizeGradientMap];
  [(CIPerspectiveAutoCalcV1 *)self thresholdGradientMap];
  [(CIPerspectiveAutoCalcV1 *)self rangeLimitGradientMap];
  [(CIPerspectiveAutoCalcV1 *)self extractLineSegments];
  [(CIPerspectiveAutoCalcV1 *)self clusterLineSegments];
  [(CIPerspectiveAutoCalcV1 *)self computeGuides];
  [(CIPerspectiveAutoCalcV1 *)self computeTransform];
  double v10 = ci_signpost_log_perspectiveAC();
  v11 = ci_signpost_log_perspectiveAC();
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, self);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193671000, v10, OS_SIGNPOST_INTERVAL_END, v13, "compute", "", buf, 2u);
    }
  }
  if ([(CIPerspectiveAutoCalc *)self generateDebugImage])
  {
    img = self->super.img;
    self->super.debugImage = img;
    int32x4_t v15 = CGColorCreateSRGB(1.0, 0.0, 0.0, 1.0);
    v16 = (CIImage *)CI::Perspective::plotLines<CI::Perspective::Line>(img, v15, (uint64_t **)&self->vLines);
    self->super.debugImage = v16;
    v17 = CGColorCreateSRGB(1.0, 0.0, 0.0, 1.0);
    v18 = (CIImage *)CI::Perspective::plotLines<CI::Perspective::Line>(v16, v17, (uint64_t **)&self->hLines);
    self->super.debugImage = v18;
    if (self->vGuidesValid)
    {
      v19 = CGColorCreateSRGB(0.0, 1.0, 0.0, 1.0);
      v20 = (CIImage *)CI::Perspective::plotLines<CI::Perspective::Line>(v18, v19, (uint64_t **)&self->vLineCluster);
      self->super.debugImage = v20;
      int32x4_t v21 = CGColorCreateSRGB(0.0, 1.0, 1.0, 1.0);
      long long v22 = *(_OWORD *)&self->_anon_1f8[4];
      *(_OWORD *)buf = *(_OWORD *)&self->_anon_1e8[4];
      long long v37 = v22;
      float v23 = (uint64_t *)operator new(0x20uLL);
      v33 = v23;
      v35 = (char *)(v23 + 4);
      long long v24 = v37;
      *(_OWORD *)float v23 = *(_OWORD *)buf;
      *((_OWORD *)v23 + 1) = v24;
      v34 = (char *)(v23 + 4);
      self->super.debugImage = (CIImage *)CI::Perspective::plotLines<CI::Perspective::Line>(v20, v21, &v33);
      operator delete(v23);
    }
    if (self->hGuidesValid)
    {
      debugImage = self->super.debugImage;
      objc_super v26 = CGColorCreateSRGB(0.0, 1.0, 0.0, 1.0);
      simd_float3x3 v27 = (CIImage *)CI::Perspective::plotLines<CI::Perspective::Line>(debugImage, v26, (uint64_t **)&self->hLineCluster);
      self->super.debugImage = v27;
      simd_float3x3 v28 = CGColorCreateSRGB(0.0, 1.0, 1.0, 1.0);
      long long v29 = *(_OWORD *)&self->_anon_218[4];
      *(_OWORD *)buf = *(_OWORD *)&self->_anon_208[4];
      long long v37 = v29;
      v30 = (uint64_t *)operator new(0x20uLL);
      v33 = v30;
      v35 = (char *)(v30 + 4);
      long long v31 = v37;
      *(_OWORD *)v30 = *(_OWORD *)buf;
      *((_OWORD *)v30 + 1) = v31;
      v34 = (char *)(v30 + 4);
      self->super.debugImage = (CIImage *)CI::Perspective::plotLines<CI::Perspective::Line>(v27, v28, &v33);
      operator delete(v30);
    }
  }
  return 1;
}

- (double)confidence
{
  double result = self->super.confidence;
  if (result < 0.0)
  {
    float vGuidesAOE = self->vGuidesAOE;
    if (vGuidesAOE <= self->hGuidesAOE) {
      float vGuidesAOE = self->hGuidesAOE;
    }
    double result = (float)(vGuidesAOE / (float)(self->gradMapH * self->gradMapW));
    self->super.confidence = result;
  }
  return result;
}

- (void)standardizeImage
{
  [(CIImage *)self->super.img extent];
  if (v5 <= v6) {
    double v5 = v6;
  }
  *(float *)&unsigned int v7 = 1024.0 / v5;
  LODWORD(v8) = 0;
  unint64_t v9 = v7;
  HIDWORD(v8) = v7;
  *(_OWORD *)self->_anon_f0 = v7;
  *(_OWORD *)&self->_anon_f0[16] = v8;
  double v10 = *(float *)&v7;
  *(void *)&v3.f64[1] = v4.i64[0];
  *(float32x2_t *)v4.i8 = vcvt_f32_f64(vmulq_n_f64(v3, (float)-*(float *)&v7));
  float32x2_t v21 = *(float32x2_t *)v4.i8;
  int32x4_t v11 = vuzp2q_s32(v4, vzip1q_s32(v4, v4));
  __asm { FMOV            V1.4S, #1.0 }
  v24.columns[2] = (simd_float3)vzip1q_s32(vzip2q_s32(v11, _Q1), v11);
  *(simd_float3 *)&self->_anon_f0[32] = v24.columns[2];
  v24.columns[0] = (simd_float3)v9;
  v24.columns[1] = (simd_float3)v8;
  simd_float3x3 v25 = __invert_f3(v24);
  *(void *)self->_anon_120 = v25.columns[0].i64[0];
  *(_DWORD *)&self->_anon_120[8] = v25.columns[0].i32[2];
  *(void *)&self->_anon_120[16] = v25.columns[1].i64[0];
  *(_DWORD *)&self->_anon_120[24] = v25.columns[1].i32[2];
  *(void *)&self->_anon_120[32] = v25.columns[2].i64[0];
  *(_DWORD *)&self->_anon_120[40] = v25.columns[2].i32[2];
  v22[1] = 0;
  v22[2] = 0;
  img = self->super.img;
  *(double *)long long v22 = v10;
  *(double *)&v22[3] = v10;
  float64x2_t v23 = vcvtq_f64_f32(v21);
  self->super.img = [(CIImage *)img imageByApplyingTransform:v22 highQualityDownsample:1];
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1) {
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_50);
  }
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    v18 = self->super.img;
    v19 = (CIImage *)[NSString stringWithFormat:@"/tmp/PerspectiveV1_%@.png", @"0_standardized"];
    CI::Perspective::CIImageToFile((CI::Perspective *)v18, v19, v20, *MEMORY[0x1E4F1DB20]);
  }
}

- (void)createGradientMap
{
  [(CIImage *)self->super.img extent];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  self->gradMapW = (unint64_t)v7;
  self->gradMapH = (unint64_t)v9;
  int32x4_t v11 = -[CIImage imageByCroppingToRect:]([[(CIImage *)self->super.img imageByClampingToExtent] imageByApplyingGaussianBlurWithSigma:1.2], "imageByCroppingToRect:", v3, v5, v7, v9);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1) {
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_50);
  }
  os_signpost_id_t v12 = (CGRect *)MEMORY[0x1E4F1DB20];
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    os_signpost_id_t v13 = (CIImage *)[NSString stringWithFormat:@"/tmp/PerspectiveV1_%@.png", @"1_Preprocessed"];
    CI::Perspective::CIImageToFile((CI::Perspective *)v11, v13, v14, *v12);
  }
  int32x4_t v15 = [(CIImage *)v11 imageByApplyingFilter:@"CIGaborGradients"];
  self->gradMap = v15;
  [(CIImage *)v15 extent];
  CGRect v32 = CGRectInset(v31, 5.0, 5.0);
  v16 = -[CIImage imageByCroppingToRect:](v15, "imageByCroppingToRect:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
  self->gradMap = v16;
  v17 = [(CIImage *)v16 imageByCompositingOverImage:+[CIImage blackImage]];
  self->gradMap = v17;
  self->gradMap = -[CIImage imageByCroppingToRect:](v17, "imageByCroppingToRect:", v4, v6, v8, v10);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1) {
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_50);
  }
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    v19 = CI::Perspective::gradDirImage((CI::Perspective *)self->gradMap, v18);
    v20 = (CIImage *)[NSString stringWithFormat:@"/tmp/PerspectiveV1_%@.png", @"2_GradMap_dir"];
    CI::Perspective::CIImageToFile((CI::Perspective *)v19, v20, v21, *v12);
    float64x2_t v23 = CI::Perspective::gradMagImage((CI::Perspective *)self->gradMap, v22);
    simd_float3x3 v24 = (CIImage *)[NSString stringWithFormat:@"/tmp/PerspectiveV1_%@.png", @"2_GradMap_mag"];
    CGFloat x = v12->origin.x;
    CGFloat y = v12->origin.y;
    CGFloat width = v12->size.width;
    CGFloat height = v12->size.height;
    CI::Perspective::CIImageToFile((CI::Perspective *)v23, v24, v25, *(CGRect *)&x);
  }
}

- (void)normalizeGradientMap
{
  v26[1] = *MEMORY[0x1E4F143B8];
  [(CIImage *)self->gradMap extent];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  os_signpost_id_t v12 = CI::Perspective::gradMagImage((CI::Perspective *)self->gradMap, v11);
  simd_float3x3 v25 = @"inputExtent";
  [(CIImage *)v12 extent];
  v26[0] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  float v23 = 0.0;
  -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](self->super.ctx, "render:toBitmap:rowBytes:bounds:format:colorSpace:", -[CIImage imageByApplyingFilter:withInputParameters:](v12, "imageByApplyingFilter:withInputParameters:", @"CIAreaMaximum", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1]), &v23, 4, 2309, -[CIContext workingColorSpace](self->super.ctx, "workingColorSpace"), 0.0, 0.0, 1.0, 1.0);
  fprintf((FILE *)*MEMORY[0x1E4F143C8], "maxGradientMagnitude: %f\n", v23);
  os_signpost_id_t v13 = +[CIKernel kernelWithInternalRepresentation:&CI::_gradientNormalizeV1];
  v24[0] = self->gradMap;
  v24[1] = [NSNumber numberWithDouble:1.0 / v23];
  self->gradMap = -[CIColorKernel applyWithExtent:arguments:](v13, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2], v4, v6, v8, v10);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1) {
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_50);
  }
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    int32x4_t v15 = CI::Perspective::gradDirImage((CI::Perspective *)self->gradMap, v14);
    v16 = (CIImage *)[NSString stringWithFormat:@"/tmp/PerspectiveV1_%@.png", @"3_GradMapNormalized_dir"];
    v17 = (CGRect *)MEMORY[0x1E4F1DB20];
    CI::Perspective::CIImageToFile((CI::Perspective *)v15, v16, v18, *MEMORY[0x1E4F1DB20]);
    v20 = CI::Perspective::gradMagImage((CI::Perspective *)self->gradMap, v19);
    float32x2_t v21 = (CIImage *)[NSString stringWithFormat:@"/tmp/PerspectiveV1_%@.png", @"3_GradMapNormalized_mag"];
    CI::Perspective::CIImageToFile((CI::Perspective *)v20, v21, v22, *v17);
  }
}

- (void)thresholdGradientMap
{
  v21[3] = *MEMORY[0x1E4F143B8];
  [(CIImage *)self->gradMap extent];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  int32x4_t v11 = +[CIKernel kernelWithInternalRepresentation:&CI::_gradientThresholdV1];
  v21[0] = self->gradMap;
  v21[1] = &unk_1EE4AB690;
  v21[2] = &unk_1EE4AB6A0;
  self->gradMap = -[CIColorKernel applyWithExtent:arguments:](v11, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3], v4, v6, v8, v10);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1) {
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_50);
  }
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    os_signpost_id_t v13 = CI::Perspective::gradDirImage((CI::Perspective *)self->gradMap, v12);
    int32x2_t v14 = (CIImage *)[NSString stringWithFormat:@"/tmp/PerspectiveV1_%@.png", @"4_GradMapThresholded_dir"];
    int32x4_t v15 = (CGRect *)MEMORY[0x1E4F1DB20];
    CI::Perspective::CIImageToFile((CI::Perspective *)v13, v14, v16, *MEMORY[0x1E4F1DB20]);
    v18 = CI::Perspective::gradMagImage((CI::Perspective *)self->gradMap, v17);
    v19 = (CIImage *)[NSString stringWithFormat:@"/tmp/PerspectiveV1_%@.png", @"4_GradMapThresholded_mag"];
    CI::Perspective::CIImageToFile((CI::Perspective *)v18, v19, v20, *v15);
  }
}

- (void)rangeLimitGradientMap
{
  v27[5] = *MEMORY[0x1E4F143B8];
  double v3 = +[CIKernel kernelWithInternalRepresentation:&CI::_gradientRangeLimit];
  double lineSearchRangeH = self->super.config.lineSearchRangeH;
  double v5 = tan(lineSearchRangeH + -0.0523598776);
  double v6 = tan(lineSearchRangeH + 0.0523598776);
  double lineSearchRangeV = self->super.config.lineSearchRangeV;
  double v8 = tan(lineSearchRangeV + -0.0523598776);
  double v9 = tan(lineSearchRangeV + 0.0523598776);
  [(CIImage *)self->gradMap extent];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v27[0] = self->gradMap;
  v27[1] = [NSNumber numberWithDouble:v5];
  v27[2] = [NSNumber numberWithDouble:v6];
  v27[3] = [NSNumber numberWithDouble:v8];
  v27[4] = [NSNumber numberWithDouble:v9];
  self->gradMap = -[CIColorKernel applyWithExtent:arguments:](v3, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:5], v11, v13, v15, v17);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1) {
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_50);
  }
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    v19 = CI::Perspective::gradDirImage((CI::Perspective *)self->gradMap, v18);
    v20 = (CIImage *)[NSString stringWithFormat:@"/tmp/PerspectiveV1_%@.png", @"5_GradMapRangeLimited_dir"];
    float32x2_t v21 = (CGRect *)MEMORY[0x1E4F1DB20];
    CI::Perspective::CIImageToFile((CI::Perspective *)v19, v20, v22, *MEMORY[0x1E4F1DB20]);
    simd_float3x3 v24 = CI::Perspective::gradMagImage((CI::Perspective *)self->gradMap, v23);
    simd_float3x3 v25 = (CIImage *)[NSString stringWithFormat:@"/tmp/PerspectiveV1_%@.png", @"5_GradMapRangeLimited_mag"];
    CI::Perspective::CIImageToFile((CI::Perspective *)v24, v25, v26, *v21);
  }
}

- (void)extractLineSegments
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  double v3 = ci_signpost_log_perspectiveAC();
  double v4 = ci_signpost_log_perspectiveAC();
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
  double v14 = malloc_type_malloc(self->gradMapH * v13, 0x45F7E25AuLL);
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
  v19 = ci_signpost_log_perspectiveAC();
  v20 = ci_signpost_log_perspectiveAC();
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
  a1[3] = 0;
  a1[4] = a4;
  if (a2)
  {
    if (a2 >= 0x666666666666667) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    double v7 = (char *)operator new(40 * a2);
  }
  else
  {
    double v7 = 0;
  }
  double v8 = &v7[40 * a3];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v8;
  a1[3] = &v7[40 * a2];
  return a1;
}

- (void)computeGuides
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  double v3 = ci_signpost_log_perspectiveAC();
  double v4 = ci_signpost_log_perspectiveAC();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);
  if (v5 - 1 < 0xFFFFFFFFFFFFFFFELL)
  {
    os_signpost_id_t v7 = v5;
    if (os_signpost_enabled(v3))
    {
      int64_t v8 = (self->vLineCluster.__end_ - self->vLineCluster.__begin_) >> 4;
      int64_t v9 = (self->hLineCluster.__end_ - self->hLineCluster.__begin_) >> 4;
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v9;
      _os_signpost_emit_with_name_impl(&dword_193671000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v7, "computeGuides", "vLineClusterSize: %lu hLineClusterSize: %lu", buf, 0x16u);
    }
  }
  self->vGuidesValid = 1;
  self->hGuidesValid = 1;
  self->yawCorrectionAreaCoverage = 0.0;
  LODWORD(self->minimumPitchCorrectionAreaCoverage) = 0;
  begin = self->vLineCluster.__begin_;
  end = self->vLineCluster.__end_;
  if ((unint64_t)(end - begin) <= 0x1F)
  {
    self->super.pitchFailureReason = 2;
    self->vGuidesValid = 0;
  }
  p_hLineCluster = (uint64_t **)&self->hLineCluster;
  if (($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(self->hLineCluster.__end_ - self->hLineCluster.__begin_) <= ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)0x1F)
  {
    self->super.yawFailureReason = 2;
    self->hGuidesValid = 0;
  }
  unint64_t gradMapH = self->gradMapH;
  if (self->vGuidesValid && begin != end)
  {
    double v15 = (float)((float)self->gradMapW * -0.5);
    float v16 = -INFINITY;
    float v17 = INFINITY;
    do
    {
      float32x2_t v18 = *(float32x2_t *)((char *)begin + 8);
      float32x2_t v19 = vsub_f32(v18, *(float32x2_t *)begin);
      v18.f32[0] = v15 + vadd_f32(v18, *(float32x2_t *)begin).f32[0] * 0.5;
      float v20 = sqrtf(vaddv_f32(vmul_f32(v19, v19))) * v18.f32[0];
      if (v20 < v17)
      {
        *(_OWORD *)&self->_anon_1e8[4] = *(_OWORD *)begin;
        float v17 = v20;
      }
      if (v20 > v16)
      {
        *(_OWORD *)&self->_anon_1f8[4] = *(_OWORD *)begin;
        float v16 = v20;
      }
      begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 16);
    }
    while (begin != end);
  }
  if (self->hGuidesValid)
  {
    os_signpost_id_t v21 = *p_hLineCluster;
    os_signpost_id_t v22 = self->hLineCluster.__end_;
    if (*p_hLineCluster != (uint64_t *)v22)
    {
      float v23 = -INFINITY;
      float v24 = INFINITY;
      do
      {
        float32x2_t v25 = (float32x2_t)v21[1];
        float32x2_t v26 = vsub_f32(v25, *(float32x2_t *)v21);
        v25.f32[0] = COERCE_FLOAT(vadd_f32(v25, *(float32x2_t *)v21).i32[1]) * 0.5 - (float)((float)gradMapH * 0.5);
        float v27 = sqrtf(vaddv_f32(vmul_f32(v26, v26))) * v25.f32[0];
        if (v27 < v24)
        {
          *(_OWORD *)&self->_anon_208[4] = *(_OWORD *)v21;
          float v24 = v27;
        }
        if (v27 > v23)
        {
          *(_OWORD *)&self->_anon_218[4] = *(_OWORD *)v21;
          float v23 = v27;
        }
        v21 += 2;
      }
      while (v21 != (uint64_t *)v22);
    }
  }
  uint64x2_t v28 = *(uint64x2_t *)&self->gradMapW;
  __n128 v29 = (__n128)vcvt_hight_f32_f64(0, vcvtq_f64_u64(v28));
  float v30 = (float)(unint64_t)(v28.i64[1] * v28.i64[0]);
  __n128 v97 = v29;
  if (self->vGuidesValid)
  {
    double v31 = *(double *)&self->_anon_1e8[4];
    float32x2_t v32 = vsub_f32(*(float32x2_t *)&self->_anon_1e8[12], *(float32x2_t *)&v31);
    int32x2_t v33 = (int32x2_t)vmul_f32(v32, v32);
    v33.i32[0] = vadd_f32((float32x2_t)v33, (float32x2_t)vdup_lane_s32(v33, 1)).u32[0];
    float32x2_t v34 = vrsqrte_f32((float32x2_t)v33.u32[0]);
    float32x2_t v35 = vmul_f32(v34, vrsqrts_f32((float32x2_t)v33.u32[0], vmul_f32(v34, v34)));
    float32x2_t v36 = vmul_n_f32(v32, vmul_f32(v35, vrsqrts_f32((float32x2_t)v33.u32[0], vmul_f32(v35, v35))).f32[0]);
    *(_DWORD *)buf = 0;
    LODWORD(v98) = 0;
    CI::Perspective::intersect((float *)buf, &v98, v31, *(double *)&v36, v29);
    LODWORD(v37) = *(_DWORD *)buf;
    long long v94 = v37;
    float v95 = *(float *)&v98;
    double v38 = *(double *)&self->_anon_1f8[4];
    *(float32x2_t *)&long long v37 = vsub_f32(*(float32x2_t *)&self->_anon_1f8[12], *(float32x2_t *)&v38);
    int32x2_t v39 = (int32x2_t)vmul_f32(*(float32x2_t *)&v37, *(float32x2_t *)&v37);
    v39.i32[0] = vadd_f32((float32x2_t)v39, (float32x2_t)vdup_lane_s32(v39, 1)).u32[0];
    float32x2_t v40 = vrsqrte_f32((float32x2_t)v39.u32[0]);
    float32x2_t v41 = vmul_f32(v40, vrsqrts_f32((float32x2_t)v39.u32[0], vmul_f32(v40, v40)));
    float32x2_t v42 = vmul_n_f32(*(float32x2_t *)&v37, vmul_f32(v41, vrsqrts_f32((float32x2_t)v39.u32[0], vmul_f32(v41, v41))).f32[0]);
    *(_DWORD *)buf = 0;
    LODWORD(v98) = 0;
    CI::Perspective::intersect((float *)buf, &v98, v38, *(double *)&v42, v97);
    float32x2_t v43 = vmla_n_f32(*(float32x2_t *)&v31, v36, *(float *)&v94);
    float32x2_t v44 = vmla_n_f32(*(float32x2_t *)&v31, v36, v95);
    float32x2_t v45 = vmla_n_f32(*(float32x2_t *)&v38, v42, *(float *)buf);
    float32x2_t v46 = vmla_n_f32(*(float32x2_t *)&v38, v42, *(float *)&v98);
    float32x2_t v47 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v43, v44), (int8x8_t)v43, (int8x8_t)v44);
    float32x2_t v48 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v45, v46), (int8x8_t)v45, (int8x8_t)v46);
    float32x2_t v49 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v44, v43), (int8x8_t)v43, (int8x8_t)v44);
    float32x2_t v50 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v46, v45), (int8x8_t)v45, (int8x8_t)v46);
    float32x2_t v51 = vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v47, v48), (int8x8_t)v47, (int8x8_t)v48), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v50, v49), (int8x8_t)v49, (int8x8_t)v50));
    v51.f32[0] = vmul_lane_f32(v51, v51, 1).f32[0];
    LODWORD(self->vGuidesAOE) = v51.i32[0];
    v51.f32[0] = v51.f32[0] / v30;
    BOOL v52 = self->minimumYawCorrectionAreaCoverage < v51.f32[0];
    self->vGuidesValid = v52;
    LODWORD(self->yawCorrectionAreaCoverage) = v51.i32[0];
    __n128 v29 = v97;
    if (!v52) {
      self->super.pitchFailureReason = 3;
    }
  }
  if (self->hGuidesValid)
  {
    double v53 = *(double *)&self->_anon_208[4];
    float32x2_t v54 = vsub_f32(*(float32x2_t *)&self->_anon_208[12], *(float32x2_t *)&v53);
    int32x2_t v55 = (int32x2_t)vmul_f32(v54, v54);
    v55.i32[0] = vadd_f32((float32x2_t)v55, (float32x2_t)vdup_lane_s32(v55, 1)).u32[0];
    float32x2_t v56 = vrsqrte_f32((float32x2_t)v55.u32[0]);
    float32x2_t v57 = vmul_f32(v56, vrsqrts_f32((float32x2_t)v55.u32[0], vmul_f32(v56, v56)));
    float32x2_t v58 = vmul_n_f32(v54, vmul_f32(v57, vrsqrts_f32((float32x2_t)v55.u32[0], vmul_f32(v57, v57))).f32[0]);
    *(_DWORD *)buf = 0;
    LODWORD(v98) = 0;
    CI::Perspective::intersect((float *)buf, &v98, v53, *(double *)&v58, v29);
    LODWORD(v59) = *(_DWORD *)buf;
    long long v94 = v59;
    float v96 = *(float *)&v98;
    double v60 = *(double *)&self->_anon_218[4];
    *(float32x2_t *)&long long v59 = vsub_f32(*(float32x2_t *)&self->_anon_218[12], *(float32x2_t *)&v60);
    int32x2_t v61 = (int32x2_t)vmul_f32(*(float32x2_t *)&v59, *(float32x2_t *)&v59);
    v61.i32[0] = vadd_f32((float32x2_t)v61, (float32x2_t)vdup_lane_s32(v61, 1)).u32[0];
    float32x2_t v62 = vrsqrte_f32((float32x2_t)v61.u32[0]);
    float32x2_t v63 = vmul_f32(v62, vrsqrts_f32((float32x2_t)v61.u32[0], vmul_f32(v62, v62)));
    float32x2_t v64 = vmul_n_f32(*(float32x2_t *)&v59, vmul_f32(v63, vrsqrts_f32((float32x2_t)v61.u32[0], vmul_f32(v63, v63))).f32[0]);
    *(_DWORD *)buf = 0;
    LODWORD(v98) = 0;
    CI::Perspective::intersect((float *)buf, &v98, v60, *(double *)&v64, v97);
    float32x2_t v65 = vmla_n_f32(*(float32x2_t *)&v53, v58, *(float *)&v94);
    float32x2_t v66 = vmla_n_f32(*(float32x2_t *)&v53, v58, v96);
    float32x2_t v67 = vmla_n_f32(*(float32x2_t *)&v60, v64, *(float *)buf);
    float32x2_t v68 = vmla_n_f32(*(float32x2_t *)&v60, v64, *(float *)&v98);
    float32x2_t v69 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v65, v66), (int8x8_t)v65, (int8x8_t)v66);
    float32x2_t v70 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v67, v68), (int8x8_t)v67, (int8x8_t)v68);
    float32x2_t v71 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v66, v65), (int8x8_t)v65, (int8x8_t)v66);
    float32x2_t v72 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v68, v67), (int8x8_t)v67, (int8x8_t)v68);
    float32x2_t v73 = vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v69, v70), (int8x8_t)v69, (int8x8_t)v70), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v72, v71), (int8x8_t)v71, (int8x8_t)v72));
    v73.f32[0] = vmul_lane_f32(v73, v73, 1).f32[0];
    LODWORD(self->hGuidesAOE) = v73.i32[0];
    v73.f32[0] = v73.f32[0] / v30;
    Class isa = self[1].super.super.isa;
    self->hGuidesValid = *(double *)&isa < v73.f32[0];
    LODWORD(self->minimumPitchCorrectionAreaCoverage) = v73.i32[0];
    if (*(double *)&isa >= v73.f32[0]) {
      self->super.yawFailureReason = 3;
    }
  }
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1) {
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_50);
  }
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    v75 = CI::Perspective::gradMagImage((CI::Perspective *)self->gradMap, v6);
    if (self->vGuidesValid)
    {
      v76 = CGColorCreateSRGB(0.0, 1.0, 0.0, 1.0);
      v77 = (void *)CI::Perspective::plotLines<CI::Perspective::Line>(v75, v76, (uint64_t **)&self->vLineCluster);
      v78 = CGColorCreateSRGB(0.0, 1.0, 1.0, 1.0);
      long long v79 = *(_OWORD *)&self->_anon_1f8[4];
      *(_OWORD *)buf = *(_OWORD *)&self->_anon_1e8[4];
      *(_OWORD *)&uint8_t buf[16] = v79;
      v80 = (uint64_t *)operator new(0x20uLL);
      v98 = v80;
      v100 = (char *)(v80 + 4);
      long long v81 = *(_OWORD *)&buf[16];
      *(_OWORD *)v80 = *(_OWORD *)buf;
      *((_OWORD *)v80 + 1) = v81;
      v99 = (char *)(v80 + 4);
      v75 = (void *)CI::Perspective::plotLines<CI::Perspective::Line>(v77, v78, &v98);
      operator delete(v80);
    }
    if (self->hGuidesValid)
    {
      v82 = CGColorCreateSRGB(0.0, 1.0, 0.0, 1.0);
      v83 = (void *)CI::Perspective::plotLines<CI::Perspective::Line>(v75, v82, p_hLineCluster);
      v84 = CGColorCreateSRGB(0.0, 1.0, 1.0, 1.0);
      long long v85 = *(_OWORD *)&self->_anon_218[4];
      *(_OWORD *)buf = *(_OWORD *)&self->_anon_208[4];
      *(_OWORD *)&uint8_t buf[16] = v85;
      v86 = (uint64_t *)operator new(0x20uLL);
      v98 = v86;
      v100 = (char *)(v86 + 4);
      long long v87 = *(_OWORD *)&buf[16];
      *(_OWORD *)v86 = *(_OWORD *)buf;
      *((_OWORD *)v86 + 1) = v87;
      v99 = (char *)(v86 + 4);
      v75 = (void *)CI::Perspective::plotLines<CI::Perspective::Line>(v83, v84, &v98);
      operator delete(v86);
    }
    v88 = (CIImage *)objc_msgSend(NSString, "stringWithFormat:", @"/tmp/guides.png", v94);
    CI::Perspective::CIImageToFile((CI::Perspective *)v75, v88, v89, *MEMORY[0x1E4F1DB20]);
  }
  v90 = ci_signpost_log_perspectiveAC();
  v91 = ci_signpost_log_perspectiveAC();
  os_signpost_id_t v92 = os_signpost_id_make_with_pointer(v91, self);
  if (v92 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v93 = v92;
    if (os_signpost_enabled(v90))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193671000, v90, OS_SIGNPOST_INTERVAL_END, v93, "computeGuides", "", buf, 2u);
    }
  }
}

- (void)computeTransform
{
  if (self->vGuidesValid)
  {
    uint64_t v3 = 0;
    float32x4_t v4 = *(float32x4_t *)self->_anon_c0;
    float32x4_t v5 = *(float32x4_t *)&self->_anon_c0[16];
    float32x4_t v6 = *(float32x4_t *)&self->_anon_c0[32];
    long long v7 = *(_OWORD *)self->_anon_120;
    long long v8 = *(_OWORD *)&self->_anon_120[16];
    long long v9 = *(_OWORD *)&self->_anon_120[32];
    long long v139 = v7;
    long long v140 = v8;
    long long v141 = v9;
    do
    {
      *(float32x4_t *)((char *)&v142 + v3) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*(long long *)((char *)&v139 + v3))), v5, *(float32x2_t *)((char *)&v139 + v3), 1), v6, *(float32x4_t *)((char *)&v139 + v3), 2);
      v3 += 16;
    }
    while (v3 != 48);
    uint64_t v10 = 0;
    float32x4_t v11 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_1e8[4])), v143, *(float32x2_t *)&self->_anon_1e8[4], 1));
    *(void *)&double v12 = vdivq_f32(v11, (float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2)).u64[0];
    long long v139 = v7;
    long long v140 = v8;
    long long v141 = v9;
    do
    {
      *(float32x4_t *)((char *)&v142 + v10) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*(long long *)((char *)&v139 + v10))), v5, *(float32x2_t *)((char *)&v139 + v10), 1), v6, *(float32x4_t *)((char *)&v139 + v10), 2);
      v10 += 16;
    }
    while (v10 != 48);
    uint64_t v13 = 0;
    float32x4_t v14 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_1e8[12])), v143, *(float32x2_t *)&self->_anon_1e8[12], 1));
    *(void *)&double v15 = vdivq_f32(v14, (float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2)).u64[0];
    long long v139 = v7;
    long long v140 = v8;
    long long v141 = v9;
    do
    {
      *(float32x4_t *)((char *)&v142 + v13) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*(long long *)((char *)&v139 + v13))), v5, *(float32x2_t *)((char *)&v139 + v13), 1), v6, *(float32x4_t *)((char *)&v139 + v13), 2);
      v13 += 16;
    }
    while (v13 != 48);
    uint64_t v16 = 0;
    float32x4_t v17 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_1f8[4])), v143, *(float32x2_t *)&self->_anon_1f8[4], 1));
    *(void *)&double v18 = vdivq_f32(v17, (float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2)).u64[0];
    long long v139 = v7;
    long long v140 = v8;
    long long v141 = v9;
    do
    {
      *(float32x4_t *)((char *)&v142 + v16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*(long long *)((char *)&v139 + v16))), v5, *(float32x2_t *)((char *)&v139 + v16), 1), v6, *(float32x4_t *)((char *)&v139 + v16), 2);
      v16 += 16;
    }
    while (v16 != 48);
    int32x4_t v19 = (int32x4_t)vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_1f8[12])), v143, *(float32x2_t *)&self->_anon_1f8[12], 1));
    self->rY = CI::Perspective::keystoneV(v12, v15, v18, COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)v19.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v19, 2))));
  }
  if (self->hGuidesValid)
  {
    uint64_t v20 = 0;
    float32x4_t v21 = *(float32x4_t *)self->_anon_c0;
    float32x4_t v22 = *(float32x4_t *)&self->_anon_c0[16];
    float32x4_t v23 = *(float32x4_t *)&self->_anon_c0[32];
    long long v24 = *(_OWORD *)self->_anon_120;
    long long v25 = *(_OWORD *)&self->_anon_120[16];
    long long v26 = *(_OWORD *)&self->_anon_120[32];
    long long v139 = v24;
    long long v140 = v25;
    long long v141 = v26;
    do
    {
      *(float32x4_t *)((char *)&v142 + v20) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(long long *)((char *)&v139 + v20))), v22, *(float32x2_t *)((char *)&v139 + v20), 1), v23, *(float32x4_t *)((char *)&v139 + v20), 2);
      v20 += 16;
    }
    while (v20 != 48);
    uint64_t v27 = 0;
    float32x4_t v28 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_208[4])), v143, *(float32x2_t *)&self->_anon_208[4], 1));
    *(void *)&double v29 = vdivq_f32(v28, (float32x4_t)vdupq_laneq_s32((int32x4_t)v28, 2)).u64[0];
    long long v139 = v24;
    long long v140 = v25;
    long long v141 = v26;
    do
    {
      *(float32x4_t *)((char *)&v142 + v27) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(long long *)((char *)&v139 + v27))), v22, *(float32x2_t *)((char *)&v139 + v27), 1), v23, *(float32x4_t *)((char *)&v139 + v27), 2);
      v27 += 16;
    }
    while (v27 != 48);
    uint64_t v30 = 0;
    float32x4_t v31 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_208[12])), v143, *(float32x2_t *)&self->_anon_208[12], 1));
    *(void *)&double v32 = vdivq_f32(v31, (float32x4_t)vdupq_laneq_s32((int32x4_t)v31, 2)).u64[0];
    long long v139 = v24;
    long long v140 = v25;
    long long v141 = v26;
    do
    {
      *(float32x4_t *)((char *)&v142 + v30) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(long long *)((char *)&v139 + v30))), v22, *(float32x2_t *)((char *)&v139 + v30), 1), v23, *(float32x4_t *)((char *)&v139 + v30), 2);
      v30 += 16;
    }
    while (v30 != 48);
    uint64_t v33 = 0;
    float32x4_t v34 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_218[4])), v143, *(float32x2_t *)&self->_anon_218[4], 1));
    *(void *)&double v35 = vdivq_f32(v34, (float32x4_t)vdupq_laneq_s32((int32x4_t)v34, 2)).u64[0];
    long long v139 = v24;
    long long v140 = v25;
    long long v141 = v26;
    do
    {
      *(float32x4_t *)((char *)&v142 + v33) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(long long *)((char *)&v139 + v33))), v22, *(float32x2_t *)((char *)&v139 + v33), 1), v23, *(float32x4_t *)((char *)&v139 + v33), 2);
      v33 += 16;
    }
    while (v33 != 48);
    int32x4_t v36 = (int32x4_t)vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_218[12])), v143, *(float32x2_t *)&self->_anon_218[12], 1));
    self->double rZ = CI::Perspective::keystoneH(v29, v32, v35, COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)v36.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v36, 2))));
  }
  begin = self->vLineCluster.__begin_;
  float v38 = 0.0;
  float v39 = 0.0;
  while (begin != self->vLineCluster.__end_)
  {
    float32x2_t v40 = *(float32x2_t *)begin;
    float32x2_t v41 = *(float32x2_t *)((char *)begin + 8);
    begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 16);
    float32x2_t v42 = vsub_f32(v40, v41);
    float v39 = v39 + sqrtf(vaddv_f32(vmul_f32(v42, v42)));
  }
  float32x2_t v43 = self->hLineCluster.__begin_;
  end = self->hLineCluster.__end_;
  if (v43 != end)
  {
    float v38 = 0.0;
    do
    {
      float32x2_t v45 = *(float32x2_t *)v43;
      float32x2_t v46 = *(float32x2_t *)((char *)v43 + 8);
      float32x2_t v43 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v43 + 16);
      float32x2_t v47 = vsub_f32(v45, v46);
      float v38 = v38 + sqrtf(vaddv_f32(vmul_f32(v47, v47)));
    }
    while (v43 != end);
  }
  float vGuidesAOE = self->vGuidesAOE;
  float hGuidesAOE = self->hGuidesAOE;
  self->super.double pitch = self->rY;
  double rZ = self->rZ;
  self->super.yaw = rZ;
  double pitch = self->super.pitch;
  if (pitch != 0.0)
  {
    double v52 = -pitch;
    if (pitch >= 0.0) {
      double v52 = self->super.pitch;
    }
    if (v52 > self->super.config.pitchLimit)
    {
      self->super.double pitch = 0.0;
      self->super.pitchFailureReason = 1;
      double rZ = self->super.yaw;
      double pitch = 0.0;
    }
  }
  if (rZ == 0.0) {
    goto LABEL_38;
  }
  double v53 = -rZ;
  if (rZ >= 0.0) {
    double v53 = rZ;
  }
  if (v53 <= self->super.config.yawLimit)
  {
LABEL_38:
    if (pitch == 0.0)
    {
      if (rZ == 0.0) {
        return;
      }
      uint64_t v101 = 0;
      float32x4_t v102 = *(float32x4_t *)self->_anon_c0;
      float32x4_t v103 = *(float32x4_t *)&self->_anon_c0[16];
      float32x4_t v104 = *(float32x4_t *)&self->_anon_c0[32];
      long long v105 = *(_OWORD *)self->_anon_120;
      long long v106 = *(_OWORD *)&self->_anon_120[16];
      long long v107 = *(_OWORD *)&self->_anon_120[32];
      long long v139 = v105;
      long long v140 = v106;
      long long v141 = v107;
      do
      {
        *(float32x4_t *)((char *)&v142 + v101) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v102, COERCE_FLOAT(*(long long *)((char *)&v139 + v101))), v103, *(float32x2_t *)((char *)&v139 + v101), 1), v104, *(float32x4_t *)((char *)&v139 + v101), 2);
        v101 += 16;
      }
      while (v101 != 48);
      uint64_t v108 = 0;
      float32x4_t v109 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_208[4])), v143, *(float32x2_t *)&self->_anon_208[4], 1));
      *(void *)&double v110 = vdivq_f32(v109, (float32x4_t)vdupq_laneq_s32((int32x4_t)v109, 2)).u64[0];
      long long v139 = v105;
      long long v140 = v106;
      long long v141 = v107;
      do
      {
        *(float32x4_t *)((char *)&v142 + v108) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v102, COERCE_FLOAT(*(long long *)((char *)&v139 + v108))), v103, *(float32x2_t *)((char *)&v139 + v108), 1), v104, *(float32x4_t *)((char *)&v139 + v108), 2);
        v108 += 16;
      }
      while (v108 != 48);
      uint64_t v111 = 0;
      float32x4_t v112 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_208[12])), v143, *(float32x2_t *)&self->_anon_208[12], 1));
      *(void *)&double v113 = vdivq_f32(v112, (float32x4_t)vdupq_laneq_s32((int32x4_t)v112, 2)).u64[0];
      long long v139 = v105;
      long long v140 = v106;
      long long v141 = v107;
      do
      {
        *(float32x4_t *)((char *)&v142 + v111) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v102, COERCE_FLOAT(*(long long *)((char *)&v139 + v111))), v103, *(float32x2_t *)((char *)&v139 + v111), 1), v104, *(float32x4_t *)((char *)&v139 + v111), 2);
        v111 += 16;
      }
      while (v111 != 48);
      uint64_t v114 = 0;
      float32x4_t v115 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_218[4])), v143, *(float32x2_t *)&self->_anon_218[4], 1));
      *(void *)&double v116 = vdivq_f32(v115, (float32x4_t)vdupq_laneq_s32((int32x4_t)v115, 2)).u64[0];
      long long v139 = v105;
      long long v140 = v106;
      long long v141 = v107;
      do
      {
        *(float32x4_t *)((char *)&v142 + v114) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v102, COERCE_FLOAT(*(long long *)((char *)&v139 + v114))), v103, *(float32x2_t *)((char *)&v139 + v114), 1), v104, *(float32x4_t *)((char *)&v139 + v114), 2);
        v114 += 16;
      }
      while (v114 != 48);
      int32x4_t v117 = (int32x4_t)vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_218[12])), v143, *(float32x2_t *)&self->_anon_218[12], 1));
      float v118 = pitch;
      float v119 = rZ;
      float v120 = CI::Perspective::horizonH((CI::Perspective *)self, v110, v113, v116, COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)v117.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v117, 2))), v118, v119);
      self->pitchCorrectionAreaCoverage = v120;
      double v121 = v120;
      self->super.roll = v120;
      BOOL v122 = v120 < 0.0;
      if (v120 == 0.0) {
        return;
      }
      double v123 = -v121;
      if (!v122) {
        double v123 = v121;
      }
      if (v123 <= self->super.config.rollLimit) {
        return;
      }
      self->super.yaw = 0.0;
      self->super.roll = 0.0;
    }
    else
    {
      if (rZ == 0.0) {
        goto LABEL_50;
      }
      float v54 = v39 * vGuidesAOE;
      float v55 = v39 + v38;
      float v56 = (float)(v38 * hGuidesAOE) / v55;
      float32x4_t v57 = *(float32x4_t *)self->_anon_c0;
      float32x4_t v58 = *(float32x4_t *)&self->_anon_c0[16];
      float32x4_t v59 = *(float32x4_t *)&self->_anon_c0[32];
      long long v61 = *(_OWORD *)self->_anon_120;
      long long v60 = *(_OWORD *)&self->_anon_120[16];
      long long v62 = *(_OWORD *)&self->_anon_120[32];
      uint64_t v63 = 0;
      if ((float)(v54 / v55) <= v56)
      {
        long long v139 = *(_OWORD *)self->_anon_120;
        long long v140 = v60;
        long long v141 = v62;
        do
        {
          *(float32x4_t *)((char *)&v142 + v63) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v57, COERCE_FLOAT(*(long long *)((char *)&v139 + v63))), v58, *(float32x2_t *)((char *)&v139 + v63), 1), v59, *(float32x4_t *)((char *)&v139 + v63), 2);
          v63 += 16;
        }
        while (v63 != 48);
        uint64_t v124 = 0;
        float32x4_t v125 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_208[4])), v143, *(float32x2_t *)&self->_anon_208[4], 1));
        *(void *)&double v126 = vdivq_f32(v125, (float32x4_t)vdupq_laneq_s32((int32x4_t)v125, 2)).u64[0];
        long long v139 = v61;
        long long v140 = v60;
        long long v141 = v62;
        do
        {
          *(float32x4_t *)((char *)&v142 + v124) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v57, COERCE_FLOAT(*(long long *)((char *)&v139 + v124))), v58, *(float32x2_t *)((char *)&v139 + v124), 1), v59, *(float32x4_t *)((char *)&v139 + v124), 2);
          v124 += 16;
        }
        while (v124 != 48);
        uint64_t v127 = 0;
        float32x4_t v128 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_208[12])), v143, *(float32x2_t *)&self->_anon_208[12], 1));
        *(void *)&double v129 = vdivq_f32(v128, (float32x4_t)vdupq_laneq_s32((int32x4_t)v128, 2)).u64[0];
        long long v139 = v61;
        long long v140 = v60;
        long long v141 = v62;
        do
        {
          *(float32x4_t *)((char *)&v142 + v127) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v57, COERCE_FLOAT(*(long long *)((char *)&v139 + v127))), v58, *(float32x2_t *)((char *)&v139 + v127), 1), v59, *(float32x4_t *)((char *)&v139 + v127), 2);
          v127 += 16;
        }
        while (v127 != 48);
        uint64_t v130 = 0;
        float32x4_t v131 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_218[4])), v143, *(float32x2_t *)&self->_anon_218[4], 1));
        *(void *)&double v132 = vdivq_f32(v131, (float32x4_t)vdupq_laneq_s32((int32x4_t)v131, 2)).u64[0];
        long long v139 = v61;
        long long v140 = v60;
        long long v141 = v62;
        do
        {
          *(float32x4_t *)((char *)&v142 + v130) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v57, COERCE_FLOAT(*(long long *)((char *)&v139 + v130))), v58, *(float32x2_t *)((char *)&v139 + v130), 1), v59, *(float32x4_t *)((char *)&v139 + v130), 2);
          v130 += 16;
        }
        while (v130 != 48);
        int32x4_t v133 = (int32x4_t)vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_218[12])), v143, *(float32x2_t *)&self->_anon_218[12], 1));
        float v134 = pitch;
        float v135 = rZ;
        float v76 = CI::Perspective::horizonH((CI::Perspective *)self, v126, v129, v132, COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)v133.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v133, 2))), v134, v135);
      }
      else
      {
        long long v139 = *(_OWORD *)self->_anon_120;
        long long v140 = v60;
        long long v141 = v62;
        do
        {
          *(float32x4_t *)((char *)&v142 + v63) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v57, COERCE_FLOAT(*(long long *)((char *)&v139 + v63))), v58, *(float32x2_t *)((char *)&v139 + v63), 1), v59, *(float32x4_t *)((char *)&v139 + v63), 2);
          v63 += 16;
        }
        while (v63 != 48);
        uint64_t v64 = 0;
        float32x4_t v65 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_1e8[4])), v143, *(float32x2_t *)&self->_anon_1e8[4], 1));
        *(void *)&double v66 = vdivq_f32(v65, (float32x4_t)vdupq_laneq_s32((int32x4_t)v65, 2)).u64[0];
        long long v139 = v61;
        long long v140 = v60;
        long long v141 = v62;
        do
        {
          *(float32x4_t *)((char *)&v142 + v64) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v57, COERCE_FLOAT(*(long long *)((char *)&v139 + v64))), v58, *(float32x2_t *)((char *)&v139 + v64), 1), v59, *(float32x4_t *)((char *)&v139 + v64), 2);
          v64 += 16;
        }
        while (v64 != 48);
        uint64_t v67 = 0;
        float32x4_t v68 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_1e8[12])), v143, *(float32x2_t *)&self->_anon_1e8[12], 1));
        *(void *)&double v69 = vdivq_f32(v68, (float32x4_t)vdupq_laneq_s32((int32x4_t)v68, 2)).u64[0];
        long long v139 = v61;
        long long v140 = v60;
        long long v141 = v62;
        do
        {
          *(float32x4_t *)((char *)&v142 + v67) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v57, COERCE_FLOAT(*(long long *)((char *)&v139 + v67))), v58, *(float32x2_t *)((char *)&v139 + v67), 1), v59, *(float32x4_t *)((char *)&v139 + v67), 2);
          v67 += 16;
        }
        while (v67 != 48);
        uint64_t v70 = 0;
        float32x4_t v71 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_1f8[4])), v143, *(float32x2_t *)&self->_anon_1f8[4], 1));
        *(void *)&double v72 = vdivq_f32(v71, (float32x4_t)vdupq_laneq_s32((int32x4_t)v71, 2)).u64[0];
        long long v139 = v61;
        long long v140 = v60;
        long long v141 = v62;
        do
        {
          *(float32x4_t *)((char *)&v142 + v70) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v57, COERCE_FLOAT(*(long long *)((char *)&v139 + v70))), v58, *(float32x2_t *)((char *)&v139 + v70), 1), v59, *(float32x4_t *)((char *)&v139 + v70), 2);
          v70 += 16;
        }
        while (v70 != 48);
        int32x4_t v73 = (int32x4_t)vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_1f8[12])), v143, *(float32x2_t *)&self->_anon_1f8[12], 1));
        float v74 = pitch;
        float v75 = rZ;
        float v76 = CI::Perspective::horizonV((CI::Perspective *)self, v66, v69, v72, COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)v73.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v73, 2))), v74, v75);
      }
      self->pitchCorrectionAreaCoverage = v76;
      double v136 = v76;
      self->super.roll = v76;
      BOOL v137 = v76 < 0.0;
      if (v76 == 0.0) {
        return;
      }
      double v138 = -v136;
      if (!v137) {
        double v138 = v136;
      }
      if (v138 <= self->super.config.rollLimit) {
        return;
      }
      self->super.double pitch = 0.0;
      self->super.yaw = 0.0;
      self->super.roll = 0.0;
      self->super.pitchFailureReason = 4;
    }
    v100 = &OBJC_IVAR___CIPerspectiveAutoCalc_yawFailureReason;
    goto LABEL_92;
  }
  self->super.yaw = 0.0;
  self->super.yawFailureReason = 1;
  double pitch = self->super.pitch;
  double rZ = 0.0;
  if (pitch == 0.0) {
    return;
  }
LABEL_50:
  uint64_t v77 = 0;
  float32x4_t v78 = *(float32x4_t *)self->_anon_c0;
  float32x4_t v79 = *(float32x4_t *)&self->_anon_c0[16];
  float32x4_t v80 = *(float32x4_t *)&self->_anon_c0[32];
  long long v81 = *(_OWORD *)self->_anon_120;
  long long v82 = *(_OWORD *)&self->_anon_120[16];
  long long v83 = *(_OWORD *)&self->_anon_120[32];
  long long v139 = v81;
  long long v140 = v82;
  long long v141 = v83;
  do
  {
    *(float32x4_t *)((char *)&v142 + v77) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v78, COERCE_FLOAT(*(long long *)((char *)&v139 + v77))), v79, *(float32x2_t *)((char *)&v139 + v77), 1), v80, *(float32x4_t *)((char *)&v139 + v77), 2);
    v77 += 16;
  }
  while (v77 != 48);
  uint64_t v84 = 0;
  float32x4_t v85 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_1e8[4])), v143, *(float32x2_t *)&self->_anon_1e8[4], 1));
  *(void *)&double v86 = vdivq_f32(v85, (float32x4_t)vdupq_laneq_s32((int32x4_t)v85, 2)).u64[0];
  long long v139 = v81;
  long long v140 = v82;
  long long v141 = v83;
  do
  {
    *(float32x4_t *)((char *)&v142 + v84) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v78, COERCE_FLOAT(*(long long *)((char *)&v139 + v84))), v79, *(float32x2_t *)((char *)&v139 + v84), 1), v80, *(float32x4_t *)((char *)&v139 + v84), 2);
    v84 += 16;
  }
  while (v84 != 48);
  uint64_t v87 = 0;
  float32x4_t v88 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_1e8[12])), v143, *(float32x2_t *)&self->_anon_1e8[12], 1));
  *(void *)&double v89 = vdivq_f32(v88, (float32x4_t)vdupq_laneq_s32((int32x4_t)v88, 2)).u64[0];
  long long v139 = v81;
  long long v140 = v82;
  long long v141 = v83;
  do
  {
    *(float32x4_t *)((char *)&v142 + v87) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v78, COERCE_FLOAT(*(long long *)((char *)&v139 + v87))), v79, *(float32x2_t *)((char *)&v139 + v87), 1), v80, *(float32x4_t *)((char *)&v139 + v87), 2);
    v87 += 16;
  }
  while (v87 != 48);
  uint64_t v90 = 0;
  float32x4_t v91 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_1f8[4])), v143, *(float32x2_t *)&self->_anon_1f8[4], 1));
  *(void *)&double v92 = vdivq_f32(v91, (float32x4_t)vdupq_laneq_s32((int32x4_t)v91, 2)).u64[0];
  long long v139 = v81;
  long long v140 = v82;
  long long v141 = v83;
  do
  {
    *(float32x4_t *)((char *)&v142 + v90) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v78, COERCE_FLOAT(*(long long *)((char *)&v139 + v90))), v79, *(float32x2_t *)((char *)&v139 + v90), 1), v80, *(float32x4_t *)((char *)&v139 + v90), 2);
    v90 += 16;
  }
  while (v90 != 48);
  int32x4_t v93 = (int32x4_t)vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(void *)&self->_anon_1f8[12])), v143, *(float32x2_t *)&self->_anon_1f8[12], 1));
  float v94 = pitch;
  float v95 = rZ;
  float v96 = CI::Perspective::horizonV((CI::Perspective *)self, v86, v89, v92, COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)v93.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v93, 2))), v94, v95);
  self->pitchCorrectionAreaCoverage = v96;
  double v97 = v96;
  self->super.roll = v96;
  BOOL v98 = v96 < 0.0;
  if (v96 != 0.0)
  {
    double v99 = -v97;
    if (!v98) {
      double v99 = v97;
    }
    if (v99 > self->super.config.rollLimit)
    {
      self->super.double pitch = 0.0;
      self->super.roll = 0.0;
      v100 = &OBJC_IVAR___CIPerspectiveAutoCalc_pitchFailureReason;
LABEL_92:
      *(Class *)((char *)&self->super.super.isa + *v100) = (Class)4;
    }
  }
}

- (double)minimumPitchCorrectionAreaCoverage
{
  return self->minimumYawCorrectionAreaCoverage;
}

- (void)setMinimumPitchCorrectionAreaCoverage:(double)a3
{
  self->minimumYawCorrectionAreaCoverage = a3;
}

- (double)minimumYawCorrectionAreaCoverage
{
  return *(double *)&self[1].super.super.isa;
}

- (void)setMinimumYawCorrectionAreaCoverage:(double)a3
{
  *(double *)&self[1].super.super.Class isa = a3;
}

- (float)pitchCorrectionAreaCoverage
{
  return self->yawCorrectionAreaCoverage;
}

- (float)yawCorrectionAreaCoverage
{
  return *(float *)&self->minimumPitchCorrectionAreaCoverage;
}

- (void).cxx_destruct
{
  p_hLineCluster = &self->hLineCluster;
  begin = self->hLineCluster.__begin_;
  if (begin)
  {
    p_hLineCluster->__end_ = begin;
    operator delete(begin);
  }
  float32x4_t v5 = self->vLineCluster.__begin_;
  if (v5)
  {
    self->vLineCluster.__end_ = v5;
    operator delete(v5);
  }
  float32x4_t v6 = self->hLines.__begin_;
  if (v6)
  {
    self->hLines.__end_ = v6;
    operator delete(v6);
  }
  long long v7 = self->vLines.__begin_;
  if (v7)
  {
    self->vLines.__end_ = v7;
    operator delete(v7);
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
  *((void *)self + 69) = 0x100000001;
  return self;
}

@end