id sub_100002DA0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withJarvisTriggerMode:*(void *)(a1 + 40)];
}

id sub_1000031F8(uint64_t a1, void *a2)
{
  return [a2 _notifyJarvisTriggerModeDidChanged];
}

void sub_1000032C8(id a1)
{
  qword_100022D38 = objc_alloc_init(CSJarvisTriggerModeMonitor);
  _objc_release_x1();
}

void sub_10000359C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000035C8(uint64_t a1)
{
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    v5 = "-[CoreSpeechXPCFakeModelMonitor _registerForFakeAssetRollNotification]_block_invoke";
    __int16 v6 = 2112;
    CFStringRef v7 = @"com.apple.corespeech.fakeasset.rolling";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Received notification %@", (uint8_t *)&v4, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setShouldRollFakeModel:1];
}

uint64_t sub_10000371C(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 32);
  if (result != -1) {
    return notify_cancel(result);
  }
  return result;
}

id sub_1000037A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerForFakeAssetRollNotification];
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_alloc_init(ServiceDelegate);
  int v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_100004B40(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  CFStringRef v7 = v6;
  if (!v5 || v6)
  {
    v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      v12 = "-[CoreSpeechXPC _fetchVoiceTriggerInstalledAssetWithLanguage:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Trial assets not available, fallback to MA assets", (uint8_t *)&v11, 0xCu);
    }
    v10 = +[CSAssetController sharedController];
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

void sub_100005118(id a1)
{
  v1 = (void *)qword_100022D50;
  qword_100022D50 = (uint64_t)&off_10001E1D0;
}

void sub_100005408(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  CFStringRef v7 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    v9 = [v6 description];
    int v15 = 136315650;
    v16 = "-[CoreSpeechXPC voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:]_block_invoke";
    __int16 v17 = 2114;
    id v18 = v5;
    __int16 v19 = 2114;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Select keyword language as %{public}@, error : %{public}@", (uint8_t *)&v15, 0x20u);
  }
  v10 = +[CSJarvisTriggerModeMonitor sharedInstance];
  int v11 = v10;
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

void sub_100005598(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    CFStringRef v7 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v23 = v7;
      v24 = [v6 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v38 = "-[CoreSpeechXPC voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:]_block_invoke";
      __int16 v39 = 2114;
      v40 = v24;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s VoiceTriggerAsset is not available : %{public}@", buf, 0x16u);
    }
  }
  uint64_t v8 = [v5 jarvisRTModelLocaleMap];
  if (!v8)
  {
    v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "-[CoreSpeechXPC voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Jarvis locale map is nil, fallback to embedded locale map", buf, 0xCu);
    }
    uint64_t v8 = [*(id *)(a1 + 32) getAccessoryFallbackLocalTable];
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
    id v11 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v32;
      while (2)
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(v10);
          }
          if ([*(id *)(*((void *)&v31 + 1) + 8 * (void)v14) isEqualToString:*(void *)(a1 + 40)])
          {
            (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
            goto LABEL_33;
          }
          uint64_t v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
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
      v25 = v15;
      id v26 = v6;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v16 = *(id *)(a1 + 56);
      id v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v28;
        while (2)
        {
          v20 = 0;
          do
          {
            if (*(void *)v28 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = objc_msgSend(*(id *)(a1 + 32), "getAccessoryFallbackFamilyLocal:fromLocaleMap:", *(void *)(*((void *)&v27 + 1) + 8 * (void)v20), v8, v25, v26, (void)v27);
            if ([v21 isEqualToString:v10])
            {
              (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

              goto LABEL_31;
            }

            v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          id v18 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      uint64_t v22 = *(void *)(a1 + 64);
      id v16 = +[NSError errorWithDomain:CSErrorDomain code:404 userInfo:0];
      (*(void (**)(uint64_t, void, id))(v22 + 16))(v22, 0, v16);
LABEL_31:

      int v15 = v25;
      id v6 = v26;
    }

LABEL_33:
  }
}

void sub_1000060A8(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v16 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!*(void *)(a1 + 40))
  {
    if (v9)
    {
      id v12 = +[CSFPreferences sharedPreferences];
      uint64_t v13 = [v9 modelHash];
      [v12 setHearstFirstPassModelVersion:v13];
    }
    if (v10)
    {
      uint64_t v14 = +[CSFPreferences sharedPreferences];
      [v14 setHearstSecondPassModelVersion:v10];
    }
  }
  uint64_t v15 = *(void *)(a1 + 32);
  if (v15) {
    (*(void (**)(uint64_t, id, id, id))(v15 + 16))(v15, v16, v9, v11);
  }
}

void sub_1000061B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    CFStringRef v7 = [v5 rtModelWithRequestOptions:*(void *)(a1 + 32)];
    uint64_t v8 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = v8;
      id v11 = [v5 resourcePath];
      id v12 = [v5 configVersion];
      *(_DWORD *)buf = 136316162;
      v56 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]_block_invoke";
      __int16 v57 = 2112;
      *(void *)v58 = v9;
      *(_WORD *)&v58[8] = 2112;
      *(void *)v59 = v11;
      *(_WORD *)&v59[8] = 2112;
      *(void *)v60 = v12;
      *(_WORD *)&v60[8] = 2112;
      v61 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Queried model for language:%@ path:%@ configVers:%@ model:%@", buf, 0x34u);
    }
    uint64_t v13 = [v5 rtModelLocaleMapWithModelType:*(void *)(a1 + 80)];
    if (v13)
    {
      if (v7)
      {
LABEL_6:
        v42 = v13;
        id v43 = v6;
        id v44 = v5;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v14 = *(id *)(a1 + 56);
        id v15 = [v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v50;
          while (2)
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v50 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void **)(*((void *)&v49 + 1) + 8 * i);
              v20 = [v19 modelHash];
              v21 = [v7 modelHash];
              unsigned int v22 = [v20 isEqualToString:v21];

              if (v22)
              {
                long long v33 = CSLogContextFacilityCoreSpeech;
                id v6 = v43;
                if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v56 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:comple"
                        "tion:]_block_invoke";
                  __int16 v57 = 2114;
                  *(void *)v58 = v19;
                  _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s Hash matched with downloadedModel : %{public}@, accessory will select this model", buf, 0x16u);
                }
                (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
                id v5 = v44;
LABEL_40:
                uint64_t v13 = v42;
                goto LABEL_41;
              }
            }
            id v16 = [v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }

        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v14 = *(id *)(a1 + 64);
        id v23 = [v14 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v46;
          while (2)
          {
            for (j = 0; j != v24; j = (char *)j + 1)
            {
              if (*(void *)v46 != v25) {
                objc_enumerationMutation(v14);
              }
              long long v27 = *(void **)(*((void *)&v45 + 1) + 8 * (void)j);
              long long v28 = [v27 modelHash];
              long long v29 = [v7 modelHash];
              unsigned int v30 = [v28 isEqualToString:v29];

              if (v30)
              {
                v36 = CSLogContextFacilityCoreSpeech;
                if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v56 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:comple"
                        "tion:]_block_invoke";
                  __int16 v57 = 2114;
                  *(void *)v58 = v27;
                  _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%s Hash matched with preinstalledModel : %{public}@, accessory will select this model", buf, 0x16u);
                }
                (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
                id v6 = v43;
                id v5 = v44;
                goto LABEL_40;
              }
            }
            id v24 = [v14 countByEnumeratingWithState:&v45 objects:v53 count:16];
            if (v24) {
              continue;
            }
            break;
          }
        }

        uint64_t v13 = v42;
        id v14 = [*(id *)(a1 + 48) selectFallbackModelForLocale:*(void *)(a1 + 40) downloadedModels:*(void *)(a1 + 56) preinstalledModels:*(void *)(a1 + 64) rtLocaleMap:v42];
        long long v31 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v56 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]_block_invoke";
          __int16 v57 = 2114;
          *(void *)v58 = v7;
          *(_WORD *)&v58[8] = 2114;
          *(void *)v59 = v14;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s Ask for download : %{public}@, and use %{public}@ as fallback", buf, 0x20u);
        }
        (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
        id v6 = v43;
        id v5 = v44;
        goto LABEL_41;
      }
    }
    else
    {
      long long v34 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v56 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]_block_invoke";
        _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s rtLocaleMap is nil fallback to embedded locale map", buf, 0xCu);
      }
      uint64_t v13 = [*(id *)(a1 + 48) getAccessoryFallbackLocalTable];
      if (v7) {
        goto LABEL_6;
      }
    }
    id v14 = [*(id *)(a1 + 48) selectFallbackModelForLocale:*(void *)(a1 + 40) downloadedModels:*(void *)(a1 + 56) preinstalledModels:*(void *)(a1 + 64) rtLocaleMap:v13];
    v35 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = *(void *)(a1 + 88);
      uint64_t v40 = *(void *)(a1 + 96);
      uint64_t v41 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      v56 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]_block_invoke";
      __int16 v57 = 1026;
      *(_DWORD *)v58 = v39;
      *(_WORD *)&v58[4] = 1026;
      *(_DWORD *)&v58[6] = v40;
      *(_WORD *)v59 = 2114;
      *(void *)&v59[2] = v41;
      *(_WORD *)v60 = 2114;
      *(void *)&v60[2] = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s accessoryRTBlobs are not available for the version(%{public}d.%{public}d) and locale:%{public}@, returning fallback model : %{public}@", buf, 0x2Cu);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_41:

    goto LABEL_42;
  }
  long long v32 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v37 = v32;
    v38 = [v6 localizedDescription];
    *(_DWORD *)buf = 136315394;
    v56 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]_block_invoke";
    __int16 v57 = 2114;
    *(void *)v58 = v38;
    _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s VoiceTriggerAsset is not available : %{public}@", buf, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_42:
}

void sub_100007454(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = a2;
  int v4 = +[NSNumber numberWithUnsignedInteger:v3];
  [v6 setEngineMajorVersion:v4];

  id v5 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  [v6 setEngineMinorVersion:v5];

  [v6 setSiriLocale:@"en-US"];
}

void sub_100007A0C(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:v4];
  [v5 refresh];
  id v6 = [v5 levelForFactor:@"AssetData" withNamespaceName:v4];
  CFStringRef v7 = v6;
  if (v6
    && ([v6 fileValue],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v8 path],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    id v10 = [v7 fileValue];
    id v11 = [v10 path];

    id v12 = [v5 levelForFactor:@"isAssetArchived" withNamespaceName:v4];

    if (v12 && [v12 BOOLeanValue])
    {
      uint64_t v13 = +[CSFPreferences sharedPreferences];
      id v14 = [v13 trialBaseAssetDirectory];

      id v15 = +[CSAssetController getAssetTypeStringForType:a1[6]];
      id v16 = [v14 stringByAppendingPathComponent:v15];

      id v11 = [v16 stringByAppendingPathComponent:@"TrialAssetData"];
    }
    CFStringRef v7 = [v5 levelForFactor:@"AssetVersion" withNamespaceName:v4];

    uint64_t v17 = a1[6];
    id v18 = [v7 stringValue];
    uint64_t v19 = +[CSAsset assetForAssetType:v17 resourcePath:v11 configVersion:v18 assetProvider:1];

    if (v19)
    {
      v20 = 0;
    }
    else
    {
      id v26 = +[NSString stringWithFormat:@"Unable to get Trial asset from path: %@", v11];
      long long v27 = CSLogCategoryAsset;
      if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "-[CSTrialAssetManager getInstalledAssetofType:forLocale:completion:]_block_invoke";
        __int16 v37 = 2112;
        v38 = v26;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }
      uint64_t v28 = CSErrorDomain;
      CFStringRef v31 = @"reason";
      long long v32 = v26;
      long long v29 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      v20 = +[NSError errorWithDomain:v28 code:1601 userInfo:v29];
    }
    uint64_t v30 = a1[5];
    if (v30) {
      (*(void (**)(uint64_t, void *, void *))(v30 + 16))(v30, v19, v20);
    }
  }
  else
  {
    v21 = [v7 fileValue];
    unsigned int v22 = [v21 path];
    uint64_t v19 = +[NSString stringWithFormat:@"Unable to get Trial asset from path: %@", v22];

    id v23 = CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[CSTrialAssetManager getInstalledAssetofType:forLocale:completion:]_block_invoke";
      __int16 v37 = 2112;
      v38 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }
    uint64_t v24 = CSErrorDomain;
    CFStringRef v33 = @"reason";
    long long v34 = v19;
    uint64_t v25 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    v20 = +[NSError errorWithDomain:v24 code:1601 userInfo:v25];

    (*(void (**)(void))(a1[5] + 16))();
  }
}

void sub_100007F3C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = a3;
  id v6 = [v4 objectForKeyedSubscript:v5];
  [v6 refresh];
  uint64_t v7 = *(void *)(a1 + 56);
  CFStringRef v8 = @"com.apple.siri.sp.mitigation";
  if (v7 != 6) {
    CFStringRef v8 = 0;
  }
  if (v7) {
    CFStringRef v9 = v8;
  }
  else {
    CFStringRef v9 = @"com.apple.siri.sp.invocation";
  }
  id v10 = [*(id *)(a1 + 40) stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  id v11 = [v6 UAFLevelForFactor:v9 withNamespaceName:v5 withLanguage:v10];

  id v12 = [v11 directoryValue];
  uint64_t v13 = [v12 path];

  id v14 = [v11 metadata];
  id v15 = [v14 objectForKey:@"version"];

  id v16 = [v11 metadata];
  uint64_t v17 = [v16 objectForKey:@"locale"];

  id v18 = CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 136315906;
    v38 = "-[CSTrialAssetManager _getSiriAttAssetsForType:forLocale:completion:]_block_invoke";
    __int16 v39 = 2048;
    uint64_t v40 = v19;
    __int16 v41 = 2112;
    v42 = v17;
    __int16 v43 = 2112;
    id v44 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s Got Trial rollout for assetType: %lu for locale: %@ version: %@", buf, 0x2Au);
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100008370;
  v29[3] = &unk_10001C640;
  id v30 = *(id *)(a1 + 48);
  v20 = objc_retainBlock(v29);
  if (v13 && v15 && v17)
  {
    if ([*(id *)(a1 + 40) isEqualToString:v17])
    {
      v21 = +[CSFPreferences sharedPreferences];
      unsigned int v22 = [v21 bypassTrialAssets];

      if (!v22)
      {
        id v23 = +[CSAsset assetForAssetType:*(void *)(a1 + 56) resourcePath:v13 configVersion:v15 assetProvider:1];
        ((void (*)(void *, void *, void))v20[2])(v20, v23, 0);
        goto LABEL_17;
      }
      id v23 = +[NSString stringWithFormat:@"Trial asset bypass is set"];
      uint64_t v24 = CSErrorDomain;
      CFStringRef v31 = @"reason";
      long long v32 = v23;
      uint64_t v25 = &v32;
      id v26 = &v31;
    }
    else
    {
      id v23 = +[NSString stringWithFormat:@"Mismatch between Current locale: %@ & Trial rollout locale: %@", *(void *)(a1 + 40), v17];
      uint64_t v24 = CSErrorDomain;
      CFStringRef v33 = @"reason";
      long long v34 = v23;
      uint64_t v25 = &v34;
      id v26 = &v33;
    }
  }
  else
  {
    id v23 = +[NSString stringWithFormat:@"Unable to get Trial factor: %@", v9];
    uint64_t v24 = CSErrorDomain;
    CFStringRef v35 = @"reason";
    v36 = v23;
    uint64_t v25 = &v36;
    id v26 = &v35;
  }
  long long v27 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v26 count:1];
  uint64_t v28 = +[NSError errorWithDomain:v24 code:1601 userInfo:v27];

  ((void (*)(void *, void, void *))v20[2])(v20, 0, v28);
LABEL_17:
}

void sub_100008370(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v9 = v7;
      id v10 = [v6 localizedDescription];
      id v11 = [v6 userInfo];
      int v12 = 136315650;
      uint64_t v13 = "-[CSTrialAssetManager _getSiriAttAssetsForType:forLocale:completion:]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s %@ - %@", (uint8_t *)&v12, 0x20u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

void sub_1000086F4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v5 = +[TRIClient clientWithIdentifier:a2];
  if (v5) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
}

void sub_1000087C0(id a1)
{
  qword_100022D58 = objc_alloc_init(CSTrialAssetManager);
  _objc_release_x1();
}

void sub_100008C54(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setSiriLocale:v3];
  [v4 setAllowMph:*(unsigned __int8 *)(a1 + 88)];
  [v4 setUserSelectedPhraseType:*(void *)(a1 + 40)];
  [v4 setEndpointId:*(void *)(a1 + 48)];
  [v4 setEngineMajorVersion:*(void *)(a1 + 56)];
  [v4 setEngineMinorVersion:*(void *)(a1 + 64)];
  [v4 setAccessoryModelType:*(void *)(a1 + 72)];
  [v4 setCSCoreSpeechServicesAccessoryInfo:*(void *)(a1 + 80)];
}

void sub_100008DAC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100008DC8(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained siriLocale];
  [v3 setSiriLocale:v5];

  id v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "setAllowMph:", objc_msgSend(v6, "allowMph"));

  id v7 = objc_loadWeakRetained(v2);
  uint64_t v8 = [v7 userSelectedPhraseType];
  [v3 setUserSelectedPhraseType:v8];

  id v9 = objc_loadWeakRetained(v2);
  id v10 = [v9 endpointId];
  [v3 setEndpointId:v10];

  id v11 = objc_loadWeakRetained(v2);
  int v12 = [v11 engineMajorVersion];
  [v3 setEngineMajorVersion:v12];

  id v13 = objc_loadWeakRetained(v2);
  __int16 v14 = [v13 engineMinorVersion];
  [v3 setEngineMinorVersion:v14];

  id v15 = objc_loadWeakRetained(v2);
  __int16 v16 = [v15 accessoryModelType];
  [v3 setAccessoryModelType:v16];

  id v18 = objc_loadWeakRetained(v2);
  uint64_t v17 = [v18 accessoryInfo];
  [v3 setCSCoreSpeechServicesAccessoryInfo:v17];
}

void sub_100009034(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [*(id *)(a1 + 32) siriLocale];
  [v11 setSiriLocale:v3];

  objc_msgSend(v11, "setAllowMph:", objc_msgSend(*(id *)(a1 + 32), "allowMph"));
  id v4 = [*(id *)(a1 + 32) userSelectedPhraseType];
  [v11 setUserSelectedPhraseType:v4];

  id v5 = [*(id *)(a1 + 32) endpointId];
  [v11 setEndpointId:v5];

  id v6 = [*(id *)(a1 + 32) engineMajorVersion];
  [v11 setEngineMajorVersion:v6];

  id v7 = [*(id *)(a1 + 32) engineMinorVersion];
  [v11 setEngineMinorVersion:v7];

  uint64_t v8 = [*(id *)(a1 + 32) accessoryModelType];
  [v11 setAccessoryModelType:v8];

  id v9 = [*(id *)(a1 + 32) accessoryInfo];
  [v11 setCSCoreSpeechServicesAccessoryInfo:v9];

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
  }
}

void sub_1000095CC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) observers];
  id v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    id v7 = [*(id *)(a1 + 32) observers];
    id v5 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    id v6 = [v7 objectForKeyedSubscript:v5];
    [v6 removeObject:*(void *)(a1 + 40)];
  }
}

void sub_10000976C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) observers];
  id v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (!v4)
  {
    id v5 = +[NSHashTable weakObjectsHashTable];
    id v6 = [*(id *)(a1 + 32) observers];
    id v7 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    [v6 setObject:v5 forKeyedSubscript:v7];
  }
  id v10 = [*(id *)(a1 + 32) observers];
  uint64_t v8 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  id v9 = [v10 objectForKeyedSubscript:v8];
  [v9 addObject:*(void *)(a1 + 40)];
}

void sub_100009BE4(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 expectedTimeRemaining];
  if (v3 <= 0.0)
  {
    [*(id *)(a1 + 32) attachProgressCallBack:0];
  }
  else
  {
    double v4 = (double)(uint64_t)[v6 totalWritten];
    if (v4 / (float)(uint64_t)[v6 totalExpected] > 0.0)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      if (v5) {
        (*(void (**)(void))(v5 + 16))();
      }
    }
  }
}

void sub_100009C88(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    if (v2)
    {
      id v5 = +[NSError errorWithDomain:CSErrorDomain code:804 userInfo:0];
      (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
    }
  }
  else if (v2)
  {
    double v3 = *(void (**)(uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4, 0);
  }
}

void sub_100009EA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)CSLogCategoryAsset;
  if (v3)
  {
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = v4;
      id v7 = [v5 assetServerUrl];
      uint64_t v8 = [v3 localizedDescription];
      int v13 = 136315650;
      __int16 v14 = "-[CSAssetController _downloadAsset:withComplete:]_block_invoke";
      __int16 v15 = 2114;
      __int16 v16 = v7;
      __int16 v17 = 2114;
      id v18 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s ::: Error downloading from %{public}@ with error %{public}@", (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *(void **)(a1 + 32);
      id v10 = v4;
      id v11 = [v9 assetServerUrl];
      int v13 = 136315394;
      __int16 v14 = "-[CSAssetController _downloadAsset:withComplete:]_block_invoke";
      __int16 v15 = 2114;
      __int16 v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s ::: download completed successfully from %{public}@.", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) {
      (*(void (**)(void))(v12 + 16))();
    }
  }
}

void sub_10000A048(id a1, double a2)
{
  id v3 = CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[CSAssetController _downloadAsset:withComplete:]_block_invoke";
    __int16 v6 = 2050;
    double v7 = a2 * 100.0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ::: download progress: %{public}3.0f%%", (uint8_t *)&v4, 0x16u);
  }
}

void sub_10000A6A4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A750;
  block[3] = &unk_10001C998;
  id v3 = *(id *)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 48);
  dispatch_async(v2, block);
}

void sub_10000A750(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  id v3 = [*(id *)(a1 + 32) observers];
  int v4 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
    double v7 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    uint64_t v8 = [v6 objectForKeyedSubscript:v7];

    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v12);
          if (objc_opt_respondsToSelector()) {
            [v13 CSAssetController:*(void *)(a1 + 32) didDownloadNewAssetForType:*(void *)(a1 + 48)];
          }
          uint64_t v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

void sub_10000AA68(uint64_t a1, uint64_t a2)
{
  int v4 = CSLogCategoryAsset;
  if (a2)
  {
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      int v9 = 136315650;
      id v10 = "-[CSAssetController _downloadAssetCatalogForAssetType:complete:]_block_invoke";
      __int16 v11 = 2050;
      uint64_t v12 = v8;
      __int16 v13 = 2050;
      uint64_t v14 = a2;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Failed to download meta data for assetType %{public}lu with error %{public}lu", (uint8_t *)&v9, 0x20u);
    }
    id v5 = +[NSError errorWithDomain:CSErrorDomain code:804 userInfo:0];
  }
  else
  {
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      int v9 = 136315394;
      id v10 = "-[CSAssetController _downloadAssetCatalogForAssetType:complete:]_block_invoke";
      __int16 v11 = 2050;
      uint64_t v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Meta data downloaded successfully for assetType %{public}lu", (uint8_t *)&v9, 0x16u);
    }
    id v5 = 0;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v5, [*(id *)(a1 + 32) _isRetryRecommendedWithResult:a2]);
  }
}

void sub_10000ACF0(uint64_t a1, uint64_t a2)
{
  int v4 = [*(id *)(a1 + 32) queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000ADD4;
  v9[3] = &unk_10001C948;
  uint64_t v14 = a2;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 64);
  id v10 = v5;
  uint64_t v15 = v6;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = *(id *)(a1 + 56);
  dispatch_async(v4, v9);
}

void sub_10000ADD4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  if (!v2)
  {
    uint64_t v6 = [*(id *)(a1 + 32) results];
    id v5 = +[CSAssetController filteredAssetsForAssets:v6 assetType:*(void *)(a1 + 72) language:*(void *)(a1 + 40)];

    id v7 = (void *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v7;
      id v9 = [v5 count];
      uint64_t v10 = *(void *)(a1 + 72);
      int v12 = 136315650;
      id v13 = "-[CSAssetController _fetchRemoteAssetOfType:withLanguage:query:completion:]_block_invoke_2";
      __int16 v14 = 2050;
      id v15 = v9;
      __int16 v16 = 2050;
      uint64_t v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s ::: found %{public}lu assets for assetType %{public}lu", (uint8_t *)&v12, 0x20u);
    }
    [*(id *)(a1 + 48) _updateFromRemoteToLocalAssets:v5 forAssetType:*(void *)(a1 + 72) completion:*(void *)(a1 + 56)];
    goto LABEL_9;
  }
  id v3 = CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
  {
    id v11 = *(void **)(a1 + 72);
    int v12 = 136315650;
    id v13 = "-[CSAssetController _fetchRemoteAssetOfType:withLanguage:query:completion:]_block_invoke";
    __int16 v14 = 2050;
    id v15 = v11;
    __int16 v16 = 2050;
    uint64_t v17 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s Failed to finish query for assetType %{public}lu with error %{public}lu", (uint8_t *)&v12, 0x20u);
  }
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4)
  {
    id v5 = +[NSError errorWithDomain:CSErrorDomain code:802 userInfo:0];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
LABEL_9:
  }
}

void sub_10000B200(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (v5)
  {
    if (*(unsigned char *)(a1 + 48)) {
      BOOL v6 = a3 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      id v7 = CSLogCategoryAsset;
      if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v14 = "-[CSAssetController fetchRemoteMetaOfType:allowRetry:]_block_invoke";
        __int16 v15 = 2050;
        uint64_t v16 = 0x4072C00000000000;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Fetching remote meta data failed, scheduled retry after %{public}f seconds", buf, 0x16u);
      }
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      dispatch_time_t v8 = dispatch_time(0, 0x45D9648000);
      id v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10000B3C4;
      v11[3] = &unk_10001C8F8;
      objc_copyWeak(v12, (id *)buf);
      v12[1] = *(id *)(a1 + 40);
      dispatch_after(v8, v9, v11);
      objc_destroyWeak(v12);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 32) _assetQueryForAssetType:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _runAssetQuery:v10 completion:0];
  }
}

void sub_10000B3C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained fetchRemoteMetaOfType:*(void *)(a1 + 40) allowRetry:0];
}

void sub_10000B590(uint64_t a1, void *a2)
{
  if (a2
    || ([*(id *)(a1 + 32) results],
        id v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 count],
        v7,
        !v8))
  {
    uint64_t v4 = CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      __int16 v15 = "-[CSAssetController _runAssetQuery:completion:]_block_invoke";
      __int16 v16 = 2050;
      id v17 = a2;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Error running asset query: error %{public}lu, or result is empty", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      BOOL v6 = +[NSError errorWithDomain:CSErrorDomain code:802 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
LABEL_11:
    }
  }
  else
  {
    id v9 = (void *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void **)(a1 + 32);
      id v11 = v9;
      int v12 = [v10 results];
      int v14 = 136315394;
      __int16 v15 = "-[CSAssetController _runAssetQuery:completion:]_block_invoke";
      __int16 v16 = 2050;
      id v17 = [v12 count];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Found %{public}lu assets", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13)
    {
      BOOL v6 = [*(id *)(a1 + 32) results];
      (*(void (**)(uint64_t, void *, void))(v13 + 16))(v13, v6, 0);
      goto LABEL_11;
    }
  }
}

void sub_10000BD04(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    id v7 = [*(id *)(a1 + 32) results];
    BOOL v6 = +[CSAssetController filteredAssetsForAssets:v7 assetType:*(void *)(a1 + 64) language:*(void *)(a1 + 40)];

    id v8 = (void *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      id v10 = [v6 count];
      uint64_t v11 = *(void *)(a1 + 64);
      int v12 = [*(id *)(a1 + 32) queryParams];
      int v18 = 136315906;
      uint64_t v19 = "-[CSAssetController _installedAssetOfType:query:withLanguage:completion:]_block_invoke";
      __int16 v20 = 2050;
      id v21 = v10;
      __int16 v22 = 2050;
      uint64_t v23 = v11;
      __int16 v24 = 2114;
      unint64_t v25 = (unint64_t)v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s ::: found %{public}lu assets for assetType=%{public}lu, matching query: %{public}@", (uint8_t *)&v18, 0x2Au);
    }
    uint64_t v13 = [*(id *)(a1 + 48) _findLatestInstalledAsset:v6];
    uint64_t v14 = *(void *)(a1 + 56);
    if (v13)
    {
      if (v14) {
        (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v13, 0);
      }
    }
    else if (v14)
    {
      __int16 v15 = +[NSError errorWithDomain:CSErrorDomain code:802 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);
    }
    goto LABEL_14;
  }
  uint64_t v4 = CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
  {
    __int16 v16 = *(void **)(a1 + 64);
    uint64_t v17 = *(void *)(a1 + 32);
    int v18 = 136315906;
    uint64_t v19 = "-[CSAssetController _installedAssetOfType:query:withLanguage:completion:]_block_invoke";
    __int16 v20 = 2050;
    id v21 = v16;
    __int16 v22 = 2114;
    uint64_t v23 = v17;
    __int16 v24 = 2050;
    unint64_t v25 = a2;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Error running asset-query for assetType:%{public}lu, query: %{public}@, error: %{public}lu", (uint8_t *)&v18, 0x2Au);
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5)
  {
    BOOL v6 = +[NSError errorWithDomain:CSErrorDomain code:803 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
LABEL_14:
  }
}

void sub_10000C334(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C3D8;
  v7[3] = &unk_10001C808;
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v8 = v5;
  uint64_t v9 = v6;
  [v2 _installedAssetOfType:v4 withLanguage:v3 completion:v7];
}

void sub_10000C3D8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = a3;
    id v7 = [a2 getCSAssetOfType:v5];
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v7, v6);
  }
}

void sub_10000C59C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000C5B4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000C5C4(uint64_t a1)
{
}

uint64_t sub_10000C5CC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _installedAssetOfType:*(void *)(a1 + 56) withLanguage:*(void *)(a1 + 40)];
  return _objc_release_x1();
}

void sub_10000CA14(uint64_t a1)
{
  id v2 = objc_alloc((Class)MAAssetQuery);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v4 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  id v6 = [v2 initWithType:v5];

  if (*(void *)(a1 + 56) == 5)
  {
    uint64_t v7 = ASAttributeCompatibilityVersion;
    id v8 = +[NSString stringWithFormat:@"%lu", *(void *)(a1 + 64)];
    [v6 addKeyValuePair:v7 with:v8];
  }
  else
  {
    id v18 = v6;
    +[CSAssetController addKeyValuePairForQuery:assetType:](CSAssetController, "addKeyValuePairForQuery:assetType:", &v18);
    id v9 = v18;

    id v6 = v9;
  }
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000CBB4;
  v15[3] = &unk_10001C808;
  uint64_t v12 = *(void *)(a1 + 56);
  id v13 = *(id *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 56);
  id v16 = v13;
  uint64_t v17 = v14;
  [v10 _installedAssetOfType:v12 query:v6 withLanguage:v11 completion:v15];
  [*(id *)(a1 + 32) _fetchRemoteAssetOfType:*(void *)(a1 + 56) withLanguage:*(void *)(a1 + 40) query:v6 completion:0];
}

void sub_10000CBB4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = a3;
    id v7 = [a2 getCSAssetOfType:v5];
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v7, v6);
  }
}

id sub_10000CE04(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchRemoteAssetOfType:*(void *)(a1 + 48) withLanguage:*(void *)(a1 + 40) completion:0];
}

void sub_10000D144(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 state] == (id)2
    || [v5 state] == (id)3
    || [v5 state] == (id)5
    || [v5 state] == (id)6)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = [v5 getCSAssetOfType:*(void *)(a1 + 40)];
    [v3 addObject:v4];
  }
}

int64_t sub_10000D1E8(id a1, MAAsset *a2, MAAsset *a3)
{
  if ([(MAAsset *)a2 isLatestCompareTo:a3]) {
    return -1;
  }
  else {
    return 1;
  }
}

id sub_10000D384(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchRemoteAssetOfType:*(void *)(a1 + 48) withLanguage:*(void *)(a1 + 40) completion:0];
}

id sub_10000D74C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanUpMobileAssetV1Directory];
}

void sub_10000D894(id a1)
{
  qword_100022D68 = objc_alloc_init(CSAssetController);
  _objc_release_x1();
}

int64_t sub_10000EF40(id a1, NSDictionary *a2, NSDictionary *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  id v6 = [(NSDictionary *)v4 objectForKeyedSubscript:@"majorVersion"];
  unsigned int v7 = [v6 unsignedIntValue];
  id v8 = [(NSDictionary *)v5 objectForKeyedSubscript:@"majorVersion"];
  unsigned int v9 = [v8 unsignedIntValue];

  if (v7 > v9) {
    goto LABEL_5;
  }
  id v10 = [(NSDictionary *)v4 objectForKeyedSubscript:@"majorVersion"];
  unsigned int v11 = [v10 unsignedIntValue];
  uint64_t v12 = [(NSDictionary *)v5 objectForKeyedSubscript:@"majorVersion"];
  unsigned int v13 = [v12 unsignedIntValue];

  if (v11 < v13)
  {
    int64_t v14 = 1;
    goto LABEL_6;
  }
  __int16 v15 = [(NSDictionary *)v4 objectForKeyedSubscript:@"minorVersion"];
  unsigned int v16 = [v15 unsignedIntValue];
  uint64_t v17 = [(NSDictionary *)v5 objectForKeyedSubscript:@"minorVersion"];
  unsigned int v18 = [v17 unsignedIntValue];

  if (v16 > v18)
  {
LABEL_5:
    int64_t v14 = -1;
    goto LABEL_6;
  }
  __int16 v20 = [(NSDictionary *)v4 objectForKeyedSubscript:@"minorVersion"];
  unsigned int v21 = [v20 unsignedIntValue];
  __int16 v22 = [(NSDictionary *)v5 objectForKeyedSubscript:@"minorVersion"];
  unsigned int v23 = [v22 unsignedIntValue];

  if (v21 < v23) {
    int64_t v14 = 1;
  }
  else {
    int64_t v14 = -1;
  }
LABEL_6:

  return v14;
}

void sub_10000FE40(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = +[NSNumber numberWithUnsignedInteger:v3];
  [v4 setEngineMajorVersion:v5];

  id v6 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  [v4 setEngineMinorVersion:v6];
}

id sub_10001076C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2];
}

id sub_1000109E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didReceiveNewSpeechEndpointAssetMetaData];
}

void sub_100010A8C(id a1)
{
  qword_100022D78 = objc_alloc_init(CSSpeechEndpointAssetMetaUpdateMonitor);
  _objc_release_x1();
}

id sub_100010ED0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2];
}

id sub_100011390(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didReceiveNewVoiceTriggerAssetMetaData];
}

id sub_100011398(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didReceiveNewVoiceTriggerAssetMetaData];
}

id sub_1000113A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didReceiveNewVoiceTriggerAssetMetaData];
}

void sub_100011530(id a1)
{
  qword_100022D88 = objc_alloc_init(CSVoiceTriggerAssetMetaUpdateMonitor);
  _objc_release_x1();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA1(data, len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA256(data, len, md);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t CSHasAOP()
{
  return _CSHasAOP();
}

uint64_t CSIsASMacWithAOP()
{
  return _CSIsASMacWithAOP();
}

uint64_t CSIsGibraltarMac()
{
  return _CSIsGibraltarMac();
}

uint64_t CSIsHorseman()
{
  return _CSIsHorseman();
}

uint64_t CSIsIOS()
{
  return _CSIsIOS();
}

uint64_t CSIsIPad()
{
  return _CSIsIPad();
}

uint64_t CSIsInternalBuild()
{
  return _CSIsInternalBuild();
}

uint64_t CSIsOSX()
{
  return _CSIsOSX();
}

uint64_t CSIsTV()
{
  return _CSIsTV();
}

uint64_t CSIsWatch()
{
  return _CSIsWatch();
}

uint64_t CSLogInitIfNeeded()
{
  return _CSLogInitIfNeeded();
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MACleanV1Repository()
{
  return __MACleanV1Repository();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend__asssetMetaUpdatedKey(void *a1, const char *a2, ...)
{
  return [a1 _asssetMetaUpdatedKey];
}

id objc_msgSend__defaultDownloadOptions(void *a1, const char *a2, ...)
{
  return [a1 _defaultDownloadOptions];
}

id objc_msgSend__fetchTriggerMode(void *a1, const char *a2, ...)
{
  return [a1 _fetchTriggerMode];
}

id objc_msgSend_accessoryInfo(void *a1, const char *a2, ...)
{
  return [a1 accessoryInfo];
}

id objc_msgSend_accessoryModelType(void *a1, const char *a2, ...)
{
  return [a1 accessoryModelType];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allowMph(void *a1, const char *a2, ...)
{
  return [a1 allowMph];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assetServerUrl(void *a1, const char *a2, ...)
{
  return [a1 assetServerUrl];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_BOOLeanValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLeanValue];
}

id objc_msgSend_bypassTrialAssets(void *a1, const char *a2, ...)
{
  return [a1 bypassTrialAssets];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_canBePurged(void *a1, const char *a2, ...)
{
  return [a1 canBePurged];
}

id objc_msgSend_cancelDownloadSync(void *a1, const char *a2, ...)
{
  return [a1 cancelDownloadSync];
}

id objc_msgSend_configVersion(void *a1, const char *a2, ...)
{
  return [a1 configVersion];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultFallBackAssetForVoiceTrigger(void *a1, const char *a2, ...)
{
  return [a1 defaultFallBackAssetForVoiceTrigger];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_directoryValue(void *a1, const char *a2, ...)
{
  return [a1 directoryValue];
}

id objc_msgSend_endpointId(void *a1, const char *a2, ...)
{
  return [a1 endpointId];
}

id objc_msgSend_engineMajorVersion(void *a1, const char *a2, ...)
{
  return [a1 engineMajorVersion];
}

id objc_msgSend_engineMinorVersion(void *a1, const char *a2, ...)
{
  return [a1 engineMinorVersion];
}

id objc_msgSend_expectedTimeRemaining(void *a1, const char *a2, ...)
{
  return [a1 expectedTimeRemaining];
}

id objc_msgSend_fakeHearstModelPath(void *a1, const char *a2, ...)
{
  return [a1 fakeHearstModelPath];
}

id objc_msgSend_fakeVoiceTriggerAudioAccessoryFirstPassAssetPath(void *a1, const char *a2, ...)
{
  return [a1 fakeVoiceTriggerAudioAccessoryFirstPassAssetPath];
}

id objc_msgSend_fileValue(void *a1, const char *a2, ...)
{
  return [a1 fileValue];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_getAccessoryFallbackLocalTable(void *a1, const char *a2, ...)
{
  return [a1 getAccessoryFallbackLocalTable];
}

id objc_msgSend_getAdBlockerAssetTypeString(void *a1, const char *a2, ...)
{
  return [a1 getAdBlockerAssetTypeString];
}

id objc_msgSend_getAdBlockerCurrentCompatibilityVersion(void *a1, const char *a2, ...)
{
  return [a1 getAdBlockerCurrentCompatibilityVersion];
}

id objc_msgSend_getBertModelFile(void *a1, const char *a2, ...)
{
  return [a1 getBertModelFile];
}

id objc_msgSend_getDefaultBlob(void *a1, const char *a2, ...)
{
  return [a1 getDefaultBlob];
}

id objc_msgSend_getEndpointAssetCurrentCompatibilityVersion(void *a1, const char *a2, ...)
{
  return [a1 getEndpointAssetCurrentCompatibilityVersion];
}

id objc_msgSend_getEndpointAssetTypeString(void *a1, const char *a2, ...)
{
  return [a1 getEndpointAssetTypeString];
}

id objc_msgSend_getJarvisTriggerMode(void *a1, const char *a2, ...)
{
  return [a1 getJarvisTriggerMode];
}

id objc_msgSend_getLanguageDetectorAssetTypeString(void *a1, const char *a2, ...)
{
  return [a1 getLanguageDetectorAssetTypeString];
}

id objc_msgSend_getLanguageDetectorCurrentCompatibilityVersion(void *a1, const char *a2, ...)
{
  return [a1 getLanguageDetectorCurrentCompatibilityVersion];
}

id objc_msgSend_getOnDeviceCompilationCacheDirectory(void *a1, const char *a2, ...)
{
  return [a1 getOnDeviceCompilationCacheDirectory];
}

id objc_msgSend_getSpeakerRecognitionAssetTypeString(void *a1, const char *a2, ...)
{
  return [a1 getSpeakerRecognitionAssetTypeString];
}

id objc_msgSend_getSpeakerRecognitionCurrentCompatibilityVersion(void *a1, const char *a2, ...)
{
  return [a1 getSpeakerRecognitionCurrentCompatibilityVersion];
}

id objc_msgSend_getVoiceTriggerAssetCurrentCompatibilityVersion(void *a1, const char *a2, ...)
{
  return [a1 getVoiceTriggerAssetCurrentCompatibilityVersion];
}

id objc_msgSend_getVoiceTriggerAssetTypeString(void *a1, const char *a2, ...)
{
  return [a1 getVoiceTriggerAssetTypeString];
}

id objc_msgSend_hearstRTModelLocaleMap(void *a1, const char *a2, ...)
{
  return [a1 hearstRTModelLocaleMap];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isCSAssetInstalled(void *a1, const char *a2, ...)
{
  return [a1 isCSAssetInstalled];
}

id objc_msgSend_isDarwinOS(void *a1, const char *a2, ...)
{
  return [a1 isDarwinOS];
}

id objc_msgSend_isDownloading(void *a1, const char *a2, ...)
{
  return [a1 isDownloading];
}

id objc_msgSend_jarvisRTModelLocaleMap(void *a1, const char *a2, ...)
{
  return [a1 jarvisRTModelLocaleMap];
}

id objc_msgSend_lastFakeModelUsedHash(void *a1, const char *a2, ...)
{
  return [a1 lastFakeModelUsedHash];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_mAccessoryInfo(void *a1, const char *a2, ...)
{
  return [a1 mAccessoryInfo];
}

id objc_msgSend_mAccessoryModelType(void *a1, const char *a2, ...)
{
  return [a1 mAccessoryModelType];
}

id objc_msgSend_mAllowMph(void *a1, const char *a2, ...)
{
  return [a1 mAllowMph];
}

id objc_msgSend_mEndpointId(void *a1, const char *a2, ...)
{
  return [a1 mEndpointId];
}

id objc_msgSend_mEngineMajorVersion(void *a1, const char *a2, ...)
{
  return [a1 mEngineMajorVersion];
}

id objc_msgSend_mEngineMinorVersion(void *a1, const char *a2, ...)
{
  return [a1 mEngineMinorVersion];
}

id objc_msgSend_mSiriLocale(void *a1, const char *a2, ...)
{
  return [a1 mSiriLocale];
}

id objc_msgSend_mUserSelectedPhrasetype(void *a1, const char *a2, ...)
{
  return [a1 mUserSelectedPhrasetype];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_modelHash(void *a1, const char *a2, ...)
{
  return [a1 modelHash];
}

id objc_msgSend_modelLocale(void *a1, const char *a2, ...)
{
  return [a1 modelLocale];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return [a1 observers];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_purgeSync(void *a1, const char *a2, ...)
{
  return [a1 purgeSync];
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return [a1 queryMetaDataSync];
}

id objc_msgSend_queryParams(void *a1, const char *a2, ...)
{
  return [a1 queryParams];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return [a1 refresh];
}

id objc_msgSend_remoraRTModelLocaleMap(void *a1, const char *a2, ...)
{
  return [a1 remoraRTModelLocaleMap];
}

id objc_msgSend_resourcePath(void *a1, const char *a2, ...)
{
  return [a1 resourcePath];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return [a1 sharedController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_sharedStream(void *a1, const char *a2, ...)
{
  return [a1 sharedStream];
}

id objc_msgSend_shouldRollFakeModel(void *a1, const char *a2, ...)
{
  return [a1 shouldRollFakeModel];
}

id objc_msgSend_shouldUseHorsemanSpeechEndpointAssets(void *a1, const char *a2, ...)
{
  return [a1 shouldUseHorsemanSpeechEndpointAssets];
}

id objc_msgSend_siriLocale(void *a1, const char *a2, ...)
{
  return [a1 siriLocale];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_supportMphAssets(void *a1, const char *a2, ...)
{
  return [a1 supportMphAssets];
}

id objc_msgSend_supportPremiumAssets(void *a1, const char *a2, ...)
{
  return [a1 supportPremiumAssets];
}

id objc_msgSend_supportTrialMitigationAssets(void *a1, const char *a2, ...)
{
  return [a1 supportTrialMitigationAssets];
}

id objc_msgSend_supportsJustSiri(void *a1, const char *a2, ...)
{
  return [a1 supportsJustSiri];
}

id objc_msgSend_totalExpected(void *a1, const char *a2, ...)
{
  return [a1 totalExpected];
}

id objc_msgSend_totalWritten(void *a1, const char *a2, ...)
{
  return [a1 totalWritten];
}

id objc_msgSend_trialBaseAssetDirectory(void *a1, const char *a2, ...)
{
  return [a1 trialBaseAssetDirectory];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userSelectedPhraseType(void *a1, const char *a2, ...)
{
  return [a1 userSelectedPhraseType];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}

id objc_msgSend_xpcConnection_hasEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:hasEntitlement:");
}