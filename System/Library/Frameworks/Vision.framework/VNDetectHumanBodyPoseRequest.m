@interface VNDetectHumanBodyPoseRequest
+ (Class)configurationClass;
+ (NSArray)supportedJointNamesForRevision:(NSUInteger)revision error:(NSError *)error;
+ (NSArray)supportedJointsGroupNamesForRevision:(NSUInteger)revision error:(NSError *)error;
+ (const)revisionAvailability;
+ (id)_supportedJointNamesRevision1;
+ (id)_supportedJointsGroupNamesRevision1;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)privateRevisionsSet;
- (BOOL)detectsHands;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (NSArray)supportedJointNamesAndReturnError:(NSError *)error;
- (NSArray)supportedJointsGroupNamesAndReturnError:(NSError *)error;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (void)setDetectsHands:(BOOL)a3;
@end

@implementation VNDetectHumanBodyPoseRequest

- (void)setDetectsHands:(BOOL)a3
{
  self->_detectsHands = a3;
}

- (BOOL)detectsHands
{
  return self->_detectsHands;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [v8 imageBufferAndReturnError:a5];
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

      if (a3 == 3737841664)
      {
        v14 = objc_msgSend(NSNumber, "numberWithBool:", -[VNDetectHumanBodyPoseRequest detectsHands](self, "detectsHands"));
        [v12 setObject:v14 forKey:@"VNHumanBodyPoseDetectorProcessOption_HolisticDetection"];
      }
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

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)VNDetectHumanBodyPoseRequest;
  id v5 = [(VNRequest *)&v8 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[VNRequest usesCPUOnly](self, "usesCPUOnly"));
  [v5 setObject:v6 forKey:@"VNHumanPoseDetectorInitOption_UseCPUOnly"];

  return v5;
}

- (NSArray)supportedJointsGroupNamesAndReturnError:(NSError *)error
{
  NSUInteger v5 = [(VNRequest *)self revision];
  if (v5 == 3737841664 || v5 == 1)
  {
    v6 = [(id)objc_opt_class() _supportedJointsGroupNamesRevision1];
  }
  else if (error)
  {
    v7 = +[VNError errorForUnsupportedRevision:[(VNRequest *)self revision] ofRequest:self];
    v6 = 0;
    *error = v7;
  }
  else
  {
    v6 = 0;
  }

  return (NSArray *)v6;
}

- (NSArray)supportedJointNamesAndReturnError:(NSError *)error
{
  NSUInteger v5 = [(VNRequest *)self revision];
  if (v5 == 3737841664 || v5 == 1)
  {
    v6 = [(id)objc_opt_class() _supportedJointNamesRevision1];
  }
  else if (error)
  {
    v7 = +[VNError errorForUnsupportedRevision:[(VNRequest *)self revision] ofRequest:self];
    v6 = 0;
    *error = v7;
  }
  else
  {
    v6 = 0;
  }

  return (NSArray *)v6;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 3737841664 || a3 == 1)
  {
    NSUInteger v5 = @"VNHumanBodyPoseDetectorType";
    v6 = @"VNHumanBodyPoseDetectorType";
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    NSUInteger v5 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSUInteger v5 = 0;
  }

  return v5;
}

+ (NSArray)supportedJointsGroupNamesForRevision:(NSUInteger)revision error:(NSError *)error
{
  v6 = objc_alloc_init(VNDetectHumanBodyPoseRequest);
  if ([(VNRequest *)v6 setRevision:revision error:error])
  {
    v7 = [(VNDetectHumanBodyPoseRequest *)v6 supportedJointsGroupNamesAndReturnError:error];
  }
  else
  {
    v7 = 0;
  }

  return (NSArray *)v7;
}

+ (NSArray)supportedJointNamesForRevision:(NSUInteger)revision error:(NSError *)error
{
  v6 = objc_alloc_init(VNDetectHumanBodyPoseRequest);
  if ([(VNRequest *)v6 setRevision:revision error:error])
  {
    v7 = [(VNDetectHumanBodyPoseRequest *)v6 supportedJointNamesAndReturnError:error];
  }
  else
  {
    v7 = 0;
  }

  return (NSArray *)v7;
}

+ (id)_supportedJointsGroupNamesRevision1
{
  if (+[VNDetectHumanBodyPoseRequest _supportedJointsGroupNamesRevision1]::onceToken != -1) {
    dispatch_once(&+[VNDetectHumanBodyPoseRequest _supportedJointsGroupNamesRevision1]::onceToken, &__block_literal_global_29_23913);
  }
  v2 = (void *)+[VNDetectHumanBodyPoseRequest _supportedJointsGroupNamesRevision1]::jointsGroupNames;

  return v2;
}

void __67__VNDetectHumanBodyPoseRequest__supportedJointsGroupNamesRevision1__block_invoke()
{
  v2[7] = *MEMORY[0x1E4F143B8];
  v2[0] = @"VNIPOAll";
  v2[1] = @"VNBLKFACE";
  v2[2] = @"VNBLKTORSO";
  v2[3] = @"VNBLKLARM";
  v2[4] = @"VNBLKRARM";
  v2[5] = @"VNBLKLLEG";
  v2[6] = @"VNBLKRLEG";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:7];
  v1 = (void *)+[VNDetectHumanBodyPoseRequest _supportedJointsGroupNamesRevision1]::jointsGroupNames;
  +[VNDetectHumanBodyPoseRequest _supportedJointsGroupNamesRevision1]::jointsGroupNames = v0;
}

+ (id)_supportedJointNamesRevision1
{
  if (+[VNDetectHumanBodyPoseRequest _supportedJointNamesRevision1]::onceToken != -1) {
    dispatch_once(&+[VNDetectHumanBodyPoseRequest _supportedJointNamesRevision1]::onceToken, &__block_literal_global_23915);
  }
  v2 = (void *)+[VNDetectHumanBodyPoseRequest _supportedJointNamesRevision1]::jointNames;

  return v2;
}

void __61__VNDetectHumanBodyPoseRequest__supportedJointNamesRevision1__block_invoke()
{
  v2[19] = *MEMORY[0x1E4F143B8];
  v2[0] = @"head_joint";
  v2[1] = @"left_eye_joint";
  v2[2] = @"right_eye_joint";
  v2[3] = @"left_ear_joint";
  v2[4] = @"right_ear_joint";
  v2[5] = @"left_shoulder_1_joint";
  v2[6] = @"right_shoulder_1_joint";
  v2[7] = @"neck_1_joint";
  void v2[8] = @"left_forearm_joint";
  v2[9] = @"right_forearm_joint";
  v2[10] = @"left_hand_joint";
  v2[11] = @"right_hand_joint";
  v2[12] = @"left_upLeg_joint";
  v2[13] = @"right_upLeg_joint";
  v2[14] = @"root";
  v2[15] = @"left_leg_joint";
  v2[16] = @"right_leg_joint";
  v2[17] = @"left_foot_joint";
  v2[18] = @"right_foot_joint";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:19];
  v1 = (void *)+[VNDetectHumanBodyPoseRequest _supportedJointNamesRevision1]::jointNames;
  +[VNDetectHumanBodyPoseRequest _supportedJointNamesRevision1]::jointNames = v0;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 == 3737841664)
  {
    NSUInteger v5 = @"VNDetectHumanBodyPoseRequestRevision2";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VNDetectHumanBodyPoseRequest;
    objc_msgSendSuper2(&v7, sel_descriptionForPrivateRevision_);
    NSUInteger v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)privateRevisionsSet
{
  if (+[VNDetectHumanBodyPoseRequest(Revisioning) privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNDetectHumanBodyPoseRequest(Revisioning) privateRevisionsSet]::onceToken, &__block_literal_global_59_23933);
  }
  v2 = (void *)+[VNDetectHumanBodyPoseRequest(Revisioning) privateRevisionsSet]::privateRevisions;

  return v2;
}

void __64__VNDetectHumanBodyPoseRequest_Revisioning__privateRevisionsSet__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v2 addIndex:3737841664];
  uint64_t v0 = [v2 copy];
  v1 = (void *)+[VNDetectHumanBodyPoseRequest(Revisioning) privateRevisionsSet]::privateRevisions;
  +[VNDetectHumanBodyPoseRequest(Revisioning) privateRevisionsSet]::privateRevisions = v0;
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNDetectHumanBodyPoseRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end