@interface ADJasperPointCloudFilterParameters
+ (id)emptyFilter;
- (ADJasperPointCloudFilterParameters)init;
- (float)confidenceThreshold;
- (float)maxDistance;
- (float)minDistance;
- (float)shortRangeConfidenceThreshold;
- (float)shortRangeDepthThreshold;
- (unint64_t)bankIDMask;
- (unint64_t)duplicateProjectedSpotsMode;
- (unint64_t)echoMode;
- (void)setBankIDMask:(unint64_t)a3;
- (void)setConfidenceThreshold:(float)a3;
- (void)setDuplicateProjectedSpotsMode:(unint64_t)a3;
- (void)setEchoMode:(unint64_t)a3;
- (void)setMaxDistance:(float)a3;
- (void)setMinDistance:(float)a3;
- (void)setShortRangeConfidenceThreshold:(float)a3;
- (void)setShortRangeDepthThreshold:(float)a3;
@end

@implementation ADJasperPointCloudFilterParameters

- (void)setEchoMode:(unint64_t)a3
{
  self->_echoMode = a3;
}

- (void)setMinDistance:(float)a3
{
  self->_minDistance = a3;
}

- (void)setMaxDistance:(float)a3
{
  self->_maxDistance = a3;
}

- (void)setConfidenceThreshold:(float)a3
{
  self->_confidenceThreshold = a3;
}

- (ADJasperPointCloudFilterParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)ADJasperPointCloudFilterParameters;
  result = [(ADJasperPointCloudFilterParameters *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_confidenceThreshold = xmmword_247F24620;
    result->_shortRangeConfidenceThreshold = 0.75;
    *(_OWORD *)&result->_echoMode = xmmword_247F24630;
    result->_duplicateProjectedSpotsMode = 0;
  }
  return result;
}

- (void)setDuplicateProjectedSpotsMode:(unint64_t)a3
{
  self->_duplicateProjectedSpotsMode = a3;
}

- (unint64_t)duplicateProjectedSpotsMode
{
  return self->_duplicateProjectedSpotsMode;
}

- (void)setShortRangeConfidenceThreshold:(float)a3
{
  self->_shortRangeConfidenceThreshold = a3;
}

- (float)shortRangeConfidenceThreshold
{
  return self->_shortRangeConfidenceThreshold;
}

- (void)setShortRangeDepthThreshold:(float)a3
{
  self->_shortRangeDepthThreshold = a3;
}

- (float)shortRangeDepthThreshold
{
  return self->_shortRangeDepthThreshold;
}

- (float)maxDistance
{
  return self->_maxDistance;
}

- (float)minDistance
{
  return self->_minDistance;
}

- (float)confidenceThreshold
{
  return self->_confidenceThreshold;
}

- (void)setBankIDMask:(unint64_t)a3
{
  self->_bankIDMask = a3;
}

- (unint64_t)bankIDMask
{
  return self->_bankIDMask;
}

- (unint64_t)echoMode
{
  return self->_echoMode;
}

+ (id)emptyFilter
{
  v2 = objc_opt_new();
  [v2 setEchoMode:3];
  [v2 setConfidenceThreshold:0.0];
  [v2 setMinDistance:0.0];
  LODWORD(v3) = 2139095039;
  [v2 setMaxDistance:v3];
  [v2 setShortRangeDepthThreshold:0.0];
  [v2 setShortRangeConfidenceThreshold:0.0];
  [v2 setBankIDMask:0xFFFFFFFFLL];
  [v2 setDuplicateProjectedSpotsMode:0];

  return v2;
}

@end