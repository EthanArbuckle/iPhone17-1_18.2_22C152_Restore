@interface MADMultiModalProcessingTask
- (BOOL)cachesResources;
- (BOOL)run:(id *)a3;
- (MADMultiModalProcessingTask)initWithRequests:(id)a3 inputs:(id)a4 cancelBlock:(id)a5 completionHandler:(id)a6;
- (NSString)signpostPayload;
- (void)cancel;
- (void)setSignpostPayload:(id)a3;
@end

@implementation MADMultiModalProcessingTask

- (MADMultiModalProcessingTask)initWithRequests:(id)a3 inputs:(id)a4 cancelBlock:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __85__MADMultiModalProcessingTask_initWithRequests_inputs_cancelBlock_completionHandler___block_invoke;
  v25[3] = &unk_1E6298188;
  id v15 = v14;
  id v26 = v15;
  v24.receiver = self;
  v24.super_class = (Class)MADMultiModalProcessingTask;
  v16 = [(VCPMABaseTask *)&v24 initWithCompletionHandler:v25];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_requests, a3);
    objc_storeStrong((id *)&v17->_inputs, a4);
    signpostPayload = v17->_signpostPayload;
    v17->_signpostPayload = (NSString *)&stru_1F15A0D70;

    uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    subtasks = v17->_subtasks;
    v17->_subtasks = (NSMutableArray *)v19;

    [(VCPMABaseTask *)v17 setCancelBlock:v13];
    dispatch_queue_t v21 = dispatch_queue_create("MADMultiModalProcessingTask", 0);
    cancelQueue = v17->_cancelQueue;
    v17->_cancelQueue = (OS_dispatch_queue *)v21;
  }
  return v17;
}

void __85__MADMultiModalProcessingTask_initWithRequests_inputs_cancelBlock_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 objectForKeyedSubscript:@"Replies"];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (BOOL)cachesResources
{
  return 1;
}

- (BOOL)run:(id *)a3
{
  v75[1] = *MEMORY[0x1E4F143B8];
  id v5 = VCPSignPostLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  v7 = VCPSignPostLog();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    signpostPayload = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    v68 = signpostPayload;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "MADMultiModalProcessingTask_Run", "%@", buf, 0xCu);
  }

  cancelQueue = self->_cancelQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__MADMultiModalProcessingTask_run___block_invoke;
  block[3] = &unk_1E6296FD0;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
  if ([(VCPMABaseTask *)self isCanceled])
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_INFO, "Request canceled", buf, 2u);
      }
    }
    if (!a3) {
      return 0;
    }
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28760];
    uint64_t v74 = *MEMORY[0x1E4F28568];
    id v14 = [NSString stringWithFormat:@"Request was canceled"];
    v75[0] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:&v74 count:1];
    v16 = [v12 errorWithDomain:v13 code:-128 userInfo:v15];
    id v17 = *a3;
    *a3 = v16;

LABEL_42:
    BOOL v42 = 0;
  }
  else
  {
    os_signpost_id_t spid = v6;
    unint64_t v53 = v6 - 1;
    v54 = a3;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v14 = self->_subtasks;
    uint64_t v18 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v59 objects:v73 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v60;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v60 != v20) {
            objc_enumerationMutation(v14);
          }
          v22 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          v23 = (void *)MEMORY[0x1C186D320]();
          int v24 = [v22 run];
          if (v24)
          {
            int v25 = v24;
            if (v24 == -128)
            {
              if ((int)MediaAnalysisLogLevel() >= 6)
              {
                v44 = VCPLogInstance();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1BBEDA000, v44, OS_LOG_TYPE_INFO, "Request canceled", buf, 2u);
                }
              }
              if (v54)
              {
                v45 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v46 = *MEMORY[0x1E4F28760];
                uint64_t v71 = *MEMORY[0x1E4F28568];
                v47 = [NSString stringWithFormat:@"Request was canceled"];
                v72 = v47;
                v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
                uint64_t v49 = [v45 errorWithDomain:v46 code:-128 userInfo:v48];
                id v50 = *v54;
                id *v54 = (id)v49;
              }
              goto LABEL_42;
            }
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              id v26 = VCPLogInstance();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                v27 = (objc_class *)objc_opt_class();
                NSStringFromClass(v27);
                v28 = (NSString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v68 = v28;
                __int16 v69 = 1024;
                int v70 = v25;
                _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_DEFAULT, "%@ returned unexpected status (%d)", buf, 0x12u);
              }
            }
          }
        }
        uint64_t v19 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v59 objects:v73 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    id v14 = [MEMORY[0x1E4F1CA48] array];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v29 = self->_requests;
    uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v55 objects:v66 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v56;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v56 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v55 + 1) + 8 * j);
          id v35 = objc_alloc_init(MEMORY[0x1E4F74620]);
          v36 = [v34 results];
          [v35 setResults:v36];

          v37 = [v34 error];
          [v35 setError:v37];

          [(NSMutableArray *)v14 addObject:v35];
        }
        uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v55 objects:v66 count:16];
      }
      while (v31);
    }

    v38 = VCPSignPostLog();
    v39 = v38;
    if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      v40 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v68 = v40;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v39, OS_SIGNPOST_INTERVAL_END, spid, "MADMultiModalProcessingTask_Run", "%@", buf, 0xCu);
    }

    v41 = [(VCPMABaseTask *)self completionHandler];
    v64 = @"Replies";
    v65 = v14;
    BOOL v42 = 1;
    v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
    ((void (**)(void, void *, void))v41)[2](v41, v43, 0);
  }
  return v42;
}

void __35__MADMultiModalProcessingTask_run___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v24;
    uint64_t v20 = *MEMORY[0x1E4F28760];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    p_cache = VCPMADImageCaptionResource.cache;
    os_signpost_id_t v6 = &OBJC_IVAR___VCPCNNModelEspresso__context;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v24 != v4) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v9 = [p_cache + 58 subtaskForRequest:v8 inputs:*(void *)(*(void *)(a1 + 32) + v6[10])];
        if (v9)
        {
          [*(id *)(*(void *)(a1 + 32) + 56) addObject:v9];
        }
        else
        {
          v10 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v27 = v19;
          id v11 = NSString;
          id v12 = (objc_class *)objc_opt_class();
          v22 = NSStringFromClass(v12);
          uint64_t v13 = [v11 stringWithFormat:@"%@ not currently implemented", v22];
          v28 = v13;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
          uint64_t v14 = v3;
          uint64_t v15 = v4;
          id v17 = v16 = p_cache;
          uint64_t v18 = [v10 errorWithDomain:v20 code:-4 userInfo:v17];
          [v8 setError:v18];

          os_signpost_id_t v6 = &OBJC_IVAR___VCPCNNModelEspresso__context;
          p_cache = v16;
          uint64_t v4 = v15;
          uint64_t v3 = v14;
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v3);
  }
}

- (void)cancel
{
  cancelQueue = self->_cancelQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__MADMultiModalProcessingTask_cancel__block_invoke;
  block[3] = &unk_1E6296FD0;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
}

void __37__MADMultiModalProcessingTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v11.receiver = *(id *)(a1 + 32);
  v11.super_class = (Class)MADMultiModalProcessingTask;
  objc_msgSendSuper2(&v11, sel_cancel);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 56);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "cancel", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v12 count:16];
    }
    while (v4);
  }
}

- (NSString)signpostPayload
{
  return self->_signpostPayload;
}

- (void)setSignpostPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelQueue, 0);
  objc_storeStrong((id *)&self->_subtasks, 0);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end