@interface VCPMADPECLibraryProcessingTask
+ (NSString)name;
+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
+ (unint64_t)taskID;
- (BOOL)shouldProcessAsset:(id)a3;
- (VCPMADPECLibraryProcessingTask)initWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5;
- (int)processAllAssetsInPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4 andProgress:(id)a5;
- (void)dealloc;
@end

@implementation VCPMADPECLibraryProcessingTask

- (VCPMADPECLibraryProcessingTask)initWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)VCPMADPECLibraryProcessingTask;
  v14 = [(VCPMADPhotosLibraryProcessingTask *)&v18 initWithPhotoLibraries:v10 cancelBlock:v11 progressHandler:v12 andCompletionHandler:v13];
  if (v14)
  {
    uint64_t v15 = +[VCPObjectPool objectPoolWithAllocator:&stru_10021C0D8];
    v16 = *(void **)(v14 + 44);
    *(void *)(v14 + 44) = v15;
  }
  return (VCPMADPECLibraryProcessingTask *)v14;
}

+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibraries:v9 cancelBlock:v10 progressHandler:v11 andCompletionHandler:v12];

  return v13;
}

+ (NSString)name
{
  return (NSString *)@"PEC";
}

+ (unint64_t)taskID
{
  return 16;
}

- (void)dealloc
{
  v3 = +[VNSession globalSession];
  [v3 releaseCachedResources];

  v4.receiver = self;
  v4.super_class = (Class)VCPMADPECLibraryProcessingTask;
  [(VCPMADPECLibraryProcessingTask *)&v4 dealloc];
}

- (BOOL)shouldProcessAsset:(id)a3
{
  return objc_msgSend(a3, "vcp_needsPECProcessing");
}

- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5
{
  v5 = +[VCPMADPECAssetBatch batchWithServicePool:*(id *)((char *)&self->super._progressHandler + 4) analysisDatabase:a3 cancelBlock:a5];
  return v5;
}

- (int)processAllAssetsInPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4 andProgress:(id)a5
{
  id v60 = a3;
  id v54 = a4;
  id v55 = a5;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = [(id)objc_opt_class() name];
      *(_DWORD *)buf = 138412290;
      v66 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "[%@] Evaluating all assets in Photo Library -- PEC", buf, 0xCu);
    }
  }
  v58 = +[PHMediaProcessingAlgorithmVersionProvider mad_sharedVersionProviderWithPhotoLibrary:v60];
  +[PHAsset mad_sceneConfidenceThresholdForTask:](PHAsset, "mad_sceneConfidenceThresholdForTask:", [(id)objc_opt_class() taskID]);
  int v12 = v11;
  v56 = [(VCPMADPhotosLibraryProcessingTask *)self assetPriorities];
  unint64_t v13 = 0;
  os_log_type_t v57 = VCPLogToOSLogType[3];
  os_log_type_t type = VCPLogToOSLogType[5];
  os_log_type_t v51 = VCPLogToOSLogType[6];
  while (v13 < (unint64_t)[v56 count])
  {
    unint64_t v62 = v13 + 1;
    if ((unint64_t)[v56 count] >= 2 && (int)MediaAnalysisLogLevel() >= 5)
    {
      v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, type))
      {
        uint64_t v15 = [(id)objc_opt_class() name];
        *(_DWORD *)buf = 138412546;
        v66 = v15;
        __int16 v67 = 2048;
        id v68 = (id)(v13 + 1);
        _os_log_impl((void *)&_mh_execute_header, v14, type, "[%@] Evaluating P%lu assets", buf, 0x16u);
      }
    }
    v16 = [v56 objectAtIndexedSubscript:v13];
    id v17 = [v16 unsignedIntegerValue];

    id v64 = 0;
    LODWORD(v18) = v12;
    id v59 = [v60 countOfUnprocessedAssetsForMediaProcessingTaskID:16 priority:v17 algorithmVersion:v58 sceneConfidenceThreshold:&v64 error:v18];
    id v19 = v64;
    v52 = v19;
    if (v19)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v20 = VCPLogInstance();
        if (os_log_type_enabled(v20, v57))
        {
          id v21 = v19;
          v22 = [(id)objc_opt_class() name];
          *(_DWORD *)buf = 138412546;
          v66 = v22;
          __int16 v67 = 2112;
          id v68 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, v57, "[%@] Failed to count PEC assets: %@", buf, 0x16u);
        }
      }
      char v23 = 0;
      int v61 = -18;
    }
    else
    {
      unint64_t v24 = 0;
      do
      {
        char v23 = (v24 >= (unint64_t)v59) | v19;
        if ((v24 >= (unint64_t)v59) | v19 & 1) {
          break;
        }
        v26 = +[MADStateHandler sharedStateHandler];
        v27 = [(id)objc_opt_class() name];
        [v26 addBreadcrumb:@"[%@] Fetching Priority%lu assets", v27, v62];

        v28 = VCPSignPostLog();
        os_signpost_id_t v29 = os_signpost_id_generate(v28);

        v30 = VCPSignPostLog();
        v31 = v30;
        if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "VCPMADPhotosLibraryProcessingPECTask_FetchAssets", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        id v32 = [(id)objc_opt_class() taskID];
        id v63 = 0;
        LODWORD(v33) = v12;
        v34 = [v60 fetchUnprocessedAssetsForMediaProcessingTaskID:v32 priority:v17 algorithmVersion:v58 sceneConfidenceThreshold:&v63 error:v33];
        id v35 = v63;
        v36 = VCPSignPostLog();
        v37 = v36;
        if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_END, v29, "VCPMADPhotosLibraryProcessingPECTask_FetchAssets", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        if (v35)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v38 = VCPLogInstance();
            if (os_log_type_enabled(v38, v57))
            {
              v39 = [(id)objc_opt_class() name];
              *(_DWORD *)buf = 138412546;
              v66 = v39;
              __int16 v67 = 2112;
              id v68 = v35;
              _os_log_impl((void *)&_mh_execute_header, v38, v57, "[%@] Failed to fetch PEC assets: %@", buf, 0x16u);
            }
          }
          LOBYTE(v19) = 0;
          int v61 = -18;
          BOOL v40 = 1;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v41 = VCPLogInstance();
            if (os_log_type_enabled(v41, v51))
            {
              v42 = [(id)objc_opt_class() name];
              unsigned int v43 = [v34 count];
              *(_DWORD *)buf = 138412546;
              v66 = v42;
              __int16 v67 = 1024;
              LODWORD(v68) = v43;
              _os_log_impl((void *)&_mh_execute_header, v41, v51, "[%@] Fetched %d PEC assets", buf, 0x12u);
            }
          }
          v44 = +[MADStateHandler sharedStateHandler];
          v45 = [(id)objc_opt_class() name];
          [v44 addBreadcrumb:@"[%@] Fetched %d Priority%lu assets", v45, objc_msgSend(v34, "count"), v62];

          id v19 = [v34 count];
          id v46 = [v34 count];
          unsigned int v47 = [(VCPMADPhotosProcessingTask *)self processAssetsInFetchResult:v34 withAnalysisDatabase:v54 allowDownload:0 progress:v55];
          v24 += (unint64_t)v19;
          LOBYTE(v19) = v46 == 0;
          BOOL v40 = v47 != 0;
          int v48 = v61;
          if (v47) {
            int v48 = v47;
          }
          int v61 = v48;
        }
      }
      while (!v40);
    }

    unint64_t v13 = v62;
    if ((v23 & 1) == 0) {
      goto LABEL_44;
    }
  }
  int v61 = [(VCPMADPhotosProcessingTask *)self waitForPublishing];
  if (!v61)
  {
    MediaAnalysisDaemonReleaseSharedDataStores(v60);
    int v61 = 0;
  }
LABEL_44:

  return v61;
}

- (void).cxx_destruct
{
}

@end