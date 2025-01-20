@interface VCPMADSceneLibraryProcessingTask
+ (NSString)name;
+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
+ (unint64_t)taskID;
- (BOOL)run:(id *)a3;
- (BOOL)shouldProcessAsset:(id)a3;
- (VCPMADSceneLibraryProcessingTask)initWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
- (id)assetPriorities;
- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5;
- (int)_dataMigrationIfNeededForPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4 andProgress:(id)a5;
- (int)_dataMigrationWithAssets:(id)a3;
- (int)processAllAssetsInPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4 andProgress:(id)a5;
- (void)dealloc;
@end

@implementation VCPMADSceneLibraryProcessingTask

- (VCPMADSceneLibraryProcessingTask)initWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v50.receiver = self;
  v50.super_class = (Class)VCPMADSceneLibraryProcessingTask;
  v14 = [(VCPMADPhotosLibraryProcessingTask *)&v50 initWithPhotoLibraries:v10 cancelBlock:v11 progressHandler:v12 andCompletionHandler:v13];
  v15 = v14;
  if (!v14) {
    goto LABEL_8;
  }
  +[VCPPreAnalysisRequests asyncCacheRequestIdealDimension];
  +[VCPPreAnalysisRequests asyncLoadSharedPhotoFormatsObjects];
  id v16 = objc_alloc((Class)VCPPoolBasedPixelBufferCreator);
  id v17 = [v16 initWithBufferWidth:kVCPMAPreAnalysisScaledSize bufferHeight:kVCPMAPreAnalysisScaledSize andPixelFormat:1278226488];
  v18 = *(void **)(v14 + 44);
  *(void *)(v14 + 44) = v17;

  if (!*(void *)(v14 + 44))
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
LABEL_25:
      v33 = 0;
      goto LABEL_26;
    }
    v34 = VCPLogInstance();
    os_log_type_t v35 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      uint64_t v52 = v36;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "[%@] Failed to create VCPPoolBasedPixelBufferCreator for monochrome", buf, 0xCu);
    }
LABEL_12:

    goto LABEL_25;
  }
  id v19 = [objc_alloc((Class)VCPPreAnalysisImageLoader) initWithMonochromeBufferCreator:*(void *)(v14 + 44)];
  v20 = *(void **)(v14 + 52);
  *(void *)(v14 + 52) = v19;

  id v21 = objc_alloc_init((Class)VNSession);
  v22 = *(void **)(v14 + 60);
  *(void *)(v14 + 60) = v21;

  uint64_t v23 = +[VCPObjectPool objectPoolWithAllocator:&stru_10021DD20];
  v24 = *(void **)(v14 + 68);
  *(void *)(v14 + 68) = v23;

  if (+[VCPPreAnalysisRequests includeRotation])
  {
    uint64_t v25 = +[VCPMAMLModel vcp_sharedModelWithModelName:@"MonzaV4_1"];
    v26 = *(void **)(v14 + 76);
    *(void *)(v14 + 76) = v25;

    if (*(void *)(v14 + 76))
    {
      id v27 = objc_msgSend(objc_alloc((Class)VCPPoolBasedPixelBufferCreator), "initWithBufferWidth:bufferHeight:andPixelFormat:", objc_msgSend(*(id *)(v14 + 76), "inputSize"), objc_msgSend(*(id *)(v14 + 76), "inputSize"), 1111970369);
      v28 = *(void **)(v14 + 84);
      *(void *)(v14 + 84) = v27;

      if (*(void *)(v14 + 84)) {
        goto LABEL_6;
      }
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_25;
      }
      v37 = VCPLogInstance();
      os_log_type_t v47 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v37, v47))
      {
        uint64_t v48 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        uint64_t v52 = v48;
        v40 = "[%@] Failed to create VCPPoolBasedPixelBufferCreator for rotation";
        v41 = v37;
        os_log_type_t v42 = v47;
        uint32_t v43 = 12;
        goto LABEL_23;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_25;
      }
      v37 = VCPLogInstance();
      os_log_type_t v38 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v37, v38))
      {
        uint64_t v39 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        uint64_t v52 = v39;
        __int16 v53 = 2112;
        CFStringRef v54 = @"MonzaV4_1";
        v40 = "[%@] Failed to load ProbableRotation model %@";
        v41 = v37;
        os_log_type_t v42 = v38;
        uint32_t v43 = 22;
LABEL_23:
        _os_log_impl((void *)&_mh_execute_header, v41, v42, v40, buf, v43);
      }
    }

    goto LABEL_25;
  }
LABEL_6:
  if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled])
  {
    id v29 = +[VCPVideoTransformerBackbone revision];
    id v30 = objc_msgSend(objc_alloc((Class)VCPPoolBasedPixelBufferCreator), "initWithBufferWidth:bufferHeight:andPixelFormat:", (int)+[VCPVideoTransformerBackbone idealInputWidthWithRevision:](VCPVideoTransformerBackbone, "idealInputWidthWithRevision:", v29), (int)+[VCPVideoTransformerBackbone idealInputHeightWithRevision:](VCPVideoTransformerBackbone, "idealInputHeightWithRevision:", v29), 1111970369);
    v31 = (void **)(v14 + 92);
    v32 = *v31;
    *v31 = v30;

    if (!*v31)
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_25;
      }
      v34 = VCPLogInstance();
      os_log_type_t v44 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v34, v44))
      {
        v45 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        uint64_t v52 = (uint64_t)v45;
        id v46 = v45;
        _os_log_impl((void *)&_mh_execute_header, v34, v44, "[%@] Failed to create VCPPoolBasedPixelBufferCreator for embedding", buf, 0xCu);
      }
      goto LABEL_12;
    }
  }
LABEL_8:
  v33 = v15;
LABEL_26:

  return v33;
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

- (void)dealloc
{
  v3 = +[VNSession globalSession];
  [v3 releaseCachedResources];

  MediaAnalysisPurgeResources();
  v4.receiver = self;
  v4.super_class = (Class)VCPMADSceneLibraryProcessingTask;
  [(VCPMADSceneLibraryProcessingTask *)&v4 dealloc];
}

+ (NSString)name
{
  return (NSString *)@"Scene";
}

+ (unint64_t)taskID
{
  return 2;
}

- (BOOL)shouldProcessAsset:(id)a3
{
  return objc_msgSend(a3, "vcp_needSceneProcessing");
}

- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5
{
  v5 = +[VCPMADSceneAssetBatch batchWithAnalysisDatabase:a3 cancelBlock:a5 monochromeBufferCreator:*(id *)((char *)&self->super._progressHandler + 4) imageLoader:*(VCPPoolBasedPixelBufferCreator **)((char *)&self->_monochromeBufferCreator + 4) session:*(VCPPreAnalysisImageLoader **)((char *)&self->_imageLoader + 4) ivsPool:*(VNSession **)((char *)&self->_session + 4) rotationModel:*(VCPObjectPool **)((char *)&self->_ivsPool + 4) rotationBufferCreator:*(VCPMAMLModel **)((char *)&self->_rotationModel + 4) embeddingBufferCreator:*(VCPPoolBasedPixelBufferCreator **)((char *)&self->_rotationBufferCreator + 4)];
  return v5;
}

- (id)assetPriorities
{
  return &off_100230530;
}

- (int)_dataMigrationWithAssets:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() name];
  v6 = +[NSString stringWithFormat:@"[%@][Embedding][Migration]", v5];

  v29.receiver = self;
  v29.super_class = (Class)VCPMADSceneLibraryProcessingTask;
  v7 = [(VCPMADSceneLibraryProcessingTask *)&v29 cancelBlock];
  if (!v7
    || (v28.receiver = self,
        v28.super_class = (Class)VCPMADSceneLibraryProcessingTask,
        [(VCPMADSceneLibraryProcessingTask *)&v28 cancelBlock],
        v8 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
        int v9 = v8[2](),
        v8,
        v7,
        !v9))
  {
    id v13 = +[VCPWatchdog sharedWatchdog];
    [v13 pet];

    v14 = VCPSignPostLog();
    os_signpost_id_t v15 = os_signpost_id_generate(v14);

    id v16 = VCPSignPostLog();
    id v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "VCPMADPhotosLibraryProcessingTask_Migration_ProcessingBatch", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    v18 = [v4 firstObject];
    id v10 = [v18 photoLibrary];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000EFB40;
    v26[3] = &unk_100219FC8;
    id v27 = v4;
    id v25 = 0;
    unsigned __int8 v19 = [v10 performChangesAndWait:v26 error:&v25];
    id v20 = v25;
    if (v19)
    {
      id v21 = VCPSignPostLog();
      v22 = v21;
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, v15, "VCPMADPhotosLibraryProcessingTask_Migration_ProcessingBatch", (const char *)&unk_1001F3BD3, buf, 2u);
      }
      int v12 = 0;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v12 = -18;
        goto LABEL_21;
      }
      v22 = VCPLogInstance();
      os_log_type_t v23 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v22, v23))
      {
        *(_DWORD *)buf = 138412546;
        v31 = v6;
        __int16 v32 = 2112;
        id v33 = v20;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "%@ Failed to migrate Image embedding - %@", buf, 0x16u);
      }
      int v12 = -18;
    }

LABEL_21:
    goto LABEL_22;
  }
  if ((int)MediaAnalysisLogLevel() < 5)
  {
    int v12 = -128;
    goto LABEL_23;
  }
  id v10 = VCPLogInstance();
  os_log_type_t v11 = VCPLogToOSLogType[5];
  if (os_log_type_enabled(v10, v11))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "%@ Processing cancelled", buf, 0xCu);
  }
  int v12 = -128;
LABEL_22:

LABEL_23:
  return v12;
}

- (int)_dataMigrationIfNeededForPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4 andProgress:(id)a5
{
  id v66 = a3;
  id v70 = a4;
  id v65 = a5;
  v8 = [(id)objc_opt_class() name];
  v69 = +[NSString stringWithFormat:@"[%@][Embedding][Migration]", v8];

  id v9 = objc_msgSend(v70, "valueForKey:");
  if (v9)
  {
    id v67 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)(uint64_t)v9];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v10 = VCPLogInstance();
      os_log_type_t v11 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v10, v11))
      {
        int v12 = +[VCPLogManager dateFormatterDateTime];
        id v13 = [v12 stringFromDate:v67];
        *(_DWORD *)buf = 138412546;
        v79 = v69;
        __int16 v80 = 2112;
        id v81 = v13;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "%@ Image embedding to Scene Processing migrated (%@)", buf, 0x16u);
      }
    }
    LODWORD(v14) = 0;
LABEL_68:

    goto LABEL_69;
  }
  v77.receiver = self;
  v77.super_class = (Class)VCPMADSceneLibraryProcessingTask;
  os_signpost_id_t v15 = [(VCPMADSceneLibraryProcessingTask *)&v77 cancelBlock];
  if (!v15
    || (v76.receiver = self,
        v76.super_class = (Class)VCPMADSceneLibraryProcessingTask,
        [(VCPMADSceneLibraryProcessingTask *)&v76 cancelBlock],
        id v16 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
        int v17 = v16[2](),
        v16,
        v15,
        !v17))
  {
    id v20 = +[VCPWatchdog sharedWatchdog];
    [v20 pet];

    LOWORD(v60) = 0;
    id v67 = objc_msgSend(objc_alloc((Class)PHMediaProcessingAlgorithmVersionProvider), "initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:", 0, 0, 0, 0, 0, 0, v60, 0, 0x4600000000);
    id v21 = VCPSignPostLog();
    os_signpost_id_t v22 = os_signpost_id_generate(v21);

    os_log_type_t v23 = VCPSignPostLog();
    v24 = v23;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "VCPMADPhotosLibraryProcessingTask_Migration_FetchAssets", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    id v25 = +[MADStateHandler sharedStateHandler];
    [v25 addBreadcrumb:@"%@ Fetching for Scene Embedding migration", v69];

    id v75 = 0;
    v68 = objc_msgSend(v66, "fetchAssetsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:error:", objc_msgSend((id)objc_opt_class(), "taskID"), 0, v67, &v75, 0.0);
    id v63 = v75;
    v26 = VCPSignPostLog();
    id v27 = v26;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_END, v22, "VCPMADPhotosLibraryProcessingTask_Migration_FetchAssets", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if (v63)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        objc_super v28 = VCPLogInstance();
        os_log_type_t v29 = VCPLogToOSLogType[3];
        v64 = v28;
        if (os_log_type_enabled(v28, v29))
        {
          *(_DWORD *)buf = 138412546;
          v79 = v69;
          __int16 v80 = 2112;
          id v81 = v63;
          _os_log_impl((void *)&_mh_execute_header, v28, v29, "%@ Failed to fetch assets: %@", buf, 0x16u);
        }
        LODWORD(v14) = -18;
        goto LABEL_66;
      }
      LODWORD(v14) = -18;
      goto LABEL_67;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v30 = VCPLogInstance();
      os_log_type_t v31 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v30, v31))
      {
        unsigned int v32 = [v68 count];
        *(_DWORD *)buf = 138412546;
        v79 = v69;
        __int16 v80 = 1024;
        LODWORD(v81) = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "%@ Fetched %d assets", buf, 0x12u);
      }
    }
    id v33 = +[MADStateHandler sharedStateHandler];
    [v33 addBreadcrumb:@"%@ Fetched for Scene Embedding migration with %d assets", v69, objc_msgSend(v68, "count")];

    v74.receiver = self;
    v74.super_class = (Class)VCPMADSceneLibraryProcessingTask;
    v34 = [(VCPMADSceneLibraryProcessingTask *)&v74 cancelBlock];
    if (v34)
    {
      v73.receiver = self;
      v73.super_class = (Class)VCPMADSceneLibraryProcessingTask;
      os_log_type_t v35 = [(VCPMADSceneLibraryProcessingTask *)&v73 cancelBlock];
      int v36 = v35[2]();

      if (v36)
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v37 = VCPLogInstance();
          os_log_type_t v38 = VCPLogToOSLogType[5];
          v64 = v37;
          if (os_log_type_enabled(v37, v38))
          {
            *(_DWORD *)buf = 138412290;
            v79 = v69;
            _os_log_impl((void *)&_mh_execute_header, v37, v38, "%@ Processing cancelled", buf, 0xCu);
          }
          LODWORD(v14) = -128;
          goto LABEL_66;
        }
        LODWORD(v14) = -128;
LABEL_67:

        goto LABEL_68;
      }
    }
    v14 = +[VCPWatchdog sharedWatchdog];
    [v14 pet];

    uint64_t v39 = VCPSignPostLog();
    os_signpost_id_t spid = os_signpost_id_generate(v39);

    v40 = VCPSignPostLog();
    v41 = v40;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADPhotosLibraryProcessingTask_Migration_Processing", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    v64 = +[NSMutableArray array];
    objc_msgSend(v65, "setTotalUnitCount:", objc_msgSend(v68, "count"));
    unint64_t v42 = 0;
    os_log_type_t type = VCPLogToOSLogType[5];
    while (1)
    {
      if (v42 >= (unint64_t)[v68 count])
      {
        if (![v64 count]) {
          goto LABEL_62;
        }
        LODWORD(v14) = [(VCPMADSceneLibraryProcessingTask *)self _dataMigrationWithAssets:v64];
        if (!v14)
        {
          [v64 removeAllObjects];
          objc_msgSend(v65, "setCompletedUnitCount:", (char *)objc_msgSend(v64, "count") + (void)objc_msgSend(v65, "completedUnitCount"));
        }
        if (!v14)
        {
LABEL_62:
          v55 = +[NSDate now];
          [v55 timeIntervalSinceReferenceDate];
          [v70 setValue:(uint64_t)v56 forKey:@"SceneImageEmbeddingMigrationTimestamp"];

          [v70 commit];
          v57 = VCPSignPostLog();
          v58 = v57;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v58, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADPhotosLibraryProcessingTask_Migration_Processing", (const char *)&unk_1001F3BD3, buf, 2u);
          }

          LODWORD(v14) = 0;
        }
LABEL_66:

        goto LABEL_67;
      }
      v72.receiver = self;
      v72.super_class = (Class)VCPMADSceneLibraryProcessingTask;
      os_log_type_t v44 = [(VCPMADSceneLibraryProcessingTask *)&v72 cancelBlock];
      if (v44
        && (v71.receiver = self,
            v71.super_class = (Class)VCPMADSceneLibraryProcessingTask,
            [(VCPMADSceneLibraryProcessingTask *)&v71 cancelBlock],
            v45 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
            int v46 = v45[2](),
            v45,
            v44,
            v46))
      {
        if ((int)MediaAnalysisLogLevel() < 5)
        {
          LODWORD(v14) = -128;
          int v48 = 1;
          goto LABEL_54;
        }
        os_log_type_t v47 = VCPLogInstance();
        if (os_log_type_enabled(v47, type))
        {
          *(_DWORD *)buf = 138412290;
          v79 = v69;
          _os_log_impl((void *)&_mh_execute_header, v47, type, "%@ Processing cancelled", buf, 0xCu);
        }
        LODWORD(v14) = -128;
        int v48 = 1;
      }
      else
      {
        v49 = +[VCPWatchdog sharedWatchdog];
        [v49 pet];

        os_log_type_t v47 = [v68 objectAtIndexedSubscript:v42];
        objc_super v50 = [v47 mediaAnalysisProperties];
        BOOL v51 = [v50 mediaAnalysisImageVersion] == 70;

        if (!v51) {
          goto LABEL_52;
        }
        [v64 addObject:v47];
        if ((unint64_t)[v64 count] < 0x64) {
          goto LABEL_52;
        }
        unsigned int v53 = [(VCPMADSceneLibraryProcessingTask *)self _dataMigrationWithAssets:v64];
        if (!v53)
        {
          [v64 removeAllObjects];
          objc_msgSend(v65, "setCompletedUnitCount:", (char *)objc_msgSend(v64, "count") + (void)objc_msgSend(v65, "completedUnitCount"));
        }
        if (v53)
        {
          int v48 = 1;
          LODWORD(v14) = v53;
        }
        else
        {
LABEL_52:
          int v48 = 0;
        }
      }

LABEL_54:
      ++v42;
      if (v48) {
        goto LABEL_66;
      }
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v18 = VCPLogInstance();
    os_log_type_t v19 = VCPLogToOSLogType[5];
    id v67 = v18;
    if (os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 138412290;
      v79 = v69;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "%@ Processing cancelled", buf, 0xCu);
    }
    LODWORD(v14) = -128;
    goto LABEL_68;
  }
  LODWORD(v14) = -128;
LABEL_69:

  return (int)v14;
}

- (int)processAllAssetsInPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4 andProgress:(id)a5
{
  id v66 = a3;
  id v65 = a4;
  id v8 = a5;
  v64 = v8;
  if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled])uint64_t v9 = 3; {
  else
  }
    uint64_t v9 = 1;
  [v8 setTotalUnitCount:v9];
  id v10 = objc_msgSend(v8, "vcp_childWithPendingUnitCount:", 1);
  v71.receiver = self;
  v71.super_class = (Class)VCPMADSceneLibraryProcessingTask;
  int v11 = [(VCPMADPhotosLibraryProcessingTask *)&v71 processAllAssetsInPhotoLibrary:v66 withAnalysisDatabase:v65 andProgress:v10];

  if (v11) {
    goto LABEL_61;
  }
  if (!+[VCPVideoCNNAnalyzer isMUBackboneEnabled])goto LABEL_60; {
  int v12 = [(id)objc_opt_class() name];
  }
  id v63 = +[NSString stringWithFormat:@"[%@][Embedding]", v12];

  BOOL v13 = (int)MediaAnalysisLogLevel() < 5;
  v14 = v64;
  if (!v13)
  {
    os_signpost_id_t v15 = VCPLogInstance();
    os_log_type_t v16 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v73 = v63;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "%@ Evaluating all assets in Photo Library", buf, 0xCu);
    }

    v14 = v64;
  }
  int v17 = objc_msgSend(v14, "vcp_childWithPendingUnitCount:", 1);
  int v11 = [(VCPMADSceneLibraryProcessingTask *)self _dataMigrationIfNeededForPhotoLibrary:v66 withAnalysisDatabase:v65 andProgress:v17];

  if (v11)
  {
    int v18 = 1;
    goto LABEL_59;
  }
  LOWORD(v56) = 0;
  id v62 = objc_msgSend(objc_alloc((Class)PHMediaProcessingAlgorithmVersionProvider), "initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:", 0, 0, 0, 0, 0, 0, v56, 0, 0x4600000000);
  os_log_type_t v19 = [(VCPMADSceneLibraryProcessingTask *)self assetPriorities];
  v59 = objc_msgSend(v64, "vcp_childWithPendingUnitCount:", objc_msgSend(v19, "count"));
  int v11 = 0;
  uint64_t v20 = 1;
  os_log_type_t v60 = VCPLogToOSLogType[3];
  os_log_type_t type = VCPLogToOSLogType[5];
  os_log_type_t v57 = VCPLogToOSLogType[6];
  while (1)
  {
    id v21 = v19;
    if (v20 - 1 >= (unint64_t)[v19 count]) {
      break;
    }
    v70.receiver = self;
    v70.super_class = (Class)VCPMADSceneLibraryProcessingTask;
    os_log_type_t v23 = [(VCPMADSceneLibraryProcessingTask *)&v70 cancelBlock];
    if (v23
      && (v69.receiver = self,
          v69.super_class = (Class)VCPMADSceneLibraryProcessingTask,
          [(VCPMADSceneLibraryProcessingTask *)&v69 cancelBlock],
          v24 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
          int v25 = v24[2](),
          v24,
          v23,
          v25))
    {
      if ((int)MediaAnalysisLogLevel() < 5)
      {
        int v11 = -128;
        BOOL v27 = 1;
        goto LABEL_45;
      }
      v26 = VCPLogInstance();
      if (os_log_type_enabled(v26, type))
      {
        *(_DWORD *)buf = 138412290;
        objc_super v73 = v63;
        _os_log_impl((void *)&_mh_execute_header, v26, type, "%@ Processing cancelled", buf, 0xCu);
      }
      int v11 = -128;
      BOOL v27 = 1;
    }
    else
    {
      objc_super v28 = +[VCPWatchdog sharedWatchdog];
      [v28 pet];

      if ((unint64_t)[v19 count] >= 2 && (int)MediaAnalysisLogLevel() >= 5)
      {
        os_log_type_t v29 = VCPLogInstance();
        if (os_log_type_enabled(v29, type))
        {
          *(_DWORD *)buf = 138412546;
          objc_super v73 = v63;
          __int16 v74 = 2048;
          uint64_t v75 = v20;
          _os_log_impl((void *)&_mh_execute_header, v29, type, "%@ Evaluating P%lu assets", buf, 0x16u);
        }
      }
      id v30 = [v19 objectAtIndexedSubscript:v20 - 1];
      id v31 = [v30 unsignedIntegerValue];

      +[PHAsset mad_sceneConfidenceThresholdForTask:](PHAsset, "mad_sceneConfidenceThresholdForTask:", [(id)objc_opt_class() taskID]);
      int v33 = v32;
      v34 = +[MADStateHandler sharedStateHandler];
      [v34 addBreadcrumb:@"%@ Fetching Priority%lu assets (image embedding)", v63, v20];

      os_log_type_t v35 = VCPSignPostLog();
      os_signpost_id_t v36 = os_signpost_id_generate(v35);

      v37 = VCPSignPostLog();
      os_log_type_t v38 = v37;
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "VCPMADPhotosLibraryProcessingTask_FetchAssets_ImageEmbedding", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      id v39 = [(id)objc_opt_class() taskID];
      id v68 = 0;
      LODWORD(v40) = v33;
      v41 = [v66 fetchAssetsForMediaProcessingTaskID:v39 priority:v31 algorithmVersion:v62 sceneConfidenceThreshold:&v68 error:v40];
      v26 = v68;
      unint64_t v42 = VCPSignPostLog();
      uint32_t v43 = v42;
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_END, v36, "VCPMADPhotosLibraryProcessingTask_FetchAssets_ImageEmbedding", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      if (v26)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          os_log_type_t v44 = VCPLogInstance();
          if (os_log_type_enabled(v44, v60))
          {
            *(_DWORD *)buf = 138412546;
            objc_super v73 = v63;
            __int16 v74 = 2112;
            uint64_t v75 = (uint64_t)v26;
            _os_log_impl((void *)&_mh_execute_header, v44, v60, "%@ Failed to fetch assets: %@", buf, 0x16u);
          }
        }
        int v11 = -18;
        BOOL v27 = 1;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v45 = VCPLogInstance();
          if (os_log_type_enabled(v45, v57))
          {
            unsigned int v46 = [v41 count];
            *(_DWORD *)buf = 138412546;
            objc_super v73 = v63;
            __int16 v74 = 1024;
            LODWORD(v75) = v46;
            _os_log_impl((void *)&_mh_execute_header, v45, v57, "%@ Fetched %d assets", buf, 0x12u);
          }
        }
        os_log_type_t v47 = +[MADStateHandler sharedStateHandler];
        [v47 addBreadcrumb:@"%@ Fetched %d Priority%lu assets", v63, objc_msgSend(v41, "count"), v20];

        unsigned int v48 = [(VCPMADPhotosProcessingTask *)self processAssetsInFetchResult:v41 withAnalysisDatabase:v65 allowDownload:0 progress:v59];
        BOOL v27 = v48 != 0;
        if (v48) {
          int v11 = v48;
        }
      }
    }
LABEL_45:
    ++v20;
    os_log_type_t v19 = v21;
    if (v27)
    {
      int v18 = 1;
      goto LABEL_58;
    }
  }
  unsigned int v49 = [(VCPMADPhotosProcessingTask *)self waitForPublishing];
  if (v49)
  {
    int v18 = 1;
    int v11 = v49;
  }
  else
  {
    objc_super v50 = +[MADVectorDatabaseManager sharedDatabaseWithPhotoLibrary:v66];
    BOOL v51 = [(VCPMADSceneLibraryProcessingTask *)self cancelBlock];
    id v67 = 0;
    unsigned int v52 = [v50 rebuildWithForce:0 cancelBlock:v51 extendTimeoutBlock:&stru_10021DD40 error:&v67];
    id v53 = v67;

    if (v52)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        CFStringRef v54 = VCPLogInstance();
        if (os_log_type_enabled(v54, v60))
        {
          *(_DWORD *)buf = 138412546;
          objc_super v73 = v63;
          __int16 v74 = 2112;
          uint64_t v75 = (uint64_t)v53;
          _os_log_impl((void *)&_mh_execute_header, v54, v60, "%@ Failed to build VSKDB - %@", buf, 0x16u);
        }
      }
      int v18 = 1;
      int v11 = v52;
    }
    else
    {
      int v18 = 0;
    }
  }
LABEL_58:

LABEL_59:
  if (!v18) {
LABEL_60:
  }
    int v11 = 0;
LABEL_61:

  return v11;
}

- (BOOL)run:(id *)a3
{
  if (+[PFSceneTaxonomy mad_isExpectedTaxonomy])
  {
    v11.receiver = self;
    v11.super_class = (Class)VCPMADSceneLibraryProcessingTask;
    return [(VCPMADPhotosLibraryProcessingTask *)&v11 run:a3];
  }
  else
  {
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%@] MAD tracked taxonomy identifier is not the latest in Photos; skip scene processing",
    v6 = objc_opt_class());
    BOOL v13 = v6;
    v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v8 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v7];
    id v9 = *a3;
    *a3 = v8;

    id v10 = [(VCPMADSceneLibraryProcessingTask *)self completionHandler];
    ((void (**)(void, void, id))v10)[2](v10, 0, *a3);

    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_rotationBufferCreator + 4), 0);
  objc_storeStrong((id *)((char *)&self->_rotationModel + 4), 0);
  objc_storeStrong((id *)((char *)&self->_ivsPool + 4), 0);
  objc_storeStrong((id *)((char *)&self->_session + 4), 0);
  objc_storeStrong((id *)((char *)&self->_imageLoader + 4), 0);
  objc_storeStrong((id *)((char *)&self->_monochromeBufferCreator + 4), 0);
  objc_storeStrong((id *)((char *)&self->super._progressHandler + 4), 0);
}

@end