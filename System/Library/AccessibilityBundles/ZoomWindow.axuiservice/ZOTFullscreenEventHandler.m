@interface ZOTFullscreenEventHandler
- (BOOL)_allowsFingerDistanceToAffectZoom;
- (BOOL)_autoPanIfNecessaryWithEvent:(id)a3;
- (BOOL)_autoPanIfNecessaryWithEvent:(id)a3 isDragging:(BOOL)a4;
- (BOOL)_handleEvent:(id)a3;
- (BOOL)_handleTrackpadEvent:(id)a3;
- (BOOL)_hasReachedFlickVelocity:(id)a3;
- (BOOL)_verifyZoomActionIsAppropriate:(id)a3;
- (BOOL)anyFingerDown;
- (BOOL)handleDragEvent:(id)a3;
- (BOOL)handleEvent:(id)a3;
- (BOOL)handleSpeakUnderFingerEvent:(id)a3;
- (BOOL)handleTrackpadEvent:(id)a3;
- (BOOL)isAnyDisplayZoomedIn;
- (BOOL)isDisplayZoomedIn:(id)a3;
- (BOOL)isMainDisplayZoomedIn;
- (CGPoint)_middleFingerForEvent:(id)a3;
- (NSPointerArray)externalDisplayZoomDelegates;
- (ZOTFullscreenEventHandler)initWithEventThread:(id)a3;
- (ZOTFullscreenEventHandlerDelegate)eventDelegate;
- (ZOTFullscreenZoomHandlerDelegate)zoomDelegate;
- (double)_currentVelocity:(id)a3;
- (id)_descriptionForEvent:(id)a3;
- (id)_zoomSenderIdentifierData;
- (unint64_t)_senderIDForRepostingOfEvent:(id)a3;
- (void)_clearState;
- (void)_drainEventRepostQueue:(id)a3 replayEvents:(BOOL)a4 updateEventTimestamps:(BOOL)a5;
- (void)_eventPostTimerCallback;
- (void)_handleDoubleTapEvent:(id)a3 newLocation:(CGPoint)a4;
- (void)_handleTrackpadDoubleTapEvent:(id)a3 newLocation:(CGPoint)a4;
- (void)_handleVoiceOverMultiTapActionWithEvent:(id)a3 tapCount:(int64_t)a4;
- (void)_scheduleTapTimeout;
- (void)_scheduleTapTimeout:(BOOL)a3;
- (void)_scheduleTrackpadTapTimeout;
- (void)_updateAutopanWhileDragging:(BOOL)a3;
- (void)_updateVelocityAndVectorWithEventLocation:(CGPoint)a3 startPoint:(CGPoint)a4 endPoint:(CGPoint)a5 forTrackpad:(BOOL)a6;
- (void)postHandCancelWithSenderID:(unint64_t)a3;
- (void)setEventDelegate:(id)a3;
- (void)setExternalDisplayZoomDelegates:(id)a3;
- (void)setFirstTouchWentIntoLensContent:(BOOL)a3;
- (void)setZoomDelegate:(id)a3;
@end

@implementation ZOTFullscreenEventHandler

- (ZOTFullscreenEventHandler)initWithEventThread:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ZOTFullscreenEventHandler;
  v5 = [(ZOTFullscreenEventHandler *)&v31 init];
  v6 = v5;
  if (v5)
  {
    v5->_orbFinger = -1;
    double v7 = ZOTTimeUnset;
    *(void *)&v5->_snarfLastTime = ZOTTimeUnset;
    v5->_lastPanTime = v7;
    v5->_velocityLastTime = v7;
    v5->_trackpadVelocityLastTime = v7;
    v5->_tapDoubleLastTime = v7;
    v5->_tapLastTime = v7;
    v5->_trackpadTapDoubleLastTime = v7;
    v5->_trackpadTapLastTime = v7;
    v5->_lastAppTransition = v7;
    v5->_flickTime = v7;
    v5->_autopanDelay = v7;
    v5->_borderpanStartTime = v7;
    v5->_twoFingerTapDownWithHold = v7;
    v5->_firstFingerDownTime = v7;
    v5->_secondFingerDownTime = v7;
    v5->_thirdFingerDownTime = v7;
    v5->_anyFingerDownTime = v7;
    v5->_firstTrackpadFingerDownTime = v7;
    v5->_secondTrackpadFingerDownTime = v7;
    v5->_thirdTrackpadFingerDownTime = v7;
    v5->_anyTrackpadFingerDownTime = v7;
    v5->_currentFingerCount = 0;
    v5->_oneFingerWasDown = 0;
    v8 = (AXThreadTimer *)[objc_alloc((Class)AXThreadTimer) initWithThread:v4];
    autopanTimer = v6->_autopanTimer;
    v6->_autopanTimer = v8;

    v10 = (AXThreadTimer *)[objc_alloc((Class)AXThreadTimer) initWithThread:v4];
    multiTapTimer = v6->_multiTapTimer;
    v6->_multiTapTimer = v10;

    v12 = (AXThreadTimer *)[objc_alloc((Class)AXThreadTimer) initWithThread:v4];
    passthruEventTimer = v6->_passthruEventTimer;
    v6->_passthruEventTimer = v12;

    v14 = (AXThreadTimer *)[objc_alloc((Class)AXThreadTimer) initWithThread:v4];
    tapCountResetTimer = v6->_tapCountResetTimer;
    v6->_tapCountResetTimer = v14;

    v16 = (AXThreadTimer *)[objc_alloc((Class)AXThreadTimer) initWithThread:v4];
    trackpadTapCountResetTimer = v6->_trackpadTapCountResetTimer;
    v6->_trackpadTapCountResetTimer = v16;

    v18 = (AXThreadTimer *)[objc_alloc((Class)AXThreadTimer) initWithThread:v4];
    editingGestureHoldTimer = v6->_editingGestureHoldTimer;
    v6->_editingGestureHoldTimer = v18;

    v20 = (AXThreadTimer *)[objc_alloc((Class)AXThreadTimer) initWithThread:v4];
    hoverTextTapTimer = v6->_hoverTextTapTimer;
    v6->_hoverTextTapTimer = v20;

    uint64_t v22 = +[NSMutableArray array];
    eventReplayQueue = v6->_eventReplayQueue;
    v6->_eventReplayQueue = (NSMutableArray *)v22;

    v24 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.accessibility.zoomEventDispatch", v24);
    eventReplayDispatchQueue = v6->_eventReplayDispatchQueue;
    v6->_eventReplayDispatchQueue = (OS_dispatch_queue *)v25;

    uint64_t v27 = +[NSPointerArray weakObjectsPointerArray];
    externalDisplayZoomDelegates = v6->_externalDisplayZoomDelegates;
    v6->_externalDisplayZoomDelegates = (NSPointerArray *)v27;

    v29 = v6;
  }

  return v6;
}

- (BOOL)_allowsFingerDistanceToAffectZoom
{
  ZOTMainScreenSize();
  return v2 > 700.0;
}

- (BOOL)isMainDisplayZoomedIn
{
  double v2 = self;
  v3 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
  LOBYTE(v2) = [(ZOTFullscreenEventHandler *)v2 isDisplayZoomedIn:v3];

  return (char)v2;
}

- (BOOL)isAnyDisplayZoomedIn
{
  if ([(ZOTFullscreenEventHandler *)self isMainDisplayZoomedIn])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    id v4 = [(ZOTFullscreenEventHandler *)self externalDisplayZoomDelegates];
    id v3 = [v4 count];

    if (v3)
    {
      unint64_t v5 = 0;
      do
      {
        id v3 = [(ZOTFullscreenEventHandler *)self externalDisplayZoomDelegates];
        v6 = [v3 pointerAtIndex:v5];

        LODWORD(v3) = [(ZOTFullscreenEventHandler *)self isDisplayZoomedIn:v6];
        if (v3) {
          break;
        }
        ++v5;
        double v7 = [(ZOTFullscreenEventHandler *)self externalDisplayZoomDelegates];
        id v8 = [v7 count];
      }
      while ((unint64_t)v8 > v5);
    }
  }
  return (char)v3;
}

- (BOOL)isDisplayZoomedIn:(id)a3
{
  [a3 zoomLevelWithFullscreenEventHandler:self];
  return v3 >= AXZoomMinimumZoomLevel + 0.0001;
}

- (BOOL)anyFingerDown
{
  return self->_anyFingerDown;
}

- (BOOL)_verifyZoomActionIsAppropriate:(id)a3
{
  id v4 = a3;
  if ([(ZOTFullscreenEventHandler *)self isMainDisplayZoomedIn]) {
    goto LABEL_2;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  double secondFingerDownTime = self->_secondFingerDownTime;
  if (secondFingerDownTime != ZOTTimeUnset && Current - secondFingerDownTime > 0.75) {
    goto LABEL_17;
  }
  double firstFingerDownTime = self->_firstFingerDownTime;
  double v10 = Current - firstFingerDownTime;
  if (firstFingerDownTime != ZOTTimeUnset && v10 > 0.75) {
    goto LABEL_17;
  }
  if (![(ZOTFullscreenEventHandler *)self _allowsFingerDistanceToAffectZoom]) {
    goto LABEL_2;
  }
  v12 = [v4 fingerAtIndex:0];
  [v12 location];

  v13 = [v4 fingerAtIndex:1];
  [v13 location];

  v14 = [v4 fingerAtIndex:2];
  [v14 location];

  SCRCMathGetDistanceBetweenPoints();
  if (v15 > 0.75) {
    goto LABEL_17;
  }
  SCRCMathGetDistanceBetweenPoints();
  if (v16 <= 0.75 && (SCRCMathGetDistanceBetweenPoints(), v17 <= 0.75)) {
LABEL_2:
  }
    BOOL v5 = 1;
  else {
LABEL_17:
  }
    BOOL v5 = 0;

  return v5;
}

- (void)postHandCancelWithSenderID:(unint64_t)a3
{
  id v4 = [(ZOTFullscreenEventHandler *)self eventDelegate];
  [v4 postHandCancelWithSenderID:a3];
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = +[ZOTEvent createEventFromEventRepresentation:a3];
  LOBYTE(self) = [(ZOTFullscreenEventHandler *)self _handleEvent:v4];

  return (char)self;
}

- (BOOL)handleTrackpadEvent:(id)a3
{
  id v4 = +[ZOTEvent createEventFromEventRepresentation:a3];
  LOBYTE(self) = [(ZOTFullscreenEventHandler *)self _handleTrackpadEvent:v4];

  return (char)self;
}

- (BOOL)handleSpeakUnderFingerEvent:(id)a3
{
  id v4 = +[ZOTEvent createEventFromEventRepresentation:a3];
  BOOL v5 = v4;
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  if (CGPointZero.x == self->_initialSingleFingerLocation.x && y == self->_initialSingleFingerLocation.y)
  {
    objc_msgSend(v4, "magneticLocation", CGPointZero.x, y);
    self->_initialSingleFingerLocation.double x = x;
    self->_initialSingleFingerLocation.double y = y;
    self->_snarfing = 1;
  }
  -[ZOTFullscreenEventHandler _autoPanIfNecessaryWithEvent:](self, "_autoPanIfNecessaryWithEvent:", v5, x, y);
  if ([v5 handEventType] == 6) {
    [(ZOTFullscreenEventHandler *)self _clearState];
  }

  return 1;
}

- (BOOL)handleDragEvent:(id)a3
{
  id v4 = +[ZOTEvent createEventFromEventRepresentation:a3];
  BOOL v5 = v4;
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  if (CGPointZero.x == self->_initialSingleFingerLocation.x && y == self->_initialSingleFingerLocation.y)
  {
    objc_msgSend(v4, "magneticLocation", CGPointZero.x, y);
    self->_initialSingleFingerLocation.double x = x;
    self->_initialSingleFingerLocation.double y = y;
    self->_snarfing = 1;
  }
  -[ZOTFullscreenEventHandler _autoPanIfNecessaryWithEvent:isDragging:](self, "_autoPanIfNecessaryWithEvent:isDragging:", v5, 1, x, y);

  return 0;
}

- (BOOL)_handleEvent:(id)a3
{
  id v5 = a3;
  [v5 time];
  double v7 = v6;
  unsigned int v8 = [v5 handEventType];
  int v9 = v8;
  BOOL v10 = v7 - *(double *)&_handleEvent__LastEventTime < 0.016 && _handleEvent__LastEventType == v8;
  if (!v10 || !self->_zoomPanning || v8 != 2)
  {
    id obj = a3;
    v11 = (char *)[v5 fingerCount];
    id multiTapTimer = [v5 isTouchEventWeCareAbout];
    BOOL v13 = self->_eventFingersTracking || v7 - self->_snarfLastTime < 0.12;
    self->_snarfing = v13;
    if (!self->_orbZoomToggled) {
      BOOL v13 = 0;
    }
    self->_orbZoomToggled = v13;
    v14 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
    unsigned __int8 v15 = [v14 isZoomMovingWithVelocityWithFullscreenEventHandler:self];

    if (self->_zoomDisabledForApp)
    {
      double v16 = [(ZOTFullscreenEventHandler *)self eventDelegate];
      [v16 dispatchEventToSystem:v5];

      goto LABEL_241;
    }
    int anyFingerDown = self->_anyFingerDown;
    self->_currentFingerCount = (unint64_t)v11;
    int v18 = [v5 fingerCount] != 0;
    self->_int anyFingerDown = v18;
    if (!self->_orbSnarfing)
    {
      unint64_t v175 = (unint64_t)v11;
      v19 = [v5 record];
      if ([v19 allowsZoomOrb])
      {
        v20 = [v5 record];
        unsigned int v21 = ZOTEventMeetsOrbThreshold(v20);

        if (v21)
        {
          if (self->_anyFingerDown)
          {
            uint64_t v22 = [v5 fingerAtIndex:0];
            [v22 location];
            double v24 = v23;

            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke;
            block[3] = &unk_78CD0;
            block[4] = self;
            block[5] = ZOTDenormalizePoint(v24);
            block[6] = v25;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
            v26 = [v5 record];
            -[ZOTFullscreenEventHandler postHandCancelWithSenderID:](self, "postHandCancelWithSenderID:", [v26 senderID]);

            self->_orbSnarfing = 1;
            goto LABEL_241;
          }
          if (anyFingerDown)
          {
LABEL_37:
            v42 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
            [(ZOTFullscreenEventHandler *)self _middleFingerForEvent:v5];
            objc_msgSend(v42, "fullscreenEventHandler:didReceiveAnyFingerUpAtLocation:", self);

            if (self->_oneFingerWasDown) {
              self->_oneFingerWasDown = 0;
            }
            goto LABEL_42;
          }
          goto LABEL_42;
        }
      }
      else
      {
      }
      int v18 = self->_anyFingerDown;
      if (!self->_orbSnarfing)
      {
        if (!self->_anyFingerDown)
        {
          if (!anyFingerDown) {
            goto LABEL_42;
          }
          goto LABEL_37;
        }
        self->_wasPassingThroughSystemGesture = 0;
        if (v18 != anyFingerDown)
        {
          v35 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
          [(ZOTFullscreenEventHandler *)self _middleFingerForEvent:v5];
          objc_msgSend(v35, "fullscreenEventHandler:didReceiveAnyFingerDownAtLocation:", self);

          if (v11 == (unsigned char *)&dword_0 + 1)
          {
            v36 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
            unsigned int v37 = [v36 interfaceOrientationWithFullscreenEventHandler:self];
            [(ZOTFullscreenEventHandler *)self _middleFingerForEvent:v5];
            double v40 = v39;
            if (v37 == 4)
            {
              double v41 = 1.0 - v39;
              double v40 = v38;
            }
            else if (v37 == 3)
            {
              double v41 = v39;
              double v40 = 1.0 - v38;
            }
            else
            {
              double v41 = v38;
              if (v37 == 2)
              {
                double v40 = 1.0 - v39;
                double v41 = 1.0 - v38;
              }
            }

            v43 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
            objc_msgSend(v43, "fullscreenEventHandler:didReceiveOneFingerDownAtLocation:", self, v41, v40);

            self->_oneFingerWasDown = 1;
            v11 = (unsigned char *)(&dword_0 + 1);
          }
        }
LABEL_42:
        if ([v5 handEventType] == 1
          || [v5 handEventType] == 5)
        {
          objc_storeStrong((id *)&self->_lastDownEvent, obj);
          v11 = (char *)v175;
        }
        if (![(ZOTFullscreenEventHandler *)self isMainDisplayZoomedIn]
          && !self->_zooming
          && !self->_shouldPerformEditingGesture)
        {
          eventReplayQueue = self->_eventReplayQueue;
          v45 = [v5 record];
          [(NSMutableArray *)eventReplayQueue addObject:v45];

          v11 = (char *)v175;
        }
        if (([v5 handEventType] & 0xFFFFFFFB) == 1 && (unint64_t)(v11 - 1) <= 2) {
          *(&self->_firstFingerDownTime + (void)(v11 - 1)) = v7;
        }
        if (self->_anyFingerDown)
        {
          double v46 = ZOTTimeUnset;
          if (self->_anyFingerDownTime == ZOTTimeUnset) {
            self->_anyFingerDownTime = v7;
          }
          goto LABEL_71;
        }
        double v46 = ZOTTimeUnset;
        *(void *)&self->_twoFingerTapDownWithHold = ZOTTimeUnset;
        self->_double firstFingerDownTime = v46;
        self->_double secondFingerDownTime = v46;
        self->_thirdFingerDownTime = v46;
        if (_AXSVoiceOverTouchEnabled())
        {
          SCRCMathGetAverage();
          *(float *)&double v47 = v47;
          if (*(float *)&v47 > 125.0 && self->_shouldPerformEditingGesture)
          {
            double currentVector = self->_currentVector;
            v49 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
            float v50 = ZOTConvertVectorToScreenStandard((uint64_t)[v49 interfaceOrientationWithFullscreenEventHandler:self], currentVector);

            uint64_t v51 = 43;
            if (v50 > 45.0 && v50 < 315.0)
            {
              if (v50 <= 45.0 || v50 > 135.0)
              {
                if (v50 <= 135.0 || v50 > 225.0)
                {
                  if (v50 < 225.0 || v50 > 315.0) {
                    goto LABEL_70;
                  }
                  uint64_t v51 = 40;
                }
                else
                {
                  uint64_t v51 = 42;
                }
              }
              else
              {
                uint64_t v51 = 41;
              }
            }
            v52 = +[AXVoiceOverServer server];
            [v52 triggerCommand:v51];
          }
        }
LABEL_70:
        [(ZOTFullscreenEventHandler *)self _scheduleTapTimeout];
LABEL_71:
        long long v198 = 0u;
        long long v199 = 0u;
        long long v196 = 0u;
        long long v197 = 0u;
        v53 = [v5 record];
        v54 = [v53 handInfo];
        v55 = [v54 paths];

        id v56 = [v55 countByEnumeratingWithState:&v196 objects:v204 count:16];
        if (v56)
        {
          uint64_t v57 = *(void *)v197;
          double v58 = 0.0;
          do
          {
            for (i = 0; i != v56; i = (char *)i + 1)
            {
              if (*(void *)v197 != v57) {
                objc_enumerationMutation(v55);
              }
              v60 = *(void **)(*((void *)&v196 + 1) + 8 * i);
              [v60 orbValue];
              if (v58 < v61)
              {
                [v60 orbValue];
                double v58 = v62;
              }
            }
            id v56 = [v55 countByEnumeratingWithState:&v196 objects:v204 count:16];
          }
          while (v56);
        }

        if (multiTapTimer
          && !self->_snarfing
          && (v175 == 3 || self->_isTrackingHoverText)
          && !self->_ignoreSnarfingForFingerSession
          && [(ZOTFullscreenEventHandler *)self _verifyZoomActionIsAppropriate:v5])
        {
          [(AXThreadTimer *)self->_eventPostTimer cancel];
          id v63 = &_dispatch_main_q;
          v195[0] = _NSConcreteStackBlock;
          v195[1] = 3221225472;
          v195[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_4;
          v195[3] = &unk_78CA8;
          v195[4] = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, v195);

          self->_snarfing = 1;
          [(ZOTFullscreenEventHandler *)self _middleFingerForEvent:v5];
          self->_tapPoint.double x = v64;
          self->_tapPoint.double y = v65;
          [(AXThreadTimer *)self->_autopanTimer cancel];
          v66 = [v5 record];
          -[ZOTFullscreenEventHandler postHandCancelWithSenderID:](self, "postHandCancelWithSenderID:", [v66 senderID]);

          autopanDownEvent = self->_autopanDownEvent;
          self->_autopanDownEvent = 0;

          v68 = [(ZOTFullscreenEventHandler *)self eventDelegate];
          [v68 disableSleepTimer:1];
        }
        int IsPad = AXDeviceIsPad();
        unint64_t v70 = v175;
        if (v175 > 3) {
          int v71 = IsPad;
        }
        else {
          int v71 = 0;
        }
        if (v71 == 1 && !self->_zooming && !self->_zoomPanning) {
          self->_ignoreSnarfingForFingerSession = 1;
        }
        if (!self->_snarfing) {
          goto LABEL_110;
        }
        v72 = [v5 record];
        v73 = [v72 handInfo];
        if ([v73 initialFingerCount])
        {
          v74 = [v5 record];
          v75 = [v74 handInfo];
          BOOL v76 = [v75 lifetimeFingerCount] < 3;

          if (v76)
          {
            self->_snarfLastTime = v46;
            v77 = ZOOMLogEvents();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
            {
              id multiTapTimer = [v5 record];
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = multiTapTimer;
              _os_log_impl(&dword_0, v77, OS_LOG_TYPE_INFO, "one of the fingers we were tracking with zoom was cancelled, so stop snarfing: %@", buf, 0xCu);
            }
            [(AXThreadTimer *)self->_tapCountResetTimer cancel];
            goto LABEL_100;
          }
        }
        else
        {
        }
        unint64_t v70 = v175;
        if (!self->_snarfing)
        {
LABEL_110:
          if (v70) {
            char v85 = (char)multiTapTimer;
          }
          else {
            char v85 = 1;
          }
          if ((v85 & 1) == 0)
          {
            v88 = [(ZOTFullscreenEventHandler *)self eventDelegate];
            [v88 dispatchEventToSystem:v5];

            if (self->_allowTimedEventPosting)
            {
              objc_initWeak((id *)buf, self);
              eventPostTimer = self->_eventPostTimer;
              v179[0] = _NSConcreteStackBlock;
              v179[1] = 3221225472;
              v179[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_10;
              v179[3] = &unk_78CA8;
              v179[4] = self;
              [(AXThreadTimer *)eventPostTimer afterDelay:v179 processBlock:0.0799999982];
              objc_destroyWeak((id *)buf);
            }
            goto LABEL_240;
          }
          if (v70)
          {
            v86 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
            unsigned int v87 = [v86 isZoomMovingWithVelocityWithFullscreenEventHandler:self];

            if (v87)
            {
              v178[0] = _NSConcreteStackBlock;
              v178[1] = 3221225472;
              v178[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_11;
              v178[3] = &unk_78CA8;
              v178[4] = self;
              dispatch_async((dispatch_queue_t)&_dispatch_main_q, v178);
              self->_snarfLastTime = v7;
            }
            else
            {
              unsigned int v97 = [(ZOTFullscreenEventHandler *)self _hasReachedFlickVelocity:v5];
              if (v175 == 1) {
                unsigned int v98 = v97;
              }
              else {
                unsigned int v98 = 0;
              }
              if (v98 == 1)
              {
                [(AXThreadTimer *)self->_autopanTimer cancel];
                if (self->_autopanDownEvent)
                {
                  v99 = [(ZOTFullscreenEventHandler *)self eventDelegate];
                  [v99 dispatchEventToSystem:self->_autopanDownEvent];

                  v100 = self->_autopanDownEvent;
                  self->_autopanDownEvent = 0;
                }
                self->_borderpanMode = 0;
                v101 = [(ZOTFullscreenEventHandler *)self eventDelegate];
                [v101 dispatchEventToSystem:v5];
              }
              else
              {
                v102 = [(ZOTFullscreenEventHandler *)self eventDelegate];
                [v102 dispatchEventToSystem:v5];

                v103 = self->_autopanDownEvent;
                self->_autopanDownEvent = 0;
              }
            }
            goto LABEL_240;
          }
LABEL_119:
          if (self->_sendingUnzoomedPanFingers)
          {
            v90 = [(ZOTFullscreenEventHandler *)self eventDelegate];
            [v90 postHandCancelWithSenderID:0x8000000817319374];

            self->_sendingUnzoomedPanFingers = 0;
            [(ZOTFullscreenEventHandler *)self _clearState];
          }
          else
          {
            if (self->_anyFingerDownTime == v46
              && !self->_wasPassingThroughSystemGesture
              && ([(ZOTEvent *)self->_lastEvent handEventType] != 9
               || [v5 handEventType] != 10))
            {
              v176 = [v5 record];
              v174 = [v176 handInfo];
              unsigned int v127 = [v174 isStylus];
              if (!v127) {
                goto LABEL_198;
              }
              v173 = [v5 record];
              v172 = [v173 handInfo];
              v171 = [v172 paths];
              id multiTapTimer = [v171 firstObject];
              [multiTapTimer altitude];
              if (v128 > 0.0)
              {
              }
              else
              {
LABEL_198:
                v152 = [v5 record];
                v153 = [v152 handInfo];
                v154 = [v153 pathsIncludingMayBeginEvents];
                id v155 = [v154 count];

                if (v127)
                {
                }
                if (!v155) {
                  goto LABEL_240;
                }
              }
            }
            if ([(AXThreadTimer *)self->_autopanTimer isPending])
            {
              if (([(AXThreadTimer *)self->_autopanTimer isCancelled] & 1) == 0)
              {
                autopanEvent = self->_autopanEvent;
                if (autopanEvent)
                {
                  if (!self->_snarfing)
                  {
                    v93 = [(ZOTFullscreenEventHandler *)self eventDelegate];
                    [v93 dispatchEventToSystem:self->_autopanEvent];

                    autopanEvent = self->_autopanEvent;
                  }
                  self->_autopanEvent = 0;
                }
              }
            }
            v94 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
            [v94 endZoomMovementWithFullscreenEventHandler:self];

            if (!self->_snarfing || self->_wasPassingThroughSystemGesture)
            {
              v95 = [(ZOTFullscreenEventHandler *)self eventDelegate];
              [v95 dispatchEventToSystem:v5];
            }
            [(ZOTFullscreenEventHandler *)self _clearState];
            [(AXThreadTimer *)self->_passthruEventTimer cancel];
            v96 = [(ZOTFullscreenEventHandler *)self eventDelegate];
            [v96 resetEventQueue];
          }
LABEL_240:
          objc_storeStrong((id *)&self->_lastEvent, obj);
          _handleEvent__LastEventTime = *(void *)&v7;
          _handleEvent__LastEventType = v9;
          goto LABEL_241;
        }
        if (!self->_zooming && !self->_zoomPanning && v175 >= 4)
        {
          self->_snarfing = 0;
          self->_ignoreSnarfingForFingerSession = 1;
          self->_eventFingersTracking = 0;
          v91 = [(ZOTFullscreenEventHandler *)self eventDelegate];
          [v91 dispatchEventToSystem:v5];

          goto LABEL_240;
        }
        if (!multiTapTimer || self->_isTrackingHoverText)
        {
LABEL_108:
          if (v70) {
            goto LABEL_240;
          }
          goto LABEL_119;
        }
        self->_snarfLastTime = v7;
        [(AXThreadTimer *)self->_eventPostTimer cancel];
        v104 = [(ZOTFullscreenEventHandler *)self eventDelegate];
        [v104 resetEventQueue];

        self->_eventFingersTracking = 1;
        unint64_t snarfFingerCount = self->_snarfFingerCount;
        if (v175)
        {
          v106 = [v5 fingerWithIdentifier:self->_snarfFingerIdentifier];
          if (v106 && ([v5 chordChanged] | (snarfFingerCount != v175)) != 1)
          {
            [v106 location];
            double v110 = v129;
            double v111 = v130;
            v107 = v106;
          }
          else
          {
            v107 = [v5 fingerAtIndex:0];

            self->_snarfFingerIdentifier = (int64_t)[v107 identifier];
            [v107 location];
            double v110 = v109;
            double v111 = v108;
            if (fabs(v109) == INFINITY || fabs(v108) == INFINITY)
            {
              v112 = [v5 record];
              [v112 location];
              double v110 = v113;
              double v111 = v114;
            }
            double y = self->_trackingLocation.y;
            self->_offsetLocation.double x = self->_trackingLocation.x - v110;
            self->_offsetLocation.double y = y - v111;
            self->_velocityLastTime = v46;
          }
          unint64_t v131 = v175;
          if (fabs(v110) == INFINITY || fabs(v111) == INFINITY)
          {
            v132 = [v5 record];
            [v132 location];
            double v110 = v133;
            double v111 = v134;

            unint64_t v131 = v175;
          }
          self->_unint64_t snarfFingerCount = v131;
          double v135 = v110 + self->_offsetLocation.x;
          double v136 = v111 + self->_offsetLocation.y;
          self->_trackingLocation.double x = v135;
          self->_trackingLocation.double y = v136;
          unint64_t tapCount = self->_tapCount;
          if (tapCount > 1)
          {
            double v145 = 0.0;
          }
          else
          {
            *(void *)buf = 0;
            double v194 = 0.0;
            [v5 averageLocation];
            CGFloat v140 = v138;
            CGFloat v141 = v139;
            if (self->_velocityLastTime == v46)
            {
              self->_velocityLocation.double x = v138;
              self->_velocityLocation.double y = v139;
              self->_lastPanTime = v46;
            }
            double v142 = ZOTDenormalizePoint(v138);
            ZOTFlipDenormalizedPoint(v142);
            double v143 = ZOTDenormalizePoint(self->_velocityLocation.x);
            ZOTFlipDenormalizedPoint(v143);
            self->_velocityLocation.double x = v140;
            self->_velocityLocation.double y = v141;
            SCRCMathGetVectorAndDistanceForPoints();
            double v144 = ZOTMainScreenScaleFactor();
            unint64_t tapCount = self->_tapCount;
            double v145 = v194 / v144;
          }
          if (tapCount)
          {
            if (tapCount == 1)
            {
              [v5 averageLocation];
              -[ZOTFullscreenEventHandler _updateVelocityAndVectorWithEventLocation:startPoint:endPoint:forTrackpad:](self, "_updateVelocityAndVectorWithEventLocation:startPoint:endPoint:forTrackpad:", 0);
              [(AXThreadTimer *)self->_tapCountResetTimer cancel];
              [(AXThreadTimer *)self->_multiTapTimer cancel];
              if ([(AXThreadTimer *)self->_editingGestureHoldTimer isPending]) {
                unsigned __int8 v146 = 1;
              }
              else {
                unsigned __int8 v146 = [(AXThreadTimer *)self->_editingGestureHoldTimer isActive];
              }
              if (!self->_zooming
                && ([(ZOTFullscreenEventHandler *)self isMainDisplayZoomedIn]
                 || _AXSVoiceOverTouchEnabled()))
              {
                char v156 = self->_shouldPerformEditingGesture ? 1 : v146;
                if ((v156 & 1) == 0)
                {
                  objc_initWeak((id *)buf, self);
                  editingGestureHoldTimer = self->_editingGestureHoldTimer;
                  v192[0] = _NSConcreteStackBlock;
                  v192[1] = 3221225472;
                  v192[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_271;
                  v192[3] = &unk_78C80;
                  objc_copyWeak(&v193, (id *)buf);
                  v190[0] = _NSConcreteStackBlock;
                  v190[1] = 3221225472;
                  v190[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_2_272;
                  v190[3] = &unk_78C80;
                  objc_copyWeak(&v191, (id *)buf);
                  [(AXThreadTimer *)editingGestureHoldTimer afterDelay:v192 processBlock:v190 cancelBlock:0.5];
                  objc_destroyWeak(&v191);
                  objc_destroyWeak(&v193);
                  objc_destroyWeak((id *)buf);
                }
              }
              -[ZOTFullscreenEventHandler _handleDoubleTapEvent:newLocation:](self, "_handleDoubleTapEvent:newLocation:", v5, v135, v136);
            }
LABEL_239:

            goto LABEL_240;
          }
          [(AXThreadTimer *)self->_tapCountResetTimer cancel];
          if (!_AXSVoiceOverTouchEnabled()
            && fabs(self->_mainDisplayZoomLevel + -1.0) < 0.1
            && v145 < 20.0)
          {
            self->_sendingUnzoomedPanFingers = 1;
            v147 = self->_lastEvent;
            objc_initWeak((id *)buf, self);
            autopanTimer = self->_autopanTimer;
            v187[0] = _NSConcreteStackBlock;
            v187[1] = 3221225472;
            v187[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_3_273;
            v187[3] = &unk_78DA8;
            objc_copyWeak(&v189, (id *)buf);
            v149 = v147;
            v188 = v149;
            [(AXThreadTimer *)autopanTimer afterDelay:v187 processBlock:0.5];

            objc_destroyWeak(&v189);
            objc_destroyWeak((id *)buf);
          }
          if (self->_sendingUnzoomedPanFingers) {
            goto LABEL_237;
          }
          double v150 = fabs(v145) + self->_pannerTrackDistance;
          self->_pannerTrackDistance = v150;
          if (v150 <= 20.0 || _AXSVoiceOverTouchEnabled() && v7 - self->_anyFingerDownTime <= 0.175) {
            goto LABEL_237;
          }
          self->_lastPanTime = v7;
          if (snarfFingerCount != v175) {
            self->_borderpanStartTime = v7 + 0.300000012;
          }
          if (v175 == 1)
          {
            if (self->_borderpanMode) {
              goto LABEL_232;
            }
            if (v7 > self->_borderpanStartTime) {
              goto LABEL_197;
            }
            SCRCMathGetAverage();
            if (v163 < 125.0)
            {
              if (self->_borderpanMode)
              {
LABEL_232:
                double x = CGPointZero.x;
                if (CGPointZero.x == self->_initialSingleFingerLocation.x)
                {
                  double x = CGPointZero.y;
                  if (x == self->_initialSingleFingerLocation.y)
                  {
                    [v5 magneticLocation];
                    self->_initialSingleFingerLocation.double x = x;
                    self->_initialSingleFingerLocation.double y = v165;
                  }
                }
                if (self->_snarfing) {
                  -[ZOTFullscreenEventHandler _autoPanIfNecessaryWithEvent:](self, "_autoPanIfNecessaryWithEvent:", v5, x);
                }
                goto LABEL_237;
              }
LABEL_197:
              id v151 = &_dispatch_main_q;
              v186[0] = _NSConcreteStackBlock;
              v186[1] = 3221225472;
              v186[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_4_274;
              v186[3] = &unk_78CA8;
              v186[4] = self;
              dispatch_async((dispatch_queue_t)&_dispatch_main_q, v186);

              self->_borderpanMode = 1;
              goto LABEL_232;
            }
            if (!self->_borderpanMode)
            {
LABEL_237:
              if (v7 - *(double *)&_handleEvent__LastUpdateTime >= 0.016)
              {
                objc_msgSend(v5, "averageLocation", v7 - *(double *)&_handleEvent__LastUpdateTime);
                -[ZOTFullscreenEventHandler _updateVelocityAndVectorWithEventLocation:startPoint:endPoint:forTrackpad:](self, "_updateVelocityAndVectorWithEventLocation:startPoint:endPoint:forTrackpad:", 0);
                _handleEvent__LastUpdateTime = *(void *)&v7;
              }
              goto LABEL_239;
            }
          }
          else if (!self->_borderpanMode)
          {
LABEL_222:
            self->_zoomPanning = 1;
            v160 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
            [v160 fullscreenEventHandler:self updateZoomMovementWithPoint:ZOTDenormalizePoint(self->_trackingLocation.x)];

            goto LABEL_237;
          }
          [(AXThreadTimer *)self->_autopanTimer cancel];
          self->_borderpanMode = 0;
          goto LABEL_222;
        }
        if (!snarfFingerCount || [v5 handEventType] == 8)
        {
LABEL_100:
          self->_velocityLastTime = v46;
          self->_offsetLocation = CGPointZero;
          SCRCMathClearAverage();
          self->_zooming = 0;
          self->_zoomStartOffset = 0.0;
          self->_pannerTrackDistance = 0.0;
          self->_tapDoubleTracking = 0;
          self->_eventFingersTracking = 0;
          self->_zoomPanning = 0;
          self->_unint64_t snarfFingerCount = 0;
          [(AXThreadTimer *)self->_editingGestureHoldTimer cancel];
          self->_shouldPerformEditingGesture = 0;
          id v78 = &_dispatch_main_q;
          v180[0] = _NSConcreteStackBlock;
          v180[1] = 3221225472;
          v180[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_9;
          v180[3] = &unk_78CA8;
          v180[4] = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, v180);

          unint64_t v70 = v175;
          if (!self->_currentlyTransititioningBetweenApps || v7 - self->_lastAppTransition > 1.0)
          {
            v79 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
            id multiTapTimer = [(ZOTFullscreenEventHandler *)self zoomDelegate];
            [multiTapTimer storedZoomLevelWithFullscreenEventHandler:self];
            double v81 = v80;
            v82 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
            [v82 zoomLocationWithFullscreenEventHandler:self];
            objc_msgSend(v79, "fullscreenEventHandler:storeZoomLevel:location:zoomed:forKey:", self, -[ZOTFullscreenEventHandler isMainDisplayZoomedIn](self, "isMainDisplayZoomedIn") ^ 1, self->_applicationKey, v81, v83, v84);

            unint64_t v70 = v175;
          }
          goto LABEL_108;
        }
        if (self->_pannerTrackDistance > 20.0 && !self->_borderpanMode)
        {
          id v116 = &_dispatch_main_q;
          v185[0] = _NSConcreteStackBlock;
          v185[1] = 3221225472;
          v185[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_5;
          v185[3] = &unk_78CA8;
          v185[4] = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, v185);

          SCRCMathGetAverage();
          float v118 = v117;
          if (self->_tapCount != 2)
          {
            if (_AXSVoiceOverTouchEnabled())
            {
              if (self->_snarfing)
              {
                if (v7 - self->_anyFingerDownTime < 0.35
                  || ([(ZOTFullscreenEventHandler *)self zoomDelegate],
                      v119 = objc_claimAutoreleasedReturnValue(),
                      [v119 zoomLevelWithFullscreenEventHandler:self],
                      BOOL v121 = v120 < AXZoomMinimumZoomLevel + 0.000001,
                      v119,
                      v121))
                {
                  double v122 = self->_currentVector;
                  v123 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
                  double v124 = ZOTConvertVectorToScreenStandard((uint64_t)[v123 interfaceOrientationWithFullscreenEventHandler:self], v122);

                  if (v118 <= 125.0)
                  {
                    v167 = 0;
                  }
                  else
                  {
                    float v125 = v124;
                    if (v125 <= 45.0 || v125 >= 315.0)
                    {
                      uint64_t v126 = +[VOSGesture ThreeFingerFlickRight];
                    }
                    else if (v125 <= 45.0 || v125 > 135.0)
                    {
                      if (v125 <= 135.0 || v125 > 225.0)
                      {
                        v167 = 0;
                        if (v125 < 225.0 || v125 > 315.0) {
                          goto LABEL_257;
                        }
                        uint64_t v126 = +[VOSGesture ThreeFingerFlickDown];
                      }
                      else
                      {
                        uint64_t v126 = +[VOSGesture ThreeFingerFlickLeft];
                      }
                    }
                    else
                    {
                      uint64_t v126 = +[VOSGesture ThreeFingerFlickUp];
                    }
                    v167 = (void *)v126;
                  }
LABEL_257:
                  id multiTapTimer = +[NSKeyedArchiver archivedDataWithRootObject:v167 requiringSecureCoding:1 error:0];
                  v170 = +[AXVoiceOverServer server];
                  [v170 triggerGesture:multiTapTimer];

                  goto LABEL_100;
                }
              }
            }
          }
          id multiTapTimer = [(ZOTFullscreenEventHandler *)self zoomDelegate];
          [multiTapTimer fullscreenEventHandler:self continueZoomMovementWithVelocity:v118 angle:self->_currentVector];
        }
        if ((v15 & 1) != 0 || v7 - self->_lastPanTime < 0.25 || self->_zooming || self->_shouldPerformEditingGesture)
        {
          self->_unint64_t tapCount = 0;
          if (self->_shouldPerformEditingGesture)
          {
            id v158 = objc_alloc((Class)NSMutableArray);
            id multiTapTimer = [v5 record];
            id v159 = objc_msgSend(v158, "initWithObjects:", multiTapTimer, 0);

            [(ZOTFullscreenEventHandler *)self _drainEventRepostQueue:v159 replayEvents:1 updateEventTimestamps:1];
          }
          self->_tapLastTime = v46;
          self->_tapDoubleLastTime = v46;
          self->_lastPanTime = v46;
        }
        else
        {
          int64_t v161 = self->_tapCount;
          if (v161 < 1 || v7 - self->_tapLastTime <= 0.25)
          {
            self->_unint64_t tapCount = v161 + 1;
            self->_tapLastTime = v7;
            if (!_AXSVoiceOverTouchEnabled()) {
              [(ZOTFullscreenEventHandler *)self _scheduleTapTimeout];
            }
            if (_AXSVoiceOverTouchEnabled())
            {
              [(AXThreadTimer *)self->_multiTapTimer cancel];
              objc_initWeak((id *)buf, self);
              v162 = (void *)self->_tapCount;
              id multiTapTimer = self->_multiTapTimer;
              v181[0] = _NSConcreteStackBlock;
              v181[1] = 3221225472;
              v181[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_7;
              v181[3] = &unk_78DD0;
              objc_copyWeak(v183, (id *)buf);
              id v182 = v5;
              v183[1] = v162;
              [multiTapTimer afterDelay:v181 processBlock:&__block_literal_global_1 cancelBlock:0.275];

              objc_destroyWeak(v183);
              objc_destroyWeak((id *)buf);
            }
            else
            {
              int64_t v168 = self->_tapCount;
              if (v168 >= 3)
              {
                if (v168 == 3)
                {
                  [(AXThreadTimer *)self->_tapCountResetTimer cancel];
                  [(AXThreadTimer *)self->_editingGestureHoldTimer cancel];
                  id v169 = &_dispatch_main_q;
                  v184[0] = _NSConcreteStackBlock;
                  v184[1] = 3221225472;
                  v184[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_6;
                  v184[3] = &unk_78CA8;
                  v184[4] = self;
                  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v184);
                }
                self->_unint64_t tapCount = 0;
                self->_tapLastTime = v46;
              }
            }
          }
          else
          {
            self->_unint64_t tapCount = 1;
            self->_tapLastTime = v7;
            self->_sendingUnzoomedPanFingers = 0;
          }
        }
        goto LABEL_100;
      }
    }
    if (v18)
    {
      int64_t orbFinger = self->_orbFinger;
      if (orbFinger == -1)
      {
        v28 = [v5 fingerAtIndex:0];
        self->_int64_t orbFinger = (int64_t)[v28 identifier];

        int64_t orbFinger = self->_orbFinger;
      }
      v29 = [v5 fingerWithIdentifier:orbFinger];
      [v29 location];
      double v31 = v30;

      v200[0] = _NSConcreteStackBlock;
      v200[1] = 3221225472;
      v200[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_3;
      v200[3] = &unk_78CD0;
      v200[4] = self;
      v200[5] = ZOTDenormalizePoint(v31);
      v200[6] = v32;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v200);
    }
    else
    {
      [(ZOTFullscreenEventHandler *)self _middleFingerForEvent:v5];
      v201[0] = _NSConcreteStackBlock;
      v201[1] = 3221225472;
      v201[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_2;
      v201[3] = &unk_78CD0;
      v201[4] = self;
      v201[5] = ZOTDenormalizePoint(v33);
      v201[6] = v34;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v201);
      self->_orbSnarfing = 0;
      self->_int64_t orbFinger = -1;
    }
  }
LABEL_241:

  return 1;
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) zoomDelegate];
  objc_msgSend(v2, "fullscreenEventHandler:didStartOrbAtLocation:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) zoomDelegate];
  objc_msgSend(v2, "fullscreenEventHandler:didEndOrbAtLocation:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) zoomDelegate];
  objc_msgSend(v2, "fullscreenEventHandler:updateOrbMovementAtLocation:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) zoomDelegate];
  [v2 stopZoomMovementWithVelocityWithFullscreenEventHandler:*(void *)(a1 + 32)];
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_271(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[1493] = 1;
  if (_AXSVoiceOverTouchEnabled())
  {
    v1 = +[AXVoiceOverServer server];
    [v1 triggerCommand:39];
  }
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_2_272(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _drainEventRepostQueue:*((void *)WeakRetained + 205) replayEvents:0 updateEventTimestamps:0];
  *((unsigned char *)WeakRetained + 1493) = 0;
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_3_273(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained[200])
  {
    id v4 = WeakRetained;
    double v3 = [WeakRetained eventDelegate];
    [v3 dispatchEventToSystem:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_4_274(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) zoomDelegate];
  [v2 endZoomMovementWithFullscreenEventHandler:*(void *)(a1 + 32)];
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) zoomDelegate];
  [v2 endZoomMovementWithFullscreenEventHandler:*(void *)(a1 + 32)];
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_6(uint64_t a1)
{
  double v2 = ZOTDenormalizePoint(*(double *)(*(void *)(a1 + 32) + 1224));
  double v4 = v3;
  id v5 = [*(id *)(a1 + 32) zoomDelegate];
  objc_msgSend(v5, "fullscreenEventHandler:didReceiveThreeFingerTripleTapAtLocation:", *(void *)(a1 + 32), v2, v4);
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleVoiceOverMultiTapActionWithEvent:*(void *)(a1 + 32) tapCount:*(void *)(a1 + 48)];
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_9(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) zoomDelegate];
  [v2 updateStoredZoomedLevelWithFullscreenEventHandler:*(void *)(a1 + 32)];
}

id __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) _eventPostTimerCallback];
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_11(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) zoomDelegate];
  [v2 stopZoomMovementWithVelocityWithFullscreenEventHandler:*(void *)(a1 + 32)];
}

- (BOOL)_handleTrackpadEvent:(id)a3
{
  double v4 = (ZOTEvent *)a3;
  [(ZOTEvent *)v4 time];
  double v6 = v5;
  double v7 = (char *)[(ZOTEvent *)v4 fingerCount];
  unsigned int v8 = [(ZOTEvent *)v4 isTouchEventWeCareAbout];
  unsigned int v9 = v8;
  BOOL v10 = self->_trackpadEventFingersTracking || *(double *)&v6 - self->_snarfLastTime < 0.12;
  self->_BOOL trackpadSnarfing = v10;
  if (self->_trackpadTapCount == 1)
  {
    if (v7 == (unsigned char *)&dword_0 + 3) {
      BOOL v11 = v8;
    }
    else {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }
  self->_anyTrackpadFingerDown = [(ZOTEvent *)v4 fingerCount] != 0;
  if (([(ZOTEvent *)v4 handEventType] & 0xFFFFFFFB) == 1)
  {
    if ([(ZOTEvent *)v4 fingerCount] == (char *)&dword_0 + 1)
    {
      uint64_t v13 = 1552;
    }
    else if ([(ZOTEvent *)v4 fingerCount] == (char *)&dword_0 + 2)
    {
      uint64_t v13 = 1560;
    }
    else
    {
      if ([(ZOTEvent *)v4 fingerCount] != (char *)&dword_0 + 3) {
        goto LABEL_17;
      }
      uint64_t v13 = 1568;
    }
    *(Class *)((char *)&self->super.isa + v13) = v6;
  }
LABEL_17:
  if (self->_anyTrackpadFingerDown)
  {
    double anyTrackpadFingerDownTime = self->_anyTrackpadFingerDownTime;
    double v15 = ZOTTimeUnset;
    if (anyTrackpadFingerDownTime == ZOTTimeUnset) {
      self->_double anyTrackpadFingerDownTime = *(double *)&v6;
    }
  }
  else
  {
    double v15 = ZOTTimeUnset;
    *(void *)&self->_double firstTrackpadFingerDownTime = ZOTTimeUnset;
    self->_double secondTrackpadFingerDownTime = v15;
    self->_thirdTrackpadFingerDownTime = v15;
    [(ZOTFullscreenEventHandler *)self _scheduleTrackpadTapTimeout];
  }
  BOOL trackpadSnarfing = self->_trackpadSnarfing;
  if (v9 && !self->_trackpadSnarfing && v7 == (unsigned char *)&dword_0 + 3)
  {
    double secondTrackpadFingerDownTime = self->_secondTrackpadFingerDownTime;
    double v12 = *(double *)&v6 - secondTrackpadFingerDownTime;
    BOOL v18 = secondTrackpadFingerDownTime == v15;
    double anyTrackpadFingerDownTime = 0.75;
    BOOL v19 = v18 || v12 <= 0.75;
    if (!v19
      || (double firstTrackpadFingerDownTime = self->_firstTrackpadFingerDownTime, firstTrackpadFingerDownTime != v15)
      && (double anyTrackpadFingerDownTime = *(double *)&v6 - firstTrackpadFingerDownTime,
          double v12 = 0.75,
          anyTrackpadFingerDownTime > 0.75))
    {
      if (self->_trackpadSnarfing) {
        unsigned int v21 = v9;
      }
      else {
        unsigned int v21 = 0;
      }
      if (v21 != 1) {
        goto LABEL_86;
      }
      self->_trackpadEventFingersTracking = 1;
      goto LABEL_49;
    }
    self->_BOOL trackpadSnarfing = 1;
    uint64_t v22 = [(ZOTEvent *)v4 record];
    -[ZOTFullscreenEventHandler postHandCancelWithSenderID:](self, "postHandCancelWithSenderID:", [v22 senderID]);

    double v23 = [(ZOTFullscreenEventHandler *)self eventDelegate];
    [v23 disableSleepTimer:1];

    BOOL trackpadSnarfing = self->_trackpadSnarfing;
  }
  if (trackpadSnarfing)
  {
    double v24 = [(ZOTEvent *)v4 record];
    uint64_t v25 = [v24 handInfo];
    if ([v25 initialFingerCount])
    {
      v26 = [(ZOTEvent *)v4 record];
      uint64_t v27 = [v26 handInfo];
      unsigned int v28 = [v27 lifetimeFingerCount];

      if (v28 <= 2)
      {
        v29 = ZOOMLogEvents();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          double v30 = [(ZOTEvent *)v4 record];
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v30;
          _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "one of the trackpad fingers we were tracking with zoom was cancelled, so stop snarfing: %@", buf, 0xCu);
        }
        [(AXThreadTimer *)self->_trackpadTapCountResetTimer cancel];
        goto LABEL_78;
      }
    }
    else
    {
    }
  }
  if (self->_trackpadSnarfing) {
    char v31 = v9;
  }
  else {
    char v31 = 0;
  }
  if (v31)
  {
    self->_trackpadEventFingersTracking = 1;
    if (v7)
    {
LABEL_49:
      unint64_t trackpadSnarfFingerCount = self->_trackpadSnarfFingerCount;
      double v33 = -[ZOTEvent fingerWithIdentifier:](v4, "fingerWithIdentifier:", self->_trackpadSnarfFingerIdentifier, anyTrackpadFingerDownTime, v12);
      if (v33 && ![(ZOTEvent *)v4 chordChanged] && (char *)trackpadSnarfFingerCount == v7)
      {
        [v33 location];
        double v35 = v34;
        double v37 = v36;
      }
      else
      {
        double v38 = [(ZOTEvent *)v4 fingerAtIndex:0];

        self->_trackpadSnarfFingerIdentifier = (int64_t)[v38 identifier];
        [v38 location];
        double v35 = v40;
        double v37 = v39;
        if (fabs(v40) == INFINITY || fabs(v39) == INFINITY)
        {
          double v41 = [(ZOTEvent *)v4 record];
          [v41 location];
          double v35 = v42;
          double v37 = v43;
        }
        double y = self->_trackingTrackpadLocation.y;
        self->_trackpadOffsetLocation.double x = self->_trackingTrackpadLocation.x - v35;
        self->_trackpadOffsetLocation.double y = y - v37;
        self->_trackpadVelocityLastTime = v15;
        double v33 = v38;
      }
      if (fabs(v35) == INFINITY || fabs(v37) == INFINITY)
      {
        v45 = [(ZOTEvent *)v4 record];
        [v45 location];
        double v35 = v46;
        double v37 = v47;
      }
      self->_unint64_t trackpadSnarfFingerCount = (unint64_t)v7;
      double v48 = v35 + self->_trackpadOffsetLocation.x;
      double v49 = v37 + self->_trackpadOffsetLocation.y;
      self->_trackingTrackpadLocation.double x = v48;
      self->_trackingTrackpadLocation.double y = v49;
      unint64_t trackpadTapCount = self->_trackpadTapCount;
      if (trackpadTapCount > 1
        || (block[5] = 0,
            *(void *)buf = 0,
            [(ZOTEvent *)v4 averageLocation],
            self->_trackpadVelocityLocation.double x = v51,
            self->_trackpadVelocityLocation.double y = v52,
            SCRCMathGetVectorAndDistanceForPoints(),
            (unint64_t trackpadTapCount = self->_trackpadTapCount) != 0))
      {
        if (trackpadTapCount == 1)
        {
          [(ZOTEvent *)v4 averageLocation];
          -[ZOTFullscreenEventHandler _updateVelocityAndVectorWithEventLocation:startPoint:endPoint:forTrackpad:](self, "_updateVelocityAndVectorWithEventLocation:startPoint:endPoint:forTrackpad:", 1);
          [(AXThreadTimer *)self->_trackpadTapCountResetTimer cancel];
          -[ZOTFullscreenEventHandler _handleTrackpadDoubleTapEvent:newLocation:](self, "_handleTrackpadDoubleTapEvent:newLocation:", v4, v48, v49);
        }
      }
      else
      {
        [(AXThreadTimer *)self->_trackpadTapCountResetTimer cancel];
      }

      goto LABEL_86;
    }
    if (!self->_trackpadSnarfFingerCount || [(ZOTEvent *)v4 handEventType] == 8) {
      goto LABEL_78;
    }
    if (self->_trackpadZooming)
    {
      self->_unint64_t trackpadTapCount = 0;
      self->_trackpadTapLastTime = v15;
      self->_trackpadTapDoubleLastTime = v15;
    }
    else
    {
      int64_t v53 = self->_trackpadTapCount;
      if (v53 < 1 || *(double *)&v6 - self->_trackpadTapLastTime <= 0.25)
      {
        self->_unint64_t trackpadTapCount = v53 + 1;
        self->_trackpadTapLastTime = *(double *)&v6;
        [(ZOTFullscreenEventHandler *)self _scheduleTrackpadTapTimeout];
        int64_t v54 = self->_trackpadTapCount;
        if (v54 == 3)
        {
          [(AXThreadTimer *)self->_trackpadTapCountResetTimer cancel];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = __50__ZOTFullscreenEventHandler__handleTrackpadEvent___block_invoke;
          block[3] = &unk_78CA8;
          block[4] = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        }
        else if (v54 < 4)
        {
          goto LABEL_78;
        }
        self->_unint64_t trackpadTapCount = 0;
        self->_trackpadTapLastTime = v15;
        goto LABEL_78;
      }
      self->_unint64_t trackpadTapCount = 1;
      self->_trackpadTapLastTime = *(double *)&v6;
    }
LABEL_78:
    self->_trackpadVelocityLastTime = v15;
    self->_trackpadOffsetLocation = CGPointZero;
    SCRCMathClearAverage();
    self->_trackpadZooming = 0;
    self->_zoomStartOffset = 0.0;
    self->_tapDoubleTrackingForTrackpad = 0;
    self->_trackpadEventFingersTracking = 0;
    self->_unint64_t trackpadSnarfFingerCount = 0;
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = __50__ZOTFullscreenEventHandler__handleTrackpadEvent___block_invoke_2;
    v67[3] = &unk_78CA8;
    v67[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v67);
    if (!self->_currentlyTransititioningBetweenApps || *(double *)&v6 - self->_lastAppTransition > 1.0)
    {
      v55 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
      id v56 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
      [v56 storedZoomLevelWithFullscreenEventHandler:self];
      double v58 = v57;
      v59 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
      [v59 zoomLocationWithFullscreenEventHandler:self];
      objc_msgSend(v55, "fullscreenEventHandler:storeZoomLevel:location:zoomed:forKey:", self, -[ZOTFullscreenEventHandler isMainDisplayZoomedIn](self, "isMainDisplayZoomedIn") ^ 1, self->_applicationKey, v58, v60, v61);
    }
  }
  if (!v7
    && (self->_anyTrackpadFingerDownTime != v15
     || [(ZOTEvent *)self->_lastTrackpadEvent handEventType] == 9
     && [(ZOTEvent *)v4 handEventType] == 10))
  {
    float v62 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
    [v62 zoomLevelWithFullscreenEventHandler:self];
    self->_mainDisplayZoomLevel = v63;

    self->_double anyTrackpadFingerDownTime = v15;
    self->_trackpadZooming = 0;
  }
LABEL_86:
  lastTrackpadEvent = self->_lastTrackpadEvent;
  self->_lastTrackpadEvent = v4;

  if (v11)
  {
    CGFloat v65 = [(ZOTFullscreenEventHandler *)self eventDelegate];
    [v65 postHandCancelWithSenderID:0x8000000817319374];
  }
  return v11;
}

void __50__ZOTFullscreenEventHandler__handleTrackpadEvent___block_invoke(uint64_t a1)
{
  double v2 = ZOTDenormalizePoint(0.5);
  double v4 = v3;
  id v5 = [*(id *)(a1 + 32) zoomDelegate];
  objc_msgSend(v5, "fullscreenEventHandler:didReceiveThreeFingerTripleTapAtLocation:", *(void *)(a1 + 32), v2, v4);
}

void __50__ZOTFullscreenEventHandler__handleTrackpadEvent___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) zoomDelegate];
  [v2 updateStoredZoomedLevelWithFullscreenEventHandler:*(void *)(a1 + 32)];
}

- (void)_eventPostTimerCallback
{
  self->_allowTimedEventPosting = 0;
  id v2 = [(ZOTFullscreenEventHandler *)self eventDelegate];
  [v2 dispatchEntireEventQueue];
}

- (void)_clearState
{
  [(AXThreadTimer *)self->_autopanTimer cancel];
  autopanEvent = self->_autopanEvent;
  self->_autopanEvent = 0;

  double v4 = [(ZOTFullscreenEventHandler *)self eventDelegate];
  [v4 disableSleepTimer:0];

  self->_borderpanMode = 0;
  self->_allowTimedEventPosting = 1;
  self->_pannerTrackDistance = 0.0;
  if (self->_ignoreSnarfingForFingerSession) {
    self->_wasPassingThroughSystemGesture = 1;
  }
  self->_ignoreSnarfingForFingerSession = 0;
  self->_zoomPanning = 0;
  double v5 = ZOTTimeUnset;
  *(void *)&self->_anyFingerDownTime = ZOTTimeUnset;
  double v6 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
  [v6 zoomLevelWithFullscreenEventHandler:self];
  self->_mainDisplayZoomLevel = v7;

  self->_timerFingerCount = 0;
  self->_flicking = 0;
  CGPoint v8 = CGPointZero;
  self->_flickLocation = CGPointZero;
  self->_flickTime = v5;
  self->_pinchDetectionDistance = 0.0;
  self->_initialSingleFingerLocation = v8;
  unsigned int v9 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
  [v9 fullscreenEventHandler:self setUsingRelativePushPanning:0];

  self->_firstTouchWentIntoLensContent = 0;
}

- (void)setFirstTouchWentIntoLensContent:(BOOL)a3
{
  self->_firstTouchWentIntoLensContent = a3;
}

- (BOOL)_autoPanIfNecessaryWithEvent:(id)a3
{
  return [(ZOTFullscreenEventHandler *)self _autoPanIfNecessaryWithEvent:a3 isDragging:0];
}

- (BOOL)_autoPanIfNecessaryWithEvent:(id)a3 isDragging:(BOOL)a4
{
  id v7 = a3;
  double v28 = 0.0;
  [v7 magneticLocation];
  double v9 = v8;
  double v11 = v10;
  double v12 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
  unsigned int v13 = [v12 interfaceOrientationWithFullscreenEventHandler:self];
  double v14 = 1.0 - v9;
  if (v13 == 2) {
    double v15 = 1.0 - v9;
  }
  else {
    double v15 = v9;
  }
  if (v13 == 2) {
    double v16 = 1.0 - v11;
  }
  else {
    double v16 = v11;
  }
  if (v13 == 3) {
    double v15 = v11;
  }
  else {
    double v14 = v16;
  }
  if (v13 == 4) {
    double v17 = 1.0 - v11;
  }
  else {
    double v17 = v15;
  }
  if (v13 != 4) {
    double v9 = v14;
  }

  BOOL v18 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
  if (!objc_msgSend(v18, "fullscreenEventHandler:autopanShouldStartWithPoint:speedFactor:initialSingleFingerLocation:fingerCount:pointHasBeenMapped:", self, &v28, 0, v17, v9, self->_initialSingleFingerLocation.x, self->_initialSingleFingerLocation.y, (double)(unint64_t)objc_msgSend(v7, "fingerCount")))
  {

    goto LABEL_21;
  }
  BOOL firstTouchWentIntoLensContent = self->_firstTouchWentIntoLensContent;

  if (!firstTouchWentIntoLensContent)
  {
LABEL_21:
    [(AXThreadTimer *)self->_autopanTimer cancel];
    BOOL v22 = 0;
    goto LABEL_29;
  }
  double v20 = v28;
  self->_autopanSpeedFactor = v28;
  double v21 = 0.0;
  if (v20 > 0.0)
  {
    if (v20 >= 0.100000001) {
      double v21 = 0.00200000009 / v20;
    }
    else {
      double v21 = 0.0200000014;
    }
  }
  self->_autopanDeladouble y = v21;
  objc_storeStrong((id *)&self->_autopanEvent, a3);
  if ([v7 handEventType] == 1) {
    objc_storeStrong((id *)&self->_autopanDownEvent, a3);
  }
  if (![(AXThreadTimer *)self->_autopanTimer isPending]
    || [(AXThreadTimer *)self->_autopanTimer isCancelled])
  {
    objc_initWeak(&location, self);
    autopanTimer = self->_autopanTimer;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __69__ZOTFullscreenEventHandler__autoPanIfNecessaryWithEvent_isDragging___block_invoke;
    v25[3] = &unk_78B78;
    v25[4] = self;
    BOOL v26 = a4;
    [(AXThreadTimer *)autopanTimer afterDelay:v25 processBlock:0.1];
    objc_destroyWeak(&location);
  }
  BOOL v22 = 1;
LABEL_29:

  return v22;
}

id __69__ZOTFullscreenEventHandler__autoPanIfNecessaryWithEvent_isDragging___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAutopanWhileDragging:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_updateAutopanWhileDragging:(BOOL)a3
{
  unsigned int v5 = [(AXThreadTimer *)self->_autopanTimer isCancelled];
  autopanEvent = self->_autopanEvent;
  if (!v5)
  {
    [(ZOTEvent *)autopanEvent magneticLocation];
    double v9 = v8;
    double v11 = v10;
    double v12 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
    unsigned int v13 = [v12 interfaceOrientationWithFullscreenEventHandler:self];
    double v14 = 1.0 - v9;
    if (v13 == 2) {
      double v15 = 1.0 - v9;
    }
    else {
      double v15 = v9;
    }
    if (v13 == 2) {
      double v16 = 1.0 - v11;
    }
    else {
      double v16 = v11;
    }
    if (v13 == 3) {
      double v15 = v11;
    }
    else {
      double v14 = v16;
    }
    if (v13 == 4) {
      double v17 = 1.0 - v11;
    }
    else {
      double v17 = v15;
    }
    if (v13 == 4) {
      double v18 = v9;
    }
    else {
      double v18 = v14;
    }

    double v19 = self->_autopanSpeedFactor * 4.0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __57__ZOTFullscreenEventHandler__updateAutopanWhileDragging___block_invoke;
    block[3] = &unk_78E18;
    block[4] = self;
    *(double *)&block[5] = v17;
    *(double *)&void block[6] = v18;
    *(double *)&void block[7] = v19;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    id v20 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
    if (([v20 usingRelativePushPanningWithFullscreenEventHandler:self] & 1) == 0)
    {
      BOOL snarfing = self->_snarfing;

      if (snarfing
        || a3
        || (-1431655765 * _updateAutopanWhileDragging__ToggleCount + 715827882) > 0x55555554)
      {
        goto LABEL_25;
      }
      id v20 = [(ZOTEvent *)self->_autopanEvent copyWithZone:0];
      [(AXThreadTimer *)self->_eventPostTimer cancel];
      double v23 = [(ZOTFullscreenEventHandler *)self eventDelegate];
      [v23 dispatchEventToSystem:v20];
    }
LABEL_25:
    ++_updateAutopanWhileDragging__ToggleCount;
    objc_initWeak(&location, self);
    autopanTimer = self->_autopanTimer;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __57__ZOTFullscreenEventHandler__updateAutopanWhileDragging___block_invoke_2;
    v24[3] = &unk_78B78;
    v24[4] = self;
    BOOL v25 = a3;
    [(AXThreadTimer *)autopanTimer afterDelay:v24 processBlock:0.0166666675];
    objc_destroyWeak(&location);
    return;
  }
  self->_autopanEvent = 0;

  autopanDownEvent = self->_autopanDownEvent;
  self->_autopanDownEvent = 0;
}

void __57__ZOTFullscreenEventHandler__updateAutopanWhileDragging___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) zoomDelegate];
  objc_msgSend(v2, "fullscreenEventHandler:autopanWithLocation:initialSingleFingerLocation:distance:animationDuration:useGutterDistance:pointHasBeenMapped:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(*(void *)(a1 + 32) + 1472), *(double *)(*(void *)(a1 + 32) + 1480), *(double *)(a1 + 56), 0.0166666675);
}

id __57__ZOTFullscreenEventHandler__updateAutopanWhileDragging___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAutopanWhileDragging:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_handleTrackpadDoubleTapEvent:(id)a3 newLocation:(CGPoint)a4
{
  CGFloat y = a4.y;
  id v6 = a3;
  if (self->_tapDoubleTrackingForTrackpad)
  {
    CGFloat y = self->_zoomerTrackpadTrackStart;
  }
  else
  {
    self->_double zoomerTrackpadTrackStart = y;
    self->_tapDoubleTrackingForTrackpad = 1;
  }
  double v7 = self->_trackingTrackpadLocation.y;
  double v8 = vabdd_f64(y, v7);
  if (self->_trackpadZooming || v8 > 0.0500000007)
  {
    double v9 = y - v7;
    if (self->_trackpadZooming)
    {
      double zoomStartOffset = self->_zoomStartOffset;
    }
    else
    {
      double v11 = ZOOMLogEvents();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        BOOL trackpadZooming = self->_trackpadZooming;
        double zoomerTrackpadTrackStart = self->_zoomerTrackpadTrackStart;
        *(_DWORD *)buf = 67110144;
        BOOL v22 = trackpadZooming;
        __int16 v23 = 1024;
        BOOL v24 = v8 > 0.0500000007;
        __int16 v25 = 2048;
        double v26 = zoomerTrackpadTrackStart;
        __int16 v27 = 2048;
        double v28 = v7;
        __int16 v29 = 2048;
        double v30 = v9;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Zooming. Canceling timer. trackpadZooming:%d deltaExceeded:%d zoomerTrackpadTrackStart:%f zoomValue:%f normalizedDelta:%f", buf, 0x2Cu);
      }

      self->_BOOL trackpadZooming = 1;
      *(double *)v14.i64 = -v9;
      v15.i64[0] = 0x3FA99999A0000000;
      v16.f64[0] = NAN;
      v16.f64[1] = NAN;
      *(void *)&double zoomStartOffset = vbslq_s8((int8x16_t)vnegq_f64(v16), v15, v14).u64[0];
      self->_double zoomStartOffset = zoomStartOffset;
    }
    double v17 = v9 + zoomStartOffset;
    double v18 = AXZoomMinimumZoomLevel;
    double v19 = self->_mainDisplayZoomLevel + v17 * (AXZoomMaximumZoomLevel - AXZoomMinimumZoomLevel) * 0.5;
    if (v19 >= AXZoomMinimumZoomLevel + 0.000001)
    {
      double v18 = v19;
      if (v19 > AXZoomMaximumZoomLevel) {
        double v18 = AXZoomMaximumZoomLevel;
      }
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __71__ZOTFullscreenEventHandler__handleTrackpadDoubleTapEvent_newLocation___block_invoke;
    v20[3] = &unk_78E40;
    v20[4] = self;
    *(double *)&v20[5] = v18;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v20);
  }
}

void __71__ZOTFullscreenEventHandler__handleTrackpadDoubleTapEvent_newLocation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) zoomDelegate];
  [v2 fullscreenEventHandler:*(void *)(a1 + 32) setZoomLevelFromTrackpadGesture:*(double *)(a1 + 40)];
}

- (void)_handleDoubleTapEvent:(id)a3 newLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  if ([v7 fingerCount] == (char *)&dword_0 + 3)
  {
    [(ZOTFullscreenEventHandler *)self _middleFingerForEvent:v7];
    self->_tapPoint.double x = v8;
    self->_tapPoint.double y = v9;
  }
  if (self->_tapDoubleTracking)
  {
    int deviceOrientation = self->_deviceOrientation;
  }
  else
  {
    double v11 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
    self->_int deviceOrientation = [v11 interfaceOrientationWithFullscreenEventHandler:self];

    int deviceOrientation = self->_deviceOrientation;
    double v12 = 1.0 - y;
    if (deviceOrientation != 2) {
      double v12 = y;
    }
    if (deviceOrientation == 3) {
      double v12 = 1.0 - x;
    }
    if (deviceOrientation == 4) {
      double v12 = x;
    }
    self->_double zoomerTrackStart = v12;
    self->_tapDoubleTracking = 1;
  }
  double v13 = self->_trackingLocation.x;
  if (deviceOrientation != 4)
  {
    if (deviceOrientation == 3)
    {
      double v13 = 1.0 - v13;
    }
    else if (deviceOrientation == 2)
    {
      double v13 = 1.0 - self->_trackingLocation.y;
    }
    else
    {
      double v13 = self->_trackingLocation.y;
    }
  }
  double v14 = ZOTDenormalizeValue(self->_zoomerTrackStart - v13);
  if (self->_shouldPerformEditingGesture)
  {
    if (!_AXSVoiceOverTouchEnabled())
    {
      if ([(NSMutableArray *)self->_eventReplayQueue count]) {
        [(ZOTFullscreenEventHandler *)self _drainEventRepostQueue:self->_eventReplayQueue replayEvents:1 updateEventTimestamps:1];
      }
      int8x16_t v15 = +[AXEventTapManager sharedManager];
      float64x2_t v16 = [(ZOTFullscreenEventHandler *)self _zoomSenderIdentifierData];
      double v17 = [v7 record];
      [v17 setAccessibilityData:v16];

      double v18 = [v7 record];
      [v18 applyAccessibilityDataToCreatorHIDEvent];

      double v19 = [v7 record];
      unint64_t v20 = [(ZOTFullscreenEventHandler *)self _senderIDForRepostingOfEvent:v19];

      double v21 = [v7 record];
      [v15 sendHIDSystemEvent:v21 repostCreatorHIDEvent:1 senderID:v20];

      goto LABEL_29;
    }
  }
  else
  {
    double v22 = v14;
    double v23 = fabs(v14);
    if (self->_zooming || v23 > 20.0)
    {
      if (self->_zooming)
      {
        double zoomStartOffset = self->_zoomStartOffset;
      }
      else
      {
        double v28 = ZOOMLogEvents();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          BOOL zooming = self->_zooming;
          double zoomerTrackStart = self->_zoomerTrackStart;
          *(_DWORD *)buf = 67110144;
          BOOL v40 = zooming;
          __int16 v41 = 1024;
          BOOL v42 = v23 > 20.0;
          __int16 v43 = 2048;
          double v44 = zoomerTrackStart;
          __int16 v45 = 2048;
          double v46 = v13;
          __int16 v47 = 2048;
          double v48 = v22;
          _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "Zooming. Canceling timer. zooming:%d deltaExceeded:%d zoomTrackerStart:%f zoomValue:%f normalizedDelta:%f", buf, 0x2Cu);
        }

        [(AXThreadTimer *)self->_editingGestureHoldTimer cancel];
        self->_BOOL zooming = 1;
        *(double *)v31.i64 = -v22;
        v32.i64[0] = 20.0;
        v33.f64[0] = NAN;
        v33.f64[1] = NAN;
        *(void *)&double zoomStartOffset = vbslq_s8((int8x16_t)vnegq_f64(v33), v32, v31).u64[0];
        self->_double zoomStartOffset = zoomStartOffset;
      }
      double v34 = (v22 + zoomStartOffset) * (AXZoomMaximumZoomLevel - AXZoomMinimumZoomLevel);
      ZOTMainScreenSize();
      double v36 = self->_mainDisplayZoomLevel + ZOTMainScreenScaleFactor() * (v34 / v35);
      double v37 = AXZoomMinimumZoomLevel;
      if (v36 >= AXZoomMinimumZoomLevel + 0.000001)
      {
        double v37 = v36;
        if (v36 > AXZoomMaximumZoomLevel) {
          double v37 = AXZoomMaximumZoomLevel;
        }
      }
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = __63__ZOTFullscreenEventHandler__handleDoubleTapEvent_newLocation___block_invoke;
      v38[3] = &unk_78E40;
      v38[4] = self;
      *(double *)&v38[5] = v37;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v38);
    }
    else if (([(AXThreadTimer *)self->_editingGestureHoldTimer isPending] & 1) != 0 {
           || [(AXThreadTimer *)self->_editingGestureHoldTimer isActive])
    }
    {
      BOOL v24 = [(NSMutableArray *)self->_eventReplayQueue lastObject];
      __int16 v25 = [v7 record];

      if (v24 != v25)
      {
        eventReplayQueue = self->_eventReplayQueue;
        int8x16_t v15 = [v7 record];
        [(NSMutableArray *)eventReplayQueue addObject:v15];
LABEL_29:
      }
    }
  }
}

void __63__ZOTFullscreenEventHandler__handleDoubleTapEvent_newLocation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) zoomDelegate];
  [v2 fullscreenEventHandler:*(void *)(a1 + 32) setZoomLevel:*(double *)(a1 + 40) duration:0.0];
}

- (void)_handleVoiceOverMultiTapActionWithEvent:(id)a3 tapCount:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  switch(a4)
  {
    case 1:
      uint64_t v8 = +[VOSGesture ThreeFingerSingleTap];
      goto LABEL_8;
    case 2:
      [v6 time];
      self->_tapDoubleLastTime = v9;
      if ([(ZOTFullscreenEventHandler *)self isAnyDisplayZoomedIn])
      {
        double v10 = v17;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = __78__ZOTFullscreenEventHandler__handleVoiceOverMultiTapActionWithEvent_tapCount___block_invoke_2;
        v17[3] = &unk_78CA8;
        v17[4] = self;
      }
      else
      {
        double v14 = ZOTDenormalizePoint(self->_tapPoint.x);
        double v10 = block;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __78__ZOTFullscreenEventHandler__handleVoiceOverMultiTapActionWithEvent_tapCount___block_invoke;
        block[3] = &unk_78CD0;
        block[4] = self;
        *(double *)&block[5] = v14;
        void block[6] = v15;
      }
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = __78__ZOTFullscreenEventHandler__handleVoiceOverMultiTapActionWithEvent_tapCount___block_invoke_3;
      v16[3] = &unk_78CA8;
      v16[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);
      break;
    case 3:
      uint64_t v8 = +[VOSGesture ThreeFingerDoubleTap];
      goto LABEL_8;
    case 4:
      uint64_t v8 = +[VOSGesture ThreeFingerTripleTap];
      goto LABEL_8;
    case 5:
      uint64_t v8 = +[VOSGesture ThreeFingerQuadrupleTap];
LABEL_8:
      double v11 = (void *)v8;
      double v12 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];

      double v13 = +[AXVoiceOverServer server];
      [v13 triggerGesture:v12];

      break;
    default:
      break;
  }
  self->_unint64_t tapCount = 0;
  *(void *)&self->_tapLastTime = ZOTTimeUnset;
}

void __78__ZOTFullscreenEventHandler__handleVoiceOverMultiTapActionWithEvent_tapCount___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) zoomDelegate];
  objc_msgSend(v2, "fullscreenEventHandler:didReceiveThreeFingerDoubleTapAtLocation:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));

  double v3 = [*(id *)(a1 + 32) zoomDelegate];
  [v3 zoomLevelWithFullscreenEventHandler:*(void *)(a1 + 32)];
  *(void *)(*(void *)(a1 + 32) + 1328) = v4;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unsigned int v5 = objc_msgSend(*(id *)(a1 + 32), "externalDisplayZoomDelegates", 0);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) fullscreenEventHandler:*(void *)(a1 + 32) didReceiveThreeFingerDoubleTapAtLocation:ZOTDenormalizePoint(0.5)];
        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

void __78__ZOTFullscreenEventHandler__handleVoiceOverMultiTapActionWithEvent_tapCount___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isMainDisplayZoomedIn])
  {
    id v2 = [*(id *)(a1 + 32) zoomDelegate];
    objc_msgSend(v2, "fullscreenEventHandler:didReceiveThreeFingerDoubleTapAtLocation:", *(void *)(a1 + 32), CGPointZero.x, CGPointZero.y);

    double v3 = [*(id *)(a1 + 32) zoomDelegate];
    [v3 zoomLevelWithFullscreenEventHandler:*(void *)(a1 + 32)];
    *(void *)(*(void *)(a1 + 32) + 1328) = v4;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned int v5 = objc_msgSend(*(id *)(a1 + 32), "externalDisplayZoomDelegates", 0);
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    double y = CGPointZero.y;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([*(id *)(a1 + 32) isDisplayZoomedIn:v11]) {
          objc_msgSend(v11, "fullscreenEventHandler:didReceiveThreeFingerDoubleTapAtLocation:", *(void *)(a1 + 32), CGPointZero.x, y);
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

void __78__ZOTFullscreenEventHandler__handleVoiceOverMultiTapActionWithEvent_tapCount___block_invoke_3(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) zoomDelegate];
  id v2 = *(void **)(a1 + 32);
  double v3 = [v2 zoomDelegate];
  [v3 storedZoomLevelWithFullscreenEventHandler:*(void *)(a1 + 32)];
  double v5 = v4;
  id v6 = [*(id *)(a1 + 32) zoomDelegate];
  [v6 zoomLocationWithFullscreenEventHandler:*(void *)(a1 + 32)];
  objc_msgSend(v9, "fullscreenEventHandler:storeZoomLevel:location:zoomed:forKey:", v2, objc_msgSend(*(id *)(a1 + 32), "isMainDisplayZoomedIn") ^ 1, *(void *)(*(void *)(a1 + 32) + 1296), v5, v7, v8);
}

- (double)_currentVelocity:(id)a3
{
  id v4 = a3;
  [v4 averageLocation];
  CGFloat v7 = v5;
  CGFloat v8 = v6;
  if (self->_flickTime == ZOTTimeUnset)
  {
    self->_flickLocation.double x = v5;
    self->_flickLocation.double y = v6;
  }
  [v4 time];
  double v10 = v9;

  double v11 = v10 - self->_flickTime;
  self->_flickTime = v10;
  SCRCMathGetDistanceBetweenPoints();
  self->_flickLocation.double x = v7;
  self->_flickLocation.double y = v8;
  double result = v12 / v11;
  if (v11 <= 0.0) {
    return 0.0;
  }
  return result;
}

- (BOOL)_hasReachedFlickVelocity:(id)a3
{
  [(ZOTFullscreenEventHandler *)self _currentVelocity:a3];
  return v3 > 1.0;
}

- (CGPoint)_middleFingerForEvent:(id)a3
{
  id v4 = a3;
  CGFloat v5 = v4;
  if (ZOTIsWildcat)
  {
    uint64_t v6 = ZOTDeviceRotation();
    CGFloat v7 = [(ZOTFullscreenEventHandler *)self zoomDelegate];
    unsigned int v8 = [v7 interfaceOrientationWithFullscreenEventHandler:self];

    BOOL v9 = v6 == 2;
    BOOL v10 = v6 == 2;
    BOOL v11 = v6 == 2;
    if (v8 == 4) {
      BOOL v11 = 0;
    }
    else {
      BOOL v10 = 0;
    }
    if (v8 == 3)
    {
      BOOL v11 = 0;
      BOOL v10 = 0;
    }
    else
    {
      BOOL v9 = 0;
    }
    BOOL v12 = v8 != 2 && v11;
    BOOL v13 = v8 == 2 && v6 == 2;
    BOOL v14 = v8 != 2 && v9;
    BOOL v15 = v8 != 2 && v10;
    float64x2_t v16 = [v5 fingerAtIndex:0];
    [v16 location];
    double v18 = v17;
    double v20 = v19;

    id v21 = [v5 fingerCount];
    if ((uint64_t)v21 >= 2)
    {
      id v22 = v21;
      for (uint64_t i = 1; (id)i != v22; ++i)
      {
        BOOL v24 = [v5 fingerAtIndex:i];
        [v24 location];
        double v26 = v25;
        double v28 = v27;

        if (v13 && v26 < v18) {
          double v29 = v26;
        }
        else {
          double v29 = v18;
        }
        BOOL v30 = v26 > v29 && v12;
        if (v30 || v13 && v26 < v18) {
          double v31 = v28;
        }
        else {
          double v31 = v20;
        }
        int v32 = v15 && v28 < v31;
        if (v15 && v28 < v31) {
          double v31 = v28;
        }
        if (v14 && v28 > v31) {
          double v20 = v28;
        }
        else {
          double v20 = v31;
        }
        if ((v14 && v28 > v31) | v32 | v30) {
          double v18 = v26;
        }
        else {
          double v18 = v29;
        }
      }
    }
  }
  else
  {
    [v4 magneticLocation];
    double v18 = v33;
    double v20 = v34;
  }

  double v35 = v18;
  double v36 = v20;
  result.double y = v36;
  result.double x = v35;
  return result;
}

- (void)_drainEventRepostQueue:(id)a3 replayEvents:(BOOL)a4 updateEventTimestamps:(BOOL)a5
{
  BOOL v22 = a5;
  BOOL v5 = a4;
  id v7 = a3;
  if (v5)
  {
    id v21 = +[AXEventTapManager sharedManager];
    double v20 = [(ZOTFullscreenEventHandler *)self _zoomSenderIdentifierData];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v18 = v7;
    id obj = v7;
    id v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v8)
    {
      id v9 = v8;
      BOOL v10 = 0;
      uint64_t v11 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(obj);
          }
          BOOL v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          BOOL v14 = [v13 HIDTime];
          BOOL v15 = v14;
          if (!v10) {
            BOOL v10 = v14;
          }
          if (v22 && [v13 creatorHIDEvent])
          {
            [v13 setHIDTime:mach_absolute_time()];
            IOHIDEventSetTimeStamp();
          }
          dispatch_time_t v16 = dispatch_time(0, v15 - v10);
          eventReplayDispatchQueue = self->_eventReplayDispatchQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = __87__ZOTFullscreenEventHandler__drainEventRepostQueue_replayEvents_updateEventTimestamps___block_invoke;
          block[3] = &unk_78E68;
          block[4] = v13;
          id v24 = v20;
          id v25 = v21;
          double v26 = self;
          dispatch_after(v16, eventReplayDispatchQueue, block);
        }
        id v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v9);
    }

    id v7 = v18;
  }
  [v7 removeAllObjects];
}

id __87__ZOTFullscreenEventHandler__drainEventRepostQueue_replayEvents_updateEventTimestamps___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAccessibilityData:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) applyAccessibilityDataToCreatorHIDEvent];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(a1 + 48);
  id v4 = [*(id *)(a1 + 56) _senderIDForRepostingOfEvent:v2];

  return [v3 sendHIDSystemEvent:v2 repostCreatorHIDEvent:1 senderID:v4];
}

- (id)_descriptionForEvent:(id)a3
{
  id v3 = a3;
  id v4 = [v3 handInfo];
  id v5 = objc_alloc_init((Class)NSMutableString);
  uint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v4 eventType];
  id v8 = AXDebugDescriptionForAXHandEventType();
  [v5 appendFormat:@"<%@ %p> %12@", v7, v3, v8];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = [v4 paths];
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v14 pathLocation];
        uint64_t v16 = v15;
        [v14 pathLocation];
        [v5 appendFormat:@" {%5.3f, %5.3f}", v16, v17];
      }
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  return v5;
}

- (void)_updateVelocityAndVectorWithEventLocation:(CGPoint)a3 startPoint:(CGPoint)a4 endPoint:(CGPoint)a5 forTrackpad:(BOOL)a6
{
  BOOL v6 = a6;
  double Current = CFAbsoluteTimeGetCurrent();
  double v15 = 0.0;
  SCRCMathGetVectorAndDistanceForPoints();
  if (v6)
  {
    uint64_t v9 = 1120;
  }
  else
  {
    double v15 = 0.0 / ZOTMainScreenScaleFactor();
    uint64_t v9 = 1112;
  }
  double v10 = *(double *)((char *)&self->super.isa + v9);
  if (v10 != ZOTTimeUnset)
  {
    double v11 = Current - v10;
    if (Current - v10 == 0.0) {
      double v12 = 0.0;
    }
    else {
      double v12 = v15 / v11;
    }
    if (v11 < 0.2 || v12 > 125.0)
    {
      if (v6) {
        BOOL v13 = &_updateVelocityAndVectorWithEventLocation_startPoint_endPoint_forTrackpad__LastTrackpadVector;
      }
      else {
        BOOL v13 = &_updateVelocityAndVectorWithEventLocation_startPoint_endPoint_forTrackpad__LastVector;
      }
      SCRCMathUpdateAverage();
      if (*(double *)v13 <= 0.0 || vabdd_f64(*(double *)v13, 0.0) >= 20.0)
      {
        if (v6)
        {
          _updateVelocityAndVectorWithEventLocation_startPoint_endPoint_forTrackpad__LastTrackpadVector = 0;
          goto LABEL_23;
        }
        _updateVelocityAndVectorWithEventLocation_startPoint_endPoint_forTrackpad__LastVector = 0;
      }
      else
      {
        if (v6)
        {
          self->_currentTrackpadVector = 0.0;
          goto LABEL_23;
        }
        self->_double currentVector = 0.0;
      }
LABEL_26:
      uint64_t v14 = 1112;
      goto LABEL_27;
    }
    if (v11 > 0.2) {
      SCRCMathClearAverage();
    }
  }
  if (!v6) {
    goto LABEL_26;
  }
LABEL_23:
  uint64_t v14 = 1120;
LABEL_27:
  *(double *)((char *)&self->super.isa + v14) = Current;
}

- (id)_zoomSenderIdentifierData
{
  return +[AXEventData dataWithSender:3];
}

- (unint64_t)_senderIDForRepostingOfEvent:(id)a3
{
  id v3 = a3;
  if ([v3 creatorHIDEvent]) {
    id SenderID = (id)IOHIDEventGetSenderID();
  }
  else {
    id SenderID = [v3 senderID];
  }
  unint64_t v5 = (unint64_t)SenderID;

  return v5;
}

- (void)_scheduleTrackpadTapTimeout
{
}

- (void)_scheduleTapTimeout
{
}

- (void)_scheduleTapTimeout:(BOOL)a3
{
  BOOL v3 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  if (_AXSVoiceOverTouchEnabled()) {
    int v6 = v3;
  }
  else {
    int v6 = 1;
  }
  BOOL v7 = v6 == 0;
  id v8 = (objc_class *)(&dword_0 + 3);
  if (v7) {
    id v8 = (objc_class *)&dword_4;
  }
  uint64_t v9 = 1280;
  if (v3) {
    uint64_t v9 = 1288;
  }
  double v10 = 0.25;
  if (*(objc_class **)((char *)&self->super.isa + v9) == v8)
  {
    uint64_t v11 = 1200;
    if (v3) {
      uint64_t v11 = 1216;
    }
    double v10 = Current - *(double *)((char *)&self->super.isa + v11) + 0.05;
  }
  uint64_t v12 = 1600;
  if (v3) {
    uint64_t v12 = 1608;
  }
  id v13 = *(id *)((char *)&self->super.isa + v12);
  [v13 cancel];
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __49__ZOTFullscreenEventHandler__scheduleTapTimeout___block_invoke;
  v14[3] = &unk_78EE0;
  objc_copyWeak(v15, &location);
  BOOL v16 = v3;
  v14[4] = self;
  v15[1] = *(id *)&Current;
  [v13 afterDelay:v14 processBlock:&__block_literal_global_290 cancelBlock:v10];
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

void __49__ZOTFullscreenEventHandler__scheduleTapTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = _AXSVoiceOverTouchEnabled();
  int v4 = *(unsigned __int8 *)(a1 + 56);
  if (v3)
  {
    if (!*(unsigned char *)(a1 + 56)) {
      goto LABEL_19;
    }
    int v4 = 1;
  }
  uint64_t v5 = 1288;
  if (!v4) {
    uint64_t v5 = 1280;
  }
  uint64_t v6 = *(void *)&WeakRetained[v5];
  if (v6 == 2)
  {
    uint64_t v9 = *(void *)(a1 + 48);
    if (v4)
    {
      *((void *)WeakRetained + 151) = v9;
      double v10 = -1.0;
      double v11 = -1.0;
    }
    else
    {
      *((void *)WeakRetained + 149) = v9;
      double v10 = ZOTDenormalizePoint(*((double *)WeakRetained + 153));
      double v11 = v12;
    }
    if ([WeakRetained isAnyDisplayZoomedIn])
    {
      id v13 = v17;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = __49__ZOTFullscreenEventHandler__scheduleTapTimeout___block_invoke_3;
      v17[3] = &unk_78CA8;
      v17[4] = WeakRetained;
    }
    else
    {
      id v13 = v15;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      id v15[2] = __49__ZOTFullscreenEventHandler__scheduleTapTimeout___block_invoke_286;
      v15[3] = &unk_78EB8;
      *(double *)&v15[5] = v10;
      *(double *)&v15[6] = v11;
      v15[4] = WeakRetained;
      char v16 = *(unsigned char *)(a1 + 56);
    }
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __49__ZOTFullscreenEventHandler__scheduleTapTimeout___block_invoke_287;
    v14[3] = &unk_78CA8;
    v14[4] = WeakRetained;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
  }
  else if (v6 == 1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __49__ZOTFullscreenEventHandler__scheduleTapTimeout___block_invoke_2;
    block[3] = &unk_78E90;
    char v19 = *(unsigned char *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 32);
    block[4] = WeakRetained;
    void block[5] = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v8 = WeakRetained[1337] == 0;
      goto LABEL_20;
    }
    if (!WeakRetained[1336])
    {
      uint64_t v8 = [WeakRetained isMainDisplayZoomedIn] ^ 1;
      goto LABEL_20;
    }
  }
LABEL_19:
  uint64_t v8 = 0;
LABEL_20:
  if (*(unsigned char *)(a1 + 56))
  {
    *((void *)WeakRetained + 161) = 0;
    *((void *)WeakRetained + 152) = ZOTTimeUnset;
  }
  else
  {
    *((void *)WeakRetained + 160) = 0;
    *((void *)WeakRetained + 150) = ZOTTimeUnset;
    [WeakRetained _drainEventRepostQueue:*((void *)WeakRetained + 205) replayEvents:v8 updateEventTimestamps:0];
  }
}

void __49__ZOTFullscreenEventHandler__scheduleTapTimeout___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) zoomDelegate];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 48)) {
    double v4 = ZOTDenormalizePoint(0.5);
  }
  else {
    [*(id *)(a1 + 32) _middleFingerForEvent:*(void *)(v3 + 176)];
  }
  [v2 fullscreenEventHandler:v3 didReceiveThreeFingerSingleTapAtLocation:v4];

  uint64_t v5 = [*(id *)(a1 + 32) zoomDelegate];
  [v5 zoomLevelWithFullscreenEventHandler:*(void *)(a1 + 32)];
  *(void *)(*(void *)(a1 + 32) + 1328) = v6;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "externalDisplayZoomDelegates", 0);
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) fullscreenEventHandler:*(void *)(a1 + 40) didReceiveThreeFingerSingleTapAtLocation:ZOTDenormalizePoint(0.5)];
      }
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

void __49__ZOTFullscreenEventHandler__scheduleTapTimeout___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = ZOOMLogEvents();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "3. did receive three finger double tap at {0,0}", buf, 2u);
  }

  if ([*(id *)(a1 + 32) isMainDisplayZoomedIn])
  {
    uint64_t v3 = [*(id *)(a1 + 32) zoomDelegate];
    objc_msgSend(v3, "fullscreenEventHandler:didReceiveThreeFingerDoubleTapAtLocation:", *(void *)(a1 + 32), CGPointZero.x, CGPointZero.y);

    double v4 = [*(id *)(a1 + 32) zoomDelegate];
    [v4 zoomLevelWithFullscreenEventHandler:*(void *)(a1 + 32)];
    *(void *)(*(void *)(a1 + 32) + 1328) = v5;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "externalDisplayZoomDelegates", 0);
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    double y = CGPointZero.y;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([*(id *)(a1 + 32) isDisplayZoomedIn:v12]) {
          objc_msgSend(v12, "fullscreenEventHandler:didReceiveThreeFingerDoubleTapAtLocation:", *(void *)(a1 + 32), CGPointZero.x, y);
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }
}

void __49__ZOTFullscreenEventHandler__scheduleTapTimeout___block_invoke_286(uint64_t a1)
{
  uint64_t v2 = ZOOMLogEvents();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromPoint(*(NSPoint *)(a1 + 40));
    *(_DWORD *)buf = 138412290;
    long long v22 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "4. did receive three finger double tap at %@", buf, 0xCu);
  }
  double v4 = [*(id *)(a1 + 32) zoomDelegate];
  objc_msgSend(v4, "fullscreenEventHandler:didReceiveThreeFingerDoubleTapAtLocation:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));

  uint64_t v5 = [*(id *)(a1 + 32) zoomDelegate];
  [v5 zoomLevelWithFullscreenEventHandler:*(void *)(a1 + 32)];
  *(void *)(*(void *)(a1 + 32) + 1328) = v6;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "externalDisplayZoomDelegates", 0);
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = *(void *)(a1 + 32);
        double v14 = -1.0;
        double v15 = -1.0;
        if (!*(unsigned char *)(a1 + 56)) {
          double v14 = ZOTDenormalizePoint(0.5);
        }
        objc_msgSend(v12, "fullscreenEventHandler:didReceiveThreeFingerDoubleTapAtLocation:", v13, v14, v15);
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

void __49__ZOTFullscreenEventHandler__scheduleTapTimeout___block_invoke_287(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) zoomDelegate];
  [v2 updateSystemGestureDisablingAssertionsWithFullscreenEventHandler:*(void *)(a1 + 32)];
}

- (ZOTFullscreenEventHandlerDelegate)eventDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventDelegate);

  return (ZOTFullscreenEventHandlerDelegate *)WeakRetained;
}

- (void)setEventDelegate:(id)a3
{
}

- (ZOTFullscreenZoomHandlerDelegate)zoomDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_zoomDelegate);

  return (ZOTFullscreenZoomHandlerDelegate *)WeakRetained;
}

- (void)setZoomDelegate:(id)a3
{
}

- (NSPointerArray)externalDisplayZoomDelegates
{
  return self->_externalDisplayZoomDelegates;
}

- (void)setExternalDisplayZoomDelegates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalDisplayZoomDelegates, 0);
  objc_destroyWeak((id *)&self->_zoomDelegate);
  objc_destroyWeak((id *)&self->_eventDelegate);
  objc_storeStrong((id *)&self->_eventReplayDispatchQueue, 0);
  objc_storeStrong((id *)&self->_eventReplayQueue, 0);
  objc_storeStrong((id *)&self->_hoverTextTapTimer, 0);
  objc_storeStrong((id *)&self->_editingGestureHoldTimer, 0);
  objc_storeStrong((id *)&self->_trackpadTapCountResetTimer, 0);
  objc_storeStrong((id *)&self->_tapCountResetTimer, 0);
  objc_storeStrong((id *)&self->_conflictAlertData, 0);
  objc_storeStrong((id *)&self->_autopanDownEvent, 0);
  objc_storeStrong((id *)&self->_autopanEvent, 0);
  objc_storeStrong((id *)&self->_autopanTimer, 0);
  objc_storeStrong((id *)&self->_multiTapTimer, 0);
  objc_storeStrong((id *)&self->_applicationKey, 0);
  objc_storeStrong((id *)&self->_lastTrackpadEvent, 0);
  objc_storeStrong((id *)&self->_lastEvent, 0);
  objc_storeStrong((id *)&self->_lastDownEvent, 0);
  objc_storeStrong((id *)&self->_passthruEventTimer, 0);
  objc_storeStrong((id *)&self->_passthruEventQueue, 0);
  objc_storeStrong((id *)&self->_eventPostTimer, 0);
  objc_storeStrong((id *)&self->_cachedGestures, 0);

  objc_storeStrong((id *)&self->_eventQueue, 0);
}

@end