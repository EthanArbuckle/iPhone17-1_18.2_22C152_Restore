@interface CDMServiceGraph
+ (BOOL)isServiceRequiredForSetup:(id)a3;
+ (BOOL)requiresAssets;
+ (BOOL)shouldSkipNode:(id)a3 service:(id)a4;
+ (id)getAssetsForSetup:(id)a3;
+ (id)getUsageForAssetSetName:(int64_t)a3 withLocale:(id)a4;
+ (id)requestFeatureStoreStreamId;
+ (id)requiredCDMGraphServices;
+ (id)requiredDAGServices;
+ (id)responseFeatureStoreStreamId;
+ (id)serializeFeatureStoreWithRequestCmd:(id)a3;
+ (id)serializeFeatureStoreWithResponseCmd:(id)a3;
+ (int)getCdmRequesterWithConnectionId:(id)a3;
+ (int)getNLXSchemaCDMServiceGraphName;
+ (void)dispatchServiceGraphHandleMetricsLogging:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5;
+ (void)dispatchServiceGraphRequestLogging:(id)a3 dataDispatcherContext:(id)a4;
+ (void)dispatchServiceGraphResponseLogging:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5;
- (BOOL)isAcyclic;
- (CDMDataDispatcherContext)cdmDataDispatcherContext;
- (CDMServiceGraph)init;
- (CDMServiceGraph)initWithServices:(id)a3 graphInput:(id)a4 languageCode:(id)a5 handlerId:(id)a6 aneLock:(id)a7 dataDispatcherContext:(id)a8;
- (CDMServiceGraph)initWithServices:(id)a3 graphServices:(id)a4 graphInput:(id)a5 languageCode:(id)a6 handlerId:(id)a7 aneLock:(id)a8 dataDispatcherContext:(id)a9;
- (Class)supportedGraphInputType;
- (NSError)error;
- (NSMutableArray)serviceMetrics;
- (id)addNodeWithName:(id)a3 aneEnabled:(BOOL)a4 requestId:(id)a5 block:(id)a6;
- (id)addNodeWithName:(id)a3 bindService:(id)a4 aneEnabled:(BOOL)a5 requestId:(id)a6 block:(id)a7;
- (id)addNodeWithName:(id)a3 bindService:(id)a4 requestId:(id)a5 block:(id)a6;
- (id)addNodeWithName:(id)a3 requestId:(id)a4 block:(id)a5;
- (id)getEndNode;
- (id)getError;
- (id)getGraphInput;
- (id)getGraphOutput;
- (id)getGraphServiceByClass:(Class)a3;
- (id)getHandlerId;
- (id)getLanguage;
- (id)getNodes;
- (id)getNodesWithName;
- (id)getServiceByClass:(Class)a3;
- (id)getSkippedNodes;
- (id)toMermaid;
- (id)topoSort;
- (id)validateRequest:(id)a3;
- (void)buildGraph;
- (void)buildGraphInternal;
- (void)failedWithError:(id)a3;
- (void)failedWithErrorCode:(int64_t)a3 errorDomain:(id)a4 message:(id)a5;
- (void)populateRequesterEnumForNluRequest:(id)a3;
- (void)setCdmDataDispatcherContext:(id)a3;
- (void)setError:(id)a3;
- (void)setGraphOutput:(id)a3;
- (void)setServiceMetrics:(id)a3;
- (void)skipNode:(id)a3 basedOnNode:(id)a4 withCondition:(id)a5;
@end

@implementation CDMServiceGraph

+ (id)getAssetsForSetup:(id)a3
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v38 = a3;
  v4 = [CDMAssetsInfo alloc];
  id v39 = a1;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v37 = [(CDMAssetsInfo *)v4 initWithGraphName:v6];

  v7 = [MEMORY[0x263EFF9A0] dictionary];
  [v39 requiredDAGServices];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v33 = [obj countByEnumeratingWithState:&v57 objects:v68 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v58 != v34) {
          objc_enumerationMutation(obj);
        }
        v8 = *(NSString **)(*((void *)&v57 + 1) + 8 * i);
        BOOL v42 = +[CDMServiceGraph isServiceRequiredForSetup:v8];
        v9 = [NSClassFromString(v8) getCDMServiceAssetConfig];
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        v44 = v9;
        v10 = [v9 getAllAssetSets];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v53 objects:v67 count:16];
        if (v11)
        {
          id v40 = v10;
          uint64_t v41 = *(void *)v54;
          do
          {
            uint64_t v43 = v11;
            for (uint64_t j = 0; j != v43; ++j)
            {
              if (*(void *)v54 != v41) {
                objc_enumerationMutation(v40);
              }
              v13 = *(void **)(*((void *)&v53 + 1) + 8 * j);
              v14 = objc_msgSend(v44, "getCDMAssetsFactorConfigForAssetSet:", objc_msgSend(v13, "integerValue"));
              v15 = [v7 objectForKeyedSubscript:v13];

              if (v15)
              {
                v16 = [v7 objectForKeyedSubscript:v13];
                [v16 addEntriesFromCDMAssetsFactorConfig:v14];
              }
              else
              {
                v17 = [CDMAssetsFactorConfig alloc];
                v16 = [v14 getFactorToFoldersMapping];
                v18 = [(CDMAssetsFactorConfig *)v17 initWithFactorToFoldersMapping:v16];
                [v7 setObject:v18 forKeyedSubscript:v13];
              }
              if (v42)
              {
                long long v51 = 0u;
                long long v52 = 0u;
                long long v49 = 0u;
                long long v50 = 0u;
                v19 = [v44 getAllFactors];
                uint64_t v20 = [v19 countByEnumeratingWithState:&v49 objects:v66 count:16];
                if (v20)
                {
                  uint64_t v21 = *(void *)v50;
                  do
                  {
                    for (uint64_t k = 0; k != v20; ++k)
                    {
                      if (*(void *)v50 != v21) {
                        objc_enumerationMutation(v19);
                      }
                      uint64_t v23 = *(void *)(*((void *)&v49 + 1) + 8 * k);
                      v24 = [v7 objectForKeyedSubscript:v13];
                      [v24 setIsRequiredForFactor:v23 isRequired:1];
                    }
                    uint64_t v20 = [v19 countByEnumeratingWithState:&v49 objects:v66 count:16];
                  }
                  while (v20);
                }
              }
            }
            v10 = v40;
            uint64_t v11 = [v40 countByEnumeratingWithState:&v53 objects:v67 count:16];
          }
          while (v11);
        }
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v57 objects:v68 count:16];
    }
    while (v33);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v25 = v7;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v45 objects:v65 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v46;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v46 != v27) {
          objc_enumerationMutation(v25);
        }
        v29 = *(void **)(*((void *)&v45 + 1) + 8 * m);
        v30 = objc_msgSend(v39, "getUsageForAssetSetName:withLocale:", objc_msgSend(v29, "integerValue"), v38);
        if (v30)
        {
          v31 = [v25 objectForKeyedSubscript:v29];
          -[CDMAssetsInfo setAssetsUsages:withCDMAssetsFactorConfig:forCDMAssetSet:](v37, "setAssetsUsages:withCDMAssetsFactorConfig:forCDMAssetSet:", v30, v31, [v29 integerValue]);
        }
        else
        {
          v31 = CDMOSLoggerForCategory(2);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v62 = "+[CDMServiceGraph getAssetsForSetup:]";
            __int16 v63 = 2112;
            v64 = v29;
            _os_log_error_impl(&dword_2263A0000, v31, OS_LOG_TYPE_ERROR, "%s [ERR]: Usages not found for %@, skipping assets for this cdmAssetSet for setup", buf, 0x16u);
          }
        }
      }
      uint64_t v26 = [v25 countByEnumeratingWithState:&v45 objects:v65 count:16];
    }
    while (v26);
  }

  return v37;
}

+ (BOOL)isServiceRequiredForSetup:(id)a3
{
  v3 = (NSString *)a3;
  if ([NSClassFromString(v3) isEnabled]
    && ([NSClassFromString(v3) getCDMServiceAssetConfig],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isAssetRequiredForSetup],
        v4,
        v5))
  {
    v6 = [NSClassFromString(v3) getCDMServiceAssetConfig];
    v7 = [v6 getCDMAssetSetToFactorsConfig];
    char v8 = [v7 hasAssetSetToFactorsMapping];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceMetrics, 0);
  objc_storeStrong((id *)&self->_cdmDataDispatcherContext, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_skipNodes, 0);
  objc_storeStrong((id *)&self->_aneLock, 0);
  objc_storeStrong((id *)&self->_endNode, 0);
  objc_storeStrong((id *)&self->_handlerId, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong(&self->_graphInput, 0);
  objc_storeStrong(&self->_graphOutput, 0);
  objc_storeStrong((id *)&self->_graphServiceMap, 0);
  objc_storeStrong((id *)&self->_serviceMap, 0);
  objc_storeStrong((id *)&self->_nodesWithName, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

- (void)setServiceMetrics:(id)a3
{
}

- (NSMutableArray)serviceMetrics
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCdmDataDispatcherContext:(id)a3
{
}

- (CDMDataDispatcherContext)cdmDataDispatcherContext
{
  return self->_cdmDataDispatcherContext;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (id)getSkippedNodes
{
  return (id)[NSDictionary dictionaryWithDictionary:self->_skipNodes];
}

- (void)skipNode:(id)a3 basedOnNode:(id)a4 withCondition:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    v17 = CDMOSLoggerForCategory(2);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    int v21 = 136315394;
    v22 = "-[CDMServiceGraph skipNode:basedOnNode:withCondition:]";
    __int16 v23 = 2112;
    id v24 = v8;
    v18 = "%s [WARN]: Empty skip condition for node:%@";
LABEL_14:
    v19 = v17;
    uint32_t v20 = 22;
LABEL_15:
    _os_log_impl(&dword_2263A0000, v19, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v21, v20);
    goto LABEL_16;
  }
  if (([(NSMutableArray *)self->_nodes containsObject:v8] & 1) == 0)
  {
    v17 = CDMOSLoggerForCategory(2);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    int v21 = 136315394;
    v22 = "-[CDMServiceGraph skipNode:basedOnNode:withCondition:]";
    __int16 v23 = 2112;
    id v24 = v8;
    v18 = "%s [WARN]: Node is not found in graph:%@";
    goto LABEL_14;
  }
  if (([(NSMutableArray *)self->_nodes containsObject:v9] & 1) == 0)
  {
    v17 = CDMOSLoggerForCategory(2);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315394;
      v22 = "-[CDMServiceGraph skipNode:basedOnNode:withCondition:]";
      __int16 v23 = 2112;
      id v24 = v9;
      v18 = "%s [WARN]: Node is not found in graph:%@";
      goto LABEL_14;
    }
LABEL_16:

    goto LABEL_17;
  }
  if (v8 == v9)
  {
    v17 = CDMOSLoggerForCategory(2);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    int v21 = 136315138;
    v22 = "-[CDMServiceGraph skipNode:basedOnNode:withCondition:]";
    v18 = "%s [WARN]: Same node provided as base node, ignored";
    v19 = v17;
    uint32_t v20 = 12;
    goto LABEL_15;
  }
  uint64_t v11 = [v9 getNodeName];
  v12 = [v8 getNodeName];
  v13 = [(NSMutableDictionary *)self->_skipNodes objectForKey:v11];

  if (!v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(NSMutableDictionary *)self->_skipNodes setObject:v14 forKeyedSubscript:v11];
  }
  v15 = _Block_copy(v10);
  v16 = [(NSMutableDictionary *)self->_skipNodes objectForKeyedSubscript:v11];
  [v16 setObject:v15 forKeyedSubscript:v12];

LABEL_17:
}

- (void)populateRequesterEnumForNluRequest:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 requestId];
  if (v4)
  {
    int v5 = v4;
    v6 = [v3 requestId];
    uint64_t v7 = [v6 connectionId];
    if (!v7) {
      goto LABEL_6;
    }
    id v8 = (void *)v7;
    id v9 = [v3 requestId];
    int v10 = [v9 requester];

    if (!v10)
    {
      uint64_t v11 = [v3 requestId];
      v12 = [v11 connectionId];
      uint64_t v13 = +[CDMServiceGraph getCdmRequesterWithConnectionId:v12];
      id v14 = [v3 requestId];
      [v14 setRequester:v13];

      int v5 = CDMOSLoggerForCategory(2);
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
LABEL_7:

        goto LABEL_8;
      }
      v6 = [v3 requestId];
      v15 = [v6 connectionId];
      v16 = [v3 requestId];
      int v17 = 136315650;
      v18 = "-[CDMServiceGraph populateRequesterEnumForNluRequest:]";
      __int16 v19 = 2112;
      uint32_t v20 = v15;
      __int16 v21 = 1024;
      int v22 = [v16 requester];
      _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Inferring cdmRequester enum based on connectionId=%@ as requester enum=%d; use enum directly once SRD / other"
        " callers of CDM start populating RequestID.requester",
        (uint8_t *)&v17,
        0x1Cu);

LABEL_6:
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (id)validateRequest:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = v4;
  if (!v4) {
    goto LABEL_17;
  }
  uint64_t v6 = [v4 currentTurnInput];
  if (!v6) {
    goto LABEL_17;
  }
  uint64_t v7 = (void *)v6;
  id v8 = [v5 currentTurnInput];
  id v9 = [v8 asrOutputs];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v34 = self;
    v35 = v5;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v11 = [v5 currentTurnInput];
    v12 = [v11 asrOutputs];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v50 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v12);
          }
          int v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          v18 = [v17 utterance];
          __int16 v19 = (void *)[v18 mutableCopy];

          uint32_t v20 = skitRemoveBidiCharacters();
          [v17 setUtterance:v20];

          __int16 v21 = CDMOSLoggerForCategory(2);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v22 = [v19 length];
            uint64_t v23 = [v17 utterance];
            id v24 = [v17 utterance];
            uint64_t v25 = [v24 length];
            *(_DWORD *)buf = 136316162;
            uint64_t v41 = "-[CDMServiceGraph validateRequest:]";
            __int16 v42 = 2112;
            uint64_t v43 = v19;
            __int16 v44 = 2048;
            uint64_t v45 = v22;
            __int16 v46 = 2112;
            long long v47 = v23;
            __int16 v48 = 2048;
            uint64_t v49 = v25;
            _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, "%s Original text is '<%@>' with u16 size <%zu>. Text after filtering bidi characters is' <%@>' with u16 size <%zu>.", buf, 0x34u);
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v50 count:16];
      }
      while (v14);
    }

    int v5 = v35;
    uint64_t v26 = [v35 currentTurnInput];
    uint64_t v27 = [v26 asrOutputs];
    v28 = [v27 firstObject];

    v29 = [v28 utterance];
    if (v29)
    {
      v30 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      v31 = [v29 stringByTrimmingCharactersInSet:v30];

      if ([v31 length] && objc_msgSend(v29, "length"))
      {
        id v32 = v28;
      }
      else
      {
        [(CDMServiceGraph *)v34 failedWithErrorCode:2 errorDomain:@"CDMServiceGraphErrorDomain" message:@"utterance is empty"];
        id v32 = 0;
      }
    }
    else
    {
      [(CDMServiceGraph *)v34 failedWithErrorCode:2 errorDomain:@"CDMServiceGraphErrorDomain" message:@"utterance is nil"];
      id v32 = 0;
    }
  }
  else
  {
LABEL_17:
    [(CDMServiceGraph *)self failedWithErrorCode:2 errorDomain:@"CDMServiceGraphErrorDomain" message:@"nluRequest is empty"];
    id v32 = 0;
  }

  return v32;
}

- (void)failedWithError:(id)a3
{
  language = self->_language;
  id v5 = a3;
  +[CDMAnalytics recordGraphFailureEvent:language withError:v5];
  id v6 = (id)[v5 copy];

  [(CDMServiceGraph *)self setError:v6];
}

- (void)failedWithErrorCode:(int64_t)a3 errorDomain:(id)a4 message:(id)a5
{
  v17[1] = *MEMORY[0x263EF8340];
  id v8 = (void *)MEMORY[0x263F087E8];
  uint64_t v16 = *MEMORY[0x263F08320];
  v17[0] = a5;
  id v9 = NSDictionary;
  id v10 = a5;
  id v11 = a4;
  v12 = [v9 dictionaryWithObjects:v17 forKeys:&v16 count:1];
  uint64_t v13 = [v8 errorWithDomain:v11 code:a3 userInfo:v12];

  [(CDMServiceGraph *)self setError:v13];
  language = self->_language;
  uint64_t v15 = [(CDMServiceGraph *)self error];
  +[CDMAnalytics recordGraphFailureEvent:language withError:v15];
}

- (id)getHandlerId
{
  return self->_handlerId;
}

- (id)getEndNode
{
  return self->_endNode;
}

- (id)getLanguage
{
  return self->_language;
}

- (id)addNodeWithName:(id)a3 bindService:(id)a4 aneEnabled:(BOOL)a5 requestId:(id)a6 block:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v38 = a6;
  id v14 = a7;
  uint64_t v15 = _Block_copy(v14);
  id v35 = v14;
  if (v9)
  {
    objc_initWeak(location, self->_aneLock);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__CDMServiceGraph_addNodeWithName_bindService_aneEnabled_requestId_block___block_invoke;
    aBlock[3] = &unk_2647A4AF8;
    objc_copyWeak(&v45, location);
    id v44 = v14;
    uint64_t v16 = _Block_copy(aBlock);

    objc_destroyWeak(&v45);
    objc_destroyWeak(location);
    uint64_t v15 = v16;
  }
  long long v37 = v13;
  if (+[CDMServiceGraph shouldSkipNode:v12 service:v13])
  {
    objc_initWeak(location, self);
    handlerId = self->_handlerId;
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __74__CDMServiceGraph_addNodeWithName_bindService_aneEnabled_requestId_block___block_invoke_2;
    v41[3] = &unk_2647A4B20;
    v18 = &v42;
    objc_copyWeak(&v42, location);
    id WeakRetained = objc_loadWeakRetained(location);
    uint32_t v20 = [WeakRetained cdmDataDispatcherContext];
    id v21 = objc_loadWeakRetained(location);
    uint64_t v22 = [v21 serviceMetrics];
    uint64_t v23 = +[CDMServiceGraphNode initWithName:forHandler:withError:usingFunction:requestId:dataDispatcherContext:serviceMetricsArray:](CDMServiceGraphNode, "initWithName:forHandler:withError:usingFunction:requestId:dataDispatcherContext:serviceMetricsArray:", v12, handlerId, v41, &__block_literal_global_433, v38, v20, v22, v35);
  }
  else
  {
    objc_initWeak(location, self);
    id v24 = self->_handlerId;
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __74__CDMServiceGraph_addNodeWithName_bindService_aneEnabled_requestId_block___block_invoke_4;
    v39[3] = &unk_2647A4B20;
    v18 = &v40;
    objc_copyWeak(&v40, location);
    id WeakRetained = objc_loadWeakRetained(location);
    uint32_t v20 = [WeakRetained cdmDataDispatcherContext];
    id v21 = objc_loadWeakRetained(location);
    uint64_t v22 = [v21 serviceMetrics];
    uint64_t v23 = +[CDMServiceGraphNode initWithName:forHandler:withError:usingFunction:requestId:dataDispatcherContext:serviceMetricsArray:](CDMServiceGraphNode, "initWithName:forHandler:withError:usingFunction:requestId:dataDispatcherContext:serviceMetricsArray:", v12, v24, v39, v15, v38, v20, v22, v35);
  }
  uint64_t v25 = (void *)v23;

  objc_destroyWeak(v18);
  objc_destroyWeak(location);
  [(NSMutableArray *)self->_nodes addObject:v25];
  nodesWithName = self->_nodesWithName;
  uint64_t v27 = [v25 getNodeName];
  v28 = [(NSMutableDictionary *)nodesWithName objectForKey:v27];

  if (v28)
  {
    v29 = NSString;
    v30 = [v25 getNodeName];
    v31 = [v29 stringWithFormat:@"Duplicate node name: %@", v30];

    +[DuplicateNodeNameException raise:@"DuplicateNodeNameException", @"%@", v31 format];
  }
  id v32 = self->_nodesWithName;
  uint64_t v33 = [v25 getNodeName];
  [(NSMutableDictionary *)v32 setValue:v25 forKey:v33];

  return v25;
}

void __74__CDMServiceGraph_addNodeWithName_bindService_aneEnabled_requestId_block___block_invoke(uint64_t a1, void *a2)
{
  objc_initWeak(&location, a2);
  id v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained lock];

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = objc_loadWeakRetained(&location);
  (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

  id v7 = objc_loadWeakRetained(v3);
  [v7 unlock];

  objc_destroyWeak(&location);
}

void __74__CDMServiceGraph_addNodeWithName_bindService_aneEnabled_requestId_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained failedWithError:v5];
  }
}

void __74__CDMServiceGraph_addNodeWithName_bindService_aneEnabled_requestId_block___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained failedWithError:v5];
  }
}

- (id)addNodeWithName:(id)a3 bindService:(id)a4 requestId:(id)a5 block:(id)a6
{
  return [(CDMServiceGraph *)self addNodeWithName:a3 bindService:a4 aneEnabled:0 requestId:a5 block:a6];
}

- (id)addNodeWithName:(id)a3 aneEnabled:(BOOL)a4 requestId:(id)a5 block:(id)a6
{
  return [(CDMServiceGraph *)self addNodeWithName:a3 bindService:0 aneEnabled:a4 requestId:a5 block:a6];
}

- (id)addNodeWithName:(id)a3 requestId:(id)a4 block:(id)a5
{
  return [(CDMServiceGraph *)self addNodeWithName:a3 bindService:0 aneEnabled:0 requestId:a4 block:a5];
}

- (id)getGraphInput
{
  return self->_graphInput;
}

- (id)getGraphServiceByClass:(Class)a3
{
  graphServiceMap = self->_graphServiceMap;
  id v5 = NSStringFromClass(a3);
  id v6 = [(NSMutableDictionary *)graphServiceMap valueForKey:v5];

  if (!v6)
  {
    id v7 = NSString;
    id v8 = NSStringFromClass(a3);
    BOOL v9 = [v7 stringWithFormat:@"Service type %@ is unknown", v8];

    +[UnknownServiceException raise:@"UnknownServiceException", @"%@", v9 format];
  }
  return v6;
}

- (id)getServiceByClass:(Class)a3
{
  serviceMap = self->_serviceMap;
  id v5 = NSStringFromClass(a3);
  id v6 = [(NSMutableDictionary *)serviceMap valueForKey:v5];

  if (!v6)
  {
    id v7 = NSString;
    id v8 = NSStringFromClass(a3);
    BOOL v9 = [v7 stringWithFormat:@"Service type %@ is unknown", v8];

    +[UnknownServiceException raise:@"UnknownServiceException", @"%@", v9 format];
  }
  return v6;
}

- (id)getGraphOutput
{
  return self->_graphOutput;
}

- (void)setGraphOutput:(id)a3
{
}

- (BOOL)isAcyclic
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (!self->_endNode)
  {
    id v3 = CDMOSLoggerForCategory(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315394;
      id v8 = "-[CDMServiceGraph isAcyclic]";
      __int16 v9 = 2112;
      id v10 = @"Graph hasn't been built yet, building one...";
      _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v7, 0x16u);
    }

    [(CDMServiceGraph *)self buildGraphInternal];
  }
  id v4 = [(CDMServiceGraph *)self topoSort];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)topoSort
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (!self->_endNode)
  {
    v2 = CDMOSLoggerForCategory(2);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CDMServiceGraph topoSort]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = @"Graph hasn't been built yet, building one...";
      _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
    }

    [(CDMServiceGraph *)self buildGraphInternal];
  }
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = [(CDMServiceGraph *)self getNodes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        __int16 v9 = [v8 getNodeName];
        id v10 = [v8 getNodeName];
        int v11 = [v3 containsObject:v10];

        if (v11)
        {
          id v12 = [NSString stringWithFormat:@"Duplicate CDMServiceGraphNode name: %@", v9];
          +[DuplicateNodeNameException raise:@"DuplicateNodeNameException", @"%@", v12 format];
        }
        [v3 addObject:v9];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v5);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__3498;
  v28 = __Block_byref_object_dispose__3499;
  id v29 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __27__CDMServiceGraph_topoSort__block_invoke;
  aBlock[3] = &unk_2647A4AD0;
  void aBlock[4] = buf;
  id v13 = _Block_copy(aBlock);
  id v14 = *(void **)(*(void *)&buf[8] + 40);
  *(void *)(*(void *)&buf[8] + 40) = v13;

  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if ((*(unsigned int (**)(void))(*(void *)(*(void *)&buf[8] + 40) + 16))()) {
    int v17 = v15;
  }
  else {
    int v17 = 0;
  }
  id v18 = v17;

  _Block_object_dispose(buf, 8);
  return v18;
}

uint64_t __27__CDMServiceGraph_topoSort__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    id v10 = [v7 getNodeName];
    int v11 = [v9 objectForKeyedSubscript:v10];
    int v12 = [v11 intValue];

    if (v12 == 1)
    {
LABEL_16:
      uint64_t v22 = 0;
    }
    else
    {
      id v13 = [v9 objectForKeyedSubscript:v10];
      int v14 = [v13 intValue];

      if (v14 != 2)
      {
        id v15 = [NSNumber numberWithInt:1];
        [v9 setObject:v15 forKeyedSubscript:v10];

        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v16 = objc_msgSend(v7, "dependencies", 0);
        uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v25;
          while (2)
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v25 != v19) {
                objc_enumerationMutation(v16);
              }
              if (!(*(unsigned int (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))())
              {

                goto LABEL_16;
              }
              ++v20;
            }
            while (v18 != v20);
            uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }

        id v21 = [NSNumber numberWithInt:2];
        [v9 setObject:v21 forKeyedSubscript:v10];

        [v8 addObject:v7];
      }
      uint64_t v22 = 1;
    }
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

- (id)toMermaid
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (!self->_endNode)
  {
    id v3 = CDMOSLoggerForCategory(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      id v35 = "-[CDMServiceGraph toMermaid]";
      __int16 v36 = 2112;
      long long v37 = @"Graph hasn't been built yet, building one...";
      _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
    }

    [(CDMServiceGraph *)self buildGraphInternal];
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = self->_nodes;
  uint64_t v22 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v29;
    id v4 = &stru_26DA24FF0;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v5;
        uint64_t v6 = *(void **)(*((void *)&v28 + 1) + 8 * v5);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v7 = [v6 dependencies];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v25;
          do
          {
            uint64_t v11 = 0;
            int v12 = v4;
            do
            {
              if (*(void *)v25 != v10) {
                objc_enumerationMutation(v7);
              }
              id v13 = NSString;
              int v14 = [*(id *)(*((void *)&v24 + 1) + 8 * v11) getNodeName];
              id v15 = [v6 getNodeName];
              id v16 = [v13 stringWithFormat:@"  %@-->%@\n", v14, v15];

              id v4 = [(__CFString *)v12 stringByAppendingString:v16];

              ++v11;
              int v12 = v4;
            }
            while (v9 != v11);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v23 + 1;
      }
      while (v23 + 1 != v22);
      uint64_t v22 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v22);
  }
  else
  {
    id v4 = &stru_26DA24FF0;
  }

  uint64_t v17 = [NSString stringWithFormat:@"\n%@\n", @"graph TD"];
  uint64_t v18 = [NSString stringWithFormat:@"%@%@", v17, v4];

  return v18;
}

- (void)buildGraphInternal
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  [(CDMServiceGraph *)self buildGraph];
  id v3 = self->_handlerId;
  id v4 = [(CDMServiceGraph *)self addNodeWithName:@"endNode" requestId:0 block:&__block_literal_global_3509];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v5 = self->_nodes;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(v5);
        }
        if (*(void **)(*((void *)&v32 + 1) + 8 * i) != v4) {
          objc_msgSend(v4, "addDependency:");
        }
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v6);
  }

  objc_storeStrong((id *)&self->_endNode, v4);
  uint64_t v9 = [(CDMServiceGraph *)self getGraphInput];
  uint64_t v10 = [v9 loggingRequestID];

  uint64_t v11 = [(CDMServiceGraph *)self serviceMetrics];
  int v12 = [(CDMServiceGraph *)self cdmDataDispatcherContext];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __37__CDMServiceGraph_buildGraphInternal__block_invoke_393;
  v28[3] = &unk_2647A4AA8;
  id v13 = v11;
  id v29 = v13;
  id v30 = v10;
  id v14 = v12;
  id v31 = v14;
  id v23 = v30;
  id v15 = [(CDMServiceGraph *)self addNodeWithName:@"metricsNode" requestId:v30 block:v28];
  id v16 = v3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v17 = self->_nodes;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v17);
        }
        if (*(void **)(*((void *)&v24 + 1) + 8 * j) != v15) {
          objc_msgSend(v15, "addDependency:");
        }
      }
      uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v40 count:16];
    }
    while (v18);
  }

  uint64_t v21 = CDMOSLoggerForCategory(2);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = [(CDMServiceGraph *)self toMermaid];
    *(_DWORD *)buf = 136315394;
    long long v37 = "-[CDMServiceGraph buildGraphInternal]";
    __int16 v38 = 2112;
    long long v39 = v22;
    _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, "%s Mermaid graph%@", buf, 0x16u);
  }
}

uint64_t __37__CDMServiceGraph_buildGraphInternal__block_invoke_393(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[CDMServiceGraph buildGraphInternal]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMServiceGraph is attempting to emit service metrics log.", (uint8_t *)&v4, 0xCu);
  }

  return +[CDMServiceGraph dispatchServiceGraphHandleMetricsLogging:a1[4] requestId:a1[5] dataDispatcherContext:a1[6]];
}

- (void)buildGraph
{
}

- (id)getError
{
  return self->_error;
}

- (id)getNodesWithName
{
  return (id)[NSDictionary dictionaryWithDictionary:self->_nodesWithName];
}

- (id)getNodes
{
  return (id)[MEMORY[0x263EFF8C0] arrayWithArray:self->_nodes];
}

- (Class)supportedGraphInputType
{
  return 0;
}

- (CDMServiceGraph)init
{
  return 0;
}

- (CDMServiceGraph)initWithServices:(id)a3 graphServices:(id)a4 graphInput:(id)a5 languageCode:(id)a6 handlerId:(id)a7 aneLock:(id)a8 dataDispatcherContext:(id)a9
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  obuint64_t j = a6;
  id v18 = a6;
  id v80 = a7;
  id v19 = a7;
  id v81 = a8;
  id v20 = a8;
  id v21 = a9;
  v91.receiver = self;
  v91.super_class = (Class)CDMServiceGraph;
  uint64_t v22 = [(CDMServiceGraph *)&v91 init];
  if (v22)
  {
    v73 = v21;
    id v74 = v20;
    id v75 = v19;
    id v76 = v18;
    id v77 = v17;
    v82 = v16;
    id v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    serviceMap = v22->_serviceMap;
    v22->_serviceMap = v23;

    long long v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    graphServiceMap = v22->_graphServiceMap;
    v22->_graphServiceMap = v25;

    long long v27 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v15, "count"));
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v78 = v15;
    id v28 = v15;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v87 objects:v99 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v88;
      char v32 = 1;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v88 != v31) {
            objc_enumerationMutation(v28);
          }
          long long v34 = *(void **)(*((void *)&v87 + 1) + 8 * i);
          long long v35 = (objc_class *)objc_opt_class();
          __int16 v36 = NSStringFromClass(v35);
          [(NSMutableDictionary *)v22->_serviceMap setObject:v34 forKeyedSubscript:v36];
          if ([v34 serviceState] == 3)
          {
            long long v37 = [v34 serviceName];
            [v27 addObject:v37];

            char v32 = 0;
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v87 objects:v99 count:16];
      }
      while (v30);
    }
    else
    {
      char v32 = 1;
    }

    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v38 = v82;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v83 objects:v98 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v84;
      do
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v84 != v41) {
            objc_enumerationMutation(v38);
          }
          uint64_t v43 = *(void *)(*((void *)&v83 + 1) + 8 * j);
          id v44 = (objc_class *)objc_opt_class();
          id v45 = NSStringFromClass(v44);
          [(NSMutableDictionary *)v22->_graphServiceMap setObject:v43 forKeyedSubscript:v45];
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v83 objects:v98 count:16];
      }
      while (v40);
    }

    if (v32)
    {
      id v17 = v77;
      id v21 = v73;
      if ([(CDMServiceGraph *)v22 supportedGraphInputType])
      {
        [(CDMServiceGraph *)v22 supportedGraphInputType];
        id v15 = v78;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          __int16 v46 = NSString;
          uint64_t v47 = [(CDMServiceGraph *)v22 supportedGraphInputType];
          __int16 v48 = (objc_class *)objc_opt_class();
          uint64_t v49 = NSStringFromClass(v48);
          long long v50 = [v46 stringWithFormat:@"Incompatible type for graphInput, expected:%@, received:%@", v47, v49];

          uint64_t v51 = CDMOSLoggerForCategory(2);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v93 = "-[CDMServiceGraph initWithServices:graphServices:graphInput:languageCode:handlerId:aneLock:dataDispatcherContext:]";
            __int16 v94 = 2112;
            v95 = v50;
            _os_log_error_impl(&dword_2263A0000, v51, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
          }

          +[IncompatibleInputTypeException raise:@"IncompatibleInputTypeException", @"%@", v50 format];
        }
        objc_storeStrong(&v22->_graphInput, a5);
        long long v52 = v73;
        cdmDataDispatcherContext = v22->_cdmDataDispatcherContext;
        v22->_cdmDataDispatcherContext = v52;
      }
      else
      {
        cdmDataDispatcherContext = v22->_graphInput;
        v22->_graphInput = 0;
        id v15 = v78;
      }
      id v16 = v82;

      objc_storeStrong((id *)&v22->_language, obj);
      id graphOutput = v22->_graphOutput;
      v22->_id graphOutput = 0;

      error = v22->_error;
      v22->_error = 0;

      objc_storeStrong((id *)&v22->_handlerId, v80);
      v62 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      nodes = v22->_nodes;
      v22->_nodes = v62;

      v64 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      nodesWithName = v22->_nodesWithName;
      v22->_nodesWithName = v64;

      endNode = v22->_endNode;
      v22->_endNode = 0;

      objc_storeStrong((id *)&v22->_aneLock, v81);
      v67 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      skipNodes = v22->_skipNodes;
      v22->_skipNodes = v67;

      uint64_t v69 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      serviceMetrics = v22->_serviceMetrics;
      v22->_serviceMetrics = v69;

      [(CDMServiceGraph *)v22 buildGraphInternal];
    }
    else
    {
      long long v54 = [NSString stringWithFormat:@"Abort building service graph, the following services are not setup: %@", v27];
      long long v55 = (void *)MEMORY[0x263F087E8];
      uint64_t v96 = *MEMORY[0x263F08320];
      v97 = v54;
      long long v56 = [NSDictionary dictionaryWithObjects:&v97 forKeys:&v96 count:1];
      uint64_t v57 = [v55 errorWithDomain:@"CDMServiceGraphErrorDomain" code:3 userInfo:v56];
      long long v58 = v22->_error;
      v22->_error = (NSError *)v57;

      long long v59 = CDMOSLoggerForCategory(2);
      id v17 = v77;
      id v21 = v73;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        v72 = +[CDMPlatformUtils prettyPrintError:v22->_error];
        *(_DWORD *)buf = 136315394;
        v93 = "-[CDMServiceGraph initWithServices:graphServices:graphInput:languageCode:handlerId:aneLock:dataDispatcherContext:]";
        __int16 v94 = 2112;
        v95 = v72;
        _os_log_error_impl(&dword_2263A0000, v59, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
      }
      id v15 = v78;
      id v16 = v82;
    }
    id v20 = v74;

    id v19 = v75;
    id v18 = v76;
  }

  return v22;
}

- (CDMServiceGraph)initWithServices:(id)a3 graphInput:(id)a4 languageCode:(id)a5 handlerId:(id)a6 aneLock:(id)a7 dataDispatcherContext:(id)a8
{
  return [(CDMServiceGraph *)self initWithServices:a3 graphServices:MEMORY[0x263EFFA68] graphInput:a4 languageCode:a5 handlerId:a6 aneLock:a7 dataDispatcherContext:a8];
}

+ (id)getUsageForAssetSetName:(int64_t)a3 withLocale:(id)a4
{
  return 0;
}

+ (id)serializeFeatureStoreWithResponseCmd:(id)a3
{
  return 0;
}

+ (id)responseFeatureStoreStreamId
{
  return 0;
}

+ (id)serializeFeatureStoreWithRequestCmd:(id)a3
{
  return 0;
}

+ (id)requestFeatureStoreStreamId
{
  return 0;
}

+ (void)dispatchServiceGraphHandleMetricsLogging:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__448;
  v19[4] = __Block_byref_object_dispose__449;
  id v20 = +[CDMSELFLogUtil createSELFMetadataWithRequestId:v8];
  v17[0] = 0;
  v17[1] = v17;
  void v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__448;
  v17[4] = __Block_byref_object_dispose__449;
  id v10 = v9;
  id v18 = v10;
  uint64_t v11 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__CDMServiceGraph_dispatchServiceGraphHandleMetricsLogging_requestId_dataDispatcherContext___block_invoke;
  block[3] = &unk_2647A4BD8;
  id v14 = v7;
  id v15 = v19;
  id v16 = v17;
  id v12 = v7;
  dispatch_async(v11, block);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

void __92__CDMServiceGraph_dispatchServiceGraphHandleMetricsLogging_requestId_dataDispatcherContext___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  id v3 = (id)CDMLogContext;
  int v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-SELF", "dispatchCdmServiceHandleMetricsData", buf, 2u);
  }

  id v5 = objc_alloc_init(MEMORY[0x263F6E5D0]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
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
        objc_msgSend(v5, "addHandleMetrics:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }

  id v11 = objc_alloc_init(MEMORY[0x263F6E5F8]);
  [v11 setCdmServiceHandleMetricsReported:v5];
  [v11 setEventMetadata:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  id v12 = objc_alloc_init(MEMORY[0x263F71F40]);
  [v12 setMainEvent:v11];
  +[CDMSELFLogUtil emitEventsFromContainer:v12 mainEventLogMessage:@"SELF CDMServiceHandleMetricsReported event emitted" dataDispatcherContext:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  id v13 = (id)CDMLogContext;
  id v14 = v13;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v14, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-SELF", "", buf, 2u);
  }
}

+ (void)dispatchServiceGraphResponseLogging:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = CDMOSLoggerForCategory(2);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[CDMServiceGraph dispatchServiceGraphResponseLogging:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch CDM Response data.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x3032000000;
  long long v33 = __Block_byref_object_copy__448;
  long long v34 = __Block_byref_object_dispose__449;
  id v35 = +[CDMSELFLogUtil createSELFMetadataWithRequestId:v9];
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__448;
  v25[4] = __Block_byref_object_dispose__449;
  id v12 = v10;
  id v26 = v12;
  uint64_t v13 = mach_absolute_time();
  id v14 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__CDMServiceGraph_dispatchServiceGraphResponseLogging_requestId_dataDispatcherContext___block_invoke;
  block[3] = &unk_2647A4BB0;
  void block[4] = &buf;
  block[5] = v25;
  block[6] = v13;
  dispatch_async(v14, block);

  long long v15 = [a1 responseFeatureStoreStreamId];
  LODWORD(v13) = v15 == 0;

  if (v13)
  {
    long long v17 = CDMOSLoggerForCategory(2);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      long long v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      *(_DWORD *)long long v27 = 136315394;
      id v28 = "+[CDMServiceGraph dispatchServiceGraphResponseLogging:requestId:dataDispatcherContext:]";
      __int16 v29 = 2112;
      uint64_t v30 = v19;
      _os_log_debug_impl(&dword_2263A0000, v17, OS_LOG_TYPE_DEBUG, "%s Graph: %@ has not adopted base featurestore response insertion. Skipping", v27, 0x16u);
    }
  }
  else
  {
    long long v16 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __87__CDMServiceGraph_dispatchServiceGraphResponseLogging_requestId_dataDispatcherContext___block_invoke_461;
    v20[3] = &unk_2647A4B88;
    id v23 = a1;
    uint64_t v21 = v8;
    id v22 = v9;
    dispatch_async(v16, v20);

    long long v17 = v21;
  }

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&buf, 8);
}

void __87__CDMServiceGraph_dispatchServiceGraphResponseLogging_requestId_dataDispatcherContext___block_invoke(void *a1)
{
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  id v3 = (id)CDMLogContext;
  int v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-SELF", "dispatchCdmResponseData", buf, 2u);
  }

  +[CDMSELFLogUtil cdmEnded:0 metadata:*(void *)(*(void *)(a1[4] + 8) + 40) logMessage:@"SELF CDM Request ended message emitted" machAbsoluteTime:a1[6] dataDispatcherContext:*(void *)(*(void *)(a1[5] + 8) + 40)];
  id v5 = (id)CDMLogContext;
  id v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v6, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-SELF", "", v7, 2u);
  }
}

void __87__CDMServiceGraph_dispatchServiceGraphResponseLogging_requestId_dataDispatcherContext___block_invoke_461(uint64_t a1)
{
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  id v3 = (id)CDMLogContext;
  int v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-FS", "insertResponseToFeatureStore", buf, 2u);
  }

  id v5 = [*(id *)(a1 + 48) serializeFeatureStoreWithResponseCmd:*(void *)(a1 + 32)];
  id v6 = [*(id *)(a1 + 40) idA];
  uint64_t v7 = [*(id *)(a1 + 48) responseFeatureStoreStreamId];
  +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:v5 interactionId:v6 streamId:v7];

  id v8 = (id)CDMLogContext;
  id v9 = v8;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v9, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-FS", "", v10, 2u);
  }
}

+ (void)dispatchServiceGraphRequestLogging:(id)a3 dataDispatcherContext:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 loggingRequestID];
  id v9 = CDMOSLoggerForCategory(2);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[CDMServiceGraph dispatchServiceGraphRequestLogging:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch CDM Request data.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__448;
  uint64_t v32 = __Block_byref_object_dispose__449;
  id v33 = +[CDMSELFLogUtil createSELFMetadataWithRequestId:v8];
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__448;
  v23[4] = __Block_byref_object_dispose__449;
  id v10 = v7;
  id v24 = v10;
  uint64_t v11 = mach_absolute_time();
  id v12 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__CDMServiceGraph_dispatchServiceGraphRequestLogging_dataDispatcherContext___block_invoke;
  block[3] = &unk_2647A4B60;
  block[6] = v11;
  void block[7] = a1;
  void block[4] = &buf;
  block[5] = v23;
  dispatch_async(v12, block);

  uint64_t v13 = [a1 requestFeatureStoreStreamId];
  LODWORD(v12) = v13 == 0;

  if (v12)
  {
    long long v15 = CDMOSLoggerForCategory(2);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      long long v16 = (objc_class *)objc_opt_class();
      long long v17 = NSStringFromClass(v16);
      *(_DWORD *)long long v25 = 136315394;
      id v26 = "+[CDMServiceGraph dispatchServiceGraphRequestLogging:dataDispatcherContext:]";
      __int16 v27 = 2112;
      id v28 = v17;
      _os_log_debug_impl(&dword_2263A0000, v15, OS_LOG_TYPE_DEBUG, "%s Graph: %@ has not adopted base featurestore request insertion. Skipping", v25, 0x16u);
    }
  }
  else
  {
    id v14 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __76__CDMServiceGraph_dispatchServiceGraphRequestLogging_dataDispatcherContext___block_invoke_456;
    v18[3] = &unk_2647A4B88;
    id v21 = a1;
    id v19 = v6;
    id v20 = v8;
    dispatch_async(v14, v18);

    long long v15 = v19;
  }

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&buf, 8);
}

void __76__CDMServiceGraph_dispatchServiceGraphRequestLogging_dataDispatcherContext___block_invoke(uint64_t a1)
{
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  id v3 = (id)CDMLogContext;
  int v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-SELF", "dispatchCdmRequestData", buf, 2u);
  }

  +[CDMSELFLogUtil cdmStarted:metadata:logMessage:machAbsoluteTime:currentServiceGraph:dataDispatcherContext:](CDMSELFLogUtil, "cdmStarted:metadata:logMessage:machAbsoluteTime:currentServiceGraph:dataDispatcherContext:", 0, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), @"SELF CDM started message emitted from service graph", *(void *)(a1 + 48), [*(id *)(a1 + 56) getNLXSchemaCDMServiceGraphName], *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  id v5 = (id)CDMLogContext;
  id v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v6, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-SELF", "", v7, 2u);
  }
}

void __76__CDMServiceGraph_dispatchServiceGraphRequestLogging_dataDispatcherContext___block_invoke_456(uint64_t a1)
{
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  id v3 = (id)CDMLogContext;
  int v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-FS", "insertRequestToFeatureStore", buf, 2u);
  }

  id v5 = [*(id *)(a1 + 48) serializeFeatureStoreWithRequestCmd:*(void *)(a1 + 32)];
  id v6 = [*(id *)(a1 + 40) idA];
  id v7 = [*(id *)(a1 + 48) requestFeatureStoreStreamId];
  +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:v5 interactionId:v6 streamId:v7];

  id v8 = (id)CDMLogContext;
  id v9 = v8;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v9, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-FS", "", v10, 2u);
  }
}

+ (int)getNLXSchemaCDMServiceGraphName
{
  return 0;
}

+ (BOOL)shouldSkipNode:(id)a3 service:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = v6 && (![(id)objc_opt_class() isEnabled] || objc_msgSend(v6, "serviceState") == 4);

  return v7;
}

+ (int)getCdmRequesterWithConnectionId:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:@"ORCHESTRATOR"])
    {
      int v5 = 1;
    }
    else if ([v4 isEqualToString:@"CURARE"])
    {
      int v5 = 2;
    }
    else if ([v4 isEqualToString:@"LIGHTHOUSE"])
    {
      int v5 = 3;
    }
    else
    {
      int v5 = 0;
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

+ (BOOL)requiresAssets
{
  return 0;
}

+ (id)requiredCDMGraphServices
{
  id v2 = objc_alloc_init(MEMORY[0x263EFFA08]);
  return v2;
}

+ (id)requiredDAGServices
{
  return 0;
}

@end