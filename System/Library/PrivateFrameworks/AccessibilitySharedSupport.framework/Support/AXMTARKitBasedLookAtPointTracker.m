@interface AXMTARKitBasedLookAtPointTracker
- (AXMTARKitBasedLookAtPointTracker)initWithInput:(id)a3 trackingType:(unint64_t)a4;
- (AXMTARKitCameraInputSource)_arkitCameraInputSource;
- (AXMTLookAtPointTrackerDelegate)delegate;
- (AXSSMotionTrackingExpressionConfiguration)expressionConfiguration;
- (AXSSMotionTrackingInput)input;
- (BOOL)_isStarted;
- (BOOL)debugOverlayEnabled;
- (UIView)debugOverlayRootView;
- (_AXMTARKitInvisibleWindow)_arkitCameraInputSourceWindow;
- (double)joystickModeMovementThreshold;
- (double)sensitivity;
- (unint64_t)motionTrackingMode;
- (unint64_t)trackingType;
- (void)_updateWindowForDebugOverlay;
- (void)arKitCameraInputSource:(id)a3 didFailToTrackFaceWithError:(id)a4;
- (void)arKitCameraInputSource:(id)a3 didReceiveExpressionEnd:(unint64_t)a4;
- (void)arKitCameraInputSource:(id)a3 didReceiveExpressionStart:(unint64_t)a4;
- (void)arKitCameraInputSource:(id)a3 didReceivePoint:(CGPoint)a4;
- (void)arKitCameraInputSourceInterruptionEnded:(id)a3;
- (void)arKitCameraInputSourceWasInterrupted:(id)a3;
- (void)setDebugOverlayEnabled:(BOOL)a3;
- (void)setDebugOverlayRootView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpressionConfiguration:(id)a3;
- (void)setInput:(id)a3;
- (void)setJoystickModeMovementThreshold:(double)a3;
- (void)setMotionTrackingMode:(unint64_t)a3;
- (void)setSensitivity:(double)a3;
- (void)setTrackingType:(unint64_t)a3;
- (void)set_arkitCameraInputSource:(id)a3;
- (void)set_arkitCameraInputSourceWindow:(id)a3;
- (void)startTracking;
- (void)stopTracking;
@end

@implementation AXMTARKitBasedLookAtPointTracker

- (AXMTARKitBasedLookAtPointTracker)initWithInput:(id)a3 trackingType:(unint64_t)a4
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXMTARKitBasedLookAtPointTracker;
  v6 = [(AXMTARKitBasedLookAtPointTracker *)&v12 init];
  if (v6)
  {
    v7 = (AXSSMotionTrackingInput *)[v5 copy];
    input = v6->_input;
    v6->_input = v7;

    v6->_motionTrackingMode = AXSSMotionTrackingDefaultMode;
    *(void *)&v6->_sensitivity = AXSSMotionTrackingDefaultSensitivity;
    *(void *)&v6->_joystickModeMovementThreshold = AXSSMotionTrackingDefaultJoystickModeMovementThreshold;
    uint64_t v9 = +[AXSSMotionTrackingExpressionConfiguration defaultExpressionConfiguration];
    expressionConfiguration = v6->_expressionConfiguration;
    v6->_expressionConfiguration = (AXSSMotionTrackingExpressionConfiguration *)v9;
  }
  return v6;
}

- (void)setDebugOverlayEnabled:(BOOL)a3
{
  if (self->_debugOverlayEnabled != a3)
  {
    BOOL v3 = a3;
    id v5 = AXSSLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      CFStringRef v6 = @"false";
      if (v3) {
        CFStringRef v6 = @"true";
      }
      int v8 = 138412290;
      CFStringRef v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AXMTARKitBasedLookAtPointTracker: setDebugOverlayEnabled: %@", (uint8_t *)&v8, 0xCu);
    }

    self->_debugOverlayEnabled = v3;
    v7 = [(AXMTARKitBasedLookAtPointTracker *)self _arkitCameraInputSource];
    [v7 setDebugOverlayEnabled:v3];

    [(AXMTARKitBasedLookAtPointTracker *)self _updateWindowForDebugOverlay];
  }
}

- (void)startTracking
{
  if (![(AXMTARKitBasedLookAtPointTracker *)self _isStarted])
  {
    BOOL v3 = AXSSLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AXMTARKitBasedLookAtPointTracker: startTracking: called", buf, 2u);
    }

    v4 = +[AXMTUtilities sharedInstance];
    [v4 screenBoundsAccountingForInterfaceOrientation];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    if ([(AXMTARKitBasedLookAtPointTracker *)self debugOverlayEnabled])
    {
      v13 = -[_AXMTARKitInvisibleWindow initWithFrame:]([_AXMTARKitInvisibleWindow alloc], "initWithFrame:", v6, v8, v10, v12);
      [(AXMTARKitBasedLookAtPointTracker *)self set_arkitCameraInputSourceWindow:v13];
    }
    v14 = [AXMTARKitCameraInputSource alloc];
    v15 = [(AXMTARKitBasedLookAtPointTracker *)self _arkitCameraInputSourceWindow];
    id v16 = [(AXMTARKitCameraInputSource *)v14 initInsideView:v15];
    [(AXMTARKitBasedLookAtPointTracker *)self set_arkitCameraInputSource:v16];

    v17 = [(AXMTARKitBasedLookAtPointTracker *)self _arkitCameraInputSource];
    [v17 setDelegate:self];

    [(AXMTARKitBasedLookAtPointTracker *)self sensitivity];
    double v19 = v18;
    v20 = [(AXMTARKitBasedLookAtPointTracker *)self _arkitCameraInputSource];
    [v20 setSensitivity:v19];

    unint64_t v21 = [(AXMTARKitBasedLookAtPointTracker *)self motionTrackingMode];
    v22 = [(AXMTARKitBasedLookAtPointTracker *)self _arkitCameraInputSource];
    [v22 setMotionTrackingMode:v21];

    [(AXMTARKitBasedLookAtPointTracker *)self joystickModeMovementThreshold];
    double v24 = v23;
    v25 = [(AXMTARKitBasedLookAtPointTracker *)self _arkitCameraInputSource];
    [v25 setJoystickModeMovementThreshold:v24];

    BOOL v26 = [(AXMTARKitBasedLookAtPointTracker *)self debugOverlayEnabled];
    v27 = [(AXMTARKitBasedLookAtPointTracker *)self _arkitCameraInputSource];
    [v27 setDebugOverlayEnabled:v26];

    v28 = [(AXMTARKitBasedLookAtPointTracker *)self expressionConfiguration];
    v29 = [(AXMTARKitBasedLookAtPointTracker *)self _arkitCameraInputSource];
    [v29 setExpressionConfiguration:v28];

    [(AXMTARKitBasedLookAtPointTracker *)self _updateWindowForDebugOverlay];
    v30 = [(AXMTARKitBasedLookAtPointTracker *)self _arkitCameraInputSource];
    [v30 startRunning];

    v31 = AXSSLogForCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "AXMTARKitBasedLookAtPointTracker: startTracking: started running ARKitCameraInputSource", v32, 2u);
    }
  }
}

- (void)stopTracking
{
  if ([(AXMTARKitBasedLookAtPointTracker *)self _isStarted])
  {
    BOOL v3 = AXSSLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AXMTARKitBasedLookAtPointTracker: stopTracking", v7, 2u);
    }

    v4 = [(AXMTARKitBasedLookAtPointTracker *)self _arkitCameraInputSourceWindow];
    [v4 setHidden:1];

    [(AXMTARKitBasedLookAtPointTracker *)self set_arkitCameraInputSourceWindow:0];
    double v5 = [(AXMTARKitBasedLookAtPointTracker *)self _arkitCameraInputSource];
    [v5 stopRunning];

    double v6 = [(AXMTARKitBasedLookAtPointTracker *)self _arkitCameraInputSource];
    [v6 setDelegate:0];

    [(AXMTARKitBasedLookAtPointTracker *)self set_arkitCameraInputSource:0];
  }
}

- (void)setMotionTrackingMode:(unint64_t)a3
{
  if (self->_motionTrackingMode != a3)
  {
    self->_motionTrackingMode = a3;
    id v4 = [(AXMTARKitBasedLookAtPointTracker *)self _arkitCameraInputSource];
    [v4 setMotionTrackingMode:a3];
  }
}

- (void)setSensitivity:(double)a3
{
  if (vabdd_f64(self->_sensitivity, a3) > 2.22044605e-16)
  {
    self->_sensitivity = a3;
    id v4 = [(AXMTARKitBasedLookAtPointTracker *)self _arkitCameraInputSource];
    [v4 setSensitivity:a3];
  }
}

- (void)setJoystickModeMovementThreshold:(double)a3
{
  if (vabdd_f64(self->_joystickModeMovementThreshold, a3) > 2.22044605e-16)
  {
    self->_joystickModeMovementThreshold = a3;
    id v4 = [(AXMTARKitBasedLookAtPointTracker *)self _arkitCameraInputSource];
    [v4 setJoystickModeMovementThreshold:a3];
  }
}

- (void)setExpressionConfiguration:(id)a3
{
  id v6 = a3;
  if ((-[AXSSMotionTrackingExpressionConfiguration isEqualToMotionTrackingExpressionConfiguration:](self->_expressionConfiguration, "isEqualToMotionTrackingExpressionConfiguration:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_expressionConfiguration, a3);
    double v5 = [(AXMTARKitBasedLookAtPointTracker *)self _arkitCameraInputSource];
    [v5 setExpressionConfiguration:v6];
  }
}

- (void)arKitCameraInputSource:(id)a3 didReceivePoint:(CGPoint)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D728;
  block[3] = &unk_1000489C8;
  CGPoint v5 = a4;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)arKitCameraInputSource:(id)a3 didReceiveExpressionStart:(unint64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D8C8;
  v4[3] = &unk_1000489A0;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)arKitCameraInputSource:(id)a3 didReceiveExpressionEnd:(unint64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000DA1C;
  v4[3] = &unk_1000489A0;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)arKitCameraInputSourceWasInterrupted:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DB70;
  block[3] = &unk_1000488D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)arKitCameraInputSourceInterruptionEnded:(id)a3
{
}

- (void)arKitCameraInputSource:(id)a3 didFailToTrackFaceWithError:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000DCCC;
  v6[3] = &unk_100048928;
  id v7 = a4;
  double v8 = self;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (BOOL)_isStarted
{
  v2 = [(AXMTARKitBasedLookAtPointTracker *)self _arkitCameraInputSource];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_updateWindowForDebugOverlay
{
  unsigned int v3 = [(AXMTARKitBasedLookAtPointTracker *)self debugOverlayEnabled];
  id v4 = [(AXMTARKitBasedLookAtPointTracker *)self _arkitCameraInputSourceWindow];
  id v5 = v4;
  if (v3) {
    [v4 makeKeyAndVisible];
  }
  else {
    [v4 setHidden:1];
  }
}

- (unint64_t)motionTrackingMode
{
  return self->_motionTrackingMode;
}

- (double)sensitivity
{
  return self->_sensitivity;
}

- (AXSSMotionTrackingInput)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
}

- (unint64_t)trackingType
{
  return self->_trackingType;
}

- (void)setTrackingType:(unint64_t)a3
{
  self->_trackingType = a3;
}

- (double)joystickModeMovementThreshold
{
  return self->_joystickModeMovementThreshold;
}

- (AXMTLookAtPointTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXMTLookAtPointTrackerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)debugOverlayEnabled
{
  return self->_debugOverlayEnabled;
}

- (AXSSMotionTrackingExpressionConfiguration)expressionConfiguration
{
  return self->_expressionConfiguration;
}

- (UIView)debugOverlayRootView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_debugOverlayRootView);

  return (UIView *)WeakRetained;
}

- (void)setDebugOverlayRootView:(id)a3
{
}

- (AXMTARKitCameraInputSource)_arkitCameraInputSource
{
  return self->__arkitCameraInputSource;
}

- (void)set_arkitCameraInputSource:(id)a3
{
}

- (_AXMTARKitInvisibleWindow)_arkitCameraInputSourceWindow
{
  return self->__arkitCameraInputSourceWindow;
}

- (void)set_arkitCameraInputSourceWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__arkitCameraInputSourceWindow, 0);
  objc_storeStrong((id *)&self->__arkitCameraInputSource, 0);
  objc_destroyWeak((id *)&self->_debugOverlayRootView);
  objc_storeStrong((id *)&self->_expressionConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_input, 0);
}

@end