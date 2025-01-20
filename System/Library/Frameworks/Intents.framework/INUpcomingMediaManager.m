@interface INUpcomingMediaManager
+ (INUpcomingMediaManager)sharedManager;
+ (id)mediaQueue;
- (CSSearchableIndex)index;
- (INUpcomingMediaManager)initWithSearchableIndex:(id)a3;
- (id)keyWithMediaItemTypeName:(id)a3 bundleId:(id)a4;
- (int64_t)_predictionModeForBundleId:(id)a3 type:(int64_t)a4 error:(id *)a5;
- (void)_replaceMediaIntents:(id)a3 forBundleIdentifier:(id)a4;
- (void)_setSuggestedMediaIntents:(id)a3 forBundleIdentifier:(id)a4;
- (void)setPredictionMode:(INUpcomingMediaPredictionMode)mode forType:(INMediaItemType)type;
- (void)setSuggestedMediaIntents:(NSOrderedSet *)intents;
@end

@implementation INUpcomingMediaManager

- (void).cxx_destruct
{
}

- (CSSearchableIndex)index
{
  return self->_index;
}

- (id)keyWithMediaItemTypeName:(id)a3 bundleId:(id)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v11[0] = a4;
  v11[1] = a3;
  v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 arrayWithObjects:v11 count:2];

  v9 = [v8 componentsJoinedByString:@"-"];

  return v9;
}

- (int64_t)_predictionModeForBundleId:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  if ((unint64_t)(a4 - 1) > 0x13) {
    v8 = @"unknown";
  }
  else {
    v8 = *(&off_1E551E500 + a4 - 1);
  }
  v9 = v8;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Intents.UpcomingMediaManager"];
  v11 = [(INUpcomingMediaManager *)self keyWithMediaItemTypeName:v9 bundleId:v7];

  int64_t v12 = [v10 integerForKey:v11];
  return v12;
}

- (void)setPredictionMode:(INUpcomingMediaPredictionMode)mode forType:(INMediaItemType)type
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = _INVCVoiceShortcutClient();
  if (v6)
  {
    if ((unint64_t)(type - 1) > 0x13) {
      id v7 = @"unknown";
    }
    else {
      id v7 = *(&off_1E551E500 + type - 1);
    }
    v9 = v7;
    [v6 setInteger:mode forKey:v9 inDomain:@"com.apple.Intents.UpcomingMediaManager" completionHandler:&__block_literal_global_21_59620];
  }
  else
  {
    v8 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      v11 = "-[INUpcomingMediaManager setPredictionMode:forType:]";
      _os_log_error_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_ERROR, "%s Failed to set prediction mode: VoiceShortcutClient framework not found", (uint8_t *)&v10, 0xCu);
    }
  }
}

void __52__INUpcomingMediaManager_setPredictionMode_forType___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    v5 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[INUpcomingMediaManager setPredictionMode:forType:]_block_invoke";
      __int16 v8 = 2114;
      id v9 = v4;
      _os_log_error_impl(&dword_18CB2F000, v5, OS_LOG_TYPE_ERROR, "%s Failed to set prediction mode: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)_replaceMediaIntents:(id)a3 forBundleIdentifier:(id)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  __int16 v8 = +[INUpcomingMediaManager mediaQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [v7 count];
  uint64_t v10 = [MEMORY[0x1E4F28F50] strongObjectsPointerArray];
  [v10 setCount:v9];
  v11 = objc_opt_new();
  dispatch_group_t v12 = dispatch_group_create();
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __67__INUpcomingMediaManager__replaceMediaIntents_forBundleIdentifier___block_invoke;
  v28[3] = &unk_1E551A0E8;
  v13 = v12;
  v29 = v13;
  v30 = self;
  uint64_t v33 = v9;
  id v31 = v11;
  id v14 = v10;
  id v32 = v14;
  id v15 = v11;
  [v7 enumerateObjectsUsingBlock:v28];

  dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  [v14 compact];
  v16 = [(INUpcomingMediaManager *)self index];
  dispatch_group_enter(v13);
  v34[0] = @"com.apple.siri.upcomingmedia";
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  uint64_t v18 = *MEMORY[0x1E4F28358];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __67__INUpcomingMediaManager__replaceMediaIntents_forBundleIdentifier___block_invoke_16;
  v23[3] = &unk_1E551A138;
  id v24 = v14;
  v25 = v13;
  id v26 = v16;
  id v27 = v6;
  id v19 = v6;
  id v20 = v16;
  v21 = v13;
  id v22 = v14;
  [v20 deleteSearchableItemsWithDomainIdentifiers:v17 protectionClass:v18 forBundleID:v19 options:0 completionHandler:v23];

  dispatch_group_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
}

void __67__INUpcomingMediaManager__replaceMediaIntents_forBundleIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(NSObject **)(a1 + 32);
  id v6 = a2;
  dispatch_group_enter(v5);
  objc_msgSend(v6, "_intents_preferredScaledImageSize");
  double v8 = v7;
  double v10 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__INUpcomingMediaManager__replaceMediaIntents_forBundleIdentifier___block_invoke_2;
  v13[3] = &unk_1E551A0C0;
  uint64_t v11 = *(void *)(a1 + 64);
  dispatch_group_t v12 = *(void **)(a1 + 48);
  v13[4] = *(void *)(a1 + 40);
  uint64_t v17 = v11;
  uint64_t v18 = a3;
  id v14 = v12;
  id v15 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 32);
  INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler(v6, 0x15u, 0, 1, 0, v13, v8, v10);
}

void __67__INUpcomingMediaManager__replaceMediaIntents_forBundleIdentifier___block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      dispatch_group_t v12 = "-[INUpcomingMediaManager _replaceMediaIntents:forBundleIdentifier:]_block_invoke";
      __int16 v13 = 2114;
      id v14 = v3;
      _os_log_error_impl(&dword_18CB2F000, v4, OS_LOG_TYPE_ERROR, "%s Error when trying to delete existing upcoming media items: %{public}@", buf, 0x16u);
    }
  }
  if ([*(id *)(a1 + 32) count])
  {
    v5 = *(void **)(a1 + 48);
    id v6 = [*(id *)(a1 + 32) allObjects];
    uint64_t v7 = *MEMORY[0x1E4F28358];
    uint64_t v8 = *(void *)(a1 + 56);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__INUpcomingMediaManager__replaceMediaIntents_forBundleIdentifier___block_invoke_17;
    v9[3] = &unk_1E551A110;
    id v10 = *(id *)(a1 + 40);
    [v5 indexSearchableItems:v6 deleteSearchableItemsWithIdentifiers:MEMORY[0x1E4F1CBF0] clientState:0 protectionClass:v7 forBundleID:v8 options:0 completionHandler:v9];
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __67__INUpcomingMediaManager__replaceMediaIntents_forBundleIdentifier___block_invoke_17(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      id v6 = "-[INUpcomingMediaManager _replaceMediaIntents:forBundleIdentifier:]_block_invoke";
      __int16 v7 = 2114;
      id v8 = v3;
      _os_log_error_impl(&dword_18CB2F000, v4, OS_LOG_TYPE_ERROR, "%s Error when trying to index new upcoming media items: %{public}@", (uint8_t *)&v5, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__INUpcomingMediaManager__replaceMediaIntents_forBundleIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6
    && (__int16 v7 = INSiriLogContextIntents,
        os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR)))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 136315650;
    uint64_t v15 = "-[INUpcomingMediaManager _replaceMediaIntents:forBundleIdentifier:]_block_invoke_2";
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    __int16 v18 = 2114;
    id v19 = v6;
    _os_log_error_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_ERROR, "%s Error injecting image proxies into %{publc}@: %{public}@", (uint8_t *)&v14, 0x20u);
    if (!v5) {
      goto LABEL_7;
    }
  }
  else if (!v5)
  {
    goto LABEL_7;
  }
  id v8 = [[INInteraction alloc] initWithIntent:v5 response:0];
  uint64_t v9 = [(INInteraction *)v8 _searchableItemIncludingData:1];
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 attributeSet];
    [v11 setDomainIdentifier:@"com.apple.siri.upcomingmedia"];
    dispatch_group_t v12 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64) + ~*(void *)(a1 + 72)];
    [v11 setRankingHint:v12];

    [*(id *)(a1 + 40) lock];
    [*(id *)(a1 + 48) replacePointerAtIndex:*(void *)(a1 + 72) withPointer:v10];
    [*(id *)(a1 + 40) unlock];
  }
LABEL_7:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (void)_setSuggestedMediaIntents:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        if (([*(id *)(*((void *)&v24 + 1) + 8 * i) isMemberOfClass:objc_opt_class()] & 1) == 0)
        {
          __int16 v16 = NSString;
          uint64_t v17 = (objc_class *)objc_opt_class();
          __int16 v18 = NSStringFromClass(v17);
          uint64_t v19 = [v16 stringWithFormat:@"Expecting INPlayMediaIntent, not %@", v18];

          id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0];
          objc_exception_throw(v20);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  uint64_t v13 = +[INUpcomingMediaManager mediaQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__INUpcomingMediaManager__setSuggestedMediaIntents_forBundleIdentifier___block_invoke;
  block[3] = &unk_1E551A090;
  block[4] = self;
  id v22 = v8;
  id v23 = v7;
  id v14 = v7;
  id v15 = v8;
  dispatch_async(v13, block);
}

uint64_t __72__INUpcomingMediaManager__setSuggestedMediaIntents_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _replaceMediaIntents:*(void *)(a1 + 40) forBundleIdentifier:*(void *)(a1 + 48)];
}

- (void)setSuggestedMediaIntents:(NSOrderedSet *)intents
{
}

- (INUpcomingMediaManager)initWithSearchableIndex:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INUpcomingMediaManager;
  id v6 = [(INUpcomingMediaManager *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_index, a3);
    id v8 = v7;
  }

  return v7;
}

+ (INUpcomingMediaManager)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__INUpcomingMediaManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_59650 != -1) {
    dispatch_once(&sharedManager_onceToken_59650, block);
  }
  v2 = (void *)sharedManager_sharedManager;

  return (INUpcomingMediaManager *)v2;
}

void __39__INUpcomingMediaManager_sharedManager__block_invoke(uint64_t a1)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v2 = (void *)getCSSearchableIndexClass_softClass_59651;
  uint64_t v13 = getCSSearchableIndexClass_softClass_59651;
  if (!getCSSearchableIndexClass_softClass_59651)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getCSSearchableIndexClass_block_invoke_59652;
    v9[3] = &unk_1E5520EB8;
    void v9[4] = &v10;
    __getCSSearchableIndexClass_block_invoke_59652((uint64_t)v9);
    v2 = (void *)v11[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v10, 8);
  id v4 = [v3 alloc];
  id v5 = NSStringFromClass(*(Class *)(a1 + 32));
  id v6 = (void *)[v4 initWithName:v5 protectionClass:*MEMORY[0x1E4F28358]];

  id v7 = [[INUpcomingMediaManager alloc] initWithSearchableIndex:v6];
  id v8 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v7;
}

+ (id)mediaQueue
{
  if (mediaQueue_onceToken != -1) {
    dispatch_once(&mediaQueue_onceToken, &__block_literal_global_59660);
  }
  v2 = (void *)mediaQueue_mediaQueue;

  return v2;
}

void __36__INUpcomingMediaManager_mediaQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v0 = dispatch_queue_create("INUpcomingMediaManagerQueue", v2);
  v1 = (void *)mediaQueue_mediaQueue;
  mediaQueue_mediaQueue = (uint64_t)v0;
}

@end