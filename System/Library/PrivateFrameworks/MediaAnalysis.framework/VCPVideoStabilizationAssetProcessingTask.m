@interface VCPVideoStabilizationAssetProcessingTask
+ (BOOL)deserializeStabilizationRecipeInAttributes:(id)a3;
+ (id)taskWithAssets:(id)a3 andOptions:(id)a4 andCompletionHandler:(id)a5;
- (BOOL)autoCancellable;
- (VCPVideoStabilizationAssetProcessingTask)initWithAssets:(id)a3 andOptions:(id)a4 andCompletionHandler:(id)a5;
- (float)resourceRequirement;
- (int)main;
- (int)run;
- (void)cancel;
- (void)dealloc;
@end

@implementation VCPVideoStabilizationAssetProcessingTask

- (VCPVideoStabilizationAssetProcessingTask)initWithAssets:(id)a3 andOptions:(id)a4 andCompletionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)VCPVideoStabilizationAssetProcessingTask;
  v12 = [(VCPVideoStabilizationAssetProcessingTask *)&v31 init];
  v13 = v12;
  if (!v12)
  {
LABEL_15:
    v29 = v13;
    goto LABEL_16;
  }
  if (v11) {
    v14 = v11;
  }
  else {
    v14 = &__block_literal_global_54;
  }
  v15 = _Block_copy(v14);
  id completionHandler = v12->_completionHandler;
  v12->_id completionHandler = v15;

  if ([v9 count])
  {
    objc_storeStrong((id *)&v12->_assets, a3);
    v17 = [(NSArray *)v12->_assets objectAtIndexedSubscript:0];
    uint64_t v18 = [v17 photoLibrary];
    photoLibrary = v13->_photoLibrary;
    v13->_photoLibrary = (PHPhotoLibrary *)v18;

    uint64_t v20 = +[VCPDatabaseReader databaseForPhotoLibrary:v13->_photoLibrary];
    database = v13->_database;
    v13->_database = (VCPDatabaseReader *)v20;

    v22 = [v10 objectForKeyedSubscript:@"AllowOnDemandPixel"];
    v13->_onDemandPixel = [v22 BOOLValue];

    v23 = [v10 objectForKeyedSubscript:@"AllowOnDemandGyro"];
    v13->_onDemandGyro = [v23 BOOLValue];

    v24 = [v10 objectForKeyedSubscript:VCPVideoStabilizationProcessing_GyroKey];
    if (v24
      && ([v10 objectForKeyedSubscript:VCPVideoStabilizationProcessing_PixelKey],
          v25 = objc_claimAutoreleasedReturnValue(),
          v25,
          v24,
          !v25))
    {
      uint64_t v28 = 0x10000000;
    }
    else
    {
      v26 = [v10 objectForKeyedSubscript:VCPVideoStabilizationProcessing_PixelKey];
      if (v26
        && ([v10 objectForKeyedSubscript:VCPVideoStabilizationProcessing_GyroKey],
            v27 = objc_claimAutoreleasedReturnValue(),
            v27,
            v26,
            !v27))
      {
        uint64_t v28 = 0x4000000;
      }
      else
      {
        uint64_t v28 = 335544320;
      }
    }
    v13->_stabilizationType = v28;
    goto LABEL_15;
  }
  v29 = 0;
LABEL_16:

  return v29;
}

+ (id)taskWithAssets:(id)a3 andOptions:(id)a4 andCompletionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAssets:v7 andOptions:v8 andCompletionHandler:v9];

  return v10;
}

- (void)dealloc
{
  v11[1] = *MEMORY[0x1E4F143B8];
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0)
  {
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    if (completionHandler)
    {
      v5 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F28568];
      v6 = [NSString stringWithFormat:@"Video stabilization task cancelled"];
      v11[0] = v6;
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      id v8 = [v5 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v7];
      completionHandler[2](completionHandler, 0, v8);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)VCPVideoStabilizationAssetProcessingTask;
  [(VCPVideoStabilizationAssetProcessingTask *)&v9 dealloc];
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

+ (BOOL)deserializeStabilizationRecipeInAttributes:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"stabilizationRecipe"];

  if (v4)
  {
    v5 = [VCPProtoMovieStabilizationRecipe alloc];
    v6 = [v3 objectForKeyedSubscript:@"stabilizationRecipe"];
    id v7 = [(VCPProtoMovieStabilizationRecipe *)v5 initWithData:v6];

    id v8 = [(VCPProtoMovieStabilizationRecipe *)v7 exportToLegacyDictionary];
    BOOL v9 = v8 != 0;
    if (v8)
    {
      [v3 removeObjectForKey:@"stabilizationRecipe"];
      [v3 addEntriesFromDictionary:v8];
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (int)main
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (![(NSArray *)self->_assets count]) {
    return -50;
  }
  v34 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obj = self->_assets;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v3)
  {
    uint64_t v36 = *(void *)v39;
LABEL_4:
    uint64_t v35 = v3;
    uint64_t v4 = 0;
    while (1)
    {
      if (*(void *)v39 != v36) {
        objc_enumerationMutation(obj);
      }
      v5 = *(void **)(*((void *)&v38 + 1) + 8 * v4);
      unsigned __int8 v6 = atomic_load((unsigned __int8 *)&self->_cancel);
      if (v6)
      {
        int v31 = -128;
        goto LABEL_36;
      }
      database = self->_database;
      id v8 = [*(id *)(*((void *)&v38 + 1) + 8 * v4) localIdentifier];
      BOOL v9 = [(VCPDatabaseReader *)database queryAnalysisForAsset:v8];

      uint64_t v10 = objc_msgSend(v9, "vcp_results");
      id v11 = [v10 objectForKeyedSubscript:@"VideoStabilizationResults"];

      if (v11)
      {
        v12 = [v11 objectAtIndexedSubscript:0];
        v13 = [v12 objectForKeyedSubscript:@"attributes"];
        v14 = [v13 objectForKeyedSubscript:@"gyroStabilization"];
        int v15 = [v14 BOOLValue];

        unint64_t stabilizationType = self->_stabilizationType;
        if (v15)
        {
          if ((stabilizationType & 0x10000000) == 0) {
            goto LABEL_15;
          }
        }
        else if ((stabilizationType & 0x4000000) == 0)
        {
          goto LABEL_15;
        }
        if ((int)objc_msgSend(v9, "vcp_version") < 35
          || (objc_msgSend(v9, "vcp_dateModified"),
              v17 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v5, "vcp_modificationDate"),
              uint64_t v18 = objc_claimAutoreleasedReturnValue(),
              char v19 = [v17 isEqualToDate:v18],
              v18,
              v17,
              (v19 & 1) == 0))
        {
LABEL_15:

          id v11 = 0;
        }
      }
      unint64_t v20 = self->_stabilizationType;
      if (!self->_onDemandPixel) {
        v20 &= ~0x4000000uLL;
      }
      if (self->_onDemandGyro) {
        unint64_t v21 = v20;
      }
      else {
        unint64_t v21 = v20 & 0xFFFFFFFFEFFFFFFFLL;
      }
      if ((v21 & 0x14000000) != 0 && !v11)
      {
        v22 = [[VCPMovieAnalyzer alloc] initWithPHAsset:v5 withExistingAnalysis:0 forAnalysisTypes:v21];
        v23 = v22;
        if (!v22) {
          goto LABEL_35;
        }
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __48__VCPVideoStabilizationAssetProcessingTask_main__block_invoke;
        v37[3] = &unk_1E6297060;
        v37[4] = self;
        v24 = [(VCPMovieAnalyzer *)v22 analyzeAsset:v37 streamed:0];
        v25 = objc_msgSend(v24, "vcp_results");
        id v11 = [v25 objectForKeyedSubscript:@"VideoStabilizationResults"];
      }
      if (v11)
      {
        v26 = [v11 objectAtIndexedSubscript:0];
        v27 = [v26 objectForKeyedSubscript:@"attributes"];
        uint64_t v28 = (void *)[v27 mutableCopy];

        if (([(id)objc_opt_class() deserializeStabilizationRecipeInAttributes:v28] & 1) == 0)
        {

LABEL_35:
          int v31 = -18;
LABEL_36:

          goto LABEL_39;
        }
        v29 = [v5 localIdentifier];
        [v34 setObject:v28 forKeyedSubscript:v29];
      }
      if (v35 == ++v4)
      {
        uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v3) {
          goto LABEL_4;
        }
        break;
      }
    }
  }

  if ([v34 count])
  {
    v30 = v34;
  }
  else
  {

    v30 = 0;
  }
  v34 = v30;
  (*((void (**)(void))self->_completionHandler + 2))();
  int v31 = 0;
LABEL_39:

  return v31;
}

uint64_t __48__VCPVideoStabilizationAssetProcessingTask_main__block_invoke(uint64_t a1)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 40));
  return v1 & 1;
}

- (int)run
{
  v19[1] = *MEMORY[0x1E4F143B8];
  atomic_store(1u, (unsigned __int8 *)&self->_started);
  uint64_t v3 = VCPSignPostLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  v5 = VCPSignPostLog();
  unsigned __int8 v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VCPVideoStabilizationAssetProcessingTask", "", v17, 2u);
  }

  int v7 = [(VCPVideoStabilizationAssetProcessingTask *)self main];
  id v8 = VCPSignPostLog();
  BOOL v9 = v8;
  if (v4 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v8))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v9, OS_SIGNPOST_INTERVAL_END, v4, "VCPVideoStabilizationAssetProcessingTask", "", v17, 2u);
  }

  if (v7)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      uint64_t v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEFAULT, "Video Stabilization processing failed", v17, 2u);
      }
    }
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v13 = [NSString stringWithFormat:@"Video stabilization processing failed"];
    v19[0] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    int v15 = [v12 errorWithDomain:*MEMORY[0x1E4F28760] code:v7 userInfo:v14];
    completionHandler[2](completionHandler, 0, v15);
  }
  return v7;
}

- (void)cancel
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end