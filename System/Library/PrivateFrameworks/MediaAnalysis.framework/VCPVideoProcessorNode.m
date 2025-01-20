@interface VCPVideoProcessorNode
+ (BOOL)validateConfiguration:(id)a3 withError:(id *)a4;
+ (id)nodeWithFrameProcessor:(id)a3 andConfiguration:(id)a4;
+ (id)nodeWithRequest:(id)a3 andConfiguration:(id)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeInterval;
- (BOOL)finished;
- (NSNumber)frameLimit;
- (NSString)typeDescription;
- (VCPVideoProcessorNode)initWithFrameProcessor:(id)a3 andConfiguration:(id)a4;
- (VCPVideoProcessorNode)initWithRequest:(id)a3 andConfiguration:(id)a4;
- (VNRequest)request;
- (id)frameProcessor;
- (unint64_t)frameInterval;
- (unint64_t)processedFrameCount;
- (void)_processConfiguration:(id)a3;
- (void)setProcessedFrameCount:(unint64_t)a3;
@end

@implementation VCPVideoProcessorNode

- (NSString)typeDescription
{
  if (self->_request)
  {
    v2 = (objc_class *)objc_opt_class();
    NSStringFromClass(v2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = @"FrameProcessingRequest";
  }
  return (NSString *)v3;
}

+ (BOOL)validateConfiguration:(id)a3 withError:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__VCPVideoProcessorNode_validateConfiguration_withError___block_invoke;
  v11[3] = &unk_1E62977B8;
  v11[4] = v18;
  v11[5] = &v12;
  [v5 enumerateKeysAndObjectsUsingBlock:v11];
  v6 = v13;
  if (v13[5])
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = [(id)v13[5] localizedDescription];
        *(_DWORD *)buf = 138412290;
        v21 = v8;
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "Invalid request configuration (%@)", buf, 0xCu);
      }
    }
    v6 = v13;
    if (a4)
    {
      *a4 = (id) v13[5];
      v6 = v13;
    }
  }
  BOOL v9 = v6[5] == 0;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(v18, 8);
  return v9;
}

void __57__VCPVideoProcessorNode_validateConfiguration_withError___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  int v9 = [v7 isEqualToString:@"FramesPerSecond"];
  if (([v7 isEqualToString:*MEMORY[0x1E4F45D10]] & 1) != 0
    || (v9 | [v7 isEqualToString:*MEMORY[0x1E4F45D18]]) == 1)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(unsigned char *)(v10 + 24))
    {
      v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v51 = *MEMORY[0x1E4F28568];
      uint64_t v12 = [NSString stringWithFormat:@"Multiple cadence options specified"];
      v52[0] = v12;
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
      uint64_t v14 = [v11 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v13];
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

LABEL_13:
      *a4 = 1;
      goto LABEL_14;
    }
    *(unsigned char *)(v10 + 24) = 1;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v49 = *MEMORY[0x1E4F28568];
      v26 = [NSString stringWithFormat:@"%@ value must be NSNumber", v7];
      v50 = v26;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      uint64_t v28 = [v25 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v27];
      uint64_t v29 = *(void *)(*(void *)(a1 + 40) + 8);
      v30 = *(void **)(v29 + 40);
      *(void *)(v29 + 40) = v28;

      goto LABEL_13;
    }
    id v17 = v8;
    [v17 floatValue];
    if (v18 <= 0.0)
    {
      v37 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v47 = *MEMORY[0x1E4F28568];
      v38 = [NSString stringWithFormat:@"%@ value must be positive", v7];
      v48 = v38;
      v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      uint64_t v40 = [v37 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v39];
      uint64_t v41 = *(void *)(*(void *)(a1 + 40) + 8);
      v42 = *(void **)(v41 + 40);
      *(void *)(v41 + 40) = v40;

      *a4 = 1;
    }
    else
    {
    }
  }
  else
  {
    if (![v7 isEqualToString:@"FrameLimit"])
    {
      v31 = (void *)MEMORY[0x1E4F28C58];
      v32 = [NSString stringWithFormat:@"%@ is not supported", v7, *MEMORY[0x1E4F28568]];
      v44 = v32;
      v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      uint64_t v34 = [v31 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v33];
      uint64_t v35 = *(void *)(*(void *)(a1 + 40) + 8);
      v36 = *(void **)(v35 + 40);
      *(void *)(v35 + 40) = v34;

      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v45 = *MEMORY[0x1E4F28568];
      v20 = [NSString stringWithFormat:@"%@ value must be NSNumber", v7];
      v46 = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      uint64_t v22 = [v19 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v21];
      uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
      v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;

      goto LABEL_13;
    }
  }
LABEL_14:
}

- (void)_processConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F45D10];
  v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F45D10]];

  if (v6)
  {
    id v7 = [v4 objectForKeyedSubscript:v5];
    self->_frameInterval = [v7 unsignedIntegerValue];
  }
  else
  {
    self->_frameInterval = 0;
  }
  id v8 = [v4 objectForKeyedSubscript:@"FramesPerSecond"];

  if (v8)
  {
    int v9 = [v4 objectForKeyedSubscript:@"FramesPerSecond"];
    [v9 doubleValue];
    double v11 = v10;

    CMTimeMakeWithSeconds(&v22, 1.0 / v11, 1000);
LABEL_8:
    *(_OWORD *)&self->_timeInterval.value = *(_OWORD *)&v22.value;
    CMTimeEpoch epoch = v22.epoch;
    goto LABEL_9;
  }
  uint64_t v12 = *MEMORY[0x1E4F45D18];
  v13 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F45D18]];

  if (v13)
  {
    uint64_t v14 = [v4 objectForKeyedSubscript:v12];
    [v14 floatValue];
    float v16 = v15;

    CMTimeMakeWithSeconds(&v22, v16, 1000);
    goto LABEL_8;
  }
  uint64_t v21 = MEMORY[0x1E4F1FA48];
  *(_OWORD *)&self->_timeInterval.value = *MEMORY[0x1E4F1FA48];
  CMTimeEpoch epoch = *(void *)(v21 + 16);
LABEL_9:
  self->_timeInterval.CMTimeEpoch epoch = epoch;
  float v18 = [v4 objectForKeyedSubscript:@"FrameLimit"];

  if (v18)
  {
    char v19 = [v4 objectForKeyedSubscript:@"FrameLimit"];
    frameLimit = self->_frameLimit;
    self->_frameLimit = v19;
  }
}

- (VCPVideoProcessorNode)initWithRequest:(id)a3 andConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)VCPVideoProcessorNode;
    int v9 = [(VCPVideoProcessorNode *)&v14 init];
    double v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_request, a3);
      [(VCPVideoProcessorNode *)v10 _processConfiguration:v8];
    }
    self = v10;
    double v11 = self;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "VNRequest must be non-nil", buf, 2u);
      }
    }
    double v11 = 0;
  }

  return v11;
}

+ (id)nodeWithRequest:(id)a3 andConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRequest:v5 andConfiguration:v6];

  return v7;
}

- (VCPVideoProcessorNode)initWithFrameProcessor:(id)a3 andConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)VCPVideoProcessorNode;
    id v8 = [(VCPVideoProcessorNode *)&v14 init];
    if (v8)
    {
      int v9 = _Block_copy(v6);
      id frameProcessor = v8->_frameProcessor;
      v8->_id frameProcessor = v9;

      [(VCPVideoProcessorNode *)v8 _processConfiguration:v7];
    }
    self = v8;
    double v11 = self;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "Frame processor must be non-nil", buf, 2u);
      }
    }
    double v11 = 0;
  }

  return v11;
}

+ (id)nodeWithFrameProcessor:(id)a3 andConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFrameProcessor:v5 andConfiguration:v6];

  return v7;
}

- (BOOL)finished
{
  frameLimit = self->_frameLimit;
  if (frameLimit)
  {
    unint64_t processedFrameCount = self->_processedFrameCount;
    LOBYTE(frameLimit) = processedFrameCount >= [(NSNumber *)frameLimit unsignedIntegerValue];
  }
  return (char)frameLimit;
}

- (VNRequest)request
{
  return self->_request;
}

- (id)frameProcessor
{
  return self->_frameProcessor;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- (unint64_t)frameInterval
{
  return self->_frameInterval;
}

- (NSNumber)frameLimit
{
  return self->_frameLimit;
}

- (unint64_t)processedFrameCount
{
  return self->_processedFrameCount;
}

- (void)setProcessedFrameCount:(unint64_t)a3
{
  self->_unint64_t processedFrameCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameLimit, 0);
  objc_storeStrong(&self->_frameProcessor, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end