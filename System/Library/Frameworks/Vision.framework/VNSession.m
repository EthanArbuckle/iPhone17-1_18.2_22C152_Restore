@interface VNSession
+ (Class)trackerClassForOptions:(id)a3 error:(id *)a4;
+ (id)globalSession;
- (BOOL)prepareForPerformingRequests:(id)a3 error:(id *)a4;
- (VNSession)init;
- (VNSession)initWithCachingBehavior:(unint64_t)a3;
- (id)_cachedDetectorOfClass:(Class)a3 configuredWithOptions:(id)a4;
- (id)_cachedTrackerResourcesConfiguredWithOptions:(id)a3;
- (id)_frameworkManagerWithError:(uint64_t)a1;
- (id)_locateDetectorOfClass:(void *)a3 configuredWithOptions:(int)a4 allowingCreation:(void *)a5 error:;
- (id)_locateRPNTrackerResourcesForOptions:(int)a3 allowingCreation:(void *)a4 error:;
- (id)_locateResourceObjectForIdentifier:(id)a3 creationBlock:(id)a4 error:(id *)a5;
- (id)cachedResourceObjectForIdentifier:(id)a3;
- (id)createRPNTrackerResourcesConfiguredWithOptions:(id)a3 error:(id *)a4;
- (id)detectorOfClass:(Class)a3 configuredWithOptions:(id)a4 error:(id *)a5;
- (id)detectorOfType:(id)a3 configuredWithOptions:(id)a4 error:(id *)a5;
- (id)loadedDetectors;
- (id)resourceObjectForIdentifier:(id)a3 creationBlock:(id)a4 error:(id *)a5;
- (id)trackerResourcesConfiguredWithOptions:(id)a3 error:(id *)a4;
- (id)trackerWithOptions:(id)a3 error:(id *)a4;
- (id)vnciContextManager;
- (id)vncvPixelBufferPoolManager;
- (id)vnvtSessionManager;
- (void)_releaseAllDetectors;
- (void)_releaseDetectorTypes:(uint64_t)a1;
- (void)_releaseDetectorsThatCanBeReplacedByDetectorOfClass:(Class)a3 withConfiguration:(id)a4;
- (void)dealloc;
- (void)detectorCache:(id)a3 didCacheDetector:(id)a4;
- (void)detectorCache:(id)a3 didEvictDetector:(id)a4;
- (void)legacyForcedCleanupOfFacePipelineWithLevel:(id)a3;
- (void)legacyForcedCleanupOfJunkPipelineWithLevel:(id)a3;
- (void)legacyForcedCleanupOfScenePipelineWithLevel:(id)a3;
- (void)legacyForcedCleanupOfSmartCamPipelineWithLevel:(id)a3;
- (void)legacyForcedCleanupWithOptions:(id)a3;
- (void)releaseCachedResources;
- (void)releaseCachedResourcesWithCompletionBlock:(id)a3;
- (void)releaseDetectorsThatCanBeReplacedByDetectorOfClass:(Class)a3 withConfiguration:(id)a4;
- (void)releaseTracker:(id)a3;
@end

@implementation VNSession

- (VNSession)init
{
  return [(VNSession *)self initWithCachingBehavior:1];
}

- (void)detectorCache:(id)a3 didCacheDetector:(id)a4
{
  id v4 = a4;
  [(id)objc_opt_class() VNClassCode];
  kdebug_trace();
}

- (BOOL)prepareForPerformingRequests:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  context = (void *)MEMORY[0x1A6257080]();
  if (v5)
  {
    id v44 = 0;
    BOOL v6 = +[VNValidationUtilities validateArray:v5 named:@"requests" hasElementsOfClass:objc_opt_class() requiredMinimumCount:0 allowedMaximumCount:0 error:&v44];
    id v7 = v44;
    if (v6)
    {
      v33 = objc_alloc_init(VNRequestPerformer);
      v8 = [[VNRequestPerformingContext alloc] initWithSession:self requestPerformer:v33 imageBuffer:0 forensics:0 observationsCache:0];
      v9 = v8;
      [(VNRequestPerformingContext *)v8 qosClass];
      id v43 = v7;
      v35 = [(VNRequestPerformer *)v33 dependencyAnalyzedRequestsForRequests:v5 withPerformingContext:v8 error:&v43];
      id v34 = v43;

      if (v35)
      {
        -[VNRequestPerformer orderedRequestsForRequests:](v33, "orderedRequestsForRequests:");
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v45 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v40;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v40 != v12) {
                objc_enumerationMutation(v10);
              }
              v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              id v38 = 0;
              char v15 = [v14 warmUpSession:self error:&v38];
              id v16 = v38;
              v17 = v16;
              if ((v15 & 1) == 0)
              {
                id v20 = [NSString alloc];
                v21 = [v17 localizedDescription];
                v8 = v9;
                v22 = (void *)[v20 initWithFormat:@"%@ could not be warmed up (%@)", v14, v21];

                id v23 = v22;
                uint64_t v24 = [v23 UTF8String];
                VNValidatedLog(4, @"%s", v25, v26, v27, v28, v29, v30, v24);
                uint64_t v31 = +[VNError errorForOperationFailedErrorWithLocalizedDescription:v23 underlyingError:v17];

                int v18 = 0;
                id v34 = (id)v31;
                goto LABEL_16;
              }
            }
            v8 = v9;
            uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v45 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
        int v18 = 1;
LABEL_16:
      }
      else
      {
        int v18 = 0;
      }

      BOOL v19 = v18 != 0;
      id v7 = v34;
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    id v7 = 0;
    BOOL v19 = 1;
  }
  if (!v5) {
    BOOL v19 = 1;
  }
  if (a4 && !v19) {
    *a4 = v7;
  }

  return v19;
}

- (id)detectorOfType:(id)a3 configuredWithOptions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[VNDetector detectorClassAndConfigurationOptions:0 forDetectorType:v8 options:v9 error:a5];
  if (v10)
  {
    uint64_t v11 = [(VNSession *)self detectorOfClass:v10 configuredWithOptions:v9 error:a5];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)detectorOfClass:(Class)a3 configuredWithOptions:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(objc_class *)a3 fullyPopulatedConfigurationOptionsWithOverridingOptions:v8];
  [v9 removeObjectForKey:@"VNDetectorProcessOption_Session"];
  [v9 removeObjectForKey:@"VNDetectorProcessOption_Canceller"];
  id v10 = +[VNFrameworkManager manager];
  uint64_t v11 = [v10 detectorAccessingLock];

  [v11 lock];
  uint64_t v12 = -[VNSession _locateDetectorOfClass:configuredWithOptions:allowingCreation:error:]((uint64_t)self, (uint64_t)a3, v9, 1, a5);
  [v11 unlock];

  return v12;
}

- (id)_locateDetectorOfClass:(void *)a3 configuredWithOptions:(int)a4 allowingCreation:(void *)a5 error:
{
  id v9 = a3;
  if (a1)
  {
    if (a4) {
      id v10 = 0;
    }
    else {
      id v10 = a5;
    }
    uint64_t v11 = [*(id *)(a1 + 24) detectorOfClass:a2 configuredWithOptions:v9 error:v10];
    if (!v11 && (a4 & 1) != 0)
    {
      uint64_t v12 = -[VNSession _frameworkManagerWithError:](a1, a5);
      v13 = v12;
      if (v12)
      {
        uint64_t v11 = [v12 detectorOfClass:a2 configuredWithOptions:v9 forSession:a1 error:a5];
        if (v11) {
          [*(id *)(a1 + 24) cacheDetector:v11];
        }
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)_frameworkManagerWithError:(uint64_t)a1
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
  }
  else if (a2)
  {
    *a2 = +[VNError errorForInternalErrorWithLocalizedDescription:@"framework manager is unavailable"];
  }

  return v4;
}

- (void)_releaseDetectorsThatCanBeReplacedByDetectorOfClass:(Class)a3 withConfiguration:(id)a4
{
}

- (id)_cachedDetectorOfClass:(Class)a3 configuredWithOptions:(id)a4
{
  id v4 = -[VNSession _locateDetectorOfClass:configuredWithOptions:allowingCreation:error:]((uint64_t)self, (uint64_t)a3, a4, 0, 0);

  return v4;
}

+ (id)globalSession
{
  if (+[VNSession globalSession]::onceToken != -1) {
    dispatch_once(&+[VNSession globalSession]::onceToken, &__block_literal_global_24902);
  }
  v2 = (void *)+[VNSession globalSession]::ourGlobalSession;

  return v2;
}

- (VNSession)initWithCachingBehavior:(unint64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)VNSession;
  v3 = [(VNSession *)&v18 init];
  if (v3)
  {
    id v4 = +[VNFrameworkManager manager];
    +[VNError VNAssert:v4 != 0 log:@"Cannot create framework manager singleton"];
    objc_storeWeak((id *)&v3->_frameworkManager, v4);
    id v5 = objc_alloc_init(VNDetectorCache);
    detectorCache_onlyAccessWithDetectorAccessingLock = v3->_detectorCache_onlyAccessWithDetectorAccessingLock;
    v3->_detectorCache_onlyAccessWithDetectorAccessingLock = v5;

    [(VNDetectorCache *)v3->_detectorCache_onlyAccessWithDetectorAccessingLock setDelegate:v3];
    id v7 = objc_alloc_init(VNRPNTrackerEspressoResourcesCache);
    trackerResourceCache = v3->_trackerResourceCache;
    v3->_trackerResourceCache = v7;

    id v9 = objc_alloc_init(VNVTSessionManager);
    vtSessionManager = v3->_vtSessionManager;
    v3->_vtSessionManager = v9;

    uint64_t v11 = objc_alloc_init(VNCIContextManager);
    ciContextManager = v3->_ciContextManager;
    v3->_ciContextManager = v11;

    v13 = objc_alloc_init(VNCVPixelBufferPoolManager);
    cvPixelBufferPoolManager = v3->_cvPixelBufferPoolManager;
    v3->_cvPixelBufferPoolManager = v13;

    char v15 = objc_alloc_init(VNTrackerManager);
    trackerManager = v3->_trackerManager;
    v3->_trackerManager = v15;

    kdebug_trace();
    [v4 registerSession:v3];
  }
  return v3;
}

+ (Class)trackerClassForOptions:(id)a3 error:(id *)a4
{
  id v4 = +[VNTrackerManager trackerClassForOptions:error:]((uint64_t)VNTrackerManager, a3, a4);

  return (Class)v4;
}

uint64_t __26__VNSession_globalSession__block_invoke()
{
  +[VNSession globalSession]::ourGlobalSession = objc_alloc_init(_VNGlobalSession);

  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackerManager, 0);
  objc_storeStrong((id *)&self->_cvPixelBufferPoolManager, 0);
  objc_storeStrong((id *)&self->_ciContextManager, 0);
  objc_storeStrong((id *)&self->_vtSessionManager, 0);
  objc_storeStrong((id *)&self->_trackerResourceCache, 0);
  objc_storeStrong((id *)&self->_detectorCache_onlyAccessWithDetectorAccessingLock, 0);
  objc_storeStrong((id *)&self->_resourceObjectsCache_onlyAccessWithSessionResourcesAccessingLock, 0);

  objc_destroyWeak((id *)&self->_frameworkManager);
}

- (void)legacyForcedCleanupOfJunkPipelineWithLevel:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isEqualToString:@"VNCleanupLevel_Partial"] & 1) == 0
    && [v4 isEqualToString:@"VNCleanupLevel_Complete"])
  {
    v6[0] = @"VNJunkIdentifierType";
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    -[VNSession _releaseDetectorTypes:]((uint64_t)self, v5);
  }
}

- (void)_releaseDetectorTypes:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = +[VNDetector detectorClassForDetectorType:error:](VNDetector, "detectorClassForDetectorType:error:", *(void *)(*((void *)&v14 + 1) + 8 * i), 0, (void)v14);
          if (v9) {
            [v4 addObject:v9];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v6);
    }

    id v10 = [v4 allObjects];
    if ([v10 count])
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __40__VNSession__releaseDetectorsOfClasses___block_invoke;
      v18[3] = &unk_1E5B1E578;
      id v19 = v10;
      uint64_t v11 = v18;
      uint64_t v12 = +[VNFrameworkManager manager];
      v13 = [v12 detectorAccessingLock];

      [v13 lock];
      [*(id *)(a1 + 24) evictDetectorsPassingTest:v11];
      [v13 unlock];
    }
  }
}

uint64_t __40__VNSession__releaseDetectorsOfClasses___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_opt_isKindOfClass())
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)legacyForcedCleanupOfSmartCamPipelineWithLevel:(id)a3
{
  v6[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isEqualToString:@"VNCleanupLevel_Partial"] & 1) == 0
    && [v4 isEqualToString:@"VNCleanupLevel_Complete"])
  {
    v6[0] = @"VNSmartCamClassifierType";
    v6[1] = @"VNAttentionBasedSaliencyHeatmapBoundingBoxGeneratorType";
    void v6[2] = @"VNObjectnessBasedSaliencyHeatmapBoundingBoxGeneratorType";
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
    -[VNSession _releaseDetectorTypes:]((uint64_t)self, v5);
  }
}

- (void)legacyForcedCleanupOfScenePipelineWithLevel:(id)a3
{
  v6[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isEqualToString:@"VNCleanupLevel_Partial"] & 1) == 0
    && [v4 isEqualToString:@"VNCleanupLevel_Complete"])
  {
    v6[0] = @"VNImageAnalyzerMultiDetectorType";
    v6[1] = @"VNAttentionBasedSaliencyHeatmapBoundingBoxGeneratorType";
    void v6[2] = @"VNObjectnessBasedSaliencyHeatmapBoundingBoxGeneratorType";
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
    -[VNSession _releaseDetectorTypes:]((uint64_t)self, v5);
  }
}

- (void)legacyForcedCleanupOfFacePipelineWithLevel:(id)a3
{
  v15[7] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    if ([v4 isEqualToString:@"VNCleanupLevel_Partial"])
    {
      id v6 = &__block_literal_global_67_24975;
      if (self)
      {
        uint64_t v7 = +[VNFrameworkManager manager];
        id v8 = [v7 detectorAccessingLock];

        [v8 lock];
        detectorCache_onlyAccessWithDetectorAccessingLock = self->_detectorCache_onlyAccessWithDetectorAccessingLock;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __43__VNSession__enumerateDetectorsUsingBlock___block_invoke;
        v13[3] = &unk_1E5B1E550;
        id v10 = &__block_literal_global_67_24975;
        id v14 = &__block_literal_global_67_24975;
        [(VNDetectorCache *)detectorCache_onlyAccessWithDetectorAccessingLock evictDetectorsPassingTest:v13];

        [v8 unlock];
      }
    }
    else if ([v5 isEqualToString:@"VNCleanupLevel_Complete"])
    {
      v15[0] = @"VNFaceDetectorType";
      v15[1] = @"VNFaceBoxAlignerType";
      v15[2] = @"VNFaceLandmarkDetectorType";
      v15[3] = @"VNFaceExpressionDetectorType";
      v15[4] = @"VNFaceAnalyzerMultiDetectorType";
      v15[5] = @"VNANFDMultiDetectorType";
      v15[6] = @"VNFaceQualityGeneratorType";
      long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:7];
      -[VNSession _releaseDetectorTypes:]((uint64_t)self, v11);

      long long v12 = +[VNFrameworkManager manager];
      [v12 releaseMetalDeviceWisdomParameters];
    }
  }
}

uint64_t __43__VNSession__enumerateDetectorsUsingBlock___block_invoke(uint64_t a1)
{
  return 0;
}

void __56__VNSession_legacyForcedCleanupOfFacePipelineWithLevel___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v2 purgeIntermediates];
  }
}

- (void)legacyForcedCleanupWithOptions:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    uint64_t v5 = [v4 objectForKey:@"VNRequestHandlerCleanupOption_AllPipelines"];
    id v6 = [v11 objectForKey:@"VNRequestHandlerCleanupOption_FacePipeline"];
    if (!v6) {
      id v6 = v5;
    }
    id v7 = [v11 objectForKey:@"VNRequestHandlerCleanupOption_ScenePipeline"];
    if (!v7) {
      id v7 = v5;
    }
    id v8 = [v11 objectForKey:@"VNRequestHandlerCleanupOption_SmartCamPipeline"];
    if (!v8) {
      id v8 = v5;
    }
    id v9 = [v11 objectForKey:@"VNRequestHandlerCleanupOption_JunkPipeline"];
    if (v9)
    {
      if (!v5) {
        goto LABEL_14;
      }
    }
    else
    {
      id v9 = v5;
      if (!v5) {
        goto LABEL_14;
      }
    }
    if ([v5 isEqualToString:@"VNCleanupLevel_Complete"])
    {
      -[VNSession _releaseAllDetectors]((uint64_t)self);
      id v10 = +[VNFrameworkManager manager];
      [v10 releaseMetalDeviceWisdomParameters];

LABEL_15:
      id v4 = v11;
      goto LABEL_16;
    }
LABEL_14:
    [(VNSession *)self legacyForcedCleanupOfFacePipelineWithLevel:v6];
    [(VNSession *)self legacyForcedCleanupOfScenePipelineWithLevel:v7];
    [(VNSession *)self legacyForcedCleanupOfSmartCamPipelineWithLevel:v8];
    [(VNSession *)self legacyForcedCleanupOfJunkPipelineWithLevel:v9];
    goto LABEL_15;
  }
LABEL_16:
}

- (void)_releaseAllDetectors
{
  if (a1)
  {
    id v2 = +[VNFrameworkManager manager];
    id v3 = [v2 detectorAccessingLock];

    [v3 lock];
    [*(id *)(a1 + 24) evictAllDetectors];
    [v3 unlock];
  }
}

- (void)releaseTracker:(id)a3
{
  trackerManager = self->_trackerManager;
  id v4 = a3;
  uint64_t v5 = v4;
  if (trackerManager)
  {
    trackersCollectionManagementQueue = trackerManager->_trackersCollectionManagementQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35__VNTrackerManager_releaseTracker___block_invoke;
    v7[3] = &unk_1E5B1D4F8;
    v7[4] = trackerManager;
    id v8 = v4;
    dispatch_sync(trackersCollectionManagementQueue, v7);
  }
}

- (id)trackerWithOptions:(id)a3 error:(id *)a4
{
  trackerManager = self->_trackerManager;
  id v6 = a3;
  id v7 = v6;
  if (trackerManager)
  {
    id v8 = [v6 objectForKeyedSubscript:@"VNTrackingOption_TrackerKey"];
    if (!v8)
    {
      if (!a4)
      {
        id v11 = 0;
LABEL_31:

        goto LABEL_32;
      }
      id v10 = [NSString stringWithFormat:@"A tracker cannot be created without specifying a unique tracker key"];
      +[VNError errorWithCode:5 message:v10];
      id v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

      goto LABEL_31;
    }
    id v9 = [(VNTrackerManager *)trackerManager _getTracker:v8];
    if (v9)
    {
      id v10 = v9;
      id v11 = v10;
      goto LABEL_30;
    }
    long long v12 = [v7 objectForKeyedSubscript:@"VNTrackingOption_TrackerType"];
    if (([v12 isEqualToString:@"VNObjectTrackerRevision1Type"] & 1) != 0
      || ([v12 isEqualToString:@"VNObjectTrackerRevision2Type"] & 1) != 0
      || ([v12 isEqualToString:@"VNObjectTrackerRevisionLegacyFaceCoreType"] & 1) != 0
      || ([v12 isEqualToString:@"VNRectangleTrackerType"] & 1) != 0)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v13 setObject:@"VNTrackingOption_TrackingLevelFast" forKeyedSubscript:@"VNTrackingOption_TrackingLevel"];
      [v13 setObject:trackerManager->_trackingProcessingQueue forKeyedSubscript:@"VNTrackingOption_ProcessingQueue"];
      [v13 addEntriesFromDictionary:v7];
      id v14 = v13;
      long long v15 = [v14 objectForKeyedSubscript:@"VNTrackingOption_ComputeDevice"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_17;
      }
      uint64_t v25 = v12;
      id v16 = v15;
      id v17 = +[VNTrackerManager trackerClassForOptions:error:]((uint64_t)VNTrackerManager, v14, a4);
      objc_super v18 = v16;
      if (v17)
      {
        id v19 = [v17 supportedComputeDevicesForOptions:v14 error:a4];
        objc_super v18 = v16;
        if (v19)
        {
          id v24 = v19;
          id v20 = [v16 computeDevice];
          long long v15 = +[VNComputeDeviceUtilities computeDeviceOfComputeDevices:v24 mostCompatibleWithComputeDevice:v20 options:0];

          if (v15
            || (+[VNComputeDeviceUtilities mostPerformantComputeDeviceOfComputeDevices:v24], (long long v15 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            [v14 setObject:v15 forKeyedSubscript:@"VNTrackingOption_ComputeDevice"];

            long long v12 = v25;
LABEL_17:

            uint64_t v21 = [(VNTrackerManager *)trackerManager _createTracker:v8 type:v12 options:v14 error:a4];
            if (v21) {
              id v10 = v21;
            }
            else {
              id v10 = 0;
            }
            goto LABEL_28;
          }
          if (a4)
          {
            v22 = [v16 processingDevice];
            *a4 = +[VNError errorForUnsupportedProcessingDevice:v22];
          }
          objc_super v18 = 0;
          id v19 = v24;
        }
      }
      id v10 = 0;
      long long v12 = v25;
    }
    else
    {
      if (!a4)
      {
        id v10 = 0;
        goto LABEL_29;
      }
      id v14 = [NSString stringWithFormat:@"Cannot create a Tracker with unknown tracker type: %@", v12];
      +[VNError errorWithCode:5 message:v14];
      id v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_28:

LABEL_29:
    id v11 = v10;
    goto LABEL_30;
  }
  id v11 = 0;
LABEL_32:

  return v11;
}

- (void)releaseDetectorsThatCanBeReplacedByDetectorOfClass:(Class)a3 withConfiguration:(id)a4
{
  id v8 = a4;
  id v6 = +[VNFrameworkManager manager];
  id v7 = [v6 detectorAccessingLock];

  [v7 lock];
  [(VNSession *)self _releaseDetectorsThatCanBeReplacedByDetectorOfClass:a3 withConfiguration:v8];
  [v7 unlock];
}

- (id)loadedDetectors
{
  id v3 = +[VNFrameworkManager manager];
  id v4 = [v3 detectorAccessingLock];

  [v4 lock];
  uint64_t v5 = [(VNDetectorCache *)self->_detectorCache_onlyAccessWithDetectorAccessingLock loadedDetectors];
  [v4 unlock];

  return v5;
}

- (id)trackerResourcesConfiguredWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[VNFrameworkManager manager];
  id v8 = [v7 trackerResourcesAccessingLock];

  [v8 lock];
  id v9 = -[VNSession _locateRPNTrackerResourcesForOptions:allowingCreation:error:]((uint64_t)self, v6, 1, a4);
  [v8 unlock];

  return v9;
}

- (id)_locateRPNTrackerResourcesForOptions:(int)a3 allowingCreation:(void *)a4 error:
{
  id v7 = a2;
  if (a1)
  {
    if (a3) {
      id v8 = 0;
    }
    else {
      id v8 = a4;
    }
    id v9 = [*(id *)(a1 + 32) locateRPNTrackerResourcesConfiguredForOptions:v7 error:v8];
    if (!v9 && (a3 & 1) != 0)
    {
      id v10 = -[VNSession _frameworkManagerWithError:](a1, a4);
      id v11 = v10;
      if (v10)
      {
        id v9 = [v10 trackerResourcesConfiguredWithOptions:v7 forSession:a1 error:a4];
        if (v9) {
          [*(id *)(a1 + 32) addRPNTrackerResourcesConfiguredForOptions:v7 resources:v9 error:a4];
        }
      }
      else
      {
        id v9 = 0;
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)detectorCache:(id)a3 didEvictDetector:(id)a4
{
  id v4 = a4;
  [(id)objc_opt_class() VNClassCode];
  kdebug_trace();
}

- (id)_cachedTrackerResourcesConfiguredWithOptions:(id)a3
{
  id v3 = -[VNSession _locateRPNTrackerResourcesForOptions:allowingCreation:error:]((uint64_t)self, a3, 0, 0);

  return v3;
}

- (id)cachedResourceObjectForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[VNFrameworkManager manager];
  id v6 = [v5 sessionResourcesAccessingLock];

  [v6 lock];
  id v7 = [(VisionCoreObjectCache *)self->_resourceObjectsCache_onlyAccessWithSessionResourcesAccessingLock objectForIdentifier:v4 creationBlock:0 error:0];
  [v6 unlock];

  return v7;
}

- (id)resourceObjectForIdentifier:(id)a3 creationBlock:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[VNFrameworkManager manager];
  id v11 = [v10 sessionResourcesAccessingLock];

  [v11 lock];
  long long v12 = [(VNSession *)self _locateResourceObjectForIdentifier:v8 creationBlock:v9 error:a5];
  [v11 unlock];

  return v12;
}

- (void)releaseCachedResourcesWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (v4)
  {
    if (_asyncProcessingDispatchQueue(void)::onceToken != -1) {
      dispatch_once(&_asyncProcessingDispatchQueue(void)::onceToken, &__block_literal_global_198_24998);
    }
    uint64_t v5 = (id)_asyncProcessingDispatchQueue(void)::ourProcessingDispatchQueue;
    if (v5)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __55__VNSession_releaseCachedResourcesWithCompletionBlock___block_invoke;
      v7[3] = &unk_1E5B1E5C8;
      v7[4] = self;
      id v8 = v4;
      dispatch_barrier_async(v5, v7);
    }
    else
    {
      id v6 = (void *)MEMORY[0x1A6257080](+[VNError VNAssert:0 log:@"Processing dispatch queue is unavailable"]);
      v4[2](v4);
    }
  }
  else
  {
    [(VNSession *)self releaseCachedResources];
  }
}

void __55__VNSession_releaseCachedResourcesWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1A6257080]([*(id *)(a1 + 32) releaseCachedResources]);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)releaseCachedResources
{
  -[VNSession _releaseAllDetectors]((uint64_t)self);
  [(VNRPNTrackerEspressoResourcesCache *)self->_trackerResourceCache releaseCachedResources];
  vtSessionManager = self->_vtSessionManager;
  if (vtSessionManager)
  {
    value = vtSessionManager->_pixelTransferSessionsHandler.__ptr_.__value_;
    os_unfair_lock_lock((os_unfair_lock_t)value + 4);
    [*((id *)value + 3) removeAllObjects];
    os_unfair_lock_unlock((os_unfair_lock_t)value + 4);
    uint64_t v5 = vtSessionManager->_pixelRotationSessionsHandler.__ptr_.__value_;
    os_unfair_lock_lock((os_unfair_lock_t)v5 + 4);
    [*((id *)v5 + 3) removeAllObjects];
    os_unfair_lock_unlock((os_unfair_lock_t)v5 + 4);
  }
  ciContextManager = self->_ciContextManager;
  if (ciContextManager)
  {
    -[VNCIContextsHandler releaseCachedResources]((uint64_t)ciContextManager->_cpuContextsHandler);
    os_unfair_lock_lock(&ciContextManager->_gpuHandlersLock);
    [(NSMutableDictionary *)ciContextManager->_gpuContextsHandlers enumerateKeysAndObjectsUsingBlock:&__block_literal_global_26182];
    os_unfair_lock_unlock(&ciContextManager->_gpuHandlersLock);
  }
  cvPixelBufferPoolManager = self->_cvPixelBufferPoolManager;
  if (cvPixelBufferPoolManager)
  {
    os_unfair_lock_lock(&cvPixelBufferPoolManager->_poolsLock);
    p_p1 = &cvPixelBufferPoolManager->_pools.__table_.__p1_;
    for (uint64_t i = &cvPixelBufferPoolManager->_pools.__table_.__p1_;
          ;
          CVPixelBufferPoolRelease((CVPixelBufferPoolRef)i[5].__value_.__next_))
    {
      uint64_t i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<apple::vision::BufferSizeFormat, __CVPixelBufferPool *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<apple::vision::BufferSizeFormat, __CVPixelBufferPool *>, void *>>> *)i->__value_.__next_;
      if (!i) {
        break;
      }
    }
    if (cvPixelBufferPoolManager->_pools.__table_.__p2_.__value_)
    {
      next = p_p1->__value_.__next_;
      if (p_p1->__value_.__next_)
      {
        do
        {
          id v11 = (void *)*next;
          operator delete(next);
          next = v11;
        }
        while (v11);
      }
      cvPixelBufferPoolManager->_pools.__table_.__p1_.__value_.__next_ = 0;
      unint64_t v12 = cvPixelBufferPoolManager->_pools.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (v12)
      {
        for (uint64_t j = 0; j != v12; ++j)
          cvPixelBufferPoolManager->_pools.__table_.__bucket_list_.__ptr_.__value_[j] = 0;
      }
      cvPixelBufferPoolManager->_pools.__table_.__p2_.__value_ = 0;
    }
    os_unfair_lock_unlock(&cvPixelBufferPoolManager->_poolsLock);
  }
  trackerManager = self->_trackerManager;
  if (trackerManager)
  {
    trackersCollectionManagementQueue = trackerManager->_trackersCollectionManagementQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__VNTrackerManager_releaseAllTrackers__block_invoke;
    block[3] = &unk_1E5B1D628;
    block[4] = trackerManager;
    dispatch_sync(trackersCollectionManagementQueue, block);
  }
  id v16 = +[VNFrameworkManager manager];
  id v18 = [v16 sessionResourcesAccessingLock];

  [v18 lock];
  resourceObjectsCache_onlyAccessWithSessionResourcesAccessingLock = self->_resourceObjectsCache_onlyAccessWithSessionResourcesAccessingLock;
  self->_resourceObjectsCache_onlyAccessWithSessionResourcesAccessingLock = 0;

  [v18 unlock];
}

- (id)vnvtSessionManager
{
  return self->_vtSessionManager;
}

- (id)vnciContextManager
{
  return self->_ciContextManager;
}

- (id)vncvPixelBufferPoolManager
{
  return self->_cvPixelBufferPoolManager;
}

- (id)createRPNTrackerResourcesConfiguredWithOptions:(id)a3 error:(id *)a4
{
  id v4 = [(VNRPNTrackerEspressoResourcesCache *)self->_trackerResourceCache createRPNTrackerResourcesConfiguredWithOptions:a3 error:a4];

  return v4;
}

- (id)_locateResourceObjectForIdentifier:(id)a3 creationBlock:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!self->_resourceObjectsCache_onlyAccessWithSessionResourcesAccessingLock)
  {
    id v10 = (VisionCoreObjectCache *)objc_alloc_init(MEMORY[0x1E4FB3EE8]);
    resourceObjectsCache_onlyAccessWithSessionResourcesAccessingLock = self->_resourceObjectsCache_onlyAccessWithSessionResourcesAccessingLock;
    self->_resourceObjectsCache_onlyAccessWithSessionResourcesAccessingLock = v10;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__VNSession__locateResourceObjectForIdentifier_creationBlock_error___block_invoke;
  aBlock[3] = &unk_1E5B1E5A0;
  id v12 = v8;
  id v18 = v12;
  id v19 = self;
  id v13 = v9;
  id v20 = v13;
  id v14 = _Block_copy(aBlock);
  long long v15 = [(VisionCoreObjectCache *)self->_resourceObjectsCache_onlyAccessWithSessionResourcesAccessingLock objectForIdentifier:v12 creationBlock:v14 error:a5];

  return v15;
}

id __68__VNSession__locateResourceObjectForIdentifier_creationBlock_error___block_invoke(void *a1, uint64_t a2)
{
  id v4 = +[VNFrameworkManager manager];
  uint64_t v5 = [v4 _locateResourceObjectForIdentifier:a1[4] requestingSession:a1[5] creationBlock:a1[6] error:a2];

  return v5;
}

- (void)dealloc
{
  id v3 = (void *)MEMORY[0x1A6257080]([(VNSession *)self releaseCachedResources]);
  id v4 = +[VNFrameworkManager manager];
  uint64_t v5 = [v4 allSessions];

  kdebug_trace();

  v6.receiver = self;
  v6.super_class = (Class)VNSession;
  [(VNSession *)&v6 dealloc];
}

@end