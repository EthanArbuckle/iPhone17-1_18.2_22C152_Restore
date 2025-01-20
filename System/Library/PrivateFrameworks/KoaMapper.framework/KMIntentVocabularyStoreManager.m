@interface KMIntentVocabularyStoreManager
- (id)resolveIntentSlotsForApp:(id)a3 fromAllAppsOverview:(id)a4;
- (id)savedCustomVocabularyOverviewDictionary;
- (id)storedVocabularyForApp:(id)a3 intentSlot:(id)a4;
@end

@implementation KMIntentVocabularyStoreManager

- (id)savedCustomVocabularyOverviewDictionary
{
  return (id)[MEMORY[0x263F101B0] savedCustomVocabularyOverviewDictionary];
}

- (id)resolveIntentSlotsForApp:(id)a3 fromAllAppsOverview:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (__CFString *)[v6 copy];
  int v8 = [@"com.apple.VoiceShortcuts" isEqualToString:v6];

  if (v8)
  {

    v7 = @"com.apple.siriVoiceShortcuts";
  }
  v9 = [v5 valueForKey:v7];

  return v9;
}

- (id)storedVocabularyForApp:(id)a3 intentSlot:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263F101B0] managerForBundleID:v5 bundlePath:0];
  id v21 = 0;
  id v22 = 0;
  id v20 = 0;
  id v8 = (id)[v7 getPathToLatestVocabulary:&v22 pathDuringReading:&v21 sentVocabulary:&v20 forIntentSlot:v6];
  id v9 = v22;
  id v10 = v21;
  id v11 = v20;
  v12 = KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v24 = "-[KMIntentVocabularyStoreManager storedVocabularyForApp:intentSlot:]";
    __int16 v25 = 2112;
    id v26 = v5;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_debug_impl(&dword_22475B000, v12, OS_LOG_TYPE_DEBUG, "%s Reading latest vocabulary from file for appId=%@ intentSlot=%@", buf, 0x20u);
  }
  v13 = (void *)[objc_alloc(MEMORY[0x263F101A0]) initWithContentsOfFile:v9];
  if (!v13)
  {
    v14 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "-[KMIntentVocabularyStoreManager storedVocabularyForApp:intentSlot:]";
      __int16 v25 = 2112;
      id v26 = v5;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_debug_impl(&dword_22475B000, v14, OS_LOG_TYPE_DEBUG, "%s Latest vocabulary file not found for appId=%@ intentSlot=%@. Checking SentVocabulary file.", buf, 0x20u);
    }
    v13 = (void *)[objc_alloc(MEMORY[0x263F101A0]) initWithContentsOfFile:v11];
  }
  v15 = [v13 vocabularyItems];
  v16 = v15;
  if (v15 && [v15 count])
  {
    id v17 = v16;
  }
  else
  {
    v18 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "-[KMIntentVocabularyStoreManager storedVocabularyForApp:intentSlot:]";
      __int16 v25 = 2112;
      id v26 = v5;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_22475B000, v18, OS_LOG_TYPE_INFO, "%s Found no vocabulary stored for appId=%@ intentSlot=%@. Will push empty donation.", buf, 0x20u);
    }
    id v17 = (id)MEMORY[0x263EFFA68];
  }

  return v17;
}

@end