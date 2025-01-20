@interface VNDetectFaceGazeRequest
+ (Class)configurationClass;
+ (const)dependentRequestMappingTable;
+ (const)revisionAvailability;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)resolveSomewhereElseDirection;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (float)commonGazeLocationRadius;
- (float)gazeHeatMapThreshold;
- (float)minimumFaceDimension;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (int64_t)dependencyProcessingOrdinality;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setCommonGazeLocationRadius:(float)a3;
- (void)setGazeHeatMapThreshold:(float)a3;
- (void)setMinimumFaceDimension:(float)a3;
- (void)setResolveSomewhereElseDirection:(BOOL)a3;
@end

@implementation VNDetectFaceGazeRequest

- (void)setResolveSomewhereElseDirection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setResolveSomewhereElseDirection:v3];
}

- (BOOL)resolveSomewhereElseDirection
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 resolveSomewhereElseDirection];

  return v3;
}

- (void)setCommonGazeLocationRadius:(float)a3
{
  id v5 = [(VNRequest *)self configuration];
  *(float *)&double v4 = a3;
  [v5 setCommonGazeLocationRadius:v4];
}

- (float)commonGazeLocationRadius
{
  v2 = [(VNRequest *)self configuration];
  [v2 commonGazeLocationRadius];
  float v4 = v3;

  return v4;
}

- (void)setMinimumFaceDimension:(float)a3
{
  id v5 = [(VNRequest *)self configuration];
  *(float *)&double v4 = a3;
  [v5 setMinimumFaceDimension:v4];
}

- (float)minimumFaceDimension
{
  v2 = [(VNRequest *)self configuration];
  [v2 minimumFaceDimension];
  float v4 = v3;

  return v4;
}

- (void)setGazeHeatMapThreshold:(float)a3
{
  id v5 = [(VNRequest *)self configuration];
  *(float *)&double v4 = a3;
  [v5 setGazeHeatMapThreshold:v4];
}

- (float)gazeHeatMapThreshold
{
  v2 = [(VNRequest *)self configuration];
  [v2 gazeHeatMapThreshold];
  float v4 = v3;

  return v4;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [v8 imageBufferAndReturnError:a5];
  if (v9)
  {
    v10 = [v8 session];
    id v29 = 0;
    v11 = [(VNRequest *)self applicableDetectorAndOptions:&v29 forRevision:a3 loadedInSession:v10 error:a5];
    id v12 = v29;
    if (!v11)
    {
      BOOL v19 = 0;
LABEL_22:

      goto LABEL_23;
    }
    id v13 = v8;
    v14 = v13;
    if (self)
    {
      id v30 = 0;
      BOOL v15 = [(VNImageBasedRequest *)self getOptionalValidatedInputFaceObservations:&v30 clippedToRegionOfInterest:1 error:a5];
      id v16 = v30;
      v17 = v16;
      if (v15)
      {
        if (v16)
        {
          id v18 = v16;
        }
        else
        {
          v20 = objc_alloc_init(VNDetectFaceRectanglesRequest);
          v27 = v20;
          [(VNDetectFaceRectanglesRequest *)v20 applyConfigurationOfRequest:self];
          v28 = [v14 requestPerformerAndReturnError:a5];
          if (v28
            && (v32[0] = v20,
                [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1],
                v21 = objc_claimAutoreleasedReturnValue(),
                char v26 = [v28 performDependentRequests:v21 onBehalfOfRequest:self inContext:v14 error:a5], v21, (v26 & 1) != 0))
          {
            id v18 = [(VNRequest *)v27 results];
          }
          else
          {
            id v18 = 0;
          }
        }
      }
      else
      {
        id v18 = 0;
      }

      if (v18)
      {
        [v12 setObject:v18 forKeyedSubscript:@"VNDetectorProcessOption_InputFaceObservations"];
        v31 = v9;
        v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
        [v12 setObject:v22 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

        uint64_t v23 = [v14 qosClass];
        [(VNImageBasedRequest *)self regionOfInterest];
        v24 = objc_msgSend(v11, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v23, v12, self, a5, 0);
        BOOL v19 = v24 != 0;
        if (v24) {
          [(VNRequest *)self setResults:v24];
        }

        goto LABEL_21;
      }
    }
    else
    {

      id v18 = 0;
    }
    BOOL v19 = 0;
LABEL_21:

    goto LABEL_22;
  }
  BOOL v19 = 0;
LABEL_23:

  return v19;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  float v4 = (VNDetectFaceGazeRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNDetectFaceGazeRequest;
    [(VNImageBasedRequest *)&v6 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      [(VNDetectFaceGazeRequest *)v5 gazeHeatMapThreshold];
      -[VNDetectFaceGazeRequest setGazeHeatMapThreshold:](self, "setGazeHeatMapThreshold:");
      [(VNDetectFaceGazeRequest *)v5 minimumFaceDimension];
      -[VNDetectFaceGazeRequest setMinimumFaceDimension:](self, "setMinimumFaceDimension:");
      [(VNDetectFaceGazeRequest *)v5 commonGazeLocationRadius];
      -[VNDetectFaceGazeRequest setCommonGazeLocationRadius:](self, "setCommonGazeLocationRadius:");
      [(VNDetectFaceGazeRequest *)self setResolveSomewhereElseDirection:[(VNDetectFaceGazeRequest *)v5 resolveSomewhereElseDirection]];
    }
  }
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  [(VNDetectFaceGazeRequest *)self gazeHeatMapThreshold];
  float v6 = v5;
  [v4 gazeHeatMapThreshold];
  if (v6 == v7
    && ([(VNDetectFaceGazeRequest *)self minimumFaceDimension],
        float v9 = v8,
        [v4 minimumFaceDimension],
        v9 == v10)
    && ([(VNDetectFaceGazeRequest *)self commonGazeLocationRadius],
        float v12 = v11,
        [v4 commonGazeLocationRadius],
        v12 == v13)
    && (int v14 = [(VNDetectFaceGazeRequest *)self resolveSomewhereElseDirection],
        v14 == [v4 resolveSomewhereElseDirection]))
  {
    v17.receiver = self;
    v17.super_class = (Class)VNDetectFaceGazeRequest;
    BOOL v15 = [(VNImageBasedRequest *)&v17 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)VNDetectFaceGazeRequest;
  id v6 = [(VNRequest *)&v15 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  if (a3 == 1)
  {
    float v7 = NSNumber;
    [(VNDetectFaceGazeRequest *)self gazeHeatMapThreshold];
    float v8 = objc_msgSend(v7, "numberWithFloat:");
    [v6 setObject:v8 forKeyedSubscript:@"VNFaceGazeDetectorProcessOption_GazeHeatMapThreshold"];

    float v9 = NSNumber;
    [(VNDetectFaceGazeRequest *)self minimumFaceDimension];
    float v10 = objc_msgSend(v9, "numberWithFloat:");
    [v6 setObject:v10 forKeyedSubscript:@"VNFaceGazeDetectorProcessOption_MinimumFaceDimension"];

    float v11 = NSNumber;
    [(VNDetectFaceGazeRequest *)self commonGazeLocationRadius];
    float v12 = objc_msgSend(v11, "numberWithFloat:");
    [v6 setObject:v12 forKeyedSubscript:@"VNFaceGazeDetectorProcessOption_CommonGazeLocationRadius"];

    float v13 = objc_msgSend(NSNumber, "numberWithBool:", -[VNDetectFaceGazeRequest resolveSomewhereElseDirection](self, "resolveSomewhereElseDirection") ^ 1);
    [v6 setObject:v13 forKeyedSubscript:@"VNFaceGazeDetectorProcessOption_DontFollowGaze"];
  }
  return v6;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(4000, self);
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 1)
  {
    id v4 = @"VNFaceGazeDetectorType";
    float v5 = @"VNFaceGazeDetectorType";
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    id v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNDetectFaceGazeRequest revisionAvailability]::ourRevisionAvailability;
}

+ (const)dependentRequestMappingTable
{
  {
    +[VNDetectFaceGazeRequest dependentRequestMappingTable]::ourDependentRequestMappingTable = 1;
    qword_1E9640058 = objc_opt_class();
    unk_1E9640060 = 3737841666;
    qword_1E9640070 = 0;
    unk_1E9640078 = 0;
    qword_1E9640068 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VNDetectFaceGazeRequest dependentRequestMappingTable]::ourDependentRequestMappingTable;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end