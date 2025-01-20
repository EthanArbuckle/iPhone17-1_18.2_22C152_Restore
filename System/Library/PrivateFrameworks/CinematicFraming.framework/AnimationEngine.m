@interface AnimationEngine
- (AnimationEngine)initWithInitialPosition:(float)a3;
- (float)position;
- (float)velocity;
- (void)_resetAnimations;
- (void)animateWithDuration:(double)a3 toTarget:(float)a4 options:(unint64_t)a5 atTime:(id *)a6;
- (void)driveAnimationAtTime:(id *)a3 withConstraints:(AnimationEngineAnimationConstraints *)a4 withMultiplier:(float)a5;
- (void)setPosition:(float)a3;
- (void)setVelocity:(float)a3;
@end

@implementation AnimationEngine

- (AnimationEngine)initWithInitialPosition:(float)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AnimationEngine;
  v4 = [(AnimationEngine *)&v8 init];
  v5 = (AnimationEngine *)v4;
  if (v4)
  {
    *((float *)v4 + 20) = a3;
    *((_DWORD *)v4 + 21) = 0;
    uint64_t v6 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(v4 + 36) = *MEMORY[0x1E4F1F9F8];
    *(void *)(v4 + 52) = *(void *)(v6 + 16);
    [v4 _resetAnimations];
  }
  return v5;
}

- (void)animateWithDuration:(double)a3 toTarget:(float)a4 options:(unint64_t)a5 atTime:(id *)a6
{
  [(AnimationEngine *)self _resetAnimations];
  long long v11 = *(_OWORD *)&a6->var0;
  *(void *)&self->_startTime.flags = a6->var3;
  *(_OWORD *)(&self->_targetPosition + 1) = v11;
  self->_animationDuration = a3;
  self->_targetPosition = a4;
  self->_animationOptions = a5;
  *(_OWORD *)&time1.value = *(_OWORD *)((char *)&self->_startTime.epoch + 4);
  time1.epoch = *(void *)&self->_lastAnimationDriveTime.flags;
  CMTime v13 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  if (!CMTimeCompare(&time1, &v13))
  {
    long long v12 = *(_OWORD *)&a6->var0;
    *(void *)&self->_lastAnimationDriveTime.flags = a6->var3;
    *(_OWORD *)((char *)&self->_startTime.epoch + 4) = v12;
  }
}

- (void)driveAnimationAtTime:(id *)a3 withConstraints:(AnimationEngineAnimationConstraints *)a4 withMultiplier:(float)a5
{
  CMTime time = *(CMTime *)a3;
  double Seconds = CMTimeGetSeconds(&time);
  *(_OWORD *)&time.value = *(_OWORD *)((char *)&self->_startTime.epoch + 4);
  time.epoch = *(void *)&self->_lastAnimationDriveTime.flags;
  double v10 = Seconds - CMTimeGetSeconds(&time);
  if (v10 <= 0.1) {
    double v11 = v10;
  }
  else {
    double v11 = 0.1;
  }
  if (fabs(v11) >= 0.0001)
  {
    CMTime time = *(CMTime *)(&self->_targetPosition + 1);
    CMTime v22 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    if (CMTimeCompare(&time, &v22))
    {
      if ((self->_animationOptions & 6) != 0)
      {
        double v12 = self->_animationDuration - v11;
        if (v12 < 0.00100000005) {
          double v12 = 0.00100000005;
        }
        float v13 = (float)(self->_targetPosition - self->_position) / v12 * a5;
        float v14 = (float)(v13 - self->_velocity) / v11;
      }
      else
      {
        float v14 = 0.0;
      }
      float v15 = self->_velocity + ApplyMotionConstraints(v14, a4->var0.var0, a4->var0.var1) * v11;
      float v16 = ApplyMotionConstraints(v15, a4->var1.var0, a4->var1.var1);
      float position = self->_position;
      float v18 = position + v16 * v11;
      self->_float position = v18;
      float v19 = ApplyMotionConstraints(v18, a4->var2.var0, a4->var2.var1);
      float v20 = (float)(v19 - position) / v11;
      self->_float position = v19;
      self->_velocity = v20;
    }
    long long v21 = *(_OWORD *)&a3->var0;
    *(void *)&self->_lastAnimationDriveTime.flags = a3->var3;
    *(_OWORD *)((char *)&self->_startTime.epoch + 4) = v21;
  }
}

- (void)_resetAnimations
{
  uint64_t v2 = MEMORY[0x1E4F1F9F8];
  *(_OWORD *)(&self->_targetPosition + 1) = *MEMORY[0x1E4F1F9F8];
  *(void *)&self->_startTime.flags = *(void *)(v2 + 16);
  self->_animationDuration = 0.0;
}

- (float)position
{
  return self->_position;
}

- (void)setPosition:(float)a3
{
  self->_float position = a3;
}

- (float)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(float)a3
{
  self->_velocity = a3;
}

@end