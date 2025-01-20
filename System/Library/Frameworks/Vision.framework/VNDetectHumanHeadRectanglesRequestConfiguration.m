@interface VNDetectHumanHeadRectanglesRequestConfiguration
- (NSNumber)precisionRecallThresholdOverride;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setPrecisionRecallThresholdOverride:(id)a3;
@end

@implementation VNDetectHumanHeadRectanglesRequestConfiguration

- (void).cxx_destruct
{
}

- (void)setPrecisionRecallThresholdOverride:(id)a3
{
}

- (NSNumber)precisionRecallThresholdOverride
{
  return self->_precisionRecallThresholdOverride;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNDetectHumanHeadRectanglesRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4) {
    [v4 setPrecisionRecallThresholdOverride:self->_precisionRecallThresholdOverride];
  }
  return v5;
}

@end