@interface SFUtilities
+ (BOOL)_isDeviceH13Plus;
+ (BOOL)canAccessPathAt:(id)a3 methodName:(id)a4 error:(id *)a5;
+ (BOOL)isCacheDirInternal;
+ (BOOL)isGeneralASRSupportedOnDevice;
+ (BOOL)isSpeechXPCEnabled;
+ (id)_alignTokenToFirstSeenPartialResult:(id)a3 tokenIndex:(unint64_t)a4 firstSeenPartialResultTokens:(id)a5 firstSeenPartialResultIndex:(unint64_t)a6;
+ (id)_firstSeenPartialResultIndicesForTokens:(id)a3 firstSeenPartialResultTokens:(id)a4;
+ (id)alignedPartialResultIndicesForTokens:(id)a3 firstSeenPartialResultTokens:(id)a4;
+ (id)defaultClientID;
+ (id)getNormString:(id)a3;
+ (id)issueReadSandboxExtensionForFilePath:(id)a3 error:(id *)a4;
+ (id)issueReadWriteSandboxExtensionForDirectoryPath:(id)a3 error:(id *)a4;
+ (id)languageCodeForLocaleIdentifier:(id)a3;
+ (id)languageCodeStringForLanguageString:(id)a3;
+ (id)languageStringForLocaleString:(id)a3;
+ (id)localeCodeForLocale:(id)a3;
+ (id)localeStringForLanguageString:(id)a3;
+ (id)recognitionMetadataFromSpeechPhrases:(id)a3 afAudioAnalytics:(id)a4 utteranceStart:(double)a5;
+ (id)recognizedResultFromPackage:(id)a3;
+ (id)sandboxExtensionsForUsingANEAndAssets;
+ (id)speechProfileDateLastModifiedForLanguage:(id)a3;
+ (id)speechProfilePathsWithLanguage:(id)a3;
+ (id)speechProfilePathsWithLanguage:(id)a3 sharedUserInfos:(id)a4;
+ (id)speechProfileRootDirectories;
+ (id)stringByReplacingHyphensWithUnderscores:(id)a3;
+ (id)stringByReplacingUnderscoresWithHyphens:(id)a3;
+ (id)taskNameFromTaskHint:(int64_t)a3;
+ (id)transcriptionFromSpeechPhrases:(id)a3 afAudioAnalytics:(id)a4 utteranceStart:(double)a5;
+ (id)transcriptionsWithTokens:(id)a3;
+ (unint64_t)cooldownTimerTimeoutSeconds;
+ (void)createDirPath:(id)a3;
+ (void)initialize;
+ (void)loadSpeechProfiles:(id)a3 language:(id)a4;
+ (void)loadSpeechProfiles:(id)a3 speechProfileContainers:(id)a4 language:(id)a5;
+ (void)supportedLocalesWithCompletion:(id)a3;
@end

@implementation SFUtilities

void __31__SFUtilities__isDeviceH13Plus__block_invoke()
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v0 = (void *)get_ANEDeviceInfoClass_softClass;
  uint64_t v10 = get_ANEDeviceInfoClass_softClass;
  if (!get_ANEDeviceInfoClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __get_ANEDeviceInfoClass_block_invoke;
    v6[3] = &unk_1E6155688;
    v6[4] = &v7;
    __get_ANEDeviceInfoClass_block_invoke((uint64_t)v6);
    v0 = (void *)v8[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v7, 8);
  v2 = [v1 aneSubType];
  v3 = [v2 capitalizedString];

  size_t v4 = strlen((const char *)[@"H" fileSystemRepresentation])
     + [v3 rangeOfString:@"H"];
  objc_msgSend(v3, "substringWithRange:", v4, objc_msgSend(v3, "length") - v4);
  id v5 = objc_claimAutoreleasedReturnValue();
  _isDeviceH13Plus_isH13Plus = atoi((const char *)[v5 fileSystemRepresentation]) > 12;
}

+ (id)languageCodeForLocaleIdentifier:(id)a3
{
  v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:a3];
  size_t v4 = [v3 languageCode];

  return v4;
}

+ (id)stringByReplacingHyphensWithUnderscores:(id)a3
{
  return (id)[a3 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
}

+ (id)stringByReplacingUnderscoresWithHyphens:(id)a3
{
  return (id)[a3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
}

+ (BOOL)isGeneralASRSupportedOnDevice
{
  if (isGeneralASRSupportedOnDevice_onceToken != -1) {
    dispatch_once(&isGeneralASRSupportedOnDevice_onceToken, &__block_literal_global_271);
  }
  return isGeneralASRSupportedOnDevice_isSupported;
}

+ (id)languageStringForLocaleString:(id)a3
{
  return +[SFUtilities stringByReplacingUnderscoresWithHyphens:a3];
}

BOOL __44__SFUtilities_isGeneralASRSupportedOnDevice__block_invoke()
{
  BOOL result = +[SFUtilities _isDeviceH13Plus];
  if (result) {
    isGeneralASRSupportedOnDevice_isSupported = 1;
  }
  return result;
}

+ (BOOL)_isDeviceH13Plus
{
  if (_isDeviceH13Plus_onceToken != -1) {
    dispatch_once(&_isDeviceH13Plus_onceToken, &__block_literal_global_273);
  }
  return _isDeviceH13Plus_isH13Plus;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && SFLogInitIfNeeded_once != -1)
  {
    dispatch_once(&SFLogInitIfNeeded_once, &__block_literal_global_2716);
  }
}

+ (id)languageCodeStringForLanguageString:(id)a3
{
  return +[SFUtilities languageCodeForLocaleIdentifier:a3];
}

+ (id)localeStringForLanguageString:(id)a3
{
  return +[SFUtilities stringByReplacingHyphensWithUnderscores:a3];
}

+ (unint64_t)cooldownTimerTimeoutSeconds
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (SFIsInternalInstall_onceToken != -1) {
    dispatch_once(&SFIsInternalInstall_onceToken, &__block_literal_global_1883);
  }
  if (SFIsInternalInstall_isInternal)
  {
    v2 = _AFPreferencesValueForKeyWithContext();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v3 = [v2 unsignedIntegerValue];
    }
    else {
      unint64_t v3 = 120;
    }
  }
  else
  {
    unint64_t v3 = 120;
  }
  size_t v4 = SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    uint64_t v7 = "+[SFUtilities cooldownTimerTimeoutSeconds]";
    __int16 v8 = 2048;
    unint64_t v9 = v3;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_INFO, "%s On-Device ASR: Cooldown scheduled for %zus.", (uint8_t *)&v6, 0x16u);
  }
  return v3;
}

+ (id)speechProfileDateLastModifiedForLanguage:(id)a3
{
  unint64_t v3 = [a1 speechProfilePathsWithLanguage:a3];
  if ([v3 count])
  {
    size_t v4 = [v3 objectAtIndexedSubscript:0];
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v6 = [v5 attributesOfItemAtPath:v4 error:0];

    if (v6)
    {
      uint64_t v7 = [v6 objectForKey:*MEMORY[0x1E4F28310]];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
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
    __int16 v8 = [a1 speechProfilePathsWithLanguage:v7];
    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v45 objects:v56 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v46;
      uint64_t v40 = *MEMORY[0x1E4F28310];
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v46 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          v15 = [v6 objectForKey:v14];
          if (v15)
          {
            v16 = [MEMORY[0x1E4F28CB8] defaultManager];
            v17 = [v16 attributesOfItemAtPath:v14 error:0];

            if (v17)
            {
              v18 = [v17 objectForKey:v40];
              [v18 timeIntervalSinceReferenceDate];
              double v20 = v19;
              v21 = [v15 loadDate];
              [v21 timeIntervalSinceReferenceDate];
              double v23 = v22;

              if (v20 > 0.0 && v23 > 0.0 && v20 <= v23)
              {
                [v39 setObject:v15 forKey:v14];
                v25 = SFLogFramework;
                if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315395;
                  v50 = "+[SFUtilities loadSpeechProfiles:language:]";
                  __int16 v51 = 2113;
                  uint64_t v52 = v14;
                  _os_log_debug_impl(&dword_1B709D000, v25, OS_LOG_TYPE_DEBUG, "%s Reused new type of speech profile: path=%{private}@", buf, 0x16u);
                }
              }
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v45 objects:v56 count:16];
      }
      while (v11);
    }

    [v6 removeAllObjects];
    [v6 addEntriesFromDictionary:v39];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v26 = v9;
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
          v32 = [v6 objectForKey:v31];

          if (!v32)
          {
            v33 = [MEMORY[0x1E4F1C9C8] date];
            v34 = (void *)[objc_alloc(MEMORY[0x1E4F61028]) initWithPath:v31 error:0];
            v35 = SFLogFramework;
            if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315651;
              v50 = "+[SFUtilities loadSpeechProfiles:language:]";
              __int16 v51 = 2113;
              uint64_t v52 = v31;
              __int16 v53 = 1024;
              BOOL v54 = v34 != 0;
              _os_log_debug_impl(&dword_1B709D000, v35, OS_LOG_TYPE_DEBUG, "%s Loaded new type of speech profile: path=%{private}@ profile=%d", buf, 0x1Cu);
              if (v34)
              {
LABEL_28:
                [v34 setLoadDate:v33];
                [v6 setObject:v34 forKey:v31];
              }
            }
            else if (v34)
            {
              goto LABEL_28;
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
    v37 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v50 = "+[SFUtilities loadSpeechProfiles:language:]";
      _os_log_error_impl(&dword_1B709D000, v37, OS_LOG_TYPE_ERROR, "%s profiles cannot be nil.", buf, 0xCu);
    }
  }
}

+ (void)loadSpeechProfiles:(id)a3 speechProfileContainers:(id)a4 language:(id)a5
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v76 = a5;
  id v9 = SFLogFramework;
  v78 = v7;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = v9;
      *(_DWORD *)buf = 136315394;
      v95 = "+[SFUtilities loadSpeechProfiles:speechProfileContainers:language:]";
      __int16 v96 = 2048;
      uint64_t v97 = [v8 count];
      _os_log_impl(&dword_1B709D000, v10, OS_LOG_TYPE_INFO, "%s MUX: checking speech profile existence of %zu containers...", buf, 0x16u);
    }
    id v77 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v73 = v8;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v88 objects:v101 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v89;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v89 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v88 + 1) + 8 * i);
          v17 = [v16 personaId];
          if ((_os_feature_enabled_impl() & 1) == 0)
          {

            v17 = 0;
          }
          v18 = [v16 url];
          double v19 = SFDataSiteURL((uint64_t)v18, v17);

          double v20 = [v19 path];
          uint64_t v21 = [v20 length];

          if (v21)
          {
            double v22 = NSString;
            double v23 = [v19 path];
            v100[0] = v23;
            v100[1] = @"0000000000000000";
            v100[2] = v76;
            v100[3] = @"SpeechProfile";
            v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:4];
            v25 = [v22 pathWithComponents:v24];

            id v26 = [MEMORY[0x1E4F28CB8] defaultManager];
            LODWORD(v24) = [v26 fileExistsAtPath:v25];

            if (v24)
            {
              [v77 setObject:v16 forKey:v25];
            }
            else
            {
              uint64_t v29 = SFLogFramework;
              if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315650;
                v95 = "+[SFUtilities loadSpeechProfiles:speechProfileContainers:language:]";
                __int16 v96 = 2112;
                uint64_t v97 = (uint64_t)v76;
                __int16 v98 = 2112;
                uint64_t v99 = (uint64_t)v25;
                _os_log_debug_impl(&dword_1B709D000, v29, OS_LOG_TYPE_DEBUG, "%s MUX: no (%@) speech profile at path: %@", buf, 0x20u);
              }
            }
          }
          else
          {
            uint64_t v27 = (void *)SFLogFramework;
            if (!os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR)) {
              goto LABEL_19;
            }
            v25 = v27;
            uint64_t v28 = [v16 personaId];
            *(_DWORD *)buf = 136315394;
            v95 = "+[SFUtilities loadSpeechProfiles:speechProfileContainers:language:]";
            __int16 v96 = 2112;
            uint64_t v97 = (uint64_t)v28;
            _os_log_error_impl(&dword_1B709D000, v25, OS_LOG_TYPE_ERROR, "%s MUX: empty data site URL for Container from Persona: %@", buf, 0x16u);
          }
LABEL_19:
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v88 objects:v101 count:16];
      }
      while (v13);
    }

    uint64_t v30 = (void *)SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
    {
      uint64_t v31 = v30;
      v32 = [v77 allKeys];
      uint64_t v33 = [v32 count];
      uint64_t v34 = [v11 count];
      *(_DWORD *)buf = 136315650;
      v95 = "+[SFUtilities loadSpeechProfiles:speechProfileContainers:language:]";
      __int16 v96 = 2048;
      uint64_t v97 = v33;
      __int16 v98 = 2048;
      uint64_t v99 = v34;
      _os_log_impl(&dword_1B709D000, v31, OS_LOG_TYPE_INFO, "%s MUX: %zu speech profiles (out of %zu containers) are present on disk", buf, 0x20u);
    }
    id v74 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    v35 = [v77 allKeys];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v84 objects:v93 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v85;
      uint64_t v75 = *MEMORY[0x1E4F28310];
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v85 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v40 = *(void *)(*((void *)&v84 + 1) + 8 * j);
          long long v41 = [v78 objectForKey:v40];
          if (v41)
          {
            long long v42 = [MEMORY[0x1E4F28CB8] defaultManager];
            long long v43 = [v42 attributesOfItemAtPath:v40 error:0];

            if (v43)
            {
              long long v44 = [v43 objectForKey:v75];
              [v44 timeIntervalSinceReferenceDate];
              double v46 = v45;
              long long v47 = [v41 loadDate];
              [v47 timeIntervalSinceReferenceDate];
              double v49 = v48;

              if (v46 > 0.0 && v49 > 0.0 && v46 <= v49)
              {
                [v74 setObject:v41 forKey:v40];
                __int16 v51 = SFLogFramework;
                if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315395;
                  v95 = "+[SFUtilities loadSpeechProfiles:speechProfileContainers:language:]";
                  __int16 v96 = 2113;
                  uint64_t v97 = v40;
                  _os_log_debug_impl(&dword_1B709D000, v51, OS_LOG_TYPE_DEBUG, "%s MUX: reusing cached speech profile: path=%{private}@", buf, 0x16u);
                }
              }
            }
            else
            {
              __int16 v53 = SFLogFramework;
              if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315395;
                v95 = "+[SFUtilities loadSpeechProfiles:speechProfileContainers:language:]";
                __int16 v96 = 2113;
                uint64_t v97 = v40;
                _os_log_debug_impl(&dword_1B709D000, v53, OS_LOG_TYPE_DEBUG, "%s MUX: fileAttribs is nil for cached speech profile at path=%{private}@", buf, 0x16u);
              }
            }
          }
          else
          {
            uint64_t v52 = SFLogFramework;
            if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315395;
              v95 = "+[SFUtilities loadSpeechProfiles:speechProfileContainers:language:]";
              __int16 v96 = 2113;
              uint64_t v97 = v40;
              _os_log_debug_impl(&dword_1B709D000, v52, OS_LOG_TYPE_DEBUG, "%s MUX: cached speech profile is nil for path=%{private}@", buf, 0x16u);
            }
          }
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v84 objects:v93 count:16];
      }
      while (v37);
    }

    [v78 removeAllObjects];
    [v78 addEntriesFromDictionary:v74];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    BOOL v54 = [v77 allKeys];
    uint64_t v55 = [v54 countByEnumeratingWithState:&v80 objects:v92 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v81;
      do
      {
        for (uint64_t k = 0; k != v56; ++k)
        {
          if (*(void *)v81 != v57) {
            objc_enumerationMutation(v54);
          }
          uint64_t v59 = *(void *)(*((void *)&v80 + 1) + 8 * k);
          v60 = [v78 objectForKey:v59];

          if (!v60)
          {
            v61 = [MEMORY[0x1E4F1C9C8] date];
            v62 = [v77 objectForKey:v59];
            v63 = [v62 userId];

            id v64 = objc_alloc(MEMORY[0x1E4F61028]);
            id v79 = 0;
            v65 = (void *)[v64 initWithPath:v59 userId:v63 recognitionOnly:0 error:&v79];
            id v66 = v79;
            v67 = SFLogFramework;
            BOOL v68 = os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG);
            if (v65)
            {
              if (v68)
              {
                *(_DWORD *)buf = 136315395;
                v95 = "+[SFUtilities loadSpeechProfiles:speechProfileContainers:language:]";
                __int16 v96 = 2113;
                uint64_t v97 = v59;
                _os_log_debug_impl(&dword_1B709D000, v67, OS_LOG_TYPE_DEBUG, "%s MUX: loaded speech profile: path=%{private}@", buf, 0x16u);
              }
              [v65 setLoadDate:v61];
              [v78 setObject:v65 forKey:v59];
            }
            else if (v68)
            {
              *(_DWORD *)buf = 136315651;
              v95 = "+[SFUtilities loadSpeechProfiles:speechProfileContainers:language:]";
              __int16 v96 = 2113;
              uint64_t v97 = v59;
              __int16 v98 = 2112;
              uint64_t v99 = (uint64_t)v66;
              _os_log_debug_impl(&dword_1B709D000, v67, OS_LOG_TYPE_DEBUG, "%s MUX: failed to load speech profile: path=%{private}@ error=%@", buf, 0x20u);
            }
          }
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v80 objects:v92 count:16];
      }
      while (v56);
    }

    v69 = (void *)SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
    {
      v70 = v69;
      uint64_t v71 = [v78 count];
      *(_DWORD *)buf = 136315394;
      v95 = "+[SFUtilities loadSpeechProfiles:speechProfileContainers:language:]";
      __int16 v96 = 2048;
      uint64_t v97 = v71;
      _os_log_impl(&dword_1B709D000, v70, OS_LOG_TYPE_INFO, "%s MUX: %zu speech profiles are loaded", buf, 0x16u);
    }
    id v8 = v73;
    v72 = v76;
  }
  else
  {
    v72 = v76;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v95 = "+[SFUtilities loadSpeechProfiles:speechProfileContainers:language:]";
      _os_log_error_impl(&dword_1B709D000, v9, OS_LOG_TYPE_ERROR, "%s MUX: profiles cannot be nil.", buf, 0xCu);
    }
  }
}

+ (id)speechProfilePathsWithLanguage:(id)a3 sharedUserInfos:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = +[SFUtilities stringByReplacingUnderscoresWithHyphens:v5];

    uint64_t v8 = SFReplacementLocaleCodeForLocaleIdentifier(v7);
    id v9 = (void *)v8;
    if (v8) {
      uint64_t v10 = (void *)v8;
    }
    else {
      uint64_t v10 = v7;
    }
    id v52 = v10;

    id v11 = [MEMORY[0x1E4F1CA80] set];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v54 = v6;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v58 objects:v68 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v57 = *(void *)v59;
      obuint64_t j = v12;
      uint64_t v56 = v11;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v59 != v57) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          v17 = +[SFPersonaManager sharedInstance];
          v18 = [v16 personaId];
          char v19 = [v17 personaMatchesEnrolledUser:v18];

          if (v19)
          {
            double v20 = +[SFSpeechProfileContainerManager sharedInstance];
            uint64_t v21 = [v16 personaId];
            double v22 = [v20 containerForPersona:v21];

            if (v22)
            {
              double v23 = [SFSpeechProfileContainer alloc];
              v24 = [v22 url];
              v25 = [v16 personaId];
              id v26 = [v16 sharedUserId];
              uint64_t v27 = [v16 loggableSharedUserId];
              uint64_t v28 = [(SFSpeechProfileContainer *)v23 initWithURL:v24 personaId:v25 userId:v26 loggableUserId:v27];

              id v11 = v56;
              [v56 addObject:v28];
              uint64_t v29 = (void *)SFLogFramework;
              if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
              {
                uint64_t v30 = v29;
                uint64_t v31 = [v16 personaId];
                *(_DWORD *)buf = 136315394;
                v63 = "+[SFUtilities speechProfilePathsWithLanguage:sharedUserInfos:]";
                __int16 v64 = 2112;
                uint64_t v65 = (uint64_t)v31;
                _os_log_impl(&dword_1B709D000, v30, OS_LOG_TYPE_INFO, "%s MUX: Discovered UserVault container for personaId: %@", buf, 0x16u);
              }
            }
            if (_os_feature_enabled_impl())
            {
              v32 = [SFSpeechProfileContainer alloc];
              uint64_t v33 = SFSpeechProfileRootDirectoryURL();
              uint64_t v34 = [v16 personaId];
              v35 = [v16 sharedUserId];
              uint64_t v36 = [v16 loggableSharedUserId];
              uint64_t v37 = [(SFSpeechProfileContainer *)v32 initWithURL:v33 personaId:v34 userId:v35 loggableUserId:v36];

              id v11 = v56;
              [v56 addObject:v37];
              uint64_t v38 = (void *)SFLogFramework;
              if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
              {
                id v39 = v38;
                uint64_t v40 = [v16 personaId];
                *(_DWORD *)buf = 136315394;
                v63 = "+[SFUtilities speechProfilePathsWithLanguage:sharedUserInfos:]";
                __int16 v64 = 2112;
                uint64_t v65 = (uint64_t)v40;
                _os_log_impl(&dword_1B709D000, v39, OS_LOG_TYPE_INFO, "%s MUX: Discovered common container for personaId: %@", buf, 0x16u);
              }
            }
          }
          else
          {
            long long v41 = (void *)SFLogFramework;
            if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
            {
              long long v42 = v41;
              long long v43 = [v16 personaId];
              *(_DWORD *)buf = 136315394;
              v63 = "+[SFUtilities speechProfilePathsWithLanguage:sharedUserInfos:]";
              __int16 v64 = 2112;
              uint64_t v65 = (uint64_t)v43;
              _os_log_impl(&dword_1B709D000, v42, OS_LOG_TYPE_INFO, "%s MUX: personaId (%@) does not match an enrolled user, no respective containers will be discovered.", buf, 0x16u);
            }
          }
        }
        id v12 = obj;
        uint64_t v14 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
      }
      while (v14);
    }

    long long v44 = +[SFSpeechProfileContainer defaultContainer];
    [v11 addObject:v44];
    double v45 = (void *)SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
    {
      double v46 = v45;
      uint64_t v47 = [v11 count];
      uint64_t v48 = [v12 count];
      *(_DWORD *)buf = 136315650;
      v63 = "+[SFUtilities speechProfilePathsWithLanguage:sharedUserInfos:]";
      __int16 v64 = 2048;
      uint64_t v65 = v47;
      __int16 v66 = 2048;
      uint64_t v67 = v48;
      _os_log_impl(&dword_1B709D000, v46, OS_LOG_TYPE_INFO, "%s MUX: Discovered %zu speech profile container(s) for %zu user(s).", buf, 0x20u);
    }
    double v49 = objc_msgSend(v11, "allObjects", v52);

    id v6 = v54;
  }
  else
  {
    v50 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v63 = "+[SFUtilities speechProfilePathsWithLanguage:sharedUserInfos:]";
      _os_log_error_impl(&dword_1B709D000, v50, OS_LOG_TYPE_ERROR, "%s language cannot be nil.", buf, 0xCu);
    }
    double v49 = 0;
  }

  return v49;
}

+ (id)speechProfilePathsWithLanguage:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = +[SFUtilities stringByReplacingUnderscoresWithHyphens:v4];

    uint64_t v7 = SFReplacementLocaleCodeForLocaleIdentifier(v6);
    uint64_t v8 = (void *)v7;
    if (v7) {
      id v9 = (void *)v7;
    }
    else {
      id v9 = v6;
    }
    id v10 = v9;

    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [a1 speechProfileRootDirectories];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v29)
    {
      uint64_t v28 = *(void *)v37;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v37 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = v11;
          uint64_t v12 = *(void *)(*((void *)&v36 + 1) + 8 * v11);
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
          uint64_t v14 = [v13 enumeratorAtPath:v12];

          uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v33 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * i);
                double v20 = NSString;
                v40[0] = v12;
                v40[1] = v19;
                v40[2] = v10;
                v40[3] = @"SpeechProfile";
                uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];
                double v22 = [v20 pathWithComponents:v21];

                double v23 = [MEMORY[0x1E4F28CB8] defaultManager];
                int v24 = [v23 fileExistsAtPath:v22];

                if (v24) {
                  [v31 addObject:v22];
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
            }
            while (v16);
          }

          uint64_t v11 = v30 + 1;
        }
        while (v30 + 1 != v29);
        uint64_t v29 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v29);
    }
  }
  else
  {
    v25 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      long long v44 = "+[SFUtilities speechProfilePathsWithLanguage:]";
      _os_log_error_impl(&dword_1B709D000, v25, OS_LOG_TYPE_ERROR, "%s language cannot be nil.", buf, 0xCu);
    }
    id v31 = 0;
  }

  return v31;
}

+ (id)speechProfileRootDirectories
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v3 = SFSpeechProfileSiteDirectories();
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

  id v9 = SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315395;
    uint64_t v16 = "+[SFUtilities speechProfileRootDirectories]";
    __int16 v17 = 2113;
    id v18 = v2;
    _os_log_debug_impl(&dword_1B709D000, v9, OS_LOG_TYPE_DEBUG, "%s Root directories for new type of speech profile: %{private}@", buf, 0x16u);
  }

  return v2;
}

+ (id)_alignTokenToFirstSeenPartialResult:(id)a3 tokenIndex:(unint64_t)a4 firstSeenPartialResultTokens:(id)a5 firstSeenPartialResultIndex:(unint64_t)a6
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  long long v11 = [NSNumber numberWithUnsignedInteger:a4];
  long long v39 = v11;
  long long v12 = [NSNumber numberWithUnsignedInteger:a6];
  v40[0] = v12;
  id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];

  long long v36 = v9;
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
      uint64_t v19 = objc_msgSend(v36, "objectAtIndexedSubscript:", a4, v32);
      uint64_t v20 = [v19 tokenName];
      uint64_t v21 = +[SFUtilities getNormString:v20];

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
        uint64_t v28 = [NSNumber numberWithUnsignedInteger:a4];
        long long v37 = v28;
        uint64_t v29 = [NSNumber numberWithUnsignedInteger:v22];
        long long v38 = v29;
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
      int v24 = [v10 objectAtIndex:v22];
      v25 = [v24 objectForKey:v21];

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
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  int v24 = v5;
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
      unint64_t v13 = +[SFUtilities _alignTokenToFirstSeenPartialResult:v24 tokenIndex:v12 firstSeenPartialResultTokens:v23 firstSeenPartialResultIndex:v11];
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
          [v7 addObject:&unk_1F1056BB8];
          --v20;
        }
        while (v20);
      }
      if (v19 >= v10)
      {
        [v7 addObject:&unk_1F1056BB8];
        unint64_t v11 = v10;
      }
      else
      {
        uint64_t v21 = [NSNumber numberWithUnsignedInteger:v19];
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
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v34 = v5;
  unint64_t v8 = +[SFUtilities _firstSeenPartialResultIndicesForTokens:v5 firstSeenPartialResultTokens:v6];
  uint64_t v9 = [v8 count];
  unint64_t v33 = v6;
  uint64_t v10 = [v6 count];
  if (v9)
  {
    unint64_t v11 = v10;
    uint64_t v12 = 0;
    unint64_t v13 = __Block_byref_object_copy__1926;
    uint64_t v14 = __Block_byref_object_dispose__1927;
    unint64_t v32 = v8;
    do
    {
      uint64_t v36 = 0;
      long long v37 = (id *)&v36;
      uint64_t v38 = 0x3032000000;
      long long v39 = v13;
      uint64_t v40 = v14;
      id v41 = &unk_1F1056BB8;
      unint64_t v15 = [v8 objectAtIndexedSubscript:v12];
      char v16 = [v15 isEqualToNumber:&unk_1F1056BB8];

      if ((v16 & 1) == 0)
      {
        unint64_t v17 = [v8 objectAtIndexedSubscript:v12];
        unint64_t v18 = [v17 unsignedIntegerValue];

        if (v18 < v11)
        {
          unint64_t v19 = v14;
          uint64_t v20 = v9;
          uint64_t v21 = v13;
          unint64_t v22 = v11;
          char v23 = v7;
          int v24 = [v34 objectAtIndex:v12];
          v25 = [v24 tokenName];
          unint64_t v26 = +[SFUtilities getNormString:v25];

          unint64_t v27 = [v33 objectAtIndex:v18];
          uint64_t v28 = [v27 objectForKey:v26];
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
            v35[2] = __81__SFUtilities_alignedPartialResultIndicesForTokens_firstSeenPartialResultTokens___block_invoke;
            v35[3] = &unk_1E6155658;
            v35[4] = &v36;
            [v27 enumerateKeysAndObjectsUsingBlock:v35];
          }

          uint64_t v7 = v23;
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

uint64_t __81__SFUtilities_alignedPartialResultIndicesForTokens_firstSeenPartialResultTokens___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v8 = *(void *)(v6 + 40);
  uint64_t v7 = (id *)(v6 + 40);
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
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
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

+ (id)localeCodeForLocale:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4F1C438];
  id v4 = a3;
  id v5 = [v4 objectForKey:v3];
  uint64_t v6 = [v4 objectForKey:*MEMORY[0x1E4F1C400]];

  uint64_t v7 = [NSString stringWithFormat:@"%@-%@", v5, v6];

  return v7;
}

+ (id)defaultClientID
{
  if (defaultClientID_onceToken[0] != -1) {
    dispatch_once(defaultClientID_onceToken, &__block_literal_global_245);
  }
  id v2 = (void *)defaultClientID_defaultClientID;

  return v2;
}

void __30__SFUtilities_defaultClientID__block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 bundleIdentifier];

  if (v1)
  {
    objc_storeStrong((id *)&defaultClientID_defaultClientID, v1);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v3 = [v2 processName];
    id v4 = (void *)defaultClientID_defaultClientID;
    defaultClientID_defaultClientID = v3;

    id v5 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315394;
      uint64_t v7 = "+[SFUtilities defaultClientID]_block_invoke";
      __int16 v8 = 2112;
      uint64_t v9 = defaultClientID_defaultClientID;
      _os_log_fault_impl(&dword_1B709D000, v5, OS_LOG_TYPE_FAULT, "%s Application does not have a bundle identifier; using unstable \"%@\" as client identifier",
        (uint8_t *)&v6,
        0x16u);
    }
  }
}

+ (void)createDirPath:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v4 fileExistsAtPath:v3 isDirectory:0] & 1) == 0)
  {
    id v8 = 0;
    char v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v8];
    id v6 = v8;
    uint64_t v7 = SFLogFramework;
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v10 = "+[SFUtilities createDirPath:]";
        __int16 v11 = 2112;
        id v12 = v3;
        _os_log_debug_impl(&dword_1B709D000, v7, OS_LOG_TYPE_DEBUG, "%s Write successful %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v10 = "+[SFUtilities createDirPath:]";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_1B709D000, v7, OS_LOG_TYPE_INFO, "%s Failed to create directory %@", buf, 0x16u);
    }
  }
}

+ (id)sandboxExtensionsForUsingANEAndAssets
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (+[SFUtilities isCacheDirInternal])
  {
    id v2 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315138;
      uint64_t v10 = "+[SFUtilities sandboxExtensionsForUsingANEAndAssets]";
      _os_log_debug_impl(&dword_1B709D000, v2, OS_LOG_TYPE_DEBUG, "%s Sandbox extension Cache directories not needed.", (uint8_t *)&v9, 0xCu);
    }
    id v3 = 0;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1CA48] array];
    id v4 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    char v5 = [v4 firstObject];

    id v6 = [v5 stringByAppendingPathComponent:@"com.apple.speech.localspeechrecognition"];
    +[SFUtilities createDirPath:v6];
    uint64_t v7 = +[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:v6 error:0];
    if (v7) {
      [v3 addObject:v7];
    }
  }

  return v3;
}

+ (BOOL)isCacheDirInternal
{
  char v2 = 1;
  id v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v4 = [v3 firstObject];

  if (([v4 hasPrefix:@"/var/mobile/Library/Caches"] & 1) == 0) {
    char v2 = [v4 hasPrefix:@"/private/var/mobile/Library/Caches"];
  }

  return v2;
}

+ (id)issueReadSandboxExtensionForFilePath:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = v7;
    uint64_t v21 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 136315650;
    id v30 = "+[SFUtilities issueReadSandboxExtensionForFilePath:error:]";
    __int16 v31 = 2112;
    unint64_t v32 = v21;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_debug_impl(&dword_1B709D000, v20, OS_LOG_TYPE_DEBUG, "%s %@: path=%@", buf, 0x20u);
  }
  id v8 = objc_opt_class();
  int v9 = NSStringFromSelector(a2);
  id v28 = 0;
  int v10 = [v8 canAccessPathAt:v6 methodName:v9 error:&v28];
  id v11 = v28;

  if (v10)
  {
    id v12 = v6;
    [v12 UTF8String];
    uint64_t v13 = sandbox_extension_issue_file();
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      long long v15 = [NSString stringWithUTF8String:v13];
      free(v14);
      goto LABEL_12;
    }
    long long v17 = (void *)SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v26 = v17;
      unint64_t v27 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 136315650;
      id v30 = "+[SFUtilities issueReadSandboxExtensionForFilePath:error:]";
      __int16 v31 = 2112;
      unint64_t v32 = v27;
      __int16 v33 = 2112;
      id v34 = v12;
      _os_log_debug_impl(&dword_1B709D000, v26, OS_LOG_TYPE_DEBUG, "%s %@: sandbox_extension_issue_file() returned NULL. path=%@", buf, 0x20u);
    }
    goto LABEL_11;
  }
  long long v16 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
  {
    int v24 = v16;
    v25 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 136315906;
    id v30 = "+[SFUtilities issueReadSandboxExtensionForFilePath:error:]";
    __int16 v31 = 2112;
    unint64_t v32 = v25;
    __int16 v33 = 2112;
    id v34 = v6;
    __int16 v35 = 2112;
    id v36 = v11;
    _os_log_error_impl(&dword_1B709D000, v24, OS_LOG_TYPE_ERROR, "%s %@: Inaccessible file (%@) : error=%@", buf, 0x2Au);

    if (a4) {
      goto LABEL_8;
    }
  }
  else if (a4)
  {
LABEL_8:
    long long v15 = 0;
    *a4 = v11;
    goto LABEL_12;
  }
LABEL_11:
  long long v15 = 0;
LABEL_12:
  long long v18 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v22 = v18;
    char v23 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 136315650;
    id v30 = "+[SFUtilities issueReadSandboxExtensionForFilePath:error:]";
    __int16 v31 = 2112;
    unint64_t v32 = v23;
    __int16 v33 = 2112;
    id v34 = v15;
    _os_log_debug_impl(&dword_1B709D000, v22, OS_LOG_TYPE_DEBUG, "%s %@: sandboxExtension=%@", buf, 0x20u);
  }

  return v15;
}

+ (id)issueReadWriteSandboxExtensionForDirectoryPath:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
  {
    long long v18 = v7;
    unint64_t v19 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 136315650;
    id v30 = "+[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:error:]";
    __int16 v31 = 2112;
    unint64_t v32 = v19;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_debug_impl(&dword_1B709D000, v18, OS_LOG_TYPE_DEBUG, "%s %@: path=%@", buf, 0x20u);
  }
  id v8 = objc_opt_class();
  int v9 = NSStringFromSelector(a2);
  id v28 = 0;
  int v10 = [v8 canAccessPathAt:v6 methodName:v9 error:&v28];
  id v11 = v28;

  if (!v10)
  {
    long long v16 = (void *)SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = v16;
      uint64_t v21 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 136315906;
      id v30 = "+[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:error:]";
      __int16 v31 = 2112;
      unint64_t v32 = v21;
      __int16 v33 = 2112;
      id v34 = v6;
      __int16 v35 = 2112;
      id v36 = v11;
      _os_log_error_impl(&dword_1B709D000, v20, OS_LOG_TYPE_ERROR, "%s %@: Inaccessible file (%@) : error=%@", buf, 0x2Au);

      if (a4) {
        goto LABEL_8;
      }
    }
    else if (a4)
    {
LABEL_8:
      long long v15 = 0;
      *a4 = v11;
      goto LABEL_15;
    }
    long long v15 = 0;
    goto LABEL_15;
  }
  id v12 = [NSString stringWithFormat:@"%@/", v6];
  [v12 UTF8String];
  uint64_t v13 = sandbox_extension_issue_file();
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    long long v15 = [NSString stringWithUTF8String:v13];
    free(v14);
  }
  else
  {
    long long v17 = (void *)SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v26 = v17;
      unint64_t v27 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 136315650;
      id v30 = "+[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:error:]";
      __int16 v31 = 2112;
      unint64_t v32 = v27;
      __int16 v33 = 2112;
      id v34 = v12;
      _os_log_debug_impl(&dword_1B709D000, v26, OS_LOG_TYPE_DEBUG, "%s %@: sandbox_extension_issue_file() returned NULL. path=%@", buf, 0x20u);
    }
    long long v15 = 0;
  }

LABEL_15:
  unint64_t v22 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
  {
    int v24 = v22;
    v25 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 136315650;
    id v30 = "+[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:error:]";
    __int16 v31 = 2112;
    unint64_t v32 = v25;
    __int16 v33 = 2112;
    id v34 = v15;
    _os_log_debug_impl(&dword_1B709D000, v24, OS_LOG_TYPE_DEBUG, "%s %@: sandboxExtension=%@", buf, 0x20u);
  }

  return v15;
}

+ (BOOL)canAccessPathAt:(id)a3 methodName:(id)a4 error:(id *)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v10 = [v9 fileExistsAtPath:v7];
  BOOL v11 = v10;
  if (a5 && (v10 & 1) == 0)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F4E698];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    uint64_t v14 = [NSString stringWithFormat:@"Failed to access path: %@ method:%@", v7, v8];
    v18[0] = v14;
    long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    *a5 = [v12 errorWithDomain:v13 code:203 userInfo:v15];
  }
  return v11;
}

+ (BOOL)isSpeechXPCEnabled
{
  if (isSpeechXPCEnabled_onceToken[0] != -1) {
    dispatch_once(isSpeechXPCEnabled_onceToken, &__block_literal_global_227);
  }
  return isSpeechXPCEnabled_result;
}

uint64_t __33__SFUtilities_isSpeechXPCEnabled__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  if (result) {
    isSpeechXPCEnabled_uint64_t result = 1;
  }
  return result;
}

+ (id)recognizedResultFromPackage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 recognition];
  char v5 = [v4 phrases];
  id v6 = [v3 audioAnalytics];
  [v3 utteranceStart];
  id v7 = +[SFUtilities transcriptionFromSpeechPhrases:afAudioAnalytics:utteranceStart:](SFUtilities, "transcriptionFromSpeechPhrases:afAudioAnalytics:utteranceStart:", v5, v6);

  id v8 = [v3 rawRecognition];
  int v9 = [v8 phrases];
  char v10 = [v3 audioAnalytics];
  [v3 utteranceStart];
  BOOL v11 = +[SFUtilities transcriptionFromSpeechPhrases:afAudioAnalytics:utteranceStart:](SFUtilities, "transcriptionFromSpeechPhrases:afAudioAnalytics:utteranceStart:", v9, v10);

  id v12 = [v3 recognition];
  uint64_t v13 = [v12 phrases];
  uint64_t v14 = [v3 audioAnalytics];
  [v3 utteranceStart];
  long long v15 = +[SFUtilities recognitionMetadataFromSpeechPhrases:afAudioAnalytics:utteranceStart:](SFUtilities, "recognitionMetadataFromSpeechPhrases:afAudioAnalytics:utteranceStart:", v13, v14);

  long long v16 = [SFSpeechRecognitionResult alloc];
  uint64_t v17 = [v3 isFinal];

  id v18 = [(SFSpeechRecognitionResult *)v16 _initWithBestTranscription:v7 rawTranscription:v11 final:v17 speechRecognitionMetadata:v15];

  return v18;
}

+ (id)transcriptionsWithTokens:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v26 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [MEMORY[0x1E4F28E78] string];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v25 = *(void *)v28;
    uint64_t v8 = MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        char v10 = v7;
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(obj);
        }
        BOOL v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (v10
          && ([*(id *)(*((void *)&v27 + 1) + 8 * i) removeSpaceBefore] & 1) == 0
          && ([v10 removeSpaceAfter] & 1) == 0)
        {
          [v4 appendString:@" "];
        }
        id v12 = [v11 text];
        uint64_t v13 = [v4 length];
        uint64_t v14 = [v12 length];
        [v11 startTime];
        double v16 = v15;
        uint64_t v17 = [SFTranscriptionSegment alloc];
        [v11 silenceStartTime];
        double v19 = v18 - v16;
        *(float *)&double v20 = (double)[v11 confidenceScore] * 0.001;
        id v21 = [(SFTranscriptionSegment *)v17 _initWithSubstring:v12 range:v13 timestamp:v14 duration:v8 confidence:v8 alternativeSubstrings:v16 alternativeConfidences:v19 phoneSequence:v20 ipaPhoneSequence:&stru_1F10479F8 voiceAnalytics:0];
        [v26 addObject:v21];
        [v4 appendString:v12];
        id v7 = v11;
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
  }
  id v22 = [[SFTranscription alloc] _initWithSegments:v26 formattedString:v4 speakingRate:0.0 averagePauseDuration:0.0];

  return v22;
}

+ (id)recognitionMetadataFromSpeechPhrases:(id)a3 afAudioAnalytics:(id)a4 utteranceStart:(double)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v24 = a4;
  uint64_t v36 = 0;
  uint64_t v37 = (double *)&v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v32 = 0;
  __int16 v33 = (double *)&v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0x10000000000000;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        BOOL v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v27[0] = 0;
        v27[1] = v27;
        v27[2] = 0x2020000000;
        v27[3] = 0x7FEFFFFFFFFFFFFFLL;
        v33[3] = 2.22507386e-308;
        id v12 = [v11 interpretations];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __84__SFUtilities_recognitionMetadataFromSpeechPhrases_afAudioAnalytics_utteranceStart___block_invoke;
        v26[3] = &unk_1E6155630;
        v26[4] = v27;
        v26[5] = &v32;
        v26[6] = &v36;
        [v12 enumerateObjectsUsingBlock:v26];

        _Block_object_dispose(v27, 8);
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v8);
  }

  uint64_t v13 = VoiceAnalyticsForSegment(v24, v37[3], v33[3]);
  uint64_t v14 = [v24 speechRecognitionFeatures];
  double v15 = [v14 objectForKey:@"speakingRate"];
  [v15 doubleValue];
  double v17 = v16;

  double v18 = [v14 objectForKey:@"averagePauseDuration"];
  [v18 doubleValue];
  double v20 = v19;

  id v21 = [SFSpeechRecognitionMetadata alloc];
  id v22 = [(SFSpeechRecognitionMetadata *)v21 _initWithSpeechStartTimestamp:v13 speechDuration:v37[3] + a5 voiceAnalytics:v33[3] - v37[3] speakingRate:v17 averagePauseDuration:v20];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v22;
}

void __84__SFUtilities_recognitionMetadataFromSpeechPhrases_afAudioAnalytics_utteranceStart___block_invoke(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 tokens];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        double v9 = *(double *)(*(void *)(a1[4] + 8) + 24);
        [v8 startTime];
        if (v9 < v10) {
          double v10 = v9;
        }
        *(double *)(*(void *)(a1[4] + 8) + 24) = v10;
        double v11 = *(double *)(*(void *)(a1[5] + 8) + 24);
        [v8 silenceStartTime];
        if (v11 >= v12) {
          double v12 = v11;
        }
        *(double *)(*(void *)(a1[5] + 8) + 24) = v12;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  uint64_t v13 = *(void *)(a1[6] + 8);
  if (*(double *)(v13 + 24) == 1.79769313e308) {
    *(void *)(v13 + 24) = *(void *)(*(void *)(a1[4] + 8) + 24);
  }
}

+ (id)transcriptionFromSpeechPhrases:(id)a3 afAudioAnalytics:(id)a4 utteranceStart:(double)a5
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v43 = a4;
  unint64_t v8 = 0x1E4F1C000uLL;
  long long v42 = [MEMORY[0x1E4F1CA48] array];
  double v49 = [MEMORY[0x1E4F28E78] string];
  v94[0] = 0;
  v94[1] = v94;
  v94[2] = 0x3032000000;
  v94[3] = __Block_byref_object_copy__1926;
  v94[4] = __Block_byref_object_dispose__1927;
  id v95 = 0;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v90 objects:v96 count:16];
  if (v9)
  {
    uint64_t v47 = *(void *)v91;
    do
    {
      uint64_t v48 = v9;
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v91 != v47) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v90 + 1) + 8 * i);
        double v12 = [v11 interpretations];
        uint64_t v13 = [v12 firstObject];
        if (v13)
        {
          uint64_t v86 = 0;
          long long v87 = &v86;
          uint64_t v88 = 0x2020000000;
          uint64_t v89 = 0;
          uint64_t v89 = [v49 length];
          long long v14 = [MEMORY[0x1E4F28E78] string];
          long long v15 = [*(id *)(v8 + 2632) array];
          long long v16 = [*(id *)(v8 + 2632) array];
          uint64_t v82 = 0;
          long long v83 = (double *)&v82;
          uint64_t v84 = 0x2020000000;
          uint64_t v85 = 0x7FEFFFFFFFFFFFFFLL;
          uint64_t v78 = 0;
          id v79 = (double *)&v78;
          uint64_t v80 = 0x2020000000;
          uint64_t v81 = 0x10000000000000;
          uint64_t v74 = 0;
          uint64_t v75 = &v74;
          uint64_t v76 = 0x2020000000;
          int v77 = 1065353216;
          uint64_t v68 = 0;
          uint64_t v69 = &v68;
          uint64_t v70 = 0x3032000000;
          uint64_t v71 = __Block_byref_object_copy__1926;
          v72 = __Block_byref_object_dispose__1927;
          id v73 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          uint64_t v62 = 0;
          v63 = &v62;
          uint64_t v64 = 0x3032000000;
          uint64_t v65 = __Block_byref_object_copy__1926;
          __int16 v66 = __Block_byref_object_dispose__1927;
          id v67 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          long long v17 = [v11 interpretations];
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __78__SFUtilities_transcriptionFromSpeechPhrases_afAudioAnalytics_utteranceStart___block_invoke;
          v50[3] = &unk_1E6155608;
          uint64_t v55 = &v82;
          uint64_t v56 = &v78;
          id v18 = v15;
          id v51 = v18;
          id v19 = v16;
          id v52 = v19;
          uint64_t v57 = v94;
          id v20 = v49;
          id v53 = v20;
          long long v58 = &v86;
          id v21 = v14;
          id v54 = v21;
          long long v59 = &v74;
          long long v60 = &v68;
          long long v61 = &v62;
          [v17 enumerateObjectsUsingBlock:v50];

          unint64_t v8 = 0x1E4F1C000;
          if (v83[3] != 1.79769313e308 && v79[3] != 2.22507386e-308)
          {
            uint64_t v22 = v87[3];
            uint64_t v23 = [v20 length];
            uint64_t v24 = v87[3];
            if ([(id)v69[5] length])
            {
              uint64_t v45 = [NSString stringWithString:v69[5]];
            }
            else
            {
              uint64_t v45 = 0;
            }
            uint64_t v44 = v22;
            if ([(id)v63[5] length])
            {
              uint64_t v25 = [NSString stringWithString:v63[5]];
            }
            else
            {
              uint64_t v25 = 0;
            }
            unint64_t v26 = VoiceAnalyticsForSegment(v43, v83[3], v79[3]);
            long long v27 = [SFTranscriptionSegment alloc];
            double v28 = v83[3];
            double v29 = v28 + a5;
            double v30 = v79[3];
            double v31 = v30 - v28;
            LODWORD(v30) = *((_DWORD *)v75 + 6);
            id v32 = -[SFTranscriptionSegment _initWithSubstring:range:timestamp:duration:confidence:alternativeSubstrings:alternativeConfidences:phoneSequence:ipaPhoneSequence:voiceAnalytics:](v27, "_initWithSubstring:range:timestamp:duration:confidence:alternativeSubstrings:alternativeConfidences:phoneSequence:ipaPhoneSequence:voiceAnalytics:", v21, v44, v23 - v24, v18, v19, v45, v29, v31, v30, v25, v26);
            [v42 addObject:v32];

            unint64_t v8 = 0x1E4F1C000;
          }

          _Block_object_dispose(&v62, 8);
          _Block_object_dispose(&v68, 8);

          _Block_object_dispose(&v74, 8);
          _Block_object_dispose(&v78, 8);
          _Block_object_dispose(&v82, 8);

          _Block_object_dispose(&v86, 8);
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v90 objects:v96 count:16];
    }
    while (v9);
  }

  __int16 v33 = [v43 speechRecognitionFeatures];
  uint64_t v34 = [v33 objectForKey:@"speakingRate"];
  [v34 doubleValue];
  double v36 = v35;

  uint64_t v37 = [v33 objectForKey:@"averagePauseDuration"];
  [v37 doubleValue];
  double v39 = v38;

  id v40 = [[SFTranscription alloc] _initWithSegments:v42 formattedString:v49 speakingRate:v36 averagePauseDuration:v39];
  _Block_object_dispose(v94, 8);

  return v40;
}

void __78__SFUtilities_transcriptionFromSpeechPhrases_afAudioAnalytics_utteranceStart___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 tokens];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v48 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        double v11 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        [v10 startTime];
        if (v11 < v12) {
          double v12 = v11;
        }
        *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v12;
        double v13 = *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        [v10 silenceStartTime];
        if (v13 >= v14) {
          double v14 = v13;
        }
        *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v14;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v7);
  }
  if (a3)
  {
    long long v15 = *(void **)(a1 + 32);
    id v16 = v5;
    long long v17 = [MEMORY[0x1E4F28E78] string];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v18 = v16;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      double v39 = v15;
      id v21 = 0;
      uint64_t v22 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          uint64_t v24 = v21;
          if (*(void *)v52 != v22) {
            objc_enumerationMutation(v18);
          }
          uint64_t v25 = *(void **)(*((void *)&v51 + 1) + 8 * j);
          if (v24
            && ([*(id *)(*((void *)&v51 + 1) + 8 * j) removeSpaceBefore] & 1) == 0
            && ([v24 removeSpaceAfter] & 1) == 0)
          {
            [v17 appendString:@" "];
          }
          unint64_t v26 = objc_msgSend(v25, "text", v39);
          [v17 appendString:v26];
          id v21 = v25;
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v20);

      long long v15 = v39;
    }

    long long v27 = (void *)[v17 copy];
    [v15 addObject:v27];

    double v28 = *(void **)(a1 + 40);
    double v29 = NSNumber;
    id v30 = v18;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v52;
      double v34 = 1.0;
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v52 != v33) {
            objc_enumerationMutation(v30);
          }
          double v34 = v34 * ((double)[*(id *)(*((void *)&v51 + 1) + 8 * k) confidenceScore] * 0.001);
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v32);
    }
    else
    {
      double v34 = 1.0;
    }

    double v38 = [v29 numberWithDouble:v34];
    [v28 addObject:v38];
  }
  else
  {
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    void v40[2] = __78__SFUtilities_transcriptionFromSpeechPhrases_afAudioAnalytics_utteranceStart___block_invoke_2;
    v40[3] = &unk_1E61555E0;
    uint64_t v43 = *(void *)(a1 + 80);
    id v36 = *(id *)(a1 + 48);
    uint64_t v37 = *(void *)(a1 + 88);
    id v41 = v36;
    uint64_t v44 = v37;
    id v42 = *(id *)(a1 + 56);
    long long v45 = *(_OWORD *)(a1 + 96);
    uint64_t v46 = *(void *)(a1 + 112);
    [v5 enumerateObjectsUsingBlock:v40];

    double v38 = v41;
  }
}

void __78__SFUtilities_transcriptionFromSpeechPhrases_afAudioAnalytics_utteranceStart___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  if (([v12 removeSpaceBefore] & 1) == 0
    && ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeSpaceAfter] & 1) == 0)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      [*(id *)(a1 + 32) appendString:@" "];
      if (!a3)
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        goto LABEL_8;
      }
    }
    else if (!a3)
    {
      goto LABEL_8;
    }
    [*(id *)(a1 + 40) appendString:@" "];
  }
LABEL_8:
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  uint64_t v6 = [v12 text];
  [*(id *)(a1 + 32) appendString:v6];
  [*(id *)(a1 + 40) appendString:v6];
  uint64_t v7 = [v12 confidenceScore];
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  float v9 = (double)v7 * 0.001 * *(float *)(v8 + 24);
  *(float *)(v8 + 24) = v9;
  double v10 = [v12 phoneSequence];
  if ([v10 length])
  {
    if (([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) isEqualToString:&stru_1F10479F8] & 1) == 0) {
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) appendString:@" "];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) appendString:v10];
  }
  double v11 = [v12 ipaPhoneSequence];
  if ([v11 length])
  {
    if (([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) isEqualToString:&stru_1F10479F8] & 1) == 0) {
      [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) appendString:@"."];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) appendString:v11];
  }
}

+ (id)taskNameFromTaskHint:(int64_t)a3
{
  id result = @"Dictation";
  switch(a3)
  {
    case 1001:
      id result = @"SearchOrMessaging";
      break;
    case 1002:
      id result = @"VoiceMail";
      break;
    case 1003:
    case 1009:
    case 1010:
      return result;
    case 1004:
      id result = @"Captioning";
      break;
    case 1005:
      id result = @"DictationCC";
      break;
    case 1006:
      id result = @"SpellCC";
      break;
    case 1007:
    case 1008:
      id result = @"Tshot";
      break;
    case 1011:
      id result = @"SiriDictation";
      break;
    default:
      if (a3 == 2) {
        id result = @"WebSearch";
      }
      break;
  }
  return result;
}

+ (void)supportedLocalesWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v14 = (void (**)(id, void *, void *))a3;
  id v3 = AFPreferencesSupportedDictationLanguages();
  id v16 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v3, "count"));
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v3, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = @"hi-IN-translit";
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(id *)(*((void *)&v17 + 1) + 8 * v9);
        double v11 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v10];
        if (v11)
        {
          [v16 addObject:v11];
          [v4 addObject:v10];
        }
        if ([v10 isEqualToString:@"hi-IN"])
        {
          [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v8];
          v13 = id v12 = v8;
          if (v13)
          {
            [v16 addObject:v13];
            [v4 addObject:v12];
          }

          uint64_t v8 = v12;
        }

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  v14[2](v14, v16, v4);
}

@end