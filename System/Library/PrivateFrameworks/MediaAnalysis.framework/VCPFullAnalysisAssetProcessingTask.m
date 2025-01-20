@interface VCPFullAnalysisAssetProcessingTask
+ (BOOL)AllowPersistSettlingEffectScore;
+ (id)taskWithAsset:(id)a3 andAnalysisTypes:(unint64_t)a4 andOptions:(id)a5 andProgressHandler:(id)a6 andCompletionHandler:(id)a7;
- (BOOL)autoCancellable;
- (VCPFullAnalysisAssetProcessingTask)initWithAssets:(id)a3 analysisTypes:(unint64_t)a4 options:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7;
- (float)resourceRequirement;
- (id)analyzeOndemand:(id)a3 forAnalysisTypes:(unint64_t)a4 withExistingAnalysis:(id)a5 error:(id *)a6;
- (id)requestAnalysis:(unint64_t)a3 forAsset:(id)a4 andDatabase:(id)a5 error:(id *)a6;
- (int)main;
- (int)run;
- (void)cancel;
- (void)dealloc;
@end

@implementation VCPFullAnalysisAssetProcessingTask

+ (BOOL)AllowPersistSettlingEffectScore
{
  return 1;
}

- (VCPFullAnalysisAssetProcessingTask)initWithAssets:(id)a3 analysisTypes:(unint64_t)a4 options:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  v28.receiver = self;
  v28.super_class = (Class)VCPFullAnalysisAssetProcessingTask;
  v15 = [(VCPFullAnalysisAssetProcessingTask *)&v28 init];
  if (v15)
  {
    if (v14) {
      v16 = v14;
    }
    else {
      v16 = &__block_literal_global_9;
    }
    v17 = _Block_copy(v16);
    id completionHandler = v15->_completionHandler;
    v15->_id completionHandler = v17;

    if (![v12 count])
    {
      v26 = 0;
      goto LABEL_9;
    }
    atomic_store(0, (unsigned __int8 *)&v15->_cancel);
    objc_storeStrong((id *)&v15->_assets, a3);
    v19 = [(NSArray *)v15->_assets objectAtIndexedSubscript:0];
    uint64_t v20 = [v19 photoLibrary];
    photoLibrary = v15->_photoLibrary;
    v15->_photoLibrary = (PHPhotoLibrary *)v20;

    uint64_t v22 = +[VCPDatabaseReader databaseForPhotoLibrary:v15->_photoLibrary];
    database = v15->_database;
    v15->_database = (VCPDatabaseReader *)v22;

    v24 = [v13 objectForKeyedSubscript:@"AllowOnDemand"];
    v15->_allowOnDemand = [v24 BOOLValue];

    v25 = [v13 objectForKeyedSubscript:@"AllowStreaming"];
    v15->_allowStreaming = [v25 BOOLValue];

    v15->_analysisTypes = a4;
    objc_storeStrong((id *)&v15->_options, a5);
  }
  v26 = v15;
LABEL_9:

  return v26;
}

+ (id)taskWithAsset:(id)a3 andAnalysisTypes:(unint64_t)a4 andOptions:(id)a5 andProgressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAssets:v11 analysisTypes:a4 options:v12 progressHandler:v13 andCompletionHandler:v14];

  return v15;
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
      v6 = [NSString stringWithFormat:@"Full analysis asset processing task cancelled"];
      v11[0] = v6;
      v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      v8 = [v5 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v7];
      completionHandler[2](completionHandler, 0, v8);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)VCPFullAnalysisAssetProcessingTask;
  [(VCPFullAnalysisAssetProcessingTask *)&v9 dealloc];
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (id)requestAnalysis:(unint64_t)a3 forAsset:(id)a4 andDatabase:(id)a5 error:(id *)a6
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  v62 = [v10 localIdentifier];
  v61 = MediaAnalysisResultsTypesForAnalysisTypes(a3);
  id v12 = [v10 localIdentifier];
  id v13 = [v11 queryAnalysisForAsset:v12 withTypes:v61];

  id v68 = 0;
  LODWORD(v12) = [v11 isAssetBlacklisted:v62 blacklistDate:&v68];
  id v60 = v68;
  if (v12)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      id v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v70 = v62;
        _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis][%@] Analysis requested for blacklisted asset", buf, 0xCu);
      }
    }
    goto LABEL_19;
  }
  if (!v13)
  {
LABEL_20:
    unint64_t v26 = a3;
    goto LABEL_21;
  }
  if ((int)objc_msgSend(v13, "vcp_version") < 7)
  {
LABEL_19:

    id v13 = 0;
    goto LABEL_20;
  }
  v15 = objc_msgSend(v13, "vcp_dateModified");
  v16 = objc_msgSend(v10, "vcp_modificationDate");
  char v17 = [v15 isEqualToDate:v16];

  if ((v17 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v25 = VCPLogInstance();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v70 = v62;
        _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEBUG, "[MediaAnalysis][%@] Existing analysis based on old modification", buf, 0xCu);
      }
    }
    goto LABEL_19;
  }
  if (!a3) {
    goto LABEL_56;
  }
  int v18 = objc_msgSend(v13, "vcp_degraded");
  if (self->_allowOnDemand)
  {
    v19 = objc_msgSend(MEMORY[0x1E4F38F68], "vcp_allAcceptableResourcesForAsset:", v10);
    uint64_t v20 = [v10 mediaType];
    v21 = off_1E62960F0;
    if (v20 != 1) {
      v21 = off_1E62960E8;
    }
    int v22 = [(__objc2_class *)*v21 canAnalyzeUndegraded:v10 withResources:v19];
    uint64_t v23 = MediaAnalysisStripOutdatedAnalysis(v10, v13);

    int v24 = v22 ^ 1;
    id v13 = (id)v23;
  }
  else
  {
    int v24 = v18;
  }
  if ((objc_msgSend(v13, "vcp_degraded") ^ 1 | v24))
  {
    if ((a3 & ~objc_msgSend(v13, "vcp_types")) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v51 = VCPLogInstance();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          v52 = MediaAnalysisTypeDescription(objc_msgSend(v13, "vcp_types"));
          *(_DWORD *)buf = 138412546;
          v70 = v62;
          __int16 v71 = 2112;
          id v72 = v52;
          _os_log_impl(&dword_1BBEDA000, v51, OS_LOG_TYPE_DEBUG, "[MediaAnalysis][%@] Existing analysis satisfies request (%@)", buf, 0x16u);
        }
      }
      goto LABEL_56;
    }
    if ((objc_msgSend(v13, "vcp_degraded") | v24 ^ 1))
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v56 = VCPLogInstance();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          v57 = MediaAnalysisTypeDescription(objc_msgSend(v13, "vcp_types"));
          *(_DWORD *)buf = 138412546;
          v70 = v62;
          __int16 v71 = 2112;
          id v72 = v57;
          _os_log_impl(&dword_1BBEDA000, v56, OS_LOG_TYPE_DEBUG, "[MediaAnalysis][%@] Existing analysis doesn't satisfy request (%@)", buf, 0x16u);
        }
      }
      unint64_t v26 = a3 & ~objc_msgSend(v13, "vcp_types");
LABEL_21:
      if (!v26) {
        goto LABEL_56;
      }
      goto LABEL_22;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v54 = VCPLogInstance();
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_64;
      }
      *(_DWORD *)buf = 138412290;
      v70 = v62;
      v55 = "[MediaAnalysis][%@] Existing analysis doesn't match asset state";
      goto LABEL_63;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v54 = VCPLogInstance();
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
    {
LABEL_64:

      goto LABEL_65;
    }
    *(_DWORD *)buf = 138412290;
    v70 = v62;
    v55 = "[MediaAnalysis][%@] Existing analysis based on degraded asset";
LABEL_63:
    _os_log_impl(&dword_1BBEDA000, v54, OS_LOG_TYPE_DEBUG, v55, buf, 0xCu);
    goto LABEL_64;
  }
LABEL_65:

  id v13 = 0;
  unint64_t v26 = a3;
LABEL_22:
  if (self->_allowOnDemand)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v27 = VCPLogInstance();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v28 = MediaAnalysisTypeDescription(v26);
        *(_DWORD *)buf = 138412546;
        v70 = v62;
        __int16 v71 = 2112;
        id v72 = v28;
        _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis][%@] Generating analysis on-demand: %@", buf, 0x16u);
      }
    }
    v29 = [(VCPFullAnalysisAssetProcessingTask *)self analyzeOndemand:v10 forAnalysisTypes:v26 withExistingAnalysis:v13 error:a6];
    if (v29)
    {
      v30 = MediaAnalysisMergeAnalysis(v13, v29, self->_allowOnDemand);
    }
    else
    {
      v30 = 0;
    }
    int v31 = [(id)objc_opt_class() AllowPersistSettlingEffectScore] ^ 1;
    if ((a3 & 0x40000) == 0) {
      LOBYTE(v31) = 1;
    }
    if (v31) {
      goto LABEL_48;
    }
    v32 = objc_msgSend(v30, "vcp_results");
    v59 = [v32 objectForKeyedSubscript:@"SettlingEffectsGatingResults"];

    if (![v59 count])
    {
LABEL_47:

LABEL_48:
      id v49 = v30;

      v50 = v49;
      goto LABEL_57;
    }
    v33 = [v59 objectAtIndexedSubscript:0];
    objc_msgSend(v33, "vcp_quality");
    double v35 = v34;

    v36 = [v59 objectAtIndexedSubscript:0];
    v37 = [v36 objectForKeyedSubscript:@"attributes"];
    v38 = [v37 objectForKeyedSubscript:@"RankingLevel"];
    [v38 floatValue];
    int v40 = v39;

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v41 = VCPLogInstance();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        v42 = [v10 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v70 = v42;
        _os_log_impl(&dword_1BBEDA000, v41, OS_LOG_TYPE_DEBUG, "   [%@] Publishing settling effect score to PHAssetPropertySetMediaAnalysis", buf, 0xCu);
      }
    }
    photoLibrary = self->_photoLibrary;
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __81__VCPFullAnalysisAssetProcessingTask_requestAnalysis_forAsset_andDatabase_error___block_invoke;
    v64[3] = &unk_1E6297800;
    id v45 = v10;
    id v65 = v45;
    float v43 = v35;
    float v66 = v43;
    int v67 = v40;
    id v63 = 0;
    LODWORD(photoLibrary) = [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v64 error:&v63];
    id v58 = v63;
    if (photoLibrary)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v46 = VCPLogInstance();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          v47 = [v45 localIdentifier];
          *(_DWORD *)buf = 138412290;
          v70 = v47;
          _os_log_impl(&dword_1BBEDA000, v46, OS_LOG_TYPE_DEBUG, "   [%@] Successfully published settling effect score to PHAssetPropertySetMediaAnalysis", buf, 0xCu);
        }
LABEL_45:
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v46 = VCPLogInstance();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v48 = [v45 localIdentifier];
        *(_DWORD *)buf = 138412546;
        v70 = v48;
        __int16 v71 = 2112;
        id v72 = v58;
        _os_log_impl(&dword_1BBEDA000, v46, OS_LOG_TYPE_ERROR, "   [%@] Error publishing settling effect score to PHAssetPropertySetMediaAnalysis, error: %@", buf, 0x16u);
      }
      goto LABEL_45;
    }

    goto LABEL_47;
  }
LABEL_56:
  id v13 = v13;
  id v49 = 0;
  v50 = v13;
LABEL_57:

  return v50;
}

void __81__VCPFullAnalysisAssetProcessingTask_requestAnalysis_forAsset_andDatabase_error___block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F38ED8] changeRequestForAsset:*(void *)(a1 + 32)];
  v2 = objc_msgSend(*(id *)(a1 + 32), "vcp_modificationDate");
  [v5 setMediaAnalysisTimeStamp:v2];

  LODWORD(v3) = *(_DWORD *)(a1 + 40);
  [v5 setSettlingEffectScore:v3];
  LODWORD(v4) = *(_DWORD *)(a1 + 44);
  [v5 setActivityScore:v4];
}

- (id)analyzeOndemand:(id)a3 forAnalysisTypes:(unint64_t)a4 withExistingAnalysis:(id)a5 error:(id *)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v42 = a5;
  v41 = objc_msgSend(MEMORY[0x1E4F38F68], "vcp_allAcceptableResourcesForAsset:", v9);
  uint64_t v10 = objc_msgSend(v9, "vcp_fullAnalysisTypesForResources:");
  if (self->_allowStreaming)
  {
    uint64_t v11 = v10;
    id v12 = +[VCPInternetReachability sharedInstance];
    int v13 = [v12 hasWifiOrEthernetConnection];
    if ((a4 & ~v11) != 0) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    if (v14 == 1)
    {
      v15 = [v9 photoLibrary];
      if (objc_msgSend(v15, "vcp_eligibleForStreaming:", 0)) {
        uint64_t v16 = objc_msgSend(v9, "vcp_eligibleForVideoDownload:", v41);
      }
      else {
        uint64_t v16 = 0;
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  int v17 = (a4 >> 49) & 1 | [v9 isPhoto];
  if (v17 == 1)
  {
    int v18 = [[VCPPhotoAnalyzer alloc] initWithPHAsset:v9 withExistingAnalysis:v42 forAnalysisTypes:a4 & 0x261D900060000];
    [(VCPPhotoAnalyzer *)v18 setAllowStreaming:v16];
    [(VCPPhotoAnalyzer *)v18 setOnDemand:1];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __98__VCPFullAnalysisAssetProcessingTask_analyzeOndemand_forAnalysisTypes_withExistingAnalysis_error___block_invoke;
    v44[3] = &unk_1E6297060;
    v44[4] = self;
    v19 = [(VCPPhotoAnalyzer *)v18 analyzeAsset:v44 withOptions:self->_options];
    uint64_t v20 = [(VCPPhotoAnalyzer *)v18 status];
  }
  else
  {
    uint64_t v20 = 0;
    v19 = 0;
  }
  int v21 = [v9 isVideo];
  if (v21)
  {
    int v22 = [[VCPMovieAnalyzer alloc] initWithPHAsset:v9 withExistingAnalysis:v42 forAnalysisTypes:a4];
    [(VCPMovieAnalyzer *)v22 setAllowStreaming:v16];
    [(VCPMovieAnalyzer *)v22 setOnDemand:1];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __98__VCPFullAnalysisAssetProcessingTask_analyzeOndemand_forAnalysisTypes_withExistingAnalysis_error___block_invoke_2;
    v43[3] = &unk_1E6297060;
    v43[4] = self;
    uint64_t v23 = [(VCPMovieAnalyzer *)v22 analyzeAsset:v43 streamed:0];
    uint64_t v24 = [(VCPMovieAnalyzer *)v22 status];
  }
  else
  {
    uint64_t v24 = 0;
    uint64_t v23 = 0;
  }
  v25 = MediaAnalysisMergeAnalysis(v23, v19, 0);
  unint64_t v26 = v25;
  if (v20 == 2) {
    char v27 = 0;
  }
  else {
    char v27 = v17;
  }
  if (v24 == 2) {
    char v28 = 0;
  }
  else {
    char v28 = v21;
  }
  if ((v27 & 1) == 0 && (v28 & 1) == 0)
  {
    if (v25)
    {
      v29 = MediaAnalysisStripKeyframeResourceResultsFromAnalysis(v25);
LABEL_44:

      goto LABEL_46;
    }
    goto LABEL_45;
  }
  if (v20 == 4 || v24 == 4)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v30 = VCPLogInstance();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v33 = [v9 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v48 = v33;
        _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_DEFAULT, "  [%@] Analysis cancelled", buf, 0xCu);
      }
      uint64_t v32 = -128;
      goto LABEL_39;
    }
    uint64_t v32 = -128;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v30 = VCPLogInstance();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = [v9 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v48 = v31;
        _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_DEFAULT, "  [%@] Analysis failed to complete", buf, 0xCu);
      }
      uint64_t v32 = -18;
LABEL_39:

      goto LABEL_42;
    }
    uint64_t v32 = -18;
  }
LABEL_42:

  if (a6)
  {
    double v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F28568];
    double v35 = NSString;
    uint64_t v36 = [v9 localIdentifier];
    v37 = [v35 stringWithFormat:@"[%@] Failed to analyze on-demand", v36];
    v46 = v37;
    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    *a6 = [v34 errorWithDomain:*MEMORY[0x1E4F28760] code:v32 userInfo:v38];

    v29 = 0;
    unint64_t v26 = (void *)v36;
    goto LABEL_44;
  }
LABEL_45:
  v29 = 0;
LABEL_46:

  return v29;
}

uint64_t __98__VCPFullAnalysisAssetProcessingTask_analyzeOndemand_forAnalysisTypes_withExistingAnalysis_error___block_invoke(uint64_t a1)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 40));
  return v1 & 1;
}

uint64_t __98__VCPFullAnalysisAssetProcessingTask_analyzeOndemand_forAnalysisTypes_withExistingAnalysis_error___block_invoke_2(uint64_t a1)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 40));
  return v1 & 1;
}

- (int)main
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (![(NSArray *)self->_assets count]) {
    return -50;
  }
  uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obj = self->_assets;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v4)
  {
    uint64_t v26 = *(void *)v28;
    *(void *)&long long v5 = 138412290;
    long long v23 = v5;
LABEL_4:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v28 != v26) {
        objc_enumerationMutation(obj);
      }
      v7 = *(void **)(*((void *)&v27 + 1) + 8 * v6);
      v8 = (void *)MEMORY[0x1C186D320]();
      unsigned __int8 v9 = atomic_load((unsigned __int8 *)&self->_cancel);
      if (v9)
      {
        int v2 = -128;
      }
      else
      {
        if ([v7 isPhoto] && (self->_analysisTypes & 0xFFFD9E26FFF9FFFFLL) != 0)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            uint64_t v10 = VCPLogInstance();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              uint64_t v11 = MediaAnalysisTypeDescription(self->_analysisTypes & 0xFFFD9E26FFF9FFFFLL);
              *(_DWORD *)buf = v23;
              uint64_t v32 = v11;
              _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "Unsupported photo analysis type %@", buf, 0xCu);
            }
LABEL_21:
            int v2 = -18;
            int v15 = 1;
            goto LABEL_35;
          }
        }
        else
        {
          int v12 = objc_msgSend(v7, "isVideo", v23);
          if ((self->_analysisTypes & 0xFFFDDFFEFFFFFFFFLL) != 0) {
            int v13 = v12;
          }
          else {
            int v13 = 0;
          }
          if (v13 != 1)
          {
            uint64_t v16 = -[VCPFullAnalysisAssetProcessingTask requestAnalysis:forAsset:andDatabase:error:](self, "requestAnalysis:forAsset:andDatabase:error:");
            int v17 = 0;
            uint64_t v10 = v17;
            if (v17)
            {
              int v2 = [v17 code];
              if ((int)MediaAnalysisLogLevel() < 3)
              {
                int v15 = 1;
              }
              else
              {
                int v18 = VCPLogInstance();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  v19 = [v10 description];
                  *(_DWORD *)buf = v23;
                  uint64_t v32 = v19;
                  _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
                }
                int v15 = 1;
LABEL_31:
              }
            }
            else
            {
              if (v16)
              {
                int v18 = objc_msgSend(v16, "vcp_results");
                uint64_t v20 = [v7 localIdentifier];
                [v24 setObject:v18 forKeyedSubscript:v20];

                int v15 = 0;
                goto LABEL_31;
              }
              int v15 = 0;
            }

LABEL_35:
            goto LABEL_36;
          }
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            uint64_t v10 = VCPLogInstance();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              int v14 = MediaAnalysisTypeDescription(self->_analysisTypes & 0xFFFDDFFEFFFFFFFFLL);
              *(_DWORD *)buf = v23;
              uint64_t v32 = v14;
              _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "Unsupported movie analysis type %@", buf, 0xCu);
            }
            goto LABEL_21;
          }
        }
        int v2 = -18;
      }
      int v15 = 1;
LABEL_36:
      if (v15)
      {

        goto LABEL_45;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v4) {
          goto LABEL_4;
        }
        break;
      }
    }
  }

  if ([v24 count])
  {
    int v21 = v24;
  }
  else
  {

    int v21 = 0;
  }
  uint64_t v24 = v21;
  (*((void (**)(void))self->_completionHandler + 2))();
  int v2 = 0;
LABEL_45:

  return v2;
}

- (int)run
{
  v19[1] = *MEMORY[0x1E4F143B8];
  atomic_store(1u, (unsigned __int8 *)&self->_started);
  double v3 = VCPSignPostLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  long long v5 = VCPSignPostLog();
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)int v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VCPFullAnalysisAssetProcessingTask", "", v17, 2u);
  }

  int v7 = [(VCPFullAnalysisAssetProcessingTask *)self main];
  v8 = VCPSignPostLog();
  unsigned __int8 v9 = v8;
  if (v4 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v8))
  {
    *(_WORD *)int v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v9, OS_SIGNPOST_INTERVAL_END, v4, "VCPFullAnalysisAssetProcessingTask", "", v17, 2u);
  }

  if (v7)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      uint64_t v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v17 = 0;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEFAULT, "VCPFullAnalysisAssetProcessingTask processing failed", v17, 2u);
      }
    }
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    int v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    int v13 = [NSString stringWithFormat:@"VCPFullAnalysisAssetProcessingTask processing failed"];
    v19[0] = v13;
    int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
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
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end