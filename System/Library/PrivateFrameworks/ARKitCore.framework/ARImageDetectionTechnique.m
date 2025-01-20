@interface ARImageDetectionTechnique
+ (BOOL)_redetectionRequiredForContext:(id)a3;
+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3;
- (ARImageDetectionTechnique)initWithReferenceImages:(id)a3;
- (ARImageDetectionTechnique)initWithReferenceImages:(id)a3 maximumNumberOfTrackedImages:(int64_t)a4;
- (ARImageDetectionTechnique)initWithReferenceImages:(id)a3 maximumNumberOfTrackedImages:(int64_t)a4 continuousDetection:(BOOL)a5 processingQueue:(id)a6;
- (ARImageDetectionTechnique)initWithReferenceImages:(id)a3 maximumNumberOfTrackedImages:(int64_t)a4 processingQueue:(id)a5;
- (ARODTHandleManager)odtTHandleManger;
- (ARWorldTrackingPoseData)currentWorldTrackingPose;
- (BOOL)deterministicMode;
- (BOOL)enableAutomaticImageScaleEstimation;
- (BOOL)finishedLoadingImages;
- (BOOL)isEqual:(id)a3;
- (BOOL)syncWithProcessedImage;
- (NSDictionary)referenceImageMap;
- (double)requiredTimeInterval;
- (id).cxx_construct;
- (id)_addReferenceImagesAppleCV3D;
- (id)_trackImagesWithImageData:(id)a3 timeBudget:(double)a4;
- (id)predictAtTimeStamp:(double)a3 timeBudget:(double)a4 predictedWorldTrackingPose:(id)a5;
- (id)processData:(id)a3;
- (id)processResultData:(id)a3 timestamp:(double)a4 context:(id)a5;
- (int64_t)captureBehavior;
- (unint64_t)requiredSensorDataTypes;
- (void)_enqueueImageForTrackingNonBlocking:(id)a3;
- (void)_enqueueImageForTrackingSynced:(id)a3;
- (void)_loadReferenceImages;
- (void)_loadReferenceImagesInBackground;
- (void)prepare:(BOOL)a3;
- (void)setCurrentWorldTrackingPose:(id)a3;
- (void)setEnableAutomaticImageScaleEstimation:(BOOL)a3;
- (void)setPowerUsage:(unint64_t)a3;
@end

@implementation ARImageDetectionTechnique

- (ARImageDetectionTechnique)initWithReferenceImages:(id)a3
{
  return [(ARImageDetectionTechnique *)self initWithReferenceImages:a3 maximumNumberOfTrackedImages:0];
}

- (ARImageDetectionTechnique)initWithReferenceImages:(id)a3 maximumNumberOfTrackedImages:(int64_t)a4
{
  id v6 = a3;
  if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.imageDetection.fixedPriorityProcessingQueue"])
  {
    v7 = ARCreateFixedPriorityDispatchQueueWithQOS("com.apple.arkit.technique.imageDetection");
    v8 = _ARLogTechnique();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = 0;
      v9 = "ARImageDetectionTechnique: Created fixed priority serial queue for image detection";
      v10 = (uint8_t *)&v14;
LABEL_6:
      _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
    }
  }
  else
  {
    v7 = ARCreateNonFixedPriorityDispatchQueue("com.apple.arkit.technique.imageDetection");
    v8 = _ARLogTechnique();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = 0;
      v9 = "ARImageDetectionTechnique: Created non-fixed priority serial queue for image detection";
      v10 = (uint8_t *)&v13;
      goto LABEL_6;
    }
  }

  v11 = [(ARImageDetectionTechnique *)self initWithReferenceImages:v6 maximumNumberOfTrackedImages:a4 processingQueue:v7];
  return v11;
}

- (ARImageDetectionTechnique)initWithReferenceImages:(id)a3 maximumNumberOfTrackedImages:(int64_t)a4 processingQueue:(id)a5
{
  return [(ARImageDetectionTechnique *)self initWithReferenceImages:a3 maximumNumberOfTrackedImages:a4 continuousDetection:1 processingQueue:a5];
}

- (ARImageDetectionTechnique)initWithReferenceImages:(id)a3 maximumNumberOfTrackedImages:(int64_t)a4 continuousDetection:(BOOL)a5 processingQueue:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v23.receiver = self;
  v23.super_class = (Class)ARImageDetectionTechnique;
  v12 = [(ARImageBasedTechnique *)&v23 init];
  __int16 v13 = v12;
  if (v12)
  {
    v12->_maximumNumberOfTrackedImages = a4;
    v12->_continuousDetection = a5;
    uint64_t v14 = [v10 copy];
    referenceImages = v13->_referenceImages;
    v13->_referenceImages = (NSArray *)v14;

    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    loadingSemaphore = v13->_loadingSemaphore;
    v13->_loadingSemaphore = (OS_dispatch_semaphore *)v16;

    dispatch_semaphore_signal((dispatch_semaphore_t)v13->_loadingSemaphore);
    dispatch_semaphore_t v18 = dispatch_semaphore_create(1);
    dataSemaphore = v13->_dataSemaphore;
    v13->_dataSemaphore = (OS_dispatch_semaphore *)v18;

    dispatch_semaphore_t v20 = dispatch_semaphore_create(1);
    detectionSemaphore = v13->_detectionSemaphore;
    v13->_detectionSemaphore = (OS_dispatch_semaphore *)v20;

    v13->_finishedLoadingImages = 0;
    v13->_needsWorldTrackingPoseData = 1;
    objc_storeStrong((id *)&v13->_processDataQueue, a6);
    v13->_tracking = a4 > 0;
    std::allocate_shared[abi:ne180100]<arkit::KeyMapBuffer<void const*,std::vector<unsigned char>>,std::allocator<arkit::KeyMapBuffer<void const*,std::vector<unsigned char>>>,int,void>();
  }

  return 0;
}

- (unint64_t)requiredSensorDataTypes
{
  return 1;
}

- (BOOL)syncWithProcessedImage
{
  return self->_tracking || self->_deterministicMode;
}

- (double)requiredTimeInterval
{
  BOOL v2 = [(ARImageDetectionTechnique *)self syncWithProcessedImage];
  double result = 0.016;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (int64_t)captureBehavior
{
  return [(ARImageDetectionTechnique *)self syncWithProcessedImage];
}

- (BOOL)deterministicMode
{
  return self->_deterministicMode;
}

- (BOOL)finishedLoadingImages
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_dataSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  BOOL finishedLoadingImages = self->_finishedLoadingImages;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_dataSemaphore);
  return finishedLoadingImages;
}

- (id)processData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9.receiver = self;
    v9.super_class = (Class)ARImageDetectionTechnique;
    id v5 = [(ARImageBasedTechnique *)&v9 processData:v4];
    id v6 = v4;
    if ([(ARImageDetectionTechnique *)self finishedLoadingImages])
    {
      if ([(ARImageDetectionTechnique *)self syncWithProcessedImage]) {
        [(ARImageDetectionTechnique *)self _enqueueImageForTrackingSynced:v6];
      }
      else {
        [(ARImageDetectionTechnique *)self _enqueueImageForTrackingNonBlocking:v6];
      }
      if ([(ARImageDetectionTechnique *)self deterministicMode]) {
        dispatch_sync((dispatch_queue_t)self->_processDataQueue, &__block_literal_global_14);
      }
    }
    else
    {
      [v6 timestamp];
      -[ARImageBasedTechnique pushResultData:forTimestamp:](self, "pushResultData:forTimestamp:", MEMORY[0x1E4F1CBF0]);
    }
  }
  else
  {
    id v7 = v4;
  }

  return v4;
}

- (id)processResultData:(id)a3 timestamp:(double)a4 context:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v28 = a5;
  if (self->_needsWorldTrackingPoseData)
  {
    v31 = v7;
    uint64_t v8 = [v7 indexOfObjectPassingTest:&__block_literal_global_7];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = [v7 objectAtIndexedSubscript:v8];
    }
    -[ARImageDetectionTechnique setCurrentWorldTrackingPose:](self, "setCurrentWorldTrackingPose:", v9, v9);
    if (v9)
    {
      id v11 = [v27 worldTrackingState];
      uint64_t v12 = [v11 vioTrackingState];

      if (!v12)
      {
        [v27 cameraTransform];
        *(_OWORD *)__p = v13;
        long long v36 = v14;
        long long v37 = v15;
        long long v38 = v16;
        id v17 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__p length:64];
        arkit::wrapRawData((arkit *)[v17 bytes], objc_msgSend(v17, "length"), buf);
        dispatch_semaphore_t v18 = [v28 imageData];
        ARImageContextFromImageData(v18);
        uint64_t v20 = v19;

        uint64_t v34 = v20;
        arkit::KeyMapBuffer<void const*,std::vector<unsigned char>>::insert();
      }
    }
    uint64_t v21 = [v31 count];
    if (v21)
    {
      uint64_t v30 = v21;
      for (uint64_t i = 0; i != v30; ++i)
      {
        v32 = [v31 objectAtIndex:i];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v23 = v32;
          memset(v33, 0, sizeof(v33));
          id v29 = v23;
          v24 = [v23 detectedImages];
          if ([v24 countByEnumeratingWithState:v33 objects:v39 count:16])
          {
            v25 = (void *)**((void **)&v33[0] + 1);
            __p[0] = 0;
            __p[1] = 0;
            *(void *)&long long v36 = 0;
            *(void *)buf = [v25 imageContext];
            arkit::KeyMapBuffer<void const*,std::vector<unsigned char>>::find();
          }
        }
      }
    }
    id v10 = v31;
  }
  else
  {
    id v10 = v7;
  }

  return v10;
}

uint64_t __65__ARImageDetectionTechnique_processResultData_timestamp_context___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)_redetectionRequiredForContext:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 resultDataOfClass:objc_opt_class()];
  id v6 = [v5 firstObject];

  id v7 = [v6 worldTrackingState];
  int v8 = [v7 poseGraphUpdated];

  if (v8)
  {
    uint64_t v9 = _ARLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      int v22 = 138543618;
      id v23 = v11;
      __int16 v24 = 2048;
      id v25 = a1;
      _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Redetection of image anchors is required. Reason: pose-graph update.", (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {
    uint64_t v12 = [v6 worldTrackingState];
    int v13 = [v12 majorRelocalization];

    if (v13)
    {
      uint64_t v9 = _ARLogGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        long long v14 = (objc_class *)objc_opt_class();
        long long v15 = NSStringFromClass(v14);
        int v22 = 138543618;
        id v23 = v15;
        __int16 v24 = 2048;
        id v25 = a1;
        _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Redetection of image anchors is required. Reason: Relocalization.", (uint8_t *)&v22, 0x16u);
      }
    }
    else
    {
      long long v16 = [v6 worldTrackingState];
      uint64_t v17 = [v16 vioTrackingState];

      if (!v17)
      {
        BOOL v20 = 0;
        goto LABEL_11;
      }
      uint64_t v9 = _ARLogGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        dispatch_semaphore_t v18 = (objc_class *)objc_opt_class();
        uint64_t v19 = NSStringFromClass(v18);
        int v22 = 138543618;
        id v23 = v19;
        __int16 v24 = 2048;
        id v25 = a1;
        _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Redetection of image anchors is required. Reason: VIO Tracking state changed.", (uint8_t *)&v22, 0x16u);
      }
    }
  }

  BOOL v20 = 1;
LABEL_11:

  return v20;
}

- (void)_loadReferenceImagesInBackground
{
  v16[2] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processDataQueue);
  [(NSArray *)self->_referenceImages count];
  kdebug_trace();
  [(NSArray *)self->_referenceImages count];
  kdebug_trace();
  v3 = [(ARImageDetectionTechnique *)self _addReferenceImagesAppleCV3D];
  [(NSArray *)self->_referenceImages count];
  [v3 code];
  kdebug_trace();
  if (v3)
  {
    [(NSArray *)self->_referenceImages count];
    [v3 code];
    kdebug_trace();
    id v4 = [(ARTechnique *)self delegate];
    [v4 technique:self didFailWithError:v3];
  }
  else
  {
    id v5 = [(ARImageDetectionTechnique *)self odtTHandleManger];
    uint64_t v6 = [v5 waitForAllObjectsAddToFinish];

    if (v6)
    {
      id v7 = NSString;
      int v8 = ARKitCoreBundle();
      uint64_t v9 = [v8 localizedStringForKey:@"Reference images could not be loaded due to an unknown error: %d" value:&stru_1F120C8F0 table:@"Localizable_iOS"];
      id v10 = objc_msgSend(v7, "stringWithFormat:", v9, v6);

      v15[0] = *MEMORY[0x1E4F285A0];
      id v11 = +[ARODTHandleManager suggestionInternalError];
      v15[1] = *MEMORY[0x1E4F28588];
      v16[0] = v11;
      v16[1] = v10;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

      int v13 = ARErrorWithCodeAndUserInfo(151, v12);
      long long v14 = [(ARTechnique *)self delegate];
      [v14 technique:self didFailWithError:v13];
    }
    [(NSArray *)self->_referenceImages count];
    kdebug_trace();
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_dataSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    self->_BOOL finishedLoadingImages = 1;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_dataSemaphore);
  }
}

- (void)_loadReferenceImages
{
  v3 = [(ARImageDetectionTechnique *)self referenceImageMap];

  if (!v3)
  {
    id v4 = self->_loadingSemaphore;
    if (!dispatch_semaphore_wait((dispatch_semaphore_t)v4, 0))
    {
      objc_initWeak(&location, self);
      processDataQueue = self->_processDataQueue;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __49__ARImageDetectionTechnique__loadReferenceImages__block_invoke;
      v6[3] = &unk_1E61853C0;
      objc_copyWeak(&v7, &location);
      dispatch_async(processDataQueue, v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

void __49__ARImageDetectionTechnique__loadReferenceImages__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _loadReferenceImagesInBackground];
}

- (void)prepare:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = [(ARImageDetectionTechnique *)self odtTHandleManger];

  if (!v5)
  {
    self->_deterministicMode = v3;
    uint64_t v6 = [[ARODTHandleManager alloc] initWithMaximumNumberOfTrackedImages:self->_maximumNumberOfTrackedImages continuousDetection:self->_continuousDetection deterministicMode:v3];
    odtTHandleManger = self->_odtTHandleManger;
    self->_odtTHandleManger = v6;

    int v8 = [(ARImageDetectionTechnique *)self odtTHandleManger];

    if (!v8)
    {
      uint64_t v9 = _ARLogTechnique();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = (objc_class *)objc_opt_class();
        id v11 = NSStringFromClass(v10);
        int v12 = 138543618;
        int v13 = v11;
        __int16 v14 = 2048;
        long long v15 = self;
        _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create AppleCV3D handle for image detection.", (uint8_t *)&v12, 0x16u);
      }
    }
    [(ARImageDetectionTechnique *)self _loadReferenceImages];
    if ([(ARImageDetectionTechnique *)self deterministicMode]) {
      dispatch_sync((dispatch_queue_t)self->_processDataQueue, &__block_literal_global_23);
    }
  }
}

- (id)_addReferenceImagesAppleCV3D
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = (id)objc_opt_new();
  id v4 = (id)objc_opt_new();
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obj = self->_referenceImages;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      int v8 = v4;
      uint64_t v9 = v3;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * v7);
        id v11 = [(ARImageDetectionTechnique *)self odtTHandleManger];
        uint64_t v12 = [v11 addReferenceImage:v10 tracking:1 pObjectID:&v22];

        id v16 = v8;
        id v17 = v9;
        +[ARODTHandleManager accumulateReferenceImageErrorsForResult:v12 refImage:v10 objectID:v22 pReferenceImageMap:&v17 pFailedReferenceImageNames:&v16 pUserErrorType:&v23];
        id v3 = v17;

        id v4 = v16;
        ++v22;
        ++v7;
        int v8 = v4;
        uint64_t v9 = v3;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v5);
  }

  objc_storeStrong((id *)&self->_referenceImageMap, v3);
  int v13 = +[ARODTHandleManager handleAccumulatedErrorType:v23 failedReferenceImageNames:v4];

  return v13;
}

- (void)_enqueueImageForTrackingSynced:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  objc_initWeak(&location, self);
  processDataQueue = self->_processDataQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__ARImageDetectionTechnique__enqueueImageForTrackingSynced___block_invoke;
  v9[3] = &unk_1E6185AE8;
  objc_copyWeak(&v12, &location);
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(processDataQueue, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __60__ARImageDetectionTechnique__enqueueImageForTrackingSynced___block_invoke(id *a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    char v4 = [WeakRetained deterministicMode];
    double v5 = 0.0;
    if ((v4 & 1) != 0
      || (objc_msgSend(v3, "requiredTimeInterval", 0.0),
          double v7 = v6,
          [a1[4] timeIntervalSinceNow],
          double v5 = v7 + v8 + -0.002,
          v5 > 0.0))
    {
      uint64_t v9 = [v3 _trackImagesWithImageData:a1[5] timeBudget:v5];
      id v10 = (void *)v9;
      if (v9)
      {
        v12[0] = v9;
        id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      }
      else
      {
        id v11 = (void *)MEMORY[0x1E4F1CBF0];
      }
      [a1[5] timestamp];
      objc_msgSend(v3, "pushResultData:forTimestamp:", v11);
    }
  }
}

- (void)_enqueueImageForTrackingNonBlocking:(id)a3
{
  id v4 = a3;
  double v5 = self->_detectionSemaphore;
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)v5, 0))
  {
    objc_initWeak(&location, self);
    processDataQueue = self->_processDataQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__ARImageDetectionTechnique__enqueueImageForTrackingNonBlocking___block_invoke;
    v7[3] = &unk_1E6185AE8;
    objc_copyWeak(&v10, &location);
    double v8 = v5;
    id v9 = v4;
    dispatch_async(processDataQueue, v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __65__ARImageDetectionTechnique__enqueueImageForTrackingNonBlocking___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained _trackImagesWithImageData:*(void *)(a1 + 40) timeBudget:0.0];
    double v5 = (void *)v4;
    if (v4)
    {
      v7[0] = v4;
      double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
      [v3 pushResultData:v6 forFrame:0];
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

- (id)_trackImagesWithImageData:(id)a3 timeBudget:(double)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v42 = v6;
  if (v6)
  {
    [v6 timestamp];
    double v7 = [(ARImageDetectionTechnique *)self odtTHandleManger];
    [v7 maximumNumberOfTrackedImages];
    kdebug_trace();

    double v8 = _ARLogTechnique();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      BOOL v11 = [(ARImageDetectionTechnique *)self enableAutomaticImageScaleEstimation];
      id v12 = @"OFF";
      *(_DWORD *)buf = 138543874;
      v46 = v10;
      if (v11) {
        id v12 = @"ON";
      }
      __int16 v47 = 2048;
      v48 = self;
      __int16 v49 = 2112;
      v50 = v12;
      _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Attempting to track planar object. Automatic scale estimation = %@", buf, 0x20u);
    }
    if ([(ARImageDetectionTechnique *)self enableAutomaticImageScaleEstimation])
    {
      int v13 = [(ARImageDetectionTechnique *)self odtTHandleManger];
      __int16 v14 = [(ARImageDetectionTechnique *)self currentWorldTrackingPose];
      ARImageContextFromImageData(v42);
      id v44 = 0;
      int v16 = [v13 trackPlanarObjectAndEstimateScaleForImageData:v42 worldTrackingPose:v14 imageContext:v15 timeBudget:&v44 pResultArray:a4];
      id v17 = v44;
    }
    else
    {
      int v13 = [(ARImageDetectionTechnique *)self odtTHandleManger];
      ARImageContextFromImageData(v42);
      id v43 = 0;
      int v16 = [v13 trackPlanarObjectForImageData:v42 imageContext:v19 timeBudget:&v43 pResultArray:a4];
      id v17 = v43;
    }

    if (v16)
    {
      long long v20 = _ARLogTechnique();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        long long v21 = (objc_class *)objc_opt_class();
        uint64_t v22 = NSStringFromClass(v21);
        *(_DWORD *)buf = 138543874;
        v46 = v22;
        __int16 v47 = 2048;
        v48 = self;
        __int16 v49 = 1024;
        LODWORD(v50) = v16;
        _os_log_impl(&dword_1B88A2000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Tracking failed with error %d.", buf, 0x1Cu);
      }
    }
    [v42 timestamp];
    [v17 count];
    kdebug_trace();
    uint64_t v23 = _ARLogTechnique();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      __int16 v24 = (objc_class *)objc_opt_class();
      uint64_t v25 = NSStringFromClass(v24);
      int v26 = [v17 count];
      *(_DWORD *)buf = 138543874;
      v46 = v25;
      __int16 v47 = 2048;
      v48 = self;
      __int16 v49 = 1024;
      LODWORD(v50) = v26;
      _os_log_impl(&dword_1B88A2000, v23, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Tracking %d images", buf, 0x1Cu);
    }
    v27 = objc_opt_new();
    for (unint64_t i = 0; [v17 count] > i; ++i)
    {
      id v29 = [(ARImageDetectionTechnique *)self referenceImageMap];
      uint64_t v30 = NSNumber;
      v31 = [v17 objectAtIndexedSubscript:i];
      v32 = objc_msgSend(v30, "numberWithInteger:", objc_msgSend(v31, "detectedObjectID"));
      v33 = [v29 objectForKeyedSubscript:v32];

      uint64_t v34 = objc_opt_new();
      v35 = [v17 objectAtIndexedSubscript:i];
      [v35 visionTransform];
      objc_msgSend(v34, "setVisionTransform:");

      long long v36 = [v17 objectAtIndexedSubscript:i];
      objc_msgSend(v34, "setImageContext:", objc_msgSend(v36, "imageContext"));

      [v34 setReferenceImage:v33];
      long long v37 = [v17 objectAtIndexedSubscript:i];
      [v37 estimatedScaleFactor];
      objc_msgSend(v34, "setEstimatedScaleFactor:");

      long long v38 = [v17 objectAtIndexedSubscript:i];
      objc_msgSend(v34, "setOdtObjectIdentifer:", objc_msgSend(v38, "detectedObjectID"));

      [v27 addObject:v34];
    }
    long long v18 = objc_opt_new();
    [v18 setDetectedImages:v27];
    [v18 setProvidesWorldTrackingCameraPose:self->_needsWorldTrackingPoseData];
    v39 = [(ARImageDetectionTechnique *)self odtTHandleManger];
    if ([v39 maximumNumberOfTrackedImages]) {
      BOOL needsWorldTrackingPoseData = 0;
    }
    else {
      BOOL needsWorldTrackingPoseData = self->_needsWorldTrackingPoseData;
    }
    [v18 setDetectionOnly:needsWorldTrackingPoseData];
  }
  else
  {
    long long v18 = 0;
  }

  return v18;
}

- (void)setPowerUsage:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ARImageDetectionTechnique;
  -[ARTechnique setPowerUsage:](&v6, sel_setPowerUsage_);
  double v5 = [(ARImageDetectionTechnique *)self odtTHandleManger];
  [v5 updatePowerUsage:a3];
}

- (id)predictAtTimeStamp:(double)a3 timeBudget:(double)a4 predictedWorldTrackingPose:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = [(ARImageDetectionTechnique *)self odtTHandleManger];
  if ([v9 maximumNumberOfTrackedImages])
  {
  }
  else
  {
    BOOL needsWorldTrackingPoseData = self->_needsWorldTrackingPoseData;

    if (needsWorldTrackingPoseData)
    {
      long long v20 = 0;
      goto LABEL_26;
    }
  }
  id v10 = _ARLogTechnique();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    BOOL v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 138543618;
    v45 = v12;
    __int16 v46 = 2048;
    __int16 v47 = self;
    _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Attempting to predict planar object", buf, 0x16u);
  }
  int v13 = [(ARImageDetectionTechnique *)self odtTHandleManger];
  id v43 = 0;
  int v14 = [v13 predictPlanarObjectsAtTimestamp:0 worldTrackingPose:&v43 timeBudget:a3 pResultArray:a4];
  id v15 = v43;

  int v16 = _ARLogTechnique();
  id v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      long long v18 = (objc_class *)objc_opt_class();
      uint64_t v19 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138543874;
      v45 = v19;
      __int16 v46 = 2048;
      __int16 v47 = self;
      __int16 v48 = 1024;
      int v49 = v14;
      _os_log_impl(&dword_1B88A2000, v17, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Prediction failed with error %d.", buf, 0x1Cu);
    }
    long long v20 = 0;
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = (objc_class *)objc_opt_class();
      uint64_t v23 = NSStringFromClass(v22);
      int v24 = [v15 count];
      *(_DWORD *)buf = 138543874;
      v45 = v23;
      __int16 v46 = 2048;
      __int16 v47 = self;
      __int16 v48 = 1024;
      int v49 = v24;
      _os_log_impl(&dword_1B88A2000, v17, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Prediction %d images", buf, 0x1Cu);
    }
    id v17 = objc_opt_new();
    unint64_t v25 = 0;
    *(void *)&long long v26 = 138543618;
    long long v42 = v26;
    while (objc_msgSend(v15, "count", v42) > v25)
    {
      v27 = [(ARImageDetectionTechnique *)self referenceImageMap];
      id v28 = NSNumber;
      id v29 = [v15 objectAtIndexedSubscript:v25];
      uint64_t v30 = objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v29, "detectedObjectID"));
      v31 = [v27 objectForKeyedSubscript:v30];

      if (v31)
      {
        v32 = objc_opt_new();
        v33 = [v15 objectAtIndexedSubscript:v25];
        [v33 visionTransform];
        -[NSObject setVisionTransform:](v32, "setVisionTransform:");

        uint64_t v34 = [v15 objectAtIndexedSubscript:v25];
        -[NSObject setImageContext:](v32, "setImageContext:", [v34 imageContext]);

        [v32 setReferenceImage:v31];
        v35 = [v15 objectAtIndexedSubscript:v25];
        [v35 estimatedScaleFactor];
        -[NSObject setEstimatedScaleFactor:](v32, "setEstimatedScaleFactor:");

        long long v36 = [v15 objectAtIndexedSubscript:v25];
        -[NSObject setOdtObjectIdentifer:](v32, "setOdtObjectIdentifer:", [v36 detectedObjectID]);

        if (v8)
        {
          [v8 cameraTransform];
          -[NSObject setWorldTrackingCameraTransformAtDetection:](v32, "setWorldTrackingCameraTransformAtDetection:");
          [v17 addObject:v32];
        }
      }
      else
      {
        v32 = _ARLogTechnique();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          long long v37 = (objc_class *)objc_opt_class();
          long long v38 = NSStringFromClass(v37);
          *(_DWORD *)buf = v42;
          v45 = v38;
          __int16 v46 = 2048;
          __int16 v47 = self;
          _os_log_impl(&dword_1B88A2000, v32, OS_LOG_TYPE_INFO, "%{public}@ <%p>: No matching reference image found, throwing away prediction.", buf, 0x16u);
        }
      }

      ++v25;
    }
    long long v20 = objc_opt_new();
    [v20 setDetectedImages:v17];
    [v20 setProvidesWorldTrackingCameraPose:self->_needsWorldTrackingPoseData];
    v39 = [(ARImageDetectionTechnique *)self odtTHandleManger];
    if ([v39 maximumNumberOfTrackedImages]) {
      BOOL v40 = 0;
    }
    else {
      BOOL v40 = self->_needsWorldTrackingPoseData;
    }
    [v20 setDetectionOnly:v40];

    [v20 setPredicted:1];
  }

LABEL_26:
  return v20;
}

+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3
{
  return objc_opt_class() == (void)a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARImageDetectionTechnique;
  if ([(ARTechnique *)&v8 isEqual:v4])
  {
    double v5 = v4;
    BOOL v6 = [(NSArray *)self->_referenceImages isEqual:v5[11]]
      && self->_needsWorldTrackingPoseData == *((unsigned __int8 *)v5 + 176)
      && self->_enableAutomaticImageScaleEstimation == *((unsigned __int8 *)v5 + 177)
      && self->_maximumNumberOfTrackedImages == v5[18]
      && self->_continuousDetection == *((unsigned __int8 *)v5 + 152);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)enableAutomaticImageScaleEstimation
{
  return self->_enableAutomaticImageScaleEstimation;
}

- (void)setEnableAutomaticImageScaleEstimation:(BOOL)a3
{
  self->_enableAutomaticImageScaleEstimation = a3;
}

- (ARWorldTrackingPoseData)currentWorldTrackingPose
{
  return (ARWorldTrackingPoseData *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCurrentWorldTrackingPose:(id)a3
{
}

- (ARODTHandleManager)odtTHandleManger
{
  return (ARODTHandleManager *)objc_getProperty(self, a2, 192, 1);
}

- (NSDictionary)referenceImageMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 200, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceImageMap, 0);
  objc_storeStrong((id *)&self->_odtTHandleManger, 0);
  objc_storeStrong((id *)&self->_currentWorldTrackingPose, 0);
  cntrl = self->_poseBuffer.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_referenceImageData, 0);
  objc_storeStrong((id *)&self->_detectionSemaphore, 0);
  objc_storeStrong((id *)&self->_dataSemaphore, 0);
  objc_storeStrong((id *)&self->_loadingSemaphore, 0);
  objc_storeStrong((id *)&self->_processDataQueue, 0);
  objc_storeStrong((id *)&self->_referenceImages, 0);
}

- (id).cxx_construct
{
  *((void *)self + 20) = 0;
  *((void *)self + 21) = 0;
  return self;
}

@end