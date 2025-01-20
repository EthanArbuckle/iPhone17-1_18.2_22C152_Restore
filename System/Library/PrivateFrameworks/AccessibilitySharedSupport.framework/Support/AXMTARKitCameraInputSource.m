@interface AXMTARKitCameraInputSource
+ (BOOL)isAvailable;
- (ARFaceAnchor)_currentlyTrackedFaceAnchor;
- (ARSession)_session;
- (AVCaptureVideoPreviewLayer)_previewLayer;
- (AXMTARKitCameraInputSourceDelegate)delegate;
- (AXMTRelativePointerMovementMapper)_pointerMovementMapper;
- (AXMTTrackingAreaPointMapper)_trackingAreaPointMapper;
- (AXMTVelocityBasedPointMapper)_velocityBasedPointMapper;
- (AXSSMotionTrackingExpressionConfiguration)expressionConfiguration;
- (BOOL)_didUpdateAnchors:(id)a3;
- (BOOL)_interrupted;
- (BOOL)_isStarted;
- (BOOL)debugOverlayEnabled;
- (CGPoint)_computeAbsoluteModeForPoint:(CGPoint)a3;
- (CGPoint)_computeAccelerationModeForPoint:(CGPoint)a3;
- (CGPoint)_computeJoystickModeForPoint:(CGPoint)a3;
- (CGPoint)_convertProjectedPointToScreenCoordinates:(CGPoint)a3 useSensitivity:(BOOL)a4;
- (CGPoint)_project3DVertexOnto2DPlane:(AXMTARKitCameraInputSource *)self;
- (CGRect)_headTrackingBounds;
- (NSMutableArray)_screenLookAtPoints;
- (NSSet)_previousExpressions;
- (UIView)_headTrackingRect;
- (UIView)_rootView;
- (double)joystickModeMovementThreshold;
- (double)sensitivity;
- (id)initInsideView:(id)a3;
- (int64_t)_avCaptureSessionInterruptionReason;
- (int64_t)_lastReportedFailure;
- (unint64_t)motionTrackingMode;
- (void)_captureSessionDidStartRunningNotification:(id)a3;
- (void)_captureSessionDidStopRunningNotification:(id)a3;
- (void)_captureSessionRuntimeErrorNotification:(id)a3;
- (void)_captureSessionWasInterruptedNotification:(id)a3;
- (void)_handleFaceBlendShapes:(id)a3;
- (void)_notifyClientOfLostFaceWithReason:(int64_t)a3 underlyingError:(id)a4;
- (void)_restartTracking;
- (void)_setUpDebugOverlay;
- (void)_setupARSessionInsideView:(id)a3;
- (void)_tearDownDebugOverlay;
- (void)_updateAccelerationFactorForPointerMovementMapper;
- (void)_updateDebugOverlay;
- (void)_updateMovementThresholdforPointerMovementMapper;
- (void)axmtUtilities_interfaceOrientationChanged:(int64_t)a3;
- (void)handleEventWithProjectedPoint:(CGPoint)a3;
- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)sessionInterruptionEnded:(id)a3;
- (void)sessionWasInterrupted:(id)a3;
- (void)setDebugOverlayEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setExpressionConfiguration:(id)a3;
- (void)setJoystickModeMovementThreshold:(double)a3;
- (void)setMotionTrackingMode:(unint64_t)a3;
- (void)setSensitivity:(double)a3;
- (void)set_avCaptureSessionInterruptionReason:(int64_t)a3;
- (void)set_currentlyTrackedFaceAnchor:(id)a3;
- (void)set_headTrackingBounds:(CGRect)a3;
- (void)set_headTrackingRect:(id)a3;
- (void)set_interrupted:(BOOL)a3;
- (void)set_lastReportedFailure:(int64_t)a3;
- (void)set_pointerMovementMapper:(id)a3;
- (void)set_previewLayer:(id)a3;
- (void)set_previousExpressions:(id)a3;
- (void)set_rootView:(id)a3;
- (void)set_screenLookAtPoints:(id)a3;
- (void)set_session:(id)a3;
- (void)set_trackingAreaPointMapper:(id)a3;
- (void)set_velocityBasedPointMapper:(id)a3;
- (void)startRunning;
- (void)stopRunning;
@end

@implementation AXMTARKitCameraInputSource

- (id)initInsideView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXMTARKitCameraInputSource;
  v5 = [(AXMTARKitCameraInputSource *)&v8 init];
  v6 = v5;
  if (v5) {
    [(AXMTARKitCameraInputSource *)v5 _setupARSessionInsideView:v4];
  }

  return v6;
}

+ (BOOL)isAvailable
{
  id v2 = sub_100008B98();

  return [v2 isSupported];
}

- (NSMutableArray)_screenLookAtPoints
{
  screenLookAtPoints = self->__screenLookAtPoints;
  if (!screenLookAtPoints)
  {
    id v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v5 = self->__screenLookAtPoints;
    self->__screenLookAtPoints = v4;

    screenLookAtPoints = self->__screenLookAtPoints;
  }

  return screenLookAtPoints;
}

- (void)_setupARSessionInsideView:(id)a3
{
  id v4 = a3;
  v5 = AXSSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "ARKitCameraInputSource:_setupARSessionInsideView: called with rootView: %@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v6 = (void *)qword_100054D90;
  uint64_t v13 = qword_100054D90;
  if (!qword_100054D90)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v15 = sub_10000C198;
    v16 = &unk_100048B88;
    v17 = &v10;
    sub_10000C198((uint64_t)&buf);
    v6 = (void *)v11[3];
  }
  v7 = v6;
  _Block_object_dispose(&v10, 8);
  id v8 = objc_alloc_init(v7);
  -[AXMTARKitCameraInputSource set_session:](self, "set_session:", v8, v10);

  v9 = [(AXMTARKitCameraInputSource *)self _session];
  [v9 setDelegate:self];

  [(AXMTARKitCameraInputSource *)self set_rootView:v4];
}

- (void)_restartTracking
{
  v3 = AXSSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "ARKitCameraInputSource:_restartTracking: called", buf, 2u);
  }

  [(AXMTARKitCameraInputSource *)self set_interrupted:0];
  [(AXMTARKitCameraInputSource *)self set_avCaptureSessionInterruptionReason:0x7FFFFFFFFFFFFFFFLL];
  [(AXMTARKitCameraInputSource *)self set_lastReportedFailure:0x7FFFFFFFFFFFFFFFLL];
  id v4 = objc_alloc_init((Class)sub_100008B98());
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v5 = objc_msgSend((id)objc_opt_class(), "supportedVideoFormats", 0);
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v23;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    double v11 = 1.79769313e308;
    double v12 = 1.79769313e308;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v5);
        }
        v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ((uint64_t)[v14 framesPerSecond] <= v10 && (uint64_t)objc_msgSend(v14, "framesPerSecond") >= 30)
        {
          [v14 imageResolution];
          if (v15 <= v12 || ([v14 imageResolution], v16 <= v11))
          {
            uint64_t v10 = (uint64_t)[v14 framesPerSecond];
            [v14 imageResolution];
            double v12 = v17;
            [v14 imageResolution];
            double v11 = v18;
            id v19 = v14;

            id v8 = v19;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  v20 = AXSSLogForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "ARKitCameraInputSource:_restartTracking: setVideoFormat:%@", buf, 0xCu);
  }

  if (v8) {
    [v4 setVideoFormat:v8];
  }
  [v4 setLightEstimationEnabled:1];
  v21 = [(AXMTARKitCameraInputSource *)self _session];
  [v21 runWithConfiguration:v4 options:3];

  [(AXMTARKitCameraInputSource *)self debugOverlayEnabled];
}

- (void)setDebugOverlayEnabled:(BOOL)a3
{
  if (self->_debugOverlayEnabled != a3)
  {
    self->_debugOverlayEnabled = 0;
    [(AXMTARKitCameraInputSource *)self _updateDebugOverlay];
  }
}

- (void)_updateDebugOverlay
{
  if ([(AXMTARKitCameraInputSource *)self debugOverlayEnabled])
  {
    [(AXMTARKitCameraInputSource *)self _setUpDebugOverlay];
  }
  else
  {
    [(AXMTARKitCameraInputSource *)self _tearDownDebugOverlay];
  }
}

- (void)_setUpDebugOverlay
{
  v3 = [(AXMTARKitCameraInputSource *)self _rootView];

  if (v3)
  {
    id v4 = [(AXMTARKitCameraInputSource *)self _rootView];
    v5 = +[AXMTUtilities sharedInstance];
    [v5 screenBoundsAccountingForInterfaceOrientation];
    double v7 = v6;
    double v9 = v8;

    v30 = [v4 widthAnchor];
    v29 = [v30 constraintEqualToConstant:v7];
    v31[0] = v29;
    v28 = [v4 heightAnchor];
    uint64_t v10 = [v28 constraintEqualToConstant:v9];
    v31[1] = v10;
    double v11 = [v4 topAnchor];
    double v12 = [v4 topAnchor];
    uint64_t v13 = [v11 constraintEqualToAnchor:v12 constant:0.0];
    v31[2] = v13;
    v14 = [v4 leadingAnchor];
    double v15 = [v4 leadingAnchor];
    double v16 = [v14 constraintEqualToAnchor:v15 constant:0.0];
    v31[3] = v16;
    double v17 = +[NSArray arrayWithObjects:v31 count:4];
    +[NSLayoutConstraint activateConstraints:v17];

    -[AXMTARKitCameraInputSource set_headTrackingBounds:](self, "set_headTrackingBounds:", NSZeroRect.origin.x, NSZeroRect.origin.y, NSZeroRect.size.width, NSZeroRect.size.height);
    id v18 = objc_alloc((Class)UIView);
    [(AXMTARKitCameraInputSource *)self _headTrackingBounds];
    id v19 = objc_msgSend(v18, "initWithFrame:");
    [(AXMTARKitCameraInputSource *)self set_headTrackingRect:v19];

    id v20 = +[UIColor redColor];
    id v21 = [v20 CGColor];
    long long v22 = [(AXMTARKitCameraInputSource *)self _headTrackingRect];
    long long v23 = [v22 layer];
    [v23 setBorderColor:v21];

    long long v24 = [(AXMTARKitCameraInputSource *)self _headTrackingRect];
    long long v25 = [v24 layer];
    [v25 setBorderWidth:3.0];

    v26 = [(AXMTARKitCameraInputSource *)self _headTrackingRect];
    [v4 addSubview:v26];

    v27 = [(AXMTARKitCameraInputSource *)self _rootView];
    [v27 setAlpha:1.0];
  }
}

- (void)_tearDownDebugOverlay
{
  v3 = [(AXMTARKitCameraInputSource *)self _headTrackingRect];
  [v3 setHidden:1];

  id v4 = [(AXMTARKitCameraInputSource *)self _headTrackingRect];
  [v4 removeFromSuperview];

  id v5 = [(AXMTARKitCameraInputSource *)self _rootView];
  [v5 setAlpha:0.0];
}

- (BOOL)_isStarted
{
  id v2 = [(AXMTARKitCameraInputSource *)self _session];
  BOOL v3 = [v2 state] == (id)1;

  return v3;
}

- (void)startRunning
{
  if (![(AXMTARKitCameraInputSource *)self _isStarted])
  {
    BOOL v3 = AXSSLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "ARKitCameraInputSource:startRunning: called", v6, 2u);
    }

    id v4 = +[AXMTUtilities sharedInstance];
    [v4 registerListener:self needsPhysicalOrientationEvents:0];

    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"_captureSessionDidStartRunningNotification:" name:AVCaptureSessionDidStartRunningNotification object:0];
    [v5 addObserver:self selector:"_captureSessionDidStopRunningNotification:" name:AVCaptureSessionDidStopRunningNotification object:0];
    [v5 addObserver:self selector:"_captureSessionRuntimeErrorNotification:" name:AVCaptureSessionRuntimeErrorNotification object:0];
    [v5 addObserver:self selector:"_captureSessionWasInterruptedNotification:" name:AVCaptureSessionWasInterruptedNotification object:0];
    [(AXMTARKitCameraInputSource *)self _updateDebugOverlay];
    [(AXMTARKitCameraInputSource *)self set_interrupted:0];
    [(AXMTARKitCameraInputSource *)self set_avCaptureSessionInterruptionReason:0x7FFFFFFFFFFFFFFFLL];
    [(AXMTARKitCameraInputSource *)self set_lastReportedFailure:0x7FFFFFFFFFFFFFFFLL];
    [(AXMTARKitCameraInputSource *)self _restartTracking];
  }
}

- (void)stopRunning
{
  if ([(AXMTARKitCameraInputSource *)self _isStarted])
  {
    BOOL v3 = AXSSLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "ARKitCameraInputSource:stopRunning: called", v7, 2u);
    }

    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:AVCaptureSessionDidStartRunningNotification object:0];
    [v4 removeObserver:self name:AVCaptureSessionDidStopRunningNotification object:0];
    [v4 removeObserver:self name:AVCaptureSessionRuntimeErrorNotification object:0];
    [v4 removeObserver:self name:AVCaptureSessionWasInterruptedNotification object:0];
    id v5 = [(AXMTARKitCameraInputSource *)self _session];
    [v5 pause];

    [(AXMTARKitCameraInputSource *)self set_session:0];
    [(AXMTARKitCameraInputSource *)self setDebugOverlayEnabled:0];
    [(AXMTARKitCameraInputSource *)self set_screenLookAtPoints:0];
    [(AXMTARKitCameraInputSource *)self set_velocityBasedPointMapper:0];
    [(AXMTARKitCameraInputSource *)self set_pointerMovementMapper:0];
    [(AXMTARKitCameraInputSource *)self set_interrupted:0];
    [(AXMTARKitCameraInputSource *)self set_avCaptureSessionInterruptionReason:0x7FFFFFFFFFFFFFFFLL];
    [(AXMTARKitCameraInputSource *)self set_lastReportedFailure:0x7FFFFFFFFFFFFFFFLL];
    double v6 = +[AXMTUtilities sharedInstance];
    [v6 unregisterListener:self];
  }
}

- (void)setMotionTrackingMode:(unint64_t)a3
{
  if (self->_motionTrackingMode != a3)
  {
    self->_motionTrackingMode = a3;
    id v4 = +[NSMutableArray array];
    [(AXMTARKitCameraInputSource *)self set_screenLookAtPoints:v4];

    if ([(AXMTARKitCameraInputSource *)self debugOverlayEnabled])
    {
      double y = NSZeroRect.origin.y;
      double width = NSZeroRect.size.width;
      double height = NSZeroRect.size.height;
      -[AXMTARKitCameraInputSource set_headTrackingBounds:](self, "set_headTrackingBounds:", NSZeroRect.origin.x, y, width, height);
      id v8 = [(AXMTARKitCameraInputSource *)self _headTrackingRect];
      objc_msgSend(v8, "setFrame:", NSZeroRect.origin.x, y, width, height);
    }
  }
}

- (void)setSensitivity:(double)a3
{
  if (vabdd_f64(self->_sensitivity, a3) > 2.22044605e-16)
  {
    self->_sensitivitdouble y = a3;
    id v5 = [(AXMTARKitCameraInputSource *)self _velocityBasedPointMapper];

    if (v5)
    {
      double v6 = [(AXMTARKitCameraInputSource *)self _velocityBasedPointMapper];
      [v6 setSensitivity:a3];
    }
    [(AXMTARKitCameraInputSource *)self _updateAccelerationFactorForPointerMovementMapper];
  }
}

- (void)setJoystickModeMovementThreshold:(double)a3
{
  if (vabdd_f64(self->_joystickModeMovementThreshold, a3) > 2.22044605e-16)
  {
    self->_joystickModeMovementThreshold = a3;
    [(AXMTARKitCameraInputSource *)self _updateMovementThresholdforPointerMovementMapper];
  }
}

- (void)axmtUtilities_interfaceOrientationChanged:(int64_t)a3
{
  id v4 = +[AXMTUtilities sharedInstance];
  [v4 screenBoundsAccountingForInterfaceOrientation];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  uint64_t v13 = [(AXMTARKitCameraInputSource *)self _velocityBasedPointMapper];
  objc_msgSend(v13, "setBounds:", v6, v8, v10, v12);

  id v14 = [(AXMTARKitCameraInputSource *)self _pointerMovementMapper];
  objc_msgSend(v14, "setScreenBounds:", v6, v8, v10, v12);
}

- (void)_captureSessionDidStartRunningNotification:(id)a3
{
  id v3 = a3;
  id v4 = AXSSLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    double v5 = [v3 object];
    double v6 = [v3 userInfo];
    int v7 = 138412546;
    double v8 = v5;
    __int16 v9 = 2112;
    double v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "ARKitCameraInputSource:_captureSessionDidStartRunningNotification: notification.object: %@, userInfo: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_captureSessionDidStopRunningNotification:(id)a3
{
  id v3 = a3;
  id v4 = AXSSLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    double v5 = [v3 object];
    double v6 = [v3 userInfo];
    int v7 = 138412546;
    double v8 = v5;
    __int16 v9 = 2112;
    double v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "ARKitCameraInputSource:_captureSessionDidStopRunningNotification: notification.object: %@, userInfo: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_captureSessionRuntimeErrorNotification:(id)a3
{
  id v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:AVCaptureSessionErrorKey];
  double v5 = AXSSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10000C5CC();
  }
}

- (void)_captureSessionWasInterruptedNotification:(id)a3
{
  id v4 = [a3 userInfo];
  double v5 = [v4 objectForKeyedSubscript:AVCaptureSessionInterruptionReasonKey];
  -[AXMTARKitCameraInputSource set_avCaptureSessionInterruptionReason:](self, "set_avCaptureSessionInterruptionReason:", [v5 integerValue]);

  double v6 = [v4 objectForKeyedSubscript:AVCaptureSessionInterruptionSystemPressureStateKey];
  int v7 = AXSSLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10000C648(self, (uint64_t)v6, v7);
  }
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  double v6 = AXSSLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10000C6D8((uint64_t)v5, v6);
  }

  if (![(AXMTARKitCameraInputSource *)self _interrupted]) {
    [(AXMTARKitCameraInputSource *)self _notifyClientOfLostFaceWithReason:0 underlyingError:v5];
  }
  [(AXMTARKitCameraInputSource *)self set_interrupted:1];
}

- (void)sessionWasInterrupted:(id)a3
{
  id v4 = AXSSLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "ARKitCameraInputSource: sessionWasInterrupted:", v6, 2u);
  }

  if (![(AXMTARKitCameraInputSource *)self _interrupted])
  {
    if ((id)[(AXMTARKitCameraInputSource *)self _avCaptureSessionInterruptionReason] == (id)3)uint64_t v5 = 7; {
    else
    }
      uint64_t v5 = 0;
    [(AXMTARKitCameraInputSource *)self _notifyClientOfLostFaceWithReason:v5 underlyingError:0];
  }
  [(AXMTARKitCameraInputSource *)self set_interrupted:1];
}

- (void)sessionInterruptionEnded:(id)a3
{
  id v4 = AXSSLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "ARKitCameraInputSource: sessionInterruptionEnded:", v6, 2u);
  }

  [(AXMTARKitCameraInputSource *)self set_interrupted:0];
  [(AXMTARKitCameraInputSource *)self set_avCaptureSessionInterruptionReason:0x7FFFFFFFFFFFFFFFLL];
  uint64_t v5 = [(AXMTARKitCameraInputSource *)self delegate];
  [v5 arKitCameraInputSourceInterruptionEnded:self];

  [(AXMTARKitCameraInputSource *)self _restartTracking];
}

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  id v4 = a4;
  uint64_t v5 = AXSSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218240;
    id v7 = [v4 trackingState];
    __int16 v8 = 2048;
    id v9 = [v4 trackingStateReason];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "ARKitCameraInputSource: cameraDidChangeTrackingState: trackingState %ld reason %ld", (uint8_t *)&v6, 0x16u);
  }
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v12 = a4;
  AXMTLogFPS();
  uint64_t v5 = [v12 anchors];
  unsigned __int8 v6 = [(AXMTARKitCameraInputSource *)self _didUpdateAnchors:v5];
  int64_t v7 = [(AXMTARKitCameraInputSource *)self _lastReportedFailure];
  if (v6)
  {
    if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
      [(AXMTARKitCameraInputSource *)self set_lastReportedFailure:0x7FFFFFFFFFFFFFFFLL];
    }
  }
  else
  {
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      __int16 v8 = 0;
    }
    else
    {
      __int16 v8 = +[NSNumber numberWithInteger:[(AXMTARKitCameraInputSource *)self _lastReportedFailure]];
    }
    id v9 = [v12 faceData];
    double v10 = [v9 faceMeshPayload];
    int64_t v11 = +[AXMTUtilities errorCodeForFaceKitPayload:v10 lastReportedFailureNumber:v8];

    [(AXMTARKitCameraInputSource *)self _notifyClientOfLostFaceWithReason:v11 underlyingError:0];
  }
}

- (BOOL)_didUpdateAnchors:(id)a3
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v20;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v3);
        }
        int64_t v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v24 = 0;
        long long v25 = &v24;
        uint64_t v26 = 0x2050000000;
        __int16 v8 = (void *)qword_100054D98;
        uint64_t v27 = qword_100054D98;
        if (!qword_100054D98)
        {
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_10000C1F0;
          v23[3] = &unk_100048B88;
          v23[4] = &v24;
          sub_10000C1F0((uint64_t)v23);
          __int16 v8 = (void *)v25[3];
        }
        id v9 = v8;
        _Block_object_dispose(&v24, 8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v7;
          if ([v10 isTracked])
          {
            [(AXMTARKitCameraInputSource *)self set_currentlyTrackedFaceAnchor:v10];
            [(AXMTARKitCameraInputSource *)self _project3DVertexOnto2DPlane:0.0];
            double v12 = v11;
            double v14 = v13;
            double v15 = [v10 blendShapes];
            [(AXMTARKitCameraInputSource *)self _handleFaceBlendShapes:v15];

            -[AXMTARKitCameraInputSource handleEventWithProjectedPoint:](self, "handleEventWithProjectedPoint:", -v12, -v14);
            BOOL v16 = 1;
            goto LABEL_15;
          }
        }
        else
        {
          id v10 = 0;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v19 objects:v28 count:16];
    }
    while (v4);
  }
  BOOL v16 = 0;
LABEL_15:

  return v16;
}

- (void)_notifyClientOfLostFaceWithReason:(int64_t)a3 underlyingError:(id)a4
{
  id v9 = a4;
  if ([(AXMTARKitCameraInputSource *)self _lastReportedFailure] == 0x7FFFFFFFFFFFFFFFLL
    || [(AXMTARKitCameraInputSource *)self _lastReportedFailure] != a3)
  {
    [(AXMTARKitCameraInputSource *)self set_lastReportedFailure:a3];
    if (v9)
    {
      unsigned __int8 v6 = +[NSDictionary dictionaryWithObject:v9 forKey:NSUnderlyingErrorKey];
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
    int64_t v7 = +[NSError errorWithDomain:AXSSMotionTrackingErrorDomain code:a3 userInfo:v6];
    __int16 v8 = [(AXMTARKitCameraInputSource *)self delegate];
    [v8 arKitCameraInputSource:self didFailToTrackFaceWithError:v7];
  }
}

- (CGPoint)_project3DVertexOnto2DPlane:(AXMTARKitCameraInputSource *)self
{
  float32x4_t v22 = v2;
  id v4 = [(AXMTARKitCameraInputSource *)self _currentlyTrackedFaceAnchor];
  [v4 transform];
  float32x4_t v23 = vaddq_f32(v8, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v5, v22.f32[0]), v6, *(float32x2_t *)v22.f32, 1), v7, v22, 2));

  id v9 = +[AXMTUtilities sharedInstance];
  uint64_t v10 = AXMTConvertFromDeviceToInterfaceOrientation((uint64_t)[v9 currentInterfaceOrientation]);

  double v11 = [(AXMTARKitCameraInputSource *)self _session];
  double v12 = [v11 currentFrame];
  double v13 = [v12 camera];

  [v13 imageResolution];
  objc_msgSend(v13, "projectPoint:orientation:viewportSize:", v10, *(double *)vdivq_f32(v23, (float32x4_t)vdupq_laneq_s32((int32x4_t)v23, 3)).i64, v14, v15);
  double v17 = v16;
  double v19 = v18;

  double v20 = v17;
  double v21 = v19;
  result.double y = v21;
  result.x = v20;
  return result;
}

- (void)handleEventWithProjectedPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unint64_t v6 = [(AXMTARKitCameraInputSource *)self motionTrackingMode];
  if (v6 == 2)
  {
    -[AXMTARKitCameraInputSource _convertProjectedPointToScreenCoordinates:useSensitivity:](self, "_convertProjectedPointToScreenCoordinates:useSensitivity:", 0, x, y);
    -[AXMTARKitCameraInputSource _computeAccelerationModeForPoint:](self, "_computeAccelerationModeForPoint:");
  }
  else if (v6 == 1)
  {
    -[AXMTARKitCameraInputSource _convertProjectedPointToScreenCoordinates:useSensitivity:](self, "_convertProjectedPointToScreenCoordinates:useSensitivity:", 0, x, y);
    -[AXMTARKitCameraInputSource _computeJoystickModeForPoint:](self, "_computeJoystickModeForPoint:");
  }
  else
  {
    -[AXMTARKitCameraInputSource _convertProjectedPointToScreenCoordinates:useSensitivity:](self, "_convertProjectedPointToScreenCoordinates:useSensitivity:", 1, x, y);
    -[AXMTARKitCameraInputSource _computeAbsoluteModeForPoint:](self, "_computeAbsoluteModeForPoint:");
  }
  double v9 = v7;
  double v10 = v8;
  id v11 = [(AXMTARKitCameraInputSource *)self delegate];
  objc_msgSend(v11, "arKitCameraInputSource:didReceivePoint:", self, v9, v10);
}

- (CGPoint)_computeAbsoluteModeForPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  unint64_t v6 = [(AXMTARKitCameraInputSource *)self _screenLookAtPoints];
  id v7 = [v6 count];

  if (v7 == (id)5)
  {
    double v8 = [(AXMTARKitCameraInputSource *)self _screenLookAtPoints];
    [v8 removeObjectAtIndex:0];
  }
  double v9 = [(AXMTARKitCameraInputSource *)self _screenLookAtPoints];
  *(CGFloat *)v28 = x;
  *(CGFloat *)&v28[1] = y;
  double v10 = +[NSValue valueWithBytes:v28 objCType:"{CGPoint=dd}"];
  [v9 addObject:v10];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = [(AXMTARKitCameraInputSource *)self _screenLookAtPoints];
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    double v15 = 0.0;
    double v16 = 0.0;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * i) pointValue];
        double v15 = v15 + v18;
        double v16 = v16 + v19;
      }
      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v13);
  }
  else
  {
    double v15 = 0.0;
    double v16 = 0.0;
  }

  double v20 = [(AXMTARKitCameraInputSource *)self _screenLookAtPoints];
  id v21 = [v20 count];

  double v22 = v15 / (double)(unint64_t)v21;
  double v23 = v16 / (double)(unint64_t)v21;
  result.CGFloat y = v23;
  result.CGFloat x = v22;
  return result;
}

- (CGPoint)_computeAccelerationModeForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unint64_t v6 = [(AXMTARKitCameraInputSource *)self _velocityBasedPointMapper];

  if (!v6)
  {
    id v7 = [AXMTVelocityBasedPointMapper alloc];
    double v8 = +[AXMTUtilities sharedInstance];
    [v8 screenBoundsAccountingForInterfaceOrientation];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    [(AXMTARKitCameraInputSource *)self sensitivity];
    double v18 = -[AXMTVelocityBasedPointMapper initWithBounds:sensitivity:](v7, "initWithBounds:sensitivity:", v10, v12, v14, v16, v17);
    [(AXMTARKitCameraInputSource *)self set_velocityBasedPointMapper:v18];
  }
  double v19 = [(AXMTARKitCameraInputSource *)self _velocityBasedPointMapper];
  objc_msgSend(v19, "processPoint:", x, y);
  double v21 = v20;
  double v23 = v22;

  double v24 = v21;
  double v25 = v23;
  result.double y = v25;
  result.double x = v24;
  return result;
}

- (CGPoint)_computeJoystickModeForPoint:(CGPoint)a3
{
  id v4 = +[AXMTUtilities sharedInstance];
  [v4 screenBoundsAccountingForInterfaceOrientation];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = [(AXMTARKitCameraInputSource *)self _pointerMovementMapper];

  if (!v13)
  {
    double v14 = -[AXMTRelativePointerMovementMapper initWithScreenBounds:]([AXMTRelativePointerMovementMapper alloc], "initWithScreenBounds:", v6, v8, v10, v12);
    [(AXMTARKitCameraInputSource *)self set_pointerMovementMapper:v14];

    [(AXMTARKitCameraInputSource *)self _updateAccelerationFactorForPointerMovementMapper];
    [(AXMTARKitCameraInputSource *)self _updateMovementThresholdforPointerMovementMapper];
  }
  double v15 = [(AXMTARKitCameraInputSource *)self _currentlyTrackedFaceAnchor];
  double v16 = [v15 geometry];

  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  double v17 = (void *)qword_100054DA0;
  uint64_t v69 = qword_100054DA0;
  if (!qword_100054DA0)
  {
    v64[2] = _NSConcreteStackBlock;
    v64[3] = 3221225472;
    v64[4] = sub_10000C248;
    v64[5] = &unk_100048B88;
    v65 = &v66;
    double v18 = (void *)sub_10000C024();
    v67[3] = (uint64_t)dlsym(v18, "ARNoseRidgeTip");
    qword_100054DA0 = *(void *)(v65[1] + 24);
    double v17 = (void *)v67[3];
  }
  _Block_object_dispose(&v66, 8);
  if (!v17)
  {
    v59 = (_Unwind_Exception *)sub_10002C8C4();
    _Block_object_dispose(&v66, 8);
    _Unwind_Resume(v59);
  }
  double v60 = v8;
  double v61 = v6;
  [v16 positionForLabeledFacePosition:*v17];
  -[AXMTARKitCameraInputSource _project3DVertexOnto2DPlane:](self, "_project3DVertexOnto2DPlane:");
  double v20 = v19;
  double v22 = v21;
  double x = NSZeroPoint.x;
  double y = NSZeroPoint.y;
  double v62 = v12;
  if ([v16 vertexCount])
  {
    unint64_t v25 = 0;
    double v26 = 1.79769313e308;
    double v27 = 1.79769313e308;
    do
    {
      -[AXMTARKitCameraInputSource _project3DVertexOnto2DPlane:](self, "_project3DVertexOnto2DPlane:", *((double *)[v16 vertices] + 2 * v25));
      if (v28 < v26) {
        double v26 = v28;
      }
      if (v29 < v27) {
        double v27 = v29;
      }
      if (v28 >= x) {
        double x = v28;
      }
      if (v29 >= y) {
        double y = v29;
      }
      ++v25;
    }
    while (v25 < (unint64_t)[v16 vertexCount]);
  }
  else
  {
    double v27 = 1.79769313e308;
    double v26 = 1.79769313e308;
  }
  double v30 = x - v26;
  v31 = [(AXMTARKitCameraInputSource *)self _trackingAreaPointMapper];

  if (v31)
  {
    v32 = [(AXMTARKitCameraInputSource *)self _trackingAreaPointMapper];
    objc_msgSend(v32, "setTrackingAreaBounds:", v26, v27, v30, y - v27);

    v33 = [(AXMTARKitCameraInputSource *)self _trackingAreaPointMapper];
    objc_msgSend(v33, "updateTrackedPoint:", v20, v22);

    v34 = [(AXMTARKitCameraInputSource *)self _trackingAreaPointMapper];
    [v34 normalizedTrackedPoint];
    double v36 = v35;
    double v38 = v37;

    if ([(AXMTARKitCameraInputSource *)self debugOverlayEnabled])
    {
      -[AXMTARKitCameraInputSource set_headTrackingBounds:](self, "set_headTrackingBounds:", v26, v27, v30, y - v27);
      v39 = [(AXMTARKitCameraInputSource *)self _headTrackingRect];
      objc_msgSend(v39, "setFrame:", v26, v27, v30, y - v27);
    }
    v40 = [(AXMTARKitCameraInputSource *)self _pointerMovementMapper];
    v41 = objc_msgSend(v40, "processPointInNormalizedTrackingSpace:", v36, v38);

    v42 = [(AXMTARKitCameraInputSource *)self _screenLookAtPoints];
    v43 = [v42 lastObject];
    [v43 pointValue];
    double v45 = v44;
    double v47 = v46;

    [v41 delta];
    double v49 = fmin(fmax(v10 * -0.0055844577 + 9.311967, 3.593), 7.0) * v48;
    [v41 delta];
    double v51 = AXMTConstrainPointWithinBounds(v45 - v49, v47 + fmin(fmax(v62 * 0.0108096 + -8.68544, 1.0), 2.384) * v50, v61, v60, v10);
    double v53 = v52;
    *(double *)v63 = v51;
    *(double *)&v63[1] = v52;
    v54 = +[NSValue valueWithBytes:v63 objCType:"{CGPoint=dd}"];
    v55 = +[NSMutableArray arrayWithObject:v54];
    [(AXMTARKitCameraInputSource *)self set_screenLookAtPoints:v55];
  }
  else
  {
    v56 = -[AXMTTrackingAreaPointMapper initWithTrackingAreaBounds:lockTrackingAreaPosition:]([AXMTTrackingAreaPointMapper alloc], "initWithTrackingAreaBounds:lockTrackingAreaPosition:", 0, v26, v27, v30, y - v27);
    [(AXMTARKitCameraInputSource *)self set_trackingAreaPointMapper:v56];

    double v51 = v10 * 0.5;
    double v53 = v62 * 0.5;
    *(double *)v64 = v51;
    *(double *)&v64[1] = v62 * 0.5;
    v41 = +[NSValue valueWithBytes:v64 objCType:"{CGPoint=dd}"];
    v54 = +[NSMutableArray arrayWithObject:v41];
    [(AXMTARKitCameraInputSource *)self set_screenLookAtPoints:v54];
  }

  double v57 = v51;
  double v58 = v53;
  result.double y = v58;
  result.double x = v57;
  return result;
}

- (void)_updateAccelerationFactorForPointerMovementMapper
{
  id v3 = [(AXMTARKitCameraInputSource *)self _pointerMovementMapper];

  if (v3)
  {
    [(AXMTARKitCameraInputSource *)self sensitivity];
    double v5 = (2.0 - 1.0) * v4 + 1.0;
    id v6 = [(AXMTARKitCameraInputSource *)self _pointerMovementMapper];
    [v6 setAccelerationFactor:v5];
  }
}

- (void)_updateMovementThresholdforPointerMovementMapper
{
  id v3 = [(AXMTARKitCameraInputSource *)self _pointerMovementMapper];

  if (v3)
  {
    [(AXMTARKitCameraInputSource *)self joystickModeMovementThreshold];
    double v5 = v4;
    id v6 = [(AXMTARKitCameraInputSource *)self _pointerMovementMapper];
    [v6 setNormalizedMovementThreshold:v5];
  }
}

- (CGPoint)_convertProjectedPointToScreenCoordinates:(CGPoint)a3 useSensitivity:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  double v8 = +[AXMTUtilities sharedInstance];
  [v8 screenBoundsAccountingForInterfaceOrientation];
  double v10 = v9;
  double v12 = v11;

  double v13 = +[AXMTUtilities sharedInstance];
  double v14 = (char *)[v13 currentInterfaceOrientation];

  double v15 = v10 * 1.15358884 + -199.61;
  if ((unint64_t)(v14 - 3) >= 2) {
    double v15 = v10 * 1.0676812 + -9.52;
  }
  double v16 = v15 + x * (v10 * 0.00061318 + -0.00385488);
  double v17 = v12 * 0.562768306 + 73.26 + y * (v12 * 0.00032351 + -0.01486606);
  if (v4)
  {
    [(AXMTARKitCameraInputSource *)self sensitivity];
    double v19 = v18 * 2.9995 + 1.0005;
    double v16 = v10 * 0.5 + (v16 - v10 * 0.5) / (v10 * 0.5) * v19 * (v10 * 0.5);
    double v17 = v12 * 0.5 + (v17 - v12 * 0.5) / (v12 * 0.5) * v19 * (v12 * 0.5);
  }
  double v20 = v16;
  double v21 = v17;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (void)_handleFaceBlendShapes:(id)a3
{
  id v4 = a3;
  double v5 = [(AXMTARKitCameraInputSource *)self delegate];
  if (v5)
  {
    id v6 = +[NSMutableDictionary dictionary];
    uint64_t v68 = 0;
    uint64_t v69 = &v68;
    uint64_t v70 = 0x2020000000;
    double v7 = (void *)qword_100054DA8;
    uint64_t v71 = qword_100054DA8;
    if (!qword_100054DA8)
    {
      v63 = _NSConcreteStackBlock;
      uint64_t v64 = 3221225472;
      v65 = sub_10000C298;
      uint64_t v66 = &unk_100048B88;
      v67 = &v68;
      double v8 = (void *)sub_10000C024();
      v69[3] = (uint64_t)dlsym(v8, "ARBlendShapeLocationTongueOut");
      qword_100054DA8 = *(void *)(v67[1] + 24);
      double v7 = (void *)v69[3];
    }
    _Block_object_dispose(&v68, 8);
    if (!v7) {
      goto LABEL_52;
    }
    double v9 = [v4 objectForKey:*v7];
    [v6 setObject:v9 forKeyedSubscript:AXMTBlendShapeTongueOut];

    uint64_t v68 = 0;
    uint64_t v69 = &v68;
    uint64_t v70 = 0x2020000000;
    double v10 = (void *)qword_100054DB0;
    uint64_t v71 = qword_100054DB0;
    if (!qword_100054DB0)
    {
      v63 = _NSConcreteStackBlock;
      uint64_t v64 = 3221225472;
      v65 = sub_10000C2E8;
      uint64_t v66 = &unk_100048B88;
      v67 = &v68;
      double v11 = (void *)sub_10000C024();
      v69[3] = (uint64_t)dlsym(v11, "ARBlendShapeLocationMouthSmileLeft");
      qword_100054DB0 = *(void *)(v67[1] + 24);
      double v10 = (void *)v69[3];
    }
    _Block_object_dispose(&v68, 8);
    if (!v10) {
      goto LABEL_52;
    }
    double v12 = [v4 objectForKey:*v10];
    [v6 setObject:v12 forKeyedSubscript:AXMTBlendShapeMouthSmileLeft];

    uint64_t v68 = 0;
    uint64_t v69 = &v68;
    uint64_t v70 = 0x2020000000;
    double v13 = (void *)qword_100054DB8;
    uint64_t v71 = qword_100054DB8;
    if (!qword_100054DB8)
    {
      v63 = _NSConcreteStackBlock;
      uint64_t v64 = 3221225472;
      v65 = sub_10000C338;
      uint64_t v66 = &unk_100048B88;
      v67 = &v68;
      double v14 = (void *)sub_10000C024();
      v69[3] = (uint64_t)dlsym(v14, "ARBlendShapeLocationMouthSmileRight");
      qword_100054DB8 = *(void *)(v67[1] + 24);
      double v13 = (void *)v69[3];
    }
    _Block_object_dispose(&v68, 8);
    if (!v13) {
      goto LABEL_52;
    }
    double v15 = [v4 objectForKey:*v13];
    [v6 setObject:v15 forKeyedSubscript:AXMTBlendShapeMouthSmileRight];

    uint64_t v68 = 0;
    uint64_t v69 = &v68;
    uint64_t v70 = 0x2020000000;
    double v16 = (void *)qword_100054DC0;
    uint64_t v71 = qword_100054DC0;
    if (!qword_100054DC0)
    {
      v63 = _NSConcreteStackBlock;
      uint64_t v64 = 3221225472;
      v65 = sub_10000C388;
      uint64_t v66 = &unk_100048B88;
      v67 = &v68;
      double v17 = (void *)sub_10000C024();
      v69[3] = (uint64_t)dlsym(v17, "ARBlendShapeLocationJawOpen");
      qword_100054DC0 = *(void *)(v67[1] + 24);
      double v16 = (void *)v69[3];
    }
    _Block_object_dispose(&v68, 8);
    if (!v16) {
      goto LABEL_52;
    }
    double v18 = [v4 objectForKey:*v16];
    [v6 setObject:v18 forKeyedSubscript:AXMTBlendShapeJawOpen];

    uint64_t v68 = 0;
    uint64_t v69 = &v68;
    uint64_t v70 = 0x2020000000;
    double v19 = (void *)qword_100054DC8;
    uint64_t v71 = qword_100054DC8;
    if (!qword_100054DC8)
    {
      v63 = _NSConcreteStackBlock;
      uint64_t v64 = 3221225472;
      v65 = sub_10000C3D8;
      uint64_t v66 = &unk_100048B88;
      v67 = &v68;
      double v20 = (void *)sub_10000C024();
      v69[3] = (uint64_t)dlsym(v20, "ARBlendShapeLocationMouthClose");
      qword_100054DC8 = *(void *)(v67[1] + 24);
      double v19 = (void *)v69[3];
    }
    _Block_object_dispose(&v68, 8);
    if (!v19) {
      goto LABEL_52;
    }
    double v21 = [v4 objectForKey:*v19];
    [v6 setObject:v21 forKeyedSubscript:AXMTBlendShapeMouthClose];

    uint64_t v68 = 0;
    uint64_t v69 = &v68;
    uint64_t v70 = 0x2020000000;
    double v22 = (void *)qword_100054DD0;
    uint64_t v71 = qword_100054DD0;
    if (!qword_100054DD0)
    {
      v63 = _NSConcreteStackBlock;
      uint64_t v64 = 3221225472;
      v65 = sub_10000C428;
      uint64_t v66 = &unk_100048B88;
      v67 = &v68;
      double v23 = (void *)sub_10000C024();
      v69[3] = (uint64_t)dlsym(v23, "ARBlendShapeLocationBrowOuterUpLeft");
      qword_100054DD0 = *(void *)(v67[1] + 24);
      double v22 = (void *)v69[3];
    }
    _Block_object_dispose(&v68, 8);
    if (!v22) {
      goto LABEL_52;
    }
    double v24 = [v4 objectForKey:*v22];
    [v6 setObject:v24 forKeyedSubscript:AXMTBlendShapeBrowOuterUpLeft];

    uint64_t v68 = 0;
    uint64_t v69 = &v68;
    uint64_t v70 = 0x2020000000;
    unint64_t v25 = (void *)qword_100054DD8;
    uint64_t v71 = qword_100054DD8;
    if (!qword_100054DD8)
    {
      v63 = _NSConcreteStackBlock;
      uint64_t v64 = 3221225472;
      v65 = sub_10000C478;
      uint64_t v66 = &unk_100048B88;
      v67 = &v68;
      double v26 = (void *)sub_10000C024();
      v69[3] = (uint64_t)dlsym(v26, "ARBlendShapeLocationBrowOuterUpRight");
      qword_100054DD8 = *(void *)(v67[1] + 24);
      unint64_t v25 = (void *)v69[3];
    }
    _Block_object_dispose(&v68, 8);
    if (!v25) {
      goto LABEL_52;
    }
    double v27 = [v4 objectForKey:*v25];
    [v6 setObject:v27 forKeyedSubscript:AXMTBlendShapeBrowOuterUpRight];

    uint64_t v68 = 0;
    uint64_t v69 = &v68;
    uint64_t v70 = 0x2020000000;
    double v28 = (void *)qword_100054DE0;
    uint64_t v71 = qword_100054DE0;
    if (!qword_100054DE0)
    {
      v63 = _NSConcreteStackBlock;
      uint64_t v64 = 3221225472;
      v65 = sub_10000C4C8;
      uint64_t v66 = &unk_100048B88;
      v67 = &v68;
      double v29 = (void *)sub_10000C024();
      v69[3] = (uint64_t)dlsym(v29, "ARBlendShapeLocationMouthPucker");
      qword_100054DE0 = *(void *)(v67[1] + 24);
      double v28 = (void *)v69[3];
    }
    _Block_object_dispose(&v68, 8);
    if (!v28) {
      goto LABEL_52;
    }
    double v30 = [v4 objectForKey:*v28];
    [v6 setObject:v30 forKeyedSubscript:AXMTBlendShapeMouthPucker];

    uint64_t v68 = 0;
    uint64_t v69 = &v68;
    uint64_t v70 = 0x2020000000;
    v31 = (void *)qword_100054DE8;
    uint64_t v71 = qword_100054DE8;
    if (!qword_100054DE8)
    {
      v63 = _NSConcreteStackBlock;
      uint64_t v64 = 3221225472;
      v65 = sub_10000C518;
      uint64_t v66 = &unk_100048B88;
      v67 = &v68;
      v32 = (void *)sub_10000C024();
      v69[3] = (uint64_t)dlsym(v32, "ARBlendShapeLocationEyeBlinkLeft");
      qword_100054DE8 = *(void *)(v67[1] + 24);
      v31 = (void *)v69[3];
    }
    _Block_object_dispose(&v68, 8);
    if (!v31) {
      goto LABEL_52;
    }
    v33 = [v4 objectForKey:*v31];
    [v6 setObject:v33 forKeyedSubscript:AXMTBlendShapeEyeBlinkLeft];

    uint64_t v68 = 0;
    uint64_t v69 = &v68;
    uint64_t v70 = 0x2020000000;
    v34 = (void *)qword_100054DF0;
    uint64_t v71 = qword_100054DF0;
    if (!qword_100054DF0)
    {
      v63 = _NSConcreteStackBlock;
      uint64_t v64 = 3221225472;
      v65 = sub_10000C568;
      uint64_t v66 = &unk_100048B88;
      v67 = &v68;
      double v35 = (void *)sub_10000C024();
      v69[3] = (uint64_t)dlsym(v35, "ARBlendShapeLocationEyeBlinkRight");
      qword_100054DF0 = *(void *)(v67[1] + 24);
      v34 = (void *)v69[3];
    }
    _Block_object_dispose(&v68, 8);
    if (!v34)
    {
LABEL_52:
      sub_10002C8C4();
      __break(1u);
    }
    double v36 = [v4 objectForKey:*v34];
    [v6 setObject:v36 forKeyedSubscript:AXMTBlendShapeEyeBlinkRight];

    double v37 = [(AXMTARKitCameraInputSource *)self _previousExpressions];
    uint64_t v38 = [(AXMTARKitCameraInputSource *)self expressionConfiguration];
    id v61 = 0;
    id v62 = 0;
    v39 = +[AXSSMotionTrackingExpressionConfiguration processIncomingExpressions:v6 previousExpressions:v37 expressionConfiguration:v38 startExpressionsOutSet:&v62 endExpressionsOutSet:&v61];
    id v52 = v62;
    id v50 = v61;

    LOBYTE(v38) = objc_opt_respondsToSelector();
    char v40 = objc_opt_respondsToSelector();
    if (v38)
    {
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v41 = v52;
      id v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v57, v73, 16, v50);
      if (v42)
      {
        uint64_t v43 = *(void *)v58;
        do
        {
          for (i = 0; i != v42; i = (char *)i + 1)
          {
            if (*(void *)v58 != v43) {
              objc_enumerationMutation(v41);
            }
            objc_msgSend(v5, "arKitCameraInputSource:didReceiveExpressionStart:", self, objc_msgSend(*(id *)(*((void *)&v57 + 1) + 8 * i), "unsignedIntegerValue"));
          }
          id v42 = [v41 countByEnumeratingWithState:&v57 objects:v73 count:16];
        }
        while (v42);
      }
    }
    if (v40)
    {
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v45 = v50;
      id v46 = [v45 countByEnumeratingWithState:&v53 objects:v72 count:16];
      if (v46)
      {
        uint64_t v47 = *(void *)v54;
        do
        {
          for (j = 0; j != v46; j = (char *)j + 1)
          {
            if (*(void *)v54 != v47) {
              objc_enumerationMutation(v45);
            }
            objc_msgSend(v5, "arKitCameraInputSource:didReceiveExpressionEnd:", self, objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * (void)j), "unsignedIntegerValue", v50));
          }
          id v46 = [v45 countByEnumeratingWithState:&v53 objects:v72 count:16];
        }
        while (v46);
      }
    }
    id v49 = objc_msgSend(v39, "copy", v50);
    [(AXMTARKitCameraInputSource *)self set_previousExpressions:v49];
  }
}

- (AXMTARKitCameraInputSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXMTARKitCameraInputSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)motionTrackingMode
{
  return self->_motionTrackingMode;
}

- (double)sensitivity
{
  return self->_sensitivity;
}

- (double)joystickModeMovementThreshold
{
  return self->_joystickModeMovementThreshold;
}

- (BOOL)debugOverlayEnabled
{
  return self->_debugOverlayEnabled;
}

- (AXSSMotionTrackingExpressionConfiguration)expressionConfiguration
{
  return self->_expressionConfiguration;
}

- (void)setExpressionConfiguration:(id)a3
{
}

- (ARSession)_session
{
  return self->__session;
}

- (void)set_session:(id)a3
{
}

- (ARFaceAnchor)_currentlyTrackedFaceAnchor
{
  return self->__currentlyTrackedFaceAnchor;
}

- (void)set_currentlyTrackedFaceAnchor:(id)a3
{
}

- (void)set_screenLookAtPoints:(id)a3
{
}

- (NSSet)_previousExpressions
{
  return self->__previousExpressions;
}

- (void)set_previousExpressions:(id)a3
{
}

- (BOOL)_interrupted
{
  return self->__interrupted;
}

- (void)set_interrupted:(BOOL)a3
{
  self->__interrupted = a3;
}

- (int64_t)_lastReportedFailure
{
  return self->__lastReportedFailure;
}

- (void)set_lastReportedFailure:(int64_t)a3
{
  self->__lastReportedFailure = a3;
}

- (int64_t)_avCaptureSessionInterruptionReason
{
  return self->__avCaptureSessionInterruptionReason;
}

- (void)set_avCaptureSessionInterruptionReason:(int64_t)a3
{
  self->__avCaptureSessionInterruptionReason = a3;
}

- (AXMTVelocityBasedPointMapper)_velocityBasedPointMapper
{
  return self->__velocityBasedPointMapper;
}

- (void)set_velocityBasedPointMapper:(id)a3
{
}

- (AXMTTrackingAreaPointMapper)_trackingAreaPointMapper
{
  return self->__trackingAreaPointMapper;
}

- (void)set_trackingAreaPointMapper:(id)a3
{
}

- (AXMTRelativePointerMovementMapper)_pointerMovementMapper
{
  return self->__pointerMovementMapper;
}

- (void)set_pointerMovementMapper:(id)a3
{
}

- (CGRect)_headTrackingBounds
{
  double x = self->__headTrackingBounds.origin.x;
  double y = self->__headTrackingBounds.origin.y;
  double width = self->__headTrackingBounds.size.width;
  double height = self->__headTrackingBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)set_headTrackingBounds:(CGRect)a3
{
  self->__headTrackingBounds = a3;
}

- (UIView)_headTrackingRect
{
  return self->__headTrackingRect;
}

- (void)set_headTrackingRect:(id)a3
{
}

- (UIView)_rootView
{
  return self->__rootView;
}

- (void)set_rootView:(id)a3
{
}

- (AVCaptureVideoPreviewLayer)_previewLayer
{
  return self->__previewLayer;
}

- (void)set_previewLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__previewLayer, 0);
  objc_storeStrong((id *)&self->__rootView, 0);
  objc_storeStrong((id *)&self->__headTrackingRect, 0);
  objc_storeStrong((id *)&self->__pointerMovementMapper, 0);
  objc_storeStrong((id *)&self->__trackingAreaPointMapper, 0);
  objc_storeStrong((id *)&self->__velocityBasedPointMapper, 0);
  objc_storeStrong((id *)&self->__previousExpressions, 0);
  objc_storeStrong((id *)&self->__screenLookAtPoints, 0);
  objc_storeStrong((id *)&self->__currentlyTrackedFaceAnchor, 0);
  objc_storeStrong((id *)&self->__session, 0);
  objc_storeStrong((id *)&self->_expressionConfiguration, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end