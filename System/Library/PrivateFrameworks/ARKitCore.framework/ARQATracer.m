@interface ARQATracer
+ (BOOL)isEnabled;
+ (id)traceOutputDirectory;
- (ARQATracer)init;
- (ARQATracerDelegate)delegate;
- (BOOL)_shouldDumpSemanticData;
- (BOOL)forceQuitApp;
- (BOOL)isSemanticSegmentationDataAvailableForSession:(id)a3;
- (BOOL)recordScreen;
- (CGPoint)offset;
- (NSMutableDictionary)additionalResults;
- (NSString)traceOutputFilePath;
- (__CVBuffer)_createRecordablePixelBufferFromSegmentationBuffer:(__CVBuffer *)a3;
- (__CVBuffer)_createRecordablePixelBufferFromSemanticsBuffer:(__CVBuffer *)a3;
- (id)screenRecorder;
- (void)dealloc;
- (void)flushDataBufferToFile;
- (void)receiveDefaults;
- (void)replaySensorDidFinishReplayingData;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)setAdditionalResults:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForceQuitApp:(BOOL)a3;
- (void)setOffset:(CGPoint)a3;
- (void)setRecordScreen:(BOOL)a3;
- (void)setScreenRecorder:(id)a3;
- (void)setTraceOutputFilePath:(id)a3;
- (void)start:(id)a3;
- (void)stop;
- (void)trace:(id)a3 forKey:(id)a4;
- (void)traceRaycastQuery:(id)a3;
- (void)traceRaycastResults:(id)a3;
- (void)update:(id)a3 session:(id)a4;
- (void)writeJSONObjectToStream:(id)a3 prefix:(id)a4;
- (void)writeStringToOutputStream:(id)a3;
@end

@implementation ARQATracer

+ (BOOL)isEnabled
{
  return +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.session.qatracing"];
}

- (ARQATracer)init
{
  v25.receiver = self;
  v25.super_class = (Class)ARQATracer;
  v2 = [(ARQATracer *)&v25 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    traceHeader = v2->_traceHeader;
    v2->_traceHeader = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.arQATracer", v5);
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.arQATracer.segmentation", v8);
    segmentationVideoQueue = v2->_segmentationVideoQueue;
    v2->_segmentationVideoQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.arQATracer.semantics", v11);
    semanticsVideoQueue = v2->_semanticsVideoQueue;
    v2->_semanticsVideoQueue = (OS_dispatch_queue *)v12;

    v14 = [(id)objc_opt_class() traceOutputDirectory];
    v15 = [v14 stringByAppendingPathComponent:@"data.json"];
    [(ARQATracer *)v2 setTraceOutputFilePath:v15];

    id v16 = objc_alloc(MEMORY[0x1E4F1CAA8]);
    v17 = [(ARQATracer *)v2 traceOutputFilePath];
    uint64_t v18 = [v16 initToFileAtPath:v17 append:0];
    framesStreamToFile = v2->_framesStreamToFile;
    v2->_framesStreamToFile = (NSOutputStream *)v18;

    uint64_t v20 = objc_opt_new();
    dataBuffer = v2->_dataBuffer;
    v2->_dataBuffer = (NSMutableData *)v20;

    v2->_additionalResultsLock._os_unfair_lock_opaque = 0;
    uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
    additionalResults = v2->_additionalResults;
    v2->_additionalResults = (NSMutableDictionary *)v22;
  }
  return v2;
}

- (void)dealloc
{
  segmentationYUVPixelBufferPool = self->_segmentationYUVPixelBufferPool;
  if (segmentationYUVPixelBufferPool)
  {
    CVPixelBufferPoolRelease(segmentationYUVPixelBufferPool);
    self->_segmentationYUVPixelBufferPool = 0;
  }
  semanticsYUVPixelBufferPool = self->_semanticsYUVPixelBufferPool;
  if (semanticsYUVPixelBufferPool)
  {
    CVPixelBufferPoolRelease(semanticsYUVPixelBufferPool);
    self->_semanticsYUVPixelBufferPool = 0;
  }
  segmentationTransferSession = self->_segmentationTransferSession;
  if (segmentationTransferSession)
  {
    VTPixelTransferSessionInvalidate(segmentationTransferSession);
    dispatch_queue_t v6 = self->_segmentationTransferSession;
    if (v6) {
      CFRelease(v6);
    }
    self->_segmentationTransferSession = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)ARQATracer;
  [(ARQATracer *)&v7 dealloc];
}

- (void)traceRaycastQuery:(id)a3
{
  v4 = +[ARQAHelper dictionaryFromRaycastQuery:a3];
  raycastQueryData = self->_raycastQueryData;
  self->_raycastQueryData = v4;
}

- (void)traceRaycastResults:(id)a3
{
  v4 = +[ARQAHelper arrayFromRaycastResults:a3];
  raycastResultData = self->_raycastResultData;
  self->_raycastResultData = v4;
}

- (void)trace:(id)a3 forKey:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  p_additionalResultsLock = &self->_additionalResultsLock;
  os_unfair_lock_lock(&self->_additionalResultsLock);
  v8 = [(ARQATracer *)self additionalResults];
  dispatch_queue_t v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    v10 = [(ARQATracer *)self additionalResults];
    v11 = [v10 objectForKeyedSubscript:v6];
    dispatch_queue_t v12 = [v14 encodeToDictionary];
    [v11 addObject:v12];
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F1CA48];
    v10 = [v14 encodeToDictionary];
    v11 = [v13 arrayWithObject:v10];
    dispatch_queue_t v12 = [(ARQATracer *)self additionalResults];
    [v12 setObject:v11 forKeyedSubscript:v6];
  }

  os_unfair_lock_unlock(p_additionalResultsLock);
}

- (void)receiveDefaults
{
  v3 = +[ARKitUserDefaults valueForKey:@"com.apple.arkit.session.qatracing.screenRecording"];
  id v13 = v3;
  if (v3) {
    uint64_t v4 = [v3 BOOLValue];
  }
  else {
    uint64_t v4 = 1;
  }
  [(ARQATracer *)self setRecordScreen:v4];
  v5 = +[ARKitUserDefaults valueForKey:@"com.apple.arkit.session.qatracing.forceQuitApp"];
  id v6 = v5;
  if (v5) {
    uint64_t v7 = [v5 BOOLValue];
  }
  else {
    uint64_t v7 = 1;
  }
  [(ARQATracer *)self setForceQuitApp:v7];
  v8 = +[ARKitUserDefaults stringForKey:@"com.apple.arkit.session.qatracing.framesLabelOffset"];
  dispatch_queue_t v9 = [v8 componentsSeparatedByString:@","];
  if ([v9 count] == 2)
  {
    v10 = [v9 objectAtIndexedSubscript:0];
    double v11 = (double)[v10 integerValue];
    dispatch_queue_t v12 = [v9 objectAtIndexedSubscript:1];
    -[ARQATracer setOffset:](self, "setOffset:", v11, (double)[v12 integerValue]);
  }
}

- (void)writeJSONObjectToStream:(id)a3 prefix:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    [(ARQATracer *)self writeStringToOutputStream:v7];
  }
  id v13 = 0;
  v8 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:0 error:&v13];
  id v9 = v13;
  [(NSMutableData *)self->_dataBuffer appendData:v8];

  if (v9)
  {
    v10 = _ARLogGeneral_28();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      double v11 = (objc_class *)objc_opt_class();
      dispatch_queue_t v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138543874;
      v15 = v12;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error serializing JSON with error %@", buf, 0x20u);
    }
    [(ARQATracer *)self writeStringToOutputStream:@"{}"];
  }
}

- (void)writeStringToOutputStream:(id)a3
{
  id v4 = [a3 dataUsingEncoding:4];
  [(NSMutableData *)self->_dataBuffer appendData:v4];
}

- (void)flushDataBufferToFile
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  NSInteger v3 = [(NSOutputStream *)self->_framesStreamToFile write:[(NSMutableData *)self->_dataBuffer bytes] maxLength:[(NSMutableData *)self->_dataBuffer length]];
  if (v3 != [(NSMutableData *)self->_dataBuffer length])
  {
    id v4 = _ARLogGeneral_28();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      int v7 = 138543618;
      v8 = v6;
      __int16 v9 = 2048;
      v10 = self;
      _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Not all bytes could be written to file", (uint8_t *)&v7, 0x16u);
    }
  }
  [(NSMutableData *)self->_dataBuffer setLength:0];
}

- (void)start:(id)a3
{
  id v4 = a3;
  processingQueue = self->_processingQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __20__ARQATracer_start___block_invoke;
  v7[3] = &unk_1E6185160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(processingQueue, v7);
}

void __20__ARQATracer_start___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 16))
  {
    v2 = _ARLogGeneral_28();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      NSInteger v3 = (objc_class *)objc_opt_class();
      id v4 = NSStringFromClass(v3);
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v44 = v4;
      __int16 v45 = 2048;
      uint64_t v46 = v5;
      _os_log_impl(&dword_1B88A2000, v2, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Start", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
    [*(id *)(*(void *)(a1 + 32) + 40) open];
    id v6 = *(void **)(a1 + 32);
    int v7 = [NSString stringWithFormat:@"{\"version\":\"%@\",\"frames\":[", @"1.1"];
    [v6 writeStringToOutputStream:v7];

    id v8 = [*(id *)(a1 + 40) configuration];
    __int16 v9 = [v8 replaySensor];

    if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v9 setTraceReplaySensorDelegate:*(void *)(a1 + 32)];
    }
    [*(id *)(a1 + 32) receiveDefaults];
    v10 = [*(id *)(a1 + 40) configuration];
    char v11 = [v10 frameSemantics];

    if (v11)
    {
      dispatch_queue_t v12 = NSString;
      id v13 = [(id)objc_opt_class() traceOutputDirectory];
      id v14 = [v12 stringWithFormat:@"%@/segmentation.mov", v13];

      v15 = _ARLogGeneral_28();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        __int16 v16 = (objc_class *)objc_opt_class();
        v17 = NSStringFromClass(v16);
        uint64_t v18 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v44 = v17;
        __int16 v45 = 2048;
        uint64_t v46 = v18;
        __int16 v47 = 2114;
        v48 = v14;
        _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Recording segmentation output to %{public}@", buf, 0x20u);
      }
      id v19 = objc_alloc(MEMORY[0x1E4F4D5E0]);
      uint64_t v20 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14];
      uint64_t v21 = [v19 initWithFileURL:v20 expectedFrameRate:MEMORY[0x1E4F1CC08] fileSummary:60.0];
      uint64_t v22 = *(void *)(a1 + 32);
      v23 = *(void **)(v22 + 56);
      *(void *)(v22 + 56) = v21;

      [*(id *)(*(void *)(a1 + 32) + 56) registerStreamID:@"Segmentation" withConfigObject:0];
    }
    if ([*(id *)(a1 + 32) _shouldDumpSemanticData]
      && [*(id *)(a1 + 32) isSemanticSegmentationDataAvailableForSession:*(void *)(a1 + 40)])
    {
      v24 = NSString;
      objc_super v25 = [(id)objc_opt_class() traceOutputDirectory];
      v26 = [v24 stringWithFormat:@"%@/semantics.mov", v25];

      v27 = _ARLogGeneral_28();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        uint64_t v30 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v44 = v29;
        __int16 v45 = 2048;
        uint64_t v46 = v30;
        __int16 v47 = 2114;
        v48 = v26;
        _os_log_impl(&dword_1B88A2000, v27, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Recording semantics output to %{public}@", buf, 0x20u);
      }
      id v31 = objc_alloc(MEMORY[0x1E4F4D5E0]);
      v32 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v26];
      uint64_t v33 = [v31 initWithFileURL:v32 expectedFrameRate:MEMORY[0x1E4F1CC08] fileSummary:10.0];
      uint64_t v34 = *(void *)(a1 + 32);
      v35 = *(void **)(v34 + 64);
      *(void *)(v34 + 64) = v33;

      [*(id *)(*(void *)(a1 + 32) + 64) registerStreamID:@"Semantics" withConfigObject:0];
    }
    v36 = [*(id *)(a1 + 40) configuration];
    v37 = [*(id *)(a1 + 40) technique];
    uint64_t v38 = +[ARQAHelper headerInformationWithConfiguration:v36 technique:v37];
    uint64_t v39 = *(void *)(a1 + 32);
    v40 = *(void **)(v39 + 24);
    *(void *)(v39 + 24) = v38;

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __20__ARQATracer_start___block_invoke_44;
    block[3] = &unk_1E6187510;
    block[4] = *(void *)(a1 + 32);
    objc_copyWeak(&v42, (id *)buf);
    dispatch_sync(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v42);
    objc_destroyWeak((id *)buf);
  }
}

void __20__ARQATracer_start___block_invoke_44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 136));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 136));
    [*(id *)(a1 + 32) offset];
    objc_msgSend(v4, "getFrameLabelFrameForOffset:");
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    double v10 = v9;
    double v12 = v11;

    id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%.f,%.f", v6, v8);
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v13 forKeyedSubscript:@"frameLabelOffset"];

    float v14 = v10;
    float v15 = v12;
    __int16 v16 = objc_msgSend(NSString, "stringWithFormat:", @"%.f,%.f", v14, v15);
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v16 forKeyedSubscript:@"frameLabelSize"];
  }
  id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 136));
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    id v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 136));
    [v19 getDeviceViewSize];
    uint64_t v21 = v20;
    uint64_t v23 = v22;

    v24 = objc_msgSend(NSString, "stringWithFormat:", @"%.f,%.f", v21, v23);
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v24 forKeyedSubscript:@"deviceViewSize"];
  }
  id v25 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 136));
  char v26 = objc_opt_respondsToSelector();

  if (v26)
  {
    id v27 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 136));
    v28 = [v27 getRendererDescription];
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v28 forKeyedSubscript:@"rendererDescription"];
  }
  id v29 = objc_loadWeakRetained((id *)(a1 + 40));
  char v30 = objc_opt_respondsToSelector();

  if (v30)
  {
    id v31 = *(void **)(a1 + 32);
    [v31 performSelector:sel__startScreenRecording];
  }
}

- (void)stop
{
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __18__ARQATracer_stop__block_invoke;
  block[3] = &unk_1E61851B0;
  block[4] = self;
  dispatch_sync(processingQueue, block);
}

void __18__ARQATracer_stop__block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v2 = _ARLogGeneral_28();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    char v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    __int16 v47 = v4;
    __int16 v48 = 2048;
    uint64_t v49 = v5;
    _os_log_impl(&dword_1B88A2000, v2, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Stop requested", buf, 0x16u);
  }
  int v6 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 16);
  uint64_t v7 = _ARLogGeneral_28();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      double v9 = (objc_class *)objc_opt_class();
      double v10 = NSStringFromClass(v9);
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      __int16 v47 = v10;
      __int16 v48 = 2048;
      uint64_t v49 = v11;
      _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Stopping", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
    [*(id *)(a1 + 32) writeStringToOutputStream:@"]"];
    double v12 = [*(id *)(a1 + 32) additionalResults];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      float v14 = *(void **)(a1 + 32);
      float v15 = [v14 additionalResults];
      [v14 writeJSONObjectToStream:v15 prefix:@",\"additionalData\":"];
    }
    [*(id *)(a1 + 32) writeJSONObjectToStream:*(void *)(*(void *)(a1 + 32) + 24) prefix:@",\"header\":"];
    [*(id *)(a1 + 32) writeStringToOutputStream:@"}"];
    [*(id *)(a1 + 32) flushDataBufferToFile];
    [*(id *)(*(void *)(a1 + 32) + 40) close];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 136));
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      id v18 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 136));
      id v19 = *(void **)(a1 + 32);
      uint64_t v20 = [v19 traceOutputFilePath];
      [v18 tracer:v19 finishedWritingJSONToPath:v20];
    }
    uint64_t v21 = *(void **)(a1 + 32);
    uint64_t v22 = (void *)v21[7];
    if (v22)
    {
      id v45 = 0;
      [v22 finishWriting:&v45];
      id v23 = v45;
      if (v23)
      {
        v24 = _ARLogGeneral_28();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          id v25 = (objc_class *)objc_opt_class();
          char v26 = NSStringFromClass(v25);
          uint64_t v27 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          __int16 v47 = v26;
          __int16 v48 = 2048;
          uint64_t v49 = v27;
          _os_log_impl(&dword_1B88A2000, v24, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not write segmentation video", buf, 0x16u);
        }
      }

      uint64_t v21 = *(void **)(a1 + 32);
    }
    v28 = (void *)v21[8];
    if (v28)
    {
      id v44 = 0;
      [v28 finishWriting:&v44];
      id v29 = v44;
      if (v29)
      {
        char v30 = _ARLogGeneral_28();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          id v31 = (objc_class *)objc_opt_class();
          v32 = NSStringFromClass(v31);
          uint64_t v33 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          __int16 v47 = v32;
          __int16 v48 = 2048;
          uint64_t v49 = v33;
          _os_log_impl(&dword_1B88A2000, v30, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not write semantics video", buf, 0x16u);
        }
      }

      uint64_t v21 = *(void **)(a1 + 32);
    }
    if ([v21 forceQuitApp])
    {
      uint64_t v34 = _ARLogGeneral_28();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = (objc_class *)objc_opt_class();
        v36 = NSStringFromClass(v35);
        uint64_t v37 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        __int16 v47 = v36;
        __int16 v48 = 2048;
        uint64_t v49 = v37;
        _os_log_impl(&dword_1B88A2000, v34, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Requesting App termination on ARQATracer stop", buf, 0x16u);
      }
      uint64_t v38 = [*(id *)(a1 + 32) delegate];
      [v38 requestDelayedAppTermination];
    }
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __18__ARQATracer_stop__block_invoke_83;
    v42[3] = &unk_1E6185200;
    objc_copyWeak(&v43, (id *)buf);
    v42[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v42);
    objc_destroyWeak(&v43);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v39);
      uint64_t v41 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      __int16 v47 = v40;
      __int16 v48 = 2048;
      uint64_t v49 = v41;
      _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: User default for tracing is not set or not tracing", buf, 0x16u);
    }
  }
}

void __18__ARQATracer_stop__block_invoke_83(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    [v4 performSelector:sel__stopScreenRecording];
  }
}

- (void)update:(id)a3 session:(id)a4
{
  id v5 = a3;
  processingQueue = self->_processingQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__ARQATracer_update_session___block_invoke;
  v8[3] = &unk_1E6185160;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(processingQueue, v8);
}

void __29__ARQATracer_update_session___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 16))
  {
    v2 = (void *)MEMORY[0x1E4F1CA60];
    char v3 = +[ARQAHelper traceFrameData:withFrameIndex:writeOBJ:](ARQAHelper, "traceFrameData:withFrameIndex:writeOBJ:", *(void *)(a1 + 40));
    id v4 = [v2 dictionaryWithDictionary:v3];

    if ([*(id *)(a1 + 40) segmentationBuffer])
    {
      id v5 = *(NSObject **)(*(void *)(a1 + 32) + 88);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __29__ARQATracer_update_session___block_invoke_2;
      block[3] = &unk_1E6185160;
      id v6 = *(id *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 32);
      id v37 = v6;
      uint64_t v38 = v7;
      dispatch_async(v5, block);
    }
    if ([*(id *)(a1 + 32) _shouldDumpSemanticData])
    {
      uint64_t v8 = [*(id *)(a1 + 40) rawSceneUnderstandingData];
      uint64_t v9 = [v8 semanticSegmentationBuffer];

      if (v9)
      {
        double v10 = *(NSObject **)(*(void *)(a1 + 32) + 96);
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __29__ARQATracer_update_session___block_invoke_3;
        v33[3] = &unk_1E6185160;
        id v11 = *(id *)(a1 + 40);
        uint64_t v12 = *(void *)(a1 + 32);
        id v34 = v11;
        uint64_t v35 = v12;
        dispatch_async(v10, v33);
      }
    }
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v14 = v13[14];
    if (v14)
    {
      [v4 setObject:v14 forKeyedSubscript:@"raycastQueryData"];
      uint64_t v15 = *(void *)(a1 + 32);
      __int16 v16 = *(void **)(v15 + 112);
      *(void *)(v15 + 112) = 0;

      uint64_t v13 = *(void **)(a1 + 32);
    }
    uint64_t v17 = v13[15];
    if (v17)
    {
      [v4 setObject:v17 forKeyedSubscript:@"raycastResultData"];
      uint64_t v18 = *(void *)(a1 + 32);
      id v19 = *(void **)(v18 + 120);
      *(void *)(v18 + 120) = 0;

      uint64_t v13 = *(void **)(a1 + 32);
    }
    uint64_t v20 = [v13 additionalResults];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 128));
      uint64_t v22 = [*(id *)(a1 + 32) additionalResults];
      [v4 addEntriesFromDictionary:v22];

      id v23 = [*(id *)(a1 + 32) additionalResults];
      [v23 removeAllObjects];

      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 128));
    }
    v24 = *(void **)(a1 + 32);
    if (v24[1]) {
      id v25 = @",";
    }
    else {
      id v25 = 0;
    }
    [v24 writeJSONObjectToStream:v4 prefix:v25];
    if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 32) length] >= 0x30D41) {
      [*(id *)(a1 + 32) flushDataBufferToFile];
    }
    char v26 = *(void **)(a1 + 32);
    uint64_t v27 = (void *)v26[1];
    objc_initWeak(&location, v26);
    ++*(void *)(*(void *)(a1 + 32) + 8);
    v28 = [*(id *)(a1 + 32) delegate];
    char v29 = objc_opt_respondsToSelector();

    if (v29)
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __29__ARQATracer_update_session___block_invoke_4;
      v30[3] = &unk_1E6186448;
      objc_copyWeak(v31, &location);
      v30[4] = *(void *)(a1 + 32);
      v31[1] = v27;
      dispatch_async(MEMORY[0x1E4F14428], v30);
      objc_destroyWeak(v31);
    }
    objc_destroyWeak(&location);
  }
}

void __29__ARQATracer_update_session___block_invoke_2(uint64_t a1)
{
  long long v17 = 0uLL;
  uint64_t v18 = 0;
  v2 = (void *)MEMORY[0x1E4F4D5E0];
  [*(id *)(a1 + 32) timestamp];
  objc_msgSend(v2, "cmTimeFromTimestamp:");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  char v3 = [*(id *)(a1 + 32) camera];
  [v3 intrinsics];
  DWORD2(v14) = v4;
  DWORD2(v15) = v5;
  *(void *)&long long v14 = v6;
  *(void *)&long long v15 = v7;
  DWORD2(v16) = v8;
  *(void *)&long long v16 = v9;

  double v10 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 40), "_createRecordablePixelBufferFromSegmentationBuffer:", objc_msgSend(*(id *)(a1 + 32), "segmentationBuffer"));
  id v11 = *(void **)(*(void *)(a1 + 40) + 56);
  long long v12 = v17;
  uint64_t v13 = v18;
  [v11 processPixelBuffer:v10 withTimeStamp:&v12 intrinsics:&v14 exposureTime:@"Segmentation" streamID:0.0];
  CVPixelBufferRelease(v10);
}

void __29__ARQATracer_update_session___block_invoke_3(uint64_t a1)
{
  long long v19 = 0uLL;
  uint64_t v20 = 0;
  v2 = (void *)MEMORY[0x1E4F4D5E0];
  [*(id *)(a1 + 32) timestamp];
  objc_msgSend(v2, "cmTimeFromTimestamp:");
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  char v3 = [*(id *)(a1 + 32) camera];
  [v3 intrinsics];
  DWORD2(v16) = v4;
  DWORD2(v17) = v5;
  *(void *)&long long v16 = v6;
  *(void *)&long long v17 = v7;
  DWORD2(v18) = v8;
  *(void *)&long long v18 = v9;

  double v10 = *(void **)(a1 + 40);
  id v11 = [*(id *)(a1 + 32) rawSceneUnderstandingData];
  long long v12 = (__CVBuffer *)objc_msgSend(v10, "_createRecordablePixelBufferFromSemanticsBuffer:", objc_msgSend(v11, "semanticSegmentationBuffer"));

  uint64_t v13 = *(void **)(*(void *)(a1 + 40) + 64);
  long long v14 = v19;
  uint64_t v15 = v20;
  [v13 processPixelBuffer:v12 withTimeStamp:&v14 intrinsics:&v16 exposureTime:@"Semantics" streamID:0.0];
  CVPixelBufferRelease(v12);
}

void __29__ARQATracer_update_session___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained delegate];
  [v2 tracer:*(void *)(a1 + 32) processedFrameNumber:*(void *)(a1 + 48)];
}

+ (id)traceOutputDirectory
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  char v3 = +[ARKitUserDefaults stringForKey:@"com.apple.arkit.session.qatracing.filepath"];
  int v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v7 = [v6 infoDictionary];
    int v8 = [v7 objectForKey:*MEMORY[0x1E4F1CFF0]];

    uint64_t v9 = NSTemporaryDirectory();
    double v10 = v9;
    if (v8) {
      id v11 = v8;
    }
    else {
      id v11 = @"UnitTest";
    }
    id v5 = [v9 stringByAppendingPathComponent:v11];
  }
  long long v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v12 fileExistsAtPath:v5] & 1) == 0)
  {
    id v24 = 0;
    [v12 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v24];
    id v13 = v24;
    long long v14 = _ARLogGeneral_28();
    uint64_t v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        long long v16 = (objc_class *)objc_opt_class();
        long long v17 = NSStringFromClass(v16);
        *(_DWORD *)buf = 138543874;
        char v26 = v17;
        __int16 v27 = 2048;
        id v28 = a1;
        __int16 v29 = 2112;
        id v30 = v13;
        long long v18 = "%{public}@ <%p>: Error creating directory: %@";
        long long v19 = v15;
        os_log_type_t v20 = OS_LOG_TYPE_ERROR;
LABEL_13:
        _os_log_impl(&dword_1B88A2000, v19, v20, v18, buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = (objc_class *)objc_opt_class();
      long long v17 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138543874;
      char v26 = v17;
      __int16 v27 = 2048;
      id v28 = a1;
      __int16 v29 = 2114;
      id v30 = v5;
      long long v18 = "%{public}@ <%p>: Created tracing output directory: %{public}@";
      long long v19 = v15;
      os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
      goto LABEL_13;
    }
  }
  id v22 = v5;

  return v22;
}

- (BOOL)isSemanticSegmentationDataAvailableForSession:(id)a3
{
  id v3 = a3;
  int v4 = [v3 configuration];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v6 = [v3 configuration];
  uint64_t v7 = v6;
  if (isKindOfClass)
  {
    char v8 = [v6 planeDetection] && (objc_msgSend(v7, "isMLModelEnabled") & 1) != 0
      || [v7 sceneReconstruction] != 0;
    goto LABEL_14;
  }
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  double v10 = [v3 configuration];
  uint64_t v7 = v10;
  if (v9)
  {
LABEL_10:
    if ([v10 planeDetection]) {
      char v8 = [v7 isMLModelEnabled];
    }
    else {
      char v8 = 0;
    }
LABEL_14:

    goto LABEL_15;
  }
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();

  if (v11)
  {
    double v10 = [v3 configuration];
    uint64_t v7 = v10;
    goto LABEL_10;
  }
  char v8 = 0;
LABEL_15:

  return v8;
}

- (BOOL)_shouldDumpSemanticData
{
  if (_shouldDumpSemanticData_onceToken != -1) {
    dispatch_once(&_shouldDumpSemanticData_onceToken, &__block_literal_global_72);
  }
  return _shouldDumpSemanticData_dumpSemantics;
}

BOOL __37__ARQATracer__shouldDumpSemanticData__block_invoke()
{
  BOOL result = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.session.qatracing.dumpSemanticSegmantationData"];
  _shouldDumpSemanticData_dumpSemantics = result;
  return result;
}

- (void)replaySensorDidFinishReplayingData
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = _ARLogGeneral_28();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2048;
    char v9 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Replay finished", (uint8_t *)&v6, 0x16u);
  }
  [(ARQATracer *)self stop];
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    id v7 = v6;
    [(ARQATracer *)self start:v6];
  }
  else
  {
    id v7 = v6;
    [(ARQATracer *)self stop];
  }
  id v6 = v7;
LABEL_6:
}

- (__CVBuffer)_createRecordablePixelBufferFromSegmentationBuffer:(__CVBuffer *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_segmentationYUVPixelBufferPool = &self->_segmentationYUVPixelBufferPool;
  if (!self->_segmentationYUVPixelBufferPool)
  {
    unsigned int Width = CVPixelBufferGetWidth(a3);
    unsigned int Height = CVPixelBufferGetHeight(a3);
    if (ar_pixelBufferPoolCreateNew(Width, Height, 875704422, p_segmentationYUVPixelBufferPool))
    {
      id v7 = _ARLogGeneral_28();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v13 = (objc_class *)objc_opt_class();
        char v9 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138543618;
        uint64_t v21 = v9;
        __int16 v22 = 2048;
        id v23 = self;
        uint64_t v10 = "%{public}@ <%p>: Could not create pixel buffer pool.";
        goto LABEL_12;
      }
      goto LABEL_13;
    }
  }
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (!self->_segmentationTransferSession
    && VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &self->_segmentationTransferSession))
  {
    id v7 = _ARLogGeneral_28();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      long long v14 = (objc_class *)objc_opt_class();
      char v9 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v9;
      __int16 v22 = 2048;
      id v23 = self;
      uint64_t v10 = "%{public}@ <%p>: Could not create VTPixelTransferSession.";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  CVPixelBufferRef pixelBufferOut = 0;
  if (CVPixelBufferPoolCreatePixelBuffer(v6, *p_segmentationYUVPixelBufferPool, &pixelBufferOut))
  {
    id v7 = _ARLogGeneral_28();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __int16 v8 = (objc_class *)objc_opt_class();
      char v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v9;
      __int16 v22 = 2048;
      id v23 = self;
      uint64_t v10 = "%{public}@ <%p>: Could not create pixel buffer.";
LABEL_12:
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_ERROR, v10, buf, 0x16u);
    }
LABEL_13:

    return 0;
  }
  if (VTPixelTransferSessionTransferImage(self->_segmentationTransferSession, a3, pixelBufferOut))
  {
    long long v16 = _ARLogGeneral_28();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      long long v17 = (objc_class *)objc_opt_class();
      long long v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v18;
      __int16 v22 = 2048;
      id v23 = self;
      _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create transfer pixel buffer.", buf, 0x16u);
    }
  }
  return pixelBufferOut;
}

- (__CVBuffer)_createRecordablePixelBufferFromSemanticsBuffer:(__CVBuffer *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_semanticsYUVPixelBufferPool = &self->_semanticsYUVPixelBufferPool;
  semanticsYUVPixelBufferPool = self->_semanticsYUVPixelBufferPool;
  if (!semanticsYUVPixelBufferPool)
  {
    unsigned int Width = CVPixelBufferGetWidth(a3);
    unsigned int Height = CVPixelBufferGetHeight(a3);
    if (ar_pixelBufferPoolCreateNew(Width, Height, 1111970369, p_semanticsYUVPixelBufferPool))
    {
      id v7 = _ARLogGeneral_28();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v13 = (objc_class *)objc_opt_class();
        char v9 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138543618;
        long long v17 = v9;
        __int16 v18 = 2048;
        long long v19 = self;
        uint64_t v10 = "%{public}@ <%p>: Could not create pixel buffer pool.";
        goto LABEL_8;
      }
LABEL_9:

      return 0;
    }
    semanticsYUVPixelBufferPool = *p_semanticsYUVPixelBufferPool;
  }
  CVPixelBufferRef pixelBufferOut = 0;
  if (CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], semanticsYUVPixelBufferPool, &pixelBufferOut))
  {
    id v7 = _ARLogGeneral_28();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __int16 v8 = (objc_class *)objc_opt_class();
      char v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138543618;
      long long v17 = v9;
      __int16 v18 = 2048;
      long long v19 = self;
      uint64_t v10 = "%{public}@ <%p>: Could not create pixel buffer.";
LABEL_8:
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_ERROR, v10, buf, 0x16u);

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  ARCreatePixelBufferFromSourceWithPixelConverter(a3, 0x42475241u, &pixelBufferOut, &__block_literal_global_101);
  return pixelBufferOut;
}

int8x8_t __62__ARQATracer__createRecordablePixelBufferFromSemanticsBuffer___block_invoke(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _DWORD *a4)
{
  __n128 v5 = ARCV3DColorComponentsForRawSemantics(*a2);
  double v6 = v5.n128_f32[0];
  v5.n128_u32[0] = vextq_s8((int8x16_t)v5, (int8x16_t)v5, 8uLL).u32[0];
  v5.n128_u64[0] = (unint64_t)vmovn_s64(vcvtq_s64_f64(vmulq_f64(vcvtq_f64_f32((float32x2_t)v5.n128_u64[0]), (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL))));
  v7.i16[3] = 255;
  v7.i64[1] = 0xFF00FF00FF00FFLL;
  v7.i16[0] = v5.n128_u16[0];
  v7.i16[1] = v5.n128_i16[2];
  v7.i16[2] = (int)(v6 * 255.0);
  int8x8_t result = vmovn_s16(v7);
  *a4 = result.i32[0];
  return result;
}

- (ARQATracerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ARQATracerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)traceOutputFilePath
{
  return self->_traceOutputFilePath;
}

- (void)setTraceOutputFilePath:(id)a3
{
}

- (BOOL)recordScreen
{
  return self->_recordScreen;
}

- (void)setRecordScreen:(BOOL)a3
{
  self->_recordScreen = a3;
}

- (id)screenRecorder
{
  return self->_screenRecorder;
}

- (void)setScreenRecorder:(id)a3
{
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (BOOL)forceQuitApp
{
  return self->_forceQuitApp;
}

- (void)setForceQuitApp:(BOOL)a3
{
  self->_forceQuitApp = a3;
}

- (NSMutableDictionary)additionalResults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAdditionalResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalResults, 0);
  objc_storeStrong(&self->_screenRecorder, 0);
  objc_storeStrong((id *)&self->_traceOutputFilePath, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_raycastResultData, 0);
  objc_storeStrong((id *)&self->_raycastQueryData, 0);
  objc_storeStrong((id *)&self->_semanticsVideoQueue, 0);
  objc_storeStrong((id *)&self->_segmentationVideoQueue, 0);
  objc_storeStrong((id *)&self->_semanticsVideoFileWriter, 0);
  objc_storeStrong((id *)&self->_segmentationVideoFileWriter, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_framesStreamToFile, 0);
  objc_storeStrong((id *)&self->_dataBuffer, 0);
  objc_storeStrong((id *)&self->_traceHeader, 0);
}

@end