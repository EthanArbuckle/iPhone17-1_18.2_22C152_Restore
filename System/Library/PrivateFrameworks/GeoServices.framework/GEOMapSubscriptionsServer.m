@interface GEOMapSubscriptionsServer
+ (BOOL)performsPairedDeviceSynchronization;
+ (id)handledPairedDeviceMessageTypes;
+ (id)identifier;
+ (id)possibleBackgroundTaskIdentifiers;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (BOOL)handleIncomingPairedDeviceMessage:(id)a3;
- (BOOL)handleIncomingPairedDeviceMessage:(id)a3 completionHandler:(id)a4;
- (GEOMapSubscriptionsServer)initWithDaemon:(id)a3;
- (id)_startObservingStateForIdentifier:(id)a3 fromPairedDevice:(BOOL)a4 onBehalfOfPeer:(id)a5;
- (void)_stopObservingStateForIdentifier:(id)a3 fromPairedDevice:(BOOL)a4 onBehalfOfPeer:(id)a5;
- (void)_stopObservingStatesOnBehalfOfPeer:(id)a3;
- (void)addSubscriptionWithRequest:(id)a3;
- (void)broadcastState:(id)a3 forIdentifier:(id)a4 fromPairedDevice:(BOOL)a5 toObservers:(id)a6;
- (void)calculateTotalOfflineDataSizeWithRequest:(id)a3;
- (void)cancelDownloadForSubscriptionsWithRequest:(id)a3;
- (void)cancelEstimatedSizeRequestWithRequest:(id)a3;
- (void)checkContainmentForRegionWithRequest:(id)a3;
- (void)configureSubscriptionShouldSyncWithPairedDeviceMessage:(id)a3 completionHandler:(id)a4;
- (void)determineEstimatedSizeWithRequest:(id)a3;
- (void)fetchIdentifiersForSyncToPairedDeviceWithRequest:(id)a3;
- (void)fetchLastUpdatedDateForOfflineSubscriptionsWithRequest:(id)a3;
- (void)fetchPairedDeviceAvailableOfflineStorageWithRequest:(id)a3;
- (void)fetchPairedDeviceIdentifiersToObserveWithRequest:(id)a3;
- (void)fetchPairedDeviceSubscriptionsSummaryWithRequest:(id)a3;
- (void)fetchStateForSubscriptionWithRequest:(id)a3;
- (void)fetchSubscriptionsForSyncToWatchWithRequest:(id)a3;
- (void)fetchSubscriptionsWithRequest:(id)a3;
- (void)forceUpdateUserInitiatedSubscriptionsWithRequest:(id)a3;
- (void)handlePairedDeviceStateUpdateWithRequest:(id)a3;
- (void)peerDidDisconnect:(id)a3;
- (void)removeSubscriptionWithRequest:(id)a3;
- (void)runBackgroundTask:(id)a3;
- (void)setNeedsPairedDeviceSynchronization;
- (void)setPairedDeviceSubscriptionsSummaryWithRequest:(id)a3;
- (void)setPairedDeviceSyncBehaviorWithRequest:(id)a3;
- (void)setSubscriptionStateSummaryWithPairedDeviceMessage:(id)a3;
- (void)startDownloadForSubscriptionsWithRequest:(id)a3;
- (void)startObservingStateForSubscriptionsWithRequest:(id)a3;
- (void)stopObservingStateForSubscriptionsWithRequest:(id)a3;
- (void)subscriptionManager:(id)a3 didUpdatePairedDeviceState:(id)a4 forIdentifier:(id)a5;
- (void)subscriptionManager:(id)a3 didUpdateState:(id)a4 forIdentifier:(id)a5;
- (void)updateSubscriptionStateWithPairedDeviceMessage:(id)a3;
@end

@implementation GEOMapSubscriptionsServer

- (void)peerDidDisconnect:(id)a3
{
  id v4 = a3;
  [(GEOMapSubscriptionsServer *)self _stopObservingStatesOnBehalfOfPeer:v4];
  v5.receiver = self;
  v5.super_class = (Class)GEOMapSubscriptionsServer;
  [(GEOMapSubscriptionsServer *)&v5 peerDidDisconnect:v4];
}

- (void)_stopObservingStatesOnBehalfOfPeer:(id)a3
{
  id v4 = a3;
  v28 = self->_stateObserversLock;
  _geo_isolate_lock();
  v15 = v4;
  v16 = [(NSMapTable *)self->_stateObserverForPeer objectForKey:v4];
  if (v16)
  {
    [(NSMapTable *)self->_stateObserverForPeer removeObjectForKey:v4];
    if (![(NSMapTable *)self->_stateObserverForPeer count])
    {
      objc_super v5 = +[GEOMapDataSubscriptionManager sharedManager];
      [v5 _removeStateObserver:self];
    }
    sub_10002F558(v16);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v6)
    {
      uint64_t v18 = *(void *)v25;
      do
      {
        id v19 = v6;
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          v9 = self->_stateObserverForPeer;
          id v10 = [(NSMapTable *)v9 countByEnumeratingWithState:&v20 objects:v29 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v21;
LABEL_11:
            uint64_t v12 = 0;
            while (1)
            {
              if (*(void *)v21 != v11) {
                objc_enumerationMutation(v9);
              }
              v13 = [(NSMapTable *)self->_stateObserverForPeer objectForKey:*(void *)(*((void *)&v20 + 1) + 8 * v12)];
              unsigned __int8 v14 = sub_10002ED08(v13, v8);

              if (v14) {
                break;
              }
              if (v10 == (id)++v12)
              {
                id v10 = [(NSMapTable *)v9 countByEnumeratingWithState:&v20 objects:v29 count:16];
                if (v10) {
                  goto LABEL_11;
                }
                goto LABEL_17;
              }
            }
          }
          else
          {
LABEL_17:

            v9 = +[GEOMapDataSubscriptionManager sharedManager];
            [(NSMapTable *)v9 _removeStateObserver:self forPairedDeviceSubscriptionWithIdentifier:v8];
          }
        }
        id v6 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v6);
    }
  }
  _geo_isolate_unlock();
}

+ (id)identifier
{
  return @"subscriptions";
}

+ (id)possibleBackgroundTaskIdentifiers
{
  return &off_100077AB0;
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100008D68(v10);
  BOOL v14 = 0;
  if (v13 > 3132)
  {
    if (v13 <= 3755)
    {
      if (v13 <= 3604)
      {
        if (v13 == 3133)
        {
          CFStringRef v89 = @"com.apple.geoservices.map-subscriptions.manage-downloads";
          v76 = +[NSArray arrayWithObjects:&v89 count:1];
          int v77 = sub_100019858(v12, v11, @"subscriptions", v10, v76, 1);

          BOOL v14 = 1;
          if (v77)
          {
            uint64_t v78 = objc_opt_class();
            v79 = sub_100008DBC(@"subscriptions", v10, v11, v78, v12);
            v17 = v79;
            BOOL v14 = v79 != 0;
            if (v79)
            {
              [v79 setSignpostId:a6];
              [(GEOMapSubscriptionsServer *)self cancelDownloadForSubscriptionsWithRequest:v17];
            }
            goto LABEL_84;
          }
        }
        else if (v13 == 3328)
        {
          CFStringRef v86 = @"com.apple.geoservices.map-subscriptions.watch-sync";
          v36 = +[NSArray arrayWithObjects:&v86 count:1];
          int v37 = sub_100019858(v12, v11, @"subscriptions", v10, v36, 1);

          BOOL v14 = 1;
          if (v37)
          {
            uint64_t v38 = objc_opt_class();
            v39 = sub_100008DBC(@"subscriptions", v10, v11, v38, v12);
            v17 = v39;
            BOOL v14 = v39 != 0;
            if (v39)
            {
              [v39 setSignpostId:a6];
              [(GEOMapSubscriptionsServer *)self fetchSubscriptionsForSyncToWatchWithRequest:v17];
            }
            goto LABEL_84;
          }
        }
      }
      else
      {
        switch(v13)
        {
          case 3605:
            uint64_t v54 = objc_opt_class();
            v55 = sub_100008DBC(@"subscriptions", v10, v11, v54, v12);
            v17 = v55;
            BOOL v14 = v55 != 0;
            if (v55)
            {
              [v55 setSignpostId:a6];
              [(GEOMapSubscriptionsServer *)self stopObservingStateForSubscriptionsWithRequest:v17];
            }
            goto LABEL_84;
          case 3671:
            CFStringRef v82 = @"com.apple.geoservices.map-subscriptions.watch-sync";
            v56 = +[NSArray arrayWithObjects:&v82 count:1];
            int v57 = sub_100019858(v12, v11, @"subscriptions", v10, v56, 1);

            BOOL v14 = 1;
            if (v57)
            {
              uint64_t v58 = objc_opt_class();
              v59 = sub_100008DBC(@"subscriptions", v10, v11, v58, v12);
              v17 = v59;
              BOOL v14 = v59 != 0;
              if (v59)
              {
                [v59 setSignpostId:a6];
                [(GEOMapSubscriptionsServer *)self setPairedDeviceSubscriptionsSummaryWithRequest:v17];
              }
              goto LABEL_84;
            }
            break;
          case 3709:
            uint64_t v24 = objc_opt_class();
            long long v25 = sub_100008DBC(@"subscriptions", v10, v11, v24, v12);
            v17 = v25;
            BOOL v14 = v25 != 0;
            if (v25)
            {
              [v25 setSignpostId:a6];
              [(GEOMapSubscriptionsServer *)self startObservingStateForSubscriptionsWithRequest:v17];
            }
            goto LABEL_84;
        }
      }
    }
    else if (v13 > 3875)
    {
      switch(v13)
      {
        case 3876:
          CFStringRef v88 = @"com.apple.geoservices.map-subscriptions.manage-downloads";
          v66 = +[NSArray arrayWithObjects:&v88 count:1];
          int v67 = sub_100019858(v12, v11, @"subscriptions", v10, v66, 1);

          BOOL v14 = 1;
          if (v67)
          {
            uint64_t v68 = objc_opt_class();
            v69 = sub_100008DBC(@"subscriptions", v10, v11, v68, v12);
            v17 = v69;
            BOOL v14 = v69 != 0;
            if (v69)
            {
              [v69 setSignpostId:a6];
              [(GEOMapSubscriptionsServer *)self forceUpdateUserInitiatedSubscriptionsWithRequest:v17];
            }
            goto LABEL_84;
          }
          break;
        case 4040:
          CFStringRef v81 = @"com.apple.geoservices.map-subscriptions.watch-sync";
          v70 = +[NSArray arrayWithObjects:&v81 count:1];
          int v71 = sub_100019858(v12, v11, @"subscriptions", v10, v70, 1);

          BOOL v14 = 1;
          if (v71)
          {
            uint64_t v72 = objc_opt_class();
            v73 = sub_100008DBC(@"subscriptions", v10, v11, v72, v12);
            v17 = v73;
            BOOL v14 = v73 != 0;
            if (v73)
            {
              [v73 setSignpostId:a6];
              [(GEOMapSubscriptionsServer *)self fetchPairedDeviceAvailableOfflineStorageWithRequest:v17];
            }
            goto LABEL_84;
          }
          break;
        case 4421:
          CFStringRef v87 = @"com.apple.geoservices.map-subscriptions.manage-downloads";
          v30 = +[NSArray arrayWithObjects:&v87 count:1];
          int v31 = sub_100019858(v12, v11, @"subscriptions", v10, v30, 1);

          BOOL v14 = 1;
          if (v31)
          {
            uint64_t v32 = objc_opt_class();
            v33 = sub_100008DBC(@"subscriptions", v10, v11, v32, v12);
            v17 = v33;
            BOOL v14 = v33 != 0;
            if (v33)
            {
              [v33 setSignpostId:a6];
              [(GEOMapSubscriptionsServer *)self fetchLastUpdatedDateForOfflineSubscriptionsWithRequest:v17];
            }
            goto LABEL_84;
          }
          break;
      }
    }
    else
    {
      switch(v13)
      {
        case 3756:
          uint64_t v44 = objc_opt_class();
          v45 = sub_100008DBC(@"subscriptions", v10, v11, v44, v12);
          v17 = v45;
          BOOL v14 = v45 != 0;
          if (v45)
          {
            [v45 setSignpostId:a6];
            [(GEOMapSubscriptionsServer *)self fetchIdentifiersForSyncToPairedDeviceWithRequest:v17];
          }
          goto LABEL_84;
        case 3774:
          CFStringRef v85 = @"com.apple.geoservices.map-subscriptions.watch-sync";
          v46 = +[NSArray arrayWithObjects:&v85 count:1];
          int v47 = sub_100019858(v12, v11, @"subscriptions", v10, v46, 1);

          BOOL v14 = 1;
          if (v47)
          {
            uint64_t v48 = objc_opt_class();
            v49 = sub_100008DBC(@"subscriptions", v10, v11, v48, v12);
            v17 = v49;
            BOOL v14 = v49 != 0;
            if (v49)
            {
              [v49 setSignpostId:a6];
              [(GEOMapSubscriptionsServer *)self fetchPairedDeviceIdentifiersToObserveWithRequest:v17];
            }
            goto LABEL_84;
          }
          break;
        case 3861:
          CFStringRef v83 = @"com.apple.geoservices.map-subscriptions.watch-sync";
          uint64_t v18 = +[NSArray arrayWithObjects:&v83 count:1];
          int v19 = sub_100019858(v12, v11, @"subscriptions", v10, v18, 1);

          BOOL v14 = 1;
          if (v19)
          {
            uint64_t v20 = objc_opt_class();
            long long v21 = sub_100008DBC(@"subscriptions", v10, v11, v20, v12);
            v17 = v21;
            BOOL v14 = v21 != 0;
            if (v21)
            {
              [v21 setSignpostId:a6];
              [(GEOMapSubscriptionsServer *)self fetchPairedDeviceSubscriptionsSummaryWithRequest:v17];
            }
            goto LABEL_84;
          }
          break;
      }
    }
  }
  else if (v13 <= 2614)
  {
    if (v13 <= 1938)
    {
      if (v13 == 1582)
      {
        uint64_t v74 = objc_opt_class();
        v75 = sub_100008DBC(@"subscriptions", v10, v11, v74, v12);
        v17 = v75;
        BOOL v14 = v75 != 0;
        if (v75)
        {
          [v75 setSignpostId:a6];
          [(GEOMapSubscriptionsServer *)self addSubscriptionWithRequest:v17];
        }
        goto LABEL_84;
      }
      if (v13 == 1922)
      {
        uint64_t v34 = objc_opt_class();
        v35 = sub_100008DBC(@"subscriptions", v10, v11, v34, v12);
        v17 = v35;
        BOOL v14 = v35 != 0;
        if (v35)
        {
          [v35 setSignpostId:a6];
          [(GEOMapSubscriptionsServer *)self fetchSubscriptionsWithRequest:v17];
        }
        goto LABEL_84;
      }
    }
    else
    {
      switch(v13)
      {
        case 1939:
          uint64_t v50 = objc_opt_class();
          v51 = sub_100008DBC(@"subscriptions", v10, v11, v50, v12);
          v17 = v51;
          BOOL v14 = v51 != 0;
          if (v51)
          {
            [v51 setSignpostId:a6];
            [(GEOMapSubscriptionsServer *)self removeSubscriptionWithRequest:v17];
          }
          goto LABEL_84;
        case 2296:
          uint64_t v52 = objc_opt_class();
          v53 = sub_100008DBC(@"subscriptions", v10, v11, v52, v12);
          v17 = v53;
          BOOL v14 = v53 != 0;
          if (v53)
          {
            [v53 setSignpostId:a6];
            [(GEOMapSubscriptionsServer *)self determineEstimatedSizeWithRequest:v17];
          }
          goto LABEL_84;
        case 2569:
          uint64_t v22 = objc_opt_class();
          long long v23 = sub_100008DBC(@"subscriptions", v10, v11, v22, v12);
          v17 = v23;
          BOOL v14 = v23 != 0;
          if (v23)
          {
            [v23 setSignpostId:a6];
            [(GEOMapSubscriptionsServer *)self checkContainmentForRegionWithRequest:v17];
          }
          goto LABEL_84;
      }
    }
  }
  else if (v13 > 2932)
  {
    switch(v13)
    {
      case 2933:
        CFStringRef v84 = @"com.apple.geoservices.map-subscriptions.watch-sync";
        v60 = +[NSArray arrayWithObjects:&v84 count:1];
        int v61 = sub_100019858(v12, v11, @"subscriptions", v10, v60, 1);

        BOOL v14 = 1;
        if (v61)
        {
          uint64_t v62 = objc_opt_class();
          v63 = sub_100008DBC(@"subscriptions", v10, v11, v62, v12);
          v17 = v63;
          BOOL v14 = v63 != 0;
          if (v63)
          {
            [v63 setSignpostId:a6];
            [(GEOMapSubscriptionsServer *)self handlePairedDeviceStateUpdateWithRequest:v17];
          }
          goto LABEL_84;
        }
        break;
      case 2954:
        uint64_t v64 = objc_opt_class();
        v65 = sub_100008DBC(@"subscriptions", v10, v11, v64, v12);
        v17 = v65;
        BOOL v14 = v65 != 0;
        if (v65)
        {
          [v65 setSignpostId:a6];
          [(GEOMapSubscriptionsServer *)self calculateTotalOfflineDataSizeWithRequest:v17];
        }
        goto LABEL_84;
      case 3077:
        CFStringRef v90 = @"com.apple.geoservices.map-subscriptions.manage-downloads";
        BOOL v14 = 1;
        long long v26 = +[NSArray arrayWithObjects:&v90 count:1];
        int v27 = sub_100019858(v12, v11, @"subscriptions", v10, v26, 1);

        if (v27)
        {
          uint64_t v28 = objc_opt_class();
          v29 = sub_100008DBC(@"subscriptions", v10, v11, v28, v12);
          v17 = v29;
          BOOL v14 = v29 != 0;
          if (v29)
          {
            [v29 setSignpostId:a6];
            [(GEOMapSubscriptionsServer *)self startDownloadForSubscriptionsWithRequest:v17];
          }
          goto LABEL_84;
        }
        break;
    }
  }
  else
  {
    switch(v13)
    {
      case 2615:
        uint64_t v40 = objc_opt_class();
        v41 = sub_100008DBC(@"subscriptions", v10, v11, v40, v12);
        v17 = v41;
        BOOL v14 = v41 != 0;
        if (v41)
        {
          [v41 setSignpostId:a6];
          [(GEOMapSubscriptionsServer *)self fetchStateForSubscriptionWithRequest:v17];
        }
        goto LABEL_84;
      case 2698:
        uint64_t v42 = objc_opt_class();
        v43 = sub_100008DBC(@"subscriptions", v10, v11, v42, v12);
        v17 = v43;
        BOOL v14 = v43 != 0;
        if (v43)
        {
          [v43 setSignpostId:a6];
          [(GEOMapSubscriptionsServer *)self cancelEstimatedSizeRequestWithRequest:v17];
        }
        goto LABEL_84;
      case 2750:
        uint64_t v15 = objc_opt_class();
        v16 = sub_100008DBC(@"subscriptions", v10, v11, v15, v12);
        v17 = v16;
        BOOL v14 = v16 != 0;
        if (v16)
        {
          [v16 setSignpostId:a6];
          [(GEOMapSubscriptionsServer *)self setPairedDeviceSyncBehaviorWithRequest:v17];
        }
LABEL_84:

        break;
    }
  }

  return v14;
}

+ (id)handledPairedDeviceMessageTypes
{
  return &off_100077AC8;
}

- (BOOL)handleIncomingPairedDeviceMessage:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 type];
  if (v5 == 105)
  {
    id v6 = [v4 updateSubscriptionState];
    BOOL v7 = v6 != 0;
    if (v6)
    {
      [(GEOMapSubscriptionsServer *)self updateSubscriptionStateWithPairedDeviceMessage:v6];
      goto LABEL_7;
    }
  }
  else
  {
    if (v5 != 103)
    {
      BOOL v7 = 0;
      goto LABEL_10;
    }
    id v6 = [v4 setSubscriptionStateSummary];
    BOOL v7 = v6 != 0;
    if (v6)
    {
      [(GEOMapSubscriptionsServer *)self setSubscriptionStateSummaryWithPairedDeviceMessage:v6];
LABEL_7:
      BOOL v7 = 1;
    }
  }

LABEL_10:
  return v7;
}

- (BOOL)handleIncomingPairedDeviceMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 type] == 100)
  {
    v8 = [v6 configureSubscriptionShouldSync];
    BOOL v9 = v8 != 0;
    if (v8)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10001BE38;
      v11[3] = &unk_100071B58;
      id v12 = v7;
      [(GEOMapSubscriptionsServer *)self configureSubscriptionShouldSyncWithPairedDeviceMessage:v8 completionHandler:v11];
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (GEOMapSubscriptionsServer)initWithDaemon:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)GEOMapSubscriptionsServer;
  v3 = [(GEOMapSubscriptionsServer *)&v15 initWithDaemon:a3];
  id v4 = v3;
  if (v3)
  {
    unsigned int v5 = [(GEOMapSubscriptionsServer *)v3 daemon];
    id v6 = [v5 serverQueue];
    uint64_t v7 = geo_dispatch_queue_create_with_target();
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = geo_isolater_create();
    stateObserversLock = v4->_stateObserversLock;
    v4->_stateObserversLock = (geo_isolater *)v9;

    uint64_t v11 = geo_isolater_create();
    sizeEstimationRequestsIsolation = v4->_sizeEstimationRequestsIsolation;
    v4->_sizeEstimationRequestsIsolation = (geo_isolater *)v11;

    int v13 = v4;
  }

  return v4;
}

- (void)runBackgroundTask:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 identifier];
  GEOBackgroundTaskReportReportTaskInitiated();

  id v6 = [v4 identifier];
  unsigned int v7 = [v6 isEqualToString:GEOMapDataSubscriptionAutomaticOfflineDataUpdateBackgroundTaskIdentifier];

  if (v7)
  {
    v8 = +[GEOMapDataSubscriptionManager sharedManager];
    [v8 _runAutomaticOfflineDataUpdateBackgroundTask:v4];
    goto LABEL_11;
  }
  uint64_t v9 = [v4 identifier];
  if ([v9 isEqualToString:GEOMapDataSubscriptionOfflineDownloadInexpensiveBackgroundTaskIdentifier])
  {

LABEL_6:
    v8 = +[GEOMapDataSubscriptionManager sharedManager];
    [v8 _runRetryOfflineDownloadBackgroundTask:v4];
    goto LABEL_11;
  }
  id v10 = [v4 identifier];
  unsigned int v11 = [v10 isEqualToString:GEOMapDataSubscriptionOfflineDownloadRetryBackgroundTaskIdentifier];

  if (v11) {
    goto LABEL_6;
  }
  id v12 = [v4 identifier];
  if ([v12 isEqualToString:GEOMapDataSubscriptionExpirationTaskIdentifier])
  {
  }
  else
  {
    int v13 = [v4 identifier];
    unsigned int v14 = [v13 isEqualToString:GEOMapDataSubscriptionUpcomingExpirationTaskIdentifier];

    if (!v14)
    {
      v15.receiver = self;
      v15.super_class = (Class)GEOMapSubscriptionsServer;
      [(GEOMapSubscriptionsServer *)&v15 runBackgroundTask:v4];
      goto LABEL_12;
    }
  }
  v8 = +[GEOMapDataSubscriptionExpirationHelper sharedHelper];
  [v8 runBackgroundTask:v4 orIdentifier:0];
LABEL_11:

LABEL_12:
}

+ (BOOL)performsPairedDeviceSynchronization
{
  return 1;
}

- (void)setNeedsPairedDeviceSynchronization
{
  id v2 = +[GEOMapDataSubscriptionManager sharedManager];
  [v2 _setNeedsPairedDeviceStateSynchronization];
}

- (void)fetchSubscriptionsWithRequest:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 peer];
  id v6 = sub_10002B8F8(v5);

  if ([v6 count])
  {
    unsigned int v7 = [v4 identifiersFilter];
    if ([v7 count])
    {
      v8 = [v4 identifiersFilter];
      sub_10002B188(v6, v8);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = v6;
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10002BA60;
    v19[3] = &unk_100071410;
    id v13 = v4;
    id v20 = v13;
    unsigned int v14 = objc_retainBlock(v19);
    unsigned int v15 = [v13 fetchExpired];
    v16 = +[GEOMapDataSubscriptionManager sharedManager];
    v17 = v16;
    queue = self->_queue;
    if (v15) {
      [v16 fetchExpiredSubscriptionsWithIdentifiers:v9 callbackQueue:queue completionHandler:v14];
    }
    else {
      [v16 fetchSubscriptionsWithIdentifiers:v9 callbackQueue:queue completionHandler:v14];
    }
  }
  else
  {
    id v10 = [objc_alloc((Class)GEOMapSubscriptionsFetchReply) initWithRequest:v4];
    unsigned int v11 = +[NSString stringWithFormat:@"Missing or incorrect entitlement '%@'", @"com.apple.geoservices.map-subscriptions"];
    id v12 = +[NSError GEOErrorWithCode:-5 reason:v11];
    [v10 setError:v12];

    [v10 send];
  }
}

- (void)addSubscriptionWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOMapSubscriptionAddReply) initWithRequest:v4];
  id v6 = [v4 identifier];
  unsigned int v7 = [v4 peer];
  id v26 = 0;
  char v8 = sub_10002BDB8(v6, v7, &v26);
  id v9 = v26;

  if (v8)
  {
    id v23 = v9;
    [v4 dataTypes];
    id v10 = GEOGetSubscriptionsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      unsigned int v11 = [v4 peer];
      id v12 = [v11 bundleIdentifier];
      id v13 = [v4 identifier];
      *(_DWORD *)buf = 138543619;
      uint64_t v28 = v12;
      __int16 v29 = 2113;
      v30 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Peer '%{public}@' is adding a subscription: '%{private}@'", buf, 0x16u);
    }
    uint64_t v22 = +[GEOMapDataSubscriptionManager sharedManager];
    unsigned int v14 = [v4 identifier];
    unsigned int v15 = [v4 preferredAuditToken];
    id v21 = [v4 dataTypes];
    id v16 = [v4 policy];
    v17 = [v4 region];
    uint64_t v18 = [v4 displayName];
    int v19 = [v4 expirationDate];
    queue = self->_queue;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10002C124;
    v24[3] = &unk_1000724A0;
    id v25 = v5;
    [v22 _addSubscriptionWithIdentifier:v14 auditToken:v15 dataTypes:v21 policy:v16 region:v17 displayName:v18 expirationDate:v19 callbackQueue:queue completionHandler:v24];

    id v9 = v23;
  }
  else
  {
    [v5 setError:v9];
    [v5 send];
  }
}

- (void)removeSubscriptionWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOMapSubscriptionRemoveReply) initWithRequest:v4];
  id v6 = [v4 identifier];
  unsigned int v7 = [v4 peer];
  id v19 = 0;
  char v8 = sub_10002BDB8(v6, v7, &v19);
  id v9 = v19;

  if (v8)
  {
    id v10 = GEOGetSubscriptionsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      unsigned int v11 = [v4 peer];
      id v12 = [v11 bundleIdentifier];
      id v13 = [v4 identifier];
      *(_DWORD *)buf = 138543619;
      id v21 = v12;
      __int16 v22 = 2113;
      id v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Peer '%{public}@' is removing a subscription: '%{private}@'", buf, 0x16u);
    }
    unsigned int v14 = +[GEOMapDataSubscriptionManager sharedManager];
    unsigned int v15 = [v4 identifier];
    queue = self->_queue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002C3A4;
    v17[3] = &unk_100072088;
    id v18 = v5;
    [v14 removeSubscriptionWithIdentifier:v15 callbackQueue:queue completionHandler:v17];
  }
  else
  {
    [v5 setError:v9];
    [v5 send];
  }
}

- (void)fetchStateForSubscriptionWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOMapSubscriptionStateReply) initWithRequest:v4];
  id v6 = [v4 identifier];
  unsigned int v7 = [v4 peer];
  id v19 = 0;
  char v8 = sub_10002BDB8(v6, v7, &v19);
  id v9 = v19;

  if (v8)
  {
    unsigned int v10 = [v4 fromPairedDevice];
    unsigned int v11 = +[GEOMapDataSubscriptionManager sharedManager];
    id v12 = [v4 identifier];
    queue = self->_queue;
    if (v10)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10002C5D8;
      v17[3] = &unk_1000724C8;
      id v18 = v5;
      [v11 fetchStateForPairedDeviceSubscriptionWithIdentifier:v12 callbackQueue:queue completionHandler:v17];

      unsigned int v14 = v18;
    }
    else
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10002C624;
      v15[3] = &unk_1000724C8;
      id v16 = v5;
      [v11 fetchStateForSubscriptionWithIdentifier:v12 callbackQueue:queue completionHandler:v15];

      unsigned int v14 = v16;
    }
  }
  else
  {
    [v5 setError:v9];
    [v5 send];
  }
}

- (void)checkContainmentForRegionWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOMapSubscriptionContainmentReply) initWithRequest:v4];
  id v6 = [v4 peer];
  unsigned __int8 v7 = [v6 hasEntitlement:@"com.apple.geoservices.map-subscriptions.check-existence"];

  if ((v7 & 1) != 0
    || ([v4 peer],
        char v8 = objc_claimAutoreleasedReturnValue(),
        [v8 valueForEntitlement:@"application-identifier"],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v8,
        v9)
    && (unsigned __int8 v10 = [v9 isEqualToString:@"com.apple.Spotlight"],
        v9,
        (v10 & 1) != 0))
  {
    unsigned int v11 = +[GEOMapDataSubscriptionManager sharedManager];
    queue = self->_queue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002C8AC;
    v17[3] = &unk_1000724F0;
    id v18 = v5;
    id v19 = v4;
    [v11 fetchAllSubscriptionsWithCallbackQueue:queue completionHandler:v17];
  }
  else
  {
    id v13 = GEOGetSubscriptionsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      unsigned int v14 = [v4 peer];
      unsigned int v15 = [v14 bundleIdentifier];
      *(_DWORD *)buf = 138543362;
      id v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Attempt from unentitled peer '%{public}@' to check subscription existence/containment", buf, 0xCu);
    }
    id v16 = +[NSError GEOErrorWithCode:-5];
    [v5 setError:v16];

    [v5 send];
  }
}

- (void)startDownloadForSubscriptionsWithRequest:(id)a3
{
  id v12 = a3;
  v3 = [v12 peer];
  id v4 = sub_10002B8F8(v3);

  id v5 = [v12 identifiers];
  id v6 = sub_10002B188(v4, v5);

  if ([v6 count])
  {
    id v7 = [v12 downloadMode];
    unsigned int v8 = [v12 onPairedDevice];
    id v9 = +[GEOMapDataSubscriptionManager sharedManager];
    unsigned __int8 v10 = v9;
    if (v8)
    {
      [v9 startDownloadForPairedDeviceSubscriptionIdentifiers:v6 mode:v7];
    }
    else
    {
      unsigned int v11 = [v12 preferredAuditToken];
      [v10 _startDownloadForSubscriptionIdentifiers:v6 mode:v7 auditToken:v11];
    }
  }
}

- (void)cancelDownloadForSubscriptionsWithRequest:(id)a3
{
  id v10 = a3;
  v3 = [v10 peer];
  id v4 = sub_10002B8F8(v3);

  id v5 = [v10 identifiers];
  id v6 = sub_10002B188(v4, v5);

  if ([v6 count])
  {
    unsigned int v7 = [v10 onPairedDevice];
    unsigned int v8 = +[GEOMapDataSubscriptionManager sharedManager];
    id v9 = v8;
    if (v7) {
      [v8 cancelDownloadForPairedDeviceSubscriptionIdentifiers:v6];
    }
    else {
      [v8 cancelDownloadForSubscriptionIdentifiers:v6];
    }
  }
}

- (void)forceUpdateUserInitiatedSubscriptionsWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 dataTypes];
  id v5 = [v3 downloadMode];
  id v7 = +[GEOMapDataSubscriptionManager sharedManager];
  id v6 = [v3 preferredAuditToken];

  [v7 _forceUpdateForUserInitiatedSubscriptionsForDataType:v4 mode:v5 auditToken:v6];
}

- (void)fetchLastUpdatedDateForOfflineSubscriptionsWithRequest:(id)a3
{
  id v4 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002CDD4;
  v11[3] = &unk_100072518;
  id v5 = [objc_alloc((Class)GEOMapSubscriptionFetchLastUpdatedDateReply) initWithRequest:v4];
  id v12 = v5;
  id v6 = objc_retainBlock(v11);
  unsigned int v7 = [v4 onPairedDevice];

  unsigned int v8 = +[GEOMapDataSubscriptionManager sharedManager];
  id v9 = v8;
  queue = self->_queue;
  if (v7) {
    [v8 fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue:queue completionHandler:v6];
  }
  else {
    [v8 fetchLastUpdatedDateForOfflineSubscriptionsWithQueue:queue completionHandler:v6];
  }
}

- (void)determineEstimatedSizeWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOMapSubscriptionSizeEstimationReply) initWithRequest:v4];
  id v6 = [v4 peer];
  if ([v6 hasEntitlement:@"com.apple.geoservices.map-subscriptions.manage-downloads"])
  {

LABEL_6:
    id v12 = [v4 requestUUID];
    id v13 = +[GEOMapDataSubscriptionManager sharedManager];
    unsigned int v14 = [v4 region];
    id v15 = [v4 dataTypes];
    queue = self->_queue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10002D12C;
    v23[3] = &unk_100072540;
    id v17 = v12;
    id v24 = v17;
    id v25 = self;
    id v26 = v5;
    id v18 = [v13 determineEstimatedSizeForSubscriptionWithRegion:v14 dataTypes:v15 queue:queue completionHandler:v23];

    if (v18 && v17)
    {
      id v21 = v18;
      id v22 = v4;
      geo_isolate_sync_data();
    }
    goto LABEL_10;
  }
  unsigned int v7 = [v4 peer];
  unsigned __int8 v8 = [v7 hasEntitlement:@"com.apple.geoservices.map-subscriptions.size-estimate"];

  if (v8) {
    goto LABEL_6;
  }
  id v9 = [v4 peer];
  id v10 = [v9 valueForEntitlement:@"application-identifier"];

  if (v10)
  {
    unsigned __int8 v11 = [v10 isEqualToString:@"com.apple.Spotlight"];

    if (v11) {
      goto LABEL_6;
    }
  }
  id v19 = GEOGetSubscriptionsLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Attempt from unentitled peer to calculate estimated region size", buf, 2u);
  }

  id v20 = +[NSError GEOErrorWithCode:-5];
  [v5 setError:v20];

  [v5 send];
LABEL_10:
}

- (void)cancelEstimatedSizeRequestWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 requestUUID];

  if (v4)
  {
    id v5 = [v3 peer];
    if ([v5 hasEntitlement:@"com.apple.geoservices.map-subscriptions.manage-downloads"])
    {

LABEL_7:
      *(void *)buf = 0;
      unsigned int v14 = buf;
      uint64_t v15 = 0x3032000000;
      id v16 = sub_10002D4FC;
      id v17 = sub_10002D50C;
      id v18 = 0;
      id v12 = v3;
      geo_isolate_sync_data();
      [*((id *)v14 + 5) cancel];

      _Block_object_dispose(buf, 8);
      goto LABEL_8;
    }
    id v6 = [v3 peer];
    unsigned __int8 v7 = [v6 hasEntitlement:@"com.apple.geoservices.map-subscriptions.size-estimate"];

    if (v7) {
      goto LABEL_7;
    }
    unsigned __int8 v8 = [v3 peer];
    id v9 = [v8 valueForEntitlement:@"application-identifier"];

    if (v9)
    {
      unsigned __int8 v10 = [v9 isEqualToString:@"com.apple.Spotlight"];

      if (v10) {
        goto LABEL_7;
      }
    }
    unsigned __int8 v11 = GEOGetSubscriptionsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Attempt from unentitled peer to cancel estimated region size request", buf, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_10004CEF4();
  }
LABEL_8:
}

- (void)calculateTotalOfflineDataSizeWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOMapSubscriptionTotalOfflineDataSizeReply) initWithRequest:v4];
  id v6 = [v4 peer];

  unsigned __int8 v7 = [v6 valueForEntitlement:@"com.apple.geoservices.map-subscriptions"];

  if (v7)
  {
    unsigned __int8 v8 = +[GEOMapDataSubscriptionManager sharedManager];
    queue = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002D708;
    v11[3] = &unk_100072568;
    id v12 = v5;
    [v8 _calculateTotalSizeOfOfflineSubscriptionsWithCallbackQueue:queue completionHandler:v11];
  }
  else
  {
    unsigned __int8 v10 = +[NSError GEOErrorWithCode:-5];
    [v5 setError:v10];

    [v5 send];
  }
}

- (void)fetchSubscriptionsForSyncToWatchWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOMapSubscriptionFetchSubscriptionsForWatchSyncReply) initWithRequest:v4];
  id v6 = +[GEOMapDataSubscriptionManager sharedManager];
  unsigned __int8 v7 = [v4 deviceIdentifier];

  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002D85C;
  v10[3] = &unk_100072590;
  id v11 = v5;
  id v9 = v5;
  [v6 _fetchSubscriptionsForSyncToWatchWithIdentifier:v7 callbackQueue:queue completionHandler:v10];
}

- (void)setPairedDeviceSyncBehaviorWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOMapSubscriptionSetPairedDeviceSyncReply) initWithRequest:v4];
  id v6 = [v4 identifier];
  unsigned __int8 v7 = [v4 peer];
  id v18 = 0;
  int v8 = sub_10002BDB8(v6, v7, &v18);
  id v9 = v18;
  if (v8)
  {
  }
  else
  {
    unsigned __int8 v10 = [v4 peer];
    unsigned __int8 v11 = [v10 hasEntitlement:@"com.apple.geoservices.map-subscriptions.watch-sync"];

    if ((v11 & 1) == 0)
    {
      [v5 setError:v9];
      [v5 send];
      goto LABEL_6;
    }
  }
  id v12 = +[GEOMapDataSubscriptionManager sharedManager];
  id v13 = [v4 identifier];
  id v14 = [v4 shouldSync];
  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002DA60;
  v16[3] = &unk_100071468;
  id v17 = v5;
  [v12 setSubscriptionWithIdentifier:v13 shouldSyncToPairedDevice:v14 callbackQueue:queue completionHandler:v16];

LABEL_6:
}

- (void)fetchIdentifiersForSyncToPairedDeviceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOMapSubscriptionGetIdentifiersForPairedDeviceSyncReply) initWithRequest:v4];
  id v6 = [v4 peer];

  unsigned __int8 v7 = sub_10002B8F8(v6);

  int v8 = +[GEOMapDataSubscriptionManager sharedManager];
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002DBC4;
  v12[3] = &unk_1000724F0;
  id v13 = v5;
  id v14 = v7;
  id v10 = v7;
  id v11 = v5;
  [v8 fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:queue completionHandler:v12];
}

- (void)fetchPairedDeviceIdentifiersToObserveWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOMapSubscriptionGetPairedDeviceSubscriptionsToObserveReply) initWithRequest:v4];

  id v6 = +[GEOMapDataSubscriptionManager sharedManager];
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002DD3C;
  v9[3] = &unk_1000725B8;
  id v10 = v5;
  id v8 = v5;
  [v6 _fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue:queue completionHandler:v9];
}

- (void)handlePairedDeviceStateUpdateWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateReply) initWithRequest:v4];
  id v6 = +[GEOMapDataSubscriptionManager sharedManager];
  unsigned __int8 v7 = [v4 serializedState];

  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002DE90;
  v10[3] = &unk_100071468;
  id v11 = v5;
  id v9 = v5;
  [v6 _handleSerializedPairedDeviceStateUpdate:v7 callbackQueue:queue completionHandler:v10];
}

- (void)setPairedDeviceSubscriptionsSummaryWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOMapSubscriptionSetPairedDeviceSubscriptionsSummaryReply) initWithRequest:v4];
  id v6 = +[GEOMapDataSubscriptionManager sharedManager];
  unsigned __int8 v7 = [v4 serializedSummary];

  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002DFDC;
  v10[3] = &unk_100071468;
  id v11 = v5;
  id v9 = v5;
  [v6 _setSerializedPairedDeviceSubscriptionsSummary:v7 callbackQueue:queue completionHandler:v10];
}

- (void)fetchPairedDeviceSubscriptionsSummaryWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryReply) initWithRequest:v4];

  id v6 = +[GEOMapDataSubscriptionManager sharedManager];
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002E108;
  v9[3] = &unk_1000725B8;
  id v10 = v5;
  id v8 = v5;
  [v6 _fetchSerializedPairedDeviceSubscriptionsSummaryWithCallbackQueue:queue completionHandler:v9];
}

- (void)fetchPairedDeviceAvailableOfflineStorageWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOMapSubscriptionFetchPairedDeviceAvailableOfflineStorageReply) initWithRequest:v4];

  id v6 = +[GEOMapDataSubscriptionManager sharedManager];
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002E23C;
  v9[3] = &unk_1000725E0;
  id v10 = v5;
  id v8 = v5;
  [v6 fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue:queue completionHandler:v9];
}

- (void)startObservingStateForSubscriptionsWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 peer];
  id v6 = sub_10002B8F8(v5);

  unsigned __int8 v7 = [v4 identifiers];
  __int16 v29 = v6;
  id v8 = sub_10002B188(v6, v7);

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v40 + 1) + 8 * (void)v12);
        id v14 = objc_msgSend(v4, "peer", v29);
        uint64_t v15 = [(GEOMapSubscriptionsServer *)self _startObservingStateForIdentifier:v13 fromPairedDevice:0 onBehalfOfPeer:v14];

        if (v15 && [v4 sendInitialUpdate])
        {
          id v16 = +[GEOMapDataSubscriptionManager sharedManager];
          queue = self->_queue;
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_10002E658;
          v38[3] = &unk_100072608;
          v38[4] = self;
          v38[5] = v13;
          id v39 = v15;
          [v16 fetchStateForSubscriptionWithIdentifier:v13 callbackQueue:queue completionHandler:v38];
        }
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v10);
  }

  id v18 = [v4 pairedDeviceIdentifiers];
  id v19 = sub_10002B188(v29, v18);

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v30 = v19;
  id v20 = [v30 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v35;
    do
    {
      id v23 = 0;
      do
      {
        if (*(void *)v35 != v22) {
          objc_enumerationMutation(v30);
        }
        uint64_t v24 = *(void *)(*((void *)&v34 + 1) + 8 * (void)v23);
        id v25 = objc_msgSend(v4, "peer", v29);
        id v26 = [(GEOMapSubscriptionsServer *)self _startObservingStateForIdentifier:v24 fromPairedDevice:1 onBehalfOfPeer:v25];

        if (v26 && [v4 sendInitialUpdate])
        {
          int v27 = +[GEOMapDataSubscriptionManager sharedManager];
          uint64_t v28 = self->_queue;
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_10002E708;
          v32[3] = &unk_100072608;
          v32[4] = self;
          v32[5] = v24;
          id v33 = v26;
          [v27 fetchStateForPairedDeviceSubscriptionWithIdentifier:v24 callbackQueue:v28 completionHandler:v32];
        }
        id v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      id v21 = [v30 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v21);
  }
}

- (void)stopObservingStateForSubscriptionsWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 peer];
  id v6 = sub_10002B8F8(v5);

  unsigned __int8 v7 = [v4 identifiers];
  id v8 = sub_10002B188(v6, v7);

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v13);
        uint64_t v15 = [v4 peer];
        [(GEOMapSubscriptionsServer *)self _stopObservingStateForIdentifier:v14 fromPairedDevice:0 onBehalfOfPeer:v15];

        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v11);
  }

  id v16 = [v4 pairedDeviceIdentifiers];
  id v17 = sub_10002B188(v6, v16);

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v18 = v17;
  id v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v22);
        uint64_t v24 = objc_msgSend(v4, "peer", (void)v25);
        [(GEOMapSubscriptionsServer *)self _stopObservingStateForIdentifier:v23 fromPairedDevice:1 onBehalfOfPeer:v24];

        uint64_t v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }
}

- (id)_startObservingStateForIdentifier:(id)a3 fromPairedDevice:(BOOL)a4 onBehalfOfPeer:(id)a5
{
  BOOL v28 = a4;
  id v7 = a3;
  id v8 = a5;
  id v33 = self->_stateObserversLock;
  _geo_isolate_lock();
  id v9 = [(GEOMapSubscriptionsServer *)self daemon];
  id v10 = [v9 peers];
  unsigned __int8 v11 = [v10 containsObject:v8];

  if (v11)
  {
    stateObserverForPeer = self->_stateObserverForPeer;
    if (!stateObserverForPeer)
    {
      uint64_t v13 = +[NSMapTable strongToStrongObjectsMapTable];
      uint64_t v14 = self->_stateObserverForPeer;
      self->_stateObserverForPeer = v13;

      stateObserverForPeer = self->_stateObserverForPeer;
    }
    id v26 = [(NSMapTable *)stateObserverForPeer count];
    if (v28)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v15 = self->_stateObserverForPeer;
      id v16 = [(NSMapTable *)v15 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v30;
        while (2)
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v30 != v17) {
              objc_enumerationMutation(v15);
            }
            -[NSMapTable objectForKey:](self->_stateObserverForPeer, "objectForKey:", *(void *)(*((void *)&v29 + 1) + 8 * i), v26);
            id v19 = (id *)objc_claimAutoreleasedReturnValue();
            unsigned __int8 v20 = sub_10002ED08(v19, v7);

            if (v20)
            {
              int v21 = 0;
              goto LABEL_16;
            }
          }
          id v16 = [(NSMapTable *)v15 countByEnumeratingWithState:&v29 objects:v34 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
      int v21 = 1;
LABEL_16:
    }
    else
    {
      int v21 = 0;
    }
    uint64_t v22 = -[NSMapTable objectForKey:](self->_stateObserverForPeer, "objectForKey:", v8, v26);
    if (!v22)
    {
      uint64_t v22 = sub_10002ED8C([_GEOMapSubscriptionStateObserverHelper alloc], v8);
      [(NSMapTable *)self->_stateObserverForPeer setObject:v22 forKey:v8];
    }
    if (v28) {
      sub_10002EE14((uint64_t)v22, v7);
    }
    else {
      sub_10002EEC4((uint64_t)v22, v7);
    }
    if (!v27)
    {
      uint64_t v23 = +[GEOMapDataSubscriptionManager sharedManager];
      [v23 _addStateObserver:self];
    }
    if (v21)
    {
      uint64_t v24 = +[GEOMapDataSubscriptionManager sharedManager];
      [v24 _addStateObserver:self forPairedDeviceSubscriptionWithIdentifier:v7];
    }
  }
  else
  {
    uint64_t v22 = 0;
  }
  _geo_isolate_unlock();

  return v22;
}

- (void)_stopObservingStateForIdentifier:(id)a3 fromPairedDevice:(BOOL)a4 onBehalfOfPeer:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  long long v25 = self->_stateObserversLock;
  _geo_isolate_lock();
  unsigned __int8 v20 = v9;
  id v10 = [(NSMapTable *)self->_stateObserverForPeer objectForKey:v9];
  unsigned __int8 v11 = v10;
  if (v10)
  {
    if (v6) {
      sub_10002F22C(v10, v8);
    }
    else {
      sub_10002F37C(v10, v8);
    }
    if ((sub_10002F4CC((uint64_t)v11) & 1) == 0)
    {
      uint64_t v12 = GEOGetSubscriptionsLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v28 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Removed final observer for peer %{public}@", buf, 0xCu);
      }

      [(NSMapTable *)self->_stateObserverForPeer removeObjectForKey:v9];
    }
    if (![(NSMapTable *)self->_stateObserverForPeer count])
    {
      uint64_t v13 = +[GEOMapDataSubscriptionManager sharedManager];
      [v13 _removeStateObserver:self];
    }
    if (v6)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v14 = self->_stateObserverForPeer;
      id v15 = [(NSMapTable *)v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v22;
LABEL_14:
        uint64_t v17 = 0;
        while (1)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v14);
          }
          id v18 = [(NSMapTable *)self->_stateObserverForPeer objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * v17)];
          unsigned __int8 v19 = sub_10002ED08(v18, v8);

          if (v19) {
            break;
          }
          if (v15 == (id)++v17)
          {
            id v15 = [(NSMapTable *)v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
            if (v15) {
              goto LABEL_14;
            }
            goto LABEL_20;
          }
        }
      }
      else
      {
LABEL_20:

        uint64_t v14 = +[GEOMapDataSubscriptionManager sharedManager];
        [(NSMapTable *)v14 _removeStateObserver:self forPairedDeviceSubscriptionWithIdentifier:v8];
      }
    }
  }

  _geo_isolate_unlock();
}

- (void)subscriptionManager:(id)a3 didUpdateState:(id)a4 forIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_10002D4FC;
  id v15 = sub_10002D50C;
  id v16 = 0;
  geo_isolate_sync_data();
  -[GEOMapSubscriptionsServer broadcastState:forIdentifier:fromPairedDevice:toObservers:](self, "broadcastState:forIdentifier:fromPairedDevice:toObservers:", v9, v10, 0, v12[5], _NSConcreteStackBlock, 3221225472, sub_10002F718, &unk_1000714B8, self, &v11);
  _Block_object_dispose(&v11, 8);
}

- (void)subscriptionManager:(id)a3 didUpdatePairedDeviceState:(id)a4 forIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_10002D4FC;
  id v15 = sub_10002D50C;
  id v16 = 0;
  geo_isolate_sync_data();
  -[GEOMapSubscriptionsServer broadcastState:forIdentifier:fromPairedDevice:toObservers:](self, "broadcastState:forIdentifier:fromPairedDevice:toObservers:", v9, v10, 1, v12[5], _NSConcreteStackBlock, 3221225472, sub_10002F8D4, &unk_1000714B8, self, &v11);
  _Block_object_dispose(&v11, 8);
}

- (void)broadcastState:(id)a3 forIdentifier:(id)a4 fromPairedDevice:(BOOL)a5 toObservers:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if ([v11 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v11;
    id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if (v7) {
            sub_10002FA98(v17, v9, v10);
          }
          else {
            sub_10002FBE8(v17, v9, v10);
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
}

- (void)configureSubscriptionShouldSyncWithPairedDeviceMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasIdentifier])
  {
    id v8 = +[GEOMapDataSubscriptionManager sharedManager];
    id v9 = [v6 identifier];
    id v10 = [v6 shouldSyncToPairedDevice];
    queue = self->_queue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002FF2C;
    v16[3] = &unk_100072630;
    id v12 = &v17;
    id v17 = v7;
    id v13 = v7;
    [v8 setSubscriptionWithIdentifier:v9 shouldSyncToPairedDevice:v10 callbackQueue:queue completionHandler:v16];
  }
  else
  {
    id v14 = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002FEC0;
    block[3] = &unk_1000714E0;
    id v12 = &v19;
    id v19 = v7;
    id v15 = v7;
    dispatch_async(v14, block);
  }
}

- (void)setSubscriptionStateSummaryWithPairedDeviceMessage:(id)a3
{
  id v4 = a3;
  id v5 = +[GEOMapDataSubscriptionManager sharedManager];
  [v5 _setPairedDeviceSubscriptionsSummary:v4 callbackQueue:self->_queue completionHandler:&stru_100072670];
}

- (void)updateSubscriptionStateWithPairedDeviceMessage:(id)a3
{
  id v4 = a3;
  id v5 = +[GEOMapDataSubscriptionManager sharedManager];
  [v5 _handlePairedDeviceStateUpdate:v4 callbackQueue:self->_queue completionHandler:&stru_100072690];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeEstimationPendingRequests, 0);
  objc_storeStrong((id *)&self->_sizeEstimationRequestsIsolation, 0);
  objc_storeStrong((id *)&self->_stateObserverForPeer, 0);
  objc_storeStrong((id *)&self->_stateObserversLock, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end