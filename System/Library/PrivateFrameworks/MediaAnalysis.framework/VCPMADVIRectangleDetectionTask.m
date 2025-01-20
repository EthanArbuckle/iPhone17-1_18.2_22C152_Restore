@interface VCPMADVIRectangleDetectionTask
+ (id)dependencies;
+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (BOOL)autoCancellable;
- (VCPMADVIRectangleDetectionTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (float)resourceRequirement;
- (int)run;
- (void)cancel;
- (void)setPreferredMetalDevice:(id)a3;
@end

@implementation VCPMADVIRectangleDetectionTask

- (VCPMADVIRectangleDetectionTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VCPMADVIRectangleDetectionTask;
  v12 = [(VCPMADVIRectangleDetectionTask *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
    dispatch_queue_t v14 = dispatch_queue_create("VCPMADVIRectangleDetectionTask", 0);
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

- (void)setPreferredMetalDevice:(id)a3
{
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
  block[2] = __40__VCPMADVIRectangleDetectionTask_cancel__block_invoke;
  block[3] = &unk_1E6296FF8;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
}

void __40__VCPMADVIRectangleDetectionTask_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  if (WeakRetained) {
    [WeakRetained cancel];
  }
  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 48));
}

- (int)run
{
  v66[1] = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_INFO, "VCPMADVIRectangleDetectionTask running...", buf, 2u);
    }
  }
  v58 = 0;
  unsigned int v57 = 0;
  if (![(VCPMADServiceImageAsset *)self->_imageAsset loadPixelBuffer:&v58 orientation:&v57])
  {
    v7 = +[VCPMADVIRectangleDetectionResource sharedResource];
    id v10 = +[VCPMADResourceManager sharedManager];
    v53 = [v10 activateResource:v7];

    id v11 = objc_alloc_init(MEMORY[0x1E4F457C8]);
    if (DeviceHasANE())
    {
      v12 = [MEMORY[0x1E4F458E8] defaultANEDevice];
      [v11 setProcessingDevice:v12];
    }
    [(MADVIRectangleDetectionRequest *)self->_request minimumAspectRatio];
    objc_msgSend(v11, "setMinimumAspectRatio:");
    [(MADVIRectangleDetectionRequest *)self->_request maximumAspectRatio];
    objc_msgSend(v11, "setMaximumAspectRatio:");
    [(MADVIRectangleDetectionRequest *)self->_request quadratureTolerance];
    objc_msgSend(v11, "setQuadratureTolerance:");
    [(MADVIRectangleDetectionRequest *)self->_request minimumSize];
    objc_msgSend(v11, "setMinimumSize:");
    [(MADVIRectangleDetectionRequest *)self->_request minimumConfidence];
    objc_msgSend(v11, "setMinimumConfidence:");
    objc_msgSend(v11, "setMaximumObservations:", -[MADVIRectangleDetectionRequest maximumObservations](self->_request, "maximumObservations"));
    if (self->_preferredMetalDevice)
    {
      v13 = objc_msgSend(MEMORY[0x1E4F458E8], "deviceForMetalDevice:");
      [v11 setProcessingDevice:v13];

      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        id v14 = VCPLogInstance();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v15 = [v11 processingDevice];
          preferredMetalDevice = self->_preferredMetalDevice;
          *(_DWORD *)buf = 138412546;
          v62 = v15;
          __int16 v63 = 2112;
          v64 = preferredMetalDevice;
          _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_DEBUG, "[RectangleDetection] Set VNProcessingDevice: %@ (%@)", buf, 0x16u);
        }
      }
    }
    cancelQueue = self->_cancelQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__VCPMADVIRectangleDetectionTask_run__block_invoke;
    block[3] = &unk_1E62982E8;
    block[4] = self;
    id v18 = v11;
    id v56 = v18;
    dispatch_sync(cancelQueue, block);
    unsigned __int8 v19 = atomic_load((unsigned __int8 *)&self->_canceled);
    if (v19)
    {
      id v8 = 0;
      int v9 = -128;
LABEL_43:

      goto LABEL_44;
    }
    __int16 v20 = VCPSignPostLog();
    os_signpost_id_t v21 = os_signpost_id_generate(v20);

    uint64_t v22 = VCPSignPostLog();
    v23 = v22;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      signpostPayload = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v62 = signpostPayload;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "VNImageRequestHandler_init", "%@", buf, 0xCu);
    }

    id v25 = objc_alloc(MEMORY[0x1E4F45890]);
    v26 = v58;
    uint64_t v27 = v57;
    v28 = [v7 session];
    v52 = (void *)[v25 initWithCVPixelBuffer:v26 orientation:v27 options:MEMORY[0x1E4F1CC08] session:v28];

    v29 = VCPSignPostLog();
    v30 = v29;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      v31 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v62 = v31;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v30, OS_SIGNPOST_INTERVAL_END, v21, "VNImageRequestHandler_init", "%@", buf, 0xCu);
    }

    v32 = VCPSignPostLog();
    os_signpost_id_t v33 = os_signpost_id_generate(v32);

    v34 = VCPSignPostLog();
    v35 = v34;
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      v36 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v62 = v36;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
    }

    id v60 = v18;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
    id v54 = 0;
    int v38 = [v52 performRequests:v37 error:&v54];
    id v8 = v54;

    v39 = VCPSignPostLog();
    v40 = v39;
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
    {
      v41 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v62 = v41;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v40, OS_SIGNPOST_INTERVAL_END, v33, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
    }

    if (v38)
    {
      request = self->_request;
      id v43 = objc_alloc(MEMORY[0x1E4F746E0]);
      v44 = [v18 results];
      v45 = (void *)[v43 initWithObservations:v44];
      v59 = v45;
      v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
      [(MADVIRectangleDetectionRequest *)request setResults:v46];

      v47 = [(MADVIRectangleDetectionRequest *)self->_request results];
      v48 = [v47 firstObject];
      objc_msgSend(v48, "setExecutionNanoseconds:", objc_msgSend(v18, "executionNanoseconds"));
    }
    else
    {
      unsigned __int8 v49 = atomic_load((unsigned __int8 *)&self->_canceled);
      if (v49)
      {
        int v9 = -128;
LABEL_42:

        goto LABEL_43;
      }
      [(MADVIRectangleDetectionRequest *)self->_request setError:v8];
    }
    [v53 reset];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v50 = VCPLogInstance();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v50, OS_LOG_TYPE_INFO, "VCPMADVIRectangleDetectionTask complete", buf, 2u);
      }
    }
    int v9 = 0;
    goto LABEL_42;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "VCPMADVIRectangleDetectionTask image loading failed", buf, 2u);
    }
  }
  v5 = self->_request;
  v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v65 = *MEMORY[0x1E4F28568];
  v7 = [NSString stringWithFormat:@"Image loading failed"];
  v66[0] = v7;
  v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:&v65 count:1];
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -18);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(MADVIRectangleDetectionRequest *)v5 setError:v8];
  int v9 = 0;
LABEL_44:

  CF<opaqueCMSampleBuffer *>::~CF(&v58);
  return v9;
}

id __37__VCPMADVIRectangleDetectionTask_run__block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakRequest);
  objc_storeStrong((id *)&self->_cancelQueue, 0);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_preferredMetalDevice, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end