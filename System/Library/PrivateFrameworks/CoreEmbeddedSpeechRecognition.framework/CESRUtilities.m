@interface CESRUtilities
+ (BOOL)aFEnableFeatureAndCheckPreferenceValueWithKey:(__CFString *)a3;
+ (BOOL)cooldownDisabledForDevice;
+ (BOOL)hasRecognizedAnythingInAFSpeechPackage:(id)a3;
+ (BOOL)isASRSupported;
+ (BOOL)isAssistantEnabled;
+ (BOOL)isCommonUserWithReason:(id *)a3;
+ (BOOL)isCustomerInstall;
+ (BOOL)isDictationEnabled;
+ (BOOL)isEARError:(id)a3;
+ (BOOL)isFilePathValid:(id)a3;
+ (BOOL)isInsufficientDiskSpaceError:(id)a3;
+ (BOOL)isSamplingSupportedForTask:(id)a3;
+ (BOOL)isSiriMuxSupported;
+ (BOOL)isSiriUODSupported;
+ (BOOL)isSiriUODwithASROnServerSupported;
+ (BOOL)isTaskDictationSpecific:(id)a3;
+ (BOOL)keepANEModelLoaded;
+ (double)audioDurationInMs:(id)a3 samplingRate:(unint64_t)a4;
+ (double)getHostClockFrequency;
+ (float)hostTimeToSeconds:(unint64_t)a3;
+ (id)AFSpeechInfoPackageForEARSpeechRecognitionResult:(id)a3;
+ (id)AFSpeechInfoPackageForEARSpeechRecognitionResultPackage:(id)a3;
+ (id)_alignTokenToFirstSeenPartialResult:(id)a3 tokenIndex:(unint64_t)a4 firstSeenPartialResultTokens:(id)a5 firstSeenPartialResultIndex:(unint64_t)a6;
+ (id)_firstSeenPartialResultIndicesForTokens:(id)a3 firstSeenPartialResultTokens:(id)a4;
+ (id)afRecognitionForEARSausage:(id)a3 processedAudioDuration:(double)a4;
+ (id)afSpeechPackageForEARPackage:(id)a3 processedAudioDuration:(double)a4 speechProfileUsed:(BOOL)a5 recognizerModelInfo:(id)a6 isVoiceCommandCandidatePackage:(BOOL)a7;
+ (id)afTokensForEARTokens:(id)a3 removeSpaceBefore:(BOOL)a4;
+ (id)afVoiceCommandGrammarParseResultForEARTokenString:(id)a3 withEARVoiceCommandInterpretations:(id)a4;
+ (id)alignedPartialResultIndicesForTokens:(id)a3 firstSeenPartialResultTokens:(id)a4;
+ (id)audioData:(id)a3 withBytesFromEnd:(unint64_t)a4;
+ (id)buildVersion;
+ (id)currentDictationLanguageCodes;
+ (id)currentSiriLanguageCode;
+ (id)earTokensForAFTokens:(id)a3 appendedAutoPunctuation:(BOOL)a4;
+ (id)earTokensToString:(id)a3;
+ (id)getNormString:(id)a3;
+ (id)installedAssistantLocale;
+ (id)installedDictationLocales;
+ (id)languageCodeForLocale:(id)a3;
+ (id)languageStringForLocaleString:(id)a3;
+ (id)localeStringForLanguageString:(id)a3;
+ (id)mapContextOptionToString:(unint64_t)a3;
+ (id)recognizerSourceForTask:(id)a3;
+ (id)speechProfileDateLastModifiedForLanguage:(id)a3;
+ (id)speechProfilePathsWithLanguage:(id)a3;
+ (id)speechProfileRootDirectories;
+ (id)voiceCommandsParamKeyBuilder:(unint64_t)a3;
+ (int64_t)_freeSpaceInBytesForPath:(id)a3;
+ (int64_t)calculateDiffInDaysFromTimestamp:(id)a3;
+ (unint64_t)audioLengthInBytes:(double)a3 samplingRate:(unint64_t)a4;
+ (unint64_t)machAbsoluteTimeToMachContinuousTime:(unint64_t)a3;
+ (unint64_t)secondsToHostTime:(float)a3;
+ (void)_cacheDeletePurgeSpaceWithInfo:(id)a3 completion:(id)a4;
+ (void)generateABCSnapshotForType:(id)a3 subType:(id)a4 context:(id)a5;
+ (void)loadSpeechProfiles:(id)a3 language:(id)a4;
+ (void)logToPowerLogForEventCategory:(id)a3 eventDictionary:(id)a4;
+ (void)purgeSpaceForModelCompilationAsNeeded:(unint64_t)a3 completion:(id)a4;
@end

@implementation CESRUtilities

+ (BOOL)isInsufficientDiskSpaceError:(id)a3
{
  id v3 = a3;
  if (+[CESRUtilities isEARError:v3]) {
    BOOL v4 = [v3 code] == 201;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

+ (BOOL)isEARError:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 domain];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F60F58]];

  return v4;
}

+ (void)_cacheDeletePurgeSpaceWithInfo:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, void))a4;
  if (!v5
    || ([v5 objectForKey:@"CACHE_DELETE_VOLUME"], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v8 = (void *)v7,
        [v5 objectForKey:@"CACHE_DELETE_AMOUNT"],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        !v9))
  {
    v16 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "+[CESRUtilities _cacheDeletePurgeSpaceWithInfo:completion:]";
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_error_impl(&dword_1B8CCB000, v16, OS_LOG_TYPE_ERROR, "%s The volume and/or amount to purge was not specified: %@", buf, 0x16u);
      if (!v6) {
        goto LABEL_10;
      }
    }
    else if (!v6)
    {
      goto LABEL_10;
    }
    v6[2](v6, 0);
    goto LABEL_10;
  }
  v10 = [v5 objectForKey:@"CACHE_DELETE_VOLUME"];
  v11 = [v5 objectForKey:@"CACHE_DELETE_AMOUNT"];
  uint64_t v12 = [v11 longLongValue];

  v13 = [MEMORY[0x1E4F28B68] stringFromByteCount:v12 countStyle:3];
  v17 = v6;
  id v14 = v13;
  CacheDeletePurgeSpaceWithInfo();
  v15 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "+[CESRUtilities _cacheDeletePurgeSpaceWithInfo:completion:]";
    __int16 v20 = 2112;
    id v21 = v14;
    __int16 v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_1B8CCB000, v15, OS_LOG_TYPE_DEFAULT, "%s Requested CacheDelete to purge %@ from volume: %@", buf, 0x20u);
  }

LABEL_10:
}

void __59__CESRUtilities__cacheDeletePurgeSpaceWithInfo_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    char v4 = [a2 objectForKey:@"CACHE_DELETE_ERROR"];
    id v5 = (NSObject **)MEMORY[0x1E4F4E380];
    if (v4)
    {
      v6 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        int v15 = 136315394;
        v16 = "+[CESRUtilities _cacheDeletePurgeSpaceWithInfo:completion:]_block_invoke";
        __int16 v17 = 2112;
        v18 = v4;
        _os_log_error_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_ERROR, "%s CacheDelete reported an error: %@", (uint8_t *)&v15, 0x16u);
      }
    }
    uint64_t v7 = [a2 objectForKey:@"CACHE_DELETE_AMOUNT"];
    uint64_t v8 = [v7 longLongValue];

    v9 = [MEMORY[0x1E4F28B68] stringFromByteCount:v8 countStyle:3];
    v10 = *v5;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = a1[4];
      int v15 = 136315650;
      v16 = "+[CESRUtilities _cacheDeletePurgeSpaceWithInfo:completion:]_block_invoke";
      __int16 v17 = 2112;
      v18 = v9;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      _os_log_impl(&dword_1B8CCB000, v10, OS_LOG_TYPE_DEFAULT, "%s CacheDelete purged %@ (requested %@).", (uint8_t *)&v15, 0x20u);
    }
    uint64_t v12 = a1[5];
    if (v12) {
      (*(void (**)(uint64_t, BOOL))(v12 + 16))(v12, a1[6] <= v8);
    }
  }
  else
  {
    v13 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      v16 = "+[CESRUtilities _cacheDeletePurgeSpaceWithInfo:completion:]_block_invoke";
      _os_log_error_impl(&dword_1B8CCB000, v13, OS_LOG_TYPE_ERROR, "%s CacheDelete failed to return any results.", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v14 = a1[5];
    if (v14) {
      (*(void (**)(uint64_t, void))(v14 + 16))(v14, 0);
    }
  }
}

+ (int64_t)_freeSpaceInBytesForPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    char v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v15 = 0;
    id v5 = [v4 attributesOfFileSystemForPath:v3 error:&v15];
    id v6 = v15;

    if (v5)
    {
      uint64_t v7 = [v5 objectForKey:*MEMORY[0x1E4F283A0]];
      uint64_t v8 = v7;
      if (v7)
      {
        uint64_t v9 = [v7 longLongValue];
        if (v9 <= 104857600) {
          int64_t v10 = 0;
        }
        else {
          int64_t v10 = v9 - 104857600;
        }
      }
      else
      {
        v13 = *MEMORY[0x1E4F4E380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v17 = "+[CESRUtilities _freeSpaceInBytesForPath:]";
          _os_log_error_impl(&dword_1B8CCB000, v13, OS_LOG_TYPE_ERROR, "%s File system attributes did not contain a value for NSFileSystemFreeSize.", buf, 0xCu);
        }
        int64_t v10 = -1;
      }
    }
    else
    {
      uint64_t v12 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v17 = "+[CESRUtilities _freeSpaceInBytesForPath:]";
        __int16 v18 = 2112;
        id v19 = v6;
        _os_log_error_impl(&dword_1B8CCB000, v12, OS_LOG_TYPE_ERROR, "%s Failed to retrieve file system attributes, error: %@", buf, 0x16u);
      }
      int64_t v10 = -1;
    }
  }
  else
  {
    uint64_t v11 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v17 = "+[CESRUtilities _freeSpaceInBytesForPath:]";
      _os_log_error_impl(&dword_1B8CCB000, v11, OS_LOG_TYPE_ERROR, "%s path cannot be nil.", buf, 0xCu);
    }
    int64_t v10 = -1;
  }

  return v10;
}

+ (void)purgeSpaceForModelCompilationAsNeeded:(unint64_t)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void))a4;
  id v6 = NSOpenStepRootDirectory();
  int64_t v7 = +[CESRUtilities _freeSpaceInBytesForPath:v6];
  if (v7 < 0)
  {
    uint64_t v14 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "+[CESRUtilities purgeSpaceForModelCompilationAsNeeded:completion:]";
      __int16 v20 = 2112;
      uint64_t v21 = v6;
      _os_log_error_impl(&dword_1B8CCB000, v14, OS_LOG_TYPE_ERROR, "%s Failed to evaluate the free space on volume: %@", buf, 0x16u);
      if (!v5) {
        goto LABEL_12;
      }
    }
    else if (!v5)
    {
      goto LABEL_12;
    }
    v5[2](v5, 0);
    goto LABEL_12;
  }
  int64_t v8 = v7;
  int64_t v9 = a3 << 20;
  int64_t v10 = [MEMORY[0x1E4F28B68] stringFromByteCount:a3 << 20 countStyle:3];
  uint64_t v11 = [MEMORY[0x1E4F28B68] stringFromByteCount:v8 countStyle:3];
  if (v9 <= v8)
  {
    id v15 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v19 = "+[CESRUtilities purgeSpaceForModelCompilationAsNeeded:completion:]";
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_1B8CCB000, v15, OS_LOG_TYPE_DEFAULT, "%s Free space (%@) already meets or exceeds the requested space: %@", buf, 0x20u);
    }
    if (v5) {
      v5[2](v5, 1);
    }
  }
  else
  {
    v17[0] = v6;
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithLongLong:", v9 - v8, @"CACHE_DELETE_VOLUME", @"CACHE_DELETE_AMOUNT");
    v16[2] = @"CACHE_DELETE_URGENCY";
    v17[1] = v12;
    v17[2] = &unk_1F129E308;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

    +[CESRUtilities _cacheDeletePurgeSpaceWithInfo:v13 completion:v5];
  }

LABEL_12:
}

+ (BOOL)isSamplingSupportedForTask:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "setWithObjects:", @"Dictation", @"WebSearch", @"SearchOrMessaging", @"SiriDictation", @"Beto", @"BetoDictation", 0);
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (id)installedAssistantLocale
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (os_log_t *)MEMORY[0x1E4F4E380];
  id v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    __int16 v18 = "+[CESRUtilities installedAssistantLocale]";
    _os_log_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_INFO, "%s Fetching installed Assistant locale...", (uint8_t *)&v17, 0xCu);
  }
  id v4 = objc_alloc(MEMORY[0x1E4F3C258]);
  id v5 = +[CESRUtilities currentSiriLanguageCode];
  char v6 = (void *)[v4 initWithLanguage:v5 assetType:3];

  id v7 = objc_alloc_init(MEMORY[0x1E4F3C268]);
  int64_t v8 = [v7 installedAssetWithConfig:v6];

  if (v8)
  {
    int64_t v9 = (void *)MEMORY[0x1E4F1CA20];
    int64_t v10 = [v6 language];
    uint64_t v11 = +[CESRUtilities localeStringForLanguageString:v10];
    uint64_t v12 = [v9 localeWithLocaleIdentifier:v11];
  }
  else
  {
    os_log_t v13 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = v13;
      id v15 = [v6 language];
      int v17 = 136315394;
      __int16 v18 = "+[CESRUtilities installedAssistantLocale]";
      __int16 v19 = 2112;
      __int16 v20 = v15;
      _os_log_impl(&dword_1B8CCB000, v14, OS_LOG_TYPE_INFO, "%s No asset for language: %@", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)installedDictationLocales
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "+[CESRUtilities installedDictationLocales]";
    _os_log_impl(&dword_1B8CCB000, v2, OS_LOG_TYPE_INFO, "%s Fetching installed Dictation locales...", buf, 0xCu);
  }
  id v3 = [MEMORY[0x1E4F1CA80] set];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = +[CESRUtilities currentDictationLanguageCodes];
  id v5 = [v4 allObjects];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v19;
    *(void *)&long long v7 = 136315394;
    long long v17 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x1E4F1CA20];
        os_log_t v13 = +[CESRUtilities localeStringForLanguageString:](CESRUtilities, "localeStringForLanguageString:", v11, v17);
        uint64_t v14 = [v12 localeWithLocaleIdentifier:v13];

        if (v14)
        {
          [v3 addObject:v14];
        }
        else
        {
          id v15 = *MEMORY[0x1E4F4E380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v23 = "+[CESRUtilities installedDictationLocales]";
            __int16 v24 = 2112;
            uint64_t v25 = v11;
            _os_log_error_impl(&dword_1B8CCB000, v15, OS_LOG_TYPE_ERROR, "%s Failed to resolve locale for language: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v8);
  }

  return v3;
}

+ (BOOL)keepANEModelLoaded
{
  return 0;
}

+ (BOOL)isCommonUserWithReason:(id *)a3
{
  return 0;
}

+ (BOOL)isTaskDictationSpecific:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Dictation"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"WebSearch"];
  }

  return v4;
}

+ (void)generateABCSnapshotForType:(id)a3 subType:(id)a4 context:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a5;
  if (AFIsInternalInstall())
  {
    id v9 = objc_alloc(MEMORY[0x1E4F4E570]);
    int64_t v10 = [MEMORY[0x1E4F4E4A0] defaultContext];
    uint64_t v11 = (void *)[v9 initWithInstanceContext:v10];

    [v11 triggerABCForType:v12 subType:v7 context:v8 completionHandler:&__block_literal_global_366];
  }
}

void __60__CESRUtilities_generateABCSnapshotForType_subType_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "+[CESRUtilities generateABCSnapshotForType:subType:context:]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_error_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_ERROR, "%s Unable to trigger ABC due to error %@.", (uint8_t *)&v4, 0x16u);
    }
  }
}

+ (void)logToPowerLogForEventCategory:(id)a3 eventDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = dispatch_get_global_queue(17, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__CESRUtilities_logToPowerLogForEventCategory_eventDictionary___block_invoke;
  v10[3] = &unk_1E61C3C70;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

uint64_t __63__CESRUtilities_logToPowerLogForEventCategory_eventDictionary___block_invoke(uint64_t a1)
{
  return MEMORY[0x1F4145D90](38, *(void *)(a1 + 32), *(void *)(a1 + 40), 0);
}

+ (id)_alignTokenToFirstSeenPartialResult:(id)a3 tokenIndex:(unint64_t)a4 firstSeenPartialResultTokens:(id)a5 firstSeenPartialResultIndex:(unint64_t)a6
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = [NSNumber numberWithUnsignedInteger:a4];
  v39 = v11;
  id v12 = [NSNumber numberWithUnsignedInteger:a6];
  v40[0] = v12;
  id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];

  v36 = v9;
  unint64_t v13 = [v9 count];
  uint64_t v14 = [v10 count];
  unint64_t v34 = v13;
  if (v13 > a4)
  {
    unint64_t v15 = v14;
    char v16 = 0;
    unint64_t v32 = a6;
    unint64_t v33 = a6 + a4;
    unint64_t v17 = -1;
    unint64_t v18 = a6;
    while (1)
    {
      long long v19 = objc_msgSend(v36, "objectAtIndexedSubscript:", a4, v32);
      long long v20 = [v19 tokenName];
      long long v21 = +[CESRUtilities getNormString:v20];

      unint64_t v22 = v18;
      if (v15 > v18) {
        break;
      }
LABEL_8:
      if (v16) {
        goto LABEL_9;
      }
      char v16 = 0;
      unint64_t v26 = v15;
LABEL_11:
      unint64_t v27 = a4 - v33 + v22 + v26;
      if (v27 < v17)
      {
        v28 = [NSNumber numberWithUnsignedInteger:a4];
        v37 = v28;
        v29 = [NSNumber numberWithUnsignedInteger:v22];
        v38 = v29;
        uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];

        if (!v27)
        {

          id v35 = (id)v30;
          goto LABEL_17;
        }
        id v35 = (id)v30;
        unint64_t v17 = v27;
      }

      ++a4;
      unint64_t v18 = v32;
      if (a4 == v34) {
        goto LABEL_17;
      }
    }
    char v23 = v16;
    unint64_t v22 = v18;
    while (1)
    {
      __int16 v24 = [v10 objectAtIndex:v22];
      uint64_t v25 = [v24 objectForKey:v21];

      if (v25) {
        break;
      }
      if (v15 == ++v22)
      {
        unint64_t v22 = v15;
        char v16 = v23;
        goto LABEL_8;
      }
    }
LABEL_9:
    unint64_t v26 = 0;
    char v16 = 1;
    goto LABEL_11;
  }
LABEL_17:

  return v35;
}

+ (id)_firstSeenPartialResultIndicesForTokens:(id)a3 firstSeenPartialResultTokens:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  __int16 v24 = v5;
  unint64_t v8 = [v5 count];
  char v23 = v6;
  uint64_t v9 = [v6 count];
  if (v8)
  {
    unint64_t v10 = v9;
    unint64_t v11 = 0;
    unint64_t v12 = 0;
    do
    {
      unint64_t v13 = +[CESRUtilities _alignTokenToFirstSeenPartialResult:v24 tokenIndex:v12 firstSeenPartialResultTokens:v23 firstSeenPartialResultIndex:v11];
      uint64_t v14 = [v13 allKeys];
      unint64_t v15 = [v14 firstObject];
      unint64_t v16 = [v15 unsignedIntegerValue];

      unint64_t v17 = [v13 allValues];
      unint64_t v18 = [v17 firstObject];
      unint64_t v19 = [v18 unsignedIntegerValue];

      unint64_t v20 = v16 - v12;
      if (v16 > v12)
      {
        do
        {
          [v7 addObject:&unk_1F129E2F0];
          --v20;
        }
        while (v20);
      }
      if (v19 >= v10)
      {
        [v7 addObject:&unk_1F129E2F0];
        unint64_t v11 = v10;
      }
      else
      {
        long long v21 = [NSNumber numberWithUnsignedInteger:v19];
        [v7 addObject:v21];

        unint64_t v11 = v19 + 1;
      }
      unint64_t v12 = v16 + 1;
    }
    while (v16 + 1 < v8);
  }

  return v7;
}

+ (id)alignedPartialResultIndicesForTokens:(id)a3 firstSeenPartialResultTokens:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v34 = v5;
  unint64_t v8 = +[CESRUtilities _firstSeenPartialResultIndicesForTokens:v5 firstSeenPartialResultTokens:v6];
  uint64_t v9 = [v8 count];
  unint64_t v33 = v6;
  uint64_t v10 = [v6 count];
  if (v9)
  {
    unint64_t v11 = v10;
    uint64_t v12 = 0;
    unint64_t v13 = __Block_byref_object_copy__1129;
    uint64_t v14 = __Block_byref_object_dispose__1130;
    unint64_t v32 = v8;
    do
    {
      uint64_t v36 = 0;
      v37 = (id *)&v36;
      uint64_t v38 = 0x3032000000;
      v39 = v13;
      v40 = v14;
      id v41 = &unk_1F129E2F0;
      unint64_t v15 = [v8 objectAtIndexedSubscript:v12];
      char v16 = [v15 isEqualToNumber:&unk_1F129E2F0];

      if ((v16 & 1) == 0)
      {
        unint64_t v17 = [v8 objectAtIndexedSubscript:v12];
        unint64_t v18 = [v17 unsignedIntegerValue];

        if (v18 < v11)
        {
          unint64_t v19 = v14;
          uint64_t v20 = v9;
          long long v21 = v13;
          unint64_t v22 = v11;
          char v23 = v7;
          __int16 v24 = [v34 objectAtIndex:v12];
          uint64_t v25 = [v24 tokenName];
          unint64_t v26 = +[CESRUtilities getNormString:v25];

          unint64_t v27 = [v33 objectAtIndex:v18];
          v28 = [v27 objectForKey:v26];
          if (v28)
          {
            objc_storeStrong(v37 + 5, v28);
          }
          else
          {
            uint64_t v29 = [NSNumber numberWithUnsignedInteger:-1];
            id v30 = v37[5];
            v37[5] = (id)v29;

            v35[0] = MEMORY[0x1E4F143A8];
            v35[1] = 3221225472;
            v35[2] = __83__CESRUtilities_alignedPartialResultIndicesForTokens_firstSeenPartialResultTokens___block_invoke;
            v35[3] = &unk_1E61C2FA8;
            v35[4] = &v36;
            [v27 enumerateKeysAndObjectsUsingBlock:v35];
          }

          id v7 = v23;
          unint64_t v11 = v22;
          unint64_t v13 = v21;
          uint64_t v9 = v20;
          uint64_t v14 = v19;
          unint64_t v8 = v32;
        }
      }
      [v7 addObject:v37[5]];
      _Block_object_dispose(&v36, 8);

      ++v12;
    }
    while (v9 != v12);
  }

  return v7;
}

uint64_t __83__CESRUtilities_alignedPartialResultIndicesForTokens_firstSeenPartialResultTokens___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v8 = *(void *)(v6 + 40);
  id v7 = (id *)(v6 + 40);
  if (v8 > (unint64_t)v5)
  {
    id v10 = v5;
    objc_storeStrong(v7, a3);
    id v5 = v10;
  }

  return MEMORY[0x1F41817F8](v7, v5);
}

+ (id)getNormString:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = objc_msgSend(v3, "lowercaseString", 0);
  uint64_t v6 = [v5 componentsSeparatedByString:@" "];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) componentsSeparatedByString:@"\\""];
        uint64_t v12 = [v11 firstObject];
        [v4 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  unint64_t v13 = [v4 componentsJoinedByString:@" "];

  return v13;
}

+ (BOOL)cooldownDisabledForDevice
{
  return 0;
}

+ (id)recognizerSourceForTask:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  if (v3 && [v3 isEqualToString:@"SearchOrMessaging"])
  {
    id v5 = @"Assistant";
    uint64_t v6 = @"Assistant";
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (BOOL)aFEnableFeatureAndCheckPreferenceValueWithKey:(__CFString *)a3
{
  id v3 = _AFPreferencesValueForKeyWithContext();
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) == 0 || [v3 BOOLValue];

  return v4;
}

+ (double)audioDurationInMs:(id)a3 samplingRate:(unint64_t)a4
{
  return (double)((unint64_t)[a3 length] >> 1) / (double)a4 * 1000.0;
}

+ (unint64_t)audioLengthInBytes:(double)a3 samplingRate:(unint64_t)a4
{
  return 2 * (unint64_t)(a3 / 1000.0 * (double)a4);
}

+ (id)audioData:(id)a3 withBytesFromEnd:(unint64_t)a4
{
  id v5 = a3;
  unint64_t v6 = [v5 length];
  if (a4)
  {
    if (v6 <= a4)
    {
      id v7 = v5;
    }
    else
    {
      objc_msgSend(v5, "subdataWithRange:", v6 - a4, a4);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
  }
  uint64_t v8 = v7;

  return v8;
}

+ (BOOL)isFilePathValid:(id)a3
{
  char v8 = 0;
  id v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  char v6 = [v5 fileExistsAtPath:v4 isDirectory:&v8];

  if (v8) {
    return 0;
  }
  else {
    return v6;
  }
}

+ (id)localeStringForLanguageString:(id)a3
{
  return (id)[a3 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
}

+ (id)languageStringForLocaleString:(id)a3
{
  return (id)[a3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
}

+ (id)languageCodeForLocale:(id)a3
{
  id v3 = NSString;
  uint64_t v4 = *MEMORY[0x1E4F1C438];
  id v5 = a3;
  char v6 = [v5 objectForKey:v4];
  id v7 = [v5 objectForKey:*MEMORY[0x1E4F1C400]];

  char v8 = [v3 stringWithFormat:@"%@-%@", v6, v7];

  return v8;
}

+ (id)mapContextOptionToString:(unint64_t)a3
{
  id v3 = @"unconstrained";
  if (a3 == 1) {
    id v3 = @"reduced";
  }
  if (a3 == 2) {
    return @"avoid";
  }
  else {
    return v3;
  }
}

+ (id)earTokensForAFTokens:(id)a3 appendedAutoPunctuation:(BOOL)a4
{
  BOOL v27 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v11 = objc_alloc(MEMORY[0x1E4F61008]);
        uint64_t v12 = [v10 text];
        [v10 startTime];
        double v14 = v13;
        [v10 endTime];
        double v16 = v15;
        [v10 silenceStartTime];
        double v18 = v17;
        double v19 = (double)[v10 confidenceScore];
        uint64_t v20 = [v10 removeSpaceAfter] ^ 1;
        uint64_t v21 = [v10 removeSpaceBefore] ^ 1;
        unint64_t v22 = [v10 phoneSequence];
        char v23 = [v10 ipaPhoneSequence];
        __int16 v24 = (void *)[v11 initWithTokenName:v12 start:v20 end:v21 silenceStart:v22 confidence:v23 hasSpaceAfter:v27 hasSpaceBefore:v14 phoneSequence:v16 ipaPhoneSequence:v18 appendedAutoPunctuation:v19];

        [v5 addObject:v24];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v7);
  }

  return v5;
}

+ (id)AFSpeechInfoPackageForEARSpeechRecognitionResultPackage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 recognition];
  char v5 = objc_opt_respondsToSelector();

  uint64_t v6 = [v3 recognition];
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v6 potentialCommandRecognition];
    uint64_t v9 = [v8 nBest];

    id v10 = [v3 nBestVoiceCommandInterpretations];
    id v11 = __73__CESRUtilities_AFSpeechInfoPackageForEARSpeechRecognitionResultPackage___block_invoke(v10, v9);
    uint64_t v12 = [v3 preITNRecognition];
    double v13 = [v12 potentialCommandRecognition];
    double v14 = [v13 nBest];
  }
  else
  {
    uint64_t v9 = [v6 nBest];

    id v10 = [v3 nBestVoiceCommandInterpretations];
    id v11 = __73__CESRUtilities_AFSpeechInfoPackageForEARSpeechRecognitionResultPackage___block_invoke(v10, v9);
    uint64_t v12 = [v3 preITNRecognition];
    double v14 = [v12 nBest];
  }

  double v15 = [v3 preITNNBestVoiceCommandInterpretations];

  double v16 = __73__CESRUtilities_AFSpeechInfoPackageForEARSpeechRecognitionResultPackage___block_invoke(v15, v14);
  if ([v11 count] || objc_msgSend(v16, "count"))
  {
    double v17 = (void *)[objc_alloc(MEMORY[0x1E4F4E668]) initWithNBestParses:v11 preITNNBestParses:v16];
    double v18 = (void *)[objc_alloc(MEMORY[0x1E4F4E5F0]) initWithCommandGrammarParsePackage:v17];
  }
  else
  {
    double v18 = 0;
  }

  return v18;
}

id __73__CESRUtilities_AFSpeechInfoPackageForEARSpeechRecognitionResultPackage___block_invoke(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if ([v3 count])
  {
    uint64_t v5 = [v3 count];
    if (v5 == [v4 count])
    {
      uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      double v13 = __73__CESRUtilities_AFSpeechInfoPackageForEARSpeechRecognitionResultPackage___block_invoke_336;
      double v14 = &unk_1E61C2F80;
      id v15 = v3;
      id v16 = v6;
      id v7 = v6;
      [v4 enumerateObjectsUsingBlock:&v11];
      uint64_t v8 = objc_msgSend(v7, "copy", v11, v12, v13, v14);

      goto LABEL_7;
    }
    uint64_t v9 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      double v18 = "+[CESRUtilities AFSpeechInfoPackageForEARSpeechRecognitionResultPackage:]_block_invoke";
      _os_log_error_impl(&dword_1B8CCB000, v9, OS_LOG_TYPE_ERROR, "%s Count of command interpretation sets does not match count of speech recognition results", buf, 0xCu);
    }
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_7:

  return v8;
}

void __73__CESRUtilities_AFSpeechInfoPackageForEARSpeechRecognitionResultPackage___block_invoke_336(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = +[CESRUtilities earTokensToString:a2];
  uint64_t v5 = [*(id *)(a1 + 32) objectAtIndex:a3];
  uint64_t v6 = +[CESRUtilities afVoiceCommandGrammarParseResultForEARTokenString:v7 withEARVoiceCommandInterpretations:v5];
  if (v6) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

+ (id)AFSpeechInfoPackageForEARSpeechRecognitionResult:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 tokens];
  uint64_t v5 = +[CESRUtilities earTokensToString:v4];

  uint64_t v6 = [v3 voiceCommandInterpretations];
  uint64_t v7 = +[CESRUtilities afVoiceCommandGrammarParseResultForEARTokenString:v5 withEARVoiceCommandInterpretations:v6];

  uint64_t v8 = [v3 preITNTokens];
  uint64_t v9 = +[CESRUtilities earTokensToString:v8];

  id v10 = [v3 preITNVoiceCommandInterpretations];

  uint64_t v11 = +[CESRUtilities afVoiceCommandGrammarParseResultForEARTokenString:v9 withEARVoiceCommandInterpretations:v10];

  if (!(v7 | v11))
  {
    double v14 = 0;
    goto LABEL_9;
  }
  if (!v7)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
    if (v11) {
      goto LABEL_4;
    }
LABEL_7:
    double v13 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_8;
  }
  v18[0] = v7;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  if (!v11) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v17 = v11;
  double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
LABEL_8:
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F4E668]) initWithNBestParses:v12 preITNNBestParses:v13];
  double v14 = (void *)[objc_alloc(MEMORY[0x1E4F4E5F0]) initWithCommandGrammarParsePackage:v15];

LABEL_9:

  return v14;
}

+ (id)afVoiceCommandGrammarParseResultForEARTokenString:(id)a3 withEARVoiceCommandInterpretations:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v5 = a4;
  uint64_t v6 = v5;
  if (v5 && [v5 count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    unint64_t v22 = v6;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v34 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          id v12 = objc_alloc(MEMORY[0x1E4F1CA60]);
          double v13 = [v11 arguments];
          double v14 = objc_msgSend(v12, "initWithCapacity:", objc_msgSend(v13, "count"));

          uint64_t v29 = 0;
          long long v30 = &v29;
          uint64_t v31 = 0x2020000000;
          char v32 = 1;
          id v15 = [v11 arguments];
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __102__CESRUtilities_afVoiceCommandGrammarParseResultForEARTokenString_withEARVoiceCommandInterpretations___block_invoke;
          v25[3] = &unk_1E61C2F58;
          id v16 = v14;
          id v26 = v16;
          id v27 = v24;
          long long v28 = &v29;
          [v15 enumerateObjectsUsingBlock:v25];

          id v17 = objc_alloc(MEMORY[0x1E4F4E660]);
          double v18 = [v11 commandIdentifier];
          uint64_t v19 = (void *)[v17 initWithCommandId:v18 isComplete:*((unsigned __int8 *)v30 + 24) paramMatches:v16];

          [v7 addObject:v19];
          _Block_object_dispose(&v29, 8);
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v8);
    }

    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F4E670]) initWithUtterance:v24 parseCandidates:v7];
    uint64_t v6 = v22;
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

void __102__CESRUtilities_afVoiceCommandGrammarParseResultForEARTokenString_withEARVoiceCommandInterpretations___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([v5 presence] && objc_msgSend(v5, "presence") != 1) {
    goto LABEL_7;
  }
  uint64_t v6 = [v5 text];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F4E658]);
    uint64_t v8 = [v5 text];
    id v9 = (id)[v7 initWithText:v8];

LABEL_8:
    double v18 = *(void **)(a1 + 32);
    uint64_t v19 = +[CESRUtilities voiceCommandsParamKeyBuilder:a3];
    [v18 setObject:v9 forKey:v19];

    goto LABEL_9;
  }
  id v10 = [v5 indexes];
  uint64_t v11 = [v10 count];

  if (!v11)
  {
LABEL_7:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    id v9 = (id)[objc_alloc(MEMORY[0x1E4F4E658]) initWithText:&stru_1F1291150];
    goto LABEL_8;
  }
  id v12 = objc_opt_new();
  double v13 = [v5 indexes];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  unint64_t v22 = __102__CESRUtilities_afVoiceCommandGrammarParseResultForEARTokenString_withEARVoiceCommandInterpretations___block_invoke_2;
  char v23 = &unk_1E61C2F30;
  id v24 = v12;
  id v25 = *(id *)(a1 + 40);
  id v9 = v12;
  [v13 enumerateRangesUsingBlock:&v20];

  id v14 = objc_alloc(MEMORY[0x1E4F4E658]);
  id v15 = objc_msgSend(v14, "initWithText:", v9, v20, v21, v22, v23);
  id v16 = *(void **)(a1 + 32);
  id v17 = +[CESRUtilities voiceCommandsParamKeyBuilder:a3];
  [v16 setObject:v15 forKey:v17];

LABEL_9:
}

void __102__CESRUtilities_afVoiceCommandGrammarParseResultForEARTokenString_withEARVoiceCommandInterpretations___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 appendString:v4];
}

+ (id)voiceCommandsParamKeyBuilder:(unint64_t)a3
{
  return (id)objc_msgSend(@"Param", "stringByAppendingFormat:", @"%lu", a3);
}

+ (id)earTokensToString:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28E78];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__CESRUtilities_earTokensToString___block_invoke;
  v8[3] = &unk_1E61C2F08;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __35__CESRUtilities_earTokensToString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasSpaceBefore]) {
    [*(id *)(a1 + 32) appendString:@" "];
  }
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 tokenName];
  [v4 appendString:v5];

  LODWORD(v4) = [v3 hasSpaceAfter];
  if (v4)
  {
    id v6 = *(void **)(a1 + 32);
    [v6 appendString:@" "];
  }
}

+ (id)speechProfileDateLastModifiedForLanguage:(id)a3
{
  id v3 = [a1 speechProfilePathsWithLanguage:a3];
  if ([v3 count])
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v6 = [v5 attributesOfItemAtPath:v4 error:0];
    id v7 = [v6 objectForKey:*MEMORY[0x1E4F28310]];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (void)loadSpeechProfiles:(id)a3 language:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v38 = v7;
    uint64_t v8 = [a1 speechProfilePathsWithLanguage:v7];
    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v46;
      uint64_t v12 = *MEMORY[0x1E4F28310];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v46 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          id v15 = [v6 objectForKeyedSubscript:v14];
          if (v15)
          {
            id v16 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v17 = [v16 attributesOfItemAtPath:v14 error:0];

            double v18 = [v17 objectForKey:v12];
            [v18 timeIntervalSinceReferenceDate];
            double v20 = v19;
            uint64_t v21 = [v15 loadDate];
            [v21 timeIntervalSinceReferenceDate];
            double v23 = v22;

            if (v20 > 0.0 && v23 > 0.0 && v20 <= v23)
            {
              [v39 setObject:v15 forKeyedSubscript:v14];
              id v25 = *MEMORY[0x1E4F4E380];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315395;
                v50 = "+[CESRUtilities loadSpeechProfiles:language:]";
                __int16 v51 = 2113;
                uint64_t v52 = v14;
                _os_log_debug_impl(&dword_1B8CCB000, v25, OS_LOG_TYPE_DEBUG, "%s Reused new type of speech profile: path=%{private}@", buf, 0x16u);
              }
            }
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
      }
      while (v10);
    }

    [v6 removeAllObjects];
    [v6 addEntriesFromDictionary:v39];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v26 = obj;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v55 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v42;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v42 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v41 + 1) + 8 * v30);
          char v32 = [v6 objectForKeyedSubscript:v31];

          if (!v32)
          {
            long long v33 = [MEMORY[0x1E4F1C9C8] date];
            long long v34 = (void *)[objc_alloc(MEMORY[0x1E4F61028]) initWithPath:v31 error:0];
            long long v35 = *MEMORY[0x1E4F4E380];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315651;
              v50 = "+[CESRUtilities loadSpeechProfiles:language:]";
              __int16 v51 = 2113;
              uint64_t v52 = v31;
              __int16 v53 = 1024;
              BOOL v54 = v34 != 0;
              _os_log_debug_impl(&dword_1B8CCB000, v35, OS_LOG_TYPE_DEBUG, "%s Loaded new type of speech profile: path=%{private}@ profile=%d", buf, 0x1Cu);
              if (v34)
              {
LABEL_26:
                [v34 setLoadDate:v33];
                [v6 setObject:v34 forKeyedSubscript:v31];
              }
            }
            else if (v34)
            {
              goto LABEL_26;
            }
          }
          ++v30;
        }
        while (v28 != v30);
        uint64_t v36 = [v26 countByEnumeratingWithState:&v41 objects:v55 count:16];
        uint64_t v28 = v36;
      }
      while (v36);
    }

    id v7 = v38;
  }
  else
  {
    v37 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v50 = "+[CESRUtilities loadSpeechProfiles:language:]";
      _os_log_fault_impl(&dword_1B8CCB000, v37, OS_LOG_TYPE_FAULT, "%s loadSpeechProfiles was incorrectly called with profiles=nil", buf, 0xCu);
    }
  }
}

+ (id)speechProfilePathsWithLanguage:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v25 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      long long v45 = "+[CESRUtilities speechProfilePathsWithLanguage:]";
      _os_log_error_impl(&dword_1B8CCB000, v25, OS_LOG_TYPE_ERROR, "%s speechProfilePathsWithLanguage was incorrectly called with language=nil", buf, 0xCu);
    }
    goto LABEL_27;
  }
  id v5 = v4;
  id v6 = [v4 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  uint64_t v7 = MEMORY[0x1BA9CBEC0](v6);
  uint64_t v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (void *)v7;
  }
  else {
    uint64_t v9 = v6;
  }
  id v10 = v9;

  if (!v10)
  {
    id v26 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v45 = "+[CESRUtilities speechProfilePathsWithLanguage:]";
      _os_log_fault_impl(&dword_1B8CCB000, v26, OS_LOG_TYPE_FAULT, "%s Mapped language=nil", buf, 0xCu);
    }
LABEL_27:
    id v32 = 0;
    goto LABEL_28;
  }
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [a1 speechProfileRootDirectories];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v38;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v38 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v11;
        uint64_t v12 = *(void *)(*((void *)&v37 + 1) + 8 * v11);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        double v13 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v14 = [v13 enumeratorAtPath:v12];

        uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v34 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              double v20 = NSString;
              v41[0] = v12;
              v41[1] = v19;
              v41[2] = v10;
              v41[3] = @"SpeechProfile";
              uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:4];
              double v22 = [v20 pathWithComponents:v21];

              double v23 = [MEMORY[0x1E4F28CB8] defaultManager];
              int v24 = [v23 fileExistsAtPath:v22];

              if (v24) {
                [v32 addObject:v22];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v42 count:16];
          }
          while (v16);
        }

        uint64_t v11 = v31 + 1;
      }
      while (v31 + 1 != v30);
      uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v30);
  }

LABEL_28:

  return v32;
}

+ (id)speechProfileRootDirectories
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = SFSpeechProfileSiteDirectories();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "path", (void)v11);
        if (v8) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v5);
  }

  uint64_t v9 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315395;
    uint64_t v16 = "+[CESRUtilities speechProfileRootDirectories]";
    __int16 v17 = 2113;
    id v18 = v2;
    _os_log_debug_impl(&dword_1B8CCB000, v9, OS_LOG_TYPE_DEBUG, "%s Root directories for new type of speech profile: %{private}@", buf, 0x16u);
  }

  return v2;
}

+ (id)afSpeechPackageForEARPackage:(id)a3 processedAudioDuration:(double)a4 speechProfileUsed:(BOOL)a5 recognizerModelInfo:(id)a6 isVoiceCommandCandidatePackage:(BOOL)a7
{
  BOOL v82 = a7;
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v91 = a6;
  id v10 = [v9 recognition];
  v90 = +[CESRUtilities afRecognitionForEARSausage:v10 processedAudioDuration:a4];

  long long v11 = [v9 preITNRecognition];
  v88 = +[CESRUtilities afRecognitionForEARSausage:v11 processedAudioDuration:a4];

  v85 = [v9 audioAnalytics];
  long long v12 = [v85 acousticFeatures];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v92 objects:buf count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v93;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v93 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v92 + 1) + 8 * i);
        uint64_t v20 = [v14 objectForKey:v19];
        id v21 = objc_alloc(MEMORY[0x1E4F4E5D8]);
        double v22 = [v20 acousticFeatureValuePerFrame];
        [v20 frameDuration];
        double v23 = objc_msgSend(v21, "initWithAcousticFeatureValue:frameDuration:", v22);

        [v13 setValue:v23 forKey:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v92 objects:buf count:16];
    }
    while (v16);
  }

  int v24 = [v85 speechRecognitionFeatures];
  id v25 = objc_alloc(MEMORY[0x1E4F4E5E0]);
  [v85 snr];
  v87 = objc_msgSend(v25, "initWithSpeechRecognitionFeatures:acousticFeatures:snr:", v24, v13);

  id v26 = [v9 latticeMitigatorResult];
  uint64_t v27 = v91;
  if (v26)
  {
    uint64_t v28 = (void *)*MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
    {
      v71 = v28;
      [v26 score];
      double v73 = v72;
      [v26 threshold];
      double v75 = v74;
      [v26 calibrationScale];
      double v77 = v76;
      [v26 calibrationOffset];
      *(_DWORD *)buf = 136316162;
      v97 = "AFSpeechLatticeMitigatorResultForEar";
      __int16 v98 = 2048;
      double v99 = v73;
      __int16 v100 = 2048;
      double v101 = v75;
      __int16 v102 = 2048;
      double v103 = v77;
      __int16 v104 = 2048;
      double v105 = v78;
      _os_log_debug_impl(&dword_1B8CCB000, v71, OS_LOG_TYPE_DEBUG, "%s AFSpeechLatticeMitigatorResult Score = %f, Threshold = %f, CalibrationScale = %f, CalibrationOffset = %f", buf, 0x34u);
    }
    id v29 = objc_alloc(MEMORY[0x1E4F4E600]);
    uint64_t v30 = [v26 version];
    [v26 score];
    int v32 = v31;
    [v26 threshold];
    int v34 = v33;
    [v26 calibrationScale];
    int v36 = v35;
    [v26 calibrationOffset];
    LODWORD(v38) = v37;
    LODWORD(v39) = v32;
    LODWORD(v40) = v34;
    LODWORD(v41) = v36;
    v86 = (void *)[v29 initWithResults:v30 score:v39 threshold:v40 calibrationScale:v41 calibrationOffset:v38];
  }
  else
  {
    v86 = 0;
  }

  if ([v9 isFinal])
  {
    uint64_t v42 = -1;
  }
  else
  {
    long long v43 = objc_getAssociatedObject(v9, kResultCandidateIdKey);
    if (v43)
    {
      long long v44 = objc_getAssociatedObject(v9, kResultCandidateIdKey);
      uint64_t v42 = (int)[v44 intValue];
    }
    else
    {
      uint64_t v42 = -1;
    }
  }
  if (v82)
  {
    long long v45 = [v9 recognition];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v55 = 0;
      v56 = 0;
      goto LABEL_29;
    }
    uint64_t v46 = [v9 recognition];
    char v47 = objc_opt_respondsToSelector();

    if (v47)
    {
      long long v48 = [v9 recognition];
      v49 = [v48 potentialPrecedingRecognition];

      if (v49)
      {
        id v80 = objc_alloc(MEMORY[0x1E4F4E608]);
        v83 = [v9 recognition];
        v50 = [v83 potentialPrecedingRecognition];
        __int16 v51 = +[CESRUtilities afRecognitionForEARSausage:v50 processedAudioDuration:a4];
        uint64_t v52 = [v9 preITNRecognition];
        __int16 v53 = [v52 potentialPrecedingRecognition];
        BOOL v54 = +[CESRUtilities afRecognitionForEARSausage:v53 processedAudioDuration:a4];
        [v9 utteranceStart];
        v55 = objc_msgSend(v80, "initWithRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:", v51, v54, 0, 0);
      }
      else
      {
        v55 = 0;
      }
      id v81 = objc_alloc(MEMORY[0x1E4F4E608]);
      long long v45 = [v9 recognition];
      v84 = [v45 potentialCommandRecognition];
      v59 = +[CESRUtilities afRecognitionForEARSausage:v84 processedAudioDuration:a4];
      v60 = [v9 preITNRecognition];
      v61 = [v60 potentialCommandRecognition];
      v62 = +[CESRUtilities afRecognitionForEARSausage:v61 processedAudioDuration:a4];
      [v9 utteranceStart];
      v56 = objc_msgSend(v81, "initWithRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:", v59, v62, 0, 0);

      uint64_t v27 = v91;
LABEL_29:

      if (!v27) {
        goto LABEL_30;
      }
LABEL_25:
      uint64_t v57 = [v27 version];
      v58 = [v27 acousticModelVersion];
      goto LABEL_31;
    }
  }
  v55 = 0;
  v56 = 0;
  if (v91) {
    goto LABEL_25;
  }
LABEL_30:
  v58 = &stru_1F1291150;
  uint64_t v57 = &stru_1F1291150;
LABEL_31:
  id v63 = objc_alloc(MEMORY[0x1E4F4E608]);
  uint64_t v64 = [v9 isFinal];
  [v9 utteranceStart];
  double v66 = v65;
  char v67 = [v9 recognitionPaused];
  v68 = [v9 endOfSentenceLikelihood];
  BYTE1(v79) = a5;
  LOBYTE(v79) = v67;
  v69 = objc_msgSend(v63, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:modelVersion:acousticModelVersion:potentialCommandPrecedingUtterance:potentialCommandUtterance:numOneBestTokensExcludingTriggerPhrase:", v90, v90, v88, v87, v64, v86, v66, v79, v42, v68, v57, v58, v55, v56,
                  [v9 numTokensExcludingTriggerPhrase]);

  return v69;
}

+ (id)afRecognitionForEARSausage:(id)a3 processedAudioDuration:(double)a4
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 nBest];
  uint64_t v7 = [v5 tokenSausage];
  char v67 = v5;
  uint64_t v8 = [v5 interpretationIndices];
  id v9 = v6;
  id v10 = v7;
  double v66 = (void *)v8;
  long long v11 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v8];
  long long v12 = [v11 array];

  float v72 = v12;
  unint64_t v13 = [v12 count];
  v68 = v9;
  unint64_t v14 = [v9 count];
  unint64_t v15 = v14;
  if (v14 > v13)
  {
    uint64_t v16 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v91 = "AFPhrasesAndUtterancesForEARSausage";
      __int16 v92 = 2048;
      unint64_t v93 = v15;
      __int16 v94 = 2048;
      unint64_t v95 = v13;
      _os_log_impl(&dword_1B8CCB000, v16, OS_LOG_TYPE_INFO, "%s Size of lossless n-best (%ld) exceeds size of sausage-based n-best (%ld); this leads to information loss in t"
        "he lossless n-best.",
        buf,
        0x20u);
    }
LABEL_8:
    id v73 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (!v13) {
      goto LABEL_17;
    }
    goto LABEL_9;
  }
  if (v14 >= v13) {
    goto LABEL_8;
  }
  uint64_t v17 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    id v91 = "AFPhrasesAndUtterancesForEARSausage";
    __int16 v92 = 2048;
    unint64_t v93 = v15;
    __int16 v94 = 2048;
    unint64_t v95 = v13;
    _os_log_error_impl(&dword_1B8CCB000, v17, OS_LOG_TYPE_ERROR, "%s Size of lossless n-best (%ld) is less than size of sausage-based n-best (%ld); this is unexpected.",
      buf,
      0x20u);
  }
  id v73 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
LABEL_9:
  id v70 = v10;
  unint64_t v18 = 0;
  uint64_t v19 = MEMORY[0x1E4F1CBF0];
  uint64_t v20 = (os_log_t *)MEMORY[0x1E4F4E380];
  do
  {
    if (v18 >= v15)
    {
      int v24 = *v20;
      if (os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v91 = "AFPhrasesAndUtterancesForEARSausage";
        __int16 v92 = 2048;
        unint64_t v93 = v18;
        _os_log_impl(&dword_1B8CCB000, v24, OS_LOG_TYPE_INFO, "%s AFSpeechUtterance at index %ld will have a nil AFSpeechInterpretation (used for lossless n-best) since the lossless n-best does not have an entry at this index.", buf, 0x16u);
      }
      id v21 = 0;
    }
    else
    {
      id v21 = objc_alloc_init(MEMORY[0x1E4F4E5F8]);
      double v22 = [v68 objectAtIndex:v18];
      double v23 = +[CESRUtilities afTokensForEARTokens:v22 removeSpaceBefore:0];
      [v21 setTokens:v23];
    }
    id v25 = (void *)[objc_alloc(MEMORY[0x1E4F4E630]) initWithInterpretationIndices:v19 confidenceScore:0 interpretation:v21];
    [v25 setSource:2];
    [v73 addObject:v25];

    ++v18;
  }
  while (v13 != v18);
  id v10 = v70;
LABEL_17:
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = v10;
  uint64_t v27 = [obj countByEnumeratingWithState:&v85 objects:buf count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = 0;
    char v30 = 0;
    uint64_t v71 = *(void *)v86;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v86 != v71) {
          objc_enumerationMutation(obj);
        }
        int v32 = *(void **)(*((void *)&v85 + 1) + 8 * i);
        id v33 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
        v79[0] = MEMORY[0x1E4F143A8];
        v79[1] = 3221225472;
        v79[2] = __AFPhrasesAndUtterancesForEARSausage_block_invoke;
        v79[3] = &unk_1E61C2FF8;
        id v34 = v73;
        uint64_t v83 = v29;
        id v80 = v34;
        id v81 = v32;
        char v84 = v30 & 1;
        id v35 = v33;
        id v82 = v35;
        [v72 enumerateObjectsUsingBlock:v79];
        uint64_t v36 = [v35 count];
        if (v36)
        {
          uint64_t v37 = v36;
          double v38 = [v32 firstObject];
          double v39 = [v38 lastObject];
          char v30 = [v39 hasSpaceAfter] ^ 1;

          id v40 = objc_alloc_init(MEMORY[0x1E4F4E610]);
          double v41 = [v35 array];
          uint64_t v42 = (void *)[v41 copy];
          [v40 setInterpretations:v42];

          [v40 setIsLowConfidence:v37 != 1];
          [v26 addObject:v40];
          ++v29;
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v85 objects:buf count:16];
    }
    while (v28);
  }

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v74 = v73;
  uint64_t v43 = [v74 countByEnumeratingWithState:&v75 objects:v89 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v76;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v76 != v45) {
          objc_enumerationMutation(v74);
        }
        char v47 = *(void **)(*((void *)&v75 + 1) + 8 * j);
        long long v48 = [v47 interpretationIndices];
        uint64_t v49 = [v48 count];

        if (v49)
        {
          unint64_t v50 = 0;
          unint64_t v51 = 0;
          do
          {
            uint64_t v52 = [v47 interpretationIndices];
            __int16 v53 = [v52 objectAtIndex:v50];
            uint64_t v54 = [v53 unsignedIntegerValue];

            v55 = [v26 objectAtIndex:v50];
            v56 = [v55 interpretations];
            uint64_t v57 = [v56 objectAtIndex:v54];

            v58 = [v57 tokens];
            v51 += [v58 count];

            ++v50;
            v59 = [v47 interpretationIndices];
            unint64_t v60 = [v59 count];
          }
          while (v50 < v60);
          if (v51) {
            objc_msgSend(v47, "setConfidenceScore:", (uint64_t)((double)objc_msgSend(v47, "confidenceScore") / (double)v51));
          }
        }
      }
      uint64_t v44 = [v74 countByEnumeratingWithState:&v75 objects:v89 count:16];
    }
    while (v44);
  }

  v61 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v74];
  id v62 = [v61 array];

  id v63 = v62;
  uint64_t v64 = (void *)[objc_alloc(MEMORY[0x1E4F4E618]) initWithPhrases:v26 utterances:v63 processedAudioDuration:a4];

  return v64;
}

+ (id)afTokensForEARTokens:(id)a3 removeSpaceBefore:(BOOL)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v13 = objc_alloc_init(MEMORY[0x1E4F4E628]);
        unint64_t v14 = objc_msgSend(v12, "tokenName", (void)v23);
        [v13 setText:v14];

        unint64_t v15 = [v12 phoneSequence];
        [v13 setPhoneSequence:v15];

        [v12 start];
        objc_msgSend(v13, "setStartTime:");
        [v12 silenceStart];
        objc_msgSend(v13, "setSilenceStartTime:");
        [v12 end];
        objc_msgSend(v13, "setEndTime:");
        [v13 setRemoveSpaceBefore:a4];
        a4 = [v12 hasSpaceAfter] ^ 1;
        [v12 confidence];
        [v13 setConfidenceScore:(uint64_t)v16];
        uint64_t v17 = [v12 ipaPhoneSequence];
        [v13 setIpaPhoneSequence:v17];

        unint64_t v18 = NSNumber;
        [v12 graphCost];
        uint64_t v19 = objc_msgSend(v18, "numberWithDouble:");
        [v13 setGraphCost:v19];

        uint64_t v20 = NSNumber;
        [v12 acousticCost];
        id v21 = objc_msgSend(v20, "numberWithDouble:");
        [v13 setAcousticCost:v21];

        [v6 addObject:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (BOOL)hasRecognizedAnythingInAFSpeechPackage:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 recognition];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = objc_msgSend(v3, "utterances", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) interpretationIndices];
        uint64_t v9 = [v8 count];

        if (v9)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (int64_t)calculateDiffInDaysFromTimestamp:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28C10];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"UTC"];
  [v5 setTimeZone:v6];

  id v7 = (void *)MEMORY[0x1E4F1C9C8];
  [v4 doubleValue];
  double v9 = v8;

  uint64_t v10 = [v7 dateWithTimeIntervalSince1970:v9];
  if (v10)
  {
    long long v11 = [MEMORY[0x1E4F1C9C8] date];
    long long v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    long long v13 = [v12 components:16 fromDate:v10 toDate:v11 options:0];
    int64_t v14 = [v13 day];
  }
  else
  {
    int64_t v14 = 0;
  }

  return v14;
}

+ (double)getHostClockFrequency
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  if (!info.numer) {
    return 0.0;
  }
  LODWORD(v2) = info.denom;
  return (double)v2 / (double)info.numer * 1000000000.0;
}

+ (unint64_t)machAbsoluteTimeToMachContinuousTime:(unint64_t)a3
{
  return a3;
}

+ (float)hostTimeToSeconds:(unint64_t)a3
{
  double v3 = (double)a3;
  +[CESRUtilities getHostClockFrequency];
  return v3 / v4;
}

+ (unint64_t)secondsToHostTime:(float)a3
{
  double v3 = a3;
  +[CESRUtilities getHostClockFrequency];
  return (unint64_t)(v4 * v3);
}

+ (BOOL)isDictationEnabled
{
  unint64_t v2 = [MEMORY[0x1E4F4E538] sharedPreferences];
  char v3 = [v2 dictationIsEnabled];

  return v3;
}

+ (BOOL)isAssistantEnabled
{
  unint64_t v2 = [MEMORY[0x1E4F4E538] sharedPreferences];
  char v3 = [v2 assistantIsEnabled];

  return v3;
}

+ (BOOL)isCustomerInstall
{
  return MEMORY[0x1F410AD40](a1, a2);
}

+ (id)currentDictationLanguageCodes
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F3C268]);
  char v3 = [v2 installationStatusForLanguagesWithAssetType:3];

  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__1129;
  long long v11 = __Block_byref_object_dispose__1130;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__CESRUtilities_currentDictationLanguageCodes__block_invoke;
  v6[3] = &unk_1E61C2EE0;
  v6[4] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __46__CESRUtilities_currentDictationLanguageCodes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (AFOfflineDictationStatusStringIsInstalled()) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
}

+ (id)currentSiriLanguageCode
{
  id v2 = [MEMORY[0x1E4F4E538] sharedPreferences];
  id v3 = [v2 languageCode];

  if (![v3 length])
  {
    id v4 = [MEMORY[0x1E4F4E538] sharedPreferences];
    uint64_t v5 = [v4 bestSupportedLanguageCodeForLanguageCode:0];

    id v3 = (void *)v5;
  }

  return v3;
}

+ (BOOL)isSiriUODwithASROnServerSupported
{
  return MEMORY[0x1F410AE50](a1, a2);
}

+ (BOOL)isSiriMuxSupported
{
  return MEMORY[0x1F410ACD0](a1, a2);
}

+ (BOOL)isASRSupported
{
  if (AFDeviceSupportsSiriUOD()) {
    return 1;
  }

  return AFOfflineDictationCapable();
}

+ (BOOL)isSiriUODSupported
{
  uint64_t v2 = AFDeviceSupportsSiriUOD();
  if (v2) {
    return 1;
  }

  return MEMORY[0x1F410AE50](v2, v3);
}

+ (id)buildVersion
{
  return (id)MEMORY[0x1F410AC38](a1, a2);
}

@end