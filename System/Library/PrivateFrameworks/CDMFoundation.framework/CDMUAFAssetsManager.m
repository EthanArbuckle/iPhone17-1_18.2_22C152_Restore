@interface CDMUAFAssetsManager
+ (BOOL)validateFactors:(id)a3 inAssetSet:(id)a4 forLocale:(id)a5 withAssetSetName:(id)a6;
+ (id)filterFactors:(id)a3 forAssetSetNameToFactors:(id)a4;
+ (id)getAssetSetNameToFactors:(id)a3 withError:(id *)a4;
+ (id)getAssetSetNameToUafClientManager:(id)a3 withError:(id *)a4;
+ (id)getFactorToAssetSetName:(id)a3 uafClientManagers:(id)a4 withError:(id *)a5;
+ (id)getFactorsForClientManager:(id)a3;
+ (id)getNLAssetFromUAFAsset:(id)a3 withFactor:(id)a4 withAssetSetName:(id)a5 withAssetSet:(id)a6;
+ (id)getNLAssetFromUAFAssetPostValidation:(id)a3 asset:(id)a4 locale:(id)a5 assetSetName:(id)a6 assetSet:(id)a7;
+ (id)getNLUAFClientManagers;
+ (id)getUAFAssetsForFactors:(id)a3 withCDMAssetsInfo:(id)a4 locale:(id)a5;
+ (id)getUAFClientManagersForLocale:(id)a3 withCDMAssetsInfo:(id)a4;
+ (void)initUAFClientManagers:(id)a3 locale:(id)a4 error:(id *)a5;
+ (void)reInitCDMUAFAssetsCache;
+ (void)setAssetsAvailabilityForFactors:(id)a3 withAssetSet:(id)a4 forAssetSetName:(id)a5 withDelegateHandler:(id)a6 withLocale:(id)a7 withFactorAndFolders:(id)a8 useFileManager:(id)a9 withAssetAvailabilityType:(int64_t)a10;
+ (void)subscribeToAssetsForAssetSet:(int64_t)a3 withCDMAssetsUsages:(id)a4;
+ (void)subscribeToSsuAssetsForLocale:(id)a3;
- (BOOL)registerForCDMAssetsInfo:(id)a3 withLocale:(id)a4 withAssetsDelegate:(id)a5 useFileManager:(id)a6 withSelfContextId:(id)a7 withSelfMetadata:(id)a8 withDataDispatcherContext:(id)a9 withAssetAvailabilityType:(int64_t)a10 withError:(id *)a11;
- (id)initManager;
- (void)registerForFactors:(id)a3 inAssetSetName:(id)a4 withAssetsDelegate:(id)a5 withLocale:(id)a6 withFactorAndFolders:(id)a7 useFileManager:(id)a8 withAssetAvailabilityType:(int64_t)a9;
- (void)setupForLocale:(id)a3 cdmAssetsInfo:(id)a4 error:(id *)a5;
@end

@implementation CDMUAFAssetsManager

+ (id)getUAFClientManagersForLocale:(id)a3 withCDMAssetsInfo:(id)a4
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = v5;
  id v8 = v6;
  v9 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = [v8 getGraphName];
    *(_DWORD *)buf = 136315650;
    v63 = "+[CDMUAFAssetsManager getUAFClientManagersForLocale:withCDMAssetsInfo:]";
    __int16 v64 = 2112;
    id v65 = v5;
    __int16 v66 = 2112;
    id v67 = v10;
    _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s Initializing UAFClientManagers with locale: %@ and graph name: %@", buf, 0x20u);
  }
  v11 = [v8 getGraphName];

  if (v11)
  {
    v12 = +[CDMUAFAssetsManager getNLUAFClientManagers];
    v13 = [v8 getGraphName];
    v14 = [v12 objectForKey:v13];

    v49 = v12;
    if (!v14)
    {
      v50 = v7;
      v15 = [v8 getAllAssetSets];
      uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v15, "count"));
      v17 = (void *)getUAFClientManagersForLocale_withCDMAssetsInfo__uafClientManagers;
      getUAFClientManagersForLocale_withCDMAssetsInfo__uafClientManagers = v16;

      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      obuint64_t j = v15;
      uint64_t v18 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v57;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v57 != v20) {
              objc_enumerationMutation(obj);
            }
            v22 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            v23 = +[CDMAssetsUtils cdmAssetSetToStr:](CDMAssetsUtils, "cdmAssetSetToStr:", [v22 integerValue]);
            v24 = objc_msgSend(v8, "getCDMAssetsUsagesForCDMAssetSet:", objc_msgSend(v22, "integerValue"));
            id v25 = v8;
            uint64_t v26 = getUAFClientManagersForLocale_withCDMAssetsInfo__uafClientManagers;
            v27 = [CDMUAFClientManager alloc];
            v28 = [v24 getUsages];
            v29 = [(CDMUAFClientManager *)v27 initWithAssetSet:v23 usages:v28];
            v30 = (void *)v26;
            id v8 = v25;
            [v30 addObject:v29];
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
        }
        while (v19);
      }

      uint64_t v31 = getUAFClientManagersForLocale_withCDMAssetsInfo__uafClientManagers;
      v32 = [v8 getGraphName];
      v12 = v49;
      [v49 setObject:v31 forKey:v32];

      v7 = v50;
    }
    v33 = [v8 getGraphName];
    v34 = [v12 objectForKey:v33];

    if (v34)
    {
      v48 = v34;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v35 = v34;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v52 objects:v60 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v53;
        do
        {
          for (uint64_t j = 0; j != v37; ++j)
          {
            if (*(void *)v53 != v38) {
              objc_enumerationMutation(v35);
            }
            v40 = *(void **)(*((void *)&v52 + 1) + 8 * j);
            v41 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              v63 = "+[CDMUAFAssetsManager getUAFClientManagersForLocale:withCDMAssetsInfo:]";
              __int16 v64 = 2112;
              id v65 = v7;
              __int16 v66 = 2112;
              id v67 = v40;
              _os_log_debug_impl(&dword_2263A0000, v41, OS_LOG_TYPE_DEBUG, "%s Setting locale to %@ for CDMUAFClientManager: %@", buf, 0x20u);
            }

            [v40 setLocale:v7];
            v42 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v63 = "+[CDMUAFAssetsManager getUAFClientManagersForLocale:withCDMAssetsInfo:]";
              __int16 v64 = 2112;
              id v65 = v40;
              _os_log_debug_impl(&dword_2263A0000, v42, OS_LOG_TYPE_DEBUG, "%s Finished changing usage for CDMUAFClientManager: %@", buf, 0x16u);
            }
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v52 objects:v60 count:16];
        }
        while (v37);
      }

      v43 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v63 = "+[CDMUAFAssetsManager getUAFClientManagersForLocale:withCDMAssetsInfo:]";
        __int16 v64 = 2112;
        id v65 = v7;
        __int16 v66 = 2112;
        id v67 = v35;
        _os_log_debug_impl(&dword_2263A0000, v43, OS_LOG_TYPE_DEBUG, "%s UAFClientManagers generated for locale: %@ :%@", buf, 0x20u);
      }

      id v44 = v35;
      v12 = v49;
      v34 = v48;
    }
    else
    {
      v45 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v47 = [v8 getGraphName];
        *(_DWORD *)buf = 136315650;
        v63 = "+[CDMUAFAssetsManager getUAFClientManagersForLocale:withCDMAssetsInfo:]";
        __int16 v64 = 2112;
        id v65 = v7;
        __int16 v66 = 2112;
        id v67 = v47;
        _os_log_error_impl(&dword_2263A0000, v45, OS_LOG_TYPE_ERROR, "%s [ERR]: No UAFClientManagers generated for locale: %@! & graph: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v63 = "+[CDMUAFAssetsManager getUAFClientManagersForLocale:withCDMAssetsInfo:]";
      _os_log_error_impl(&dword_2263A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: Graph name is nil", buf, 0xCu);
    }
    v34 = 0;
  }

  return v34;
}

+ (id)getNLUAFClientManagers
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    v7 = "+[CDMUAFAssetsManager getNLUAFClientManagers]";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Fetching NL UAFClientManager dictionary", (uint8_t *)&v6, 0xCu);
  }

  if (getNLUAFClientManagers_once != -1) {
    dispatch_once(&getNLUAFClientManagers_once, &__block_literal_global_8123);
  }
  v3 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    v7 = "+[CDMUAFAssetsManager getNLUAFClientManagers]";
    __int16 v8 = 2112;
    uint64_t v9 = getNLUAFClientManagers_nlUAFClientManagers;
    _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s All UAFClientManagers: %@", (uint8_t *)&v6, 0x16u);
  }

  v4 = (void *)getNLUAFClientManagers_nlUAFClientManagers;
  return v4;
}

+ (id)getFactorsForClientManager:(id)a3
{
  return (id)[a3 getFactors];
}

- (void).cxx_destruct
{
}

- (BOOL)registerForCDMAssetsInfo:(id)a3 withLocale:(id)a4 withAssetsDelegate:(id)a5 useFileManager:(id)a6 withSelfContextId:(id)a7 withSelfMetadata:(id)a8 withDataDispatcherContext:(id)a9 withAssetAvailabilityType:(int64_t)a10 withError:(id *)a11
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v66 = a4;
  id v58 = a5;
  id v64 = a6;
  id v57 = a7;
  id v56 = a8;
  id v55 = a9;
  id v17 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v18 = [v16 getAllAssetSets];
  uint64_t v19 = objc_msgSend(v17, "initWithCapacity:", objc_msgSend(v18, "count"));

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v65 = v16;
  uint64_t v20 = [v16 getAllAssetSets];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v76 objects:v94 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v77 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = +[CDMAssetsUtils cdmAssetSetToStr:](CDMAssetsUtils, "cdmAssetSetToStr:", [*(id *)(*((void *)&v76 + 1) + 8 * i) integerValue]);
        [v19 addObject:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v76 objects:v94 count:16];
    }
    while (v22);
  }

  if (v19 && [v19 count])
  {
    v62 = [[CDMAssetsDelegateHandler alloc] initWithAssetsDelegate:v58 forAssetSets:v19 withAssetAvailabilityType:a10];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    obuint64_t j = [v16 getAllAssetSets];
    uint64_t v61 = [obj countByEnumeratingWithState:&v72 objects:v93 count:16];
    if (v61)
    {
      uint64_t v60 = *(void *)v73;
      while (2)
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v73 != v60) {
            objc_enumerationMutation(obj);
          }
          uint64_t v67 = v26;
          v27 = *(void **)(*((void *)&v72 + 1) + 8 * v26);
          v28 = objc_msgSend(v65, "getCDMAssetsFactorConfigCDMAssetSet:", objc_msgSend(v27, "integerValue"));
          id v29 = objc_alloc(MEMORY[0x263EFF980]);
          v30 = [v28 getAllFactors];
          uint64_t v31 = objc_msgSend(v29, "initWithCapacity:", objc_msgSend(v30, "count"));

          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          v32 = [v28 getAllFactors];
          uint64_t v33 = [v32 countByEnumeratingWithState:&v68 objects:v92 count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = *(void *)v69;
            do
            {
              for (uint64_t j = 0; j != v34; ++j)
              {
                if (*(void *)v69 != v35) {
                  objc_enumerationMutation(v32);
                }
                uint64_t v37 = *(void **)(*((void *)&v68 + 1) + 8 * j);
                if ([v28 isFactorRequired:v37])
                {
                  [v31 addObject:v37];
                }
                else
                {
                  uint64_t v38 = CDMOSLoggerForCategory(0);
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 136315650;
                    v81 = "-[CDMUAFAssetsManager registerForCDMAssetsInfo:withLocale:withAssetsDelegate:useFileManager:wi"
                          "thSelfContextId:withSelfMetadata:withDataDispatcherContext:withAssetAvailabilityType:withError:]";
                    __int16 v82 = 2112;
                    v83 = v37;
                    __int16 v84 = 2112;
                    v85 = v27;
                    _os_log_debug_impl(&dword_2263A0000, v38, OS_LOG_TYPE_DEBUG, "%s Factor %@ is not required for assetSet: %@", buf, 0x20u);
                  }
                }
              }
              uint64_t v34 = [v32 countByEnumeratingWithState:&v68 objects:v92 count:16];
            }
            while (v34);
          }

          if (![v31 count])
          {
            v47 = (void *)MEMORY[0x263F087E8];
            v90[0] = *MEMORY[0x263F08320];
            v48 = [NSString stringWithFormat:@"Required Factor names is empty for assetSetName: %@ for locale: %@", v27, v66];
            v91[0] = v48;
            v90[1] = *MEMORY[0x263F08338];
            v49 = [NSString stringWithFormat:@"Required Factor names is empty for assetSetName: %@ for locale: %@", v27, v66];
            uint64_t v50 = *MEMORY[0x263F08348];
            v91[1] = v49;
            v91[2] = @"Required Factor names is empty";
            v90[2] = v50;
            v90[3] = @"CDMAssetSetupErrorDomain";
            v51 = [NSNumber numberWithInt:3];
            v91[3] = v51;
            long long v52 = [NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:4];
            *a11 = [v47 errorWithDomain:@"CDMUAFRegistrationErrorDomain" code:0 userInfo:v52];

            long long v53 = [NSString stringWithFormat:@"Required Factor names is empty for assetSetName: %@ for locale: %@", v27, v66];
            v45 = v56;
            id v44 = v57;
            v46 = v55;
            +[CDMSELFLogUtil cdmAssetSetupFailed:v56 contextId:v57 errorDomain:8 errorCode:0 logMessage:v53 dataDispatcherContext:v55];

            BOOL v43 = 0;
            goto LABEL_35;
          }
          v39 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            v42 = [v28 getFactorToFoldersMapping];
            *(_DWORD *)buf = 136316162;
            v81 = "-[CDMUAFAssetsManager registerForCDMAssetsInfo:withLocale:withAssetsDelegate:useFileManager:withSelfCo"
                  "ntextId:withSelfMetadata:withDataDispatcherContext:withAssetAvailabilityType:withError:]";
            __int16 v82 = 2112;
            v83 = v31;
            __int16 v84 = 2112;
            v85 = v27;
            __int16 v86 = 2112;
            id v87 = v66;
            __int16 v88 = 2112;
            v89 = v42;
            _os_log_debug_impl(&dword_2263A0000, v39, OS_LOG_TYPE_DEBUG, "%s Register required factors: %@ in assetSetName: %@ with assets delegate for %@ with factorAndFolders %@.", buf, 0x34u);
          }
          v40 = +[CDMAssetsUtils cdmAssetSetToStr:](CDMAssetsUtils, "cdmAssetSetToStr:", [v27 integerValue]);
          v41 = [v28 getFactorToFoldersMapping];
          [(CDMUAFAssetsManager *)self registerForFactors:v31 inAssetSetName:v40 withAssetsDelegate:v62 withLocale:v66 withFactorAndFolders:v41 useFileManager:v64 withAssetAvailabilityType:a10];

          uint64_t v26 = v67 + 1;
        }
        while (v67 + 1 != v61);
        uint64_t v61 = [obj countByEnumeratingWithState:&v72 objects:v93 count:16];
        if (v61) {
          continue;
        }
        break;
      }
    }
    BOOL v43 = 1;
    v45 = v56;
    id v44 = v57;
    v46 = v55;
LABEL_35:
  }
  else
  {
    v45 = v56;
    id v44 = v57;
    v46 = v55;
    +[CDMSELFLogUtil cdmAssetSetupFailed:v56 contextId:v57 errorDomain:8 errorCode:0 logMessage:@"cdmAssetSetStrings is empty." dataDispatcherContext:v55];
    BOOL v43 = 0;
  }

  return v43;
}

- (void)registerForFactors:(id)a3 inAssetSetName:(id)a4 withAssetsDelegate:(id)a5 withLocale:(id)a6 withFactorAndFolders:(id)a7 useFileManager:(id)a8 withAssetAvailabilityType:(int64_t)a9
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v14 = a3;
  v15 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[CDMUAFAssetsManager registerForFactors:inAssetSetName:withAssetsDelegate:withLocale:withFacto"
                         "rAndFolders:useFileManager:withAssetAvailabilityType:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    id v56 = v15;
    LOWORD(v57) = 2112;
    *(void *)((char *)&v57 + 2) = v18;
    _os_log_debug_impl(&dword_2263A0000, v20, OS_LOG_TYPE_DEBUG, "%s Register factors: %@ in assetSetName: %@ with assets delegate with factorAndFolders :%@.", buf, 0x2Au);
  }

  uint64_t v38 = +[CDMUAFAssetsManager getNLUAFClientManagers];
  uint64_t v21 = +[CDMAssetsUtils getGraphNameForAssetAvailabilityType:a9];
  uint64_t v37 = [v38 objectForKey:v21];

  id v48 = 0;
  uint64_t v22 = +[CDMUAFAssetsManager getAssetSetNameToUafClientManager:v37 withError:&v48];
  id v36 = v48;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v56 = __Block_byref_object_copy__7972;
  *(void *)&long long v57 = __Block_byref_object_dispose__7973;
  *((void *)&v57 + 1) = [v22 objectForKeyedSubscript:v15];
  uint64_t v23 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v34 = [*(id *)(*(void *)&buf[8] + 40) assetSet];
    *(_DWORD *)v49 = 136315650;
    uint64_t v50 = "-[CDMUAFAssetsManager registerForFactors:inAssetSetName:withAssetsDelegate:withLocale:withFactorAndFolders:use"
          "FileManager:withAssetAvailabilityType:]";
    __int16 v51 = 2112;
    long long v52 = v15;
    __int16 v53 = 2112;
    long long v54 = v34;
    _os_log_debug_impl(&dword_2263A0000, v23, OS_LOG_TYPE_DEBUG, "%s Retrieved assetSet outside update block for assetSetName: %@ with assetSet: %@", v49, 0x20u);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __149__CDMUAFAssetsManager_registerForFactors_inAssetSetName_withAssetsDelegate_withLocale_withFactorAndFolders_useFileManager_withAssetAvailabilityType___block_invoke;
  aBlock[3] = &unk_2647A5458;
  v46 = buf;
  v24 = v15;
  v40 = v24;
  id v25 = v14;
  id v41 = v25;
  id v26 = v17;
  id v42 = v26;
  id v27 = v16;
  id v43 = v27;
  id v28 = v18;
  id v44 = v28;
  id v29 = v19;
  id v45 = v29;
  int64_t v47 = a9;
  v30 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v31 = [MEMORY[0x263F84070] sharedManager];
  v32 = [v31 observeAssetSet:v24 queue:0 handler:v30];

  if (v32)
  {
    uint64_t v33 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v49 = 136315394;
      uint64_t v50 = "-[CDMUAFAssetsManager registerForFactors:inAssetSetName:withAssetsDelegate:withLocale:withFactorAndFolders:u"
            "seFileManager:withAssetAvailabilityType:]";
      __int16 v51 = 2112;
      long long v52 = v24;
      _os_log_debug_impl(&dword_2263A0000, v33, OS_LOG_TYPE_DEBUG, "%s Observer added for assetSetName: %@", v49, 0x16u);
    }

    [(NSMutableDictionary *)self->_assetSetNameToObserver setObject:v32 forKey:v24];
  }
  v30[2](v30);

  _Block_object_dispose(buf, 8);
}

void __149__CDMUAFAssetsManager_registerForFactors_inAssetSetName_withAssetsDelegate_withLocale_withFactorAndFolders_useFileManager_withAssetAvailabilityType___block_invoke(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (!v2)
  {
    v3 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      long long v57 = "-[CDMUAFAssetsManager registerForFactors:inAssetSetName:withAssetsDelegate:withLocale:withFactorAndFolders:u"
            "seFileManager:withAssetAvailabilityType:]_block_invoke";
      _os_log_impl(&dword_2263A0000, v3, OS_LOG_TYPE_INFO, "%s [WARN]: uafClientManager is nil", buf, 0xCu);
    }

    v2 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  }
  obuint64_t j = v2;
  objc_sync_enter(obj);
  v4 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) assetSet];
  BOOL v5 = v4 == 0;

  if (v5)
  {
    int v6 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      long long v57 = "-[CDMUAFAssetsManager registerForFactors:inAssetSetName:withAssetsDelegate:withLocale:withFactorAndFolders:u"
            "seFileManager:withAssetAvailabilityType:]_block_invoke";
      _os_log_impl(&dword_2263A0000, v6, OS_LOG_TYPE_INFO, "%s [WARN]: uafClientManager.assetSet is nil", buf, 0xCu);
    }
  }
  v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v48 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) assetSetName];
    v49 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) assetSet];
    *(_DWORD *)buf = 136315650;
    long long v57 = "-[CDMUAFAssetsManager registerForFactors:inAssetSetName:withAssetsDelegate:withLocale:withFactorAndFolders:use"
          "FileManager:withAssetAvailabilityType:]_block_invoke";
    __int16 v58 = 2112;
    unint64_t v59 = (unint64_t)v48;
    __int16 v60 = 2112;
    uint64_t v61 = (uint64_t)v49;
    _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s AssetSet being observed for assetSetName %@ is %@", buf, 0x20u);
  }
  os_signpost_id_t v8 = os_signpost_id_generate((os_log_t)CDMLogContext);
  uint64_t v9 = (id)CDMLogContext;
  uint64_t v10 = v9;
  os_signpost_id_t spid = v8;
  unint64_t v11 = v8 - 1;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = *(const char **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    long long v57 = v12;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CDMUAFAssetsManager", "assetSet refresh %@", buf, 0xCu);
  }

  v13 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v50 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) assetSetName];
    __int16 v51 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) usages];
    *(_DWORD *)buf = 136315650;
    long long v57 = "-[CDMUAFAssetsManager registerForFactors:inAssetSetName:withAssetsDelegate:withLocale:withFactorAndFolders:use"
          "FileManager:withAssetAvailabilityType:]_block_invoke";
    __int16 v58 = 2112;
    unint64_t v59 = (unint64_t)v50;
    __int16 v60 = 2112;
    uint64_t v61 = (uint64_t)v51;
    _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s Initing new assetSet for validation with assetSetName %@, usages: %@", buf, 0x20u);
  }
  id v14 = [MEMORY[0x263F84070] sharedManager];
  uint64_t v15 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) assetSetName];
  id v16 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) usages];
  id v17 = [v14 retrieveAssetSet:v15 usages:v16];

  id v18 = objc_alloc_init(NSDictionary);
  id v19 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) assetSet];
  LOBYTE(v15) = v19 == 0;

  if ((v15 & 1) == 0)
  {
    os_signpost_id_t v20 = os_signpost_id_generate((os_log_t)CDMLogContext);
    uint64_t v21 = (id)CDMLogContext;
    uint64_t v22 = v21;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "CDMUAFAssetsManager", "assets in registerForFactors (current)", buf, 2u);
    }

    uint64_t v23 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) assetSet];
    uint64_t v24 = [v23 assets];

    id v25 = (id)CDMLogContext;
    id v26 = v25;
    if (v20 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v26, OS_SIGNPOST_INTERVAL_END, v20, "CDMUAFAssetsManager", " enableTelemetry=YES ", buf, 2u);
    }

    id v18 = (id)v24;
  }
  id v27 = objc_alloc_init(NSDictionary);
  if (v17)
  {
    os_signpost_id_t v28 = os_signpost_id_generate((os_log_t)CDMLogContext);
    id v29 = (id)CDMLogContext;
    v30 = v29;
    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v28, "CDMUAFAssetsManager", "assets in registerForFactors (refreshed)", buf, 2u);
    }

    uint64_t v31 = [v17 assets];

    v32 = (id)CDMLogContext;
    uint64_t v33 = v32;
    if (v28 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v33, OS_SIGNPOST_INTERVAL_END, v28, "CDMUAFAssetsManager", " enableTelemetry=YES ", buf, 2u);
    }

    id v27 = (id)v31;
  }
  uint64_t v35 = *(void *)(a1 + 40);
  uint64_t v34 = *(void *)(a1 + 48);
  id v36 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) assetSetName];
  BOOL v37 = +[CDMUAFAssetsManager validateFactors:v35 inAssetSet:v17 forLocale:v34 withAssetSetName:v36];

  uint64_t v38 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    long long v57 = "-[CDMUAFAssetsManager registerForFactors:inAssetSetName:withAssetsDelegate:withLocale:withFactorAndFolders:use"
          "FileManager:withAssetAvailabilityType:]_block_invoke";
    __int16 v58 = 2048;
    unint64_t v59 = v37;
    __int16 v60 = 2048;
    uint64_t v61 = 1;
    _os_log_debug_impl(&dword_2263A0000, v38, OS_LOG_TYPE_DEBUG, "%s newAssetSetValid: %ld; forceUpdateAssetSetInCache %ld",
      buf,
      0x20u);
  }

  v39 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    long long v52 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) assetSetName];
    *(_DWORD *)buf = 136315906;
    long long v57 = "-[CDMUAFAssetsManager registerForFactors:inAssetSetName:withAssetsDelegate:withLocale:withFactorAndFolders:use"
          "FileManager:withAssetAvailabilityType:]_block_invoke";
    __int16 v58 = 2112;
    unint64_t v59 = (unint64_t)v52;
    __int16 v60 = 2112;
    uint64_t v61 = (uint64_t)v18;
    __int16 v62 = 2112;
    id v63 = v27;
    _os_log_debug_impl(&dword_2263A0000, v39, OS_LOG_TYPE_DEBUG, "%s Refreshed assetSet for %@ is valid OR the platform is IOS or OSX. Replacing cached assetSet %@ with %@", buf, 0x2Au);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setAssetSet:v17];
  id v40 = v27;

  id v41 = (id)CDMLogContext;
  id v42 = v41;
  if (v11 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v41))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v42, OS_SIGNPOST_INTERVAL_END, spid, "CDMUAFAssetsManager", " enableTelemetry=YES ", buf, 2u);
  }

  id v43 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) assetSet];
  if (!v43 || (BOOL v44 = [v40 count] == 0, v43, v44))
  {
    int64_t v47 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v53 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      long long v57 = "-[CDMUAFAssetsManager registerForFactors:inAssetSetName:withAssetsDelegate:withLocale:withFactorAndFolders:u"
            "seFileManager:withAssetAvailabilityType:]_block_invoke";
      __int16 v58 = 2112;
      unint64_t v59 = v53;
      _os_log_debug_impl(&dword_2263A0000, v47, OS_LOG_TYPE_DEBUG, "%s AssetSet being observed for assetSetName %@ is empty!", buf, 0x16u);
    }

    [*(id *)(a1 + 56) assetsUnavailableForAssetSet:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v45 = *(void *)(a1 + 40);
    v46 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) assetSet];
    +[CDMUAFAssetsManager setAssetsAvailabilityForFactors:v45 withAssetSet:v46 forAssetSetName:*(void *)(a1 + 32) withDelegateHandler:*(void *)(a1 + 56) withLocale:*(void *)(a1 + 48) withFactorAndFolders:*(void *)(a1 + 64) useFileManager:*(void *)(a1 + 72) withAssetAvailabilityType:*(void *)(a1 + 88)];
  }
  objc_sync_exit(obj);
}

- (void)setupForLocale:(id)a3 cdmAssetsInfo:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 136315138;
    id v18 = "-[CDMUAFAssetsManager setupForLocale:cdmAssetsInfo:error:]";
    _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s Setup CDMUAFAssetsManager.", (uint8_t *)&v17, 0xCu);
  }

  uint64_t v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = [v7 localeIdentifier];
    id v16 = [v8 getGraphName];
    int v17 = 136315650;
    id v18 = "-[CDMUAFAssetsManager setupForLocale:cdmAssetsInfo:error:]";
    __int16 v19 = 2112;
    os_signpost_id_t v20 = v15;
    __int16 v21 = 2112;
    uint64_t v22 = v16;
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s Setting up assets for locale: %@ and graph: %@.", (uint8_t *)&v17, 0x20u);
  }
  +[CDMLogging CDMLogInitIfNeeded];
  unint64_t v11 = +[CDMUAFAssetsManager getNLUAFClientManagers];
  objc_sync_enter(v11);
  v12 = [v7 localeIdentifier];
  v13 = +[CDMUAFAssetsManager getUAFClientManagersForLocale:v12 withCDMAssetsInfo:v8];

  id v14 = [v7 localeIdentifier];
  +[CDMUAFAssetsManager initUAFClientManagers:v13 locale:v14 error:a5];

  objc_sync_exit(v11);
}

- (id)initManager
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)CDMUAFAssetsManager;
  v2 = [(CDMUAFAssetsManager *)&v7 init];
  if (v2)
  {
    v3 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v9 = "-[CDMUAFAssetsManager initManager]";
      _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s Initialize CDMUAFAssetsManager", buf, 0xCu);
    }

    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assetSetNameToObserver = v2->_assetSetNameToObserver;
    v2->_assetSetNameToObserver = v4;
  }
  return v2;
}

+ (void)subscribeToAssetsForAssetSet:(int64_t)a3 withCDMAssetsUsages:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = [v5 getUsages];
  objc_super v7 = +[CDMAssetsUsages cdmAssetsUsageKeyToString:0];
  id v8 = [v6 objectForKey:v7];

  uint64_t v9 = (void *)[[NSString alloc] initWithFormat:@"inference.%@", v8];
  uint64_t v10 = +[CDMAssetsUtils cdmAssetSetToStr:a3];
  v13 = v10;
  unint64_t v11 = [v5 getUsages];

  v14[0] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];

  [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:2592000.0];
}

+ (void)subscribeToSsuAssetsForLocale:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = (void *)[[NSString alloc] initWithFormat:@"inference.%@", v3];
  id v5 = +[CDMAssetsUtils cdmAssetSetToStr:0];
  __int16 v21 = v5;
  int v6 = +[CDMAssetsUtils getSsuUsages:v3];
  objc_super v7 = [v6 getUsages];
  v22[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];

  uint64_t v9 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:2592000.0];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F84080]) initWithName:v4 assetSets:v8 usageAliases:0 expires:v9];
  if (v10)
  {
    unint64_t v11 = [MEMORY[0x263F84070] sharedManager];
    id v16 = v10;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __53__CDMUAFAssetsManager_subscribeToSsuAssetsForLocale___block_invoke;
    v14[3] = &unk_2647A5480;
    uint64_t v15 = v3;
    [v11 subscribe:@"com.apple.siri.ssu" subscriptions:v12 queue:0 completion:v14];

    v13 = v15;
  }
  else
  {
    v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "+[CDMUAFAssetsManager subscribeToSsuAssetsForLocale:]";
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_error_impl(&dword_2263A0000, v13, OS_LOG_TYPE_ERROR, "%s [ERR]: Unable to initialize UAFAssetSetSubscription subscription; aborting SSU asset subscription for locale %@",
        buf,
        0x16u);
    }
  }
}

void __53__CDMUAFAssetsManager_subscribeToSsuAssetsForLocale___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 136315650;
      objc_super v7 = "+[CDMUAFAssetsManager subscribeToSsuAssetsForLocale:]_block_invoke";
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_error_impl(&dword_2263A0000, v4, OS_LOG_TYPE_ERROR, "%s [ERR]: Creating subscription to SSU inference assets for locale %@ failed: %@", (uint8_t *)&v6, 0x20u);
    }
  }
}

+ (BOOL)validateFactors:(id)a3 inAssetSet:(id)a4 forLocale:(id)a5 withAssetSetName:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v9;
  uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v28;
    *(void *)&long long v14 = 136315650;
    long long v25 = v14;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        __int16 v19 = objc_msgSend(v10, "assetNamed:", v18, v25);
        id v20 = +[CDMUAFAssetsManager getNLAssetFromUAFAssetPostValidation:v18 asset:v19 locale:v11 assetSetName:v12 assetSet:v10];
        __int16 v21 = CDMOSLoggerForCategory(0);
        uint64_t v22 = v21;
        if (!v20)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v25;
            v32 = "+[CDMUAFAssetsManager validateFactors:inAssetSet:forLocale:withAssetSetName:]";
            __int16 v33 = 2112;
            uint64_t v34 = v18;
            __int16 v35 = 2112;
            id v36 = v11;
            _os_log_impl(&dword_2263A0000, v22, OS_LOG_TYPE_INFO, "%s [WARN]: UAF asset for factorName: %@ is nil for locale: %@.", buf, 0x20u);
          }

          BOOL v23 = 0;
          goto LABEL_15;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v25;
          v32 = "+[CDMUAFAssetsManager validateFactors:inAssetSet:forLocale:withAssetSetName:]";
          __int16 v33 = 2112;
          uint64_t v34 = v19;
          __int16 v35 = 2112;
          id v36 = v18;
          _os_log_debug_impl(&dword_2263A0000, v22, OS_LOG_TYPE_DEBUG, "%s UAF asset is: [%@] for factorName: %@.", buf, 0x20u);
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  BOOL v23 = 1;
LABEL_15:

  return v23;
}

+ (void)setAssetsAvailabilityForFactors:(id)a3 withAssetSet:(id)a4 forAssetSetName:(id)a5 withDelegateHandler:(id)a6 withLocale:(id)a7 withFactorAndFolders:(id)a8 useFileManager:(id)a9 withAssetAvailabilityType:(int64_t)a10
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v41 = a5;
  id v36 = a6;
  id v17 = a7;
  id v40 = a8;
  id v39 = a9;
  uint64_t v38 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v15, "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v18 = v15;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v56 count:16];
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v43;
    *(void *)&long long v20 = 136315394;
    long long v35 = v20;
    obuint64_t j = v18;
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v43 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        long long v25 = objc_msgSend(v16, "assetNamed:", v24, v35);
        id v26 = +[CDMUAFAssetsManager getNLAssetFromUAFAssetPostValidation:v24 asset:v25 locale:v17 assetSetName:v41 assetSet:v16];
        long long v27 = [v40 objectForKey:v24];
        BOOL v28 = +[CDMAssetsUtils isNLAssetValid:v26 forLocale:v17 withFolders:v27 useFileManager:v39 withAssetAvailabilityType:a10];

        if (!v28)
        {
          uint64_t v34 = CDMOSLoggerForCategory(0);
          v32 = v41;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            int64_t v47 = "+[CDMUAFAssetsManager setAssetsAvailabilityForFactors:withAssetSet:forAssetSetName:withDelegateHandler"
                  ":withLocale:withFactorAndFolders:useFileManager:withAssetAvailabilityType:]";
            __int16 v48 = 2112;
            id v49 = v26;
            __int16 v50 = 2112;
            id v51 = v17;
            __int16 v52 = 2112;
            id v53 = v41;
            _os_log_error_impl(&dword_2263A0000, v34, OS_LOG_TYPE_ERROR, "%s [ERR]: UAF asset: [%@] is invalid for locale: %@. Call assets delegate handler's assetsUnavailable for assetSetName: %@.", buf, 0x2Au);
          }

          __int16 v33 = v36;
          [v36 assetsUnavailableForAssetSet:v41];

          id v18 = obj;
          goto LABEL_18;
        }
        [v38 addObject:v26];
        long long v29 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v35;
          int64_t v47 = "+[CDMUAFAssetsManager setAssetsAvailabilityForFactors:withAssetSet:forAssetSetName:withDelegateHandler:w"
                "ithLocale:withFactorAndFolders:useFileManager:withAssetAvailabilityType:]";
          __int16 v48 = 2112;
          id v49 = v26;
          _os_log_debug_impl(&dword_2263A0000, v29, OS_LOG_TYPE_DEBUG, "%s UAF asset: [%@] has a valid asset path.", buf, 0x16u);
        }
      }
      id v18 = obj;
      uint64_t v21 = [obj countByEnumeratingWithState:&v42 objects:v56 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }

  long long v30 = CDMOSLoggerForCategory(0);
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
  if (v17)
  {
    v32 = v41;
    __int16 v33 = v36;
    if (v31)
    {
      *(_DWORD *)buf = 136316162;
      int64_t v47 = "+[CDMUAFAssetsManager setAssetsAvailabilityForFactors:withAssetSet:forAssetSetName:withDelegateHandler:withL"
            "ocale:withFactorAndFolders:useFileManager:withAssetAvailabilityType:]";
      __int16 v48 = 2112;
      id v49 = v18;
      __int16 v50 = 2112;
      id v51 = v41;
      __int16 v52 = 2112;
      id v53 = v38;
      __int16 v54 = 2112;
      id v55 = v41;
      _os_log_debug_impl(&dword_2263A0000, v30, OS_LOG_TYPE_DEBUG, "%s All factors: %@ in assetSetName: %@ found with valid UAF assets: %@. Call assets delegate handler's assetsAvailable for assetSetName: %@.", buf, 0x34u);
    }

    [v36 assetsAvailableForAssetSet:v41 forLocale:v17];
  }
  else
  {
    v32 = v41;
    __int16 v33 = v36;
    if (v31)
    {
      *(_DWORD *)buf = 136315394;
      int64_t v47 = "+[CDMUAFAssetsManager setAssetsAvailabilityForFactors:withAssetSet:forAssetSetName:withDelegateHandler:withL"
            "ocale:withFactorAndFolders:useFileManager:withAssetAvailabilityType:]";
      __int16 v48 = 2112;
      id v49 = v41;
      _os_log_debug_impl(&dword_2263A0000, v30, OS_LOG_TYPE_DEBUG, "%s Asset available locale is nil. Call assets delegate handler's assetsUnavailable for assetSetName: %@.", buf, 0x16u);
    }

    [v36 assetsUnavailableForAssetSet:v41];
  }
LABEL_18:
}

+ (id)getUAFAssetsForFactors:(id)a3 withCDMAssetsInfo:(id)a4 locale:(id)a5
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v27 = a3;
  id v29 = a4;
  id v41 = a5;
  long long v30 = +[CDMUAFAssetsManager getNLUAFClientManagers];
  objc_super v7 = [v29 getGraphName];
  v32 = [v30 objectForKey:v7];

  id v52 = 0;
  long long v35 = +[CDMUAFAssetsManager getAssetSetNameToUafClientManager:v32 withError:&v52];
  id v8 = v52;
  id v51 = v8;
  BOOL v28 = +[CDMUAFAssetsManager getAssetSetNameToFactors:v35 withError:&v51];
  id v31 = v51;

  if (v31)
  {
    oslog = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v55 = "+[CDMUAFAssetsManager getUAFAssetsForFactors:withCDMAssetsInfo:locale:]";
      __int16 v56 = 2112;
      id v57 = v31;
      _os_log_error_impl(&dword_2263A0000, oslog, OS_LOG_TYPE_ERROR, "%s [ERR]: Error generating assetSetNameToFactors: %@.", buf, 0x16u);
    }
    id v39 = 0;
  }
  else
  {
    id v50 = 0;
    oslog = +[CDMUAFAssetsManager getFactorToAssetSetName:v28 uafClientManagers:v32 withError:&v50];
    id v31 = v50;
    if (v31)
    {
      log = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v55 = "+[CDMUAFAssetsManager getUAFAssetsForFactors:withCDMAssetsInfo:locale:]";
        __int16 v56 = 2112;
        id v57 = v31;
        _os_log_error_impl(&dword_2263A0000, log, OS_LOG_TYPE_ERROR, "%s [ERR]: Error generating factorToAssetSetName: %@.", buf, 0x16u);
      }
      id v39 = 0;
    }
    else
    {
      id v9 = +[CDMUAFAssetsManager filterFactors:v27 forAssetSetNameToFactors:v28];
      id v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v27, "count"));
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      log = v9;
      uint64_t v34 = [log countByEnumeratingWithState:&v46 objects:v60 count:16];
      if (v34)
      {
        uint64_t v33 = *(void *)v47;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v47 != v33)
            {
              uint64_t v11 = v10;
              objc_enumerationMutation(log);
              uint64_t v10 = v11;
            }
            uint64_t v37 = v10;
            id v12 = *(void **)(*((void *)&v46 + 1) + 8 * v10);
            uint64_t v38 = objc_msgSend(v35, "objectForKeyedSubscript:", v12, v27);
            if (v38)
            {
              uint64_t v13 = [log objectForKey:v12];
              id v14 = v38;
              objc_sync_enter(v14);
              long long v42 = 0u;
              long long v43 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              id v15 = v13;
              uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v53 count:16];
              if (v16)
              {
                uint64_t v17 = *(void *)v43;
                do
                {
                  for (uint64_t i = 0; i != v16; ++i)
                  {
                    if (*(void *)v43 != v17) {
                      objc_enumerationMutation(v15);
                    }
                    uint64_t v19 = *(void **)(*((void *)&v42 + 1) + 8 * i);
                    long long v20 = [v14 assetSet];
                    uint64_t v21 = [v20 assetNamed:v19];

                    uint64_t v22 = [oslog objectForKey:v19];
                    BOOL v23 = [v14 assetSet];
                    uint64_t v24 = +[CDMUAFAssetsManager getNLAssetFromUAFAssetPostValidation:v19 asset:v21 locale:v41 assetSetName:v22 assetSet:v23];

                    if (v24)
                    {
                      [v39 setObject:v24 forKey:v19];
                    }
                    else
                    {
                      long long v25 = CDMOSLoggerForCategory(0);
                      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 136315650;
                        id v55 = "+[CDMUAFAssetsManager getUAFAssetsForFactors:withCDMAssetsInfo:locale:]";
                        __int16 v56 = 2112;
                        id v57 = v19;
                        __int16 v58 = 2112;
                        id v59 = v41;
                        _os_log_impl(&dword_2263A0000, v25, OS_LOG_TYPE_INFO, "%s [WARN]: UAF asset for factorName: %@ is nil for locale: %@.", buf, 0x20u);
                      }
                    }
                  }
                  uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v53 count:16];
                }
                while (v16);
              }

              objc_sync_exit(v14);
            }
            else
            {
              id v15 = CDMOSLoggerForCategory(0);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                id v55 = "+[CDMUAFAssetsManager getUAFAssetsForFactors:withCDMAssetsInfo:locale:]";
                __int16 v56 = 2112;
                id v57 = v12;
                __int16 v58 = 2112;
                id v59 = v32;
                _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s [WARN]: Can't find CDMUAFClientManager for assetSet: %@. Please make sure the input assetSet exists in: %@.", buf, 0x20u);
              }
            }

            uint64_t v10 = v37 + 1;
          }
          while (v37 + 1 != v34);
          uint64_t v34 = [log countByEnumeratingWithState:&v46 objects:v60 count:16];
        }
        while (v34);
      }
    }
  }

  return v39;
}

+ (id)filterFactors:(id)a3 forAssetSetNameToFactors:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = [v5 allKeys];
  id v8 = +[CDMAssetsUtils filterFactors:v6 forAssetSets:v7 withAssetSetNameToFactors:v5];

  return v8;
}

+ (id)getNLAssetFromUAFAssetPostValidation:(id)a3 asset:(id)a4 locale:(id)a5 assetSetName:(id)a6 assetSet:(id)a7
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  id v14 = +[CDMUAFAssetsManager getNLAssetFromUAFAsset:a4 withFactor:v11 withAssetSetName:a6 withAssetSet:v13];
  id v15 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 136316162;
    long long v20 = "+[CDMUAFAssetsManager getNLAssetFromUAFAssetPostValidation:asset:locale:assetSetName:assetSet:]";
    __int16 v21 = 2112;
    uint64_t v22 = v14;
    __int16 v23 = 2112;
    id v24 = v11;
    __int16 v25 = 2112;
    id v26 = v12;
    __int16 v27 = 2112;
    id v28 = v13;
    _os_log_debug_impl(&dword_2263A0000, v15, OS_LOG_TYPE_DEBUG, "%s Validating UAF asset: %@ for factorName: %@ and locale: %@ with assetSet: %@", (uint8_t *)&v19, 0x34u);
  }

  if (+[CDMAssetsUtils isNLAssetValid:v14 forLocale:v12])
  {
    id v16 = v14;
  }
  else
  {
    uint64_t v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136316162;
      long long v20 = "+[CDMUAFAssetsManager getNLAssetFromUAFAssetPostValidation:asset:locale:assetSetName:assetSet:]";
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      __int16 v23 = 2112;
      id v24 = v11;
      __int16 v25 = 2112;
      id v26 = v12;
      __int16 v27 = 2112;
      id v28 = v13;
      _os_log_error_impl(&dword_2263A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: UAF asset: %@ for factorName: %@ is invalid for locale: %@ with assetSet: %@. Return nil.", (uint8_t *)&v19, 0x34u);
    }

    id v16 = 0;
  }

  return v16;
}

+ (id)getNLAssetFromUAFAsset:(id)a3 withFactor:(id)a4 withAssetSetName:(id)a5 withAssetSet:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v9)
  {
    __int16 v23 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v26 = 136315394;
      __int16 v27 = "+[CDMUAFAssetsManager getNLAssetFromUAFAsset:withFactor:withAssetSetName:withAssetSet:]";
      __int16 v28 = 2112;
      id v29 = v10;
      id v24 = "%s [WARN]: Can't find valid asset for factorName: %@.";
      goto LABEL_12;
    }
LABEL_13:

    id v22 = 0;
    goto LABEL_14;
  }
  uint64_t v13 = [v9 location];
  if (!v13) {
    goto LABEL_8;
  }
  id v14 = (void *)v13;
  id v15 = [v9 location];
  id v16 = [v15 path];
  uint64_t v17 = [v16 length];

  if (!v17)
  {
LABEL_8:
    __int16 v23 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v26 = 136315394;
      __int16 v27 = "+[CDMUAFAssetsManager getNLAssetFromUAFAsset:withFactor:withAssetSetName:withAssetSet:]";
      __int16 v28 = 2112;
      id v29 = v10;
      id v24 = "%s [WARN]: Directory value of factor %@ doesn't have path.";
LABEL_12:
      _os_log_impl(&dword_2263A0000, v23, OS_LOG_TYPE_INFO, v24, (uint8_t *)&v26, 0x16u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  id v18 = [v9 location];
  int v19 = [v18 path];

  long long v20 = [v9 metadata];
  __int16 v21 = v20;
  if (v20 && [v20 count]) {
    [v21 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_382_8054];
  }
  id v22 = [[UAFNLAsset alloc] initForFactor:v10 withPath:v19 withAssetSetName:v11 withUAFMetadata:v21 withAssetSet:v12];

LABEL_14:
  return v22;
}

+ (id)getFactorToAssetSetName:(id)a3 uafClientManagers:(id)a4 withError:(id *)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v10 = v7;
  uint64_t v37 = [v10 countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (v37)
  {
    uint64_t v11 = *(void *)v44;
    long long v35 = a5;
    id v36 = v8;
    uint64_t v34 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v44 != v11) {
          objc_enumerationMutation(v10);
        }
        uint64_t v13 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        id v14 = [v10 objectForKeyedSubscript:v13];
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v53 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v40;
          while (2)
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v40 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v39 + 1) + 8 * j);
              uint64_t v21 = [v9 objectForKey:v20];
              id v22 = (void *)v21;
              if (v21) {
                BOOL v23 = v21 == v13;
              }
              else {
                BOOL v23 = 1;
              }
              if (!v23)
              {
                uint64_t v38 = (void *)MEMORY[0x263F087E8];
                v51[0] = *MEMORY[0x263F08320];
                id v8 = v36;
                __int16 v25 = [NSString stringWithFormat:@"Duplicate factor name encountered %@ under assetSet: %@ in UAFClientManagers: %@.", v20, v13, v36];
                v52[0] = v25;
                v51[1] = *MEMORY[0x263F08338];
                int v26 = [NSString stringWithFormat:@"Duplicate factor name encountered %@ under assetSet: %@ in UAFClientManagers: %@.", v20, v13, v36];
                uint64_t v27 = *MEMORY[0x263F08348];
                v52[1] = v26;
                v52[2] = @"Check for presence of duplicate factor names across UAFClientManagers";
                v51[2] = v27;
                v51[3] = @"CDMAssetSetupErrorDomain";
                __int16 v28 = [NSNumber numberWithInt:5];
                v52[3] = v28;
                id v29 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:4];
                *long long v35 = [v38 errorWithDomain:@"CDMUAFDuplicateFactorErrorDomain" code:0 userInfo:v29];

                uint64_t v30 = CDMOSLoggerForCategory(0);
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  id v33 = *v35;
                  *(_DWORD *)buf = 136315394;
                  long long v48 = "+[CDMUAFAssetsManager getFactorToAssetSetName:uafClientManagers:withError:]";
                  __int16 v49 = 2112;
                  id v50 = v33;
                  _os_log_error_impl(&dword_2263A0000, v30, OS_LOG_TYPE_ERROR, "%s [ERR]: Error: %@.", buf, 0x16u);
                }

                id v24 = 0;
                goto LABEL_24;
              }
              [v9 setObject:v13 forKey:v20];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v53 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }

        uint64_t v11 = v34;
      }
      id v8 = v36;
      uint64_t v37 = [v10 countByEnumeratingWithState:&v43 objects:v54 count:16];
    }
    while (v37);
  }

  id v24 = v9;
LABEL_24:

  return v24;
}

+ (id)getAssetSetNameToFactors:(id)a3 withError:(id *)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v6 = [v4 allValues];
  id v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v30 = v4;
  id v8 = [v4 allValues];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v14 = +[CDMUAFAssetsManager getFactorsForClientManager:v13];
        if (!v14)
        {
          uint64_t v20 = (void *)MEMORY[0x263F087E8];
          v41[0] = *MEMORY[0x263F08320];
          uint64_t v21 = [NSString stringWithFormat:@"No factors found for UAFClientManager: %@.", v13];
          v42[0] = v21;
          v41[1] = *MEMORY[0x263F08338];
          id v22 = [NSString stringWithFormat:@"No factors found for UAFClientManager: %@.", v13];
          uint64_t v23 = *MEMORY[0x263F08348];
          v42[1] = v22;
          v42[2] = @"Check for UAF Config files for no factors in asset set name";
          v41[2] = v23;
          v41[3] = @"CDMAssetSetupErrorDomain";
          id v24 = [NSNumber numberWithInt:3];
          v42[3] = v24;
          __int16 v25 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:4];
          *a4 = [v20 errorWithDomain:@"CDMUAFAssetsManager" code:3 userInfo:v25];

          int v26 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            id v28 = *a4;
            *(_DWORD *)buf = 136315394;
            id v36 = "+[CDMUAFAssetsManager getAssetSetNameToFactors:withError:]";
            __int16 v37 = 2112;
            id v38 = v28;
            _os_log_error_impl(&dword_2263A0000, v26, OS_LOG_TYPE_ERROR, "%s [ERR]: Error: %@.", buf, 0x16u);
          }

          id v19 = 0;
          goto LABEL_15;
        }
        id v15 = (void *)v14;
        uint64_t v16 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v18 = [v13 assetSetName];
          *(_DWORD *)buf = 136315650;
          id v36 = "+[CDMUAFAssetsManager getAssetSetNameToFactors:withError:]";
          __int16 v37 = 2112;
          id v38 = v18;
          __int16 v39 = 2112;
          long long v40 = v15;
          _os_log_debug_impl(&dword_2263A0000, v16, OS_LOG_TYPE_DEBUG, "%s Writing to assetSetNameToFactors: key = %@ and value = %@.", buf, 0x20u);
        }
        uint64_t v17 = [v13 assetSetName];
        [v7 setObject:v15 forKey:v17];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v43 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v19 = v7;
LABEL_15:

  return v19;
}

+ (id)getAssetSetNameToUafClientManager:(id)a3 withError:(id *)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v13 = [v12 assetSetName];
        uint64_t v14 = [v6 objectForKey:v13];

        if (v14)
        {
          uint64_t v17 = (void *)MEMORY[0x263F087E8];
          v34[0] = *MEMORY[0x263F08320];
          uint64_t v18 = [NSString stringWithFormat:@"Duplicate AssetSet name encountered in UAFClientManagers: %@.", v7];
          v35[0] = v18;
          v34[1] = *MEMORY[0x263F08338];
          id v19 = [NSString stringWithFormat:@"Duplicate AssetSet name encountered in UAFClientManagers: %@.", v7];
          uint64_t v20 = *MEMORY[0x263F08348];
          v35[1] = v19;
          v35[2] = @"Check for presence of duplicate AssetSet names across UAFClientManagers";
          v34[2] = v20;
          v34[3] = @"CDMAssetSetupErrorDomain";
          uint64_t v21 = [NSNumber numberWithInt:3];
          v35[3] = v21;
          id v22 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];
          *a4 = [v17 errorWithDomain:@"CDMUAFAssetsManager" code:1 userInfo:v22];

          uint64_t v23 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            id v25 = *a4;
            *(_DWORD *)buf = 136315394;
            long long v31 = "+[CDMUAFAssetsManager getAssetSetNameToUafClientManager:withError:]";
            __int16 v32 = 2112;
            id v33 = v25;
            _os_log_error_impl(&dword_2263A0000, v23, OS_LOG_TYPE_ERROR, "%s [ERR]: Error: %@.", buf, 0x16u);
          }

          id v16 = 0;
          goto LABEL_13;
        }
        id v15 = [v12 assetSetName];
        [v6 setObject:v12 forKey:v15];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v36 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v16 = v6;
LABEL_13:

  return v16;
}

+ (void)initUAFClientManagers:(id)a3 locale:(id)a4 error:(id *)a5
{
  v68[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    obuint64_t j = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v52 objects:v66 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      __int16 v49 = a5;
      id v50 = v7;
      uint64_t v11 = *(void *)v53;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v53 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          if ([v13 shouldInitUAFAssetSetInSetupForLocale:v8])
          {
            uint64_t v14 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              id v59 = "+[CDMUAFAssetsManager initUAFClientManagers:locale:error:]";
              __int16 v60 = 2112;
              id v61 = v13;
              _os_log_debug_impl(&dword_2263A0000, v14, OS_LOG_TYPE_DEBUG, "%s Initialize UAFAssetSet for cdmClientManager: %@", buf, 0x16u);
            }

            os_signpost_id_t v15 = os_signpost_id_generate((os_log_t)CDMLogContext);
            id v16 = (id)CDMLogContext;
            uint64_t v17 = v16;
            if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
            {
              uint64_t v18 = [v13 assetSetName];
              *(_DWORD *)buf = 138412290;
              id v59 = v18;
              _os_signpost_emit_with_name_impl(&dword_2263A0000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "CDMUAFAssetsManager", "initUAFAssetSet %@", buf, 0xCu);
            }
            [v13 initUAFAssetSet];
            id v19 = (id)CDMLogContext;
            uint64_t v20 = v19;
            if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_2263A0000, v20, OS_SIGNPOST_INTERVAL_END, v15, "CDMUAFAssetsManager", " enableTelemetry=YES ", buf, 2u);
            }
          }
          uint64_t v21 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v30 = [v13 assetSetName];
            long long v31 = [v13 assetSet];
            __int16 v32 = [v13 usages];
            *(_DWORD *)buf = 136315906;
            id v59 = "+[CDMUAFAssetsManager initUAFClientManagers:locale:error:]";
            __int16 v60 = 2112;
            id v61 = v30;
            __int16 v62 = 2112;
            id v63 = v31;
            __int16 v64 = 2112;
            id v65 = v32;
            _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, "%s uafClientManager.assetSetName %@ has assetSet %@ has usages %@", buf, 0x2Au);
          }
          id v22 = [v13 getAssetSet];
          id v23 = objc_alloc_init(NSDictionary);
          if (!v22)
          {
            id v33 = (void *)MEMORY[0x263F087E8];
            v56[0] = *MEMORY[0x263F08320];
            long long v34 = [NSString stringWithFormat:@"No assets found for UAFClientManagers: %@.", v13];
            v57[0] = v34;
            v56[1] = *MEMORY[0x263F08338];
            long long v35 = [NSString stringWithFormat:@"No assets found for UAFClientManagers: %@.", v13];
            uint64_t v36 = *MEMORY[0x263F08348];
            v57[1] = v35;
            v57[2] = @"Check assetSet name / presence of assets configured under the assetSet.";
            v56[2] = v36;
            v56[3] = @"CDMAssetSetupErrorDomain";
            uint64_t v37 = [NSNumber numberWithInt:4];
            v57[3] = v37;
            id v38 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:4];
            id *v49 = [v33 errorWithDomain:@"CDMUAFAssetsNotFoundErrorDomain" code:0 userInfo:v38];

            __int16 v39 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              id v47 = *v49;
              *(_DWORD *)buf = 136315394;
              id v59 = "+[CDMUAFAssetsManager initUAFClientManagers:locale:error:]";
              __int16 v60 = 2112;
              id v61 = v47;
              _os_log_error_impl(&dword_2263A0000, v39, OS_LOG_TYPE_ERROR, "%s [ERR]: Error: %@.", buf, 0x16u);
            }

            long long v40 = CDMOSLoggerForCategory(0);
            id v7 = v50;
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              id v59 = "+[CDMUAFAssetsManager initUAFClientManagers:locale:error:]";
              _os_log_error_impl(&dword_2263A0000, v40, OS_LOG_TYPE_ERROR, "%s [ERR]: Self heal the cache because assetSet is nil", buf, 0xCu);
            }

            +[CDMUAFAssetsManager reInitCDMUAFAssetsCache];
            goto LABEL_36;
          }
          os_signpost_id_t v24 = os_signpost_id_generate((os_log_t)CDMLogContext);
          id v25 = (id)CDMLogContext;
          long long v26 = v25;
          if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_2263A0000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "CDMUAFAssetsManager", "getAssets in initUAFClientManagers", buf, 2u);
          }

          long long v27 = [v22 assets];

          long long v28 = (id)CDMLogContext;
          long long v29 = v28;
          if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_2263A0000, v29, OS_SIGNPOST_INTERVAL_END, v24, "CDMUAFAssetsManager", " enableTelemetry=YES ", buf, 2u);
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v52 objects:v66 count:16];
        if (v10) {
          continue;
        }
        break;
      }
      id v7 = v50;
    }
  }
  else
  {
    long long v41 = (void *)MEMORY[0x263F087E8];
    v67[0] = *MEMORY[0x263F08320];
    long long v42 = [NSString stringWithFormat:@"No UAFClientManagers found for locale: %@", v8];
    v68[0] = v42;
    v67[1] = *MEMORY[0x263F08338];
    long long v43 = [NSString stringWithFormat:@"No UAFClientManagers found for locale: %@", v8];
    uint64_t v44 = *MEMORY[0x263F08348];
    v68[1] = v43;
    v68[2] = @"Check locale / graphName provided.";
    v67[2] = v44;
    v67[3] = @"CDMAssetSetupErrorDomain";
    long long v45 = [NSNumber numberWithInt:3];
    v68[3] = v45;
    long long v46 = [NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:4];
    *a5 = [v41 errorWithDomain:@"CDMUAFAssetsManager" code:2 userInfo:v46];

    obuint64_t j = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      id v48 = *a5;
      *(_DWORD *)buf = 136315394;
      id v59 = "+[CDMUAFAssetsManager initUAFClientManagers:locale:error:]";
      __int16 v60 = 2112;
      id v61 = v48;
      _os_log_error_impl(&dword_2263A0000, obj, OS_LOG_TYPE_ERROR, "%s [ERR]: Error: %@.", buf, 0x16u);
    }
  }
LABEL_36:
}

+ (void)reInitCDMUAFAssetsCache
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    os_signpost_id_t v24 = "+[CDMUAFAssetsManager reInitCDMUAFAssetsCache]";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Re Initializing CDMUAFClientManager's cache", buf, 0xCu);
  }

  id v3 = +[CDMUAFAssetsManager getNLUAFClientManagers];
  objc_sync_enter(v3);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = [v4 objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * v7)];
        long long v15 = 0u;
        long long v16 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v14;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v14 != v11) {
                objc_enumerationMutation(v9);
              }
              [*(id *)(*((void *)&v13 + 1) + 8 * v12++) initUAFAssetSet];
            }
            while (v10 != v12);
            uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v21 count:16];
          }
          while (v10);
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v4);
}

void __45__CDMUAFAssetsManager_getNLUAFClientManagers__block_invoke()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v0 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315138;
    id v4 = "+[CDMUAFAssetsManager getNLUAFClientManagers]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v0, OS_LOG_TYPE_DEBUG, "%s Initializing NL UAFClientManager singleton dictionary", (uint8_t *)&v3, 0xCu);
  }

  id v1 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v2 = (void *)getNLUAFClientManagers_nlUAFClientManagers;
  getNLUAFClientManagers_nlUAFClientManagers = (uint64_t)v1;
}

@end