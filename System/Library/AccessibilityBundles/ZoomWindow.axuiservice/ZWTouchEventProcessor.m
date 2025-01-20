@interface ZWTouchEventProcessor
- (BOOL)_handleEvent:(id)a3;
- (BOOL)_handleTouchEvent:(id)a3;
- (BOOL)_handleWheelEvent:(id)a3;
- (BOOL)_handleZoomGreySupportAccessibilityEvent:(id)a3;
- (BOOL)_ignoreEventWhileStylusInUse:(id)a3;
- (BOOL)_isZoomContextID:(unsigned int)a3;
- (BOOL)_panBackwardOnMainDisplay;
- (BOOL)_panForwardOnMainDisplay;
- (BOOL)_shouldFilterPointerEvent:(id)a3;
- (BOOL)_toggleZoomOnMainDisplay;
- (BOOL)handlePointerEvent:(id)a3;
- (CGPoint)_convertZoomOffset:(CGPoint)result toScreenCoordinatesFromInterfaceOrientation:(int64_t)a4;
- (CGPoint)_convertZoomPointToSystemPoint:(CGPoint)a3 lensFrame:(CGRect)a4 offset:(CGPoint)a5 zoomFactor:(double)a6;
- (CGPoint)_flipCoordinates:(CGPoint)result orientation:(int64_t)a4 screenSize:(CGSize)a5;
- (CGPoint)_shiftPointForReplicators:(CGPoint)a3;
- (ZWTouchEventProcessor)initWithHIDTapIdentifier:(id)a3 HIDEventTapPriority:(int)a4 systemEventTapIdentifier:(id)a5 systemEventTapPriority:(int)a6;
- (id)fullscreenEventHandler;
- (id)zoomDelegateForEvent:(id)a3;
- (unint64_t)_mapAXEventToZoomGreyAction:(id)a3;
- (void)_cleanEventUpdateMap;
- (void)_dispatchZoomRemapEvent:(id)a3;
- (void)_dispatchZoomRemapEvent:(id)a3 lensFrame:(CGRect)a4 offset:(CGPoint)a5 zoomFactor:(double)a6 applyZoom:(BOOL)a7 menuScreenRect:(CGRect)a8;
- (void)_dispatchZoomRemapUpdate:(id)a3;
- (void)_postCancelEvent;
- (void)_setupZoomGreyObservers;
- (void)_updateZoomHandGesturesActionCustomizations;
- (void)dealloc;
- (void)disableSleepTimer:(BOOL)a3;
- (void)dispatchEventToSystem:(id)a3;
- (void)postHandCancelWithSenderID:(unint64_t)a3;
@end

@implementation ZWTouchEventProcessor

- (ZWTouchEventProcessor)initWithHIDTapIdentifier:(id)a3 HIDEventTapPriority:(int)a4 systemEventTapIdentifier:(id)a5 systemEventTapPriority:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  v32.receiver = self;
  v32.super_class = (Class)ZWTouchEventProcessor;
  v12 = [(ZWEventProcessor *)&v32 initWithHIDTapIdentifier:v10 HIDEventTapPriority:v8 systemEventTapIdentifier:v11 systemEventTapPriority:v6];
  if (v12)
  {
    v13 = [ZOTFullscreenEventHandler alloc];
    v14 = [(ZWTouchEventProcessor *)v12 HIDEventReceiveThread];
    v15 = [(ZOTFullscreenEventHandler *)v13 initWithEventThread:v14];
    fullscreenEventHandler = v12->_fullscreenEventHandler;
    v12->_fullscreenEventHandler = v15;

    [(ZOTFullscreenEventHandler *)v12->_fullscreenEventHandler setEventDelegate:v12];
    v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    fullScreenEventQueue = v12->_fullScreenEventQueue;
    v12->_fullScreenEventQueue = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    eventIdentifiersToFinalLocations = v12->_eventIdentifiersToFinalLocations;
    v12->_eventIdentifiersToFinalLocations = v19;

    v21 = (AXDispatchTimer *)objc_alloc_init((Class)AXDispatchTimer);
    eventUpdateMapCleanerTimer = v12->_eventUpdateMapCleanerTimer;
    v12->_eventUpdateMapCleanerTimer = v21;

    [(AXDispatchTimer *)v12->_eventUpdateMapCleanerTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    objc_initWeak(&location, v12);
    v23 = +[AXSettings sharedInstance];
    v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    v28 = __118__ZWTouchEventProcessor_initWithHIDTapIdentifier_HIDEventTapPriority_systemEventTapIdentifier_systemEventTapPriority___block_invoke;
    v29 = &unk_78C80;
    objc_copyWeak(&v30, &location);
    [v23 registerUpdateBlock:&v26 forRetrieveSelector:"zoomTrackpadGestureEnabled" withListener:v12];

    objc_destroyWeak(&v30);
    v24 = +[AXSettings sharedInstance];
    v12->_stealTrackpadGestures = [v24 zoomTrackpadGestureEnabled];

    [(ZWTouchEventProcessor *)v12 _setupZoomGreyObservers];
    objc_destroyWeak(&location);
  }

  return v12;
}

void __118__ZWTouchEventProcessor_initWithHIDTapIdentifier_HIDEventTapPriority_systemEventTapIdentifier_systemEventTapPriority___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = +[AXSettings sharedInstance];
  WeakRetained[140] = [v1 zoomTrackpadGestureEnabled];
}

- (void)_setupZoomGreyObservers
{
  v3 = +[AXSettings sharedInstance];
  v4 = [v3 zoomHandGesturesActionCustomizations];
  handGestureCommandDict = self->_handGestureCommandDict;
  self->_handGestureCommandDict = v4;

  objc_initWeak(&location, self);
  uint64_t v6 = +[AXSettings sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __48__ZWTouchEventProcessor__setupZoomGreyObservers__block_invoke;
  v7[3] = &unk_78C80;
  objc_copyWeak(&v8, &location);
  [v6 registerUpdateBlock:v7 forRetrieveSelector:"zoomHandGesturesActionCustomizations" withListener:self];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __48__ZWTouchEventProcessor__setupZoomGreyObservers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateZoomHandGesturesActionCustomizations];
}

- (void)dealloc
{
  [(ZOTFullscreenEventHandler *)self->_fullscreenEventHandler setEventDelegate:0];
  [(BSInvalidatable *)self->_sleepTimerDisabledAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ZWTouchEventProcessor;
  [(ZWEventProcessor *)&v3 dealloc];
}

- (id)fullscreenEventHandler
{
  return self->_fullscreenEventHandler;
}

- (BOOL)_handleEvent:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)[v4 senderID] + 0x7FFFFFF7E8CE6C8ELL;
  if (v5 < 8 && ((0x87u >> v5) & 1) != 0
    || ([v4 accessibilityData],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v7 = (char *)[v6 eventSenderIdentifier],
        v6,
        v7 == (unsigned char *)&dword_0 + 3))
  {
    unsigned __int8 v8 = 0;
    goto LABEL_47;
  }
  if ([v4 type] == 3001)
  {
    v9 = [v4 handInfo];
    unsigned int v10 = [v9 eventType];

    if (v10 == 11)
    {
      id v11 = [(ZWEventProcessor *)self hidPostThread];
      unsigned __int8 v8 = 1;
      [v11 performSelector:"_dispatchZoomRemapUpdate:" onTarget:self count:1 objects:v4];
      goto LABEL_46;
    }
    eventUpdateMapCleanerTimer = self->_eventUpdateMapCleanerTimer;
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = __38__ZWTouchEventProcessor__handleEvent___block_invoke;
    v48[3] = &unk_78CA8;
    v48[4] = self;
    [(AXDispatchTimer *)eventUpdateMapCleanerTimer afterDelay:v48 processBlock:1.0];
    id v13 = [v4 copy];
    unsigned __int8 v14 = [(ZWTouchEventProcessor *)self _handleTouchEvent:v13];
    goto LABEL_11;
  }
  if ([v4 type] == 1100) {
    goto LABEL_9;
  }
  if ([v4 type] == 3200 && self->_stealTrackpadGestures)
  {
    v15 = [v4 pointerControllerInfo];
    id v13 = [v15 trackpadHandEvent];

    if (!v13)
    {
      unsigned __int8 v8 = 0;
      goto LABEL_12;
    }
    unsigned __int8 v14 = [(ZOTFullscreenEventHandler *)self->_fullscreenEventHandler handleTrackpadEvent:v13];
LABEL_11:
    unsigned __int8 v8 = v14;
LABEL_12:

    goto LABEL_42;
  }
  if ([v4 type] != 10 && objc_msgSend(v4, "type") != 11)
  {
LABEL_9:
    unsigned __int8 v8 = 0;
    goto LABEL_42;
  }
  v16 = +[ZoomServicesKeyboardManager sharedInstance];
  v17 = (char *)[v16 keyboardCommandForEvent:v4];

  if (v17 == (unsigned char *)&dword_0 + 2)
  {
    v18 = [(ZWTouchEventProcessor *)self fullscreenEventHandler];
    unsigned __int8 v19 = [v18 isAnyDisplayZoomedIn];

    if (v19)
    {
      v20 = [(ZWTouchEventProcessor *)self fullscreenEventHandler];
      v21 = [(ZWEventProcessor *)self mainDisplayDelegate];
      unsigned int v22 = [v20 isDisplayZoomedIn:v21];

      if (v22)
      {
        v23 = [(ZWEventProcessor *)self mainDisplayDelegate];
        [v23 eventProcessor:self didReceiveKeyboardEventWithCommand:2];
      }
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v24 = [(ZWEventProcessor *)self externalDisplayDelegates];
      id v25 = [v24 countByEnumeratingWithState:&v40 objects:v49 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v41;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v41 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            id v30 = [(ZWTouchEventProcessor *)self fullscreenEventHandler];
            unsigned int v31 = [v30 isDisplayZoomedIn:v29];

            if (v31) {
              [v29 eventProcessor:self didReceiveKeyboardEventWithCommand:2];
            }
          }
          id v26 = [v24 countByEnumeratingWithState:&v40 objects:v49 count:16];
        }
        while (v26);
      }
    }
    else
    {
      objc_super v32 = [(ZWEventProcessor *)self mainDisplayDelegate];
      [v32 eventProcessor:self didReceiveKeyboardEventWithCommand:2];

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v24 = [(ZWEventProcessor *)self externalDisplayDelegates];
      id v33 = [v24 countByEnumeratingWithState:&v44 objects:v50 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v45;
        do
        {
          for (j = 0; j != v34; j = (char *)j + 1)
          {
            if (*(void *)v45 != v35) {
              objc_enumerationMutation(v24);
            }
            [*(id *)(*((void *)&v44 + 1) + 8 * (void)j) eventProcessor:self didReceiveKeyboardEventWithCommand:2];
          }
          id v34 = [v24 countByEnumeratingWithState:&v44 objects:v50 count:16];
        }
        while (v34);
      }
    }
  }
  else
  {
    v24 = [(ZWTouchEventProcessor *)self zoomDelegateForEvent:v4];
    [v24 eventProcessor:self didReceiveKeyboardEventWithCommand:v17];
  }

  unsigned __int8 v8 = (unint64_t)(v17 - 17) < 0xFFFFFFFFFFFFFFFDLL;
LABEL_42:
  if ([v4 type] != 5000) {
    goto LABEL_47;
  }
  id v11 = [v4 accessibilityData];
  if ([v11 page] != (char *)&dword_0 + 2)
  {
LABEL_46:

    goto LABEL_47;
  }
  v37 = +[AXSettings sharedInstance];
  unsigned int v38 = [v37 zoomHandGesturesEnabled];

  if (v38) {
    unsigned __int8 v8 = [(ZWTouchEventProcessor *)self _handleZoomGreySupportAccessibilityEvent:v4];
  }
LABEL_47:

  return v8;
}

void __38__ZWTouchEventProcessor__handleEvent___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) hidPostThread];
  [v2 performSelector:"_cleanEventUpdateMap" onTarget:*(void *)(a1 + 32) count:0 objects:0];
}

- (BOOL)_handleWheelEvent:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ZWTouchEventProcessor *)self zoomDelegateForEvent:v4];
  uint64_t v6 = (char *)[v4 scrollAmount];
  id v7 = [v4 scrollAccelAmount];

  LOBYTE(self) = [v5 eventProcessor:self didGetWheelEventWithDelta:&v6[(void)v7]];
  return (char)self;
}

- (BOOL)_handleTouchEvent:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 handInfo];
  unsigned int v6 = [v5 eventType];

  id v7 = [v4 denormalizedEventRepresentation:0 descale:1];

  unsigned __int8 v8 = [v7 handInfo];
  v9 = [v8 paths];
  unsigned int v10 = [v9 firstPath];
  [v10 pathLocation];
  double v12 = v11;
  double v14 = v13;

  uint64_t v15 = ZOTEventRealFingerCount(v7);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v69 = 0u;
  memset(&v68, 0, sizeof(v68));
  memset(&v67, 0, sizeof(v67));
  long long v65 = 0u;
  memset(&v66, 0, sizeof(v66));
  long long v64 = 0u;
  v16 = [(ZWEventProcessor *)self mainDisplayDelegate];
  v17 = v16;
  if (v16)
  {
    [v16 currentUIContextForEventProcessor:self];
  }
  else
  {
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v69 = 0u;
    memset(&v68, 0, sizeof(v68));
    memset(&v67, 0, sizeof(v67));
    long long v65 = 0u;
    memset(&v66, 0, sizeof(v66));
    long long v64 = 0u;
  }

  if (v6 == 1)
  {
    if (self->_userIsTouchingScreen)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __43__ZWTouchEventProcessor__handleTouchEvent___block_invoke;
      block[3] = &unk_78CA8;
      id v63 = v7;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    v18 = [v7 handInfo];
    self->_BOOL stylusIsTouchingScreen = [v18 isStylus];

    self->_userIsTouchingScreen = 1;
    self->_BOOL firstTouchWentIntoLensContent = 0;
    [(ZOTFullscreenEventHandler *)self->_fullscreenEventHandler setFirstTouchWentIntoLensContent:0];
    self->_firstTouchWentIntoLensContentOuterPerimeter = 0;
    self->_firstTouchWentIntoSlug = 0;
    unsigned __int8 v19 = [(ZWEventProcessor *)self mainDisplayDelegate];
    [v19 removeHomeGestureAssertionWithEventProcessor:self];

    v20 = [(ZWEventProcessor *)self mainDisplayDelegate];
    objc_msgSend(v20, "eventProcessor:didGetFirstTouchAtLocation:", self, v12, v14);

    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = __43__ZWTouchEventProcessor__handleTouchEvent___block_invoke_2;
    v61[3] = &unk_78CA8;
    v61[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v61);
  }
  else
  {
    switch(v6)
    {
      case 6u:
      case 8u:
      case 0xAu:
        goto LABEL_9;
      case 9u:
        if (self->_userIsTouchingScreen)
        {
LABEL_9:
          self->_userIsTouchingScreen = 0;
          v21 = [v7 handInfo];
          unsigned __int8 v22 = [v21 isStylus];
          BOOL stylusIsTouchingScreen = 0;
          if ((v22 & 1) == 0) {
            BOOL stylusIsTouchingScreen = self->_stylusIsTouchingScreen;
          }
          self->_BOOL stylusIsTouchingScreen = stylusIsTouchingScreen;

          v24 = [(ZWEventProcessor *)self mainDisplayDelegate];
          [v24 lastFingerWasLiftedWithEventProcessor:self firstTouchWentIntoSlug:self->_firstTouchWentIntoSlug];

          id v25 = [(ZWEventProcessor *)self mainDisplayDelegate];
          [v25 removeHomeGestureAssertionWithEventProcessor:self];
        }
        break;
      default:
        break;
    }
  }
  id v26 = [(ZWEventProcessor *)self mainDisplayDelegate];
  unsigned __int8 v27 = [v26 isBrailleInputUIShowingWithEventProcessor:self];

  if (v27) {
    goto LABEL_13;
  }
  __int16 v29 = WORD4(v79);
  if ((BYTE8(v79) & 0xA) != 0 || (BYTE8(v79) & 0x31) == 1)
  {
    if (v15 == 3)
    {
      -[ZOTFullscreenEventHandler postHandCancelWithSenderID:](self->_fullscreenEventHandler, "postHandCancelWithSenderID:", [v7 senderID]);
LABEL_47:
      BOOL v28 = 1;
      goto LABEL_48;
    }
    goto LABEL_13;
  }
  if (v15 == 1)
  {
    if (self->_firstTouchWentIntoSlug)
    {
      if (v6 != 1)
      {
        if ((WORD4(v79) & 0x200) == 0)
        {
LABEL_20:
          if (!ZOTEventMeetsOrbThreshold(v7) || (WORD4(v79) & 0x800) != 0)
          {
LABEL_22:
            if (self->_firstTouchWentIntoSlug) {
              goto LABEL_23;
            }
            goto LABEL_35;
          }
LABEL_34:
          objc_super v32 = [v7 normalizedEventRepresentation:0 scale:1];

          [v32 setAllowsZoomOrb:1];
          fullscreenEventHandler = self->_fullscreenEventHandler;
          goto LABEL_74;
        }
LABEL_33:
        if ((v29 & 0x800) != 0) {
          goto LABEL_22;
        }
        goto LABEL_34;
      }
    }
    else
    {
      v80.CGFloat x = v12;
      v80.CGFloat y = v14;
      BOOL v31 = CGRectContainsPoint(v67, v80);
      if (v6 != 1 || !v31) {
        goto LABEL_35;
      }
      __int16 v29 = WORD4(v79);
    }
    self->_firstTouchWentIntoSlug = 1;
    if ((v29 & 0x200) == 0) {
      goto LABEL_20;
    }
    goto LABEL_33;
  }
LABEL_35:
  BOOL IsEmpty = CGRectIsEmpty(v68);
  v81.CGFloat x = v12;
  v81.CGFloat y = v14;
  if (!CGRectContainsPoint(v68, v81) || (BYTE8(v79) & 4) != 0 || v15 >= 2)
  {
    if (!IsEmpty)
    {
      long long v44 = [(ZWEventProcessor *)self mainDisplayDelegate];
      [v44 didGetTouchOutsideZoomMenuWithEventProcessor:self];
LABEL_46:

      goto LABEL_47;
    }
    double v35 = ZWZoomLensBorderThicknessForTouches();
    CGRect v85 = CGRectInset(v66, v35, v35);
    CGFloat x = v85.origin.x;
    CGFloat y = v85.origin.y;
    CGFloat height = v85.size.height;
    CGFloat width = v85.size.width;
    CGRect v86 = CGRectInset(v66, -v35, -v35);
    CGFloat v38 = v86.origin.x;
    CGFloat v39 = v86.origin.y;
    CGFloat v40 = v86.size.width;
    CGFloat v41 = v86.size.height;
    unsigned int v42 = WORD4(v79);
    if ((BYTE8(v79) & 0x10) != 0)
    {
      BOOL v43 = 0;
    }
    else
    {
      v82.CGFloat x = v12;
      v82.CGFloat y = v14;
      BOOL v43 = CGRectContainsPoint(v86, v82);
      unsigned int v42 = WORD4(v79);
    }
    if ((v42 & 0x100) != 0 && !v43)
    {
      long long v44 = [(ZWEventProcessor *)self mainDisplayDelegate];
      [v44 didGetTouchOutsideLensChromeWithEventProcessor:self];
      goto LABEL_46;
    }
    if (v6 == 1)
    {
      v87.origin.CGFloat x = x;
      v87.origin.CGFloat y = y;
      v87.size.CGFloat height = height;
      v87.size.CGFloat width = width;
      v83.CGFloat x = v12;
      v83.CGFloat y = v14;
      BOOL v46 = CGRectContainsPoint(v87, v83);
      self->_BOOL firstTouchWentIntoLensContent = v46;
      [(ZOTFullscreenEventHandler *)self->_fullscreenEventHandler setFirstTouchWentIntoLensContent:v46 | ((BYTE8(v79) & 0x10) >> 4)];
      v88.origin.CGFloat x = v38;
      v88.origin.CGFloat y = v39;
      v88.size.CGFloat width = v40;
      v88.size.CGFloat height = v41;
      v84.CGFloat x = v12;
      v84.CGFloat y = v14;
      self->_firstTouchWentIntoLensContentOuterPerimeter = CGRectContainsPoint(v88, v84);
      unsigned int v42 = WORD4(v79);
    }
    BOOL v47 = (v42 & 0x90) == 0 && v43;
    BOOL firstTouchWentIntoLensContent = self->_firstTouchWentIntoLensContent;
    if (v47)
    {
      if (self->_firstTouchWentIntoLensContent)
      {
        BOOL firstTouchWentIntoLensContent = 1;
      }
      else if (v15 == 1 && (v42 & 4) == 0)
      {
LABEL_23:
        if (self->_userIsTouchingScreen)
        {
          id v30 = [(ZWEventProcessor *)self mainDisplayDelegate];
          [v30 blockHomeGestureIfNeededWithEventProcessor:self];
        }
        goto LABEL_13;
      }
    }
    if ((v42 & 4) != 0)
    {
      if (v6 != 1 || (v42 & 0x100) != 0) {
        goto LABEL_70;
      }
    }
    else if ((v42 & 0x20) != 0)
    {
      if ((v42 & 0x140) != 0x40 || !firstTouchWentIntoLensContent) {
        goto LABEL_70;
      }
    }
    else
    {
      int v49 = (v42 >> 8) & 1;
      if (v6 != 1) {
        int v49 = 1;
      }
      if ((v49 | v43)) {
        goto LABEL_70;
      }
    }
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = __43__ZWTouchEventProcessor__handleTouchEvent___block_invoke_3;
    v60[3] = &unk_78CA8;
    v60[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v60);
LABEL_70:
    objc_super v32 = [v7 normalizedEventRepresentation:0 scale:1];

    if ((BYTE8(v79) & 4) != 0)
    {
      if (self->_firstTouchWentIntoLensContentOuterPerimeter)
      {
        v51 = [(ZWEventProcessor *)self mainDisplayDelegate];
        id v52 = [v51 currentInterfaceOrientationForEventProcessor:self];

        -[ZWTouchEventProcessor _convertZoomOffset:toScreenCoordinatesFromInterfaceOrientation:](self, "_convertZoomOffset:toScreenCoordinatesFromInterfaceOrientation:", v52, *((double *)&v78 + 1), *(double *)&v79);
        -[ZWTouchEventProcessor _convertZoomPointToSystemPoint:lensFrame:offset:zoomFactor:](self, "_convertZoomPointToSystemPoint:lensFrame:offset:zoomFactor:", v12, v14, *(_OWORD *)&v66.origin, *(_OWORD *)&v66.size, v53, v54, (void)v69);
        double v12 = v55;
        double v14 = v56;
      }
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = __43__ZWTouchEventProcessor__handleTouchEvent___block_invoke_4;
      v59[3] = &unk_78CD0;
      v59[4] = self;
      *(double *)&v59[5] = v12;
      *(double *)&v59[6] = v14;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v59);
      unsigned __int8 v50 = [(ZOTFullscreenEventHandler *)self->_fullscreenEventHandler handleSpeakUnderFingerEvent:v32];
      goto LABEL_78;
    }
    if ((WORD4(v79) & 0x1000) != 0) {
      [(ZOTFullscreenEventHandler *)self->_fullscreenEventHandler handleDragEvent:v32];
    }
    fullscreenEventHandler = self->_fullscreenEventHandler;
LABEL_74:
    unsigned __int8 v50 = [(ZOTFullscreenEventHandler *)fullscreenEventHandler handleEvent:v32];
LABEL_78:
    BOOL v28 = v50;
    goto LABEL_49;
  }
LABEL_13:
  BOOL v28 = 0;
LABEL_48:
  objc_super v32 = v7;
LABEL_49:

  return v28;
}

uint64_t __43__ZWTouchEventProcessor__handleTouchEvent___block_invoke(uint64_t a1)
{
  uint64_t result = AXIsInternalInstall();
  if (result)
  {
    [*(id *)(a1 + 32) creatorHIDEvent];
    return _AXLogWithFacility();
  }
  return result;
}

void __43__ZWTouchEventProcessor__handleTouchEvent___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mainDisplayDelegate];
  [v2 enableZoomWindowHitTestingWithEventProcessor:*(void *)(a1 + 32)];
}

void __43__ZWTouchEventProcessor__handleTouchEvent___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mainDisplayDelegate];
  [v2 disableZoomWindowHitTestingWithEventProcessor:*(void *)(a1 + 32)];
}

void __43__ZWTouchEventProcessor__handleTouchEvent___block_invoke_4(uint64_t a1)
{
  id v2 = *(unsigned char **)(a1 + 32);
  if (v2[72])
  {
    id v3 = [v2 mainDisplayDelegate];
    objc_msgSend(v3, "eventProcessor:didGetTouchInSpeakFingerMode:firstTouchWentIntoLens:", *(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(a1 + 32) + 106), *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
}

- (id)zoomDelegateForEvent:(id)a3
{
  id v4 = a3;
  if ([v4 contextId]) {
    unsigned int lastPointerContextID = [v4 contextId];
  }
  else {
    unsigned int lastPointerContextID = self->_lastPointerContextID;
  }
  unsigned int v6 = [(ZWEventProcessor *)self mainDisplayDelegate];
  if ([v6 currentWindowContextIdForEventProcessor:self] != lastPointerContextID)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = [(ZWEventProcessor *)self externalDisplayDelegates];
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (lastPointerContextID == [v12 currentWindowContextIdForEventProcessor:self])
          {
            id v13 = v12;

            unsigned int v6 = v13;
            goto LABEL_15;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }

  return v6;
}

- (BOOL)_isZoomContextID:(unsigned int)a3
{
  unint64_t v5 = [(ZWEventProcessor *)self mainDisplayDelegate];
  unsigned int v6 = [v5 currentWindowContextIdForEventProcessor:self];

  if (v6 == a3) {
    return 1;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [(ZWEventProcessor *)self externalDisplayDelegates];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * i) currentWindowContextIdForEventProcessor:self] == a3)
        {
          BOOL v7 = 1;
          goto LABEL_13;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 0;
LABEL_13:

  return v7;
}

- (BOOL)handlePointerEvent:(id)a3
{
  id v4 = a3;
  if (-[ZWTouchEventProcessor _isZoomContextID:](self, "_isZoomContextID:", [v4 contextId]))
  {
    unint64_t v5 = [v4 pointerControllerInfo];
    unsigned int v6 = v5;
    if (v5 && [v5 pointerIsAbsolute])
    {
      [v6 pointerX];
      double v8 = v7;
      [v6 pointerY];
      double v10 = v9;
      uint64_t v11 = [(ZWTouchEventProcessor *)self zoomDelegateForEvent:v4];
      double v12 = +[AXBackBoardServer server];
      objc_msgSend(v12, "convertPoint:fromContextId:displayId:", objc_msgSend(v4, "contextId"), objc_msgSend(v11, "currentDisplayIdForEventProcessor:", self), v8, v10);
      double v14 = v13;
      double v16 = v15;

      long long v17 = (char *)[v11 currentInterfaceOrientationForEventProcessor:self];
      long long v18 = v17;
      if ((unint64_t)(v17 - 3) >= 2) {
        double v19 = v16;
      }
      else {
        double v19 = v14;
      }
      if ((unint64_t)(v17 - 3) < 2) {
        double v14 = v16;
      }
      [v11 currentScreenSizeForEventProcessor:self];
      -[ZWTouchEventProcessor _flipCoordinates:orientation:screenSize:](self, "_flipCoordinates:orientation:screenSize:", v18, v14, v19, v20, v21);
      double v23 = v22;
      double v25 = v24;
      if (v11)
      {
        objc_msgSend(v11, "currentUIContextForEventProcessor:", self, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
        uint64_t v27 = 0;
        uint64_t v26 = 0;
        uint64_t v29 = 0;
        uint64_t v28 = 0;
      }
      else
      {
        uint64_t v29 = 0;
        uint64_t v28 = 0;
        uint64_t v27 = 0;
        uint64_t v26 = 0;
      }
      BOOL IsEmpty = CGRectIsEmpty(*(CGRect *)&v26);
      objc_msgSend(v11, "eventProcessor:didGetPointerEventAtLocation:withEventRep:", self, v4, v23, v25);
      self->_unsigned int lastPointerContextID = [v4 contextId];
      [v11 disableZoomWindowHitTestingWithEventProcessor:self];
      if (IsEmpty)
      {
        [v6 pointerButtonMask];
        BOOL v30 = v32 != 0.0;
      }
      else
      {
        BOOL v30 = 0;
      }
    }
    else
    {
      BOOL v30 = 0;
    }
  }
  else
  {
    BOOL v30 = 0;
  }

  return v30;
}

- (BOOL)_shouldFilterPointerEvent:(id)a3
{
  id v4 = a3;
  if (ZWLaserIsEnabled())
  {
    unint64_t v5 = [v4 pointerControllerInfo];
    unsigned int v6 = [v5 scrollEvent];
    if (v6) {
      BOOL v7 = [(ZWTouchEventProcessor *)self _handleWheelEvent:v6];
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (CGPoint)_flipCoordinates:(CGPoint)result orientation:(int64_t)a4 screenSize:(CGSize)a5
{
  double v5 = a5.height - result.y;
  double v6 = a5.width - result.x;
  if (a4 == 4) {
    double x = v6;
  }
  else {
    double x = result.x;
  }
  if (a4 == 3) {
    result.CGFloat y = v5;
  }
  else {
    result.double x = x;
  }
  if (a4 == 2)
  {
    result.double x = v6;
    result.CGFloat y = v5;
  }
  return result;
}

- (CGPoint)_shiftPointForReplicators:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  long long v10 = 0u;
  double v6 = [(ZWEventProcessor *)self mainDisplayDelegate];
  BOOL v7 = v6;
  if (v6) {
    [v6 currentUIContextForEventProcessor:self];
  }
  else {
    long long v10 = 0u;
  }

  double v8 = x;
  double v9 = y - *((double *)&v10 + 1);
  result.double y = v9;
  result.CGFloat x = v8;
  return result;
}

- (CGPoint)_convertZoomPointToSystemPoint:(CGPoint)a3 lensFrame:(CGRect)a4 offset:(CGPoint)a5 zoomFactor:(double)a6
{
  double y = a5.y;
  double x = a5.x;
  double v8 = a3.y;
  double v9 = a3.x;
  long long v43 = 0u;
  memset(&v42, 0, sizeof(v42));
  memset(&v41, 0, sizeof(v41));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v11 = [(ZWEventProcessor *)self mainDisplayDelegate];
  double v12 = v11;
  if (v11)
  {
    [v11 currentUIContextForEventProcessor:self];
  }
  else
  {
    long long v43 = 0u;
    memset(&v42, 0, sizeof(v42));
    memset(&v41, 0, sizeof(v41));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
  }

  AX_CGRectGetCenter();
  if ((BYTE8(v43) & 0x20) == 0)
  {
    double v15 = x + v13 + (v9 - v13) / a6;
    double v16 = y + v14 + (v8 - v14) / a6;
    goto LABEL_22;
  }
  long long v17 = [(ZWEventProcessor *)self mainDisplayDelegate];
  long long v18 = (char *)[v17 currentInterfaceOrientationForEventProcessor:self];

  if ((unint64_t)(v18 - 3) >= 2) {
    double v19 = v9;
  }
  else {
    double v19 = v8;
  }
  if ((unint64_t)(v18 - 3) >= 2) {
    double v20 = v8;
  }
  else {
    double v20 = v9;
  }
  double v21 = [(ZWEventProcessor *)self mainDisplayDelegate];
  [v21 currentScreenSizeForEventProcessor:self];
  double v23 = v22;
  double v25 = v24;

  -[ZWTouchEventProcessor _flipCoordinates:orientation:screenSize:](self, "_flipCoordinates:orientation:screenSize:", v18, v19, v20, v23, v25);
  double v27 = v26;
  double v29 = v28;
  v45.double x = v26;
  v45.double y = v28;
  if (!CGRectContainsPoint(v41, v45))
  {
    long long v36 = v39;
    v46.double x = v27;
    v46.double y = v29;
    if (!CGRectContainsPoint(v42, v46) && (WORD4(v43) & 0x180) == 0)
    {
      if (self->_firstTouchWentIntoLensContent)
      {
        double v30 = *(double *)&v40 * 0.5
            + *(double *)&v39
            + (v27 - (*(double *)&v38 * 0.5 + *(double *)&v37)) / *(double *)&v38 * *(double *)&v40;
        double v31 = *((double *)&v40 + 1) * 0.5
            + *((double *)&v39 + 1)
            + (v29 - (*((double *)&v38 + 1) * 0.5 + *((double *)&v37 + 1)))
            / *((double *)&v38 + 1)
            * *((double *)&v40 + 1);
        double v32 = self;
      }
      else
      {
        if ((BYTE8(v43) & 0x40) != 0) {
          goto LABEL_20;
        }
        double v32 = self;
        double v30 = v27;
        double v31 = v29;
      }
      -[ZWTouchEventProcessor _shiftPointForReplicators:](v32, "_shiftPointForReplicators:", v30, v31, v39);
      double v27 = v33;
      double v29 = v34;
    }
  }
LABEL_20:
  -[ZWTouchEventProcessor _flipCoordinates:orientation:screenSize:](self, "_flipCoordinates:orientation:screenSize:", v18, v27, v29, v23, v25, v36);
  double v35 = v15;
  if ((unint64_t)(v18 - 3) < 2)
  {
    double v15 = v16;
    double v16 = v35;
  }
LABEL_22:
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (void)_cleanEventUpdateMap
{
  if ([(NSMutableDictionary *)self->_eventIdentifiersToFinalLocations count])
  {
    [(NSMutableDictionary *)self->_eventIdentifiersToFinalLocations count];
    _AXLogWithFacility();
  }
  eventIdentifiersToFinalLocations = self->_eventIdentifiersToFinalLocations;

  [(NSMutableDictionary *)eventIdentifiersToFinalLocations removeAllObjects];
}

- (void)_dispatchZoomRemapUpdate:(id)a3
{
  id v27 = a3;
  id v4 = -[ZWSenderIDGenerationCountPair initWithSenderID:generationCount:]([ZWSenderIDGenerationCountPair alloc], "initWithSenderID:generationCount:", [v27 senderID], objc_msgSend(v27, "generationCount"));
  double v5 = [(NSMutableDictionary *)self->_eventIdentifiersToFinalLocations objectForKeyedSubscript:v4];
  if (v5)
  {
    double v6 = [v27 handInfo];
    BOOL v7 = [v6 pathsIncludingMayBeginEvents];
    id v8 = [v7 count];
    id v9 = [v5 count];

    id v10 = [v5 count];
    if (v8 == v9)
    {
      if (v10)
      {
        uint64_t v11 = 0;
        unsigned int v12 = 1;
        do
        {
          double v13 = [v5 objectAtIndexedSubscript:v11];
          [v13 CGPointValue];
          double v15 = v14;
          double v17 = v16;
          long long v18 = [v27 handInfo];
          double v19 = [v18 pathsIncludingMayBeginEvents];
          double v20 = [v19 objectAtIndexedSubscript:v11];
          objc_msgSend(v20, "setPathLocation:", v15, v17);

          uint64_t v11 = v12;
        }
        while ((unint64_t)[v5 count] > v12++);
      }
      double v22 = +[AXEventTapManager sharedManager];
      double v23 = [v27 handInfo];
      if ([v23 isStylus]) {
        unint64_t v24 = 0x8000000817319379;
      }
      else {
        unint64_t v24 = 0x8000000817319374;
      }
      [v22 sendHIDSystemEvent:v27 senderID:v24];
    }
    else
    {
      double v25 = [v27 handInfo];
      CGFloat v26 = [v25 paths];
      [v26 count];
      _AXLogWithFacility();
    }
  }
  else
  {
    [v27 generationCount];
    _AXLogWithFacility();
  }
}

- (BOOL)_ignoreEventWhileStylusInUse:(id)a3
{
  if (!self->_stylusIsTouchingScreen) {
    return 0;
  }
  id v3 = [a3 handInfo];
  unsigned int v4 = [v3 eventType];

  return v4 == 10 || (v4 & 0xFFFFFFFE) == 8;
}

- (void)_dispatchZoomRemapEvent:(id)a3
{
  id v4 = a3;
  if (![(ZWTouchEventProcessor *)self _ignoreEventWhileStylusInUse:v4])
  {
    if ([v4 willBeUpdated])
    {
      double v5 = -[ZWSenderIDGenerationCountPair initWithSenderID:generationCount:]([ZWSenderIDGenerationCountPair alloc], "initWithSenderID:generationCount:", [v4 senderID], objc_msgSend(v4, "generationCount"));
      double v6 = [v4 handInfo];
      BOOL v7 = [v6 pathsIncludingMayBeginEvents];
      id v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = objc_msgSend(v4, "handInfo", 0);
      id v10 = [v9 pathsIncludingMayBeginEvents];

      id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v20;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(*((void *)&v19 + 1) + 8 * i) pathLocation];
            double v15 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
            [v8 addObject:v15];
          }
          id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v12);
      }

      [(NSMutableDictionary *)self->_eventIdentifiersToFinalLocations setObject:v8 forKeyedSubscript:v5];
    }
    self->_lastSentPathIndexMask = [v4 pathIndexMask];
    [v4 setUseOriginalHIDTime:1];
    double v16 = +[AXEventTapManager sharedManager];
    double v17 = [v4 handInfo];
    if ([v17 isStylus]) {
      unint64_t v18 = 0x8000000817319379;
    }
    else {
      unint64_t v18 = 0x8000000817319374;
    }
    [v16 sendHIDSystemEvent:v4 senderID:v18];
  }
}

- (void)_dispatchZoomRemapEvent:(id)a3 lensFrame:(CGRect)a4 offset:(CGPoint)a5 zoomFactor:(double)a6 applyZoom:(BOOL)a7 menuScreenRect:(CGRect)a8
{
  BOOL v8 = a7;
  id v10 = a3;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  id v11 = [(ZWEventProcessor *)self mainDisplayDelegate];
  id v12 = v11;
  if (v11)
  {
    [v11 currentUIContextForEventProcessor:self];
  }
  else
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v33 = 0u;
  }

  uint64_t v13 = [v10 handInfo];
  double v14 = [v13 pathsIncludingMayBeginEvents];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v29 objects:v52 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        [v20 pathLocation];
        if (v8)
        {
          -[ZWTouchEventProcessor _convertZoomPointToSystemPoint:lensFrame:offset:zoomFactor:](self, "_convertZoomPointToSystemPoint:lensFrame:offset:zoomFactor:", v21, v22, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.x, a5.y, *(void *)&a6);
          v53.double x = v23;
          v53.double y = v24;
          CGRectContainsPoint(a8, v53);
        }
        else if ((BYTE8(v51) & 0x20) != 0)
        {
          -[ZWTouchEventProcessor _convertZoomPointToSystemPoint:lensFrame:offset:zoomFactor:](self, "_convertZoomPointToSystemPoint:lensFrame:offset:zoomFactor:", v21, v22, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.x, a5.y, *(void *)&a6);
        }
        AXNormalizePoint();
        objc_msgSend(v20, "setPathLocation:");
      }
      id v17 = [v15 countByEnumeratingWithState:&v29 objects:v52 count:16];
    }
    while (v17);
  }

  double v25 = [(ZWEventProcessor *)self hidPostThread];
  [v25 performSelector:"_dispatchZoomRemapEvent:" onTarget:self count:1 objects:v10];
}

- (CGPoint)_convertZoomOffset:(CGPoint)result toScreenCoordinatesFromInterfaceOrientation:(int64_t)a4
{
  double y = result.y;
  switch(a4)
  {
    case 0:
    case 1:
      double y = result.x;
      break;
    case 2:
      result.double y = -result.y;
      double y = -result.x;
      break;
    case 3:
      double y = -result.y;
      result.double y = result.x;
      break;
    case 4:
      result.double y = -result.x;
      break;
    default:
      result.double y = 0.0;
      double y = 0.0;
      break;
  }
  double v5 = y;
  result.double x = v5;
  return result;
}

- (void)dispatchEventToSystem:(id)a3
{
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  memset(&v23, 0, sizeof(v23));
  long long v21 = 0u;
  id v4 = a3;
  double v5 = [(ZWEventProcessor *)self mainDisplayDelegate];
  double v6 = v5;
  if (v5)
  {
    [v5 currentUIContextForEventProcessor:self];
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
    long long v24 = 0u;
    long long v22 = 0u;
    memset(&v23, 0, sizeof(v23));
    long long v21 = 0u;
  }

  BOOL v7 = [v4 record];

  BOOL v8 = [v7 denormalizedEventRepresentation:0 descale:1];

  id v9 = [v8 handInfo];
  unsigned int v10 = [v9 eventType];

  if (v10 == 1)
  {
    self->_applyZoomToEventDispatch = 1;
    if ((BYTE8(v27) & 0x10) == 0)
    {
      if ((BYTE8(v27) & 0x80) != 0) {
        goto LABEL_8;
      }
      id v11 = [v8 handInfo];
      id v12 = [v11 paths];
      uint64_t v13 = [v12 firstPath];
      [v13 pathLocation];
      v28.double x = v14;
      v28.double y = v15;
      BOOL v16 = CGRectContainsPoint(v23, v28);

      if (!v16) {
LABEL_8:
      }
        self->_applyZoomToEventDispatch = 0;
    }
  }
  id v17 = [(ZWEventProcessor *)self mainDisplayDelegate];
  id v18 = [v17 currentInterfaceOrientationForEventProcessor:self];

  -[ZWTouchEventProcessor _convertZoomOffset:toScreenCoordinatesFromInterfaceOrientation:](self, "_convertZoomOffset:toScreenCoordinatesFromInterfaceOrientation:", v18, *((double *)&v26 + 1), *(double *)&v27);
  -[ZWTouchEventProcessor _dispatchZoomRemapEvent:lensFrame:offset:zoomFactor:applyZoom:menuScreenRect:](self, "_dispatchZoomRemapEvent:lensFrame:offset:zoomFactor:applyZoom:menuScreenRect:", v8, self->_applyZoomToEventDispatch, *(_OWORD *)&v23.origin, *(_OWORD *)&v23.size, v19, v20, 0.0, v24, v25, v21, v22);
}

- (void)_postCancelEvent
{
  id v5 = +[AXEventRepresentation cancelEventForPathIndexMask:0];
  id v2 = +[AXEventTapManager sharedManager];
  id v3 = [v5 handInfo];
  if ([v3 isStylus]) {
    unint64_t v4 = 0x8000000817319379;
  }
  else {
    unint64_t v4 = 0x8000000817319374;
  }
  [v2 sendHIDSystemEvent:v5 senderID:v4];
}

- (void)postHandCancelWithSenderID:(unint64_t)a3
{
  BKSHIDServicesCancelTouchesOnMainDisplay();
  id v4 = [(ZWEventProcessor *)self hidPostThread];
  [v4 performSelector:"_postCancelEvent" onTarget:self count:0 objects:0];
}

- (void)disableSleepTimer:(BOOL)a3
{
  sleepTimerDisabledAssertion = self->_sleepTimerDisabledAssertion;
  if (a3)
  {
    if (sleepTimerDisabledAssertion) {
      return;
    }
    BOOL v8 = +[AXUserEventTimer sharedInstance];
    id v5 = [v8 acquireAssertionToDisableIdleTimerWithReason:@"Accessibility-ZWTouchEventProcessor"];
    double v6 = self->_sleepTimerDisabledAssertion;
    self->_sleepTimerDisabledAssertion = v5;

    BOOL v7 = (BSInvalidatable *)v8;
  }
  else
  {
    if (!sleepTimerDisabledAssertion) {
      return;
    }
    [(BSInvalidatable *)sleepTimerDisabledAssertion invalidate];
    BOOL v7 = self->_sleepTimerDisabledAssertion;
    self->_sleepTimerDisabledAssertion = 0;
  }
}

- (void)_updateZoomHandGesturesActionCustomizations
{
  id v5 = +[AXSettings sharedInstance];
  id v3 = [v5 zoomHandGesturesActionCustomizations];
  handGestureCommandDict = self->_handGestureCommandDict;
  self->_handGestureCommandDict = v3;
}

- (BOOL)_handleZoomGreySupportAccessibilityEvent:(id)a3
{
  unint64_t v4 = [(ZWTouchEventProcessor *)self _mapAXEventToZoomGreyAction:a3];
  long long v8 = 0u;
  -[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  id v5 = 0);
  double v6 = v5;
  if (v5) {
    [v5 currentUIContextForEventProcessor:self];
  }
  else {
    long long v8 = 0u;
  }

  if ((BYTE8(v8) & 0x80) != 0) {
    goto LABEL_7;
  }
  if (v4 == 3) {
    return [(ZWTouchEventProcessor *)self _panBackwardOnMainDisplay];
  }
  if (v4 == 2) {
    return [(ZWTouchEventProcessor *)self _panForwardOnMainDisplay];
  }
LABEL_7:
  if (v4 == 1) {
    return [(ZWTouchEventProcessor *)self _toggleZoomOnMainDisplay];
  }
  return 0;
}

- (unint64_t)_mapAXEventToZoomGreyAction:(id)a3
{
  unint64_t v4 = [a3 accessibilityData];
  handGestureCommandDict = self->_handGestureCommandDict;
  double v6 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v4 usage]);
  BOOL v7 = [(NSDictionary *)handGestureCommandDict objectForKeyedSubscript:v6];

  id v8 = [v7 unsignedIntegerValue];
  return (unint64_t)v8;
}

- (BOOL)_toggleZoomOnMainDisplay
{
  id v3 = [(ZWEventProcessor *)self mainDisplayDelegate];
  [v3 didGetToggleZoomGestureWithEventProcessor:self];

  return 1;
}

- (BOOL)_panForwardOnMainDisplay
{
  id v3 = [(ZWEventProcessor *)self mainDisplayDelegate];
  [v3 eventProcessor:self didGetPanEventWithDelta:kZoomGreyPanValue];

  return 1;
}

- (BOOL)_panBackwardOnMainDisplay
{
  id v3 = [(ZWEventProcessor *)self mainDisplayDelegate];
  [v3 eventProcessor:self didGetPanEventWithDelta:-(uint64_t)kZoomGreyPanValue];

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handGestureCommandDict, 0);
  objc_storeStrong((id *)&self->_eventUpdateMapCleanerTimer, 0);
  objc_storeStrong((id *)&self->_eventIdentifiersToFinalLocations, 0);
  objc_storeStrong((id *)&self->_sleepTimerDisabledAssertion, 0);
  objc_storeStrong((id *)&self->_fullscreenEventHandler, 0);

  objc_storeStrong((id *)&self->_fullScreenEventQueue, 0);
}

@end