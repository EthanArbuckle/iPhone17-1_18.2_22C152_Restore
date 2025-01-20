@interface HUDynamicStateAnimationApplier
- (BOOL)hasUpdatedProgress;
- (BOOL)start;
- (HUAnimationSettings)animationSettings;
- (HUDynamicStateAnimationApplier)initWithAnimationSettings:(id)a3 initialProgress:(double)a4 progressInputBlock:(id)a5;
- (double)effectiveInputProgressForBlock:(id)a3;
- (double)initialProgress;
- (double)lastTargetChangeTime;
- (double)preInterpolatedProgress;
- (double)targetProgress;
- (void)setHasUpdatedProgress:(BOOL)a3;
- (void)setInitialProgress:(double)a3;
- (void)setLastTargetChangeTime:(double)a3;
- (void)setPreInterpolatedProgress:(double)a3;
- (void)setTargetProgress:(double)a3;
- (void)updateProgress:(double)a3;
@end

@implementation HUDynamicStateAnimationApplier

- (HUDynamicStateAnimationApplier)initWithAnimationSettings:(id)a3 initialProgress:(double)a4 progressInputBlock:(id)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUDynamicStateAnimationApplier;
  v9 = [(HUDisplayLinkApplier *)&v13 initWithProgressInputBlock:a5];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    animationSettings = v9->_animationSettings;
    v9->_animationSettings = (HUAnimationSettings *)v10;

    v9->_initialProgress = a4;
  }

  return v9;
}

- (HUAnimationSettings)animationSettings
{
  v2 = (void *)[(HUAnimationSettings *)self->_animationSettings copy];

  return (HUAnimationSettings *)v2;
}

- (BOOL)start
{
  v5.receiver = self;
  v5.super_class = (Class)HUDynamicStateAnimationApplier;
  BOOL v3 = [(HUDisplayLinkApplier *)&v5 start];
  if (v3) {
    [(HUDynamicStateAnimationApplier *)self setLastTargetChangeTime:CACurrentMediaTime()];
  }
  return v3;
}

- (void)updateProgress:(double)a3
{
  [(HUDynamicStateAnimationApplier *)self setHasUpdatedProgress:1];
  v5.receiver = self;
  v5.super_class = (Class)HUDynamicStateAnimationApplier;
  [(HUApplier *)&v5 updateProgress:a3];
}

- (double)effectiveInputProgressForBlock:(id)a3
{
  double v4 = (*((double (**)(id, SEL))a3 + 2))(a3, a2);
  if ([(HUDynamicStateAnimationApplier *)self hasUpdatedProgress])
  {
    [(HUDynamicStateAnimationApplier *)self targetProgress];
    if (vabdd_f64(v5, v4) > 0.00000011920929)
    {
      [(HUDynamicStateAnimationApplier *)self preInterpolatedProgress];
      -[HUDynamicStateAnimationApplier setInitialProgress:](self, "setInitialProgress:");
      [(HUDynamicStateAnimationApplier *)self setTargetProgress:v4];
      [(HUDynamicStateAnimationApplier *)self setLastTargetChangeTime:CACurrentMediaTime()];
    }
    [(HUDynamicStateAnimationApplier *)self initialProgress];
    double v7 = vabdd_f64(v4, v6);
    if (v7 >= 0.001)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __65__HUDynamicStateAnimationApplier_effectiveInputProgressForBlock___block_invoke;
      v19[3] = &unk_1E6389C80;
      v19[4] = self;
      *(double *)&v19[5] = v4;
      id v8 = (void (**)(void, double))_Block_copy(v19);
      v9 = [(HUDynamicStateAnimationApplier *)self animationSettings];
      [v9 durationWithSpeed];
      double v11 = v7 * v10;

      double v12 = CACurrentMediaTime();
      [(HUDynamicStateAnimationApplier *)self lastTargetChangeTime];
      double v14 = (v12 - v13) / v11;
      v8[2](v8, v14);
      -[HUDynamicStateAnimationApplier setPreInterpolatedProgress:](self, "setPreInterpolatedProgress:");
      v15 = [(HUDynamicStateAnimationApplier *)self animationSettings];
      [v15 interpolatedProgressForProgress:v14];
      double v17 = v16;

      double v4 = ((double (*)(void, double))v8[2])(v8, v17);
    }
    return v4;
  }
  else
  {
    [(HUDynamicStateAnimationApplier *)self setTargetProgress:v4];
    [(HUDynamicStateAnimationApplier *)self initialProgress];
    -[HUDynamicStateAnimationApplier setPreInterpolatedProgress:](self, "setPreInterpolatedProgress:");
    [(HUDynamicStateAnimationApplier *)self setLastTargetChangeTime:CACurrentMediaTime()];
    [(HUDynamicStateAnimationApplier *)self initialProgress];
  }
  return result;
}

double __65__HUDynamicStateAnimationApplier_effectiveInputProgressForBlock___block_invoke(uint64_t a1, double a2)
{
  [*(id *)(a1 + 32) initialProgress];
  return v4 + (*(double *)(a1 + 40) - v4) * a2;
}

- (double)initialProgress
{
  return self->_initialProgress;
}

- (void)setInitialProgress:(double)a3
{
  self->_initialProgress = a3;
}

- (double)targetProgress
{
  return self->_targetProgress;
}

- (void)setTargetProgress:(double)a3
{
  self->_targetProgress = a3;
}

- (double)preInterpolatedProgress
{
  return self->_preInterpolatedProgress;
}

- (void)setPreInterpolatedProgress:(double)a3
{
  self->_preInterpolatedProgress = a3;
}

- (double)lastTargetChangeTime
{
  return self->_lastTargetChangeTime;
}

- (void)setLastTargetChangeTime:(double)a3
{
  self->_lastTargetChangeTime = a3;
}

- (BOOL)hasUpdatedProgress
{
  return self->_hasUpdatedProgress;
}

- (void)setHasUpdatedProgress:(BOOL)a3
{
  self->_hasUpdatedProgress = a3;
}

- (void).cxx_destruct
{
}

@end