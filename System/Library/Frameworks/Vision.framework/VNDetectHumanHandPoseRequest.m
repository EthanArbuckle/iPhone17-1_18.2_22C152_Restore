@interface VNDetectHumanHandPoseRequest
+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4;
+ (Class)configurationClass;
+ (NSArray)supportedJointNamesForRevision:(NSUInteger)revision error:(NSError *)error;
+ (NSArray)supportedJointsGroupNamesForRevision:(NSUInteger)revision error:(NSError *)error;
+ (const)revisionAvailability;
+ (id)_supportedJointNamesRevision1;
+ (id)_supportedJointsGroupNamesRevision1;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (NSArray)supportedJointNamesAndReturnError:(NSError *)error;
- (NSArray)supportedJointsGroupNamesAndReturnError:(NSError *)error;
- (NSUInteger)maximumHandCount;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (unint64_t)hash;
- (void)setMaximumHandCount:(NSUInteger)maximumHandCount;
- (void)setProcessedResults:(id)a3;
@end

@implementation VNDetectHumanHandPoseRequest

- (void)setMaximumHandCount:(NSUInteger)maximumHandCount
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setMaximumHandCount:maximumHandCount];
}

- (NSUInteger)maximumHandCount
{
  v2 = [(VNRequest *)self configuration];
  NSUInteger v3 = [v2 maximumHandCount];

  return v3;
}

- (NSArray)supportedJointsGroupNamesAndReturnError:(NSError *)error
{
  if ([(VNRequest *)self revision] == 1)
  {
    v5 = [(id)objc_opt_class() _supportedJointsGroupNamesRevision1];
  }
  else if (error)
  {
    v6 = +[VNError errorForUnsupportedRevision:[(VNRequest *)self revision] ofRequest:self];
    v5 = 0;
    *error = v6;
  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (NSArray)supportedJointNamesAndReturnError:(NSError *)error
{
  if ([(VNRequest *)self revision] == 1)
  {
    v5 = [(id)objc_opt_class() _supportedJointNamesRevision1];
  }
  else if (error)
  {
    v6 = +[VNError errorForUnsupportedRevision:[(VNRequest *)self revision] ofRequest:self];
    v5 = 0;
    *error = v6;
  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VNDetectHumanHandPoseRequest;
  id v4 = [(VNRequest *)&v6 copyWithZone:a3];
  if (v4) {
    objc_msgSend(v4, "setMaximumHandCount:", -[VNDetectHumanHandPoseRequest maximumHandCount](self, "maximumHandCount"));
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNDetectHumanHandPoseRequest *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)VNDetectHumanHandPoseRequest;
    if ([(VNDetectHumanHandPoseRequest *)&v9 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      NSUInteger v6 = [(VNDetectHumanHandPoseRequest *)self maximumHandCount];
      BOOL v7 = v6 == [(VNDetectHumanHandPoseRequest *)v5 maximumHandCount];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)VNDetectHumanHandPoseRequest;
  return [(VNDetectHumanHandPoseRequest *)self maximumHandCount] ^ __ROR8__([(VNDetectHumanHandPoseRequest *)&v3 hash], 51);
}

- (void)setProcessedResults:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(VNDetectHumanHandPoseRequest *)self maximumHandCount];
  if ([v4 count] > v5)
  {
    NSUInteger v6 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v5);
    uint64_t v7 = [v4 objectsAtIndexes:v6];

    id v4 = (id)v7;
  }
  v8.receiver = self;
  v8.super_class = (Class)VNDetectHumanHandPoseRequest;
  [(VNRequest *)&v8 setProcessedResults:v4];
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  objc_super v9 = [v8 imageBufferAndReturnError:a5];
  if (v9)
  {
    v10 = [v8 session];
    id v21 = 0;
    v11 = [(VNRequest *)self applicableDetectorAndOptions:&v21 forRevision:a3 loadedInSession:v10 error:a5];
    id v12 = v21;
    if (v11)
    {
      v22[0] = v9;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      [v12 setObject:v13 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

      v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNDetectHumanHandPoseRequest maximumHandCount](self, "maximumHandCount"));
      [v12 setObject:v14 forKeyedSubscript:@"VNHumanHandPoseDetectorProcessOption_MaximumHandCount"];

      uint64_t v15 = [v8 qosClass];
      [(VNImageBasedRequest *)self regionOfInterest];
      v16 = objc_msgSend(v11, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v15, v12, self, a5, 0);
      BOOL v17 = v16 != 0;
      if (v16)
      {
        if (a3 == 1
          && +[VisionCoreRuntimeUtilities linkTimeOrRunTimeBeforeVersion:393216])
        {
          id v18 = &__block_literal_global_125;
          uint64_t v19 = [v16 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_125];

          v16 = (void *)v19;
        }
        [(VNRequest *)self setResults:v16];
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VNDetectHumanHandPoseRequest;
  if ([(VNImageBasedRequest *)&v8 willAcceptCachedResultsFromRequestWithConfiguration:v4])
  {
    unint64_t v5 = [v4 maximumHandCount];
    BOOL v6 = v5 >= [(VNDetectHumanHandPoseRequest *)self maximumHandCount];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)VNDetectHumanHandPoseRequest;
  id v5 = [(VNRequest *)&v8 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  BOOL v6 = objc_msgSend(NSNumber, "numberWithBool:", -[VNRequest usesCPUOnly](self, "usesCPUOnly"));
  [v5 setObject:v6 forKey:@"VNHumanPoseDetectorInitOption_UseCPUOnly"];

  return v5;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 1)
  {
    id v4 = @"VNHumanHandPoseDetectorType";
    id v5 = @"VNHumanHandPoseDetectorType";
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

+ (NSArray)supportedJointsGroupNamesForRevision:(NSUInteger)revision error:(NSError *)error
{
  BOOL v6 = objc_alloc_init(VNDetectHumanHandPoseRequest);
  if ([(VNRequest *)v6 setRevision:revision error:error])
  {
    uint64_t v7 = [(VNDetectHumanHandPoseRequest *)v6 supportedJointsGroupNamesAndReturnError:error];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (NSArray *)v7;
}

+ (NSArray)supportedJointNamesForRevision:(NSUInteger)revision error:(NSError *)error
{
  BOOL v6 = objc_alloc_init(VNDetectHumanHandPoseRequest);
  if ([(VNRequest *)v6 setRevision:revision error:error])
  {
    uint64_t v7 = [(VNDetectHumanHandPoseRequest *)v6 supportedJointNamesAndReturnError:error];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (NSArray *)v7;
}

+ (id)_supportedJointsGroupNamesRevision1
{
  if (+[VNDetectHumanHandPoseRequest _supportedJointsGroupNamesRevision1]::onceToken != -1) {
    dispatch_once(&+[VNDetectHumanHandPoseRequest _supportedJointsGroupNamesRevision1]::onceToken, &__block_literal_global_138_13545);
  }
  v2 = (void *)+[VNDetectHumanHandPoseRequest _supportedJointsGroupNamesRevision1]::jointGroupNames;

  return v2;
}

void __67__VNDetectHumanHandPoseRequest__supportedJointsGroupNamesRevision1__block_invoke()
{
  v2[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"VNHLRKT";
  v2[1] = @"VNHLRKM";
  v2[2] = @"VNHLRKI";
  v2[3] = @"VNHLRKR";
  v2[4] = @"VNHLRKP";
  v2[5] = @"VNIPOAll";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:6];
  v1 = (void *)+[VNDetectHumanHandPoseRequest _supportedJointsGroupNamesRevision1]::jointGroupNames;
  +[VNDetectHumanHandPoseRequest _supportedJointsGroupNamesRevision1]::jointGroupNames = v0;
}

+ (id)_supportedJointNamesRevision1
{
  if (+[VNDetectHumanHandPoseRequest _supportedJointNamesRevision1]::onceToken != -1) {
    dispatch_once(&+[VNDetectHumanHandPoseRequest _supportedJointNamesRevision1]::onceToken, &__block_literal_global_13547);
  }
  v2 = (void *)+[VNDetectHumanHandPoseRequest _supportedJointNamesRevision1]::jointNames;

  return v2;
}

void __61__VNDetectHumanHandPoseRequest__supportedJointNamesRevision1__block_invoke()
{
  v2[21] = *MEMORY[0x1E4F143B8];
  v2[0] = @"VNHLKWRI";
  v2[1] = @"VNHLKTCMC";
  v2[2] = @"VNHLKTMP";
  v2[3] = @"VNHLKTIP";
  v2[4] = @"VNHLKTTIP";
  v2[5] = @"VNHLKIMCP";
  v2[6] = @"VNHLKIPIP";
  void v2[7] = @"VNHLKIDIP";
  v2[8] = @"VNHLKITIP";
  v2[9] = @"VNHLKMMCP";
  v2[10] = @"VNHLKMPIP";
  v2[11] = @"VNHLKMDIP";
  v2[12] = @"VNHLKMTIP";
  v2[13] = @"VNHLKRMCP";
  v2[14] = @"VNHLKRPIP";
  v2[15] = @"VNHLKRDIP";
  v2[16] = @"VNHLKRTIP";
  v2[17] = @"VNHLKPMCP";
  v2[18] = @"VNHLKPPIP";
  v2[19] = @"VNHLKPDIP";
  v2[20] = @"VNHLKPTIP";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:21];
  v1 = (void *)+[VNDetectHumanHandPoseRequest _supportedJointNamesRevision1]::jointNames;
  +[VNDetectHumanHandPoseRequest _supportedJointNamesRevision1]::jointNames = v0;
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  if (a3 != a4) {
    return 0;
  }
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___VNDetectHumanHandPoseRequest;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNDetectHumanHandPoseRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end