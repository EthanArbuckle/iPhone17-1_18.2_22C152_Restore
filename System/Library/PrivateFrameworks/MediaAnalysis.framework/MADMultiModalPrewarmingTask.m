@interface MADMultiModalPrewarmingTask
- (BOOL)cachesResources;
- (BOOL)run:(id *)a3;
- (MADMultiModalPrewarmingTask)initWithRequests:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5;
- (NSString)signpostPayload;
- (void)setSignpostPayload:(id)a3;
@end

@implementation MADMultiModalPrewarmingTask

- (MADMultiModalPrewarmingTask)initWithRequests:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__MADMultiModalPrewarmingTask_initWithRequests_cancelBlock_completionHandler___block_invoke;
  v18[3] = &unk_1E6298188;
  id v12 = v11;
  id v19 = v12;
  v17.receiver = self;
  v17.super_class = (Class)MADMultiModalPrewarmingTask;
  v13 = [(VCPMABaseTask *)&v17 initWithCompletionHandler:v18];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_requests, a3);
    signpostPayload = v14->_signpostPayload;
    v14->_signpostPayload = (NSString *)&stru_1F15A0D70;

    [(VCPMABaseTask *)v14 setCancelBlock:v10];
  }

  return v14;
}

uint64_t __78__MADMultiModalPrewarmingTask_initWithRequests_cancelBlock_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)cachesResources
{
  return 1;
}

- (BOOL)run:(id *)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v4 = VCPSignPostLog();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  v6 = VCPSignPostLog();
  v7 = v6;
  unint64_t v48 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    signpostPayload = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    v60 = signpostPayload;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "MADMultiModalPrewarmingTask_Run", "%@", buf, 0xCu);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v9 = self->_requests;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v51 objects:v65 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v52;
    uint64_t v47 = *MEMORY[0x1E4F28760];
    uint64_t v46 = *MEMORY[0x1E4F28568];
    os_signpost_id_t v45 = v5;
LABEL_6:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v52 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v51 + 1) + 8 * v13);
      if ([(VCPMABaseTask *)self isCanceled]) {
        break;
      }
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        objc_super v17 = VCPLogInstance();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v60 = v16;
          _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_INFO, "Prewarming %@", buf, 0xCu);
        }
      }
      if (![v14 isMemberOfClass:objc_opt_class()])
      {
        v25 = (void (**)(void, void, void))v9;
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v32 = VCPLogInstance();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v60 = v16;
            _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_ERROR, "%@ does not support prewarming", buf, 0xCu);
          }
        }
        if (a3)
        {
          v33 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v55 = v46;
          v29 = [NSString stringWithFormat:@"%@ does not support prewarming", v16];
          v56 = v29;
          v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          v35 = [v33 errorWithDomain:v47 code:-50 userInfo:v34];
          id v36 = *a3;
          *a3 = v35;

LABEL_34:
        }
LABEL_42:

LABEL_43:
        BOOL v26 = 0;
        goto LABEL_44;
      }
      v18 = (void *)MEMORY[0x1C186D320]();
      id v19 = v14;
      id v50 = 0;
      BOOL v20 = +[MADPersonalizedEmbeddingTask prewarmRequest:v19 error:&v50];
      id v21 = v50;
      if (!v20)
      {
        v25 = (void (**)(void, void, void))v9;
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v37 = VCPLogInstance();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v38 = [v21 description];
            *(_DWORD *)buf = 138412546;
            v60 = v16;
            __int16 v61 = 2112;
            v62 = v38;
            _os_log_impl(&dword_1BBEDA000, v37, OS_LOG_TYPE_ERROR, "Failed to prewarm %@ (%@)", buf, 0x16u);
          }
        }
        if (a3)
        {
          v39 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v57 = v46;
          v40 = [NSString stringWithFormat:@"Failed to prewarm %@", v16];
          v58 = v40;
          v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
          v42 = [v39 errorWithDomain:v47 code:-50 userInfo:v41];
          id v43 = *a3;
          *a3 = v42;
        }
        goto LABEL_42;
      }

      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v51 objects:v65 count:16];
        os_signpost_id_t v5 = v45;
        if (v11) {
          goto LABEL_6;
        }
        goto LABEL_18;
      }
    }
    v25 = (void (**)(void, void, void))v9;
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v27 = VCPLogInstance();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_INFO, "Request canceled", buf, 2u);
      }
    }
    if (a3)
    {
      v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v63 = v46;
      v16 = [NSString stringWithFormat:@"Request was canceled"];
      v64 = v16;
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
      v30 = [v28 errorWithDomain:v47 code:-128 userInfo:v29];
      id v31 = *a3;
      *a3 = v30;

      goto LABEL_34;
    }
    goto LABEL_43;
  }
LABEL_18:

  v22 = VCPSignPostLog();
  v23 = v22;
  if (v48 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    v24 = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    v60 = v24;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v23, OS_SIGNPOST_INTERVAL_END, v5, "MADMultiModalPrewarmingTask_Run", "%@", buf, 0xCu);
  }

  v25 = [(VCPMABaseTask *)self completionHandler];
  v25[2](v25, 0, 0);
  BOOL v26 = 1;
LABEL_44:

  return v26;
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
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end