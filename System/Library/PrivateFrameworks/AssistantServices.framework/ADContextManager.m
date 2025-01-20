@interface ADContextManager
+ (BOOL)_isResumableFirstPartyBundleID:(id)a3;
+ (BOOL)_isResumableThirdPartyGenreID:(id)a3;
- (ADContextManager)initWithDelegate:(id)a3;
- (ADContextManagerDelegate)delegate;
- (ADLocalContextStore)localContextStore;
- (ADRemoteContextStore)remoteContextStore;
- (BOOL)_inlineUpdateCurrentHomeKitHome;
- (BOOL)_inlineUpdatePhoneState;
- (BOOL)_isCollectingContext;
- (BOOL)alertContextIsDirty;
- (BOOL)backgroundContextIsDirty;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_dispatch_queue)queue;
- (id)_alarmAceObjectFromAlarm:(id)a3 withProximity:(int64_t)a4 inDeviceContext:(id)a5;
- (id)_appInfoWithBundleID:(id)a3;
- (id)_configuredContextLink;
- (id)_configuredLocalContextStoreWithInstanceContext:(id)a3 rapportLink:(id)a4 queue:(id)a5;
- (id)_configuredRemoteContextStoreWithRapportLink:(id)a3 queue:(id)a4;
- (id)_contextLinkMessageOptions;
- (id)_dataSourceInfoWithProximity:(int64_t)a3 deviceContext:(id)a4;
- (id)_filteredApplicationInfosForLockedStark:(id)a3;
- (id)_initWithDelegate:(id)a3 deviceCircleManager:(id)a4 deviceProximityManager:(id)a5;
- (id)_makeUserTokenStatusWithICTokenStatus:(id)a3 icError:(id)a4;
- (id)_timerAceObjectFromTimer:(id)a3 withProximity:(int64_t)a4 inDeviceContext:(id)a5;
- (id)localContextWithPrivacyClass:(int64_t)a3;
- (void)_addDeviceContextConnection:(id)a3;
- (void)_callStateDidChange:(id)a3;
- (void)_cancelNowPlayingCoalescingTimer;
- (void)_enumerateDeviceContextConnectionsUsingBlock:(id)a3;
- (void)_fetchContextSnapshotForCurrentRequest;
- (void)_getBackgroundContext:(id)a3;
- (void)_getCurrentUserActivityOnQueue:(id)a3 completion:(id)a4;
- (void)_getDevicesWithContexts:(id)a3 passingTest:(id)a4 capabilitesPassingTest:(id)a5 completion:(id)a6;
- (void)_getNowPlayingMediaIsResumable:(id)a3;
- (void)_handleAggregateContextFetchWithMessage:(id)a3 fromDeviceWithPeerInfo:(id)a4 completion:(id)a5;
- (void)_handleContextSnapshotPush:(id)a3 completion:(id)a4;
- (void)_handleDeviceProblemsChangedWithToken:(int)a3;
- (void)_handleHomeAnnouncementSnapshotUpdate:(id)a3;
- (void)_handlePushContextMessage:(id)a3 fromDeviceWithPeerInfo:(id)a4 completion:(id)a5;
- (void)_initialize;
- (void)_logContextCollectorFetchEnded:(id)a3 numDeviceContextsFetched:(unint64_t)a4;
- (void)_logContextCollectorFetchFailed:(id)a3;
- (void)_logContextCollectorFetchStarted:(id)a3;
- (void)_logFetchLocalContextEnded:(id)a3;
- (void)_logFetchLocalContextStarted:(id)a3;
- (void)_logForceFetchContextEndedWithHALMetricsId:(id)a3 contextId:(id)a4 forceFetchCount:(unint64_t)a5;
- (void)_logForceFetchContextFailedWithHALMetricsId:(id)a3 contextId:(id)a4 error:(id)a5;
- (void)_logForceFetchContextStartedWithHALMetricsId:(id)a3 contextId:(id)a4 timestamp:(unint64_t)a5;
- (void)_logForceFetchWithStartTime:(unint64_t)a3 forceFetchCount:(unint64_t)a4 forceFetchError:(id)a5 halMetricsId:(id)a6;
- (void)_playbackDevicesDidChange:(id)a3;
- (void)_reallyUpdateBackgroundContextIfNowPlayingInfoChangedForReason:(id)a3;
- (void)_registerForBGUpdates;
- (void)_removeDeviceContextConnection:(id)a3;
- (void)_resetContextLinkAndReconnectNow:(BOOL)a3;
- (void)_scheduleNowPlayingRefreshForReason:(id)a3 isPlaying:(id)a4;
- (void)_setCollectingContext:(BOOL)a3;
- (void)_setDelegate:(id)a3;
- (void)_startPeriodicContextFetchFromNearbyDevices;
- (void)_stopPeriodicContextFetchFromNearbyDevices;
- (void)_unregisterForBGUpdates;
- (void)_updateBackgroundContextIfMusicPersonalizationTokenChanged;
- (void)_updateDeviceProblemsWithContext:(id)a3 token:(int)a4 completion:(id)a5;
- (void)_updateHomeAnnouncementWithContext:(id)a3 supplementalSnapshot:(id)a4 completion:(id)a5;
- (void)_updateMultiUserPersonalizationTokensWithSingleUserTokenChanged:(BOOL)a3 completion:(id)a4;
- (void)_updateMusicPersonalizationTokenWithContext:(id)a3 completion:(id)a4;
- (void)_updateNavStatusWithContext:(id)a3 completion:(id)a4;
- (void)_updateNowPlayingInfoWithContext:(id)a3 completion:(id)a4;
- (void)_updatePlaybackDevicesWithContext:(id)a3 completion:(id)a4;
- (void)_updateSimpleThingsWithContext:(id)a3 completion:(id)a4;
- (void)_updateSingleUserMusicPersonalizationTokenFromKeychainWithCompletion:(id)a3;
- (void)clearAlertContextDirtyState;
- (void)clearBackgroundContextDirtyState;
- (void)contextCollectorChangedToDevicesWithIdentifiers:(id)a3 localDeviceIsCollector:(BOOL)a4;
- (void)dealloc;
- (void)deviceContextConnection:(id)a3 donateSerializedContextMapByPrivacyClass:(id)a4 withMetadataMap:(id)a5 forType:(id)a6 pushToRemote:(BOOL)a7 completion:(id)a8;
- (void)deviceContextConnection:(id)a3 getLocalDeviceContextWithCompletion:(id)a4;
- (void)deviceContextConnectionDidInvalidate:(id)a3;
- (void)getAlertContextWithBulletins:(id)a3 externalAlarmSnapshot:(id)a4 timerSnapshot:(id)a5 nlAlertContextCompletion:(id)a6 fullAlertContextCompletion:(id)a7;
- (void)getAppContextForDeviceState:(int64_t)a3 applicationInfos:(id)a4 completion:(id)a5;
- (void)getBackgroundContext:(id)a3;
- (void)getContextIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4 timeOut:(double)a5 completion:(id)a6;
- (void)getContextIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4 timeOut:(double)a5 localContextCompletion:(id)a6 completion:(id)a7;
- (void)getContextSnapshotForCurrentRequestWithCompletion:(id)a3;
- (void)getContextSnapshotForForeignRequestID:(id)a3 completion:(id)a4;
- (void)getDeviceContextsForKeys:(id)a3 forForeignRequestID:(id)a4 includesNearbyDevices:(BOOL)a5 completion:(id)a6;
- (void)getDomainObjectFromMessageContext:(id)a3 completion:(id)a4;
- (void)getLocalContextWithPrivacyClass:(int64_t)a3 completion:(id)a4;
- (void)getNowPlayingMediaIsResumable:(id)a3;
- (void)keepReportingNowPlayingTimingEventsHeuristically;
- (void)localContextStore:(id)a3 didUpdateDeviceContext:(id)a4;
- (void)markBulletinAsAcknolwedgedForDomainObject:(id)a3;
- (void)navStatusDidChange:(id)a3;
- (void)nowPlayingObserver:(id)a3 playbackStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5 lastPlayingDate:(id)a6;
- (void)nowPlayingObserverNowPlayingInfoDidChange:(id)a3;
- (void)preheatBackgroundContext;
- (void)pushContextSnapshotForCurrentRequestWithID:(id)a3 toDevice:(id)a4;
- (void)pushMyriadAdvertisementContextToContextCollector:(id)a3 completion:(id)a4;
- (void)pushSCDAAdvertisementContextToContextCollector:(id)a3 completion:(id)a4;
- (void)rapportLink:(id)a3 didReceiveMessage:(id)a4 ofType:(id)a5 fromPeer:(id)a6 completion:(id)a7;
- (void)rapportLinkDidInterrupt:(id)a3;
- (void)rapportLinkDidInvalidate:(id)a3;
- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)reset;
- (void)setAlertContextDirty;
- (void)setBackgroundContextDirty;
- (void)setDelegate:(id)a3;
- (void)updateBackgroundContextIfHomeKitInfoChanged;
- (void)updateBackgroundContextIfNowPlayingInfoChanged;
@end

@implementation ADContextManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteContextStore, 0);
  objc_storeStrong((id *)&self->_localContextStore, 0);
  objc_storeStrong((id *)&self->_deviceContextConnections, 0);
  objc_storeStrong((id *)&self->_deviceContextServiceListener, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_metricsQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_rapportLink, 0);
  objc_storeStrong((id *)&self->_contextSnapshotByForeignRequestID, 0);
  objc_storeStrong((id *)&self->_contextRefreshTimer, 0);
  objc_storeStrong((id *)&self->_contextHistory, 0);
  objc_storeStrong((id *)&self->_contextSnapshotTimer, 0);
  objc_storeStrong((id *)&self->_currentRequestDate, 0);
  objc_storeStrong((id *)&self->_currentRequestInfoUUID, 0);
  objc_storeStrong((id *)&self->_currentContextSnapshot, 0);
  objc_storeStrong((id *)&self->_contextSnapshotsReadUUIDs, 0);
  objc_storeStrong((id *)&self->_queuedContextSnapshotCompletions, 0);
  objc_storeStrong((id *)&self->_homeAnnouncementContextAdaptor, 0);
  objc_storeStrong((id *)&self->_coalescedNowPlayingUpdateSources, 0);
  objc_storeStrong((id *)&self->_nowPlayingCoalescingTimer, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_bgContext, 0);
  objc_storeStrong((id *)&self->_bgContextQueue, 0);
  objc_storeStrong((id *)&self->_deviceProximityManager, 0);
  objc_storeStrong((id *)&self->_deviceCircleManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)_isCollectingContext
{
  return self->_collectingContext;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (ADContextManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ADContextManagerDelegate *)WeakRetained;
}

- (ADRemoteContextStore)remoteContextStore
{
  return self->_remoteContextStore;
}

- (ADLocalContextStore)localContextStore
{
  return self->_localContextStore;
}

- (void)_enumerateDeviceContextConnectionsUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    deviceContextConnections = self->_deviceContextConnections;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000EBDC0;
    v7[3] = &unk_100502180;
    id v8 = v4;
    [(NSMutableSet *)deviceContextConnections enumerateObjectsUsingBlock:v7];
  }
}

- (void)_removeDeviceContextConnection:(id)a3
{
  deviceContextConnections = self->_deviceContextConnections;
  id v4 = a3;
  [(NSMutableSet *)deviceContextConnections removeObject:v4];
  [v4 invalidate];
}

- (void)_addDeviceContextConnection:(id)a3
{
  id v4 = a3;
  deviceContextConnections = self->_deviceContextConnections;
  id v8 = v4;
  if (!deviceContextConnections)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v7 = self->_deviceContextConnections;
    self->_deviceContextConnections = v6;

    id v4 = v8;
    deviceContextConnections = self->_deviceContextConnections;
  }
  [(NSMutableSet *)deviceContextConnections addObject:v4];
}

- (void)_handleHomeAnnouncementSnapshotUpdate:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v8 = "-[ADContextManager _handleHomeAnnouncementSnapshotUpdate:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s snapshot = %@", buf, 0x16u);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000EBFD0;
  v6[3] = &unk_10050B918;
  v6[4] = self;
  [(ADContextManager *)self _updateHomeAnnouncementWithContext:&off_100523D88 supplementalSnapshot:v4 completion:v6];
}

- (void)_updateHomeAnnouncementWithContext:(id)a3 supplementalSnapshot:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[ADContextManager _updateHomeAnnouncementWithContext:supplementalSnapshot:completion:]";
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s supplementalSnapshot = %@", buf, 0x16u);
  }
  [(AFAnalytics *)self->_analytics logEventWithType:4528 context:v8];
  [(AFAnalytics *)self->_analytics _ad_contextLoggerWithEventType:4529 context:v8 completion:v10];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000EC2B0;
  v18[3] = &unk_100502158;
  v18[4] = self;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v12;
  v13 = objc_retainBlock(v18);
  v14 = v13;
  if (v9)
  {
    ((void (*)(void *, id))v13[2])(v13, v9);
  }
  else
  {
    homeAnnouncementContextAdaptor = self->_homeAnnouncementContextAdaptor;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000EC51C;
    v16[3] = &unk_100502158;
    v16[4] = self;
    v17 = v13;
    [(ADHomeAnnouncementContextAdaptor *)homeAnnouncementContextAdaptor getSnapshotWithCompletion:v16];
  }
}

- (void)pushSCDAAdvertisementContextToContextCollector:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 contextData];
  [v7 contextFetchDelay];
  id v10 = v9;

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [(ADContextManager *)self localContextStore];
      objc_initWeak(&location, v11);

      objc_initWeak(&from, self);
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000EC874;
      block[3] = &unk_100502130;
      objc_copyWeak(&v18, &from);
      objc_copyWeak(v19, &location);
      id v16 = v8;
      id v17 = v6;
      v19[1] = v10;
      dispatch_async(queue, block);

      objc_destroyWeak(v19);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      goto LABEL_9;
    }
    CFStringRef v13 = @"Invalid context data type";
  }
  else
  {
    CFStringRef v13 = @"Nil Myriad advertisement context";
  }
  v14 = +[AFError errorWithCode:30 description:v13];
  if (v6) {
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v14);
  }

LABEL_9:
}

- (void)pushMyriadAdvertisementContextToContextCollector:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 contextData];
  [v7 contextFetchDelay];
  id v10 = v9;

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [(ADContextManager *)self localContextStore];
      objc_initWeak(&location, v11);

      objc_initWeak(&from, self);
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000ECDC8;
      block[3] = &unk_100502130;
      objc_copyWeak(&v18, &from);
      objc_copyWeak(v19, &location);
      id v16 = v8;
      id v17 = v6;
      v19[1] = v10;
      dispatch_async(queue, block);

      objc_destroyWeak(v19);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      goto LABEL_9;
    }
    CFStringRef v13 = @"Invalid context data type";
  }
  else
  {
    CFStringRef v13 = @"Nil Myriad advertisement context";
  }
  v14 = +[AFError errorWithCode:30 description:v13];
  if (v6) {
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v14);
  }

LABEL_9:
}

- (void)_playbackDevicesDidChange:(id)a3
{
  bgContextQueue = self->_bgContextQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ED1C4;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(bgContextQueue, block);
}

- (void)_updatePlaybackDevicesWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(AFAnalytics *)self->_analytics _ad_contextLoggerWithEventType:4524 context:v6 completion:a4];
  bgContextQueue = self->_bgContextQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ED3E0;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(bgContextQueue, block);
}

- (void)_callStateDidChange:(id)a3
{
  bgContextQueue = self->_bgContextQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ED698;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(bgContextQueue, block);
}

- (BOOL)_inlineUpdatePhoneState
{
  v3 = +[ADCommandCenter sharedCommandCenter];
  unsigned int v4 = [v3 _isInCall];
  unsigned int v5 = [v3 _hasIncomingCall];
  unsigned int v6 = [(AFInstanceContext *)self->_instanceContext supportsTelephony];
  uint64_t v7 = v6 & v5;
  uint64_t v8 = v6 & v4;
  unint64_t v9 = (unint64_t)objc_alloc_init((Class)SAPhoneCallState);
  [(id)v9 setActive:v8];
  [(id)v9 setIncoming:v7];
  uint64_t v10 = [(ADBackgroundContextCache *)self->_bgContext phoneCallState];
  if (v9 | v10) {
    uint64_t v11 = [(id)v9 isEqual:v10] ^ 1;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v13 = v12;
    v14 = +[NSNumber numberWithBool:v11];
    v15 = +[NSNumber numberWithBool:v8];
    id v16 = +[NSNumber numberWithBool:v7];
    int v18 = 136315906;
    id v19 = "-[ADContextManager _inlineUpdatePhoneState]";
    __int16 v20 = 2112;
    v21 = v14;
    __int16 v22 = 2112;
    id v23 = v15;
    __int16 v24 = 2112;
    v25 = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s #callState callState did change: %@, active: %@, incoming: %@", (uint8_t *)&v18, 0x2Au);
  }
  if (v11) {
    [(ADBackgroundContextCache *)self->_bgContext setPhoneCallState:v9];
  }

  return v11;
}

- (void)_updateDeviceProblemsWithContext:(id)a3 token:(int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int out_token = 136315394;
    id v23 = "-[ADContextManager _updateDeviceProblemsWithContext:token:completion:]";
    __int16 v24 = 1024;
    LODWORD(v25) = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s token = %d", (uint8_t *)&out_token, 0x12u);
  }
  [(AFAnalytics *)self->_analytics logEventWithType:4509 context:v8];
  uint64_t v11 = [(AFAnalytics *)self->_analytics _ad_contextLoggerWithEventType:4510 context:v8 completion:v9];
  uint64_t state64 = 0;
  if (a4 == -1)
  {
    int out_token = -1;
    uint32_t state = notify_register_check("com.apple.sharing.problems", &out_token);
    if (!state)
    {
      uint32_t state = notify_get_state(out_token, &state64);
      notify_cancel(out_token);
    }
  }
  else
  {
    uint32_t state = notify_get_state(a4, &state64);
  }
  id v13 = AFSiriLogContextDaemon;
  if (state)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int out_token = 136315394;
      id v23 = "-[ADContextManager _updateDeviceProblemsWithContext:token:completion:]";
      __int16 v24 = 1024;
      LODWORD(v25) = state;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s could not get device problem state. notify.h status = %u", (uint8_t *)&out_token, 0x12u);
    }
    goto LABEL_64;
  }
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int out_token = 136315394;
    id v23 = "-[ADContextManager _updateDeviceProblemsWithContext:token:completion:]";
    __int16 v24 = 2048;
    uint64_t v25 = state64;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s uint32_t state = %llu", (uint8_t *)&out_token, 0x16u);
  }
  if (!state64)
  {
    unint64_t v14 = 0;
    goto LABEL_59;
  }
  unint64_t v14 = (unint64_t)objc_alloc_init((Class)SAErrorIndicatorStatus);
  id v15 = objc_alloc_init((Class)NSMutableArray);
  id v16 = v15;
  int v17 = state64;
  if ((state64 & 2) != 0)
  {
    [v15 addObject:SAErrorIndicatorStatusValueICloudProblemValue];
    int v17 = state64;
    if ((state64 & 4) == 0)
    {
LABEL_15:
      if ((v17 & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_38;
    }
  }
  else if ((state64 & 4) == 0)
  {
    goto LABEL_15;
  }
  [v16 addObject:SAErrorIndicatorStatusValueITunesProblemValue];
  int v17 = state64;
  if ((state64 & 8) == 0)
  {
LABEL_16:
    if ((v17 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  [v16 addObject:SAErrorIndicatorStatusValueHomeKitProblemValue];
  int v17 = state64;
  if ((state64 & 0x10) == 0)
  {
LABEL_17:
    if ((v17 & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  [v16 addObject:SAErrorIndicatorStatusValueWiFiProblemValue];
  int v17 = state64;
  if ((state64 & 0x20) == 0)
  {
LABEL_18:
    if ((v17 & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  [(id)v14 setDeviceFixingProblems:1];
  int v17 = state64;
  if ((state64 & 0x40) == 0)
  {
LABEL_19:
    if ((v17 & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_42;
  }
LABEL_41:
  [v16 addObject:SAErrorIndicatorStatusValueWiFiPerformanceProblemValue];
  int v17 = state64;
  if ((state64 & 0x80) == 0)
  {
LABEL_20:
    if ((v17 & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_43;
  }
LABEL_42:
  [v16 addObject:SAErrorIndicatorStatusValueInternetProblemValue];
  int v17 = state64;
  if ((state64 & 0x100) == 0)
  {
LABEL_21:
    if ((v17 & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_44;
  }
LABEL_43:
  [v16 addObject:SAErrorIndicatorStatusValueHardwareProblemValue];
  int v17 = state64;
  if ((state64 & 0x200) == 0)
  {
LABEL_22:
    if ((v17 & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_45;
  }
LABEL_44:
  [v16 addObject:SAErrorIndicatorStatusValueBluetoothProblemValue];
  int v17 = state64;
  if ((state64 & 0x400) == 0)
  {
LABEL_23:
    if ((v17 & 0x800) == 0) {
      goto LABEL_24;
    }
    goto LABEL_46;
  }
LABEL_45:
  [v16 addObject:SAErrorIndicatorStatusValueThermalProblemValue];
  int v17 = state64;
  if ((state64 & 0x800) == 0)
  {
LABEL_24:
    if ((v17 & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_47;
  }
LABEL_46:
  [v16 addObject:SAErrorIndicatorStatusValueRecoveryValue];
  int v17 = state64;
  if ((state64 & 0x1000) == 0)
  {
LABEL_25:
    if ((v17 & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_48;
  }
LABEL_47:
  [v16 addObject:SAErrorIndicatorStatusValueStereoNotFoundValue];
  int v17 = state64;
  if ((state64 & 0x2000) == 0)
  {
LABEL_26:
    if ((v17 & 0x4000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_49;
  }
LABEL_48:
  [v16 addObject:SAErrorIndicatorStatusValueStereoVersionValue];
  int v17 = state64;
  if ((state64 & 0x4000) == 0)
  {
LABEL_27:
    if ((v17 & 0x8000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_50;
  }
LABEL_49:
  [v16 addObject:SAErrorIndicatorStatusValueStereoErrorValue];
  int v17 = state64;
  if ((state64 & 0x8000) == 0)
  {
LABEL_28:
    if ((v17 & 0x10000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_51;
  }
LABEL_50:
  [v16 addObject:SAErrorIndicatorStatusValueVPNValue];
  int v17 = state64;
  if ((state64 & 0x10000) == 0)
  {
LABEL_29:
    if ((v17 & 0x20000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_52;
  }
LABEL_51:
  [v16 addObject:SAErrorIndicatorStatusValueWiFi8021xValue];
  int v17 = state64;
  if ((state64 & 0x20000) == 0)
  {
LABEL_30:
    if ((v17 & 0x40000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_53;
  }
LABEL_52:
  [v16 addObject:SAErrorIndicatorStatusValueCDPValue];
  int v17 = state64;
  if ((state64 & 0x40000) == 0)
  {
LABEL_31:
    if ((v17 & 0x80000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_54;
  }
LABEL_53:
  [v16 addObject:SAErrorIndicatorStatusValueNetworkProfileValue];
  int v17 = state64;
  if ((state64 & 0x80000) == 0)
  {
LABEL_32:
    if ((v17 & 0x100000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_55;
  }
LABEL_54:
  [v16 addObject:SAErrorIndicatorStatusValueNetworkNotShareableValue];
  LOBYTE(v17) = state64;
  if ((state64 & 0x100000) == 0)
  {
LABEL_33:
    if ((v17 & 1) == 0) {
      goto LABEL_58;
    }
LABEL_56:
    if (![v16 count]) {
      [v16 addObject:SAErrorIndicatorStatusValueGenericProblemValue];
    }
    goto LABEL_58;
  }
LABEL_55:
  [v16 addObject:SAErrorIndicatorStatusValueNetworkProfileRequiredValue];
  if (state64) {
    goto LABEL_56;
  }
LABEL_58:
  [(id)v14 setValues:v16];

LABEL_59:
  uint64_t v18 = [(ADBackgroundContextCache *)self->_bgContext errorIndicatorStatus];
  id v19 = (void *)v18;
  if (v14 | v18 && ([(id)v18 isEqual:v14] & 1) == 0)
  {
    [(ADBackgroundContextCache *)self->_bgContext setErrorIndicatorStatus:v14];
    uint64_t v20 = 1;
  }
  else
  {
    uint64_t v20 = 0;
  }
  v11[2](v11, v20);

LABEL_64:
}

- (void)_handleDeviceProblemsChangedWithToken:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v8 = "-[ADContextManager _handleDeviceProblemsChangedWithToken:]";
    __int16 v9 = 1024;
    int v10 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s token = %d", buf, 0x12u);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000EE06C;
  v6[3] = &unk_10050B918;
  v6[4] = self;
  [(ADContextManager *)self _updateDeviceProblemsWithContext:&off_100523D10 token:v3 completion:v6];
}

- (void)updateBackgroundContextIfNowPlayingInfoChanged
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EE1D0;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_block_t v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
  dispatch_async((dispatch_queue_t)self->_bgContextQueue, v3);
}

- (void)_reallyUpdateBackgroundContextIfNowPlayingInfoChangedForReason:(id)a3
{
  unsigned int v4 = (__CFString *)a3;
  if (![(__CFString *)v4 length])
  {

    unsigned int v4 = @"poll";
  }
  unsigned int v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[ADContextManager _reallyUpdateBackgroundContextIfNowPlayingInfoChangedForReason:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  CFStringRef v8 = @"source";
  __int16 v9 = v4;
  unsigned int v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EE344;
  v7[3] = &unk_10050B918;
  void v7[4] = self;
  [(ADContextManager *)self _updateNowPlayingInfoWithContext:v6 completion:v7];
}

- (void)_updateNowPlayingInfoWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_group_t v8 = dispatch_group_create();
  __int16 v9 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[ADContextManager _updateNowPlayingInfoWithContext:completion:]";
    __int16 v16 = 2048;
    dispatch_group_t v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s group=%p canceling _nowPlayingCoalescingTimer because we are starting an update now", buf, 0x16u);
  }
  [(ADContextManager *)self _cancelNowPlayingCoalescingTimer];
  int v10 = [(AFAnalytics *)self->_analytics _ad_contextLoggerWithEventType:4506 context:v7 completion:v6];

  [(AFAnalytics *)self->_analytics logEventWithType:4505 context:v7];
  dispatch_group_t v13 = v8;
  id v11 = v10;
  __int16 v12 = v8;
  AFGetNowPlayingQueueState();
}

- (void)_scheduleNowPlayingRefreshForReason:(id)a3 isPlaying:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  dispatch_group_t v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v22 = "-[ADContextManager _scheduleNowPlayingRefreshForReason:isPlaying:]";
    __int16 v23 = 2112;
    uint64_t v24 = (uint64_t)v6;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s reason = %@, isPlaying = %@", buf, 0x20u);
  }
  if (v7 && mach_absolute_time() <= self->_ignoreNowPlayingUpdatesAfterTimestamp)
  {
    uint64_t v19 = kMRMediaRemoteNowPlayingApplicationIsPlayingUserInfoKey;
    id v20 = v7;
    __int16 v9 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    [(AFAnalytics *)self->_analytics logEventWithType:2801 context:v9];
  }
  if (!self->_nowPlayingCoalescingTimer)
  {
    int v10 = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithCapacity:2];
    coalescedNowPlayingUpdateSources = self->_coalescedNowPlayingUpdateSources;
    self->_coalescedNowPlayingUpdateSources = v10;

    __int16 v12 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_bgContextQueue);
    nowPlayingCoalescingTimer = self->_nowPlayingCoalescingTimer;
    self->_nowPlayingCoalescingTimer = v12;

    unint64_t v14 = self->_nowPlayingCoalescingTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000EE9D0;
    handler[3] = &unk_10050E138;
    handler[4] = self;
    dispatch_source_set_event_handler(v14, handler);
    id v15 = self->_nowPlayingCoalescingTimer;
    dispatch_time_t v16 = dispatch_time(0, 100000000);
    dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_nowPlayingCoalescingTimer);
    dispatch_group_t v17 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v22 = "-[ADContextManager _scheduleNowPlayingRefreshForReason:isPlaying:]";
      __int16 v23 = 2048;
      uint64_t v24 = 0x3FB999999999999ALL;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Updating NowPlaying info in %.4g seconds", buf, 0x16u);
    }
  }
  if (![(__CFString *)v6 length])
  {

    id v6 = @"UNKNOWN";
  }
  [(NSMutableSet *)self->_coalescedNowPlayingUpdateSources addObject:v6];
}

- (void)_cancelNowPlayingCoalescingTimer
{
  nowPlayingCoalescingTimer = self->_nowPlayingCoalescingTimer;
  if (nowPlayingCoalescingTimer)
  {
    dispatch_source_cancel(nowPlayingCoalescingTimer);
    unsigned int v4 = self->_nowPlayingCoalescingTimer;
    self->_nowPlayingCoalescingTimer = 0;

    coalescedNowPlayingUpdateSources = self->_coalescedNowPlayingUpdateSources;
    self->_coalescedNowPlayingUpdateSources = 0;
  }
}

- (void)nowPlayingObserverNowPlayingInfoDidChange:(id)a3
{
  id v5 = a3;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v10 = "-[ADContextManager nowPlayingObserverNowPlayingInfoDidChange:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s nowPlayingObserver = %@", buf, 0x16u);
  }
  bgContextQueue = self->_bgContextQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000EEC88;
  v8[3] = &unk_10050D8C0;
  v8[4] = self;
  v8[5] = a2;
  dispatch_async(bgContextQueue, v8);
}

- (void)nowPlayingObserver:(id)a3 playbackStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5 lastPlayingDate:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    dispatch_group_t v13 = v12;
    unint64_t v14 = AFMediaPlaybackStateGetName();
    id v15 = AFMediaPlaybackStateGetName();
    *(_DWORD *)buf = 136316162;
    uint64_t v19 = "-[ADContextManager nowPlayingObserver:playbackStateDidChangeFrom:to:lastPlayingDate:]";
    __int16 v20 = 2112;
    id v21 = v10;
    __int16 v22 = 2112;
    __int16 v23 = v14;
    __int16 v24 = 2112;
    __int16 v25 = v15;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s nowPlayingObserver = %@, fromState = %@, toState = %@, lastPlayingDate = %@", buf, 0x34u);
  }
  bgContextQueue = self->_bgContextQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EEE7C;
  block[3] = &unk_10050C7F0;
  void block[4] = self;
  void block[5] = a5;
  block[6] = a2;
  dispatch_async(bgContextQueue, block);
}

- (void)navStatusDidChange:(id)a3
{
  bgContextQueue = self->_bgContextQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EEF74;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(bgContextQueue, block);
}

- (void)_updateNavStatusWithContext:(id)a3 completion:(id)a4
{
  id v7 = a3;
  dispatch_group_t v8 = self->_analytics;
  __int16 v9 = [(AFAnalytics *)v8 _ad_contextLoggerWithEventType:4504 context:v7 completion:a4];
  [(AFAnalytics *)v8 logEventWithType:4503 context:v7];
  [(AFAnalytics *)v8 logEventWithType:4521 context:v7];
  uint64_t v10 = [(ADBackgroundContextCache *)self->_bgContext navStatus];
  id v11 = [(ADBackgroundContextCache *)self->_bgContext localSearchGetNavigationStatusCompleted];
  id v12 = +[AFPreferences sharedPreferences];
  id v13 = [v12 currentNavigationState];

  char IsNavigating = AFNavigationStateIsNavigating();
  unint64_t v15 = (unint64_t)objc_alloc_init((Class)SANavStatus);
  if ((unint64_t)v13 <= 4) {
    id v4 = *(id *)*(&off_100506B18 + (void)v13);
  }
  [(id)v15 setStatusValue:v4];

  v36 = (void *)v10;
  if (v10 | v15 && ([(id)v15 isEqual:v10] & 1) == 0)
  {
    [(ADBackgroundContextCache *)self->_bgContext setNavStatus:v15];
    char v16 = 1;
  }
  else
  {
    char v16 = 0;
  }
  if (v7) {
    char v17 = IsNavigating;
  }
  else {
    char v17 = 0;
  }
  if (v17)
  {
    v46[0] = v7;
    CFStringRef v44 = @"isNavigating";
    v33 = +[NSNumber numberWithBool:1];
    v45 = v33;
    +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    uint64_t v18 = v34 = v9;
    v46[1] = v18;
    +[NSArray arrayWithObjects:v46 count:2];
    id v19 = v7;
    __int16 v20 = self;
    unint64_t v21 = v15;
    __int16 v22 = v8;
    char v23 = IsNavigating;
    v25 = __int16 v24 = v11;
    AFAnalyticsContextsMerge();
    id v26 = (id)objc_claimAutoreleasedReturnValue();

    id v11 = v24;
    char IsNavigating = v23;
    dispatch_group_t v8 = v22;
    unint64_t v15 = v21;
    self = v20;
    id v7 = v19;

    __int16 v9 = v34;
  }
  else
  {
    id v26 = v7;
  }
  [(AFAnalytics *)v8 logEventWithType:4522 context:v26];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000EF494;
  v39[3] = &unk_100502068;
  id v27 = v11;
  id v40 = v27;
  v41 = self;
  id v28 = v9;
  id v42 = v28;
  char v43 = v16;
  v29 = objc_retainBlock(v39);
  v30 = v29;
  if (IsNavigating)
  {
    v31 = v36;
    if (v27)
    {
      ((void (*)(void *, id))v29[2])(v29, v27);
    }
    else
    {
      id v35 = objc_alloc_init((Class)SALocalSearchGetNavigationStatus);
      v32 = +[ADCommandCenter sharedCommandCenter];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1000EF52C;
      v37[3] = &unk_100502090;
      v37[4] = self;
      id v38 = v30;
      [v32 _sendServiceCommand:v35 completion:v37];
    }
  }
  else
  {
    ((void (*)(void *, void))v29[2])(v29, 0);
    v31 = v36;
  }
}

- (void)updateBackgroundContextIfHomeKitInfoChanged
{
  bgContextQueue = self->_bgContextQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EF7A8;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(bgContextQueue, block);
}

- (BOOL)_inlineUpdateCurrentHomeKitHome
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  unint64_t v14 = sub_1000EFA64;
  unint64_t v15 = sub_1000EFA74;
  id v16 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EFA7C;
  block[3] = &unk_10050E318;
  void block[4] = &v11;
  dispatch_sync((dispatch_queue_t)qword_100585A68, block);
  id v3 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  id v4 = [v3 absoluteString];

  if ([v4 length])
  {
    unint64_t v5 = (unint64_t)objc_alloc_init((Class)SAHACurrentHome);
    [(id)v5 setCurrentHomeIdentifier:v4];
  }
  else
  {
    unint64_t v5 = 0;
  }
  uint64_t v6 = [(ADBackgroundContextCache *)self->_bgContext currentHome];
  id v7 = (void *)v6;
  if (v5 | v6 && ([(id)v6 isEqual:v5] & 1) == 0)
  {
    [(ADBackgroundContextCache *)self->_bgContext setCurrentHome:v5];
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_updateBackgroundContextIfMusicPersonalizationTokenChanged
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000EFB3C;
  v2[3] = &unk_10050B918;
  v2[4] = self;
  [(ADContextManager *)self _updateMusicPersonalizationTokenWithContext:&off_100523C98 completion:v2];
}

- (void)_updateMusicPersonalizationTokenWithContext:(id)a3 completion:(id)a4
{
  analytics = self->_analytics;
  id v7 = a4;
  id v8 = a3;
  [(AFAnalytics *)analytics logEventWithType:4515 context:v8];
  __int16 v9 = [(AFAnalytics *)self->_analytics _ad_contextLoggerWithEventType:4516 context:v8 completion:v7];

  [off_100580DE0() sharedProvider];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000EFD1C;
  v12[3] = &unk_100501FA0;
  v12[4] = self;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v9;
  id v10 = v9;
  id v11 = v13;
  [v11 getTokenForcingRefresh:0 completion:v12];
}

- (void)_updateMultiUserPersonalizationTokensWithSingleUserTokenChanged:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  [off_100580DE0() sharedProvider];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000F03C8;
  v9[3] = &unk_100501F50;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = self;
  BOOL v13 = a3;
  id v12 = v6;
  id v7 = v6;
  id v8 = v10;
  [v8 getAllTokensForAssistantForcingRefresh:0 completion:v9];
}

- (id)_makeUserTokenStatusWithICTokenStatus:(id)a3 icError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)SAUserTokenStatus);
  if (v6)
  {
    id v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]);
    [v7 setErrorCode:v8];
  }
  else
  {
    __int16 v9 = [v5 lastError];
    id v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 code]);
    [v7 setErrorCode:v10];

    id v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 shouldExcludeFromBackgroundRefresh]);
    [v7 setShouldExcludeFromBackgroundRefresh:v11];

    [v5 lastUpdateAttemptTime];
    id v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v7 setLastUpdateAttemptTime:v8];
  }

  return v7;
}

- (void)_updateSingleUserMusicPersonalizationTokenFromKeychainWithCompletion:(id)a3
{
  id v7 = (void (**)(id, uint64_t))a3;
  id v4 = AFKeychainValueForAccountAndKey();
  if ([v4 length]) {
    id v5 = [objc_alloc((Class)NSString) initWithData:v4 encoding:4];
  }
  else {
    id v5 = 0;
  }
  id v6 = [(ADBackgroundContextCache *)self->_bgContext musicPersonalizationToken];
  if (([v6 isEqual:v5] & 1) == 0)
  {
    [(ADBackgroundContextCache *)self->_bgContext setMusicPersonalizationToken:v5];
    v7[2](v7, 1);
  }
}

- (void)_handleContextSnapshotPush:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = [v6 objectForKey:@"request_id"];
  if (v8)
  {
    if (!self->_contextSnapshotByForeignRequestID)
    {
      __int16 v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      contextSnapshotByForeignRequestID = self->_contextSnapshotByForeignRequestID;
      self->_contextSnapshotByForeignRequestID = v9;
    }
    id v11 = objc_alloc_init((Class)NSMutableArray);
    id v12 = [(ADDeviceCircleManager *)self->_deviceCircleManager localPeerInfo];
    BOOL v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[ADContextManager _handleContextSnapshotPush:completion:]";
      __int16 v37 = 2112;
      id v38 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s #hal received context_snapshot_push for request %@:", buf, 0x16u);
    }
    id v14 = [v6 objectForKey:@"context_snapshot"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000F1368;
    v32[3] = &unk_100504C58;
    id v18 = v12;
    id v33 = v18;
    id v19 = v11;
    id v34 = v19;
    [v15 enumerateKeysAndObjectsUsingBlock:v32];

    __int16 v20 = [v6 objectForKey:@"context_snapshot_by_assistant_identifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000F1558;
    v29[3] = &unk_100504C58;
    id v22 = v18;
    id v30 = v22;
    id v17 = v19;
    id v31 = v17;
    [v21 enumerateKeysAndObjectsUsingBlock:v29];

    char v23 = self->_contextSnapshotByForeignRequestID;
    __int16 v24 = sub_1002AB298(v17);
    [(NSMutableDictionary *)v23 setObject:v24 forKey:v8];

    dispatch_time_t v25 = dispatch_time(0, 12000000000);
    queue = self->_queue;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000F1748;
    v27[3] = &unk_10050E160;
    v27[4] = self;
    id v28 = v8;
    dispatch_after(v25, queue, v27);
    if (v7) {
      v7[2](v7, 0);
    }

    goto LABEL_18;
  }
  id v16 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[ADContextManager _handleContextSnapshotPush:completion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s #hal malformed message: missing request ID", buf, 0xCu);
    if (!v7) {
      goto LABEL_19;
    }
    goto LABEL_10;
  }
  if (v7)
  {
LABEL_10:
    id v17 = +[AFError errorWithCode:11];
    ((void (**)(id, id))v7)[2](v7, v17);
LABEL_18:
  }
LABEL_19:
}

- (void)_handlePushContextMessage:(id)a3 fromDeviceWithPeerInfo:(id)a4 completion:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  id v10 = a4;
  id v11 = a3;
  dispatch_assert_queue_V2(queue);
  __int16 v24 = [(ADContextManager *)self remoteContextStore];
  id v12 = [objc_alloc((Class)AFDeviceContext) initWithSerializedBackingStore:v11 fromLocalDevice:0 contextCollectorSource:0];
  BOOL v13 = [v11 objectForKey:@"included_context_types_in_request"];
  id v14 = [v11 objectForKey:@"excluded_context_keys_in_request"];
  id v15 = [v11 objectForKey:@"included_context_types_in_response"];
  id v16 = [v11 objectForKey:@"excluded_context_keys_in_response"];
  id v17 = [v11 objectForKey:@"prefers_assistant_identifiers"];

  objc_opt_class();
  id v18 = 0;
  if (objc_opt_isKindOfClass()) {
    id v18 = v17;
  }

  unsigned __int8 v19 = [v18 BOOLValue];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000F1998;
  v25[3] = &unk_1005065D0;
  id v26 = v15;
  id v27 = self;
  unsigned __int8 v31 = v19;
  id v28 = v16;
  id v29 = objc_alloc_init((Class)NSMutableDictionary);
  id v30 = v8;
  id v20 = v8;
  id v21 = v29;
  id v22 = v16;
  id v23 = v15;
  [v24 setDeviceContext:v12 includedKeys:v13 excludedKeys:v14 forDeviceWithPeerInfo:v10 completion:v25];
}

- (void)_handleAggregateContextFetchWithMessage:(id)a3 fromDeviceWithPeerInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v57 = v10;
    id v11 = +[AFAnalytics sharedAnalytics];
    [v11 logEventWithType:4586 context:0];

    id v12 = dispatch_group_create();
    BOOL v13 = [v8 objectForKey:@"prefers_assistant_identifiers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    unsigned __int8 v56 = [v14 BOOLValue];
    v93[0] = 0;
    v93[1] = v93;
    v93[2] = 0x3032000000;
    v93[3] = sub_1000EFA64;
    v93[4] = sub_1000EFA74;
    id v94 = 0;
    dispatch_group_enter(v12);
    localContextStore = self->_localContextStore;
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472;
    v90[2] = sub_1000F2C1C;
    v90[3] = &unk_100501E10;
    v92 = v93;
    id v16 = v12;
    v91 = v16;
    [(ADLocalContextStore *)localContextStore getLocalContextWithPrivacyClass:50 completion:v90];
    v88[0] = 0;
    v88[1] = v88;
    v88[2] = 0x3032000000;
    v88[3] = sub_1000EFA64;
    v88[4] = sub_1000EFA74;
    id v89 = 0;
    if (!self->_collectingContext
      && !+[AFFeatureFlags isCrossDeviceTVControlFromWatchEnabled])
    {
      id v38 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ADContextManager _handleAggregateContextFetchWithMessage:fromDeviceWithPeerInfo:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        _os_log_debug_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "%s Direct force fetch requested from %@", buf, 0x16u);
      }
      goto LABEL_61;
    }
    id v17 = [v8 objectForKey:@"force_fetch_assistant_identifiers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v17;

      if (v18)
      {
        id v19 = objc_alloc_init((Class)NSMutableSet);
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        id v20 = v18;
        id v21 = [v20 countByEnumeratingWithState:&v84 objects:v102 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v85;
          do
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(void *)v85 != v22) {
                objc_enumerationMutation(v20);
              }
              __int16 v24 = sub_100174F64(*(void **)(*((void *)&v84 + 1) + 8 * i));
              if (v24) {
                [v19 addObject:v24];
              }
            }
            id v21 = [v20 countByEnumeratingWithState:&v84 objects:v102 count:16];
          }
          while (v21);
        }

        if (v19) {
          goto LABEL_33;
        }
      }
    }
    else
    {
    }
    dispatch_time_t v25 = [v8 objectForKey:@"forceFetchingContextFrom"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v19 = 0;
      char v37 = 1;
LABEL_45:

LABEL_50:
      id v39 = [v19 count];
      id v40 = AFSiriLogContextDaemon;
      BOOL v41 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
      if (v39)
      {
        if (v41)
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[ADContextManager _handleAggregateContextFetchWithMessage:fromDeviceWithPeerInfo:completion:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v9;
          _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "%s #hal Relaying force fetch request from %@", buf, 0x16u);
        }
        dispatch_group_enter(v16);
        remoteContextStore = self->_remoteContextStore;
        char v43 = [v19 allObjects];
        v72[0] = _NSConcreteStackBlock;
        v72[1] = 3221225472;
        v72[2] = sub_1000F2D04;
        v72[3] = &unk_100501E38;
        id v73 = v19;
        v75 = v88;
        v74 = v16;
        [(ADRemoteContextStore *)remoteContextStore fetchContextSnapshotFromDevicesWithPeerInfo:v43 completion:v72];
      }
      else if (v37)
      {
        if (v41)
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[ADContextManager _handleAggregateContextFetchWithMessage:fromDeviceWithPeerInfo:completion:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v9;
          _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "%s #hal Regular context fetch request from %@", buf, 0x16u);
        }
        dispatch_group_enter(v16);
        CFStringRef v44 = self->_remoteContextStore;
        uint64_t v99 = AFDeviceContextKeyAll;
        v45 = +[NSArray arrayWithObjects:&v99 count:1];
        v69[0] = _NSConcreteStackBlock;
        v69[1] = 3221225472;
        v69[2] = sub_1000F2E9C;
        v69[3] = &unk_100501E60;
        v71 = v88;
        v70 = v16;
        [(ADRemoteContextStore *)v44 getContextSnapshotIncludingKeys:v45 excludingMandatoryKeys:0 completion:v69];
      }
      else if (v41)
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ADContextManager _handleAggregateContextFetchWithMessage:fromDeviceWithPeerInfo:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "%s #hal Direct force fetch requested from %@", buf, 0x16u);
      }

LABEL_61:
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v96 = sub_1000EFA64;
      v97 = sub_1000EFA74;
      id v98 = 0;
      id v46 = objc_alloc((Class)AFSafetyBlock);
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472;
      v62[2] = sub_1000F3018;
      v62[3] = &unk_100501E88;
      unsigned __int8 v68 = v56;
      v62[4] = self;
      v65 = buf;
      v66 = v93;
      v67 = v88;
      id v63 = v9;
      id v64 = v57;
      id v47 = [v46 initWithBlock:v62];
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000F365C;
      block[3] = &unk_10050E138;
      id v49 = v47;
      id v61 = v49;
      dispatch_group_notify(v16, queue, block);
      id v50 = objc_alloc((Class)AFWatchdogTimer);
      v51 = self->_queue;
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_1000F3668;
      v58[3] = &unk_10050E138;
      id v52 = v49;
      id v59 = v52;
      id v53 = [v50 initWithTimeoutInterval:v51 onQueue:v58 timeoutHandler:0.75];
      v54 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v53;

      [*(id *)(*(void *)&buf[8] + 40) start];
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(v88, 8);
      _Block_object_dispose(v93, 8);

      id v10 = v57;
      goto LABEL_62;
    }
    id v26 = v25;

    if (v26)
    {
      id v19 = objc_alloc_init((Class)NSMutableSet);
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v27 = v26;
      id v28 = [v27 countByEnumeratingWithState:&v80 objects:v101 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v81;
        do
        {
          for (j = 0; j != v28; j = (char *)j + 1)
          {
            if (*(void *)v81 != v29) {
              objc_enumerationMutation(v27);
            }
            unsigned __int8 v31 = sub_10016A850(*(void **)(*((void *)&v80 + 1) + 8 * (void)j));
            if (v31) {
              [v19 addObject:v31];
            }
          }
          id v28 = [v27 countByEnumeratingWithState:&v80 objects:v101 count:16];
        }
        while (v28);
      }

      if (v19)
      {
LABEL_33:
        id v55 = v8;
        dispatch_time_t v25 = [(ADDeviceCircleManager *)self->_deviceCircleManager localPeerInfo];
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v32 = [v19 copy];
        id v33 = [v32 countByEnumeratingWithState:&v76 objects:v100 count:16];
        if (v33)
        {
          uint64_t v34 = *(void *)v77;
          do
          {
            for (k = 0; k != v33; k = (char *)k + 1)
            {
              if (*(void *)v77 != v34) {
                objc_enumerationMutation(v32);
              }
              v36 = *(void **)(*((void *)&v76 + 1) + 8 * (void)k);
              if ((sub_100174BB8(v36, v25) & 1) != 0 || sub_100174BB8(v36, v9)) {
                [v19 removeObject:v36];
              }
            }
            id v33 = [v32 countByEnumeratingWithState:&v76 objects:v100 count:16];
          }
          while (v33);
        }

        id v8 = v55;
        char v37 = 0;
        goto LABEL_45;
      }
    }
    else
    {
      id v19 = 0;
    }
    char v37 = 1;
    goto LABEL_50;
  }
LABEL_62:
}

- (void)rapportLink:(id)a3 didReceiveMessage:(id)a4 ofType:(id)a5 fromPeer:(id)a6 completion:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [v13 idsDeviceUniqueIdentifier];
  id v16 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    id v27 = "-[ADContextManager rapportLink:didReceiveMessage:ofType:fromPeer:completion:]";
    __int16 v28 = 2112;
    id v29 = v12;
    __int16 v30 = 2112;
    id v31 = v11;
    __int16 v32 = 2112;
    id v33 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s type: %@, message: %@, device ID: %@", buf, 0x2Au);
  }
  if (![v12 isEqualToString:@"agg_context_fetch"])
  {
    if ([v12 isEqualToString:@"context_push"])
    {
      if (self->_collectingContext)
      {
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1000F39E4;
        v24[3] = &unk_10050D080;
        id v25 = v14;
        [(ADContextManager *)self _handlePushContextMessage:v11 fromDeviceWithPeerInfo:v13 completion:v24];
        id v17 = v25;
LABEL_10:

        goto LABEL_18;
      }
      id v20 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v27 = "-[ADContextManager rapportLink:didReceiveMessage:ofType:fromPeer:completion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s #hal Not collecting context. Ignored", buf, 0xCu);
        if (!v14) {
          goto LABEL_18;
        }
      }
      else if (!v14)
      {
        goto LABEL_18;
      }
      uint64_t v19 = 2901;
    }
    else
    {
      if ([v12 isEqualToString:@"context_snapshot_push"])
      {
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1000F3A00;
        v22[3] = &unk_10050D440;
        id v23 = v14;
        [(ADContextManager *)self _handleContextSnapshotPush:v11 completion:v22];
        id v17 = v23;
        goto LABEL_10;
      }
      id v18 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        id v27 = "-[ADContextManager rapportLink:didReceiveMessage:ofType:fromPeer:completion:]";
        __int16 v28 = 2112;
        id v29 = v12;
        __int16 v30 = 2112;
        id v31 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Unexpected request to handle message: %@, from device: %@", buf, 0x20u);
        if (!v14) {
          goto LABEL_18;
        }
      }
      else if (!v14)
      {
        goto LABEL_18;
      }
      uint64_t v19 = 2900;
    }
    id v21 = +[AFError errorWithCode:v19];
    (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v21);

    goto LABEL_18;
  }
  [(ADContextManager *)self _handleAggregateContextFetchWithMessage:v11 fromDeviceWithPeerInfo:v13 completion:v14];
LABEL_18:
}

- (void)rapportLinkDidInvalidate:(id)a3
{
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    id v6 = "-[ADContextManager rapportLinkDidInvalidate:]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s ", (uint8_t *)&v5, 0xCu);
  }
  [(ADContextManager *)self _resetContextLinkAndReconnectNow:0];
}

- (void)rapportLinkDidInterrupt:(id)a3
{
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    id v6 = "-[ADContextManager rapportLinkDidInterrupt:]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s ", (uint8_t *)&v5, 0xCu);
  }
  [(ADContextManager *)self _resetContextLinkAndReconnectNow:1];
}

- (void)_resetContextLinkAndReconnectNow:(BOOL)a3
{
  BOOL v3 = a3;
  [(ADRapportLink *)self->_rapportLink removeListener:self];
  [(ADRapportLink *)self->_rapportLink invalidate];
  rapportLink = self->_rapportLink;
  self->_rapportLink = 0;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000F3CE0;
  v12[3] = &unk_10050E138;
  v12[4] = self;
  id v6 = objc_retainBlock(v12);
  id v7 = v6;
  if (v3)
  {
    ((void (*)(void *))v6[2])(v6);
  }
  else
  {
    dispatch_time_t v8 = dispatch_time(0, 20000000000);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F3D54;
    block[3] = &unk_10050E188;
    void block[4] = self;
    id v11 = v7;
    dispatch_after(v8, queue, block);
  }
}

- (void)localContextStore:(id)a3 didUpdateDeviceContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F3E38;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)contextCollectorChangedToDevicesWithIdentifiers:(id)a3 localDeviceIsCollector:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F3F84;
  block[3] = &unk_10050CA08;
  BOOL v12 = a4;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)deviceContextConnection:(id)a3 donateSerializedContextMapByPrivacyClass:(id)a4 withMetadataMap:(id)a5 forType:(id)a6 pushToRemote:(BOOL)a7 completion:(id)a8
{
}

- (void)deviceContextConnection:(id)a3 getLocalDeviceContextWithCompletion:(id)a4
{
  if (a4) {
    -[ADContextManager getLocalContextWithPrivacyClass:completion:](self, "getLocalContextWithPrivacyClass:completion:", 10);
  }
}

- (void)deviceContextConnectionDidInvalidate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F41BC;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  if (self->_deviceContextServiceListener != a3)
  {
LABEL_6:
    BOOL v10 = 0;
    goto LABEL_7;
  }
  if (!AFConnectionHasEntitlement())
  {
    id v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[ADContextManager listener:shouldAcceptNewConnection:]";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Reject the connection as it's missing entitlement", buf, 0xCu);
    }
    goto LABEL_6;
  }
  id v7 = [[ADDeviceContextConnection alloc] initWithQueue:self->_queue xpcConnection:v6 delegate:self];
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000F434C;
  v13[3] = &unk_10050E160;
  v13[4] = self;
  id v14 = v7;
  id v9 = v7;
  dispatch_async(queue, v13);

  BOOL v10 = 1;
LABEL_7:

  return v10;
}

- (id)_dataSourceInfoWithProximity:(int64_t)a3 deviceContext:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init((Class)SADataSourceInfo);
  id v7 = SAProximityHintUnknownValue;
  if (a3 > 2999)
  {
    if (a3 == 4000)
    {
      id v8 = (id *)&SAProximityHintPrimaryValue;
    }
    else
    {
      if (a3 != 3000) {
        goto LABEL_11;
      }
      id v8 = (id *)&SAProximityHintImmediateValue;
    }
  }
  else if (a3 == 1000)
  {
    id v8 = (id *)&SAProximityHintFarValue;
  }
  else
  {
    if (a3 != 2000) {
      goto LABEL_11;
    }
    id v8 = (id *)&SAProximityHintNearbyValue;
  }
  id v9 = *v8;

  id v7 = v9;
LABEL_11:
  [v6 setProximityHint:v7];
  BOOL v10 = [v5 identifier];
  id v11 = [v10 UUIDString];
  [v6 setContextIdentifier:v11];

  BOOL v12 = [v5 deviceInfo];

  unsigned int v13 = [v12 isCommunalDevice];
  id v14 = &SASourceDeviceOwnershipCommunalValue;
  if (!v13) {
    id v14 = &SASourceDeviceOwnershipPersonalValue;
  }
  [v6 setSourceDeviceOwnership:*v14];

  return v6;
}

- (id)_alarmAceObjectFromAlarm:(id)a3 withProximity:(int64_t)a4 inDeviceContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init((Class)SAAlarmObject);
  id v11 = [v8 alarmURL];
  [v10 setIdentifier:v11];

  BOOL v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 hour]);
  [v10 setHour:v12];

  unsigned int v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 minute]);
  [v10 setMinute:v13];

  id v14 = [v8 repeatOptions];
  if (!v14)
  {
    id v17 = 0;
    goto LABEL_18;
  }
  char v15 = (char)v14;
  id v16 = objc_alloc_init((Class)NSMutableArray);
  id v17 = v16;
  if (v15)
  {
    [v16 addObject:SAAlarmDayOfWeekMondayValue];
    if ((v15 & 2) == 0)
    {
LABEL_4:
      if ((v15 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_13;
    }
  }
  else if ((v15 & 2) == 0)
  {
    goto LABEL_4;
  }
  [v17 addObject:SAAlarmDayOfWeekTuesdayValue];
  if ((v15 & 4) == 0)
  {
LABEL_5:
    if ((v15 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v17 addObject:SAAlarmDayOfWeekWednesdayValue];
  if ((v15 & 8) == 0)
  {
LABEL_6:
    if ((v15 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v17 addObject:SAAlarmDayOfWeekThursdayValue];
  if ((v15 & 0x10) == 0)
  {
LABEL_7:
    if ((v15 & 0x20) == 0) {
      goto LABEL_8;
    }
LABEL_16:
    [v17 addObject:SAAlarmDayOfWeekSaturdayValue];
    if ((v15 & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_15:
  [v17 addObject:SAAlarmDayOfWeekFridayValue];
  if ((v15 & 0x20) != 0) {
    goto LABEL_16;
  }
LABEL_8:
  if ((v15 & 0x40) != 0) {
LABEL_17:
  }
    [v17 addObject:SAAlarmDayOfWeekSundayValue];
LABEL_18:
  if ([v17 count])
  {
    uint64_t v18 = +[NSArray arrayWithArray:v17];
  }
  else
  {
    uint64_t v25 = SAAlarmDayOfWeekNeverValue;
    uint64_t v18 = +[NSArray arrayWithObjects:&v25 count:1];
  }
  uint64_t v19 = (void *)v18;
  [v10 setFrequency:v18];
  id v20 = [v8 title];
  [v10 setLabel:v20];

  id v21 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 isFiring]);
  [v10 setFiring:v21];

  uint64_t v22 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 isEnabled]);
  [v10 setEnabled:v22];

  id v23 = [(ADContextManager *)self _dataSourceInfoWithProximity:a4 deviceContext:v9];

  [v10 setDataSourceInfo:v23];
  return v10;
}

- (id)_timerAceObjectFromTimer:(id)a3 withProximity:(int64_t)a4 inDeviceContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init((Class)SATimerObject);
  id v11 = [v8 timerURL];
  [v10 setIdentifier:v11];

  if ([v8 isFiring])
  {
    id v12 = SATimerStateFiringValue;
    [v10 setIsFiring:&__kCFBooleanTrue];
  }
  else
  {
    switch((unint64_t)[v8 state])
    {
      case 0uLL:
        unsigned int v13 = (id *)&SATimerStateUndefinedValue;
        goto LABEL_9;
      case 1uLL:
        unsigned int v13 = (id *)&SATimerStateStoppedValue;
        goto LABEL_9;
      case 2uLL:
        unsigned int v13 = (id *)&SATimerStatePausedValue;
        goto LABEL_9;
      case 3uLL:
        unsigned int v13 = (id *)&SATimerStateRunningValue;
LABEL_9:
        id v12 = *v13;
        break;
      default:
        id v12 = 0;
        break;
    }
  }
  [v10 setState:v12];
  if ([v8 state] == (id)1 || objc_msgSend(v8, "state") == (id)2)
  {
    [v8 fireTimeInterval];
    id v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v10 setTimerValue:v14];
  }
  if ([v8 state] == (id)3)
  {
    char v15 = [v8 fireDate];
    [v15 timeIntervalSinceNow];
    id v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v10 setTimerValue:v16];
  }
  id v17 = [v8 title];
  [v10 setTitle:v17];

  id v18 = SATimerTypeUndefinedValue;
  id v19 = [v8 type];
  if (v19 == (id)1)
  {
    id v20 = (id *)&SATimerTypeDefaultValue;
  }
  else
  {
    if (v19 != (id)2) {
      goto LABEL_20;
    }
    id v20 = (id *)&SATimerTypeSleepTimerValue;
  }
  id v21 = *v20;

  id v18 = v21;
LABEL_20:
  [v10 setType:v18];
  uint64_t v22 = [(ADContextManager *)self _dataSourceInfoWithProximity:a4 deviceContext:v9];

  [v10 setDataSourceInfo:v22];
  return v10;
}

- (void)_setCollectingContext:(BOOL)a3
{
  if (self->_collectingContext != a3)
  {
    BOOL v3 = a3;
    id v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      id v8 = "-[ADContextManager _setCollectingContext:]";
      __int16 v9 = 1024;
      BOOL v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s #hal %d", (uint8_t *)&v7, 0x12u);
    }
    self->_collectingContext = v3;
    remoteContextStore = self->_remoteContextStore;
    if (v3) {
      [(ADRemoteContextStore *)remoteContextStore startCollectingContext];
    }
    else {
      [(ADRemoteContextStore *)remoteContextStore stopCollectingContext];
    }
  }
}

- (void)_unregisterForBGUpdates
{
  if (self->_registeredForContextUpdates)
  {
    BOOL v3 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      __int16 v9 = "-[ADContextManager _unregisterForBGUpdates]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s No longer observing notifications", (uint8_t *)&v8, 0xCu);
    }
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:AFPreferencesNavStatusDidChangeNotification object:0];
    [v4 removeObserver:self name:@"ADCurrentHomeKitHomeChanged" object:0];
    [v4 removeObserver:self name:@"ADCallStateDidChangeNotification" object:0];
    id v5 = +[SOMediaNowPlayingObserver defaultObserver];
    [v5 removeListener:self];

    int deviceProblemsRegistrationToken = self->_deviceProblemsRegistrationToken;
    if (deviceProblemsRegistrationToken != -1)
    {
      notify_cancel(deviceProblemsRegistrationToken);
      self->_int deviceProblemsRegistrationToken = -1;
    }
    int musicPersonalizationTokenRegistrationToken = self->_musicPersonalizationTokenRegistrationToken;
    if (musicPersonalizationTokenRegistrationToken != -1)
    {
      notify_cancel(musicPersonalizationTokenRegistrationToken);
      self->_int musicPersonalizationTokenRegistrationToken = -1;
    }
    [(ADHomeAnnouncementContextAdaptor *)self->_homeAnnouncementContextAdaptor unregisterSnapshotUpdater];
    self->_registeredForContextUpdates = 0;
  }
}

- (void)_registerForBGUpdates
{
  if (!self->_registeredForContextUpdates)
  {
    self->_registeredForContextUpdates = 1;
    BOOL v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"navStatusDidChange:" name:AFPreferencesNavStatusDidChangeNotification object:0];
    [v3 addObserver:self selector:"updateBackgroundContextIfHomeKitInfoChanged" name:@"ADCurrentHomeKitHomeChanged" object:0];
    [v3 addObserver:self selector:"_callStateDidChange:" name:@"ADCallStateDidChangeNotification" object:0];
    [v3 addObserver:self selector:"_playbackDevicesDidChange:" name:@"ADCompanionServicePlaybackDevicesDidChangeNotification" object:0];
    id v4 = +[SOMediaNowPlayingObserver defaultObserver];
    [v4 addListener:self];

    if (((AFIsHorseman() & 1) != 0 || AFIsATV()) && self->_deviceProblemsRegistrationToken == -1)
    {
      LODWORD(out_token) = -1;
      objc_initWeak((id *)location, self);
      bgContextQueue = self->_bgContextQueue;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000F5140;
      handler[3] = &unk_100509778;
      objc_copyWeak(&v18, (id *)location);
      if (!notify_register_dispatch("com.apple.sharing.problems", (int *)&out_token, bgContextQueue, handler)) {
        self->_int deviceProblemsRegistrationToken = (int)out_token;
      }
      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)location);
    }
    if (self->_musicPersonalizationTokenRegistrationToken == -1)
    {
      int v16 = -1;
      objc_initWeak(&out_token, self);
      id v6 = self->_bgContextQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000F5190;
      v13[3] = &unk_100509778;
      objc_copyWeak(&v14, &out_token);
      uint64_t v7 = AFCachedFusePersonalizationTokenChanged;
      if (notify_register_dispatch(AFCachedFusePersonalizationTokenChanged, &v16, v6, v13))
      {
        int v8 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id location = 136315394;
          *(void *)&location[4] = "-[ADContextManager _registerForBGUpdates]";
          __int16 v20 = 2080;
          uint64_t v21 = v7;
          _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Could not register for %s notification", location, 0x16u);
        }
      }
      else
      {
        self->_int musicPersonalizationTokenRegistrationToken = v16;
      }
      objc_destroyWeak(&v14);
      objc_destroyWeak(&out_token);
    }
    if (+[AFFeatureFlags isAnnounceEnabled])
    {
      objc_initWeak((id *)location, self);
      homeAnnouncementContextAdaptor = self->_homeAnnouncementContextAdaptor;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000F51D0;
      v11[3] = &unk_100501DC0;
      v11[4] = self;
      objc_copyWeak(&v12, (id *)location);
      [(ADHomeAnnouncementContextAdaptor *)homeAnnouncementContextAdaptor registerSnapshotUpdater:v11];
      objc_destroyWeak(&v12);
      objc_destroyWeak((id *)location);
    }
    BOOL v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id location = 136315138;
      *(void *)&location[4] = "-[ADContextManager _registerForBGUpdates]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s observing notifications", location, 0xCu);
    }
  }
}

- (void)getBackgroundContext:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[ADContextManager getBackgroundContext:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F5420;
  v8[3] = &unk_10050E188;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v8);
  dispatch_async((dispatch_queue_t)self->_bgContextQueue, v7);
}

- (void)preheatBackgroundContext
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADContextManager preheatBackgroundContext]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(ADContextManager *)self getBackgroundContext:0];
}

- (void)_getBackgroundContext:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  id v6 = self->_analytics;
  CFStringRef v49 = @"group";
  dispatch_block_t v7 = +[NSNumber numberWithLong:v5];
  id v50 = v7;
  int v8 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];

  [(AFAnalytics *)v6 logEventWithType:4501 context:v8];
  id v9 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    bgContext = self->_bgContext;
    CFStringRef v44 = "-[ADContextManager _getBackgroundContext:]";
    *(_DWORD *)buf = 136315650;
    if (bgContext) {
      id v11 = "(cache read)";
    }
    else {
      id v11 = "(regenerating all values)";
    }
    __int16 v45 = 2048;
    id v46 = v5;
    __int16 v47 = 2080;
    v48 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Start ctxg=%p %s", buf, 0x20u);
  }
  if (!self->_bgContext)
  {
    id v12 = objc_alloc_init(ADBackgroundContextCache);
    unsigned int v13 = self->_bgContext;
    self->_bgContext = v12;

    [(ADContextManager *)self _registerForBGUpdates];
    if (AFDeviceSupportsNavigation())
    {
      dispatch_group_enter(v5);
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_1000F5A18;
      v41[3] = &unk_10050B918;
      id v42 = v5;
      [(ADContextManager *)self _updateNavStatusWithContext:v8 completion:v41];
    }
    dispatch_group_enter(v5);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000F5ADC;
    v39[3] = &unk_10050B918;
    id v14 = v5;
    id v40 = v14;
    [(ADContextManager *)self _updateNowPlayingInfoWithContext:v8 completion:v39];
    dispatch_group_enter(v14);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000F5BA0;
    v37[3] = &unk_10050B918;
    char v15 = v14;
    id v38 = v15;
    [(ADContextManager *)self _updatePlaybackDevicesWithContext:v8 completion:v37];
    dispatch_group_enter(v15);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000F5C64;
    v35[3] = &unk_10050B918;
    int v16 = v15;
    v36 = v16;
    [(ADContextManager *)self _updateSimpleThingsWithContext:v8 completion:v35];
    if ((AFIsHorseman() & 1) != 0 || AFIsATV())
    {
      dispatch_group_enter(v16);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1000F5D28;
      v33[3] = &unk_10050B918;
      uint64_t v34 = v16;
      [(ADContextManager *)self _updateDeviceProblemsWithContext:v8 token:0xFFFFFFFFLL completion:v33];
    }
    dispatch_group_enter(v16);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000F5DEC;
    v31[3] = &unk_10050B918;
    id v17 = v16;
    __int16 v32 = v17;
    [(ADContextManager *)self _updateMusicPersonalizationTokenWithContext:v8 completion:v31];
    if (+[AFFeatureFlags isAnnounceEnabled])
    {
      dispatch_group_enter(v17);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1000F5EB0;
      v29[3] = &unk_10050B918;
      __int16 v30 = v17;
      [(ADContextManager *)self _updateHomeAnnouncementWithContext:v8 supplementalSnapshot:0 completion:v29];
    }
  }
  bgContextQueue = self->_bgContextQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000F5F74;
  v23[3] = &unk_10050D3F0;
  __int16 v24 = v6;
  id v25 = v8;
  id v26 = v5;
  id v27 = self;
  id v28 = v4;
  id v19 = v4;
  __int16 v20 = v5;
  id v21 = v8;
  uint64_t v22 = v6;
  dispatch_group_notify(v20, bgContextQueue, v23);
}

- (void)_updateSimpleThingsWithContext:(id)a3 completion:(id)a4
{
  id v17 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  dispatch_block_t v7 = self->_analytics;
  [(AFAnalytics *)v7 logEventWithType:4519 context:v17];
  if ([(AFInstanceContext *)self->_instanceContext supportsTelephony])
  {
    [(AFAnalytics *)v7 logEventWithType:4517 context:v17];
    uint64_t v8 = [(ADContextManager *)self _inlineUpdatePhoneState];
    int v9 = v8;
    BOOL v10 = sub_1000F6214(v17, v8);
    [(AFAnalytics *)v7 logEventWithType:4518 context:v10];
  }
  else
  {
    int v9 = 0;
  }
  [(AFAnalytics *)self->_analytics logEventWithType:4511 context:v17];
  uint64_t v11 = [(ADContextManager *)self _inlineUpdateCurrentHomeKitHome];
  unsigned int v12 = v11;
  analytics = self->_analytics;
  id v14 = sub_1000F6214(v17, v11);
  [(AFAnalytics *)analytics logEventWithType:4512 context:v14];

  uint64_t v15 = v9 | v12;
  int v16 = sub_1000F6214(v17, v15);
  [(AFAnalytics *)v7 logEventWithType:4520 context:v16];

  if (v6) {
    v6[2](v6, v15);
  }
}

- (void)_logForceFetchWithStartTime:(unint64_t)a3 forceFetchCount:(unint64_t)a4 forceFetchError:(id)a5 halMetricsId:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  metricsQueue = self->_metricsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F63FC;
  block[3] = &unk_10050D778;
  void block[4] = self;
  id v16 = v11;
  unint64_t v18 = a3;
  unint64_t v19 = a4;
  id v17 = v10;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(metricsQueue, block);
}

- (void)_logForceFetchContextFailedWithHALMetricsId:(id)a3 contextId:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 domain];
  LODWORD(a3) = [v10 isEqualToString:kAFAssistantErrorDomain];

  if (a3)
  {
    id v11 = [v7 code];
    if (v11 == (id)1013) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = v11 == (id)3102;
    }
  }
  else
  {
    uint64_t v12 = 2 * (v7 == 0);
  }
  id v13 = objc_alloc_init((Class)HALSchemaHALForceFetchFailed);
  [v13 setFailureReason:v12];
  id v14 = objc_alloc_init((Class)HALSchemaHALClientEvent);
  id v15 = objc_alloc_init((Class)HALSchemaHALForceFetchContext);
  [v15 setContextId:v8];

  [v15 setFailed:v13];
  [v14 setForceFetchContext:v15];
  id v16 = objc_alloc_init((Class)HALSchemaHALClientEventMetadata);
  id v17 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v9];

  [v16 setHalId:v17];
  [v14 setEventMetadata:v16];
  unint64_t v18 = +[AssistantSiriAnalytics sharedStream];
  [v18 emitMessage:v14];

  unint64_t v19 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    id v21 = "-[ADContextManager _logForceFetchContextFailedWithHALMetricsId:contextId:error:]";
    __int16 v22 = 2112;
    id v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s #hal Emitted forceFetch.failed event %@ to sharedStream", (uint8_t *)&v20, 0x16u);
  }
}

- (void)_logForceFetchContextEndedWithHALMetricsId:(id)a3 contextId:(id)a4 forceFetchCount:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init((Class)HALSchemaHALForceFetchEnded);
  [v9 setNumDeviceContextsFetched:a5];
  id v10 = objc_alloc_init((Class)HALSchemaHALClientEvent);
  id v11 = objc_alloc_init((Class)HALSchemaHALForceFetchContext);
  [v11 setContextId:v7];

  [v11 setEnded:v9];
  [v10 setForceFetchContext:v11];
  id v12 = objc_alloc_init((Class)HALSchemaHALClientEventMetadata);
  id v13 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v8];

  [v12 setHalId:v13];
  [v10 setEventMetadata:v12];
  id v14 = +[AssistantSiriAnalytics sharedStream];
  [v14 emitMessage:v10];

  id v15 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    id v17 = "-[ADContextManager _logForceFetchContextEndedWithHALMetricsId:contextId:forceFetchCount:]";
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s #hal Emitted forceFetch.ended event %@ to sharedStream", (uint8_t *)&v16, 0x16u);
  }
}

- (void)_logForceFetchContextStartedWithHALMetricsId:(id)a3 contextId:(id)a4 timestamp:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init((Class)HALSchemaHALForceFetchStarted);
  [v9 setExists:1];
  id v10 = objc_alloc_init((Class)HALSchemaHALClientEvent);
  id v11 = objc_alloc_init((Class)HALSchemaHALForceFetchContext);
  [v11 setContextId:v7];

  [v11 setStartedOrChanged:v9];
  [v10 setForceFetchContext:v11];
  id v12 = objc_alloc_init((Class)HALSchemaHALClientEventMetadata);
  id v13 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v8];

  [v12 setHalId:v13];
  [v10 setEventMetadata:v12];
  id v14 = +[AssistantSiriAnalytics sharedStream];
  [v14 emitMessage:v10 timestamp:a5];

  mach_absolute_time();
  AFMachAbsoluteTimeGetTimeInterval();
  uint64_t v16 = v15;
  id v17 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315650;
    id v19 = "-[ADContextManager _logForceFetchContextStartedWithHALMetricsId:contextId:timestamp:]";
    __int16 v20 = 2048;
    uint64_t v21 = v16;
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s #hal Emitted forceFetch.started event (%fs ago): %@ to sharedStream", (uint8_t *)&v18, 0x20u);
  }
}

- (void)_logFetchLocalContextEnded:(id)a3
{
  id v4 = a3;
  metricsQueue = self->_metricsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F6B00;
  block[3] = &unk_10050E138;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(metricsQueue, block);
}

- (void)_logFetchLocalContextStarted:(id)a3
{
  id v4 = a3;
  metricsQueue = self->_metricsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F6D18;
  block[3] = &unk_10050E138;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(metricsQueue, block);
}

- (void)_logContextCollectorFetchFailed:(id)a3
{
  id v4 = a3;
  metricsQueue = self->_metricsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F6F30;
  block[3] = &unk_10050E138;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(metricsQueue, block);
}

- (void)_logContextCollectorFetchEnded:(id)a3 numDeviceContextsFetched:(unint64_t)a4
{
  id v6 = a3;
  metricsQueue = self->_metricsQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000F714C;
  v9[3] = &unk_10050D8C0;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(metricsQueue, v9);
}

- (void)_logContextCollectorFetchStarted:(id)a3
{
  id v4 = a3;
  metricsQueue = self->_metricsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F736C;
  block[3] = &unk_10050E138;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(metricsQueue, block);
}

- (void)_stopPeriodicContextFetchFromNearbyDevices
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[ADContextManager _stopPeriodicContextFetchFromNearbyDevices]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  [(AFWatchdogTimer *)self->_contextRefreshTimer cancel];
  contextRefreshTimer = self->_contextRefreshTimer;
  self->_contextRefreshTimer = 0;
}

- (void)_startPeriodicContextFetchFromNearbyDevices
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[ADContextManager _startPeriodicContextFetchFromNearbyDevices]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  id v4 = objc_alloc((Class)AFWatchdogTimer);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F76DC;
  v8[3] = &unk_10050E138;
  v8[4] = self;
  id v6 = (AFWatchdogTimer *)[v4 initWithTimeoutInterval:queue onQueue:v8 timeoutHandler:14400.0];
  contextRefreshTimer = self->_contextRefreshTimer;
  self->_contextRefreshTimer = v6;

  [(AFWatchdogTimer *)self->_contextRefreshTimer start];
}

- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  id v8 = a4;
  id v9 = [v8 uuid];
  id v10 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v14 = v10;
    uint64_t v15 = +[NSNumber numberWithInteger:a5];
    currentRequestInfoUUID = self->_currentRequestInfoUUID;
    *(_DWORD *)buf = 136315906;
    id v23 = "-[ADContextManager requestLifecycleObserver:requestDidEndWithInfo:origin:client:]";
    __int16 v24 = 2112;
    id v25 = v15;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = currentRequestInfoUUID;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s #hal requestDidEndWithInfo origin:%@, uuid: %@. _currentRequestInfoUUID: %@", buf, 0x2Au);
  }
  queue = self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000F7AA0;
  v17[3] = &unk_10050DD08;
  id v18 = v9;
  id v19 = self;
  id v20 = v8;
  int64_t v21 = a5;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(queue, v17);
}

- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  id v8 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F7D1C;
  block[3] = &unk_10050E278;
  id v13 = self;
  int64_t v14 = a5;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, block);
}

- (void)getContextSnapshotForForeignRequestID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F80DC;
  block[3] = &unk_10050E1D8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)pushContextSnapshotForCurrentRequestWithID:(id)a3 toDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (AFSupportsHALContextDonation())
  {
    if (v6)
    {
      id v8 = [v7 afPeerInfo];
      id v9 = sub_10016A938(v8, 0);

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000F82C8;
      v12[3] = &unk_100504A70;
      id v13 = v6;
      int64_t v14 = self;
      id v15 = v9;
      id v10 = v9;
      [(ADContextManager *)self getContextSnapshotForCurrentRequestWithCompletion:v12];
    }
    else
    {
      unint64_t v11 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v17 = "-[ADContextManager pushContextSnapshotForCurrentRequestWithID:toDevice:]";
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s #hal No request ID specified, skipping", buf, 0xCu);
      }
    }
  }
}

- (void)getContextSnapshotForCurrentRequestWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADContextManager getContextSnapshotForCurrentRequestWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }
  if (v4)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v23 = 0x3032000000;
    __int16 v24 = sub_1000EFA64;
    id v25 = sub_1000EFA74;
    id v26 = 0;
    id v6 = objc_alloc((Class)AFSafetyBlock);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    id v19[2] = sub_1000F8AC0;
    v19[3] = &unk_10050CA30;
    p_long long buf = &buf;
    v19[4] = self;
    id v20 = v4;
    id v7 = [v6 initWithBlock:v19];
    objc_initWeak(&location, v7);
    id v8 = objc_alloc((Class)AFWatchdogTimer);
    queue = self->_queue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000F8B40;
    v16[3] = &unk_10050C7C8;
    objc_copyWeak(&v17, &location);
    v16[4] = self;
    id v10 = [v8 initWithTimeoutInterval:queue onQueue:v16 timeoutHandler:1.7];
    unint64_t v11 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v10;

    [*(id *)(*((void *)&buf + 1) + 40) start];
    id v12 = self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000F8C18;
    v14[3] = &unk_10050E160;
    v14[4] = self;
    id v15 = v7;
    id v13 = v7;
    dispatch_async(v12, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

    _Block_object_dispose(&buf, 8);
  }
}

- (void)_fetchContextSnapshotForCurrentRequest
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    currentRequestInfoUUID = self->_currentRequestInfoUUID;
    *(_DWORD *)long long buf = 136315394;
    id v38 = "-[ADContextManager _fetchContextSnapshotForCurrentRequest]";
    __int16 v39 = 2112;
    id v40 = currentRequestInfoUUID;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s _currentRequestInfoUUID = %@", buf, 0x16u);
  }
  id v4 = self->_currentRequestInfoUUID;
  self->_contextSnapshotFetchTimedOut = 0;
  +[NSUUID UUID];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000F9248;
  v33[3] = &unk_100504A70;
  void v33[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v34 = v5;
  id v6 = v4;
  id v35 = v6;
  id v7 = objc_retainBlock(v33);
  ((void (*)(void *, void *))v7[2])(v7, &__NSArray0__struct);
  id v8 = self->_analytics;
  uint64_t v9 = mach_absolute_time();
  uint64_t Milliseconds = AFMachAbsoluteTimeGetMilliseconds();
  deviceCircleManager = self->_deviceCircleManager;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000F96B4;
  v30[3] = &unk_100501B70;
  id v12 = v8;
  id v31 = v12;
  uint64_t v32 = v9;
  [(ADDeviceCircleManager *)deviceCircleManager getContextCollectorDeviceIdentifiersWithCompletion:v30];
  [(ADContextManager *)self _logFetchLocalContextStarted:v5];
  [(ADContextManager *)self _logContextCollectorFetchStarted:v5];
  if (AFSupportsHALOnDemandRapportConnection()) {
    double v13 = 3.6;
  }
  else {
    double v13 = 1.6;
  }
  int64_t v14 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v20 = v14;
    int64_t v21 = +[NSNumber numberWithDouble:v13];
    *(_DWORD *)long long buf = 136315394;
    id v38 = "-[ADContextManager _fetchContextSnapshotForCurrentRequest]";
    __int16 v39 = 2112;
    id v40 = v21;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s #hal context fetch timeout value: %@", buf, 0x16u);
  }
  uint64_t v36 = AFDeviceContextKeyAll;
  id v15 = +[NSArray arrayWithObjects:&v36 count:1];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000F97B4;
  v27[3] = &unk_100501B98;
  v27[4] = self;
  id v29 = v7;
  id v28 = v5;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000F9870;
  v22[3] = &unk_100501D70;
  id v25 = v29;
  uint64_t v26 = Milliseconds;
  void v22[4] = self;
  uint64_t v23 = v12;
  id v24 = v28;
  id v16 = v28;
  id v17 = v12;
  id v18 = v29;
  [(ADContextManager *)self getContextIncludingKeys:v15 excludingMandatoryKeys:0 timeOut:v27 localContextCompletion:v22 completion:v13];
}

- (void)_getDevicesWithContexts:(id)a3 passingTest:(id)a4 capabilitesPassingTest:(id)a5 completion:(id)a6
{
  id v10 = a3;
  unint64_t v11 = (unsigned int (**)(id, void *))a4;
  id v27 = a5;
  id v12 = a6;
  double v13 = v12;
  if (v12)
  {
    id v25 = v12;
    id v26 = objc_alloc_init((Class)NSMutableArray);
    int64_t v14 = dispatch_group_create();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v10;
    id v15 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v38;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(obj);
          }
          id v19 = [*(id *)(*((void *)&v37 + 1) + 8 * i) content];
          if (v11[2](v11, v19))
          {
            id v20 = [v19 deviceInfo];
            dispatch_group_enter(v14);
            deviceCircleManager = self->_deviceCircleManager;
            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472;
            v32[2] = sub_1000FAD94;
            v32[3] = &unk_100501B08;
            void v32[4] = self;
            id v36 = v27;
            id v33 = v26;
            id v34 = v20;
            id v35 = v14;
            id v22 = v20;
            [(ADDeviceCircleManager *)deviceCircleManager getCapabilitiesForDevice:v22 completion:v32];
          }
        }
        id v16 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v16);
    }

    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000FAE8C;
    block[3] = &unk_10050E188;
    double v13 = v25;
    id v30 = v26;
    id v31 = v25;
    id v24 = v26;
    dispatch_group_notify(v14, queue, block);
  }
}

- (void)getDeviceContextsForKeys:(id)a3 forForeignRequestID:(id)a4 includesNearbyDevices:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  double v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v28 = "-[ADContextManager getDeviceContextsForKeys:forForeignRequestID:includesNearbyDevices:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s #hal", buf, 0xCu);
  }
  if (v12)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000FB190;
    v23[3] = &unk_100501AE0;
    BOOL v26 = v7;
    void v23[4] = self;
    id v24 = v10;
    id v25 = v12;
    int64_t v14 = objc_retainBlock(v23);
    id v15 = v14;
    if (v11)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000FB3F4;
      v21[3] = &unk_10050CE88;
      id v22 = v14;
      [(ADContextManager *)self getContextSnapshotForForeignRequestID:v11 completion:v21];
      id v16 = v22;
    }
    else if (v7)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      id v19[2] = sub_1000FB404;
      v19[3] = &unk_10050DEC0;
      v19[4] = self;
      id v20 = v14;
      [(ADContextManager *)self getContextSnapshotForCurrentRequestWithCompletion:v19];
      id v16 = v20;
    }
    else
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000FB4C0;
      v17[3] = &unk_1005060F8;
      void v17[4] = self;
      id v18 = v14;
      [(ADContextManager *)self getLocalContextWithPrivacyClass:10 completion:v17];
      id v16 = v18;
    }
  }
}

- (id)localContextWithPrivacyClass:(int64_t)a3
{
  return [(ADLocalContextStore *)self->_localContextStore localContextWithPrivacyClass:a3];
}

- (void)getLocalContextWithPrivacyClass:(int64_t)a3 completion:(id)a4
{
  if (a4) {
    -[ADLocalContextStore getLocalContextWithPrivacyClass:completion:](self->_localContextStore, "getLocalContextWithPrivacyClass:completion:", a3);
  }
}

- (void)getContextIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4 timeOut:(double)a5 localContextCompletion:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = +[NSUUID UUID];
  uint64_t v17 = [v16 UUIDString];
  id v18 = [v17 componentsSeparatedByString:@"-"];
  id v19 = [v18 firstObject];

  id v20 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136316162;
    id v31 = "-[ADContextManager getContextIncludingKeys:excludingMandatoryKeys:timeOut:localContextCompletion:completion:]";
    __int16 v32 = 2112;
    id v33 = v19;
    __int16 v34 = 2112;
    id v35 = v12;
    __int16 v36 = 2112;
    id v37 = v13;
    __int16 v38 = 2048;
    double v39 = a5;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s #hal (%@) includedKeys: %@, excludedKeys: %@, timeOut: %f", buf, 0x34u);
  }
  kdebug_trace();
  if (v15)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000FBFC4;
    block[3] = &unk_100501A90;
    id v23 = v19;
    id v24 = self;
    id v27 = v15;
    double v29 = a5;
    id v28 = v14;
    id v25 = v12;
    id v26 = v13;
    dispatch_async(queue, block);
  }
}

- (void)getContextIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4 timeOut:(double)a5 completion:(id)a6
{
}

- (void)_getNowPlayingMediaIsResumable:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = [(ADBackgroundContextCache *)self->_bgContext queueState];
  id v6 = [v5 applicationIdentifier];
  if ([v6 isEqualToString:@"com.apple.sirireaderd"])
  {
    BOOL v7 = [v5 state] == 2;
  }
  else
  {
    id v8 = [v5 applicationIdentifier];
    if ([v8 isEqualToString:@"com.apple.siri.sirireaderd"]) {
      BOOL v7 = [v5 state] == 2;
    }
    else {
      BOOL v7 = 0;
    }
  }
  if ([v5 state] != 1 && !v7)
  {
    uint64_t v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v23 = 136315138;
      id v24 = "-[ADContextManager _getNowPlayingMediaIsResumable:]";
      id v10 = "%s Now playing media was not interrupted. It should not be resumed.";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v23, 0xCu);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  id v11 = [v5 listeningToItem];
  id v12 = [v11 mediaType];
  unsigned int v13 = [v12 isEqualToString:SANPMediaTypeVideoValue];

  if (v13)
  {
    uint64_t v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v23 = 136315138;
      id v24 = "-[ADContextManager _getNowPlayingMediaIsResumable:]";
      id v10 = "%s Interrupted media is video. It should not be resumed.";
      goto LABEL_14;
    }
LABEL_15:
    uint64_t v14 = 0;
    goto LABEL_16;
  }
  id v15 = objc_opt_class();
  id v16 = [v5 applicationIdentifier];
  LODWORD(v15) = [v15 _isResumableFirstPartyBundleID:v16];

  if (v15)
  {
    uint64_t v17 = AFSiriLogContextDaemon;
    uint64_t v14 = 1;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v23 = 136315138;
      id v24 = "-[ADContextManager _getNowPlayingMediaIsResumable:]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Interrupted now playing app is a resumable first party app.", (uint8_t *)&v23, 0xCu);
    }
  }
  else
  {
    id v18 = [v5 applicationIdentifier];
    id v19 = +[LSApplicationProxy applicationProxyForIdentifier:v18];

    id v20 = objc_opt_class();
    int64_t v21 = [v19 genreID];
    uint64_t v14 = (uint64_t)[v20 _isResumableThirdPartyGenreID:v21];

    if (v14)
    {
      id v22 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v23 = 136315138;
        id v24 = "-[ADContextManager _getNowPlayingMediaIsResumable:]";
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s Interrupted now playing app has a resumable third party genre.", (uint8_t *)&v23, 0xCu);
      }
    }
  }
LABEL_16:
  if (v4) {
    v4[2](v4, v14);
  }
}

- (void)getNowPlayingMediaIsResumable:(id)a3
{
  id v4 = a3;
  bgContextQueue = self->_bgContextQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FD474;
  v7[3] = &unk_10050E188;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(bgContextQueue, v7);
}

- (void)getDomainObjectFromMessageContext:(id)a3 completion:(id)a4
{
  id v11 = (void (**)(id, void *))a4;
  if (v11)
  {
    id v7 = a3;
    id v8 = AFMessagesGetDomainObjectsFromContext();

    v11[2](v11, v8);
  }
  else
  {
    id v9 = a3;
    id v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"ADContextManager.m", 891, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    id v8 = AFMessagesGetDomainObjectsFromContext();
  }
}

- (void)markBulletinAsAcknolwedgedForDomainObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [v4 identifier];
    id v6 = [v5 URLByDeletingPathExtension];
    id v7 = [v6 lastPathComponent];

    if ([v7 length])
    {
      id v8 = objc_alloc_init((Class)off_100580DD8());
      id v9 = -[NSObject voicemailWithIdentifier:](v8, "voicemailWithIdentifier:", [v7 integerValue]);
      id v10 = AFSiriLogContextDaemon;
      if (v9)
      {
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v15 = 136315394;
          id v16 = "-[ADContextManager markBulletinAsAcknolwedgedForDomainObject:]";
          __int16 v17 = 2112;
          id v18 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Marking voicemail as played: %@", (uint8_t *)&v15, 0x16u);
        }
        id v11 = [v8 markVoicemailAsRead:v9];
      }
      else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        unsigned int v13 = v10;
        uint64_t v14 = [v4 identifier];
        int v15 = 136315394;
        id v16 = "-[ADContextManager markBulletinAsAcknolwedgedForDomainObject:]";
        __int16 v17 = 2112;
        id v18 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Unable to find voicemail: %@", (uint8_t *)&v15, 0x16u);
      }
    }
    else
    {
      id v12 = (void *)AFSiriLogContextDaemon;
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
LABEL_12:

        goto LABEL_13;
      }
      id v8 = v12;
      id v9 = [v4 identifier];
      int v15 = 136315650;
      id v16 = "-[ADContextManager markBulletinAsAcknolwedgedForDomainObject:]";
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Voicemail contains invalid identifier: %@, %@", (uint8_t *)&v15, 0x20u);
    }

    goto LABEL_12;
  }
LABEL_13:
}

- (void)getAlertContextWithBulletins:(id)a3 externalAlarmSnapshot:(id)a4 timerSnapshot:(id)a5 nlAlertContextCompletion:(id)a6 fullAlertContextCompletion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v39 = a7;
  id v15 = objc_alloc_init((Class)NSMutableDictionary);
  id v16 = dispatch_group_create();
  __int16 v17 = dispatch_group_create();
  dispatch_group_enter(v16);
  dispatch_group_enter(v17);
  id v18 = sub_1000FDCAC();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FDD00;
  block[3] = &unk_10050DC68;
  id v57 = v11;
  id v19 = v15;
  id v58 = v19;
  id v20 = v16;
  id v59 = v20;
  int64_t v21 = v17;
  v60 = v21;
  id v40 = v11;
  dispatch_async(v18, block);

  id v22 = objc_alloc_init((Class)NSMutableDictionary);
  id v23 = objc_alloc_init((Class)NSMutableDictionary);
  dispatch_group_enter(v20);
  dispatch_group_enter(v21);
  id v24 = sub_1000FDCAC();
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1000FDF80;
  v47[3] = &unk_100503FF0;
  id v48 = v12;
  CFStringRef v49 = self;
  id v50 = v22;
  id v51 = v13;
  id v52 = v23;
  id v25 = v19;
  id v53 = v25;
  v54 = v20;
  id v55 = v21;
  id v26 = v21;
  id v27 = v20;
  id v38 = v23;
  id v28 = v13;
  id v29 = v22;
  id v30 = v12;
  dispatch_async(v24, v47);

  id v31 = sub_1000FDCAC();
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1000FE268;
  v44[3] = &unk_10050E188;
  id v32 = v25;
  id v45 = v32;
  id v46 = v14;
  id v33 = v14;
  dispatch_group_notify(v27, v31, v44);

  __int16 v34 = sub_1000FDCAC();
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000FE2EC;
  v41[3] = &unk_10050E188;
  id v42 = v32;
  id v43 = v39;
  id v35 = v39;
  id v36 = v32;
  dispatch_group_notify(v26, v34, v41);
}

- (void)_getCurrentUserActivityOnQueue:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_1000EFA64;
  v20[4] = sub_1000EFA74;
  id v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_1000EFA64;
  v18[4] = sub_1000EFA74;
  id v19 = 0;
  id v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000FE804;
  v14[3] = &unk_1005019C8;
  id v8 = v7;
  id v15 = v8;
  id v16 = v20;
  __int16 v17 = v18;
  if ((+[NSUserActivity _currentUserActivityUUIDWithOptions:0 completionHandler:v14] & 1) == 0)dispatch_group_leave(v8); {
  v10[0] = _NSConcreteStackBlock;
  }
  v10[1] = 3221225472;
  v10[2] = sub_1000FEA38;
  v10[3] = &unk_1005019F0;
  id v11 = v6;
  id v12 = v20;
  id v13 = v18;
  id v9 = v6;
  dispatch_group_notify(v8, v5, v10);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
}

- (void)getAppContextForDeviceState:(int64_t)a3 applicationInfos:(id)a4 completion:(id)a5
{
  char v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v6)
  {
    if ((v6 & 2) != 0)
    {
      uint64_t v10 = [(ADContextManager *)self _filteredApplicationInfosForLockedStark:v8];
    }
    else
    {
      uint64_t v10 = 0;
    }

    id v8 = (id)v10;
  }
  id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v12 = dispatch_queue_create("ContextCollation", v11);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000FEFA0;
  v16[3] = &unk_10050E228;
  id v17 = v8;
  dispatch_queue_t v18 = v12;
  id v19 = self;
  id v20 = v9;
  id v13 = v9;
  id v14 = v12;
  id v15 = v8;
  dispatch_async(v14, v16);
}

- (id)_appInfoWithBundleID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)SAAppInfo);
  id v5 = objc_alloc_init((Class)SASyncAppIdentifyingInfo);
  [v5 setBundleId:v3];

  [v4 setAppIdentifyingInfo:v5];
  return v4;
}

- (id)_filteredApplicationInfosForLockedStark:(id)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
      id v9 = objc_msgSend(v8, "identifier", (void)v14);
      unsigned __int8 v10 = [v9 isEqualToString:@"com.apple.Maps"];

      if (v10) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v8;

    if (v12)
    {
      id v18 = v12;
      id v11 = +[NSArray arrayWithObjects:&v18 count:1];
      goto LABEL_12;
    }
    id v11 = 0;
  }
  else
  {
LABEL_9:
    id v11 = 0;
    id v12 = v3;
LABEL_12:
  }
  return v11;
}

- (void)clearBackgroundContextDirtyState
{
  self->_bgContextIsDirty = 0;
}

- (BOOL)backgroundContextIsDirty
{
  return self->_bgContextIsDirty;
}

- (void)setBackgroundContextDirty
{
  self->_bgContextIsDirty = 1;
}

- (void)clearAlertContextDirtyState
{
  self->_alertContextIsDirty = 0;
}

- (BOOL)alertContextIsDirty
{
  return self->_alertContextIsDirty;
}

- (void)setAlertContextDirty
{
  self->_alertContextIsDirty = 1;
}

- (void)keepReportingNowPlayingTimingEventsHeuristically
{
  mach_absolute_time();
  self->_ignoreNowPlayingUpdatesAfterTimestamp = AFMachAbsoluteTimeAddTimeInterval();
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    id v5 = "-[ADContextManager keepReportingNowPlayingTimingEventsHeuristically]";
    __int16 v6 = 2048;
    uint64_t v7 = 0x403E000000000000;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Recording performance numbers on NowPlaying updates for %g seconds", (uint8_t *)&v4, 0x16u);
  }
}

- (void)dealloc
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v7 = "-[ADContextManager dealloc]";
    __int16 v8 = 2048;
    id v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  [(ADContextManager *)self _cancelNowPlayingCoalescingTimer];
  [(ADContextManager *)self _unregisterForBGUpdates];
  [(ADHomeAnnouncementContextAdaptor *)self->_homeAnnouncementContextAdaptor invalidate];
  homeAnnouncementContextAdaptor = self->_homeAnnouncementContextAdaptor;
  self->_homeAnnouncementContextAdaptor = 0;

  v5.receiver = self;
  v5.super_class = (Class)ADContextManager;
  [(ADContextManager *)&v5 dealloc];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  bgContextQueue = self->_bgContextQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100100030;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(bgContextQueue, v7);
}

- (void)_setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  id v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if (obj) {
      id v5 = [(ADContextManager *)self _registerForBGUpdates];
    }
    else {
      id v5 = [(ADContextManager *)self _unregisterForBGUpdates];
    }
    id v6 = obj;
  }
  _objc_release_x1(v5, v6);
}

- (void)_initialize
{
  id v3 = +[AFAnalytics sharedAnalytics];
  analytics = self->_analytics;
  self->_analytics = v3;

  *(_WORD *)&self->_alertContextIsDirty = 257;
  bgContext = self->_bgContext;
  self->_bgContext = 0;
}

- (void)reset
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v7 = "-[ADContextManager reset]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  bgContextQueue = self->_bgContextQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100100228;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(bgContextQueue, block);
}

- (id)_contextLinkMessageOptions
{
  uint64_t v4 = RPOptionStatusFlags;
  id v5 = &off_100523558;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

- (id)_configuredContextLink
{
  int v3 = AFSupportsHALOnDemandRapportConnection();
  char v4 = v3;
  uint64_t v5 = 1;
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_100100428;
  long long v14 = &unk_1005018C8;
  if (!v3) {
    uint64_t v5 = 2;
  }
  uint64_t v15 = v5;
  char v16 = v3;
  id v6 = +[ADRapportLinkConfiguration newWithBuilder:&v11];
  uint64_t v7 = [ADRapportLink alloc];
  id v8 = -[ADRapportLink initWithQueue:configuration:](v7, "initWithQueue:configuration:", self->_queue, v6, v11, v12, v13, v14);
  id v9 = [(ADContextManager *)self _contextLinkMessageOptions];
  [(ADRapportLink *)v8 registerRequestID:@"com.apple.siri.rapport-link.request.generic" options:v9];
  if ((v4 & 1) == 0)
  {
    [(ADRapportLink *)v8 setRequestHandler:self forRequestID:@"com.apple.siri.rapport-link.request.generic" messageType:@"context_push"];
    [(ADRapportLink *)v8 setRequestHandler:self forRequestID:@"com.apple.siri.rapport-link.request.generic" messageType:@"agg_context_fetch"];
    [(ADRapportLink *)v8 setRequestHandler:self forRequestID:@"com.apple.siri.rapport-link.request.generic" messageType:@"context_snapshot_push"];
    [(ADRapportLink *)v8 activateWithCompletion:&stru_1005018E8];
  }

  return v8;
}

- (id)_configuredRemoteContextStoreWithRapportLink:(id)a3 queue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[ADRemoteContextStore alloc] initWithRapportLink:v6 queue:v5];

  return v7;
}

- (id)_configuredLocalContextStoreWithInstanceContext:(id)a3 rapportLink:(id)a4 queue:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[ADLocalContextStore alloc] initWithInstanceContext:v10 rapportLink:v9 queue:v8 delegate:self];

  return v11;
}

- (id)_initWithDelegate:(id)a3 deviceCircleManager:(id)a4 deviceProximityManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v54.receiver = self;
  v54.super_class = (Class)ADContextManager;
  id v11 = [(ADContextManager *)&v54 init];
  if (v11)
  {
    uint64_t v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      unsigned __int8 v56 = "-[ADContextManager _initWithDelegate:deviceCircleManager:deviceProximityManager:]";
      __int16 v57 = 2048;
      id v58 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
    }
    if (qword_100585A70 != -1) {
      dispatch_once(&qword_100585A70, &stru_100501FC0);
    }
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v11->_deviceCircleManager, a4);
    objc_storeStrong((id *)&v11->_deviceProximityManager, a5);
    [(ADContextManager *)v11 _initialize];
    id v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("BackgroundContextQueue", v13);
    bgContextQueue = v11->_bgContextQueue;
    v11->_bgContextQueue = (OS_dispatch_queue *)v14;

    *(void *)&v11->_int deviceProblemsRegistrationToken = -1;
    [(ADContextManager *)v11 keepReportingNowPlayingTimingEventsHeuristically];
    char v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    long long v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v18 = dispatch_queue_create("ContextQueue", v17);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v18;

    id v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v21 = dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.assistant.MetricsQueue", v21);
    metricsQueue = v11->_metricsQueue;
    v11->_metricsQueue = (OS_dispatch_queue *)v22;

    uint64_t v24 = +[AFInstanceContext currentContext];
    instanceContext = v11->_instanceContext;
    v11->_instanceContext = (AFInstanceContext *)v24;

    id v26 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    contextSnapshotsReadUUIDs = v11->_contextSnapshotsReadUUIDs;
    v11->_contextSnapshotsReadUUIDs = v26;

    uint64_t v28 = [(ADContextManager *)v11 _configuredContextLink];
    rapportLink = v11->_rapportLink;
    v11->_rapportLink = (ADRapportLink *)v28;

    [(ADRapportLink *)v11->_rapportLink addListener:v11];
    uint64_t v30 = [(ADContextManager *)v11 _configuredRemoteContextStoreWithRapportLink:v11->_rapportLink queue:v11->_queue];
    remoteContextStore = v11->_remoteContextStore;
    v11->_remoteContextStore = (ADRemoteContextStore *)v30;

    id v32 = +[ADRequestLifecycleObserver sharedObserver];
    [v32 addListener:v11];

    [(ADDeviceCircleManager *)v11->_deviceCircleManager addListener:v11];
    deviceCircleManager = v11->_deviceCircleManager;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100100CF8;
    v52[3] = &unk_100505130;
    __int16 v34 = v11;
    id v53 = v34;
    [(ADDeviceCircleManager *)deviceCircleManager getContextCollectorDeviceIdentifiersWithCompletion:v52];
    uint64_t v35 = [v34 _configuredLocalContextStoreWithInstanceContext:v11->_instanceContext rapportLink:v11->_rapportLink queue:v11->_queue];
    id v36 = v34[31];
    v34[31] = (id)v35;

    if (+[AFFeatureFlags isAnnounceEnabled])
    {
      id v37 = [[ADHomeAnnouncementContextAdaptor alloc] initWithInstanceContext:v11->_instanceContext];
      id v38 = v34[13];
      v34[13] = v37;
    }
    uint64_t v39 = [(AFInstanceContext *)v11->_instanceContext createXPCListenerWithMachServiceName:kAssistantDeviceContextServiceName];
    id v40 = v34[28];
    v34[28] = (id)v39;

    [v34[28] setDelegate:v34];
    [v34[28] _setQueue:v11->_queue];
    [v34[28] resume];
    BOOL v41 = v11->_queue;
    id v42 = +[ADQueueMonitor sharedMonitor];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100100D8C;
    v50[3] = &unk_10050C458;
    id v51 = v41;
    id v43 = v41;
    [v42 addQueue:v43 heartBeatInterval:v50 timeoutInterval:5.0 timeoutHandler:5.0];

    CFStringRef v44 = v11->_bgContextQueue;
    id v45 = +[ADQueueMonitor sharedMonitor];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100100EA8;
    v48[3] = &unk_10050C458;
    CFStringRef v49 = v44;
    id v46 = v44;
    [v45 addQueue:v46 heartBeatInterval:v48 timeoutInterval:5.0 timeoutHandler:5.0];
  }
  return v11;
}

- (ADContextManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = +[ADDeviceCircleManager sharedInstance];
  id v6 = +[ADDeviceProximityManager sharedManager];
  uint64_t v7 = [(ADContextManager *)self _initWithDelegate:v4 deviceCircleManager:v5 deviceProximityManager:v6];

  return v7;
}

+ (BOOL)_isResumableThirdPartyGenreID:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToNumber:&off_100523570] & 1) != 0
    || ([v3 isEqualToNumber:&off_100523588] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = [v3 isEqualToNumber:&off_1005235A0];
  }

  return v4;
}

+ (BOOL)_isResumableFirstPartyBundleID:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"com.apple.Music"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.podcasts"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.iBooks"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.NanoMusic"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.NanoRadio"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.NanoBooks"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.sirireaderd"] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = [v3 isEqualToString:@"com.apple.siri.sirireaderd"];
  }

  return v4;
}

@end