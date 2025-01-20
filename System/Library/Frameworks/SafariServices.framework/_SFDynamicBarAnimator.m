@interface _SFDynamicBarAnimator
- (BOOL)_canTransitionToState:(int64_t)a3 withMinimumTopBarHeight:(double)a4;
- (BOOL)canTransitionToState:(int64_t)a3;
- (BOOL)ignoresDragging;
- (BOOL)isInSteadyState;
- (BOOL)isSendingOutputsDidChange;
- (BOOL)isTrackingDrag;
- (_SFDynamicBarAnimator)init;
- (_SFDynamicBarAnimatorDelegate)delegate;
- (double)_bottomBarOffsetForTopBarHeight:(double)a3;
- (double)_constrainTopBarHeight:(double)a3;
- (double)_constrainTopBarHeight:(double)a3 withMinimumTopBarHeight:(double)a4;
- (double)bottomBarOffset;
- (double)minimumTopBarHeight;
- (double)topBarHeight;
- (int64_t)state;
- (int64_t)targetState;
- (void)_displayLinkFired:(id)a3;
- (void)_endDraggingWithVelocity:(double)a3;
- (void)_moveBarsWithDelta:(double)a3;
- (void)_setInSteadyState:(BOOL)a3;
- (void)_transitionToSteadyState;
- (void)_updateDisplayLink;
- (void)_updateOutputs;
- (void)addObserver:(id)a3;
- (void)attemptTransitionToState:(int64_t)a3 animated:(BOOL)a4;
- (void)beginDraggingWithOffset:(double)a3;
- (void)dealloc;
- (void)endDraggingWithTargetOffset:(double)a3 velocity:(double)a4;
- (void)endScrolling;
- (void)performBatchUpdates:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setBottomBarOffset:(double)a3 forState:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setIgnoresDragging:(BOOL)a3;
- (void)setMinimumTopBarHeight:(double)a3;
- (void)setTopBarHeight:(double)a3 forState:(int64_t)a4;
- (void)updateDraggingWithOffset:(double)a3;
@end

@implementation _SFDynamicBarAnimator

- (int64_t)targetState
{
  return self->_targetTopBarHeight != self->_topBarHeightForState[0];
}

- (_SFDynamicBarAnimator)init
{
  v8.receiver = self;
  v8.super_class = (Class)_SFDynamicBarAnimator;
  v2 = [(_SFDynamicBarAnimator *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_state = 1;
    v2->_inSteadyState = 1;
    uint64_t v4 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    stateObservers = v3->_stateObservers;
    v3->_stateObservers = (NSPointerArray *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)attemptTransitionToState:(int64_t)a3 animated:(BOOL)a4
{
  if (-[_SFDynamicBarAnimator canTransitionToState:](self, "canTransitionToState:"))
  {
    self->_didHideOrShowBarsExplicitly = 1;
    topBarHeightForState = self->_topBarHeightForState;
    self->_targetTopBarHeight = self->_topBarHeightForState[a3];
    if (!a4)
    {
      self->_lastUnroundedTopBarHeight = topBarHeightForState[a3];
      self->_unroundedTopBarHeight = topBarHeightForState[a3];
    }
    [(_SFDynamicBarAnimator *)self _updateOutputs];
  }
}

- (BOOL)canTransitionToState:(int64_t)a3
{
  return [(_SFDynamicBarAnimator *)self _canTransitionToState:a3 withMinimumTopBarHeight:self->_minimumTopBarHeight];
}

- (BOOL)_canTransitionToState:(int64_t)a3 withMinimumTopBarHeight:(double)a4
{
  uint64_t v4 = (double *)(&self->super.isa + a3);
  [(_SFDynamicBarAnimator *)self _constrainTopBarHeight:v4[1] withMinimumTopBarHeight:a4];
  return v5 == v4[1];
}

- (void)_updateOutputs
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!self->_performingBatchUpdates)
  {
    double topBarHeight = self->_topBarHeight;
    double bottomBarOffset = self->_bottomBarOffset;
    int64_t state = self->_state;
    [(_SFDynamicBarAnimator *)self _constrainTopBarHeight:self->_unroundedTopBarHeight];
    self->_unroundedTopBarHeight = v6;
    [(_SFDynamicBarAnimator *)self _constrainTopBarHeight:self->_targetTopBarHeight];
    self->_targetTopBarHeight = v7;
    if (!self->_dragging && v7 != self->_topBarHeightForState[0]) {
      self->_targetTopBarHeight = self->_topBarHeightForState[1];
    }
    _SFRoundFloatToPixels();
    self->_double topBarHeight = v8;
    [(_SFDynamicBarAnimator *)self _updateDisplayLink];
    [(_SFDynamicBarAnimator *)self _bottomBarOffsetForTopBarHeight:self->_unroundedTopBarHeight];
    _SFRoundFloatToPixels();
    self->_double bottomBarOffset = v9;
    if (_SFEqualWithEpsilon()) {
      int v10 = _SFEqualWithEpsilon();
    }
    else {
      int v10 = 0;
    }
    int v11 = _SFEqualWithEpsilon();
    if (v11) {
      int v11 = _SFEqualWithEpsilon();
    }
    self->_int64_t state = v10 ^ 1u;
    char v12 = v10 | v11;
    BOOL v13 = (v10 | v11) == 1 && self->_displayLink == 0;
    [(_SFDynamicBarAnimator *)self _setInSteadyState:v13];
    if (state != self->_state)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v14 = self->_stateObservers;
      uint64_t v15 = [(NSPointerArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v22 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              objc_msgSend(v19, "dynamicBarAnimatorStateDidChange:", self, (void)v21);
            }
          }
          uint64_t v16 = [(NSPointerArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v16);
      }
    }
    if (topBarHeight != self->_topBarHeight || bottomBarOffset != self->_bottomBarOffset || state != self->_state)
    {
      self->_sendingOutputsDidChange = 1;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained dynamicBarAnimatorOutputsDidChange:self];

      self->_sendingOutputsDidChange = 0;
      if ((v12 & 1) == 0 && !self->_dragging && !self->_displayLink) {
        [(_SFDynamicBarAnimator *)self _transitionToSteadyState];
      }
    }
  }
}

- (double)_constrainTopBarHeight:(double)a3 withMinimumTopBarHeight:(double)a4
{
  return fmin(fmax(a3, fmax(a4, self->_topBarHeightForState[0])), self->_topBarHeightForState[1]);
}

- (double)_constrainTopBarHeight:(double)a3
{
  [(_SFDynamicBarAnimator *)self _constrainTopBarHeight:a3 withMinimumTopBarHeight:self->_minimumTopBarHeight];
  return result;
}

- (void)_updateDisplayLink
{
  if (vabdd_f64(self->_topBarHeight, self->_targetTopBarHeight) >= 0.1
    || vabdd_f64(self->_lastUnroundedTopBarHeight, self->_unroundedTopBarHeight) >= 10.0)
  {
    if (self->_displayLink) {
      return;
    }
    double v6 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__displayLinkFired_];
    displayLink = self->_displayLink;
    self->_displayLink = v6;

    CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    -[CADisplayLink setPreferredFrameRateRange:](self->_displayLink, "setPreferredFrameRateRange:", *(double *)&v10.minimum, *(double *)&v10.maximum, *(double *)&v10.preferred);
    [(CADisplayLink *)self->_displayLink setHighFrameRateReason:1638405];
    double v8 = self->_displayLink;
    double v9 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v8 addToRunLoop:v9 forMode:*MEMORY[0x1E4F1C4B0]];

    double unroundedTopBarHeight = self->_unroundedTopBarHeight;
  }
  else
  {
    v3 = self->_displayLink;
    if (!v3) {
      return;
    }
    [(CADisplayLink *)v3 invalidate];
    uint64_t v4 = self->_displayLink;
    self->_displayLink = 0;

    double unroundedTopBarHeight = self->_topBarHeight;
    self->_targetTopBarHeight = unroundedTopBarHeight;
    self->_double unroundedTopBarHeight = unroundedTopBarHeight;
  }
  self->_lastUnroundedTopBarHeight = unroundedTopBarHeight;
}

- (void)_setInSteadyState:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (((!self->_inSteadyState ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    self->_inSteadyState = a3;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    double v5 = self->_stateObservers;
    uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          CAFrameRateRange v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (v3)
          {
            if (objc_opt_respondsToSelector()) {
              [v10 dynamicBarAnimatorWillEnterSteadyState:self];
            }
          }
          else if (objc_opt_respondsToSelector())
          {
            objc_msgSend(v10, "dynamicBarAnimatorWillLeaveSteadyState:", self, (void)v11);
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (double)_bottomBarOffsetForTopBarHeight:(double)a3
{
  double v4 = self->_topBarHeightForState[0];
  double v5 = self->_topBarHeightForState[1];
  double v7 = self->_bottomBarOffsetForState[0];
  double v6 = self->_bottomBarOffsetForState[1];
  if (_SFEqualWithEpsilon()) {
    return v6;
  }
  else {
    return (a3 - v4) / (v5 - v4) * v6 + (1.0 - (a3 - v4) / (v5 - v4)) * v7;
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v5 = WeakRetained;
  if (WeakRetained != obj)
  {
    if (WeakRetained) {
      [(_SFDynamicBarAnimator *)self removeObserver:WeakRetained];
    }
    objc_storeWeak((id *)&self->_delegate, obj);
    if (obj) {
      -[_SFDynamicBarAnimator addObserver:](self, "addObserver:");
    }
  }
}

- (void)addObserver:(id)a3
{
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_SFDynamicBarAnimator;
  [(_SFDynamicBarAnimator *)&v2 dealloc];
}

- (void)removeObserver:(id)a3
{
  stateObservers = self->_stateObservers;
  id v5 = a3;
  [(NSPointerArray *)stateObservers compact];
  double v6 = [(NSPointerArray *)self->_stateObservers allObjects];
  uint64_t v7 = [v6 indexOfObject:v5];

  uint64_t v8 = self->_stateObservers;

  [(NSPointerArray *)v8 removePointerAtIndex:v7];
}

- (void)_moveBarsWithDelta:(double)a3
{
  double unroundedTopBarHeight = self->_unroundedTopBarHeight;
  double v6 = self->_targetTopBarHeight - a3;
  self->_targetTopBarHeight = v6;
  double v7 = self->_topBarHeightForState[1] - self->_topBarHeightForState[0];
  double v8 = vabdd_f64(unroundedTopBarHeight, v6);
  self->_double unroundedTopBarHeight = unroundedTopBarHeight - exp(-(v8 * 3.0 / v7 * (v8 * 3.0 / v7))) * a3;

  [(_SFDynamicBarAnimator *)self _updateOutputs];
}

- (void)_transitionToSteadyState
{
  if (self->_topBarHeight >= self->_topBarHeightForState[1] * 0.9
    || (v3 = [(_SFDynamicBarAnimator *)self canTransitionToState:0], uint64_t v4 = 0, !v3))
  {
    uint64_t v4 = 1;
  }

  [(_SFDynamicBarAnimator *)self attemptTransitionToState:v4 animated:1];
}

- (BOOL)isInSteadyState
{
  return self->_inSteadyState;
}

- (void)_displayLinkFired:(id)a3
{
  [a3 duration];
  double unroundedTopBarHeight = self->_unroundedTopBarHeight;
  self->_double unroundedTopBarHeight = unroundedTopBarHeight
                               - ((self->_lastUnroundedTopBarHeight - unroundedTopBarHeight) / v5
                                + ((self->_lastUnroundedTopBarHeight - unroundedTopBarHeight) / v5 * -50.0
                                 + (unroundedTopBarHeight - self->_targetTopBarHeight) * 900.0)
                                * v5)
                               * v5;
  self->_lastUnroundedTopBarHeight = unroundedTopBarHeight;

  [(_SFDynamicBarAnimator *)self _updateOutputs];
}

- (void)beginDraggingWithOffset:(double)a3
{
  if (!self->_ignoresDragging)
  {
    self->_dragging = 1;
    *(_WORD *)&self->_didHideBarsByMoving = 0;
    self->_lastOffset = a3;
  }
}

- (void)updateDraggingWithOffset:(double)a3
{
  if (self->_dragging)
  {
    if (self->_state == 1 && !self->_didHideOrShowBarsExplicitly)
    {
      double v5 = a3 - self->_lastOffset;
      double v6 = fmax(self->_topBarHeight - self->_topBarHeightForState[0] - v5, 0.0);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      int v8 = [WeakRetained dynamicBarAnimator:self canTransitionToState:0 byDraggingWithOffset:v6];

      if (v8)
      {
        [(_SFDynamicBarAnimator *)self _moveBarsWithDelta:v5];
        if (!self->_state) {
          self->_didHideBarsByMoving = 1;
        }
      }
    }
    self->_lastOffset = a3;
  }
}

- (void)endDraggingWithTargetOffset:(double)a3 velocity:(double)a4
{
  if (!self->_ignoresDragging)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dynamicBarAnimator:self minimumTopBarHeightForOffset:a3];
    double v9 = v8;

    if (a4 <= 0.0
      || [(_SFDynamicBarAnimator *)self canTransitionToState:0]
      || ![(_SFDynamicBarAnimator *)self _canTransitionToState:0 withMinimumTopBarHeight:v9])
    {
      [(_SFDynamicBarAnimator *)self _endDraggingWithVelocity:a4];
    }
  }
}

- (void)endScrolling
{
  if (self->_dragging) {
    [(_SFDynamicBarAnimator *)self _endDraggingWithVelocity:0.0];
  }
}

- (void)_endDraggingWithVelocity:(double)a3
{
  self->_dragging = 0;
  if (self->_didHideOrShowBarsExplicitly)
  {
    if (![(_SFDynamicBarAnimator *)self targetState]
      && [(_SFDynamicBarAnimator *)self canTransitionToState:0])
    {
      uint64_t v4 = self;
      uint64_t v5 = 0;
LABEL_8:
      [(_SFDynamicBarAnimator *)v4 attemptTransitionToState:v5 animated:1];
      return;
    }
LABEL_7:
    uint64_t v4 = self;
    uint64_t v5 = 1;
    goto LABEL_8;
  }
  if (a3 < -250.0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v7 = [WeakRetained dynamicBarAnimator:self canTransitionToState:1 byDraggingWithOffset:self->_lastOffset];

    if (v7) {
      goto LABEL_7;
    }
  }

  [(_SFDynamicBarAnimator *)self _transitionToSteadyState];
}

- (void)performBatchUpdates:(id)a3
{
  self->_performingBatchUpdates = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_performingBatchUpdates = 0;

  [(_SFDynamicBarAnimator *)self _updateOutputs];
}

- (void)setTopBarHeight:(double)a3 forState:(int64_t)a4
{
  if (self->_topBarHeightForState[a4] != a3)
  {
    self->_topBarHeightForState[a4] = a3;
    if (self->_state == a4 && !self->_displayLink)
    {
      self->_double unroundedTopBarHeight = a3;
      self->_lastUnroundedTopBarHeight = a3;
      self->_targetTopBarHeight = a3;
      [(_SFDynamicBarAnimator *)self _updateOutputs];
    }
  }
}

- (void)setBottomBarOffset:(double)a3 forState:(int64_t)a4
{
  if (self->_bottomBarOffsetForState[a4] != a3)
  {
    self->_bottomBarOffsetForState[a4] = a3;
    if (self->_state == a4) {
      [(_SFDynamicBarAnimator *)self _updateOutputs];
    }
  }
}

- (void)setMinimumTopBarHeight:(double)a3
{
  if (self->_minimumTopBarHeight != a3)
  {
    self->_minimumTopBarHeight = a3;
    [(_SFDynamicBarAnimator *)self _updateOutputs];
  }
}

- (BOOL)isTrackingDrag
{
  return self->_dragging;
}

- (int64_t)state
{
  return self->_state;
}

- (double)topBarHeight
{
  return self->_topBarHeight;
}

- (double)bottomBarOffset
{
  return self->_bottomBarOffset;
}

- (BOOL)isSendingOutputsDidChange
{
  return self->_sendingOutputsDidChange;
}

- (BOOL)ignoresDragging
{
  return self->_ignoresDragging;
}

- (void)setIgnoresDragging:(BOOL)a3
{
  self->_ignoresDragging = a3;
}

- (double)minimumTopBarHeight
{
  return self->_minimumTopBarHeight;
}

- (_SFDynamicBarAnimatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFDynamicBarAnimatorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateObservers, 0);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end