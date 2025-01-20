@interface AXCleanseUnusedCompactResourcesTask
- (AXCleanseUnusedCompactResourcesTask)initWithPolicy:(id)a3 context:(id)a4;
- (void)_cleanUnusedCompactResources;
@end

@implementation AXCleanseUnusedCompactResourcesTask

- (AXCleanseUnusedCompactResourcesTask)initWithPolicy:(id)a3 context:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)AXCleanseUnusedCompactResourcesTask;
  return [(AXManagedAssetTask *)&v5 initWithName:@"Cleanse Compact Resources" policy:a3 context:a4 block:&stru_1000207A0];
}

- (void)_cleanUnusedCompactResources
{
  v2 = AXLogAssetDaemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "AXCleanseUnusedCompactResourcesTask: Cleaning up unused compact resources", buf, 2u);
  }

  v3 = (void *)TTSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences();
  v4 = +[AXSettings sharedInstance];
  objc_super v5 = [v4 voiceOverLanguageRotorItems];

  v6 = +[AXSettings sharedInstance];
  v7 = [v6 selectedSpeechVoiceIdentifiersForSourceKey:AXSpeechSourceKeyVoiceOver];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v34 objects:v42 count:16];
  v32 = v8;
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v35;
    uint64_t v31 = AXSpeechSourceKeySpeechFeatures;
    uint64_t v30 = AXSpeechSourceKeySwitchControl;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        v14 = +[TTSAXResourceManager sharedInstance];
        v15 = [v14 resourceWithVoiceId:v13];

        v16 = [v15 primaryLanguage];
        if ([v16 isEqualToString:v3]) {
          goto LABEL_9;
        }
        unsigned __int8 v17 = [v5 containsObject:v13];

        if ((v17 & 1) == 0 && [v15 type] == (id)4 && objc_msgSend(v15, "footprint") == (id)3)
        {
          v18 = +[AXSettings sharedInstance];
          v19 = [v18 selectedSpeechVoiceIdentifiersForSourceKey:v31];
          unsigned __int8 v33 = [v19 containsObject:v13];

          v20 = +[AXSettings sharedInstance];
          [v20 selectedSpeechVoiceIdentifiersForSourceKey:v30];
          v22 = v21 = v5;
          unsigned __int8 v23 = [v22 containsObject:v13];

          objc_super v5 = v21;
          id v8 = v32;

          if ((v33 & 1) == 0 && (v23 & 1) == 0)
          {
            v24 = AXLogAssetDaemon();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v41 = v13;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "AXCleanseUnusedCompactResourcesTask: Deleting resource with id: %@", buf, 0xCu);
            }

            v16 = +[TTSAXResourceManager sharedInstance];
            [v16 deleteResourceWithVoiceId:v13];
LABEL_9:
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v10);
  }

  v25 = AXLogAssetDaemon();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "AXCleanseUnusedCompactResourcesTask: Will invoke AXUpdateResourcesSimpleTask now", buf, 2u);
  }

  v26 = +[AXSimpleAssetTaskManager sharedInstance];
  v27 = +[AXSimpleAssetTaskBase taskIdentifier];
  CFStringRef v38 = @"kAXActionType";
  v39 = &off_1000219F8;
  v28 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  [v26 invokeTaskById:v27 arguments:v28];

  [(AXManagedAssetTask *)self _completeWithResult:0];
}

@end