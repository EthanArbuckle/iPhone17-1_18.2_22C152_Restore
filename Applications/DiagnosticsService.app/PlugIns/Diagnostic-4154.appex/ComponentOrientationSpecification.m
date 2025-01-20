@interface ComponentOrientationSpecification
- (float)degreesShiftRangeThreshold;
- (float)lowerBoundOffsetThresholdX;
- (float)lowerBoundOffsetThresholdY;
- (float)lowerBoundOffsetThresholdZ;
- (float)upperBoundOffsetThresholdX;
- (float)upperBoundOffsetThresholdY;
- (float)upperBoundOffsetThresholdZ;
- (float)zeroRangeThreshold;
- (void)setDegreesShiftRangeThreshold:(float)a3;
- (void)setLowerBoundOffsetThresholdX:(float)a3;
- (void)setLowerBoundOffsetThresholdY:(float)a3;
- (void)setLowerBoundOffsetThresholdZ:(float)a3;
- (void)setUpperBoundOffsetThresholdX:(float)a3;
- (void)setUpperBoundOffsetThresholdY:(float)a3;
- (void)setUpperBoundOffsetThresholdZ:(float)a3;
- (void)setZeroRangeThreshold:(float)a3;
@end

@implementation ComponentOrientationSpecification

- (float)lowerBoundOffsetThresholdX
{
  return self->_lowerBoundOffsetThresholdX;
}

- (void)setLowerBoundOffsetThresholdX:(float)a3
{
  self->_lowerBoundOffsetThresholdX = a3;
}

- (float)upperBoundOffsetThresholdX
{
  return self->_upperBoundOffsetThresholdX;
}

- (void)setUpperBoundOffsetThresholdX:(float)a3
{
  self->_upperBoundOffsetThresholdX = a3;
}

- (float)lowerBoundOffsetThresholdY
{
  return self->_lowerBoundOffsetThresholdY;
}

- (void)setLowerBoundOffsetThresholdY:(float)a3
{
  self->_lowerBoundOffsetThresholdY = a3;
}

- (float)upperBoundOffsetThresholdY
{
  return self->_upperBoundOffsetThresholdY;
}

- (void)setUpperBoundOffsetThresholdY:(float)a3
{
  self->_upperBoundOffsetThresholdY = a3;
}

- (float)lowerBoundOffsetThresholdZ
{
  return self->_lowerBoundOffsetThresholdZ;
}

- (void)setLowerBoundOffsetThresholdZ:(float)a3
{
  self->_lowerBoundOffsetThresholdZ = a3;
}

- (float)upperBoundOffsetThresholdZ
{
  return self->_upperBoundOffsetThresholdZ;
}

- (void)setUpperBoundOffsetThresholdZ:(float)a3
{
  self->_upperBoundOffsetThresholdZ = a3;
}

- (float)zeroRangeThreshold
{
  return self->_zeroRangeThreshold;
}

- (void)setZeroRangeThreshold:(float)a3
{
  self->_zeroRangeThreshold = a3;
}

- (float)degreesShiftRangeThreshold
{
  return self->_degreesShiftRangeThreshold;
}

- (void)setDegreesShiftRangeThreshold:(float)a3
{
  self->_degreesShiftRangeThreshold = a3;
}

@end