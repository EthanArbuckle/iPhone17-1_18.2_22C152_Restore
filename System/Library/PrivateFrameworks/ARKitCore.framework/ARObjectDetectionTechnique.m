@interface ARObjectDetectionTechnique
+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3;
- (ARObjectDetectionTechnique)initWithDetectionObjects:(id)a3;
- (ARWorldTrackingPoseData)currentWorldTrackingPose;
- (BOOL)finishedLoadingObjects;
- (BOOL)isEqual:(id)a3;
- (NSArray)detectionObjects;
- (NSDictionary)referenceObjecteMap;
- (double)requiredTimeInterval;
- (id)processData:(id)a3;
- (id)processResultData:(id)a3 timestamp:(double)a4 context:(id)a5;
- (void)_enqueueObjectForDetectionNonBlocking:(id)a3;
- (void)_loadReferenceObjects;
- (void)_processImageDataInBackgound:(id)a3;
- (void)prepare:(BOOL)a3;
- (void)setCurrentWorldTrackingPose:(id)a3;
- (void)setFinishedLoadingObjects:(BOOL)a3;
@end

@implementation ARObjectDetectionTechnique

- (ARObjectDetectionTechnique)initWithDetectionObjects:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ARObjectDetectionTechnique;
  v5 = [(ARImageBasedTechnique *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    detectionObjects = v5->_detectionObjects;
    v5->_detectionObjects = (NSArray *)v6;

    dispatch_semaphore_t v8 = dispatch_semaphore_create(1);
    dataSemaphore = v5->_dataSemaphore;
    v5->_dataSemaphore = (OS_dispatch_semaphore *)v8;

    uint64_t v10 = ARCreateFixedPriorityDispatchQueue("com.apple.arkit.technique.objectDetection");
    loadObjectsQueue = v5->_loadObjectsQueue;
    v5->_loadObjectsQueue = (OS_dispatch_queue *)v10;

    dispatch_semaphore_t v12 = dispatch_semaphore_create(1);
    detectionSemaphore = v5->_detectionSemaphore;
    v5->_detectionSemaphore = (OS_dispatch_semaphore *)v12;

    uint64_t v14 = ARCreateFixedPriorityDispatchQueueWithQOS("com.apple.arkit.technique.objectDetection");
    processDataQueue = v5->_processDataQueue;
    v5->_processDataQueue = (OS_dispatch_queue *)v14;
  }
  return v5;
}

- (double)requiredTimeInterval
{
  return 0.016;
}

- (void)prepare:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!self->_odtHandleManager)
  {
    BOOL v3 = a3;
    BOOL v5 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.objctdetection.regionProposalModel"];
    uint64_t v6 = [ARODTHandleManager alloc];
    if (v5) {
      v7 = [(ARODTHandleManager *)v6 initWithRegionProposalModelAndDeterministicMode:v3];
    }
    else {
      v7 = [(ARODTHandleManager *)v6 initWithDeterministicMode:v3];
    }
    odtHandleManager = self->_odtHandleManager;
    self->_odtHandleManager = v7;

    self->_deterministicMode = v3;
    objc_initWeak(&location, self);
    loadObjectsQueue = self->_loadObjectsQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __38__ARObjectDetectionTechnique_prepare___block_invoke;
    v13[3] = &unk_1E61853C0;
    objc_copyWeak(&v14, &location);
    dispatch_async(loadObjectsQueue, v13);
    if (self->_deterministicMode) {
      dispatch_sync((dispatch_queue_t)self->_loadObjectsQueue, &__block_literal_global_108);
    }
    if (_ARLogTechnique(void)::onceToken != -1) {
      dispatch_once(&_ARLogTechnique(void)::onceToken, &__block_literal_global_73_0);
    }
    uint64_t v10 = (id)_ARLogTechnique(void)::logObj;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = (objc_class *)objc_opt_class();
      dispatch_semaphore_t v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138543618;
      objc_super v17 = v12;
      __int16 v18 = 2048;
      v19 = self;
      _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: prepared.", buf, 0x16u);
    }
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __38__ARObjectDetectionTechnique_prepare___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _loadReferenceObjects];
}

- (void)_loadReferenceObjects
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![(ARObjectDetectionTechnique *)self finishedLoadingObjects])
  {
    [(NSArray *)self->_detectionObjects count];
    kdebug_trace();
    [(ARObjectDetectionTechnique *)self setFinishedLoadingObjects:0];
    BOOL v3 = objc_opt_new();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    obj = self->_detectionObjects;
    uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v14;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v14 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
          uint64_t v12 = 0;
          if ([(ARODTHandleManager *)self->_odtHandleManager addReferenceObject:v7 tracking:0 pObjectID:&v12])
          {
            dispatch_semaphore_t v8 = [(ARTechnique *)self delegate];
            v9 = ARErrorWithCodeAndUserInfo(301, 0);
            [v8 technique:self didFailWithError:v9];
          }
          uint64_t v10 = [NSNumber numberWithUnsignedLongLong:v12];
          [v3 setObject:v7 forKey:v10];

          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v4);
    }

    objc_storeStrong((id *)&self->_referenceObjecteMap, v3);
    [(ARODTHandleManager *)self->_odtHandleManager waitForAllObjectsAddToFinish];
    [(ARObjectDetectionTechnique *)self setFinishedLoadingObjects:1];
    kdebug_trace();
  }
}

- (id)processResultData:(id)a3 timestamp:(double)a4 context:(id)a5
{
  id v6 = a3;
  uint64_t v7 = [v6 indexOfObjectPassingTest:&__block_literal_global_7_1];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    dispatch_semaphore_t v8 = 0;
  }
  else
  {
    dispatch_semaphore_t v8 = [v6 objectAtIndexedSubscript:v7];
  }
  [(ARObjectDetectionTechnique *)self setCurrentWorldTrackingPose:v8];

  return v6;
}

uint64_t __66__ARObjectDetectionTechnique_processResultData_timestamp_context___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)processData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9.receiver = self;
    v9.super_class = (Class)ARObjectDetectionTechnique;
    id v5 = [(ARImageBasedTechnique *)&v9 processData:v4];
    id v6 = v4;
    if ([(ARObjectDetectionTechnique *)self finishedLoadingObjects])
    {
      [(ARObjectDetectionTechnique *)self _enqueueObjectForDetectionNonBlocking:v6];
      if (self->_deterministicMode) {
        dispatch_sync((dispatch_queue_t)self->_processDataQueue, &__block_literal_global_13_0);
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

- (void)_enqueueObjectForDetectionNonBlocking:(id)a3
{
  id v4 = a3;
  id v5 = self->_detectionSemaphore;
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)v5, 0))
  {
    objc_initWeak(&location, self);
    processDataQueue = self->_processDataQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__ARObjectDetectionTechnique__enqueueObjectForDetectionNonBlocking___block_invoke;
    v7[3] = &unk_1E6185AE8;
    objc_copyWeak(&v10, &location);
    dispatch_semaphore_t v8 = v5;
    id v9 = v4;
    dispatch_async(processDataQueue, v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __68__ARObjectDetectionTechnique__enqueueObjectForDetectionNonBlocking___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _processImageDataInBackgound:*(void *)(a1 + 40)];
  }
  else {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

- (void)_processImageDataInBackgound:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processDataQueue);
  [v4 timestamp];
  kdebug_trace();
  id v5 = [(ARObjectDetectionTechnique *)self currentWorldTrackingPose];
  if (!v5) {
    goto LABEL_3;
  }
  id v6 = [(ARObjectDetectionTechnique *)self currentWorldTrackingPose];
  id v7 = [v6 worldTrackingState];
  uint64_t v8 = [v7 vioTrackingState];

  if (!v8)
  {
    odtHandleManager = self->_odtHandleManager;
    v11 = [(ARObjectDetectionTechnique *)self currentWorldTrackingPose];
    id v29 = 0;
    LODWORD(odtHandleManager) = [(ARODTHandleManager *)odtHandleManager detectReferenceObjectsForImageData:v4 worldTrackingPose:v11 imageContext:0 pResultArray:&v29];
    id v9 = v29;

    if (odtHandleManager)
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_detectionSemaphore);
      if (self->_deterministicMode) {
        [(ARImageBasedTechnique *)self pushResultData:MEMORY[0x1E4F1CBF0] forFrame:0];
      }
    }
    else
    {
      uint64_t v12 = objc_opt_new();
      unint64_t v13 = 0;
      *(void *)&long long v14 = 138543874;
      long long v28 = v14;
      while (objc_msgSend(v9, "count", v28) > v13)
      {
        long long v15 = [(ARObjectDetectionTechnique *)self referenceObjecteMap];
        long long v16 = NSNumber;
        objc_super v17 = [v9 objectAtIndexedSubscript:v13];
        uint64_t v18 = objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v17, "detectedObjectID"));
        v19 = [v15 objectForKeyedSubscript:v18];

        if (v19)
        {
          uint64_t v20 = objc_opt_new();
          v21 = [v9 objectAtIndexedSubscript:v13];
          [v21 visionTransform];
          -[NSObject setVisionTransform:](v20, "setVisionTransform:");

          [v20 setReferenceObject:v19];
          [v12 addObject:v20];
        }
        else
        {
          if (_ARLogGeneral(void)::onceToken != -1) {
            dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_77_3);
          }
          uint64_t v20 = (id)_ARLogGeneral(void)::logObj;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v22 = (objc_class *)objc_opt_class();
            NSStringFromClass(v22);
            id v23 = (id)objc_claimAutoreleasedReturnValue();
            v24 = [v9 objectAtIndexedSubscript:v13];
            uint64_t v25 = [v24 detectedObjectID];
            *(_DWORD *)buf = v28;
            id v32 = v23;
            __int16 v33 = 2048;
            v34 = self;
            __int16 v35 = 2048;
            uint64_t v36 = v25;
            _os_log_impl(&dword_1B88A2000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unknown 'detectedObjectID' %llu encountered.", buf, 0x20u);
          }
        }

        ++v13;
      }
      if ([v12 count])
      {
        v26 = objc_opt_new();
        [v26 setDetectedObjects:v12];
        v30 = v26;
        v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
        [(ARImageBasedTechnique *)self pushResultData:v27 forFrame:0];
      }
      else if (self->_deterministicMode)
      {
        [(ARImageBasedTechnique *)self pushResultData:MEMORY[0x1E4F1CBF0] forFrame:0];
      }
      [v4 timestamp];
      [v9 count];
      kdebug_trace();
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_detectionSemaphore);
    }
  }
  else
  {
LABEL_3:
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_detectionSemaphore);
    if (self->_deterministicMode) {
      [(ARImageBasedTechnique *)self pushResultData:MEMORY[0x1E4F1CBF0] forFrame:0];
    }
    id v9 = 0;
  }
}

+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3
{
  return objc_opt_class() == (void)a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARObjectDetectionTechnique;
  if ([(ARTechnique *)&v8 isEqual:v4])
  {
    detectionObjects = self->_detectionObjects;
    if (detectionObjects == (NSArray *)v4[19]) {
      char v6 = 1;
    }
    else {
      char v6 = -[NSArray isEqual:](detectionObjects, "isEqual:");
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (NSDictionary)referenceObjecteMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (BOOL)finishedLoadingObjects
{
  return self->_finishedLoadingObjects;
}

- (void)setFinishedLoadingObjects:(BOOL)a3
{
  self->_finishedLoadingObjects = a3;
}

- (NSArray)detectionObjects
{
  return self->_detectionObjects;
}

- (ARWorldTrackingPoseData)currentWorldTrackingPose
{
  return (ARWorldTrackingPoseData *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCurrentWorldTrackingPose:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentWorldTrackingPose, 0);
  objc_storeStrong((id *)&self->_detectionObjects, 0);
  objc_storeStrong((id *)&self->_referenceObjecteMap, 0);
  objc_storeStrong((id *)&self->_processDataQueue, 0);
  objc_storeStrong((id *)&self->_detectionSemaphore, 0);
  objc_storeStrong((id *)&self->_odtHandleManager, 0);
  objc_storeStrong((id *)&self->_latestResultData, 0);
  objc_storeStrong((id *)&self->_loadObjectsQueue, 0);
  objc_storeStrong((id *)&self->_dataSemaphore, 0);
}

@end