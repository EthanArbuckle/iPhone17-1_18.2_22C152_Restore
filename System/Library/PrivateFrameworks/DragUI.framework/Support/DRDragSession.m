@interface DRDragSession
- (BOOL)_areAllTouchesEndedOrCancelled;
- (BOOL)_canRunBlocksWaitingForLastTouchAndDestinationToEnd;
- (BOOL)_isPolicyControlled;
- (BOOL)_runBlocksWaitingForLastTouchAndDestinationToEndIfPossible;
- (BOOL)addDestination:(id)a3 onConnection:(id)a4 systemPolicy:(BOOL)a5 destinationExpectsStagedSelectors:(BOOL)a6;
- (BOOL)avoidsKeyboardSuppression;
- (BOOL)continuityDisplayWantsDragsHidden;
- (BOOL)originatedFromAccessibility;
- (BOOL)originatedFromContinuityDisplay;
- (BOOL)originatedFromPointer;
- (BOOL)resizable;
- (BOOL)rotatable;
- (BOOL)shouldIgnoreRequest:(SEL)a3 fromDestination:(id)a4;
- (BOOL)sourceExpectsStagedLegacySelectors;
- (BOOL)sourceRestrictsDragToLocalDevice;
- (BOOL)sourceRestrictsDragToSelf;
- (BOOL)supportsSystemDrag;
- (BOOL)synthesizesTouch;
- (BOOL)wantsElasticEffects;
- (CGSize)maximumResizableSize;
- (CGSize)minimumResizableSize;
- (CGSize)originalScale;
- (DRDragSession)initWithIdentifier:(unsigned int)a3 configuration:(id)a4 mainWindow:(id)a5 sourceConnection:(id)a6 accessibilityConnection:(id)a7 clientSource:(id)a8 delegate:(id)a9;
- (DRDragSessionDelegate)delegate;
- (DRTouchTrackingWindow)interactionWindow;
- (DRTouchTrackingWindow)sourceInteractionWindow;
- (DRVirtualHIDService)virtualHIDService;
- (NSSet)touchIDs;
- (NSString)description;
- (NSString)displayIdentifierForSynthesizedTouch;
- (NSString)persistentSceneIdentifier;
- (NSXPCConnection)axConnection;
- (NSXPCConnection)sourceConnection;
- (UIDraggingSystemTouchRoutingPolicy)routingPolicy;
- (_DUIClientSessionAccessibility)accessibilityProxy;
- (_DUIClientSessionSource)clientSource;
- (double)originalRotation;
- (id)currentDestination;
- (id)dataTransferSessionForDestination:(id)a3;
- (id)itemCollectionForDestination:(id)a3;
- (id)newDataTransferSessionWithDestinationAuditToken:(id *)a3 filter:(id)a4;
- (id)takeProcessAssertionOnPID:(int)a3;
- (int64_t)sourceDataOwner;
- (int64_t)state;
- (unint64_t)outsideAppSourceOperationMask;
- (unsigned)identifier;
- (unsigned)mainWindowContextId;
- (void)_acceptDragPreviews:(id)a3 fence:(id)a4 fromClient:(id)a5;
- (void)_animateOutVisibleItemsAndEndDragWithOperation:(unint64_t)a3 destination:(id)a4;
- (void)_applyMainWindowExclusionToRoutingPolicy:(id)a3;
- (void)_cancelDrag;
- (void)_cancelTouchWatchdog;
- (void)_endDragByCancelling;
- (void)_endDragWithOperation:(unint64_t)a3 dataTransferSession:(id)a4;
- (void)_endDragWithOperation:(unint64_t)a3 destination:(id)a4;
- (void)_handleDirtyItems:(id)a3 fromClient:(id)a4;
- (void)_lastTouchEndedNormally:(BOOL)a3;
- (void)_liftVirtualHIDServiceIfNecessary;
- (void)_logStatisticsForDragEnd:(unint64_t)a3 destination:(id)a4;
- (void)_notifyDestinationsWithAddedItemsStartingAtIndex:(unint64_t)a3;
- (void)_performAfterLastTouchAndDestinationBothEnd:(id)a3;
- (void)_performDropOperation:(unint64_t)a3 layerContext:(id)a4 forConnection:(id)a5;
- (void)_receivedEndFromDestinationOnConnection:(id)a3;
- (void)_resetTouchWatchdogWithTimeout:(double)a3;
- (void)_runBlocksWaitingForLastTouchAndDestinationToEnd;
- (void)_touchEndedNormally:(BOOL)a3 withID:(id)a4;
- (void)_touchWatchdogFired;
- (void)_updateAccessibilityDragStatus;
- (void)_updateIsAnyProcessBeingDebuggedWithConnection:(id)a3;
- (void)_updatePotentialDrop:(id)a3 forDestinationClient:(id)a4;
- (void)_updatePotentialDropPreferringFullSizePreview:(BOOL)a3;
- (void)accessibilityCancel;
- (void)accessibilityDrop;
- (void)accessibilityMoveToPoint:(CGPoint)a3;
- (void)addItemCollection:(id)a3 dataProviderEndpoint:(id)a4;
- (void)addTouchID:(id)a3;
- (void)beganPointerDrag;
- (void)beginAccessibilityDragAtLocationIfNeeded:(CAPoint3D)a3 hidService:(id)a4;
- (void)beginDrag;
- (void)beginPointerDragAtLocationIfNeeded:(CAPoint3D)a3 hidService:(id)a4;
- (void)cancelDrag;
- (void)cancelPointerDrag;
- (void)commandeerDragSession;
- (void)dataTransferSessionFinished:(id)a3;
- (void)dealloc;
- (void)destinationConnectionWasInvalidated:(id)a3;
- (void)didFinishRequestingDataForDragContinuation:(id)a3;
- (void)dirtyDestinationItems:(id)a3;
- (void)dirtySourceItems:(id)a3;
- (void)disableDragDisplay;
- (void)dragDidExitSourceApp;
- (void)enableKeyboardIfNeeded;
- (void)endPointerDrag;
- (void)fail;
- (void)loadURLForItemAtIndex:(unint64_t)a3 reply:(id)a4;
- (void)loadUserActivityDataForItemAtIndex:(unint64_t)a3 reply:(id)a4;
- (void)movePointerDragToPoint:(CAPoint3D)a3 hidService:(id)a4;
- (void)notifyDragMonitorsWithUpdatedPresentation:(id)a3;
- (void)overrideDragWindowToPoint:(CGPoint)a3;
- (void)performAfterReceivingOutsideAppSourceOperationMask:(id)a3;
- (void)performOffscreenDrop;
- (void)requestDragContinuationEndpointWithReply:(id)a3;
- (void)requestDropWithOperation:(unint64_t)a3 contextID:(unsigned int)a4 layerRenderID:(unint64_t)a5;
- (void)requestDropWithOperation:(unint64_t)a3 layerContext:(id)a4;
- (void)requestImagesForClient:(id)a3 itemIndexes:(id)a4;
- (void)requestVisibleItemsWithReply:(id)a3;
- (void)sawDragEndEvent;
- (void)sendDragEndedWithOperation:(unint64_t)a3;
- (void)setContinuityDisplayWantsDragsHidden:(BOOL)a3;
- (void)setDisplayIdentifierForSynthesizedTouch:(id)a3;
- (void)setInteractionWindow:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setVirtualHIDService:(id)a3;
- (void)sourceConnectionWasInvalidated;
- (void)surrenderDragSession;
- (void)takeOutsideAppSourceOperationMask:(unint64_t)a3 prefersFullSizePreview:(BOOL)a4;
- (void)takePotentialDrop:(id)a3;
- (void)touchBeganWithID:(id)a3;
- (void)touchCancelledWithID:(id)a3;
- (void)touchEndedWithID:(id)a3 contextID:(id)a4 pid:(id)a5 likelyMovingOffscreen:(BOOL)a6;
- (void)touchMovedWithID:(id)a3;
- (void)touchUpOccuredForIdentifier:(unsigned int)a3 detached:(BOOL)a4 context:(unsigned int)a5 pid:(int)a6;
- (void)transitionFromState:(int64_t)a3 toTerminalState:(int64_t)a4;
- (void)updateRoutingPolicy:(id)a3;
@end

@implementation DRDragSession

- (DRDragSession)initWithIdentifier:(unsigned int)a3 configuration:(id)a4 mainWindow:(id)a5 sourceConnection:(id)a6 accessibilityConnection:(id)a7 clientSource:(id)a8 delegate:(id)a9
{
  id v15 = a4;
  id v69 = a5;
  id v72 = a6;
  id v16 = a7;
  id v71 = a8;
  id obj = a9;
  v17 = [v15 itemCollection];
  id v70 = [v15 dataProviderEndpoint];
  if (!a3
    || !v72
    || !v17
    || ([v17 items],
        v18 = objc_claimAutoreleasedReturnValue(),
        id v19 = [v18 count],
        v18,
        !v71)
    || !v19
    || !v70)
  {
    v44 = DRLogTarget();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
      sub_100033504();
    }

    goto LABEL_16;
  }
  if (v16)
  {
    v20 = _DUINewClientSessionAccessibilityInterface();
    [v16 setRemoteObjectInterface:v20];

    [v16 resume];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v80 = 0x2020000000;
    char v81 = 0;
    v21 = [v16 synchronousRemoteObjectProxyWithErrorHandler:&stru_100055660];
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_10001AC9C;
    v76[3] = &unk_100055688;
    p_long long buf = &buf;
    id v22 = v16;
    id v77 = v22;
    [v21 dragWillBeginWithReply:v76];
    if (*(unsigned char *)(*((void *)&buf + 1) + 24))
    {

      _Block_object_dispose(&buf, 8);
      goto LABEL_10;
    }
    v47 = DRLogTarget();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
      sub_100033544();
    }

    [v22 invalidate];
    _Block_object_dispose(&buf, 8);
LABEL_16:
    v45 = 0;
    goto LABEL_17;
  }
LABEL_10:
  v75.receiver = self;
  v75.super_class = (Class)DRDragSession;
  v23 = [(DRDragSession *)&v75 init];
  if (v23)
  {
    uint64_t v24 = [v72 _queue];
    xpcQueue = v23->_xpcQueue;
    v23->_xpcQueue = (OS_dispatch_queue *)v24;

    v23->_identifier = a3;
    objc_storeWeak((id *)&v23->_delegate, obj);
    uint64_t v26 = [v15 routingPolicy];
    routingPolicy = v23->_routingPolicy;
    v23->_routingPolicy = (UIDraggingSystemTouchRoutingPolicy *)v26;

    v23->_supportsSystemDrag = [v15 supportsSystemDrag];
    v23->_avoidsKeyboardSuppression = [v15 avoidsKeyboardSuppression];
    v23->_rotatable = [v15 rotatable];
    v23->_resizable = [v15 resizable];
    [v15 minimumResizableSize];
    v23->_minimumResizableSize.width = v28;
    v23->_minimumResizableSize.height = v29;
    [v15 maximumResizableSize];
    v23->_maximumResizableSize.width = v30;
    v23->_maximumResizableSize.height = v31;
    uint64_t v32 = [v15 persistentSceneIdentifier];
    persistentSceneIdentifier = v23->_persistentSceneIdentifier;
    v23->_persistentSceneIdentifier = (NSString *)v32;

    v23->_wantsElasticEffects = [v15 wantsElasticEffects];
    [v15 originalRotation];
    v23->_originalRotation = v34;
    [v15 originalScale];
    v23->_originalScale.width = v35;
    v23->_originalScale.height = v36;
    v23->_mainWindowContextId = [v69 _contextId];
    objc_storeWeak((id *)&v23->_sourceInteractionWindow, v69);
    v37 = [v15 coordinateSpaceSourceLayerContext];
    v23->_dragSourceContextId = [v37 contextID];

    v23->_sourceExpectsStagedLegacySelectors = [v15 sourceExpectsStagedLegacySelectors];
    v23->_sourceRestrictsDragToSelf = [v15 sessionIsRestrictedToSourceApplication];
    v23->_sourceRestrictsDragToLocalDevice = [v15 sessionIsRestrictedToLocalDevice];
    v38 = [v69 screen];
    v23->_originatedFromContinuityDisplay = sub_10000631C(v38);

    [(DRDragSession *)v23 _applyMainWindowExclusionToRoutingPolicy:v23->_routingPolicy];
    objc_storeStrong((id *)&v23->_sourceConnection, a6);
    objc_storeStrong((id *)&v23->_itemCollection, v17);
    objc_storeStrong((id *)&v23->_dataProviderEndpoint, v70);
    dispatch_queue_t v39 = dispatch_queue_create("com.apple.druid.loader", 0);
    loaderQueue = v23->_loaderQueue;
    v23->_loaderQueue = (OS_dispatch_queue *)v39;

    if (v16)
    {
      v23->_originatedFromAccessibility = 1;
      objc_storeStrong((id *)&v23->_axConnection, a7);
      v41 = _DUINewServerSessionAccessibilityInterface();
      [v16 setExportedInterface:v41];

      [v16 setExportedObject:v23];
      uint64_t v42 = [v16 remoteObjectProxy];
      accessibilityProxy = v23->_accessibilityProxy;
      v23->_accessibilityProxy = (_DUIClientSessionAccessibility *)v42;
    }
    else
    {
      v23->_originatedFromPointer = [v15 initiatedWithPointer];
    }
    objc_storeStrong((id *)&v23->_clientSource, a8);
    v48 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    touchIDs = v23->_touchIDs;
    v23->_touchIDs = v48;

    v50 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    endedTouchIDs = v23->_endedTouchIDs;
    v23->_endedTouchIDs = v50;

    v52 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    dragItems = v23->_dragItems;
    v23->_dragItems = v52;

    v23->_state = 0;
    v23->_lastPotentialDropWasFromSourceApp = 1;
    if ([v15 wantsPresentationUpdates])
    {
      v54 = [v72 valueForEntitlement:@"com.apple.DragUI.presentationUpdateNotification"];
      v23->_sourceReceivesPresentationUpdates = [v54 isEqual:&__kCFBooleanTrue];
    }
    uint64_t v55 = +[NSMapTable weakToStrongObjectsMapTable];
    connectionToDestinationMap = v23->_connectionToDestinationMap;
    v23->_connectionToDestinationMap = (NSMapTable *)v55;

    v57 = [v17 items];
    v58 = (char *)[v57 count];
    if (v58)
    {
      for (i = 0; i != v58; ++i)
      {
        v60 = [DRDragItem alloc];
        v61 = [v57 objectAtIndexedSubscript:i];
        v62 = [(DRDragItem *)v60 initWithPasteboardItem:v61];

        if (v62) {
          [(NSMutableArray *)v23->_dragItems addObject:v62];
        }
      }
    }
    v23->_sourceDataOwner = (int64_t)[v17 originatorDataOwner];
    [(DRDragSession *)v23 _updateIsAnyProcessBeingDebuggedWithConnection:v72];
    if (qword_100064768 != -1) {
      dispatch_once(&qword_100064768, &stru_1000559A0);
    }
    if (byte_100064770 && (sub_100022D20() & 1) == 0
      || v23->_originatedFromAccessibility
      || v23->_isAnyProcessBeingDebugged)
    {
      v63 = DRLogTarget();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v23;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "Session %@: Touch watchdog disabled", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      objc_initWeak((id *)&buf, v23);
      v64 = [DRDispatchTimer alloc];
      v65 = v23->_xpcQueue;
      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472;
      v73[2] = sub_10001AD38;
      v73[3] = &unk_100054CA8;
      objc_copyWeak(&v74, (id *)&buf);
      v66 = [(DRDispatchTimer *)v64 initWithQueue:v65 eventHandler:v73];
      touchWatchdogTimer = v23->_touchWatchdogTimer;
      v23->_touchWatchdogTimer = v66;

      if (v23->_touchWatchdogTimer)
      {
        [(DRDragSession *)v23 _resetTouchWatchdogWithTimeout:2.0];
        [(DRDispatchTimer *)v23->_touchWatchdogTimer activate];
      }
      objc_destroyWeak(&v74);
      objc_destroyWeak((id *)&buf);
    }
    if (v23->_originatedFromAccessibility) {
      [(DRDragSession *)v23 _updateAccessibilityDragStatus];
    }
  }
  self = v23;
  v45 = self;
LABEL_17:

  return v45;
}

- (void)_updateIsAnyProcessBeingDebuggedWithConnection:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if (!self->_isAnyProcessBeingDebugged)
  {
    int v4 = sub_100005D78((int)[v5 processIdentifier]);
    self->_isAnyProcessBeingDebugged = v4;
    if (v4) {
      [(DRDragSession *)self _cancelTouchWatchdog];
    }
  }
}

- (void)dealloc
{
  if ((self->_state & 0xFFFFFFFFFFFFFFFELL) != 6)
  {
    v3 = DRLogTarget();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100033584((uint64_t)self, (unint64_t *)&self->_state, v3);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)DRDragSession;
  [(DRDragSession *)&v4 dealloc];
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  objc_super v4 = NSStringFromClass(v3);
  uint64_t identifier = self->_identifier;
  v6 = sub_10001AE78(self->_state);
  v7 = +[NSString stringWithFormat:@"<%@ %p identifier=%u state=%@>", v4, self, identifier, v6];

  return (NSString *)v7;
}

- (BOOL)synthesizesTouch
{
  if (self->_originatedFromAccessibility)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    int v2 = sub_100006688();
    if (v2) {
      LOBYTE(v2) = self->_originatedFromPointer;
    }
  }
  return v2;
}

- (void)addTouchID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if (([(NSMutableSet *)self->_touchIDs containsObject:v4] & 1) == 0)
  {
    [(NSMutableSet *)self->_touchIDs addObject:v4];
    id v5 = DRLogTarget();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412546;
      v8 = self;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Session %@: Added touch ID %@", (uint8_t *)&v7, 0x16u);
    }

    ++self->_pendingTouchUpObservationCount;
    self->_pendingDisplayTransitionLift = 0;
    v6 = +[BKSTouchDeliveryObservationService sharedInstance];
    objc_msgSend(v6, "addObserver:forTouchIdentifier:", self, objc_msgSend(v4, "unsignedIntegerValue"));
  }
}

- (NSSet)touchIDs
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  id v3 = [(NSMutableSet *)self->_touchIDs copy];
  return (NSSet *)v3;
}

- (UIDraggingSystemTouchRoutingPolicy)routingPolicy
{
  systemRoutingPolicy = self->_systemRoutingPolicy;
  if (!systemRoutingPolicy) {
    systemRoutingPolicy = self->_routingPolicy;
  }
  return systemRoutingPolicy;
}

- (void)touchBeganWithID:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if (![(DRDragSession *)self synthesizesTouch])
  {
    [(DRDragSession *)self _resetTouchWatchdogWithTimeout:20.0];
  }
}

- (void)touchMovedWithID:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if (![(DRDragSession *)self synthesizesTouch])
  {
    [(DRDragSession *)self _resetTouchWatchdogWithTimeout:20.0];
  }
}

- (void)touchEndedWithID:(id)a3 contextID:(id)a4 pid:(id)a5 likelyMovingOffscreen:(BOOL)a6
{
  BOOL v6 = a6;
  xpcQueue = self->_xpcQueue;
  id v10 = a3;
  dispatch_assert_queue_V2(xpcQueue);
  BOOL v9 = !v6 || self->_isSystemCommandeered;
  [(DRDragSession *)self _touchEndedNormally:v9 withID:v10];
}

- (void)touchCancelledWithID:(id)a3
{
  xpcQueue = self->_xpcQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(xpcQueue);
  [(DRDragSession *)self _touchEndedNormally:0 withID:v5];
}

- (void)_touchEndedNormally:(BOOL)a3 withID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if (![(DRDragSession *)self synthesizesTouch])
  {
    [(DRDragSession *)self _resetTouchWatchdogWithTimeout:20.0];
    if (([(NSMutableSet *)self->_endedTouchIDs containsObject:v6] & 1) == 0)
    {
      [(NSMutableSet *)self->_endedTouchIDs addObject:v6];
      if ([(DRDragSession *)self _areAllTouchesEndedOrCancelled]) {
        [(DRDragSession *)self _lastTouchEndedNormally:v4];
      }
    }
  }
}

- (BOOL)_areAllTouchesEndedOrCancelled
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  touchIDs = self->_touchIDs;
  endedTouchIDs = self->_endedTouchIDs;
  return [(NSMutableSet *)touchIDs isSubsetOfSet:endedTouchIDs];
}

- (void)_resetTouchWatchdogWithTimeout:(double)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  touchWatchdogTimer = self->_touchWatchdogTimer;
  if (touchWatchdogTimer)
  {
    [(DRDispatchTimer *)touchWatchdogTimer resetWithTimeout:a3 leeway:0.5];
  }
}

- (void)_cancelTouchWatchdog
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  touchWatchdogTimer = self->_touchWatchdogTimer;
  if (touchWatchdogTimer)
  {
    [(DRDispatchTimer *)touchWatchdogTimer cancel];
    BOOL v4 = self->_touchWatchdogTimer;
    self->_touchWatchdogTimer = 0;
  }
}

- (void)_touchWatchdogFired
{
  id v3 = DRLogTarget();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100033638((uint64_t)self, v3, v4, v5, v6, v7, v8, v9);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  [(DRDragSession *)self _cancelDrag];
  [(DRDragSession *)self _cancelTouchWatchdog];
}

- (void)_cancelDrag
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  id v3 = DRLogTarget();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Session %@: cancel drag", buf, 0xCu);
  }

  uint64_t v4 = [(DRDragSession *)self touchIDs];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [(DRDragSession *)self touchCancelledWithID:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  if ([v4 count])
  {
    uint64_t v9 = [v4 allObjects];
    BKSHIDServicesCancelTouchesWithIdentifiers();
  }
  if (!self->_lastTouchEnded) {
    [(DRDragSession *)self _lastTouchEndedNormally:0];
  }
}

- (void)touchUpOccuredForIdentifier:(unsigned int)a3 detached:(BOOL)a4 context:(unsigned int)a5 pid:(int)a6
{
  xpcQueue = self->_xpcQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B6D0;
  block[3] = &unk_1000556B0;
  BOOL v11 = a4;
  unsigned int v8 = a3;
  unsigned int v9 = a5;
  int v10 = a6;
  block[4] = self;
  dispatch_async(xpcQueue, block);
}

- (void)beginDrag
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if (![(DRDragSession *)self state])
  {
    id v3 = DRLogTarget();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      unsigned int v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Session %@: begin drag", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v4 = [(DRDragSession *)self sourceConnection];
    -[DRDragSession takeProcessAssertionOnPID:](self, "takeProcessAssertionOnPID:", [v4 processIdentifier]);
    id v5 = (RBSAssertion *)objc_claimAutoreleasedReturnValue();
    sourceKeepAliveAssertion = self->_sourceKeepAliveAssertion;
    self->_sourceKeepAliveAssertion = v5;

    [(DRDragSession *)self setState:1];
  }
  if (![(DRDragSession *)self avoidsKeyboardSuppression])
  {
    uint64_t v7 = [(DRDragSession *)self delegate];
    [v7 dragSession:self enableKeyboardIfNeeded:0];
  }
}

- (void)fail
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if (([(DRDragSession *)self state] & 0xFFFFFFFFFFFFFFFELL) != 6)
  {
    [(DRDragSession *)self setState:7];
  }
}

- (void)sourceConnectionWasInvalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if ((id)[(DRDragSession *)self state] != (id)4)
  {
    [(DRDragSession *)self fail];
  }
}

- (void)requestImagesForClient:(id)a3 itemIndexes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = DRLogTarget();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    v14 = self;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Session %@: _requestDragImageForItemIndexes:%@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001BBCC;
  v10[3] = &unk_1000556D8;
  objc_copyWeak(&v12, (id *)buf);
  id v9 = v6;
  id v11 = v9;
  [v9 requestDragPreviewsForIndexSet:v7 reply:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (id)newDataTransferSessionWithDestinationAuditToken:(id *)a3 filter:(id)a4
{
  id v6 = a4;
  id v7 = [DRDataTransferSession alloc];
  itemCollection = self->_itemCollection;
  sourceConnection = self->_sourceConnection;
  if (sourceConnection) {
    [(NSXPCConnection *)sourceConnection auditToken];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  int v10 = [(DRDataTransferSession *)v7 initWithSourceItemCollection:itemCollection sourceAuditToken:v14 dataProviderEndpoint:self->_dataProviderEndpoint filter:v6];
  [(DRDataTransferSession *)v10 setDelegate:self];
  long long v11 = *(_OWORD *)&a3->var0[4];
  v13[0] = *(_OWORD *)a3->var0;
  v13[1] = v11;
  [(DRDataTransferSession *)v10 setDestinationAuditToken:v13];

  return v10;
}

- (BOOL)addDestination:(id)a3 onConnection:(id)a4 systemPolicy:(BOOL)a5 destinationExpectsStagedSelectors:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = DRLogTarget();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    uint64_t v24 = self;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Session %@: addDestination: %@", buf, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if ((id)[(DRDragSession *)self state] == (id)1)
  {
    if (v11)
    {
      long long v13 = [(NSMapTable *)self->_connectionToDestinationMap objectForKey:v11];

      if (!v13)
      {
        [v11 auditToken];
        v14 = [(DRDragSession *)self newDataTransferSessionWithDestinationAuditToken:&v22 filter:0];
        id v16 = [(DRDragSession *)self delegate];
        unsigned int v17 = objc_msgSend(v16, "dragSession:destinationIsDragMonitorConnection:", self, objc_msgSend(v11, "processIdentifier"));

        if (v17) {
          [v14 setDestinationIsAnotherDevice:1];
        }
        v18 = (DRDragSession *)objc_opt_new();
        [(DRDragSession *)v18 setDataTransferSession:v14];
        [(DRDragSession *)v18 setConnection:v11];
        [(DRDragSession *)v18 setClientSession:v10];
        [(DRDragSession *)v18 setPolicyDriven:v7];
        [(DRDragSession *)v18 setExpectsStagedLegacySelectors:v6];
        if ([(DRDragSession *)v18 isPolicyDriven])
        {
          id v19 = DRLogTarget();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            unsigned int v20 = [v11 processIdentifier];
            *(_DWORD *)long long buf = 138412546;
            uint64_t v24 = v18;
            __int16 v25 = 1024;
            LODWORD(v26) = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Session addDestination (%@) setting as Policy Driven for pid %d", buf, 0x12u);
          }
        }
        [(NSMapTable *)self->_connectionToDestinationMap setObject:v18 forKey:v11];
        [(DRDragSession *)self _updateIsAnyProcessBeingDebuggedWithConnection:v11];

        BOOL v15 = 1;
        goto LABEL_19;
      }
      v14 = DRLogTarget();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000336D8();
      }
    }
    else
    {
      v14 = DRLogTarget();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000336A4();
      }
    }
    BOOL v15 = 0;
LABEL_19:

    goto LABEL_20;
  }
  BOOL v15 = 0;
LABEL_20:

  return v15;
}

- (void)destinationConnectionWasInvalidated:(id)a3
{
  xpcQueue = self->_xpcQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(xpcQueue);
  [(NSMapTable *)self->_connectionToDestinationMap removeObjectForKey:v5];
}

- (void)performAfterReceivingOutsideAppSourceOperationMask:(id)a3
{
  int v8 = (void (**)(id, uint64_t))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if (self->_receivedOutsideAppSourceOperationMask)
  {
    v8[2](v8, 1);
  }
  else
  {
    pendingMaskBlocks = self->_pendingMaskBlocks;
    if (!pendingMaskBlocks)
    {
      id v5 = (NSMutableArray *)objc_opt_new();
      BOOL v6 = self->_pendingMaskBlocks;
      self->_pendingMaskBlocks = v5;

      pendingMaskBlocks = self->_pendingMaskBlocks;
    }
    BOOL v7 = objc_retainBlock(v8);
    [(NSMutableArray *)pendingMaskBlocks addObject:v7];
  }
}

- (id)itemCollectionForDestination:(id)a3
{
  xpcQueue = self->_xpcQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(xpcQueue);
  BOOL v6 = [(DRDragSession *)self dataTransferSessionForDestination:v5];

  BOOL v7 = [v6 destinationItemCollection];

  return v7;
}

- (id)dataTransferSessionForDestination:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(NSMapTable *)self->_connectionToDestinationMap objectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v9 clientSession];

        if (v10 == v4)
        {
          id v6 = [v9 dataTransferSession];
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)currentDestination
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  id v3 = +[NSXPCConnection currentConnection];
  id v4 = [(NSMapTable *)self->_connectionToDestinationMap objectForKey:v3];

  return v4;
}

- (void)takeOutsideAppSourceOperationMask:(unint64_t)a3 prefersFullSizePreview:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = DRLogTarget();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412802;
    id v26 = self;
    __int16 v27 = 2048;
    unint64_t v28 = a3;
    __int16 v29 = 1024;
    BOOL v30 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Session %@: takeOutsideAppSourceOperationMask: %lu prefersFullSizePreview: %d", buf, 0x1Cu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if (self->_receivedOutsideAppSourceOperationMask)
  {
    p_super = DRLogTarget();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      sub_10003370C((uint64_t)self, p_super, v9, v10, v11, v12, v13, v14);
    }
LABEL_6:

    return;
  }
  self->_outsideAppSourceOperationMask = a3;
  [(DRDragSession *)self _updatePotentialDropPreferringFullSizePreview:v4];
  if (!self->_receivedOutsideAppSourceOperationMask)
  {
    self->_receivedOutsideAppSourceOperationMask = 1;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v15 = self->_pendingMaskBlocks;
    id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v20 + 1) + 8 * i));
        }
        id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v17);
    }

    p_super = &self->_pendingMaskBlocks->super.super;
    self->_pendingMaskBlocks = 0;
    goto LABEL_6;
  }
}

- (void)dirtySourceItems:(id)a3
{
  id v4 = a3;
  id v5 = DRLogTarget();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    int v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Session %@: dirtySourceItems: %@", (uint8_t *)&v7, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  id v6 = [(DRDragSession *)self clientSource];
  [(DRDragSession *)self _handleDirtyItems:v4 fromClient:v6];
}

- (void)dragDidExitSourceApp
{
  id v3 = DRLogTarget();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    int v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Session %@: dragDidExitSourceApp", (uint8_t *)&v7, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  lastPotentialDrop = self->_lastPotentialDrop;
  if (lastPotentialDrop) {
    id v5 = [(_DUIPotentialDrop *)lastPotentialDrop copy];
  }
  else {
    id v5 = (id)objc_opt_new();
  }
  id v6 = v5;
  if (self->_lastPotentialDropWasFromSourceApp) {
    [v5 setOperation:0];
  }
  if (!self->_isSystemCommandeered) {
    [v6 setPrefersFullSizePreview:0];
  }
  [(DRDragSession *)self _updatePotentialDrop:v6 forDestinationClient:self->_lastPotentialDropDestinationClient];
}

- (void)addItemCollection:(id)a3 dataProviderEndpoint:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = DRLogTarget();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Session %@: addItemCollection: %@", buf, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if ((id)[(DRDragSession *)self state] == (id)1)
  {
    id v10 = [v7 items];
    id v11 = [v10 count];
    uint64_t v12 = [(PBItemCollection *)self->_itemCollection items];
    id v13 = [v12 count];

    if (v11 > v13)
    {
      uint64_t v14 = [(PBItemCollection *)self->_itemCollection items];
      long long v15 = (char *)[v14 count];

      objc_storeStrong((id *)&self->_itemCollection, a3);
      objc_storeStrong((id *)&self->_dataProviderEndpoint, a4);
      memset(buf, 0, 32);
      id v16 = +[NSXPCConnection currentConnection];
      id v17 = v16;
      if (v16) {
        [v16 auditToken];
      }
      else {
        memset(buf, 0, 32);
      }

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v18 = [(NSMapTable *)self->_connectionToDestinationMap objectEnumerator];
      id v19 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v35;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v35 != v21) {
              objc_enumerationMutation(v18);
            }
            long long v23 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            uint64_t v24 = [v23 dataTransferSession];
            [v24 setSourceItemCollection:v7];

            __int16 v25 = [v23 dataTransferSession];
            v33[0] = *(_OWORD *)buf;
            v33[1] = *(_OWORD *)&buf[16];
            [v25 setDataProviderEndpoint:v8 auditToken:v33];
          }
          id v20 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v20);
      }

      id v26 = [v7 items];
      __int16 v27 = (char *)[v26 count];
      unint64_t v28 = +[NSMutableArray array];
      if (v15 < v27)
      {
        __int16 v29 = v15;
        do
        {
          BOOL v30 = [v26 objectAtIndexedSubscript:v29];
          [v28 addObject:v30];
          CGFloat v31 = [[DRDragItem alloc] initWithPasteboardItem:v30];
          [(NSMutableArray *)self->_dragItems addObject:v31];

          ++v29;
        }
        while (v27 != v29);
      }
      uint64_t v32 = [(DRDragSession *)self delegate];
      objc_msgSend(v32, "dragSession:addedItemCount:", self, objc_msgSend(v28, "count"));

      [(DRDragSession *)self _notifyDestinationsWithAddedItemsStartingAtIndex:v15];
      [(DRDragSession *)self _resetTouchWatchdogWithTimeout:20.0];
      [(DRDragSession *)self _updateAccessibilityDragStatus];
    }
  }
}

- (void)cancelDrag
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  [(DRDragSession *)self _cancelDrag];
}

- (BOOL)shouldIgnoreRequest:(SEL)a3 fromDestination:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (!self->_pendingDisplayTransitionLift)
  {
    if (!v6)
    {
      id v8 = DRLogTarget();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        goto LABEL_6;
      }
      __int16 v9 = NSStringFromSelector(a3);
      int v15 = 138412546;
      id v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = self;
      id v10 = "~Ignoring Request~ (%@) Session %@: Unable to find destination for request";
      goto LABEL_4;
    }
    if (!self->_isSystemCommandeered) {
      goto LABEL_23;
    }
    if (([v6 isPolicyDriven] & 1) == 0)
    {
      id v8 = DRLogTarget();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        goto LABEL_6;
      }
      __int16 v9 = NSStringFromSelector(a3);
      int v15 = 138412802;
      id v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = self;
      __int16 v19 = 2112;
      id v20 = v7;
      id v10 = "~Ignoring Request (Commandeered)~ (%@) Session %@: Destination:%@";
LABEL_20:
      id v11 = v8;
      uint32_t v12 = 32;
      goto LABEL_5;
    }
    if (!self->_isSystemCommandeered)
    {
LABEL_23:
      if ([v7 isPolicyDriven])
      {
        id v8 = DRLogTarget();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
          goto LABEL_6;
        }
        __int16 v9 = NSStringFromSelector(a3);
        int v15 = 138412802;
        id v16 = v9;
        __int16 v17 = 2112;
        uint64_t v18 = self;
        __int16 v19 = 2112;
        id v20 = v7;
        id v10 = "~Ignoring Request~ (%@) Session %@: Destination:%@";
        goto LABEL_20;
      }
    }
    BOOL v13 = 0;
    goto LABEL_7;
  }
  id v8 = DRLogTarget();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    __int16 v9 = NSStringFromSelector(a3);
    int v15 = 138412546;
    id v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = self;
    id v10 = "~Ignoring Request~ (%@) Session %@: Pending transition move between displays.";
LABEL_4:
    id v11 = v8;
    uint32_t v12 = 22;
LABEL_5:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v15, v12);
  }
LABEL_6:

  BOOL v13 = 1;
LABEL_7:

  return v13;
}

- (void)dirtyDestinationItems:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  id v6 = [(DRDragSession *)self currentDestination];
  if (![(DRDragSession *)self shouldIgnoreRequest:a2 fromDestination:v6])
  {
    id v7 = DRLogTarget();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v6 clientSession];
      int v10 = 138412802;
      id v11 = self;
      __int16 v12 = 2112;
      id v13 = v5;
      __int16 v14 = 2112;
      int v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Session %@: dirtyDestinationItems:%@ onDestination:%@", (uint8_t *)&v10, 0x20u);
    }
    __int16 v9 = [v6 clientSession];
    [(DRDragSession *)self _handleDirtyItems:v5 fromClient:v9];
  }
}

- (void)takePotentialDrop:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  id v6 = [(DRDragSession *)self currentDestination];
  if (![(DRDragSession *)self shouldIgnoreRequest:a2 fromDestination:v6])
  {
    id v7 = DRLogTarget();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v6 clientSession];
      *(_DWORD *)long long buf = 138412802;
      __int16 v17 = self;
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2112;
      uint64_t v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Session %@: takePotentialDrop:%@ onDestination:%@", buf, 0x20u);
    }
    __int16 v9 = [v6 dataTransferSession];
    int v10 = [v6 connection];
    id v11 = v10;
    if (v10) {
      [v10 auditToken];
    }
    else {
      memset(v15, 0, sizeof(v15));
    }
    [v9 setDestinationAuditToken:v15];

    __int16 v12 = [v6 clientSession];
    [(DRDragSession *)self _updatePotentialDrop:v5 forDestinationClient:v12];

    id v13 = [v6 connection];
    unsigned int v14 = [v13 processIdentifier];
    self->_lastPotentialDropWasFromSourceApp = v14 == [(NSXPCConnection *)self->_sourceConnection processIdentifier];
  }
}

- (void)requestDropWithOperation:(unint64_t)a3 contextID:(unsigned int)a4 layerRenderID:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = (id)objc_opt_new();
  [v9 setContextID:v6];
  [v9 setRenderID:a5];
  [(DRDragSession *)self requestDropWithOperation:a3 layerContext:v9];
}

- (void)requestDropWithOperation:(unint64_t)a3 layerContext:(id)a4
{
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  id v8 = [(DRDragSession *)self currentDestination];
  if (![(DRDragSession *)self shouldIgnoreRequest:a2 fromDestination:v8])
  {
    id v9 = DRLogTarget();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = [v8 clientSession];
      *(_DWORD *)long long buf = 138412802;
      __int16 v17 = self;
      __int16 v18 = 2048;
      unint64_t v19 = a3;
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Session %@: request drop with operation %lu on destination %@", buf, 0x20u);
    }
    id v11 = [v8 clientSession];
    if (v11 && (id)[(DRDragSession *)self state] == (id)1)
    {

      if (a3)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_10001D224;
        v12[3] = &unk_100055700;
        v12[4] = self;
        unint64_t v15 = a3;
        id v13 = v7;
        id v14 = v8;
        [(DRDragSession *)self _performAfterLastTouchAndDestinationBothEnd:v12];
      }
    }
    else
    {
    }
  }
}

- (void)didFinishRequestingDataForDragContinuation:(id)a3
{
  id v4 = a3;
  xpcQueue = self->_xpcQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D324;
  v7[3] = &unk_100054C58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(xpcQueue, v7);
}

- (BOOL)_isPolicyControlled
{
  return self->_isSystemCommandeered;
}

- (void)_animateOutVisibleItemsAndEndDragWithOperation:(unint64_t)a3 destination:(id)a4
{
  id v7 = a4;
  id v6 = [(DRDragSession *)self delegate];
  [v6 dragSession:self animateOutVisibleItemsWithOperation:a3];

  [(DRDragSession *)self _endDragWithOperation:a3 destination:v7];
}

- (void)_performDropOperation:(unint64_t)a3 layerContext:(id)a4 forConnection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  int v10 = DRLogTarget();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    v58 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Session %@: last touch and destination have both ended, so proceeding with drop", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  id v11 = [(NSMapTable *)self->_connectionToDestinationMap objectForKey:v9];
  if ([v11 clientSessionReportedDragEnd])
  {
    __int16 v12 = [(DRDragSession *)self delegate];
    unsigned int v13 = objc_msgSend(v12, "dragSession:destinationIsDragMonitorConnection:", self, objc_msgSend(v9, "processIdentifier"));

    id v14 = [(DRDragSession *)self delegate];
    LODWORD(v12) = [v14 dragSession:self destinationIsSystemConnection:v9];

    LODWORD(v14) = [v9 processIdentifier];
    LODWORD(v14) = v14 == [(NSXPCConnection *)self->_sourceConnection processIdentifier];
    if ((([(DRDragSession *)self _isPolicyControlled] & v12 | v13 | v14) & 1) != 0
      || [v9 processIdentifier] == self->_lastTouchUpPID)
    {
      if ((id)[(DRDragSession *)self state] == (id)1)
      {
        unint64_t v15 = [v11 clientSession];
        unsigned int v16 = [v9 processIdentifier];
        [(DRDragSession *)self setState:2];
        objc_initWeak((id *)buf, self);
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_10001D960;
        v53[3] = &unk_100055750;
        objc_copyWeak(v55, (id *)buf);
        v53[4] = self;
        v55[1] = (id)a3;
        id v17 = v15;
        id v54 = v17;
        char v56 = 1;
        __int16 v18 = objc_retainBlock(v53);
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_10001DC30;
        v50[3] = &unk_100055778;
        objc_copyWeak(&v52, (id *)buf);
        id v19 = v9;
        id v51 = v19;
        __int16 v20 = objc_retainBlock(v50);
        uint64_t v21 = [v11 clientSession];
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_10001DCF8;
        v47[3] = &unk_1000557A0;
        objc_copyWeak(&v49, (id *)buf);
        v47[4] = self;
        id v22 = v17;
        id v48 = v22;
        long long v36 = [v21 remoteObjectProxyWithErrorHandler:v47];

        long long v35 = v20;
        long long v23 = [(DRDragSession *)self delegate];
        xpcQueue = self->_xpcQueue;
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_10001DD80;
        v37[3] = &unk_1000557F0;
        id v38 = v11;
        id v39 = v19;
        v40 = self;
        unsigned int v45 = v16;
        __int16 v25 = v22;
        v41 = v25;
        char v46 = 1;
        id v26 = v36;
        id v42 = v26;
        __int16 v27 = v18;
        id v43 = v27;
        id v28 = v35;
        id v44 = v28;
        [v23 dragSession:self findVisibleDroppedItemsInSpaceOfLayerContext:v8 replyingOnQueue:xpcQueue with:v37];

        objc_destroyWeak(&v49);
        objc_destroyWeak(&v52);

        objc_destroyWeak(v55);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        __int16 v25 = DRLogTarget();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_100033778();
        }
      }
    }
    else
    {
      __int16 v25 = DRLogTarget();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_1000337AC(v9, &self->_lastTouchUpPID, v25);
      }
    }
  }
  else
  {
    __int16 v25 = DRLogTarget();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100033850((uint64_t)v9, v25, v29, v30, v31, v32, v33, v34);
    }
  }
}

- (void)sawDragEndEvent
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  id v4 = [(DRDragSession *)self currentDestination];
  if (![(DRDragSession *)self shouldIgnoreRequest:a2 fromDestination:v4])
  {
    id v5 = DRLogTarget();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [v4 clientSession];
      *(_DWORD *)long long buf = 138412546;
      id v11 = self;
      __int16 v12 = 2112;
      unsigned int v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Session %@: saw drag end event on destination %@", buf, 0x16u);
    }
    id v7 = [v4 clientSession];

    if (v7)
    {
      id v8 = [v4 connection];
      [(DRDragSession *)self _receivedEndFromDestinationOnConnection:v8];

      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10001E2C4;
      v9[3] = &unk_100054B58;
      v9[4] = self;
      [(DRDragSession *)self _performAfterLastTouchAndDestinationBothEnd:v9];
    }
  }
}

- (void)enableKeyboardIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  id v5 = [(DRDragSession *)self currentDestination];
  if (!-[DRDragSession shouldIgnoreRequest:fromDestination:](self, "shouldIgnoreRequest:fromDestination:", a2)
    && ![(DRDragSession *)self avoidsKeyboardSuppression])
  {
    id v4 = [(DRDragSession *)self delegate];
    [v4 dragSession:self enableKeyboardIfNeeded:1];
  }
}

- (void)requestVisibleItemsWithReply:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  id v6 = DRLogTarget();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Session %@: requesting visible items", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if (v5)
  {
    id v7 = +[NSXPCConnection currentConnection];
    id v8 = [(DRDragSession *)self currentDestination];
    if ([(DRDragSession *)self shouldIgnoreRequest:a2 fromDestination:v8])
    {
      id v9 = DRLogTarget();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
LABEL_8:

        v5[2](v5, &__NSArray0__struct);
LABEL_13:

        goto LABEL_14;
      }
      *(_DWORD *)long long buf = 138412290;
      id v19 = self;
      int v10 = "Session %@: requested visible items but request is ignored";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v10, buf, 0xCu);
      goto LABEL_8;
    }
    id v11 = [(DRDragSession *)self delegate];
    if ([v11 dragSession:self destinationIsSystemConnection:v7])
    {
    }
    else
    {
      __int16 v12 = [(DRDragSession *)self delegate];
      unsigned int v13 = objc_msgSend(v12, "dragSession:destinationIsDragMonitorConnection:", self, objc_msgSend(v7, "processIdentifier"));

      if (!v13)
      {
        id v9 = DRLogTarget();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
          goto LABEL_8;
        }
        *(_DWORD *)long long buf = 138412290;
        id v19 = self;
        int v10 = "Session %@: requested visible items but not system connection";
        goto LABEL_7;
      }
    }
    id v14 = [(DRDragSession *)self delegate];
    xpcQueue = self->_xpcQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001E6C4;
    v16[3] = &unk_100055818;
    v16[4] = self;
    id v17 = v5;
    [v14 dragSession:self findVisibleDroppedItemsInSpaceOfLayerContext:0 replyingOnQueue:xpcQueue with:v16];

    goto LABEL_13;
  }
LABEL_14:
}

- (void)beginAccessibilityDragAtLocationIfNeeded:(CAPoint3D)a3 hidService:(id)a4
{
  double z = a3.z;
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  xpcQueue = self->_xpcQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E870;
  block[3] = &unk_100055840;
  double v13 = x;
  double v14 = y;
  double v15 = z;
  block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(xpcQueue, block);
}

- (void)accessibilityMoveToPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v6 = DRLogTarget();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v14.CGFloat x = x;
    v14.CGFloat y = y;
    id v7 = NSStringFromCGPoint(v14);
    *(_DWORD *)long long buf = 138412546;
    id v11 = self;
    __int16 v12 = 2112;
    double v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Session %@: AX moveToPoint:%@", buf, 0x16u);
  }
  xpcQueue = self->_xpcQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EB00;
  block[3] = &unk_100054EA8;
  *(CGFloat *)&void block[5] = x;
  *(CGFloat *)&block[6] = y;
  block[4] = self;
  dispatch_async(xpcQueue, block);
}

- (void)accessibilityDrop
{
  id v3 = DRLogTarget();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Session %@: AX drop", buf, 0xCu);
  }

  xpcQueue = self->_xpcQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EC7C;
  block[3] = &unk_100054B58;
  block[4] = self;
  dispatch_async(xpcQueue, block);
}

- (void)accessibilityCancel
{
  id v3 = DRLogTarget();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Session %@: AX cancel", buf, 0xCu);
  }

  xpcQueue = self->_xpcQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EDB8;
  block[3] = &unk_100054B58;
  block[4] = self;
  dispatch_async(xpcQueue, block);
}

- (void)beginPointerDragAtLocationIfNeeded:(CAPoint3D)a3 hidService:(id)a4
{
  double z = a3.z;
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  xpcQueue = self->_xpcQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EE80;
  block[3] = &unk_100055840;
  double v13 = x;
  double v14 = y;
  double v15 = z;
  block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(xpcQueue, block);
}

- (void)beganPointerDrag
{
  id v3 = DRLogTarget();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Session %@: Pointer drag began", buf, 0xCu);
  }

  xpcQueue = self->_xpcQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F094;
  block[3] = &unk_100054B58;
  block[4] = self;
  dispatch_async(xpcQueue, block);
}

- (void)movePointerDragToPoint:(CAPoint3D)a3 hidService:(id)a4
{
  double z = a3.z;
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  id v9 = DRLogTarget();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = +[NSString stringWithFormat:@"{%.3f,%.3f,%.3f}", *(void *)&x, *(void *)&y, *(void *)&z];
    *(_DWORD *)long long buf = 138412546;
    id v19 = self;
    __int16 v20 = 2112;
    uint64_t v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Session %@: Pointer drag moveToPoint:%@", buf, 0x16u);
  }
  xpcQueue = self->_xpcQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F218;
  block[3] = &unk_100055840;
  block[4] = self;
  id v14 = v8;
  double v15 = x;
  double v16 = y;
  double v17 = z;
  id v12 = v8;
  dispatch_async(xpcQueue, block);
}

- (void)endPointerDrag
{
  id v3 = DRLogTarget();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Session %@: Pointer drop", buf, 0xCu);
  }

  xpcQueue = self->_xpcQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F5F4;
  block[3] = &unk_100054B58;
  block[4] = self;
  dispatch_async(xpcQueue, block);
}

- (void)cancelPointerDrag
{
  id v3 = DRLogTarget();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Session %@: Pointer cancel", buf, 0xCu);
  }

  xpcQueue = self->_xpcQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F73C;
  block[3] = &unk_100054B58;
  block[4] = self;
  dispatch_async(xpcQueue, block);
}

- (void)_applyMainWindowExclusionToRoutingPolicy:(id)a3
{
  id v4 = a3;
  id v5 = [v4 contextIDsToExcludeFromHitTesting];
  id v6 = [(DRDragSession *)self delegate];
  id v7 = [v6 allWindowContextIdsForDragSession:self];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v10 = +[NSNumber numberWithUnsignedInt:self->_mainWindowContextId];
    double v17 = v10;
    id v9 = +[NSArray arrayWithObjects:&v17 count:1];
  }
  id v11 = [v9 arrayByExcludingObjectsInArray:v5];
  if ([v11 count])
  {
    id v12 = [v5 mutableCopy];
    double v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = +[NSMutableArray array];
    }
    double v15 = v14;

    [v15 addObjectsFromArray:v11];
    id v16 = [v15 copy];
    [v4 setContextIDsToExcludeFromHitTesting:v16];
  }
}

- (void)updateRoutingPolicy:(id)a3
{
  id v4 = (UIDraggingSystemTouchRoutingPolicy *)a3;
  [(DRDragSession *)self _applyMainWindowExclusionToRoutingPolicy:v4];
  systemRoutingPolicdouble y = self->_systemRoutingPolicy;
  self->_systemRoutingPolicdouble y = v4;
  id v6 = v4;

  self->_isSystemCommandeered = [(UIDraggingSystemTouchRoutingPolicy *)self->_systemRoutingPolicy isHitTestingDisabled];
  id v7 = [(DRDragSession *)self delegate];
  [v7 dragSession:self updateRoutingPolicy:v6];
}

- (void)commandeerDragSession
{
  id v3 = DRLogTarget();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "System Commandeer - session %@ ", (uint8_t *)&v5, 0xCu);
  }

  systemRoutingPolicdouble y = self->_systemRoutingPolicy;
  if (systemRoutingPolicy)
  {
    [(UIDraggingSystemTouchRoutingPolicy *)systemRoutingPolicy setHitTestingDisabled:1];
    [(DRDragSession *)self updateRoutingPolicy:self->_systemRoutingPolicy];
  }
}

- (void)surrenderDragSession
{
  id v3 = DRLogTarget();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "System Surrender - session %@", (uint8_t *)&v6, 0xCu);
  }

  systemRoutingPolicdouble y = self->_systemRoutingPolicy;
  if (systemRoutingPolicy)
  {
    [(UIDraggingSystemTouchRoutingPolicy *)systemRoutingPolicy setHitTestingDisabled:0];
    [(DRDragSession *)self updateRoutingPolicy:self->_systemRoutingPolicy];
    int v5 = [(DRDragSession *)self delegate];
    [v5 resetDestinationClientForDragSession:self];
  }
}

- (void)loadURLForItemAtIndex:(unint64_t)a3 reply:(id)a4
{
  int v6 = (void (**)(id, void))a4;
  id v7 = DRLogTarget();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    uint64_t v21 = self;
    __int16 v22 = 2048;
    unint64_t v23 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "System session %@ - loadURLForItemAtIndex: %lu", buf, 0x16u);
  }

  id v8 = [(PBItemCollection *)self->_itemCollection items];
  if ((unint64_t)[v8 count] <= a3)
  {
    id v14 = DRLogTarget();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100033924();
    }

    v6[2](v6, 0);
  }
  else
  {
    id v9 = objc_alloc((Class)UIItemProvider);
    id v10 = [v8 objectAtIndexedSubscript:a3];
    id v11 = [v9 initWithPBItem:v10];

    loaderQueue = self->_loaderQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    _OWORD v15[2] = sub_10001FD14;
    v15[3] = &unk_1000558B8;
    id v16 = v11;
    double v17 = self;
    __int16 v18 = v6;
    unint64_t v19 = a3;
    id v13 = v11;
    dispatch_async(loaderQueue, v15);
  }
}

- (void)loadUserActivityDataForItemAtIndex:(unint64_t)a3 reply:(id)a4
{
  int v6 = (void (**)(id, void))a4;
  id v7 = DRLogTarget();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    __int16 v20 = self;
    __int16 v21 = 2048;
    unint64_t v22 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "System session %@ - loadUserActivityForItemAtIndex: %lu", buf, 0x16u);
  }

  id v8 = [(PBItemCollection *)self->_itemCollection items];
  if ((unint64_t)[v8 count] <= a3)
  {
    id v14 = DRLogTarget();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100033924();
    }

    v6[2](v6, 0);
  }
  else
  {
    id v9 = objc_alloc((Class)UIItemProvider);
    id v10 = [v8 objectAtIndexedSubscript:a3];
    id v11 = [v9 initWithPBItem:v10];

    loaderQueue = self->_loaderQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002022C;
    block[3] = &unk_100055448;
    id v16 = v11;
    double v17 = self;
    __int16 v18 = v6;
    id v13 = v11;
    dispatch_async(loaderQueue, block);
  }
}

- (void)requestDragContinuationEndpointWithReply:(id)a3
{
  id v8 = (void (**)(id, void *))a3;
  continuationSession = self->_continuationSession;
  if (!continuationSession)
  {
    int v5 = [[DRDragContinuationSession alloc] initWithDragSession:self];
    int v6 = self->_continuationSession;
    self->_continuationSession = v5;

    continuationSession = self->_continuationSession;
  }
  id v7 = [(DRDragContinuationSession *)continuationSession continuationEndpoint];
  v8[2](v8, v7);
}

- (void)performOffscreenDrop
{
  id v3 = DRLogTarget();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    int v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Ensemble session %@ - performOffscreenDrop", (uint8_t *)&v4, 0xCu);
  }

  [(DRDragSession *)self endPointerDrag];
}

- (void)overrideDragWindowToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v6 = DRLogTarget();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412802;
    id v9 = self;
    __int16 v10 = 2048;
    double v11 = x;
    __int16 v12 = 2048;
    double v13 = y;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Ensemble session %@ - overrideDragWindowToPoint: %f, %f", (uint8_t *)&v8, 0x20u);
  }

  id v7 = [(DRDragSession *)self delegate];
  objc_msgSend(v7, "dragSession:moveToLocation:", self, x, y, 0.0);
}

- (void)disableDragDisplay
{
  id v3 = DRLogTarget();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    int v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Oneness session %@ - disableDragDisplay", (uint8_t *)&v4, 0xCu);
  }

  self->_continuityDisplayWantsDragsHidden = 1;
}

- (id)takeProcessAssertionOnPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = DRLogTarget();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    unint64_t v19 = self;
    __int16 v20 = 1024;
    int v21 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Session %@: taking process assertion on PID %d", buf, 0x12u);
  }

  int v6 = +[RBSTarget targetWithPid:v3];
  id v7 = objc_alloc((Class)RBSAssertion);
  int v8 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.DragUI" name:@"Dragging"];
  uint64_t v24 = v8;
  id v9 = +[NSArray arrayWithObjects:&v24 count:1];
  id v10 = [v7 initWithExplanation:@"Taking process assertion for drag and drop." target:v6 attributes:v9];

  id v17 = 0;
  unsigned int v11 = [v10 acquireWithError:&v17];
  id v12 = v17;
  double v13 = DRLogTarget();
  id v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      unint64_t v19 = self;
      __int16 v20 = 1024;
      int v21 = v3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Session %@: acquired process assertion for %d", buf, 0x12u);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id v16 = [v12 localizedDescription];
    *(_DWORD *)long long buf = 138412802;
    unint64_t v19 = self;
    __int16 v20 = 1024;
    int v21 = v3;
    __int16 v22 = 2112;
    unint64_t v23 = v16;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Session %@: DID NOT acquire process assertion for %d, error: %@", buf, 0x1Cu);
  }
  return v10;
}

- (void)setState:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  unint64_t state = self->_state;
  if (state != a3)
  {
    switch(state)
    {
      case 0uLL:
        if (a3 == 7 || a3 == 1) {
          goto LABEL_14;
        }
        goto LABEL_19;
      case 1uLL:
        if ((unint64_t)a3 > 7) {
          goto LABEL_19;
        }
        uint64_t v6 = 1 << a3;
        uint64_t v7 = 156;
        break;
      case 2uLL:
        if ((unint64_t)a3 > 7) {
          goto LABEL_19;
        }
        uint64_t v6 = 1 << a3;
        uint64_t v7 = 176;
        break;
      case 3uLL:
      case 5uLL:
        if (a3 != 4 && a3 != 7) {
          goto LABEL_19;
        }
        goto LABEL_14;
      case 4uLL:
        if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 6) {
          goto LABEL_19;
        }
        goto LABEL_14;
      default:
        goto LABEL_19;
    }
    if ((v6 & v7) != 0)
    {
LABEL_14:
      self->_unint64_t state = a3;
      int v8 = DRLogTarget();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = sub_10001AE78(state);
        id v10 = sub_10001AE78(a3);
        int v14 = 138412802;
        double v15 = self;
        __int16 v16 = 2112;
        id v17 = v9;
        __int16 v18 = 2112;
        unint64_t v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Session %@: setState: from %@ to %@", (uint8_t *)&v14, 0x20u);
      }
      if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6) {
        [(DRDragSession *)self transitionFromState:state toTerminalState:a3];
      }
    }
    else
    {
LABEL_19:
      unsigned int v11 = DRLogTarget();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        id v12 = sub_10001AE78(state);
        double v13 = sub_10001AE78(a3);
        int v14 = 138412802;
        double v15 = self;
        __int16 v16 = 2112;
        id v17 = v12;
        __int16 v18 = 2112;
        unint64_t v19 = v13;
        _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Session %@: Attempted invalid state transition from %@ to %@", (uint8_t *)&v14, 0x20u);
      }
    }
  }
}

- (void)transitionFromState:(int64_t)a3 toTerminalState:(int64_t)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if (a4 == 7 && (unint64_t)(a3 - 1) <= 2) {
    [(DRDragSession *)self sendDragEndedWithOperation:0];
  }
  if (a3 <= 1 && a4 == 7)
  {
    uint64_t v7 = [(DRDragSession *)self touchIDs];
    id v8 = [v7 count];

    if (v8)
    {
      id v9 = [(DRDragSession *)self touchIDs];
      id v10 = [v9 allObjects];
      BKSHIDServicesCancelTouchesWithIdentifiers();
    }
  }
  unsigned int v11 = DRLogTarget();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412290;
    __int16 v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Session %@: Transitioned into terminal state, cleaning up", (uint8_t *)&v19, 0xCu);
  }

  [(NSMapTable *)self->_connectionToDestinationMap removeAllObjects];
  id v12 = DRLogTarget();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412290;
    __int16 v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Session %@: Invalidating destination process assertions.", (uint8_t *)&v19, 0xCu);
  }

  [(RBSAssertion *)self->_sourceKeepAliveAssertion invalidate];
  sourceKeepAliveAssertion = self->_sourceKeepAliveAssertion;
  self->_sourceKeepAliveAssertion = 0;

  [(RBSAssertion *)self->_destinationKeepAliveAssertion invalidate];
  destinationKeepAliveAssertion = self->_destinationKeepAliveAssertion;
  self->_destinationKeepAliveAssertion = 0;

  blocksWaitingForLastTouchAndDestinationToEnd = self->_blocksWaitingForLastTouchAndDestinationToEnd;
  self->_blocksWaitingForLastTouchAndDestinationToEnd = 0;

  waitingForDestinationAndTouchObserverTimer = self->_waitingForDestinationAndTouchObserverTimer;
  if (waitingForDestinationAndTouchObserverTimer)
  {
    [(DRDispatchTimer *)waitingForDestinationAndTouchObserverTimer cancel];
    id v17 = self->_waitingForDestinationAndTouchObserverTimer;
    self->_waitingForDestinationAndTouchObserverTimer = 0;
  }
  [(DRDragSession *)self _cancelTouchWatchdog];
  __int16 v18 = [(DRDragSession *)self delegate];
  [v18 dragSessionDidEnd:self];
}

- (void)_endDragByCancelling
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if ((id)[(DRDragSession *)self state] == (id)1)
  {
    [(DRDragSession *)self setState:3];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100020FC8;
    v9[3] = &unk_100054B58;
    v9[4] = self;
    uint64_t v3 = objc_retainBlock(v9);
    int v4 = [(DRDragSession *)self delegate];
    xpcQueue = self->_xpcQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100020FD8;
    v7[3] = &unk_100055818;
    v7[4] = self;
    id v8 = v3;
    uint64_t v6 = v3;
    [v4 dragSession:self findVisibleDroppedItemsInSpaceOfLayerContext:0 replyingOnQueue:xpcQueue with:v7];
  }
  else if ((id)[(DRDragSession *)self state] != (id)3)
  {
    [(DRDragSession *)self _endDragWithOperation:0 destination:0];
  }
}

- (void)_logStatisticsForDragEnd:(unint64_t)a3 destination:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if (a3)
  {
    uint64_t v7 = [DRProcessInfo alloc];
    sourceConnection = self->_sourceConnection;
    if (sourceConnection)
    {
      [(NSXPCConnection *)sourceConnection auditToken];
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
    }
    id v9 = [(DRProcessInfo *)v7 initWithAuditToken:&v19];
    id v10 = [(DRDragSession *)self dataTransferSessionForDestination:v6];
    unsigned int v11 = [v10 destinationProcessInfo];

    uint64_t v12 = [v11 bundleID];
    if (!v12) {
      goto LABEL_7;
    }
    double v13 = (void *)v12;
    int v14 = [(DRProcessInfo *)v9 bundleID];
    double v15 = [v11 bundleID];
    unsigned int v16 = [v14 isEqualToString:v15];

    if (!v16) {
      CFStringRef v17 = @"multipleAppDrag";
    }
    else {
LABEL_7:
    }
      CFStringRef v17 = @"singleAppDrag";
    +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:forKey:](_UIKitDragAndDropStatistics, "incrementUIKitScalarValueBy:forKey:", 1, v17, v19, v20);
    __int16 v18 = [v11 bundleID];
    +[_UIKitDragAndDropStatistics incrementUIKitScalarValueForKnownInternalAppsForKey:@"dropSuccessfullOnto" bundleID:v18];
  }
}

- (void)_endDragWithOperation:(unint64_t)a3 destination:(id)a4
{
  id v6 = a4;
  [(DRDragSession *)self _logStatisticsForDragEnd:a3 destination:v6];
  id v7 = [(DRDragSession *)self dataTransferSessionForDestination:v6];

  [(DRDragSession *)self _endDragWithOperation:a3 dataTransferSession:v7];
}

- (void)_endDragWithOperation:(unint64_t)a3 dataTransferSession:(id)a4
{
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  performDropTimeoutTimer = self->_performDropTimeoutTimer;
  if (performDropTimeoutTimer)
  {
    [(DRDispatchTimer *)performDropTimeoutTimer cancel];
    id v9 = self->_performDropTimeoutTimer;
    self->_performDropTimeoutTimer = 0;
  }
  [(DRDragSession *)self setState:4];
  if ((id)[(DRDragSession *)self state] == (id)4)
  {
    id v10 = [(DRDragSession *)self delegate];
    [v10 dragSessionWillEnd:self];

    [(DRDragSession *)self sendDragEndedWithOperation:a3];
    if (a3)
    {
      unsigned int v11 = DRLogTarget();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = [v7 destinationProcessInfo];
        int v14 = 138412546;
        double v15 = self;
        __int16 v16 = 2112;
        CFStringRef v17 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Session %@: startSendingDelegateCallbacksForDataTransfer (client - %@)", (uint8_t *)&v14, 0x16u);
      }
      objc_storeStrong((id *)&self->_pendingDataTransferSession, a4);
      [(DRDataTransferSession *)self->_pendingDataTransferSession startSendingDelegateCallbacks];
    }
    else
    {
      [(DRDragSession *)self setState:6];
    }
  }
  [(DRDragSession *)self _liftVirtualHIDServiceIfNecessary];
  double v13 = +[BKSTouchDeliveryObservationService sharedInstance];
  [v13 removeObserver:self];
}

- (void)_liftVirtualHIDServiceIfNecessary
{
  if ([(DRDragSession *)self synthesizesTouch])
  {
    [(DRVirtualHIDService *)self->_virtualHIDService lift];
    virtualHIDService = self->_virtualHIDService;
    self->_virtualHIDService = 0;
  }
}

- (void)dataTransferSessionFinished:(id)a3
{
  id v4 = a3;
  xpcQueue = self->_xpcQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000217D0;
  v7[3] = &unk_100054C58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(xpcQueue, v7);
}

- (void)sendDragEndedWithOperation:(unint64_t)a3
{
  int v5 = DRLogTarget();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (!a3)
    {
      id v10 = @"None";
      goto LABEL_9;
    }
    id v6 = +[NSMutableArray array];
    id v7 = v6;
    unint64_t v8 = a3;
    if (a3)
    {
      unint64_t v8 = a3 & 0xFFFFFFFFFFFFFFFELL;
      [v6 addObject:@"Copy"];
      if ((a3 & 0x10) == 0)
      {
LABEL_5:
        if (!v8)
        {
LABEL_7:
          id v10 = [v7 componentsJoinedByString:@"|"];

LABEL_9:
          *(_DWORD *)long long buf = 138412546;
          __int16 v25 = self;
          __int16 v26 = 2112;
          __int16 v27 = v10;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Session %@: sendDragEndedWithOperation: %@", buf, 0x16u);

          goto LABEL_10;
        }
LABEL_6:
        id v9 = +[NSString stringWithFormat:@"Unknown (%lu)", v8];
        [v7 addObject:v9];

        goto LABEL_7;
      }
    }
    else if ((a3 & 0x10) == 0)
    {
      goto LABEL_5;
    }
    v8 &= ~0x10uLL;
    [v7 addObject:@"Move"];
    if (!v8) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_10:

  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  unsigned int v11 = [(DRDragSession *)self accessibilityProxy];
  [v11 dragDidEndWithOperation:a3];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = [(NSMapTable *)self->_connectionToDestinationMap objectEnumerator];
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      __int16 v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        CFStringRef v17 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v16) clientSession];
        [v17 dragEnded];

        __int16 v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  __int16 v18 = [(DRDragSession *)self clientSource];
  [v18 dragEndedWithOperation:a3];
}

- (void)_handleDirtyItems:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v12);
        id v14 = [(DRDragSession *)self delegate];
        objc_msgSend(v14, "dragSession:invalidateImageForClient:itemIndex:", self, v7, objc_msgSend(v13, "index"));

        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)_acceptDragPreviews:(id)a3 fence:(id)a4 fromClient:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if ((id)[(DRDragSession *)self state] == (id)1)
  {
    id v10 = [(DRDragSession *)self delegate];
    [v10 dragSession:self updateDragItems:v11 forClient:v9 withFence:v8];
  }
}

- (void)notifyDragMonitorsWithUpdatedPresentation:(id)a3
{
  id v4 = a3;
  xpcQueue = self->_xpcQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100021D48;
  v7[3] = &unk_100054C58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(xpcQueue, v7);
}

- (void)_notifyDestinationsWithAddedItemsStartingAtIndex:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if ((unint64_t)[(NSMutableArray *)self->_dragItems count] > a3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v5 = [(NSMapTable *)self->_connectionToDestinationMap objectEnumerator];
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v11 = [v10 clientSession];
          uint64_t v12 = [v10 dataTransferSession];
          id v13 = [v12 destinationItemCollection];
          [v11 addedItemCollection:v13];
        }
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

- (void)_lastTouchEndedNormally:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if (self->_lastTouchEnded)
  {
    int v5 = DRLogTarget();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100033CB4();
    }
  }
  else
  {
    self->_lastTouchEnded = 1;
    [(DRDragSession *)self _cancelTouchWatchdog];
    if (v3 && [(NSMapTable *)self->_connectionToDestinationMap count])
    {
      if (![(DRDragSession *)self _runBlocksWaitingForLastTouchAndDestinationToEndIfPossible])
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        _OWORD v15[2] = sub_100022234;
        v15[3] = &unk_100054B58;
        void v15[4] = self;
        id v6 = objc_retainBlock(v15);
        id v7 = [DRDispatchTimer alloc];
        xpcQueue = self->_xpcQueue;
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        _OWORD v13[2] = sub_100022278;
        v13[3] = &unk_100054CF8;
        v13[4] = self;
        id v9 = v6;
        id v14 = v9;
        id v10 = [(DRDispatchTimer *)v7 initWithQueue:xpcQueue eventHandler:v13];
        id v11 = v10;
        if (v10)
        {
          [(DRDispatchTimer *)v10 resetWithTimeout:0.2 leeway:0.05];
          [(DRDispatchTimer *)v11 activate];
          objc_storeStrong((id *)&self->_waitingForDestinationAndTouchObserverTimer, v11);
        }
        else
        {
          uint64_t v12 = DRLogTarget();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            sub_100033C80();
          }

          v9[2](v9);
        }
      }
    }
    else
    {
      [(DRDragSession *)self _endDragByCancelling];
    }
  }
}

- (void)_receivedEndFromDestinationOnConnection:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if (self->_receivedEndFromDestination)
  {
    int v5 = DRLogTarget();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100033D74();
    }
  }
  else
  {
    self->_receivedEndFromDestination = 1;
    id v6 = [(NSMapTable *)self->_connectionToDestinationMap objectForKey:v4];
    [v6 setClientSessionReportedDragEnd:1];
    [(DRDragSession *)self _runBlocksWaitingForLastTouchAndDestinationToEndIfPossible];
  }
}

- (void)_performAfterLastTouchAndDestinationBothEnd:(id)a3
{
  id v4 = (void (**)(void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if (v4)
  {
    if ([(DRDragSession *)self _canRunBlocksWaitingForLastTouchAndDestinationToEnd])
    {
      v4[2](v4);
    }
    else
    {
      int v5 = DRLogTarget();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        BOOL observedLastTouchUp = self->_observedLastTouchUp;
        BOOL lastTouchEnded = self->_lastTouchEnded;
        BOOL receivedEndFromDestination = self->_receivedEndFromDestination;
        int v13 = 138413058;
        id v14 = self;
        __int16 v15 = 1024;
        BOOL v16 = observedLastTouchUp;
        __int16 v17 = 1024;
        BOOL v18 = lastTouchEnded;
        __int16 v19 = 1024;
        BOOL v20 = receivedEndFromDestination;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Session %@: observedLastTouchUp %d, last touch ended %d, received end from destination %d, so saving block for later", (uint8_t *)&v13, 0x1Eu);
      }

      blocksWaitingForLastTouchAndDestinationToEnd = self->_blocksWaitingForLastTouchAndDestinationToEnd;
      if (!blocksWaitingForLastTouchAndDestinationToEnd)
      {
        id v10 = (NSMutableArray *)objc_opt_new();
        id v11 = self->_blocksWaitingForLastTouchAndDestinationToEnd;
        self->_blocksWaitingForLastTouchAndDestinationToEnd = v10;

        blocksWaitingForLastTouchAndDestinationToEnd = self->_blocksWaitingForLastTouchAndDestinationToEnd;
      }
      uint64_t v12 = objc_retainBlock(v4);
      [(NSMutableArray *)blocksWaitingForLastTouchAndDestinationToEnd addObject:v12];
    }
  }
}

- (BOOL)_canRunBlocksWaitingForLastTouchAndDestinationToEnd
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if (self->_observedLastTouchUp || (BOOL v3 = [(DRDragSession *)self _isPolicyControlled])) {
    LOBYTE(v3) = self->_lastTouchEnded && self->_receivedEndFromDestination;
  }
  return v3;
}

- (BOOL)_runBlocksWaitingForLastTouchAndDestinationToEndIfPossible
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  BOOL v3 = [(DRDragSession *)self _canRunBlocksWaitingForLastTouchAndDestinationToEnd];
  if (v3)
  {
    waitingForDestinationAndTouchObserverTimer = self->_waitingForDestinationAndTouchObserverTimer;
    if (waitingForDestinationAndTouchObserverTimer)
    {
      [(DRDispatchTimer *)waitingForDestinationAndTouchObserverTimer cancel];
      int v5 = self->_waitingForDestinationAndTouchObserverTimer;
      self->_waitingForDestinationAndTouchObserverTimer = 0;
    }
    [(DRDragSession *)self _runBlocksWaitingForLastTouchAndDestinationToEnd];
  }
  return v3;
}

- (void)_runBlocksWaitingForLastTouchAndDestinationToEnd
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  if ([(NSMutableArray *)self->_blocksWaitingForLastTouchAndDestinationToEnd count])
  {
    BOOL v3 = DRLogTarget();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      BOOL v16 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Session %@: running deferred blocks", buf, 0xCu);
    }

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = self->_blocksWaitingForLastTouchAndDestinationToEnd;
    id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v8) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v8));
          uint64_t v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
  blocksWaitingForLastTouchAndDestinationToEnd = self->_blocksWaitingForLastTouchAndDestinationToEnd;
  self->_blocksWaitingForLastTouchAndDestinationToEnd = 0;
}

- (void)_updateAccessibilityDragStatus
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  BOOL v3 = [(DRDragSession *)self accessibilityProxy];

  if (v3)
  {
    id v9 = objc_alloc_init((Class)_DUIAccessibilityDragStatus);
    objc_msgSend(v9, "setItemCount:", -[NSMutableArray count](self->_dragItems, "count"));
    lastPotentialDrop = self->_lastPotentialDrop;
    if (lastPotentialDrop) {
      id v5 = [(_DUIPotentialDrop *)lastPotentialDrop operation];
    }
    else {
      id v5 = 0;
    }
    [v9 setPotentialOperation:v5];
    id v6 = self->_lastPotentialDrop;
    if (v6) {
      id v7 = [(_DUIPotentialDrop *)v6 forbidden];
    }
    else {
      id v7 = 0;
    }
    [v9 setForbidden:v7];
    uint64_t v8 = [(DRDragSession *)self accessibilityProxy];
    [v8 dragStatusDidChange:v9];
  }
}

- (void)_updatePotentialDropPreferringFullSizePreview:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  lastPotentialDrop = self->_lastPotentialDrop;
  if (lastPotentialDrop) {
    id v6 = [(_DUIPotentialDrop *)lastPotentialDrop copy];
  }
  else {
    id v6 = (id)objc_opt_new();
  }
  id v7 = v6;
  [v6 setPrefersFullSizePreview:v3];
  [(DRDragSession *)self _updatePotentialDrop:v7 forDestinationClient:self->_lastPotentialDropDestinationClient];
}

- (void)_updatePotentialDrop:(id)a3 forDestinationClient:(id)a4
{
  id v17 = a3;
  id v7 = (_DUIClientSessionCommon *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  uint64_t v8 = [(DRDragSession *)self dataTransferSessionForDestination:v7];
  int64_t sourceDataOwner = self->_sourceDataOwner;
  long long v10 = [v8 sourceProcessInfo];
  long long v11 = [v8 destinationProcessInfo];
  sub_100009B1C(v17, sourceDataOwner, v10, v11);

  long long v12 = +[NSXPCConnection currentConnection];
  unsigned int v13 = [v12 processIdentifier];
  if (self->_lastPotentialDropDestinationClient == v7) {
    int lastPotentialDropProcessIdentifier = self->_lastPotentialDropProcessIdentifier;
  }
  else {
    int lastPotentialDropProcessIdentifier = v13;
  }
  p_lastPotentialDrop = (id *)&self->_lastPotentialDrop;
  if (![(_DUIPotentialDrop *)self->_lastPotentialDrop isEqual:v17]
    || self->_lastPotentialDropDestinationClient != v7)
  {
    if (*p_lastPotentialDrop && ([*p_lastPotentialDrop prefersFullSizePreview] & 1) == 0) {
      [v17 setPrefersFullSizePreview:0];
    }
    objc_storeStrong((id *)&self->_lastPotentialDrop, a3);
    objc_storeStrong((id *)&self->_lastPotentialDropDestinationClient, a4);
    self->_int lastPotentialDropProcessIdentifier = lastPotentialDropProcessIdentifier;
    BOOL v16 = [(DRDragSession *)self delegate];
    [v16 dragSession:self updatedPotentialDrop:v17 forDestinationClient:v7];

    [(DRDragSession *)self _updateAccessibilityDragStatus];
  }
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (NSXPCConnection)sourceConnection
{
  return self->_sourceConnection;
}

- (_DUIClientSessionSource)clientSource
{
  return self->_clientSource;
}

- (DRDragSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DRDragSessionDelegate *)WeakRetained;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)sourceDataOwner
{
  return self->_sourceDataOwner;
}

- (BOOL)supportsSystemDrag
{
  return self->_supportsSystemDrag;
}

- (BOOL)avoidsKeyboardSuppression
{
  return self->_avoidsKeyboardSuppression;
}

- (BOOL)rotatable
{
  return self->_rotatable;
}

- (BOOL)resizable
{
  return self->_resizable;
}

- (CGSize)minimumResizableSize
{
  double width = self->_minimumResizableSize.width;
  double height = self->_minimumResizableSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)maximumResizableSize
{
  double width = self->_maximumResizableSize.width;
  double height = self->_maximumResizableSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)originalRotation
{
  return self->_originalRotation;
}

- (CGSize)originalScale
{
  double width = self->_originalScale.width;
  double height = self->_originalScale.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)wantsElasticEffects
{
  return self->_wantsElasticEffects;
}

- (NSString)persistentSceneIdentifier
{
  return self->_persistentSceneIdentifier;
}

- (unsigned)mainWindowContextId
{
  return self->_mainWindowContextId;
}

- (DRTouchTrackingWindow)sourceInteractionWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceInteractionWindow);
  return (DRTouchTrackingWindow *)WeakRetained;
}

- (DRTouchTrackingWindow)interactionWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionWindow);
  return (DRTouchTrackingWindow *)WeakRetained;
}

- (void)setInteractionWindow:(id)a3
{
}

- (BOOL)sourceExpectsStagedLegacySelectors
{
  return self->_sourceExpectsStagedLegacySelectors;
}

- (BOOL)sourceRestrictsDragToSelf
{
  return self->_sourceRestrictsDragToSelf;
}

- (BOOL)sourceRestrictsDragToLocalDevice
{
  return self->_sourceRestrictsDragToLocalDevice;
}

- (BOOL)originatedFromContinuityDisplay
{
  return self->_originatedFromContinuityDisplay;
}

- (BOOL)continuityDisplayWantsDragsHidden
{
  return self->_continuityDisplayWantsDragsHidden;
}

- (void)setContinuityDisplayWantsDragsHidden:(BOOL)a3
{
  self->_continuityDisplayWantsDragsHidden = a3;
}

- (NSString)displayIdentifierForSynthesizedTouch
{
  return self->_displayIdentifierForSynthesizedTouch;
}

- (void)setDisplayIdentifierForSynthesizedTouch:(id)a3
{
}

- (unint64_t)outsideAppSourceOperationMask
{
  return self->_outsideAppSourceOperationMask;
}

- (BOOL)originatedFromAccessibility
{
  return self->_originatedFromAccessibility;
}

- (NSXPCConnection)axConnection
{
  return self->_axConnection;
}

- (BOOL)originatedFromPointer
{
  return self->_originatedFromPointer;
}

- (_DUIClientSessionAccessibility)accessibilityProxy
{
  return self->_accessibilityProxy;
}

- (DRVirtualHIDService)virtualHIDService
{
  return self->_virtualHIDService;
}

- (void)setVirtualHIDService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualHIDService, 0);
  objc_storeStrong((id *)&self->_accessibilityProxy, 0);
  objc_storeStrong((id *)&self->_displayIdentifierForSynthesizedTouch, 0);
  objc_destroyWeak((id *)&self->_interactionWindow);
  objc_destroyWeak((id *)&self->_sourceInteractionWindow);
  objc_storeStrong((id *)&self->_persistentSceneIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientSource, 0);
  objc_storeStrong((id *)&self->_sourceConnection, 0);
  objc_storeStrong((id *)&self->_loaderQueue, 0);
  objc_storeStrong((id *)&self->_performDropTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_waitingForDestinationAndTouchObserverTimer, 0);
  objc_storeStrong((id *)&self->_blocksWaitingForLastTouchAndDestinationToEnd, 0);
  objc_storeStrong((id *)&self->_axConnection, 0);
  objc_storeStrong((id *)&self->_pendingDataTransferSession, 0);
  objc_storeStrong((id *)&self->_dataProviderEndpoint, 0);
  objc_storeStrong((id *)&self->_itemCollection, 0);
  objc_storeStrong((id *)&self->_continuationSession, 0);
  objc_storeStrong((id *)&self->_lastPotentialDropDestinationClient, 0);
  objc_storeStrong((id *)&self->_lastPotentialDrop, 0);
  objc_storeStrong((id *)&self->_pendingMaskBlocks, 0);
  objc_storeStrong((id *)&self->_destinationKeepAliveAssertion, 0);
  objc_storeStrong((id *)&self->_connectionToDestinationMap, 0);
  objc_storeStrong((id *)&self->_sourceKeepAliveAssertion, 0);
  objc_storeStrong((id *)&self->_dragItems, 0);
  objc_storeStrong((id *)&self->_touchWatchdogTimer, 0);
  objc_storeStrong((id *)&self->_systemRoutingPolicy, 0);
  objc_storeStrong((id *)&self->_routingPolicy, 0);
  objc_storeStrong((id *)&self->_endedTouchIDs, 0);
  objc_storeStrong((id *)&self->_touchIDs, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
}

@end