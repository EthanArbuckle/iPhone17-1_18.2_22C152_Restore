@interface ADDeviceProximityManager
+ (id)sharedManager;
- (id)_initWithQueue:(id)a3 donationService:(id)a4 deviceCircleManager:(id)a5;
- (id)_messageLink;
- (id)_proximityDiscoveryLink;
- (id)_queue;
- (id)_rapportLinkMessageOptions;
- (void)_clearProximityDiscoveryLink;
- (void)_fetchProximityObservationsFromCollectorsWithCompletion:(id)a3;
- (void)_getAggregatedProximityObservationsWithCompletion:(id)a3;
- (void)_insertProximityForRemoteDeviceID:(id)a3 rpProximity:(int)a4;
- (void)_pushProximityObservationToCollector:(id)a3;
- (void)_recordProximityObservation:(id)a3;
- (void)_resetMessageLinkAndReconnectNow:(BOOL)a3;
- (void)_setMessageLink:(id)a3;
- (void)_stopScanning;
- (void)_updateProximityForDevice:(id)a3;
- (void)contextCollectorChangedToDevicesWithIdentifiers:(id)a3 localDeviceIsCollector:(BOOL)a4;
- (void)getDeviceProximityRelativeToLocalDeviceWithCompletion:(id)a3;
- (void)getDeviceProximityRelativeToLocalDeviceWithDeviceContexts:(id)a3 includesAllReachableDevices:(BOOL)a4 completion:(id)a5;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4;
- (void)performProximityScan;
- (void)rapportLink:(id)a3 didFindDevice:(id)a4;
- (void)rapportLink:(id)a3 didLoseDevice:(id)a4;
- (void)rapportLink:(id)a3 didReceiveMessage:(id)a4 ofType:(id)a5 fromPeer:(id)a6 completion:(id)a7;
- (void)rapportLink:(id)a3 didUpdateDevice:(id)a4 changes:(unsigned int)a5;
- (void)rapportLink:(id)a3 didUpdateLocalDevice:(id)a4;
- (void)rapportLinkDidInterrupt:(id)a3;
- (void)rapportLinkDidInvalidate:(id)a3;
- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
@end

@implementation ADDeviceProximityManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentRequestInfoUUID, 0);
  objc_storeStrong((id *)&self->_currentVoiceTriggerExpirationDate, 0);
  objc_storeStrong((id *)&self->_voiceTriggerFirstPassObserver, 0);
  objc_storeStrong((id *)&self->_heardVoiceTriggerObserver, 0);
  objc_storeStrong((id *)&self->_lastProximityScan, 0);
  objc_storeStrong((id *)&self->_proximityScanningTimer, 0);
  objc_storeStrong((id *)&self->_messageLink, 0);
  objc_storeStrong((id *)&self->_proximityDiscoveryLink, 0);
  objc_storeStrong((id *)&self->_deviceCircleManager, 0);
  objc_storeStrong((id *)&self->_donationService, 0);
  objc_storeStrong((id *)&self->_localDeviceIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedAFProximityRelativeToLocalDevice, 0);
  objc_storeStrong((id *)&self->_timersByDeviceIDPair, 0);
  objc_storeStrong((id *)&self->_proximityObservations, 0);
}

- (void)_setMessageLink:(id)a3
{
}

- (id)_queue
{
  return self->_queue;
}

- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6
{
}

- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4
{
  v5 = (AFNotifyObserver *)a3;
  v6 = +[NSDate date];
  if (self->_heardVoiceTriggerObserver == v5)
  {
    v16 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[ADDeviceProximityManager notifyObserver:didReceiveNotificationWithToken:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s #hal Heard Voice Trigger", buf, 0xCu);
    }
    v17 = [v6 dateByAddingTimeInterval:15.0];
    id v18 = objc_alloc((Class)AFDeviceContextMetadata);
    id v10 = [v18 initWithType:AFDeviceContextKeyHeardVoiceTrigger deliveryDate:v6 expirationDate:v17 redactedKeyPaths:0 historyConfiguration:0];
    [(AFContextDonationService *)self->_donationService donateContext:&off_1005237C8 withMetadata:v10 pushToRemote:1];
    currentVoiceTriggerExpirationDate = self->_currentVoiceTriggerExpirationDate;
    self->_currentVoiceTriggerExpirationDate = v17;
    v12 = v17;

    dispatch_time_t v13 = dispatch_time(0, 15100000000);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001A6F4C;
    block[3] = &unk_10050E138;
    block[4] = self;
    v15 = block;
    goto LABEL_9;
  }
  if (self->_voiceTriggerFirstPassObserver == v5)
  {
    v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[ADDeviceProximityManager notifyObserver:didReceiveNotificationWithToken:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s #hal Voice Trigger first pass", buf, 0xCu);
    }
    v8 = [v6 dateByAddingTimeInterval:5.0];
    id v9 = objc_alloc((Class)AFDeviceContextMetadata);
    id v10 = [v9 initWithType:AFDeviceContextKeyHeardVoiceTrigger deliveryDate:v6 expirationDate:v8 redactedKeyPaths:0 historyConfiguration:0];
    [(AFContextDonationService *)self->_donationService donateContext:&off_1005237C8 withMetadata:v10 pushToRemote:0];
    v11 = self->_currentVoiceTriggerExpirationDate;
    self->_currentVoiceTriggerExpirationDate = v8;
    v12 = v8;

    dispatch_time_t v13 = dispatch_time(0, 5100000000);
    queue = self->_queue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1001A70CC;
    v20[3] = &unk_10050E138;
    v20[4] = self;
    v15 = v20;
LABEL_9:
    dispatch_after(v13, queue, v15);
  }
}

- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A72C0;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  id v7 = a4;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001A742C;
  v10[3] = &unk_10050E160;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, v10);
}

- (void)contextCollectorChangedToDevicesWithIdentifiers:(id)a3 localDeviceIsCollector:(BOOL)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001A74EC;
  v5[3] = &unk_10050CD50;
  v5[4] = self;
  BOOL v6 = a4;
  dispatch_async(queue, v5);
}

- (void)rapportLink:(id)a3 didReceiveMessage:(id)a4 ofType:(id)a5 fromPeer:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void, void *))a7;
  v17 = AFSiriLogContextDaemon;
  if (!self->_localIsCollector)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[ADDeviceProximityManager rapportLink:didReceiveMessage:ofType:fromPeer:completion:]";
      __int16 v27 = 2112;
      id v28 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s #hal Local device is not collector for message %@", buf, 0x16u);
    }
    v19 = +[AFError errorWithCode:1014];
    v16[2](v16, 0, v19);
    goto LABEL_11;
  }
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v26 = "-[ADDeviceProximityManager rapportLink:didReceiveMessage:ofType:fromPeer:completion:]";
    __int16 v27 = 2112;
    id v28 = v14;
    __int16 v29 = 2112;
    id v30 = v15;
    __int16 v31 = 2112;
    id v32 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s #hal Received %@ from %@: %@", buf, 0x2Au);
  }
  if ([v14 isEqualToString:@"device_proximity_fetch"])
  {
    id v18 = [(NSMutableDictionary *)self->_proximityObservations allValues];
    v19 = objc_msgSend(v18, "af_lenientMappedArray:", &stru_100505508);

    v20 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[ADDeviceProximityManager rapportLink:didReceiveMessage:ofType:fromPeer:completion:]";
      __int16 v27 = 2112;
      id v28 = v19;
      _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s #hal Sending observations: %@", buf, 0x16u);
    }
    CFStringRef v23 = @"proximity_observations";
    v24 = v19;
    v21 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    ((void (**)(id, void *, void *))v16)[2](v16, v21, 0);

LABEL_11:
    goto LABEL_12;
  }
  if ([v14 isEqualToString:@"device_proximity_push"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [[ADRapportProximityObservation alloc] initWithDictionaryRepresentation:v13];
      [(ADDeviceProximityManager *)self _recordProximityObservation:v22];
    }
    v16[2](v16, 0, 0);
  }
LABEL_12:
}

- (void)rapportLink:(id)a3 didLoseDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[ADDeviceProximityManager rapportLink:didLoseDevice:]";
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s #hal %@", buf, 0x16u);
  }
  id v9 = [v7 idsDeviceIdentifier];
  if (v9 && self->_localDeviceIDSIdentifier)
  {
    id v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, 0);
    id v11 = objc_msgSend(v10, "adpm_sortedKeyString");

    id v12 = [(NSMutableDictionary *)self->_proximityObservations objectForKeyedSubscript:v11];

    if (v12)
    {
      id v13 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        id v15 = "-[ADDeviceProximityManager rapportLink:didLoseDevice:]";
        __int16 v16 = 2112;
        id v17 = v9;
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s #hal removing observations for lost device: %@", buf, 0x16u);
      }
      [(NSMutableDictionary *)self->_proximityObservations setObject:0 forKeyedSubscript:v11];
    }
  }
}

- (void)rapportLink:(id)a3 didUpdateDevice:(id)a4 changes:(unsigned int)a5
{
  id v7 = (ADRapportLink *)a3;
  id v8 = a4;
  if (self->_proximityDiscoveryLink == v7)
  {
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315138;
      id v11 = "-[ADDeviceProximityManager rapportLink:didUpdateDevice:changes:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s #hal", (uint8_t *)&v10, 0xCu);
    }
    [(ADDeviceProximityManager *)self _updateProximityForDevice:v8];
  }
}

- (void)rapportLink:(id)a3 didFindDevice:(id)a4
{
  id v6 = (ADRapportLink *)a3;
  id v7 = a4;
  if (self->_proximityDiscoveryLink == v6)
  {
    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315138;
      int v10 = "-[ADDeviceProximityManager rapportLink:didFindDevice:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s #hal", (uint8_t *)&v9, 0xCu);
    }
    [(ADDeviceProximityManager *)self _updateProximityForDevice:v7];
  }
}

- (void)rapportLink:(id)a3 didUpdateLocalDevice:(id)a4
{
  objc_msgSend(a4, "idsDeviceIdentifier", a3);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  localDeviceIDSIdentifier = self->_localDeviceIDSIdentifier;
  self->_localDeviceIDSIdentifier = v5;
  _objc_release_x1(v5, localDeviceIDSIdentifier);
}

- (void)rapportLinkDidInvalidate:(id)a3
{
  v4 = (ADRapportLink *)a3;
  v5 = v4;
  if (self->_messageLink == v4)
  {
    id v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      int v9 = "-[ADDeviceProximityManager rapportLinkDidInvalidate:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s #hal message link invalidated", (uint8_t *)&v8, 0xCu);
    }
    [(ADDeviceProximityManager *)self _resetMessageLinkAndReconnectNow:0];
  }
  else if (self->_proximityDiscoveryLink == v4)
  {
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      int v9 = "-[ADDeviceProximityManager rapportLinkDidInvalidate:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s #hal proximity link invalidated", (uint8_t *)&v8, 0xCu);
    }
    [(ADDeviceProximityManager *)self _clearProximityDiscoveryLink];
  }
}

- (void)rapportLinkDidInterrupt:(id)a3
{
  v4 = (ADRapportLink *)a3;
  v5 = v4;
  if (self->_messageLink == v4)
  {
    id v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      int v9 = "-[ADDeviceProximityManager rapportLinkDidInterrupt:]";
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s #hal message link interrupted", (uint8_t *)&v8, 0xCu);
    }
    [(ADDeviceProximityManager *)self _resetMessageLinkAndReconnectNow:1];
  }
  else if (self->_proximityDiscoveryLink == v4)
  {
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      int v9 = "-[ADDeviceProximityManager rapportLinkDidInterrupt:]";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s #hal proximity link interrupted", (uint8_t *)&v8, 0xCu);
    }
    [(ADDeviceProximityManager *)self _clearProximityDiscoveryLink];
  }
}

- (void)_fetchProximityObservationsFromCollectorsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      int v10 = "-[ADDeviceProximityManager _fetchProximityObservationsFromCollectorsWithCompletion:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s #hal", buf, 0xCu);
    }
    deviceCircleManager = self->_deviceCircleManager;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001A8638;
    v7[3] = &unk_1005054E8;
    v7[4] = self;
    id v8 = v4;
    [(ADDeviceCircleManager *)deviceCircleManager getContextCollectorDeviceIdentifiersWithCompletion:v7];
  }
}

- (void)_pushProximityObservationToCollector:(id)a3
{
  id v4 = a3;
  v5 = +[AFPreferences sharedPreferences];
  unsigned __int8 v6 = [v5 assistantIsEnabled];

  if (v6)
  {
    deviceCircleManager = self->_deviceCircleManager;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001A9010;
    v9[3] = &unk_100505458;
    v9[4] = self;
    id v10 = v4;
    [(ADDeviceCircleManager *)deviceCircleManager getContextCollectorDeviceIdentifiersWithCompletion:v9];
  }
  else
  {
    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "-[ADDeviceProximityManager _pushProximityObservationToCollector:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s #hal Skip pushing proximity info as Siri is disabled", buf, 0xCu);
    }
  }
}

- (void)_recordProximityObservation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    unsigned __int8 v6 = [v4 deviceIDPair];
    id v7 = objc_msgSend(v6, "adpm_sortedKeyString");

    id v8 = [(NSMutableDictionary *)self->_proximityObservations objectForKeyedSubscript:v7];
    id v9 = [v8 mutableCopy];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = +[NSMutableArray array];
    }
    id v12 = v11;

    [v12 addObject:v5];
    id v13 = [v12 indexesOfObjectsPassingTest:&stru_1005053F0];
    if ([v13 count])
    {
      id v14 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        v21 = v14;
        *(_DWORD *)v22 = 136315650;
        *(void *)&v22[4] = "-[ADDeviceProximityManager _recordProximityObservation:]";
        *(_WORD *)&v22[12] = 2048;
        *(void *)&v22[14] = [v13 count];
        *(_WORD *)&v22[22] = 2048;
        id v23 = [v12 count];
        _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%s #hal removing %lu expired keys of %lu", v22, 0x20u);
      }
      [v12 removeObjectsAtIndexes:v13];
    }
    [v12 sortUsingComparator:&stru_100505430];
    id v15 = [v12 lastObject];
    unsigned int v16 = [v15 isEqual:v5];

    id v17 = AFSiriLogContextDaemon;
    BOOL v18 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
    if (v16)
    {
      if (v18)
      {
        *(_DWORD *)v22 = 136315394;
        *(void *)&v22[4] = "-[ADDeviceProximityManager _recordProximityObservation:]";
        *(_WORD *)&v22[12] = 2112;
        *(void *)&v22[14] = v5;
        v19 = "%s #hal Recorded latest observation: %@";
LABEL_16:
        _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, v19, v22, 0x16u);
      }
    }
    else if (v18)
    {
      *(_DWORD *)v22 = 136315394;
      *(void *)&v22[4] = "-[ADDeviceProximityManager _recordProximityObservation:]";
      *(_WORD *)&v22[12] = 2112;
      *(void *)&v22[14] = v5;
      v19 = "%s #hal Recorded stale observation: %@";
      goto LABEL_16;
    }
    id v20 = objc_msgSend(v12, "copy", *(_OWORD *)v22, *(void *)&v22[16]);
    [(NSMutableDictionary *)self->_proximityObservations setObject:v20 forKeyedSubscript:v7];
  }
}

- (void)_insertProximityForRemoteDeviceID:(id)a3 rpProximity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  localDeviceIDSIdentifier = self->_localDeviceIDSIdentifier;
  if (v6 && localDeviceIDSIdentifier)
  {
    id v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", localDeviceIDSIdentifier, v6, 0);
    id v9 = [ADRapportProximityObservation alloc];
    id v10 = +[NSDate date];
    id v11 = [(ADRapportProximityObservation *)v9 initWithDeviceIDPair:v8 proximity:v4 observationDate:v10];

    [(ADDeviceProximityManager *)self _recordProximityObservation:v11];
    if (!self->_localIsCollector) {
      [(ADDeviceProximityManager *)self _pushProximityObservationToCollector:v11];
    }
  }
  else
  {
    id v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v14 = "-[ADDeviceProximityManager _insertProximityForRemoteDeviceID:rpProximity:]";
      __int16 v15 = 2112;
      unsigned int v16 = localDeviceIDSIdentifier;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s #hal Invalid proximity observation for identifier(s): local %@, remote %@", buf, 0x20u);
    }
  }
}

- (void)_updateProximityForDevice:(id)a3
{
  id v4 = a3;
  v5 = [v4 idsDeviceIdentifier];
  id v6 = [v4 proximity];
  id v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v8 = v7;
    id v9 = [v4 model];
    int v10 = 136315906;
    id v11 = "-[ADDeviceProximityManager _updateProximityForDevice:]";
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    __int16 v15 = v9;
    __int16 v16 = 1024;
    int v17 = (int)v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s #hal device: %@ (%@) proximity: %d", (uint8_t *)&v10, 0x26u);
  }
  [(ADDeviceProximityManager *)self _insertProximityForRemoteDeviceID:v5 rpProximity:v6];
}

- (void)_resetMessageLinkAndReconnectNow:(BOOL)a3
{
  BOOL v3 = a3;
  [(ADRapportLink *)self->_messageLink removeListener:self];
  [(ADRapportLink *)self->_messageLink invalidate];
  messageLink = self->_messageLink;
  self->_messageLink = 0;

  if (v3)
  {
    id v6 = [(ADDeviceProximityManager *)self _messageLink];
  }
  else
  {
    dispatch_time_t v7 = dispatch_time(0, 20000000000);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001A9A3C;
    block[3] = &unk_10050E138;
    block[4] = self;
    dispatch_after(v7, queue, block);
  }
}

- (void)_clearProximityDiscoveryLink
{
  [(ADRapportLink *)self->_proximityDiscoveryLink removeListener:self];
  [(ADRapportLink *)self->_proximityDiscoveryLink invalidate];
  proximityDiscoveryLink = self->_proximityDiscoveryLink;
  self->_proximityDiscoveryLink = 0;
}

- (id)_proximityDiscoveryLink
{
  proximityDiscoveryLink = self->_proximityDiscoveryLink;
  if (!proximityDiscoveryLink)
  {
    id v4 = [ADRapportLinkConfiguration alloc];
    id v5 = +[ADRapportLinkDiscoveryOptions newWithBuilder:&stru_100505350];
    id v6 = +[ADRapportLinkTransportOptions newWithBuilder:&stru_100505370];
    id v7 = +[ADRapportLinkConnectionOptions newWithBuilder:&stru_100505390];
    id v8 = [(ADRapportLinkConfiguration *)v4 initWithDiscoveryOptions:v5 transportOptions:v6 connectionOptions:v7 enablesProximityTracking:2];

    id v9 = [[ADRapportLink alloc] initWithQueue:self->_queue configuration:v8];
    int v10 = self->_proximityDiscoveryLink;
    self->_proximityDiscoveryLink = v9;

    [(ADRapportLink *)self->_proximityDiscoveryLink addListener:self];
    [(ADRapportLink *)self->_proximityDiscoveryLink activateWithCompletion:&stru_1005053B0];

    proximityDiscoveryLink = self->_proximityDiscoveryLink;
  }
  return proximityDiscoveryLink;
}

- (id)_messageLink
{
  messageLink = self->_messageLink;
  if (!messageLink)
  {
    id v4 = [ADRapportLinkConfiguration alloc];
    id v5 = +[ADRapportLinkDiscoveryOptions newWithBuilder:&stru_1005052B0];
    id v6 = +[ADRapportLinkTransportOptions newWithBuilder:&stru_1005052D0];
    id v7 = +[ADRapportLinkConnectionOptions newWithBuilder:&stru_100505310];
    id v8 = [(ADRapportLinkConfiguration *)v4 initWithDiscoveryOptions:v5 transportOptions:v6 connectionOptions:v7 enablesProximityTracking:1];

    id v9 = [[ADRapportLink alloc] initWithQueue:self->_queue configuration:v8];
    int v10 = self->_messageLink;
    self->_messageLink = v9;

    [(ADRapportLink *)self->_messageLink addListener:self];
    id v11 = self->_messageLink;
    __int16 v12 = [(ADDeviceProximityManager *)self _rapportLinkMessageOptions];
    [(ADRapportLink *)v11 registerRequestID:@"com.apple.siri.rapport-link.request.device-proximity-manager" options:v12];

    [(ADRapportLink *)self->_messageLink setRequestHandler:self forRequestID:@"com.apple.siri.rapport-link.request.device-proximity-manager" messageType:@"device_proximity_fetch"];
    [(ADRapportLink *)self->_messageLink setRequestHandler:self forRequestID:@"com.apple.siri.rapport-link.request.device-proximity-manager" messageType:@"device_proximity_push"];
    [(ADRapportLink *)self->_messageLink activateWithCompletion:&stru_100505330];

    messageLink = self->_messageLink;
  }
  return messageLink;
}

- (id)_rapportLinkMessageOptions
{
  uint64_t v4 = RPOptionStatusFlags;
  id v5 = &off_1005237B0;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

- (void)_getAggregatedProximityObservationsWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  id v5 = [(NSMutableDictionary *)self->_proximityObservations af_lenientMappedDictionary:&stru_100505268];
  id v6 = v5;
  if (self->_localIsCollector)
  {
    id v7 = [v5 allValues];
    id v8 = sub_1001AA15C(v7);
    v4[2](v4, v8);
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001AA244;
    v9[3] = &unk_10050DEC0;
    id v10 = v5;
    id v11 = v4;
    [(ADDeviceProximityManager *)self _fetchProximityObservationsFromCollectorsWithCompletion:v9];
  }
}

- (void)getDeviceProximityRelativeToLocalDeviceWithDeviceContexts:(id)a3 includesAllReachableDevices:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001AA5F0;
  v13[3] = &unk_10050C840;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)getDeviceProximityRelativeToLocalDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  if (AFSupportsHALProximityScanning())
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001AC4A8;
    v6[3] = &unk_10050E188;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(queue, v6);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)_stopScanning
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[ADDeviceProximityManager _stopScanning]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s #hal", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001AC6CC;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)performProximityScan
{
  if (AFSupportsHALProximityScanning())
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001ACA18;
    block[3] = &unk_10050E138;
    block[4] = self;
    dispatch_async(queue, block);
  }
  else
  {
    id v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v7 = "-[ADDeviceProximityManager performProximityScan]";
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s #hal Not supported on this platform", buf, 0xCu);
    }
  }
}

- (id)_initWithQueue:(id)a3 donationService:(id)a4 deviceCircleManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v35.receiver = self;
  v35.super_class = (Class)ADDeviceProximityManager;
  id v12 = [(ADDeviceProximityManager *)&v35 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    objc_storeStrong((id *)&v13->_deviceCircleManager, a5);
    id v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    proximityObservations = v13->_proximityObservations;
    v13->_proximityObservations = v14;

    BOOL v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    timersByDeviceIDPair = v13->_timersByDeviceIDPair;
    v13->_timersByDeviceIDPair = v16;

    [(ADDeviceCircleManager *)v13->_deviceCircleManager addListener:v13];
    deviceCircleManager = v13->_deviceCircleManager;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1001ACF54;
    v33[3] = &unk_100505130;
    v19 = v13;
    v34 = v19;
    [(ADDeviceCircleManager *)deviceCircleManager getContextCollectorDeviceIdentifiersWithCompletion:v33];
    id v20 = objc_alloc((Class)AFNotifyObserver);
    id v21 = +[AFSiriActivationContext newWithBuilder:&stru_100505150];
    v22 = AFSiriActivationGetDarwinNotificationNameFromContext();
    id v23 = [v20 initWithName:v22 options:0 queue:v13->_queue delegate:v19];
    id v24 = v19[12];
    v19[12] = v23;

    id v25 = objc_alloc((Class)AFNotifyObserver);
    id v26 = +[AFSiriActivationContext newWithBuilder:&stru_100505170];
    __int16 v27 = AFSiriActivationGetDarwinNotificationNameFromContext();
    id v28 = [v25 initWithName:v27 options:0 queue:v13->_queue delegate:v19];
    id v29 = v19[13];
    v19[13] = v28;

    id v30 = [v19 _messageLink];
    __int16 v31 = +[ADRequestLifecycleObserver sharedObserver];
    [v31 addListener:v19];

    objc_storeStrong(v19 + 6, a4);
    [v19[6] registerContextTransformer:v19 forType:AFDeviceContextKeyHeardVoiceTrigger];
  }
  return v13;
}

+ (id)sharedManager
{
  if (qword_100585DB0 != -1) {
    dispatch_once(&qword_100585DB0, &stru_100505108);
  }
  v2 = (void *)qword_100585DB8;
  return v2;
}

@end