@interface CSFOnDeviceCachedIrPurgingUtils
+ (void)cleanUpLegacyCachedIrDir:(id)a3;
+ (void)cleanUpPreviousBuildBnnsIrInCachedIrDir:(id)a3;
+ (void)purgeCachedIrExceptActiveCachedIrs:(id)a3 cachedIrDir:(id)a4;
+ (void)purgeCachedIrForTrialAssetExcludingCurrentAsset:(id)a3 baseCachedIrDir:(id)a4;
+ (void)removeOnDeviceCachedPath;
@end

@implementation CSFOnDeviceCachedIrPurgingUtils

+ (void)purgeCachedIrForTrialAssetExcludingCurrentAsset:(id)a3 baseCachedIrDir:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = +[CSOnDeviceCompilationUtils getCachedIrsFromCSAsset:v5 cachedIrDir:v6];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __99__CSFOnDeviceCachedIrPurgingUtils_purgeCachedIrForTrialAssetExcludingCurrentAsset_baseCachedIrDir___block_invoke;
    v14 = &unk_1E6200B60;
    id v15 = v6;
    id v8 = v7;
    id v16 = v8;
    v9 = (void (**)(void, void))MEMORY[0x1BA9E7570](&v11);
    if (!objc_msgSend(v5, "assetType", v11, v12, v13, v14)) {
      ((void (**)(void, void *))v9)[2](v9, CSOnDeviceCompileSupportedVoiceTriggerModelTypes);
    }
    if ([v5 assetType] == 6) {
      v9[2](v9, CSOnDeviceCompileSupportedMitigationModelTypes);
    }
  }
  else
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "+[CSFOnDeviceCachedIrPurgingUtils purgeCachedIrForTrialAssetExcludingCurrentAsset:baseCachedIrDir:]";
      _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s cachedIrDir specified as nil for purging", buf, 0xCu);
    }
  }
}

void __99__CSFOnDeviceCachedIrPurgingUtils_purgeCachedIrForTrialAssetExcludingCurrentAsset_baseCachedIrDir___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = +[CSOnDeviceCompilationUtils getModelCompiledDirWithModelType:basePath:](CSOnDeviceCompilationUtils, "getModelCompiledDirWithModelType:basePath:", (int)[*(id *)(*((void *)&v9 + 1) + 8 * v7) intValue], *(void *)(a1 + 32));
        +[CSFOnDeviceCachedIrPurgingUtils purgeCachedIrExceptActiveCachedIrs:*(void *)(a1 + 40) cachedIrDir:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

+ (void)removeOnDeviceCachedPath
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = +[CSFPreferences sharedPreferences];
  id v3 = [v2 getOnDeviceCompilationCacheDirectory];

  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = 0;
  [v4 removeItemAtPath:v3 error:&v7];
  id v5 = v7;

  if (v5)
  {
    uint64_t v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v9 = "+[CSFOnDeviceCachedIrPurgingUtils removeOnDeviceCachedPath]";
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, "%s cleanUpOnDeviceCompilationPath cleanup has error: %@", buf, 0x16u);
    }
  }
}

+ (void)cleanUpLegacyCachedIrDir:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v9 = 0;
    [v6 removeItemAtPath:v3 error:&v9];
    id v7 = v9;

    if (v7)
    {
      id v8 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v11 = "+[CSFOnDeviceCachedIrPurgingUtils cleanUpLegacyCachedIrDir:]";
        __int16 v12 = 2112;
        id v13 = v7;
        _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s removing legacy path with error: %@", buf, 0x16u);
      }
    }
  }
}

+ (void)cleanUpPreviousBuildBnnsIrInCachedIrDir:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v5 = [v4 contentsOfDirectoryAtPath:v3 error:0];

  if (v5 && [v5 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v19 = v5;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v33 count:16];
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
          uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          if (!+[CSOnDeviceCompilationUtils isBnnsIrNameForCurrentBuild:v11])
          {
            __int16 v12 = [v3 stringByAppendingPathComponent:v11];
            id v13 = [v12 stringByStandardizingPath];

            char v22 = 0;
            uint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
            int v15 = [v14 fileExistsAtPath:v13 isDirectory:&v22];

            if (v15)
            {
              if (v22)
              {
                [a1 cleanUpPreviousBuildBnnsIrInCachedIrDir:v13];
              }
              else
              {
                id v16 = [MEMORY[0x1E4F28CB8] defaultManager];
                id v21 = 0;
                [v16 removeItemAtPath:v13 error:&v21];
                id v17 = v21;

                v18 = CSLogContextFacilityCoreSpeech;
                if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  v28 = "+[CSFOnDeviceCachedIrPurgingUtils cleanUpPreviousBuildBnnsIrInCachedIrDir:]";
                  __int16 v29 = 2112;
                  v30 = v13;
                  __int16 v31 = 2112;
                  id v32 = v17;
                  _os_log_impl(&dword_1BA1A5000, v18, OS_LOG_TYPE_DEFAULT, "%s remove folders or file for daemon start cleanup: %@ with error: %@", buf, 0x20u);
                }
              }
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v33 count:16];
      }
      while (v8);
    }

    int v5 = v19;
  }
}

+ (void)purgeCachedIrExceptActiveCachedIrs:(id)a3 cachedIrDir:(id)a4
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v75 = "+[CSFOnDeviceCachedIrPurgingUtils purgeCachedIrExceptActiveCachedIrs:cachedIrDir:]";
    __int16 v76 = 2112;
    uint64_t v77 = (uint64_t)v5;
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Current active Irs: %@", buf, 0x16u);
  }
  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v73 = 0;
  uint64_t v9 = [v8 contentsOfDirectoryAtPath:v6 error:&v73];
  id v10 = v73;

  if (v10)
  {
    uint64_t v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v75 = "+[CSFOnDeviceCachedIrPurgingUtils purgeCachedIrExceptActiveCachedIrs:cachedIrDir:]";
      __int16 v76 = 2112;
      uint64_t v77 = (uint64_t)v10;
      _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Can't fetch files within bnns cached ir folder with error: %@", buf, 0x16u);
    }
  }
  else
  {
    __int16 v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self ENDSWITH '.bnnsir'"];
    id v13 = [v9 filteredArrayUsingPredicate:v12];

    if (v13 && [v13 count])
    {
      v50 = v9;
      v52 = v5;
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      v51 = v13;
      id v15 = v13;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v69 objects:v83 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v70;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v70 != v18) {
              objc_enumerationMutation(v15);
            }
            if (*(void *)(*((void *)&v69 + 1) + 8 * i))
            {
              v20 = objc_msgSend(v6, "stringByAppendingPathComponent:");
              id v21 = [v20 stringByStandardizingPath];
              [v14 addObject:v21];
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v69 objects:v83 count:16];
        }
        while (v17);
      }

      id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v23 = v52;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v65 objects:v82 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v66;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v66 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = [*(id *)(*((void *)&v65 + 1) + 8 * j) stringByStandardizingPath];
            [v22 addObject:v28];
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v65 objects:v82 count:16];
        }
        while (v25);
      }

      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v30 = v14;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v61 objects:v81 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v62;
        do
        {
          for (uint64_t k = 0; k != v32; ++k)
          {
            if (*(void *)v62 != v33) {
              objc_enumerationMutation(v30);
            }
            uint64_t v35 = *(void *)(*((void *)&v61 + 1) + 8 * k);
            if (([v22 containsObject:v35] & 1) == 0) {
              [v29 addObject:v35];
            }
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v61 objects:v81 count:16];
        }
        while (v32);
      }

      v36 = +[CSOnDeviceCompilationUtils sortCachedIrsByLastAccessTimeStamp:v29];
      v37 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v75 = "+[CSFOnDeviceCachedIrPurgingUtils purgeCachedIrExceptActiveCachedIrs:cachedIrDir:]";
        __int16 v76 = 2112;
        uint64_t v77 = (uint64_t)v36;
        _os_log_impl(&dword_1BA1A5000, v37, OS_LOG_TYPE_DEFAULT, "%s All cached Irs sorted by modification timestamps: %@", buf, 0x16u);
      }
      id v13 = v51;
      if ((unint64_t)[v36 count] > 1)
      {
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        v49 = v36;
        obuint64_t j = v36;
        uint64_t v40 = [obj countByEnumeratingWithState:&v57 objects:v80 count:16];
        if (v40)
        {
          uint64_t v41 = 0;
          id v10 = 0;
          uint64_t v54 = *(void *)v58;
LABEL_44:
          uint64_t v42 = 0;
          uint64_t v43 = ~v41;
          uint64_t v48 = v41 + v40;
          v44 = v10;
          uint64_t v53 = v40;
          while (1)
          {
            if (*(void *)v58 != v54) {
              objc_enumerationMutation(obj);
            }
            uint64_t v45 = *(void *)(*((void *)&v57 + 1) + 8 * v42);
            v46 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v56 = v44;
            [v46 removeItemAtPath:v45 error:&v56];
            id v10 = v56;

            v47 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v75 = "+[CSFOnDeviceCachedIrPurgingUtils purgeCachedIrExceptActiveCachedIrs:cachedIrDir:]";
              __int16 v76 = 2112;
              uint64_t v77 = v45;
              __int16 v78 = 2112;
              id v79 = v10;
              _os_log_impl(&dword_1BA1A5000, v47, OS_LOG_TYPE_DEFAULT, "%s removing cachedIr: %@ with error: %@", buf, 0x20u);
            }
            if ((unint64_t)([obj count] + v43) < 2) {
              break;
            }
            ++v42;
            --v43;
            v44 = v10;
            if (v53 == v42)
            {
              uint64_t v40 = [obj countByEnumeratingWithState:&v57 objects:v80 count:16];
              uint64_t v41 = v48;
              if (v40) {
                goto LABEL_44;
              }
              break;
            }
          }
        }
        else
        {
          id v10 = 0;
        }

        id v13 = v51;
        id v5 = v52;
        v36 = v49;
      }
      else
      {
        v38 = CSLogContextFacilityCoreSpeech;
        id v5 = v52;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v75 = "+[CSFOnDeviceCachedIrPurgingUtils purgeCachedIrExceptActiveCachedIrs:cachedIrDir:]";
          __int16 v76 = 2048;
          uint64_t v77 = 1;
          _os_log_impl(&dword_1BA1A5000, v38, OS_LOG_TYPE_DEFAULT, "%s No need to purge as all cached Irs count less than %lu", buf, 0x16u);
        }
        id v10 = 0;
      }

      uint64_t v9 = v50;
    }
    else
    {
      v39 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v75 = "+[CSFOnDeviceCachedIrPurgingUtils purgeCachedIrExceptActiveCachedIrs:cachedIrDir:]";
        __int16 v76 = 2112;
        uint64_t v77 = (uint64_t)v6;
        _os_log_impl(&dword_1BA1A5000, v39, OS_LOG_TYPE_DEFAULT, "%s No Cached Irs found in directory: %@", buf, 0x16u);
      }
      id v10 = 0;
    }
  }
}

@end