@interface VCPFullAnalysisURLProcessingTask
+ (id)taskForURLAsset:(id)a3 withOptions:(id)a4 analysisTypes:(unint64_t)a5 progressHandler:(id)a6 completionHandler:(id)a7;
- (BOOL)autoCancellable;
- (NSDictionary)partialAnalysis;
- (VCPFullAnalysisURLProcessingTask)initWithURLAsset:(id)a3 withOptions:(id)a4 analysisTypes:(unint64_t)a5 progressHandler:(id)a6 completionHandler:(id)a7;
- (float)resourceRequirement;
- (int)run;
- (int)runWithCancelBlock:(id)a3;
- (void)cancel;
- (void)setPartialAnalysis:(id)a3;
@end

@implementation VCPFullAnalysisURLProcessingTask

- (VCPFullAnalysisURLProcessingTask)initWithURLAsset:(id)a3 withOptions:(id)a4 analysisTypes:(unint64_t)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v31.receiver = self;
  v31.super_class = (Class)VCPFullAnalysisURLProcessingTask;
  v16 = [(VCPFullAnalysisURLProcessingTask *)&v31 init];
  v17 = v16;
  v18 = v16;
  if (v16)
  {
    atomic_store(0, (unsigned __int8 *)&v16->_cancel);
    if ([v12 count])
    {
      uint64_t v19 = [v12 objectAtIndexedSubscript:0];
      assetURL = v18->_assetURL;
      v18->_assetURL = (NSURL *)v19;
    }
    else
    {
      assetURL = v18->_assetURL;
      v18->_assetURL = 0;
    }

    if ((unint64_t)[v12 count] < 2)
    {
      pairedAssetURL = v18->_pairedAssetURL;
      v18->_pairedAssetURL = 0;
    }
    else
    {
      uint64_t v21 = [v12 objectAtIndexedSubscript:1];
      pairedAssetURL = v18->_pairedAssetURL;
      v18->_pairedAssetURL = (NSURL *)v21;
    }

    unint64_t v23 = 0x7FFFFFFFFFFFFLL;
    if (a5) {
      unint64_t v23 = a5;
    }
    v18->_analysisTypes = v23;
    v24 = _Block_copy(v14);
    id progressHandler = v18->_progressHandler;
    v18->_id progressHandler = v24;

    if (v15) {
      v26 = v15;
    }
    else {
      v26 = &__block_literal_global_57;
    }
    v27 = _Block_copy(v26);
    id completionHandler = v18->_completionHandler;
    v18->_id completionHandler = v27;

    v18->_noResultStrip = 0;
    objc_storeStrong((id *)&v17->_options, a4);
    v29 = v18;
  }

  return v18;
}

+ (id)taskForURLAsset:(id)a3 withOptions:(id)a4 analysisTypes:(unint64_t)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = (void *)[objc_alloc((Class)objc_opt_class()) initWithURLAsset:v11 withOptions:v12 analysisTypes:a5 progressHandler:v13 completionHandler:v14];

  return v15;
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return (BYTE3(self->_analysisTypes) >> 5) & 1;
}

- (void)cancel
{
}

- (int)run
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__VCPFullAnalysisURLProcessingTask_run__block_invoke;
  v3[3] = &unk_1E6297060;
  v3[4] = self;
  return [(VCPFullAnalysisURLProcessingTask *)self runWithCancelBlock:v3];
}

uint64_t __39__VCPFullAnalysisURLProcessingTask_run__block_invoke(uint64_t a1)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 8));
  return v1 & 1;
}

- (int)runWithCancelBlock:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v4 = (uint64_t (**)(void))a3;
  uint64_t progressHandler = (uint64_t)self->_progressHandler;
  if (progressHandler) {
    uint64_t progressHandler = (*(uint64_t (**)(double))(progressHandler + 16))(0.0);
  }
  if (v4)
  {
    uint64_t progressHandler = v4[2](v4);
    if (progressHandler)
    {
      int v6 = -128;
      goto LABEL_51;
    }
  }
  context = (void *)MEMORY[0x1C186D320](progressHandler);
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      assetURL = self->_assetURL;
      *(_DWORD *)buf = 138412290;
      v58 = assetURL;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "  [%@] Processing", buf, 0xCu);
    }
  }
  v9 = self->_assetURL;
  id v46 = 0;
  uint64_t v10 = *MEMORY[0x1E4F1C538];
  [(NSURL *)v9 getResourceValue:&v46 forKey:*MEMORY[0x1E4F1C538] error:0];
  id v11 = v46;
  uint64_t v12 = *MEMORY[0x1E4F44448];
  if (([v11 conformsToType:*MEMORY[0x1E4F44448]] & 1) != 0
    || (uint64_t v13 = *MEMORY[0x1E4F44520], [v11 conformsToType:*MEMORY[0x1E4F44520]]))
  {
    id v14 = +[VCPURLAsset movieAssetWithURL:self->_assetURL];
    if (v14)
    {
      id v15 = +[VCPMovieAnalyzer analyzerWithVCPAsset:v14 withExistingAnalysis:self->_partialAnalysis forAnalysisTypes:self->_analysisTypes withOptions:0];
      v16 = [v15 analyzeAsset:v4 streamed:0];
      uint64_t v17 = [v15 status];
      goto LABEL_14;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v22 = VCPLogInstance();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        unint64_t v23 = self->_assetURL;
        *(_DWORD *)buf = 138412290;
        v58 = v23;
        _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_ERROR, "[MediaAnalysis][%@]Unable to open movie, skip", buf, 0xCu);
      }
    }
    v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v55 = *MEMORY[0x1E4F28568];
    id v25 = [NSString stringWithFormat:@"[MediaAnalysis][%@]Unable to open movie, skip", self->_assetURL, context];
    id v56 = v25;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    uint64_t v27 = [v24 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v26];
    goto LABEL_23;
  }
  if (![v11 conformsToType:*MEMORY[0x1E4F44400]])
  {
    v16 = 0;
    goto LABEL_37;
  }
  pairedAssetURL = self->_pairedAssetURL;
  if (!pairedAssetURL)
  {
    id v14 = +[VCPURLAsset imageAssetWithURL:self->_assetURL];
    if (v14) {
      goto LABEL_30;
    }
LABEL_54:
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v37 = VCPLogInstance();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = self->_assetURL;
        *(_DWORD *)buf = 138412290;
        v58 = v38;
        _os_log_impl(&dword_1BBEDA000, v37, OS_LOG_TYPE_ERROR, "[MediaAnalysis][%@]Failed to create asset", buf, 0xCu);
      }
    }
    v39 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v51 = *MEMORY[0x1E4F28568];
    id v25 = [NSString stringWithFormat:@"[MediaAnalysis][%@]Failed to create asset", self->_assetURL, context];
    id v52 = v25;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    uint64_t v27 = [v39 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v26];
LABEL_23:
    v20 = (void *)v27;
LABEL_24:
    uint64_t v19 = 0;
    int v6 = -50;
LABEL_43:

    int v21 = 10;
    v16 = v25;
    goto LABEL_44;
  }
  id v45 = 0;
  [(NSURL *)pairedAssetURL getResourceValue:&v45 forKey:v10 error:0];
  id v25 = v45;
  if (([v25 conformsToType:v12] & 1) == 0 && !objc_msgSend(v25, "conformsToType:", v13))
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v40 = VCPLogInstance();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = self->_assetURL;
        *(_DWORD *)buf = 138412290;
        v58 = v41;
        _os_log_impl(&dword_1BBEDA000, v40, OS_LOG_TYPE_ERROR, "[MediaAnalysis][%@]Unable to open movie, skip", buf, 0xCu);
      }
    }
    v42 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v53 = *MEMORY[0x1E4F28568];
    v26 = [NSString stringWithFormat:@"[MediaAnalysis][%@]Unable to open movie, skip", self->_assetURL, context];
    v54 = v26;
    v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    v20 = [v42 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v43];

    goto LABEL_24;
  }
  id v14 = +[VCPURLAsset livePhotoAssetWithImageURL:self->_assetURL andMovieURL:self->_pairedAssetURL];

  if (!v14) {
    goto LABEL_54;
  }
LABEL_30:
  id v15 = +[VCPPhotoAnalyzer analyzerWithVCPAsset:v14 forAnalysisTypes:self->_analysisTypes];
  v16 = [v15 analyzeAsset:v4 withOptions:self->_options];
  uint64_t v17 = [v15 status];
LABEL_14:
  uint64_t v18 = v17;

  if (v18 == 4)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v29 = VCPLogInstance();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = self->_assetURL;
        *(_DWORD *)buf = 138412290;
        v58 = v30;
        _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_DEFAULT, "  [%@] Analysis cancelled", buf, 0xCu);
      }
    }
    objc_super v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v49 = *MEMORY[0x1E4F28568];
    id v25 = [NSString stringWithFormat:@"[%@] Analysis cancelled", self->_assetURL, context];
    id v50 = v25;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    v20 = [v31 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v26];
    int v6 = -128;
    goto LABEL_42;
  }
  if (v18 != 2)
  {
LABEL_37:
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v32 = VCPLogInstance();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = self->_assetURL;
        *(_DWORD *)buf = 138412290;
        v58 = v33;
        _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_DEFAULT, "  [%@] Analysis failed to complete", buf, 0xCu);
      }
    }
    v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = *MEMORY[0x1E4F28568];
    id v25 = [NSString stringWithFormat:@"[%@] Analysis failed to complete", self->_assetURL, context];
    id v48 = v25;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    v20 = [v34 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v26];
    int v6 = -18;
LABEL_42:
    uint64_t v19 = v16;
    goto LABEL_43;
  }
  if (v16)
  {
    uint64_t v19 = MediaAnalysisStripKeyframeResourceResultsFromAnalysis(v16);
    v20 = 0;
    int v6 = 0;
    int v21 = 0;
LABEL_44:

    goto LABEL_45;
  }
  uint64_t v19 = 0;
  v20 = 0;
  int v6 = 0;
  int v21 = 0;
LABEL_45:

  if (v21 != 10)
  {
    v35 = (void (**)(double))self->_progressHandler;
    if (v35) {
      v35[2](100.0);
    }
  }
  if (v19) {
    objc_storeStrong((id *)&self->_partialAnalysis, v19);
  }
  (*((void (**)(void))self->_completionHandler + 2))();

LABEL_51:
  return v6;
}

- (NSDictionary)partialAnalysis
{
  return self->_partialAnalysis;
}

- (void)setPartialAnalysis:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialAnalysis, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_pairedAssetURL, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
}

@end