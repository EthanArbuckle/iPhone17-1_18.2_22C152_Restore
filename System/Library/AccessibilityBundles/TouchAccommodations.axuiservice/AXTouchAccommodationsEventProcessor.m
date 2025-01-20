@interface AXTouchAccommodationsEventProcessor
- (AXEventRepresentation)event;
- (AXEventRepresentation)finalTouchEvent;
- (AXEventRepresentation)initialTouchEvent;
- (AXTouchAccommodationsEventProcessor)init;
- (AXTouchAccommodationsEventProcessor)initWithHIDTapIdentifier:(id)a3 HIDEventTapPriority:(int)a4 systemEventTapIdentifier:(id)a5 systemEventTapPriority:(int)a6;
- (AXTouchAccommodationsEventProcessorDelegate)delegate;
- (BOOL)_bypassForSwipeGestureDueToEvent:(id)a3;
- (BOOL)_handleEvent:(id)a3;
- (BOOL)_handleTimerEvents;
- (BOOL)_isLiftEvent:(unsigned int)a3;
- (BOOL)_shouldAllowBypassForSwipeGestures;
- (BOOL)_shouldPassAlongWithoutHandlingEvent:(id)a3;
- (BOOL)canBeginIgnoreRepeatTimer;
- (BOOL)shouldSendFakeTouchDownIfNeeded;
- (double)_distanceBetweenPath:(id)a3 otherPath:(id)a4;
- (double)_minimumDistanceForSwipeGestureBypass;
- (id)_pathAtInitialTouchForPathIndex:(unint64_t)a3;
- (id)_pathAtPreviousPointForPathIndex:(unint64_t)a3;
- (void)_clearEventsToReplayForSwipeGestureBypass;
- (void)_endHoldDurationAndAllowTapAssistance:(BOOL)a3;
- (void)_handleEventAfterTimerEnd;
- (void)_handleHoldDurationAfterTimerBegan;
- (void)_handleTapActivationAfterTimerBegan;
- (void)_handleTapActivationMethodActivateOnRelease;
- (void)_handleTapActivationMethodActivateOnTouch;
- (void)_initiateHoldDurationTimer;
- (void)_initiateIgnoreRepeatTimer;
- (void)_initiateTapTimeoutTimer;
- (void)_notifyUserEventOccurred;
- (void)_processTimerEventsFromCurrentState;
- (void)_sendFakeEvent:(id)a3 forTheFirstTime:(BOOL)a4;
- (void)_sendFakeEventAfterTimerEnded:(id)a3;
- (void)_sendHIDEventUnconditionally:(id)a3 shouldUseOriginalTime:(BOOL)a4;
- (void)_setTimerState:(int64_t)a3;
- (void)_trackUpdateStatusForEvent:(id)a3;
- (void)_updateTouchAccommodationsBasedOnTapActivation;
- (void)dealloc;
- (void)disableSleepTimer:(BOOL)a3;
- (void)setCanBeginIgnoreRepeatTimer:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEvent:(id)a3;
- (void)setFinalTouchEvent:(id)a3;
- (void)setInitialTouchEvent:(id)a3;
- (void)setShouldSendFakeTouchDownIfNeeded:(BOOL)a3;
@end

@implementation AXTouchAccommodationsEventProcessor

- (AXTouchAccommodationsEventProcessor)initWithHIDTapIdentifier:(id)a3 HIDEventTapPriority:(int)a4 systemEventTapIdentifier:(id)a5 systemEventTapPriority:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  v41.receiver = self;
  v41.super_class = (Class)AXTouchAccommodationsEventProcessor;
  v12 = [(AXTouchAccommodationsEventProcessor *)&v41 initWithHIDTapIdentifier:v10 HIDEventTapPriority:v8 systemEventTapIdentifier:v11 systemEventTapPriority:v6];
  if (v12)
  {
    uint64_t v13 = +[NSMutableSet set];
    sentGenerationsAnticipatingUpdate = v12->_sentGenerationsAnticipatingUpdate;
    v12->_sentGenerationsAnticipatingUpdate = (NSMutableSet *)v13;

    v12->_touchEventAfterIgnoreRepeatTimerBegan = 0;
    v12->_generationsLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v12);
    v15 = +[AXSettings sharedInstance];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_7308;
    v37[3] = &unk_10560;
    v16 = v12;
    v38 = v16;
    objc_copyWeak(&v39, &location);
    [v15 registerUpdateBlock:v37 forRetrieveSelector:"touchAccommodationsIgnoreRepeatEnabled" withListener:v16];

    objc_destroyWeak(&v39);
    [(AXTouchAccommodationsEventProcessor *)v16 setHIDEventFilterMask:1];
    v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v18 = dispatch_queue_create("TouchAccommodationsHIDDispatchQueue", v17);
    hidDispatchQueue = v16->_hidDispatchQueue;
    v16->_hidDispatchQueue = (OS_dispatch_queue *)v18;

    v32 = _NSConcreteStackBlock;
    uint64_t v33 = 3221225472;
    v34 = sub_7458;
    v35 = &unk_10588;
    objc_copyWeak(&v36, &location);
    [(AXTouchAccommodationsEventProcessor *)v16 setHIDEventHandler:&v32];
    id v20 = objc_allocWithZone((Class)AXDispatchTimer);
    v21 = (AXDispatchTimer *)objc_msgSend(v20, "initWithTargetSerialQueue:", v16->_hidDispatchQueue, v32, v33, v34, v35);
    tapTimeoutTimer = v16->_tapTimeoutTimer;
    v16->_tapTimeoutTimer = v21;

    [(AXDispatchTimer *)v16->_tapTimeoutTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    v23 = (AXDispatchTimer *)[objc_allocWithZone((Class)AXDispatchTimer) initWithTargetSerialQueue:v16->_hidDispatchQueue];
    holdDurationTimer = v16->_holdDurationTimer;
    v16->_holdDurationTimer = v23;

    v25 = (AXDispatchTimer *)[objc_allocWithZone((Class)AXDispatchTimer) initWithTargetSerialQueue:v16->_hidDispatchQueue];
    ignoreRepeatTimer = v16->_ignoreRepeatTimer;
    v16->_ignoreRepeatTimer = v25;

    v27 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:v16->_hidDispatchQueue];
    updateSetMaintenanceTimer = v16->_updateSetMaintenanceTimer;
    v16->_updateSetMaintenanceTimer = v27;

    [(AXDispatchTimer *)v16->_updateSetMaintenanceTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    v16->_shouldSendFakeTouchDownIfNeeded = 1;
    dispatch_queue_t v29 = dispatch_queue_create("TouchAccommodationsEventsToReplay", 0);
    eventsToReplayLock = v16->_eventsToReplayLock;
    v16->_eventsToReplayLock = (OS_dispatch_queue *)v29;

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (AXTouchAccommodationsEventProcessor)init
{
  return [(AXTouchAccommodationsEventProcessor *)self initWithHIDTapIdentifier:TouchAccommodationsHIDEventTapIdentifier HIDEventTapPriority:35 systemEventTapIdentifier:0 systemEventTapPriority:0];
}

- (void)dealloc
{
  [(AXDispatchTimer *)self->_tapTimeoutTimer cancel];
  [(AXDispatchTimer *)self->_holdDurationTimer cancel];
  [(AXDispatchTimer *)self->_ignoreRepeatTimer cancel];
  [(BSInvalidatable *)self->_sleepTimerDisabledAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AXTouchAccommodationsEventProcessor;
  [(AXTouchAccommodationsEventProcessor *)&v3 dealloc];
}

- (void)_setTimerState:(int64_t)a3
{
  int64_t state = self->_state;
  if (state == a3)
  {
    if (a3 == 2)
    {
      self->_int64_t state = 2;
      [(AXTouchAccommodationsEventProcessor *)self _initiateTapTimeoutTimer];
      uint64_t v6 = [(AXTouchAccommodationsEventProcessor *)self delegate];
      v7 = [(AXTouchAccommodationsEventProcessor *)self event];
      uint64_t v8 = [v7 handInfo];
      v9 = [v8 paths];
      [v6 eventProcessor:self didResetTouchAccommodationsProgressAtPathInfos:v9];
LABEL_4:

LABEL_5:
      [(AXTouchAccommodationsEventProcessor *)self _handleTapActivationAfterTimerBegan];
    }
  }
  else
  {
    switch(state)
    {
      case 0:
        switch(a3)
        {
          case 0:
            goto LABEL_26;
          case 1:
            self->_int64_t state = 1;
            [(AXTouchAccommodationsEventProcessor *)self disableSleepTimer:1];
            [(AXTouchAccommodationsEventProcessor *)self _initiateHoldDurationTimer];
            id v10 = [(AXTouchAccommodationsEventProcessor *)self delegate];
            id v11 = [(AXTouchAccommodationsEventProcessor *)self event];
            v12 = [v11 handInfo];
            uint64_t v13 = [v12 paths];
            [v10 eventProcessor:self didUpdateTouchAccommodationsAtPathInfos:v13];

            [(AXTouchAccommodationsEventProcessor *)self _handleHoldDurationAfterTimerBegan];
            break;
          case 2:
            self->_int64_t state = 2;
            [(AXTouchAccommodationsEventProcessor *)self disableSleepTimer:1];
            [(AXTouchAccommodationsEventProcessor *)self _initiateTapTimeoutTimer];
            uint64_t v6 = [(AXTouchAccommodationsEventProcessor *)self delegate];
            v7 = [(AXTouchAccommodationsEventProcessor *)self event];
            uint64_t v8 = [v7 handInfo];
            v9 = [v8 paths];
            [v6 eventProcessor:self didUpdateTouchAccommodationsAtPathInfos:v9];
            goto LABEL_4;
          case 3:
            goto LABEL_29;
          default:
            return;
        }
        break;
      case 1:
        switch(a3)
        {
          case 0:
            self->_int64_t state = 0;
            [(AXTouchAccommodationsEventProcessor *)self disableSleepTimer:0];
            v15 = [(AXTouchAccommodationsEventProcessor *)self delegate];
            [v15 didStopTimersInEventProcessor:self];

            goto LABEL_26;
          case 2:
            self->_int64_t state = 2;
            [(AXTouchAccommodationsEventProcessor *)self _initiateTapTimeoutTimer];
            [(AXTouchAccommodationsEventProcessor *)self _updateTouchAccommodationsBasedOnTapActivation];
            goto LABEL_5;
          case 3:
            v16 = [(AXTouchAccommodationsEventProcessor *)self delegate];
            [v16 didStopTimersInEventProcessor:self];

            self->_int64_t state = 0;
            break;
          case 4:
            self->_int64_t state = 4;
            [(AXTouchAccommodationsEventProcessor *)self disableSleepTimer:0];
            v17 = [(AXTouchAccommodationsEventProcessor *)self delegate];
            [v17 didStopTimersInEventProcessor:self];

            goto LABEL_39;
          default:
            return;
        }
        break;
      case 2:
        v14 = [(AXTouchAccommodationsEventProcessor *)self delegate];
        [v14 didStopTimersInEventProcessor:self];

        switch(a3)
        {
          case 0:
            goto LABEL_18;
          case 3:
            self->_int64_t state = 3;
            goto LABEL_31;
          case 4:
            self->_int64_t state = 4;
            [(AXTouchAccommodationsEventProcessor *)self disableSleepTimer:0];
LABEL_39:
            [(AXTouchAccommodationsEventProcessor *)self _handleEventAfterTimerEnd];
            break;
        }
        break;
      case 3:
        if (!a3)
        {
LABEL_18:
          self->_int64_t state = 0;
          [(AXTouchAccommodationsEventProcessor *)self disableSleepTimer:0];
          goto LABEL_26;
        }
        break;
      case 4:
        if (a3 == 3)
        {
LABEL_29:
          self->_int64_t state = 3;
          [(AXTouchAccommodationsEventProcessor *)self disableSleepTimer:1];
LABEL_31:
          [(AXTouchAccommodationsEventProcessor *)self _initiateIgnoreRepeatTimer];
        }
        else if (!a3)
        {
          self->_int64_t state = 0;
          goto LABEL_26;
        }
        break;
      default:
        if (!a3)
        {
LABEL_26:
          [(AXTouchAccommodationsEventProcessor *)self _clearEventsToReplayForSwipeGestureBypass];
        }
        break;
    }
  }
}

- (void)_initiateHoldDurationTimer
{
  [(AXTouchAccommodationsEventProcessor *)self setShouldSendFakeTouchDownIfNeeded:1];
  [(AXDispatchTimer *)self->_holdDurationTimer cancel];
  objc_initWeak(&location, self);
  holdDurationTimer = self->_holdDurationTimer;
  v4 = +[AXSettings sharedInstance];
  [v4 touchAccommodationsHoldDuration];
  double v6 = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_7ABC;
  v7[3] = &unk_105B0;
  objc_copyWeak(&v8, &location);
  [(AXDispatchTimer *)holdDurationTimer afterDelay:v7 processBlock:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_initiateTapTimeoutTimer
{
  [(AXTouchAccommodationsEventProcessor *)self setShouldSendFakeTouchDownIfNeeded:1];
  [(AXDispatchTimer *)self->_tapTimeoutTimer cancel];
  objc_initWeak(&location, self);
  tapTimeoutTimer = self->_tapTimeoutTimer;
  v4 = +[AXSettings sharedInstance];
  [v4 touchAccommodationsTapActivationTimeout];
  double v6 = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_7C18;
  v7[3] = &unk_105B0;
  objc_copyWeak(&v8, &location);
  [(AXDispatchTimer *)tapTimeoutTimer afterDelay:v7 processBlock:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_initiateIgnoreRepeatTimer
{
  [(AXDispatchTimer *)self->_ignoreRepeatTimer cancel];
  objc_initWeak(&location, self);
  ignoreRepeatTimer = self->_ignoreRepeatTimer;
  v4 = +[AXSettings sharedInstance];
  [v4 touchAccommodationsIgnoreRepeatDuration];
  double v6 = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_7D6C;
  v7[3] = &unk_105B0;
  objc_copyWeak(&v8, &location);
  [(AXDispatchTimer *)ignoreRepeatTimer afterDelay:v7 processBlock:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_handleEventAfterTimerEnd
{
  objc_super v3 = [(AXTouchAccommodationsEventProcessor *)self event];
  v4 = [v3 handInfo];
  unsigned int v5 = -[AXTouchAccommodationsEventProcessor _isLiftEvent:](self, "_isLiftEvent:", [v4 eventType]);

  if (v5)
  {
    double v6 = +[AXSettings sharedInstance];
    unsigned int v7 = [v6 touchAccommodationsIgnoreRepeatEnabled];

    if (v7) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = 0;
    }
    [(AXTouchAccommodationsEventProcessor *)self _setTimerState:v8];
    id v9 = [(AXTouchAccommodationsEventProcessor *)self event];
    -[AXTouchAccommodationsEventProcessor _sendFakeEvent:forTheFirstTime:](self, "_sendFakeEvent:forTheFirstTime:");
  }
  else
  {
    id v9 = [(AXTouchAccommodationsEventProcessor *)self event];
    -[AXTouchAccommodationsEventProcessor _sendFakeEventAfterTimerEnded:](self, "_sendFakeEventAfterTimerEnded:");
  }
}

- (void)_processTimerEventsFromCurrentState
{
  int64_t state = self->_state;
  switch(state)
  {
    case 1:
      [(AXTouchAccommodationsEventProcessor *)self _handleHoldDurationAfterTimerBegan];
      break;
    case 2:
      [(AXTouchAccommodationsEventProcessor *)self _handleTapActivationAfterTimerBegan];
      break;
    case 4:
      [(AXTouchAccommodationsEventProcessor *)self _handleEventAfterTimerEnd];
      break;
  }
}

- (BOOL)_handleTimerEvents
{
  objc_super v3 = +[AXSettings sharedInstance];
  if ([v3 touchAccommodationsHoldDurationEnabled])
  {

LABEL_4:
    hidDispatchQueue = self->_hidDispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_7FB4;
    block[3] = &unk_103D8;
    block[4] = self;
    dispatch_async(hidDispatchQueue, block);
    return 1;
  }
  v4 = +[AXSettings sharedInstance];
  id v5 = [v4 touchAccommodationsTapActivationMethod];

  if (v5) {
    goto LABEL_4;
  }
  return 0;
}

- (void)_sendFakeEventAfterTimerEnded:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(AXTouchAccommodationsEventProcessor *)self shouldSendFakeTouchDownIfNeeded];
  if (v4) {
    [(AXTouchAccommodationsEventProcessor *)self setShouldSendFakeTouchDownIfNeeded:0];
  }
  [(AXTouchAccommodationsEventProcessor *)self _sendFakeEvent:v5 forTheFirstTime:v4];
}

- (void)_trackUpdateStatusForEvent:(id)a3
{
  id v10 = a3;
  if ([v10 willBeUpdated])
  {
    id v4 = [v10 generationCount];
    p_generationsLock = &self->_generationsLock;
    os_unfair_lock_lock(&self->_generationsLock);
    sentGenerationsAnticipatingUpdate = self->_sentGenerationsAnticipatingUpdate;
    unsigned int v7 = +[NSNumber numberWithLong:v4];
    [(NSMutableSet *)sentGenerationsAnticipatingUpdate addObject:v7];
  }
  else
  {
    if (![v10 isUpdate]) {
      goto LABEL_6;
    }
    id v8 = [v10 generationCount];
    p_generationsLock = &self->_generationsLock;
    os_unfair_lock_lock(&self->_generationsLock);
    id v9 = self->_sentGenerationsAnticipatingUpdate;
    unsigned int v7 = +[NSNumber numberWithLong:v8];
    [(NSMutableSet *)v9 removeObject:v7];
  }

  os_unfair_lock_unlock(p_generationsLock);
LABEL_6:
}

- (void)_sendHIDEventUnconditionally:(id)a3 shouldUseOriginalTime:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  double v6 = [v5 handInfo];
  unint64_t v7 = (unint64_t)[v6 handEventMask] & 0xF042000;

  id v8 = [v5 handInfo];
  [v8 setAdditionalHandEventFlagsForGeneratedEvents:v7];

  [v5 setUseOriginalHIDTime:v4];
  id v9 = +[AXEventTapManager sharedManager];
  [v9 sendHIDSystemEvent:v5 senderID:0x8000000817319376];
}

- (void)_sendFakeEvent:(id)a3 forTheFirstTime:(BOOL)a4
{
  id v6 = a3;
  [(AXTouchAccommodationsEventProcessor *)self _willSendEvent:v6];
  hidDispatchQueue = self->_hidDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_82C4;
  block[3] = &unk_105D8;
  BOOL v12 = a4;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async(hidDispatchQueue, block);
}

- (BOOL)_isLiftEvent:(unsigned int)a3
{
  return (a3 < 0xB) & (0x640u >> a3);
}

- (void)_handleTapActivationMethodActivateOnTouch
{
  objc_super v3 = [(AXTouchAccommodationsEventProcessor *)self initialTouchEvent];
  [(AXTouchAccommodationsEventProcessor *)self _willSendEvent:v3];

  hidDispatchQueue = self->_hidDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8454;
  block[3] = &unk_103D8;
  void block[4] = self;
  dispatch_async(hidDispatchQueue, block);
}

- (void)_handleTapActivationMethodActivateOnRelease
{
  objc_super v3 = [(AXTouchAccommodationsEventProcessor *)self finalTouchEvent];
  [(AXTouchAccommodationsEventProcessor *)self _willSendEvent:v3];

  hidDispatchQueue = self->_hidDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_85F0;
  block[3] = &unk_103D8;
  void block[4] = self;
  dispatch_async(hidDispatchQueue, block);
}

- (id)_pathAtPreviousPointForPathIndex:(unint64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v4 = self->_pointOfReferencePaths;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "pathIndex", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)_handleTapActivationAfterTimerBegan
{
  objc_super v3 = [(AXTouchAccommodationsEventProcessor *)self event];
  BOOL v4 = [v3 handInfo];
  unsigned int v5 = -[AXTouchAccommodationsEventProcessor _isLiftEvent:](self, "_isLiftEvent:", [v4 eventType]);

  if (v5)
  {
    [(AXTouchAccommodationsEventProcessor *)self _setTimerState:0];
    [(AXDispatchTimer *)self->_tapTimeoutTimer cancel];
    id v6 = +[AXSettings sharedInstance];
    if ([v6 touchAccommodationsTapActivationMethod] == (char *)&dword_0 + 1)
    {
      [(AXTouchAccommodationsEventProcessor *)self _handleTapActivationMethodActivateOnTouch];
    }
    else if ([v6 touchAccommodationsTapActivationMethod] == (char *)&dword_0 + 2)
    {
      uint64_t v7 = [(AXTouchAccommodationsEventProcessor *)self event];
      id v8 = (AXEventRepresentation *)[v7 copy];
      finalTouchEvent = self->_finalTouchEvent;
      self->_finalTouchEvent = v8;

      [(AXTouchAccommodationsEventProcessor *)self _handleTapActivationMethodActivateOnRelease];
    }
  }
  id v10 = [(AXTouchAccommodationsEventProcessor *)self event];
  id v11 = [v10 handInfo];
  unsigned int v12 = [v11 eventType];

  if (v12 == 2)
  {
    long long v13 = +[AXSettings sharedInstance];
    long long v14 = (char *)[v13 touchAccommodationsTapActivationMethod];

    if (v14 == (unsigned char *)&dword_0 + 2)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v15 = [(AXTouchAccommodationsEventProcessor *)self event];
      v16 = [v15 handInfo];
      v17 = [v16 paths];

      id v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v30;
        while (2)
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v30 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            v23 = -[AXTouchAccommodationsEventProcessor _pathAtPreviousPointForPathIndex:](self, "_pathAtPreviousPointForPathIndex:", [v22 pathIndex]);
            [(AXTouchAccommodationsEventProcessor *)self _distanceBetweenPath:v22 otherPath:v23];
            if (v24 > 40.0)
            {
              v25 = [(AXTouchAccommodationsEventProcessor *)self event];
              v26 = [v25 handInfo];
              v27 = [v26 paths];
              pointOfReferencePaths = self->_pointOfReferencePaths;
              self->_pointOfReferencePaths = v27;

              [(AXTouchAccommodationsEventProcessor *)self _setTimerState:2];
              goto LABEL_19;
            }
          }
          id v19 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }
LABEL_19:
    }
  }
}

- (void)_updateTouchAccommodationsBasedOnTapActivation
{
  objc_super v3 = +[AXSettings sharedInstance];
  BOOL v4 = (char *)[v3 touchAccommodationsTapActivationMethod];

  if (v4 != (unsigned char *)&dword_0 + 1)
  {
    id v8 = [(AXTouchAccommodationsEventProcessor *)self delegate];
    unsigned int v5 = [(AXTouchAccommodationsEventProcessor *)self event];
    id v6 = [v5 handInfo];
    uint64_t v7 = [v6 paths];
    [v8 eventProcessor:self didUpdateTouchAccommodationsAtPathInfos:v7];
  }
}

- (void)_handleHoldDurationAfterTimerBegan
{
  objc_super v3 = [(AXTouchAccommodationsEventProcessor *)self event];
  BOOL v4 = [v3 handInfo];
  unsigned int v5 = -[AXTouchAccommodationsEventProcessor _isLiftEvent:](self, "_isLiftEvent:", [v4 eventType]);

  if (!v5) {
    return;
  }
  [(AXDispatchTimer *)self->_holdDurationTimer cancel];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double v7 = Current;
  int holdDurationCancelCount = self->_holdDurationCancelCount;
  if (!holdDurationCancelCount)
  {
    self->_firstHoldDurationCancelTime = Current;
    int v11 = 1;
LABEL_9:
    self->_int holdDurationCancelCount = v11;
    goto LABEL_10;
  }
  unsigned int v9 = holdDurationCancelCount + 1;
  self->_int holdDurationCancelCount = v9;
  if (v9 >= 0xA)
  {
    if (Current - self->_firstHoldDurationCancelTime <= 3.0)
    {
      id v10 = [(AXTouchAccommodationsEventProcessor *)self delegate];
      [v10 panickedHoldDurationInEventProcessor:self];
    }
    int v11 = 0;
    goto LABEL_9;
  }
LABEL_10:
  if (v7 - self->_firstHoldDurationCancelTime > 3.0) {
    self->_int holdDurationCancelCount = 0;
  }

  [(AXTouchAccommodationsEventProcessor *)self _setTimerState:0];
}

- (void)_endHoldDurationAndAllowTapAssistance:(BOOL)a3
{
  BOOL v3 = a3;
  [(AXDispatchTimer *)self->_holdDurationTimer cancel];
  int64_t state = self->_state;
  id v6 = AXLogTouchAccommodations();
  double v7 = v6;
  if (state == 1)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_A454(v7);
    }

    id v8 = +[AXSettings sharedInstance];
    id v9 = [v8 touchAccommodationsTapActivationMethod];

    if (v9 && v3)
    {
      id v10 = self;
      uint64_t v11 = 2;
    }
    else
    {
      [(AXTouchAccommodationsEventProcessor *)self _clearEventsToReplayForSwipeGestureBypass];
      id v10 = self;
      uint64_t v11 = 4;
    }
    [(AXTouchAccommodationsEventProcessor *)v10 _setTimerState:v11];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_A4F4(&self->_state, v7);
    }
  }
}

- (BOOL)_shouldPassAlongWithoutHandlingEvent:(id)a3
{
  id v4 = a3;
  if ([v4 isUpdate])
  {
    p_generationsLock = &self->_generationsLock;
    os_unfair_lock_lock(&self->_generationsLock);
    sentGenerationsAnticipatingUpdate = self->_sentGenerationsAnticipatingUpdate;
    double v7 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v4 generationCount]);
    unsigned __int8 v8 = [(NSMutableSet *)sentGenerationsAnticipatingUpdate containsObject:v7];

    os_unfair_lock_unlock(p_generationsLock);
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldAllowBypassForSwipeGestures
{
  if ((unint64_t)(self->_state - 1) > 1) {
    return 0;
  }
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 touchAccommodationsAllowsSwipeGesturesToBypass];

  return v3;
}

- (id)_pathAtInitialTouchForPathIndex:(unint64_t)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(AXTouchAccommodationsEventProcessor *)self initialTouchEvent];
  unsigned int v5 = [v4 handInfo];
  id v6 = [v5 paths];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 pathIndex] == a3)
        {
          id v12 = v11;
          goto LABEL_11;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (double)_minimumDistanceForSwipeGestureBypass
{
  v2 = +[AXSettings sharedInstance];
  [v2 touchAccommodationsSwipeGestureMinimumDistance];
  double v4 = v3;

  return v4;
}

- (BOOL)_bypassForSwipeGestureDueToEvent:(id)a3
{
  id v4 = a3;
  if (![(AXTouchAccommodationsEventProcessor *)self _shouldAllowBypassForSwipeGestures])_AXAssert(); {
  long long v44 = 0u;
  }
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  unsigned int v5 = [v4 handInfo];
  id v6 = [v5 paths];

  id v7 = [v6 countByEnumeratingWithState:&v42 objects:v52 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v43;
    *(void *)&long long v8 = 138477827;
    long long v36 = v8;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v43 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v42 + 1) + 8 * v10);
      id v12 = -[AXTouchAccommodationsEventProcessor _pathAtInitialTouchForPathIndex:](self, "_pathAtInitialTouchForPathIndex:", objc_msgSend(v11, "pathIndex", v36));
      if (v12)
      {
        [(AXTouchAccommodationsEventProcessor *)self _distanceBetweenPath:v11 otherPath:v12];
        double v14 = v13;
        [(AXTouchAccommodationsEventProcessor *)self _minimumDistanceForSwipeGestureBypass];
        if (v14 >= v15)
        {
          long long v17 = AXLogTouchAccommodations();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            sub_A5B4(v17, v19, v20, v21, v22, v23, v24, v25);
          }

          v26 = AXLogTouchAccommodations();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            sub_A570(v26);
          }

          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v48 = 0x3032000000;
          v49 = sub_94FC;
          v50 = sub_950C;
          id v51 = 0;
          eventsToReplayLock = self->_eventsToReplayLock;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_9514;
          block[3] = &unk_10600;
          void block[4] = self;
          void block[5] = &buf;
          dispatch_sync(eventsToReplayLock, block);
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v28 = *(id *)(*((void *)&buf + 1) + 40);
          id v29 = [v28 countByEnumeratingWithState:&v37 objects:v46 count:16];
          if (v29)
          {
            uint64_t v30 = *(void *)v38;
            do
            {
              for (i = 0; i != v29; i = (char *)i + 1)
              {
                if (*(void *)v38 != v30) {
                  objc_enumerationMutation(v28);
                }
                uint64_t v32 = *(void *)(*((void *)&v37 + 1) + 8 * i);
                [(AXTouchAccommodationsEventProcessor *)self _willSendEvent:v32];
                [(AXTouchAccommodationsEventProcessor *)self _sendHIDEventUnconditionally:v32 shouldUseOriginalTime:1];
              }
              id v29 = [v28 countByEnumeratingWithState:&v37 objects:v46 count:16];
            }
            while (v29);
          }

          [(AXTouchAccommodationsEventProcessor *)self setShouldSendFakeTouchDownIfNeeded:0];
          int64_t state = self->_state;
          if (state != 2)
          {
            if (state == 1)
            {
              [(AXTouchAccommodationsEventProcessor *)self _endHoldDurationAndAllowTapAssistance:0];
LABEL_34:
              _Block_object_dispose(&buf, 8);

              BOOL v34 = 1;
              goto LABEL_35;
            }
            _AXAssert();
          }
          [(AXTouchAccommodationsEventProcessor *)self _setTimerState:4];
          goto LABEL_34;
        }
      }
      else
      {
        long long v16 = AXLogTouchAccommodations();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = v36;
          *(void *)((char *)&buf + 4) = v11;
          _os_log_debug_impl(&dword_0, v16, OS_LOG_TYPE_DEBUG, "Path with no initial touch path: %{private}@", (uint8_t *)&buf, 0xCu);
        }
      }
      if (v7 == (id)++v10)
      {
        id v7 = [v6 countByEnumeratingWithState:&v42 objects:v52 count:16];
        if (v7) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  BOOL v34 = 0;
LABEL_35:

  return v34;
}

- (void)_clearEventsToReplayForSwipeGestureBypass
{
  double v3 = AXLogTouchAccommodations();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_A624(v3);
  }

  eventsToReplayLock = self->_eventsToReplayLock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9614;
  block[3] = &unk_103D8;
  void block[4] = self;
  dispatch_sync(eventsToReplayLock, block);
}

- (void)setFinalTouchEvent:(id)a3
{
}

- (AXEventRepresentation)finalTouchEvent
{
  return self->_finalTouchEvent;
}

- (void)setShouldSendFakeTouchDownIfNeeded:(BOOL)a3
{
  self->_shouldSendFakeTouchDownIfNeeded = a3;
}

- (BOOL)shouldSendFakeTouchDownIfNeeded
{
  return self->_shouldSendFakeTouchDownIfNeeded;
}

- (void)setInitialTouchEvent:(id)a3
{
}

- (AXEventRepresentation)initialTouchEvent
{
  return self->_initialTouchEvent;
}

- (void)setEvent:(id)a3
{
}

- (AXEventRepresentation)event
{
  return self->_event;
}

- (BOOL)_handleEvent:(id)a3
{
  id v4 = a3;
  [(AXTouchAccommodationsEventProcessor *)self _notifyUserEventOccurred];
  unsigned int v5 = +[AXSettings sharedInstance];
  id v6 = [v4 handInfo];
  id v7 = [v6 eventType];

  id v8 = [v4 senderID];
  updateSetMaintenanceTimer = self->_updateSetMaintenanceTimer;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_9C20;
  v48[3] = &unk_103D8;
  v48[4] = self;
  [(AXDispatchTimer *)updateSetMaintenanceTimer afterDelay:v48 processBlock:30.0];
  if ([v5 touchAccommodationsUsageConfirmed]
    && ((unint64_t)v8 + 0x7FFFFFF7E8CE6C8FLL >= 9 || ((0x12Bu >> ((_BYTE)v8 - 113)) & 1) == 0)
    && !_AXSVoiceOverTouchEnabled())
  {
    id v12 = [v4 copy];
    hidDispatchQueue = self->_hidDispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_9CBC;
    block[3] = &unk_104E8;
    void block[4] = self;
    id v14 = v12;
    id v47 = v14;
    dispatch_async(hidDispatchQueue, block);
    if ([(AXTouchAccommodationsEventProcessor *)self _shouldPassAlongWithoutHandlingEvent:v4])
    {
LABEL_8:
      -[AXTouchAccommodationsEventProcessor _trackUpdateStatusForEvent:](self, "_trackUpdateStatusForEvent:", v4, v27, v28, v29, v30, v31);
      BOOL v10 = 0;
LABEL_38:

      goto LABEL_6;
    }
    if ([v4 isUpdate])
    {
LABEL_37:
      BOOL v10 = 1;
      goto LABEL_38;
    }
    if ([v5 touchAccommodationsHoldDurationEnabled] && self->_state == 1)
    {
      double v15 = self->_hidDispatchQueue;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_9CC4;
      v45[3] = &unk_103D8;
      v45[4] = self;
      dispatch_async(v15, v45);
    }
    if ([v5 touchAccommodationsTapActivationMethod] && self->_state == 2)
    {
      long long v16 = self->_hidDispatchQueue;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_9CCC;
      v44[3] = &unk_103D8;
      v44[4] = self;
      dispatch_async(v16, v44);
    }
    if (v7 != 1)
    {
      if (self->_touchEventAfterIgnoreRepeatTimerBegan) {
        unsigned __int8 v18 = 1;
      }
      else {
        unsigned __int8 v18 = [(AXTouchAccommodationsEventProcessor *)self _handleTimerEvents];
      }
      if (![(AXTouchAccommodationsEventProcessor *)self _isLiftEvent:v7])
      {
LABEL_36:
        v26 = self->_hidDispatchQueue;
        v27 = _NSConcreteStackBlock;
        uint64_t v28 = 3221225472;
        id v29 = sub_9E54;
        uint64_t v30 = &unk_10628;
        long long v31 = self;
        id v32 = v4;
        id v33 = v14;
        dispatch_async(v26, &v27);

        if ((v18 & 1) == 0) {
          goto LABEL_8;
        }
        goto LABEL_37;
      }
      uint64_t v22 = self->_hidDispatchQueue;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_9DCC;
      v34[3] = &unk_10650;
      id v35 = v5;
      long long v36 = self;
      int v37 = (int)v7;
      dispatch_async(v22, v34);
      uint64_t v23 = v35;
LABEL_35:

      goto LABEL_36;
    }
    int64_t state = self->_state;
    if (state == 3)
    {
      self->_touchEventAfterIgnoreRepeatTimerBegan = 1;
      int64_t state = self->_state;
    }
    if (state)
    {
      if (self->_touchEventAfterIgnoreRepeatTimerBegan)
      {
        unsigned __int8 v18 = 1;
        goto LABEL_36;
      }
    }
    else
    {
      self->_touchEventAfterIgnoreRepeatTimerBegan = 0;
    }
    uint64_t v19 = self->_hidDispatchQueue;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_9CD4;
    v42[3] = &unk_104E8;
    v42[4] = self;
    id v43 = v14;
    dispatch_async(v19, v42);
    if ([v5 touchAccommodationsHoldDurationEnabled])
    {
      uint64_t v20 = [(AXTouchAccommodationsEventProcessor *)self delegate];
      [v20 willStartTimersInEventProcessor:self];

      uint64_t v21 = self->_hidDispatchQueue;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_9D28;
      v41[3] = &unk_103D8;
      v41[4] = self;
      dispatch_async(v21, v41);
    }
    else
    {
      if (![v5 touchAccommodationsTapActivationMethod])
      {
        unsigned __int8 v18 = 0;
        goto LABEL_34;
      }
      uint64_t v24 = [(AXTouchAccommodationsEventProcessor *)self delegate];
      [v24 willStartTimersInEventProcessor:self];

      uint64_t v25 = self->_hidDispatchQueue;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_9D34;
      v38[3] = &unk_10628;
      v38[4] = self;
      id v39 = v5;
      id v40 = v4;
      dispatch_async(v25, v38);
    }
    unsigned __int8 v18 = 1;
LABEL_34:
    uint64_t v23 = v43;
    goto LABEL_35;
  }
  BOOL v10 = 0;
LABEL_6:

  return v10;
}

- (void)disableSleepTimer:(BOOL)a3
{
  sleepTimerDisabledAssertion = self->_sleepTimerDisabledAssertion;
  if (a3)
  {
    if (sleepTimerDisabledAssertion) {
      return;
    }
    id v8 = +[AXUserEventTimer sharedInstance];
    unsigned int v5 = [v8 acquireAssertionToDisableIdleTimerWithReason:@"TouchAccommodations"];
    id v6 = self->_sleepTimerDisabledAssertion;
    self->_sleepTimerDisabledAssertion = v5;

    id v7 = (BSInvalidatable *)v8;
  }
  else
  {
    if (!sleepTimerDisabledAssertion) {
      return;
    }
    [(BSInvalidatable *)sleepTimerDisabledAssertion invalidate];
    id v7 = self->_sleepTimerDisabledAssertion;
    self->_sleepTimerDisabledAssertion = 0;
  }
}

- (void)_notifyUserEventOccurred
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A0F0;
  block[3] = &unk_103D8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (double)_distanceBetweenPath:(id)a3 otherPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  AXDeviceGetMainScreenBounds();
  double v8 = v7;
  double v10 = v9;
  [v6 pathLocation];
  double v12 = v11;
  double v14 = v13;

  [v5 pathLocation];
  double v16 = v15;
  double v18 = v17;

  v19.n128_f64[0] = v12 * v8;
  v20.n128_f64[0] = v14 * v10;
  v21.n128_f64[0] = v8 * v16;
  v22.n128_f64[0] = v10 * v18;
  _AX_CGPointGetDistanceToPoint(v19, v20, v21, v22);
  return result;
}

- (AXTouchAccommodationsEventProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXTouchAccommodationsEventProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)canBeginIgnoreRepeatTimer
{
  return self->_canBeginIgnoreRepeatTimer;
}

- (void)setCanBeginIgnoreRepeatTimer:(BOOL)a3
{
  self->_canBeginIgnoreRepeatTimer = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_initialTouchEvent, 0);
  objc_storeStrong((id *)&self->_finalTouchEvent, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_eventsToReplayLock, 0);
  objc_storeStrong((id *)&self->_eventsToReplayForSwipeGestureOnBypass, 0);
  objc_storeStrong((id *)&self->_pointOfReferencePaths, 0);
  objc_storeStrong((id *)&self->_sleepTimerDisabledAssertion, 0);
  objc_storeStrong((id *)&self->_sentGenerationsAnticipatingUpdate, 0);
  objc_storeStrong((id *)&self->_updateSetMaintenanceTimer, 0);
  objc_storeStrong((id *)&self->_ignoreRepeatTimer, 0);
  objc_storeStrong((id *)&self->_holdDurationTimer, 0);
  objc_storeStrong((id *)&self->_tapTimeoutTimer, 0);

  objc_storeStrong((id *)&self->_hidDispatchQueue, 0);
}

@end