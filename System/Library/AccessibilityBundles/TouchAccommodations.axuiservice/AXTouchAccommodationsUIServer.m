@interface AXTouchAccommodationsUIServer
+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3;
+ (id)sharedInstance;
- (AXDispatchTimer)usageConfirmationTimeoutTimer;
- (AXTouchAccommodationsEventProcessor)eventProcessor;
- (AXTouchAccommodationsUIServer)init;
- (AXTouchAccommodationsViewController)viewController;
- (CGPoint)pointWithRespectToSceneReferenceSpace:(CGPoint)a3;
- (NSString)holdDurationTripleClickHelpAlertIdentifier;
- (NSString)touchAccommodationsAlertIdentifier;
- (UIViewController)preventBackgroundViewController;
- (double)desiredWindowLevelForContentViewController:(id)a3 userInteractionEnabled:(BOOL)a4;
- (id)_getPointsArrayFromPathInfoArray:(id)a3;
- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6;
- (void)_addTouchAccommodationsSceneController:(BOOL)a3;
- (void)_disableTouchAccommodations;
- (void)_enableTouchAccommodations;
- (void)_handleUsageConfirmation;
- (void)_hideContentViewController;
- (void)_sendTouchAccommodationsEnabledTipSignal:(BOOL)a3;
- (void)_showBannerWithText:(id)a3 andSubtitleText:(id)a4;
- (void)_showContentViewController;
- (void)_suspendOrResumeTouchAccommodationsAsNeeded;
- (void)_zoomToggledShowController;
- (void)dealloc;
- (void)didStopTimersInEventProcessor:(id)a3;
- (void)eventProcessor:(id)a3 didResetTouchAccommodationsProgressAtPathInfos:(id)a4;
- (void)eventProcessor:(id)a3 didUpdateTouchAccommodationsAtPathInfos:(id)a4;
- (void)panickedHoldDurationInEventProcessor:(id)a3;
- (void)setEventProcessor:(id)a3;
- (void)setHoldDurationTripleClickHelpAlertIdentifier:(id)a3;
- (void)setPreventBackgroundViewController:(id)a3;
- (void)setTouchAccommodationsAlertIdentifier:(id)a3;
- (void)setUsageConfirmationTimeoutTimer:(id)a3;
- (void)setViewController:(id)a3;
- (void)willStartTimersInEventProcessor:(id)a3;
@end

@implementation AXTouchAccommodationsUIServer

+ (id)sharedInstance
{
  if (qword_158C8 != -1) {
    dispatch_once(&qword_158C8, &stru_103B0);
  }
  v2 = (void *)qword_158C0;

  return v2;
}

- (AXTouchAccommodationsUIServer)init
{
  v8.receiver = self;
  v8.super_class = (Class)AXTouchAccommodationsUIServer;
  v2 = [(AXTouchAccommodationsUIServer *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(AXTouchAccommodationsEventProcessor);
    [(AXTouchAccommodationsEventProcessor *)v3 setDelegate:v2];
    [(AXTouchAccommodationsUIServer *)v2 setEventProcessor:v3];
    v4 = objc_alloc_init(AXTouchAccommodationsViewController);
    [(AXTouchAccommodationsUIServer *)v2 setViewController:v4];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_suspendOrResumeTouchAccommodationsAsNeeded" name:UIAccessibilityVoiceOverStatusDidChangeNotification object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"_zoomToggledShowController" name:kAXSZoomTouchEnabledNotification object:0];
  }
  return v2;
}

- (void)_suspendOrResumeTouchAccommodationsAsNeeded
{
  v2 = +[AXSettings sharedInstance];
  unsigned int v3 = [v2 touchAccommodationsEnabled];

  if (v3) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

- (void)_zoomToggledShowController
{
  v2 = +[AXSettings sharedInstance];
  unsigned int v3 = [v2 touchAccommodationsEnabled];

  if (v3) {
    AXPerformBlockAsynchronouslyOnMainThread();
  }
}

- (void)_showBannerWithText:(id)a3 andSubtitleText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = +[AXUIDisplayManager sharedDisplayManager];
  objc_super v8 = [v9 showAlertWithText:v7 subtitleText:v6 iconImage:0 type:2 priority:30 duration:self forService:AXUIAlertDisplayTimeDefaultForBanners];

  [(AXTouchAccommodationsUIServer *)self setTouchAccommodationsAlertIdentifier:v8];
}

- (void)dealloc
{
  unsigned int v3 = [(AXTouchAccommodationsUIServer *)self eventProcessor];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)AXTouchAccommodationsUIServer;
  [(AXTouchAccommodationsUIServer *)&v4 dealloc];
}

- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6
{
  -[AXTouchAccommodationsUIServer setTouchAccommodationsAlertIdentifier:](self, "setTouchAccommodationsAlertIdentifier:", 0, a4, a5, a6);
  switch(a4)
  {
    case 1uLL:
      objc_super v8 = +[AXSettings sharedInstance];
      if ([v8 touchAccommodationsAreConfigured])
      {
        id v9 = AXLocStringKeyForHomeButtonAndExclusiveModel();
        v10 = sub_4084(v9);
      }
      else if ([v8 touchAccommodationsEnabled])
      {
        v10 = sub_4084(@"TOUCH-ACCOMMODATIONS-UNCONFIGURED");
      }
      else
      {
        v10 = 0;
      }
      v29 = +[AXUIDisplayManager sharedDisplayManager];
      v30 = sub_4084(@"TOUCH-ACCOMMODATIONS-DISABLED");
      v31 = [v29 showAlertWithText:v30 subtitleText:v10 iconImage:0 type:2 priority:30 duration:self forService:AXUIAlertDisplayTimeDefaultForBanners];
      [(AXTouchAccommodationsUIServer *)self setTouchAccommodationsAlertIdentifier:v31];

      if (!self->showZoomControllerEnabled) {
        AXPerformBlockOnMainThread();
      }
      [(AXTouchAccommodationsUIServer *)self _disableTouchAccommodations];
      goto LABEL_25;
    case 2uLL:
      if (_AXSVoiceOverTouchEnabled())
      {
        AXPerformBlockOnMainThreadAfterDelay();
      }
      else
      {
        v25 = AXLocStringKeyForHomeButtonAndExclusiveModel();
        v26 = sub_4084(v25);
        v27 = sub_4084(@"TOUCH-ACCOMMODATIONS-ENABLED");
        [(AXTouchAccommodationsUIServer *)self _showBannerWithText:v27 andSubtitleText:v26];

        v28 = +[AXSettings sharedInstance];
        self->showZoomControllerEnabled = [v28 zoomShouldShowSlug];

        if (!self->showZoomControllerEnabled)
        {
          AXPerformBlockOnMainThread();
          if (_UIAccessibilityZoomTouchEnabled()) {
            AXPerformBlockOnMainThreadAfterDelay();
          }
        }
      }
      [(AXTouchAccommodationsUIServer *)self _enableTouchAccommodations];
      break;
    case 3uLL:
      if (!_AXSVoiceOverTouchEnabled())
      {
        v11 = [(AXTouchAccommodationsUIServer *)self holdDurationTripleClickHelpAlertIdentifier];

        if (v11) {
          _AXAssert();
        }
        v12 = [(AXTouchAccommodationsUIServer *)self holdDurationTripleClickHelpAlertIdentifier];

        if (v12)
        {
          v13 = +[AXUIDisplayManager sharedDisplayManager];
          v14 = [(AXTouchAccommodationsUIServer *)self holdDurationTripleClickHelpAlertIdentifier];
          [v13 hideAlertWithIdentifier:v14 forService:self];
        }
        v15 = +[AXSettings sharedInstance];
        [v15 touchAccommodationsHoldDuration];
        double v17 = v16;

        objc_super v8 = sub_4084(@"HOLD_DURATION_TRIPLE_CLICK_HELP_FORMAT");
        v18 = sub_4084(@"HOLD_DURATION_TRIPLE_CLICK_HELP_FORMAT_SUBTITLE");
        float v19 = v17;
        v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v19);

        v20 = +[AXUIDisplayManager sharedDisplayManager];
        v21 = [v20 showAlertWithText:v8 subtitleText:v10 iconImage:0 type:2 priority:30 duration:self forService:AXUIAlertDisplayTimeForever];
        [(AXTouchAccommodationsUIServer *)self setHoldDurationTripleClickHelpAlertIdentifier:v21];

LABEL_25:
      }
      break;
    case 4uLL:
      v22 = [(AXTouchAccommodationsUIServer *)self holdDurationTripleClickHelpAlertIdentifier];

      if (v22)
      {
        v23 = +[AXUIDisplayManager sharedDisplayManager];
        v24 = [(AXTouchAccommodationsUIServer *)self holdDurationTripleClickHelpAlertIdentifier];
        [v23 hideAlertWithIdentifier:v24 forService:self];

        [(AXTouchAccommodationsUIServer *)self setHoldDurationTripleClickHelpAlertIdentifier:0];
      }
      break;
    default:
      return 0;
  }
  return 0;
}

+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3
{
  return @"com.apple.accessibility.BackBoard";
}

- (void)_enableTouchAccommodations
{
  unsigned int v3 = [(AXTouchAccommodationsUIServer *)self eventProcessor];
  [v3 beginHandlingHIDEventsForReason:@"Touch Accommodations wants them"];

  [(AXTouchAccommodationsUIServer *)self _handleUsageConfirmation];
  [(AXTouchAccommodationsUIServer *)self _sendTouchAccommodationsEnabledTipSignal:1];

  [(AXTouchAccommodationsUIServer *)self _addTouchAccommodationsSceneController:1];
}

- (void)_disableTouchAccommodations
{
  unsigned int v3 = [(AXTouchAccommodationsUIServer *)self eventProcessor];
  [v3 endHandlingHIDEventsForReason:@"Touch Accommodations wants them"];

  [(AXTouchAccommodationsUIServer *)self _sendTouchAccommodationsEnabledTipSignal:0];

  [(AXTouchAccommodationsUIServer *)self _addTouchAccommodationsSceneController:0];
}

- (void)_addTouchAccommodationsSceneController:(BOOL)a3
{
  if (a3) {
    [(AXTouchAccommodationsUIServer *)self _showContentViewController];
  }
  else {
    [(AXTouchAccommodationsUIServer *)self _hideContentViewController];
  }
}

- (void)_showContentViewController
{
  unsigned int v3 = [(AXTouchAccommodationsUIServer *)self preventBackgroundViewController];
  if (!v3)
  {
    id v5 = (id)objc_opt_new();
    objc_super v4 = +[AXUIDisplayManager sharedDisplayManager];
    [v4 addContentViewController:v5 withUserInteractionEnabled:0 forService:self context:0 completion:&stru_10458];

    [(AXTouchAccommodationsUIServer *)self setPreventBackgroundViewController:v5];
    unsigned int v3 = v5;
  }
}

- (void)_hideContentViewController
{
  id v4 = [(AXTouchAccommodationsUIServer *)self preventBackgroundViewController];
  if (v4)
  {
    unsigned int v3 = +[AXUIDisplayManager sharedDisplayManager];
    [v3 removeContentViewController:v4 withUserInteractionEnabled:0 forService:self context:0 completion:&stru_10478];

    [(AXTouchAccommodationsUIServer *)self setPreventBackgroundViewController:0];
  }
}

- (void)_sendTouchAccommodationsEnabledTipSignal:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[BMStreams discoverabilitySignal];
  id v5 = [v4 source];
  id v6 = objc_alloc((Class)BMDiscoverabilitySignalEvent);
  CFStringRef v10 = @"enabled";
  id v7 = +[NSNumber numberWithBool:v3];
  v11 = v7;
  objc_super v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v9 = [v6 initWithIdentifier:@"com.apple.accessibility.AccessibilityUIServer.touchaccommodations-ios-enabled" bundleID:@"com.apple.accessibility.AccessibilityUIServer" context:@"AccessibilityUIServer" userInfo:v8];

  [v5 sendEvent:v9];
}

- (void)_handleUsageConfirmation
{
  BOOL v3 = +[AXSettings sharedInstance];
  if (([v3 touchAccommodationsUsageConfirmed] & 1) == 0)
  {
    id v4 = +[AXSpringBoardServer server];
    objc_super v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    CFStringRef v10 = sub_4EC0;
    v11 = &unk_104A0;
    id v12 = v3;
    v13 = self;
    [v4 showAlert:6 withHandler:&v8];

    id v5 = [(AXTouchAccommodationsUIServer *)self usageConfirmationTimeoutTimer];
    [v5 cancel];

    id v6 = objc_alloc_init((Class)AXDispatchTimer);
    [(AXTouchAccommodationsUIServer *)self setUsageConfirmationTimeoutTimer:v6];

    id v7 = [(AXTouchAccommodationsUIServer *)self usageConfirmationTimeoutTimer];
    [v7 afterDelay:&stru_104C0 processBlock:30.0];
  }
}

- (void)willStartTimersInEventProcessor:(id)a3
{
}

- (void)didStopTimersInEventProcessor:(id)a3
{
}

- (CGPoint)pointWithRespectToSceneReferenceSpace:(CGPoint)a3
{
  id v4 = [(AXTouchAccommodationsUIServer *)self viewController];
  id v5 = [v4 view];
  id v6 = [v5 window];
  if (v6)
  {
    id v7 = [(AXTouchAccommodationsUIServer *)self viewController];
    objc_super v8 = [v7 view];
    uint64_t v9 = [v8 window];
    AXDenormalizePoint();
    objc_msgSend(v9, "_convertPointFromSceneReferenceSpace:");
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    AXDenormalizePoint();
    double v11 = v14;
    double v13 = v15;
  }

  double v16 = v11;
  double v17 = v13;
  result.y = v17;
  result.x = v16;
  return result;
}

- (id)_getPointsArrayFromPathInfoArray:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "pathLocation", (void)v13);
        -[AXTouchAccommodationsUIServer pointWithRespectToSceneReferenceSpace:](self, "pointWithRespectToSceneReferenceSpace:");
        double v11 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)eventProcessor:(id)a3 didUpdateTouchAccommodationsAtPathInfos:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AXPerformBlockAsynchronouslyOnMainThread();
}

- (void)eventProcessor:(id)a3 didResetTouchAccommodationsProgressAtPathInfos:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AXPerformBlockAsynchronouslyOnMainThread();
}

- (void)panickedHoldDurationInEventProcessor:(id)a3
{
}

- (double)desiredWindowLevelForContentViewController:(id)a3 userInteractionEnabled:(BOOL)a4
{
  double result = UIWindowLevelNormal;
  if (self->_viewController == a3) {
    return 10000019.0;
  }
  return result;
}

- (NSString)holdDurationTripleClickHelpAlertIdentifier
{
  return self->_holdDurationTripleClickHelpAlertIdentifier;
}

- (void)setHoldDurationTripleClickHelpAlertIdentifier:(id)a3
{
}

- (NSString)touchAccommodationsAlertIdentifier
{
  return self->_touchAccommodationsAlertIdentifier;
}

- (void)setTouchAccommodationsAlertIdentifier:(id)a3
{
}

- (AXTouchAccommodationsEventProcessor)eventProcessor
{
  return self->_eventProcessor;
}

- (void)setEventProcessor:(id)a3
{
}

- (AXDispatchTimer)usageConfirmationTimeoutTimer
{
  return self->_usageConfirmationTimeoutTimer;
}

- (void)setUsageConfirmationTimeoutTimer:(id)a3
{
}

- (AXTouchAccommodationsViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (UIViewController)preventBackgroundViewController
{
  return self->_preventBackgroundViewController;
}

- (void)setPreventBackgroundViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preventBackgroundViewController, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_usageConfirmationTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_eventProcessor, 0);
  objc_storeStrong((id *)&self->_touchAccommodationsAlertIdentifier, 0);

  objc_storeStrong((id *)&self->_holdDurationTripleClickHelpAlertIdentifier, 0);
}

@end