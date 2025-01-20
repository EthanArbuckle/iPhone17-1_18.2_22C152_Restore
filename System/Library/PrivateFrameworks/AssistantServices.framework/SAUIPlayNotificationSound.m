@interface SAUIPlayNotificationSound
- (BOOL)_adui_shouldBeHandledByAssistantd;
- (id)_soundURLForAnnouncePlatform:(int64_t)a3;
- (int64_t)_soundIDForAnnouncePlatform:(int64_t)a3;
- (void)_adui_handleWithCompletion:(id)a3;
@end

@implementation SAUIPlayNotificationSound

- (void)_adui_handleWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[SAUIPlayNotificationSound(ADUIService) _adui_handleWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v6 = objc_alloc((Class)AFTwoArgumentSafetyBlock);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100273A6C;
  v45[3] = &unk_100509690;
  v45[4] = self;
  id v7 = v4;
  id v46 = v7;
  id v8 = [v6 initWithBlock:v45 defaultValue1:0 defaultValue2:0];
  v9 = +[ADCommandCenter sharedCommandCenter];
  v10 = +[ADExternalNotificationRequestHandler sharedNotificationRequestHandler];
  id v11 = [v10 announcePlatformForCurrentRequest];

  v12 = [(SAUIPlayNotificationSound *)self _soundURLForAnnouncePlatform:v11];
  v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v48 = "-[SAUIPlayNotificationSound(ADUIService) _adui_handleWithCompletion:]";
    __int16 v49 = 2112;
    v50 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Chose sound URL: %@", buf, 0x16u);
  }
  if (v12)
  {
    id v14 = objc_alloc((Class)AFAudioPlaybackRequest);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100273B78;
    v42[3] = &unk_100508670;
    id v43 = v12;
    v44 = self;
    id v15 = [v14 initWithBuilder:v42];
    id v16 = objc_alloc((Class)AFSpeechRequestOptions);
    if (v11 == (id)2) {
      uint64_t v17 = 32;
    }
    else {
      uint64_t v17 = 21;
    }
    id v18 = objc_msgSend(v16, "initWithActivationEvent:", v17, v7);
    [v18 setAnnouncementPlatform:v11];
    v19 = [(SAUIPlayNotificationSound *)self notificationType];
    unsigned int v20 = [v19 isEqualToString:SANotificationTypeConnectedCallValue];

    if (v20)
    {
      v21 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "-[SAUIPlayNotificationSound(ADUIService) _adui_handleWithCompletion:]";
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s Related reply to announce incoming request", buf, 0xCu);
      }
      v22 = +[AFAnalytics sharedAnalytics];
      [v22 logEventWithType:6011 context:0];

      v23 = [(SAUIPlayNotificationSound *)self notificationId];

      if (!v23)
      {
        id v31 = objc_alloc_init((Class)SACommandSucceeded);
        [v8 invokeWithValue:v31 andValue:0];
LABEL_21:

        id v30 = v43;
        id v7 = v32;
        goto LABEL_22;
      }
      [v18 setIsOnPhoneCall:1];
    }
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100273C20;
    v35[3] = &unk_100508738;
    id v24 = v9;
    id v36 = v24;
    id v37 = v18;
    char v41 = v20;
    id v38 = v15;
    id v40 = v11;
    id v39 = v8;
    v25 = objc_retainBlock(v35);
    v26 = v25;
    if (v20)
    {
      dispatch_time_t v27 = dispatch_time(0, 750000000);
      v28 = [v24 _queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100273D64;
      block[3] = &unk_10050D0D0;
      id v34 = v26;
      dispatch_after(v27, v28, block);
    }
    else
    {
      ((void (*)(void *))v25[2])(v25);
    }

    id v31 = v36;
    goto LABEL_21;
  }
  v29 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[SAUIPlayNotificationSound(ADUIService) _adui_handleWithCompletion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s Error resolving sound URL for SAUIPlayNotificationSound", buf, 0xCu);
  }
  id v30 = objc_alloc_init((Class)SACommandFailed);
  [v8 invokeWithValue:v30 andValue:0];
LABEL_22:
}

- (id)_soundURLForAnnouncePlatform:(int64_t)a3
{
  v5 = [(SAUIPlayNotificationSound *)self notificationType];
  unsigned int v6 = [v5 isEqualToString:SANotificationTypeConnectedCallValue];

  if (v6)
  {
    id v7 = [objc_alloc((Class)NSURL) initFileURLWithPath:@"/System/Library/Audio/UISounds/nano/vc~invitation-accepted.caf" isDirectory:0];
  }
  else
  {
    int64_t v8 = [(SAUIPlayNotificationSound *)self _soundIDForAnnouncePlatform:a3];
    if (v8)
    {
      int64_t v9 = v8;
      v10 = +[AFBundleResourceManager sharedManager];
      id v7 = [v10 URLForSoundID:v9];
    }
    else
    {
      id v11 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        v13 = v11;
        id v14 = [(SAUIPlayNotificationSound *)self notificationType];
        int v15 = 136315394;
        id v16 = "-[SAUIPlayNotificationSound(ADUIService) _soundURLForAnnouncePlatform:]";
        __int16 v17 = 2112;
        id v18 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Unsupported notificationType: %@", (uint8_t *)&v15, 0x16u);
      }
      id v7 = 0;
    }
  }
  return v7;
}

- (int64_t)_soundIDForAnnouncePlatform:(int64_t)a3
{
  v5 = [(SAUIPlayNotificationSound *)self notificationType];

  if (!v5) {
    return 0;
  }
  unsigned int v6 = [(SAUIPlayNotificationSound *)self notificationType];
  unsigned int v7 = [v6 isEqualToString:SANotificationTypeIncomingMessageValue];

  if (v7)
  {
    if (a3 == 2) {
      return 7;
    }
    else {
      return 4;
    }
  }
  else
  {
    int64_t v9 = [(SAUIPlayNotificationSound *)self notificationType];
    unsigned int v10 = [v9 isEqualToString:SANotificationTypeIncomingHomeCommunicationValue];

    if (v10) {
      return 6;
    }
    else {
      return 0;
    }
  }
}

- (BOOL)_adui_shouldBeHandledByAssistantd
{
  return 1;
}

@end