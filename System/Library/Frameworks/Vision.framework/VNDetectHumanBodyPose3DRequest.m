@interface VNDetectHumanBodyPose3DRequest
+ (Class)configurationClass;
+ (const)revisionAvailability;
+ (id)_supportedJointNamesRevision1;
+ (id)_supportedJointsGroupsNamesRevision1;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (NSArray)supportedJointNamesAndReturnError:(NSError *)error;
- (NSArray)supportedJointsGroupNamesAndReturnError:(NSError *)error;
- (VNDetectHumanBodyPose3DRequest)init;
- (VNDetectHumanBodyPose3DRequest)initWithCompletionHandler:(VNRequestCompletionHandler)completionHandler;
- (VNDetectHumanBodyPose3DRequest)initWithFrameAnalysisSpacing:(id *)a3 completionHandler:(id)a4;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (void)_initializeStateForRevision:(unint64_t)a3;
- (void)resolvedRevisionDidChangeFromRevision:(unint64_t)a3;
@end

@implementation VNDetectHumanBodyPose3DRequest

- (void).cxx_destruct
{
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [v8 session];
  id v19 = 0;
  v10 = [(VNRequest *)self applicableDetectorAndOptions:&v19 forRevision:a3 loadedInSession:v9 error:a5];
  id v11 = v19;
  if (v10)
  {
    uint64_t v12 = [v8 imageBufferAndReturnError:a5];
    v13 = (void *)v12;
    if (v12)
    {
      v20[0] = v12;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      [v11 setObject:v14 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

      [v11 setObject:self->_bodyPosePipelineWrapper forKeyedSubscript:@"VNHumanBodyPose3DDetectorProcessOption_ABPKPipeline"];
      uint64_t v15 = [v8 qosClass];
      [(VNImageBasedRequest *)self regionOfInterest];
      v16 = objc_msgSend(v10, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v15, v11, self, a5, 0);
      BOOL v17 = v16 != 0;
      if (v16) {
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

- (void)resolvedRevisionDidChangeFromRevision:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNDetectHumanBodyPose3DRequest;
  [(VNRequest *)&v4 resolvedRevisionDidChangeFromRevision:a3];
  [(VNDetectHumanBodyPose3DRequest *)self _initializeStateForRevision:[(VNRequest *)self resolvedRevision]];
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 1)
  {
    objc_super v4 = @"VNHumanBodyPose3DDetectorType";
    v5 = @"VNHumanBodyPose3DDetectorType";
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    objc_super v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

- (NSArray)supportedJointsGroupNamesAndReturnError:(NSError *)error
{
  unint64_t v5 = [(VNRequest *)self resolvedRevision];
  if (v5 == 1)
  {
    v6 = [(id)objc_opt_class() _supportedJointsGroupsNamesRevision1];
  }
  else if (error)
  {
    v7 = +[VNError errorForUnsupportedRevision:v5 ofRequest:self];
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
  unint64_t v5 = [(VNRequest *)self resolvedRevision];
  if (v5 == 1)
  {
    v6 = [(id)objc_opt_class() _supportedJointNamesRevision1];
  }
  else if (error)
  {
    v7 = +[VNError errorForUnsupportedRevision:v5 ofRequest:self];
    v6 = 0;
    *error = v7;
  }
  else
  {
    v6 = 0;
  }

  return (NSArray *)v6;
}

- (VNDetectHumanBodyPose3DRequest)initWithFrameAnalysisSpacing:(id *)a3 completionHandler:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)VNDetectHumanBodyPose3DRequest;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  objc_super v4 = [(VNStatefulRequest *)&v8 initWithFrameAnalysisSpacing:&v7 completionHandler:a4];
  unint64_t v5 = v4;
  if (v4) {
    [(VNDetectHumanBodyPose3DRequest *)v4 _initializeStateForRevision:[(VNRequest *)v4 resolvedRevision]];
  }
  return v5;
}

- (VNDetectHumanBodyPose3DRequest)initWithCompletionHandler:(VNRequestCompletionHandler)completionHandler
{
  long long v4 = *MEMORY[0x1E4F1FA48];
  uint64_t v5 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  return [(VNDetectHumanBodyPose3DRequest *)self initWithFrameAnalysisSpacing:&v4 completionHandler:completionHandler];
}

- (VNDetectHumanBodyPose3DRequest)init
{
  return [(VNDetectHumanBodyPose3DRequest *)self initWithCompletionHandler:0];
}

- (void)_initializeStateForRevision:(unint64_t)a3
{
  self->_bodyPosePipelineWrapper = objc_alloc_init(VNABPKPipelineWrapper);

  MEMORY[0x1F41817F8]();
}

+ (id)_supportedJointsGroupsNamesRevision1
{
  if (_supportedJointsGroupsNamesRevision1_onceToken != -1) {
    dispatch_once(&_supportedJointsGroupsNamesRevision1_onceToken, &__block_literal_global_29);
  }
  v2 = (void *)_supportedJointsGroupsNamesRevision1_supportedJointsGroupsNamesRevision1;

  return v2;
}

void __70__VNDetectHumanBodyPose3DRequest__supportedJointsGroupsNamesRevision1__block_invoke()
{
  v2[7] = *MEMORY[0x1E4F143B8];
  v2[0] = @"human_joint_group_head_3D";
  v2[1] = @"human_joint_group_left_arm_3D";
  v2[2] = @"human_joint_group_right_arm_3D";
  v2[3] = @"human_joint_group_torso_3D";
  v2[4] = @"human_joint_group_left_leg_3D";
  v2[5] = @"human_joint_group_right_leg_3D";
  v2[6] = @"VNIPOAll";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:7];
  v1 = (void *)_supportedJointsGroupsNamesRevision1_supportedJointsGroupsNamesRevision1;
  _supportedJointsGroupsNamesRevision1_supportedJointsGroupsNamesRevision1 = v0;
}

+ (id)_supportedJointNamesRevision1
{
  if (_supportedJointNamesRevision1_onceToken != -1) {
    dispatch_once(&_supportedJointNamesRevision1_onceToken, &__block_literal_global_8239);
  }
  v2 = (void *)_supportedJointNamesRevision1_supportedJointNamesRevision1;

  return v2;
}

void __63__VNDetectHumanBodyPose3DRequest__supportedJointNamesRevision1__block_invoke()
{
  v2[17] = *MEMORY[0x1E4F143B8];
  v2[0] = @"human_top_head_3D";
  v2[1] = @"human_center_head_3D";
  v2[2] = @"human_center_shoulder_3D";
  v2[3] = @"human_left_shoulder_3D";
  v2[4] = @"human_right_shoulder_3D";
  v2[5] = @"human_spine_3D";
  v2[6] = @"human_left_elbow_3D";
  v2[7] = @"human_right_elbow_3D";
  void v2[8] = @"human_left_wrist_3D";
  v2[9] = @"human_right_wrist_3D";
  v2[10] = @"human_root_3D";
  v2[11] = @"human_left_hip_3D";
  v2[12] = @"human_right_hip_3D";
  v2[13] = @"human_left_knee_3D";
  v2[14] = @"human_right_knee_3D";
  v2[15] = @"human_left_ankle_3D";
  v2[16] = @"human_right_ankle_3D";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:17];
  v1 = (void *)_supportedJointNamesRevision1_supportedJointNamesRevision1;
  _supportedJointNamesRevision1_supportedJointNamesRevision1 = v0;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&revisionAvailability_ourRevisionAvailability_8248;
}

@end