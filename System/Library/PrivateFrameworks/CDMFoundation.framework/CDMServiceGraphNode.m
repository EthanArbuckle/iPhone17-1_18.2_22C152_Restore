@interface CDMServiceGraphNode
+ (CDMServiceGraphNode)initWithName:(id)a3 forHandler:(id)a4 usingFunction:(id)a5 withError:(id)a6 cancellationBlock:(id)a7 dataDispatcherContext:(id)a8;
+ (CDMServiceGraphNode)initWithName:(id)a3 forHandler:(id)a4 usingFunction:(id)a5 withError:(id)a6 cancellationBlock:(id)a7 requestId:(id)a8 dataDispatcherContext:(id)a9 serviceMetricsArray:(id)a10;
+ (CDMServiceGraphNode)initWithName:(id)a3 forHandler:(id)a4 withError:(id)a5 usingFunction:(id)a6 dataDispatcherContext:(id)a7;
+ (CDMServiceGraphNode)initWithName:(id)a3 forHandler:(id)a4 withError:(id)a5 usingFunction:(id)a6 requestId:(id)a7 dataDispatcherContext:(id)a8 serviceMetricsArray:(id)a9;
- (BOOL)asyncIsFinished;
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)nodeIsExecutingAsync;
- (BOOL)nodeIsUsingAsync;
- (id)getHandlerId;
- (id)getNodeName;
- (id)getSuccessors;
- (void)addDependency:(id)a3;
- (void)addSuccessor:(id)a3;
- (void)asyncMarkNodeAsFinished;
- (void)cancel;
- (void)removeDependency:(id)a3;
- (void)removeSuccessor:(id)a3;
- (void)setAsyncIsFinished:(BOOL)a3;
- (void)setNodeIsExecutingAsync:(BOOL)a3;
- (void)setNodeIsUsingAsync:(BOOL)a3;
- (void)willUseAsyncMarkNodeAsFinished;
@end

@implementation CDMServiceGraphNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_successors, 0);
  objc_storeStrong((id *)&self->_handlerId, 0);
  objc_storeStrong((id *)&self->_nodeName, 0);
  objc_storeStrong(&self->_cancellationBlock, 0);
}

- (void)setAsyncIsFinished:(BOOL)a3
{
  self->_asyncIsFinished = a3;
}

- (BOOL)asyncIsFinished
{
  return self->_asyncIsFinished;
}

- (void)setNodeIsExecutingAsync:(BOOL)a3
{
  self->_nodeIsExecutingAsync = a3;
}

- (BOOL)nodeIsExecutingAsync
{
  return self->_nodeIsExecutingAsync;
}

- (void)setNodeIsUsingAsync:(BOOL)a3
{
  self->_nodeIsUsingAsync = a3;
}

- (BOOL)nodeIsUsingAsync
{
  return self->_nodeIsUsingAsync;
}

- (void)asyncMarkNodeAsFinished
{
  obj = self;
  objc_sync_enter(obj);
  if ([(CDMServiceGraphNode *)obj nodeIsUsingAsync])
  {
    [(CDMServiceGraphNode *)obj willChangeValueForKey:@"isExecuting"];
    [(CDMServiceGraphNode *)obj setNodeIsExecutingAsync:0];
    [(CDMServiceGraphNode *)obj didChangeValueForKey:@"isExecuting"];
    [(CDMServiceGraphNode *)obj willChangeValueForKey:@"isFinished"];
    [(CDMServiceGraphNode *)obj setAsyncIsFinished:1];
    [(CDMServiceGraphNode *)obj didChangeValueForKey:@"isFinished"];
  }
  objc_sync_exit(obj);
}

- (void)willUseAsyncMarkNodeAsFinished
{
  obj = self;
  objc_sync_enter(obj);
  [(CDMServiceGraphNode *)obj setNodeIsUsingAsync:1];
  [(CDMServiceGraphNode *)obj setNodeIsExecutingAsync:1];
  objc_sync_exit(obj);
}

- (BOOL)isAsynchronous
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(CDMServiceGraphNode *)v2 nodeIsUsingAsync];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isExecuting
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(CDMServiceGraphNode *)v2 nodeIsUsingAsync])
  {
    unsigned __int8 v3 = [(CDMServiceGraphNode *)v2 nodeIsExecutingAsync];
  }
  else
  {
    v6.receiver = v2;
    v6.super_class = (Class)CDMServiceGraphNode;
    unsigned __int8 v3 = [(CDMServiceGraphNode *)&v6 isExecuting];
  }
  BOOL v4 = v3;
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)isFinished
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(CDMServiceGraphNode *)v2 nodeIsUsingAsync])
  {
    unsigned __int8 v3 = [(CDMServiceGraphNode *)v2 asyncIsFinished];
  }
  else
  {
    v6.receiver = v2;
    v6.super_class = (Class)CDMServiceGraphNode;
    unsigned __int8 v3 = [(CDMServiceGraphNode *)&v6 isFinished];
  }
  BOOL v4 = v3;
  objc_sync_exit(v2);

  return v4;
}

- (id)getSuccessors
{
  v2 = (void *)MEMORY[0x263EFFA08];
  unsigned __int8 v3 = [(NSHashTable *)self->_successors allObjects];
  BOOL v4 = [v2 setWithArray:v3];

  return v4;
}

- (void)removeSuccessor:(id)a3
{
}

- (void)addSuccessor:(id)a3
{
}

- (void)removeDependency:(id)a3
{
  id v4 = a3;
  v5 = self->_successors;
  objc_sync_enter(v5);
  v6.receiver = self;
  v6.super_class = (Class)CDMServiceGraphNode;
  [(CDMServiceGraphNode *)&v6 removeDependency:v4];
  [v4 removeSuccessor:self];
  objc_sync_exit(v5);
}

- (void)addDependency:(id)a3
{
  id v4 = a3;
  v5 = self->_successors;
  objc_sync_enter(v5);
  v6.receiver = self;
  v6.super_class = (Class)CDMServiceGraphNode;
  [(CDMServiceGraphNode *)&v6 addDependency:v4];
  [v4 addSuccessor:self];
  objc_sync_exit(v5);
}

- (id)getHandlerId
{
  return self->_handlerId;
}

- (id)getNodeName
{
  return self->_nodeName;
}

- (void)cancel
{
  if (([(CDMServiceGraphNode *)self isCancelled] & 1) == 0)
  {
    cancellationBlock = (void (**)(void))self->_cancellationBlock;
    if (cancellationBlock) {
      cancellationBlock[2]();
    }
    v4.receiver = self;
    v4.super_class = (Class)CDMServiceGraphNode;
    [(CDMServiceGraphNode *)&v4 cancel];
  }
}

+ (CDMServiceGraphNode)initWithName:(id)a3 forHandler:(id)a4 usingFunction:(id)a5 withError:(id)a6 cancellationBlock:(id)a7 requestId:(id)a8 dataDispatcherContext:(id)a9 serviceMetricsArray:(id)a10
{
  id v16 = a3;
  id v35 = a4;
  id v38 = a4;
  id v17 = a5;
  id v18 = a6;
  id v39 = a7;
  id v37 = a8;
  id v36 = a9;
  id v19 = a10;
  v20 = CDMOSLoggerForCategory(4);
  v21 = (void *)os_signpost_id_generate(v20);

  v48.receiver = a1;
  v48.super_class = (Class)&OBJC_METACLASS___CDMServiceGraphNode;
  uint64_t v22 = objc_msgSend(objc_msgSendSuper2(&v48, sel_alloc), "init");
  objc_initWeak(&location, (id)v22);
  [(id)v22 setNodeIsUsingAsync:0];
  [(id)v22 setNodeIsExecutingAsync:0];
  [(id)v22 setAsyncIsFinished:0];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __141__CDMServiceGraphNode_initWithName_forHandler_usingFunction_withError_cancellationBlock_requestId_dataDispatcherContext_serviceMetricsArray___block_invoke;
  aBlock[3] = &unk_2647A4C78;
  id v23 = v16;
  id v41 = v23;
  v46[1] = v21;
  id v24 = v17;
  id v44 = v24;
  objc_copyWeak(v46, &location);
  id v25 = v38;
  id v42 = v25;
  id v26 = v18;
  id v45 = v26;
  id v27 = v19;
  id v43 = v27;
  v28 = _Block_copy(aBlock);
  [(id)v22 addExecutionBlock:v28];
  if (v22)
  {
    v29 = _Block_copy(v39);
    v30 = *(void **)(v22 + 264);
    *(void *)(v22 + 264) = v29;

    objc_storeStrong((id *)(v22 + 272), a3);
    objc_storeStrong((id *)(v22 + 280), v35);
    uint64_t v31 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    v32 = *(void **)(v22 + 288);
    *(void *)(v22 + 288) = v31;
  }
  objc_destroyWeak(v46);

  objc_destroyWeak(&location);
  return (CDMServiceGraphNode *)(id)v22;
}

void __141__CDMServiceGraphNode_initWithName_forHandler_usingFunction_withError_cancellationBlock_requestId_dataDispatcherContext_serviceMetricsArray___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  dispatch_time_t v2 = dispatch_time(0, 3000000000);
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__3648;
  v29 = __Block_byref_object_dispose__3649;
  id v30 = 0;
  uint64_t v3 = +[CDMSELFLogUtil stringNodeNameToEnum:*(void *)(a1 + 32)];
  if (!v3 && ([*(id *)(a1 + 32) isEqualToString:@"metricsNode"] & 1) == 0)
  {
    objc_super v4 = CDMOSLoggerForCategory(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "+[CDMServiceGraphNode initWithName:forHandler:usingFunction:withError:cancellationBlock:reque"
                           "stId:dataDispatcherContext:serviceMetricsArray:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_2263A0000, v4, OS_LOG_TYPE_INFO, "%s [WARN]: Unmapped CDM service node name for handle: %@", buf, 0x16u);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v38 = __Block_byref_object_copy__3648;
  id v39 = __Block_byref_object_dispose__3649;
  id v40 = objc_alloc_init(MEMORY[0x263F6E5C8]);
  [*(id *)(*(void *)&buf[8] + 40) setServiceName:v3];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __141__CDMServiceGraphNode_initWithName_forHandler_usingFunction_withError_cancellationBlock_requestId_dataDispatcherContext_serviceMetricsArray___block_invoke_348;
  block[3] = &unk_2647A4C28;
  v24[1] = *(id *)(a1 + 80);
  id v19 = *(id *)(a1 + 32);
  uint64_t v22 = buf;
  id v21 = *(id *)(a1 + 56);
  objc_copyWeak(v24, (id *)(a1 + 72));
  id v20 = *(id *)(a1 + 40);
  id v23 = &v25;
  dispatch_block_t v6 = dispatch_block_create((dispatch_block_flags_t)0, block);
  dispatch_block_perform((dispatch_block_flags_t)0, v6);
  if (dispatch_block_wait(v6, v2))
  {
    v7 = [NSString stringWithFormat:@"Node [%@] for handler [%@] timed out.", *(void *)(a1 + 32), *(void *)(a1 + 40)];
    v8 = CDMOSLoggerForCategory(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v31 = 136315394;
      *(void *)&v31[4] = "+[CDMServiceGraphNode initWithName:forHandler:usingFunction:withError:cancellationBlock:reque"
                           "stId:dataDispatcherContext:serviceMetricsArray:]_block_invoke";
      *(_WORD *)&v31[12] = 2112;
      *(void *)&v31[14] = v7;
      _os_log_error_impl(&dword_2263A0000, v8, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", v31, 0x16u);
    }

    v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v35 = *MEMORY[0x263F08320];
    id v36 = v7;
    v11 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    uint64_t v12 = [v9 errorWithDomain:v10 code:0 userInfo:v11];
    v13 = (void *)v26[5];
    v26[5] = v12;

    [*(id *)(*(void *)&buf[8] + 40) setFailureReason:4];
  }
  if (v26[5] && (uint64_t v14 = *(void *)(a1 + 64)) != 0)
  {
    (*(void (**)(void))(v14 + 16))();
  }
  else
  {
    v15 = *(void **)(a1 + 48);
    if (v15)
    {
      *(void *)uint64_t v31 = 0;
      *(void *)&v31[8] = v31;
      *(void *)&v31[16] = 0x3032000000;
      v32 = __Block_byref_object_copy__3648;
      v33 = __Block_byref_object_dispose__3649;
      id v34 = v15;
      id v16 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __141__CDMServiceGraphNode_initWithName_forHandler_usingFunction_withError_cancellationBlock_requestId_dataDispatcherContext_serviceMetricsArray___block_invoke_362;
      v17[3] = &unk_2647A4C50;
      v17[4] = v31;
      v17[5] = buf;
      dispatch_async(v16, v17);

      _Block_object_dispose(v31, 8);
    }
  }

  objc_destroyWeak(v24);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v25, 8);
}

uint64_t __141__CDMServiceGraphNode_initWithName_forHandler_usingFunction_withError_cancellationBlock_requestId_dataDispatcherContext_serviceMetricsArray___block_invoke_348(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  dispatch_time_t v2 = CDMOSLoggerForCategory(4);
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 80);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v5;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ServiceGraphNodeExecution", "%@ handle", buf, 0xCu);
  }

  mach_absolute_time();
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setStartLogicalTimestampInNs:SiriAnalyticsMachAbsoluteTimeGetNanoseconds()];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __141__CDMServiceGraphNode_initWithName_forHandler_usingFunction_withError_cancellationBlock_requestId_dataDispatcherContext_serviceMetricsArray___block_invoke_350;
  v10[3] = &unk_2647A4C00;
  id v11 = *(id *)(a1 + 48);
  objc_copyWeak(&v12, (id *)(a1 + 72));
  +[CDMExceptionUtils runWrappingCppExceptions:v10];
  objc_destroyWeak(&v12);

  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setFailureReason:3];
  }
  dispatch_block_t v6 = CDMOSLoggerForCategory(4);
  v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 80);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v7, OS_SIGNPOST_INTERVAL_END, v8, "ServiceGraphNodeExecution", "", buf, 2u);
  }

  mach_absolute_time();
  return [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setEndLogicalTimestampInNs:SiriAnalyticsMachAbsoluteTimeGetNanoseconds()];
}

uint64_t __141__CDMServiceGraphNode_initWithName_forHandler_usingFunction_withError_cancellationBlock_requestId_dataDispatcherContext_serviceMetricsArray___block_invoke_362(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __141__CDMServiceGraphNode_initWithName_forHandler_usingFunction_withError_cancellationBlock_requestId_dataDispatcherContext_serviceMetricsArray___block_invoke_350(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);
}

+ (CDMServiceGraphNode)initWithName:(id)a3 forHandler:(id)a4 usingFunction:(id)a5 withError:(id)a6 cancellationBlock:(id)a7 dataDispatcherContext:(id)a8
{
  return +[CDMServiceGraphNode initWithName:a3 forHandler:a4 usingFunction:a5 withError:a6 cancellationBlock:0 requestId:0 dataDispatcherContext:a8 serviceMetricsArray:0];
}

+ (CDMServiceGraphNode)initWithName:(id)a3 forHandler:(id)a4 withError:(id)a5 usingFunction:(id)a6 requestId:(id)a7 dataDispatcherContext:(id)a8 serviceMetricsArray:(id)a9
{
  return +[CDMServiceGraphNode initWithName:a3 forHandler:a4 usingFunction:a6 withError:a5 cancellationBlock:0 requestId:a7 dataDispatcherContext:a8 serviceMetricsArray:a9];
}

+ (CDMServiceGraphNode)initWithName:(id)a3 forHandler:(id)a4 withError:(id)a5 usingFunction:(id)a6 dataDispatcherContext:(id)a7
{
  return +[CDMServiceGraphNode initWithName:a3 forHandler:a4 withError:a5 usingFunction:a6 requestId:0 dataDispatcherContext:a7 serviceMetricsArray:0];
}

@end