@interface VNHumanBodyPoseObservation
- (NSDictionary)recognizedPointsForJointsGroupName:(VNHumanBodyPoseObservationJointsGroupName)jointsGroupName error:(NSError *)error;
- (VNRecognizedPoint)recognizedPointForJointName:(VNHumanBodyPoseObservationJointName)jointName error:(NSError *)error;
- (id)leftHand;
- (id)rightHand;
- (void)setLeftHand:(id)a3;
- (void)setRightHand:(id)a3;
@end

@implementation VNHumanBodyPoseObservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightHand, 0);

  objc_storeStrong((id *)&self->_leftHand, 0);
}

- (id)rightHand
{
  return self->_rightHand;
}

- (id)leftHand
{
  return self->_leftHand;
}

- (void)setRightHand:(id)a3
{
}

- (void)setLeftHand:(id)a3
{
}

- (NSDictionary)recognizedPointsForJointsGroupName:(VNHumanBodyPoseObservationJointsGroupName)jointsGroupName error:(NSError *)error
{
  v4 = [(VNRecognizedPointsObservation *)self recognizedPointsForGroupKey:jointsGroupName error:error];

  return (NSDictionary *)v4;
}

- (VNRecognizedPoint)recognizedPointForJointName:(VNHumanBodyPoseObservationJointName)jointName error:(NSError *)error
{
  v4 = [(VNRecognizedPointsObservation *)self recognizedPointForKey:jointName error:error];

  return (VNRecognizedPoint *)v4;
}

@end