@interface AXDeleteCompactResourceSimpleTask
- (void)run:(id)a3;
@end

@implementation AXDeleteCompactResourceSimpleTask

- (void)run:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  v5 = AXLogAssetDaemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v30) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AXDeleteCompactResTask: Task did begin", (uint8_t *)&v30, 2u);
  }

  v6 = [(AXSimpleAssetTaskBase *)self trigger];
  v7 = [v6 arguments];
  v8 = [v7 objectForKeyedSubscript:@"kAXVoiceId"];

  v9 = +[TTSAXResourceManager sharedInstance];
  v10 = [v9 resourceWithVoiceId:v8];

  v11 = (void *)TTSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences();
  v12 = [v10 primaryLanguage];
  unsigned int v13 = [v12 isEqualToString:v11];

  if (v13)
  {
    v14 = AXLogAssetDaemon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v30 = 138412290;
      v31 = v8;
      v15 = "AXDeleteCompactResTask: Unable to delete compact identifier %@ because it is in use by the system spoken language.";
      v16 = v14;
      uint32_t v17 = 12;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v30, v17);
    }
  }
  else
  {
    v18 = +[AXSettings sharedInstance];
    v19 = [v18 selectedSpeechVoiceIdentifiersForSourceKey:AXSpeechSourceKeySpeechFeatures];
    unsigned int v20 = [v19 containsObject:v8];

    v21 = +[AXSettings sharedInstance];
    v22 = [v21 selectedSpeechVoiceIdentifiersForSourceKey:AXSpeechSourceKeySwitchControl];
    unsigned int v23 = [v22 containsObject:v8];

    v24 = AXLogAssetDaemon();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
    if (v20 & 1) != 0 || (v23)
    {
      if (v25)
      {
        int v30 = 138412802;
        v31 = v8;
        __int16 v32 = 1024;
        unsigned int v33 = v20;
        __int16 v34 = 1024;
        unsigned int v35 = v23;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "AXDeleteCompactResTask: Unable to delete compact identifier %@ because it is in use by Spoken Content: %i Switch Control: %i", (uint8_t *)&v30, 0x18u);
      }
    }
    else
    {
      if (v25)
      {
        int v30 = 138412290;
        v31 = v8;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "AXDeleteCompactResTask: Will delete resource: %@", (uint8_t *)&v30, 0xCu);
      }

      v26 = +[TTSAXResourceManager sharedInstance];
      [v26 deleteResourceWithVoiceId:v8];

      v27 = AXLogAssetDaemon();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        LOWORD(v30) = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "AXDeleteCompactResTask: Will invoke task AXUpdateResourcesSimpleTask to update resources now", (uint8_t *)&v30, 2u);
      }

      v24 = +[AXSimpleAssetTaskManager sharedInstance];
      v28 = +[AXSimpleAssetTaskBase taskIdentifier];
      CFStringRef v36 = @"kAXActionType";
      v37 = &off_100021A40;
      v29 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      [v24 invokeTaskById:v28 arguments:v29];
    }
    v14 = AXLogAssetDaemon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30) = 0;
      v15 = "AXDeleteCompactResTask: Task finishing";
      v16 = v14;
      uint32_t v17 = 2;
      goto LABEL_17;
    }
  }

  v4[2](v4, 1);
}

@end