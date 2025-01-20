@interface NMCRoutePlanningController
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (GEOCompanionRouteContext)companionRouteContext;
- (NMCRoutePlanningController)init;
- (id)_messageForNoRoutesWithError:(id)a3 routeContextData:(id)a4;
- (id)_messageForRouteDetailsData:(id)a3 index:(unint64_t)a4 count:(unint64_t)a5 routeContextData:(id)a6;
- (id)_replyForMessage:(id)a3 withSafetyWarning:(int64_t)a4 error:(id)a5;
- (id)companionRouteAtIndex:(unint64_t)a3;
- (id)companionRouteWithRouteID:(id)a3;
- (id)startNavigationDetailsForRouteID:(id)a3;
- (unint64_t)selectedRouteIndex;
- (void)_checkinForRoutePlanningWithConnection:(id)a3;
- (void)_clearLocally;
- (void)_clearPreviewRoutesIfNeeded;
- (void)_enumerateMapsConnectionsUnderAssertionNamed:(id)a3 usingBlock:(id)a4;
- (void)_forgetConnection:(id)a3 reason:(id)a4;
- (void)_handleIncomingMessage:(id)a3;
- (void)_handlePreviewNavMessage:(id)a3;
- (void)_notifyMapsRoutePlanningSessionDidFail:(id)a3;
- (void)_notifyMapsRoutePlanningSessionDidInvalidate:(id)a3;
- (void)_notifyMapsRoutePlanningSessionDidSelectRoute:(id)a3;
- (void)_notifyMapsRoutePlanningSessionDidStartLoading:(id)a3;
- (void)_notifyMapsRoutePlanningSessionDidUpdateResponse:(id)a3;
- (void)_notifyNanoMapsRoutePlanningSession:(id)a3 didReceiveRouteUpdatesForRoutes:(id)a4;
- (void)_notifyNanoMapsRoutePlanningSessionDidFail:(id)a3;
- (void)_notifyNanoMapsRoutePlanningSessionDidInvalidate:(id)a3;
- (void)_notifyNanoMapsRoutePlanningSessionDidSelectRoute:(id)a3;
- (void)_notifyNanoMapsRoutePlanningSessionDidStartLoading:(id)a3;
- (void)_notifyNanoMapsRoutePlanningSessionDidUpdateResponse:(id)a3 changedRouteIdentifiers:(id)a4;
- (void)_prepareTransitRouteUpdaterIfNeeded;
- (void)_registerIDSMessageObservers;
- (void)_registerXPCRoutes;
- (void)_sendClearPreviewWithContext:(id)a3;
- (void)_sendPreviewRoutes:(id)a3 atIndexes:(id)a4 error:(id)a5 companionRouteContext:(id)a6 includeSyntheticRoute:(BOOL)a7;
- (void)_sendPreviewRoutesIfAvailable;
- (void)_sendRouteUpdates:(id)a3 context:(id)a4;
- (void)_sendSelectedPreviewRouteIndex:(unint64_t)a3 context:(id)a4;
- (void)_setCurrentSessionInputOrigin:(unint64_t)a3;
- (void)_updateRoutePlanningRequest:(id)a3 withResponse:(id)a4 completionHandler:(id)a5;
- (void)anticipateRoutePlanningRequest:(id)a3 completionHandler:(id)a4;
- (void)checkinForRoutePlanning;
- (void)clearLocally;
- (void)clearPreviewRoutesIfNeeded;
- (void)clearRoutePlanningWithContext:(id)a3 completionHandler:(id)a4;
- (void)failRoutePlanningRequest:(id)a3 withResponse:(id)a4 completionHandler:(id)a5;
- (void)mapsApplicationStateDidChange:(id)a3;
- (void)routePlanningSession:(id)a3 didFailWithResponse:(id)a4;
- (void)routePlanningSession:(id)a3 didStartLoadingWithRequest:(id)a4;
- (void)routePlanningSession:(id)a3 didUpdateWithResponse:(id)a4;
- (void)routePlanningSessionDidInvalidate:(id)a3;
- (void)sendPreviewRoutesIfAvailable;
- (void)transitRouteUpdater:(id)a3 didUpdateTransitRoutes:(id)a4;
- (void)updateRoutePlanningRequest:(id)a3 withResponse:(id)a4 completionHandler:(id)a5;
- (void)updateRoutePlanningRequest:(id)a3 withSelectedRouteID:(id)a4 completionHandler:(id)a5;
@end

@implementation NMCRoutePlanningController

- (NMCRoutePlanningController)init
{
  v8.receiver = self;
  v8.super_class = (Class)NMCRoutePlanningController;
  v2 = [(NMCRoutePlanningController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_currentSessionInputOrigin = 3;
    v4 = +[NMCGizmoConnection sharedInstance];
    unsigned int v5 = [v4 supportsXPCUseMapsForRoutePlanning];

    if (v5) {
      +[NanoRoutePlanningSession setDefaultClass:objc_opt_class() forSessionState:3];
    }
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v3 selector:"mapsApplicationStateDidChange:" name:off_10009AC98 object:0];

    [(NMCRoutePlanningController *)v3 _registerXPCRoutes];
    [(NMCRoutePlanningController *)v3 _registerIDSMessageObservers];
  }
  return v3;
}

- (GEOCompanionRouteContext)companionRouteContext
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_10001F4F8;
  v11 = sub_10001F508;
  id v12 = 0;
  isolationQueue = self->_isolationQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001F510;
  v6[3] = &unk_1000816F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(isolationQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (GEOCompanionRouteContext *)v4;
}

- (unint64_t)selectedRouteIndex
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001F634;
  v5[3] = &unk_100081CF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)companionRouteAtIndex:(unint64_t)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = sub_10001F4F8;
    v13 = sub_10001F508;
    id v14 = 0;
    isolationQueue = self->_isolationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001F7DC;
    block[3] = &unk_100081D20;
    block[4] = self;
    block[5] = &v9;
    block[6] = a3;
    dispatch_sync(isolationQueue, block);
    id v5 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }

  return v5;
}

- (id)companionRouteWithRouteID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  if (v4)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = sub_10001F4F8;
    v15 = sub_10001F508;
    id v16 = 0;
    isolationQueue = self->_isolationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001F9C4;
    block[3] = &unk_100081D48;
    block[4] = self;
    id v9 = v4;
    v10 = &v11;
    dispatch_sync(isolationQueue, block);
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)startNavigationDetailsForRouteID:(id)a3
{
  id v4 = (__CFString *)a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_10001F4F8;
  v40 = sub_10001F508;
  id v41 = 0;
  if (v4)
  {
    id v5 = +[NSUUID _maps_UUIDWithData:v4];
    if (v5)
    {
      isolationQueue = self->_isolationQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100020108;
      block[3] = &unk_1000816F0;
      block[4] = self;
      void block[5] = &v36;
      dispatch_sync(isolationQueue, block);
      goto LABEL_5;
    }
    v26 = sub_100053DCC();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v4;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Asked for start navigation details, but route ID is malformed (%@)", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = self->_isolationQueue;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100020158;
    v34[3] = &unk_1000816F0;
    v34[4] = self;
    v34[5] = &v36;
    dispatch_sync(v7, v34);
    id v5 = [(id)v37[5] selectedRouteID];
    if (v5)
    {
LABEL_5:
      uint64_t v8 = [(id)v37[5] routes];
      v29 = _NSConcreteStackBlock;
      uint64_t v30 = 3221225472;
      v31 = sub_1000201A8;
      v32 = &unk_100081D70;
      id v9 = v5;
      v33 = v9;
      v10 = (__CFString *)[v8 indexOfObjectPassingTest:&v29];
      if (v10 >= objc_msgSend(v8, "count", v29, v30, v31, v32))
      {
        id v12 = 0;
      }
      else
      {
        uint64_t v11 = [v8 objectAtIndexedSubscript:v10];
        id v12 = (void *)v11;
        if (v10 != (__CFString *)0x7FFFFFFFFFFFFFFFLL && v11)
        {
          uint64_t v13 = sub_100053DCC();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v9;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Generating start navigation details for route ID %@", buf, 0xCu);
          }

          id v14 = objc_alloc_init((Class)MNStartNavigationDetails);
          if ([v12 transportType] == 1) {
            uint64_t v15 = 2;
          }
          else {
            uint64_t v15 = 3;
          }
          [v14 setNavigationType:v15];
          [v14 setGuidanceType:0];
          v42 = v12;
          id v16 = +[NSArray arrayWithObjects:&v42 count:1];
          [v14 setRoutes:v16];

          [v14 setSelectedRouteIndex:0];
          v17 = [v12 routeAttributes];
          [v14 setRouteAttributes:v17];

          int BOOL = GEOConfigGetBOOL();
          v19 = +[GEOPlatform sharedPlatform];
          unsigned int v20 = [v19 isInternalInstall];

          if (v20)
          {
            if (GEOConfigGetBOOL())
            {
              [v14 setSimulationType:GEOConfigGetInteger()];
              if ([v14 simulationType] == (id)-1) {
                int BOOL = 1;
              }
            }
            v21 = sub_100053DCC();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              v22 = @"NO";
              if (BOOL) {
                v22 = @"YES";
              }
              v23 = v22;
              unsigned int v24 = [v14 simulationType];
              *(_DWORD *)buf = 138412546;
              v44 = v23;
              __int16 v45 = 1024;
              LODWORD(v46) = v24;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Internal only: shouldRecordTrace: %@, simulationType: %d", buf, 0x12u);
            }
            if ((BOOL & 1) == 0) {
              goto LABEL_28;
            }
          }
          else if (!BOOL)
          {
            goto LABEL_28;
          }
          v25 = [(id)v37[5] traceRecordingData];
          [v14 setTraceRecordingData:v25];
LABEL_27:

LABEL_28:
          goto LABEL_36;
        }
      }
      v25 = sub_100053DCC();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v44 = v10;
        __int16 v45 = 2112;
        v46 = v9;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Asked for start navigation details, but route not found (index: %lu, routeID: %@)", buf, 0x16u);
      }
      id v14 = 0;
      goto LABEL_27;
    }
    v27 = sub_100053DCC();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Asked for start navigation details, but there isn't a selected route to default to", buf, 2u);
    }
  }
  id v9 = 0;
  id v14 = 0;
LABEL_36:
  _Block_object_dispose(&v36, 8);

  return v14;
}

- (void)sendPreviewRoutesIfAvailable
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000202B4;
  v4[3] = &unk_100081658;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_sendPreviewRoutesIfAvailable
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  unint64_t v3 = [(NanoRoutePlanningSession *)self->_routePlanningSession response];
  id v4 = [v3 companionRoutes];

  id v5 = [(NanoRoutePlanningSession *)self->_routePlanningSession request];
  id v6 = [v5 companionRouteContext];
  id v7 = [v6 copy];

  uint64_t v8 = [(NanoRoutePlanningSession *)self->_routePlanningSession response];
  id v9 = [v8 selectedRouteID];

  if (v9)
  {
    v10 = [(NanoRoutePlanningSession *)self->_routePlanningSession response];
    uint64_t v11 = [v10 routeIDs];
    id v12 = [v11 indexOfObject:v9];
  }
  else
  {
    id v12 = 0;
  }
  if ([v4 count])
  {
    uint64_t v13 = sub_100053DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Connection needs sync: sending latest preview routes", v14, 2u);
    }

    [(NMCRoutePlanningController *)self _sendPreviewRoutes:v4 atIndexes:0 error:0 companionRouteContext:v7 includeSyntheticRoute:1];
    if (v12 && v12 != (id)0x7FFFFFFFFFFFFFFFLL) {
      [(NMCRoutePlanningController *)self _sendSelectedPreviewRouteIndex:v12 context:v7];
    }
  }
}

- (void)clearPreviewRoutesIfNeeded
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002052C;
  v4[3] = &unk_100081658;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_clearPreviewRoutesIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  unint64_t v3 = self->_routePlanningSession;
  if (v3)
  {
    id v4 = sub_100053DCC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [(NanoRoutePlanningSession *)v3 request];
      id v6 = [v5 companionRouteContext];
      id v7 = [v6 simpleDescription];
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Clearing existing route planning session (context: %@)", (uint8_t *)&v8, 0xCu);
    }
    [(NanoRoutePlanningSession *)v3 invalidate];
  }
}

- (void)clearLocally
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020728;
  v4[3] = &unk_100081658;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_clearLocally
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  int v8 = self->_routePlanningSession;
  snapshot = self->_snapshot;
  self->_snapshot = 0;

  routePlanningSession = self->_routePlanningSession;
  self->_routePlanningSession = 0;

  if (v8)
  {
    id v5 = [(NanoRoutePlanningSession *)v8 request];
    id v6 = [v5 companionRouteContext];
    lastInvalidatedCompanionRouteContext = self->_lastInvalidatedCompanionRouteContext;
    self->_lastInvalidatedCompanionRouteContext = v6;

    [(NanoRoutePlanningSession *)v8 unregisterObserver:self];
    [(NanoRoutePlanningSession *)v8 invalidate];
  }
}

- (void)mapsApplicationStateDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:BKSApplicationStateKey];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v7 = [v6 unsignedIntValue];
    int v8 = sub_100053DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      uint64_t v13 = "-[NMCRoutePlanningController mapsApplicationStateDidChange:]";
      __int16 v14 = 2048;
      uint64_t v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %lu", (uint8_t *)&v12, 0x16u);
    }

    unsigned __int8 v9 = (v7 == 0) | v7;
    if (v9) {
      [(NMCRoutePlanningController *)self clearPreviewRoutesIfNeeded];
    }
    [(GEOTransitRouteUpdater *)self->_transitRouteUpdater setActive:v9 & self->_sendAllUpdates];
  }
  else
  {
    v10 = sub_100053DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [v4 userInfo];
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unknown userInfo format: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)_prepareTransitRouteUpdaterIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100020D30;
  v30[3] = &unk_100080F10;
  v30[4] = self;
  unint64_t v3 = objc_retainBlock(v30);
  id v4 = self->_routePlanningSession;
  id v5 = [(NanoRoutePlanningSession *)v4 request];
  id v6 = v5;
  if (v5 && [v5 resolvedTransportType] == 1)
  {
    unsigned int v7 = [(NanoRoutePlanningSession *)v4 response];
    if ([v7 numberOfRoutes] && objc_msgSend(v7, "routeOrigin") == (id)1)
    {
      unsigned int v24 = v7;
      v25 = v4;
      int v8 = [v7 routes];
      id v9 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v8, "count"));
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v10 = v8;
      id v11 = [v10 countByEnumeratingWithState:&v26 objects:v33 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v27;
        double v14 = 0.0;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v27 != v13) {
              objc_enumerationMutation(v10);
            }
            id v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            v17 = [v16 transitRouteUpdateRequest];
            if (v17)
            {
              if (fabs(v14) < 0.000001)
              {
                [v16 transitUpdateInitialDelay];
                double v14 = v18;
              }
              [v9 addObject:v17];
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v26 objects:v33 count:16];
        }
        while (v12);
      }
      else
      {
        double v14 = 0.0;
      }

      if ([v9 count])
      {
        v19 = sub_100053DCC();
        unsigned int v7 = v24;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          id v20 = [v9 count];
          *(_DWORD *)buf = 134217984;
          id v32 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Starting transit route updater for %lu transit routes", buf, 0xCu);
        }

        if (!self->_transitRouteUpdater)
        {
          v21 = (GEOTransitRouteUpdater *)[objc_alloc((Class)GEOTransitRouteUpdater) initWithDelegate:self andInitialTTL:v14];
          transitRouteUpdater = self->_transitRouteUpdater;
          self->_transitRouteUpdater = v21;
        }
        id v4 = v25;
        BOOL v23 = self->_sendAllUpdates && !sub_100014C10();
        [(GEOTransitRouteUpdater *)self->_transitRouteUpdater setActive:v23];
        [(GEOTransitRouteUpdater *)self->_transitRouteUpdater setRequests:v9];
      }
      else
      {
        ((void (*)(void *))v3[2])(v3);
        unsigned int v7 = v24;
        id v4 = v25;
      }
    }
    else
    {
      ((void (*)(void *))v3[2])(v3);
    }
  }
  else
  {
    ((void (*)(void *))v3[2])(v3);
  }
}

- (void)transitRouteUpdater:(id)a3 didUpdateTransitRoutes:(id)a4
{
  id v5 = a4;
  isolationQueue = self->_isolationQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100020E60;
  v8[3] = &unk_100081738;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(isolationQueue, v8);
}

- (void)routePlanningSession:(id)a3 didStartLoadingWithRequest:(id)a4
{
  id v5 = a3;
  isolationQueue = self->_isolationQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100021214;
  v8[3] = &unk_100081738;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(isolationQueue, v8);
}

- (void)routePlanningSession:(id)a3 didUpdateWithResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021338;
  block[3] = &unk_100081D98;
  id v12 = v7;
  uint64_t v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(isolationQueue, block);
}

- (void)routePlanningSession:(id)a3 didFailWithResponse:(id)a4
{
  id v5 = a3;
  isolationQueue = self->_isolationQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000214F8;
  v8[3] = &unk_100081738;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(isolationQueue, v8);
}

- (void)routePlanningSessionDidInvalidate:(id)a3
{
  id v4 = a3;
  isolationQueue = self->_isolationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000215F0;
  v7[3] = &unk_100081738;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(isolationQueue, v7);
}

- (void)_setCurrentSessionInputOrigin:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (self->_currentSessionInputOrigin != a3)
  {
    id v5 = sub_100053DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = sub_100013EEC(a3);
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Switching current session input origin to %@", (uint8_t *)&v7, 0xCu);
    }
    self->_currentSessionInputOrigin = a3;
  }
}

- (void)_registerIDSMessageObservers
{
  unint64_t v3 = +[NMCGizmoConnection sharedInstance];
  id v4 = objc_alloc_init(NMMessageQueue);
  [(NMMessageQueue *)v4 setMaximumInFlightMessagesCount:GEOConfigGetUInteger()];
  [v3 setMessageQueue:v4 forType:307];
  [v3 setMessageQueue:v4 forType:308];
  [v3 setMessageQueue:v4 forType:312];
  [v3 setMessageQueue:v4 forType:309];
  [v3 setMessageQueue:v4 forType:305];
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100021984;
  v13[3] = &unk_100081DC0;
  objc_copyWeak(&v14, &location);
  v13[4] = self;
  id v5 = objc_retainBlock(v13);
  id v6 = sub_100053DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Will begin listening for incoming IDS messages", v12, 2u);
  }

  id v7 = [v3 addMessageObserverForType:304 callback:v5];
  id v8 = [v3 addMessageObserverForType:307 callback:v5];
  id v9 = [v3 addMessageObserverForType:305 callback:v5];
  id v10 = [v3 addMessageObserverForType:306 callback:v5];
  id v11 = [v3 addMessageObserverForType:309 callback:v5];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_handleIncomingMessage:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  switch([v4 type])
  {
    case 0x130u:
      [(NMCRoutePlanningController *)self _handlePreviewNavMessage:v4];
      goto LABEL_273;
    case 0x131u:
      id v5 = self->_routePlanningSession;
      id v6 = [(NanoRoutePlanningSession *)v5 request];
      id v7 = [v6 companionRouteContext];

      id v8 = [v4 argumentForTag:406];
      id v9 = [v8 dataValue];

      if (v9)
      {
        id v10 = [objc_alloc((Class)GEOCompanionRouteContext) initWithData:v9];
        id v11 = v10;
        if (v7 && [v10 isStaleComparedToContext:v7])
        {
          id v12 = sub_100053DCC();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
LABEL_167:

            goto LABEL_261;
          }
          id v13 = [v4 type];
          if ((int)v13 <= 199)
          {
            switch((int)v13)
            {
              case '2':
                id v14 = @"START_INITIAL_SYNC";
                break;
              case '3':
                id v14 = @"FETCH_CURRENT_COUNTRY_CODE";
                break;
              case '4':
                id v14 = @"FETCH_EXPERIMENTS_CONFIG";
                break;
              case '5':
                id v14 = @"DID_CHANGE_EXPERIMENTS_CONFIG";
                break;
              case '6':
                id v14 = @"SYNC_UP_NEXT_ITEMS";
                break;
              case '7':
                id v14 = @"REQUEST_UP_NEXT_ITEMS";
                break;
              case '8':
                id v14 = @"SYNC_CONFIG_STORE";
                break;
              case '9':
                id v14 = @"CHECKIN_WITH_CONFIG_STORE";
                break;
              case ':':
                id v14 = @"REQUEST_ANALYTIC_IDENTIFIERS";
                break;
              case ';':
                id v14 = @"CHECKIN_WITH_SUBSCRIPTION_INFO";
                break;
              case '<':
                id v14 = @"SYNC_SUBSCRIPTION_INFO";
                break;
              case '=':
                id v14 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
                break;
              case '>':
                goto LABEL_119;
              case '?':
                id v14 = @"UPDATE_SUBSCRIPTION_STATE";
                break;
              case '@':
                id v14 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
                break;
              case 'A':
                id v14 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
                break;
              case 'B':
                id v14 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
                break;
              case 'C':
                id v14 = @"SET_SUBSCRIPTION_SHOULD_SYNC";
                break;
              default:
                if (v13 <= 0xC7)
                {
                  id v14 = @"FETCH_TILES";
                  switch((int)v13)
                  {
                    case 1:
                      goto LABEL_166;
                    case 2:
                      id v14 = @"CANCEL_TILES";
                      goto LABEL_166;
                    case 3:
                      id v14 = @"REPORT_CORRUPT_TILE";
                      goto LABEL_166;
                    case 4:
                      id v14 = @"FETCHED_TILE";
                      goto LABEL_166;
                    default:
                      goto LABEL_274;
                  }
                }
                switch((int)v13)
                {
                  case 'd':
                    id v14 = @"CHECKIN_WITH_TILE_GROUP";
                    break;
                  case 'e':
                    id v14 = @"FORCE_UPDATE_MANIFEST";
                    break;
                  case 'f':
                    id v14 = @"DID_CHANGE_ACTIVE_TILE_GROUP";
                    break;
                  case 'g':
                    id v14 = @"FETCH_RESOURCE";
                    break;
                  default:
                    goto LABEL_119;
                }
                break;
            }
            goto LABEL_166;
          }
          if ((int)v13 <= 400)
          {
            switch((int)v13)
            {
              case 300:
                id v14 = @"UPDATE_NAV_ROUTE_DETAILS";
                break;
              case 301:
                id v14 = @"UPDATE_NAV_ROUTE_STATUS";
                break;
              case 302:
                id v14 = @"START_NAV";
                break;
              case 303:
                id v14 = @"STOP_NAV";
                break;
              case 304:
                id v14 = @"PREVIEW_NAV";
                break;
              case 305:
                id v14 = @"CLEAR_NAV_PREVIEW";
                break;
              case 306:
                id v14 = @"SET_WANTS_ALL_NAV_STATUS_UPDATES";
                break;
              case 307:
                id v14 = @"DISMISS_NAV_SAFETY_ALERT";
                break;
              case 308:
                id v14 = @"AVAILABLE_ROUTE";
                break;
              case 309:
                id v14 = @"SELECTED_ROUTE";
                break;
              case 310:
                id v14 = @"REQUEST_NAVIGATION_UPDATE";
                break;
              case 311:
                id v14 = @"UPDATE_NAV_ROUTE_UPDATE";
                break;
              case 312:
                id v14 = @"AVAILABLE_ROUTE_UPDATE";
                break;
              case 313:
                id v14 = @"PAUSE_NAV";
                break;
              case 314:
                id v14 = @"RESUME_NAV";
                break;
              case 315:
                id v14 = @"SET_DISPLAYED_STEP";
                break;
              default:
                switch((int)v13)
                {
                  case 200:
                    id v14 = @"START_LOCATION_UPDATE";
                    break;
                  case 201:
                    id v14 = @"STOP_LOCATION_UPDATE";
                    break;
                  case 202:
                    id v14 = @"UPDATED_LOCATION";
                    break;
                  case 203:
                    id v14 = @"FAILED_TO_UPDATE_LOCATION";
                    break;
                  case 204:
                    id v14 = @"DID_PAUSE_LOCATION_UPDATES";
                    break;
                  case 205:
                    id v14 = @"DID_RESUME_LOCATION_UPDATES";
                    break;
                  case 206:
                    id v14 = @"APPLY_LOCATION_AUTHORIZATION";
                    break;
                  default:
                    goto LABEL_119;
                }
                break;
            }
            goto LABEL_166;
          }
          if ((int)v13 > 599)
          {
            if ((int)v13 > 1499)
            {
              if (v13 == 1500)
              {
                id v14 = @"DEBUG_FETCH_CONFIGURATION_INFO";
                goto LABEL_166;
              }
              if (v13 == 1501)
              {
                id v14 = @"DEBUG_FETCH_DIAGNOSTICS_STRING";
                goto LABEL_166;
              }
            }
            else
            {
              if (v13 == 600)
              {
                id v14 = @"FETCH_ROUTE_GENIUS";
                goto LABEL_166;
              }
              if (v13 == 1000)
              {
                id v14 = @"PING";
                goto LABEL_166;
              }
            }
          }
          else if ((int)v13 > 500)
          {
            if (v13 == 501)
            {
              id v14 = @"PLACE_DATA_IDENTIFIER_LOOKUP";
              goto LABEL_166;
            }
            if (v13 == 502)
            {
              id v14 = @"SERVICE_REQUEST";
              goto LABEL_166;
            }
          }
          else
          {
            if (v13 == 401)
            {
              id v14 = @"OPEN_URL";
              goto LABEL_166;
            }
            if (v13 == 500)
            {
              id v14 = @"PLACE_DATA_MUID_LOOKUP";
LABEL_166:
              v35 = [v7 simpleDescription];
              uint64_t v36 = [v11 simpleDescription];
              *(_DWORD *)buf = 138412802;
              v49 = v14;
              __int16 v50 = 2112;
              v51 = v35;
              __int16 v52 = 2112;
              v53 = v36;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Ignoring %@ message; incoming route context is old (current:%@, incoming:%@)",
                buf,
                0x20u);

              goto LABEL_167;
            }
          }
LABEL_119:
          id v14 = +[NSString stringWithFormat:@"(unknown: %i)", v13];
          goto LABEL_166;
        }
        goto LABEL_265;
      }
      if (v7)
      {
        unsigned int v27 = [v7 origin];
        id v11 = sub_100053DCC();
        BOOL v28 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
        if (v27 == 2)
        {
          if (!v28)
          {
LABEL_261:

            goto LABEL_270;
          }
          long long v29 = [v7 simpleDescription];
          id v30 = [v4 type];
          if ((int)v30 <= 199)
          {
            switch((int)v30)
            {
              case '2':
                v31 = @"START_INITIAL_SYNC";
                break;
              case '3':
                v31 = @"FETCH_CURRENT_COUNTRY_CODE";
                break;
              case '4':
                v31 = @"FETCH_EXPERIMENTS_CONFIG";
                break;
              case '5':
                v31 = @"DID_CHANGE_EXPERIMENTS_CONFIG";
                break;
              case '6':
                v31 = @"SYNC_UP_NEXT_ITEMS";
                break;
              case '7':
                v31 = @"REQUEST_UP_NEXT_ITEMS";
                break;
              case '8':
                v31 = @"SYNC_CONFIG_STORE";
                break;
              case '9':
                v31 = @"CHECKIN_WITH_CONFIG_STORE";
                break;
              case ':':
                v31 = @"REQUEST_ANALYTIC_IDENTIFIERS";
                break;
              case ';':
                v31 = @"CHECKIN_WITH_SUBSCRIPTION_INFO";
                break;
              case '<':
                v31 = @"SYNC_SUBSCRIPTION_INFO";
                break;
              case '=':
                v31 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
                break;
              case '>':
                goto LABEL_168;
              case '?':
                v31 = @"UPDATE_SUBSCRIPTION_STATE";
                break;
              case '@':
                v31 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
                break;
              case 'A':
                v31 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
                break;
              case 'B':
                v31 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
                break;
              case 'C':
                v31 = @"SET_SUBSCRIPTION_SHOULD_SYNC";
                break;
              default:
                if (v30 <= 0xC7)
                {
                  v31 = @"FETCH_TILES";
                  switch((int)v30)
                  {
                    case 1:
                      goto LABEL_260;
                    case 2:
                      v31 = @"CANCEL_TILES";
                      goto LABEL_260;
                    case 3:
                      v31 = @"REPORT_CORRUPT_TILE";
                      goto LABEL_260;
                    case 4:
                      v31 = @"FETCHED_TILE";
                      goto LABEL_260;
                    default:
                      goto LABEL_274;
                  }
                }
                switch((int)v30)
                {
                  case 'd':
                    v31 = @"CHECKIN_WITH_TILE_GROUP";
                    break;
                  case 'e':
                    v31 = @"FORCE_UPDATE_MANIFEST";
                    break;
                  case 'f':
                    v31 = @"DID_CHANGE_ACTIVE_TILE_GROUP";
                    break;
                  case 'g':
                    v31 = @"FETCH_RESOURCE";
                    break;
                  default:
                    goto LABEL_168;
                }
                break;
            }
            goto LABEL_260;
          }
          if ((int)v30 <= 400)
          {
            switch((int)v30)
            {
              case 300:
                v31 = @"UPDATE_NAV_ROUTE_DETAILS";
                break;
              case 301:
                v31 = @"UPDATE_NAV_ROUTE_STATUS";
                break;
              case 302:
                v31 = @"START_NAV";
                break;
              case 303:
                v31 = @"STOP_NAV";
                break;
              case 304:
                v31 = @"PREVIEW_NAV";
                break;
              case 305:
                v31 = @"CLEAR_NAV_PREVIEW";
                break;
              case 306:
                v31 = @"SET_WANTS_ALL_NAV_STATUS_UPDATES";
                break;
              case 307:
                v31 = @"DISMISS_NAV_SAFETY_ALERT";
                break;
              case 308:
                v31 = @"AVAILABLE_ROUTE";
                break;
              case 309:
                v31 = @"SELECTED_ROUTE";
                break;
              case 310:
                v31 = @"REQUEST_NAVIGATION_UPDATE";
                break;
              case 311:
                v31 = @"UPDATE_NAV_ROUTE_UPDATE";
                break;
              case 312:
                v31 = @"AVAILABLE_ROUTE_UPDATE";
                break;
              case 313:
                v31 = @"PAUSE_NAV";
                break;
              case 314:
                v31 = @"RESUME_NAV";
                break;
              case 315:
                v31 = @"SET_DISPLAYED_STEP";
                break;
              default:
                switch((int)v30)
                {
                  case 200:
                    v31 = @"START_LOCATION_UPDATE";
                    break;
                  case 201:
                    v31 = @"STOP_LOCATION_UPDATE";
                    break;
                  case 202:
                    v31 = @"UPDATED_LOCATION";
                    break;
                  case 203:
                    v31 = @"FAILED_TO_UPDATE_LOCATION";
                    break;
                  case 204:
                    v31 = @"DID_PAUSE_LOCATION_UPDATES";
                    break;
                  case 205:
                    v31 = @"DID_RESUME_LOCATION_UPDATES";
                    break;
                  case 206:
                    v31 = @"APPLY_LOCATION_AUTHORIZATION";
                    break;
                  default:
                    goto LABEL_168;
                }
                break;
            }
            goto LABEL_260;
          }
          if ((int)v30 > 599)
          {
            if ((int)v30 > 1499)
            {
              if (v30 == 1500)
              {
                v31 = @"DEBUG_FETCH_CONFIGURATION_INFO";
                goto LABEL_260;
              }
              if (v30 == 1501)
              {
                v31 = @"DEBUG_FETCH_DIAGNOSTICS_STRING";
                goto LABEL_260;
              }
            }
            else
            {
              if (v30 == 600)
              {
                v31 = @"FETCH_ROUTE_GENIUS";
                goto LABEL_260;
              }
              if (v30 == 1000)
              {
                v31 = @"PING";
                goto LABEL_260;
              }
            }
          }
          else if ((int)v30 > 500)
          {
            if (v30 == 501)
            {
              v31 = @"PLACE_DATA_IDENTIFIER_LOOKUP";
              goto LABEL_260;
            }
            if (v30 == 502)
            {
              v31 = @"SERVICE_REQUEST";
              goto LABEL_260;
            }
          }
          else
          {
            if (v30 == 401)
            {
              v31 = @"OPEN_URL";
              goto LABEL_260;
            }
            if (v30 == 500)
            {
              v31 = @"PLACE_DATA_MUID_LOOKUP";
LABEL_260:
              *(_DWORD *)buf = 138412546;
              v49 = v29;
              __int16 v50 = 2112;
              v51 = v31;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Was told to clear nav preview without a context and our current context is from companion (%@); dropping (%@) message",
                buf,
                0x16u);

              goto LABEL_261;
            }
          }
LABEL_168:
          v31 = +[NSString stringWithFormat:@"(unknown: %i)", v30];
          goto LABEL_260;
        }
        if (!v28)
        {
LABEL_265:

          goto LABEL_266;
        }
        id v32 = [v7 simpleDescription];
        id v33 = [v4 type];
        if ((int)v33 <= 199)
        {
          switch((int)v33)
          {
            case '2':
              v34 = @"START_INITIAL_SYNC";
              break;
            case '3':
              v34 = @"FETCH_CURRENT_COUNTRY_CODE";
              break;
            case '4':
              v34 = @"FETCH_EXPERIMENTS_CONFIG";
              break;
            case '5':
              v34 = @"DID_CHANGE_EXPERIMENTS_CONFIG";
              break;
            case '6':
              v34 = @"SYNC_UP_NEXT_ITEMS";
              break;
            case '7':
              v34 = @"REQUEST_UP_NEXT_ITEMS";
              break;
            case '8':
              v34 = @"SYNC_CONFIG_STORE";
              break;
            case '9':
              v34 = @"CHECKIN_WITH_CONFIG_STORE";
              break;
            case ':':
              v34 = @"REQUEST_ANALYTIC_IDENTIFIERS";
              break;
            case ';':
              v34 = @"CHECKIN_WITH_SUBSCRIPTION_INFO";
              break;
            case '<':
              v34 = @"SYNC_SUBSCRIPTION_INFO";
              break;
            case '=':
              v34 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
              break;
            case '>':
              goto LABEL_169;
            case '?':
              v34 = @"UPDATE_SUBSCRIPTION_STATE";
              break;
            case '@':
              v34 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
              break;
            case 'A':
              v34 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
              break;
            case 'B':
              v34 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
              break;
            case 'C':
              v34 = @"SET_SUBSCRIPTION_SHOULD_SYNC";
              break;
            default:
              if (v33 > 0xC7)
              {
                switch((int)v33)
                {
                  case 'd':
                    v34 = @"CHECKIN_WITH_TILE_GROUP";
                    break;
                  case 'e':
                    v34 = @"FORCE_UPDATE_MANIFEST";
                    break;
                  case 'f':
                    v34 = @"DID_CHANGE_ACTIVE_TILE_GROUP";
                    break;
                  case 'g':
                    v34 = @"FETCH_RESOURCE";
                    break;
                  default:
                    goto LABEL_169;
                }
              }
              else
              {
                v34 = @"FETCH_TILES";
                switch((int)v33)
                {
                  case 1:
                    goto LABEL_264;
                  case 2:
                    v34 = @"CANCEL_TILES";
                    break;
                  case 3:
                    v34 = @"REPORT_CORRUPT_TILE";
                    break;
                  case 4:
                    v34 = @"FETCHED_TILE";
                    break;
                  default:
LABEL_274:
                    JUMPOUT(0);
                }
              }
              return;
          }
          goto LABEL_264;
        }
        if ((int)v33 <= 400)
        {
          switch((int)v33)
          {
            case 300:
              v34 = @"UPDATE_NAV_ROUTE_DETAILS";
              break;
            case 301:
              v34 = @"UPDATE_NAV_ROUTE_STATUS";
              break;
            case 302:
              v34 = @"START_NAV";
              break;
            case 303:
              v34 = @"STOP_NAV";
              break;
            case 304:
              v34 = @"PREVIEW_NAV";
              break;
            case 305:
              v34 = @"CLEAR_NAV_PREVIEW";
              break;
            case 306:
              v34 = @"SET_WANTS_ALL_NAV_STATUS_UPDATES";
              break;
            case 307:
              v34 = @"DISMISS_NAV_SAFETY_ALERT";
              break;
            case 308:
              v34 = @"AVAILABLE_ROUTE";
              break;
            case 309:
              v34 = @"SELECTED_ROUTE";
              break;
            case 310:
              v34 = @"REQUEST_NAVIGATION_UPDATE";
              break;
            case 311:
              v34 = @"UPDATE_NAV_ROUTE_UPDATE";
              break;
            case 312:
              v34 = @"AVAILABLE_ROUTE_UPDATE";
              break;
            case 313:
              v34 = @"PAUSE_NAV";
              break;
            case 314:
              v34 = @"RESUME_NAV";
              break;
            case 315:
              v34 = @"SET_DISPLAYED_STEP";
              break;
            default:
              switch((int)v33)
              {
                case 200:
                  v34 = @"START_LOCATION_UPDATE";
                  break;
                case 201:
                  v34 = @"STOP_LOCATION_UPDATE";
                  break;
                case 202:
                  v34 = @"UPDATED_LOCATION";
                  break;
                case 203:
                  v34 = @"FAILED_TO_UPDATE_LOCATION";
                  break;
                case 204:
                  v34 = @"DID_PAUSE_LOCATION_UPDATES";
                  break;
                case 205:
                  v34 = @"DID_RESUME_LOCATION_UPDATES";
                  break;
                case 206:
                  v34 = @"APPLY_LOCATION_AUTHORIZATION";
                  break;
                default:
                  goto LABEL_169;
              }
              break;
          }
          goto LABEL_264;
        }
        if ((int)v33 > 599)
        {
          if ((int)v33 > 1499)
          {
            if (v33 == 1500)
            {
              v34 = @"DEBUG_FETCH_CONFIGURATION_INFO";
              goto LABEL_264;
            }
            if (v33 == 1501)
            {
              v34 = @"DEBUG_FETCH_DIAGNOSTICS_STRING";
              goto LABEL_264;
            }
          }
          else
          {
            if (v33 == 600)
            {
              v34 = @"FETCH_ROUTE_GENIUS";
              goto LABEL_264;
            }
            if (v33 == 1000)
            {
              v34 = @"PING";
              goto LABEL_264;
            }
          }
        }
        else if ((int)v33 > 500)
        {
          if (v33 == 501)
          {
            v34 = @"PLACE_DATA_IDENTIFIER_LOOKUP";
            goto LABEL_264;
          }
          if (v33 == 502)
          {
            v34 = @"SERVICE_REQUEST";
            goto LABEL_264;
          }
        }
        else
        {
          if (v33 == 401)
          {
            v34 = @"OPEN_URL";
            goto LABEL_264;
          }
          if (v33 == 500)
          {
            v34 = @"PLACE_DATA_MUID_LOOKUP";
LABEL_264:
            *(_DWORD *)buf = 138412546;
            v49 = v32;
            __int16 v50 = 2112;
            v51 = v34;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Was told to clear nav preview without a context but our current context is from gizmo (%@); allowing (%@) "
              "message to be sent to Maps",
              buf,
              0x16u);

            goto LABEL_265;
          }
        }
LABEL_169:
        v34 = +[NSString stringWithFormat:@"(unknown: %i)", v33];
        goto LABEL_264;
      }
LABEL_266:
      snapshot = self->_snapshot;
      self->_snapshot = 0;

      routePlanningSession = self->_routePlanningSession;
      self->_routePlanningSession = 0;

      if (v5)
      {
        v39 = [(NanoRoutePlanningSession *)v5 request];
        v40 = [v39 companionRouteContext];
        lastInvalidatedCompanionRouteContext = self->_lastInvalidatedCompanionRouteContext;
        self->_lastInvalidatedCompanionRouteContext = v40;

        v42 = sub_100053DCC();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          v43 = [(GEOCompanionRouteContext *)self->_lastInvalidatedCompanionRouteContext simpleDescription];
          *(_DWORD *)buf = 138412290;
          v49 = v43;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Will clear route planning locally and notify Maps (context: %@)", buf, 0xCu);
        }
        [(NanoRoutePlanningSession *)v5 unregisterObserver:self];
        [(NanoRoutePlanningSession *)v5 invalidate];
        [(NMCRoutePlanningController *)self _notifyMapsRoutePlanningSessionDidInvalidate:v5];
      }
LABEL_270:

LABEL_271:
LABEL_272:

LABEL_273:
      return;
    case 0x132u:
      uint64_t v15 = [v4 argumentForTag:5];
      id v5 = v15;
      if (v15 && ([(NanoRoutePlanningSession *)v15 hasBoolValue] & 1) != 0)
      {
        self->_sendAllUpdates = [(NanoRoutePlanningSession *)v5 BOOLValue];
        id v16 = sub_100053DCC();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          if (self->_sendAllUpdates) {
            v17 = "YES";
          }
          else {
            v17 = "NO";
          }
          *(_DWORD *)buf = 136315138;
          v49 = (void *)v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Setting _sendAllUpdates to %s", buf, 0xCu);
        }

        if (self->_sendAllUpdates)
        {
          double v18 = self->_routePlanningSession;
          if (v18)
          {
            v19 = [(NanoRoutePlanningSession *)v18 response];
            id v20 = [v19 routeIDs];
            v44[0] = _NSConcreteStackBlock;
            v44[1] = 3221225472;
            v44[2] = sub_100022FE4;
            v44[3] = &unk_100081E10;
            id v21 = v19;
            id v45 = v21;
            v22 = sub_100029020(v20, v44);

            if ([v22 count])
            {
              BOOL v23 = [(NanoRoutePlanningSession *)self->_routePlanningSession request];
              unsigned int v24 = [v23 companionRouteContext];

              v25 = sub_100053DCC();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v49 = v24;
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Sending all received route updates in session (context: %@)", buf, 0xCu);
              }

              [(NMCRoutePlanningController *)self _sendRouteUpdates:v22 context:v24];
            }
          }
        }
        [(NMCRoutePlanningController *)self _prepareTransitRouteUpdaterIfNeeded];
        goto LABEL_272;
      }
      id v7 = sub_100053DCC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "SET_WANTS_ALL_NAV_STATUS_UPDATES message has no flag argument, ignoring", buf, 2u);
      }
      goto LABEL_271;
    case 0x133u:
      id v5 = +[MapsCompanionDaemonIPCInterface sharedInterface];
      if ([(NanoRoutePlanningSession *)v5 canReceiveMessages])
      {
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_100022FD4;
        v46[3] = &unk_100081DE8;
        v47 = v5;
        sub_100014714(@"com.apple.Maps.launchFromGizmo.DISMISS_NAV_SAFETY_ALERT", v46);

        goto LABEL_272;
      }
      id v7 = +[MSPMapsPaths mapsApplicationContainerPaths];
      +[NSNumber numberWithBool:1];
      long long v26 = [v7 homeDirectory];
      _CFPreferencesSetAppValueWithContainer();

      goto LABEL_271;
    case 0x135u:
      id v5 = objc_alloc_init(NMReply);
      id v7 = objc_alloc_init(NMArgument);
      [v7 setTag:1];
      [(NanoRoutePlanningSession *)v5 addArgument:v7];
      id v9 = +[NMCGizmoConnection sharedInstance];
      [v9 sendReply:v5 forMessage:v4 options:0];
      goto LABEL_270;
    default:
      goto LABEL_273;
  }
}

- (void)_handlePreviewNavMessage:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v5 = [v4 argumentForTag:417];
  id v6 = [v5 dataListValues];

  id v7 = [v6 lastObject];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = v7;
  }
  else
  {
    id v10 = [v4 argumentForTag:405];
    uint64_t v9 = [v10 dataValue];
  }
  uint64_t v11 = [v6 firstObject];
  if (v11)
  {
    uint64_t v12 = v11;
    BOOL v13 = v9 == 0;
  }
  else
  {
    id v16 = [v4 argumentForTag:404];
    uint64_t v12 = [v16 dataValue];

    BOOL v13 = v9 == 0;
    if (!(v12 | v9))
    {
      NSErrorUserInfoKey v80 = NSLocalizedDescriptionKey;
      NSErrorUserInfoKey v81 = NSLocalizedFailureReasonErrorKey;
      *(void *)buf = @"No destination was provided";
      *(void *)&buf[8] = @"No destination was provided";
      v17 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v80 count:2];
      uint64_t v12 = +[NSError errorWithDomain:@"com.apple.nanomapscd" code:3 userInfo:v17];

      id v14 = objc_alloc_init(NMReply);
      id v18 = [[NMArgument alloc] _nm_initWithErrorValue:v12 tag:3];
      [(NMReply *)v14 addArgument:v18];
      v19 = +[NMCGizmoConnection sharedInstance];
      [v19 sendReply:v14 forMessage:v4 options:0];
      goto LABEL_69;
    }
    if (!v12)
    {
      id v14 = 0;
      id v15 = 0;
      if (!v9) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  id v14 = (NMReply *)[objc_alloc((Class)GEOMapItemStorage) initWithData:v12];
  if (v13)
  {
    id v15 = 0;
    goto LABEL_13;
  }
LABEL_12:
  id v15 = [objc_alloc((Class)GEOMapItemStorage) initWithData:v9];
LABEL_13:
  id v77 = v15;
  if ([v6 count] || v14 || v15)
  {
    if ([v6 count])
    {
      uint64_t v75 = sub_100029020(v6, &stru_100081E50);
    }
    else
    {
      if (v14) {
        +[NanoDirectionWaypoint directionWaypointWithGEOMapItem:v14];
      }
      else {
      unsigned int v24 = +[NanoDirectionWaypoint directionWaypointForCurrentLocation:0];
      }
      if (v15) {
        +[NanoDirectionWaypoint directionWaypointWithGEOMapItem:v15];
      }
      else {
      v25 = +[NanoDirectionWaypoint directionWaypointForCurrentLocation:0];
      }
      v79[0] = v24;
      v79[1] = v25;
      uint64_t v75 = +[NSArray arrayWithObjects:v79 count:2];
    }
    long long v26 = [v4 argumentForTag:406];
    unsigned int v27 = [v26 dataValue];

    v70 = v27;
    if ([(NMReply *)v27 length]) {
      id v74 = [objc_alloc((Class)GEOCompanionRouteContext) initWithData:v27];
    }
    else {
      id v74 = 0;
    }
    BOOL v28 = [v4 argumentForTag:407];
    v73 = v28;
    if (v28)
    {
      [v28 doubleValue];
      v76 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      v76 = 0;
    }
    long long v29 = [v4 argumentForTag:408];
    v72 = v29;
    if (v29)
    {
      [v29 doubleValue];
      v71 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      v71 = 0;
    }
    id v30 = [v4 argumentForTag:413];
    uint64_t v31 = [v30 dataValue];

    if (v31) {
      id v68 = [objc_alloc((Class)GEOAutomobileOptions) initWithData:v31];
    }
    else {
      id v68 = 0;
    }
    id v32 = [v4 argumentForTag:414];
    uint64_t v33 = [v32 dataValue];

    v67 = (void *)v33;
    if (v33) {
      id v66 = [objc_alloc((Class)GEOTransitOptions) initWithData:v33];
    }
    else {
      id v66 = 0;
    }
    v34 = [v4 argumentForTag:415];
    v35 = [v34 dataValue];

    if (v35) {
      id v65 = [objc_alloc((Class)GEOWalkingOptions) initWithData:v35];
    }
    else {
      id v65 = 0;
    }
    uint64_t v36 = [v4 argumentForTag:416];
    v37 = [v36 dataValue];

    v69 = (void *)v31;
    if (v37) {
      id v64 = [objc_alloc((Class)GEOCyclingOptions) initWithData:v37];
    }
    else {
      id v64 = 0;
    }
    uint64_t v38 = [[NMCRPCGizmoPreviewState alloc] initWithMessage:v4];
    gizmoPreviewState = self->_gizmoPreviewState;
    self->_gizmoPreviewState = v38;

    v40 = [v4 argumentForTag:400];
    id v41 = [v40 intValue];

    uint64_t v63 = v9;
    switch((unint64_t)v41)
    {
      case 1uLL:
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        goto LABEL_51;
      case 2uLL:
        uint64_t v42 = 2;
        break;
      case 4uLL:
        uint64_t v42 = 1;
        break;
      case 8uLL:
        uint64_t v42 = 3;
        break;
      default:
        if (v41 == (id)0xFFFFFFF) {
          uint64_t v42 = 4;
        }
        else {
LABEL_51:
        }
          uint64_t v42 = 0;
        break;
    }
    v62 = v14;
    v43 = sub_100053DCC();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      v44 = *(&off_100081FA0 + v42);
      id v45 = [v74 simpleDescription];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v44;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v45;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Will preview directions (transportType:%@, context:%@)", buf, 0x16u);
    }
    routePlanningSession = self->_routePlanningSession;
    if (routePlanningSession)
    {
      v47 = [(NanoRoutePlanningSession *)routePlanningSession request];
      v48 = [v47 companionRouteContext];

      v49 = sub_100053DCC();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        __int16 v50 = [v48 simpleDescription];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v50;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "Invalidating existing route planning session (context, %@)", buf, 0xCu);
      }
      lastInvalidatedCompanionRouteContext = self->_lastInvalidatedCompanionRouteContext;
      self->_lastInvalidatedCompanionRouteContext = (GEOCompanionRouteContext *)v48;
      id v52 = v48;

      [(NanoRoutePlanningSession *)self->_routePlanningSession unregisterObserver:self];
      [(NanoRoutePlanningSession *)self->_routePlanningSession invalidate];
      snapshot = self->_snapshot;
      self->_snapshot = 0;

      v54 = self->_routePlanningSession;
      self->_routePlanningSession = 0;
    }
    v55 = +[GEOMapService sharedService];
    v56 = [v55 defaultTraits];
    id v22 = v74;
    v57 = +[NanoRoutePlanningRequest requestWithWaypoints:v75 viaTransportType:v42 traits:v56 companionRouteContext:v74];

    if (v76 || v71 || v68 || v66 || v65 || v64)
    {
      id v58 = [v57 mutableCopy];
      [v58 setDepartureDate:v76];
      [v58 setArrivalDate:v71];
      [v58 setAutomobileOptions:v68];
      [v58 setTransitOptions:v66];
      [v58 setWalkingOptions:v65];
      [v58 setCyclingOptions:v64];
      id v59 = [v58 copy];

      id v22 = v74;
      v57 = v59;
    }
    id v14 = v62;
    uint64_t v9 = v63;
    [(NMCRoutePlanningController *)self _setCurrentSessionInputOrigin:3];
    v60 = objc_alloc_init(NanoRoutePlanningSession);
    v61 = self->_routePlanningSession;
    self->_routePlanningSession = v60;

    [(NanoRoutePlanningSession *)self->_routePlanningSession setShouldBroadcast:1];
    [(NanoRoutePlanningSession *)self->_routePlanningSession registerObserver:self];
    [(NanoRoutePlanningSession *)self->_routePlanningSession processRequest:v57];

    v19 = (void *)v75;
    BOOL v23 = v73;
    id v21 = v70;
  }
  else
  {
    NSErrorUserInfoKey v80 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v81 = NSLocalizedFailureReasonErrorKey;
    *(void *)buf = @"The destination was invalid";
    *(void *)&buf[8] = @"The destination was invalid";
    id v20 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v80 count:2];
    v19 = +[NSError errorWithDomain:@"com.apple.nanomapscd" code:4 userInfo:v20];

    id v21 = objc_alloc_init(NMReply);
    id v22 = [[NMArgument alloc] _nm_initWithErrorValue:v19 tag:3];
    [(NMReply *)v21 addArgument:v22];
    BOOL v23 = +[NMCGizmoConnection sharedInstance];
    [v23 sendReply:v21 forMessage:v4 options:0];
  }

  id v18 = v77;
LABEL_69:
}

- (void)_notifyNanoMapsRoutePlanningSessionDidStartLoading:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v5 = [v4 request];
  id v6 = sub_100053DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 companionRouteContext];
    id v8 = [v7 simpleDescription];
    *(_DWORD *)buf = 138412290;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Notifying NanoMaps: session did start (context:%@)", buf, 0xCu);
  }
  uint64_t v9 = [v5 requestedCompanionRouteDetails];
  id v10 = (void *)v9;
  if (v9)
  {
    uint64_t v14 = v9;
    uint64_t v11 = +[NSArray arrayWithObjects:&v14 count:1];
    uint64_t v12 = [v4 request];
    BOOL v13 = [v12 companionRouteContext];
    [(NMCRoutePlanningController *)self _sendPreviewRoutes:v11 atIndexes:0 error:0 companionRouteContext:v13 includeSyntheticRoute:0];
  }
}

- (void)_notifyNanoMapsRoutePlanningSessionDidUpdateResponse:(id)a3 changedRouteIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v8 = sub_100053DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v6 request];
    id v10 = [v9 companionRouteContext];
    uint64_t v11 = [v10 simpleDescription];
    *(_DWORD *)buf = 138412290;
    id v33 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Notifying NanoMaps: did receive routes (context:%@)", buf, 0xCu);
  }
  gizmoPreviewState = self->_gizmoPreviewState;
  if (gizmoPreviewState)
  {
    BOOL v13 = [(NMCRPCGizmoPreviewState *)gizmoPreviewState message];
    uint64_t v14 = [(NMCRPCGizmoPreviewState *)self->_gizmoPreviewState hasShownNavModeAdvisory];
    id v15 = self->_gizmoPreviewState;
    self->_gizmoPreviewState = 0;

    id v16 = [v6 response];
    v17 = [v16 lastError];
    id v18 = [(NMCRoutePlanningController *)self _replyForMessage:v13 withSafetyWarning:v14 << 63 >> 63 error:v17];

    v19 = +[NMCGizmoConnection sharedInstance];
    [v19 sendReply:v18 forMessage:v13 options:0];
  }
  id v20 = [v6 response];
  id v21 = [v20 companionRoutes];

  if ([v21 count])
  {
    if (v7)
    {
      sub_100029020(v7, &stru_100081E90);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100023FA8;
      v30[3] = &unk_100081EB8;
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      id v31 = v22;
      BOOL v23 = [v21 indexesOfObjectsPassingTest:v30];
      id v24 = [v23 count];
      if (v24 == [v21 count])
      {

        BOOL v23 = 0;
      }
      else
      {
        v25 = sub_100053DCC();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          id v26 = [v23 count];
          id v27 = [v21 count];
          *(_DWORD *)buf = 134218240;
          id v33 = v26;
          __int16 v34 = 2048;
          id v35 = v27;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Filtered %lu to %lu companion routes to send", buf, 0x16u);
        }

        if (![v23 count])
        {
          long long v29 = sub_100053DCC();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "No routes to send after filtering, bailing", buf, 2u);
          }

          id v28 = v31;
          goto LABEL_15;
        }
      }
    }
    else
    {
      BOOL v23 = 0;
    }
    id v22 = [v6 request];
    id v28 = [v22 companionRouteContext];
    [(NMCRoutePlanningController *)self _sendPreviewRoutes:v21 atIndexes:v23 error:0 companionRouteContext:v28 includeSyntheticRoute:0];
LABEL_15:
  }
}

- (void)_notifyNanoMapsRoutePlanningSession:(id)a3 didReceiveRouteUpdatesForRoutes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  [v6 response];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000241CC;
  v16[3] = &unk_100081E10;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v17;
  uint64_t v9 = sub_100029020(v7, v16);
  id v10 = sub_100053DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = [v6 request];
    uint64_t v12 = [v11 companionRouteContext];
    BOOL v13 = [v12 simpleDescription];
    *(_DWORD *)buf = 138412546;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Notifying NanoMaps: did receive updates for routes: %@ (context:%@)", buf, 0x16u);
  }
  uint64_t v14 = [v6 request];
  id v15 = [v14 companionRouteContext];
  [(NMCRoutePlanningController *)self _sendRouteUpdates:v9 context:v15];
}

- (void)_notifyNanoMapsRoutePlanningSessionDidSelectRoute:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v5 = [v4 response];
  id v6 = [v5 routes];
  id v7 = [v4 selectedRoute];
  id v8 = [v6 indexOfObject:v7];

  uint64_t v9 = sub_100053DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [v4 request];
    uint64_t v11 = [v10 companionRouteContext];
    uint64_t v12 = [v11 simpleDescription];
    int v21 = 134218242;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Notifying NanoMaps: did select route (index:%lu, context:%@)", (uint8_t *)&v21, 0x16u);
  }
  BOOL v13 = +[NMCGizmoConnection sharedInstance];
  unsigned __int8 v14 = [v13 canSendMessageWithType:309];

  if (v14)
  {
    id v15 = [v4 request];
    id v16 = [v15 companionRouteContext];
    [(NMCRoutePlanningController *)self _sendSelectedPreviewRouteIndex:v8 context:v16];
  }
  else
  {
    id v17 = [v4 response];
    id v18 = [v17 companionRoutes];
    id v15 = [v18 objectAtIndexedSubscript:v8];

    id v16 = +[NMCNavigationProxy sharedInstance];
    id v19 = [v4 request];
    __int16 v20 = [v19 companionRouteContext];
    objc_msgSend(v16, "_legacy_sendPreviewRouteDetails:context:", v15, v20);
  }
}

- (void)_notifyNanoMapsRoutePlanningSessionDidFail:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v5 = sub_100053DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 response];
    id v7 = [v6 lastError];
    id v8 = [v4 request];
    uint64_t v9 = [v8 companionRouteContext];
    id v10 = [v9 simpleDescription];
    int v22 = 138412546;
    __int16 v23 = v7;
    __int16 v24 = 2112;
    v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Notifying NanoMaps: session failed with error: %@ (context:%@)", (uint8_t *)&v22, 0x16u);
  }
  gizmoPreviewState = self->_gizmoPreviewState;
  if (gizmoPreviewState)
  {
    uint64_t v12 = [(NMCRPCGizmoPreviewState *)gizmoPreviewState message];
    BOOL v13 = self->_gizmoPreviewState;
    self->_gizmoPreviewState = 0;

    unsigned __int8 v14 = [v4 response];
    id v15 = [v14 lastError];
    id v16 = [(NMCRoutePlanningController *)self _replyForMessage:v12 withSafetyWarning:-1 error:v15];

    id v17 = +[NMCGizmoConnection sharedInstance];
    [v17 sendReply:v16 forMessage:v12 options:0];
  }
  id v18 = [v4 response];
  id v19 = [v18 lastError];
  __int16 v20 = [v4 request];
  int v21 = [v20 companionRouteContext];
  [(NMCRoutePlanningController *)self _sendPreviewRoutes:0 atIndexes:0 error:v19 companionRouteContext:v21 includeSyntheticRoute:0];
}

- (void)_notifyNanoMapsRoutePlanningSessionDidInvalidate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v5 = sub_100053DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 request];
    id v7 = [v6 companionRouteContext];
    id v8 = [v7 simpleDescription];
    int v12 = 138412290;
    BOOL v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Notifying NanoMaps: session invalidated (context:%@)", (uint8_t *)&v12, 0xCu);
  }
  uint64_t v9 = [v4 request];
  id v10 = [v9 companionRouteContext];
  uint64_t v11 = [v10 data];
  [(NMCRoutePlanningController *)self _sendClearPreviewWithContext:v11];
}

- (void)_sendPreviewRoutes:(id)a3 atIndexes:(id)a4 error:(id)a5 companionRouteContext:(id)a6 includeSyntheticRoute:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v16 = +[NMCGizmoConnection sharedInstance];
  unsigned __int8 v17 = [v16 canSendMessageWithType:308];

  if ((v17 & 1) == 0)
  {
    int v21 = +[NMCNavigationProxy sharedInstance];
    int v22 = [v12 firstObject];
    objc_msgSend(v21, "_legacy_sendPreviewRouteDetails:context:", v22, v15);

    goto LABEL_26;
  }
  id v18 = +[NMCGizmoConnection sharedInstance];
  id v19 = [v12 firstObject];
  unsigned __int8 v20 = objc_msgSend(v18, "supportsTransportType:", objc_msgSend(v19, "transportType"));

  if (v20)
  {
    if (!v15) {
      goto LABEL_26;
    }
    goto LABEL_9;
  }
  __int16 v23 = sub_100053DCC();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Gizmo does not support transport type of first route, sending error instead", buf, 2u);
  }

  v62[0] = NSLocalizedDescriptionKey;
  v62[1] = NSLocalizedFailureReasonErrorKey;
  *(void *)buf = @"Transport type not supported";
  *(void *)&buf[8] = @"Transport type not supported";
  __int16 v24 = +[NSDictionary dictionaryWithObjects:buf forKeys:v62 count:2];
  uint64_t v25 = +[NSError errorWithDomain:@"com.apple.nanomapscd" code:7 userInfo:v24];

  id v14 = (id)v25;
  if (v15)
  {
LABEL_9:
    id v26 = +[NMCGizmoConnection sharedInstance];
    CFStringRef v60 = @"NMSendMessageOptionTimeout";
    v61 = &off_1000883A8;
    id v27 = +[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
    id v28 = [v15 data];
    [v26 cancelAllMessagesOfType:308];
    [v26 cancelAllMessagesOfType:312];
    if (v14)
    {
      long long v29 = sub_100053DCC();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Will send no-routes+error to gizmo", buf, 2u);
      }

      id v30 = [(NMCRoutePlanningController *)self _messageForNoRoutesWithError:v14 routeContextData:v28];
      [v26 sendMessage:v30 options:v27];
    }
    else
    {
      id v31 = [v12 count];
      id v32 = v31;
      if (v7)
      {
        id v48 = v31;
        v49 = v28;
        __int16 v50 = v27;
        id v33 = [v12 firstObject];
        __int16 v34 = sub_100053DCC();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          id v35 = [v33 composedOrigin];
          uint64_t v36 = [v33 composedDestination];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v33;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v35;
          __int16 v58 = 2112;
          id v59 = v36;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Will send synthetic route ahead of full routes: %@, origin: %@, destination: %@", buf, 0x20u);
        }
        v37 = [v33 waypoints];
        id v38 = [v33 transportType];
        v39 = v33;
        v47 = v33;
        id v40 = v38;
        id v41 = [v39 destinationName];
        uint64_t v42 = +[GEOCompanionRouteDetails syntheticRouteDetailsWithWaypoints:v37 transportType:v40 destinationName:v41];

        v43 = [v42 data];
        v44 = -[NMCRoutePlanningController _messageForRouteDetailsData:index:count:routeContextData:](self, "_messageForRouteDetailsData:index:count:routeContextData:", v43, 0, [v12 count], v49);

        [v44 setPriority:300];
        id v27 = v50;
        [v26 sendMessage:v44 options:v50];

        id v28 = v49;
        id v32 = v48;
      }
      id v45 = sub_100053DCC();
      BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG);
      if (v13)
      {
        if (v46)
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v13;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v32;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "Will send routes %@ to gizmo (out of all %lu)", buf, 0x16u);
        }
      }
      else
      {
        if (v46)
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v32;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "Will send %lu routes to gizmo", buf, 0xCu);
        }

        +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v32);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_100024DCC;
      v51[3] = &unk_100081EE0;
      v51[4] = self;
      id v56 = v32;
      id v52 = v28;
      id v13 = v13;
      id v53 = v13;
      id v54 = v26;
      id v55 = v27;
      [v12 enumerateObjectsAtIndexes:v13 options:0 usingBlock:v51];
    }
  }
LABEL_26:
}

- (void)_sendSelectedPreviewRouteIndex:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && v6)
  {
    BOOL v7 = objc_alloc_init(NMMessage);
    [(NMMessage *)v7 setType:309];
    id v8 = objc_alloc_init(NMArgument);
    [(NMArgument *)v8 setIntValue:a3];
    [(NMArgument *)v8 setTag:409];
    [(NMMessage *)v7 addArgument:v8];
    uint64_t v9 = objc_alloc_init(NMArgument);
    id v10 = [v6 data];
    [(NMArgument *)v9 setDataValue:v10];

    [(NMArgument *)v9 setTag:406];
    [(NMMessage *)v7 addArgument:v9];
    uint64_t v11 = +[NMCGizmoConnection sharedInstance];
    CFStringRef v13 = @"NMSendMessageOptionTimeout";
    id v14 = &off_1000883A8;
    id v12 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [v11 sendMessage:v7 options:v12];
  }
}

- (void)_sendRouteUpdates:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v5;
  id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = [objc_alloc((Class)GEOCompanionRouteUpdate) initWithTransitRouteUpdate:*(void *)(*((void *)&v19 + 1) + 8 * (void)v10)];
        id v12 = objc_alloc_init(NMMessage);
        [(NMMessage *)v12 setType:312];
        CFStringRef v13 = objc_alloc_init(NMArgument);
        [(NMArgument *)v13 setTag:412];
        id v14 = [v11 data];
        [(NMArgument *)v13 setDataValue:v14];

        [(NMMessage *)v12 addArgument:v13];
        id v15 = objc_alloc_init(NMArgument);
        [(NMArgument *)v15 setTag:406];
        id v16 = [v6 data];
        [(NMArgument *)v15 setDataValue:v16];

        [(NMMessage *)v12 addArgument:v15];
        unsigned __int8 v17 = +[NMCGizmoConnection sharedInstance];
        [v17 sendMessage:v12 options:0];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
}

- (void)_sendClearPreviewWithContext:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (v4)
  {
    id v5 = objc_alloc_init(NMMessage);
    [(NMMessage *)v5 setType:305];
    id v6 = objc_alloc_init(NMArgument);
    [(NMArgument *)v6 setDataValue:v4];
    [(NMArgument *)v6 setTag:406];
    [(NMMessage *)v5 addArgument:v6];
    id v7 = +[NMCGizmoConnection sharedInstance];
    CFStringRef v9 = @"NMSendMessageOptionTimeout";
    id v10 = &off_1000883A8;
    id v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [v7 sendMessage:v5 options:v8];
  }
}

- (id)_messageForRouteDetailsData:(id)a3 index:(unint64_t)a4 count:(unint64_t)a5 routeContextData:(id)a6
{
  id v9 = a6;
  id v10 = a3;
  id v11 = objc_alloc_init(NMMessage);
  [(NMMessage *)v11 setType:308];
  id v12 = objc_alloc_init(NMArgument);
  [(NMArgument *)v12 setDataValue:v10];

  [(NMArgument *)v12 setTag:401];
  [(NMMessage *)v11 addArgument:v12 withCompressionType:1];
  CFStringRef v13 = objc_alloc_init(NMArgument);
  [(NMArgument *)v13 setIntValue:a4];
  [(NMArgument *)v13 setTag:409];
  [(NMMessage *)v11 addArgument:v13];
  id v14 = objc_alloc_init(NMArgument);
  [(NMArgument *)v14 setIntValue:a5];
  [(NMArgument *)v14 setTag:410];
  [(NMMessage *)v11 addArgument:v14];
  id v15 = objc_alloc_init(NMArgument);
  [(NMArgument *)v15 setDataValue:v9];

  [(NMArgument *)v15 setTag:406];
  [(NMMessage *)v11 addArgument:v15];

  return v11;
}

- (id)_messageForNoRoutesWithError:(id)a3 routeContextData:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(NMMessage);
  [(NMMessage *)v7 setType:308];
  id v8 = objc_alloc_init(NMArgument);
  [(NMArgument *)v8 setTag:409];
  [(NMMessage *)v7 addArgument:v8];
  id v9 = [[NMArgument alloc] _nm_initWithErrorValue:v6 tag:3];

  [(NMMessage *)v7 addArgument:v9];
  id v10 = objc_alloc_init(NMArgument);
  [(NMArgument *)v10 setDataValue:v5];

  [(NMArgument *)v10 setTag:406];
  [(NMMessage *)v7 addArgument:v10];

  return v7;
}

- (id)_replyForMessage:(id)a3 withSafetyWarning:(int64_t)a4 error:(id)a5
{
  id v7 = a5;
  if (a3)
  {
    id v8 = a3;
    a3 = objc_alloc_init(NMReply);
    if (v7)
    {
      id v9 = [[NMArgument alloc] _nm_initWithErrorValue:v7 tag:3];
    }
    else
    {
      id v10 = objc_alloc_init(NMArgument);
      id v9 = v10;
      if (a4 == -1)
      {
        [(NMArgument *)v10 setTag:1];
      }
      else
      {
        [(NMArgument *)v10 setTag:403];
        [(NMArgument *)v9 setIntValue:a4];
      }
    }
    [a3 addArgument:v9];

    id v11 = +[NMCGizmoConnection sharedInstance];
    [v11 sendReply:a3 forMessage:v8 options:0];
  }

  return a3;
}

- (void)_registerXPCRoutes
{
  unint64_t v3 = +[NSMutableSet set];
  connections = self->_connections;
  self->_connections = v3;

  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Maps.NMCRoutePlanningController.XPC", v5);
  isolationQueue = self->_isolationQueue;
  self->_isolationQueue = v6;

  id v8 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.nanomaps.xpc.Routes"];
  listener = self->_listener;
  self->_listener = v8;

  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener _setQueue:self->_isolationQueue];
  id v10 = self->_listener;

  [(NSXPCListener *)v10 resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NanoCompanionXPCRouting];
  [v7 setExportedInterface:v8];

  [v7 setExportedObject:self];
  id v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NanoCompanionXPCRouting];
  [v7 setRemoteObjectInterface:v9];

  [v7 _setQueue:self->_isolationQueue];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100025A64;
  v17[3] = &unk_100081F08;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  [v7 setInvalidationHandler:v17];
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  CFStringRef v13 = sub_100025AD0;
  id v14 = &unk_100081F08;
  objc_copyWeak(&v15, &location);
  objc_copyWeak(&v16, &from);
  [v7 setInterruptionHandler:&v11];
  -[NSMutableSet addObject:](self->_connections, "addObject:", v7, v11, v12, v13, v14);
  [v7 resume];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

- (void)_forgetConnection:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (v6)
  {
    [(NSMutableSet *)self->_connections removeObject:v6];
    id v8 = sub_100053DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [(NSMutableSet *)self->_connections count];
      int v10 = 138412802;
      id v11 = v7;
      __int16 v12 = 2048;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ XPC connection (%lu remaining peers) %@", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (void)_enumerateMapsConnectionsUnderAssertionNamed:(id)a3 usingBlock:(id)a4
{
  isolationQueue = self->_isolationQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  id v9 = [(NSMutableSet *)self->_connections allObjects];
  sub_10001463C(v9, v8, v7);
}

- (void)checkinForRoutePlanning
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  unint64_t v3 = +[NSXPCConnection currentConnection];
  id v4 = sub_100053DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "checkinForRoutePlanning on connection %@", (uint8_t *)&v5, 0xCu);
  }

  [(NMCRoutePlanningController *)self _checkinForRoutePlanningWithConnection:v3];
}

- (void)anticipateRoutePlanningRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  isolationQueue = self->_isolationQueue;
  id v8 = a4;
  dispatch_assert_queue_V2(isolationQueue);
  id v9 = sub_100053DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = [v6 companionRouteContext];
    id v11 = [v10 simpleDescription];
    int v12 = 138412290;
    id v13 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Anticipate request with context: %@", (uint8_t *)&v12, 0xCu);
  }
  [(NMCRoutePlanningController *)self _updateRoutePlanningRequest:v6 withResponse:0 completionHandler:v8];
}

- (void)updateRoutePlanningRequest:(id)a3 withResponse:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  isolationQueue = self->_isolationQueue;
  id v10 = a5;
  id v11 = a4;
  dispatch_assert_queue_V2(isolationQueue);
  int v12 = sub_100053DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [v8 companionRouteContext];
    __int16 v14 = [v13 simpleDescription];
    int v15 = 138412290;
    id v16 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "updateRoutePlanningRequest:, Update request/response with context: %@", (uint8_t *)&v15, 0xCu);
  }
  [(NMCRoutePlanningController *)self _updateRoutePlanningRequest:v8 withResponse:v11 completionHandler:v10];
}

- (void)_updateRoutePlanningRequest:(id)a3 withResponse:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v11 = [v8 companionRouteContext];
  int v12 = self->_routePlanningSession;
  id v13 = [(NanoRoutePlanningSession *)v12 request];
  __int16 v14 = [v13 companionRouteContext];
  lastInvalidatedCompanionRouteContext = v14;
  if (!v14) {
    lastInvalidatedCompanionRouteContext = self->_lastInvalidatedCompanionRouteContext;
  }
  id v16 = lastInvalidatedCompanionRouteContext;

  if ([v11 isStaleComparedToContext:v16])
  {
    unsigned __int8 v17 = sub_100053DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = [(GEOCompanionRouteContext *)v16 simpleDescription];
      id v19 = [v11 simpleDescription];
      *(_DWORD *)buf = 138412546;
      id v28 = v18;
      __int16 v29 = 2112;
      id v30 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "updatePreviewRoutes: incoming route context is old (current:%@, incoming:%@)", buf, 0x16u);
    }
  }
  else
  {
    id v26 = v9;
    if (!v16
      || [(GEOCompanionRouteContext *)v16 isStaleComparedToContext:v11])
    {
      long long v20 = sub_100053DCC();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        long long v21 = [(GEOCompanionRouteContext *)v16 simpleDescription];
        long long v22 = [v11 simpleDescription];
        *(_DWORD *)buf = 138412546;
        id v28 = v21;
        __int16 v29 = 2112;
        id v30 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "updatePreviewRoutes: incoming context is newer, create new session (current:%@, incoming:%@)", buf, 0x16u);
      }
      objc_storeStrong((id *)&self->_lastInvalidatedCompanionRouteContext, lastInvalidatedCompanionRouteContext);
      [(NanoRoutePlanningSession *)v12 unregisterObserver:self];
      [(NanoRoutePlanningSession *)v12 invalidate];
      __int16 v23 = objc_alloc_init(NanoRoutePlanningSession);
      [(NanoRoutePlanningSession *)v23 setShouldBroadcast:1];
      [(NanoRoutePlanningSession *)v23 setNextClass:objc_opt_class() forSessionState:3];
      [(NanoRoutePlanningSession *)v23 setNextClass:objc_opt_class() forSessionState:4];
      [(NanoRoutePlanningSession *)v23 registerObserver:self];
      routePlanningSession = self->_routePlanningSession;
      self->_routePlanningSession = v23;
    }
    uint64_t v25 = self->_routePlanningSession;

    [(NMCRoutePlanningController *)self _setCurrentSessionInputOrigin:1];
    [(NanoRoutePlanningSession *)v25 updateWithRequest:v8 response:v26];
    int v12 = v25;
    id v9 = v26;
  }
  v10[2](v10);
}

- (void)failRoutePlanningRequest:(id)a3 withResponse:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (self->_currentSessionInputOrigin == 1)
  {
    id v11 = [v8 companionRouteContext];
    int v12 = self->_routePlanningSession;
    id v13 = [(NanoRoutePlanningSession *)v12 request];
    __int16 v14 = [v13 companionRouteContext];
    lastInvalidatedCompanionRouteContext = v14;
    if (!v14) {
      lastInvalidatedCompanionRouteContext = self->_lastInvalidatedCompanionRouteContext;
    }
    id v16 = lastInvalidatedCompanionRouteContext;

    if ([v11 isStaleComparedToContext:v16])
    {
      unsigned __int8 v17 = sub_100053DCC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v18 = [(GEOCompanionRouteContext *)v16 simpleDescription];
        id v19 = [v11 simpleDescription];
        *(_DWORD *)buf = 138412546;
        __int16 v24 = v18;
        __int16 v25 = 2112;
        uint64_t v26 = (uint64_t)v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "failRoutePlanningRequest: incoming context is old (current:%@, incoming:%@)", buf, 0x16u);
      }
    }
    else if (v16 {
           && ![(GEOCompanionRouteContext *)v16 isStaleComparedToContext:v11])
    }
    {
      [(NanoRoutePlanningSession *)v12 updateWithRequest:v8 response:v9];
    }
    else
    {
      long long v20 = sub_100053DCC();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        long long v22 = [(GEOCompanionRouteContext *)v16 simpleDescription];
        [v11 simpleDescription];
        *(_DWORD *)buf = 138412546;
        __int16 v24 = v22;
        uint64_t v26 = v25 = 2112;
        long long v21 = (void *)v26;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "failRoutePlanningRequest: incoming context is newer, invalidate current session and ignore incoming (current:%@, incoming:%@)", buf, 0x16u);
      }
      objc_storeStrong((id *)&self->_lastInvalidatedCompanionRouteContext, lastInvalidatedCompanionRouteContext);
      [(NanoRoutePlanningSession *)v12 unregisterObserver:self];
      [(NanoRoutePlanningSession *)v12 invalidate];
    }
    v10[2](v10);
  }
  else
  {
    v10[2](v10);
  }
}

- (void)updateRoutePlanningRequest:(id)a3 withSelectedRouteID:(id)a4 completionHandler:(id)a5
{
  isolationQueue = self->_isolationQueue;
  id v8 = (void (**)(void))a5;
  id v9 = a4;
  dispatch_assert_queue_V2(isolationQueue);
  [(NMCRoutePlanningController *)self _setCurrentSessionInputOrigin:1];
  id v10 = +[NSUUID _maps_UUIDWithData:v9];

  [(NanoRoutePlanningSession *)self->_routePlanningSession setSelectedRouteWithRouteID:v10];
  v8[2](v8);
}

- (void)clearRoutePlanningWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v8 = self->_routePlanningSession;
  id v9 = [(NanoRoutePlanningSession *)v8 request];
  id v10 = [v9 companionRouteContext];
  lastInvalidatedCompanionRouteContext = v10;
  if (!v10) {
    lastInvalidatedCompanionRouteContext = self->_lastInvalidatedCompanionRouteContext;
  }
  int v12 = lastInvalidatedCompanionRouteContext;

  if ([v6 isStaleComparedToContext:v12])
  {
    id v13 = sub_100053DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = [(GEOCompanionRouteContext *)v12 simpleDescription];
      int v15 = [v6 simpleDescription];
      *(_DWORD *)buf = 138412546;
      id v27 = v14;
      __int16 v28 = 2112;
      __int16 v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "clearRoutePlanningRequest: incoming context is old (current:%@, incoming:%@)", buf, 0x16u);
    }
LABEL_12:
    v7[2](v7);
    goto LABEL_13;
  }
  if (!v12 || [(GEOCompanionRouteContext *)v12 isStaleComparedToContext:v6])
  {
    id v16 = sub_100053DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v17 = [(GEOCompanionRouteContext *)v12 simpleDescription];
      id v18 = [v6 simpleDescription];
      *(_DWORD *)buf = 138412546;
      id v27 = v17;
      __int16 v28 = 2112;
      __int16 v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "clearRoutePlanningRequest: incoming context is newer, invalidate current session and ignore incoming (current:%@, incoming:%@)", buf, 0x16u);
    }
    [(NanoRoutePlanningSession *)v8 unregisterObserver:self];
    [(NanoRoutePlanningSession *)v8 invalidate];
    goto LABEL_12;
  }
  id v19 = self->_routePlanningSession;
  snapshot = self->_snapshot;
  self->_snapshot = 0;

  routePlanningSession = self->_routePlanningSession;
  self->_routePlanningSession = 0;

  if (v19)
  {
    long long v22 = sub_100053DCC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      __int16 v25 = [(NanoRoutePlanningSession *)v19 request];
      __int16 v23 = [v25 companionRouteContext];
      __int16 v24 = [v23 simpleDescription];
      *(_DWORD *)buf = 138412290;
      id v27 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Maps asked us to clear route planning (context:%@)", buf, 0xCu);
    }
    objc_storeStrong((id *)&self->_lastInvalidatedCompanionRouteContext, lastInvalidatedCompanionRouteContext);
    [(NanoRoutePlanningSession *)v19 unregisterObserver:self];
    [(NanoRoutePlanningSession *)v19 invalidate];
    [(NMCRoutePlanningController *)self _notifyNanoMapsRoutePlanningSessionDidInvalidate:v19];
  }
  v7[2](v7);

LABEL_13:
}

- (void)_checkinForRoutePlanningWithConnection:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  int v5 = +[NMCGizmoConnection sharedInstance];
  unsigned __int8 v6 = [v5 supportsXPCUseMapsForRoutePlanning];

  if ((v6 & 1) == 0)
  {
    routePlanningSession = self->_routePlanningSession;
    if (routePlanningSession)
    {
      id v8 = routePlanningSession;
      id v9 = [(NanoRoutePlanningSession *)v8 request];
      id v10 = [(NanoRoutePlanningSession *)v8 response];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100026A7C;
      v13[3] = &unk_100081F30;
      id v14 = v4;
      id v15 = v9;
      id v16 = v10;
      id v11 = v10;
      id v12 = v9;
      sub_100014714(@"com.apple.Maps.launchFromGizmo.preview.synchronize", v13);
    }
  }
}

- (void)_notifyMapsRoutePlanningSessionDidStartLoading:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  int v5 = +[NMCGizmoConnection sharedInstance];
  unsigned __int8 v6 = [v5 supportsXPCUseMapsForRoutePlanning];

  if ((v6 & 1) == 0)
  {
    id v7 = [v4 request];
    id v8 = [v7 companionRouteContext];
    id v9 = sub_100053DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [v8 simpleDescription];
      *(_DWORD *)buf = 138412290;
      id v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Notifying Maps: session did start (context:%@)", buf, 0xCu);
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100026CE0;
    v12[3] = &unk_100081F58;
    id v13 = v7;
    id v11 = v7;
    [(NMCRoutePlanningController *)self _enumerateMapsConnectionsUnderAssertionNamed:@"com.apple.Maps.launchFromGizmo.preview.anticipate" usingBlock:v12];
  }
}

- (void)_notifyMapsRoutePlanningSessionDidUpdateResponse:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  int v5 = +[NMCGizmoConnection sharedInstance];
  unsigned __int8 v6 = [v5 supportsXPCUseMapsForRoutePlanning];

  if ((v6 & 1) == 0)
  {
    id v7 = [v4 request];
    id v8 = [v4 response];
    id v9 = [v7 companionRouteContext];
    id v10 = sub_100053DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [v9 simpleDescription];
      *(_DWORD *)buf = 138412290;
      id v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Notifying Maps: session did receive routes (context:%@)", buf, 0xCu);
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100026F7C;
    v14[3] = &unk_100081F80;
    id v15 = v7;
    id v16 = v8;
    id v12 = v8;
    id v13 = v7;
    [(NMCRoutePlanningController *)self _enumerateMapsConnectionsUnderAssertionNamed:@"com.apple.Maps.launchFromGizmo.preview.routes" usingBlock:v14];
  }
}

- (void)_notifyMapsRoutePlanningSessionDidSelectRoute:(id)a3
{
  isolationQueue = self->_isolationQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  unsigned __int8 v6 = [v5 request];
  id v7 = [v5 selectedRoute];

  id v8 = [v7 uniqueRouteID];
  id v9 = objc_msgSend(v8, "_maps_data");

  id v10 = [v6 companionRouteContext];
  id v11 = sub_100053DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [v10 simpleDescription];
    *(_DWORD *)buf = 138412546;
    id v19 = v9;
    __int16 v20 = 2112;
    long long v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Notifying Maps: did select route (routeID:%@, context:%@)", buf, 0x16u);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100027224;
  v15[3] = &unk_100081F80;
  id v16 = v6;
  id v17 = v9;
  id v13 = v9;
  id v14 = v6;
  [(NMCRoutePlanningController *)self _enumerateMapsConnectionsUnderAssertionNamed:@"com.apple.Maps.launchFromGizmo.preview.select" usingBlock:v15];
}

- (void)_notifyMapsRoutePlanningSessionDidFail:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v5 = +[NMCGizmoConnection sharedInstance];
  unsigned __int8 v6 = [v5 supportsXPCUseMapsForRoutePlanning];

  if ((v6 & 1) == 0)
  {
    id v7 = [v4 request];
    id v8 = [v4 response];
    id v9 = [v7 companionRouteContext];
    id v10 = sub_100053DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [v8 lastError];
      id v12 = [v9 simpleDescription];
      *(_DWORD *)buf = 138412546;
      id v19 = v11;
      __int16 v20 = 2112;
      long long v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Notifying Maps: session failed with error: %@ (context:%@)", buf, 0x16u);
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000274E4;
    v15[3] = &unk_100081F80;
    id v16 = v7;
    id v17 = v8;
    id v13 = v8;
    id v14 = v7;
    [(NMCRoutePlanningController *)self _enumerateMapsConnectionsUnderAssertionNamed:@"com.apple.Maps.launchFromGizmo.preview.fail" usingBlock:v15];
  }
}

- (void)_notifyMapsRoutePlanningSessionDidInvalidate:(id)a3
{
  isolationQueue = self->_isolationQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  unsigned __int8 v6 = [v5 request];

  id v7 = [v6 companionRouteContext];

  id v8 = sub_100053DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v7 simpleDescription];
    *(_DWORD *)buf = 138412290;
    id v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Notifying Maps: session invalidated (context:%@)", buf, 0xCu);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100027730;
  v11[3] = &unk_100081F58;
  id v12 = v7;
  id v10 = v7;
  [(NMCRoutePlanningController *)self _enumerateMapsConnectionsUnderAssertionNamed:@"com.apple.Maps.launchFromGizmo.preview.clear" usingBlock:v11];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_transitRouteUpdater, 0);
  objc_storeStrong((id *)&self->_gizmoPreviewState, 0);
  objc_storeStrong((id *)&self->_lastInvalidatedCompanionRouteContext, 0);
  objc_storeStrong((id *)&self->_routePlanningSession, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end