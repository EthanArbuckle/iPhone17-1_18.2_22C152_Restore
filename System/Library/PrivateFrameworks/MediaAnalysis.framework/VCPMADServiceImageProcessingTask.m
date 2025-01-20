@interface VCPMADServiceImageProcessingTask
+ (id)taskWithRequests:(id)a3 forAsset:(id)a4 cancelBlock:(id)a5 andCompletionHandler:(id)a6;
- (BOOL)cachesResources;
- (BOOL)run:(id *)a3;
- (NSString)signpostPayload;
- (VCPMADServiceImageProcessingTask)initWithRequests:(id)a3 forAsset:(id)a4 cancelBlock:(id)a5 andCompletionHandler:(id)a6;
- (void)cancel;
- (void)setSignpostPayload:(id)a3;
@end

@implementation VCPMADServiceImageProcessingTask

- (VCPMADServiceImageProcessingTask)initWithRequests:(id)a3 forAsset:(id)a4 cancelBlock:(id)a5 andCompletionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __95__VCPMADServiceImageProcessingTask_initWithRequests_forAsset_cancelBlock_andCompletionHandler___block_invoke;
  v25[3] = &unk_1E6297A60;
  id v15 = v14;
  id v26 = v15;
  v24.receiver = self;
  v24.super_class = (Class)VCPMADServiceImageProcessingTask;
  v16 = [(VCPMABaseTask *)&v24 initWithCompletionHandler:v25];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_requests, a3);
    objc_storeStrong((id *)&v17->_asset, a4);
    signpostPayload = v17->_signpostPayload;
    v17->_signpostPayload = (NSString *)&stru_1F15A0D70;

    uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    subtasks = v17->_subtasks;
    v17->_subtasks = (NSMutableArray *)v19;

    [(VCPMABaseTask *)v17 setCancelBlock:v13];
    dispatch_queue_t v21 = dispatch_queue_create("VCPMADServiceImageProcessingTask", 0);
    cancelQueue = v17->_cancelQueue;
    v17->_cancelQueue = (OS_dispatch_queue *)v21;
  }
  return v17;
}

uint64_t __95__VCPMADServiceImageProcessingTask_initWithRequests_forAsset_cancelBlock_andCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)taskWithRequests:(id)a3 forAsset:(id)a4 cancelBlock:(id)a5 andCompletionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRequests:v9 forAsset:v10 cancelBlock:v11 andCompletionHandler:v12];

  return v13;
}

- (BOOL)cachesResources
{
  return 1;
}

- (BOOL)run:(id *)a3
{
  v61[1] = *MEMORY[0x1E4F143B8];
  v5 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v5);

  v6 = VCPSignPostLog();
  v7 = v6;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    signpostPayload = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    v52 = signpostPayload;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v7, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADServiceImageProcessingTask_Run", "%@", buf, 0xCu);
  }

  [(VCPMADServiceImageAsset *)self->_asset setSignpostPayload:self->_signpostPayload];
  cancelQueue = self->_cancelQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__VCPMADServiceImageProcessingTask_run___block_invoke;
  block[3] = &unk_1E6296FF8;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
  if (![(VCPMABaseTask *)self isCanceled])
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v12 = self->_subtasks;
    uint64_t v16 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v46 objects:v59 count:16];
    if (!v16)
    {
LABEL_43:

      v39 = VCPSignPostLog();
      v40 = v39;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
      {
        v41 = self->_signpostPayload;
        *(_DWORD *)buf = 138412290;
        v52 = v41;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v40, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADServiceImageProcessingTask_Run", "%@", buf, 0xCu);
      }

      id v12 = [(VCPMABaseTask *)self completionHandler];
      ((void (*)(NSMutableArray *, void, void))v12[2].super.super.isa)(v12, 0, 0);
      LOBYTE(a3) = 1;
LABEL_47:

      return (char)a3;
    }
    uint64_t v17 = *(void *)v47;
    uint64_t v44 = *MEMORY[0x1E4F28760];
    uint64_t v45 = *MEMORY[0x1E4F28568];
LABEL_14:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v47 != v17) {
        objc_enumerationMutation(v12);
      }
      uint64_t v19 = *(void **)(*((void *)&v46 + 1) + 8 * v18);
      v20 = (void *)MEMORY[0x1C186D320]();
      if ([(VCPMABaseTask *)self isCanceled])
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          dispatch_queue_t v21 = VCPLogInstance();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = (NSString *)objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v52 = v22;
            v23 = v22;
            _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_INFO, "Request subtask %@ canceled", buf, 0xCu);
          }
        }
        if (!a3) {
          goto LABEL_34;
        }
        objc_super v24 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v57 = v45;
        v25 = [NSString stringWithFormat:@"Request was canceled"];
        v58 = v25;
        id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        v27 = [v24 errorWithDomain:v44 code:-128 userInfo:v26];
        id v28 = *a3;
        *a3 = v27;
      }
      else
      {
        int v29 = [v19 run];
        int v30 = v29;
        if (!v29) {
          goto LABEL_39;
        }
        if (v29 != -128)
        {
          if ((int)MediaAnalysisLogLevel() < 4)
          {
LABEL_39:
            int v36 = 1;
            goto LABEL_40;
          }
          v25 = VCPLogInstance();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v37 = (objc_class *)objc_opt_class();
            NSStringFromClass(v37);
            v38 = (NSString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v52 = v38;
            __int16 v53 = 1024;
            int v54 = v30;
            _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEFAULT, "%@ returned unexpected status (%d)", buf, 0x12u);
          }
          int v36 = 1;
          goto LABEL_33;
        }
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v31 = VCPLogInstance();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_INFO, "Request canceled", buf, 2u);
          }
        }
        if (!a3)
        {
LABEL_34:
          int v36 = 0;
          goto LABEL_40;
        }
        v32 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v55 = v45;
        v25 = [NSString stringWithFormat:@"Request was canceled"];
        v56 = v25;
        v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
        v34 = [v32 errorWithDomain:v44 code:-128 userInfo:v33];
        id v35 = *a3;
        *a3 = v34;
      }
      int v36 = 0;
LABEL_33:

LABEL_40:
      if (!v36) {
        goto LABEL_11;
      }
      if (v16 == ++v18)
      {
        uint64_t v16 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v46 objects:v59 count:16];
        if (!v16) {
          goto LABEL_43;
        }
        goto LABEL_14;
      }
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_INFO, "Request canceled", buf, 2u);
    }
  }
  if (a3)
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v60 = *MEMORY[0x1E4F28568];
    id v12 = [NSString stringWithFormat:@"Request was canceled"];
    v61[0] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];
    id v14 = [v11 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v13];
    id v15 = *a3;
    *a3 = v14;

LABEL_11:
    LOBYTE(a3) = 0;
    goto LABEL_47;
  }
  return (char)a3;
}

uint64_t __40__VCPMADServiceImageProcessingTask_run___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v19;
    uint64_t v15 = *MEMORY[0x1E4F28760];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v19 != v3) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v6 = objc_msgSend(v5, "vcp_taskWithImageAsset:andSignpostPayload:", *(void *)(*(void *)(a1 + 32) + 40), *(void *)(*(void *)(a1 + 32) + 48));
        if (v6)
        {
          [*(id *)(*(void *)(a1 + 32) + 56) addObject:v6];
        }
        else
        {
          v7 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v22 = v16;
          v8 = NSString;
          id v9 = (objc_class *)objc_opt_class();
          id v10 = NSStringFromClass(v9);
          id v11 = [v8 stringWithFormat:@"%@ not currently implemented", v10];
          v23 = v11;
          id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
          id v13 = [v7 errorWithDomain:v15 code:-4 userInfo:v12];
          [v5 setError:v13];
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v2);
  }

  return [*(id *)(*(void *)(a1 + 32) + 56) sortUsingComparator:&__block_literal_global_56];
}

uint64_t __40__VCPMADServiceImageProcessingTask_run___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [(id)objc_opt_class() dependencies];
  char v7 = [v6 containsObject:objc_opt_class()];

  if (v7)
  {
    uint64_t v8 = 1;
  }
  else
  {
    id v9 = [(id)objc_opt_class() dependencies];
    uint64_t v10 = [v9 containsObject:objc_opt_class()];

    uint64_t v8 = v10 << 63 >> 63;
  }

  return v8;
}

- (void)cancel
{
  cancelQueue = self->_cancelQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__VCPMADServiceImageProcessingTask_cancel__block_invoke;
  block[3] = &unk_1E6296FF8;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
}

void __42__VCPMADServiceImageProcessingTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1 + 32;
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)VCPMADServiceImageProcessingTask;
  objc_msgSendSuper2(&v10, sel_cancel);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  id v2 = *(id *)(*(void *)v1 + 56);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "cancel", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v11 count:16];
    }
    while (v3);
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
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end