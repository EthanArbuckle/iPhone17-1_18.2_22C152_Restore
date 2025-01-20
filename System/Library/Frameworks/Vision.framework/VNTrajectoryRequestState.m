@interface VNTrajectoryRequestState
- (VNTrajectoryRequestState)init;
- (unint64_t)targetImageDimensionForContourDetection;
- (void)setTargetImageDimensionForContourDetection:(unint64_t)a3;
@end

@implementation VNTrajectoryRequestState

- (void)setTargetImageDimensionForContourDetection:(unint64_t)a3
{
  self->_targetImageDimensionForContourDetection = a3;
}

- (unint64_t)targetImageDimensionForContourDetection
{
  return self->_targetImageDimensionForContourDetection;
}

- (VNTrajectoryRequestState)init
{
  self->_targetImageDimensionForContourDetection = 320;
  v3.receiver = self;
  v3.super_class = (Class)VNTrajectoryRequestState;
  return [(VNTrajectoryRequestState *)&v3 init];
}

@end