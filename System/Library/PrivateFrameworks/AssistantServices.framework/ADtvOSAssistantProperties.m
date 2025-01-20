@interface ADtvOSAssistantProperties
- (ADtvOSAssistantProperties)initWithQueue:(id)a3;
- (BOOL)_getIsAdaptiveVolumeEnabled;
- (BOOL)_getIsPermanentOffsetEnabled;
- (BOOL)_getIsPersonalDomainsEnabled;
- (float)_getPermanentOffsetFactor;
- (id)_getODDAdaptiveVolumeProperties;
- (id)_getODDHomePodProperties;
- (id)_getODDMultiUserSetupStatusFrom:(id)a3;
- (id)_getVoiceSettings;
- (int)_getAdaptiveVolumeUserIntent;
- (void)_getMultiUserSetupStatusWithCompletion:(id)a3;
- (void)_getODDMultiUserStateWithCompletion:(id)a3;
- (void)_getODDUserPersonalizationArrayWithCompletion:(id)a3;
- (void)_getODDUserPersonalizationForSharedUser:(id)a3 withCompletion:(id)a4;
- (void)getODDtvOSAssistantPropertiesWithCompletion:(id)a3;
@end

@implementation ADtvOSAssistantProperties

- (void).cxx_destruct
{
}

- (float)_getPermanentOffsetFactor
{
  v2 = +[CSPreferences sharedPreferences];
  [v2 adaptiveSiriVolumePermanentOffset];
  v3 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (BOOL)_getIsPermanentOffsetEnabled
{
  v2 = +[CSPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 isAdaptiveSiriVolumePermanentOffsetEnabled];

  return v3;
}

- (int)_getAdaptiveVolumeUserIntent
{
  v2 = +[CSPreferences sharedPreferences];
  unsigned __int8 v3 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v2 adaptiveSiriVolumeRecentIntent]);

  unsigned int v4 = [v3 intValue];
  if (v4 - 1 < 3) {
    int v5 = v4 + 1;
  }
  else {
    int v5 = 1;
  }

  return v5;
}

- (BOOL)_getIsAdaptiveVolumeEnabled
{
  v2 = +[CSPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 smartSiriVolumeContextAwareEnabled];

  return v3;
}

- (BOOL)_getIsPersonalDomainsEnabled
{
  v2 = +[ADMultiUserService sharedService];
  unsigned __int8 v3 = [v2 primaryUser];
  unsigned __int8 v4 = [v3 personalDomainsIsEnabled];

  return v4;
}

- (id)_getVoiceSettings
{
  return 0;
}

- (void)_getMultiUserSetupStatusWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (id)_getODDMultiUserSetupStatusFrom:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    v8 = "-[ADtvOSAssistantProperties _getODDMultiUserSetupStatusFrom:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v7, 0xCu);
  }
  id v5 = objc_alloc_init((Class)ODDSiriSchemaODDMultiUserSetupStatus);
  objc_msgSend(v5, "setNumGuestsAccepted:", objc_msgSend(v3, "numGuestsAccepted"));
  objc_msgSend(v5, "setNumParticipantsWithTrust:", objc_msgSend(v3, "numParticipantsWithTrust"));
  objc_msgSend(v5, "setNumUsersWhoSyncedRecognizeMyVoice:", objc_msgSend(v3, "numUsersWhoSyncedRecognizeMyVoice"));
  objc_msgSend(v5, "setNumUsersWithRecognizeMyVoiceEnabled:", objc_msgSend(v3, "numUsersWithRecognizeMyVoiceEnabled"));
  objc_msgSend(v5, "setNumVoiceProfilesAvailable:", objc_msgSend(v3, "numVoiceProfilesAvailable"));
  objc_msgSend(v5, "setNumUsersWithPersonalRequestsEnabled:", objc_msgSend(v3, "numUsersWithPersonalRequestsEnabled"));
  objc_msgSend(v5, "setNumUsersWithMatchingSiriLanguage:", objc_msgSend(v3, "numUsersWithMatchingSiriLanguage"));
  objc_msgSend(v5, "setNumUsersWithSiriCloudSyncEnabled:", objc_msgSend(v3, "numUsersWithSiriCloudSyncEnabled"));
  objc_msgSend(v5, "setNumUsersWithLocationServicesEnabled:", objc_msgSend(v3, "numUsersWithLocationServicesEnabled"));

  return v5;
}

- (id)_getODDAdaptiveVolumeProperties
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    int v7 = "-[ADtvOSAssistantProperties _getODDAdaptiveVolumeProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }
  id v4 = objc_alloc_init((Class)ODDSiriSchemaODDAdaptiveVolumeProperties);
  objc_msgSend(v4, "setIsAdaptiveVolumeEnabled:", -[ADtvOSAssistantProperties _getIsAdaptiveVolumeEnabled](self, "_getIsAdaptiveVolumeEnabled"));
  objc_msgSend(v4, "setAdaptiveVolume:", -[ADtvOSAssistantProperties _getAdaptiveVolumeUserIntent](self, "_getAdaptiveVolumeUserIntent"));
  objc_msgSend(v4, "setIsPermanentOffsetEnabled:", -[ADtvOSAssistantProperties _getIsPermanentOffsetEnabled](self, "_getIsPermanentOffsetEnabled"));
  [(ADtvOSAssistantProperties *)self _getPermanentOffsetFactor];
  objc_msgSend(v4, "setPermanentOffsetFactor:");
  return v4;
}

- (id)_getODDHomePodProperties
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    v8 = "-[ADtvOSAssistantProperties _getODDHomePodProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v7, 0xCu);
  }
  id v4 = objc_alloc_init((Class)ODDSiriSchemaODDHomePodProperties);
  id v5 = [(ADtvOSAssistantProperties *)self _getODDAdaptiveVolumeProperties];
  [v4 setAdaptiveVolume:v5];

  objc_msgSend(v4, "setIsPersonalDomainsEnabled:", -[ADtvOSAssistantProperties _getIsPersonalDomainsEnabled](self, "_getIsPersonalDomainsEnabled"));
  return v4;
}

- (void)_getODDUserPersonalizationForSharedUser:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[ADtvOSAssistantProperties _getODDUserPersonalizationForSharedUser:withCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  id v9 = objc_alloc_init((Class)ODDSiriSchemaODDUserPersonalization);
  objc_msgSend(v9, "setIsPersonalDomainRequestsEnabled:", objc_msgSend(v6, "personalDomainsIsEnabled"));
  v10 = [(ADtvOSAssistantProperties *)self _getVoiceSettings];
  [v9 setVoiceSettings:v10];

  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10011A880;
  v14[3] = &unk_10050DEC0;
  id v15 = v9;
  id v16 = v7;
  id v12 = v7;
  id v13 = v9;
  +[ADDevicePropertiesUtils fetchActiveSubscriptionsWithQueue:queue completion:v14];
}

- (void)_getODDUserPersonalizationArrayWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[ADtvOSAssistantProperties _getODDUserPersonalizationArrayWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  id v5 = dispatch_group_create();
  id v6 = +[ADMultiUserService sharedService];
  id v7 = [v6 sharedUsersBySharedUserID];
  id v8 = [v7 count];

  id v9 = &unk_1003E2000;
  if (v8)
  {
    id v22 = v3;
    id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v11 = [v6 sharedUsersBySharedUserID];
    id v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        id v15 = 0;
        do
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8 * (void)v15);
          v17 = objc_msgSend(v6, "sharedUsersBySharedUserID", v22);
          v18 = [v17 objectForKey:v16];

          if (v18)
          {
            dispatch_group_enter(v5);
            v27[0] = _NSConcreteStackBlock;
            v27[1] = 3221225472;
            v27[2] = sub_10011ABE8;
            v27[3] = &unk_1005028C8;
            id v28 = v10;
            v29 = v5;
            [(ADtvOSAssistantProperties *)self _getODDUserPersonalizationForSharedUser:v18 withCompletion:v27];
          }
          id v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v13);
    }

    id v3 = v22;
    id v9 = (void *)&unk_1003E2000;
  }
  else
  {
    id v10 = 0;
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = v9[237];
  block[2] = sub_10011AC28;
  block[3] = &unk_10050E188;
  id v25 = v10;
  id v26 = v3;
  id v20 = v10;
  id v21 = v3;
  dispatch_group_notify(v5, queue, block);
}

- (void)_getODDMultiUserStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v25 = "-[ADtvOSAssistantProperties _getODDMultiUserStateWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  id v6 = dispatch_group_create();
  id v7 = objc_alloc_init((Class)ODDSiriSchemaODDMultiUserState);
  dispatch_group_enter(v6);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10011AE9C;
  v21[3] = &unk_1005028A0;
  id v8 = v7;
  id v22 = v8;
  id v9 = v6;
  v23 = v9;
  [(ADtvOSAssistantProperties *)self _getMultiUserSetupStatusWithCompletion:v21];
  dispatch_group_enter(v9);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10011AEDC;
  v18[3] = &unk_100506530;
  id v10 = v8;
  id v19 = v10;
  id v20 = v9;
  v11 = v9;
  [(ADtvOSAssistantProperties *)self _getODDUserPersonalizationArrayWithCompletion:v18];
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10011AF1C;
  v15[3] = &unk_10050E188;
  id v16 = v10;
  id v17 = v4;
  id v13 = v10;
  id v14 = v4;
  dispatch_group_notify(v11, queue, v15);
}

- (void)getODDtvOSAssistantPropertiesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[ADtvOSAssistantProperties getODDtvOSAssistantPropertiesWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  id v6 = objc_alloc_init((Class)ODDSiriSchemaODDtvOSAssistantProperties);
  id v7 = [(ADtvOSAssistantProperties *)self _getODDHomePodProperties];
  [v6 setHomePodProperties:v7];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10011B0A8;
  v10[3] = &unk_100502878;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  [(ADtvOSAssistantProperties *)self _getODDMultiUserStateWithCompletion:v10];
}

- (ADtvOSAssistantProperties)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADtvOSAssistantProperties;
  id v6 = [(ADtvOSAssistantProperties *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

@end