@interface CDMComposerService
- (CDMComposerService)initWithConfig:(id)a3;
- (id)createServiceGraphForCommand:(id)a3 withSelfMetadata:(id)a4 withCallback:(id)a5;
- (id)prepareRequestHandler:(id)a3 withCallback:(id)a4;
- (id)supportedCommands;
- (void)_handleEmbeddingRequest:(id)a3 withCallback:(id)a4;
- (void)_handleListGraphs:(id)a3 withCallback:(id)a4;
- (void)_handleNLUPreprocessRequest:(id)a3 withCallback:(id)a4;
- (void)_handleNLURequest:(id)a3 withCallback:(id)a4;
- (void)_handleSetupRequest:(id)a3 withCallback:(id)a4;
- (void)_handleSsuInferenceRequest:(id)a3 withCallback:(id)a4;
- (void)failWithError:(id)a3 callback:(id)a4;
- (void)failWithError:(id)a3 rawCommand:(id)a4 callback:(id)a5;
- (void)handleCommand:(id)a3 withCallback:(id)a4;
- (void)updateGraphServices:(id)a3;
- (void)updateServiceGraphRunner:(id)a3;
- (void)updateServices:(id)a3;
@end

@implementation CDMComposerService

- (void)updateServices:(id)a3
{
}

- (void)updateServiceGraphRunner:(id)a3
{
}

- (CDMComposerService)initWithConfig:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CDMComposerService;
  v5 = [(CDMBaseService *)&v12 initWithConfig:v4];
  v6 = v5;
  if (v5)
  {
    v5->super._serviceState = 2;
    v7 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    aneLock = v6->_aneLock;
    v6->_aneLock = v7;

    uint64_t v9 = [v4 availableServiceGraphs];
    availableServiceGraphs = v6->_availableServiceGraphs;
    v6->_availableServiceGraphs = (NSOrderedSet *)v9;
  }
  return v6;
}

- (void)handleCommand:(id)a3 withCallback:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v6 commandName];
    *(_DWORD *)buf = 136315394;
    objc_super v12 = "-[CDMComposerService handleCommand:withCallback:]";
    __int16 v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s Composer get [%@]", buf, 0x16u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CDMComposerService *)self _handleListGraphs:v6 withCallback:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(CDMComposerService *)self _handleSetupRequest:v6 withCallback:v7];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(CDMComposerService *)self _handleNLUPreprocessRequest:v6 withCallback:v7];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(CDMComposerService *)self _handleNLURequest:v6 withCallback:v7];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(CDMComposerService *)self _handleEmbeddingRequest:v6 withCallback:v7];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [(CDMComposerService *)self _handleSsuInferenceRequest:v6 withCallback:v7];
            }
            else
            {
              v10.receiver = self;
              v10.super_class = (Class)CDMComposerService;
              [(CDMBaseService *)&v10 handleCommand:v6 withCallback:v7];
            }
          }
        }
      }
    }
  }
}

- (void)_handleSetupRequest:(id)a3 withCallback:(id)a4
{
  v41[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  v8 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "-[CDMComposerService _handleSetupRequest:withCallback:]";
    _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  uint64_t v9 = [v6 dynamicConfig];
  objc_super v10 = [v9 languageCode];
  languageCode = self->_languageCode;
  self->_languageCode = v10;

  objc_super v12 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v29 = [v6 dynamicConfig];
    v30 = [v29 graphName];
    *(_DWORD *)buf = 136315394;
    v35 = "-[CDMComposerService _handleSetupRequest:withCallback:]";
    __int16 v36 = 2112;
    v37 = v30;
    _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s DynamicConfig's graphName=%@", buf, 0x16u);
  }
  availableServiceGraphs = self->_availableServiceGraphs;
  v14 = [v6 dynamicConfig];
  uint64_t v15 = [v14 graphName];
  LOBYTE(availableServiceGraphs) = [(NSOrderedSet *)availableServiceGraphs containsObject:v15];

  if (availableServiceGraphs)
  {
    v16 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v31 = [v6 dynamicConfig];
      v32 = [v31 graphName];
      v33 = self->_languageCode;
      *(_DWORD *)buf = 136315650;
      v35 = "-[CDMComposerService _handleSetupRequest:withCallback:]";
      __int16 v36 = 2112;
      v37 = v32;
      __int16 v38 = 2112;
      v39 = v33;
      _os_log_debug_impl(&dword_2263A0000, v16, OS_LOG_TYPE_DEBUG, "%s Ready for graph %@ and locale %@", buf, 0x20u);
    }
    self->super._serviceState = 2;
    v17 = [(CDMBaseService *)self createSetupResponseCommand];
    v7[2](v7, v17, 0);
  }
  else
  {
    v18 = NSString;
    v19 = [v6 dynamicConfig];
    v20 = [v19 graphName];
    objc_msgSend(v18, "stringWithFormat:", @"Invalid graph=%@; Leaving CDM as-is. List of available graphs=%@",
      v20,
    v17 = self->_availableServiceGraphs);

    v21 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[CDMComposerService _handleSetupRequest:withCallback:]";
      __int16 v36 = 2112;
      v37 = v17;
      _os_log_error_impl(&dword_2263A0000, v21, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v40 = *MEMORY[0x263F08320];
    v41[0] = v17;
    v23 = [NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];
    v24 = [v22 errorWithDomain:@"CDMComposerService" code:-4 userInfo:v23];

    self->super._serviceState = 3;
    v25 = [CDMSetupResponseCommand alloc];
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    v28 = [(CDMSetupResponseCommand *)v25 initWithServiceState:3 serviceName:v27];

    [(CDMBaseCommand *)v28 setCmdError:v24];
    ((void (**)(id, void *, void *))v7)[2](v7, v28, v24);
  }
}

- (id)supportedCommands
{
  v12[5] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)CDMComposerService;
  v2 = [(CDMBaseService *)&v11 supportedCommands];
  v3 = +[CDMBaseCommand commandName];
  v12[0] = v3;
  id v4 = +[CDMBaseCommand commandName];
  v12[1] = v4;
  v5 = +[CDMBaseCommand commandName];
  v12[2] = v5;
  id v6 = +[CDMBaseCommand commandName];
  v12[3] = v6;
  id v7 = +[CDMBaseCommand commandName];
  v12[4] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:5];
  uint64_t v9 = [v2 setByAddingObjectsFromArray:v8];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableServiceGraphs, 0);
  objc_storeStrong((id *)&self->_aneLock, 0);
  objc_storeStrong((id *)&self->_serviceGraphRunner, 0);
  objc_storeStrong((id *)&self->_graphServicesArray, 0);
  objc_storeStrong((id *)&self->_servicesArray, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

- (id)prepareRequestHandler:(id)a3 withCallback:(id)a4
{
  v42[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v34 = a4;
  v32 = [(id)objc_opt_class() serviceGraphName];
  Class v7 = NSClassFromString(v32);
  v8 = [v6 loggingRequestID];
  v33 = +[CDMSELFLogUtil createSELFMetadataWithRequestId:v8];
  uint64_t v9 = [v6 dataDispatcherContext];
  +[CDMDataDispatcher dispatchSELFRequestLink:v8 dataDispatcherContext:v9];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v10 = v6;
    objc_super v11 = [v10 siriNLUTypeObj];
    objc_super v12 = [v10 dataDispatcherContext];
    +[CDMDataDispatcher dispatchCdmRequestData:v11 requestId:v8 withCurrentServiceGraph:v32 dataDispatcherContext:v12];
  }
  else if (objc_opt_respondsToSelector())
  {
    v27 = [v6 dataDispatcherContext];
    [(objc_class *)v7 dispatchServiceGraphRequestLogging:v6 dataDispatcherContext:v27];
  }
  else
  {
    v30 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v36 = "-[CDMComposerService prepareRequestHandler:withCallback:]";
      __int16 v37 = 2112;
      __int16 v38 = (__CFString *)v32;
      _os_log_impl(&dword_2263A0000, v30, OS_LOG_TYPE_INFO, "%s [WARN]: Graph [%@] does not support dispatchServiceGraphRequestLogging", buf, 0x16u);
    }
  }
  if (!self->_serviceGraphRunner)
  {
    v23 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v36 = "-[CDMComposerService prepareRequestHandler:withCallback:]";
      __int16 v37 = 2112;
      __int16 v38 = @"ServiceGraphRunner not initialized!";
      _os_log_error_impl(&dword_2263A0000, v23, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v41 = *MEMORY[0x263F08320];
    v42[0] = @"ServiceGraphRunner not initialized!";
    v25 = [NSDictionary dictionaryWithObjects:v42 forKeys:&v41 count:1];
    __int16 v13 = [v24 errorWithDomain:@"CDMComposerService" code:-1 userInfo:v25];

    v26 = [v6 dataDispatcherContext];
    +[CDMSELFLogUtil cdmFailed:8 metadata:v33 logMessage:@"SELF CDM Request failed message emitted" dataDispatcherContext:v26];

    [(CDMComposerService *)self failWithError:v13 rawCommand:v6 callback:v34];
    goto LABEL_13;
  }
  __int16 v13 = [(CDMComposerService *)self createServiceGraphForCommand:v6 withSelfMetadata:v33 withCallback:v34];
  if (!v13)
  {
LABEL_13:
    v22 = 0;
    goto LABEL_20;
  }
  v14 = [CDMBaseRequestHandler alloc];
  uint64_t v15 = [v6 uuid];
  v31 = [(CDMBaseRequestHandler *)v14 initWithId:v15 serviceGraph:v13];

  v16 = [(CDMBaseRequestHandler *)v31 getError];
  if (v16)
  {
    v17 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v36 = "-[CDMComposerService prepareRequestHandler:withCallback:]";
      __int16 v37 = 2112;
      __int16 v38 = @"summary";
      __int16 v39 = 2112;
      uint64_t v40 = v16;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nFailing early as graph set an error before even running it. Error:%@", buf, 0x20u);
    }
    v18 = objc_msgSend(v16, "domain", v31);
    uint64_t v19 = [v16 code];
    v20 = +[CDMSELFLogUtil createSELFMetadataWithRequestId:v8];
    v21 = [v6 dataDispatcherContext];
    +[CDMSELFLogUtil cdmFailed:11 errorDomainString:v18 errorCode:v19 metadata:v20 logMessage:@"SELF CDM Request failed message emitted" dataDispatcherContext:v21];

    [(CDMComposerService *)self failWithError:v16 rawCommand:v6 callback:v34];
    v22 = 0;
  }
  else
  {
    v28 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v36 = "-[CDMComposerService prepareRequestHandler:withCallback:]";
      __int16 v37 = 2112;
      __int16 v38 = (__CFString *)v32;
      _os_log_impl(&dword_2263A0000, v28, OS_LOG_TYPE_INFO, "%s Created %@", buf, 0x16u);
    }

    v22 = v31;
  }

LABEL_20:
  return v22;
}

- (id)createServiceGraphForCommand:(id)a3 withSelfMetadata:(id)a4 withCallback:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v28 = a4;
  id v29 = a5;
  uint64_t v9 = [(id)objc_opt_class() serviceGraphName];
  id v10 = objc_alloc(NSClassFromString(v9));
  servicesArray = self->_servicesArray;
  graphServicesArray = self->_graphServicesArray;
  languageCode = self->_languageCode;
  v14 = [v8 uuid];
  aneLock = self->_aneLock;
  v16 = [v8 dataDispatcherContext];
  v17 = (void *)[v10 initWithServices:servicesArray graphServices:graphServicesArray graphInput:v8 languageCode:languageCode handlerId:v14 aneLock:aneLock dataDispatcherContext:v16];

  v18 = [v17 getError];
  uint64_t v19 = v18;
  if (v18 && [v18 code] == 3)
  {
    v20 = [NSString stringWithFormat:@"Failed to create service graph with type %@!", v9];
    v21 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[CDMComposerService createServiceGraphForCommand:withSelfMetadata:withCallback:]";
      __int16 v34 = 2112;
      v35 = v20;
      _os_log_error_impl(&dword_2263A0000, v21, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08320];
    v31 = v20;
    v23 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    v24 = [v22 errorWithDomain:@"CDMComposerService" code:-3 userInfo:v23];

    v25 = [v8 dataDispatcherContext];
    +[CDMSELFLogUtil cdmFailed:10 metadata:v28 logMessage:@"SELF CDM Request failed message emitted" dataDispatcherContext:v25];

    [(CDMComposerService *)self failWithError:v24 rawCommand:v8 callback:v29];
    id v26 = 0;
  }
  else
  {
    id v26 = v17;
  }

  return v26;
}

- (void)_handleSsuInferenceRequest:(id)a3 withCallback:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [v6 loggingRequestID];
  id v10 = +[CDMSELFLogUtil createSELFMetadataWithRequestId:v9];

  objc_super v11 = [(CDMComposerService *)self prepareRequestHandler:v6 withCallback:v7];
  if (v11)
  {
    objc_super v12 = CDMOSLoggerForCategory(4);
    os_signpost_id_t v13 = os_signpost_id_generate(v12);

    v14 = CDMOSLoggerForCategory(4);
    uint64_t v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v16 = [v11 handlerId];
      *(_DWORD *)buf = 138412290;
      id v26 = v16;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "handleSsuInferenceGraph", "%@", buf, 0xCu);
    }
    serviceGraphRunner = self->_serviceGraphRunner;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __62__CDMComposerService__handleSsuInferenceRequest_withCallback___block_invoke;
    v18[3] = &unk_2647A50E0;
    os_signpost_id_t v23 = v13;
    id v19 = v11;
    id v20 = v10;
    id v21 = v6;
    uint64_t v24 = v8;
    id v22 = v7;
    [(CDMServiceGraphRunner *)serviceGraphRunner runHandlerAsync:v19 withCompletion:v18];
  }
}

void __62__CDMComposerService__handleSsuInferenceRequest_withCallback___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(4);
  v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v3, OS_SIGNPOST_INTERVAL_END, v4, "handleSsuInferenceGraph", "", (uint8_t *)&v19, 2u);
  }

  v5 = [*(id *)(a1 + 32) getResult];
  id v6 = [*(id *)(a1 + 32) getError];
  if (v6)
  {
    id v7 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315650;
      id v20 = "-[CDMComposerService _handleSsuInferenceRequest:withCallback:]_block_invoke";
      __int16 v21 = 2112;
      id v22 = @"summary";
      __int16 v23 = 2112;
      uint64_t v24 = v6;
      _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nServiceGraphError: %@", (uint8_t *)&v19, 0x20u);
    }
    uint64_t v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315394;
      id v20 = "-[CDMComposerService _handleSsuInferenceRequest:withCallback:]_block_invoke";
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_error_impl(&dword_2263A0000, v8, OS_LOG_TYPE_ERROR, "%s [ERR]: Sending Error via callback in CDMClient, Error:%@", (uint8_t *)&v19, 0x16u);
    }

    uint64_t v9 = [(__CFString *)v6 domain];
    uint64_t v10 = [(__CFString *)v6 code];
    uint64_t v11 = *(void *)(a1 + 40);
    objc_super v12 = [*(id *)(a1 + 48) dataDispatcherContext];
    +[CDMSELFLogUtil cdmFailed:12 errorDomainString:v9 errorCode:v10 metadata:v11 logMessage:@"SELF CDM Request failed message emitted" dataDispatcherContext:v12];

    os_signpost_id_t v13 = [[CDMGenericSendCommand alloc] initWithError:v6 clientId:@"CDM-embedding-client"];
  }
  else
  {
    v14 = *(void **)(a1 + 72);
    uint64_t v15 = [*(id *)(a1 + 48) loggingRequestID];
    v16 = [*(id *)(a1 + 48) dataDispatcherContext];
    [v14 dispatchServiceGraphResponseLogging:v5 requestId:v15 dataDispatcherContext:v16];

    v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 136315138;
      id v20 = "-[CDMComposerService _handleSsuInferenceRequest:withCallback:]_block_invoke";
      _os_log_debug_impl(&dword_2263A0000, v17, OS_LOG_TYPE_DEBUG, "%s Sending CDMSsuInferenceGraphResponseCommand via callback in CDMClient", (uint8_t *)&v19, 0xCu);
    }

    os_signpost_id_t v13 = [[CDMGenericSendCommand alloc] initWithSsuInferenceGraphResponse:v5];
  }
  v18 = v13;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_handleEmbeddingRequest:(id)a3 withCallback:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [(CDMComposerService *)self prepareRequestHandler:v6 withCallback:v7];
  uint64_t v10 = [v6 requestId];
  uint64_t v11 = +[CDMSELFLogUtil createSELFMetadataWithRequestId:v10];
  if (v9)
  {
    objc_super v12 = CDMOSLoggerForCategory(4);
    os_signpost_id_t v13 = os_signpost_id_generate(v12);

    v14 = CDMOSLoggerForCategory(4);
    uint64_t v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v16 = [v9 handlerId];
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v16;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "handleEmbeddingGraph", "%@", buf, 0xCu);
    }
    serviceGraphRunner = self->_serviceGraphRunner;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __59__CDMComposerService__handleEmbeddingRequest_withCallback___block_invoke;
    v18[3] = &unk_2647A50B8;
    os_signpost_id_t v24 = v13;
    id v19 = v9;
    uint64_t v25 = v8;
    id v20 = v10;
    id v21 = v6;
    id v22 = v11;
    id v23 = v7;
    [(CDMServiceGraphRunner *)serviceGraphRunner runHandlerAsync:v19 withCompletion:v18];
  }
}

void __59__CDMComposerService__handleEmbeddingRequest_withCallback___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(4);
  v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 72);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v3, OS_SIGNPOST_INTERVAL_END, v4, "handleEmbeddingGraph", "", (uint8_t *)&v19, 2u);
  }

  v5 = [*(id *)(a1 + 32) getResult];
  id v6 = [*(id *)(a1 + 32) getError];
  if (v6)
  {
    id v7 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315650;
      id v20 = "-[CDMComposerService _handleEmbeddingRequest:withCallback:]_block_invoke";
      __int16 v21 = 2112;
      id v22 = @"summary";
      __int16 v23 = 2112;
      os_signpost_id_t v24 = v6;
      _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nServiceGraphError: %@", (uint8_t *)&v19, 0x20u);
    }
    uint64_t v8 = [(__CFString *)v6 domain];
    uint64_t v9 = [(__CFString *)v6 code];
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = [*(id *)(a1 + 48) dataDispatcherContext];
    +[CDMSELFLogUtil cdmFailed:12 errorDomainString:v8 errorCode:v9 metadata:v10 logMessage:@"SELF CDM Request failed message emitted" dataDispatcherContext:v11];

    objc_super v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315394;
      id v20 = "-[CDMComposerService _handleEmbeddingRequest:withCallback:]_block_invoke";
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_error_impl(&dword_2263A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: Sending Error via callback in CDMClient, Error:%@", (uint8_t *)&v19, 0x16u);
    }

    os_signpost_id_t v13 = [[CDMGenericSendCommand alloc] initWithError:v6 clientId:@"CDM-embedding-client"];
  }
  else
  {
    v14 = *(void **)(a1 + 80);
    uint64_t v15 = *(void *)(a1 + 40);
    v16 = [*(id *)(a1 + 48) dataDispatcherContext];
    [v14 dispatchServiceGraphResponseLogging:v5 requestId:v15 dataDispatcherContext:v16];

    v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 136315138;
      id v20 = "-[CDMComposerService _handleEmbeddingRequest:withCallback:]_block_invoke";
      _os_log_debug_impl(&dword_2263A0000, v17, OS_LOG_TYPE_DEBUG, "%s Sending CDMEmbeddingGraphResponseCommand via callback in CDMClient", (uint8_t *)&v19, 0xCu);
    }

    os_signpost_id_t v13 = [[CDMGenericSendCommand alloc] initWithEmbeddingGraphResponse:v5];
  }
  v18 = v13;
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)_handleNLUPreprocessRequest:(id)a3 withCallback:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 siriNLUTypeObj];
  uint64_t v9 = [v8 requestId];

  uint64_t v10 = [(CDMComposerService *)self prepareRequestHandler:v6 withCallback:v7];
  if (v10)
  {
    uint64_t v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      os_signpost_id_t v24 = "-[CDMComposerService _handleNLUPreprocessRequest:withCallback:]";
      _os_log_impl(&dword_2263A0000, v11, OS_LOG_TYPE_INFO, "%s Created requestHandler for handleNLUPreprocessRequest", buf, 0xCu);
    }

    objc_super v12 = CDMOSLoggerForCategory(4);
    os_signpost_id_t v13 = os_signpost_id_generate(v12);

    v14 = CDMOSLoggerForCategory(4);
    uint64_t v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v16 = [v10 handlerId];
      *(_DWORD *)buf = 138412290;
      os_signpost_id_t v24 = v16;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "handleNLUPreproces", "%@", buf, 0xCu);
    }
    serviceGraphRunner = self->_serviceGraphRunner;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __63__CDMComposerService__handleNLUPreprocessRequest_withCallback___block_invoke;
    v18[3] = &unk_2647A5090;
    id v19 = v10;
    os_signpost_id_t v22 = v13;
    id v20 = v9;
    id v21 = v7;
    [(CDMServiceGraphRunner *)serviceGraphRunner runHandlerAsync:v19 withCompletion:v18];
  }
}

void __63__CDMComposerService__handleNLUPreprocessRequest_withCallback___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = [*(id *)(a1 + 32) getResult];
    int v12 = 136315394;
    os_signpost_id_t v13 = "-[CDMComposerService _handleNLUPreprocessRequest:withCallback:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Get _handleNLUPreprocessRequest:%@", (uint8_t *)&v12, 0x16u);
  }
  v3 = CDMOSLoggerForCategory(4);
  os_signpost_id_t v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v4, OS_SIGNPOST_INTERVAL_END, v5, "handleNLUPreproces", "", (uint8_t *)&v12, 2u);
  }

  id v6 = [*(id *)(a1 + 32) getResult];
  id v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315394;
    os_signpost_id_t v13 = "-[CDMComposerService _handleNLUPreprocessRequest:withCallback:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s Get CDMNLUPreprocessResponseCommand:%@", (uint8_t *)&v12, 0x16u);
  }

  uint64_t v8 = [*(id *)(a1 + 32) getError];
  if (!v8)
  {
    uint64_t v9 = [v6 preprocessingWrapper];
    +[CDMDataDispatcher dispatchCdmPreprocessingWrapperData:v9 requestId:*(void *)(a1 + 40)];
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(uint64_t, void *, void *))(v10 + 16))(v10, v6, v8);
  }
}

- (void)_handleNLURequest:(id)a3 withCallback:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  languageCode = self->_languageCode;
  uint64_t v9 = [v6 siriNLUTypeObj];
  +[CDMAnalytics recordReceivedNluRequestEvent:languageCode withNluRequest:v9];

  uint64_t v10 = [v6 siriNLUTypeObj];
  uint64_t v11 = [v10 requestId];

  +[CDMComposerServiceUtils logNluRequestForInsights:v6];
  int v12 = [(CDMComposerService *)self prepareRequestHandler:v6 withCallback:v7];
  if (v12)
  {
    os_signpost_id_t v13 = CDMOSLoggerForCategory(4);
    os_signpost_id_t v14 = os_signpost_id_generate(v13);

    uint64_t v15 = CDMOSLoggerForCategory(4);
    uint64_t v16 = v15;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      v17 = [v12 handlerId];
      *(_DWORD *)buf = 138543362;
      id v26 = v17;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "handleNLU", "%{public}@", buf, 0xCu);
    }
    serviceGraphRunner = self->_serviceGraphRunner;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __53__CDMComposerService__handleNLURequest_withCallback___block_invoke;
    v19[3] = &unk_2647A5068;
    os_signpost_id_t v24 = v14;
    id v20 = v12;
    id v21 = v11;
    id v22 = v6;
    id v23 = v7;
    [(CDMServiceGraphRunner *)serviceGraphRunner runHandlerAsync:v20 withCompletion:v19];
  }
}

void __53__CDMComposerService__handleNLURequest_withCallback___block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  v1 = CDMOSLoggerForCategory(4);
  v2 = v1;
  os_signpost_id_t v3 = *(void *)(a1 + 64);
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v1))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v2, OS_SIGNPOST_INTERVAL_END, v3, "handleNLU", "", buf, 2u);
  }

  v42 = [*(id *)(a1 + 32) getResult];
  uint64_t v4 = [*(id *)(a1 + 32) getError];
  os_signpost_id_t v5 = CDMLogContext;
  v43 = (__CFString *)v4;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v52 = "-[CDMComposerService _handleNLURequest:withCallback:]_block_invoke";
      __int16 v53 = 2112;
      v54 = @"summary";
      __int16 v55 = 2112;
      v56 = v43;
      _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nServiceGraphError: %@", buf, 0x20u);
    }
    id v6 = [(__CFString *)v43 domain];
    uint64_t v7 = [(__CFString *)v43 code];
    uint64_t v8 = +[CDMSELFLogUtil createSELFMetadataWithRequestId:*(void *)(a1 + 40)];
    uint64_t v9 = [*(id *)(a1 + 48) dataDispatcherContext];
    +[CDMSELFLogUtil cdmFailed:12 errorDomainString:v6 errorCode:v7 metadata:v8 logMessage:@"SELF CDM Request failed message emitted" dataDispatcherContext:v9];

    uint64_t v10 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[CDMComposerService _handleNLURequest:withCallback:]_block_invoke";
      __int16 v53 = 2112;
      v54 = v43;
      _os_log_error_impl(&dword_2263A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: Sending Error to SiriRequestDispatch (SRD) via callback in CDMClient, Error:%@", buf, 0x16u);
    }

    uint64_t v11 = [CDMGenericSendCommand alloc];
    int v12 = [*(id *)(a1 + 48) clientId];
    os_signpost_id_t v13 = [(CDMGenericSendCommand *)v11 initWithError:v43 clientId:v12];
  }
  else
  {
    os_signpost_id_t v14 = (id)CDMLogContext;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = (void *)MEMORY[0x263F71F80];
      uint64_t v16 = [v42 siriNLUTypeObj];
      v17 = [v15 printableResponse:v16];
      *(_DWORD *)buf = 136315650;
      v52 = "-[CDMComposerService _handleNLURequest:withCallback:]_block_invoke";
      __int16 v53 = 2112;
      v54 = @"cdmio";
      __int16 v55 = 2112;
      v56 = v17;
      _os_log_impl(&dword_2263A0000, v14, OS_LOG_TYPE_INFO, "%s [insights-cdm-%@]:\nServiceGraphNLUResponse: %@", buf, 0x20u);
    }
    v18 = (id)CDMLogContext;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v42 requestId];
      *(_DWORD *)buf = 136315650;
      v52 = "-[CDMComposerService _handleNLURequest:withCallback:]_block_invoke";
      __int16 v53 = 2112;
      v54 = @"summary";
      __int16 v55 = 2114;
      v56 = v19;
      _os_log_impl(&dword_2263A0000, v18, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nRequest for NLUResponse: %{public}@", buf, 0x20u);
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v20 = [v42 siriNLUTypeObj];
    id obj = [v20 parses];

    uint64_t v21 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v47 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          if (+[CDMPlatformUtils isInternalInstall])
          {
            uint64_t v25 = (id)CDMLogContext;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              id v26 = [MEMORY[0x263F71F80] printableUserParse:v24];
              *(_DWORD *)buf = 136315650;
              v52 = "-[CDMComposerService _handleNLURequest:withCallback:]_block_invoke";
              __int16 v53 = 2112;
              v54 = @"summary";
              __int16 v55 = 2112;
              v56 = v26;
              _os_log_impl(&dword_2263A0000, v25, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nParses From NLUResponse: %@", buf, 0x20u);
            }
          }
          else
          {
            uint64_t v25 = [MEMORY[0x263F71F88] redactUserParse:v24];
            uint64_t v27 = CDMLogContext;
            if (v25)
            {
              uint64_t v28 = (id)CDMLogContext;
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                id v29 = [MEMORY[0x263F71F80] printableUserParse:v25];
                *(_DWORD *)buf = 136315650;
                v52 = "-[CDMComposerService _handleNLURequest:withCallback:]_block_invoke";
                __int16 v53 = 2112;
                v54 = @"summary";
                __int16 v55 = 2114;
                v56 = v29;
                _os_log_impl(&dword_2263A0000, v28, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nParses From NLUResponse: %{public}@", buf, 0x20u);
              }
            }
            else
            {
              if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v52 = "-[CDMComposerService _handleNLURequest:withCallback:]_block_invoke";
                __int16 v53 = 2112;
                v54 = @"summary";
                _os_log_impl(&dword_2263A0000, v27, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nUnable to redact parse", buf, 0x16u);
              }
              uint64_t v25 = 0;
            }
          }
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
      }
      while (v21);
    }

    uint64_t v30 = [v42 siriNLUTypeObj];
    v31 = [v30 parses];
    BOOL v32 = [v31 count] == 0;

    if (v32)
    {
      v33 = CDMLogContext;
      if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v52 = "-[CDMComposerService _handleNLURequest:withCallback:]_block_invoke";
        __int16 v53 = 2112;
        v54 = @"summary";
        _os_log_impl(&dword_2263A0000, v33, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nParses From NLUResponse: None", buf, 0x16u);
      }
    }
    __int16 v34 = [v42 siriNLUTypeObj];
    uint64_t v35 = *(void *)(a1 + 40);
    uint64_t v36 = [*(id *)(a1 + 48) dataDispatcherContext];
    +[CDMDataDispatcher dispatchCdmResponseData:v34 requestId:v35 dataDispatcherContext:v36];

    __int16 v37 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v52 = "-[CDMComposerService _handleNLURequest:withCallback:]_block_invoke";
      _os_log_debug_impl(&dword_2263A0000, v37, OS_LOG_TYPE_DEBUG, "%s Sending CDMNluResponse to SiriRequestDispatch (SRD) via callback in CDMClient", buf, 0xCu);
    }

    __int16 v38 = [CDMNluResponse alloc];
    __int16 v39 = [v42 siriNLUTypeObj];
    int v12 = [(CDMNluResponse *)v38 initWithObjcProto:v39];

    uint64_t v40 = [CDMGenericSendCommand alloc];
    uint64_t v41 = [*(id *)(a1 + 48) clientId];
    os_signpost_id_t v13 = [(CDMGenericSendCommand *)v40 initWithCDMNluResponse:v12 clientId:v41];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)failWithError:(id)a3 callback:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, CDMGenericSendCommand *, id))a4;
  uint64_t v7 = [[CDMGenericSendCommand alloc] initWithError:v8 clientId:@"CDM-embedding-client"];
  if (v6) {
    v6[2](v6, v7, v8);
  }
  else {
    [(CDMBaseService *)self publish:v7];
  }
}

- (void)failWithError:(id)a3 rawCommand:(id)a4 callback:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *, void))a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v9;
    int v12 = [CDMGenericSendCommand alloc];
    os_signpost_id_t v13 = [v11 clientId];
    os_signpost_id_t v14 = [(CDMGenericSendCommand *)v12 initWithError:v8 clientId:v13];

    if (v10)
    {
      if ([v8 code] == 2)
      {
        uint64_t v15 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v24 = 136315394;
          uint64_t v25 = "-[CDMComposerService failWithError:rawCommand:callback:]";
          __int16 v26 = 2112;
          id v27 = v8;
          _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s [WARN]: In response to an invalid NLUInput (i.e. empty utterance), CDM responding with StatusCode of EMPTY_NLU_REQUEST (code 101). Error:%@", (uint8_t *)&v24, 0x16u);
        }

        uint64_t v16 = [v11 siriNLUTypeObj];
        v17 = [v16 requestId];
        v18 = +[SiriNLUTypesUtils createResponse:v17 statusCode:101];

        id v19 = [[CDMNluResponse alloc] initWithObjcProto:v18];
        id v20 = [CDMGenericSendCommand alloc];
        uint64_t v21 = [v11 clientId];
        uint64_t v22 = [(CDMGenericSendCommand *)v20 initWithCDMNluResponse:v19 clientId:v21];

        id v23 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          int v24 = 136315138;
          uint64_t v25 = "-[CDMComposerService failWithError:rawCommand:callback:]";
          _os_log_debug_impl(&dword_2263A0000, v23, OS_LOG_TYPE_DEBUG, "%s Callback below explicitly setting NSError to nil as SiriRequestDispatch (SRD) expects an NLUResponse with status code of EMPTY_NLU_REQUEST", (uint8_t *)&v24, 0xCu);
        }

        v10[2](v10, v22, 0);
      }
      else
      {
        ((void (**)(id, void *, id))v10)[2](v10, v14, v8);
      }
    }
    else
    {
      [(CDMBaseService *)self publish:v14];
    }
  }
  else
  {
    [(CDMComposerService *)self failWithError:v8 callback:v10];
  }
}

- (void)_handleListGraphs:(id)a3 withCallback:(id)a4
{
  id v6 = (void (**)(id, CDMListGraphsResponseCommand *, void))a4;
  os_signpost_id_t v5 = [[CDMListGraphsResponseCommand alloc] initWithGraphs:self->_availableServiceGraphs];
  v6[2](v6, v5, 0);
}

- (void)updateGraphServices:(id)a3
{
}

@end