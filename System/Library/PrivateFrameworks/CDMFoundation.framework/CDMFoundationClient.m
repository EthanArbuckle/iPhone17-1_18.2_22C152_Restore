@interface CDMFoundationClient
+ (id)createEmptyNluRequestId;
- (BOOL)areAssetsAvailable:(id)a3;
- (BOOL)handleXPCActivity:(id)a3 fromIdentifier:(id)a4;
- (BOOL)handleXPCEvent:(id)a3 fromStream:(id)a4;
- (BOOL)isLighthouseAPIEnabled;
- (BOOL)registerWithAssetsDelegate:(id)a3 withType:(int64_t)a4;
- (CDMFoundationClient)init;
- (CDMFoundationClient)initWithCallingBundleId:(id)a3;
- (CDMFoundationClient)initWithDelegate:(id)a3;
- (CDMFoundationClient)initWithDelegate:(id)a3 withCallingBundleId:(id)a4;
- (id)handleableXPCActivities;
- (id)handleableXPCEventStreams;
- (void)doHandleCommand:(id)a3 forCallback:(id)a4;
- (void)doServiceCenterInitWithConfig:(id)a3;
- (void)processCDMNluRequest:(id)a3;
- (void)processCDMNluRequest:(id)a3 nullableCompletionHandler:(id)a4;
- (void)setDataDispatcherContext:(id)a3;
- (void)setup:(id)a3;
- (void)setup:(id)a3 nullableCompletionHandler:(id)a4;
- (void)waitForDataDispatcherCompletion;
- (void)warmupWithCompletionHandler:(id)a3;
@end

@implementation CDMFoundationClient

void __55__CDMFoundationClient_setup_nullableCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v6 = (id)CDMLogContext;
    os_signpost_id_t v7 = os_signpost_id_generate((os_log_t)CDMLogContext);
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v8 = v7;
      if (os_signpost_enabled(v6))
      {
        LOWORD(v25) = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v6, OS_SIGNPOST_EVENT, v8, "cdmClientSetupReceivedCDM finished setup", "", (uint8_t *)&v25, 2u);
      }
    }

    v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v25 = 136315138;
      v26 = "-[CDMFoundationClient setup:nullableCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s CDM finished processing CDMSetupRequestCommand during setup", (uint8_t *)&v25, 0xCu);
    }

    if (v4)
    {
      v10 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v23 = [v4 localizedDescription];
        uint64_t v24 = [v23 UTF8String];
        int v25 = 136315394;
        v26 = "-[CDMFoundationClient setup:nullableCompletionHandler:]_block_invoke";
        __int16 v27 = 2080;
        uint64_t v28 = v24;
        _os_log_error_impl(&dword_2263A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: Setup failed: %s", (uint8_t *)&v25, 0x16u);
      }
      v11 = [*(id *)(a1 + 32) activeServiceGraph];
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      BOOL v14 = v11 == v13;

      if (v14) {
        +[CDMAutoBugCapture reportUnsafeWithType:@"setupFailure" subType:@"setupFailureForNLUGraph"];
      }
      v15 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v25 = 136315138;
        v26 = "-[CDMFoundationClient setup:nullableCompletionHandler:]_block_invoke";
        _os_log_debug_impl(&dword_2263A0000, v15, OS_LOG_TYPE_DEBUG, "%s Set CDMClient KVO as setup error", (uint8_t *)&v25, 0xCu);
      }

      [WeakRetained setValue:v4 forKey:@"errorFromSetup"];
      v16 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int v25 = 136315138;
        v26 = "-[CDMFoundationClient setup:nullableCompletionHandler:]_block_invoke";
        _os_log_debug_impl(&dword_2263A0000, v16, OS_LOG_TYPE_DEBUG, "%s Send CoreAnalytics", (uint8_t *)&v25, 0xCu);
      }

      v17 = [*(id *)(a1 + 40) languageCode];
      +[CDMAnalytics recordCDMSetupFailureEvent:v17 withError:v4];

      v18 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        int v25 = 136315138;
        v26 = "-[CDMFoundationClient setup:nullableCompletionHandler:]_block_invoke";
        _os_log_debug_impl(&dword_2263A0000, v18, OS_LOG_TYPE_DEBUG, "%s SELF Logging - client setup fail", (uint8_t *)&v25, 0xCu);
      }

      +[CDMSELFLogUtil cdmClientSetupFailed:errorDomain:errorCode:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmClientSetupFailed:errorDomain:errorCode:logMessage:dataDispatcherContext:", *(void *)(a1 + 48), 2, [v4 code], @"SELF client setup failed message emitted", WeakRetained[9]);
      uint64_t v19 = *(void *)(a1 + 56);
      if (v19) {
        (*(void (**)(uint64_t, id))(v19 + 16))(v19, v4);
      }
    }
    else
    {
      v20 = [*(id *)(a1 + 40) languageCode];
      +[CDMAnalytics recordCDMSetupSuccessEvent:v20];

      v21 = [NSNumber numberWithBool:1];
      [WeakRetained setValue:v21 forKey:@"successFromSetup"];

      +[CDMSELFLogUtil cdmClientSetupEnded:*(void *)(a1 + 48) logMessage:@"SELF client setup ended message emitted" dataDispatcherContext:WeakRetained[9]];
      uint64_t v22 = *(void *)(a1 + 56);
      if (v22) {
        (*(void (**)(uint64_t, void))(v22 + 16))(v22, 0);
      }
    }
  }
}

- (void)setup:(id)a3 nullableCompletionHandler:(id)a4
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v58 = (void (**)(id, void *))a4;
  os_signpost_id_t v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v67 = "-[CDMFoundationClient setup:nullableCompletionHandler:]";
    __int16 v68 = 2112;
    uint64_t v69 = (uint64_t)v6;
    _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, "%s CDMClient setup... %@", buf, 0x16u);
  }

  os_signpost_id_t v8 = (id)CDMLogContext;
  os_signpost_id_t v9 = os_signpost_id_generate((os_log_t)CDMLogContext);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v8, OS_SIGNPOST_EVENT, v10, "cdmClientSetupSentCDMClient calling CDM to setup", "", buf, 2u);
    }
  }

  v11 = [v6 nlSetupId];
  BOOL v12 = v11 == 0;

  if (v12)
  {
    v15 = (NSUUID *)objc_alloc_init(MEMORY[0x263F08C38]);
    nlSetupId = self->_nlSetupId;
    self->_nlSetupId = v15;

    p_super = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
    {
      v52 = [(NSUUID *)self->_nlSetupId UUIDString];
      *(_DWORD *)buf = 136315394;
      v67 = "-[CDMFoundationClient setup:nullableCompletionHandler:]";
      __int16 v68 = 2112;
      uint64_t v69 = (uint64_t)v52;
      _os_log_debug_impl(&dword_2263A0000, p_super, OS_LOG_TYPE_DEBUG, "%s CDMClient setup has not nlSetupId set. Minting: %@", buf, 0x16u);
    }
  }
  else
  {
    v13 = [v6 nlSetupId];
    p_super = &self->_nlSetupId->super;
    self->_nlSetupId = v13;
  }

  v17 = [v6 invocationSource];
  invocationSource = self->_invocationSource;
  self->_invocationSource = v17;

  v54 = [MEMORY[0x263F71F48] convertFromUUID:self->_nlSetupId];
  v59 = +[CDMSELFLogUtil createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:](CDMSELFLogUtil, "createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:");
  uint64_t v19 = [v6 activeServiceGraph];
  aClassName = +[CDMDynamicConfig resolveActiveGraph:v19];

  +[CDMSELFLogUtil cdmClientSetupStarted:v59 logMessage:@"SELF client setup started message emitted" currentServiceGraph:[NSClassFromString(aClassName) getNLXSchemaCDMServiceGraphName] dataDispatcherContext:self->_dataDispatcherContext];
  if (v6)
  {
    v20 = [v6 localeIdentifier];
    v53 = v20;
    if (!v20)
    {
      v33 = [(CDMClientInterface *)self createNSError:@"CDMClientSetup does not have locale?" errorCode:1];
      -[CDMFoundationClient setValue:forKey:](self, "setValue:forKey:");
      +[CDMSELFLogUtil cdmClientSetupFailed:v59 errorDomain:1 errorCode:2 logMessage:@"SELF client setup failed message emitted" dataDispatcherContext:self->_dataDispatcherContext];
      if (v58) {
        v58[2](v58, v33);
      }
      goto LABEL_33;
    }
    v21 = [v20 localeIdentifier];
    localeIdentifier = self->_localeIdentifier;
    self->_localeIdentifier = v21;

    id v23 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = self->_localeIdentifier;
      *(_DWORD *)buf = 136315394;
      v67 = "-[CDMFoundationClient setup:nullableCompletionHandler:]";
      __int16 v68 = 2112;
      uint64_t v69 = (uint64_t)v24;
      _os_log_impl(&dword_2263A0000, v23, OS_LOG_TYPE_INFO, "%s Received CDMClientSetup with localeIdentifier=%@", buf, 0x16u);
    }

    int v25 = +[CDMPlatformUtils normalizeLocaleIdentifier:self->_localeIdentifier];
    v26 = self->_localeIdentifier;
    self->_localeIdentifier = v25;

    __int16 v27 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = self->_localeIdentifier;
      *(_DWORD *)buf = 136315394;
      v67 = "-[CDMFoundationClient setup:nullableCompletionHandler:]";
      __int16 v68 = 2112;
      uint64_t v69 = (uint64_t)v28;
      _os_log_impl(&dword_2263A0000, v27, OS_LOG_TYPE_INFO, "%s Received CDMClientSetup with localeIdentifier=%@ (normalized within CDMClient)", buf, 0x16u);
    }

    if ([(CDMFoundationClient *)self isLighthouseAPIEnabled])
    {
      uint64_t v29 = [v6 assetDirPath];
      uint64_t v30 = [v6 overrideSiriVocabSpans];
      v31 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v67 = "-[CDMFoundationClient setup:nullableCompletionHandler:]";
        __int16 v68 = 2112;
        uint64_t v69 = v29;
        __int16 v70 = 2112;
        uint64_t v71 = v30;
        _os_log_debug_impl(&dword_2263A0000, v31, OS_LOG_TYPE_DEBUG, "%s SiriMini lighthouse API is enabled. Got asset dir path: %@, overrides Siri vocabulary spans: %@.", buf, 0x20u);
      }
    }
    else
    {
      v34 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v67 = "-[CDMFoundationClient setup:nullableCompletionHandler:]";
        _os_log_debug_impl(&dword_2263A0000, v34, OS_LOG_TYPE_DEBUG, "%s SiriMini lighthouse API is disabled.", buf, 0xCu);
      }

      v35 = [v6 assetDirPath];
      if (v35)
      {
      }
      else
      {
        v36 = [v6 overrideSiriVocabSpans];
        BOOL v37 = v36 == 0;

        if (v37)
        {
          v55 = 0;
          v56 = 0;
          goto LABEL_32;
        }
      }
      v31 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v38 = [v6 assetDirPath];
        v39 = [v6 overrideSiriVocabSpans];
        *(_DWORD *)buf = 136315650;
        v67 = "-[CDMFoundationClient setup:nullableCompletionHandler:]";
        __int16 v68 = 2112;
        uint64_t v69 = (uint64_t)v38;
        __int16 v70 = 2112;
        uint64_t v71 = (uint64_t)v39;
        _os_log_impl(&dword_2263A0000, v31, OS_LOG_TYPE_INFO, "%s [WARN]: CDM got asset dir path: %@, overrides Siri vocabulary spans: %@. However, SiriMini lighthouse API is disabled. You are holding it wrong! CDM will ignore above parameters.", buf, 0x20u);
      }
      uint64_t v29 = 0;
      uint64_t v30 = 0;
    }

    v55 = (void *)v29;
    v56 = (void *)v30;
LABEL_32:
    v40 = [CDMDynamicConfig alloc];
    v41 = self->_localeIdentifier;
    v42 = [v6 embeddingVersion];
    v43 = [v6 activeServiceGraph];
    v44 = [v6 sandboxId];
    v45 = [v6 serviceStateDirectory];
    v46 = [(CDMDynamicConfig *)v40 initWithLanguageCode:v41 embeddingVersion:v42 graphName:v43 sandboxId:v44 assetPaths:0 assetDirPath:v55 overrideSiriVocabSpans:v56 overrideMentions:0 overrideContextualSpans:0 serviceStateDirectory:v45];
    dynamicConfig = self->_dynamicConfig;
    self->_dynamicConfig = v46;

    objc_initWeak((id *)buf, self);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__CDMFoundationClient_setup_nullableCompletionHandler___block_invoke;
    aBlock[3] = &unk_2647A43A8;
    objc_copyWeak(&v65, (id *)buf);
    id v48 = v6;
    id v61 = v48;
    id v62 = v53;
    id v49 = v59;
    id v63 = v49;
    v64 = v58;
    v50 = _Block_copy(aBlock);
    v51 = -[CDMSetupRequestCommand initWithDynamicConfig:selfMetadata:dataDispatcherContext:shouldPerformWarmup:]([CDMSetupRequestCommand alloc], "initWithDynamicConfig:selfMetadata:dataDispatcherContext:shouldPerformWarmup:", self->_dynamicConfig, v49, self->_dataDispatcherContext, [v48 shouldPerformWarmup]);
    [(CDMFoundationClient *)self doHandleCommand:v51 forCallback:v50];

    objc_destroyWeak(&v65);
    objc_destroyWeak((id *)buf);

    v33 = v55;
LABEL_33:

    v32 = v53;
    goto LABEL_34;
  }
  v32 = [(CDMClientInterface *)self createNSError:@"Trust but verify: got nil CDMClientSetup" errorCode:1];
  [(CDMFoundationClient *)self setValue:v32 forKey:@"errorFromSetup"];
  +[CDMSELFLogUtil cdmClientSetupFailed:v59 errorDomain:1 errorCode:1 logMessage:@"SELF client setup failed message emitted" dataDispatcherContext:self->_dataDispatcherContext];
  if (v58) {
    v58[2](v58, v32);
  }
LABEL_34:
}

- (BOOL)isLighthouseAPIEnabled
{
  return +[CDMFeatureFlags isLighthouseAPIEnabled];
}

- (void)doHandleCommand:(id)a3 forCallback:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [v7 setDataDispatcherContext:self->_dataDispatcherContext];
  [(CDMServiceCenter *)self->_serviceCenter handleCommand:v7 forCallback:v6];
}

- (CDMFoundationClient)initWithCallingBundleId:(id)a3
{
  id v4 = a3;
  v5 = [[CDMDataDispatcherContext alloc] initWithCallingBundleId:v4];
  dataDispatcherContext = self->_dataDispatcherContext;
  self->_dataDispatcherContext = v5;

  id v7 = [(CDMFoundationClient *)self init];
  return v7;
}

- (CDMFoundationClient)init
{
  +[CDMLogging CDMLogInitIfNeeded];
  v3 = objc_alloc_init(CDMConfig);
  dynamicConfig = self->_dynamicConfig;
  self->_dynamicConfig = 0;

  nlSetupId = self->_nlSetupId;
  self->_nlSetupId = 0;

  invocationSource = self->_invocationSource;
  self->_invocationSource = 0;

  id v7 = objc_alloc_init(CDMServiceCenter);
  serviceCenter = self->_serviceCenter;
  self->_serviceCenter = v7;

  [(CDMFoundationClient *)self doServiceCenterInitWithConfig:v3];
  os_signpost_id_t v9 = +[CDMNLUServiceGraph requiredDAGServices];
  os_signpost_id_t v10 = [v9 allObjects];
  v11 = +[XPCStreamEventRegister registerFromDagServiceNames:v10];
  eventRegister = self->_eventRegister;
  self->_eventRegister = v11;

  return self;
}

- (void)doServiceCenterInitWithConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocationSource, 0);
  objc_storeStrong((id *)&self->_nlSetupId, 0);
  objc_storeStrong((id *)&self->_dataDispatcherContext, 0);
  objc_storeStrong((id *)&self->_dynamicConfig, 0);
  objc_storeStrong((id *)&self->_eventRegister, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceCenter, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)waitForDataDispatcherCompletion
{
  v2 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
  dispatch_barrier_async_and_wait(v2, &__block_literal_global_99);
}

void __54__CDMFoundationClient_waitForDataDispatcherCompletion__block_invoke()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v0 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    int v1 = 136315394;
    v2 = "-[CDMFoundationClient waitForDataDispatcherCompletion]_block_invoke";
    __int16 v3 = 2080;
    id v4 = "-[CDMFoundationClient waitForDataDispatcherCompletion]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v0, OS_LOG_TYPE_DEBUG, "%s %s: all blocks in the background CDMDataDispatcherCompletionQueue have been completed.", (uint8_t *)&v1, 0x16u);
  }
}

- (void)setDataDispatcherContext:(id)a3
{
}

- (void)processCDMNluRequest:(id)a3 nullableCompletionHandler:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  os_signpost_id_t v8 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v55 = "-[CDMFoundationClient processCDMNluRequest:nullableCompletionHandler:]";
    __int16 v56 = 2112;
    id v57 = v6;
    _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s CDMClient processCDMNluRequest... %@", buf, 0x16u);
  }

  os_signpost_id_t v9 = (char *)os_signpost_id_generate((os_log_t)CDMLogContext);
  os_signpost_id_t v10 = (id)CDMLogContext;
  v11 = v10;
  unint64_t v12 = (unint64_t)(v9 - 1);
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v9, "ondevice_nl_time", "On device NL process time enableTelemetry=YES", buf, 2u);
  }

  v13 = (id)CDMLogContext;
  os_signpost_id_t v14 = os_signpost_id_generate((os_log_t)CDMLogContext);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v15 = v14;
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v13, OS_SIGNPOST_EVENT, v15, "requestSent", "RequestDispatcher calling CDM with CDMNluRequest", buf, 2u);
    }
  }

  delegate = self->_delegate;
  if (v7)
  {
    if (delegate)
    {
      v17 = [(CDMClientInterface *)self createNSError:@"Using processCDMNluRequest:completionHandler with delegate not supported" errorCode:1];
      v18 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v55 = "-[CDMFoundationClient processCDMNluRequest:nullableCompletionHandler:]";
        _os_log_error_impl(&dword_2263A0000, v18, OS_LOG_TYPE_ERROR, "%s [ERR]: Using processCDMNluRequest:completionHandler with delegate is not supported use [CDMClient init]", buf, 0xCu);
      }

      uint64_t v19 = (id)CDMLogContext;
      v20 = v19;
      if (v12 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v20, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v9, "ondevice_nl_time", " enableTelemetry=YES ", buf, 2u);
      }

      siri::ontology::resetSharedUsoVocabManager(v21);
      v7[2](v7, 0, v17);
      goto LABEL_49;
    }
LABEL_18:
    if (v6)
    {
      uint64_t v22 = [v6 objcProto];
      BOOL v23 = v22 == 0;

      if (!v23)
      {
        v17 = [v6 objcProto];
        uint64_t v24 = [CDMNluRequestID alloc];
        int v25 = [v17 requestId];
        v26 = [(CDMNluRequestID *)v24 initWithObjcProto:v25];

        if ([(CDMClientInterface *)self successFromSetup])
        {
          objc_initWeak((id *)buf, self);
          aBlock[0] = MEMORY[0x263EF8330];
          aBlock[1] = 3221225472;
          aBlock[2] = __70__CDMFoundationClient_processCDMNluRequest_nullableCompletionHandler___block_invoke;
          aBlock[3] = &unk_2647A43F8;
          objc_copyWeak(v53, (id *)buf);
          v53[1] = v9;
          v52 = v7;
          v46 = v26;
          v50 = v46;
          v51 = self;
          v47 = _Block_copy(aBlock);
          __int16 v27 = [CDMAssistantNLUCommand alloc];
          uint64_t v28 = [v17 requestId];
          uint64_t v29 = [v28 connectionId];
          id v48 = [(CDMAssistantNLUCommand *)v27 initWithNLURequest:v17 clientId:v29 dataDispatcherContext:self->_dataDispatcherContext];

          uint64_t v30 = [(CDMServiceCenter *)self->_serviceCenter getAssetPaths];
          v31 = [v17 requestId];
          v32 = +[CDMSELFLogUtil createSELFMetadataWithRequestId:v31];
          +[CDMSELFLogUtil cdmAssetsReported:v30 metadata:v32 dataDispatcherContext:self->_dataDispatcherContext];

          siri::ontology::resetSharedUsoVocabManager((siri::ontology *)[(CDMFoundationClient *)self doHandleCommand:v48 forCallback:v47]);
          objc_destroyWeak(v53);

          objc_destroyWeak((id *)buf);
          v26 = v46;
        }
        else
        {
          v42 = [(CDMClientInterface *)self createNSError:@"CDMClient not ready to process request, did you call setup and got success back?" errorCode:1];
          v43 = (id)CDMLogContext;
          v44 = v43;
          if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_2263A0000, v44, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v9, "ondevice_nl_time", " enableTelemetry=YES ", buf, 2u);
          }

          if (v7) {
            v45 = (siri::ontology *)((uint64_t (*)(id, void, void *))v7[2])(v7, 0, v42);
          }
          else {
            v45 = (siri::ontology *)[(CDMClientDelegate *)self->_delegate processCDMNluRequestErrorCallback:v26 error:v42];
          }
          siri::ontology::resetSharedUsoVocabManager(v45);
        }
        goto LABEL_48;
      }
      v17 = [(CDMClientInterface *)self createNSError:@"This should not be nil SIRINLUEXTERNALCDMNluRequest" errorCode:1];
      v26 = +[CDMFoundationClient createEmptyNluRequestId];
      v40 = (id)CDMLogContext;
      v41 = v40;
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v41, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v9, "ondevice_nl_time", " enableTelemetry=YES ", buf, 2u);
      }

      if (v7) {
        goto LABEL_26;
      }
    }
    else
    {
      v17 = [(CDMClientInterface *)self createNSError:@"Trust but verify: got nil CDMNluRequest" errorCode:1];
      v26 = +[CDMFoundationClient createEmptyNluRequestId];
      v33 = (id)CDMLogContext;
      v34 = v33;
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v34, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v9, "ondevice_nl_time", " enableTelemetry=YES ", buf, 2u);
      }

      if (v7)
      {
LABEL_26:
        v35 = (siri::ontology *)((uint64_t (*)(id, void, void *))v7[2])(v7, 0, v17);
LABEL_44:
        siri::ontology::resetSharedUsoVocabManager(v35);
LABEL_48:

LABEL_49:
        goto LABEL_50;
      }
    }
    v35 = (siri::ontology *)[(CDMClientDelegate *)self->_delegate processCDMNluRequestErrorCallback:v26 error:v17];
    goto LABEL_44;
  }
  if (delegate) {
    goto LABEL_18;
  }
  v36 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v55 = "-[CDMFoundationClient processCDMNluRequest:nullableCompletionHandler:]";
    _os_log_error_impl(&dword_2263A0000, v36, OS_LOG_TYPE_ERROR, "%s [ERR]: No delegate set? did you init with a valid delegate [CDMClient initWithDelegate:]?", buf, 0xCu);
  }

  BOOL v37 = (id)CDMLogContext;
  v38 = v37;
  if (v12 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v38, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v9, "ondevice_nl_time", " enableTelemetry=YES ", buf, 2u);
  }

  siri::ontology::resetSharedUsoVocabManager(v39);
LABEL_50:
}

void __70__CDMFoundationClient_processCDMNluRequest_nullableCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    os_signpost_id_t v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[CDMFoundationClient processCDMNluRequest:nullableCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s CDM graph finished processing, ready to send response back to SiriRequestDispatcher (SRD)", buf, 0xCu);
    }

    os_signpost_id_t v9 = (id)CDMLogContext;
    os_signpost_id_t v10 = os_signpost_id_generate((os_log_t)CDMLogContext);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v11 = v10;
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v9, OS_SIGNPOST_EVENT, v11, "responseReceivedRequestDispatcher received a SIRINLUResponse (or error) from CDM", "", buf, 2u);
      }
    }

    if (v6)
    {
      unint64_t v12 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v28 = [v6 localizedDescription];
        uint64_t v29 = [v28 UTF8String];
        *(_DWORD *)buf = 136315394;
        v31 = "-[CDMFoundationClient processCDMNluRequest:nullableCompletionHandler:]_block_invoke";
        __int16 v32 = 2080;
        uint64_t v33 = v29;
        _os_log_error_impl(&dword_2263A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: %s", buf, 0x16u);
      }
      v13 = (id)CDMLogContext;
      os_signpost_id_t v14 = v13;
      os_signpost_id_t v15 = *(void *)(a1 + 64);
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v14, OS_SIGNPOST_INTERVAL_END, v15, "ondevice_nl_time", " enableTelemetry=YES ", buf, 2u);
      }

      uint64_t v16 = *(void *)(a1 + 48);
      if (v16) {
        (*(void (**)(uint64_t, void, id))(v16 + 16))(v16, 0, v6);
      }
      else {
        [WeakRetained[4] processCDMNluRequestErrorCallback:*(void *)(a1 + 32) error:v6];
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v5;
        v18 = [v17 cdmNluResponse];
        uint64_t v19 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v31 = "-[CDMFoundationClient processCDMNluRequest:nullableCompletionHandler:]_block_invoke";
          __int16 v32 = 2112;
          uint64_t v33 = (uint64_t)v17;
          _os_log_impl(&dword_2263A0000, v19, OS_LOG_TYPE_INFO, "%s CDM graph finished processing, sending response back to SiriRequestDispatcher (SRD): %@", buf, 0x16u);
        }

        v20 = (id)CDMLogContext;
        v21 = v20;
        os_signpost_id_t v22 = *(void *)(a1 + 64);
        if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_2263A0000, v21, OS_SIGNPOST_INTERVAL_END, v22, "ondevice_nl_time", " enableTelemetry=YES ", buf, 2u);
        }

        uint64_t v23 = *(void *)(a1 + 48);
        if (v23) {
          (*(void (**)(uint64_t, void *, void))(v23 + 16))(v23, v18, 0);
        }
        else {
          [*(id *)(*(void *)(a1 + 40) + 32) processCDMNluRequestCallback:v18];
        }
      }
      else
      {
        id v17 = [NSString stringWithFormat:@"Expecting CDMGenericSendCommand, but got %@", v5];
        v18 = [WeakRetained createNSError:v17 errorCode:2];
        uint64_t v24 = (id)CDMLogContext;
        int v25 = v24;
        os_signpost_id_t v26 = *(void *)(a1 + 64);
        if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_2263A0000, v25, OS_SIGNPOST_INTERVAL_END, v26, "ondevice_nl_time", " enableTelemetry=YES ", buf, 2u);
        }

        uint64_t v27 = *(void *)(a1 + 48);
        if (v27) {
          (*(void (**)(uint64_t, void, void *))(v27 + 16))(v27, 0, v18);
        }
        else {
          [WeakRetained[4] processCDMNluRequestErrorCallback:*(void *)(a1 + 32) error:v18];
        }
      }
    }
  }
}

- (void)processCDMNluRequest:(id)a3
{
}

- (void)warmupWithCompletionHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 136315138;
    *(void *)&location[4] = "-[CDMFoundationClient warmupWithCompletionHandler:]";
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s CDMClient warmup called", location, 0xCu);
  }

  nlSetupId = self->_nlSetupId;
  if (!nlSetupId)
  {
    id v7 = (NSUUID *)objc_alloc_init(MEMORY[0x263F08C38]);
    os_signpost_id_t v8 = self->_nlSetupId;
    self->_nlSetupId = v7;

    os_signpost_id_t v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = [(NSUUID *)self->_nlSetupId UUIDString];
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "-[CDMFoundationClient warmupWithCompletionHandler:]";
      __int16 v25 = 2112;
      os_signpost_id_t v26 = v19;
      _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s CDMClient warmup has no nlSetupId set. Minting: %@", location, 0x16u);
    }
    nlSetupId = self->_nlSetupId;
  }
  os_signpost_id_t v10 = [MEMORY[0x263F71F48] convertFromUUID:nlSetupId];
  if (self->_dynamicConfig)
  {
    os_signpost_id_t v11 = +[CDMSELFLogUtil createSELFMetadataWithNlId:v10 andWithTrpId:0 andWithRequestId:0 andWithResultCandidateId:@"0" andWithConnectionId:self->_invocationSource];
    unint64_t v12 = [(CDMDynamicConfig *)self->_dynamicConfig graphName];
    v13 = +[CDMDynamicConfig resolveActiveGraph:v12];

    +[CDMSELFLogUtil cdmClientWarmupStarted:v11 logMessage:@"SELF client warmup started message emitted" currentServiceGraph:[NSClassFromString(v13) getNLXSchemaCDMServiceGraphName] dataDispatcherContext:self->_dataDispatcherContext];
    os_signpost_id_t v14 = [[CDMWarmupRequestCommand alloc] initWithDynamicConfig:self->_dynamicConfig selfMetadata:v11];
    os_signpost_id_t v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "-[CDMFoundationClient warmupWithCompletionHandler:]";
      __int16 v25 = 2112;
      os_signpost_id_t v26 = (__CFString *)v14;
      _os_log_debug_impl(&dword_2263A0000, v15, OS_LOG_TYPE_DEBUG, "%s Created CDMWarmupCommand to pass into active graph, %@", location, 0x16u);
    }

    objc_initWeak((id *)location, self);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__CDMFoundationClient_warmupWithCompletionHandler___block_invoke;
    aBlock[3] = &unk_2647A43D0;
    objc_copyWeak(&v23, (id *)location);
    id v16 = v11;
    id v21 = v16;
    id v22 = v4;
    id v17 = _Block_copy(aBlock);
    [(CDMFoundationClient *)self doHandleCommand:v14 forCallback:v17];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v16 = [(CDMClientInterface *)self createNSError:@"warmupWithCompletionHandler called but dynamicConfig is nil. Did you have a successful setup?" errorCode:3];
    v18 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "-[CDMFoundationClient warmupWithCompletionHandler:]";
      __int16 v25 = 2112;
      os_signpost_id_t v26 = @"warmupWithCompletionHandler called but dynamicConfig is nil. Did you have a successful setup?";
      _os_log_error_impl(&dword_2263A0000, v18, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", location, 0x16u);
    }

    v13 = +[CDMSELFLogUtil createSELFMetadataWithNlId:v10 andWithTrpId:0 andWithRequestId:0 andWithResultCandidateId:@"0" andWithConnectionId:self->_invocationSource];
    +[CDMSELFLogUtil cdmClientWarmupFailed:errorDomain:errorCode:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmClientWarmupFailed:errorDomain:errorCode:logMessage:dataDispatcherContext:", v13, 1, [v16 code], @"SELF client warmup failed message emitted", self->_dataDispatcherContext);
    (*((void (**)(id, id))v4 + 2))(v4, v16);
  }
}

void __51__CDMFoundationClient_warmupWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    os_signpost_id_t v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315650;
      v13 = "-[CDMFoundationClient warmupWithCompletionHandler:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = (uint64_t)v5;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s CDM graph finished processing, output=%@, error=%@", (uint8_t *)&v12, 0x20u);
    }

    if (v6)
    {
      os_signpost_id_t v9 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = [v6 localizedDescription];
        uint64_t v11 = [v10 UTF8String];
        int v12 = 136315394;
        v13 = "-[CDMFoundationClient warmupWithCompletionHandler:]_block_invoke";
        __int16 v14 = 2080;
        uint64_t v15 = v11;
        _os_log_error_impl(&dword_2263A0000, v9, OS_LOG_TYPE_ERROR, "%s [ERR]: %s", (uint8_t *)&v12, 0x16u);
      }
      +[CDMSELFLogUtil cdmClientWarmupFailed:errorDomain:errorCode:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmClientWarmupFailed:errorDomain:errorCode:logMessage:dataDispatcherContext:", *(void *)(a1 + 32), 2, [v6 code], @"SELF client warmup failed message emitted", WeakRetained[9]);
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      +[CDMSELFLogUtil cdmClientWarmupEnded:*(void *)(a1 + 32) logMessage:@"SELF client warmup ended message emitted" dataDispatcherContext:WeakRetained[9]];
    }
  }
}

- (void)setup:(id)a3
{
}

- (BOOL)registerWithAssetsDelegate:(id)a3 withType:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    localeIdentifier = self->_localeIdentifier;
    int v11 = 136315394;
    int v12 = "-[CDMFoundationClient registerWithAssetsDelegate:withType:]";
    __int16 v13 = 2112;
    __int16 v14 = localeIdentifier;
    _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s Register assets delegate for CDMFoundationClient for locale: %@", (uint8_t *)&v11, 0x16u);
  }

  BOOL v8 = +[CDMAssetsUtils registerWithAssetsDelegate:v6 withType:a4 withLocale:self->_localeIdentifier];
  return v8;
}

- (BOOL)areAssetsAvailable:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [v4 localeIdentifier];
      int v16 = 136315394;
      id v17 = "-[CDMFoundationClient areAssetsAvailable:]";
      __int16 v18 = 2112;
      uint64_t v19 = v6;
      _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Are assets available called with locale: %@.", (uint8_t *)&v16, 0x16u);
    }
    id v7 = [v4 localeIdentifier];
    localeIdentifier = self->_localeIdentifier;
    self->_localeIdentifier = v7;

    os_signpost_id_t v9 = +[CDMPlatformUtils normalizeLocaleIdentifier:self->_localeIdentifier];
    id v10 = self->_localeIdentifier;
    self->_localeIdentifier = v9;

    int v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = self->_localeIdentifier;
      int v16 = 136315394;
      id v17 = "-[CDMFoundationClient areAssetsAvailable:]";
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_impl(&dword_2263A0000, v11, OS_LOG_TYPE_INFO, "%s Normalized localeIdentifier: %@", (uint8_t *)&v16, 0x16u);
    }

    BOOL v13 = [(CDMServiceCenter *)self->_serviceCenter areAssetsAvailable:self->_localeIdentifier];
  }
  else
  {
    __int16 v14 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315394;
      id v17 = "-[CDMFoundationClient areAssetsAvailable:]";
      __int16 v18 = 2112;
      uint64_t v19 = 0;
      _os_log_error_impl(&dword_2263A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: I NEED localeIdentifier=%@", (uint8_t *)&v16, 0x16u);
    }

    BOOL v13 = 0;
  }

  return v13;
}

- (CDMFoundationClient)initWithDelegate:(id)a3 withCallingBundleId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [[CDMDataDispatcherContext alloc] initWithCallingBundleId:v7];
  dataDispatcherContext = self->_dataDispatcherContext;
  self->_dataDispatcherContext = v8;

  id v10 = [(CDMFoundationClient *)self initWithDelegate:v6];
  return v10;
}

- (CDMFoundationClient)initWithDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
  return [(CDMFoundationClient *)self init];
}

+ (id)createEmptyNluRequestId
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "+[CDMFoundationClient createEmptyNluRequestId]";
    _os_log_impl(&dword_2263A0000, v2, OS_LOG_TYPE_INFO, "%s [WARN]: Creating an empty CDMNluRequestID object to send back", (uint8_t *)&v6, 0xCu);
  }

  id v3 = objc_alloc_init(MEMORY[0x263F71D18]);
  [v3 setIdA:@"received-invalid-CDMNluRequest"];
  [v3 setConnectionId:@"received-invalid-CDMNluRequest"];
  id v4 = [[CDMNluRequestID alloc] initWithObjcProto:v3];

  return v4;
}

- (BOOL)handleXPCActivity:(id)a3 fromIdentifier:(id)a4
{
  return [(CDMServiceCenter *)self->_serviceCenter handleXPCActivity:a3 fromIdentifier:a4 withRegister:self->_eventRegister];
}

- (BOOL)handleXPCEvent:(id)a3 fromStream:(id)a4
{
  return [(CDMServiceCenter *)self->_serviceCenter handleXPCEvent:a3 fromStream:a4 withRegister:self->_eventRegister];
}

- (id)handleableXPCActivities
{
  return [(XPCStreamEventRegister *)self->_eventRegister handleableXPCActivities];
}

- (id)handleableXPCEventStreams
{
  return [(XPCStreamEventRegister *)self->_eventRegister handleableXPCEventStreams];
}

@end