@interface CSScrollModifier
- (BOOL)cancelScrollingIfTooMuchDrag;
- (BOOL)recognized;
- (BOOL)scrollFromRightToLeft;
- (CGPoint)scrollView:(id)a3 adjustedOffsetForOffset:(CGPoint)a4 translation:(CGPoint)a5 startPoint:(CGPoint)a6 locationInView:(CGPoint)a7 horizontalVelocity:(double *)a8 verticalVelocity:(double *)a9;
- (CSScrollModifier)initWithView:(id)a3;
- (double)_horizontalProgressSubtractionFromVertical:(CGPoint)a3;
- (double)accumulatedDragThresholdPercentage;
- (double)inertialMultiplierSigmoidAlpha;
- (double)inertialMultiplierSigmoidBase;
- (double)inertialMultiplierSigmoidPivot;
- (double)inertialMultiplierSigmoidRange;
- (double)maxDragFromVerticalPerFrame;
- (double)maxScrollDistance;
- (double)minPercentageSigmoidAlpha;
- (double)minPercentageSigmoidBase;
- (double)minPercentageSigmoidPivot;
- (double)minPercentageSigmoidRange;
- (double)powerOfVerticalDirectionSine2;
- (void)_loadFromSettings:(id)a3;
- (void)_updateScrollParameters;
- (void)dealloc;
- (void)reset;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAccumulatedDragThresholdPercentage:(double)a3;
- (void)setCancelScrollingIfTooMuchDrag:(BOOL)a3;
- (void)setInertialMultiplierSigmoidAlpha:(double)a3;
- (void)setInertialMultiplierSigmoidBase:(double)a3;
- (void)setInertialMultiplierSigmoidPivot:(double)a3;
- (void)setInertialMultiplierSigmoidRange:(double)a3;
- (void)setMaxDragFromVerticalPerFrame:(double)a3;
- (void)setMaxScrollDistance:(double)a3;
- (void)setMinPercentageSigmoidAlpha:(double)a3;
- (void)setMinPercentageSigmoidBase:(double)a3;
- (void)setMinPercentageSigmoidPivot:(double)a3;
- (void)setMinPercentageSigmoidRange:(double)a3;
- (void)setPowerOfVerticalDirectionSine2:(double)a3;
@end

@implementation CSScrollModifier

- (CSScrollModifier)initWithView:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSScrollModifier;
  v5 = [(CSScrollModifier *)&v11 init];
  v6 = v5;
  if (v5)
  {
    if (!v4)
    {
      v9 = 0;
      goto LABEL_6;
    }
    objc_storeWeak((id *)&v5->_targetView, v4);
    v7 = +[CSLockScreenDomain rootSettings];
    v8 = [v7 dashBoardScrollModifierSettings];

    [v8 addKeyObserver:v6];
    [(CSScrollModifier *)v6 _loadFromSettings:v8];
  }
  v9 = v6;
LABEL_6:

  return v9;
}

- (void)dealloc
{
  v3 = +[CSLockScreenDomain rootSettings];
  id v4 = [v3 dashBoardScrollModifierSettings];
  [v4 removeKeyObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)CSScrollModifier;
  [(CSScrollModifier *)&v5 dealloc];
}

- (BOOL)scrollFromRightToLeft
{
  return self->_lastLocation.x < self->_firstLocation.x;
}

- (void)reset
{
  *(_WORD *)&self->_hasDraggedSinceReset = 0;
  self->_recognized = 0;
  CGPoint v2 = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_firstLocation = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_lastLocation = v2;
  self->_minSwipePercentageOfScreen = 100.0;
  self->_inertialMultiplier = 0.0;
  self->_initialScrollViewOffsetX = 0.0;
  self->_accumulatedDrag = 0.0;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  if (!self->_hasDraggedSinceReset)
  {
    id v15 = v4;
    objc_super v5 = [v4 panGestureRecognizer];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
    [v5 locationInView:WeakRetained];
    self->_firstLocation.x = v7;
    self->_firstLocation.y = v8;

    self->_lastLocation = self->_firstLocation;
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
    {
      [v15 contentSize];
      double v10 = v9;
      [v15 frame];
      double v12 = v10 - v11;
      [v15 contentOffset];
      double v14 = v12 - v13;
    }
    else
    {
      [v15 contentOffset];
    }
    self->_initialScrollViewOffsetX = v14;
    self->_hasDraggedSinceReset = 1;
    id v4 = v15;
  }
}

- (CGPoint)scrollView:(id)a3 adjustedOffsetForOffset:(CGPoint)a4 translation:(CGPoint)a5 startPoint:(CGPoint)a6 locationInView:(CGPoint)a7 horizontalVelocity:(double *)a8 verticalVelocity:(double *)a9
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v13 = a3;
  if (!v13)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"CSScrollModifier.m", 82, @"Invalid parameter not satisfying: %@", @"scrollView != nil" object file lineNumber description];
  }
  if (!self->_cancelled)
  {
    double v14 = [v13 panGestureRecognizer];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
    [v14 locationInView:WeakRetained];
    double v17 = v16;
    double v19 = v18;

    -[CSScrollModifier _horizontalProgressSubtractionFromVertical:](self, "_horizontalProgressSubtractionFromVertical:", v17, v19);
    if (self->_cancelScrollingIfTooMuchDrag)
    {
      double maxAccumulatedDragThreshold = self->_maxAccumulatedDragThreshold;
      double v22 = v20 + self->_accumulatedDrag;
      self->_accumulatedDrag = v22;
      if (v22 > maxAccumulatedDragThreshold)
      {
        self->_cancelled = 1;
        [v13 _forcePanGestureToEndImmediately];
      }
    }
    self->_lastLocation.CGFloat x = v17;
    self->_lastLocation.CGFloat y = v19;
  }

  double v23 = x;
  double v24 = y;
  result.CGFloat y = v24;
  result.CGFloat x = v23;
  return result;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a4.x;
  id v7 = a3;
  if (self->_cancelled)
  {
    self->_recognized = 0;
  }
  else
  {
    id v24 = v7;
    [(CSScrollModifier *)self _updateScrollParameters];
    BOOL v8 = [(CSScrollModifier *)self scrollFromRightToLeft];
    double v9 = (id *)MEMORY[0x1E4F43630];
    uint64_t v10 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    if ([*v9 userInterfaceLayoutDirection] == 1)
    {
      [v24 contentSize];
      double v12 = v11;
      [v24 frame];
      double v14 = v12 - v13;
      [v24 contentOffset];
      double v16 = v14 - v15;
    }
    else
    {
      [v24 contentOffset];
    }
    double v17 = v16 - self->_initialScrollViewOffsetX;
    if (v10 == 1) {
      double v17 = -v17;
    }
    if (v8) {
      double v18 = v17 + self->_inertialMultiplier * x;
    }
    else {
      double v18 = -(v17 + self->_inertialMultiplier * x);
    }
    double maxScrollDistance = self->_maxScrollDistance;
    double v20 = self->_minSwipePercentageOfScreen / 100.0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
    [WeakRetained bounds];
    double v22 = fmin(maxScrollDistance, v20 * CGRectGetWidth(v26));

    BOOL v23 = v18 > v22;
    if (vabdd_f64(v18, v22) < 0.00000011920929) {
      BOOL v23 = 1;
    }
    self->_recognized = v23;
    id v7 = v24;
  }
}

- (double)_horizontalProgressSubtractionFromVertical:(CGPoint)a3
{
  long double v4 = a3.y - self->_lastLocation.y;
  long double v5 = a3.x - self->_lastLocation.x;
  float v6 = v4 * v4 + v5 * v5;
  double v7 = sqrtf(v6);
  float v8 = atan2(v4, v5);
  float v9 = sinf(v8);
  double result = pow(v9 * v9, self->_powerOfVerticalDirectionSine2) * v7;
  if (result > self->_maxDragFromVerticalPerFrame) {
    return self->_maxDragFromVerticalPerFrame;
  }
  return result;
}

- (void)_updateScrollParameters
{
  if (!__sb__runningInSpringBoard())
  {
    long double v5 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if (v6 != 1) {
      goto LABEL_3;
    }
LABEL_6:
    self->_minSwipePercentageOfScreen = self->_minPercentageSigmoidBase;
    double inertialMultiplierSigmoidRange = self->_inertialMultiplierSigmoidRange;
    uint64_t v8 = 64;
    goto LABEL_9;
  }
  if (SBFEffectiveDeviceClass() == 2) {
    goto LABEL_6;
  }
LABEL_3:
  if ([(CSScrollModifier *)self scrollFromRightToLeft])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
    [WeakRetained bounds];
    double x = CGRectGetWidth(v13) - self->_firstLocation.x;
  }
  else
  {
    double x = self->_firstLocation.x;
  }
  double inertialMultiplierSigmoidBase = self->_inertialMultiplierSigmoidBase;
  double v10 = self->_inertialMultiplierSigmoidRange;
  self->_inertialMultiplier = inertialMultiplierSigmoidBase
                            + v10
                            / (exp(-(self->_inertialMultiplierSigmoidAlpha * (x - self->_inertialMultiplierSigmoidPivot)))
                             + 1.0);
  double minPercentageSigmoidBase = self->_minPercentageSigmoidBase;
  double minPercentageSigmoidRange = self->_minPercentageSigmoidRange;
  double inertialMultiplierSigmoidRange = minPercentageSigmoidBase
                                 + minPercentageSigmoidRange
                                 / (exp(-(self->_minPercentageSigmoidAlpha * (x - self->_minPercentageSigmoidPivot)))
                                  + 1.0);
  uint64_t v8 = 56;
LABEL_9:
  *(double *)((char *)&self->super.isa + v8) = inertialMultiplierSigmoidRange;
}

- (void)setAccumulatedDragThresholdPercentage:(double)a3
{
  self->_accumulatedDragThresholdPercentage = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  [WeakRetained bounds];
  self->_double maxAccumulatedDragThreshold = CGRectGetWidth(v6) * (self->_accumulatedDragThresholdPercentage / 100.0);
}

- (void)_loadFromSettings:(id)a3
{
  id v4 = a3;
  [v4 maxScrollDistance];
  -[CSScrollModifier setMaxScrollDistance:](self, "setMaxScrollDistance:");
  -[CSScrollModifier setCancelScrollingIfTooMuchDrag:](self, "setCancelScrollingIfTooMuchDrag:", [v4 cancelScrollingIfTooMuchDrag]);
  [v4 accumulatedDragThresholdPercentage];
  -[CSScrollModifier setAccumulatedDragThresholdPercentage:](self, "setAccumulatedDragThresholdPercentage:");
  [v4 maxDragFromVerticalPerFrame];
  -[CSScrollModifier setMaxDragFromVerticalPerFrame:](self, "setMaxDragFromVerticalPerFrame:");
  [v4 powerOfVerticalDirectionSine2];
  -[CSScrollModifier setPowerOfVerticalDirectionSine2:](self, "setPowerOfVerticalDirectionSine2:");
  [v4 inertialMultiplierSigmoidBase];
  -[CSScrollModifier setInertialMultiplierSigmoidBase:](self, "setInertialMultiplierSigmoidBase:");
  [v4 inertialMultiplierSigmoidRange];
  -[CSScrollModifier setInertialMultiplierSigmoidRange:](self, "setInertialMultiplierSigmoidRange:");
  [v4 inertialMultiplierSigmoidPivot];
  -[CSScrollModifier setInertialMultiplierSigmoidPivot:](self, "setInertialMultiplierSigmoidPivot:");
  [v4 inertialMultiplierSigmoidAlpha];
  -[CSScrollModifier setInertialMultiplierSigmoidAlpha:](self, "setInertialMultiplierSigmoidAlpha:");
  [v4 minPercentageSigmoidBase];
  -[CSScrollModifier setMinPercentageSigmoidBase:](self, "setMinPercentageSigmoidBase:");
  [v4 minPercentageSigmoidRange];
  -[CSScrollModifier setMinPercentageSigmoidRange:](self, "setMinPercentageSigmoidRange:");
  [v4 minPercentageSigmoidPivot];
  -[CSScrollModifier setMinPercentageSigmoidPivot:](self, "setMinPercentageSigmoidPivot:");
  [v4 minPercentageSigmoidAlpha];
  double v6 = v5;

  [(CSScrollModifier *)self setMinPercentageSigmoidAlpha:v6];
}

- (BOOL)recognized
{
  return self->_recognized;
}

- (double)maxScrollDistance
{
  return self->_maxScrollDistance;
}

- (void)setMaxScrollDistance:(double)a3
{
  self->_double maxScrollDistance = a3;
}

- (BOOL)cancelScrollingIfTooMuchDrag
{
  return self->_cancelScrollingIfTooMuchDrag;
}

- (void)setCancelScrollingIfTooMuchDrag:(BOOL)a3
{
  self->_cancelScrollingIfTooMuchDrag = a3;
}

- (double)accumulatedDragThresholdPercentage
{
  return self->_accumulatedDragThresholdPercentage;
}

- (double)maxDragFromVerticalPerFrame
{
  return self->_maxDragFromVerticalPerFrame;
}

- (void)setMaxDragFromVerticalPerFrame:(double)a3
{
  self->_maxDragFromVerticalPerFrame = a3;
}

- (double)powerOfVerticalDirectionSine2
{
  return self->_powerOfVerticalDirectionSine2;
}

- (void)setPowerOfVerticalDirectionSine2:(double)a3
{
  self->_powerOfVerticalDirectionSine2 = a3;
}

- (double)inertialMultiplierSigmoidBase
{
  return self->_inertialMultiplierSigmoidBase;
}

- (void)setInertialMultiplierSigmoidBase:(double)a3
{
  self->_double inertialMultiplierSigmoidBase = a3;
}

- (double)inertialMultiplierSigmoidRange
{
  return self->_inertialMultiplierSigmoidRange;
}

- (void)setInertialMultiplierSigmoidRange:(double)a3
{
  self->_double inertialMultiplierSigmoidRange = a3;
}

- (double)inertialMultiplierSigmoidPivot
{
  return self->_inertialMultiplierSigmoidPivot;
}

- (void)setInertialMultiplierSigmoidPivot:(double)a3
{
  self->_inertialMultiplierSigmoidPivot = a3;
}

- (double)inertialMultiplierSigmoidAlpha
{
  return self->_inertialMultiplierSigmoidAlpha;
}

- (void)setInertialMultiplierSigmoidAlpha:(double)a3
{
  self->_inertialMultiplierSigmoidAlpha = a3;
}

- (double)minPercentageSigmoidBase
{
  return self->_minPercentageSigmoidBase;
}

- (void)setMinPercentageSigmoidBase:(double)a3
{
  self->_double minPercentageSigmoidBase = a3;
}

- (double)minPercentageSigmoidRange
{
  return self->_minPercentageSigmoidRange;
}

- (void)setMinPercentageSigmoidRange:(double)a3
{
  self->_double minPercentageSigmoidRange = a3;
}

- (double)minPercentageSigmoidPivot
{
  return self->_minPercentageSigmoidPivot;
}

- (void)setMinPercentageSigmoidPivot:(double)a3
{
  self->_minPercentageSigmoidPivot = a3;
}

- (double)minPercentageSigmoidAlpha
{
  return self->_minPercentageSigmoidAlpha;
}

- (void)setMinPercentageSigmoidAlpha:(double)a3
{
  self->_minPercentageSigmoidAlpha = a3;
}

- (void).cxx_destruct
{
}

@end