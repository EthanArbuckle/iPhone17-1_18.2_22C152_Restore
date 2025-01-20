@interface AXCompleteResourceMigrationSimpleTask
+ (id)taskGroupIdentifier;
- (BOOL)_resourceInUseByOtherTechnologies:(id)a3;
- (void)_cleanupVoiceSubscriptions;
- (void)_completeMigrationForLegacyResource:(id)a3 withDownloadedResource:(id)a4;
- (void)_purgeLegacyResource:(id)a3;
- (void)run:(id)a3;
@end

@implementation AXCompleteResourceMigrationSimpleTask

+ (id)taskGroupIdentifier
{
  return @"kAXResourceCacheTaskGroup";
}

- (void)run:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  v5 = AXLogAssetDaemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AXCompleteResMigrationTask: Task did begin", buf, 2u);
  }

  v6 = [(AXSimpleAssetTaskBase *)self trigger];
  v7 = [v6 arguments];
  v8 = [v7 objectForKey:@"kAXResource"];

  v9 = +[TTSAXResourceMigrationUtilities sharedInstance];
  v10 = [v8 voiceId];
  v11 = [v9 legacyIdentifierForUpdatedIdentifierDuringMigration:v10];

  v12 = +[TTSAXResourceManager sharedInstance];
  v13 = [v12 resourceWithVoiceId:v11];

  [(AXCompleteResourceMigrationSimpleTask *)self _completeMigrationForLegacyResource:v13 withDownloadedResource:v8];
  [(AXCompleteResourceMigrationSimpleTask *)self _purgeLegacyResource:v13];
  v14 = +[TTSAXResourceMigrationUtilities sharedInstance];
  unsigned int v15 = [v14 isMigrationComplete];

  if (v15)
  {
    [(AXCompleteResourceMigrationSimpleTask *)self _cleanupVoiceSubscriptions];
    v16 = AXLogAssetDaemon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "AXCompleteResMigrationTask: Completed migration", v19, 2u);
    }
  }
  v17 = AXLogAssetDaemon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "AXCompleteResMigrationTask: Task finished", v18, 2u);
  }

  v4[2](v4, 1);
}

- (void)_purgeLegacyResource:(id)a3
{
  id v4 = a3;
  v5 = AXLogAssetDaemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AXCompleteResMigrationTask: Will purge legacy voice: %@", (uint8_t *)&v11, 0xCu);
  }

  if ([v4 type] == (id)6)
  {
    v6 = +[TTSAXResourceManager sharedInstance];
    v7 = [v4 voiceId];
    [v6 deleteResourceWithVoiceId:v7];
LABEL_12:

    goto LABEL_13;
  }
  if ([v4 type] == (id)7)
  {
    if ([(AXCompleteResourceMigrationSimpleTask *)self _resourceInUseByOtherTechnologies:v4])
    {
      v6 = AXLogAssetDaemon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = [v4 voiceId];
        int v11 = 138412290;
        id v12 = v7;
        v8 = "AXCompleteResMigrationTask: Did not purge legacy vocalizer asset: %@ because it was being used by another technology";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v11, 0xCu);
        goto LABEL_12;
      }
    }
    else
    {
      v9 = +[TTSAXResourceManager sharedInstance];
      v10 = [v4 voiceId];
      [v9 deleteResourceWithVoiceId:v10];

      v6 = AXLogAssetDaemon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = [v4 voiceId];
        int v11 = 138412290;
        id v12 = v7;
        v8 = "AXCompleteResMigrationTask: Purged legacy vocalizer asset with identifier: %@";
        goto LABEL_11;
      }
    }
LABEL_13:
  }
}

- (void)_completeMigrationForLegacyResource:(id)a3 withDownloadedResource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = AXLogAssetDaemon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412546;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "AXCompleteResMigrationTask: Will complete migration of legacy resource: '%@' to downloaded resource: '%@'", (uint8_t *)&v15, 0x16u);
  }

  v8 = +[TTSAXResourceMigrationUtilities sharedInstance];
  [v8 resourceCompletedMigration:v5];

  v9 = AXLogAssetDaemon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = [v6 voiceId];
    int v11 = [v5 voiceId];
    int v15 = 138412546;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "AXCompleteResMigrationTask: Swapping downloaded maui id [%@] for legacy id [%@]", (uint8_t *)&v15, 0x16u);
  }
  id v12 = [v5 voiceId];
  v13 = [v6 voiceId];
  v14 = [v6 primaryLanguage];
  AXSwapSpeechSettingsIdentifiers();
}

- (BOOL)_resourceInUseByOtherTechnologies:(id)a3
{
  id v3 = a3;
  id v4 = AXClientsForSiriResource();
  id v5 = AXLogAssetDaemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 count]);
    int v10 = 138412802;
    id v11 = v3;
    __int16 v12 = 2112;
    v13 = v6;
    __int16 v14 = 2112;
    int v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AXCompleteResMigrationTask: Resource %@ is in use by %@ clients: %@", (uint8_t *)&v10, 0x20u);
  }
  if ((unint64_t)[v4 count] <= 1)
  {
    if ([v4 count] == (id)1)
    {
      v8 = [v4 firstObject];
      unsigned int v7 = [v8 isEqualToString:@"com.apple.accessibility.AccessibilityUIServer"] ^ 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (void)_cleanupVoiceSubscriptions
{
  v2 = AXLogAssetDaemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "AXCompleteResMigrationTask: Will invoke AXCleanupSiriVoiceSubscriptionsSimpleTask to clean up voice subscriptions now", buf, 2u);
  }

  id v3 = +[AXSimpleAssetTaskManager sharedInstance];
  id v4 = +[AXSimpleAssetTaskBase taskIdentifier];
  [v3 invokeTaskById:v4 arguments:&__NSDictionary0__struct];

  id v5 = +[AXSettings sharedInstance];
  id v6 = [v5 selectedSpeechVoiceIdentifiers];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v18;
    uint64_t v12 = kTTSSystemVoiceIdentifierPrefix;
    *(void *)&long long v9 = 138412290;
    long long v16 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        __int16 v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v14, "hasPrefix:", v12, v16, (void)v17))
        {
          int v15 = AXLogAssetDaemon();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            v22 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "AXCompleteResMigrationTask: Failed to clean up nashville identifier: %@", buf, 0xCu);
          }
        }
      }
      id v10 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v10);
  }
}

@end