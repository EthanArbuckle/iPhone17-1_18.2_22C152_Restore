@interface VCCameraAnimator
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- (BOOL)animating;
- (VCCamera)animatedCamera;
- (VCCamera)targetCamera;
- (VCCameraAnimator)init;
- (float)duration;
- (id).cxx_construct;
- (void)configureWithPreset:(unint64_t)a3;
- (void)interrupt;
- (void)reset;
- (void)startAtTime:(id *)a3 withCamera:(id)a4;
- (void)stop;
- (void)updateToTime:(id *)a3;
@end

@implementation VCCameraAnimator

- (BOOL)animating
{
  return self->_animation.duration > 0.0;
}

- (float)duration
{
  return self->_animation.duration;
}

- (VCCameraAnimator)init
{
  v4.receiver = self;
  v4.super_class = (Class)VCCameraAnimator;
  v2 = [(VCCameraAnimator *)&v4 init];
  [(VCCameraAnimator *)v2 configureWithPreset:0];
  [(VCCameraAnimator *)v2 reset];
  return v2;
}

- (void)startAtTime:(id *)a3 withCamera:(id)a4
{
  id v7 = a4;
  objc_storeStrong((id *)&self->_targetCamera, a4);
  v8 = (VCCamera *)[v7 copy];
  animatedCamera = self->_animatedCamera;
  self->_animatedCamera = v8;

  long long v10 = *(_OWORD *)&a3->var0;
  self->_currentTime.epoch = a3->var3;
  *(_OWORD *)&self->_currentTime.value = v10;
  id v22 = v7;
  [v22 rotation];
  self->_animation.targetValue.arr[0] = v11;
  [v22 rotation];
  self->_animation.targetValue.arr[1] = v12;
  [v22 rotation];
  self->_animation.targetValue.arr[2] = v13;
  [v22 focalLength];
  float32x2_t v15 = v14;
  [v22 sensorSize];
  self->_animation.targetValue.arr[3] = vdiv_f32(v15, v16).f32[0];
  [v22 focalLength];
  float32x2_t v18 = v17;
  [v22 sensorSize];
  self->_animation.targetValue.arr[4] = COERCE_FLOAT(vdiv_f32(v18, v19).i32[1]);
  [v22 zoomFactor];
  self->_animation.targetValue.arr[5] = v20;

  long long v21 = *(_OWORD *)&self->_animation.targetValue.arr[2];
  *(_OWORD *)self->_animation.currValue.arr = *(_OWORD *)self->_animation.targetValue.arr;
  *(_OWORD *)&self->_animation.currValue.arr[2] = v21;
  *(_OWORD *)&self->_animation.currValue.arr[4] = *(_OWORD *)&self->_animation.targetValue.arr[4];
  *(_OWORD *)self->_animation.velocity.arr = 0u;
  *(_OWORD *)&self->_animation.velocity.arr[2] = 0u;
  *(_OWORD *)&self->_animation.velocity.arr[4] = 0u;
  self->_animation.duration = 0.0;
}

- (void)updateToTime:(id *)a3
{
  if (self->_currentTime.flags)
  {
    p_currentTime = (CMTime *)&self->_currentTime;
    CMTime time = *(CMTime *)a3;
    double Seconds = CMTimeGetSeconds(&time);
    CMTime v31 = *p_currentTime;
    float v7 = Seconds - CMTimeGetSeconds(&v31);
    if (v7 > 0.0)
    {
      v8 = self->_targetCamera;
      [(VCCamera *)v8 rotation];
      self->_animation.targetValue.arr[0] = v9;
      [(VCCamera *)v8 rotation];
      self->_animation.targetValue.arr[1] = v10;
      [(VCCamera *)v8 rotation];
      self->_animation.targetValue.arr[2] = v11;
      [(VCCamera *)v8 focalLength];
      float32x2_t v13 = v12;
      [(VCCamera *)v8 sensorSize];
      self->_animation.targetValue.arr[3] = vdiv_f32(v13, v14).f32[0];
      [(VCCamera *)v8 focalLength];
      float32x2_t v16 = v15;
      [(VCCamera *)v8 sensorSize];
      self->_animation.targetValue.arr[4] = COERCE_FLOAT(vdiv_f32(v16, v17).i32[1]);
      [(VCCamera *)v8 zoomFactor];
      self->_animation.targetValue.arr[5] = v18;

      SpringAnimation<double,6ul>::update((uint64_t)&self->_animation, v7, v19, v20, v21);
      id v22 = self->_animatedCamera;
      [(VCCamera *)v22 setRotation:COERCE_DOUBLE(vcvt_f32_f64(*(float64x2_t *)self->_animation.currValue.arr))];
      double v30 = self->_animation.currValue.arr[3];
      [(VCCamera *)v22 sensorSize];
      unsigned int v29 = v23;
      double v28 = self->_animation.currValue.arr[4];
      [(VCCamera *)v22 sensorSize];
      v25.f64[0] = v30;
      v25.f64[1] = v28;
      [(VCCamera *)v22 setFocalLength:COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(v25, vcvtq_f64_f32((float32x2_t)__PAIR64__(v24, v29)))))];
      double v26 = self->_animation.currValue.arr[5];
      *(float *)&double v26 = v26;
      [(VCCamera *)v22 setZoomFactor:v26];

      long long v27 = *(_OWORD *)&a3->var0;
      p_currentTime->epoch = a3->var3;
      *(_OWORD *)&p_currentTime->value = v27;
    }
  }
}

- (void)reset
{
  targetCamera = self->_targetCamera;
  self->_targetCamera = 0;

  animatedCamera = self->_animatedCamera;
  self->_animatedCamera = 0;

  self->_currentTime = *($95D729B680665BEAEFA1D6FCA8238556 *)*(void *)&MEMORY[0x1E4F1F9F8];
  long long v5 = *(_OWORD *)&self->_animation.targetValue.arr[2];
  *(_OWORD *)self->_animation.currValue.arr = *(_OWORD *)self->_animation.targetValue.arr;
  *(_OWORD *)&self->_animation.currValue.arr[2] = v5;
  *(_OWORD *)&self->_animation.currValue.arr[4] = *(_OWORD *)&self->_animation.targetValue.arr[4];
  *(_OWORD *)self->_animation.velocity.arr = 0u;
  *(_OWORD *)&self->_animation.velocity.arr[2] = 0u;
  *(_OWORD *)&self->_animation.velocity.arr[4] = 0u;
  self->_animation.duration = 0.0;
}

- (void)interrupt
{
  v3 = self->_targetCamera;
  [(VCCamera *)v3 setRotation:COERCE_DOUBLE(vcvt_f32_f64(*(float64x2_t *)self->_animation.currValue.arr))];
  double v17 = self->_animation.currValue.arr[3];
  [(VCCamera *)v3 sensorSize];
  unsigned int v15 = v4;
  double v13 = self->_animation.currValue.arr[4];
  [(VCCamera *)v3 sensorSize];
  v6.f64[0] = v17;
  v6.f64[1] = v13;
  [(VCCamera *)v3 setFocalLength:COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(v6, vcvtq_f64_f32((float32x2_t)__PAIR64__(v5, v15)))))];
  double v7 = self->_animation.currValue.arr[5];
  *(float *)&double v7 = v7;
  [(VCCamera *)v3 setZoomFactor:v7];

  v8 = self->_animatedCamera;
  [(VCCamera *)v8 setRotation:COERCE_DOUBLE(vcvt_f32_f64(*(float64x2_t *)self->_animation.currValue.arr))];
  double v18 = self->_animation.currValue.arr[3];
  [(VCCamera *)v8 sensorSize];
  unsigned int v16 = v9;
  double v14 = self->_animation.currValue.arr[4];
  [(VCCamera *)v8 sensorSize];
  v11.f64[0] = v18;
  v11.f64[1] = v14;
  [(VCCamera *)v8 setFocalLength:COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(v11, vcvtq_f64_f32((float32x2_t)__PAIR64__(v10, v16)))))];
  double v12 = self->_animation.currValue.arr[5];
  *(float *)&double v12 = v12;
  [(VCCamera *)v8 setZoomFactor:v12];

  self->_animation.duration = 0.0;
}

- (void)stop
{
  v3 = self->_targetCamera;
  [(VCCamera *)v3 setRotation:COERCE_DOUBLE(vcvt_f32_f64(*(float64x2_t *)self->_animation.currValue.arr))];
  double v17 = self->_animation.currValue.arr[3];
  [(VCCamera *)v3 sensorSize];
  unsigned int v15 = v4;
  double v13 = self->_animation.currValue.arr[4];
  [(VCCamera *)v3 sensorSize];
  v6.f64[0] = v17;
  v6.f64[1] = v13;
  [(VCCamera *)v3 setFocalLength:COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(v6, vcvtq_f64_f32((float32x2_t)__PAIR64__(v5, v15)))))];
  double v7 = self->_animation.currValue.arr[5];
  *(float *)&double v7 = v7;
  [(VCCamera *)v3 setZoomFactor:v7];

  v8 = self->_animatedCamera;
  [(VCCamera *)v8 setRotation:COERCE_DOUBLE(vcvt_f32_f64(*(float64x2_t *)self->_animation.currValue.arr))];
  double v18 = self->_animation.currValue.arr[3];
  [(VCCamera *)v8 sensorSize];
  unsigned int v16 = v9;
  double v14 = self->_animation.currValue.arr[4];
  [(VCCamera *)v8 sensorSize];
  v11.f64[0] = v18;
  v11.f64[1] = v14;
  [(VCCamera *)v8 setFocalLength:COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(v11, vcvtq_f64_f32((float32x2_t)__PAIR64__(v10, v16)))))];
  double v12 = self->_animation.currValue.arr[5];
  *(float *)&double v12 = v12;
  [(VCCamera *)v8 setZoomFactor:v12];

  self->_animation.duration = 0.0;
  *(_OWORD *)self->_animation.velocity.arr = 0u;
  *(_OWORD *)&self->_animation.velocity.arr[2] = 0u;
  *(_OWORD *)&self->_animation.velocity.arr[4] = 0u;
}

- (VCCamera)targetCamera
{
  return self->_targetCamera;
}

- (VCCamera)animatedCamera
{
  return self->_animatedCamera;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 200);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedCamera, 0);

  objc_storeStrong((id *)&self->_targetCamera, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

- (void)configureWithPreset:(unint64_t)a3
{
  if (a3 <= 2)
  {
    double v3 = dbl_1DD5AD470[a3];
    *(void *)&self->_animation.stiffness = qword_1DD5AD458[a3];
    self->_animation.mass = v3;
    self->_animation.dampRatio = 1.0;
  }
}

@end