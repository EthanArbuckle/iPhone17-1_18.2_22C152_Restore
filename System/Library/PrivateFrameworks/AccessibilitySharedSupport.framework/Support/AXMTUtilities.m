@interface AXMTUtilities
+ (AXMTUtilities)sharedInstance;
+ (int64_t)errorCodeForFaceKitPayload:(id)a3 lastReportedFailureNumber:(id)a4;
- (AXMTUtilities)init;
- (BOOL)orientationLocked;
- (CGPoint)convertPoint:(CGPoint)a3 fromOrientation:(int64_t)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toOrientation:(int64_t)a4;
- (CGPoint)convertPointFromDeviceOrientation:(CGPoint)a3;
- (CGPoint)convertPointFromInterfaceOrientation:(CGPoint)a3;
- (CGPoint)convertPointToDeviceOrientation:(CGPoint)a3;
- (CGPoint)convertPointToInterfaceOrientation:(CGPoint)a3;
- (CGRect)_screenBounds;
- (CGRect)_screenBoundsFromFrontBoard;
- (CGRect)screenBoundsAccountingForInterfaceOrientation;
- (CGRect)screenBoundsAccountingForPhysicalDeviceOrientation;
- (CMMotionManager)_motionManager;
- (FBSOrientationObserver)_orientationObserver;
- (NSOperationQueue)_motionManagerCallbackQueue;
- (NSPointerArray)_listeners;
- (NSPointerArray)_listenersForDeviceOrientationEvents;
- (int)effectiveOrientationToken;
- (int)lockStatusToken;
- (int64_t)bksEffectiveOrientation;
- (int64_t)currentDeviceOrientation;
- (int64_t)currentInterfaceOrientation;
- (unint64_t)_screenBoundsUpdateAttempts;
- (void)_accelerometerDataUpdated:(id)a3;
- (void)_checkBackboardEffectiveDeviceOrientation;
- (void)_checkBackboardOrientationLockStatus;
- (void)_deviceOrientationChanged:(int64_t)a3;
- (void)_handleAccelerometerDataUpdate:(id)a3;
- (void)_interfaceOrientationChanged:(int64_t)a3;
- (void)_startMonitoringEffectiveDeviceOrientation;
- (void)_startMonitoringOrientationLockStatus;
- (void)_stopMonitoringEffectiveDeviceOrientation;
- (void)_stopMonitoringOrientationLockStatus;
- (void)_tearDownMotionManager;
- (void)_updateScreenBounds;
- (void)dealloc;
- (void)registerListener:(id)a3 needsPhysicalOrientationEvents:(BOOL)a4;
- (void)setBksEffectiveOrientation:(int64_t)a3;
- (void)setCurrentDeviceOrientation:(int64_t)a3;
- (void)setCurrentInterfaceOrientation:(int64_t)a3;
- (void)setEffectiveOrientationToken:(int)a3;
- (void)setLockStatusToken:(int)a3;
- (void)setOrientationLocked:(BOOL)a3;
- (void)set_listeners:(id)a3;
- (void)set_listenersForDeviceOrientationEvents:(id)a3;
- (void)set_motionManager:(id)a3;
- (void)set_motionManagerCallbackQueue:(id)a3;
- (void)set_orientationObserver:(id)a3;
- (void)set_screenBounds:(CGRect)a3;
- (void)set_screenBoundsUpdateAttempts:(unint64_t)a3;
- (void)unregisterListener:(id)a3;
@end

@implementation AXMTUtilities

+ (AXMTUtilities)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000109F0;
  block[3] = &unk_100048BC0;
  block[4] = a1;
  if (qword_100054E20 != -1) {
    dispatch_once(&qword_100054E20, block);
  }
  v2 = (void *)qword_100054E28;

  return (AXMTUtilities *)v2;
}

- (AXMTUtilities)init
{
  v18.receiver = self;
  v18.super_class = (Class)AXMTUtilities;
  v2 = [(AXMTUtilities *)&v18 init];
  if (v2)
  {
    uint64_t v3 = +[NSPointerArray pointerArrayWithOptions:5];
    listeners = v2->__listeners;
    v2->__listeners = (NSPointerArray *)v3;

    uint64_t v5 = +[NSPointerArray pointerArrayWithOptions:5];
    listenersForDeviceOrientationEvents = v2->__listenersForDeviceOrientationEvents;
    v2->__listenersForDeviceOrientationEvents = (NSPointerArray *)v5;

    v2->_currentInterfaceOrientation = 0;
    v2->_currentDeviceOrientation = 0;
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    v7 = (double (*)(void))off_100054E40;
    v22 = off_100054E40;
    if (!off_100054E40)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_100013010;
      v24 = &unk_100048B88;
      v25 = &v19;
      sub_100013010((uint64_t)buf);
      v7 = (double (*)(void))v20[3];
    }
    _Block_object_dispose(&v19, 8);
    if (!v7)
    {
      sub_10002C8C4();
      __break(1u);
    }
    v2->__screenBounds.origin.x = v7();
    v2->__screenBounds.origin.y = v8;
    v2->__screenBounds.size.width = v9;
    v2->__screenBounds.size.height = v10;
    v11 = AXSSLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v16 = NSStringFromCGRect(v2->__screenBounds);
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[AXMTUtilities init]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s: initializing with screen bounds: %@", buf, 0x16u);
    }
    if (CGRectIsNull(v2->__screenBounds) || CGRectIsEmpty(v2->__screenBounds))
    {
      v12 = AXSSLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v17 = NSStringFromCGRect(v2->__screenBounds);
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[AXMTUtilities init]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: ERROR!! Got invalid screen bounds: %@", buf, 0x16u);
      }
    }
    v2->__screenBoundsUpdateAttempts = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_100010D50, @"SBSpringBoardDidLaunchNotification", 0, CFNotificationSuspensionBehaviorDrop);
    [(AXMTUtilities *)v2 _startMonitoringOrientationLockStatus];
    [(AXMTUtilities *)v2 _startMonitoringEffectiveDeviceOrientation];
    if (v2->_orientationLocked)
    {
      v14 = AXSSLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_100013588((uint64_t)v2, v14);
      }

      v2->_currentDeviceOrientation = v2->_bksEffectiveOrientation;
    }
  }
  return v2;
}

- (void)dealloc
{
  [(FBSOrientationObserver *)self->__orientationObserver invalidate];
  orientationObserver = self->__orientationObserver;
  self->__orientationObserver = 0;

  [(CMMotionManager *)self->__motionManager stopAccelerometerUpdates];
  motionManager = self->__motionManager;
  self->__motionManager = 0;

  motionManagerCallbackQueue = self->__motionManagerCallbackQueue;
  self->__motionManagerCallbackQueue = 0;

  self->_currentDeviceOrientation = 0;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SBSpringBoardDidLaunchNotification", 0);
  [(AXMTUtilities *)self _stopMonitoringOrientationLockStatus];
  [(AXMTUtilities *)self _stopMonitoringEffectiveDeviceOrientation];
  v7.receiver = self;
  v7.super_class = (Class)AXMTUtilities;
  [(AXMTUtilities *)&v7 dealloc];
}

- (CGRect)screenBoundsAccountingForInterfaceOrientation
{
  [(AXMTUtilities *)self _screenBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(AXMTUtilities *)self currentInterfaceOrientation];
  v12 = [(AXMTUtilities *)self _listeners];
  id v13 = [v12 count];

  if (!v13) {
    v11 = (char *)+[UIDevice currentDeviceOrientationAllowingAmbiguous:0];
  }
  if ((unint64_t)(v11 - 3) >= 2) {
    double v14 = v10;
  }
  else {
    double v14 = v8;
  }
  if ((unint64_t)(v11 - 3) >= 2) {
    double v15 = v8;
  }
  else {
    double v15 = v10;
  }
  double v16 = v4;
  double v17 = v6;
  result.size.height = v14;
  result.size.width = v15;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)screenBoundsAccountingForPhysicalDeviceOrientation
{
  [(AXMTUtilities *)self _screenBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(AXMTUtilities *)self currentDeviceOrientation];
  v12 = [(AXMTUtilities *)self _listeners];
  id v13 = [v12 count];

  if (!v13) {
    v11 = (char *)+[UIDevice currentDeviceOrientationAllowingAmbiguous:0];
  }
  if ((unint64_t)(v11 - 3) >= 2) {
    double v14 = v8;
  }
  else {
    double v14 = v10;
  }
  if ((unint64_t)(v11 - 3) >= 2) {
    double v15 = v10;
  }
  else {
    double v15 = v8;
  }
  double v16 = v4;
  double v17 = v6;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGPoint)convertPointToDeviceOrientation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int64_t v6 = [(AXMTUtilities *)self currentDeviceOrientation];

  -[AXMTUtilities convertPoint:toOrientation:](self, "convertPoint:toOrientation:", v6, x, y);
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGPoint)convertPointToInterfaceOrientation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int64_t v6 = [(AXMTUtilities *)self currentInterfaceOrientation];

  -[AXMTUtilities convertPoint:toOrientation:](self, "convertPoint:toOrientation:", v6, x, y);
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toOrientation:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  [(AXMTUtilities *)self _screenBounds];
  double v9 = v8 - y;
  double v10 = v7 - x;
  if (a4 == 2) {
    double v11 = v7 - x;
  }
  else {
    double v11 = x;
  }
  if (a4 == 2) {
    double v12 = v8 - y;
  }
  else {
    double v12 = y;
  }
  if (a4 == 3) {
    double v11 = y;
  }
  else {
    double v10 = v12;
  }
  if (a4 == 4) {
    double v10 = x;
  }
  else {
    double v9 = v11;
  }
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (CGPoint)convertPointFromDeviceOrientation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int64_t v6 = [(AXMTUtilities *)self currentDeviceOrientation];

  -[AXMTUtilities convertPoint:fromOrientation:](self, "convertPoint:fromOrientation:", v6, x, y);
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGPoint)convertPointFromInterfaceOrientation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int64_t v6 = [(AXMTUtilities *)self currentInterfaceOrientation];

  -[AXMTUtilities convertPoint:fromOrientation:](self, "convertPoint:fromOrientation:", v6, x, y);
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromOrientation:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  [(AXMTUtilities *)self _screenBounds];
  double v8 = v7 - x;
  double v10 = v9 - y;
  double v11 = v7 - y;
  double v12 = v9 - x;
  if (a4 != 2)
  {
    double v12 = x;
    double v11 = y;
  }
  if (a4 == 3)
  {
    double v13 = x;
  }
  else
  {
    double v10 = v12;
    double v13 = v11;
  }
  if (a4 == 4) {
    double v10 = y;
  }
  else {
    double v8 = v13;
  }
  result.double y = v8;
  result.double x = v10;
  return result;
}

- (void)registerListener:(id)a3 needsPhysicalOrientationEvents:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = AXSSLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000137B0();
  }

  double v8 = [(AXMTUtilities *)self _listeners];
  id v9 = [v8 count];

  double v10 = [(AXMTUtilities *)self _listeners];
  [v10 addPointer:v6];

  if (v4)
  {
    double v11 = [(AXMTUtilities *)self _listenersForDeviceOrientationEvents];
    id v12 = [v11 count];

    if (v12)
    {
LABEL_16:
      v29 = [(AXMTUtilities *)self _listenersForDeviceOrientationEvents];
      [v29 addPointer:v6];

      goto LABEL_17;
    }
    id v13 = objc_alloc_init((Class)NSOperationQueue);
    [(AXMTUtilities *)self set_motionManagerCallbackQueue:v13];

    double v14 = [(AXMTUtilities *)self _motionManagerCallbackQueue];
    [v14 setMaxConcurrentOperationCount:1];

    double v15 = [(AXMTUtilities *)self _motionManagerCallbackQueue];
    [v15 setQualityOfService:33];

    id v16 = objc_alloc_init((Class)CMMotionManager);
    [(AXMTUtilities *)self set_motionManager:v16];

    double v17 = [(AXMTUtilities *)self _motionManager];
    unsigned int v18 = [v17 isAccelerometerAvailable];

    if (v18)
    {
      uint64_t v19 = [(AXMTUtilities *)self _motionManager];
      [v19 setAccelerometerUpdateInterval:1.0];

      v20 = [(AXMTUtilities *)self _motionManager];
      uint64_t v21 = [(AXMTUtilities *)self _motionManagerCallbackQueue];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1000115A0;
      v37[3] = &unk_100048D10;
      v37[4] = self;
      [v20 startAccelerometerUpdatesToQueue:v21 withHandler:v37];

      v22 = [(AXMTUtilities *)self _motionManager];
      uint64_t v23 = [v22 accelerometerData];
      if (v23)
      {
        v24 = (void *)v23;
        unsigned __int8 v25 = [(AXMTUtilities *)self orientationLocked];

        if ((v25 & 1) == 0)
        {
          v26 = [(AXMTUtilities *)self _motionManager];
          v27 = [v26 accelerometerData];
          [(AXMTUtilities *)self _handleAccelerometerDataUpdate:v27];

LABEL_11:
          goto LABEL_16;
        }
      }
      else
      {
      }
      v28 = AXSSLogForCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        sub_100013618(self, v28);
      }

      [(AXMTUtilities *)self setCurrentDeviceOrientation:[(AXMTUtilities *)self bksEffectiveOrientation]];
      goto LABEL_16;
    }
    v26 = AXSSLogForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10001372C(v26);
    }
    goto LABEL_11;
  }
LABEL_17:
  if (!v9)
  {
    objc_initWeak(&location, self);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10001161C;
    v34[3] = &unk_100048D38;
    objc_copyWeak(&v35, &location);
    v30 = objc_retainBlock(v34);
    id v31 = objc_alloc_init((Class)FBSOrientationObserver);
    [(AXMTUtilities *)self set_orientationObserver:v31];

    v32 = [(AXMTUtilities *)self _orientationObserver];
    [v32 setHandler:v30];

    v33 = [(AXMTUtilities *)self _orientationObserver];
    -[AXMTUtilities setCurrentInterfaceOrientation:](self, "setCurrentInterfaceOrientation:", [v33 activeInterfaceOrientation]);

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
}

- (void)unregisterListener:(id)a3
{
  id v4 = a3;
  double v5 = AXSSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000138CC();
  }

  id v6 = [(AXMTUtilities *)self _listeners];
  if ([v6 count])
  {
    uint64_t v7 = 0;
    while ([v6 pointerAtIndex:v7] != v4)
    {
      if (++v7 >= (unint64_t)[v6 count]) {
        goto LABEL_9;
      }
    }
    [v6 removePointerAtIndex:v7];
  }
LABEL_9:
  [v6 compact];
  double v8 = [(AXMTUtilities *)self _listenersForDeviceOrientationEvents];
  if ([v8 count])
  {
    uint64_t v9 = 0;
    while ([v8 pointerAtIndex:v9] != v4)
    {
      if (++v9 >= (unint64_t)[v8 count]) {
        goto LABEL_15;
      }
    }
    [v8 removePointerAtIndex:v9];
  }
LABEL_15:
  [v8 compact];
  if (![v8 count]) {
    [(AXMTUtilities *)self _tearDownMotionManager];
  }
  if (![v6 count])
  {
    double v10 = [(AXMTUtilities *)self _orientationObserver];
    [v10 invalidate];

    [(AXMTUtilities *)self set_orientationObserver:0];
    [(AXMTUtilities *)self setCurrentInterfaceOrientation:0];
  }
}

- (void)_handleAccelerometerDataUpdate:(id)a3
{
  id v4 = a3;
  if (v4 && ![(AXMTUtilities *)self orientationLocked])
  {
    [v4 acceleration];
    double v6 = fabs(v5);
    double v8 = fabs(v7);
    uint64_t v9 = 3;
    if (v7 > 0.0) {
      uint64_t v9 = 4;
    }
    if (v8 <= v6) {
      uint64_t v9 = 0;
    }
    uint64_t v10 = 2;
    if (v5 <= 0.0) {
      uint64_t v10 = 1;
    }
    if (v6 > v8) {
      double v11 = (void *)v10;
    }
    else {
      double v11 = (void *)v9;
    }
    if ((void *)[(AXMTUtilities *)self currentDeviceOrientation] != v11)
    {
      [(AXMTUtilities *)self setCurrentDeviceOrientation:v11];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000119E0;
      block[3] = &unk_1000489A0;
      block[4] = self;
      void block[5] = v11;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000119EC;
    v12[3] = &unk_100048928;
    v12[4] = self;
    id v13 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
  }
}

- (void)_tearDownMotionManager
{
  double v3 = [(AXMTUtilities *)self _motionManager];
  [v3 stopAccelerometerUpdates];

  [(AXMTUtilities *)self set_motionManager:0];
  [(AXMTUtilities *)self set_motionManagerCallbackQueue:0];

  [(AXMTUtilities *)self setCurrentDeviceOrientation:0];
}

- (void)_deviceOrientationChanged:(int64_t)a3
{
  id v4 = AXSSLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100013934(self);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v5 = [(AXMTUtilities *)self _listenersForDeviceOrientationEvents];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
        if (v10 && (objc_opt_respondsToSelector() & 1) != 0) {
          objc_msgSend(v10, "axmtUtilities_deviceOrientationChanged:", -[AXMTUtilities currentDeviceOrientation](self, "currentDeviceOrientation"));
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  double v11 = [(AXMTUtilities *)self _listenersForDeviceOrientationEvents];
  [v11 compact];
}

- (void)_accelerometerDataUpdated:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v5 = [(AXMTUtilities *)self _listenersForDeviceOrientationEvents];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
        if (v10 && (objc_opt_respondsToSelector() & 1) != 0) {
          objc_msgSend(v10, "axmtUtilities_accelerometerDataUpdated:", v4);
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  double v11 = [(AXMTUtilities *)self _listenersForDeviceOrientationEvents];
  [v11 compact];
}

- (void)_interfaceOrientationChanged:(int64_t)a3
{
  [(AXMTUtilities *)self setCurrentInterfaceOrientation:a3];
  id v4 = AXSSLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000139C4(self, v4);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v5 = [(AXMTUtilities *)self _listeners];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
        if (v10 && (objc_opt_respondsToSelector() & 1) != 0) {
          objc_msgSend(v10, "axmtUtilities_interfaceOrientationChanged:", -[AXMTUtilities currentInterfaceOrientation](self, "currentInterfaceOrientation"));
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  double v11 = [(AXMTUtilities *)self _listeners];
  [v11 compact];
}

- (void)_startMonitoringOrientationLockStatus
{
  objc_initWeak(&location, self);
  id v3 = &_dispatch_main_q;
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  uint64_t v8 = sub_100011FD0;
  uint64_t v9 = &unk_100048D60;
  objc_copyWeak(&v10, &location);
  uint32_t v4 = notify_register_dispatch("com.apple.backboardd.orientationlock", &self->_lockStatusToken, (dispatch_queue_t)&_dispatch_main_q, &v6);

  if (v4)
  {
    double v5 = AXSSLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100013A4C(v5);
    }
  }
  [(AXMTUtilities *)self _checkBackboardOrientationLockStatus];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_checkBackboardOrientationLockStatus
{
  uint64_t state64 = 0;
  if (notify_register_check("com.apple.backboardd.orientationlock", &dword_1000549A0)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = dword_1000549A0 == -1;
  }
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    notify_get_state(dword_1000549A0, &state64);
    double v5 = AXSSLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v9 = state64;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Detected orientation lock status: %llu", buf, 0xCu);
    }

    BOOL v4 = state64 != 0;
  }
  [(AXMTUtilities *)self setOrientationLocked:v4];
}

- (void)_stopMonitoringOrientationLockStatus
{
  if (notify_is_valid_token([(AXMTUtilities *)self lockStatusToken])) {
    notify_cancel([(AXMTUtilities *)self lockStatusToken]);
  }

  [(AXMTUtilities *)self setLockStatusToken:0xFFFFFFFFLL];
}

- (void)_startMonitoringEffectiveDeviceOrientation
{
  objc_initWeak(&location, self);
  id v3 = &_dispatch_main_q;
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  uint64_t v8 = sub_100012304;
  uint64_t v9 = &unk_100048D60;
  objc_copyWeak(&v10, &location);
  uint32_t v4 = notify_register_dispatch("com.apple.backboardd.orientation", &self->_effectiveOrientationToken, (dispatch_queue_t)&_dispatch_main_q, &v6);

  if (v4)
  {
    double v5 = AXSSLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100013B08(v5);
    }
  }
  [(AXMTUtilities *)self _checkBackboardEffectiveDeviceOrientation];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_checkBackboardEffectiveDeviceOrientation
{
  if (notify_register_check("com.apple.backboardd.orientation", &dword_1000549A4)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = dword_1000549A4 == -1;
  }
  if (!v3)
  {
    uint64_t state64 = 0;
    notify_get_state(dword_1000549A4, &state64);
    [(AXMTUtilities *)self setBksEffectiveOrientation:state64];
    uint32_t v4 = AXSSLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int64_t v5 = [(AXMTUtilities *)self bksEffectiveOrientation];
      *(_DWORD *)buf = 136315394;
      uint64_t v8 = "-[AXMTUtilities _checkBackboardEffectiveDeviceOrientation]";
      __int16 v9 = 2048;
      int64_t v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s: Detected effective orientation from backboard: %ld", buf, 0x16u);
    }
  }
}

- (void)_stopMonitoringEffectiveDeviceOrientation
{
  if (notify_is_valid_token([(AXMTUtilities *)self effectiveOrientationToken])) {
    notify_cancel([(AXMTUtilities *)self effectiveOrientationToken]);
  }

  [(AXMTUtilities *)self setEffectiveOrientationToken:0xFFFFFFFFLL];
}

- (void)_updateScreenBounds
{
  [(AXMTUtilities *)self set_screenBoundsUpdateAttempts:(char *)[(AXMTUtilities *)self _screenBoundsUpdateAttempts] + 1];
  [(AXMTUtilities *)self _screenBoundsFromFrontBoard];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(AXMTUtilities *)self _screenBounds];
  v27.origin.double x = v11;
  v27.origin.double y = v12;
  v27.size.width = v13;
  v27.size.height = v14;
  v26.origin.double x = v4;
  v26.origin.double y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  if (CGRectEqualToRect(v26, v27))
  {
    if ([(AXMTUtilities *)self _screenBoundsUpdateAttempts] < 0xA)
    {
      dispatch_time_t v24 = dispatch_time(0, 500000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100012644;
      block[3] = &unk_1000488D8;
      block[4] = self;
      dispatch_after(v24, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      [(AXMTUtilities *)self set_screenBoundsUpdateAttempts:0];
      long long v15 = AXSSLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_100013B4C(v15, v16, v17, v18, v19, v20, v21, v22);
      }
    }
  }
  else
  {
    uint64_t v23 = AXSSLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_100013BC4(v4, v6, v8, v10);
    }

    -[AXMTUtilities set_screenBounds:](self, "set_screenBounds:", v4, v6, v8, v10);
    [(AXMTUtilities *)self set_screenBoundsUpdateAttempts:0];
  }
}

- (CGRect)_screenBoundsFromFrontBoard
{
  id v2 = objc_alloc_init((Class)FBSDisplayMonitor);
  double v3 = [v2 mainConfiguration];
  double v4 = [v3 currentMode];

  [v4 size];
  double v6 = v5;
  double v8 = v7;

  double v9 = 0.0;
  double v10 = 0.0;
  double v11 = v6;
  double v12 = v8;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

+ (int64_t)errorCodeForFaceKitPayload:(id)a3 lastReportedFailureNumber:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_100054E38 != -1) {
    dispatch_once(&qword_100054E38, &stru_100048D80);
  }
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  double v7 = (void *)qword_100054E50;
  uint64_t v41 = qword_100054E50;
  if (!qword_100054E50)
  {
    v33 = _NSConcreteStackBlock;
    uint64_t v34 = 3221225472;
    uint64_t v35 = (uint64_t)sub_100013228;
    v36 = &unk_100048B88;
    v37 = &v38;
    double v8 = (void *)sub_100013278();
    double v9 = dlsym(v8, "kCVAFaceTracking_DataFailure");
    *(void *)(v37[1] + 24) = v9;
    qword_100054E50 = *(void *)(v37[1] + 24);
    double v7 = (void *)v39[3];
  }
  _Block_object_dispose(&v38, 8);
  if (!v7) {
    goto LABEL_30;
  }
  double v10 = [v5 objectForKeyedSubscript:*v7];
  if (v10)
  {
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2020000000;
    double v11 = (void *)qword_100054E60;
    uint64_t v41 = qword_100054E60;
    if (!qword_100054E60)
    {
      v33 = _NSConcreteStackBlock;
      uint64_t v34 = 3221225472;
      uint64_t v35 = (uint64_t)sub_1000133EC;
      v36 = &unk_100048B88;
      v37 = &v38;
      double v12 = (void *)sub_100013278();
      CGFloat v13 = dlsym(v12, "kCVAFaceTracking_DataFailureImageTooDark");
      *(void *)(v37[1] + 24) = v13;
      qword_100054E60 = *(void *)(v37[1] + 24);
      double v11 = (void *)v39[3];
    }
    _Block_object_dispose(&v38, 8);
    if (!v11) {
      goto LABEL_30;
    }
    CGFloat v14 = [v10 objectForKeyedSubscript:*v11];
    if ([v14 BOOLValue]) {
      v30[3] = 5;
    }
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2020000000;
    long long v15 = (void *)qword_100054E68;
    uint64_t v41 = qword_100054E68;
    if (!qword_100054E68)
    {
      v33 = _NSConcreteStackBlock;
      uint64_t v34 = 3221225472;
      uint64_t v35 = (uint64_t)sub_10001343C;
      v36 = &unk_100048B88;
      v37 = &v38;
      uint64_t v16 = (void *)sub_100013278();
      uint64_t v17 = dlsym(v16, "kCVAFaceTracking_DataFailureSensorCovered");
      *(void *)(v37[1] + 24) = v17;
      qword_100054E68 = *(void *)(v37[1] + 24);
      long long v15 = (void *)v39[3];
    }
    _Block_object_dispose(&v38, 8);
    if (!v15) {
      goto LABEL_30;
    }
    uint64_t v18 = [v10 objectForKeyedSubscript:*v15];
    if ([v18 BOOLValue]) {
      v30[3] = 6;
    }
  }
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v19 = (void *)qword_100054E70;
  uint64_t v41 = qword_100054E70;
  if (!qword_100054E70)
  {
    v33 = _NSConcreteStackBlock;
    uint64_t v34 = 3221225472;
    uint64_t v35 = (uint64_t)sub_10001348C;
    v36 = &unk_100048B88;
    v37 = &v38;
    uint64_t v20 = (void *)sub_100013278();
    uint64_t v21 = dlsym(v20, "kCVAFaceTracking_TrackedFacesArray");
    *(void *)(v37[1] + 24) = v21;
    qword_100054E70 = *(void *)(v37[1] + 24);
    uint64_t v19 = (void *)v39[3];
  }
  _Block_object_dispose(&v38, 8);
  if (!v19)
  {
LABEL_30:
    dlerror();
    int64_t result = abort_report_np();
    __break(1u);
    return result;
  }
  uint64_t v22 = [v5 objectForKeyedSubscript:*v19];
  uint64_t v23 = v22;
  v33 = 0;
  uint64_t v34 = (uint64_t)&v33;
  uint64_t v35 = 0x2020000000;
  LODWORD(v36) = 0;
  dispatch_time_t v24 = v30;
  if (v22 && !v30[3])
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100012C98;
    v28[3] = &unk_100048DA8;
    v28[4] = &v33;
    v28[5] = &v29;
    [v22 enumerateObjectsUsingBlock:v28];
    dispatch_time_t v24 = v30;
  }
  int64_t v25 = v24[3];
  if (v6 && !v25)
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100012E7C;
    v27[3] = &unk_100048DD0;
    v27[4] = &v29;
    v27[5] = [v6 integerValue];
    [(id)qword_100054E30 enumerateObjectsUsingBlock:v27];
    dispatch_time_t v24 = v30;
    int64_t v25 = v30[3];
  }
  if (!v25)
  {
    int64_t v25 = 1;
    v24[3] = 1;
  }
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v29, 8);
  return v25;
}

- (int64_t)currentInterfaceOrientation
{
  return self->_currentInterfaceOrientation;
}

- (void)setCurrentInterfaceOrientation:(int64_t)a3
{
  self->_currentInterfaceOrientation = a3;
}

- (int64_t)currentDeviceOrientation
{
  return self->_currentDeviceOrientation;
}

- (void)setCurrentDeviceOrientation:(int64_t)a3
{
  self->_currentDeviceOrientation = a3;
}

- (NSPointerArray)_listeners
{
  return self->__listeners;
}

- (void)set_listeners:(id)a3
{
}

- (NSPointerArray)_listenersForDeviceOrientationEvents
{
  return self->__listenersForDeviceOrientationEvents;
}

- (void)set_listenersForDeviceOrientationEvents:(id)a3
{
}

- (FBSOrientationObserver)_orientationObserver
{
  return self->__orientationObserver;
}

- (void)set_orientationObserver:(id)a3
{
}

- (CMMotionManager)_motionManager
{
  return self->__motionManager;
}

- (void)set_motionManager:(id)a3
{
}

- (NSOperationQueue)_motionManagerCallbackQueue
{
  return self->__motionManagerCallbackQueue;
}

- (void)set_motionManagerCallbackQueue:(id)a3
{
}

- (CGRect)_screenBounds
{
  double x = self->__screenBounds.origin.x;
  double y = self->__screenBounds.origin.y;
  double width = self->__screenBounds.size.width;
  double height = self->__screenBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)set_screenBounds:(CGRect)a3
{
  self->__screenBounds = a3;
}

- (unint64_t)_screenBoundsUpdateAttempts
{
  return self->__screenBoundsUpdateAttempts;
}

- (void)set_screenBoundsUpdateAttempts:(unint64_t)a3
{
  self->__screenBoundsUpdateAttempts = a3;
}

- (int)lockStatusToken
{
  return self->_lockStatusToken;
}

- (void)setLockStatusToken:(int)a3
{
  self->_lockStatusToken = a3;
}

- (int)effectiveOrientationToken
{
  return self->_effectiveOrientationToken;
}

- (void)setEffectiveOrientationToken:(int)a3
{
  self->_effectiveOrientationToken = a3;
}

- (BOOL)orientationLocked
{
  return self->_orientationLocked;
}

- (void)setOrientationLocked:(BOOL)a3
{
  self->_orientationLocked = a3;
}

- (int64_t)bksEffectiveOrientation
{
  return self->_bksEffectiveOrientation;
}

- (void)setBksEffectiveOrientation:(int64_t)a3
{
  self->_bksEffectiveOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__motionManagerCallbackQueue, 0);
  objc_storeStrong((id *)&self->__motionManager, 0);
  objc_storeStrong((id *)&self->__orientationObserver, 0);
  objc_storeStrong((id *)&self->__listenersForDeviceOrientationEvents, 0);

  objc_storeStrong((id *)&self->__listeners, 0);
}

@end