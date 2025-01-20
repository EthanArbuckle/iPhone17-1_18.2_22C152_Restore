@interface CDMServiceGraphRunner
- (CDMServiceGraphRunner)init;
- (CDMServiceGraphRunner)initWithMaxConcurrentCount:(int)a3;
- (id)getOperationState:(id)a3;
- (id)getServiceGraphNodeQueue;
- (void)cancelAllHandlers;
- (void)cancelHandler:(id)a3;
- (void)cancelHandlerById:(id)a3;
- (void)cancelHandlerById:(id)a3 causeByError:(BOOL)a4;
- (void)dealloc;
- (void)dumpServiceGraphNodeQueue;
- (void)finishHandlerById:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resume;
- (void)runHandlerAsync:(id)a3 withCompletion:(id)a4;
- (void)skipNode:(id)a3 forCondition:(id)a4 withHandlerId:(id)a5;
- (void)suspend;
- (void)waitAll;
@end

@implementation CDMServiceGraphRunner

- (CDMServiceGraphRunner)initWithMaxConcurrentCount:(int)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)CDMServiceGraphRunner;
  v4 = [(CDMServiceGraphRunner *)&v19 init];
  if (v4)
  {
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    queue = v4->_queue;
    v4->_queue = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    callbackMap = v4->_callbackMap;
    v4->_callbackMap = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    operationMap = v4->_operationMap;
    v4->_operationMap = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    operationMapWithNodeName = v4->_operationMapWithNodeName;
    v4->_operationMapWithNodeName = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    handlerMap = v4->_handlerMap;
    v4->_handlerMap = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    handlerSkipMap = v4->_handlerSkipMap;
    v4->_handlerSkipMap = v15;

    [(NSOperationQueue *)v4->_queue setQualityOfService:25];
    [(NSOperationQueue *)v4->_queue setMaxConcurrentOperationCount:a3];
    v17 = CDMOSLoggerForCategory(2);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[CDMServiceGraphRunner initWithMaxConcurrentCount:]";
      __int16 v22 = 1024;
      int v23 = a3;
      _os_log_debug_impl(&dword_2263A0000, v17, OS_LOG_TYPE_DEBUG, "%s initWithMaxConcurrentCount=%d", buf, 0x12u);
    }

    [(NSOperationQueue *)v4->_queue setSuspended:1];
  }
  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v40 = a3;
  id v41 = a4;
  id v39 = a5;
  v10 = CDMOSLoggerForCategory(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v50 = "-[CDMServiceGraphRunner observeValueForKeyPath:ofObject:change:context:]";
    __int16 v51 = 2112;
    uint64_t v52 = (uint64_t)v40;
    __int16 v53 = 2112;
    id v54 = v41;
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s %@ observed from %@", buf, 0x20u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v11 = [v40 isEqualToString:@"isFinished"] ^ 1;
    if (a6 != &kQueueOperationsChanged) {
      LOBYTE(v11) = 1;
    }
    if ((v11 & 1) == 0)
    {
      v12 = [v41 getHandlerId];
      [(CDMServiceGraphRunner *)self finishHandlerById:v12];

      goto LABEL_41;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v13 = [v40 isEqualToString:@"error"] ^ 1;
    if (a6 != &kQueueOperationsChanged) {
      LOBYTE(v13) = 1;
    }
    if ((v13 & 1) == 0)
    {
      v14 = [v41 getHandlerId];
      [(CDMServiceGraphRunner *)self cancelHandlerById:v14 causeByError:1];

      goto LABEL_41;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v40 isEqualToString:@"systemState"])
  {
    id v15 = v41;
    uint64_t v16 = [v15 systemState];
    v17 = CDMOSLoggerForCategory(2);
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    if (v16 == 3)
    {
      if (v18)
      {
        *(_DWORD *)buf = 136315138;
        v50 = "-[CDMServiceGraphRunner observeValueForKeyPath:ofObject:change:context:]";
        v20 = "%s System is ready, resume queue";
        v21 = v17;
        uint32_t v22 = 12;
        goto LABEL_43;
      }
    }
    else if (v18)
    {
      uint64_t v19 = [v15 systemState];
      *(_DWORD *)buf = 136315394;
      v50 = "-[CDMServiceGraphRunner observeValueForKeyPath:ofObject:change:context:]";
      __int16 v51 = 2048;
      uint64_t v52 = v19;
      v20 = "%s System is not ready, suspend queue. Current state:%zd";
      v21 = v17;
      uint32_t v22 = 22;
LABEL_43:
      _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, v20, buf, v22);
    }

    [(NSOperationQueue *)self->_queue setSuspended:v16 != 3];
    goto LABEL_41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_32;
  }
  int v23 = [v40 isEqualToString:@"isFinished"] ^ 1;
  if (a6 != &kQueueSkipNode) {
    LOBYTE(v23) = 1;
  }
  if (v23)
  {
LABEL_32:
    v43.receiver = self;
    v43.super_class = (Class)CDMServiceGraphRunner;
    [(CDMServiceGraphRunner *)&v43 observeValueForKeyPath:v40 ofObject:v41 change:v39 context:a6];
  }
  else
  {
    id v38 = v41;
    v42 = [v38 getNodeName];
    uint64_t v24 = [v38 getHandlerId];
    v25 = self;
    objc_sync_enter(v25);
    p_isa = (id *)&v25->super.isa;
    v27 = [(NSMutableDictionary *)v25->_handlerSkipMap objectForKey:v24];
    LODWORD(v25) = v27 == 0;

    if (v25)
    {
      v28 = CDMOSLoggerForCategory(2);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v50 = "-[CDMServiceGraphRunner observeValueForKeyPath:ofObject:change:context:]";
        __int16 v51 = 2112;
        uint64_t v52 = (uint64_t)v24;
        _os_log_impl(&dword_2263A0000, v28, OS_LOG_TYPE_INFO, "%s [WARN]: Handler ID %@ not found for skip", buf, 0x16u);
      }
    }
    else
    {
      v28 = [p_isa[6] objectForKeyedSubscript:v24];
      v29 = [v28 objectForKey:v42];
      BOOL v30 = v29 == 0;

      if (v30)
      {
        v31 = CDMOSLoggerForCategory(2);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v50 = "-[CDMServiceGraphRunner observeValueForKeyPath:ofObject:change:context:]";
          __int16 v51 = 2112;
          uint64_t v52 = (uint64_t)v42;
          _os_log_impl(&dword_2263A0000, v31, OS_LOG_TYPE_INFO, "%s [WARN]: Node %@ not found for checking skip", buf, 0x16u);
        }
      }
      else
      {
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        v31 = [v28 objectForKeyedSubscript:v42];
        uint64_t v32 = [v31 countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (v32)
        {
          uint64_t v33 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              if (*(void *)v45 != v33) {
                objc_enumerationMutation(v31);
              }
              uint64_t v35 = *(void *)(*((void *)&v44 + 1) + 8 * i);
              v36 = [v28 objectForKeyedSubscript:v42];
              v37 = [v36 objectForKeyedSubscript:v35];
              [p_isa skipNode:v35 forCondition:v37 withHandlerId:v24];
            }
            uint64_t v32 = [v31 countByEnumeratingWithState:&v44 objects:v48 count:16];
          }
          while (v32);
        }
      }
    }
    objc_sync_exit(p_isa);
  }
LABEL_41:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerSkipMap, 0);
  objc_storeStrong((id *)&self->_handlerMap, 0);
  objc_storeStrong((id *)&self->_operationMapWithNodeName, 0);
  objc_storeStrong((id *)&self->_operationMap, 0);
  objc_storeStrong((id *)&self->_callbackMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)getServiceGraphNodeQueue
{
  return [(NSOperationQueue *)self->_queue operations];
}

- (void)dumpServiceGraphNodeQueue
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  [(CDMServiceGraphRunner *)self getServiceGraphNodeQueue];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v41;
    v5 = @"\nQueue:\n";
    do
    {
      uint64_t v6 = 0;
      v7 = v5;
      do
      {
        if (*(void *)v41 != v4) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(id *)(*((void *)&v40 + 1) + 8 * v6);
        v9 = [(CDMServiceGraphRunner *)self getOperationState:v8];
        v10 = [v8 getNodeName];

        v5 = [(__CFString *)v7 stringByAppendingFormat:@"{%@,%@},", v10, v9];

        ++v6;
        v7 = v5;
      }
      while (v3 != v6);
      uint64_t v3 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v3);
  }
  else
  {
    v5 = @"\nQueue:\n";
  }

  int v11 = [(__CFString *)v5 stringByAppendingString:@"\nHandlers:\n"];

  v12 = self;
  objc_sync_enter(v12);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v26 = v12->_operationMap;
  uint64_t v13 = [(NSMutableDictionary *)v26 countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v13)
  {
    uint64_t v27 = *(void *)v37;
    uint64_t v28 = v13;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v37 != v27) {
          objc_enumerationMutation(v26);
        }
        uint64_t v14 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        BOOL v30 = [(NSMutableDictionary *)v12->_handlerMap objectForKeyedSubscript:v14];
        id v15 = [v11 stringByAppendingFormat:@"{%@, %lu, [", v14, objc_msgSend(v30, "getHandlerState")];

        uint64_t v16 = [(NSMutableDictionary *)v12->_operationMap objectForKey:v14];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v48 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v33;
          do
          {
            uint64_t v20 = 0;
            v21 = v15;
            do
            {
              if (*(void *)v33 != v19) {
                objc_enumerationMutation(v17);
              }
              uint32_t v22 = *(void **)(*((void *)&v32 + 1) + 8 * v20);
              int v23 = [(CDMServiceGraphRunner *)v12 getOperationState:v22];
              uint64_t v24 = [v22 getNodeName];
              id v15 = [v21 stringByAppendingFormat:@"{%@,%@},", v24, v23];

              ++v20;
              v21 = v15;
            }
            while (v18 != v20);
            uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v48 count:16];
          }
          while (v18);
        }

        int v11 = [v15 stringByAppendingString:@"]}\n"];
      }
      uint64_t v28 = [(NSMutableDictionary *)v26 countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v28);
  }

  objc_sync_exit(v12);
  v25 = CDMOSLoggerForCategory(2);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    long long v45 = "-[CDMServiceGraphRunner dumpServiceGraphNodeQueue]";
    __int16 v46 = 2112;
    long long v47 = v11;
    _os_log_debug_impl(&dword_2263A0000, v25, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }
}

- (id)getOperationState:(id)a3
{
  id v3 = a3;
  if ([v3 isExecuting])
  {
    uint64_t v4 = @"executing";
  }
  else if ([v3 isFinished])
  {
    uint64_t v4 = @"finished";
  }
  else if ([v3 isCancelled])
  {
    uint64_t v4 = @"cancelled";
  }
  else
  {
    uint64_t v4 = @"default";
  }

  return v4;
}

- (void)waitAll
{
}

- (void)skipNode:(id)a3 forCondition:(id)a4 withHandlerId:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v25 = a3;
  id v8 = (unsigned int (**)(void))a4;
  id v24 = a5;
  BOOL v9 = +[CDMUserDefaultsUtils isSkipNodeEnabled];
  if (v8 && v9 && v8[2](v8))
  {
    v10 = self;
    objc_sync_enter(v10);
    id obj = v10;
    int v11 = [(NSMutableDictionary *)v10->_operationMapWithNodeName objectForKeyedSubscript:v24];
    v12 = [v11 objectForKey:v25];

    if (v12)
    {
      if ([v12 isFinished] & 1) != 0 || (objc_msgSend(v12, "isCancelled")) {
        goto LABEL_24;
      }
      uint64_t v13 = CDMOSLoggerForCategory(2);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        long long v32 = "-[CDMServiceGraphRunner skipNode:forCondition:withHandlerId:]";
        __int16 v33 = 2112;
        id v34 = v25;
        __int16 v35 = 2112;
        id v36 = v24;
        _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s Skip node %@ in handler %@", buf, 0x20u);
      }

      [v12 cancel];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v14 = [v12 getSuccessors];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v27 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            uint64_t v19 = [v18 getNodeName];
            char v20 = [v19 isEqualToString:@"metricsNode"];

            if ((v20 & 1) == 0)
            {
              v21 = CDMOSLoggerForCategory(2);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                uint32_t v22 = [v18 getNodeName];
                *(_DWORD *)buf = 136315650;
                long long v32 = "-[CDMServiceGraphRunner skipNode:forCondition:withHandlerId:]";
                __int16 v33 = 2112;
                id v34 = v22;
                __int16 v35 = 2112;
                id v36 = v25;
                _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, "%s Remove dependency: %@ ==> %@", buf, 0x20u);
              }
              [v18 removeDependency:v12];
            }
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v15);
      }
    }
    else
    {
      uint64_t v14 = CDMOSLoggerForCategory(2);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        long long v32 = "-[CDMServiceGraphRunner skipNode:forCondition:withHandlerId:]";
        __int16 v33 = 2112;
        id v34 = v25;
        _os_log_impl(&dword_2263A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: Node %@ not found for skip", buf, 0x16u);
      }
    }

LABEL_24:
    objc_sync_exit(obj);
  }
}

- (void)finishHandlerById:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)v5->_handlerMap objectForKey:v4];
  v7 = v6;
  if (!v6)
  {
    uint64_t v19 = CDMOSLoggerForCategory(2);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v29 = "-[CDMServiceGraphRunner finishHandlerById:]";
      __int16 v30 = 2112;
      id v31 = v4;
      _os_log_error_impl(&dword_2263A0000, v19, OS_LOG_TYPE_ERROR, "%s [ERR]: Handler with ID %@ is not found", buf, 0x16u);
    }
    goto LABEL_18;
  }
  if ([v6 getHandlerState] != 2)
  {
    uint64_t v19 = CDMOSLoggerForCategory(2);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = [v7 handlerId];
      *(_DWORD *)buf = 136315650;
      long long v29 = "-[CDMServiceGraphRunner finishHandlerById:]";
      __int16 v30 = 2112;
      id v31 = v20;
      __int16 v32 = 2048;
      uint64_t v33 = [v7 getHandlerState];
      _os_log_error_impl(&dword_2263A0000, v19, OS_LOG_TYPE_ERROR, "%s [ERR]: Skip finish handler %@ with invalid state %zu", buf, 0x20u);
    }
LABEL_18:

    objc_sync_exit(v5);
    goto LABEL_19;
  }
  uint64_t v8 = [(NSMutableDictionary *)v5->_callbackMap objectForKeyedSubscript:v4];
  uint64_t v9 = v8;
  if (v8) {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
  }
  v10 = objc_msgSend(v7, "getServiceGraph", v9);
  uint32_t v22 = [v10 getEndNode];

  [v22 removeObserver:v5 forKeyPath:@"isFinished"];
  int v11 = [v7 getServiceGraph];
  [v11 removeObserver:v5 forKeyPath:@"error"];

  v12 = [v7 getServiceGraph];
  uint64_t v13 = [v12 getNodesWithName];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v14 = [(NSMutableDictionary *)v5->_handlerSkipMap objectForKeyedSubscript:v4];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = [v13 objectForKeyedSubscript:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        [v18 removeObserver:v5 forKeyPath:@"isFinished"];
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  [(NSMutableDictionary *)v5->_handlerSkipMap removeObjectForKey:v4];
  [(NSMutableDictionary *)v5->_callbackMap removeObjectForKey:v4];
  [(NSMutableDictionary *)v5->_operationMap removeObjectForKey:v4];
  [(NSMutableDictionary *)v5->_operationMapWithNodeName removeObjectForKey:v4];
  [(NSMutableDictionary *)v5->_handlerMap removeObjectForKey:v4];

  objc_sync_exit(v5);
  CDMOSLoggerForCategory(2);
  v5 = (CDMServiceGraphRunner *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    long long v29 = "-[CDMServiceGraphRunner finishHandlerById:]";
    __int16 v30 = 2112;
    id v31 = v4;
    _os_log_debug_impl(&dword_2263A0000, &v5->super, OS_LOG_TYPE_DEBUG, "%s %@ finished", buf, 0x16u);
  }
LABEL_19:
}

- (void)cancelHandlerById:(id)a3 causeByError:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  __int16 v32 = v6;
  uint64_t v8 = [(NSMutableDictionary *)v7->_handlerMap objectForKey:v6];
  uint64_t v9 = v8;
  if (!v8)
  {
    long long v28 = CDMOSLoggerForCategory(2);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v44 = "-[CDMServiceGraphRunner cancelHandlerById:causeByError:]";
      __int16 v45 = 2112;
      id v46 = v6;
      _os_log_error_impl(&dword_2263A0000, v28, OS_LOG_TYPE_ERROR, "%s [ERR]: Handler with ID %@ is not found", buf, 0x16u);
    }
    goto LABEL_28;
  }
  if ([v8 getHandlerState] != 1)
  {
    long long v28 = CDMOSLoggerForCategory(2);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = [v9 handlerId];
      *(_DWORD *)buf = 136315650;
      long long v44 = "-[CDMServiceGraphRunner cancelHandlerById:causeByError:]";
      __int16 v45 = 2112;
      id v46 = v29;
      __int16 v47 = 2048;
      uint64_t v48 = [v9 getHandlerState];
      _os_log_error_impl(&dword_2263A0000, v28, OS_LOG_TYPE_ERROR, "%s [ERR]: Skip cancel handler %@ with invalid state %zu", buf, 0x20u);
    }
LABEL_28:

    objc_sync_exit(v7);
    goto LABEL_29;
  }
  if (v4) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 4;
  }
  [v9 setHandlerState:v10];
  int v11 = [(NSMutableDictionary *)v7->_operationMap objectForKey:v6];
  uint64_t v12 = [(NSOperationQueue *)v7->_queue isSuspended];
  [(NSOperationQueue *)v7->_queue setSuspended:1];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v37 + 1) + 8 * i) cancel];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v14);
  }

  [(NSOperationQueue *)v7->_queue setSuspended:v12];
  uint64_t v17 = [(NSMutableDictionary *)v7->_callbackMap objectForKeyedSubscript:v32];
  uint64_t v18 = (void *)v17;
  if (v17) {
    (*(void (**)(uint64_t))(v17 + 16))(v17);
  }
  __int16 v30 = v18;
  uint64_t v19 = [v9 getServiceGraph];
  id v31 = [v19 getEndNode];

  [v31 removeObserver:v7 forKeyPath:@"isFinished"];
  id v20 = [v9 getServiceGraph];
  [v20 removeObserver:v7 forKeyPath:@"error"];

  v21 = [v9 getServiceGraph];
  uint32_t v22 = [v21 getNodesWithName];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v23 = [(NSMutableDictionary *)v7->_handlerSkipMap objectForKeyedSubscript:v32];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(v23);
        }
        long long v27 = [v22 objectForKeyedSubscript:*(void *)(*((void *)&v33 + 1) + 8 * j)];
        [v27 removeObserver:v7 forKeyPath:@"isFinished"];
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v24);
  }

  [(NSMutableDictionary *)v7->_handlerSkipMap removeObjectForKey:v32];
  [(NSMutableDictionary *)v7->_callbackMap removeObjectForKey:v32];
  [(NSMutableDictionary *)v7->_operationMap removeObjectForKey:v32];
  [(NSMutableDictionary *)v7->_operationMapWithNodeName removeObjectForKey:v32];
  [(NSMutableDictionary *)v7->_handlerMap removeObjectForKey:v32];

  objc_sync_exit(v7);
  CDMOSLoggerForCategory(2);
  v7 = (CDMServiceGraphRunner *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    long long v44 = "-[CDMServiceGraphRunner cancelHandlerById:causeByError:]";
    __int16 v45 = 2112;
    id v46 = v32;
    _os_log_debug_impl(&dword_2263A0000, &v7->super, OS_LOG_TYPE_DEBUG, "%s %@ cancelled", buf, 0x16u);
  }
LABEL_29:
}

- (void)cancelHandlerById:(id)a3
{
}

- (void)cancelHandler:(id)a3
{
  id v4 = [a3 handlerId];
  [(CDMServiceGraphRunner *)self cancelHandlerById:v4];
}

- (void)cancelAllHandlers
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = CDMOSLoggerForCategory(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v18 = "-[CDMServiceGraphRunner cancelAllHandlers]";
    _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s Cancel all handlers", buf, 0xCu);
  }

  id v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)MEMORY[0x263EFF8C0];
  id v6 = [(NSMutableDictionary *)v4->_handlerMap allKeys];
  v7 = [v5 arrayWithArray:v6];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        -[CDMServiceGraphRunner cancelHandlerById:](v4, "cancelHandlerById:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  objc_sync_exit(v4);
}

- (void)runHandlerAsync:(id)a3 withCompletion:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id aBlock = a4;
  long long v23 = v6;
  if ([v6 getHandlerState])
  {
    v7 = CDMOSLoggerForCategory(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 handlerId];
      *(_DWORD *)buf = 136315650;
      __int16 v30 = "-[CDMServiceGraphRunner runHandlerAsync:withCompletion:]";
      __int16 v31 = 2112;
      __int16 v32 = v8;
      __int16 v33 = 2048;
      uint64_t v34 = [v6 getHandlerState];
      _os_log_error_impl(&dword_2263A0000, v7, OS_LOG_TYPE_ERROR, "%s [ERR]: Skip running handler %@ with invalid state %zu", buf, 0x20u);
    }
  }
  else
  {
    v7 = [v6 getServiceGraph];
    id v20 = [v7 getNodes];
    uint64_t v9 = [v7 getNodesWithName];
    v21 = [v6 handlerId];
    uint64_t v19 = [v7 getEndNode];
    [v7 getSkippedNodes];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          long long v14 = [v9 objectForKeyedSubscript:*(void *)(*((void *)&v24 + 1) + 8 * i)];
          [v14 addObserver:self forKeyPath:@"isFinished" options:0 context:&kQueueSkipNode];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }

    long long v15 = self;
    objc_sync_enter(v15);
    [(NSMutableDictionary *)v15->_handlerSkipMap setValue:v10 forKey:v21];
    objc_sync_exit(v15);

    [v7 addObserver:v15 forKeyPath:@"error" options:0 context:&kQueueOperationsChanged];
    uint64_t v16 = v15;
    objc_sync_enter(v16);
    callbackMap = v16->_callbackMap;
    uint64_t v18 = _Block_copy(aBlock);
    [(NSMutableDictionary *)callbackMap setValue:v18 forKey:v21];

    [(NSMutableDictionary *)v16->_operationMap setValue:v20 forKey:v21];
    [(NSMutableDictionary *)v16->_operationMapWithNodeName setValue:v9 forKey:v21];
    [(NSMutableDictionary *)v16->_handlerMap setValue:v23 forKey:v21];
    objc_sync_exit(v16);

    [v19 addObserver:v16 forKeyPath:@"isFinished" options:0 context:&kQueueOperationsChanged];
    [v23 setHandlerState:1];
    [(NSOperationQueue *)v16->_queue addOperations:v20 waitUntilFinished:0];
  }
}

- (void)resume
{
}

- (void)suspend
{
}

- (void)dealloc
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = [(NSMutableDictionary *)v2->_handlerMap allKeys];
  v5 = [v3 arrayWithArray:v4];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v6)
  {
    uint64_t v27 = *(void *)v35;
    *(void *)&long long v7 = 136315394;
    long long v24 = v7;
    do
    {
      uint64_t v28 = v6;
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        id v10 = -[NSMutableDictionary objectForKey:](v2->_handlerMap, "objectForKey:", v9, v24);
        uint64_t v11 = v10;
        if (v10 && [v10 getHandlerState] == 1)
        {
          uint64_t v12 = CDMOSLoggerForCategory(2);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            long long v23 = [v11 handlerId];
            *(_DWORD *)buf = v24;
            long long v40 = "-[CDMServiceGraphRunner dealloc]";
            __int16 v41 = 2112;
            long long v42 = v23;
            _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s CDMServiceGraphRunner: dealloc. Removing observers for running handler with id:%@ .", buf, 0x16u);
          }
          long long v13 = [v11 getServiceGraph];
          long long v26 = [v13 getEndNode];

          [v26 removeObserver:v2 forKeyPath:@"isFinished"];
          long long v14 = [v11 getServiceGraph];
          [v14 removeObserver:v2 forKeyPath:@"error"];

          long long v15 = [v11 getServiceGraph];
          uint64_t v16 = [v15 getNodesWithName];

          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          uint64_t v17 = [(NSMutableDictionary *)v2->_handlerSkipMap objectForKeyedSubscript:v9];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v18)
          {
            uint64_t v19 = *(void *)v31;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v31 != v19) {
                  objc_enumerationMutation(v17);
                }
                v21 = [v16 objectForKeyedSubscript:*(void *)(*((void *)&v30 + 1) + 8 * j)];
                uint32_t v22 = v21;
                if (v21) {
                  [v21 removeObserver:v2 forKeyPath:@"isFinished"];
                }
              }
              uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
            }
            while (v18);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v2);
  v29.receiver = v2;
  v29.super_class = (Class)CDMServiceGraphRunner;
  [(CDMServiceGraphRunner *)&v29 dealloc];
}

- (CDMServiceGraphRunner)init
{
  uint64_t v3 = +[CDMUserDefaultsUtils readGraphRunnerMaxConcurrentCount];
  return [(CDMServiceGraphRunner *)self initWithMaxConcurrentCount:v3];
}

@end