@interface MADServiceTextPrewarmingTask
- (BOOL)cachesResources;
- (BOOL)interruptBackgroundTasks;
- (BOOL)run:(id *)p_isa;
- (MADServiceTextPrewarmingTask)initWithRequests:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5;
- (NSString)signpostPayload;
- (void)setSignpostPayload:(id)a3;
@end

@implementation MADServiceTextPrewarmingTask

- (MADServiceTextPrewarmingTask)initWithRequests:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__MADServiceTextPrewarmingTask_initWithRequests_cancelBlock_completionHandler___block_invoke;
  v20[3] = &unk_1E6298188;
  id v12 = v11;
  id v21 = v12;
  v19.receiver = self;
  v19.super_class = (Class)MADServiceTextPrewarmingTask;
  v13 = [(VCPMABaseTask *)&v19 initWithCompletionHandler:v20];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_requests, a3);
    signpostPayload = v14->_signpostPayload;
    v14->_signpostPayload = (NSString *)&stru_1F15A0D70;

    [(VCPMABaseTask *)v14 setCancelBlock:v10];
    dispatch_queue_t v16 = dispatch_queue_create("MADServiceTextProcessingTask", 0);
    cancelQueue = v14->_cancelQueue;
    v14->_cancelQueue = (OS_dispatch_queue *)v16;
  }
  return v14;
}

uint64_t __79__MADServiceTextPrewarmingTask_initWithRequests_cancelBlock_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)cachesResources
{
  return 1;
}

- (BOOL)interruptBackgroundTasks
{
  return 0;
}

- (BOOL)run:(id *)p_isa
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v5 = VCPSignPostLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  v7 = VCPSignPostLog();
  v8 = v7;
  unint64_t v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    signpostPayload = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    v54 = signpostPayload;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "MADServiceTextPrewarmingTask_Run", "%@", buf, 0xCu);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v11 = self->_requests;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v45;
    unint64_t v41 = v6 - 1;
    os_signpost_id_t v42 = v6;
LABEL_6:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v45 != v14) {
        objc_enumerationMutation(v11);
      }
      dispatch_queue_t v16 = *(void **)(*((void *)&v44 + 1) + 8 * v15);
      if ([(VCPMABaseTask *)self isCanceled]) {
        break;
      }
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        objc_super v19 = VCPLogInstance();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v18;
          _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_INFO, "Prewarming %@", buf, 0xCu);
        }
      }
      if (![v16 isMemberOfClass:objc_opt_class()])
      {
        v28 = (void (**)(void, void, void))v11;
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v35 = VCPLogInstance();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v54 = v18;
            _os_log_impl(&dword_1BBEDA000, v35, OS_LOG_TYPE_ERROR, "%@ does not support prewarming", buf, 0xCu);
          }
        }
        if (p_isa)
        {
          v36 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v37 = *MEMORY[0x1E4F28760];
          uint64_t v48 = *MEMORY[0x1E4F28568];
          v32 = [NSString stringWithFormat:@"%@ does not support prewarming", v18];
          v49 = v32;
          v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
          v38 = [v36 errorWithDomain:v37 code:-50 userInfo:v34];
          id v39 = *p_isa;
          *p_isa = v38;

LABEL_37:
        }

        LOBYTE(p_isa) = 0;
        goto LABEL_40;
      }
      v20 = (void *)MEMORY[0x1C186D320]();
      id v43 = 0;
      BOOL v21 = +[MADTextEmbeddingTask prewarmRequest:v16 error:&v43];
      id v22 = v43;
      v23 = v22;
      if (p_isa && !v21)
      {
        v24 = (void *)[v22 copy];
        id v25 = *p_isa;
        *p_isa = v24;
      }

      if (!v21)
      {
        LOBYTE(p_isa) = 0;
        v28 = (void (**)(void, void, void))v11;
        goto LABEL_40;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v44 objects:v52 count:16];
        unint64_t v9 = v41;
        os_signpost_id_t v6 = v42;
        if (v13) {
          goto LABEL_6;
        }
        goto LABEL_21;
      }
    }
    v28 = (void (**)(void, void, void))v11;
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v29 = VCPLogInstance();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_INFO, "Request canceled", buf, 2u);
      }
    }
    if (p_isa)
    {
      v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28760];
      uint64_t v50 = *MEMORY[0x1E4F28568];
      v18 = [NSString stringWithFormat:@"Request was canceled"];
      v51 = v18;
      v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      v33 = [v30 errorWithDomain:v31 code:-128 userInfo:v32];
      v34 = *p_isa;
      *p_isa = v33;
      goto LABEL_37;
    }
  }
  else
  {
LABEL_21:

    v26 = VCPSignPostLog();
    p_isa = (id *)&v26->isa;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      v27 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v54 = v27;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, (os_log_t)p_isa, OS_SIGNPOST_INTERVAL_END, v6, "MADServiceTextPrewarmingTask_Run", "%@", buf, 0xCu);
    }

    v28 = [(VCPMABaseTask *)self completionHandler];
    v28[2](v28, 0, 0);
    LOBYTE(p_isa) = 1;
  }
LABEL_40:

  return (char)p_isa;
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
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end