@interface XADEventManager
+ (id)sharedManager;
- (AXEventProcessor)_eventProcessor;
- (BOOL)_initializeAXObserverIfNeeded;
- (BOOL)_iosEventFilter:(id)a3;
- (BOOL)_registeredForNotifications;
- (BOOL)snarfingEvents;
- (BOOL)stopSnarfingOnTouchUp;
- (BSInvalidatable)_disableIdleTimerAssertion;
- (XADEventManager)init;
- (XADEventManagerDelegate)delegate;
- (__AXObserver)_axEventObserver;
- (id)_accessibilityNotificationsToObserve;
- (id)_localizedNotificationString:(int)a3;
- (id)_preprocessEventForSimulator:(id)a3;
- (void)_handleAccessibilityNotification:(int)a3 forElement:(__AXUIElement *)a4;
- (void)_handleFocusMovedToElement:(id)a3;
- (void)_handleIOHIDEvent:(id)a3;
- (void)_handleNativeFocusItemChangedNotification:(__CFData *)a3;
- (void)_registerForAXNotifications:(BOOL)a3;
- (void)_registerForNotifications:(BOOL)a3;
- (void)_setLockScreenDimTimerEnabled:(BOOL)a3;
- (void)_startListening;
- (void)_stopListening;
- (void)_touchedElementAtPoint:(CGPoint)a3;
- (void)connectionInterrupted;
- (void)dealloc;
- (void)deviceDidGetTargeted;
- (void)setDelegate:(id)a3;
- (void)setSnarfingEvents:(BOOL)a3;
- (void)setStopSnarfingOnTouchUp:(BOOL)a3;
- (void)set_axEventObserver:(__AXObserver *)a3;
- (void)set_disableIdleTimerAssertion:(id)a3;
- (void)set_eventProcessor:(id)a3;
- (void)set_registeredForNotifications:(BOOL)a3;
@end

@implementation XADEventManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004758;
  block[3] = &unk_100018870;
  block[4] = a1;
  if (qword_10001E2B0 != -1) {
    dispatch_once(&qword_10001E2B0, block);
  }
  v2 = (void *)qword_10001E2A8;

  return v2;
}

- (XADEventManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)XADEventManager;
  v2 = [(XADEventManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004840;
    block[3] = &unk_100018898;
    v6 = v2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v3;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->__disableIdleTimerAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)XADEventManager;
  [(XADEventManager *)&v3 dealloc];
}

- (void)_touchedElementAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(XADEventManager *)self delegate];
  objc_msgSend(v6, "eventManager:eventToHighlightPoint:", self, x, y);
}

- (void)_setLockScreenDimTimerEnabled:(BOOL)a3
{
  if (byte_10001E0B0 != a3)
  {
    byte_10001E0B0 = a3;
    if (a3)
    {
      v4 = [(XADEventManager *)self _disableIdleTimerAssertion];
      [v4 invalidate];

      [(XADEventManager *)self set_disableIdleTimerAssertion:0];
    }
    else
    {
      id v8 = +[AXUserEventTimer sharedInstance];
      v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      objc_super v7 = [v8 acquireAssertionToDisableIdleTimerWithReason:v6];
      [(XADEventManager *)self set_disableIdleTimerAssertion:v7];
    }
  }
}

- (void)_handleIOHIDEvent:(id)a3
{
  id v20 = [a3 denormalizedEventRepresentation:0 descale:1];
  if ([v20 type] == 3001)
  {
    if ([(XADEventManager *)self stopSnarfingOnTouchUp]
      && ([v20 handInfo],
          id v6 = objc_claimAutoreleasedReturnValue(),
          unsigned int v7 = [v6 currentFingerCount],
          v6,
          !v7))
    {
      [(XADEventManager *)self setSnarfingEvents:0];
      v19 = [(XADEventManager *)self delegate];
      [v19 eventManager:self stoppedSnarfingEvents:1];
    }
    else
    {
      id v8 = [v20 handInfo];
      unsigned int v9 = [v8 eventType];

      if (v9 != 10)
      {
        v10 = [v20 handInfo];
        unsigned int v11 = [v10 eventType];

        if (v11 != 11)
        {
          [v20 neuterUpdates];
          [(XADEventManager *)self _setLockScreenDimTimerEnabled:0];
          v12 = [v20 handInfo];
          v13 = [v12 paths];
          v14 = [v13 firstPath];
          [v14 pathLocation];
          double v16 = v15;
          double v18 = v17;

          -[XADEventManager _touchedElementAtPoint:](self, "_touchedElementAtPoint:", v16, v18);
        }
      }
    }
  }
}

- (id)_preprocessEventForSimulator:(id)a3
{
  objc_super v3 = [a3 denormalizedEventRepresentation:1 descale:1];
  v4 = [v3 handInfo];
  v5 = [v4 paths];
  id v6 = [v5 firstPath];
  [v6 pathLocation];
  double v8 = v7;
  double v10 = v9;

  unsigned int v11 = +[AXBackBoardServer server];
  id v12 = objc_msgSend(v11, "contextIdForPosition:", v8, v10);

  [v3 setContextId:v12];

  return v3;
}

- (BOOL)_iosEventFilter:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && [v4 type]
    && ([v5 type], (AXEventTypeIsVolumeButtonPress() & 1) == 0)
    && [v5 senderID] != (id)0x8000000817319375
    && [v5 type] == 3001)
  {
    id v6 = [v5 handInfo];
    double v7 = [v6 paths];

    if ([v7 count]) {
      [(XADEventManager *)self performSelectorOnMainThread:"_handleIOHIDEvent:" withObject:v5 waitUntilDone:0];
    }

    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_stopListening
{
  id v4 = [(XADEventManager *)self _eventProcessor];
  objc_super v3 = [(XADEventManager *)self _eventProcessor];

  if (v3)
  {
    [(XADEventManager *)self set_eventProcessor:0];
    [v4 endHandlingHIDEventsForReason:@"AccessibilityAudit"];
  }
}

- (void)connectionInterrupted
{
  [(XADEventManager *)self setSnarfingEvents:0];

  [(XADEventManager *)self _registerForNotifications:0];
}

- (void)deviceDidGetTargeted
{
}

- (void)setSnarfingEvents:(BOOL)a3
{
  self->_snarfingEvents = a3;
  if (a3)
  {
    [(XADEventManager *)self _startListening];
  }
  else
  {
    [(XADEventManager *)self _setLockScreenDimTimerEnabled:1];
    [(XADEventManager *)self _stopListening];
  }
}

- (void)_startListening
{
  objc_super v3 = [(XADEventManager *)self _eventProcessor];

  if (!v3)
  {
    id v4 = [objc_alloc((Class)AXEventProcessor) initWithHIDTapIdentifier:@"AccessibilityAudit" HIDEventTapPriority:30 systemEventTapIdentifier:0 systemEventTapPriority:30];
    [(XADEventManager *)self set_eventProcessor:v4];

    v5 = [(XADEventManager *)self _eventProcessor];
    [v5 setHIDEventFilterMask:9];

    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3032000000;
    v10[3] = sub_100004FEC;
    v10[4] = sub_100004FFC;
    id v6 = self;
    unsigned int v11 = v6;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100005004;
    v9[3] = &unk_1000188C0;
    v9[4] = v10;
    double v7 = [(XADEventManager *)v6 _eventProcessor];
    [v7 setHIDEventHandler:v9];

    BOOL v8 = [(XADEventManager *)v6 _eventProcessor];
    [v8 beginHandlingHIDEventsForReason:@"AccessibilityAudit"];

    _Block_object_dispose(v10, 8);
  }
}

- (void)_registerForNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(XADEventManager *)self _registeredForNotifications] != a3)
  {
    [(XADEventManager *)self set_registeredForNotifications:v3];
    [(XADEventManager *)self _registerForAXNotifications:v3];
  }
}

- (BOOL)_initializeAXObserverIfNeeded
{
  if ([(XADEventManager *)self _axEventObserver]) {
    goto LABEL_5;
  }
  AXUIElementRegisterSystemWideServerDeathCallback();
  pid_t pid = 0;
  AXUIElementGetPid((AXUIElementRef)+[AXUIElement systemWideAXUIElement], &pid);
  if (![(XADEventManager *)self _axEventObserver])
  {
    AXObserverRef v7 = 0;
    if (AXObserverCreate(pid, (AXObserverCallback)sub_100005154, &v7))
    {
      LOBYTE(RunLoopSource) = 0;
      return (char)RunLoopSource;
    }
    [(XADEventManager *)self set_axEventObserver:v7];
  }
  CFRunLoopSourceRef RunLoopSource = AXObserverGetRunLoopSource([(XADEventManager *)self _axEventObserver]);
  if (RunLoopSource)
  {
    id v4 = RunLoopSource;
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v4, kCFRunLoopDefaultMode);
LABEL_5:
    LOBYTE(RunLoopSource) = 1;
  }
  return (char)RunLoopSource;
}

- (id)_accessibilityNotificationsToObserve
{
  return &off_100019A78;
}

- (void)_registerForAXNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    [(XADEventManager *)self _initializeAXObserverIfNeeded];
  }
  if ([(XADEventManager *)self _axEventObserver])
  {
    v5 = (const __AXUIElement *)+[AXUIElement systemWideAXUIElement];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = [(XADEventManager *)self _accessibilityNotificationsToObserve];
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
          CFStringRef v11 = (const __CFString *)[*(id *)(*((void *)&v13 + 1) + 8 * i) intValue];
          id v12 = [(XADEventManager *)self _axEventObserver];
          if (v3) {
            AXObserverAddNotification(v12, v5, v11, self);
          }
          else {
            AXObserverRemoveNotification(v12, v5, v11);
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)_handleFocusMovedToElement:(id)a3
{
  id v4 = a3;
  id v5 = [(XADEventManager *)self delegate];
  [v5 eventManager:self systemFocusDidMoveToElement:v4];
}

- (void)_handleNativeFocusItemChangedNotification:(__CFData *)a3
{
  if (a3 && (CFTypeID v5 = CFGetTypeID(a3), v5 == AXUIElementGetTypeID())) {
    id v6 = [objc_alloc((Class)AXElement) initWithAXUIElement:a3];
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  [(XADEventManager *)self _handleFocusMovedToElement:v6];
}

- (void)_handleAccessibilityNotification:(int)a3 forElement:(__AXUIElement *)a4
{
  uint64_t v5 = *(void *)&a3;
  -[XADEventManager _localizedNotificationString:](self, "_localizedNotificationString:");
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [objc_alloc((Class)AXElement) initWithAXUIElement:a4];
  id v8 = [v7 label];
  uint64_t v9 = [v7 value];
  double v10 = [v7 hint];
  CFStringRef v11 = [v7 uiElement];
  id v12 = [v11 objectWithAXAttribute:5019];

  long long v13 = sub_100009560(a4, (const __CFString *)0x836);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 count])
  {
    long long v14 = [v13 componentsJoinedByString:@", "];
  }
  else
  {
    long long v14 = 0;
  }
  long long v15 = [(XADEventManager *)self delegate];
  [v15 eventManager:self notificationReceived:v5 notification:v16 traits:v14 label:v8 value:v9 hint:v10 identifier:v12];
}

- (id)_localizedNotificationString:(int)a3
{
  if ((a3 - 1000) > 9) {
    return 0;
  }
  else {
    return off_1000188E0[a3 - 1000];
  }
}

- (XADEventManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (XADEventManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)snarfingEvents
{
  return self->_snarfingEvents;
}

- (BOOL)stopSnarfingOnTouchUp
{
  return self->_stopSnarfingOnTouchUp;
}

- (void)setStopSnarfingOnTouchUp:(BOOL)a3
{
  self->_stopSnarfingOnTouchUp = a3;
}

- (__AXObserver)_axEventObserver
{
  return self->__axEventObserver;
}

- (void)set_axEventObserver:(__AXObserver *)a3
{
  self->__axEventObserver = a3;
}

- (AXEventProcessor)_eventProcessor
{
  return self->__eventProcessor;
}

- (void)set_eventProcessor:(id)a3
{
}

- (BOOL)_registeredForNotifications
{
  return self->__registeredForNotifications;
}

- (void)set_registeredForNotifications:(BOOL)a3
{
  self->__registeredForNotifications = a3;
}

- (BSInvalidatable)_disableIdleTimerAssertion
{
  return self->__disableIdleTimerAssertion;
}

- (void)set_disableIdleTimerAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__disableIdleTimerAssertion, 0);
  objc_storeStrong((id *)&self->__eventProcessor, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end