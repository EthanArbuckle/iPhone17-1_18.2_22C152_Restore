@interface ADAnnounceDeviceSelector
+ (id)_requestToExecuteCommand:(id)a3 onRemoteWithAssistantId:(id)a4;
+ (id)sharedDeviceSelector;
- (ADExternalNotificationRequestHandler)externalNotificationRequestHandler;
- (ADSiriHeadphonesMonitor)headphonesManager;
- (BOOL)_shouldHandleAnnouncementLocallyForRoute:(id)a3 notificationRequest:(id)a4;
- (NSMutableDictionary)announceIdToRemoteAssistantIdMap;
- (NSMutableDictionary)predictionIdToAnnounceIdMap;
- (id)_announcementRequestFromRemoteAnnouncementRequest:(id)a3 withCompletion:(id)a4;
- (id)_createPerformRemoteAnnoucementRequestFromNotificationRequest:(id)a3;
- (id)_init;
- (id)pairedPhone;
- (void)_populateCachesForRequest:(id)a3 toRemoteAssistantId:(id)a4;
- (void)deactivateWorkoutReminderAnnouncementWithPredictionId:(id)a3 completion:(id)a4;
- (void)handleAnnouncementRequest:(id)a3;
- (void)handleRemoteAnnounceRequest:(id)a3 completion:(id)a4;
- (void)handleRemoteDismissRequest:(id)a3 completion:(id)a4;
- (void)sendRemoteAnnouncementRequest:(id)a3 toAssistantId:(id)a4 withCompletion:(id)a5;
- (void)setAnnounceIdToRemoteAssistantIdMap:(id)a3;
- (void)setPredictionIdToAnnounceIdMap:(id)a3;
@end

@implementation ADAnnounceDeviceSelector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headphonesManager, 0);
  objc_storeStrong((id *)&self->_externalNotificationRequestHandler, 0);
  objc_storeStrong((id *)&self->_predictionIdToAnnounceIdMap, 0);
  objc_storeStrong((id *)&self->_announceIdToRemoteAssistantIdMap, 0);
  objc_storeStrong((id *)&self->_cachePurgeQueue, 0);
  objc_storeStrong((id *)&self->_deviceCircleManager, 0);
}

- (ADSiriHeadphonesMonitor)headphonesManager
{
  return self->_headphonesManager;
}

- (ADExternalNotificationRequestHandler)externalNotificationRequestHandler
{
  return self->_externalNotificationRequestHandler;
}

- (void)setPredictionIdToAnnounceIdMap:(id)a3
{
}

- (NSMutableDictionary)predictionIdToAnnounceIdMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAnnounceIdToRemoteAssistantIdMap:(id)a3
{
}

- (NSMutableDictionary)announceIdToRemoteAssistantIdMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)_populateCachesForRequest:(id)a3 toRemoteAssistantId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 announcementIdentifier];
  if (!v8)
  {
    v15 = AFSiriLogContextConnection;
    if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136315138;
    v21 = "-[ADAnnounceDeviceSelector _populateCachesForRequest:toRemoteAssistantId:]";
    v16 = "%s cannot populate caches for nil announcement identifier";
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v6 workoutReminder];
    v10 = [v9 predictionIdentifier];

    if (v10)
    {
      v11 = [(ADAnnounceDeviceSelector *)self predictionIdToAnnounceIdMap];
      [v11 setObject:v8 forKey:v10];

      goto LABEL_5;
    }
    v15 = AFSiriLogContextConnection;
    if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136315138;
    v21 = "-[ADAnnounceDeviceSelector _populateCachesForRequest:toRemoteAssistantId:]";
    v16 = "%s cannot populate cache for nil prediction identifier";
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
    goto LABEL_13;
  }
LABEL_5:
  if (v7)
  {
    v12 = [(ADAnnounceDeviceSelector *)self announceIdToRemoteAssistantIdMap];
    [v12 setObject:v7 forKey:v8];
  }
  dispatch_time_t v13 = dispatch_time(0, 60000000000);
  cachePurgeQueue = self->_cachePurgeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010746C;
  block[3] = &unk_10050DCB8;
  block[4] = self;
  id v18 = v8;
  id v19 = v6;
  dispatch_after(v13, cachePurgeQueue, block);

LABEL_13:
}

- (void)handleRemoteDismissRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)NSUUID);
  v9 = [v7 announcementIdentifier];

  id v10 = [v8 initWithUUIDString:v9];
  v11 = [(ADAnnounceDeviceSelector *)self externalNotificationRequestHandler];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001076B4;
  v13[3] = &unk_10050E250;
  id v14 = v6;
  id v12 = v6;
  [v11 deactivateWorkoutReminderAnnouncementWithId:v10 completion:v13];
}

- (id)_announcementRequestFromRemoteAnnouncementRequest:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 announcementType];
  unsigned int v8 = [v7 unsignedIntValue];

  v9 = [v5 announcementNotificationType];
  unsigned int v10 = [v9 unsignedIntValue];

  if (v8 == 1)
  {
    uint64_t v11 = v10;
    id v12 = [(ADAnnouncementRequest *)[ADAnnounceNotificationRequest alloc] initWithRemoteAnnouncement:v5 completion:v6];

    [(ADAnnounceNotificationRequest *)v12 setAnnouncementType:v11];
    [(ADAnnouncementRequest *)v12 setRequiresOpportuneTime:(id)[(ADAnnouncementRequest *)v12 platform] == (id)1];
    [(ADAnnouncementRequest *)v12 setRequiresOpportuneTime:0];
  }
  else
  {
    dispatch_time_t v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      v16 = "-[ADAnnounceDeviceSelector _announcementRequestFromRemoteAnnouncementRequest:withCompletion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s failed to announce remote announcement", (uint8_t *)&v15, 0xCu);
    }
    (*((void (**)(id, void))v6 + 2))(v6, 0);

    id v12 = 0;
  }

  return v12;
}

- (void)handleRemoteAnnounceRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (Block_layout *)a4;
  unsigned int v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[ADAnnounceDeviceSelector handleRemoteAnnounceRequest:completion:]";
    __int16 v29 = 2112;
    double v30 = *(double *)&v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }
  if (!v7) {
    id v7 = &stru_100502498;
  }
  v9 = [(ADAnnounceDeviceSelector *)self headphonesManager];
  unsigned int v10 = [v9 currentAudioRoute];
  unsigned __int8 v11 = [(ADAnnounceDeviceSelector *)self _shouldHandleAnnouncementLocallyForRoute:v10 notificationRequest:0];

  if (v11)
  {
    id v12 = [v6 announcementTimestamp];
    [v12 timeIntervalSinceNow];
    double v14 = v13;

    if (v14 >= -10.0)
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100107CA4;
      v24[3] = &unk_10050C890;
      id v25 = v6;
      v26 = v7;
      v22 = [(ADAnnounceDeviceSelector *)self _announcementRequestFromRemoteAnnouncementRequest:v25 withCompletion:v24];
      v23 = [(ADAnnounceDeviceSelector *)self externalNotificationRequestHandler];
      [v23 handleAnnouncementRequest:v22];

      id v19 = v25;
      goto LABEL_13;
    }
    double v15 = -v14;
    v16 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v28 = "-[ADAnnounceDeviceSelector handleRemoteAnnounceRequest:completion:]";
      __int16 v29 = 2048;
      double v30 = v15;
      __int16 v31 = 2048;
      uint64_t v32 = 0x4024000000000000;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s remote announcement request received after %.1f seconds, limit is %.1f", buf, 0x20u);
    }
    id v17 = objc_alloc((Class)SACommandFailed);
    id v18 = +[NSString stringWithFormat:@"remote announcement request received after %.1f seconds, limit is %.1f", *(void *)&v15, 0x4024000000000000];
    id v19 = [v17 initWithReason:v18];

    v20 = [v6 aceId];
    [v19 setRefId:v20];
  }
  else
  {
    id v19 = objc_alloc_init((Class)SACommandFailed);
    v21 = [v6 aceId];
    [v19 setRefId:v21];

    [v19 setReason:@"No Announcement Route"];
  }
  v7->invoke(v7, v19, 0);
LABEL_13:
}

- (id)_createPerformRemoteAnnoucementRequestFromNotificationRequest:(id)a3
{
  id v3 = a3;
  v4 = +[AFRequestInfo requestInfoFromAnnouncementRequest:v3 previousRequest:0 synchronousBurstIndex:0 isMediaPlaying:0];
  id v5 = [v4 startLocalRequest];

  id v6 = objc_alloc_init((Class)SAPerformRemoteAnnouncement);
  id v7 = [v3 announcementIdentifier];
  unsigned int v8 = [v7 UUIDString];
  [v6 setAnnouncementIdentifier:v8];

  v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 requestType]);
  [v6 setAnnouncementType:v9];

  unsigned int v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 announcementType]);
  [v6 setAnnouncementNotificationType:v10];

  id v11 = [v3 platform];
  id v12 = +[NSNumber numberWithInteger:v11];
  [v6 setAnnouncementPlatform:v12];

  [v6 setStartLocalRequest:v5];
  double v13 = +[NSDate now];
  [v6 setAnnouncementTimestamp:v13];

  return v6;
}

- (void)sendRemoteAnnouncementRequest:(id)a3 toAssistantId:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = (void (**)(id, id, void))a5;
  id v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 136315394;
    id v17 = "-[ADAnnounceDeviceSelector sendRemoteAnnouncementRequest:toAssistantId:withCompletion:]";
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v16, 0x16u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [(ADAnnounceDeviceSelector *)self _createPerformRemoteAnnoucementRequestFromNotificationRequest:v8];
    double v13 = [(id)objc_opt_class() _requestToExecuteCommand:v12 onRemoteWithAssistantId:v9];
    if (v13)
    {
      [(ADAnnounceDeviceSelector *)self _populateCachesForRequest:v8 toRemoteAssistantId:v9];
      id v14 = +[ADCommandCenter sharedCommandCenter];
      [v14 handleCommand:v13 completion:v10];
    }
    else
    {
      id v14 = [objc_alloc((Class)SACommandFailed) initWithReason:@"Failed to create SAExecuteOnRemoteRequest"];
      v10[2](v10, v14, 0);
    }
  }
  else
  {
    double v15 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315394;
      id v17 = "-[ADAnnounceDeviceSelector sendRemoteAnnouncementRequest:toAssistantId:withCompletion:]";
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Unsupported request type for remote annoucement: %@", (uint8_t *)&v16, 0x16u);
    }
    id v12 = objc_alloc_init((Class)SACommandFailed);
    [v12 setReason:@"No Announcement Route"];
    v10[2](v10, v12, 0);
  }
}

- (void)handleAnnouncementRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(ADAnnounceDeviceSelector *)self headphonesManager];
    id v7 = [v6 currentAudioRoute];

    unsigned __int8 v8 = [v7 isThirdPartyBluetoothHeadset];
    id v9 = [v5 announcementType];
    BOOL v10 = v9 == (id)9;
    if (v9 == (id)9 && (v8 & 1) == 0) {
      [v5 setPlatform:1];
    }
    unsigned int v11 = [(ADAnnounceDeviceSelector *)self _shouldHandleAnnouncementLocallyForRoute:v7 notificationRequest:v5];
    id v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v31 = "-[ADAnnounceDeviceSelector handleAnnouncementRequest:]";
      __int16 v32 = 2112;
      id v33 = v5;
      __int16 v34 = 1024;
      unsigned int v35 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s request: %@, shouldHandleLocally: %d", buf, 0x1Cu);
      if (v11) {
        goto LABEL_7;
      }
    }
    else if (v11)
    {
LABEL_7:
      [(ADAnnounceDeviceSelector *)self _populateCachesForRequest:v5 toRemoteAssistantId:0];
      double v13 = [(ADAnnounceDeviceSelector *)self externalNotificationRequestHandler];
      [v13 handleAnnouncementRequest:v5];
LABEL_26:

      goto LABEL_27;
    }
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1001085F8;
    v26[3] = &unk_100502478;
    BOOL v29 = v10;
    id v15 = v5;
    id v27 = v15;
    v28 = self;
    int v16 = objc_retainBlock(v26);
    id v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v31 = "-[ADAnnounceDeviceSelector handleAnnouncementRequest:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s Searching for paired phone", buf, 0xCu);
    }
    __int16 v18 = [(ADAnnounceDeviceSelector *)self pairedPhone];
    id v19 = AFSiriLogContextConnection;
    BOOL v20 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG);
    if (v18)
    {
      if (v20)
      {
        *(_DWORD *)buf = 136315394;
        __int16 v31 = "-[ADAnnounceDeviceSelector handleAnnouncementRequest:]";
        __int16 v32 = 2112;
        id v33 = v18;
        _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%s Paired phone found: %@", buf, 0x16u);
      }
      v21 = [v18 assistantIdentifier];
      if (v21)
      {
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_1001086FC;
        v23[3] = &unk_100509690;
        id v25 = v16;
        id v24 = v15;
        [(ADAnnounceDeviceSelector *)self sendRemoteAnnouncementRequest:v24 toAssistantId:v21 withCompletion:v23];
      }
      else
      {
        v22 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v31 = "-[ADAnnounceDeviceSelector handleAnnouncementRequest:]";
          _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%s Paired phone has nil assistant ID", buf, 0xCu);
        }
        ((void (*)(void *, id))v16[2])(v16, v15);
      }
    }
    else
    {
      if (v20)
      {
        *(_DWORD *)buf = 136315138;
        __int16 v31 = "-[ADAnnounceDeviceSelector handleAnnouncementRequest:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%s Paired phone not reachable", buf, 0xCu);
      }
      ((void (*)(void *, id))v16[2])(v16, v15);
    }

    double v13 = v27;
    goto LABEL_26;
  }
  id v14 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v31 = "-[ADAnnounceDeviceSelector handleAnnouncementRequest:]";
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Cannot announce request remotely since it is not an ADAnnounceNotificationRequest", buf, 0xCu);
  }
LABEL_27:
}

- (void)deactivateWorkoutReminderAnnouncementWithPredictionId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (Block_layout *)a4;
  if (![v6 length])
  {
    id v14 = AFSiriLogContextConnection;
    if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 136315138;
    v21 = "-[ADAnnounceDeviceSelector deactivateWorkoutReminderAnnouncementWithPredictionId:completion:]";
    id v15 = "%s predictionId must be a non-nil non-empty string";
LABEL_15:
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
    goto LABEL_20;
  }
  if ((AFIsNano() & 1) == 0)
  {
    id v14 = AFSiriLogContextConnection;
    if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 136315138;
    v21 = "-[ADAnnounceDeviceSelector deactivateWorkoutReminderAnnouncementWithPredictionId:completion:]";
    id v15 = "%s Expected [ADAnnounceDeviceSelector deactivateWorkoutReminderAnnouncementWithPredictionId:completion:] to on"
          "ly ever be called from a Watch";
    goto LABEL_15;
  }
  if (!v7) {
    id v7 = &stru_100502450;
  }
  unsigned __int8 v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[ADAnnounceDeviceSelector deactivateWorkoutReminderAnnouncementWithPredictionId:completion:]";
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s Attempting to deactivate workout reminder announcement with prediction ID: %@", buf, 0x16u);
  }
  id v9 = [(ADAnnounceDeviceSelector *)self predictionIdToAnnounceIdMap];
  BOOL v10 = [v9 objectForKey:v6];

  unsigned int v11 = AFSiriLogContextConnection;
  BOOL v12 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 136315650;
      v21 = "-[ADAnnounceDeviceSelector deactivateWorkoutReminderAnnouncementWithPredictionId:completion:]";
      __int16 v22 = 2112;
      id v23 = v6;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s Prediction ID (%@) maps to announcement ID: %@", buf, 0x20u);
    }
    double v13 = [(ADAnnounceDeviceSelector *)self externalNotificationRequestHandler];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100108D34;
    v16[3] = &unk_100509068;
    id v19 = v7;
    v16[4] = self;
    id v17 = v10;
    id v18 = v6;
    [v13 deactivateWorkoutReminderAnnouncementWithId:v17 completion:v16];
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[ADAnnounceDeviceSelector deactivateWorkoutReminderAnnouncementWithPredictionId:completion:]";
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s No announcement found for prediction ID: %@ - ignoring", buf, 0x16u);
    }
    v7->invoke(v7, 0);
  }

LABEL_20:
}

- (BOOL)_shouldHandleAnnouncementLocallyForRoute:(id)a3 notificationRequest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315394;
    double v13 = "-[ADAnnounceDeviceSelector _shouldHandleAnnouncementLocallyForRoute:notificationRequest:]";
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s currentRoute: %@", (uint8_t *)&v12, 0x16u);
  }
  if ([v5 isRouteCurrentlyPicked]) {
    unint64_t v8 = (unint64_t)[v5 availableAnnouncementRequestTypes] & 1;
  }
  else {
    LOBYTE(v8) = 0;
  }
  if (AFIsNano())
  {
    unsigned __int8 v9 = [v5 isThirdPartyBluetoothHeadset];
    if ([v6 announcementType] == (id)9) {
      unsigned __int8 v10 = v9;
    }
    else {
      unsigned __int8 v10 = 0;
    }
    if (v8) {
      LOBYTE(v8) = 1;
    }
    else {
      LOBYTE(v8) = v10;
    }
  }

  return v8;
}

- (id)pairedPhone
{
  if (AFIsNano())
  {
    deviceCircleManager = self->_deviceCircleManager;
    id v4 = +[AFPeerInfo newWithBuilder:&stru_100502430];
    id v5 = [(ADDeviceCircleManager *)deviceCircleManager managedPeerInfoMatchingPeerInfo:v4];
  }
  else
  {
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      unsigned __int8 v9 = "-[ADAnnounceDeviceSelector pairedPhone]";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s pairedPhone called on an unexpected (non-watch) platform", (uint8_t *)&v8, 0xCu);
    }
    id v5 = 0;
  }
  return v5;
}

- (id)_init
{
  v18.receiver = self;
  v18.super_class = (Class)ADAnnounceDeviceSelector;
  v2 = [(ADAnnounceDeviceSelector *)&v18 init];
  if (v2)
  {
    uint64_t v3 = +[AFSiriHeadphonesMonitor sharedMonitor];
    headphonesManager = v2->_headphonesManager;
    v2->_headphonesManager = (ADSiriHeadphonesMonitor *)v3;

    uint64_t v5 = +[ADDeviceCircleManager sharedInstance];
    deviceCircleManager = v2->_deviceCircleManager;
    v2->_deviceCircleManager = (ADDeviceCircleManager *)v5;

    uint64_t v7 = +[ADExternalNotificationRequestHandler sharedNotificationRequestHandler];
    externalNotificationRequestHandler = v2->_externalNotificationRequestHandler;
    v2->_externalNotificationRequestHandler = (ADExternalNotificationRequestHandler *)v7;

    unsigned __int8 v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    unsigned __int8 v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.assistantd.remote_announce_notification_cache", v10);
    cachePurgeQueue = v2->_cachePurgeQueue;
    v2->_cachePurgeQueue = (OS_dispatch_queue *)v11;

    double v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    predictionIdToAnnounceIdMap = v2->_predictionIdToAnnounceIdMap;
    v2->_predictionIdToAnnounceIdMap = v13;

    id v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    announceIdToRemoteAssistantIdMap = v2->_announceIdToRemoteAssistantIdMap;
    v2->_announceIdToRemoteAssistantIdMap = v15;
  }
  return v2;
}

+ (id)_requestToExecuteCommand:(id)a3 onRemoteWithAssistantId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 _serializedData];
  if (v7
    || ([v5 dictionary],
        unsigned __int8 v10 = objc_claimAutoreleasedReturnValue(),
        id v15 = 0,
        +[NSPropertyListSerialization dataWithPropertyList:v10 format:200 options:0 error:&v15], uint64_t v7 = objc_claimAutoreleasedReturnValue(), v11 = v15, v10, !v11))
  {
    if ([v6 length])
    {
      id v8 = objc_alloc_init((Class)SARemoteDevice);
      [v8 setAssistantId:v6];
      id v9 = objc_alloc_init((Class)SAExecuteOnRemoteRequest);
      [v9 setRemoteDevice:v8];
      [v9 setSerializedCommand:v7];
      [v9 setUseGuaranteedDelivery:1];

      goto LABEL_11;
    }
    double v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v17 = "+[ADAnnounceDeviceSelector _requestToExecuteCommand:onRemoteWithAssistantId:]";
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s invalid assistantId - must be a non-zero length string", buf, 0xCu);
    }
  }
  else
  {
    int v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v17 = "+[ADAnnounceDeviceSelector _requestToExecuteCommand:onRemoteWithAssistantId:]";
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Could not serialize the command: %@", buf, 0x16u);
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

+ (id)sharedDeviceSelector
{
  if (qword_100585B38 != -1) {
    dispatch_once(&qword_100585B38, &stru_1005023F0);
  }
  v2 = (void *)qword_100585B40;
  return v2;
}

@end