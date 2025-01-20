@interface AXMTHIDBasedLookAtPointTracker
- (AXMTHIDBasedLookAtPointTracker)initWithInput:(id)a3 trackingType:(unint64_t)a4;
- (AXMTLookAtPointTrackerDelegate)delegate;
- (AXSSMotionTrackingExpressionConfiguration)expressionConfiguration;
- (AXSSMotionTrackingInput)input;
- (BOOL)_XPositionElementUpdated;
- (BOOL)_YPositionElementUpdated;
- (BOOL)_isStarted;
- (BOOL)debugOverlayEnabled;
- (CGPoint)_lastValidPoint;
- (HIDManager)_hidManager;
- (NSNumber)_currentFrequency;
- (NSTimer)_initializationTimer;
- (NSTimer)_powerAssertionTimer;
- (OS_dispatch_queue)_hidManagerDispatchQueue;
- (UIView)debugOverlayRootView;
- (double)joystickModeMovementThreshold;
- (double)sensitivity;
- (unint64_t)_currentStatus;
- (unint64_t)_lastTimePointReceived;
- (unint64_t)motionTrackingMode;
- (unint64_t)trackingType;
- (unsigned)_powerAssertionID;
- (void)_cleanUpPowerAssertionAndTimer;
- (void)_cleanUpPowerAssertionIfNecessary;
- (void)_deviceNotification:(id)a3 added:(BOOL)a4;
- (void)_didReceivePointOnBackgroundThread:(CGPoint)a3;
- (void)_elementUpdated:(id)a3 forDevice:(id)a4;
- (void)_failedToTrackFaceWithErrorOnBackgroundThread:(id)a3;
- (void)_initializationTimerFired:(id)a3;
- (void)_inputSourceWasInterruptedOnMainThread;
- (void)_positionalHIDElementUpdated:(id)a3 forDevice:(id)a4;
- (void)_powerAssertionTimerFired;
- (void)_setCurrentFrequency:(id)a3;
- (void)_setCurrentStatus:(unint64_t)a3;
- (void)_setUpPowerAssertionIfNecessary;
- (void)_statusHIDElementUpdated:(id)a3 forDevice:(id)a4;
- (void)_updateFrequencyUsingDevice:(id)a3;
- (void)dealloc;
- (void)setDebugOverlayEnabled:(BOOL)a3;
- (void)setDebugOverlayRootView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpressionConfiguration:(id)a3;
- (void)setInput:(id)a3;
- (void)setJoystickModeMovementThreshold:(double)a3;
- (void)setMotionTrackingMode:(unint64_t)a3;
- (void)setSensitivity:(double)a3;
- (void)setTrackingType:(unint64_t)a3;
- (void)set_XPositionElementUpdated:(BOOL)a3;
- (void)set_YPositionElementUpdated:(BOOL)a3;
- (void)set_hidManager:(id)a3;
- (void)set_hidManagerDispatchQueue:(id)a3;
- (void)set_initializationTimer:(id)a3;
- (void)set_isStarted:(BOOL)a3;
- (void)set_lastTimePointReceived:(unint64_t)a3;
- (void)set_lastValidPoint:(CGPoint)a3;
- (void)set_powerAssertionID:(unsigned int)a3;
- (void)set_powerAssertionTimer:(id)a3;
- (void)startTracking;
- (void)stopTracking;
@end

@implementation AXMTHIDBasedLookAtPointTracker

- (AXMTHIDBasedLookAtPointTracker)initWithInput:(id)a3 trackingType:(unint64_t)a4
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = AXSSLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10001DC34((uint64_t)v5, v12);
    }
    goto LABEL_10;
  }
  if (([v5 mfiAuthenticated] & 1) == 0)
  {
    v12 = AXSSLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10001DBBC((uint64_t)v5, v12);
    }
LABEL_10:

    v11 = 0;
    goto LABEL_11;
  }
  v14.receiver = self;
  v14.super_class = (Class)AXMTHIDBasedLookAtPointTracker;
  v6 = [(AXMTHIDBasedLookAtPointTracker *)&v14 init];
  if (v6)
  {
    v7 = (AXSSMotionTrackingInput *)[v5 copy];
    input = v6->_input;
    v6->_input = v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.HIDBasedLookAtPointTracker.hidManagerDispatchQueue", 0);
    hidManagerDispatchQueue = v6->__hidManagerDispatchQueue;
    v6->__hidManagerDispatchQueue = (OS_dispatch_queue *)v9;

    v6->__powerAssertionID = 0;
  }
  self = v6;
  v11 = self;
LABEL_11:

  return v11;
}

- (void)dealloc
{
  v3 = +[AXMTUtilities sharedInstance];
  [v3 unregisterListener:self];

  [(HIDManager *)self->__hidManager cancel];
  [(HIDManager *)self->__hidManager close];
  [(AXMTHIDBasedLookAtPointTracker *)self _cleanUpPowerAssertionAndTimer];
  v4.receiver = self;
  v4.super_class = (Class)AXMTHIDBasedLookAtPointTracker;
  [(AXMTHIDBasedLookAtPointTracker *)&v4 dealloc];
}

- (void)startTracking
{
  if (![(AXMTHIDBasedLookAtPointTracker *)self _isStarted])
  {
    v3 = AXSSLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AXMTHIDBasedLookAtPointTracker: startTracking: called", (uint8_t *)&buf, 2u);
    }

    objc_super v4 = +[AXMTUtilities sharedInstance];
    [v4 registerListener:self needsPhysicalOrientationEvents:1];

    id v5 = [objc_alloc((Class)HIDManager) initWithOptions:0];
    [(AXMTHIDBasedLookAtPointTracker *)self set_hidManager:v5];

    v6 = [(AXMTHIDBasedLookAtPointTracker *)self input];
    v7 = [v6 hidMatchingDictionary];
    v8 = +[NSMutableDictionary dictionaryWithDictionary:v7];

    dispatch_queue_t v9 = [(AXMTHIDBasedLookAtPointTracker *)self _hidManager];
    [v9 setDeviceMatching:v8];

    v10 = [(AXMTHIDBasedLookAtPointTracker *)self _hidManager];
    v11 = +[AXSSMotionTrackingUtilities axss_xPositionElementMatchingDict];
    v30[0] = v11;
    v12 = +[AXSSMotionTrackingUtilities axss_yPositionElementMatchingDict];
    v30[1] = v12;
    v13 = +[AXSSMotionTrackingUtilities axss_statusElementMatchingDict];
    v30[2] = v13;
    objc_super v14 = +[AXSSMotionTrackingUtilities axss_frequencyElementMatchingDict];
    v30[3] = v14;
    v15 = +[NSArray arrayWithObjects:v30 count:4];
    [v10 setInputElementMatching:v15];

    v16 = [(AXMTHIDBasedLookAtPointTracker *)self _hidManager];
    v17 = [(AXMTHIDBasedLookAtPointTracker *)self _hidManagerDispatchQueue];
    [v16 setDispatchQueue:v17];

    objc_initWeak(&buf, self);
    v18 = [(AXMTHIDBasedLookAtPointTracker *)self _hidManager];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10001C52C;
    v27[3] = &unk_100048F10;
    objc_copyWeak(&v28, &buf);
    [v18 setDeviceNotificationHandler:v27];

    v19 = [(AXMTHIDBasedLookAtPointTracker *)self _hidManager];
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    v24 = sub_10001C598;
    v25 = &unk_100048F38;
    objc_copyWeak(&v26, &buf);
    [v19 setInputElementHandler:&v22];

    v20 = [(AXMTHIDBasedLookAtPointTracker *)self _hidManager];
    [v20 open];

    v21 = [(AXMTHIDBasedLookAtPointTracker *)self _hidManager];
    [v21 activate];

    [(AXMTHIDBasedLookAtPointTracker *)self set_isStarted:1];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&buf);
  }
}

- (void)stopTracking
{
  if ([(AXMTHIDBasedLookAtPointTracker *)self _isStarted])
  {
    v3 = AXSSLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AXMTHIDBasedLookAtPointTracker: stopTracking", v7, 2u);
    }

    objc_super v4 = +[AXMTUtilities sharedInstance];
    [v4 unregisterListener:self];

    id v5 = [(AXMTHIDBasedLookAtPointTracker *)self _hidManager];
    [v5 cancel];

    v6 = [(AXMTHIDBasedLookAtPointTracker *)self _hidManager];
    [v6 close];

    [(AXMTHIDBasedLookAtPointTracker *)self set_hidManager:0];
    [(AXMTHIDBasedLookAtPointTracker *)self set_isStarted:0];
    [(AXMTHIDBasedLookAtPointTracker *)self _cleanUpPowerAssertionAndTimer];
  }
}

- (void)_setCurrentStatus:(unint64_t)a3
{
  if (self->__currentStatus != a3) {
    self->__currentStatus = a3;
  }
}

- (unint64_t)_currentStatus
{
  return self->__currentStatus;
}

- (void)_setCurrentFrequency:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  currentFrequency = self->__currentFrequency;
  id v10 = v4;
  if (!v4)
  {
    if (!currentFrequency) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (!currentFrequency || (v7 = objc_msgSend(v4, "isEqualToNumber:"), id v5 = v10, (v7 & 1) == 0))
  {
LABEL_6:
    v8 = (NSNumber *)[v5 copy];
    dispatch_queue_t v9 = self->__currentFrequency;
    self->__currentFrequency = v8;
  }
LABEL_7:

  _objc_release_x1();
}

- (NSNumber)_currentFrequency
{
  return self->__currentFrequency;
}

- (void)_elementUpdated:(id)a3 forDevice:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  unsigned __int8 v7 = (char *)[v8 usage];
  if ((unint64_t)(v7 - 33) >= 2)
  {
    if (v7 == (char *)769) {
      [(AXMTHIDBasedLookAtPointTracker *)self _statusHIDElementUpdated:v8 forDevice:v6];
    }
  }
  else
  {
    [(AXMTHIDBasedLookAtPointTracker *)self _positionalHIDElementUpdated:v8 forDevice:v6];
  }
  [(AXMTHIDBasedLookAtPointTracker *)self _updateFrequencyUsingDevice:v6];
}

- (void)_updateFrequencyUsingDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[AXSSMotionTrackingUtilities axss_frequencyElementMatchingDict];
  id v6 = [v4 elementsMatching:v5];

  unsigned __int8 v7 = [v6 firstObject];

  if (v7)
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    id v10 = 0;
    id v10 = [v7 integerValue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001C95C;
    v8[3] = &unk_100048B38;
    v8[4] = self;
    v8[5] = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
    _Block_object_dispose(v9, 8);
  }
}

- (void)_statusHIDElementUpdated:(id)a3 forDevice:(id)a4
{
  id v5 = a4;
  id v6 = +[AXSSMotionTrackingUtilities axss_statusElementMatchingDict];
  unsigned __int8 v7 = [v5 elementsMatching:v6];

  id v8 = [v7 firstObject];

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  id v11 = 0;
  id v11 = [v8 integerValue];
  if (v8)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001CADC;
    void v9[3] = &unk_100048F60;
    v9[4] = self;
    v9[5] = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  }
  _Block_object_dispose(v10, 8);
}

- (void)_positionalHIDElementUpdated:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 usage];
  if (v8 == (id)34)
  {
    [(AXMTHIDBasedLookAtPointTracker *)self set_YPositionElementUpdated:1];
  }
  else if (v8 == (id)33)
  {
    [(AXMTHIDBasedLookAtPointTracker *)self set_XPositionElementUpdated:1];
  }
  dispatch_queue_t v9 = +[AXSSMotionTrackingUtilities axss_xPositionElementMatchingDict];
  id v10 = [v7 elementsMatching:v9];
  id v11 = [v10 firstObject];

  v12 = +[AXSSMotionTrackingUtilities axss_yPositionElementMatchingDict];
  v13 = [v7 elementsMatching:v12];
  objc_super v14 = [v13 firstObject];

  if (v11 && v14)
  {
    id v15 = [v11 integerValue];
    id v16 = [v14 integerValue];
    [v11 scaleValue:2];
    double v18 = v17;
    [v14 scaleValue:2];
    double v20 = v19;
    v21 = +[AXMTUtilities sharedInstance];
    [v21 screenBoundsAccountingForPhysicalDeviceOrientation];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    [(AXMTHIDBasedLookAtPointTracker *)self _lastValidPoint];
    id v46 = 0;
    double v30 = AXMTScreenPointForHIDPoint((uint64_t)v15, (uint64_t)v16, &v46, v18, v20, v28, v29, v23, v25, v27);
    double v32 = v31;
    v33 = v46;
    v34 = +[AXMTUtilities sharedInstance];
    objc_msgSend(v34, "convertPointFromDeviceOrientation:", v30, v32);
    double v36 = v35;
    double v38 = v37;

    v39 = +[AXMTUtilities sharedInstance];
    objc_msgSend(v39, "convertPointToInterfaceOrientation:", v36, v38);
    double v41 = v40;
    double v43 = v42;

    if (v33)
    {
      [(AXMTHIDBasedLookAtPointTracker *)self set_XPositionElementUpdated:0];
      [(AXMTHIDBasedLookAtPointTracker *)self set_YPositionElementUpdated:0];
      [(AXMTHIDBasedLookAtPointTracker *)self _failedToTrackFaceWithErrorOnBackgroundThread:v33];
    }
    else if ([(AXMTHIDBasedLookAtPointTracker *)self _XPositionElementUpdated])
    {
      if ([(AXMTHIDBasedLookAtPointTracker *)self _YPositionElementUpdated])
      {
        AXMTLogFPS();
        [(AXMTHIDBasedLookAtPointTracker *)self set_XPositionElementUpdated:0];
        [(AXMTHIDBasedLookAtPointTracker *)self set_YPositionElementUpdated:0];
        [(AXMTHIDBasedLookAtPointTracker *)self set_lastTimePointReceived:mach_absolute_time()];
        [(AXMTHIDBasedLookAtPointTracker *)self _lastValidPoint];
        if (v45 != v41 || v44 != v43)
        {
          -[AXMTHIDBasedLookAtPointTracker set_lastValidPoint:](self, "set_lastValidPoint:", v41, v43);
          -[AXMTHIDBasedLookAtPointTracker _didReceivePointOnBackgroundThread:](self, "_didReceivePointOnBackgroundThread:", v41, v43);
        }
      }
    }
  }
  else
  {
    v33 = AXSSLogForCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_10001DCAC((uint64_t)v6, (uint64_t)v7, v33);
    }
  }
}

- (void)_deviceNotification:(id)a3 added:(BOOL)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D094;
  block[3] = &unk_100048F88;
  BOOL v9 = a4;
  id v7 = a3;
  id v8 = self;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_initializationTimerFired:(id)a3
{
  if ((id)[(AXMTHIDBasedLookAtPointTracker *)self _currentStatus] != (id)1)
  {
    id v4 = objc_alloc((Class)NSError);
    id v5 = [v4 initWithDomain:AXSSMotionTrackingErrorDomain code:12 userInfo:0];
    [(AXMTHIDBasedLookAtPointTracker *)self _failedToTrackFaceWithErrorOnBackgroundThread:v5];
  }
  id v6 = [(AXMTHIDBasedLookAtPointTracker *)self _initializationTimer];
  [v6 invalidate];

  [(AXMTHIDBasedLookAtPointTracker *)self set_initializationTimer:0];
}

- (void)_setUpPowerAssertionIfNecessary
{
  if (![(AXMTHIDBasedLookAtPointTracker *)self _powerAssertionID])
  {
    IOReturn v3 = IOPMAssertionCreateWithDescription(@"PreventUserIdleDisplaySleep", @"Accessibility Motion Tracking Daemon", @"Eye Tracker actively in use", 0, 0, 0.0, 0, &self->__powerAssertionID);
    id v4 = AXSSLogForCategory();
    id v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_10001DDAC(v3, v5);
      }

      [(AXMTHIDBasedLookAtPointTracker *)self set_powerAssertionID:0];
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        sub_10001DD34(v5, v6, v7, v8, v9, v10, v11, v12);
      }

      v13 = [(AXMTHIDBasedLookAtPointTracker *)self _powerAssertionTimer];
      [v13 invalidate];

      objc_super v14 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_powerAssertionTimerFired" selector:0 userInfo:1 repeats:30.0];
      [(AXMTHIDBasedLookAtPointTracker *)self set_powerAssertionTimer:v14];
    }
  }
}

- (void)_powerAssertionTimerFired
{
  uint64_t v3 = mach_absolute_time();
  unint64_t v4 = [(AXMTHIDBasedLookAtPointTracker *)self _lastTimePointReceived];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  id v5 = (uint64_t (*)(uint64_t))off_100054E80;
  uint64_t v11 = off_100054E80;
  if (!off_100054E80)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001DA08;
    v7[3] = &unk_100048B88;
    v7[4] = &v8;
    sub_10001DA08((uint64_t)v7);
    id v5 = (uint64_t (*)(uint64_t))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v5)
  {
    uint64_t v6 = (_Unwind_Exception *)sub_10002C8C4();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v6);
  }
  if ((double)(unint64_t)v5(v3 - v4) / 1000000000.0 <= 30.0) {
    [(AXMTHIDBasedLookAtPointTracker *)self _setUpPowerAssertionIfNecessary];
  }
  else {
    [(AXMTHIDBasedLookAtPointTracker *)self _cleanUpPowerAssertionIfNecessary];
  }
}

- (void)_cleanUpPowerAssertionIfNecessary
{
  uint64_t v3 = AXSSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10001DE38(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  if ([(AXMTHIDBasedLookAtPointTracker *)self _powerAssertionID])
  {
    IOPMAssertionRelease([(AXMTHIDBasedLookAtPointTracker *)self _powerAssertionID]);
    [(AXMTHIDBasedLookAtPointTracker *)self set_powerAssertionID:0];
  }
}

- (void)_cleanUpPowerAssertionAndTimer
{
  [(AXMTHIDBasedLookAtPointTracker *)self _cleanUpPowerAssertionIfNecessary];
  uint64_t v3 = [(AXMTHIDBasedLookAtPointTracker *)self _powerAssertionTimer];
  [v3 invalidate];

  [(AXMTHIDBasedLookAtPointTracker *)self set_powerAssertionTimer:0];
}

- (void)_didReceivePointOnBackgroundThread:(CGPoint)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D5CC;
  block[3] = &unk_1000489C8;
  CGPoint v4 = a3;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_inputSourceWasInterruptedOnMainThread
{
  uint64_t v3 = AXSSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10001DEB0(v3);
  }

  CGPoint v4 = [(AXMTHIDBasedLookAtPointTracker *)self delegate];
  [v4 lookAtPointTrackerWasInterrupted:self];
}

- (void)_failedToTrackFaceWithErrorOnBackgroundThread:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001D77C;
  v5[3] = &unk_100048928;
  id v6 = a3;
  uint64_t v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (unint64_t)motionTrackingMode
{
  return self->_motionTrackingMode;
}

- (void)setMotionTrackingMode:(unint64_t)a3
{
  self->_motionTrackingMode = a3;
}

- (double)sensitivity
{
  return self->_sensitivity;
}

- (void)setSensitivity:(double)a3
{
  self->_sensitivity = a3;
}

- (double)joystickModeMovementThreshold
{
  return self->_joystickModeMovementThreshold;
}

- (void)setJoystickModeMovementThreshold:(double)a3
{
  self->_joystickModeMovementThreshold = a3;
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

- (void)setDebugOverlayEnabled:(BOOL)a3
{
  self->_debugOverlayEnabled = a3;
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

- (AXSSMotionTrackingExpressionConfiguration)expressionConfiguration
{
  return self->_expressionConfiguration;
}

- (void)setExpressionConfiguration:(id)a3
{
}

- (UIView)debugOverlayRootView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_debugOverlayRootView);

  return (UIView *)WeakRetained;
}

- (void)setDebugOverlayRootView:(id)a3
{
}

- (OS_dispatch_queue)_hidManagerDispatchQueue
{
  return self->__hidManagerDispatchQueue;
}

- (void)set_hidManagerDispatchQueue:(id)a3
{
}

- (HIDManager)_hidManager
{
  return self->__hidManager;
}

- (void)set_hidManager:(id)a3
{
}

- (BOOL)_isStarted
{
  return self->__isStarted;
}

- (void)set_isStarted:(BOOL)a3
{
  self->__isStarted = a3;
}

- (BOOL)_XPositionElementUpdated
{
  return self->__XPositionElementUpdated;
}

- (void)set_XPositionElementUpdated:(BOOL)a3
{
  self->__XPositionElementUpdated = a3;
}

- (BOOL)_YPositionElementUpdated
{
  return self->__YPositionElementUpdated;
}

- (void)set_YPositionElementUpdated:(BOOL)a3
{
  self->__YPositionElementUpdated = a3;
}

- (CGPoint)_lastValidPoint
{
  double x = self->__lastValidPoint.x;
  double y = self->__lastValidPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)set_lastValidPoint:(CGPoint)a3
{
  self->__lastValidPoint = a3;
}

- (NSTimer)_initializationTimer
{
  return self->__initializationTimer;
}

- (void)set_initializationTimer:(id)a3
{
}

- (unsigned)_powerAssertionID
{
  return self->__powerAssertionID;
}

- (void)set_powerAssertionID:(unsigned int)a3
{
  self->__powerAssertionID = a3;
}

- (NSTimer)_powerAssertionTimer
{
  return self->__powerAssertionTimer;
}

- (void)set_powerAssertionTimer:(id)a3
{
}

- (unint64_t)_lastTimePointReceived
{
  return self->__lastTimePointReceived;
}

- (void)set_lastTimePointReceived:(unint64_t)a3
{
  self->__lastTimePointReceived = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__powerAssertionTimer, 0);
  objc_storeStrong((id *)&self->__initializationTimer, 0);
  objc_storeStrong((id *)&self->__hidManager, 0);
  objc_storeStrong((id *)&self->__hidManagerDispatchQueue, 0);
  objc_destroyWeak((id *)&self->_debugOverlayRootView);
  objc_storeStrong((id *)&self->__currentFrequency, 0);
  objc_storeStrong((id *)&self->_expressionConfiguration, 0);
  objc_storeStrong((id *)&self->_input, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end