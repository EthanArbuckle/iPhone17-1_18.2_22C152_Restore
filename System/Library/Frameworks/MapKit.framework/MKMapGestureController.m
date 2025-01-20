@interface MKMapGestureController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isRotationEnabled;
- (BOOL)isScrollEnabled;
- (BOOL)isTiltEnabled;
- (BOOL)isZoomEnabled;
- (BOOL)keyDown:(id)a3;
- (BOOL)keyUp:(id)a3;
- (BOOL)panWithMomentum;
- (BOOL)rotationSnappingEnabled;
- (BOOL)tiltGestureRecognizerShouldBegin:(id)a3;
- (CGPoint)_snapPointToDevicePixels:(CGPoint)a3;
- (MKBasicMapView)mapView;
- (MKCompassView)compassView;
- (MKMapGestureController)initWithMapView:(id)a3 gestureTargetView:(id)a4;
- (MKMapGestureController)initWithMapView:(id)a3 gestureTargetView:(id)a4 doubleTapTargetView:(id)a5;
- (MKMapGestureControllerDelegate)delegate;
- (MKRotationFilter)rotationFilter;
- (MKScaleView)scaleView;
- (UIGestureRecognizer)oneHandedZoomGestureRecognizer;
- (UILongPressGestureRecognizer)twoFingerLongPressGestureRecognizer;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UIPinchGestureRecognizer)pinchGestureRecognizer;
- (UIRotationGestureRecognizer)rotationGestureRecognizer;
- (UITapGestureRecognizer)doubleTapGestureRecognizer;
- (UITapGestureRecognizer)twoFingerTapGestureRecognizer;
- (double)variableDelayTapRecognizer:(id)a3 shouldWaitForNextTapForDuration:(double)a4 afterTouch:(id)a5;
- (void)_clearGesture:(id)a3;
- (void)_handleInterrupt:(id)a3;
- (void)_handleRotationPan:(id)a3;
- (void)_handleStandardTilt:(id)a3;
- (void)_handleZoomPan:(id)a3;
- (void)_setOneHandedZoomGestureConfiguration:(id)a3;
- (void)_setTraitCollection:(id)a3;
- (void)_updateRotationGestureForState:(int64_t)a3 focusPoint:(CGPoint)a4 rotation:(double)a5 velocity:(double)a6;
- (void)_updateZoomGestureForState:(int64_t)a3 focusPoint:(CGPoint)a4 scale:(double)a5 velocity:(double)a6 gestureType:(int64_t)a7 configuration:(id)a8;
- (void)beginGesturing;
- (void)cancelZoomInOrOut;
- (void)clearGestureRecognizersInFlight;
- (void)dealloc;
- (void)endGesturing;
- (void)handleArrowPan:(id)a3;
- (void)handleArrowRotate:(id)a3;
- (void)handleArrowZoom:(id)a3;
- (void)handleDoubleTap:(id)a3;
- (void)handlePan:(id)a3;
- (void)handlePanZoom:(id)a3;
- (void)handlePinch:(id)a3;
- (void)handleRotation:(id)a3;
- (void)handleTwoFingerLongPress:(id)a3;
- (void)handleTwoFingerTap:(id)a3;
- (void)handleZoomArrowMask:(int64_t)a3 speed:(double)a4;
- (void)setCompassView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPanWithMomentum:(BOOL)a3;
- (void)setRotationEnabled:(BOOL)a3;
- (void)setRotationFilter:(id)a3;
- (void)setRotationSnappingEnabled:(BOOL)a3;
- (void)setScrollEnabled:(BOOL)a3;
- (void)setTiltEnabled:(BOOL)a3;
- (void)setZoomEnabled:(BOOL)a3;
- (void)setupOneHandedZoomGestureRecognizerForView:(id)a3;
- (void)stopDynamicAnimations;
- (void)zoomIn;
- (void)zoomOut;
@end

@implementation MKMapGestureController

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (UIRotationGestureRecognizer)rotationGestureRecognizer
{
  return self->_rotationGestureRecognizer;
}

- (MKMapGestureController)initWithMapView:(id)a3 gestureTargetView:(id)a4 doubleTapTargetView:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v50.receiver = self;
  v50.super_class = (Class)MKMapGestureController;
  v12 = [(MKMapGestureController *)&v50 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mapView, a3);
    v13->_rotationSnappingEnabled = 0;
    v14 = [[MKVariableDelayTapRecognizer alloc] initWithTarget:v13 action:sel_handleDoubleTap_];
    doubleTapGestureRecognizer = v13->_doubleTapGestureRecognizer;
    v13->_doubleTapGestureRecognizer = v14;

    [(MKVariableDelayTapRecognizer *)v13->_doubleTapGestureRecognizer setNumberOfTapsRequired:2];
    [(MKVariableDelayTapRecognizer *)v13->_doubleTapGestureRecognizer setNumberOfTouchesRequired:1];
    [(MKVariableDelayTapRecognizer *)v13->_doubleTapGestureRecognizer setTapDelayDelegate:v13];
    [v11 addGestureRecognizer:v13->_doubleTapGestureRecognizer];
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v13 action:sel_handleTwoFingerTap_];
    twoFingerTapGestureRecognizer = v13->_twoFingerTapGestureRecognizer;
    v13->_twoFingerTapGestureRecognizer = (UITapGestureRecognizer *)v16;

    [(UITapGestureRecognizer *)v13->_twoFingerTapGestureRecognizer setNumberOfTapsRequired:1];
    [(UITapGestureRecognizer *)v13->_twoFingerTapGestureRecognizer setNumberOfTouchesRequired:2];
    [v10 addGestureRecognizer:v13->_twoFingerTapGestureRecognizer];
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:v13 action:sel_handleTwoFingerLongPress_];
    twoFingerLongPressGestureRecognizer = v13->_twoFingerLongPressGestureRecognizer;
    v13->_twoFingerLongPressGestureRecognizer = (UILongPressGestureRecognizer *)v18;

    [(UILongPressGestureRecognizer *)v13->_twoFingerLongPressGestureRecognizer setNumberOfTouchesRequired:2];
    [(UILongPressGestureRecognizer *)v13->_twoFingerLongPressGestureRecognizer setMinimumPressDuration:0.2];
    [v10 addGestureRecognizer:v13->_twoFingerLongPressGestureRecognizer];
    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F42C80]) initWithTarget:v13 action:sel_handlePinch_];
    pinchGestureRecognizer = v13->_pinchGestureRecognizer;
    v13->_pinchGestureRecognizer = (UIPinchGestureRecognizer *)v20;

    [(UIPinchGestureRecognizer *)v13->_pinchGestureRecognizer setDelegate:v13];
    [(UIPinchGestureRecognizer *)v13->_pinchGestureRecognizer _setEndsOnSingleTouch:1];
    [v10 addGestureRecognizer:v13->_pinchGestureRecognizer];
    v22 = [[_MKZoomingGestureControlConfiguration alloc] initWithDecelerationThreshold:3.0 maximumZoomInVelocity:10.0 maximumZoomOutVelocity:-10.0 zoomOutFrictionScale:4.5];
    zoomConfiguration = v13->_zoomConfiguration;
    v13->_zoomConfiguration = v22;

    v24 = [[MKPanGestureRecognizer alloc] initWithTarget:v13 action:sel_handlePan_];
    panGestureRecognizer = v13->_panGestureRecognizer;
    v13->_panGestureRecognizer = &v24->super;

    [(UIPanGestureRecognizer *)v13->_panGestureRecognizer setDelegate:v13];
    [(UIPanGestureRecognizer *)v13->_panGestureRecognizer _setRequiresSystemGesturesToFail:1];
    [(UIPanGestureRecognizer *)v13->_panGestureRecognizer setAllowedScrollTypesMask:2];
    [v10 addGestureRecognizer:v13->_panGestureRecognizer];
    v26 = [[_MKUserInteractionGestureRecognizer alloc] initWithTarget:v13 action:sel_handleTouch_];
    touchGestureRecognizer = v13->_touchGestureRecognizer;
    v13->_touchGestureRecognizer = v26;

    [(_MKUserInteractionGestureRecognizer *)v13->_touchGestureRecognizer setTouchObserver:v13];
    [(_MKUserInteractionGestureRecognizer *)v13->_touchGestureRecognizer setDelegate:v13];
    [(_MKUserInteractionGestureRecognizer *)v13->_touchGestureRecognizer setCancelsTouchesInView:0];
    [(_MKUserInteractionGestureRecognizer *)v13->_touchGestureRecognizer setDelaysTouchesBegan:0];
    [(_MKUserInteractionGestureRecognizer *)v13->_touchGestureRecognizer setDelaysTouchesEnded:0];
    [v10 addGestureRecognizer:v13->_touchGestureRecognizer];
    uint64_t v28 = [objc_alloc(MEMORY[0x1E4F42D50]) initWithTarget:v13 action:sel_handleRotation_];
    rotationGestureRecognizer = v13->_rotationGestureRecognizer;
    v13->_rotationGestureRecognizer = (UIRotationGestureRecognizer *)v28;

    [(UIRotationGestureRecognizer *)v13->_rotationGestureRecognizer setDelegate:v13];
    [(UIRotationGestureRecognizer *)v13->_rotationGestureRecognizer _setPreRecognitionWeight:0.5];
    [v10 addGestureRecognizer:v13->_rotationGestureRecognizer];
    v30 = [[MKTiltGestureRecognizer alloc] initWithTarget:v13 action:sel_handleTilt_];
    tiltGestureRecognizer = v13->_tiltGestureRecognizer;
    v13->_tiltGestureRecognizer = v30;

    [(MKTiltGestureRecognizer *)v13->_tiltGestureRecognizer setDelegate:v13];
    [v10 addGestureRecognizer:v13->_tiltGestureRecognizer];
    v32 = [[_MKConditionalPanRotationGestureRecognizer alloc] initWithTarget:v13 action:sel__handleRotationPan_];
    conditionalPanRotationGestureRecognizer = v13->_conditionalPanRotationGestureRecognizer;
    v13->_conditionalPanRotationGestureRecognizer = v32;

    [(_MKConditionalPanRotationGestureRecognizer *)v13->_conditionalPanRotationGestureRecognizer setDelegate:v13];
    [(_MKConditionalPanRotationGestureRecognizer *)v13->_conditionalPanRotationGestureRecognizer setAllowedScrollTypesMask:2];
    [v10 addGestureRecognizer:v13->_conditionalPanRotationGestureRecognizer];
    [(UIPanGestureRecognizer *)v13->_panGestureRecognizer requireGestureRecognizerToFail:v13->_conditionalPanRotationGestureRecognizer];
    v34 = [[_MKConditionalPanZoomGestureRecognizer alloc] initWithTarget:v13 action:sel__handleZoomPan_];
    conditionalPanZoomGestureRecognizer = v13->_conditionalPanZoomGestureRecognizer;
    v13->_conditionalPanZoomGestureRecognizer = v34;

    [(_MKConditionalPanZoomGestureRecognizer *)v13->_conditionalPanZoomGestureRecognizer setDelegate:v13];
    [(_MKConditionalPanZoomGestureRecognizer *)v13->_conditionalPanZoomGestureRecognizer setAllowedScrollTypesMask:2];
    [v10 addGestureRecognizer:v13->_conditionalPanZoomGestureRecognizer];
    [(UIPanGestureRecognizer *)v13->_panGestureRecognizer requireGestureRecognizerToFail:v13->_conditionalPanZoomGestureRecognizer];
    v36 = [[_MKConditionalPanTiltGestureRecognizer alloc] initWithTarget:v13 action:sel__handleStandardTilt_];
    conditionalPanTiltGestureRecognizer = v13->_conditionalPanTiltGestureRecognizer;
    v13->_conditionalPanTiltGestureRecognizer = v36;

    [(_MKConditionalPanTiltGestureRecognizer *)v13->_conditionalPanTiltGestureRecognizer setDelegate:v13];
    [(_MKConditionalPanTiltGestureRecognizer *)v13->_conditionalPanTiltGestureRecognizer setAllowedScrollTypesMask:2];
    [v10 addGestureRecognizer:v13->_conditionalPanTiltGestureRecognizer];
    [(UIPanGestureRecognizer *)v13->_panGestureRecognizer requireGestureRecognizerToFail:v13->_conditionalPanTiltGestureRecognizer];
    uint64_t v38 = [objc_alloc(MEMORY[0x1E4F431E0]) initWithTarget:v13 action:sel__handleInterrupt_];
    gestureInterruptionRecognizer = v13->_gestureInterruptionRecognizer;
    v13->_gestureInterruptionRecognizer = (_UIInterruptScrollDecelerationGestureRecognizer *)v38;

    [v10 addGestureRecognizer:v13->_gestureInterruptionRecognizer];
    v40 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v40 doubleForKey:@"ZoomingDefault"];
    v13->_arrowZoomSpeed = v41;

    v42 = [[_MKDirectionalArrowRecognizer alloc] initWithTarget:v13 action:sel_handleArrowZoom_];
    arrowZoomGestureRecognizer = v13->_arrowZoomGestureRecognizer;
    v13->_arrowZoomGestureRecognizer = v42;

    v44 = [[_MKDirectionalArrowRecognizer alloc] initWithTarget:v13 action:sel_handleArrowRotate_];
    arrowRotateGestureRecognizer = v13->_arrowRotateGestureRecognizer;
    v13->_arrowRotateGestureRecognizer = v44;

    v46 = [[_MKDirectionalArrowRecognizer alloc] initWithTarget:v13 action:sel_handleArrowPan_];
    arrowPanGestureRecognizer = v13->_arrowPanGestureRecognizer;
    v13->_arrowPanGestureRecognizer = v46;

    v13->_panWithMomentum = 1;
    [(MKMapGestureController *)v13 setupOneHandedZoomGestureRecognizerForView:v10];
    v48 = v13;
  }

  return v13;
}

- (void)setupOneHandedZoomGestureRecognizerForView:(id)a3
{
  id v11 = a3;
  if (_MKLinkedOnOrAfterReleaseSet(2310))
  {
    v4 = [[_MKOneHandedZoomGestureRecognizer alloc] initWithTarget:self action:sel_handlePanZoom_];
    oneHandedZoomGestureRecognizer = self->_oneHandedZoomGestureRecognizer;
    self->_oneHandedZoomGestureRecognizer = v4;

    [(_MKOneHandedZoomGestureRecognizer *)self->_oneHandedZoomGestureRecognizer setDelegate:self];
    [v11 addGestureRecognizer:self->_oneHandedZoomGestureRecognizer];
    v6 = [(_MKOneHandedZoomGestureRecognizer *)self->_oneHandedZoomGestureRecognizer tapGestureRecognizer];
    [v11 addGestureRecognizer:v6];

    v7 = [(_MKOneHandedZoomGestureRecognizer *)self->_oneHandedZoomGestureRecognizer panGestureRecognizer];
    [v11 addGestureRecognizer:v7];

    v8 = [(_MKOneHandedZoomGestureRecognizer *)self->_oneHandedZoomGestureRecognizer tapGestureRecognizer];
    [v8 requireGestureRecognizerToFail:self->_panGestureRecognizer];

    panGestureRecognizer = self->_panGestureRecognizer;
    id v10 = [(_MKOneHandedZoomGestureRecognizer *)self->_oneHandedZoomGestureRecognizer panGestureRecognizer];
    [(UIPanGestureRecognizer *)panGestureRecognizer requireGestureRecognizerToFail:v10];
  }
}

- (UIGestureRecognizer)oneHandedZoomGestureRecognizer
{
  return (UIGestureRecognizer *)self->_oneHandedZoomGestureRecognizer;
}

- (UITapGestureRecognizer)twoFingerTapGestureRecognizer
{
  return self->_twoFingerTapGestureRecognizer;
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return &self->_doubleTapGestureRecognizer->super;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setDelegate:(id)a3
{
}

- (void)setRotationFilter:(id)a3
{
}

- (void)setZoomEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[MKVariableDelayTapRecognizer setEnabled:](self->_doubleTapGestureRecognizer, "setEnabled:");
  [(UITapGestureRecognizer *)self->_twoFingerTapGestureRecognizer setEnabled:v3];
  [(UIPinchGestureRecognizer *)self->_pinchGestureRecognizer setEnabled:v3];
  [(_MKOneHandedZoomGestureRecognizer *)self->_oneHandedZoomGestureRecognizer setEnabled:v3];
  conditionalPanZoomGestureRecognizer = self->_conditionalPanZoomGestureRecognizer;

  [(_MKConditionalPanZoomGestureRecognizer *)conditionalPanZoomGestureRecognizer setEnabled:v3];
}

- (void)setTiltEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[MKTiltGestureRecognizer setEnabled:](self->_tiltGestureRecognizer, "setEnabled:");
  conditionalPanTiltGestureRecognizer = self->_conditionalPanTiltGestureRecognizer;

  [(_MKConditionalPanTiltGestureRecognizer *)conditionalPanTiltGestureRecognizer setEnabled:v3];
}

- (void)setScrollEnabled:(BOOL)a3
{
}

- (void)setRotationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[UIRotationGestureRecognizer setEnabled:](self->_rotationGestureRecognizer, "setEnabled:");
  conditionalPanRotationGestureRecognizer = self->_conditionalPanRotationGestureRecognizer;

  [(_MKConditionalPanRotationGestureRecognizer *)conditionalPanRotationGestureRecognizer setEnabled:v3];
}

- (void)clearGestureRecognizersInFlight
{
  [(MKMapGestureController *)self _clearGesture:self->_panGestureRecognizer];
  [(MKMapGestureController *)self _clearGesture:self->_pinchGestureRecognizer];
  [(MKMapGestureController *)self _clearGesture:self->_twoFingerLongPressGestureRecognizer];
  [(MKMapGestureController *)self _clearGesture:self->_twoFingerTapGestureRecognizer];
  [(MKMapGestureController *)self _clearGesture:self->_doubleTapGestureRecognizer];
  oneHandedZoomGestureRecognizer = self->_oneHandedZoomGestureRecognizer;

  [(MKMapGestureController *)self _clearGesture:oneHandedZoomGestureRecognizer];
}

- (void)_clearGesture:(id)a3
{
  id v4 = a3;
  uint64_t v3 = [v4 isEnabled];
  [v4 setEnabled:0];
  [v4 setEnabled:v3];
}

- (MKMapGestureController)initWithMapView:(id)a3 gestureTargetView:(id)a4
{
  return [(MKMapGestureController *)self initWithMapView:a3 gestureTargetView:a4 doubleTapTargetView:a4];
}

- (void)_setOneHandedZoomGestureConfiguration:(id)a3
{
}

- (BOOL)isRotationEnabled
{
  return [(UIRotationGestureRecognizer *)self->_rotationGestureRecognizer isEnabled];
}

- (BOOL)isTiltEnabled
{
  return [(MKTiltGestureRecognizer *)self->_tiltGestureRecognizer isEnabled];
}

- (void)dealloc
{
  [(_MKUserInteractionGestureRecognizer *)self->_touchGestureRecognizer setTouchObserver:0];
  v3.receiver = self;
  v3.super_class = (Class)MKMapGestureController;
  [(MKMapGestureController *)&v3 dealloc];
}

- (BOOL)isZoomEnabled
{
  if (([(UIPinchGestureRecognizer *)self->_pinchGestureRecognizer isEnabled] & 1) != 0
    || ([(MKVariableDelayTapRecognizer *)self->_doubleTapGestureRecognizer isEnabled] & 1) != 0)
  {
    return 1;
  }
  oneHandedZoomGestureRecognizer = self->_oneHandedZoomGestureRecognizer;

  return [(_MKOneHandedZoomGestureRecognizer *)oneHandedZoomGestureRecognizer isEnabled];
}

- (BOOL)isScrollEnabled
{
  return [(UIPanGestureRecognizer *)self->_panGestureRecognizer isEnabled];
}

- (void)setCompassView:(id)a3
{
  v5 = (MKCompassView *)a3;
  compassView = self->_compassView;
  p_compassView = &self->_compassView;
  if (compassView != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_compassView, a3);
    v5 = v8;
  }
}

- (void)stopDynamicAnimations
{
  pinchDecelerationAnimation = self->_pinchDecelerationAnimation;
  if (pinchDecelerationAnimation)
  {
    self->_pinchDecelerationAnimation = 0;
    v8 = pinchDecelerationAnimation;

    [(VKDynamicAnimation *)v8 stop];
  }
  panDecelerationAnimationGroup = self->_panDecelerationAnimationGroup;
  if (panDecelerationAnimationGroup)
  {
    self->_panDecelerationAnimationGroup = 0;
    id v9 = panDecelerationAnimationGroup;

    [(VKCompoundAnimation *)v9 stop];
  }
  rotationDecelerationAnimation = self->_rotationDecelerationAnimation;
  if (rotationDecelerationAnimation)
  {
    self->_rotationDecelerationAnimation = 0;
    id v10 = rotationDecelerationAnimation;

    [(VKDynamicAnimation *)v10 stop];
  }
  tiltDecelerationAnimation = self->_tiltDecelerationAnimation;
  if (tiltDecelerationAnimation)
  {
    self->_tiltDecelerationAnimation = 0;
    id v11 = tiltDecelerationAnimation;

    [(VKDynamicAnimation *)v11 stop];
  }
  currentArrowAnimation = self->_currentArrowAnimation;
  if (currentArrowAnimation)
  {
    self->_currentArrowAnimation = 0;
    v12 = currentArrowAnimation;

    [(VKTimedAnimation *)v12 stopAnimation:0];
  }
}

- (void)beginGesturing
{
  int64_t gestureCount = self->_gestureCount;
  if (!gestureCount)
  {
    id v4 = MKGetGesturesLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_INFO, "Begin Gesturing", v7, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained gestureControllerWillStartUserInteraction:self];

    int64_t gestureCount = self->_gestureCount;
  }
  self->_int64_t gestureCount = gestureCount + 1;
  [(MKMapGestureController *)self stopDynamicAnimations];
  v6 = [(MKBasicMapView *)self->_mapView mapView];
  [v6 stopSnappingAnimations];
}

- (void)endGesturing
{
  int64_t gestureCount = self->_gestureCount;
  if (gestureCount <= 0) {
    int64_t v3 = 0;
  }
  else {
    int64_t v3 = gestureCount - 1;
  }
  self->_int64_t gestureCount = v3;
  if (!v3)
  {
    v5 = MKGetGesturesLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_INFO, "End Gesturing", v7, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained gestureControllerDidStopUserInteraction:self];
  }
}

- (void)_setTraitCollection:(id)a3
{
  id v6 = a3;
  if ((-[UITraitCollection isEqual:](self->_traitCollection, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_traitCollection, a3);
    if ([(UITraitCollection *)self->_traitCollection userInterfaceIdiom] == UIUserInterfaceIdiomCarPlay) {
      +[_MKZoomingGestureControlConfiguration configurationForCarPlay];
    }
    else {
    v5 = +[_MKZoomingGestureControlConfiguration defaultConfiguration];
    }
    [(_MKOneHandedZoomGestureRecognizer *)self->_oneHandedZoomGestureRecognizer setConfiguration:v5];
  }
}

- (void)_handleStandardTilt:(id)a3
{
  id v4 = a3;
  [v4 locationInView:self->_mapView];
  double v6 = v5;
  double v8 = v7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "gestureController:focusPointForPoint:gestureKind:", self, 3, v6, v8);
    double v6 = v12;
    double v8 = v13;
  }
  switch([v4 state])
  {
    case 1:
      [(MKMapGestureController *)self beginGesturing];
      id v14 = objc_loadWeakRetained((id *)&self->_delegate);
      [v14 gestureControllerWillStartTilting:self];

      v15 = [(MKMapGestureController *)self mapView];
      uint64_t v16 = [v15 mapView];
      objc_msgSend(v16, "startPitchingWithFocusPoint:", v6, v8);
      goto LABEL_10;
    case 2:
      v30 = [v4 view];
      [v4 translationInView:v30];
      double v32 = v31;

      v15 = [(MKMapGestureController *)self mapView];
      uint64_t v16 = [v15 mapView];
      objc_msgSend(v16, "updatePitchWithFocusPoint:translation:", v6, v8, v32);
LABEL_10:

      goto LABEL_16;
    case 3:
      v17 = [v4 view];
      [v4 velocityInView:v17];
      double v19 = v18;

      uint64_t v20 = [(MKMapGestureController *)self mapView];
      v15 = [v20 mapView];

      if (fabs(v19) <= 100.0
        || ([v15 isFullyPitched] & 1) != 0
        || ![v15 isPitched])
      {
        objc_msgSend(v15, "stopPitchingWithFocusPoint:", v6, v8);
        id v36 = objc_loadWeakRetained((id *)&self->_delegate);
        v37 = v36;
        if (v19 >= 0.0) {
          [v36 gestureControllerDidStopTilting:self willDecelerate:0 tiltDirection:2];
        }
        else {
          [v36 gestureControllerDidStopTilting:self willDecelerate:0 tiltDirection:1];
        }

        [(MKMapGestureController *)self endGesturing];
      }
      else
      {
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __46__MKMapGestureController__handleStandardTilt___block_invoke;
        v44[3] = &unk_1E54BA848;
        v44[4] = self;
        id v21 = v15;
        id v45 = v21;
        double v46 = v6;
        double v47 = v8;
        v22 = (void *)MEMORY[0x18C139AE0](v44);
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __46__MKMapGestureController__handleStandardTilt___block_invoke_2;
        v39[3] = &unk_1E54BA870;
        v39[4] = self;
        id v40 = v21;
        double v41 = v6;
        double v42 = v8;
        double v43 = v19;
        v23 = (void *)MEMORY[0x18C139AE0](v39);
        [(VKDynamicAnimation *)self->_tiltDecelerationAnimation stop];
        id v24 = objc_loadWeakRetained((id *)&self->_delegate);
        [v24 gestureControllerDidStopTilting:self willDecelerate:1 tiltDirection:0];

        v25 = (VKDynamicAnimation *)objc_alloc_init(MEMORY[0x1E4FB3A10]);
        tiltDecelerationAnimation = self->_tiltDecelerationAnimation;
        self->_tiltDecelerationAnimation = v25;

        [(VKDynamicAnimation *)self->_tiltDecelerationAnimation setCompletionHandler:v23];
        v27 = [(MKMapGestureController *)self mapView];
        [v4 translationInView:v27];
        id v38 = v22;
        uint64_t v28 = dynamicValueAnimation();
        [(VKDynamicAnimation *)self->_tiltDecelerationAnimation setDynamicStepHandler:v28];

        v29 = [(MKBasicMapView *)self->_mapView mapView];
        [v29 runAnimation:self->_tiltDecelerationAnimation];
      }
LABEL_16:

      break;
    case 4:
      v33 = [(MKMapGestureController *)self mapView];
      v34 = [v33 mapView];
      objc_msgSend(v34, "stopPitchingWithFocusPoint:", v6, v8);

      id v35 = objc_loadWeakRetained((id *)&self->_delegate);
      [v35 gestureControllerDidStopTilting:self willDecelerate:0 tiltDirection:0];

      [(MKMapGestureController *)self endGesturing];
      break;
    default:
      break;
  }
}

void __46__MKMapGestureController__handleStandardTilt___block_invoke(uint64_t a1, double a2, double a3)
{
  double v5 = [*(id *)(a1 + 32) mapView];
  double v6 = [v5 mapView];
  char v7 = [v6 isFullyPitched];

  if ((v7 & 1) == 0)
  {
    double v8 = *(void **)(a1 + 40);
    double v9 = *(double *)(a1 + 48);
    double v10 = *(double *)(a1 + 56);
    objc_msgSend(v8, "updatePitchWithFocusPoint:translation:", v9, v10, a3);
  }
}

void __46__MKMapGestureController__handleStandardTilt___block_invoke_2(uint64_t a1)
{
  id v8 = *(id *)(*(void *)(a1 + 32) + 328);
  uint64_t v2 = *(void *)(a1 + 32);
  int64_t v3 = *(void **)(v2 + 328);
  *(void *)(v2 + 328) = 0;

  objc_msgSend(*(id *)(a1 + 40), "stopPitchingWithFocusPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  double v4 = *(double *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  double v6 = WeakRetained;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v4 >= 0.0) {
    [WeakRetained gestureControllerDidStopTilting:v7 willDecelerate:0 tiltDirection:2];
  }
  else {
    [WeakRetained gestureControllerDidStopTilting:v7 willDecelerate:0 tiltDirection:1];
  }

  [*(id *)(a1 + 32) endGesturing];
}

uint64_t __46__MKMapGestureController__handleStandardTilt___block_invoke_3(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(void, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(double *)(*(void *)(a1 + 32) + 256), a2);
}

- (void)handleRotation:(id)a3
{
  id v4 = a3;
  double v5 = MKGetGesturesLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "HandleRotation", (const char *)&unk_18BD3917F, buf, 2u);
  }

  [v4 locationInView:self->_mapView];
  double v7 = v6;
  double v9 = v8;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "gestureController:focusPointForPoint:gestureKind:", self, 2, v7, v9);
    double v7 = v13;
    double v9 = v14;
  }
  uint64_t v15 = [v4 state];
  [v4 rotation];
  double v17 = v16;
  [v4 velocity];
  -[MKMapGestureController _updateRotationGestureForState:focusPoint:rotation:velocity:](self, "_updateRotationGestureForState:focusPoint:rotation:velocity:", v15, v7, v9, v17, v18);
  double v19 = MKGetGesturesLog();
  if (os_signpost_enabled(v19))
  {
    *(_WORD *)uint64_t v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "HandleRotation", (const char *)&unk_18BD3917F, v20, 2u);
  }
}

- (void)_updateRotationGestureForState:(int64_t)a3 focusPoint:(CGPoint)a4 rotation:(double)a5 velocity:(double)a6
{
  double y = a4.y;
  double x = a4.x;
  if (a3 == 1)
  {
    [(MKMapGestureController *)self beginGesturing];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained gestureControllerWillStartRotating:self];

    rotationFilter = self->_rotationFilter;
    if (rotationFilter)
    {
      -[MKRotationFilter startRotatingWithFocusPoint:withSnapping:](rotationFilter, "startRotatingWithFocusPoint:withSnapping:", self->_rotationSnappingEnabled, x, y);
    }
    else
    {
      double v18 = [(MKMapGestureController *)self mapView];
      double v19 = [v18 mapView];
      objc_msgSend(v19, "startRotatingWithFocusPoint:", x, y);
    }
  }
  else if (a3 == 4)
  {
    id v12 = self->_rotationFilter;
    if (v12)
    {
      -[MKRotationFilter stopRotatingWithFocusPoint:](v12, "stopRotatingWithFocusPoint:", a4.x, a4.y);
    }
    else
    {
      uint64_t v15 = [(MKMapGestureController *)self mapView];
      double v16 = [v15 mapView];
      objc_msgSend(v16, "stopRotatingWithFocusPoint:", x, y);
    }
    id v17 = objc_loadWeakRetained((id *)&self->_delegate);
    [v17 gestureControllerDidStopRotating:self willDecelerate:0];

    [(MKMapGestureController *)self endGesturing];
    return;
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __86__MKMapGestureController__updateRotationGestureForState_focusPoint_rotation_velocity___block_invoke;
  v35[3] = &unk_1E54BA8C0;
  v35[4] = self;
  *(double *)&v35[5] = x;
  *(double *)&v35[6] = y;
  uint64_t v20 = (void (**)(double))MEMORY[0x18C139AE0](v35);
  v20[2](a5);
  if (a3 == 3)
  {
    if (fabs(a6) <= 3.0)
    {
      v29 = self->_rotationFilter;
      if (v29)
      {
        -[MKRotationFilter stopRotatingWithFocusPoint:](v29, "stopRotatingWithFocusPoint:", x, y);
      }
      else
      {
        v30 = [(MKMapGestureController *)self mapView];
        double v31 = [v30 mapView];
        objc_msgSend(v31, "stopRotatingWithFocusPoint:", x, y);
      }
      id v32 = objc_loadWeakRetained((id *)&self->_delegate);
      [v32 gestureControllerDidStopRotating:self willDecelerate:0];

      [(MKMapGestureController *)self endGesturing];
    }
    else
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __86__MKMapGestureController__updateRotationGestureForState_focusPoint_rotation_velocity___block_invoke_2;
      v34[3] = &unk_1E54BA8E8;
      v34[4] = self;
      *(double *)&v34[5] = x;
      *(double *)&v34[6] = y;
      id v21 = (void *)MEMORY[0x18C139AE0](v34);
      v22 = [(MKMapGestureController *)self mapView];
      int v23 = objc_msgSend(v22, "isPointValidForGesturing:", x, y);

      if (v23)
      {
        [(VKDynamicAnimation *)self->_rotationDecelerationAnimation stop];
        id v24 = objc_loadWeakRetained((id *)&self->_delegate);
        [v24 gestureControllerDidStopRotating:self willDecelerate:1];

        v25 = (VKDynamicAnimation *)objc_alloc_init(MEMORY[0x1E4FB3A10]);
        rotationDecelerationAnimation = self->_rotationDecelerationAnimation;
        self->_rotationDecelerationAnimation = v25;

        [(VKDynamicAnimation *)self->_rotationDecelerationAnimation setCompletionHandler:v21];
        v33 = v20;
        v27 = dynamicValueAnimation();
        [(VKDynamicAnimation *)self->_rotationDecelerationAnimation setDynamicStepHandler:v27];

        uint64_t v28 = [(MKBasicMapView *)self->_mapView mapView];
        [v28 runAnimation:self->_rotationDecelerationAnimation];
      }
    }
  }
}

void __86__MKMapGestureController__updateRotationGestureForState_focusPoint_rotation_velocity___block_invoke(double *a1, double a2)
{
  id v4 = (void *)*((void *)a1 + 4);
  double v5 = (void *)v4[5];
  if (v5)
  {
    double v6 = a1[5];
    double v7 = a1[6];
    objc_msgSend(v5, "updateRotationWithFocusPoint:newValue:", v6, v7, a2);
  }
  else
  {
    id v9 = [v4 mapView];
    double v8 = [v9 mapView];
    objc_msgSend(v8, "updateRotationWithFocusPoint:newValue:", a1[5], a1[6], a2);
  }
}

void __86__MKMapGestureController__updateRotationGestureForState_focusPoint_rotation_velocity___block_invoke_2(uint64_t a1)
{
  id v8 = *(id *)(*(void *)(a1 + 32) + 312);
  uint64_t v2 = *(void *)(a1 + 32);
  int64_t v3 = *(void **)(v2 + 312);
  *(void *)(v2 + 312) = 0;

  id v4 = *(void **)(*(void *)(a1 + 32) + 40);
  if (v4)
  {
    objc_msgSend(v4, "stopRotatingWithFocusPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
  else
  {
    double v5 = [*(id *)(a1 + 32) mapView];
    double v6 = [v5 mapView];
    objc_msgSend(v6, "stopRotatingWithFocusPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained gestureControllerDidStopRotatingDecelerating:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) endGesturing];
}

uint64_t __86__MKMapGestureController__updateRotationGestureForState_focusPoint_rotation_velocity___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleDoubleTap:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3)
  {
    [v4 locationInView:self->_mapView];
    double v6 = v5;
    double v8 = v7;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "gestureController:focusPointForPoint:gestureKind:", self, 1, v6, v8);
      double v6 = v11;
      double v8 = v12;
    }
    uint64_t v13 = [v4 modifierFlags];
    if ((v13 & 0x80000) != 0) {
      double v14 = -1.0;
    }
    else {
      double v14 = 1.0;
    }
    if ((v13 & 0x80000) != 0) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 1;
    }
    [(MKMapGestureController *)self beginGesturing];
    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    [v16 gestureControllerWillStartZooming:self animated:1];

    id v17 = [(MKBasicMapView *)self->_mapView mapView];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __42__MKMapGestureController_handleDoubleTap___block_invoke;
    v18[3] = &unk_1E54BA938;
    v18[4] = self;
    v18[5] = v15;
    objc_msgSend(v17, "zoom:withFocusPoint:completionHandler:", v18, v14, v6, v8);
  }
}

uint64_t __42__MKMapGestureController_handleDoubleTap___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained gestureControllerDidStopZooming:*(void *)(a1 + 32) direction:*(void *)(a1 + 40) type:2 willDecelerate:0];

  int64_t v3 = *(void **)(a1 + 32);

  return [v3 endGesturing];
}

- (void)handleTwoFingerTap:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3)
  {
    [v4 locationInView:self->_mapView];
    double v6 = v5;
    double v8 = v7;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "gestureController:focusPointForPoint:gestureKind:", self, 1, v6, v8);
      double v6 = v11;
      double v8 = v12;
    }
    [(MKMapGestureController *)self beginGesturing];
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    [v13 gestureControllerWillStartZooming:self animated:1];

    double v14 = [(MKBasicMapView *)self->_mapView mapView];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __45__MKMapGestureController_handleTwoFingerTap___block_invoke;
    v15[3] = &unk_1E54BA960;
    v15[4] = self;
    objc_msgSend(v14, "zoom:withFocusPoint:completionHandler:", v15, -1.0, v6, v8);
  }
}

uint64_t __45__MKMapGestureController_handleTwoFingerTap___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained gestureControllerDidStopZooming:*(void *)(a1 + 32) direction:2 type:3 willDecelerate:0];

  int64_t v3 = *(void **)(a1 + 32);

  return [v3 endGesturing];
}

- (void)handleTwoFingerLongPress:(id)a3
{
  id v6 = a3;
  if ([v6 state] == 1)
  {
    self->_didStartLongPress = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained gestureControllerWillStartTwoFingerLongPress:self];
  }
  else if ([v6 state] == 3 || objc_msgSend(v6, "state") == 4)
  {
    if (self->_didStartLongPress)
    {
      id v5 = objc_loadWeakRetained((id *)&self->_delegate);
      [v5 gestureControllerDidStopTwoFingerLongPress:self];
    }
    self->_didStartLongPress = 0;
  }
}

- (void)handlePinch:(id)a3
{
  id v4 = a3;
  id v5 = MKGetGesturesLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "HandlePinch", (const char *)&unk_18BD3917F, buf, 2u);
  }

  [v4 locationInView:self->_mapView];
  double v7 = v6;
  double v9 = v8;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "gestureController:focusPointForPoint:gestureKind:", self, 1, v7, v9);
    double v7 = v12;
    double v9 = v13;
  }
  [v4 scale];
  double v15 = v14;
  [v4 velocity];
  -[MKMapGestureController _updateZoomGestureForState:focusPoint:scale:velocity:gestureType:configuration:](self, "_updateZoomGestureForState:focusPoint:scale:velocity:gestureType:configuration:", [v4 state], 1, self->_zoomConfiguration, v7, v9, v15, v16);
  id v17 = MKGetGesturesLog();
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)double v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "HandlePinch", (const char *)&unk_18BD3917F, v18, 2u);
  }
}

- (void)handlePanZoom:(id)a3
{
  id v4 = a3;
  id v5 = MKGetGesturesLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "HandlePanZoom", (const char *)&unk_18BD3917F, buf, 2u);
  }

  [v4 locationOfTapGesture];
  double v7 = v6;
  double v9 = v8;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "gestureController:focusPointForPoint:gestureKind:", self, 1, v7, v9);
    double v7 = v12;
    double v9 = v13;
  }
  uint64_t v14 = [v4 state];
  [v4 scale];
  double v16 = v15;
  [v4 velocity];
  double v18 = v17;
  double v19 = [v4 configuration];
  -[MKMapGestureController _updateZoomGestureForState:focusPoint:scale:velocity:gestureType:configuration:](self, "_updateZoomGestureForState:focusPoint:scale:velocity:gestureType:configuration:", v14, 4, v19, v7, v9, v16, v18);

  uint64_t v20 = MKGetGesturesLog();
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)id v21 = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "HandlePanZoom", (const char *)&unk_18BD3917F, v21, 2u);
  }
}

- (void)_updateZoomGestureForState:(int64_t)a3 focusPoint:(CGPoint)a4 scale:(double)a5 velocity:(double)a6 gestureType:(int64_t)a7 configuration:(id)a8
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v15 = a8;
  if (a3 == 1)
  {
    self->_double lastScale = 1.0;
    [(MKMapGestureController *)self beginGesturing];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained gestureControllerWillStartZooming:self animated:0];

    v22 = [(MKBasicMapView *)self->_mapView mapView];
    objc_msgSend(v22, "startPinchingWithFocusPoint:", x, y);
  }
  else if (a3 == 4)
  {
    double v16 = [(MKBasicMapView *)self->_mapView mapView];
    objc_msgSend(v16, "stopPinchingWithFocusPoint:", x, y);

    id v17 = objc_loadWeakRetained((id *)&self->_delegate);
    double v18 = v17;
    double lastScale = self->_lastScale;
    if (lastScale > 1.0) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = 2 * (lastScale < 1.0);
    }
    [v17 gestureControllerDidStopZooming:self direction:v20 type:a7 willDecelerate:0];

    [(MKMapGestureController *)self endGesturing];
    goto LABEL_34;
  }
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __105__MKMapGestureController__updateZoomGestureForState_focusPoint_scale_velocity_gestureType_configuration___block_invoke;
  v49[3] = &unk_1E54BA988;
  v49[4] = self;
  *(double *)&v49[5] = x;
  *(double *)&v49[6] = y;
  int v23 = (void (**)(void, double, double))MEMORY[0x18C139AE0](v49);
  if (-[MKBasicMapView isPointValidForGesturing:](self->_mapView, "isPointValidForGesturing:", x, y))
  {
    v23[2](v23, self->_lastScale, a5);
    id v24 = MKGetGesturesLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      double v25 = self->_lastScale;
      *(_DWORD *)buf = 134218240;
      double v51 = v25;
      __int16 v52 = 2048;
      double v53 = a5;
      _os_log_impl(&dword_18BAEC000, v24, OS_LOG_TYPE_DEBUG, "_updateZoomGestureForState oldFactor : %f newFactor : %f", buf, 0x16u);
    }
  }
  if (a3 == 3)
  {
    [v15 decelerationThreshold];
    double v27 = -a6;
    if (a6 >= 0.0) {
      double v27 = a6;
    }
    if (v27 <= v26)
    {
      id v40 = [(MKBasicMapView *)self->_mapView mapView];
      objc_msgSend(v40, "stopPinchingWithFocusPoint:", x, y);

      id v41 = objc_loadWeakRetained((id *)&self->_delegate);
      double v42 = v41;
      double v43 = self->_lastScale;
      if (v43 > 1.0) {
        uint64_t v44 = 1;
      }
      else {
        uint64_t v44 = 2 * (v43 < 1.0);
      }
      [v41 gestureControllerDidStopZooming:self direction:v44 type:a7 willDecelerate:0];

      [(MKMapGestureController *)self endGesturing];
    }
    else
    {
      [v15 maximumZoomOutVelocity];
      double v29 = v28;
      [v15 maximumZoomInVelocity];
      if (v29 <= a6) {
        double v31 = a6;
      }
      else {
        double v31 = v29;
      }
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __105__MKMapGestureController__updateZoomGestureForState_focusPoint_scale_velocity_gestureType_configuration___block_invoke_57;
      v48[3] = &unk_1E54BA9B0;
      v48[4] = self;
      if (v31 <= v30) {
        double v32 = v31;
      }
      else {
        double v32 = v30;
      }
      *(double *)&v48[5] = x;
      *(double *)&v48[6] = y;
      v48[7] = a7;
      v33 = (void *)MEMORY[0x18C139AE0](v48);
      [(VKDynamicAnimation *)self->_pinchDecelerationAnimation stop];
      id v34 = objc_loadWeakRetained((id *)&self->_delegate);
      id v35 = v34;
      double v36 = self->_lastScale;
      if (v36 > 1.0) {
        uint64_t v37 = 1;
      }
      else {
        uint64_t v37 = 2 * (v36 < 1.0);
      }
      [v34 gestureControllerDidStopZooming:self direction:v37 type:a7 willDecelerate:1];

      id v38 = (VKDynamicAnimation *)objc_alloc_init(MEMORY[0x1E4FB3A10]);
      pinchDecelerationAnimation = self->_pinchDecelerationAnimation;
      self->_pinchDecelerationAnimation = v38;

      [(VKDynamicAnimation *)self->_pinchDecelerationAnimation setCompletionHandler:v33];
      if (v32 <= 0.0) {
        [v15 zoomOutFrictionScale];
      }
      double v47 = v23;
      id v45 = dynamicValueAnimation();
      [(VKDynamicAnimation *)self->_pinchDecelerationAnimation setDynamicStepHandler:v45];

      double v46 = [(MKBasicMapView *)self->_mapView mapView];
      [v46 runAnimation:self->_pinchDecelerationAnimation];
    }
  }

LABEL_34:
}

void __105__MKMapGestureController__updateZoomGestureForState_focusPoint_scale_velocity_gestureType_configuration___block_invoke(uint64_t a1, double a2, double a3)
{
  if (a3 >= 0.01)
  {
    double v6 = [*(id *)(*(void *)(a1 + 32) + 8) mapView];
    objc_msgSend(v6, "updatePinchWithFocusPoint:oldFactor:newFactor:", *(double *)(a1 + 40), *(double *)(a1 + 48), a2, a3);

    *(double *)(*(void *)(a1 + 32) + 256) = a3;
  }
}

void __105__MKMapGestureController__updateZoomGestureForState_focusPoint_scale_velocity_gestureType_configuration___block_invoke_57(uint64_t a1)
{
  id v6 = *(id *)(*(void *)(a1 + 32) + 264);
  uint64_t v2 = *(void *)(a1 + 32);
  int64_t v3 = *(void **)(v2 + 264);
  *(void *)(v2 + 264) = 0;

  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) mapView];
  objc_msgSend(v4, "stopPinchingWithFocusPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "gestureControllerDidStopZoomingDecelerating:direction:type:");

  [*(id *)(a1 + 32) endGesturing];
}

uint64_t __105__MKMapGestureController__updateZoomGestureForState_focusPoint_scale_velocity_gestureType_configuration___block_invoke_2(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(void, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(double *)(*(void *)(a1 + 32) + 256), a2);
}

- (CGPoint)_snapPointToDevicePixels:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(MKBasicMapView *)self->_mapView mapView];
  [v6 contentsScale];
  double v8 = v7;

  double v9 = [(MKBasicMapView *)self->_mapView window];
  id v10 = [v9 screen];
  [v10 scale];
  double v12 = vabdd_f64(v8, v11);

  if (v12 >= 0.000001)
  {
    double x = round(x * v8) / v8;
    double y = round(y * v8) / v8;
  }
  double v13 = x;
  double v14 = y;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (void)handlePan:(id)a3
{
  id v4 = a3;
  id v5 = MKGetGesturesLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "HandlePan", (const char *)&unk_18BD3917F, buf, 2u);
  }

  [v4 locationInView:self->_mapView];
  double v7 = v6;
  double v9 = v8;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "gestureController:focusPointForPoint:gestureKind:", self, 0, v7, v9);
    double v7 = v12;
    double v9 = v13;
  }
  -[MKMapGestureController _snapPointToDevicePixels:](self, "_snapPointToDevicePixels:", v7, v9);
  double v15 = v14;
  double v17 = v16;
  [(VKCompoundAnimation *)self->_panDecelerationAnimationGroup stop];
  panDecelerationAnimationGroup = self->_panDecelerationAnimationGroup;
  self->_panDecelerationAnimationGroup = 0;

  *(void *)buf = 0;
  double v43 = buf;
  uint64_t v44 = 0x4012000000;
  id v45 = __Block_byref_object_copy__14;
  double v46 = __Block_byref_object_dispose__14;
  double v47 = "";
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  [v4 translationInView:self->_mapView];
  -[MKMapGestureController _snapPointToDevicePixels:](self, "_snapPointToDevicePixels:");
  uint64_t v48 = v19;
  uint64_t v49 = v20;
  switch([v4 state])
  {
    case 1:
      [(MKMapGestureController *)self beginGesturing];
      id v21 = [(MKBasicMapView *)self->_mapView mapView];
      objc_msgSend(v21, "startPanningAtPoint:", v15, v17);

      id v22 = objc_loadWeakRetained((id *)&self->_delegate);
      [v22 gestureControllerWillStartPanning:self];
      goto LABEL_13;
    case 2:
      id v22 = [(MKBasicMapView *)self->_mapView mapView];
      objc_msgSend(v22, "updatePanWithTranslation:", *((double *)v43 + 6), *((double *)v43 + 7));
      goto LABEL_13;
    case 3:
      [v4 velocityInView:self->_mapView];
      if (!self->_panWithMomentum || fabs(v23) <= 200.0 && fabs(v24) <= 200.0) {
        goto LABEL_11;
      }
      double v27 = [(MKBasicMapView *)self->_mapView mapView];
      [v27 isPitched];

      id v22 = objc_alloc_init(MEMORY[0x1E4FB3A10]);
      location[7] = (id)MEMORY[0x1E4F143A8];
      location[8] = (id)3221225472;
      location[9] = __36__MKMapGestureController_handlePan___block_invoke;
      location[10] = &unk_1E54BA9D8;
      location[11] = buf;
      double v28 = dynamicValueAnimation();
      [v22 setDynamicStepHandler:v28];

      id v29 = objc_alloc_init(MEMORY[0x1E4FB3A10]);
      location[2] = (id)MEMORY[0x1E4F143A8];
      location[3] = (id)3221225472;
      location[4] = __36__MKMapGestureController_handlePan___block_invoke_2;
      location[5] = &unk_1E54BA9D8;
      location[6] = buf;
      double v30 = dynamicValueAnimation();
      [v29 setDynamicStepHandler:v30];

      objc_initWeak(location, self);
      double v31 = (VKCompoundAnimation *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB39F0]), "initWithAnimations:", v22, v29, 0);
      double v32 = self->_panDecelerationAnimationGroup;
      self->_panDecelerationAnimationGroup = v31;

      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __36__MKMapGestureController_handlePan___block_invoke_3;
      v38[3] = &unk_1E54BAA00;
      objc_copyWeak(&v40, location);
      id v39 = v4;
      [(VKCompoundAnimation *)self->_panDecelerationAnimationGroup setCompletionHandler:v38];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __36__MKMapGestureController_handlePan___block_invoke_4;
      v36[3] = &unk_1E54BAA28;
      objc_copyWeak(&v37, location);
      v36[4] = buf;
      [(VKCompoundAnimation *)self->_panDecelerationAnimationGroup setGroupStepHandler:v36];
      id v33 = objc_loadWeakRetained((id *)&self->_delegate);
      [v33 gestureControllerDidStopPanning:self willDecelerate:1];

      id v34 = [(MKBasicMapView *)self->_mapView mapView];
      [v34 runAnimation:self->_panDecelerationAnimationGroup];

      objc_destroyWeak(&v37);
      objc_destroyWeak(&v40);
      objc_destroyWeak(location);

LABEL_13:
      break;
    case 4:
LABEL_11:
      double v25 = [(MKBasicMapView *)self->_mapView mapView];
      objc_msgSend(v25, "stopPanningAtPoint:", v15, v17);

      id v26 = objc_loadWeakRetained((id *)&self->_delegate);
      [v26 gestureControllerDidStopPanning:self willDecelerate:0];

      [(MKMapGestureController *)self endGesturing];
      break;
    default:
      break;
  }
  id v35 = MKGetGesturesLog();
  if (os_signpost_enabled(v35))
  {
    LOWORD(location[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v35, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "HandlePan", (const char *)&unk_18BD3917F, (uint8_t *)location, 2u);
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __36__MKMapGestureController_handlePan___block_invoke(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 48) = a2;
  return result;
}

uint64_t __36__MKMapGestureController_handlePan___block_invoke_2(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 56) = a2;
  return result;
}

void __36__MKMapGestureController_handlePan___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained mapView];
  int64_t v3 = [v2 mapView];
  id v4 = *(void **)(a1 + 32);
  id v5 = [WeakRetained mapView];
  [v4 locationInView:v5];
  objc_msgSend(WeakRetained, "_snapPointToDevicePixels:");
  objc_msgSend(v3, "stopPanningAtPoint:");

  double v6 = [WeakRetained delegate];
  [v6 gestureControllerDidStopPanningDecelerating:WeakRetained];

  [WeakRetained endGesturing];
}

void __36__MKMapGestureController_handlePan___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained mapView];
  int64_t v3 = [v2 mapView];
  objc_msgSend(v3, "updatePanWithTranslation:", *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 56));
}

- (double)variableDelayTapRecognizer:(id)a3 shouldWaitForNextTapForDuration:(double)a4 afterTouch:(id)a5
{
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    double v9 = WeakRetained;
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 gestureController:self shouldWaitForNextTapForDuration:v7 afterTouch:a4];
      a4 = v13;
    }
  }

  return a4;
}

- (void)handleZoomArrowMask:(int64_t)a3 speed:(double)a4
{
  if ([(MKMapGestureController *)self isZoomEnabled])
  {
    if (a3)
    {
      if (a4 <= 0.0)
      {
        id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        [v9 doubleForKey:@"ZoomingDefault"];
        self->_arrowZoomSpeed = v7;
      }
      else
      {
        self->_arrowZoomSpeed = a4;
      }
    }
    [(_MKDirectionalArrowRecognizer *)self->_arrowZoomGestureRecognizer handleArrowMask:a3];
    if ([(_MKDirectionalArrowRecognizer *)self->_arrowZoomGestureRecognizer state] == 3
      || [(_MKDirectionalArrowRecognizer *)self->_arrowZoomGestureRecognizer state] == 5
      || [(_MKDirectionalArrowRecognizer *)self->_arrowZoomGestureRecognizer state] == 4)
    {
      id v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v10 doubleForKey:@"ZoomingDefault"];
      self->_arrowZoomSpeed = v8;
    }
  }
}

- (void)_handleRotationPan:(id)a3
{
  id v19 = a3;
  if ([v19 state] == 1)
  {
    [v19 locationInView:self->_mapView];
    double v5 = v4;
    double v7 = v6;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "gestureController:focusPointForPoint:gestureKind:", self, 2, v5, v7);
      double v5 = v11;
      double v7 = v12;
    }
    self->_panRotateStartPoint.double x = v5;
    self->_panRotateStartPoint.double y = v7;
  }
  double v13 = [(MKMapGestureController *)self mapView];
  [v19 translationInView:v13];
  double v15 = v14;

  double v16 = [(MKMapGestureController *)self mapView];
  [v19 velocityInView:v16];
  double v18 = v17;

  -[MKMapGestureController _updateRotationGestureForState:focusPoint:rotation:velocity:](self, "_updateRotationGestureForState:focusPoint:rotation:velocity:", [v19 state], self->_panRotateStartPoint.x, self->_panRotateStartPoint.y, v15 / 200.0, v18 / 200.0);
}

- (void)_handleZoomPan:(id)a3
{
  __int16 v52 = (UIPanGestureRecognizer *)a3;
  if ([(UIPanGestureRecognizer *)v52 state] == 1)
  {
    self->_double lastScale = 1.0;
    self->_lastZoomPanTranslation = 0.0;
    if (self->_scaleDragGestureRecognizer == v52)
    {
      [(MKBasicMapView *)self->_mapView bounds];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      [(MKBasicMapView *)self->_mapView edgeInsets];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v25 = objc_opt_respondsToSelector();

      if (v25)
      {
        id v26 = objc_loadWeakRetained((id *)&self->_delegate);
        [v26 gestureControllerSignificantViewFrame:self];
        double v28 = v27;
        double v30 = v29;
        double v32 = v31;
        double v34 = v33;
      }
      else
      {
        double v28 = v9 + v19;
        double v30 = v11 + v17;
        double v32 = v13 - (v19 + v23);
        double v34 = v15 - (v17 + v21);
      }
      v54.origin.double x = v28;
      v54.origin.double y = v30;
      v54.size.width = v32;
      v54.size.height = v34;
      double MidX = CGRectGetMidX(v54);
      v55.origin.double x = v28;
      v55.origin.double y = v30;
      v55.size.width = v32;
      v55.size.height = v34;
      double MidY = CGRectGetMidY(v55);
    }
    else
    {
      [(UIPanGestureRecognizer *)v52 locationInView:self->_mapView];
      double MidX = v4;
      double MidY = v6;
    }
    self->_panZoomStartPoint.double x = MidX;
    self->_panZoomStartPoint.double y = MidY;
  }
  else
  {
    double MidX = self->_panZoomStartPoint.x;
    double MidY = self->_panZoomStartPoint.y;
  }
  id v35 = objc_loadWeakRetained((id *)&self->_delegate);

  if (v35)
  {
    id v36 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v36, "gestureController:focusPointForPoint:gestureKind:", self, 1, MidX, MidY);
    double MidX = v37;
    double MidY = v38;
  }
  if (-[MKBasicMapView isPointValidForGesturing:](self->_mapView, "isPointValidForGesturing:", MidX, MidY))
  {
    id v39 = [(UIPanGestureRecognizer *)v52 view];
    [(UIPanGestureRecognizer *)v52 translationInView:v39];
    double v41 = v40;
    double v43 = v42;

    uint64_t v44 = (_MKConditionalPanZoomGestureRecognizer *)v52;
    if (self->_scaleDragGestureRecognizer == v52) {
      double v45 = v41;
    }
    else {
      double v45 = v43;
    }
    conditionalPanZoomGestureRecognizer = self->_conditionalPanZoomGestureRecognizer;
    if (conditionalPanZoomGestureRecognizer == (_MKConditionalPanZoomGestureRecognizer *)v52) {
      double v45 = -v45;
    }
    double v47 = self->_lastScale * ((v45 - self->_lastZoomPanTranslation) / 240.0 + 1.0);
    self->_lastZoomPanTranslation = v45;
  }
  else
  {
    conditionalPanZoomGestureRecognizer = self->_conditionalPanZoomGestureRecognizer;
    double v47 = 1.0;
    uint64_t v44 = (_MKConditionalPanZoomGestureRecognizer *)v52;
  }
  if (conditionalPanZoomGestureRecognizer == v44)
  {
    objc_super v50 = [(_MKConditionalPanZoomGestureRecognizer *)v44 view];
    [(UIPanGestureRecognizer *)v52 velocityInView:v50];
    double v49 = -v51;

    uint64_t v48 = self->_zoomConfiguration;
    uint64_t v44 = (_MKConditionalPanZoomGestureRecognizer *)v52;
  }
  else
  {
    uint64_t v48 = 0;
    double v49 = 0.0;
  }
  -[MKMapGestureController _updateZoomGestureForState:focusPoint:scale:velocity:gestureType:configuration:](self, "_updateZoomGestureForState:focusPoint:scale:velocity:gestureType:configuration:", [(_MKConditionalPanZoomGestureRecognizer *)v44 state], 4, v48, MidX, MidY, v47, v49);
}

- (void)_handleInterrupt:(id)a3
{
  id v5 = a3;
  if ([v5 state] == 3)
  {
    [(MKMapGestureController *)self stopDynamicAnimations];
    double v4 = [(MKBasicMapView *)self->_mapView mapView];
    [v4 stopSnappingAnimations];
  }
}

- (BOOL)keyDown:(id)a3
{
  id v4 = a3;
  activeArrowGestureRecognizer = self->_activeArrowGestureRecognizer;
  if (!activeArrowGestureRecognizer)
  {
    double v6 = [v4 key];
    if ((~[v6 modifierFlags] & 0x120000) == 0
      && ([v6 modifierFlags] & 0xFFFFFFFFFFEDFFFFLL) == 0)
    {

      goto LABEL_30;
    }
    if (([v6 modifierFlags] & 0x80000) != 0)
    {
      unint64_t v7 = [v6 keyCode] - 45;
      if (v7 > 0x25) {
        goto LABEL_17;
      }
      if (((1 << v7) & 0x3000000003) == 0)
      {
        if (((1 << v7) & 0xC00000000) == 0
          || ![(MKMapGestureController *)self isRotationEnabled])
        {
          goto LABEL_17;
        }
        uint64_t v8 = 200;
LABEL_16:
        double v9 = (_MKDirectionalArrowRecognizer *)*(id *)((char *)&self->super.isa + v8);
        if (v9) {
          goto LABEL_20;
        }
        goto LABEL_17;
      }
      if (![(MKMapGestureController *)self isZoomEnabled])
      {
LABEL_17:
        if ([(MKMapGestureController *)self isScrollEnabled]) {
          double v9 = self->_arrowPanGestureRecognizer;
        }
        else {
          double v9 = 0;
        }
LABEL_20:
        if ([(UIPanGestureRecognizer *)self->_panGestureRecognizer state] == 1
          || [(UIPanGestureRecognizer *)self->_panGestureRecognizer state] == 2
          || [(UIPinchGestureRecognizer *)self->_pinchGestureRecognizer state] == 1
          || [(UIPinchGestureRecognizer *)self->_pinchGestureRecognizer state] == 2
          || [(UIRotationGestureRecognizer *)self->_rotationGestureRecognizer state] == 1
          || [(UIRotationGestureRecognizer *)self->_rotationGestureRecognizer state] == 2)
        {

          double v9 = 0;
        }
        double v10 = self->_activeArrowGestureRecognizer;
        self->_activeArrowGestureRecognizer = v9;

        activeArrowGestureRecognizer = self->_activeArrowGestureRecognizer;
        if (activeArrowGestureRecognizer) {
          goto LABEL_28;
        }
LABEL_30:
        BOOL v11 = 0;
        goto LABEL_29;
      }
    }
    else if ((unint64_t)([v6 keyCode] - 45) > 1 {
           || ![(MKMapGestureController *)self isZoomEnabled])
    }
    {
      goto LABEL_17;
    }
    uint64_t v8 = 192;
    goto LABEL_16;
  }
LABEL_28:
  [(_MKDirectionalArrowRecognizer *)activeArrowGestureRecognizer keyDown:v4];
  BOOL v11 = 1;
LABEL_29:

  return v11;
}

- (BOOL)keyUp:(id)a3
{
  id v4 = a3;
  activeArrowGestureRecognizer = self->_activeArrowGestureRecognizer;
  if (activeArrowGestureRecognizer)
  {
    [(_MKDirectionalArrowRecognizer *)self->_activeArrowGestureRecognizer keyUp:v4];
    if ([(_MKDirectionalArrowRecognizer *)self->_activeArrowGestureRecognizer state] == 3
      || [(_MKDirectionalArrowRecognizer *)self->_activeArrowGestureRecognizer state] == 5
      || [(_MKDirectionalArrowRecognizer *)self->_activeArrowGestureRecognizer state] == 4)
    {
      double v6 = self->_activeArrowGestureRecognizer;
      self->_activeArrowGestureRecognizer = 0;
    }
  }

  return activeArrowGestureRecognizer != 0;
}

- (void)zoomIn
{
  p_activeArrowGestureRecognizer = &self->_activeArrowGestureRecognizer;
  if (!self->_activeArrowGestureRecognizer && [(MKMapGestureController *)self isZoomEnabled]) {
    objc_storeStrong((id *)p_activeArrowGestureRecognizer, self->_arrowZoomGestureRecognizer);
  }
  activeArrowGestureRecognizer = self->_activeArrowGestureRecognizer;
  if (activeArrowGestureRecognizer == self->_arrowZoomGestureRecognizer)
  {
    if ([(_MKDirectionalArrowRecognizer *)activeArrowGestureRecognizer arrows] != 2) {
      [(_MKDirectionalArrowRecognizer *)self->_arrowZoomGestureRecognizer handleArrowMask:2];
    }
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_cancelZoomInOrOut object:0];
    [(MKMapGestureController *)self performSelector:sel_cancelZoomInOrOut withObject:0 afterDelay:0.3];
  }
}

- (void)zoomOut
{
  p_activeArrowGestureRecognizer = &self->_activeArrowGestureRecognizer;
  if (!self->_activeArrowGestureRecognizer && [(MKMapGestureController *)self isZoomEnabled]) {
    objc_storeStrong((id *)p_activeArrowGestureRecognizer, self->_arrowZoomGestureRecognizer);
  }
  activeArrowGestureRecognizer = self->_activeArrowGestureRecognizer;
  if (activeArrowGestureRecognizer == self->_arrowZoomGestureRecognizer)
  {
    if ([(_MKDirectionalArrowRecognizer *)activeArrowGestureRecognizer arrows] != 4) {
      [(_MKDirectionalArrowRecognizer *)self->_arrowZoomGestureRecognizer handleArrowMask:4];
    }
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_cancelZoomInOrOut object:0];
    [(MKMapGestureController *)self performSelector:sel_cancelZoomInOrOut withObject:0 afterDelay:0.3];
  }
}

- (void)cancelZoomInOrOut
{
  activeArrowGestureRecognizer = self->_activeArrowGestureRecognizer;
  if (activeArrowGestureRecognizer == self->_arrowZoomGestureRecognizer)
  {
    [(_MKDirectionalArrowRecognizer *)activeArrowGestureRecognizer handleArrowMask:0];
    id v4 = self->_activeArrowGestureRecognizer;
    self->_activeArrowGestureRecognizer = 0;
  }
}

- (void)handleArrowPan:(id)a3
{
  id v4 = a3;
  [(MKBasicMapView *)self->_mapView bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(MKBasicMapView *)self->_mapView edgeInsets];
  CGFloat v14 = v6 + v13;
  CGFloat v16 = v8 + v15;
  CGFloat v18 = v10 - (v13 + v17);
  CGFloat v20 = v12 - (v15 + v19);
  v51.origin.double x = v14;
  v51.origin.double y = v16;
  v51.size.width = v18;
  v51.size.height = v20;
  double MidX = CGRectGetMidX(v51);
  v52.origin.double x = v14;
  v52.origin.double y = v16;
  v52.size.width = v18;
  v52.size.height = v20;
  double MidY = CGRectGetMidY(v52);
  if ([v4 state] == 1)
  {
    [(MKMapGestureController *)self beginGesturing];
    [(MKMapGestureController *)self stopDynamicAnimations];
    double v23 = [(MKBasicMapView *)self->_mapView mapView];
    objc_msgSend(v23, "startPanningAtPoint:panAtStartPoint:", 1, MidX, MidY);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained gestureControllerWillStartPanning:self];

    char v25 = (VKTimedAnimation *)[objc_alloc(MEMORY[0x1E4FB3A90]) initWithDuration:1.0];
    currentArrowAnimation = self->_currentArrowAnimation;
    self->_currentArrowAnimation = v25;

    [(VKTimedAnimation *)self->_currentArrowAnimation setRunsForever:1];
    objc_initWeak(&location, self);
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    from[0] = 0;
    from[1] = from;
    from[2] = (id)0x4012000000;
    from[3] = __Block_byref_object_copy__14;
    from[4] = __Block_byref_object_dispose__14;
    from[5] = "";
    long long v49 = *MEMORY[0x1E4F1DAD8];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __41__MKMapGestureController_handleArrowPan___block_invoke;
    v44[3] = &unk_1E54BAA50;
    objc_copyWeak(v47, &location);
    v47[1] = *(id *)&Current;
    id v45 = v4;
    double v46 = from;
    [(VKTimedAnimation *)self->_currentArrowAnimation setStepHandler:v44];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __41__MKMapGestureController_handleArrowPan___block_invoke_2;
    v42[3] = &unk_1E54BAA78;
    objc_copyWeak(v43, &location);
    v43[1] = *(id *)&MidX;
    v43[2] = *(id *)&MidY;
    [(VKTimedAnimation *)self->_currentArrowAnimation setCompletionHandler:v42];
    double v28 = [(MKBasicMapView *)self->_mapView mapView];
    [v28 runAnimation:self->_currentArrowAnimation];

    objc_destroyWeak(v43);
    objc_destroyWeak(v47);
    _Block_object_dispose(from, 8);
    p_id location = &location;
LABEL_6:
    objc_destroyWeak(p_location);
    goto LABEL_7;
  }
  if ([v4 state] == 3)
  {
    double v30 = self->_currentArrowAnimation;
    if (v30)
    {
      [(VKTimedAnimation *)v30 stopAnimation:1];
      double v31 = self->_currentArrowAnimation;
      self->_currentArrowAnimation = 0;

      objc_initWeak(from, self);
      double v32 = (VKTimedAnimation *)[objc_alloc(MEMORY[0x1E4FB3A90]) initWithDuration:0.25];
      double v33 = self->_currentArrowAnimation;
      self->_currentArrowAnimation = v32;

      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __41__MKMapGestureController_handleArrowPan___block_invoke_3;
      v40[3] = &unk_1E54BAAA0;
      objc_copyWeak(&v41, from);
      [(VKTimedAnimation *)self->_currentArrowAnimation setStepHandler:v40];
      uint64_t v35 = MEMORY[0x1E4F143A8];
      uint64_t v36 = 3221225472;
      double v37 = __41__MKMapGestureController_handleArrowPan___block_invoke_4;
      double v38 = &unk_1E54BAA78;
      objc_copyWeak(v39, from);
      v39[1] = *(id *)&MidX;
      v39[2] = *(id *)&MidY;
      [(VKTimedAnimation *)self->_currentArrowAnimation setCompletionHandler:&v35];
      double v34 = [(MKBasicMapView *)self->_mapView mapView];
      [v34 runAnimation:self->_currentArrowAnimation];

      objc_destroyWeak(v39);
      objc_destroyWeak(&v41);
      p_id location = from;
      goto LABEL_6;
    }
  }
LABEL_7:
}

void __41__MKMapGestureController_handleArrowPan___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    double v21 = WeakRetained;
    [WeakRetained[1] bounds];
    double v4 = v3;
    [v21[1] bounds];
    double v6 = v5;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v7 = (v4 + v6) * 0.5 * 0.00960614812;
    double v9 = v8 - *(double *)(a1 + 56);
    double v10 = v7 * 1.5;
    if (v9 <= 1.0) {
      double v10 = (v4 + v6) * 0.5 * 0.00960614812;
    }
    double v11 = v7 * 3.0;
    if (v9 > 4.0) {
      double v12 = v11;
    }
    else {
      double v12 = v10;
    }
    double v13 = *MEMORY[0x1E4F1DAD8];
    double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    char v15 = [*(id *)(a1 + 32) arrows];
    double v16 = v14 + 1.0;
    if ((v15 & 2) == 0) {
      double v16 = v14;
    }
    if ((v15 & 4) != 0) {
      double v16 = v16 + -1.0;
    }
    double v17 = v13 + 1.0;
    if ((v15 & 8) == 0) {
      double v17 = v13;
    }
    if ((v15 & 0x10) != 0) {
      double v17 = v17 + -1.0;
    }
    if (fabs(v17) + fabs(v16) > 1.5)
    {
      double v17 = v17 / 1.41421354;
      double v16 = v16 / 1.41421354;
    }
    double v18 = v12 * v17;
    double v19 = v12 * v16;
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = v18
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 48);
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) = v19
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 56);
    *((double *)v21 + 47) = v18;
    *((double *)v21 + 48) = v19;
    *(_OWORD *)(v21 + 45) = *(_OWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 48);
    CGFloat v20 = [v21[1] mapView];
    objc_msgSend(v20, "updatePanWithTranslation:", *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56));

    id WeakRetained = v21;
  }
}

void __41__MKMapGestureController_handleArrowPan___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v8 = WeakRetained;
    if (a2)
    {
      id v5 = objc_loadWeakRetained(WeakRetained + 2);
      [v5 gestureControllerDidStopPanning:v8 willDecelerate:1];
    }
    else
    {
      double v6 = [WeakRetained[1] mapView];
      objc_msgSend(v6, "stopPanningAtPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

      id v7 = objc_loadWeakRetained(v8 + 2);
      [v7 gestureControllerDidStopPanning:v8 willDecelerate:0];

      [v8 endGesturing];
    }
    id WeakRetained = v8;
  }
}

void __41__MKMapGestureController_handleArrowPan___block_invoke_3(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v4 = *((double *)WeakRetained + 45);
    double v5 = *((double *)WeakRetained + 46);
    double v7 = *((double *)WeakRetained + 47);
    double v6 = *((double *)WeakRetained + 48);
    id v12 = WeakRetained;
    double v8 = [*((id *)WeakRetained + 1) mapView];
    double v9 = (float)(1.0 - (float)(a2 * a2));
    double v10 = v4 + v7 * v9;
    double v11 = v5 + v6 * v9;
    objc_msgSend(v8, "updatePanWithTranslation:", v10, v11);

    id WeakRetained = v12;
    *((double *)v12 + 45) = v10;
    *((double *)v12 + 46) = v11;
  }
}

void __41__MKMapGestureController_handleArrowPan___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = [WeakRetained[1] mapView];
    objc_msgSend(v2, "stopPanningAtPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

    id v3 = objc_loadWeakRetained(WeakRetained + 2);
    [v3 gestureControllerDidStopPanningDecelerating:WeakRetained];

    [WeakRetained endGesturing];
  }
}

- (void)handleArrowRotate:(id)a3
{
  id v4 = a3;
  [(MKBasicMapView *)self->_mapView bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(MKBasicMapView *)self->_mapView edgeInsets];
  CGFloat v14 = v6 + v13;
  CGFloat v16 = v8 + v15;
  CGFloat v18 = v10 - (v13 + v17);
  CGFloat v20 = v12 - (v15 + v19);
  v58.origin.double x = v14;
  v58.origin.double y = v16;
  v58.size.width = v18;
  v58.size.height = v20;
  double MidX = CGRectGetMidX(v58);
  v59.origin.double x = v14;
  v59.origin.double y = v16;
  v59.size.width = v18;
  v59.size.height = v20;
  double MidY = CGRectGetMidY(v59);
  if ([v4 state] == 1)
  {
    if (([v4 modifierFlags] & 0x100000) == 0)
    {
      [(MKMapGestureController *)self beginGesturing];
      [(VKTimedAnimation *)self->_currentArrowAnimation stopAnimation:0];
      currentArrowAnimation = self->_currentArrowAnimation;
      self->_currentArrowAnimation = 0;

      rotationFilter = self->_rotationFilter;
      if (rotationFilter)
      {
        -[MKRotationFilter startRotatingWithFocusPoint:withSnapping:](rotationFilter, "startRotatingWithFocusPoint:withSnapping:", 0, MidX, MidY);
      }
      else
      {
        double v34 = [(MKBasicMapView *)self->_mapView mapView];
        objc_msgSend(v34, "startRotatingWithFocusPoint:", MidX, MidY);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained gestureControllerWillStartRotating:self];

      uint64_t v36 = (VKTimedAnimation *)[objc_alloc(MEMORY[0x1E4FB3A90]) initWithDuration:1.0];
      double v37 = self->_currentArrowAnimation;
      self->_currentArrowAnimation = v36;

      [(VKTimedAnimation *)self->_currentArrowAnimation setRunsForever:1];
      objc_initWeak(&location, self);
      self->_lastRotation = 0.0;
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __44__MKMapGestureController_handleArrowRotate___block_invoke_3;
      v50[3] = &unk_1E54BAAF0;
      double v28 = v52;
      objc_copyWeak(v52, &location);
      id v51 = v4;
      v52[1] = *(id *)&MidX;
      v52[2] = *(id *)&MidY;
      [(VKTimedAnimation *)self->_currentArrowAnimation setStepHandler:v50];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __44__MKMapGestureController_handleArrowRotate___block_invoke_4;
      v48[3] = &unk_1E54BAA78;
      objc_copyWeak(v49, &location);
      v49[1] = *(id *)&MidX;
      v49[2] = *(id *)&MidY;
      [(VKTimedAnimation *)self->_currentArrowAnimation setCompletionHandler:v48];
      double v38 = [(MKBasicMapView *)self->_mapView mapView];
      [v38 runAnimation:self->_currentArrowAnimation];

      objc_destroyWeak(v49);
      goto LABEL_18;
    }
    [(MKMapGestureController *)self beginGesturing];
    [(MKMapGestureController *)self stopDynamicAnimations];
    BOOL v31 = ([v4 arrows] & 8) == 0;
    if (([v4 modifierFlags] & 0x20000) != 0) {
      double v32 = 12.0;
    }
    else {
      double v32 = 3.0;
    }
    double v33 = self->_rotationFilter;
    if (v33)
    {
      -[MKRotationFilter startRotatingWithFocusPoint:withSnapping:](v33, "startRotatingWithFocusPoint:withSnapping:", 0, MidX, MidY);
    }
    else
    {
      id v39 = [(MKBasicMapView *)self->_mapView mapView];
      objc_msgSend(v39, "startRotatingWithFocusPoint:", MidX, MidY);
    }
    id v40 = objc_loadWeakRetained((id *)&self->_delegate);
    [v40 gestureControllerWillStartRotating:self];

    self->_isFullRotatingFromArrows = 1;
    objc_initWeak(&location, self);
    id v41 = (VKTimedAnimation *)[objc_alloc(MEMORY[0x1E4FB3A90]) initWithDuration:v32];
    double v42 = (void *)qword_18BD1B250[v31];
    double v43 = self->_currentArrowAnimation;
    self->_currentArrowAnimation = v41;

    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __44__MKMapGestureController_handleArrowRotate___block_invoke;
    v55[3] = &unk_1E54BAAC8;
    double v28 = v56;
    objc_copyWeak(v56, &location);
    v56[1] = v42;
    v56[2] = *(id *)&MidX;
    v56[3] = *(id *)&MidY;
    [(VKTimedAnimation *)self->_currentArrowAnimation setStepHandler:v55];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __44__MKMapGestureController_handleArrowRotate___block_invoke_2;
    v53[3] = &unk_1E54BAA78;
    double v29 = v54;
    objc_copyWeak(v54, &location);
    v54[1] = *(id *)&MidX;
    v54[2] = *(id *)&MidY;
    [(VKTimedAnimation *)self->_currentArrowAnimation setCompletionHandler:v53];
    double v30 = [(MKBasicMapView *)self->_mapView mapView];
    [v30 runAnimation:self->_currentArrowAnimation];
LABEL_17:

    objc_destroyWeak(v29);
LABEL_18:
    objc_destroyWeak(v28);
    objc_destroyWeak(&location);
    goto LABEL_19;
  }
  if ([v4 state] == 3 && !self->_isFullRotatingFromArrows)
  {
    [(VKTimedAnimation *)self->_currentArrowAnimation stopAnimation:1];
    char v25 = self->_currentArrowAnimation;
    self->_currentArrowAnimation = 0;

    objc_initWeak(&location, self);
    id v26 = (VKTimedAnimation *)[objc_alloc(MEMORY[0x1E4FB3A90]) initWithDuration:0.25];
    double v27 = self->_currentArrowAnimation;
    self->_currentArrowAnimation = v26;

    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __44__MKMapGestureController_handleArrowRotate___block_invoke_5;
    v46[3] = &unk_1E54BAB18;
    double v28 = v47;
    objc_copyWeak(v47, &location);
    v47[1] = *(id *)&MidX;
    id v47[2] = *(id *)&MidY;
    [(VKTimedAnimation *)self->_currentArrowAnimation setStepHandler:v46];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __44__MKMapGestureController_handleArrowRotate___block_invoke_6;
    v44[3] = &unk_1E54BAA78;
    double v29 = v45;
    objc_copyWeak(v45, &location);
    v45[1] = *(id *)&MidX;
    v45[2] = *(id *)&MidY;
    [(VKTimedAnimation *)self->_currentArrowAnimation setCompletionHandler:v44];
    double v30 = [(MKBasicMapView *)self->_mapView mapView];
    [v30 runAnimation:self->_currentArrowAnimation];
    goto LABEL_17;
  }
LABEL_19:
}

void __44__MKMapGestureController_handleArrowRotate___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v4 = *(double *)(a1 + 40) * a2;
    double v5 = (void *)*((void *)WeakRetained + 5);
    if (v5)
    {
      objc_msgSend(v5, "updateRotationWithFocusPoint:newValue:", *(double *)(a1 + 48), *(double *)(a1 + 56), v4);
    }
    else
    {
      double v6 = [*((id *)WeakRetained + 1) mapView];
      objc_msgSend(v6, "updateRotationWithFocusPoint:newValue:", *(double *)(a1 + 48), *(double *)(a1 + 56), v4);
    }
  }
}

void __44__MKMapGestureController_handleArrowRotate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 392) = 0;
    uint64_t v2 = (void *)*((void *)WeakRetained + 5);
    if (v2)
    {
      objc_msgSend(v2, "stopRotatingWithFocusPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    }
    else
    {
      id v3 = [*((id *)WeakRetained + 1) mapView];
      objc_msgSend(v3, "stopRotatingWithFocusPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    }
    id v4 = objc_loadWeakRetained((id *)WeakRetained + 2);
    [v4 gestureControllerDidStopRotatingDecelerating:WeakRetained];

    [WeakRetained endGesturing];
  }
}

void __44__MKMapGestureController_handleArrowRotate___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    char v2 = [*(id *)(a1 + 32) arrows];
    uint64_t v3 = [*(id *)(a1 + 32) modifierFlags];
    double v4 = dbl_18BD1B260[(v2 & 0x10) == 0];
    if ((v3 & 0x20000) != 0) {
      double v4 = v4 * 0.25;
    }
    double v5 = v4 + *((double *)WeakRetained + 51);
    *((double *)WeakRetained + 50) = v4;
    *((double *)WeakRetained + 51) = v5;
    double v6 = (void *)*((void *)WeakRetained + 5);
    if (v6)
    {
      [v6 updateRotationWithFocusPoint:*(double *)(a1 + 48) newValue:*(double *)(a1 + 56)];
    }
    else
    {
      double v7 = [*((id *)WeakRetained + 1) mapView];
      objc_msgSend(v7, "updateRotationWithFocusPoint:newValue:", *(double *)(a1 + 48), *(double *)(a1 + 56), *((double *)WeakRetained + 51));
    }
  }
}

void __44__MKMapGestureController_handleArrowRotate___block_invoke_4(uint64_t a1, int a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v9 = WeakRetained;
    if (a2)
    {
      id v5 = objc_loadWeakRetained(WeakRetained + 2);
      [v5 gestureControllerDidStopRotating:v9 willDecelerate:1];

      id WeakRetained = v9;
    }
    else
    {
      id v6 = WeakRetained[5];
      if (v6)
      {
        objc_msgSend(v6, "stopRotatingWithFocusPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
      }
      else
      {
        double v7 = [v9[1] mapView];
        objc_msgSend(v7, "stopRotatingWithFocusPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
      }
      id v8 = objc_loadWeakRetained(v9 + 2);
      [v8 gestureControllerDidStopRotating:v9 willDecelerate:0];

      [v9 endGesturing];
      id WeakRetained = v9;
    }
  }
}

void __44__MKMapGestureController_handleArrowRotate___block_invoke_5(uint64_t a1, float a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    double v6 = *((double *)WeakRetained + 51) + *((double *)WeakRetained + 50) * (float)(1.0 - (float)(a2 * a2));
    id v7 = WeakRetained[5];
    double v9 = v5;
    if (v7)
    {
      objc_msgSend(v7, "updateRotationWithFocusPoint:newValue:", *(double *)(a1 + 40), *(double *)(a1 + 48), v6);
    }
    else
    {
      id v8 = [v5[1] mapView];
      objc_msgSend(v8, "updateRotationWithFocusPoint:newValue:", *(double *)(a1 + 40), *(double *)(a1 + 48), v6);
    }
    id v5 = v9;
    *((double *)v9 + 51) = v6;
  }
}

void __44__MKMapGestureController_handleArrowRotate___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v2 = (void *)*((void *)WeakRetained + 5);
    if (v2)
    {
      objc_msgSend(v2, "stopRotatingWithFocusPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    }
    else
    {
      uint64_t v3 = [*((id *)WeakRetained + 1) mapView];
      objc_msgSend(v3, "stopRotatingWithFocusPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    }
    id v4 = objc_loadWeakRetained((id *)WeakRetained + 2);
    [v4 gestureControllerDidStopRotatingDecelerating:WeakRetained];

    [WeakRetained endGesturing];
  }
}

- (void)handleArrowZoom:(id)a3
{
  id v4 = a3;
  [(MKBasicMapView *)self->_mapView bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(MKBasicMapView *)self->_mapView edgeInsets];
  CGFloat v14 = v6 + v13;
  CGFloat v16 = v8 + v15;
  CGFloat v18 = v10 - (v13 + v17);
  CGFloat v20 = v12 - (v15 + v19);
  v67.origin.double x = v14;
  v67.origin.double y = v16;
  v67.size.width = v18;
  v67.size.height = v20;
  double MidX = CGRectGetMidX(v67);
  v68.origin.double x = v14;
  v68.origin.double y = v16;
  v68.size.width = v18;
  v68.size.height = v20;
  double MidY = CGRectGetMidY(v68);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v24 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v24, "gestureController:focusPointForPoint:gestureKind:", self, 0, MidX, MidY);
    double MidX = v25;
    double MidY = v26;
  }
  if ([v4 state] == 1)
  {
    [(MKMapGestureController *)self beginGesturing];
    [(MKMapGestureController *)self stopDynamicAnimations];
    double v27 = [(MKBasicMapView *)self->_mapView mapView];
    objc_msgSend(v27, "startPinchingWithFocusPoint:", MidX, MidY);

    id v28 = objc_loadWeakRetained((id *)&self->_delegate);
    [v28 gestureControllerWillStartZooming:self animated:1];

    self->_double pinchFactorAverageInGesture = 1.0;
    self->_double lastScale = 1.0;
    self->_arrowZoomStartTimestamp = CFAbsoluteTimeGetCurrent();
    double v29 = (VKTimedAnimation *)[objc_alloc(MEMORY[0x1E4FB3A90]) initWithDuration:1.0];
    currentArrowAnimation = self->_currentArrowAnimation;
    self->_currentArrowAnimation = v29;

    [(VKTimedAnimation *)self->_currentArrowAnimation setRunsForever:1];
    objc_initWeak(&location, self);
    from[0] = 0;
    from[1] = from;
    from[2] = (id)0x2020000000;
    CFAbsoluteTime Current = 0.0;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __42__MKMapGestureController_handleArrowZoom___block_invoke;
    v60[3] = &unk_1E54BAB40;
    objc_copyWeak(v63, &location);
    v62 = from;
    id v61 = v4;
    v63[1] = *(id *)&MidX;
    v63[2] = *(id *)&MidY;
    [(VKTimedAnimation *)self->_currentArrowAnimation setStepHandler:v60];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __42__MKMapGestureController_handleArrowZoom___block_invoke_2;
    v58[3] = &unk_1E54BAA78;
    objc_copyWeak(v59, &location);
    v59[1] = *(id *)&MidX;
    v59[2] = *(id *)&MidY;
    [(VKTimedAnimation *)self->_currentArrowAnimation setCompletionHandler:v58];
    BOOL v31 = [(MKBasicMapView *)self->_mapView mapView];
    [v31 runAnimation:self->_currentArrowAnimation];

    objc_destroyWeak(v59);
    objc_destroyWeak(v63);
    _Block_object_dispose(from, 8);
    p_id location = &location;
LABEL_19:
    objc_destroyWeak(p_location);
    goto LABEL_20;
  }
  if ([v4 state] == 3)
  {
    [(VKTimedAnimation *)self->_currentArrowAnimation stopAnimation:1];
    double v33 = self->_currentArrowAnimation;
    self->_currentArrowAnimation = 0;

    objc_initWeak(from, self);
    double v34 = 0.0;
    if (self->_arrowZoomStartTimestamp - CFAbsoluteTimeGetCurrent() + 0.25 > 0.0) {
      double v34 = self->_arrowZoomStartTimestamp - CFAbsoluteTimeGetCurrent() + 0.25;
    }
    uint64_t v35 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v35 doubleForKey:@"ZoomingDefault"];
    double v37 = v36;

    double arrowZoomSpeed = self->_arrowZoomSpeed;
    id v39 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v39 doubleForKey:@"ZoomingDefault"];
    double v41 = v40;

    if (arrowZoomSpeed < v41)
    {
      double v42 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v42 doubleForKey:@"ZoomingDefault"];
      double v37 = v37 + (v43 - self->_arrowZoomSpeed) * 0.699999988;
    }
    double v44 = CFAbsoluteTimeGetCurrent() - self->_arrowZoomStartTimestamp;
    double v45 = 0.0;
    if (v44 >= 0.125)
    {
      double v45 = 1.0;
      if (v44 < 0.5) {
        double v45 = (v44 + -0.125) / 0.375;
      }
    }
    double pinchFactorAverageInGesture = self->_pinchFactorAverageInGesture;
    if (pinchFactorAverageInGesture > 1.0
      || fabs(pinchFactorAverageInGesture + -1.0) < 0.000001 && ([v4 lastArrows] & 2) != 0)
    {
      double v47 = v37 + 1.0;
    }
    else
    {
      double v47 = 1.0 - v37;
    }
    double v48 = self->_pinchFactorAverageInGesture;
    long long v49 = (VKTimedAnimation *)[objc_alloc(MEMORY[0x1E4FB3A90]) initWithDuration:v34 + 0.25];
    id v51 = self->_currentArrowAnimation;
    self->_currentArrowAnimation = v49;

    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __42__MKMapGestureController_handleArrowZoom___block_invoke_3;
    v55[3] = &unk_1E54BAB68;
    objc_copyWeak(v56, from);
    float v50 = v34 / (v34 + 0.25);
    float v57 = v50;
    *(double *)&v56[1] = v47 + v45 * (v48 - v47);
    v56[2] = *(id *)&MidX;
    v56[3] = *(id *)&MidY;
    [(VKTimedAnimation *)self->_currentArrowAnimation setStepHandler:v55];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __42__MKMapGestureController_handleArrowZoom___block_invoke_4;
    v53[3] = &unk_1E54BAA78;
    objc_copyWeak(v54, from);
    v54[1] = *(id *)&MidX;
    v54[2] = *(id *)&MidY;
    [(VKTimedAnimation *)self->_currentArrowAnimation setCompletionHandler:v53];
    CGRect v52 = [(MKBasicMapView *)self->_mapView mapView];
    [v52 runAnimation:self->_currentArrowAnimation];

    objc_destroyWeak(v54);
    objc_destroyWeak(v56);
    p_id location = from;
    goto LABEL_19;
  }
LABEL_20:
}

void __42__MKMapGestureController_handleArrowZoom___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    double Current = CFAbsoluteTimeGetCurrent();
    double v4 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    char v5 = [*(id *)(a1 + 32) arrows];
    double v6 = *((double *)v9 + 28);
    if ((v5 & 2) == 0) {
      double v6 = -v6;
    }
    double v7 = (Current - v4) * v6 * 60.0 + 1.0;
    *((double *)v9 + 30) = (*((double *)v9 + 30) + *((double *)v9 + 30)) / 3.0 + v7 / 3.0;
    *((CFAbsoluteTime *)v9 + 31) = CFAbsoluteTimeGetCurrent();
    double v8 = [*((id *)v9 + 1) mapView];
    objc_msgSend(v8, "updatePinchWithFocusPoint:oldFactor:newFactor:", *(double *)(a1 + 56), *(double *)(a1 + 64), 1.0, v7);

    id WeakRetained = v9;
    *((double *)v9 + 32) = v7;
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = Current;
  }
}

void __42__MKMapGestureController_handleArrowZoom___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v8 = WeakRetained;
    if (a2)
    {
      id v5 = objc_loadWeakRetained(WeakRetained + 2);
      objc_msgSend(v5, "gestureControllerDidStopZooming:direction:willDecelerate:");
    }
    else
    {
      double v6 = [WeakRetained[1] mapView];
      objc_msgSend(v6, "stopPinchingWithFocusPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

      id v7 = objc_loadWeakRetained(v8 + 2);
      objc_msgSend(v7, "gestureControllerDidStopZooming:direction:willDecelerate:");

      [v8 endGesturing];
    }
    id WeakRetained = v8;
  }
}

void __42__MKMapGestureController_handleArrowZoom___block_invoke_3(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    float v5 = *(float *)(a1 + 64);
    double v13 = (double *)WeakRetained;
    if (v5 <= a2)
    {
      double v10 = *(double *)(a1 + 40);
      double v11 = *((double *)WeakRetained + 32);
      double v8 = [*((id *)WeakRetained + 1) mapView];
      float v12 = fmaxf(a2 - v5, 0.0);
      double v9 = v11 * ((v10 + -1.0) * 0.25 * (1.0 - v12 * v12) + 1.0);
    }
    else
    {
      double v6 = *(double *)(a1 + 40);
      double v7 = *((double *)WeakRetained + 32);
      double v8 = [*((id *)WeakRetained + 1) mapView];
      double v9 = v6 * v7;
    }
    objc_msgSend(v8, "updatePinchWithFocusPoint:oldFactor:newFactor:", *(double *)(a1 + 48), *(double *)(a1 + 56), v13[32], v9);

    id WeakRetained = v13;
    v13[32] = v9;
  }
}

void __42__MKMapGestureController_handleArrowZoom___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v2 = [WeakRetained[1] mapView];
    objc_msgSend(v2, "stopPinchingWithFocusPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

    id v3 = objc_loadWeakRetained(WeakRetained + 2);
    objc_msgSend(v3, "gestureControllerDidStopZoomingDecelerating:direction:");

    [WeakRetained endGesturing];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  double v4 = (MKTiltGestureRecognizer *)a3;
  float v5 = v4;
  if ((MKTiltGestureRecognizer *)self->_conditionalPanTiltGestureRecognizer == v4)
  {
    double v7 = [(MKBasicMapView *)self->_mapView mapView];
    char v6 = [v7 canEnter3DMode];
  }
  else if (self->_tiltGestureRecognizer == v4)
  {
    char v6 = [(MKMapGestureController *)self tiltGestureRecognizerShouldBegin:v4];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)tiltGestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  float v5 = [(MKBasicMapView *)self->_mapView mapView];
  char v6 = [v5 canEnter3DMode];

  if ((v6 & 1) == 0) {
    goto LABEL_4;
  }
  double v7 = [(MKMapGestureController *)self mapView];
  [v4 locationOfTouch:0 inView:v7];
  double v9 = v8;
  double v11 = v10;

  float v12 = [(MKMapGestureController *)self mapView];
  [v4 locationOfTouch:1 inView:v12];
  double v14 = v13;
  double v16 = v15;

  double v17 = v14 - v9;
  double v18 = (v16 - v11) * (v16 - v11) + v17 * v17;
  if (v18 > 0.0) {
    BOOL v19 = v17 * v17 / v18 > 0.25;
  }
  else {
LABEL_4:
  }
    BOOL v19 = 0;

  return v19;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  char v6 = (UIPanGestureRecognizer *)a3;
  id v7 = a4;
  double v8 = v7;
  if ((UIPanGestureRecognizer *)self->_oneHandedZoomGestureRecognizer == v6
    && ([v7 _isPointerTouch] & 1) != 0
    || ([(MKMapGestureController *)self delegate],
        double v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 gestureController:self shouldReceiveTouch:v8],
        v9,
        (v10 & 1) == 0))
  {
    BOOL v11 = 0;
  }
  else if (self->_panGestureRecognizer == v6)
  {
    float v12 = [v8 view];
    double v13 = [v12 traitCollection];
    BOOL v11 = [v13 touchLevel] != 1;
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v7 = (UIPanGestureRecognizer *)a3;
  double v8 = (UIPanGestureRecognizer *)a4;
  double v9 = v8;
  touchGestureRecognizer = self->_touchGestureRecognizer;
  if (touchGestureRecognizer == (_MKUserInteractionGestureRecognizer *)v7
    || touchGestureRecognizer == (_MKUserInteractionGestureRecognizer *)v8)
  {
    goto LABEL_10;
  }
  twoFingerLongPressGestureRecognizer = self->_twoFingerLongPressGestureRecognizer;
  if (twoFingerLongPressGestureRecognizer == (UILongPressGestureRecognizer *)v7
    || twoFingerLongPressGestureRecognizer == (UILongPressGestureRecognizer *)v8)
  {
    goto LABEL_10;
  }
  pinchGestureRecognizer = self->_pinchGestureRecognizer;
  if (pinchGestureRecognizer == (UIPinchGestureRecognizer *)v7 && self->_panGestureRecognizer == v8
    || pinchGestureRecognizer == (UIPinchGestureRecognizer *)v8 && self->_panGestureRecognizer == v7
    || (rotationGestureRecognizer = self->_rotationGestureRecognizer,
        rotationGestureRecognizer == (UIRotationGestureRecognizer *)v7)
    && self->_panGestureRecognizer == v8
    || rotationGestureRecognizer == (UIRotationGestureRecognizer *)v8 && self->_panGestureRecognizer == v7)
  {
    BOOL v19 = [(MKBasicMapView *)self->_mapView mapView];
    int v14 = [v19 staysCenteredDuringPinch] ^ 1;

    goto LABEL_11;
  }
  if (rotationGestureRecognizer == (UIRotationGestureRecognizer *)v7)
  {
    id v4 = [(MKMapGestureController *)self pinchGestureRecognizer];
    if (v4 == v9)
    {

      goto LABEL_10;
    }
  }
  double v18 = [(MKMapGestureController *)self pinchGestureRecognizer];
  if (v18 == v7)
  {
    CGFloat v20 = self->_rotationGestureRecognizer;

    if (rotationGestureRecognizer == (UIRotationGestureRecognizer *)v7) {
    if (v20 != (UIRotationGestureRecognizer *)v9)
    }
      goto LABEL_29;
LABEL_10:
    LOBYTE(v14) = 1;
    goto LABEL_11;
  }

  if (rotationGestureRecognizer == (UIRotationGestureRecognizer *)v7) {
LABEL_29:
  }
  oneHandedZoomGestureRecognizer = self->_oneHandedZoomGestureRecognizer;
  LOBYTE(v14) = 1;
  if (oneHandedZoomGestureRecognizer != (_MKOneHandedZoomGestureRecognizer *)v7
    && oneHandedZoomGestureRecognizer != (_MKOneHandedZoomGestureRecognizer *)v9)
  {
    conditionalPanRotationGestureRecognizer = self->_conditionalPanRotationGestureRecognizer;
    conditionalPanTiltGestureRecognizer = self->_conditionalPanTiltGestureRecognizer;
    if (conditionalPanRotationGestureRecognizer != (_MKConditionalPanRotationGestureRecognizer *)v7
      || conditionalPanTiltGestureRecognizer != (_MKConditionalPanTiltGestureRecognizer *)v9)
    {
      if (conditionalPanRotationGestureRecognizer) {
        BOOL v24 = conditionalPanTiltGestureRecognizer == (_MKConditionalPanTiltGestureRecognizer *)v7;
      }
      else {
        BOOL v24 = 0;
      }
      LOBYTE(v14) = v24;
    }
  }
LABEL_11:

  return v14;
}

- (UILongPressGestureRecognizer)twoFingerLongPressGestureRecognizer
{
  return self->_twoFingerLongPressGestureRecognizer;
}

- (MKMapGestureControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKMapGestureControllerDelegate *)WeakRetained;
}

- (MKBasicMapView)mapView
{
  return self->_mapView;
}

- (MKScaleView)scaleView
{
  return self->_scaleView;
}

- (MKCompassView)compassView
{
  return self->_compassView;
}

- (MKRotationFilter)rotationFilter
{
  return self->_rotationFilter;
}

- (BOOL)panWithMomentum
{
  return self->_panWithMomentum;
}

- (void)setPanWithMomentum:(BOOL)a3
{
  self->_panWithMomentum = a3;
}

- (BOOL)rotationSnappingEnabled
{
  return self->_rotationSnappingEnabled;
}

- (void)setRotationSnappingEnabled:(BOOL)a3
{
  self->_rotationSnappingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_tiltDecelerationAnimation, 0);
  objc_storeStrong((id *)&self->_tiltGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rotationDecelerationAnimation, 0);
  objc_storeStrong((id *)&self->_rotationGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_touchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panDecelerationAnimationGroup, 0);
  objc_storeStrong((id *)&self->_pinchDecelerationAnimation, 0);
  objc_storeStrong((id *)&self->_currentArrowAnimation, 0);
  objc_storeStrong((id *)&self->_arrowPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_arrowRotateGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_arrowZoomGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_activeArrowGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_gestureInterruptionRecognizer, 0);
  objc_storeStrong((id *)&self->_conditionalPanTiltGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_conditionalPanZoomGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_conditionalPanRotationGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scaleDragGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_zoomConfiguration, 0);
  objc_storeStrong((id *)&self->_oneHandedZoomGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_twoFingerLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_twoFingerTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rotationFilter, 0);
  objc_storeStrong((id *)&self->_compassView, 0);
  objc_storeStrong((id *)&self->_scaleView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_mapView, 0);
}

@end