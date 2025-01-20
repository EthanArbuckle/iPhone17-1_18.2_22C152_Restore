@interface ADUIService
+ (id)serviceIdentifierForRequestDelegate:(id)a3;
- (ADUIService)initWithRequestDelegate:(id)a3;
- (BOOL)_shouldWakeSystemForHandlingCommand:(id)a3 executionContext:(id)a4;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (id)commandsForDomain:(id)a3;
- (id)controlCenterLockRestrictedCommands;
- (id)domains;
- (id)handle;
- (void)cancelOperationsForRequestID:(id)a3 forAssistantID:(id)a4 fromRemote:(BOOL)a5 reason:(int64_t)a6;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)setDelegate:(id)a3;
@end

@implementation ADUIService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lastHandledContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestDelegate, 0);
}

- (void)setDelegate:(id)a3
{
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v10;
  if (!objc_msgSend(v14, "_adui_shouldBeHandledByAssistantd"))
  {
    [(ADCommandCenterRequestDelegate *)self->_requestDelegate adRequestWillReceiveCommand:v14];
    if (objc_msgSend(v14, "_adui_shouldNotifyOthersOfArrival")) {
      objc_msgSend(v14, "_adui_notifyOthersOfArrival");
    }
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100272698;
    v51[3] = &unk_10050D3F0;
    id v55 = v13;
    v51[4] = self;
    id v15 = v14;
    id v52 = v15;
    id v53 = v12;
    id v54 = v11;
    v16 = objc_retainBlock(v51);
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (!WeakRetained)
    {
      ((void (*)(void *))v16[2])(v16);
LABEL_26:

      goto LABEL_27;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_25:
        id v36 = objc_loadWeakRetained((id *)p_delegate);
        [v36 UIService:self executeHandler:v16 forCommand:v15];

        goto LABEL_26;
      }
      v45 = &self->_delegate;
      v46 = v16;
      id v21 = v15;
      v22 = +[ADCommandCenter sharedCommandCenter];
      v23 = [v22 _responseModeProvider];
      v24 = [v23 fetchCurrentMode];
      [v21 setResponseMode:v24];

      v25 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        v26 = v25;
        v27 = [v22 _responseModeProvider];
        v28 = [v27 fetchCurrentMode];
        *(_DWORD *)buf = 136315394;
        v58 = "-[ADUIService handleCommand:forDomain:executionContext:reply:]";
        __int16 v59 = 2112;
        v60 = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s #modes Bridging addDialogs with Response Mode %@", buf, 0x16u);
      }
LABEL_24:

      p_delegate = v45;
      v16 = v46;
      goto LABEL_25;
    }
    v45 = &self->_delegate;
    v46 = v16;
    id v19 = v15;
    v20 = [v19 patternId];
    if (!v20)
    {
      v29 = [v19 responseMode];

      if (v29)
      {
LABEL_14:
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        v22 = [v19 views];
        id v30 = [v22 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v30)
        {
          id v31 = v30;
          id v42 = v15;
          id v43 = v11;
          uint64_t v32 = *(void *)v48;
          do
          {
            for (i = 0; i != v31; i = (char *)i + 1)
            {
              if (*(void *)v48 != v32) {
                objc_enumerationMutation(v22);
              }
              uint64_t v34 = *(void *)(*((void *)&v47 + 1) + 8 * i);
              if (+[ADUserNotificationAnnouncementSpeakingStatePublisher supportsPublishingArrivalForAceObject:v34])
              {
                v35 = +[ADUserNotificationAnnouncementSpeakingStatePublisher sharedPublisher];
                [v35 publishObjectHasArrived:v34];
              }
            }
            id v31 = [v22 countByEnumeratingWithState:&v47 objects:v56 count:16];
          }
          while (v31);
          id v11 = v43;
          id v15 = v42;
        }
        goto LABEL_24;
      }
      v20 = +[ADCommandCenter sharedCommandCenter];
      v37 = [v20 _responseModeProvider];
      v38 = [v37 fetchCurrentMode];
      [v19 setResponseMode:v38];

      v39 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        v40 = v39;
        v44 = [v20 _responseModeProvider];
        v41 = [v44 fetchCurrentMode];
        *(_DWORD *)buf = 136315394;
        v58 = "-[ADUIService handleCommand:forDomain:executionContext:reply:]";
        __int16 v59 = 2112;
        v60 = v41;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%s #modes Bridging addViews with Response Mode %@", buf, 0x16u);
      }
    }

    goto LABEL_14;
  }
  objc_msgSend(v14, "_adui_handleWithCompletion:", v13);
LABEL_27:
}

- (BOOL)_shouldWakeSystemForHandlingCommand:(id)a3 executionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ADUIService *)self _isWakeSystemSupportedOnPlatform]
    && [v7 isFromRemote])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)cancelOperationsForRequestID:(id)a3 forAssistantID:(id)a4 fromRemote:(BOOL)a5 reason:(int64_t)a6
{
  id v8 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100272C4C;
  block[3] = &unk_10050CA08;
  BOOL v14 = a5;
  id v12 = v8;
  id v13 = self;
  id v10 = v8;
  dispatch_async(queue, block);
}

- (id)controlCenterLockRestrictedCommands
{
  return 0;
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  return 1;
}

- (id)commandsForDomain:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:SAGroupIdentifier])
  {
    uint64_t v22 = SAPreSynthesizeTTSClassIdentifier;
    v4 = &v22;
LABEL_26:
    uint64_t v5 = 1;
    goto LABEL_27;
  }
  if ([v3 isEqualToString:SAPhoneGroupIdentifier])
  {
    if ((AFIsHorseman() & 1) == 0)
    {
      uint64_t v21 = SAPhonePlayVoiceMailClassIdentifier;
      v4 = &v21;
      goto LABEL_26;
    }
    v20[0] = SAPhonePlayVoiceMailClassIdentifier;
    v20[1] = SAPhoneClientCoordinationPhoneCallClassIdentifier;
    v4 = v20;
    goto LABEL_6;
  }
  uint64_t v6 = SAGLGroupIdentifier;
  if ([v3 isEqualToString:SAGLGroupIdentifier])
  {
    uint64_t v19 = v6;
    v4 = &v19;
    goto LABEL_26;
  }
  if ([v3 isEqualToString:SAGuidanceGroupIdentifier])
  {
    uint64_t v18 = SAGuidanceGuideUpdateClassIdentifier;
    v4 = &v18;
    goto LABEL_26;
  }
  if ([v3 isEqualToString:SASettingGroupIdentifier])
  {
    if (!AFIsNano())
    {
      uint64_t v16 = SASettingSetUIGuidedAccessClassIdentifier;
      v4 = &v16;
      goto LABEL_26;
    }
    v17[0] = SASettingSetUIGuidedAccessClassIdentifier;
    v17[1] = SASettingGetFlashlightClassIdentifier;
    v17[2] = SASettingSetFlashlightClassIdentifier;
    v4 = v17;
    uint64_t v5 = 3;
LABEL_27:
    v9 = +[NSArray arrayWithObjects:v4 count:v5];
    goto LABEL_28;
  }
  if ([v3 isEqualToString:SASmsGroupIdentifier])
  {
    uint64_t v15 = SASmsPlayAudioClassIdentifier;
    v4 = &v15;
    goto LABEL_26;
  }
  if ([v3 isEqualToString:SAVCSGroupIdentifier])
  {
    uint64_t v14 = SAVCSAddResultsToContentShelfClassIdentifier;
    v4 = &v14;
    goto LABEL_26;
  }
  uint64_t v7 = SACardGroupIdentifier;
  if ([v3 isEqualToString:SACardGroupIdentifier])
  {
    uint64_t v13 = v7;
    v4 = &v13;
    goto LABEL_26;
  }
  if ([v3 isEqualToString:SADeviceControlGroupIdentifier])
  {
    v12[0] = SADeviceControlStartScreenRecordingClassIdentifier;
    v12[1] = SADeviceControlStopScreenRecordingClassIdentifier;
    v4 = v12;
LABEL_6:
    uint64_t v5 = 2;
    goto LABEL_27;
  }
  uint64_t v8 = SAUIGroupIdentifier;
  if ([v3 isEqualToString:SAUIGroupIdentifier])
  {
    uint64_t v11 = v8;
    v4 = &v11;
    goto LABEL_26;
  }
  v9 = 0;
LABEL_28:

  return v9;
}

- (id)domains
{
  v4[0] = SAUIGroupIdentifier;
  v4[1] = SAGLGroupIdentifier;
  v4[2] = SAPhoneGroupIdentifier;
  v4[3] = SASettingGroupIdentifier;
  v4[4] = SASmsGroupIdentifier;
  v4[5] = SAGuidanceGroupIdentifier;
  v4[6] = SAVCSGroupIdentifier;
  v4[7] = SACardGroupIdentifier;
  v4[8] = SAGroupIdentifier;
  v4[9] = SADeviceControlGroupIdentifier;
  v2 = +[NSArray arrayWithObjects:v4 count:10];
  return v2;
}

- (id)handle
{
  return self->_requestDelegate;
}

- (ADUIService)initWithRequestDelegate:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ADUIService;
  uint64_t v6 = [(ADUIService *)&v13 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requestDelegate, a3);
    uint64_t v8 = [(id)objc_opt_class() serviceIdentifierForRequestDelegate:v5];
    [(ADService *)v7 setIdentifier:v8];

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("ADUIServiceQueue", v9);

    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;
  }
  return v7;
}

+ (id)serviceIdentifierForRequestDelegate:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"com.apple.siri.uiservice.%p", v3);

  return v4;
}

@end