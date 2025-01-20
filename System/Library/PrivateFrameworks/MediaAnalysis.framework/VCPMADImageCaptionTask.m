@interface VCPMADImageCaptionTask
+ (id)dependencies;
+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (BOOL)autoCancellable;
- (VCPMADImageCaptionTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (float)resourceRequirement;
- (int)run;
- (void)cancel;
@end

@implementation VCPMADImageCaptionTask

- (VCPMADImageCaptionTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)VCPMADImageCaptionTask;
  v12 = [(VCPMADImageCaptionTask *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
    imageCaptionModel = v13->_imageCaptionModel;
    v13->_imageCaptionModel = 0;
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
        objc_super v16 = NSStringFromClass(v15);
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
}

- (int)run
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_INFO, "VCPMADImageCaptionTask running...", buf, 2u);
    }
  }
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_canceled);
  if (v4) {
    return -128;
  }
  uint64_t v5 = [(MADImageCaptionRequest *)self->_request modelType];
  uint64_t v6 = [(MADImageCaptionRequest *)self->_request safetyType];
  v7 = VCPSignPostLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = VCPSignPostLog();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    signpostPayload = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    v83 = signpostPayload;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "VCPMADImageCaptionTask_modelPrepare", "%@", buf, 0xCu);
  }

  v12 = +[VCPMADImageCaptionResource sharedResourceForModelType:v5 safetyType:v6];
  v13 = +[VCPMADResourceManager sharedManager];
  id v14 = [v13 activateResource:v12];

  v15 = [v12 imageCaptionAnalyzer];
  LODWORD(v13) = v15 == 0;

  if (v13)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v26 = VCPLogInstance();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_DEFAULT, "VCPImageCaptionAnalyzer init fail", buf, 2u);
      }
    }
    request = self->_request;
    v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v80 = *MEMORY[0x1E4F28568];
    v29 = [NSString stringWithFormat:@"VCPImageCaptionAnalyzer init fail"];
    v81 = v29;
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
    v31 = [v28 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v30];
    [(MADImageCaptionRequest *)request setError:v31];

    [v14 reset];
  }
  else
  {
    objc_super v16 = VCPSignPostLog();
    v17 = v16;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      int v18 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v83 = v18;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v17, OS_SIGNPOST_INTERVAL_END, v8, "VCPMADImageCaptionTask_modelPrepare", "%@", buf, 0xCu);
    }

    v74 = 0;
    int v73 = 0;
    if ([(VCPMADServiceImageAsset *)self->_imageAsset loadPixelBuffer:&v74 orientation:&v73])
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        id v19 = VCPLogInstance();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEFAULT, "VCPMADImageCaptionTask image loading failed", buf, 2u);
        }
      }
      __int16 v20 = self->_request;
      v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v78 = *MEMORY[0x1E4F28568];
      uint64_t v22 = [NSString stringWithFormat:@"Image loading failed"];
      v79 = v22;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
      v24 = [v21 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v23];
      [(MADImageCaptionRequest *)v20 setError:v24];

      [v14 reset];
    }
    else
    {
      v32 = VCPSignPostLog();
      os_signpost_id_t v33 = os_signpost_id_generate(v32);

      v34 = VCPSignPostLog();
      v35 = v34;
      if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
      {
        v36 = self->_signpostPayload;
        *(_DWORD *)buf = 138412290;
        v83 = v36;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "VCPMADImageCaptionTask_requestCaption", "%@", buf, 0xCu);
      }

      v37 = [v12 imageCaptionAnalyzer];
      v71[4] = self;
      id v72 = 0;
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __29__VCPMADImageCaptionTask_run__block_invoke;
      v71[3] = &unk_1E6297060;
      int v38 = [v37 analyzePixelBuffer:v74 flags:0 results:&v72 cancel:v71];
      id v39 = v72;

      if (v38)
      {
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v40 = VCPLogInstance();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v40, OS_LOG_TYPE_DEFAULT, "VCPMADImageCaptionTask image caption analysis failed", buf, 2u);
          }
        }
        v41 = self->_request;
        v42 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v76 = *MEMORY[0x1E4F28568];
        v43 = [NSString stringWithFormat:@"VCPMADImageCaptionTask image caption analysis failed"];
        v77 = v43;
        v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
        v45 = [v42 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v44];
        [(MADImageCaptionRequest *)v41 setError:v45];

        [v14 reset];
      }
      else
      {
        v46 = VCPSignPostLog();
        v47 = v46;
        if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
        {
          v48 = self->_signpostPayload;
          *(_DWORD *)buf = 138412290;
          v83 = v48;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v47, OS_SIGNPOST_INTERVAL_END, v33, "VCPMADImageCaptionTask_requestCaption", "%@", buf, 0xCu);
        }

        v49 = MediaAnalysisImageCaptionResultsKey;
        if ((unint64_t)(v5 - 1) >= 2) {
          v49 = MediaAnalysisMiCaImageCaptionResultsKey;
        }
        v50 = [v39 objectForKeyedSubscript:*v49];
        if ([v50 count])
        {
          v51 = [v50 objectAtIndexedSubscript:0];
          v52 = [v51 objectForKeyedSubscript:@"attributes"];
          BOOL v53 = v52 == 0;

          if (!v53)
          {
            v54 = [v50 objectAtIndexedSubscript:0];
            v55 = [v54 objectForKeyedSubscript:@"attributes"];

            v68 = [v55 objectForKeyedSubscript:@"imageCaptionText"];
            v70 = [v55 objectForKeyedSubscript:@"imageCaptionConfidence"];
            v69 = [v55 objectForKeyedSubscript:@"imageCaptionUnsafeContent"];
            v56 = [v55 objectForKeyedSubscript:@"imageCaptionLowConfidence"];
            v57 = [v55 objectForKeyedSubscript:@"classificationIdentifiers"];
            id v58 = objc_alloc(MEMORY[0x1E4F745B0]);
            [v70 floatValue];
            int v60 = v59;
            uint64_t v61 = [v69 BOOLValue];
            uint64_t v62 = [v56 BOOLValue];
            LODWORD(v63) = v60;
            v64 = (void *)[v58 initWithCaption:v68 score:v61 containsUnsafeContent:v62 isLowConfidence:v57 classificationIdentifiers:v63];
            v65 = self->_request;
            v75 = v64;
            v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
            [(MADImageCaptionRequest *)v65 setResults:v66];
          }
        }
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v67 = VCPLogInstance();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v67, OS_LOG_TYPE_INFO, "VCPMADImageCaptionTask complete", buf, 2u);
          }
        }
        [v14 reset];
      }
    }
    CF<opaqueCMSampleBuffer *>::~CF(&v74);
  }

  return 0;
}

uint64_t __29__VCPMADImageCaptionTask_run__block_invoke(uint64_t a1)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 32));
  return v1 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_imageCaptionModel, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end