@interface CoreSpeechXPC
+ (id)accessoryModelTypeToString:(int64_t)a3;
+ (void)logLanguageMismatchMetricWithJarvisSelectedLocale:(id)a3 jarvisTriggerMode:(int64_t)a4;
- (CoreSpeechXPC)initWithFakeMonitor:(id)a3;
- (CoreSpeechXPCFakeModelMonitor)fakeAssetMonitor;
- (id)getAccessoryFallbackFamilyLocal:(id)a3 fromLocaleMap:(id)a4;
- (id)getAccessoryFallbackLocalTable;
- (id)selectFallbackModelForLocale:(id)a3 downloadedModels:(id)a4 preinstalledModels:(id)a5 rtLocaleMap:(id)a6;
- (void)_fetchVoiceTriggerInstalledAssetWithLanguage:(id)a3 completion:(id)a4;
- (void)_handleFakeHearstModelRequest:(id)a3 majorVersion:(unint64_t)a4 minorVersion:(unint64_t)a5 downloadedModels:(id)a6 preinstalledModels:(id)a7 completion:(id)a8;
- (void)fetchRemoteVoiceTriggerAssetForLanguageCode:(id)a3 completion:(id)a4;
- (void)installedVoiceTriggerAssetForLanguageCode:(id)a3 completion:(id)a4;
- (void)setFakeAssetMonitor:(id)a3;
- (void)supportsMultiPhraseVoiceTriggerForEngineVersion:(id)a3 engineMinorVersion:(id)a4 accessoryRTModelType:(id)a5 completion:(id)a6;
- (void)voiceTriggerJarvisLanguageList:(id)a3 jarvisSelectedLanguage:(id)a4 completion:(id)a5;
- (void)voiceTriggerRTModelWithRequestOptions:(id)a3 downloadedModels:(id)a4 preinstalledModels:(id)a5 completion:(id)a6;
@end

@implementation CoreSpeechXPC

- (void).cxx_destruct
{
}

- (void)setFakeAssetMonitor:(id)a3
{
}

- (CoreSpeechXPCFakeModelMonitor)fakeAssetMonitor
{
  return self->_fakeAssetMonitor;
}

- (void)supportsMultiPhraseVoiceTriggerForEngineVersion:(id)a3 engineMinorVersion:(id)a4 accessoryRTModelType:(id)a5 completion:(id)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, uint64_t))a6;
  v13 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    v16 = "-[CoreSpeechXPC supportsMultiPhraseVoiceTriggerForEngineVersion:engineMinorVersion:accessoryRTModelType:completion:]";
    _os_log_impl(&dword_1C9338000, v13, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v14 = [MEMORY[0x1E4F5D1A0] supportsMultiPhraseVoiceTriggerForEngineVersion:v9 engineMinorVersion:v10 accessoryRTModelType:v11];
  if (v12) {
    v12[2](v12, v14);
  }
}

- (void)_fetchVoiceTriggerInstalledAssetWithLanguage:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!CSIsInternalBuild())
  {
LABEL_9:
    int v15 = [MEMORY[0x1E4F5D430] sharedInstance];

    if (v15)
    {
      v16 = [MEMORY[0x1E4F5D430] sharedInstance];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __73__CoreSpeechXPC__fetchVoiceTriggerInstalledAssetWithLanguage_completion___block_invoke;
      v19[3] = &unk_1E658D058;
      id v21 = v6;
      id v20 = v5;
      [v16 getInstalledAssetofType:0 forLocale:v20 completion:v19];

      v8 = v21;
    }
    else
    {
      v8 = +[CSAssetController sharedController];
      [v8 installedAssetOfType:0 language:v5 completion:v6];
    }
    goto LABEL_18;
  }
  v7 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  v8 = [v7 fakeVoiceTriggerAudioAccessoryFirstPassAssetPath];

  id v9 = (os_log_t *)MEMORY[0x1E4F5D180];
  id v10 = *MEMORY[0x1E4F5D180];
  id v11 = *MEMORY[0x1E4F5D180];
  if (!v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[CoreSpeechXPC _fetchVoiceTriggerInstalledAssetWithLanguage:completion:]";
      _os_log_debug_impl(&dword_1C9338000, v10, OS_LOG_TYPE_DEBUG, "%s Overriding audio accessory first pass asset is nil", buf, 0xCu);
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[CoreSpeechXPC _fetchVoiceTriggerInstalledAssetWithLanguage:completion:]";
    __int16 v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_DEFAULT, "%s Overridden audio accessory first pass asset path: %@", buf, 0x16u);
  }
  v12 = [v8 stringByDeletingLastPathComponent];
  v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v14 = [v13 fileExistsAtPath:v8];

  if (v14) {
    [MEMORY[0x1E4F5D1A0] assetForAssetType:0 resourcePath:v12 configVersion:@"override-asset" assetProvider:1];
  }
  else {
  uint64_t v17 = [MEMORY[0x1E4F5D1A0] defaultFallBackAssetForVoiceTrigger];
  }
  v18 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[CoreSpeechXPC _fetchVoiceTriggerInstalledAssetWithLanguage:completion:]";
    __int16 v24 = 2112;
    v25 = v17;
    _os_log_impl(&dword_1C9338000, v18, OS_LOG_TYPE_DEFAULT, "%s Fake asset: %@", buf, 0x16u);
  }
  if (v6) {
    (*((void (**)(id, void *, void))v6 + 2))(v6, v17, 0);
  }

LABEL_18:
}

void __73__CoreSpeechXPC__fetchVoiceTriggerInstalledAssetWithLanguage_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    id v9 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      v12 = "-[CoreSpeechXPC _fetchVoiceTriggerInstalledAssetWithLanguage:completion:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_INFO, "%s Trial assets not available, fallback to MA assets", (uint8_t *)&v11, 0xCu);
    }
    id v10 = +[CSAssetController sharedController];
    [v10 installedAssetOfType:0 language:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, id, void))(v8 + 16))(v8, v5, 0);
    }
  }
}

- (id)selectFallbackModelForLocale:(id)a3 downloadedModels:(id)a4 preinstalledModels:(id)a5 rtLocaleMap:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v29 = a5;
  id v11 = a6;
  uint64_t v12 = [(CoreSpeechXPC *)self getAccessoryFallbackFamilyLocal:a3 fromLocaleMap:v11];
  long long v35 = 0u;
  long long v36 = 0u;
  if (v12) {
    uint64_t v13 = (__CFString *)v12;
  }
  else {
    uint64_t v13 = @"en-US";
  }
  long long v37 = 0uLL;
  long long v38 = 0uLL;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v20 = objc_msgSend(v19, "modelLocale", v29);
        id v21 = [(CoreSpeechXPC *)self getAccessoryFallbackFamilyLocal:v20 fromLocaleMap:v11];

        if ([(__CFString *)v13 isEqualToString:v21])
        {
          id obj = v14;
          goto LABEL_22;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v29;
  uint64_t v22 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v32;
LABEL_14:
    uint64_t v25 = 0;
    while (1)
    {
      if (*(void *)v32 != v24) {
        objc_enumerationMutation(obj);
      }
      v19 = *(void **)(*((void *)&v31 + 1) + 8 * v25);
      uint64_t v26 = objc_msgSend(v19, "modelLocale", v29);
      id v21 = [(CoreSpeechXPC *)self getAccessoryFallbackFamilyLocal:v26 fromLocaleMap:v11];

      if ([(__CFString *)v13 isEqualToString:v21]) {
        break;
      }

      if (v23 == ++v25)
      {
        uint64_t v23 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v23) {
          goto LABEL_14;
        }
        goto LABEL_20;
      }
    }
LABEL_22:
    id v27 = v19;
  }
  else
  {
LABEL_20:
    id v27 = 0;
  }

  return v27;
}

- (id)getAccessoryFallbackFamilyLocal:(id)a3 fromLocaleMap:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, 0);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v20;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              if ([v5 isEqualToString:*(void *)(*((void *)&v19 + 1) + 8 * j)])
              {
                id v17 = v11;

                goto LABEL_19;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      id v17 = 0;
    }
    while (v8);
  }
  else
  {
    id v17 = 0;
  }
LABEL_19:

  return v17;
}

- (id)getAccessoryFallbackLocalTable
{
  if (getAccessoryFallbackLocalTable_onceToken != -1) {
    dispatch_once(&getAccessoryFallbackLocalTable_onceToken, &__block_literal_global_20411);
  }
  v2 = (void *)getAccessoryFallbackLocalTable_table;
  return v2;
}

void __47__CoreSpeechXPC_getAccessoryFallbackLocalTable__block_invoke()
{
  v0 = (void *)getAccessoryFallbackLocalTable_table;
  getAccessoryFallbackLocalTable_table = (uint64_t)&unk_1F23C54F0;
}

- (void)voiceTriggerJarvisLanguageList:(id)a3 jarvisSelectedLanguage:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v8 = (unint64_t)a3;
  id v9 = a4;
  id v10 = a5;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __82__CoreSpeechXPC_voiceTriggerJarvisLanguageList_jarvisSelectedLanguage_completion___block_invoke;
  v23[3] = &unk_1E658BB50;
  unint64_t v11 = (unint64_t)v9;
  id v24 = (id)v11;
  id v12 = v10;
  id v25 = v12;
  uint64_t v13 = (void (**)(void, void, void))MEMORY[0x1CB785210](v23);
  if (v8 | v11)
  {
    uint64_t v16 = [MEMORY[0x1E4F5D450] getSiriLanguageWithFallback:@"en-US"];
    id v17 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v27 = "-[CoreSpeechXPC voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:]";
      __int16 v28 = 2114;
      uint64_t v29 = v16;
      _os_log_impl(&dword_1C9338000, v17, OS_LOG_TYPE_DEFAULT, "%s current Siri language code : %{public}@", buf, 0x16u);
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __82__CoreSpeechXPC_voiceTriggerJarvisLanguageList_jarvisSelectedLanguage_completion___block_invoke_24;
    v18[3] = &unk_1E658BB78;
    v18[4] = self;
    id v19 = v16;
    id v20 = (id)v11;
    long long v22 = v13;
    id v21 = (id)v8;
    id v15 = v16;
    [(CoreSpeechXPC *)self _fetchVoiceTriggerInstalledAssetWithLanguage:v15 completion:v18];
  }
  else
  {
    uint64_t v14 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v27 = "-[CoreSpeechXPC voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:]";
      _os_log_error_impl(&dword_1C9338000, v14, OS_LOG_TYPE_ERROR, "%s Language list and jarvis language not provided", buf, 0xCu);
    }
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:403 userInfo:0];
    ((void (**)(void, void, id))v13)[2](v13, 0, v15);
  }
}

void __82__CoreSpeechXPC_voiceTriggerJarvisLanguageList_jarvisSelectedLanguage_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)*MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v8 = v7;
    id v9 = [v6 description];
    int v15 = 136315650;
    uint64_t v16 = "-[CoreSpeechXPC voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:]_block_invoke";
    __int16 v17 = 2114;
    id v18 = v5;
    __int16 v19 = 2114;
    id v20 = v9;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s Select keyword language as %{public}@, error : %{public}@", (uint8_t *)&v15, 0x20u);
  }
  id v10 = [MEMORY[0x1E4F5D318] sharedInstance];
  unint64_t v11 = v10;
  if (v5)
  {
    [v10 setTriggerMode:1];

    if ([*(id *)(a1 + 32) isEqualToString:v5]) {
      goto LABEL_8;
    }
    id v12 = v5;
    uint64_t v13 = 1;
  }
  else
  {
    [v10 setTriggerMode:2];

    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = 2;
  }
  +[CoreSpeechXPC logLanguageMismatchMetricWithJarvisSelectedLocale:v12 jarvisTriggerMode:v13];
LABEL_8:
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);
  }
}

void __82__CoreSpeechXPC_voiceTriggerJarvisLanguageList_jarvisSelectedLanguage_completion___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v7 = (void *)*MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      long long v23 = v7;
      id v24 = [v6 localizedDescription];
      *(_DWORD *)buf = 136315394;
      long long v38 = "-[CoreSpeechXPC voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:]_block_invoke";
      __int16 v39 = 2114;
      v40 = v24;
      _os_log_error_impl(&dword_1C9338000, v23, OS_LOG_TYPE_ERROR, "%s VoiceTriggerAsset is not available : %{public}@", buf, 0x16u);
    }
  }
  unint64_t v8 = [v5 jarvisRTModelLocaleMap];
  if (!v8)
  {
    id v9 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v38 = "-[CoreSpeechXPC voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_DEFAULT, "%s Jarvis locale map is nil, fallback to embedded locale map", buf, 0xCu);
    }
    unint64_t v8 = [*(id *)(a1 + 32) getAccessoryFallbackLocalTable];
  }
  if ([*(id *)(a1 + 40) isEqualToString:*(void *)(a1 + 48)])
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v10 = *(id *)(a1 + 56);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v32;
      while (2)
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(v10);
          }
          if ([*(id *)(*((void *)&v31 + 1) + 8 * v14) isEqualToString:*(void *)(a1 + 40)])
          {
            (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
            goto LABEL_33;
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    id v10 = [*(id *)(a1 + 32) getAccessoryFallbackFamilyLocal:*(void *)(a1 + 40) fromLocaleMap:v8];
    int v15 = [*(id *)(a1 + 32) getAccessoryFallbackFamilyLocal:*(void *)(a1 + 48) fromLocaleMap:v8];
    if ([v15 isEqualToString:v10])
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      id v25 = v15;
      id v26 = v6;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v16 = *(id *)(a1 + 56);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v28;
        while (2)
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v28 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = objc_msgSend(*(id *)(a1 + 32), "getAccessoryFallbackFamilyLocal:fromLocaleMap:", *(void *)(*((void *)&v27 + 1) + 8 * v20), v8, v25, v26, (void)v27);
            if ([v21 isEqualToString:v10])
            {
              (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

              goto LABEL_31;
            }

            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      uint64_t v22 = *(void *)(a1 + 64);
      id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:404 userInfo:0];
      (*(void (**)(uint64_t, void, id))(v22 + 16))(v22, 0, v16);
LABEL_31:

      int v15 = v25;
      id v6 = v26;
    }

LABEL_33:
  }
}

- (void)voiceTriggerRTModelWithRequestOptions:(id)a3 downloadedModels:(id)a4 preinstalledModels:(id)a5 completion:(id)a6
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v50 = a5;
  id v11 = a6;
  uint64_t v12 = [v9 accessoryModelType];
  uint64_t v13 = [v12 integerValue];

  uint64_t v14 = [v9 engineMajorVersion];
  uint64_t v15 = [v14 unsignedIntegerValue];

  id v16 = [v9 engineMinorVersion];
  uint64_t v17 = [v16 unsignedIntegerValue];

  uint64_t v18 = (os_log_t *)MEMORY[0x1E4F5D180];
  uint64_t v19 = (void *)*MEMORY[0x1E4F5D180];
  uint64_t v60 = v13;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = v19;
    uint64_t v21 = +[CoreSpeechXPC accessoryModelTypeToString:v13];
    uint64_t v22 = [v9 accessoryInfo];
    *(_DWORD *)buf = 136316162;
    v85 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]";
    __int16 v86 = 2114;
    v87 = v21;
    __int16 v88 = 1026;
    int v89 = v15;
    __int16 v90 = 1026;
    int v91 = v17;
    __int16 v92 = 2112;
    v93 = v22;
    _os_log_impl(&dword_1C9338000, v20, OS_LOG_TYPE_DEFAULT, "%s Received a request for VoiceTriggerRTModel %{public}@ Firmware Version : %{public}d.%{public}d Accessory Info:%@", buf, 0x2Cu);

    uint64_t v13 = v60;
  }
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __102__CoreSpeechXPC_voiceTriggerRTModelWithRequestOptions_downloadedModels_preinstalledModels_completion___block_invoke;
  v79[3] = &unk_1E658BB00;
  uint64_t v81 = v13;
  id v55 = v11;
  id v80 = v55;
  v54 = (void *)MEMORY[0x1CB785210](v79);
  long long v23 = [v9 siriLocale];
  v53 = v23;
  if (v23)
  {
    id v24 = v23;
  }
  else
  {
    id v24 = [MEMORY[0x1E4F5D450] getSiriLanguageWithFallback:@"en-US"];
  }
  id v25 = v24;
  id v26 = *v18;
  if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v85 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]";
    __int16 v86 = 2114;
    v87 = v25;
    _os_log_impl(&dword_1C9338000, v26, OS_LOG_TYPE_DEFAULT, "%s Asking mobile asset with currentLanguageCode = %{public}@", buf, 0x16u);
    id v26 = *v18;
  }
  v52 = v25;
  uint64_t v57 = v15;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v85 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]";
    _os_log_impl(&dword_1C9338000, v26, OS_LOG_TYPE_DEFAULT, "%s DownloadModel : ", buf, 0xCu);
  }
  uint64_t v56 = v17;
  v59 = v9;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v27 = v10;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v75 objects:v83 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v76 != v30) {
          objc_enumerationMutation(v27);
        }
        long long v32 = *v18;
        if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
        {
          long long v33 = *(void **)(*((void *)&v75 + 1) + 8 * i);
          *(_DWORD *)buf = 136315394;
          v85 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]";
          __int16 v86 = 2114;
          v87 = v33;
          _os_log_impl(&dword_1C9338000, v32, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v75 objects:v83 count:16];
    }
    while (v29);
  }
  v51 = v27;

  long long v34 = *v18;
  if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v85 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]";
    _os_log_impl(&dword_1C9338000, v34, OS_LOG_TYPE_DEFAULT, "%s preinstalledModels : ", buf, 0xCu);
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v35 = v50;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v71 objects:v82 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v72;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v72 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = *v18;
        if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v41 = *(void **)(*((void *)&v71 + 1) + 8 * j);
          *(_DWORD *)buf = 136315394;
          v85 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]";
          __int16 v86 = 2114;
          v87 = v41;
          _os_log_impl(&dword_1C9338000, v40, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v71 objects:v82 count:16];
    }
    while (v37);
  }

  uint64_t v42 = v60;
  if (v60
    || ([MEMORY[0x1E4F5D2F8] sharedPreferences],
        v48 = objc_claimAutoreleasedReturnValue(),
        [v48 fakeHearstModelPath],
        v47 = objc_claimAutoreleasedReturnValue(),
        v48,
        uint64_t v42 = 0,
        !v47))
  {
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __102__CoreSpeechXPC_voiceTriggerRTModelWithRequestOptions_downloadedModels_preinstalledModels_completion___block_invoke_20;
    v61[3] = &unk_1E658BB28;
    v43 = v54;
    id v67 = v54;
    v44 = v59;
    id v62 = v59;
    v45 = v52;
    uint64_t v68 = v42;
    id v63 = v52;
    v64 = self;
    v46 = v51;
    id v65 = v51;
    id v66 = v35;
    uint64_t v69 = v57;
    uint64_t v70 = v56;
    [(CoreSpeechXPC *)self _fetchVoiceTriggerInstalledAssetWithLanguage:v63 completion:v61];

    v47 = v67;
  }
  else
  {
    v49 = *v18;
    v44 = v59;
    v46 = v51;
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v85 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]";
      __int16 v86 = 2114;
      v87 = v47;
      _os_log_impl(&dword_1C9338000, v49, OS_LOG_TYPE_DEFAULT, "%s Hearst Fake Model request switch turned on, executing stress test mode with fakeModelPath : %{public}@", buf, 0x16u);
    }
    v43 = v54;
    [(CoreSpeechXPC *)self _handleFakeHearstModelRequest:v47 majorVersion:v57 minorVersion:v56 downloadedModels:v51 preinstalledModels:v35 completion:v54];
    v45 = v52;
  }
}

void __102__CoreSpeechXPC_voiceTriggerRTModelWithRequestOptions_downloadedModels_preinstalledModels_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v16 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!*(void *)(a1 + 40))
  {
    if (v9)
    {
      uint64_t v12 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
      uint64_t v13 = [v9 modelHash];
      [v12 setHearstFirstPassModelVersion:v13];
    }
    if (v10)
    {
      uint64_t v14 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
      [v14 setHearstSecondPassModelVersion:v10];
    }
  }
  uint64_t v15 = *(void *)(a1 + 32);
  if (v15) {
    (*(void (**)(uint64_t, id, id, id))(v15 + 16))(v15, v16, v9, v11);
  }
}

void __102__CoreSpeechXPC_voiceTriggerRTModelWithRequestOptions_downloadedModels_preinstalledModels_completion___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (os_log_t *)MEMORY[0x1E4F5D180];
  if (v5)
  {
    unint64_t v8 = [v5 rtModelWithRequestOptions:*(void *)(a1 + 32)];
    os_log_t v9 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = v9;
      uint64_t v12 = [v5 resourcePath];
      uint64_t v13 = [v5 configVersion];
      *(_DWORD *)buf = 136316162;
      uint64_t v57 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]_block_invoke";
      __int16 v58 = 2112;
      *(void *)v59 = v10;
      *(_WORD *)&v59[8] = 2112;
      *(void *)uint64_t v60 = v12;
      *(_WORD *)&v60[8] = 2112;
      *(void *)v61 = v13;
      *(_WORD *)&v61[8] = 2112;
      id v62 = v8;
      _os_log_impl(&dword_1C9338000, v11, OS_LOG_TYPE_DEFAULT, "%s Queried model for language:%@ path:%@ configVers:%@ model:%@", buf, 0x34u);
    }
    uint64_t v14 = [v5 rtModelLocaleMapWithModelType:*(void *)(a1 + 80)];
    if (v14)
    {
      if (v8)
      {
LABEL_6:
        v43 = v14;
        id v44 = v6;
        id v45 = v5;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v15 = *(id *)(a1 + 56);
        uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v55 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v51;
          while (2)
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v51 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void **)(*((void *)&v50 + 1) + 8 * i);
              uint64_t v21 = [v20 modelHash];
              uint64_t v22 = [v8 modelHash];
              int v23 = [v21 isEqualToString:v22];

              if (v23)
              {
                long long v34 = *MEMORY[0x1E4F5D180];
                id v6 = v44;
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  uint64_t v57 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:comple"
                        "tion:]_block_invoke";
                  __int16 v58 = 2114;
                  *(void *)v59 = v20;
                  _os_log_impl(&dword_1C9338000, v34, OS_LOG_TYPE_DEFAULT, "%s Hash matched with downloadedModel : %{public}@, accessory will select this model", buf, 0x16u);
                }
                (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
                id v5 = v45;
LABEL_40:
                uint64_t v14 = v43;
                goto LABEL_41;
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v50 objects:v55 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }

        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v15 = *(id *)(a1 + 64);
        uint64_t v24 = [v15 countByEnumeratingWithState:&v46 objects:v54 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v47;
          while (2)
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v47 != v26) {
                objc_enumerationMutation(v15);
              }
              uint64_t v28 = *(void **)(*((void *)&v46 + 1) + 8 * j);
              uint64_t v29 = [v28 modelHash];
              uint64_t v30 = [v8 modelHash];
              int v31 = [v29 isEqualToString:v30];

              if (v31)
              {
                uint64_t v37 = *MEMORY[0x1E4F5D180];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  uint64_t v57 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:comple"
                        "tion:]_block_invoke";
                  __int16 v58 = 2114;
                  *(void *)v59 = v28;
                  _os_log_impl(&dword_1C9338000, v37, OS_LOG_TYPE_DEFAULT, "%s Hash matched with preinstalledModel : %{public}@, accessory will select this model", buf, 0x16u);
                }
                (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
                id v6 = v44;
                id v5 = v45;
                goto LABEL_40;
              }
            }
            uint64_t v25 = [v15 countByEnumeratingWithState:&v46 objects:v54 count:16];
            if (v25) {
              continue;
            }
            break;
          }
        }

        uint64_t v14 = v43;
        id v15 = [*(id *)(a1 + 48) selectFallbackModelForLocale:*(void *)(a1 + 40) downloadedModels:*(void *)(a1 + 56) preinstalledModels:*(void *)(a1 + 64) rtLocaleMap:v43];
        long long v32 = *MEMORY[0x1E4F5D180];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v57 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]_block_invoke";
          __int16 v58 = 2114;
          *(void *)v59 = v8;
          *(_WORD *)&v59[8] = 2114;
          *(void *)uint64_t v60 = v15;
          _os_log_impl(&dword_1C9338000, v32, OS_LOG_TYPE_DEFAULT, "%s Ask for download : %{public}@, and use %{public}@ as fallback", buf, 0x20u);
        }
        (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
        id v6 = v44;
        id v5 = v45;
        goto LABEL_41;
      }
    }
    else
    {
      id v35 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v57 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]_block_invoke";
        _os_log_error_impl(&dword_1C9338000, v35, OS_LOG_TYPE_ERROR, "%s rtLocaleMap is nil fallback to embedded locale map", buf, 0xCu);
      }
      uint64_t v14 = [*(id *)(a1 + 48) getAccessoryFallbackLocalTable];
      if (v8) {
        goto LABEL_6;
      }
    }
    id v15 = [*(id *)(a1 + 48) selectFallbackModelForLocale:*(void *)(a1 + 40) downloadedModels:*(void *)(a1 + 56) preinstalledModels:*(void *)(a1 + 64) rtLocaleMap:v14];
    uint64_t v36 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = *(void *)(a1 + 88);
      uint64_t v41 = *(void *)(a1 + 96);
      uint64_t v42 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      uint64_t v57 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]_block_invoke";
      __int16 v58 = 1026;
      *(_DWORD *)v59 = v40;
      *(_WORD *)&v59[4] = 1026;
      *(_DWORD *)&v59[6] = v41;
      *(_WORD *)uint64_t v60 = 2114;
      *(void *)&v60[2] = v42;
      *(_WORD *)v61 = 2114;
      *(void *)&v61[2] = v15;
      _os_log_error_impl(&dword_1C9338000, v36, OS_LOG_TYPE_ERROR, "%s accessoryRTBlobs are not available for the version(%{public}d.%{public}d) and locale:%{public}@, returning fallback model : %{public}@", buf, 0x2Cu);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_41:

    goto LABEL_42;
  }
  long long v33 = (void *)*MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    uint64_t v38 = v33;
    __int16 v39 = [v6 localizedDescription];
    *(_DWORD *)buf = 136315394;
    uint64_t v57 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]_block_invoke";
    __int16 v58 = 2114;
    *(void *)v59 = v39;
    _os_log_error_impl(&dword_1C9338000, v38, OS_LOG_TYPE_ERROR, "%s VoiceTriggerAsset is not available : %{public}@", buf, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_42:
}

- (void)_handleFakeHearstModelRequest:(id)a3 majorVersion:(unint64_t)a4 minorVersion:(unint64_t)a5 downloadedModels:(id)a6 preinstalledModels:(id)a7 completion:(id)a8
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = a8;
  uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(a7) = [v16 fileExistsAtPath:v12];

  if (a7)
  {
    uint64_t v17 = [v12 stringByAppendingPathComponent:@"fakeModel.json"];
    uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v19 = [v18 fileExistsAtPath:v17];

    if (v19)
    {
      uint64_t v20 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v17];
      if (v20)
      {
        uint64_t v21 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v20 options:0 error:0];
        if (v21)
        {
          uint64_t v22 = (void *)v21;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v68 = self;
            uint64_t v69 = v20;
            uint64_t v70 = v17;
            id v71 = v15;
            long long v72 = v14;
            long long v73 = v13;
            id v23 = v22;
            long long v75 = [MEMORY[0x1E4F1CA48] array];
            long long v79 = 0u;
            long long v80 = 0u;
            long long v81 = 0u;
            long long v82 = 0u;
            id v24 = v23;
            uint64_t v25 = [v24 countByEnumeratingWithState:&v79 objects:v87 count:16];
            id obj = v24;
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v80;
              do
              {
                for (uint64_t i = 0; i != v26; ++i)
                {
                  if (*(void *)v80 != v27) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v29 = *(void *)(*((void *)&v79 + 1) + 8 * i);
                  id v30 = v12;
                  int v31 = objc_msgSend(v12, "stringByAppendingPathComponent:", v29, v68);
                  long long v32 = [MEMORY[0x1E4F5D1A0] assetForAssetType:0 resourcePath:v31 configVersion:v29];
                  long long v33 = [CSVoiceTriggerRTModelRequestOptions alloc];
                  v78[0] = MEMORY[0x1E4F143A8];
                  v78[1] = 3221225472;
                  v78[2] = __120__CoreSpeechXPC__handleFakeHearstModelRequest_majorVersion_minorVersion_downloadedModels_preinstalledModels_completion___block_invoke;
                  v78[3] = &__block_descriptor_48_e56_v16__0___CSVoiceTriggerRTModelRequestOptionsMutablity__8l;
                  v78[4] = a4;
                  v78[5] = a5;
                  long long v34 = [(CSVoiceTriggerRTModelRequestOptions *)v33 initWithMutableBuilder:v78];
                  id v35 = [v32 hearstRTModelWithRequestOptions:v34];
                  uint64_t v36 = *MEMORY[0x1E4F5D180];
                  if (v35)
                  {
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315394;
                      v84 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:pre"
                            "installedModels:completion:]";
                      __int16 v85 = 2114;
                      v86[0] = v35;
                      _os_log_impl(&dword_1C9338000, v36, OS_LOG_TYPE_DEFAULT, "%s Loading FakeModel : %{public}@", buf, 0x16u);
                    }
                    [v75 addObject:v35];
                  }
                  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v84 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:prein"
                          "stalledModels:completion:]";
                    __int16 v85 = 2114;
                    v86[0] = v31;
                    _os_log_error_impl(&dword_1C9338000, v36, OS_LOG_TYPE_ERROR, "%s Cannot create RTModel from %{public}@", buf, 0x16u);
                  }

                  id v12 = v30;
                }
                id v24 = obj;
                uint64_t v26 = [obj countByEnumeratingWithState:&v79 objects:v87 count:16];
              }
              while (v26);
            }

            if ((int)[v75 count] > 2)
            {
              if ([v75 count])
              {
                long long v46 = [v75 firstObject];
                long long v47 = [(CoreSpeechXPCFakeModelMonitor *)v68->_fakeAssetMonitor lastFakeModelUsedHash];
                if (v47)
                {
                  BOOL v48 = [(CoreSpeechXPCFakeModelMonitor *)v68->_fakeAssetMonitor shouldRollFakeModel];
                  uint64_t v17 = v70;
                  if ([v75 count])
                  {
                    unint64_t v49 = 0;
                    uint64_t v38 = v46;
                    while (1)
                    {
                      long long v50 = objc_msgSend(v75, "objectAtIndexedSubscript:", v49, v68);
                      long long v51 = [v50 modelHash];
                      int v52 = [v47 isEqual:v51];

                      if (v52)
                      {
                        if (v48)
                        {
                          if (v49 < [v75 count] - 1)
                          {
                            uint64_t v57 = [v75 objectAtIndexedSubscript:v49 + 1];

                            uint64_t v38 = (void *)v57;
                            goto LABEL_53;
                          }
                        }
                        else
                        {
                          uint64_t v53 = [v75 objectAtIndexedSubscript:v49];

                          uint64_t v38 = (void *)v53;
                        }
                      }
                      if (++v49 >= [v75 count]) {
                        goto LABEL_53;
                      }
                    }
                  }
                  uint64_t v38 = v46;
                }
                else
                {
                  uint64_t v38 = [v75 firstObject];

                  v54 = *MEMORY[0x1E4F5D180];
                  uint64_t v17 = v70;
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    v84 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:prein"
                          "stalledModels:completion:]";
                    __int16 v85 = 2114;
                    v86[0] = v38;
                    _os_log_impl(&dword_1C9338000, v54, OS_LOG_TYPE_DEFAULT, "%s Using fake model for the first time : %{public}@", buf, 0x16u);
                  }
                }
LABEL_53:
                if (v38)
                {
                  __int16 v58 = *MEMORY[0x1E4F5D180];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    v84 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:prein"
                          "stalledModels:completion:]";
                    __int16 v85 = 2114;
                    v86[0] = v38;
                    _os_log_impl(&dword_1C9338000, v58, OS_LOG_TYPE_DEFAULT, "%s Using fake model : %{public}@", buf, 0x16u);
                  }
                  v59 = v68;
                  -[CoreSpeechXPCFakeModelMonitor setShouldRollFakeModel:](v68->_fakeAssetMonitor, "setShouldRollFakeModel:", 0, v68);
                  fakeAssetMonitor = v59->_fakeAssetMonitor;
                  v61 = [v38 modelHash];
                  [(CoreSpeechXPCFakeModelMonitor *)fakeAssetMonitor setLastFakeModelUsedHash:v61];
                }
              }
              else
              {
                uint64_t v38 = 0;
                uint64_t v17 = v70;
              }
              id v13 = v73;
              uint64_t v62 = objc_msgSend(v73, "count", v68);
              uint64_t v63 = v73;
              id v15 = v71;
              id v14 = v72;
              if (v62 || (v64 = [v72 count], uint64_t v63 = v72, v64))
              {
                id v65 = [v63 objectAtIndex:0];
              }
              else
              {
                id v65 = 0;
              }
              id v66 = (NSObject **)MEMORY[0x1E4F5D180];
              id v67 = *MEMORY[0x1E4F5D180];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v84 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstal"
                      "ledModels:completion:]";
                __int16 v85 = 2114;
                v86[0] = v38;
                _os_log_impl(&dword_1C9338000, v67, OS_LOG_TYPE_DEFAULT, "%s %{public}@ fake model is selected for download", buf, 0x16u);
                id v67 = *v66;
              }
              uint64_t v20 = v69;
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v84 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstal"
                      "ledModels:completion:]";
                __int16 v85 = 2114;
                v86[0] = v65;
                _os_log_impl(&dword_1C9338000, v67, OS_LOG_TYPE_DEFAULT, "%s %{public}@ model is selected for fallback", buf, 0x16u);
              }
              (*((void (**)(id, void *, void *, __CFString *, void))v71 + 2))(v71, v38, v65, @"fakeModel", 0);
            }
            else
            {
              uint64_t v37 = (void *)*MEMORY[0x1E4F5D180];
              id v14 = v72;
              id v13 = v73;
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
              {
                id v55 = v37;
                int v56 = [v75 count];
                *(_DWORD *)buf = 136315650;
                v84 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstal"
                      "ledModels:completion:]";
                __int16 v85 = 1026;
                LODWORD(v86[0]) = v56;
                WORD2(v86[0]) = 1026;
                *(_DWORD *)((char *)v86 + 6) = 3;
                _os_log_error_impl(&dword_1C9338000, v55, OS_LOG_TYPE_ERROR, "%s fake model number(%{public}d) is less than minimum fake model number((%{public}d)", buf, 0x18u);
              }
              uint64_t v38 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F5D138], 410, 0, v68);
              id v15 = v71;
              (*((void (**)(id, void, void, void, void *))v71 + 2))(v71, 0, 0, 0, v38);
              uint64_t v17 = v70;
            }

            uint64_t v22 = obj;
          }
          else
          {
            id v44 = *MEMORY[0x1E4F5D180];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v84 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstalle"
                    "dModels:completion:]";
              __int16 v85 = 2114;
              v86[0] = v17;
              _os_log_error_impl(&dword_1C9338000, v44, OS_LOG_TYPE_ERROR, "%s Unable to parse fake model meta json : %{public}@", buf, 0x16u);
            }
            id v45 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:409 userInfo:0];
            (*((void (**)(id, void, void, void, void *))v15 + 2))(v15, 0, 0, 0, v45);
          }
        }
        else
        {
          uint64_t v42 = *MEMORY[0x1E4F5D180];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v84 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstalledM"
                  "odels:completion:]";
            __int16 v85 = 2114;
            v86[0] = v17;
            _os_log_error_impl(&dword_1C9338000, v42, OS_LOG_TYPE_ERROR, "%s Unable to parse fake model meta json : %{public}@", buf, 0x16u);
          }
          v43 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:409 userInfo:0];
          (*((void (**)(id, void, void, void, void *))v15 + 2))(v15, 0, 0, 0, v43);

          uint64_t v22 = 0;
        }
      }
      else
      {
        uint64_t v41 = *MEMORY[0x1E4F5D180];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v84 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstalledMod"
                "els:completion:]";
          __int16 v85 = 2114;
          v86[0] = v17;
          _os_log_error_impl(&dword_1C9338000, v41, OS_LOG_TYPE_ERROR, "%s Unable to read fake model meta json : %{public}@", buf, 0x16u);
        }
        uint64_t v22 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:409 userInfo:0];
        (*((void (**)(id, void, void, void, void *))v15 + 2))(v15, 0, 0, 0, v22);
      }
    }
    else
    {
      uint64_t v40 = *MEMORY[0x1E4F5D180];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v84 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstalledModels:completion:]";
        __int16 v85 = 2114;
        v86[0] = v17;
        _os_log_error_impl(&dword_1C9338000, v40, OS_LOG_TYPE_ERROR, "%s fake model meta json does not exist : %{public}@", buf, 0x16u);
      }
      uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:408 userInfo:0];
      (*((void (**)(id, void, void, void, void *))v15 + 2))(v15, 0, 0, 0, v20);
    }
  }
  else
  {
    __int16 v39 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v84 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstalledModels:completion:]";
      __int16 v85 = 2114;
      v86[0] = v12;
      _os_log_error_impl(&dword_1C9338000, v39, OS_LOG_TYPE_ERROR, "%s Fake Model Path does not exist : %{public}@", buf, 0x16u);
    }
    uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:407 userInfo:0];
    (*((void (**)(id, void, void, void, void *))v15 + 2))(v15, 0, 0, 0, v17);
  }
}

void __120__CoreSpeechXPC__handleFakeHearstModelRequest_majorVersion_minorVersion_downloadedModels_preinstalledModels_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = NSNumber;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = a2;
  id v5 = [v3 numberWithUnsignedInteger:v4];
  [v7 setEngineMajorVersion:v5];

  id v6 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  [v7 setEngineMinorVersion:v6];

  [v7 setSiriLocale:@"en-US"];
}

- (void)fetchRemoteVoiceTriggerAssetForLanguageCode:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    os_log_t v9 = "-[CoreSpeechXPC fetchRemoteVoiceTriggerAssetForLanguageCode:completion:]";
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_DEFAULT, "%s Received a request for VoiceTrigger Asset for language code : %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if (v6) {
    (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, 0);
  }
}

- (void)installedVoiceTriggerAssetForLanguageCode:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    os_log_t v9 = "-[CoreSpeechXPC installedVoiceTriggerAssetForLanguageCode:completion:]";
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_DEFAULT, "%s Received a request for VoiceTrigger Asset for language code : %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if (v6) {
    (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, 0);
  }
}

- (CoreSpeechXPC)initWithFakeMonitor:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CoreSpeechXPC;
  id v6 = [(CoreSpeechXPC *)&v8 init];
  if (v6)
  {
    CSLogInitIfNeeded();
    objc_storeStrong((id *)&v6->_fakeAssetMonitor, a3);
  }

  return v6;
}

+ (void)logLanguageMismatchMetricWithJarvisSelectedLocale:(id)a3 jarvisTriggerMode:(int64_t)a4
{
  if ((unint64_t)(a4 + 1) > 3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = dword_1C94A6D30[a4 + 1];
  }
  id v6 = @"NA";
  if (a3) {
    id v6 = (__CFString *)a3;
  }
  id v7 = (objc_class *)MEMORY[0x1E4FA0878];
  objc_super v8 = v6;
  id v16 = a3;
  id v9 = objc_alloc_init(v7);
  [v9 setHasCarHeadUnitSelectedLocale:1];
  [v9 setCarHeadUnitSelectedLocale:v8];

  [v9 setHasCarplayTriggerMode:1];
  [v9 setCarplayTriggerMode:v5];
  id v10 = objc_alloc_init(MEMORY[0x1E4FA0880]);
  id v11 = objc_alloc_init(MEMORY[0x1E4FA0898]);
  id v12 = objc_alloc(MEMORY[0x1E4FA1378]);
  id v13 = [MEMORY[0x1E4F29128] UUID];
  id v14 = (void *)[v12 initWithNSUUID:v13];
  [v11 setMhId:v14];

  [v10 setEventMetadata:v11];
  [v10 setCarPlayLangaugeMismatched:v9];
  id v15 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v15 emitMessage:v10];
}

+ (id)accessoryModelTypeToString:(int64_t)a3
{
  v3 = @"default";
  if (!a3) {
    v3 = @"Hearst";
  }
  if (a3 == 1) {
    return @"Remora";
  }
  else {
    return v3;
  }
}

@end