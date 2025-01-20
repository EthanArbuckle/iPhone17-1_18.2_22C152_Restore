@interface AVCaptureDataOutputSynchronizer
+ (void)initialize;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_earliestFollowerSynchronizedDataQueueTimestamp;
- (AVCaptureDataOutputSynchronizer)initWithDataOutputs:(NSArray *)dataOutputs;
- (BOOL)_allFollowerSynchronizedDataOutputsContainTimestampEqualToOrGreaterThanLeaderTimestamp:(id *)a3;
- (NSArray)dataOutputs;
- (dispatch_queue_t)delegateCallbackQueue;
- (id)delegate;
- (int)_computedLeaderSynchronizedDataQueueMaxDepthForDataOutputs:(id)a3;
- (void)_adjustSynchronizedDataTimestamps;
- (void)_appendSynchronizedData:(id)a3 forCaptureOutput:(id)a4;
- (void)_assignTimestampAdjustmentQueueToDataOutputStorageWithCommonProvenance;
- (void)_dispatchRipenedSynchronizedData;
- (void)_dispatchSynchronizedDataWithTimestamp:(id *)a3;
- (void)_overrideDataOutputDelegatesForDelegateCallbackQueue:(id)a3;
- (void)cameraCalibrationDataOutput:(id)a3 didDropCameraCalibrationDataAtTimestamp:(id *)a4 connection:(id)a5 reason:(int64_t)a6;
- (void)cameraCalibrationDataOutput:(id)a3 didOutputCameraCalibrationData:(id)a4 timestamp:(id *)a5 connection:(id)a6;
- (void)captureOutput:(id)a3 didDropSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)captureOutput:(id)a3 didOutputMetadataObjectCollections:(id)a4 fromConnection:(id)a5;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)dealloc;
- (void)depthDataOutput:(id)a3 didDropDepthData:(id)a4 timestamp:(id *)a5 connection:(id)a6 reason:(int64_t)a7;
- (void)depthDataOutput:(id)a3 didOutputDepthData:(id)a4 timestamp:(id *)a5 connection:(id)a6;
- (void)pointCloudDataOutput:(id)a3 didDropPointCloudData:(id)a4 timestamp:(id *)a5 connection:(id)a6 reason:(int64_t)a7;
- (void)pointCloudDataOutput:(id)a3 didOutputPointCloudData:(id)a4 timestamp:(id *)a5 connection:(id)a6;
- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)delegateCallbackQueue;
- (void)visionDataOutput:(id)a3 didDropVisionDataPixelBufferForTimestamp:(id *)a4 connection:(id)a5 reason:(int64_t)a6;
- (void)visionDataOutput:(id)a3 didOutputVisionDataPixelBuffer:(__CVBuffer *)a4 timestamp:(id *)a5 connection:(id)a6;
@end

@implementation AVCaptureDataOutputSynchronizer

+ (void)initialize
{
}

- (AVCaptureDataOutputSynchronizer)initWithDataOutputs:(NSArray *)dataOutputs
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (!dataOutputs)
  {
    v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3C8];
LABEL_45:
    v26 = (void *)[v23 exceptionWithName:v24 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];

    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v26);
    }
    NSLog(&cfstr_SuppressingExc.isa, v26);
    return 0;
  }
  if (![(NSArray *)dataOutputs count])
  {
    v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_45;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v5 = [(NSArray *)dataOutputs countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(dataOutputs);
        }
        v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      v23 = (void *)MEMORY[0x1E4F1CA00];
                      uint64_t v24 = *MEMORY[0x1E4F1C3C8];
                      goto LABEL_45;
                    }
                  }
                }
              }
            }
          }
        }
        uint64_t v11 = [v10 session];
        if (v7)
        {
          if (v11 != v7)
          {
            v23 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v24 = *MEMORY[0x1E4F1C3C8];
            goto LABEL_45;
          }
        }
        else
        {
          uint64_t v7 = v11;
          if (!v11)
          {
            v23 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v24 = *MEMORY[0x1E4F1C3C8];
            goto LABEL_45;
          }
        }
        if (!objc_msgSend((id)objc_msgSend(v10, "connections"), "firstObject"))
        {
          v23 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v24 = *MEMORY[0x1E4F1C3C8];
          goto LABEL_45;
        }
        if (([v10 conformsToProtocol:&unk_1EF4FF1C0] & 1) == 0)
        {
          v23 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v24 = *MEMORY[0x1E4F1C3C8];
          goto LABEL_45;
        }
      }
      uint64_t v6 = [(NSArray *)dataOutputs countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  v33.receiver = self;
  v33.super_class = (Class)AVCaptureDataOutputSynchronizer;
  v12 = [(AVCaptureDataOutputSynchronizer *)&v33 init];
  if (!v12) {
    return 0;
  }
  v13 = v12;
  v14 = objc_alloc_init(AVCaptureDataOutputSynchronizerInternal);
  v13->_internal = v14;
  if (!v14)
  {

    return 0;
  }
  v13->_internal->delegateCallbackHelper = [[AVCaptureDataOutputDelegateCallbackHelper alloc] initWithQueueName:@"com.apple.avfoundation.dataoutputsynchronizer.queue" canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:1];
  v13->_internal->weakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:v13];
  v15 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](dataOutputs, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v16 = dataOutputs;
  uint64_t v17 = [(NSArray *)dataOutputs countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    char v19 = 0;
    uint64_t v28 = 0;
    uint64_t v20 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(dataOutputs);
        }
        v22 = [[AVCDOSDataOutputStorage alloc] initWithDataOutput:*(void *)(*((void *)&v29 + 1) + 8 * j)];
        [(NSArray *)v15 addObject:v22];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v19 = 1;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            LOBYTE(v28) = 1;
          }
          else
          {
            objc_opt_class();
            HIDWORD(v28) |= objc_opt_isKindOfClass();
          }
        }
      }
      uint64_t v18 = [(NSArray *)dataOutputs countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v18);
  }
  else
  {
    char v19 = 0;
    uint64_t v28 = 0;
  }
  v25 = v13;
  v13->_internal->dataOutputsStorage = v15;
  v13->_internal->dataOutputs = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v16];
  v13->_internal->leaderSynchronizedDataQueueMaxDepth = [(AVCaptureDataOutputSynchronizer *)v13 _computedLeaderSynchronizedDataQueueMaxDepthForDataOutputs:v16];
  v13->_internal->dataOutputsStorageMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  [(AVCaptureDataOutputSynchronizer *)v13 _assignTimestampAdjustmentQueueToDataOutputStorageWithCommonProvenance];
  v13->_internal->synchronizingVideoAndDepth = v19 & v28 & 1;
  v13->_internal->synchronizingVideoAndVisionData = v19 & BYTE4(v28) & 1;
  return v25;
}

- (void)dealloc
{
  if (self->_internal)
  {
    [(AVCaptureDataOutputSynchronizer *)self setDelegate:0 queue:0];

    FigSimpleMutexDestroy();
  }
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDataOutputSynchronizer;
  [(AVCaptureDataOutputSynchronizer *)&v3 dealloc];
}

- (NSArray)dataOutputs
{
  return self->_internal->dataOutputs;
}

- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)delegateCallbackQueue
{
  [(AVCaptureDataOutputSynchronizer *)self willChangeValueForKey:@"delegate"];
  uint64_t v8 = 0;
  if ([(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper setClientDelegate:delegate clientCallbackQueue:delegateCallbackQueue exceptionReason:&v8])
  {
    [(AVCaptureDataOutputSynchronizer *)self _overrideDataOutputDelegatesForDelegateCallbackQueue:delegateCallbackQueue];
    [(AVCaptureDataOutputSynchronizer *)self didChangeValueForKey:@"delegate"];
  }
  else
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    [(AVCaptureDataOutputSynchronizer *)self didChangeValueForKey:@"delegate"];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
}

- (id)delegate
{
  return [(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper clientDelegate];
}

- (dispatch_queue_t)delegateCallbackQueue
{
  return (dispatch_queue_t)[(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper clientCallbackQueue];
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v7 = [[AVCaptureSynchronizedSampleBufferData alloc] _initWithSampleBuffer:a4 sampleBufferWasDropped:0];
  [(AVCaptureDataOutputSynchronizer *)self _appendSynchronizedData:v7 forCaptureOutput:a3];
}

- (void)captureOutput:(id)a3 didDropSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v7 = [[AVCaptureSynchronizedSampleBufferData alloc] _initWithSampleBuffer:a4 sampleBufferWasDropped:1];
  [(AVCaptureDataOutputSynchronizer *)self _appendSynchronizedData:v7 forCaptureOutput:a3];
}

- (void)captureOutput:(id)a3 didOutputMetadataObjectCollections:(id)a4 fromConnection:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = (void *)[a4 sortedArrayUsingComparator:&__block_literal_global_155];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [[AVCaptureSynchronizedMetadataObjectData alloc] _initWithMetadataObjectCollection:*(void *)(*((void *)&v13 + 1) + 8 * v11)];
        [(AVCaptureDataOutputSynchronizer *)self _appendSynchronizedData:v12 forCaptureOutput:a3];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

uint64_t __99__AVCaptureDataOutputSynchronizer_captureOutput_didOutputMetadataObjectCollections_fromConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (!a2)
  {
    memset(&time1, 0, sizeof(time1));
    if (a3) {
      goto LABEL_3;
    }
LABEL_5:
    memset(&v5, 0, sizeof(v5));
    return CMTimeCompare(&time1, &v5);
  }
  [a2 time];
  if (!a3) {
    goto LABEL_5;
  }
LABEL_3:
  [a3 time];
  return CMTimeCompare(&time1, &v5);
}

- (void)depthDataOutput:(id)a3 didOutputDepthData:(id)a4 timestamp:(id *)a5 connection:(id)a6
{
  uint64_t v10 = [AVCaptureSynchronizedDepthData alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a5;
  id v11 = [(AVCaptureSynchronizedDepthData *)v10 _initWithDepthData:a4 timestamp:&v12 depthDataWasDropped:0 droppedReason:0];
  [(AVCaptureDataOutputSynchronizer *)self _appendSynchronizedData:v11 forCaptureOutput:a3];
}

- (void)depthDataOutput:(id)a3 didDropDepthData:(id)a4 timestamp:(id *)a5 connection:(id)a6 reason:(int64_t)a7
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = [AVCaptureSynchronizedDepthData alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a5;
  id v13 = [(AVCaptureSynchronizedDepthData *)v12 _initWithDepthData:a4 timestamp:&v14 depthDataWasDropped:1 droppedReason:a7];
  [(AVCaptureDataOutputSynchronizer *)self _appendSynchronizedData:v13 forCaptureOutput:a3];
}

- (void)visionDataOutput:(id)a3 didOutputVisionDataPixelBuffer:(__CVBuffer *)a4 timestamp:(id *)a5 connection:(id)a6
{
  uint64_t v10 = [AVCaptureSynchronizedVisionData alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a5;
  id v11 = [(AVCaptureSynchronizedVisionData *)v10 _initWithVisionDataPixelBuffer:a4 timestamp:&v12 visionDataWasDropped:0 droppedReason:0];
  [(AVCaptureDataOutputSynchronizer *)self _appendSynchronizedData:v11 forCaptureOutput:a3];
}

- (void)visionDataOutput:(id)a3 didDropVisionDataPixelBufferForTimestamp:(id *)a4 connection:(id)a5 reason:(int64_t)a6
{
  uint64_t v10 = [AVCaptureSynchronizedVisionData alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a4;
  id v11 = [(AVCaptureSynchronizedVisionData *)v10 _initWithVisionDataPixelBuffer:0 timestamp:&v12 visionDataWasDropped:1 droppedReason:a6];
  [(AVCaptureDataOutputSynchronizer *)self _appendSynchronizedData:v11 forCaptureOutput:a3];
}

- (void)pointCloudDataOutput:(id)a3 didOutputPointCloudData:(id)a4 timestamp:(id *)a5 connection:(id)a6
{
  uint64_t v10 = [AVCaptureSynchronizedPointCloudData alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a5;
  id v11 = [(AVCaptureSynchronizedPointCloudData *)v10 _initWithPointCloudDataBuffer:a4 timestamp:&v12 pointCloudDataWasDropped:0 droppedReason:0];
  [(AVCaptureDataOutputSynchronizer *)self _appendSynchronizedData:v11 forCaptureOutput:a3];
}

- (void)pointCloudDataOutput:(id)a3 didDropPointCloudData:(id)a4 timestamp:(id *)a5 connection:(id)a6 reason:(int64_t)a7
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = [AVCaptureSynchronizedPointCloudData alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a5;
  id v13 = [(AVCaptureSynchronizedPointCloudData *)v12 _initWithPointCloudDataBuffer:a4 timestamp:&v14 pointCloudDataWasDropped:1 droppedReason:a7];
  [(AVCaptureDataOutputSynchronizer *)self _appendSynchronizedData:v13 forCaptureOutput:a3];
}

- (void)cameraCalibrationDataOutput:(id)a3 didOutputCameraCalibrationData:(id)a4 timestamp:(id *)a5 connection:(id)a6
{
  uint64_t v10 = [AVCaptureSynchronizedCameraCalibrationData alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a5;
  id v11 = [(AVCaptureSynchronizedCameraCalibrationData *)v10 _initWithCameraCalibrationData:a4 timestamp:&v12 cameraCalibrationDataWasDropped:0 droppedReason:0];
  [(AVCaptureDataOutputSynchronizer *)self _appendSynchronizedData:v11 forCaptureOutput:a3];
}

- (void)cameraCalibrationDataOutput:(id)a3 didDropCameraCalibrationDataAtTimestamp:(id *)a4 connection:(id)a5 reason:(int64_t)a6
{
  uint64_t v10 = [AVCaptureSynchronizedCameraCalibrationData alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a4;
  id v11 = [(AVCaptureSynchronizedCameraCalibrationData *)v10 _initWithCameraCalibrationData:0 timestamp:&v12 cameraCalibrationDataWasDropped:1 droppedReason:a6];
  [(AVCaptureDataOutputSynchronizer *)self _appendSynchronizedData:v11 forCaptureOutput:a3];
}

- (int)_computedLeaderSynchronizedDataQueueMaxDepthForDataOutputs:(id)a3
{
  if ([a3 count] == 1) {
    return 1;
  }
  else {
    return 4;
  }
}

- (void)_assignTimestampAdjustmentQueueToDataOutputStorageWithCommonProvenance
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSArray *)self->_internal->dataOutputsStorage count];
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v3];
  CMTime v5 = (void *)v4;
  if (v3)
  {
    NSUInteger v6 = 0;
    v21 = (void *)v4;
    do
    {
      id v7 = [(NSArray *)self->_internal->dataOutputsStorage objectAtIndexedSubscript:v6];
      uint64_t v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "dataOutput"), "connections"), "objectAtIndexedSubscript:", 0), "sourceDevice");
      if ([v5 containsObject:v8])
      {
        ++v6;
      }
      else
      {
        [v5 addObject:v8];
        uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v3 - v6];
        [v9 addObject:v7];
        [v7 dataOutput];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v10 = v6;
        }
        else {
          uint64_t v10 = -1;
        }
        [v7 dataOutput];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v11 = v6;
        }
        else {
          uint64_t v11 = -1;
        }
        uint64_t v12 = ++v6;
        if (v6 < v3)
        {
          do
          {
            id v13 = [(NSArray *)self->_internal->dataOutputsStorage objectAtIndexedSubscript:v12];
            if (v8 == objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "dataOutput"), "connections"), "objectAtIndexedSubscript:", 0), "sourceDevice"))
            {
              [v9 addObject:v13];
              if (v10 == -1 && ([v13 dataOutput], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                uint64_t v10 = v12;
              }
              else if (v11 == -1)
              {
                [v13 dataOutput];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  uint64_t v11 = v12;
                }
                else {
                  uint64_t v11 = -1;
                }
              }
            }
            ++v12;
          }
          while (v3 != v12);
        }
        if (v10 == -1) {
          uint64_t v14 = v11;
        }
        else {
          uint64_t v14 = v10;
        }
        if (v14 != -1)
        {
          id v15 = -[NSArray objectAtIndexedSubscript:](self->_internal->dataOutputsStorage, "objectAtIndexedSubscript:");
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v16 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v23;
            do
            {
              uint64_t v19 = 0;
              do
              {
                if (*(void *)v23 != v18) {
                  objc_enumerationMutation(v9);
                }
                id v20 = *(id *)(*((void *)&v22 + 1) + 8 * v19);
                if (v20 != v15) {
                  objc_msgSend(v20, "setTimestampAdjustmentsDataQueue:", objc_msgSend(v15, "synchronizedDataQueue"));
                }
                ++v19;
              }
              while (v17 != v19);
              uint64_t v17 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
            }
            while (v17);
          }
        }

        CMTime v5 = v21;
      }
    }
    while (v6 != v3);
  }
}

- (void)_overrideDataOutputDelegatesForDelegateCallbackQueue:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3) {
    uint64_t qos_class = dispatch_queue_get_qos_class((dispatch_queue_t)a3, 0);
  }
  else {
    uint64_t qos_class = 21;
  }
  MEMORY[0x1A6234330](self->_internal->dataOutputsStorageMutex);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  dataOutputsStorage = self->_internal->dataOutputsStorage;
  uint64_t v7 = [(NSArray *)dataOutputsStorage countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(dataOutputsStorage);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (a3)
        {
          if (qos_class >= 0x16) {
            [*(id *)(*((void *)&v13 + 1) + 8 * i) updateDelegateOverrideCallbackQueueQOSClass:qos_class];
          }
          objc_msgSend((id)objc_msgSend(v11, "dataOutput"), "setDelegateOverride:delegateOverrideCallbackQueue:", self, objc_msgSend(v11, "delegateOverrideCallbackQueue"));
        }
        else
        {
          uint64_t v12 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dataOutput"), "delegateOverrideCallbackQueue");
          if (v12 == [v11 delegateOverrideCallbackQueue]) {
            objc_msgSend((id)objc_msgSend(v11, "dataOutput"), "setDelegateOverride:delegateOverrideCallbackQueue:", 0, 0);
          }
          objc_msgSend((id)objc_msgSend(v11, "synchronizedDataQueue"), "removeAllObjects");
        }
      }
      uint64_t v8 = [(NSArray *)dataOutputsStorage countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  MEMORY[0x1A6234340](self->_internal->dataOutputsStorageMutex);
}

- (void)_appendSynchronizedData:(id)a3 forCaptureOutput:(id)a4
{
  MEMORY[0x1A6234330](self->_internal->dataOutputsStorageMutex, a2);
  NSUInteger v7 = [(NSArray *)self->_internal->dataOutputs indexOfObject:a4];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_internal->dataOutputsStorage, "objectAtIndexedSubscript:", v7), "synchronizedDataQueue"), "addObject:", a3);
    [(AVCaptureDataOutputSynchronizer *)self _dispatchRipenedSynchronizedData];
  }

  JUMPOUT(0x1A6234340);
}

- (void)_dispatchRipenedSynchronizedData
{
  FigSimpleMutexCheckIsLockedOnThisThread();
  [(AVCaptureDataOutputSynchronizer *)self _adjustSynchronizedDataTimestamps];
  NSUInteger v3 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_internal->dataOutputsStorage, "objectAtIndexedSubscript:", 0), "synchronizedDataQueue");
  if ([v3 count])
  {
    memset(&v11, 0, sizeof(v11));
    uint64_t v4 = (void *)[v3 objectAtIndexedSubscript:0];
    if (v4) {
      [v4 timestamp];
    }
    else {
      memset(&v11, 0, sizeof(v11));
    }
    memset(&v10, 0, sizeof(v10));
    [(AVCaptureDataOutputSynchronizer *)self _earliestFollowerSynchronizedDataQueueTimestamp];
    *(_OWORD *)&time1.value = 0uLL;
    for (CMTimeEpoch i = 0; ; CMTimeEpoch i = time1.epoch)
    {
      time1.epoch = i;
      CMTime v8 = v11;
      if ((CMTimeCompare(&time1, &v8) & 0x80000000) == 0) {
        break;
      }
      CMTime time1 = v10;
      [(AVCaptureDataOutputSynchronizer *)self _dispatchSynchronizedDataWithTimestamp:&time1];
      [(AVCaptureDataOutputSynchronizer *)self _earliestFollowerSynchronizedDataQueueTimestamp];
      CMTime v10 = time1;
    }
    CMTime time1 = v11;
    if ([(AVCaptureDataOutputSynchronizer *)self _allFollowerSynchronizedDataOutputsContainTimestampEqualToOrGreaterThanLeaderTimestamp:&time1])
    {
      while (1)
      {
        CMTime time1 = v11;
        [(AVCaptureDataOutputSynchronizer *)self _dispatchSynchronizedDataWithTimestamp:&time1];
        if (![v3 count]) {
          break;
        }
        NSUInteger v6 = (void *)[v3 objectAtIndexedSubscript:0];
        if (v6) {
          [v6 timestamp];
        }
        else {
          memset(&time1, 0, sizeof(time1));
        }
        CMTime v11 = time1;
        if (![(AVCaptureDataOutputSynchronizer *)self _allFollowerSynchronizedDataOutputsContainTimestampEqualToOrGreaterThanLeaderTimestamp:&time1])goto LABEL_20; {
      }
        }
    }
    else
    {
LABEL_20:
      while ([v3 count] > (unint64_t)self->_internal->leaderSynchronizedDataQueueMaxDepth)
      {
        CMTime time1 = v11;
        [(AVCaptureDataOutputSynchronizer *)self _dispatchSynchronizedDataWithTimestamp:&time1];
        if (![v3 count]) {
          break;
        }
        NSUInteger v7 = (void *)[v3 objectAtIndexedSubscript:0];
        if (v7) {
          [v7 timestamp];
        }
        else {
          memset(&time1, 0, sizeof(time1));
        }
        CMTime v11 = time1;
      }
    }
  }
}

- (void)_adjustSynchronizedDataTimestamps
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  FigSimpleMutexCheckIsLockedOnThisThread();
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  obuint64_t j = self->_internal->dataOutputsStorage;
  uint64_t v24 = [(NSArray *)obj countByEnumeratingWithState:&v68 objects:v74 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v69 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        if ([v4 timestampAdjustmentsDataQueue])
        {
          uint64_t v25 = i;
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          id v26 = (id)[v4 synchronizedDataQueue];
          uint64_t v5 = [v26 countByEnumeratingWithState:&v64 objects:v73 count:16];
          if (!v5) {
            goto LABEL_60;
          }
          uint64_t v6 = v5;
          uint64_t v27 = *(void *)v65;
          while (1)
          {
            for (uint64_t j = 0; j != v6; ++j)
            {
              if (*(void *)v65 != v27) {
                objc_enumerationMutation(v26);
              }
              CMTime v8 = *(void **)(*((void *)&v64 + 1) + 8 * j);
              if (v8)
              {
                [*(id *)(*((void *)&v64 + 1) + 8 * j) adjustedTimestamp];
                if ((v62 & 0x100000000) != 0) {
                  continue;
                }
              }
              else
              {
                uint64_t v62 = 0;
                uint64_t v61 = 0;
                uint64_t v63 = 0;
              }
              long long v9 = *MEMORY[0x1E4F1FA08];
              v60.epoch = *(void *)(MEMORY[0x1E4F1FA08] + 16);
              long long v56 = 0u;
              long long v57 = 0u;
              long long v58 = 0u;
              long long v59 = 0u;
              *(_OWORD *)&v60.value = v9;
              CMTime v10 = (void *)[v4 timestampAdjustmentsDataQueue];
              uint64_t v11 = [v10 countByEnumeratingWithState:&v56 objects:v72 count:16];
              if (!v11) {
                continue;
              }
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v57;
              while (2)
              {
                for (uint64_t k = 0; k != v12; ++k)
                {
                  if (*(void *)v57 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  long long v15 = *(void **)(*((void *)&v56 + 1) + 8 * k);
                  if (v15)
                  {
                    [*(id *)(*((void *)&v56 + 1) + 8 * k) timestamp];
                    if (v8) {
                      goto LABEL_23;
                    }
                  }
                  else
                  {
                    memset(&time1, 0, sizeof(time1));
                    if (v8)
                    {
LABEL_23:
                      [v8 timestamp];
                      goto LABEL_26;
                    }
                  }
                  memset(&time2, 0, sizeof(time2));
LABEL_26:
                  if (!CMTimeCompare(&time1, &time2))
                  {
                    if (v15)
                    {
                      [v15 timestamp];
                    }
                    else
                    {
                      long long v52 = 0uLL;
                      uint64_t v53 = 0;
                    }
                    long long v50 = v52;
                    uint64_t v51 = v53;
                    long long v16 = (CMTime *)&v50;
                    goto LABEL_57;
                  }
                  if (v15)
                  {
                    [v15 timestamp];
                    if (v8) {
                      goto LABEL_29;
                    }
                  }
                  else
                  {
                    memset(&v49, 0, sizeof(v49));
                    if (v8)
                    {
LABEL_29:
                      [v8 timestamp];
                      goto LABEL_32;
                    }
                  }
                  memset(&v48, 0, sizeof(v48));
LABEL_32:
                  if (CMTimeCompare(&v49, &v48) >= 1)
                  {
                    memset(&v47, 0, sizeof(v47));
                    if (v8) {
                      [v8 timestamp];
                    }
                    else {
                      memset(&lhs, 0, sizeof(lhs));
                    }
                    CMTime rhs = v60;
                    CMTimeSubtract(&v47, &lhs, &rhs);
                    memset(&rhs, 0, sizeof(rhs));
                    if (v15)
                    {
                      [v15 timestamp];
                      if (v8) {
                        goto LABEL_48;
                      }
LABEL_50:
                      memset(&v43, 0, sizeof(v43));
                    }
                    else
                    {
                      memset(&v44, 0, sizeof(v44));
                      if (!v8) {
                        goto LABEL_50;
                      }
LABEL_48:
                      [v8 timestamp];
                    }
                    CMTimeSubtract(&rhs, &v44, &v43);
                    CMTime v42 = rhs;
                    CMTime v41 = v47;
                    if (CMTimeCompare(&v42, &v41) < 0)
                    {
                      if (v15)
                      {
                        [v15 timestamp];
                      }
                      else
                      {
                        long long v39 = 0uLL;
                        uint64_t v40 = 0;
                      }
                      long long v37 = v39;
                      uint64_t v38 = v40;
                      long long v16 = (CMTime *)&v37;
                    }
                    else
                    {
                      CMTime v36 = v60;
                      long long v16 = &v36;
                    }
LABEL_57:
                    [v8 setAdjustedTimestamp:v16];
                    goto LABEL_58;
                  }
                  if (v15) {
                    [v15 timestamp];
                  }
                  else {
                    memset(&v47, 0, sizeof(v47));
                  }
                  CMTime v60 = v47;
                }
                uint64_t v12 = [v10 countByEnumeratingWithState:&v56 objects:v72 count:16];
                if (v12) {
                  continue;
                }
                break;
              }
LABEL_58:
              ;
            }
            uint64_t v6 = [v26 countByEnumeratingWithState:&v64 objects:v73 count:16];
            if (!v6)
            {
LABEL_60:
              [v4 dataOutput];
              objc_opt_class();
              uint64_t i = v25;
              if ((objc_opt_isKindOfClass() & 1) != 0
                && objc_msgSend((id)objc_msgSend(v4, "synchronizedDataQueue"), "count") >= 2)
              {
                uint64_t v17 = 0;
                do
                {
                  uint64_t v18 = objc_msgSend((id)objc_msgSend(v4, "synchronizedDataQueue"), "objectAtIndexedSubscript:", v17++);
                  if (v17 < objc_msgSend((id)objc_msgSend(v4, "synchronizedDataQueue"), "count"))
                  {
                    uint64_t v19 = v17;
                    do
                    {
                      uint64_t v20 = objc_msgSend((id)objc_msgSend(v4, "synchronizedDataQueue"), "objectAtIndexedSubscript:", v19);
                      if (v18)
                      {
                        v21 = (void *)v20;
                        [v18 adjustedTimestamp];
                        if ((v34 & 0x100000000) != 0)
                        {
                          if (v21)
                          {
                            [v21 adjustedTimestamp];
                            if ((v31 & 0x100000000) != 0)
                            {
                              [v18 adjustedTimestamp];
                              [v21 adjustedTimestamp];
                              if (!CMTimeCompare(&v29, &v28))
                              {
                                [v18 addSynchronizedData:v21];
                                objc_msgSend((id)objc_msgSend(v4, "synchronizedDataQueue"), "removeObjectAtIndex:", v19--);
                              }
                            }
                          }
                          else
                          {
                            uint64_t v30 = 0;
                            uint64_t v31 = 0;
                            uint64_t v32 = 0;
                          }
                        }
                      }
                      else
                      {
                        uint64_t v33 = 0;
                        uint64_t v34 = 0;
                        uint64_t v35 = 0;
                      }
                      ++v19;
                    }
                    while (v19 < objc_msgSend((id)objc_msgSend(v4, "synchronizedDataQueue"), "count"));
                  }
                }
                while (v17 < objc_msgSend((id)objc_msgSend(v4, "synchronizedDataQueue"), "count") - 1);
              }
              break;
            }
          }
        }
      }
      uint64_t v24 = [(NSArray *)obj countByEnumeratingWithState:&v68 objects:v74 count:16];
    }
    while (v24);
  }
}

- (BOOL)_allFollowerSynchronizedDataOutputsContainTimestampEqualToOrGreaterThanLeaderTimestamp:(id *)a3
{
  FigSimpleMutexCheckIsLockedOnThisThread();
  uint64_t v5 = [(NSArray *)self->_internal->dataOutputsStorage count];
  uint64_t v6 = v5;
  internal = self->_internal;
  BOOL v8 = internal->synchronizingVideoAndDepth || internal->synchronizingVideoAndVisionData;
  long long v9 = 0;
  if (v8 && v5 >= 1)
  {
    uint64_t v10 = 0;
    while (1)
    {
      id v11 = [(NSArray *)self->_internal->dataOutputsStorage objectAtIndexedSubscript:v10];
      [v11 dataOutput];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (objc_msgSend((id)objc_msgSend(v11, "synchronizedDataQueue"), "count")) {
          break;
        }
      }
      if (v6 == ++v10)
      {
        long long v9 = 0;
        goto LABEL_12;
      }
    }
    long long v9 = objc_msgSend((id)objc_msgSend(v11, "synchronizedDataQueue"), "objectAtIndexedSubscript:", 0);
  }
LABEL_12:
  if (v6 > 1)
  {
    BOOL v12 = 0;
    for (uint64_t i = 1; i != v6; v12 = i >= v6)
    {
      id v14 = [(NSArray *)self->_internal->dataOutputsStorage objectAtIndexedSubscript:i];
      if ([v14 isLive])
      {
        if (!self->_internal->synchronizingVideoAndDepth
          || ([v14 dataOutput], objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
          || !v9
          || [v9 hasCorrespondingDepthData])
        {
          if (!self->_internal->synchronizingVideoAndVisionData
            || ([v14 dataOutput], objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
            || !v9
            || [v9 hasCorrespondingVisionData])
          {
            long long v16 = *(_OWORD *)&a3->var0;
            int64_t var3 = a3->var3;
            if (![v14 hasAllExpectedSynchronizedDataForLeaderTimestamp:&v16]) {
              break;
            }
          }
        }
      }
      ++i;
    }
  }
  else
  {
    return 1;
  }
  return v12;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_earliestFollowerSynchronizedDataQueueTimestamp
{
  FigSimpleMutexCheckIsLockedOnThisThread();
  result = [(NSArray *)self->_internal->dataOutputsStorage count];
  if ((uint64_t)result > 1)
  {
    NSUInteger v7 = result;
    uint64_t v8 = MEMORY[0x1E4F1FA10];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1FA10];
    retstr->int64_t var3 = *(void *)(v8 + 16);
    uint64_t v9 = 1;
    while (1)
    {
      id v10 = [(NSArray *)self->_internal->dataOutputsStorage objectAtIndexedSubscript:v9];
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)objc_msgSend((id)objc_msgSend(v10, "synchronizedDataQueue"), "count");
      if (result) {
        break;
      }
LABEL_12:
      if (v7 == ($3CC8671D27C23BF42ADDB32F2B5E48AE *)++v9) {
        return result;
      }
    }
    id v11 = objc_msgSend((id)objc_msgSend(v10, "synchronizedDataQueue"), "objectAtIndexedSubscript:", 0);
    memset(&v15, 0, sizeof(v15));
    if (v11)
    {
      BOOL v12 = v11;
      [v11 adjustedTimestamp];
      if (v15.flags) {
        goto LABEL_10;
      }
      [v12 timestamp];
    }
    else
    {
      memset(&time1, 0, sizeof(time1));
    }
    CMTime v15 = time1;
LABEL_10:
    CMTime time1 = v15;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *retstr;
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&time1, (CMTime *)&v13);
    if ((result & 0x80000000) != 0) {
      *(CMTime *)retstr = v15;
    }
    goto LABEL_12;
  }
  uint64_t v6 = MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
  retstr->int64_t var3 = *(void *)(v6 + 16);
  return result;
}

- (void)_dispatchSynchronizedDataWithTimestamp:(id *)a3
{
  FigSimpleMutexCheckIsLockedOnThisThread();
  uint64_t v5 = self->_internal->weakReference;
  id v6 = [[AVCaptureSynchronizedDataCollection alloc] _initWithPossibleDataOutputs:self->_internal->dataOutputs];
  NSUInteger v7 = [(NSArray *)self->_internal->dataOutputsStorage count];
  if (v7)
  {
    NSUInteger v8 = v7;
    uint64_t v9 = 0;
    while (1)
    {
      id v10 = [(NSArray *)self->_internal->dataOutputsStorage objectAtIndexedSubscript:v9];
      if (objc_msgSend((id)objc_msgSend(v10, "synchronizedDataQueue"), "count")) {
        break;
      }
LABEL_12:
      if (v8 == ++v9) {
        goto LABEL_13;
      }
    }
    id v11 = objc_msgSend((id)objc_msgSend(v10, "synchronizedDataQueue"), "objectAtIndexedSubscript:", 0);
    BOOL v12 = v11;
    memset(&v18, 0, sizeof(v18));
    if (v11)
    {
      [v11 adjustedTimestamp];
      if (v18.flags) {
        goto LABEL_9;
      }
      [v12 timestamp];
    }
    else
    {
      memset(&time1, 0, sizeof(time1));
    }
    CMTime v18 = time1;
LABEL_9:
    CMTime time1 = (CMTime)*a3;
    CMTime time2 = v18;
    if (CMTimeCompare(&time1, &time2))
    {
      memset(&time1, 0, sizeof(time1));
      CMTime time2 = (CMTime)*a3;
      CMTime rhs = v18;
      CMTimeSubtract(&time1, &time2, &rhs);
    }
    else
    {
      objc_msgSend(v6, "_setSynchronizedData:forCaptureOutput:", v12, objc_msgSend(v10, "dataOutput"));
      objc_msgSend((id)objc_msgSend(v10, "synchronizedDataQueue"), "removeObjectAtIndex:", 0);
    }
    goto LABEL_12;
  }
LABEL_13:
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = [(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper activeCallbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__AVCaptureDataOutputSynchronizer__dispatchSynchronizedDataWithTimestamp___block_invoke;
  block[3] = &unk_1E5A731E0;
  block[4] = v5;
  block[5] = self;
  block[6] = v6;
  dispatch_async((dispatch_queue_t)v13, block);
}

void __74__AVCaptureDataOutputSynchronizer__dispatchSynchronizedDataWithTimestamp___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1A62348E0]();
  id v3 = (id)[*(id *)(a1 + 32) referencedObject];
  if (v3) {
    objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 8), "activeDelegate"), "dataOutputSynchronizer:didOutputSynchronizedDataCollection:", v3, *(void *)(a1 + 48));
  }
}

@end