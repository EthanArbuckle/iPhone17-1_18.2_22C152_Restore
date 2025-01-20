@interface ADSiriHeadphonesMonitor
- (id)_headGestureConfigurationForRoute:(id)a3;
- (id)headGestureConfiguration;
- (void)_audioRouteDidChange:(id)a3;
- (void)_fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:(id)a3 withCompletion:(id)a4;
- (void)_fetchWirelessSplitterSessionInfoAndStartObservingFromSourceWithCompletion:(id)a3;
- (void)_handleJSDiscoveryNotificationForDevice:(id)a3;
- (void)_stopObservingInEarDetectionStateFromSource;
- (void)_updateAnnounceNotificationsOnHearingAidSupportedStatus;
@end

@implementation ADSiriHeadphonesMonitor

- (id)headGestureConfiguration
{
  v3 = [(AFSiriHeadphonesMonitor *)self currentAudioRoute];
  v4 = [(ADSiriHeadphonesMonitor *)self _headGestureConfigurationForRoute:v3];

  return v4;
}

- (id)_headGestureConfigurationForRoute:(id)a3
{
  id v3 = a3;
  v4 = +[ADBluetoothManager sharedInstance];
  v5 = [v3 btAddress];

  v6 = [v4 headGestureConfigurationForBTAddress:v5];

  v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    v10 = "-[ADSiriHeadphonesMonitor _headGestureConfigurationForRoute:]";
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Bobble Configuration: %@", (uint8_t *)&v9, 0x16u);
  }
  return v6;
}

- (void)_audioRouteDidChange:(id)a3
{
  id v4 = a3;
  if ([v4 supportsVolumeAdjustment])
  {
    v5 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v6 = v5;
      v7 = [v4 btAddress];
      int v12 = 136315394;
      v13 = "-[ADSiriHeadphonesMonitor _audioRouteDidChange:]";
      __int16 v14 = 2112;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Adjusting Siri's volume for route: %@", (uint8_t *)&v12, 0x16u);
    }
    v8 = +[ADSpeechManager sharedManager];
    [v8 adjustSiriOutputVolumeForRouteIfNeeded:v4];
  }
  int v9 = [v4 btAddress];

  if (v9)
  {
    v10 = [(ADSiriHeadphonesMonitor *)self _headGestureConfigurationForRoute:v4];
    if ([v10 isSupported])
    {
      __int16 v11 = +[AFPreferences sharedPreferences];
      [v11 setStoredHeadGestureConfigurationForDevice:v10];
    }
  }
}

- (void)_updateAnnounceNotificationsOnHearingAidSupportedStatus
{
}

- (void)_stopObservingInEarDetectionStateFromSource
{
  id v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v5 = v3;
    v6 = +[NSNumber numberWithUnsignedInteger:[(AFSiriHeadphonesMonitor *)self _observerID]];
    int v7 = 136315394;
    v8 = "-[ADSiriHeadphonesMonitor _stopObservingInEarDetectionStateFromSource]";
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s Stop observing IED States for observerID: %@", (uint8_t *)&v7, 0x16u);
  }
  id v4 = +[ADBluetoothInEarDetectionStateObserver sharedObserver];
  objc_msgSend(v4, "stopObservingForObserverID:", -[AFSiriHeadphonesMonitor _observerID](self, "_observerID"));
}

- (void)_handleJSDiscoveryNotificationForDevice:(id)a3
{
  id v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v5 = v4;
    id v6 = a3;
    int v7 = [v6 name];
    v8 = [v6 address];

    int v9 = 136315650;
    v10 = "-[ADSiriHeadphonesMonitor _handleJSDiscoveryNotificationForDevice:]";
    __int16 v11 = 2112;
    int v12 = v7;
    __int16 v13 = 2112;
    __int16 v14 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s Received AACP capabilities for %@(%@)", (uint8_t *)&v9, 0x20u);
  }
}

- (void)_fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[ADBluetoothManager sharedInstance];
  int v9 = [v8 deviceWithAddress:v6];

  if (v9)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100328D8C;
    v15[3] = &unk_10050C410;
    id v16 = v7;
    [v9 getHeadphoneInEarDetectionState:v15];
  }
  else if (v7)
  {
    v10 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1803 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
  __int16 v11 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    __int16 v13 = v11;
    __int16 v14 = +[NSNumber numberWithUnsignedInteger:[(AFSiriHeadphonesMonitor *)self _observerID]];
    *(_DWORD *)buf = 136315650;
    v18 = "-[ADSiriHeadphonesMonitor _fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:withCompletion:]";
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    v22 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s Start observing IED States for %@ for observerID: %@", buf, 0x20u);
  }
  int v12 = +[ADBluetoothInEarDetectionStateObserver sharedObserver];
  objc_msgSend(v12, "startObservingForBTAddress:forObserverID:", v6, -[AFSiriHeadphonesMonitor _observerID](self, "_observerID"));
}

- (void)_fetchWirelessSplitterSessionInfoAndStartObservingFromSourceWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[ADBluetoothManager sharedInstance];
  v5 = [v4 wirelessSplitterSession];

  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100328ED4;
    v8[3] = &unk_10050D228;
    id v9 = v3;
    [v5 getSessionInfo:v8];
  }
  else if (v3)
  {
    id v6 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1800 userInfo:0];
    (*((void (**)(id, void, void *))v3 + 2))(v3, 0, v6);
  }
  id v7 = +[ADBluetoothWirelessSplitterSessionObserver sharedWirelessSplitterSessionObserver];
  [v7 startObserving];
}

@end