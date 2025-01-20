@interface VNDetectHumanHandPoseRequestConfiguration
- (VNDetectHumanHandPoseRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)maximumHandCount;
- (void)setMaximumHandCount:(unint64_t)a3;
@end

@implementation VNDetectHumanHandPoseRequestConfiguration

- (void)setMaximumHandCount:(unint64_t)a3
{
  self->_maximumHandCount = a3;
}

- (unint64_t)maximumHandCount
{
  return self->_maximumHandCount;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNDetectHumanHandPoseRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4) {
    [v4 setMaximumHandCount:self->_maximumHandCount];
  }
  return v5;
}

- (VNDetectHumanHandPoseRequestConfiguration)initWithRequestClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNDetectHumanHandPoseRequestConfiguration;
  result = [(VNImageBasedRequestConfiguration *)&v4 initWithRequestClass:a3];
  if (result) {
    result->_maximumHandCount = 2;
  }
  return result;
}

@end