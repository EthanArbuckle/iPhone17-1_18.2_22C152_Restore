@interface VCPMADVIFaceTask
+ (id)dependencies;
+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (BOOL)autoCancellable;
- (VCPMADVIFaceTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (float)resourceRequirement;
- (int)run;
- (void)cancel;
- (void)setPreferredMetalDevice:(id)a3;
@end

@implementation VCPMADVIFaceTask

- (VCPMADVIFaceTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VCPMADVIFaceTask;
  v12 = [(VCPMADVIFaceTask *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
    dispatch_queue_t v14 = dispatch_queue_create("VCPMADVIFaceTask", 0);
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
  block[2] = __26__VCPMADVIFaceTask_cancel__block_invoke;
  block[3] = &unk_1E6296FF8;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
}

void __26__VCPMADVIFaceTask_cancel__block_invoke(uint64_t a1)
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

- (int)run
{
  v193[1] = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_canceled);
  if ((v2 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v4 = VCPLogInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "VCPMADVIFaceTask running...", buf, 2u);
      }
    }
    v172 = 0;
    unsigned int v171 = 0;
    if ([(VCPMADServiceImageAsset *)self->_imageAsset loadPixelBuffer:&v172 orientation:&v171])
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        id v5 = VCPLogInstance();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEFAULT, "VCPMADVIFaceTask image loading failed", buf, 2u);
        }
      }
      request = self->_request;
      v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v192 = *MEMORY[0x1E4F28568];
      id v8 = [NSString stringWithFormat:@"Image loading failed"];
      v193[0] = v8;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v193 forKeys:&v192 count:1];
      id v10 = [v7 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v9];
      [(MADVIFaceRequest *)request setError:v10];
      int v11 = 0;
      goto LABEL_48;
    }
    id v9 = +[VCPMADVIFaceResource sharedResource];
    v12 = +[VCPMADResourceManager sharedManager];
    v147 = [v12 activateResource:v9];

    v13 = +[VCPDefaultPhotoLibraryManager sharedManager];
    v149 = [v13 defaultPhotoLibrary];

    +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:v149];
    v148 = id v170 = 0;
    LODWORD(v13) = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v170, objc_opt_class(), [v148 processingVersion]);
    id v14 = v170;
    v146 = v14;
    if (v13)
    {
      v15 = [NSString stringWithFormat:@"[VCPMADVIFaceTask] Failed to configuate VNDetectFaceRectanglesRequest"];
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v16 = VCPLogInstance();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v175 = v15;
          _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      objc_super v17 = self->_request;
      int v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v190 = *MEMORY[0x1E4F28568];
      id v19 = [NSString stringWithFormat:@"%@", v15];
      v191 = v19;
      __int16 v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v191 forKeys:&v190 count:1];
      v21 = [v18 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v20];
      [(MADVIFaceRequest *)v17 setError:v21];

      id v8 = 0;
      int v11 = 0;
      goto LABEL_47;
    }
    cancelQueue = self->_cancelQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __23__VCPMADVIFaceTask_run__block_invoke;
    block[3] = &unk_1E62982E8;
    block[4] = self;
    id v144 = v14;
    id v169 = v144;
    dispatch_sync(cancelQueue, block);
    v23 = VCPSignPostLog();
    os_signpost_id_t v24 = os_signpost_id_generate(v23);

    v25 = VCPSignPostLog();
    v26 = v25;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      signpostPayload = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v175 = signpostPayload;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "VCPMADVIFaceTask_VNImageRequestHandler_init", "%@", buf, 0xCu);
    }

    id v28 = objc_alloc(MEMORY[0x1E4F45890]);
    v29 = v172;
    uint64_t v30 = v171;
    v31 = [v9 session];
    v145 = (void *)[v28 initWithCVPixelBuffer:v29 orientation:v30 options:MEMORY[0x1E4F1CC08] session:v31];

    v32 = VCPSignPostLog();
    v33 = v32;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      v34 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v175 = v34;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v33, OS_SIGNPOST_INTERVAL_END, v24, "VCPMADVIFaceTask_VNImageRequestHandler_init", "%@", buf, 0xCu);
    }

    v35 = VCPSignPostLog();
    os_signpost_id_t v36 = os_signpost_id_generate(v35);

    v37 = VCPSignPostLog();
    v38 = v37;
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      v39 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v175 = v39;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "VCPMADVIFaceTask_detectFace", "%@", buf, 0xCu);
    }

    id v189 = v144;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v189 count:1];
    id v167 = 0;
    char v41 = [v145 performRequests:v40 error:&v167];
    id v8 = v167;

    if ((v41 & 1) == 0)
    {
      v143 = [NSString stringWithFormat:@"[≈] Failed to detect faces - %@", v8];
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v56 = VCPLogInstance();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v175 = v143;
          _os_log_impl(&dword_1BBEDA000, v56, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      v57 = self->_request;
      v58 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v187 = *MEMORY[0x1E4F28568];
      uint64_t v188 = [NSString stringWithFormat:@"%@", v143];
      id v142 = (id)v188;
      v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v188 forKeys:&v187 count:1];
      v60 = [v58 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v59];
      [(MADVIFaceRequest *)v57 setError:v60];

      goto LABEL_44;
    }
    v42 = VCPSignPostLog();
    v43 = v42;
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
    {
      v44 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v175 = v44;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v43, OS_SIGNPOST_INTERVAL_END, v36, "VCPMADVIFaceTask_detectFace", "%@", buf, 0xCu);
    }

    v45 = [v144 results];
    uint64_t v46 = [v45 count];

    if (!v46)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v62 = VCPLogInstance();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v62, OS_LOG_TYPE_DEBUG, "[VCPMADVIFaceTask] No face detected from CVPixelBuffer", buf, 2u);
        }
      }
      [(MADVIFaceRequest *)self->_request setResults:MEMORY[0x1E4F1CBF0]];
      int v11 = 0;
      goto LABEL_46;
    }
    v143 = [MEMORY[0x1E4F1CA48] array];
    id v166 = 0;
    int v47 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v166, objc_opt_class(), [v148 processingVersion]);
    id v48 = v166;
    id v142 = v48;
    if (v47)
    {
      v49 = [NSString stringWithFormat:@"[VCPMADVIFaceTask] Failed to configuate VNCreateFaceprintRequest"];
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v50 = VCPLogInstance();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v175 = v49;
          _os_log_impl(&dword_1BBEDA000, v50, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      v51 = self->_request;
      v52 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v185 = *MEMORY[0x1E4F28568];
      v53 = [NSString stringWithFormat:@"%@", v49];
      v186 = v53;
      v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v186 forKeys:&v185 count:1];
      v55 = [v52 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v54];
      [(MADVIFaceRequest *)v51 setError:v55];

LABEL_44:
      int v11 = 0;
LABEL_45:

LABEL_46:
LABEL_47:

      id v10 = v147;
LABEL_48:

      CF<opaqueCMSampleBuffer *>::~CF(&v172);
      return v11;
    }
    v63 = v48;
    v64 = [v144 results];
    [v63 setInputFaceObservations:v64];

    [(NSString *)v143 addObject:v142];
    v65 = self->_cancelQueue;
    v164[0] = MEMORY[0x1E4F143A8];
    v164[1] = 3221225472;
    v164[2] = __23__VCPMADVIFaceTask_run__block_invoke_264;
    v164[3] = &unk_1E62982E8;
    v164[4] = self;
    id v142 = v142;
    id v165 = v142;
    dispatch_sync(v65, v164);
    id v163 = 0;
    LODWORD(v65) = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v163, objc_opt_class(), [v148 processingVersion]);
    id v66 = v163;
    v140 = v66;
    if (v65)
    {
      v67 = [NSString stringWithFormat:@"[VCPMADVIFaceTask] Failed to configuate VNClassifyFaceAttributesRequest"];
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v68 = VCPLogInstance();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v175 = v67;
          _os_log_impl(&dword_1BBEDA000, v68, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      v69 = self->_request;
      v70 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v183 = *MEMORY[0x1E4F28568];
      v71 = [NSString stringWithFormat:@"%@", v67];
      v184 = v71;
      v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v184 forKeys:&v183 count:1];
      v73 = [v70 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v72];
      [(MADVIFaceRequest *)v69 setError:v73];

      int v11 = 0;
      goto LABEL_106;
    }
    v74 = v66;
    v75 = [v144 results];
    [v74 setInputFaceObservations:v75];

    [(NSString *)v143 addObject:v140];
    v76 = self->_cancelQueue;
    v161[0] = MEMORY[0x1E4F143A8];
    v161[1] = 3221225472;
    v161[2] = __23__VCPMADVIFaceTask_run__block_invoke_269;
    v161[3] = &unk_1E62982E8;
    v161[4] = self;
    id v138 = v140;
    id v162 = v138;
    dispatch_sync(v76, v161);
    id v160 = 0;
    LODWORD(v76) = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v160, objc_opt_class(), [v148 processingVersion]);
    id v77 = v160;
    v139 = v77;
    if (v76)
    {
      v78 = [NSString stringWithFormat:@"[VCPMADVIFaceTask] Failed to configuate VNDetectFaceExpressionsRequest"];
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v79 = VCPLogInstance();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v175 = v78;
          _os_log_impl(&dword_1BBEDA000, v79, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      v80 = self->_request;
      v81 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v181 = *MEMORY[0x1E4F28568];
      v82 = [NSString stringWithFormat:@"%@", v78];
      v182 = v82;
      v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v182 forKeys:&v181 count:1];
      v84 = [v81 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v83];
      [(MADVIFaceRequest *)v80 setError:v84];

      int v11 = 0;
      goto LABEL_105;
    }
    v85 = v77;
    v86 = [v144 results];
    [v85 setInputFaceObservations:v86];

    [(NSString *)v143 addObject:v139];
    v87 = self->_cancelQueue;
    v158[0] = MEMORY[0x1E4F143A8];
    v158[1] = 3221225472;
    v158[2] = __23__VCPMADVIFaceTask_run__block_invoke_274;
    v158[3] = &unk_1E62982E8;
    v158[4] = self;
    id v136 = v139;
    id v159 = v136;
    dispatch_sync(v87, v158);
    id v157 = 0;
    LODWORD(v87) = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v157, objc_opt_class(), [v148 processingVersion]);
    id v88 = v157;
    v137 = v88;
    if (v87)
    {
      v89 = [NSString stringWithFormat:@"[VCPMADVIFaceTask] Failed to configuate VNDetectFaceLandmarksRequest"];
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v90 = VCPLogInstance();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v175 = v89;
          _os_log_impl(&dword_1BBEDA000, v90, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      v91 = self->_request;
      v92 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v179 = *MEMORY[0x1E4F28568];
      v93 = [NSString stringWithFormat:@"%@", v89];
      v180 = v93;
      v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v180 forKeys:&v179 count:1];
      v95 = [v92 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v94];
      [(MADVIFaceRequest *)v91 setError:v95];

      int v11 = 0;
      goto LABEL_104;
    }
    v96 = v88;
    v97 = [v144 results];
    [v96 setInputFaceObservations:v97];

    [(NSString *)v143 addObject:v137];
    v98 = self->_cancelQueue;
    v155[0] = MEMORY[0x1E4F143A8];
    v155[1] = 3221225472;
    v155[2] = __23__VCPMADVIFaceTask_run__block_invoke_279;
    v155[3] = &unk_1E62982E8;
    v155[4] = self;
    id v135 = v137;
    id v156 = v135;
    dispatch_sync(v98, v155);
    if (self->_preferredMetalDevice)
    {
      long long v153 = 0u;
      long long v154 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      obj = v143;
      uint64_t v99 = [(NSString *)obj countByEnumeratingWithState:&v151 objects:v178 count:16];
      if (v99)
      {
        uint64_t v100 = *(void *)v152;
        do
        {
          for (uint64_t i = 0; i != v99; ++i)
          {
            if (*(void *)v152 != v100) {
              objc_enumerationMutation(obj);
            }
            v102 = *(void **)(*((void *)&v151 + 1) + 8 * i);
            v103 = [MEMORY[0x1E4F458E8] deviceForMetalDevice:self->_preferredMetalDevice];
            [v102 setProcessingDevice:v103];

            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              v104 = VCPLogInstance();
              if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
              {
                v105 = [v102 processingDevice];
                preferredMetalDevice = self->_preferredMetalDevice;
                *(_DWORD *)buf = 138412546;
                v175 = v105;
                __int16 v176 = 2112;
                v177 = preferredMetalDevice;
                _os_log_impl(&dword_1BBEDA000, v104, OS_LOG_TYPE_DEBUG, "[VCPMADVIFaceTask] Set VNProcessingDevice: %@ (%@)", buf, 0x16u);
              }
            }
          }
          uint64_t v99 = [(NSString *)obj countByEnumeratingWithState:&v151 objects:v178 count:16];
        }
        while (v99);
      }
    }
    unsigned __int8 v107 = atomic_load((unsigned __int8 *)&self->_canceled);
    if ((v107 & 1) == 0)
    {
      v108 = VCPSignPostLog();
      os_signpost_id_t v109 = os_signpost_id_generate(v108);

      v110 = VCPSignPostLog();
      v111 = v110;
      if (v109 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v110))
      {
        v112 = self->_signpostPayload;
        *(_DWORD *)buf = 138412290;
        v175 = v112;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v111, OS_SIGNPOST_INTERVAL_BEGIN, v109, "VCPMADVIFaceTask_additionalFaceRequests", "%@", buf, 0xCu);
      }

      id v150 = v8;
      int v113 = [v145 performRequests:v143 error:&v150];
      id v114 = v150;

      id v8 = v114;
      v115 = VCPSignPostLog();
      v116 = v115;
      if (v109 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v115))
      {
        v117 = self->_signpostPayload;
        *(_DWORD *)buf = 138412290;
        v175 = v117;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v116, OS_SIGNPOST_INTERVAL_END, v109, "VCPMADVIFaceTask_additionalFaceRequests", "%@", buf, 0xCu);
      }

      if (v113)
      {
        id v118 = objc_alloc_init(MEMORY[0x1E4F746C0]);
        v119 = [v144 results];
        [v118 setFaceRectanglesObservations:v119];

        v120 = [v142 results];
        [v118 setFaceprintObservations:v120];

        v121 = [v138 results];
        [v118 setFaceAttributesObservations:v121];

        v122 = [v136 results];
        [v118 setFaceExpressionsObservations:v122];

        v123 = [v135 results];
        [v118 setFaceLandmarksObservations:v123];

        v124 = self->_request;
        id v173 = v118;
        v125 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v173 count:1];
        [(MADVIFaceRequest *)v124 setResults:v125];

        uint64_t v126 = [v144 executionNanoseconds];
        uint64_t v127 = [v142 executionNanoseconds];
        uint64_t v128 = [v138 executionNanoseconds];
        uint64_t v129 = [v136 executionNanoseconds];
        uint64_t v130 = [v135 executionNanoseconds];
        v131 = [(MADVIFaceRequest *)self->_request results];
        v132 = [v131 firstObject];
        [v132 setExecutionNanoseconds:v127 + v126 + v128 + v129 + v130];

LABEL_97:
        [v147 reset];
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v134 = VCPLogInstance();
          if (os_log_type_enabled(v134, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v134, OS_LOG_TYPE_INFO, "VCPMADVIFaceTask complete", buf, 2u);
          }
        }
        int v11 = 0;
        goto LABEL_103;
      }
      unsigned __int8 v133 = atomic_load((unsigned __int8 *)&self->_canceled);
      if ((v133 & 1) == 0)
      {
        [(MADVIFaceRequest *)self->_request setError:v8];
        goto LABEL_97;
      }
    }
    int v11 = -128;
LABEL_103:

LABEL_104:
LABEL_105:

LABEL_106:
    goto LABEL_45;
  }
  return -128;
}

id __23__VCPMADVIFaceTask_run__block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

id __23__VCPMADVIFaceTask_run__block_invoke_264(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
}

id __23__VCPMADVIFaceTask_run__block_invoke_269(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 40));
}

id __23__VCPMADVIFaceTask_run__block_invoke_274(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 40));
}

id __23__VCPMADVIFaceTask_run__block_invoke_279(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 88), *(id *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakFaceLandmarksRequest);
  objc_destroyWeak((id *)&self->_weakFaceExpressionsRequest);
  objc_destroyWeak((id *)&self->_weakFaceAttributesRequest);
  objc_destroyWeak((id *)&self->_weakFaceprintRequest);
  objc_destroyWeak((id *)&self->_weakFaceRectanglesRequest);
  objc_storeStrong((id *)&self->_cancelQueue, 0);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_preferredMetalDevice, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end