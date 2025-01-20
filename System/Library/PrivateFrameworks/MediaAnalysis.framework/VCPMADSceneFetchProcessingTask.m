@interface VCPMADSceneFetchProcessingTask
+ (NSString)name;
+ (unint64_t)taskID;
- (BOOL)run:(id *)a3;
- (BOOL)shouldProcessAsset:(id)a3;
- (VCPMADSceneFetchProcessingTask)initWithFetchBlock:(id)a3 photoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7;
- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5;
- (void)dealloc;
@end

@implementation VCPMADSceneFetchProcessingTask

- (VCPMADSceneFetchProcessingTask)initWithFetchBlock:(id)a3 photoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v53.receiver = self;
  v53.super_class = (Class)VCPMADSceneFetchProcessingTask;
  v17 = [(VCPMADPhotosFetchProcessingTask *)&v53 initWithFetchBlock:v12 photoLibraryWithURL:v13 cancelBlock:v14 progressHandler:v15 completionHandler:v16];
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
      v36 = 0;
      goto LABEL_26;
    }
    v37 = VCPLogInstance();
    os_log_type_t v38 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      uint64_t v55 = v39;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "[%@] Failed to create VCPPoolBasedPixelBufferCreator for monochrome", buf, 0xCu);
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

  uint64_t v26 = +[VCPObjectPool objectPoolWithAllocator:&stru_1002197D8];
  v27 = *(void **)(v17 + 76);
  *(void *)(v17 + 76) = v26;

  if (+[VCPPreAnalysisRequests includeRotation])
  {
    uint64_t v28 = +[VCPMAMLModel vcp_sharedModelWithModelName:@"MonzaV4_1"];
    v29 = *(void **)(v17 + 84);
    *(void *)(v17 + 84) = v28;

    if (*(void *)(v17 + 84))
    {
      id v30 = objc_msgSend(objc_alloc((Class)VCPPoolBasedPixelBufferCreator), "initWithBufferWidth:bufferHeight:andPixelFormat:", objc_msgSend(*(id *)(v17 + 84), "inputSize"), objc_msgSend(*(id *)(v17 + 84), "inputSize"), 1111970369);
      v31 = *(void **)(v17 + 92);
      *(void *)(v17 + 92) = v30;

      if (*(void *)(v17 + 92)) {
        goto LABEL_6;
      }
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_25;
      }
      v40 = VCPLogInstance();
      os_log_type_t v50 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v40, v50))
      {
        uint64_t v51 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        uint64_t v55 = v51;
        v43 = "[%@] Failed to create VCPPoolBasedPixelBufferCreator for rotation";
        v44 = v40;
        os_log_type_t v45 = v50;
        uint32_t v46 = 12;
        goto LABEL_23;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_25;
      }
      v40 = VCPLogInstance();
      os_log_type_t v41 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v40, v41))
      {
        uint64_t v42 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        uint64_t v55 = v42;
        __int16 v56 = 2112;
        CFStringRef v57 = @"MonzaV4_1";
        v43 = "[%@] Failed to load ProbableRotation model %@";
        v44 = v40;
        os_log_type_t v45 = v41;
        uint32_t v46 = 22;
LABEL_23:
        _os_log_impl((void *)&_mh_execute_header, v44, v45, v43, buf, v46);
      }
    }

    goto LABEL_25;
  }
LABEL_6:
  if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled])
  {
    id v32 = +[VCPVideoTransformerBackbone revision];
    id v33 = objc_msgSend(objc_alloc((Class)VCPPoolBasedPixelBufferCreator), "initWithBufferWidth:bufferHeight:andPixelFormat:", (int)+[VCPVideoTransformerBackbone idealInputWidthWithRevision:](VCPVideoTransformerBackbone, "idealInputWidthWithRevision:", v32), (int)+[VCPVideoTransformerBackbone idealInputHeightWithRevision:](VCPVideoTransformerBackbone, "idealInputHeightWithRevision:", v32), 1111970369);
    v34 = (void **)(v17 + 100);
    v35 = *v34;
    *v34 = v33;

    if (!*v34)
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_25;
      }
      v37 = VCPLogInstance();
      os_log_type_t v47 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v37, v47))
      {
        v48 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        uint64_t v55 = (uint64_t)v48;
        id v49 = v48;
        _os_log_impl((void *)&_mh_execute_header, v37, v47, "[%@] Failed to create VCPPoolBasedPixelBufferCreator for embedding", buf, 0xCu);
      }
      goto LABEL_12;
    }
  }
LABEL_8:
  v36 = v18;
LABEL_26:

  return v36;
}

- (void)dealloc
{
  v3 = +[VNSession globalSession];
  [v3 releaseCachedResources];

  MediaAnalysisPurgeResources();
  v4.receiver = self;
  v4.super_class = (Class)VCPMADSceneFetchProcessingTask;
  [(VCPMADSceneFetchProcessingTask *)&v4 dealloc];
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
    v11.super_class = (Class)VCPMADSceneFetchProcessingTask;
    return [(VCPMADPhotosFetchProcessingTask *)&v11 run:a3];
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

    v10 = [(VCPMADSceneFetchProcessingTask *)self completionHandler];
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