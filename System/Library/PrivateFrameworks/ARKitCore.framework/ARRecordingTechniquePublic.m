@interface ARRecordingTechniquePublic
+ (BOOL)isSupported;
- (ARParentImageSensorSettings)parentImageSensorSettings;
- (ARRecordingTechniqueDelegate)recordingTechniqueDelegate;
- (ARRecordingTechniquePublic)init;
- (ARRecordingTechniquePublic)initWithFileURL:(id)a3 recordingSensorDataTypes:(unint64_t)a4;
- (ARRecordingTechniquePublic)initWithFileURL:(id)a3 recordingSensorDataTypes:(unint64_t)a4 startImmediately:(BOOL)a5 recordCollaborationData:(BOOL)a6;
- (BOOL)allowedToWrite;
- (BOOL)expectAudioData;
- (BOOL)expectCustomData;
- (BOOL)expectDepthData;
- (BOOL)finished;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldSaveVideoInPhotosLibrary;
- (NSDictionary)customUserData;
- (NSURL)outputFileURL;
- (id)createFileMetadata;
- (id)processData:(id)a3;
- (unint64_t)recordingSensorDataTypes;
- (unint64_t)requiredSensorDataTypes;
- (unint64_t)state;
- (void)_fail:(id)a3;
- (void)_finish:(id)a3;
- (void)_finishRecording;
- (void)_startRecording;
- (void)abortRecording;
- (void)dealloc;
- (void)didFailWithError:(id)a3;
- (void)didFinishRecording;
- (void)finishRecording;
- (void)isReadyToRecord;
- (void)processTimeSensitiveNSCoderObject:(id)a3 withTimestamp:(double)a4 metadataID:(id)a5;
- (void)recordAddedAnchor:(id)a3;
- (void)recordCollaborationData:(id)a3 localSession:(BOOL)a4;
- (void)recordCustomData:(id)a3 forTimestamp:(double)a4;
- (void)recordRemovedAnchor:(id)a3;
- (void)removeTemporaryVideoFile;
- (void)setCustomUserData:(id)a3;
- (void)setExpectAudioData:(BOOL)a3;
- (void)setExpectCustomData:(BOOL)a3;
- (void)setExpectDepthData:(BOOL)a3;
- (void)setParentImageSensorSettings:(id)a3;
- (void)setRecordingTechniqueDelegate:(id)a3;
- (void)setShouldSaveVideoInPhotosLibrary:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setupCustomTrack;
- (void)setupSensorTracks;
- (void)startRecording;
- (void)writeAudioData:(id)a3;
- (void)writeImageData:(id)a3;
- (void)writePearlDepthData:(id)a3 withTimestamp:(double)a4 fromCaptureDevice:(id)a5;
- (void)writeResultData:(id)a3 withTimestamp:(double)a4;
- (void)writeSensorData:(id)a3;
- (void)writeTimeOfFlightData:(id)a3;
@end

@implementation ARRecordingTechniquePublic

- (ARRecordingTechniquePublic)init
{
  return [(ARRecordingTechniquePublic *)self initWithFileURL:0 sensorDataTypes:0];
}

- (ARRecordingTechniquePublic)initWithFileURL:(id)a3 recordingSensorDataTypes:(unint64_t)a4
{
  return [(ARRecordingTechniquePublic *)self initWithFileURL:a3 recordingSensorDataTypes:a4 startImmediately:1 recordCollaborationData:0];
}

- (ARRecordingTechniquePublic)initWithFileURL:(id)a3 recordingSensorDataTypes:(unint64_t)a4 startImmediately:(BOOL)a5 recordCollaborationData:(BOOL)a6
{
  BOOL v7 = a5;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v57.receiver = self;
  v57.super_class = (Class)ARRecordingTechniquePublic;
  v11 = [(ARTechnique *)&v57 init];
  v12 = v11;
  if (!v11)
  {
    v15 = v10;
LABEL_21:
    v48 = v12;
    goto LABEL_25;
  }
  v11->_recordCollaborationData = a6;
  v11->_recordPearlDepthData = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.recordingTechnique.recordPearlDepthData"];
  v13 = +[ARKitUserDefaults stringForKey:@"com.apple.arkit.session.record.filepath"];
  v14 = v13;
  if (v13)
  {
    if ([v13 isAbsolutePath])
    {
      v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14];
    }
    else
    {
      v17 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
      v18 = [v17 lastObject];

      v19 = (void *)MEMORY[0x1E4F1CB10];
      v20 = [v18 stringByAppendingPathComponent:v14];
      v15 = [v19 fileURLWithPath:v20];

      id v10 = v18;
    }

    if (_ARLogSession_onceToken_0 != -1) {
      dispatch_once(&_ARLogSession_onceToken_0, &__block_literal_global_32);
    }
    v21 = (void *)_ARLogSession_logObj_0;
    if (os_log_type_enabled((os_log_t)_ARLogSession_logObj_0, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      v25 = [v15 absoluteString];
      *(_DWORD *)buf = 138543874;
      v60 = v24;
      __int16 v61 = 2048;
      v62 = v12;
      __int16 v63 = 2112;
      v64 = v25;
      _os_log_impl(&dword_1B88A2000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Setting recording URL to %@", buf, 0x20u);
    }
    char v16 = 0;
  }
  else if (v10)
  {
    char v16 = 0;
    v15 = v10;
  }
  else
  {
    v53 = (void *)MEMORY[0x1E4F1CB10];
    v54 = NSTemporaryDirectory();
    v55 = [v54 stringByAppendingPathComponent:@"movie.mov"];
    v15 = [v53 fileURLWithPath:v55];

    char v16 = 1;
  }
  if ([v15 isFileURL])
  {
    v56 = [v15 URLByDeletingLastPathComponent];
    uint64_t v58 = *MEMORY[0x1E4F1C6A8];
    uint64_t v26 = v58;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
    [v56 resourceValuesForKeys:v27 error:0];
    v28 = v15;
    v29 = v14;
    char v30 = v16;
    unint64_t v31 = a4;
    v33 = BOOL v32 = v7;
    v34 = [v33 objectForKeyedSubscript:v26];
    char v35 = [v34 BOOLValue];

    BOOL v36 = v32;
    unint64_t v37 = v31;
    char v38 = v30;
    v14 = v29;
    v15 = v28;

    if (v35)
    {
      objc_storeStrong((id *)&v12->_outputFileURL, v28);
      v12->_sensorDataTypes = v37;
      uint64_t v39 = ARCreateFixedPriorityDispatchQueueWithQOS("com.apple.arkit.arrecordingpublictechnique.mainqueue");
      recordingQueue = v12->_recordingQueue;
      v12->_recordingQueue = (OS_dispatch_queue *)v39;

      v41 = dispatch_queue_attr_make_initially_inactive(0);
      dispatch_queue_t v42 = dispatch_queue_create("com.apple.arkit.arrecordingpublictechnique.runningqueue", v41);
      timeSensitiveQueue = v12->_timeSensitiveQueue;
      v12->_timeSensitiveQueue = (OS_dispatch_queue *)v42;

      dispatch_set_target_queue((dispatch_object_t)v12->_timeSensitiveQueue, (dispatch_queue_t)v12->_recordingQueue);
      v12->_state = 0;
      v12->_sessionSourceTime = -1.0;
      uint64_t v44 = objc_opt_new();
      lastRecordedTimestamps = v12->_lastRecordedTimestamps;
      v12->_lastRecordedTimestamps = (NSMutableDictionary *)v44;

      uint64_t v46 = objc_opt_new();
      knownVIOSessionIDs = v12->_knownVIOSessionIDs;
      v12->_knownVIOSessionIDs = (NSMutableSet *)v46;

      v12->_shouldSaveVideoInPhotosLibrary = v38;
      if (objc_opt_respondsToSelector()) {
        [(ARRecordingTechniquePublic *)v12 performSelector:sel__subscribeToBackgroundNotifications];
      }
      if (v36) {
        [(ARRecordingTechniquePublic *)v12 startRecording];
      }

      goto LABEL_21;
    }
  }
  v49 = _ARLogTechnique_2();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
  {
    v50 = (objc_class *)objc_opt_class();
    v51 = NSStringFromClass(v50);
    *(_DWORD *)buf = 138543874;
    v60 = v51;
    __int16 v61 = 2048;
    v62 = v12;
    __int16 v63 = 2112;
    v64 = v15;
    _os_log_impl(&dword_1B88A2000, v49, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Recording fileURL is not writable: %@", buf, 0x20u);
  }
  v48 = 0;
LABEL_25:

  return v48;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_pearlFixedPointUnsigned13_3PixelBuffer);
  [(ARRecordingTechniquePublic *)self setState:4];
  timeSensitiveQueue = self->_timeSensitiveQueue;
  if (timeSensitiveQueue) {
    dispatch_activate(timeSensitiveQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)ARRecordingTechniquePublic;
  [(ARRecordingTechniquePublic *)&v4 dealloc];
}

- (void)setParentImageSensorSettings:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_parentImageSensorSettings, a3);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v17 = v5;
  v6 = [v5 settings];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = [v11 videoFormat];
        uint64_t v13 = [v12 captureDevicePosition];

        if (v13 == 2)
        {
          v14 = [v11 metaData];

          unint64_t sensorDataTypes = self->_sensorDataTypes;
          if (v14)
          {
            sensorDataTypes |= 0x10uLL;
            self->_unint64_t sensorDataTypes = sensorDataTypes;
          }
          unint64_t v16 = sensorDataTypes | 0x21;
        }
        else
        {
          unint64_t v16 = self->_sensorDataTypes | 1;
        }
        self->_unint64_t sensorDataTypes = v16;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
}

- (unint64_t)recordingSensorDataTypes
{
  return self->_sensorDataTypes;
}

- (unint64_t)requiredSensorDataTypes
{
  return self->_sensorDataTypes;
}

- (void)startRecording
{
  objc_initWeak(&location, self);
  recordingQueue = self->_recordingQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__ARRecordingTechniquePublic_startRecording__block_invoke;
  v4[3] = &unk_1E61852E8;
  objc_copyWeak(&v5, &location);
  dispatch_async(recordingQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __44__ARRecordingTechniquePublic_startRecording__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startRecording];
}

- (void)recordCustomData:(id)a3 forTimestamp:(double)a4
{
  id v6 = a3;
  if (self->_expectCustomData)
  {
    objc_initWeak(&location, self);
    timeSensitiveQueue = self->_timeSensitiveQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__ARRecordingTechniquePublic_recordCustomData_forTimestamp___block_invoke;
    v8[3] = &unk_1E6186448;
    objc_copyWeak(v10, &location);
    id v9 = v6;
    v10[1] = *(id *)&a4;
    dispatch_async(timeSensitiveQueue, v8);

    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }
}

void __60__ARRecordingTechniquePublic_recordCustomData_forTimestamp___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained processTimeSensitiveNSCoderObject:*(void *)(a1 + 32) withTimestamp:@"mdta/com.apple.arkit.customdata" metadataID:*(double *)(a1 + 48)];
}

- (void)finishRecording
{
  objc_initWeak(&location, self);
  timeSensitiveQueue = self->_timeSensitiveQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__ARRecordingTechniquePublic_finishRecording__block_invoke;
  v4[3] = &unk_1E61852E8;
  objc_copyWeak(&v5, &location);
  dispatch_async(timeSensitiveQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __45__ARRecordingTechniquePublic_finishRecording__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _finishRecording];
}

- (void)abortRecording
{
}

- (BOOL)allowedToWrite
{
  return [(ARRecordingTechniquePublic *)self state] - 1 < 2;
}

- (BOOL)finished
{
  return [(ARRecordingTechniquePublic *)self state] - 3 < 2;
}

- (void)removeTemporaryVideoFile
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([(NSURL *)self->_outputFileURL checkResourceIsReachableAndReturnError:0])
  {
    outputFileURL = self->_outputFileURL;
    id v12 = 0;
    [v3 removeItemAtURL:outputFileURL error:&v12];
    id v5 = v12;
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = _ARLogTechnique_2();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        id v10 = self->_outputFileURL;
        v11 = [v6 localizedDescription];
        *(_DWORD *)buf = 138544130;
        v14 = v9;
        __int16 v15 = 2048;
        unint64_t v16 = self;
        __int16 v17 = 2112;
        long long v18 = v10;
        __int16 v19 = 2112;
        long long v20 = v11;
        _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not remove temporary file at %@: %@", buf, 0x2Au);
      }
    }
  }
}

- (void)_fail:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _ARLogTechnique_2();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = [v4 description];
    int v15 = 138543874;
    unint64_t v16 = v7;
    __int16 v17 = 2048;
    long long v18 = self;
    __int16 v19 = 2112;
    long long v20 = v8;
    _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Recording failed: %@", (uint8_t *)&v15, 0x20u);
  }
  [(ARRecordingTechniquePublic *)self setState:4];
  id v9 = [(ARTechnique *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(ARTechnique *)self delegate];
    [v11 technique:self didFailWithError:v4];
  }
  id v12 = [(ARRecordingTechniquePublic *)self recordingTechniqueDelegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    v14 = [(ARRecordingTechniquePublic *)self recordingTechniqueDelegate];
    [v14 technique:self didFinishWithResult:v4];
  }
  dispatch_activate((dispatch_object_t)self->_timeSensitiveQueue);
}

- (void)_finish:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_finishedError, a3);
  if (v5)
  {
    [(ARRecordingTechniquePublic *)self _fail:v5];
  }
  else
  {
    id v6 = _ARLogTechnique_2();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      int v12 = 138543618;
      char v13 = v8;
      __int16 v14 = 2048;
      int v15 = self;
      _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Recording successful", (uint8_t *)&v12, 0x16u);
    }
    [(ARRecordingTechniquePublic *)self setState:4];
    id v9 = [(ARRecordingTechniquePublic *)self recordingTechniqueDelegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      v11 = [(ARRecordingTechniquePublic *)self recordingTechniqueDelegate];
      [v11 technique:self didFinishWithResult:0];
    }
  }
}

- (id)processData:(id)a3
{
  id v4 = a3;
  if (![(ARRecordingTechniquePublic *)self finished])
  {
    id v5 = v4;
    id v6 = v5;
    if ([v5 conformsToProtocol:&unk_1F125EA28])
    {
      id v6 = (void *)[v5 copy];
    }
    objc_initWeak(&location, self);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      uint64_t v8 = [v7 originalImage];
      id v9 = (void *)[v8 copy];

      recordingQueue = self->_recordingQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__ARRecordingTechniquePublic_processData___block_invoke;
      block[3] = &unk_1E6185200;
      objc_copyWeak(&v33, &location);
      id v32 = v9;
      id v11 = v9;
      dispatch_async(recordingQueue, block);

      objc_destroyWeak(&v33);
LABEL_12:
      id v19 = v5;
      objc_destroyWeak(&location);

      goto LABEL_13;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      timeSensitiveQueue = self->_timeSensitiveQueue;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __42__ARRecordingTechniquePublic_processData___block_invoke_2;
      v28[3] = &unk_1E6185200;
      char v13 = &v30;
      objc_copyWeak(&v30, &location);
      id v29 = v6;
      dispatch_async(timeSensitiveQueue, v28);
      __int16 v14 = v29;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v6;
        __int16 v17 = self->_recordingQueue;
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __42__ARRecordingTechniquePublic_processData___block_invoke_3;
        v25[3] = &unk_1E6185200;
        objc_copyWeak(&v27, &location);
        id v26 = v16;
        id v18 = v16;
        dispatch_async(v17, v25);

        int v15 = &v27;
        goto LABEL_11;
      }
      if (![v6 conformsToProtocol:&unk_1F125E910]) {
        goto LABEL_12;
      }
      uint64_t v21 = self->_recordingQueue;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __42__ARRecordingTechniquePublic_processData___block_invoke_4;
      v22[3] = &unk_1E6185200;
      char v13 = &v24;
      objc_copyWeak(&v24, &location);
      id v23 = v6;
      dispatch_async(v21, v22);
      __int16 v14 = v23;
    }

    int v15 = v13;
LABEL_11:
    objc_destroyWeak(v15);
    goto LABEL_12;
  }
LABEL_13:
  return v4;
}

void __42__ARRecordingTechniquePublic_processData___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained writeImageData:*(void *)(a1 + 32)];
}

void __42__ARRecordingTechniquePublic_processData___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained writeAudioData:*(void *)(a1 + 32)];
}

void __42__ARRecordingTechniquePublic_processData___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained writeTimeOfFlightData:*(void *)(a1 + 32)];
}

void __42__ARRecordingTechniquePublic_processData___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained writeSensorData:*(void *)(a1 + 32)];
}

- (void)recordCollaborationData:(id)a3 localSession:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (ARInternalOSBuild() && self->_recordCollaborationData)
  {
    if ([(ARRecordingTechniquePublic *)self allowedToWrite])
    {
      id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%llX", objc_msgSend(v6, "vioSessionID"));
      unint64_t v8 = [v7 length];
      if (v8 >= 8) {
        uint64_t v9 = 8;
      }
      else {
        uint64_t v9 = v8;
      }
      char v10 = [v7 substringToIndex:v9];
      id v11 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v6, "vioSessionID"));
      char v12 = [(NSMutableSet *)self->_knownVIOSessionIDs containsObject:v11];
      if (v4)
      {
        if ((v12 & 1) == 0)
        {
          [(NSMutableSet *)self->_knownVIOSessionIDs addObject:v11];
          char v13 = (void *)[objc_alloc(MEMORY[0x1E4F4D5D0]) initWithEventType:7 timestamp:CACurrentMediaTime()];
          [v13 setPeerDisplayName:v10];
          [v13 setSessionID:v11];
          [(MOVWriterInterface *)self->_writer processCVAUserEvent:v13];
        }
      }
      else
      {
        if ((v12 & 1) == 0)
        {
          [(NSMutableSet *)self->_knownVIOSessionIDs addObject:v11];
          int v15 = (void *)[objc_alloc(MEMORY[0x1E4F4D5D0]) initWithEventType:5 timestamp:CACurrentMediaTime()];
          [v15 setPeerDisplayName:v10];
          [(MOVWriterInterface *)self->_writer processCVAUserEvent:v15];
          id v16 = (void *)[objc_alloc(MEMORY[0x1E4F4D5D0]) initWithEventType:11 timestamp:CACurrentMediaTime()];
          [v16 setPeerDisplayName:v10];
          [v16 setSessionID:v11];
          [(MOVWriterInterface *)self->_writer processCVAUserEvent:v16];
        }
        id v23 = 0;
        __int16 v17 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v23];
        id v18 = v23;
        if (v18)
        {
          id v19 = _ARLogTechnique_2();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            long long v20 = (objc_class *)objc_opt_class();
            uint64_t v21 = NSStringFromClass(v20);
            *(_DWORD *)buf = 138543874;
            v25 = v21;
            __int16 v26 = 2048;
            id v27 = self;
            __int16 v28 = 2112;
            id v29 = v18;
            _os_log_impl(&dword_1B88A2000, v19, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error encoding collaboration data during recording: %@", buf, 0x20u);
          }
        }
        else
        {
          id v19 = objc_opt_new();
          v22 = [v6 vioData];
          [v19 setData:v22];

          [v19 setAdditionalData:v17];
          [v19 setTimestamp:CACurrentMediaTime()];
          [v19 setIsSent:0];
          -[NSObject setType:](v19, "setType:", [v6 vioDataType]);
          [v19 setSourcePeerDisplayName:v10];
          [(MOVWriterInterface *)self->_writer processCMData:v19];
        }
      }
    }
    else
    {
      id v7 = _ARLogTechnique_2();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
LABEL_21:

        goto LABEL_22;
      }
      __int16 v14 = (objc_class *)objc_opt_class();
      char v10 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138543618;
      v25 = v10;
      __int16 v26 = 2048;
      id v27 = self;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Dropping collaboration data which arrives while recording isn't running.", buf, 0x16u);
    }

    goto LABEL_21;
  }
LABEL_22:
}

- (void)recordAddedAnchor:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (ARInternalOSBuild())
  {
    if ([(ARRecordingTechniquePublic *)self allowedToWrite])
    {
      id v12 = 0;
      id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v12];
      id v6 = v12;
      if (v6)
      {
        id v7 = _ARLogTechnique_2();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          unint64_t v8 = (objc_class *)objc_opt_class();
          uint64_t v9 = NSStringFromClass(v8);
          *(_DWORD *)buf = 138543874;
          __int16 v14 = v9;
          __int16 v15 = 2048;
          id v16 = self;
          __int16 v17 = 2112;
          id v18 = v6;
          _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error encoding anchor data during recording: %@", buf, 0x20u);
        }
      }
      else
      {
        id v7 = objc_opt_new();
        [v7 setAnchorData:v5];
        [v7 setEventType:4];
        id v11 = [v4 identifier];
        [v7 setUuid:v11];

        [v7 setTimestamp:CACurrentMediaTime()];
        [(MOVWriterInterface *)self->_writer processCVAUserEvent:v7];
      }
    }
    else
    {
      id v6 = _ARLogTechnique_2();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
LABEL_11:

        goto LABEL_12;
      }
      char v10 = (objc_class *)objc_opt_class();
      id v5 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138543618;
      __int16 v14 = v5;
      __int16 v15 = 2048;
      id v16 = self;
      _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Dropping added anchor data which arrives while recording isn't running.", buf, 0x16u);
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (void)recordRemovedAnchor:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (ARInternalOSBuild())
  {
    if ([(ARRecordingTechniquePublic *)self allowedToWrite])
    {
      id v12 = 0;
      id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v12];
      id v6 = v12;
      if (v6)
      {
        id v7 = _ARLogTechnique_2();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          unint64_t v8 = (objc_class *)objc_opt_class();
          uint64_t v9 = NSStringFromClass(v8);
          *(_DWORD *)buf = 138543874;
          __int16 v14 = v9;
          __int16 v15 = 2048;
          id v16 = self;
          __int16 v17 = 2112;
          id v18 = v6;
          _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error encoding anchor data during recording: %@", buf, 0x20u);
        }
      }
      else
      {
        id v7 = objc_opt_new();
        [v7 setAnchorData:v5];
        [v7 setEventType:13];
        id v11 = [v4 identifier];
        [v7 setUuid:v11];

        [v7 setTimestamp:CACurrentMediaTime()];
        [(MOVWriterInterface *)self->_writer processCVAUserEvent:v7];
      }
    }
    else
    {
      id v6 = _ARLogTechnique_2();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
LABEL_11:

        goto LABEL_12;
      }
      char v10 = (objc_class *)objc_opt_class();
      id v5 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138543618;
      __int16 v14 = v5;
      __int16 v15 = 2048;
      id v16 = self;
      _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Dropping removed anchor data which arrives while recording isn't running.", buf, 0x16u);
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (void)_startRecording
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if ([(ARRecordingTechniquePublic *)self state])
  {
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = @"Attempted to start recording more than once";
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v4 = ARErrorWithCodeAndUserInfo(1001, v3);
    [(ARRecordingTechniquePublic *)self _fail:v4];
  }
  else
  {
    id v5 = _ARLogTechnique_2();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v14 = 138543618;
      __int16 v15 = v7;
      __int16 v16 = 2048;
      __int16 v17 = self;
      _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Starting recording", (uint8_t *)&v14, 0x16u);
    }
    [(ARRecordingTechniquePublic *)self removeTemporaryVideoFile];
    id v8 = objc_alloc(MEMORY[0x1E4F4D5E0]);
    outputFileURL = self->_outputFileURL;
    char v10 = [(ARRecordingTechniquePublic *)self createFileMetadata];
    id v11 = (MOVWriterInterface *)[v8 initWithFileURL:outputFileURL expectedFrameRate:v10 fileSummary:self->_recordingQueue callbackQueue:60.0];
    writer = self->_writer;
    self->_writer = v11;

    [(MOVWriterInterface *)self->_writer setInterface_delegate:self];
    char v13 = [MEMORY[0x1E4F4D5E0] makeDeviceString];
    [(MOVWriterInterface *)self->_writer setDeviceString:v13];

    [(ARRecordingTechniquePublic *)self setupSensorTracks];
    [(ARRecordingTechniquePublic *)self setupCustomTrack];
    [(ARRecordingTechniquePublic *)self setState:1];
  }
}

- (void)setupSensorTracks
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v3 = +[ARBKSAccelerometer sharedWeakAccelerometerHandle];
  uint64_t v4 = [v3 currentOrientation];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v49 = 0u;
  ARVideoTransformForDeviceOrientation(v4, (uint64_t)&v49);
  writer = self->_writer;
  *(_OWORD *)asbd = v49;
  *(_OWORD *)&asbd[16] = v50;
  *(_OWORD *)&asbd[32] = v51;
  [(MOVWriterInterface *)writer setVideoTransform:asbd];
  parentImageSensorSettings = self->_parentImageSensorSettings;
  if (parentImageSensorSettings)
  {
    v41 = self;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v7 = [(ARParentImageSensorSettings *)parentImageSensorSettings settings];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      char v10 = 0;
      uint64_t v11 = *(void *)v46;
      uint64_t v12 = *MEMORY[0x1E4F15810];
      uint64_t v42 = -1;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v46 != v11) {
            objc_enumerationMutation(v7);
          }
          int v14 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          __int16 v15 = [v14 videoFormat];
          __int16 v16 = v15;
          if (v15)
          {
            __int16 v17 = [v15 deviceFormat];
            int v18 = [v17 isVisionDataDeliverySupported];

            if (v18) {
              char v10 = 1;
            }
            uint64_t v19 = [v16 captureDeviceType];
            int v20 = [v19 isEqualToString:v12];

            if (v20)
            {
              uint64_t v42 = [v16 framesPerSecond];
            }
            else if ([v14 isEnabled])
            {
              uint64_t v21 = [v16 captureDeviceType];
              v22 = ARStreamIdentifierForDeviceTypeAndPosition(v21, [v16 captureDevicePosition]);

              [(MOVWriterInterface *)v41->_writer registerStreamID:v22 withConfigObject:0];
              [(MOVWriterInterface *)v41->_writer registerMetadataID:v22];
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v9);
    }
    else
    {
      char v10 = 0;
      uint64_t v42 = -1;
    }

    int v23 = v10 & 1;
    self = v41;
    uint64_t v24 = v42;
  }
  else
  {
    [(MOVWriterInterface *)self->_writer registerStreamID:@"mdta/com.apple.arkit.stream.arimagedata" withConfigObject:0];
    [(MOVWriterInterface *)self->_writer registerMetadataID:@"mdta/com.apple.arkit.arimagedata"];
    int v23 = 0;
    uint64_t v24 = -1;
  }
  if (self->_recordPearlDepthData && (self->_sensorDataTypes & 0x20) != 0) {
    [(MOVWriterInterface *)self->_writer registerCVADepthIR];
  }
  if ([(ARRecordingTechniquePublic *)self expectAudioData])
  {
    if ([MEMORY[0x1E4F16440] authorizationStatusForMediaType:*MEMORY[0x1E4F15BA8]] == 3)
    {
      *(void *)asbd = 0x40E5888000000000;
      *(_OWORD *)&asbd[24] = xmmword_1B8A2EA60;
      *(_OWORD *)&asbd[8] = xmmword_1B8A2EA70;
      CMAudioFormatDescriptionRef formatDescriptionOut = 0;
      CMAudioFormatDescriptionCreate(0, (const AudioStreamBasicDescription *)asbd, 0, 0, 0, 0, 0, &formatDescriptionOut);
      v25 = self->_writer;
      CMAudioFormatDescriptionRef v26 = formatDescriptionOut;
      id v27 = [MEMORY[0x1E4F73A00] audioNoneEncoderConfig];
      [(MOVWriterInterface *)v25 addTrackForStreamWithIdentifier:@"mdta/com.apple.arkit.stream.araudio" formatDescription:v26 recordingConfiguration:v27];

      CFRelease(formatDescriptionOut);
    }
    else
    {
      __int16 v28 = _ARLogTechnique_2();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        id v29 = (objc_class *)objc_opt_class();
        uint64_t v30 = NSStringFromClass(v29);
        *(_DWORD *)asbd = 138543618;
        *(void *)&asbd[4] = v30;
        *(_WORD *)&asbd[12] = 2048;
        *(void *)&asbd[14] = self;
        _os_log_impl(&dword_1B88A2000, v28, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not add audio track since user has not granted microphone access to the app.", asbd, 0x16u);
      }
    }
  }
  [(MOVWriterInterface *)self->_writer registerAccelerometer];
  [(MOVWriterInterface *)self->_writer registerGyro];
  if ((self->_sensorDataTypes & 0x400) != 0) {
    [(MOVWriterInterface *)self->_writer registerCompass];
  }
  [(MOVWriterInterface *)self->_writer registerDeviceMotion];
  if ((self->_sensorDataTypes & 0x40) != 0) {
    [(MOVWriterInterface *)self->_writer registerLocation];
  }
  [(MOVWriterInterface *)self->_writer registerCVACameraCalibrationData];
  if (+[ARWorldTrackingConfiguration backdropCameraOverride])
  {
    int v31 = v23;
  }
  else
  {
    int v31 = 1;
  }
  if (v31 == 1) {
    [(MOVWriterInterface *)self->_writer registerCVAFeatureBuffer];
  }
  if (ARDeviceSupportsJasper())
  {
    [(MOVWriterInterface *)self->_writer setDepthTOFTrackName:*MEMORY[0x1E4F4D640]];
    [(MOVWriterInterface *)self->_writer registerCVADepthTOF];
    if (v24 < 1)
    {
      BOOL v36 = _ARLogTechnique_2();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v40 = (objc_class *)objc_opt_class();
        unint64_t v37 = NSStringFromClass(v40);
        *(_DWORD *)asbd = 138543618;
        *(void *)&asbd[4] = v37;
        *(_WORD *)&asbd[12] = 2048;
        *(void *)&asbd[14] = self;
        _os_log_impl(&dword_1B88A2000, v36, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to get jasper FPS metadata", asbd, 0x16u);
LABEL_45:
      }
    }
    else
    {
      id v32 = self->_writer;
      uint64_t v52 = *MEMORY[0x1E4F4D638];
      id v33 = [NSNumber numberWithInteger:v24];
      v53 = v33;
      v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      uint64_t v35 = *MEMORY[0x1E4F4D610];
      id v43 = 0;
      LOBYTE(v32) = [(MOVWriterInterface *)v32 setTrackMetadata:v34 forMetadataStream:v35 error:&v43];
      BOOL v36 = v43;

      if ((v32 & 1) == 0)
      {
        unint64_t v37 = _ARLogTechnique_2();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          char v38 = (objc_class *)objc_opt_class();
          uint64_t v39 = NSStringFromClass(v38);
          *(_DWORD *)asbd = 138543874;
          *(void *)&asbd[4] = v39;
          *(_WORD *)&asbd[12] = 2048;
          *(void *)&asbd[14] = self;
          *(_WORD *)&asbd[22] = 2112;
          *(void *)&asbd[24] = v36;
          _os_log_impl(&dword_1B88A2000, v37, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to set jasper FPS metadata: %@", asbd, 0x20u);
        }
        goto LABEL_45;
      }
    }
  }
  if (ARInternalOSBuild())
  {
    [(MOVWriterInterface *)self->_writer registerCVAUserEvent];
    if (self->_recordCollaborationData) {
      [(MOVWriterInterface *)self->_writer registerCMData];
    }
  }
}

- (void)setupCustomTrack
{
  if (self->_expectCustomData) {
    [(MOVWriterInterface *)self->_writer registerMetadataID:@"mdta/com.apple.arkit.customdata"];
  }
}

- (id)createFileMetadata
{
  v3 = objc_opt_new();
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:self->_sensorDataTypes];
  [v3 setObject:v4 forKeyedSubscript:@"mdta/com.apple.arkit.arsensordatatypeinformation"];

  id v5 = AROSVersionString();
  [v3 setObject:v5 forKeyedSubscript:@"mdta/com.apple.arkit.osversion"];

  id v6 = ARVersionStringForIdentifier(@"com.apple.ARKit");
  [v3 setObject:v6 forKeyedSubscript:@"mdta/com.apple.arkit.arkitversion"];

  [v3 setObject:self->_customUserData forKeyedSubscript:@"mdta/com.apple.arkit.customuserdata"];
  return v3;
}

- (void)writeTimeOfFlightData:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(ARRecordingTechniquePublic *)self finished])
  {
    if ([(ARRecordingTechniquePublic *)self allowedToWrite])
    {
      id v6 = v5;
      id v7 = objc_alloc(MEMORY[0x1E4F4D5B8]);
      uint64_t v8 = [v6 pointCloudData];
      [v6 timestamp];
      uint64_t v9 = objc_msgSend(v7, "initWithAVPointCloudData:timestamp:", v8);

      if (v9)
      {
        [(MOVWriterInterface *)self->_writer processCVADepthTOF:v9];
      }
      else
      {
        __int16 v15 = _ARLogTechnique_2();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          __int16 v16 = (objc_class *)objc_opt_class();
          __int16 v17 = NSStringFromClass(v16);
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v17;
          __int16 v19 = 2048;
          int v20 = self;
          _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to make CVADepthTOF for pointCloudData", buf, 0x16u);
        }
      }
    }
    else
    {
      Class = object_getClass(v5);
      uint64_t v11 = NSStringFromClass(Class);
      [v5 timestamp];
      *(void *)buf = 0;
      id v6 = v11;
      objc_msgSend(v6, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(v6, "length"), 0);

      *(void *)buf = 0;
      [@"NotStart" getBytes:buf, 8, 0, 1, 0, 0, objc_msgSend(@"NotStart", "length"), 0 maxLength usedLength encoding options range remainingRange];
      kdebug_trace();
      uint64_t v9 = _ARLogTechnique_2();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = (objc_class *)objc_opt_class();
        char v13 = NSStringFromClass(v12);
        int v14 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v13;
        __int16 v19 = 2048;
        int v20 = self;
        __int16 v21 = 2112;
        v22 = v14;
        __int16 v23 = 2112;
        id v24 = v6;
        _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Tried to call %@ with %@ before session has started", buf, 0x2Au);
      }
    }
  }
}

- (void)writeSensorData:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(ARRecordingTechniquePublic *)self finished])
  {
    if ([(ARRecordingTechniquePublic *)self allowedToWrite])
    {
      uint64_t v6 = objc_opt_class();
      id v7 = ARMetadataIdentifierForARSensorDataClass(v6, 1);
      if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        [v5 appendToWriter:self->_writer];
LABEL_12:

        goto LABEL_13;
      }
      Class = object_getClass(v5);
      __int16 v15 = NSStringFromClass(Class);
      [v5 timestamp];
      *(void *)buf = 0;
      char v10 = v15;
      -[NSObject getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v10, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, [v10 length], 0);

      *(void *)buf = 0;
      [@"BadClass" getBytes:buf, 8, 0, 1, 0, 0, objc_msgSend(@"BadClass", "length"), 0 maxLength usedLength encoding options range remainingRange];
      kdebug_trace();
      uint64_t v12 = _ARLogTechnique_2();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        __int16 v16 = (objc_class *)objc_opt_class();
        __int16 v17 = NSStringFromClass(v16);
        int v18 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v17;
        __int16 v20 = 2048;
        __int16 v21 = self;
        __int16 v22 = 2112;
        __int16 v23 = v18;
        __int16 v24 = 2112;
        uint64_t v25 = v10;
        _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Tried to call %@ with %@ which we don't have support for", buf, 0x2Au);
      }
    }
    else
    {
      uint64_t v8 = object_getClass(v5);
      uint64_t v9 = NSStringFromClass(v8);
      [v5 timestamp];
      *(void *)buf = 0;
      id v7 = v9;
      -[NSObject getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v7, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, [v7 length], 0);

      *(void *)buf = 0;
      [@"NotStart" getBytes:buf, 8, 0, 1, 0, 0, objc_msgSend(@"NotStart", "length"), 0 maxLength usedLength encoding options range remainingRange];
      kdebug_trace();
      char v10 = _ARLogTechnique_2();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

        goto LABEL_12;
      }
      uint64_t v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      char v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v12;
      __int16 v20 = 2048;
      __int16 v21 = self;
      __int16 v22 = 2112;
      __int16 v23 = v13;
      __int16 v24 = 2112;
      uint64_t v25 = v7;
      _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Tried to call %@ with %@ before session has started", buf, 0x2Au);
    }
    goto LABEL_11;
  }
LABEL_13:
}

- (void)writeImageData:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(ARRecordingTechniquePublic *)self finished])
  {
    BOOL v6 = [(ARRecordingTechniquePublic *)self allowedToWrite];
    [v5 timestamp];
    if (v6)
    {
      kdebug_trace();
      if ([(ARRecordingTechniquePublic *)self state] == 1 && self->_writerReady)
      {
        [v5 timestamp];
        self->_sessionSourceTime = v7;
        [(ARRecordingTechniquePublic *)self setState:2];
        dispatch_activate((dispatch_object_t)self->_timeSensitiveQueue);
        uint64_t v8 = _ARLogTechnique_2();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = (objc_class *)objc_opt_class();
          char v10 = NSStringFromClass(v9);
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v10;
          *(_WORD *)&unsigned char buf[12] = 2048;
          *(void *)&buf[14] = self;
          _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Writer is now running", buf, 0x16u);
        }
      }
      uint64_t v11 = [v5 cameraType];
      uint64_t v12 = ARStreamIdentifierForDeviceTypeAndPosition(v11, [v5 cameraPosition]);

      char v13 = v12;
      int v14 = v13;
      if (self->_parentImageSensorSettings)
      {
        __int16 v15 = (__CFString *)v13;
      }
      else
      {
        __int16 v21 = @"mdta/com.apple.arkit.stream.arimagedata";

        __int16 v15 = @"mdta/com.apple.arkit.arimagedata";
        int v14 = v21;
      }
      [(MOVWriterInterface *)self->_writer processNSCoderObject:v5 metadataID:v15];
      if ([v5 visionData])
      {
        id v22 = objc_alloc(MEMORY[0x1E4F4D5C0]);
        uint64_t v23 = [v5 visionData];
        [v5 timestamp];
        __int16 v24 = objc_msgSend(v22, "initWithPixelBufferRef:timestamp:streamID:", v23, v14);
        [(MOVWriterInterface *)self->_writer processCVAFeatureBuffer:v24];
      }
      long long v45 = 0uLL;
      uint64_t v46 = 0;
      uint64_t v25 = (void *)MEMORY[0x1E4F4D5E0];
      [v5 timestamp];
      objc_msgSend(v25, "cmTimeFromTimestamp:");
      long long v48 = 0u;
      memset(buf, 0, sizeof(buf));
      [v5 cameraIntrinsics];
      *(_DWORD *)&buf[8] = v26;
      *(_DWORD *)&buf[24] = v27;
      *(void *)buf = v28;
      *(void *)&buf[16] = v29;
      DWORD2(v48) = v30;
      *(void *)&long long v48 = v31;
      writer = self->_writer;
      uint64_t v33 = [v5 pixelBuffer];
      [v5 exposureDuration];
      long long v43 = v45;
      uint64_t v44 = v46;
      -[MOVWriterInterface processPixelBuffer:withTimeStamp:intrinsics:exposureTime:streamID:](writer, "processPixelBuffer:withTimeStamp:intrinsics:exposureTime:streamID:", v33, &v43, buf, v14);
      if (self->_recordPearlDepthData)
      {
        v34 = [v5 depthData];

        if (v34)
        {
          uint64_t v35 = [v5 depthData];
          [v5 depthDataTimestamp];
          double v37 = v36;
          char v38 = [v5 captureDevice];
          [(ARRecordingTechniquePublic *)self writePearlDepthData:v35 withTimestamp:v38 fromCaptureDevice:v37];
        }
      }
      uint64_t v39 = [v5 calibrationData];

      if (v39)
      {
        id v40 = objc_alloc(MEMORY[0x1E4F4D5A8]);
        v41 = [v5 calibrationData];
        [v5 timestamp];
        uint64_t v42 = objc_msgSend(v40, "initWithAVCameraCalibrationData:timestamp:streamID:", v41, v14);

        [(MOVWriterInterface *)self->_writer processCVACameraCalibrationData:v42];
      }
      [v5 timestamp];
      kdebug_trace();
    }
    else
    {
      *(void *)buf = 0;
      [@"ARImageData" getBytes:buf, 8, 0, 1, 0, 0, objc_msgSend(@"ARImageData", "length"), 0 maxLength usedLength encoding options range remainingRange];
      *(void *)buf = 0;
      [@"NotStart" getBytes:buf, 8, 0, 1, 0, 0, objc_msgSend(@"NotStart", "length"), 0 maxLength usedLength encoding options range remainingRange];
      kdebug_trace();
      int v14 = _ARLogTechnique_2();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __int16 v16 = (objc_class *)objc_opt_class();
        __int16 v17 = NSStringFromClass(v16);
        int v18 = NSStringFromSelector(a2);
        Class = object_getClass(v5);
        __int16 v20 = NSStringFromClass(Class);
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v18;
        LOWORD(v48) = 2112;
        *(void *)((char *)&v48 + 2) = v20;
        _os_log_impl(&dword_1B88A2000, v14, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Tried to call %@ with %@ before session has started", buf, 0x2Au);
      }
    }
  }
}

- (void)writePearlDepthData:(id)a3 withTimestamp:(double)a4 fromCaptureDevice:(id)a5
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  id v8 = v7;
  uint64_t v9 = (__CVBuffer *)[v8 depthDataMap];
  if (!v9)
  {
    __int16 v16 = _ARLogTechnique_2();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    __int16 v21 = (objc_class *)objc_opt_class();
    __int16 v17 = NSStringFromClass(v21);
    int v33 = 138543618;
    v34 = v17;
    __int16 v35 = 2048;
    double v36 = self;
    id v22 = "%{public}@ <%p>: Depth data has NULL depthDataMap, not writing Pearl frame";
    uint64_t v23 = v16;
    os_log_type_t v24 = OS_LOG_TYPE_INFO;
    uint32_t v25 = 22;
LABEL_13:
    _os_log_impl(&dword_1B88A2000, v23, v24, v22, (uint8_t *)&v33, v25);
    goto LABEL_17;
  }
  char v10 = v9;
  p_pearlFixedPointUnsigned13_3PixelBuffer = &self->_pearlFixedPointUnsigned13_3PixelBuffer;
  pearlFixedPointUnsigned13_3PixelBuffer = self->_pearlFixedPointUnsigned13_3PixelBuffer;
  if (pearlFixedPointUnsigned13_3PixelBuffer) {
    goto LABEL_3;
  }
  CFAllocatorRef v26 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  size_t Width = CVPixelBufferGetWidth(v9);
  size_t Height = CVPixelBufferGetHeight(v10);
  uint64_t v39 = *MEMORY[0x1E4F24D20];
  v40[0] = MEMORY[0x1E4F1CC08];
  CVReturn v29 = CVPixelBufferCreate(v26, Width, Height, 0x31332E33u, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1], &self->_pearlFixedPointUnsigned13_3PixelBuffer);
  if (v29)
  {
    CVReturn v30 = v29;
    __int16 v16 = _ARLogTechnique_2();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    uint64_t v31 = (objc_class *)objc_opt_class();
    __int16 v17 = NSStringFromClass(v31);
    int v33 = 138543874;
    v34 = v17;
    __int16 v35 = 2048;
    double v36 = self;
    __int16 v37 = 1024;
    CVReturn v38 = v30;
    id v22 = "%{public}@ <%p>: Failed to create 13_3 pixel buffer for transcoding Pearl data, CVReturn=%d";
    uint64_t v23 = v16;
    os_log_type_t v24 = OS_LOG_TYPE_ERROR;
    uint32_t v25 = 28;
    goto LABEL_13;
  }
  pearlFixedPointUnsigned13_3PixelBuffer = *p_pearlFixedPointUnsigned13_3PixelBuffer;
LABEL_3:
  if (ARConvertDepthFloatingPointBufferToFixedPointUnsigned13_3Buffer(v10, pearlFixedPointUnsigned13_3PixelBuffer))
  {
    char v13 = *p_pearlFixedPointUnsigned13_3PixelBuffer;
    CFStringRef v14 = (const __CFString *)*MEMORY[0x1E4F52818];
    id v15 = ARDepthRepresentationDictionary(v8);
    CVBufferSetAttachment(v13, v14, v15, kCVAttachmentMode_ShouldPropagate);
    __int16 v16 = [objc_alloc(MEMORY[0x1E4F4D5B0]) initWithPixelBufferRef:*p_pearlFixedPointUnsigned13_3PixelBuffer timestamp:a4];
    if (!v16)
    {
      __int16 v17 = _ARLogTechnique_2();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v32 = (objc_class *)objc_opt_class();
        __int16 v19 = NSStringFromClass(v32);
        int v33 = 138543618;
        v34 = v19;
        __int16 v35 = 2048;
        double v36 = self;
        __int16 v20 = "%{public}@ <%p>: Failed to create CVADepthIR wrapper for writing depth data";
        goto LABEL_16;
      }
LABEL_17:

      goto LABEL_18;
    }
    if (([(MOVWriterInterface *)self->_writer processCVADepthIR:v16] & 1) == 0)
    {
      __int16 v17 = _ARLogTechnique_2();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v18 = (objc_class *)objc_opt_class();
        __int16 v19 = NSStringFromClass(v18);
        int v33 = 138543618;
        v34 = v19;
        __int16 v35 = 2048;
        double v36 = self;
        __int16 v20 = "%{public}@ <%p>: Failed to write a CVADepthIR instance";
LABEL_16:
        _os_log_impl(&dword_1B88A2000, v17, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v33, 0x16u);

        goto LABEL_17;
      }
      goto LABEL_17;
    }
LABEL_18:
  }
}

- (void)writeAudioData:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_timeSensitiveQueue);
  [v5 timestamp];
  double v7 = v6;
  if (![(ARRecordingTechniquePublic *)self finished])
  {
    if ([(ARRecordingTechniquePublic *)self state] != 2)
    {
      *(void *)buf = 0;
      [@"ARAudioData" getBytes:buf, 8, 0, 1, 0, 0, objc_msgSend(@"ARAudioData", "length"), 0 maxLength usedLength encoding options range remainingRange];
      *(void *)buf = 0;
      [@"NotRunning" getBytes:buf, 8, 0, 1, 0, 0, objc_msgSend(@"NotRunning", "length"), 0 maxLength usedLength encoding options range remainingRange];
      kdebug_trace();
      id v8 = _ARLogTechnique_2();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_10:

        goto LABEL_14;
      }
      __int16 v19 = (objc_class *)objc_opt_class();
      char v10 = NSStringFromClass(v19);
      uint64_t v11 = NSStringFromSelector(a2);
      Class = object_getClass(v5);
      char v13 = NSStringFromClass(Class);
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v10;
      __int16 v23 = 2048;
      os_log_type_t v24 = self;
      __int16 v25 = 2112;
      CFAllocatorRef v26 = v11;
      __int16 v27 = 2112;
      uint64_t v28 = v13;
      id v15 = "%{public}@ <%p>: Tried to call %@ with %@ before session has started";
      __int16 v16 = v8;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
      uint32_t v18 = 42;
LABEL_9:
      _os_log_impl(&dword_1B88A2000, v16, v17, v15, buf, v18);

      goto LABEL_10;
    }
    if (self->_expectAudioData)
    {
      if (v7 >= self->_sessionSourceTime)
      {
        -[MOVWriterInterface appendAudioBuffer:forStream:](self->_writer, "appendAudioBuffer:forStream:", [v5 sampleBuffer], @"mdta/com.apple.arkit.stream.araudio");
        goto LABEL_14;
      }
      *(void *)buf = 0;
      [@"ARAudioData" getBytes:buf, 8, 0, 1, 0, 0, objc_msgSend(@"ARAudioData", "length"), 0 maxLength usedLength encoding options range remainingRange];
      *(void *)buf = 0;
      [@"OldData" getBytes:buf, 8, 0, 1, 0, 0, objc_msgSend(@"OldData", "length"), 0 maxLength usedLength encoding options range remainingRange];
      kdebug_trace();
      id v8 = _ARLogTechnique_2();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_10;
      }
      uint64_t v9 = (objc_class *)objc_opt_class();
      char v10 = NSStringFromClass(v9);
      uint64_t v11 = NSStringFromSelector(a2);
      uint64_t v12 = object_getClass(v5);
      char v13 = NSStringFromClass(v12);
      double sessionSourceTime = self->_sessionSourceTime;
      *(_DWORD *)buf = 138544642;
      *(void *)&uint8_t buf[4] = v10;
      __int16 v23 = 2048;
      os_log_type_t v24 = self;
      __int16 v25 = 2112;
      CFAllocatorRef v26 = v11;
      __int16 v27 = 2112;
      uint64_t v28 = v13;
      __int16 v29 = 2048;
      double v30 = v7;
      __int16 v31 = 2048;
      double v32 = sessionSourceTime;
      id v15 = "%{public}@ <%p>: %@ for %@ metadata with timestamp %f < _sessionSourceTime %f, dropping";
      __int16 v16 = v8;
      os_log_type_t v17 = OS_LOG_TYPE_DEBUG;
      uint32_t v18 = 62;
      goto LABEL_9;
    }
    *(void *)buf = 0;
    [@"ARAudioData" getBytes:buf, 8, 0, 1, 0, 0, objc_msgSend(@"ARAudioData", "length"), 0 maxLength usedLength encoding options range remainingRange];
    *(void *)buf = 0;
    [@"AudioOff" getBytes:buf, 8, 0, 1, 0, 0, objc_msgSend(@"AudioOff", "length"), 0 maxLength usedLength encoding options range remainingRange];
    kdebug_trace();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__ARRecordingTechniquePublic_writeAudioData___block_invoke;
    block[3] = &unk_1E61851B0;
    void block[4] = self;
    if (writeAudioData__onceToken != -1) {
      dispatch_once(&writeAudioData__onceToken, block);
    }
  }
LABEL_14:
}

void __45__ARRecordingTechniquePublic_writeAudioData___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _ARLogTechnique_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = (objc_class *)objc_opt_class();
    uint64_t v4 = NSStringFromClass(v3);
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    double v7 = v4;
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1B88A2000, v2, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: You turned on audio data but we're not recording it because it wasn't turned on when you started recording.", (uint8_t *)&v6, 0x16u);
  }
}

- (void)writeResultData:(id)a3 withTimestamp:(double)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        uint64_t v12 = (objc_class *)objc_opt_class();
        char v13 = ARMetadataIdentifierForARRecordableResultsClass(v12);
        [(ARRecordingTechniquePublic *)self processTimeSensitiveNSCoderObject:v11 withTimestamp:v13 metadataID:a4];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)processTimeSensitiveNSCoderObject:(id)a3 withTimestamp:(double)a4 metadataID:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_timeSensitiveQueue);
  if (![(ARRecordingTechniquePublic *)self finished])
  {
    if ([(ARRecordingTechniquePublic *)self state] == 2)
    {
      if (self->_sessionSourceTime <= a4)
      {
        __int16 v27 = [(NSMutableDictionary *)self->_lastRecordedTimestamps objectForKeyedSubscript:v10];
        [v27 doubleValue];
        double v29 = v28;

        if (v29 + 2.22044605e-16 >= a4)
        {
          Class = object_getClass(v9);
          uint64_t v12 = NSStringFromClass(Class);
          *(void *)buf = 0;
          objc_msgSend(v12, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(v12, "length"), 0);
          *(void *)buf = 0;
          [@"TimeDupe" getBytes:buf, 8, 0, 1, 0, 0, objc_msgSend(@"TimeDupe", "length"), 0 maxLength usedLength encoding options range remainingRange];
          kdebug_trace();
          char v13 = _ARLogTechnique_2();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            uint64_t v33 = (objc_class *)objc_opt_class();
            long long v15 = NSStringFromClass(v33);
            long long v16 = NSStringFromSelector(a2);
            v34 = object_getClass(v9);
            uint32_t v18 = NSStringFromClass(v34);
            *(_DWORD *)buf = 138544642;
            *(void *)&uint8_t buf[4] = v15;
            *(_WORD *)&unsigned char buf[12] = 2048;
            *(void *)&buf[14] = self;
            *(_WORD *)&buf[22] = 2112;
            long long v45 = v16;
            __int16 v46 = 2112;
            long long v47 = v18;
            __int16 v48 = 2048;
            double v49 = a4;
            __int16 v50 = 2048;
            double v51 = v29;
            __int16 v20 = "%{public}@ <%p>: %@ for %@ metadata with timestamp %f <= lastTimestamp %f, dropping";
            __int16 v21 = v13;
            os_log_type_t v22 = OS_LOG_TYPE_INFO;
            goto LABEL_13;
          }
        }
        else
        {
          uint64_t v12 = objc_opt_new();
          char v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:0];
          if (!v13)
          {
            __int16 v35 = object_getClass(0);
            long long v15 = NSStringFromClass(v35);
            *(void *)buf = 0;
            objc_msgSend(v15, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(v15, "length"), 0);
            *(void *)buf = 0;
            [@"Archive" getBytes:buf, 8, 0, 1, 0, 0, objc_msgSend(@"Archive", "length"), 0 maxLength usedLength encoding options range remainingRange];
            kdebug_trace();
            double v36 = _ARLogTechnique_2();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              __int16 v37 = (objc_class *)objc_opt_class();
              CVReturn v38 = NSStringFromClass(v37);
              uint64_t v39 = NSStringFromSelector(a2);
              id v40 = object_getClass(0);
              v41 = NSStringFromClass(v40);
              *(_DWORD *)buf = 138544130;
              *(void *)&uint8_t buf[4] = v38;
              *(_WORD *)&unsigned char buf[12] = 2048;
              *(void *)&buf[14] = self;
              *(_WORD *)&buf[22] = 2112;
              long long v45 = v39;
              __int16 v46 = 2112;
              long long v47 = v41;
              _os_log_impl(&dword_1B88A2000, v36, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to archive data: %@ with %@", buf, 0x2Au);
            }
            goto LABEL_15;
          }
          [v12 addObject:v13];
          memset(buf, 0, sizeof(buf));
          [MEMORY[0x1E4F4D5E0] cmTimeFromTimestamp:a4];
          double v30 = [NSNumber numberWithDouble:a4];
          [(NSMutableDictionary *)self->_lastRecordedTimestamps setObject:v30 forKeyedSubscript:v10];

          writer = self->_writer;
          long long v42 = *(_OWORD *)buf;
          uint64_t v43 = *(void *)&buf[16];
          [(MOVWriterInterface *)writer appendMetadata:v12 withTimeStamp:&v42 toStream:v10];
        }
      }
      else
      {
        uint64_t v11 = object_getClass(v9);
        uint64_t v12 = NSStringFromClass(v11);
        *(void *)buf = 0;
        objc_msgSend(v12, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(v12, "length"), 0);
        *(void *)buf = 0;
        [@"OldData" getBytes:buf, 8, 0, 1, 0, 0, objc_msgSend(@"OldData", "length"), 0 maxLength usedLength encoding options range remainingRange];
        kdebug_trace();
        char v13 = _ARLogTechnique_2();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          long long v14 = (objc_class *)objc_opt_class();
          long long v15 = NSStringFromClass(v14);
          long long v16 = NSStringFromSelector(a2);
          long long v17 = object_getClass(v9);
          uint32_t v18 = NSStringFromClass(v17);
          double sessionSourceTime = self->_sessionSourceTime;
          *(_DWORD *)buf = 138544642;
          *(void *)&uint8_t buf[4] = v15;
          *(_WORD *)&unsigned char buf[12] = 2048;
          *(void *)&buf[14] = self;
          *(_WORD *)&buf[22] = 2112;
          long long v45 = v16;
          __int16 v46 = 2112;
          long long v47 = v18;
          __int16 v48 = 2048;
          double v49 = a4;
          __int16 v50 = 2048;
          double v51 = sessionSourceTime;
          __int16 v20 = "%{public}@ <%p>: %@ for %@ metadata with timestamp %f < _sessionSourceTime %f, dropping";
          __int16 v21 = v13;
          os_log_type_t v22 = OS_LOG_TYPE_DEBUG;
LABEL_13:
          uint32_t v26 = 62;
          goto LABEL_14;
        }
      }
    }
    else
    {
      __int16 v23 = object_getClass(v9);
      uint64_t v12 = NSStringFromClass(v23);
      *(void *)buf = 0;
      objc_msgSend(v12, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(v12, "length"), 0);
      *(void *)buf = 0;
      [@"NotRunning" getBytes:buf, 8, 0, 1, 0, 0, objc_msgSend(@"NotRunning", "length"), 0 maxLength usedLength encoding options range remainingRange];
      kdebug_trace();
      char v13 = _ARLogTechnique_2();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        os_log_type_t v24 = (objc_class *)objc_opt_class();
        long long v15 = NSStringFromClass(v24);
        long long v16 = NSStringFromSelector(a2);
        __int16 v25 = object_getClass(v9);
        uint32_t v18 = NSStringFromClass(v25);
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v15;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2112;
        long long v45 = v16;
        __int16 v46 = 2112;
        long long v47 = v18;
        __int16 v20 = "%{public}@ <%p>: Tried to call %@ with %@ before session has started";
        __int16 v21 = v13;
        os_log_type_t v22 = OS_LOG_TYPE_ERROR;
        uint32_t v26 = 42;
LABEL_14:
        _os_log_impl(&dword_1B88A2000, v21, v22, v20, buf, v26);

LABEL_15:
      }
    }
  }
}

- (void)_finishRecording
{
  v24[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_timeSensitiveQueue);
  switch([(ARRecordingTechniquePublic *)self state])
  {
    case 0uLL:
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v24[0] = @"Attempted to finish without starting";
      v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      uint64_t v4 = ARErrorWithCodeAndUserInfo(1001, v3);
      [(ARRecordingTechniquePublic *)self _fail:v4];

      break;
    case 1uLL:
    case 3uLL:
      return;
    case 4uLL:
      char v13 = [(ARRecordingTechniquePublic *)self recordingTechniqueDelegate];
      char v14 = objc_opt_respondsToSelector();

      if (v14)
      {
        id v15 = [(ARRecordingTechniquePublic *)self recordingTechniqueDelegate];
        [v15 technique:self didFinishWithResult:self->_finishedError];
      }
      break;
    default:
      [(ARRecordingTechniquePublic *)self setState:3];
      uint64_t v5 = _ARLogTechnique_2();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = (objc_class *)objc_opt_class();
        uint64_t v7 = NSStringFromClass(v6);
        *(_DWORD *)buf = 138543618;
        __int16 v20 = v7;
        __int16 v21 = 2048;
        os_log_type_t v22 = self;
        _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Finish requested", buf, 0x16u);
      }
      writer = self->_writer;
      id v16 = 0;
      [(MOVWriterInterface *)writer finishWriting:&v16];
      id v9 = v16;
      id v10 = v9;
      if (v9)
      {
        uint64_t v17 = *MEMORY[0x1E4F28A50];
        id v18 = v9;
        uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        uint64_t v12 = ARErrorWithCodeAndUserInfo(1001, v11);
        [(ARRecordingTechniquePublic *)self _fail:v12];
      }
      break;
  }
}

- (void)isReadyToRecord
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  self->_writerReady = 1;
  v3 = _ARLogTechnique_2();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Writer ready for recording", (uint8_t *)&v9, 0x16u);
  }
  id v6 = [(ARRecordingTechniquePublic *)self recordingTechniqueDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(ARRecordingTechniquePublic *)self recordingTechniqueDelegate];
    [v8 recordingTechniqueDidBecomeReady:self];
  }
}

- (void)didFailWithError:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  recordingQueue = self->_recordingQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(recordingQueue);
  uint64_t v8 = *MEMORY[0x1E4F28A50];
  v9[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  char v7 = ARErrorWithCodeAndUserInfo(1001, v6);
  [(ARRecordingTechniquePublic *)self _fail:v7];
}

- (void)didFinishRecording
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  if (self->_shouldSaveVideoInPhotosLibrary)
  {
    if (objc_opt_respondsToSelector())
    {
      outputFileURL = self->_outputFileURL;
      [(ARRecordingTechniquePublic *)self performSelector:sel__saveVideoInPhotosLibrary_ withObject:outputFileURL];
    }
  }
  else
  {
    uint64_t v4 = _ARLogTechnique_2();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      char v7 = self->_outputFileURL;
      int v8 = 138543874;
      int v9 = v6;
      __int16 v10 = 2048;
      __int16 v11 = self;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Saved video to file at %@.", (uint8_t *)&v8, 0x20u);
    }
    [(ARRecordingTechniquePublic *)self _finish:0];
  }
}

+ (BOOL)isSupported
{
  return 1;
}

- (NSURL)outputFileURL
{
  return self->_outputFileURL;
}

- (BOOL)expectDepthData
{
  return self->_expectDepthData;
}

- (void)setExpectDepthData:(BOOL)a3
{
  self->_expectDepthData = a3;
}

- (BOOL)expectAudioData
{
  return self->_expectAudioData;
}

- (void)setExpectAudioData:(BOOL)a3
{
  self->_expectAudioData = a3;
}

- (BOOL)expectCustomData
{
  return self->_expectCustomData;
}

- (void)setExpectCustomData:(BOOL)a3
{
  self->_expectCustomData = a3;
}

- (BOOL)shouldSaveVideoInPhotosLibrary
{
  return self->_shouldSaveVideoInPhotosLibrary;
}

- (void)setShouldSaveVideoInPhotosLibrary:(BOOL)a3
{
  self->_shouldSaveVideoInPhotosLibrary = a3;
}

- (ARRecordingTechniqueDelegate)recordingTechniqueDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordingTechniqueDelegate);
  return (ARRecordingTechniqueDelegate *)WeakRetained;
}

- (void)setRecordingTechniqueDelegate:(id)a3
{
}

- (ARParentImageSensorSettings)parentImageSensorSettings
{
  return self->_parentImageSensorSettings;
}

- (NSDictionary)customUserData
{
  return self->_customUserData;
}

- (void)setCustomUserData:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customUserData, 0);
  objc_storeStrong((id *)&self->_parentImageSensorSettings, 0);
  objc_destroyWeak((id *)&self->_recordingTechniqueDelegate);
  objc_storeStrong((id *)&self->_outputFileURL, 0);
  objc_storeStrong((id *)&self->_knownVIOSessionIDs, 0);
  objc_storeStrong((id *)&self->_finishedError, 0);
  objc_storeStrong((id *)&self->_lastRecordedTimestamps, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_timeSensitiveQueue, 0);
  objc_storeStrong((id *)&self->_recordingQueue, 0);
}

@end