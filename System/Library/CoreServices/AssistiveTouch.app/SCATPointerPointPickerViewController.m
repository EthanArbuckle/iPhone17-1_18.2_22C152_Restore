@interface SCATPointerPointPickerViewController
- (AXDispatchTimer)systemPointerSettingsChangedDebouncer;
- (AXPIFingerAppearanceDelegate)mousePointerAppearance;
- (AXPIFingerController)fingerController;
- (BOOL)_canShowWhileLocked;
- (BOOL)fingersDown;
- (BOOL)shouldUpdateZoomLocation;
- (CGPoint)currentPoint;
- (void)_resetPointer;
- (void)_systemPointerSettingsDidChange;
- (void)_updateCursorDrawing;
- (void)_updateZoomWithDisplayPoint:(CGPoint)a3;
- (void)cancelDwellAnimation;
- (void)dealloc;
- (void)moveToPoint:(CGPoint)a3;
- (void)orientationDidChange:(id)a3;
- (void)pickPoint;
- (void)pressFingersDown:(BOOL)a3;
- (void)setCurrentPoint:(CGPoint)a3;
- (void)setFingerController:(id)a3;
- (void)setFingersDown:(BOOL)a3;
- (void)setMousePointerAppearance:(id)a3;
- (void)setShouldUpdateZoomLocation:(BOOL)a3;
- (void)setSystemPointerSettingsChangedDebouncer:(id)a3;
- (void)startDwellAnimationWithCompletion:(id)a3;
- (void)viewDidLoad;
@end

@implementation SCATPointerPointPickerViewController

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)SCATPointerPointPickerViewController;
  [(SCATElementManagerViewController *)&v20 viewDidLoad];
  id v3 = objc_alloc_init((Class)AXPIFingerController);
  [(SCATPointerPointPickerViewController *)self setFingerController:v3];

  if (sub_100041014())
  {
    id v4 = objc_alloc_init((Class)AXPISystemPointerLargeAppearance);
    [(SCATPointerPointPickerViewController *)self setMousePointerAppearance:v4];

    id v5 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    [(SCATPointerPointPickerViewController *)self setSystemPointerSettingsChangedDebouncer:v5];

    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)sub_1000A8A2C, kAXSPointerIncreasedContrastPreferenceDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v7 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v7, self, (CFNotificationCallback)sub_1000A8A2C, kAXSPointerSizeMultiplierPreferenceDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v8 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v8, self, (CFNotificationCallback)sub_1000A8A2C, kAXSPointerStrokeColorPreferenceDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v9 = [(SCATPointerPointPickerViewController *)self mousePointerAppearance];

  if (!v9)
  {
    v10 = objc_alloc_init(HNDMousePointerAppearance);
    [(SCATPointerPointPickerViewController *)self setMousePointerAppearance:v10];

    v11 = +[AXSettings sharedInstance];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000A8A34;
    v19[3] = &unk_1001AAA90;
    v19[4] = self;
    [v11 registerUpdateBlock:v19 forRetrieveSelector:"assistiveTouchScannerCursorHighVisibilityEnabled" withListener:self];

    v12 = +[AXSettings sharedInstance];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000A8A70;
    v18[3] = &unk_1001AAA90;
    v18[4] = self;
    [v12 registerUpdateBlock:v18 forRetrieveSelector:"assistiveTouchCursorColor" withListener:self];
  }
  v13 = [(SCATPointerPointPickerViewController *)self mousePointerAppearance];
  v14 = [(SCATPointerPointPickerViewController *)self fingerController];
  [v14 setAppearanceDelegate:v13];

  v15 = [(SCATPointerPointPickerViewController *)self view];
  v16 = [(SCATPointerPointPickerViewController *)self fingerController];
  v17 = [v16 fingerContainerView];
  [v15 addSubview:v17];

  [(SCATPointerPointPickerViewController *)self _updateCursorDrawing];
}

- (void)dealloc
{
  if (sub_100041014())
  {
    id v3 = [(SCATPointerPointPickerViewController *)self systemPointerSettingsChangedDebouncer];
    [v3 cancel];

    [(SCATPointerPointPickerViewController *)self setSystemPointerSettingsChangedDebouncer:0];
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterRemoveEveryObserver(LocalCenter, self);
  }
  v5.receiver = self;
  v5.super_class = (Class)SCATPointerPointPickerViewController;
  [(SCATPointPickerViewController *)&v5 dealloc];
}

- (void)_updateCursorDrawing
{
  id v3 = [(SCATPointerPointPickerViewController *)self mousePointerAppearance];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_super v5 = +[AXSettings sharedInstance];
    if ([v5 assistiveTouchScannerCursorHighVisibilityEnabled]) {
      double v6 = 2.0;
    }
    else {
      double v6 = 1.0;
    }
    v7 = [(SCATPointerPointPickerViewController *)self mousePointerAppearance];
    [v7 setSizeMultiplier:v6];

    id v10 = +[AXSettings sharedInstance];
    id v8 = [v10 assistiveTouchCursorColor];
    v9 = [(SCATPointerPointPickerViewController *)self mousePointerAppearance];
    [v9 setCursorColor:v8];
  }
}

- (void)_systemPointerSettingsDidChange
{
  objc_initWeak(&location, self);
  [(AXDispatchTimer *)self->_systemPointerSettingsChangedDebouncer cancel];
  systemPointerSettingsChangedDebouncer = self->_systemPointerSettingsChangedDebouncer;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A8D1C;
  v4[3] = &unk_1001AAA68;
  objc_copyWeak(&v5, &location);
  [(AXDispatchTimer *)systemPointerSettingsChangedDebouncer afterDelay:v4 processBlock:0.1];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_resetPointer
{
  id v3 = [(SCATPointerPointPickerViewController *)self fingerController];
  [(SCATPointerPointPickerViewController *)self currentPoint];
  objc_msgSend(v3, "clearAllFingersAnimated:endPointForAnimation:", 1);

  [(SCATPointerPointPickerViewController *)self currentPoint];
  id v4 = +[AXPIFingerModel fingerModelForLocation:](AXPIFingerModel, "fingerModelForLocation:");
  id v5 = [(SCATPointerPointPickerViewController *)self fingerController];
  v7 = v4;
  double v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [(SCATPointerPointPickerViewController *)self currentPoint];
  objc_msgSend(v5, "showFingerModels:animated:startPointForAnimation:", v6, 1);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)moveToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = +[UIScreen mainScreen];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  double v11 = fmax(fmin(v8, x), 0.0);
  double v12 = fmax(fmin(v10, y), 0.0);
  v13 = [(SCATPointerPointPickerViewController *)self fingerController];
  id v14 = [v13 numberOfFingers];

  if (!v14)
  {
    [(SCATPointerPointPickerViewController *)self currentPoint];
    v15 = +[AXPIFingerModel fingerModelForLocation:](AXPIFingerModel, "fingerModelForLocation:");
    v16 = [(SCATPointerPointPickerViewController *)self fingerController];
    v23 = v15;
    v17 = +[NSArray arrayWithObjects:&v23 count:1];
    objc_msgSend(v16, "showFingerModels:animated:startPointForAnimation:", v17, 0, CGPointZero.x, CGPointZero.y);
  }
  v18 = [(SCATPointerPointPickerViewController *)self fingerController];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000A9080;
  v22[3] = &unk_1001ADC88;
  *(double *)&v22[4] = v11;
  *(double *)&v22[5] = v12;
  [v18 enumerateFingersUsingBlock:v22];

  if ([(SCATPointerPointPickerViewController *)self fingersDown])
  {
    v19 = +[HNDHandManager sharedManager];
    objc_super v20 = [v19 mainDisplayManager];
    v21 = [v20 fingerController];
    [(SCATPointerPointPickerViewController *)self currentPoint];
    objc_msgSend(v21, "performMoveToPoint:");
  }
  -[SCATPointerPointPickerViewController setCurrentPoint:](self, "setCurrentPoint:", v11, v12);
  if ([(SCATPointerPointPickerViewController *)self shouldUpdateZoomLocation]) {
    -[SCATPointerPointPickerViewController _updateZoomWithDisplayPoint:](self, "_updateZoomWithDisplayPoint:", v11, v12);
  }
}

- (void)pickPoint
{
  id v3 = [(SCATPointPickerViewController *)self pointPicker];
  [(SCATPointerPointPickerViewController *)self currentPoint];
  objc_msgSend(v3, "_savePoint:andNotifyDelegate:", 1);
}

- (void)startDwellAnimationWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(SCATPointerPointPickerViewController *)self fingerController];
  id v5 = +[AXSettings sharedInstance];
  [v5 switchControlCameraPointPickerDwellActivationTimeout];
  objc_msgSend(v6, "performCircularProgressAnimationOnFingersWithDuration:completion:", v4);
}

- (void)cancelDwellAnimation
{
  id v2 = [(SCATPointerPointPickerViewController *)self fingerController];
  [v2 cancelCircularProgressAnimation];
}

- (void)pressFingersDown:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SCATPointerPointPickerViewController *)self fingerController];
  id v6 = [v5 numberOfFingers];

  if (!v6)
  {
    [(SCATPointerPointPickerViewController *)self currentPoint];
    double v7 = +[AXPIFingerModel fingerModelForLocation:](AXPIFingerModel, "fingerModelForLocation:");
    double v8 = [(SCATPointerPointPickerViewController *)self fingerController];
    id v14 = v7;
    double v9 = +[NSArray arrayWithObjects:&v14 count:1];
    objc_msgSend(v8, "showFingerModels:animated:startPointForAnimation:", v9, 0, CGPointZero.x, CGPointZero.y);
  }
  unsigned int v10 = [(SCATPointerPointPickerViewController *)self fingersDown];
  if (v3)
  {
    if (v10) {
      return;
    }
    double v11 = +[HNDHandManager sharedManager];
    double v12 = [v11 mainDisplayManager];
    v13 = [v12 fingerController];
    [(SCATPointerPointPickerViewController *)self currentPoint];
    objc_msgSend(v13, "performDownAtPoint:");
  }
  else
  {
    if (!v10) {
      return;
    }
    double v11 = +[HNDHandManager sharedManager];
    double v12 = [v11 mainDisplayManager];
    v13 = [v12 fingerController];
    [(SCATPointerPointPickerViewController *)self currentPoint];
    objc_msgSend(v13, "performUpAtPoint:");
  }

  [(SCATPointerPointPickerViewController *)self setFingersDown:v3];
}

- (void)orientationDidChange:(id)a3
{
  id v3 = [(SCATPointPickerViewController *)self pointPicker];
  [v3 redisplayIfNeeded:0];
}

- (void)_updateZoomWithDisplayPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (_AXSZoomTouchEnabled())
  {
    id v6 = +[AXSettings sharedInstance];
    id v7 = [v6 assistiveTouchMouseZoomPanningStyle];

    id v12 = +[ZoomServices sharedInstance];
    double v8 = [(SCATPointerPointPickerViewController *)self view];
    double v9 = [v8 window];
    unsigned int v10 = [v9 screen];
    double v11 = [v10 displayIdentity];
    objc_msgSend(v12, "autoPanZoomUsingLocation:withPanningStyle:onDisplay:", v7, objc_msgSend(v11, "displayID"), x, y);
  }
}

- (CGPoint)currentPoint
{
  double x = self->_currentPoint.x;
  double y = self->_currentPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCurrentPoint:(CGPoint)a3
{
  self->_currentPoint = a3;
}

- (BOOL)shouldUpdateZoomLocation
{
  return self->_shouldUpdateZoomLocation;
}

- (void)setShouldUpdateZoomLocation:(BOOL)a3
{
  self->_shouldUpdateZoomLocation = a3;
}

- (AXPIFingerController)fingerController
{
  return self->_fingerController;
}

- (void)setFingerController:(id)a3
{
}

- (AXPIFingerAppearanceDelegate)mousePointerAppearance
{
  return self->_mousePointerAppearance;
}

- (void)setMousePointerAppearance:(id)a3
{
}

- (BOOL)fingersDown
{
  return self->_fingersDown;
}

- (void)setFingersDown:(BOOL)a3
{
  self->_fingersDown = a3;
}

- (AXDispatchTimer)systemPointerSettingsChangedDebouncer
{
  return self->_systemPointerSettingsChangedDebouncer;
}

- (void)setSystemPointerSettingsChangedDebouncer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemPointerSettingsChangedDebouncer, 0);
  objc_storeStrong((id *)&self->_mousePointerAppearance, 0);

  objc_storeStrong((id *)&self->_fingerController, 0);
}

@end