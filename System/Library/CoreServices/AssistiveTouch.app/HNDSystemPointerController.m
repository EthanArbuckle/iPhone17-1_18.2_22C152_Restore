@interface HNDSystemPointerController
- (BKSHIDEventPointerAttributes)currentSystemPointerPointAttributes;
- (BOOL)_accessibilityShouldIgnoreEventRep:(id)a3;
- (BOOL)_handleRepostedButtonEventWithTimestamp:(unint64_t)a3 buttonMask:(unsigned int)a4 senderID:(unint64_t)a5;
- (BOOL)handleEventRepresentationForMovement:(id)a3;
- (BOOL)handleEventRepresentationFromFilter:(id)a3;
- (CGPoint)currentAbsoluteSystemPointerPoint;
- (CGPoint)currentSystemPointerPoint;
- (HNDSystemPointerController)init;
- (NSMutableDictionary)disabledIDMappingRegistry;
- (NSMutableSet)hidePointerClients;
- (NSString)currentSystemPointerHardwareIdentifier;
- (OS_dispatch_queue)pointConversionQueue;
- (id)_localDataForAttributes:(id)a3;
- (id)customizableMouseForEventSenderID:(unint64_t)a3 serviceClient:(__IOHIDServiceClient *)a4;
- (unsigned)buttonMaskForSenderID:(unint64_t)a3;
- (void)_finishHandlingEventRepresentation:(id)a3 forButtonsWithSenderID:(unint64_t)a4 lastButtonMask:(unsigned int)a5 buttonMask:(unsigned int)a6;
- (void)_recordAndRepostEventRepresentation:(id)a3 forButtonsWithSenderID:(unint64_t)a4 buttonMask:(unsigned int)a5;
- (void)_recordRepostedButtonEventWithTimestamp:(unint64_t)a3 buttonMask:(unsigned int)a4 senderID:(unint64_t)a5;
- (void)addPointerStreamObserver:(id)a3;
- (void)cleanup;
- (void)clearCachedCustomizableMouse;
- (void)dealloc;
- (void)hideSystemPointer:(BOOL)a3;
- (void)hideSystemPointer:(BOOL)a3 forClient:(id)a4;
- (void)informDelegatesOfEvent:(id)a3;
- (void)removeGlobalMouseEventsForDisplayID:(unsigned int)a3;
- (void)removePointerStreamObserver:(id)a3;
- (void)requestGlobalMouseEventsForDisplay:(id)a3 displayID:(unsigned int)a4 targetContextID:(unsigned int)a5;
- (void)setButtonMask:(unsigned int)a3 forSenderID:(unint64_t)a4;
- (void)setCurrentAbsoluteSystemPointerPoint:(CGPoint)a3;
- (void)setCurrentAbsoluteSystemPointerPoint:(CGPoint)a3 withAttributes:(id)a4 pointerAttributes:(id)a5;
- (void)setCurrentSystemPointerHardwareIdentifier:(id)a3;
- (void)setCurrentSystemPointerPoint:(CGPoint)a3;
- (void)setCurrentSystemPointerPointAttributes:(id)a3;
- (void)setDisabledIDMappingRegistry:(id)a3;
- (void)setHidePointerClients:(id)a3;
- (void)setPointConversionQueue:(id)a3;
- (void)updateSensitivityMultiplier;
@end

@implementation HNDSystemPointerController

- (HNDSystemPointerController)init
{
  v34.receiver = self;
  v34.super_class = (Class)HNDSystemPointerController;
  v2 = [(HNDSystemPointerController *)&v34 init];
  v3 = v2;
  if (v2)
  {
    v2->_buttonMaskLock._os_unfair_lock_opaque = 0;
    v2->_customizableMouseLock._os_unfair_lock_opaque = 0;
    v2->_repostedButtonEventsLock._os_unfair_lock_opaque = 0;
    v2->_currentPointerPointLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = +[NSMutableArray array];
    pointerStreamData = v3->_pointerStreamData;
    v3->_pointerStreamData = (NSMutableArray *)v4;

    uint64_t v6 = +[NSMutableDictionary dictionary];
    buttonMaskBySenderID = v3->_buttonMaskBySenderID;
    v3->_buttonMaskBySenderID = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    pointerClientController = v3->_pointerClientController;
    v3->_pointerClientController = (PSPointerClientController *)v8;

    [(PSPointerClientController *)v3->_pointerClientController setDelegate:v3];
    v3->_currentSystemPointerPoint = (CGPoint)HNDPointNull;
    v3->_currentAbsoluteSystemPointerPoint = (CGPoint)HNDPointNull;
    uint64_t v10 = +[NSMutableDictionary dictionary];
    customizableMouseBySenderID = v3->_customizableMouseBySenderID;
    v3->_customizableMouseBySenderID = (NSMutableDictionary *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.AssistiveTouch.HNDSystemPointerController.ObserverQueue", 0);
    observerQueue = v3->_observerQueue;
    v3->_observerQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.AssistiveTouch.HNDSystemPointerController.PointConversionQueue", 0);
    pointConversionQueue = v3->_pointConversionQueue;
    v3->_pointConversionQueue = (OS_dispatch_queue *)v14;

    objc_initWeak(&location, v3);
    v16 = +[AXSettings sharedInstance];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100079AF4;
    v31[3] = &unk_1001AAA68;
    objc_copyWeak(&v32, &location);
    [v16 registerUpdateBlock:v31 forRetrieveSelector:"assistiveTouchMouseCustomizedClickActions" withListener:v3];

    objc_destroyWeak(&v32);
    v17 = +[AXSettings sharedInstance];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100079B34;
    v29[3] = &unk_1001AAA68;
    objc_copyWeak(&v30, &location);
    [v17 registerUpdateBlock:v29 forRetrieveSelector:"assistiveTouchSpeed" withListener:v3];

    objc_destroyWeak(&v30);
    [(HNDSystemPointerController *)v3 updateSensitivityMultiplier];
    uint64_t v18 = +[NSString stringWithFormat:@"%@-%p", objc_opt_class(), v3];
    eventTapIdentifier = v3->_eventTapIdentifier;
    v3->_eventTapIdentifier = (NSString *)v18;

    v20 = (AXEventProcessor *)[objc_alloc((Class)AXEventProcessor) initWithHIDTapIdentifier:v3->_eventTapIdentifier HIDEventTapPriority:26 systemEventTapIdentifier:0 systemEventTapPriority:0];
    eventProcessor = v3->_eventProcessor;
    v3->_eventProcessor = v20;

    [(AXEventProcessor *)v3->_eventProcessor setHIDEventFilterMask:16];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100079B74;
    v27[3] = &unk_1001ACF78;
    objc_copyWeak(&v28, &location);
    [(AXEventProcessor *)v3->_eventProcessor setHIDEventHandler:v27];
    [(AXEventProcessor *)v3->_eventProcessor beginHandlingHIDEventsForReason:v3->_eventTapIdentifier];
    v22 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    hidePointerClients = v3->_hidePointerClients;
    v3->_hidePointerClients = v22;

    uint64_t v24 = +[NSMutableDictionary dictionary];
    disabledIDMappingRegistry = v3->_disabledIDMappingRegistry;
    v3->_disabledIDMappingRegistry = (NSMutableDictionary *)v24;

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)requestGlobalMouseEventsForDisplay:(id)a3 displayID:(unsigned int)a4 targetContextID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v11 = (id)objc_opt_new();
  [v11 setHardwareIdentifier:v8];
  [v11 setContextID:v5];
  [v11 setDisplayID:v6];
  v9 = +[BKSMousePointerService sharedInstance];
  uint64_t v10 = [v9 requestGlobalMouseEventsForDisplay:v8 targetContextID:v5];

  [v11 setPointerStream:v10];
  [(NSMutableArray *)self->_pointerStreamData addObject:v11];
}

- (void)removeGlobalMouseEventsForDisplayID:(unsigned int)a3
{
  pointerStreamData = self->_pointerStreamData;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100079D5C;
  v8[3] = &unk_1001ACF98;
  unsigned int v9 = a3;
  uint64_t v5 = [(NSMutableArray *)pointerStreamData axFirstObjectsUsingBlock:v8];
  uint64_t v6 = v5;
  if (v5)
  {
    v7 = [v5 pointerStream];
    [v7 invalidate];

    [(NSMutableArray *)self->_pointerStreamData removeObject:v6];
  }
}

- (void)cleanup
{
  [(NSMutableArray *)self->_pointerStreamData enumerateObjectsUsingBlock:&stru_1001ACFD8];
  pointerStreamData = self->_pointerStreamData;

  [(NSMutableArray *)pointerStreamData removeAllObjects];
}

- (void)dealloc
{
  [(HNDSystemPointerController *)self cleanup];
  [(PSPointerClientController *)self->_pointerClientController invalidate];
  [(BSInvalidatable *)self->_hidePointerAssertion invalidate];
  [(AXEventProcessor *)self->_eventProcessor endHandlingHIDEventsForReason:self->_eventTapIdentifier];
  v3.receiver = self;
  v3.super_class = (Class)HNDSystemPointerController;
  [(HNDSystemPointerController *)&v3 dealloc];
}

- (CGPoint)currentSystemPointerPoint
{
  p_currentPointerPointLock = &self->_currentPointerPointLock;
  os_unfair_lock_lock(&self->_currentPointerPointLock);
  CGFloat x = self->_currentSystemPointerPoint.x;
  CGFloat y = self->_currentSystemPointerPoint.y;
  os_unfair_lock_unlock(p_currentPointerPointLock);
  double v6 = x;
  double v7 = y;
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

- (void)setCurrentSystemPointerPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  p_currentPointerPointLock = &self->_currentPointerPointLock;
  os_unfair_lock_lock(&self->_currentPointerPointLock);
  self->_currentSystemPointerPoint.CGFloat x = x;
  self->_currentSystemPointerPoint.CGFloat y = y;

  os_unfair_lock_unlock(p_currentPointerPointLock);
}

- (CGPoint)currentAbsoluteSystemPointerPoint
{
  p_currentPointerPointLock = &self->_currentPointerPointLock;
  os_unfair_lock_lock(&self->_currentPointerPointLock);
  CGFloat x = self->_currentAbsoluteSystemPointerPoint.x;
  CGFloat y = self->_currentAbsoluteSystemPointerPoint.y;
  os_unfair_lock_unlock(p_currentPointerPointLock);
  double v6 = x;
  double v7 = y;
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

- (void)setCurrentAbsoluteSystemPointerPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  p_currentPointerPointLock = &self->_currentPointerPointLock;
  os_unfair_lock_lock(&self->_currentPointerPointLock);
  self->_currentAbsoluteSystemPointerPoint.CGFloat x = x;
  self->_currentAbsoluteSystemPointerPoint.CGFloat y = y;

  os_unfair_lock_unlock(p_currentPointerPointLock);
}

- (void)setCurrentAbsoluteSystemPointerPoint:(CGPoint)a3 withAttributes:(id)a4 pointerAttributes:(id)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  unsigned int v9 = (BKSHIDEventPointerAttributes *)a5;
  id v10 = a4;
  os_unfair_lock_lock(&self->_currentPointerPointLock);
  self->_currentAbsoluteSystemPointerPoint.CGFloat x = x;
  self->_currentAbsoluteSystemPointerPoint.CGFloat y = y;
  currentSystemPointerPointAttributes = self->_currentSystemPointerPointAttributes;
  self->_currentSystemPointerPointAttributes = v9;
  dispatch_queue_t v12 = v9;

  v13 = [v10 display];

  dispatch_queue_t v14 = [v13 safeStringForKey:@"_hardwareIdentifier"];
  currentSystemPointerHardwareIdentifier = self->_currentSystemPointerHardwareIdentifier;
  self->_currentSystemPointerHardwareIdentifier = v14;

  os_unfair_lock_unlock(&self->_currentPointerPointLock);
}

- (BKSHIDEventPointerAttributes)currentSystemPointerPointAttributes
{
  p_currentPointerPointLock = &self->_currentPointerPointLock;
  os_unfair_lock_lock(&self->_currentPointerPointLock);
  uint64_t v4 = self->_currentSystemPointerPointAttributes;
  os_unfair_lock_unlock(p_currentPointerPointLock);

  return v4;
}

- (void)setCurrentSystemPointerPointAttributes:(id)a3
{
  uint64_t v4 = (BKSHIDEventPointerAttributes *)a3;
  os_unfair_lock_lock(&self->_currentPointerPointLock);
  currentSystemPointerPointAttributes = self->_currentSystemPointerPointAttributes;
  self->_currentSystemPointerPointAttributes = v4;

  os_unfair_lock_unlock(&self->_currentPointerPointLock);
}

- (unsigned)buttonMaskForSenderID:(unint64_t)a3
{
  p_buttonMaskLock = &self->_buttonMaskLock;
  os_unfair_lock_lock(&self->_buttonMaskLock);
  buttonMaskBySenderID = self->_buttonMaskBySenderID;
  double v7 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v8 = [(NSMutableDictionary *)buttonMaskBySenderID objectForKey:v7];

  os_unfair_lock_unlock(p_buttonMaskLock);
  LODWORD(v7) = [v8 intValue];

  return v7;
}

- (void)setButtonMask:(unsigned int)a3 forSenderID:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  p_buttonMaskLock = &self->_buttonMaskLock;
  os_unfair_lock_lock(&self->_buttonMaskLock);
  buttonMaskBySenderID = self->_buttonMaskBySenderID;
  unsigned int v9 = +[NSNumber numberWithUnsignedInt:v5];
  id v10 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)buttonMaskBySenderID setObject:v9 forKey:v10];

  os_unfair_lock_unlock(p_buttonMaskLock);
}

- (void)updateSensitivityMultiplier
{
  id v4 = +[AXSettings sharedInstance];
  [v4 assistiveTouchSpeed];
  self->_cachedSensitivityMultiplier = v3;
}

- (void)clearCachedCustomizableMouse
{
  p_customizableMouseLock = &self->_customizableMouseLock;
  os_unfair_lock_lock(&self->_customizableMouseLock);
  [(NSMutableDictionary *)self->_customizableMouseBySenderID removeAllObjects];

  os_unfair_lock_unlock(p_customizableMouseLock);
}

- (id)customizableMouseForEventSenderID:(unint64_t)a3 serviceClient:(__IOHIDServiceClient *)a4
{
  if (+[HNDVirtualHIDMouse eventServiceID] == a3) {
    goto LABEL_2;
  }
  p_customizableMouseLock = &self->_customizableMouseLock;
  os_unfair_lock_lock(&self->_customizableMouseLock);
  customizableMouseBySenderID = self->_customizableMouseBySenderID;
  id v10 = +[NSNumber numberWithUnsignedLongLong:a3];
  double v7 = [(NSMutableDictionary *)customizableMouseBySenderID objectForKey:v10];

  os_unfair_lock_unlock(&self->_customizableMouseLock);
  if (!v7)
  {
    if (!a4 || (CFTypeID v12 = CFGetTypeID(a4), v12 != IOHIDServiceClientGetTypeID()))
    {
LABEL_2:
      double v7 = 0;
      goto LABEL_4;
    }
    double v7 = +[AXCustomizableMouse mouseForHIDServiceClient:a4];
    if (v7)
    {
      os_unfair_lock_lock(&self->_customizableMouseLock);
      v13 = self->_customizableMouseBySenderID;
      dispatch_queue_t v14 = +[NSNumber numberWithUnsignedLongLong:a3];
      [(NSMutableDictionary *)v13 setObject:v7 forKey:v14];

      os_unfair_lock_unlock(p_customizableMouseLock);
    }
  }
LABEL_4:

  return v7;
}

- (BOOL)handleEventRepresentationForMovement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 pointerControllerInfo];
  BOOL v6 = 0;
  if ([v4 type] == 3200 && v5)
  {
    if ([v5 pointerIsAbsolute])
    {
      [v5 pointerX];
      double v8 = v7;
      [v5 pointerY];
      double v10 = v9;
      if (vabdd_f64(*(double *)&qword_1001F0AC8, v8) >= 0.1 || vabdd_f64(*(double *)&qword_1001F0AD0, v9) >= 0.1)
      {
        qword_1001F0AC8 = *(void *)&v8;
        qword_1001F0AD0 = *(void *)&v9;
        id v11 = [(HNDSystemPointerController *)self pointConversionQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10007A588;
        block[3] = &unk_1001AD000;
        id v14 = v4;
        v15 = self;
        double v17 = v8;
        double v18 = v10;
        id v16 = v5;
        dispatch_async(v11, block);
      }
      BOOL v6 = 1;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)_localDataForAttributes:(id)a3
{
  id v4 = [a3 display];
  uint64_t v5 = [v4 safeStringForKey:@"_hardwareIdentifier"];

  pointerStreamData = self->_pointerStreamData;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007A8F0;
  v10[3] = &unk_1001AD028;
  id v7 = v5;
  id v11 = v7;
  double v8 = [(NSMutableArray *)pointerStreamData axFirstObjectsUsingBlock:v10];
  if (!v8)
  {
    double v8 = [(NSMutableArray *)self->_pointerStreamData axFirstObjectsUsingBlock:&stru_1001AD068];
  }

  return v8;
}

- (BOOL)handleEventRepresentationFromFilter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 pointerControllerInfo];
  BOOL v6 = 0;
  if ([v4 type] == 3200 && v5)
  {
    if ([(HNDSystemPointerController *)self _accessibilityShouldIgnoreEventRep:v4])
    {
      goto LABEL_16;
    }
    id v7 = [v4 accessibilityData];
    id v8 = [v7 usage];

    if (v8 != (id)4)
    {
      double v9 = +[HNDHandManager sharedManager];
      unsigned __int8 v10 = [v9 lastMoveWasMouse];

      if ((v10 & 1) == 0)
      {
        [v4 creatorHIDEvent];
        id v11 = BKSHIDEventGetBaseAttributes();
        CFTypeID v12 = [(HNDSystemPointerController *)self _localDataForAttributes:v11];
        if (v12)
        {
          v13 = +[HNDHandManager sharedManager];
          id v14 = [v12 hardwareIdentifier];
          v15 = [v13 displayManagerForHardwareIdentifier:v14];

          [v15 screenPoint];
          double v17 = v16;
          double v19 = v18;
          v20 = +[BKSMousePointerService sharedInstance];
          id v21 = objc_msgSend(objc_alloc((Class)BKSContextRelativePoint), "initWithPoint:contextID:", objc_msgSend(v12, "contextID"), v17, v19);
          [v20 setContextRelativePointerPosition:v21 onDisplay:0 withAnimationParameters:0 restrictingToPID:0xFFFFFFFFLL];

          -[HNDSystemPointerController setCurrentAbsoluteSystemPointerPoint:](self, "setCurrentAbsoluteSystemPointerPoint:", v17, v19);
          v22 = [v15 hardwareIdentifier];
          [(HNDSystemPointerController *)self setCurrentSystemPointerHardwareIdentifier:v22];
        }
      }
      v23 = +[HNDHandManager sharedManager];
      [v5 pointerX];
      double v25 = v24;
      [v5 pointerAccelX];
      double v27 = v25 + v26;
      [v5 pointerY];
      double v29 = v28;
      [v5 pointerAccelY];
      objc_msgSend(v23, "mouseEventRecordedWithDelta:", v27, v29 + v30);
    }
    id v31 = [v4 senderID];
    [v5 pointerButtonMask];
    uint64_t v33 = v32;
    if (-[HNDSystemPointerController _handleRepostedButtonEventWithTimestamp:buttonMask:senderID:](self, "_handleRepostedButtonEventWithTimestamp:buttonMask:senderID:", [v4 HIDTime], v33, v31))
    {
      goto LABEL_16;
    }
    if ([(HNDSystemPointerController *)self buttonMaskForSenderID:v31] == v33)
    {
      objc_super v34 = [v4 pointerControllerInfo];
      if (([v34 pointerIsAbsolute] & 1) != 0
        || (id v35 = [v4 senderID],
            v35 == (id)+[HNDVirtualHIDMouse eventServiceID])
        || vabdd_f64(self->_cachedSensitivityMultiplier, kAXSAssistiveTouchSpeedDefault) < 0.001)
      {

LABEL_16:
        BOOL v6 = 0;
        goto LABEL_17;
      }
      unsigned int v38 = [v5 isPointerMove];

      if (!v38) {
        goto LABEL_16;
      }
      id v40 = v4;
      AXPerformBlockAsynchronouslyOnMainThread();
      v37 = v40;
    }
    else
    {
      [(HNDSystemPointerController *)self setButtonMask:v33 forSenderID:v31];
      id v39 = v4;
      AXPerformBlockAsynchronouslyOnMainThread();
      v37 = v39;
    }

    BOOL v6 = 1;
  }
LABEL_17:

  return v6;
}

- (BOOL)_handleRepostedButtonEventWithTimestamp:(unint64_t)a3 buttonMask:(unsigned int)a4 senderID:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  double v9 = objc_opt_new();
  [v9 setTimestamp:a3];
  [v9 setButtonMask:v6];
  p_repostedButtonEventsLock = &self->_repostedButtonEventsLock;
  os_unfair_lock_lock(&self->_repostedButtonEventsLock);
  repostedButtonEventsBySenderID = self->_repostedButtonEventsBySenderID;
  CFTypeID v12 = +[NSNumber numberWithUnsignedLongLong:a5];
  v13 = [(NSMutableDictionary *)repostedButtonEventsBySenderID objectForKeyedSubscript:v12];

  unsigned int v14 = [v13 containsObject:v9];
  if (v14) {
    [v13 removeObject:v9];
  }
  os_unfair_lock_unlock(p_repostedButtonEventsLock);

  return v14;
}

- (void)_recordRepostedButtonEventWithTimestamp:(unint64_t)a3 buttonMask:(unsigned int)a4 senderID:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  double v9 = objc_opt_new();
  [v9 setTimestamp:a3];
  [v9 setButtonMask:v6];
  p_repostedButtonEventsLock = &self->_repostedButtonEventsLock;
  os_unfair_lock_lock(&self->_repostedButtonEventsLock);
  repostedButtonEventsBySenderID = self->_repostedButtonEventsBySenderID;
  if (!repostedButtonEventsBySenderID)
  {
    CFTypeID v12 = +[NSMutableDictionary dictionary];
    v13 = self->_repostedButtonEventsBySenderID;
    self->_repostedButtonEventsBySenderID = v12;

    repostedButtonEventsBySenderID = self->_repostedButtonEventsBySenderID;
  }
  unsigned int v14 = +[NSNumber numberWithUnsignedLongLong:a5];
  v15 = [(NSMutableDictionary *)repostedButtonEventsBySenderID objectForKeyedSubscript:v14];

  if (!v15)
  {
    v15 = +[NSCountedSet set];
    double v16 = self->_repostedButtonEventsBySenderID;
    double v17 = +[NSNumber numberWithUnsignedLongLong:a5];
    [(NSMutableDictionary *)v16 setObject:v15 forKeyedSubscript:v17];
  }
  if ([v15 containsObject:v9])
  {
    double v18 = ASTLogMouse();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_100114E24((uint64_t)v9, v18);
    }
  }
  [v15 addObject:v9];
  os_unfair_lock_unlock(p_repostedButtonEventsLock);
}

- (void)_finishHandlingEventRepresentation:(id)a3 forButtonsWithSenderID:(unint64_t)a4 lastButtonMask:(unsigned int)a5 buttonMask:(unsigned int)a6
{
  id v10 = a3;
  id v11 = objc_alloc_init(HNDEvent);
  [(HNDSystemPointerController *)self currentSystemPointerPoint];
  -[HNDEvent setLocation:](v11, "setLocation:");
  unint64_t v29 = a4;
  id v31 = -[HNDSystemPointerController customizableMouseForEventSenderID:serviceClient:](self, "customizableMouseForEventSenderID:serviceClient:", a4, [v10 creatorHIDServiceClient]);
  unsigned int v30 = a6;
  v13 = sub_1000423E0(a5, a6);
  unsigned int v14 = [v13 upButton];
  v15 = [v13 downButton];
  double v16 = v15;
  if (v14)
  {
    uint64_t v17 = 2;
    v15 = v14;
  }
  else
  {
    if (!v15) {
      goto LABEL_6;
    }
    uint64_t v17 = 1;
  }
  id v18 = [v15 integerValue];
  [(HNDEvent *)v11 setType:v17];
  [(HNDEvent *)v11 setButtonNumber:v18];
  double v19 = [v31 customActionForButtonNumber:v18];
  [(HNDEvent *)v11 setActionOverride:v19];

  v20 = [(HNDSystemPointerController *)self currentSystemPointerHardwareIdentifier];
  [(HNDEvent *)v11 setHardwareIdentifier:v20];

LABEL_6:
  id v21 = +[HNDHandManager sharedManager];
  if ([v21 shouldHandleSystemPointerButtonEvent:v11])
  {
  }
  else
  {
    double v28 = v16;
    unsigned int v22 = a5;
    v23 = v12;
    double v24 = +[HNDHandManager sharedManager];
    unsigned __int8 v25 = [v24 hitTestsViewAtSystemPointerPoint];

    if ((v25 & 1) == 0) {
      [(HNDSystemPointerController *)self _recordAndRepostEventRepresentation:v10 forButtonsWithSenderID:v29 buttonMask:v30];
    }
    CFTypeID v12 = v23;
    a5 = v22;
    double v16 = v28;
  }
  double v26 = ASTLogMouse();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    double v27 = NSStringFromBOOL();
    *(_DWORD *)buf = 134219010;
    unint64_t v33 = v29;
    __int16 v34 = 1024;
    unsigned int v35 = v30;
    __int16 v36 = 1024;
    unsigned int v37 = a5;
    __int16 v38 = 2112;
    id v39 = v27;
    __int16 v40 = 2112;
    v41 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "senderID=%llu, buttonMask=%u, lastButtonMask=%u, shouldFilterEvent=%@, event=%@", buf, 0x2Cu);
  }
  [(HNDSystemPointerController *)self informDelegatesOfEvent:v11];
}

- (void)_recordAndRepostEventRepresentation:(id)a3 forButtonsWithSenderID:(unint64_t)a4 buttonMask:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  -[HNDSystemPointerController _recordRepostedButtonEventWithTimestamp:buttonMask:senderID:](self, "_recordRepostedButtonEventWithTimestamp:buttonMask:senderID:", [v8 HIDTime], v5, a4);
  id v9 = +[AXEventTapManager sharedManager];
  [v9 sendHIDSystemEvent:v8 repostCreatorHIDEvent:1 senderID:a4];
}

- (BOOL)_accessibilityShouldIgnoreEventRep:(id)a3
{
  id v4 = (__IOHIDServiceClient *)[a3 creatorHIDServiceClient];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = IOHIDServiceClientGetRegistryID(v4);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(HNDSystemPointerController *)self disabledIDMappingRegistry];
      id v8 = [v7 objectForKeyedSubscript:v6];

      if (v8)
      {
        LOBYTE(v5) = [v8 BOOLValue];
      }
      else
      {
        id v10 = (void *)IOHIDServiceClientCopyProperty(v5, @"DisableAccessibilityEventTranslation");
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v5 = (__IOHIDServiceClient *)[v10 BOOLValue];
        }
        else {
          uint64_t v5 = 0;
        }
        id v11 = [(HNDSystemPointerController *)self disabledIDMappingRegistry];
        CFTypeID v12 = +[NSNumber numberWithBool:v5];
        [v11 setObject:v12 forKey:v6];
      }
    }
    else
    {
      id v9 = ASTLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100114E9C((uint64_t)v6, v9);
      }

      LOBYTE(v5) = 0;
    }
  }
  return (char)v5;
}

- (void)informDelegatesOfEvent:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007B660;
  v7[3] = &unk_1001AAC78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

- (void)addPointerStreamObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007B7F0;
  v7[3] = &unk_1001AAC78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

- (void)removePointerStreamObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007B8F0;
  v7[3] = &unk_1001AAC78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

- (void)hideSystemPointer:(BOOL)a3
{
}

- (void)hideSystemPointer:(BOOL)a3 forClient:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  hidePointerClients = self->_hidePointerClients;
  if (v4)
  {
    [(NSMutableSet *)hidePointerClients addObject:v6];
    if (!self->_hidePointerAssertion)
    {
      id v8 = [(PSPointerClientController *)self->_pointerClientController persistentlyHidePointerAssertionForReason:3];
      hidePointerAssertion = self->_hidePointerAssertion;
      self->_hidePointerAssertion = v8;

      id v10 = ASTLogMouse();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        __int16 v16 = 0;
        id v11 = "hideSystemPointer = YES";
        CFTypeID v12 = (uint8_t *)&v16;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v11, v12, 2u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  else
  {
    [(NSMutableSet *)hidePointerClients removeObject:v6];
    if (![(NSMutableSet *)self->_hidePointerClients count])
    {
      v13 = self->_hidePointerAssertion;
      if (v13)
      {
        [(BSInvalidatable *)v13 invalidate];
        unsigned int v14 = self->_hidePointerAssertion;
        self->_hidePointerAssertion = 0;

        id v10 = ASTLogMouse();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          __int16 v15 = 0;
          id v11 = "hideSystemPointer = NO";
          CFTypeID v12 = (uint8_t *)&v15;
          goto LABEL_9;
        }
LABEL_10:
      }
    }
  }
}

- (NSString)currentSystemPointerHardwareIdentifier
{
  return self->_currentSystemPointerHardwareIdentifier;
}

- (void)setCurrentSystemPointerHardwareIdentifier:(id)a3
{
}

- (OS_dispatch_queue)pointConversionQueue
{
  return self->_pointConversionQueue;
}

- (void)setPointConversionQueue:(id)a3
{
}

- (NSMutableSet)hidePointerClients
{
  return self->_hidePointerClients;
}

- (void)setHidePointerClients:(id)a3
{
}

- (NSMutableDictionary)disabledIDMappingRegistry
{
  return self->_disabledIDMappingRegistry;
}

- (void)setDisabledIDMappingRegistry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledIDMappingRegistry, 0);
  objc_storeStrong((id *)&self->_hidePointerClients, 0);
  objc_storeStrong((id *)&self->_pointConversionQueue, 0);
  objc_storeStrong((id *)&self->_currentSystemPointerHardwareIdentifier, 0);
  objc_storeStrong((id *)&self->_currentSystemPointerPointAttributes, 0);
  objc_storeStrong((id *)&self->_eventProcessor, 0);
  objc_storeStrong((id *)&self->_eventTapIdentifier, 0);
  objc_storeStrong((id *)&self->_repostedButtonEventsBySenderID, 0);
  objc_storeStrong((id *)&self->_customizableMouseBySenderID, 0);
  objc_storeStrong((id *)&self->_buttonMaskBySenderID, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_pointerStreamObservers, 0);
  objc_storeStrong((id *)&self->_pointerClientController, 0);
  objc_storeStrong((id *)&self->_hidePointerAssertion, 0);

  objc_storeStrong((id *)&self->_pointerStreamData, 0);
}

@end