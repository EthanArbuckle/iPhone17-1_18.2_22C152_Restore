@interface ARCoachingMotionTracker
- (ARCoachingMotionTracker)init;
- (BOOL)didStartMoving;
- (BOOL)didStopMoving;
- (BOOL)isMoving;
- (double)calcAverageVelocity;
- (void)clear;
- (void)setIsMoving:(BOOL)a3;
- (void)updateWithFrame:(id)a3;
@end

@implementation ARCoachingMotionTracker

- (ARCoachingMotionTracker)init
{
  v5.receiver = self;
  v5.super_class = (Class)ARCoachingMotionTracker;
  v2 = [(ARCoachingMotionTracker *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ARCoachingMotionTracker *)v2 clear];
  }
  return v3;
}

- (BOOL)didStartMoving
{
  return self->_isMoving && !self->_wasMoving;
}

- (BOOL)didStopMoving
{
  return !self->_isMoving && self->_wasMoving;
}

- (double)calcAverageVelocity
{
  float32x4_t v1 = 0uLL;
  for (uint64_t i = 16; i != 96; i += 16)
    float32x4_t v1 = vaddq_f32(v1, *(float32x4_t *)(a1 + i));
  __asm { FMOV            V1.4S, #5.0 }
  *(void *)&double result = vdivq_f32(v1, _Q1).u64[0];
  return result;
}

- (void)updateWithFrame:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    v6 = [v4 camera];
    [v6 transform];
    float32x4_t v24 = v7;

    [v5 timestamp];
    double v9 = lastTime;
    int velocityIndex = self->_velocityIndex;
    if (velocityIndex < 0)
    {
      self->_lastThresholdBreakTime = lastTime;
      float32x4_t v12 = v24;
      float32x4_t v11 = v24;
    }
    else
    {
      float32x4_t v11 = *(float32x4_t *)self->_lastPosition;
      double lastTime = self->_lastTime;
      float32x4_t v12 = v24;
    }
    self->_wasMoving = self->_isMoving;
    *(float32x4_t *)self->_lastPosition = v12;
    double v13 = v9 - lastTime;
    self->_double lastTime = v9;
    *(float *)&double v13 = v13;
    int v14 = (velocityIndex + 1) % 5;
    self->_int velocityIndex = v14;
    *(float32x4_t *)&self->_velocities[16 * v14] = vdivq_f32(vsubq_f32(v12, v11), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v13, 0));
    [(ARCoachingMotionTracker *)self calcAverageVelocity];
    float32x4_t v16 = vmulq_f32(v15, v15);
    int thresholdBreakCount = self->_thresholdBreakCount;
    if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v16, 2), vaddq_f32(v16, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 1))).f32[0] <= 0.01)
    {
      if (thresholdBreakCount <= 1) {
        int thresholdBreakCount = 1;
      }
      int v18 = thresholdBreakCount - 1;
      self->_int thresholdBreakCount = v18;
    }
    else
    {
      int v18 = thresholdBreakCount + 1;
      self->_int thresholdBreakCount = v18;
      self->_lastThresholdBreakTime = v9;
    }
    if (self->_wasMoving)
    {
      if (v9 - self->_lastThresholdBreakTime > 0.5)
      {
        self->_isMoving = 0;
        self->_int thresholdBreakCount = 0;
        v19 = _ARLogCoaching_5();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = (objc_class *)objc_opt_class();
          v21 = NSStringFromClass(v20);
          *(_DWORD *)buf = 138543618;
          v26 = v21;
          __int16 v27 = 2048;
          v28 = self;
          v22 = "%{public}@ <%p>: Coaching view stopped moving";
LABEL_17:
          _os_log_impl(&dword_20B202000, v19, OS_LOG_TYPE_INFO, v22, buf, 0x16u);

          goto LABEL_18;
        }
        goto LABEL_18;
      }
      if (v18 >= 16) {
        self->_isMoving = 1;
      }
    }
    else if (v18 > 15)
    {
      self->_isMoving = 1;
      v19 = _ARLogCoaching_5();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v23 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v23);
        *(_DWORD *)buf = 138543618;
        v26 = v21;
        __int16 v27 = 2048;
        v28 = self;
        v22 = "%{public}@ <%p>: Coaching view started moving";
        goto LABEL_17;
      }
LABEL_18:
    }
  }
}

- (void)clear
{
  *(_OWORD *)&self->_velocities[48] = 0u;
  *(_OWORD *)&self->_velocities[64] = 0u;
  *(_OWORD *)&self->_velocities[16] = 0u;
  *(_OWORD *)&self->_velocities[32] = 0u;
  *(_OWORD *)self->_velocities = 0u;
  *(void *)&self->_lastPosition[8] = 0;
  self->_double lastTime = 0.0;
  *(void *)self->_lastPosition = 0;
  self->_int velocityIndex = -1;
  self->_lastThresholdBreakTime = 0.0;
  *(double *)((char *)&self->_lastThresholdBreakTime + 6) = 0.0;
}

- (BOOL)isMoving
{
  return self->_isMoving;
}

- (void)setIsMoving:(BOOL)a3
{
  self->_isMoving = a3;
}

@end