@interface VNDetectAnimalBodyPoseRequest
+ (Class)configurationClass;
+ (const)revisionAvailability;
+ (id)_supportedJointNamesRevision1;
+ (id)_supportedJointsGroupsNamesRevision1;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (NSArray)supportedJointNamesAndReturnError:(NSError *)error;
- (NSArray)supportedJointsGroupNamesAndReturnError:(NSError *)error;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
@end

@implementation VNDetectAnimalBodyPoseRequest

+ (id)_supportedJointsGroupsNamesRevision1
{
  if (+[VNDetectAnimalBodyPoseRequest _supportedJointsGroupsNamesRevision1]::onceToken != -1) {
    dispatch_once(&+[VNDetectAnimalBodyPoseRequest _supportedJointsGroupsNamesRevision1]::onceToken, &__block_literal_global_29_22720);
  }
  v2 = (void *)+[VNDetectAnimalBodyPoseRequest _supportedJointsGroupsNamesRevision1]::supportedJointsGroupsNamesRevision1;

  return v2;
}

void __69__VNDetectAnimalBodyPoseRequest__supportedJointsGroupsNamesRevision1__block_invoke()
{
  v2[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"VNIPOAll";
  v2[1] = @"animal_joint_group_head";
  v2[2] = @"animal_joint_group_trunk";
  v2[3] = @"animal_joint_group_gorelegs";
  v2[4] = @"animal_joint_group_hindlegs";
  v2[5] = @"animal_joint_group_tail";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:6];
  v1 = (void *)+[VNDetectAnimalBodyPoseRequest _supportedJointsGroupsNamesRevision1]::supportedJointsGroupsNamesRevision1;
  +[VNDetectAnimalBodyPoseRequest _supportedJointsGroupsNamesRevision1]::supportedJointsGroupsNamesRevision1 = v0;
}

+ (id)_supportedJointNamesRevision1
{
  if (+[VNDetectAnimalBodyPoseRequest _supportedJointNamesRevision1]::onceToken != -1) {
    dispatch_once(&+[VNDetectAnimalBodyPoseRequest _supportedJointNamesRevision1]::onceToken, &__block_literal_global_22723);
  }
  v2 = (void *)+[VNDetectAnimalBodyPoseRequest _supportedJointNamesRevision1]::supportedJointNamesRevision1;

  return v2;
}

void __62__VNDetectAnimalBodyPoseRequest__supportedJointNamesRevision1__block_invoke()
{
  v2[25] = *MEMORY[0x1E4F143B8];
  v2[0] = @"animal_joint_left_ear_top";
  v2[1] = @"animal_joint_right_ear_top";
  v2[2] = @"animal_joint_left_ear_middle";
  v2[3] = @"animal_joint_right_ear_middle";
  v2[4] = @"animal_joint_left_ear_bottom";
  v2[5] = @"animal_joint_right_ear_bottom";
  v2[6] = @"animal_joint_left_eye";
  void v2[7] = @"animal_joint_right_eye";
  v2[8] = @"animal_joint_nose";
  v2[9] = @"animal_joint_heck";
  v2[10] = @"animal_joint_left_front_elbow";
  v2[11] = @"animal_joint_right_front_elbow";
  v2[12] = @"animal_joint_left_front_knee";
  v2[13] = @"animal_joint_right_front_knee";
  v2[14] = @"animal_joint_left_front_paw";
  v2[15] = @"animal_joint_right_front_paw";
  v2[16] = @"animal_joint_left_back_elbow";
  v2[17] = @"animal_joint_right_back_elbow";
  v2[18] = @"animal_joint_left_back_knee";
  v2[19] = @"animal_joint_right_back_knee";
  v2[20] = @"animal_joint_left_back_paw";
  v2[21] = @"animal_joint_right_back_paw";
  v2[22] = @"animal_joint_tail_top";
  v2[23] = @"animal_joint_tail_middle";
  v2[24] = @"animal_joint_tail_bottom";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:25];
  v1 = (void *)+[VNDetectAnimalBodyPoseRequest _supportedJointNamesRevision1]::supportedJointNamesRevision1;
  +[VNDetectAnimalBodyPoseRequest _supportedJointNamesRevision1]::supportedJointNamesRevision1 = v0;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [v8 imageBufferAndReturnError:a5];
  if (v9)
  {
    v10 = [v8 session];
    id v18 = 0;
    v11 = [(VNRequest *)self applicableDetectorAndOptions:&v18 forRevision:a3 loadedInSession:v10 error:a5];
    id v12 = v18;
    if (v11)
    {
      v19[0] = v9;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      [v12 setObject:v13 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

      uint64_t v14 = [v8 qosClass];
      [(VNImageBasedRequest *)self regionOfInterest];
      v15 = objc_msgSend(v11, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v14, v12, self, a5, 0);
      BOOL v16 = v15 != 0;
      if (v15) {
        [(VNRequest *)self setResults:v15];
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
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

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 1)
  {
    v4 = @"VNAnimalBodyPoseDetectorType";
    unint64_t v5 = @"VNAnimalBodyPoseDetectorType";
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNDetectAnimalBodyPoseRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end