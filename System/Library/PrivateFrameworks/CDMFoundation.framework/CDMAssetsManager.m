@interface CDMAssetsManager
+ (id)getFactorNamesForService:(id)a3;
+ (id)getFactorToUnprocessedNLAsset:(id)a3 cdmAssetsInfo:(id)a4 locale:(id)a5;
+ (id)getSingletonCDMAssetsManager;
- (BOOL)areAssetsAvailableForCDMAssetsInfo:(id)a3 factorToAsset:(id)a4 withError:(id *)a5;
- (BOOL)areAssetsAvailableForCDMAssetsInfo:(id)a3 factorToAsset:(id)a4 withError:(id *)a5 withSelfMetadata:(id)a6 withSelfContextId:(id)a7 withDataDispatcherContext:(id)a8;
- (BOOL)isAssetAvailableForCDMAssetsFactorConfig:(id)a3 factorToAsset:(id)a4 withError:(id *)a5;
- (BOOL)registerForCDMAssetsInfo:(id)a3 withLocale:(id)a4 withAssetsDelegate:(id)a5 selfContextId:(id)a6 selfMetadata:(id)a7 dataDispatcherContext:(id)a8 withAssetAvailabilityType:(int64_t)a9 withError:(id *)a10;
- (BOOL)shouldReSetupForLocale:(id)a3 cdmAssetsInfo:(id)a4;
- (id)getAssetsByFactorNamesForCDMAssetsInfo:(id)a3 assetDirPath:(id)a4 locale:(id)a5;
- (id)getCDMDefaultAssetsManager;
- (id)getCDMUAFAssetsManager;
- (id)getNSFileManager;
- (id)initManager;
- (id)processNLAsset:(id)a3 withAssetFolders:(id)a4;
- (id)processSideLoadedAssetForNLAsset:(id)a3 withAssetFolders:(id)a4 assetDirPath:(id)a5 locale:(id)a6;
- (void)_setupUafAssetManagerForLocale:(id)a3 cdmAssetsInfo:(id)a4 error:(id *)a5;
- (void)setupForLocale:(id)a3 cdmAssetsInfo:(id)a4 error:(id *)a5;
@end

@implementation CDMAssetsManager

- (id)processNLAsset:(id)a3 withAssetFolders:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_16;
  }
  v8 = [v6 getAssetPath];

  if (v8)
  {
    v9 = [v6 getAssetPath];
    v10 = +[CDMAssetsUtils findExistFolderInAssetFolders:v7 underBasePath:v9 useFileManager:self->_fileManager];

    if (v10)
    {
      [v6 appendPathWithServiceAssetFolder:v10];
LABEL_5:

      goto LABEL_6;
    }
    v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = [v6 getAssetPath];
      int v18 = 136315650;
      v19 = "-[CDMAssetsManager processNLAsset:withAssetFolders:]";
      __int16 v20 = 2112;
      id v21 = 0;
      __int16 v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_2263A0000, v13, OS_LOG_TYPE_INFO, "%s [WARN]: No valid asset folders exist for asset folder: %@ under asset path: %@.", (uint8_t *)&v18, 0x20u);
    }
    if (!v7 || ![v7 count]) {
      goto LABEL_5;
    }
    v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315138;
      v19 = "-[CDMAssetsManager processNLAsset:withAssetFolders:]";
      _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s [WARN]: Asset folders were provided but not found.Return Nil asset", (uint8_t *)&v18, 0xCu);
    }

LABEL_16:
    v12 = objc_alloc_init(NilAsset);
    goto LABEL_17;
  }
LABEL_6:
  v11 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 136315394;
    v19 = "-[CDMAssetsManager processNLAsset:withAssetFolders:]";
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s NL asset: %@ ", (uint8_t *)&v18, 0x16u);
  }

  v12 = (NilAsset *)v6;
LABEL_17:
  v16 = v12;

  return v16;
}

- (BOOL)isAssetAvailableForCDMAssetsFactorConfig:(id)a3 factorToAsset:(id)a4 withError:(id *)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 getFactorToFoldersMapping];
  v9 = [v8 allKeys];

  v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "-[CDMAssetsManager isAssetAvailableForCDMAssetsFactorConfig:factorToAsset:withError:]";
    __int16 v42 = 2112;
    id v43 = v9;
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s Factors are: %@", buf, 0x16u);
  }

  v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v35;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v34 + 1) + 8 * v16);
        if (([v6 isFactorRequired:v17] & 1) == 0)
        {
          __int16 v20 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v41 = "-[CDMAssetsManager isAssetAvailableForCDMAssetsFactorConfig:factorToAsset:withError:]";
            __int16 v42 = 2112;
            id v43 = v17;
            _os_log_debug_impl(&dword_2263A0000, v20, OS_LOG_TYPE_DEBUG, "%s Skip current factor as it is not required: %@.", buf, 0x16u);
          }
          goto LABEL_14;
        }
        int v18 = [v7 objectForKey:v17];
        uint64_t v19 = [v18 getAssetType];

        if (v19)
        {
          __int16 v20 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            id v21 = [v7 objectForKey:v17];
            *(_DWORD *)buf = 136315650;
            v41 = "-[CDMAssetsManager isAssetAvailableForCDMAssetsFactorConfig:factorToAsset:withError:]";
            __int16 v42 = 2112;
            id v43 = v21;
            __int16 v44 = 2112;
            v45 = v17;
            _os_log_debug_impl(&dword_2263A0000, v20, OS_LOG_TYPE_DEBUG, "%s Asset: %@ is available for factor: %@.", buf, 0x20u);
          }
LABEL_14:

          goto LABEL_15;
        }
        [v11 addObject:v17];
LABEL_15:
        ++v16;
      }
      while (v14 != v16);
      uint64_t v22 = [v12 countByEnumeratingWithState:&v34 objects:v46 count:16];
      uint64_t v14 = v22;
    }
    while (v22);
  }

  uint64_t v23 = [v11 count];
  if (v23)
  {
    uint64_t v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v25 = *MEMORY[0x263F08338];
    v38[0] = *MEMORY[0x263F08320];
    v38[1] = v25;
    v39[0] = @"Assets are missing";
    v26 = NSString;
    v27 = [v11 componentsJoinedByString:@","];
    v28 = [v26 stringWithFormat:@"Assets are missing for factors: [%@].", v27];
    v39[1] = v28;
    v29 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
    *a5 = [v24 errorWithDomain:@"CDMAssetsManager" code:0 userInfo:v29];

    v30 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = *a5;
      *(_DWORD *)buf = 136315394;
      v41 = "-[CDMAssetsManager isAssetAvailableForCDMAssetsFactorConfig:factorToAsset:withError:]";
      __int16 v42 = 2112;
      id v43 = v31;
      _os_log_error_impl(&dword_2263A0000, v30, OS_LOG_TYPE_ERROR, "%s [ERR]: Not all assets are available with error: %@. Return NO.", buf, 0x16u);
    }
  }
  else
  {
    v30 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v41 = "-[CDMAssetsManager isAssetAvailableForCDMAssetsFactorConfig:factorToAsset:withError:]";
      _os_log_debug_impl(&dword_2263A0000, v30, OS_LOG_TYPE_DEBUG, "%s All assets are available. Return YES.", buf, 0xCu);
    }
  }

  return v23 == 0;
}

- (BOOL)areAssetsAvailableForCDMAssetsInfo:(id)a3 factorToAsset:(id)a4 withError:(id *)a5 withSelfMetadata:(id)a6 withSelfContextId:(id)a7 withDataDispatcherContext:(id)a8
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v53 = a4;
  id v51 = a6;
  id v50 = a7;
  id v49 = a8;
  id v14 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v15 = [v13 getAllAssetSets];
  v52 = objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v16 = v13;
  v17 = [v13 getAllAssetSets];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v59 objects:v70 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v60 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        uint64_t v23 = objc_msgSend(v16, "getCDMAssetsFactorConfigCDMAssetSet:", objc_msgSend(v22, "integerValue"));
        id v58 = 0;
        BOOL v24 = [(CDMAssetsManager *)self isAssetAvailableForCDMAssetsFactorConfig:v23 factorToAsset:v53 withError:&v58];
        id v25 = v58;

        if (!v24) {
          [v52 setObject:v25 forKey:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v59 objects:v70 count:16];
    }
    while (v19);
  }

  v26 = v52;
  uint64_t v27 = [v52 count];
  if (v27)
  {
    v28 = [v52 allKeys];
    v29 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v47 = [v28 componentsJoinedByString:@","];
      *(_DWORD *)buf = 136315394;
      v67 = "-[CDMAssetsManager areAssetsAvailableForCDMAssetsInfo:factorToAsset:withError:withSelfMetadata:withSelfConte"
            "xtId:withDataDispatcherContext:]";
      __int16 v68 = 2112;
      v69 = v47;
      _os_log_error_impl(&dword_2263A0000, v29, OS_LOG_TYPE_ERROR, "%s [ERR]: Assets for assetSets: [%@] are not available. Return NO.", buf, 0x16u);
    }
    id v30 = objc_alloc_init(MEMORY[0x263F089D8]);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v31 = [v52 allValues];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v54 objects:v65 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v55 != v34) {
            objc_enumerationMutation(v31);
          }
          long long v36 = [*(id *)(*((void *)&v54 + 1) + 8 * j) localizedFailureReason];
          [v30 appendString:v36];

          [v30 appendString:@"\n"];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v54 objects:v65 count:16];
      }
      while (v33);
    }

    long long v37 = (void *)MEMORY[0x263F087E8];
    v63[0] = *MEMORY[0x263F08320];
    v38 = NSString;
    v39 = [v28 componentsJoinedByString:@","];
    v40 = [v38 stringWithFormat:@"Assets are missing for services: [%@].", v39];
    v63[1] = *MEMORY[0x263F08338];
    v64[0] = v40;
    v64[1] = v30;
    v41 = [NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];
    *a5 = [v37 errorWithDomain:@"CDMAssetsManager" code:0 userInfo:v41];

    id v43 = v50;
    __int16 v42 = v51;
    __int16 v44 = v49;
    +[CDMSELFLogUtil cdmSetupMissingAssetsDetected:v51 contextId:v50 serviceNames:0 logMessage:@"SELF setup missing assets detected message emitted" dataDispatcherContext:v49];
    v45 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v67 = "-[CDMAssetsManager areAssetsAvailableForCDMAssetsInfo:factorToAsset:withError:withSelfMetadata:withSelfConte"
            "xtId:withDataDispatcherContext:]";
      _os_log_error_impl(&dword_2263A0000, v45, OS_LOG_TYPE_ERROR, "%s [ERR]: Self heal the cache because not all assets found in assetSet", buf, 0xCu);
    }

    +[CDMUAFAssetsManager reInitCDMUAFAssetsCache];
    v26 = v52;
  }
  else
  {
    v28 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v67 = "-[CDMAssetsManager areAssetsAvailableForCDMAssetsInfo:factorToAsset:withError:withSelfMetadata:withSelfConte"
            "xtId:withDataDispatcherContext:]";
      _os_log_debug_impl(&dword_2263A0000, v28, OS_LOG_TYPE_DEBUG, "%s All required assets are available. Return YES.", buf, 0xCu);
    }
    id v43 = v50;
    __int16 v42 = v51;
    __int16 v44 = v49;
  }

  return v27 == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_cdmUAFAssetsManager, 0);
  objc_storeStrong((id *)&self->_cdmDefaultAssetsManager, 0);
}

- (BOOL)registerForCDMAssetsInfo:(id)a3 withLocale:(id)a4 withAssetsDelegate:(id)a5 selfContextId:(id)a6 selfMetadata:(id)a7 dataDispatcherContext:(id)a8 withAssetAvailabilityType:(int64_t)a9 withError:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  uint64_t v22 = +[CDMUAFAssetsManager getNLUAFClientManagers];
  objc_sync_enter(v22);
  LOBYTE(self) = [(CDMUAFAssetsManager *)self->_cdmUAFAssetsManager registerForCDMAssetsInfo:v16 withLocale:v17 withAssetsDelegate:v18 useFileManager:self->_fileManager withSelfContextId:v19 withSelfMetadata:v20 withDataDispatcherContext:v21 withAssetAvailabilityType:a9 withError:a10];
  objc_sync_exit(v22);

  return (char)self;
}

- (BOOL)areAssetsAvailableForCDMAssetsInfo:(id)a3 factorToAsset:(id)a4 withError:(id *)a5
{
  return [(CDMAssetsManager *)self areAssetsAvailableForCDMAssetsInfo:a3 factorToAsset:a4 withError:a5 withSelfMetadata:0 withSelfContextId:0 withDataDispatcherContext:0];
}

- (id)getAssetsByFactorNamesForCDMAssetsInfo:(id)a3 assetDirPath:(id)a4 locale:(id)a5
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v40 = a5;
  id v42 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v9 = [v7 getAllAssetSets];
  BOOL v10 = +[CDMPlatformUtils isInternalInstall];
  v39 = v8;
  long long v48 = 0u;
  long long v49 = 0u;
  if (v8) {
    int v11 = 1;
  }
  else {
    int v11 = v10;
  }
  int v41 = v11;
  long long v50 = 0uLL;
  long long v51 = 0uLL;
  id v12 = v9;
  uint64_t v36 = [v12 countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v49;
    id v33 = v12;
    id v34 = v7;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v49 != v35) {
          objc_enumerationMutation(v12);
        }
        id v14 = objc_msgSend(v7, "getCDMAssetsFactorConfigCDMAssetSet:", objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * i), "integerValue", v33, v34));
        if (v14)
        {
          long long v37 = v14;
          uint64_t v38 = i;
          uint64_t v15 = [v14 getFactorToFoldersMapping];
          id v16 = [v40 localeIdentifier];
          id v17 = +[CDMAssetsManager getFactorToUnprocessedNLAsset:v15 cdmAssetsInfo:v7 locale:v16];

          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          id v18 = v15;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v58 count:16];
          if (!v19) {
            goto LABEL_24;
          }
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v45;
          while (1)
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v45 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = *(void *)(*((void *)&v44 + 1) + 8 * j);
              BOOL v24 = objc_alloc_init(NilAsset);
              id v25 = [v18 objectForKey:v23];
              v26 = [v17 objectForKey:v23];
              uint64_t v27 = [(CDMAssetsManager *)self processNLAsset:v26 withAssetFolders:v25];

              if (v25 && [v25 count])
              {
                if (!v41) {
                  goto LABEL_22;
                }
                [(CDMAssetsManager *)self processSideLoadedAssetForNLAsset:v27 withAssetFolders:v25 assetDirPath:v39 locale:v40];
                uint64_t v27 = v28 = v27;
              }
              else
              {
                v28 = CDMOSLoggerForCategory(0);
                if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315138;
                  id v53 = "-[CDMAssetsManager getAssetsByFactorNamesForCDMAssetsInfo:assetDirPath:locale:]";
                  _os_log_impl(&dword_2263A0000, v28, OS_LOG_TYPE_INFO, "%s [WARN]: Asset folder names are nil/empty", buf, 0xCu);
                }
              }

LABEL_22:
              [v42 setObject:v27 forKey:v23];
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v44 objects:v58 count:16];
            if (!v20)
            {
LABEL_24:

              id v12 = v33;
              id v7 = v34;
              id v14 = v37;
              uint64_t i = v38;
              break;
            }
          }
        }
      }
      uint64_t v36 = [v12 countByEnumeratingWithState:&v48 objects:v59 count:16];
    }
    while (v36);
  }

  v29 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    id v31 = [v7 getGraphName];
    uint64_t v32 = [v42 descriptionInStringsFileFormat];
    *(_DWORD *)buf = 136315650;
    id v53 = "-[CDMAssetsManager getAssetsByFactorNamesForCDMAssetsInfo:assetDirPath:locale:]";
    __int16 v54 = 2112;
    long long v55 = v31;
    __int16 v56 = 2112;
    long long v57 = v32;
    _os_log_debug_impl(&dword_2263A0000, v29, OS_LOG_TYPE_DEBUG, "%s Assets paths for %@: %@", buf, 0x20u);
  }
  return v42;
}

- (id)processSideLoadedAssetForNLAsset:(id)a3 withAssetFolders:(id)a4 assetDirPath:(id)a5 locale:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a3;
  int v11 = [(CDMDefaultAssetsManager *)self->_cdmDefaultAssetsManager getAbsolutePathForServiceAssetFolders:a4 assetDirPath:a5 locale:a6];
  id v12 = v11;
  id v13 = v10;
  if (v11)
  {
    id v14 = [v11 getAssetPath];

    id v13 = v10;
    if (v14)
    {
      uint64_t v15 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v18 = 136315650;
        uint64_t v19 = "-[CDMAssetsManager processSideLoadedAssetForNLAsset:withAssetFolders:assetDirPath:locale:]";
        __int16 v20 = 2112;
        uint64_t v21 = v12;
        __int16 v22 = 2112;
        id v23 = v10;
        _os_log_debug_impl(&dword_2263A0000, v15, OS_LOG_TYPE_DEBUG, "%s Found valid custom asset: [%@] for NLAsset: %@. Return custom asset.", (uint8_t *)&v18, 0x20u);
      }

      id v13 = v12;
    }
  }
  id v16 = v13;

  return v16;
}

- (void)_setupUafAssetManagerForLocale:(id)a3 cdmAssetsInfo:(id)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  cdmUAFAssetsManager = self->_cdmUAFAssetsManager;
  id v14 = 0;
  [(CDMUAFAssetsManager *)cdmUAFAssetsManager setupForLocale:v8 cdmAssetsInfo:a4 error:&v14];
  id v10 = v14;
  int v11 = CDMOSLoggerForCategory(0);
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v13 = [v8 localeIdentifier];
      *(_DWORD *)buf = 136315394;
      id v16 = "-[CDMAssetsManager _setupUafAssetManagerForLocale:cdmAssetsInfo:error:]";
      __int16 v17 = 2112;
      int v18 = v13;
      _os_log_error_impl(&dword_2263A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: Error occurred while setting up CDMUAFAssetsManager with locale: %@.", buf, 0x16u);
    }
    *a5 = v10;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[CDMAssetsManager _setupUafAssetManagerForLocale:cdmAssetsInfo:error:]";
      _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s CDMUAFAssetsManager setup successfully.", buf, 0xCu);
    }
  }
}

- (BOOL)shouldReSetupForLocale:(id)a3 cdmAssetsInfo:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v27 = a3;
  id v26 = a4;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v34 = "-[CDMAssetsManager shouldReSetupForLocale:cdmAssetsInfo:]";
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Checking if asset manager needs to be resetup.", buf, 0xCu);
  }

  obuint64_t j = +[CDMUAFAssetsManager getNLUAFClientManagers];
  objc_sync_enter(obj);
  id v6 = +[CDMUAFAssetsManager getNLUAFClientManagers];
  id v7 = [v26 getGraphName];
  id v25 = [v6 objectForKey:v7];
  id v23 = v6;

  id v32 = 0;
  id v8 = +[CDMUAFAssetsManager getAssetSetNameToUafClientManager:v25 withError:&v32];
  id v22 = v32;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v9 = [v26 getAllAssetSets];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v29;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v29 != v11) {
        objc_enumerationMutation(v9);
      }
      id v13 = +[CDMAssetsUtils cdmAssetSetToStr:](CDMAssetsUtils, "cdmAssetSetToStr:", [*(id *)(*((void *)&v28 + 1) + 8 * v12) integerValue]);
      id v14 = [v8 objectForKey:v13];
      uint64_t v15 = v14;
      if (!v14) {
        break;
      }
      id v16 = [v14 getLocale];
      char v17 = [v16 isEqualToString:v27];

      if ((v17 & 1) == 0)
      {
        uint64_t v19 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v21 = [v15 getLocale];
          *(_DWORD *)buf = 136315906;
          id v34 = "-[CDMAssetsManager shouldReSetupForLocale:cdmAssetsInfo:]";
          __int16 v35 = 2112;
          uint64_t v36 = v21;
          __int16 v37 = 2112;
          id v38 = v27;
          __int16 v39 = 2112;
          id v40 = v13;
          _os_log_debug_impl(&dword_2263A0000, v19, OS_LOG_TYPE_DEBUG, "%s UAFClientManager's existing locale is :%@ but the new locale is: %@ for asset set: %@. Return Yes", buf, 0x2Au);
        }
LABEL_20:

        BOOL v18 = 1;
        goto LABEL_21;
      }

      if (v10 == ++v12)
      {
        uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v41 count:16];
        if (v10) {
          goto LABEL_5;
        }
        goto LABEL_12;
      }
    }
    uint64_t v19 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      id v34 = "-[CDMAssetsManager shouldReSetupForLocale:cdmAssetsInfo:]";
      __int16 v35 = 2112;
      uint64_t v36 = v13;
      _os_log_debug_impl(&dword_2263A0000, v19, OS_LOG_TYPE_DEBUG, "%s UAFClientManager not found for asset set: %@. Return Yes", buf, 0x16u);
    }
    uint64_t v15 = 0;
    goto LABEL_20;
  }
LABEL_12:

  v9 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v34 = "-[CDMAssetsManager shouldReSetupForLocale:cdmAssetsInfo:]";
    __int16 v35 = 2112;
    uint64_t v36 = v25;
    _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s Found UAFClientManagers: %@. No need to resetup", buf, 0x16u);
  }
  BOOL v18 = 0;
LABEL_21:

  objc_sync_exit(obj);
  return v18;
}

- (void)setupForLocale:(id)a3 cdmAssetsInfo:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v22 = [v8 localeIdentifier];
    id v23 = [v9 getGraphName];
    int v24 = 136315650;
    id v25 = "-[CDMAssetsManager setupForLocale:cdmAssetsInfo:error:]";
    __int16 v26 = 2112;
    id v27 = v22;
    __int16 v28 = 2112;
    long long v29 = v23;
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s Setup CDMAssetsManager for locale: %@ and graph: %@", (uint8_t *)&v24, 0x20u);
  }
  os_signpost_id_t v11 = os_signpost_id_generate((os_log_t)CDMLogContext);
  uint64_t v12 = (id)CDMLogContext;
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v24) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CDMAssetsManager", "CDMAssetsManager setup", (uint8_t *)&v24, 2u);
  }

  id v14 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 136315138;
    id v25 = "-[CDMAssetsManager setupForLocale:cdmAssetsInfo:error:]";
    _os_log_debug_impl(&dword_2263A0000, v14, OS_LOG_TYPE_DEBUG, "%s Starting setup of CDMUAFAssetsManager.", (uint8_t *)&v24, 0xCu);
  }

  os_signpost_id_t v15 = os_signpost_id_generate((os_log_t)CDMLogContext);
  id v16 = (id)CDMLogContext;
  char v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v24) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "CDMAssetsManager", "UAFAssetsManager setup", (uint8_t *)&v24, 2u);
  }

  [(CDMAssetsManager *)self _setupUafAssetManagerForLocale:v8 cdmAssetsInfo:v9 error:a5];
  BOOL v18 = (id)CDMLogContext;
  uint64_t v19 = v18;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(v24) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v19, OS_SIGNPOST_INTERVAL_END, v15, "CDMAssetsManager", " enableTelemetry=YES ", (uint8_t *)&v24, 2u);
  }

  __int16 v20 = (id)CDMLogContext;
  uint64_t v21 = v20;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    LOWORD(v24) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v21, OS_SIGNPOST_INTERVAL_END, v11, "CDMAssetsManager", " enableTelemetry=YES ", (uint8_t *)&v24, 2u);
  }
}

- (id)getNSFileManager
{
  return self->_fileManager;
}

- (id)getCDMUAFAssetsManager
{
  return self->_cdmUAFAssetsManager;
}

- (id)getCDMDefaultAssetsManager
{
  return self->_cdmDefaultAssetsManager;
}

- (id)initManager
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)CDMAssetsManager;
  v2 = [(CDMAssetsManager *)&v11 init];
  if (v2)
  {
    v3 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "-[CDMAssetsManager initManager]";
      _os_log_impl(&dword_2263A0000, v3, OS_LOG_TYPE_INFO, "%s Initialize CDMAssetsManager", buf, 0xCu);
    }

    v4 = [[CDMDefaultAssetsManager alloc] initManager];
    cdmDefaultAssetsManager = v2->_cdmDefaultAssetsManager;
    v2->_cdmDefaultAssetsManager = v4;

    id v6 = [[CDMUAFAssetsManager alloc] initManager];
    cdmUAFAssetsManager = v2->_cdmUAFAssetsManager;
    v2->_cdmUAFAssetsManager = v6;

    id v8 = (NSFileManager *)objc_alloc_init(MEMORY[0x263F08850]);
    fileManager = v2->_fileManager;
    v2->_fileManager = v8;
  }
  return v2;
}

+ (id)getFactorToUnprocessedNLAsset:(id)a3 cdmAssetsInfo:(id)a4 locale:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 136315138;
    id v16 = "+[CDMAssetsManager getFactorToUnprocessedNLAsset:cdmAssetsInfo:locale:]";
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s Using UAF to get unprocessed NLAssets.", (uint8_t *)&v15, 0xCu);
  }

  objc_super v11 = [v9 allKeys];

  uint64_t v12 = +[CDMUAFAssetsManager getUAFAssetsForFactors:v11 withCDMAssetsInfo:v8 locale:v7];

  id v13 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 136315394;
    id v16 = "+[CDMAssetsManager getFactorToUnprocessedNLAsset:cdmAssetsInfo:locale:]";
    __int16 v17 = 2112;
    BOOL v18 = v12;
    _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s factorToUnprocessedNLAsset: %@.", (uint8_t *)&v15, 0x16u);
  }

  return v12;
}

+ (id)getFactorNamesForService:(id)a3
{
  v3 = [NSClassFromString((NSString *)a3) getCDMServiceAssetConfig];
  v4 = [v3 getCDMAssetSetToFactorsConfig];

  v5 = [v4 getAllFactors];

  return v5;
}

+ (id)getSingletonCDMAssetsManager
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "+[CDMAssetsManager getSingletonCDMAssetsManager]";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Fetching CDMAssetsManager", (uint8_t *)&v5, 0xCu);
  }

  if (getSingletonCDMAssetsManager_once != -1) {
    dispatch_once(&getSingletonCDMAssetsManager_once, &__block_literal_global_623);
  }
  v3 = (void *)getSingletonCDMAssetsManager_singletonCdmAssetsManager;
  return v3;
}

void __48__CDMAssetsManager_getSingletonCDMAssetsManager__block_invoke()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v0 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315138;
    v4 = "+[CDMAssetsManager getSingletonCDMAssetsManager]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v0, OS_LOG_TYPE_DEBUG, "%s Singleton CDMAssetsManager has not been initialized yet. Initializing...", (uint8_t *)&v3, 0xCu);
  }

  id v1 = [[CDMAssetsManager alloc] initManager];
  v2 = (void *)getSingletonCDMAssetsManager_singletonCdmAssetsManager;
  getSingletonCDMAssetsManager_singletonCdmAssetsManager = (uint64_t)v1;
}

@end