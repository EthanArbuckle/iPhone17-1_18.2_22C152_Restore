@interface DRDragSessionManager
+ (id)sharedSessionManager;
- (BOOL)_addBeginningTouchesToExistingSessions:(id)a3 viewController:(id)a4 touchWindow:(id)a5;
- (BOOL)destinationIsSystemConnection:(id)a3;
- (BOOL)dragSession:(id)a3 destinationIsDragMonitorConnection:(int)a4;
- (BOOL)dragSession:(id)a3 destinationIsOnenessConnection:(int)a4;
- (BOOL)dragSession:(id)a3 destinationIsSystemConnection:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)xpcQueue_canAcceptDestinationConnection:(id)a3;
- (BOOL)xpcQueue_canCreateNewDragSessionWithSourceConnection:(id)a3;
- (BOOL)xpcQueue_hasTouchBasedDragSessionForEventsForDisplayIdentifier:(id)a3;
- (BOOL)xpcQueue_shouldAcceptNewDestinationConnection:(id)a3;
- (BOOL)xpcQueue_shouldAcceptNewSourceConnection:(id)a3;
- (DRDispatchTimer)pointerWatchdogTimer;
- (DRDragMonitorConnection)ensembleConnection;
- (DRDragMonitorConnection)onenessConnection;
- (DRDragSessionManager)init;
- (DRDragSessionManagerDelegate)delegate;
- (DRKeyboardArbiter)keyboardArbiter;
- (DRLockObserver)lockObserver;
- (DRSystemConnection)systemConnection;
- (NSHashTable)keyboardSessions;
- (NSMutableArray)dragSessions;
- (NSMutableDictionary)pointerServiceAssertionsByDisplayIdentifier;
- (NSMutableDictionary)touchStreamsByDisplayIdentifier;
- (NSXPCListener)destinationListener;
- (NSXPCListener)sourceListener;
- (OS_dispatch_queue)transformUpdateQueue;
- (OS_dispatch_queue)xpcQueue;
- (_TtC5druid15DRTouchDetacher)touchDetacher;
- (id)_filterTouchesForPointer:(id)a3 performingBlockForPointerTouch:(id)a4;
- (id)allWindowContextIdsForDragSession:(id)a3;
- (id)xpcQueue_accessibilityDragSessionForEvents;
- (id)xpcQueue_pointerDragSessionForEvents;
- (unsigned)lastSessionIdentifier;
- (void)_cancelAllDragSessions;
- (void)_cancelPointerBeganWatchdog;
- (void)_createExternalConnections;
- (void)_forEachTouch:(id)a3 performBlockForSession:(id)a4;
- (void)_getTransformForContextID:(unsigned int)a3 layerRenderID:(unint64_t)a4 displayID:(id)a5 allowingEmptyLayerID:(BOOL)a6 completion:(id)a7;
- (void)_getTransformForContextID:(unsigned int)a3 layerRenderID:(unint64_t)a4 displayID:(id)a5 completion:(id)a6;
- (void)_getTransformForLayerContext:(id)a3 completion:(id)a4;
- (void)_notifyListenersSessionDidEnd:(id)a3;
- (void)_notifyListenersSessionWillBegin:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)_pointerBeganWatchdogFired;
- (void)beginDragWithClientSession:(id)a3 configuration:(id)a4 reply:(id)a5;
- (void)configurePortalViewsForDragSessionOriginatingFromViewController:(id)a3;
- (void)dragSession:(id)a3 addedItemCount:(unint64_t)a4;
- (void)dragSession:(id)a3 animateOutVisibleItemsWithOperation:(unint64_t)a4;
- (void)dragSession:(id)a3 enableKeyboardIfNeeded:(BOOL)a4;
- (void)dragSession:(id)a3 findVisibleDroppedItemsInSpaceOfLayerContext:(id)a4 replyingOnQueue:(id)a5 with:(id)a6;
- (void)dragSession:(id)a3 invalidateImageForClient:(id)a4 itemIndex:(unint64_t)a5;
- (void)dragSession:(id)a3 moveToLocation:(CAPoint3D)a4;
- (void)dragSession:(id)a3 removeVisibleDroppedItemsInSpaceOfLayerContext:(id)a4 replyingOnQueue:(id)a5 with:(id)a6;
- (void)dragSession:(id)a3 updateDragItems:(id)a4 forClient:(id)a5 withFence:(id)a6;
- (void)dragSession:(id)a3 updateRoutingPolicy:(id)a4;
- (void)dragSession:(id)a3 updatedPotentialDrop:(id)a4 forDestinationClient:(id)a5;
- (void)dragSessionDidEnd:(id)a3;
- (void)dragSessionWillEnd:(id)a3;
- (void)presentationDidUpdate:(id)a3 forSession:(unsigned int)a4;
- (void)requestImagesForSessionID:(unsigned int)a3 client:(id)a4 itemIndexSet:(id)a5;
- (void)resetDestinationClientForDragSession:(id)a3;
- (void)sawFirstDragEventWithSessionID:(unsigned int)a3 systemPolicy:(BOOL)a4 destination:(id)a5 completion:(id)a6;
- (void)sawFirstDragEventWithSessionID:(unsigned int)a3 systemPolicy:(BOOL)a4 destination:(id)a5 destinationExpectsStagedLegacySelectors:(BOOL)a6 reply:(id)a7;
- (void)sawFirstDragEventWithSessionID:(unsigned int)a3 systemPolicy:(BOOL)a4 destination:(id)a5 reply:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setTouchOffset:(CGPoint)a3 forSession:(unsigned int)a4;
- (void)startup;
- (void)teardownPortalViewsForDragSessionOriginatingFromViewController:(id)a3;
- (void)touchTrackingWindow:(id)a3 touchesBegan:(id)a4;
- (void)touchTrackingWindow:(id)a3 touchesCancelled:(id)a4;
- (void)touchTrackingWindow:(id)a3 touchesEnded:(id)a4 pairedWithVelocities:(id)a5;
- (void)touchTrackingWindow:(id)a3 touchesMoved:(id)a4;
- (void)warmUp;
- (void)xpcQueue_acceptNewDestinationConnection:(id)a3;
- (void)xpcQueue_acceptNewSourceConnection:(id)a3;
- (void)xpcQueue_addDragSession:(id)a3;
- (void)xpcQueue_removeDragSession:(id)a3;
- (void)xpcQueue_validateTouchStreamForDragSession:(id)a3;
@end

@implementation DRDragSessionManager

+ (id)sharedSessionManager
{
  if (qword_100064920 != -1) {
    dispatch_once(&qword_100064920, &stru_100056140);
  }
  v2 = (void *)qword_100064918;
  return v2;
}

- (DRDragSessionManager)init
{
  v23.receiver = self;
  v23.super_class = (Class)DRDragSessionManager;
  v2 = [(DRDragSessionManager *)&v23 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dragSessions = v2->_dragSessions;
    v2->_dragSessions = (NSMutableArray *)v3;

    v2->_lastSessionIdentifier = arc4random();
    uint64_t v5 = +[NSHashTable weakObjectsHashTable];
    keyboardSessions = v2->_keyboardSessions;
    v2->_keyboardSessions = (NSHashTable *)v5;

    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.DragUI.druid.xpcQueue", v7);
    xpcQueue = v2->_xpcQueue;
    v2->_xpcQueue = (OS_dispatch_queue *)v8;

    v10 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.DragUI.druid.source"];
    sourceListener = v2->_sourceListener;
    v2->_sourceListener = v10;

    [(NSXPCListener *)v2->_sourceListener _setQueue:v2->_xpcQueue];
    [(NSXPCListener *)v2->_sourceListener setDelegate:v2];
    v12 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.DragUI.druid.destination"];
    destinationListener = v2->_destinationListener;
    v2->_destinationListener = v12;

    [(NSXPCListener *)v2->_destinationListener _setQueue:v2->_xpcQueue];
    [(NSXPCListener *)v2->_destinationListener setDelegate:v2];
    uint64_t v14 = objc_opt_new();
    keyboardArbiter = v2->_keyboardArbiter;
    v2->_keyboardArbiter = (DRKeyboardArbiter *)v14;

    objc_initWeak(&location, v2);
    v16 = [DRLockObserver alloc];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000293BC;
    v20[3] = &unk_100056168;
    objc_copyWeak(&v21, &location);
    v17 = [(DRLockObserver *)v16 initWithLockHandler:v20];
    lockObserver = v2->_lockObserver;
    v2->_lockObserver = v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)startup
{
  uint64_t v3 = [(DRDragSessionManager *)self keyboardArbiter];
  [v3 connect];

  [(DRDragSessionManager *)self _createExternalConnections];
  v4 = (_TtC5druid15DRTouchDetacher *)objc_opt_new();
  touchDetacher = self->_touchDetacher;
  self->_touchDetacher = v4;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000294BC;
  v6[3] = &unk_100054B58;
  v6[4] = self;
  [UIApp _performBlockAfterCATransactionCommits:v6];
}

- (void)requestImagesForSessionID:(unsigned int)a3 client:(id)a4 itemIndexSet:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v10 = self->_dragSessions;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v15, "identifier", (void)v16) == a3)
        {
          [v15 requestImagesForClient:v8 itemIndexes:v9];
          goto LABEL_11;
        }
      }
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)setTouchOffset:(CGPoint)a3 forSession:(unsigned int)a4
{
}

- (void)presentationDidUpdate:(id)a3 forSession:(unsigned int)a4
{
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = self->_dragSessions;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v12, "identifier", (void)v13) == a4)
        {
          [v12 notifyDragMonitorsWithUpdatedPresentation:v6];
          goto LABEL_11;
        }
      }
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = (NSXPCListener *)a3;
  id v7 = a4;
  if (self->_sourceListener == v6)
  {
    unsigned __int8 v9 = [(DRDragSessionManager *)self xpcQueue_shouldAcceptNewSourceConnection:v7];
LABEL_6:
    BOOL v8 = v9;
    goto LABEL_7;
  }
  if (self->_destinationListener == v6)
  {
    unsigned __int8 v9 = [(DRDragSessionManager *)self xpcQueue_shouldAcceptNewDestinationConnection:v7];
    goto LABEL_6;
  }
  BOOL v8 = 0;
LABEL_7:

  return v8;
}

- (BOOL)xpcQueue_canCreateNewDragSessionWithSourceConnection:(id)a3
{
  return 1;
}

- (BOOL)xpcQueue_shouldAcceptNewSourceConnection:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DRDragSessionManager *)self xpcQueue_canCreateNewDragSessionWithSourceConnection:v4];
  if (v5)
  {
    [(DRDragSessionManager *)self xpcQueue_acceptNewSourceConnection:v4];
    [v4 resume];
  }
  else
  {
    id v6 = DRLogTarget();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Refusing to accept new source connection", v8, 2u);
    }
  }
  return v5;
}

- (void)xpcQueue_acceptNewSourceConnection:(id)a3
{
  id v4 = a3;
  BOOL v5 = DRLogTarget();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = [v4 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Accepting new source connection from PID %d", (uint8_t *)&buf, 8u);
  }

  [v4 _setQueue:self->_xpcQueue];
  id v6 = _DUINewServerSourceInterface();
  [v4 setExportedInterface:v6];

  [v4 setExportedObject:self];
  id v7 = _DUINewClientSourceInterface();
  [v4 setRemoteObjectInterface:v7];

  objc_initWeak(&buf, v4);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100029B50;
  v11[3] = &unk_100054CA8;
  objc_copyWeak(&v12, &buf);
  [v4 setInterruptionHandler:v11];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100029C10;
  v8[3] = &unk_100056190;
  objc_copyWeak(&v9, &buf);
  objc_copyWeak(&v10, &location);
  [v4 setInvalidationHandler:v8];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  objc_destroyWeak(&buf);
}

- (BOOL)xpcQueue_canAcceptDestinationConnection:(id)a3
{
  return 1;
}

- (BOOL)xpcQueue_shouldAcceptNewDestinationConnection:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DRDragSessionManager *)self xpcQueue_canAcceptDestinationConnection:v4];
  if (v5)
  {
    [(DRDragSessionManager *)self xpcQueue_acceptNewDestinationConnection:v4];
    [v4 resume];
  }
  else
  {
    id v6 = DRLogTarget();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Refusing to accept new destination connection", v8, 2u);
    }
  }
  return v5;
}

- (void)xpcQueue_acceptNewDestinationConnection:(id)a3
{
  id v4 = a3;
  BOOL v5 = DRLogTarget();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = [v4 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Accepting new destination connection from PID %d", (uint8_t *)&buf, 8u);
  }

  [v4 _setQueue:self->_xpcQueue];
  id v6 = _DUINewServerDestinationInterface();
  [v4 setExportedInterface:v6];

  [v4 setExportedObject:self];
  id v7 = _DUINewClientDestinationInterface();
  [v4 setRemoteObjectInterface:v7];

  objc_initWeak(&buf, v4);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002A0CC;
  v11[3] = &unk_100054CA8;
  objc_copyWeak(&v12, &buf);
  [v4 setInterruptionHandler:v11];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002A18C;
  v8[3] = &unk_100056190;
  objc_copyWeak(&v9, &buf);
  objc_copyWeak(&v10, &location);
  [v4 setInvalidationHandler:v8];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  objc_destroyWeak(&buf);
}

- (void)xpcQueue_addDragSession:(id)a3
{
  id v4 = a3;
  [(NSMutableArray *)self->_dragSessions addObject:v4];
  [(DRDragSessionManager *)self xpcQueue_validateTouchStreamForDragSession:v4];
  +[NSXPCConnection beginTransaction];
  BOOL v5 = DRLogTarget();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unsigned int v6 = [v4 identifier];
    id v7 = [(NSMutableArray *)self->_dragSessions count];
    v8[0] = 67109376;
    v8[1] = v6;
    __int16 v9 = 2048;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Added drag session %u (session count now: %lu)", (uint8_t *)v8, 0x12u);
  }
}

- (void)xpcQueue_removeDragSession:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableArray *)self->_dragSessions indexOfObjectIdenticalTo:v4];
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = v5;
    unsigned int v7 = [v4 identifier];
    [(NSMutableArray *)self->_dragSessions removeObjectAtIndex:v6];
    [(DRDragSessionManager *)self xpcQueue_validateTouchStreamForDragSession:v4];
    +[NSXPCConnection endTransaction];
    BOOL v8 = DRLogTarget();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [(NSMutableArray *)self->_dragSessions count];
      v10[0] = 67109376;
      v10[1] = v7;
      __int16 v11 = 2048;
      id v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Removed drag session %u (session count now: %lu)", (uint8_t *)v10, 0x12u);
    }
  }
}

- (void)xpcQueue_validateTouchStreamForDragSession:(id)a3
{
  id v57 = a3;
  v60 = [(DRDragSessionManager *)self xpcQueue_pointerDragSessionForEvents];
  v64 = [(DRDragSessionManager *)self xpcQueue_accessibilityDragSessionForEvents];
  id v4 = [(DRDragSessionManager *)self delegate];
  id v5 = [v4 allDisplayIdentifiers];

  v65 = +[NSMutableDictionary dictionary];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v72 objects:v87 count:16];
  if (!v6)
  {

    char v63 = 0;
    goto LABEL_32;
  }
  char v63 = 0;
  unsigned __int8 v58 = 0;
  id v61 = *(id *)v73;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(id *)v73 != v61) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void *)(*((void *)&v72 + 1) + 8 * i);
      id v9 = [(DRDragSessionManager *)self delegate];
      id v10 = [v9 touchTrackingWindowForHardwareDisplayIdentifier:v8];

      [v65 setObject:v10 forKey:v8];
      if (v64)
      {
        __int16 v11 = [v64 displayIdentifierForSynthesizedTouch];
        unsigned int v12 = [v11 isEqualToString:v8] ^ 1;
      }
      else
      {
        unsigned int v13 = [(DRDragSessionManager *)self xpcQueue_hasTouchBasedDragSessionForEventsForDisplayIdentifier:v8];
        if (v60)
        {
          long long v14 = [v60 displayIdentifierForSynthesizedTouch];
          unsigned int v15 = [v14 isEqualToString:v8];

          int v16 = v15 ^ 1;
          v58 |= v15 ^ 1;
          v63 |= v15;
        }
        else
        {
          unsigned int v15 = 0;
          int v16 = 0;
        }
        __int16 v11 = DRLogTarget();
        unsigned int v12 = v16 | v13;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)id buf = 138413570;
          uint64_t v78 = v8;
          __int16 v79 = 1024;
          *(_DWORD *)v80 = v16 | v13;
          *(_WORD *)&v80[4] = 1024;
          *(_DWORD *)&v80[6] = v16;
          __int16 v81 = 1024;
          unsigned int v82 = v13;
          __int16 v83 = 1024;
          unsigned int v84 = v15;
          __int16 v85 = 2112;
          v86 = v60;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "{xpcQueue_validateTouchStream: display %@ shouldHaveTouchStream: %d (pointer %d touch %d), shouldHavePointerStream %d, pointerSession %@, ", buf, 0x2Eu);
        }
      }

      long long v17 = [v10 windowScene];
      long long v18 = [v17 screen];
      long long v19 = [v18 displayConfiguration];
      v20 = [v19 hardwareIdentifier];

      id v21 = [v10 _contextId];
      touchStreamsByDisplayIdentifier = self->_touchStreamsByDisplayIdentifier;
      if (!v12)
      {
        v31 = [(NSMutableDictionary *)touchStreamsByDisplayIdentifier objectForKey:v8];
        id v29 = v31;
        if (v31)
        {
          [v31 invalidate];
          v32 = DRLogTarget();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)id buf = 138412546;
            uint64_t v78 = v8;
            __int16 v79 = 2112;
            *(void *)v80 = v29;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "xpcQueue_validateTouchStream: display: %@, deleting stream: %@", buf, 0x16u);
          }

          [(NSMutableDictionary *)self->_touchStreamsByDisplayIdentifier removeObjectForKey:v8];
        }
        goto LABEL_24;
      }
      if (!touchStreamsByDisplayIdentifier)
      {
        +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [obj count]);
        objc_super v23 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v24 = self->_touchStreamsByDisplayIdentifier;
        self->_touchStreamsByDisplayIdentifier = v23;

        touchStreamsByDisplayIdentifier = self->_touchStreamsByDisplayIdentifier;
      }
      v25 = [(NSMutableDictionary *)touchStreamsByDisplayIdentifier objectForKey:v8];
      BOOL v26 = v25 == 0;

      if (v26)
      {
        id v27 = objc_alloc((Class)BKSTouchStream);
        v28 = objc_opt_new();
        id v29 = [v27 initWithContextID:v21 displayUUID:v20 identifier:2 policy:v28];

        v30 = DRLogTarget();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)id buf = 138412546;
          uint64_t v78 = v8;
          __int16 v79 = 2112;
          *(void *)v80 = v29;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "xpcQueue_validateTouchStream: display: %@, created stream: %@", buf, 0x16u);
        }

        [(NSMutableDictionary *)self->_touchStreamsByDisplayIdentifier setObject:v29 forKey:v8];
LABEL_24:
      }
    }
    id v6 = [obj countByEnumeratingWithState:&v72 objects:v87 count:16];
  }
  while (v6);

  if (((v60 != 0) & v58) == 1)
  {
    v33 = DRLogTarget();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "xpcQueue_validateTouchStream: creating pointer began watchdog", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    v34 = [DRDispatchTimer alloc];
    v35 = [(DRDragSessionManager *)self xpcQueue];
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_10002AE08;
    v70[3] = &unk_100054CA8;
    objc_copyWeak(&v71, (id *)buf);
    v36 = [(DRDispatchTimer *)v34 initWithQueue:v35 eventHandler:v70];

    [(DRDispatchTimer *)v36 resetWithTimeout:0.5 leeway:0.1];
    [(DRDispatchTimer *)v36 activate];
    pointerWatchdogTimer = self->_pointerWatchdogTimer;
    self->_pointerWatchdogTimer = v36;

    objc_destroyWeak(&v71);
    objc_destroyWeak((id *)buf);
  }
LABEL_32:
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v62 = obj;
  id v38 = [v62 countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v67;
    do
    {
      for (j = 0; j != v38; j = (char *)j + 1)
      {
        if (*(void *)v67 != v39) {
          objc_enumerationMutation(v62);
        }
        uint64_t v41 = *(void *)(*((void *)&v66 + 1) + 8 * (void)j);
        v42 = [v65 objectForKey:v41];
        v43 = [v42 windowScene];
        v44 = [v43 screen];
        v45 = [v44 displayConfiguration];
        v46 = [v45 hardwareIdentifier];

        id v47 = [v42 _contextId];
        pointerServiceAssertionsByDisplayIdentifier = self->_pointerServiceAssertionsByDisplayIdentifier;
        if ((v63 & 1) == 0)
        {
          v54 = [(NSMutableDictionary *)pointerServiceAssertionsByDisplayIdentifier objectForKey:v41];
          if (v54)
          {
            v56 = DRLogTarget();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)id buf = 138412546;
              uint64_t v78 = v41;
              __int16 v79 = 2112;
              *(void *)v80 = v54;
              _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "xpcQueue_validateTouchStream: display: %@ deleting mouse pointer service assertion %@", buf, 0x16u);
            }

            [v54 invalidate];
            [(NSMutableDictionary *)self->_pointerServiceAssertionsByDisplayIdentifier removeObjectForKey:v41];
          }
          goto LABEL_48;
        }
        if (!pointerServiceAssertionsByDisplayIdentifier)
        {
          +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v62 count]);
          v49 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
          v50 = self->_pointerServiceAssertionsByDisplayIdentifier;
          self->_pointerServiceAssertionsByDisplayIdentifier = v49;

          pointerServiceAssertionsByDisplayIdentifier = self->_pointerServiceAssertionsByDisplayIdentifier;
        }
        v51 = [(NSMutableDictionary *)pointerServiceAssertionsByDisplayIdentifier objectForKey:v41];
        BOOL v52 = v51 == 0;

        if (v52)
        {
          v53 = +[BKSMousePointerService sharedInstance];
          v54 = [v53 requestGlobalMouseEventsForDisplay:v46 targetContextID:v47];

          v55 = DRLogTarget();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)id buf = 138412546;
            uint64_t v78 = v41;
            __int16 v79 = 2112;
            *(void *)v80 = v54;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "xpcQueue_validateTouchStream: display: %@ created mouse pointer service assertion: %@", buf, 0x16u);
          }

          [(NSMutableDictionary *)self->_pointerServiceAssertionsByDisplayIdentifier setObject:v54 forKey:v41];
LABEL_48:
        }
      }
      id v38 = [v62 countByEnumeratingWithState:&v66 objects:v76 count:16];
    }
    while (v38);
  }
}

- (id)xpcQueue_accessibilityDragSessionForEvents
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_dragSessions;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "originatedFromAccessibility", (void)v8)
          && (uint64_t)[v6 state] < 4)
        {
          id v3 = v6;
          goto LABEL_12;
        }
      }
      id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)xpcQueue_hasTouchBasedDragSessionForEventsForDisplayIdentifier:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_dragSessions;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v11 = [(DRDragSessionManager *)self delegate];
        unsigned int v12 = [v11 sourceDisplayIdentifierForDragSession:v10];

        if ((uint64_t)[v10 state] <= 3
          && ([v10 originatedFromAccessibility] & 1) == 0
          && ([v10 originatedFromPointer] & 1) == 0
          && ([v12 isEqualToString:v4] & 1) != 0)
        {

          BOOL v13 = 1;
          goto LABEL_14;
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_14:

  return v13;
}

- (id)xpcQueue_pointerDragSessionForEvents
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = self->_dragSessions;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "originatedFromPointer", (void)v9)
          && (uint64_t)[v7 state] < 4)
        {
          id v4 = v7;
          goto LABEL_12;
        }
      }
      id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

- (void)_cancelPointerBeganWatchdog
{
  id v3 = [(DRDragSessionManager *)self xpcQueue];
  dispatch_assert_queue_V2(v3);

  [(DRDispatchTimer *)self->_pointerWatchdogTimer cancel];
  pointerWatchdogTimer = self->_pointerWatchdogTimer;
  self->_pointerWatchdogTimer = 0;
}

- (void)_pointerBeganWatchdogFired
{
  id v3 = DRLogTarget();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10003407C((uint64_t)self, v3);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  id v4 = [(DRDragSessionManager *)self xpcQueue_pointerDragSessionForEvents];
  [v4 cancelPointerDrag];

  [(DRDragSessionManager *)self _cancelPointerBeganWatchdog];
}

- (void)warmUp
{
  v2 = DRLogTarget();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = +[NSXPCConnection currentConnection];
    v4[0] = 67109120;
    v4[1] = [v3 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Warmed up by PID %d", (uint8_t *)v4, 8u);
  }
}

- (void)beginDragWithClientSession:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v58 = a3;
  id v8 = a4;
  id v9 = a5;
  id val = +[NSXPCConnection currentConnection];
  long long v10 = [v8 axEndpoint];

  uint64_t v11 = [v8 touchIDs];
  long long v12 = (void *)v11;
  BOOL v13 = &__NSArray0__struct;
  if (v11) {
    BOOL v13 = (void *)v11;
  }
  id v59 = v13;

  long long v14 = DRLogTarget();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    unsigned int v15 = [val processIdentifier];
    id v16 = [v59 count];
    long long v17 = [v8 itemCollection];
    long long v18 = [v17 items];
    *(_DWORD *)id buf = 67109632;
    *(_DWORD *)__int16 v81 = v15;
    *(_WORD *)&v81[4] = 2048;
    *(void *)&v81[6] = v16;
    __int16 v82 = 2048;
    id v83 = [v18 count];
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Received request to begin drag for PID %d with %ld touches, %ld items", buf, 0x1Cu);
  }
  if (!v10)
  {
    unsigned int v23 = [v8 initiatedWithPointer];
    id v21 = 0;
    int v24 = v23 ^ 1;
    goto LABEL_12;
  }
  id v19 = objc_alloc((Class)NSXPCConnection);
  v20 = [v8 axEndpoint];
  id v21 = [v19 initWithListenerEndpoint:v20];

  if (v21)
  {
    objc_initWeak((id *)buf, val);
    objc_initWeak(&location, v21);
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_10002BD1C;
    v76[3] = &unk_100054CA8;
    objc_copyWeak(&v77, &location);
    [v21 setInterruptionHandler:v76];
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_10002BD9C;
    v74[3] = &unk_100054CA8;
    objc_copyWeak(&v75, (id *)buf);
    [v21 setInvalidationHandler:v74];
    objc_destroyWeak(&v75);
    objc_destroyWeak(&v77);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  if (![(NSMutableArray *)self->_dragSessions count])
  {
    unsigned int v23 = 0;
    int v24 = 0;
LABEL_12:
    v25 = [(DRDragSessionManager *)self xpcQueue_accessibilityDragSessionForEvents];
    BOOL v26 = v25 == 0;

    if (!v26)
    {
      CFStringRef v22 = @"Accessibility has already started a session";
      goto LABEL_14;
    }
    if (v23)
    {
      v28 = [(DRDragSessionManager *)self xpcQueue_pointerDragSessionForEvents];
      BOOL v29 = v28 == 0;

      if (!v29)
      {
        CFStringRef v22 = @"There is already a pointer-based session";
        goto LABEL_14;
      }
    }
    if (v10 && !v21)
    {
      CFStringRef v22 = @"Accessibility endpoint could not be created";
      goto LABEL_14;
    }
    if ([v59 count]) {
      char v30 = 0;
    }
    else {
      char v30 = v24;
    }
    if (v30)
    {
      CFStringRef v22 = @"Session should have touches";
      goto LABEL_14;
    }
    if ([v59 count]) {
      int v31 = v24;
    }
    else {
      int v31 = 1;
    }
    if (v31 != 1)
    {
      CFStringRef v22 = @"Session cannot have touches";
      goto LABEL_14;
    }
    if (!v9)
    {
      CFStringRef v22 = @"No reply";
      goto LABEL_14;
    }
    unsigned int v52 = self->_lastSessionIdentifier + 1;
    self->_lastSessionIdentifier = v52;
    v32 = [v8 coordinateSpaceSourceLayerContext];
    v56 = [v32 systemShellHostingSpaceIdentifier];

    v33 = [(DRDragSessionManager *)self delegate];
    v54 = [v33 activatedSceneGroupForSystemShellHostingSpaceIdentifier:v56];

    if (v54)
    {
      dispatch_time_t v34 = dispatch_time(0, 200000000);
      dispatch_group_wait(v54, v34);
    }
    v35 = [(DRDragSessionManager *)self delegate];
    id v57 = [v35 hardwareDisplayIdentifierMatchingSystemShellHostingSpaceIdentifier:v56];

    if (!v57)
    {
      v36 = [(DRDragSessionManager *)self delegate];
      v37 = [v8 sceneIdentifier];
      id v57 = [v36 displayIdentifierForSceneIdentifier:v37];
    }
    id v38 = [(DRDragSessionManager *)self delegate];
    v53 = [v38 touchTrackingWindowForHardwareDisplayIdentifier:v57];

    v55 = [[DRDragSession alloc] initWithIdentifier:v52 configuration:v8 mainWindow:v53 sourceConnection:val accessibilityConnection:v21 clientSource:v58 delegate:self];
    uint64_t v39 = DRLogTarget();
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);
    if (!v55)
    {
      if (v40)
      {
        *(_WORD *)id buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Cannot begin drag: could not create drag session", buf, 2u);
      }

      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
      goto LABEL_64;
    }
    if (v40)
    {
      unsigned int v41 = [(DRDragSession *)v55 identifier];
      *(_DWORD *)id buf = 67109120;
      *(_DWORD *)__int16 v81 = v41;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Created session with ID %u", buf, 8u);
    }

    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_10002BE1C;
    v70[3] = &unk_1000561B8;
    void v70[4] = self;
    id v50 = v59;
    id v71 = v50;
    v42 = v55;
    long long v72 = v42;
    id v43 = v8;
    id v73 = v43;
    v51 = objc_retainBlock(v70);
    if (v24)
    {
      if (!((unsigned int (*)(void))v51[2])())
      {
        v49 = DRLogTarget();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)id buf = 138412290;
          *(void *)__int16 v81 = v50;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "Cannot begin drag: could not detach touches with IDs %@", buf, 0xCu);
        }

        [(DRDragSession *)v42 fail];
        (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
        goto LABEL_63;
      }
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v44 = v50;
      id v45 = [v44 countByEnumeratingWithState:&v66 objects:v79 count:16];
      if (v45)
      {
        uint64_t v46 = *(void *)v67;
        do
        {
          for (i = 0; i != v45; i = (char *)i + 1)
          {
            if (*(void *)v67 != v46) {
              objc_enumerationMutation(v44);
            }
            [(DRDragSession *)v42 addTouchID:*(void *)(*((void *)&v66 + 1) + 8 * i)];
          }
          id v45 = [v44 countByEnumeratingWithState:&v66 objects:v79 count:16];
        }
        while (v45);
      }
    }
    [(DRDragSessionManager *)self xpcQueue_addDragSession:v42];
    v48 = DRLogTarget();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "Beginning drag", buf, 2u);
    }

    (*((void (**)(id, void, DRDragSession *))v9 + 2))(v9, v52, v42);
    [(DRDragSession *)v42 beginDrag];
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_10002BE94;
    v61[3] = &unk_100056208;
    id v62 = v43;
    char v63 = v42;
    v64 = self;
    id v65 = v50;
    [(DRDragSessionManager *)self _notifyListenersSessionWillBegin:v63 configuration:v62 completion:v61];

LABEL_63:
LABEL_64:

    goto LABEL_18;
  }
  CFStringRef v22 = @"Accessibility cannot start a drag until all other drags are done";
LABEL_14:
  id v27 = DRLogTarget();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138412290;
    *(void *)__int16 v81 = v22;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Cannot begin drag: %@", buf, 0xCu);
  }

  if (v9) {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
LABEL_18:
}

- (void)_createExternalConnections
{
  id v3 = [DRSystemConnection alloc];
  id v4 = [(DRDragSessionManager *)self xpcQueue];
  uint64_t v5 = [(DRSystemConnection *)v3 initWithQueue:v4];
  systemConnection = self->_systemConnection;
  self->_systemConnection = v5;

  if (+[DRDragMonitorConnectionProvider isEnsembleSupported])
  {
    id v7 = [(DRDragSessionManager *)self xpcQueue];
    id v8 = +[DRDragMonitorConnectionProvider ensembleConnectionWithQueue:v7];
    ensembleConnection = self->_ensembleConnection;
    self->_ensembleConnection = v8;
  }
  id v12 = [(DRDragSessionManager *)self xpcQueue];
  long long v10 = +[DRDragMonitorConnectionProvider onenessConnectionWithQueue:v12];
  onenessConnection = self->_onenessConnection;
  self->_onenessConnection = v10;
}

- (void)_notifyListenersSessionWillBegin:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = dispatch_group_create();
  [(DRSystemConnection *)self->_systemConnection notifySessionWillBegin:v10];
  [(DRDragMonitorConnection *)self->_ensembleConnection notifySessionWillBegin:v10 configuration:v9 completion:&stru_100056228];
  dispatch_group_enter(v11);
  onenessConnection = self->_onenessConnection;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002C3D0;
  v14[3] = &unk_100054B58;
  unsigned int v15 = v11;
  BOOL v13 = v11;
  [(DRDragMonitorConnection *)onenessConnection notifySessionWillBegin:v10 configuration:v9 completion:v14];

  dispatch_group_notify(v13, (dispatch_queue_t)self->_xpcQueue, v8);
}

- (void)_notifyListenersSessionDidEnd:(id)a3
{
  systemConnection = self->_systemConnection;
  id v5 = a3;
  [(DRSystemConnection *)systemConnection notifySessionDidEnd:v5];
  [(DRDragMonitorConnection *)self->_ensembleConnection notifySessionDidEnd:v5];
  [(DRDragMonitorConnection *)self->_onenessConnection notifySessionDidEnd:v5];
}

- (void)configurePortalViewsForDragSessionOriginatingFromViewController:(id)a3
{
  id v4 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v28 = self;
  id v5 = [(DRDragSessionManager *)self delegate];
  id v6 = [v5 allDisplayIdentifiers];

  id obj = v6;
  id v29 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v29)
  {
    uint64_t v27 = *(void *)v31;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v31 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v30 + 1) + 8 * (void)v7);
        id v9 = [(DRDragSessionManager *)v28 delegate];
        id v10 = [v9 contentWindowForHardwareDisplayIdentifier:v8];

        id v11 = [v10 rootViewController];
        id v12 = v11;
        if (v11 != v4)
        {
          BOOL v13 = [v11 view];
          long long v14 = [v13 window];
          unsigned int v15 = [v14 screen];
          id v16 = [v4 view];
          long long v17 = [v16 window];
          long long v18 = [v17 screen];
          CGFloat v19 = sub_100006354(v15, v18, CGRectZero.origin.x);
          CGFloat v21 = v20;
          CGFloat v23 = v22;
          CGFloat v25 = v24;

          v35.origin.x = v19;
          v35.origin.y = v21;
          v35.size.width = v23;
          v35.size.height = v25;
          if (!CGRectIsNull(v35)) {
            [v12 configurePortalViewForDragSessionOriginatingFromViewController:v4];
          }
        }

        id v7 = (char *)v7 + 1;
      }
      while (v29 != v7);
      id v29 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v29);
  }
}

- (void)teardownPortalViewsForDragSessionOriginatingFromViewController:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(DRDragSessionManager *)self delegate];
  id v6 = [v5 allDisplayIdentifiers];

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v10);
        id v12 = [(DRDragSessionManager *)self delegate];
        BOOL v13 = [v12 contentWindowForHardwareDisplayIdentifier:v11];

        id v14 = [v13 rootViewController];
        unsigned int v15 = v14;
        if (v14 != v4) {
          [v14 teardownPortalViewForDragSessionOriginatingFromViewController:v4];
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)sawFirstDragEventWithSessionID:(unsigned int)a3 systemPolicy:(BOOL)a4 destination:(id)a5 reply:(id)a6
{
}

- (void)sawFirstDragEventWithSessionID:(unsigned int)a3 systemPolicy:(BOOL)a4 destination:(id)a5 completion:(id)a6
{
}

- (void)sawFirstDragEventWithSessionID:(unsigned int)a3 systemPolicy:(BOOL)a4 destination:(id)a5 destinationExpectsStagedLegacySelectors:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = +[NSXPCConnection currentConnection];
  id v15 = [v14 processIdentifier];
  if (v9)
  {
    if ([(DRDragSessionManager *)self destinationIsSystemConnection:v14])
    {
      BOOL v9 = 1;
    }
    else
    {
      long long v16 = DRLogTarget();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000340F4((uint64_t)self, (int)v15, v16);
      }

      BOOL v9 = 0;
    }
  }
  long long v17 = DRLogTarget();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    long long v18 = +[NSNumber numberWithBool:v9];
    *(_DWORD *)id buf = 67109634;
    unsigned int v45 = v15;
    __int16 v46 = 1024;
    unsigned int v47 = a3;
    __int16 v48 = 2112;
    v49 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Received sawFirstDragEvent for PID %d session %u isSystemPolicy: %@", buf, 0x18u);
  }
  if (!v12 || !v13) {
    goto LABEL_24;
  }
  BOOL v32 = v8;
  long long v33 = v14;
  id v19 = v12;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  double v20 = self->_dragSessions;
  id v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v21)
  {
LABEL_19:

    id v12 = v19;
    id v14 = v33;
LABEL_24:
    id v29 = DRLogTarget();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id buf = 67109120;
      unsigned int v45 = a3;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Could not find session %u", buf, 8u);
    }
    goto LABEL_26;
  }
  id v22 = v21;
  uint64_t v23 = *(void *)v40;
LABEL_13:
  id v24 = v15;
  uint64_t v25 = 0;
  while (1)
  {
    if (*(void *)v40 != v23) {
      objc_enumerationMutation(v20);
    }
    BOOL v26 = *(void **)(*((void *)&v39 + 1) + 8 * v25);
    if ([v26 identifier] == a3) {
      break;
    }
    if (v22 == (id)++v25)
    {
      id v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v39 objects:v43 count:16];
      id v15 = v24;
      if (v22) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }
  uint64_t v27 = v26;

  LODWORD(v15) = v24;
  id v12 = v19;
  id v14 = v33;
  if (!v27) {
    goto LABEL_24;
  }
  unsigned int v28 = [v27 addDestination:v12 onConnection:v33 systemPolicy:v9 destinationExpectsStagedSelectors:v32];
  id v29 = DRLogTarget();
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
  if (v28)
  {
    if (v30)
    {
      *(_DWORD *)id buf = 67109120;
      unsigned int v45 = a3;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Added destination to session %u", buf, 8u);
    }
    goto LABEL_27;
  }
  if (v30)
  {
    *(_DWORD *)id buf = 67109120;
    unsigned int v45 = a3;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Could not add destination to session %u", buf, 8u);
  }

  id v29 = v27;
LABEL_26:
  uint64_t v27 = 0;
LABEL_27:

  if (v13)
  {
    if (v27)
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10002CCAC;
      v34[3] = &unk_100056250;
      CGRect v35 = v27;
      int v38 = (int)v15;
      id v37 = v13;
      id v36 = v12;
      [v35 performAfterReceivingOutsideAppSourceOperationMask:v34];
    }
    else
    {
      long long v31 = DRLogTarget();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id buf = 67109120;
        unsigned int v45 = v15;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Replying to destination PID %d sawFirstDragEvent with nil session", buf, 8u);
      }

      (*((void (**)(id, void, void, void, void))v13 + 2))(v13, 0, 0, 0, 0);
    }
  }
}

- (id)allWindowContextIdsForDragSession:(id)a3
{
  id v4 = +[NSMutableArray array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [(DRDragSessionManager *)self delegate];
  id v6 = [v5 allDisplayIdentifiers];

  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v12 = [(DRDragSessionManager *)self delegate];
        id v13 = [v12 contentWindowForHardwareDisplayIdentifier:v11];

        id v14 = [(DRDragSessionManager *)self delegate];
        id v15 = [v14 touchTrackingWindowForHardwareDisplayIdentifier:v11];

        long long v16 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v13 _contextId]);
        [v4 addObject:v16];

        long long v17 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v15 _contextId]);
        [v4 addObject:v17];
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v4;
}

- (void)dragSession:(id)a3 updateDragItems:(id)a4 forClient:(id)a5 withFence:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v40 = a5;
  id v39 = a6;
  id v12 = dispatch_group_create();
  id v43 = self;
  id v13 = [(DRDragSessionManager *)self delegate];
  long long v41 = v10;
  long long v42 = [v13 sourceViewControllerForSession:v10];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v14 = v11;
  id v15 = [v14 countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v58;
    do
    {
      long long v18 = 0;
      do
      {
        if (*(void *)v58 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = [*(id *)(*((void *)&v57 + 1) + 8 * (void)v18) preview];
        long long v20 = v19;
        if (v19)
        {
          long long v21 = [v19 coordinateSpaceSourceLayerContext];
          unsigned int v22 = [v21 contextID];

          uint64_t v23 = [v20 coordinateSpaceSourceLayerContext];
          id v24 = [v23 renderID];

          uint64_t v25 = [v20 coordinateSpaceSourceLayerContext];
          BOOL v26 = [v25 systemShellHostingSpaceIdentifier];

          if (v22) {
            BOOL v27 = v24 == 0;
          }
          else {
            BOOL v27 = 1;
          }
          if (!v27 && v26 != 0)
          {
            [v20 originalCenterInCoordinateSpace];
            uint64_t v30 = v29;
            uint64_t v32 = v31;
            dispatch_group_enter(v12);
            long long v33 = [v20 coordinateSpaceSourceLayerContext];
            v51[0] = _NSConcreteStackBlock;
            v51[1] = 3221225472;
            v51[2] = sub_10002D428;
            v51[3] = &unk_100056278;
            id v52 = v42;
            uint64_t v55 = v30;
            uint64_t v56 = v32;
            id v53 = v20;
            v54 = v12;
            [(DRDragSessionManager *)v43 _getTransformForLayerContext:v33 completion:v51];
          }
        }

        long long v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v16);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D4EC;
  block[3] = &unk_1000562A0;
  id v45 = v42;
  id v46 = v41;
  id v47 = v39;
  id v48 = v40;
  id v49 = v14;
  id v50 = v43;
  id v34 = v14;
  id v35 = v40;
  id v36 = v39;
  id v37 = v41;
  id v38 = v42;
  dispatch_group_notify(v12, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)dragSession:(id)a3 invalidateImageForClient:(id)a4 itemIndex:(unint64_t)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002D700;
  v9[3] = &unk_100055700;
  v9[4] = self;
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = a5;
  id v7 = v11;
  id v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)dragSession:(id)a3 addedItemCount:(unint64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D84C;
  block[3] = &unk_1000554E8;
  void block[4] = self;
  id v7 = a3;
  unint64_t v8 = a4;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)dragSession:(id)a3 updatedPotentialDrop:(id)a4 forDestinationClient:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002DABC;
  v13[3] = &unk_100056208;
  v13[4] = self;
  id v14 = v8;
  id v15 = a5;
  id v16 = v9;
  id v10 = v9;
  id v11 = v15;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
}

- (void)resetDestinationClientForDragSession:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  _DWORD v4[2] = sub_10002DC08;
  v4[3] = &unk_100054C58;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (BOOL)destinationIsSystemConnection:(id)a3
{
  id v4 = a3;
  if ([(DRSystemConnection *)self->_systemConnection systemProcessIdentifier]
    && (unsigned int v5 = [v4 processIdentifier],
        v5 == [(DRSystemConnection *)self->_systemConnection systemProcessIdentifier]))
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    unsigned __int8 v6 = sub_100005F38(v4);
  }

  return v6;
}

- (BOOL)dragSession:(id)a3 destinationIsSystemConnection:(id)a4
{
  return [(DRDragSessionManager *)self destinationIsSystemConnection:a4];
}

- (void)dragSession:(id)a3 updateRoutingPolicy:(id)a4
{
  xpcQueue = self->_xpcQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(xpcQueue);
  [(DRTouchDetacher *)self->_touchDetacher updateRoutingPolicy:v7 forSession:v8];
}

- (void)dragSession:(id)a3 findVisibleDroppedItemsInSpaceOfLayerContext:(id)a4 replyingOnQueue:(id)a5 with:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002DF30;
  v17[3] = &unk_1000562F0;
  v17[4] = self;
  id v18 = v10;
  unsigned int v21 = [v10 identifier];
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  [(DRDragSessionManager *)self _getTransformForLayerContext:v13 completion:v17];
}

- (void)dragSession:(id)a3 removeVisibleDroppedItemsInSpaceOfLayerContext:(id)a4 replyingOnQueue:(id)a5 with:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002E290;
  v17[3] = &unk_1000562F0;
  v17[4] = self;
  id v18 = v10;
  unsigned int v21 = [v10 identifier];
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  [(DRDragSessionManager *)self _getTransformForLayerContext:v13 completion:v17];
}

- (void)dragSession:(id)a3 moveToLocation:(CAPoint3D)a4
{
  double z = a4.z;
  double y = a4.y;
  double x = a4.x;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E5CC;
  block[3] = &unk_100055840;
  void block[4] = self;
  id v9 = a3;
  double v10 = x;
  double v11 = y;
  double v12 = z;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)dragSession:(id)a3 animateOutVisibleItemsWithOperation:(unint64_t)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002E6FC;
  v6[3] = &unk_100056340;
  v6[4] = self;
  id v7 = a3;
  unsigned int v9 = [v7 identifier];
  unint64_t v8 = a4;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)dragSessionWillEnd:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E810;
  block[3] = &unk_100054DA8;
  void block[4] = self;
  id v5 = a3;
  unsigned int v6 = [v5 identifier];
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)dragSessionDidEnd:(id)a3
{
  id v4 = a3;
  [(DRDragSessionManager *)self _notifyListenersSessionDidEnd:v4];
  [(DRDragSessionManager *)self dragSession:v4 enableKeyboardIfNeeded:1];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E950;
  block[3] = &unk_100054DA8;
  void block[4] = self;
  id v7 = v4;
  unsigned int v8 = [v4 identifier];
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  [(DRDragSessionManager *)self xpcQueue_removeDragSession:v5];
}

- (void)dragSession:(id)a3 enableKeyboardIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcQueue);
  id v7 = DRLogTarget();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      NSUInteger v9 = [(NSHashTable *)self->_keyboardSessions count];
      unsigned int v10 = [(NSHashTable *)self->_keyboardSessions containsObject:v6];
      *(_DWORD *)id buf = 134218240;
      NSUInteger v25 = v9;
      __int16 v26 = 1024;
      unsigned int v27 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Drag session setting keyboard enabled, with %lu extant sessions, contained = %d", buf, 0x12u);
    }

    if ((id)[(NSHashTable *)self->_keyboardSessions count] == (id)1
      && [(NSHashTable *)self->_keyboardSessions containsObject:v6])
    {
      double v11 = DRLogTarget();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Keyboard arbiter enabling keyboard", buf, 2u);
      }

      keyboardArbiter = self->_keyboardArbiter;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10002ECCC;
      v22[3] = &unk_100054D20;
      id v23 = v6;
      [(DRKeyboardArbiter *)keyboardArbiter setKeyboardTotalDisable:0 withFence:0 completionHandler:v22];
    }
    [(NSHashTable *)self->_keyboardSessions removeObject:v6];
  }
  else
  {
    if (v8)
    {
      NSUInteger v13 = [(NSHashTable *)self->_keyboardSessions count];
      unsigned int v14 = [(NSHashTable *)self->_keyboardSessions containsObject:v6];
      *(_DWORD *)id buf = 134218240;
      NSUInteger v25 = v13;
      __int16 v26 = 1024;
      unsigned int v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Drag session setting keyboard disabled, with %lu extant sessions, contained = %d", buf, 0x12u);
    }

    if (![(NSHashTable *)self->_keyboardSessions count])
    {
      id v15 = DRLogTarget();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Keyboard arbiter disabling keyboard", buf, 2u);
      }

      id v16 = self->_keyboardArbiter;
      uint64_t v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      id v19 = sub_10002ED70;
      id v20 = &unk_100054D20;
      id v21 = v6;
      [(DRKeyboardArbiter *)v16 setKeyboardTotalDisable:1 withFence:0 completionHandler:&v17];
    }
    -[NSHashTable addObject:](self->_keyboardSessions, "addObject:", v6, v17, v18, v19, v20);
  }
}

- (BOOL)dragSession:(id)a3 destinationIsDragMonitorConnection:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if ([(DRDragMonitorConnection *)self->_ensembleConnection dragMonitorProcessIdentifier] == v4)BOOL v7 = 1; {
  else
  }
    BOOL v7 = [(DRDragSessionManager *)self dragSession:v6 destinationIsOnenessConnection:v4];

  return v7;
}

- (BOOL)dragSession:(id)a3 destinationIsOnenessConnection:(int)a4
{
  return [(DRDragMonitorConnection *)self->_onenessConnection dragMonitorProcessIdentifier] == a4;
}

- (void)touchTrackingWindow:(id)a3 touchesBegan:(id)a4
{
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10002F218;
  v45[3] = &unk_100056368;
  id v6 = a3;
  id v46 = v6;
  id v47 = self;
  uint64_t v32 = [(DRDragSessionManager *)self _filterTouchesForPointer:a4 performingBlockForPointerTouch:v45];
  -[DRDragSessionManager _forEachTouch:performBlockForSession:](self, "_forEachTouch:performBlockForSession:");
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v34 = self;
  BOOL v7 = [(DRDragSessionManager *)self delegate];
  BOOL v8 = [v7 allDisplayIdentifiers];

  id obj = v8;
  id v33 = [v8 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v33)
  {
    uint64_t v31 = *(void *)v42;
    double v9 = kSBSCGPointInvalid[0];
    double v10 = kSBSCGPointInvalid[1];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v42 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = v11;
        uint64_t v12 = *(void *)(*((void *)&v41 + 1) + 8 * v11);
        NSUInteger v13 = [(DRDragSessionManager *)v34 delegate];
        unsigned int v14 = [v13 contentWindowForHardwareDisplayIdentifier:v12];

        id v35 = [v14 rootViewController];
        id v15 = +[NSMutableSet set];
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v16 = v32;
        id v17 = [v16 countByEnumeratingWithState:&v37 objects:v48 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v38;
          do
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v38 != v19) {
                objc_enumerationMutation(v16);
              }
              id v21 = *(void **)(*((void *)&v37 + 1) + 8 * i);
              [v21 locationInView:v6];
              double v23 = v22;
              id v24 = [v6 screen];
              NSUInteger v25 = [v14 screen];
              double v26 = sub_100006044(v24, v25, v23);
              double v28 = v27;

              if (v26 != v9 || v28 != v10) {
                [v15 addObject:v21];
              }
            }
            id v18 = [v16 countByEnumeratingWithState:&v37 objects:v48 count:16];
          }
          while (v18);
        }

        if ([v15 count]
          && [(DRDragSessionManager *)v34 _addBeginningTouchesToExistingSessions:v15 viewController:v35 touchWindow:v6])
        {
          [v35 updateWithTouches:v15];
        }

        uint64_t v11 = v36 + 1;
      }
      while ((id)(v36 + 1) != v33);
      id v33 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v33);
  }
}

- (void)touchTrackingWindow:(id)a3 touchesMoved:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(DRDragSessionManager *)self delegate];
  double v9 = [v6 windowScene];
  double v10 = sub_100005F80(v9);
  uint64_t v11 = [v8 contentWindowForHardwareDisplayIdentifier:v10];

  [v11 rootViewController];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002F50C;
  v15[3] = &unk_1000563D0;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = self;
  id v18 = v6;
  id v12 = v6;
  id v13 = v16;
  unsigned int v14 = [(DRDragSessionManager *)self _filterTouchesForPointer:v7 performingBlockForPointerTouch:v15];

  [(DRDragSessionManager *)self _forEachTouch:v14 performBlockForSession:&stru_1000563F0];
  [v13 updateWithTouches:v14];
}

- (void)touchTrackingWindow:(id)a3 touchesEnded:(id)a4 pairedWithVelocities:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_10002FBE0;
  v73[3] = &unk_100056418;
  v73[4] = self;
  uint64_t v10 = [(DRDragSessionManager *)self _filterTouchesForPointer:a4 performingBlockForPointerTouch:v73];
  v51 = self;
  uint64_t v11 = [(DRDragSessionManager *)self delegate];
  id v12 = [v8 windowScene];
  id v13 = sub_100005F80(v12);
  unsigned int v14 = [v11 contentWindowForHardwareDisplayIdentifier:v13];

  id v52 = v14;
  id v50 = [v14 rootViewController];
  id v53 = (void *)v10;
  [v50 removeTouches:v10];
  id v61 = objc_opt_new();
  id v15 = objc_opt_new();
  id v49 = objc_opt_new();
  id v48 = objc_opt_new();
  [v8 bounds];
  CGFloat y = v91.origin.y;
  CGFloat x = v91.origin.x;
  CGFloat height = v91.size.height;
  CGFloat width = v91.size.width;
  CGRect v92 = CGRectInset(v91, 10.0, 10.0);
  CGFloat v16 = v92.origin.x;
  CGFloat v17 = v92.origin.y;
  CGFloat v18 = v92.size.width;
  CGFloat v19 = v92.size.height;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v20 = v9;
  id v21 = [v20 countByEnumeratingWithState:&v69 objects:v86 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v70;
    uint64_t v54 = *(void *)v70;
    id v55 = v20;
    do
    {
      id v24 = 0;
      id v56 = v22;
      do
      {
        if (*(void *)v70 != v23) {
          objc_enumerationMutation(v20);
        }
        NSUInteger v25 = *(void **)(*((void *)&v69 + 1) + 8 * (void)v24);
        double v26 = [v25 touch];
        double v27 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v26 _touchIdentifier]);
        [v26 locationInView:v8];
        double v29 = v28;
        double v31 = v30;
        long long v67 = 0u;
        long long v68 = 0u;
        if (v25)
        {
          [v25 velocity];
          double v32 = *((double *)&v67 + 1);
          double v33 = *(double *)&v67;
        }
        else
        {
          double v32 = 0.0;
          double v33 = 0.0;
        }
        v93.origin.CGFloat x = v16;
        v93.origin.CGFloat y = v17;
        v93.size.CGFloat width = v18;
        v93.size.CGFloat height = v19;
        v89.CGFloat x = v29;
        v89.CGFloat y = v31;
        BOOL v34 = CGRectContainsPoint(v93, v89);
        id v35 = v61;
        if (!v34)
        {
          double v36 = v31 + v32 * 0.5;
          double v37 = v29 + v33 * 0.5;
          v94.origin.CGFloat y = y;
          v94.origin.CGFloat x = x;
          v94.size.CGFloat height = height;
          v94.size.CGFloat width = width;
          v90.CGFloat x = v37;
          v90.CGFloat y = v36;
          BOOL v38 = CGRectContainsPoint(v94, v90);
          id v35 = v61;
          if (!v38)
          {
            long long v39 = DRLogTarget();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              v87.CGFloat x = v29;
              v87.CGFloat y = v31;
              long long v40 = NSStringFromCGPoint(v87);
              v88.CGFloat x = v37;
              v88.CGFloat y = v36;
              long long v41 = NSStringFromCGPoint(v88);
              v95.origin.CGFloat y = y;
              v95.origin.CGFloat x = x;
              v95.size.CGFloat height = height;
              v95.size.CGFloat width = width;
              long long v42 = NSStringFromCGRect(v95);
              *(_DWORD *)id buf = 138413570;
              id v75 = v40;
              __int16 v76 = 2048;
              uint64_t v77 = v67;
              id v22 = v56;
              __int16 v78 = 2048;
              uint64_t v79 = *((void *)&v67 + 1);
              __int16 v80 = 2048;
              uint64_t v81 = v68;
              __int16 v82 = 2112;
              id v83 = v41;
              __int16 v84 = 2112;
              __int16 v85 = v42;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Touch end is likely moving offscreen: location %@ velocity (%f, %f, %f) estimatedTo %@ bounds %@", buf, 0x3Eu);

              id v20 = v55;
              uint64_t v23 = v54;
            }
            id v35 = v15;
          }
        }
        [v35 addObject:v27];

        id v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      id v22 = [v20 countByEnumeratingWithState:&v69 objects:v86 count:16];
    }
    while (v22);
  }

  xpcQueue = v51->_xpcQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002FCE8;
  block[3] = &unk_100056440;
  void block[4] = v51;
  id v63 = v61;
  id v64 = v48;
  id v65 = v49;
  id v66 = v15;
  id v44 = v15;
  id v45 = v49;
  id v46 = v48;
  id v47 = v61;
  dispatch_async(xpcQueue, block);
}

- (void)touchTrackingWindow:(id)a3 touchesCancelled:(id)a4
{
  id v6 = a3;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10003031C;
  v34[3] = &unk_100056418;
  void v34[4] = self;
  id v7 = [(DRDragSessionManager *)self _filterTouchesForPointer:a4 performingBlockForPointerTouch:v34];
  double v26 = self;
  id v8 = [(DRDragSessionManager *)self delegate];
  id v9 = [v6 windowScene];
  uint64_t v10 = sub_100005F80(v9);
  uint64_t v11 = [v8 contentWindowForHardwareDisplayIdentifier:v10];

  NSUInteger v25 = v11;
  id v24 = [v11 rootViewController];
  [v24 removeTouches:v7];
  id v12 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v7;
  id v13 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(obj);
        }
        CGFloat v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        CGFloat v18 = DRLogTarget();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          [v17 locationInView:v6];
          CGFloat v19 = NSStringFromCGPoint(v40);
          [v6 bounds];
          id v20 = NSStringFromCGRect(v41);
          *(_DWORD *)id buf = 138412546;
          double v36 = v19;
          __int16 v37 = 2112;
          BOOL v38 = v20;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Touch cancelled: location %@ bounds %@", buf, 0x16u);
        }
        id v21 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v17 _touchIdentifier]);
        [v12 addObject:v21];
      }
      id v14 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v14);
  }

  xpcQueue = v26->_xpcQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030424;
  block[3] = &unk_100054C58;
  void block[4] = v26;
  id v29 = v12;
  id v23 = v12;
  dispatch_async(xpcQueue, block);
}

- (void)_cancelAllDragSessions
{
  xpcQueue = self->_xpcQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030660;
  block[3] = &unk_100054B58;
  void block[4] = self;
  dispatch_async(xpcQueue, block);
}

- (void)_forEachTouch:(id)a3 performBlockForSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [*(id *)(*((void *)&v20 + 1) + 8 * (void)v13) _touchIdentifier]);
          [v8 addObject:v14];

          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    uint64_t v15 = [(DRDragSessionManager *)self xpcQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100030934;
    block[3] = &unk_100055448;
    void block[4] = self;
    id v18 = v8;
    id v19 = v7;
    id v16 = v8;
    dispatch_async(v15, block);
  }
}

- (id)_filterTouchesForPointer:(id)a3 performingBlockForPointerTouch:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (sub_100006688())
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      id v10 = 0;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v13, "_isPointerTouch", (void)v18))
          {
            if (!v10) {
              id v10 = [v7 mutableCopy];
            }
            [v10 removeObject:v13];
            if (v6) {
              v6[2](v6, v13);
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }
    else
    {
      id v10 = 0;
    }

    if (v10) {
      uint64_t v15 = v10;
    }
    else {
      uint64_t v15 = v7;
    }
    id v16 = v15;
  }
  else
  {
    if (v5)
    {
      id v14 = v5;
    }
    else
    {
      id v14 = +[NSSet set];
    }
    id v16 = v14;
  }

  return v16;
}

- (BOOL)_addBeginningTouchesToExistingSessions:(id)a3 viewController:(id)a4 touchWindow:(id)a5
{
  id v8 = a3;
  id v28 = a4;
  id v9 = a5;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v8;
  id v10 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v10)
  {
    id v11 = v10;
    id v24 = self;
    NSUInteger v25 = v9;
    id v12 = 0;
    id v13 = 0;
    id v14 = 0;
    uint64_t v27 = *(void *)v35;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        CGFloat v17 = objc_msgSend(v28, "sessionViewModelForAddingTouch:", v16, v24);
        if (v17)
        {
          if (v13)
          {
            long long v18 = v12;
            long long v19 = v14;
          }
          else
          {
            id v13 = (id)objc_opt_new();
            long long v19 = objc_opt_new();

            long long v18 = +[NSMutableIndexSet indexSet];
          }
          long long v20 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v28 sessionIDForViewModel:v17]);
          long long v21 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v16 _touchIdentifier]);
          [v13 setObject:v21 forKey:v20];

          id v14 = v19;
          [v19 setObject:v17 forKey:v20];
          objc_msgSend(v18, "addIndex:", objc_msgSend(v20, "unsignedIntegerValue"));

          id v12 = v18;
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v11);
    if (v12)
    {
      xpcQueue = v24->_xpcQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100030FC0;
      block[3] = &unk_100056440;
      void block[4] = v24;
      id v30 = v12;
      id v14 = v14;
      id v31 = v14;
      id v13 = v13;
      id v32 = v13;
      id v9 = v25;
      id v33 = v25;
      id v12 = v12;
      dispatch_sync(xpcQueue, block);

      LOBYTE(v12) = 1;
    }
    else
    {
      id v9 = v25;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
    id v14 = 0;
    id v13 = 0;
  }

  return (char)v12;
}

- (void)_getTransformForLayerContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 systemShellHostingSpaceIdentifier];

  if (v8)
  {
    id v9 = [(DRDragSessionManager *)self delegate];
    id v10 = [v6 systemShellHostingSpaceIdentifier];
    id v8 = [v9 hardwareDisplayIdentifierMatchingSystemShellHostingSpaceIdentifier:v10];

    if (!v8)
    {
      id v11 = DRLogTarget();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10003426C(v6, v11);
      }

      id v8 = 0;
    }
  }
  -[DRDragSessionManager _getTransformForContextID:layerRenderID:displayID:allowingEmptyLayerID:completion:](self, "_getTransformForContextID:layerRenderID:displayID:allowingEmptyLayerID:completion:", [v6 contextID], objc_msgSend(v6, "renderID"), v8, 0, v7);
}

- (void)_getTransformForContextID:(unsigned int)a3 layerRenderID:(unint64_t)a4 displayID:(id)a5 completion:(id)a6
{
}

- (void)_getTransformForContextID:(unsigned int)a3 layerRenderID:(unint64_t)a4 displayID:(id)a5 allowingEmptyLayerID:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a7;
  if (v13)
  {
    if ([v12 isEqualToString:off_100063878])
    {

      id v12 = 0;
    }
    if (a4) {
      int v14 = 1;
    }
    else {
      int v14 = v8;
    }
    if (a3 && v14)
    {
      transformUpdateQueue = self->_transformUpdateQueue;
      if (!transformUpdateQueue)
      {
        id v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        CGFloat v17 = (OS_dispatch_queue *)BSDispatchQueueCreateWithFixedPriority();
        long long v18 = self->_transformUpdateQueue;
        self->_transformUpdateQueue = v17;

        transformUpdateQueue = self->_transformUpdateQueue;
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100031658;
      block[3] = &unk_100056490;
      long long v19 = &v23;
      id v23 = v12;
      unint64_t v25 = a4;
      unsigned int v26 = a3;
      id v24 = v13;
      dispatch_async(transformUpdateQueue, block);
    }
    else
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100031840;
      v20[3] = &unk_100054B80;
      long long v19 = &v21;
      id v21 = v13;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v20);
    }
  }
}

- (DRDragSessionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DRDragSessionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)dragSessions
{
  return self->_dragSessions;
}

- (unsigned)lastSessionIdentifier
{
  return self->_lastSessionIdentifier;
}

- (NSHashTable)keyboardSessions
{
  return self->_keyboardSessions;
}

- (OS_dispatch_queue)xpcQueue
{
  return self->_xpcQueue;
}

- (NSXPCListener)sourceListener
{
  return self->_sourceListener;
}

- (NSXPCListener)destinationListener
{
  return self->_destinationListener;
}

- (DRSystemConnection)systemConnection
{
  return self->_systemConnection;
}

- (DRKeyboardArbiter)keyboardArbiter
{
  return self->_keyboardArbiter;
}

- (DRLockObserver)lockObserver
{
  return self->_lockObserver;
}

- (_TtC5druid15DRTouchDetacher)touchDetacher
{
  return self->_touchDetacher;
}

- (NSMutableDictionary)touchStreamsByDisplayIdentifier
{
  return self->_touchStreamsByDisplayIdentifier;
}

- (DRDragMonitorConnection)ensembleConnection
{
  return self->_ensembleConnection;
}

- (DRDragMonitorConnection)onenessConnection
{
  return self->_onenessConnection;
}

- (DRDispatchTimer)pointerWatchdogTimer
{
  return self->_pointerWatchdogTimer;
}

- (NSMutableDictionary)pointerServiceAssertionsByDisplayIdentifier
{
  return self->_pointerServiceAssertionsByDisplayIdentifier;
}

- (OS_dispatch_queue)transformUpdateQueue
{
  return self->_transformUpdateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformUpdateQueue, 0);
  objc_storeStrong((id *)&self->_pointerServiceAssertionsByDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_pointerWatchdogTimer, 0);
  objc_storeStrong((id *)&self->_onenessConnection, 0);
  objc_storeStrong((id *)&self->_ensembleConnection, 0);
  objc_storeStrong((id *)&self->_touchStreamsByDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_touchDetacher, 0);
  objc_storeStrong((id *)&self->_lockObserver, 0);
  objc_storeStrong((id *)&self->_keyboardArbiter, 0);
  objc_storeStrong((id *)&self->_systemConnection, 0);
  objc_storeStrong((id *)&self->_destinationListener, 0);
  objc_storeStrong((id *)&self->_sourceListener, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_keyboardSessions, 0);
  objc_storeStrong((id *)&self->_dragSessions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end