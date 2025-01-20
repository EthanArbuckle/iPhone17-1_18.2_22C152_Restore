@interface CSOnDeviceCompilationUtils
+ (BOOL)isBnnsIrNameForCurrentBuild:(id)a3;
+ (BOOL)shouldCompileForAssetType:(unint64_t)a3;
+ (BOOL)validateSecondPassCheckerCompilation:(id)a3 error:(id *)a4;
+ (id)_getBaseNamingWithHashToUse:(id)a3 milName:(id)a4 configVersion:(id)a5;
+ (id)_getCachedIrsFromConfigFile:(id)a3 modelType:(int64_t)a4 CSAsset:(id)a5 cachedIrDir:(id)a6;
+ (id)getCachedIrFromConfigPath:(id)a3 modelTye:(int64_t)a4 asset:(id)a5;
+ (id)getCachedIrFromMilFilePath:(id)a3 modelTye:(int64_t)a4 asset:(id)a5;
+ (id)getCachedIrFromMilFilePath:(id)a3 modelTye:(int64_t)a4 asset:(id)a5 cachedIrHomePath:(id)a6;
+ (id)getCachedIrsFromCSAsset:(id)a3 cachedIrDir:(id)a4;
+ (id)getIrNameFromModelNameForCompile:(id)a3 locale:(id)a4 assetVersion:(id)a5 hashToUse:(id)a6;
+ (id)getMilConfigFromMilFilePath:(id)a3;
+ (id)getModelCompiledDirWithModelType:(int64_t)a3 basePath:(id)a4;
+ (id)getModelConfigsWithAsset:(id)a3 modelType:(int64_t)a4;
+ (id)getModelNameFromMilFilePath:(id)a3;
+ (id)readMilFilePathFromConfig:(id)a3 modelType:(int64_t)a4;
+ (id)sortCachedIrsByLastAccessTimeStamp:(id)a3;
+ (int64_t)getBackendTypeFromModelFile:(id)a3;
@end

@implementation CSOnDeviceCompilationUtils

+ (BOOL)validateSecondPassCheckerCompilation:(id)a3 error:(id *)a4
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = +[CSVoiceTriggerSecondPassConfigDecoder decodeConfigFrom:v5 forFirstPassSource:0];
    v7 = [v6 configPathRecognizer];
    if (v7
      && ([MEMORY[0x1E4F28CB8] defaultManager],
          v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v8 fileExistsAtPath:v7],
          v8,
          (v9 & 1) != 0))
    {
      v10 = +[CSOnDeviceCompilationUtils readMilFilePathFromConfig:v7 modelType:1];
      if (v10)
      {
        v11 = [MEMORY[0x1E4F28CB8] defaultManager];
        char v12 = [v11 fileExistsAtPath:v10];

        if (v12)
        {
          v13 = +[CSOnDeviceCompilationUtils getMilConfigFromMilFilePath:v10];
          id v14 = [NSString alloc];
          v15 = [v5 identity];
          uint64_t v16 = [v14 initWithFormat:@"%@.temp.bnnsir", v15];

          v17 = NSTemporaryDirectory();
          v44 = (void *)v16;
          v18 = [v17 stringByAppendingPathComponent:v16];

          id v45 = 0;
          [MEMORY[0x1E4F61038] compileWithModelMilPath:v10 bnnsIrOutPath:v18 milConfigPath:v13 errorOut:&v45];
          id v19 = v45;
          v20 = v19;
          if (a4 && v19)
          {
            v21 = [v19 localizedDescription];
            v42 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v43 = *MEMORY[0x1E4F60F60];
            uint64_t v46 = *MEMORY[0x1E4F28568];
            id v22 = v21;
            v41 = v18;
            if ([v22 containsString:@"bnns error message: "]
              && (uint64_t v23 = [v22 rangeOfString:@"bnns error message: "], v23 != 0x7FFFFFFFFFFFFFFFLL))
            {
              v39 = [v22 substringFromIndex:v23 + v24];
              v38 = [v39 componentsSeparatedByString:@"[stack trace: ]"];
              v25 = [v38 firstObject];
            }
            else
            {
              v25 = @"Unkown error";
            }

            v47 = v25;
            [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
            v33 = v40 = v22;
            *a4 = [v42 errorWithDomain:v43 code:3 userInfo:v33];

            v18 = v41;
          }
          v34 = [MEMORY[0x1E4F28CB8] defaultManager];
          int v35 = [v34 fileExistsAtPath:v18];

          if (v35)
          {
            v36 = [MEMORY[0x1E4F28CB8] defaultManager];
            [v36 removeItemAtPath:v18 error:0];
          }
          BOOL v28 = v20 == 0;

          goto LABEL_25;
        }
      }
      if (a4)
      {
        v31 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v32 = *MEMORY[0x1E4F60F60];
        uint64_t v48 = *MEMORY[0x1E4F28568];
        v49 = @"mil file path is not found";
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        [v31 errorWithDomain:v32 code:3 userInfo:v13];
        BOOL v28 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

        goto LABEL_26;
      }
      BOOL v28 = 0;
    }
    else
    {
      if (!a4)
      {
        BOOL v28 = 0;
LABEL_27:

        goto LABEL_28;
      }
      v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F60F60];
      uint64_t v50 = *MEMORY[0x1E4F28568];
      v51 = @"configfile for secondpass checker is not found";
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      [v26 errorWithDomain:v27 code:3 userInfo:v10];
      BOOL v28 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_26:

    goto LABEL_27;
  }
  if (a4)
  {
    v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F60F60];
    uint64_t v52 = *MEMORY[0x1E4F28568];
    v53[0] = @"asset is nil";
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
    [v29 errorWithDomain:v30 code:3 userInfo:v6];
    BOOL v28 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

    goto LABEL_29;
  }
  BOOL v28 = 0;
LABEL_29:

  return v28;
}

+ (id)_getCachedIrsFromConfigFile:(id)a3 modelType:(int64_t)a4 CSAsset:(id)a5 cachedIrDir:(id)a6
{
  id v9 = a5;
  v10 = +[CSOnDeviceCompilationUtils readMilFilePathFromConfig:a3 modelType:a4];
  if (v10)
  {
    v11 = [a1 getCachedIrFromMilFilePath:v10 modelTye:a4 asset:v9];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_getBaseNamingWithHashToUse:(id)a3 milName:(id)a4 configVersion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)MGGetStringAnswer();
  v11 = [NSString stringWithFormat:@"%@-%@-%@-%@", v10, v9, v8, v7];

  return v11;
}

+ (id)getModelConfigsWithAsset:(id)a3 modelType:(int64_t)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  switch(a4)
  {
    case 1:
      uint64_t v7 = +[CSVoiceTriggerSecondPassConfigDecoder fetchAllVoiceTriggerSecondPassRecognizer:v5];
      goto LABEL_6;
    case 2:
      uint64_t v7 = [v5 getAllNldaConfigFiles];
      goto LABEL_6;
    case 3:
      uint64_t v7 = [v5 getAllMitigationConfigFiles];
LABEL_6:
      id v8 = (void *)v7;
      goto LABEL_22;
    case 4:
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v10 = [v6 progCheckerRecognizerConfigFiles];
      v11 = [v6 contConvRecognizerConfigFiles];
      if (v10) {
        [v9 addObjectsFromArray:v10];
      }
      if (v11) {
        [v9 addObjectsFromArray:v11];
      }
      id v8 = [v9 allObjects];

      goto LABEL_21;
    case 5:
      id v8 = [v5 resourcePath];

      if (!v8) {
        goto LABEL_22;
      }
      if (CSIsHorseman_onceToken != -1) {
        dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
      }
      int v12 = CSIsHorseman_isHorseman;
      v13 = [v6 resourcePath];
      id v14 = v13;
      if (v12) {
        v15 = @"spid/spid.json";
      }
      else {
        v15 = @"sr/sr.json";
      }
      id v9 = [v13 stringByAppendingPathComponent:v15];

      if (v9)
      {
        v17[0] = v9;
        id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      }
      else
      {
        id v8 = 0;
      }
LABEL_21:

LABEL_22:
      return v8;
    default:
      id v8 = 0;
      goto LABEL_22;
  }
}

+ (id)getModelCompiledDirWithModelType:(int64_t)a3 basePath:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case 0:
      uint64_t v7 = @"CSTempModel";
      goto LABEL_11;
    case 1:
      uint64_t v7 = @"secondPassChecker";
      goto LABEL_11;
    case 2:
      uint64_t v7 = @"odld";
      goto LABEL_11;
    case 3:
      uint64_t v7 = @"neuralCombiner";
      goto LABEL_11;
    case 4:
      uint64_t v7 = @"aftm";
      goto LABEL_11;
    case 5:
      uint64_t v7 = @"speakerRecognition";
LABEL_11:
      id v9 = [v5 stringByAppendingPathComponent:v7];
      break;
    default:
      id v8 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315394;
        int v12 = "+[CSOnDeviceCompilationUtils getModelCompiledDirWithModelType:basePath:]";
        __int16 v13 = 2048;
        int64_t v14 = a3;
        _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Does not support model type: %lu", (uint8_t *)&v11, 0x16u);
      }
      id v9 = 0;
      break;
  }

  return v9;
}

+ (BOOL)isBnnsIrNameForCurrentBuild:(id)a3
{
  id v3 = a3;
  v4 = (void *)MGGetStringAnswer();
  char v5 = [v3 hasPrefix:v4];

  return v5;
}

+ (id)sortCachedIrsByLastAccessTimeStamp:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v30 = v3;
    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v37;
      uint64_t v9 = *MEMORY[0x1E4F28310];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v37 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          if (v11)
          {
            int v12 = [MEMORY[0x1E4F28CB8] defaultManager];
            int v13 = [v12 fileExistsAtPath:v11];

            if (v13)
            {
              int64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
              uint64_t v15 = [v14 attributesOfItemAtPath:v11 error:0];

              if (v15)
              {
                uint64_t v16 = [v15 objectForKey:v9];

                if (v16)
                {
                  v17 = [v15 objectForKey:v9];
                  v46[0] = @"path";
                  v46[1] = @"lastModificationTime";
                  v47[0] = v11;
                  v47[1] = v17;
                  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
                  [v31 addObject:v18];
                }
              }
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v36 objects:v48 count:16];
      }
      while (v7);
    }

    id v19 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v43 = "+[CSOnDeviceCompilationUtils sortCachedIrsByLastAccessTimeStamp:]";
      __int16 v44 = 2112;
      id v45 = v31;
      _os_log_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_DEFAULT, "%s cachedIrs info sorted by timestamps: %@", buf, 0x16u);
    }
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"lastModificationTime" ascending:1];
    v41 = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
    id v22 = [v31 sortedArrayUsingDescriptors:v21];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(v23);
          }
          BOOL v28 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * j), "objectForKey:", @"path", v30);
          [v4 addObject:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v25);
    }

    id v3 = v30;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)getCachedIrFromMilFilePath:(id)a3 modelTye:(int64_t)a4 asset:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = +[CSFPreferences sharedPreferences];
  uint64_t v11 = [v10 getOnDeviceCompilationCacheDirectory];

  int v12 = [a1 getCachedIrFromMilFilePath:v9 modelTye:a4 asset:v8 cachedIrHomePath:v11];

  return v12;
}

+ (id)getCachedIrFromMilFilePath:(id)a3 modelTye:(int64_t)a4 asset:(id)a5 cachedIrHomePath:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (v9 && [v9 hasSuffix:@"mil"])
  {
    int v12 = +[CSOnDeviceCompilationUtils getModelNameFromMilFilePath:v9];
    int v13 = +[CSOnDeviceCompilationUtils getModelCompiledDirWithModelType:a4 basePath:v11];
    int64_t v14 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
    uint64_t v15 = [v10 configVersion];
    uint64_t v16 = [v10 hashFromResourcePath];
    v17 = +[CSOnDeviceCompilationUtils getIrNameFromModelNameForCompile:v12 locale:v14 assetVersion:v15 hashToUse:v16];
    v18 = [v13 stringByAppendingPathComponent:v17];
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)getCachedIrFromConfigPath:(id)a3 modelTye:(int64_t)a4 asset:(id)a5
{
  id v7 = a5;
  id v8 = +[CSOnDeviceCompilationUtils readMilFilePathFromConfig:a3 modelType:a4];
  id v9 = +[CSOnDeviceCompilationUtils getCachedIrFromMilFilePath:v8 modelTye:a4 asset:v7];

  return v9;
}

+ (id)getCachedIrsFromCSAsset:(id)a3 cachedIrDir:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  id v9 = 0;
  if (v6 && v7)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v11 = +[CSOnDeviceCompilationModelListDecoder decodeConfigFrom:v6];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __66__CSOnDeviceCompilationUtils_getCachedIrsFromCSAsset_cachedIrDir___block_invoke;
    v28[3] = &unk_1E6200720;
    id v13 = v11;
    id v29 = v13;
    id v14 = v6;
    id v30 = v14;
    id v33 = a1;
    id v15 = v12;
    id v31 = v15;
    id v16 = v10;
    id v32 = v16;
    v17 = (void (**)(void, void))MEMORY[0x1BA9E7570](v28);
    ((void (**)(void, void *))v17)[2](v17, CSOnDeviceCompileSupportedVoiceTriggerModelTypes);
    if (!+[CSUtils isDarwinOS]
      && !+[CSUtils isBridgeOS])
    {
      v17[2](v17, CSOnDeviceCompileSupportedMitigationModelTypes);
    }
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __66__CSOnDeviceCompilationUtils_getCachedIrsFromCSAsset_cachedIrDir___block_invoke_2;
    id v23 = &unk_1E6200748;
    id v27 = a1;
    id v24 = v14;
    id v25 = v8;
    id v26 = v15;
    id v18 = v15;
    [v16 enumerateKeysAndObjectsUsingBlock:&v20];
    id v9 = objc_msgSend(v18, "copy", v20, v21, v22, v23);
  }
  return v9;
}

void __66__CSOnDeviceCompilationUtils_getCachedIrsFromCSAsset_cachedIrDir___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];

        if (v9)
        {
          id v10 = [*(id *)(a1 + 40) resourcePath];
          id v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
          id v12 = [v10 stringByAppendingPathComponent:v11];

          id v13 = objc_msgSend(*(id *)(a1 + 64), "getCachedIrFromMilFilePath:modelTye:asset:", v12, (int)objc_msgSend(v8, "intValue"), *(void *)(a1 + 40));
          id v14 = v13;
          if (v13)
          {
            id v15 = *(void **)(a1 + 48);
            id v16 = [v13 stringByStandardizingPath];
            [v15 addObject:v16];
          }
        }
        else
        {
          id v12 = objc_msgSend(*(id *)(a1 + 64), "getModelConfigsWithAsset:modelType:", *(void *)(a1 + 40), (int)objc_msgSend(v8, "intValue"));
          if (v12) {
            [*(id *)(a1 + 56) setObject:v12 forKeyedSubscript:v8];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
}

void __66__CSOnDeviceCompilationUtils_getCachedIrsFromCSAsset_cachedIrDir___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(a1 + 56), "_getCachedIrsFromConfigFile:modelType:CSAsset:cachedIrDir:", *(void *)(*((void *)&v12 + 1) + 8 * v10), (int)objc_msgSend(v5, "intValue"), *(void *)(a1 + 32), *(void *)(a1 + 40));
        if (v11) {
          [*(id *)(a1 + 48) addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

+ (int64_t)getBackendTypeFromModelFile:(id)a3
{
  id v3 = a3;
  if ([v3 hasSuffix:@".bnns.mil"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 hasSuffix:@".mil"])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (id)getIrNameFromModelNameForCompile:(id)a3 locale:(id)a4 assetVersion:(id)a5 hashToUse:(id)a6
{
  id v6 = 0;
  if (a5 && a4 && a3 && a6)
  {
    id v11 = a4;
    long long v12 = [a1 _getBaseNamingWithHashToUse:a6 milName:a3 configVersion:a5];
    long long v13 = [NSString stringWithFormat:@"-%@", v11];

    long long v14 = [v12 stringByAppendingString:v13];

    id v6 = [v14 stringByAppendingPathExtension:@"bnnsir"];
  }
  return v6;
}

+ (id)getMilConfigFromMilFilePath:(id)a3
{
  return (id)[a3 stringByAppendingPathExtension:@"config"];
}

+ (id)getModelNameFromMilFilePath:(id)a3
{
  id v3 = [a3 pathComponents];
  [v3 count];
  int64_t v4 = objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(v3, "count") - 2);
  id v5 = [v4 stringByReplacingOccurrencesOfString:@".mlmodelc" withString:&stru_1F13A10B0];

  return v5;
}

+ (id)readMilFilePathFromConfig:(id)a3 modelType:(int64_t)a4
{
  id v5 = a3;
  if (v5)
  {
    switch(a4)
    {
      case 1:
      case 4:
      case 5:
        id v6 = +[CSUtils readValuesFromJsonFile:v5 keyword:@"model-file"];
        uint64_t v7 = [v6 firstObject];

        if (v7)
        {
          uint64_t v8 = [v5 stringByDeletingLastPathComponent];
          uint64_t v9 = [v8 stringByAppendingPathComponent:v7];
          goto LABEL_10;
        }
        id v10 = 0;
        break;
      case 2:
        uint64_t v7 = +[CSFModelConfigDecoder decodeJsonFromFile:v5];
        uint64_t v8 = [v5 stringByDeletingLastPathComponent];
        uint64_t v9 = +[CSFModelConfigDecoder getOdldModelFileFromConfigDict:v7 resourcePath:v8];
        goto LABEL_10;
      case 3:
        uint64_t v7 = +[CSFModelConfigDecoder decodeJsonFromFile:v5];
        uint64_t v8 = [v5 stringByDeletingLastPathComponent];
        uint64_t v9 = +[CSFModelConfigDecoder getNCModelFileFromConfigDict:v7 resourcePath:v8];
LABEL_10:
        id v10 = (id)v9;

        if (!v10 || ![v10 hasSuffix:@"mil"]) {
          goto LABEL_13;
        }
        id v10 = v10;
        uint64_t v7 = v10;
        break;
      default:
        id v10 = 0;
LABEL_13:
        uint64_t v7 = 0;
        break;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (BOOL)shouldCompileForAssetType:(unint64_t)a3
{
  return a3 != 6 || !+[CSUtils isDarwinOS];
}

@end