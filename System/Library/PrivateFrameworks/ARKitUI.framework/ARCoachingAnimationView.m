@interface ARCoachingAnimationView
- (ARCoachingAnimationView)initWithCoder:(id)a3;
- (ARCoachingAnimationView)initWithFrame:(CGRect)a3;
- (BOOL)isDeactivating;
- (CGSize)intrinsicContentSize;
- (double)calcNextAnimationSwitchTime:(double)a3 forState:(unint64_t)a4;
- (int64_t)animationState;
- (void)clampCubeToQuarterRotation;
- (void)drawInDrawable:(id)a3 withCommandBuffer:(id)a4 timeDelta:(double)a5;
- (void)killCoachingAnimation;
- (void)layoutSubviews;
- (void)resizeForDrawable:(id)a3;
- (void)setAnimationState:(int64_t)a3;
- (void)setIsDeactivating:(BOOL)a3;
- (void)setupView;
- (void)startCoachingAnimation:(int64_t)a3;
- (void)updateAlternatingPlanes:(double)a3;
- (void)updateCubeRotation:(id)a3 motionTracker:(id)a4;
- (void)updateForCurrentTime:(double)a3 timeDelta:(double)a4;
- (void)updateMetalLayer;
- (void)updateVerticalClamp:(double)a3;
- (void)updateWithFrame:(id)a3 motionTracker:(id)a4;
@end

@implementation ARCoachingAnimationView

- (ARCoachingAnimationView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ARCoachingAnimationView;
  v3 = -[ARCoachingAnimationView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(ARCoachingAnimationView *)v3 setupView];
  }
  return v4;
}

- (ARCoachingAnimationView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ARCoachingAnimationView;
  v3 = [(ARCoachingAnimationView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ARCoachingAnimationView *)v3 setupView];
  }
  return v4;
}

- (void)setupView
{
  self->_cubeAngle = 0.0;
}

- (void)setAnimationState:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (self->_animationState != a3)
  {
    self->_animationState = a3;
    if (!self->_isDeactivating)
    {
      int64_t v4 = 0;
      switch(a3)
      {
        case 0:
          int64_t v4 = 1;
          goto LABEL_16;
        case 2:
        case 4:
          int64_t v4 = a3;
          goto LABEL_16;
        case 3:
          objc_super v6 = [(ARCoachingRenderer *)self->_renderer state];
          uint64_t v7 = [v6 snapState];

          if (v7 == 4)
          {
            self->_nextStateTime = -1.0;
LABEL_9:
            int64_t v4 = 4;
          }
          else
          {
            int64_t v4 = 3;
          }
LABEL_16:
          v13 = [(ARCoachingRenderer *)self->_renderer state];
          uint64_t v14 = [v13 snapState];

          if (v14 != v4)
          {
            id v15 = [(ARCoachingRenderer *)self->_renderer state];
            [v15 setSnapState:v4];
          }
          break;
        case 5:
          self->_nextStateTime = -1.0;
          v8 = [(ARCoachingRenderer *)self->_renderer state];
          int64_t v4 = [v8 snapState];

          goto LABEL_16;
        case 6:
          [(ARCoachingAnimationView *)self clampCubeToQuarterRotation];
          *(float *)&double v5 = self->_cubeAngle;
          [(ARCoachingRenderer *)self->_renderer setOrientationAngle:v5];
          goto LABEL_9;
        case 7:
          if (self->_currentCoachingGoal != 4)
          {
            v9 = _ARLogCoaching_1();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              v10 = (objc_class *)objc_opt_class();
              v11 = NSStringFromClass(v10);
              int64_t currentCoachingGoal = self->_currentCoachingGoal;
              *(_DWORD *)buf = 138543874;
              v17 = v11;
              __int16 v18 = 2048;
              v19 = self;
              __int16 v20 = 2048;
              int64_t v21 = currentCoachingGoal;
              _os_log_impl(&dword_20B202000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Trying to set animation state to geo tracking but geo tracking is not the current goal, goal is: %ld", buf, 0x20u);
            }
          }
          return;
        default:
          goto LABEL_16;
      }
    }
  }
}

- (CGSize)intrinsicContentSize
{
  double v2 = ARCoachingLayoutScalar() * 600.0;
  double v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)startCoachingAnimation:(int64_t)a3
{
  self->_int64_t currentCoachingGoal = a3;
  if (!self->_renderer)
  {
    double v5 = [MEMORY[0x263F20F40] sharedInstance];
    objc_super v6 = [v5 device];

    uint64_t v7 = [MEMORY[0x263F15820] layer];
    metalLayer = self->_metalLayer;
    self->_metalLayer = v7;

    [(CAMetalLayer *)self->_metalLayer setOpaque:0];
    v9 = [[ARCoachingUpdateManager alloc] init:v6 metalLayer:self->_metalLayer];
    updateManager = self->_updateManager;
    self->_updateManager = v9;

    [(ARCoachingUpdateManager *)self->_updateManager setDelegate:self];
    uint64_t v11 = 8;
    if (([v6 supportsTextureSampleCount:8] & 1) == 0)
    {
      if ([v6 supportsTextureSampleCount:4]) {
        uint64_t v11 = 4;
      }
      else {
        uint64_t v11 = 1;
      }
    }
    v12 = ARCoachingLoadDeviceGlyph();
    if (a3 == 4) {
      v13 = ARCoachingGeoTrackingRenderer;
    }
    else {
      v13 = ARCoachingGlyphRenderer;
    }
    uint64_t v14 = (ARCoachingRenderer *)objc_msgSend([v13 alloc], "initWithLayer:device:pixelFormat:sampleCount:deviceMaskImage:", self->_metalLayer, v6, -[CAMetalLayer pixelFormat](self->_metalLayer, "pixelFormat"), v11, v12);
    renderer = self->_renderer;
    self->_renderer = v14;

    v16 = self->_renderer;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __50__ARCoachingAnimationView_startCoachingAnimation___block_invoke;
    v21[3] = &unk_264000B08;
    v21[4] = self;
    [(ARCoachingRenderer *)v16 prepareWithCompletionHandler:v21];
    v17 = [(ARCoachingAnimationView *)self layer];
    [v17 addSublayer:self->_metalLayer];

    [(ARCoachingAnimationView *)self updateMetalLayer];
  }
  self->_cubeAngle = 0.0;
  [(ARCoachingRenderer *)self->_renderer setOrientationAngle:0.0];
  __int16 v18 = [(ARCoachingRenderer *)self->_renderer state];
  [v18 setIsVertical:a3 == 2];

  v19 = [(ARCoachingRenderer *)self->_renderer state];
  [v19 setSnapState:1];

  int64_t v20 = 7;
  if (a3 != 4) {
    int64_t v20 = 0;
  }
  self->_animationState = v20;
}

void __50__ARCoachingAnimationView_startCoachingAnimation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    int64_t v4 = _ARLogCoaching_1();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      double v5 = (objc_class *)objc_opt_class();
      objc_super v6 = NSStringFromClass(v5);
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v10 = v6;
      __int16 v11 = 2048;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_20B202000, v4, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create coaching renderer: %@", buf, 0x20u);
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__ARCoachingAnimationView_startCoachingAnimation___block_invoke_23;
    block[3] = &unk_264000B80;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __50__ARCoachingAnimationView_startCoachingAnimation___block_invoke_23(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) start];
}

- (void)killCoachingAnimation
{
  renderer = self->_renderer;
  self->_renderer = 0;

  [(ARCoachingUpdateManager *)self->_updateManager stop];
  updateManager = self->_updateManager;
  self->_updateManager = 0;

  [(CAMetalLayer *)self->_metalLayer removeFromSuperlayer];
  metalLayer = self->_metalLayer;
  self->_metalLayer = 0;
}

- (void)updateWithFrame:(id)a3 motionTracker:(id)a4
{
  [(ARCoachingAnimationView *)self updateCubeRotation:a3 motionTracker:a4];
  if (*(_WORD *)&self->_isRotating)
  {
    renderer = self->_renderer;
    *(float *)&double v5 = self->_cubeAngle;
    [(ARCoachingRenderer *)renderer setOrientationAngle:v5];
  }
}

- (void)updateCubeRotation:(id)a3 motionTracker:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 camera];
  objc_msgSend(v8, "viewMatrixForOrientation:", objc_msgSend(v7, "interfaceOrientation"));
  int32x4_t v34 = v9;
  int32x4_t v35 = v10;
  int32x4_t v32 = v11;
  int32x4_t v33 = v12;

  int32x4_t v13 = vzip1q_s32(v34, v32);
  int32x4_t v14 = vzip2q_s32(v34, v32);
  int32x4_t v15 = vzip1q_s32(v35, v33);
  int32x4_t v16 = vzip2q_s32(v35, v33);
  *(float32x4_t *)self->_lastCameraRight = vmlaq_f32(vmlaq_f32(vmlaq_f32((float32x4_t)vzip1q_s32(v13, v15), (float32x4_t)0, (float32x4_t)vzip2q_s32(v13, v15)), (float32x4_t)0, (float32x4_t)vzip1q_s32(v14, v16)), (float32x4_t)0, (float32x4_t)vzip2q_s32(v14, v16));
  v17 = [v7 camera];

  [v17 transform];
  *(_OWORD *)self->_lastCameraTranslation = v18;

  self->_wasRotating = self->_isRotating;
  if (self->_animationState == 4)
  {
    int v19 = [v6 isMoving];
    self->_isRotating = v19;
    if (v19)
    {
      if (self->_wasRotating)
      {
        float32x4_t v20 = *(float32x4_t *)self->_rotationStartCameraTranslation;
LABEL_13:
        float32x4_t v27 = vsubq_f32(*(float32x4_t *)self->_lastCameraTranslation, v20);
        int32x4_t v28 = (int32x4_t)vmulq_f32(v27, v27);
        v28.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v28, 2), vadd_f32(*(float32x2_t *)v28.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v28.i8, 1))).u32[0];
        float32x2_t v29 = vrsqrte_f32((float32x2_t)v28.u32[0]);
        float32x2_t v30 = vmul_f32(v29, vrsqrts_f32((float32x2_t)v28.u32[0], vmul_f32(v29, v29)));
        float32x4_t v31 = vmulq_f32(*(float32x4_t *)self->_rotationStartCameraRight, vmulq_n_f32(v27, vmul_f32(v30, vrsqrts_f32((float32x2_t)v28.u32[0], vmul_f32(v30, v30))).f32[0]));
        self->_cubeAngle = self->_cubeAngle
                         + fminf(fmaxf((float)(5.0* vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v31, 2), vaddq_f32(v31, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v31.f32, 1))).f32[0])- self->_cubeAngle, -0.05), 0.05);
        goto LABEL_14;
      }
      v24 = _ARLogCoaching_1();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        *(_DWORD *)buf = 138543618;
        v37 = v26;
        __int16 v38 = 2048;
        v39 = self;
        _os_log_impl(&dword_20B202000, v24, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Coaching animation began rotation", buf, 0x16u);
      }
      *(_OWORD *)self->_rotationStartCameraRight = *(_OWORD *)self->_lastCameraRight;
      float32x4_t v20 = *(float32x4_t *)self->_lastCameraTranslation;
      *(float32x4_t *)self->_rotationStartCameraTranslation = v20;
      if (self->_isRotating) {
        goto LABEL_13;
      }
    }
  }
  else
  {
    self->_isRotating = 0;
  }
  if (self->_wasRotating)
  {
    int64_t v21 = _ARLogCoaching_1();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138543618;
      v37 = v23;
      __int16 v38 = 2048;
      v39 = self;
      _os_log_impl(&dword_20B202000, v21, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Coaching animation ended rotation", buf, 0x16u);
    }
    [(ARCoachingAnimationView *)self clampCubeToQuarterRotation];
  }
LABEL_14:
}

- (void)clampCubeToQuarterRotation
{
  float cubeAngle = self->_cubeAngle;
  int v4 = (int)(fabs(cubeAngle / 1.57079633) + 0.5);
  if (cubeAngle < 0.0) {
    int v4 = -v4;
  }
  float v5 = (float)v4 * 1.57079633;
  self->_float cubeAngle = v5;
  id v6 = [(ARCoachingRenderer *)self->_renderer state];
  int v7 = [v6 isVertical];

  if (v7)
  {
    double v8 = self->_cubeAngle;
    int v9 = llround(fmod(v8 / 1.57079633, 4.0));
    if (((v9 + (v9 < 0 ? 4 : 0)) | 2) == 3)
    {
      float v10 = v8 + -1.57079633;
      self->_float cubeAngle = v10;
    }
  }
}

- (double)calcNextAnimationSwitchTime:(double)a3 forState:(unint64_t)a4
{
  double v5 = dbl_20B231F30[a4 == 3];
  [(ARCoachingRenderer *)self->_renderer currentAnimationTime];
  long double v7 = fmod(v6, 6.28318531);
  return fmod(v5 - v7 + 6.28318531, 6.28318531) + a3;
}

- (void)updateAlternatingPlanes:(double)a3
{
  if (self->_animationState != 5) {
    return;
  }
  double nextStateTime = self->_nextStateTime;
  if (nextStateTime < 0.0)
  {
    long double v6 = [(ARCoachingRenderer *)self->_renderer state];
    uint64_t v7 = [v6 snapState];

    if (v7 == 2)
    {
      uint64_t v8 = 3;
    }
    else
    {
      double nextStateTime = a3;
      if (v7 != 3)
      {
LABEL_8:
        self->_double nextStateTime = nextStateTime;
        goto LABEL_9;
      }
      uint64_t v8 = 2;
    }
    [(ARCoachingAnimationView *)self calcNextAnimationSwitchTime:v8 forState:a3];
    goto LABEL_8;
  }
LABEL_9:
  if (nextStateTime > a3) {
    return;
  }
  int v9 = [(ARCoachingRenderer *)self->_renderer state];
  uint64_t v10 = [v9 snapState];

  if (v10 == 3)
  {
    [(ARCoachingAnimationView *)self calcNextAnimationSwitchTime:3 forState:a3];
    uint64_t v12 = 0;
LABEL_18:
    uint64_t v14 = 2;
    goto LABEL_21;
  }
  if (v10 == 2)
  {
LABEL_20:
    [(ARCoachingAnimationView *)self calcNextAnimationSwitchTime:2 forState:a3];
    uint64_t v12 = 1;
    uint64_t v14 = 3;
    goto LABEL_21;
  }
  int32x4_t v11 = [(ARCoachingRenderer *)self->_renderer state];
  uint64_t v12 = [v11 isVertical];

  if (!v12)
  {
    [(ARCoachingRenderer *)self->_renderer resetAnimationTime:2.84159265];
    [(ARCoachingAnimationView *)self calcNextAnimationSwitchTime:3 forState:a3];
    goto LABEL_18;
  }
  if (self->_lastUpdateState != 4)
  {
    [(ARCoachingRenderer *)self->_renderer resetAnimationTime:5.98318531];
    goto LABEL_20;
  }
  double v13 = a3 + 0.5;
  uint64_t v12 = 1;
  uint64_t v14 = 4;
LABEL_21:
  self->_double nextStateTime = v13;
  int32x4_t v15 = [(ARCoachingRenderer *)self->_renderer state];
  [v15 setIsVertical:v12];

  id v16 = [(ARCoachingRenderer *)self->_renderer state];
  [v16 setSnapState:v14];
}

- (void)updateVerticalClamp:(double)a3
{
  if (self->_animationState == 3)
  {
    double v5 = [(ARCoachingRenderer *)self->_renderer state];
    uint64_t v6 = [v5 snapState];

    if (v6 != 3)
    {
      double nextStateTime = self->_nextStateTime;
      if (nextStateTime < 0.0)
      {
        uint64_t v8 = [(ARCoachingRenderer *)self->_renderer state];
        uint64_t v9 = [v8 snapState];

        double nextStateTime = a3 + 0.5;
        if (v9 != 4) {
          double nextStateTime = a3;
        }
        self->_double nextStateTime = nextStateTime;
      }
      if (nextStateTime <= a3)
      {
        id v10 = [(ARCoachingRenderer *)self->_renderer state];
        [v10 setSnapState:3];
      }
    }
  }
}

- (void)resizeForDrawable:(id)a3
{
}

- (void)updateForCurrentTime:(double)a3 timeDelta:(double)a4
{
  self->_lastUpdateState = self->_animationState;
}

- (void)drawInDrawable:(id)a3 withCommandBuffer:(id)a4 timeDelta:(double)a5
{
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ARCoachingAnimationView;
  [(ARCoachingAnimationView *)&v3 layoutSubviews];
  [(ARCoachingAnimationView *)self updateMetalLayer];
}

- (void)updateMetalLayer
{
  if (self->_metalLayer)
  {
    double v3 = ARCoachingLayoutScalar();
    [(ARCoachingAnimationView *)self intrinsicContentSize];
    -[CAMetalLayer setBounds:](self->_metalLayer, "setBounds:", 0.0, 0.0, v4, v5);
    [(CAMetalLayer *)self->_metalLayer bounds];
    double v7 = v6;
    uint64_t v8 = [MEMORY[0x263F1C920] mainScreen];
    [v8 scale];
    double v10 = v7 * v9;
    [(CAMetalLayer *)self->_metalLayer bounds];
    double v12 = v11;
    double v13 = [MEMORY[0x263F1C920] mainScreen];
    [v13 scale];
    -[CAMetalLayer setDrawableSize:](self->_metalLayer, "setDrawableSize:", v10, v12 * v14);

    [(ARCoachingAnimationView *)self bounds];
    double v16 = v15;
    [(ARCoachingAnimationView *)self bounds];
    double v18 = v16 + v17 * 0.5;
    [(ARCoachingAnimationView *)self bounds];
    double v20 = v19;
    [(ARCoachingAnimationView *)self bounds];
    double v22 = v20 + v21 * 0.5;
    [(CAMetalLayer *)self->_metalLayer bounds];
    double v24 = v3 * 230.0 - v23 * 0.5;
    if (self->_currentCoachingGoal == 4) {
      double v24 = v24 + 85.0;
    }
    metalLayer = self->_metalLayer;
    -[CAMetalLayer setPosition:](metalLayer, "setPosition:", v18, v22 + v24);
  }
}

- (int64_t)animationState
{
  return self->_animationState;
}

- (BOOL)isDeactivating
{
  return self->_isDeactivating;
}

- (void)setIsDeactivating:(BOOL)a3
{
  self->_isDeactivating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_updateManager, 0);

  objc_storeStrong((id *)&self->_metalLayer, 0);
}

@end