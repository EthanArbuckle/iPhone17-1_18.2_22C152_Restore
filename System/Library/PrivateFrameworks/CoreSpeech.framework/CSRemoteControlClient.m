@interface CSRemoteControlClient
- (BOOL)createRemoteVoiceProfileWithAudioFiles:(id)a3 aesKey:(id)a4 encryptedAudioSampleBypeDepth:(unint64_t)a5 languageCode:(id)a6 completion:(id)a7;
- (BOOL)isConnected;
- (BOOL)isConnectedDeviceDarwin;
- (BOOL)isConnectedDeviceGibraltar;
- (BOOL)transferInterstitialAudioFiles:(id)a3 interstitialLevel:(int64_t)a4 completion:(id)a5;
- (BOOL)transferVoiceTriggerSpeakerModel:(id)a3 forAsset:(id)a4;
- (BOOL)waitingForConnection:(double)a3 error:(id *)a4;
- (CSRemoteControlClient)initWithRemoteDevice:(id)a3;
- (CSRemoteDeviceProtocolInfo)deviceProtocolInfo;
- (NSString)description;
- (NSString)deviceId;
- (OS_remote_device)device;
- (id)_dictionaryWithContentsOfXPCObject:(id)a3;
- (id)_getMyriadInfoFromServerMessage:(id)a3;
- (unsigned)deviceType;
- (void)_fetchDataFromAudioFileUrl:(id)a3 aesKey:(id)a4 encryptedAudioSampleBypeDepth:(unint64_t)a5 completion:(id)a6;
- (void)_handleServerError:(id)a3;
- (void)_handleServerEvent:(id)a3;
- (void)_handleServerMessage:(id)a3;
- (void)_invalidate;
- (void)_transferAudioData:(id)a3 numSamples:(unint64_t)a4 remoteWavFilePath:(id)a5 completion:(id)a6;
- (void)_transferFile:(id)a3 at:(id)a4 completion:(id)a5;
- (void)addObserver:(id)a3;
- (void)clearTriggerCount:(id)a3;
- (void)dealloc;
- (void)didDeviceConnect:(id)a3;
- (void)didDeviceDisconnect:(id)a3;
- (void)exchangeRemoteDeviceProtocolInfo:(id)a3;
- (void)fetchAndClearCachedVoiceTriggerEventsWithCompletion:(id)a3;
- (void)getFirstPassRunningMode:(id)a3;
- (void)getTriggerCount:(id)a3;
- (void)invalidate;
- (void)invalidateInterstitialWithLevel:(int64_t)a3;
- (void)notifyBluetoothWirelessSplitterStateChanged:(unint64_t)a3 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a4;
- (void)notifyVoiceTriggerAssetChangeWithSiriLanguageCode:(id)a3;
- (void)readAndClearVoiceTriggeredTokenWithCompletion:(id)a3;
- (void)readVoiceTriggeredTokenWithCompletion:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setSelfTriggerEnable:(BOOL)a3 withCompletion:(id)a4;
- (void)setUserSelectedVoiceTriggerPhraseType:(unint64_t)a3;
- (void)setVoiceTriggerEnable:(BOOL)a3 withCompletion:(id)a4;
- (void)transferVoiceTriggerAsset:(id)a3 forLanguageCode:(id)a4 completion:(id)a5;
- (void)voiceTriggerEnabledWithCompletion:(id)a3;
@end

@implementation CSRemoteControlClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceProtocolInfo, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_deviceWaitingGroup, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (CSRemoteDeviceProtocolInfo)deviceProtocolInfo
{
  return self->_deviceProtocolInfo;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (OS_remote_device)device
{
  return self->_device;
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (void)setSelfTriggerEnable:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[CSRemoteControlClient setSelfTriggerEnable:withCompletion:]";
    __int16 v23 = 1026;
    BOOL v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s setting remote SelfTrigger enable : %{public}d", buf, 0x12u);
  }
  if (v4)
  {
    CFStringRef v19 = @"COMMAND";
    CFStringRef v20 = @"enableSelfTrigger";
    v8 = &v20;
    v9 = &v19;
  }
  else
  {
    CFStringRef v17 = @"COMMAND";
    CFStringRef v18 = @"disableSelfTrigger";
    v8 = &v18;
    v9 = &v17;
  }
  v10 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v9 count:1];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100087560;
  block[3] = &unk_100253280;
  block[4] = self;
  id v15 = v10;
  id v16 = v6;
  id v12 = v6;
  id v13 = v10;
  dispatch_async(queue, block);
}

- (void)_transferAudioData:(id)a3 numSamples:(unint64_t)a4 remoteWavFilePath:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v13, "COMMAND", "writeFileFromAudioData");
  xpc_dictionary_set_uint64(v13, "numberOfSamples", a4);
  if (v11) {
    xpc_dictionary_set_string(v13, "filePath", (const char *)[v11 UTF8String]);
  }
  if (v10)
  {
    v14 = objc_msgSend(v10, "_cs_xpcObject");
    xpc_dictionary_set_value(v13, "audioData", v14);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008785C;
  block[3] = &unk_100253280;
  block[4] = self;
  id v19 = v13;
  id v20 = v12;
  id v16 = v12;
  id v17 = v13;
  dispatch_async(queue, block);
}

- (void)_fetchDataFromAudioFileUrl:(id)a3 aesKey:(id)a4 encryptedAudioSampleBypeDepth:(unint64_t)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100087C5C;
  v37[3] = &unk_100250070;
  id v11 = v8;
  id v38 = v11;
  id v12 = v10;
  id v39 = v12;
  xpc_object_t v13 = objc_retainBlock(v37);
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_100087D88;
  v31 = sub_100087D98;
  id v32 = +[NSMutableData data];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  BOOL v24 = sub_100087D88;
  v25 = sub_100087D98;
  id v26 = 0;
  +[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100087DA0;
  v15[3] = &unk_100250098;
  id v14 = v11;
  id v16 = v14;
  id v17 = &v21;
  CFStringRef v18 = &v27;
  id v19 = &v33;
  +[SSRUtils streamAudioFromFileUrl:v14 audioStreamBasicDescriptor:v20 samplesPerStreamChunk:640 audioDataAvailableHandler:v15];
  ((void (*)(void *, uint64_t, uint64_t, uint64_t))v13[2])(v13, v28[5], v34[3], v22[5]);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
}

- (void)setUserSelectedVoiceTriggerPhraseType:(unint64_t)a3
{
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[CSRemoteControlClient setUserSelectedVoiceTriggerPhraseType:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "COMMAND", "userSelectedVoiceTriggerPhraseType");
  xpc_dictionary_set_uint64(v6, "userSelectedVoiceTriggerPhraseTypeOption", a3);
  v7 = self->_connection;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008808C;
  v11[3] = &unk_100253B08;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, v11);
}

- (void)fetchAndClearCachedVoiceTriggerEventsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v16 = "-[CSRemoteControlClient fetchAndClearCachedVoiceTriggerEventsWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  CFStringRef v13 = @"COMMAND";
  CFStringRef v14 = @"fetchAndClearCachedVTEvents";
  xpc_object_t v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100088218;
  block[3] = &unk_100253280;
  block[4] = self;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(queue, block);
}

- (void)notifyBluetoothWirelessSplitterStateChanged:(unint64_t)a3 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    id v15 = "-[CSRemoteControlClient notifyBluetoothWirelessSplitterStateChanged:shouldDisableSpeakerVerificationInSplitterMode:]";
    *(_DWORD *)buf = 136315650;
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    __int16 v16 = 2050;
    unint64_t v17 = a3;
    __int16 v18 = 2114;
    CFStringRef v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s splitterState : %{public}lu, shouldDisableSpeakerVerification : %{public}@", buf, 0x20u);
  }
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v9, "COMMAND", "notifySplitterStateChange");
  xpc_dictionary_set_uint64(v9, "splitterState", a3);
  xpc_dictionary_set_BOOL(v9, "shouldDisableSpeakerVerification", v4);
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000886B0;
  v12[3] = &unk_100253B08;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  dispatch_async(queue, v12);
}

- (BOOL)createRemoteVoiceProfileWithAudioFiles:(id)a3 aesKey:(id)a4 encryptedAudioSampleBypeDepth:(unint64_t)a5 languageCode:(id)a6 completion:(id)a7
{
  id v39 = a3;
  id v43 = a4;
  id v36 = a6;
  id v38 = (void (**)(id, void *))a7;
  id v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CSRemoteControlClient createRemoteVoiceProfileWithAudioFiles:aesKey:encryptedAudio"
                                    "SampleBypeDepth:languageCode:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }
  v40 = +[NSFileManager defaultManager];
  group = dispatch_group_create();
  if ([v39 count])
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v12 = v39;
    id v13 = [v12 countByEnumeratingWithState:&v56 objects:v68 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v57;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v57 != v14) {
            objc_enumerationMutation(v12);
          }
          __int16 v16 = [*(id *)(*((void *)&v56 + 1) + 8 * i) path];
          unsigned __int8 v17 = [v40 fileExistsAtPath:v16];

          if ((v17 & 1) == 0)
          {
            if (v38)
            {
              uint64_t v29 = +[NSError errorWithDomain:CSErrorDomain code:117 userInfo:&off_10025EAE0];
              v38[2](v38, v29);
            }
            goto LABEL_29;
          }
        }
        id v13 = [v12 countByEnumeratingWithState:&v56 objects:v68 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v64 = 0x3032000000;
    v65 = sub_100087D88;
    v66 = sub_100087D98;
    id v67 = +[NSMutableArray array];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obj = v12;
    id v18 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v53;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v53 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void **)(*((void *)&v52 + 1) + 8 * (void)j);
          v22 = [v21 lastPathComponent];
          uint64_t v23 = [@"VoiceTrigger/SAT/audio/" stringByAppendingPathComponent:v22];

          dispatch_group_enter(group);
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_100088DF4;
          v48[3] = &unk_100250048;
          v48[4] = v21;
          v48[5] = self;
          id v24 = v23;
          id v49 = v24;
          p_long long buf = &buf;
          v50 = group;
          [(CSRemoteControlClient *)self _fetchDataFromAudioFileUrl:v21 aesKey:v43 encryptedAudioSampleBypeDepth:a5 completion:v48];
        }
        id v18 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
      }
      while (v18);
    }

    dispatch_time_t v25 = dispatch_time(0, 10000000000);
    intptr_t v26 = dispatch_group_wait(group, v25);
    BOOL v27 = v26 == 0;
    if (v26)
    {
      v28 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v60 = 136315138;
        v61 = "-[CSRemoteControlClient createRemoteVoiceProfileWithAudioFiles:aesKey:encryptedAudioSampleBypeDepth:langua"
              "geCode:completion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s ERR: training data transfer timed out", v60, 0xCu);
      }
      if (v38) {
        v38[2](v38, 0);
      }
    }
    else
    {
      xpc_object_t v31 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v31, "COMMAND", "createRemoteVoiceProfile");
      xpc_dictionary_set_string(v31, "languageCode", (const char *)[v37 UTF8String]);
      id v32 = objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "_cs_xpcObject");
      xpc_dictionary_set_value(v31, "explicitTrainingAudioFiles", v32);

      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100088F84;
      block[3] = &unk_100253280;
      block[4] = self;
      id v46 = v31;
      v47 = v38;
      id v34 = v31;
      dispatch_async(queue, block);
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (v38)
    {
      v30 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:&off_10025EAB8];
      v38[2](v38, v30);
    }
LABEL_29:
    BOOL v27 = 0;
  }

  return v27;
}

- (void)exchangeRemoteDeviceProtocolInfo:(id)a3
{
  id v4 = a3;
  v5 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    xpc_object_t v6 = v5;
    v7 = [v4 description];
    *(_DWORD *)long long buf = 136315394;
    __int16 v16 = "-[CSRemoteControlClient exchangeRemoteDeviceProtocolInfo:]";
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Exchange protocol info with host info : %{public}@", buf, 0x16u);
  }
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "COMMAND", "exchangeProtocolInfo");
  if (v4)
  {
    xpc_object_t v9 = [v4 xpcObject];
    xpc_dictionary_set_value(v8, "hostProtocolInfo", v9);
  }
  else
  {
    id v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      __int16 v16 = "-[CSRemoteControlClient exchangeRemoteDeviceProtocolInfo:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Invalid hostProtocolInfo", buf, 0xCu);
    }
  }
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100089478;
  v13[3] = &unk_100253B08;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)notifyVoiceTriggerAssetChangeWithSiriLanguageCode:(id)a3
{
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    id v14 = "-[CSRemoteControlClient notifyVoiceTriggerAssetChangeWithSiriLanguageCode:]";
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s languageCode : %{public}@", buf, 0x16u);
  }
  v11[0] = @"COMMAND";
  v11[1] = @"languageCode";
  v12[0] = @"NotifyVTAssetChange";
  v12[1] = v4;
  xpc_object_t v6 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000899E4;
  v9[3] = &unk_100253B08;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (id)_getMyriadInfoFromServerMessage:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSData);
  v5 = xpc_dictionary_get_value(v3, "myriadHash");

  xpc_object_t v6 = objc_msgSend(v4, "_cs_initWithXPCObject:", v5);

  return v6;
}

- (id)_dictionaryWithContentsOfXPCObject:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = v4;
  if (v4)
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_100089C38;
    applier[3] = &unk_100252018;
    id v8 = v4;
    xpc_dictionary_apply(v3, applier);
  }
  return v5;
}

- (void)getFirstPassRunningMode:(id)a3
{
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v16 = "-[CSRemoteControlClient getFirstPassRunningMode:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  CFStringRef v13 = @"COMMAND";
  CFStringRef v14 = @"getFirstPassRunningMode";
  xpc_object_t v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100089EB0;
  block[3] = &unk_100253280;
  block[4] = self;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(queue, block);
}

- (void)clearTriggerCount:(id)a3
{
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v16 = "-[CSRemoteControlClient clearTriggerCount:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  CFStringRef v13 = @"COMMAND";
  CFStringRef v14 = @"clearTriggerCount";
  xpc_object_t v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008A280;
  block[3] = &unk_100253280;
  block[4] = self;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(queue, block);
}

- (void)getTriggerCount:(id)a3
{
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v16 = "-[CSRemoteControlClient getTriggerCount:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  CFStringRef v13 = @"COMMAND";
  CFStringRef v14 = @"getTriggerCount";
  xpc_object_t v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008A608;
  block[3] = &unk_100253280;
  block[4] = self;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(queue, block);
}

- (BOOL)transferInterstitialAudioFiles:(id)a3 interstitialLevel:(int64_t)a4 completion:(id)a5
{
  id v32 = a3;
  uint64_t v33 = (void (**)(id, id))a5;
  xpc_object_t v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CSRemoteControlClient transferInterstitialAudioFiles:interstitialLevel:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }
  id v34 = +[NSFileManager defaultManager];
  group = dispatch_group_create();
  id v38 = +[NSMutableArray array];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v61 = 0x3032000000;
  v62 = sub_100087D88;
  v63 = sub_100087D98;
  id v64 = 0;
  if ([v32 count])
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v7 = v32;
    id v8 = [v7 countByEnumeratingWithState:&v50 objects:v59 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v51;
LABEL_6:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v51 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = [*(id *)(*((void *)&v50 + 1) + 8 * v10) path];
        unsigned __int8 v12 = [v34 fileExistsAtPath:v11];

        if ((v12 & 1) == 0) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [v7 countByEnumeratingWithState:&v50 objects:v59 count:16];
          if (v8) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
      if (!v33) {
        goto LABEL_28;
      }
      id v23 = +[NSError errorWithDomain:CSErrorDomain code:117 userInfo:&off_10025EA40];
      v33[2](v33, v23);
      BOOL v24 = 0;
      goto LABEL_38;
    }
LABEL_12:

    CFStringRef v13 = +[CSFPreferences sharedPreferences];
    id v36 = [v13 interstitialRelativeDirForLevel:v31];

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = v7;
    id v14 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v47;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v47 != v15) {
            objc_enumerationMutation(obj);
          }
          __int16 v17 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          dispatch_group_enter(group);
          id v18 = [v17 lastPathComponent];
          uint64_t v19 = [v36 stringByAppendingPathComponent:v18];

          [v38 addObject:v19];
          id v20 = [v17 path];
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472;
          v43[2] = sub_10008AF30;
          v43[3] = &unk_100251958;
          p_long long buf = &buf;
          v44 = group;
          [(CSRemoteControlClient *)self _transferFile:v20 at:v19 completion:v43];
        }
        id v14 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
      }
      while (v14);
    }

    dispatch_time_t v21 = dispatch_time(0, 10000000000);
    if (dispatch_group_wait(group, v21))
    {
      v22 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v56 = 136315138;
        long long v57 = "-[CSRemoteControlClient transferInterstitialAudioFiles:interstitialLevel:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s Interstitial file transmission timed out", v56, 0xCu);
      }
      if (v33)
      {
        id v23 = +[NSError errorWithDomain:CSErrorDomain code:301 userInfo:&off_10025EA68];
        v33[2](v33, v23);
        BOOL v24 = 0;
LABEL_37:
        id v7 = v36;
LABEL_38:

        goto LABEL_39;
      }
    }
    else
    {
      if (!*(void *)(*((void *)&buf + 1) + 40))
      {
        v54[0] = @"COMMAND";
        v54[1] = @"interstitialLevel";
        v55[0] = @"updateInterstitialAudio";
        dispatch_time_t v25 = +[NSNumber numberWithInteger:v31];
        v55[1] = v25;
        intptr_t v26 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];

        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10008AF98;
        block[3] = &unk_100253280;
        block[4] = self;
        id v23 = v26;
        id v41 = v23;
        v28 = v33;
        v42 = v28;
        dispatch_async(queue, block);
        if (v28) {
          v28[2](v28, 0);
        }

        BOOL v24 = 1;
        goto LABEL_37;
      }
      if (v33) {
        ((void (*)(void))v33[2])();
      }
    }
    BOOL v24 = 0;
    id v7 = v36;
LABEL_39:

    goto LABEL_40;
  }
  if (v33)
  {
    id v7 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:&off_10025EA18];
    v33[2](v33, v7);
LABEL_28:
    BOOL v24 = 0;
    goto LABEL_39;
  }
  BOOL v24 = 0;
LABEL_40:
  _Block_object_dispose(&buf, 8);

  return v24;
}

- (void)invalidateInterstitialWithLevel:(int64_t)a3
{
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v15 = "-[CSRemoteControlClient invalidateInterstitialWithLevel:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v12[0] = @"COMMAND";
  v12[1] = @"interstitialLevel";
  v13[0] = @"invalidateInterstitialAudio";
  xpc_object_t v6 = +[NSNumber numberWithInteger:a3];
  v13[1] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10008B27C;
  v10[3] = &unk_100253B08;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, v10);
}

- (void)voiceTriggerEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v16 = "-[CSRemoteControlClient voiceTriggerEnabledWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  CFStringRef v13 = @"COMMAND";
  CFStringRef v14 = @"voiceTriggerEnabled";
  xpc_object_t v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008B500;
  block[3] = &unk_100253280;
  block[4] = self;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(queue, block);
}

- (void)setVoiceTriggerEnable:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    v22 = "-[CSRemoteControlClient setVoiceTriggerEnable:withCompletion:]";
    __int16 v23 = 1026;
    BOOL v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s set enable : %{public}d", buf, 0x12u);
  }
  if (v4)
  {
    CFStringRef v19 = @"COMMAND";
    CFStringRef v20 = @"enableVoiceTrigger";
    id v8 = &v20;
    id v9 = &v19;
  }
  else
  {
    CFStringRef v17 = @"COMMAND";
    CFStringRef v18 = @"disableVoiceTrigger";
    id v8 = &v18;
    id v9 = &v17;
  }
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v9 count:1];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008B928;
  block[3] = &unk_100253280;
  block[4] = self;
  id v15 = v10;
  id v16 = v6;
  id v12 = v6;
  id v13 = v10;
  dispatch_async(queue, block);
}

- (void)transferVoiceTriggerAsset:(id)a3 forLanguageCode:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v31 = a4;
  uint64_t v35 = (void (**)(id, void, id))a5;
  id v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CSRemoteControlClient transferVoiceTriggerAsset:forLanguageCode:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }
  id v34 = objc_msgSend(v7, "hashFromResourcePath", v31);
  uint64_t v33 = [v7 configVersion];
  id v9 = [@"VoiceTrigger/asset" stringByAppendingPathComponent:v34];
  id v37 = [v9 stringByAppendingString:@".asset"];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v59 = 0x3032000000;
  v60 = sub_100087D88;
  uint64_t v61 = sub_100087D98;
  id v62 = 0;
  group = dispatch_group_create();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v10 = +[NSFileManager defaultManager];
  id v11 = [v7 resourcePath];
  id v12 = [v10 enumeratorAtPath:v11];

  id v13 = [v12 countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v46;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v46 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v45 + 1) + 8 * (void)v15);
        CFStringRef v17 = [v7 resourcePath];
        CFStringRef v18 = [v17 stringByAppendingPathComponent:v16];

        v53[0] = 0;
        CFStringRef v19 = +[NSFileManager defaultManager];
        [v19 fileExistsAtPath:v18 isDirectory:v53];

        if (!v53[0])
        {
          dispatch_group_enter(group);
          CFStringRef v20 = [v37 stringByAppendingPathComponent:v16];
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          v42[2] = sub_10008C1AC;
          v42[3] = &unk_100251958;
          p_long long buf = &buf;
          id v43 = group;
          [(CSRemoteControlClient *)self _transferFile:v18 at:v20 completion:v42];
        }
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v13);
  }

  dispatch_time_t v21 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(group, v21))
  {
    v22 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long v53 = 136315138;
      long long v54 = "-[CSRemoteControlClient transferVoiceTriggerAsset:forLanguageCode:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger asset file transmission timed out", v53, 0xCu);
    }
    if (v35)
    {
      id v23 = +[NSError errorWithDomain:CSErrorDomain code:304 userInfo:&off_10025E9C8];
      v35[2](v35, 0, v23);
LABEL_23:
    }
  }
  else
  {
    uint64_t v24 = *((void *)&buf + 1);
    if (!*(void *)(*((void *)&buf + 1) + 40))
    {
      v49[0] = @"COMMAND";
      v49[1] = @"voiceTriggerAssetHash";
      v50[0] = @"setVoiceTriggerAsset";
      v50[1] = v34;
      v49[2] = @"voiceTriggerAssetLanguageCode";
      v49[3] = @"voiceTriggerAssetPath";
      v50[2] = v32;
      v50[3] = v37;
      v49[4] = @"voiceTriggerAssetConfigVersion";
      v50[4] = v33;
      v28 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:5];
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10008C214;
      block[3] = &unk_100253280;
      block[4] = self;
      id v40 = v28;
      id v41 = v35;
      id v23 = v28;
      dispatch_async(queue, block);

      goto LABEL_23;
    }
    dispatch_time_t v25 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v30 = [*(id *)(v24 + 40) localizedDescription];
      *(_DWORD *)long long v53 = 136315394;
      long long v54 = "-[CSRemoteControlClient transferVoiceTriggerAsset:forLanguageCode:completion:]";
      __int16 v55 = 2114;
      long long v56 = v30;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s Cannot transfer VoiceTrigger asset %{public}@", v53, 0x16u);
    }
    if (v35)
    {
      CFStringRef v51 = @"reason";
      id v23 = [*(id *)(*((void *)&buf + 1) + 40) localizedDescription];
      id v52 = v23;
      intptr_t v26 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      BOOL v27 = +[NSError errorWithDomain:CSErrorDomain code:304 userInfo:v26];
      v35[2](v35, 0, v27);

      goto LABEL_23;
    }
  }

  _Block_object_dispose(&buf, 8);
}

- (BOOL)transferVoiceTriggerSpeakerModel:(id)a3 forAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = +[SSRVoiceProfileManager sharedInstance];
    intptr_t v26 = [v8 modelDirectoryPathForProfile:v6];
    id v9 = [v7 hashFromResourcePath];
    uint64_t v10 = [v26 URLByAppendingPathComponent:v9];

    id v11 = [v7 hashFromResourcePath];
    id v12 = [@"VoiceTrigger/SAT/model/" stringByAppendingPathComponent:v11];

    id v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[CSRemoteControlClient transferVoiceTriggerSpeakerModel:forAsset:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2114;
      uint64_t v35 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Speaker model file %{public}@ is being transmited to %{public}@", buf, 0x20u);
    }
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v35 = sub_100087D88;
    id v36 = sub_100087D98;
    id v37 = 0;
    uint64_t v14 = dispatch_group_create();
    dispatch_group_enter(v14);
    id v15 = [v10 path];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10008C7B0;
    v27[3] = &unk_100251958;
    uint64_t v29 = buf;
    uint64_t v16 = v14;
    v28 = v16;
    [(CSRemoteControlClient *)self _transferFile:v15 at:v12 completion:v27];

    CFStringRef v17 = v8;
    dispatch_time_t v18 = dispatch_time(0, 10000000000);
    if (dispatch_group_wait(v16, v18))
    {
      CFStringRef v19 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v30 = 136315138;
        id v31 = "-[CSRemoteControlClient transferVoiceTriggerSpeakerModel:forAsset:]";
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s ERR: Speaker model transmission timed out", v30, 0xCu);
      }
    }
    else
    {
      uint64_t v22 = *(void *)&buf[8];
      if (!*(void *)(*(void *)&buf[8] + 40))
      {
        BOOL v21 = 1;
        CFStringRef v17 = v8;
        goto LABEL_15;
      }
      id v23 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        dispatch_time_t v25 = [*(id *)(v22 + 40) localizedDescription];
        *(_DWORD *)v30 = 136315394;
        id v31 = "-[CSRemoteControlClient transferVoiceTriggerSpeakerModel:forAsset:]";
        __int16 v32 = 2114;
        uint64_t v33 = v25;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", v30, 0x16u);
      }
      CFStringRef v17 = v8;
    }
    BOOL v21 = 0;
LABEL_15:

    _Block_object_dispose(buf, 8);
    goto LABEL_16;
  }
  CFStringRef v20 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[CSRemoteControlClient transferVoiceTriggerSpeakerModel:forAsset:]";
    _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s ERR: speakerProfile passed is nil - Bailing out", buf, 0xCu);
  }
  BOOL v21 = 0;
LABEL_16:

  return v21;
}

- (void)_transferFile:(id)a3 at:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    id v31 = "-[CSRemoteControlClient _transferFile:at:completion:]";
    __int16 v32 = 2114;
    id v33 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }
  if (v8 && v9)
  {
    id v12 = +[NSFileManager defaultManager];
    if ([v12 fileExistsAtPath:v8])
    {
      id v13 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v13, "COMMAND", "writeFile");
      xpc_dictionary_set_string(v13, "filePath", (const char *)[v9 UTF8String]);
      id v14 = v8;
      [v14 UTF8String];
      uint64_t v24 = _NSConcreteStackBlock;
      uint64_t v25 = 3221225472;
      intptr_t v26 = sub_10008CC4C;
      BOOL v27 = &unk_10024FFF8;
      id v28 = v14;
      id v15 = v10;
      id v29 = v15;
      uint64_t v16 = (void *)xpc_file_transfer_create_with_path();
      if (v16)
      {
        xpc_dictionary_set_value(v13, "fileTx", v16);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10008CE44;
        block[3] = &unk_100253280;
        block[4] = self;
        id v22 = v13;
        id v23 = v15;
        dispatch_async(queue, block);

LABEL_16:
        goto LABEL_17;
      }
      CFStringRef v19 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        id v31 = "-[CSRemoteControlClient _transferFile:at:completion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s Failed to create xpc file transfer", buf, 0xCu);
        if (!v15) {
          goto LABEL_16;
        }
      }
      else if (!v15)
      {
        goto LABEL_16;
      }
      CFStringRef v20 = +[NSError errorWithDomain:CSErrorDomain code:304 userInfo:&off_10025E978];
      (*((void (**)(id, void *))v15 + 2))(v15, v20);

      goto LABEL_16;
    }
    dispatch_time_t v18 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v31 = "-[CSRemoteControlClient _transferFile:at:completion:]";
      __int16 v32 = 2114;
      id v33 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s File does not exists : %{public}@", buf, 0x16u);
      if (!v10) {
        goto LABEL_18;
      }
      goto LABEL_12;
    }
    if (v10)
    {
LABEL_12:
      id v13 = +[NSError errorWithDomain:CSErrorDomain code:117 userInfo:&off_10025E950];
      (*((void (**)(id, void *))v10 + 2))(v10, v13);
LABEL_17:
    }
LABEL_18:

    goto LABEL_19;
  }
  if (v10)
  {
    id v12 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:&off_10025E928];
    (*((void (**)(id, void *))v10 + 2))(v10, v12);
    goto LABEL_18;
  }
LABEL_19:
}

- (void)readAndClearVoiceTriggeredTokenWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v16 = "-[CSRemoteControlClient readAndClearVoiceTriggeredTokenWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  CFStringRef v13 = @"COMMAND";
  CFStringRef v14 = @"readAndClearVoiceTriggeredToken";
  id v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008D19C;
  block[3] = &unk_100253280;
  block[4] = self;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(queue, block);
}

- (void)readVoiceTriggeredTokenWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v16 = "-[CSRemoteControlClient readVoiceTriggeredTokenWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  CFStringRef v13 = @"COMMAND";
  CFStringRef v14 = @"readVoiceTriggeredToken";
  id v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008D664;
  block[3] = &unk_100253280;
  block[4] = self;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(queue, block);
}

- (void)_handleServerMessage:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = +[NSString stringWithFormat:@"%s", xpc_dictionary_get_string(v4, "COMMAND")];
  id v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    long long v53 = "-[CSRemoteControlClient _handleServerMessage:]";
    __int16 v54 = 2114;
    __int16 v55 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s XPC command recevied : %{public}@", buf, 0x16u);
  }
  if ([(NSHashTable *)v5 isEqualToString:@"notifyVoiceTrigger"])
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v7 = self->_observers;
    id v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v47 objects:v60 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v48;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v48 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v12 didReceiveVoiceTriggered:self];
          }
        }
        id v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v47 objects:v60 count:16];
      }
      while (v9);
    }
    goto LABEL_56;
  }
  if ([(NSHashTable *)v5 isEqualToString:@"notifySelfTrigger"])
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v7 = self->_observers;
    id v13 = [(NSHashTable *)v7 countByEnumeratingWithState:&v43 objects:v59 count:16];
    if (!v13)
    {
LABEL_56:

      goto LABEL_57;
    }
    id v14 = v13;
    id v34 = v5;
    uint64_t v15 = *(void *)v44;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v44 != v15) {
          objc_enumerationMutation(v7);
        }
        CFStringRef v17 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
        if (objc_opt_respondsToSelector())
        {
          dispatch_time_t v18 = [(CSRemoteControlClient *)self _getMyriadInfoFromServerMessage:v4];
          [v17 didReceiveSelfTriggerDetected:self myriadHash:v18];
        }
      }
      id v14 = [(NSHashTable *)v7 countByEnumeratingWithState:&v43 objects:v59 count:16];
    }
    while (v14);
LABEL_55:
    v5 = v34;
    goto LABEL_56;
  }
  if ([(NSHashTable *)v5 isEqualToString:@"notifyBootFromHibernate"])
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v7 = self->_observers;
    id v19 = [(NSHashTable *)v7 countByEnumeratingWithState:&v39 objects:v58 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v40;
      do
      {
        for (k = 0; k != v20; k = (char *)k + 1)
        {
          if (*(void *)v40 != v21) {
            objc_enumerationMutation(v7);
          }
          id v23 = *(void **)(*((void *)&v39 + 1) + 8 * (void)k);
          if (objc_opt_respondsToSelector()) {
            [v23 didReceiveBootFromHibernate:self];
          }
        }
        id v20 = [(NSHashTable *)v7 countByEnumeratingWithState:&v39 objects:v58 count:16];
      }
      while (v20);
    }
    goto LABEL_56;
  }
  if ([(NSHashTable *)v5 isEqualToString:@"requestAssetDownload"])
  {
    string = xpc_dictionary_get_string(v4, "voiceTriggerAssetConfigVersion");
    if (string)
    {
      id v7 = +[NSString stringWithUTF8String:string];
    }
    else
    {
      id v7 = 0;
    }
    uint64_t v25 = xpc_dictionary_get_string(v4, "languageCode");
    id v34 = v5;
    if (v25)
    {
      intptr_t v26 = +[NSString stringWithUTF8String:v25];
    }
    else
    {
      intptr_t v26 = 0;
    }
    BOOL v27 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315650;
      long long v53 = "-[CSRemoteControlClient _handleServerMessage:]";
      __int16 v54 = 2114;
      __int16 v55 = v7;
      __int16 v56 = 2114;
      long long v57 = v26;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s RequestVoiceTriggerAssetDownload : configVersion %{public}@, languageCode %{public}@", buf, 0x20u);
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v28 = self->_observers;
    id v29 = [(NSHashTable *)v28 countByEnumeratingWithState:&v35 objects:v51 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v36;
      do
      {
        for (m = 0; m != v30; m = (char *)m + 1)
        {
          if (*(void *)v36 != v31) {
            objc_enumerationMutation(v28);
          }
          id v33 = *(void **)(*((void *)&v35 + 1) + 8 * (void)m);
          if (objc_opt_respondsToSelector()) {
            [v33 didReceiveVoiceTriggerAssetsDownloadingRequest:self withConfigVersion:v7 languageCode:v26];
          }
        }
        id v30 = [(NSHashTable *)v28 countByEnumeratingWithState:&v35 objects:v51 count:16];
      }
      while (v30);
    }

    goto LABEL_55;
  }
LABEL_57:
}

- (void)_handleServerError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    if (v4 == &_xpc_error_connection_invalid || v4 == &_xpc_error_connection_interrupted)
    {
      id v6 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        uint64_t v21 = "-[CSRemoteControlClient _handleServerError:]";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s connection disconnected", buf, 0xCu);
      }
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v7 = self->_observers;
      id v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v17;
        do
        {
          id v11 = 0;
          do
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v11);
            if (objc_opt_respondsToSelector()) {
              objc_msgSend(v12, "didReceiveConnectionInvalidated:", self, (void)v16);
            }
            id v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
        }
        while (v9);
      }
    }
    else
    {
      string = xpc_dictionary_get_string(v4, _xpc_error_key_description);
      id v14 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        uint64_t v21 = "-[CSRemoteControlClient _handleServerError:]";
        __int16 v22 = 2082;
        id v23 = string;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s connection error: %{public}s", buf, 0x16u);
      }
    }
  }
}

- (void)_handleServerEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    xpc_type_t type = xpc_get_type(v4);
    if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_error)
    {
      id v8 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315138;
        uint64_t v10 = "-[CSRemoteControlClient _handleServerEvent:]";
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s remoteXPC connection get failed", (uint8_t *)&v9, 0xCu);
      }
      [(CSRemoteControlClient *)self _handleServerError:v4];
    }
    else
    {
      if (type == (xpc_type_t)&_xpc_type_dictionary)
      {
        [(CSRemoteControlClient *)self _handleServerMessage:v4];
        goto LABEL_13;
      }
      id v6 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315138;
        uint64_t v10 = "-[CSRemoteControlClient _handleServerEvent:]";
        id v7 = "%s Ignore unknown type message";
LABEL_8:
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v9, 0xCu);
      }
    }
  }
  else
  {
    id v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[CSRemoteControlClient _handleServerEvent:]";
      id v7 = "%s cannot handle server event since event is nil";
      goto LABEL_8;
    }
  }
LABEL_13:
}

- (NSString)description
{
  id v3 = +[NSMutableString string];
  deviceId = self->_deviceId;
  v5 = +[NSString stringWithUTF8String:remote_device_type_get_description()];
  [v3 appendFormat:@"deviceUUID(%@), deviceType(%@)", deviceId, v5];

  return (NSString *)v3;
}

- (BOOL)isConnected
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10008E31C;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)waitingForConnection:(double)a3 error:(id *)a4
{
  if ([(CSDispatchGroup *)self->_deviceWaitingGroup waitWithTimeout:dispatch_time(0, (uint64_t)(a3 * 1000000000.0))])
  {
    id v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v25 = "-[CSRemoteControlClient waitingForConnection:error:]";
      __int16 v26 = 2050;
      double v27 = a3;
      _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "%s Device connection waiting %{public}.3f seconds timed out", buf, 0x16u);
      if (a4) {
        goto LABEL_4;
      }
    }
    else if (a4)
    {
LABEL_4:
      uint64_t v8 = CSErrorDomain;
      uint64_t v9 = 301;
LABEL_19:
      id v18 = +[NSError errorWithDomain:v8 code:v9 userInfo:0];
      BOOL result = 0;
      *a4 = v18;
      return result;
    }
    return 0;
  }
  if (![(CSRemoteControlClient *)self isConnected])
  {
    long long v17 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v25 = "-[CSRemoteControlClient waitingForConnection:error:]";
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Device is connected but RemoteXPC service is not connected", buf, 0xCu);
      if (a4) {
        goto LABEL_18;
      }
    }
    else if (a4)
    {
LABEL_18:
      uint64_t v8 = CSErrorDomain;
      uint64_t v9 = 302;
      goto LABEL_19;
    }
    return 0;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = self->_observers;
  id v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v15, "didConnected:", self, (void)v19);
        }
      }
      id v12 = [(NSHashTable *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  return 1;
}

- (void)didDeviceDisconnect:(id)a3
{
  id v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v8 = "-[CSRemoteControlClient didDeviceDisconnect:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008E6D8;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)didDeviceConnect:(id)a3
{
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v12 = "-[CSRemoteControlClient didDeviceConnect:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008E994;
  v8[3] = &unk_100253B08;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)dealloc
{
  char v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v6 = "-[CSRemoteControlClient dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Dealloc of CSRemoteControlClient, it should close connection", buf, 0xCu);
  }
  [(CSRemoteControlClient *)self _invalidate];
  v4.receiver = self;
  v4.super_class = (Class)CSRemoteControlClient;
  [(CSRemoteControlClient *)&v4 dealloc];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008EDF4;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_invalidate
{
  connection = self->_connection;
  if (connection)
  {
    objc_super v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[CSRemoteControlClient _invalidate]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Cancelling remote connection", (uint8_t *)&v9, 0xCu);
      connection = self->_connection;
    }
    self->_connection = 0;
    v5 = connection;

    xpc_remote_connection_cancel();
  }
  if (self->_device && remote_device_get_type())
  {
    uint64_t v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[CSRemoteControlClient _invalidate]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Cancelling remote device", (uint8_t *)&v9, 0xCu);
    }
    device = self->_device;
    self->_device = 0;
    uint64_t v8 = device;

    remote_device_cancel();
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008EFF0;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (([v4 conformsToProtocol:&OBJC_PROTOCOL___CSRemoteControlClientDelegateV1] & 1) != 0
    || ([v4 conformsToProtocol:&OBJC_PROTOCOL___CSRemoteControlClientDelegateV2] & 1) != 0)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10008F160;
    v7[3] = &unk_100253B08;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
  else
  {
    id v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v10 = "-[CSRemoteControlClient addObserver:]";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s observer doesn't conform to either V1 or V2 protocol", buf, 0xCu);
    }
  }
}

- (BOOL)isConnectedDeviceDarwin
{
  self->_deviceType = 11;
  return 1;
}

- (BOOL)isConnectedDeviceGibraltar
{
  return self->_deviceType == 3;
}

- (CSRemoteControlClient)initWithRemoteDevice:(id)a3
{
  id v5 = a3;
  if ((+[CSUtils isDarwinOS] & 1) == 0)
  {
    v20.receiver = self;
    v20.super_class = (Class)CSRemoteControlClient;
    self = [(CSRemoteControlClient *)&v20 init];
    if (self)
    {
      if (!v5)
      {
        long long v17 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          LODWORD(location[0]) = 136315138;
          *(id *)((char *)location + 4) = "-[CSRemoteControlClient initWithRemoteDevice:]";
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s invalid remote device", (uint8_t *)location, 0xCu);
        }
        goto LABEL_2;
      }
      id v7 = (OS_dispatch_queue *)dispatch_queue_create("CSRemoteControlClient", 0);
      queue = self->_queue;
      self->_queue = v7;

      int v9 = +[NSHashTable weakObjectsHashTable];
      observers = self->_observers;
      self->_observers = v9;

      id v11 = (CSDispatchGroup *)objc_alloc_init((Class)CSDispatchGroup);
      deviceWaitingGroup = self->_deviceWaitingGroup;
      self->_deviceWaitingGroup = v11;

      objc_initWeak(location, self);
      uint64_t v13 = self->_queue;
      objc_storeStrong((id *)&self->_device, a3);
      self->_deviceType = remote_device_get_type();
      id v14 = +[CSRemoteDeviceProtocolInfo defaultProtocolInfo];
      deviceProtocolInfo = self->_deviceProtocolInfo;
      self->_deviceProtocolInfo = v14;

      [(CSDispatchGroup *)self->_deviceWaitingGroup enter];
      v18[1] = _NSConcreteStackBlock;
      v18[2] = (id)3221225472;
      v18[3] = sub_10008F4E8;
      v18[4] = &unk_10024FFA8;
      objc_copyWeak(&v19, location);
      remote_device_set_connected_callback();
      objc_copyWeak(v18, location);
      remote_device_set_disconnected_callback();
      objc_destroyWeak(v18);
      objc_destroyWeak(&v19);

      objc_destroyWeak(location);
    }
    self = self;
    id v6 = self;
    goto LABEL_7;
  }
LABEL_2:
  id v6 = 0;
LABEL_7:

  return v6;
}

@end