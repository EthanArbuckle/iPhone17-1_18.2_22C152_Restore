@interface AXLocalizationCaptionMonitor
+ (id)monitor;
- (AXEventProcessor)processor;
- (AXLocalizationCaptionMonitor)init;
- (BOOL)lockUI;
- (OS_dispatch_queue)handlingQueue;
- (id)elementCallback;
- (id)pointInsideCallback;
- (void)_handleTouchEvent:(id)a3;
- (void)setElementCallback:(id)a3;
- (void)setHandlingQueue:(id)a3;
- (void)setLockUI:(BOOL)a3;
- (void)setPointInsideCallback:(id)a3;
- (void)setProcessor:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation AXLocalizationCaptionMonitor

+ (id)monitor
{
  if (qword_D658 != -1) {
    dispatch_once(&qword_D658, &stru_82B0);
  }
  v2 = (void *)qword_D650;

  return v2;
}

- (AXLocalizationCaptionMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXLocalizationCaptionMonitor;
  v2 = [(AXLocalizationCaptionMonitor *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("AXLocalizationCaptionMonitor", 0);
    [(AXLocalizationCaptionMonitor *)v2 setHandlingQueue:v3];

    v4 = v2;
  }

  return v2;
}

- (void)_handleTouchEvent:(id)a3
{
  id v21 = a3;
  v4 = [v21 handInfo];
  unsigned int v5 = [v4 eventType];

  if (v5 == 1)
  {
    id v6 = objc_alloc((Class)AXDispatchTimer);
    v7 = dispatch_get_global_queue(0, 0);
    v8 = (AXDispatchTimer *)[v6 initWithTargetSerialQueue:v7];
    downTimer = self->_downTimer;
    self->_downTimer = v8;

    [(AXDispatchTimer *)self->_downTimer afterDelay:&stru_82D0 processBlock:1.0];
  }
  else if (([v21 isLift] & 1) != 0 {
         || ([v21 isCancel] & 1) != 0
  }
         || [v21 isInRangeLift])
  {
    [(AXDispatchTimer *)self->_downTimer cancel];
    v10 = self->_downTimer;
    self->_downTimer = 0;
  }
  v11 = [v21 handInfo];
  if ([v11 eventType] == 1)
  {
  }
  else
  {
    v12 = [v21 handInfo];
    unsigned int v13 = [v12 eventType];

    if (v13 != 2)
    {
      v20 = v21;
      goto LABEL_14;
    }
  }
  v14 = [v21 denormalizedEventRepresentation:0 descale:1];

  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
  v15 = [v14 handInfo];
  v16 = [v15 paths];
  v17 = [v16 firstPath];
  [v17 pathLocation];
  v18 = +[AXElement elementAtCoordinate:withVisualPadding:](AXElement, "elementAtCoordinate:withVisualPadding:", 0);

  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();
  if (v18)
  {
    v19 = [(AXLocalizationCaptionMonitor *)self elementCallback];
    ((void (**)(void, void *))v19)[2](v19, v18);
  }
  v20 = v14;
LABEL_14:
}

- (void)startMonitoring
{
  dispatch_queue_t v3 = [(AXLocalizationCaptionMonitor *)self processor];

  if (!v3)
  {
    [(AXLocalizationCaptionMonitor *)self _initializeAccessibility];
    id v4 = [objc_alloc((Class)AXEventProcessor) initWithHIDTapIdentifier:@"LocQACaptions" HIDEventTapPriority:70 systemEventTapIdentifier:0 systemEventTapPriority:10];
    [(AXLocalizationCaptionMonitor *)self setProcessor:v4];

    objc_initWeak(&location, self);
    objc_copyWeak(&v9, &location);
    unsigned int v5 = [(AXLocalizationCaptionMonitor *)self processor];
    [v5 setHIDEventHandler:&v8];

    id v6 = [(AXLocalizationCaptionMonitor *)self processor];
    [v6 setHIDEventFilterMask:1];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  v7 = [(AXLocalizationCaptionMonitor *)self processor];
  [v7 beginHandlingHIDEventsForReason:@"LocQACaptions"];
}

- (void)stopMonitoring
{
  dispatch_queue_t v3 = [(AXLocalizationCaptionMonitor *)self processor];
  unsigned int v4 = [v3 isHandlingHIDEvents];

  if (v4)
  {
    unsigned int v5 = [(AXLocalizationCaptionMonitor *)self processor];
    [v5 endHandlingHIDEventsForReason:@"LocQACaptions"];

    [(AXLocalizationCaptionMonitor *)self _endAccessibility];
  }
}

- (BOOL)lockUI
{
  return self->_lockUI;
}

- (void)setLockUI:(BOOL)a3
{
  self->_lockUI = a3;
}

- (id)elementCallback
{
  return self->_elementCallback;
}

- (void)setElementCallback:(id)a3
{
}

- (id)pointInsideCallback
{
  return self->_pointInsideCallback;
}

- (void)setPointInsideCallback:(id)a3
{
}

- (AXEventProcessor)processor
{
  return self->_processor;
}

- (void)setProcessor:(id)a3
{
}

- (OS_dispatch_queue)handlingQueue
{
  return self->_handlingQueue;
}

- (void)setHandlingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlingQueue, 0);
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong(&self->_pointInsideCallback, 0);
  objc_storeStrong(&self->_elementCallback, 0);

  objc_storeStrong((id *)&self->_downTimer, 0);
}

@end