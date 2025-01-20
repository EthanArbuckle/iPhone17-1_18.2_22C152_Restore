@interface AXUIServerApplication
- (AXUIServerApplication)init;
- (BOOL)_accessibilityIsAccessibilityUIServer;
- (BOOL)_accessibilityIsLaunchAngel;
- (BOOL)_accessibilityUseWindowBoundsForOutOfBoundsChecking;
- (BOOL)_shouldAllowKeyboardArbiter;
- (CGRect)accessibilityFrame;
- (id)_accessibilityIsolatedWindows;
- (id)accessibilityLabel;
- (int64_t)_accessibilityOrientationForCompareGeometry;
- (void)sendEvent:(id)a3;
@end

@implementation AXUIServerApplication

- (AXUIServerApplication)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXUIServerApplication;
  v2 = [(AXUIServerApplication *)&v6 init];
  if ((AXDeviceIsAudioAccessory() & 1) == 0)
  {
    while (!BKSWatchdogGetIsAlive())
      ;
    v3 = +[AXUIServiceManager sharedServiceManager];
    if (v3)
    {
      v4 = v3;
      [v3 _startLaunchAngel];
    }
  }
  return v2;
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  v5 = +[AXUIEventManager sharedEventManager];
  unsigned __int8 v6 = [v5 _handleUIEvent:v4];

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)AXUIServerApplication;
    [(AXUIServerApplication *)&v7 sendEvent:v4];
  }
}

- (id)accessibilityLabel
{
  return &stru_100008420;
}

- (BOOL)_shouldAllowKeyboardArbiter
{
  int v3 = _AXSLiveSpeechEnabled();
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AXUIServerApplication;
    LOBYTE(v3) = [(AXUIServerApplication *)&v5 _shouldAllowKeyboardArbiter];
  }
  return v3;
}

- (BOOL)_accessibilityIsLaunchAngel
{
  return 1;
}

- (BOOL)_accessibilityIsAccessibilityUIServer
{
  return 1;
}

- (BOOL)_accessibilityUseWindowBoundsForOutOfBoundsChecking
{
  return 1;
}

- (int64_t)_accessibilityOrientationForCompareGeometry
{
  if (AXInPreboardScenario()) {
    return 1;
  }

  return (int64_t)[(AXUIServerApplication *)self activeInterfaceOrientation];
}

- (CGRect)accessibilityFrame
{
  v2 = +[UIScreen mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)_accessibilityIsolatedWindows
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_3;
  }
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100002F6C;
  v21 = sub_100002F7C;
  id v22 = 0;
  double v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  double v14 = sub_100002F84;
  v15 = &unk_100008290;
  v16 = &v17;
  AXPerformSafeBlock();
  id v2 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  if (!v2)
  {
LABEL_3:
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = sub_100002F6C;
    v21 = sub_100002F7C;
    id v22 = 0;
    double v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    double v9 = sub_100002FDC;
    double v10 = &unk_100008290;
    double v11 = &v17;
    AXPerformSafeBlock();
    id v2 = (id)v18[5];
    _Block_object_dispose(&v17, 8);
  }
  +[NSMutableArray array];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003034;
  v5[3] = &unk_1000082B8;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  [v2 enumerateObjectsWithOptions:2 usingBlock:v5];

  return v3;
}

@end