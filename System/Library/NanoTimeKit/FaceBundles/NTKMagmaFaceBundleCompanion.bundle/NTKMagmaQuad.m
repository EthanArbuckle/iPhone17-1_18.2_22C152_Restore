@interface NTKMagmaQuad
- (BOOL)masking;
- (BOOL)prepareForTime:(double)a3;
- (BOOL)runPhysics;
- (CGSize)size;
- (NTKMagmaEffectsRendererDelegate)delegate;
- (NTKMagmaQuad)initWithScale:(double)a3;
- (UIColor)backgroundBottomColor;
- (UIColor)backgroundTopColor;
- (UIColor)logoColor;
- (UIColor)timeFillColor;
- (UIColor)timeOutlineColor;
- (float)backgroundTextureAlpha;
- (float)distortionMultiplier;
- (float)maskingFraction;
- (float)tritiumFraction;
- (void)applyInverseQuadraticRepuslorWithOrigin:(float)a3 magnitude:(float)a4 radius:;
- (void)applyInverseSquareRepuslorWithOrigin:(float)a3 magnitude:(float)a4 max:;
- (void)applyLineImpulseWithLinearFalloff:(NTKMagmaQuad *)self;
- (void)applyLineImpulseWithQuadraticFalloff:(NTKMagmaQuad *)self;
- (void)applyQuadraticDragWithOrigin:(NTKMagmaQuad *)self drag:(SEL)a2 radius:(float)a3;
- (void)applyQuadraticRepuslorWithOrigin:(float)a3 magnitude:(float)a4 radius:;
- (void)applyRandomImpulses:(float)a3;
- (void)applySpinWithMagnitude:(float)a3;
- (void)applySpringImpulseWithBlock:(id)a3;
- (void)applyUniformImpulse:(NTKMagmaQuad *)self;
- (void)applyUniformRepuslorWithOrigin:(float)a3 magnitude:(float)a4 radius:;
- (void)performOffscreenPassesWithCommandBuffer:(id)a3;
- (void)renderForDisplayWithEncoder:(id)a3;
- (void)resetSprings;
- (void)setBackgroundBottomColor:(id)a3;
- (void)setBackgroundMultiplier:(float)a3;
- (void)setBackgroundTextureAlpha:(float)a3;
- (void)setBackgroundTopColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDistortionMultiplier:(float)a3;
- (void)setLogoColor:(id)a3;
- (void)setMasking:(BOOL)a3;
- (void)setMaskingFraction:(float)a3;
- (void)setRunPhysics:(BOOL)a3;
- (void)setScreenBoundRect:(CGRect)a3;
- (void)setTimeFillColor:(id)a3;
- (void)setTimeOutlineColor:(id)a3;
- (void)setTritiumFraction:(float)a3;
- (void)setupForQuadView:(id)a3;
- (void)updateBackgroundTextureWithImage:(id)a3;
- (void)updateLogoTextureWithImage:(id)a3 origin:(CGPoint)a4;
- (void)updateTimeTextureWithImage:(id)a3 tritiumImage:(id)a4 origin:(CGPoint)a5;
@end

@implementation NTKMagmaQuad

- (NTKMagmaQuad)initWithScale:(double)a3
{
  v15.receiver = self;
  v15.super_class = (Class)NTKMagmaQuad;
  v4 = [(NTKMagmaQuad *)&v15 init];
  v5 = v4;
  if (v4)
  {
    v4->_screenScale = a3;
    uint64_t v6 = +[CLKUIMetalResourceManager sharedDevice];
    device = v5->_device;
    v5->_device = (MTLDevice *)v6;

    v8 = v5->_device;
    if (qword_1C538 != -1) {
      dispatch_once(&qword_1C538, &stru_147C0);
    }
    id v9 = (id)qword_1C530;
    v10 = (MTLLibrary *)[(MTLDevice *)v8 newDefaultLibraryWithBundle:v9 error:0];
    library = v5->_library;
    v5->_library = v10;

    dispatch_semaphore_t v12 = dispatch_semaphore_create(2);
    renderSemaphore = v5->_renderSemaphore;
    v5->_renderSemaphore = (OS_dispatch_semaphore *)v12;
  }
  return v5;
}

- (void)setupForQuadView:(id)a3
{
  p_size = &self->_size;
  id v5 = a3;
  [v5 bounds];
  p_size->width = v6;
  p_size->height = v7;
  v8 = [NTKMagmaEffectsRenderer alloc];
  device = self->_device;
  library = self->_library;
  [v5 bounds];
  uint64_t v12 = (int)(v11 * self->_screenScale);
  [v5 bounds];
  double screenScale = self->_screenScale;
  uint64_t v15 = (int)(screenScale * v14);
  float v16 = screenScale;
  id v17 = [v5 colorPixelFormat];

  *(float *)&double v18 = v16;
  self->_renderer = [(NTKMagmaEffectsRenderer *)v8 initWithDevice:device library:library width:v12 height:v15 screenScale:v17 colorPixelFormat:v18];

  _objc_release_x1();
}

- (BOOL)prepareForTime:(double)a3
{
  renderSemaphore = self->_renderSemaphore;
  dispatch_time_t v6 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(renderSemaphore, v6))
  {
    CGFloat v7 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_C2DC(v7);
    }
  }
  else
  {
    if ([(NTKMagmaEffectsRenderer *)self->_renderer prepareForTime:a3]) {
      return 1;
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_renderSemaphore);
  }
  return 0;
}

- (void)performOffscreenPassesWithCommandBuffer:(id)a3
{
  renderer = self->_renderer;
  id v5 = a3;
  [(NTKMagmaEffectsRenderer *)renderer performOffscreenPassesWithCommandBuffer:v5];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_AF38;
  v6[3] = &unk_146B8;
  v6[4] = self;
  [v5 addCompletedHandler:v6];
}

- (void)renderForDisplayWithEncoder:(id)a3
{
}

- (void)applySpringImpulseWithBlock:(id)a3
{
}

- (void)setDistortionMultiplier:(float)a3
{
  self->_distortionMultiplier = a3;
  -[NTKMagmaEffectsRenderer setDistortionMultiplier:](self->_renderer, "setDistortionMultiplier:");
}

- (void)resetSprings
{
}

- (void)setRunPhysics:(BOOL)a3
{
  self->_runPhysics = a3;
  -[NTKMagmaEffectsRenderer setRunPhysics:](self->_renderer, "setRunPhysics:");
}

- (void)setScreenBoundRect:(CGRect)a3
{
}

- (void)setBackgroundMultiplier:(float)a3
{
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  [(NTKMagmaEffectsRenderer *)self->_renderer setDelegate:v5];
}

- (void)applyUniformImpulse:(NTKMagmaQuad *)self
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_B0B0;
  v3[3] = &unk_146D8;
  uint64_t v4 = v2;
  [(NTKMagmaQuad *)self applySpringImpulseWithBlock:v3];
}

- (void)applyRandomImpulses:(float)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_B124;
  v3[3] = &unk_146F8;
  float v4 = a3;
  [(NTKMagmaQuad *)self applySpringImpulseWithBlock:v3];
}

- (void)applyLineImpulseWithLinearFalloff:(NTKMagmaQuad *)self
{
  v3.i32[0] = vdup_lane_s32(v2, 1).u32[0];
  v3.f32[1] = -*(float *)v2.i32;
  float32x2_t v4 = vmul_f32(v3, v3);
  v4.i32[0] = vadd_f32(v4, (float32x2_t)vdup_lane_s32((int32x2_t)v4, 1)).u32[0];
  float32x2_t v5 = vrsqrte_f32((float32x2_t)v4.u32[0]);
  float32x2_t v6 = vmul_f32(v5, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(v5, v5)));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_B23C;
  v7[3] = &unk_14718;
  v7[4] = vmul_n_f32(v3, vmul_f32(v6, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(v6, v6))).f32[0]);
  int32x2_t v8 = v2;
  [(NTKMagmaQuad *)self applySpringImpulseWithBlock:v7];
}

- (void)applyLineImpulseWithQuadraticFalloff:(NTKMagmaQuad *)self
{
  if (sqrtf(vaddv_f32(vmul_f32(v4, v4))) != 0.0)
  {
    v9[6] = v2;
    v9[7] = v3;
    v5.i32[0] = vdup_lane_s32((int32x2_t)v4, 1).u32[0];
    v5.f32[1] = -v4.f32[0];
    float32x2_t v6 = vmul_f32(v5, v5);
    v6.i32[0] = vadd_f32(v6, (float32x2_t)vdup_lane_s32((int32x2_t)v6, 1)).u32[0];
    float32x2_t v7 = vrsqrte_f32((float32x2_t)v6.u32[0]);
    float32x2_t v8 = vmul_f32(v7, vrsqrts_f32((float32x2_t)v6.u32[0], vmul_f32(v7, v7)));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_B34C;
    v9[3] = &unk_14718;
    v9[4] = vmul_n_f32(v5, vmul_f32(v8, vrsqrts_f32((float32x2_t)v6.u32[0], vmul_f32(v8, v8))).f32[0]);
    v9[5] = v4;
    [(NTKMagmaQuad *)self applySpringImpulseWithBlock:v9];
  }
}

- (void)applySpinWithMagnitude:(float)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_B404;
  v3[3] = &unk_14740;
  void v3[4] = self;
  float v4 = a3;
  [(NTKMagmaQuad *)self applySpringImpulseWithBlock:v3];
}

- (void)applyInverseSquareRepuslorWithOrigin:(float)a3 magnitude:(float)a4 max:
{
  int v5 = v4;
  uint64_t v7 = *(void *)&a3;
  [(NTKMagmaQuad *)self size];
  v10[1] = 3221225472;
  v10[0] = _NSConcreteStackBlock;
  v10[2] = sub_B554;
  v10[3] = &unk_14760;
  v10[4] = v7;
  *(double *)&v10[5] = 1.0 / v9;
  float v11 = a4;
  int v12 = v5;
  [(NTKMagmaQuad *)self applySpringImpulseWithBlock:v10];
}

- (void)applyUniformRepuslorWithOrigin:(float)a3 magnitude:(float)a4 radius:
{
  float v5 = v4;
  uint64_t v7 = *(void *)&a3;
  [(NTKMagmaQuad *)self size];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_B664;
  v10[3] = &unk_14780;
  v10[4] = v7;
  *(double *)&v10[5] = 1.0 / v9;
  *(double *)&void v10[6] = (float)(v5 * v5);
  float v11 = a4;
  [(NTKMagmaQuad *)self applySpringImpulseWithBlock:v10];
}

- (void)applyQuadraticRepuslorWithOrigin:(float)a3 magnitude:(float)a4 radius:
{
  float v5 = v4;
  uint64_t v7 = *(void *)&a3;
  [(NTKMagmaQuad *)self size];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_B77C;
  v10[3] = &unk_14780;
  v10[4] = v7;
  *(double *)&v10[5] = 1.0 / v9;
  *(double *)&void v10[6] = (float)(v5 * v5);
  float v11 = a4;
  [(NTKMagmaQuad *)self applySpringImpulseWithBlock:v10];
}

- (void)applyInverseQuadraticRepuslorWithOrigin:(float)a3 magnitude:(float)a4 radius:
{
  float v5 = v4;
  uint64_t v7 = *(void *)&a3;
  [(NTKMagmaQuad *)self size];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_B8A4;
  v10[3] = &unk_14780;
  v10[4] = v7;
  *(double *)&v10[5] = 1.0 / v9;
  *(double *)&void v10[6] = (float)(v5 * v5);
  float v11 = a4;
  [(NTKMagmaQuad *)self applySpringImpulseWithBlock:v10];
}

- (void)applyQuadraticDragWithOrigin:(NTKMagmaQuad *)self drag:(SEL)a2 radius:(float)a3
{
  float v5 = v4;
  uint64_t v6 = v3;
  uint64_t v7 = *(void *)&a3;
  [(NTKMagmaQuad *)self size];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_B9D0;
  v10[3] = &unk_147A0;
  v10[4] = v7;
  *(double *)&v10[5] = 1.0 / v9;
  *(double *)&void v10[6] = (float)(v5 * v5);
  void v10[7] = v6;
  [(NTKMagmaQuad *)self applySpringImpulseWithBlock:v10];
}

- (void)updateTimeTextureWithImage:(id)a3 tritiumImage:(id)a4 origin:(CGPoint)a5
{
}

- (void)updateLogoTextureWithImage:(id)a3 origin:(CGPoint)a4
{
}

- (void)updateBackgroundTextureWithImage:(id)a3
{
}

- (void)setTimeFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_timeFillColor, a3);
  id v5 = a3;
  CLKUIConvertToRGBfFromUIColor();
  -[NTKMagmaEffectsRenderer setTimeFillColor:](self->_renderer, "setTimeFillColor:");
}

- (void)setTimeOutlineColor:(id)a3
{
  objc_storeStrong((id *)&self->_timeOutlineColor, a3);
  id v5 = a3;
  CLKUIConvertToRGBfFromUIColor();
  -[NTKMagmaEffectsRenderer setTimeOutlineColor:](self->_renderer, "setTimeOutlineColor:");
}

- (void)setLogoColor:(id)a3
{
  objc_storeStrong((id *)&self->_logoColor, a3);
  id v6 = a3;
  CLKUIConvertToRGBfFromUIColor();
  [(NTKMagmaEffectsRenderer *)self->_renderer setLogoColor:COERCE_DOUBLE(vmul_laneq_f32(*(float32x2_t *)v5.f32, v5, 3))];
}

- (void)setBackgroundTopColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundTopColor, a3);
  id v5 = a3;
  CLKUIConvertToRGBfFromUIColor();
  -[NTKMagmaEffectsRenderer setBackgroundTopColor:](self->_renderer, "setBackgroundTopColor:");
}

- (void)setBackgroundBottomColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundBottomColor, a3);
  id v5 = a3;
  CLKUIConvertToRGBfFromUIColor();
  -[NTKMagmaEffectsRenderer setBackgroundBottomColor:](self->_renderer, "setBackgroundBottomColor:");
}

- (void)setBackgroundTextureAlpha:(float)a3
{
  self->_backgroundTextureAlpha = a3;
  -[NTKMagmaEffectsRenderer setBackgroundTextureAlpha:](self->_renderer, "setBackgroundTextureAlpha:");
}

- (void)setMaskingFraction:(float)a3
{
  self->_maskingFraction = a3;
  -[NTKMagmaEffectsRenderer setMaskingFraction:](self->_renderer, "setMaskingFraction:");
}

- (void)setTritiumFraction:(float)a3
{
  self->_tritiumFraction = a3;
  -[NTKMagmaEffectsRenderer setTritiumFraction:](self->_renderer, "setTritiumFraction:");
}

- (NTKMagmaEffectsRendererDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKMagmaEffectsRendererDelegate *)WeakRetained;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)masking
{
  return self->_masking;
}

- (void)setMasking:(BOOL)a3
{
  self->_masking = a3;
}

- (BOOL)runPhysics
{
  return self->_runPhysics;
}

- (float)distortionMultiplier
{
  return self->_distortionMultiplier;
}

- (UIColor)timeFillColor
{
  return self->_timeFillColor;
}

- (UIColor)timeOutlineColor
{
  return self->_timeOutlineColor;
}

- (UIColor)logoColor
{
  return self->_logoColor;
}

- (UIColor)backgroundTopColor
{
  return self->_backgroundTopColor;
}

- (UIColor)backgroundBottomColor
{
  return self->_backgroundBottomColor;
}

- (float)backgroundTextureAlpha
{
  return self->_backgroundTextureAlpha;
}

- (float)maskingFraction
{
  return self->_maskingFraction;
}

- (float)tritiumFraction
{
  return self->_tritiumFraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundBottomColor, 0);
  objc_storeStrong((id *)&self->_backgroundTopColor, 0);
  objc_storeStrong((id *)&self->_logoColor, 0);
  objc_storeStrong((id *)&self->_timeOutlineColor, 0);
  objc_storeStrong((id *)&self->_timeFillColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_renderSemaphore, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end