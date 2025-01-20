@interface ADExternalNotificationInstrumentationEmitter
+ (BOOL)isFirstPartyApplicationWithBundleId:(id)a3;
+ (id)_createEmptyANCClientEventWithMetadataForRequest:(id)a3;
+ (id)_createRequestLinkInfoFromUUID:(id)a3 component:(int)a4;
+ (id)_getAnnounceReceivedEventFromAnnouncementRequest:(id)a3 nowPlayingMediaType:(id)a4 shouldLog:(BOOL)a5;
+ (id)_getAnnounceReceivedTier1EventFromAnnouncementRequest:(id)a3;
+ (id)_getCurrentlyConnectedHeadphonesANCAudioDevice;
+ (id)_randomlySampleWithoutReplacementNumSamples:(unint64_t)a3 fromArray:(id)a4;
+ (void)_emitAnnounceEnablementEventFromSectionInfo:(id)a3 siriLocale:(id)a4;
+ (void)emitAnnouncementReceivedForAnnouncementRequest:(id)a3 nowPlayingMediaType:(id)a4;
+ (void)emitCoreAnalyticsAnnounceNotificationApplicationEnablementEvents;
+ (void)emitCoreAnalyticsEventForAnnouncementRequest:(id)a3 completionReason:(int64_t)a4;
+ (void)emitRequestLinkForAnnouncementRequest:(id)a3;
+ (void)emitUserResponseSilenceForAnnouncementRequest:(id)a3;
@end

@implementation ADExternalNotificationInstrumentationEmitter

+ (void)emitCoreAnalyticsAnnounceNotificationApplicationEnablementEvents
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.siri.ADExternalNotificationInstrumentationEmitter", v3);

  id v5 = [objc_alloc((Class)off_100582468()) initWithQueue:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 effectiveGlobalAnnounceSetting];
    id v8 = [v6 effectiveGlobalAnnounceHeadphonesSetting];
    if (v7 == (id)2 && v8 == (id)2)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1001F89E0;
      v10[3] = &unk_100506950;
      v10[4] = a1;
      [v6 getSectionInfoForActiveSectionsWithCompletion:v10];
    }
  }
}

+ (id)_randomlySampleWithoutReplacementNumSamples:(unint64_t)a3 fromArray:(id)a4
{
  id v5 = a4;
  id v6 = [v5 count];
  if ((unint64_t)v6 <= a3)
  {
    id v8 = [objc_alloc((Class)NSSet) initWithArray:v5];
  }
  else
  {
    uint32_t v7 = v6;
    id v8 = objc_alloc_init((Class)NSMutableSet);
    while (a3)
    {
      v9 = [v5 objectAtIndex:arc4random_uniform(v7)];
      if (([v8 containsObject:v9] & 1) == 0)
      {
        [v8 addObject:v9];
        --a3;
      }
    }
  }

  return v8;
}

+ (void)_emitAnnounceEnablementEventFromSectionInfo:(id)a3 siriLocale:(id)a4
{
  v10[0] = @"announce_notifications_enabled";
  id v5 = a4;
  id v6 = a3;
  uint32_t v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 announceSetting]);
  v11[0] = v7;
  v10[1] = @"app_bundle_id";
  id v8 = [v6 sectionID];

  v10[2] = @"device_locale";
  v11[1] = v8;
  v11[2] = v5;
  v9 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  AnalyticsSendEvent();
}

+ (void)emitCoreAnalyticsEventForAnnouncementRequest:(id)a3 completionReason:(int64_t)a4
{
  id v6 = a3;
  if ([v6 platform] == (id)2) {
    goto LABEL_24;
  }
  uint32_t v7 = [a1 _getAnnounceReceivedEventFromAnnouncementRequest:v6 nowPlayingMediaType:0 shouldLog:0];
  v32 = [v7 connectedAudioDevice];
  uint64_t v8 = [v32 productIdentifier];
  v9 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = &stru_10050F7D8;
  }
  v31 = v10;

  id v11 = [v7 announcementCategory];
  if ([v6 requestType] == (id)1)
  {
    uint64_t v12 = [v6 appID];
    v13 = (void *)v12;
    if (v12) {
      v14 = (__CFString *)v12;
    }
    else {
      v14 = &stru_10050F7D8;
    }
    v15 = v14;
LABEL_16:

    goto LABEL_17;
  }
  if ([v6 requestType] == (id)2)
  {
    v13 = [v6 call];
    v16 = [v13 callProviderBundleID];
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      v18 = [v13 callProviderIdentifier];
    }
    v15 = v18;

    goto LABEL_16;
  }
  v15 = &stru_10050F7D8;
LABEL_17:
  id v19 = [v7 isTimeSensitiveAnnouncement];
  v20 = +[ADPreferences sharedPreferences];
  uint64_t v21 = [v20 languageCode];
  v22 = (void *)v21;
  if (v21) {
    v23 = (__CFString *)v21;
  }
  else {
    v23 = &stru_10050F7D8;
  }
  v24 = v23;

  v34[0] = v31;
  v33[0] = @"airpodsModel";
  v33[1] = @"announceCategory";
  v25 = +[NSNumber numberWithInt:v11];
  v34[1] = v25;
  v33[2] = @"announceStatus";
  uint64_t v26 = +[NSNumber numberWithInteger:a4];
  v27 = (void *)v26;
  if (v15) {
    CFStringRef v28 = v15;
  }
  else {
    CFStringRef v28 = &stru_10050F7D8;
  }
  v34[2] = v26;
  v34[3] = v28;
  v33[3] = @"appBundleId";
  v33[4] = @"isTimeSensitiveAnnouncement";
  v29 = +[NSNumber numberWithBool:v19];
  v33[5] = @"locale";
  v34[4] = v29;
  v34[5] = v24;
  v30 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:6];

  AnalyticsSendEvent();
LABEL_24:
}

+ (void)emitUserResponseSilenceForAnnouncementRequest:(id)a3
{
  id v5 = [a1 _createEmptyANCClientEventWithMetadataForRequest:a3];
  id v3 = objc_alloc_init((Class)ANCSchemaANCUserResponseEvaluated);
  [v3 setUserResponseCategory:3];
  [v5 setUserResponseEvaluated:v3];
  dispatch_queue_t v4 = +[AssistantSiriAnalytics sharedStream];
  [v4 emitMessage:v5];
}

+ (void)emitAnnouncementReceivedForAnnouncementRequest:(id)a3 nowPlayingMediaType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)SISchemaUUID);
  v9 = objc_opt_new();
  id v16 = [v8 initWithNSUUID:v9];

  v10 = [a1 _createEmptyANCClientEventWithMetadataForRequest:v7];
  id v11 = [a1 _getAnnounceReceivedEventFromAnnouncementRequest:v7 nowPlayingMediaType:v6 shouldLog:1];

  [v11 setLinkId:v16];
  [v10 setNotificationReceived:v11];
  uint64_t v12 = +[AssistantSiriAnalytics sharedStream];
  [v12 emitMessage:v10];

  v13 = [a1 _createEmptyANCClientEventWithMetadataForRequest:v7];
  v14 = [a1 _getAnnounceReceivedTier1EventFromAnnouncementRequest:v7];

  [v14 setLinkId:v16];
  [v13 setNotificationReceivedTier1:v14];
  v15 = +[AssistantSiriAnalytics sharedStream];
  [v15 emitMessage:v13];
}

+ (id)_createEmptyANCClientEventWithMetadataForRequest:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)ANCSchemaANCClientEvent);
  id v5 = objc_alloc_init((Class)ANCSchemaANCClientEventMetadata);
  id v6 = objc_alloc((Class)SISchemaUUID);
  id v7 = [v3 announcementIdentifier];

  id v8 = [v6 initWithNSUUID:v7];
  [v5 setAncId:v8];
  [v4 setEventMetadata:v5];

  return v4;
}

+ (id)_getAnnounceReceivedTier1EventFromAnnouncementRequest:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)ANCSchemaANCNotificationReceivedTier1);
  if ([v3 requestType] == (id)1)
  {
    id v5 = v3;
    id v6 = [v5 appID];
    if ([v5 platform] == (id)2)
    {
      if (sub_1001FD788()) {
        [v4 setAppBundleId:v6];
      }
      else {
        [v4 setIsRedactedDueToOptOut:1];
      }
    }
  }
  return v4;
}

+ (id)_getAnnounceReceivedEventFromAnnouncementRequest:(id)a3 nowPlayingMediaType:(id)a4 shouldLog:(BOOL)a5
{
  BOOL v48 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init((Class)ANCSchemaANCNotificationReceived);
  id v10 = objc_alloc_init((Class)ANCSchemaANCBackgroundContent);
  id v11 = objc_alloc_init((Class)ANCSchemaANCAppNotificationMetadata);
  if ([v7 requestType] == (id)1)
  {
    id v45 = v10;
    id v42 = v8;
    id v12 = v7;
    v13 = [v12 notification];
    v14 = [v13 request];
    v15 = [v14 content];
    BOOL v16 = [v15 interruptionLevel] == (id)2;

    v17 = [v12 appID];
    v47 = v11;
    if ([a1 isFirstPartyApplicationWithBundleId:v17])
    {
      id v18 = a1;
      unsigned int v43 = [v12 announcementType] == (id)1;
      unsigned int v44 = 1;
    }
    else
    {
      unsigned int v44 = sub_1001FD7D8((uint64_t)v17);
      v23 = +[AFSiriAnnouncementRequestCapabilityManager supportedAnnouncementTypesForBundleId:onPlatform:](AFSiriAnnouncementRequestCapabilityManager, "supportedAnnouncementTypesForBundleId:onPlatform:", v17, [v12 platform]);
      v24 = v23;
      if (v23) {
        unsigned int v43 = [v23 containsObject:&off_100523888];
      }
      else {
        unsigned int v43 = 0;
      }
      id v18 = a1;
    }
    uint64_t v26 = [v12 notification];
    v27 = [v26 request];
    CFStringRef v28 = [v27 content];
    v29 = [v28 contentType];

    if ([v29 isEqualToString:_UNNotificationContentTypeMessagingDirect])
    {
      uint64_t v30 = 2;
    }
    else if ([v29 isEqualToString:_UNNotificationContentTypeMessagingGroup])
    {
      uint64_t v30 = 3;
    }
    else
    {
      uint64_t v30 = 1;
    }
    [v47 setIsAskWithSiriEnabled:v44];
    [v47 setIsSmsEligible:v43];
    [v47 setCommsNotificationType:v30];
    a1 = v18;
    if (v48)
    {
      v31 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v50 = "+[ADExternalNotificationInstrumentationEmitter _getAnnounceReceivedEventFromAnnouncementRequest:nowPlaying"
              "MediaType:shouldLog:]";
        __int16 v51 = 1024;
        *(_DWORD *)v52 = v44;
        *(_WORD *)&v52[4] = 1024;
        *(_DWORD *)&v52[6] = v43;
        LOWORD(v53[0]) = 1024;
        *(_DWORD *)((char *)v53 + 2) = v30;
        _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "%s isAskWithSiriEnabled %d, isSMSEligible: %d, commsNotificationType: %d", buf, 0x1Eu);
      }
    }
    v32 = (char *)[v12 announcementType];
    if ((unint64_t)(v32 - 1) > 7) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = dword_1003E2BE0[(void)(v32 - 1)];
    }
    id v10 = v45;
    id v11 = v47;

    id v8 = v42;
  }
  else if ([v7 requestType] == (id)2)
  {
    id v19 = [v7 call];
    v20 = [v19 callProviderBundleID];
    uint64_t v21 = v20;
    if (v20)
    {
      id v22 = v20;
    }
    else
    {
      id v22 = [v19 callProviderIdentifier];
    }
    v17 = v22;

    BOOL v16 = 0;
    uint64_t v25 = 3;
  }
  else
  {
    v17 = 0;
    BOOL v16 = 0;
    uint64_t v25 = 0;
  }
  [v9 setAnnouncementCategory:v25];
  [v9 setIsTimeSensitiveAnnouncement:v16];
  if (v17)
  {
    if ([a1 isFirstPartyApplicationWithBundleId:v17]) {
      uint64_t v33 = 1;
    }
    else {
      uint64_t v33 = 2;
    }
  }
  else
  {
    uint64_t v33 = 0;
  }
  [v9 setAppCategory:v33];
  switch((unint64_t)[v7 platform])
  {
    case 1uLL:
      v34 = [(id)objc_opt_class() _getCurrentlyConnectedHeadphonesANCAudioDevice];
      uint64_t v35 = 1;
      break;
    case 2uLL:
      v34 = 0;
      uint64_t v35 = 2;
      break;
    case 3uLL:
      v34 = 0;
      uint64_t v35 = 3;
      break;
    case 4uLL:
      v34 = 0;
      uint64_t v35 = 4;
      break;
    default:
      uint64_t v35 = 0;
      v34 = 0;
      break;
  }
  if ([v8 isEqualToString:kMRMediaRemoteMediaTypeMusic])
  {
    uint64_t v36 = 2;
  }
  else if ([v8 isEqualToString:kMRMediaRemoteMediaTypePodcast])
  {
    uint64_t v36 = 3;
  }
  else if ([v8 isEqualToString:kMRMediaRemoteMediaTypeAudioBook])
  {
    uint64_t v36 = 4;
  }
  else
  {
    uint64_t v36 = 6;
    if (([v8 isEqualToString:kMRMediaRemoteMediaTypeITunesU] & 1) == 0)
    {
      if ([v8 isEqualToString:&stru_10050F7D8]) {
        uint64_t v36 = 6;
      }
      else {
        uint64_t v36 = 0;
      }
    }
  }
  [v10 setMediaType:v36];
  if (v48)
  {
    v37 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      v40 = v37;
      [v7 platform];
      AFSiriAnnouncementPlatformGetName();
      v41 = id v46 = v10;
      *(_DWORD *)buf = 136315650;
      v50 = "+[ADExternalNotificationInstrumentationEmitter _getAnnounceReceivedEventFromAnnouncementRequest:nowPlayingMe"
            "diaType:shouldLog:]";
      __int16 v51 = 2112;
      *(void *)v52 = v41;
      *(_WORD *)&v52[8] = 1024;
      v53[0] = v36;
      _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "%s Announce Platform: %@, Currently Playing Media Type: %d", buf, 0x1Cu);

      id v10 = v46;
    }
  }
  [v9 setTargetPlatform:v35];
  [v9 setConnectedAudioDevice:v34];
  [v9 setBackgroundContent:v10];
  [v9 setNotificationMetadata:v11];
  v38 = -[ADRequestDispatcherServiceHelper headGestureConfiguration]_0();
  objc_msgSend(v9, "setBobbleSupported:", objc_msgSend(v38, "isSupported"));
  objc_msgSend(v9, "setBobbleEnabled:", objc_msgSend(v38, "isEnabled"));

  return v9;
}

+ (id)_getCurrentlyConnectedHeadphonesANCAudioDevice
{
  v2 = +[AFHeadphonesAnnouncementRequestCapabilityProvider provider];
  id v3 = [v2 currentlyRoutedHeadphonesProductID];
  id v4 = objc_alloc_init((Class)ANCSchemaANCAudioDevice);
  if ([v3 length])
  {
    id v5 = [v3 componentsSeparatedByString:@","];
    if ([v5 count] == (id)2)
    {
      id v6 = [v5 objectAtIndex:0];
      [v4 setVendorIdentifier:v6];

      id v7 = [v5 objectAtIndex:1];
      [v4 setProductIdentifier:v7];

      id v8 = v4;
      goto LABEL_8;
    }
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      id v12 = "+[ADExternalNotificationInstrumentationEmitter _getCurrentlyConnectedHeadphonesANCAudioDevice]";
      __int16 v13 = 2112;
      v14 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Invalid bt product code for headphones: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  id v8 = 0;
LABEL_8:

  return v8;
}

+ (void)emitRequestLinkForAnnouncementRequest:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  id v5 = [v3 announcementIdentifier];
  id v13 = [v4 _createRequestLinkInfoFromUUID:v5 component:12];

  id v6 = [v3 requestInfo];

  id v7 = [v6 startLocalRequest];
  id v8 = [v7 aceId];

  id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:v8];
  id v10 = [(id)objc_opt_class() _createRequestLinkInfoFromUUID:v9 component:1];
  id v11 = objc_alloc_init((Class)SISchemaRequestLink);
  [v11 setSource:v13];
  [v11 setTarget:v10];
  id v12 = +[AssistantSiriAnalytics sharedStream];
  [v12 emitMessage:v11];
}

+ (id)_createRequestLinkInfoFromUUID:(id)a3 component:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v5];

  id v7 = objc_alloc_init((Class)SISchemaRequestLinkInfo);
  [v7 setUuid:v6];
  [v7 setComponent:v4];

  return v7;
}

+ (BOOL)isFirstPartyApplicationWithBundleId:(id)a3
{
  return [a3 hasPrefix:@"com.apple"];
}

@end