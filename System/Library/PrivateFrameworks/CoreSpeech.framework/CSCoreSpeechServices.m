@interface CSCoreSpeechServices
+ (id)getCoreSpeechServiceConnection;
+ (id)getCoreSpeechXPCConnection;
+ (int64_t)getFirstPassRunningMode;
+ (void)_voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 accessoryRTModelType:(int64_t)a5 accessoryInfo:(id)a6 endpointId:(id)a7 downloadedModels:(id)a8 preinstalledModels:(id)a9 completion:(id)a10;
+ (void)fetchRemoteVoiceTriggerAssetForLanguageCode:(id)a3 completion:(id)a4;
+ (void)getCSVoiceTriggerRTModelRequestOptions:(id)a3 completion:(id)a4;
+ (void)getCurrentVoiceTriggerLocaleWithEndpointId:(id)a3 completion:(id)a4;
+ (void)installedVoiceTriggerAssetForLanguageCode:(id)a3 completion:(id)a4;
+ (void)requestUpdatedSATAudio;
+ (void)supportsMultiPhraseVoiceTriggerForEngineVersion:(id)a3 engineMinorVersion:(id)a4 accessoryRTModelType:(id)a5 completion:(id)a6;
+ (void)voiceTriggerJarvisLanguageList:(id)a3 jarvisSelectedLanguage:(id)a4 completion:(id)a5;
+ (void)voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 accessoryRTModelType:(int64_t)a5 accessoryInfo:(id)a6 endpointId:(id)a7 downloadedModels:(id)a8 preinstalledModels:(id)a9 completion:(id)a10;
+ (void)voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 accessoryRTModelType:(int64_t)a5 downloadedModels:(id)a6 preinstalledModels:(id)a7 completion:(id)a8;
+ (void)voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 accessoryRTModelType:(int64_t)a5 endpointId:(id)a6 downloadedModels:(id)a7 preinstalledModels:(id)a8 completion:(id)a9;
+ (void)voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 downloadedModels:(id)a5 preinstalledModels:(id)a6 completion:(id)a7;
@end

@implementation CSCoreSpeechServices

+ (int64_t)getFirstPassRunningMode
{
  CSLogInitIfNeeded();
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v4 = [a1 getCoreSpeechServiceConnection];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100039454;
  v19[3] = &unk_100253AE0;
  v5 = v3;
  v20 = v5;
  [v4 setInvalidationHandler:v19];
  [v4 resume];
  v6 = [v4 remoteObjectProxy];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = -1;
  if (v6)
  {
    objc_initWeak(&location, v4);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100039508;
    v10[3] = &unk_10024EFC8;
    v12 = &v15;
    objc_copyWeak(&v13, &location);
    v7 = v5;
    v11 = v7;
    [v6 getFirstPassRunningMode:v10];
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    [v4 setInvalidationHandler:0];
    [v4 invalidate];
  }
  int64_t v8 = v16[3];
  _Block_object_dispose(&v15, 8);

  return v8;
}

+ (void)requestUpdatedSATAudio
{
  CSLogInitIfNeeded();
  dispatch_semaphore_t v3 = [a1 getCoreSpeechServiceConnection];
  [v3 setInvalidationHandler:&stru_10024EF78];
  [v3 resume];
  v4 = [v3 remoteObjectProxy];
  if (v4)
  {
    objc_initWeak(&location, v3);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000396A4;
    v5[3] = &unk_10024EFA0;
    objc_copyWeak(&v6, &location);
    [v4 requestUpdatedSATAudio:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    [v3 setInvalidationHandler:0];
    [v3 invalidate];
  }
}

+ (void)voiceTriggerJarvisLanguageList:(id)a3 jarvisSelectedLanguage:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CSLogInitIfNeeded();
  v11 = [a1 getCoreSpeechXPCConnection];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100039AC0;
  v19[3] = &unk_100250B08;
  id v12 = v10;
  id v20 = v12;
  [v11 setInvalidationHandler:v19];
  [v11 resume];
  id v13 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "+[CSCoreSpeechServices voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:]";
    __int16 v23 = 2114;
    id v24 = v8;
    __int16 v25 = 2114;
    id v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Asking keyword language given Jarvis language list %{public}@, jarvis-selected language: %{public}@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, v11);
  v14 = [v11 remoteObjectProxy];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100039BBC;
  v16[3] = &unk_10024EF58;
  id v15 = v12;
  id v17 = v15;
  objc_copyWeak(&v18, (id *)buf);
  [v14 voiceTriggerJarvisLanguageList:v8 jarvisSelectedLanguage:v9 completion:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

+ (void)voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 downloadedModels:(id)a5 preinstalledModels:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  CSLogInitIfNeeded();
  [a1 voiceTriggerRTModelForVersion:a3 minorVersion:a4 accessoryRTModelType:0 accessoryInfo:0 endpointId:0 downloadedModels:v14 preinstalledModels:v13 completion:v12];
}

+ (void)_voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 accessoryRTModelType:(int64_t)a5 accessoryInfo:(id)a6 endpointId:(id)a7 downloadedModels:(id)a8 preinstalledModels:(id)a9 completion:(id)a10
{
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  CSLogInitIfNeeded();
  if (a5)
  {
    id v20 = [v16 UUIDString];
  }
  else
  {
    id v20 = 0;
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100039E70;
  v28[3] = &unk_10024EF30;
  unint64_t v35 = a3;
  unint64_t v36 = a4;
  id v29 = v16;
  id v30 = v20;
  int64_t v37 = a5;
  id v38 = a1;
  id v31 = v15;
  id v32 = v17;
  id v33 = v18;
  id v34 = v19;
  id v21 = v18;
  id v22 = v17;
  id v23 = v19;
  id v24 = v15;
  id v25 = v20;
  id v26 = v16;
  +[CSCoreSpeechServices getCSVoiceTriggerRTModelRequestOptions:v25 completion:v28];
}

+ (void)voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 accessoryRTModelType:(int64_t)a5 endpointId:(id)a6 downloadedModels:(id)a7 preinstalledModels:(id)a8 completion:(id)a9
{
}

+ (void)voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 accessoryRTModelType:(int64_t)a5 accessoryInfo:(id)a6 endpointId:(id)a7 downloadedModels:(id)a8 preinstalledModels:(id)a9 completion:(id)a10
{
}

+ (void)voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 accessoryRTModelType:(int64_t)a5 downloadedModels:(id)a6 preinstalledModels:(id)a7 completion:(id)a8
{
}

+ (void)supportsMultiPhraseVoiceTriggerForEngineVersion:(id)a3 engineMinorVersion:(id)a4 accessoryRTModelType:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    id v14 = objc_alloc((Class)CSSafetyOneArgumentCompletionBlock);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10003AA74;
    v30[3] = &unk_10024EEB8;
    id v31 = v13;
    id v15 = [v14 initWithDefaultValue:&__kCFBooleanFalse completionBlock:v30];
    [a1 getCoreSpeechXPCConnection];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10003AABC;
    v28[3] = &unk_100253AE0;
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v29 = v16;
    id v17 = objc_retainBlock(v28);
    [v16 setInterruptionHandler:v17];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10003AB98;
    v26[3] = &unk_100253AE0;
    id v18 = v16;
    id v27 = v18;
    [v18 setInvalidationHandler:v26];
    [v18 resume];
    id v19 = [v18 remoteObjectProxy];
    id v20 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v33 = "+[CSCoreSpeechServices supportsMultiPhraseVoiceTriggerForEngineVersion:engineMinorVersion:accessoryRTModelType:completion:]";
      __int16 v34 = 2048;
      unint64_t v35 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s Remote object proxy %p", buf, 0x16u);
    }
    if (v19)
    {
      id v21 = [v18 remoteObjectProxy];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10003AC54;
      v23[3] = &unk_10024F6D8;
      id v25 = v17;
      id v24 = v15;
      [v21 supportsMultiPhraseVoiceTriggerForEngineVersion:v10 engineMinorVersion:v11 accessoryRTModelType:v12 completion:v23];
    }
    else
    {
      id v22 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v33 = "+[CSCoreSpeechServices supportsMultiPhraseVoiceTriggerForEngineVersion:engineMinorVersion:accessoryRTModel"
              "Type:completion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s Remote object proxy is nil", buf, 0xCu);
      }
    }
  }
}

+ (void)getCSVoiceTriggerRTModelRequestOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003AFA8;
  v17[3] = &unk_10024EE68;
  id v7 = a4;
  id v18 = v7;
  id v8 = objc_retainBlock(v17);
  id v9 = [a1 getCoreSpeechServiceConnection];
  id v10 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v20 = "+[CSCoreSpeechServices getCSVoiceTriggerRTModelRequestOptions:completion:]";
    __int16 v21 = 1026;
    int v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s making connection to corespeechd with (%{public}d)", buf, 0x12u);
  }
  [v9 resume];
  id v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v20 = "+[CSCoreSpeechServices getCSVoiceTriggerRTModelRequestOptions:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Asking VoiceTrigger locale to corespeechd", buf, 0xCu);
  }
  id v12 = [v9 remoteObjectProxy];
  if (v12)
  {
    objc_initWeak((id *)buf, v9);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003AFC0;
    v14[3] = &unk_10024EE90;
    id v15 = v8;
    objc_copyWeak(&v16, (id *)buf);
    [v12 getVoiceTriggerRTModelRequestOptionsWithEndpointId:v6 completion:v14];
    objc_destroyWeak(&v16);

    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v13 = +[NSError errorWithDomain:CSErrorDomain code:406 userInfo:0];
    ((void (*)(void *, void, void *))v8[2])(v8, 0, v13);

    [v9 setInvalidationHandler:0];
    [v9 invalidate];
  }
}

+ (void)getCurrentVoiceTriggerLocaleWithEndpointId:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003B178;
  v7[3] = &unk_10024EE68;
  id v8 = a4;
  id v6 = v8;
  [a1 getCSVoiceTriggerRTModelRequestOptions:a3 completion:v7];
}

+ (void)fetchRemoteVoiceTriggerAssetForLanguageCode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CSLogInitIfNeeded();
  id v8 = [a1 getCoreSpeechXPCConnection];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003B3B0;
  v16[3] = &unk_100250B08;
  id v9 = v7;
  id v17 = v9;
  [v8 setInvalidationHandler:v16];
  [v8 resume];
  objc_initWeak(&location, v8);
  id v10 = [v8 remoteObjectProxy];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003B4B0;
  v12[3] = &unk_10024EE40;
  id v11 = v9;
  id v13 = v11;
  objc_copyWeak(&v14, &location);
  [v10 fetchRemoteVoiceTriggerAssetForLanguageCode:v6 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

+ (void)installedVoiceTriggerAssetForLanguageCode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CSLogInitIfNeeded();
  id v8 = [a1 getCoreSpeechXPCConnection];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003B6D0;
  v16[3] = &unk_100250B08;
  id v9 = v7;
  id v17 = v9;
  [v8 setInvalidationHandler:v16];
  [v8 resume];
  objc_initWeak(&location, v8);
  id v10 = [v8 remoteObjectProxy];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003B7D0;
  v12[3] = &unk_10024EE40;
  id v11 = v9;
  id v13 = v11;
  objc_copyWeak(&v14, &location);
  [v10 installedVoiceTriggerAssetForLanguageCode:v6 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

+ (id)getCoreSpeechXPCConnection
{
  id v16 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.corespeech.xpc"];
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CoreSpeechXPCProtocol];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v22[2] = objc_opt_class();
  v22[3] = objc_opt_class();
  dispatch_semaphore_t v3 = +[NSArray arrayWithObjects:v22 count:4];
  v4 = +[NSSet setWithArray:v3];
  [v2 setClasses:v4 forSelector:"voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:" argumentIndex:0 ofReply:0];

  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  v21[3] = objc_opt_class();
  v21[4] = objc_opt_class();
  v5 = +[NSArray arrayWithObjects:v21 count:5];
  id v6 = +[NSSet setWithArray:v5];
  [v2 setClasses:v6 forSelector:"voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:" argumentIndex:1 ofReply:0];

  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v20[2] = objc_opt_class();
  v20[3] = objc_opt_class();
  v20[4] = objc_opt_class();
  id v7 = +[NSArray arrayWithObjects:v20 count:5];
  id v8 = +[NSSet setWithArray:v7];
  [v2 setClasses:v8 forSelector:"voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:" argumentIndex:2 ofReply:0];

  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v19[2] = objc_opt_class();
  id v9 = +[NSArray arrayWithObjects:v19 count:3];
  id v10 = +[NSSet setWithArray:v9];
  [v2 setClasses:v10 forSelector:"voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:" argumentIndex:0 ofReply:1];

  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  v18[2] = objc_opt_class();
  id v11 = +[NSArray arrayWithObjects:v18 count:3];
  id v12 = +[NSSet setWithArray:v11];
  [v2 setClasses:v12 forSelector:"voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:" argumentIndex:1 ofReply:1];

  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  id v13 = +[NSArray arrayWithObjects:v17 count:3];
  id v14 = +[NSSet setWithArray:v13];
  [v2 setClasses:v14 forSelector:"voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:" argumentIndex:0 ofReply:0];

  [v16 setRemoteObjectInterface:v2];
  return v16;
}

+ (id)getCoreSpeechServiceConnection
{
  id v2 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.corespeech.corespeechservices" options:0];
  dispatch_semaphore_t v3 = sub_1000F158C();
  [v2 setRemoteObjectInterface:v3];

  return v2;
}

@end