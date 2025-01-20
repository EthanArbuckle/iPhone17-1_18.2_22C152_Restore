@interface FMMapGestureRecognizer
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)isRTLOrientation;
- (BOOL)isSwipeEnabled;
- (BOOL)isSwipingFromTheEdge;
- (BOOL)isSwipingGestureEnded;
- (BOOL)isTrackingTouches;
- (CGPoint)initialTouchLocation;
- (CGPoint)lastTouchPoint;
- (FMMapGestureRecognizer)init;
- (FMMapGestureRecognizerDelegate)touchDelegate;
- (NSMutableArray)otherGestures;
- (NSTimer)doubleTapTimer;
- (UITouch)previousTouch;
- (double)distanceBetweenPointA:(CGPoint)a3 andPointB:(CGPoint)a4;
- (double)swipeThreshold;
- (double)velocity;
- (int)touchRadius;
- (void)dealloc;
- (void)finishSwipeGesture:(double)a3;
- (void)invalidateGesture;
- (void)mapTappedTimer;
- (void)reset;
- (void)setDoubleTapTimer:(id)a3;
- (void)setInitialTouchLocation:(CGPoint)a3;
- (void)setIsRTLOrientation:(BOOL)a3;
- (void)setIsSwipeEnabled:(BOOL)a3;
- (void)setIsSwipingFromTheEdge:(BOOL)a3;
- (void)setIsSwipingGestureEnded:(BOOL)a3;
- (void)setIsTrackingTouches:(BOOL)a3;
- (void)setLastTouchPoint:(CGPoint)a3;
- (void)setOtherGestures:(id)a3;
- (void)setPreviousTouch:(id)a3;
- (void)setSwipeThreshold:(double)a3;
- (void)setTouchDelegate:(id)a3;
- (void)setTouchRadius:(int)a3;
- (void)setVelocity:(double)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation FMMapGestureRecognizer

- (FMMapGestureRecognizer)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMMapGestureRecognizer;
  v2 = [(FMMapGestureRecognizer *)&v5 init];
  [(FMMapGestureRecognizer *)v2 setTouchRadius:20];
  if (v2)
  {
    [(FMMapGestureRecognizer *)v2 setCancelsTouchesInView:0];
    v3 = objc_opt_new();
    [(FMMapGestureRecognizer *)v2 setOtherGestures:v3];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(FMMapGestureRecognizer *)self doubleTapTimer];
  [v3 invalidate];

  [(FMMapGestureRecognizer *)self setDoubleTapTimer:0];
  v4.receiver = self;
  v4.super_class = (Class)FMMapGestureRecognizer;
  [(FMMapGestureRecognizer *)&v4 dealloc];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  double v6 = 0.0;
  [(FMMapGestureRecognizer *)self setVelocity:0.0];
  [(FMMapGestureRecognizer *)self setIsTrackingTouches:1];
  v7 = [(FMMapGestureRecognizer *)self view];
  [v7 frame];
  [(FMMapGestureRecognizer *)self setSwipeThreshold:v8 * 0.600000024];

  v9 = [MEMORY[0x263F1C408] sharedApplication];
  -[FMMapGestureRecognizer setIsRTLOrientation:](self, "setIsRTLOrientation:", [v9 userInterfaceLayoutDirection] == 1);

  double v10 = 30.0;
  if ([(FMMapGestureRecognizer *)self isRTLOrientation])
  {
    v11 = [(FMMapGestureRecognizer *)self view];
    [v11 frame];
    double v6 = v12 + -30.0;

    v13 = [(FMMapGestureRecognizer *)self view];
    [v13 frame];
    double v10 = v14;
  }
  id v22 = [(FMMapGestureRecognizer *)self touchDelegate];
  v15 = [v5 allObjects];

  v16 = [v15 objectAtIndexedSubscript:0];

  v17 = [(FMMapGestureRecognizer *)self view];
  [v16 locationInView:v17];
  -[FMMapGestureRecognizer setInitialTouchLocation:](self, "setInitialTouchLocation:");

  if ([(FMMapGestureRecognizer *)self isSwipeEnabled]
    && ([(FMMapGestureRecognizer *)self initialTouchLocation], v18 <= v10))
  {
    [(FMMapGestureRecognizer *)self initialTouchLocation];
    BOOL v19 = v20 >= v6;
  }
  else
  {
    BOOL v19 = 0;
  }
  [(FMMapGestureRecognizer *)self setIsSwipingFromTheEdge:v19];
  [(FMMapGestureRecognizer *)self setIsSwipingGestureEnded:0];
  if ((unint64_t)[(FMMapGestureRecognizer *)self numberOfTouches] >= 2) {
    [(FMMapGestureRecognizer *)self setIsSwipingFromTheEdge:0];
  }
  if ([(FMMapGestureRecognizer *)self isSwipingFromTheEdge]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v22 mapSwipedBegin:self];
  }
  if (objc_opt_respondsToSelector()) {
    [v22 mapTouchBegan:self];
  }
  v21 = [(FMMapGestureRecognizer *)self view];
  [v16 locationInView:v21];
  -[FMMapGestureRecognizer setLastTouchPoint:](self, "setLastTouchPoint:");
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5 = [(FMMapGestureRecognizer *)self touchDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 mapTouchCancelled:self];
  }
  [(FMMapGestureRecognizer *)self finishSwipeGesture:0.0];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v5 = a3;
  double v6 = [(FMMapGestureRecognizer *)self touchDelegate];
  v7 = [v5 allObjects];
  double v8 = [v7 objectAtIndexedSubscript:0];

  v9 = [(FMMapGestureRecognizer *)self view];
  [v8 locationInView:v9];
  double v11 = v10;
  double v13 = v12;

  [(FMMapGestureRecognizer *)self initialTouchLocation];
  -[FMMapGestureRecognizer distanceBetweenPointA:andPointB:](self, "distanceBetweenPointA:andPointB:");
  double v15 = v14;
  v16 = [(FMMapGestureRecognizer *)self previousTouch];
  v17 = [(FMMapGestureRecognizer *)self view];
  [v16 locationInView:v17];
  double v19 = v18;
  double v21 = v20;

  -[FMMapGestureRecognizer distanceBetweenPointA:andPointB:](self, "distanceBetweenPointA:andPointB:", v11, v13, v19, v21);
  double v23 = v22;
  v24 = [v5 anyObject];
  v25 = [v24 view];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v26 = [v5 anyObject];
    v27 = [v26 view];
    [v6 calloutButtonTapped:v27];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v62 = v5;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      v28 = [v25 subviews];
      uint64_t v29 = [v28 countByEnumeratingWithState:&v66 objects:v70 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v67;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v67 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = *(void **)(*((void *)&v66 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v33 frame];
              CGFloat v35 = v34;
              CGFloat v37 = v36;
              CGFloat v39 = v38;
              CGFloat v41 = v40;
              [v8 locationInView:v25];
              v72.x = v42;
              v72.y = v43;
              v73.origin.x = v35;
              v73.origin.y = v37;
              v73.size.width = v39;
              v73.size.height = v41;
              if (CGRectContainsPoint(v73, v72) && (objc_opt_respondsToSelector() & 1) != 0) {
                [v6 userLocationTapped:v25];
              }
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v66 objects:v70 count:16];
        }
        while (v30);
      }

      id v5 = v62;
    }
  }
  if (v15 < (double)[(FMMapGestureRecognizer *)self touchRadius])
  {
    v44 = [v8 view];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v46 = [(FMMapGestureRecognizer *)self previousTouch];

      if (v46)
      {
        if (v23 >= (double)[(FMMapGestureRecognizer *)self touchRadius]
          || (unint64_t)[v8 tapCount] < 2)
        {
          v48 = [MEMORY[0x263EFFA20] timerWithTimeInterval:self target:sel_mapTappedTimer selector:0 userInfo:0 repeats:0.25];
          [(FMMapGestureRecognizer *)self setDoubleTapTimer:v48];

          v49 = [MEMORY[0x263EFF9F0] currentRunLoop];
          v50 = [(FMMapGestureRecognizer *)self doubleTapTimer];
          [v49 addTimer:v50 forMode:*MEMORY[0x263EFF588]];
        }
        else
        {
          v47 = [(FMMapGestureRecognizer *)self doubleTapTimer];
          [v47 invalidate];

          [(FMMapGestureRecognizer *)self setDoubleTapTimer:0];
          if (objc_opt_respondsToSelector()) {
            [v6 mapDoubleTapped:self];
          }
        }
        [(FMMapGestureRecognizer *)self setPreviousTouch:0];
      }
      else
      {
        v51 = [MEMORY[0x263EFFA20] timerWithTimeInterval:self target:sel_mapTappedTimer selector:0 userInfo:0 repeats:0.25];
        [(FMMapGestureRecognizer *)self setDoubleTapTimer:v51];

        v52 = [MEMORY[0x263EFF9F0] currentRunLoop];
        v53 = [(FMMapGestureRecognizer *)self doubleTapTimer];
        [v52 addTimer:v53 forMode:*MEMORY[0x263EFF588]];
      }
      [(FMMapGestureRecognizer *)self setPreviousTouch:v8];
    }
  }
  if ([(FMMapGestureRecognizer *)self isSwipingFromTheEdge])
  {
    [(FMMapGestureRecognizer *)self velocity];
    if (v54 <= 14.0)
    {
      if ([(FMMapGestureRecognizer *)self isRTLOrientation])
      {
        v56 = [(FMMapGestureRecognizer *)self view];
        [v56 frame];
        double v58 = v57 - v11;
        [(FMMapGestureRecognizer *)self swipeThreshold];
        [(FMMapGestureRecognizer *)self finishSwipeGesture:v58 / v59];
      }
      else
      {
        [(FMMapGestureRecognizer *)self swipeThreshold];
        [(FMMapGestureRecognizer *)self finishSwipeGesture:v11 / v60];
      }
    }
    else
    {
      v55 = (void *)MEMORY[0x263F1CB60];
      v63[0] = MEMORY[0x263EF8330];
      v63[1] = 3221225472;
      v63[2] = __49__FMMapGestureRecognizer_touchesEnded_withEvent___block_invoke;
      v63[3] = &unk_2643350A0;
      id v64 = v6;
      v65 = self;
      [v55 animateWithDuration:v63 animations:0.3];
    }
  }
  v61 = objc_opt_new();
  [(FMMapGestureRecognizer *)self setOtherGestures:v61];

  if (objc_opt_respondsToSelector()) {
    [v6 mapTouchEnded:self];
  }
  [(FMMapGestureRecognizer *)self setIsTrackingTouches:0];
}

uint64_t __49__FMMapGestureRecognizer_touchesEnded_withEvent___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    [*(id *)(a1 + 32) mapSwiped:*(void *)(a1 + 40) withPercent:1.0];
    v3 = *(void **)(a1 + 40);
    return [v3 finishSwipeGesture:1.0];
  }
  return result;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v27 = a3;
  id v5 = [(FMMapGestureRecognizer *)self touchDelegate];
  double v6 = [v27 allObjects];
  v7 = [v6 objectAtIndexedSubscript:0];

  double v8 = [(FMMapGestureRecognizer *)self view];
  [v7 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  [(FMMapGestureRecognizer *)self initialTouchLocation];
  -[FMMapGestureRecognizer distanceBetweenPointA:andPointB:](self, "distanceBetweenPointA:andPointB:");
  double v14 = v13;
  if ([(FMMapGestureRecognizer *)self isTrackingTouches]
    && v14 > (double)[(FMMapGestureRecognizer *)self touchRadius]
    && ![(FMMapGestureRecognizer *)self isSwipingGestureEnded])
  {
    if ([(FMMapGestureRecognizer *)self isSwipingFromTheEdge])
    {
      [(FMMapGestureRecognizer *)self swipeThreshold];
      double v16 = v15;
      if ([(FMMapGestureRecognizer *)self isRTLOrientation])
      {
        v17 = [(FMMapGestureRecognizer *)self view];
        [v17 frame];
        double v19 = v18 - v10;
        [(FMMapGestureRecognizer *)self swipeThreshold];
        double v21 = v19 / v20;

        double v22 = fmin(v21, 1.0);
      }
      else
      {
        double v22 = fmin(v10 / v16, 1.0);
      }
      if ((unint64_t)[v27 count] > 1)
      {
        double v23 = self;
        goto LABEL_16;
      }
      if (objc_opt_respondsToSelector()) {
        [v5 mapSwiped:self withPercent:v22];
      }
      if (v22 == 1.0)
      {
        double v23 = self;
LABEL_16:
        -[FMMapGestureRecognizer finishSwipeGesture:](v23, "finishSwipeGesture:");
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      [v5 mapTouchMoved:self];
    }
  }
  [(FMMapGestureRecognizer *)self lastTouchPoint];
  -[FMMapGestureRecognizer distanceBetweenPointA:andPointB:](self, "distanceBetweenPointA:andPointB:", v10, v12, v24, v25);
  -[FMMapGestureRecognizer setVelocity:](self, "setVelocity:");
  v26 = [(FMMapGestureRecognizer *)self view];
  [v7 locationInView:v26];
  -[FMMapGestureRecognizer setLastTouchPoint:](self, "setLastTouchPoint:");
}

- (void)finishSwipeGesture:(double)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = [(FMMapGestureRecognizer *)self touchDelegate];
  if ([(FMMapGestureRecognizer *)self isSwipingFromTheEdge])
  {
    [(FMMapGestureRecognizer *)self setIsSwipingFromTheEdge:0];
    double v6 = [(FMMapGestureRecognizer *)self doubleTapTimer];
    [v6 invalidate];

    if (objc_opt_respondsToSelector()) {
      [v5 mapSwipedEnd:self withPercent:a3];
    }
    [(FMMapGestureRecognizer *)self setEnabled:0];
    [(FMMapGestureRecognizer *)self setEnabled:1];
    [(FMMapGestureRecognizer *)self setIsSwipingGestureEnded:1];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = [(FMMapGestureRecognizer *)self otherGestures];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) setEnabled:1];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)mapTappedTimer
{
  id v3 = [(FMMapGestureRecognizer *)self touchDelegate];
  if (objc_opt_respondsToSelector()) {
    [v3 mapTapped:self];
  }
}

- (void)invalidateGesture
{
}

- (double)distanceBetweenPointA:(CGPoint)a3 andPointB:(CGPoint)a4
{
  return sqrt((a4.y - a3.y) * (a4.y - a3.y) + (a4.x - a3.x) * (a4.x - a3.x));
}

- (void)reset
{
  id v3 = (id)objc_opt_new();
  [(FMMapGestureRecognizer *)self setOtherGestures:v3];
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = [(FMMapGestureRecognizer *)self otherGestures];
  [v5 addObject:v4];

  objc_msgSend(v4, "setEnabled:", -[FMMapGestureRecognizer isSwipingFromTheEdge](self, "isSwipingFromTheEdge") ^ 1);
  return 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (FMMapGestureRecognizerDelegate)touchDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchDelegate);
  return (FMMapGestureRecognizerDelegate *)WeakRetained;
}

- (void)setTouchDelegate:(id)a3
{
}

- (int)touchRadius
{
  return self->_touchRadius;
}

- (void)setTouchRadius:(int)a3
{
  self->_touchRadius = a3;
}

- (BOOL)isSwipeEnabled
{
  return self->_isSwipeEnabled;
}

- (void)setIsSwipeEnabled:(BOOL)a3
{
  self->_isSwipeEnabled = a3;
}

- (CGPoint)initialTouchLocation
{
  double x = self->_initialTouchLocation.x;
  double y = self->_initialTouchLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialTouchLocation:(CGPoint)a3
{
  self->_initialTouchLocation = a3;
}

- (UITouch)previousTouch
{
  return self->_previousTouch;
}

- (void)setPreviousTouch:(id)a3
{
}

- (CGPoint)lastTouchPoint
{
  double x = self->_lastTouchPoint.x;
  double y = self->_lastTouchPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastTouchPoint:(CGPoint)a3
{
  self->_lastTouchPoint = a3;
}

- (double)swipeThreshold
{
  return self->_swipeThreshold;
}

- (void)setSwipeThreshold:(double)a3
{
  self->_swipeThreshold = a3;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(double)a3
{
  self->_velocitdouble y = a3;
}

- (BOOL)isTrackingTouches
{
  return self->_isTrackingTouches;
}

- (void)setIsTrackingTouches:(BOOL)a3
{
  self->_isTrackingTouches = a3;
}

- (BOOL)isSwipingFromTheEdge
{
  return self->_isSwipingFromTheEdge;
}

- (void)setIsSwipingFromTheEdge:(BOOL)a3
{
  self->_isSwipingFromTheEdge = a3;
}

- (BOOL)isSwipingGestureEnded
{
  return self->_isSwipingGestureEnded;
}

- (void)setIsSwipingGestureEnded:(BOOL)a3
{
  self->_isSwipingGestureEnded = a3;
}

- (BOOL)isRTLOrientation
{
  return self->_isRTLOrientation;
}

- (void)setIsRTLOrientation:(BOOL)a3
{
  self->_isRTLOrientation = a3;
}

- (NSMutableArray)otherGestures
{
  return self->_otherGestures;
}

- (void)setOtherGestures:(id)a3
{
}

- (NSTimer)doubleTapTimer
{
  return self->_doubleTapTimer;
}

- (void)setDoubleTapTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleTapTimer, 0);
  objc_storeStrong((id *)&self->_otherGestures, 0);
  objc_storeStrong((id *)&self->_previousTouch, 0);
  objc_destroyWeak((id *)&self->_touchDelegate);
}

@end