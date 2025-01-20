@interface HUForceInterpolatedPressGestureRecognizer
- (HUForceInterpolatedPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (NSMutableSet)hu_activeTouches;
- (double)_forceMultiplierIncludingCurrentSample;
- (double)currentSampleForceMultiplier;
- (double)currentSampleTimestamp;
- (double)overallForceMultiplierExcludingCurrentSample;
- (double)touchStartTime;
- (void)_logForceMultiplierSample;
- (void)_resetForceSamples;
- (void)setCurrentSampleForceMultiplier:(double)a3;
- (void)setCurrentSampleTimestamp:(double)a3;
- (void)setOverallForceMultiplierExcludingCurrentSample:(double)a3;
- (void)setTouchStartTime:(double)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation HUForceInterpolatedPressGestureRecognizer

- (HUForceInterpolatedPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HUForceInterpolatedPressGestureRecognizer;
  v4 = [(HUForceInterpolatedPressGestureRecognizer *)&v8 initWithTarget:a3 action:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    hu_activeTouches = v4->_hu_activeTouches;
    v4->_hu_activeTouches = (NSMutableSet *)v5;

    [(HUForceInterpolatedPressGestureRecognizer *)v4 _resetForceSamples];
  }
  return v4;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(HUForceInterpolatedPressGestureRecognizer *)self hu_activeTouches];
  uint64_t v9 = [v8 count];

  if (!v9) {
    [(HUForceInterpolatedPressGestureRecognizer *)self setTouchStartTime:CACurrentMediaTime()];
  }
  v10 = [(HUForceInterpolatedPressGestureRecognizer *)self hu_activeTouches];
  [v10 unionSet:v7];

  [(HUForceInterpolatedPressGestureRecognizer *)self _logForceMultiplierSample];
  v11.receiver = self;
  v11.super_class = (Class)HUForceInterpolatedPressGestureRecognizer;
  [(HUForceInterpolatedPressGestureRecognizer *)&v11 touchesBegan:v7 withEvent:v6];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(HUForceInterpolatedPressGestureRecognizer *)self _logForceMultiplierSample];
  v8.receiver = self;
  v8.super_class = (Class)HUForceInterpolatedPressGestureRecognizer;
  [(HUForceInterpolatedPressGestureRecognizer *)&v8 touchesMoved:v7 withEvent:v6];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(HUForceInterpolatedPressGestureRecognizer *)self hu_activeTouches];
  [v8 minusSet:v7];

  [(HUForceInterpolatedPressGestureRecognizer *)self _logForceMultiplierSample];
  v9.receiver = self;
  v9.super_class = (Class)HUForceInterpolatedPressGestureRecognizer;
  [(HUForceInterpolatedPressGestureRecognizer *)&v9 touchesEnded:v7 withEvent:v6];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(HUForceInterpolatedPressGestureRecognizer *)self hu_activeTouches];
  [v8 minusSet:v7];

  [(HUForceInterpolatedPressGestureRecognizer *)self _logForceMultiplierSample];
  v9.receiver = self;
  v9.super_class = (Class)HUForceInterpolatedPressGestureRecognizer;
  [(HUForceInterpolatedPressGestureRecognizer *)&v9 touchesCancelled:v7 withEvent:v6];
}

- (double)_forceMultiplierIncludingCurrentSample
{
  [(HUForceInterpolatedPressGestureRecognizer *)self touchStartTime];
  double v3 = 1.0;
  if (v4 != 0.0)
  {
    [(HUForceInterpolatedPressGestureRecognizer *)self currentSampleTimestamp];
    if (v5 != 0.0)
    {
      double v6 = CACurrentMediaTime();
      [(HUForceInterpolatedPressGestureRecognizer *)self currentSampleTimestamp];
      double v8 = v6 - v7;
      [(HUForceInterpolatedPressGestureRecognizer *)self touchStartTime];
      double v10 = v6 - v9;
      [(HUForceInterpolatedPressGestureRecognizer *)self currentSampleForceMultiplier];
      double v12 = v8 * v11;
      [(HUForceInterpolatedPressGestureRecognizer *)self overallForceMultiplierExcludingCurrentSample];
      return (v12 + v13 * (v10 - v8)) / v10;
    }
  }
  return v3;
}

- (void)_resetForceSamples
{
  [(HUForceInterpolatedPressGestureRecognizer *)self setOverallForceMultiplierExcludingCurrentSample:1.0];
  [(HUForceInterpolatedPressGestureRecognizer *)self setCurrentSampleForceMultiplier:1.0];
  [(HUForceInterpolatedPressGestureRecognizer *)self setTouchStartTime:0.0];

  [(HUForceInterpolatedPressGestureRecognizer *)self setCurrentSampleTimestamp:0.0];
}

- (void)_logForceMultiplierSample
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v3 = [(HUForceInterpolatedPressGestureRecognizer *)self hu_activeTouches];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [(HUForceInterpolatedPressGestureRecognizer *)self _forceMultiplierIncludingCurrentSample];
    -[HUForceInterpolatedPressGestureRecognizer setOverallForceMultiplierExcludingCurrentSample:](self, "setOverallForceMultiplierExcludingCurrentSample:");
    double v5 = [(HUForceInterpolatedPressGestureRecognizer *)self hu_activeTouches];
    double v6 = objc_msgSend(v5, "na_filter:", &__block_literal_global_34);
    double v7 = [(HUForceInterpolatedPressGestureRecognizer *)self hu_activeTouches];
    [v7 setSet:v6];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v8 = [(HUForceInterpolatedPressGestureRecognizer *)self hu_activeTouches];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      double v12 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * i) force];
          double v12 = v12 + v14;
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
    else
    {
      double v12 = 0.0;
    }

    v15 = [(HUForceInterpolatedPressGestureRecognizer *)self hu_activeTouches];
    double v16 = v12 / (double)(unint64_t)[v15 count];

    [(HUForceInterpolatedPressGestureRecognizer *)self setCurrentSampleForceMultiplier:v16 / 6.667 * 3.0 + 1.0];
    [(HUForceInterpolatedPressGestureRecognizer *)self setCurrentSampleTimestamp:CACurrentMediaTime()];
  }
  else
  {
    [(HUForceInterpolatedPressGestureRecognizer *)self _resetForceSamples];
  }
}

BOOL __70__HUForceInterpolatedPressGestureRecognizer__logForceMultiplierSample__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 phase] != 3 && objc_msgSend(v2, "phase") != 4;

  return v3;
}

- (NSMutableSet)hu_activeTouches
{
  return self->_hu_activeTouches;
}

- (double)currentSampleForceMultiplier
{
  return self->_currentSampleForceMultiplier;
}

- (void)setCurrentSampleForceMultiplier:(double)a3
{
  self->_currentSampleForceMultiplier = a3;
}

- (double)currentSampleTimestamp
{
  return self->_currentSampleTimestamp;
}

- (void)setCurrentSampleTimestamp:(double)a3
{
  self->_currentSampleTimestamp = a3;
}

- (double)overallForceMultiplierExcludingCurrentSample
{
  return self->_overallForceMultiplierExcludingCurrentSample;
}

- (void)setOverallForceMultiplierExcludingCurrentSample:(double)a3
{
  self->_overallForceMultiplierExcludingCurrentSample = a3;
}

- (double)touchStartTime
{
  return self->_touchStartTime;
}

- (void)setTouchStartTime:(double)a3
{
  self->_touchStartTime = a3;
}

- (void).cxx_destruct
{
}

@end