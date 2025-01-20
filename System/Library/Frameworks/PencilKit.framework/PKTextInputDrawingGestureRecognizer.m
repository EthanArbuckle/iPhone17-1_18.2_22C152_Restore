@interface PKTextInputDrawingGestureRecognizer
+ (id)_systemGestureClassesToAvoid;
- (BOOL)_gestureStartedInsideTargetElement;
- (BOOL)_hasMovedPastMinimumPanThresholdForTouch:(id)a3;
- (BOOL)_hasMovedPastScrollThresholdForTouch:(id)a3;
- (BOOL)_isValidLongPress;
- (BOOL)_isValidLongPressOverDuration:(double)a3;
- (BOOL)_isWithinLongPressDistanceForTouch:(id)a3;
- (BOOL)drawingTargetIsDrawing;
- (BOOL)hasMovedPastTapUseTimestampFromTouch:(BOOL)a3;
- (BOOL)isReplaying;
- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3;
- (CGPoint)locationInView:(id)a3;
- (NSString)description;
- (PKDrawingGestureTarget)drawingTarget;
- (PKTextInputDrawingGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (PKTextInputElement)targetElement;
- (UITouch)drawingTouch;
- (double)_distanceFromStartPositionForTouch:(id)a3;
- (double)timeIntervalSinceStartOfGesture;
- (double)timeIntervalSinceTouchesBeganForTouch:(id)a3;
- (int64_t)_panDirectionForTouch:(id)a3;
- (int64_t)longPressState;
- (int64_t)panDirection;
- (int64_t)panState;
- (int64_t)strokeAcceptanceState;
- (unint64_t)activeInputProperties;
- (void)_acceptStrokeTimeoutTriggered;
- (void)_beginDrawingIfNeeded;
- (void)_cancelLongPressTimerBlocks;
- (void)_cancelNotMovingCancellationBlock;
- (void)_cancelOrFailGesture;
- (void)_cancelScheduledStrokeAcceptanceBlock;
- (void)_drawingBegan;
- (void)_drawingEnded;
- (void)_drawingMoved:(id)a3;
- (void)_endDrawing;
- (void)_enumerateTouchesForUpdateWithEvent:(id)a3 block:(id)a4;
- (void)_evaluateCancelIfNotMoving;
- (void)_evaluateMovingToBeganStateUseTimestampFromTouch:(BOOL)a3;
- (void)_longPressSuccessTimerFired;
- (void)_longPressTentativeTimerFired;
- (void)_replayDrawingBegan:(id *)a3;
- (void)_replayDrawingBegan:(id *)a3 coordinateSpace:(id)a4 activeInputProperties:(unint64_t)a5 inputType:(int64_t)a6;
- (void)_replayDrawingCancelled;
- (void)_replayDrawingEnded;
- (void)_replayDrawingMoved:(id *)a3;
- (void)_replayDrawingMoved:(id *)a3 coordinateSpace:(id)a4;
- (void)_scheduleLongPressTimerBlocks;
- (void)_setDrawingTargetIsDrawing:(BOOL)a3;
- (void)_setLongPressState:(int64_t)a3;
- (void)_setPanDirection:(int64_t)a3;
- (void)_setPanState:(int64_t)a3;
- (void)_setStrokeAcceptanceState:(int64_t)a3;
- (void)_updateLongPressValidityForTouch:(id)a3;
- (void)_updatePanGestureStateForTouch:(id)a3;
- (void)_updatePanStateForCandidateElements:(id)a3;
- (void)_updateStrokeAcceptanceStateUseTimestampFromTouch:(BOOL)a3;
- (void)cancel;
- (void)cancelDrawing;
- (void)finishedElementFindingWithElement:(id)a3 candidateElements:(id)a4;
- (void)reportDebugStateDescription:(id)a3;
- (void)reset;
- (void)setDrawingTarget:(id)a3;
- (void)setDrawingTouch:(id)a3;
- (void)setIsReplaying:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setTargetElement:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesEstimatedPropertiesUpdated:(id)a3;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation PKTextInputDrawingGestureRecognizer

- (PKTextInputDrawingGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKTextInputDrawingGestureRecognizer;
  v4 = [(PKTextInputDrawingGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(PKTextInputDrawingGestureRecognizer *)v4 setDelaysTouchesBegan:1];
    [(PKTextInputDrawingGestureRecognizer *)v5 setCancelsTouchesInView:1];
    [(PKTextInputDrawingGestureRecognizer *)v5 setRequiresExclusiveTouchType:1];
    [(PKTextInputDrawingGestureRecognizer *)v5 setAllowedTouchTypes:&unk_1F200F0A8];
  }
  return v5;
}

- (void)setState:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(PKTextInputDrawingGestureRecognizer *)self state];
  v6 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [(PKTextInputDrawingGestureRecognizer *)self drawingTouch];
    v8 = (void *)v7;
    if (v5 > 5) {
      v9 = 0;
    }
    else {
      v9 = off_1E64CB7E8[v5];
    }
    if ((unint64_t)a3 > 5) {
      v10 = 0;
    }
    else {
      v10 = off_1E64CB7E8[a3];
    }
    *(_DWORD *)buf = 134218498;
    uint64_t v20 = v7;
    __int16 v21 = 2112;
    v22 = v9;
    __int16 v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_INFO, "Gesture touch %p changing state: %@ -> %@", buf, 0x20u);
  }
  v18.receiver = self;
  v18.super_class = (Class)PKTextInputDrawingGestureRecognizer;
  [(PKTextInputDrawingGestureRecognizer *)&v18 setState:a3];
  if (v5 != a3)
  {
    +[PKTextInputDebugStateIntrospector debugStateDidChange];
    id gestureEnvironmentResetTimeoutBlock = self->_gestureEnvironmentResetTimeoutBlock;
    if (gestureEnvironmentResetTimeoutBlock)
    {
      dispatch_block_cancel(gestureEnvironmentResetTimeoutBlock);
      id v12 = self->_gestureEnvironmentResetTimeoutBlock;
      self->_id gestureEnvironmentResetTimeoutBlock = 0;
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      objc_initWeak((id *)buf, self);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__PKTextInputDrawingGestureRecognizer_setState___block_invoke;
      block[3] = &unk_1E64C5998;
      objc_copyWeak(&v17, (id *)buf);
      dispatch_block_t v13 = dispatch_block_create((dispatch_block_flags_t)0, block);
      id v14 = self->_gestureEnvironmentResetTimeoutBlock;
      self->_id gestureEnvironmentResetTimeoutBlock = v13;

      dispatch_time_t v15 = dispatch_time(0, 500000000);
      dispatch_after(v15, MEMORY[0x1E4F14428], self->_gestureEnvironmentResetTimeoutBlock);
      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __48__PKTextInputDrawingGestureRecognizer_setState___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained state] == 5 || objc_msgSend(v2, "state") == 3)
    {
      if ([v2 state] == 3)
      {
        v3 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)unint64_t v5 = 0;
          _os_log_fault_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_FAULT, "Stuck gesture environment after moving to Ended detected", v5, 2u);
        }
      }
      [v2 _cancelOrFailGesture];
    }
    v4 = (void *)v2[43];
    v2[43] = 0;
  }
}

- (void)finishedElementFindingWithElement:(id)a3 candidateElements:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(PKTextInputDrawingGestureRecognizer *)self drawingTouch];
    unint64_t v10 = [(PKTextInputDrawingGestureRecognizer *)self state];
    if (v10 > 5) {
      v11 = 0;
    }
    else {
      v11 = off_1E64CB7E8[v10];
    }
    int v12 = 134218754;
    dispatch_block_t v13 = v9;
    __int16 v14 = 2048;
    id v15 = v6;
    __int16 v16 = 2048;
    id v17 = v7;
    __int16 v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "Gesture touch %p finishedElementFindingWithElement: %p, candidateElements: %p state: %@", (uint8_t *)&v12, 0x2Au);
  }
  if (self->_waitingForTargetElementSearch)
  {
    [(PKTextInputDrawingGestureRecognizer *)self setTargetElement:v6];
    [(PKTextInputDrawingGestureRecognizer *)self _updatePanStateForCandidateElements:v7];
    self->_waitingForTargetElementSearch = 0;
    [(PKTextInputDrawingGestureRecognizer *)self _evaluateMovingToBeganStateUseTimestampFromTouch:0];
    [(PKTextInputDrawingGestureRecognizer *)self _updateStrokeAcceptanceStateUseTimestampFromTouch:0];
    +[PKTextInputDebugStateIntrospector debugStateDidChange];
  }
}

- (CGPoint)locationInView:(id)a3
{
  if (a3 && self->_drawingTouch)
  {
    drawingTouch = self->_drawingTouch;
    -[UITouch PK_locationInView:](drawingTouch, "PK_locationInView:");
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PKTextInputDrawingGestureRecognizer;
    -[PKTextInputDrawingGestureRecognizer locationInView:](&v6, sel_locationInView_);
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (double)_distanceFromStartPositionForTouch:(id)a3
{
  double x = self->_drawTouchStartPoint.x;
  double y = self->_drawTouchStartPoint.y;
  [a3 locationInView:0];
  return sqrt((y - v6) * (y - v6) + (x - v5) * (x - v5));
}

- (double)timeIntervalSinceStartOfGesture
{
  if (!self->_drawingTouch) {
    return 0.0;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return v3 - self->_drawStartTime;
}

- (double)timeIntervalSinceTouchesBeganForTouch:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    if (self->_drawingTouch)
    {
      [v4 timestamp];
      double v7 = v6 - self->_touchesBeganTimestamp;
    }
    else
    {
      double v7 = 0.0;
    }
  }
  else
  {
    [(PKTextInputDrawingGestureRecognizer *)self timeIntervalSinceStartOfGesture];
    double v7 = v8;
  }

  return v7;
}

- (BOOL)_gestureStartedInsideTargetElement
{
  double v3 = [(PKTextInputDrawingGestureRecognizer *)self targetElement];
  id v4 = -[PKTextInputElement coordinateSpace]((uint64_t)v3);

  if (!v4) {
    return 0;
  }
  double v5 = [(PKTextInputDrawingGestureRecognizer *)self targetElement];
  double v6 = -[PKTextInputElement frame]((uint64_t)v5);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  dispatch_block_t v13 = [(PKTextInputDrawingGestureRecognizer *)self targetElement];
  __int16 v14 = -[PKTextInputElement coordinateSpace]((uint64_t)v13);
  id v15 = [(PKTextInputDrawingGestureRecognizer *)self view];
  __int16 v16 = [v15 window];
  double v17 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v14, v16, v6, v8, v10, v12);
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;

  CGFloat x = self->_drawTouchStartPoint.x;
  CGFloat y = self->_drawTouchStartPoint.y;
  double v26 = v17;
  uint64_t v27 = v19;
  uint64_t v28 = v21;
  uint64_t v29 = v23;

  return CGRectContainsPoint(*(CGRect *)&v26, *(CGPoint *)&x);
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)PKTextInputDrawingGestureRecognizer;
  double v3 = [(PKTextInputDrawingGestureRecognizer *)&v7 description];
  id v4 = +[PKTextInputDebugStateIntrospector debugStateLineDescriptionForIntrospectable:self];
  double v5 = [v3 stringByAppendingFormat:@" %@", v4];

  return (NSString *)v5;
}

- (BOOL)hasMovedPastTapUseTimestampFromTouch:(BOOL)a3
{
  double v5 = +[PKTextInputSettings sharedSettings];
  [v5 drawingGestureTapDetectionDistanceThreshold];
  double v7 = v6;

  double v8 = +[PKTextInputSettings sharedSettings];
  [v8 drawingGestureTapDetectionTimeInterval];
  double v10 = v9;

  double v11 = [(PKTextInputDrawingGestureRecognizer *)self drawingTouch];
  [(PKTextInputDrawingGestureRecognizer *)self _distanceFromStartPositionForTouch:v11];
  double v13 = v12;

  if ([(PKTextInputDrawingGestureRecognizer *)self _gestureStartedInsideTargetElement])
  {
    double v14 = v10 + -v10 / (v7 * v7) * (v13 * v13);
    if (a3)
    {
      id v15 = [(PKTextInputDrawingGestureRecognizer *)self drawingTouch];
      [(PKTextInputDrawingGestureRecognizer *)self timeIntervalSinceTouchesBeganForTouch:v15];
      double v17 = v16;
    }
    else
    {
      [(PKTextInputDrawingGestureRecognizer *)self timeIntervalSinceTouchesBeganForTouch:0];
      double v17 = v19;
    }
    BOOL v18 = v17 <= v14;
  }
  else
  {
    BOOL v18 = v13 <= v7;
  }
  return !v18;
}

- (void)_enumerateTouchesForUpdateWithEvent:(id)a3 block:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v6 = (void (**)(id, void))a4;
  if (v6)
  {
    double v7 = [a3 coalescedTouchesForTouch:self->_drawingTouch];
    if ([v7 count])
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v8);
            }
            v6[2](v6, *(void *)(*((void *)&v13 + 1) + 8 * v12++));
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v10);
      }
    }
    else
    {
      ((void (**)(id, UITouch *))v6)[2](v6, self->_drawingTouch);
    }
  }
}

- (void)_setLongPressState:(int64_t)a3
{
  if (self->_longPressState != a3)
  {
    self->_longPressState = a3;
    id v4 = [(PKTextInputDrawingGestureRecognizer *)self delegate];
    [v4 drawingGestureRecognizerLongPressStateDidChange:self];

    +[PKTextInputDebugStateIntrospector debugStateDidChange];
  }
}

- (BOOL)_isValidLongPress
{
  if ((unint64_t)([(PKTextInputDrawingGestureRecognizer *)self longPressState] - 1) > 1) {
    return 0;
  }
  double v3 = +[PKTextInputSettings sharedSettings];
  [v3 drawingGestureLongPressDetectionTimeInterval];
  BOOL v4 = -[PKTextInputDrawingGestureRecognizer _isValidLongPressOverDuration:](self, "_isValidLongPressOverDuration:");

  return v4;
}

- (BOOL)_isWithinLongPressDistanceForTouch:(id)a3
{
  [(PKTextInputDrawingGestureRecognizer *)self _distanceFromStartPositionForTouch:a3];
  double v4 = v3;
  double v5 = +[PKTextInputSettings sharedSettings];
  [v5 drawingGestureLongPressMaxDistance];
  double v7 = v6;

  return v4 <= v7;
}

- (BOOL)_isValidLongPressOverDuration:(double)a3
{
  double v5 = [(PKTextInputDrawingGestureRecognizer *)self drawingTouch];
  BOOL v6 = [(PKTextInputDrawingGestureRecognizer *)self _isWithinLongPressDistanceForTouch:v5];

  [(PKTextInputDrawingGestureRecognizer *)self timeIntervalSinceStartOfGesture];
  return v7 > a3 && v6;
}

- (void)_scheduleLongPressTimerBlocks
{
  [(PKTextInputDrawingGestureRecognizer *)self _cancelLongPressTimerBlocks];
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKTextInputDrawingGestureRecognizer__scheduleLongPressTimerBlocks__block_invoke;
  block[3] = &unk_1E64C5998;
  objc_copyWeak(&v20, &location);
  dispatch_block_t v3 = dispatch_block_create((dispatch_block_flags_t)0, block);
  id longPressTentativeBlock = self->_longPressTentativeBlock;
  self->_id longPressTentativeBlock = v3;

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__PKTextInputDrawingGestureRecognizer__scheduleLongPressTimerBlocks__block_invoke_2;
  v17[3] = &unk_1E64C5998;
  objc_copyWeak(&v18, &location);
  dispatch_block_t v5 = dispatch_block_create((dispatch_block_flags_t)0, v17);
  id longPressSuccessBlock = self->_longPressSuccessBlock;
  self->_id longPressSuccessBlock = v5;

  double v7 = +[PKTextInputSettings sharedSettings];
  [v7 drawingGestureTapDetectionTimeInterval];
  double v9 = v8;

  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
  dispatch_after(v10, MEMORY[0x1E4F14428], self->_longPressTentativeBlock);
  uint64_t v11 = +[PKTextInputSettings sharedSettings];
  [v11 drawingGestureLongPressDetectionTimeInterval];
  double v13 = v12;

  dispatch_time_t v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
  id v15 = self->_longPressSuccessBlock;
  long long v16 = (void *)MEMORY[0x1E4F14428];
  dispatch_after(v14, MEMORY[0x1E4F14428], v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __68__PKTextInputDrawingGestureRecognizer__scheduleLongPressTimerBlocks__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _longPressTentativeTimerFired];
}

void __68__PKTextInputDrawingGestureRecognizer__scheduleLongPressTimerBlocks__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _longPressSuccessTimerFired];
}

- (void)_longPressTentativeTimerFired
{
  id longPressTentativeBlock = self->_longPressTentativeBlock;
  self->_id longPressTentativeBlock = 0;

  double v4 = +[PKTextInputSettings sharedSettings];
  [v4 drawingGestureTapDetectionTimeInterval];
  double v6 = v5;

  if ([(PKTextInputDrawingGestureRecognizer *)self state] >= 1
    && [(PKTextInputDrawingGestureRecognizer *)self state] <= 2
    && [(PKTextInputDrawingGestureRecognizer *)self _isValidLongPressOverDuration:v6])
  {
    [(PKTextInputDrawingGestureRecognizer *)self _setLongPressState:1];
  }
}

- (void)_longPressSuccessTimerFired
{
  id longPressSuccessBlock = self->_longPressSuccessBlock;
  self->_id longPressSuccessBlock = 0;

  if ([(PKTextInputDrawingGestureRecognizer *)self state] >= 1
    && [(PKTextInputDrawingGestureRecognizer *)self state] <= 2
    && [(PKTextInputDrawingGestureRecognizer *)self _isValidLongPress]
    && [(PKTextInputDrawingGestureRecognizer *)self longPressState] == 1)
  {
    uint64_t v4 = 2;
  }
  else
  {
    uint64_t v4 = 3;
  }

  [(PKTextInputDrawingGestureRecognizer *)self _setLongPressState:v4];
}

- (void)_updateLongPressValidityForTouch:(id)a3
{
  id v4 = a3;
  if (self->_longPressSuccessBlock)
  {
    id v6 = v4;
    BOOL v5 = [(PKTextInputDrawingGestureRecognizer *)self _isWithinLongPressDistanceForTouch:v4];
    id v4 = v6;
    if (!v5)
    {
      [(PKTextInputDrawingGestureRecognizer *)self _cancelLongPressTimerBlocks];
      [(PKTextInputDrawingGestureRecognizer *)self _setLongPressState:3];
      id v4 = v6;
    }
  }
}

- (void)_cancelLongPressTimerBlocks
{
  id longPressTentativeBlock = self->_longPressTentativeBlock;
  if (longPressTentativeBlock)
  {
    dispatch_block_cancel(longPressTentativeBlock);
    id v4 = self->_longPressTentativeBlock;
    self->_id longPressTentativeBlock = 0;
  }
  id longPressSuccessBlock = self->_longPressSuccessBlock;
  if (longPressSuccessBlock)
  {
    dispatch_block_cancel(longPressSuccessBlock);
    id v6 = self->_longPressSuccessBlock;
    self->_id longPressSuccessBlock = 0;
  }
}

- (void)_setPanState:(int64_t)a3
{
  if (self->_panState != a3)
  {
    self->_panState = a3;
    +[PKTextInputDebugStateIntrospector debugStateDidChange];
  }
}

- (BOOL)_hasMovedPastMinimumPanThresholdForTouch:(id)a3
{
  [(PKTextInputDrawingGestureRecognizer *)self _distanceFromStartPositionForTouch:a3];
  double v4 = v3;
  BOOL v5 = +[PKTextInputSettings sharedSettings];
  [v5 drawingGestureMinimumPanDistanceThreshold];
  double v7 = v6;

  return v4 > v7;
}

- (BOOL)_hasMovedPastScrollThresholdForTouch:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PKTextInputDrawingGestureRecognizer *)self targetElement];

  if (v5)
  {
    [(PKTextInputDrawingGestureRecognizer *)self _distanceFromStartPositionForTouch:v4];
    double v7 = v6;
    double v8 = +[PKTextInputSettings sharedSettings];
    [v8 drawingGestureMinimumScrollDistanceThreshold];
    double v10 = v9;

    BOOL v11 = v7 > v10;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_updatePanGestureStateForTouch:(id)a3
{
  id v7 = a3;
  if (![(PKTextInputDrawingGestureRecognizer *)self panState])
  {
    if (![(PKTextInputDrawingGestureRecognizer *)self _hasMovedPastMinimumPanThresholdForTouch:v7])
    {
      [(PKTextInputDrawingGestureRecognizer *)self _setPanDirection:0];
      goto LABEL_12;
    }
    [(PKTextInputDrawingGestureRecognizer *)self _setPanDirection:[(PKTextInputDrawingGestureRecognizer *)self _panDirectionForTouch:v7]];
    if ([(PKTextInputDrawingGestureRecognizer *)self panDirection] == 1
      || [(PKTextInputDrawingGestureRecognizer *)self panDirection] == 3)
    {
      BOOL v5 = self;
      uint64_t v6 = 1;
LABEL_10:
      [(PKTextInputDrawingGestureRecognizer *)v5 _setPanState:v6];
      goto LABEL_12;
    }
LABEL_9:
    BOOL v5 = self;
    uint64_t v6 = 2;
    goto LABEL_10;
  }
  if ([(PKTextInputDrawingGestureRecognizer *)self panState] == 1)
  {
    int64_t v4 = [(PKTextInputDrawingGestureRecognizer *)self _panDirectionForTouch:v7];
    if ([(PKTextInputDrawingGestureRecognizer *)self panDirection] != v4)
    {
      [(PKTextInputDrawingGestureRecognizer *)self _setPanDirection:0];
      goto LABEL_9;
    }
  }
LABEL_12:
  if ([(PKTextInputDrawingGestureRecognizer *)self state] != 4
    && [(PKTextInputDrawingGestureRecognizer *)self panState] == 1
    && [(PKTextInputDrawingGestureRecognizer *)self _hasMovedPastScrollThresholdForTouch:v7])
  {
    [(PKTextInputDrawingGestureRecognizer *)self cancel];
  }
}

- (int64_t)_panDirectionForTouch:(id)a3
{
  double x = self->_drawTouchStartPoint.x;
  double y = self->_drawTouchStartPoint.y;
  [a3 locationInView:0];
  uint64_t v7 = (uint64_t)(atan2(v6 - y, v5 - x) * 57.2957795 + 90.0 + 45.0);
  double v8 = fmod((double)v7, 360.0);
  if ((unint64_t)v7 <= 0x168) {
    double v8 = (double)v7;
  }
  if (v8 < 0.0) {
    double v8 = v8 + 360.0;
  }
  if (v8 == 0.0) {
    double v8 = 0.0;
  }
  return (uint64_t)((double)(uint64_t)v8 / 90.0) + 1;
}

- (void)_updatePanStateForCandidateElements:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)[v4 count] < 2) {
    goto LABEL_19;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v6)
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v7 = v6;
  id v8 = 0;
  uint64_t v9 = *(void *)v16;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v5);
      }
      BOOL v11 = -[PKTextInputElement referenceView](*(id **)(*((void *)&v15 + 1) + 8 * i));
      if (!v11)
      {
        double v12 = v8;
        goto LABEL_17;
      }
      double v12 = v11;
      objc_msgSend(v11, "PK_enclosingScrollableScrollView", (void)v15);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      dispatch_time_t v14 = v13;
      if (v8)
      {
        if (v8 != v13)
        {

LABEL_17:
          goto LABEL_18;
        }
      }
      else
      {
        id v8 = v13;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7) {
      continue;
    }
    break;
  }

  if (!v8)
  {
LABEL_19:
    -[PKTextInputDrawingGestureRecognizer _setPanDirection:](self, "_setPanDirection:", 0, (void)v15);
    [(PKTextInputDrawingGestureRecognizer *)self _setPanState:2];
    id v8 = 0;
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!self->_isReplaying)
  {
    if (self->_drawingTouch)
    {
      id v8 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = [(PKTextInputDrawingGestureRecognizer *)self drawingTouch];
        int v28 = 134217984;
        uint64_t v29 = v27;
        _os_log_error_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_ERROR, "Gesture touch %p touchesBegan called multiple times", (uint8_t *)&v28, 0xCu);
      }
      goto LABEL_26;
    }
    uint64_t v9 = [v6 objectsPassingTest:&__block_literal_global_95];
    id v8 = [v9 anyObject];

    if (!v8)
    {
LABEL_26:

      goto LABEL_27;
    }
    [v8 timestamp];
    self->_touchesBeganTimestamp = v10;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    self->_drawStartTime = v11;
    objc_storeStrong((id *)&self->_drawingTouch, v8);
    self->_activeInputProperties = objc_msgSend(v7, "PK_activeInputPropertiesForTouch:", v8);
    [(UITouch *)self->_drawingTouch locationInView:0];
    self->_drawTouchStartPoint.double x = v12;
    self->_drawTouchStartPoint.double y = v13;
    dispatch_time_t v14 = [(PKTextInputDrawingGestureRecognizer *)self delegate];
    self->_requiresTargetElementToBegin = [v14 drawingGestureRecognizerRequiresTargetElementToBegin:self];

    long long v15 = [(PKTextInputDrawingGestureRecognizer *)self delegate];
    self->_requiresPastTapToBegin = [v15 drawingGestureRecognizerRequiresPastTapToBegin:self];

    [(PKTextInputDrawingGestureRecognizer *)self setTargetElement:0];
    self->_waitingForTargetElementSearch = self->_requiresTargetElementToBegin;
    if ([(PKTextInputDrawingGestureRecognizer *)self state]
      || ([(PKTextInputDrawingGestureRecognizer *)self delegate],
          uint64_t v23 = objc_claimAutoreleasedReturnValue(),
          v23,
          !v23))
    {
      int v16 = 1;
    }
    else
    {
      v24 = [(PKTextInputDrawingGestureRecognizer *)self delegate];
      int v25 = [v24 drawingGestureRecognizer:self shouldBeginDrawingWithTouches:v6 event:v7];

      if (!v25)
      {
        int v16 = 0;
        int v17 = 0;
        goto LABEL_10;
      }
      double v26 = [(PKTextInputDrawingGestureRecognizer *)self delegate];
      int v16 = [v26 drawingGestureRecognizerLongPressShouldBegin:self];
    }
    int v17 = 1;
LABEL_10:
    long long v18 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      double v19 = [(PKTextInputDrawingGestureRecognizer *)self drawingTouch];
      if (v17) {
        uint64_t v20 = @"Y";
      }
      else {
        uint64_t v20 = @"N";
      }
      unint64_t v21 = [(PKTextInputDrawingGestureRecognizer *)self state];
      if (v21 > 5) {
        uint64_t v22 = 0;
      }
      else {
        uint64_t v22 = off_1E64CB7E8[v21];
      }
      int v28 = 134218498;
      uint64_t v29 = v19;
      __int16 v30 = 2112;
      v31 = v20;
      __int16 v32 = 2112;
      v33 = v22;
      _os_log_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_DEFAULT, "Gesture touch %p touchesBegan, canBeginDrawing: %@, state: %@.", (uint8_t *)&v28, 0x20u);
    }
    if (v17)
    {
      [(PKTextInputDrawingGestureRecognizer *)self _evaluateMovingToBeganStateUseTimestampFromTouch:1];
      if (v16) {
        [(PKTextInputDrawingGestureRecognizer *)self _scheduleLongPressTimerBlocks];
      }
    }
    else
    {
      [(PKTextInputDrawingGestureRecognizer *)self _cancelOrFailGesture];
    }
    +[PKTextInputDebugStateIntrospector debugStateDidChange];
    goto LABEL_26;
  }
LABEL_27:
}

BOOL __62__PKTextInputDrawingGestureRecognizer_touchesBegan_withEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 2;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  if ([a3 containsObject:self->_drawingTouch])
  {
    if (!self->_isReplaying)
    {
      [(PKTextInputDrawingGestureRecognizer *)self _evaluateMovingToBeganStateUseTimestampFromTouch:1];
      [(PKTextInputDrawingGestureRecognizer *)self _drawingMoved:v6];
      [(PKTextInputDrawingGestureRecognizer *)self _updateStrokeAcceptanceStateUseTimestampFromTouch:1];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __62__PKTextInputDrawingGestureRecognizer_touchesMoved_withEvent___block_invoke;
      v8[3] = &unk_1E64CB7C8;
      v8[4] = self;
      [(PKTextInputDrawingGestureRecognizer *)self _enumerateTouchesForUpdateWithEvent:v6 block:v8];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __62__PKTextInputDrawingGestureRecognizer_touchesMoved_withEvent___block_invoke_2;
      v7[3] = &unk_1E64CB7C8;
      v7[4] = self;
      [(PKTextInputDrawingGestureRecognizer *)self _enumerateTouchesForUpdateWithEvent:v6 block:v7];
      if (([(PKTextInputDrawingGestureRecognizer *)self state] == 1
         || [(PKTextInputDrawingGestureRecognizer *)self state] == 2)
        && [(PKTextInputDrawingGestureRecognizer *)self strokeAcceptanceState] == 1)
      {
        [(PKTextInputDrawingGestureRecognizer *)self _cancelScheduledStrokeAcceptanceBlock];
        if ([(PKTextInputDrawingGestureRecognizer *)self state] == 1) {
          [(PKTextInputDrawingGestureRecognizer *)self setState:2];
        }
      }
    }
  }
}

uint64_t __62__PKTextInputDrawingGestureRecognizer_touchesMoved_withEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateLongPressValidityForTouch:a2];
}

uint64_t __62__PKTextInputDrawingGestureRecognizer_touchesMoved_withEvent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updatePanGestureStateForTouch:a2];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!self->_isReplaying)
  {
    id v5 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(PKTextInputDrawingGestureRecognizer *)self drawingTouch];
      unint64_t v7 = [(PKTextInputDrawingGestureRecognizer *)self state];
      if (v7 > 5) {
        id v8 = 0;
      }
      else {
        id v8 = off_1E64CB7E8[v7];
      }
      int v9 = 134218242;
      double v10 = v6;
      __int16 v11 = 2112;
      CGFloat v12 = v8;
      _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Gesture touch %p touchesCancelled, state: %@. Cancelling gesture.", (uint8_t *)&v9, 0x16u);
    }
    [(PKTextInputDrawingGestureRecognizer *)self _cancelOrFailGesture];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_isReplaying) {
    return;
  }
  if (!objc_msgSend(a3, "containsObject:", self->_drawingTouch, a4))
  {
    __int16 v11 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      CGFloat v12 = [(PKTextInputDrawingGestureRecognizer *)self drawingTouch];
      unint64_t v13 = [(PKTextInputDrawingGestureRecognizer *)self state];
      if (v13 > 5) {
        dispatch_time_t v14 = 0;
      }
      else {
        dispatch_time_t v14 = off_1E64CB7E8[v13];
      }
      int v18 = 134218242;
      double v19 = v12;
      __int16 v20 = 2112;
      unint64_t v21 = v14;
      int v17 = "Gesture touch %p touchesEnded, but touches do not contain the original drawing touch, state: %@. Cancelling gesture.";
      goto LABEL_20;
    }
LABEL_21:

    [(PKTextInputDrawingGestureRecognizer *)self _cancelOrFailGesture];
    return;
  }
  id v5 = [(PKTextInputDrawingGestureRecognizer *)self delegate];

  if (v5)
  {
    id v6 = [(PKTextInputDrawingGestureRecognizer *)self delegate];
    char v7 = [v6 drawingGestureRecognizer:self shouldFinishGestureWithTouch:self->_drawingTouch];

    if ((v7 & 1) == 0)
    {
      __int16 v11 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        CGFloat v12 = [(PKTextInputDrawingGestureRecognizer *)self drawingTouch];
        unint64_t v15 = [(PKTextInputDrawingGestureRecognizer *)self state];
        if (v15 > 5) {
          int v16 = 0;
        }
        else {
          int v16 = off_1E64CB7E8[v15];
        }
        int v18 = 134218242;
        double v19 = v12;
        __int16 v20 = 2112;
        unint64_t v21 = v16;
        int v17 = "Gesture touch %p touchesEnded, but delegate.shouldFinishGestureWithTouch: N, state: %@. Cancelling gesture.";
LABEL_20:
        _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v18, 0x16u);

        goto LABEL_21;
      }
      goto LABEL_21;
    }
  }
  id v8 = [(PKTextInputDrawingGestureRecognizer *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    double v10 = [(PKTextInputDrawingGestureRecognizer *)self delegate];
    [v10 drawingGestureRecognizer:self touchesEndedWithDrawingTouch:self->_drawingTouch];
  }

  [(PKTextInputDrawingGestureRecognizer *)self _endDrawing];
}

- (void)touchesEstimatedPropertiesUpdated:(id)a3
{
  id v4 = a3;
  id v5 = [(PKTextInputDrawingGestureRecognizer *)self drawingTarget];
  [v5 drawingEstimatedPropertiesUpdated:v4];
}

- (void)_beginDrawingIfNeeded
{
  if ((![(PKTextInputDrawingGestureRecognizer *)self state]
     || [(PKTextInputDrawingGestureRecognizer *)self state] == 1
     || [(PKTextInputDrawingGestureRecognizer *)self state] == 2)
    && ![(PKTextInputDrawingGestureRecognizer *)self drawingTargetIsDrawing])
  {
    [(PKTextInputDrawingGestureRecognizer *)self _drawingBegan];
  }
}

- (void)_evaluateMovingToBeganStateUseTimestampFromTouch:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if ([(PKTextInputDrawingGestureRecognizer *)self state]) {
    return;
  }
  if (!self->_requiresTargetElementToBegin)
  {
    BOOL v6 = [(PKTextInputDrawingGestureRecognizer *)self hasMovedPastTapUseTimestampFromTouch:v3];
LABEL_6:
    int v7 = !self->_requiresPastTapToBegin || v6;
    goto LABEL_9;
  }
  id v5 = [(PKTextInputDrawingGestureRecognizer *)self targetElement];

  BOOL v6 = [(PKTextInputDrawingGestureRecognizer *)self hasMovedPastTapUseTimestampFromTouch:v3];
  if (v5) {
    goto LABEL_6;
  }
  int v7 = 0;
LABEL_9:
  id v8 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = [(PKTextInputDrawingGestureRecognizer *)self drawingTouch];
    double v19 = @"N";
    if (v7) {
      __int16 v20 = @"Y";
    }
    else {
      __int16 v20 = @"N";
    }
    if (self->_requiresTargetElementToBegin) {
      unint64_t v21 = @"Y";
    }
    else {
      unint64_t v21 = @"N";
    }
    uint64_t v22 = [(PKTextInputDrawingGestureRecognizer *)self targetElement];
    if (v22) {
      uint64_t v23 = @"Y";
    }
    else {
      uint64_t v23 = @"N";
    }
    if (self->_requiresPastTapToBegin) {
      v24 = @"Y";
    }
    else {
      v24 = @"N";
    }
    if (v6) {
      double v19 = @"Y";
    }
    int v25 = [(PKTextInputDrawingGestureRecognizer *)self drawingTouch];
    [(PKTextInputDrawingGestureRecognizer *)self _distanceFromStartPositionForTouch:v25];
    *(_DWORD *)id location = 134219522;
    *(void *)&location[4] = v28;
    __int16 v34 = 2112;
    uint64_t v35 = v27;
    __int16 v36 = 2112;
    v37 = v21;
    __int16 v38 = 2112;
    v39 = v23;
    __int16 v40 = 2112;
    v41 = v24;
    __int16 v42 = 2112;
    v43 = v19;
    __int16 v44 = 2048;
    uint64_t v45 = v26;
    _os_log_debug_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEBUG, "Gesture touch %p evaluateMovingToBeganState shouldBegin: %@, requiresTargetElementToBegin: %@, hasTargetElement: %@, requiresPastTap: %@, hasMovedPastTap: %@, movedDistance: %0.2f", location, 0x48u);
  }
  if (v7)
  {
    [(PKTextInputDrawingGestureRecognizer *)self setState:1];
    if ([(PKTextInputDrawingGestureRecognizer *)self state] == 5)
    {
      [(PKTextInputDrawingGestureRecognizer *)self _cancelOrFailGesture];
    }
    else
    {
      [(PKTextInputDrawingGestureRecognizer *)self _beginDrawingIfNeeded];
      [(PKTextInputDrawingGestureRecognizer *)self _updateStrokeAcceptanceStateUseTimestampFromTouch:1];
      CGFloat v12 = +[PKTextInputSettings sharedSettings];
      [v12 asyncElementRequestTimeout];
      double v14 = v13;

      if (![(PKTextInputDrawingGestureRecognizer *)self strokeAcceptanceState]
        && !self->_timeoutBlock
        && v14 > 0.0)
      {
        objc_initWeak((id *)location, self);
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __88__PKTextInputDrawingGestureRecognizer__evaluateMovingToBeganStateUseTimestampFromTouch___block_invoke;
        v31[3] = &unk_1E64C5998;
        objc_copyWeak(&v32, (id *)location);
        dispatch_block_t v15 = dispatch_block_create((dispatch_block_flags_t)0, v31);
        id timeoutBlock = self->_timeoutBlock;
        self->_id timeoutBlock = v15;

        dispatch_time_t v17 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
        dispatch_after(v17, MEMORY[0x1E4F14428], self->_timeoutBlock);
        objc_destroyWeak(&v32);
        objc_destroyWeak((id *)location);
      }
    }
    [(PKTextInputDrawingGestureRecognizer *)self _cancelNotMovingCancellationBlock];
  }
  else if (!self->_notMovingCancelBlock)
  {
    objc_initWeak((id *)location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__PKTextInputDrawingGestureRecognizer__evaluateMovingToBeganStateUseTimestampFromTouch___block_invoke_2;
    block[3] = &unk_1E64C5998;
    objc_copyWeak(&v30, (id *)location);
    dispatch_block_t v9 = dispatch_block_create((dispatch_block_flags_t)0, block);
    id notMovingCancelBlock = self->_notMovingCancelBlock;
    self->_id notMovingCancelBlock = v9;

    dispatch_time_t v11 = dispatch_time(0, 500000000);
    dispatch_after(v11, MEMORY[0x1E4F14428], self->_notMovingCancelBlock);
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)location);
  }
}

void __88__PKTextInputDrawingGestureRecognizer__evaluateMovingToBeganStateUseTimestampFromTouch___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _acceptStrokeTimeoutTriggered];
}

void __88__PKTextInputDrawingGestureRecognizer__evaluateMovingToBeganStateUseTimestampFromTouch___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _evaluateCancelIfNotMoving];
}

- (void)_updateStrokeAcceptanceStateUseTimestampFromTouch:(BOOL)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (![(PKTextInputDrawingGestureRecognizer *)self strokeAcceptanceState])
  {
    id v5 = +[PKTextInputSettings sharedSettings];
    if ([(PKTextInputDrawingGestureRecognizer *)self state] == 1
      || [(PKTextInputDrawingGestureRecognizer *)self state] == 2)
    {
      if (!self->_requiresTargetElementToBegin
        || ([(PKTextInputDrawingGestureRecognizer *)self targetElement],
            BOOL v6 = objc_claimAutoreleasedReturnValue(),
            v6,
            v6))
      {
        int v7 = os_log_create("com.apple.pencilkit", "PencilTextInput");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = [(PKTextInputDrawingGestureRecognizer *)self drawingTouch];
          if (self->_requiresTargetElementToBegin) {
            dispatch_block_t v9 = @"Y";
          }
          else {
            dispatch_block_t v9 = @"N";
          }
          double v10 = [(PKTextInputDrawingGestureRecognizer *)self targetElement];
          int v29 = 134218498;
          if (v10) {
            dispatch_time_t v11 = @"Y";
          }
          else {
            dispatch_time_t v11 = @"N";
          }
          id v30 = v8;
          __int16 v31 = 2112;
          id v32 = v9;
          __int16 v33 = 2112;
          __int16 v34 = v11;
          _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Gesture touch %p updateStrokeAcceptanceState acceping stroke, requiresElement: %@, hasElement: %@", (uint8_t *)&v29, 0x20u);
        }
        uint64_t v12 = 1;
        goto LABEL_42;
      }
    }
    if (self->_requiresTargetElementToBegin)
    {
      if (self->_waitingForTargetElementSearch)
      {
        BOOL v13 = 0;
LABEL_21:
        int v16 = [(PKTextInputDrawingGestureRecognizer *)self targetElement];
        BOOL v14 = v16 != 0;

        goto LABEL_22;
      }
      dispatch_block_t v15 = [(PKTextInputDrawingGestureRecognizer *)self targetElement];
      BOOL v13 = v15 == 0;

      if (self->_requiresTargetElementToBegin) {
        goto LABEL_21;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
    BOOL v14 = 1;
LABEL_22:
    if (a3)
    {
      dispatch_time_t v17 = [(PKTextInputDrawingGestureRecognizer *)self drawingTouch];
      [(PKTextInputDrawingGestureRecognizer *)self timeIntervalSinceTouchesBeganForTouch:v17];
      double v19 = v18;
    }
    else
    {
      [(PKTextInputDrawingGestureRecognizer *)self timeIntervalSinceTouchesBeganForTouch:0];
      double v19 = v20;
    }
    [v5 asyncElementRequestTimeout];
    double v22 = v21;
    char v23 = v19 <= v21 || v14;
    if (!v13 && (v23 & 1) != 0) {
      goto LABEL_43;
    }
    int v7 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [(PKTextInputDrawingGestureRecognizer *)self drawingTouch];
      if (v13) {
        int v25 = @"Y";
      }
      else {
        int v25 = @"N";
      }
      if (v14) {
        uint64_t v26 = @"Y";
      }
      else {
        uint64_t v26 = @"N";
      }
      if (v19 > v22) {
        uint64_t v27 = @"Y";
      }
      else {
        uint64_t v27 = @"N";
      }
      [v5 asyncElementRequestTimeout];
      int v29 = 134219266;
      id v30 = v24;
      __int16 v31 = 2112;
      id v32 = v25;
      __int16 v33 = 2112;
      __int16 v34 = v26;
      __int16 v35 = 2112;
      __int16 v36 = v27;
      __int16 v37 = 2048;
      double v38 = v19;
      __int16 v39 = 2048;
      uint64_t v40 = v28;
      _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Gesture touch %p updateStrokeAcceptanceState rejecting stroke. targetSearchFailed: %@, targetSearchSatisfied: %@, targetSearchTimedOut: %@, timeSinceStart: %0.3f, cancelTime: %0.3f", (uint8_t *)&v29, 0x3Eu);
    }
    uint64_t v12 = 2;
LABEL_42:

    [(PKTextInputDrawingGestureRecognizer *)self _setStrokeAcceptanceState:v12];
LABEL_43:
  }
}

- (void)_setStrokeAcceptanceState:(int64_t)a3
{
  if (self->_strokeAcceptanceState != a3)
  {
    self->_strokeAcceptanceState = a3;
    if (a3)
    {
      id v4 = [(PKTextInputDrawingGestureRecognizer *)self delegate];
      [v4 drawingGestureStrokeAcceptanceStateDidChange:self];
    }
    +[PKTextInputDebugStateIntrospector debugStateDidChange];
  }
}

- (void)_evaluateCancelIfNotMoving
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(PKTextInputDrawingGestureRecognizer *)self _cancelNotMovingCancellationBlock];
  if (self->_requiresPastTapToBegin
    && ![(PKTextInputDrawingGestureRecognizer *)self state]
    && ![(PKTextInputDrawingGestureRecognizer *)self hasMovedPastTapUseTimestampFromTouch:0]&& ![(PKTextInputDrawingGestureRecognizer *)self _gestureStartedInsideTargetElement])
  {
    BOOL v3 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(PKTextInputDrawingGestureRecognizer *)self drawingTouch];
      id v5 = [(PKTextInputDrawingGestureRecognizer *)self drawingTouch];
      [(PKTextInputDrawingGestureRecognizer *)self timeIntervalSinceTouchesBeganForTouch:v5];
      uint64_t v7 = v6;
      unint64_t v8 = [(PKTextInputDrawingGestureRecognizer *)self state];
      if (v8 > 5) {
        dispatch_block_t v9 = 0;
      }
      else {
        dispatch_block_t v9 = off_1E64CB7E8[v8];
      }
      int v10 = 134218498;
      dispatch_time_t v11 = v4;
      __int16 v12 = 2048;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      dispatch_block_t v15 = v9;
      _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "Gesture touch %p Cancelling gesture because it hasn't moved past tap (outside of target) after %0.2fs, state: %@.", (uint8_t *)&v10, 0x20u);
    }
    [(PKTextInputDrawingGestureRecognizer *)self cancel];
  }
}

- (void)_cancelNotMovingCancellationBlock
{
  id notMovingCancelBlock = self->_notMovingCancelBlock;
  if (notMovingCancelBlock)
  {
    dispatch_block_cancel(notMovingCancelBlock);
    id v4 = self->_notMovingCancelBlock;
    self->_id notMovingCancelBlock = 0;
  }
}

- (void)_cancelScheduledStrokeAcceptanceBlock
{
  id timeoutBlock = self->_timeoutBlock;
  if (timeoutBlock)
  {
    dispatch_block_cancel(timeoutBlock);
    id v4 = self->_timeoutBlock;
    self->_id timeoutBlock = 0;
  }
}

- (void)_acceptStrokeTimeoutTriggered
{
  [(PKTextInputDrawingGestureRecognizer *)self _cancelScheduledStrokeAcceptanceBlock];

  [(PKTextInputDrawingGestureRecognizer *)self _updateStrokeAcceptanceStateUseTimestampFromTouch:0];
}

- (void)_cancelOrFailGesture
{
  if ([(PKTextInputDrawingGestureRecognizer *)self state]) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 5;
  }
  [(PKTextInputDrawingGestureRecognizer *)self setState:v3];
  if (self->_drawingTargetIsDrawing) {
    [(PKTextInputDrawingGestureRecognizer *)self cancelDrawing];
  }
  [(PKTextInputDrawingGestureRecognizer *)self _cancelLongPressTimerBlocks];

  [(PKTextInputDrawingGestureRecognizer *)self _setLongPressState:3];
}

- (void)_endDrawing
{
}

- (void)cancel
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(PKTextInputDrawingGestureRecognizer *)self state] != 5
    && [(PKTextInputDrawingGestureRecognizer *)self state] != 4)
  {
    uint64_t v3 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(PKTextInputDrawingGestureRecognizer *)self drawingTouch];
      int v5 = 134218240;
      uint64_t v6 = v4;
      __int16 v7 = 2048;
      uint64_t v8 = [(PKTextInputDrawingGestureRecognizer *)self state];
      _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "Gesture touch %p cancel called, state: %ld. Cancelling gesture.", (uint8_t *)&v5, 0x16u);
    }
    [(PKTextInputDrawingGestureRecognizer *)self _cancelOrFailGesture];
  }
}

- (void)reset
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id gestureEnvironmentResetTimeoutBlock = self->_gestureEnvironmentResetTimeoutBlock;
  if (gestureEnvironmentResetTimeoutBlock)
  {
    dispatch_block_cancel(gestureEnvironmentResetTimeoutBlock);
    id v4 = self->_gestureEnvironmentResetTimeoutBlock;
    self->_id gestureEnvironmentResetTimeoutBlock = 0;
  }
  int v5 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(PKTextInputDrawingGestureRecognizer *)self drawingTouch];
    if (self->_drawingTargetIsDrawing) {
      __int16 v7 = @"Y";
    }
    else {
      __int16 v7 = @"N";
    }
    unint64_t v8 = [(PKTextInputDrawingGestureRecognizer *)self state];
    if (v8 > 5) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = off_1E64CB7E8[v8];
    }
    int v12 = 134218498;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    dispatch_block_t v15 = v7;
    __int16 v16 = 2112;
    dispatch_time_t v17 = v9;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Gesture touch %p reset, drawingTargetIsDrawing: %@, state: %@", (uint8_t *)&v12, 0x20u);
  }
  uint64_t v10 = [(PKTextInputDrawingGestureRecognizer *)self state];
  if (self->_drawingTargetIsDrawing)
  {
    if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 4
      || [(PKTextInputDrawingGestureRecognizer *)self strokeAcceptanceState] != 1)
    {
      [(PKTextInputDrawingGestureRecognizer *)self cancelDrawing];
    }
    else
    {
      [(PKTextInputDrawingGestureRecognizer *)self _drawingEnded];
    }
  }
  drawingTouch = self->_drawingTouch;
  self->_drawingTouch = 0;

  self->_drawingTargetIsDrawing = 0;
  self->_strokeAcceptanceState = 0;
  [(PKTextInputDrawingGestureRecognizer *)self setTargetElement:0];
  self->_waitingForTargetElementSearch = 0;
  self->_requiresTargetElementToBegin = 0;
  self->_requiresPastTapToBegin = 0;
  [(PKTextInputDrawingGestureRecognizer *)self _cancelScheduledStrokeAcceptanceBlock];
  [(PKTextInputDrawingGestureRecognizer *)self _cancelNotMovingCancellationBlock];
  [(PKTextInputDrawingGestureRecognizer *)self _cancelLongPressTimerBlocks];
  [(PKTextInputDrawingGestureRecognizer *)self _setLongPressState:0];
  [(PKTextInputDrawingGestureRecognizer *)self _setPanState:0];
  [(PKTextInputDrawingGestureRecognizer *)self _setPanDirection:0];
  +[PKTextInputDebugStateIntrospector debugStateDidChange];
}

+ (id)_systemGestureClassesToAvoid
{
  if (_MergedGlobals_23 != -1) {
    dispatch_once(&_MergedGlobals_23, &__block_literal_global_25);
  }
  v2 = (void *)qword_1EA3C6C88;

  return v2;
}

void __67__PKTextInputDrawingGestureRecognizer__systemGestureClassesToAvoid__block_invoke()
{
  id v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  Class v0 = NSClassFromString(&cfstr_Uitouchduratio.isa);
  if (v0) {
    [v6 addObject:v0];
  }
  Class v1 = NSClassFromString(&cfstr_Uisystemgestur.isa);
  if (v1) {
    [v6 addObject:v1];
  }
  Class v2 = NSClassFromString(&cfstr_Uirelationship.isa);
  uint64_t v3 = v6;
  if (v2)
  {
    objc_msgSend(v6, "addObject:");
    uint64_t v3 = v6;
  }
  uint64_t v4 = [v3 copy];
  int v5 = (void *)qword_1EA3C6C88;
  qword_1EA3C6C88 = v4;
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v4 = [(id)objc_opt_class() _systemGestureClassesToAvoid];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v23 != v7) {
        objc_enumerationMutation(v4);
      }
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    uint64_t v9 = [v3 name];

    if (v9 == @"com.apple.PencilKit.tapGestureFailure")
    {
      BOOL v16 = 0;
      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v16 = 1;
      goto LABEL_22;
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = objc_msgSend(v3, "view", 0);
    uint64_t v4 = [v10 gestureRecognizers];

    uint64_t v11 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (!v11)
    {
      BOOL v16 = 1;
      goto LABEL_21;
    }
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
LABEL_13:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v19 != v13) {
        objc_enumerationMutation(v4);
      }
      dispatch_block_t v15 = [*(id *)(*((void *)&v18 + 1) + 8 * v14) name];

      if (v15 == @"com.apple.PencilKit.tapGestureFailure") {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
        BOOL v16 = 1;
        if (v12) {
          goto LABEL_13;
        }
        goto LABEL_21;
      }
    }
  }
  BOOL v16 = 0;
LABEL_21:

LABEL_22:
  return v16;
}

- (void)_setDrawingTargetIsDrawing:(BOOL)a3
{
  if (self->_drawingTargetIsDrawing != a3)
  {
    self->_drawingTargetIsDrawing = a3;
    id v4 = [(PKTextInputDrawingGestureRecognizer *)self delegate];
    [v4 drawingGestureRecognizerDrawingTargetIsDrawingDidChange:self];
  }
}

- (void)_drawingBegan
{
  if (!self->_drawingTargetIsDrawing)
  {
    [(PKTextInputDrawingGestureRecognizer *)self _setDrawingTargetIsDrawing:1];
    id v3 = [(PKTextInputDrawingGestureRecognizer *)self drawingTarget];
    [v3 drawingBegan:self->_drawingTouch];

    +[PKTextInputDebugStateIntrospector debugStateDidChange];
  }
}

- (void)_drawingMoved:(id)a3
{
  if (self->_drawingTargetIsDrawing)
  {
    id v4 = a3;
    id v5 = [(PKTextInputDrawingGestureRecognizer *)self drawingTarget];
    [v5 drawingMoved:self->_drawingTouch withEvent:v4];
  }
}

- (void)_drawingEnded
{
  if (self->_drawingTargetIsDrawing)
  {
    id v3 = [(PKTextInputDrawingGestureRecognizer *)self drawingTarget];
    [v3 drawingEnded:self->_drawingTouch];

    [(PKTextInputDrawingGestureRecognizer *)self _setDrawingTargetIsDrawing:0];
    +[PKTextInputDebugStateIntrospector debugStateDidChange];
  }
}

- (void)cancelDrawing
{
  if (self->_drawingTargetIsDrawing)
  {
    id v3 = [(PKTextInputDrawingGestureRecognizer *)self drawingTarget];
    [v3 drawingCancelled];

    [(PKTextInputDrawingGestureRecognizer *)self _setDrawingTargetIsDrawing:0];
    +[PKTextInputDebugStateIntrospector debugStateDidChange];
  }
}

- (void)reportDebugStateDescription:(id)a3
{
  long long v20 = (void (**)(id, __CFString *, __CFString *))a3;
  unint64_t v4 = [(PKTextInputDrawingGestureRecognizer *)self state];
  if (v4 > 5) {
    id v5 = 0;
  }
  else {
    id v5 = off_1E64CB7E8[v4];
  }
  v20[2](v20, @"Gesture state", v5);
  if ([(PKTextInputDrawingGestureRecognizer *)self drawingTargetIsDrawing]) {
    uint64_t v6 = @"Yes";
  }
  else {
    uint64_t v6 = @"No";
  }
  v20[2](v20, @"drawingTargetIsDrawing", v6);
  unint64_t v7 = [(PKTextInputDrawingGestureRecognizer *)self strokeAcceptanceState];
  if (v7 > 2) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = off_1E64CB818[v7];
  }
  v20[2](v20, @"strokeAcceptanceState", v8);
  unint64_t v9 = [(PKTextInputDrawingGestureRecognizer *)self longPressState];
  if (v9 > 3) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = off_1E64CB830[v9];
  }
  v20[2](v20, @"longPressState", v10);
  unint64_t v11 = [(PKTextInputDrawingGestureRecognizer *)self panState];
  if (v11 > 2) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = off_1E64CB850[v11];
  }
  v20[2](v20, @"panState", v12);
  unint64_t v13 = [(PKTextInputDrawingGestureRecognizer *)self panDirection];
  if (v13 > 4) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = off_1E64CB868[v13];
  }
  v20[2](v20, @"panDirection", v14);
  if (self->_requiresTargetElementToBegin) {
    dispatch_block_t v15 = @"Yes";
  }
  else {
    dispatch_block_t v15 = @"No";
  }
  v20[2](v20, @"requiresTargetElementToBegin", v15);
  if (self->_requiresPastTapToBegin) {
    BOOL v16 = @"Yes";
  }
  else {
    BOOL v16 = @"No";
  }
  v20[2](v20, @"requiresPastTapToBegin", v16);
  if (self->_waitingForTargetElementSearch) {
    dispatch_time_t v17 = @"Yes";
  }
  else {
    dispatch_time_t v17 = @"No";
  }
  v20[2](v20, @"waitingForTargetElementSearch", v17);
  long long v18 = [(PKTextInputDrawingGestureRecognizer *)self targetElement];
  if (v18) {
    long long v19 = @"Yes";
  }
  else {
    long long v19 = @"No";
  }
  v20[2](v20, @"hasTargetElement", v19);
}

- (void)_replayDrawingBegan:(id *)a3
{
  id v5 = [(PKTextInputDrawingGestureRecognizer *)self view];
  long long v6 = *(_OWORD *)&a3->var9;
  v10[4] = *(_OWORD *)&a3->var7;
  v10[5] = v6;
  long long v7 = *(_OWORD *)&a3->var13;
  v10[6] = *(_OWORD *)&a3->var11;
  v10[7] = v7;
  long long v8 = *(_OWORD *)&a3->var1;
  v10[0] = a3->var0;
  v10[1] = v8;
  long long v9 = *(_OWORD *)&a3->var5;
  v10[2] = *(_OWORD *)&a3->var3;
  v10[3] = v9;
  [(PKTextInputDrawingGestureRecognizer *)self _replayDrawingBegan:v10 coordinateSpace:v5 activeInputProperties:23 inputType:1];
}

- (void)_replayDrawingBegan:(id *)a3 coordinateSpace:(id)a4 activeInputProperties:(unint64_t)a5 inputType:(int64_t)a6
{
  id v10 = a4;
  [(PKTextInputDrawingGestureRecognizer *)self setIsReplaying:1];
  [(PKTextInputDrawingGestureRecognizer *)self _setDrawingTargetIsDrawing:1];
  [(PKTextInputDrawingGestureRecognizer *)self _setStrokeAcceptanceState:1];
  unint64_t v11 = [(PKTextInputDrawingGestureRecognizer *)self drawingTarget];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    unint64_t v13 = [(PKTextInputDrawingGestureRecognizer *)self drawingTarget];
    long long v14 = *(_OWORD *)&a3->var9;
    v18[4] = *(_OWORD *)&a3->var7;
    v18[5] = v14;
    long long v15 = *(_OWORD *)&a3->var13;
    v18[6] = *(_OWORD *)&a3->var11;
    v18[7] = v15;
    long long v16 = *(_OWORD *)&a3->var1;
    v18[0] = a3->var0;
    v18[1] = v16;
    long long v17 = *(_OWORD *)&a3->var5;
    v18[2] = *(_OWORD *)&a3->var3;
    v18[3] = v17;
    [v13 _replayDrawingBegan:v18 coordinateSpace:v10 activeInputProperties:a5 inputType:a6];
  }
}

- (void)_replayDrawingMoved:(id *)a3
{
  id v5 = [(PKTextInputDrawingGestureRecognizer *)self view];
  long long v6 = *(_OWORD *)&a3->var9;
  v10[4] = *(_OWORD *)&a3->var7;
  v10[5] = v6;
  long long v7 = *(_OWORD *)&a3->var13;
  v10[6] = *(_OWORD *)&a3->var11;
  v10[7] = v7;
  long long v8 = *(_OWORD *)&a3->var1;
  v10[0] = a3->var0;
  v10[1] = v8;
  long long v9 = *(_OWORD *)&a3->var5;
  v10[2] = *(_OWORD *)&a3->var3;
  v10[3] = v9;
  [(PKTextInputDrawingGestureRecognizer *)self _replayDrawingMoved:v10 coordinateSpace:v5];
}

- (void)_replayDrawingMoved:(id *)a3 coordinateSpace:(id)a4
{
  id v6 = a4;
  long long v7 = [(PKTextInputDrawingGestureRecognizer *)self drawingTarget];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    long long v9 = [(PKTextInputDrawingGestureRecognizer *)self drawingTarget];
    long long v10 = *(_OWORD *)&a3->var9;
    v14[4] = *(_OWORD *)&a3->var7;
    v14[5] = v10;
    long long v11 = *(_OWORD *)&a3->var13;
    v14[6] = *(_OWORD *)&a3->var11;
    v14[7] = v11;
    long long v12 = *(_OWORD *)&a3->var1;
    v14[0] = a3->var0;
    v14[1] = v12;
    long long v13 = *(_OWORD *)&a3->var5;
    v14[2] = *(_OWORD *)&a3->var3;
    v14[3] = v13;
    [v9 _replayDrawingMoved:v14 coordinateSpace:v6];
  }
}

- (void)_replayDrawingEnded
{
  if ([(PKTextInputDrawingGestureRecognizer *)self drawingTargetIsDrawing])
  {
    id v3 = [(PKTextInputDrawingGestureRecognizer *)self drawingTarget];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = [(PKTextInputDrawingGestureRecognizer *)self drawingTarget];
      [v5 _replayDrawingEnded];
    }
    [(PKTextInputDrawingGestureRecognizer *)self _setDrawingTargetIsDrawing:0];
  }
  [(PKTextInputDrawingGestureRecognizer *)self setIsReplaying:0];

  [(PKTextInputDrawingGestureRecognizer *)self reset];
}

- (void)_replayDrawingCancelled
{
  if ([(PKTextInputDrawingGestureRecognizer *)self isReplaying])
  {
    [(PKTextInputDrawingGestureRecognizer *)self cancel];
    if ([(PKTextInputDrawingGestureRecognizer *)self drawingTargetIsDrawing])
    {
      id v3 = [(PKTextInputDrawingGestureRecognizer *)self drawingTarget];
      char v4 = objc_opt_respondsToSelector();

      if (v4)
      {
        id v5 = [(PKTextInputDrawingGestureRecognizer *)self drawingTarget];
        [v5 _replayDrawingCancelled];
      }
      [(PKTextInputDrawingGestureRecognizer *)self _setDrawingTargetIsDrawing:0];
    }
    [(PKTextInputDrawingGestureRecognizer *)self setIsReplaying:0];
  }

  [(PKTextInputDrawingGestureRecognizer *)self reset];
}

- (unint64_t)activeInputProperties
{
  return self->_activeInputProperties;
}

- (PKDrawingGestureTarget)drawingTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->drawingTarget);

  return (PKDrawingGestureTarget *)WeakRetained;
}

- (void)setDrawingTarget:(id)a3
{
}

- (BOOL)drawingTargetIsDrawing
{
  return self->_drawingTargetIsDrawing;
}

- (int64_t)strokeAcceptanceState
{
  return self->_strokeAcceptanceState;
}

- (int64_t)longPressState
{
  return self->_longPressState;
}

- (PKTextInputElement)targetElement
{
  return self->_targetElement;
}

- (void)setTargetElement:(id)a3
{
}

- (BOOL)isReplaying
{
  return self->_isReplaying;
}

- (void)setIsReplaying:(BOOL)a3
{
  self->_isReplaying = a3;
}

- (UITouch)drawingTouch
{
  return self->_drawingTouch;
}

- (void)setDrawingTouch:(id)a3
{
}

- (int64_t)panState
{
  return self->_panState;
}

- (int64_t)panDirection
{
  return self->_panDirection;
}

- (void)_setPanDirection:(int64_t)a3
{
  self->_panDirection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingTouch, 0);
  objc_storeStrong((id *)&self->_targetElement, 0);
  objc_destroyWeak((id *)&self->drawingTarget);
  objc_storeStrong(&self->_gestureEnvironmentResetTimeoutBlock, 0);
  objc_storeStrong(&self->_notMovingCancelBlock, 0);
  objc_storeStrong(&self->_longPressSuccessBlock, 0);
  objc_storeStrong(&self->_longPressTentativeBlock, 0);

  objc_storeStrong(&self->_timeoutBlock, 0);
}

@end