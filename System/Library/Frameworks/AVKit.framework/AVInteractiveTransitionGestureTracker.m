@interface AVInteractiveTransitionGestureTracker
- (AVInteractiveTransitionGestureTracker)init;
- (AVTransitionDriverDelegate)transitionDriverDelegate;
- (BOOL)_isWaitingToContinue;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasContinued;
- (BOOL)hasRotated;
- (BOOL)isEnabled;
- (BOOL)isPanToDismissEnabled;
- (BOOL)isPinchToDismissEnabled;
- (BOOL)isPinchToPresentEnabled;
- (BOOL)isTracking;
- (BOOL)isWaitingForBoundsChange;
- (BOOL)isWaitingForLocationChangeAfterBoundsChange;
- (BOOL)isWaitingForTransition;
- (BOOL)lastNonZeroVelocityWasDownward;
- (BOOL)transitionDriver:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (CGPoint)_filteredUntranslatedLocationInWindow;
- (CGPoint)_untranslatedUnfilteredLocationInFixedCoordinateSpace;
- (CGPoint)anchorLocationInWindow;
- (CGPoint)gestureLocationAfterBoundsChange;
- (CGPoint)lastReportedLocationInWindow;
- (CGPoint)locationInWindow;
- (CGPoint)translationInWindow;
- (CGPoint)velocityInWindow;
- (CGRect)initialCoordinateSpaceBounds;
- (NSArray)recognizers;
- (UIPanGestureRecognizer)contentTransitioningViewGestureRecognizer;
- (UIPanGestureRecognizer)indirectPanGestureRecognizer;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UIPinchGestureRecognizer)pinchGestureRecognizer;
- (UIRotationGestureRecognizer)rotationGestureRecognizer;
- (UIView)view;
- (double)_rotation;
- (double)angleOfVelocityInWindow;
- (double)pinchScale;
- (double)pinchVelocity;
- (double)previousPinchScale;
- (double)rotation;
- (double)rotationVelocity;
- (double)timestampOfTouchWithLocationChangeAfterBoundsChange;
- (id)_locationRecognizer;
- (int64_t)initialInterfaceOrientation;
- (int64_t)transitionInteraction;
- (void)_beginTracking:(int64_t)a3;
- (void)_cancel;
- (void)_finish;
- (void)_handlePanGesture:(id)a3;
- (void)_handlePinchGesture:(id)a3;
- (void)_handleRotationGesture:(id)a3;
- (void)_reset;
- (void)_resetGesturesIfPossible;
- (void)_setHasContinuedIfNeeded;
- (void)_setRotation:(double)a3;
- (void)_updateLastNonZeroVelocityDirection;
- (void)addRecognizersToView:(id)a3;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)setAnchorLocationInWindow:(CGPoint)a3;
- (void)setContentTransitioningViewGestureRecognizer:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGestureLocationAfterBoundsChange:(CGPoint)a3;
- (void)setHasContinued:(BOOL)a3;
- (void)setHasRotated:(BOOL)a3;
- (void)setInitialCoordinateSpaceBounds:(CGRect)a3;
- (void)setInitialInterfaceOrientation:(int64_t)a3;
- (void)setLastNonZeroVelocityWasDownward:(BOOL)a3;
- (void)setLastReportedLocationInWindow:(CGPoint)a3;
- (void)setPanToDismissEnabled:(BOOL)a3;
- (void)setPinchToDismissEnabled:(BOOL)a3;
- (void)setPinchToPresentEnabled:(BOOL)a3;
- (void)setPreviousPinchScale:(double)a3;
- (void)setTimestampOfTouchWithLocationChangeAfterBoundsChange:(double)a3;
- (void)setTransitionDriverDelegate:(id)a3;
- (void)setTransitionInteraction:(int64_t)a3;
- (void)setView:(id)a3;
- (void)setWaitingForBoundsChange:(BOOL)a3;
- (void)setWaitingForLocationChangeAfterBoundsChange:(BOOL)a3;
- (void)setWaitingForTransition:(BOOL)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation AVInteractiveTransitionGestureTracker

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_recognizers, 0);
  objc_storeStrong((id *)&self->_rotationGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_indirectPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_transitionDriverDelegate);
  objc_destroyWeak((id *)&self->_contentTransitioningViewGestureRecognizer);

  objc_storeStrong((id *)&self->_activePanGestureRecognizer, 0);
}

- (void)setView:(id)a3
{
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (UIView *)WeakRetained;
}

- (void)setTransitionInteraction:(int64_t)a3
{
  self->_transitionInteraction = a3;
}

- (int64_t)transitionInteraction
{
  return self->_transitionInteraction;
}

- (void)setLastNonZeroVelocityWasDownward:(BOOL)a3
{
  self->_lastNonZeroVelocityWasDownward = a3;
}

- (BOOL)lastNonZeroVelocityWasDownward
{
  return self->_lastNonZeroVelocityWasDownward;
}

- (void)setAnchorLocationInWindow:(CGPoint)a3
{
  self->_anchorLocationInWindow = a3;
}

- (CGPoint)anchorLocationInWindow
{
  double x = self->_anchorLocationInWindow.x;
  double y = self->_anchorLocationInWindow.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastReportedLocationInWindow:(CGPoint)a3
{
  self->_lastReportedLocationInWindow = a3;
}

- (CGPoint)lastReportedLocationInWindow
{
  double x = self->_lastReportedLocationInWindow.x;
  double y = self->_lastReportedLocationInWindow.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setGestureLocationAfterBoundsChange:(CGPoint)a3
{
  self->_gestureLocationAfterBoundsChange = a3;
}

- (CGPoint)gestureLocationAfterBoundsChange
{
  double x = self->_gestureLocationAfterBoundsChange.x;
  double y = self->_gestureLocationAfterBoundsChange.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialCoordinateSpaceBounds:(CGRect)a3
{
  self->_initialCoordinateSpaceBounds = a3;
}

- (CGRect)initialCoordinateSpaceBounds
{
  double x = self->_initialCoordinateSpaceBounds.origin.x;
  double y = self->_initialCoordinateSpaceBounds.origin.y;
  double width = self->_initialCoordinateSpaceBounds.size.width;
  double height = self->_initialCoordinateSpaceBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInitialInterfaceOrientation:(int64_t)a3
{
  self->_initialInterfaceOrientation = a3;
}

- (int64_t)initialInterfaceOrientation
{
  return self->_initialInterfaceOrientation;
}

- (void)setHasRotated:(BOOL)a3
{
  self->_hasRotated = a3;
}

- (BOOL)hasRotated
{
  return self->_hasRotated;
}

- (void)setHasContinued:(BOOL)a3
{
  self->_hasContinued = a3;
}

- (BOOL)hasContinued
{
  return self->_hasContinued;
}

- (void)setTimestampOfTouchWithLocationChangeAfterBoundsChange:(double)a3
{
  self->_timestampOfTouchWithLocationChangeAfterBoundsChange = a3;
}

- (double)timestampOfTouchWithLocationChangeAfterBoundsChange
{
  return self->_timestampOfTouchWithLocationChangeAfterBoundsChange;
}

- (void)setWaitingForLocationChangeAfterBoundsChange:(BOOL)a3
{
  self->_waitingForLocationChangeAfterBoundsChange = a3;
}

- (BOOL)isWaitingForLocationChangeAfterBoundsChange
{
  return self->_waitingForLocationChangeAfterBoundsChange;
}

- (void)setWaitingForBoundsChange:(BOOL)a3
{
  self->_waitingForBoundsChange = a3;
}

- (BOOL)isWaitingForBoundsChange
{
  return self->_waitingForBoundsChange;
}

- (void)setWaitingForTransition:(BOOL)a3
{
  self->_waitingForTransition = a3;
}

- (BOOL)isWaitingForTransition
{
  return self->_waitingForTransition;
}

- (NSArray)recognizers
{
  return self->_recognizers;
}

- (UIRotationGestureRecognizer)rotationGestureRecognizer
{
  return self->_rotationGestureRecognizer;
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (UIPanGestureRecognizer)indirectPanGestureRecognizer
{
  return self->_indirectPanGestureRecognizer;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)_setRotation:(double)a3
{
  self->__rotation = a3;
}

- (double)_rotation
{
  return self->__rotation;
}

- (void)setPreviousPinchScale:(double)a3
{
  self->_previousPinchScale = a3;
}

- (double)previousPinchScale
{
  return self->_previousPinchScale;
}

- (void)setPanToDismissEnabled:(BOOL)a3
{
  self->_panToDismissEnabled = a3;
}

- (BOOL)isPanToDismissEnabled
{
  return self->_panToDismissEnabled;
}

- (void)setPinchToPresentEnabled:(BOOL)a3
{
  self->_pinchToPresentEnabled = a3;
}

- (BOOL)isPinchToPresentEnabled
{
  return self->_pinchToPresentEnabled;
}

- (void)setPinchToDismissEnabled:(BOOL)a3
{
  self->_pinchToDismissEnabled = a3;
}

- (BOOL)isPinchToDismissEnabled
{
  return self->_pinchToDismissEnabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setTransitionDriverDelegate:(id)a3
{
}

- (AVTransitionDriverDelegate)transitionDriverDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionDriverDelegate);

  return (AVTransitionDriverDelegate *)WeakRetained;
}

- (UIPanGestureRecognizer)contentTransitioningViewGestureRecognizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentTransitioningViewGestureRecognizer);

  return (UIPanGestureRecognizer *)WeakRetained;
}

- (void)_updateLastNonZeroVelocityDirection
{
  [(AVInteractiveTransitionGestureTracker *)self velocityInWindow];
  if (v3 != 0.0)
  {
    if (v3 <= 0.0)
    {
      BOOL v5 = 0;
    }
    else
    {
      [(AVInteractiveTransitionGestureTracker *)self angleOfVelocityInWindow];
      if (v4 < 0.0) {
        double v4 = -v4;
      }
      BOOL v5 = v4 < 80.0;
    }
    [(AVInteractiveTransitionGestureTracker *)self setLastNonZeroVelocityWasDownward:v5];
  }
}

- (void)_setHasContinuedIfNeeded
{
  if ([(AVInteractiveTransitionGestureTracker *)self _isWaitingToContinue])
  {
    double v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v4 = 0;
      _os_log_error_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_ERROR, "Cannot continue if still waiting.", v4, 2u);
    }
  }
  if (![(AVInteractiveTransitionGestureTracker *)self hasContinued])
  {
    [(AVInteractiveTransitionGestureTracker *)self setHasContinued:1];
    [(AVInteractiveTransitionGestureTracker *)self _resetGesturesIfPossible];
  }
}

- (void)_resetGesturesIfPossible
{
  if (![(AVInteractiveTransitionGestureTracker *)self _isWaitingToContinue])
  {
    [(AVInteractiveTransitionGestureTracker *)self setLastNonZeroVelocityWasDownward:0];
    [(AVInteractiveTransitionGestureTracker *)self locationInWindow];
    -[AVInteractiveTransitionGestureTracker setAnchorLocationInWindow:](self, "setAnchorLocationInWindow:");
    double v3 = [(AVInteractiveTransitionGestureTracker *)self rotationGestureRecognizer];
    [v3 setRotation:0.0];

    id v4 = [(AVInteractiveTransitionGestureTracker *)self pinchGestureRecognizer];
    [v4 setScale:1.0];
  }
}

- (void)_reset
{
  if (![(AVInteractiveTransitionGestureTracker *)self isTracking])
  {
    double v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_error_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_ERROR, "Cannot reset when not tracking.", v4, 2u);
    }
  }
  [(AVInteractiveTransitionGestureTracker *)self setPinchToDismissEnabled:0];
  [(AVInteractiveTransitionGestureTracker *)self setPinchToPresentEnabled:0];
  [(AVInteractiveTransitionGestureTracker *)self setPanToDismissEnabled:0];
  [(AVInteractiveTransitionGestureTracker *)self setTransitionInteraction:0];
  [(AVInteractiveTransitionGestureTracker *)self setHasRotated:0];
  [(AVInteractiveTransitionGestureTracker *)self setHasContinued:0];
  [(AVInteractiveTransitionGestureTracker *)self setWaitingForBoundsChange:0];
  [(AVInteractiveTransitionGestureTracker *)self setWaitingForLocationChangeAfterBoundsChange:0];
  [(AVInteractiveTransitionGestureTracker *)self setWaitingForTransition:0];
  [(AVInteractiveTransitionGestureTracker *)self setInitialInterfaceOrientation:0];
  [(AVInteractiveTransitionGestureTracker *)self _resetGesturesIfPossible];
}

- (BOOL)_isWaitingToContinue
{
  id v3 = [(AVInteractiveTransitionGestureTracker *)self _locationRecognizer];
  id v4 = v3;
  if (self)
  {
    BOOL v5 = [v3 _activeEventOfType:10];
    v6 = v5;
    if (v5) {
      [v5 timestamp];
    }
    else {
      [v4 lastTouchTimestamp];
    }
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }

  if ([(AVInteractiveTransitionGestureTracker *)self isWaitingForBoundsChange])
  {
    [(AVInteractiveTransitionGestureTracker *)self initialCoordinateSpaceBounds];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    v17 = [(AVInteractiveTransitionGestureTracker *)self view];
    v18 = [v17 window];
    v19 = [v18 windowScene];
    v20 = [v19 coordinateSpace];
    [v20 bounds];
    v37.origin.double x = v21;
    v37.origin.double y = v22;
    v37.size.double width = v23;
    v37.size.double height = v24;
    v36.origin.double x = v10;
    v36.origin.double y = v12;
    v36.size.double width = v14;
    v36.size.double height = v16;
    BOOL v25 = CGRectEqualToRect(v36, v37);

    if (!v25)
    {
      [(AVInteractiveTransitionGestureTracker *)self _untranslatedUnfilteredLocationInFixedCoordinateSpace];
      -[AVInteractiveTransitionGestureTracker setGestureLocationAfterBoundsChange:](self, "setGestureLocationAfterBoundsChange:");
      [(AVInteractiveTransitionGestureTracker *)self setWaitingForLocationChangeAfterBoundsChange:1];
      [(AVInteractiveTransitionGestureTracker *)self setWaitingForBoundsChange:0];
    }
  }
  if (![(AVInteractiveTransitionGestureTracker *)self isWaitingForBoundsChange])
  {
    if ([(AVInteractiveTransitionGestureTracker *)self isWaitingForLocationChangeAfterBoundsChange])
    {
      [(AVInteractiveTransitionGestureTracker *)self _untranslatedUnfilteredLocationInFixedCoordinateSpace];
      double v27 = v26;
      double v29 = v28;
      [(AVInteractiveTransitionGestureTracker *)self gestureLocationAfterBoundsChange];
      if (v27 != v31 || v29 != v30)
      {
        [(AVInteractiveTransitionGestureTracker *)self setWaitingForLocationChangeAfterBoundsChange:0];
        [(AVInteractiveTransitionGestureTracker *)self setTimestampOfTouchWithLocationChangeAfterBoundsChange:v8];
      }
    }
  }
  v32 = [(AVInteractiveTransitionGestureTracker *)self _locationRecognizer];
  unint64_t v33 = [v32 state];

  if (v33 > 2) {
    return 0;
  }
  if ([(AVInteractiveTransitionGestureTracker *)self isWaitingForBoundsChange]
    || [(AVInteractiveTransitionGestureTracker *)self isWaitingForTransition]
    || [(AVInteractiveTransitionGestureTracker *)self isWaitingForLocationChangeAfterBoundsChange])
  {
    return 1;
  }
  [(AVInteractiveTransitionGestureTracker *)self timestampOfTouchWithLocationChangeAfterBoundsChange];
  return v8 - v35 < 0.0166666667;
}

- (void)_finish
{
  if (![(AVInteractiveTransitionGestureTracker *)self isTracking])
  {
    id v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_error_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_ERROR, "Cannot finish when not tracking.", v5, 2u);
    }
  }
  id v4 = [(AVInteractiveTransitionGestureTracker *)self transitionDriverDelegate];
  [v4 transitionDriverDidFinishInteraction:self];

  [(AVInteractiveTransitionGestureTracker *)self _reset];
}

- (void)_cancel
{
  if (![(AVInteractiveTransitionGestureTracker *)self isTracking])
  {
    id v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_error_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_ERROR, "Cannot cancel when not tracking.", v5, 2u);
    }
  }
  id v4 = [(AVInteractiveTransitionGestureTracker *)self transitionDriverDelegate];
  [v4 transitionDriverDidCancelInteraction:self];

  [(AVInteractiveTransitionGestureTracker *)self _reset];
}

- (void)_beginTracking:(int64_t)a3
{
  [(AVInteractiveTransitionGestureTracker *)self _filteredUntranslatedLocationInWindow];
  if ([(AVInteractiveTransitionGestureTracker *)self isTracking])
  {
    BOOL v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_ERROR, "Began tracking when already tracking.", buf, 2u);
    }
  }
  [(AVInteractiveTransitionGestureTracker *)self setWaitingForTransition:1];
  v6 = [(AVInteractiveTransitionGestureTracker *)self view];
  double v7 = [v6 window];
  double v8 = [v7 windowScene];
  -[AVInteractiveTransitionGestureTracker setInitialInterfaceOrientation:](self, "setInitialInterfaceOrientation:", [v8 interfaceOrientation]);

  double v9 = [(AVInteractiveTransitionGestureTracker *)self view];
  CGFloat v10 = [v9 window];
  double v11 = [v10 windowScene];
  CGFloat v12 = [v11 coordinateSpace];
  [v12 bounds];
  -[AVInteractiveTransitionGestureTracker setInitialCoordinateSpaceBounds:](self, "setInitialCoordinateSpaceBounds:");

  [(AVInteractiveTransitionGestureTracker *)self setTransitionInteraction:a3];
  [(AVInteractiveTransitionGestureTracker *)self _resetGesturesIfPossible];
  double v13 = [(AVInteractiveTransitionGestureTracker *)self transitionDriverDelegate];
  int64_t v14 = [(AVInteractiveTransitionGestureTracker *)self transitionInteraction];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__AVInteractiveTransitionGestureTracker__beginTracking___block_invoke;
  v15[3] = &unk_1E5FC4698;
  v15[4] = self;
  [v13 transitionDriver:self didBeginTrackingTransitionInteraction:v14 readyToProceedHandler:v15];
}

uint64_t __56__AVInteractiveTransitionGestureTracker__beginTracking___block_invoke(uint64_t a1)
{
  int v2 = (unint64_t)([*(id *)(a1 + 32) initialInterfaceOrientation] - 1) < 2;
  id v3 = [*(id *)(a1 + 32) view];
  id v4 = [v3 window];
  BOOL v5 = [v4 windowScene];
  int v6 = (unint64_t)([v5 interfaceOrientation] - 1) < 2;

  if (v2 != v6)
  {
    double v7 = [*(id *)(a1 + 32) view];
    double v8 = [v7 window];
    double v9 = [v8 windowScene];
    CGFloat v10 = [v9 coordinateSpace];
    [v10 bounds];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    [*(id *)(a1 + 32) initialCoordinateSpaceBounds];
    v28.origin.double x = v19;
    v28.origin.double y = v20;
    v28.size.double width = v21;
    v28.size.double height = v22;
    v27.origin.double x = v12;
    v27.origin.double y = v14;
    v27.size.double width = v16;
    v27.size.double height = v18;
    BOOL v23 = CGRectEqualToRect(v27, v28);

    if (v23) {
      [*(id *)(a1 + 32) setWaitingForBoundsChange:1];
    }
  }
  [*(id *)(a1 + 32) setWaitingForTransition:0];
  [*(id *)(a1 + 32) _resetGesturesIfPossible];
  CGFloat v24 = *(void **)(a1 + 32);

  return [v24 _filteredUntranslatedLocationInWindow];
}

- (void)_handlePanGesture:(id)a3
{
  id v4 = a3;
  if (![(AVInteractiveTransitionGestureTracker *)self isPanToDismissEnabled])
  {
    BOOL v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v7 = 0;
      _os_log_error_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_ERROR, "Recognized pan gesture without enabling pan to dismiss.", v7, 2u);
    }
  }
  switch([v4 state])
  {
    case 1:
      [(AVInteractiveTransitionGestureTracker *)self _beginTracking:3];
      break;
    case 2:
      if (![(AVInteractiveTransitionGestureTracker *)self _isWaitingToContinue])
      {
        [(AVInteractiveTransitionGestureTracker *)self _setHasContinuedIfNeeded];
        [(AVInteractiveTransitionGestureTracker *)self _updateLastNonZeroVelocityDirection];
        int v6 = [(AVInteractiveTransitionGestureTracker *)self transitionDriverDelegate];
        [v6 transitionDriverDidContinueInteraction:self];
      }
      break;
    case 3:
      if ([(AVInteractiveTransitionGestureTracker *)self _isWaitingToContinue]) {
        goto LABEL_6;
      }
      if ([(AVInteractiveTransitionGestureTracker *)self isWaitingForBoundsChange]) {
        [(AVInteractiveTransitionGestureTracker *)self _updateLastNonZeroVelocityDirection];
      }
      [(AVInteractiveTransitionGestureTracker *)self _finish];
      break;
    case 4:
    case 5:
LABEL_6:
      [(AVInteractiveTransitionGestureTracker *)self _cancel];
      break;
    default:
      break;
  }
}

- (void)_handleRotationGesture:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [v11 state];
  BOOL v5 = v11;
  if (v4 != 1)
  {
    if (v4 != 2) {
      goto LABEL_11;
    }
    if (![(AVInteractiveTransitionGestureTracker *)self hasRotated])
    {
      [(AVInteractiveTransitionGestureTracker *)self setHasRotated:1];
      [v11 setRotation:0.0];
    }
    BOOL v6 = [(AVInteractiveTransitionGestureTracker *)self hasRotated];
    BOOL v5 = v11;
    if (v6)
    {
      [v11 rotation];
      BOOL v5 = v11;
      if (v7 < 0.0) {
        double v7 = -v7;
      }
      if (v7 < 0.636619772)
      {
        [(AVInteractiveTransitionGestureTracker *)self _rotation];
        double v9 = v8;
        [v11 rotation];
        [(AVInteractiveTransitionGestureTracker *)self _setRotation:v9 + v10];
        BOOL v5 = v11;
      }
    }
  }
  [v5 setRotation:0.0];
LABEL_11:
}

- (void)_handlePinchGesture:(id)a3
{
  id v4 = a3;
  if (![(AVInteractiveTransitionGestureTracker *)self isPinchToPresentEnabled]
    && ![(AVInteractiveTransitionGestureTracker *)self isPinchToDismissEnabled])
  {
    BOOL v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_ERROR, "Recognized pinch gesture without enabling pinch to present or pinch to dismiss.", buf, 2u);
    }
  }
  BOOL v6 = [(AVInteractiveTransitionGestureTracker *)self isPinchToPresentEnabled];
  if (v6 == [(AVInteractiveTransitionGestureTracker *)self isPinchToDismissEnabled])
  {
    double v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CGRect v28 = 0;
      _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Pinch to present and pinch to dismiss cannot be simultaneously enabled.", v28, 2u);
    }
  }
  switch([v4 state])
  {
    case 1:
      if ([(AVInteractiveTransitionGestureTracker *)self isPinchToDismissEnabled]) {
        uint64_t v8 = 2;
      }
      else {
        uint64_t v8 = 1;
      }
      [(AVInteractiveTransitionGestureTracker *)self _beginTracking:v8];
      [v4 scale];
      -[AVInteractiveTransitionGestureTracker setPreviousPinchScale:](self, "setPreviousPinchScale:");
      break;
    case 2:
      if (![(AVInteractiveTransitionGestureTracker *)self _isWaitingToContinue])
      {
        [(AVInteractiveTransitionGestureTracker *)self _setHasContinuedIfNeeded];
        if ([(AVInteractiveTransitionGestureTracker *)self isPinchToPresentEnabled])
        {
          double v9 = [v4 view];
          [v9 bounds];
          double Width = CGRectGetWidth(v30);
          id v11 = [v4 view];
          CGFloat v12 = [v11 window];
          [v12 bounds];
          double v13 = Width / CGRectGetWidth(v31);

          CGFloat v14 = [v4 view];
          [v14 bounds];
          double Height = CGRectGetHeight(v32);
          CGFloat v16 = [v4 view];
          double v17 = [v16 window];
          [v17 bounds];
          double v18 = Height / CGRectGetHeight(v33);

          [(AVInteractiveTransitionGestureTracker *)self previousPinchScale];
          double v20 = v19;
          [v4 scale];
          double v22 = v21;
          [(AVInteractiveTransitionGestureTracker *)self previousPinchScale];
          double v24 = v22 - v23;
          if (v13 >= v18) {
            double v25 = v13;
          }
          else {
            double v25 = v18;
          }
          [v4 setScale:v20 + v24 * v25];
        }
        [v4 scale];
        -[AVInteractiveTransitionGestureTracker setPreviousPinchScale:](self, "setPreviousPinchScale:");
        if (![(AVInteractiveTransitionGestureTracker *)self hasRotated])
        {
          double v26 = [(AVInteractiveTransitionGestureTracker *)self rotationGestureRecognizer];
          [v26 setRotation:0.0];
        }
        CGRect v27 = [(AVInteractiveTransitionGestureTracker *)self transitionDriverDelegate];
        [v27 transitionDriverDidContinueInteraction:self];
      }
      break;
    case 3:
      if ([(AVInteractiveTransitionGestureTracker *)self _isWaitingToContinue]) {
        goto LABEL_11;
      }
      [(AVInteractiveTransitionGestureTracker *)self _finish];
      break;
    case 4:
    case 5:
LABEL_11:
      [(AVInteractiveTransitionGestureTracker *)self _cancel];
      break;
    default:
      break;
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AVInteractiveTransitionGestureTracker *)self pinchGestureRecognizer];

  if (v8 == v6)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    goto LABEL_11;
  }
  uint64_t v9 = [(AVInteractiveTransitionGestureTracker *)self panGestureRecognizer];
  if ((id)v9 == v6)
  {
  }
  else
  {
    double v10 = (void *)v9;
    id v11 = [(AVInteractiveTransitionGestureTracker *)self indirectPanGestureRecognizer];

    if (v11 != v6)
    {
      char isKindOfClass = 0;
      goto LABEL_11;
    }
  }
  id v13 = [(AVInteractiveTransitionGestureTracker *)self contentTransitioningViewGestureRecognizer];
  if (v13 == v7)
  {
    char isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

LABEL_11:
  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AVInteractiveTransitionGestureTracker *)self pinchGestureRecognizer];

  id v9 = [(AVInteractiveTransitionGestureTracker *)self rotationGestureRecognizer];

  if (v8 == v6)
  {
    BOOL v10 = v9 == v7;
  }
  else if (v9 == v6)
  {
    id v11 = [(AVInteractiveTransitionGestureTracker *)self pinchGestureRecognizer];
    BOOL v10 = v11 == v7;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
LABEL_8:
    uint64_t v27 = [(AVInteractiveTransitionGestureTracker *)self pinchGestureRecognizer];
    if ((id)v27 == v5)
    {
    }
    else
    {
      CGRect v28 = (void *)v27;
      id v29 = [(AVInteractiveTransitionGestureTracker *)self rotationGestureRecognizer];

      if (v29 != v5)
      {
        if (isKindOfClass)
        {
          if (![(AVInteractiveTransitionGestureTracker *)self isTracking])
          {
            CGRect v30 = [(AVInteractiveTransitionGestureTracker *)self transitionDriverDelegate];
            -[AVInteractiveTransitionGestureTracker setPanToDismissEnabled:](self, "setPanToDismissEnabled:", [v30 transitionDriver:self shouldDriveTransitionInteractionOfType:3]);
          }
          BOOL v31 = [(AVInteractiveTransitionGestureTracker *)self isPanToDismissEnabled];
          goto LABEL_20;
        }
        goto LABEL_18;
      }
    }
    if (![(AVInteractiveTransitionGestureTracker *)self isTracking])
    {
      CGRect v32 = [(AVInteractiveTransitionGestureTracker *)self transitionDriverDelegate];
      -[AVInteractiveTransitionGestureTracker setPinchToDismissEnabled:](self, "setPinchToDismissEnabled:", [v32 transitionDriver:self shouldDriveTransitionInteractionOfType:2]);

      CGRect v33 = [(AVInteractiveTransitionGestureTracker *)self transitionDriverDelegate];
      -[AVInteractiveTransitionGestureTracker setPinchToPresentEnabled:](self, "setPinchToPresentEnabled:", [v33 transitionDriver:self shouldDriveTransitionInteractionOfType:1]);
    }
    if (![(AVInteractiveTransitionGestureTracker *)self isPinchToDismissEnabled])
    {
      BOOL v31 = [(AVInteractiveTransitionGestureTracker *)self isPinchToPresentEnabled];
LABEL_20:
      BOOL v26 = v31;
      goto LABEL_21;
    }
LABEL_18:
    BOOL v26 = 1;
    goto LABEL_21;
  }
  objc_storeStrong((id *)&self->_activePanGestureRecognizer, a3);
  [(UIPanGestureRecognizer *)self->_activePanGestureRecognizer velocityInView:0];
  double v8 = v7;
  double v10 = v9;
  [(UIPanGestureRecognizer *)self->_activePanGestureRecognizer translationInView:0];
  double v12 = v11;
  double v14 = v13;
  activePanGestureRecognizer = self->_activePanGestureRecognizer;
  CGFloat v16 = [v5 view];
  [(UIPanGestureRecognizer *)activePanGestureRecognizer locationInView:v16];
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  double v21 = [v5 view];
  [v21 bounds];
  v36.origin.double x = v22 + 16.0;
  v36.origin.double y = v23 + 16.0;
  v36.size.double width = v24 + -32.0;
  v36.size.double height = v25 + -32.0;
  v35.double x = v18;
  v35.double y = v20;
  if (CGRectContainsPoint(v36, v35) || v10 > 44.0 || v10 > fabs(v8 * 0.125))
  {

    goto LABEL_8;
  }

  if (v14 > fabs(v12 * 0.125)) {
    goto LABEL_8;
  }
  BOOL v26 = 0;
LABEL_21:

  return v26;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 _isPointerTouch])
  {
    char v8 = 0;
  }
  else
  {
    double v9 = [(AVInteractiveTransitionGestureTracker *)self transitionDriverDelegate];
    char v8 = [v9 transitionDriver:self gestureRecognizer:v6 shouldReceiveTouch:v7];
  }
  return v8;
}

- (BOOL)transitionDriver:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 0;
}

- (double)rotationVelocity
{
  if ((unint64_t)([(AVInteractiveTransitionGestureTracker *)self transitionInteraction]
                        - 1) > 1)
    return 0.0;
  id v3 = [(AVInteractiveTransitionGestureTracker *)self rotationGestureRecognizer];
  [v3 velocity];
  double v5 = v4;

  return v5;
}

- (double)rotation
{
  if ((unint64_t)([(AVInteractiveTransitionGestureTracker *)self transitionInteraction]
                        - 1) > 1)
    return 0.0;

  [(AVInteractiveTransitionGestureTracker *)self _rotation];
  return result;
}

- (double)pinchVelocity
{
  if ((unint64_t)([(AVInteractiveTransitionGestureTracker *)self transitionInteraction]
                        - 1) > 1)
    return 0.0;
  id v3 = [(AVInteractiveTransitionGestureTracker *)self pinchGestureRecognizer];
  [v3 velocity];
  double v5 = v4;

  return v5;
}

- (double)pinchScale
{
  if ((unint64_t)([(AVInteractiveTransitionGestureTracker *)self transitionInteraction]
                        - 1) > 1)
    return 0.0;
  id v3 = [(AVInteractiveTransitionGestureTracker *)self pinchGestureRecognizer];
  [v3 scale];
  double v5 = v4;

  return v5;
}

- (double)angleOfVelocityInWindow
{
  [(AVInteractiveTransitionGestureTracker *)self velocityInWindow];
  return atan2(v3 - v2 * 0.0, v2 + v3 * 0.0) * 57.2957795;
}

- (CGPoint)velocityInWindow
{
  if ([(AVInteractiveTransitionGestureTracker *)self transitionInteraction] == 3)
  {
    activePanGestureRecognizer = self->_activePanGestureRecognizer;
    double v4 = [(AVInteractiveTransitionGestureTracker *)self view];
    double v5 = [v4 window];
    [(UIPanGestureRecognizer *)activePanGestureRecognizer velocityInView:v5];
    double v19 = v7;
    double v20 = v6;

    int64_t v8 = [(AVInteractiveTransitionGestureTracker *)self initialInterfaceOrientation];
    double v9 = [(AVInteractiveTransitionGestureTracker *)self view];
    double v10 = [v9 window];
    uint64_t v11 = [v10 interfaceOrientation];

    uint64_t v12 = -1;
    uint64_t v13 = 1;
    if (v8 != 4) {
      uint64_t v13 = 2 * (v8 == 2);
    }
    if (v8 != 3) {
      uint64_t v12 = v13;
    }
    if (v8 == 1) {
      uint64_t v12 = 0;
    }
    uint64_t v14 = 1;
    uint64_t v15 = -1;
    uint64_t v16 = -2;
    if (v11 != 2) {
      uint64_t v16 = 0;
    }
    if (v11 != 4) {
      uint64_t v15 = v16;
    }
    if (v11 != 3) {
      uint64_t v14 = v15;
    }
    if (v11 == 1) {
      uint64_t v14 = 0;
    }
    CGAffineTransformMakeRotation(&v21, (double)(v14 + v12) * 1.57079633);
    float64x2_t v17 = vaddq_f64(*(float64x2_t *)&v21.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v21.c, v19), *(float64x2_t *)&v21.a, v20));
  }
  else
  {
    float64x2_t v17 = *(float64x2_t *)MEMORY[0x1E4F1DAD8];
  }
  double v18 = v17.f64[1];
  result.double x = v17.f64[0];
  result.double y = v18;
  return result;
}

- (CGPoint)translationInWindow
{
  [(AVInteractiveTransitionGestureTracker *)self locationInWindow];
  double v4 = v3;
  double v6 = v5;
  [(AVInteractiveTransitionGestureTracker *)self anchorLocationInWindow];
  double v8 = v4 - v7;
  double v10 = v6 - v9;
  result.double y = v10;
  result.double x = v8;
  return result;
}

- (CGPoint)locationInWindow
{
  [(AVInteractiveTransitionGestureTracker *)self _filteredUntranslatedLocationInWindow];
  double v4 = v3;
  double v6 = v5;
  int64_t v7 = [(AVInteractiveTransitionGestureTracker *)self initialInterfaceOrientation];
  double v8 = [(AVInteractiveTransitionGestureTracker *)self view];
  double v9 = [v8 window];
  uint64_t v10 = [v9 interfaceOrientation];

  uint64_t v11 = [(AVInteractiveTransitionGestureTracker *)self view];
  uint64_t v12 = [v11 window];
  [v12 bounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  switch(v7)
  {
    case 1:
      uint64_t v21 = 0;
      break;
    case 3:
      uint64_t v21 = -1;
      break;
    case 4:
      uint64_t v21 = 1;
      break;
    default:
      uint64_t v21 = 2 * (v7 == 2);
      break;
  }
  switch(v10)
  {
    case 1:
      uint64_t v22 = 0;
      break;
    case 3:
      uint64_t v22 = 1;
      break;
    case 4:
      uint64_t v22 = -1;
      break;
    default:
      uint64_t v22 = -2;
      if (v10 != 2) {
        uint64_t v22 = 0;
      }
      break;
  }
  uint64_t v23 = v22 + v21;
  if (v23 == 2)
  {
    v28.origin.double x = v14;
    v28.origin.double y = v16;
    v28.size.double width = v18;
    v28.size.double height = v20;
    double v4 = CGRectGetWidth(v28) - v4;
    v29.origin.double x = v14;
    v29.origin.double y = v16;
    v29.size.double width = v18;
    v29.size.double height = v20;
    double v24 = CGRectGetHeight(v29) - v6;
LABEL_23:
    double v6 = v4;
    goto LABEL_24;
  }
  if (v23 == 1)
  {
    v30.origin.double x = v14;
    v30.origin.double y = v16;
    v30.size.double width = v18;
    v30.size.double height = v20;
    double v6 = CGRectGetHeight(v30) - v6;
    double v24 = v4;
    goto LABEL_24;
  }
  if (v23 != -1)
  {
    double v24 = v6;
    goto LABEL_23;
  }
  v27.origin.double x = v14;
  v27.origin.double y = v16;
  v27.size.double width = v18;
  v27.size.double height = v20;
  double v24 = CGRectGetWidth(v27) - v4;
LABEL_24:
  double v25 = v6;
  result.double y = v24;
  result.double x = v25;
  return result;
}

- (CGPoint)_filteredUntranslatedLocationInWindow
{
  double v3 = [(AVInteractiveTransitionGestureTracker *)self _locationRecognizer];
  double v4 = [(AVInteractiveTransitionGestureTracker *)self view];
  double v5 = [v4 window];
  [v3 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  if (![(AVInteractiveTransitionGestureTracker *)self _isWaitingToContinue]) {
    -[AVInteractiveTransitionGestureTracker setLastReportedLocationInWindow:](self, "setLastReportedLocationInWindow:", v7, v9);
  }

  [(AVInteractiveTransitionGestureTracker *)self lastReportedLocationInWindow];
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (CGPoint)_untranslatedUnfilteredLocationInFixedCoordinateSpace
{
  double v3 = [(AVInteractiveTransitionGestureTracker *)self _locationRecognizer];
  [v3 locationInView:0];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(AVInteractiveTransitionGestureTracker *)self view];
  double v9 = [v8 window];
  double v10 = [v9 screen];
  double v11 = [v10 fixedCoordinateSpace];
  uint64_t v12 = [(AVInteractiveTransitionGestureTracker *)self view];
  double v13 = [v12 window];
  CGFloat v14 = [v13 windowScene];
  double v15 = [v14 coordinateSpace];
  objc_msgSend(v11, "convertPoint:fromCoordinateSpace:", v15, v5, v7);
  double v17 = v16;
  double v19 = v18;

  double v20 = v17;
  double v21 = v19;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (id)_locationRecognizer
{
  double v3 = [(AVInteractiveTransitionGestureTracker *)self pinchGestureRecognizer];
  if ([(AVInteractiveTransitionGestureTracker *)self isPanToDismissEnabled])
  {
    double v4 = self->_activePanGestureRecognizer;

    double v3 = v4;
  }

  return v3;
}

- (void)willMoveToView:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v5 = [(AVInteractiveTransitionGestureTracker *)self recognizers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 removeGestureRecognizer:*(void *)(*((void *)&v13 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  double v10 = [(AVInteractiveTransitionGestureTracker *)self contentTransitioningViewGestureRecognizer];
  double v11 = [v10 view];
  uint64_t v12 = [(AVInteractiveTransitionGestureTracker *)self contentTransitioningViewGestureRecognizer];
  [v11 removeGestureRecognizer:v12];
}

- (void)didMoveToView:(id)a3
{
  id v4 = a3;
  [(AVInteractiveTransitionGestureTracker *)self setView:v4];
  [(AVInteractiveTransitionGestureTracker *)self addRecognizersToView:v4];
}

- (BOOL)isTracking
{
  return [(AVInteractiveTransitionGestureTracker *)self transitionInteraction] != 0;
}

- (void)setContentTransitioningViewGestureRecognizer:(id)a3
{
  id obj = a3;
  p_contentTransitioningViewGestureRecognizer = &self->_contentTransitioningViewGestureRecognizer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentTransitioningViewGestureRecognizer);

  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_contentTransitioningViewGestureRecognizer);
    uint64_t v7 = [v6 view];
    id v8 = objc_loadWeakRetained((id *)&self->_contentTransitioningViewGestureRecognizer);
    [v7 removeGestureRecognizer:v8];

    objc_storeWeak((id *)&self->_contentTransitioningViewGestureRecognizer, obj);
    uint64_t v9 = [(AVInteractiveTransitionGestureTracker *)self view];
    id v10 = objc_loadWeakRetained((id *)p_contentTransitioningViewGestureRecognizer);
    [v9 addGestureRecognizer:v10];
  }
}

- (void)addRecognizersToView:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v5 = [(AVInteractiveTransitionGestureTracker *)self recognizers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 addGestureRecognizer:*(void *)(*((void *)&v12 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  id v10 = [(AVInteractiveTransitionGestureTracker *)self contentTransitioningViewGestureRecognizer];

  if (v10)
  {
    double v11 = [(AVInteractiveTransitionGestureTracker *)self contentTransitioningViewGestureRecognizer];
    [v4 addGestureRecognizer:v11];
  }
}

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v3 = [(AVInteractiveTransitionGestureTracker *)self recognizers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = [v8 view];
        [v9 removeGestureRecognizer:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  id v10 = [(AVInteractiveTransitionGestureTracker *)self contentTransitioningViewGestureRecognizer];
  double v11 = [v10 view];
  long long v12 = [(AVInteractiveTransitionGestureTracker *)self contentTransitioningViewGestureRecognizer];
  [v11 addGestureRecognizer:v12];

  v13.receiver = self;
  v13.super_class = (Class)AVInteractiveTransitionGestureTracker;
  [(AVInteractiveTransitionGestureTracker *)&v13 dealloc];
}

- (AVInteractiveTransitionGestureTracker)init
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)AVInteractiveTransitionGestureTracker;
  double v2 = [(AVInteractiveTransitionGestureTracker *)&v15 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:v2 action:sel__handlePanGesture_];
    panGestureRecognizer = v2->_panGestureRecognizer;
    v2->_panGestureRecognizer = (UIPanGestureRecognizer *)v3;

    [(UIPanGestureRecognizer *)v2->_panGestureRecognizer setDelegate:v2];
    [(UIPanGestureRecognizer *)v2->_panGestureRecognizer setMaximumNumberOfTouches:1];
    [(UIPanGestureRecognizer *)v2->_panGestureRecognizer setAllowedTouchTypes:&unk_1F094A250];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB1AA0]) initWithTarget:v2 action:sel__handlePinchGesture_];
    pinchGestureRecognizer = v2->_pinchGestureRecognizer;
    v2->_pinchGestureRecognizer = (UIPinchGestureRecognizer *)v5;

    [(UIPinchGestureRecognizer *)v2->_pinchGestureRecognizer setDelegate:v2];
    [(UIPinchGestureRecognizer *)v2->_pinchGestureRecognizer _setEndsOnSingleTouch:1];
    [(UIPinchGestureRecognizer *)v2->_pinchGestureRecognizer _setRequiresSystemGesturesToFail:1];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FB1B68]) initWithTarget:v2 action:sel__handleRotationGesture_];
    rotationGestureRecognizer = v2->_rotationGestureRecognizer;
    v2->_rotationGestureRecognizer = (UIRotationGestureRecognizer *)v7;

    [(UIRotationGestureRecognizer *)v2->_rotationGestureRecognizer setDelegate:v2];
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:v2 action:sel__handlePanGesture_];
    indirectPanGestureRecognizer = v2->_indirectPanGestureRecognizer;
    v2->_indirectPanGestureRecognizer = (UIPanGestureRecognizer *)v9;

    [(UIPanGestureRecognizer *)v2->_indirectPanGestureRecognizer setDelegate:v2];
    [(UIPanGestureRecognizer *)v2->_indirectPanGestureRecognizer setMaximumNumberOfTouches:2];
    [(UIPanGestureRecognizer *)v2->_indirectPanGestureRecognizer setMinimumNumberOfTouches:2];
    [(UIPanGestureRecognizer *)v2->_indirectPanGestureRecognizer setAllowedTouchTypes:&unk_1F094A268];
    [(UIPanGestureRecognizer *)v2->_indirectPanGestureRecognizer setAllowedScrollTypesMask:2];
    double v11 = v2->_indirectPanGestureRecognizer;
    long long v16 = v2->_panGestureRecognizer;
    long long v17 = *(_OWORD *)&v2->_pinchGestureRecognizer;
    uint64_t v18 = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:4];
    recognizers = v2->_recognizers;
    v2->_recognizers = (NSArray *)v12;

    [(AVInteractiveTransitionGestureTracker *)v2 setEnabled:1];
  }
  return v2;
}

@end