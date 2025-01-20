@interface VNDetectTrajectoriesRequestConfiguration
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetFrameTime;
- (VNDetectTrajectoriesRequestConfiguration)initWithRequestClass:(Class)a3;
- (float)objectMaximumNormalizedRadius;
- (float)objectMinimumNormalizedRadius;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)trajectoryLength;
- (void)setObjectMaximumNormalizedRadius:(float)a3;
- (void)setObjectMinimumNormalizedRadius:(float)a3;
- (void)setTargetFrameTime:(id *)a3;
- (void)setTrajectoryLength:(int64_t)a3;
@end

@implementation VNDetectTrajectoriesRequestConfiguration

- (void)setTargetFrameTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_targetFrameTime.value = *(_OWORD *)&a3->var0;
  self->_targetFrameTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetFrameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[8];
  return self;
}

- (void)setObjectMaximumNormalizedRadius:(float)a3
{
  self->_objectMaximumNormalizedRadius = a3;
}

- (float)objectMaximumNormalizedRadius
{
  return self->_objectMaximumNormalizedRadius;
}

- (void)setObjectMinimumNormalizedRadius:(float)a3
{
  self->_objectMinimumNormalizedRadius = a3;
}

- (float)objectMinimumNormalizedRadius
{
  return self->_objectMinimumNormalizedRadius;
}

- (void)setTrajectoryLength:(int64_t)a3
{
  self->_trajectoryLength = a3;
}

- (int64_t)trajectoryLength
{
  return self->_trajectoryLength;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VNDetectTrajectoriesRequestConfiguration;
  id v4 = [(VNStatefulRequestConfiguration *)&v11 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    [v4 setTrajectoryLength:self->_trajectoryLength];
    *(float *)&double v6 = self->_objectMinimumNormalizedRadius;
    [v5 setObjectMinimumNormalizedRadius:v6];
    *(float *)&double v7 = self->_objectMaximumNormalizedRadius;
    [v5 setObjectMaximumNormalizedRadius:v7];
    long long v9 = *(_OWORD *)&self->_targetFrameTime.value;
    int64_t epoch = self->_targetFrameTime.epoch;
    [v5 setTargetFrameTime:&v9];
  }
  return v5;
}

- (VNDetectTrajectoriesRequestConfiguration)initWithRequestClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNDetectTrajectoriesRequestConfiguration;
  result = [(VNStatefulRequestConfiguration *)&v4 initWithRequestClass:a3];
  if (result)
  {
    result->_objectMinimumNormalizedRadius = 0.0;
    result->_objectMaximumNormalizedRadius = 1.0;
  }
  return result;
}

@end