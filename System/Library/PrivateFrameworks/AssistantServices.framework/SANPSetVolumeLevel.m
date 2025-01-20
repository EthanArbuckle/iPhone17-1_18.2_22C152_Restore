@interface SANPSetVolumeLevel
- (int64_t)_ad_volumeAction;
- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4;
@end

@implementation SANPSetVolumeLevel

- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SANPSetVolumeLevel *)self volumeValue];
  [v8 floatValue];
  float v10 = v9;

  v11 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    v13 = [(SANPSetVolumeLevel *)self actionType];
    *(_DWORD *)buf = 136315650;
    v21 = "-[SANPSetVolumeLevel(ADMediaRemote) _ad_performWithMediaRemoteService:replyHandler:]";
    __int16 v22 = 2112;
    v23 = v13;
    __int16 v24 = 2048;
    double v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %@ %f", buf, 0x20u);
  }
  [(SANPSetVolumeLevel *)self acknowledgedExceedingVolumeLimit];
  int64_t v14 = [(SANPSetVolumeLevel *)self _ad_volumeAction];
  mach_absolute_time();
  v15 = [v6 targetQueue];
  v18 = v6;
  v19 = v7;
  id v16 = v6;
  id v17 = v7;
  AFPerformDeviceVolumeAction();

  +[AFAggregator logSiriMediaVolumeAction:v14];
}

- (int64_t)_ad_volumeAction
{
  v2 = [(SANPSetVolumeLevel *)self actionType];
  if ([SANPVolumeLevelActionTypeSETValue isEqualToString:v2])
  {
    int64_t v3 = 2;
  }
  else if ([SANPVolumeLevelActionTypeINCREASEValue isEqualToString:v2])
  {
    int64_t v3 = 3;
  }
  else if ([SANPVolumeLevelActionTypeDECREASEValue isEqualToString:v2])
  {
    int64_t v3 = 4;
  }
  else
  {
    v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[SANPSetVolumeLevel(ADMediaRemote) _ad_volumeAction]";
      __int16 v8 = 2112;
      float v9 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Unknown actionType %@", (uint8_t *)&v6, 0x16u);
    }
    int64_t v3 = 0;
  }

  return v3;
}

@end