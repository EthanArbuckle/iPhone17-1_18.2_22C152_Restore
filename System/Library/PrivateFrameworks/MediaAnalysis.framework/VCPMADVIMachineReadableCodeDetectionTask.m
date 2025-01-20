@interface VCPMADVIMachineReadableCodeDetectionTask
+ (id)dependencies;
+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (BOOL)autoCancellable;
- (BOOL)canReuseResultsForRequest;
- (VCPMADVIMachineReadableCodeDetectionTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (float)resourceRequirement;
- (int)run;
- (void)cancel;
@end

@implementation VCPMADVIMachineReadableCodeDetectionTask

- (VCPMADVIMachineReadableCodeDetectionTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VCPMADVIMachineReadableCodeDetectionTask;
  v12 = [(VCPMADVIMachineReadableCodeDetectionTask *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
    dispatch_queue_t v14 = dispatch_queue_create("VCPMADVIMachineReadableCodeDetectionTask", 0);
    cancelQueue = v13->_cancelQueue;
    v13->_cancelQueue = (OS_dispatch_queue *)v14;
  }
  return v13;
}

+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isMemberOfClass:objc_opt_class()])
  {
    id v11 = (void *)[objc_alloc((Class)a1) initWithRequest:v8 imageAsset:v9 andSignpostPayload:v10];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        int v18 = 138412546;
        id v19 = v14;
        __int16 v20 = 2112;
        v21 = v16;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEFAULT, "Incompatible request (%@) specified to %@", (uint8_t *)&v18, 0x16u);
      }
    }
    id v11 = 0;
  }

  return v11;
}

+ (id)dependencies
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void)cancel
{
  cancelQueue = self->_cancelQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__VCPMADVIMachineReadableCodeDetectionTask_cancel__block_invoke;
  block[3] = &unk_1E6296FF8;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
}

void __50__VCPMADVIMachineReadableCodeDetectionTask_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  if (WeakRetained) {
    [WeakRetained cancel];
  }
  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 40));
}

- (BOOL)canReuseResultsForRequest
{
  v3 = [(MADVIMachineReadableCodeDetectionRequest *)self->_request symbologies];
  if ([v3 count] == 2)
  {
    v4 = [(MADVIMachineReadableCodeDetectionRequest *)self->_request symbologies];
    if ([v4 containsObject:*MEMORY[0x1E4F45BA0]])
    {
      v5 = [(MADVIMachineReadableCodeDetectionRequest *)self->_request symbologies];
      char v6 = [v5 containsObject:*MEMORY[0x1E4F45B78]];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (int)run
{
  v77[1] = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_INFO, "VCPMADVIMachineReadableCodeDetectionTask running...", buf, 2u);
    }
  }
  if (!VCPPhotosMRCCachingEnabled()
    || ([(VCPMADServiceImageAsset *)self->_imageAsset barcodeObservations],
        (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v68 = 0;
    unsigned int v67 = 0;
    if ([(VCPMADServiceImageAsset *)self->_imageAsset loadPixelBuffer:&v68 orientation:&v67])
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        id v10 = VCPLogInstance();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEFAULT, "VCPMADVIMachineReadableCodeDetectionTask image loading failed", buf, 2u);
        }
      }
      request = self->_request;
      v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v75 = *MEMORY[0x1E4F28568];
      v13 = [NSString stringWithFormat:@"Image loading failed"];
      v76 = v13;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
      id v15 = [v12 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v14];
      [(MADVIMachineReadableCodeDetectionRequest *)request setError:v15];
      int v9 = 0;
      goto LABEL_60;
    }
    v13 = +[VCPMADMachineReadableCodeResource sharedResource];
    v16 = +[VCPMADResourceManager sharedManager];
    id v14 = [v16 activateResource:v13];

    v63 = objc_msgSend(MEMORY[0x1E4F45768], "mad_defaultRequest");
    if (!v63)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v53 = VCPLogInstance();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v53, OS_LOG_TYPE_ERROR, "Failed to configure VNDetectBarcodesRequest", buf, 2u);
        }
      }
      v54 = self->_request;
      v55 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v73 = *MEMORY[0x1E4F28568];
      v56 = [NSString stringWithFormat:@"Failed to configure VNDetectBarcodesRequest"];
      v74 = v56;
      v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
      v58 = [v55 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v57];
      [(MADVIMachineReadableCodeDetectionRequest *)v54 setError:v58];

      id v15 = 0;
      int v9 = 0;
      goto LABEL_59;
    }
    objc_super v17 = [(MADVIMachineReadableCodeDetectionRequest *)self->_request symbologies];
    BOOL v18 = [v17 count] == 0;

    if (!v18)
    {
      id v19 = [(MADVIMachineReadableCodeDetectionRequest *)self->_request symbologies];
      [v63 setSymbologies:v19];
    }
    cancelQueue = self->_cancelQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__VCPMADVIMachineReadableCodeDetectionTask_run__block_invoke;
    block[3] = &unk_1E62982E8;
    block[4] = self;
    id v21 = v63;
    id v66 = v21;
    dispatch_sync(cancelQueue, block);
    unsigned __int8 v22 = atomic_load((unsigned __int8 *)&self->_canceled);
    if (v22)
    {
      id v15 = 0;
      int v9 = -128;
LABEL_58:

LABEL_59:
LABEL_60:

      CF<opaqueCMSampleBuffer *>::~CF(&v68);
      return v9;
    }
    v23 = VCPSignPostLog();
    os_signpost_id_t v24 = os_signpost_id_generate(v23);

    v25 = VCPSignPostLog();
    v26 = v25;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      signpostPayload = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v72 = signpostPayload;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "VNImageRequestHandler_init", "%@", buf, 0xCu);
    }

    id v28 = objc_alloc(MEMORY[0x1E4F45890]);
    v29 = v68;
    uint64_t v30 = v67;
    v31 = [v13 session];
    v62 = (void *)[v28 initWithCVPixelBuffer:v29 orientation:v30 options:MEMORY[0x1E4F1CC08] session:v31];

    v32 = VCPSignPostLog();
    v33 = v32;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      v34 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v72 = v34;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v33, OS_SIGNPOST_INTERVAL_END, v24, "VNImageRequestHandler_init", "%@", buf, 0xCu);
    }

    v35 = VCPSignPostLog();
    os_signpost_id_t v36 = os_signpost_id_generate(v35);

    v37 = VCPSignPostLog();
    v38 = v37;
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      v39 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v72 = v39;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
    }

    id v70 = v21;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
    id v64 = 0;
    int v41 = [v62 performRequests:v40 error:&v64];
    id v15 = v64;

    v42 = VCPSignPostLog();
    v43 = v42;
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
    {
      v44 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v72 = v44;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v43, OS_SIGNPOST_INTERVAL_END, v36, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
    }

    if (v41)
    {
      v45 = self->_request;
      id v46 = objc_alloc(MEMORY[0x1E4F746D0]);
      v47 = [v21 results];
      v48 = (void *)[v46 initWithObservations:v47];
      v69 = v48;
      v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
      [(MADVIMachineReadableCodeDetectionRequest *)v45 setResults:v49];

      v50 = [(MADVIMachineReadableCodeDetectionRequest *)self->_request results];
      v51 = [v50 firstObject];
      objc_msgSend(v51, "setExecutionNanoseconds:", objc_msgSend(v21, "executionNanoseconds"));

      if (VCPPhotosMRCCachingEnabled())
      {
        if ([(VCPMADVIMachineReadableCodeDetectionTask *)self canReuseResultsForRequest])
        {
          v52 = [v21 results];
          [(VCPMADServiceImageAsset *)self->_imageAsset setBarcodeObservations:v52];
LABEL_51:

          goto LABEL_52;
        }
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v52 = VCPLogInstance();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v52, OS_LOG_TYPE_DEFAULT, "[MRC] Custom request configuration; not persisting result",
              buf,
              2u);
          }
          goto LABEL_51;
        }
      }
    }
    else
    {
      unsigned __int8 v59 = atomic_load((unsigned __int8 *)&self->_canceled);
      if (v59)
      {
        int v9 = -128;
LABEL_57:

        goto LABEL_58;
      }
      [(MADVIMachineReadableCodeDetectionRequest *)self->_request setError:v15];
    }
LABEL_52:
    [v14 reset];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v60 = VCPLogInstance();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v60, OS_LOG_TYPE_INFO, "VCPMADVIMachineReadableCodeDetectionTask complete", buf, 2u);
      }
    }
    int v9 = 0;
    goto LABEL_57;
  }
  if (![(VCPMADVIMachineReadableCodeDetectionTask *)self canReuseResultsForRequest]
    && (int)MediaAnalysisLogLevel() >= 4)
  {
    v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEFAULT, "[MRC] Custom request configuration; overriding to use cached data",
        buf,
        2u);
    }
  }
  char v6 = self->_request;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F746D0]) initWithObservations:v4];
  v77[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:1];
  [(MADVIMachineReadableCodeDetectionRequest *)v6 setResults:v8];

  return 0;
}

id __47__VCPMADVIMachineReadableCodeDetectionTask_run__block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakRequest);
  objc_storeStrong((id *)&self->_cancelQueue, 0);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end