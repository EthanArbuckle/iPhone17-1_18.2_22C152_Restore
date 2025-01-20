@interface VCPPreAnalyzer
+ (BOOL)_allowANE;
+ (BOOL)_enableSceneAssetConcurrency;
+ (BOOL)_includeCN;
+ (BOOL)_includeDMF;
+ (BOOL)_includeDO;
+ (BOOL)_includeDocument;
+ (BOOL)_includeIVS;
+ (BOOL)_includeLM;
+ (BOOL)_includeMeme;
+ (BOOL)_includeNSFW;
+ (BOOL)_includePA;
+ (BOOL)_includeRotation;
+ (BOOL)_includeSDG;
+ (BOOL)_includeSE;
+ (BOOL)_includeSO;
+ (BOOL)_includeWP;
+ (BOOL)_isMovieWithMediaType:(int64_t)a3;
+ (BOOL)_isPanoWithMediaType:(int64_t)a3 andMediaSubtypes:(unint64_t)a4;
+ (BOOL)_isSDOFWithMediaType:(int64_t)a3 andMediaSubtypes:(unint64_t)a4;
+ (BOOL)_useR14J9;
+ (id)_nonPanoPreWarmDimensions;
+ (unint64_t)_getSHRevision;
- (VCPPreAnalyzer)init;
- (id)_extractAndSortBoundingBoxFromDetectedObjects:(id)a3;
- (id)_processBoundingBoxFromDetectedObjects:(id)a3 forSceneClassID:(id)a4;
- (int)_collectSceneAnalysisResults:(id *)a3 fromRequests:(id)a4 wpResults:(id)a5 ivsResults:(id)a6 abnormalDimension:(unint64_t)a7;
- (int)_createRequests:(id)a3 withMediaType:(int64_t)a4;
- (int)_performAnalysis:(id *)a3 mediaType:(int64_t)a4 mediaSubtypes:(unint64_t)a5 abnormalDimension:(unint64_t)a6 colorPixelBuffer:(__CVBuffer *)a7 andLumaPixelBuffer:(__CVBuffer *)a8 image:(id)a9;
- (int)_performBlurAnalysis:(id *)a3 withLumaPixelBuffer:(__CVBuffer *)a4 abnormalDimension:(unint64_t)a5 isSDOF:(BOOL)a6;
- (int)_performBlurAnalysis:(id *)a3 withPixelBuffer:(__CVBuffer *)a4 usingAnalyzer:(id)a5;
- (int)_performEmbeddingAnalysis:(id *)a3 withColorPixelBuffer:(__CVBuffer *)a4;
- (int)_performExposureAnalysis:(id *)a3 withLumaPixelBuffer:(__CVBuffer *)a4;
- (int)_performRotationAnalysis:(id *)a3 withColorPixelBuffer:(__CVBuffer *)a4;
- (int)_performSceneAnalysis:(id *)a3 image:(id)a4 mediaType:(int64_t)a5 mediaSubtypes:(unint64_t)a6 abnormalDimension:(unint64_t)a7;
- (int)_performWallpaperAnalysis:(id *)a3 withSceneprint:(id)a4;
- (void)_configureRequest:(id)a3;
- (void)_configureRequest:(id)a3 withRevision:(unint64_t)a4;
- (void)_generateSceneClassifications:(id)a3 fromRequests:(id)a4;
- (void)_insertBoundingBox:(id)a3 toSortedBoundingBoxes:(id)a4;
- (void)_parseClassificationObservations:(id)a3 toClassificationResults:(id)a4;
- (void)_parseClassificationObservations:(id)a3 withPrefix:(id)a4 toClassificationResults:(id)a5;
- (void)_parsePhotosTaxonomyClassificationObservations:(id)a3 toClassificationResults:(id)a4 andDetectorSceneClassIds:(id)a5 isEntityNet:(BOOL)a6;
- (void)analyzeWithImageURL:(id)a3 mediaType:(int64_t)a4 mediaSubtypes:(unint64_t)a5 abnormalDimension:(unint64_t)a6 completionHandler:(id)a7;
@end

@implementation VCPPreAnalyzer

+ (BOOL)_allowANE
{
  return 1;
}

+ (BOOL)_includeNSFW
{
  return 1;
}

+ (BOOL)_includeLM
{
  return 1;
}

+ (BOOL)_includeSE
{
  return 1;
}

+ (BOOL)_includeSDG
{
  return 1;
}

+ (BOOL)_includeWP
{
  return 1;
}

+ (BOOL)_includeDO
{
  return 1;
}

+ (BOOL)_includeSO
{
  return 1;
}

+ (BOOL)_includeMeme
{
  return 1;
}

+ (BOOL)_includeRotation
{
  return 1;
}

+ (BOOL)_includeDocument
{
  return 1;
}

+ (BOOL)_includeIVS
{
  return 1;
}

+ (BOOL)_includePA
{
  return 1;
}

+ (BOOL)_includeCN
{
  return 1;
}

+ (BOOL)_useR14J9
{
  return 1;
}

+ (unint64_t)_getSHRevision
{
  v2 = &OBJC_METACLASS___VCPPhotoAnalyzer;
  {
    v2 = &OBJC_METACLASS___VCPPhotoAnalyzer;
    if (v4)
    {
      +[VCPPreAnalyzer _getSHRevision]::revision = 2;
      v2 = &OBJC_METACLASS___VCPPhotoAnalyzer;
    }
  }
  return (unint64_t)v2[44].isa;
}

+ (BOOL)_enableSceneAssetConcurrency
{
  return 0;
}

+ (BOOL)_includeDMF
{
  return 1;
}

+ (BOOL)_isPanoWithMediaType:(int64_t)a3 andMediaSubtypes:(unint64_t)a4
{
  return (a3 == 1) & a4;
}

+ (BOOL)_isSDOFWithMediaType:(int64_t)a3 andMediaSubtypes:(unint64_t)a4
{
  return a3 == 1 && (a4 & 0x10) != 0;
}

+ (BOOL)_isMovieWithMediaType:(int64_t)a3
{
  return a3 == 2;
}

+ (id)_nonPanoPreWarmDimensions
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__VCPPreAnalyzer__nonPanoPreWarmDimensions__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VCPPreAnalyzer _nonPanoPreWarmDimensions]::once != -1) {
    dispatch_once(&+[VCPPreAnalyzer _nonPanoPreWarmDimensions]::once, block);
  }
  v2 = (void *)+[VCPPreAnalyzer _nonPanoPreWarmDimensions]::cachedDimensions;
  return v2;
}

void __43__VCPPreAnalyzer__nonPanoPreWarmDimensions__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CA48] array];
  v1 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", 299.0, 299.0);
  [v0 addObject:v1];

  if ([(id)objc_opt_class() _includeMeme])
  {
    v2 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", 360.0, 360.0);
    [v0 addObject:v2];
  }
  if ([(id)objc_opt_class() _includeDocument])
  {
    v3 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", 256.0, 256.0);
    [v0 addObject:v3];
  }
  int v4 = (void *)+[VCPPreAnalyzer _nonPanoPreWarmDimensions]::cachedDimensions;
  +[VCPPreAnalyzer _nonPanoPreWarmDimensions]::cachedDimensions = (uint64_t)v0;
}

- (VCPPreAnalyzer)init
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)VCPPreAnalyzer;
  v2 = [(VCPPreAnalyzer *)&v27 init];
  if (!v2) {
    goto LABEL_18;
  }
  +[VCPPreAnalysisRequests asyncCacheRequestIdealDimension];
  +[VCPPreAnalysisRequests asyncLoadSharedPhotoFormatsObjects];
  dispatch_group_t v3 = dispatch_group_create();
  processingGroup = v2->_processingGroup;
  v2->_processingGroup = (OS_dispatch_group *)v3;

  dispatch_queue_t v5 = dispatch_queue_create("com.apple.mediaanalysis.SceneProcessingGroup", 0);
  processingQueue = v2->_processingQueue;
  v2->_processingQueue = (OS_dispatch_queue *)v5;

  uint64_t v7 = +[VCPObjectPool objectPoolWithAllocator:&__block_literal_global_60];
  sessionPool = v2->_sessionPool;
  v2->_sessionPool = (VCPObjectPool *)v7;

  v9 = [[VCPPoolBasedPixelBufferCreator alloc] initWithBufferWidth:299 bufferHeight:299 andPixelFormat:1278226488];
  monochromeBufferCreator = v2->_monochromeBufferCreator;
  v2->_monochromeBufferCreator = v9;

  if (!v2->_monochromeBufferCreator)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_ERROR, "[VCPPreAnalyzer] Failed to create VCPPoolBasedPixelBufferCreator for monochrome", buf, 2u);
      }
      goto LABEL_27;
    }
    goto LABEL_28;
  }
  v11 = [[VCPPreAnalysisImageLoader alloc] initWithMonochromeBufferCreator:v2->_monochromeBufferCreator];
  imageLoader = v2->_imageLoader;
  v2->_imageLoader = v11;

  if (![(id)objc_opt_class() _includeRotation]) {
    goto LABEL_6;
  }
  uint64_t v13 = +[VCPMAMLModel vcp_sharedModelWithModelName:@"MonzaV4_1"];
  rotationModel = v2->_rotationModel;
  v2->_rotationModel = (VCPMAMLModel *)v13;

  if (!v2->_rotationModel)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      p_super = VCPLogInstance();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v29 = @"MonzaV4_1";
        _os_log_impl(&dword_1BBEDA000, p_super, OS_LOG_TYPE_ERROR, " [ProbableRotation] Failed to load %@", buf, 0xCu);
      }
      v22 = 0;
      goto LABEL_9;
    }
LABEL_18:
    v22 = 0;
    goto LABEL_19;
  }
  v15 = [[VCPPoolBasedPixelBufferCreator alloc] initWithBufferWidth:[(VCPMAMLModel *)v2->_rotationModel inputSize] bufferHeight:[(VCPMAMLModel *)v2->_rotationModel inputSize] andPixelFormat:1111970369];
  rotationBufferCreator = v2->_rotationBufferCreator;
  v2->_rotationBufferCreator = v15;

  if (!v2->_rotationBufferCreator)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v25 = "[VCPPreAnalyzer] Failed to create VCPPoolBasedPixelBufferCreator for rotation";
        goto LABEL_26;
      }
LABEL_27:
    }
LABEL_28:
    v24 = 0;
    goto LABEL_29;
  }
LABEL_6:
  if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled])
  {
    int64_t v17 = +[VCPVideoTransformerBackbone revision];
    v18 = [[VCPPoolBasedPixelBufferCreator alloc] initWithBufferWidth:+[VCPVideoTransformerBackbone idealInputWidthWithRevision:](VCPVideoTransformerBackbone, "idealInputWidthWithRevision:", v17) bufferHeight:+[VCPVideoTransformerBackbone idealInputHeightWithRevision:v17] andPixelFormat:1111970369];
    embeddingBufferCreator = v2->_embeddingBufferCreator;
    v2->_embeddingBufferCreator = v18;

    if (!v2->_embeddingBufferCreator)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v23 = VCPLogInstance();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v25 = "[VCPPreAnalyzer] Failed to create VCPPoolBasedPixelBufferCreator for embedding";
LABEL_26:
          _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_ERROR, v25, buf, 2u);
          goto LABEL_27;
        }
        goto LABEL_27;
      }
      goto LABEL_28;
    }
  }
  uint64_t v20 = +[VCPObjectPool objectPoolWithAllocator:&__block_literal_global_244];
  p_super = &v2->_ivsPool->super;
  v2->_ivsPool = (VCPObjectPool *)v20;
  v22 = v2;
LABEL_9:

LABEL_19:
  v24 = v22;
LABEL_29:

  return v24;
}

id __22__VCPPreAnalyzer_init__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F45968]);
  return v0;
}

id __22__VCPPreAnalyzer_init__block_invoke_241()
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F9A610]);
  uint64_t v13 = *MEMORY[0x1E4F9A670];
  v14[0] = MEMORY[0x1E4F1CC38];
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  id v8 = 0;
  v2 = (void *)[v0 initWithOptions:v1 error:&v8];
  id v3 = v8;

  if (v3 && (int)MediaAnalysisLogLevel() >= 3)
  {
    int v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = (id)objc_opt_class();
      v6 = [v3 description];
      *(_DWORD *)buf = 138412546;
      id v10 = v5;
      __int16 v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "Failed to create %@: %@", buf, 0x16u);
    }
  }

  return v2;
}

- (void)_configureRequest:(id)a3
{
  id v4 = a3;
  [v4 setMetalContextPriority:1];
  [v4 setPreferBackgroundProcessing:1];
  if (DeviceHasANE() && [(id)objc_opt_class() _allowANE])
  {
    id v3 = [MEMORY[0x1E4F458E8] defaultANEDevice];
    [v4 setProcessingDevice:v3];
  }
}

- (void)_configureRequest:(id)a3 withRevision:(unint64_t)a4
{
  id v6 = a3;
  [v6 setRevision:a4];
  [(VCPPreAnalyzer *)self _configureRequest:v6];
}

- (int)_createRequests:(id)a3 withMediaType:(int64_t)a4
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F456E8]);
  [v6 setAestheticsRequest:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F45948]);
  [v6 setClassificationRequest:v8];

  id v9 = objc_alloc_init(MEMORY[0x1E4F45758]);
  [v6 setSceneprintRequest:v9];

  id v10 = objc_alloc_init(MEMORY[0x1E4F456F8]);
  [v6 setJunkImageRequest:v10];

  id v11 = objc_alloc_init(MEMORY[0x1E4F45820]);
  [v6 setSaliencyRequest:v11];

  v12 = [v6 aestheticsRequest];

  if (!v12)
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      goto LABEL_33;
    }
    v26 = VCPLogInstance();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_31;
    }
    *(_WORD *)buf = 0;
    v38 = "Failed to create VNClassifyImageAestheticsRequest";
LABEL_30:
    _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_ERROR, v38, buf, 2u);
    goto LABEL_31;
  }
  uint64_t v13 = [v6 classificationRequest];

  if (!v13)
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      goto LABEL_33;
    }
    v26 = VCPLogInstance();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_31;
    }
    *(_WORD *)buf = 0;
    v38 = "Failed to create VNSceneClassificationRequest";
    goto LABEL_30;
  }
  v14 = [v6 sceneprintRequest];

  if (!v14)
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      goto LABEL_33;
    }
    v26 = VCPLogInstance();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_31;
    }
    *(_WORD *)buf = 0;
    v38 = "Failed to create VNCreateSceneprintRequest";
    goto LABEL_30;
  }
  v15 = [v6 junkImageRequest];

  if (!v15)
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      goto LABEL_33;
    }
    v26 = VCPLogInstance();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_31;
    }
    *(_WORD *)buf = 0;
    v38 = "Failed to create VNClassifyJunkImageRequest";
    goto LABEL_30;
  }
  v16 = [v6 saliencyRequest];

  if (!v16)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v26 = VCPLogInstance();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      *(_WORD *)buf = 0;
      v38 = "Failed to create VNGenerateAttentionBasedSaliencyImageRequest";
      goto LABEL_30;
    }
LABEL_33:
    int v39 = -18;
    goto LABEL_34;
  }
  int64_t v17 = [v6 aestheticsRequest];
  [(VCPPreAnalyzer *)self _configureRequest:v17];

  v18 = [v6 classificationRequest];
  [(VCPPreAnalyzer *)self _configureRequest:v18];

  v19 = [v6 sceneprintRequest];
  [(VCPPreAnalyzer *)self _configureRequest:v19];

  uint64_t v20 = [v6 junkImageRequest];
  [(VCPPreAnalyzer *)self _configureRequest:v20];

  v21 = [v6 saliencyRequest];
  [(VCPPreAnalyzer *)self _configureRequest:v21];

  v22 = [v6 classificationRequest];
  [v22 setMaximumLeafObservations:15];

  v23 = [v6 classificationRequest];
  [v23 setMaximumHierarchicalObservations:15];

  v24 = [v6 aestheticsRequest];
  id v107 = 0;
  char v25 = [v24 setRevision:3737841667 error:&v107];
  v26 = v107;

  if (v25)
  {
    objc_super v27 = [v6 classificationRequest];
    v106 = v26;
    char v28 = [v27 setRevision:3737841665 error:&v106];
    v29 = v106;

    if ((v28 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v36 = VCPLogInstance();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
LABEL_45:
          int v39 = -18;
LABEL_46:
          v26 = v29;
          goto LABEL_47;
        }
        *(_DWORD *)buf = 134218242;
        uint64_t v109 = 3737841665;
        __int16 v110 = 2112;
        v111 = v29;
        v43 = "Failed to set VNSceneClassificationRequest::setRevision %lu: %@";
LABEL_44:
        _os_log_impl(&dword_1BBEDA000, v36, OS_LOG_TYPE_ERROR, v43, buf, 0x16u);
        goto LABEL_45;
      }
LABEL_141:
      int v39 = -18;
      v26 = v29;
      goto LABEL_32;
    }
    uint64_t v30 = [v6 sceneprintRequest];
    v105 = v29;
    char v31 = [v30 setRevision:3737841671 error:&v105];
    v26 = v105;

    if ((v31 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v36 = VCPLogInstance();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          goto LABEL_40;
        }
        *(_DWORD *)buf = 134218242;
        uint64_t v109 = 3737841671;
        __int16 v110 = 2112;
        v111 = v26;
        v37 = "Failed to set VNCreateSceneprintRequest::setRevision %lu: %@";
        goto LABEL_38;
      }
      goto LABEL_31;
    }
    v32 = [v6 saliencyRequest];
    v104 = v26;
    char v33 = [v32 setRevision:3737841667 error:&v104];
    v29 = v104;

    if ((v33 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v36 = VCPLogInstance();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          goto LABEL_45;
        }
        *(_DWORD *)buf = 134218242;
        uint64_t v109 = 3737841667;
        __int16 v110 = 2112;
        v111 = v29;
        v43 = "Failed to set VNGenerateAttentionBasedSaliencyImageRequest::setRevision %lu: %@";
        goto LABEL_44;
      }
      goto LABEL_141;
    }
    if ([(id)objc_opt_class() _useR14J9])
    {
      v34 = [v6 junkImageRequest];
      v103 = v29;
      char v35 = [v34 setRevision:3737841669 error:&v103];
      v26 = v103;

      if ((v35 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v36 = VCPLogInstance();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218242;
            uint64_t v109 = 3737841669;
            __int16 v110 = 2112;
            v111 = v26;
            v37 = "Failed to set VNClassifyJunkImageRequest::setRevision %lu: %@";
LABEL_38:
            v41 = v36;
            uint32_t v42 = 22;
LABEL_39:
            _os_log_impl(&dword_1BBEDA000, v41, OS_LOG_TYPE_ERROR, v37, buf, v42);
            goto LABEL_40;
          }
          goto LABEL_40;
        }
        goto LABEL_31;
      }
    }
    else
    {
      v26 = v29;
    }
    if ([(id)objc_opt_class() _includeDO])
    {
      id v44 = objc_alloc_init(MEMORY[0x1E4F45910]);
      [v6 setObjectRequest:v44];

      v45 = [v6 objectRequest];
      LODWORD(v44) = v45 == 0;

      if (v44)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_31;
        }
        v36 = VCPLogInstance();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          goto LABEL_40;
        }
        uint64_t v89 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        uint64_t v109 = v89;
        v37 = "Failed to create %@";
        goto LABEL_145;
      }
      v46 = [v6 objectRequest];
      [(VCPPreAnalyzer *)self _configureRequest:v46];

      v47 = [v6 objectRequest];
      v102 = v26;
      char v48 = [v47 setRevision:3737841667 error:&v102];
      v29 = v102;

      if ((v48 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v36 = VCPLogInstance();
          if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            goto LABEL_45;
          }
          *(_DWORD *)buf = 134218242;
          uint64_t v109 = 3737841667;
          __int16 v110 = 2112;
          v111 = v29;
          v43 = "Failed to set VNRecognizeObjectsRequest::setRevision %lu: %@";
          goto LABEL_44;
        }
        goto LABEL_141;
      }
      v26 = v29;
    }
    if ([(id)objc_opt_class() _includeSO])
    {
      id v49 = objc_alloc_init(MEMORY[0x1E4F45848]);
      [v6 setSaliencyObjectnessRequest:v49];

      v50 = [v6 saliencyObjectnessRequest];
      LODWORD(v49) = v50 == 0;

      if (v49)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_31;
        }
        v36 = VCPLogInstance();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          goto LABEL_40;
        }
        uint64_t v90 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        uint64_t v109 = v90;
        v37 = "Failed to create %@";
        goto LABEL_145;
      }
      v51 = [v6 saliencyObjectnessRequest];
      v101 = v26;
      char v52 = [v51 setRevision:3737841666 error:&v101];
      v29 = v101;

      if ((v52 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v36 = VCPLogInstance();
          if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            goto LABEL_45;
          }
          *(_DWORD *)buf = 134218242;
          uint64_t v109 = 3737841666;
          __int16 v110 = 2112;
          v111 = v29;
          v43 = "Failed to set VNGenerateObjectnessBasedSaliencyImageRequest::setRevision %lu: %@";
          goto LABEL_44;
        }
        goto LABEL_141;
      }
      v26 = v29;
    }
    if ([(id)objc_opt_class() _includeSE])
    {
      id v53 = objc_alloc_init(MEMORY[0x1E4F456A0]);
      [v6 setTabooRequest:v53];

      v54 = [v6 tabooRequest];
      LODWORD(v53) = v54 == 0;

      if (v53)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_31;
        }
        v36 = VCPLogInstance();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          goto LABEL_40;
        }
        uint64_t v91 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        uint64_t v109 = v91;
        v37 = "Failed to create %@";
        goto LABEL_145;
      }
      v55 = [v6 tabooRequest];
      [(VCPPreAnalyzer *)self _configureRequest:v55];

      v56 = [v6 tabooRequest];
      v100 = v26;
      char v57 = [v56 setRevision:2 error:&v100];
      v29 = v100;

      if ((v57 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v36 = VCPLogInstance();
          if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            goto LABEL_45;
          }
          *(_DWORD *)buf = 134218242;
          uint64_t v109 = 2;
          __int16 v110 = 2112;
          v111 = v29;
          v43 = "Failed to set VNClassifySignificantEventRequest::setRevision %lu: %@";
          goto LABEL_44;
        }
        goto LABEL_141;
      }
      v26 = v29;
    }
    if ([(id)objc_opt_class() _includeSDG])
    {
      id v58 = objc_alloc_init(MEMORY[0x1E4F45698]);
      [v6 setSemanticRequest:v58];

      v59 = [v6 semanticRequest];
      LODWORD(v58) = v59 == 0;

      if (v58)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_31;
        }
        v36 = VCPLogInstance();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          goto LABEL_40;
        }
        uint64_t v92 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        uint64_t v109 = v92;
        v37 = "Failed to create %@";
        goto LABEL_145;
      }
      v60 = [v6 semanticRequest];
      [(VCPPreAnalyzer *)self _configureRequest:v60];

      v61 = [v6 semanticRequest];
      v99 = v26;
      char v62 = [v61 setRevision:3737841667 error:&v99];
      v29 = v99;

      if ((v62 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v36 = VCPLogInstance();
          if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            goto LABEL_45;
          }
          *(_DWORD *)buf = 134218242;
          uint64_t v109 = 3737841667;
          __int16 v110 = 2112;
          v111 = v29;
          v43 = "Failed to set VNClassifySemanticDevelopmentGatingRequest::setRevision %lu: %@";
          goto LABEL_44;
        }
        goto LABEL_141;
      }
      v26 = v29;
    }
    if ([(id)objc_opt_class() _includeMeme])
    {
      id v63 = objc_alloc_init(MEMORY[0x1E4F45700]);
      [v6 setMemeRequest:v63];

      v64 = [v6 memeRequest];
      LODWORD(v63) = v64 == 0;

      if (v63)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_31;
        }
        v36 = VCPLogInstance();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          goto LABEL_40;
        }
        goto LABEL_125;
      }
      v65 = [v6 memeRequest];
      [(VCPPreAnalyzer *)self _configureRequest:v65 withRevision:3];
    }
    if (![(id)objc_opt_class() _includeDocument]) {
      goto LABEL_76;
    }
    v66 = objc_msgSend(MEMORY[0x1E4F45900], "vcp_sceneRequest");
    [v6 setDocumentRequest:v66];

    v67 = [v6 documentRequest];
    LODWORD(v66) = v67 == 0;

    if (v66)
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_31;
      }
      v36 = VCPLogInstance();
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
    }
    else
    {
LABEL_76:
      if (![(id)objc_opt_class() _includePA])
      {
LABEL_80:
        if (![(id)objc_opt_class() _includeCN]) {
          goto LABEL_84;
        }
        id v73 = objc_alloc_init(MEMORY[0x1E4F456D8]);
        [v6 setCityNatureRequest:v73];

        v74 = [v6 cityNatureRequest];
        LODWORD(v73) = v74 == 0;

        if (!v73)
        {
          v75 = [v6 cityNatureRequest];
          [(VCPPreAnalyzer *)self _configureRequest:v75];

          v76 = [v6 cityNatureRequest];
          v97 = v26;
          char v77 = [v76 setRevision:2 error:&v97];
          v29 = v97;

          if ((v77 & 1) == 0)
          {
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v36 = VCPLogInstance();
              if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
                goto LABEL_45;
              }
              *(_DWORD *)buf = 134218242;
              uint64_t v109 = 2;
              __int16 v110 = 2112;
              v111 = v29;
              v43 = "Failed to set VNClassifyCityNatureImageRequest::setRevision %lu: %@";
              goto LABEL_44;
            }
            goto LABEL_141;
          }
          v26 = v29;
LABEL_84:
          if ([(id)objc_opt_class() _includeDMF]
            && ([(id)objc_opt_class() _isMovieWithMediaType:a4] & 1) == 0)
          {
            id v78 = objc_alloc_init(MEMORY[0x1E4F45748]);
            [v6 setImagefingerprintsRequest:v78];

            v79 = [v6 imagefingerprintsRequest];
            BOOL v80 = v79 == 0;

            if (v80)
            {
              if ((int)MediaAnalysisLogLevel() < 3) {
                goto LABEL_31;
              }
              v36 = VCPLogInstance();
              if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
                goto LABEL_40;
              }
LABEL_144:
              uint64_t v95 = objc_opt_class();
              *(_DWORD *)buf = 138412290;
              uint64_t v109 = v95;
              v37 = "Failed to create %@";
              goto LABEL_145;
            }
            v81 = [v6 imagefingerprintsRequest];
            [(VCPPreAnalyzer *)self _configureRequest:v81 withRevision:1];
          }
          if (!objc_msgSend(MEMORY[0x1E4F45940], "mad_includeEntityNet"))
          {
            int v39 = 0;
            goto LABEL_32;
          }
          id v82 = objc_alloc_init(MEMORY[0x1E4F456F0]);
          [v6 setClassifyImageRequest:v82];

          v83 = [v6 classifyImageRequest];
          BOOL v84 = v83 == 0;

          if (!v84)
          {
            v85 = [v6 classifyImageRequest];
            [(VCPPreAnalyzer *)self _configureRequest:v85];

            v86 = [v6 classifyImageRequest];
            v96 = v26;
            int v87 = [v86 setRevision:3737841667 error:&v96];
            v29 = v96;

            if (v87)
            {
              v88 = [v6 classifyImageRequest];
              [v88 setMaximumLeafObservations:15];

              v36 = [v6 classifyImageRequest];
              [v36 setMaximumHierarchicalObservations:15];
              int v39 = 0;
              goto LABEL_46;
            }
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v36 = VCPLogInstance();
              if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
                goto LABEL_45;
              }
              *(_DWORD *)buf = 134218242;
              uint64_t v109 = 3737841667;
              __int16 v110 = 2112;
              v111 = v29;
              v43 = "Failed to set VNClassifyImageRequest::setRevision %lu: %@";
              goto LABEL_44;
            }
            goto LABEL_141;
          }
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_31;
          }
          v36 = VCPLogInstance();
          if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            goto LABEL_40;
          }
          goto LABEL_144;
        }
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_31;
        }
        v36 = VCPLogInstance();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          goto LABEL_40;
        }
        uint64_t v94 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        uint64_t v109 = v94;
        v37 = "Failed to create %@";
LABEL_145:
        v41 = v36;
        uint32_t v42 = 12;
        goto LABEL_39;
      }
      id v68 = objc_alloc_init(MEMORY[0x1E4F45690]);
      [v6 setAdjustmentsRequest:v68];

      v69 = [v6 adjustmentsRequest];
      LODWORD(v68) = v69 == 0;

      if (!v68)
      {
        v70 = [v6 adjustmentsRequest];
        [(VCPPreAnalyzer *)self _configureRequest:v70];

        v71 = [v6 adjustmentsRequest];
        v98 = v26;
        char v72 = [v71 setRevision:3737841664 error:&v98];
        v29 = v98;

        if ((v72 & 1) == 0)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v36 = VCPLogInstance();
            if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
              goto LABEL_45;
            }
            *(_DWORD *)buf = 134218242;
            uint64_t v109 = 3737841664;
            __int16 v110 = 2112;
            v111 = v29;
            v43 = "Failed to set VNGeneratePhotosAdjustmentsRequest::setRevision %lu: %@";
            goto LABEL_44;
          }
          goto LABEL_141;
        }
        v26 = v29;
        goto LABEL_80;
      }
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_31;
      }
      v36 = VCPLogInstance();
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
    }
LABEL_125:
    uint64_t v93 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    uint64_t v109 = v93;
    v37 = "Failed to create %@";
    goto LABEL_145;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v36 = VCPLogInstance();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v109 = 3737841667;
      __int16 v110 = 2112;
      v111 = v26;
      v37 = "Failed to set VNClassifyImageAestheticsRequest::setRevision %lu: %@";
      goto LABEL_38;
    }
LABEL_40:
    int v39 = -18;
LABEL_47:

    goto LABEL_32;
  }
LABEL_31:
  int v39 = -18;
LABEL_32:

LABEL_34:
  return v39;
}

- (void)_parseClassificationObservations:(id)a3 toClassificationResults:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v8)
  {
    uint64_t v10 = *(void *)v23;
    *(void *)&long long v9 = 138412290;
    long long v21 = v9;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
        objc_msgSend(v12, "confidence", v21);
        if (v13 >= 0.01)
        {
          v14 = [v12 identifier];
          v15 = VCPSpecialLabelToExtendedSceneClassificationID(v14);

          if (v15)
          {
            char v28 = @"Confidence";
            v16 = NSNumber;
            [v12 confidence];
            int64_t v17 = objc_msgSend(v16, "numberWithFloat:");
            v29 = v17;
            v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
            v19 = [v15 stringValue];
            [v6 setObject:v18 forKeyedSubscript:v19];

            goto LABEL_9;
          }
          int64_t v17 = [v12 identifier];
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v18 = VCPLogInstance();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v21;
              objc_super v27 = v17;
              _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_ERROR, "Unsupported observation label in VCPSpecialLabelToExtendedSceneClassificationID %@", buf, 0xCu);
            }
LABEL_9:
          }
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v20 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
      uint64_t v8 = v20;
    }
    while (v20);
  }
}

- (void)_parseClassificationObservations:(id)a3 withPrefix:(id)a4 toClassificationResults:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v24 = a5;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v9);
        }
        float v13 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
        v14 = [v13 identifier];
        [v13 confidence];
        if (v15 >= 0.01)
        {
          if (v8 && ([v14 hasPrefix:v8] & 1) == 0)
          {
            uint64_t v16 = [NSString stringWithFormat:@"%@%@", v8, v14];

            v14 = (void *)v16;
          }
          int64_t v17 = VCPSpecialLabelToExtendedSceneClassificationID(v14);
          if (v17)
          {
            uint64_t v31 = @"Confidence";
            v18 = NSNumber;
            [v13 confidence];
            v19 = objc_msgSend(v18, "numberWithFloat:");
            v32 = v19;
            uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
            long long v21 = [v17 stringValue];
            [v24 setObject:v20 forKeyedSubscript:v21];

            goto LABEL_12;
          }
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v19 = VCPLogInstance();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              long long v22 = [v13 identifier];
              *(_DWORD *)buf = 138412290;
              uint64_t v30 = v22;
              _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEFAULT, "Unsupported observation label %@", buf, 0xCu);
            }
LABEL_12:
          }
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v23 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
      uint64_t v10 = v23;
    }
    while (v23);
  }
}

- (void)_parsePhotosTaxonomyClassificationObservations:(id)a3 toClassificationResults:(id)a4 andDetectorSceneClassIds:(id)a5 isEntityNet:(BOOL)a6
{
  BOOL v38 = a6;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v37 = a4;
  id v39 = a5;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v43;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(v9);
        }
        float v13 = *(void **)(*((void *)&v42 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1C186D320]();
        [v13 confidence];
        if (v15 >= 0.01)
        {
          uint64_t v16 = objc_msgSend(MEMORY[0x1E4F8CD58], "vcp_sharedTaxonomy");
          int64_t v17 = [v13 identifier];
          v18 = [v16 nodeForName:v17];

          if (v18)
          {
            [v18 highPrecisionThreshold];
            double v20 = v19;
            [v18 highRecallThreshold];
            double v22 = v21;
            [v18 searchThreshold];
            double v24 = v23;
            [v13 confidence];
            if (v22 >= v20) {
              double v26 = v20;
            }
            else {
              double v26 = v22;
            }
            if (v24 < v26) {
              double v26 = v24;
            }
            double v27 = v25;
            if (v26 < 0.00999999978) {
              double v26 = 0.00999999978;
            }
            if (v26 <= v27)
            {
              long long v28 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v18, "extendedSceneClassId"));
              v29 = [v28 stringValue];

              char v48 = @"Confidence";
              uint64_t v30 = NSNumber;
              [v13 confidence];
              uint64_t v31 = objc_msgSend(v30, "numberWithFloat:");
              id v49 = v31;
              v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
              [v37 setObject:v32 forKeyedSubscript:v29];

              if (v39)
              {
                char v33 = [v18 detectors];
                v40[0] = MEMORY[0x1E4F143A8];
                v40[1] = 3221225472;
                v40[2] = __126__VCPPreAnalyzer__parsePhotosTaxonomyClassificationObservations_toClassificationResults_andDetectorSceneClassIds_isEntityNet___block_invoke;
                v40[3] = &unk_1E629B5D0;
                id v41 = v39;
                [v33 enumerateObjectsUsingBlock:v40];
              }
              goto LABEL_18;
            }
          }
          else
          {
            if (v38)
            {
              if ((int)MediaAnalysisLogLevel() < 7) {
                goto LABEL_19;
              }
              v29 = VCPLogInstance();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v34 = [v13 identifier];
                *(_DWORD *)buf = 138412290;
                v47 = v34;
                _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_DEBUG, "Unsupported EntityNet label in PFSceneTaxonomyNode: %@", buf, 0xCu);
              }
            }
            else
            {
              if ((int)MediaAnalysisLogLevel() < 3) {
                goto LABEL_19;
              }
              v29 = VCPLogInstance();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                char v35 = [v13 identifier];
                *(_DWORD *)buf = 138412290;
                v47 = v35;
                _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_ERROR, "Unsupported SceneNet label in PFSceneTaxonomyNode: %@", buf, 0xCu);
              }
            }
LABEL_18:
          }
LABEL_19:
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v36 = [v9 countByEnumeratingWithState:&v42 objects:v50 count:16];
      uint64_t v10 = v36;
    }
    while (v36);
  }
}

void __126__VCPPreAnalyzer__parsePhotosTaxonomyClassificationObservations_toClassificationResults_andDetectorSceneClassIds_isEntityNet___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v7 = v3;
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "extendedSceneClassId"));
  id v6 = [v5 stringValue];
  [v4 addObject:v6];
}

- (id)_processBoundingBoxFromDetectedObjects:(id)a3 forSceneClassID:(id)a4
{
  v72[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v51 = a4;
  char v52 = v5;
  if (![v5 count])
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        double v19 = "[DO] detectedObjects count is 0; skip detectedObjects";
        double v20 = v14;
        uint32_t v21 = 2;
LABEL_22:
        _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
      }
LABEL_47:
      v18 = 0;
      goto LABEL_48;
    }
LABEL_23:
    v18 = 0;
    goto LABEL_49;
  }
  if ([v5 count] != 1)
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v22 = v5;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v57 objects:v70 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v58;
      float v25 = -1.0;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v58 != v24) {
            objc_enumerationMutation(v22);
          }
          double v27 = [*(id *)(*((void *)&v57 + 1) + 8 * i) objectForKeyedSubscript:@"Confidence"];
          [v27 floatValue];
          float v29 = v28;

          if (v29 > v25) {
            float v25 = v29;
          }
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v57 objects:v70 count:16];
      }
      while (v23);
    }
    else
    {
      float v25 = -1.0;
    }

    double v30 = v25;
    if (v25 >= 0.01)
    {
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v31 = v22;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v53 objects:v69 count:16];
      float v33 = v25 * 0.8;
      v14 = 0;
      if (v32)
      {
        uint64_t v34 = *(void *)v54;
        float v35 = -1.0;
        float v36 = -1.0;
        do
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            if (*(void *)v54 != v34) {
              objc_enumerationMutation(v31);
            }
            BOOL v38 = *(void **)(*((void *)&v53 + 1) + 8 * j);
            id v39 = [v38 objectForKeyedSubscript:@"Confidence"];
            [v39 floatValue];
            float v41 = v40;

            long long v42 = [v38 objectForKeyedSubscript:@"size"];
            [v42 floatValue];
            float v44 = v43;

            if (v41 >= v33 && v44 > v35)
            {
              uint64_t v46 = [v38 objectForKeyedSubscript:@"BoundingBox"];

              float v35 = v44;
              float v36 = v41;
              v14 = v46;
            }
          }
          uint64_t v32 = [v31 countByEnumeratingWithState:&v53 objects:v69 count:16];
        }
        while (v32);
      }
      else
      {
        float v35 = -1.0;
        float v36 = -1.0;
      }

      if (v35 == -1.0 || v36 == -1.0 || !v14)
      {
        if ((int)MediaAnalysisLogLevel() < 4) {
          goto LABEL_47;
        }
        char v48 = VCPLogInstance();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          id v49 = [v31 description];
          *(_DWORD *)buf = 134218498;
          double v64 = v30;
          __int16 v65 = 2048;
          double v66 = v33;
          __int16 v67 = 2112;
          id v68 = v49;
          _os_log_impl(&dword_1BBEDA000, v48, OS_LOG_TYPE_DEFAULT, "[DO] Failed to choose the best bounding box c_max: %f, c_threshold (0.8x): %f from %@", buf, 0x20u);
        }
        v18 = 0;
      }
      else
      {
        v61[0] = @"classID";
        v61[1] = @"BoundingBox";
        v62[0] = v51;
        v62[1] = v14;
        v61[2] = @"score";
        *(float *)&double v47 = v35 * v36;
        char v48 = [NSNumber numberWithFloat:v47];
        v62[2] = v48;
        v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:3];
      }

      goto LABEL_48;
    }
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v64 = v25;
        double v19 = "[DO] invalid confidenceMax: %f; skip detectedObjects";
        double v20 = v14;
        uint32_t v21 = 12;
        goto LABEL_22;
      }
      goto LABEL_47;
    }
    goto LABEL_23;
  }
  id v6 = [v5 firstObject];
  id v7 = [v6 objectForKeyedSubscript:@"Confidence"];
  [v7 floatValue];
  float v9 = v8;

  uint64_t v10 = [v5 firstObject];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"size"];
  [v11 floatValue];
  float v13 = v12;

  v72[0] = v51;
  v71[0] = @"classID";
  v71[1] = @"BoundingBox";
  v14 = [v5 firstObject];
  float v15 = [v14 objectForKeyedSubscript:@"BoundingBox"];
  v72[1] = v15;
  v71[2] = @"score";
  *(float *)&double v16 = v9 * v13;
  int64_t v17 = [NSNumber numberWithFloat:v16];
  v72[2] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:3];

LABEL_48:
LABEL_49:

  return v18;
}

- (void)_insertBoundingBox:(id)a3 toSortedBoundingBoxes:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  if (v14 && v5)
  {
    id v6 = [v14 objectForKeyedSubscript:@"score"];
    [v6 floatValue];
    float v8 = v7;

    for (unint64_t i = 0; i < [v5 count]; ++i)
    {
      uint64_t v10 = [v5 objectAtIndexedSubscript:i];
      uint64_t v11 = [v10 objectForKeyedSubscript:@"score"];
      [v11 floatValue];
      float v13 = v12;

      if (v13 < v8) {
        break;
      }
    }
    [v5 insertObject:v14 atIndex:i];
  }
}

- (id)_extractAndSortBoundingBoxFromDetectedObjects:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __64__VCPPreAnalyzer__extractAndSortBoundingBoxFromDetectedObjects___block_invoke;
  v14[3] = &unk_1E629B5F8;
  id v6 = v5;
  id v15 = v6;
  [v4 enumerateObjectsUsingBlock:v14];
  float v7 = [MEMORY[0x1E4F1CA48] array];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__VCPPreAnalyzer__extractAndSortBoundingBoxFromDetectedObjects___block_invoke_282;
  v12[3] = &unk_1E629B620;
  v12[4] = self;
  id v8 = v7;
  id v13 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];
  float v9 = v13;
  id v10 = v8;

  return v10;
}

void __64__VCPPreAnalyzer__extractAndSortBoundingBoxFromDetectedObjects___block_invoke(uint64_t a1, void *a2)
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(MEMORY[0x1E4F8CD58], "vcp_sharedTaxonomy");
  id v5 = [v3 labels];
  id v6 = [v5 firstObject];
  float v7 = [v6 identifier];
  id v8 = [v4 nodeForName:v7];

  if (v8)
  {
    float v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "extendedSceneClassId"));
    id v10 = [v9 stringValue];

    uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];

    if (!v11)
    {
      float v12 = [MEMORY[0x1E4F1CA48] array];
      [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v10];
    }
    id v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
    v27[0] = @"Confidence";
    id v14 = NSNumber;
    [v3 confidence];
    id v15 = objc_msgSend(v14, "numberWithFloat:");
    v28[0] = v15;
    v27[1] = @"BoundingBox";
    [v3 boundingBox];
    double v16 = NSStringFromRect(v29);
    v28[1] = v16;
    v27[2] = @"size";
    int64_t v17 = NSNumber;
    [v3 boundingBox];
    double v19 = v18;
    [v3 boundingBox];
    uint32_t v21 = [v17 numberWithDouble:v19 * v20];
    v28[2] = v21;
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
    [v13 addObject:v22];
  }
  else
  {
    uint64_t v23 = [v3 labels];
    uint64_t v24 = [v23 firstObject];
    id v10 = [v24 identifier];

    if ((int)MediaAnalysisLogLevel() < 3) {
      goto LABEL_6;
    }
    id v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v25 = 138412290;
      double v26 = v10;
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "[DO] Unsupported observation label in PFSceneTaxonomyNode %@", (uint8_t *)&v25, 0xCu);
    }
  }

LABEL_6:
}

void __64__VCPPreAnalyzer__extractAndSortBoundingBoxFromDetectedObjects___block_invoke_282(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [*(id *)(a1 + 32) _processBoundingBoxFromDetectedObjects:a3 forSceneClassID:a2];
  objc_msgSend(*(id *)(a1 + 32), "_insertBoundingBox:toSortedBoundingBoxes:");
}

- (void)_generateSceneClassifications:(id)a3 fromRequests:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(id)objc_opt_class() _includeDO];
  float v9 = [MEMORY[0x1E4F1CA80] set];
  id v10 = [v7 classificationRequest];
  uint64_t v11 = [v10 results];
  if (v8) {
    float v12 = v9;
  }
  else {
    float v12 = 0;
  }
  [(VCPPreAnalyzer *)self _parsePhotosTaxonomyClassificationObservations:v11 toClassificationResults:v6 andDetectorSceneClassIds:v12 isEntityNet:0];

  if (v8)
  {
    id v13 = [v7 objectRequest];
    id v14 = [v13 results];

    id v15 = [(VCPPreAnalyzer *)self _extractAndSortBoundingBoxFromDetectedObjects:v14];
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x2020000000;
    v46[3] = 0;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __61__VCPPreAnalyzer__generateSceneClassifications_fromRequests___block_invoke;
    v42[3] = &unk_1E629B648;
    id v43 = v9;
    id v44 = v6;
    long long v45 = v46;
    [v15 enumerateObjectsUsingBlock:v42];

    _Block_object_dispose(v46, 8);
  }
  double v16 = [v7 classifyImageRequest];
  int64_t v17 = [v16 results];
  [(VCPPreAnalyzer *)self _parsePhotosTaxonomyClassificationObservations:v17 toClassificationResults:v6 andDetectorSceneClassIds:0 isEntityNet:1];

  double v18 = [v7 junkImageRequest];
  double v19 = [v18 results];
  [(VCPPreAnalyzer *)self _parseClassificationObservations:v19 toClassificationResults:v6];

  double v20 = [v7 landmarkRequest];
  uint32_t v21 = [v20 results];
  [(VCPPreAnalyzer *)self _parseClassificationObservations:v21 toClassificationResults:v6];

  id v22 = [v7 nsfwRequest];
  uint64_t v23 = [v22 results];
  [(VCPPreAnalyzer *)self _parseClassificationObservations:v23 toClassificationResults:v6];

  uint64_t v24 = [v7 tabooRequest];
  int v25 = [v24 results];
  [(VCPPreAnalyzer *)self _parseClassificationObservations:v25 toClassificationResults:v6];

  double v26 = [v7 semanticRequest];
  double v27 = [v26 results];
  [(VCPPreAnalyzer *)self _parseClassificationObservations:v27 toClassificationResults:v6];

  float v28 = [v7 memeRequest];
  NSRect v29 = [v28 results];
  [(VCPPreAnalyzer *)self _parseClassificationObservations:v29 withPrefix:@"meme_" toClassificationResults:v6];

  double v30 = [v7 cityNatureRequest];
  id v31 = [v30 results];
  [(VCPPreAnalyzer *)self _parseClassificationObservations:v31 toClassificationResults:v6];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v32 = objc_msgSend(v7, "documentRequest", 0);
  float v33 = [v32 results];

  uint64_t v34 = [v33 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v39;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(v33);
        }
        id v37 = [*(id *)(*((void *)&v38 + 1) + 8 * v36) labels];
        [(VCPPreAnalyzer *)self _parseClassificationObservations:v37 toClassificationResults:v6];

        ++v36;
      }
      while (v34 != v36);
      uint64_t v34 = [v33 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v34);
  }
}

void __61__VCPPreAnalyzer__generateSceneClassifications_fromRequests___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"classID"];
  int v8 = [v6 objectForKeyedSubscript:@"BoundingBox"];
  if ([*(id *)(a1 + 32) containsObject:v7])
  {
    float v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];

    if (v9)
    {
      id v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
      uint64_t v11 = (void *)[v10 mutableCopy];

      [v11 setObject:v8 forKeyedSubscript:@"BoundingBox"];
      [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v7];
    }
    else
    {
      v13[0] = @"Confidence";
      v13[1] = @"BoundingBox";
      v14[0] = &unk_1F15EB1B8;
      v14[1] = v8;
      float v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
      [*(id *)(a1 + 40) setObject:v12 forKeyedSubscript:v7];
    }
    if (++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= 5uLL) {
      *a4 = 1;
    }
  }
}

- (int)_collectSceneAnalysisResults:(id *)a3 fromRequests:(id)a4 wpResults:(id)a5 ivsResults:(id)a6 abnormalDimension:(unint64_t)a7
{
  char v7 = a7;
  v205[22] = *MEMORY[0x1E4F143B8];
  id v176 = a4;
  id v173 = a5;
  id v175 = a6;
  v174 = [MEMORY[0x1E4F1CA60] dictionary];
  char v169 = v7;
  if (v7)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "Ignoring SceneNet result for tiny image", buf, 2u);
      }
    }
  }
  else
  {
    [(VCPPreAnalyzer *)self _generateSceneClassifications:v174 fromRequests:v176];
  }
  if (v175)
  {
    v185[0] = MEMORY[0x1E4F143A8];
    v185[1] = 3221225472;
    v185[2] = __99__VCPPreAnalyzer__collectSceneAnalysisResults_fromRequests_wpResults_ivsResults_abnormalDimension___block_invoke;
    v185[3] = &unk_1E629B670;
    id v186 = v174;
    [v175 enumerateKeysAndObjectsUsingBlock:v185];
  }
  uint64_t v11 = [v176 aestheticsRequest];
  float v12 = [v11 results];
  BOOL v13 = [v12 count] == 1;

  if (v13)
  {
    id v14 = [v176 aestheticsRequest];
    id v15 = [v14 results];
    v172 = [v15 firstObject];

    v204[0] = @"overallScore";
    double v16 = NSNumber;
    [v172 aestheticScore];
    v167 = objc_msgSend(v16, "numberWithFloat:");
    v205[0] = v167;
    v204[1] = @"wellFramedSubjectScore";
    int64_t v17 = NSNumber;
    [v172 wellFramedSubjectScore];
    objc_msgSend(v17, "numberWithFloat:");
    id v165 = (id)objc_claimAutoreleasedReturnValue();
    v205[1] = v165;
    v204[2] = @"wellChosenBackgroundScore";
    double v18 = NSNumber;
    [v172 wellChosenBackgroundScore];
    v163 = objc_msgSend(v18, "numberWithFloat:");
    v205[2] = v163;
    v204[3] = @"tastefullyBlurredScore";
    double v19 = NSNumber;
    [v172 tastefullyBlurredScore];
    v161 = objc_msgSend(v19, "numberWithFloat:");
    v205[3] = v161;
    v204[4] = @"sharplyFocusedSubjectScore";
    double v20 = NSNumber;
    [v172 sharplyFocusedSubjectScore];
    objc_msgSend(v20, "numberWithFloat:");
    id obja = (id)objc_claimAutoreleasedReturnValue();
    v205[4] = obja;
    v204[5] = @"wellTimedShotScore";
    uint32_t v21 = NSNumber;
    [v172 wellTimedShotScore];
    objc_msgSend(v21, "numberWithFloat:");
    os_log_t osloga = (os_log_t)objc_claimAutoreleasedReturnValue();
    v205[5] = osloga;
    v204[6] = @"pleasantLightingScore";
    id v22 = NSNumber;
    [v172 pleasantLightingScore];
    v156 = objc_msgSend(v22, "numberWithFloat:");
    v205[6] = v156;
    v204[7] = @"pleasantReflectionsScore";
    uint64_t v23 = NSNumber;
    [v172 pleasantReflectionsScore];
    v155 = objc_msgSend(v23, "numberWithFloat:");
    v205[7] = v155;
    v204[8] = @"harmoniousColorScore";
    uint64_t v24 = NSNumber;
    [v172 harmoniousColorScore];
    v154 = objc_msgSend(v24, "numberWithFloat:");
    v205[8] = v154;
    v204[9] = @"livelyColorScore";
    int v25 = NSNumber;
    [v172 livelyColorScore];
    v153 = objc_msgSend(v25, "numberWithFloat:");
    v205[9] = v153;
    v204[10] = @"pleasantSymmetryScore";
    double v26 = NSNumber;
    [v172 pleasantSymmetryScore];
    v152 = objc_msgSend(v26, "numberWithFloat:");
    v205[10] = v152;
    v204[11] = @"pleasantPatternScore";
    double v27 = NSNumber;
    [v172 pleasantPatternScore];
    v151 = objc_msgSend(v27, "numberWithFloat:");
    v205[11] = v151;
    v204[12] = @"immersivenessScore";
    float v28 = NSNumber;
    [v172 immersivenessScore];
    NSRect v29 = objc_msgSend(v28, "numberWithFloat:");
    v205[12] = v29;
    v204[13] = @"pleasantPerspectiveScore";
    double v30 = NSNumber;
    [v172 pleasantPerspectiveScore];
    id v31 = objc_msgSend(v30, "numberWithFloat:");
    v205[13] = v31;
    v204[14] = @"pleasantPostProcessingScore";
    uint64_t v32 = NSNumber;
    [v172 pleasantPostProcessingScore];
    float v33 = objc_msgSend(v32, "numberWithFloat:");
    v205[14] = v33;
    v204[15] = @"noiseScore";
    uint64_t v34 = NSNumber;
    [v172 noiseScore];
    uint64_t v35 = objc_msgSend(v34, "numberWithFloat:");
    v205[15] = v35;
    v204[16] = @"failureScore";
    uint64_t v36 = NSNumber;
    [v172 failureScore];
    id v37 = objc_msgSend(v36, "numberWithFloat:");
    v205[16] = v37;
    v204[17] = @"pleasantCompositionScore";
    long long v38 = NSNumber;
    [v172 pleasantCompositionScore];
    long long v39 = objc_msgSend(v38, "numberWithFloat:");
    v205[17] = v39;
    v204[18] = @"interestingSubjectScore";
    long long v40 = NSNumber;
    [v172 interestingSubjectScore];
    long long v41 = objc_msgSend(v40, "numberWithFloat:");
    v205[18] = v41;
    v204[19] = @"intrusiveObjectPresenceScore";
    long long v42 = NSNumber;
    [v172 intrusiveObjectPresenceScore];
    id v43 = objc_msgSend(v42, "numberWithFloat:");
    v205[19] = v43;
    v204[20] = @"pleasantCameraTiltScore";
    id v44 = NSNumber;
    [v172 pleasantCameraTiltScore];
    long long v45 = objc_msgSend(v44, "numberWithFloat:");
    v205[20] = v45;
    v204[21] = @"lowKeyLightingScore";
    uint64_t v46 = NSNumber;
    [v172 lowKeyLightingScore];
    double v47 = objc_msgSend(v46, "numberWithFloat:");
    v205[21] = v47;
    v150 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v205 forKeys:v204 count:22];

    uint64_t v48 = [v176 saliencyRequest];
    id v49 = [v48 results];
    LOBYTE(v35) = [v49 count] == 1;

    if ((v35 & 1) == 0)
    {
      int v58 = -18;
      goto LABEL_25;
    }
    v50 = [v176 saliencyRequest];
    id v51 = [v50 results];
    char v52 = [v51 firstObject];
    [v52 boundingBox];
    CGFloat x = v206.origin.x;
    CGFloat y = v206.origin.y;
    CGFloat width = v206.size.width;
    CGFloat height = v206.size.height;
    if (CGRectGetMinX(v206) < 0.0) {
      goto LABEL_18;
    }
    v207.origin.CGFloat x = x;
    v207.origin.CGFloat y = y;
    v207.size.CGFloat width = width;
    v207.size.CGFloat height = height;
    if (CGRectGetMinX(v207) > 1.0) {
      goto LABEL_18;
    }
    v208.origin.CGFloat x = x;
    v208.origin.CGFloat y = y;
    v208.size.CGFloat width = width;
    v208.size.CGFloat height = height;
    if (CGRectGetMinY(v208) < 0.0) {
      goto LABEL_18;
    }
    v209.origin.CGFloat x = x;
    v209.origin.CGFloat y = y;
    v209.size.CGFloat width = width;
    v209.size.CGFloat height = height;
    if (CGRectGetMinY(v209) > 1.0) {
      goto LABEL_18;
    }
    v210.origin.CGFloat x = x;
    v210.origin.CGFloat y = y;
    v210.size.CGFloat width = width;
    v210.size.CGFloat height = height;
    if (CGRectGetMaxX(v210) < 0.0) {
      goto LABEL_18;
    }
    v211.origin.CGFloat x = x;
    v211.origin.CGFloat y = y;
    v211.size.CGFloat width = width;
    v211.size.CGFloat height = height;
    if (CGRectGetMaxX(v211) > 1.0
      || (v212.origin.CGFloat x = x,
          v212.origin.CGFloat y = y,
          v212.size.CGFloat width = width,
          v212.size.CGFloat height = height,
          CGRectGetMaxY(v212) < 0.0))
    {
LABEL_18:

LABEL_19:
      long long v57 = VCPLogInstance();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
      {
        long long v60 = [v176 saliencyRequest];
        v61 = [v60 results];
        char v62 = [v61 firstObject];
        [v62 boundingBox];
        id v63 = NSStringFromRect(v213);
        *(_DWORD *)buf = 138412290;
        v203 = v63;
        _os_log_fault_impl(&dword_1BBEDA000, v57, OS_LOG_TYPE_FAULT, "Unnormalized saliencyRequest bounding box %@; skip",
          buf,
          0xCu);
      }
      int v58 = -18;
      goto LABEL_22;
    }
    v214.origin.CGFloat x = x;
    v214.origin.CGFloat y = y;
    v214.size.CGFloat width = width;
    v214.size.CGFloat height = height;
    BOOL v64 = CGRectGetMaxY(v214) > 1.0;

    if (v64) {
      goto LABEL_19;
    }
    __int16 v65 = [v176 saliencyRequest];
    double v66 = [v65 results];
    __int16 v67 = [v66 firstObject];
    [v67 boundingBox];
    long long v57 = NSStringFromRect(v215);

    id v68 = [v176 saliencyRequest];
    v69 = [v68 results];
    v70 = [v69 firstObject];
    [v70 narrowedBoundingBox];
    CGFloat v71 = v216.origin.x;
    CGFloat v72 = v216.origin.y;
    CGFloat v73 = v216.size.width;
    CGFloat v74 = v216.size.height;
    if (CGRectGetMinX(v216) < 0.0) {
      goto LABEL_35;
    }
    v217.origin.CGFloat x = v71;
    v217.origin.CGFloat y = v72;
    v217.size.CGFloat width = v73;
    v217.size.CGFloat height = v74;
    if (CGRectGetMinX(v217) > 1.0) {
      goto LABEL_35;
    }
    v218.origin.CGFloat x = v71;
    v218.origin.CGFloat y = v72;
    v218.size.CGFloat width = v73;
    v218.size.CGFloat height = v74;
    if (CGRectGetMinY(v218) < 0.0) {
      goto LABEL_35;
    }
    v219.origin.CGFloat x = v71;
    v219.origin.CGFloat y = v72;
    v219.size.CGFloat width = v73;
    v219.size.CGFloat height = v74;
    if (CGRectGetMinY(v219) > 1.0) {
      goto LABEL_35;
    }
    v220.origin.CGFloat x = v71;
    v220.origin.CGFloat y = v72;
    v220.size.CGFloat width = v73;
    v220.size.CGFloat height = v74;
    if (CGRectGetMaxX(v220) < 0.0) {
      goto LABEL_35;
    }
    v221.origin.CGFloat x = v71;
    v221.origin.CGFloat y = v72;
    v221.size.CGFloat width = v73;
    v221.size.CGFloat height = v74;
    if (CGRectGetMaxX(v221) > 1.0
      || (v222.origin.CGFloat x = v71,
          v222.origin.CGFloat y = v72,
          v222.size.CGFloat width = v73,
          v222.size.CGFloat height = v74,
          CGRectGetMaxY(v222) < 0.0))
    {
LABEL_35:

LABEL_36:
      v75 = VCPLogInstance();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
      {
        v76 = [v176 saliencyRequest];
        char v77 = [v76 results];
        id v78 = [v77 firstObject];
        [v78 narrowedBoundingBox];
        v79 = NSStringFromRect(v223);
        *(_DWORD *)buf = 138412290;
        v203 = v79;
        _os_log_fault_impl(&dword_1BBEDA000, v75, OS_LOG_TYPE_FAULT, "Unnormalized saliencyRequest narrowed bounding box %@; skip",
          buf,
          0xCu);
      }
      int v58 = -18;
      goto LABEL_39;
    }
    v224.origin.CGFloat x = v71;
    v224.origin.CGFloat y = v72;
    v224.size.CGFloat width = v73;
    v224.size.CGFloat height = v74;
    BOOL v80 = CGRectGetMaxY(v224) > 1.0;

    if (v80) {
      goto LABEL_36;
    }
    v81 = [v176 saliencyRequest];
    id v82 = [v81 results];
    v83 = [v82 firstObject];
    [v83 narrowedBoundingBox];
    uint64_t v164 = NSStringFromRect(v225);

    v168 = [MEMORY[0x1E4F1CA48] array];
    if ([(id)objc_opt_class() _includeSO])
    {
      BOOL v84 = [v176 saliencyObjectnessRequest];
      v85 = [v84 results];
      BOOL v86 = [v85 count] == 1;

      if (!v86) {
        goto LABEL_68;
      }
      int v87 = [v176 saliencyObjectnessRequest];
      v88 = [v87 results];
      uint64_t v89 = [v88 firstObject];
      uint64_t v90 = [v89 salientObjects];

      long long v183 = 0u;
      long long v184 = 0u;
      long long v181 = 0u;
      long long v182 = 0u;
      obuint64_t j = v90;
      uint64_t v91 = [obj countByEnumeratingWithState:&v181 objects:v201 count:16];
      if (v91)
      {
        uint64_t v92 = *(void *)v182;
        while (2)
        {
          for (uint64_t i = 0; i != v91; ++i)
          {
            if (*(void *)v182 != v92) {
              objc_enumerationMutation(obj);
            }
            uint64_t v94 = *(void **)(*((void *)&v181 + 1) + 8 * i);
            [v94 boundingBox];
            CGFloat v95 = v226.origin.x;
            CGFloat v96 = v226.origin.y;
            CGFloat v97 = v226.size.width;
            CGFloat v98 = v226.size.height;
            if (CGRectGetMinX(v226) < 0.0) {
              goto LABEL_70;
            }
            v227.origin.CGFloat x = v95;
            v227.origin.CGFloat y = v96;
            v227.size.CGFloat width = v97;
            v227.size.CGFloat height = v98;
            if (CGRectGetMinX(v227) > 1.0) {
              goto LABEL_70;
            }
            v228.origin.CGFloat x = v95;
            v228.origin.CGFloat y = v96;
            v228.size.CGFloat width = v97;
            v228.size.CGFloat height = v98;
            if (CGRectGetMinY(v228) < 0.0) {
              goto LABEL_70;
            }
            v229.origin.CGFloat x = v95;
            v229.origin.CGFloat y = v96;
            v229.size.CGFloat width = v97;
            v229.size.CGFloat height = v98;
            if (CGRectGetMinY(v229) > 1.0) {
              goto LABEL_70;
            }
            v230.origin.CGFloat x = v95;
            v230.origin.CGFloat y = v96;
            v230.size.CGFloat width = v97;
            v230.size.CGFloat height = v98;
            if (CGRectGetMaxX(v230) < 0.0) {
              goto LABEL_70;
            }
            v231.origin.CGFloat x = v95;
            v231.origin.CGFloat y = v96;
            v231.size.CGFloat width = v97;
            v231.size.CGFloat height = v98;
            if (CGRectGetMaxX(v231) > 1.0) {
              goto LABEL_70;
            }
            v232.origin.CGFloat x = v95;
            v232.origin.CGFloat y = v96;
            v232.size.CGFloat width = v97;
            v232.size.CGFloat height = v98;
            if (CGRectGetMaxY(v232) < 0.0
              || (v233.origin.CGFloat x = v95,
                  v233.origin.CGFloat y = v96,
                  v233.size.CGFloat width = v97,
                  v233.size.CGFloat height = v98,
                  CGRectGetMaxY(v233) > 1.0))
            {
LABEL_70:
              oslog = VCPLogInstance();
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
              {
                [v94 boundingBox];
                v117 = NSStringFromRect(v235);
                -[VCPPreAnalyzer _collectSceneAnalysisResults:fromRequests:wpResults:ivsResults:abnormalDimension:](v117, buf, oslog);
              }
              int v58 = -18;
              v162 = obj;
              goto LABEL_73;
            }
            [v94 boundingBox];
            v99 = NSStringFromRect(v234);
            v100 = NSNumber;
            [v94 confidence];
            v101 = objc_msgSend(v100, "numberWithFloat:");
            v199 = @"attributes";
            v197[0] = @"saliencyBounds";
            v197[1] = @"saliencyConfidence";
            v198[0] = v99;
            v198[1] = v101;
            v102 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v198 forKeys:v197 count:2];
            v200 = v102;
            v103 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v200 forKeys:&v199 count:1];

            [v168 addObject:v103];
          }
          uint64_t v91 = [obj countByEnumeratingWithState:&v181 objects:v201 count:16];
          if (v91) {
            continue;
          }
          break;
        }
      }
    }
    v104 = [v176 sceneprintRequest];
    v105 = [v104 results];
    BOOL v106 = [v105 count] == 1;

    if (v106)
    {
      id v107 = [v176 sceneprintRequest];
      v108 = [v107 results];
      uint64_t v109 = [v108 firstObject];
      __int16 v110 = [v109 sceneprints];
      v162 = [v110 firstObject];

      if ([v162 elementType] != 1
        || [v162 elementCount] != 768
        || ([v162 descriptorData],
            v111 = objc_claimAutoreleasedReturnValue(),
            BOOL v112 = [v111 length] == 3072,
            v111,
            !v112))
      {
        int v58 = -18;
LABEL_75:

        goto LABEL_76;
      }
      obuint64_t j = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v162 requiringSecureCoding:1 error:0];
      if ([(id)objc_opt_class() _includeWP])
      {
        v113 = [v173 objectForKeyedSubscript:@"WPResults"];
        BOOL v114 = [v113 count] == 1;

        if (!v114
          || ([v173 objectForKeyedSubscript:@"WPResults"],
              v115 = objc_claimAutoreleasedReturnValue(),
              [v115 objectAtIndexedSubscript:0],
              v116 = objc_claimAutoreleasedReturnValue(),
              v115,
              !v116))
        {
          int v58 = -18;

          goto LABEL_74;
        }
        oslog = [v116 objectForKeyedSubscript:@"wallpaperScore"];

        if (!oslog)
        {
          oslog = 0;
LABEL_107:
          int v58 = -18;
LABEL_73:

LABEL_74:
          goto LABEL_75;
        }
      }
      else
      {
        oslog = &unk_1F15EB1C8;
      }
      if ([(id)objc_opt_class() _includePA])
      {
        v118 = [v176 adjustmentsRequest];
        v119 = [v118 results];
        BOOL v120 = [v119 count] == 0;

        if (v120) {
          goto LABEL_107;
        }
        v121 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v179 = 0u;
        long long v180 = 0u;
        long long v177 = 0u;
        long long v178 = 0u;
        v122 = [v176 adjustmentsRequest];
        v123 = [v122 results];
        v124 = [v123 objectAtIndexedSubscript:0];
        id v166 = [v124 adjustmentKeys];

        uint64_t v125 = [v166 countByEnumeratingWithState:&v177 objects:v196 count:16];
        if (v125)
        {
          uint64_t v126 = *(void *)v178;
          do
          {
            for (uint64_t j = 0; j != v125; ++j)
            {
              if (*(void *)v178 != v126) {
                objc_enumerationMutation(v166);
              }
              uint64_t v128 = *(void *)(*((void *)&v177 + 1) + 8 * j);
              v129 = [v176 adjustmentsRequest];
              v130 = [v129 results];
              v131 = [v130 objectAtIndexedSubscript:0];
              v132 = [v131 adjustmentValuesForKey:v128];
              [v121 setObject:v132 forKeyedSubscript:v128];
            }
            uint64_t v125 = [v166 countByEnumeratingWithState:&v177 objects:v196 count:16];
          }
          while (v125);
        }

        v133 = MEMORY[0x1C186C070](v121, 0);
      }
      else
      {
        v133 = 0;
      }
      v134 = [MEMORY[0x1E4F1C9B8] data];
      v135 = [MEMORY[0x1E4F1C9B8] data];
      v136 = [v176 imagefingerprintsRequest];
      BOOL v138 = (v169 & 1) == 0 && v136 != 0;

      if (v138)
      {
        v139 = [v176 imagefingerprintsRequest];
        v140 = [v139 results];

        if (![v140 count])
        {
          int v58 = -18;
          goto LABEL_111;
        }
        v141 = [v140 firstObject];
        id v142 = [v141 fingerprintHashes];

        if (v142 && [v142 count] == 2)
        {
          v143 = [v142 objectAtIndexedSubscript:0];
          v144 = [v143 hashData];

          if ([v144 length] == 24)
          {
            v145 = [v142 objectAtIndexedSubscript:1];
            v146 = [v145 hashData];

            if ([v146 length] == 24)
            {
              v135 = [MEMORY[0x1E4F1CA58] dataWithBytes:&-[VCPPreAnalyzer _collectSceneAnalysisResults:fromRequests:wpResults:ivsResults:abnormalDimension:]::kPrefixByte length:1];
              [v135 appendData:v146];

              v134 = v144;
              goto LABEL_103;
            }
            int v58 = -18;
            v134 = v144;
            v135 = v146;
          }
          else
          {
            int v58 = -18;
            v134 = v144;
          }
        }
        else
        {
          int v58 = -18;
        }
LABEL_109:

LABEL_111:
        goto LABEL_73;
      }
LABEL_103:
      v194 = @"ClassificationResults";
      v191 = @"attributes";
      v189[0] = @"aesthetic";
      v189[1] = @"sceneClassification";
      v190[0] = v150;
      v190[1] = v174;
      v189[2] = @"saliency";
      v187[0] = @"preferredCrop";
      v187[1] = @"acceptableCrop";
      v188[0] = v57;
      v188[1] = v164;
      v140 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v188 forKeys:v187 count:2];
      v190[2] = v140;
      v190[3] = obj;
      v189[3] = @"sceneprint";
      v189[4] = @"saliencyObjectness";
      v190[4] = v168;
      v190[5] = oslog;
      v189[5] = @"wallpaperScore";
      v189[6] = @"colorNormalizationData";
      id v142 = v133;
      if (!v133) {
        id v142 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
      }
      v190[6] = v142;
      v190[7] = v134;
      v189[7] = @"duplicateMatchingFeature";
      v189[8] = @"duplicateMatchingAlternateFeature";
      v190[8] = v135;
      v147 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v190 forKeys:v189 count:9];
      v192 = v147;
      v148 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v192 forKeys:&v191 count:1];
      v193 = v148;
      v149 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v193 count:1];
      v195 = v149;
      *a3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v195 forKeys:&v194 count:1];

      int v58 = 0;
      if (v133) {
        goto LABEL_111;
      }
      goto LABEL_109;
    }
LABEL_68:
    int v58 = -18;
LABEL_76:

    v75 = v164;
LABEL_39:

LABEL_22:
LABEL_25:

    goto LABEL_26;
  }
  int v58 = -18;
LABEL_26:

  return v58;
}

void __99__VCPPreAnalyzer__collectSceneAnalysisResults_fromRequests_wpResults_ivsResults_abnormalDimension___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [v6 doubleValue];
  if (v7 >= 0.00999999978)
  {
    int v8 = VCPSpecialLabelToExtendedSceneClassificationID(v5);
    if (v8)
    {
      id v14 = @"Confidence";
      v15[0] = v6;
      float v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      id v10 = *(void **)(a1 + 32);
      uint64_t v11 = [v8 stringValue];
      [v10 setObject:v9 forKeyedSubscript:v11];
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_5;
      }
      float v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412290;
        id v13 = v5;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "Unsupported observation label in VCPSpecialLabelToExtendedSceneClassificationID %@", (uint8_t *)&v12, 0xCu);
      }
    }

LABEL_5:
  }
}

- (int)_performSceneAnalysis:(id *)a3 image:(id)a4 mediaType:(int64_t)a5 mediaSubtypes:(unint64_t)a6 abnormalDimension:(unint64_t)a7
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v109 = a4;
  float v9 = objc_alloc_init(VCPPreAnalysisRequests);
  BOOL v106 = v9;
  int v10 = [(VCPPreAnalyzer *)self _createRequests:v9 withMediaType:a5];
  if (!v10)
  {
    v108 = [(VCPObjectPool *)self->_sessionPool getObject];
    v102 = self;
    if (a7)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F45890]);
      uint64_t v13 = [v109 sourcePixelBuffer];
      id v14 = [v108 object];
      id v15 = (id)[v12 initWithCVPixelBuffer:v13 options:MEMORY[0x1E4F1CC08] session:v14];

      double v16 = VCPSignPostLog();
      os_signpost_id_t v17 = os_signpost_id_generate(v16);

      double v18 = VCPSignPostLog();
      double v19 = v18;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "VCPSceneAnalyzerImageRequestHandlerPerformRequest", "", buf, 2u);
      }

      double v20 = [(VCPPreAnalysisRequests *)v9 gatherAvailableRequests];
      id v128 = 0;
      char v21 = [v15 performRequests:v20 error:&v128];
      id v22 = v128;

      uint64_t v23 = VCPSignPostLog();
      uint64_t v24 = v23;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v24, OS_SIGNPOST_INTERVAL_END, v17, "VCPSceneAnalyzerImageRequestHandlerPerformRequest", "", buf, 2u);
      }

      if ((v21 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v70 = VCPLogInstance();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v131 = v22;
            _os_log_impl(&dword_1BBEDA000, v70, OS_LOG_TYPE_ERROR, "Failed to run VNImageRequestHandler::performRequests: %@", buf, 0xCu);
          }
        }
        long long v42 = 0;
        int v10 = -18;
        goto LABEL_80;
      }
      if (![(id)objc_opt_class() _includeIVS])
      {
        long long v42 = 0;
LABEL_81:

LABEL_108:
        int v92 = [(id)objc_opt_class() _includeWP];
        uint64_t v93 = v106;
        if (v92)
        {
          uint64_t v94 = [(VCPPreAnalysisRequests *)v106 sceneprintRequest];
          CGFloat v95 = [v94 results];

          CGFloat v96 = [v95 firstObject];
          CGFloat v97 = [v96 sceneprints];
          CGFloat v98 = [v97 firstObject];

          id v110 = 0;
          [(VCPPreAnalyzer *)v102 _performWallpaperAnalysis:&v110 withSceneprint:v98];
          id v15 = v110;

          uint64_t v93 = v106;
        }
        else
        {
          id v15 = 0;
        }
        int v10 = [(VCPPreAnalyzer *)v102 _collectSceneAnalysisResults:a3 fromRequests:v93 wpResults:v15 ivsResults:v42 abnormalDimension:a7];
        goto LABEL_112;
      }
      int v25 = (void *)MEMORY[0x1C186D320]();
      double v26 = [(VCPObjectPool *)v102->_ivsPool getObject];
      double v27 = [v26 object];
      BOOL v28 = v27 == 0;

      if (v28)
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          long long v42 = 0;
          int v10 = -18;
          int v43 = 1;
LABEL_79:

          if (v43)
          {
LABEL_80:

LABEL_112:
            goto LABEL_113;
          }
          goto LABEL_81;
        }
        uint64_t v34 = VCPLogInstance();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          CGFloat v73 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          *(void *)v131 = v73;
          id v74 = v73;
          _os_log_impl(&dword_1BBEDA000, v34, OS_LOG_TYPE_ERROR, "%@ unavailable for IVS", buf, 0xCu);
        }
        long long v42 = 0;
        int v10 = -18;
        int v43 = 1;
      }
      else
      {
        NSRect v29 = VCPSignPostLog();
        os_signpost_id_t v30 = os_signpost_id_generate(v29);

        id v31 = VCPSignPostLog();
        uint64_t v32 = v31;
        if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "CommSafetyHandler_IVS", "", buf, 2u);
        }

        float v33 = [v26 object];
        id v127 = v22;
        uint64_t v34 = objc_msgSend(v33, "analyzePixelBuffer:error:", objc_msgSend(v109, "sourcePixelBuffer"), &v127);
        id v35 = v127;

        uint64_t v36 = VCPSignPostLog();
        id v37 = v36;
        if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v37, OS_SIGNPOST_INTERVAL_END, v30, "CommSafetyHandler_IVS", "", buf, 2u);
        }

        if (v35)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            long long v38 = VCPLogInstance();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              long long v39 = v25;
              id v40 = (id)objc_opt_class();
              long long v41 = [v35 description];
              *(_DWORD *)buf = 138412546;
              *(void *)v131 = v40;
              *(_WORD *)&v131[8] = 2112;
              v132 = v41;
              _os_log_impl(&dword_1BBEDA000, v38, OS_LOG_TYPE_ERROR, "Failed to run %@::analyzePixelBuffer:error: %@", buf, 0x16u);

              int v25 = v39;
            }
          }
          long long v42 = 0;
          int v10 = -18;
          int v43 = 1;
        }
        else
        {
          long long v42 = [v34 scoresForLabels];
          int v43 = 0;
          int v10 = 0;
        }
        id v22 = v35;
      }

      goto LABEL_79;
    }
    CFTypeRef cf = 0;
    [(VCPPreAnalysisRequests *)v9 mapAvailableRequestsToResolution];
    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    id v107 = v123 = 0u;
    id v44 = [v107 allKeys];
    id v45 = 0;
    uint64_t v46 = [v44 countByEnumeratingWithState:&v122 objects:v129 count:16];
    if (v46)
    {
      uint64_t v104 = *(void *)v123;
      *(void *)&long long v47 = 67109376;
      long long v100 = v47;
      obuint64_t j = v44;
      while (2)
      {
        uint64_t v48 = 0;
        id v49 = v45;
        do
        {
          if (*(void *)v123 != v104) {
            objc_enumerationMutation(obj);
          }
          v50 = *(void **)(*((void *)&v122 + 1) + 8 * v48);
          if (+[VCPPreAnalysisRequests isDimensionUnknown:](VCPPreAnalysisRequests, "isDimensionUnknown:", v50, v100))
          {
            double Width = (double)CVPixelBufferGetWidth((CVPixelBufferRef)[v109 sourcePixelBuffer]);
            double Height = (double)CVPixelBufferGetHeight((CVPixelBufferRef)[v109 sourcePixelBuffer]);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __88__VCPPreAnalyzer__performSceneAnalysis_image_mediaType_mediaSubtypes_abnormalDimension___block_invoke;
            block[3] = &unk_1E629B698;
            id v118 = v107;
            v119 = v50;
            double v120 = Width;
            double v121 = Height;
            if (-[VCPPreAnalyzer _performSceneAnalysis:image:mediaType:mediaSubtypes:abnormalDimension:]::once != -1) {
              dispatch_once(&-[VCPPreAnalyzer _performSceneAnalysis:image:mediaType:mediaSubtypes:abnormalDimension:]::once, block);
            }
          }
          else
          {
            [v50 sizeValue];
            double Width = v53;
            double Height = v54;
          }
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          int v10 = [v109 pixelBuffer:&cf width:(unint64_t)Width height:(unint64_t)Height];
          if (v10)
          {
            id v45 = v49;
LABEL_70:

            long long v42 = 0;
            char v72 = 0;
            __int16 v67 = v107;
            goto LABEL_107;
          }
          id v55 = objc_alloc(MEMORY[0x1E4F45890]);
          CFTypeRef v56 = cf;
          long long v57 = [v108 object];
          int v58 = (void *)[v55 initWithCVPixelBuffer:v56 options:MEMORY[0x1E4F1CC08] session:v57];

          long long v59 = [v107 objectForKeyedSubscript:v50];
          if ([v59 count] == 1)
          {
            v113[0] = MEMORY[0x1E4F143A8];
            v113[1] = 3221225472;
            v113[2] = __88__VCPPreAnalyzer__performSceneAnalysis_image_mediaType_mediaSubtypes_abnormalDimension___block_invoke_299;
            v113[3] = &unk_1E629B6C0;
            id v114 = v59;
            double v115 = Width;
            double v116 = Height;
            if (-[VCPPreAnalyzer _performSceneAnalysis:image:mediaType:mediaSubtypes:abnormalDimension:]::once != -1) {
              dispatch_once(&-[VCPPreAnalyzer _performSceneAnalysis:image:mediaType:mediaSubtypes:abnormalDimension:]::once, v113);
            }
          }
          long long v60 = VCPSignPostLog();
          os_signpost_id_t v61 = os_signpost_id_generate(v60);

          char v62 = VCPSignPostLog();
          id v63 = v62;
          if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
          {
            *(_DWORD *)buf = v100;
            *(_DWORD *)v131 = (int)Width;
            *(_WORD *)&v131[4] = 1024;
            *(_DWORD *)&v131[6] = (int)Height;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v63, OS_SIGNPOST_INTERVAL_BEGIN, v61, "VCPSceneAnalyzerImageRequestHandlerPerformRequest", "%dx%d", buf, 0xEu);
          }

          id v112 = v49;
          char v64 = [v58 performRequests:v59 error:&v112];
          id v45 = v112;

          __int16 v65 = VCPSignPostLog();
          double v66 = v65;
          if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
          {
            *(_DWORD *)buf = v100;
            *(_DWORD *)v131 = (int)Width;
            *(_WORD *)&v131[4] = 1024;
            *(_DWORD *)&v131[6] = (int)Height;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v66, OS_SIGNPOST_INTERVAL_END, v61, "VCPSceneAnalyzerImageRequestHandlerPerformRequest", "%dx%d", buf, 0xEu);
          }

          if ((v64 & 1) == 0)
          {
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              CGFloat v71 = VCPLogInstance();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v131 = v45;
                _os_log_impl(&dword_1BBEDA000, v71, OS_LOG_TYPE_ERROR, "Failed to run VNImageRequestHandler::performRequests: %@", buf, 0xCu);
              }
            }
            int v10 = -18;
            goto LABEL_70;
          }

          ++v48;
          id v49 = v45;
        }
        while (v46 != v48);
        id v44 = obj;
        uint64_t v46 = [obj countByEnumeratingWithState:&v122 objects:v129 count:16];
        if (v46) {
          continue;
        }
        break;
      }
    }

    __int16 v67 = v107;
    if (![(id)objc_opt_class() _includeIVS])
    {
      long long v42 = 0;
      int v10 = 0;
      goto LABEL_106;
    }
    id v68 = (void *)MEMORY[0x1C186D320]();
    __int16 v67 = v107;
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    int v10 = [v109 pixelBuffer:&cf width:299 height:299];
    if (v10)
    {
      long long v42 = 0;
      int v69 = 1;
      goto LABEL_104;
    }
    v75 = [(VCPObjectPool *)v102->_ivsPool getObject];
    v76 = [v75 object];
    BOOL v77 = v76 == 0;

    if (v77)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        long long v42 = 0;
        int v10 = -18;
        int v69 = 1;
        goto LABEL_103;
      }
      v83 = VCPLogInstance();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      {
        uint64_t v90 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        *(void *)v131 = v90;
        id v91 = v90;
        _os_log_impl(&dword_1BBEDA000, v83, OS_LOG_TYPE_ERROR, "%@ unavailable for IVS", buf, 0xCu);
      }
      long long v42 = 0;
      int v10 = -18;
      int v69 = 1;
    }
    else
    {
      id v78 = VCPSignPostLog();
      os_signpost_id_t v79 = os_signpost_id_generate(v78);

      BOOL v80 = VCPSignPostLog();
      v81 = v80;
      if (v79 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v80))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v81, OS_SIGNPOST_INTERVAL_BEGIN, v79, "CommSafetyHandler_IVS", "", buf, 2u);
      }

      id v82 = [v75 object];
      id v111 = v45;
      v83 = [v82 analyzePixelBuffer:cf error:&v111];
      id v84 = v111;

      v85 = VCPSignPostLog();
      BOOL v86 = v85;
      if (v79 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v85))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v86, OS_SIGNPOST_INTERVAL_END, v79, "CommSafetyHandler_IVS", "", buf, 2u);
      }

      if (v84)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          int v87 = VCPLogInstance();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
          {
            id v88 = (id)objc_opt_class();
            uint64_t v89 = [v84 description];
            *(_DWORD *)buf = 138412546;
            *(void *)v131 = v88;
            *(_WORD *)&v131[8] = 2112;
            v132 = v89;
            _os_log_impl(&dword_1BBEDA000, v87, OS_LOG_TYPE_ERROR, "Failed to run %@::analyzePixelBuffer:error: %@", buf, 0x16u);
          }
        }
        long long v42 = 0;
        int v10 = -18;
        int v69 = 1;
      }
      else
      {
        long long v42 = [v83 scoresForLabels];
        int v69 = 0;
        int v10 = 0;
      }
      id v45 = v84;
    }

LABEL_103:
    __int16 v67 = v107;
LABEL_104:
    if (v69)
    {
      char v72 = 0;
      goto LABEL_107;
    }
LABEL_106:
    char v72 = 1;
LABEL_107:

    CF<opaqueCMSampleBuffer *>::~CF(&cf);
    if ((v72 & 1) == 0)
    {
LABEL_113:

LABEL_114:
      float v9 = v106;
      goto LABEL_115;
    }
    goto LABEL_108;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v11 = VCPLogInstance();
    v108 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "Error creating VNRequest", buf, 2u);
    }
    goto LABEL_114;
  }
LABEL_115:

  return v10;
}

void __88__VCPPreAnalyzer__performSceneAnalysis_image_mediaType_mediaSubtypes_abnormalDimension___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
      double v4 = *(double *)(a1 + 56);
      int v5 = (int)*(double *)(a1 + 48);
      int v6 = 138412802;
      double v7 = v3;
      __int16 v8 = 1024;
      int v9 = v5;
      __int16 v10 = 1024;
      int v11 = (int)v4;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEFAULT, "Unknown ideal dimension for VNRequests (%@), using image dimension %dx%d", (uint8_t *)&v6, 0x18u);
    }
  }
}

void __88__VCPPreAnalyzer__performSceneAnalysis_image_mediaType_mediaSubtypes_abnormalDimension___block_invoke_299(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
      double v4 = objc_opt_class();
      int v5 = (int)*(double *)(a1 + 40);
      int v6 = (int)*(double *)(a1 + 48);
      int v8 = 138412802;
      int v9 = v4;
      __int16 v10 = 1024;
      int v11 = v5;
      __int16 v12 = 1024;
      int v13 = v6;
      id v7 = v4;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEFAULT, "Only one VNRequest (%@) for dimension %dx%d; consider coalescing to common resolution",
        (uint8_t *)&v8,
        0x18u);
    }
  }
}

- (int)_performBlurAnalysis:(id *)a3 withPixelBuffer:(__CVBuffer *)a4 usingAnalyzer:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  size_t Width = CVPixelBufferGetWidth(a4);
  size_t Height = CVPixelBufferGetHeight(a4);
  size_t v11 = Height;
  if (Width <= Height) {
    size_t v12 = Height / Width;
  }
  else {
    size_t v12 = Width / Height;
  }
  CVPixelBufferRef pixelBuffer = 0;
  int v13 = [(VCPPoolBasedPixelBufferCreator *)self->_monochromeBufferCreator createPixelBuffer:&pixelBuffer];
  if (!v13)
  {
    int v52 = 0;
    CVPixelBufferRef v53 = a4;
    CVPixelBufferLockFlags v54 = 1;
    if (a4)
    {
      int v13 = CVPixelBufferLockBaseAddress(a4, 1uLL);
      int v52 = v13;
      if (!v13
        || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
        && (LODWORD(buf.data) = 134218240,
            *(void **)((char *)&buf.data + 4) = v53,
            WORD2(buf.height) = 1024,
            *(_DWORD *)((char *)&buf.height + 6) = v13,
            _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&buf, 0x12u), (int v13 = v52) == 0))
      {
        int v49 = 0;
        CVPixelBufferRef v50 = pixelBuffer;
        CVPixelBufferLockFlags unlockFlags = 0;
        if (pixelBuffer)
        {
          int v13 = CVPixelBufferLockBaseAddress(pixelBuffer, 0);
          int v49 = v13;
          if (!v13
            || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
            && (LODWORD(buf.data) = 134218240,
                *(void **)((char *)&buf.data + 4) = v50,
                WORD2(buf.height) = 1024,
                *(_DWORD *)((char *)&buf.height + 6) = v13,
                _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&buf, 0x12u), (int v13 = v49) == 0))
          {
            BaseAddress = (char *)CVPixelBufferGetBaseAddress(a4);
            size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
            if (v12)
            {
              unint64_t v47 = 0;
              uint64_t v16 = BytesPerRow;
              if (Width > v11) {
                uint64_t v16 = 1;
              }
              uint64_t v17 = 299 * v16;
              float v18 = 0.0;
              while (1)
              {
                buf.data = BaseAddress;
                buf.CGFloat height = 299;
                buf.CGFloat width = 299;
                buf.rowBytes = BytesPerRow;
                dest.data = CVPixelBufferGetBaseAddress(pixelBuffer);
                dest.CGFloat height = CVPixelBufferGetHeight(pixelBuffer);
                dest.CGFloat width = CVPixelBufferGetWidth(pixelBuffer);
                dest.rowBytes = CVPixelBufferGetBytesPerRow(pixelBuffer);
                int v13 = vImageScale_Planar8(&buf, &dest, 0, 0);
                if (v13) {
                  break;
                }
                int v13 = [v8 analyzePixelBuffer:pixelBuffer flags:0 results:a3 cancel:&__block_literal_global_302];
                if (v13) {
                  break;
                }
                double v19 = [*a3 objectForKeyedSubscript:@"BlurResults"];
                double v20 = [v19 firstObject];
                char v21 = [v20 objectForKeyedSubscript:@"attributes"];

                id v22 = [v21 objectForKeyedSubscript:@"sharpness"];
                uint64_t v23 = v22;
                if (v22)
                {
                  [v22 floatValue];
                  float v18 = v18 + v24;
                  ++v47;
                }

                BaseAddress += v17;
                if (!--v12) {
                  goto LABEL_41;
                }
              }
            }
            else
            {
              unint64_t v47 = 0;
              float v18 = 0.0;
LABEL_41:
              int v13 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v49);
              if (!v13)
              {
                int v13 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v52);
                if (!v13)
                {
                  os_signpost_id_t v61 = @"BlurResults";
                  int v58 = @"attributes";
                  CFTypeRef v56 = @"sharpness";
                  *(float *)&double v41 = v18 / (float)v47;
                  long long v42 = [NSNumber numberWithFloat:v41];
                  long long v57 = v42;
                  int v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
                  long long v59 = v43;
                  id v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
                  long long v60 = v44;
                  id v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
                  char v62 = v45;
                  *a3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];

                  int v13 = 0;
                }
              }
            }
          }
        }
        else
        {
          BOOL v33 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
          if (v33) {
            -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v33, v34, v35, v36, v37, v38, v39, v40);
          }
          int v13 = -50;
          int v49 = -50;
        }
        if (v50
          && !v49
          && CVPixelBufferUnlockBaseAddress(v50, unlockFlags)
          && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
        }
        if (v53
          && !v52
          && CVPixelBufferUnlockBaseAddress(v53, v54)
          && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
        }
      }
    }
    else
    {
      BOOL v25 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v25) {
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v25, v26, v27, v28, v29, v30, v31, v32);
      }
      int v13 = -50;
    }
  }
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBuffer);

  return v13;
}

uint64_t __69__VCPPreAnalyzer__performBlurAnalysis_withPixelBuffer_usingAnalyzer___block_invoke()
{
  return 0;
}

- (int)_performBlurAnalysis:(id *)a3 withLumaPixelBuffer:(__CVBuffer *)a4 abnormalDimension:(unint64_t)a5 isSDOF:(BOOL)a6
{
  v30[1] = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    uint64_t v29 = @"BlurResults";
    uint64_t v26 = @"attributes";
    float v24 = @"sharpness";
    BOOL v25 = &unk_1F15EAD38;
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1, a6);
    uint64_t v27 = v16;
    float v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    uint64_t v28 = v18;
    double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    v30[0] = v19;
    *a3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];

LABEL_13:
    int v20 = 0;
    goto LABEL_14;
  }
  BOOL v7 = a6;
  size_t v11 = VCPSignPostLog();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  int v13 = VCPSignPostLog();
  uint64_t v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)uint64_t v23 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "VCPSceneAnalyzerImageBlurAnalysis", "", v23, 2u);
  }

  id v15 = -[VCPImageBlurAnalyzer initWithFaceResults:sdof:revision:]([VCPImageBlurAnalyzer alloc], "initWithFaceResults:sdof:revision:", 0, v7, [(id)objc_opt_class() _getSHRevision]);
  uint64_t v16 = v15;
  if (a5) {
    int v17 = [(VCPPreAnalyzer *)self _performBlurAnalysis:a3 withPixelBuffer:a4 usingAnalyzer:v15];
  }
  else {
    int v17 = [(VCPImageBlurAnalyzer *)v15 analyzePixelBuffer:a4 flags:0 results:a3 cancel:&__block_literal_global_305];
  }
  int v20 = v17;
  if (!v17)
  {
    char v21 = VCPSignPostLog();
    float v18 = v21;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)uint64_t v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v18, OS_SIGNPOST_INTERVAL_END, v12, "VCPSceneAnalyzerImageBlurAnalysis", "", v23, 2u);
    }
    goto LABEL_13;
  }
LABEL_14:

  return v20;
}

uint64_t __84__VCPPreAnalyzer__performBlurAnalysis_withLumaPixelBuffer_abnormalDimension_isSDOF___block_invoke()
{
  return 0;
}

- (int)_performExposureAnalysis:(id *)a3 withLumaPixelBuffer:(__CVBuffer *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    double v19 = @"ExposureResults";
    uint64_t v16 = @"quality";
    int v17 = &unk_1F15EAD38;
    __int16 v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    float v18 = v10;
    int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    v20[0] = v13;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    int v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

    goto LABEL_11;
  }
  int v6 = VCPSignPostLog();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  id v8 = VCPSignPostLog();
  int v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "VCPSceneAnalyzerExposureAnalysis", "", v15, 2u);
  }

  __int16 v10 = objc_alloc_init(VCPImageExposurePreAnalyzer);
  int v11 = [(VCPImageExposurePreAnalyzer *)v10 analyzePixelBuffer:a4 flags:0 results:a3 cancel:&__block_literal_global_309];
  if (!v11)
  {
    os_signpost_id_t v12 = VCPSignPostLog();
    int v13 = v12;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)id v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v13, OS_SIGNPOST_INTERVAL_END, v7, "VCPSceneAnalyzerExposureAnalysis", "", v15, 2u);
    }
    goto LABEL_10;
  }
LABEL_11:

  return v11;
}

uint64_t __63__VCPPreAnalyzer__performExposureAnalysis_withLumaPixelBuffer___block_invoke()
{
  return 0;
}

- (int)_performRotationAnalysis:(id *)a3 withColorPixelBuffer:(__CVBuffer *)a4
{
  v77[1] = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    v76 = @"RotationAnalysisResults";
    CGFloat v73 = @"attributes";
    v71[0] = @"probableRotation";
    v71[1] = @"probableRotationConfidence";
    v72[0] = &unk_1F15ED5A8;
    v72[1] = &unk_1F15EAD48;
    os_signpost_id_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:2];
    id v74 = v12;
    int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
    v75 = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
    v77[0] = v14;
    *a3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:&v76 count:1];

    return 0;
  }
  os_signpost_id_t v7 = VCPSignPostLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  int v9 = VCPSignPostLog();
  __int16 v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(buf.data) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "VCPSceneAnalyzerRotationAnalysisScaling", "", (uint8_t *)&buf, 2u);
  }

  CVPixelBufferRef pixelBuffer = 0;
  int v11 = [(VCPPoolBasedPixelBufferCreator *)self->_rotationBufferCreator createPixelBuffer:&pixelBuffer];
  if (!v11)
  {
    CVPixelBufferRef v59 = a4;
    CVPixelBufferLockFlags unlockFlags = 1;
    int v11 = CVPixelBufferLockBaseAddress(a4, 1uLL);
    int v58 = v11;
    if (!v11
      || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
      && (LODWORD(buf.data) = 134218240,
          *(void **)((char *)&buf.data + 4) = v59,
          WORD2(buf.height) = 1024,
          *(_DWORD *)((char *)&buf.height + 6) = v11,
          _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&buf, 0x12u), (int v11 = v58) == 0))
    {
      buf.data = CVPixelBufferGetBaseAddress(a4);
      buf.CGFloat height = CVPixelBufferGetHeight(a4);
      buf.CGFloat width = CVPixelBufferGetWidth(a4);
      buf.rowBytes = CVPixelBufferGetBytesPerRow(a4);
      int v55 = 0;
      CVPixelBufferRef v56 = pixelBuffer;
      CVPixelBufferLockFlags v57 = 0;
      if (!pixelBuffer)
      {
        BOOL v42 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v42) {
          -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v42, v43, v44, v45, v46, v47, v48, v49);
        }
        int v11 = -50;
        goto LABEL_37;
      }
      int v11 = CVPixelBufferLockBaseAddress(pixelBuffer, 0);
      int v55 = v11;
      if (v11)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
          || (LODWORD(v69.data) = 134218240,
              *(void **)((char *)&v69.data + 4) = v56,
              WORD2(v69.height) = 1024,
              *(_DWORD *)((char *)&v69.height + 6) = v11,
              _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&v69, 0x12u), (int v11 = v55) != 0))
        {
LABEL_37:
          if (v59
            && !v58
            && CVPixelBufferUnlockBaseAddress(v59, unlockFlags)
            && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
          }
          goto LABEL_8;
        }
      }
      v69.data = CVPixelBufferGetBaseAddress(pixelBuffer);
      v69.CGFloat height = CVPixelBufferGetHeight(pixelBuffer);
      v69.CGFloat width = CVPixelBufferGetWidth(pixelBuffer);
      v69.rowBytes = CVPixelBufferGetBytesPerRow(pixelBuffer);
      int v11 = vImageScale_ARGB8888(&buf, &v69, 0, 0x20u);
      if (v11
        || (int v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v55)) != 0
        || (int v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v58)) != 0)
      {
LABEL_49:
        if (v56
          && !v55
          && CVPixelBufferUnlockBaseAddress(v56, v57)
          && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
        }
        goto LABEL_37;
      }
      uint64_t v16 = VCPSignPostLog();
      int v17 = v16;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        *(_WORD *)CVPixelBufferLockFlags v54 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v17, OS_SIGNPOST_INTERVAL_END, v8, "VCPSceneAnalyzerRotationAnalysisScaling", "", v54, 2u);
      }

      float v18 = VCPSignPostLog();
      os_signpost_id_t spid = os_signpost_id_generate(v18);

      double v19 = VCPSignPostLog();
      int v20 = v19;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        *(_WORD *)CVPixelBufferLockFlags v54 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v20, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPSceneAnalyzerRotationAnalysisInference", "", v54, 2u);
      }

      CVPixelBufferRef v21 = pixelBuffer;
      id v22 = [(VCPMAMLModel *)self->_rotationModel inputFeatureName];
      uint64_t v23 = +[VCPMAMLFeatureProvider featureProviderWithCVPixelBuffer:v21 andFeatureName:v22];

      float v24 = [(VCPMAMLModel *)self->_rotationModel model];
      id v53 = 0;
      int v52 = [v24 predictionFromFeatures:v23 error:&v53];
      id v50 = v53;

      BOOL v25 = [(VCPMAMLModel *)self->_rotationModel outputFeatureName];
      uint64_t v26 = [v52 featureValueForName:v25];

      uint64_t v27 = [v26 multiArrayValue];
      if ([v27 count] == 4)
      {
        uint64_t v28 = 0;
        __int16 v29 = 0;
        float v30 = 0.0;
        do
        {
          uint64_t v31 = [v27 objectAtIndexedSubscript:v28];
          [v31 floatValue];
          float v33 = v32;

          if (v33 > v30)
          {
            float v30 = v33;
            __int16 v29 = v28;
          }
          ++v28;
        }
        while (v28 != 4);
        __int16 v67 = @"RotationAnalysisResults";
        uint64_t v64 = @"attributes";
        v62[0] = @"probableRotation";
        uint64_t v34 = [NSNumber numberWithShort:v29];
        v63[0] = v34;
        v62[1] = @"probableRotationConfidence";
        *(float *)&double v35 = v30;
        uint64_t v36 = [NSNumber numberWithFloat:v35];
        v63[1] = v36;
        uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];
        __int16 v65 = v37;
        uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
        double v66 = v38;
        uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
        id v68 = v39;
        *a3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];

        uint64_t v40 = VCPSignPostLog();
        double v41 = v40;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
        {
          *(_WORD *)CVPixelBufferLockFlags v54 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v41, OS_SIGNPOST_INTERVAL_END, spid, "VCPSceneAnalyzerRotationAnalysisInference", "", v54, 2u);
        }
        int v11 = 0;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          int v11 = -18;
          goto LABEL_48;
        }
        double v41 = VCPLogInstance();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)CVPixelBufferLockFlags v54 = 0;
          _os_log_impl(&dword_1BBEDA000, v41, OS_LOG_TYPE_ERROR, "[ProbableRotation] invalid coreML results", v54, 2u);
        }
        int v11 = -18;
      }

LABEL_48:
      goto LABEL_49;
    }
  }
LABEL_8:
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBuffer);
  return v11;
}

- (int)_performEmbeddingAnalysis:(id *)a3 withColorPixelBuffer:(__CVBuffer *)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v7 = [NSString stringWithFormat:@"[VCPPreAnalyzer][Embedding]"];
  os_signpost_id_t v8 = VCPSignPostLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  __int16 v10 = VCPSignPostLog();
  int v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf.data) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPSceneAnalyzerEmbeddingAnalysisScaling", "", (uint8_t *)&buf, 2u);
  }

  CVPixelBufferRef pixelBuffer = 0;
  int v12 = [(VCPPoolBasedPixelBufferCreator *)self->_embeddingBufferCreator createPixelBuffer:&pixelBuffer];
  if (!v12)
  {
    int v49 = 0;
    CVPixelBufferRef v50 = a4;
    CVPixelBufferLockFlags unlockFlags = 1;
    if (!a4)
    {
      BOOL v29 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v29) {
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v29, v30, v31, v32, v33, v34, v35, v36);
      }
      int v12 = -50;
      goto LABEL_5;
    }
    int v12 = CVPixelBufferLockBaseAddress(a4, 1uLL);
    int v49 = v12;
    if (v12)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      LODWORD(buf.data) = 134218240;
      *(void **)((char *)&buf.data + 4) = v50;
      WORD2(buf.height) = 1024;
      *(_DWORD *)((char *)&buf.height + 6) = v12;
      _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&buf, 0x12u);
      int v12 = v49;
      if (v49) {
        goto LABEL_5;
      }
    }
    buf.data = CVPixelBufferGetBaseAddress(a4);
    buf.CGFloat height = CVPixelBufferGetHeight(a4);
    buf.CGFloat width = CVPixelBufferGetWidth(a4);
    buf.rowBytes = CVPixelBufferGetBytesPerRow(a4);
    int v46 = 0;
    CVPixelBufferRef v47 = pixelBuffer;
    CVPixelBufferLockFlags v48 = 0;
    if (!pixelBuffer)
    {
      BOOL v37 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v37) {
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v37, v38, v39, v40, v41, v42, v43, v44);
      }
      int v12 = -50;
      goto LABEL_36;
    }
    int v12 = CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    int v46 = v12;
    if (v12)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
        || (LODWORD(v55.data) = 134218240,
            *(void **)((char *)&v55.data + 4) = v47,
            WORD2(v55.height) = 1024,
            *(_DWORD *)((char *)&v55.height + 6) = v12,
            _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&v55, 0x12u), (int v12 = v46) != 0))
      {
LABEL_36:
        if (v50
          && !v49
          && CVPixelBufferUnlockBaseAddress(v50, unlockFlags)
          && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
        }
        goto LABEL_5;
      }
    }
    v55.data = CVPixelBufferGetBaseAddress(pixelBuffer);
    v55.CGFloat height = CVPixelBufferGetHeight(pixelBuffer);
    v55.CGFloat width = CVPixelBufferGetWidth(pixelBuffer);
    v55.rowBytes = CVPixelBufferGetBytesPerRow(pixelBuffer);
    int v12 = vImageScale_ARGB8888(&buf, &v55, 0, 0x20u);
    if (v12
      || (int v12 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v46)) != 0
      || (int v12 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v49)) != 0)
    {
LABEL_52:
      if (v47
        && !v46
        && CVPixelBufferUnlockBaseAddress(v47, v48)
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
      }
      goto LABEL_36;
    }
    uint64_t v14 = VCPSignPostLog();
    id v15 = v14;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)id v53 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v15, OS_SIGNPOST_INTERVAL_END, v9, "VCPSceneAnalyzerEmbeddingAnalysisScaling", "", v53, 2u);
    }

    uint64_t v16 = VCPSignPostLog();
    os_signpost_id_t v17 = os_signpost_id_generate(v16);

    float v18 = VCPSignPostLog();
    double v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)id v53 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "VCPSceneAnalyzerEmbeddingAnalysisInference", "", v53, 2u);
    }

    int v20 = [VCPImageBackboneAnalyzer alloc];
    CVPixelBufferRef v21 = objc_msgSend(NSNumber, "numberWithInteger:", +[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision"));
    id v22 = [(VCPImageBackboneAnalyzer *)v20 initWithRequestedAnalyses:0x1000000000000 andRevision:v21 useSharedModel:1];

    int v12 = [(VCPImageBackboneAnalyzer *)v22 analyzePixelBuffer:pixelBuffer flags:0 results:a3 cancel:&__block_literal_global_323];
    if (v12)
    {
LABEL_51:

      goto LABEL_52;
    }
    uint64_t v23 = VCPSignPostLog();
    float v24 = v23;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)id v53 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v24, OS_SIGNPOST_INTERVAL_END, v17, "VCPSceneAnalyzerEmbeddingAnalysisInference", "", v53, 2u);
    }

    BOOL v25 = [*a3 objectForKeyedSubscript:@"ImageEmbeddingResults"];
    if ([v25 count])
    {
      uint64_t v26 = [v25 firstObject];
      uint64_t v27 = [v26 objectForKeyedSubscript:@"attributes"];
      uint64_t v28 = [v27 objectForKeyedSubscript:@"embeddings"];

      if (v28)
      {
        int v12 = 0;
LABEL_49:

LABEL_50:
        goto LABEL_51;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v45 = VCPLogInstance();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id v53 = 138412290;
          CVPixelBufferLockFlags v54 = v7;
          _os_log_impl(&dword_1BBEDA000, v45, OS_LOG_TYPE_ERROR, "%@ Empty embedding data", v53, 0xCu);
        }
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v12 = -18;
        goto LABEL_50;
      }
      uint64_t v28 = VCPLogInstance();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id v53 = 138412290;
        CVPixelBufferLockFlags v54 = v7;
        _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_ERROR, "%@ Empty embedding results", v53, 0xCu);
      }
    }
    int v12 = -18;
    goto LABEL_49;
  }
LABEL_5:
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBuffer);

  return v12;
}

uint64_t __65__VCPPreAnalyzer__performEmbeddingAnalysis_withColorPixelBuffer___block_invoke()
{
  return 0;
}

- (int)_performWallpaperAnalysis:(id *)a3 withSceneprint:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (!v5)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      uint64_t v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_DEFAULT, "No sceneprint data for WP analysis; return default value",
          v16,
          2u);
      }
    }
    int v20 = @"WPResults";
    os_signpost_id_t v17 = @"wallpaperScore";
    float v18 = &unk_1F15EAD38;
    __int16 v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    double v19 = v10;
    int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    v21[0] = v13;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    int v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  int v6 = VCPSignPostLog();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  os_signpost_id_t v8 = VCPSignPostLog();
  os_signpost_id_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "VCPWallpaperAnalysis", "", v16, 2u);
  }

  __int16 v10 = objc_alloc_init(VCPWallpaperAnalyzer);
  int v11 = [(VCPWallpaperAnalyzer *)v10 analyzeWithSceneprint:v5 results:a3 cancel:&__block_literal_global_327];
  if (!v11)
  {
    int v12 = VCPSignPostLog();
    int v13 = v12;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v13, OS_SIGNPOST_INTERVAL_END, v7, "VCPWallpaperAnalysis", "", v16, 2u);
    }
LABEL_14:
  }
  return v11;
}

uint64_t __59__VCPPreAnalyzer__performWallpaperAnalysis_withSceneprint___block_invoke()
{
  return 0;
}

- (int)_performAnalysis:(id *)a3 mediaType:(int64_t)a4 mediaSubtypes:(unint64_t)a5 abnormalDimension:(unint64_t)a6 colorPixelBuffer:(__CVBuffer *)a7 andLumaPixelBuffer:(__CVBuffer *)a8 image:(id)a9
{
  id v15 = a9;
  uint64_t v85 = 0;
  BOOL v86 = &v85;
  uint64_t v87 = 0x2020000000;
  int v88 = 0;
  uint64_t v81 = 0;
  id v82 = &v81;
  uint64_t v83 = 0x2020000000;
  int v84 = 0;
  uint64_t v77 = 0;
  id v78 = &v77;
  uint64_t v79 = 0x2020000000;
  int v80 = 0;
  uint64_t v73 = 0;
  id v74 = &v73;
  uint64_t v75 = 0x2020000000;
  int v76 = 0;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x2020000000;
  int v72 = 0;
  uint64_t v63 = 0;
  uint64_t v64 = &v63;
  uint64_t v65 = 0x3032000000;
  double v66 = __Block_byref_object_copy__40;
  __int16 v67 = __Block_byref_object_dispose__40;
  id v68 = 0;
  uint64_t v57 = 0;
  int v58 = &v57;
  uint64_t v59 = 0x3032000000;
  long long v60 = __Block_byref_object_copy__40;
  os_signpost_id_t v61 = __Block_byref_object_dispose__40;
  id v62 = 0;
  uint64_t v51 = 0;
  int v52 = &v51;
  uint64_t v53 = 0x3032000000;
  CVPixelBufferLockFlags v54 = __Block_byref_object_copy__40;
  vImage_Buffer v55 = __Block_byref_object_dispose__40;
  id v56 = 0;
  uint64_t v45 = 0;
  int v46 = &v45;
  uint64_t v47 = 0x3032000000;
  CVPixelBufferLockFlags v48 = __Block_byref_object_copy__40;
  int v49 = __Block_byref_object_dispose__40;
  id v50 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = __Block_byref_object_copy__40;
  uint64_t v43 = __Block_byref_object_dispose__40;
  id v44 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __119__VCPPreAnalyzer__performAnalysis_mediaType_mediaSubtypes_abnormalDimension_colorPixelBuffer_andLumaPixelBuffer_image___block_invoke;
  block[3] = &unk_1E629B6E8;
  float v24 = &v77;
  BOOL v25 = &v51;
  void block[4] = self;
  unint64_t v35 = a5;
  unint64_t v36 = a6;
  id v16 = v15;
  id v23 = v16;
  uint64_t v26 = &v85;
  uint64_t v27 = &v63;
  uint64_t v28 = &v81;
  BOOL v29 = &v57;
  uint64_t v30 = &v73;
  uint64_t v31 = &v45;
  BOOL v37 = a8;
  uint64_t v38 = a7;
  uint64_t v32 = &v69;
  uint64_t v33 = &v39;
  int64_t v34 = a4;
  dispatch_apply(5uLL, 0, block);
  if (*((_DWORD *)v86 + 6)
    || *((_DWORD *)v82 + 6)
    || *((_DWORD *)v78 + 6)
    || *((_DWORD *)v74 + 6)
    || *((_DWORD *)v70 + 6))
  {
    int v17 = 1;
  }
  else
  {
    double v19 = [MEMORY[0x1E4F1CA60] dictionary];
    [v19 addEntriesFromDictionary:v64[5]];
    [v19 addEntriesFromDictionary:v58[5]];
    [v19 addEntriesFromDictionary:v52[5]];
    if ([(id)objc_opt_class() _includeRotation]) {
      [v19 addEntriesFromDictionary:v46[5]];
    }
    if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled]) {
      [v19 addEntriesFromDictionary:v40[5]];
    }
    id v20 = v19;
    *a3 = v20;

    int v17 = 0;
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(&v85, 8);

  return v17;
}

void __119__VCPPreAnalyzer__performAnalysis_mediaType_mediaSubtypes_abnormalDimension_colorPixelBuffer_andLumaPixelBuffer_image___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = v2;
  uint64_t v23 = v3;
  uint64_t v24 = v4;
  switch(a2)
  {
    case 0:
      uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
      obuint64_t j = *(id *)(v6 + 40);
      int v7 = [*(id *)(a1 + 32) _performSceneAnalysis:&obj image:*(void *)(a1 + 40) mediaType:*(void *)(a1 + 128) mediaSubtypes:*(void *)(a1 + 136) abnormalDimension:*(void *)(a1 + 144)];
      objc_storeStrong((id *)(v6 + 40), obj);
      uint64_t v8 = *(void *)(a1 + 48);
      break;
    case 1:
      int v13 = *(void **)(a1 + 32);
      uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
      id v20 = *(id *)(v14 + 40);
      LODWORD(v13) = objc_msgSend(v13, "_performBlurAnalysis:withLumaPixelBuffer:abnormalDimension:isSDOF:", &v20, *(void *)(a1 + 152), *(void *)(a1 + 144), objc_msgSend((id)objc_opt_class(), "_isSDOFWithMediaType:andMediaSubtypes:", *(void *)(a1 + 128), *(void *)(a1 + 136)));
      objc_storeStrong((id *)(v14 + 40), v20);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v13;
      return;
    case 2:
      os_signpost_id_t v9 = *(void **)(a1 + 32);
      uint64_t v10 = *(void *)(*(void *)(a1 + 88) + 8);
      id v19 = *(id *)(v10 + 40);
      int v7 = [v9 _performExposureAnalysis:&v19 withLumaPixelBuffer:*(void *)(a1 + 152)];
      objc_storeStrong((id *)(v10 + 40), v19);
      uint64_t v8 = *(void *)(a1 + 80);
      break;
    case 3:
      if (![(id)objc_opt_class() _includeRotation]) {
        return;
      }
      id v15 = *(void **)(a1 + 32);
      uint64_t v16 = *(void *)(*(void *)(a1 + 104) + 8);
      id v18 = *(id *)(v16 + 40);
      int v7 = [v15 _performRotationAnalysis:&v18 withColorPixelBuffer:*(void *)(a1 + 160)];
      objc_storeStrong((id *)(v16 + 40), v18);
      uint64_t v8 = *(void *)(a1 + 96);
      break;
    case 4:
      if (!+[VCPVideoCNNAnalyzer isMUBackboneEnabled]) {
        return;
      }
      int v11 = *(void **)(a1 + 32);
      uint64_t v12 = *(void *)(*(void *)(a1 + 120) + 8);
      id v17 = *(id *)(v12 + 40);
      int v7 = [v11 _performEmbeddingAnalysis:&v17 withColorPixelBuffer:*(void *)(a1 + 160)];
      objc_storeStrong((id *)(v12 + 40), v17);
      uint64_t v8 = *(void *)(a1 + 112);
      break;
    default:
      return;
  }
  *(_DWORD *)(*(void *)(v8 + 8) + 24) = v7;
}

- (void)analyzeWithImageURL:(id)a3 mediaType:(int64_t)a4 mediaSubtypes:(unint64_t)a5 abnormalDimension:(unint64_t)a6 completionHandler:(id)a7
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  uint64_t v12 = (void (**)(id, uint64_t, void))a7;
  context = (void *)MEMORY[0x1C186D320]();
  int v13 = VCPSignPostLog();
  os_signpost_id_t v14 = os_signpost_id_generate(v13);

  id v15 = VCPSignPostLog();
  uint64_t v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)vImage_Buffer buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "VCPSceneAnalyzerLoadImageRequestHandler", "", buf, 2u);
  }

  id v50 = 0;
  uint64_t v51 = 0;
  imageLoader = self->_imageLoader;
  id v18 = [(id)objc_opt_class() _nonPanoPreWarmDimensions];
  id v49 = 0;
  uint64_t v19 = [(VCPPreAnalysisImageLoader *)imageLoader loadImageURL:v39 abnormalDimension:a6 withNonPanoPreWarmSizes:v18 toColorPixelBuffer:&v50 lumaPixelBuffer:&v51 andImage:&v49];
  id v20 = v49;

  CVPixelBufferRef v21 = VCPSignPostLog();
  uint64_t v22 = v21;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)vImage_Buffer buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v22, OS_SIGNPOST_INTERVAL_END, v14, "VCPSceneAnalyzerLoadImageRequestHandler", "", buf, 2u);
  }

  if (v19)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)vImage_Buffer buf = 138412290;
        id v53 = v39;
        _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_ERROR, "Failed to load imageURL: %@", buf, 0xCu);
      }
    }
    v12[2](v12, v19, 0);
  }
  else if ([(id)objc_opt_class() _enableSceneAssetConcurrency])
  {
    BOOL v37 = v12;
    if (v51) {
      CFTypeRef v24 = CFRetain(v51);
    }
    else {
      CFTypeRef v24 = 0;
    }
    if (v50)
    {
      CFTypeRef v33 = CFRetain(v50);
      CFTypeRef v34 = v24;
    }
    else
    {
      CFTypeRef v34 = v24;
      CFTypeRef v33 = 0;
    }
    dispatch_group_wait((dispatch_group_t)self->_processingGroup, 0xFFFFFFFFFFFFFFFFLL);
    processingGroup = self->_processingGroup;
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__VCPPreAnalyzer_analyzeWithImageURL_mediaType_mediaSubtypes_abnormalDimension_completionHandler___block_invoke;
    block[3] = &unk_1E629B710;
    void block[4] = self;
    int64_t v44 = a4;
    unint64_t v45 = a5;
    unint64_t v46 = a6;
    CFTypeRef v47 = v33;
    CFTypeRef v48 = v34;
    id v42 = v20;
    uint64_t v12 = v37;
    uint64_t v43 = v37;
    dispatch_group_async(processingGroup, processingQueue, block);
  }
  else
  {
    BOOL v25 = VCPSignPostLog();
    os_signpost_id_t v26 = os_signpost_id_generate(v25);

    uint64_t v27 = VCPSignPostLog();
    uint64_t v28 = v27;
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)vImage_Buffer buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "VCPSceneAnalyzerPerformAnalysis", "", buf, 2u);
    }

    id v40 = 0;
    uint64_t v29 = [(VCPPreAnalyzer *)self _performAnalysis:&v40 mediaType:a4 mediaSubtypes:a5 abnormalDimension:a6 colorPixelBuffer:v50 andLumaPixelBuffer:v51 image:v20];
    id v30 = v40;
    uint64_t v31 = VCPSignPostLog();
    uint64_t v32 = v31;
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)vImage_Buffer buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v32, OS_SIGNPOST_INTERVAL_END, v26, "VCPSceneAnalyzerPerformAnalysis", "", buf, 2u);
    }

    ((void (**)(id, uint64_t, id))v12)[2](v12, v29, v30);
  }

  CF<opaqueCMSampleBuffer *>::~CF(&v50);
  CF<opaqueCMSampleBuffer *>::~CF(&v51);
}

void __98__VCPPreAnalyzer_analyzeWithImageURL_mediaType_mediaSubtypes_abnormalDimension_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  uint64_t v4 = VCPSignPostLog();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)vImage_Buffer buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPSceneAnalyzerPerformAnalysis", "", buf, 2u);
  }

  id v12 = 0;
  [*(id *)(a1 + 32) _performAnalysis:&v12 mediaType:*(void *)(a1 + 56) mediaSubtypes:*(void *)(a1 + 64) abnormalDimension:*(void *)(a1 + 72) colorPixelBuffer:*(void *)(a1 + 80) andLumaPixelBuffer:*(void *)(a1 + 88) image:*(void *)(a1 + 40)];
  id v6 = v12;
  int v7 = VCPSignPostLog();
  uint64_t v8 = v7;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)int v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v8, OS_SIGNPOST_INTERVAL_END, v3, "VCPSceneAnalyzerPerformAnalysis", "", v11, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  os_signpost_id_t v9 = *(const void **)(a1 + 88);
  if (v9) {
    CFRelease(v9);
  }
  uint64_t v10 = *(const void **)(a1 + 80);
  if (v10) {
    CFRelease(v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ivsPool, 0);
  objc_storeStrong((id *)&self->_rotationBufferCreator, 0);
  objc_storeStrong((id *)&self->_rotationModel, 0);
  objc_storeStrong((id *)&self->_sessionPool, 0);
  objc_storeStrong((id *)&self->_embeddingBufferCreator, 0);
  objc_storeStrong((id *)&self->_monochromeBufferCreator, 0);
  objc_storeStrong((id *)&self->_imageLoader, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_processingGroup, 0);
}

- (void)_collectSceneAnalysisResults:(os_log_t)log fromRequests:wpResults:ivsResults:abnormalDimension:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)vImage_Buffer buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_FAULT, "Unnormalized salientObject narrowed bounding box %@; skip",
    buf,
    0xCu);
}

@end