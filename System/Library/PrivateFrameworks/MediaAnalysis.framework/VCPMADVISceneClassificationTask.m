@interface VCPMADVISceneClassificationTask
+ (id)dependencies;
+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (BOOL)autoCancellable;
- (VCPMADVISceneClassificationTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (float)resourceRequirement;
- (int)run;
- (void)cancel;
- (void)configureRequest:(id)a3;
- (void)configureRequest:(id)a3 withRevision:(unint64_t)a4;
- (void)setPreferredMetalDevice:(id)a3;
@end

@implementation VCPMADVISceneClassificationTask

- (VCPMADVISceneClassificationTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VCPMADVISceneClassificationTask;
  v12 = [(VCPMADVISceneClassificationTask *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
    dispatch_queue_t v14 = dispatch_queue_create("VCPMADVISceneClassificationTask", 0);
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
  block[2] = __41__VCPMADVISceneClassificationTask_cancel__block_invoke;
  block[3] = &unk_1E6296FF8;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
}

void __41__VCPMADVISceneClassificationTask_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  if (WeakRetained) {
    [WeakRetained cancel];
  }
  id v2 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));

  if (v2) {
    [v2 cancel];
  }
  id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));

  if (v5) {
    [v5 cancel];
  }
  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));

  if (v3) {
    [v3 cancel];
  }
  id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));

  if (v6) {
    [v6 cancel];
  }
  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 48));
}

- (void)configureRequest:(id)a3
{
  id v4 = a3;
  [v4 setMetalContextPriority:0];
  if (DeviceHasANE())
  {
    id v3 = [MEMORY[0x1E4F458E8] defaultANEDevice];
    [v4 setProcessingDevice:v3];
  }
}

- (void)configureRequest:(id)a3 withRevision:(unint64_t)a4
{
  id v6 = a3;
  [v6 setRevision:a4];
  [(VCPMADVISceneClassificationTask *)self configureRequest:v6];
}

- (int)run
{
  v154[1] = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_canceled);
  if ((v2 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v4 = VCPLogInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "VCPMADVISceneClassificationTask running...", buf, 2u);
      }
    }
    v144 = 0;
    unsigned int v143 = 0;
    if ([(VCPMADServiceImageAsset *)self->_imageAsset loadPixelBuffer:&v144 orientation:&v143])
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        id v5 = VCPLogInstance();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEFAULT, "VCPMADVISceneClassificationTask image loading failed", buf, 2u);
        }
      }
      request = self->_request;
      v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v153 = *MEMORY[0x1E4F28568];
      id v8 = [NSString stringWithFormat:@"Image loading failed"];
      v154[0] = v8;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v154 forKeys:&v153 count:1];
      id v10 = [v7 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v9];
      [(MADVISceneClassificationRequest *)request setError:v10];
      int v11 = 0;
      goto LABEL_115;
    }
    id v9 = +[VCPMADVISceneClassificationResource sharedResource];
    v12 = +[VCPMADResourceManager sharedManager];
    v121 = [v12 activateResource:v9];

    v122 = [MEMORY[0x1E4F1CA48] array];
    id v13 = objc_alloc_init(MEMORY[0x1E4F45948]);
    v123 = v13;
    if (!v13)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v82 = VCPLogInstance();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
        {
          uint64_t v83 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          uint64_t v150 = v83;
          _os_log_impl(&dword_1BBEDA000, v82, OS_LOG_TYPE_ERROR, "Failed to create %@", buf, 0xCu);
        }
      }
      id v8 = 0;
      int v11 = -18;
      goto LABEL_114;
    }
    [(VCPMADVISceneClassificationTask *)self configureRequest:v13];
    objc_msgSend(v123, "setMaximumLeafObservations:", -[MADVISceneClassificationRequest maximumLeafObservations](self->_request, "maximumLeafObservations"));
    objc_msgSend(v123, "setMaximumHierarchicalObservations:", -[MADVISceneClassificationRequest maximumHierarchicalObservations](self->_request, "maximumHierarchicalObservations"));
    uint64_t v14 = [(MADVISceneClassificationRequest *)self->_request classificationRevision];
    id v142 = 0;
    char v15 = [v123 setRevision:v14 error:&v142];
    id v8 = (MTLDevice *)v142;
    if ((v15 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v84 = VCPLogInstance();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          uint64_t v85 = [(MADVISceneClassificationRequest *)self->_request classificationRevision];
          *(_DWORD *)buf = 134218242;
          uint64_t v150 = v85;
          __int16 v151 = 2112;
          v152 = v8;
          _os_log_impl(&dword_1BBEDA000, v84, OS_LOG_TYPE_ERROR, "Failed to set VNSceneClassificationRequest::setRevision %lu: %@", buf, 0x16u);
        }
      }
      v86 = self->_request;
      v87 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v147 = *MEMORY[0x1E4F28568];
      v88 = [NSString stringWithFormat:@"Failed to set VNSceneClassificationRequest::setRevision %lu: %@", -[MADVISceneClassificationRequest classificationRevision](v86, "classificationRevision"), v8];
      v148 = v88;
      v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v148 forKeys:&v147 count:1];
      v90 = [v87 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v89];
      [(MADVISceneClassificationRequest *)v86 setError:v90];

      int v11 = 0;
      goto LABEL_114;
    }
    [v122 addObject:v123];
    cancelQueue = self->_cancelQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__VCPMADVISceneClassificationTask_run__block_invoke;
    block[3] = &unk_1E62982E8;
    block[4] = self;
    id v17 = v123;
    id v141 = v17;
    dispatch_sync(cancelQueue, block);
    id v120 = objc_alloc_init(MEMORY[0x1E4F45988]);
    if (!v120)
    {
      int v91 = MediaAnalysisLogLevel();
      v92 = 0;
      if (v91 < 3)
      {
        int v11 = -18;
LABEL_113:

LABEL_114:
        id v10 = v121;
LABEL_115:

        CF<opaqueCMSampleBuffer *>::~CF(&v144);
        return v11;
      }
      v93 = VCPLogInstance();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      {
        uint64_t v94 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        uint64_t v150 = v94;
        _os_log_impl(&dword_1BBEDA000, v93, OS_LOG_TYPE_ERROR, "Failed to create %@", buf, 0xCu);
      }

      int v11 = -18;
LABEL_112:
      v92 = v120;
      goto LABEL_113;
    }
    v117 = v17;
    [(VCPMADVISceneClassificationTask *)self configureRequest:v120 withRevision:[(MADVISceneClassificationRequest *)self->_request nsfwRevision]];
    [v122 addObject:v120];
    int v18 = self->_cancelQueue;
    v138[0] = MEMORY[0x1E4F143A8];
    v138[1] = 3221225472;
    v138[2] = __38__VCPMADVISceneClassificationTask_run__block_invoke_249;
    v138[3] = &unk_1E62982E8;
    v138[4] = self;
    id v116 = v120;
    id v139 = v116;
    dispatch_sync(v18, v138);
    id v19 = objc_alloc_init(MEMORY[0x1E4F456A0]);
    if (!v19)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v95 = VCPLogInstance();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
        {
          uint64_t v96 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          uint64_t v150 = v96;
          _os_log_impl(&dword_1BBEDA000, v95, OS_LOG_TYPE_ERROR, "Failed to create %@", buf, 0xCu);
        }
      }
      int v11 = -18;
      goto LABEL_111;
    }
    id v118 = v19;
    [(VCPMADVISceneClassificationTask *)self configureRequest:v19];
    uint64_t v20 = [(MADVISceneClassificationRequest *)self->_request significantEventRevision];
    v137 = v8;
    char v21 = [v19 setRevision:v20 error:&v137];
    uint64_t v22 = v137;

    if ((v21 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v97 = VCPLogInstance();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        {
          uint64_t v98 = [(MADVISceneClassificationRequest *)self->_request significantEventRevision];
          *(_DWORD *)buf = 134218242;
          uint64_t v150 = v98;
          __int16 v151 = 2112;
          v152 = v22;
          _os_log_impl(&dword_1BBEDA000, v97, OS_LOG_TYPE_ERROR, "Failed to set VNClassifySignificantEventRequest::setRevision %lu: %@", buf, 0x16u);
        }
      }
      int v11 = -18;
      goto LABEL_110;
    }
    [v122 addObject:v19];
    v23 = self->_cancelQueue;
    v135[0] = MEMORY[0x1E4F143A8];
    v135[1] = 3221225472;
    v135[2] = __38__VCPMADVISceneClassificationTask_run__block_invoke_251;
    v135[3] = &unk_1E62982E8;
    v135[4] = self;
    id v114 = v19;
    id v136 = v114;
    dispatch_sync(v23, v135);
    id v24 = objc_alloc_init(MEMORY[0x1E4F45910]);
    if (!v24)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v99 = VCPLogInstance();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
        {
          uint64_t v100 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          uint64_t v150 = v100;
          _os_log_impl(&dword_1BBEDA000, v99, OS_LOG_TYPE_ERROR, "Failed to create %@", buf, 0xCu);
        }
      }
      int v11 = -18;
      goto LABEL_109;
    }
    id v115 = v24;
    [(VCPMADVISceneClassificationTask *)self configureRequest:v24];
    uint64_t v25 = [(MADVISceneClassificationRequest *)self->_request recognizeObjectsRevision];
    v134 = v22;
    char v26 = [v24 setRevision:v25 error:&v134];
    v27 = v134;

    if ((v26 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v11 = -18;
        uint64_t v22 = v27;
LABEL_109:

LABEL_110:
        id v8 = v22;
        id v19 = v118;
LABEL_111:

        goto LABEL_112;
      }
      v101 = VCPLogInstance();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
      {
        uint64_t v102 = [(MADVISceneClassificationRequest *)self->_request recognizeObjectsRevision];
        *(_DWORD *)buf = 134218242;
        uint64_t v150 = v102;
        __int16 v151 = 2112;
        v152 = v27;
        _os_log_impl(&dword_1BBEDA000, v101, OS_LOG_TYPE_ERROR, "Failed to set VNRecognizeObjectsRequest::setRevision %lu: %@", buf, 0x16u);
      }

      int v11 = -18;
LABEL_108:
      uint64_t v22 = v27;
      id v24 = v115;
      goto LABEL_109;
    }
    [v122 addObject:v24];
    v28 = self->_cancelQueue;
    v132[0] = MEMORY[0x1E4F143A8];
    v132[1] = 3221225472;
    v132[2] = __38__VCPMADVISceneClassificationTask_run__block_invoke_253;
    v132[3] = &unk_1E62982E8;
    v132[4] = self;
    id v29 = v24;
    id v133 = v29;
    dispatch_sync(v28, v132);
    id v30 = objc_alloc_init(MEMORY[0x1E4F45820]);
    v31 = v30;
    if (!v30)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v103 = VCPLogInstance();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
        {
          uint64_t v104 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          uint64_t v150 = v104;
          _os_log_impl(&dword_1BBEDA000, v103, OS_LOG_TYPE_ERROR, "Failed to create %@", buf, 0xCu);
        }
      }
      int v11 = -18;
      goto LABEL_107;
    }
    v111 = v29;
    v112 = v30;
    [(VCPMADVISceneClassificationTask *)self configureRequest:v30];
    uint64_t v32 = [(MADVISceneClassificationRequest *)self->_request saliencyRevision];
    v131 = v27;
    char v33 = [v31 setRevision:v32 error:&v131];
    v113 = v131;

    if ((v33 & 1) == 0)
    {
      v31 = v112;
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v11 = -18;
        v27 = v113;
LABEL_107:

        goto LABEL_108;
      }
      v105 = VCPLogInstance();
      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      {
        uint64_t v106 = [(MADVISceneClassificationRequest *)self->_request saliencyRevision];
        *(_DWORD *)buf = 134218242;
        uint64_t v150 = v106;
        __int16 v151 = 2112;
        v152 = v113;
        _os_log_impl(&dword_1BBEDA000, v105, OS_LOG_TYPE_ERROR, "Failed to set VNGenerateAttentionBasedSaliencyImageRequest::setRevision %lu: %@", buf, 0x16u);
      }

      int v11 = -18;
LABEL_106:
      v31 = v112;
      v27 = v113;
      goto LABEL_107;
    }
    [v122 addObject:v112];
    v34 = self->_cancelQueue;
    v129[0] = MEMORY[0x1E4F143A8];
    v129[1] = 3221225472;
    v129[2] = __38__VCPMADVISceneClassificationTask_run__block_invoke_255;
    v129[3] = &unk_1E62982E8;
    v129[4] = self;
    id v110 = v112;
    id v130 = v110;
    dispatch_sync(v34, v129);
    if (self->_preferredMetalDevice)
    {
      long long v127 = 0u;
      long long v128 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      id v35 = v122;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v125 objects:v146 count:16];
      if (v36)
      {
        uint64_t v37 = *(void *)v126;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v126 != v37) {
              objc_enumerationMutation(v35);
            }
            v39 = *(void **)(*((void *)&v125 + 1) + 8 * i);
            v40 = [MEMORY[0x1E4F458E8] deviceForMetalDevice:self->_preferredMetalDevice];
            [v39 setProcessingDevice:v40];

            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              v41 = VCPLogInstance();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
              {
                v42 = [v39 processingDevice];
                preferredMetalDevice = self->_preferredMetalDevice;
                *(_DWORD *)buf = 138412546;
                uint64_t v150 = (uint64_t)v42;
                __int16 v151 = 2112;
                v152 = preferredMetalDevice;
                _os_log_impl(&dword_1BBEDA000, v41, OS_LOG_TYPE_DEBUG, "[SceneClassification] Set VNProcessingDevice: %@ (%@)", buf, 0x16u);
              }
            }
          }
          uint64_t v36 = [v35 countByEnumeratingWithState:&v125 objects:v146 count:16];
        }
        while (v36);
      }
    }
    unsigned __int8 v44 = atomic_load((unsigned __int8 *)&self->_canceled);
    if (v44)
    {
      int v11 = -128;
LABEL_105:

      goto LABEL_106;
    }
    v45 = VCPSignPostLog();
    os_signpost_id_t v46 = os_signpost_id_generate(v45);

    v47 = VCPSignPostLog();
    v48 = v47;
    if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
    {
      signpostPayload = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      uint64_t v150 = (uint64_t)signpostPayload;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v48, OS_SIGNPOST_INTERVAL_BEGIN, v46, "VNImageRequestHandler_init", "%@", buf, 0xCu);
    }

    id v50 = objc_alloc(MEMORY[0x1E4F45890]);
    v51 = v144;
    uint64_t v52 = v143;
    v53 = [v9 session];
    v119 = (void *)[v50 initWithCVPixelBuffer:v51 orientation:v52 options:MEMORY[0x1E4F1CC08] session:v53];

    v54 = VCPSignPostLog();
    v55 = v54;
    if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
    {
      v56 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      uint64_t v150 = (uint64_t)v56;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v55, OS_SIGNPOST_INTERVAL_END, v46, "VNImageRequestHandler_init", "%@", buf, 0xCu);
    }

    v57 = VCPSignPostLog();
    os_signpost_id_t v58 = os_signpost_id_generate(v57);

    v59 = VCPSignPostLog();
    v60 = v59;
    if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
    {
      v61 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      uint64_t v150 = (uint64_t)v61;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v60, OS_SIGNPOST_INTERVAL_BEGIN, v58, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
    }

    v124 = v113;
    int v62 = [v119 performRequests:v122 error:&v124];
    v63 = v124;

    v113 = v63;
    v64 = VCPSignPostLog();
    v65 = v64;
    if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
    {
      v66 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      uint64_t v150 = (uint64_t)v66;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v65, OS_SIGNPOST_INTERVAL_END, v58, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
    }

    if (v62)
    {
      id v67 = objc_alloc_init(MEMORY[0x1E4F746F0]);
      v68 = [v117 results];
      [v67 setClassificationObservations:v68];

      v69 = [v116 results];
      [v67 setNSFWObservations:v69];

      v70 = [v114 results];
      [v67 setSignificantEventObservations:v70];

      v71 = [v111 results];
      [v67 setRecognizedObjectObservations:v71];

      v72 = [v110 results];
      [v67 setSaliencyObservations:v72];

      v73 = self->_request;
      id v145 = v67;
      v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v145 count:1];
      [(MADVISceneClassificationRequest *)v73 setResults:v74];

      uint64_t v75 = [v117 executionNanoseconds];
      uint64_t v76 = [v116 executionNanoseconds];
      uint64_t v77 = [v114 executionNanoseconds];
      uint64_t v78 = [v111 executionNanoseconds];
      uint64_t v79 = [v110 executionNanoseconds];
      v80 = [(MADVISceneClassificationRequest *)self->_request results];
      v81 = [v80 firstObject];
      [v81 setExecutionNanoseconds:v76 + v75 + v77 + v78 + v79];
    }
    else
    {
      unsigned __int8 v107 = atomic_load((unsigned __int8 *)&self->_canceled);
      if (v107)
      {
        int v11 = -128;
LABEL_104:

        goto LABEL_105;
      }
      [(MADVISceneClassificationRequest *)self->_request setError:v113];
    }
    [v121 reset];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v108 = VCPLogInstance();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v108, OS_LOG_TYPE_INFO, "VCPMADVISceneClassificationTask complete", buf, 2u);
      }
    }
    int v11 = 0;
    goto LABEL_104;
  }
  return -128;
}

id __38__VCPMADVISceneClassificationTask_run__block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

id __38__VCPMADVISceneClassificationTask_run__block_invoke_249(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
}

id __38__VCPMADVISceneClassificationTask_run__block_invoke_251(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 40));
}

id __38__VCPMADVISceneClassificationTask_run__block_invoke_253(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 40));
}

id __38__VCPMADVISceneClassificationTask_run__block_invoke_255(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 88), *(id *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakSaliencyRequest);
  objc_destroyWeak((id *)&self->_weakRecognizedObjectsRequest);
  objc_destroyWeak((id *)&self->_weakSignificantEventRequest);
  objc_destroyWeak((id *)&self->_weakNSFWRequest);
  objc_destroyWeak((id *)&self->_weakClassificationRequest);
  objc_storeStrong((id *)&self->_cancelQueue, 0);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_preferredMetalDevice, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end