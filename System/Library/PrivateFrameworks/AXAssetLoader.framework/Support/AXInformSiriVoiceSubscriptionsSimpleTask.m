@interface AXInformSiriVoiceSubscriptionsSimpleTask
- (void)run:(id)a3;
@end

@implementation AXInformSiriVoiceSubscriptionsSimpleTask

- (void)run:(id)a3
{
  id v4 = a3;
  v5 = AXLogAssetDaemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AXInformSiriSubsTask: Task did begin", (uint8_t *)&buf, 2u);
  }

  v6 = [(AXSimpleAssetTaskBase *)self trigger];
  v7 = [v6 arguments];
  v8 = [v7 objectForKeyedSubscript:@"kAXVoiceId"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v10 = [(AXSimpleAssetTaskBase *)self trigger];
    v11 = [v10 arguments];
    v12 = [v11 objectForKeyedSubscript:@"kAXVoiceId"];
  }
  else
  {
    v12 = 0;
  }
  v13 = [(AXSimpleAssetTaskBase *)self trigger];
  v14 = [v13 arguments];
  v15 = [v14 objectForKeyedSubscript:@"kAXVoiceSubscriptionAddition"];
  unsigned __int8 v16 = [v15 BOOLValue];

  if (v12)
  {
    v17 = +[TTSAXResourceManager sharedInstance];
    v18 = [v17 resourceWithVoiceId:v12];

    if (v18)
    {
      id v19 = objc_alloc_init((Class)SiriTTSDaemonSession);
      v20 = [v18 primaryLanguage];
      v21 = AXSiriTTSSynthesisVoiceFromVoiceIdentifier();

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v43 = 0x3032000000;
      v44 = sub_100008004;
      v45 = sub_100008014;
      id v46 = +[NSMutableArray array];
      v22 = AXLogAssetDaemon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = +[NSNumber numberWithInt:v19 == 0];
        *(_DWORD *)v40 = 138412290;
        v41 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "AXInformSiriSubsTask: Asking SiriTTSDaemonSession for auto-downloaded voices %@", v40, 0xCu);
      }
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10000801C;
      v34[3] = &unk_1000209F8;
      p_long long buf = &buf;
      unsigned __int8 v39 = v16;
      id v24 = v21;
      id v35 = v24;
      id v25 = v19;
      id v36 = v25;
      id v37 = v4;
      [v25 subscribedVoicesWithReply:v34];

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v30 = AXLogAssetDaemon();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "AXInformSiriSubsTask: No resource found for voiceId: %@", (uint8_t *)&buf, 0xCu);
      }

      v31 = +[AXAssetMetadataStore store];
      v32 = +[NSDate date];
      [v31 setValue:v32 forKey:@"InformSiriVoiceSubscriptionsTaskFailed" forAssetType:kAXTTSResourceAssetType];

      v33 = AXLogAssetDaemon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "AXInformSiriSubsTask: Task finishing with failure", (uint8_t *)&buf, 2u);
      }

      (*((void (**)(id, uint64_t))v4 + 2))(v4, 2);
    }
  }
  else
  {
    v26 = AXLogAssetDaemon();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "AXInformSiriSubsTask: Unable to subscribe to nil voiceId", (uint8_t *)&buf, 2u);
    }

    v27 = +[AXAssetMetadataStore store];
    v28 = +[NSDate date];
    [v27 setValue:v28 forKey:@"InformSiriVoiceSubscriptionsTaskFailed" forAssetType:kAXTTSResourceAssetType];

    v29 = AXLogAssetDaemon();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "AXInformSiriSubsTask: Task finishing with failure", (uint8_t *)&buf, 2u);
    }

    (*((void (**)(id, uint64_t))v4 + 2))(v4, 2);
  }
}

@end