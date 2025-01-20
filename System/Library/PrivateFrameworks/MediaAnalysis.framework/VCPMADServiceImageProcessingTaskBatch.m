@interface VCPMADServiceImageProcessingTaskBatch
+ (id)taskWithCloudIdentifierRequests:(id)a3 photoLibrary:(id)a4 clientBundleID:(id)a5 clientTeamID:(id)a6 cancelBlock:(id)a7 andCompletionHandler:(id)a8;
- (BOOL)cachesResources;
- (BOOL)run:(id *)a3;
- (NSString)signpostPayload;
- (VCPMADServiceImageProcessingTaskBatch)initWithCloudIdentifierRequests:(id)a3 photoLibrary:(id)a4 clientBundleID:(id)a5 clientTeamID:(id)a6 cancelBlock:(id)a7 andCompletionHandler:(id)a8;
- (id)assetWithIdentifier:(id)a3 isCloudIdentifier:(BOOL)a4 error:(id *)a5;
- (void)setSignpostPayload:(id)a3;
@end

@implementation VCPMADServiceImageProcessingTaskBatch

- (VCPMADServiceImageProcessingTaskBatch)initWithCloudIdentifierRequests:(id)a3 photoLibrary:(id)a4 clientBundleID:(id)a5 clientTeamID:(id)a6 cancelBlock:(id)a7 andCompletionHandler:(id)a8
{
  id v25 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __147__VCPMADServiceImageProcessingTaskBatch_initWithCloudIdentifierRequests_photoLibrary_clientBundleID_clientTeamID_cancelBlock_andCompletionHandler___block_invoke;
  v27[3] = &unk_1E6297A60;
  id v20 = v19;
  id v28 = v20;
  v26.receiver = self;
  v26.super_class = (Class)VCPMADServiceImageProcessingTaskBatch;
  v21 = [(VCPMABaseTask *)&v26 initWithCompletionHandler:v27];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_requests, a3);
    objc_storeStrong((id *)&v22->_photolibrary, a4);
    objc_storeStrong((id *)&v22->_clientBundleID, a5);
    objc_storeStrong((id *)&v22->_clientTeamID, a6);
    signpostPayload = v22->_signpostPayload;
    v22->_signpostPayload = (NSString *)&stru_1F15A0D70;

    -[VCPMABaseTask setCancelBlock:](v22, "setCancelBlock:", v18, v25);
  }

  return v22;
}

uint64_t __147__VCPMADServiceImageProcessingTaskBatch_initWithCloudIdentifierRequests_photoLibrary_clientBundleID_clientTeamID_cancelBlock_andCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)taskWithCloudIdentifierRequests:(id)a3 photoLibrary:(id)a4 clientBundleID:(id)a5 clientTeamID:(id)a6 cancelBlock:(id)a7 andCompletionHandler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCloudIdentifierRequests:v13 photoLibrary:v14 clientBundleID:v15 clientTeamID:v16 cancelBlock:v17 andCompletionHandler:v18];

  return v19;
}

- (BOOL)cachesResources
{
  return 1;
}

- (id)assetWithIdentifier:(id)a3 isCloudIdentifier:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (void *)MEMORY[0x1C186D320]();
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v8;
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "[VCPMADServiceImageProcessing] Fetching Photos asset with identifier %@", buf, 0xCu);
    }
  }
  v11 = [MEMORY[0x1E4F390A8] fetchOptionsWithInclusiveDefaultsForPhotoLibrary:self->_photolibrary];
  [v11 setIncludeHiddenAssets:1];
  [v11 setIncludeTrashedAssets:1];
  [v11 setIncludeGuestAssets:1];
  uint64_t v12 = *MEMORY[0x1E4F394F0];
  v30[0] = *MEMORY[0x1E4F39430];
  v30[1] = v12;
  uint64_t v13 = *MEMORY[0x1E4F394D8];
  v30[2] = *MEMORY[0x1E4F39540];
  v30[3] = v13;
  v30[4] = *MEMORY[0x1E4F39578];
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:5];
  [v11 addFetchPropertySets:v14];

  id v15 = (void *)MEMORY[0x1E4F38EC0];
  if (v6)
  {
    id v29 = v8;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    uint64_t v17 = [v15 fetchAssetsWithCloudIdentifiers:v16 options:v11];
  }
  else
  {
    id v28 = v8;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    uint64_t v17 = [v15 fetchAssetsWithLocalIdentifiers:v16 options:v11];
  }
  id v18 = (void *)v17;

  if ([v18 count])
  {
    if ((unint64_t)[v18 count] >= 2 && (int)MediaAnalysisLogLevel() >= 4)
    {
      id v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v8;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEFAULT, "[VCPMADServiceImageProcessing] Fetch returned multiple assets for identifier (%@)", buf, 0xCu);
      }
    }
    a5 = [v18 objectAtIndexedSubscript:0];
  }
  else if (a5)
  {
    id v20 = (void *)MEMORY[0x1E4F28C58];
    v21 = [NSString stringWithFormat:@"[VCPMADServiceImageProcessing] Specified identifier not found (%@)", v8, *MEMORY[0x1E4F28568]];
    v27 = v21;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v23 = [v20 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v22];
    id v24 = *a5;
    *a5 = v23;

    a5 = 0;
  }

  return a5;
}

- (BOOL)run:(id *)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v4 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v4);

  v5 = VCPSignPostLog();
  BOOL v6 = v5;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    signpostPayload = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    *(void *)v61 = signpostPayload;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADServiceImageProcessingTaskBatch_Run", "%@", buf, 0xCu);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = [(NSDictionary *)self->_requests allKeys];
  uint64_t v8 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
  if (v8)
  {
    uint64_t v45 = 0;
    uint64_t v43 = *(void *)v54;
    uint64_t v39 = *MEMORY[0x1E4F28760];
    uint64_t v40 = *MEMORY[0x1E4F28568];
LABEL_6:
    uint64_t v9 = 0;
    uint64_t v44 = v8;
    while (1)
    {
      if (*(void *)v54 != v43) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void *)(*((void *)&v53 + 1) + 8 * v9);
      v11 = (void *)MEMORY[0x1C186D320]();
      id v52 = 0;
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        uint64_t v12 = VCPLogInstance();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109378;
          uint64_t v45 = (v45 + 1);
          *(_DWORD *)v61 = v45;
          *(_WORD *)&v61[4] = 2112;
          *(void *)&v61[6] = v10;
          _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEBUG, "[ImageProcessingTask%d] Build task for asset (%@)", buf, 0x12u);
        }
      }
      uint64_t v13 = [(VCPMADServiceImageProcessingTaskBatch *)self assetWithIdentifier:v10 isCloudIdentifier:1 error:&v52];
      if (!v13)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v27 = VCPLogInstance();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v61 = v45;
            *(_WORD *)&v61[4] = 2112;
            *(void *)&v61[6] = v10;
            __int16 v62 = 2112;
            id v63 = v52;
            _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "[ImageProcessingTask%d] Failed to fetch asset (%@) - %@", buf, 0x1Cu);
          }
        }
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v14 = [(NSDictionary *)self->_requests objectForKeyedSubscript:v10];
        uint64_t v28 = [v14 countByEnumeratingWithState:&v48 objects:v59 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v49;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v49 != v29) {
                objc_enumerationMutation(v14);
              }
              [*(id *)(*((void *)&v48 + 1) + 8 * i) setError:v52];
            }
            uint64_t v28 = [v14 countByEnumeratingWithState:&v48 objects:v59 count:16];
          }
          while (v28);
        }
        int v20 = 3;
        goto LABEL_42;
      }
      id v14 = +[VCPMADServiceImageAsset assetWithPhotosAsset:v13 clientBundleID:self->_clientBundleID clientTeamID:self->_clientTeamID];
      id v15 = [(NSDictionary *)self->_requests objectForKeyedSubscript:v10];
      id v16 = [(VCPMABaseTask *)self cancelBlock];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __45__VCPMADServiceImageProcessingTaskBatch_run___block_invoke;
      v46[3] = &unk_1E6299098;
      int v47 = v45;
      v46[4] = v10;
      uint64_t v17 = +[VCPMADServiceImageProcessingTask taskWithRequests:v15 forAsset:v14 cancelBlock:v16 andCompletionHandler:v46];

      id v18 = [NSString stringWithFormat:@"[ImageProcessingTask%d] Identifier %@", v45, v10];
      [v17 setSignpostPayload:v18];

      int v19 = [v17 run];
      int v20 = v19;
      if (v19)
      {
        if (v19 == -128)
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v21 = VCPLogInstance();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_INFO, "Request canceled", buf, 2u);
            }
          }
          if (!a3)
          {
            int v20 = 1;
            goto LABEL_41;
          }
          v22 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v57 = v40;
          v23 = [NSString stringWithFormat:@"Request was canceled"];
          v58 = v23;
          id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
          id v25 = [v22 errorWithDomain:v39 code:-128 userInfo:v24];
          id v26 = *a3;
          *a3 = v25;

          int v20 = 1;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() < 4)
          {
            int v20 = 0;
            goto LABEL_41;
          }
          v23 = VCPLogInstance();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v31 = (objc_class *)objc_opt_class();
            id v32 = NSStringFromClass(v31);
            *(_DWORD *)buf = 138412546;
            *(void *)v61 = v32;
            *(_WORD *)&v61[8] = 1024;
            *(_DWORD *)&v61[10] = v20;
            _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEFAULT, "%@ returned unexpected status (%d)", buf, 0x12u);
          }
          int v20 = 0;
        }
      }
LABEL_41:

LABEL_42:
      if (v20 != 3 && v20)
      {
        BOOL v36 = 0;
        goto LABEL_51;
      }
      if (++v9 == v44)
      {
        uint64_t v8 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
        if (v8) {
          goto LABEL_6;
        }
        break;
      }
    }
  }

  uint64_t v33 = VCPSignPostLog();
  v34 = v33;
  if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v33))
  {
    v35 = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    *(void *)v61 = v35;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v34, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADServiceImageProcessingTaskBatch_Run", "%@", buf, 0xCu);
  }

  id obj = [(VCPMABaseTask *)self completionHandler];
  (*((void (**)(id, void, void))obj + 2))(obj, 0, 0);
  BOOL v36 = 1;
LABEL_51:

  return v36;
}

void __45__VCPMADServiceImageProcessingTaskBatch_run___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v4 = VCPLogInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = *(_DWORD *)(a1 + 40);
        uint64_t v6 = *(void *)(a1 + 32);
        int v13 = 67109634;
        int v14 = v5;
        __int16 v15 = 2112;
        uint64_t v16 = v6;
        __int16 v17 = 2112;
        id v18 = v3;
        v7 = "[ImageProcessingTask%d] Failed to process asset (%@) - %@";
        uint64_t v8 = v4;
        os_log_type_t v9 = OS_LOG_TYPE_ERROR;
        uint32_t v10 = 28;
LABEL_8:
        _os_log_impl(&dword_1BBEDA000, v8, v9, v7, (uint8_t *)&v13, v10);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v11 = *(_DWORD *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 67109378;
      int v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      v7 = "[ImageProcessingTask%d] Finished processing asset (%@)";
      uint64_t v8 = v4;
      os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
      uint32_t v10 = 18;
      goto LABEL_8;
    }
LABEL_9:
  }
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
  objc_storeStrong((id *)&self->_clientTeamID, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_photolibrary, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end