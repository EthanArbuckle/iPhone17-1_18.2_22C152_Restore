@interface AXBackTapUIServer
+ (id)possibleRequiredEntitlementsForProcessingMessageWithIdentifier:(unint64_t)a3;
+ (id)sharedInstance;
- (AXBackTapUIServer)init;
- (AXEventProcessor)eventProcessor;
- (AXPhoenixGestureDetector)gestureDetector;
- (BOOL)gestureDetectorRunning;
- (NSString)activeAlertIdentifier;
- (NSString)confirmAlertIdentifier;
- (NSString)reportAlertIdentifier;
- (UIViewController)backTapViewController;
- (double)desiredWindowLevelForAlertWithIdentifier:(id)a3;
- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6;
- (void)_addBackTapViewController:(id)a3;
- (void)_confirmFalsePositiveReportForFilename:(id)a3;
- (void)_hideContentViewController;
- (void)_registerForBackTapEvents;
- (void)_serverEnabled;
- (void)_showContentViewController:(id)a3;
- (void)_startGestureDetector;
- (void)_stopGestureDetector;
- (void)_unregisterForBackTapEvents;
- (void)_updateBackTapPolicy:(unint64_t)a3;
- (void)_updateClickSpeed;
- (void)alertWithIdentifierDidAppear:(id)a3;
- (void)alertWithIdentifierDidDisappear:(id)a3;
- (void)alertWithIdentifierWasActivated:(id)a3 userInfo:(id)a4;
- (void)dealloc;
- (void)phoenixClassifierDidLogFile:(id)a3;
- (void)phoenixGestureDetector:(id)a3 failedWithError:(id)a4;
- (void)phoenixGestureDetector:(id)a3 stoppedWithError:(id)a4;
- (void)phoenixGestureDetectorDidDetectDoubleTap:(id)a3;
- (void)phoenixGestureDetectorDidDetectTripleTap:(id)a3;
- (void)setActiveAlertIdentifier:(id)a3;
- (void)setBackTapViewController:(id)a3;
- (void)setConfirmAlertIdentifier:(id)a3;
- (void)setEventProcessor:(id)a3;
- (void)setGestureDetector:(id)a3;
- (void)setGestureDetectorRunning:(BOOL)a3;
- (void)setReportAlertIdentifier:(id)a3;
@end

@implementation AXBackTapUIServer

+ (id)sharedInstance
{
  if (qword_CE58 != -1) {
    dispatch_once(&qword_CE58, &stru_8260);
  }
  v2 = (void *)qword_CE50;

  return v2;
}

- (AXBackTapUIServer)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXBackTapUIServer;
  v2 = [(AXBackTapUIServer *)&v7 init];
  if (v2 && AXDeviceSupportsBackTap())
  {
    objc_initWeak(&location, v2);
    objc_copyWeak(&v5, &location);
    v4 = v2;
    AXPerformBlockOnMainThread();

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  [(AXBackTapUIServer *)self _unregisterForBackTapEvents];
  v3.receiver = self;
  v3.super_class = (Class)AXBackTapUIServer;
  [(AXBackTapUIServer *)&v3 dealloc];
}

- (void)_registerForBackTapEvents
{
  objc_super v3 = (AXEventProcessor *)[objc_alloc((Class)AXEventProcessor) initWithHIDTapIdentifier:@"System back tap" HIDEventTapPriority:10 systemEventTapIdentifier:0 systemEventTapPriority:0];
  eventProcessor = self->_eventProcessor;
  self->_eventProcessor = v3;

  [(AXEventProcessor *)self->_eventProcessor setHIDEventFilterMask:32];
  [(AXEventProcessor *)self->_eventProcessor setHIDEventHandler:&stru_82F0];
  id v5 = self->_eventProcessor;

  [(AXEventProcessor *)v5 beginHandlingHIDEventsForReason:@"System back tap"];
}

- (void)_unregisterForBackTapEvents
{
  [(AXEventProcessor *)self->_eventProcessor endHandlingHIDEventsForReason:@"System back tap"];
  eventProcessor = self->_eventProcessor;

  [(AXEventProcessor *)eventProcessor cleanup];
}

- (void)_updateClickSpeed
{
  _AXSHomeClickSpeed();
  float v4 = v3;
  if (AXDeviceHasHomeButton())
  {
    float v5 = v4;
  }
  else
  {
    _AXSSideButtonClickSpeed();
    if (fabsf(v6 + -1.2) >= 0.01)
    {
      float v5 = 0.5;
      if (fabsf(v6 + -0.7) >= 0.01)
      {
        float v5 = v4;
        if (fabsf(v6 + -0.4) < 0.01) {
          float v5 = 0.35;
        }
      }
    }
    else
    {
      float v5 = 0.7;
    }
  }
  id v8 = [(AXBackTapUIServer *)self gestureDetector];
  *(float *)&double v7 = v5;
  [v8 setTapSpeed:v7];
}

+ (id)possibleRequiredEntitlementsForProcessingMessageWithIdentifier:(unint64_t)a3
{
  return +[NSSet setWithArray:&off_8680];
}

- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  switch(a4)
  {
    case 0x2710uLL:
      v11 = [v9 objectForKey:AXBackTapClientRegistrationKeyPolicy];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        -[AXBackTapUIServer _updateBackTapPolicy:](self, "_updateBackTapPolicy:", [v11 unsignedIntegerValue]);
        [(AXBackTapUIServer *)self _startGestureDetector];
      }
      goto LABEL_6;
    case 0x2711uLL:
      [(AXBackTapUIServer *)self _stopGestureDetector];
      break;
    case 0x2712uLL:
      v11 = [(AXBackTapUIServer *)self gestureDetector];
      [(AXBackTapUIServer *)self phoenixGestureDetectorDidDetectDoubleTap:v11];
      goto LABEL_6;
    case 0x2713uLL:
      v11 = [(AXBackTapUIServer *)self gestureDetector];
      [(AXBackTapUIServer *)self phoenixGestureDetectorDidDetectTripleTap:v11];
LABEL_6:

      break;
    default:
      break;
  }

  return 0;
}

- (void)_updateBackTapPolicy:(unint64_t)a3
{
  if ((a3 & 3) == 2)
  {
    double v7 = [(AXBackTapUIServer *)self gestureDetector];
    [v7 setTripleTapPolicy];

    float v4 = AXLogBackTap();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      float v5 = "Set triple tap policy in phoenix gesture detector";
      float v6 = (uint8_t *)&v10;
      goto LABEL_9;
    }
  }
  else if ((a3 & 3) == 1)
  {
    float v3 = [(AXBackTapUIServer *)self gestureDetector];
    [v3 setDoubleTapPolicy];

    float v4 = AXLogBackTap();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      float v5 = "Set double tap policy in phoenix gesture detector";
      float v6 = (uint8_t *)&v11;
LABEL_9:
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else
  {
    id v8 = [(AXBackTapUIServer *)self gestureDetector];
    [v8 setGeneralPolicy];

    float v4 = AXLogBackTap();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      float v5 = "Set general policy in phoenix gesture detector";
      float v6 = (uint8_t *)&v9;
      goto LABEL_9;
    }
  }
}

- (void)_startGestureDetector
{
  if (![(AXBackTapUIServer *)self gestureDetectorRunning])
  {
    float v3 = AXLogBackTap();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Starting gesture detector from AXBackTap", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    float v4 = [(AXBackTapUIServer *)self gestureDetector];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_446C;
    v5[3] = &unk_8318;
    objc_copyWeak(&v6, buf);
    v5[4] = self;
    [v4 startWithCompletion:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

- (void)_stopGestureDetector
{
  if ([(AXBackTapUIServer *)self gestureDetectorRunning])
  {
    float v3 = AXLogBackTap();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Stopping gesture detector from AXBackTap", buf, 2u);
    }

    float v4 = [(AXBackTapUIServer *)self gestureDetector];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_45CC;
    v5[3] = &unk_8340;
    v5[4] = self;
    [v4 stopWithCompletion:v5];
  }
}

- (void)setGestureDetectorRunning:(BOOL)a3
{
  self->_gestureDetectorRunning = a3;
  AXPerformBlockOnMainThread();
}

- (void)_serverEnabled
{
  v2 = +[AXSettings sharedInstance];
  float v3 = [v2 backTapDoubleTapAction];
  uint64_t v4 = AXASTSiriShortcutPrefixName;
  if ([v3 hasPrefix:AXASTSiriShortcutPrefixName])
  {
  }
  else
  {
    float v5 = +[AXSettings sharedInstance];
    id v6 = [v5 backTapTripleTapAction];
    unsigned int v7 = [v6 hasPrefix:v4];

    if (!v7) {
      goto LABEL_5;
    }
  }
  id v8 = +[AXSiriShortcutsManager sharedManager];
LABEL_5:
  __int16 v9 = +[AXPISystemActionHelper sharedInstance];
  [v9 warm];

  __int16 v10 = AXLogBackTap();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v11 = 0;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Server enabled, warming up shortcuts and AXPI", v11, 2u);
  }
}

- (double)desiredWindowLevelForAlertWithIdentifier:(id)a3
{
  return UISpringBoardLockScreenWindowLevel + 3.0;
}

- (void)alertWithIdentifierDidAppear:(id)a3
{
}

- (void)alertWithIdentifierDidDisappear:(id)a3
{
  id v4 = a3;
  float v5 = [(AXBackTapUIServer *)self activeAlertIdentifier];
  unsigned int v6 = [v5 isEqualToString:v4];

  if (v6)
  {
    [(AXBackTapUIServer *)self setActiveAlertIdentifier:0];
  }
}

- (void)alertWithIdentifierWasActivated:(id)a3 userInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[AXUIDisplayManager sharedDisplayManager];
  __int16 v9 = [(AXBackTapUIServer *)self activeAlertIdentifier];
  [v8 hideAlertWithIdentifier:v9 forService:self];

  __int16 v10 = [(AXBackTapUIServer *)self reportAlertIdentifier];
  LODWORD(v9) = [v7 isEqualToString:v10];

  if (v9)
  {
    __int16 v11 = accessibilityLocalizedString(@"confirm.alert.message.title");
    v12 = +[AXSettings sharedInstance];
    if ([v12 backTapRNNModelEnabled]) {
      v13 = @"confirm.alert.message.message.rnn";
    }
    else {
      v13 = @"confirm.alert.message.message";
    }
    v14 = accessibilityLocalizedString(v13);
    v15 = +[UIAlertController alertControllerWithTitle:v11 message:v14 preferredStyle:1];

    v16 = accessibilityLocalizedString(@"confirm.alert.action.cancel");
    v17 = +[UIAlertAction actionWithTitle:v16 style:1 handler:0];
    [v15 addAction:v17];

    v18 = accessibilityLocalizedString(@"confirm.alert.action.confirm");
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_4AC8;
    v24 = &unk_8390;
    v25 = self;
    id v26 = v6;
    v19 = +[UIAlertAction actionWithTitle:v18 style:0 handler:&v21];

    objc_msgSend(v15, "addAction:", v19, v21, v22, v23, v24, v25);
    v20 = [(AXBackTapUIServer *)self backTapViewController];
    [v20 presentViewController:v15 animated:1 completion:0];
  }
}

- (void)_confirmFalsePositiveReportForFilename:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    float v5 = AXLogBackTap();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Tapped on false positive alert for filename: %@", buf, 0xCu);
    }

    id v6 = [(AXBackTapUIServer *)self gestureDetector];
    [v6 reportFalsePositive:v4];

    id v7 = +[AXUIDisplayManager sharedDisplayManager];
    id v8 = accessibilityLocalizedString(@"confirmation.alert.message.title");
    __int16 v9 = accessibilityLocalizedString(@"confirmation.alert.message.subtitle");
    __int16 v10 = [v7 showAlertWithText:v8 subtitleText:v9 iconImage:0 type:3 priority:30 duration:0 userInfo:3.0 forService:self];
    [(AXBackTapUIServer *)self setConfirmAlertIdentifier:v10];
  }
}

- (void)_addBackTapViewController:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(AXBackTapUIServer *)self gestureDetectorRunning])
  {
    [(AXBackTapUIServer *)self _showContentViewController:v4];
  }
  else
  {
    [(AXBackTapUIServer *)self _hideContentViewController];
    if (v4) {
      v4[2]();
    }
  }
}

- (void)_showContentViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(AXBackTapUIServer *)self backTapViewController];
  if (!v5)
  {
    id v6 = AXLogBackTap();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Showing Scene View Controller for Back Tap", (uint8_t *)buf, 2u);
    }

    id v7 = objc_opt_new();
    objc_initWeak(buf, self);
    id v8 = +[AXUIDisplayManager sharedDisplayManager];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_4EAC;
    v9[3] = &unk_83B8;
    objc_copyWeak(&v12, buf);
    id v5 = v7;
    id v10 = v5;
    id v11 = v4;
    [v8 addContentViewController:v5 withUserInteractionEnabled:1 forService:self context:0 completion:v9];

    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }
}

- (void)_hideContentViewController
{
  float v3 = [(AXBackTapUIServer *)self backTapViewController];
  if (v3)
  {
    id v4 = AXLogBackTap();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Hiding Scene View Controller for Back Tap", v6, 2u);
    }

    id v5 = +[AXUIDisplayManager sharedDisplayManager];
    [v5 removeContentViewController:v3 withUserInteractionEnabled:0 forService:self];

    [(AXBackTapUIServer *)self setBackTapViewController:0];
  }
}

- (void)phoenixClassifierDidLogFile:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockAsynchronouslyOnMainThread();
}

- (void)phoenixGestureDetectorDidDetectDoubleTap:(id)a3
{
  id v7 = +[AXEventRepresentation accessibilityEventRepresentationWithSender:4 usagePage:1 usage:1];
  id v3 = +[AXEventTapManager sharedManager];
  [v3 sendHIDSystemEvent:v7 senderID:0x8000000817319381];

  id v4 = +[AXSettings sharedInstance];
  id v5 = (char *)[v4 backTapUsageCount] + 1;
  id v6 = +[AXSettings sharedInstance];
  [v6 setBackTapUsageCount:v5];
}

- (void)phoenixGestureDetectorDidDetectTripleTap:(id)a3
{
  id v7 = +[AXEventRepresentation accessibilityEventRepresentationWithSender:4 usagePage:1 usage:2];
  id v3 = +[AXEventTapManager sharedManager];
  [v3 sendHIDSystemEvent:v7 senderID:0x8000000817319381];

  id v4 = +[AXSettings sharedInstance];
  id v5 = (char *)[v4 backTapUsageCount] + 1;
  id v6 = +[AXSettings sharedInstance];
  [v6 setBackTapUsageCount:v5];
}

- (void)phoenixGestureDetector:(id)a3 failedWithError:(id)a4
{
  id v4 = a4;
  id v5 = AXLogBackTap();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_56A4((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (void)phoenixGestureDetector:(id)a3 stoppedWithError:(id)a4
{
  id v4 = a4;
  id v5 = AXLogBackTap();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Phoenix gesture detector stopped: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (AXPhoenixGestureDetector)gestureDetector
{
  return self->_gestureDetector;
}

- (void)setGestureDetector:(id)a3
{
}

- (BOOL)gestureDetectorRunning
{
  return self->_gestureDetectorRunning;
}

- (NSString)activeAlertIdentifier
{
  return self->_activeAlertIdentifier;
}

- (void)setActiveAlertIdentifier:(id)a3
{
}

- (NSString)confirmAlertIdentifier
{
  return self->_confirmAlertIdentifier;
}

- (void)setConfirmAlertIdentifier:(id)a3
{
}

- (NSString)reportAlertIdentifier
{
  return self->_reportAlertIdentifier;
}

- (void)setReportAlertIdentifier:(id)a3
{
}

- (AXEventProcessor)eventProcessor
{
  return self->_eventProcessor;
}

- (void)setEventProcessor:(id)a3
{
}

- (UIViewController)backTapViewController
{
  return self->_backTapViewController;
}

- (void)setBackTapViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backTapViewController, 0);
  objc_storeStrong((id *)&self->_eventProcessor, 0);
  objc_storeStrong((id *)&self->_reportAlertIdentifier, 0);
  objc_storeStrong((id *)&self->_confirmAlertIdentifier, 0);
  objc_storeStrong((id *)&self->_activeAlertIdentifier, 0);

  objc_storeStrong((id *)&self->_gestureDetector, 0);
}

@end