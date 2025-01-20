@interface VNDetectTrajectoriesRequest
+ (BOOL)setsTimeRangeOnResults;
+ (Class)configurationClass;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (CMTime)targetFrameTime;
- (NSInteger)trajectoryLength;
- (VNDetectTrajectoriesRequest)initWithFrameAnalysisSpacing:(CMTime *)frameAnalysisSpacing trajectoryLength:(NSInteger)trajectoryLength completionHandler:(VNRequestCompletionHandler)completionHandler;
- (float)objectMaximumNormalizedRadius;
- (float)objectMinimumNormalizedRadius;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (id)newDuplicateInstance;
- (id)supportedComputeStageDevicesAndReturnError:(id *)a3;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setObjectMaximumNormalizedRadius:(float)objectMaximumNormalizedRadius;
- (void)setObjectMinimumNormalizedRadius:(float)objectMinimumNormalizedRadius;
- (void)setTargetFrameTime:(CMTime *)targetFrameTime;
@end

@implementation VNDetectTrajectoriesRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);

  objc_storeStrong((id *)&self->_trajectoryProcessor, 0);
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [v8 imageBufferAndReturnError:a5];
  v10 = v9;
  if (!v9) {
    goto LABEL_5;
  }
  [v9 timingInfo];
  if ((v28 & 1) == 0)
  {
    if (a5)
    {
      +[VNError errorWithCode:18 message:@"No valid presentationTimeStamp was available for this image"];
      BOOL v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_5:
    BOOL v11 = 0;
    goto LABEL_12;
  }
  v12 = [v8 session];
  id v13 = [(VNDetectTrajectoriesRequest *)self newDefaultDetectorOptionsForRequestRevision:a3 session:v12];

  trajectoryProcessor = self->_trajectoryProcessor;
  [(VNImageBasedRequest *)self regionOfInterest];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [(VNStatefulRequest *)self requestUUID];
  v24 = -[VNTrajectoryProcessor processVNImageBuffer:regionOfInterest:withOptions:warningRecorder:requestUUID:error:](trajectoryProcessor, "processVNImageBuffer:regionOfInterest:withOptions:warningRecorder:requestUUID:error:", v10, v13, self, v23, a5, v16, v18, v20, v22);

  BOOL v11 = v24 != 0;
  if (v24)
  {
    if (a3 == 1
      && +[VisionCoreRuntimeUtilities linkTimeOrRunTimeBeforeVersion:393216])
    {
      id v25 = &__block_literal_global_125;
      uint64_t v26 = [v24 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_125];

      v24 = (void *)v26;
    }
    [(VNRequest *)self setResults:v24];
  }
LABEL_12:

  return v11;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)VNDetectTrajectoriesRequest;
  id v5 = [(VNRequest *)&v13 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  [v5 setObject:self->_state forKeyedSubscript:@"VNTrajectoryProcessorOption_RequestState"];
  v6 = NSNumber;
  [(VNDetectTrajectoriesRequest *)self objectMinimumNormalizedRadius];
  v7 = objc_msgSend(v6, "numberWithFloat:");
  [v5 setObject:v7 forKeyedSubscript:@"VNTrajectoryProcessorOption_ObjectMinimumNormalizedRadius"];

  id v8 = NSNumber;
  [(VNDetectTrajectoriesRequest *)self objectMaximumNormalizedRadius];
  v9 = objc_msgSend(v8, "numberWithFloat:");
  [v5 setObject:v9 forKeyedSubscript:@"VNTrajectoryProcessorOption_ObjectMaximumNormalizedRadius"];

  memset(v12, 0, sizeof(v12));
  [(VNDetectTrajectoriesRequest *)self targetFrameTime];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F29238]) initWithBytes:v12 objCType:"{?=qiIq}"];
  [v5 setObject:v10 forKeyedSubscript:@"VNTrajectoryProcessorOption_ProcessingTargetFrameTime"];

  return v5;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  [(VNDetectTrajectoriesRequest *)self objectMinimumNormalizedRadius];
  float v6 = v5;
  [v4 objectMinimumNormalizedRadius];
  if (v6 >= v7
    && ([(VNDetectTrajectoriesRequest *)self objectMaximumNormalizedRadius],
        float v9 = v8,
        [v4 objectMaximumNormalizedRadius],
        v9 <= v10))
  {
    v13.receiver = self;
    v13.super_class = (Class)VNDetectTrajectoriesRequest;
    BOOL v11 = [(VNImageBasedRequest *)&v13 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  id v4 = (VNDetectTrajectoriesRequest *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNDetectTrajectoriesRequest;
    [(VNImageBasedRequest *)&v5 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(VNDetectTrajectoriesRequest *)v4 objectMinimumNormalizedRadius];
      -[VNDetectTrajectoriesRequest setObjectMinimumNormalizedRadius:](self, "setObjectMinimumNormalizedRadius:");
      [(VNDetectTrajectoriesRequest *)v4 objectMaximumNormalizedRadius];
      -[VNDetectTrajectoriesRequest setObjectMaximumNormalizedRadius:](self, "setObjectMaximumNormalizedRadius:");
    }
  }
}

- (id)newDuplicateInstance
{
  id v3 = objc_alloc((Class)objc_opt_class());
  [(VNStatefulRequest *)self frameAnalysisSpacing];
  NSInteger v4 = [(VNDetectTrajectoriesRequest *)self trajectoryLength];
  objc_super v5 = [(VNRequest *)self completionHandler];
  float v6 = (void *)[v3 initWithFrameAnalysisSpacing:v8 trajectoryLength:v4 completionHandler:v5];

  return v6;
}

- (id)supportedComputeStageDevicesAndReturnError:(id *)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  float v6 = @"VNComputeStageMain";
  id v3 = +[VNComputeDeviceUtilities allCPUComputeDevices];
  v7[0] = v3;
  NSInteger v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (void)setTargetFrameTime:(CMTime *)targetFrameTime
{
  NSInteger v4 = [(VNRequest *)self configuration];
  CMTime v5 = *targetFrameTime;
  [v4 setTargetFrameTime:&v5];
}

- (CMTime)targetFrameTime
{
  NSInteger v4 = [(VNRequest *)self configuration];
  if (v4)
  {
    float v6 = v4;
    [v4 targetFrameTime];
    NSInteger v4 = v6;
  }
  else
  {
    retstr->value = 0;
    *(void *)&retstr->timescale = 0;
    retstr->epoch = 0;
  }

  return result;
}

- (void)setObjectMaximumNormalizedRadius:(float)objectMaximumNormalizedRadius
{
  id v5 = [(VNRequest *)self configuration];
  *(float *)&double v4 = objectMaximumNormalizedRadius;
  [v5 setObjectMaximumNormalizedRadius:v4];
}

- (float)objectMaximumNormalizedRadius
{
  v2 = [(VNRequest *)self configuration];
  [v2 objectMaximumNormalizedRadius];
  float v4 = v3;

  return v4;
}

- (void)setObjectMinimumNormalizedRadius:(float)objectMinimumNormalizedRadius
{
  id v5 = [(VNRequest *)self configuration];
  *(float *)&double v4 = objectMinimumNormalizedRadius;
  [v5 setObjectMinimumNormalizedRadius:v4];
}

- (float)objectMinimumNormalizedRadius
{
  v2 = [(VNRequest *)self configuration];
  [v2 objectMinimumNormalizedRadius];
  float v4 = v3;

  return v4;
}

- (NSInteger)trajectoryLength
{
  v2 = [(VNRequest *)self configuration];
  NSInteger v3 = [v2 trajectoryLength];

  return v3;
}

- (VNDetectTrajectoriesRequest)initWithFrameAnalysisSpacing:(CMTime *)frameAnalysisSpacing trajectoryLength:(NSInteger)trajectoryLength completionHandler:(VNRequestCompletionHandler)completionHandler
{
  VNRequestCompletionHandler v14 = completionHandler;
  if (trajectoryLength >= 5)
  {
    if (trajectoryLength < 0x80000000) {
      goto LABEL_6;
    }
    trajectoryLength = 0x7FFFFFFFLL;
  }
  else
  {
    trajectoryLength = 5;
  }
  VNValidatedLog(4, @"trajectory length must be in range [%llu..%llu]", v8, v9, v10, v11, v12, v13, 5);
LABEL_6:
  v26.receiver = self;
  v26.super_class = (Class)VNDetectTrajectoriesRequest;
  long long v24 = *(_OWORD *)&frameAnalysisSpacing->value;
  CMTimeEpoch epoch = frameAnalysisSpacing->epoch;
  double v15 = [(VNStatefulRequest *)&v26 initWithFrameAnalysisSpacing:&v24 completionHandler:v14];
  double v16 = v15;
  if (v15)
  {
    double v17 = [(VNRequest *)v15 configuration];
    [v17 setTrajectoryLength:trajectoryLength];
    double v18 = [VNTrajectoryProcessor alloc];
    long long v24 = *(_OWORD *)&frameAnalysisSpacing->value;
    CMTimeEpoch epoch = frameAnalysisSpacing->epoch;
    uint64_t v19 = [(VNTrajectoryProcessor *)v18 initWithFrameAnalysisSpacing:&v24 trajectoryLength:trajectoryLength];
    trajectoryProcessor = v16->_trajectoryProcessor;
    v16->_trajectoryProcessor = (VNTrajectoryProcessor *)v19;

    double v21 = objc_alloc_init(VNTrajectoryRequestState);
    state = v16->_state;
    v16->_state = v21;
  }
  return v16;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)setsTimeRangeOnResults
{
  return 1;
}

@end