@interface CSHorizontalScrollFailureRecognizer
- (BOOL)_effectivelyEnabled;
- (BOOL)_isLocationOutOfBounds:(CGPoint)a3;
- (BOOL)_isOutOfBounds:(CGPoint)a3 forAngle:(double)a4;
- (BOOL)_isOutOfBoundsVertically:(CGPoint)a3;
- (BOOL)_recognizeForMultiTouchIfNecessary:(id)a3;
- (BOOL)allowMultiTouch;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)isEnabled;
- (BOOL)viewDebugArea;
- (CGPoint)_averagePointFromTouches;
- (CGPoint)_locationOfTouch:(id)a3 inView:(id)a4;
- (CSHorizontalScrollFailureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (UIEvent)triggeredEvent;
- (double)_computeEffectiveAngleFromMin:(double)a3 max:(double)a4;
- (double)_effectiveBottomAngle;
- (double)_effectiveTopAngle;
- (double)_maxAllowableVerticalOffsetForPoint:(CGPoint)a3;
- (double)maxAllowedBottomAngle;
- (double)maxAllowedTopAngle;
- (double)minAllowedBottomAngle;
- (double)minAllowedTopAngle;
- (id)_touchesFromEvent:(id)a3;
- (int64_t)_activeTouchCountForEvent:(id)a3;
- (unint64_t)maxAllowableVerticalOffset;
- (void)_averagePointFromTouches;
- (void)_loadFromSettings:(id)a3;
- (void)_setArmed:(BOOL)a3;
- (void)_setDebugViewsColor:(id)a3;
- (void)_setDebugViewsVisible:(BOOL)a3;
- (void)_updateEnabled;
- (void)dealloc;
- (void)reset;
- (void)setAllowMultiTouch:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setMaxAllowableVerticalOffset:(unint64_t)a3;
- (void)setMaxAllowedBottomAngle:(double)a3;
- (void)setMaxAllowedTopAngle:(double)a3;
- (void)setMinAllowedBottomAngle:(double)a3;
- (void)setMinAllowedTopAngle:(double)a3;
- (void)setState:(int64_t)a3;
- (void)setViewDebugArea:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation CSHorizontalScrollFailureRecognizer

- (CSHorizontalScrollFailureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CSHorizontalScrollFailureRecognizer;
  v4 = [(CSHorizontalScrollFailureRecognizer *)&v11 initWithTarget:a3 action:a4];
  if (v4)
  {
    v5 = +[CSLockScreenDomain rootSettings];
    v6 = [v5 horizontalScrollFailureRecognizerSettings];

    [v6 addKeyObserver:v4];
    [(CSHorizontalScrollFailureRecognizer *)v4 _loadFromSettings:v6];
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    touches = v4->_touches;
    v4->_touches = v7;

    v4->_effectiveTopAngle = 0.0;
    v4->_effectiveBottomAngle = 0.0;
    debugViews = v4->_debugViews;
    v4->_debugViews = (NSArray *)MEMORY[0x1E4F1CBF0];

    [(CSHorizontalScrollFailureRecognizer *)v4 setCancelsTouchesInView:1];
    [(CSHorizontalScrollFailureRecognizer *)v4 setDelaysTouchesBegan:0];
    [(CSHorizontalScrollFailureRecognizer *)v4 reset];
  }
  return v4;
}

- (void)dealloc
{
  [(CSHorizontalScrollFailureRecognizer *)self _setDebugViewsVisible:0];
  v3.receiver = self;
  v3.super_class = (Class)CSHorizontalScrollFailureRecognizer;
  [(CSHorizontalScrollFailureRecognizer *)&v3 dealloc];
}

- (BOOL)isEnabled
{
  return self->_externallyEnabled;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_externallyEnabled != a3)
  {
    self->_externallyEnabled = a3;
    [(CSHorizontalScrollFailureRecognizer *)self _updateEnabled];
  }
}

- (double)_effectiveTopAngle
{
  return self->_effectiveTopAngle;
}

- (double)_effectiveBottomAngle
{
  return self->_effectiveBottomAngle;
}

- (BOOL)_effectivelyEnabled
{
  return self->_armed && self->_externallyEnabled;
}

- (void)_updateEnabled
{
  v2.receiver = self;
  v2.super_class = (Class)CSHorizontalScrollFailureRecognizer;
  [(CSHorizontalScrollFailureRecognizer *)&v2 setEnabled:[(CSHorizontalScrollFailureRecognizer *)self _effectivelyEnabled]];
}

- (void)_setArmed:(BOOL)a3
{
  if (self->_armed != a3)
  {
    self->_armed = a3;
    [(CSHorizontalScrollFailureRecognizer *)self _updateEnabled];
  }
}

- (void)setState:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CSHorizontalScrollFailureRecognizer;
  -[CSHorizontalScrollFailureRecognizer setState:](&v8, sel_setState_);
  if (a3 != 3)
  {
    triggeredEvent = self->_triggeredEvent;
    self->_triggeredEvent = 0;

    if (a3)
    {
      if (a3 != 1) {
        return;
      }
      uint64_t v6 = [MEMORY[0x1E4F428B8] greenColor];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F428B8] yellowColor];
    }
    v7 = (void *)v6;
    [(CSHorizontalScrollFailureRecognizer *)self _setDebugViewsColor:v6];
  }
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)CSHorizontalScrollFailureRecognizer;
  [(CSHorizontalScrollFailureRecognizer *)&v3 reset];
  [(NSMutableSet *)self->_touches removeAllObjects];
  self->_tracking = 0;
  self->_startingLocation = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_effectiveTopAngle = 0.0;
  self->_effectiveBottomAngle = 0.0;
  [(CSHorizontalScrollFailureRecognizer *)self setState:0];
  [(CSHorizontalScrollFailureRecognizer *)self _setDebugViewsVisible:0];
}

- (BOOL)_recognizeForMultiTouchIfNecessary:(id)a3
{
  v4 = [(CSHorizontalScrollFailureRecognizer *)self view];
  if ((unint64_t)[(NSMutableSet *)self->_touches count] < 2
    || [(CSHorizontalScrollFailureRecognizer *)self allowMultiTouch])
  {
    BOOL v5 = 0;
  }
  else if ([(CSHorizontalScrollFailureRecognizer *)self state])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7 = SBLogDashBoardScrollGestures();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[CSHorizontalScrollFailureRecognizer _recognizeForMultiTouchIfNecessary:]((void **)&self->_touches, v4);
    }

    BOOL v5 = 1;
    [(CSHorizontalScrollFailureRecognizer *)self setState:1];
  }

  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [(CSHorizontalScrollFailureRecognizer *)self view];
  touches = self->_touches;
  objc_super v8 = [(CSHorizontalScrollFailureRecognizer *)self _touchesFromEvent:v5];
  [(NSMutableSet *)touches unionSet:v8];

  v9 = SBLogDashBoardScrollGestures();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v14 = [(CSHorizontalScrollFailureRecognizer *)self _touchesFromEvent:v5];
    v15 = __stringsFromTouches(v14, v6);
    v16 = __stringsFromTouches(self->_touches, v6);
    int v17 = 138412546;
    v18 = v15;
    __int16 v19 = 2112;
    v20 = v16;
    _os_log_debug_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEBUG, "HorizontalScrollFailureRecognizer - touches BEGAN: touchesFromEvent: %@, knownTouches: %@", (uint8_t *)&v17, 0x16u);
  }
  if (![(CSHorizontalScrollFailureRecognizer *)self _recognizeForMultiTouchIfNecessary:v5]&& !self->_tracking)
  {
    [(CSHorizontalScrollFailureRecognizer *)self _averagePointFromTouches];
    self->_startingLocation.x = v10;
    self->_startingLocation.y = v11;
    self->_tracking = 1;
    [(CSHorizontalScrollFailureRecognizer *)self _computeEffectiveAngleFromMin:self->_minAllowedTopAngle max:self->_maxAllowedTopAngle];
    self->_effectiveTopAngle = v12;
    [(CSHorizontalScrollFailureRecognizer *)self _computeEffectiveAngleFromMin:self->_minAllowedBottomAngle max:self->_maxAllowedBottomAngle];
    self->_effectiveBottomAngle = v13;
    [(CSHorizontalScrollFailureRecognizer *)self _setDebugViewsVisible:self->_viewDebugArea];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [(CSHorizontalScrollFailureRecognizer *)self view];
  v7 = SBLogDashBoardScrollGestures();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = [(CSHorizontalScrollFailureRecognizer *)self _touchesFromEvent:v5];
    CGFloat v10 = __stringsFromTouches(v9, v6);
    CGFloat v11 = __stringsFromTouches(self->_touches, v6);
    int v12 = 138412546;
    double v13 = v10;
    __int16 v14 = 2112;
    v15 = v11;
    _os_log_debug_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEBUG, "HorizontalScrollFailureRecognizer - touches MOVED: touches: %@, knownTouches: %@", (uint8_t *)&v12, 0x16u);
  }
  if (![(CSHorizontalScrollFailureRecognizer *)self state])
  {
    [(CSHorizontalScrollFailureRecognizer *)self _averagePointFromTouches];
    if (-[CSHorizontalScrollFailureRecognizer _isLocationOutOfBounds:](self, "_isLocationOutOfBounds:"))
    {
      objc_super v8 = SBLogDashBoardScrollGestures();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1D839D000, v8, OS_LOG_TYPE_INFO, "HorizontalScrollFailureRecognizer - beginning recognitition due to location out of bounds.", (uint8_t *)&v12, 2u);
      }

      [(CSHorizontalScrollFailureRecognizer *)self setState:1];
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  v9 = [(CSHorizontalScrollFailureRecognizer *)self view];
  [(NSMutableSet *)self->_touches minusSet:v8];

  CGFloat v10 = SBLogDashBoardScrollGestures();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v12 = [(CSHorizontalScrollFailureRecognizer *)self _touchesFromEvent:v7];
    double v13 = __stringsFromTouches(v12, v9);
    __int16 v14 = __stringsFromTouches(self->_touches, v9);
    int v15 = 138412546;
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    v18 = v14;
    _os_log_debug_impl(&dword_1D839D000, v10, OS_LOG_TYPE_DEBUG, "HorizontalScrollFailureRecognizer - touches ENDED: touchesFromEvent: %@, knownTouches: %@", (uint8_t *)&v15, 0x16u);
  }
  if (![(NSMutableSet *)self->_touches count])
  {
    if ([(CSHorizontalScrollFailureRecognizer *)self state])
    {
      objc_storeStrong((id *)&self->_triggeredEvent, a4);
      uint64_t v11 = 3;
    }
    else
    {
      uint64_t v11 = 5;
    }
    [(CSHorizontalScrollFailureRecognizer *)self setState:v11];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSHorizontalScrollFailureRecognizer *)self view];
  [(NSMutableSet *)self->_touches minusSet:v7];

  v9 = SBLogDashBoardScrollGestures();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = [(CSHorizontalScrollFailureRecognizer *)self _touchesFromEvent:v6];
    int v12 = __stringsFromTouches(v11, v8);
    double v13 = __stringsFromTouches(self->_touches, v8);
    int v14 = 138412546;
    int v15 = v12;
    __int16 v16 = 2112;
    __int16 v17 = v13;
    _os_log_debug_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEBUG, "HorizontalScrollFailureRecognizer - touches CANCELLED: touchesFromEvent: %@, knownTouches: %@", (uint8_t *)&v14, 0x16u);
  }
  if (![(NSMutableSet *)self->_touches count])
  {
    if ([(CSHorizontalScrollFailureRecognizer *)self state]) {
      uint64_t v10 = 4;
    }
    else {
      uint64_t v10 = 5;
    }
    [(CSHorizontalScrollFailureRecognizer *)self setState:v10];
  }
}

- (CGPoint)_locationOfTouch:(id)a3 inView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSHorizontalScrollFailureRecognizer *)self view];
  v9 = [v8 window];
  uint64_t v10 = [v9 screen];
  [v7 locationInView:v8];
  double v12 = v11;
  double v14 = v13;

  objc_msgSend(v9, "convertPoint:fromCoordinateSpace:", v8, v12, v14);
  double v16 = v15;
  double v18 = v17;
  uint64_t v19 = [v10 coordinateSpace];
  objc_msgSend(v19, "convertPoint:fromCoordinateSpace:", v9, v16, v18);
  double v21 = v20;
  double v23 = v22;

  v24 = [v6 window];
  v25 = [v10 coordinateSpace];
  objc_msgSend(v24, "convertPoint:fromCoordinateSpace:", v25, v21, v23);
  double v27 = v26;
  double v29 = v28;

  objc_msgSend(v6, "convertPoint:fromCoordinateSpace:", v24, v27, v29);
  double v31 = v30;
  double v33 = v32;

  double v34 = v31;
  double v35 = v33;
  result.y = v35;
  result.x = v34;
  return result;
}

- (id)_touchesFromEvent:(id)a3
{
  return (id)[a3 touchesForGestureRecognizer:self];
}

- (void)_loadFromSettings:(id)a3
{
  id v4 = a3;
  -[CSHorizontalScrollFailureRecognizer _setArmed:](self, "_setArmed:", [v4 enabled]);
  -[CSHorizontalScrollFailureRecognizer setViewDebugArea:](self, "setViewDebugArea:", [v4 viewDebugArea]);
  -[CSHorizontalScrollFailureRecognizer setMaxAllowableVerticalOffset:](self, "setMaxAllowableVerticalOffset:", [v4 maxAllowableVerticalOffset]);
  [v4 topAngle];
  -[CSHorizontalScrollFailureRecognizer setMaxAllowedTopAngle:](self, "setMaxAllowedTopAngle:");
  [v4 topAngle];
  -[CSHorizontalScrollFailureRecognizer setMinAllowedTopAngle:](self, "setMinAllowedTopAngle:");
  [v4 bottomAngle];
  -[CSHorizontalScrollFailureRecognizer setMaxAllowedBottomAngle:](self, "setMaxAllowedBottomAngle:");
  [v4 bottomAngle];
  double v6 = v5;

  [(CSHorizontalScrollFailureRecognizer *)self setMinAllowedBottomAngle:v6];
}

- (int64_t)_activeTouchCountForEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(CSHorizontalScrollFailureRecognizer *)self _touchesFromEvent:a3];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) phase] < 3) {
          ++v6;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (CGPoint)_averagePointFromTouches
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(CSHorizontalScrollFailureRecognizer *)self view];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = self->_touches;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v20;
    double v9 = 0.0;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        -[CSHorizontalScrollFailureRecognizer _locationOfTouch:inView:](self, "_locationOfTouch:inView:", *(void *)(*((void *)&v19 + 1) + 8 * i), v3, (void)v19);
        double v10 = v10 + v12;
        double v9 = v9 + v13;
      }
      v7 += v6;
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);

    double v14 = v10 / (double)v7;
    double v15 = v9 / (double)v7;
  }
  else
  {

    double v14 = *MEMORY[0x1E4F1DAD8];
    double v15 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v16 = SBLogDashBoardScrollGestures();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    [(CSHorizontalScrollFailureRecognizer *)v14 _averagePointFromTouches];
  }

  double v17 = v14;
  double v18 = v15;
  result.y = v18;
  result.x = v17;
  return result;
}

- (double)_computeEffectiveAngleFromMin:(double)a3 max:(double)a4
{
  int v7 = [(CSHorizontalScrollFailureRecognizer *)self view];
  uint64_t v8 = v7;
  if (vabdd_f64(a4, a3) > 0.001)
  {
    [v7 bounds];
    a4 = self->_startingLocation.x * ((a4 - a3) / v9);
  }

  return a4;
}

- (BOOL)_isOutOfBoundsVertically:(CGPoint)a3
{
  double v3 = floor(vabdd_f64(a3.y, self->_startingLocation.y));
  [(CSHorizontalScrollFailureRecognizer *)self _maxAllowableVerticalOffsetForPoint:a3.x];
  return v3 > v4;
}

- (double)_maxAllowableVerticalOffsetForPoint:(CGPoint)a3
{
  double y = a3.y;
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2) {
      return (double)self->_maxAllowableVerticalOffset;
    }
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if (v7 != 1) {
      return (double)self->_maxAllowableVerticalOffset;
    }
  }
  uint64_t v8 = [MEMORY[0x1E4F42D90] mainScreen];
  [v8 bounds];
  double v10 = v9;

  double v11 = fabs(y + v10 * -0.5);
  return (double)self->_maxAllowableVerticalOffset / 3.0
       + (1.0 - (v11 + v11) / v10)
       * (((double)self->_maxAllowableVerticalOffset + (double)self->_maxAllowableVerticalOffset)
        / 3.0);
}

- (BOOL)_isOutOfBounds:(CGPoint)a3 forAngle:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  BOOL v8 = -[CSHorizontalScrollFailureRecognizer _isOutOfBoundsVertically:](self, "_isOutOfBoundsVertically:");
  if (v8)
  {
    double v9 = fabs(tan(a4 * 0.0174532925)) * vabdd_f64(x, self->_startingLocation.x) + 0.0;
    double v10 = floor(vabdd_f64(y, self->_startingLocation.y));
    -[CSHorizontalScrollFailureRecognizer _maxAllowableVerticalOffsetForPoint:](self, "_maxAllowableVerticalOffsetForPoint:", x, y);
    LOBYTE(v8) = v10 - v11 > v9;
  }
  return v8;
}

- (BOOL)_isLocationOutOfBounds:(CGPoint)a3
{
  return -[CSHorizontalScrollFailureRecognizer _isOutOfBounds:forAngle:](self, "_isOutOfBounds:forAngle:", a3.x);
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (void)_setDebugViewsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v5 = self->_debugViews;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v36 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v7);
  }

  if (v3)
  {
    double v10 = [(CSHorizontalScrollFailureRecognizer *)self view];
    double x = self->_startingLocation.x;
    double y = self->_startingLocation.y;
    -[CSHorizontalScrollFailureRecognizer _maxAllowableVerticalOffsetForPoint:](self, "_maxAllowableVerticalOffsetForPoint:", x, y);
    double v14 = v13;
    double v15 = y - v13;
    [v10 bounds];
    double v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", 0.0, v15, v16, v14 + v14);
    double v18 = [MEMORY[0x1E4F428B8] yellowColor];
    [v17 setBackgroundColor:v18];

    long long v19 = -[SBHorizontalScrollFailureTriangleView initWithStyle:recognizer:forPoint:withMaxVerticalOffset:inView:pointingRight:]([SBHorizontalScrollFailureTriangleView alloc], "initWithStyle:recognizer:forPoint:withMaxVerticalOffset:inView:pointingRight:", 0, self, v10, 1, x, y, v14);
    long long v20 = -[SBHorizontalScrollFailureTriangleView initWithStyle:recognizer:forPoint:withMaxVerticalOffset:inView:pointingRight:]([SBHorizontalScrollFailureTriangleView alloc], "initWithStyle:recognizer:forPoint:withMaxVerticalOffset:inView:pointingRight:", 0, self, v10, 0, x, y, v14);
    long long v21 = -[SBHorizontalScrollFailureTriangleView initWithStyle:recognizer:forPoint:withMaxVerticalOffset:inView:pointingRight:]([SBHorizontalScrollFailureTriangleView alloc], "initWithStyle:recognizer:forPoint:withMaxVerticalOffset:inView:pointingRight:", 1, self, v10, 1, x, y, v14);
    long long v22 = -[SBHorizontalScrollFailureTriangleView initWithStyle:recognizer:forPoint:withMaxVerticalOffset:inView:pointingRight:]([SBHorizontalScrollFailureTriangleView alloc], "initWithStyle:recognizer:forPoint:withMaxVerticalOffset:inView:pointingRight:", 1, self, v10, 0, x, y, v14);
    v41[0] = v17;
    v41[1] = v20;
    double v31 = v19;
    v41[2] = v19;
    v41[3] = v22;
    v41[4] = v21;
    double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:5];
    debugViews = self->_debugViews;
    self->_debugViews = v23;

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v25 = self->_debugViews;
    uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v33 != v28) {
            objc_enumerationMutation(v25);
          }
          double v30 = *(void **)(*((void *)&v32 + 1) + 8 * j);
          [v30 setUserInteractionEnabled:0];
          [v10 addSubview:v30];
          [v30 setAlpha:0.5];
        }
        uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v27);
    }
  }
}

- (void)_setDebugViewsColor:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_debugViews;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        double v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v10 setContentColor:v4];
        }
        else {
          objc_msgSend(v10, "setBackgroundColor:", v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (BOOL)allowMultiTouch
{
  return self->_allowMultiTouch;
}

- (void)setAllowMultiTouch:(BOOL)a3
{
  self->_allowMultiTouch = a3;
}

- (unint64_t)maxAllowableVerticalOffset
{
  return self->_maxAllowableVerticalOffset;
}

- (void)setMaxAllowableVerticalOffset:(unint64_t)a3
{
  self->_maxAllowableVerticalOffset = a3;
}

- (double)maxAllowedTopAngle
{
  return self->_maxAllowedTopAngle;
}

- (void)setMaxAllowedTopAngle:(double)a3
{
  self->_maxAllowedTopAngle = a3;
}

- (double)minAllowedTopAngle
{
  return self->_minAllowedTopAngle;
}

- (void)setMinAllowedTopAngle:(double)a3
{
  self->_minAllowedTopAngle = a3;
}

- (double)maxAllowedBottomAngle
{
  return self->_maxAllowedBottomAngle;
}

- (void)setMaxAllowedBottomAngle:(double)a3
{
  self->_maxAllowedBottomAngle = a3;
}

- (double)minAllowedBottomAngle
{
  return self->_minAllowedBottomAngle;
}

- (void)setMinAllowedBottomAngle:(double)a3
{
  self->_minAllowedBottomAngle = a3;
}

- (BOOL)viewDebugArea
{
  return self->_viewDebugArea;
}

- (void)setViewDebugArea:(BOOL)a3
{
  self->_viewDebugArea = a3;
}

- (UIEvent)triggeredEvent
{
  return self->_triggeredEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggeredEvent, 0);
  objc_storeStrong((id *)&self->_debugViews, 0);

  objc_storeStrong((id *)&self->_touches, 0);
}

- (void)_recognizeForMultiTouchIfNecessary:(void *)a1 .cold.1(void **a1, void *a2)
{
  objc_super v2 = __stringsFromTouches(*a1, a2);
  OUTLINED_FUNCTION_0_3(&dword_1D839D000, v3, v4, "HorizontalScrollFailureRecognizer - begining recognition for multi-touch: %@", v5, v6, v7, v8, 2u);
}

- (void)_averagePointFromTouches
{
  objc_super v2 = NSStringFromCGPoint(*(CGPoint *)&a1);
  OUTLINED_FUNCTION_0_3(&dword_1D839D000, v3, v4, "FAILURE RECOGNIZER - averagePointFromTouches: %@", v5, v6, v7, v8, 2u);
}

@end