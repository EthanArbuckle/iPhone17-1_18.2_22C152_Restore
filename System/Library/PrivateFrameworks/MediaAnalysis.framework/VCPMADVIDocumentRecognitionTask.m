@interface VCPMADVIDocumentRecognitionTask
+ (id)dependencies;
+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (BOOL)autoCancellable;
- (BOOL)canReuseResultsForRequest;
- (VCPMADVIDocumentRecognitionTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (float)resourceRequirement;
- (int)run;
- (void)cancel;
- (void)setPreferredMetalDevice:(id)a3;
@end

@implementation VCPMADVIDocumentRecognitionTask

- (VCPMADVIDocumentRecognitionTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VCPMADVIDocumentRecognitionTask;
  v12 = [(VCPMADVIDocumentRecognitionTask *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
    dispatch_queue_t v14 = dispatch_queue_create("VCPMADVIDocumentRecognitionTask", 0);
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
  block[2] = __41__VCPMADVIDocumentRecognitionTask_cancel__block_invoke;
  block[3] = &unk_1E6296FF8;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
}

void __41__VCPMADVIDocumentRecognitionTask_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  if (WeakRetained) {
    [WeakRetained cancel];
  }
  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 48));
}

- (BOOL)canReuseResultsForRequest
{
  if ([(MADVIDocumentRecognitionRequest *)self->_request maximumCandidateCount] != 3) {
    goto LABEL_6;
  }
  int v3 = [(MADVIDocumentRecognitionRequest *)self->_request usesLanguageDetection];
  if (v3)
  {
    int v3 = [(MADVIDocumentRecognitionRequest *)self->_request usesLanguageCorrection];
    if (v3)
    {
      if (([(MADVIDocumentRecognitionRequest *)self->_request usesFormFieldDetection] & 1) != 0
        || [(MADVIDocumentRecognitionRequest *)self->_request recognitionLevel])
      {
LABEL_6:
        LOBYTE(v3) = 0;
        return v3;
      }
      [(MADVIDocumentRecognitionRequest *)self->_request minimumTextHeight];
      LOBYTE(v3) = v4 == 0.0;
    }
  }
  return v3;
}

- (int)run
{
  v75[1] = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    int v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_INFO, "VCPMADVIDocumentRecognitionTask running...", buf, 2u);
    }
  }
  float v4 = [(VCPMADServiceImageAsset *)self->_imageAsset documentObservations];
  if (!v4)
  {
    v66 = 0;
    unsigned int v65 = 0;
    if ([(VCPMADServiceImageAsset *)self->_imageAsset loadPixelBuffer:&v66 orientation:&v65])
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        id v10 = VCPLogInstance();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEFAULT, "VCPMADVIDocumentRecognitionTask image loading failed", buf, 2u);
        }
      }
      request = self->_request;
      v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v73 = *MEMORY[0x1E4F28568];
      v61 = [NSString stringWithFormat:@"Image loading failed"];
      v74 = v61;
      v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -18);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      [(MADVIDocumentRecognitionRequest *)request setError:v13];
      int v9 = 0;
      goto LABEL_56;
    }
    v61 = +[VCPMADVIDocumentRecognitionResource sharedResource];
    id v14 = +[VCPMADResourceManager sharedManager];
    v60 = [v14 activateResource:v61];

    v15 = objc_msgSend(MEMORY[0x1E4F45908], "mad_defaultRequest");
    v16 = [(MADVIDocumentRecognitionRequest *)self->_request languages];
    BOOL v17 = v16 == 0;

    if (!v17)
    {
      int v18 = [(MADVIDocumentRecognitionRequest *)self->_request languages];
      [v15 setRecognitionLanguages:v18];
    }
    objc_msgSend(v15, "setMaximumCandidateCount:", -[MADVIDocumentRecognitionRequest maximumCandidateCount](self->_request, "maximumCandidateCount"));
    objc_msgSend(v15, "setUsesLanguageDetection:", -[MADVIDocumentRecognitionRequest usesLanguageDetection](self->_request, "usesLanguageDetection"));
    objc_msgSend(v15, "setUsesLanguageCorrection:", -[MADVIDocumentRecognitionRequest usesLanguageCorrection](self->_request, "usesLanguageCorrection"));
    objc_msgSend(v15, "setRecognitionLevel:", -[MADVIDocumentRecognitionRequest recognitionLevel](self->_request, "recognitionLevel"));
    [(MADVIDocumentRecognitionRequest *)self->_request minimumTextHeight];
    objc_msgSend(v15, "setMinimumTextHeight:");
    objc_msgSend(v15, "setUsesFormFieldDetection:", -[MADVIDocumentRecognitionRequest usesFormFieldDetection](self->_request, "usesFormFieldDetection"));
    if (self->_preferredMetalDevice)
    {
      id v19 = objc_msgSend(MEMORY[0x1E4F458E8], "deviceForMetalDevice:");
      [v15 setProcessingDevice:v19];

      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        __int16 v20 = VCPLogInstance();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v21 = [v15 processingDevice];
          preferredMetalDevice = self->_preferredMetalDevice;
          *(_DWORD *)buf = 138412546;
          v70 = v21;
          __int16 v71 = 2112;
          v72 = preferredMetalDevice;
          _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_DEBUG, "[DocumentRecognition] Set VNProcessingDevice: %@ (%@)", buf, 0x16u);
        }
      }
    }
    cancelQueue = self->_cancelQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__VCPMADVIDocumentRecognitionTask_run__block_invoke;
    block[3] = &unk_1E62982E8;
    block[4] = self;
    id v24 = v15;
    id v64 = v24;
    dispatch_sync(cancelQueue, block);
    unsigned __int8 v25 = atomic_load((unsigned __int8 *)&self->_canceled);
    if (v25)
    {
      id v13 = 0;
      int v9 = -128;
LABEL_55:

LABEL_56:
      CF<opaqueCMSampleBuffer *>::~CF(&v66);
      goto LABEL_57;
    }
    v26 = VCPSignPostLog();
    os_signpost_id_t v27 = os_signpost_id_generate(v26);

    v28 = VCPSignPostLog();
    v29 = v28;
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      signpostPayload = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v70 = signpostPayload;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "VNImageRequestHandler_init", "%@", buf, 0xCu);
    }

    id v31 = objc_alloc(MEMORY[0x1E4F45890]);
    v32 = v66;
    uint64_t v33 = v65;
    v34 = [v61 session];
    v59 = (void *)[v31 initWithCVPixelBuffer:v32 orientation:v33 options:MEMORY[0x1E4F1CC08] session:v34];

    v35 = VCPSignPostLog();
    v36 = v35;
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      v37 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v70 = v37;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v36, OS_SIGNPOST_INTERVAL_END, v27, "VNImageRequestHandler_init", "%@", buf, 0xCu);
    }

    v38 = VCPSignPostLog();
    os_signpost_id_t v39 = os_signpost_id_generate(v38);

    v40 = VCPSignPostLog();
    v41 = v40;
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      v42 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v70 = v42;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
    }

    id v68 = v24;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
    id v62 = 0;
    int v44 = [v59 performRequests:v43 error:&v62];
    id v13 = v62;

    v45 = VCPSignPostLog();
    v46 = v45;
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      v47 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v70 = v47;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v46, OS_SIGNPOST_INTERVAL_END, v39, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
    }

    if (v44)
    {
      v48 = self->_request;
      id v49 = objc_alloc(MEMORY[0x1E4F746B0]);
      v50 = [v24 results];
      v51 = (void *)[v49 initWithObservations:v50];
      v67 = v51;
      v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
      [(MADVIDocumentRecognitionRequest *)v48 setResults:v52];

      v53 = [(MADVIDocumentRecognitionRequest *)self->_request results];
      v54 = [v53 firstObject];
      objc_msgSend(v54, "setExecutionNanoseconds:", objc_msgSend(v24, "executionNanoseconds"));

      if ([(VCPMADVIDocumentRecognitionTask *)self canReuseResultsForRequest])
      {
        v55 = [v24 results];
        [(VCPMADServiceImageAsset *)self->_imageAsset setDocumentObservations:v55];
LABEL_48:

        goto LABEL_49;
      }
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v55 = VCPLogInstance();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v55, OS_LOG_TYPE_DEFAULT, "[DocumentRecognition] Custom request configuration; not persisting result",
            buf,
            2u);
        }
        goto LABEL_48;
      }
    }
    else
    {
      unsigned __int8 v56 = atomic_load((unsigned __int8 *)&self->_canceled);
      if (v56)
      {
        int v9 = -128;
LABEL_54:

        goto LABEL_55;
      }
      [(MADVIDocumentRecognitionRequest *)self->_request setError:v13];
    }
LABEL_49:
    objc_msgSend(v60, "reset", v59);
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v57 = VCPLogInstance();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v57, OS_LOG_TYPE_INFO, "VCPMADVIDocumentRecognitionTask complete", buf, 2u);
      }
    }
    int v9 = 0;
    goto LABEL_54;
  }
  if (![(VCPMADVIDocumentRecognitionTask *)self canReuseResultsForRequest]
    && (int)MediaAnalysisLogLevel() >= 4)
  {
    v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEFAULT, "[DocumentRecognition] Custom request configuration; overriding to use cached data",
        buf,
        2u);
    }
  }
  v6 = self->_request;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F746B0]) initWithObservations:v4];
  v75[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:1];
  [(MADVIDocumentRecognitionRequest *)v6 setResults:v8];

  int v9 = 0;
LABEL_57:

  return v9;
}

id __38__VCPMADVIDocumentRecognitionTask_run__block_invoke(uint64_t a1)
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