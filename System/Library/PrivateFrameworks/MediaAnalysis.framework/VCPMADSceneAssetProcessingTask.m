@interface VCPMADSceneAssetProcessingTask
+ (NSString)name;
+ (unint64_t)taskID;
- (BOOL)run:(id *)a3;
- (BOOL)shouldProcessAsset:(id)a3;
- (VCPMADSceneAssetProcessingTask)initWithLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7;
- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5;
- (void)dealloc;
@end

@implementation VCPMADSceneAssetProcessingTask

- (VCPMADSceneAssetProcessingTask)initWithLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v55.receiver = self;
  v55.super_class = (Class)VCPMADSceneAssetProcessingTask;
  v17 = [(VCPMADPhotoAssetProcessingTask *)&v55 initWithLocalIdentifiers:v12 fromPhotoLibraryWithURL:v13 cancelBlock:v14 progressHandler:v15 completionHandler:v16];
  v18 = v17;
  if (!v17) {
    goto LABEL_8;
  }
  +[VCPPreAnalysisRequests asyncCacheRequestIdealDimension];
  +[VCPPreAnalysisRequests asyncLoadSharedPhotoFormatsObjects];
  id v19 = objc_alloc((Class)VCPPoolBasedPixelBufferCreator);
  id v20 = [v19 initWithBufferWidth:kVCPMAPreAnalysisScaledSize bufferHeight:kVCPMAPreAnalysisScaledSize andPixelFormat:1278226488];
  v21 = *(void **)(v17 + 52);
  *(void *)(v17 + 52) = v20;

  if (!*(void *)(v17 + 52))
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
LABEL_25:
      v38 = 0;
      goto LABEL_26;
    }
    v39 = VCPLogInstance();
    os_log_type_t v40 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      uint64_t v57 = v41;
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "[%@] Failed to create VCPPoolBasedPixelBufferCreator for monochrome", buf, 0xCu);
    }
LABEL_12:

    goto LABEL_25;
  }
  id v22 = [objc_alloc((Class)VCPPreAnalysisImageLoader) initWithMonochromeBufferCreator:*(void *)(v17 + 52)];
  v23 = *(void **)(v17 + 60);
  *(void *)(v17 + 60) = v22;

  id v24 = objc_alloc_init((Class)VNSession);
  v25 = *(void **)(v17 + 68);
  *(void *)(v17 + 68) = v24;

  uint64_t v26 = +[VCPObjectPool objectPoolWithAllocator:&stru_10021A488];
  v27 = *(void **)(v17 + 76);
  *(void *)(v17 + 76) = v26;

  if (+[VCPPreAnalysisRequests includeRotation])
  {
    v28 = +[MADStateHandler sharedStateHandler];
    [v28 enterKnownTimeoutRisk:3];

    uint64_t v29 = +[VCPMAMLModel vcp_sharedModelWithModelName:@"MonzaV4_1"];
    v30 = *(void **)(v17 + 84);
    *(void *)(v17 + 84) = v29;

    v31 = +[MADStateHandler sharedStateHandler];
    [v31 exitKnownTimeoutRisk];

    if (*(void *)(v17 + 84))
    {
      id v32 = objc_msgSend(objc_alloc((Class)VCPPoolBasedPixelBufferCreator), "initWithBufferWidth:bufferHeight:andPixelFormat:", objc_msgSend(*(id *)(v17 + 84), "inputSize"), objc_msgSend(*(id *)(v17 + 84), "inputSize"), 1111970369);
      v33 = *(void **)(v17 + 92);
      *(void *)(v17 + 92) = v32;

      if (*(void *)(v17 + 92)) {
        goto LABEL_6;
      }
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_25;
      }
      v42 = VCPLogInstance();
      os_log_type_t v52 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v42, v52))
      {
        uint64_t v53 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        uint64_t v57 = v53;
        v45 = "[%@] Failed to create VCPPoolBasedPixelBufferCreator for rotation";
        v46 = v42;
        os_log_type_t v47 = v52;
        uint32_t v48 = 12;
        goto LABEL_23;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_25;
      }
      v42 = VCPLogInstance();
      os_log_type_t v43 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v42, v43))
      {
        uint64_t v44 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        uint64_t v57 = v44;
        __int16 v58 = 2112;
        CFStringRef v59 = @"MonzaV4_1";
        v45 = "[%@] Failed to load ProbableRotation model %@";
        v46 = v42;
        os_log_type_t v47 = v43;
        uint32_t v48 = 22;
LABEL_23:
        _os_log_impl((void *)&_mh_execute_header, v46, v47, v45, buf, v48);
      }
    }

    goto LABEL_25;
  }
LABEL_6:
  if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled])
  {
    id v34 = +[VCPVideoTransformerBackbone revision];
    id v35 = objc_msgSend(objc_alloc((Class)VCPPoolBasedPixelBufferCreator), "initWithBufferWidth:bufferHeight:andPixelFormat:", (int)+[VCPVideoTransformerBackbone idealInputWidthWithRevision:](VCPVideoTransformerBackbone, "idealInputWidthWithRevision:", v34), (int)+[VCPVideoTransformerBackbone idealInputHeightWithRevision:](VCPVideoTransformerBackbone, "idealInputHeightWithRevision:", v34), 1111970369);
    v36 = (void **)(v17 + 100);
    v37 = *v36;
    *v36 = v35;

    if (!*v36)
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_25;
      }
      v39 = VCPLogInstance();
      os_log_type_t v49 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v39, v49))
      {
        v50 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        uint64_t v57 = (uint64_t)v50;
        id v51 = v50;
        _os_log_impl((void *)&_mh_execute_header, v39, v49, "[%@] Failed to create VCPPoolBasedPixelBufferCreator for embedding", buf, 0xCu);
      }
      goto LABEL_12;
    }
  }
LABEL_8:
  v38 = v18;
LABEL_26:

  return v38;
}

- (void)dealloc
{
  v3 = +[VNSession globalSession];
  [v3 releaseCachedResources];

  MediaAnalysisPurgeResources();
  v4.receiver = self;
  v4.super_class = (Class)VCPMADSceneAssetProcessingTask;
  [(VCPMADSceneAssetProcessingTask *)&v4 dealloc];
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

- (BOOL)run:(id *)a3
{
  if (+[PFSceneTaxonomy mad_isExpectedTaxonomy])
  {
    v11.receiver = self;
    v11.super_class = (Class)VCPMADSceneAssetProcessingTask;
    return [(VCPMADPhotoAssetProcessingTask *)&v11 run:a3];
  }
  else
  {
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%@] MAD tracked taxonomy identifier is not the latest in Photos; skip scene processing",
    v6 = objc_opt_class());
    id v13 = v6;
    v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    v8 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v7];
    id v9 = *a3;
    *a3 = v8;

    v10 = [(VCPMADSceneAssetProcessingTask *)self completionHandler];
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