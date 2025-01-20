@interface ARFaceTrackingInternalTechnique
+ (BOOL)isSupported;
- (ARFaceTrackingInternalTechnique)init;
- (ARFaceTrackingInternalTechnique)initWithMaximumNumberOfTrackedFaces:(int64_t)a3 options:(id)a4;
- (ARFaceTrackingInternalTechnique)initWithOptions:(id)a3;
- (BOOL)isEqual:(id)a3;
- (double)requiredTimeInterval;
- (id)processData:(id)a3;
- (id)resultDataClasses;
- (int64_t)captureBehavior;
- (int64_t)maximumNumberOfTrackedFaces;
- (unint64_t)requiredSensorDataTypes;
- (void)_enqueueImageForFaceTrackingNonBlocking:(id)a3;
- (void)_processImageDataInBackgound:(id)a3;
- (void)prepare:(BOOL)a3;
@end

@implementation ARFaceTrackingInternalTechnique

- (ARFaceTrackingInternalTechnique)initWithOptions:(id)a3
{
  return [(ARFaceTrackingInternalTechnique *)self initWithMaximumNumberOfTrackedFaces:1 options:a3];
}

- (ARFaceTrackingInternalTechnique)initWithMaximumNumberOfTrackedFaces:(int64_t)a3 options:(id)a4
{
  id v6 = a4;
  if (+[ARFaceTrackingManager isSupported])
  {
    v17.receiver = self;
    v17.super_class = (Class)ARFaceTrackingInternalTechnique;
    v7 = [(ARImageBasedTechnique *)&v17 init];
    v8 = v7;
    if (v7)
    {
      v7->_maximumNumberOfTrackedFaces = a3;
      v9 = [[ARFaceTrackingManager alloc] initWithMaximumNumberOfTrackedFaces:a3 options:v6];
      faceTrackingManger = v8->_faceTrackingManger;
      v8->_faceTrackingManger = v9;

      if (!v8->_faceTrackingManger)
      {
        v15 = 0;
        self = v8;
        goto LABEL_7;
      }
      uint64_t v11 = ARCreateNonFixedPriorityDispatchQueue("com.apple.arkit.technique.faceTracking");
      processDataQueue = v8->_processDataQueue;
      v8->_processDataQueue = (OS_dispatch_queue *)v11;

      dispatch_semaphore_t v13 = dispatch_semaphore_create(1);
      detectionSemaphore = v8->_detectionSemaphore;
      v8->_detectionSemaphore = (OS_dispatch_semaphore *)v13;
    }
    self = v8;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }
LABEL_7:

  return v15;
}

+ (BOOL)isSupported
{
  return +[ARFaceTrackingManager isSupported];
}

- (ARFaceTrackingInternalTechnique)init
{
  return [(ARFaceTrackingInternalTechnique *)self initWithOptions:0];
}

- (unint64_t)requiredSensorDataTypes
{
  return 49;
}

- (id)resultDataClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

- (id)processData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8.receiver = self;
    v8.super_class = (Class)ARFaceTrackingInternalTechnique;
    id v5 = [(ARImageBasedTechnique *)&v8 processData:v4];
    [(ARFaceTrackingInternalTechnique *)self _enqueueImageForFaceTrackingNonBlocking:v4];
    if (self->_deterministicMode) {
      dispatch_sync((dispatch_queue_t)self->_processDataQueue, &__block_literal_global_22);
    }
  }
  else
  {
    id v6 = v4;
  }

  return v4;
}

- (double)requiredTimeInterval
{
  return 0.016;
}

- (int64_t)captureBehavior
{
  return 0;
}

- (void)_enqueueImageForFaceTrackingNonBlocking:(id)a3
{
  id v4 = a3;
  id v5 = self->_detectionSemaphore;
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)v5, 0))
  {
    objc_initWeak(&location, self);
    processDataQueue = self->_processDataQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __75__ARFaceTrackingInternalTechnique__enqueueImageForFaceTrackingNonBlocking___block_invoke;
    v7[3] = &unk_1E6185AE8;
    objc_copyWeak(&v10, &location);
    id v8 = v4;
    v9 = v5;
    dispatch_async(processDataQueue, v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

intptr_t __75__ARFaceTrackingInternalTechnique__enqueueImageForFaceTrackingNonBlocking___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _processImageDataInBackgound:*(void *)(a1 + 32)];

  uint64_t v3 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v3);
}

- (void)_processImageDataInBackgound:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processDataQueue);
  id v5 = [(ARFaceTrackingManager *)self->_faceTrackingManger processData:v4];
  v7[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v4 timestamp];
  -[ARImageBasedTechnique pushResultData:forTimestamp:](self, "pushResultData:forTimestamp:", v6);
}

- (void)prepare:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ARFaceTrackingInternalTechnique;
  -[ARTechnique prepare:](&v5, sel_prepare_);
  self->_deterministicMode = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARFaceTrackingInternalTechnique;
  if ([(ARTechnique *)&v9 isEqual:v4])
  {
    id v5 = v4;
    int64_t v6 = [(ARFaceTrackingInternalTechnique *)self maximumNumberOfTrackedFaces];
    BOOL v7 = v6 == [v5 maximumNumberOfTrackedFaces];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (int64_t)maximumNumberOfTrackedFaces
{
  return self->_maximumNumberOfTrackedFaces;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processDataQueue, 0);
  objc_storeStrong((id *)&self->_faceTrackingManger, 0);
  objc_storeStrong((id *)&self->_detectionSemaphore, 0);
}

@end