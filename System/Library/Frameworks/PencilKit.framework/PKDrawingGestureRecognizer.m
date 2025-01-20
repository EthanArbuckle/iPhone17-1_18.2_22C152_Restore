@interface PKDrawingGestureRecognizer
+ (unint64_t)activeInputPropertiesForTouch:(id)a3 event:(id)a4;
- (BOOL)_shouldBeginDrawing:(id)a3 withEvent:(id)a4;
- (BOOL)isReplaying;
- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3;
- (CGRect)currentBoundingBoxInWindow;
- (PKDrawingGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (PKDrawingGestureTarget)drawingTarget;
- (UITouch)drawingTouch;
- (double)startTimeInterval;
- (double)thresholdDistance;
- (unint64_t)activeInputProperties;
- (void)_beginDrawingWithTouch:(id)a3;
- (void)_cancelDrawing;
- (void)_drawingBegan;
- (void)_drawingCancelled;
- (void)_drawingEnded;
- (void)_drawingMoved:(id)a3;
- (void)_endDrawing;
- (void)_updateDrawingWithEvent:(id)a3;
- (void)reset;
- (void)setDrawingTarget:(id)a3;
- (void)setDrawingTouch:(id)a3;
- (void)setThresholdDistance:(double)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesEstimatedPropertiesUpdated:(id)a3;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation PKDrawingGestureRecognizer

- (PKDrawingGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKDrawingGestureRecognizer;
  v4 = [(PKDrawingGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(PKDrawingGestureRecognizer *)v4 setCancelsTouchesInView:0];
    [(PKDrawingGestureRecognizer *)v5 setDelaysTouchesEnded:0];
    [(PKDrawingGestureRecognizer *)v5 setRequiresExclusiveTouchType:0];
    [(PKDrawingGestureRecognizer *)v5 setThresholdDistance:163.0];
  }
  return v5;
}

- (void)setThresholdDistance:(double)a3
{
  if (self->_thresholdDistance != a3)
  {
    self->_thresholdDistance = a3;
    self->_squaredThreshold = a3 * a3;
  }
}

- (void)setDrawingTarget:(id)a3
{
}

+ (unint64_t)activeInputPropertiesForTouch:(id)a3 event:(id)a4
{
  return objc_msgSend(a4, "PK_activeInputPropertiesForTouch:", a3);
}

- (BOOL)_shouldBeginDrawing:(id)a3 withEvent:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
      v14 = [(PKDrawingGestureRecognizer *)self allowedTouchTypes];
      v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "type"));
      char v16 = [v14 containsObject:v15];

      if (v16) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    v19 = [(PKDrawingGestureRecognizer *)self delegate];
    char v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) == 0
      || ([(PKDrawingGestureRecognizer *)self delegate],
          v21 = objc_claimAutoreleasedReturnValue(),
          char v22 = [v21 drawingGestureRecognizer:self shouldBeginDrawingWithTouches:v8 event:v7],
          v21,
          (v22 & 1) != 0))
    {
      BOOL v23 = 1;
      goto LABEL_18;
    }
    v17 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      v18 = "shouldBeginDrawingWithTouches returned NO";
      goto LABEL_16;
    }
  }
  else
  {
LABEL_9:

    v17 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      v18 = "Allowed touch type not found";
LABEL_16:
      _os_log_impl(&dword_1C44F8000, v17, OS_LOG_TYPE_DEFAULT, v18, v25, 2u);
    }
  }

  BOOL v23 = 0;
LABEL_18:

  return v23;
}

- (BOOL)isReplaying
{
  return 0;
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.pencilkit", "Sketching");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "Touches drawing", buf, 2u);
  }

  if ([(PKDrawingGestureRecognizer *)self state]
    || [(PKDrawingGestureRecognizer *)self _shouldBeginDrawing:v6 withEvent:v7])
  {
    uint64_t v9 = [v6 objectsPassingTest:&__block_literal_global_25];
    uint64_t v10 = [v9 anyObject];

    if (v10)
    {
      self->_gestureDetected = 1;
      self->_activeInputProperties = objc_msgSend(v7, "PK_activeInputPropertiesForTouch:", v10);
      [(PKDrawingGestureRecognizer *)self _beginDrawingWithTouch:v10];
    }
    else if (!self->_ignoreFingerTouchesUntilReset)
    {
      if (self->_drawingTouch || (unint64_t)[v6 count] >= 2)
      {
        if (!self->_gestureDetected)
        {
          uint64_t v11 = os_log_create("com.apple.pencilkit", "Sketching");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v14 = 0;
            _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEFAULT, "Multiple touches cancel drawing", v14, 2u);
          }

          [(PKDrawingGestureRecognizer *)self _cancelDrawing];
        }
      }
      else if (!self->_drawingTargetIsDrawing)
      {
        v13 = [v6 anyObject];
        self->_activeInputProperties = objc_msgSend(v7, "PK_activeInputPropertiesForTouch:", v13);
        [(PKDrawingGestureRecognizer *)self _beginDrawingWithTouch:v13];
      }
    }
  }
  else
  {
    uint64_t v12 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1C44F8000, v12, OS_LOG_TYPE_DEFAULT, "Drawing should not begin so cancelDrawing", v15, 2u);
    }

    [(PKDrawingGestureRecognizer *)self _cancelDrawing];
  }
}

BOOL __53__PKDrawingGestureRecognizer_touchesBegan_withEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 2;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  if ([a3 containsObject:self->_drawingTouch])
  {
    if (self->_drawingTargetIsDrawing) {
      [(PKDrawingGestureRecognizer *)self _updateDrawingWithEvent:v6];
    }
    else {
      [(PKDrawingGestureRecognizer *)self _beginDrawingWithTouch:self->_drawingTouch];
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if (objc_msgSend(a3, "containsObject:", self->_drawingTouch, a4))
  {
    v5 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Touches cancelled", v6, 2u);
    }

    [(PKDrawingGestureRecognizer *)self _cancelDrawing];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (objc_msgSend(a3, "containsObject:", self->_drawingTouch, a4))
  {
    v5 = [(PKDrawingGestureRecognizer *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(PKDrawingGestureRecognizer *)self delegate];
      [v7 drawingGestureRecognizer:self touchesEndedWithDrawingTouch:self->_drawingTouch];
    }
    [(PKDrawingGestureRecognizer *)self _endDrawing];
  }
}

- (void)touchesEstimatedPropertiesUpdated:(id)a3
{
  id v4 = a3;
  id v5 = [(PKDrawingGestureRecognizer *)self drawingTarget];
  [v5 drawingEstimatedPropertiesUpdated:v4];
}

- (void)_beginDrawingWithTouch:(id)a3
{
  uint64_t v11 = (UITouch *)a3;
  if (self->_drawingTargetIsDrawing)
  {
    if (self->_drawingTouch == v11) {
      goto LABEL_13;
    }
    [(PKDrawingGestureRecognizer *)self _drawingCancelled];
  }
  if (!self->_drawingTouch)
  {
    [(UITouch *)v11 locationInView:0];
    self->_drawTouchStartPoint.x = v5;
    self->_drawTouchStartPoint.y = v6;
  }
  objc_storeStrong((id *)&self->_drawingTouch, a3);
  if (!self->_drawingTargetIsDrawing)
  {
    id v7 = [(PKDrawingGestureRecognizer *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0
      || ([(PKDrawingGestureRecognizer *)self delegate],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = [v9 drawingGestureRecognizer:self shouldDelayDrawingBeganWithTouch:v11],
          v9,
          (v10 & 1) == 0))
    {
      [(PKDrawingGestureRecognizer *)self _drawingBegan];
    }
  }
  if (self->_gestureDetected && ![(PKDrawingGestureRecognizer *)self state]) {
    [(PKDrawingGestureRecognizer *)self setState:1];
  }
LABEL_13:
}

- (void)_updateDrawingWithEvent:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_gestureDetected)
  {
    [(PKDrawingGestureRecognizer *)self _drawingMoved:v4];
    if (!self->_gestureDetected) {
      goto LABEL_9;
    }
    uint64_t v5 = 2;
    goto LABEL_8;
  }
  [(UITouch *)self->_drawingTouch locationInView:0];
  if ((self->_drawTouchStartPoint.y - v7) * (self->_drawTouchStartPoint.y - v7)
     + (self->_drawTouchStartPoint.x - v6) * (self->_drawTouchStartPoint.x - v6) > self->_squaredThreshold)
    self->_gestureDetected = 1;
  [(PKDrawingGestureRecognizer *)self _drawingMoved:v8];
  if (self->_gestureDetected)
  {
    uint64_t v5 = 1;
LABEL_8:
    [(PKDrawingGestureRecognizer *)self setState:v5];
  }
LABEL_9:
}

- (void)_cancelDrawing
{
  if (self->_drawingTargetIsDrawing) {
    [(PKDrawingGestureRecognizer *)self _drawingCancelled];
  }
  drawingTouch = self->_drawingTouch;
  self->_drawingTouch = 0;

  self->_ignoreFingerTouchesUntilReset = 1;
  if (self->_gestureDetected)
  {
    self->_gestureDetected = 0;
    uint64_t v4 = 4;
  }
  else
  {
    uint64_t v4 = 5;
  }

  [(PKDrawingGestureRecognizer *)self setState:v4];
}

- (void)_endDrawing
{
}

- (void)reset
{
  if (([(PKDrawingGestureRecognizer *)self state] & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    if (self->_drawingTargetIsDrawing) {
      [(PKDrawingGestureRecognizer *)self _drawingCancelled];
    }
  }
  else if (self->_drawingTargetIsDrawing)
  {
    [(PKDrawingGestureRecognizer *)self _drawingEnded];
  }
  drawingTouch = self->_drawingTouch;
  self->_drawingTouch = 0;

  self->_drawingTargetIsDrawing = 0;
  self->_gestureDetected = 0;
  self->_ignoreFingerTouchesUntilReset = 0;
}

- (void)_drawingBegan
{
  self->_drawingTargetIsDrawing = 1;
  self->_startTimeInterval = CACurrentMediaTime();
  [(UITouch *)self->_drawingTouch locationInView:0];
  self->_currentBoundingBoxInWindow.origin.x = v3;
  self->_currentBoundingBoxInWindow.origin.y = v4;
  self->_currentBoundingBoxInWindow.size.width = 0.0;
  self->_currentBoundingBoxInWindow.size.height = 0.0;
  id v5 = [(PKDrawingGestureRecognizer *)self drawingTarget];
  [v5 drawingBegan:self->_drawingTouch];
}

- (void)_drawingMoved:(id)a3
{
  drawingTouch = self->_drawingTouch;
  id v5 = a3;
  [(UITouch *)drawingTouch locationInView:0];
  v10.origin.x = v6;
  v10.origin.y = v7;
  v10.size.width = 0.0;
  v10.size.height = 0.0;
  self->_currentBoundingBoxInWindow = CGRectUnion(self->_currentBoundingBoxInWindow, v10);
  id v8 = [(PKDrawingGestureRecognizer *)self drawingTarget];
  [v8 drawingMoved:self->_drawingTouch withEvent:v5];
}

- (void)_drawingEnded
{
  CGFloat v3 = [(PKDrawingGestureRecognizer *)self drawingTarget];
  [v3 drawingEnded:self->_drawingTouch];

  self->_drawingTargetIsDrawing = 0;
}

- (void)_drawingCancelled
{
  CGFloat v3 = [(PKDrawingGestureRecognizer *)self drawingTarget];
  [v3 drawingCancelled];

  self->_drawingTargetIsDrawing = 0;
}

- (PKDrawingGestureTarget)drawingTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->drawingTarget);

  return (PKDrawingGestureTarget *)WeakRetained;
}

- (unint64_t)activeInputProperties
{
  return self->_activeInputProperties;
}

- (CGRect)currentBoundingBoxInWindow
{
  double x = self->_currentBoundingBoxInWindow.origin.x;
  double y = self->_currentBoundingBoxInWindow.origin.y;
  double width = self->_currentBoundingBoxInWindow.size.width;
  double height = self->_currentBoundingBoxInWindow.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)startTimeInterval
{
  return self->_startTimeInterval;
}

- (double)thresholdDistance
{
  return self->_thresholdDistance;
}

- (UITouch)drawingTouch
{
  return self->_drawingTouch;
}

- (void)setDrawingTouch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingTouch, 0);

  objc_destroyWeak((id *)&self->drawingTarget);
}

@end