@interface VNDetectFaceGazeRequestConfiguration
- (BOOL)resolveSomewhereElseDirection;
- (VNDetectFaceGazeRequestConfiguration)initWithRequestClass:(Class)a3;
- (float)commonGazeLocationRadius;
- (float)gazeHeatMapThreshold;
- (float)minimumFaceDimension;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCommonGazeLocationRadius:(float)a3;
- (void)setGazeHeatMapThreshold:(float)a3;
- (void)setMinimumFaceDimension:(float)a3;
- (void)setResolveSomewhereElseDirection:(BOOL)a3;
@end

@implementation VNDetectFaceGazeRequestConfiguration

- (void)setResolveSomewhereElseDirection:(BOOL)a3
{
  self->_resolveSomewhereElseDirection = a3;
}

- (BOOL)resolveSomewhereElseDirection
{
  return self->_resolveSomewhereElseDirection;
}

- (void)setCommonGazeLocationRadius:(float)a3
{
  self->_commonGazeLocationRadius = a3;
}

- (float)commonGazeLocationRadius
{
  return self->_commonGazeLocationRadius;
}

- (void)setMinimumFaceDimension:(float)a3
{
  self->_minimumFaceDimension = a3;
}

- (float)minimumFaceDimension
{
  return self->_minimumFaceDimension;
}

- (void)setGazeHeatMapThreshold:(float)a3
{
  self->_gazeHeatMapThreshold = a3;
}

- (float)gazeHeatMapThreshold
{
  return self->_gazeHeatMapThreshold;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VNDetectFaceGazeRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v10 copyWithZone:a3];
  v6 = v4;
  if (v4)
  {
    *(float *)&double v5 = self->_gazeHeatMapThreshold;
    [v4 setGazeHeatMapThreshold:v5];
    *(float *)&double v7 = self->_minimumFaceDimension;
    [v6 setMinimumFaceDimension:v7];
    *(float *)&double v8 = self->_commonGazeLocationRadius;
    [v6 setCommonGazeLocationRadius:v8];
    [v6 setResolveSomewhereElseDirection:self->_resolveSomewhereElseDirection];
  }
  return v6;
}

- (VNDetectFaceGazeRequestConfiguration)initWithRequestClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNDetectFaceGazeRequestConfiguration;
  result = [(VNImageBasedRequestConfiguration *)&v4 initWithRequestClass:a3];
  if (result)
  {
    result->_gazeHeatMapThreshold = 0.2;
    result->_minimumFaceDimension = 0.03;
    result->_commonGazeLocationRadius = 0.01;
    result->_resolveSomewhereElseDirection = 1;
  }
  return result;
}

@end