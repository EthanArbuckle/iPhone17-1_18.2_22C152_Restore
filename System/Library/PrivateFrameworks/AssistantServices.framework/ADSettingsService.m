@interface ADSettingsService
- (ADSettingsService)initWithRecordingInfoProvider:(id)a3 instanceContext:(id)a4;
- (CSSiriRecordingInfoProviding)recordingInfoProvider;
- (id)_wrapBoolSettingValue:(BOOL)a3;
- (void)_getNoiseManagement:(id)a3 completion:(id)a4;
- (void)_getPlaybackAudioRoute:(id)a3 completion:(id)a4;
- (void)_getVoiceOver:(id)a3 completion:(id)a4;
- (void)_getVoiceTriggerEnabled:(id)a3 completion:(id)a4;
- (void)_registerCommandHandlersWithRegistry:(id)a3;
- (void)_setBoolSetting:(id)a3 currentValueBlock:(id)a4 setValueBlock:(id)a5 completion:(id)a6;
- (void)_setNoiseManagement:(id)a3 completion:(id)a4;
- (void)_setVoiceOver:(id)a3 completion:(id)a4;
- (void)_setVoiceTriggerEnabled:(id)a3 completion:(id)a4;
@end

@implementation ADSettingsService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingInfoProvider, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
}

- (CSSiriRecordingInfoProviding)recordingInfoProvider
{
  return self->_recordingInfoProvider;
}

- (void)_setBoolSetting:(id)a3 currentValueBlock:(id)a4 setValueBlock:(id)a5 completion:(id)a6
{
  id v9 = a3;
  v10 = (void (**)(id, id))a5;
  v11 = (void (**)(id, id, void))a6;
  uint64_t v12 = (*((uint64_t (**)(id))a4 + 2))(a4);
  if ([v9 toggle]) {
    id v13 = (id)(v12 ^ 1);
  }
  else {
    id v13 = [v9 value];
  }
  if (v12 == v13)
  {
    id v14 = objc_alloc((Class)SACommandFailed);
    v15 = &SASettingValueUnchangedErrorCode;
    goto LABEL_9;
  }
  if ((v13 & 1) == 0 && [v9 failOnSiriDisconnectWarnings])
  {
    id v14 = objc_alloc((Class)SACommandFailed);
    v15 = &SASettingSiriDisconnectErrorCode;
LABEL_9:
    id v16 = [v14 initWithErrorCode:*v15];
    goto LABEL_13;
  }
  if (([v9 dryRun] & 1) == 0) {
    v10[2](v10, v13);
  }
  id v16 = objc_alloc_init((Class)SASettingSetBoolResponse);
  id v17 = objc_alloc_init((Class)SASettingBooleanEntity);
  v18 = +[NSNumber numberWithBool:v12];
  [v17 setPreviousValue:v18];

  [v17 setValue:v13];
  [v16 setSetting:v17];

LABEL_13:
  v19 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v20 = v19;
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    unsigned int v23 = [v9 dryRun];
    CFStringRef v24 = @"Set";
    int v27 = 136316418;
    v28 = "-[ADSettingsService _setBoolSetting:currentValueBlock:setValueBlock:completion:]";
    if (v23) {
      CFStringRef v24 = @"Dry Run";
    }
    __int16 v29 = 2112;
    CFStringRef v32 = v24;
    CFStringRef v25 = @"ON";
    v30 = v22;
    __int16 v31 = 2112;
    if (v12) {
      CFStringRef v26 = @"ON";
    }
    else {
      CFStringRef v26 = @"OFF";
    }
    __int16 v33 = 2112;
    CFStringRef v34 = v26;
    if (!v13) {
      CFStringRef v25 = @"OFF";
    }
    __int16 v35 = 2112;
    CFStringRef v36 = v25;
    __int16 v37 = 2112;
    id v38 = v16;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s %@ (%@ / prev: %@ / value: %@ / %@)", (uint8_t *)&v27, 0x3Eu);
  }
  if (v11) {
    v11[2](v11, v16, 0);
  }
}

- (id)_wrapBoolSettingValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init((Class)SASettingGetBoolResponse);
  id v5 = objc_alloc_init((Class)SASettingBooleanEntity);
  [v5 setValue:v3];
  [v4 setSetting:v5];

  return v4;
}

- (void)_setNoiseManagement:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, id, void *))a4;
  if (!v6) {
    goto LABEL_39;
  }
  if (AFIsHorseman())
  {
    id v7 = objc_alloc((Class)SACommandFailed);
    id v8 = [v7 initWithErrorCode:SASettingConnectedHeadsetNoiseManagementSiriControlUnsupportedErrorCode];
    id v9 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kAFAssistantErrorDomain, [v8 errorCode], 0);
    v6[2](v6, v8, v9);

    goto LABEL_39;
  }
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x3032000000;
  v75 = sub_100138124;
  v76 = sub_100138134;
  id v77 = objc_alloc_init((Class)AFQueue);
  v10 = dispatch_group_create();
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  uint64_t v71 = 0;
  v11 = [v5 noiseManagementOption];
  if ([v11 isEqualToString:SASettingNoiseManagementOptionNOISE_CANCELLATIONValue])
  {
    uint64_t v12 = 3;
LABEL_12:
    v69[3] = v12;
    goto LABEL_13;
  }
  if ([v11 isEqualToString:SASettingNoiseManagementOptionAUDIO_TRANSPARENCYValue])
  {
    uint64_t v12 = 4;
    goto LABEL_12;
  }
  if ([v11 isEqualToString:SASettingNoiseManagementOptionAUTOMATICValue])
  {
    uint64_t v12 = 5;
    goto LABEL_12;
  }
  if ([v11 isEqualToString:SASettingNoiseManagementOptionOFFValue])
  {
    uint64_t v12 = 2;
    goto LABEL_12;
  }
LABEL_13:
  dispatch_group_enter(v10);
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_10013813C;
  v64[3] = &unk_100503528;
  v66 = &v68;
  v67 = &v72;
  id v13 = v10;
  v65 = v13;
  +[ADCoreBluetoothManager retrieveConnectedDevicesInfoWithCompletion:v64];
  dispatch_time_t v14 = dispatch_time(0, 4000000000);
  dispatch_group_wait(v13, v14);
  if ([(id)v73[5] count])
  {
    id v15 = [(id)v73[5] dequeueObject];
    uint64_t v60 = 0;
    v61 = &v60;
    uint64_t v62 = 0x2020000000;
    char v63 = 1;
    dispatch_group_enter(v13);
    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x2020000000;
    uint64_t v59 = 0;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10013889C;
    v52[3] = &unk_100503500;
    v54 = &v56;
    v55 = &v60;
    id v16 = v13;
    v53 = v16;
    [v15 getHeadphoneListeningMode:v52];
    dispatch_time_t v17 = dispatch_time(0, 4000000000);
    dispatch_group_wait(v16, v17);
    if (*((unsigned char *)v61 + 24))
    {
      v18 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[ADSettingsService _setNoiseManagement:completion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Bluetooth device time outed while checking current listening mode", (uint8_t *)&buf, 0xCu);
      }
      v19 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:SASettingNoHeadsetConnectedErrorCode userInfo:0];
      id v20 = objc_msgSend(objc_alloc((Class)SACommandFailed), "initWithErrorCode:", objc_msgSend(v19, "code"));
      v6[2](v6, v20, v19);
    }
    else
    {
      unint64_t v21 = v57[3];
      if (v21 > 1)
      {
        id v20 = SASettingNoiseManagementOptionOFFValue;
        if (v21 - 3 <= 2)
        {
          id v26 = *(id *)*(&off_1005035C0 + v21 - 3);

          id v20 = v26;
        }
        uint64_t v48 = 0;
        v49 = &v48;
        uint64_t v50 = 0x2020000000;
        char v51 = 1;
        dispatch_group_enter(v16);
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v85 = 0x3032000000;
        v86 = sub_100138124;
        v87 = sub_100138134;
        id v88 = 0;
        uint64_t v27 = v69[3];
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_1001388BC;
        v44[3] = &unk_100503550;
        p_long long buf = &buf;
        v47 = &v48;
        v28 = v16;
        v45 = v28;
        [v15 setHeadphoneListeningMode:v27 completion:v44];
        dispatch_time_t v29 = dispatch_time(0, 4000000000);
        dispatch_group_wait(v28, v29);
        id v41 = [(id)v73[5] count];
        while (!*(void *)(*((void *)&buf + 1) + 40))
        {
          if (![(id)v73[5] count]) {
            break;
          }
          dispatch_group_enter(v28);
          v30 = [(id)v73[5] dequeueObject];
          id v31 = v15;
          CFStringRef v32 = v11;
          id v33 = v20;
          uint64_t v34 = v69[3];
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          v42[2] = sub_1001389E4;
          v42[3] = &unk_10050C610;
          v43 = v28;
          uint64_t v35 = v34;
          id v20 = v33;
          v11 = v32;
          id v15 = v31;
          [v30 setHeadphoneListeningMode:v35 completion:v42];
        }
        dispatch_time_t v36 = dispatch_time(0, 1000000000 * (void)v41);
        dispatch_group_wait(v28, v36);
        if (*((unsigned char *)v49 + 24))
        {
          v19 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:SASettingNoHeadsetConnectedErrorCode userInfo:0];
          id v37 = objc_msgSend(objc_alloc((Class)SACommandFailed), "initWithErrorCode:", objc_msgSend(v19, "code"));
          v6[2](v6, v37, v19);
        }
        else
        {
          if (*(void *)(*((void *)&buf + 1) + 40))
          {
            id v38 = objc_alloc((Class)SACommandFailed);
            id v37 = objc_msgSend(v38, "initWithErrorCode:", objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "code"));
            v6[2](v6, v37, *(void **)(*((void *)&buf + 1) + 40));
          }
          else
          {
            v39 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v78 = 136315650;
              v79 = "-[ADSettingsService _setNoiseManagement:completion:]";
              __int16 v80 = 2112;
              id v81 = v20;
              __int16 v82 = 2112;
              v83 = v11;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%s Done setting bluetooth device noise management from %@ to %@", v78, 0x20u);
            }
            id v37 = objc_alloc_init((Class)SASettingNoiseManagementEntity);
            [v37 setPreviousValue:v20];
            [v37 setValue:v11];
            id v40 = objc_alloc_init((Class)SASettingSetValueResponse);
            [v40 setSetting:v37];
            v6[2](v6, v40, 0);
          }
          v19 = 0;
        }

        _Block_object_dispose(&buf, 8);
        _Block_object_dispose(&v48, 8);
      }
      else
      {
        v22 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "-[ADSettingsService _setNoiseManagement:completion:]";
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s Unable to determine bluetooth device's current listening mode", (uint8_t *)&buf, 0xCu);
        }
        id v23 = objc_alloc((Class)SACommandFailed);
        id v20 = [v23 initWithErrorCode:SASettingConnectedHeadsetNoiseManagementUnsupportedErrorCode];
        id v24 = [v20 errorCode];
        CFStringRef v25 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:v24 userInfo:0];
        v6[2](v6, v20, v25);

        v19 = 0;
      }
    }

    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(&v60, 8);
  }
  else
  {
    v19 = sub_100138340(0, v69[3]);
    id v15 = objc_msgSend(objc_alloc((Class)SACommandFailed), "initWithErrorCode:", objc_msgSend(v19, "code"));
    v6[2](v6, v15, v19);
  }

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);

LABEL_39:
}

- (void)_getNoiseManagement:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, id, NSObject *))a4;
  if (v6)
  {
    uint64_t v40 = 0;
    id v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = sub_100138124;
    v44 = sub_100138134;
    id v45 = 0;
    if (AFIsHorseman())
    {
      id v7 = objc_alloc((Class)SACommandFailed);
      id v8 = [v7 initWithErrorCode:SASettingConnectedHeadsetNoiseManagementSiriControlUnsupportedErrorCode];
      id v9 = [v8 errorCode];
      v10 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:v9 userInfo:0];
      v6[2](v6, v8, v10);
    }
    else
    {
      v11 = dispatch_group_create();
      dispatch_group_enter(v11);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100139358;
      v37[3] = &unk_100503C70;
      v39 = &v40;
      v10 = v11;
      id v38 = v10;
      +[ADCoreBluetoothManager retrieveConnectedDevicesInfoWithCompletion:v37];
      dispatch_time_t v12 = dispatch_time(0, 4000000000);
      dispatch_group_wait(v10, v12);
      if (v41[5])
      {
        uint64_t v33 = 0;
        uint64_t v34 = &v33;
        uint64_t v35 = 0x2020000000;
        char v36 = 1;
        dispatch_group_enter(v10);
        uint64_t v29 = 0;
        v30 = &v29;
        uint64_t v31 = 0x2020000000;
        uint64_t v32 = 0;
        id v13 = (void *)v41[5];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_100139554;
        v25[3] = &unk_100503500;
        uint64_t v27 = &v29;
        v28 = &v33;
        dispatch_time_t v14 = v10;
        id v26 = v14;
        [v13 getHeadphoneListeningMode:v25];
        dispatch_time_t v15 = dispatch_time(0, 4000000000);
        dispatch_group_wait(v14, v15);
        if (*((unsigned char *)v34 + 24))
        {
          id v16 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315138;
            v47 = "-[ADSettingsService _getNoiseManagement:completion:]";
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Bluetooth device time outed while checking current listening mode", buf, 0xCu);
          }
          id v8 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:SASettingNoHeadsetConnectedErrorCode userInfo:0];
          id v17 = objc_msgSend(objc_alloc((Class)SACommandFailed), "initWithErrorCode:", -[NSObject code](v8, "code"));
          v6[2](v6, v17, v8);
        }
        else
        {
          id v17 = SASettingNoiseManagementOptionOFFValue;
          v19 = (id *)&SASettingNoiseManagementOptionAUDIO_TRANSPARENCYValue;
          switch(v30[3])
          {
            case 0:
            case 1:
              id v20 = AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 136315138;
                v47 = "-[ADSettingsService _getNoiseManagement:completion:]";
                _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s Bluetooth device does not support Siri noise management", buf, 0xCu);
              }
              id v8 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:SASettingConnectedHeadsetNoiseManagementSiriControlUnsupportedErrorCode userInfo:0];
              if (!v8) {
                break;
              }
              id v21 = objc_msgSend(objc_alloc((Class)SACommandFailed), "initWithErrorCode:", -[NSObject code](v8, "code"));
              v6[2](v6, v21, v8);
              goto LABEL_21;
            case 3:
              v19 = (id *)&SASettingNoiseManagementOptionNOISE_CANCELLATIONValue;
              goto LABEL_17;
            case 4:
              goto LABEL_17;
            case 5:
              v19 = (id *)&SASettingNoiseManagementOptionAUTOMATICValue;
LABEL_17:
              id v22 = *v19;

              id v17 = v22;
              break;
            default:
              break;
          }
          id v23 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 136315394;
            v47 = "-[ADSettingsService _getNoiseManagement:completion:]";
            __int16 v48 = 2112;
            id v49 = v17;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s Done getting bluetooth device noise management: %@", buf, 0x16u);
          }
          id v21 = objc_alloc_init((Class)SASettingNoiseManagementEntity);
          [v21 setValue:v17];
          id v24 = objc_alloc_init((Class)SASettingGetNoiseManagementResponse);
          [v24 setSetting:v21];
          v6[2](v6, v24, 0);

          id v8 = 0;
LABEL_21:
        }
        _Block_object_dispose(&v29, 8);
        _Block_object_dispose(&v33, 8);
      }
      else
      {
        id v8 = sub_100138340(0, 0);
        id v18 = objc_msgSend(objc_alloc((Class)SACommandFailed), "initWithErrorCode:", -[NSObject code](v8, "code"));
        v6[2](v6, v18, v8);
      }
    }

    _Block_object_dispose(&v40, 8);
  }
}

- (void)_getPlaybackAudioRoute:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = [a3 audioCategory];
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v13 = "-[ADSettingsService _getPlaybackAudioRoute:completion:]";
    __int16 v14 = 2112;
    dispatch_time_t v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s audioCategory = %@", buf, 0x16u);
  }
  if (v5)
  {
    id v8 = +[ADAVSystemControllerLifecycleManager sharedManager];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001396E4;
    v9[3] = &unk_1005034D8;
    id v10 = v6;
    id v11 = v5;
    [v8 getAVSystemControllerWithTimeout:v9 completion:2.0];
  }
}

- (void)_setVoiceOver:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[ADSettingsService _setVoiceOver:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  [(ADSettingsService *)self _setBoolSetting:v6 currentValueBlock:&stru_100503490 setValueBlock:&stru_1005034B0 completion:v7];
}

- (void)_getVoiceOver:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    id v11 = "-[ADSettingsService _getVoiceOver:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }
  if (v7)
  {
    int v9 = [(ADSettingsService *)self _wrapBoolSettingValue:_AXSVoiceOverTouchEnabled() != 0];
    v7[2](v7, v9, 0);
  }
}

- (void)_getVoiceTriggerEnabled:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    id v11 = "-[ADSettingsService _getVoiceTriggerEnabled:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }
  if (v7)
  {
    int v9 = [(ADSettingsService *)self _wrapBoolSettingValue:sub_1001FD6CC()];
    v7[2](v7, v9, 0);
  }
}

- (void)_setVoiceTriggerEnabled:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v14 = "-[ADSettingsService _setVoiceTriggerEnabled:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100139EFC;
  v12[3] = &unk_100503450;
  v12[4] = self;
  int v9 = objc_retainBlock(v12);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100139F00;
  v11[3] = &unk_10050B918;
  v11[4] = self;
  int v10 = objc_retainBlock(v11);
  [(ADSettingsService *)self _setBoolSetting:v6 currentValueBlock:v9 setValueBlock:v10 completion:v7];
}

- (void)_registerCommandHandlersWithRegistry:(id)a3
{
  id v6 = a3;
  int v4 = AFIsHorseman();
  uint64_t v5 = SASettingGroupIdentifier;
  if (v4)
  {
    [(ADBaseService *)self _registerCommandClass:SASettingSetVoiceTriggerEnabledStateClassIdentifier forDomain:SASettingGroupIdentifier withSelector:"_setVoiceTriggerEnabled:completion:" forRegistry:v6];
    [(ADBaseService *)self _registerCommandClass:SASettingGetVoiceTriggerEnabledStateClassIdentifier forDomain:v5 withSelector:"_getVoiceTriggerEnabled:completion:" forRegistry:v6];
    [(ADBaseService *)self _registerCommandClass:SASettingGetVoiceOverClassIdentifier forDomain:v5 withSelector:"_getVoiceOver:completion:" forRegistry:v6];
    [(ADBaseService *)self _registerCommandClass:SASettingSetVoiceOverClassIdentifier forDomain:v5 withSelector:"_setVoiceOver:completion:" forRegistry:v6];
  }
  [(ADBaseService *)self _registerCommandClass:SASettingGetPlaybackAudioRouteClassIdentifier forDomain:v5 withSelector:"_getPlaybackAudioRoute:completion:" forRegistry:v6];
  [(ADBaseService *)self _registerCommandClass:SASettingGetNoiseManagementClassIdentifier forDomain:v5 withSelector:"_getNoiseManagement:completion:" forRegistry:v6];
  [(ADBaseService *)self _registerCommandClass:SASettingSetNoiseManagementClassIdentifier forDomain:v5 withSelector:"_setNoiseManagement:completion:" forRegistry:v6];
}

- (ADSettingsService)initWithRecordingInfoProvider:(id)a3 instanceContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ADSettingsService;
  int v9 = [(ADBaseService *)&v13 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordingInfoProvider, a3);
    id v11 = v8;
    if (!v8)
    {
      id v11 = +[AFInstanceContext defaultContext];
    }
    objc_storeStrong((id *)&v10->_instanceContext, v11);
    if (!v8) {
  }
    }
  return v10;
}

@end