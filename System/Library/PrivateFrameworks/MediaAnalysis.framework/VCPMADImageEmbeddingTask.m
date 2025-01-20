@interface VCPMADImageEmbeddingTask
+ (id)dependencies;
+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (BOOL)autoCancellable;
- (VCPMADImageEmbeddingTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (float)resourceRequirement;
- (int)run;
- (void)cancel;
@end

@implementation VCPMADImageEmbeddingTask

- (VCPMADImageEmbeddingTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VCPMADImageEmbeddingTask;
  v12 = [(VCPMADImageEmbeddingTask *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
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
        objc_super v15 = (objc_class *)objc_opt_class();
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
}

- (int)run
{
  v68[1] = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_INFO, "VCPMADImageEmbeddingTask running...", buf, 2u);
    }
  }
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_canceled);
  if (v4) {
    return -128;
  }
  v5 = +[VCPMADImageEmbeddingResource sharedResourceForRevision:[(MADImageEmbeddingRequest *)self->_request version]];
  v6 = +[VCPMADResourceManager sharedManager];
  v7 = [v6 activateResource:v5];

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = [(MADImageEmbeddingRequest *)self->_request version];
      *(_DWORD *)buf = 67109120;
      LODWORD(v64) = v9;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_INFO, "VCPMADImageEmbeddingTask with embedding version %d", buf, 8u);
    }
  }
  id v10 = [v5 imageBackbone];
  BOOL v11 = v10 == 0;

  if (!v11)
  {
    v57 = 0;
    int v56 = 0;
    if ([(VCPMADServiceImageAsset *)self->_imageAsset loadPixelBuffer:&v57 orientation:&v56])
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v12 = VCPLogInstance();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEFAULT, "VCPMADImageEmbeddingTask image loading failed", buf, 2u);
        }
      }
      request = self->_request;
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v65 = *MEMORY[0x1E4F28568];
      id v15 = [NSString stringWithFormat:@"Image loading failed"];
      id v66 = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
      v17 = [v14 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v16];
      [(MADImageEmbeddingRequest *)request setError:v17];
      goto LABEL_50;
    }
    v24 = VCPSignPostLog();
    os_signpost_id_t v25 = os_signpost_id_generate(v24);

    v26 = VCPSignPostLog();
    v27 = v26;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      signpostPayload = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v64 = signpostPayload;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "VCPMADImageEmbeddingTask_requestEmbedding", "%@", buf, 0xCu);
    }

    uint64_t v29 = [(MADImageEmbeddingRequest *)self->_request bypassNormalizaton];
    v30 = [v5 imageBackbone];
    [v30 setBypassNormalizaton:v29];

    v31 = [v5 imageBackbone];
    id v55 = 0;
    LODWORD(v29) = [v31 analyzePixelBuffer:v57 flags:0 results:&v55 cancel:&__block_literal_global_16];
    id v15 = v55;

    if (v29)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v32 = VCPLogInstance();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_DEFAULT, "VCPMADImageEmbeddingTask image embedding analysis failed", buf, 2u);
        }
      }
      v33 = self->_request;
      v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v61 = *MEMORY[0x1E4F28568];
      v16 = [NSString stringWithFormat:@"VCPMADImageEmbeddingTask image embedding analysis failed"];
      v62 = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
      v35 = [v34 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v17];
      [(MADImageEmbeddingRequest *)v33 setError:v35];
LABEL_43:

LABEL_50:
      CF<opaqueCMSampleBuffer *>::~CF(&v57);
      goto LABEL_51;
    }
    v36 = VCPSignPostLog();
    v37 = v36;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      v38 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v64 = v38;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v37, OS_SIGNPOST_INTERVAL_END, v25, "VCPMADImageEmbeddingTask_requestEmbedding", "%@", buf, 0xCu);
    }

    v16 = [v15 objectForKeyedSubscript:@"ImageEmbeddingResults"];
    if ([v16 count])
    {
      v39 = [v16 objectAtIndexedSubscript:0];
      v40 = [v39 objectForKeyedSubscript:@"attributes"];
      v17 = [v40 objectForKeyedSubscript:@"embeddings"];

      v41 = [v16 objectAtIndexedSubscript:0];
      v42 = [v41 objectForKeyedSubscript:@"attributes"];
      v35 = [v42 objectForKeyedSubscript:@"embeddingVersion"];

      if (!v35
        || (int v43 = [v35 intValue], -[MADImageEmbeddingRequest version](self->_request, "version") != v43))
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v48 = VCPLogInstance();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v48, OS_LOG_TYPE_ERROR, "VCPMADImageEmbeddingTask unexpected image embedding version", buf, 2u);
          }
        }
        v49 = self->_request;
        v50 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v59 = *MEMORY[0x1E4F28568];
        v51 = [NSString stringWithFormat:@"VCPMADImageEmbeddingTask unexpected image embedding version. Expect %d, got %d", -[MADImageEmbeddingRequest version](v49, "version"), objc_msgSend(v35, "intValue")];
        v60 = v51;
        v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
        v53 = [v50 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v52];
        [(MADImageEmbeddingRequest *)v49 setError:v53];

        goto LABEL_43;
      }

      if (v17)
      {
        uint64_t v44 = objc_msgSend(objc_alloc(MEMORY[0x1E4F745D0]), "initWithVersion:data:type:", -[MADImageEmbeddingRequest version](self->_request, "version"), v17, 1);
        v45 = (void *)v44;
        if (v44)
        {
          v46 = self->_request;
          uint64_t v58 = v44;
          v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
          [(MADImageEmbeddingRequest *)v46 setResults:v47];
        }
      }
    }
    else
    {
      v17 = 0;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v54 = VCPLogInstance();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v54, OS_LOG_TYPE_INFO, "VCPMADImageEmbeddingTask complete", buf, 2u);
      }
    }
    [v7 reset];
    goto LABEL_50;
  }
  id v19 = self->_request;
  __int16 v20 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v67 = *MEMORY[0x1E4F28568];
  v21 = [NSString stringWithFormat:@"Failed to create image backbone"];
  v68[0] = v21;
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:&v67 count:1];
  v23 = [v20 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v22];
  [(MADImageEmbeddingRequest *)v19 setError:v23];

LABEL_51:
  return 0;
}

uint64_t __31__VCPMADImageEmbeddingTask_run__block_invoke()
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end