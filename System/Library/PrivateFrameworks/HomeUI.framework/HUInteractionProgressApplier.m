@interface HUInteractionProgressApplier
+ (id)applierWithInteractionProgress:(id)a3;
+ (id)applyInteractionProgress:(id)a3 withApplier:(id)a4 completion:(id)a5;
- (BOOL)_interactionProgressChangedSignificantly;
- (BOOL)boundProgressValues;
- (BOOL)cancel;
- (BOOL)complete:(BOOL)a3;
- (BOOL)completesAtTargetState;
- (BOOL)isInteractive;
- (BOOL)start;
- (BOOL)waitingOnAnimationToComplete;
- (HUAnimationApplier)inFlightAnimation;
- (HUAnimationSettings)significantProgressChangeAnimationSettings;
- (HUAnimationSettings)transitionAnimationSettings;
- (HUInteractionProgressApplier)init;
- (HUInteractionProgressApplier)initWithInteractionProgress:(id)a3;
- (UIInteractionProgress)interactionProgress;
- (double)_currentInteractionProgress;
- (double)animationFromProgress;
- (double)animationToProgress;
- (double)previousInteractionProgress;
- (void)_completeSuccessfullyIfAnimationsComplete;
- (void)_updateCurrentProgress;
- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4;
- (void)interactionProgressDidUpdate:(id)a3;
- (void)setAnimationFromProgress:(double)a3;
- (void)setAnimationToProgress:(double)a3;
- (void)setBoundProgressValues:(BOOL)a3;
- (void)setCompletesAtTargetState:(BOOL)a3;
- (void)setInFlightAnimation:(id)a3;
- (void)setPreviousInteractionProgress:(double)a3;
- (void)setSignificantProgressChangeAnimationSettings:(id)a3;
- (void)setTransitionAnimationSettings:(id)a3;
- (void)setWaitingOnAnimationToComplete:(BOOL)a3;
@end

@implementation HUInteractionProgressApplier

+ (id)applyInteractionProgress:(id)a3 withApplier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 applierWithInteractionProgress:v8];
  +[HUApplier registerStandaloneApplier:v11];
  objc_initWeak(&location, v11);
  [v11 addApplierBlock:v9];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__HUInteractionProgressApplier_applyInteractionProgress_withApplier_completion___block_invoke;
  v14[3] = &unk_1E63854D0;
  id v12 = v10;
  id v15 = v12;
  objc_copyWeak(&v16, &location);
  [v11 addCompletionBlock:v14];
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);

  return v11;
}

void __80__HUInteractionProgressApplier_applyInteractionProgress_withApplier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[HUApplier unregisterStandaloneApplier:WeakRetained];
}

+ (id)applierWithInteractionProgress:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithInteractionProgress:v4];

  return v5;
}

- (HUInteractionProgressApplier)initWithInteractionProgress:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HUInteractionProgressApplier.m", 55, @"Invalid parameter not satisfying: %@", @"progress" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)HUInteractionProgressApplier;
  v7 = [(HUApplier *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_interactionProgress, a3);
    [(HUInteractionProgressApplier *)v8 setBoundProgressValues:1];
    [(HUInteractionProgressApplier *)v8 setCompletesAtTargetState:1];
    id v9 = +[HUAnimationSettings settingsWithDuration:3 curve:0.075];
    [(HUInteractionProgressApplier *)v8 setTransitionAnimationSettings:v9];
  }
  return v8;
}

- (HUInteractionProgressApplier)init
{
  return 0;
}

- (BOOL)isInteractive
{
  return 1;
}

- (BOOL)start
{
  v7.receiver = self;
  v7.super_class = (Class)HUInteractionProgressApplier;
  BOOL v3 = [(HUApplier *)&v7 start];
  if (v3)
  {
    id v4 = [(HUInteractionProgressApplier *)self interactionProgress];
    [v4 addProgressObserver:self];

    [(HUInteractionProgressApplier *)self _currentInteractionProgress];
    if (v5 >= 1.0)
    {
      [(HUInteractionProgressApplier *)self _updateCurrentProgress];
      [(HUInteractionProgressApplier *)self _completeSuccessfullyIfAnimationsComplete];
    }
  }
  return v3;
}

- (double)_currentInteractionProgress
{
  BOOL v3 = [(HUInteractionProgressApplier *)self interactionProgress];
  [v3 percentComplete];
  double v5 = v4;

  BOOL v6 = [(HUInteractionProgressApplier *)self boundProgressValues];
  double result = fmax(fmin(v5, 1.0), 0.0);
  if (!v6) {
    return v5;
  }
  return result;
}

- (BOOL)_interactionProgressChangedSignificantly
{
  [(HUInteractionProgressApplier *)self _currentInteractionProgress];
  double v4 = v3;
  [(HUInteractionProgressApplier *)self previousInteractionProgress];
  return vabdd_f64(v4, v5) > 0.6;
}

- (void)_updateCurrentProgress
{
  double v3 = [(HUInteractionProgressApplier *)self transitionAnimationSettings];
  uint64_t v4 = [(HUInteractionProgressApplier *)self significantProgressChangeAnimationSettings];
  if (v4)
  {
    double v5 = (void *)v4;
    BOOL v6 = [(HUInteractionProgressApplier *)self _interactionProgressChangedSignificantly];

    if (v6)
    {
      uint64_t v7 = [(HUInteractionProgressApplier *)self significantProgressChangeAnimationSettings];

      double v3 = (void *)v7;
    }
  }
  if (v3)
  {
    [(HUInteractionProgressApplier *)self animationFromProgress];
    double v9 = v8;
    [(HUInteractionProgressApplier *)self animationToProgress];
    double v11 = v10;
    [(HUInteractionProgressApplier *)self animationFromProgress];
    double v13 = v11 - v12;
    v14 = [(HUInteractionProgressApplier *)self inFlightAnimation];
    [v14 progress];
    double v16 = v9 + v13 * v15;

    v17 = [(HUInteractionProgressApplier *)self inFlightAnimation];
    [v17 cancel];

    [(HUInteractionProgressApplier *)self setAnimationFromProgress:v16];
    [(HUInteractionProgressApplier *)self _currentInteractionProgress];
    -[HUInteractionProgressApplier setAnimationToProgress:](self, "setAnimationToProgress:");
    v18 = +[HUAnimationApplier dynamicApplierWithAnimationSettings:v3];
    [(HUInteractionProgressApplier *)self setInFlightAnimation:v18];

    objc_initWeak(&location, self);
    v19 = [(HUInteractionProgressApplier *)self inFlightAnimation];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __54__HUInteractionProgressApplier__updateCurrentProgress__block_invoke;
    v25[3] = &unk_1E63854F8;
    objc_copyWeak(&v26, &location);
    [v19 addApplierBlock:v25];

    v20 = [(HUInteractionProgressApplier *)self inFlightAnimation];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __54__HUInteractionProgressApplier__updateCurrentProgress__block_invoke_2;
    v23[3] = &unk_1E6385520;
    objc_copyWeak(&v24, &location);
    [v20 addCompletionBlock:v23];

    v21 = [(HUInteractionProgressApplier *)self inFlightAnimation];
    [v21 start];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    v22 = [(HUInteractionProgressApplier *)self inFlightAnimation];
    [v22 cancel];

    [(HUInteractionProgressApplier *)self setInFlightAnimation:0];
    [(HUInteractionProgressApplier *)self _currentInteractionProgress];
    -[HUApplier updateProgress:](self, "updateProgress:");
  }
  [(HUInteractionProgressApplier *)self _currentInteractionProgress];
  -[HUInteractionProgressApplier setPreviousInteractionProgress:](self, "setPreviousInteractionProgress:");
}

void __54__HUInteractionProgressApplier__updateCurrentProgress__block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained animationFromProgress];
  double v4 = v3;
  [WeakRetained animationToProgress];
  double v6 = v5;
  [WeakRetained animationFromProgress];
  [WeakRetained updateProgress:v4 + (v6 - v7) * a2];
}

void __54__HUInteractionProgressApplier__updateCurrentProgress__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained waitingOnAnimationToComplete])
  {
    [WeakRetained setWaitingOnAnimationToComplete:0];
    [WeakRetained complete:a2];
  }
}

- (void)interactionProgressDidUpdate:(id)a3
{
  if (![(HUInteractionProgressApplier *)self waitingOnAnimationToComplete])
  {
    [(HUInteractionProgressApplier *)self _updateCurrentProgress];
  }
}

- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(HUInteractionProgressApplier *)self completesAtTargetState])
  {
    if (v4)
    {
      [(HUInteractionProgressApplier *)self _completeSuccessfullyIfAnimationsComplete];
    }
    else
    {
      [(HUInteractionProgressApplier *)self complete:0];
    }
  }
}

- (void)_completeSuccessfullyIfAnimationsComplete
{
  double v3 = [(HUInteractionProgressApplier *)self inFlightAnimation];

  if (v3)
  {
    [(HUInteractionProgressApplier *)self setWaitingOnAnimationToComplete:1];
  }
  else
  {
    [(HUInteractionProgressApplier *)self complete:1];
  }
}

- (BOOL)complete:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUInteractionProgressApplier;
  BOOL v4 = [(HUApplier *)&v7 complete:a3];
  if (v4)
  {
    [(HUInteractionProgressApplier *)self setWaitingOnAnimationToComplete:0];
    double v5 = [(HUInteractionProgressApplier *)self interactionProgress];
    [v5 removeProgressObserver:self];
  }
  return v4;
}

- (BOOL)cancel
{
  v6.receiver = self;
  v6.super_class = (Class)HUInteractionProgressApplier;
  BOOL v3 = [(HUApplier *)&v6 cancel];
  BOOL v4 = [(HUInteractionProgressApplier *)self inFlightAnimation];
  [v4 cancel];

  [(HUInteractionProgressApplier *)self setInFlightAnimation:0];
  return v3;
}

- (UIInteractionProgress)interactionProgress
{
  return self->_interactionProgress;
}

- (HUAnimationSettings)significantProgressChangeAnimationSettings
{
  return self->_significantProgressChangeAnimationSettings;
}

- (void)setSignificantProgressChangeAnimationSettings:(id)a3
{
}

- (HUAnimationSettings)transitionAnimationSettings
{
  return self->_transitionAnimationSettings;
}

- (void)setTransitionAnimationSettings:(id)a3
{
}

- (BOOL)boundProgressValues
{
  return self->_boundProgressValues;
}

- (void)setBoundProgressValues:(BOOL)a3
{
  self->_boundProgressValues = a3;
}

- (BOOL)completesAtTargetState
{
  return self->_completesAtTargetState;
}

- (void)setCompletesAtTargetState:(BOOL)a3
{
  self->_completesAtTargetState = a3;
}

- (double)animationFromProgress
{
  return self->_animationFromProgress;
}

- (void)setAnimationFromProgress:(double)a3
{
  self->_animationFromProgress = a3;
}

- (double)animationToProgress
{
  return self->_animationToProgress;
}

- (void)setAnimationToProgress:(double)a3
{
  self->_animationToProgress = a3;
}

- (HUAnimationApplier)inFlightAnimation
{
  return self->_inFlightAnimation;
}

- (void)setInFlightAnimation:(id)a3
{
}

- (double)previousInteractionProgress
{
  return self->_previousInteractionProgress;
}

- (void)setPreviousInteractionProgress:(double)a3
{
  self->_previousInteractionProgress = a3;
}

- (BOOL)waitingOnAnimationToComplete
{
  return self->_waitingOnAnimationToComplete;
}

- (void)setWaitingOnAnimationToComplete:(BOOL)a3
{
  self->_waitingOnAnimationToComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inFlightAnimation, 0);
  objc_storeStrong((id *)&self->_transitionAnimationSettings, 0);
  objc_storeStrong((id *)&self->_significantProgressChangeAnimationSettings, 0);

  objc_storeStrong((id *)&self->_interactionProgress, 0);
}

@end