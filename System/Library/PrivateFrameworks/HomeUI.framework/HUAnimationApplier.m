@interface HUAnimationApplier
+ (id)_applierWithAnimationSettings:(id)a3 applyDynamically:(BOOL)a4;
+ (id)_applyAnimationSettings:(id)a3 withApplier:(id)a4 completion:(id)a5 applyDynamically:(BOOL)a6;
+ (id)applyAnimationSettings:(id)a3 withDynamicApplier:(id)a4 completion:(id)a5;
+ (id)applyAnimationSettings:(id)a3 withStaticApplier:(id)a4 completion:(id)a5;
+ (id)dynamicApplierWithAnimationSettings:(id)a3;
+ (id)staticApplierWithAnimationSettings:(id)a3;
- (BOOL)addAlongsideAnimationApplier:(id)a3 relativeStart:(double)a4 relativeDuration:(double)a5;
- (BOOL)applyDynamically;
- (BOOL)cancel;
- (BOOL)complete:(BOOL)a3;
- (BOOL)notifyUponEffectiveProgress:(double)a3 withBlock:(id)a4;
- (BOOL)start;
- (CADisplayLink)displayLink;
- (HUAnimationApplier)init;
- (HUAnimationApplier)initWithAnimationSettings:(id)a3;
- (HUAnimationSettings)animationSettings;
- (NSMutableSet)effectiveProgressObservers;
- (NSMutableSet)relativeAnimations;
- (double)_effectiveDuration;
- (double)_remainingTimeIntervalForEffectiveProgress:(double)a3;
- (double)effectiveProgress;
- (double)startTime;
- (void)_displayLinkTick;
- (void)_invalidateDisplayLinkIfNecessary;
- (void)_startEffectiveProgressTimerForObserver:(id)a3;
- (void)_updateDynamicProgress:(double)a3;
- (void)setAnimationSettings:(id)a3;
- (void)setApplyDynamically:(BOOL)a3;
- (void)setDisplayLink:(id)a3;
- (void)setStartTime:(double)a3;
@end

@implementation HUAnimationApplier

+ (id)applyAnimationSettings:(id)a3 withStaticApplier:(id)a4 completion:(id)a5
{
  return (id)[a1 _applyAnimationSettings:a3 withApplier:a4 completion:a5 applyDynamically:0];
}

+ (id)applyAnimationSettings:(id)a3 withDynamicApplier:(id)a4 completion:(id)a5
{
  return (id)[a1 _applyAnimationSettings:a3 withApplier:a4 completion:a5 applyDynamically:1];
}

+ (id)_applyAnimationSettings:(id)a3 withApplier:(id)a4 completion:(id)a5 applyDynamically:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [a1 _applierWithAnimationSettings:v10 applyDynamically:v6];
  +[HUApplier registerStandaloneApplier:v13];
  objc_initWeak(&location, v13);
  [v13 addApplierBlock:v11];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__HUAnimationApplier__applyAnimationSettings_withApplier_completion_applyDynamically___block_invoke;
  v16[3] = &unk_1E63854D0;
  id v14 = v12;
  id v17 = v14;
  objc_copyWeak(&v18, &location);
  [v13 addCompletionBlock:v16];
  [v13 start];
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);

  return v13;
}

void __86__HUAnimationApplier__applyAnimationSettings_withApplier_completion_applyDynamically___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[HUApplier unregisterStandaloneApplier:WeakRetained];
}

+ (id)dynamicApplierWithAnimationSettings:(id)a3
{
  return (id)[a1 _applierWithAnimationSettings:a3 applyDynamically:1];
}

+ (id)staticApplierWithAnimationSettings:(id)a3
{
  return (id)[a1 _applierWithAnimationSettings:a3 applyDynamically:0];
}

+ (id)_applierWithAnimationSettings:(id)a3 applyDynamically:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithAnimationSettings:v6];

  [v7 setApplyDynamically:v4];

  return v7;
}

- (HUAnimationApplier)initWithAnimationSettings:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HUAnimationApplier.m", 139, @"Invalid parameter not satisfying: %@", @"settings" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)HUAnimationApplier;
  id v6 = [(HUApplier *)&v15 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    animationSettings = v6->_animationSettings;
    v6->_animationSettings = (HUAnimationSettings *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    relativeAnimations = v6->_relativeAnimations;
    v6->_relativeAnimations = (NSMutableSet *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    effectiveProgressObservers = v6->_effectiveProgressObservers;
    v6->_effectiveProgressObservers = (NSMutableSet *)v11;
  }
  return v6;
}

- (HUAnimationApplier)init
{
  return 0;
}

- (HUAnimationSettings)animationSettings
{
  uint64_t v2 = (void *)[(HUAnimationSettings *)self->_animationSettings copy];

  return (HUAnimationSettings *)v2;
}

- (double)effectiveProgress
{
  if ([(HUApplier *)self state] == 1)
  {
    double v3 = CACurrentMediaTime();
    [(HUAnimationApplier *)self startTime];
    double v5 = v3 - v4;
    [(HUAnimationApplier *)self _effectiveDuration];
    return v5 / v6;
  }
  else
  {
    [(HUApplier *)self progress];
  }
  return result;
}

- (double)_effectiveDuration
{
  uint64_t v2 = [(HUAnimationApplier *)self animationSettings];
  [v2 durationWithSpeed];
  double v4 = v3;
  UIAnimationDragCoefficient();
  double v6 = v4 * v5;

  return v6;
}

- (BOOL)addAlongsideAnimationApplier:(id)a3 relativeStart:(double)a4 relativeDuration:(double)a5
{
  id v8 = a3;
  if (-[HUApplier state](self, "state") || [v8 state])
  {
    BOOL v9 = 0;
  }
  else
  {
    BOOL v9 = 0;
    if (a4 >= 0.0 && a4 + a5 <= 1.0)
    {
      uint64_t v11 = [(HUAnimationApplier *)self relativeAnimations];
      id v12 = [[HURelativeAnimation alloc] initWithAnimationApplier:v8 relativeStart:a4 relativeDuration:a5];
      [v11 addObject:v12];

      BOOL v9 = 1;
    }
  }

  return v9;
}

- (double)_remainingTimeIntervalForEffectiveProgress:(double)a3
{
  [(HUAnimationApplier *)self effectiveProgress];
  double v6 = v5;
  double result = 0.0;
  if (v6 < a3)
  {
    double v8 = a3 - v6;
    [(HUAnimationApplier *)self _effectiveDuration];
    return v8 * v9;
  }
  return result;
}

- (BOOL)notifyUponEffectiveProgress:(double)a3 withBlock:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HUAnimationApplier.m", 200, @"Invalid parameter not satisfying: %@", @"notifyBlock" object file lineNumber description];
  }
  unint64_t v8 = [(HUApplier *)self state];
  if (v8 != 2)
  {
    double v9 = [[HUEffectiveProgressObserver alloc] initWithTargetEffectiveProgress:v7 observerBlock:a3];
    id v10 = [(HUAnimationApplier *)self effectiveProgressObservers];
    [v10 addObject:v9];

    if ([(HUApplier *)self state] == 1 || [(HUApplier *)self state] == 3) {
      [(HUAnimationApplier *)self _startEffectiveProgressTimerForObserver:v9];
    }
  }
  return v8 != 2;
}

- (void)_startEffectiveProgressTimerForObserver:(id)a3
{
  id v4 = a3;
  [v4 targetEffectiveProgress];
  -[HUAnimationApplier _remainingTimeIntervalForEffectiveProgress:](self, "_remainingTimeIntervalForEffectiveProgress:");
  double v6 = v5;
  if (v5 <= 0.00000011920929)
  {
    id v10 = [v4 observerBlock];
    v10[2]();

    uint64_t v11 = [(HUAnimationApplier *)self effectiveProgressObservers];
    [v11 removeObject:v4];
  }
  else
  {
    objc_initWeak(&location, self);
    id v7 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__HUAnimationApplier__startEffectiveProgressTimerForObserver___block_invoke;
    v12[3] = &unk_1E63882F0;
    objc_copyWeak(&v14, &location);
    id v8 = v4;
    id v13 = v8;
    double v9 = [v7 afterDelay:v12 performBlock:v6];

    [v8 setTimerCancellationToken:v9];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __62__HUAnimationApplier__startEffectiveProgressTimerForObserver___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = [*(id *)(a1 + 32) observerBlock];
    v2[2]();

    double v3 = [WeakRetained effectiveProgressObservers];
    [v3 removeObject:*(void *)(a1 + 32)];
  }
}

- (BOOL)start
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v56.receiver = self;
  v56.super_class = (Class)HUAnimationApplier;
  BOOL v3 = [(HUApplier *)&v56 start];
  if (v3)
  {
    [(HUAnimationApplier *)self setStartTime:CACurrentMediaTime()];
    if ([(HUAnimationApplier *)self applyDynamically])
    {
      [(HUAnimationApplier *)self _effectiveDuration];
      if (v4 >= 0.00000011920929)
      {
        id v13 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__displayLinkTick];
        [(HUAnimationApplier *)self setDisplayLink:v13];

        id v14 = [(HUAnimationApplier *)self displayLink];
        objc_super v15 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
        [v14 addToRunLoop:v15 forMode:*MEMORY[0x1E4F1C4B0]];

        v16 = [(HUAnimationApplier *)self displayLink];
        CAFrameRateRange v60 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
        objc_msgSend(v16, "setPreferredFrameRateRange:", *(double *)&v60.minimum, *(double *)&v60.maximum, *(double *)&v60.preferred);

        id v17 = [(HUAnimationApplier *)self displayLink];
        [v17 setHighFrameRateReason:1769473];

        [(HUAnimationApplier *)self _displayLinkTick];
      }
      else
      {
        [(HUAnimationApplier *)self _updateDynamicProgress:1.0];
      }
    }
    else
    {
      double v5 = (void *)MEMORY[0x1E4F42FF0];
      double v6 = [(HUAnimationApplier *)self animationSettings];
      [v6 duration];
      double v8 = v7;
      double v9 = [(HUAnimationApplier *)self animationSettings];
      [v9 delay];
      double v11 = v10;
      id v12 = [(HUAnimationApplier *)self animationSettings];
      v54[4] = self;
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __27__HUAnimationApplier_start__block_invoke;
      v55[3] = &unk_1E6386018;
      v55[4] = self;
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __27__HUAnimationApplier_start__block_invoke_3;
      v54[3] = &unk_1E6386730;
      [v5 _animateWithDuration:393798 delay:v12 options:v55 factory:v54 animations:v8 completion:v11];
    }
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v18 = [(HUAnimationApplier *)self relativeAnimations];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v51 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          v24 = [v23 applier];
          v25 = [v24 animationSettings];

          [v23 relativeStart];
          double v27 = v26;
          v28 = [(HUAnimationApplier *)self animationSettings];
          [v28 durationWithSpeed];
          [v25 setDelay:v27 * v29];

          [v23 relativeDuration];
          double v31 = v30;
          v32 = [(HUAnimationApplier *)self animationSettings];
          [v32 durationWithSpeed];
          double v34 = v31 * v33;

          [v25 durationWithSpeed];
          double v36 = v35 / v34;
          [v25 speed];
          [v25 setSpeed:v37 * v36];
          v38 = [v23 applier];
          [v38 setAnimationSettings:v25];

          v39 = [v23 applier];
          [v39 start];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v50 objects:v58 count:16];
      }
      while (v20);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v40 = [(HUAnimationApplier *)self effectiveProgressObservers];
    uint64_t v41 = [v40 countByEnumeratingWithState:&v46 objects:v57 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v47 != v43) {
            objc_enumerationMutation(v40);
          }
          [(HUAnimationApplier *)self _startEffectiveProgressTimerForObserver:*(void *)(*((void *)&v46 + 1) + 8 * j)];
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v46 objects:v57 count:16];
      }
      while (v42);
    }
  }
  return v3;
}

uint64_t __27__HUAnimationApplier_start__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__HUAnimationApplier_start__block_invoke_2;
  v4[3] = &unk_1E6386018;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769473, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __27__HUAnimationApplier_start__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateProgress:1.0];
}

uint64_t __27__HUAnimationApplier_start__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) complete:1];
}

- (void)_updateDynamicProgress:(double)a3
{
  double v4 = fmin(fmax(a3, 0.0), 1.0);
  if (v4 + -1.0 >= -0.00000011920929)
  {
    [(HUApplier *)self updateProgress:1.0];
    [(HUAnimationApplier *)self complete:1];
  }
  else
  {
    CAFrameRateRange v5 = [(HUAnimationApplier *)self animationSettings];
    [v5 interpolatedProgressForProgress:v4];
    double v7 = v6;

    [(HUApplier *)self updateProgress:v7];
  }
}

- (void)_displayLinkTick
{
  double v3 = CACurrentMediaTime();
  [(HUAnimationApplier *)self startTime];
  double v5 = v3 - v4;
  double v6 = [(HUAnimationApplier *)self animationSettings];
  [v6 delay];
  double v8 = v5 - v7;

  if (v8 >= 0.0)
  {
    [(HUAnimationApplier *)self _effectiveDuration];
    double v10 = v8 / v9;
    [(HUAnimationApplier *)self _updateDynamicProgress:v10];
  }
}

- (void)_invalidateDisplayLinkIfNecessary
{
  double v3 = [(HUAnimationApplier *)self displayLink];
  [v3 invalidate];

  [(HUAnimationApplier *)self setDisplayLink:0];
}

- (BOOL)cancel
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)HUAnimationApplier;
  BOOL v3 = [(HUApplier *)&v25 cancel];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v4 = [(HUAnimationApplier *)self relativeAnimations];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = [*(id *)(*((void *)&v21 + 1) + 8 * v8) applier];
        [v9 cancel];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v6);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v10 = [(HUAnimationApplier *)self effectiveProgressObservers];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_super v15 = [*(id *)(*((void *)&v17 + 1) + 8 * v14) timerCancellationToken];
        [v15 cancel];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v26 count:16];
    }
    while (v12);
  }

  return v3;
}

- (BOOL)complete:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUAnimationApplier;
  BOOL v4 = [(HUApplier *)&v6 complete:a3];
  if (v4) {
    [(HUAnimationApplier *)self _invalidateDisplayLinkIfNecessary];
  }
  return v4;
}

- (void)setAnimationSettings:(id)a3
{
}

- (BOOL)applyDynamically
{
  return self->_applyDynamically;
}

- (void)setApplyDynamically:(BOOL)a3
{
  self->_applyDynamically = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (NSMutableSet)relativeAnimations
{
  return self->_relativeAnimations;
}

- (NSMutableSet)effectiveProgressObservers
{
  return self->_effectiveProgressObservers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveProgressObservers, 0);
  objc_storeStrong((id *)&self->_relativeAnimations, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);

  objc_storeStrong((id *)&self->_animationSettings, 0);
}

@end