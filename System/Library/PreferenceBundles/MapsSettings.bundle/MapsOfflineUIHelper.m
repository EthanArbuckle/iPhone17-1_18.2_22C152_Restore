@interface MapsOfflineUIHelper
+ (MapsOfflineUIHelper)sharedHelper;
+ (int64_t)idealDisplayAspectRatio:(id)a3;
- (BOOL)_isRegionDownloaded:(id)a3 requireFullyDownloaded:(BOOL)a4 coverageRequirement:(double)a5 forSubscriptionInfos:(id)a6;
- (BOOL)hasExpiredSubscriptions;
- (BOOL)hasFullyLoadedSubscriptions;
- (BOOL)hasSubscriptionsBeingUpdated;
- (BOOL)hasSubscriptionsNeedingUpdate;
- (BOOL)isRegionDownloaded:(id)a3 requireFullyDownloaded:(BOOL)a4;
- (BOOL)isRegionDownloaded:(id)a3 requireFullyDownloaded:(BOOL)a4 coverageRequirement:(double)a5;
- (BOOL)isUsingForcedOfflineMaps;
- (BOOL)isUsingOfflineMaps;
- (GEOMapDataSubscriptionManager)subscriptionManager;
- (MapsOfflineUIHelper)init;
- (NSArray)subscriptionInfos;
- (NSArray)subscriptions;
- (NSDate)lastUpdatedDate;
- (NSDate)lastUpdatedDateForPairedDevice;
- (NSMutableSet)updatingSubscriptions;
- (NSNumber)availableDiskSpaceForPairedDevice;
- (id)_subscriptionInfoForRegion:(id)a3 requireContainment:(BOOL)a4 fromSubscriptionInfos:(id)a5;
- (id)determineEstimatedSizeForSubscriptionWithRegion:(id)a3 completionHandler:(id)a4;
- (id)subscriptionInfoForRegion:(id)a3;
- (id)subscriptionInfoForRegion:(id)a3 requireContainment:(BOOL)a4;
- (int64_t)cellularBehaviorForDownloadOfSize:(int64_t)a3 forForcedDownload:(BOOL)a4;
- (int64_t)pairedDeviceSubscriptionStatesMonitorCount;
- (unint64_t)expiredSubscriptionsCount;
- (unint64_t)fullyLoadedSubscriptionsCount;
- (unint64_t)outOfDateSubscriptionsCount;
- (unint64_t)totalOfflineDataSize;
- (void)_commonInit;
- (void)_offlineServiceStateChanged;
- (void)_postSubscriptionsDidChangeNotification;
- (void)_reloadLastUpdatedDates;
- (void)_reloadPairedDeviceSubscriptionInfos;
- (void)_reloadSubscriptionInfosWithCompletion:(id)a3;
- (void)_reloadSubscriptions;
- (void)_startedUpdatingSubscription:(id)a3;
- (void)_stoppedUpdatingSubscription:(id)a3;
- (void)_subscriptionsDidChange;
- (void)_updateExpiredSubscriptionsCount;
- (void)_updateTotalDataSize;
- (void)_updateUsingOfflineMaps;
- (void)addKVOForSubscriptionInfo:(id)a3;
- (void)addObserver:(id)a3;
- (void)addSubscriptionWithRegion:(id)a3 name:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)forceUpdateAllSubscriptionsWithMode:(unint64_t)a3;
- (void)getAvailableDiskSpaceForPairedDeviceWithCompletionHandler:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseDownloadForSubscriptionInfo:(id)a3;
- (void)removeKVOForSubscriptionInfo:(id)a3;
- (void)removeObserver:(id)a3;
- (void)restoreExpiredSubscription:(id)a3 completionHandler:(id)a4;
- (void)resumeDownloadForSubscriptionInfo:(id)a3 mode:(unint64_t)a4;
- (void)resumeDownloadForSubscriptionWithIdentifier:(id)a3 mode:(unint64_t)a4;
- (void)setAvailableDiskSpaceForPairedDevice:(id)a3;
- (void)setExpiredSubscriptionsCount:(unint64_t)a3;
- (void)setFullyLoadedSubscriptionsCount:(unint64_t)a3;
- (void)setOutOfDateSubscriptionsCount:(unint64_t)a3;
- (void)setPairedDeviceSubscriptionStatesMonitorCount:(int64_t)a3;
- (void)setSubscriptionInfo:(id)a3 shouldSyncToPairedDevice:(BOOL)a4 completionHandler:(id)a5;
- (void)setSubscriptionInfos:(id)a3;
- (void)setSubscriptionManager:(id)a3;
- (void)setSubscriptions:(id)a3;
- (void)setTotalOfflineDataSize:(unint64_t)a3;
- (void)setUpdatingSubscriptions:(id)a3;
- (void)setUsingOfflineMaps:(BOOL)a3;
- (void)startMonitoringPairedDeviceSubscriptionStates;
- (void)stopMonitoringPairedDeviceSubscriptionStates;
- (void)updateName:(id)a3 forSubscriptionInfo:(id)a4 completion:(id)a5;
- (void)updateRegion:(id)a3 forSubscriptionInfo:(id)a4 completion:(id)a5;
@end

@implementation MapsOfflineUIHelper

+ (int64_t)idealDisplayAspectRatio:(id)a3
{
  GEOMapRectForMapRegion();
  double v5 = v3 / v4;
  GEOConfigGetDouble();
  if (v5 > v6) {
    return 2;
  }
  GEOConfigGetDouble();
  return v5 < v8;
}

+ (MapsOfflineUIHelper)sharedHelper
{
  if (qword_8E318 != -1) {
    dispatch_once(&qword_8E318, &stru_72B40);
  }
  v2 = (void *)qword_8E310;

  return (MapsOfflineUIHelper *)v2;
}

- (MapsOfflineUIHelper)init
{
  v5.receiver = self;
  v5.super_class = (Class)MapsOfflineUIHelper;
  v2 = [(MapsOfflineUIHelper *)&v5 init];
  double v3 = v2;
  if (v2) {
    [(MapsOfflineUIHelper *)v2 _commonInit];
  }
  return v3;
}

- (void)_commonInit
{
  double v3 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___MapsOfflineUIObserver queue:&_dispatch_main_q];
  observers = self->_observers;
  self->_observers = v3;

  objc_super v5 = +[GEOOfflineService shared];
  self->_usingOfflineMaps = [v5 isUsingOffline];

  id v6 = objc_alloc_init((Class)GEOMapDataSubscriptionManager);
  [(MapsOfflineUIHelper *)self setSubscriptionManager:v6];

  v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"_offlineServiceStateChanged" name:GEOOfflineStateChangedNotification object:0];

  objc_initWeak(&location, self);
  double v8 = (const char *)GEOMapDataSubscriptionManagerSubscriptionsDidChangeDarwinNotification;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_33FE4;
  handler[3] = &unk_72B68;
  objc_copyWeak(&v19, &location);
  notify_register_dispatch(v8, &self->_subscriptionsChangedNotifyToken, (dispatch_queue_t)&_dispatch_main_q, handler);

  [(MapsOfflineUIHelper *)self _reloadSubscriptions];
  v9 = (const char *)GEOOfflineDataActiveVersionsDidChangeDarwinNotification;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_34028;
  v16[3] = &unk_72B68;
  objc_copyWeak(&v17, &location);
  notify_register_dispatch(v9, &self->_activeVersionsChangedNotifyToken, (dispatch_queue_t)&_dispatch_main_q, v16);

  v10 = (const char *)GEOMapDataSubscriptionManagerPairedDeviceOfflineLastUpdatedDateDidChangeDarwinNotification;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_3406C;
  v14[3] = &unk_72B68;
  objc_copyWeak(&v15, &location);
  notify_register_dispatch(v10, &self->_pairedDeviceLastUpdatedChangedNotifyToken, (dispatch_queue_t)&_dispatch_main_q, v14);

  [(MapsOfflineUIHelper *)self _reloadLastUpdatedDates];
  v11 = (const char *)GEOMapDataSubscriptionManagerPairedDeviceSubscriptionsDidChangeDarwinNotification;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_340B0;
  v12[3] = &unk_72B68;
  objc_copyWeak(&v13, &location);
  notify_register_dispatch(v11, &self->_pairedDeviceSubscriptionsChangedNotifyToken, (dispatch_queue_t)&_dispatch_main_q, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  notify_cancel(self->_subscriptionsChangedNotifyToken);
  self->_subscriptionsChangedNotifyToken = -1;
  notify_cancel(self->_activeVersionsChangedNotifyToken);
  self->_activeVersionsChangedNotifyToken = -1;
  notify_cancel(self->_pairedDeviceLastUpdatedChangedNotifyToken);
  self->_pairedDeviceLastUpdatedChangedNotifyToken = -1;
  notify_cancel(self->_pairedDeviceSubscriptionsChangedNotifyToken);
  self->_pairedDeviceSubscriptionsChangedNotifyToken = -1;
  v3.receiver = self;
  v3.super_class = (Class)MapsOfflineUIHelper;
  [(MapsOfflineUIHelper *)&v3 dealloc];
}

- (void)setUsingOfflineMaps:(BOOL)a3
{
  BOOL usingOfflineMaps = self->_usingOfflineMaps;
  if (usingOfflineMaps != a3)
  {
    self->_BOOL usingOfflineMaps = a3;
    objc_super v5 = MAPSGetOfflineLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (usingOfflineMaps) {
        id v6 = @"YES";
      }
      else {
        id v6 = @"NO";
      }
      v7 = v6;
      if (self->_usingOfflineMaps) {
        double v8 = @"YES";
      }
      else {
        double v8 = @"NO";
      }
      v9 = v8;
      int v11 = 138543618;
      v12 = v7;
      __int16 v13 = 2114;
      v14 = v9;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "[MapsOfflineUIHelper] posting UsingOfflineMapsStateChangedNotification, wasUsingOfflineMaps: %{public}@, isUsingOfflineMaps: %{public}@", (uint8_t *)&v11, 0x16u);
    }
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:@"UsingOfflineMapsStateChangedNotification" object:self];
  }
}

- (void)_updateUsingOfflineMaps
{
  objc_super v3 = +[GEOOfflineService shared];
  id v4 = [v3 isUsingOffline];

  [(MapsOfflineUIHelper *)self setUsingOfflineMaps:v4];
}

- (void)_offlineServiceStateChanged
{
}

- (BOOL)isUsingForcedOfflineMaps
{
  v2 = +[GEOOfflineService shared];
  unsigned __int16 v3 = (unsigned __int16)[v2 state];
  int v4 = v3;
  if (v3 < 2u) {
    goto LABEL_9;
  }
  if (v3 != 2)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      goto LABEL_9;
    }
    int v10 = 67109120;
    int v11 = v4;
    double v8 = "Unreachable reached: invalid offline mode value %x";
    goto LABEL_12;
  }
  int v5 = HIBYTE(v3);
  if (HIBYTE(v3) >= 3u)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
LABEL_9:
      BOOL v6 = 0;
      goto LABEL_10;
    }
    int v10 = 67109120;
    int v11 = v5;
    double v8 = "Unreachable reached: invalid offline reason value %x";
LABEL_12:
    _os_log_fault_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v10, 8u);
    goto LABEL_9;
  }
  BOOL v6 = (v3 & 0x700) == 512;
LABEL_10:

  return v6;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)addSubscriptionWithRegion:(id)a3 name:(id)a4 completion:(id)a5
{
  id v31 = a3;
  id v8 = a4;
  id v30 = a5;
  id v32 = v8;
  unint64_t v9 = 1;
LABEL_2:
  if (v9 <= 1)
  {
    id v12 = v32;
  }
  else
  {
    int v10 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    int v11 = [v10 localizedStringForKey:@"OFFLINE_REGION_NAME_DUPLICATE_FORMAT" value:@"localized string not found" table:@"Offline"];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v32, v9);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  __int16 v13 = [(MapsOfflineUIHelper *)self subscriptions];
  id v14 = [v13 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v37;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v19 = [v18 displayName];
        if (v19)
        {
          v20 = (void *)v19;
          v21 = [v18 displayName];
          unsigned __int8 v22 = [v21 isEqualToString:v12];

          if (v22)
          {

            ++v9;
            goto LABEL_2;
          }
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  if (([v12 isEqualToString:v32] & 1) == 0)
  {
    v23 = MAPSGetOfflineLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138478083;
      id v41 = v32;
      __int16 v42 = 2113;
      id v43 = v12;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "A region already exists with the name '%{private}@'. Using '%{private}@' instead", buf, 0x16u);
    }
  }
  v24 = +[NSUUID UUID];
  v25 = [v24 UUIDString];
  v26 = +[NSString stringWithFormat:@"%@%@", @"com.apple.Maps.offline.", v25];

  v27 = [(MapsOfflineUIHelper *)self subscriptionManager];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_347F4;
  v33[3] = &unk_72B90;
  id v34 = v26;
  id v35 = v30;
  id v28 = v26;
  id v29 = v30;
  [v27 addSubscriptionWithIdentifier:v28 dataTypes:1024 policy:1 region:v31 displayName:v12 expirationDate:0 callbackQueue:&_dispatch_main_q completionHandler:v33];
}

- (void)pauseDownloadForSubscriptionInfo:(id)a3
{
  id v4 = a3;
  id v7 = [(MapsOfflineUIHelper *)self subscriptionManager];
  int v5 = [v4 subscription];

  BOOL v6 = [v5 identifier];
  [v7 cancelDownloadForSubscriptionIdentifier:v6];
}

- (void)resumeDownloadForSubscriptionInfo:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  id v9 = [(MapsOfflineUIHelper *)self subscriptionManager];
  id v7 = [v6 subscription];

  id v8 = [v7 identifier];
  [v9 startDownloadForSubscriptionIdentifier:v8 mode:a4];
}

- (void)resumeDownloadForSubscriptionWithIdentifier:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(MapsOfflineUIHelper *)self subscriptionManager];
  [v7 startDownloadForSubscriptionIdentifier:v6 mode:a4];
}

- (void)restoreExpiredSubscription:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MapsOfflineUIHelper *)self subscriptionManager];
  id v9 = [v6 identifier];
  id v10 = [v6 dataTypes];
  id v11 = [v6 policy];
  id v12 = [v6 region];
  __int16 v13 = [v6 displayName];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_34B18;
  v16[3] = &unk_72B90;
  id v17 = v6;
  id v18 = v7;
  id v14 = v7;
  id v15 = v6;
  [v8 addSubscriptionWithIdentifier:v9 dataTypes:v10 policy:v11 region:v12 displayName:v13 expirationDate:0 callbackQueue:&_dispatch_main_q completionHandler:v16];
}

- (void)updateRegion:(id)a3 forSubscriptionInfo:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v16 = [a4 subscription];
  id v10 = [(MapsOfflineUIHelper *)self subscriptionManager];
  id v11 = [v16 identifier];
  id v12 = [v16 dataTypes];
  id v13 = [v16 policy];
  id v14 = [v16 displayName];
  id v15 = [v16 expirationDate];
  [v10 addSubscriptionWithIdentifier:v11 dataTypes:v12 policy:v13 region:v9 displayName:v14 expirationDate:v15 callbackQueue:&_dispatch_main_q completionHandler:v8];
}

- (void)updateName:(id)a3 forSubscriptionInfo:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v16 = [a4 subscription];
  id v10 = [(MapsOfflineUIHelper *)self subscriptionManager];
  id v11 = [v16 identifier];
  id v12 = [v16 dataTypes];
  id v13 = [v16 policy];
  id v14 = [v16 region];
  id v15 = [v16 expirationDate];
  [v10 addSubscriptionWithIdentifier:v11 dataTypes:v12 policy:v13 region:v14 displayName:v9 expirationDate:v15 callbackQueue:&_dispatch_main_q completionHandler:v8];
}

- (id)determineEstimatedSizeForSubscriptionWithRegion:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MapsOfflineUIHelper *)self subscriptionManager];
  id v9 = [v8 determineEstimatedSizeForSubscriptionWithRegion:v7 dataTypes:1024 queue:&_dispatch_main_q completionHandler:v6];

  return v9;
}

- (void)getAvailableDiskSpaceForPairedDeviceWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  int v5 = [(MapsOfflineUIHelper *)self availableDiskSpaceForPairedDevice];

  if (v5)
  {
    id v6 = [(MapsOfflineUIHelper *)self availableDiskSpaceForPairedDevice];
    v4[2](v4, [v6 longLongValue], 0);
  }
  else
  {
    objc_initWeak(&location, self);
    id v7 = [(MapsOfflineUIHelper *)self subscriptionManager];
    id v8 = &_dispatch_main_q;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_35038;
    v9[3] = &unk_72BB8;
    id v10 = v4;
    objc_copyWeak(&v11, &location);
    [v7 fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue:&_dispatch_main_q completionHandler:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_subscriptionsDidChange
{
  observers = self->_observers;
  id v4 = [(MapsOfflineUIHelper *)self subscriptionInfos];
  [(GEOObserverHashTable *)observers subscriptionInfosDidChange:v4];

  [(MapsOfflineUIHelper *)self _postSubscriptionsDidChangeNotification];
}

- (void)_postSubscriptionsDidChangeNotification
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"OfflineMapsSubscriptionsDidChangeNotification" object:self];
}

- (void)setOutOfDateSubscriptionsCount:(unint64_t)a3
{
  unint64_t outOfDateSubscriptionsCount = self->_outOfDateSubscriptionsCount;
  if (outOfDateSubscriptionsCount != a3)
  {
    self->_unint64_t outOfDateSubscriptionsCount = a3;
    if ((a3 != 0) == (outOfDateSubscriptionsCount == 0)) {
      [(GEOObserverHashTable *)self->_observers subscriptionsNeedUpdatingDidChange:a3 != 0];
    }
  }
}

- (void)setFullyLoadedSubscriptionsCount:(unint64_t)a3
{
  unint64_t fullyLoadedSubscriptionsCount = self->_fullyLoadedSubscriptionsCount;
  if (fullyLoadedSubscriptionsCount != a3)
  {
    self->_unint64_t fullyLoadedSubscriptionsCount = a3;
    if ((a3 != 0) == (fullyLoadedSubscriptionsCount == 0)) {
      [(GEOObserverHashTable *)self->_observers hasFullyLoadedSubscriptionsDidChange:a3 != 0];
    }
  }
}

- (BOOL)hasFullyLoadedSubscriptions
{
  return self->_fullyLoadedSubscriptionsCount != 0;
}

- (BOOL)hasSubscriptionsNeedingUpdate
{
  return self->_outOfDateSubscriptionsCount != 0;
}

- (void)_startedUpdatingSubscription:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    if (!self->_updatingSubscriptions)
    {
      id v4 = +[NSMutableSet set];
      updatingSubscriptions = self->_updatingSubscriptions;
      self->_updatingSubscriptions = v4;
    }
    unsigned int v6 = [(MapsOfflineUIHelper *)self hasSubscriptionsBeingUpdated];
    [(NSMutableSet *)self->_updatingSubscriptions addObject:v8];
    BOOL v7 = [(MapsOfflineUIHelper *)self hasSubscriptionsBeingUpdated];
    if (v6 != v7) {
      [(GEOObserverHashTable *)self->_observers subscriptionsBeingUpdatedDidChange:v7];
    }
  }
}

- (void)_stoppedUpdatingSubscription:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    unsigned int v4 = [(MapsOfflineUIHelper *)self hasSubscriptionsBeingUpdated];
    [(NSMutableSet *)self->_updatingSubscriptions removeObject:v6];
    BOOL v5 = [(MapsOfflineUIHelper *)self hasSubscriptionsBeingUpdated];
    if (v4 != v5)
    {
      [(GEOObserverHashTable *)self->_observers subscriptionsBeingUpdatedDidChange:v5];
      [(MapsOfflineUIHelper *)self _updateTotalDataSize];
    }
  }
}

- (void)setUpdatingSubscriptions:(id)a3
{
  BOOL v7 = (NSMutableSet *)a3;
  if (self->_updatingSubscriptions != v7 && (-[NSMutableSet isEqual:](v7, "isEqual:") & 1) == 0)
  {
    unsigned int v5 = [(MapsOfflineUIHelper *)self hasSubscriptionsBeingUpdated];
    objc_storeStrong((id *)&self->_updatingSubscriptions, a3);
    BOOL v6 = [(MapsOfflineUIHelper *)self hasSubscriptionsBeingUpdated];
    if (v5 != v6) {
      [(GEOObserverHashTable *)self->_observers subscriptionsBeingUpdatedDidChange:v6];
    }
  }
}

- (BOOL)hasSubscriptionsBeingUpdated
{
  return [(NSMutableSet *)self->_updatingSubscriptions count] != 0;
}

- (void)forceUpdateAllSubscriptionsWithMode:(unint64_t)a3
{
  id v4 = [(MapsOfflineUIHelper *)self subscriptionManager];
  [v4 forceUpdateForUserInitiatedSubscriptionsForDataType:1024 mode:a3];
}

- (void)_reloadLastUpdatedDates
{
  objc_initWeak(&location, self);
  id v3 = [(MapsOfflineUIHelper *)self subscriptionManager];
  id v4 = &_dispatch_main_q;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_3563C;
  v8[3] = &unk_72BE0;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  [v3 fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue:&_dispatch_main_q completionHandler:v8];

  unsigned int v5 = [(MapsOfflineUIHelper *)self subscriptionManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_3574C;
  v6[3] = &unk_72BE0;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  [v5 fetchLastUpdatedDateForOfflineSubscriptionsWithQueue:&_dispatch_main_q completionHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_reloadSubscriptions
{
  [(MapsOfflineUIHelper *)self _reloadSubscriptionInfosWithCompletion:0];
  [(MapsOfflineUIHelper *)self _updateExpiredSubscriptionsCount];

  [(MapsOfflineUIHelper *)self _updateTotalDataSize];
}

- (void)_reloadSubscriptionInfosWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  unsigned int v5 = +[NSString stringWithFormat:@"%@*", @"com.apple.Maps.offline."];
  BOOL v6 = [(MapsOfflineUIHelper *)self subscriptionManager];
  id v14 = v5;
  id v7 = +[NSArray arrayWithObjects:&v14 count:1];
  id v8 = &_dispatch_main_q;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_35A54;
  v10[3] = &unk_72C98;
  objc_copyWeak(&v12, &location);
  id v9 = v4;
  v10[4] = self;
  id v11 = v9;
  [v6 fetchSubscriptionsWithIdentifiers:v7 callbackQueue:&_dispatch_main_q completionHandler:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_updateExpiredSubscriptionsCount
{
  objc_initWeak(&location, self);
  id v3 = [(MapsOfflineUIHelper *)self subscriptionManager];
  id v4 = &_dispatch_main_q;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_36508;
  v5[3] = &unk_72700;
  objc_copyWeak(&v6, &location);
  [v3 fetchAllExpiredSubscriptionsWithCallbackQueue:&_dispatch_main_q completionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (BOOL)hasExpiredSubscriptions
{
  return [(MapsOfflineUIHelper *)self expiredSubscriptionsCount] != 0;
}

- (void)_updateTotalDataSize
{
  objc_initWeak(&location, self);
  id v3 = [(MapsOfflineUIHelper *)self subscriptionManager];
  id v4 = &_dispatch_main_q;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_3669C;
  v5[3] = &unk_72CC0;
  objc_copyWeak(&v6, &location);
  [v3 _calculateTotalSizeOfOfflineSubscriptionsWithCallbackQueue:&_dispatch_main_q completionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)setSubscriptionInfos:(id)a3
{
  id v4 = (NSArray *)a3;
  subscriptionInfos = self->_subscriptionInfos;
  if (subscriptionInfos != v4)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = subscriptionInfos;
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          [(MapsOfflineUIHelper *)self removeKVOForSubscriptionInfo:*(void *)(*((void *)&v22 + 1) + 8 * (void)v10)];
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v8);
    }

    id v11 = (NSArray *)[(NSArray *)v4 copy];
    id v12 = self->_subscriptionInfos;
    self->_subscriptionInfos = v11;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v13 = self->_subscriptionInfos;
    id v14 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        id v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          -[MapsOfflineUIHelper addKVOForSubscriptionInfo:](self, "addKVOForSubscriptionInfo:", *(void *)(*((void *)&v18 + 1) + 8 * (void)v17), (void)v18);
          id v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v15);
    }
  }
}

- (void)startMonitoringPairedDeviceSubscriptionStates
{
  id v3 = (char *)[(MapsOfflineUIHelper *)self pairedDeviceSubscriptionStatesMonitorCount]+ 1;

  [(MapsOfflineUIHelper *)self setPairedDeviceSubscriptionStatesMonitorCount:v3];
}

- (void)stopMonitoringPairedDeviceSubscriptionStates
{
  id v3 = (char *)[(MapsOfflineUIHelper *)self pairedDeviceSubscriptionStatesMonitorCount]- 1;

  [(MapsOfflineUIHelper *)self setPairedDeviceSubscriptionStatesMonitorCount:v3];
}

- (void)setPairedDeviceSubscriptionStatesMonitorCount:(int64_t)a3
{
  if (a3 < 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: count >= 0", buf, 2u);
    }
  }
  else
  {
    int64_t pairedDeviceSubscriptionStatesMonitorCount = self->_pairedDeviceSubscriptionStatesMonitorCount;
    if (pairedDeviceSubscriptionStatesMonitorCount != a3)
    {
      self->_int64_t pairedDeviceSubscriptionStatesMonitorCount = a3;
      if ((a3 != 0) == pairedDeviceSubscriptionStatesMonitorCount < 1)
      {
        id v6 = MAPSGetOfflineLog();
        BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
        if (a3)
        {
          if (v7)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEBUG, "[MapsOfflineUIHelper] start monitoring paired device subscription states", buf, 2u);
          }

          [(MapsOfflineUIHelper *)self _reloadPairedDeviceSubscriptionInfos];
        }
        else
        {
          if (v7)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEBUG, "[MapsOfflineUIHelper] stop monitoring paired device subscription states", buf, 2u);
          }

          long long v15 = 0u;
          long long v16 = 0u;
          long long v13 = 0u;
          long long v14 = 0u;
          id v8 = self->_subscriptionInfos;
          id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v14;
            do
            {
              id v12 = 0;
              do
              {
                if (*(void *)v14 != v11) {
                  objc_enumerationMutation(v8);
                }
                objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v12), "setPairedDeviceState:", 0, (void)v13);
                id v12 = (char *)v12 + 1;
              }
              while (v10 != v12);
              id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
            }
            while (v10);
          }
        }
      }
    }
  }
}

- (void)_reloadPairedDeviceSubscriptionInfos
{
  objc_initWeak(&location, self);
  id v3 = [(MapsOfflineUIHelper *)self subscriptionManager];
  id v4 = &_dispatch_main_q;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_36C20;
  v5[3] = &unk_72D10;
  objc_copyWeak(&v6, &location);
  void v5[4] = self;
  [v3 fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:&_dispatch_main_q completionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)setSubscriptionInfo:(id)a3 shouldSyncToPairedDevice:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v12 = [(MapsOfflineUIHelper *)self subscriptionManager];
  id v10 = [v9 subscription];

  uint64_t v11 = [v10 identifier];
  [v12 setSubscriptionWithIdentifier:v11 shouldSyncToPairedDevice:v5 callbackQueue:&_dispatch_main_q completionHandler:v8];
}

- (void)addKVOForSubscriptionInfo:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  if (qword_8E320 != -1) {
    dispatch_once(&qword_8E320, &stru_72D58);
  }
  id v5 = (id)qword_8E328;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v4, "state", (void)v12);
        [v11 addObserver:self forKeyPath:v10 options:3 context:off_8DC38];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)removeKVOForSubscriptionInfo:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  if (qword_8E320 != -1) {
    dispatch_once(&qword_8E320, &stru_72D58);
  }
  id v5 = (id)qword_8E328;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v4, "state", (void)v12);
        [v11 removeObserver:self forKeyPath:v10 context:off_8DC38];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_8DC38 != a6) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  if (qword_8E320 != -1) {
    dispatch_once(&qword_8E320, &stru_72D58);
  }
  if ([(id)qword_8E328 containsObject:v10])
  {
    id v13 = [v12 copy];
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_37690;
    block[3] = &unk_72D38;
    objc_copyWeak(&v22, &location);
    id v17 = v11;
    id v18 = v10;
    id v19 = v12;
    id v20 = v13;
    long long v21 = self;
    id v14 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
LABEL_7:
    v15.receiver = self;
    v15.super_class = (Class)MapsOfflineUIHelper;
    [(MapsOfflineUIHelper *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (BOOL)isRegionDownloaded:(id)a3 requireFullyDownloaded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  GEOConfigGetDouble();
  LOBYTE(v4) = -[MapsOfflineUIHelper isRegionDownloaded:requireFullyDownloaded:coverageRequirement:](self, "isRegionDownloaded:requireFullyDownloaded:coverageRequirement:", v6, v4);

  return v4;
}

- (BOOL)isRegionDownloaded:(id)a3 requireFullyDownloaded:(BOOL)a4 coverageRequirement:(double)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(MapsOfflineUIHelper *)self subscriptionInfos];
  LOBYTE(v6) = [(MapsOfflineUIHelper *)self _isRegionDownloaded:v8 requireFullyDownloaded:v6 coverageRequirement:v9 forSubscriptionInfos:a5];

  return v6;
}

- (BOOL)_isRegionDownloaded:(id)a3 requireFullyDownloaded:(BOOL)a4 coverageRequirement:(double)a5 forSubscriptionInfos:(id)a6
{
  BOOL v7 = a4;
  id v8 = a6;
  GEOMapRectForMapRegion();
  id v9 = +[NSMutableArray array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_super v15 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v14);
        if (!v7
          || (objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * (void)v14), "state", (void)v31),
              long long v16 = objc_claimAutoreleasedReturnValue(),
              id v17 = [v16 loadState],
              v16,
              v17))
        {
          id v18 = objc_msgSend(v15, "subscription", (void)v31);
          id v19 = [v18 region];
          [v9 addObject:v19];
        }
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v12);
  }

  id v20 = malloc_type_malloc(32 * (void)[v9 count], 0x1000040E0EAB150uLL);
  if ([v9 count])
  {
    unint64_t v21 = 0;
    id v22 = v20 + 2;
    do
    {
      long long v23 = objc_msgSend(v9, "objectAtIndexedSubscript:", v21, (void)v31);
      GEOMapRectForMapRegion();
      *(v22 - 2) = v24;
      *(v22 - 1) = v25;
      *id v22 = v26;
      v22[1] = v27;
      v22 += 4;

      ++v21;
    }
    while (v21 < (unint64_t)[v9 count]);
  }
  objc_msgSend(v9, "count", (void)v31);
  GEOMapRectFractionCoveredByMapRects();
  double v29 = v28;
  free(v20);

  return v29 >= a5;
}

- (id)subscriptionInfoForRegion:(id)a3
{
  return [(MapsOfflineUIHelper *)self subscriptionInfoForRegion:a3 requireContainment:0];
}

- (id)subscriptionInfoForRegion:(id)a3 requireContainment:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(MapsOfflineUIHelper *)self isRegionDownloaded:v6 requireFullyDownloaded:0])
  {
    BOOL v7 = [(MapsOfflineUIHelper *)self subscriptionInfos];
    id v8 = [(MapsOfflineUIHelper *)self _subscriptionInfoForRegion:v6 requireContainment:v4 fromSubscriptionInfos:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_subscriptionInfoForRegion:(id)a3 requireContainment:(BOOL)a4 fromSubscriptionInfos:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  GEOMapRectForMapRegion();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    id v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v26;
    double v24 = 0.0;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_super v15 = [v14 subscription];
        long long v16 = [v15 region];
        GEOMapRectForMapRegion();

        GEOMapRectIntersection();
        double v18 = v17;
        double v20 = v19;
        if ((GEOMapRectIsNull() & 1) == 0)
        {
          double v21 = GEOMapRectIsEmpty() ? 1.0 : v18 * v20;
          if (v21 > v24)
          {
            id v22 = v14;

            id v11 = v22;
            double v24 = v21;
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (int64_t)cellularBehaviorForDownloadOfSize:(int64_t)a3 forForcedDownload:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = +[GEONetworkObserver sharedNetworkObserver];
  unsigned int v8 = [v7 isCellConnection];

  if (!v8) {
    return 0;
  }
  if ((GEOConfigGetBOOL() & 1) == 0) {
    return v4;
  }
  unsigned __int8 v9 = [(MapsOfflineUIHelper *)self hasSubscriptionsNeedingUpdate];
  int64_t result = 1;
  if ((a3 & 0x8000000000000000) == 0 && (v9 & 1) == 0)
  {
    if (GEOConfigGetUInteger() <= (unint64_t)a3) {
      return 1;
    }
    else {
      return 2;
    }
  }
  return result;
}

- (BOOL)isUsingOfflineMaps
{
  return self->_usingOfflineMaps;
}

- (NSArray)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
}

- (NSArray)subscriptionInfos
{
  return self->_subscriptionInfos;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (NSDate)lastUpdatedDateForPairedDevice
{
  return self->_lastUpdatedDateForPairedDevice;
}

- (unint64_t)totalOfflineDataSize
{
  return self->_totalOfflineDataSize;
}

- (void)setTotalOfflineDataSize:(unint64_t)a3
{
  self->_totalOfflineDataSize = a3;
}

- (GEOMapDataSubscriptionManager)subscriptionManager
{
  return self->_subscriptionManager;
}

- (void)setSubscriptionManager:(id)a3
{
}

- (unint64_t)outOfDateSubscriptionsCount
{
  return self->_outOfDateSubscriptionsCount;
}

- (unint64_t)fullyLoadedSubscriptionsCount
{
  return self->_fullyLoadedSubscriptionsCount;
}

- (NSMutableSet)updatingSubscriptions
{
  return self->_updatingSubscriptions;
}

- (unint64_t)expiredSubscriptionsCount
{
  return self->_expiredSubscriptionsCount;
}

- (void)setExpiredSubscriptionsCount:(unint64_t)a3
{
  self->_expiredSubscriptionsCount = a3;
}

- (NSNumber)availableDiskSpaceForPairedDevice
{
  return self->_availableDiskSpaceForPairedDevice;
}

- (void)setAvailableDiskSpaceForPairedDevice:(id)a3
{
}

- (int64_t)pairedDeviceSubscriptionStatesMonitorCount
{
  return self->_pairedDeviceSubscriptionStatesMonitorCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableDiskSpaceForPairedDevice, 0);
  objc_storeStrong((id *)&self->_updatingSubscriptions, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDateForPairedDevice, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_subscriptionInfos, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end