@interface AXMigrateResourcesSimpleTask
+ (id)taskGroupIdentifier;
+ (id)triggers;
- (AXAssetController)assetController;
- (AXDispatchTimer)timer;
- (id)completion;
- (int64_t)attemptCount;
- (void)_callCompletion:(unint64_t)a3;
- (void)_migrateNashvilleToMaui;
- (void)_retryAndBackOff;
- (void)run:(id)a3;
- (void)setAssetController:(id)a3;
- (void)setAttemptCount:(int64_t)a3;
- (void)setCompletion:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation AXMigrateResourcesSimpleTask

+ (id)taskGroupIdentifier
{
  return @"kAXResourceCacheTaskGroup";
}

+ (id)triggers
{
  return &__NSArray0__struct;
}

- (void)run:(id)a3
{
  id v4 = a3;
  v5 = AXLogAssetDaemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AXMigrateResTask: Task did begin", buf, 2u);
  }

  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v7 = objc_alloc((Class)AXDispatchTimer);
  dispatch_queue_t v8 = dispatch_queue_create("retryQueue", v6);
  id v9 = [v7 initWithTargetSerialQueue:v8];
  [(AXMigrateResourcesSimpleTask *)self setTimer:v9];

  [(AXMigrateResourcesSimpleTask *)self setCompletion:v4];
  uint64_t v10 = +[AXTTSResourceAssetPolicy policy];
  v11 = +[AXAssetController assetControllerWithPolicy:v10 qosClass:25 shouldRefreshForAssetInstallNotifications:0];
  [(AXMigrateResourcesSimpleTask *)self setAssetController:v11];

  v12 = +[TTSAXResourceMigrationUtilities sharedInstance];
  LOBYTE(v10) = [v12 isMigrationComplete];

  v13 = AXLogAssetDaemon();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v14)
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "AXMigrateResTask: Task finished", v22, 2u);
    }

    [(AXMigrateResourcesSimpleTask *)self _callCompletion:1];
  }
  else
  {
    if (v14)
    {
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "AXMigrateResTask: Migration not complete", v26, 2u);
    }

    v15 = [(AXMigrateResourcesSimpleTask *)self assetController];
    unsigned __int8 v16 = [v15 isAssetCatalogInstalled];

    v17 = AXLogAssetDaemon();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v16)
    {
      if (v18)
      {
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "AXMigrateResTask: Installed catalog was found. Will refresh cache for type: TTSAXResourceManagerTypeAccessibility", v24, 2u);
      }

      v19 = +[TTSAXResourceManager sharedInstance];
      id v20 = [v19 refreshResourcesCacheForManagerType:1];

      v21 = AXLogAssetDaemon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "AXMigrateResTask: Will begin migration of Nashville to Maui", v23, 2u);
      }

      [(AXMigrateResourcesSimpleTask *)self _migrateNashvilleToMaui];
    }
    else
    {
      if (v18)
      {
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "AXMigrateResTask: No installed catalog yet. Calling _retryAndBackOff", v25, 2u);
      }

      [(AXMigrateResourcesSimpleTask *)self _retryAndBackOff];
    }
  }
}

- (void)_callCompletion:(unint64_t)a3
{
  v5 = [(AXMigrateResourcesSimpleTask *)self completion];

  if (v5)
  {
    v6 = [(AXMigrateResourcesSimpleTask *)self completion];
    v6[2](v6, a3);
  }
  [(AXMigrateResourcesSimpleTask *)self setCompletion:0];
}

- (void)_migrateNashvilleToMaui
{
  v2 = +[AXSettings sharedInstance];
  v3 = [v2 selectedSpeechVoiceIdentifiersWithLanguageSource];

  v59 = +[NSMutableDictionary dictionary];
  id v4 = AXLogAssetDaemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v83 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "AXMigrateResTask: Beginning nashville to maui migration with selected voices: %@", buf, 0xCu);
  }

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = [v3 allKeys];
  v5 = &_s12TextToSpeech11TTSSettingsC0C13TracingClientVMa_ptr;
  id v54 = [obj countByEnumeratingWithState:&v73 objects:v89 count:16];
  if (v54)
  {
    uint64_t v52 = *(void *)v74;
    uint64_t v56 = AXSpeechSourceKeyVoiceOver;
    v6 = &_s12TextToSpeech11TTSSettingsC0C13TracingClientVMa_ptr;
    v53 = v3;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v74 != v52) {
          objc_enumerationMutation(obj);
        }
        uint64_t v55 = v7;
        v60 = *(void **)(*((void *)&v73 + 1) + 8 * v7);
        dispatch_queue_t v8 = objc_msgSend(v3, "objectForKeyedSubscript:");
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v58 = [v8 allKeys];
        id v64 = [v58 countByEnumeratingWithState:&v69 objects:v88 count:16];
        if (v64)
        {
          uint64_t v63 = *(void *)v70;
          v57 = v8;
          do
          {
            id v9 = 0;
            do
            {
              if (*(void *)v70 != v63) {
                objc_enumerationMutation(v58);
              }
              uint64_t v10 = *(void *)(*((void *)&v69 + 1) + 8 * (void)v9);
              v11 = [v8 objectForKeyedSubscript:v10];
              v12 = [v5[216] sharedInstance];
              v13 = [v12 updatedIdentifierForLegacyIdentifier:v11 withLanguageCode:v10];

              BOOL v14 = [v6[215] sharedInstance];
              v15 = [v14 resourceWithVoiceId:v11];

              if (!v15)
              {
                BOOL v18 = [v6[215] sharedInstance];
                v19 = [v18 resourceWithVoiceId:v13];

                v61 = v19;
                id v20 = [v19 primaryLanguage];
                unsigned int v21 = [v20 isEqualToString:@"ar-001"];

                if (v21) {
                  v22 = @"ar-SA";
                }
                else {
                  v22 = 0;
                }
                v23 = AXLogAssetDaemon();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412802;
                  v83 = v11;
                  __int16 v84 = 2112;
                  v85 = v13;
                  __int16 v86 = 2112;
                  uint64_t v87 = v10;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "AXMigrateResTask: Swapping on disk nashville VO id [%@] for maui id [%@] with language [%@]", buf, 0x20u);
                }

                v62 = v13;
                AXSwapSpeechSettingsIdentifiers();
                if (v21 && ([(__CFString *)v22 isEqualToString:v10] & 1) == 0) {
                  AXSwapSpeechSettingsIdentifiers();
                }
                v15 = 0;
                if ([v60 integerValue] == (id)1
                  || [v60 isEqualToString:v56])
                {
                  v24 = +[AXSettings sharedInstance];
                  v25 = [v24 voiceOverLanguageRotorItems];

                  long long v67 = 0u;
                  long long v68 = 0u;
                  long long v65 = 0u;
                  long long v66 = 0u;
                  id v26 = v25;
                  id v27 = [v26 countByEnumeratingWithState:&v65 objects:v81 count:16];
                  if (v27)
                  {
                    id v28 = v27;
                    uint64_t v29 = *(void *)v66;
                    while (2)
                    {
                      for (i = 0; i != v28; i = (char *)i + 1)
                      {
                        if (*(void *)v66 != v29) {
                          objc_enumerationMutation(v26);
                        }
                        v31 = *(void **)(*((void *)&v65 + 1) + 8 * i);
                        v32 = [v31 objectForKeyedSubscript:@"Enabled"];
                        unsigned int v33 = [v32 BOOLValue];

                        v34 = [v31 objectForKeyedSubscript:@"RotorItem"];
                        v35 = v34;
                        if (v33 && [v34 isEqualToString:v10])
                        {
                          v40 = +[AXSimpleAssetTaskManager sharedInstance];
                          v41 = +[AXSimpleAssetTaskBase taskIdentifier];
                          CFStringRef v79 = @"kAXVoiceId";
                          v80 = v62;
                          v42 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
                          [v40 invokeTaskById:v41 arguments:v42];

                          unsigned __int8 v16 = v62;
                          v36 = v26;
                          v5 = &_s12TextToSpeech11TTSSettingsC0C13TracingClientVMa_ptr;
                          v15 = 0;
                          goto LABEL_48;
                        }
                      }
                      id v28 = [v26 countByEnumeratingWithState:&v65 objects:v81 count:16];
                      if (v28) {
                        continue;
                      }
                      break;
                    }
                    v36 = v26;
                    v5 = &_s12TextToSpeech11TTSSettingsC0C13TracingClientVMa_ptr;
                    unsigned __int8 v16 = v62;
                    v15 = 0;
                  }
                  else
                  {
                    v36 = v26;
                    unsigned __int8 v16 = v13;
                  }
                }
                else
                {
                  v36 = +[AXSimpleAssetTaskManager sharedInstance];
                  id v26 = +[AXSimpleAssetTaskBase taskIdentifier];
                  unsigned __int8 v16 = v13;
                  CFStringRef v77 = @"kAXVoiceId";
                  v78 = v13;
                  v35 = +[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
                  [v36 invokeTaskById:v26 arguments:v35];
LABEL_48:
                }
                v6 = &_s12TextToSpeech11TTSSettingsC0C13TracingClientVMa_ptr;
                dispatch_queue_t v8 = v57;
                v39 = v61;
                goto LABEL_50;
              }
              if ([v15 type] == (id)3)
              {
                unsigned __int8 v16 = v13;
                unsigned int v17 = [v13 isEqualToString:v11] ^ 1;
              }
              else
              {
                unsigned int v17 = 0;
                unsigned __int8 v16 = v13;
              }
              if ([v15 type] == (id)6 || objc_msgSend(v15, "type") == (id)7)
              {
LABEL_39:
                v37 = AXLogAssetDaemon();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v83 = v16;
                  __int16 v84 = 2112;
                  v85 = v11;
                  _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "AXMigrateResTask: Downloading maui id [%@] for legacy id [%@]", buf, 0x16u);
                }

                v38 = [v11 lowercaseString];
                [v59 setObject:v16 forKeyedSubscript:v38];

                v39 = [v6[215] sharedInstance];
                [v39 downloadResourceWithVoiceId:v16 userInitiated:0];
LABEL_50:

                goto LABEL_51;
              }
              if ([v15 type] == (id)2)
              {
                if (([v15 isInstalled] ^ 1 | v17)) {
                  goto LABEL_39;
                }
              }
              else if (v17)
              {
                goto LABEL_39;
              }
LABEL_51:

              id v9 = (char *)v9 + 1;
            }
            while (v9 != v64);
            id v43 = [v58 countByEnumeratingWithState:&v69 objects:v88 count:16];
            id v64 = v43;
          }
          while (v43);
        }

        uint64_t v7 = v55 + 1;
        v3 = v53;
      }
      while ((id)(v55 + 1) != v54);
      id v54 = [obj countByEnumeratingWithState:&v73 objects:v89 count:16];
    }
    while (v54);
  }

  id v44 = [v59 count];
  v45 = [v5[216] sharedInstance];
  v46 = v45;
  if (v44)
  {
    [v45 writeVoiceIdentifiersToMigrateToPreferences:v59];
  }
  else
  {
    [v45 writeIsMigrationCompleteToPreferences:&off_100021A10];

    v47 = AXLogAssetDaemon();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "AXMigrateResTask: Will invoke AXCleanupSiriVoiceSubscriptionsSimpleTask now", buf, 2u);
    }

    v46 = +[AXSimpleAssetTaskManager sharedInstance];
    v48 = +[AXSimpleAssetTaskBase taskIdentifier];
    [v46 invokeTaskById:v48 arguments:&__NSDictionary0__struct];
  }
  v49 = AXLogAssetDaemon();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "AXMigrateResTask: Task finished", buf, 2u);
  }

  [(AXMigrateResourcesSimpleTask *)self _callCompletion:1];
}

- (void)_retryAndBackOff
{
  objc_initWeak(&location, self);
  v3 = AXLogAssetDaemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AXMigrateResTask: Will force-refresh catalog for AXTTSResourceAssetPolicy. timeout=60s", buf, 2u);
  }

  id v4 = [(AXMigrateResourcesSimpleTask *)self assetController];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004538;
  v5[3] = &unk_100020810;
  objc_copyWeak(&v6, &location);
  [v4 refreshAssetsByForceUpdatingCatalog:1 updatingCatalogIfNeeded:0 catalogRefreshOverrideTimeout:&off_100021A28 completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (AXAssetController)assetController
{
  return self->_assetController;
}

- (void)setAssetController:(id)a3
{
}

- (int64_t)attemptCount
{
  return self->_attemptCount;
}

- (void)setAttemptCount:(int64_t)a3
{
  self->_attemptCount = a3;
}

- (AXDispatchTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end