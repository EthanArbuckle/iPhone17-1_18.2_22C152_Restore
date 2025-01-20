@interface AFOpportuneSpeakingModuleDataCollection
+ (id)sharedCollector;
- (AFOpportuneSpeakingModuleDataCollection)init;
- (void)_deleteSpeakablesOlderThan:(id)a3;
- (void)logFeedbackOfType:(int64_t)a3 forSpeakableId:(id)a4 withModelId:(id)a5;
- (void)logInteractionEvents:(id)a3 forSpeakableId:(id)a4;
- (void)logRecommendedAction:(id)a3 forSpeakableId:(id)a4 withModelId:(id)a5;
- (void)logSpeakable:(id)a3 forContact:(id)a4 withModelId:(id)a5 withFeatures:(id)a6 withScore:(float)a7;
@end

@implementation AFOpportuneSpeakingModuleDataCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakableMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_deleteSpeakablesOlderThan:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = [(NSMutableDictionary *)self->_speakableMap allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v20;
    v10 = &_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode_onceToken;
    *(void *)&long long v7 = 136315650;
    long long v17 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v13 = -[NSMutableDictionary objectForKey:](self->_speakableMap, "objectForKey:", v12, v17);
        if ([v13 isOlderThan:v4])
        {
          v14 = v10[64];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            log = v14;
            v15 = [v13 identifier];
            v16 = [v13 date];
            *(_DWORD *)buf = v17;
            v24 = "-[AFOpportuneSpeakingModuleDataCollection _deleteSpeakablesOlderThan:]";
            __int16 v25 = 2112;
            v26 = v15;
            __int16 v27 = 2112;
            v28 = v16;
            _os_log_debug_impl(&dword_19CF1D000, log, OS_LOG_TYPE_DEBUG, "%s Deleting sanitized speakable:%@ date:%@", buf, 0x20u);

            v10 = &_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode_onceToken;
          }
          [(NSMutableDictionary *)self->_speakableMap removeObjectForKey:v12];
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v8);
  }
}

- (void)logInteractionEvents:(id)a3 forSpeakableId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__AFOpportuneSpeakingModuleDataCollection_logInteractionEvents_forSpeakableId___block_invoke;
  block[3] = &unk_1E592C338;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __79__AFOpportuneSpeakingModuleDataCollection_logInteractionEvents_forSpeakableId___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  v3 = (void *)v2;
  if (v2)
  {
    uint64_t v8 = (void *)v2;
    int v4 = AFSpokenNotificationDataCollectionEnabled();
    v3 = v8;
    if (v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v5 setObject:a1[6] forKey:@"InteractionEvents"];
      id v6 = [v8 identifier];
      [v5 setObject:v6 forKey:@"SpeakableId"];

      id v7 = [getDCLongRunningLogClass() sharedInstance];
      [v7 addEventWithType:@"InteractionInfo" eventDataAsDictionary:v5];

      v3 = v8;
    }
  }
}

- (void)logRecommendedAction:(id)a3 forSpeakableId:(id)a4 withModelId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__AFOpportuneSpeakingModuleDataCollection_logRecommendedAction_forSpeakableId_withModelId___block_invoke;
  v15[3] = &unk_1E592C220;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

void __91__AFOpportuneSpeakingModuleDataCollection_logRecommendedAction_forSpeakableId_withModelId___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  v3 = (void *)v2;
  if (v2)
  {
    id v8 = (void *)v2;
    int v4 = AFSpokenNotificationDataCollectionEnabled();
    v3 = v8;
    if (v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v5 setObject:a1[6] forKey:@"RecommendedAction"];
      [v5 setObject:a1[7] forKey:@"ModelId"];
      id v6 = [v8 identifier];
      [v5 setObject:v6 forKey:@"SpeakableId"];

      id v7 = [getDCLongRunningLogClass() sharedInstance];
      [v7 addEventWithType:@"RecommendationInfo" eventDataAsDictionary:v5];

      v3 = v8;
    }
  }
}

- (void)logFeedbackOfType:(int64_t)a3 forSpeakableId:(id)a4 withModelId:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__AFOpportuneSpeakingModuleDataCollection_logFeedbackOfType_forSpeakableId_withModelId___block_invoke;
  v13[3] = &unk_1E5929398;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __88__AFOpportuneSpeakingModuleDataCollection_logFeedbackOfType_forSpeakableId_withModelId___block_invoke(void *a1)
{
  id v8 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  if (v8 && AFSpokenNotificationDataCollectionEnabled())
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    unint64_t v3 = a1[7];
    if (v3 > 2) {
      int v4 = @"Unknown";
    }
    else {
      int v4 = off_1E59281F8[v3];
    }
    id v5 = v4;
    [v2 setObject:v5 forKey:@"Feedback"];

    [v2 setObject:a1[6] forKey:@"ModelId"];
    id v6 = [v8 identifier];
    [v2 setObject:v6 forKey:@"SpeakableId"];

    id v7 = [getDCLongRunningLogClass() sharedInstance];
    [v7 addEventWithType:@"FeedbackInfo" eventDataAsDictionary:v2];
  }
}

- (void)logSpeakable:(id)a3 forContact:(id)a4 withModelId:(id)a5 withFeatures:(id)a6 withScore:(float)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  queue = self->_queue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __102__AFOpportuneSpeakingModuleDataCollection_logSpeakable_forContact_withModelId_withFeatures_withScore___block_invoke;
  v21[3] = &unk_1E5926590;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  float v26 = a7;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(queue, v21);
}

void __102__AFOpportuneSpeakingModuleDataCollection_logSpeakable_forContact_withModelId_withFeatures_withScore___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  unint64_t v3 = [*(id *)(a1 + 40) speakableIdentifier];
  id v17 = [v2 objectForKey:v3];

  if (!v17)
  {
    int v4 = [AFOpportuneSpeakingModuleDataCollectionSanitizedSpeakable alloc];
    id v5 = [*(id *)(a1 + 40) speakableDate];
    id v17 = [(AFOpportuneSpeakingModuleDataCollectionSanitizedSpeakable *)v4 initWithDate:v5];

    id v6 = *(void **)(*(void *)(a1 + 32) + 16);
    id v7 = [*(id *)(a1 + 40) speakableIdentifier];
    [v6 setObject:v17 forKey:v7];
  }
  if (AFSpokenNotificationDataCollectionEnabled())
  {
    if ([getDCUtilsClass() isCurrentProcess:@"assistantd"])
    {
      id v8 = [getDCManagerClass() sharedInstance];
      [v8 markSessionForUpload:mach_absolute_time() withReason:@"NotificationEvent"];
    }
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([*(id *)(a1 + 48) length]) {
      id v10 = *(__CFString **)(a1 + 48);
    }
    else {
      id v10 = @"NOID";
    }
    [v9 setObject:v10 forKey:@"ContactId"];
    [v9 setObject:*(void *)(a1 + 56) forKey:@"ModelId"];
    id v11 = [(AFOpportuneSpeakingModuleDataCollectionSanitizedSpeakable *)v17 identifier];
    [v9 setObject:v11 forKey:@"SpeakableId"];

    [v9 setObject:*(void *)(a1 + 64) forKey:@"SpeakableFeatures"];
    LODWORD(v12) = *(_DWORD *)(a1 + 72);
    id v13 = [MEMORY[0x1E4F28ED0] numberWithFloat:v12];
    [v9 setObject:v13 forKey:@"SpeakableScore"];

    id v14 = [getDCLongRunningLogClass() sharedInstance];
    [v14 addEventWithType:@"SpeakableInfo" eventDataAsDictionary:v9];
  }
  id v15 = *(void **)(a1 + 32);
  int64_t v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-600.0];
  [v15 _deleteSpeakablesOlderThan:v16];
}

- (AFOpportuneSpeakingModuleDataCollection)init
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)AFOpportuneSpeakingModuleDataCollection;
  id v2 = [(AFOpportuneSpeakingModuleDataCollection *)&v25 init];
  if (v2)
  {
    unint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("OSMDataCollection", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    speakableMap = v2->_speakableMap;
    v2->_speakableMap = v6;

    if (DataCollectionServicesLibrary_sOnce != -1) {
      dispatch_once(&DataCollectionServicesLibrary_sOnce, &__block_literal_global_109_10519);
    }
    if (DataCollectionServicesLibrary_sLib)
    {
      id v8 = (void *)AFSiriLogContextService;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
      {
        long long v21 = (void *)MEMORY[0x1E4F28F80];
        id v22 = v8;
        id v23 = [v21 processInfo];
        id v24 = [v23 processName];
        *(_DWORD *)buf = 136315394;
        __int16 v27 = "-[AFOpportuneSpeakingModuleDataCollection init]";
        __int16 v28 = 2112;
        v29 = v24;
        _os_log_debug_impl(&dword_19CF1D000, v22, OS_LOG_TYPE_DEBUG, "%s Configuring data collection manager for process: %@", buf, 0x16u);
      }
      id v9 = [getDCConfigurationClass() sharedConfiguration];
      [v9 setPrimaryProcess:@"assistantd"];
      [v9 setPackingPolicy:getDCPackingPolicyTypeOnTimer()];
      [v9 setPackagingTimeInterval:3600.0];
      [v9 setLogWriteTimeInterval:300.0];
      [v9 setOutputDirectoryPath:@"/tmp/OSM/"];
      [v9 setUploadUrl:@"https://osmdatacollectionproxy.usspk02.orchard.apple.com/upload"];
      id v10 = [getDCLongRunningLogClass() sharedInstance];
      [v9 addLogger:v10 toProcess:@"assistantd"];

      id v11 = [getDCLongRunningLogClass() sharedInstance];
      [v9 addLogger:v11 toProcess:@"OpportuneSpeakingModelService"];

      id DCRuleClass = getDCRuleClass();
      id v13 = [NSString stringWithFormat:@"process-%@", @"assistantd"];
      id v14 = [DCRuleClass getNearestFileAfterMarkWithPrefix:v13];
      [v9 addPackingRule:v14];

      id v15 = getDCRuleClass();
      int64_t v16 = [NSString stringWithFormat:@"process-%@", @"OpportuneSpeakingModelService"];
      id v17 = [v15 getNearestFileAfterMarkWithPrefix:v16];
      [v9 addPackingRule:v17];

      id v18 = [getDCManagerClass() sharedInstance];
      [v18 setupWithConfiguration:v9];

      uint64_t v19 = _AFPreferencesOpportuneSpeakingModuleEnabled();
      AFSetSpokenNotificationDataCollectionEnabled(v19);
    }
  }
  return v2;
}

+ (id)sharedCollector
{
  if (sharedCollector_onceToken != -1) {
    dispatch_once(&sharedCollector_onceToken, &__block_literal_global_10586);
  }
  id v2 = (void *)sharedCollector__sharedInstance;
  return v2;
}

void __58__AFOpportuneSpeakingModuleDataCollection_sharedCollector__block_invoke()
{
  v0 = objc_alloc_init(AFOpportuneSpeakingModuleDataCollection);
  v1 = (void *)sharedCollector__sharedInstance;
  sharedCollector__sharedInstance = (uint64_t)v0;
}

@end