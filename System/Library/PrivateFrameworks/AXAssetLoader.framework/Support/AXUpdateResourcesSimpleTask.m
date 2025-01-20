@interface AXUpdateResourcesSimpleTask
+ (id)taskGroupIdentifier;
+ (id)triggers;
- (void)run:(id)a3;
@end

@implementation AXUpdateResourcesSimpleTask

+ (id)taskGroupIdentifier
{
  return @"kAXResourceCacheTaskGroup";
}

+ (id)triggers
{
  v2 = +[AXSimpleAssetTaskTrigger withNotificationName:@"com.apple.MobileAsset.TTSAXResourceModelAssets.ma.new-asset-installed"];
  v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (void)run:(id)a3
{
  v43 = (void (**)(id, uint64_t))a3;
  v4 = AXLogAssetDaemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "AXUpdateResTask: Task did begin", buf, 2u);
  }

  v5 = [(AXSimpleAssetTaskBase *)self trigger];
  v6 = [v5 arguments];
  v7 = [v6 objectForKeyedSubscript:@"kAXActionType"];

  if (!v7)
  {
    uint64_t v15 = 1;
LABEL_10:
    uint64_t v14 = 1;
    goto LABEL_11;
  }
  v8 = [(AXSimpleAssetTaskBase *)self trigger];
  v9 = [v8 arguments];
  v10 = [v9 objectForKeyedSubscript:@"kAXActionType"];
  signed int v11 = [v10 intValue];

  if (v11 != 2)
  {
    uint64_t v15 = v11;
    goto LABEL_10;
  }
  v12 = AXLogAssetDaemon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "AXUpdateResTask: Will purge / reload all components", buf, 2u);
  }

  v13 = +[TTSSynthesisProviderVoiceManager sharedInstance];
  [v13 purgeAndReloadAllComponents];

  uint64_t v14 = 3;
  uint64_t v15 = 2;
LABEL_11:
  v16 = AXLogAssetDaemon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v54 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "AXUpdateResTask: Will refresh cache for type: %ld", buf, 0xCu);
  }

  v17 = +[TTSAXResourceManager sharedInstance];
  v18 = [v17 refreshResourcesCacheForManagerType:v14];

  v19 = AXLogAssetDaemon();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = [v18 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v54 = (uint64_t)v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "AXUpdateResTask: Resource changes after refresh: %ld", buf, 0xCu);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v21 = v18;
  id v22 = [v21 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v45;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v45 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if ((objc_msgSend(v26, "isInstalled", v43) & 1) == 0)
        {
          if ([v26 type] == (id)3)
          {
            if (!v15) {
              goto LABEL_26;
            }
          }
          else
          {
            id v27 = [v26 type];
            if (!v15 && v27 == (id)10)
            {
LABEL_26:
              v28 = AXLogAssetDaemon();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                v29 = [v26 voiceId];
                *(_DWORD *)buf = 138412290;
                uint64_t v54 = (uint64_t)v29;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "AXUpdateResTask: Siri resource being deleted. Will invoke AXInformSiriVoiceSubscriptionsSimpleTask to begin update-subscription task now. %@", buf, 0xCu);
              }
              v30 = +[AXSimpleAssetTaskManager sharedInstance];
              v31 = +[AXSimpleAssetTaskBase taskIdentifier];
              v50[0] = @"kAXVoiceId";
              v32 = [v26 voiceId];
              v50[1] = @"kAXVoiceSubscriptionAddition";
              v51[0] = v32;
              v51[1] = &__kCFBooleanFalse;
              v33 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
              [v30 invokeTaskById:v31 arguments:v33];

              [v26 isInstalled];
              continue;
            }
          }
        }
        unsigned __int8 v34 = [v26 isInstalled];
        if (v15 == 1 && (v34 & 1) != 0)
        {
          v35 = +[TTSAXResourceMigrationUtilities sharedInstance];
          unsigned int v36 = [v35 resourceNeedsMigration:v26];

          if (v36)
          {
            v37 = AXLogAssetDaemon();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              v38 = [v26 voiceId];
              *(_DWORD *)buf = 138412290;
              uint64_t v54 = (uint64_t)v38;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "AXUpdateResTask: Resource needs migration: '%@'. Will invoke AXCompleteResourceMigrationSimpleTask now.", buf, 0xCu);
            }
            CFStringRef v48 = @"kAXResource";
            v49 = v26;
            v39 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
            +[AXSimpleAssetTaskBase invokeWithArguments:v39];
          }
        }
      }
      id v23 = [v21 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v23);
  }

  v40 = +[AXAssetMetadataStore store];
  v41 = +[NSDate date];
  [v40 setValue:v41 forKey:@"UpdateResourcesTaskSuccessful" forAssetType:kAXTTSResourceAssetType];

  v42 = AXLogAssetDaemon();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "AXUpdateResTask: Task finishing", buf, 2u);
  }

  v43[2](v43, 1);
}

@end