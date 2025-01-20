@interface CDMServiceCenter
+ (id)getDynamicConfigWithAssetCollectionForGraph:(id)a3 withLocale:(id)a4 withError:(id *)a5 withSelfMetadata:(id)a6;
- (BOOL)areAssetsAvailable:(id)a3;
- (BOOL)handleXPCActivity:(id)a3 fromIdentifier:(id)a4 withRegister:(id)a5;
- (BOOL)handleXPCEvent:(id)a3 fromStream:(id)a4 withRegister:(id)a5;
- (BOOL)isServiceNotReady:(id)a3 withServiceStateMap:(id)a4;
- (CDMServiceCenter)initWithConfig:(id)a3;
- (id)extractEnabledServiceNames:(id)a3;
- (id)getAssetPaths;
- (id)getCurrentConfig;
- (id)getEnabledDAGServiceNames;
- (id)getEnabledDAGServiceNamesForGraph:(id)a3;
- (id)getFoundationServices;
- (id)getServices;
- (id)getServicesToWarmup:(id)a3;
- (int64_t)getSystemState;
- (int64_t)systemState;
- (void)cleanup;
- (void)dealloc;
- (void)handleCommand:(id)a3 forCallback:(id)a4;
- (void)handleSetup:(id)a3 forCallback:(id)a4;
- (void)handleWarmup:(id)a3 forCallback:(id)a4;
- (void)mergeConfig:(id)a3;
- (void)readMemoryPressure;
- (void)readThermalState;
- (void)setSystemState:(int64_t)a3;
- (void)setupAssetsForCDMAssetsInfo:(id)a3 withError:(id *)a4;
- (void)setupAssetsForCDMAssetsInfo:(id)a3 withError:(id *)a4 andSelfMetadata:(id)a5 dataDispatcherContext:(id)a6;
- (void)setupCDMAssetManagerWithError:(id *)a3;
- (void)setupEmbeddingConfigsWithError:(id *)a3;
- (void)smService:(id)a3 didPublishCommand:(id)a4;
- (void)smService:(id)a3 didPublishRequest:(id)a4 withResponseCallback:(id)a5;
@end

@implementation CDMServiceCenter

- (void)setSystemState:(int64_t)a3
{
  self->_systemState = a3;
}

- (CDMServiceCenter)initWithConfig:(id)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v55 = a3;
  v5 = CDMOSLoggerForCategory(4);
  os_signpost_id_t spid = os_signpost_id_generate(v5);

  v6 = CDMOSLoggerForCategory(4);
  v7 = v6;
  unint64_t v52 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v7, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CDMServiceCenterSetup", "CDM Service Center Setup enableTelemetry=YES", (uint8_t *)buf, 2u);
  }

  if (+[CDMServiceCenterUtils isServiceCenterEnabled:v55])
  {
    objc_storeStrong((id *)&self->_config, a3);
    v8 = [CDMDynamicConfig alloc];
    v9 = [v55 defaultLocaleIdentifier];
    v10 = [(CDMDynamicConfig *)v8 initWithLanguageCode:v9];
    currentConfig = self->_currentConfig;
    self->_currentConfig = v10;

    v12 = [MEMORY[0x263EFF9A0] dictionary];
    commandServicesDict = self->_commandServicesDict;
    self->_commandServicesDict = v12;

    v14 = [[CDMServiceGraphRunner alloc] initWithMaxConcurrentCount:[(CDMConfig *)self->_config maxConcurrentCount]];
    serviceGraphRunner = self->_serviceGraphRunner;
    self->_serviceGraphRunner = v14;

    [(CDMServiceCenter *)self addObserver:self->_serviceGraphRunner forKeyPath:@"systemState" options:0 context:0];
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = dispatch_queue_attr_make_with_qos_class(v16, (dispatch_qos_class_t)+[CDMServiceCenterUtils getServiceCenterQueueQOS], 0);
    v18 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.siri.cdm.CDMServiceCenter", v17);
    cdmServiceCenterQueue = self->_cdmServiceCenterQueue;
    self->_cdmServiceCenterQueue = v18;

    v53 = +[CDMServiceCenterUtils tryInitDAGServices:v55];
    v20 = [[CDMComposerService alloc] initWithConfig:self->_config];
    composerService = self->_composerService;
    self->_composerService = v20;

    v22 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSObject count](v53, "count") + 1);
    [v22 addObjectsFromArray:v53];
    [v22 addObject:self->_composerService];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    obuint64_t j = v22;
    uint64_t v58 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
    if (v58)
    {
      uint64_t v57 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v58; ++i)
        {
          if (*(void *)v68 != v57) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          [v24 addObserver:self];
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          v25 = [v24 supportedCommands];
          uint64_t v26 = [v25 countByEnumeratingWithState:&v63 objects:v71 count:16];
          if (v26)
          {
            uint64_t v27 = *(void *)v64;
            do
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v64 != v27) {
                  objc_enumerationMutation(v25);
                }
                uint64_t v29 = *(void *)(*((void *)&v63 + 1) + 8 * j);
                v30 = [(NSMutableDictionary *)self->_commandServicesDict objectForKeyedSubscript:v29];
                BOOL v31 = v30 == 0;

                if (v31)
                {
                  v32 = [MEMORY[0x263EFF980] array];
                  [(NSMutableDictionary *)self->_commandServicesDict setObject:v32 forKeyedSubscript:v29];
                }
                v33 = [(NSMutableDictionary *)self->_commandServicesDict objectForKeyedSubscript:v29];
                [v33 addObject:v24];
              }
              uint64_t v26 = [v25 countByEnumeratingWithState:&v63 objects:v71 count:16];
            }
            while (v26);
          }
        }
        uint64_t v58 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
      }
      while (v58);
    }

    v34 = +[CDMServiceCenterUtils tryInitGraphServices:v55];
    v35 = [MEMORY[0x263EFF8C0] arrayWithObject:self->_composerService];
    foundationServices = self->_foundationServices;
    self->_foundationServices = v35;

    v37 = [MEMORY[0x263EFF8C0] arrayWithArray:v53];
    dagServices = self->_dagServices;
    self->_dagServices = v37;

    v39 = [MEMORY[0x263EFF8C0] arrayWithArray:obj];
    services = self->_services;
    self->_services = v39;

    v41 = [(CDMServiceCenter *)self extractEnabledServiceNames:self->_dagServices];
    enabledDAGServiceNames = self->_enabledDAGServiceNames;
    self->_enabledDAGServiceNames = v41;

    v43 = [MEMORY[0x263EFF8C0] arrayWithArray:v34];
    graphServices = self->_graphServices;
    self->_graphServices = v43;

    [(CDMComposerService *)self->_composerService updateServices:self->_dagServices];
    [(CDMComposerService *)self->_composerService updateServiceGraphRunner:self->_serviceGraphRunner];
    [(CDMComposerService *)self->_composerService updateGraphServices:self->_graphServices];
    objc_initWeak(buf, self);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __35__CDMServiceCenter_initWithConfig___block_invoke;
    aBlock[3] = &unk_2647A4020;
    objc_copyWeak(&v61, buf);
    v45 = _Block_copy(aBlock);
    id defaultCallback = self->_defaultCallback;
    self->_id defaultCallback = v45;

    [(CDMServiceCenter *)self setSystemState:1];
    v47 = CDMOSLoggerForCategory(4);
    v48 = v47;
    if (v52 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
    {
      *(_WORD *)v59 = 0;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v48, OS_SIGNPOST_INTERVAL_END, spid, "CDMServiceCenterSetup", " enableTelemetry=YES ", v59, 2u);
    }

    objc_destroyWeak(&v61);
    objc_destroyWeak(buf);

    v49 = v53;
  }
  else
  {
    v50 = CDMOSLoggerForCategory(4);
    if (v52 >= 0xFFFFFFFFFFFFFFFELL)
    {
      v49 = v50;
    }
    else
    {
      v49 = v50;
      if (os_signpost_enabled(v50))
      {
        LOWORD(buf[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v49, OS_SIGNPOST_INTERVAL_END, spid, "CDMServiceCenterSetup", " enableTelemetry=YES ", (uint8_t *)buf, 2u);
      }
    }
  }

  return result;
}

- (int64_t)systemState
{
  return self->_systemState;
}

- (id)extractEnabledServiceNames:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend((id)objc_opt_class(), "isEnabled", v13))
        {
          v10 = (objc_class *)objc_opt_class();
          v11 = NSStringFromClass(v10);
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

uint64_t __46__CDMServiceCenter_handleCommand_forCallback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleSetup:*(void *)(a1 + 40) forCallback:*(void *)(a1 + 48)];
}

- (id)getEnabledDAGServiceNamesForGraph:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v4 = [NSClassFromString((NSString *)a3) requiredDAGServices];
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSArray count](self->_enabledDAGServiceNames, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_enabledDAGServiceNames;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v4, "containsObject:", v11, (void)v13)) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)handleSetup:(id)a3 forCallback:(id)a4
{
  uint64_t v252 = *MEMORY[0x263EF8340];
  id v149 = a3;
  v138 = (void (**)(id, void, void *))a4;
  uint64_t v7 = CDMOSLoggerForCategory(4);
  os_signpost_id_t spid = os_signpost_id_generate(v7);

  uint64_t v8 = CDMOSLoggerForCategory(4);
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  v10 = CDMOSLoggerForCategory(4);
  uint64_t v11 = v10;
  unint64_t v135 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v11, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CDMServicesSetup", "CDM Services Setup enableTelemetry=YES", (uint8_t *)&buf, 2u);
  }

  [(CDMServiceCenter *)self setSystemState:2];
  v12 = [v149 dynamicConfig];
  [(CDMServiceCenter *)self mergeConfig:v12];

  long long v13 = CDMOSLoggerForCategory(3);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CDMServiceCenter handleSetup:forCallback:]";
    _os_log_impl(&dword_2263A0000, v13, OS_LOG_TYPE_INFO, "%s CDM setup started", (uint8_t *)&buf, 0xCu);
  }

  [(CDMServiceCenter *)self readThermalState];
  [(CDMServiceCenter *)self readMemoryPressure];
  v150 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSArray count](self->_dagServices, "count"));
  long long v14 = [(CDMDynamicConfig *)self->_currentConfig graphName];
  v148 = [(CDMServiceCenter *)self getEnabledDAGServiceNamesForGraph:v14];

  long long v15 = [(CDMDynamicConfig *)self->_currentConfig graphName];
  Class v16 = NSClassFromString(v15);
  v17 = [(CDMDynamicConfig *)self->_currentConfig languageCode];
  v136 = [(objc_class *)v16 getAssetsForSetup:v17];

  long long v214 = 0u;
  long long v215 = 0u;
  long long v212 = 0u;
  long long v213 = 0u;
  uint64_t v18 = self->_dagServices;
  uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v212 objects:v251 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v213;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v213 != v20) {
          objc_enumerationMutation(v18);
        }
        uint64_t v22 = *(void *)(*((void *)&v212 + 1) + 8 * i);
        v23 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v23);
        uint64_t k = [v148 containsObject:v24];

        if (k) {
          [v150 addObject:v22];
        }
      }
      uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v212 objects:v251 count:16];
    }
    while (v19);
  }

  long long v210 = 0u;
  long long v211 = 0u;
  long long v208 = 0u;
  long long v209 = 0u;
  v25 = self->_foundationServices;
  uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v208 objects:v250 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v209;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v209 != v27) {
          objc_enumerationMutation(v25);
        }
        uint64_t v29 = *(void *)(*((void *)&v208 + 1) + 8 * j);
        commandServicesDict = self->_commandServicesDict;
        BOOL v31 = [v149 commandName];
        v32 = [(NSMutableDictionary *)commandServicesDict objectForKeyedSubscript:v31];
        uint64_t k = [v32 containsObject:v29];

        if (k) {
          [v150 addObject:v29];
        }
      }
      uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v208 objects:v250 count:16];
    }
    while (v26);
  }

  v146 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSArray count](self->_graphServices, "count"));
  v33 = [(CDMDynamicConfig *)self->_currentConfig graphName];
  v34 = [NSClassFromString(v33) requiredCDMGraphServices];
  v147 = [v34 allObjects];

  long long v206 = 0u;
  long long v207 = 0u;
  long long v204 = 0u;
  long long v205 = 0u;
  v35 = self->_graphServices;
  uint64_t v36 = [(NSArray *)v35 countByEnumeratingWithState:&v204 objects:v249 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v205;
    do
    {
      for (uint64_t k = 0; k != v36; ++k)
      {
        if (*(void *)v205 != v37) {
          objc_enumerationMutation(v35);
        }
        uint64_t v38 = *(void *)(*((void *)&v204 + 1) + 8 * k);
        if ([v147 containsObject:objc_opt_class()]) {
          [v146 addObject:v38];
        }
      }
      uint64_t v36 = [(NSArray *)v35 countByEnumeratingWithState:&v204 objects:v249 count:16];
    }
    while (v36);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v245 = 0x3032000000;
  v246 = __Block_byref_object_copy_;
  v247 = __Block_byref_object_dispose_;
  id v248 = [v149 selfMetadata];
  uint64_t v198 = 0;
  v199 = &v198;
  uint64_t v200 = 0x3032000000;
  v201 = __Block_byref_object_copy_;
  v202 = __Block_byref_object_dispose_;
  id v203 = [v149 dataDispatcherContext];
  v39 = [(CDMDynamicConfig *)self->_currentConfig graphName];
  int v40 = [NSClassFromString(v39) requiresAssets];

  if (!v40)
  {
    v46 = CDMOSLoggerForCategory(3);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v239) = 136315138;
      *(void *)((char *)&v239 + 4) = "-[CDMServiceCenter handleSetup:forCallback:]";
      _os_log_debug_impl(&dword_2263A0000, v46, OS_LOG_TYPE_DEBUG, "%s Assets paths have been provided in CDMDynamicConfig. Skip calling setupAssets.", (uint8_t *)&v239, 0xCu);
    }
    goto LABEL_43;
  }
  v41 = CDMOSLoggerForCategory(4);
  v42 = v41;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
  {
    LOWORD(v239) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v42, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CDMServiceCenterAssetsSetup", "CDM Service Center Assets Setup enableTelemetry=YES", (uint8_t *)&v239, 2u);
  }

  v43 = [v149 dynamicConfig];
  v44 = [v43 assetPaths];
  BOOL v45 = v44 == 0;

  if (!v45)
  {
    v46 = CDMOSLoggerForCategory(3);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v239) = 136315138;
      *(void *)((char *)&v239 + 4) = "-[CDMServiceCenter handleSetup:forCallback:]";
      _os_log_debug_impl(&dword_2263A0000, v46, OS_LOG_TYPE_DEBUG, "%s Assets paths have been provided in CDMDynamicConfig. Skip calling setupAssets.", (uint8_t *)&v239, 0xCu);
    }
LABEL_43:

    goto LABEL_44;
  }
  *(void *)&long long v239 = 0;
  *((void *)&v239 + 1) = &v239;
  uint64_t v240 = 0x3032000000;
  v241 = __Block_byref_object_copy_;
  v242 = __Block_byref_object_dispose_;
  id v243 = 0;
  cdmServiceCenterQueue = self->_cdmServiceCenterQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke;
  block[3] = &unk_2647A40C0;
  block[4] = self;
  id v194 = v136;
  v195 = &v239;
  p_long long buf = &buf;
  v197 = &v198;
  dispatch_block_t v61 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
  dispatch_sync(cdmServiceCenterQueue, v61);

  if (!*(void *)(*((void *)&v239 + 1) + 40))
  {

    _Block_object_dispose(&v239, 8);
LABEL_44:
    v47 = CDMOSLoggerForCategory(3);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      LODWORD(v239) = 136315138;
      *(void *)((char *)&v239 + 4) = "-[CDMServiceCenter handleSetup:forCallback:]";
      _os_log_impl(&dword_2263A0000, v47, OS_LOG_TYPE_INFO, "%s [insights-cdm-assets]:\nAssets setup successfully!", (uint8_t *)&v239, 0xCu);
    }

    v48 = CDMOSLoggerForCategory(4);
    v49 = v48;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
    {
      LOWORD(v239) = 0;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v49, OS_SIGNPOST_INTERVAL_END, v9, "CDMServiceCenterAssetsSetup", " enableTelemetry=YES ", (uint8_t *)&v239, 2u);
    }

    if (+[CDMServiceCenterUtils needEmbeddingConfigsFor:v150])
    {
      id v192 = 0;
      [(CDMServiceCenter *)self setupEmbeddingConfigsWithError:&v192];
      id v50 = v192;
      if (v50)
      {
        v51 = v50;
        unint64_t v52 = CDMOSLoggerForCategory(3);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v239) = 136315138;
          *(void *)((char *)&v239 + 4) = "-[CDMServiceCenter handleSetup:forCallback:]";
          _os_log_error_impl(&dword_2263A0000, v52, OS_LOG_TYPE_ERROR, "%s [ERR]: [insights-cdm-assets]:\nFailed to setup CDM embedding configs!", (uint8_t *)&v239, 0xCu);
        }

        v53 = CDMOSLoggerForCategory(4);
        v54 = v53;
        if (v135 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
        {
          LOWORD(v239) = 0;
          _os_signpost_emit_with_name_impl(&dword_2263A0000, v54, OS_SIGNPOST_INTERVAL_END, spid, "CDMServicesSetup", " enableTelemetry=YES ", (uint8_t *)&v239, 2u);
        }

        if (v138)
        {
          id v55 = (void *)MEMORY[0x263F087E8];
          uint64_t v235 = *MEMORY[0x263F08320];
          v236 = @"Failed to setup CDM embedding configs!";
          v56 = [NSDictionary dictionaryWithObjects:&v236 forKeys:&v235 count:1];
          uint64_t v57 = [v55 errorWithDomain:@"CDMServiceCenter" code:2 userInfo:v56];

          v138[2](v138, 0, v57);
        }

        goto LABEL_148;
      }
      uint64_t v58 = CDMOSLoggerForCategory(3);
      if (!os_log_type_enabled(v58, OS_LOG_TYPE_INFO)) {
        goto LABEL_76;
      }
      LODWORD(v239) = 136315138;
      *(void *)((char *)&v239 + 4) = "-[CDMServiceCenter handleSetup:forCallback:]";
      v59 = "%s [insights-cdm-assets]:\nCDM embedding configs setup successfully!";
    }
    else
    {
      uint64_t v58 = CDMOSLoggerForCategory(3);
      if (!os_log_type_enabled(v58, OS_LOG_TYPE_INFO)) {
        goto LABEL_76;
      }
      LODWORD(v239) = 136315138;
      *(void *)((char *)&v239 + 4) = "-[CDMServiceCenter handleSetup:forCallback:]";
      v59 = "%s Skipping embeddings config; no embedding service.";
    }
    _os_log_impl(&dword_2263A0000, v58, OS_LOG_TYPE_INFO, v59, (uint8_t *)&v239, 0xCu);
LABEL_76:

    v74 = [CDMSetupRequestCommand alloc];
    v145 = [(CDMSetupRequestCommand *)v74 initWithDynamicConfig:self->_currentConfig selfMetadata:*(void *)(*((void *)&buf + 1) + 40) dataDispatcherContext:v199[5]];
    if (v150 && [v150 count])
    {
      *(void *)&long long v239 = 0;
      *((void *)&v239 + 1) = &v239;
      uint64_t v240 = 0x3032000000;
      v241 = __Block_byref_object_copy_;
      v242 = __Block_byref_object_dispose_;
      objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v150, "count"));
      id v243 = (id)objc_claimAutoreleasedReturnValue();
      *(void *)v229 = 0;
      *(void *)&v229[8] = v229;
      *(void *)&v229[16] = 0x3032000000;
      v230 = __Block_byref_object_copy_;
      v231 = __Block_byref_object_dispose_;
      objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v150, "count"));
      id v232 = (id)objc_claimAutoreleasedReturnValue();
      v190[0] = 0;
      v190[1] = v190;
      v190[2] = 0x3032000000;
      v190[3] = __Block_byref_object_copy_;
      v190[4] = __Block_byref_object_dispose_;
      v75 = [CDMWarmupRequestCommand alloc];
      v191 = [(CDMWarmupRequestCommand *)v75 initWithDynamicConfig:self->_currentConfig selfMetadata:*(void *)(*((void *)&buf + 1) + 40)];
      int v134 = [v149 shouldPerformWarmup];
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_537;
      aBlock[3] = &unk_2647A4108;
      void aBlock[4] = &v239;
      aBlock[5] = v229;
      v143 = _Block_copy(aBlock);
      +[CDMSELFLogUtil cdmAllServicesSetupStarted:*(void *)(*((void *)&buf + 1) + 40) logMessage:@"SELF all services setup started message emitted" dataDispatcherContext:v199[5]];
      uint64_t v183 = 0;
      v184 = &v183;
      uint64_t v185 = 0x3032000000;
      v186 = __Block_byref_object_copy_;
      v187 = __Block_byref_object_dispose_;
      id v188 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v150, "count"));
      long long v179 = 0u;
      long long v180 = 0u;
      long long v181 = 0u;
      long long v182 = 0u;
      obuint64_t j = v150;
      uint64_t v76 = [obj countByEnumeratingWithState:&v179 objects:v228 count:16];
      if (v76)
      {
        uint64_t v77 = *(void *)v180;
        do
        {
          for (uint64_t k = 0; k != v76; ++k)
          {
            if (*(void *)v180 != v77) {
              objc_enumerationMutation(obj);
            }
            v78 = *(void **)(*((void *)&v179 + 1) + 8 * k);
            v79 = *(void **)(*((void *)&v239 + 1) + 40);
            v80 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v78, "serviceState"));
            v81 = [v78 serviceName];
            [v79 setObject:v80 forKey:v81];

            id v82 = objc_alloc_init(MEMORY[0x263F6E5D8]);
            v83 = [v78 serviceName];
            uint64_t v84 = +[CDMSELFLogUtil stringServiceTypeToEnum:v83];

            if (!v84)
            {
              v85 = CDMOSLoggerForCategory(3);
              if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
              {
                v86 = [v78 serviceName];
                *(_DWORD *)v224 = 136315394;
                *(void *)&v224[4] = "-[CDMServiceCenter handleSetup:forCallback:]";
                *(_WORD *)&v224[12] = 2114;
                *(void *)&v224[14] = v86;
                _os_log_impl(&dword_2263A0000, v85, OS_LOG_TYPE_INFO, "%s [WARN]: Unmapped CDM service type name for setup: %{public}@", v224, 0x16u);
              }
            }
            [v82 setServiceType:v84];
            v87 = (void *)v184[5];
            v88 = [v78 serviceName];
            [v87 setObject:v82 forKey:v88];
          }
          uint64_t v76 = [obj countByEnumeratingWithState:&v179 objects:v228 count:16];
        }
        while (v76);
      }

      id v89 = objc_alloc(MEMORY[0x263EFF980]);
      v139 = objc_msgSend(v89, "initWithCapacity:", objc_msgSend(*(id *)(*((void *)&v239 + 1) + 40), "count"));
      [*(id *)(*(void *)&v229[8] + 40) removeAllObjects];
      group = dispatch_group_create();
      long long v175 = 0u;
      long long v176 = 0u;
      long long v177 = 0u;
      long long v178 = 0u;
      id obja = obj;
      uint64_t v90 = [obja countByEnumeratingWithState:&v175 objects:v227 count:16];
      if (v90)
      {
        uint64_t v91 = *(void *)v176;
        uint64_t k = (uint64_t)v170;
        do
        {
          for (uint64_t m = 0; m != v90; ++m)
          {
            if (*(void *)v176 != v91) {
              objc_enumerationMutation(obja);
            }
            uint64_t v93 = *(void *)(*((void *)&v175 + 1) + 8 * m);
            dispatch_group_enter(group);
            v169[0] = MEMORY[0x263EF8330];
            v169[1] = 3221225472;
            v170[0] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_544;
            v170[1] = &unk_2647A4130;
            v170[2] = v93;
            v174 = &v183;
            v171 = v145;
            id v173 = v143;
            v172 = group;
            dispatch_block_t v94 = dispatch_block_create((dispatch_block_flags_t)0, v169);
            dispatch_async((dispatch_queue_t)self->_cdmServiceCenterQueue, v94);
          }
          uint64_t v90 = [obja countByEnumeratingWithState:&v175 objects:v227 count:16];
        }
        while (v90);
      }

      dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
      long long v167 = 0u;
      long long v168 = 0u;
      long long v165 = 0u;
      long long v166 = 0u;
      v95 = [*(id *)(*((void *)&v239 + 1) + 40) allKeys];
      uint64_t v96 = [v95 countByEnumeratingWithState:&v165 objects:v226 count:16];
      if (v96)
      {
        uint64_t v97 = *(void *)v166;
        char v98 = 1;
        id objb = v95;
        do
        {
          for (uint64_t n = 0; n != v96; ++n)
          {
            if (*(void *)v166 != v97) {
              objc_enumerationMutation(objb);
            }
            uint64_t v100 = *(void *)(*((void *)&v165 + 1) + 8 * n);
            if ([(CDMServiceCenter *)self isServiceNotReady:v100 withServiceStateMap:*(void *)(*((void *)&v239 + 1) + 40)])
            {
              v101 = [*(id *)(*(void *)&v229[8] + 40) objectForKey:v100];
              v102 = NSString;
              v103 = [*(id *)(*((void *)&v239 + 1) + 40) objectForKeyedSubscript:v100];
              if (v101)
              {
                uint64_t k = [v101 localizedDescription];
                v104 = (__CFString *)k;
              }
              else
              {
                v104 = @"Service timed out";
              }
              v105 = [v102 stringWithFormat:@"Service: %@, State: %@, Error: %@", v100, v103, v104];
              [v139 addObject:v105];

              if (v101)
              {

                v106 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
                v161[0] = MEMORY[0x263EF8330];
                v161[1] = 3221225472;
                v161[2] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_554;
                v161[3] = &unk_2647A4180;
                v163 = &v183;
                v161[4] = v100;
                v162 = v101;
                dispatch_async(v106, v161);

                v107 = v162;
              }
              else
              {

                v107 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
                v164[0] = MEMORY[0x263EF8330];
                v164[1] = 3221225472;
                v164[2] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_553;
                v164[3] = &unk_2647A4158;
                v164[4] = v100;
                v164[5] = &v183;
                dispatch_async(v107, v164);
              }

              char v98 = 0;
            }
          }
          v95 = objb;
          uint64_t v96 = [objb countByEnumeratingWithState:&v165 objects:v226 count:16];
        }
        while (v96);
      }
      else
      {
        char v98 = 1;
      }

      +[CDMDataDispatcher dispatchServiceSetupMetrics:v184[5] selfMetadata:*(void *)(*((void *)&buf + 1) + 40) dataDispatcherContext:v199[5]];
      v114 = CDMOSLoggerForCategory(4);
      v115 = v114;
      if (v135 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v114))
      {
        *(_WORD *)v224 = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v115, OS_SIGNPOST_INTERVAL_END, spid, "CDMServicesSetup", " enableTelemetry=YES ", v224, 2u);
      }

      v116 = dispatch_group_create();
      *(void *)v224 = 0;
      *(void *)&v224[8] = v224;
      *(void *)&v224[16] = 0x2020000000;
      char v225 = 1;
      dispatch_group_enter(v116);
      v157[0] = MEMORY[0x263EF8330];
      v157[1] = 3221225472;
      v157[2] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_556;
      v157[3] = &unk_2647A4180;
      id v158 = v146;
      v160 = v224;
      v117 = v116;
      v159 = v117;
      dispatch_block_t v118 = dispatch_block_create((dispatch_block_flags_t)0, v157);
      dispatch_async((dispatch_queue_t)self->_cdmServiceCenterQueue, v118);
      dispatch_group_wait(v117, 0xFFFFFFFFFFFFFFFFLL);
      if (v98)
      {
        if (*(unsigned char *)(*(void *)&v224[8] + 24))
        {
          [(CDMServiceCenter *)self setSystemState:3];
          v119 = CDMOSLoggerForCategory(3);
          if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v220 = 136315138;
            v221 = "-[CDMServiceCenter handleSetup:forCallback:]";
            _os_log_impl(&dword_2263A0000, v119, OS_LOG_TYPE_INFO, "%s [insights-cdm-summary]:\nCDM setup successful", v220, 0xCu);
          }

          if (!+[CDMServiceCenterUtils isHostedInDaemon])
          {
            v120 = (OS_os_transaction *)os_transaction_create();
            transactiouint64_t n = self->transaction;
            self->transactiouint64_t n = v120;
          }
          v138[2](v138, 0, 0);
          +[CDMSELFLogUtil cdmAllServicesSetupEnded:*(void *)(*((void *)&buf + 1) + 40) logMessage:@"SELF all services setup ended message emitted" dataDispatcherContext:v199[5]];
          if (v134)
          {
            objc_initWeak((id *)v220, self);
            v151[0] = MEMORY[0x263EF8330];
            v151[1] = 3221225472;
            v151[2] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_564;
            v151[3] = &unk_2647A41F8;
            objc_copyWeak(&v156, (id *)v220);
            v154 = &v198;
            v155 = v190;
            id v152 = &__block_literal_global;
            v153 = &buf;
            dispatch_block_t v122 = dispatch_block_create((dispatch_block_flags_t)0, v151);
            dispatch_async((dispatch_queue_t)self->_cdmServiceCenterQueue, v122);

            objc_destroyWeak(&v156);
            objc_destroyWeak((id *)v220);
          }
          else
          {
            v133 = CDMOSLoggerForCategory(3);
            if (os_log_type_enabled(v133, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v220 = 136315138;
              v221 = "-[CDMServiceCenter handleSetup:forCallback:]";
              _os_log_debug_impl(&dword_2263A0000, v133, OS_LOG_TYPE_DEBUG, "%s Not performing warmup as part of setup", v220, 0xCu);
            }
          }
        }
        else
        {
          [(CDMServiceCenter *)self setSystemState:4];
          if (v138)
          {
            v128 = [NSString stringWithFormat:@"CDM failed to setup. Not all required graph services setup successfully"];
            v129 = CDMOSLoggerForCategory(3);
            if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v220 = 136315394;
              v221 = "-[CDMServiceCenter handleSetup:forCallback:]";
              __int16 v222 = 2114;
              v223 = v128;
              _os_log_error_impl(&dword_2263A0000, v129, OS_LOG_TYPE_ERROR, "%s [ERR]: [insights-cdm-summary]:\n%{public}@", v220, 0x16u);
            }

            v130 = (void *)MEMORY[0x263F087E8];
            uint64_t v216 = *MEMORY[0x263F08320];
            v217 = v128;
            v131 = [NSDictionary dictionaryWithObjects:&v217 forKeys:&v216 count:1];
            v132 = [v130 errorWithDomain:@"CDMServiceCenter" code:4 userInfo:v131];

            v138[2](v138, 0, v132);
          }
        }
      }
      else
      {
        [(CDMServiceCenter *)self setSystemState:4];
        if (v138)
        {
          v123 = [NSString stringWithFormat:@"CDM failed to setup. The following services are not in ready or disabled state: %@", v139];
          v124 = CDMOSLoggerForCategory(3);
          if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v220 = 136315394;
            v221 = "-[CDMServiceCenter handleSetup:forCallback:]";
            __int16 v222 = 2114;
            v223 = v123;
            _os_log_error_impl(&dword_2263A0000, v124, OS_LOG_TYPE_ERROR, "%s [ERR]: [insights-cdm-summary]:\n%{public}@", v220, 0x16u);
          }

          v125 = (void *)MEMORY[0x263F087E8];
          uint64_t v218 = *MEMORY[0x263F08320];
          v219 = v123;
          v126 = [NSDictionary dictionaryWithObjects:&v219 forKeys:&v218 count:1];
          v127 = [v125 errorWithDomain:@"CDMServiceCenter" code:4 userInfo:v126];

          v138[2](v138, 0, v127);
        }
        if (v134) {
          +[CDMSELFLogUtil cdmAllServicesWarmupFailed:*(void *)(*((void *)&buf + 1) + 40) logMessage:@"SELF all services warmup failed message emitted" dataDispatcherContext:v199[5]];
        }
        +[CDMSELFLogUtil cdmAllServicesSetupFailed:*(void *)(*((void *)&buf + 1) + 40) logMessage:@"SELF all services setup failed message emitted" dataDispatcherContext:v199[5]];
      }

      _Block_object_dispose(v224, 8);
      _Block_object_dispose(&v183, 8);

      _Block_object_dispose(v190, 8);
      _Block_object_dispose(v229, 8);

      _Block_object_dispose(&v239, 8);
    }
    else
    {
      v108 = CDMOSLoggerForCategory(3);
      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v239) = 136315138;
        *(void *)((char *)&v239 + 4) = "-[CDMServiceCenter handleSetup:forCallback:]";
        _os_log_error_impl(&dword_2263A0000, v108, OS_LOG_TYPE_ERROR, "%s [ERR]: No services found to setup", (uint8_t *)&v239, 0xCu);
      }

      if (v138)
      {
        v109 = CDMOSLoggerForCategory(4);
        v110 = v109;
        if (v135 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v109))
        {
          LOWORD(v239) = 0;
          _os_signpost_emit_with_name_impl(&dword_2263A0000, v110, OS_SIGNPOST_INTERVAL_END, spid, "CDMServicesSetup", " enableTelemetry=YES ", (uint8_t *)&v239, 2u);
        }

        v111 = (void *)MEMORY[0x263F087E8];
        uint64_t v233 = *MEMORY[0x263F08320];
        v234 = @"No services found to setup";
        v112 = [NSDictionary dictionaryWithObjects:&v234 forKeys:&v233 count:1];
        v113 = [v111 errorWithDomain:@"CDMServiceCenter" code:3 userInfo:v112];

        v138[2](v138, 0, v113);
      }
    }

    goto LABEL_148;
  }
  [(CDMServiceCenter *)self setSystemState:4];
  v62 = NSString;
  long long v63 = [*(id *)(*((void *)&v239 + 1) + 40) localizedDescription];
  long long v64 = [*(id *)(*((void *)&v239 + 1) + 40) localizedFailureReason];
  long long v65 = [v62 stringWithFormat:@"Failed to setup assets with error:\nDescription: %@\nReason: %@\nAbort setup.", v63, v64];

  long long v66 = CDMOSLoggerForCategory(3);
  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v229 = 136315394;
    *(void *)&v229[4] = "-[CDMServiceCenter handleSetup:forCallback:]";
    *(_WORD *)&v229[12] = 2114;
    *(void *)&v229[14] = v65;
    _os_log_error_impl(&dword_2263A0000, v66, OS_LOG_TYPE_ERROR, "%s [ERR]: [insights-cdm-assets]:\n%{public}@", v229, 0x16u);
  }

  long long v67 = CDMOSLoggerForCategory(4);
  long long v68 = v67;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
  {
    *(_WORD *)v229 = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v68, OS_SIGNPOST_INTERVAL_END, v9, "CDMServiceCenterAssetsSetup", " enableTelemetry=YES ", v229, 2u);
  }

  long long v69 = CDMOSLoggerForCategory(4);
  long long v70 = v69;
  if (v135 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
  {
    *(_WORD *)v229 = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v70, OS_SIGNPOST_INTERVAL_END, spid, "CDMServicesSetup", " enableTelemetry=YES ", v229, 2u);
  }

  if (v138)
  {
    v71 = (void *)MEMORY[0x263F087E8];
    uint64_t v237 = *MEMORY[0x263F08320];
    v238 = v65;
    v72 = [NSDictionary dictionaryWithObjects:&v238 forKeys:&v237 count:1];
    uint64_t v73 = [v71 errorWithDomain:@"CDMServiceCenter" code:1 userInfo:v72];

    v138[2](v138, 0, v73);
  }

  _Block_object_dispose(&v239, 8);
LABEL_148:
  _Block_object_dispose(&v198, 8);

  _Block_object_dispose(&buf, 8);
}

- (BOOL)isServiceNotReady:(id)a3 withServiceStateMap:(id)a4
{
  v4 = [a4 objectForKeyedSubscript:a3];
  BOOL v5 = [v4 integerValue] != 2 && objc_msgSend(v4, "integerValue") != 4;

  return v5;
}

- (void)setupEmbeddingConfigsWithError:(id *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v5 = [CDMEmbeddingConfigs alloc];
  uint64_t v6 = [(CDMDynamicConfig *)self->_currentConfig assetPaths];
  uint64_t v7 = [(CDMDynamicConfig *)self->_currentConfig embeddingVersion];
  uint64_t v8 = [(CDMEmbeddingConfigs *)v5 initWithAssetPaths:v6 embeddingVersion:v7];

  id v11 = 0;
  [(CDMEmbeddingConfigs *)v8 setupWithError:&v11];
  id v9 = v11;
  if (v9)
  {
    v10 = CDMOSLoggerForCategory(3);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      long long v13 = "-[CDMServiceCenter setupEmbeddingConfigsWithError:]";
      _os_log_error_impl(&dword_2263A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: Error occurs while setup setup CDM embedding configs.", buf, 0xCu);
    }

    *a3 = v9;
  }
  else
  {
    [(CDMDynamicConfig *)self->_currentConfig setEmbeddingConfigs:v8];
  }
}

- (void)setupAssetsForCDMAssetsInfo:(id)a3 withError:(id *)a4 andSelfMetadata:(id)a5 dataDispatcherContext:(id)a6
{
  v64[1] = *MEMORY[0x263EF8340];
  id v54 = a3;
  id v9 = a5;
  id v10 = a6;
  os_signpost_id_t v11 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v12 = (id)CDMLogContext;
  long long v13 = v12;
  unint64_t v52 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CDMServiceCenterSetupAssetsForServices", "CDM Service Center setupAssetsForServices enableTelemetry=YES", buf, 2u);
  }
  os_signpost_id_t spid = v11;

  id v14 = objc_alloc_init(MEMORY[0x263F08C38]);
  +[CDMSELFLogUtil cdmAssetSetupStarted:v9 contextId:v14 serviceNames:0 logMessage:@"SELF asset setup started message emitted" dataDispatcherContext:v10];
  long long v15 = +[CDMAssetsManager getSingletonCDMAssetsManager];
  Class v16 = self;
  objc_sync_enter(v16);
  v17 = [(CDMDynamicConfig *)v16->_currentConfig graphName];
  Class v18 = NSClassFromString(v17);
  uint64_t v19 = [(CDMDynamicConfig *)v16->_currentConfig languageCode];
  uint64_t v20 = [(objc_class *)v18 getAssetsForSetup:v19];

  v21 = [(CDMDynamicConfig *)v16->_currentConfig languageCode];
  LODWORD(v17) = [v15 shouldReSetupForLocale:v21 cdmAssetsInfo:v20];

  if (v17
    && (id v56 = 0,
        [(CDMServiceCenter *)v16 setupCDMAssetManagerWithError:&v56],
        (id v22 = v56) != 0))
  {
    v23 = v22;
    v24 = NSString;
    v25 = [(CDMDynamicConfig *)v16->_currentConfig languageCode];
    uint64_t v26 = [(CDMDynamicConfig *)v16->_currentConfig assetDirPath];
    id v50 = [v24 stringWithFormat:@"Error occurs while initializing CDMAssetsManager with locale: %@, asset dir path: %@.", v25, v26];

    uint64_t v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v63 = *MEMORY[0x263F08320];
    v64[0] = v50;
    v28 = [NSDictionary dictionaryWithObjects:v64 forKeys:&v63 count:1];
    *a4 = [v27 errorWithDomain:@"CDMServiceCenter" code:0 userInfo:v28];

    uint64_t v29 = CDMOSLoggerForCategory(3);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      v60 = "-[CDMServiceCenter setupAssetsForCDMAssetsInfo:withError:andSelfMetadata:dataDispatcherContext:]";
      __int16 v61 = 2114;
      v62 = v50;
      _os_log_error_impl(&dword_2263A0000, v29, OS_LOG_TYPE_ERROR, "%s [ERR]: %{public}@", buf, 0x16u);
    }

    v30 = [v23 userInfo];
    BOOL v31 = [v30 objectForKey:@"CDMAssetSetupErrorDomain"];

    +[CDMSELFLogUtil cdmAssetSetupFailed:contextId:errorDomain:errorCode:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmAssetSetupFailed:contextId:errorDomain:errorCode:logMessage:dataDispatcherContext:", v9, v14, [v31 intValue], objc_msgSend(v23, "code"), @"SELF asset setup failed (CDMAssetsManager initialization error) message emitted", v10);
    v32 = (id)CDMLogContext;
    v33 = v32;
    if (v52 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v33, OS_SIGNPOST_INTERVAL_END, spid, "CDMServiceCenterSetupAssetsForServices", " enableTelemetry=YES ", buf, 2u);
    }

    objc_sync_exit(v16);
  }
  else
  {

    objc_sync_exit(v16);
    currentConfig = v16->_currentConfig;
    p_currentConfig = (id *)&v16->_currentConfig;
    uint64_t v36 = [(CDMDynamicConfig *)currentConfig assetDirPath];
    uint64_t v37 = (void *)MEMORY[0x263EFF960];
    uint64_t v38 = [*p_currentConfig languageCode];
    v39 = [v37 localeWithLocaleIdentifier:v38];
    int v40 = [v15 getAssetsByFactorNamesForCDMAssetsInfo:v54 assetDirPath:v36 locale:v39];
    [(CDMDynamicConfig *)currentConfig setAssetPaths:v40];

    uint64_t v41 = [*p_currentConfig assetCollection];
    v42 = [(id)v41 assetPaths];
    +[CDMSELFLogUtil cdmAssetsReported:v42 metadata:v9 dataDispatcherContext:v10];

    v43 = [*p_currentConfig assetPaths];
    id v55 = 0;
    LOBYTE(v41) = [v15 areAssetsAvailableForCDMAssetsInfo:v54 factorToAsset:v43 withError:&v55 withSelfMetadata:v9 withSelfContextId:v14 withDataDispatcherContext:v10];
    Class v16 = (CDMServiceCenter *)v55;

    if (v41)
    {
      +[CDMSELFLogUtil cdmAssetSetupEnded:v9 contextId:v14 logMessage:@"SELF asset setup ended message emitted" dataDispatcherContext:v10];
      v44 = (id)CDMLogContext;
      BOOL v45 = v44;
      if (v52 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v44))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v45, OS_SIGNPOST_INTERVAL_END, spid, "CDMServiceCenterSetupAssetsForServices", " enableTelemetry=YES ", buf, 2u);
      }
    }
    else
    {
      v46 = (void *)MEMORY[0x263F087E8];
      v57[0] = *MEMORY[0x263F08320];
      v47 = [(CDMServiceCenter *)v16 localizedDescription];
      v58[0] = v47;
      v57[1] = *MEMORY[0x263F08338];
      v48 = [(CDMServiceCenter *)v16 localizedFailureReason];
      v58[1] = v48;
      v49 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
      *a4 = [v46 errorWithDomain:@"CDMServiceCenter" code:0 userInfo:v49];

      +[CDMSELFLogUtil cdmAssetSetupFailed:v9 contextId:v14 errorDomain:2 errorCode:1 logMessage:@"SELF asset setup failed (not all assets available) message emitted" dataDispatcherContext:v10];
    }
  }
}

- (void)mergeConfig:(id)a3
{
  id v73 = a3;
  uint64_t v4 = [v73 languageCode];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    uint64_t v6 = [v73 languageCode];
    uint64_t v7 = [(CDMDynamicConfig *)self->_currentConfig languageCode];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      currentConfig = self->_currentConfig;
      id v10 = [v73 languageCode];
      [(CDMDynamicConfig *)currentConfig setLanguageCode:v10];
    }
  }
  uint64_t v11 = [v73 embeddingVersion];
  if (v11)
  {
    v12 = (void *)v11;
    long long v13 = [v73 embeddingVersion];
    id v14 = [(CDMDynamicConfig *)self->_currentConfig embeddingVersion];
    char v15 = [v13 isEqualToString:v14];

    if ((v15 & 1) == 0)
    {
      Class v16 = self->_currentConfig;
      v17 = [v73 embeddingVersion];
      [(CDMDynamicConfig *)v16 setEmbeddingVersion:v17];
    }
  }
  uint64_t v18 = [v73 graphName];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    uint64_t v20 = [v73 graphName];
    v21 = [(CDMDynamicConfig *)self->_currentConfig graphName];
    char v22 = [v20 isEqualToString:v21];

    if ((v22 & 1) == 0)
    {
      v23 = self->_currentConfig;
      v24 = [v73 graphName];
      [(CDMDynamicConfig *)v23 setGraphName:v24];
    }
  }
  uint64_t v25 = [v73 siriVocabularySandboxId];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    uint64_t v27 = [v73 siriVocabularySandboxId];
    v28 = [(CDMDynamicConfig *)self->_currentConfig siriVocabularySandboxId];
    char v29 = [v27 isEqualToString:v28];

    if ((v29 & 1) == 0)
    {
      v30 = self->_currentConfig;
      BOOL v31 = [v73 siriVocabularySandboxId];
      [(CDMDynamicConfig *)v30 setSiriVocabularySandboxId:v31];
    }
  }
  uint64_t v32 = [v73 assetPaths];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [v73 assetPaths];
    v35 = [(CDMDynamicConfig *)self->_currentConfig assetPaths];
    char v36 = [v34 isEqualToDictionary:v35];

    if ((v36 & 1) == 0)
    {
      uint64_t v37 = self->_currentConfig;
      uint64_t v38 = [v73 assetPaths];
      [(CDMDynamicConfig *)v37 setAssetPaths:v38];
    }
  }
  uint64_t v39 = [v73 assetDirPath];
  if (v39)
  {
    int v40 = (void *)v39;
    uint64_t v41 = [v73 assetDirPath];
    v42 = [(CDMDynamicConfig *)self->_currentConfig assetDirPath];
    char v43 = [v41 isEqualToString:v42];

    if ((v43 & 1) == 0)
    {
      v44 = self->_currentConfig;
      BOOL v45 = [v73 assetDirPath];
      [(CDMDynamicConfig *)v44 setAssetDirPath:v45];
    }
  }
  uint64_t v46 = [v73 overrideSiriVocabSpans];
  if (v46)
  {
    v47 = (void *)v46;
    v48 = [v73 overrideSiriVocabSpans];
    v49 = [(CDMDynamicConfig *)self->_currentConfig overrideSiriVocabSpans];
    char v50 = [v48 isEqualToArray:v49];

    if ((v50 & 1) == 0)
    {
      v51 = self->_currentConfig;
      unint64_t v52 = [v73 overrideSiriVocabSpans];
      [(CDMDynamicConfig *)v51 setOverrideSiriVocabSpans:v52];
    }
  }
  uint64_t v53 = [v73 overrideMentions];
  if (v53)
  {
    id v54 = (void *)v53;
    id v55 = [v73 overrideMentions];
    id v56 = [(CDMDynamicConfig *)self->_currentConfig overrideMentions];
    char v57 = [v55 isEqualToArray:v56];

    if ((v57 & 1) == 0)
    {
      uint64_t v58 = self->_currentConfig;
      v59 = [v73 overrideMentions];
      [(CDMDynamicConfig *)v58 setOverrideMentions:v59];
    }
  }
  uint64_t v60 = [v73 overrideContextualSpans];
  if (v60)
  {
    __int16 v61 = (void *)v60;
    v62 = [v73 overrideContextualSpans];
    uint64_t v63 = [(CDMDynamicConfig *)self->_currentConfig overrideContextualSpans];
    char v64 = [v62 isEqualToArray:v63];

    if ((v64 & 1) == 0)
    {
      long long v65 = self->_currentConfig;
      long long v66 = [v73 overrideContextualSpans];
      [(CDMDynamicConfig *)v65 setOverrideContextualSpans:v66];
    }
  }
  uint64_t v67 = [v73 serviceStateDirectory];
  if (v67)
  {
    long long v68 = (void *)v67;
    long long v69 = [v73 serviceStateDirectory];
    long long v70 = [(CDMDynamicConfig *)self->_currentConfig serviceStateDirectory];
    char v71 = [v69 isEqualToString:v70];

    if ((v71 & 1) == 0)
    {
      v72 = [v73 serviceStateDirectory];
      [(CDMDynamicConfig *)self->_currentConfig setServiceStateDirectory:v72];
    }
  }
}

- (void)setupCDMAssetManagerWithError:(id *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  os_signpost_id_t v5 = os_signpost_id_generate((os_log_t)CDMLogContext);
  uint64_t v6 = (id)CDMLogContext;
  uint64_t v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "CDMServiceCenterAssetsSetup", "CDM Service Center setupCDMAssetManagerWithError enableTelemetry=YES", buf, 2u);
  }

  char v8 = [(CDMDynamicConfig *)self->_currentConfig graphName];
  Class v9 = NSClassFromString(v8);
  id v10 = [(CDMDynamicConfig *)self->_currentConfig languageCode];
  uint64_t v11 = [(objc_class *)v9 getAssetsForSetup:v10];

  v12 = +[CDMAssetsManager getSingletonCDMAssetsManager];
  long long v13 = (void *)MEMORY[0x263EFF960];
  id v14 = [(CDMDynamicConfig *)self->_currentConfig languageCode];
  char v15 = [v13 localeWithLocaleIdentifier:v14];
  id v22 = 0;
  [v12 setupForLocale:v15 cdmAssetsInfo:v11 error:&v22];
  id v16 = v22;

  v17 = (id)CDMLogContext;
  uint64_t v18 = v17;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v18, OS_SIGNPOST_INTERVAL_END, v5, "CDMServiceCenterAssetsSetup", " enableTelemetry=YES ", buf, 2u);
  }

  if (v16)
  {
    uint64_t v19 = CDMOSLoggerForCategory(3);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [(CDMDynamicConfig *)self->_currentConfig languageCode];
      v21 = [(CDMDynamicConfig *)self->_currentConfig assetDirPath];
      *(_DWORD *)long long buf = 136315650;
      v24 = "-[CDMServiceCenter setupCDMAssetManagerWithError:]";
      __int16 v25 = 2114;
      uint64_t v26 = v20;
      __int16 v27 = 2114;
      v28 = v21;
      _os_log_error_impl(&dword_2263A0000, v19, OS_LOG_TYPE_ERROR, "%s [ERR]: Error occurs while setup CDMAssetsManager with locale: %{public}@, asset dir path: %{public}@. Return NO.", buf, 0x20u);
    }
    *a3 = v16;
  }
}

- (void)handleCommand:(id)a3 forCallback:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (+[CDMServiceCenterUtils isServiceCenterEnabled:self->_config])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      cdmServiceCenterQueue = self->_cdmServiceCenterQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __46__CDMServiceCenter_handleCommand_forCallback___block_invoke;
      block[3] = &unk_2647A5038;
      block[4] = self;
      id v29 = v6;
      id v30 = v7;
      dispatch_async(cdmServiceCenterQueue, block);

      Class v9 = v29;
LABEL_6:

      goto LABEL_21;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = self->_cdmServiceCenterQueue;
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __46__CDMServiceCenter_handleCommand_forCallback___block_invoke_2;
      v25[3] = &unk_2647A5038;
      v25[4] = self;
      id v26 = v6;
      id v27 = v7;
      dispatch_async(v10, v25);

      Class v9 = v26;
      goto LABEL_6;
    }
    if ([(CDMServiceCenter *)self systemState] == 3)
    {
      uint64_t v11 = [v6 commandName];
      v12 = [(NSMutableDictionary *)self->_commandServicesDict objectForKeyedSubscript:v11];
      if (v12)
      {
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __46__CDMServiceCenter_handleCommand_forCallback___block_invoke_484;
        v20[3] = &unk_2647A4070;
        id v21 = v6;
        id v22 = self;
        id v24 = v7;
        v23 = v11;
        [v12 enumerateObjectsUsingBlock:v20];

        long long v13 = v21;
      }
      else
      {
        v17 = CDMOSLoggerForCategory(3);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315394;
          char v36 = "-[CDMServiceCenter handleCommand:forCallback:]";
          __int16 v37 = 2114;
          uint64_t v38 = v11;
          _os_log_error_impl(&dword_2263A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: No service found for command %{public}@", buf, 0x16u);
        }

        if (!v7) {
          goto LABEL_19;
        }
        uint64_t v18 = (void *)MEMORY[0x263F087E8];
        uint64_t v31 = *MEMORY[0x263F08320];
        uint64_t v32 = @"No service found for command";
        uint64_t v19 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        long long v13 = [v18 errorWithDomain:@"CDMServiceCenter" code:0 userInfo:v19];

        (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
      }

LABEL_19:
      goto LABEL_20;
    }
    id v14 = CDMOSLoggerForCategory(3);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      char v36 = "-[CDMServiceCenter handleCommand:forCallback:]";
      __int16 v37 = 2114;
      uint64_t v38 = @"Handle command called but CDM system is not ready";
      _os_log_error_impl(&dword_2263A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: %{public}@", buf, 0x16u);
    }

    if (v7)
    {
      char v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v33 = *MEMORY[0x263F08320];
      v34 = @"Handle command called but CDM system is not ready";
      id v16 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      uint64_t v11 = [v15 errorWithDomain:@"CDMServiceCenter" code:0 userInfo:v16];

      (*((void (**)(id, void, __CFString *))v7 + 2))(v7, 0, v11);
LABEL_20:
    }
  }
LABEL_21:
}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = a1[7];
  uint64_t v4 = *(void *)(a1[6] + 8);
  obuint64_t j = *(id *)(v4 + 40);
  [v2 setupAssetsForCDMAssetsInfo:v1 withError:&obj andSelfMetadata:*(void *)(*(void *)(v3 + 8) + 40) dataDispatcherContext:*(void *)(*(void *)(a1[8] + 8) + 40)];
  objc_storeStrong((id *)(v4 + 40), obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
  objc_storeStrong((id *)&self->transaction, 0);
  objc_storeStrong((id *)&self->_currentConfig, 0);
  objc_storeStrong((id *)&self->_cdmServiceCenterQueue, 0);
  objc_storeStrong((id *)&self->_serviceGraphRunner, 0);
  objc_storeStrong(&self->_defaultCallback, 0);
  objc_storeStrong((id *)&self->_commandServicesDict, 0);
  objc_storeStrong((id *)&self->_composerService, 0);
  objc_storeStrong((id *)&self->_graphServices, 0);
  objc_storeStrong((id *)&self->_foundationServices, 0);
  objc_storeStrong((id *)&self->_enabledDAGServiceNames, 0);
  objc_storeStrong((id *)&self->_dagServices, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (void)smService:(id)a3 didPublishRequest:(id)a4 withResponseCallback:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = CDMOSLoggerForCategory(3);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = [v9 commandName];
    long long v13 = [v8 serviceName];
    int v14 = 136315650;
    char v15 = "-[CDMServiceCenter smService:didPublishRequest:withResponseCallback:]";
    __int16 v16 = 2112;
    v17 = v12;
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    _os_log_impl(&dword_2263A0000, v11, OS_LOG_TYPE_INFO, "%s Command: %@ Service: %@", (uint8_t *)&v14, 0x20u);
  }
  [(CDMServiceCenter *)self handleCommand:v9 forCallback:v10];
}

- (void)smService:(id)a3 didPublishCommand:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = CDMOSLoggerForCategory(3);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v7 commandName];
    id v10 = [v6 serviceName];
    int v11 = 136315650;
    v12 = "-[CDMServiceCenter smService:didPublishCommand:]";
    __int16 v13 = 2112;
    int v14 = v9;
    __int16 v15 = 2112;
    __int16 v16 = v10;
    _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s Command: %@ Service: %@", (uint8_t *)&v11, 0x20u);
  }
  [(CDMServiceCenter *)self handleCommand:v7 forCallback:self->_defaultCallback];
}

- (int64_t)getSystemState
{
  return self->_systemState;
}

- (id)getFoundationServices
{
  return self->_foundationServices;
}

- (id)getEnabledDAGServiceNames
{
  return self->_enabledDAGServiceNames;
}

- (id)getCurrentConfig
{
  return self->_currentConfig;
}

- (id)getServices
{
  return self->_services;
}

- (id)getAssetPaths
{
  return [(CDMDynamicConfig *)self->_currentConfig assetPaths];
}

- (void)setupAssetsForCDMAssetsInfo:(id)a3 withError:(id *)a4
{
}

- (BOOL)handleXPCActivity:(id)a3 fromIdentifier:(id)a4 withRegister:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v35 = a3;
  id v7 = a4;
  id v34 = a5;
  id v8 = objc_alloc_init(MEMORY[0x263F71D18]);
  id v9 = NSString;
  id v10 = [MEMORY[0x263F08C38] UUID];
  int v11 = [v10 UUIDString];
  v12 = [v9 stringWithFormat:@"%@:0", v11];
  [v8 setIdA:v12];

  __int16 v13 = CDMOSLoggerForCategory(3);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v32 = [v8 idA];
    *(_DWORD *)long long buf = 136315394;
    uint64_t v38 = "-[CDMServiceCenter handleXPCActivity:fromIdentifier:withRegister:]";
    __int16 v39 = 2112;
    int v40 = v32;
    _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s Generated request id with UUID: %@", buf, 0x16u);
  }
  uint64_t v33 = v8;
  int v14 = +[CDMSELFLogUtil createSELFMetadataWithRequestId:v8];
  id v15 = objc_alloc_init(MEMORY[0x263F08C38]);
  __int16 v16 = objc_alloc_init(CDMDataDispatcherContext);
  +[CDMSELFLogUtil cdmXpcProcessingStarted:xpcType:xpcSystemEventType:serviceName:metadata:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmXpcProcessingStarted:xpcType:xpcSystemEventType:serviceName:metadata:logMessage:dataDispatcherContext:", v15, 2, +[CDMSELFLogUtil stringXPCSystemEventTypeToEnum:v7], 0, v14, @"SELF CDM XPC Processing started log emitted", v16);
  uint64_t v17 = objc_alloc_init(CDMConfig);
  __int16 v18 = (void *)MEMORY[0x263EFF960];
  uint64_t v19 = [(CDMConfig *)v17 defaultLocaleIdentifier];
  uint64_t v20 = [v18 localeWithLocaleIdentifier:v19];

  id v36 = 0;
  id v21 = +[CDMServiceCenter getDynamicConfigWithAssetCollectionForGraph:@"CDMNLUServiceGraph" withLocale:v20 withError:&v36 withSelfMetadata:0];
  id v22 = v36;
  if (v22)
  {
    v23 = [NSString stringWithFormat:@"Failed to set up assets. Aborting XPC activity handling for (identifier=%@).", v7];
    id v24 = CDMOSLoggerForCategory(3);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v38 = "-[CDMServiceCenter handleXPCActivity:fromIdentifier:withRegister:]";
      __int16 v39 = 2114;
      int v40 = v23;
      _os_log_error_impl(&dword_2263A0000, v24, OS_LOG_TYPE_ERROR, "%s [ERR]: %{public}@", buf, 0x16u);
    }

    id v25 = v15;
    uint64_t v26 = 3;
LABEL_12:
    +[CDMSELFLogUtil cdmXpcProcessingFailed:v25 reason:v26 errorCode:1 metadata:v14 logMessage:v23 dataDispatcherContext:v16];

    BOOL v29 = 0;
    goto LABEL_13;
  }
  id v27 = [v21 assetCollection];
  char v28 = [v34 handleXPCActivity:v35 fromIdentifier:v7 withAssetCollection:v27 withSelfMetadata:v14];

  if ((v28 & 1) == 0)
  {
    v23 = [NSString stringWithFormat:@"[CDMServiceCenter -handleXPCActivity:fromStream:withRegister:] called with unhandled XPC activity (identifier=%@)", v7];
    id v30 = CDMOSLoggerForCategory(3);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v38 = "-[CDMServiceCenter handleXPCActivity:fromIdentifier:withRegister:]";
      __int16 v39 = 2114;
      int v40 = v23;
      _os_log_error_impl(&dword_2263A0000, v30, OS_LOG_TYPE_ERROR, "%s [ERR]: %{public}@", buf, 0x16u);
    }

    id v25 = v15;
    uint64_t v26 = 2;
    goto LABEL_12;
  }
  +[CDMSELFLogUtil cdmXpcProcessingEnded:v15 metadata:v14 logMessage:@"SELF CDM XPC Processing ended log emitted" dataDispatcherContext:v16];
  BOOL v29 = 1;
LABEL_13:

  return v29;
}

- (BOOL)handleXPCEvent:(id)a3 fromStream:(id)a4 withRegister:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v38 = a5;
  id v9 = objc_alloc_init(MEMORY[0x263F71D18]);
  id v10 = NSString;
  int v11 = [MEMORY[0x263F08C38] UUID];
  v12 = [v11 UUIDString];
  __int16 v13 = [v10 stringWithFormat:@"%@:0", v12];
  [v9 setIdA:v13];

  int v14 = CDMOSLoggerForCategory(3);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    id v34 = [v9 idA];
    *(_DWORD *)long long buf = 136315394;
    uint64_t v41 = "-[CDMServiceCenter handleXPCEvent:fromStream:withRegister:]";
    __int16 v42 = 2112;
    char v43 = v34;
    _os_log_debug_impl(&dword_2263A0000, v14, OS_LOG_TYPE_DEBUG, "%s Generated request id with UUID: %@", buf, 0x16u);
  }
  id v35 = v9;
  id v15 = +[CDMSELFLogUtil createSELFMetadataWithRequestId:v9];
  id v16 = objc_alloc_init(MEMORY[0x263F08C38]);
  uint64_t v17 = +[XPCStreamEventUtils getXPCEventName:v7];
  __int16 v18 = objc_alloc_init(CDMDataDispatcherContext);
  __int16 v37 = (void *)v17;
  +[CDMSELFLogUtil cdmXpcProcessingStarted:xpcType:xpcSystemEventType:serviceName:metadata:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmXpcProcessingStarted:xpcType:xpcSystemEventType:serviceName:metadata:logMessage:dataDispatcherContext:", v16, 1, +[CDMSELFLogUtil stringXPCSystemEventTypeToEnum:v17], 0, v15, @"SELF CDM XPC Processing started log emitted", v18);
  uint64_t v19 = objc_alloc_init(CDMConfig);
  uint64_t v20 = (void *)MEMORY[0x263EFF960];
  id v21 = [(CDMConfig *)v19 defaultLocaleIdentifier];
  id v22 = [v20 localeWithLocaleIdentifier:v21];

  id v39 = 0;
  v23 = +[CDMServiceCenter getDynamicConfigWithAssetCollectionForGraph:@"CDMNLUServiceGraph" withLocale:v22 withError:&v39 withSelfMetadata:0];
  id v24 = v39;
  id v36 = v7;
  if (v24)
  {
    id v25 = v8;
    uint64_t v26 = [NSString stringWithFormat:@"Failed to set up assets. Aborting XPC activity handling for (streamName=%@).", v8];
    id v27 = CDMOSLoggerForCategory(3);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v41 = "-[CDMServiceCenter handleXPCEvent:fromStream:withRegister:]";
      __int16 v42 = 2114;
      char v43 = v26;
      _os_log_error_impl(&dword_2263A0000, v27, OS_LOG_TYPE_ERROR, "%s [ERR]: %{public}@", buf, 0x16u);
    }

    id v28 = v16;
    uint64_t v29 = 3;
LABEL_12:
    +[CDMSELFLogUtil cdmXpcProcessingFailed:v28 reason:v29 errorCode:1 metadata:v15 logMessage:v26 dataDispatcherContext:v18];

    BOOL v31 = 0;
    goto LABEL_13;
  }
  id v30 = v7;
  id v25 = v8;
  if (([v38 handleXPCEvent:v30 fromStream:v8 currentConfig:v23 withSelfMetadata:v15] & 1) == 0)
  {
    uint64_t v26 = [NSString stringWithFormat:@"[CDMServiceCenter -handleXPCEvent:fromStream:withRegister:] called with unhandled XPC event (streamName=%@, eventName=%@)", v8, v37];
    uint64_t v32 = CDMOSLoggerForCategory(3);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v41 = "-[CDMServiceCenter handleXPCEvent:fromStream:withRegister:]";
      __int16 v42 = 2114;
      char v43 = v26;
      _os_log_error_impl(&dword_2263A0000, v32, OS_LOG_TYPE_ERROR, "%s [ERR]: %{public}@", buf, 0x16u);
    }

    id v28 = v16;
    uint64_t v29 = 2;
    goto LABEL_12;
  }
  +[CDMSELFLogUtil cdmXpcProcessingEnded:v16 metadata:v15 logMessage:@"SELF CDM XPC Processing ended log emitted" dataDispatcherContext:v18];
  BOOL v31 = 1;
LABEL_13:

  return v31;
}

- (BOOL)areAssetsAvailable:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v37 = 0;
  [(CDMServiceCenter *)self setupCDMAssetManagerWithError:&v37];
  id v4 = v37;
  if (!v4)
  {
    os_signpost_id_t v5 = +[CDMAssetsManager getSingletonCDMAssetsManager];
    id v7 = [(CDMDynamicConfig *)self->_currentConfig graphName];

    if (v7)
    {
      id v8 = [(CDMDynamicConfig *)self->_currentConfig graphName];
      Class v9 = NSClassFromString(v8);
      id v10 = [(CDMDynamicConfig *)self->_currentConfig languageCode];
      int v11 = [(objc_class *)v9 getAssetsForSetup:v10];

      v12 = [(CDMDynamicConfig *)self->_currentConfig assetPaths];
      id v36 = 0;
      char v6 = [v5 areAssetsAvailableForCDMAssetsInfo:v11 factorToAsset:v12 withError:&v36];
      __int16 v13 = v36;

      obuint64_t j = v13;
      if (!v13)
      {
LABEL_28:

        goto LABEL_29;
      }
      int v14 = CDMOSLoggerForCategory(3);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        int v40 = "-[CDMServiceCenter areAssetsAvailable:]";
        __int16 v41 = 2114;
        __int16 v42 = v13;
        _os_log_error_impl(&dword_2263A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: Assets availability check failed with error: %{public}@.", buf, 0x16u);
      }
    }
    else
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      obuint64_t j = +[CDMServiceCenterUtils getAvailableServiceGraphs:self->_config];
      uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (!v15)
      {
        int v11 = 0;
        char v6 = 1;
        goto LABEL_27;
      }
      uint64_t v16 = v15;
      int v11 = 0;
      int v14 = 0;
      uint64_t v30 = *(void *)v33;
LABEL_11:
      uint64_t v17 = 0;
      __int16 v18 = v11;
      uint64_t v19 = v14;
      while (1)
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(NSString **)(*((void *)&v32 + 1) + 8 * v17);
        Class v21 = NSClassFromString(v20);
        id v22 = [(CDMDynamicConfig *)self->_currentConfig languageCode];
        int v11 = [(objc_class *)v21 getAssetsForSetup:v22];

        v23 = [(CDMDynamicConfig *)self->_currentConfig assetPaths];
        BOOL v31 = v19;
        id v24 = v5;
        char v25 = [v5 areAssetsAvailableForCDMAssetsInfo:v11 factorToAsset:v23 withError:&v31];
        int v14 = v31;

        if ((v25 & 1) == 0) {
          break;
        }
        ++v17;
        __int16 v18 = v11;
        uint64_t v19 = v14;
        os_signpost_id_t v5 = v24;
        if (v16 == v17)
        {
          uint64_t v16 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
          char v6 = 1;
          if (v16) {
            goto LABEL_11;
          }
          id v4 = 0;
          goto LABEL_24;
        }
      }
      uint64_t v26 = CDMOSLoggerForCategory(3);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136315394;
        int v40 = "-[CDMServiceCenter areAssetsAvailable:]";
        __int16 v41 = 2112;
        __int16 v42 = v20;
        _os_log_debug_impl(&dword_2263A0000, v26, OS_LOG_TYPE_DEBUG, "%s Assets not available for graph: %@", buf, 0x16u);
      }

      id v4 = 0;
      os_signpost_id_t v5 = v24;
      if (!v14)
      {
        char v6 = 0;
        goto LABEL_27;
      }
      id v27 = CDMOSLoggerForCategory(3);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        int v40 = "-[CDMServiceCenter areAssetsAvailable:]";
        __int16 v41 = 2114;
        __int16 v42 = v14;
        _os_log_error_impl(&dword_2263A0000, v27, OS_LOG_TYPE_ERROR, "%s [ERR]: Assets availability check failed with error: %{public}@.", buf, 0x16u);
      }

      char v6 = 0;
    }
LABEL_24:

LABEL_27:
    goto LABEL_28;
  }
  os_signpost_id_t v5 = CDMOSLoggerForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315138;
    int v40 = "-[CDMServiceCenter areAssetsAvailable:]";
    _os_log_error_impl(&dword_2263A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: Error occurs while initializing CDMAssetsManager. Return NO.", buf, 0xCu);
  }
  char v6 = 0;
LABEL_29:

  return v6;
}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_537(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v15;
    id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "serviceState"));
    id v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    Class v9 = [v6 serviceName];
    [v8 setObject:v7 forKeyedSubscript:v9];

    id v10 = [v6 cmdError];

    if (v10)
    {
      int v11 = [v6 cmdError];
      v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      __int16 v13 = [v6 serviceName];
      [v12 setObject:v11 forKeyedSubscript:v13];
    }
    else
    {
      if (!v5)
      {
LABEL_7:

        goto LABEL_8;
      }
      int v14 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v11 = [v6 serviceName];
      [v14 setObject:v5 forKeyedSubscript:v11];
    }

    goto LABEL_7;
  }
LABEL_8:
}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_544(uint64_t a1)
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy_;
  v8[4] = __Block_byref_object_dispose_;
  id v9 = [*(id *)(a1 + 32) serviceName];
  uint64_t v2 = mach_absolute_time();
  uint64_t v3 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_2;
  block[3] = &unk_2647A4BB0;
  block[4] = *(void *)(a1 + 64);
  void block[5] = v8;
  block[6] = v2;
  dispatch_async(v3, block);

  [*(id *)(a1 + 32) handleCommand:*(void *)(a1 + 40) withCallback:*(void *)(a1 + 56)];
  uint64_t v4 = mach_absolute_time();
  id v5 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_546;
  v6[3] = &unk_2647A4BB0;
  v6[4] = *(void *)(a1 + 64);
  v6[5] = v8;
  v6[6] = v4;
  dispatch_async(v5, v6);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  _Block_object_dispose(v8, 8);
}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_553(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKey:*(void *)(a1 + 32)];

  if (v2)
  {
    id v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKey:*(void *)(a1 + 32)];
    [v4 setFailureReason:1];
  }
  else
  {
    uint64_t v3 = CDMOSLoggerForCategory(3);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v6 = "-[CDMServiceCenter handleSetup:forCallback:]_block_invoke";
      _os_log_impl(&dword_2263A0000, v3, OS_LOG_TYPE_INFO, "%s [WARN]: Unable to retrieve SELF CDM setup metrics object! This log is likely unusable.", buf, 0xCu);
    }
  }
}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_554(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKey:*(void *)(a1 + 32)];

  if (v2)
  {
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKey:*(void *)(a1 + 32)];
    [v3 setFailureReason:2];

    id v5 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKey:*(void *)(a1 + 32)];
    objc_msgSend(v5, "setErrorCode:", objc_msgSend(*(id *)(a1 + 40), "code"));
  }
  else
  {
    id v4 = CDMOSLoggerForCategory(3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v7 = "-[CDMServiceCenter handleSetup:forCallback:]_block_invoke";
      _os_log_impl(&dword_2263A0000, v4, OS_LOG_TYPE_INFO, "%s [WARN]: Unable to retrieve SELF CDM setup metrics object! This log is likely unusable.", buf, 0xCu);
    }
  }
}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_556(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_2_558;
  v4[3] = &unk_2647A4270;
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  +[CDMGraphServiceUtils setupGraphServices:v1 completionHandler:v4];
}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_564(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    +[CDMSELFLogUtil cdmAllServicesWarmupStarted:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) logMessage:@"SELF all services warmup started message emitted" dataDispatcherContext:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    long long v3 = (void *)WeakRetained[8];
    id v4 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) commandName];
    long long v5 = [v3 objectForKeyedSubscript:v4];

    if (v5)
    {
      dispatch_group_t v6 = dispatch_group_create();
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_2_565;
      v9[3] = &unk_2647A41D0;
      uint64_t v7 = *(void *)(a1 + 56);
      dispatch_group_t v10 = v6;
      uint64_t v13 = v7;
      id v12 = *(id *)(a1 + 32);
      int v11 = WeakRetained;
      uint64_t v8 = v6;
      [v5 enumerateObjectsUsingBlock:v9];
      dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      uint64_t v8 = CDMOSLoggerForCategory(3);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        id v15 = "-[CDMServiceCenter handleSetup:forCallback:]_block_invoke";
        _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s [WARN]: No services to warmup!", buf, 0xCu);
      }
    }

    +[CDMSELFLogUtil cdmAllServicesWarmupEnded:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) logMessage:@"SELF all services warmup ended message emitted" dataDispatcherContext:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_2_565(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_3;
  block[3] = &unk_2647A41A8;
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v7;
  long long v11 = v7;
  id v10 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_block_t v6 = dispatch_block_create((dispatch_block_flags_t)0, block);
  dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 40) + 88), v6);
}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) handleCommand:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withCallback:*(void *)(a1 + 48)];
  id v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_2_558(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  if (v2)
  {
    id v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    [v4 setStartLogicalTimestampInNs:SiriAnalyticsMachAbsoluteTimeGetNanoseconds()];
  }
  else
  {
    id v3 = CDMOSLoggerForCategory(3);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      dispatch_block_t v6 = "-[CDMServiceCenter handleSetup:forCallback:]_block_invoke_2";
      _os_log_impl(&dword_2263A0000, v3, OS_LOG_TYPE_INFO, "%s [WARN]: Unable to retrieve SELF CDM setup metrics object! This log is likely unusable.", buf, 0xCu);
    }
  }
}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_546(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  if (v2)
  {
    id v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    [v4 setEndLogicalTimestampInNs:SiriAnalyticsMachAbsoluteTimeGetNanoseconds()];
  }
  else
  {
    id v3 = CDMOSLoggerForCategory(3);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      dispatch_block_t v6 = "-[CDMServiceCenter handleSetup:forCallback:]_block_invoke";
      _os_log_impl(&dword_2263A0000, v3, OS_LOG_TYPE_INFO, "%s [WARN]: Unable to retrieve SELF CDM setup metrics object! This log is likely unusable.", buf, 0xCu);
    }
  }
}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_536(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  dispatch_block_t v6 = [v4 cmdError];

  if (v6)
  {
    uint64_t v7 = CDMOSLoggerForCategory(3);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [v4 cmdError];
      id v9 = [v8 description];
      int v12 = 136315394;
      uint64_t v13 = "-[CDMServiceCenter handleSetup:forCallback:]_block_invoke";
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_error_impl(&dword_2263A0000, v7, OS_LOG_TYPE_ERROR, "%s [ERR]: Warmup failed with error %{public}@.", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    id v10 = CDMOSLoggerForCategory(3);
    uint64_t v7 = v10;
    if (v5)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        long long v11 = [v5 description];
        int v12 = 136315394;
        uint64_t v13 = "-[CDMServiceCenter handleSetup:forCallback:]_block_invoke";
        __int16 v14 = 2114;
        id v15 = v11;
        _os_log_error_impl(&dword_2263A0000, v7, OS_LOG_TYPE_ERROR, "%s [ERR]: Warmup failed with error %{public}@.", (uint8_t *)&v12, 0x16u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315138;
      uint64_t v13 = "-[CDMServiceCenter handleSetup:forCallback:]_block_invoke";
      _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s Warmup succeeded.", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)readMemoryPressure
{
  if (!self->_memoryPressureSource)
  {
    id v3 = dispatch_get_global_queue(0, 0);
    id v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83D8], 0, 6uLL, v3);
    memoryPressureSource = self->_memoryPressureSource;
    self->_memoryPressureSource = v4;
  }
  objc_initWeak(&location, self);
  dispatch_block_t v6 = self->_memoryPressureSource;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__CDMServiceCenter_readMemoryPressure__block_invoke;
  v7[3] = &unk_2647A4220;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v6, v7);
  dispatch_activate((dispatch_object_t)self->_memoryPressureSource);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __38__CDMServiceCenter_readMemoryPressure__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    int data = dispatch_source_get_data(WeakRetained[14]);
    if (data == 4)
    {
      id v4 = CDMOSLoggerForCategory(3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136315394;
        dispatch_block_t v6 = "-[CDMServiceCenter readMemoryPressure]_block_invoke";
        __int16 v7 = 2114;
        id v8 = @"critical";
        goto LABEL_10;
      }
LABEL_7:

      goto LABEL_8;
    }
    if (data == 2)
    {
      id v4 = CDMOSLoggerForCategory(3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136315394;
        dispatch_block_t v6 = "-[CDMServiceCenter readMemoryPressure]_block_invoke";
        __int16 v7 = 2114;
        id v8 = @"warning";
LABEL_10:
        _os_log_error_impl(&dword_2263A0000, v4, OS_LOG_TYPE_ERROR, "%s [ERR]: Memory pressure %{public}@", (uint8_t *)&v5, 0x16u);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (void)readThermalState
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F08AB0] processInfo];
  switch([v2 thermalState])
  {
    case 0:
      id v3 = CDMOSLoggerForCategory(3);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        int v5 = 136315138;
        dispatch_block_t v6 = "-[CDMServiceCenter readThermalState]";
        id v4 = "%s Thermal state is within normal limits.";
        goto LABEL_6;
      }
      break;
    case 1:
      id v3 = CDMOSLoggerForCategory(3);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        int v5 = 136315138;
        dispatch_block_t v6 = "-[CDMServiceCenter readThermalState]";
        _os_log_impl(&dword_2263A0000, v3, OS_LOG_TYPE_INFO, "%s Thermal state is slightly elevated.", (uint8_t *)&v5, 0xCu);
      }
      break;
    case 2:
      id v3 = CDMOSLoggerForCategory(3);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136315394;
        dispatch_block_t v6 = "-[CDMServiceCenter readThermalState]";
        __int16 v7 = 2114;
        id v8 = @"high";
        goto LABEL_14;
      }
      break;
    case 3:
      id v3 = CDMOSLoggerForCategory(3);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136315394;
        dispatch_block_t v6 = "-[CDMServiceCenter readThermalState]";
        __int16 v7 = 2114;
        id v8 = @"critical. Performance may be impacted.";
LABEL_14:
        _os_log_error_impl(&dword_2263A0000, v3, OS_LOG_TYPE_ERROR, "%s [ERR]: Thermal state is %{public}@", (uint8_t *)&v5, 0x16u);
      }
      break;
    default:
      id v3 = CDMOSLoggerForCategory(3);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        int v5 = 136315138;
        dispatch_block_t v6 = "-[CDMServiceCenter readThermalState]";
        id v4 = "%s Unknown thermal state.";
LABEL_6:
        _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, v4, (uint8_t *)&v5, 0xCu);
      }
      break;
  }
}

- (void)handleWarmup:(id)a3 forCallback:(id)a4
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v42 = a3;
  int v40 = (void (**)(id, void, void *))a4;
  os_signpost_id_t v6 = os_signpost_id_generate((os_log_t)CDMLogContext);
  __int16 v7 = (id)CDMLogContext;
  id v8 = v7;
  os_signpost_id_t spid = v6;
  unint64_t v37 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CDMServicesWarmup", "CDM Services Warmup enableTelemetry=YES", buf, 2u);
  }

  uint64_t v9 = [v42 dynamicConfig];
  [(CDMServiceCenter *)self mergeConfig:v9];

  __int16 v41 = [(CDMServiceCenter *)self getServicesToWarmup:v42];
  if ([v41 count])
  {
    id v39 = [v42 selfMetadata];
    id v38 = [v42 dataDispatcherContext];
    +[CDMSELFLogUtil cdmAllServicesWarmupStarted:v39 logMessage:@"SELF all services warmup started message emitted" dataDispatcherContext:v38];
    *(void *)long long buf = 0;
    uint64_t v60 = buf;
    uint64_t v61 = 0x3032000000;
    v62 = __Block_byref_object_copy_;
    uint64_t v63 = __Block_byref_object_dispose_;
    objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
    id v64 = (id)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __45__CDMServiceCenter_handleWarmup_forCallback___block_invoke;
    aBlock[3] = &unk_2647A4098;
    void aBlock[4] = buf;
    BOOL v45 = _Block_copy(aBlock);
    uint64_t v44 = [[CDMWarmupRequestCommand alloc] initWithDynamicConfig:self->_currentConfig selfMetadata:v39];
    id v10 = dispatch_group_create();
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v11 = v41;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v54 objects:v72 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v55 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v54 + 1) + 8 * i);
          dispatch_group_enter(v10);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __45__CDMServiceCenter_handleWarmup_forCallback___block_invoke_500;
          block[3] = &unk_2647A4828;
          void block[4] = v15;
          v51 = v44;
          id v53 = v45;
          unint64_t v52 = v10;
          dispatch_block_t v16 = dispatch_block_create((dispatch_block_flags_t)0, block);
          dispatch_async((dispatch_queue_t)self->_cdmServiceCenterQueue, v16);
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v54 objects:v72 count:16];
      }
      while (v12);
    }

    dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    id v17 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v43 = objc_msgSend(v17, "initWithCapacity:", objc_msgSend(*((id *)v60 + 5), "count"));
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    __int16 v18 = [*((id *)v60 + 5) allKeys];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v46 objects:v71 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v47 != v20) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = *(void *)(*((void *)&v46 + 1) + 8 * j);
          v23 = [*((id *)v60 + 5) objectForKey:v22];
          id v24 = NSString;
          char v25 = [v23 localizedDescription];
          uint64_t v26 = [v24 stringWithFormat:@"Service: %@, Error: %@", v22, v25];
          [v43 addObject:v26];
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v46 objects:v71 count:16];
      }
      while (v19);
    }

    if ([v43 count])
    {
      if (v40)
      {
        id v27 = [NSString stringWithFormat:@"CDM failed to warmup. The following services failed to warmup: %@", v43];
        id v28 = CDMOSLoggerForCategory(3);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)uint64_t v67 = 136315394;
          long long v68 = "-[CDMServiceCenter handleWarmup:forCallback:]";
          __int16 v69 = 2114;
          long long v70 = v27;
          _os_log_error_impl(&dword_2263A0000, v28, OS_LOG_TYPE_ERROR, "%s [ERR]: [insights-cdm-summary]:\n%{public}@", v67, 0x16u);
        }

        uint64_t v29 = (void *)MEMORY[0x263F087E8];
        uint64_t v65 = *MEMORY[0x263F08320];
        long long v66 = v27;
        uint64_t v30 = [NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        BOOL v31 = [v29 errorWithDomain:@"CDMServiceCenter" code:4 userInfo:v30];

        v40[2](v40, 0, v31);
      }
      +[CDMSELFLogUtil cdmAllServicesWarmupFailed:v39 logMessage:@"SELF all services warmup failed message emitted" dataDispatcherContext:v38];
    }
    else
    {
      v40[2](v40, 0, 0);
      +[CDMSELFLogUtil cdmAllServicesWarmupEnded:v39 logMessage:@"SELF all services warmup ended message emitted" dataDispatcherContext:v38];
    }
    long long v34 = (id)CDMLogContext;
    long long v35 = v34;
    if (v37 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)uint64_t v67 = 0;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v35, OS_SIGNPOST_INTERVAL_END, spid, "CDMServicesWarmup", " enableTelemetry=YES ", v67, 2u);
    }

    _Block_object_dispose(buf, 8);
    long long v32 = v39;
  }
  else
  {
    if (v40) {
      v40[2](v40, 0, 0);
    }
    long long v32 = (id)CDMLogContext;
    if (v37 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      long long v33 = v32;
      if (os_signpost_enabled(v32))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v33, OS_SIGNPOST_INTERVAL_END, spid, "CDMServicesWarmup", " enableTelemetry=YES ", buf, 2u);
      }
      long long v32 = v33;
    }
  }
}

void __45__CDMServiceCenter_handleWarmup_forCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    id v8 = CDMOSLoggerForCategory(3);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v7 serviceName];
      int v15 = 136315650;
      dispatch_block_t v16 = "-[CDMServiceCenter handleWarmup:forCallback:]_block_invoke";
      __int16 v17 = 2112;
      __int16 v18 = v9;
      __int16 v19 = 2048;
      uint64_t v20 = [v7 serviceState];
      _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s Warmed up Service: %@ State: %tu", (uint8_t *)&v15, 0x20u);
    }
    id v10 = [v7 cmdError];

    if (v10)
    {
      id v11 = [v7 cmdError];
      uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      uint64_t v13 = [v7 serviceName];
      [v12 setObject:v11 forKeyedSubscript:v13];
    }
    else
    {
      if (!v6)
      {
LABEL_9:

        goto LABEL_10;
      }
      __int16 v14 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      id v11 = [v7 serviceName];
      [v14 setObject:v6 forKeyedSubscript:v11];
    }

    goto LABEL_9;
  }
LABEL_10:
}

void __45__CDMServiceCenter_handleWarmup_forCallback___block_invoke_500(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = CDMOSLoggerForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) serviceName];
    int v4 = 136315394;
    id v5 = "-[CDMServiceCenter handleWarmup:forCallback:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v3;
    _os_log_impl(&dword_2263A0000, v2, OS_LOG_TYPE_INFO, "%s Warmup %@", (uint8_t *)&v4, 0x16u);
  }
  [*(id *)(a1 + 32) handleCommand:*(void *)(a1 + 40) withCallback:*(void *)(a1 + 56)];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (id)getServicesToWarmup:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSArray count](self->_dagServices, "count"));
  __int16 v6 = [(CDMDynamicConfig *)self->_currentConfig graphName];
  id v7 = [(CDMServiceCenter *)self getEnabledDAGServiceNamesForGraph:v6];

  commandServicesDict = self->_commandServicesDict;
  long long v33 = v4;
  uint64_t v9 = [v4 commandName];
  id v10 = [(NSMutableDictionary *)commandServicesDict objectForKeyedSubscript:v9];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v32 = self;
  id v11 = self->_dagServices;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v11);
        }
        dispatch_block_t v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        __int16 v17 = (objc_class *)objc_opt_class();
        __int16 v18 = NSStringFromClass(v17);
        if (objc_msgSend(v7, "containsObject:", v18, v32))
        {
          int v19 = [v10 containsObject:v16];

          if (!v19) {
            continue;
          }
          if ([v16 serviceState] == 2)
          {
            [v5 addObject:v16];
            continue;
          }
          __int16 v18 = CDMOSLoggerForCategory(3);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v20 = [v16 serviceName];
            uint64_t v21 = [v16 serviceState];
            *(_DWORD *)long long buf = 136315650;
            uint64_t v44 = "-[CDMServiceCenter getServicesToWarmup:]";
            __int16 v45 = 2112;
            long long v46 = v20;
            __int16 v47 = 2048;
            uint64_t v48 = v21;
            _os_log_debug_impl(&dword_2263A0000, v18, OS_LOG_TYPE_DEBUG, "%s Service %@ is not ready: State:%tu. Skipping warmup.", buf, 0x20u);
          }
        }
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v38 objects:v49 count:16];
    }
    while (v13);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v22 = v32->_foundationServices;
  uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        if (objc_msgSend(v10, "containsObject:", v27, v32))
        {
          if ([v27 serviceState] == 2)
          {
            [v5 addObject:v27];
          }
          else
          {
            id v28 = CDMOSLoggerForCategory(3);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v29 = [v27 serviceName];
              uint64_t v30 = [v27 serviceState];
              *(_DWORD *)long long buf = 136315650;
              uint64_t v44 = "-[CDMServiceCenter getServicesToWarmup:]";
              __int16 v45 = 2112;
              long long v46 = v29;
              __int16 v47 = 2048;
              uint64_t v48 = v30;
              _os_log_debug_impl(&dword_2263A0000, v28, OS_LOG_TYPE_DEBUG, "%s Service %@ is not ready: State:%tu. Skipping warmup.", buf, 0x20u);
            }
          }
        }
      }
      uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v24);
  }

  return v5;
}

uint64_t __46__CDMServiceCenter_handleCommand_forCallback___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleWarmup:*(void *)(a1 + 40) forCallback:*(void *)(a1 + 48)];
}

void __46__CDMServiceCenter_handleCommand_forCallback___block_invoke_484(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = CDMOSLoggerForCategory(3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = [*(id *)(a1 + 32) commandName];
      *(_DWORD *)long long buf = 136315394;
      uint64_t v25 = "-[CDMServiceCenter handleCommand:forCallback:]_block_invoke";
      __int16 v26 = 2112;
      id v27 = v14;
      _os_log_debug_impl(&dword_2263A0000, v4, OS_LOG_TYPE_DEBUG, "%s Dispatch supported command on _cdmServiceCenterQueue with user initiated priority 37. command=%@", buf, 0x16u);
    }
    id v5 = *(NSObject **)(*(void *)(a1 + 40) + 88);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__CDMServiceCenter_handleCommand_forCallback___block_invoke_489;
    block[3] = &unk_2647A5038;
    __int16 v6 = &v21;
    id v21 = v3;
    id v7 = &v22;
    id v22 = *(id *)(a1 + 32);
    uint64_t v8 = &v23;
    id v23 = *(id *)(a1 + 56);
    id v9 = v3;
    dispatch_block_t v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
    dispatch_async(v5, v10);
  }
  else
  {
    id v11 = CDMOSLoggerForCategory(3);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v15 = *(void **)(a1 + 48);
      *(_DWORD *)long long buf = 136315394;
      uint64_t v25 = "-[CDMServiceCenter handleCommand:forCallback:]_block_invoke_2";
      __int16 v26 = 2112;
      id v27 = v15;
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s Dispatch %@ on CDM service center queue with queue's priority.", buf, 0x16u);
    }

    uint64_t v12 = *(NSObject **)(*(void *)(a1 + 40) + 88);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __46__CDMServiceCenter_handleCommand_forCallback___block_invoke_491;
    v16[3] = &unk_2647A5038;
    __int16 v6 = &v17;
    id v17 = v3;
    id v7 = &v18;
    id v18 = *(id *)(a1 + 32);
    uint64_t v8 = &v19;
    id v19 = *(id *)(a1 + 56);
    id v13 = v3;
    dispatch_async(v12, v16);
  }
}

uint64_t __46__CDMServiceCenter_handleCommand_forCallback___block_invoke_489(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleCommand:*(void *)(a1 + 40) withCallback:*(void *)(a1 + 48)];
}

uint64_t __46__CDMServiceCenter_handleCommand_forCallback___block_invoke_491(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleCommand:*(void *)(a1 + 40) withCallback:*(void *)(a1 + 48)];
}

- (void)cleanup
{
  services = self->_services;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __27__CDMServiceCenter_cleanup__block_invoke;
  v5[3] = &unk_2647A4048;
  v5[4] = self;
  [(NSArray *)services enumerateObjectsUsingBlock:v5];
  serviceGraphRunner = self->_serviceGraphRunner;
  if (serviceGraphRunner) {
    [(CDMServiceCenter *)self removeObserver:serviceGraphRunner forKeyPath:@"systemState"];
  }
}

uint64_t __27__CDMServiceCenter_cleanup__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObserver:*(void *)(a1 + 32)];
}

void __35__CDMServiceCenter_initWithConfig___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = CDMOSLoggerForCategory(3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v5 commandName];
    id v9 = [v6 localizedDescription];
    int v12 = 136315650;
    id v13 = "-[CDMServiceCenter initWithConfig:]_block_invoke";
    __int16 v14 = 2112;
    int v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, "%s [CDMCommandOutputCallback-Default] %@ : %@", (uint8_t *)&v12, 0x20u);
  }
  if (!v5 || v6)
  {
    dispatch_block_t v10 = [CDMGenericSendCommand alloc];
    [(CDMBaseCommand *)v10 setCmdError:v6];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained handleCommand:v10 forCallback:0];
  }
  else
  {
    dispatch_block_t v10 = (CDMGenericSendCommand *)objc_loadWeakRetained((id *)(a1 + 32));
    [(CDMGenericSendCommand *)v10 handleCommand:v5 forCallback:0];
  }
}

- (void)dealloc
{
  [(CDMServiceCenter *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)CDMServiceCenter;
  [(CDMServiceCenter *)&v3 dealloc];
}

+ (id)getDynamicConfigWithAssetCollectionForGraph:(id)a3 withLocale:(id)a4 withError:(id *)a5 withSelfMetadata:(id)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  aClassName = (NSString *)a3;
  id v9 = a4;
  id v34 = a6;
  dispatch_block_t v10 = CDMOSLoggerForCategory(3);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    long long v33 = [v9 localeIdentifier];
    *(_DWORD *)long long buf = 136315650;
    long long v38 = "+[CDMServiceCenter getDynamicConfigWithAssetCollectionForGraph:withLocale:withError:withSelfMetadata:]";
    __int16 v39 = 2112;
    long long v40 = aClassName;
    __int16 v41 = 2112;
    id v42 = v33;
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s Get dynamic configs with asset collection for graph: %@ with locale: %@.", buf, 0x20u);
  }
  id v11 = [CDMDynamicConfig alloc];
  int v12 = [v9 localeIdentifier];
  id v13 = [(CDMDynamicConfig *)v11 initWithLanguageCode:v12];

  if ([(NSString *)aClassName length])
  {
    Class v14 = NSClassFromString(aClassName);
    int v15 = [v9 localeIdentifier];
    __int16 v16 = [(objc_class *)v14 getAssetsForSetup:v15];

    id v17 = +[CDMAssetsManager getSingletonCDMAssetsManager];
    uint64_t v18 = +[CDMUAFAssetsManager getNLUAFClientManagers];
    objc_sync_enter(v18);
    id v19 = [v9 localeIdentifier];
    id v20 = +[CDMUAFAssetsManager getUAFClientManagersForLocale:v19 withCDMAssetsInfo:v16];

    +[CDMUAFAssetsManager reInitCDMUAFAssetsCache];
    id v36 = 0;
    [v17 setupForLocale:v9 cdmAssetsInfo:v16 error:&v36];
    id v21 = v36;
    id v22 = v21;
    if (v21)
    {
      id v23 = v21;
      *a5 = v23;
      uint64_t v24 = CDMOSLoggerForCategory(3);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        long long v38 = "+[CDMServiceCenter getDynamicConfigWithAssetCollectionForGraph:withLocale:withError:withSelfMetadata:]";
        __int16 v39 = 2114;
        long long v40 = (NSString *)v23;
        _os_log_error_impl(&dword_2263A0000, v24, OS_LOG_TYPE_ERROR, "%s [ERR]: CDM assets manager failed to setup with error: %{public}@.", buf, 0x16u);
      }

      uint64_t v25 = v13;
    }
    else
    {
      uint64_t v28 = [v17 getAssetsByFactorNamesForCDMAssetsInfo:v16 assetDirPath:0 locale:v9];
      [(CDMDynamicConfig *)v13 setAssetPaths:v28];
      uint64_t v29 = [(CDMDynamicConfig *)v13 assetCollection];
      uint64_t v30 = [v29 getAssetPaths];
      +[CDMSELFLogUtil cdmAssetsReported:v30 metadata:v34 dataDispatcherContext:0];

      BOOL v31 = v13;
    }

    objc_sync_exit(v18);
  }
  else
  {
    __int16 v26 = CDMOSLoggerForCategory(3);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      long long v38 = "+[CDMServiceCenter getDynamicConfigWithAssetCollectionForGraph:withLocale:withError:withSelfMetadata:]";
      _os_log_error_impl(&dword_2263A0000, v26, OS_LOG_TYPE_ERROR, "%s [ERR]: Some parameters are empty.", buf, 0xCu);
    }

    id v27 = v13;
  }

  return v13;
}

@end