@interface MADServiceVideoProcessingTask
+ (id)taskWithRequests:(id)a3 forAsset:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 resultHandler:(id)a7 andCompletionHandler:(id)a8;
- (BOOL)cachesResources;
- (BOOL)run:(id *)a3;
- (MADServiceVideoProcessingTask)initWithRequests:(id)a3 forAsset:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 resultHandler:(id)a7 andCompletionHandler:(id)a8;
- (NSString)signpostPayload;
- (void)setSignpostPayload:(id)a3;
@end

@implementation MADServiceVideoProcessingTask

- (MADServiceVideoProcessingTask)initWithRequests:(id)a3 forAsset:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 resultHandler:(id)a7 andCompletionHandler:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __122__MADServiceVideoProcessingTask_initWithRequests_forAsset_cancelBlock_progressHandler_resultHandler_andCompletionHandler___block_invoke;
  v32[3] = &unk_1E6298188;
  id v21 = v20;
  id v33 = v21;
  v31.receiver = self;
  v31.super_class = (Class)MADServiceVideoProcessingTask;
  v22 = [(VCPMABaseTask *)&v31 initWithCompletionHandler:v32];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_requests, a3);
    objc_storeStrong((id *)&v23->_asset, a4);
    v24 = _Block_copy(v18);
    id progressHandler = v23->_progressHandler;
    v23->_id progressHandler = v24;

    v26 = _Block_copy(v19);
    id resultHandler = v23->_resultHandler;
    v23->_id resultHandler = v26;

    v28 = _Block_copy(v21);
    id completionHandler = v23->_completionHandler;
    v23->_id completionHandler = v28;

    [(VCPMABaseTask *)v23 setCancelBlock:v17];
  }

  return v23;
}

uint64_t __122__MADServiceVideoProcessingTask_initWithRequests_forAsset_cancelBlock_progressHandler_resultHandler_andCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)taskWithRequests:(id)a3 forAsset:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 resultHandler:(id)a7 andCompletionHandler:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRequests:v18 forAsset:v17 cancelBlock:v16 progressHandler:v15 resultHandler:v14 andCompletionHandler:v13];

  return v19;
}

- (BOOL)cachesResources
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_requests;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isMemberOfClass:", objc_opt_class(), (void)v10) & 1) == 0
          && ![v7 isMemberOfClass:objc_opt_class()])
        {
          BOOL v8 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_12:

  return v8;
}

- (BOOL)run:(id *)a3
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  v109 = [MEMORY[0x1E4F1CA48] array];
  v114 = [MEMORY[0x1E4F1CA48] array];
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  uint64_t v3 = self->_requests;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v151 objects:v163 count:16];
  if (v4)
  {
    long long v115 = 0uLL;
    uint64_t v5 = *(void *)v152;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v152 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v151 + 1) + 8 * i);
        if (*((void *)&v115 + 1) || ![v7 isMemberOfClass:objc_opt_class()])
        {
          if ((void)v115 || ![v7 isMemberOfClass:objc_opt_class()])
          {
            if (+[MADServiceVideoProcessingSubtask taskClassForRequest:v7])
            {
              [v114 addObject:v7];
            }
            else
            {
              [v109 addObject:v7];
            }
          }
          else
          {
            *(void *)&long long v115 = v7;
          }
        }
        else
        {
          *((void *)&v115 + 1) = v7;
        }
      }
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v151 objects:v163 count:16];
    }
    while (v4);
  }
  else
  {
    long long v115 = 0uLL;
  }

  uint64_t v145 = 0;
  v146 = &v145;
  uint64_t v147 = 0x3032000000;
  v148 = __Block_byref_object_copy__61;
  v149 = __Block_byref_object_dispose__61;
  id v150 = [MEMORY[0x1E4F1CA60] dictionary];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__MADServiceVideoProcessingTask_run___block_invoke;
  aBlock[3] = &unk_1E629CEC0;
  aBlock[4] = self;
  aBlock[5] = &v145;
  v110 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  BOOL v8 = self;
  if ([v109 count])
  {
    v9 = [VCPVideoProcessor alloc];
    long long v10 = [(MADServiceVideoAsset *)self->_asset url];
    context = [(VCPVideoProcessor *)v9 initWithURL:v10];

    if (self->_progressHandler)
    {
      v142[0] = MEMORY[0x1E4F143A8];
      v142[1] = 3221225472;
      v142[2] = __37__MADServiceVideoProcessingTask_run___block_invoke_199;
      v142[3] = &unk_1E629CEE8;
      v142[4] = self;
      id v143 = v109;
      [(VCPVideoProcessor *)context setProgressHandler:v142];
    }
    long long v11 = [MEMORY[0x1E4F1CA48] array];
    long long v140 = 0u;
    long long v141 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    id v12 = v109;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v138 objects:v162 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v139;
      uint64_t v106 = 138412290;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v139 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v138 + 1) + 8 * j);
          id v17 = +[MADServiceVideoTask taskForRequest:v16];
          id v18 = v17;
          if (v17)
          {
            [v17 configureVideoProcessor:context];
            [v11 addObject:v18];
          }
          else if ((int)MediaAnalysisLogLevel() >= 3)
          {
            id v19 = VCPLogInstance();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v16;
              _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "Failed to create task for request (%@)", buf, 0xCu);
            }
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v138 objects:v162 count:16];
      }
      while (v13);
    }

    id v20 = VCPSignPostLog();
    os_signpost_id_t v21 = os_signpost_id_generate(v20);

    v22 = VCPSignPostLog();
    v23 = v22;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      signpostPayload = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = signpostPayload;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "VCPVideoProcessor_Analyze", "%@", buf, 0xCu);
    }

    id v137 = 0;
    *(_OWORD *)buf = *MEMORY[0x1E4F1FA48];
    uint64_t v161 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    long long v135 = *MEMORY[0x1E4F1FA10];
    uint64_t v136 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
    BOOL v25 = [(VCPVideoProcessor *)context analyzeWithStart:buf andDuration:&v135 error:&v137];
    id v26 = v137;
    if (!v25)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v41 = VCPLogInstance();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = [v26 description];
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v42;
          _os_log_impl(&dword_1BBEDA000, v41, OS_LOG_TYPE_ERROR, "Failed to process video (%@)", buf, 0xCu);
        }
      }
      if (a3)
      {
        v43 = (void *)[v26 copy];
        id v44 = *a3;
        *a3 = v43;
      }
      BOOL v45 = 0;
      goto LABEL_118;
    }
    v27 = VCPSignPostLog();
    v28 = v27;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      v29 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v29;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v28, OS_SIGNPOST_INTERVAL_END, v21, "VCPVideoProcessor_Analyze", "%@", buf, 0xCu);
    }

    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    id v30 = v11;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v131 objects:v159 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v132;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v132 != v32) {
            objc_enumerationMutation(v30);
          }
          v34 = *(void **)(*((void *)&v131 + 1) + 8 * k);
          v35 = [v34 finalize];
          v36 = [v34 request];
          v110[2](v110, v36, v35);
        }
        uint64_t v31 = [v30 countByEnumeratingWithState:&v131 objects:v159 count:16];
      }
      while (v31);
    }

    BOOL v8 = self;
  }
  if (v115 != 0)
  {
    contexta = (void *)MEMORY[0x1C186D320]();
    id progressHandler = self->_progressHandler;
    if (progressHandler)
    {
      if ((void)v115) {
        BOOL v38 = *((void *)&v115 + 1) == 0;
      }
      else {
        BOOL v38 = 1;
      }
      if (v38) {
        uint64_t v39 = 1;
      }
      else {
        uint64_t v39 = 2;
      }
      v40 = v129;
      v129[0] = MEMORY[0x1E4F143A8];
      v129[1] = 3221225472;
      v129[2] = __37__MADServiceVideoProcessingTask_run___block_invoke_203;
      v129[3] = &unk_1E629CF10;
      v129[4] = self;
      uint64_t v106 = (uint64_t)v130;
      v130[0] = v109;
      v130[1] = v39;
    }
    else
    {
      v40 = 0;
    }
    v46 = _Block_copy(v40);
    v125[0] = MEMORY[0x1E4F143A8];
    v125[1] = 3221225472;
    v125[2] = __37__MADServiceVideoProcessingTask_run___block_invoke_2;
    v125[3] = &unk_1E629CF38;
    id v47 = *((id *)&v115 + 1);
    id v126 = v47;
    v48 = v110;
    v128 = v48;
    id v49 = (id)v115;
    id v127 = v49;
    v50 = _Block_copy(v125);
    asset = self->_asset;
    v124[0] = MEMORY[0x1E4F143A8];
    v124[1] = 3221225472;
    v124[2] = __37__MADServiceVideoProcessingTask_run___block_invoke_3;
    v124[3] = &unk_1E629CF60;
    v124[4] = self;
    v52 = +[MADVideoRemoveBackgroundCropTask taskWithAsset:asset previewRequest:v47 generationRequest:v49 cancelBlock:v124 progressHandler:v46 resultHandler:v48 completionHandler:v50];
    [v52 setSignpostPayload:self->_signpostPayload];
    v53 = VCPSignPostLog();
    os_signpost_id_t v54 = os_signpost_id_generate(v53);

    v55 = VCPSignPostLog();
    v56 = v55;
    if (v54 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
    {
      v57 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v57;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v56, OS_SIGNPOST_INTERVAL_BEGIN, v54, "MADServiceVideoProcessingSubtask_Run", "%@", buf, 0xCu);
    }

    if ([v52 run] && (int)MediaAnalysisLogLevel() >= 3)
    {
      v58 = VCPLogInstance();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        v59 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v59;
        id v60 = v59;
        _os_log_impl(&dword_1BBEDA000, v58, OS_LOG_TYPE_ERROR, "Failed to perform subtask %@", buf, 0xCu);
      }
    }
    v61 = VCPSignPostLog();
    v62 = v61;
    if (v54 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
    {
      v63 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v63;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v62, OS_SIGNPOST_INTERVAL_END, v54, "MADServiceVideoProcessingSubtask_Run", "%@", buf, 0xCu);
    }

    if (progressHandler) {
    BOOL v8 = self;
    }
  }
  unint64_t v64 = 0;
  uint64_t v103 = *MEMORY[0x1E4F28760];
  uint64_t v104 = *MEMORY[0x1E4F28568];
  while (v64 < [v114 count])
  {
    v107 = (void *)MEMORY[0x1C186D320]();
    id v65 = self->_progressHandler;
    if (v65)
    {
      v66 = v121;
      v121[0] = MEMORY[0x1E4F143A8];
      v121[1] = 3221225472;
      v121[2] = __37__MADServiceVideoProcessingTask_run___block_invoke_208;
      v121[3] = &unk_1E629CF10;
      v121[4] = self;
      id v122 = v109;
      unint64_t v123 = v64;
    }
    else
    {
      v66 = 0;
    }
    contextb = _Block_copy(v66);
    v117[0] = MEMORY[0x1E4F143A8];
    v117[1] = 3221225472;
    v117[2] = __37__MADServiceVideoProcessingTask_run___block_invoke_2_209;
    v117[3] = &unk_1E629CF88;
    v119 = v110;
    id v67 = v114;
    id v118 = v67;
    unint64_t v120 = v64;
    v68 = _Block_copy(v117);
    v69 = [v67 objectAtIndexedSubscript:v64];
    v70 = self->_asset;
    v116[0] = MEMORY[0x1E4F143A8];
    v116[1] = 3221225472;
    v116[2] = __37__MADServiceVideoProcessingTask_run___block_invoke_3_211;
    v116[3] = &unk_1E629CF60;
    v116[4] = self;
    v71 = +[MADServiceVideoProcessingSubtask taskWithRequest:v69 forAsset:v70 cancelBlock:v116 progressHandler:contextb andCompletionHandler:v68];

    if (v71)
    {
      [v71 setSignpostPayload:self->_signpostPayload];
      v72 = VCPSignPostLog();
      os_signpost_id_t v73 = os_signpost_id_generate(v72);

      v74 = VCPSignPostLog();
      v75 = v74;
      if (v73 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
      {
        v76 = self->_signpostPayload;
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v76;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v75, OS_SIGNPOST_INTERVAL_BEGIN, v73, "MADServiceVideoProcessingSubtask_Run", "%@", buf, 0xCu);
      }

      if ([v71 run] && (int)MediaAnalysisLogLevel() >= 3)
      {
        v77 = VCPLogInstance();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          v78 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v78;
          id v79 = v78;
          _os_log_impl(&dword_1BBEDA000, v77, OS_LOG_TYPE_ERROR, "Failed to perform subtask %@", buf, 0xCu);
        }
      }
      v80 = VCPSignPostLog();
      v81 = v80;
      if (v73 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v80))
      {
        v82 = self->_signpostPayload;
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v82;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v81, OS_SIGNPOST_INTERVAL_END, v73, "MADServiceVideoProcessingSubtask_Run", "%@", buf, 0xCu);
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v83 = VCPLogInstance();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        {
          v84 = [v67 objectAtIndexedSubscript:v64];
          v85 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v85;
          id v86 = v85;
          _os_log_impl(&dword_1BBEDA000, v83, OS_LOG_TYPE_ERROR, "Unable to create subtask for unrecognized request %@", buf, 0xCu);
        }
      }
      if (!a3) {
        goto LABEL_105;
      }
      v87 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v157 = v104;
      v88 = NSString;
      v81 = [v67 objectAtIndexedSubscript:v64];
      v89 = [v88 stringWithFormat:@"Unable to create subtask for unrecognized request %@", objc_opt_class()];
      v158 = v89;
      v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v158 forKeys:&v157 count:1];
      v91 = [v87 errorWithDomain:v103 code:-50 userInfo:v90];
      id v92 = *a3;
      *a3 = v91;
    }
LABEL_105:

    if (v65) {
    BOOL v8 = self;
    }
    ++v64;
    if (!v71)
    {
      BOOL v45 = 0;
      goto LABEL_119;
    }
  }
  if (!v8->_resultHandler)
  {
    context = [MEMORY[0x1E4F1CA48] array];
    for (unint64_t m = 0; m < [(NSArray *)self->_requests count]; ++m)
    {
      v94 = (void *)v146[5];
      v95 = [NSNumber numberWithUnsignedInteger:m];
      v96 = [v94 objectForKeyedSubscript:v95];

      if (v96)
      {
        [(VCPVideoProcessor *)context addObject:v96];
      }
      else
      {
        id v97 = objc_alloc_init(MEMORY[0x1E4F74788]);
        v98 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v155 = v104;
        v99 = [NSString stringWithFormat:@"Request produced no payload"];
        v156 = v99;
        v100 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v156 forKeys:&v155 count:1];
        v101 = [v98 errorWithDomain:v103 code:-18 userInfo:v100];
        [v97 setError:v101];

        [(VCPVideoProcessor *)context addObject:v97];
      }
    }
    (*((void (**)(void))self->_completionHandler + 2))();
    BOOL v45 = 1;
LABEL_118:

    goto LABEL_119;
  }
  (*((void (**)(void))v8->_completionHandler + 2))();
  BOOL v45 = 1;
LABEL_119:

  _Block_object_dispose(&v145, 8);
  return v45;
}

void __37__MADServiceVideoProcessingTask_run___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 32) indexOfObject:v5];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      BOOL v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v19 = 67109120;
        LODWORD(v20) = -1;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "Failed to find request at index %d to update increment result", (uint8_t *)&v19, 8u);
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v9 = v7;
    long long v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    long long v11 = [NSNumber numberWithUnsignedInteger:v7];
    id v12 = [v10 objectForKeyedSubscript:v11];

    if (v12)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        uint64_t v13 = VCPLogInstance();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138412546;
          uint64_t v20 = objc_opt_class();
          __int16 v21 = 1024;
          int v22 = v9;
          _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEFAULT, "Request %@ (index %d) already has result, skip updating", (uint8_t *)&v19, 0x12u);
        }
      }
    }
    else
    {
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 56);
      if (!v14)
      {
        id v18 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        BOOL v8 = [NSNumber numberWithUnsignedInteger:v9];
        [v18 setObject:v6 forKeyedSubscript:v8];
LABEL_13:

        goto LABEL_14;
      }
      (*(void (**)(uint64_t, id, uint64_t))(v14 + 16))(v14, v6, v9);
      id v15 = objc_alloc_init(MEMORY[0x1E4F74788]);
      uint64_t v16 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      id v17 = [NSNumber numberWithUnsignedInteger:v9];
      [v16 setObject:v15 forKeyedSubscript:v17];
    }
  }
LABEL_14:
}

uint64_t __37__MADServiceVideoProcessingTask_run___block_invoke_199(uint64_t a1, double a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 48);
  unint64_t v5 = [*(id *)(a1 + 40) count];
  v6.n128_f64[0] = (double)(100 * (v5 / [*(id *)(*(void *)(a1 + 32) + 32) count])) * a2;
  uint64_t v7 = *(uint64_t (**)(uint64_t, __n128))(v4 + 16);
  return v7(v4, v6);
}

uint64_t __37__MADServiceVideoProcessingTask_run___block_invoke_203(uint64_t a1, double a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 48);
  double v4 = (double)(unint64_t)[*(id *)(a1 + 40) count] + (double)*(unint64_t *)(a1 + 48) * a2;
  v5.n128_f64[0] = v4 / (double)(unint64_t)[*(id *)(*(void *)(a1 + 32) + 32) count] * 100.0;
  __n128 v6 = *(uint64_t (**)(uint64_t, __n128))(v3 + 16);
  return v6(v3, v5);
}

void __37__MADServiceVideoProcessingTask_run___block_invoke_2(void *a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = (objc_class *)MEMORY[0x1E4F74788];
    id v4 = a2;
    id v5 = objc_alloc_init(v3);
    [v5 setError:v4];

    if (a1[4]) {
      (*(void (**)(void))(a1[6] + 16))();
    }
    if (a1[5]) {
      (*(void (**)(void))(a1[6] + 16))();
    }
  }
}

uint64_t __37__MADServiceVideoProcessingTask_run___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) isCanceled];
}

uint64_t __37__MADServiceVideoProcessingTask_run___block_invoke_208(uint64_t a1, double a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 48);
  double v4 = (double)(unint64_t)(*(void *)(a1 + 48) + [*(id *)(a1 + 40) count]) + a2;
  v5.n128_f64[0] = v4 / (double)(unint64_t)[*(id *)(*(void *)(a1 + 32) + 32) count] * 100.0;
  __n128 v6 = *(uint64_t (**)(uint64_t, __n128))(v3 + 16);
  return v6(v3, v5);
}

void __37__MADServiceVideoProcessingTask_run___block_invoke_2_209(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v4 = a1[6];
  id v5 = a2;
  id v6 = [v3 objectAtIndexedSubscript:v4];
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v6, v5);
}

uint64_t __37__MADServiceVideoProcessingTask_run___block_invoke_3_211(uint64_t a1)
{
  return [*(id *)(a1 + 32) isCanceled];
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
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end