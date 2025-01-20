@interface NTKAtiumQuad
- (BOOL)_needsOrientationBlend;
- (BOOL)blendRecolorLightingTextureEnabled;
- (BOOL)blendUseRainbowTexture;
- (BOOL)blendUseThreeColorTexture;
- (BOOL)isAnimatingOverrideDate;
- (BOOL)overrideTritiumAnimation;
- (BOOL)prepareForTime:(double)a3;
- (BOOL)recolorLightingTextureEnabled;
- (BOOL)useRainbowTexture;
- (BOOL)useThreeColorTexture;
- (NSDate)overrideDate;
- (NTKAtiumQuad)initWithDevice:(id)a3;
- (NTKAtiumQuadDelegate)delegate;
- (UIColor)backgroundLightColor;
- (UIColor)blendBackgroundLightColor;
- (UIColor)blendFirstLightColor;
- (UIColor)blendSecondLightColor;
- (UIColor)firstLightColor;
- (UIColor)secondLightColor;
- (double)blendTransitionFraction;
- (double)dialSize;
- (double)shadowStrength;
- (double)tritiumMaskMultiplier;
- (double)tritiumProgress;
- (float32x2_t)_getHandAngles;
- (id)_createRenderPipelineWithPixelFormat:(unint64_t)a3 functionConstants:(id)a4;
- (id)_createTextureWithName:(id)a3;
- (id)_createVertexBuffer;
- (void)_updateDeviceRotationMatrix;
- (void)renderForDisplayWithEncoder:(id)a3;
- (void)setAnimatingOverrideDate:(BOOL)a3;
- (void)setBackgroundLightColor:(id)a3;
- (void)setBlendBackgroundLightColor:(id)a3;
- (void)setBlendFirstLightColor:(id)a3;
- (void)setBlendRecolorLightingTextureEnabled:(BOOL)a3;
- (void)setBlendSecondLightColor:(id)a3;
- (void)setBlendTransitionFraction:(double)a3;
- (void)setBlendUseRainbowTexture:(BOOL)a3;
- (void)setBlendUseThreeColorTexture:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDialSize:(double)a3;
- (void)setFirstLightColor:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setOverrideTritiumAnimation:(BOOL)a3;
- (void)setRecolorLightingTextureEnabled:(BOOL)a3;
- (void)setSecondLightColor:(id)a3;
- (void)setShadowStrength:(double)a3;
- (void)setTritiumMaskMultiplier:(double)a3;
- (void)setTritiumProgress:(double)a3;
- (void)setUseRainbowTexture:(BOOL)a3;
- (void)setUseThreeColorTexture:(BOOL)a3;
- (void)setupForQuadView:(id)a3;
- (void)startWakeAnimationWithDuration:(double)a3;
@end

@implementation NTKAtiumQuad

- (NTKAtiumQuad)initWithDevice:(id)a3
{
  id v5 = a3;
  v78.receiver = self;
  v78.super_class = (Class)NTKAtiumQuad;
  v6 = [(NTKAtiumQuad *)&v78 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v8 = +[CLKUIMetalResourceManager sharedDevice];
    mtlDevice = v7->_mtlDevice;
    v7->_mtlDevice = (MTLDevice *)v8;

    v10 = v7->_mtlDevice;
    v11 = sub_4DC4();
    v12 = (MTLLibrary *)[(MTLDevice *)v10 newDefaultLibraryWithBundle:v11 error:0];
    library = v7->_library;
    v7->_library = v12;

    [v5 screenScale];
    v7->_double screenScale = v14;
    v7->_tritiumProgress = 0.0;
    v7->_shadowStrength = 1.0;
    v7->_timeShadowOverride = 1.0;
    *(_OWORD *)v7->_anon_80 = xmmword_9250;
    simd_float4 v15 = matrix_identity_float4x4.columns[1];
    *(simd_float4 *)v7->_anon_90 = matrix_identity_float4x4.columns[0];
    *(simd_float4 *)&v7->_anon_90[16] = v15;
    simd_float4 v16 = matrix_identity_float4x4.columns[3];
    *(simd_float4 *)&v7->_anon_90[32] = matrix_identity_float4x4.columns[2];
    *(simd_float4 *)&v7->_anon_90[48] = v16;
    v7->dialSize = 500.0;
    v7->_materialRoughness = 0.25;
    if (_os_feature_enabled_impl()) {
      v7->_materialRoughness = 0.5;
    }
    v7->_blendTransitionFraction = 0.0;
    v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    renderPipelines = v7->_renderPipelines;
    v7->_renderPipelines = v17;

    uint64_t v19 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    calendar = v7->_calendar;
    v7->_calendar = (NSCalendar *)v19;

    v21 = +[CLKUIAnalogHandConfiguration defaultHourConfigurationForDevice:v5];
    v22 = +[CLKUIAnalogHandConfiguration defaultMinuteConfigurationForDevice:v5];
    v23 = +[CLKUIAnalogHandConfiguration defaultSecondConfigurationForDevice:v5];
    double screenScale = v7->_screenScale;
    [v21 handWidth];
    *(float *)&double v25 = screenScale * v25 * 0.5;
    v7->_layoutConstants.radius = *(float *)&v25;
    double v26 = v7->_screenScale;
    [v21 armLength];
    double v28 = v27;
    [v21 pegRadius];
    double v30 = v28 + v29;
    [v21 pegStrokeWidth];
    *(float *)&double v31 = v26 * (v30 + v31);
    v7->_layoutConstants.armLength = *(float *)&v31;
    double v32 = v7->_screenScale;
    [v21 handLength];
    *(float *)&double v33 = v32 * v33;
    v7->_layoutConstants.handLength1 = *(float *)&v33;
    double v34 = v7->_screenScale;
    [v22 handLength];
    *(float *)&double v35 = v34 * v35;
    v7->_layoutConstants.handLength2 = *(float *)&v35;
    double v36 = v7->_screenScale;
    [v23 handLength];
    *(float *)&double v37 = v36 * v37;
    v7->_layoutConstants.secondHandLength = *(float *)&v37;
    double v38 = v7->_screenScale;
    [v23 tailLength];
    *(float *)&double v39 = v38 * v39;
    v7->_layoutConstants.secondHandTailLength = *(float *)&v39;
    *(double *)v40.i64 = sub_4E18(1.5708, (float32x4_t)xmmword_9260);
    float v43 = v42.f32[2] + (float)(*(float *)v40.i32 + v41.f32[1]);
    if (v43 >= 0.0)
    {
      float v53 = sqrtf(v43 + 1.0);
      float v54 = v53 + v53;
      float32x2_t v55 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v53 + v53));
      float32x2_t v56 = vmul_f32(v55, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v53 + v53), v55));
      v56.i32[0] = vmul_f32(v56, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v53 + v53), v56)).u32[0];
      float v49 = vmuls_lane_f32(v56.f32[0], (float32x2_t)*(_OWORD *)&vsubq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v41, 2), v42), 1);
      float v50 = vmuls_n_f32(vsubq_f32(v42, (float32x4_t)vdupq_laneq_s32(v40, 2)).f32[0], v56.f32[0]);
      float v51 = vmuls_n_f32(vsubq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.i8, 1), v41).f32[0], v56.f32[0]);
      float v52 = v54 * 0.25;
    }
    else if (*(float *)v40.i32 < v41.f32[1] || *(float *)v40.i32 < v42.f32[2])
    {
      float v57 = 1.0 - *(float *)v40.i32;
      if (v41.f32[1] >= v42.f32[2])
      {
        float v64 = sqrtf(v41.f32[1] + (float)(v57 - v42.f32[2]));
        float v65 = v64 + v64;
        float32x2_t v66 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v64 + v64));
        float32x2_t v67 = vmul_f32(v66, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v64 + v64), v66));
        unsigned __int32 v62 = vmul_f32(v67, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v64 + v64), v67)).u32[0];
        float v49 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.i8, 1), v41).f32[0], *(float *)&v62);
        float v50 = v65 * 0.25;
        float v51 = vmuls_lane_f32(*(float *)&v62, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v41, 2), v42), 1);
        unsigned __int32 v63 = vsubq_f32(v42, (float32x4_t)vdupq_laneq_s32(v40, 2)).u32[0];
      }
      else
      {
        float v58 = sqrtf(v42.f32[2] + (float)(v57 - v41.f32[1]));
        float v59 = v58 + v58;
        float32x2_t v60 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v58 + v58));
        float32x2_t v61 = vmul_f32(v60, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v58 + v58), v60));
        unsigned __int32 v62 = vmul_f32(v61, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v58 + v58), v61)).u32[0];
        float v49 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32(v40, 2), v42).f32[0], *(float *)&v62);
        float v50 = vmuls_lane_f32(*(float *)&v62, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v41, 2), v42), 1);
        float v51 = v59 * 0.25;
        unsigned __int32 v63 = vsubq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.i8, 1), v41).u32[0];
      }
      float v52 = vmuls_n_f32(*(float *)&v63, *(float *)&v62);
    }
    else
    {
      float v44 = sqrtf(*(float *)v40.i32 + (float)((float)(1.0 - v41.f32[1]) - v42.f32[2]));
      *(float *)&unsigned int v45 = v44 + v44;
      float32x2_t v46 = vrecpe_f32((float32x2_t)v45);
      float32x2_t v47 = vmul_f32(v46, vrecps_f32((float32x2_t)v45, v46));
      LODWORD(v48) = vmul_f32(v47, vrecps_f32((float32x2_t)v45, v47)).u32[0];
      float v49 = *(float *)&v45 * 0.25;
      float v50 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.i8, 1), v41).f32[0], v48);
      float v51 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32(v40, 2), v42).f32[0], v48);
      float v52 = vmuls_lane_f32(v48, (float32x2_t)*(_OWORD *)&vsubq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v41, 2), v42), 1);
    }
    *(void *)&long long v68 = __PAIR64__(LODWORD(v50), LODWORD(v49));
    *((void *)&v68 + 1) = __PAIR64__(LODWORD(v52), LODWORD(v51));
    *(_OWORD *)v7->_anon_d0 = v68;
    v7->_tritiumMaskMultiplier = 1.0;
    *(double *)&long long v69 = sub_4F14(vaddq_f32(vmlaq_n_f32(vmulq_n_f32((float32x4_t)xmmword_9270, v50), (float32x4_t)xmmword_9280, v49), vmlaq_n_f32(vmulq_n_f32((float32x4_t)xmmword_9290, v52), (float32x4_t)xmmword_92A0, v51)));
    *(_OWORD *)v7->_anon_e0 = v69;
    *(_OWORD *)&v7->_anon_e0[16] = v70;
    *(_OWORD *)&v7->_anon_e0[32] = v71;
    *(_OWORD *)&v7->_anon_e0[48] = v72;
    *(_OWORD *)v7->_anon_120 = xmmword_9250;
    *(double *)&long long v73 = sub_4F14(vaddq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)xmmword_92B0, *(float32x2_t *)v7->_anon_d0, 1), (float32x4_t)xmmword_92C0, COERCE_FLOAT(*(_OWORD *)v7->_anon_d0)), vmlaq_laneq_f32(vmulq_laneq_f32((float32x4_t)xmmword_9250, *(float32x4_t *)v7->_anon_d0, 3), (float32x4_t)xmmword_92D0, *(float32x4_t *)v7->_anon_d0, 2)));
    *(_OWORD *)v7->_anon_130 = v73;
    *(_OWORD *)&v7->_anon_130[16] = v74;
    *(_OWORD *)&v7->_anon_130[32] = v75;
    *(_OWORD *)&v7->_anon_130[48] = v76;
  }
  return v7;
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v7 = a3;
  p_overrideDate = &self->_overrideDate;
  if ((NTKEqualObjects() & 1) == 0)
  {
    if (a4 > 0.0) {
      [(NTKAtiumQuad *)self setAnimatingOverrideDate:1];
    }
    uint64_t v9 = +[NTKDate faceDate];
    v10 = (void *)v9;
    v11 = *p_overrideDate;
    if (!*p_overrideDate) {
      v11 = (void *)v9;
    }
    id v12 = v11;
    if (v7)
    {
      id v13 = v7;
    }
    else
    {
      id v13 = [v10 dateByAddingTimeInterval:a4];
    }
    double v14 = v13;
    objc_storeStrong((id *)&self->_overrideDate, a3);
    double v15 = CACurrentMediaTime();
    self->_startOverrideTime = v15;
    self->_endOverrideTime = v15 + a4;
    NTKHourMinuteSecondAnglesForTime();
    HIDWORD(v16) = 0;
    *(float32x2_t *)&long long v16 = vcvt_f32_f64((float64x2_t)0);
    *((float *)&v16 + 2) = 0.0;
    *(_OWORD *)self->_startOverrideAngles = v16;
    NTKHourMinuteSecondAnglesForTime();
    HIDWORD(v17) = 0;
    *(float32x2_t *)&long long v17 = vcvt_f32_f64((float64x2_t)0);
    *((float *)&v17 + 2) = 0.0;
    *(_OWORD *)self->_endOverrideAngles = v17;
  }
}

- (void)setAnimatingOverrideDate:(BOOL)a3
{
  if (self->_animatingOverrideDate != a3)
  {
    self->_animatingOverrideDate = a3;
    id v4 = [(NTKAtiumQuad *)self delegate];
    [v4 atiumQuadDidUpdateAnimatingOverrideDate:self];
  }
}

- (void)startWakeAnimationWithDuration:(double)a3
{
  double v5 = CACurrentMediaTime();
  self->_startWristRaiseTime = v5;
  self->_endWristRaiseTime = v5 + a3;
}

- (void)setupForQuadView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  double screenScale = self->_screenScale;
  self->_renderSize.width = v6 * screenScale;
  self->_renderSize.height = v7 * screenScale;
  id v8 = [v4 colorPixelFormat];

  self->_pixelFormat = (unint64_t)v8;
  uint64_t v9 = [(NTKAtiumQuad *)self _createVertexBuffer];
  vertexBuffer = self->_vertexBuffer;
  self->_vertexBuffer = v9;

  v11 = [(NTKAtiumQuad *)self _createTextureWithName:@"QuickCubeTexture"];
  reflectionCubeTexture = self->_reflectionCubeTexture;
  self->_reflectionCubeTexture = v11;

  id v13 = [(NTKAtiumQuad *)self _createTextureWithName:@"NewThreeColorCubeTexture"];
  reflectionThreeColorCubeTexture = self->_reflectionThreeColorCubeTexture;
  self->_reflectionThreeColorCubeTexture = v13;

  double v15 = [(NTKAtiumQuad *)self _createTextureWithName:@"RainbowCubeTexture"];
  reflectionRainbowCubeTexture = self->_reflectionRainbowCubeTexture;
  self->_reflectionRainbowCubeTexture = v15;

  long long v17 = [(NTKAtiumQuad *)self _createTextureWithName:@"CenterMaskTexture"];
  centerMaskTexture = self->_centerMaskTexture;
  self->_centerMaskTexture = v17;

  uint64_t v19 = [(NTKAtiumQuad *)self _createTextureWithName:@"AODMaskTextureCircular"];
  aodMaskTexture = self->_aodMaskTexture;
  self->_aodMaskTexture = v19;

  self->_aodMaskTextureBlurred = [(NTKAtiumQuad *)self _createTextureWithName:@"AODMaskTextureBlurred"];

  _objc_release_x1();
}

- (BOOL)prepareForTime:(double)a3
{
  return 1;
}

- (BOOL)_needsOrientationBlend
{
  BOOL result = CACurrentMediaTime() < self->_endOverrideTime
        || ((double tritiumProgress = self->_tritiumProgress, tritiumProgress != 0.0)
          ? (BOOL v4 = tritiumProgress == 1.0)
          : (BOOL v4 = 1),
            !v4)
        || self->_overrideTritiumAnimation;
  return result;
}

- (float32x2_t)_getHandAngles
{
  double v2 = CACurrentMediaTime();
  double v3 = *(double *)(a1 + 424);
  if (v2 >= v3)
  {
    v11 = *(void **)(a1 + 600);
    if (v11)
    {
      id v12 = v11;
    }
    else
    {
      id v12 = +[NTKDate faceDate];
    }
    double v5 = v12;
    NTKHourMinuteSecondAnglesForTime();
    float32x2_t v13 = vcvt_f32_f64((float64x2_t)0);
    double v14 = 0.0;
    if (!*(void *)(a1 + 600)) {
      double v14 = 1.0;
    }
    *(double *)(a1 + 464) = v14;
    objc_msgSend((id)a1, "setAnimatingOverrideDate:", 0, *(void *)&v13);
  }
  else
  {
    float v4 = (v2 - *(double *)(a1 + 416)) / (v3 - *(double *)(a1 + 416));
    double v5 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    *(float *)&double v6 = v4;
    [v5 _solveForInput:v6];
    CLKInterpolateShortestPathBetweenAnglesUnclipped();
    float64_t v16 = v7;
    CLKInterpolateShortestPathBetweenAnglesUnclipped();
    v8.f64[0] = v16;
    v8.f64[1] = v9;
    float32x2_t v17 = vcvt_f32_f64(v8);
    CLKInterpolateShortestPathBetweenAnglesUnclipped();
    double v10 = v4;
    if (*(void *)(a1 + 600)) {
      double v10 = 1.0 - v4;
    }
    *(double *)(a1 + 464) = v10;
  }

  return vcvt_f32_f64(vaddq_f64(vsubq_f64((float64x2_t)vdupq_n_s64(0x401921FB54442D18uLL), vcvtq_f64_f32(v17)), (float64x2_t)vdupq_n_s64(0x3FF921FB54442D18uLL)));
}

- (void)renderForDisplayWithEncoder:(id)a3
{
  id v4 = a3;
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  unsigned int v5 = [(NTKAtiumQuad *)self recolorLightingTextureEnabled];
  unsigned int v6 = [(NTKAtiumQuad *)self useThreeColorTexture];
  double blendTransitionFraction = self->_blendTransitionFraction;
  if (blendTransitionFraction <= 0.0)
  {
    unsigned int v8 = 0;
    unsigned int v9 = 0;
  }
  else
  {
    unsigned int v8 = [(NTKAtiumQuad *)self blendRecolorLightingTextureEnabled];
    unsigned int v9 = [(NTKAtiumQuad *)self blendUseThreeColorTexture];
  }
  unsigned int v10 = [(NTKAtiumQuad *)self _needsOrientationBlend];
  if (self->_tritiumProgress <= 0.0) {
    unsigned int v11 = [(NTKAtiumQuad *)self overrideTritiumAnimation];
  }
  else {
    unsigned int v11 = 1;
  }
  uint64_t v12 = 0;
  LODWORD(v13) = 0;
  uint64_t v14 = 0x100000000;
  if (!v9) {
    uint64_t v14 = 0;
  }
  uint64_t v15 = 0x1000000;
  if (!v8) {
    uint64_t v15 = 0;
  }
  if (v6) {
    uint64_t v16 = 256;
  }
  else {
    uint64_t v16 = 0;
  }
  unint64_t v17 = v16 | v5 | ((unint64_t)(blendTransitionFraction > 0.0) << 16) | v15 | v14;
  if (v11) {
    int v18 = 256;
  }
  else {
    int v18 = 0;
  }
  unint64_t v19 = v17 | ((unint64_t)(v18 | v10) << 48);
  *(void *)&long long v121 = v19;
  do
    uint64_t v13 = *((unsigned __int8 *)&v121 + v12++) | (2 * v13);
  while (v12 != 8);
  uint64_t v20 = +[NSNumber numberWithUnsignedInt:v13];
  v21 = [(NSMutableDictionary *)self->_renderPipelines objectForKey:v20];

  v106 = (void *)v20;
  if (v21)
  {
    v22 = [(NSMutableDictionary *)self->_renderPipelines objectForKey:v20];
  }
  else
  {
    v22 = [(NTKAtiumQuad *)self _createRenderPipelineWithPixelFormat:self->_pixelFormat functionConstants:v19];
    [(NSMutableDictionary *)self->_renderPipelines setObject:v22 forKey:v20];
  }
  objc_msgSend(v4, "setLabel:", @"Atium Render Encoder", v19);
  long long v121 = 0uLL;
  CGSize renderSize = self->_renderSize;
  long long v123 = xmmword_92E0;
  [v4 setViewport:&v121];
  [v4 setRenderPipelineState:v22];
  [v4 setCullMode:0];
  memset(v130, 0, sizeof(v130));
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  CGSize v124 = (CGSize)0;
  CGSize v125 = (CGSize)0;
  CGSize renderSize = (CGSize)0;
  long long v123 = 0u;
  long long v121 = 0u;
  __asm { FMOV            V1.2D, #0.5 }
  *(float32x2_t *)&long long v121 = vcvt_f32_f64(vmulq_f64((float64x2_t)self->_renderSize, _Q1));
  CLKUIConvertToRGBfFromUIColor();
  float32x4_t v104 = v28;
  CLKUIConvertToRGBfFromUIColor();
  float32x4_t v107 = v29;
  CLKUIConvertToRGBfFromUIColor();
  float16x4_t v30 = vcvt_f16_f32(v104);
  _S2 = v104.i32[2];
  __asm { FCVT            H2, S2 }
  v30.i16[2] = _S2;
  float16x4_t v32 = vcvt_f16_f32(v107);
  _S3 = v107.i32[2];
  __asm { FCVT            H3, S3 }
  v32.i16[2] = _S3;
  float16x4_t v35 = vcvt_f16_f32(_Q0);
  _Q0.i32[0] = _Q0.i32[2];
  __asm { FCVT            H0, S0 }
  v35.i16[2] = _Q0.i16[0];
  *(float16x4_t *)&long long v126 = v30;
  *((float16x4_t *)&v126 + 1) = v32;
  *(float16x4_t *)&long long v127 = v35;
  _Q0.f32[0] = self->dialSize;
  DWORD2(v127) = _Q0.i32[0];
  if (self->_tritiumProgress == 1.0)
  {
    double v36 = &OBJC_IVAR___NTKAtiumQuad__tritiumRotationMatrix;
  }
  else
  {
    [(NTKAtiumQuad *)self _updateDeviceRotationMatrix];
    double v37 = CACurrentMediaTime();
    double endOverrideTime = self->_endOverrideTime;
    if (v37 > endOverrideTime && self->_overrideDate || v37 < endOverrideTime && !self->_overrideDate)
    {
      double v36 = &OBJC_IVAR___NTKAtiumQuad__idealizedRotationMatrix;
    }
    else
    {
      double v36 = &OBJC_IVAR___NTKAtiumQuad__idealizedRotationMatrix;
      if (!IsReduceMotionEnabled) {
        double v36 = &OBJC_IVAR___NTKAtiumQuad__deviceRotationMatrix;
      }
    }
  }
  double v39 = (CGSize *)&self->CLKUIQuad_opaque[*v36];
  long long v40 = (__int128)v39[1];
  CGSize renderSize = *v39;
  long long v123 = v40;
  CGSize v41 = v39[3];
  CGSize v124 = v39[2];
  CGSize v125 = v41;
  float materialRoughness = self->_materialRoughness;
  *((float *)&v127 + 3) = materialRoughness;
  [(NTKAtiumQuad *)self _getHandAngles];
  long long v108 = v43;
  __float2 v44 = __sincosf_stret(*(float *)&v43);
  *((void *)&v128 + 1) = __PAIR64__(LODWORD(v44.__sinval), LODWORD(v44.__cosval));
  __float2 v45 = __sincosf_stret(*((float *)&v108 + 1));
  *(void *)&long long v129 = __PAIR64__(LODWORD(v45.__sinval), LODWORD(v45.__cosval));
  __float2 v46 = __sincosf_stret(*((float *)&v108 + 2));
  *((void *)&v129 + 1) = __PAIR64__(LODWORD(v46.__sinval), LODWORD(v46.__cosval));
  float v47 = self->_shadowStrength * self->_timeShadowOverride;
  *(float *)&long long v128 = v47;
  *(_OWORD *)((char *)v130 + 8) = *(_OWORD *)&self->_layoutConstants.handLength1;
  *((void *)&v130[1] + 1) = *(void *)&self->_layoutConstants.secondHandLength;
  double v48 = 0.0;
  if (self->_tritiumProgress == 1.0) {
    double v48 = 1.0;
  }
  float v49 = v48;
  *(float *)v130 = v49;
  [(NTKAtiumQuad *)self tritiumMaskMultiplier];
  *(float *)&double v50 = v50;
  DWORD1(v130[0]) = LODWORD(v50);
  id v51 = [(MTLDevice *)self->_mtlDevice newBufferWithBytes:&v121 length:176 options:1];
  [v4 setVertexBuffer:self->_vertexBuffer offset:0 atIndex:0];
  [v4 setVertexBuffer:v51 offset:0 atIndex:1];
  [v4 setFragmentBuffer:v51 offset:0 atIndex:0];
  if (blendTransitionFraction > 0.0)
  {
    float32x4_t v119 = 0u;
    long long v120 = 0u;
    float32x4_t v117 = 0u;
    float32x4_t v118 = 0u;
    float32x4_t v116 = 0u;
    CLKUIConvertToRGBfFromUIColor();
    float32x4_t v105 = v52;
    CLKUIConvertToRGBfFromUIColor();
    float32x4_t v109 = v53;
    CLKUIConvertToRGBfFromUIColor();
    float16x4_t v54 = vcvt_f16_f32(v105);
    _S2 = v105.i32[2];
    __asm { FCVT            H2, S2 }
    v54.i16[2] = _S2;
    float16x4_t v56 = vcvt_f16_f32(v109);
    _S3 = v109.i32[2];
    __asm { FCVT            H3, S3 }
    v56.i16[2] = _S3;
    *(float16x4_t *)&long long v115 = v54;
    *((float16x4_t *)&v115 + 1) = v56;
    float16x4_t v59 = vcvt_f16_f32(_Q0);
    _Q0.i32[0] = _Q0.i32[2];
    __asm { FCVT            H0, S0 }
    v59.i16[2] = _Q0.i16[0];
    *(float16x4_t *)v116.f32 = v59;
    _Q0.f32[0] = self->_blendTransitionFraction;
    v116.i32[2] = _Q0.i32[0];
    id v60 = [(MTLDevice *)self->_mtlDevice newBufferWithBytes:&v115 length:96 options:1];
    [v4 setFragmentBuffer:v60 offset:0 atIndex:1];
  }
  if (v10)
  {
    float32x4_t v119 = 0u;
    long long v120 = 0u;
    float32x4_t v117 = 0u;
    float32x4_t v118 = 0u;
    long long v115 = 0u;
    float32x4_t v116 = 0u;
    double v61 = CACurrentMediaTime();
    double v63 = self->_endOverrideTime;
    if (v61 >= v63)
    {
      if ([(NTKAtiumQuad *)self overrideTritiumAnimation])
      {
        double v70 = CACurrentMediaTime();
        double endWristRaiseTime = self->_endWristRaiseTime;
        if (v70 >= endWristRaiseTime)
        {
          int v64 = 0;
          LODWORD(v115) = 0;
          self->_overrideTritiumAnimation = 0;
          float tritiumProgress = 0.0;
        }
        else
        {
          float tritiumProgress = 1.0 - (v70 - self->_startWristRaiseTime) / (endWristRaiseTime - self->_startWristRaiseTime);
          *(float *)&long long v115 = tritiumProgress;
          int v64 = 1;
        }
      }
      else
      {
        int v64 = 0;
        float tritiumProgress = self->_tritiumProgress;
        *(float *)&long long v115 = tritiumProgress;
      }
      BOOL v67 = IsReduceMotionEnabled;
      float v69 = 1.0;
      float32x2_t v66 = &OBJC_IVAR___NTKAtiumQuad__tritiumRotationMatrix;
    }
    else
    {
      int v64 = 0;
      float tritiumProgress = (v61 - self->_startOverrideTime) / (v63 - self->_startOverrideTime);
      *(float *)&long long v115 = tritiumProgress;
      float32x2_t v66 = &OBJC_IVAR___NTKAtiumQuad__deviceRotationMatrix;
      BOOL v67 = IsReduceMotionEnabled;
      if (self->_overrideDate) {
        int v68 = 1;
      }
      else {
        int v68 = IsReduceMotionEnabled;
      }
      if (v68) {
        float32x2_t v66 = &OBJC_IVAR___NTKAtiumQuad__idealizedRotationMatrix;
      }
      float v69 = 0.0;
    }
    long long v72 = (float32x4_t *)&self->CLKUIQuad_opaque[*v66];
    float32x4_t v73 = v72[1];
    float32x4_t v116 = *v72;
    float32x4_t v117 = v73;
    float32x4_t v74 = v72[2];
    float32x4_t v75 = v72[3];
    float32x4_t v118 = v74;
    float32x4_t v119 = v75;
    *(float *)&long long v120 = v69;
    if (!v67)
    {
      v74.i32[0] = 1045220557;
      LODWORD(v62) = 1.0;
      long long v76 = +[CAMediaTimingFunction functionWithControlPoints:0.0 :*(double *)v74.i64 :0.0 :v62];
      objc_super v78 = v76;
      if (v64)
      {
        *(float *)&double v77 = 1.0 - tritiumProgress;
        [v76 _solveForInput:v77];
      }
      else
      {
        *(float *)&double v77 = tritiumProgress;
        [v76 _solveForInput:v77];
        float v79 = 1.0 - v80;
      }
      float v81 = v79 * 1.57079633 * 0.7;
      *(double *)&long long v82 = sub_4E18(v81, (float32x4_t)xmmword_92F0);
      uint64_t v83 = 0;
      float32x4_t v84 = v116;
      float32x4_t v85 = v117;
      float32x4_t v86 = v118;
      float32x4_t v87 = v119;
      v110[0] = v82;
      v110[1] = v88;
      v110[2] = v89;
      v110[3] = v90;
      float32x4_t v111 = 0u;
      float32x4_t v112 = 0u;
      float32x4_t v113 = 0u;
      float32x4_t v114 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v111 + v83 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v84, COERCE_FLOAT(v110[v83])), v85, *(float32x2_t *)&v110[v83], 1), v86, (float32x4_t)v110[v83], 2), v87, (float32x4_t)v110[v83], 3);
        ++v83;
      }
      while (v83 != 4);
      float32x4_t v116 = v111;
      float32x4_t v117 = v112;
      float32x4_t v118 = v113;
      float32x4_t v119 = v114;
    }
    id v91 = [(MTLDevice *)self->_mtlDevice newBufferWithBytes:&v115 length:96 options:1];
    [v4 setFragmentBuffer:v91 offset:0 atIndex:2];
  }
  if ([(NTKAtiumQuad *)self useRainbowTexture])
  {
    v92 = &OBJC_IVAR___NTKAtiumQuad__reflectionRainbowCubeTexture;
  }
  else
  {
    unsigned int v93 = [(NTKAtiumQuad *)self useThreeColorTexture];
    v92 = &OBJC_IVAR___NTKAtiumQuad__reflectionCubeTexture;
    if (v93) {
      v92 = &OBJC_IVAR___NTKAtiumQuad__reflectionThreeColorCubeTexture;
    }
  }
  [v4 setFragmentTexture:*(void *)&self->CLKUIQuad_opaque[*v92] atIndex:0];
  if (blendTransitionFraction > 0.0)
  {
    if ([(NTKAtiumQuad *)self blendUseRainbowTexture])
    {
      v94 = &OBJC_IVAR___NTKAtiumQuad__reflectionRainbowCubeTexture;
    }
    else
    {
      unsigned int v95 = [(NTKAtiumQuad *)self blendUseThreeColorTexture];
      v94 = &OBJC_IVAR___NTKAtiumQuad__reflectionCubeTexture;
      if (v95) {
        v94 = &OBJC_IVAR___NTKAtiumQuad__reflectionThreeColorCubeTexture;
      }
    }
    [v4 setFragmentTexture:*(void *)&self->CLKUIQuad_opaque[*v94] atIndex:1];
  }
  [v4 setFragmentTexture:self->_centerMaskTexture atIndex:2];
  if (v11) {
    [v4 setFragmentTexture:self->_aodMaskTexture atIndex:3];
  }
  [v4 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [(NTKAtiumQuad *)self dialSize];
  if (v96 < sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)&v121, *(float32x2_t *)&v121))))
  {
    uint64_t v97 = 0;
    LODWORD(v98) = 0;
    *(void *)&long long v115 = v102 | 0x10000000000;
    do
      uint64_t v98 = *((unsigned __int8 *)&v115 + v97++) | (2 * v98);
    while (v97 != 8);
    v99 = +[NSNumber numberWithUnsignedInt:v98];
    v100 = [(NSMutableDictionary *)self->_renderPipelines objectForKey:v99];

    if (v100)
    {
      v101 = [(NSMutableDictionary *)self->_renderPipelines objectForKey:v99];
    }
    else
    {
      v101 = [(NTKAtiumQuad *)self _createRenderPipelineWithPixelFormat:self->_pixelFormat functionConstants:v102 | 0x10000000000];
      [(NSMutableDictionary *)self->_renderPipelines setObject:v101 forKey:v99];
    }
    [v4 setRenderPipelineState:v101];
    [v4 setFragmentTexture:self->_aodMaskTextureBlurred atIndex:3];
    [v4 drawPrimitives:4 vertexStart:0 vertexCount:4];
  }
}

- (void)_updateDeviceRotationMatrix
{
  float32x4_t v2 = *(float32x4_t *)self->_anon_80;
  float32x4_t v3 = *(float32x4_t *)self->_anon_d0;
  int32x4_t v4 = (int32x4_t)vnegq_f32(v2);
  int8x16_t v5 = (int8x16_t)vtrn2q_s32((int32x4_t)v2, vtrn1q_s32((int32x4_t)v2, v4));
  float32x4_t v6 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v2, (int8x16_t)v4, 8uLL), *(float32x2_t *)v3.f32, 1), (float32x4_t)vextq_s8(v5, v5, 8uLL), v3.f32[0]);
  float32x4_t v7 = (float32x4_t)vrev64q_s32((int32x4_t)v2);
  v7.i32[0] = v4.i32[1];
  v7.i32[3] = v4.i32[2];
  anon_90 = self->_anon_90;
  *(double *)&long long v9 = sub_4F14(vaddq_f32(v6, vmlaq_laneq_f32(vmulq_laneq_f32(v2, v3, 3), v7, v3, 2)));
  *(_OWORD *)anon_90 = v9;
  *((_OWORD *)anon_90 + 1) = v10;
  *((_OWORD *)anon_90 + 2) = v11;
  *((_OWORD *)anon_90 + 3) = v12;
}

- (id)_createRenderPipelineWithPixelFormat:(unint64_t)a3 functionConstants:(id)a4
{
  $C6E0E503FBA8F4EE605EBB02F7733E29 v22 = a4;
  int8x16_t v5 = self->_library;
  if (!self->_binaryArchive)
  {
    float32x4_t v6 = sub_4DC4();
    float32x4_t v7 = +[CLKUIMetalBinaryArchive archiveWithName:@"atium" bundle:v6 device:self->_mtlDevice];
    binaryArchive = self->_binaryArchive;
    self->_binaryArchive = v7;
  }
  long long v9 = objc_opt_new();
  for (uint64_t i = 0; i != 8; ++i)
    [v9 setConstantValue:&v22.var0[i] type:53 atIndex:i];
  id v11 = [(MTLLibrary *)v5 newFunctionWithName:@"atiumVertexShader"];
  long long v12 = +[MTLFunctionDescriptor functionDescriptor];
  [v12 setName:@"atiumFragmentShader"];
  [v12 setConstantValues:v9];
  id v13 = [(CLKUIMetalBinaryArchive *)self->_binaryArchive newFunctionInLibrary:v5 withDescriptor:v12];
  if (!v13)
  {
    uint64_t v14 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_6BE8();
    }
  }
  id v15 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  [v15 setVertexFunction:v11];
  [v15 setFragmentFunction:v13];
  [v15 setLabel:@"Atium Render Pipeline"];
  uint64_t v16 = [v15 colorAttachments];
  unint64_t v17 = [v16 objectAtIndexedSubscript:0];

  [v17 setPixelFormat:a3];
  [v17 setBlendingEnabled:1];
  [v17 setRgbBlendOperation:0];
  [v17 setAlphaBlendOperation:0];
  [v17 setSourceRGBBlendFactor:4];
  [v17 setSourceAlphaBlendFactor:4];
  [v17 setDestinationRGBBlendFactor:5];
  [v17 setDestinationAlphaBlendFactor:5];
  id v18 = [(CLKUIMetalBinaryArchive *)self->_binaryArchive newRenderPipelineStateForDevice:self->_mtlDevice withDescriptor:v15];
  if (!v18)
  {
    unint64_t v19 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      sub_6B64();
    }
  }

  return v18;
}

- (id)_createVertexBuffer
{
  v4[0] = xmmword_9328;
  v4[1] = unk_9338;
  id v2 = [(MTLDevice *)self->_mtlDevice newBufferWithBytes:v4 length:32 options:1];

  return v2;
}

- (id)_createTextureWithName:(id)a3
{
  id v4 = a3;
  p_mtlDevice = (uint64_t *)&self->_mtlDevice;
  id v6 = [objc_alloc((Class)MTKTextureLoader) initWithDevice:self->_mtlDevice];
  v15[0] = MTKTextureLoaderOptionTextureUsage;
  v15[1] = MTKTextureLoaderOptionTextureStorageMode;
  v16[0] = &off_CB80;
  v16[1] = &off_CB98;
  float32x4_t v7 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  unsigned int v8 = sub_4DC4();
  id v14 = 0;
  id v9 = [v6 newTextureWithName:v4 scaleFactor:v8 bundle:v7 options:&v14 error:1.0];

  id v10 = v14;
  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    long long v12 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_6C74(p_mtlDevice, (uint64_t)v10, v12);
    }
  }

  return v9;
}

- (UIColor)firstLightColor
{
  return self->firstLightColor;
}

- (void)setFirstLightColor:(id)a3
{
}

- (UIColor)secondLightColor
{
  return self->secondLightColor;
}

- (void)setSecondLightColor:(id)a3
{
}

- (UIColor)backgroundLightColor
{
  return self->backgroundLightColor;
}

- (void)setBackgroundLightColor:(id)a3
{
}

- (UIColor)blendFirstLightColor
{
  return self->blendFirstLightColor;
}

- (void)setBlendFirstLightColor:(id)a3
{
}

- (UIColor)blendSecondLightColor
{
  return self->blendSecondLightColor;
}

- (void)setBlendSecondLightColor:(id)a3
{
}

- (UIColor)blendBackgroundLightColor
{
  return self->blendBackgroundLightColor;
}

- (void)setBlendBackgroundLightColor:(id)a3
{
}

- (double)dialSize
{
  return self->dialSize;
}

- (void)setDialSize:(double)a3
{
  self->dialSize = a3;
}

- (NTKAtiumQuadDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKAtiumQuadDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)tritiumProgress
{
  return self->_tritiumProgress;
}

- (void)setTritiumProgress:(double)a3
{
  self->_float tritiumProgress = a3;
}

- (double)shadowStrength
{
  return self->_shadowStrength;
}

- (void)setShadowStrength:(double)a3
{
  self->_shadowStrength = a3;
}

- (BOOL)overrideTritiumAnimation
{
  return self->_overrideTritiumAnimation;
}

- (void)setOverrideTritiumAnimation:(BOOL)a3
{
  self->_overrideTritiumAnimation = a3;
}

- (BOOL)recolorLightingTextureEnabled
{
  return self->_recolorLightingTextureEnabled;
}

- (void)setRecolorLightingTextureEnabled:(BOOL)a3
{
  self->_recolorLightingTextureEnabled = a3;
}

- (BOOL)useRainbowTexture
{
  return self->_useRainbowTexture;
}

- (void)setUseRainbowTexture:(BOOL)a3
{
  self->_useRainbowTexture = a3;
}

- (BOOL)useThreeColorTexture
{
  return self->_useThreeColorTexture;
}

- (void)setUseThreeColorTexture:(BOOL)a3
{
  self->_useThreeColorTexture = a3;
}

- (double)blendTransitionFraction
{
  return self->_blendTransitionFraction;
}

- (void)setBlendTransitionFraction:(double)a3
{
  self->_double blendTransitionFraction = a3;
}

- (BOOL)blendRecolorLightingTextureEnabled
{
  return self->_blendRecolorLightingTextureEnabled;
}

- (void)setBlendRecolorLightingTextureEnabled:(BOOL)a3
{
  self->_blendRecolorLightingTextureEnabled = a3;
}

- (BOOL)blendUseRainbowTexture
{
  return self->_blendUseRainbowTexture;
}

- (void)setBlendUseRainbowTexture:(BOOL)a3
{
  self->_blendUseRainbowTexture = a3;
}

- (BOOL)blendUseThreeColorTexture
{
  return self->_blendUseThreeColorTexture;
}

- (void)setBlendUseThreeColorTexture:(BOOL)a3
{
  self->_blendUseThreeColorTexture = a3;
}

- (double)tritiumMaskMultiplier
{
  return self->_tritiumMaskMultiplier;
}

- (void)setTritiumMaskMultiplier:(double)a3
{
  self->_tritiumMaskMultiplier = a3;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (BOOL)isAnimatingOverrideDate
{
  return self->_animatingOverrideDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->blendBackgroundLightColor, 0);
  objc_storeStrong((id *)&self->blendSecondLightColor, 0);
  objc_storeStrong((id *)&self->blendFirstLightColor, 0);
  objc_storeStrong((id *)&self->backgroundLightColor, 0);
  objc_storeStrong((id *)&self->secondLightColor, 0);
  objc_storeStrong((id *)&self->firstLightColor, 0);
  objc_storeStrong((id *)&self->_binaryArchive, 0);
  objc_storeStrong((id *)&self->_overrideDateMediaTimingFunction, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_vertexBuffer, 0);
  objc_storeStrong((id *)&self->_aodMaskTextureBlurred, 0);
  objc_storeStrong((id *)&self->_aodMaskTexture, 0);
  objc_storeStrong((id *)&self->_centerMaskTexture, 0);
  objc_storeStrong((id *)&self->_reflectionRainbowCubeTexture, 0);
  objc_storeStrong((id *)&self->_reflectionThreeColorCubeTexture, 0);
  objc_storeStrong((id *)&self->_reflectionCubeTexture, 0);
  objc_storeStrong((id *)&self->_renderPipelines, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_mtlDevice, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end