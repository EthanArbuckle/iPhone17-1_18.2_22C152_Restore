@interface AXUpdateSiriResourcesSimpleTask
+ (id)triggers;
- (void)run:(id)a3;
@end

@implementation AXUpdateSiriResourcesSimpleTask

+ (id)triggers
{
  v2 = +[AXSimpleAssetTaskTrigger withFirstBootType];
  v3 = +[AXSimpleAssetTaskTrigger withNotificationName:@"com.apple.ttsasset.NewAssetNotification", v2];
  v9[1] = v3;
  v4 = +[AXSimpleAssetTaskTrigger withNotificationName:@"com.apple.trial.NamespaceUpdate.SIRI_TEXT_TO_SPEECH"];
  v9[2] = v4;
  v5 = +[AXSimpleAssetTaskTrigger withNotificationName:@"com.apple.MobileAsset.VoiceServices.GryphonVoice.ma.new-asset-installed"];
  v9[3] = v5;
  v6 = +[AXSimpleAssetTaskTrigger withNotificationName:@"com.apple.MobileAsset.VoiceServices.CustomVoice.ma.new-asset-installed"];
  v9[4] = v6;
  v7 = +[NSArray arrayWithObjects:v9 count:5];

  return v7;
}

- (void)run:(id)a3
{
  v24 = (void (**)(id, uint64_t))a3;
  v3 = AXLogAssetDaemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AXUpdateSiriTask: Task did begin", buf, 2u);
  }

  v4 = AXLogAssetDaemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "AXUpdateSiriTask: Will refresh cache for type: TTSAXResourceManagerTypeSiri", buf, 2u);
  }

  v5 = +[TTSAXResourceManager sharedInstance];
  v6 = [v5 refreshResourcesCacheForManagerType:2];

  v7 = AXLogAssetDaemon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v6 count];
    *(_DWORD *)buf = 134217984;
    id v33 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "AXUpdateSiriTask: Resource changes after refresh: %ld", buf, 0xCu);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v15 = AXLogAssetDaemon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v9;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "AXUpdateSiriTask: Resource changes after refresh: %@", buf, 0xCu);
        }

        if ([v14 isInstalled])
        {
          v16 = +[TTSAXResourceMigrationUtilities sharedInstance];
          unsigned int v17 = [v16 resourceNeedsMigration:v14];

          if (v17)
          {
            v18 = AXLogAssetDaemon();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              v19 = [v14 voiceId];
              *(_DWORD *)buf = 138412290;
              id v33 = v19;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "AXUpdateSiriTask: Resource needs migration: '%@'. Will invoke AXCompleteResourceMigrationSimpleTask now.", buf, 0xCu);
            }
            CFStringRef v29 = @"kAXResource";
            v30 = v14;
            v20 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
            +[AXSimpleAssetTaskBase invokeWithArguments:v20];
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v11);
  }

  v21 = +[AXAssetMetadataStore store];
  v22 = +[NSDate date];
  [v21 setValue:v22 forKey:@"UpdateSiriVoicesTaskSuccessful" forAssetType:kAXTTSResourceAssetType];

  v23 = AXLogAssetDaemon();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "AXUpdateSiriTask: Task finishing", buf, 2u);
  }

  v24[2](v24, 1);
}

@end