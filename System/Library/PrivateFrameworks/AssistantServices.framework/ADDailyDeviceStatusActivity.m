@interface ADDailyDeviceStatusActivity
+ (const)activityIdentifier;
+ (id)taskFromActivity:(id)a3;
+ (id)xpcCriteria;
- (ADDailyDeviceStatusActivity)init;
- (BOOL)_isSiriCapableDigitalCarKeyAvailable;
- (BOOL)_preciseLocationEnabled;
- (id)_buildDailySelfTriggerSuppressionMetrics;
- (id)_buildDailyVoiceTriggerMetrics:(id)a3;
- (id)_truncatedGradingOptInStateChanges:(id)a3;
- (id)fetchVoiceTriggerSettings;
- (id)getVolumeCapacity;
- (int)_locationAccessPermission;
- (int)getAdaptiveVolumeUserIntent:(int)a3;
- (int)getSiriDataSharingOptInStatus;
- (void)_triggerABCForNullAssistantIdentifier;
- (void)buildDailyDeviceStatusHeartbeatMetricsWithSiriEnabled:(BOOL)a3 onLockscreen:(BOOL)a4 dictationEnabled:(BOOL)a5 voiceTriggerEnabled:(BOOL)a6 starkHasBeenActiveWithin24Hours:(BOOL)a7 raiseToSpeakEnabled:(BOOL)a8 activeAppleAudioDevices:(id)a9 spokenNotificationsEnabled:(BOOL)a10 announceNotificationsEnabledOnHeadphones:(BOOL)a11 carplayAnnounceEnablementType:(int64_t)a12 isAnnounceNotificationsMutedForCarPlay:(BOOL)a13 shouldSkipTriggerlessReplyConfirmation:(BOOL)a14 spokenNotificationsProxCardSeen:(BOOL)a15 spokenNotificationsControlCenterModuleEnabled:(BOOL)a16 spokenNotificationsWhitelistSettings:(unint64_t)a17 announceCallsEnabled:(BOOL)a18 preciseLocationEnabled:(BOOL)a19 locationAccessPermission:(int)a20 adaptiveSiriVolumeEnabled:(BOOL)a21 adaptiveSiriVolumePermanentOffsetEnabled:(BOOL)a22 adaptiveSiriVolumePermanentOffsetFactor:(id)a23 adaptiveSiriVolumeMostRecentIntent:(id)a24 isRemoteDarwinVoiceTriggerEnabled:(BOOL)a25 autoSendSettings:(id)a26 siriInCallEnablementState:(int)a27 hangUpEnablementState:(int)a28 heartbeatQueuedTime:(unint64_t)a29 siriVoiceTriggerSettings:(id)a30 isShowAppsBehindSiriEnabledOnCarPlay:(BOOL)a31 isSiriCapableDigitalCarKeyAvailable:(BOOL)a32 connectedBTCarHeadunits:(id)a33 withCompletion:(id)a34;
- (void)fetchAppleMusicSubscriptionForSharedUser:(id)a3 completion:(id)a4;
- (void)fetchEnrolledUsersWithCompletion:(id)a3;
- (void)fetchICUserIdentityForSharedUser:(id)a3 completion:(id)a4;
- (void)runWithCompletion:(id)a3;
@end

@implementation ADDailyDeviceStatusActivity

- (void).cxx_destruct
{
}

- (id)fetchVoiceTriggerSettings
{
  id v2 = objc_alloc_init((Class)SISchemaSiriVoiceTriggerSettings);
  [v2 setIsHeySiriTriggerPhraseEnabled:0];
  [v2 setIsJustSiriTriggerPhraseEnabled:0];
  [v2 setIsEnrollmentReprompted:0];
  v3 = +[VTPreferences sharedPreferences];
  unsigned int v4 = [v3 voiceTriggerEnabled];

  if (v4)
  {
    v5 = +[VTPreferences sharedPreferences];
    uint64_t v10 = 0;
    id v6 = [v5 getUserPreferredVoiceTriggerPhraseTypeForDeviceType:0 endpointId:0 error:&v10];

    if ((unint64_t)v6 <= 1)
    {
      [v2 setIsHeySiriTriggerPhraseEnabled:1];
      [v2 setIsJustSiriTriggerPhraseEnabled:v6];
    }
  }
  v7 = +[CSPreferences sharedPreferences];
  v8 = [v7 dateWhenVoiceTriggerRePrompted];

  if (v8) {
    [v2 setIsEnrollmentReprompted:1];
  }
  return v2;
}

- (void)fetchICUserIdentityForSharedUser:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[ADDailyDeviceStatusActivity fetchICUserIdentityForSharedUser:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (v5 && ([v5 homeUserUUID], v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    id v9 = objc_alloc((Class)NSUUID);
    uint64_t v10 = [v5 homeUserUUID];
    id v11 = [v9 initWithUUIDString:v10];

    if (qword_100585750 != -1) {
      dispatch_once(&qword_100585750, &stru_1004FF938);
    }
    v12 = +[ACAccountStore ic_sharedAccountStore];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100067C20;
    v15[3] = &unk_1004FF960;
    id v16 = v11;
    id v17 = v6;
    id v13 = v11;
    objc_msgSend(v12, "ic_storeAccountForHomeUserIdentifier:completion:", v13, v15);
  }
  else
  {
    v14 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[ADDailyDeviceStatusActivity fetchICUserIdentityForSharedUser:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Non home shared user, Bailing.", buf, 0xCu);
    }
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (void)fetchAppleMusicSubscriptionForSharedUser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    v15 = "-[ADDailyDeviceStatusActivity fetchAppleMusicSubscriptionForSharedUser:completion:]";
    __int16 v16 = 2113;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Fetching ICUserIdentity for sharedUser: %{private}@", buf, 0x16u);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100068298;
  v11[3] = &unk_1004FF918;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [(ADDailyDeviceStatusActivity *)self fetchICUserIdentityForSharedUser:v9 completion:v11];
}

- (id)getVolumeCapacity
{
  id v2 = objc_alloc((Class)NSURL);
  v3 = NSHomeDirectory();
  id v4 = [v2 initFileURLWithPath:v3 isDirectory:1];

  v14[0] = NSURLVolumeTotalCapacityKey;
  v14[1] = NSURLVolumeAvailableCapacityForImportantUsageKey;
  v14[2] = NSURLVolumeAvailableCapacityKey;
  v14[3] = NSURLVolumeAvailableCapacityForOpportunisticUsageKey;
  id v5 = +[NSArray arrayWithObjects:v14 count:4];
  id v11 = 0;
  id v6 = [v4 resourceValuesForKeys:v5 error:&v11];
  id v7 = v11;

  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = AFSiriLogContextUtility;
    if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "-[ADDailyDeviceStatusActivity getVolumeCapacity]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s #Unable to get volumeTotalCapacityDict", buf, 0xCu);
    }
  }

  return v6;
}

- (void)_triggerABCForNullAssistantIdentifier
{
  id v2 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315138;
    id v7 = "-[ADDailyDeviceStatusActivity _triggerABCForNullAssistantIdentifier]";
    _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s Reporting missing DailyDeviceStatus > siriDeviceID to ABC", (uint8_t *)&v6, 0xCu);
  }
  v3 = +[SiriCoreSymptomsReporter sharedInstance];
  id v4 = +[NSProcessInfo processInfo];
  id v5 = [v4 processIdentifier];
  [v3 reportIssueForType:@"SISchemaDailyDeviceStatus" subType:@"null_siriDeviceID" context:&__NSDictionary0__struct processIdentifier:v5 walkboutStatus:byte_100585E38];
}

- (id)_truncatedGradingOptInStateChanges:(id)a3
{
  id v3 = a3;
  id v4 = [v3 siriDataSharingOptInStatusHistory];
  id v5 = [v4 count];
  if ((unint64_t)v5 >= 5) {
    uint64_t v6 = 5;
  }
  else {
    uint64_t v6 = (uint64_t)v5;
  }
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ADDailyDeviceStatusActivity _truncatedGradingOptInStateChanges:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    id v13 = (uint64_t (*)(uint64_t, uint64_t))v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Fetching %lu most recent siri data sharing opt-in status change entries from preferences %@", buf, 0x20u);
  }
  id v8 = objc_msgSend(v4, "subarrayWithRange:", 0, v6);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v13 = sub_100068BA0;
  v14 = sub_100068BB0;
  id v15 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100068BB8;
  v11[3] = &unk_1005027E0;
  void v11[4] = buf;
  v11[5] = v6;
  [v8 enumerateObjectsUsingBlock:v11];
  id v9 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v9;
}

- (int)getAdaptiveVolumeUserIntent:(int)a3
{
  if ((a3 - 1) < 3) {
    return a3 + 1;
  }
  else {
    return 1;
  }
}

- (int)getSiriDataSharingOptInStatus
{
  uint64_t v2 = _AFPreferencesSiriDataSharingOptInStatus();
  if ((unint64_t)(v2 - 1) >= 3) {
    LODWORD(v2) = 0;
  }
  return v2;
}

- (void)fetchEnrolledUsersWithCompletion:(id)a3
{
  id v4 = a3;
  v31 = +[ADMultiUserService sharedService];
  id v5 = [v31 sharedUsersBySharedUserID];
  id v6 = [v5 count];

  id v7 = AFSiriLogContextDaemon;
  BOOL v8 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v6)
  {
    v29 = v4;
    if (v8)
    {
      id v9 = v7;
      id v10 = [v31 sharedUsersBySharedUserID];
      *(_DWORD *)buf = 136315395;
      v47 = "-[ADDailyDeviceStatusActivity fetchEnrolledUsersWithCompletion:]";
      __int16 v48 = 2113;
      v49 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Fetching enrolledUsers info: %{private}@", buf, 0x16u);
    }
    id v11 = dispatch_group_create();
    id v12 = objc_alloc((Class)NSMutableArray);
    id v13 = [v31 sharedUsersBySharedUserID];
    id v30 = objc_msgSend(v12, "initWithCapacity:", objc_msgSend(v13, "count"));

    long long v43 = 0u;
    long long v44 = 0u;
    long long v42 = 0u;
    long long v41 = 0u;
    v14 = [v31 sharedUsersBySharedUserID];
    id v15 = [v14 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v42;
      do
      {
        v18 = 0;
        do
        {
          if (*(void *)v42 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v41 + 1) + 8 * (void)v18);
          v20 = objc_msgSend(v31, "sharedUsersBySharedUserID", v29);
          v21 = [v20 objectForKey:v19];

          if (v21)
          {
            id v22 = objc_alloc_init((Class)SISchemaEnrolledUserState);
            v23 = [v21 speechID];
            [v22 setSiriLinkedSpeechID:v23];

            id v24 = objc_alloc_init((Class)SISchemaPersonalization);
            objc_msgSend(v24, "setPersonalDomainsSetup:", objc_msgSend(v21, "personalDomainsIsEnabled"));
            dispatch_group_enter(v11);
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472;
            v35[2] = sub_1000690C8;
            v35[3] = &unk_1004FF8C8;
            id v36 = v24;
            id v37 = v22;
            v38 = self;
            id v39 = v30;
            v40 = v11;
            id v25 = v22;
            id v26 = v24;
            [(ADDailyDeviceStatusActivity *)self fetchAppleMusicSubscriptionForSharedUser:v21 completion:v35];
          }
          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v16);
    }

    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100069198;
    block[3] = &unk_10050E188;
    id v4 = v29;
    id v33 = v30;
    id v34 = v29;
    id v28 = v30;
    dispatch_group_notify(v11, queue, block);
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[ADDailyDeviceStatusActivity fetchEnrolledUsersWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s No enrolledUsers in sharedService", buf, 0xCu);
    }
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (int)_locationAccessPermission
{
  if (!+[CLLocationManager locationServicesEnabled]) {
    return 1;
  }
  uint64_t v2 = AFEffectiveSiriBundlePathForLocation();
  unsigned int v3 = +[CLLocationManager authorizationStatusForBundlePath:v2];

  if (v3 - 1 > 3) {
    return 4;
  }
  else {
    return dword_1003E2A50[v3 - 1];
  }
}

- (BOOL)_preciseLocationEnabled
{
  id v2 = objc_alloc((Class)CLLocationManager);
  unsigned int v3 = AFEffectiveSiriBundleForLocation();
  id v4 = [v2 initWithEffectiveBundle:v3];

  LOBYTE(v3) = [v4 accuracyAuthorization] == 0;
  return (char)v3;
}

- (BOOL)_isSiriCapableDigitalCarKeyAvailable
{
  id v2 = objc_alloc_init((Class)PKPassLibrary);
  unsigned int v3 = [v2 passesOfType:1];
  objc_msgSend(v3, "pk_objectsPassingTest:", &stru_1004FF8A0);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "passActivationState", (void)v9))
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

- (id)_buildDailySelfTriggerSuppressionMetrics
{
  id v30 = objc_alloc_init((Class)SISchemaSelfTriggerSuppressionMetrics);
  id v2 = sub_1000697B8(@"Siri.SelfTriggerSuppression");
  unsigned int v3 = +[NSDate date];
  [v3 timeIntervalSince1970];
  double v5 = v4;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v2;
  id v6 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v6)
  {
    id v7 = v6;
    unsigned int v31 = 0;
    unint64_t v33 = 0;
    uint64_t v8 = *(void *)v35;
    double v9 = 0.0;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        long long v12 = objc_msgSend(v11, "objectForKey:", @"eventTimestamp", v30);
        id v13 = v12;
        if (v12)
        {
          [v12 doubleValue];
          if (v5 - v14 < 86400.0)
          {
            id v15 = objc_alloc_init((Class)MHSchemaMHSelfTriggerSuppressionSession);
            id v16 = [v11 objectForKey:@"numSelfTriggersDetectedDuringEvent"];
            uint64_t v17 = v16;
            if (v16)
            {
              v31 += [v16 unsignedIntValue];
              objc_msgSend(v15, "setNumSelfTriggersDetectedInSession:", objc_msgSend(v17, "unsignedIntValue"));
            }
            v18 = [v11 objectForKey:@"durationOfSelfTriggerEventInSec"];
            uint64_t v19 = v18;
            if (v18)
            {
              [v18 doubleValue];
              double v9 = v9 + v20;
              [v19 doubleValue];
              objc_msgSend(v15, "setSessionDurationInSeconds:");
            }
            v21 = [v11 objectForKey:@"audioSource"];
            id v22 = v21;
            if (v17)
            {
              if ([v21 unsignedIntValue] == 1) {
                uint64_t v23 = 1;
              }
              else {
                uint64_t v23 = 2 * ([v22 unsignedIntValue] == 2);
              }
              [v15 setAudioSource:v23];
            }
            id v24 = [v11 objectForKey:@"isBluetoothSpeakerActive"];
            id v25 = v24;
            if (v24) {
              objc_msgSend(v15, "setIsBluetoothSpeakerActive:", objc_msgSend(v24, "BOOLValue"));
            }
            id v26 = [v11 objectForKey:@"isBuiltInSpeakerActive"];
            v27 = v26;
            if (v26) {
              objc_msgSend(v15, "setIsBuiltInSpeakerActive:", objc_msgSend(v26, "BOOLValue"));
            }
            unint64_t v28 = v33;
            if (v33 <= 0xC7)
            {
              [v30 addSelfTriggerSuppressionSessions:v15];
              unint64_t v28 = v33;
            }
            unint64_t v33 = v28 + 1;
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v7);
  }
  else
  {
    unsigned int v31 = 0;
    double v9 = 0.0;
  }

  [v30 setNumSelfTriggersDetected:v31];
  [v30 setDurationSelfTriggerSuppressionWasActiveInSeconds:v9];

  return v30;
}

- (id)_buildDailyVoiceTriggerMetrics:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)SISchemaVoiceTriggerMetrics);
  double v5 = [v3 objectForKey:kCSVoiceTriggerNumImplicitUtt];
  id v6 = v5;
  if (v5) {
    objc_msgSend(v4, "setImplicitUtterances:", objc_msgSend(v5, "intValue"));
  }
  id v7 = [v3 objectForKey:kCSVoiceTriggerNumExplicitUtt];
  uint64_t v8 = v7;
  if (v7) {
    objc_msgSend(v4, "setExplicitUtterances:", objc_msgSend(v7, "intValue"));
  }
  v71 = v8;
  v72 = v6;
  double v9 = [v3 objectForKey:kCSVoiceTriggerFirstPassTriggersPerDay];
  long long v10 = v9;
  if (v9) {
    objc_msgSend(v4, "setFirstPassTriggers:", objc_msgSend(v9, "intValue"));
  }
  v70 = v10;
  v73 = v3;
  long long v11 = [v3 objectForKey:kCSVoiceTriggerIsJSEnabled];
  id v12 = [v11 BOOLValue];

  [v4 setIsJSEnabled:v12];
  id v13 = sub_1000697B8(@"Siri.VoiceTriggerStatistics");
  double v14 = +[NSDate date];
  [v14 timeIntervalSince1970];
  double v16 = v15;

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id obj = v13;
  id v17 = [obj countByEnumeratingWithState:&v93 objects:v97 count:16];
  if (v17)
  {
    id v18 = v17;
    unint64_t v19 = 0;
    unint64_t v20 = (unint64_t)v16;
    uint64_t v21 = *(void *)v94;
    v75 = v4;
    uint64_t v74 = *(void *)v94;
    do
    {
      id v22 = 0;
      id v76 = v18;
      do
      {
        if (*(void *)v94 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v93 + 1) + 8 * (void)v22);
        id v24 = [v23 objectForKey:@"absoluteTimestamp"];
        id v25 = v24;
        if (v24 && (v20 - (unint64_t)[v24 unsignedLongLongValue]) >> 7 <= 0x2A2 && v19 <= 0xC7)
        {
          unint64_t v26 = v19;
          id v27 = v4;
          v92 = v25;
          id v28 = objc_alloc_init((Class)MHSchemaMHVoiceTriggerFirstPassStatistic);
          v29 = [v23 objectForKey:@"firstPassPeakScoreHS"];
          id v30 = v29;
          if (v29)
          {
            [v29 floatValue];
            objc_msgSend(v28, "setFirstPassPeakScoreHS:");
          }
          unsigned int v31 = [v23 objectForKey:@"firstPassPeakScoreJS"];
          v32 = v31;
          if (v31)
          {
            [v31 floatValue];
            objc_msgSend(v28, "setFirstPassPeakScoreJS:");
          }
          v90 = v32;
          unint64_t v33 = [v23 objectForKey:@"triggerScoreHS"];
          long long v34 = v33;
          if (v33)
          {
            [v33 floatValue];
            objc_msgSend(v28, "setTriggerScoreHS:");
          }
          v89 = v34;
          long long v35 = [v23 objectForKey:@"triggerScoreJS"];
          long long v36 = v27;
          long long v37 = v35;
          if (v35)
          {
            [v35 floatValue];
            objc_msgSend(v28, "setTriggerScoreJS:");
          }
          v88 = v37;
          v38 = [v23 objectForKey:@"keywordThresholdHS"];
          id v39 = v38;
          if (v38)
          {
            [v38 floatValue];
            objc_msgSend(v28, "setKeywordThresholdHS:");
          }
          v87 = v39;
          v40 = [v23 objectForKey:@"keywordThresholdJS"];
          unint64_t v82 = v26;
          long long v41 = v40;
          if (v40)
          {
            [v40 floatValue];
            objc_msgSend(v28, "setKeywordThresholdJS:");
          }
          v86 = v41;
          long long v42 = [v23 objectForKey:@"recognizerScoreHS"];
          long long v43 = v42;
          if (v42)
          {
            [v42 floatValue];
            objc_msgSend(v28, "setRecognizerScoreHS:");
          }
          long long v44 = [v23 objectForKey:@"recognizerScoreJS"];
          v45 = v44;
          if (v44)
          {
            [v44 floatValue];
            objc_msgSend(v28, "setRecognizerScoreJS:");
          }
          v85 = v45;
          v46 = [v23 objectForKey:@"firstPassTriggerSource"];
          v47 = v46;
          if (v46) {
            objc_msgSend(v28, "setFirstPassTriggerSource:", objc_msgSend(v46, "intValue"));
          }
          __int16 v48 = [v23 objectForKey:@"absoluteTimestamp"];
          v49 = v48;
          if (v48) {
            objc_msgSend(v28, "setSecondsSinceEpoch:", objc_msgSend(v48, "unsignedLongLongValue"));
          }
          v50 = [v23 objectForKey:@"repetitionSimilarityScore"];
          v51 = v50;
          if (v50)
          {
            [v50 floatValue];
            objc_msgSend(v28, "setRepetitionSimilarityScore:");
          }
          v81 = v51;
          v52 = [v23 objectForKey:@"mitigationScore"];
          v53 = v52;
          if (v52)
          {
            [v52 floatValue];
            objc_msgSend(v28, "setMitigationScore:");
          }
          v54 = [v23 objectForKey:@"invocationTypeID"];
          v55 = v54;
          if (v54) {
            objc_msgSend(v28, "setInvocationTypeId:", objc_msgSend(v54, "intValue"));
          }
          v79 = v55;
          v91 = v30;
          v56 = [v23 objectForKey:@"tdSpeakerRecognizerCombinedScore"];
          v57 = v56;
          if (v56)
          {
            [v56 floatValue];
            objc_msgSend(v28, "setTdSpeakerRecognizerCombinedScore:");
          }
          v83 = v49;
          v58 = [v23 objectForKey:@"tdSpeakerRecognizerCombinedThresholdHS"];
          v59 = v58;
          if (v58)
          {
            [v58 floatValue];
            objc_msgSend(v28, "setTdSpeakerRecognizerCombinedThresholdHS:");
          }
          v78 = v57;
          v80 = v53;
          v60 = [v23 objectForKey:@"tdSpeakerRecognizerCombinedThresholdJS"];
          v61 = v60;
          if (v60)
          {
            [v60 floatValue];
            objc_msgSend(v28, "setTdSpeakerRecognizerCombinedThresholdJS:");
          }
          [v36 addFirstPassStatistics:v28];
          id v62 = objc_alloc_init((Class)MHSchemaMHVoiceTriggerFirstPassDailyMetadata);
          v63 = [v23 objectForKey:@"hwSampleRate"];
          v64 = v63;
          if (v63) {
            objc_msgSend(v62, "setHardwareSampleRate:", objc_msgSend(v63, "intValue"));
          }
          v84 = v47;
          v65 = [v23 objectForKey:@"configVersion"];
          uint64_t v66 = +[NSNull null];
          if (v65 == (void *)v66)
          {
          }
          else
          {
            v67 = (void *)v66;
            id v68 = [v65 length];

            if (v68) {
              [v62 setConfigVersion:v65];
            }
          }
          unint64_t v19 = v82 + 1;
          id v4 = v75;
          [v75 setFirstPassMetadata:v62];

          id v18 = v76;
          uint64_t v21 = v74;
          unint64_t v20 = (unint64_t)v16;
          id v25 = v92;
        }

        id v22 = (char *)v22 + 1;
      }
      while (v18 != v22);
      id v18 = [obj countByEnumeratingWithState:&v93 objects:v97 count:16];
    }
    while (v18);
  }

  return v4;
}

- (void)buildDailyDeviceStatusHeartbeatMetricsWithSiriEnabled:(BOOL)a3 onLockscreen:(BOOL)a4 dictationEnabled:(BOOL)a5 voiceTriggerEnabled:(BOOL)a6 starkHasBeenActiveWithin24Hours:(BOOL)a7 raiseToSpeakEnabled:(BOOL)a8 activeAppleAudioDevices:(id)a9 spokenNotificationsEnabled:(BOOL)a10 announceNotificationsEnabledOnHeadphones:(BOOL)a11 carplayAnnounceEnablementType:(int64_t)a12 isAnnounceNotificationsMutedForCarPlay:(BOOL)a13 shouldSkipTriggerlessReplyConfirmation:(BOOL)a14 spokenNotificationsProxCardSeen:(BOOL)a15 spokenNotificationsControlCenterModuleEnabled:(BOOL)a16 spokenNotificationsWhitelistSettings:(unint64_t)a17 announceCallsEnabled:(BOOL)a18 preciseLocationEnabled:(BOOL)a19 locationAccessPermission:(int)a20 adaptiveSiriVolumeEnabled:(BOOL)a21 adaptiveSiriVolumePermanentOffsetEnabled:(BOOL)a22 adaptiveSiriVolumePermanentOffsetFactor:(id)a23 adaptiveSiriVolumeMostRecentIntent:(id)a24 isRemoteDarwinVoiceTriggerEnabled:(BOOL)a25 autoSendSettings:(id)a26 siriInCallEnablementState:(int)a27 hangUpEnablementState:(int)a28 heartbeatQueuedTime:(unint64_t)a29 siriVoiceTriggerSettings:(id)a30 isShowAppsBehindSiriEnabledOnCarPlay:(BOOL)a31 isSiriCapableDigitalCarKeyAvailable:(BOOL)a32 connectedBTCarHeadunits:(id)a33 withCompletion:(id)a34
{
  BOOL v154 = a8;
  BOOL v34 = a7;
  BOOL v35 = a6;
  BOOL v146 = a5;
  BOOL v36 = a4;
  BOOL v162 = a3;
  id v37 = a9;
  id v141 = a23;
  id v140 = a24;
  id v142 = a26;
  id v143 = a30;
  id v144 = a33;
  id v137 = a34;
  v38 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[ADDailyDeviceStatusActivity buildDailyDeviceStatusHeartbeatMetricsWithSiriEnabled:onLockscree"
                         "n:dictationEnabled:voiceTriggerEnabled:starkHasBeenActiveWithin24Hours:raiseToSpeakEnabled:acti"
                         "veAppleAudioDevices:spokenNotificationsEnabled:announceNotificationsEnabledOnHeadphones:carplay"
                         "AnnounceEnablementType:isAnnounceNotificationsMutedForCarPlay:shouldSkipTriggerlessReplyConfirm"
                         "ation:spokenNotificationsProxCardSeen:spokenNotificationsControlCenterModuleEnabled:spokenNotif"
                         "icationsWhitelistSettings:announceCallsEnabled:preciseLocationEnabled:locationAccessPermission:"
                         "adaptiveSiriVolumeEnabled:adaptiveSiriVolumePermanentOffsetEnabled:adaptiveSiriVolumePermanentO"
                         "ffsetFactor:adaptiveSiriVolumeMostRecentIntent:isRemoteDarwinVoiceTriggerEnabled:autoSendSettin"
                         "gs:siriInCallEnablementState:hangUpEnablementState:heartbeatQueuedTime:siriVoiceTriggerSettings"
                         ":isShowAppsBehindSiriEnabledOnCarPlay:isSiriCapableDigitalCarKeyAvailable:connectedBTCarHeaduni"
                         "ts:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v39 = dispatch_group_create();
  id v40 = objc_alloc_init((Class)SISchemaDailyDeviceStatus);
  dispatch_group_enter(v39);
  v193[0] = _NSConcreteStackBlock;
  v193[1] = 3221225472;
  v193[2] = sub_10006B330;
  v193[3] = &unk_100506530;
  id v41 = v40;
  id v194 = v41;
  long long v42 = v39;
  v195 = v42;
  [(ADDailyDeviceStatusActivity *)self fetchEnrolledUsersWithCompletion:v193];
  dispatch_group_enter(v42);
  long long v43 = +[SiriTTSDaemonSession afSharedSession];
  v190[0] = _NSConcreteStackBlock;
  v190[1] = 3221225472;
  v190[2] = sub_10006B424;
  v190[3] = &unk_100506530;
  id v44 = v41;
  id v191 = v44;
  v45 = v42;
  v192 = v45;
  [v43 downloadedVoicesMatching:0 reply:v190];

  id v46 = objc_alloc_init((Class)SISchemaPersonalization);
  v47 = +[ADMultiUserService sharedService];
  __int16 v48 = [v47 primaryUser];
  objc_msgSend(v46, "setPersonalDomainsSetup:", objc_msgSend(v48, "personalDomainsIsEnabled"));

  v49 = +[ADPreferences sharedPreferences];
  v152 = [v49 outputVoice];

  id v157 = objc_alloc_init((Class)SISchemaVoiceSettings);
  [v157 setVoiceGender:0];
  if ([v152 gender] == (id)2)
  {
    uint64_t v50 = 1;
  }
  else if ([v152 gender] == (id)1)
  {
    uint64_t v50 = 2;
  }
  else
  {
    if ([v152 gender] != (id)3) {
      goto LABEL_10;
    }
    uint64_t v50 = 3;
  }
  [v157 setVoiceGender:v50];
LABEL_10:
  v51 = [v152 languageCode];
  objc_msgSend(v157, "setVoiceAccent:", +[SIUtilities convertLanguageCodeToSchemaLocale:](SIUtilities, "convertLanguageCodeToSchemaLocale:", v51));

  v52 = [v152 name];
  [v157 setVoiceName:v52];

  [v46 setVoiceSettings:v157];
  v53 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[ADDailyDeviceStatusActivity buildDailyDeviceStatusHeartbeatMetricsWithSiriEnabled:onLockscree"
                         "n:dictationEnabled:voiceTriggerEnabled:starkHasBeenActiveWithin24Hours:raiseToSpeakEnabled:acti"
                         "veAppleAudioDevices:spokenNotificationsEnabled:announceNotificationsEnabledOnHeadphones:carplay"
                         "AnnounceEnablementType:isAnnounceNotificationsMutedForCarPlay:shouldSkipTriggerlessReplyConfirm"
                         "ation:spokenNotificationsProxCardSeen:spokenNotificationsControlCenterModuleEnabled:spokenNotif"
                         "icationsWhitelistSettings:announceCallsEnabled:preciseLocationEnabled:locationAccessPermission:"
                         "adaptiveSiriVolumeEnabled:adaptiveSiriVolumePermanentOffsetEnabled:adaptiveSiriVolumePermanentO"
                         "ffsetFactor:adaptiveSiriVolumeMostRecentIntent:isRemoteDarwinVoiceTriggerEnabled:autoSendSettin"
                         "gs:siriInCallEnablementState:hangUpEnablementState:heartbeatQueuedTime:siriVoiceTriggerSettings"
                         ":isShowAppsBehindSiriEnabledOnCarPlay:isSiriCapableDigitalCarKeyAvailable:connectedBTCarHeaduni"
                         "ts:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "%s Fetching Apple Music subscription status for the active account", buf, 0xCu);
  }
  dispatch_group_enter(v45);
  v145 = [sub_10006844C() sharedStatusController];
  v186[0] = _NSConcreteStackBlock;
  v186[1] = 3221225472;
  v186[2] = sub_10006B5B8;
  v186[3] = &unk_1004FF880;
  id v136 = v46;
  id v187 = v136;
  id v160 = v44;
  id v188 = v160;
  dispatch_group_t group = v45;
  dispatch_group_t v189 = group;
  [v145 getSubscriptionStatusWithCompletionHandler:v186];
  id v165 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v37, "count"));
  long long v184 = 0u;
  long long v185 = 0u;
  long long v182 = 0u;
  long long v183 = 0u;
  id obj = v37;
  id v54 = [obj countByEnumeratingWithState:&v182 objects:v201 count:16];
  if (v54)
  {
    uint64_t v55 = *(void *)v183;
    do
    {
      for (i = 0; i != v54; i = (char *)i + 1)
      {
        if (*(void *)v183 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v57 = *(void *)(*((void *)&v182 + 1) + 8 * i);
        id v58 = objc_alloc_init((Class)SISchemaActiveAudioDevice);
        [v58 setProductIdentifier:v57];
        v59 = [&off_100523468 stringValue];
        [v58 setVendorIdentifier:v59];

        [v165 addObject:v58];
      }
      id v54 = [obj countByEnumeratingWithState:&v182 objects:v201 count:16];
    }
    while (v54);
  }

  id v153 = objc_alloc_init((Class)SISchemaActiveStatus);
  [v153 setCarPlayActiveWithin24Hours:v34];
  [v153 setAudioDevicesActiveWithin24Hours:v165];
  [v153 setCarBluetoothHeadUnitsActiveWithinLast24Hours:v144];
  id v156 = objc_alloc_init((Class)SISchemaAnnounceEnabledStatus);
  [v156 setAnnounceMessagesEnabled:a10];
  [v156 setAnnounceCallsEnabled:a18];
  id v158 = objc_alloc_init((Class)SISchemaAnnounceNotifications);
  [v158 setIsEnabled:a10];
  objc_msgSend(v158, "setProxCardSeen:");
  [v158 setReplyWithoutConfirmation:a14];
  [v158 setIsEnabledForHeadphones:a11];
  [v158 setIsCarPlayMuted:a13];
  if ((unint64_t)(a12 - 1) > 3) {
    uint64_t v60 = 0;
  }
  else {
    uint64_t v60 = dword_1003E2A70[a12 - 1];
  }
  [v158 setCarPlayStatus:v60];
  [v156 setAnnounceNotifications:v158];
  id v161 = objc_alloc_init((Class)SISchemaEnabledStatus);
  [v161 setAssistantEnabled:v162];
  [v161 setDictationEnabled:v146];
  [v161 setHardwareButtonEnabled:v162];
  [v161 setHeySiriEnabled:v35];
  [v161 setAssistantOnLockscreen:v36];
  [v161 setRaiseToSpeakEnabled:v154];
  v61 = +[AFPreferences sharedPreferences];
  objc_msgSend(v161, "setIsAlwaysShowSiriCaptionsEnabled:", objc_msgSend(v61, "siriResponseShouldAlwaysPrintWithoutOverride"));

  id v62 = +[AFPreferences sharedPreferences];
  objc_msgSend(v161, "setIsAlwaysShowSpeechEnabled:", objc_msgSend(v62, "alwaysShowRecognizedSpeech"));

  v63 = +[AFPreferences sharedPreferences];
  objc_msgSend(v161, "setIsShowAppsBehindSiriEnabled:", objc_msgSend(v63, "alwaysObscureBackgroundContentWhenActive") ^ 1);

  [v161 setSpokenNotificationsEnabled:a10];
  objc_msgSend(v161, "setHasHomekitHome:", objc_msgSend(obj, "count") != 0);
  objc_msgSend(v161, "setDataSharingOptInStatus:", -[ADDailyDeviceStatusActivity getSiriDataSharingOptInStatus](self, "getSiriDataSharingOptInStatus"));
  [v161 setTypeToSiriEnabled:AFPreferencesTypeToSiriEnabled()];
  [v161 setIsPreciseLocationEnabled:a19];
  [v161 setLocationAccessPermission:a20];
  [v161 setIsAdaptiveVolumeEnabled:a21];
  [v161 setAnnounceEnabledStatus:v156];
  [v161 setSiriVoiceTriggerSettings:v143];
  v64 = +[AFSiriDataSharingSensitivityManager shared];
  objc_msgSend(v161, "setIsMteUploadEnabled:", objc_msgSend(v64, "isOptedOutOfMTE") ^ 1);

  [v161 setIsServerUserDataSyncEnabled:-[ADAssistantProperties _getIsServerUserDataSyncEnabled]_0()];
  if (+[AFFeatureFlags isBlushingPhantomEnabled](AFFeatureFlags, "isBlushingPhantomEnabled"))[v161 setSiriInCallEnablementState:a27]; {
  else
  }
    [v161 setHsHangupEnablementState:a28];
  [v161 setSendWithoutConfirmation:v142];
  [v161 setIsRemoteDarwinHeySiriEnabled:a25];
  v65 = +[AFPreferences sharedPreferences];
  objc_msgSend(v161, "setIsAutoPunctuationEnabled:", objc_msgSend(v65, "dictationAutoPunctuationEnabled"));

  uint64_t v66 = +[AFPreferences sharedPreferences];
  v67 = [v66 siriSpeechRate];
  [v67 doubleValue];
  double v69 = v68;

  BOOL v70 = _AXSVoiceOverTouchEnabled() != 0;
  [v161 setSiriSpeechRate:v69];
  [v161 setIsVoiceOverEnabled:v70];
  id v155 = objc_alloc_init((Class)SISchemaAdaptiveVolumeUserPreferences);
  [v155 setIsPermanentOffsetEnabled:a22];
  [v141 floatValue];
  objc_msgSend(v155, "setPermanentOffsetFactor:");
  objc_msgSend(v155, "setMostRecentIntent:", -[ADDailyDeviceStatusActivity getAdaptiveVolumeUserIntent:](self, "getAdaptiveVolumeUserIntent:", objc_msgSend(v140, "intValue")));
  [v161 setAdaptiveVolumeUserPreferences:v155];
  v71 = +[AFPreferences sharedPreferences];
  v139 = [(ADDailyDeviceStatusActivity *)self _truncatedGradingOptInStateChanges:v71];

  [v161 setGradingOptInStateChanges:v139];
  v72 = +[AFPreferences sharedPreferences];
  unint64_t v73 = (unint64_t)[v72 useDeviceSpeakerForTTS];

  if (v73 > 3) {
    uint64_t v74 = 0;
  }
  else {
    uint64_t v74 = dword_1003E2A60[v73];
  }
  [v161 setVoiceFeedback:v74];
  [v161 setIsShowAppsBehindSiriEnabledOnCarPlay:a31];
  [v161 setIsSiriCapableDigitalCarKeyAvailable:a32];
  id v151 = objc_alloc_init((Class)SISchemaAggregatedMetrics);
  v149 = +[CSVoiceTriggerHeartBeatMetricsProvider fetchVoiceTriggerHeartBeatMetrics];
  if (v149)
  {
    v75 = [(ADDailyDeviceStatusActivity *)self _buildDailyVoiceTriggerMetrics:v149];
    [v151 setVoiceTrigger:v75];
  }
  v148 = [(ADDailyDeviceStatusActivity *)self _buildDailySelfTriggerSuppressionMetrics];
  if (v148) {
    [v151 setSelfTriggerSuppression:v148];
  }
  id v76 = +[ADCommandCenter sharedCommandCenter];
  v77 = [v76 _account];
  v150 = [v77 assistantIdentifier];

  v78 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    *(void *)&uint8_t buf[4] = "-[ADDailyDeviceStatusActivity buildDailyDeviceStatusHeartbeatMetricsWithSiriEnabled:onLockscree"
                         "n:dictationEnabled:voiceTriggerEnabled:starkHasBeenActiveWithin24Hours:raiseToSpeakEnabled:acti"
                         "veAppleAudioDevices:spokenNotificationsEnabled:announceNotificationsEnabledOnHeadphones:carplay"
                         "AnnounceEnablementType:isAnnounceNotificationsMutedForCarPlay:shouldSkipTriggerlessReplyConfirm"
                         "ation:spokenNotificationsProxCardSeen:spokenNotificationsControlCenterModuleEnabled:spokenNotif"
                         "icationsWhitelistSettings:announceCallsEnabled:preciseLocationEnabled:locationAccessPermission:"
                         "adaptiveSiriVolumeEnabled:adaptiveSiriVolumePermanentOffsetEnabled:adaptiveSiriVolumePermanentO"
                         "ffsetFactor:adaptiveSiriVolumeMostRecentIntent:isRemoteDarwinVoiceTriggerEnabled:autoSendSettin"
                         "gs:siriInCallEnablementState:hangUpEnablementState:heartbeatQueuedTime:siriVoiceTriggerSettings"
                         ":isShowAppsBehindSiriEnabledOnCarPlay:isSiriCapableDigitalCarKeyAvailable:connectedBTCarHeaduni"
                         "ts:withCompletion:]";
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v150;
    _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "%s assistantIdentifier: %{private}@", buf, 0x16u);
  }
  if ((v162 || v146) && !v150) {
    [(ADDailyDeviceStatusActivity *)self _triggerABCForNullAssistantIdentifier];
  }
  v79 = +[ADPreferences sharedPreferences];
  v147 = [v79 languageCode];

  if (v147) {
    objc_msgSend(v160, "setSiriInputLocale:", +[SIUtilities convertLanguageCodeToSchemaLocale:](SIUtilities, "convertLanguageCodeToSchemaLocale:", v147));
  }
  v80 = +[AFPreferences sharedPreferences];
  v81 = [v80 enabledDictationLocales];

  id v163 = objc_alloc_init((Class)NSMutableArray);
  long long v180 = 0u;
  long long v181 = 0u;
  long long v178 = 0u;
  long long v179 = 0u;
  unint64_t v82 = [v81 allKeys];
  id v83 = [v82 countByEnumeratingWithState:&v178 objects:v200 count:16];
  if (v83)
  {
    uint64_t v84 = *(void *)v179;
    do
    {
      for (j = 0; j != v83; j = (char *)j + 1)
      {
        if (*(void *)v179 != v84) {
          objc_enumerationMutation(v82);
        }
        v86 = *(void **)(*((void *)&v178 + 1) + 8 * (void)j);
        v87 = [v81 objectForKey:v86];
        unsigned int v88 = [v87 BOOLValue];

        if (v88)
        {
          id v89 = objc_alloc_init((Class)SISchemaLocaleIdentifier);
          v90 = [v86 componentsSeparatedByString:@"_"];
          if ([v90 count] == (id)2)
          {
            v91 = [v90 firstObject];
            [v89 setLanguageCode:v91];

            v92 = [v90 lastObject];
            [v89 setCountryCode:v92];
          }
          [v163 addObject:v89];
        }
      }
      id v83 = [v82 countByEnumeratingWithState:&v178 objects:v200 count:16];
    }
    while (v83);
  }

  [v160 setEnabledDictationLocales:v163];
  long long v93 = +[AFPreferences sharedPreferences];
  unsigned int v94 = [v93 longLivedIdentifierUploadingEnabled];

  if (v94)
  {
    [v160 setSiriDeviceID:v150];
    long long v95 = +[ADCommandCenter sharedCommandCenter];
    long long v96 = [v95 _account];
    v97 = [v96 speechIdentifier];
    [v160 setSiriSpeechID:v97];

    v98 = +[ADMultiUserService sharedService];
    v99 = [v98 primaryUser];
    v100 = [v99 sharedUserID];
    [v160 setSharedUserId:v100];
  }
  else
  {
    v101 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[ADDailyDeviceStatusActivity buildDailyDeviceStatusHeartbeatMetricsWithSiriEnabled:onLockscr"
                           "een:dictationEnabled:voiceTriggerEnabled:starkHasBeenActiveWithin24Hours:raiseToSpeakEnabled:"
                           "activeAppleAudioDevices:spokenNotificationsEnabled:announceNotificationsEnabledOnHeadphones:c"
                           "arplayAnnounceEnablementType:isAnnounceNotificationsMutedForCarPlay:shouldSkipTriggerlessRepl"
                           "yConfirmation:spokenNotificationsProxCardSeen:spokenNotificationsControlCenterModuleEnabled:s"
                           "pokenNotificationsWhitelistSettings:announceCallsEnabled:preciseLocationEnabled:locationAcces"
                           "sPermission:adaptiveSiriVolumeEnabled:adaptiveSiriVolumePermanentOffsetEnabled:adaptiveSiriVo"
                           "lumePermanentOffsetFactor:adaptiveSiriVolumeMostRecentIntent:isRemoteDarwinVoiceTriggerEnable"
                           "d:autoSendSettings:siriInCallEnablementState:hangUpEnablementState:heartbeatQueuedTime:siriVo"
                           "iceTriggerSettings:isShowAppsBehindSiriEnabledOnCarPlay:isSiriCapableDigitalCarKeyAvailable:c"
                           "onnectedBTCarHeadunits:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_INFO, "%s #RPI: not logging siri account info for SISchemaDailyDeviceStatus", buf, 0xCu);
    }
  }
  [v160 setClientDeviceSamplingTimestampMs:AFGetTimeSinceEpochInMilliseconds()];
  v102 = +[NSLocale currentLocale];
  v103 = [v102 objectForKey:NSLocaleIdentifier];
  [v160 setLocale:v103];

  v104 = AFProductTypeForInstrumentation();
  [v160 setDeviceType:v104];

  v105 = AFProductAndBuildVersion();
  [v160 setDeviceOs:v105];

  v106 = AFBuildVersion();
  [v160 setDeviceBuild:v106];

  v107 = AFModelForDailyStatus();
  [v160 setModelNumber:v107];

  v108 = AFRegionInfo();
  [v160 setRegionInfo:v108];

  [v160 setEnabledStatus:v161];
  [v160 setActiveStatus:v153];
  [v160 setSpokenNotificationsproxCardSeen:a15];
  [v160 setSpokenNotificationsControlCenterModuleEnabled:a16];
  [v160 setSpokenNotificationsWhitelistSettings:a17];
  [v160 setAggregatedMetrics:v151];
  [v160 setQueuedAtTimestampHourInMs:a29];
  dispatch_group_enter(group);
  v109 = +[ADAssistantDataManager sharedDataManager];
  v175[0] = _NSConcreteStackBlock;
  v175[1] = 3221225472;
  v175[2] = sub_10006B77C;
  v175[3] = &unk_100500D30;
  id v110 = v160;
  id v176 = v110;
  v111 = group;
  v177 = v111;
  [v109 getiTunesStoreFrontIdentifierWithCompletion:v175];

  v112 = [(ADDailyDeviceStatusActivity *)self getVolumeCapacity];
  v113 = v112;
  if (v112)
  {
    v114 = [v112 objectForKeyedSubscript:NSURLVolumeTotalCapacityKey];
    [v114 doubleValue];
    double v116 = v115;

    v117 = [v113 objectForKeyedSubscript:NSURLVolumeAvailableCapacityForImportantUsageKey];
    [v117 doubleValue];
    double v119 = v118;

    v120 = +[NSString stringWithFormat:@"%.02f", v119 / 1000000000.0];
    [v120 doubleValue];
    double v122 = v121;

    LODWORD(v123) = vcvtpd_u64_f64(v116 / 1000000000.0);
    [v110 setDeviceCapacityInGB:v123];
    [v110 setAvailableDeviceStorageInMB:v122 * 1000.0];
  }
  id v124 = objc_alloc((Class)AFSafetyBlock);
  v172[0] = _NSConcreteStackBlock;
  v172[1] = 3221225472;
  v172[2] = sub_10006B85C;
  v172[3] = &unk_100509B78;
  id v125 = v137;
  id v174 = v125;
  id v126 = v110;
  id v173 = v126;
  id v127 = [v124 initWithBlock:v172];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v197 = sub_100068BA0;
  v198 = sub_100068BB0;
  id v199 = 0;
  id v128 = objc_alloc((Class)AFWatchdogTimer);
  queue = self->_queue;
  v170[0] = _NSConcreteStackBlock;
  v170[1] = 3221225472;
  v170[2] = sub_10006B870;
  v170[3] = &unk_10050E138;
  id v130 = v127;
  id v171 = v130;
  id v131 = [v128 initWithTimeoutInterval:queue onQueue:v170 timeoutHandler:5.0];
  v132 = *(void **)(*(void *)&buf[8] + 40);
  *(void *)(*(void *)&buf[8] + 40) = v131;

  [*(id *)(*(void *)&buf[8] + 40) start];
  v133 = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006B938;
  block[3] = &unk_10050C700;
  id v168 = v130;
  v169 = buf;
  id v167 = v126;
  id v134 = v130;
  id v135 = v126;
  dispatch_group_notify(v111, v133, block);

  _Block_object_dispose(buf, 8);
}

- (void)runWithCompletion:(id)a3
{
  id v3 = (void (**)(void))a3;
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[ADDailyDeviceStatusActivity runWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  double v5 = +[AFPreferences sharedPreferences];
  id v6 = [v5 assistantIsEnabled];

  id v7 = +[AFPreferences sharedPreferences];
  unsigned int v83 = [v7 dictationIsEnabled];

  uint64_t v8 = 2;
  if (!v6) {
    uint64_t v8 = 0;
  }
  if (v83) {
    uint64_t v9 = v8 | 4;
  }
  else {
    uint64_t v9 = v8;
  }
  +[AFAggregator logEnabledState:v9];
  if ((v6 | v83) != 1 || (AFHasUnlockedSinceBoot() & 1) == 0)
  {
    id v22 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[ADDailyDeviceStatusActivity runWithCompletion:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%s Skipping Heartbeat due to (both Siri & Dictation disabled) OR (device was locked)", buf, 0xCu);
      if (!v3) {
        goto LABEL_42;
      }
    }
    else if (!v3)
    {
      goto LABEL_42;
    }
    v3[2](v3);
    goto LABEL_42;
  }
  if (AFDeviceSupportsCarPlay())
  {
    long long v10 = +[NSCalendar currentCalendar];
    long long v11 = +[NSDate date];
    id v12 = [v10 dateByAddingUnit:32 value:-24 toDate:v11 options:0];

    [v12 timeIntervalSinceReferenceDate];
    double v14 = v13;
    double v15 = [off_100582470() carPlayStream];
    double v16 = [v15 publisherFromStartTime:v14];
    uint64_t v87 = 0;
    unsigned int v88 = &v87;
    uint64_t v89 = 0x2020000000;
    LOBYTE(v90) = 0;
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1001FCA9C;
    unsigned int v94 = &unk_100506A98;
    long long v95 = &v87;
    id v17 = [v16 sinkWithCompletion:&stru_100506A70 receiveInput:buf];
    id v18 = AFSiriLogContextUtility;
    if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      int v19 = *((unsigned __int8 *)v88 + 24);
      *(_DWORD *)v91 = 136315394;
      *(void *)&v91[4] = "ADCarPlayHasBeenActiveInLast24Hours";
      *(_WORD *)&v91[12] = 1024;
      *(_DWORD *)&v91[14] = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s carPlayHasBeenActiveInLast24Hours: %d", v91, 0x12u);
    }
    BOOL v75 = *((unsigned char *)v88 + 24) != 0;
    _Block_object_dispose(&v87, 8);

    if (v6) {
      goto LABEL_14;
    }
LABEL_19:
    unsigned int v74 = 0;
    goto LABEL_20;
  }
  BOOL v75 = 0;
  if (!v6) {
    goto LABEL_19;
  }
LABEL_14:
  unint64_t v20 = +[AFPreferences sharedPreferences];
  unsigned int v21 = [v20 disableAssistantWhilePasscodeLocked];

  unsigned int v74 = v21 ^ 1;
LABEL_20:
  uint64_t v23 = +[VTPreferences sharedPreferences];
  unsigned int v73 = [v23 voiceTriggerEnabled];

  v80 = AFAppleAudioDeviceConnectedInLast24Hours();
  v79 = AFBTCarHeadunitsConnectedInLast24Hours();
  if (AFIsHorseman())
  {
    BOOL v71 = 0;
    BOOL v72 = 0;
  }
  else
  {
    uint64_t v87 = 0;
    unsigned int v88 = &v87;
    uint64_t v89 = 0x2050000000;
    id v24 = (void *)qword_100585758;
    uint64_t v90 = qword_100585758;
    if (!qword_100585758)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10006C4F0;
      unsigned int v94 = &unk_10050E318;
      long long v95 = &v87;
      sub_10006C4F0((uint64_t)buf);
      id v24 = (void *)v88[3];
    }
    id v25 = v24;
    _Block_object_dispose(&v87, 8);
    unint64_t v26 = [v25 currentNotificationSettingsCenter];
    id v27 = [v26 notificationSystemSettings];
    id v28 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ADDailyDeviceStatusActivity runWithCompletion:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v27;
      _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
    }
    BOOL v72 = [v27 announcementSetting] == (id)2;
    BOOL v71 = [v27 announcementHeadphonesSetting] == (id)2;
  }
  uint64_t v70 = _AFPreferencesAnnounceNotificationsInCarPlayType();
  char v69 = _AFPreferencesAnnounceNotificationsInCarPlayTemporarilyDisabled();
  char v68 = _AFPreferencesSpokenNotificationSkipTriggerlessReplyConfirmation();
  char v67 = _AFPreferencesSpokenNotificationsProxCardSeen();
  *(void *)v91 = 0;
  *(void *)&v91[8] = v91;
  *(void *)&v91[16] = 0x2020000000;
  char v92 = 0;
  v29 = dispatch_group_create();
  dispatch_group_enter(v29);
  uint64_t v87 = 0;
  unsigned int v88 = &v87;
  uint64_t v89 = 0x2050000000;
  id v30 = (void *)qword_100585768;
  uint64_t v90 = qword_100585768;
  if (!qword_100585768)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_10006C5F0;
    unsigned int v94 = &unk_10050E318;
    long long v95 = &v87;
    sub_10006C5F0((uint64_t)buf);
    id v30 = (void *)v88[3];
  }
  id v31 = v30;
  _Block_object_dispose(&v87, 8);
  v32 = [v31 sharedInstance];
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_10006C6F0;
  v84[3] = &unk_1004FF7F8;
  v86 = v91;
  dispatch_group_t group = v29;
  dispatch_group_t v85 = group;
  [v32 getEnabledStateOfModuleWithIdentifier:@"com.apple.siri.SpokenNotificationsModule" completionHandler:v84];

  dispatch_time_t v33 = dispatch_time(0, 1000000000);
  dispatch_group_wait(group, v33);
  CFPreferencesAppSynchronize(@"com.apple.MobileSMS");
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"kSpokenMessageWhitelistLevel", @"com.apple.MobileSMS", 0);
  id v35 = objc_alloc_init((Class)TUUserConfiguration);
  id v76 = [v35 announceCalls];
  id v62 = v35;
  BOOL v36 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADDailyDeviceStatusActivity runWithCompletion:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v76 != 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%s Announce calls enabled: %d", buf, 0x12u);
  }
  unsigned __int8 v66 = [(ADDailyDeviceStatusActivity *)self _preciseLocationEnabled];
  CFIndex v65 = AppIntegerValue;
  unsigned int v64 = [(ADDailyDeviceStatusActivity *)self _locationAccessPermission];
  id v37 = +[CSPreferences sharedPreferences];
  unsigned __int8 v63 = [v37 smartSiriVolumeContextAwareEnabled];

  v38 = +[CSPreferences sharedPreferences];
  unsigned __int8 v61 = [v38 isAdaptiveSiriVolumePermanentOffsetEnabled];

  id v39 = +[CSPreferences sharedPreferences];
  [v39 adaptiveSiriVolumePermanentOffset];
  v78 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  id v40 = +[CSPreferences sharedPreferences];
  v77 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v40 adaptiveSiriVolumeRecentIntent]);

  id v41 = objc_alloc_init((Class)SISchemaSendWithoutConfirmation);
  [v41 setIsEnabled:_AFPreferencesGetMessageWithoutConfirmationEnabled()];
  [v41 setIsEnabledForHeadphones:_AFPreferencesGetMessageWithoutConfirmationHeadphonesEnabled()];
  [v41 setIsEnabledForCarPlay:_AFPreferencesGetMessageWithoutConfirmationInCarPlayEnabled()];
  long long v42 = +[VTPreferences sharedPreferences];
  unsigned __int8 v60 = [v42 voiceTriggerEnabledWithDeviceType:3 endpointId:0];

  uint64_t v59 = AFGetTimeSinceEpochRoundedToHourInMilliseconds();
  long long v43 = [(ADDailyDeviceStatusActivity *)self fetchVoiceTriggerSettings];
  char ShowAppsBehindSiriInCarPlayEnabled = _AFPreferencesGetShowAppsBehindSiriInCarPlayEnabled();
  unsigned __int8 v45 = [(ADDailyDeviceStatusActivity *)self _isSiriCapableDigitalCarKeyAvailable];
  int v46 = *(unsigned __int8 *)(*(void *)&v91[8] + 24);
  if (AFDeviceSupportsFullSiriUOD()
    && (+[AFPreferences sharedPreferences],
        v47 = objc_claimAutoreleasedReturnValue(),
        unint64_t v48 = (unint64_t)[v47 siriInCallEnablementState],
        v47,
        v48 <= 2))
  {
    unsigned int v49 = dword_1003E2AEC[v48];
  }
  else
  {
    unsigned int v49 = 0;
  }
  if (AFSupportsCallHangUp()
    && (+[VTPreferences sharedPreferences],
        uint64_t v50 = objc_claimAutoreleasedReturnValue(),
        unint64_t v51 = (unint64_t)[v50 canUseVoiceTriggerDuringPhoneCallWithState],
        v50,
        v51 <= 2))
  {
    unsigned int v52 = dword_1003E2AEC[v51];
  }
  else
  {
    unsigned int v52 = 0;
  }
  BYTE1(v58) = v45;
  LOBYTE(v58) = ShowAppsBehindSiriInCarPlayEnabled;
  LOBYTE(v57) = v60;
  BYTE1(v56) = v61;
  LOBYTE(v56) = v63;
  HIDWORD(v55) = v64;
  BYTE1(v55) = v66;
  LOBYTE(v55) = v76 != 0;
  BYTE3(v54) = v46 != 0;
  BYTE2(v54) = v67;
  BYTE1(v54) = v68;
  LOBYTE(v54) = v69;
  BYTE1(v53) = v71;
  LOBYTE(v53) = v72;
  -[ADDailyDeviceStatusActivity buildDailyDeviceStatusHeartbeatMetricsWithSiriEnabled:onLockscreen:dictationEnabled:voiceTriggerEnabled:starkHasBeenActiveWithin24Hours:raiseToSpeakEnabled:activeAppleAudioDevices:spokenNotificationsEnabled:announceNotificationsEnabledOnHeadphones:carplayAnnounceEnablementType:isAnnounceNotificationsMutedForCarPlay:shouldSkipTriggerlessReplyConfirmation:spokenNotificationsProxCardSeen:spokenNotificationsControlCenterModuleEnabled:spokenNotificationsWhitelistSettings:announceCallsEnabled:preciseLocationEnabled:locationAccessPermission:adaptiveSiriVolumeEnabled:adaptiveSiriVolumePermanentOffsetEnabled:adaptiveSiriVolumePermanentOffsetFactor:adaptiveSiriVolumeMostRecentIntent:isRemoteDarwinVoiceTriggerEnabled:autoSendSettings:siriInCallEnablementState:hangUpEnablementState:heartbeatQueuedTime:siriVoiceTriggerSettings:isShowAppsBehindSiriEnabledOnCarPlay:isSiriCapableDigitalCarKeyAvailable:connectedBTCarHeadunits:withCompletion:](self, "buildDailyDeviceStatusHeartbeatMetricsWithSiriEnabled:onLockscreen:dictationEnabled:voiceTriggerEnabled:starkHasBeenActiveWithin24Hours:raiseToSpeakEnabled:activeAppleAudioDevices:spokenNotificationsEnabled:announceNotificationsEnabledOnHeadphones:carplayAnnounceEnablementType:isAnnounceNotificationsMutedForCarPlay:shouldSkipTriggerlessReplyConfirmation:spokenNotificationsProxCardSeen:spokenNotificationsControlCenterModuleEnabled:spokenNotificationsWhitelistSettings:announceCallsEnabled:preciseLocationEnabled:locationAccessPermission:adaptiveSiriVolumeEnabled:adaptiveSiriVolumePermanentOffsetEnabled:adaptiveSiriVolumePermanentOffsetFactor:adaptiveSiriVolumeMostRecentIntent:isRemoteDarwinVoiceTriggerEnabled:autoSendSettings:siriInCallEnablementState:hangUpEnablementState:heartbeatQueuedTime:siriVoiceTriggerSettings:isShowAppsBehindSiriEnabledOnCarPlay:isSiriCapableDigitalCarKeyAvailable:connectedBTCarHeadunits:withCompletion:", v6, v74, v83, v73, v75, 0, v80, v53, v70, v54,
    v65,
    v55,
    v56,
    v78,
    v77,
    v57,
    v41,
    __PAIR64__(v52, v49),
    v59,
    v43,
    v58,
    v79,
    &stru_1004FF838);
  if (v3) {
    v3[2](v3);
  }

  _Block_object_dispose(v91, 8);
LABEL_42:
}

- (ADDailyDeviceStatusActivity)init
{
  v8.receiver = self;
  v8.super_class = (Class)ADDailyDeviceStatusActivity;
  id v2 = [(ADDailyDeviceStatusActivity *)&v8 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v5 = dispatch_queue_create("ADDailyDeviceStatusActivity", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (id)taskFromActivity:(id)a3
{
  id v3 = objc_alloc_init(ADDailyDeviceStatusActivity);
  return v3;
}

+ (id)xpcCriteria
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  return v2;
}

+ (const)activityIdentifier
{
  return "com.apple.siri.xpc_activity.heartbeat";
}

@end